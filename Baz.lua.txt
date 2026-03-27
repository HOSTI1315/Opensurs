-- =========================
local version = "2.9.8"
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

-- ====================== SERVICE =====================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local player = Players.LocalPlayer

-- ===================== SETTINGS =====================
local SelectedCode = nil
local SelectedBait = nil
local SelectedFood = nil
local SelectedQuest = nil

local autoHatch = false
local AutoEquip = false
local AutoPotion = false
local autoCollectDino = false
local AutoBuyConveyor = false
local AutoDinoEnabled = false
local AutoBaitEnabled = false
local AutoFoodEnabled = false
local AutoFishEnabled = false
local AutoSpinEnabled = false
local AutoBuyEggEnabled = false
local AutoCollectEnabled = false

local SelectedPotions = {}
local QuestList = {"All"}
for i = 1, 20 do
    table.insert(QuestList, "Task_"..i)
end
local BuyIndex = 1
local EquipIndex = 1
local SpinCounts = {1, 3, 10}
local SelectedCount = 1

local FoodList = {
    "Strawberry","Blueberry","Watermelon","Apple","Orange",
    "Corn","Banana","Grape","Pear","PineApple","Dargon Fruit",
    "Gold Mango","Bloodstone Cycad","Colossal Pinecone","Volt Ginkgo",
    "Deepsea Pearl Fruit","Durian"
}
local eggTypes = {
    "BasicEgg","RareEgg","SuperRareEgg","EpicEgg","LegendEgg","HyperEgg",
    "BowserEgg","VoidEgg","CornEgg","BoneDragonEgg","DemonEgg","PrismaticEgg","UltraEgg"
}
local PotionList = {"Potion_Coin","Potion_Luck","Potion_Hatch","Potion_3in1"}
local BaitList = { "FishingBait1", "FishingBait2", "FishingBait3" }
local CodeList = {
    "CFJXEH4M8K5",
    "DelayGift",
    "60KCCU919",
    "50KCCU0912",
    "SeasonOne",
    "ZooFish829",
    "FIXERROR819",
    "MagicFruit",
    "WeekendEvent89",
    "BugFixes",
    "U2CA518SC5",
    "X2CA821BA3",
    "55PA21N8y2"
}

-- ====================== WINDOW ======================
local Window = WindUI:CreateWindow({
    Title = "DYHUB",
    IconThemed = true,
    Icon = "rbxassetid://104487529937663",
    Author = "Build a Zoo | Premium Version",
    Folder = "DYHUB_BAZ_ESP",
    Size = UDim2.fromOffset(550, 380),
    Transparent = true,
    Theme = "Dark",
    BackgroundImageTransparency = 0.8,
    HasOutline = false,
    HideSearchBar = true,
    ScrollBarEnabled = true,
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
    Color = ColorSequence.new(Color3.fromRGB(30,30,30), Color3.fromRGB(255,255,255)),
    Draggable = true,
})

-- ====================== TABS ======================
local InfoTab = Window:Tab({ Title = "Information", Icon = "info" })
local MainDivider = Window:Divider()
local Main = Window:Tab({ Title = "Main", Icon = "rocket" })
local Auto = Window:Tab({ Title = "Shop", Icon = "shopping-cart" })
local Egg = Window:Tab({ Title = "Egg", Icon = "egg" })
local Event = Window:Tab({ Title = "Event", Icon = "party-popper" })
local Buff = Window:Tab({ Title = "Buff", Icon = "biceps-flexed" })
local Codes = Window:Tab({ Title = "Codes", Icon = "gift" })

Window:SelectTab(1)

-- ====================== AUTO FARM ======================
Auto:Section({ Title = "Buy Conveyor", Icon = "package" })

Auto:Dropdown({
    Title = "Select Conveyor to Buy (1-9)",
    Values = {"1","2","3","4","5","6","7","8","9"},
    Multi = false,
    Callback = function(value)
        BuyIndex = tonumber(value)
    end
})

Auto:Toggle({
    Title = "Buy Conveyor",
    Default = false,
    Callback = function(state)
        AutoBuyConveyor = state
        if state then
            task.spawn(function()
                while AutoBuyConveyor do
                    local args = {"Upgrade", BuyIndex}
                    ReplicatedStorage.Remote.ConveyorRE:FireServer(unpack(args))
                    task.wait(2)
                end
            end)
        end
    end
})

Auto:Section({ Title = "Equip Conveyor", Icon = "layout-grid" })
Auto:Dropdown({
    Title = "Select Conveyor to Equip (1-9)",
    Values = {"1","2","3","4","5","6","7","8","9"},
    Multi = false,
    Callback = function(value)
        EquipIndex = tonumber(value)
    end
})

Auto:Toggle({
    Title = "Equip Conveyor",
    Default = false,
    Callback = function(state)
        AutoEquip = state
        if state then
            task.spawn(function()
                while AutoEquip do
                    local args = {"Switch", EquipIndex}
                    ReplicatedStorage.Remote.ConveyorRE:FireServer(unpack(args))
                    task.wait(1.5)
                end
            end)
        end
    end
})

-- ====================== POTIONS ======================
Buff:Section({ Title = "Potion", Icon = "flask-conical" })

Buff:Dropdown({
    Title = "Select Potion(s)",
    Values = PotionList,
    Multi = true,
    Callback = function(values)
        SelectedPotions = values
    end
})

Buff:Toggle({
    Title = "Auto Use Selected Potions",
    Default = false,
    Callback = function(state)
        AutoPotion = state
        if state then
            task.spawn(function()
                while AutoPotion do
                    for _,potion in pairs(SelectedPotions) do
                        local args = {"UsePotion", potion}
                        ReplicatedStorage.Remote.ShopRE:FireServer(unpack(args))
                        task.wait(1)
                    end
                    task.wait(5)
                end
            end)
        end
    end
})

-- ====================== CODES ======================
Codes:Section({ Title = "Redeem Codes", Icon = "gift" })

Codes:Dropdown({
    Title = "Select Code",
    Values = CodeList,
    Multi = false,
    Callback = function(value)
        SelectedCode = value
    end
})

Codes:Button({
    Title = "Redeem Selected Code",
    Callback = function()
        if SelectedCode then
            local args = {{event = "usecode", code = SelectedCode}}
            ReplicatedStorage.Remote.RedemptionCodeRE:FireServer(unpack(args))
        end
    end
})

Codes:Button({
    Title = "Redeem All Codes",
    Callback = function()
        for _,code in ipairs(CodeList) do
            local args = {{event = "usecode", code = code}}
            ReplicatedStorage.Remote.RedemptionCodeRE:FireServer(unpack(args))
            task.wait(0.5)
        end
    end
})

-- ======================
Auto:Section({ Title = "Buy Bait", Icon = "fish" })

Auto:Dropdown({
    Title = "Select Bait",
    Values = BaitList,
    Multi = false,
    Callback = function(value)
        SelectedBait = value
    end
})

Auto:Toggle({
    Title = "Buy Bait",
    Default = false,
    Callback = function(state)
        AutoBaitEnabled = state
        task.spawn(function()
            while AutoBaitEnabled do
                if SelectedBait then
                    local args = {"buy", SelectedBait}
                    ReplicatedStorage.Remote.FishingRE:FireServer(unpack(args))
                end
                task.wait(0.5)
            end
        end)
    end
})

Auto:Section({ Title = "Buy Food", Icon = "shopping-bag" })

Auto:Dropdown({
    Title = "Select Food",
    Values = FoodList,
    Multi = false,
    Callback = function(value)
        SelectedFood = value
    end
})

Auto:Toggle({
    Title = "Buy Food",
    Default = false,
    Callback = function(state)
        AutoFoodEnabled = state
        task.spawn(function()
            while AutoFoodEnabled do
                if SelectedFood then
                    local args = {SelectedFood}
                    ReplicatedStorage.Remote.FoodStoreRE:FireServer(unpack(args))
                end
                task.wait(0.5)
            end
        end)
    end
})

-- ====================== COLLECT ALL ======================
Main:Section({ Title = "Collect Coin", Icon = "egg" })

Main:Toggle({
    Title = "Auto Collect Coin",
    Default = false,
    Callback = function(state)
        AutoCollectEnabled = state
        if state then
            spawn(function()
                while AutoCollectEnabled do
                    local petsFolder = workspace:WaitForChild("Pets")
                    local args = {"Claim"}

                    for _, pet in pairs(petsFolder:GetChildren()) do
                        if pet:FindFirstChild("RootPart") and pet.RootPart:FindFirstChild("RE") then
                            pcall(function()
                                pet.RootPart.RE:FireServer(unpack(args))
                            end)
                        end
                    end

                    task.wait(0.05)
                end
            end)
        end
    end
})

-- ====================== AUTO BUY EGG ======================
Egg:Section({ Title = "Buy Eggs", Icon = "egg" })

local buyEggList = {}
for _, egg in ipairs(eggTypes) do
    buyEggList[egg] = false
end

local function getEggType(eggModel)
    local root = eggModel:FindFirstChild("RootPart")
    local eggType = root and (root:GetAttribute("Type") or root:GetAttribute("EggType"))
    eggType = eggType or eggModel:GetAttribute("Type") or eggModel:GetAttribute("EggType")
    if not eggType then
        for _, child in ipairs(eggModel:GetChildren()) do
            if child:IsA("StringValue") and (child.Name == "Type" or child.Name == "EggType") then
                eggType = child.Value
                break
            end
        end
    end
    return eggType
end

Egg:Dropdown({
    Title = "Select Eggs",
    Values = eggTypes,
    Multi = true,
    Callback = function(values)
        for _, egg in ipairs(eggTypes) do buyEggList[egg] = false end
        for _, v in ipairs(values) do buyEggList[v] = true end
    end
})

Egg:Toggle({
    Title = "Auto Buy Eggs",
    Default = false,
    Callback = function(state)
        AutoBuyEggEnabled = state
        if state then
            spawn(function()
                while AutoBuyEggEnabled do
                    task.wait(0.15 + math.random(0, 300) / 1000)

                    local anyActive = false
                    for _, v in pairs(buyEggList) do
                        if v then anyActive = true break end
                    end
                    if not anyActive then task.wait(1) continue end

                    local art = Workspace:FindFirstChild("Art")
                    if not art then task.wait(1) continue end

                    local okRemote, characterRE = pcall(function()
                        return ReplicatedStorage:WaitForChild("Remote", 9e9):WaitForChild("CharacterRE", 9e9)
                    end)
                    if not okRemote or not characterRE then task.wait(1) continue end

                    for _, island in ipairs(art:GetChildren()) do
                        if island.Name:match("^Island_%d+$") then
                            local env = island:FindFirstChild("ENV")
                            if not env then continue end
                            local conveyor = env:FindFirstChild("Conveyor")
                            if not conveyor then continue end

                            for _, conveyorX in ipairs(conveyor:GetChildren()) do
                                if conveyorX.Name:match("^Conveyor%d+$") then
                                    local belt = conveyorX:FindFirstChild("Belt")
                                    if not belt then continue end

                                    local eggCount = 0
                                    local maxEggsPerCycle = 50
                                    for _, eggModel in ipairs(belt:GetChildren()) do
                                        if eggCount >= maxEggsPerCycle then break end

                                        local eggType = getEggType(eggModel)
                                        if eggType and buyEggList[eggType] then
                                            local root = eggModel:FindFirstChild("RootPart")
                                            local uidVal = (root and root:GetAttribute("UID")) or eggModel:GetAttribute("UID") or tostring(eggModel.Name)
                                            pcall(function()
                                                characterRE:FireServer("BuyEgg", uidVal)
                                            end)
                                        end
                                        eggCount = eggCount + 1
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
})

Egg:Section({ Title = "Hatch Eggs", Icon = "clock" })

Egg:Toggle({
    Title = "Auto Hatch Eggs",
    Default = false,
    Callback = function(state)
        autoHatch = state
        if state then
            spawn(function()
                while autoHatch do
                    task.wait(0.5)

                    local art = workspace:FindFirstChild("Art")
                    if not art then task.wait(1) continue end

                    for _, island in ipairs(art:GetChildren()) do
                        if island.Name:match("^Island_%d+$") then
                            local env = island:FindFirstChild("ENV")
                            if not env then continue end
                            local conveyor = env:FindFirstChild("Conveyor")
                            if not conveyor then continue end

                            for _, conveyorX in ipairs(conveyor:GetChildren()) do
                                if conveyorX.Name:match("^Conveyor%d+$") then
                                    local belt = conveyorX:FindFirstChild("Belt")
                                    if not belt then continue end

                                    for _, eggModel in ipairs(belt:GetChildren()) do
                                        local root = eggModel:FindFirstChild("RootPart")
                                        if not root then continue end

                                        local rf = root:FindFirstChild("RF")
                                        if rf and rf:IsA("RemoteFunction") then
                                            pcall(function()
                                                rf:InvokeServer("Hatch")
                                            end)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
})


Main:Section({ Title = "Fishing", Icon = "fish" })

Main:Toggle({
    Title = "Auto Reel",
    Default = false,
    Callback = function(state)
        AutoFishEnabled = state
        task.spawn(function()
            while AutoFishEnabled do
                local args = {"POUT",{SUC=1}}
                ReplicatedStorage.Remote.FishingRE:FireServer(unpack(args))
                task.wait(0.5)
            end
        end)
    end
})

Main:Section({ Title = "Lottery", Icon = "piggy-bank" })

Main:Dropdown({
    Title = "Select Spin Count",
    Values = SpinCounts,
    Multi = false,
    Callback = function(value)
        SelectedCount = value
    end
})

Main:Toggle({
    Title = "Auto Spin Lottery",
    Default = false,
    Callback = function(state)
        AutoSpinEnabled = state
        task.spawn(function()
            while AutoSpinEnabled do
                local args = {{event="lottery", count=SelectedCount}}
                ReplicatedStorage.Remote.LotteryRE:FireServer(unpack(args))
                task.wait(1)
            end
        end)
    end
})

Event:Section({ Title = "Event", Icon = "trophy" })

Event:Dropdown({
    Title = "Select Dino Quest",
    Values = QuestList,
    Multi = false,
    Callback = function(value)
        SelectedQuest = value
    end
})

Event:Toggle({
    Title = "Auto Claim Dino Quest",
    Default = false,
    Callback = function(state)
        AutoDinoEnabled = state
        task.spawn(function()
            while AutoDinoEnabled do
                if SelectedQuest then
                    if SelectedQuest == "All" then
                        for i = 1, 20 do
                            local args = {{event="claimreward", id="Task_"..i}}
                            ReplicatedStorage.Remote.DinoEventRE:FireServer(unpack(args))
                        end
                    else
                        local args = {{event="claimreward", id=SelectedQuest}}
                        ReplicatedStorage.Remote.DinoEventRE:FireServer(unpack(args))
                    end
                end
                task.wait(3)
            end
        end)
    end
})

Event:Toggle({
    Title = "Auto Collect Dino",
    Default = false,
    Callback = function(state)
        autoCollectDino = state
        if state then
            spawn(function()
                while autoCollectDino do
                    task.wait(1)

                    local ok, remote = pcall(function()
                        return ReplicatedStorage:WaitForChild("Remote", 9e9):WaitForChild("DinoEventRE", 9e9)
                    end)
                    if ok and remote then
                        local args = { { event = "onlinepack" } }
                        pcall(function()
                            remote:FireServer(unpack(args))
                        end)
                    end
                end
            end)
        end
    end
})

-- ====================== SELL ALL BUTTON ======================
Main:Section({ Title = "Feature All", Icon = "crown" })
Main:Button({
    Title = "Sell All Everything",
    Callback = function()
        local args = {"SellAll","All","All"}
        ReplicatedStorage.Remote.PetRE:FireServer(unpack(args))
    end
})
Main:Button({
    Title = "Pickup All Everything",
    Callback = function()
        local function collectAllPets()
            local petsFolder = workspace:FindFirstChild("Pets")
            if not petsFolder then return end

            local ok, remote = pcall(function()
                return ReplicatedStorage:WaitForChild("Remote", 9e9):WaitForChild("CharacterRE", 9e9)
            end)
            if not ok or not remote then return end

            for _, pet in ipairs(petsFolder:GetChildren()) do
                local uid = pet.Name
                local argsDel = { "Del", uid }
                pcall(function()
                    remote:FireServer(unpack(argsDel))
                end)
            end
        end

        collectAllPets()
    end
})

-- ======================= INFORMATION ========================
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
