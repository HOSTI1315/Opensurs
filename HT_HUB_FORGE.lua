local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

if game.GameId ~= 7671049560 then
    warn("Script only runs on Game ID: 7671049560. Current Game ID: " .. tostring(game.GameId))
    return
end

local PurchaseRemote = ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ProximityService"):WaitForChild("RF"):WaitForChild("Purchase")

local Success, Library = pcall(function()
    return loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()
end)

if not (Success and Library) then
    warn("Error loading UI Library (MacLib): " .. tostring(Library))
    return
end

local ConfigData = {
    FileName = "HTHubTheForgeConfig_" .. Players.LocalPlayer.Name .. ".json",
    DefaultConfig = {
        SelectedRockType = nil,
        AutoMineEnabled = false,
        SelectedEnemyType = nil,
        SelectedDistance = 6,
        AutoFarmEnemyEnabled = false,
        SelectedMineDistance = 6,
        SelectedPotionName = nil,
        AutoBuyAndUsePotionEnabled = false,
        SelectedItemName = nil,
        AutoSellItemEnabled = false,
        AntiAFKEnabled = true
    },
    CurrentConfig = {}
}

local Config = ConfigData

Config.SaveConfig = function()
    local Success, Err = pcall(function()
        writefile(Config.FileName, HttpService:JSONEncode(Config.CurrentConfig))
    end)
    if not Success then
        warn("Failed to save config:", Err)
    end
end

Config.LoadConfig = function()
    local Success, Data = pcall(function()
        if isfile and isfile(Config.FileName) then
            return readfile(Config.FileName)
        else
            return nil
        end
    end)
    if Success and Data then
        Config.CurrentConfig = HttpService:JSONDecode(Data)
    else
        Config.CurrentConfig = table.clone(Config.DefaultConfig)
        Config.SaveConfig()
    end
end

Config.LoadConfig()

local PlayerName = Players.LocalPlayer.Name
local Window = Library.Window(Library, {
    Title = "HT HUB | The Forge",
    Subtitle = "Hello, " .. PlayerName,
    Size = UDim2.fromOffset(720, 500),
    DragStyle = 1,
    DisabledWindowControls = {},
    ShowUserInfo = true,
    Keybind = Enum.KeyCode.LeftAlt,
    AcrylicBlur = true
})

local function Notify(Title, Desc, Lifetime)
    if Window and Window.Notify then
        Window:Notify({
            Title = Title or Window.Settings.Title,
            Description = Desc or "",
            Lifetime = Lifetime or 4
        })
    else
        print("[Notify]", Title, Desc)
    end
end

Library.SetFolder(Library, "HTHubTheForge")

local TabGroup = Window.TabGroup(Window)

local Tabs = {
    Farm = TabGroup:Tab({
        Name = "Farm",
        Image = "rbxassetid://10734923549"
    }),
    Shop = TabGroup:Tab({
        Name = "Shop",
        Image = "rbxassetid://10734952273"
    }),
    Teleport = TabGroup:Tab({
        Name = "Teleport",
        Image = "rbxassetid://10747381992"
    }),
    Settings = TabGroup:Tab({
        Name = "Settings",
        Image = "rbxassetid://10734950309"
    })
}

-- Mining variables
local AutoMineEnabled = Config.CurrentConfig.AutoMineEnabled
if type(AutoMineEnabled) ~= "boolean" then
    AutoMineEnabled = Config.DefaultConfig.AutoMineEnabled
end
local RockTypes = type(Config.CurrentConfig.SelectedRockType) == "string" and {Config.CurrentConfig.SelectedRockType} or (type(Config.CurrentConfig.SelectedRockType) ~= "table" and {} or Config.CurrentConfig.SelectedRockType)
local MineDistance = tonumber(Config.CurrentConfig.SelectedMineDistance) or Config.DefaultConfig.SelectedMineDistance
if MineDistance < 1 or 10 < MineDistance then
    MineDistance = Config.DefaultConfig.SelectedMineDistance
end
local AllRockTypes = {}
local RockDropdown = nil

-- Enemy variables
local EnemyTypes = type(Config.CurrentConfig.SelectedEnemyType) ~= "table" and {} or Config.CurrentConfig.SelectedEnemyType
local FarmDistance = tonumber(Config.CurrentConfig.SelectedDistance) or Config.DefaultConfig.SelectedDistance
if FarmDistance < 1 or 10 < FarmDistance then
    FarmDistance = Config.DefaultConfig.SelectedDistance
end
local AutoFarmEnemyEnabled = Config.CurrentConfig.AutoFarmEnemyEnabled
if type(AutoFarmEnemyEnabled) ~= "boolean" then
    AutoFarmEnemyEnabled = Config.DefaultConfig.AutoFarmEnemyEnabled
end
local AllEnemyTypes = {}
local EnemyDropdown = nil
local CurrentEnemyTween = nil

-- Potion variables
local SelectedPotionName = Config.CurrentConfig.SelectedPotionName
if SelectedPotionName ~= nil and type(SelectedPotionName) ~= "string" then
    SelectedPotionName = nil
end
local AutoBuyAndUsePotionEnabled = Config.CurrentConfig.AutoBuyAndUsePotionEnabled
if type(AutoBuyAndUsePotionEnabled) ~= "boolean" then
    AutoBuyAndUsePotionEnabled = Config.DefaultConfig.AutoBuyAndUsePotionEnabled
end
local Tweening = false
local AllPotions = {}
local PotionDropdown = nil
local PotionTween = nil

-- Sell variables
local ItemNames = type(Config.CurrentConfig.SelectedItemName) == "string" and {Config.CurrentConfig.SelectedItemName} or (type(Config.CurrentConfig.SelectedItemName) ~= "table" and {} or Config.CurrentConfig.SelectedItemName)
local AutoSellItemEnabled = Config.CurrentConfig.AutoSellItemEnabled
if type(AutoSellItemEnabled) ~= "boolean" then
    AutoSellItemEnabled = Config.DefaultConfig.AutoSellItemEnabled
end
local SellNPC = nil
local DialogueOpened = false
local AllItems = {}
local ItemDropdown = nil

-- Teleport variables
local SelectedNPC = nil
local AllNPCs = {}
local NPCDropdown = nil
local SelectedShop = nil
local AllShops = {}
local ShopDropdown = nil

local Sections = {
    Farm = Tabs.Farm:Section({Side = "Left"}),
    Enemy = Tabs.Farm:Section({Side = "Right"}),
    ShopPotion = Tabs.Shop:Section({Side = "Left"}),
    SellItem = Tabs.Shop:Section({Side = "Right"}),
    TeleportNPC = Tabs.Teleport:Section({Side = "Left"}),
    TeleportShop = Tabs.Teleport:Section({Side = "Right"}),
    SettingsInfo = Tabs.Settings:Section({Side = "Left"}),
    SettingsMisc = Tabs.Settings:Section({Side = "Right"})
}

Sections.Farm:Header({Name = "Mine"})

-- Mining functions
local function GetAllRockTypes()
    AllRockTypes = {}
    local Seen = {}
    local Assets = ReplicatedStorage:FindFirstChild("Assets")
    if not Assets then return AllRockTypes end
    local Rocks = Assets:FindFirstChild("Rocks")
    if not Rocks then return AllRockTypes end
    for _, Desc in ipairs(Rocks:GetDescendants()) do
        if Desc:IsA("Model") then
            local Name = Desc.Name
            if typeof(Name) == "string" and Name ~= "" and not Name:match("^%d+$") and not Seen[Name] then
                Seen[Name] = true
                table.insert(AllRockTypes, Name)
            end
        end
    end
    table.sort(AllRockTypes)
    return AllRockTypes
end

local function GetRockParts(RockName)
    local Parts = {}
    if not RockName or RockName == "" then return Parts end
    local RocksFolder = workspace:FindFirstChild("Rocks")
    if not RocksFolder then return Parts end
    for _, Desc in ipairs(RocksFolder:GetDescendants()) do
        if Desc:IsA("BasePart") then
            local Model = Desc:FindFirstAncestorWhichIsA("Model")
            if Model and Model.Name == RockName then
                table.insert(Parts, Desc)
            end
        end
    end
    return Parts
end

local function GetClosestRock(RockNames)
    if not RockNames or #RockNames == 0 then return nil end
    local Character = Players.LocalPlayer.Character
    if not Character then return nil end
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    if not RootPart then return nil end
    local IsAll = false
    for _, Name in ipairs(RockNames) do
        if Name == "All" then
            IsAll = true
            break
        end
    end
    if IsAll then
        RockNames = AllRockTypes
    end
    local ClosestDist = math.huge
    local ClosestPart = nil
    for _, RockName in ipairs(RockNames) do
        local Parts = GetRockParts(RockName)
        for _, Part in ipairs(Parts) do
            if Part and Part.Parent then
                local Dist = (RootPart.Position - Part.Position).Magnitude
                if Dist < ClosestDist then
                    ClosestPart = Part
                    ClosestDist = Dist
                end
            end
        end
    end
    return ClosestPart
end

local function TweenToRock(Part)
    local Character = Players.LocalPlayer.Character
    if not Character then return false end
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    if not (RootPart and Part and Part.Parent) then return false end
    local OffsetY = -(MineDistance or 3)
    local TargetPos = Part.Position + Vector3.new(0, OffsetY, 0)
    local LookAt = Part.Position + Vector3.new(0, 5, 0)
    local Dist = (RootPart.Position - TargetPos).Magnitude
    local Time = Dist <= 100 and math.clamp(Dist / 20, 0.4, 4) or math.clamp(Dist / 4, 2, 12)
    local Tween = TweenService:Create(RootPart, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        CFrame = CFrame.new(TargetPos, LookAt)
    })
    Tween:Play()
    Tween.Completed:Wait()
    return true
end

local function MineRock(Part, RockName)
    if Part and RockName and RockName ~= "" then
        local Model = Part:FindFirstAncestorWhichIsA("Model")
        if Model and Model.Name == RockName then
            local Args = {"Pickaxe"}
            local ToolRemote = ReplicatedStorage.Shared.Packages.Knit.Services.ToolService.RF.ToolActivated
            local Character = Players.LocalPlayer.Character
            if Character then
                local RootPart = Character:FindFirstChild("HumanoidRootPart")
                if RootPart then
                    local OriginalChar = Character
                    local OriginalAngular = RootPart.AssemblyAngularVelocity
                    RootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    local BodyVel = RootPart:FindFirstChild("BodyVelocity")
                    if not BodyVel then
                        BodyVel = Instance.new("BodyVelocity")
                        BodyVel.MaxForce = Vector3.new(4000, 4000, 4000)
                        BodyVel.Velocity = Vector3.new(0, 0, 0)
                        BodyVel.Parent = RootPart
                    end
                    local Connection
                    Connection = RunService.Heartbeat:Connect(function()
                        if AutoMineEnabled and Model and Model.Parent and Players.LocalPlayer.Character == OriginalChar and RootPart and RootPart.Parent and not Tweening then
                            local TargetY = -(MineDistance or 3)
                            local TargetPos = Part.Position + Vector3.new(0, TargetY, 0)
                            local LookAt = Part.Position + Vector3.new(0, 5, 0)
                            RootPart.CFrame = CFrame.new(TargetPos, LookAt)
                            if BodyVel then
                                BodyVel.Velocity = Vector3.new(0, 0, 0)
                            end
                        else
                            if Connection then Connection:Disconnect() end
                        end
                    end)
                    while AutoMineEnabled and Players.LocalPlayer.Character == OriginalChar and RootPart and RootPart.Parent and not Tweening and Model and Model.Parent do
                        pcall(function()
                            ToolRemote:InvokeServer(unpack(Args))
                        end)
                        task.wait(0.15)
                    end
                    if Connection then Connection:Disconnect() end
                    if BodyVel and BodyVel.Parent then BodyVel:Destroy() end
                    if RootPart and RootPart.Parent then
                        RootPart.AssemblyAngularVelocity = OriginalAngular
                    end
                end
            end
        end
    end
end

AllRockTypes = GetAllRockTypes()
local RockOptions = {"All"}
for _, Rock in ipairs(AllRockTypes) do
    table.insert(RockOptions, Rock)
end
RockDropdown = Sections.Farm:Dropdown({
    Name = "Select Rock",
    Multi = true,
    Required = false,
    Options = RockOptions,
    Default = RockTypes,
    Callback = function(Selection)
        if typeof(Selection) == "table" then
            RockTypes = {}
            local HasAll = false
            for Name, Selected in pairs(Selection) do
                if Selected then
                    if Name == "All" then
                        HasAll = true
                    else
                        table.insert(RockTypes, Name)
                    end
                end
            end
            if HasAll then
                RockTypes = {}
                for _, Rock in ipairs(AllRockTypes) do
                    table.insert(RockTypes, Rock)
                end
                if RockDropdown and RockDropdown.UpdateSelection then
                    RockDropdown:UpdateSelection(RockTypes)
                end
            end
        end
        if RockTypes and #RockTypes > 0 then
            Config.CurrentConfig.SelectedRockType = RockTypes
        else
            RockTypes = {}
            Config.CurrentConfig.SelectedRockType = {}
        end
        Config.SaveConfig()
    end
}, "SelectRockDropdown")

if RockTypes and RockDropdown and RockDropdown.UpdateSelection then
    RockDropdown:UpdateSelection(RockTypes)
end

Sections.Farm:Button({
    Name = "Refresh Rock List",
    Callback = function()
        AllRockTypes = GetAllRockTypes()
        local NewOptions = {"All"}
        for _, Rock in ipairs(AllRockTypes) do
            table.insert(NewOptions, Rock)
        end
        if RockDropdown then
            if RockDropdown.ClearOptions then RockDropdown:ClearOptions() end
            if RockDropdown.InsertOptions then RockDropdown:InsertOptions(NewOptions) end
            if RockTypes and RockDropdown.UpdateSelection then RockDropdown:UpdateSelection(RockTypes) end
        end
    end
}, "RefreshRockListButton")

local DistanceOptions = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
local MineDistanceDropdown = Sections.Farm:Dropdown({
    Name = "Select Distance",
    Multi = false,
    Required = false,
    Options = DistanceOptions,
    Default = tostring(MineDistance),
    Callback = function(Selection)
        local Selected
        if typeof(Selection) ~= "table" then
            Selected = Selection
        else
            for Name, Val in pairs(Selection) do
                if Val then
                    Selected = Name
                    break
                end
            end
        end
        local Num = tonumber(Selected)
        if Num and 1 <= Num and Num <= 10 then
            MineDistance = Num
            Config.CurrentConfig.SelectedMineDistance = Num
            Config.SaveConfig()
        end
    end
}, "SelectMineDistanceDropdown")

if MineDistance and MineDistanceDropdown and MineDistanceDropdown.UpdateSelection then
    MineDistanceDropdown:UpdateSelection(tostring(MineDistance))
end

Sections.Farm:Toggle({
    Name = "Auto Mine",
    Default = AutoMineEnabled,
    Callback = function(Value)
        AutoMineEnabled = Value
        Config.CurrentConfig.AutoMineEnabled = Value
        Config.SaveConfig()
        if Value and (not RockTypes or #RockTypes == 0) then
            Notify("Mine", "Please select a rock type!", 4)
        end
    end
}, "AutoMineToggle")

task.spawn(function()
    while task.wait(0.3) do
        if AutoMineEnabled and RockTypes and #RockTypes > 0 and not Tweening then
            local Character = Players.LocalPlayer.Character
            local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
            local ClosestRockPart = Character and RootPart and GetClosestRock(RockTypes)
            if ClosestRockPart then
                TweenToRock(ClosestRockPart)
                local Model = ClosestRockPart:FindFirstAncestorWhichIsA("Model")
                MineRock(ClosestRockPart, Model and Model.Name or nil)
            end
        end
    end
end)

Sections.Enemy:Header({Name = "Enemy"})

-- Enemy functions
local function GetBaseMobName(MobName)
    if MobName and MobName ~= "" then
        local Base = MobName:gsub("%d+$", "")
        if Base == "" then return nil end
        return Base:gsub("%s+$", "")
    end
    return nil
end

local function GetAllEnemyTypes()
    AllEnemyTypes = {}
    local Seen = {}
    local Assets = ReplicatedStorage:FindFirstChild("Assets")
    if not Assets then return AllEnemyTypes end
    local Mobs = Assets:FindFirstChild("Mobs")
    if not Mobs then return AllEnemyTypes end
    for _, Desc in ipairs(Mobs:GetDescendants()) do
        if Desc:IsA("Model") and Desc.Name ~= "Model" then
            local BaseName = GetBaseMobName(Desc.Name)
            if BaseName and BaseName ~= "" and not Seen[BaseName] then
                Seen[BaseName] = true
                table.insert(AllEnemyTypes, BaseName)
            end
        end
    end
    table.sort(AllEnemyTypes)
    return AllEnemyTypes
end

local function GetMobModels(MobBaseName)
    local Models = {}
    if not MobBaseName or MobBaseName == "" then return Models end
    local Living = workspace:FindFirstChild("Living")
    if not Living then return Models end
    for _, Child in ipairs(Living:GetChildren()) do
        if Child:IsA("Model") and GetBaseMobName(Child.Name) == MobBaseName then
            table.insert(Models, Child)
        end
    end
    return Models
end

local function IsMobDead(Mob)
    if not (Mob and Mob.Parent) then return true end
    local Status = Mob:FindFirstChild("Status")
    return Status and Status:FindFirstChild("Dead") or false
end

local function GetClosestEnemy(EnemyBaseNames)
    local Character = Players.LocalPlayer.Character
    if not Character then return nil end
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    if not RootPart then return nil end
    local IsAll = false
    for _, Name in ipairs(EnemyBaseNames) do
        if Name == "All" then
            IsAll = true
            break
        end
    end
    if IsAll then
        EnemyBaseNames = AllEnemyTypes
    end
    local Models = {}
    for _, BaseName in ipairs(EnemyBaseNames) do
        local TheseModels = GetMobModels(BaseName)
        for _, Model in ipairs(TheseModels) do
            table.insert(Models, Model)
        end
    end
    local ClosestDist = math.huge
    local ClosestMob = nil
    for _, Mob in ipairs(Models) do
        if not IsMobDead(Mob) and Mob and Mob.Parent then
            local MobRoot = Mob:FindFirstChild("HumanoidRootPart") or Mob.PrimaryPart or Mob:FindFirstChildWhichIsA("BasePart", true)
            if MobRoot then
                local Dist = (RootPart.Position - MobRoot.Position).Magnitude
                if Dist < ClosestDist then
                    ClosestMob = Mob
                    ClosestDist = Dist
                end
            end
        end
    end
    return ClosestMob
end

local function TweenToEnemy(Mob, OffsetY)
    local Character = Players.LocalPlayer.Character
    if not Character then return false end
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    if not (RootPart and Mob and Mob.Parent) then return false end
    local MobRoot = Mob:FindFirstChild("HumanoidRootPart") or Mob.PrimaryPart or Mob:FindFirstChildWhichIsA("BasePart", true)
    if not MobRoot then return false end
    if CurrentEnemyTween then
        pcall(function() CurrentEnemyTween:Cancel() end)
    end
    local TargetPos = MobRoot.Position + Vector3.new(0, OffsetY, 0)
    local Dist = (RootPart.Position - TargetPos).Magnitude
    local Time = Dist <= 100 and math.clamp(Dist / 20, 0.4, 4) or math.clamp(Dist / 8, 0.8, 7)
    CurrentEnemyTween = TweenService:Create(RootPart, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        CFrame = CFrame.new(TargetPos, MobRoot.Position)
    })
    CurrentEnemyTween:Play()
    return true
end

local function FarmEnemy(Mob, MobBaseName)
    if Mob and MobBaseName and MobBaseName ~= "" then
        if Mob and Mob.Parent then
            local Args = {"Weapon"}
            local ToolRemote = ReplicatedStorage.Shared.Packages.Knit.Services.ToolService.RF.ToolActivated
            local Character = Players.LocalPlayer.Character
            if Character then
                local RootPart = Character:FindFirstChild("HumanoidRootPart")
                if RootPart then
                    local OriginalChar = Character
                    local OriginalAngular = RootPart.AssemblyAngularVelocity
                    RootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    local BodyVel = RootPart:FindFirstChild("BodyVelocity")
                    if not BodyVel then
                        BodyVel = Instance.new("BodyVelocity")
                        BodyVel.MaxForce = Vector3.new(4000, 4000, 4000)
                        BodyVel.Velocity = Vector3.new(0, 0, 0)
                        BodyVel.Parent = RootPart
                    end
                    local TweenCompleted = false
                    if CurrentEnemyTween then
                        task.spawn(function()
                            pcall(function()
                                CurrentEnemyTween.Completed:Wait()
                            end)
                            TweenCompleted = true
                        end)
                    else
                        TweenCompleted = true
                    end
                    local Connection
                    Connection = RunService.Heartbeat:Connect(function()
                        if TweenCompleted then
                            if AutoFarmEnemyEnabled and Mob and Mob.Parent and not IsMobDead(Mob) and Players.LocalPlayer.Character == OriginalChar and RootPart and RootPart.Parent and not Tweening then
                                local MobRoot = Mob:FindFirstChild("HumanoidRootPart") or Mob.PrimaryPart or Mob:FindFirstChildWhichIsA("BasePart", true)
                                if MobRoot and RootPart and RootPart.Parent then
                                    local TargetPos = MobRoot.Position + Vector3.new(0, FarmDistance, 0)
                                    RootPart.CFrame = CFrame.new(TargetPos, MobRoot.Position)
                                    if BodyVel then BodyVel.Velocity = Vector3.new(0, 0, 0) end
                                end
                            else
                                if Connection then Connection:Disconnect() end
                            end
                        end
                    end)
                    while AutoFarmEnemyEnabled and Players.LocalPlayer.Character == OriginalChar and RootPart and RootPart.Parent and not Tweening and not IsMobDead(Mob) and Mob and Mob.Parent do
                        pcall(function()
                            ToolRemote:InvokeServer(unpack(Args))
                        end)
                        task.wait(0.15)
                    end
                    if CurrentEnemyTween then
                        pcall(function() CurrentEnemyTween:Cancel() end)
                        CurrentEnemyTween = nil
                    end
                    if Connection then Connection:Disconnect() end
                    if BodyVel and BodyVel.Parent then BodyVel:Destroy() end
                    if RootPart and RootPart.Parent then
                        RootPart.AssemblyAngularVelocity = OriginalAngular
                    end
                end
            end
        end
    end
end

AllEnemyTypes = GetAllEnemyTypes()
local EnemyOptions = {"All"}
for _, Enemy in ipairs(AllEnemyTypes) do
    table.insert(EnemyOptions, Enemy)
end
EnemyDropdown = Sections.Enemy:Dropdown({
    Name = "Select Enemy",
    Multi = true,
    Required = false,
    Options = EnemyOptions,
    Default = EnemyTypes,
    Callback = function(Selection)
        if typeof(Selection) == "table" then
            EnemyTypes = {}
            local HasAll = false
            for Name, Selected in pairs(Selection) do
                if Selected then
                    if Name == "All" then
                        HasAll = true
                    else
                        table.insert(EnemyTypes, Name)
                    end
                end
            end
            if HasAll then
                EnemyTypes = {}
                for _, Enemy in ipairs(AllEnemyTypes) do
                    table.insert(EnemyTypes, Enemy)
                end
                if EnemyDropdown and EnemyDropdown.UpdateSelection then
                    EnemyDropdown:UpdateSelection(EnemyTypes)
                end
            end
        end
        if EnemyTypes and #EnemyTypes > 0 then
            Config.CurrentConfig.SelectedEnemyType = EnemyTypes
        else
            EnemyTypes = {}
            Config.CurrentConfig.SelectedEnemyType = {}
        end
        Config.SaveConfig()
    end
}, "SelectEnemyDropdown")

if EnemyTypes and EnemyDropdown and EnemyDropdown.UpdateSelection then
    EnemyDropdown:UpdateSelection(EnemyTypes)
end

Sections.Enemy:Button({
    Name = "Refresh Enemy List",
    Callback = function()
        AllEnemyTypes = GetAllEnemyTypes()
        local NewOptions = {"All"}
        for _, Enemy in ipairs(AllEnemyTypes) do
            table.insert(NewOptions, Enemy)
        end
        if EnemyDropdown then
            if EnemyDropdown.ClearOptions then EnemyDropdown:ClearOptions() end
            if EnemyDropdown.InsertOptions then EnemyDropdown:InsertOptions(NewOptions) end
            if EnemyTypes and EnemyDropdown.UpdateSelection then EnemyDropdown:UpdateSelection(EnemyTypes) end
        end
    end
}, "RefreshEnemyListButton")

local FarmDistanceDropdown = Sections.Enemy:Dropdown({
    Name = "Select Distance",
    Multi = false,
    Required = false,
    Options = DistanceOptions,
    Default = tostring(FarmDistance),
    Callback = function(Selection)
        local Selected
        if typeof(Selection) ~= "table" then
            Selected = Selection
        else
            for Name, Val in pairs(Selection) do
                if Val then
                    Selected = Name
                    break
                end
            end
        end
        local Num = tonumber(Selected)
        if Num and 1 <= Num and Num <= 10 then
            FarmDistance = Num
            Config.CurrentConfig.SelectedDistance = Num
            Config.SaveConfig()
        end
    end
}, "SelectDistanceDropdown")

if FarmDistance and FarmDistanceDropdown and FarmDistanceDropdown.UpdateSelection then
    FarmDistanceDropdown:UpdateSelection(tostring(FarmDistance))
end

Sections.Enemy:Toggle({
    Name = "Auto Farm Enemy",
    Default = AutoFarmEnemyEnabled,
    Callback = function(Value)
        AutoFarmEnemyEnabled = Value
        Config.CurrentConfig.AutoFarmEnemyEnabled = Value
        Config.SaveConfig()
        if Value and (not EnemyTypes or #EnemyTypes == 0) then
            Notify("Enemy", "Please select an enemy type!", 4)
        end
    end
}, "AutoFarmEnemyToggle")

task.spawn(function()
    while task.wait(0.3) do
        if AutoFarmEnemyEnabled and EnemyTypes and #EnemyTypes > 0 and not Tweening then
            local ClosestEnemy = GetClosestEnemy(EnemyTypes)
            if ClosestEnemy then
                if IsMobDead(ClosestEnemy) then
                    task.wait(0.1)
                else
                    TweenToEnemy(ClosestEnemy, FarmDistance)
                    local BaseName = GetBaseMobName(ClosestEnemy.Name)
                    FarmEnemy(ClosestEnemy, BaseName)
                end
            else
                task.wait(0.1)
            end
        end
    end
end)

-- Potion functions
local function GetAllPotions()
    AllPotions = {}
    local Assets = ReplicatedStorage:FindFirstChild("Assets")
    if not Assets then return AllPotions end
    local Extras = Assets:FindFirstChild("Extras")
    if not Extras then return AllPotions end
    local PotionFolder = Extras:FindFirstChild("Potion")
    if not PotionFolder then return AllPotions end
    for _, Child in ipairs(PotionFolder:GetChildren()) do
        if Child:IsA("Model") then
            table.insert(AllPotions, Child.Name)
        end
    end
    table.sort(AllPotions)
    return AllPotions
end

Sections.ShopPotion:Header({Name = "Shop Potion"})

local function TweenToShop()
    local Character = Players.LocalPlayer.Character
    if not Character then return false end
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    if not RootPart then return false end
    local PlaceId = game.PlaceId
    local ShopPos
    if PlaceId == 76558904092080 then
        ShopPos = Vector3.new(-153.73959721191406, 27.377073287963867, 116.34660339355469)
    elseif PlaceId == 129009554587176 then
        ShopPos = Vector3.new(-96.84030151367188, 20.6254825592041, -43.52947235107422)
    else
        ShopPos = Vector3.new(-153.73959721191406, 27.377073287963867, 116.34660339355469)
    end
    local Dist = (RootPart.Position - ShopPos).Magnitude
    local Time = math.clamp(Dist / 8, 1.2, 12)
    local LookAt = ShopPos + RootPart.CFrame.LookVector * Vector3.new(1, 0, 1)
    local TargetCFrame = CFrame.new(ShopPos, LookAt)
    if PotionTween then
        pcall(function() PotionTween:Cancel() end)
        PotionTween = nil
    end
    PotionTween = TweenService:Create(RootPart, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {CFrame = TargetCFrame})
    PotionTween:Play()
    local Completed = false
    PotionTween.Completed:Connect(function() Completed = true end)
    while not Completed do
        if not AutoBuyAndUsePotionEnabled then
            pcall(function() PotionTween:Cancel() end)
            PotionTween = nil
            return false
        end
        task.wait(0.05)
    end
    PotionTween = nil
    return true
end

AllPotions = GetAllPotions()
PotionDropdown = Sections.ShopPotion:Dropdown({
    Name = "Select Potion",
    Multi = false,
    Required = false,
    Options = AllPotions,
    Default = SelectedPotionName,
    Callback = function(Selection)
        local Selected
        if typeof(Selection) ~= "table" then
            Selected = Selection
        else
            for Name, Val in pairs(Selection) do
                if Val then
                    Selected = Name
                    break
                end
            end
        end
        if Selected and Selected ~= "" then
            SelectedPotionName = Selected
            Config.CurrentConfig.SelectedPotionName = Selected
        else
            SelectedPotionName = nil
            Config.CurrentConfig.SelectedPotionName = nil
        end
        Config.SaveConfig()
    end
}, "SelectPotionDropdown")

if SelectedPotionName and PotionDropdown and PotionDropdown.UpdateSelection then
    PotionDropdown:UpdateSelection(SelectedPotionName)
end

Sections.ShopPotion:Button({
    Name = "Refresh Potion List",
    Callback = function()
        AllPotions = GetAllPotions()
        if PotionDropdown then
            if PotionDropdown.ClearOptions then PotionDropdown:ClearOptions() end
            if PotionDropdown.InsertOptions then PotionDropdown:InsertOptions(AllPotions) end
            if SelectedPotionName and PotionDropdown.UpdateSelection then PotionDropdown:UpdateSelection(SelectedPotionName) end
        end
        Notify("Shop Potion", "Đã cập nhật danh sách potion.", 3)
    end
}, "RefreshPotionListButton")

Sections.ShopPotion:Toggle({
    Name = "Auto Buy And Use",
    Default = AutoBuyAndUsePotionEnabled,
    Callback = function(Value)
        AutoBuyAndUsePotionEnabled = Value
        Config.CurrentConfig.AutoBuyAndUsePotionEnabled = Value
        Config.SaveConfig()
        if Value and not SelectedPotionName then
            Notify("Shop Potion", "Chưa chọn potion!", 3)
        end
    end
}, "AutoBuyAndUsePotionToggle")

local function GetPerkName(PotionName)
    if PotionName and PotionName ~= "" then
        local Map = {
            MovementSpeedPotion1 = "SpeedPotion1",
            LuckyPotion1 = "LuckPotion1"
        }
        return Map[PotionName] or PotionName
    end
    return nil
end

local function HasPerk(PotionName)
    local Player = Players.LocalPlayer
    if Player then
        local PlayerGui = Player:FindFirstChild("PlayerGui")
        if PlayerGui then
            local Hotbar = PlayerGui:FindFirstChild("Hotbar")
            if Hotbar then
                local Perks = Hotbar:FindFirstChild("Perks")
                if Perks then
                    local PerkName = GetPerkName(PotionName)
                    return Perks:FindFirstChild(PerkName) or Perks:FindFirstChild(PotionName)
                end
            end
        end
    end
    return false
end

task.spawn(function()
    local ToolRemote = ReplicatedStorage.Shared.Packages.Knit.Services.ToolService.RF.ToolActivated
    while true do
        task.wait(0.5)
        if AutoBuyAndUsePotionEnabled and SelectedPotionName then
            Tweening = true
            local Backpack = Players.LocalPlayer:FindFirstChild("Backpack")
            local HasInBackpack = Backpack and Backpack:FindFirstChild(SelectedPotionName)
            local HasEnoughGold = false
            local PlayerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
            if PlayerGui then
                local Main = PlayerGui:FindFirstChild("Main")
                if Main then
                    local Screen = Main:FindFirstChild("Screen")
                    if Screen then
                        local Hud = Screen:FindFirstChild("Hud")
                        if Hud then
                            local GoldLabel = Hud:FindFirstChild("Gold")
                            if GoldLabel and GoldLabel:IsA("TextLabel") then
                                local GoldText = (GoldLabel.Text or ""):gsub("[^%d%.]", "")
                                HasEnoughGold = (tonumber(GoldText) or 0) >= 600
                            end
                        end
                    end
                end
            end
            if HasInBackpack then
                if AutoBuyAndUsePotionEnabled then
                    pcall(function()
                        ToolRemote:InvokeServer(SelectedPotionName)
                    end)
                end
            elseif not HasPerk(SelectedPotionName) and AutoBuyAndUsePotionEnabled and TweenToShop() and AutoBuyAndUsePotionEnabled and HasEnoughGold then
                pcall(function()
                    PurchaseRemote:InvokeServer(SelectedPotionName, 3)
                end)
            end
            Tweening = false
        else
            Tweening = false
        end
    end
end)

Sections.SellItem:Header({Name = "Sell Item"})

-- Sell functions
local function GetAllItems()
    AllItems = {}
    local Assets = ReplicatedStorage:FindFirstChild("Assets")
    if not Assets then return AllItems end
    local Ores = Assets:FindFirstChild("Ores")
    if not Ores then return AllItems end
    for _, Child in ipairs(Ores:GetChildren()) do
        if Child:IsA("Model") then
            table.insert(AllItems, Child.Name)
        end
    end
    table.sort(AllItems)
    return AllItems
end

local function GetItemQuantity(ItemName)
    local Player = Players.LocalPlayer
    if not Player then return 0 end
    local PlayerGui = Player:FindFirstChild("PlayerGui")
    if not PlayerGui then return 0 end
    local Menu = PlayerGui:FindFirstChild("Menu")
    if not Menu then return 0 end
    local Frame = Menu:FindFirstChild("Frame")
    if not Frame then return 0 end
    local InnerFrame = Frame:FindFirstChild("Frame")
    if not InnerFrame then return 0 end
    local Menus = InnerFrame:FindFirstChild("Menus")
    if not Menus then return 0 end
    local Stash = Menus:FindFirstChild("Stash")
    if not Stash then return 0 end
    local Background = Stash:FindFirstChild("Background")
    if not Background then return 0 end
    local ItemFrame = Background:FindFirstChild(ItemName)
    if not ItemFrame then return 0 end
    local Main = ItemFrame:FindFirstChild("Main")
    if not Main then return 0 end
    local QuantityLabel = Main:FindFirstChild("Quantity")
    if not (QuantityLabel and QuantityLabel:IsA("TextLabel")) then return 0 end
    local QtyText = (QuantityLabel.Text or ""):gsub("[^%d]", "")
    return tonumber(QtyText) or 0
end

local function GetItemOptions()
    local Options = {}
    for _, Item in ipairs(AllItems) do
        local Qty = GetItemQuantity(Item)
        if Qty > 0 then
            table.insert(Options, Item .. " (" .. tostring(Qty) .. ")")
        else
            table.insert(Options, Item)
        end
    end
    return Options
end

AllItems = GetAllItems()
local ItemOptions = GetItemOptions()

local function GetSelectedItemOptions()
    local Options = {}
    for _, Item in ipairs(ItemNames or {}) do
        local Qty = GetItemQuantity(Item)
        if Qty > 0 then
            table.insert(Options, Item .. " (" .. tostring(Qty) .. ")")
        else
            table.insert(Options, Item)
        end
    end
    return Options
end

ItemDropdown = Sections.SellItem:Dropdown({
    Name = "Select Item",
    Multi = true,
    Required = false,
    Options = ItemOptions,
    Default = GetSelectedItemOptions(),
    Callback = function(Selection)
        if typeof(Selection) ~= "table" then
            ItemNames = {}
        else
            ItemNames = {}
            for Name, Selected in pairs(Selection) do
                if Selected then
                    local CleanName = Name:gsub("%s*%(%d+%)", "")
                    table.insert(ItemNames, CleanName)
                end
            end
        end
        Config.CurrentConfig.SelectedItemName = ItemNames
        Config.SaveConfig()
    end
}, "SelectItemDropdown")

if ItemNames and #ItemNames > 0 and ItemDropdown and ItemDropdown.UpdateSelection then
    local SelOpts = GetSelectedItemOptions()
    if #SelOpts > 0 then
        ItemDropdown:UpdateSelection(SelOpts)
    end
end

Sections.SellItem:Button({
    Name = "Refresh Item List",
    Callback = function()
        AllItems = GetAllItems()
        local NewOptions = GetItemOptions()
        if ItemDropdown then
            if ItemDropdown.ClearOptions then ItemDropdown:ClearOptions() end
            if ItemDropdown.InsertOptions then ItemDropdown:InsertOptions(NewOptions) end
            if ItemNames and #ItemNames > 0 then
                local NewSel = {}
                for _, Item in ipairs(ItemNames) do
                    for _, Opt in ipairs(NewOptions) do
                        if Opt:gsub("%s*%(%d+%)", "") == Item then
                            table.insert(NewSel, Opt)
                            break
                        end
                    end
                end
                if #NewSel > 0 and ItemDropdown.UpdateSelection then
                    ItemDropdown:UpdateSelection(NewSel)
                end
            end
        end
    end
}, "RefreshItemListButton")

Sections.SellItem:Toggle({
    Name = "Auto Sell Item",
    Default = AutoSellItemEnabled,
    Callback = function(Value)
        AutoSellItemEnabled = Value
        Config.CurrentConfig.AutoSellItemEnabled = Value
        Config.SaveConfig()
        if Value then
            if ItemNames and #ItemNames > 0 then
                SellNPC = nil
                DialogueOpened = false
            else
                Notify("Sell Item", "Please select an item!", 3)
            end
        else
            SellNPC = nil
            DialogueOpened = false
        end
    end
}, "AutoSellItemToggle")

task.spawn(function()
    local DialogueRemote = ReplicatedStorage.Shared.Packages.Knit.Services.DialogueService.RF.RunCommand
    local ForceDialogueRemote = ReplicatedStorage.Shared.Packages.Knit.Services.ProximityService.RF.ForceDialogue
    while true do
        task.wait(1)
        if AutoSellItemEnabled and ItemNames and #ItemNames > 0 then
            if not SellNPC then
                local Proximity = workspace:FindFirstChild("Proximity")
                local GreedyCey = Proximity and Proximity:FindFirstChild("Greedy Cey")
                if GreedyCey then
                    SellNPC = GreedyCey
                end
            end
            if SellNPC and not DialogueOpened then
                pcall(function()
                    ForceDialogueRemote:InvokeServer(SellNPC, "SellConfirmMisc")
                end)
                DialogueOpened = true
                task.wait(0.5)
            end
        end
    end
end)

task.spawn(function()
    local DialogueRemote = ReplicatedStorage.Shared.Packages.Knit.Services.DialogueService.RF.RunCommand
    while true do
        task.wait(1)
        if DialogueOpened and AutoSellItemEnabled and ItemNames and #ItemNames > 0 then
            local Basket = {}
            local HasItems = false
            for _, Item in ipairs(ItemNames) do
                local Qty = GetItemQuantity(Item)
                if Qty > 0 then
                    Basket[Item] = Qty
                    HasItems = true
                end
            end
            if HasItems then
                pcall(function()
                    DialogueRemote:InvokeServer("SellConfirm", {Basket = Basket})
                end)
            end
            DialogueOpened = false
        end
    end
end)

Sections.TeleportNPC:Header({Name = "Tween To NPC"})

-- Teleport functions
local function GetAllNPCs()
    AllNPCs = {}
    local Proximity = workspace:FindFirstChild("Proximity")
    if not Proximity then return AllNPCs end
    for _, Child in ipairs(Proximity:GetChildren()) do
        if Child:IsA("Model") and not Child.Name:lower():find("potion") then
            table.insert(AllNPCs, Child.Name)
        end
    end
    table.sort(AllNPCs)
    return AllNPCs
end

local function GetAllShops()
    AllShops = {}
    local Shops = workspace:FindFirstChild("Shops")
    if not Shops then return AllShops end
    for _, Child in ipairs(Shops:GetChildren()) do
        if Child:IsA("Model") then
            table.insert(AllShops, Child.Name)
        end
    end
    table.sort(AllShops)
    return AllShops
end

local function TweenToTarget(TargetName, IsNPC)
    local Character = Players.LocalPlayer.Character
    if not Character then
        Notify("Teleport", "Character not found!", 3)
        return false
    end
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    if not RootPart then
        Notify("Teleport", "HumanoidRootPart not found!", 3)
        return false
    end
    local Folder = IsNPC and workspace:FindFirstChild("Proximity") or workspace:FindFirstChild("Shops")
    if not Folder then
        Notify("Teleport", "Không tìm thấy folder!", 3)
        return false
    end
    local Target = Folder:FindFirstChild(TargetName)
    if not Target then
        Notify("Teleport", "Không tìm thấy " .. TargetName .. "!", 3)
        return false
    end
    local TargetRoot = Target:FindFirstChild("HumanoidRootPart") or Target.PrimaryPart or Target:FindFirstChildWhichIsA("BasePart", true)
    if not TargetRoot then
        Notify("Teleport", "Không tìm thấy phần tử của " .. TargetName .. "!", 3)
        return false
    end
    local TargetPos = TargetRoot.Position + Vector3.new(0, 3, 0)
    local Dist = (RootPart.Position - TargetPos).Magnitude
    local Time = math.clamp(Dist / 10, 1.5, 8)
    local Tween = TweenService:Create(RootPart, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        CFrame = CFrame.new(TargetPos, TargetRoot.Position)
    })
    Tween:Play()
    Tween.Completed:Wait()
    Notify("Teleport", "Tweened to " .. TargetName, 3)
    return true
end

AllNPCs = GetAllNPCs()
NPCDropdown = Sections.TeleportNPC:Dropdown({
    Name = "Select NPC",
    Multi = false,
    Required = false,
    Options = AllNPCs,
    Default = SelectedNPC,
    Callback = function(Selection)
        local Selected
        if typeof(Selection) ~= "table" then
            Selected = Selection
        else
            for Name, Val in pairs(Selection) do
                if Val then
                    Selected = Name
                    break
                end
            end
        end
        if Selected and Selected ~= "" then
            SelectedNPC = Selected
        else
            SelectedNPC = nil
        end
    end
}, "SelectNPCDropdown")

Sections.TeleportNPC:Button({
    Name = "Refresh NPC List",
    Callback = function()
        AllNPCs = GetAllNPCs()
        if NPCDropdown then
            if NPCDropdown.ClearOptions then NPCDropdown:ClearOptions() end
            if NPCDropdown.InsertOptions then NPCDropdown:InsertOptions(AllNPCs) end
            if SelectedNPC and NPCDropdown.UpdateSelection then NPCDropdown:UpdateSelection(SelectedNPC) end
        end
        Notify("Teleport", "Updated NPC list.", 3)
    end
}, "RefreshNPCListButton")

Sections.TeleportNPC:Button({
    Name = "Tween To NPC",
    Callback = function()
        if SelectedNPC then
            TweenToTarget(SelectedNPC, true)
        else
            Notify("Teleport", "Please select an NPC!", 3)
        end
    end
}, "TweenToNPCButton")

Sections.TeleportShop:Header({Name = "Tween To Shop"})

AllShops = GetAllShops()
ShopDropdown = Sections.TeleportShop:Dropdown({
    Name = "Select Shop",
    Multi = false,
    Required = false,
    Options = AllShops,
    Default = SelectedShop,
    Callback = function(Selection)
        local Selected
        if typeof(Selection) ~= "table" then
            Selected = Selection
        else
            for Name, Val in pairs(Selection) do
                if Val then
                    Selected = Name
                    break
                end
            end
        end
        if Selected and Selected ~= "" then
            SelectedShop = Selected
        else
            SelectedShop = nil
        end
    end
}, "SelectShopDropdown")

Sections.TeleportShop:Button({
    Name = "Refresh Shop List",
    Callback = function()
        AllShops = GetAllShops()
        if ShopDropdown then
            if ShopDropdown.ClearOptions then ShopDropdown:ClearOptions() end
            if ShopDropdown.InsertOptions then ShopDropdown:InsertOptions(AllShops) end
            if SelectedShop and ShopDropdown.UpdateSelection then ShopDropdown:UpdateSelection(SelectedShop) end
        end
        Notify("Teleport", "Updated shop list.", 3)
    end
}, "RefreshShopListButton")

Sections.TeleportShop:Button({
    Name = "Tween To Shop",
    Callback = function()
        if SelectedShop then
            TweenToTarget(SelectedShop, false)
        else
            Notify("Teleport", "Please select a shop!", 3)
        end
    end
}, "TweenToShopButton")

-- Settings
local AntiAFKEnabled = Config.CurrentConfig.AntiAFKEnabled
if type(AntiAFKEnabled) ~= "boolean" then
    AntiAFKEnabled = Config.DefaultConfig.AntiAFKEnabled
end

Sections.SettingsInfo:Header({Name = "Script Information"})
Sections.SettingsInfo:Label({Text = "The Forge Script\nPlayer: " .. PlayerName})
Sections.SettingsInfo:Button({
    Name = "Copy Player Name",
    Callback = function()
        if setclipboard then
            setclipboard(PlayerName)
            Notify("Notification", "Copied player name.", 3)
        else
            Notify("Notification", PlayerName, 3)
        end
    end
}, "CopyPlayerNameButton")
Sections.SettingsInfo:SubLabel({Text = "Shortcut: Left Alt (or mobile icon) to hide/show UI"})

Sections.SettingsMisc:Header({Name = "Misc"})
Sections.SettingsMisc:Toggle({
    Name = "Anti AFK",
    Default = AntiAFKEnabled,
    Callback = function(Value)
        AntiAFKEnabled = Value
        Config.CurrentConfig.AntiAFKEnabled = Value
        Config.SaveConfig()
        Notify("Anti AFK", (Value and "Enabled" or "Disabled") .. " Anti AFK", 3)
    end
}, "AntiAFKToggle")

Window:GlobalSetting({
    Name = "UI Blur",
    Default = Window:GetAcrylicBlurState(),
    Callback = function(Value)
        Window:SetAcrylicBlurState(Value)
        Notify(Window.Settings.Title, (Value and "Enabled" or "Disabled") .. " UI Blur", 4)
    end
})
Window:GlobalSetting({
    Name = "Notifications",
    Default = Window:GetNotificationsState(),
    Callback = function(Value)
        Window:SetNotificationsState(Value)
        Notify(Window.Settings.Title, (Value and "Enabled" or "Disabled") .. " Notifications", 4)
    end
})
Window:GlobalSetting({
    Name = "Show User Info",
    Default = Window:GetUserInfoState(),
    Callback = function(Value)
        Window:SetUserInfoState(Value)
        Notify(Window.Settings.Title, (Value and "Showing" or "Redacted") .. " User Info", 4)
    end
})

Tabs.Farm:Select()

Window.onUnloaded(function()
    Notify("HT HUB | The Forge", "UI has been closed.", 3)
end)

Library:LoadAutoLoadConfig()

task.spawn(function()
    while task.wait(5) do
        pcall(Config.SaveConfig)
    end
end)

task.spawn(function()
    local VirtualUser = game:GetService("VirtualUser")
    while true do
        task.wait(120)
        if AntiAFKEnabled then
            pcall(function()
                local Camera = workspace.CurrentCamera
                if Camera then
                    VirtualUser:Button2Down(Vector2.new(0, 0), Camera.CFrame)
                    task.wait(1)
                    VirtualUser:Button2Up(Vector2.new(0, 0), Camera.CFrame)
                end
                print("Anti-AFK running at:", os.time())
            end)
        end
    end
end)

task.spawn(function()
    local Success, Err = pcall(function()
        if not getgenv().LoadedTheForgeMobileUI then
            getgenv().LoadedTheForgeMobileUI = true
            local ScreenGui = Instance.new("ScreenGui")
            local ImageButton = Instance.new("ImageButton")
            local UICorner = Instance.new("UICorner")
            if syn and syn.protect_gui then
                syn.protect_gui(ScreenGui)
                ScreenGui.Parent = game:GetService("CoreGui")
            elseif gethui then
                ScreenGui.Parent = gethui()
            else
                ScreenGui.Parent = game:GetService("CoreGui")
            end
            ScreenGui.Name = "TheForge_MobileUIButton"
            ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            ScreenGui.ResetOnSpawn = false
            ImageButton.Parent = ScreenGui
            ImageButton.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
            ImageButton.BackgroundTransparency = 0.8
            ImageButton.Position = UDim2.new(0.9, 0, 0.1, 0)
            ImageButton.Size = UDim2.new(0, 50, 0, 50)
            ImageButton.Image = "rbxassetid://90319448802378"
            ImageButton.Draggable = true
            ImageButton.Transparency = 0.2
            UICorner.CornerRadius = UDim.new(0, 200)
            UICorner.Parent = ImageButton
            ImageButton.MouseEnter:Connect(function()
                TweenService:Create(ImageButton, TweenInfo.new(0.2), {
                    BackgroundTransparency = 0.5,
                    Transparency = 0
                }):Play()
            end)
            ImageButton.MouseLeave:Connect(function()
                TweenService:Create(ImageButton, TweenInfo.new(0.2), {
                    BackgroundTransparency = 0.8,
                    Transparency = 0.2
                }):Play()
            end)
            ImageButton.MouseButton1Click:Connect(function()
                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftAlt, false, game)
                task.wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.LeftAlt, false, game)
            end)
        end
    end)
    if not Success then
        warn("Error creating mobile UI button (HT HUB | The Forge): " .. tostring(Err))
    end
end)

Notify("HT HUB | The Forge", "Script loaded successfully!\nPress Left Alt or mobile icon to hide/show UI", 5)
print("HTHubTheForge.lua loaded successfully!")
print("remade by zvio")