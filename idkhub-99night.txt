-- Load Avantrix Library
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xenlua/Xens/refs/heads/main/ui/Avantrix.lua"))() 
local FlagsManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/xenlua/Xens/refs/heads/main/ui/Flags"))()

local LPH_JIT_MAX = function(...) return(...) end
local LPH_NO_VIRTUALIZE = function(...) return(...) end
local LPH_CRASH = function(...) while task.wait() do game:GetService("ScriptContext"):SetTimeout(math.huge);while true do while true do while true do while true do while true do while true do while true do while true do print("noob") end end end end end end end end end end
local LRM_UserNote = "Owner"
local LRM_ScriptVersion = "v19"
local ClonedPrint = print

if LPH_OBFUSCATED then
    ClonedPrint = print
    print = function(...)end
    warn = function(...)end

    local PreventSkidsToMakeGayThings = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/InfiniX/a40a158d22fd4f4733beb2f67379866ccb17906f/Library/Anti/AntiDebug/main.lua", true))()

    if not (type(PreventSkidsToMakeGayThings) == "table") then
        LPH_CRASH()
    end
end

repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Format version function
function formatVersion(version)
    local formattedVersion = "v" .. version:sub(2):gsub(".", "%0.")
    return formattedVersion:sub(1, #formattedVersion - 1)
end

-- Initialize main GUI
local main = lib:Load({
    Title = '99 Night Forest '..formatVersion(LRM_ScriptVersion)..' | ' .. gradient("Avantrix").. " | ",
    ToggleButton = "rbxassetid://100227182680708",
})

-- Create tabs
local tabs = {
    Welcome = main:AddTab("Information"),
    Main = main:AddTab("Main"),
    Teleport = main:AddTab("Teleport"),
    Bring = main:AddTab("Bring Items"),
    Chest = main:AddTab("Chest Finder"),
    Hitbox = main:AddTab("Hitbox"),
    Misc = main:AddTab("Misc"),
    Settings = main:AddTab("Settings"),
}

main:SelectTab()

-- Create sections
local sections = {
    Welcome = tabs.Welcome:AddSection({Defualt = true, Locked = true}),
    MainFarm = tabs.Main:AddSection({Title = "Farm Controls", Description = "Main farming features", Defualt = true, Locked = false}),
    AutoEat = tabs.Main:AddSection({Title = "Auto Eat System", Description = "Automatic hunger management", Defualt = false, Locked = false}),
    TeleportControls = tabs.Teleport:AddSection({Title = "Teleport Controls", Description = "Quick teleportation options", Defualt = true, Locked = false}),
    BringItems = tabs.Bring:AddSection({Title = "Item Collection", Description = "Bring items to your location", Defualt = true, Locked = false}),
    AutoDetectItems = tabs.Bring:AddSection({Title = "All Items", Description = "Automatically detect and bring items from workspace", Defualt = false, Locked = false}),
    ScrapItems = tabs.Bring:AddSection({Title = "Scrap Items", Description = "Manage scrappable items", Defualt = false, Locked = false}),
    FuelItems = tabs.Bring:AddSection({Title = "Fuel Items", Description = "Manage fuel items", Defualt = false, Locked = false}),
    ChestFinder = tabs.Chest:AddSection({Title = "Chest Detection", Description = "Find and teleport to chests", Defualt = true, Locked = false}),
    HitboxControls = tabs.Hitbox:AddSection({Title = "Hitbox Expansion", Description = "Expand enemy hitboxes", Defualt = true, Locked = false}),
    MiscFeatures = tabs.Misc:AddSection({Title = "Miscellaneous", Description = "Various utility features", Defualt = true, Locked = false}),
    Performance = tabs.Misc:AddSection({Title = "Performance", Description = "FPS and performance tools", Defualt = false, Locked = false}),
}

-- Variables
local var = {}
local selectedItemToBring = {}
local selectedPosition = {}
local selectedChestToTeleport = {}
local selectedScrapItem = {}
local selectedScrapPosition = {}
local selectedFuelItem = {}
local selectedFuelPosition = {}
local selectedFoodItem = {}

-- Auto Eat Variables
local autoEatActive = false
local autoEatThreshold = 30
local maxHunger = 200

-- Auto Drag Variables
local autoDragActive = false
local autoDragScrapActive = false
local autoDragFuelActive = false

-- Initialize welcome paragraph
var.WelcomeParagraph = sections.Welcome:AddParagraph({
    Title = gradient("Loading..."), 
    Description = "Please wait..\nIf you've been stuck on this for a long time please join our discord and report it.\nYou could also try:\n- Re-execute\n- Rejoin"
})

var.WelcomeParagraph:SetTitle(gradient("Welcome to Avantrix SCRIPTS!"))
var.WelcomeParagraph:SetDesc([[<font color="rgb(255,255,255)">NEWS:</font>
[+] Auto Eat System Added
[+] Chest Finder System Added
[+] Teleport to Chest Locations
[+] Scrappable Items Management

<b><font color='rgb(255, 255, 255)'>----------------------------------------[Features]--------------------------------------</font></b>

<font color="rgb(255,255,255)">Version:</font> ]] .. formatVersion(LRM_ScriptVersion) .. [[

<font color="rgb(255,255,255)">Features:</font>
• Kill aura (attacks all mobs simultaneously with minimal delay)
• Auto Eat System (continues until max hunger)
• Teleportation System
• Item Bringing/Collection to Multiple Destinations
• Auto Detect Items from workspace
• Auto Drag Items Loop to Multiple Destinations
• Scrappable Items Management
• Auto Drag Scrap Items Loop to Multiple Destinations
• Fuel Items Management
• Auto Drag Fuel Items Loop to Multiple Destinations
• Chest Finder & Teleport System
• Hitbox Expansion
• Speed Hack
• FPS/Ping Display
• Performance Optimization

<font color="rgb(255,255,255)">Instructions:</font>
1. Configure your preferences in each tab
2. Enable desired features
3. Use Auto Eat to manage hunger automatically until max
4. Use Auto Detect Items to find and drag items in workspace
5. Use Scrap Items to manage and drag scrappable items
6. Use Fuel Items to manage and drag fuel items
7. Use Chest Finder to locate and teleport to chests
8. Use responsibly to avoid detection

<font color="rgb(255,255,255)">Discord:</font> discord.gg/cF8YeDPt2G]])

-- Add Discord button
sections.Welcome:AddButton({
    Title = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/cF8YeDPt2G")
        lib:Dialog({
            Title = "Success",
            Content = "Discord link copied to clipboard!",
            Buttons = {
                {
                    Title = "OK",
                    Variant = "Primary",
                    Callback = function() end,
                }
            }
        })
    end,
})

-- Game Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local infHungerActive = false
local ToolDamageObject = ReplicatedStorage.RemoteEvents.ToolDamageObject
local RequestConsumeItem = ReplicatedStorage.RemoteEvents.RequestConsumeItem
local RequestStartDraggingItem = ReplicatedStorage.RemoteEvents.RequestStartDraggingItem
local StopDraggingItem = ReplicatedStorage.RemoteEvents.StopDraggingItem
local RemoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local itemsFolder = workspace:WaitForChild("Items")
local remoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")

-- Main Farm Section - IMPROVED KILL AURA
local killAuraActive = false
local killAuraRange = 100
local killAuraSpeed = 0.5

local safezoneBaseplates = {}
local baseplateSize = Vector3.new(2048, 5, 2048)
local baseY = 130
local centerPos = Vector3.new(0, baseY, 0) -- original center

for dx = -1, 1 do
    for dz = -1, 1 do
        local pos = centerPos + Vector3.new(dx * baseplateSize.X, 0, dz * baseplateSize.Z)
        local baseplate = Instance.new("Part")
        baseplate.Name = "SafeZoneBaseplate"
        baseplate.Size = baseplateSize
        baseplate.Position = pos
        baseplate.Anchored = true
        baseplate.CanCollide = true
        baseplate.Transparency = 1
        baseplate.Color = Color3.fromRGB(255, 255, 255)
        baseplate.Parent = workspace
        table.insert(safezoneBaseplates, baseplate)
    end
end

local function teleportToTarget(cf, duration)
    local char = game.Players.LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    if duration and duration > 0 then
        local ts = game:GetService("TweenService")
        local info = TweenInfo.new(duration, Enum.EasingStyle.Linear)
        local goal = { CFrame = cf }
        local tween = ts:Create(hrp, info, goal)
        tween:Play()
    else
        hrp.CFrame = cf
    end
end

local function stringToCFrame(str)
    local x, y, z = str:match("([^,]+),%s*([^,]+),%s*([^,]+)")
    return CFrame.new(tonumber(x), tonumber(y), tonumber(z))
end

local storyCoords = {
    { "[campsite] camp site", "0, 8, -0"},
    { "[safezone] safe zone", "0, 140, -0" }
}

local toolsDamageIDs = {
    ["Old Axe"] = "1_8982038982",
    ["Good Axe"] = "112_8982038982",
    ["Strong Axe"] = "116_8982038982",
    ["Chainsaw"] = "647_8992824875",
    ["Spear"] = "196_8999010016"
}

local function getAnyToolWithDamageID()
    for toolName, damageID in pairs(toolsDamageIDs) do
        local tool = player.Inventory:FindFirstChild(toolName)
        if tool then
            return tool, damageID
        end
    end
    return nil, nil
end

local function getEquippedWeapon()
    local character = LocalPlayer.Character
    if character then
        for _, child in pairs(character:GetChildren()) do
            if child:IsA("Tool") and child:GetAttribute("WeaponDamage") then
                return child
            end
        end
    end
    return nil
end

local function getAllWeapons()
    local weapons = {}
    local player = Players.LocalPlayer
    local inventory = player:FindFirstChild("Inventory")
    if inventory then
        for _, item in pairs(inventory:GetChildren()) do
            if item:GetAttribute("WeaponDamage") then
                table.insert(weapons, item)
            end
        end
    end
    return weapons
end

-- Auto Eat Functions
local function getCurrentHunger()
    local player = LocalPlayer
    local hunger = player:GetAttribute("Hunger") or 0
    return hunger
end

local function getFoodItems()
    local foodItems = {"Apple","Carrot", "Berry", "Cooked Morsel", "Cooked Steak"}
    table.sort(foodItems)
    return foodItems
end

local function findFoodItem(foodName)
    if not foodName then return {} end
    local itemsFolder = workspace:FindFirstChild("Items")
    local foundItems = {}
    if itemsFolder then
        for _, item in pairs(itemsFolder:GetChildren()) do
            if item.Name == foodName then
                table.insert(foundItems, item)
            end
        end
    end
    return foundItems
end

local function autoEatLoop()
    task.spawn(function()
        while autoEatActive do
            local currentHunger = getCurrentHunger()
            
            if currentHunger <= autoEatThreshold and #selectedFoodItem > 0 then
                while currentHunger < maxHunger and autoEatActive do
                    local ateSomething = false
                    for _, foodName in ipairs(selectedFoodItem) do
                        local foodItems = findFoodItem(foodName)
                        for _, food in ipairs(foodItems) do
                            if food and food.Parent then
                                pcall(function()
                                    RequestConsumeItem:InvokeServer(food)
                                    ateSomething = true
                                end)
                                task.wait(0.0000005)
                                currentHunger = getCurrentHunger()
                                if currentHunger >= maxHunger then
                                    break
                                end
                            end
                        end
                        if currentHunger >= maxHunger then
                            break
                        end
                    end
                    if not ateSomething then
                        break
                    end
                    task.wait(0.000001)
                end
            end
            task.wait(0.000001)
        end
    end)
end

-- Function to get all items from workspace.Items
local function getAllItemsFromWorkspace()
    local items = {}
    local itemsFolder = workspace:FindFirstChild("Items")
    if itemsFolder then
        for _, item in pairs(itemsFolder:GetChildren()) do
            if not table.find(items, item.Name) then
                table.insert(items, item.Name)
            end
        end
    end
    table.sort(items)
    return items
end



-- Function to get scrappable items
local function getScrappableItems()
    local scrapItems = {"UFO Junk", "UFO Component", "Old Car Engine", "Broken Fan", "Old Microwave", "Bolt", "Log", "Cultist Gem", "Sheet Metal", "Old Radio","Tyre","Washing Machine", "Cultist Experiment", "Cultist Component", "Gem of the Forest Fragment", "Broken Microwave"}
    table.sort(scrapItems)
    return scrapItems
end



-- Function to get fuel items
local function getFuelItems()
    local fuelItems = {"Log", "Coal", "Fuel Canister", "Oil Barrel", "Biofuel"}
    table.sort(fuelItems)
    return fuelItems
end

-- Function to get all chests from workspace
local function getAllChestsFromWorkspace()
    local chests = {}
    local chestsData = {}
    
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and (obj.Name:lower():find("chest") or obj.Name:lower():find("crate") or obj.Name:lower():find("box")) then
            local position = nil
            local rootPart = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChildWhichIsA("BasePart")
            
            if rootPart then
                position = rootPart.Position
                local displayName = obj.Name .. " (" .. math.floor(position.X) .. ", " .. math.floor(position.Y) .. ", " .. math.floor(position.Z) .. ")"
                
                if not table.find(chests, displayName) then
                    table.insert(chests, displayName)
                    chestsData[displayName] = {
                        model = obj,
                        position = position,
                        name = obj.Name
                    }
                end
            end
        end
    end
    
    table.sort(chests)
    return chests, chestsData
end

local function moveItemToPos(item, position)
    if not item or not item:IsDescendantOf(workspace) then return end

    local part = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart") or item:FindFirstChild("Handle")
    if not part then return end

    -- Pastikan PrimaryPart diset
    if not item.PrimaryPart then
        pcall(function() item.PrimaryPart = part end)
    end

    -- Tunggu sampai item benar-benar ready
    local function waitForPhysics()
        local start = tick()
        repeat
            task.wait()
        until part:IsDescendantOf(workspace) and part:IsA("BasePart") and part:IsDescendantOf(item) or tick() - start > 3
    end

    waitForPhysics()

    -- Coba ambil ownership
    pcall(function()
        remoteEvents.RequestStartDraggingItem:FireServer(item)
    end)

    task.wait(0.1)

    -- Coba set posisi
    pcall(function()
        if item.PrimaryPart then
            item:SetPrimaryPartCFrame(CFrame.new(position))
        end
    end)

    task.wait(0.1)

    -- Hentikan dragging
    pcall(function()
        remoteEvents.StopDraggingItem:FireServer(item)
    end)
end


-- Modified function for bringing items using moveItemToPos
local function bringItemsByName(names, positions)
    local count = 0
    if not names or #names == 0 or not positions or #positions == 0 then
        return 0
    end

    local itemsFolder = workspace:FindFirstChild("Items")
    if not itemsFolder then
        return 0
    end

    for _, item in ipairs(itemsFolder:GetChildren()) do
        for _, name in ipairs(names) do
            if item.Name == name then
                for _, position in ipairs(positions) do
                    local targetPosition
                    if position == "LocalPlayer" then
                        if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            return 0
                        end
                        targetPosition = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
                    elseif position == "Campfire" then
                        targetPosition = Vector3.new(0, 19, 0)
                    elseif position == "Scrapper" then
                        local scrapper = workspace.Map.Campground.Scrapper
                        if scrapper and scrapper:FindFirstChild("GlowEffect") then
                            targetPosition = scrapper.GlowEffect.Position + Vector3.new(0, 19, 0)
                        else
                            return 0
                        end
                    elseif position == "Freezer" then
                        local freezer = workspace:FindFirstChild("Structures") and workspace.Structures:FindFirstChild("Freezer")
                        if freezer and freezer:IsA("Model") then
                            local autoStack = freezer:FindFirstChild("AutoStack")
                            if autoStack then
                                local touchZone = autoStack:FindFirstChild("TouchZone")
                                if touchZone and touchZone:IsA("BasePart") then
                                    targetPosition = touchZone.Position + Vector3.new(0, 3, 0)
                                else
                                    return 0
                                end
                            else
                                return 0
                            end
                        else
                            return 0
                        end
                    else
                        return 0
                    end
                    moveItemToPos(item, targetPosition)
                    count = count + 1
                    task.wait(0.1)
                end
            end
        end
    end
    return count
end

-- Modified function for drag and drop
local function dragAndDropItem(itemNames, positions)
    if not itemNames or #itemNames == 0 or not positions or #positions == 0 then
        return
    end

    local itemsFolder = workspace:FindFirstChild("Items")
    if not itemsFolder then
        return
    end

    for _, item in ipairs(itemsFolder:GetChildren()) do
        for _, itemName in ipairs(itemNames) do
            if item.Name == itemName then
                for _, position in ipairs(positions) do
                    local targetPosition
                    if position == "LocalPlayer" then
                        if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            return
                        end
                        targetPosition = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0)
                    elseif position == "Campfire" then
                        targetPosition = Vector3.new(0, 19, 0)
                    elseif position == "Scrapper" then
                        local scrapper = workspace.Map.Campground.Scrapper
                        if scrapper and scrapper:FindFirstChild("GlowEffect") then
                            targetPosition = scrapper.GlowEffect.Position + Vector3.new(0, 19, 0)
                        else
                            return
                        end
                    elseif position == "Freezer" then
                        local freezer = workspace:FindFirstChild("Structures") and workspace.Structures:FindFirstChild("Freezer")
                        if freezer and freezer:IsA("Model") then
                            local autoStack = freezer:FindFirstChild("AutoStack")
                            if autoStack then
                                local touchZone = autoStack:FindFirstChild("TouchZone")
                                if touchZone and touchZone:IsA("BasePart") then
                                    targetPosition = touchZone.Position + Vector3.new(0, 3, 0)
                                else
                                    return
                                end
                            else
                                return
                            end
                        else
                            return
                        end
                    else
                        return
                    end
                    moveItemToPos(item, targetPosition)
                    task.wait(0.1)
                end
            end
        end
    end
end

-- Auto drag loop for all items
local function autoDragLoop()
    task.spawn(function()
        while autoDragActive do
            if #selectedItemToBring > 0 and #selectedPosition > 0 then
                dragAndDropItem(selectedItemToBring, selectedPosition)
            else
                autoDragActive = false
                sections.AutoDetectItems:GetToggle("AutoDragItems"):Set(false)
                break
            end
            task.wait(0.1)
        end
    end)
end

-- Auto drag loop for scrap items
local function autoDragScrapLoop()
    task.spawn(function()
        while autoDragScrapActive do
            if #selectedScrapItem > 0 and #selectedScrapPosition > 0 then
                dragAndDropItem(selectedScrapItem, selectedScrapPosition)
            else
                autoDragScrapActive = false
                sections.ScrapItems:GetToggle("AutoDragScrapItems"):Set(false)
                break
            end
            task.wait(0.1)
        end
    end)
end

-- Auto drag loop for fuel items
local function autoDragFuelLoop()
    task.spawn(function()
        while autoDragFuelActive do
            if #selectedFuelItem > 0 and #selectedFuelPosition > 0 then
                dragAndDropItem(selectedFuelItem, selectedFuelPosition)
            else
                autoDragFuelActive = false
                sections.FuelItems:GetToggle("AutoDragFuelItems"):Set(false)
                break
            end
            task.wait(0.1)
        end
    end)
end

local function equipTool(tool)
    if tool then
        RemoteEvents.EquipItemHandle:FireServer("FireAllClients", tool)
    end
end

local function unequipTool(tool)
    if tool then
        RemoteEvents.UnequipItemHandle:FireServer("FireAllClients", tool)
    end
end

-- Modified Kill Aura to attack all mobs simultaneously with minimal delay
local function killAuraLoop()
    while killAuraActive do
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local tool, damageID = getAnyToolWithDamageID()
            if tool and damageID then
                equipTool(tool)
                local mobs = Workspace.Characters:GetChildren()
                for _, mob in ipairs(mobs) do
                    if mob:IsA("Model") then
                        local part = mob:FindFirstChildWhichIsA("BasePart")
                        if part and (part.Position - hrp.Position).Magnitude <= killAuraRange then
                            pcall(function()
                                RemoteEvents.ToolDamageObject:InvokeServer(
                                    mob,
                                    tool,
                                    damageID,
                                    CFrame.new(part.Position)
                                )
                            end)
                        end
                    end
                end
            else
                warn("No supported tool found in inventory")
                task.wait(0.03)
            end
        else
            task.wait(0.05)
        end
        task.wait(0.03) -- Minimal delay for next loop iteration
    end
end

local originalTreeCFrames = {}
local treesBrought = false

local function getAllSmallTrees()
    local trees = {}
    local function scan(folder)
        for _, obj in ipairs(folder:GetChildren()) do
            if obj:IsA("Model") and obj.Name == "Small Tree" then
                table.insert(trees, obj)
            end
        end
    end

    local map = Workspace:FindFirstChild("Map")
    if map then
        if map:FindFirstChild("Foliage") then scan(map.Foliage) end
        if map:FindFirstChild("Landmarks") then scan(map.Landmarks) end
    end
    return trees
end

local function findTrunk(tree)
    for _, part in ipairs(tree:GetDescendants()) do
        if part:IsA("BasePart") and part.Name == "Trunk" then return part end
    end
end

local function bringAllTrees()
    local target = CFrame.new(rootPart.Position + rootPart.CFrame.LookVector * 10)
    for _, tree in ipairs(getAllSmallTrees()) do
        local trunk = findTrunk(tree)
        if trunk then
            if not originalTreeCFrames[tree] then originalTreeCFrames[tree] = trunk.CFrame end
            tree.PrimaryPart = trunk
            trunk.Anchored = false
            trunk.CanCollide = false
            task.wait()
            tree:SetPrimaryPartCFrame(target + Vector3.new(math.random(-5,5), 0, math.random(-5,5)))
            trunk.Anchored = true
        end
    end
    treesBrought = true
end

local function restoreTrees()
    for tree, cframe in pairs(originalTreeCFrames) do
        local trunk = findTrunk(tree)
        if trunk then
            tree.PrimaryPart = trunk
            tree:SetPrimaryPartCFrame(cframe)
            trunk.Anchored = true
            trunk.CanCollide = true
        end
    end
    originalTreeCFrames = {}
    treesBrought = false
end

sections.MainFarm:AddToggle("KillAura", {
    Title = "Kill Aura",
    Default = false,
    Description = "Simultaneously attack ALL nearby animals with equipped weapon",
    Callback = function(state)
        killAuraActive = state
        if state then
            task.spawn(killAuraLoop)
        else
            local tool, _ = getAnyToolWithDamageID()
            unequipTool(tool)
        end
    end,
})

sections.MainFarm:AddSlider("KillAuraRange", {
    Title = "Kill Aura Range",
    Description = "Range to detect and attack animals",
    Default = killAuraRange,
    Min = 5,
    Max = 500,
    Increment = 1,
    Callback = function(value)
        killAuraRange = value
    end,
})

sections.MainFarm:AddButton({
    Title = "Show All Weapons",
    Description = "Display information about all detected weapons",
    Callback = function()
        local weapons = getAllWeapons()
        local equippedWeapon = getEquippedWeapon()
        if #weapons > 0 then
            local weaponInfo = "Found " .. #weapons .. " weapon(s):\n\n"
            for i, weapon in pairs(weapons) do
                local damage = weapon:GetAttribute("WeaponDamage") or "Unknown"
                local equippedStatus = equippedWeapon and equippedWeapon == weapon and " (Equipped)" or ""
                weaponInfo = weaponInfo .. i .. ". " .. weapon.Name .. " (Damage: " .. tostring(damage) .. ")" .. equippedStatus .. "\n"
            end
            lib:Dialog({
                Title = "All Weapons",
                Content = weaponInfo,
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        else
            lib:Dialog({
                Title = "No Weapon",
                Content = "No weapons with WeaponDamage attribute found in inventory!",
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        end
    end,
})
autoBreakEnabled = false

sections.MainFarm:AddToggle("KillAura", {
    Title = "Bring All Trees",
    Default = false,
    Description = "Simultaneously bring all small trees to your location",
    Callback = function(state)
    autoBreakEnabled = state
    if state and not treesBrought then
        bringAllTrees()
    elseif not state and treesBrought then
        restoreTrees()
    end
    end,
})




local toggleActive = false

sections.MainFarm:AddToggle("TweenToBoundaries", {
    Title = "Tween Player to Boundary Parts",
    Default = false,
    Description = "Tween LocalPlayer to each part in Boundaries one by one.",
    Callback = function(state)
        toggleActive = state

        if state then
            task.spawn(function()
                local boundaries = workspace:WaitForChild("Map"):WaitForChild("Boundaries")
                for _, part in ipairs(boundaries:GetDescendants()) do
                    if not toggleActive then break end
                    if part:IsA("BasePart") then
                        teleportToTarget(CFrame.new(part.Position + Vector3.new(0, 5, 0)), 0.4)
                        task.wait(0.5)
                    end
                end
            end)
        end
    end,
})

-- Auto Eat Section
local foodDropdown = sections.AutoEat:AddDropdown("FoodSelect", {
    Title = "Select Food to Eat",
    Description = "Choose food items for auto eating",
    Options = getFoodItems(),
    Default = {},
    PlaceHolder = "Select food",
    Multiple = true,
    Callback = function(selected)
        selectedFoodItem = selected or {}
    end
})

sections.AutoEat:AddButton({
    Title = "Refresh Food List",
    Description = "Update the dropdown with current food items",
    Callback = function()
        local foodItems = getFoodItems()
        selectedFoodItem = {}
        if #foodItems > 0 then
            foodDropdown:Refresh(foodItems, true)
            lib:Dialog({
                Title = "Food List Refreshed",
                Content = "Successfully refreshed. Found " .. #foodItems .. " food items.\nPlease reselect food items from the dropdown.",
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        else
            foodDropdown:Refresh({}, true)
            lib:Dialog({
                Title = "No Food Items",
                Content = "No food items found in workspace!",
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        end
    end
})

sections.AutoEat:AddToggle("AutoEat", {
    Title = "Auto Eat",
    Default = false,
    Description = "Automatically eat selected food when hunger is low until max hunger",
    Callback = function(value)
        autoEatActive = value
        if value then
            if #selectedFoodItem == 0 then
                autoEatActive = false
                sections.AutoEat:GetToggle("AutoEat"):Set(false)
                lib:Dialog({
                    Title = "Error",
                    Content = "Please select at least one food item first!",
                    Buttons = {
                        {
                            Title = "OK",
                            Variant = "Primary",
                            Callback = function() end,
                        }
                    }
                })
                return
            end
            autoEatLoop()
            lib:Dialog({
                Title = "Auto Eat Enabled",
                Content = "Auto eat will activate when hunger drops to " .. autoEatThreshold .. " or below.\nIt will eat until hunger reaches " .. maxHunger .. ".",
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        end
    end,
})

sections.AutoEat:AddSlider("EatThreshold", {
    Title = "Auto Eat Threshold",
    Description = "Hunger level to start auto eating",
    Default = 30,
    Min = 0,
    Max = maxHunger,
    Increment = 5,
    Callback = function(value)
        autoEatThreshold = math.clamp(value, 0, maxHunger)
    end,
})

sections.AutoEat:AddButton({
    Title = "Check Current Hunger",
    Description = "Display current hunger level",
    Callback = function()
        local currentHunger = getCurrentHunger()
        local status = ""
        if currentHunger <= autoEatThreshold then
            status = " (Will auto eat until max)"
        elseif currentHunger >= maxHunger then
            status = " (Full)"
        else
            status = " (Normal)"
        end
        lib:Dialog({
            Title = "Hunger Status",
            Content = "Current Hunger: " .. currentHunger .. "/" .. maxHunger .. status .. "\n\nAuto Eat Threshold: " .. autoEatThreshold .. "\nSelected Food: " .. table.concat(selectedFoodItem, ", "),
            Buttons = {
                {
                    Title = "OK",
                    Variant = "Primary",
                    Callback = function() end,
                }
            }
        })
    end,
})


sections.TeleportControls:AddButton({
    Title = "Safe Zone",
    Description = "Teleport to Safe Zone location",
    Callback = function()
        for _, entry in ipairs(storyCoords) do
            local name, coord = entry[1], entry[2]
            if name:lower():find("safezone") then
                teleportToTarget(stringToCFrame(coord), 0.1)
                break -- stop setelah teleport
            end
        end
    end,
})
-- Teleport Controls Section
sections.TeleportControls:AddButton({
    Title = "Teleport to Camp",
    Description = "Teleport to the camp location",
    Callback = function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = CFrame.new(
                13.287363052368164, 3.999999761581421, 0.36212217807769775,
                0.6022269129753113, -2.275036159460342e-08, 0.7983249425888062,
                6.430457055728311e-09, 1, 2.364672191390582e-08,
                -0.7983249425888062, -9.1070981866892e-09, 0.6022269129753113
            )
        end
    end,
})

sections.TeleportControls:AddButton({
    Title = "Teleport to Trader",
    Description = "Teleport to the trader location",
    Callback = function()
        local pos = Vector3.new(-37.08, 3.98, -16.33)
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")
        hrp.CFrame = CFrame.new(pos)
    end,
})

sections.TeleportControls:AddButton({
    Title = "TP to Random Tree",
    Description = "Teleport to a random tree",
    Callback = function()
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:FindFirstChild("HumanoidRootPart", 3)
        if not hrp then return end

        local map = workspace:FindFirstChild("Map")
        if not map then return end
        local foliage = map:FindFirstChild("Foliage") or map:FindFirstChild("Landmarks")
        if not foliage then return end

        local trees = {}
        for _, obj in ipairs(foliage:GetChildren()) do
            if obj.Name == "Small Tree" and obj:IsA("Model") then
                local trunk = obj:FindFirstChild("Trunk") or obj.PrimaryPart
                if trunk then
                    table.insert(trees, trunk)
                end
            end
        end

        if #trees > 0 then
            local trunk = trees[math.random(1, #trees)]
            local treeCFrame = trunk.CFrame
            local rightVector = treeCFrame.RightVector
            local targetPosition = treeCFrame.Position + rightVector * 3
            hrp.CFrame = CFrame.new(targetPosition)
        end
    end,
})

-- Bring Items Section
sections.BringItems:AddButton({
    Title = "Bring Everything",
    Description = "Bring all items to your location",
    Callback = function()
        local count = 0
        for _, item in ipairs(workspace.Items:GetChildren()) do
            local targetPosition = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0)
            moveItemToPos(item, targetPosition)
            count = count + 1
            task.wait(0.1)
        end
        lib:Dialog({
            Title = "Success",
            Content = "Brought " .. count .. " items to your location!",
            Buttons = {
                {
                    Title = "OK",
                    Variant = "Primary",
                    Callback = function() end,
                }
            }
        })
    end,
})

sections.BringItems:AddButton({
    Title = "Auto Cook Meat",
    Description = "Bring meat to campfire for cooking",
    Callback = function()
        local campfirePos = Vector3.new(1.87, 4.33, -3.67)
        local count = 0
        for _, item in pairs(workspace.Items:GetChildren()) do
            if item:IsA("Model") or item:IsA("BasePart") then
                local name = item.Name:lower()
                if name:find("meat") then
                    local targetPosition = campfirePos + Vector3.new(math.random(-2, 2), 0.5, math.random(-2, 2))
                    moveItemToPos(item, targetPosition)
                    count = count + 1
                    task.wait(0.1)
                end
            end
        end
        lib:Dialog({
            Title = "Success",
            Content = "Brought " .. count .. " meat items to campfire!",
            Buttons = {
                {
                    Title = "OK",
                    Variant = "Primary",
                    Callback = function() end,
                }
            }
        })
    end,
})

sections.BringItems:AddButton({
    Title = "Bring Lost Child",
    Description = "Bring lost child NPCs",
    Callback = function()
        local count = 0
        for _, model in ipairs(workspace:GetDescendants()) do
            if model:IsA("Model") and model.Name:lower():find("lost") and model:FindFirstChild("HumanoidRootPart") then
                local targetPosition = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 2, 0)
                moveItemToPos(model, targetPosition)
                count = count + 1
                task.wait(0.1)
            end
        end
    end,
})

-- Auto Detect Items Section
local itemDropdown = sections.AutoDetectItems:AddDropdown("ItemSelect", {
    Title = "Select Items to Bring",
    Description = "Choose items from workspace.Items",
    Options = getAllItemsFromWorkspace(),
    Default = {},
    PlaceHolder = "Select items",
    Multiple = true,
    Callback = function(selected)
        selectedItemToBring = selected or {}
    end
})

local positionDropdown = sections.AutoDetectItems:AddDropdown("PositionSelect", {
    Title = "Select Destinations",
    Description = "Choose where to bring the selected items",
    Options = {"LocalPlayer", "Campfire", "Scrapper", "Freezer"},
    Default = {"LocalPlayer"},
    PlaceHolder = "Select positions",
    Multiple = true,
    Callback = function(selected)
        selectedPosition = selected or {"LocalPlayer"}
    end
})

sections.AutoDetectItems:AddToggle("AutoDragItems", {
    Title = "Auto Drag Items",
    Default = false,
    Description = "Automatically drag and drop selected items to chosen positions",
    Callback = function(value)
        autoDragActive = value
        if value then
            if #selectedItemToBring == 0 or #selectedPosition == 0 then
                autoDragActive = false
                sections.AutoDetectItems:GetToggle("AutoDragItems"):Set(false)
                lib:Dialog({
                    Title = "Error",
                    Content = "Please select at least one item and position first!",
                    Buttons = {
                        {
                            Title = "OK",
                            Variant = "Primary",
                            Callback = function() end,
                        }
                    }
                })
                return
            end
            autoDragLoop()
        end
    end,
})

sections.AutoDetectItems:AddButton({
    Title = "Refresh Item List",
    Description = "Update the dropdown with current items in workspace",
    Callback = function()
        local items = getAllItemsFromWorkspace()
        selectedItemToBring = {}
        if #items > 0 then
            itemDropdown:Refresh(items, true)
            lib:Dialog({
                Title = "Items Refreshed",
                Content = "Successfully refreshed. Found " .. #items .. " items.\nPlease reselect items from the dropdown.",
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        else
            itemDropdown:Refresh({}, true)
            lib:Dialog({
                Title = "No Items",
                Content = "No items found!",
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        end
    end
})

sections.AutoDetectItems:AddButton({
    Title = "Bring Selected Items",
    Description = "Bring all instances of the selected items to selected positions",
    Callback = function()
        if #selectedItemToBring > 0 and #selectedPosition > 0 then
            local count = bringItemsByName(selectedItemToBring, selectedPosition)
            lib:Dialog({
                Title = "Success",
                Content = "Brought " .. count .. " items (" .. table.concat(selectedItemToBring, ", ") .. ") to " .. table.concat(selectedPosition, ", ") .. "!",
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        else
            lib:Dialog({
                Title = "Error",
                Content = "Please select at least one item and position first!\nCurrent items: " .. table.concat(selectedItemToBring, ", ") .. "\nCurrent positions: " .. table.concat(selectedPosition, ", "),
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        end
    end,
})

-- Scrap Items Section
local scrapDropdown = sections.ScrapItems:AddDropdown("ScrapSelect", {
    Title = "Select Scrappable Items",
    Description = "Choose scrappable items from workspace.Items",
    Options = getScrappableItems(),
    Default = {},
    PlaceHolder = "Select scrap items",
    Multiple = true,
    Callback = function(selected)
        selectedScrapItem = selected or {}
    end
})

local scrapPositionDropdown = sections.ScrapItems:AddDropdown("ScrapPositionSelect", {
    Title = "Select Destinations",
    Description = "Choose where to bring the scrappable items",
    Options = {"Scrapper"},
    Default = {"Scrapper"},
    PlaceHolder = "Select positions",
    Multiple = true,
    Callback = function(selected)
        selectedScrapPosition = selected or {"Scrapper"}
    end
})

sections.ScrapItems:AddToggle("AutoDragScrapItems", {
    Title = "Auto Drag Scrap Items",
    Default = false,
    Description = "Automatically drag and drop selected scrap items to chosen positions",
    Callback = function(value)
        autoDragScrapActive = value
        if value then
            if #selectedScrapItem == 0 or #selectedScrapPosition == 0 then
                autoDragScrapActive = false
                sections.ScrapItems:GetToggle("AutoDragScrapItems"):Set(false)
                lib:Dialog({
                    Title = "Error",
                    Content = "Please select at least one scrap item and position first!",
                    Buttons = {
                        {
                            Title = "OK",
                            Variant = "Primary",
                            Callback = function() end,
                        }
                    }
                })
                return
            end
            autoDragScrapLoop()
        end
    end,
})

local scrapItems = getScrappableItems()
selectedScrapItem = {}
if #scrapItems > 0 then
    scrapDropdown:Refresh(scrapItems, true)
    else
    scrapDropdown:Refresh({}, true)
end
sections.ScrapItems:AddButton({
    Title = "Bring Selected Scrap Items",
    Description = "Bring all instances of the selected scrappable items",
    Callback = function()
        if #selectedScrapItem > 0 and #selectedScrapPosition > 0 then
            local count = bringItemsByName(selectedScrapItem, selectedScrapPosition)
            lib:Dialog({
                Title = "Success",
                Content = "Brought " .. count .. " scrappable items (" .. table.concat(selectedScrapItem, ", ") .. ") to " .. table.concat(selectedScrapPosition, ", ") .. "!",
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        else
            lib:Dialog({
                Title = "Error",
                Content = "Please select at least one scrappable item and position first!\nCurrent items: " .. table.concat(selectedScrapItem, ", ") .. "\nCurrent positions: " .. table.concat(selectedScrapPosition, ", "),
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        end
    end,
})

-- Fuel Items Section
local fuelDropdown = sections.FuelItems:AddDropdown("FuelSelect", {
    Title = "Select Fuel Items",
    Description = "Choose fuel items from workspace.Items",
    Options = getFuelItems(),
    Default = {},
    PlaceHolder = "Select fuel items",
    Multiple = true,
    Callback = function(selected)
        selectedFuelItem = selected or {}
    end
})

local fuelPositionDropdown = sections.FuelItems:AddDropdown("FuelPositionSelect", {
    Title = "Select Destinations",
    Description = "Choose where to bring the fuel items",
    Options = {"Campfire", "Scrapper"},
    Default = {"Campfire"},
    PlaceHolder = "Select positions",
    Multiple = true,
    Callback = function(selected)
        selectedFuelPosition = selected or {"Campfire"}
    end
})

sections.FuelItems:AddToggle("AutoDragFuelItems", {
    Title = "Auto Drag Fuel Items",
    Default = false,
    Description = "Automatically drag and drop selected fuel items to chosen positions",
    Callback = function(value)
        autoDragFuelActive = value
        if value then
            if #selectedFuelItem == 0 or #selectedFuelPosition == 0 then
                autoDragFuelActive = false
                sections.FuelItems:GetToggle("AutoDragFuelItems"):Set(false)
                lib:Dialog({
                    Title = "Error",
                    Content = "Please select at least one fuel item and position first!",
                    Buttons = {
                        {
                            Title = "OK",
                            Variant = "Primary",
                            Callback = function() end,
                        }
                    }
                })
                return
            end
            autoDragFuelLoop()
        end
    end,
})
local fuelItems = getFuelItems()
selectedFuelItem = {}
if #fuelItems > 0 then
 fuelDropdown:Refresh(fuelItems, true)
else
 fuelDropdown:Refresh({}, true)
end


sections.FuelItems:AddButton({
    Title = "Bring Selected Fuel Items",
    Description = "Bring all instances of the selected fuel items",
    Callback = function()
        if #selectedFuelItem > 0 and #selectedFuelPosition > 0 then
            local count = bringItemsByName(selectedFuelItem, selectedFuelPosition)
            lib:Dialog({
                Title = "Success",
                Content = "Brought " .. count .. " fuel items (" .. table.concat(selectedFuelItem, ", ") .. ") to " .. table.concat(selectedFuelPosition, ", ") .. "!",
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        else
            lib:Dialog({
                Title = "Error",
                Content = "Please select at least one fuel item and position first!\nCurrent items: " .. table.concat(selectedFuelItem, ", ") .. "\nCurrent positions: " .. table.concat(selectedFuelPosition, ", "),
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        end
    end,
})

-- Chest Finder Section
local chestDropdown
local chestsData = {}

chestDropdown = sections.ChestFinder:AddDropdown("ChestSelect", {
    Title = "Select Chests to Teleport",
    Description = "Choose chests from workspace to teleport to",
    Options = {},
    Default = {},
    PlaceHolder = "Select chests",
    Multiple = true,
    Callback = function(selected)
        selectedChestToTeleport = selected or {}
    end
})

sections.ChestFinder:AddButton({
    Title = "Refresh Chest List",
    Description = "Update the dropdown with current chests in workspace",
    Callback = function()
        local chests, chestData = getAllChestsFromWorkspace()
        chestsData = chestData
        selectedChestToTeleport = {}
        if #chests > 0 then
            chestDropdown:Refresh(chests, true)
            lib:Dialog({
                Title = "Chests Refreshed",
                Content = "Successfully refreshed. Found " .. #chests .. " chests.\nPlease select chests from the dropdown.",
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        else
            chestDropdown:Refresh({}, true)
            lib:Dialog({
                Title = "No Chests",
                Content = "No chests found in workspace!",
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        end
    end
})

sections.ChestFinder:AddButton({
    Title = "Teleport to Selected Chests",
    Description = "Teleport to the selected chest locations",
    Callback = function()
        if #selectedChestToTeleport > 0 and chestsData[selectedChestToTeleport[1]] then
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                for _, chestName in ipairs(selectedChestToTeleport) do
                    local chestData = chestsData[chestName]
                    if chestData and chestData.position then
                        local teleportPosition = chestData.position + Vector3.new(0, 2, 3)
                        character.HumanoidRootPart.CFrame = CFrame.new(teleportPosition)
                        task.wait(0.5)
                    end
                end
                lib:Dialog({
                    Title = "Success",
                    Content = "Teleported to selected chests!",
                    Buttons = {
                        {
                            Title = "OK",
                            Variant = "Primary",
                            Callback = function() end,
                        }
                    }
                })
            else
                lib:Dialog({
                    Title = "Error",
                    Content = "Could not teleport to chests. Character not found!",
                    Buttons = {
                        {
                            Title = "OK",
                            Variant = "Primary",
                            Callback = function() end,
                        }
                    }
                })
            end
        else
            lib:Dialog({
                Title = "Error",
                Content = "Please select at least one chest first!\nCurrent selection: " .. table.concat(selectedChestToTeleport, ", "),
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        end
    end,
})

sections.ChestFinder:AddButton({
    Title = "Teleport to Nearest Chest",
    Description = "Automatically teleport to the closest chest",
    Callback = function()
        local character = LocalPlayer.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            lib:Dialog({
                Title = "Error",
                Content = "Character not found!",
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
            return
        end

        local playerPosition = character.HumanoidRootPart.Position
        local nearestChest = nil
        local nearestDistance = math.huge

        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Model") and (obj.Name:lower():find("chest") or obj.Name:lower():find("crate") or obj.Name:lower():find("box")) then
                local rootPart = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChildWhichIsA("BasePart")
                if rootPart then
                    local distance = (rootPart.Position - playerPosition).Magnitude
                    if distance < nearestDistance then
                        nearestDistance = distance
                        nearestChest = {
                            model = obj,
                            position = rootPart.Position,
                            name = obj.Name
                        }
                    end
                end
            end
        end

        if nearestChest then
            local teleportPosition = nearestChest.position + Vector3.new(0, 2, 3)
            character.HumanoidRootPart.CFrame = CFrame.new(teleportPosition)
            lib:Dialog({
                Title = "Success",
                Content = "Teleported to nearest chest: " .. nearestChest.name .. "\nDistance: " .. math.floor(nearestDistance) .. " studs",
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        else
            lib:Dialog({
                Title = "Error",
                Content = "No chests found in workspace!",
                Buttons = {
                    {
                        Title = "OK",
                        Variant = "Primary",
                        Callback = function() end,
                    }
                }
            })
        end
    end,
})

-- Hitbox Controls Section
local hitboxSettings = {Wolf=false, Bunny=false, Cultist=false, Show=false, Size=10}

local function updateHitboxForModel(model)
    local root = model:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local name = model.Name:lower()
    local shouldResize =
        (hitboxSettings.Wolf and (name:find("wolf") or name:find("alpha"))) or
        (hitboxSettings.Bunny and name:find("bunny")) or
        (hitboxSettings.Cultist and (name:find("cultist") or name:find("cross")))
    if shouldResize then
        root.Size = Vector3.new(hitboxSettings.Size, hitboxSettings.Size, hitboxSettings.Size)
        root.Transparency = hitboxSettings.Show and 0.5 or 1
        root.Color = Color3.fromRGB(255, 255, 255)
        root.Material = Enum.Material.Neon
        root.CanCollide = false
    end
end

task.spawn(function()
    while true do
        for _, model in ipairs(workspace:GetDescendants()) do
            if model:IsA("Model") and model:FindFirstChild("HumanoidRootPart") then
                updateHitboxForModel(model)
            end
        end
        task.wait(2)
    end
end)

sections.HitboxControls:AddToggle("WolfHitbox", {
    Title = "Expand Wolf Hitbox",
    Default = false,
    Description = "Expand wolf enemy hitboxes",
    Callback = function(value)
        hitboxSettings.Wolf = value
    end,
})

sections.HitboxControls:AddToggle("BunnyHitbox", {
    Title = "Expand Bunny Hitbox",
    Default = false,
    Description = "Expand bunny enemy hitboxes",
    Callback = function(value)
        hitboxSettings.Bunny = value
    end,
})

sections.HitboxControls:AddToggle("CultistHitbox", {
    Title = "Expand Cultist Hitbox",
    Default = false,
    Description = "Expand cultist enemy hitboxes",
    Callback = function(value)
        hitboxSettings.Cultist = value
    end,
})

sections.HitboxControls:AddSlider("HitboxSize", {
    Title = "Hitbox Size",
    Description = "Size of expanded hitboxes",
    Default = 10,
    Min = 2,
    Max = 30,
    Increment = 1,
    Callback = function(value)
        hitboxSettings.Size = value
    end,
})

sections.HitboxControls:AddToggle("ShowHitbox", {
    Title = "Show Hitbox (Transparency)",
    Default = false,
    Description = "Make hitboxes visible",
    Callback = function(value)
        hitboxSettings.Show = value
    end,
})

-- Misc Features Section
getgenv().speedEnabled = false
getgenv().speedValue = 28

sections.MiscFeatures:AddToggle("SpeedHack", {
    Title = "Speed Hack",
    Default = false,
    Description = "Increase movement speed",
    Callback = function(value)
        getgenv().speedEnabled = value
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hum = char:FindFirstChild("Humanoid")
        if hum then 
            hum.WalkSpeed = value and getgenv().speedValue or 16 
        end
    end,
})

sections.MiscFeatures:AddSlider("SpeedValue", {
    Title = "Speed Value",
    Description = "Speed multiplier value",
    Default = 28,
    Min = 16,
    Max = 600,
    Increment = 1,
    Callback = function(value)
        getgenv().speedValue = value
        if getgenv().speedEnabled then
            local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum then 
                hum.WalkSpeed = value 
            end
        end
    end,
})

-- Performance Section
local showFPS, showPing = true, true
local fpsText, msText = Drawing.new("Text"), Drawing.new("Text")
fpsText.Size, fpsText.Position, fpsText.Color, fpsText.Center, fpsText.Outline, fpsText.Visible =
    16, Vector2.new(Camera.ViewportSize.X-100, 10), Color3.fromRGB(0,255,0), false, true, showFPS
msText.Size, msText.Position, msText.Color, msText.Center, msText.Outline, msText.Visible =
    16, Vector2.new(Camera.ViewportSize.X-100, 30), Color3.fromRGB(0,255,0), false, true, showPing
local fpsCounter, fpsLastUpdate = 0, tick()

RunService.RenderStepped:Connect(function()
    fpsCounter += 1
    if tick() - fpsLastUpdate >= 1 then
        if showFPS then
            fpsText.Text = "FPS: " .. tostring(fpsCounter)
            fpsText.Visible = true
        else
            fpsText.Visible = false
        end
        if showPing then
            local pingStat = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]
            local ping = pingStat and math.floor(pingStat:GetValue()) or 0
            msText.Text = "Ping: " .. ping .. " ms"
            if ping <= 60 then
                msText.Color = Color3.fromRGB(0, 255, 0)
            elseif ping <= 120 then
                msText.Color = Color3.fromRGB(255, 165, 0)
            else
                msText.Color = Color3.fromRGB(255, 0, 0)
            end
            msText.Visible = true
        else
            msText.Visible = false
        end
        fpsCounter = 0
        fpsLastUpdate = tick()
    end
end)

sections.Performance:AddToggle("ShowFPS", {
    Title = "Show FPS",
    Default = true,
    Description = "Display FPS counter",
    Callback = function(value)
        showFPS = value
        fpsText.Visible = value
    end,
})

sections.Performance:AddToggle("ShowPing", {
    Title = "Show Ping (ms)",
    Default = true,
    Description = "Display ping counter",
    Callback = function(value)
        showPing = value
        msText.Visible = value
    end,
})

sections.Performance:AddButton({
    Title = "FPS Boost",
    Description = "Apply performance optimizations",
    Callback = function()
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            local lighting = game:GetService("Lighting")
            lighting.Brightness = 0
            lighting.FogEnd = 100
            lighting.GlobalShadows = false
            lighting.EnvironmentDiffuseScale = 0
            lighting.EnvironmentSpecularScale = 0
            lighting.ClockTime = 14
            lighting.OutdoorAmbient = Color3.new(0, 0, 0)
            local terrain = workspace:FindFirstChildOfClass("Terrain")
            if terrain then
                terrain.WaterWaveSize = 0
                terrain.WaterWaveSpeed = 0
                terrain.WaterReflectance = 0
                terrain.WaterTransparency = 1
            end
            for _, obj in ipairs(lighting:GetDescendants()) do
                if obj:IsA("PostEffect") or obj:IsA("BloomEffect") or obj:IsA("ColorCorrectionEffect") or obj:IsA("SunRaysEffect") or obj:IsA("BlurEffect") then
                    obj.Enabled = false
                end
            end
            for _, obj in ipairs(game:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                    obj.Enabled = false
                elseif obj:IsA("Texture") or obj:IsA("Decal") then
                    obj.Transparency = 1
                end
            end
            for _, part in ipairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CastShadow = false
                end
            end
        end)
        lib:Dialog({
            Title = "Success",
            Content = "FPS Boost has been applied successfully!",
            Buttons = {
                {
                    Title = "OK",
                    Variant = "Primary",
                    Callback = function() end,
                }
            }
        })
    end,
})

-- Config System
FlagsManager:SetLibrary(lib)
FlagsManager:SetIgnoreIndexes({})
FlagsManager:SetFolder("Avantrix/99NF")
FlagsManager:InitSaveSystem(tabs.Settings)