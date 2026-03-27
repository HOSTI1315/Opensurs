-------------------------------------------
----- =======[ DZ v1 - WindUI Scaffold ]
-------------------------------------------

-------------------------------------------
----- =======[ SERVICES ]
-------------------------------------------
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

-------------------------------------------
----- =======[ CONTROLLERS & UTILITIES ]
-------------------------------------------
-- Helper safeRequire harus didefinisikan sebelum dipakai
local function safeRequire(pathTbl)
    local ptr = game:GetService("ReplicatedStorage")
    for _, seg in ipairs(pathTbl) do
        ptr = ptr:FindFirstChild(seg)
        if not ptr then return nil end
    end
    local ok, mod = pcall(require, ptr)
    return ok and mod or nil
end

local FishingController = safeRequire({"Controllers","FishingController"})
local AnimationController = safeRequire({"Controllers","AnimationController"})
local Replion = safeRequire({"Packages","Replion"}) or safeRequire({"Packages","replion"})
local ItemUtility = safeRequire({"Shared","ItemUtility"})

-- Net folder helper from Rayfield version
local function getNetFolder()
    local packages = ReplicatedStorage:WaitForChild("Packages", 10)
    if not packages then return nil end
    local index = packages:FindFirstChild("_Index")
    if index then
        for _, child in ipairs(index:GetChildren()) do
            if child.Name:match("^sleitnick_net@") then
                return child:FindFirstChild("net")
            end
        end
    end
    return ReplicatedStorage:FindFirstChild("net") or ReplicatedStorage:FindFirstChild("Net")
end

-------------------------------------------
----- =======[ STATE MANAGEMENT ]
-------------------------------------------
local state = {
    AutoFish = false,
    AutoFarm = false,
    AutoSell = false,
    AutoFavourite = false,
    PerfectCast = false,
    InfiniteJump = false,
    InfiniteOxygen = false,
    WalkSpeed = 20,
    AutoRejoin = false,
    LowGraphics = false,
    FPSCap = 0,
    StopAfterCatch = false,
    SellThreshold = 60,
    FavoriteTiers = { [4]=false, [5]=false, [6]=false, [7]=false }, -- Epic, Legendary, Mythic, Secret
    AutoTPEvent = false,
    AutoBuyWeather = false
}

-------------------------------------------
----- =======[ LOAD WINDUI ]
-------------------------------------------
local Wind
local function ensureWindUI()
    if Wind then return Wind end
    
    local Version = "1.6.45"
    local ok, ui = pcall(function()
        return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. Version .. "/main.lua"))()
    end)
    if not ok or not ui then
        ok, ui = pcall(function()
            return loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/main.lua"))()
        end)
    end
    if ok and ui then 
        Wind = ui
    end
    return Wind
end

-------------------------------------------
----- =======[ USER / SERVER INFO ]
-------------------------------------------
local function getUserInfo()
    local info = {}
    info.Username = player and player.Name or "Unknown"
    info.DisplayName = player and player.DisplayName or info.Username
    info.UserId = player and player.UserId or 0
    info.JobId = game.JobId
    info.PlaceId = game.PlaceId
    info.ExperienceName = (pcall(function() return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name end)) and (game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name) or "Fish It"
    info.PingMs = (pcall(function() return math.floor(RunService:GetNetworkPing() * 1000) end)) and math.floor(RunService:GetNetworkPing() * 1000) or -1
    return info
end

-------------------------------------------
----- =======[ AUTO SELL & FAVOURITE LOGIC ]
-------------------------------------------
-- Tier definitions for auto favourite
local tierList = {
    { Name = "Epic", Tier = 4 },
    { Name = "Legendary", Tier = 5 },
    { Name = "Mythic", Tier = 6 },
    { Name = "Secret", Tier = 7 }
}

local function startAutoFavourite()
    task.spawn(function()
        while state.AutoFavourite do
            pcall(function()
                if not Replion or not ItemUtility then return end
                local netFolder = getNetFolder()
                local favoriteRemote = netFolder and netFolder:FindFirstChild("RE/FavoriteItem")
                if not favoriteRemote then return end

                local DataReplion = Replion.Client:WaitReplion("Data")
                local items = DataReplion and DataReplion:Get({"Inventory","Items"})
                if type(items) ~= "table" then return end
                
                for _, item in ipairs(items) do
                    local base = ItemUtility:GetItemData(item.Id)
                    if base and base.Data and state.FavoriteTiers[base.Data.Tier] and not item.Favorited then
                        favoriteRemote:FireServer(item.UUID)
                        item.Favorited = true
                    end
                end
            end)
            task.wait(5)
        end
    end)
end

local function startAutoSell()
    task.spawn(function()
        while state.AutoSell do
            pcall(function()
                if not Replion then return end
                local DataReplion = Replion.Client:WaitReplion("Data")
                local items = DataReplion and DataReplion:Get({"Inventory","Items"})
                if type(items) ~= "table" then return end

                local unfavoritedCount = 0
                for _, item in ipairs(items) do
                    if not item.Favorited then
                        unfavoritedCount = unfavoritedCount + (item.Count or 1)
                    end
                end

                if unfavoritedCount >= state.SellThreshold then
                    local netFolder = getNetFolder()
                    if netFolder then
                        local sellFunc = netFolder:FindFirstChild("RF/SellAllItems")
                        if sellFunc then
                            task.spawn(sellFunc.InvokeServer, sellFunc)
                        end
                    end
                end
            end)
            task.wait(10)
        end
    end)
end

-------------------------------------------
----- =======[ AUTO FISH LOGIC ]
-------------------------------------------
-- Central config for tunable timings
local config = {
    autoFish = {
        cooldownTimeoutSeconds = 3,
        completionBursts = 30,
        completionBurstDelay = 0.025,
        interCycleDelay = 0.5,
        safetyTimeoutSeconds = 6,
    },
    autoFarm = {
        postTeleportWaitSeconds = 2.5,
    },
    weather = {
        baseCooldownSeconds = 30,
        perWeatherCooldownSeconds = {
            ["Storm"] = 45,
            ["Black Hole"] = 60,
        },
        pollIntervalSeconds = 1.0,
        preCheckDelaySeconds = 0.25,
        verifyDelaySeconds = 0.75,
        purchaseRetryCount = 2,
    },
    tpEvent = {
        pollIntervalSeconds = 3,
        resumeDelaySeconds = 1.2,
    },
    walk = {
        enforceOnRespawn = true,
    }
}
_G.autoFishLoop = nil
local isCasting = false
local function forceComplete(complete)
    pcall(function()
        if complete then for i = 1, 20 do complete:FireServer(); task.wait(0.05) end end
    end)
end
local function playCastAnim()
    pcall(function()
        if AnimationController and AnimationController.PlayAnimation then
            AnimationController:PlayAnimation("CastFromFullChargePosition1Hand")
        end
    end)
end

local function startAutoFish()
    if _G.autoFishLoop then task.cancel(_G.autoFishLoop); _G.autoFishLoop = nil end
    state.AutoFish = true
    state.StopAfterCatch = false
    _G.autoFishLoop = task.spawn(function()
        local net = getNetFolder(); if not net then return end
        local equipEvent = net:WaitForChild("RE/EquipToolFromHotbar")
        local chargeFunc = net:WaitForChild("RF/ChargeFishingRod")
        local startMini  = net:WaitForChild("RF/RequestFishingMinigameStarted")
        local complete   = net:WaitForChild("RE/FishingCompleted")

        while state.AutoFish or state.StopAfterCatch do
            local cycleStart = os.clock()
            isCasting = true
            
            -- Check cooldown
            if FishingController and FishingController.OnCooldown and FishingController:OnCooldown() then
                local cooldownWaitStart = os.clock()
                repeat
                    task.wait(0.2)
                    if os.clock() - cooldownWaitStart > config.autoFish.cooldownTimeoutSeconds then break end
                until not (FishingController:OnCooldown()) or not (state.AutoFish or state.StopAfterCatch)
            end
            if not state.AutoFish and not state.StopAfterCatch then break end

            -- Execute fishing cycle (with stronger preflight & fallbacks)
            pcall(function()
                -- Re-acquire remotes if any went nil
                if not equipEvent or not chargeFunc or not startMini or not complete then
                    net = getNetFolder(); if not net then return end
                    equipEvent = net:FindFirstChild("RE/EquipToolFromHotbar")
                    chargeFunc = net:FindFirstChild("RF/ChargeFishingRod")
                    startMini  = net:FindFirstChild("RF/RequestFishingMinigameStarted")
                    complete   = net:FindFirstChild("RE/FishingCompleted")
                    if not (equipEvent and chargeFunc and startMini and complete) then return end
                end

                -- Multiple equip attempts to ensure rod is ready
                equipEvent:FireServer(1)
                task.wait(0.02)
                equipEvent:FireServer(1)
                task.wait(0.02)

                -- Charge and start minigame
                pcall(function()
                    chargeFunc:InvokeServer(workspace:GetServerTimeNow())
                end)
                task.wait(0.02)
                pcall(function()
                    startMini:InvokeServer(-0.75, 1)
                end)

                -- Stronger completion spam to avoid stalls
                task.wait(0.04)
                for i = 1, config.autoFish.completionBursts do
                    complete:FireServer()
                    task.wait(config.autoFish.completionBurstDelay)
                end
            end)

            -- Wait between cycles (but allow graceful stop)
            local t = os.clock()
            while os.clock() - t < config.autoFish.interCycleDelay and (state.AutoFish or state.StopAfterCatch) do task.wait() end
            isCasting = false

            -- If graceful stop requested, break after completing this cycle
            if state.StopAfterCatch then break end

            -- Safety timeout
            if os.clock() - cycleStart > config.autoFish.safetyTimeoutSeconds then
                forceComplete(complete)
                isCasting = false
            end
        end
        state.AutoFish = false
        state.StopAfterCatch = false
        _G.autoFishLoop = nil
    end)
end

local function stopAutoFish()
    if isCasting then
        -- If currently casting, request graceful stop
        state.StopAfterCatch = true
    else
        -- If not casting, stop immediately
        if _G.autoFishLoop then task.cancel(_G.autoFishLoop); _G.autoFishLoop = nil end
        state.AutoFish = false
    end
end


-- Helpers to manage AutoFish state consistently
local function enableAutoFish()
    if not state.AutoFish then
        state.AutoFish = true
        startAutoFish()
    end
end

local function disableAutoFish()
    if state.AutoFish then
        stopAutoFish()
    end
end


-------------------------------------------
----- =======[ BUILD WINDOW ]
-------------------------------------------
local function buildWindow()
    local UI = ensureWindUI(); if not UI then warn("[DZv1] WindUI gagal dimuat."); return end
    local Window = UI:CreateWindow({
        Title = "DZZ - Fish It",
        Icon = "circle-check",
        Author = "developed by @dzzzet",
        Size = UDim2.fromOffset(600, 420),
        Transparent = true,
        Theme = "Dark",
        KeySystem = false,
        ScrollBarEnabled = true,
        HideSearchBar = true,
        User = { Enabled = true, Anonymous = false, Callback = function() end }
    })

    Window:EditOpenButton({ Title = "DZ v1", Icon = "circle-check", CornerRadius = UDim.new(0,16), StrokeThickness = 2, Color = ColorSequence.new(Color3.fromHex("9600FF"), Color3.fromHex("AEBAF8")), Draggable = true })
    Window:Tag({ Title = "V1 STABLE", Color = Color3.fromHex("#ffcc00") })
    UI:SetNotificationLower(true)
    pcall(function() UI:Notify({ Title = "DZ v1", Content = "Script loaded successfully", Duration = 4, Icon = "circle-check" }) end)


    -------------------------------------------
    ----- =======[ TAB & MENU ]
    -------------------------------------------

    -------------------------------------------
    ----- =======[ ALL TABS ]
    -------------------------------------------
    local Dev = Window:Tab({ Title = "Developer Info", Icon = "hard-drive" })
    local MainFeautures = Window:Tab({ Title = "Main Features", Icon = "toggle-right" })
    local AutoFavorite = Window:Tab({ Title = "Auto Favorite", Icon = "heart" })
    local Weathershop = Window:Tab({ Title = "Weather", Icon = "cloud-rain" })
    local Shop = Window:Tab({ Title = "Shop", Icon = "shopping-cart" })
    local Teleport = Window:Tab({ Title = "Teleport", Icon = "map" })
    local Player = Window:Tab({ Title = "Player", Icon = "users-round" })
    local SettingsMisc = Window:Tab({ Title = "Settings & Misc", Icon = "settings" })
    local Webhooksettings = Window:Tab({ Title = "Webhook", Icon = "webhook" })

    -- Set default tab to Developer Info on load
    pcall(function() Window:SetTab("Dev") end)


    -------------------------------------------
    ----- =======[ DEVELOPER / DISCORD INFO ]
    -------------------------------------------
    local InviteAPI = "https://discord.com/api/v10/invites/"
    local function LookupDiscordInvite(inviteCode)
        local url = InviteAPI .. inviteCode .. "?with_counts=true"
        local success, response = pcall(game.HttpGet, game, url)
        if success then
            local data = HttpService:JSONDecode(response)
            return {
                name = data.guild and data.guild.name or "Unknown",
                online = data.approximate_presence_count or 0,
                members = data.approximate_member_count or 0,
                icon = data.guild and data.guild.icon and ("https://cdn.discordapp.com/icons/"..data.guild.id.."/"..data.guild.icon..".png") or "",
            }
        end
        return nil
    end

    -- Ganti kode undangan sesuai kebutuhan Anda
    local inviteData = LookupDiscordInvite("sduVpDyB")
    if inviteData then
        Dev:Paragraph({
            Title = string.format("[DISCORD] %s", inviteData.name),
            Desc = string.format("Members: %d\nOnline: %d", inviteData.members, inviteData.online),
            Image = inviteData.icon,
            ImageSize = 50,
            Locked = true,
        })
    end

    -------------------------------------------
    ----- =======[ DEVELOPER / CREDITS ]
    -------------------------------------------
    Dev:Paragraph({ Title = "Credits", Desc = "UI: WindUI\nDev: @dzzzet", Locked = true })
    
    -------------------------------------------
    ----- =======[ WEATHER TAB ]
    -------------------------------------------
    Weathershop:Paragraph({
        Title = "🌦️ Auto Buy Weather Events",
        Desc = "Automatically purchase weather events to enhance your fishing experience.",
        Locked = true
    })
    
    -- Weather events list (UI names)
    local weatherNames = {"Wind", "Snow", "Cloudy", "Storm", "Shark Hunt"}
    -- Some remotes expect IDs or internal keys; map UI name -> possible payloads
    local weatherPayloadMap = {
        ["Wind"] = {  "Wind", 1, "wind" },
        ["Snow"] = {  "Snow", 2, "snow" },
        ["Cloudy"] = {  "Cloudy", 3, "cloudy" },
        ["Storm"] = {  "Storm", 4, "storm" },
        ["Shark Hunt"] = { "Shark Hunt", 5, "shark_hunt", "SharkHunt" },
    }
    
    -- Weather state management
    local weatherState = {
        selectedList = {},
        lastPurchaseTime = {},
        purchaseCooldown = config.weather.baseCooldownSeconds -- base cooldown
    }
    
    -- Function to check if weather is currently active
    local function isWeatherActive(weatherName)
        local success, result = pcall(function()
            -- Check ReplicatedStorage for active weather data
            local replicatedStorage = game:GetService("ReplicatedStorage")
            
            -- Check if there's a current weather event active in ReplicatedStorage
            local weatherData = replicatedStorage:FindFirstChild("WeatherData")
            if weatherData then
                local currentWeather = weatherData:FindFirstChild("CurrentWeather")
                if currentWeather and currentWeather.Value then
                    local activeWeather = currentWeather.Value:lower()
                    if activeWeather:find(weatherName:lower()) then
                        return true
                    end
                end
            end
            
            -- Check Lighting for weather effects
            local lighting = game:GetService("Lighting")
            local atmosphere = lighting:FindFirstChild("Atmosphere")
            
            if atmosphere then
                local density = atmosphere.Density
                local offset = atmosphere.Offset
                local color = atmosphere.Color
                
                -- More specific weather detection based on weather type
                if weatherName:lower() == "wind" then
                    -- Wind usually has high density and specific color
                    if density > 0.5 and offset > 0.2 then
                        return true
                    end
                elseif weatherName:lower() == "snow" then
                    -- Snow usually has white color and high density
                    if density > 0.4 and color.R > 0.8 and color.G > 0.8 and color.B > 0.8 then
                        return true
                    end
                elseif weatherName:lower() == "storm" then
                    -- Storm usually has very high density and dark color
                    if density > 0.7 and offset > 0.3 then
                        return true
                    end
                elseif weatherName:lower() == "cloudy" then
                    -- Cloudy usually has medium density
                    if density > 0.3 and density < 0.6 then
                        return true
                    end
                elseif weatherName:lower() == "shark hunt" then
                    -- Shark Hunt might have specific effects
                    if density > 0.6 then
                        return true
                    end
                end
            end
            
            -- Check for weather-related objects in workspace
            local propsFolder = workspace:FindFirstChild("Props")
            if propsFolder then
                for _, obj in ipairs(propsFolder:GetDescendants()) do
                    if obj.Name:lower():find(weatherName:lower()) then
                        return true
                    end
                end
            end
            
            -- Check for weather particles or effects
            local weatherEffects = workspace:FindFirstChild("WeatherEffects")
            if weatherEffects then
                for _, effect in ipairs(weatherEffects:GetChildren()) do
                    if effect.Name:lower():find(weatherName:lower()) then
                        return true
                    end
                end
            end
            
            return false
        end)
        
        return success and result or false
    end
    
    -- Weather selection dropdown
    Weathershop:Dropdown({ 
        Title = "Select Weather Events to Buy", 
        Desc = "Choose weather events you want to auto-buy",
        Values = weatherNames, 
        Multi = true,
        AllowNone = true,
        Callback = function(selectedWeathers)
            weatherState.selectedList = selectedWeathers or {}
        end 
    })
    
    -- Auto buy weather toggle
    Weathershop:Toggle({ 
        Title = "Enable Auto Buy Weather", 
        Desc = "Automatically purchase selected weather events",
        Callback = function(value)
            state.AutoBuyWeather = value
            if value then
                -- Check if any weather is selected
                if #weatherState.selectedList == 0 then
                    pcall(function() UI:Notify({ Title = "No Selection", Content = "Please select at least one weather event first", Duration = 3, Icon = "alert-triangle" }) end)
                    state.AutoBuyWeather = false
                    return
                end
                pcall(function() UI:Notify({ Title = "Auto Weather", Content = "Started monitoring " .. #weatherState.selectedList .. " selected weather events", Duration = 3, Icon = "cloud" }) end)
            else
                pcall(function() UI:Notify({ Title = "Auto Weather", Content = "Stopped auto buying weather events", Duration = 3, Icon = "cloud" }) end)
            end
        end
    })
    
    -- Weather monitoring loop
    task.spawn(function()
        while task.wait(config.weather.pollIntervalSeconds) do
            if not state.AutoBuyWeather then continue end
            
            local currentTime = os.time()
            
            -- Check each selected weather
            for _, weatherName in ipairs(weatherState.selectedList) do
                if not state.AutoBuyWeather then break end
                
                -- Check cooldown for this specific weather
                local lastTime = weatherState.lastPurchaseTime[weatherName] or 0
                
                -- resolve effective cooldown for this weather
                local override = config.weather.perWeatherCooldownSeconds[weatherName]
                local effectiveCooldown = override or weatherState.purchaseCooldown
                if currentTime - lastTime >= effectiveCooldown then
                    -- Double check if weather is currently active before trying to purchase
                    local weatherIsActive = isWeatherActive(weatherName)
                    
                    if not weatherIsActive then
                        -- Additional check: verify weather is not active after a short delay
                        task.wait(config.weather.preCheckDelaySeconds)
                        weatherIsActive = isWeatherActive(weatherName)
                        
                        if not weatherIsActive then
                            local success, result = pcall(function()
                                local netFolder = getNetFolder()
                                local rf = netFolder and netFolder:FindFirstChild("RF/PurchaseWeatherEvent")
                                if not rf then
                                    pcall(function() UI:Notify({ Title = "Weather", Content = "PurchaseWeatherEvent remote not found", Duration = 3, Icon = "alert-triangle" }) end)
                                    return false
                                end
                                -- Try multiple payload shapes to maximize compatibility + retries
                                local payloads = weatherPayloadMap[weatherName] or {weatherName}
                                local purchased = false
                                for attempt = 1, (config.weather.purchaseRetryCount or 1) do
                                    for _, payload in ipairs(payloads) do
                                        local ok, res = pcall(function()
                                            return rf:InvokeServer(payload)
                                        end)
                                        if ok and res ~= false then
                                            purchased = true
                                            break
                                        end
                                    end
                                    if purchased then break end
                                    task.wait(0.15)
                                end
                                if not purchased then return false end
                                -- Verify activation
                                task.wait(config.weather.verifyDelaySeconds)
                                local nowActive = isWeatherActive(weatherName)
                                if nowActive then
                                    weatherState.lastPurchaseTime[weatherName] = currentTime
                                    pcall(function() UI:Notify({ Title = "Weather Purchased", Content = "Successfully bought " .. weatherName .. " weather event", Duration = 2, Icon = "cloud" }) end)
                                    return true
                                end
                                return false
                            end)
                            
                            if not success then
                                -- Purchase failed due to error (weather not available, insufficient funds, etc.)
                                weatherState.lastPurchaseTime[weatherName] = currentTime - (weatherState.purchaseCooldown / 2) -- Shorter cooldown for failed purchases
                            end
                        else
                            -- Weather became active during delay, skip purchase
                            weatherState.lastPurchaseTime[weatherName] = currentTime - (weatherState.purchaseCooldown / 4)
                        end
                    else
                        -- Weather is already active, skip purchase and extend cooldown
                        weatherState.lastPurchaseTime[weatherName] = currentTime + (weatherState.purchaseCooldown / 2) -- Longer cooldown when weather is active
                    end
                    
                    task.wait(2) -- Small delay between attempts
                end
            end
        end
    end)
    
    -- Teleport to Weather Machine button
    Weathershop:Button({
        Title = "📍 Teleport to Weather Machine",
        Callback = function()
            local weatherMachine = workspace:FindFirstChild("!!!! ISLAND LOCATIONS !!!!")
            if weatherMachine then
                weatherMachine = weatherMachine:FindFirstChild("Weather Machine")
            end
            
            local char = player.Character
            if weatherMachine and char and char:FindFirstChild("HumanoidRootPart") then
                char:PivotTo(CFrame.new(weatherMachine.Position + Vector3.new(0, 5, 0)))
                pcall(function() UI:Notify({ Title = "Teleported", Content = "To Weather Machine", Duration = 3, Icon = "map-pin" }) end)
            else
                pcall(function() UI:Notify({ Title = "Error", Content = "Weather Machine or Character not found", Duration = 3, Icon = "alert-triangle" }) end)
            end
        end
    })
    
    -------------------------------------------
    ----- =======[ SHOP TAB ]
    -------------------------------------------
    Shop:Paragraph({
        Title = "🛒 Shop",
        Desc = "Coming Soon",
        Locked = true
    })

    -------------------------------------------
    ----- =======[ AUTO FISH TAB ]
    -------------------------------------------
    MainFeautures:Paragraph({
        Title = "🎣 Auto Fishing Features",
        Desc = "Configure your automated fishing experience with these powerful features.",
        Locked = true
    })
    
    local autoFishToggle
    autoFishToggle = MainFeautures:Toggle({ 
        Title = "Auto Fish (Include Perfect Fish)", 
        Callback = function(Value)
            state.AutoFish = Value
            if Value then startAutoFish() else stopAutoFish() end
        end
    })
    
    MainFeautures:Toggle({
        Title = "Auto Sell (Threshold Based)",
        Callback = function(Value)
            state.AutoSell = Value
            if Value then startAutoSell() end
        end
    })
    
    MainFeautures:Input({
        Title = "Sell Threshold (Fish Count)",
        Placeholder = tostring(state.SellThreshold),
        Callback = function(txt)
            local num = tonumber(txt)
            if num and num >= 10 and num <= 200 then
                state.SellThreshold = num
            end
        end
    })
    
    MainFeautures:Button({
        Title = "Sell All Items Now",
        Callback = function()
            local netFolder = getNetFolder()
            if netFolder then
                local sellFunc = netFolder:FindFirstChild("RF/SellAllItems")
                if sellFunc then
                    sellFunc:InvokeServer()
                    pcall(function() UI:Notify({ Title = "Auto Sell", Content = "Sold all items!", Duration = 3, Icon = "circle-check" }) end)
                end
            end
        end
    })
    
    -------------------------------------------
    ----- =======[ AUTO FAVORITE TAB ]
    -------------------------------------------
    AutoFavorite:Paragraph({
        Title = "❤️ Auto Favorite Features",
        Desc = "Automatically favorite fish based on their tier to prevent accidental selling.",
        Locked = true
    })
    
    -- Tier names for dropdown
    local tierNames = {"Epic", "Legendary", "Mythic", "Secret"}
    
    -- Auto favorite state management
    local favoriteState = {
        selectedList = {}
    }
    
    -- Auto favorite toggle
    AutoFavorite:Toggle({
        Title = "Enable Auto Favorite",
        Callback = function(Value)
            state.AutoFavourite = Value
            if Value then
                -- Check if any tier is selected
                if #favoriteState.selectedList == 0 then
                    pcall(function() UI:Notify({ Title = "No Selection", Content = "Please select at least one fish tier first", Duration = 3, Icon = "alert-triangle" }) end)
                    state.AutoFavourite = false
                    return
                end
                pcall(function() UI:Notify({ Title = "Auto Favorite", Content = "Started monitoring " .. #favoriteState.selectedList .. " selected fish tiers", Duration = 3, Icon = "heart" }) end)
            else
                pcall(function() UI:Notify({ Title = "Auto Favorite", Content = "Stopped auto favoriting fish", Duration = 3, Icon = "heart" }) end)
            end
            if Value then startAutoFavourite() end
        end
    })
    
    -- Tier selection dropdown
    AutoFavorite:Dropdown({ 
        Title = "Select Fish Tiers to Favorite", 
        Desc = "Choose fish tiers you want to auto-favorite",
        Values = tierNames, 
        Multi = true,
        AllowNone = true,
        Callback = function(selectedTiers)
            favoriteState.selectedList = selectedTiers or {}
            -- Update state.FavoriteTiers for compatibility
            state.FavoriteTiers = { [4]=false, [5]=false, [6]=false, [7]=false }
            for _, tierName in ipairs(favoriteState.selectedList) do
                if tierName == "Epic" then state.FavoriteTiers[4] = true
                elseif tierName == "Legendary" then state.FavoriteTiers[5] = true
                elseif tierName == "Mythic" then state.FavoriteTiers[6] = true
                elseif tierName == "Secret" then state.FavoriteTiers[7] = true
                end
            end
        end 
    })
    
    -------------------------------------------
    ----- =======[ PLAYER TAB ]
    -------------------------------------------
    -- WalkSpeed via Input saja (memastikan kompatibilitas dan tanpa error)
    local function setWalkSpeed(val)
        state.WalkSpeed = math.clamp(tonumber(val) or 16, 16, 150)
        local char = player.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = state.WalkSpeed end
    end
    Player:Input({ Title = "WalkSpeed (16-150)", Placeholder = tostring(state.WalkSpeed), Callback = function(txt)
        -- Hanya angka; buang semua non-digit
        local sanitized = (txt or ""):gsub("[^%d]", "")
        local v = tonumber(sanitized)
        if v == nil then
            pcall(function() UI:Notify({ Title = "WalkSpeed", Content = "Masukkan angka 16-150", Duration = 2, Icon = "users-round" }) end)
            return
        end
        v = math.max(16, math.min(150, v))
        setWalkSpeed(v)
    end })
    -- Terapkan ulang saat respawn ya FishItUpdate: menjaga nilai setelah spawn)
    player.CharacterAdded:Connect(function(char)
        if not config.walk.enforceOnRespawn then return end
        task.wait(0.25)
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = state.WalkSpeed end
        -- Jika Humanoid muncul belakangan
        char.ChildAdded:Connect(function(obj)
            if obj:IsA("Humanoid") then
                task.wait(0.05)
                obj.WalkSpeed = state.WalkSpeed
            end
        end)
    end)

    -- Penjaga periodik seperti di hub FishItUpdate (pastikan tidak terreset)
    task.spawn(function()
        while true do
            task.wait(0.5)
            local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.WalkSpeed ~= state.WalkSpeed then
                hum.WalkSpeed = state.WalkSpeed
            end
        end
    end)

    -- Infinite Jump (FishItUpdate style: pakai JumpRequest)
    local jumpConn
    local function startInfiniteJump()
        if jumpConn then return end
        local uis = pcall(function() return game:GetService("UserInputService") end)
        if uis then
            jumpConn = game:GetService("UserInputService").JumpRequest:Connect(function()
                local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum:ChangeState("Jumping") end
            end)
        end
    end
    local function stopInfiniteJump()
        if jumpConn then jumpConn:Disconnect(); jumpConn = nil end
    end

    -- Infinite Oxygen (FishItUpdate style + optional remote block)
    local oxyConn, oxyLoop
    local function removeOxygen()
        local char = player.Character or player.CharacterAdded:Wait()
        local oxy = char and char:FindFirstChild("Oxygen")
        if oxy then
            pcall(function()
                if oxy:IsA("NumberValue") then
                    oxy.Value = 999
                end
                oxy:Destroy()
            end)
        end
    end
    local function startInfiniteOxygen()
        removeOxygen()
        -- Hook remote jika tersedia
        if typeof(hookmetamethod) == "function" and typeof(newcclosure) == "function" and typeof(getnamecallmethod) == "function" then
            if not _G.__DZ_OXY_HOOK then
                local old
                old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
                    local method = getnamecallmethod()
                    if _G.__DZ_OXY_BLOCK and method == "FireServer" and tostring(self) == "URE/UpdateOxygen" then
                        return nil
                    end
                    return old(self, ...)
                end))
                _G.__DZ_OXY_HOOK = true
            end
            _G.__DZ_OXY_BLOCK = true
        end
        -- Respawn listener
        if not oxyConn then
            oxyConn = player.CharacterAdded:Connect(function()
                task.wait(0.5)
                removeOxygen()
            end)
        end
        -- Loop penjaga
        if not oxyLoop then
            oxyLoop = task.spawn(function()
                while state.InfiniteOxygen do
                    removeOxygen()
                    task.wait(1)
                end
            end)
        end
    end
    local function stopInfiniteOxygen()
        if oxyConn then oxyConn:Disconnect(); oxyConn = nil end
        if oxyLoop then task.cancel(oxyLoop); oxyLoop = nil end
        _G.__DZ_OXY_BLOCK = false
    end
    Player:Toggle({ Title = "Infinite Jump", Callback = function(Value)
        state.InfiniteJump = Value
        if Value then startInfiniteJump() else stopInfiniteJump() end
    end })
    Player:Toggle({ Title = "Infinite Oxygen", Callback = function(Value)
        state.InfiniteOxygen = Value
        if Value then startInfiniteOxygen() else stopInfiniteOxygen() end
    end })
    Player:Button({ Title = "Reload Character", Callback = function()
        local char = player.Character
        if char then char:BreakJoints() end
    end })

    -------------------------------------------
    ----- =======[ TELEPORT / AUTO FARM ]
    -------------------------------------------
    -- Island list diambil dari main.lua (posisi Vector3 dikonversi ke CFrame)
    local ISLAND_LIST = {
        ["Esoteric Depths"] = { CFrame.new(3295.51, -1302.85, 1371.23) },
        ["Tropical Grove"] = { CFrame.new(-2129.74, 53.49, 3635.48) },
        ["Tropical Grove [Ares Rod]"] = { cFrame.new(-2191.75, 3.37, 3703.33)},
        ["Fisherman Island"] = { CFrame.new(-127.06, 40.75, 2774.84) },
        ["Kohana Volcano"] = { CFrame.new(-648.43, 66.00, 213.34) },
        ["Coral Reefs"] = { CFrame.new(-3023.17, 2.52, 2257.24) },
        ["Crater Island"] = { CFrame.new(1039.25, 55.29, 5130.74) },
        ["Kohana"] = { CFrame.new(-673.91, 5.75, 705.09) },
        ["Winter Fest"] = { CFrame.new(1821.90, 5.79, 3307.58) },
        ["Isoteric Island"] = { CFrame.new(2082.14, 283.98, 1157.43) },
        ["Lost Isle [Angler Rod Place]"] = { CFrame.new(-3791.82, -147.91, -1349.01) },
        ["Lost Isle [Sisyphus]"] = { CFrame.new(-3763.11, -135.07, -998.47) },
        ["Lost Isle [Treasure Hall]"] = { CFrame.new(-3600.76, -316.57, -1409.19) },
        ["Lost Isle [Treasure Room]"] = { CFrame.new(-3598.11, -275.95, -1639.98) },
    }
    -- Extend list dynamically from workspace locations if present
    pcall(function()
        local locations = workspace:FindFirstChild("!!!! ISLAND LOCATIONS !!!!")
        if locations then
            for _, obj in ipairs(locations:GetDescendants()) do
                if obj:IsA("BasePart") then
                    local name = obj.Name
                    if name and not ISLAND_LIST[name] then
                        ISLAND_LIST[name] = { CFrame.new(obj.Position) }
                    end
                end
            end
        end
    end)
    Teleport:Paragraph({
        Title = "🎣 Teleport Information",
        Desc = "Jika ingin memakai auto farm aktifkan ketika sudah memilih pulau/island.\nUntuk teleport biasa silahkan tekan button teleport saja tanpa auto farm.",
        Locked = true
    })
    local selectedIsland
    Teleport:Dropdown({ Title = "Select Island", Values = (function() local t={} for k,_ in pairs(ISLAND_LIST) do table.insert(t,k) end table.sort(t) return t end)(), Callback = function(name)
        selectedIsland = name
    end })
    Teleport:Button({ Title = "Teleport to Selected", Callback = function()
        if selectedIsland then
            local list = ISLAND_LIST[selectedIsland]
            local pos = list and list[math.random(1, #list)]
            local char = player.Character or player.CharacterAdded:Wait()
            local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
            if hrp and pos then hrp.CFrame = pos end
        end
    end })
    local autoFarmLoop
    Teleport:Toggle({ Title = "Enable Auto Farm (uses selected island)", Callback = function(v)
        if v then
            if autoFarmLoop then task.cancel(autoFarmLoop) end
            -- Validasi island terpilih
            if not selectedIsland then
                pcall(function() UI:Notify({ Title = "Auto Farm", Content = "Please select an island first", Duration = 3, Icon = "alert-triangle" }) end)
                return
            end
            -- JANGAN aktifkan auto fish dulu, tunggu teleport dulu
            pcall(function() UI:Notify({ Title = "Auto Farm", Content = "Started auto farm on " .. selectedIsland .. " - will start fishing after teleport", Duration = 3, Icon = "map-pin" }) end)
            -- Context for controlling auto farm behavior across UI actions
            local autoFarmCtx = { didInitialTeleport = false, lastSelectedIsland = selectedIsland }
            autoFarmLoop = task.spawn(function()
                -- Teleport SEKALI ke island saat mulai, lalu jangan teleport lagi
                while true do
                    if not selectedIsland then task.wait(1); continue end

                    -- Jika user mengganti island, izinkan teleport sekali lagi
                    if selectedIsland ~= autoFarmCtx.lastSelectedIsland then
                        autoFarmCtx.didInitialTeleport = false
                        autoFarmCtx.lastSelectedIsland = selectedIsland
                    end

                    if not autoFarmCtx.didInitialTeleport then
                        local list = ISLAND_LIST[selectedIsland]
                        local pos = list and list[math.random(1, #list)]
                        local char = player.Character or player.CharacterAdded:Wait()
                        local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
                        if hrp and pos then
                            -- Pastikan tidak memotong saat sedang casting
                            if state.AutoFish then
                                disableAutoFish()
                                task.wait(0.5)
                            end

                            hrp.CFrame = pos
                            pcall(function() UI:Notify({ Title = "Auto Farm", Content = "Teleported to " .. selectedIsland, Duration = 2, Icon = "map-pin" }) end)

                            task.wait(config.autoFarm.postTeleportWaitSeconds) -- beri waktu transisi

                            if not state.AutoFish then
                                enableAutoFish()
                                pcall(function() UI:Notify({ Title = "Auto Farm", Content = "Started fishing on " .. selectedIsland, Duration = 2, Icon = "fish" }) end)
                            end

                            autoFarmCtx.didInitialTeleport = true
                        end
                    else
                        -- Setelah teleport pertama, jangan teleport lagi. Pastikan auto fish tetap aktif.
                        if not state.AutoFish and _G.autoFishLoop == nil then
                            enableAutoFish()
                        end
                        task.wait(2)
                    end
                end
            end)

            -- Provide a button to re-pick spot (force next teleport once)
            Teleport:Button({ Title = "Re-pick Farm Spot", Callback = function()
                autoFarmCtx.didInitialTeleport = false
                pcall(function() UI:Notify({ Title = "Auto Farm", Content = "Next cycle will teleport to a new spot", Duration = 2, Icon = "map-pin" }) end)
            end })
        else
            if autoFarmLoop then task.cancel(autoFarmLoop); autoFarmLoop = nil end
            -- Nonaktifkan auto fish saat auto farm dimatikan
            if state.AutoFish then stopAutoFish() end
            pcall(function() UI:Notify({ Title = "Auto Farm", Content = "Stopped auto farm", Duration = 3, Icon = "map-pin" }) end)
        end
    end })
    
    -- Teleport to Player Section
    Teleport:Paragraph({
        Title = "👥 Teleport to Player",
        Desc = "Teleport to other players in the server.",
        Locked = true
    })
    
    -- Get all players in server
    local function getPlayerList()
        local players = {}
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= player then
                table.insert(players, p.Name)
            end
        end
        table.sort(players)
        return players
    end
    
    local selectedPlayer
    Teleport:Dropdown({ 
        Title = "Select Player", 
        Values = getPlayerList(), 
        Callback = function(name)
            selectedPlayer = name
        end 
    })
    
    Teleport:Button({ Title = "Teleport to Player", Callback = function()
        if selectedPlayer then
            local targetPlayer = game.Players:FindFirstChild(selectedPlayer)
            if targetPlayer and targetPlayer.Character then
                local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                local myChar = player.Character
                local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
                
                if targetHRP and myHRP then
                    myHRP.CFrame = targetHRP.CFrame + Vector3.new(0, 5, 0)
                    pcall(function() UI:Notify({ Title = "Teleport Success", Content = "Teleported to " .. selectedPlayer, Duration = 3, Icon = "map-pin" }) end)
                else
                    pcall(function() UI:Notify({ Title = "Teleport Failed", Content = "Player or character not found", Duration = 3, Icon = "alert-triangle" }) end)
                end
            else
                pcall(function() UI:Notify({ Title = "Teleport Failed", Content = "Player not found or not in game", Duration = 3, Icon = "alert-triangle" }) end)
            end
        else
            pcall(function() UI:Notify({ Title = "Error", Content = "Please select a player first", Duration = 3, Icon = "alert-triangle" }) end)
        end
    end })
    
    -- Refresh player list button
    Teleport:Button({ Title = "Refresh Player List", Callback = function()
        local players = getPlayerList()
        if #players > 0 then
            -- Update dropdown values (WindUI might not support this directly, so we'll notify)
            pcall(function() UI:Notify({ Title = "Player List", Content = "Found " .. #players .. " players. Please reselect from dropdown.", Duration = 3, Icon = "users" }) end)
        else
            pcall(function() UI:Notify({ Title = "No Players", Content = "No other players found in server", Duration = 3, Icon = "users" }) end)
        end
    end })
    
    -- Event Teleport Section
    Teleport:Paragraph({
        Title = "🎪 Teleport to Events",
        Desc = "Automatically teleport to active events in the game.",
        Locked = true
    })
    
    -- Event names list
    local eventNames = {"Ghost Worm", "Worm Hunt", "Shark Hunt", "Ghost Shark Hunt", "Shocked", "Black Hole", "Meteor Rain"}
    
    -- Event state management
    local eventState = {
        selectedList = {},
        originalPosition = nil,
        platform = nil,
        wasAutoFishing = false,
        isAtEvent = false
    }
    
    -- Function to find event part
    local function findEventPart(eventName)
        local propsFolder = workspace:FindFirstChild("Props")
        if not propsFolder then return nil end
        local eventNameLower = eventName:lower()

        for _, descendant in ipairs(propsFolder:GetDescendants()) do
            if descendant.Name == "DisplayName" and descendant:IsA("TextLabel") and descendant.Text:lower() == eventNameLower then
                local currentAncestor = descendant
                while currentAncestor and currentAncestor ~= propsFolder do
                    if currentAncestor:IsA("BasePart") then
                        return currentAncestor
                    end
                    currentAncestor = currentAncestor.Parent
                end
            end
        end
        return nil
    end
    
    -- Event selection dropdown
    Teleport:Dropdown({ 
        Title = "Select Events to Teleport To", 
        Desc = "Choose events you want to teleport to",
        Values = eventNames, 
        Multi = true,
        AllowNone = true,
        Callback = function(selectedEvents)
            eventState.selectedList = selectedEvents or {}
        end 
    })
    
    -- Auto teleport to events toggle
    Teleport:Toggle({ 
        Title = "Enable Auto TP to Event", 
        Desc = "Automatically teleport to selected events",
        Callback = function(value)
            state.AutoTPEvent = value
            if value then
                -- Check if any event is selected
                if #eventState.selectedList == 0 then
                    pcall(function() UI:Notify({ Title = "No Selection", Content = "Please select at least one event first", Duration = 3, Icon = "alert-triangle" }) end)
                    state.AutoTPEvent = false
                    return
                end
                pcall(function() UI:Notify({ Title = "Event TP", Content = "Started monitoring " .. #eventState.selectedList .. " selected events", Duration = 3, Icon = "radio-tower" }) end)
            end
            if not value and eventState.isAtEvent then
                -- Return to original position when disabled
                local char = player.Character
                if char and char:FindFirstChild("HumanoidRootPart") and eventState.originalPosition then
                    char:FindFirstChild("HumanoidRootPart").CFrame = eventState.originalPosition
                end
                if eventState.platform then 
                    eventState.platform:Destroy() 
                    eventState.platform = nil 
                end
                eventState.isAtEvent = false
                pcall(function() UI:Notify({ Title = "Event TP", Content = "Returned to original position", Duration = 3, Icon = "map-pin" }) end)
            end
        end
    })
    
    -- Event monitoring loop
    task.spawn(function()
        while task.wait(5) do
            if not state.AutoTPEvent or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then 
                continue 
            end

            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            local targetEventPart = nil
            
            -- Find active event in selected list
            for _, eventName in ipairs(eventNames) do
                if table.find(eventState.selectedList, eventName) then
                    local eventPart = findEventPart(eventName)
                    if eventPart then
                        targetEventPart = eventPart
                        break -- Found one, exit loop
                    end
                end
            end

            if targetEventPart and not eventState.isAtEvent then
                -- New valid event found, teleport there
                eventState.isAtEvent = true
                eventState.wasAutoFishing = state.AutoFish
                if eventState.wasAutoFishing then 
                    stopAutoFish() 
                end

                eventState.originalPosition = hrp.CFrame
                eventState.platform = Instance.new("Part", workspace)
                eventState.platform.Name = "DZv1EventPlatform"
                eventState.platform.Size = Vector3.new(30, 1, 30)
                eventState.platform.Position = targetEventPart.Position + Vector3.new(0, 50, 0)
                eventState.platform.Anchored = true
                eventState.platform.Transparency = 1
                hrp.CFrame = eventState.platform.CFrame * CFrame.new(0, 3, 0)
                
                pcall(function() UI:Notify({ Title = "Event TP", Content = "Teleported to active event", Duration = 3, Icon = "radio-tower" }) end)
                
                -- Selalu mulai memancing di event untuk menghindari idle
                task.wait(config.tpEvent.resumeDelaySeconds)
                enableAutoFish()

            elseif not targetEventPart and eventState.isAtEvent then
                -- Event we're at has ended
                if state.AutoFish and not eventState.wasAutoFishing then 
                    -- Hanya hentikan jika sebelumnya tidak memancing
                    stopAutoFish() 
                end
                if eventState.platform then 
                    eventState.platform:Destroy()
                    eventState.platform = nil 
                end
                hrp.CFrame = eventState.originalPosition
                
                pcall(function() UI:Notify({ Title = "Event TP", Content = "Event ended, returned to original position", Duration = 3, Icon = "map-pin" }) end)
                
                if eventState.wasAutoFishing then
                    task.wait(config.tpEvent.resumeDelaySeconds)
                    enableAutoFish()
                end
                eventState.isAtEvent = false
            end
        end
    end)
    
    -------------------------------------------
    ----- =======[ SETTINGS & MISC ]
    -------------------------------------------
    SettingsMisc:Paragraph({ Title = "Settings", Desc = "Misc options & info.", Locked = true })
    -- Low Graphics toggle
    local function applyLowGraphics(on)
        if on then
            Lighting.GlobalShadows = false
            Lighting.EnvironmentDiffuseScale = 0
            Lighting.EnvironmentSpecularScale = 0
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        else
            settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
            Lighting.GlobalShadows = true
        end
    end
    SettingsMisc:Toggle({ Title = "Low Graphics", Callback = function(v)
        state.LowGraphics = v; applyLowGraphics(v)
    end })
    -- FPS Unlocker (select preset)
    local function setFpsCap(n)
        if typeof(setfpscap) == "function" then setfpscap(n) elseif typeof(setsynmaxfps) == "function" then setsynmaxfps(n) end
    end
    SettingsMisc:Dropdown({ Title = "FPS Cap", Values = {"60","90","120","Max"}, Callback = function(choice)
        local map = { ["60"] = 60, ["90"] = 90, ["120"] = 120, ["Max"] = 0 }
        local cap = map[choice] or 0
        state.FPSCap = cap
        setFpsCap(cap)
    end })
    -- Rejoin server
    SettingsMisc:Button({ Title = "Rejoin Server", Callback = function()
        TeleportService:Teleport(game.PlaceId, player)
    end })
    -- Server Hop (cari server publik dengan slot kosong)
    SettingsMisc:Button({ Title = "Server Hop (Public)", Callback = function()
        local placeId = game.PlaceId; local servers, cursor = {}, ""
        repeat
            local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100" .. (cursor ~= "" and "&cursor=" .. cursor or "")
            local success, result = pcall(function() return HttpService:JSONDecode(game:HttpGet(url)) end)
            if success and result and result.data then
                for _, server in pairs(result.data) do if server.playing < server.maxPlayers and server.id ~= game.JobId then table.insert(servers, server.id) end end
                cursor = result.nextPageCursor or ""
            else break end
        until not cursor or #servers > 0
        if #servers > 0 then TeleportService:TeleportToPlaceInstance(placeId, servers[math.random(1, #servers)], player) end
    end })
    -- Auto Rejoin on disconnect (sederhana: loop cek flag)
    SettingsMisc:Toggle({ Title = "Auto Rejoin on Disconnect", Callback = function(v)
        state.AutoRejoin = v
    end })
    task.spawn(function()
        while true do
            task.wait(2)
            if state.AutoRejoin and not game:IsLoaded() then
                pcall(function() TeleportService:Teleport(game.PlaceId, player) end)
            end
        end
    end)

    -- Save/Load Config (per-username)
    SettingsMisc:Paragraph({ Title = "Config", Desc = "Save/Load per-username.", Locked = true })
    local function getConfigKey()
        return "DZv1_Config_" .. tostring(player.UserId or player.Name or "User")
    end
    local function serialize(tbl)
        local ok, json = pcall(HttpService.JSONEncode, HttpService, tbl)
        return ok and json or nil
    end
    local function deserialize(s)
        local ok, tbl = pcall(HttpService.JSONDecode, HttpService, s)
        return ok and tbl or nil
    end
    local function shallowCopy(src, allow)
        local dst = {}
        for k, v in pairs(src) do if allow[k] ~= false then dst[k] = v end end
        return dst
    end
    local allowKeys = {
        AutoFish=true, AutoSell=true, SellThreshold=true,
        FavoriteTiers=true, WalkSpeed=true,
        AutoTPEvent=true,
        AutoBuyWeather=true,
    }
    -- helper to apply loaded config
    local function applyLoadedConfig(cfg)
        for k, v in pairs(cfg) do if allowKeys[k] then state[k] = v end end
        if weatherState and cfg._weatherSelected then weatherState.selectedList = cfg._weatherSelected end
        if eventState and cfg._eventSelected then eventState.selectedList = cfg._eventSelected end
        if webhookState and cfg._webhook then
            webhookState.webhookPath = cfg._webhook.path
            webhookState.selectedCategories = cfg._webhook.cats or {}
        end
        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if hum and state.WalkSpeed then hum.WalkSpeed = state.WalkSpeed end
        if state.AutoFish then enableAutoFish() else disableAutoFish() end
    end

    SettingsMisc:Button({ Title = "💾 Save Config", Callback = function()
        local data = shallowCopy(state, allowKeys)
        data._weatherSelected = weatherState and weatherState.selectedList or {}
        data._eventSelected = eventState and eventState.selectedList or {}
        data._webhook = webhookState and { path = webhookState.webhookPath, cats = webhookState.selectedCategories } or {}
        local json = serialize(data)
        if json and setclipboard then setclipboard(json) end
        if json and writefile then
            pcall(writefile, getConfigKey() .. ".json", json)
            pcall(function() UI:Notify({ Title = "Config", Content = "Saved to file & clipboard", Duration = 2, Icon = "circle-check" }) end)
        else
            pcall(function() UI:Notify({ Title = "Config", Content = "Saved to clipboard (no writefile)", Duration = 2, Icon = "clipboard" }) end)
        end
    end })
    SettingsMisc:Button({ Title = "📂 Load Config", Callback = function()
        local json
        if isfile and isfile(getConfigKey() .. ".json") then
            json = readfile(getConfigKey() .. ".json")
        elseif clipboard and clipboard.get and typeof(clipboard.get) == "function" then
            json = clipboard.get()
        end
        if not json then
            pcall(function() UI:Notify({ Title = "Config", Content = "No config found", Duration = 2, Icon = "alert-triangle" }) end)
            return
        end
        local cfg = deserialize(json)
        if not cfg then
            pcall(function() UI:Notify({ Title = "Config", Content = "Invalid config", Duration = 2, Icon = "alert-triangle" }) end)
            return
        end
        -- Apply basic state
        applyLoadedConfig(cfg)
        pcall(function() UI:Notify({ Title = "Config", Content = "Loaded", Duration = 2, Icon = "download" }) end)
    end })

    -- (Memory config removed per request)

    -- Auto-load config for this user if file exists
    task.spawn(function()
        local path = getConfigKey() .. ".json"
        if isfile and isfile(path) then
            local json = readfile(path)
            local cfg = deserialize(json)
            if cfg then
                applyLoadedConfig(cfg)
                pcall(function() UI:Notify({ Title = "Config", Content = "Auto-loaded for " .. (player.Name or "User"), Duration = 2, Icon = "download" }) end)
            end
        end
    end)
    
    -------------------------------------------
    ----- =======[ WEBHOOK TAB ]
    -------------------------------------------
    Webhooksettings:Paragraph({
        Title = "🔗 Discord Webhook Features",
        Desc = "Send notifications to Discord when you catch rare fish.",
        Locked = true
    })
    
    -- Webhook state management
    local webhookState = {
        webhookPath = nil,
        enabled = false,
        selectedCategories = {}
    }
    
    -- Fish categories for webhook
    local fishCategories = {"Secret", "Mythic", "Legendary", "Epic"}
    
    -- Function to validate webhook
    local function validateWebhook(path)
        if not path or path == "" then return false, "Key is empty" end
        
        -- Extract webhook key from full URL if provided
        local webhookKey = path
        if path:match("^https://discord%.com/api/webhooks/") then
            -- Extract ID/TOKEN from full URL
            webhookKey = path:match("https://discord%.com/api/webhooks/(.+)")
            if not webhookKey then return false, "Invalid URL format" end
        elseif not path:match("^%d+/.+") then
            return false, "Invalid format - use full URL or ID/TOKEN format"
        end
        
        local url = "https://discord.com/api/webhooks/" .. webhookKey
        local success, response = pcall(game.HttpGet, game, url)
        if not success then return false, "Failed to connect to Discord" end
        local ok, data = pcall(HttpService.JSONDecode, HttpService, response)
        if not ok or not data or not data.channel_id then return false, "Invalid webhook" end
        return true, data.channel_id, webhookKey
    end
    
    -- Function to get Roblox image URL
    local function getRobloxImage(assetId)
        if not assetId then return nil end
        return "https://www.roblox.com/asset-thumbnail/image?assetId=" .. assetId .. "&width=420&height=420&format=png"
    end
    
    -- Function to send fish webhook
    local function sendFishWebhook(fishName, rarityText, assetId, itemId, variantId)
        if not webhookState.webhookPath or webhookState.webhookPath == "" or not webhookState.enabled then return end
        if not table.find(webhookState.selectedCategories, rarityText) then return end
        
        local WebhookURL = "https://discord.com/api/webhooks/" .. webhookState.webhookPath
        local username = player.DisplayName
        local imageUrl = getRobloxImage(assetId)
        if not imageUrl then return end

        local caught = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Caught")
        local rarest = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Rarest Fish")

        local fields = useCompactEmbed and nil or {
            { name = "Total Caught", value = tostring(caught and caught.Value or "N/A"), inline = true},
            { name = "Rarest Fish", value = tostring(rarest and rarest.Value or "N/A"), inline = true},
        }
        local embed = {
            ["title"] = "🎣 Fish Caught!",
            ["description"] = string.format("Player **%s** caught a **%s** (%s)!", username, fishName, rarityText),
            ["color"] = tonumber("0x00bfff"),
            ["image"] = { ["url"] = imageUrl },
            ["footer"] = { ["text"] = "DZv1 Webhook | " .. os.date("%H:%M:%S") }
        }
        if fields then embed["fields"] = fields end
        local data = { ["username"] = "DZv1 Fisher - Notification System", ["embeds"] = { embed } }
        
        local requestFunc = syn and syn.request or http and http.request or http_request or request or fluxus and fluxus.request
        if requestFunc then
            pcall(function()
                requestFunc({ Url = WebhookURL, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = HttpService:JSONEncode(data) })
            end)
        end
    end
    
    -- Webhook input
    Webhooksettings:Input({
        Title = "Discord Webhook URL",
        Desc = "Enter your Discord webhook URL (full URL or ID/TOKEN format)",
        Placeholder = "https://discord.com/api/webhooks/...",
        Callback = function(text)
            if text == "" then 
                webhookState.webhookPath = nil
                return 
            end
            -- trim leading/trailing whitespace
            text = text:gsub("^%s+",""):gsub("%s+$","")
            local isValid, result, webhookKey = validateWebhook(text)
            if isValid then
                webhookState.webhookPath = webhookKey -- Store the extracted key
                pcall(function() UI:Notify({ Title = "Webhook Valid", Content = "Channel ID: " .. tostring(result), Duration = 3, Icon = "circle-check" }) end)
            else
                webhookState.webhookPath = nil
                pcall(function() UI:Notify({ Title = "Webhook Invalid", Content = tostring(result), Duration = 3, Icon = "ban" }) end)
            end
        end
    })

    -- Compact embed toggle
    local useCompactEmbed = false
    Webhooksettings:Toggle({
        Title = "Compact Embed",
        Desc = "Send smaller embed (fewer fields)",
        Callback = function(v)
            useCompactEmbed = v
        end
    })
    
    -- Fish category selection
    Webhooksettings:Dropdown({
        Title = "Select Fish Rarities to Notify",
        Desc = "Choose which fish rarities to send webhook notifications for",
        Values = fishCategories,
        Multi = true,
        AllowNone = true,
        Callback = function(selectedRarities)
            webhookState.selectedCategories = selectedRarities or {}
        end
    })
    
    -- Enable webhook toggle
    Webhooksettings:Toggle({
        Title = "Enable Webhook Notifications",
        Desc = "Send Discord notifications when catching selected fish rarities",
        Callback = function(Value)
            webhookState.enabled = Value
            if Value then
                if not webhookState.webhookPath then
                    pcall(function() UI:Notify({ Title = "Webhook", Content = "Please enter webhook URL first", Duration = 3, Icon = "alert-triangle" }) end)
                    webhookState.enabled = false
                    return
                end
                if #webhookState.selectedCategories == 0 then
                    pcall(function() UI:Notify({ Title = "Webhook", Content = "Please select at least one fish rarity", Duration = 3, Icon = "alert-triangle" }) end)
                    webhookState.enabled = false
                    return
                end
                pcall(function() UI:Notify({ Title = "Webhook", Content = "Webhook notifications enabled for " .. #webhookState.selectedCategories .. " rarities", Duration = 3, Icon = "webhook" }) end)
            else
                pcall(function() UI:Notify({ Title = "Webhook", Content = "Webhook notifications disabled", Duration = 3, Icon = "webhook" }) end)
            end
        end
    })
    
    -- Test webhook button
    Webhooksettings:Button({
        Title = "Test Webhook",
        Callback = function()
            if not webhookState.webhookPath then
                pcall(function() UI:Notify({ Title = "Test Failed", Content = "Please enter webhook URL first", Duration = 3, Icon = "alert-triangle" }) end)
                return
            end
            
            -- Send test webhook
            local WebhookURL = "https://discord.com/api/webhooks/" .. webhookState.webhookPath
            local data = {
                ["username"] = "DZv1 Fisher - Notification System",
                ["embeds"] = {{
                    ["title"] = "🧪 Test Webhook",
                    ["description"] = "This is a test message from DZv1 script!",
                    ["color"] = tonumber("0x00ff00"),
                    ["footer"] = { ["text"] = "DZv1 Webhook Test | " .. os.date("%H:%M:%S") }
                }}
            }
            
            local requestFunc = syn and syn.request or http and http.request or http_request or request or fluxus and fluxus.request
            if requestFunc then
                pcall(function()
                    requestFunc({ Url = WebhookURL, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = HttpService:JSONEncode(data) })
                    pcall(function() UI:Notify({ Title = "Test Sent", Content = "Test webhook sent successfully!", Duration = 3, Icon = "circle-check" }) end)
                end)
            else
                pcall(function() UI:Notify({ Title = "Test Failed", Content = "No HTTP request function available", Duration = 3, Icon = "alert-triangle" }) end)
            end
        end
    })
    
    -- Fish notification monitoring
    local lastCatchData = {}
    local obtainedNewFishNotification = getNetFolder() and getNetFolder():FindFirstChild("RE/ObtainedNewFishNotification")
    if obtainedNewFishNotification then
        obtainedNewFishNotification.OnClientEvent:Connect(function(itemId, _, data)
            if data and data.InventoryItem and data.InventoryItem.Metadata then
                lastCatchData.ItemId = itemId
                lastCatchData.VariantId = data.InventoryItem.Metadata.VariantId
            end
        end)
    end
    
    -- Monitor fish notifications
    pcall(function()
        local guiNotif = player.PlayerGui:WaitForChild("Small Notification"):WaitForChild("Display"):WaitForChild("Container")
        local fishText = guiNotif:WaitForChild("ItemName")
        local rarityText = guiNotif:WaitForChild("Rarity")
        local imageFrame = player.PlayerGui["Small Notification"]:WaitForChild("Display"):WaitForChild("VectorFrame"):WaitForChild("Vector")

        fishText:GetPropertyChangedSignal("Text"):Connect(function()
            task.wait(0.1) -- wait for rarity to update
            local fishName, rarity = fishText.Text, rarityText.Text
            if fishName and rarity and webhookState.enabled and table.find(webhookState.selectedCategories, rarity) then
                local assetId = string.match(imageFrame.Image, "%d+")
                if assetId then
                    sendFishWebhook(fishName, rarity, assetId, lastCatchData.ItemId, lastCatchData.VariantId)
                end
            end
        end)
    end) 
end

-- Create window with error handling
local ok, err = pcall(buildWindow)
if not ok then 
    warn("[DZv1] Error: " .. tostring(err))
    pcall(function() 
        game.StarterGui:SetCore("SendNotification", { 
            Title = "DZ v1 Error", 
            Text = "Script error: " .. tostring(err), 
            Duration = 10 
        }) 
    end)
end
