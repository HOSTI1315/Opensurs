local success, WindUI = pcall(function()
    return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
end)

if not success or not WindUI then
    warn("⚠️ UI failed to loaded!")
    return
else
    print("✓ UI loaded successfully!")
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Shared = ReplicatedStorage:WaitForChild("Shared")
local Knit = require(Shared:WaitForChild("Packages").Knit)
local Utils = require(Shared:WaitForChild("Utils"))
local Ore = require(Shared:WaitForChild("Data"):WaitForChild("Ore"))

local function getCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local function getHumanoidRootPart()
    local char = getCharacter()
    return char:WaitForChild("HumanoidRootPart")
end

local function getHumanoid()
    local char = getCharacter()
    return char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")
end

local Window = WindUI:CreateWindow({
    Title = "STREE HUB",
    Icon = "rbxassetid://86466533300907",
    Author = "KirsiaSC | The Forge",
    Folder = "STREE_HUB",
    Size = UDim2.fromOffset(260, 290),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 170,
    HasOutline = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            WindUI:SetTheme("Dark")
        end,
    },
})

Window:EditOpenButton({
    Enabled = false,
})

local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local G2L = {}

G2L["ScreenGui_1"] = Instance.new("ScreenGui")
G2L["ScreenGui_1"].Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
G2L["ScreenGui_1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CollectionService:AddTag(G2L["ScreenGui_1"], "main")

G2L["ButtonRezise_2"] = Instance.new("ImageButton")
G2L["ButtonRezise_2"].Parent = G2L["ScreenGui_1"]
G2L["ButtonRezise_2"].BorderSizePixel = 0
G2L["ButtonRezise_2"].Draggable = true
G2L["ButtonRezise_2"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
G2L["ButtonRezise_2"].Image = "rbxassetid://123032091977400"
G2L["ButtonRezise_2"].Size = UDim2.new(0, 47, 0, 47)
G2L["ButtonRezise_2"].Position = UDim2.new(0.13, 0, 0.03, 0)

local corner = Instance.new("UICorner", G2L["ButtonRezise_2"])
corner.CornerRadius = UDim.new(0, 8)

local neon = Instance.new("UIStroke", G2L["ButtonRezise_2"])
neon.Thickness = 2
neon.Color = Color3.fromRGB(0, 255, 0)
neon.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

G2L["ButtonRezise_2"].MouseButton1Click:Connect(function()
    G2L["ButtonRezise_2"].Visible = false
    Window:Open()
end)

Window:OnClose(function()
    G2L["ButtonRezise_2"].Visible = true
end)

Window:OnDestroy(function()
    G2L["ButtonRezise_2"].Visible = false
end)

G2L["ButtonRezise_2"].Visible = false

Window:Tag({
    Title = "Version",
    Color = Color3.fromRGB(0, 255, 0),
    Radius = 17,
})

Window:Tag({
    Title = "Dev",
    Color = Color3.fromRGB(0, 0, 0),
    Radius = 17,
})

WindUI:Notify({
    Title = "STREE HUB Loaded",
    Content = "UI loaded successfully!",
    Duration = 3,
    Icon = "bell",
})

local Tab1 = Window:Tab({
    Title = "Info",
    Icon = "info",
})

local Section = Tab1:Section({
    Title = "Community Support",
    TextXAlignment = "Left",
    TextSize = 17,
})

Tab1:Divider()

Tab1:Button({
    Title = "Discord",
    Desc = "click to copy link",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/jdmX43t5mY")
        end
    end
})

Tab1:Button({
    Title = "WhatsApp",
    Desc = "click to copy link",
    Callback = function()
        if setclipboard then
            setclipboard("https://whatsapp.com/channel/0029VbAwRihKAwEtwyowt62N")
        end
    end
})

Tab1:Divider()

Tab1:Paragraph({
    Title = "Support",
    Desc = "Every time there is a game update or someone reports something, I will fix it as soon as possible."
})

Tab1:Keybind({
    Title = "Close/Open UI",
    Desc = "Keybind to Close/Open UI",
    Value = "G",
    Callback = function(v)
        Window:SetToggleKey(Enum.KeyCode[v])
    end
})

local Tab2 = Window:Tab({
    Title = "Main",
    Icon = "landmark"
})

local oreFarm = {
    enabled = false,
    tweenSpeed = 120,
    selectedRockTypes = {},
    selectedOreTypes = {},
    rocksESPEnabled = false,
    pickaxeName = "?",
    pickaxeDamage = 0,
    maxRockTime = 4,
    mineInterval = 0.1,
    scanDistance = 500,
}

Tab2:Slider({
    Title = "Scan Distance",
    Step = 1,
    Value = {
        Min = 20,
        Max = 120,
        Default = 70,
    },
    Callback = function(value)
        oreFarm.scanDistance = value
    end
})

Tab2:Slider({
    Title = "Tween Speed",
    Step = 1,
    Value = {
        Min = 20,
        Max = 100,
        Default = 30,
    },
    Callback = function(value)
        oreFarm.tweenSpeed = value
    end
})

local function buildRockOptions()
    local assets = ReplicatedStorage:FindFirstChild("Assets")
    local rocksFolder = assets and assets:FindFirstChild("Rocks")
    local options = {}
    if rocksFolder then
        for _, rock in ipairs(rocksFolder:GetChildren()) do
            if rock.Name and rock.Name ~= "" then
                table.insert(options, rock.Name)
            end
        end
    end
    table.sort(options)
    if #options == 0 then
        warn("[Forge] No rock templates found in ReplicatedStorage.Assets.Rocks")
    end
    return options
end

local function buildOreOptions()
    local assets = ReplicatedStorage:FindFirstChild("Assets")
    local oresFolder = assets and assets:FindFirstChild("Ores")
    local options = {}
    if oresFolder then
        for _, ore in ipairs(oresFolder:GetChildren()) do
            if ore.Name and ore.Name ~= "" then
                table.insert(options, ore.Name)
            end
        end
    end
    table.sort(options)
    return options
end

local rockOptions = buildRockOptions()
local oreOptions = buildOreOptions()

if #rockOptions == 0 then
    table.insert(rockOptions, "Boulder")
end

if #oreOptions == 0 then
    table.insert(oreOptions, "Any")
end

oreFarm.selectedRockTypes = { rockOptions[1] }
oreFarm.selectedOreTypes = { oreOptions[1] }

local function listToSet(list)
    local set = {}
    for _, v in ipairs(list) do
        set[tostring(v)] = true
    end
    return set
end

local function RefreshRockOptions()
    rockOptions = buildRockOptions()
    if #rockOptions == 0 then
        rockOptions = { "Boulder" }
    end
    if not oreFarm.selectedRockTypes or #oreFarm.selectedRockTypes == 0 then
        oreFarm.selectedRockTypes = { rockOptions[1] }
    end
end

Tab2:Dropdown({
    Title = "Rock Types to Farm",
    Values = oreFarm.selectedRockTypes,
    Value = rockOptions,
    Multi = true,
    AllowNone = true,
    Callback = function(opts)
        if type(opts) == "table" and #opts > 0 then
            oreFarm.selectedRockTypes = opts
        end
    end
})

Tab2:Button({
    Title = "Refresh Rock Types",
    Locked = false,
    Callback = function()
        RefreshRockOptions()
    end
})

Tab2:Dropdown({
    Title = "Ore Types to Farm",
    Values = oreFarm.selectedOreTypes,
    Value = oreOptions,
    Multi = true,
    AllowNone = true,
    Callback = function(opts)
        if type(opts) == "table" and #opts > 0 then
            oreFarm.selectedOreTypes = opts
        end
    end
})

Tab2:Slider({
    Title = "Max Time Per Rock (s)",
    Step = 1,
    Value = {
        Min = 1,
        Max = 20,
        Default = 4,
    },
    Callback = function(value)
        oreFarm.maxRockTime = value
    end
})

Tab2:Slider({
    Title = "Mine Interval (s)",
    Step = 0.01,
    Value = {
        Min = 0.02,
        Max = 0.5,
        Default = 0.1,
    },
    Callback = function(value)
        oreFarm.mineInterval = value
    end
})

local pickaxeTemplateNames

local function buildPickaxeTemplateNames()
    local result = {}
    local assets = ReplicatedStorage:FindFirstChild("Assets")
    local equipFolder = assets and assets:FindFirstChild("Equipments")
    local pickaxesFolder = equipFolder and equipFolder:FindFirstChild("Pickaxes")
    if pickaxesFolder then
        for _, tool in ipairs(pickaxesFolder:GetChildren()) do
            local name = tool.Name
            if name and name ~= "" then
                result[string.lower(name)] = true
            end
        end
    end
    return result
end

local function initPickaxeTemplates()
    if not pickaxeTemplateNames then
        pickaxeTemplateNames = buildPickaxeTemplateNames()
    end
end

local function isPickaxe(tool)
    if not (tool and tool:IsA("Tool")) then return false end
    initPickaxeTemplates()
    local name = string.lower(tool.Name or "")
    local itemNameAttr = tool:GetAttribute("ItemName")
    local itemNameLower = itemNameAttr and string.lower(tostring(itemNameAttr)) or ""
    if pickaxeTemplateNames[name] or (itemNameLower ~= "" and pickaxeTemplateNames[itemNameLower]) then
        return true
    end
    if name:find("pickaxe", 1, true) or itemNameLower:find("pickaxe", 1, true) then
        return true
    end
    return false
end

local function ensurePickaxeEquipped()
    local char = getCharacter()
    local hum = getHumanoid()
    for _, t in ipairs(char:GetChildren()) do
        if isPickaxe(t) then
            return t
        end
    end
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if not backpack then return nil end
    for _, t in ipairs(backpack:GetChildren()) do
        if isPickaxe(t) then
            pcall(function()
                if hum then
                    hum:EquipTool(t)
                else
                    t.Parent = char
                end
            end)
            task.wait(0.1)
            return t
        end
    end
    warn("[Forge] No pickaxe found in character or backpack")
    return nil
end

local function updatePickaxeInfoFromGui()
    local char = getCharacter()
    local pickaxeTool = nil
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") and tool:GetAttribute("ItemJSON") then
            pickaxeTool = tool
            break
        end
    end
    if not pickaxeTool then
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        if backpack then
            for _, tool in ipairs(backpack:GetChildren()) do
                if tool:IsA("Tool") and tool:GetAttribute("ItemJSON") then
                    pickaxeTool = tool
                    break
                end
            end
        end
    end
    if not pickaxeTool then
        return
    end
    local itemJson = pickaxeTool:GetAttribute("ItemJSON")
    if type(itemJson) ~= "string" or itemJson == "" then
        return
    end
    local decoded
    local ok = pcall(function()
        decoded = HttpService:JSONDecode(itemJson)
    end)
    if not ok or type(decoded) ~= "table" then
        return
    end
    local pickName = tostring(decoded.Name or "?")
    oreFarm.pickaxeName = pickName
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    if not pg then return end
    local menu = pg:FindFirstChild("Menu")
    if not menu then return end
    local frame1 = menu:FindFirstChild("Frame")
    if not frame1 then return end
    local frame2 = frame1:FindFirstChild("Frame")
    if not frame2 then return end
    local menus = frame2:FindFirstChild("Menus")
    if not menus then return end
    local toolsFolder = menus:FindFirstChild("Tools")
    if not toolsFolder then return end
    local toolsFrame = toolsFolder:FindFirstChild("Frame")
    if not toolsFrame then return end
    local toolGui = toolsFrame:FindFirstChild(pickName)
    if not toolGui then return end
    local statsFrame = toolGui:FindFirstChild("Stats")
    if not statsFrame then return end
    local dmgLabel = statsFrame:FindFirstChild("DMG")
    if not dmgLabel then return end
    if dmgLabel:IsA("TextLabel") then
        local text = tostring(dmgLabel.Text or "")
        local dmg = tonumber(text:match("^(%d+)%s*DMG")) or tonumber(text:match("^(%d+)%D")) or 0
        oreFarm.pickaxeDamage = dmg or 0
    end
end

local function getRocksRoot()
    return workspace:FindFirstChild("Rocks")
end

local function getRockHealthValue(rockModel)
    if not rockModel then
        return nil
    end
    local healthAttr = rockModel:GetAttribute("Health")
    if healthAttr == nil then
        local rockChild = rockModel:FindFirstChild("Rock") or rockModel:FindFirstChild("Boulder")
        if rockChild then
            healthAttr = rockChild:GetAttribute("Health")
        end
    end
    if healthAttr == nil then
        for _, child in ipairs(rockModel:GetChildren()) do
            local attr = child:GetAttribute("Health")
            if attr ~= nil then
                healthAttr = attr
                break
            end
        end
    end
    local numeric = tonumber(healthAttr)
    return numeric
end

local function isRockDestroyed(rockModel)
    if not rockModel or not rockModel.Parent then
        return true
    end
    local numeric = getRockHealthValue(rockModel)
    if numeric ~= nil then
        return numeric <= 0
    end
    return false
end

local function collectAllRocks(maxDist, origin)
    local rocksRoot = getRocksRoot()
    local result = {}
    if not rocksRoot then return result end
    local scanDistSq = maxDist and (maxDist * maxDist)
    for _, folder in ipairs(rocksRoot:GetChildren()) do
        for _, container in ipairs(folder:GetChildren()) do
            if not container or not container.Parent then continue end
            local core = container:IsA("BasePart") and container
                or container.PrimaryPart
                or container:FindFirstChild("HumanoidRootPart")
                or container:FindFirstChildWhichIsA("BasePart")
            if not core then continue end
            if scanDistSq and origin then
                local pos = core.Position
                local distSq = (pos.X - origin.X)^2 + (pos.Y - origin.Y)^2 + (pos.Z - origin.Z)^2
                if distSq > scanDistSq then
                    continue
                end
            end
            if isRockDestroyed(container) then
                continue
            end
            local visual = container:FindFirstChild("Boulder")
            if not visual then
                visual = container:FindFirstChild("Rock")
            end
            if not visual then
                for _, child in ipairs(container:GetChildren()) do
                    if child:IsA("Model") or child:IsA("BasePart") then
                        visual = child
                        break
                    end
                end
            end
            if visual then
                local rockTypeName = container:GetAttribute("RockType") or visual:GetAttribute("RockType") or visual.Name or container.Name
                local requiredDamage = tonumber(container:GetAttribute("RequiredDamage"))
                if not requiredDamage then
                    requiredDamage = tonumber(visual:GetAttribute("RequiredDamage"))
                end
                table.insert(result, {
                    model = container,
                    core = core,
                    rockType = rockTypeName,
                    requiredDamage = requiredDamage,
                    visual = visual,
                })
            end
        end
    end
    return result
end

local function getNearestRock(filteredRockTypes, blacklist)
    local hrp = getHumanoidRootPart()
    if not hrp then return nil end
    local scanDist = tonumber(oreFarm.scanDistance) or 500
    local allRocks = collectAllRocks(scanDist, hrp.Position)
    if #allRocks == 0 then return nil end
    local best
    local bestDist = math.huge
    local currentDmg = tonumber(oreFarm.pickaxeDamage) or 0
    blacklist = blacklist or {}
    for _, info in ipairs(allRocks) do
        if not blacklist[info.model] then
            if filteredRockTypes[info.rockType] then
                local req = tonumber(info.requiredDamage)
                if not req or currentDmg >= req then
                    local dist = (info.core.Position - hrp.Position).Magnitude
                    if dist < bestDist then
                        bestDist = dist
                        best = info
                    end
                end
            end
        end
    end
    return best
end

local movementBusy = false

local function tweenToPosition(targetPos, speed)
    local hrp = getHumanoidRootPart()
    if not hrp then return end
    while movementBusy do
        RunService.Heartbeat:Wait()
    end
    movementBusy = true
    speed = speed or oreFarm.tweenSpeed
    local distance = (targetPos - hrp.Position).Magnitude
    local time = math.max(0.1, distance / math.max(10, speed))
    local tween = TweenService:Create(hrp, TweenInfo.new(time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        CFrame = CFrame.new(targetPos + Vector3.new(0, 3, 0)),
    })
    tween.Completed:Connect(function()
        movementBusy = false
    end)
    tween:Play()
    tween.Completed:Wait()
    movementBusy = false
end

local function getOreNamesForRock(rockModel)
    local names = {}
    local rockFolder = rockModel:FindFirstChild("Rock")
    if not rockFolder then return names end
    for _, inst in ipairs(rockFolder:GetDescendants()) do
        local oreNameAttr = inst:GetAttribute("Ore")
        if oreNameAttr then
            local oreName = tostring(oreNameAttr)
            if oreName ~= "" then
                names[oreName] = true
            end
        end
    end
    return names
end

local function hasDesiredOre(oreNames, desiredSet)
    for name, _ in pairs(oreNames) do
        if desiredSet[name] then
            return true
        end
    end
    return false
end

local function rockHasAnyOre(oreNames)
    for _, _ in pairs(oreNames) do
        return true
    end
    return false
end

local function mineRock(rockInfo, desiredOres)
    local rockModel = rockInfo.model
    local startTick = tick()
    local toolServiceRF = ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ToolService"):WaitForChild("RF")
    local toolActivated = toolServiceRF:WaitForChild("ToolActivated")
    local args = { "Pickaxe" }
    local desiredSet = listToSet(desiredOres)
    local maxTime = tonumber(oreFarm.maxRockTime) or 4
    while oreFarm.enabled and rockModel.Parent and tick() - startTick < maxTime do
        if isRockDestroyed(rockModel) then
            return "destroyed"
        end
        local core = rockInfo.core
        local hrp = getHumanoidRootPart()
        if core and hrp then
            local dist = (core.Position - hrp.Position).Magnitude
            if dist > 18 then
                return "switch"
            end
        end
        local oreNames = getOreNamesForRock(rockModel)
        if rockHasAnyOre(oreNames) then
            if hasDesiredOre(oreNames, desiredSet) then
                pcall(function()
                    toolActivated:InvokeServer(unpack(args))
                end)
                if not rockModel.Parent or isRockDestroyed(rockModel) then
                    return "destroyed"
                end
            else
                return "switch"
            end
        else
            pcall(function()
                toolActivated:InvokeServer(unpack(args))
            end)
        end
        local interval = tonumber(oreFarm.mineInterval) or 0.1
        if interval < 0.02 then interval = 0.02 end
        task.wait(interval)
    end
    return "timeout"
end

local espObjects = {}

local function clearRocksESP()
    for _, data in pairs(espObjects) do
        if data.highlight then pcall(function() data.highlight:Destroy() end) end
        if data.billboard then pcall(function() data.billboard:Destroy() end) end
        if data.beam then pcall(function() data.beam:Destroy() end) end
        if data.attachment then pcall(function() data.attachment:Destroy() end) end
    end
    table.clear(espObjects)
end

local function ensureESPForRock(rockInfo)
    local model = rockInfo.model
    if not model or not model.Parent then return end
    if espObjects[model] then return end
    local core = rockInfo.core
    if not (core and core:IsA("BasePart")) then return end
    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.fromRGB(0, 255, 200)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
    highlight.FillTransparency = 0.2
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Enabled = true
    local visual = rockInfo.visual
    if not visual or not visual.Parent then
        visual = model:FindFirstChild("Boulder") or model:FindFirstChild("Rock") or model
    end
    highlight.Adornee = visual
    highlight.Parent = workspace
    local attachment0 = Instance.new("Attachment")
    attachment0.Parent = core
    attachment0.Position = Vector3.new(0, 2, 0)
    local attachment1 = Instance.new("Attachment")
    attachment1.Parent = core
    attachment1.Position = Vector3.new(0, 20, 0)
    local beam = Instance.new("Beam")
    beam.Attachment0 = attachment0
    beam.Attachment1 = attachment1
    beam.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 200)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 200, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 100, 255))
    })
    beam.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(0.5, 0.1),
        NumberSequenceKeypoint.new(1, 0.8)
    })
    beam.Width0 = 0.5
    beam.Width1 = 2
    beam.FaceCamera = true
    beam.LightEmission = 1
    beam.LightInfluence = 0
    beam.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    beam.TextureMode = Enum.TextureMode.Wrap
    beam.TextureSpeed = 1
    beam.Parent = core
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 150, 0, 50)
    billboard.Adornee = core
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 1000
    billboard.StudsOffset = Vector3.new(0, 5, 0)
    billboard.Parent = model
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    bg.BackgroundTransparency = 0.3
    bg.BorderSizePixel = 0
    bg.Parent = billboard
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 8)
    bgCorner.Parent = bg
    local bgGradient = Instance.new("UIGradient")
    bgGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 80)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 40))
    })
    bgGradient.Rotation = 90
    bgGradient.Parent = bg
    local border = Instance.new("UIStroke")
    border.Color = Color3.fromRGB(0, 255, 200)
    border.Thickness = 2
    border.Transparency = 0
    border.Parent = bg
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 0.6, 0)
    label.Position = UDim2.new(0, 5, 0.1, 0)
    label.BackgroundTransparency = 1
    label.Text = "⛏️ " .. tostring(rockInfo.rockType)
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeTransparency = 0.5
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Parent = bg
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, -10, 0.3, 0)
    distLabel.Position = UDim2.new(0, 5, 0.65, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = "..."
    distLabel.TextColor3 = Color3.fromRGB(100, 255, 200)
    distLabel.TextStrokeTransparency = 0.5
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.Gotham
    distLabel.Parent = bg
    espObjects[model] = {
        highlight = highlight,
        billboard = billboard,
        beam = beam,
        attachment = attachment0,
        distLabel = distLabel,
        core = core,
    }
end

local function updateRocksESP()
    if not oreFarm.rocksESPEnabled then
        clearRocksESP()
        return
    end
    local hrp = getHumanoidRootPart()
    local origin = hrp and hrp.Position
    local scanDist = tonumber(oreFarm.scanDistance) or 500
    local rocks = collectAllRocks(scanDist, origin)
    if origin then
        table.sort(rocks, function(a, b)
            local da = (a.core.Position - origin).Magnitude
            local db = (b.core.Position - origin).Magnitude
            return da < db
        end)
    end
    local limit = 40
    local activeModels = {}
    for i = 1, math.min(#rocks, limit) do
        local info = rocks[i]
        ensureESPForRock(info)
        activeModels[info.model] = true
    end
    if hrp then
        for model, data in pairs(espObjects) do
            if not activeModels[model] then
                if data.highlight then pcall(function() data.highlight:Destroy() end) end
                if data.billboard then pcall(function() data.billboard:Destroy() end) end
                if data.beam then pcall(function() data.beam:Destroy() end) end
                if data.attachment then pcall(function() data.attachment:Destroy() end) end
                espObjects[model] = nil
            elseif data.distLabel and data.core and data.core.Parent then
                local dist = (data.core.Position - hrp.Position).Magnitude
                data.distLabel.Text = string.format("%.0f studs", dist)
            end
        end
    end
end

Tab2:Toggle({
    Title = "Rocks ESP",
    Desc = "Toggle Description",
    Value = false,
    Callback = function(v)
        oreFarm.rocksESPEnabled = v and true or false
        if not oreFarm.rocksESPEnabled then
            clearRocksESP()
        else
            updateRocksESP()
        end
    end
})

Tab2:Toggle({
    Title = "Auto Farm Ores",
    Desc = "Automatic Farm Ore",
    Value = false,
    Callback = function(v)
        oreFarm.enabled = v and true or false
        if not oreFarm.enabled then return end
        task.spawn(function()
            local rockBlacklist = {}
            local blacklistCleanupTimer = 0
            while oreFarm.enabled do
                if tick() - blacklistCleanupTimer > 30 then
                    table.clear(rockBlacklist)
                    blacklistCleanupTimer = tick()
                end
                local pick = ensurePickaxeEquipped()
                if not pick then
                    task.wait(0.1)
                    updatePickaxeInfoFromGui()
                    continue
                end
                updatePickaxeInfoFromGui()
                local rockSet = listToSet(oreFarm.selectedRockTypes)
                local targetRock = getNearestRock(rockSet, rockBlacklist)
                if not targetRock then
                    table.clear(rockBlacklist)
                    task.wait(0.5)
                    continue
                end
                local core = targetRock.core
                if core and core:IsA("BasePart") then
                    pcall(function()
                        tweenToPosition(core.Position, oreFarm.tweenSpeed)
                    end)
                end
                if not oreFarm.enabled then break end
                if not targetRock.model or not targetRock.model.Parent then
                    continue
                end
                local result = mineRock(targetRock, oreFarm.selectedOreTypes)
                if result == "switch" then
                    rockBlacklist[targetRock.model] = true
                    print("[Forge] Blacklisted rock with unwanted ore, finding new target...")
                end
            end
        end)
    end
})

local mobFarm = {
    enabled = false,
    selectedMobs = {},
    attackInterval = 0.1,
    safeHealthPercent = 30,
    mobsESPEnabled = false,
}

local function buildMobOptions()
    local assets = ReplicatedStorage:FindFirstChild("Assets")
    local mobsFolder = assets and assets:FindFirstChild("Mobs")
    local options = {}
    if mobsFolder then
        for _, mob in ipairs(mobsFolder:GetChildren()) do
            if mob.Name and mob.Name ~= "" then
                table.insert(options, mob.Name)
            end
        end
    end
    table.sort(options)
    return options
end

local function normalizeMobName(name)
    return (tostring(name):gsub("%d+$", ""))
end

local mobOptions = buildMobOptions()
if #mobOptions == 0 then
    table.insert(mobOptions, "Zombie")
end
if not mobFarm.selectedMobs or #mobFarm.selectedMobs == 0 then
    mobFarm.selectedMobs = { mobOptions[1] }
end

Tab2:Dropdown({
    Title = "Mobs to Farm",
    Values = mobFarm.selectedMobs,
    Value = mobOptions,
    Multi = true,
    AllowNone = true,
    Callback = function(opts)
        if type(opts) == "table" and #opts > 0 then
            mobFarm.selectedMobs = opts
        end
    end
})

Tab2:Slider({
    Title = "Safe HP % (Mobs)",
    Step = 1,
    Value = {
        Min = 0,
        Max = 50,
        Default = 20,
    },
    Callback = function(value)
        mobFarm.safeHealthPercent = value
    end
})

local function ensureWeaponEquipped()
    local char = getCharacter()
    local hum = getHumanoid()
    for _, t in ipairs(char:GetChildren()) do
        if t:IsA("Tool") and t.Name == "Weapon" then
            return t
        end
    end
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if not backpack then return nil end
    local weapon = backpack:FindFirstChild("Weapon")
    if not (weapon and weapon:IsA("Tool")) then return nil end
    pcall(function()
        if hum then
            hum:EquipTool(weapon)
        else
            weapon.Parent = char
        end
    end)
    task.wait(0.1)
    return weapon
end

local function isMobDead(model)
    if not model then return false end
    local deadFlag = model:FindFirstChild("Dead", true)
    if deadFlag and deadFlag:IsA("BoolValue") then
        return deadFlag.Value == true
    end
    return false
end

local function collectMobs(selectedSet)
    local living = workspace:FindFirstChild("Living")
    local result = {}
    if not living then return result end
    for _, inst in ipairs(living:GetChildren()) do
        local model = inst
        if model:IsA("Model") then
            if isMobDead(model) then
                continue
            end
            local baseName = normalizeMobName(model.Name)
            if selectedSet[baseName] then
                local hrp = model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("HRP")
                if hrp and hrp:IsA("BasePart") then
                    table.insert(result, {
                        model = model,
                        hrp = hrp,
                        mobType = baseName,
                    })
                end
            end
        end
    end
    return result
end

local function getNearestMob(selectedSet)
    local mobs = collectMobs(selectedSet)
    if #mobs == 0 then return nil end
    local hrp = getHumanoidRootPart()
    if not hrp then return nil end
    local best
    local bestDist = math.huge
    for _, info in ipairs(mobs) do
        local dist = (info.hrp.Position - hrp.Position).Magnitude
        if dist < bestDist then
            bestDist = dist
            best = info
        end
    end
    return best
end

local function attackMob(mobInfo)
    local mobModel = mobInfo.model
    local hrp = getHumanoidRootPart()
    if not (mobModel and mobModel.Parent and hrp) then return end
    local toolServiceRF = ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ToolService"):WaitForChild("RF")
    local toolActivated = toolServiceRF:WaitForChild("ToolActivated")
    local args = { "Weapon" }
    pcall(function()
        toolActivated:InvokeServer(unpack(args))
    end)
end

local function isLowHealthForMobs()
    local hum = getHumanoid()
    if not hum or hum.MaxHealth <= 0 then return false end
    local hpPercent = (hum.Health / hum.MaxHealth) * 100
    local threshold = tonumber(mobFarm.safeHealthPercent) or 0
    return hpPercent <= threshold
end

local function retreatToSafety()
    local hum = getHumanoid()
    local hrp = getHumanoidRootPart()
    if not hum or not hrp then return end
    local startPos = hrp.Position
    local safeHeight = 60
    local safePos = startPos + Vector3.new(0, safeHeight, 0)
    local previousAnchored = hrp.Anchored
    local previousPlatformStand = hum.PlatformStand
    pcall(function()
        tweenToPosition(safePos, oreFarm.tweenSpeed)
        hrp.Anchored = true
        hum.PlatformStand = true
        hrp.CFrame = CFrame.new(safePos)
    end)
    local targetPercent = (tonumber(mobFarm.safeHealthPercent) or 0) + 10
    if targetPercent > 100 then targetPercent = 100 end
    while mobFarm.enabled and hum.Health > 0 and hum.MaxHealth > 0 do
        local hpPercent = (hum.Health / hum.MaxHealth) * 100
        if hpPercent >= targetPercent then
            break
        end
        if (hrp.Position - safePos).Magnitude > 3 then
            hrp.CFrame = CFrame.new(safePos)
            hrp.AssemblyLinearVelocity = Vector3.new()
        end
        wait(0.1)
    end
    if not mobFarm.enabled or hum.Health <= 0 or hum.MaxHealth <= 0 then
        hrp.Anchored = previousAnchored
        hum.PlatformStand = previousPlatformStand
        return
    end
    hrp.Anchored = previousAnchored
    hum.PlatformStand = previousPlatformStand
    local returnPos = startPos + Vector3.new(0, 5, 0)
    pcall(function()
        tweenToPosition(returnPos, oreFarm.tweenSpeed)
    end)
end

Tab2:Toggle({
    Title = "Auto Farm Mobs",
    Desc = "Toggle Description",
    Value = false,
    Callback = function(v)
        mobFarm.enabled = v and true or false
        if not mobFarm.enabled then return end
        task.spawn(function()
            while mobFarm.enabled do
                if isLowHealthForMobs() then
                    retreatToSafety()
                    continue
                end
                local weapon = ensureWeaponEquipped()
                if not weapon then
                    wait(0.1)
                    continue
                end
                local selectedSet = listToSet(mobFarm.selectedMobs)
                local target = getNearestMob(selectedSet)
                if not target then
                    wait(0.2)
                    continue
                end
                local mobHrp = target.hrp
                if mobHrp and mobHrp:IsA("BasePart") then
                    pcall(function()
                        tweenToPosition(mobHrp.Position, oreFarm.tweenSpeed)
                    end)
                end
                if isMobDead(target.model) then
                    continue
                end
                if not mobFarm.enabled then break end
                if not target.model or not target.model.Parent then
                    continue
                end
                attackMob(target)
                local interval = tonumber(mobFarm.attackInterval) or 0.1
                if interval < 0.02 then interval = 0.02 end
                wait(interval)
            end
        end)
    end
})

local mobEspObjects = {}

local function clearMobsESP()
    for _, data in pairs(mobEspObjects) do
        if data.highlight then pcall(function() data.highlight:Destroy() end) end
        if data.billboard then pcall(function() data.billboard:Destroy() end) end
        if data.beam then pcall(function() data.beam:Destroy() end) end
        if data.attachment then pcall(function() data.attachment:Destroy() end) end
    end
    table.clear(mobEspObjects)
end

local function ensureESPForMob(mobInfo)
    local model = mobInfo.model
    if not model or not model.Parent then return end
    if mobEspObjects[model] then return end
    local hrp = mobInfo.hrp
    if not (hrp and hrp:IsA("BasePart")) then return end
    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
    highlight.FillTransparency = 0.2
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Enabled = true
    highlight.Adornee = model
    highlight.Parent = workspace
    local attachment0 = Instance.new("Attachment")
    attachment0.Parent = hrp
    attachment0.Position = Vector3.new(0, 2, 0)
    local attachment1 = Instance.new("Attachment")
    attachment1.Parent = hrp
    attachment1.Position = Vector3.new(0, 20, 0)
    local beam = Instance.new("Beam")
    beam.Attachment0 = attachment0
    beam.Attachment1 = attachment1
    beam.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 100, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 100, 255))
    })
    beam.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(0.5, 0.1),
        NumberSequenceKeypoint.new(1, 0.8)
    })
    beam.Width0 = 0.5
    beam.Width1 = 2
    beam.FaceCamera = true
    beam.LightEmission = 1
    beam.LightInfluence = 0
    beam.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    beam.TextureMode = Enum.TextureMode.Wrap
    beam.TextureSpeed = 1
    beam.Parent = hrp
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 150, 0, 50)
    billboard.Adornee = hrp
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 1000
    billboard.StudsOffset = Vector3.new(0, 5, 0)
    billboard.Parent = model
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    bg.BackgroundTransparency = 0.3
    bg.BorderSizePixel = 0
    bg.Parent = billboard
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 8)
    bgCorner.Parent = bg
    local bgGradient = Instance.new("UIGradient")
    bgGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 80)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 40))
    })
    bgGradient.Rotation = 90
    bgGradient.Parent = bg
    local border = Instance.new("UIStroke")
    border.Color = Color3.fromRGB(255, 0, 0)
    border.Thickness = 2
    border.Transparency = 0
    border.Parent = bg
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 0.6, 0)
    label.Position = UDim2.new(0, 5, 0.1, 0)
    label.BackgroundTransparency = 1
    label.Text = tostring(mobInfo.mobType)
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeTransparency = 0.5
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Parent = bg
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, -10, 0.3, 0)
    distLabel.Position = UDim2.new(0, 5, 0.65, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = "..."
    distLabel.TextColor3 = Color3.fromRGB(100, 255, 200)
    distLabel.TextStrokeTransparency = 0.5
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.Gotham
    distLabel.Parent = bg
    mobEspObjects[model] = {
        highlight = highlight,
        billboard = billboard,
        beam = beam,
        attachment = attachment0,
        distLabel = distLabel,
        hrp = hrp,
    }
end

local function updateMobsESP()
    if not mobFarm.mobsESPEnabled then
        clearMobsESP()
        return
    end
    local mobs = collectMobs(listToSet(mobFarm.selectedMobs))
    for _, info in ipairs(mobs) do
        ensureESPForMob(info)
    end
    local hrp = getHumanoidRootPart()
    if hrp then
        for model, data in pairs(mobEspObjects) do
            if data.distLabel and data.hrp and data.hrp.Parent then
                local dist = (data.hrp.Position - hrp.Position).Magnitude
                data.distLabel.Text = string.format("%.0f studs", dist)
            end
        end
    end
end

Tab2:Toggle({
    Title = "Mobs ESP",
    Value = false,
    Callback = function(v)
        mobFarm.mobsESPEnabled = v and true or false
        if not mobFarm.mobsESPEnabled then
            clearMobsESP()
        else
            updateMobsESP()
        end
    end
})

task.spawn(function()
    while true do
        if oreFarm.rocksESPEnabled then
            updateRocksESP()
        end
        if mobFarm.mobsESPEnabled then
            updateMobsESP()
        end
        updatePickaxeInfoFromGui()
        wait(0.5)
    end
end)

local Tab3 = Window:Tab({
    Title = "Forge",
    Icon = "anvil"
})

local autoForge = {
    enabled = false,
    itemType = "Weapon",
    selectedOres = {},
    totalOresPerForge = 3,
    autoMinigames = true,
    mode = "Above",
    weaponThreshold = 10,
    armorThreshold = 10,
}

local function setStatus(text)
    print("[Auto Forge] " .. text)
end

local function getControllers()
    local ok1, uiController = pcall(function()
        return Knit.GetController("UIController")
    end)
    local ok2, forgeController = pcall(function()
        return Knit.GetController("ForgeController")
    end)
    local ok3, playerController = pcall(function()
        return Knit.GetController("PlayerController")
    end)
    if ok1 and ok2 and ok3 and uiController and forgeController and playerController then
        local replica = playerController.Replica
        local forgeModule = uiController.Modules and uiController.Modules.Forge
        return forgeController, forgeModule, replica, uiController
    end
    return nil, nil, nil, nil
end

local function buildForgeOreOptions()
    local names = {}
    local ok, arr = pcall(function()
        return Utils.FormArrayFromNames(Ore)
    end)
    if ok and type(arr) == "table" then
        for _, name in ipairs(arr) do
            if type(name) == "string" then
                table.insert(names, name)
            end
        end
    else
        for name, _ in pairs(Ore) do
            if type(name) == "string" then
                table.insert(names, name)
            end
        end
    end
    table.sort(names)
    return names
end

local forgeOreOptions = buildForgeOreOptions()
if #autoForge.selectedOres == 0 and #forgeOreOptions > 0 then
    autoForge.selectedOres = { forgeOreOptions[1] }
end

local function getCurrentMinigame(forgeGui)
    local melt = forgeGui:FindFirstChild("MeltMinigame")
    local pour = forgeGui:FindFirstChild("PourMinigame")
    local hammer = forgeGui:FindFirstChild("HammerMinigame")
    if melt and melt.Visible then
        return "Melt", melt
    elseif pour and pour.Visible then
        return "Pour", pour
    elseif hammer and hammer.Visible then
        return "Hammer", hammer
    end
    return nil, nil
end

local function autoCompleteMeltMinigame(minigameGui)
    setStatus("Playing Melt minigame...")
    local heater = minigameGui:FindFirstChild("Heater")
    if not heater then return false end
    local top = heater:FindFirstChild("Top")
    if not top then return false end
    local bar = minigameGui:FindFirstChild("Bar")
    if not bar or not bar:FindFirstChild("Area") then return false end
    local heating = true
    task.spawn(function()
        for _, conn in ipairs(getconnections(top.MouseButton1Down)) do
            conn:Fire()
        end
    end)
    task.wait(0.1)
    pcall(function()
        local cam = workspace.CurrentCamera
        if cam and cam.ViewportSize and typeof(mousemoveabs) == "function" then
            local vs = cam.ViewportSize
            mousemoveabs(vs.X / 2, vs.Y / 2)
        end
    end)
    task.spawn(function()
        local direction = 1
        local centerX, centerY
        pcall(function()
            local cam = workspace.CurrentCamera
            if cam and cam.ViewportSize then
                local vs = cam.ViewportSize
                centerX, centerY = vs.X / 2, vs.Y / 2
            end
        end)
        while heating and minigameGui.Visible and autoForge.enabled do
            RunService.RenderStepped:Wait()
            if typeof(mousemoveabs) == "function" and centerX and centerY then
                mousemoveabs(centerX, centerY)
            end
            if direction == 1 then
                mousemoverel(0, -50)
                direction = -1
            else
                mousemoverel(0, 50)
                direction = 1
            end
        end
    end)
    local timeout = tick() + 60
    while minigameGui.Visible and tick() < timeout and autoForge.enabled do
        local progress = bar.Area.Size.Y.Scale
        setStatus(string.format("Melting... %.0f%% (FAST)", progress * 100))
        if progress >= 0.99 then
            heating = false
            task.wait(2)
            break
        end
        task.wait(0.2)
    end
    heating = false
    task.spawn(function()
        for _, conn in ipairs(getconnections(UserInputService.InputEnded)) do
            conn:Fire({
                UserInputType = Enum.UserInputType.MouseButton1
            })
        end
    end)
    return not minigameGui.Visible
end

local function autoCompletePourMinigame(minigameGui)
    setStatus("Playing Pour minigame...")
    local frame = minigameGui:FindFirstChild("Frame")
    if not frame then return false end
    local line = frame:FindFirstChild("Line")
    local area = frame:FindFirstChild("Area")
    if not line or not area then return false end
    local timer = minigameGui:FindFirstChild("Timer")
    if not timer or not timer:FindFirstChild("Bar") then return false end
    local clicking = true
    task.spawn(function()
        while clicking and minigameGui.Visible and autoForge.enabled do
            local linePos = line.Position.Y.Scale
            local areaPos = area.Position.Y.Scale
            local areaSize = area.Size.Y.Scale
            local targetMid = areaPos + areaSize * 0.5
            local deadband = areaSize * 0.15
            if linePos > targetMid + deadband then
                pcall(function()
                    for _, conn in ipairs(getconnections(UserInputService.InputBegan)) do
                        conn:Fire({
                            UserInputType = Enum.UserInputType.MouseButton1
                        })
                    end
                end)
            elseif linePos < targetMid - deadband then
                pcall(function()
                    for _, conn in ipairs(getconnections(UserInputService.InputEnded)) do
                        conn:Fire({
                            UserInputType = Enum.UserInputType.MouseButton1
                        })
                    end
                end)
            else
                pcall(function()
                    for _, conn in ipairs(getconnections(UserInputService.InputEnded)) do
                        conn:Fire({
                            UserInputType = Enum.UserInputType.MouseButton1
                        })
                    end
                end)
            end
            task.wait(0.02)
        end
    end)
    local timeout = tick() + 45
    while minigameGui.Visible and tick() < timeout and autoForge.enabled do
        local progress = timer.Bar.Size.X.Scale
        if progress >= 0.98 then
            clicking = false
            task.wait(1)
            break
        end
        task.wait(0.1)
    end
    clicking = false
    return not minigameGui.Visible
end

local function autoCompleteHammerMinigame(minigameGui)
    setStatus("Playing Hammer minigame...")
    setStatus("Breaking mold...")
    local moldBroken = false
    task.spawn(function()
        local clickCount = 0
        while not moldBroken and autoForge.enabled do
            local foundDetector = false
            for _, obj in ipairs(workspace.Debris:GetChildren()) do
                if obj:GetAttribute("IsDestroyed") then
                    moldBroken = true
                    break
                end
                local clickDetector = obj:FindFirstChildWhichIsA("ClickDetector", true)
                if clickDetector and clickDetector.Parent and clickDetector.Parent.Parent then
                    foundDetector = true
                    pcall(function()
                        for _, conn in ipairs(getconnections(clickDetector.MouseClick)) do
                            conn:Fire()
                        end
                    end)
                    clickCount = clickCount + 1
                    if clickCount % 5 == 0 then
                        setStatus("Breaking mold... " .. clickCount .. " hits")
                    end
                end
            end
            if not foundDetector then
                moldBroken = true
            end
            task.wait(0.1)
        end
    end)
    local timeout = tick() + 15
    while not moldBroken and tick() < timeout do
        task.wait(0.1)
    end
    if not moldBroken then
        setStatus("Mold breaking timeout!")
        return false
    end
    setStatus("Mold broken! Waiting for notes...")
    task.wait(1)
    local clicking = true
    local clickedNotes = {}
    local notesHit = 0
    task.spawn(function()
        while clicking and minigameGui.Visible and autoForge.enabled do
            for _, noteFrame in ipairs(minigameGui:GetChildren()) do
                if noteFrame:IsA("GuiObject") and noteFrame.Visible and noteFrame.Name == "Frame" and not clickedNotes[noteFrame] then
                    local frame = noteFrame:FindFirstChild("Frame")
                    if frame then
                        local circle = frame:FindFirstChild("Circle")
                        local border = frame:FindFirstChild("Border")
                        if circle and border then
                            local circleSize = circle.Size.Y.Scale
                            local borderSize = border.Size.Y.Scale
                            local difference = math.abs(circleSize - borderSize)
                            local tolerance = 0.05
                            if difference <= tolerance then
                                pcall(function()
                                    for _, conn in ipairs(getconnections(noteFrame.MouseButton1Click)) do
                                        conn:Fire()
                                    end
                                end)
                                clickedNotes[noteFrame] = true
                                notesHit = notesHit + 1
                                setStatus(string.format("Hit note #%d! (C:%.3f B:%.3f)", notesHit, circleSize, borderSize))
                            end
                        end
                    end
                end
            end
            task.wait(0.005)
        end
    end)
    local timeout2 = tick() + 35
    while minigameGui.Visible and tick() < timeout2 and autoForge.enabled do
        task.wait(0.1)
    end
    clicking = false
    setStatus("Hammer minigame complete! Hit " .. notesHit .. " notes")
    return not minigameGui.Visible
end

local function computeRecipeFromInventory(replica)
    local inv = replica and replica.Data and replica.Data.Inventory or {}
    local needed = autoForge.totalOresPerForge or 3
    local recipe = {}
    local count = 0
    if not autoForge.selectedOres or #autoForge.selectedOres == 0 then
        return nil, "No ores selected"
    end
    while count < needed do
        local progressed = false
        for _, oreName in ipairs(autoForge.selectedOres) do
            if count >= needed then break end
            local have = inv[oreName] or 0
            local used = recipe[oreName] or 0
            if have > used then
                recipe[oreName] = used + 1
                count += 1
                progressed = true
                if count >= needed then break end
            end
        end
        if not progressed then break end
    end
    if count < 3 then
        return nil, "Not enough ores in inventory"
    end
    return recipe
end

local function rebuildRecipe(forgeModule, forgeGui, recipeOres)
    forgeModule.addedOres = {}
    local oreSelect = forgeGui:FindFirstChild("OreSelect")
    if not oreSelect then return end
    local oresContainer = oreSelect:FindFirstChild("Forge")
    if oresContainer then
        oresContainer = oresContainer:FindFirstChild("Ores")
    end
    if not oresContainer then return end
    for _, btn in ipairs(oresContainer:GetChildren()) do
        if btn:IsA("GuiObject") then
            btn:Destroy()
        end
    end
    for oreName, count in pairs(recipeOres or {}) do
        if type(count) == "number" and count > 0 then
            for _ = 1, count do
                forgeModule:AddOre(oreName)
            end
        end
    end
    forgeModule.selectedItemType = autoForge.itemType
    forgeModule:UpdateProbabilities()
    forgeModule:UpdateAddedOres()
end

local function waitForEndScreen(uiController, timeout)
    timeout = timeout or 30
    local start = tick()
    local endScreen = LocalPlayer.PlayerGui:FindFirstChild("Forge"):FindFirstChild("EndScreen")
    while tick() - start < timeout and autoForge.enabled do
        if endScreen then
            local okEnabled, enabled = pcall(function()
                return endScreen.Enabled
            end)
            local isVisible = (okEnabled and enabled == true) or (endScreen.Visible == true)
            if isVisible then
                setStatus("EndScreen detected - running filter...")
                return endScreen
            end
        end
        endScreen = LocalPlayer.PlayerGui:FindFirstChild("Forge"):FindFirstChild("EndScreen")
        RunService.RenderStepped:Wait()
    end
    setStatus("EndScreen not found or not visible - skipping evaluation")
    return nil
end

local function evaluateAndClickEndScreen(endScreen)
    setStatus("Evaluating EndScreen stats...")
    local forgeGui = LocalPlayer.PlayerGui:FindFirstChild("Forge")
    if not forgeGui then return end
    local endRoot = forgeGui:FindFirstChild("EndScreen")
    if not endRoot then return end
    local statsFrame = endRoot:FindFirstChild("Stats")
    if not statsFrame then return end
    local frame = statsFrame:FindFirstChild("Frame")
    if not frame then return end
    local list = frame:FindFirstChild("List")
    if not list then return end
    local stats = list:FindFirstChild("Stats")
    if not stats then return end
    local damage = stats:FindFirstChild("Damage")
    if not damage then return end
    local statHolder = damage:FindFirstChild("Stat")
    if not statHolder then return end
    local statLabel = statHolder:FindFirstChild("Stat")
    if not statLabel or not statLabel:IsA("TextLabel") then return end
    local text = tostring(statLabel.Text or "")
    local numeric = tonumber(text:match("^(%d+%.%d*)")) or tonumber(text:match("^(%d+)%s")) or 0
    setStatus("EndScreen stat text '" .. text .. "' -> " .. tostring(numeric))
    local mode = autoForge.mode == "Below" and "Below" or "Above"
    local threshold = autoForge.itemType == "Armor" and autoForge.armorThreshold or autoForge.weaponThreshold
    local pass
    if mode == "Above" then
        pass = numeric >= threshold
    else
        pass = numeric <= threshold
    end
    local buttonsRoot = frame
    local accept = buttonsRoot:FindFirstChild("AcceptButton")
    local remove = buttonsRoot:FindFirstChild("RemoveButton")
    if pass and accept then
        setStatus(string.format("EndScreen: %s %d passes %s %d -> Accept", autoForge.itemType, numeric, mode, threshold))
        pcall(function()
            if typeof(mousemoveabs) == "function" and typeof(mouse1click) == "function" then
                local pos = accept.AbsolutePosition
                local size = accept.AbsoluteSize
                local cx, cy = pos.X + size.X/2, pos.Y + size.Y/2
                mousemoveabs(cx, cy)
                RunService.RenderStepped:Wait()
                mouse1click()
            end
        end)
    elseif not pass and remove then
        setStatus(string.format("EndScreen: %s %d fails %s %d -> Delete", autoForge.itemType, numeric, mode, threshold))
        pcall(function()
            if typeof(mousemoveabs) == "function" and typeof(mouse1click) == "function" then
                local pos = remove.AbsolutePosition
                local size = remove.AbsoluteSize
                local cx, cy = pos.X + size.X/2, pos.Y + size.Y/2
                mousemoveabs(cx, cy)
                RunService.RenderStepped:Wait()
                mouse1click()
            end
        end)
        pcall(function()
            local yesNo = endRoot:FindFirstChild("YesNo")
            local start = tick()
            while (not yesNo or not yesNo.Visible) and tick() - start < 5 and autoForge.enabled do
                yesNo = endRoot:FindFirstChild("YesNo")
                RunService.RenderStepped:Wait()
            end
            if yesNo and yesNo.Visible then
                local frame = yesNo:FindFirstChild("Frame")
                local buttons = frame and frame:FindFirstChild("Buttons")
                local yesButton = buttons and buttons:FindFirstChild("Yes")
                if yesButton and typeof(mousemoveabs) == "function" and typeof(mouse1click) == "function" then
                    local pos = yesButton.AbsolutePosition
                    local size = yesButton.AbsoluteSize
                    local cx, cy = pos.X + size.X/2, pos.Y + size.Y/2
                    mousemoveabs(cx, cy)
                    RunService.RenderStepped:Wait()
                    mouse1click()
                end
            end
        end)
    end
end

local function waitAndPlayMinigames(forgeGui)
    setStatus("Waiting for minigames...")
    local timeout = tick() + 120
    local completedMinigames = {}
    while tick() < timeout and autoForge.enabled do
        local minigameName, minigameGui = getCurrentMinigame(forgeGui)
        if minigameName and not completedMinigames[minigameName] then
            setStatus("Detected: " .. minigameName .. " minigame")
            local success = false
            if minigameName == "Melt" then
                success = autoCompleteMeltMinigame(minigameGui)
            elseif minigameName == "Pour" then
                success = autoCompletePourMinigame(minigameGui)
            elseif minigameName == "Hammer" then
                success = autoCompleteHammerMinigame(minigameGui)
            end
            if success then
                completedMinigames[minigameName] = true
                setStatus(minigameName .. " minigame completed!")
            end
            task.wait(1)
        end
        local forgeRoot = LocalPlayer.PlayerGui:FindFirstChild("Forge")
        local endScreen = forgeRoot and forgeRoot:FindFirstChild("EndScreen") or nil
        if endScreen then
            local okEnabled, enabled = pcall(function()
                return endScreen.Enabled
            end)
            local isVisible = (okEnabled and enabled == true) or (endScreen.Visible == true)
            if isVisible then
                setStatus("All minigames completed (EndScreen visible)!")
                return true
            end
        end
        task.wait(0.2)
    end
    return false
end

local function runAutoForgeLoop()
    local forgeController, forgeModule, replica, uiController = getControllers()
    if not (forgeController and forgeModule and uiController and replica) then
        setStatus("Failed to get controllers!")
        return
    end
    local forgeGui = uiController.PlayerGui:WaitForChild("Forge", 5)
    if not forgeGui then
        setStatus("Forge GUI not found!")
        return
    end
    if not forgeController.ForgeActive then
        setStatus("Forge not active! Open forge first.")
        return
    end
    local cycleCount = 0
    while autoForge.enabled do
        cycleCount += 1
        setStatus(string.format("Starting cycle #%d...", cycleCount))
        local recipe, err = computeRecipeFromInventory(replica)
        if not recipe then
            setStatus("Error: " .. tostring(err))
            task.wait(5)
            continue
        end
        local recipeLines = { "Cycle #" .. cycleCount, "Type: " .. autoForge.itemType, "Ores:" }
        for name, count in pairs(recipe) do
            table.insert(recipeLines, string.format("  %s x%d", name, count))
        end
        setStatus(table.concat(recipeLines, "\n"))
        rebuildRecipe(forgeModule, forgeGui, recipe)
        forgeController.Ores = forgeModule.addedOres
        forgeController.ItemType = autoForge.itemType
        task.wait(0.5)
        pcall(function()
            forgeController:ChangeSequence("Melt")
        end)
        if autoForge.autoMinigames then
            local success = waitAndPlayMinigames(forgeGui)
            if not success then
                setStatus("Timeout or error in minigames!")
                task.wait(5)
                continue
            end
        else
            local timeout = tick() + 120
            while tick() < timeout and autoForge.enabled do
                local oreSelect = forgeGui:FindFirstChild("OreSelect")
                if oreSelect and oreSelect.Visible then
                    break
                end
                task.wait(0.5)
            end
        end
        local endScreen = waitForEndScreen(uiController)
        if endScreen then
            evaluateAndClickEndScreen(endScreen)
        end
        setStatus("Cycle complete! Waiting...")
        task.wait(2)
    end
    setStatus("Stopped")
end

Tab3:Dropdown({
    Title = "Item Type",
    Values = { "Weapon", "Armor" },
    Value = { autoForge.itemType },
    AllowNone = true,
    Callback = function(opts)
        local v = type(opts) == "table" and opts[1] or opts
        if v == "Weapon" or v == "Armor" then
            autoForge.itemType = v
        end
    end
})

Tab3:Dropdown({
    Title = "Ores to Use",
    Values = forgeOreOptions,
    Value = autoForge.selectedOres,
    Multi = true,
    AllowNone = true,
    Callback = function(opts)
        if type(opts) == "table" and #opts > 0 then
            autoForge.selectedOres = opts
        end
    end
})

Tab3:Slider({
    Title = "Ores Per Forge",
    Step = 1,
    Value = {
        Min = 0,
        Max = 10,
        Default = 5,
    },
    Callback = function(value)
        autoForge.totalOresPerForge = math.floor(value)
    end
})

Tab3:Dropdown({
    Title = "Threshold Mode",
    Values = { "Above", "Below" },
    Value = { autoForge.mode },
    AllowNone = true,
    Callback = function(opts)
        local v = type(opts) == "table" and opts[1] or opts
        if v == "Above" or v == "Below" then
            autoForge.mode = v
        end
    end
})

Tab3:Slider({
    Title = "Weapon Threshold (DMG)",
    Step = 1,
    Value = {
        Min = 0,
        Max = 10,
        Default = 5,
    },
    Callback = function(value)
        autoForge.weaponThreshold = math.floor(value)
    end
})

Tab3:Slider({
    Title = "Armor Threshold (DEF)",
    Step = 1,
    Value = {
        Min = 0,
        Max = 500,
        Default = 200,
    },
    Callback = function(value)
        autoForge.armorThreshold = math.floor(value)
    end
})

Tab3:Toggle({
    Title = "Auto Complete Minigames",
    Desc = "Automatically Completed Minigames",
    Value = false,
    Callback = function(v)
        autoForge.autoMinigames = v
    end
})

Tab3:Toggle({
    Title = "Enable Auto Forge",
    Desc = "Automatically Completed Minigames",
    Value = false,
    Callback = function(v)
        autoForge.enabled = v
        if autoForge.enabled then
            setStatus("Starting auto forge...")
            task.spawn(runAutoForgeLoop)
        else
            setStatus("Stopped")
        end
    end
})

local Tab4 = Window:Tab({
    Title = "Auto",
    Icon = "play"
})

local autoPotions = {
    enabled = false,
    selected = {},
}

local function setPotionStatus(text)
    print("[Auto Potions]", text)
end

local function buildPotionOptions()
    local potFolder = ReplicatedStorage:FindFirstChild("Assets")
    potFolder = potFolder and potFolder:FindFirstChild("Extras") or nil
    potFolder = potFolder and potFolder:FindFirstChild("Potion") or nil
    local names = {}
    if potFolder then
        for _, inst in ipairs(potFolder:GetChildren()) do
            if inst.Name and typeof(inst.Name) == "string" then
                table.insert(names, inst.Name)
            end
        end
    end
    table.sort(names)
    return names
end

local potionOptions = buildPotionOptions()

Tab4:Dropdown({
    Title = "Potions to Auto-Use",
    Values = potionOptions,
    Value = autoPotions.selected,
    Multi = true,
    AllowNone = true,
    Callback = function(opts)
        if type(opts) == "table" and #opts > 0 then
            autoPotions.selected = opts
        else
            autoPotions.selected = {}
        end
    end
})

local function autoPotionLoop()
    local toolRF = ReplicatedStorage
        :WaitForChild("Shared")
        :WaitForChild("Packages")
        :WaitForChild("Knit")
        :WaitForChild("Services")
        :WaitForChild("ToolService")
        :WaitForChild("RF")
        :WaitForChild("ToolActivated")
    setPotionStatus("Auto potions running...")
    while autoPotions.enabled do
        if #autoPotions.selected == 0 then
            setPotionStatus("No potions selected")
            wait(1)
        else
            local usedSomething = false
            for _, potionName in ipairs(autoPotions.selected) do
                local backpack = LocalPlayer:FindFirstChild("Backpack")
                local tool = backpack and backpack:FindFirstChild(potionName)
                if tool and tool:IsA("Tool") then
                    setPotionStatus("Using potion: " .. potionName)
                    pcall(function()
                        LocalPlayer.Character.Humanoid:EquipTool(tool)
                    end)
                    pcall(function()
                        toolRF:InvokeServer(potionName)
                    end)
                    usedSomething = true
                end
            end
            if not usedSomething then
                setPotionStatus("No selected potions found in backpack")
            end
            wait(1)
        end
    end
    setPotionStatus("Auto potions stopped")
end

Tab4:Toggle({
    Title = "Enable Auto Potions",
    Value = false,
    Callback = function(v)
        autoPotions.enabled = v
        if autoPotions.enabled then
            setPotionStatus("Starting auto potions...")
            spawn(autoPotionLoop)
        else
            setPotionStatus("Stopped")
        end
    end
})

local autoMovement = {
    alwaysRun = false,
    autoDodge = false,
}

local function runCharacter()
    pcall(function()
        local CharacterService = Knit.GetService("CharacterService")
        CharacterService:Run()
    end)
end

local function stopRunCharacter()
    pcall(function()
        local CharacterService = Knit.GetService("CharacterService")
        CharacterService:StopRun()
    end)
end

local function dashAwayFromTarget(humanoid, hrp, targetPart)
    if not (humanoid and hrp and targetPart) then return end
    pcall(function()
        local CharacterService = Knit.GetService("CharacterService")
        local toEnemy = (targetPart.Position - hrp.Position)
        local flat = Vector3.new(toEnemy.X, 0, toEnemy.Z)
        if flat.Magnitude < 0.1 then return end
        local away = -flat.Unit
        local rootCF = hrp.CFrame
        local look = rootCF.LookVector
        local right = rootCF.RightVector
        look = Vector3.new(look.X, 0, look.Z).Unit
        right = Vector3.new(right.X, 0, right.Z).Unit
        local dotL = look:Dot(away)
        local dotR = right:Dot(away)
        local dir, sign
        if math.abs(dotL) >= math.abs(dotR) then
            if dotL >= 0 then
                dir, sign = "LookVector", "+"
            else
                dir, sign = "LookVector", "-"
            end
        else
            if dotR >= 0 then
                dir, sign = "RightVector", "+"
            else
                dir, sign = "RightVector", "-"
            end
        end
        CharacterService:Dash(dir, sign)
    end)
end

local autoMovementRunning = false

local function autoMovementLoop()
    if autoMovementRunning then return end
    autoMovementRunning = true
    local lastHealth
    local lastDodgeTime = 0
    while autoMovement.alwaysRun or autoMovement.autoDodge do
        local char = LocalPlayer and LocalPlayer.Character or nil
        local humanoid = char and char:FindFirstChildOfClass("Humanoid") or nil
        local hrp = char and char:FindFirstChild("HumanoidRootPart") or nil
        if humanoid and hrp then
            local health = humanoid.Health
            if autoMovement.alwaysRun and humanoid.MoveDirection.Magnitude > 0.1 then
                runCharacter()
            end
            if autoMovement.autoDodge and lastHealth and health < lastHealth - 0.5 and health > 0 then
                if time() - lastDodgeTime > 1 then
                    local nearestPart
                    local nearestDist = math.huge
                    for _, model in ipairs(workspace.Living:GetChildren()) do
                        if model:IsA("Model") and model ~= char then
                            local part = model:FindFirstChild("HumanoidRootPart") or model.PrimaryPart
                            if part then
                                local d = (part.Position - hrp.Position).Magnitude
                                if d < nearestDist then
                                    nearestDist = d
                                    nearestPart = part
                                end
                            end
                        end
                    end
                    if nearestPart and nearestDist < 60 then
                        dashAwayFromTarget(humanoid, hrp, nearestPart)
                        lastDodgeTime = time()
                    end
                end
            end
            lastHealth = health
        else
            lastHealth = nil
        end
        wait(0.1)
    end
    autoMovementRunning = false
end

Tab4:Toggle({
    Title = "Always Run",
    Value = false,
    Callback = function(v)
        autoMovement.alwaysRun = v
        if not v then
            stopRunCharacter()
        end
        if autoMovement.alwaysRun or autoMovement.autoDodge then
            spawn(autoMovementLoop)
        end
    end
})

Tab4:Toggle({
    Title = "Auto Dodge (dash on hit)",
    Value = false,
    Callback = function(v)
        autoMovement.autoDodge = v
        if autoMovement.alwaysRun or autoMovement.autoDodge then
            spawn(autoMovementLoop)
        end
    end
})

local Tab5 = Window:Tab({
    Title = "Sell",
    Icon = "badge-dollar-sign"
})

local autoSell = {
    enabled = false,
    selectedOres = {},
    selectedInvItems = {},
    interval = 10,
    sellAmount = 100,
}

local currentInvOptions = {"Click Refresh Inventory"}

local function getInventoryFromUI()
    local inv = {}
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    if not pg then return inv end
    local menu = pg:FindFirstChild("Menu")
    local frame1 = menu and menu:FindFirstChild("Frame")
    local frame2 = frame1 and frame1:FindFirstChild("Frame")
    local menus = frame2 and frame2:FindFirstChild("Menus")
    local stash = menus and menus:FindFirstChild("Stash")
    local container = stash and stash:FindFirstChild("Background")
    if not container then
        container = stash
    end
    if not container then
        if autoSell.enabled then
            print("[Forge] Debug: Could not find Stash UI at PlayerGui.Menu.Frame.Frame.Menus.Stash.Background")
        end
        return inv
    end
    for _, itemFrame in ipairs(container:GetChildren()) do
        local main = itemFrame:FindFirstChild("Main")
        if main then
            local nameLbl = main:FindFirstChild("ItemName")
            local qtyLbl = main:FindFirstChild("Quantity")
            if nameLbl and qtyLbl and nameLbl:IsA("TextLabel") and qtyLbl:IsA("TextLabel") then
                local name = nameLbl.Text
                local qtyStr = qtyLbl.Text
                local qty = tonumber(qtyStr:match("%d+")) or 0
                if name and name ~= "" and qty > 0 then
                    inv[name] = qty
                end
            end
        end
    end
    return inv
end

local InvDropdown

local function RefreshInventoryList()
    local inv = getInventoryFromUI()
    local options = {}
    for name, _ in pairs(inv) do
        table.insert(options, name)
    end
    table.sort(options)
    if #options == 0 then
        options = {"No items found (Open Stash)"}
    end
    currentInvOptions = options
    if InvDropdown then
        InvDropdown:Refresh(currentInvOptions, {})
    end
    print("[Forge] Refreshed inventory list. Found " .. #options .. " items.")
end

local function performAutoSell()
    local inv = getInventoryFromUI()
    local basket = {}
    local hasItems = false
    local selectedSet = listToSet(autoSell.selectedOres)
    local invSet = listToSet(autoSell.selectedInvItems)
    local function isSelected(name)
        if selectedSet[name] then return true end
        if invSet[name] then return true end
        if selectedSet["Any"] then
            for _, v in ipairs(oreOptions) do
                if v == name then return true end
            end
        end
        return false
    end
    local batchSize = tonumber(autoSell.sellAmount) or 100
    for itemName, amount in pairs(inv) do
        if isSelected(itemName) and amount > 0 then
            local sellQty = math.min(amount, batchSize)
            if sellQty > 0 then
                basket[itemName] = sellQty
                hasItems = true
            end
        end
    end
    if hasItems then
        local args = {
            "SellConfirm",
            {
                Basket = basket
            }
        }
        print("[Forge] Attempting to sell:", HttpService:JSONEncode(basket))
        local rs = game:GetService("ReplicatedStorage")
        local shared = rs:WaitForChild("Shared", 2)
        local packages = shared and shared:WaitForChild("Packages", 2)
        local knit = packages and packages:WaitForChild("Knit", 2)
        local services = knit and knit:WaitForChild("Services", 2)
        local dialogue = services and services:WaitForChild("DialogueService", 2)
        local rf = dialogue and dialogue:WaitForChild("RF", 2)
        local runCmd = rf and rf:WaitForChild("RunCommand", 2)
        if runCmd then
            pcall(function()
                runCmd:InvokeServer(unpack(args))
                print("[Forge] Sell command sent!")
            end)
        else
            warn("[Forge] Failed to find DialogueService RunCommand remote!")
        end
    end
end

Tab5:Toggle({
    Title = "Enable Auto Sell",
    Value = false,
    Callback = function(v)
        autoSell.enabled = v
        if v then
            task.spawn(function()
                while autoSell.enabled do
                    performAutoSell()
                    task.wait(autoSell.interval or 10)
                end
            end)
        end
    end
})

Tab5:Dropdown({
    Title = "Ores to Auto Sell (Pre-select)",
    Values = oreOptions,
    Value = autoSell.selectedOres,
    AllowNone = true,
    Callback = function(opts)
        if type(opts) == "table" then
            autoSell.selectedOres = opts
        end
    end
})

Tab5:Button({
    Title = "Refresh Inventory List",
    Locked = false,
    Callback = function()
        RefreshInventoryList()
    end
})

InvDropdown = Tab5:Dropdown({
    Title = "Inventory Items to Sell",
    Values = currentInvOptions,
    Value = {},
    AllowNone = true,
    Multi = true,
    Callback = function(opts)
        if type(opts) == "table" then
            autoSell.selectedInvItems = opts
        end
    end
})

Tab5:Slider({
    Title = "Sell Amount (Batch Size)",
    Step = 1,
    Value = {
        Min = 0,
        Max = 1000,
        Default = 400,
    },
    Callback = function(v)
        autoSell.sellAmount = v
    end
})

Tab5:Slider({
    Title = "Sell Interval (s)",
    Step = 1,
    Value = {
        Min = 0,
        Max = 120,
        Default = 70,
    },
    Callback = function(v)
        autoSell.interval = v
    end
})

local Tab6 = Window:Tab({
    Title = "Settings",
    Icon = "settings"
})

local VirtualInputManager = game:GetService("VirtualInputManager")
local ContextActionService = game:GetService("ContextActionService")

local antiAfk = {
    enabled = true,
    running = false,
    interval = 60,
    key = Enum.KeyCode.ButtonR3,
    bindName = "PVB_AntiAFK_Sink",
}

local function AA_BindSink()
    pcall(function() ContextActionService:UnbindAction(antiAfk.bindName) end)
    pcall(function()
        ContextActionService:BindAction(antiAfk.bindName, function()
            return Enum.ContextActionResult.Sink
        end, false, antiAfk.key)
    end)
end

local function AA_UnbindSink()
    pcall(function() ContextActionService:UnbindAction(antiAfk.bindName) end)
end

local function AA_Tap()
    pcall(function() VirtualInputManager:SendKeyEvent(true, antiAfk.key, false, game) end)
    task.wait(0.06)
    pcall(function() VirtualInputManager:SendKeyEvent(false, antiAfk.key, false, game) end)
end

local function AA_Start()
    if antiAfk.running then return end
    antiAfk.running = true
    AA_BindSink()
    task.spawn(function()
        while antiAfk.enabled do
            AA_Tap()
            local waitFor = (antiAfk.interval or 60) + math.random(-2, 2)
            if waitFor < 10 then waitFor = 10 end
            for _ = 1, waitFor * 10 do
                if not antiAfk.enabled then break end
                task.wait(0.1)
            end
        end
        antiAfk.running = false
        AA_UnbindSink()
    end)
end

Tab6:Toggle({
    Title = "Enable Anti-AFK",
    Value = true,
    Callback = function(v)
        antiAfk.enabled = v and true or false
        if v then AA_Start() end
    end
})

Tab6:Slider({
    Title = "AFK Tap Interval (sec)",
    Step = 1,
    Value = {
        Min = 0,
        Max = 180,
        Default = 60,
    },
    Callback = function(v)
        local n = tonumber(v)
        if n and n >= 10 then antiAfk.interval = n end
    end
})

if antiAfk.enabled then AA_Start() end
