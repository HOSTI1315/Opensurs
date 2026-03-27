local success, WindUI = pcall(function()
    return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
end)

if not success or not WindUI then
    warn("⚠️ UI failed to load!")
    return
else
    print("✓ UI loaded successfully!")
end

local Window = WindUI:CreateWindow({
    Title = "STREE HUB",
    Icon = "rbxassetid://122683047852451",
    Author = "KirsiaSC | The Forge",
    Folder = "STREE_HUB",
    Size = UDim2.fromOffset(260, 290),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 170,
    HasOutline = true,
    User = {
        Enabled = true,
        Anonymous = true,
    },
})

Window:EditOpenButton({Enabled = false})

local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local G2L = {}

G2L["ScreenGui_1"] = Instance.new("ScreenGui")
G2L["ScreenGui_1"].Parent = Player:WaitForChild("PlayerGui")
G2L["ScreenGui_1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CollectionService:AddTag(G2L["ScreenGui_1"], "main")

G2L["ButtonRezise_2"] = Instance.new("ImageButton")
G2L["ButtonRezise_2"].Parent = G2L["ScreenGui_1"]
G2L["ButtonRezise_2"].BorderSizePixel = 0
G2L["ButtonRezise_2"].Draggable = true
G2L["ButtonRezise_2"].BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Diubah ke hijau
G2L["ButtonRezise_2"].Image = "rbxassetid://123032091977400"
G2L["ButtonRezise_2"].Size = UDim2.new(0, 47, 0, 47)
G2L["ButtonRezise_2"].Position = UDim2.new(0.13, 0, 0.03, 0)
G2L["ButtonRezise_2"].Visible = true

local corner = Instance.new("UICorner", G2L["ButtonRezise_2"])
corner.CornerRadius = UDim.new(0, 8)

local neon = Instance.new("UIStroke", G2L["ButtonRezise_2"])
neon.Thickness = 2
neon.Color = Color3.fromRGB(0, 255, 0)
neon.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local windowVisible = true

G2L["ButtonRezise_2"].MouseButton1Click:Connect(function()
    if windowVisible then
        Window:Close()
    else
        Window:Open()
    end
    windowVisible = not windowVisible
end)

Window:Tag({
    Title = "Version Dev",
    Color = Color3.fromRGB(0, 0, 0),
    Radius = 17,
})

local Tab1 = Window:Tab({Title = "Info", Icon = "info"})
local Tab2 = Window:Tab({Title = "Main", Icon = "landmark"})
local Tab3 = Window:Tab({Title = "Visual", Icon = "eye"})
local Tab4 = Window:Tab({Title = "Shop", Icon = "shopping-bag"})
local Tab5 = Window:Tab({Title = "Setting", Icon = "setting"})

Tab1:Section({
    Title = "Community Support",
	Box = true,
    Icon = "chevrons-left-right-ellipsis",
    TextXAlignment = "Left",
    TextSize = 17,
	Opened = true
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

Tab1:Divider()

Tab1:Keybind({
    Title = "Close/Open UI",
    Desc = "Keybind to Close/Open UI",
    Value = "G",
    Callback = function(v)
        Window:SetToggleKey(Enum.KeyCode[v])
    end
})

local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Root = Character:WaitForChild("HumanoidRootPart")
local ToolActivate = ReplicatedStorage.Shared.Packages.Knit.Services.ToolService.RF.ToolActivated

getgenv().Config = {
    AutoMine = false,
    SafeDistance = 7,
    MaxHP = 500,
    MinSwingDelay = 0.25,
    MaxSwingDelay = 0.45,
    RockFolder = "Island1CaveMid"
}

local function GetRockHP(Hitbox)
    local Model = Hitbox:FindFirstAncestorWhichIsA("Model")
    if not Model then return nil end
    local Info = Model:FindFirstChild("infoFrame", true)
    if not Info then return nil end
    local Frame = Info:FindFirstChild("Frame")
    if not Frame then return nil end
    local HPLabel = Frame:FindFirstChild("rockHP")
    if not HPLabel or not HPLabel:IsA("TextLabel") then return nil end
    local Text = HPLabel.Text or ""
    Text = Text:gsub(",", ""):gsub("[^%d]", "")
    return tonumber(Text)
end

local function GetRockFolder()
    local Rocks = workspace:WaitForChild("Rocks", 5)
    if not Rocks then return nil end
    local Folder = Rocks:FindFirstChild(getgenv().Config.RockFolder)
    if Folder and Folder:IsA("Folder") then
        return Folder
    end
    return nil
end

local function ScanHitboxes()
    local Result = {}
    local Folder = GetRockFolder()
    if not Folder then return Result end
    for _, Inst in ipairs(Folder:GetDescendants()) do
        if Inst.Name == "Hitbox" and Inst:IsA("BasePart") then
            table.insert(Result, Inst)
        end
    end
    return Result
end

local OreList = ScanHitboxes()
local SelectedFolder = GetRockFolder()
if SelectedFolder then
    SelectedFolder.DescendantAdded:Connect(function(Child)
        if Child.Name == "Hitbox" and Child:IsA("BasePart") then
            table.insert(OreList, Child)
        end
    end)
end

local function GetClosestOre()
    local Best, BestDist = nil, math.huge
    local RP = Root.Position
    for _, Ore in ipairs(OreList) do
        if Ore and Ore.Parent then
            local HP = GetRockHP(Ore)
            if HP and HP <= getgenv().Config.MaxHP then
                local Dist = (Ore.Position - RP).Magnitude
                if Dist < BestDist then
                    BestDist = Dist
                    Best = Ore
                end
            end
        end
    end
    return Best
end

local function GoTo(TargetPos, FacePos)
    local Distance = (TargetPos - Root.Position).Magnitude
    local Speed = math.random(12, 18)
    local Duration = Distance / Speed
    if Duration < 0.6 then Duration = 0.6 end
    local CF = CFrame.new(TargetPos, FacePos)
    local Tween = TweenService:Create(Root, TweenInfo.new(Duration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {CFrame = CF})
    Tween:Play()
    Tween.Completed:Wait()
end

local CurrentTarget = nil

task.spawn(function()
    while task.wait(0.15) do
        if not getgenv().Config.AutoMine then continue end
        if CurrentTarget and CurrentTarget.Parent then
            local HP = GetRockHP(CurrentTarget)
            if not HP then CurrentTarget = nil continue end
        else
            CurrentTarget = nil
        end
        if not CurrentTarget then
            CurrentTarget = GetClosestOre()
            continue
        end
        local Ore = CurrentTarget
        local Dir = (Ore.Position - Root.Position).Unit
        local TargetPos = Ore.Position - Dir * getgenv().Config.SafeDistance
        GoTo(TargetPos, Ore.Position)
        pcall(function()
            ToolActivate:InvokeServer("Pickaxe")
        end)
        local Delay = math.random(getgenv().Config.MinSwingDelay*100, getgenv().Config.MaxSwingDelay*100)/100
        task.wait(Delay)
    end
end)

Tab2:Toggle({
    Title = "Auto Mine",
    Desc = "Automatic Mine Rocks",
    Value = false,
    Callback = function(state)
        getgenv().Config.AutoMine = state
    end
})

_G.AutoForge = false

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Root = Character:WaitForChild("HumanoidRootPart")
local Backpack = Player:WaitForChild("Backpack")
local TweenService = game:GetService("TweenService")

local function TweenTo(pos)
    local dist = (pos - Root.Position).Magnitude
    local speed = 14
    local tween = TweenService:Create(Root, TweenInfo.new(dist/speed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        CFrame = CFrame.new(pos)
    })
    tween:Play()
    tween.Completed:Wait()
end

local function GetClosestForge()
    local closest, bestDist = nil, math.huge
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name:lower():find("forge") and obj:IsA("BasePart") then
            local d = (obj.Position - Root.Position).Magnitude
            if d < bestDist then
                bestDist = d
                closest = obj
            end
        end
    end
    return closest
end

local function InteractForge(forge)
    local prompt = forge:FindFirstChildWhichIsA("ProximityPrompt", true)
    if prompt then
        TweenTo(forge.Position - (forge.CFrame.LookVector * 4))
        task.wait(0.2)
        fireproximityprompt(prompt)
        task.wait(1)
    end
end

local function InsertItemsToForge()
    for _, item in ipairs(Backpack:GetChildren()) do
        if item:IsA("Tool") then
            pcall(function()
                item.Parent = Character
                task.wait(0.1)
                ReplicatedStorage.Shared.Packages.Knit.Services.ToolService.RF.ToolActivated:InvokeServer("ForgeInsert", item.Name)
                task.wait(0.2)
                item.Parent = Backpack
            end)
        end
    end
end

local function ClickForgeButton()
    local gui = Player.PlayerGui:FindFirstChildWhichIsA("ScreenGui", true)
    if not gui then return end

    for _, btn in ipairs(gui:GetDescendants()) do
        if btn:IsA("TextButton") and btn.Text:lower():find("forge") then
            pcall(function()
                btn:Activate()
            end)
            task.wait(1.5)
        end
    end
end

local function CollectForgeResult()
    local gui = Player.PlayerGui:FindFirstChildWhichIsA("ScreenGui", true)
    if not gui then return end

    for _, btn in ipairs(gui:GetDescendants()) do
        if btn:IsA("TextButton") and (btn.Text:lower():find("collect") or btn.Text:lower():find("claim")) then
            pcall(function()
                btn:Activate()
            end)
            task.wait(1)
        end
    end
end

Tab2:Toggle({
    Title = "Auto Forge",
    Desc = "Auto forging",
    Value = false,
    Callback = function(state)
        _G.AutoForge = state
        if state then
            task.spawn(function()
                while _G.AutoForge do
                    local forge = GetClosestForge()
                    if forge then
                        InteractForge(forge)
                        InsertItemsToForge()
                        InsertItemsToForge()
                        ClickForgeButton()
                        CollectForgeResult()
                    end
                    task.wait(0.6)
                end
            end)
        end
    end
})
