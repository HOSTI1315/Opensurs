if not game:IsLoaded() then
    game.Loaded:Wait()
end
if not game:IsLoaded() then
    repeat task.wait() until game:IsLoaded()
end

if getgenv().RunScript == true then return end
getgenv().RunScript = true

local queueScript = [[
loadstring(game:HttpGet('https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/99nightAutoFarmdyhub.lua'))()
]]

queue_on_teleport(queueScript)

-- รอให้ player และ character โหลดสำเร็จ
local player = game.Players.LocalPlayer
local TimeWaitLoadGame = 0
repeat
    task.wait(0.1)
    TimeWaitLoadGame = TimeWaitLoadGame + 0.1
    if TimeWaitLoadGame > 3 then
        player:Kick("Timeout loading character")
        task.wait(0.5)
        game:GetService("TeleportService"):Teleport(126509999114328)
        return
    end
until player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")

local character = player.Character
local humanoid = character:FindFirstChildOfClass("Humanoid")
local HMNRT = character:FindFirstChild("HumanoidRootPart")
local Camera = workspace.CurrentCamera
local plrGui = player:WaitForChild("PlayerGui")

-- ฟังก์ชันเช็คสถานะติด (stuck) และรีสตาร์ทหากติดเกินกำหนด
task.spawn(function()
    pcall(function()
        local OutTick = 0
        local StuckCount = 0
        local LastPosition = HMNRT.Position
        while task.wait(1) do
            OutTick = OutTick + 1
            local Dis = (LastPosition - HMNRT.Position).Magnitude
            if Dis < 5 then
                StuckCount = StuckCount + 1
            else
                StuckCount = 0
            end
            if OutTick >= 35 or StuckCount > 2 then
                player:Kick("Detected stuck, restarting")
                task.wait(0.5)
                game:GetService("TeleportService"):Teleport(126509999114328)
                break
            end
            LastPosition = HMNRT.Position
        end
    end)
end)

-- ฟังก์ชันตรวจสอบว่าชื่อของ item ตรงกับ keyword ที่กำหนด
local function matchesAllowedKeyword(value, ...)
    value = tostring(value):lower()
    for _, keyword in ipairs({...}) do
        if string.find(value, keyword:lower()) then
            return true
        end
    end
    return false
end

-- ตรวจสอบ PlaceId เพื่อเลือกสคริปต์ย่อยตามเกม
if tonumber(game.PlaceId) == 79546208627805 then
    -- *** โค้ดสำหรับเกม PlaceId 79546208627805 ***
    local TweenService = game:GetService("TweenService")
    local RunService = game:GetService("RunService")
    local Lighting = game:GetService("Lighting")
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local UIS = game:GetService("UserInputService")
    local HttpService = game:GetService("HttpService")

    local Inventory = player:WaitForChild("Inventory")
    local TeleporterAssets = plrGui:WaitForChild("TeleporterAssets")

    -- ซ่อน EntryScreen ถ้ามี
    local interface = plrGui:WaitForChild("Interface")
    if interface:FindFirstChild("EntryScreen") then
        interface.EntryScreen.Visible = false
    end

    -- ปรับ GUI TeleporterAssets
    if TeleporterAssets:FindFirstChild("Frame") then
        local Frame = TeleporterAssets.Frame
        Frame.Visible = true
        if Frame:FindFirstChild("TextLabel1") then
            local tl1 = Frame.TextLabel1
            tl1.Text = "Auto-Farm Gem | DYHUB"
            tl1.Visible = true
            tl1.TextColor3 = Color3.new(1, 0, 0) -- แก้จาก 255 เป็น 1
        end
        if Frame:FindFirstChild("TextLabel2") then
            local tl2 = Frame.TextLabel2
            tl2.Text = "Status : Waiting for Room"
            tl2.Visible = true
            tl2.TextColor3 = Color3.new(1, 1, 1)
            StageUI = tl2
        end
    end

    local VirtualInputManager = game:GetService("VirtualInputManager")
    local centerX, centerY = workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2

    local function Click_Function()
        VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, true, game, 0)
        task.wait(0.02)
        VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, false, game, 0)
        task.wait(0.02)
    end

    task.wait(6)
    local Teleport = false
    repeat
        local GotoEnterPart = false
        for i = 1, 3 do
            local teleportName = "Teleporter"..i
            local Model_Teleport = workspace:FindFirstChild(teleportName)
            if Model_Teleport and Model_Teleport:FindFirstChild("BillboardHolder") then
                local billboard = Model_Teleport.BillboardHolder:FindFirstChild("BillboardGui")
                if billboard and billboard:FindFirstChild("Players") then
                    local playersText = billboard.Players.Text
                    if playersText == "0/5" then
                        for _, item in ipairs(Model_Teleport:GetChildren()) do
                            if item.Name == "EnterPart" and not GotoEnterPart then
                                firetouchinterest(HMNRT, item, 0)
                                GotoEnterPart = true
                                task.wait(0.1)
                                break
                            end
                        end
                    end
                end
            end
        end

        if GotoEnterPart then
            local LobbyCreate = interface:FindFirstChild("LobbyCreate")
            if LobbyCreate then
                local ButtonList = LobbyCreate:FindFirstChild("ButtonList")
                local CreateButton = LobbyCreate.HeaderFrame and LobbyCreate.HeaderFrame:FindFirstChild("CreateButton")
                local Button1 = nil
                if ButtonList then
                    for _, item in ipairs(ButtonList:GetChildren()) do
                        if item.Name ~= "Button1" then
                            item:Destroy()
                        else
                            Button1 = item
                        end
                    end
                end
                if Button1 and CreateButton then
                    CreateButton.Position = UDim2.new(0.5, 0, 4.5, 0)
                    if TeleporterAssets:FindFirstChild("Frame") then
                        TeleporterAssets.Frame.Visible = false
                    end
                    for i = 1, 5 do
                        Click_Function()
                    end
                    Button1.Visible = false
                    if StageUI then
                        StageUI.Text = "Status : Completed room creation"
                    end
                    for i = 1, 5 do
                        Click_Function()
                    end
                    if TeleporterAssets:FindFirstChild("Frame") then
                        TeleporterAssets.Frame.Visible = true
                    end
                    task.wait(30)
                    game:GetService("TeleportService"):Teleport(79546208627805)
                    Teleport = true
                end
            end
        end
        task.wait(0.1)
    until Teleport
else
    -- *** โค้ดสำหรับเกมอื่น ๆ ***
    local DiamondCount = interface:WaitForChild("DiamondCount"):WaitForChild("Count")
    local Map = workspace:WaitForChild("Map")
    local InnerTouchZone = Map:WaitForChild("Campground"):WaitForChild("MainFire"):WaitForChild("InnerTouchZone")
    local RemoteEvents = replicatedStorage:WaitForChild("RemoteEvents")
    local RequestStartDraggingItem = RemoteEvents:FindFirstChild("RequestStartDraggingItem")
    local StopDraggingItem = RemoteEvents:FindFirstChild("StopDraggingItem")
    local RequestTakeDiamonds = RemoteEvents:FindFirstChild("RequestTakeDiamonds")

    local FastBring_Delay = 0.17
    local Bring_HipHeight = 6
    local Items = workspace:WaitForChild("Items")

    if Map:FindFirstChild("Boundaries") then
        Map.Boundaries:Destroy()
    end

    workspace.Gravity = 0

    -- ฟังก์ชันสร้างสีรุ้งสำหรับ GUI
    local function getRainbowColor(t)
        local f = 2
        local r = math.floor(math.sin(f * t + 0) * 127 + 128)
        local g = math.floor(math.sin(f * t + 2) * 127 + 128)
        local b = math.floor(math.sin(f * t + 4) * 127 + 128)
        return Color3.fromRGB(r, g, b)
    end

    -- สร้าง GUI GemFarm
    local gui2 = Instance.new("ScreenGui")
    gui2.Name = "GemFarm"
    gui2.ResetOnSpawn = false
    gui2.IgnoreGuiInset = true
    gui2.Parent = game.CoreGui

    local black = Instance.new("Frame", gui2)
    black.Size = UDim2.new(1, 0, 1, 0)
    black.BackgroundColor3 = Color3.new(0, 0, 0)
    black.BackgroundTransparency = 0.4

    local mainFrame2 = Instance.new("Frame", gui2)
    mainFrame2.Name = "mainFrame"
    mainFrame2.Size = UDim2.new(0.4, 0, 0.2, 0)
    mainFrame2.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame2.BackgroundTransparency = 1

    local title2 = Instance.new("TextLabel", mainFrame2)
    title2.Size = UDim2.new(0.8, 0, 0.3, 0)
    title2.Position = UDim2.new(0.5, 0, 0.1, 0)
    title2.AnchorPoint = Vector2.new(0.5, 0)
    title2.BackgroundTransparency = 1
    title2.Text = "Auto-Farm Gem | DYHUB"
    title2.TextColor3 = Color3.new(1, 1, 1)
    title2.TextScaled = true
    title2.Font = Enum.Font.SourceSansBold

    RunService.RenderStepped:Connect(function()
        title2.TextColor3 = getRainbowColor(tick())
    end)

    local bondCount = Instance.new("TextLabel", mainFrame2)
    bondCount.Name = "GemCount"
    bondCount.Size = UDim2.new(0.6, 0, 0.2, 0)
    bondCount.Position = UDim2.new(0.5, 0, 0.6, 0)
    bondCount.AnchorPoint = Vector2.new(0.5, 0)
    bondCount.BackgroundTransparency = 1
    bondCount.Text = "💎 Gems: N/A"
    bondCount.TextColor3 = Color3.new(1, 1, 1)
    bondCount.TextScaled = true
    bondCount.Font = Enum.Font.SourceSans

    if not Lighting:FindFirstChildOfClass("BlurEffect") then
        local blur = Instance.new("BlurEffect", Lighting)
        blur.Size = 12
    end

    -- อัพเดทจำนวนเพชรบน GUI ทุก 0.2 วินาที
    task.spawn(function()
        while task.wait(0.2) do
            if DiamondCount and DiamondCount.Parent then
                bondCount.Text = "💎 Gems: " .. DiamondCount.Text
            else
                bondCount.Text = "💎 Gems: N/A"
            end
        end
    end)

    -- แจ้งเตือนจำนวนเพชรทุก 3 วินาที
    task.spawn(function()
        while task.wait(3) do
            local currentGem = tonumber(DiamondCount.Text)
            if currentGem then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Now you have Gem",
                    Text = "💎 Gem: "..currentGem,
                    Duration = 3
                })
            end
        end
    end)

    -- ฟังก์ชันนำไอเทมเข้ามาใกล้ตัวและวางใน InnerTouchZone
    local function BringItemWithItem2(item2)
        pcall(function()
            humanoid.HipHeight = Bring_HipHeight
            HMNRT.CFrame = CFrame.new(item2.PrimaryPart.Position) * CFrame.new(0, Bring_HipHeight, 0)
            task.wait(FastBring_Delay * 3)
            RequestStartDraggingItem:FireServer(item2)
            task.wait(FastBring_Delay * 3)
            item2.PrimaryPart.CFrame = InnerTouchZone.CFrame * CFrame.new(0, 15, 0)
            task.wait(FastBring_Delay)
            HMNRT.CFrame = CFrame.new(InnerTouchZone.Position) * CFrame.new(0, Bring_HipHeight, 0)
            task.wait(FastBring_Delay * 3)
            StopDraggingItem:FireServer(item2)
            task.wait(FastBring_Delay)
            StopDraggingItem:FireServer(item2)
            task.wait(FastBring_Delay)
            humanoid.HipHeight = 0
        end)
    end

    -- ดึงกล่อง Chest ที่ตรงกับ keyword มาเปิด
    for _, item2 in ipairs(Items:GetChildren()) do
        if matchesAllowedKeyword(item2.Name, "Chest", "Stronghold Diamond Chest", "Iron Chest", "Legendary Chest", "Gold Chest", "Diamond Chest", "Ice Chest", "Alien Chest", "Cold Chest") then
            pcall(function()
                repeat task.wait(0.1) until item2.PrimaryPart and item2.PrimaryPart:FindFirstChild("ProximityAttachment") and item2.PrimaryPart.ProximityAttachment:FindFirstChild("ProximityInteraction")
                local Prox = item2.PrimaryPart.ProximityAttachment.ProximityInteraction
                humanoid.HipHeight = 16
                HMNRT.CFrame = CFrame.new(item2.PrimaryPart.Position) * CFrame.new(0, 16, 0)
                task.wait(0.2)
                fireproximityprompt(Prox)
                task.wait(0.2)
                humanoid.HipHeight = 0
            end)
        end
    end

    -- ดึงเพชร Diamond ใน workspace เข้ามาเก็บ
    for _, Model in ipairs(Items:GetChildren()) do
        if Model.Name == "Diamond" then
            pcall(function()
                if Model.PrimaryPart then
                    task.wait(0.1)
                    HMNRT.CFrame = Model.PrimaryPart.CFrame
                    task.wait(0.1)
                    RequestStartDraggingItem:FireServer(Model)
                    task.wait(0.1)
                    RequestTakeDiamonds:FireServer(Model)
                    task.wait(0.1)
                    StopDraggingItem:FireServer(Model)
                end
            end)
        end
    end

    -- รอแล้วทำการรีสตาร์ทเกม
    task.wait(2)
    player:Kick("Auto-Farm complete, ServerHop!")
    task.wait(0.5)
    game:GetService("TeleportService"):Teleport(126509999114328)
end
