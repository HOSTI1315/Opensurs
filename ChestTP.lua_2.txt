-- 🌌 Auto Jump Script
-- Bật lên = nhảy liên tục
-- Tắt đi = dừng nhảy (chỉ cần rejoin game)

local player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

task.spawn(function()
    while task.wait(1) do
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- 🌌 Purple Cosmic UI Banner - HNC Hub
-- By HNC Hub

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Xoá UI cũ nếu có
if CoreGui:FindFirstChild("HNC_Purple_UI") then
    CoreGui.HNC_Purple_UI:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "HNC_Purple_UI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = CoreGui

-- Khung chính (cao hơn)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.45, 0, 0.1, 0)
frame.Position = UDim2.new(0.5, 0, 0.15, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
frame.BackgroundTransparency = 0.3
frame.BorderSizePixel = 0
frame.Parent = gui
frame.Visible = false

-- Bo góc
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 25)
corner.Parent = frame

-- Viền tím neon
local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(170, 0, 255)
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = frame

-- Glow tím
local glow = Instance.new("ImageLabel")
glow.Size = UDim2.new(1.4, 0, 2, 0)
glow.Position = UDim2.new(-0.2, 0, -0.5, 0)
glow.BackgroundTransparency = 1
glow.Image = "rbxassetid://4996891970"
glow.ImageColor3 = Color3.fromRGB(170, 0, 255)
glow.ImageTransparency = 0.55
glow.ZIndex = -1
glow.Parent = frame

-- Gradient nền nhẹ
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 0, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 0, 25))
}
gradient.Rotation = 45
gradient.Parent = frame

-- Chữ
local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, 0, 1, 0)
text.BackgroundTransparency = 1
text.Text = "HNC Hub - Auto Collect Chest"
text.TextColor3 = Color3.fromRGB(200, 0, 255)
text.Font = Enum.Font.GothamBlack
text.TextScaled = true
text.TextStrokeTransparency = 0.5
text.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
text.Parent = frame

-- Animation hiện ra
frame.Visible = true
frame.BackgroundTransparency = 1
frame.Size = UDim2.new(0.2, 0, 0.05, 0)
text.TextTransparency = 1
stroke.Thickness = 0
glow.ImageTransparency = 1

TweenService:Create(frame, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0.3,
    Size = UDim2.new(0.45, 0, 0.1, 0)
}):Play()

TweenService:Create(text, TweenInfo.new(1, Enum.EasingStyle.Quad), {
    TextTransparency = 0
}):Play()

TweenService:Create(stroke, TweenInfo.new(1, Enum.EasingStyle.Quad), {
    Thickness = 2
}):Play()

TweenService:Create(glow, TweenInfo.new(1, Enum.EasingStyle.Quad), {
    ImageTransparency = 0.55
}):Play()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Hàm tạo aura tím phủ toàn thân
local function applyPurpleAura(char)
    if not char then return end
    
    -- Xóa aura cũ nếu có
    if char:FindFirstChild("PurpleAura") then
        char.PurpleAura:Destroy()
    end

    -- Highlight toàn cơ thể
    local aura = Instance.new("Highlight")
    aura.Name = "PurpleAura"
    aura.FillColor = Color3.fromRGB(170, 0, 255)   -- tím neon
    aura.OutlineColor = Color3.fromRGB(200, 100, 255)
    aura.FillTransparency = 0.3                    -- trong mờ nhìn xuyên
    aura.OutlineTransparency = 0                   -- viền sáng rõ
    aura.Parent = char
end

-- Áp ngay lập tức khi đang sống
if LocalPlayer.Character then
    applyPurpleAura(LocalPlayer.Character)
end

-- Tự áp lại khi respawn
LocalPlayer.CharacterAdded:Connect(function(char)
    char:WaitForChild("HumanoidRootPart")
    task.wait(1)
    applyPurpleAura(char)
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

-- Tùy chỉnh
local TEXT = "HNC Hub"
local TEXT_SIZE = 18                 -- kích thước chữ (không quá to)
local GUI_OFFSET = Vector3.new(0, 1.8, 0) -- khoảng cách so với đầu
local RAINBOW_SPEED = 1.0           -- tốc độ đổi màu (1 = bình thường, tăng để nhanh hơn)

local function createBillboardFor(character)
    if not character then return end
    local head = character:FindFirstChild("Head") or character:FindFirstChildWhichIsA("BasePart")
    if not head then return end

    -- Nếu đã có Billboard do script tạo thì hủy trước
    local existing = head:FindFirstChild("HNC_FastAttack_Label")
    if existing then existing:Destroy() end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "HNC_FastAttack_Label"
    billboard.Adornee = head
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 200, 0, 40) -- kích thước GUI
    billboard.StudsOffset = GUI_OFFSET
    billboard.Parent = head

    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Label"
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = TEXT
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = TEXT_SIZE
    textLabel.TextStrokeTransparency = 0.6
    textLabel.TextTransparency = 0
    textLabel.TextScaled = false
    textLabel.Parent = billboard

    -- rainbow loop
    local hue = 0
    local con
    con = RunService.RenderStepped:Connect(function(dt)
        hue = (hue + dt * RAINBOW_SPEED) % 1
        local rgb = Color3.fromHSV(hue, 0.9, 1)
        if textLabel and textLabel.Parent then
            textLabel.TextColor3 = rgb
        else
            if con then con:Disconnect() end
        end
    end)
end

-- khi spawn/respawn character
local function onCharacterAdded(character)
    -- đợi head xuất hiện
    if not character.Parent then
        character.AncestryChanged:Wait()
    end
    -- tạo sau 0.1s để head chắc chắn có
    wait(0.1)
    createBillboardFor(character)
end

-- kết nối
if player.Character then
    onCharacterAdded(player.Character)
end
player.CharacterAdded:Connect(onCharacterAdded)

-- optional: nếu muốn tắt khi rời game (cleanup)
player.AncestryChanged:Connect(function(_, parent)
    if not parent then
        -- client đang bị remove, nothing to do
    end
end)
local LocalPlayer = game:GetService("Players").LocalPlayer
local Locations = workspace._WorldOrigin.Locations

local function getCharacter()
    if not LocalPlayer.Character then
        LocalPlayer.CharacterAdded:Wait()
    end
    LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    return LocalPlayer.Character
end

local function DistanceFromPlrSort(ObjectList: table)
    local RootPart = getCharacter().LowerTorso
    table.sort(ObjectList, function(ChestA, ChestB)
        local RootPos = RootPart.Position
        local DistanceA = (RootPos - ChestA.Position).Magnitude
        local DistanceB = (RootPos - ChestB.Position).Magnitude
        return DistanceA < DistanceB
    end)
end

local UncheckedChests, FirstRun = {}, true
local function getChestsSorted()
    if FirstRun then
        FirstRun = false
        for _, Object in pairs(game:GetDescendants()) do
            if Object.Name:find("Chest") and Object.ClassName == "Part" then
                table.insert(UncheckedChests, Object)
            end
        end
    end
    local Chests = {}
    for _, Chest in pairs(UncheckedChests) do
        if Chest:FindFirstChild("TouchInterest") then
            table.insert(Chests, Chest)
        end
    end
    DistanceFromPlrSort(Chests)
    return Chests
end

local function toggleNoclip(Toggle: boolean)
    for _, v in pairs(getCharacter():GetChildren()) do
        if v:IsA("BasePart") then
            v.CanCollide = not Toggle
        end
    end
end

local function Teleport(Goal: CFrame)
    local RootPart = getCharacter().HumanoidRootPart
    toggleNoclip(true)
    RootPart.CFrame = Goal + Vector3.new(0, 3, 0)
    toggleNoclip(false)
end

-- Auto farm loop (restart khi respawn)
local function startFarm()
    task.spawn(function()
        while task.wait() do
            local Chests = getChestsSorted()
            if #Chests > 0 then
                Teleport(Chests[1].CFrame)
            else
                -- serverhop ở đây nếu muốn
            end
        end
    end)
end

-- Auto đổi team sang Hải Quân liên tục
task.spawn(function()
    local rs = game:GetService("ReplicatedStorage")
    while task.wait() do
        pcall(function()
            rs.Remotes.CommF_:InvokeServer("SetTeam","Marines")
        end)
    end
end)

-- Khi respawn thì tự động khởi động farm lại
LocalPlayer.CharacterAdded:Connect(function()
    task.wait() -- chờ nhân vật load
    startFarm()
end)

-- Chạy farm lần đầu
startFarm()

-- 🌍 Auto Server Hop sau 60 giây + Hiệu ứng màn hình đen
-- By HNC Hub

repeat task.wait(2) until game:IsLoaded()

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlaceID = game.PlaceId

local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour

-- Đọc file server đã join
local success = pcall(function()
    AllIDs = HttpService:JSONDecode(readfile("NotSameServers.json"))
end)

if not success then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
end

-- ⚡ Hàm hiện màn hình đen + text
local function ShowBlackScreen()
    local gui = Instance.new("ScreenGui")
    gui.Name = "HNC_Hub_HopUI"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.Parent = game:GetService("CoreGui")

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.new(0,0,0)
    bg.BorderSizePixel = 0
    bg.BackgroundTransparency = 0
    bg.Parent = gui

    local text1 = Instance.new("TextLabel")
    text1.Size = UDim2.new(1,0,0.2,0)
    text1.Position = UDim2.new(0,0,0.35,0)
    text1.BackgroundTransparency = 1
    text1.Text = "HNC Hub - Auto Collect Chest"
    text1.TextColor3 = Color3.new(1,1,1)
    text1.Font = Enum.Font.SourceSansBold
    text1.TextScaled = true
    text1.Parent = bg

    local text2 = Instance.new("TextLabel")
    text2.Size = UDim2.new(1,0,0.2,0)
    text2.Position = UDim2.new(0,0,0.5,0)
    text2.BackgroundTransparency = 1
    text2.Text = "Hopping"
    text2.TextColor3 = Color3.fromRGB(255, 170, 0)
    text2.Font = Enum.Font.SourceSansBold
    text2.TextScaled = true
    text2.Parent = bg
end

-- Hàm tìm server mới
function TPReturner()
    local Site
    if foundAnything == "" then
        Site = HttpService:JSONDecode(game:HttpGet(
            'https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'
        ))
    else
        Site = HttpService:JSONDecode(game:HttpGet(
            'https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything
        ))
    end

    if Site.nextPageCursor and Site.nextPageCursor ~= "null" then
        foundAnything = Site.nextPageCursor
    end

    local num = 0
    for _, v in pairs(Site.data) do
        local ID = tostring(v.id)
        local Possible = true
        if tonumber(v.playing) < tonumber(v.maxPlayers) then
            for _, Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible then
                table.insert(AllIDs, ID)
                pcall(function()
                    writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
                    -- ⚡ Trước khi hop 3 giây hiện màn hình đen
                    ShowBlackScreen()
                    task.wait(3)
                    TeleportService:TeleportToPlaceInstance(PlaceID, ID, LocalPlayer)
                end)
                task.wait(4)
            end
        end
    end
end

-- Hàm hop liên tục
function TeleportLoop()
    while task.wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- ⚡ Chờ 60 giây sau khi bật script rồi hop
task.delay(180, function()
    TeleportLoop()
end)
-- 🌌 Auto Reset + Invisible (respawn support) + Clear Map (ghi chú màu tím)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("HN_MiniUI") then
    CoreGui.HN_MiniUI:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "HN_MiniUI"
gui.Parent = CoreGui

-- Hàm tạo toggle
local function createToggle(name, posY, default, callback)
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(0, 120, 0, 15)
    title.Position = UDim2.new(1, -140, 0.1, posY)
    title.AnchorPoint = Vector2.new(0, 0)
    title.BackgroundTransparency = 1
    title.Text = name
    title.TextColor3 = Color3.fromRGB(170, 0, 255) -- 💜 ghi chú màu tím
    title.Font = Enum.Font.GothamBold
    title.TextSize = 12
    title.Parent = gui

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 20, 0, 20)
    btn.Position = UDim2.new(1, -70, 0.1, posY + 20)
    btn.AnchorPoint = Vector2.new(0, 0)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamBold
    btn.Parent = gui
    Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)

    local state = default
    local function updateVisual()
        if state then
            btn.BackgroundColor3 = Color3.fromRGB(170, 0, 255) -- tím khi on
            btn.Text = "✓"
        else
            btn.BackgroundColor3 = Color3.fromRGB(100, 100, 100) -- xám khi off
            btn.Text = ""
        end
    end
    updateVisual()

    btn.MouseButton1Click:Connect(function()
        state = not state
        updateVisual()
        callback(state)
    end)

    return function() return state end, function(newState)
        state = newState
        updateVisual()
        callback(state)
    end
end

-- === AUTO RESET ===
local AutoReset = true
createToggle("Anti Kick", 0, true, function(state)
    AutoReset = state
end)

task.spawn(function()
    while task.wait(13) do
        if AutoReset and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.Health = 0
        end
    end
end)

-- === INVISIBLE (bản thân, giữ khi respawn) ===
local Invisible = false

local function setInvisible(state)
    if LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then
                part.LocalTransparencyModifier = state and 1 or 0
            end
        end
    end
end

local getInvState, setInvState = createToggle("Invisible", 60, false, function(state)
    Invisible = state
    setInvisible(Invisible)
end)

-- Khi respawn, nếu Invisible đang bật thì áp lại
LocalPlayer.CharacterAdded:Connect(function(char)
    char:WaitForChild("HumanoidRootPart")
    task.wait(0.2)
    if Invisible then
        setInvisible(true)
    end
end)

-- === CLEAR MAP (tàng hình map) ===
local function setMapInvisible(state)
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("Decal") then
            if not obj:IsDescendantOf(LocalPlayer.Character) then
                obj.LocalTransparencyModifier = state and 1 or 0
            end
        end
    end
end

createToggle("Clear Map", 120, false, function(state)
    setMapInvisible(state)
end)
