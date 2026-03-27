print("[Cult Hub] Loading...")

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Purple = Color3.fromHex("#7775F2")
local Yellow = Color3.fromHex("#ECA201")
local Green = Color3.fromHex("#10C550")
local Grey = Color3.fromHex("#83889E")
local Blue = Color3.fromHex("#257AF7")
local Red = Color3.fromHex("#EF4F1D")

local Window = WindUI:CreateWindow({
    Title = "Cult Hub",
    Folder = "CultHub",
    Size = UDim2.fromOffset(400, 400),
    Transparent = true,
    SideBarWidth = 170,
    HasOutline = true,
    Topbar = {
        Height = 44,
        ButtonsType = "Mac", -- Default or Mac
    },
})

do
    Window:Tag({
        Title = "v1.0.0",
        Icon = "github",
        Color = Color3.fromHex("#1c1c1c")
    })
end

local welcome = Window:Tab({
    Title = "Welcome",
    Icon = "solar:info-square-bold",
    IconColor = Grey,
    IconShape = "Square",
})
welcome:Select()

local Paragraph = welcome:Paragraph({
    Title = "Cult Hub",
    Desc = "thanks for using\nclick on yellow circle to minimize ui",
    Buttons = {
        {
            Icon = "github",
            Title = "Copy Discord Invite",
            Callback = function() setclipboard("https://discord.gg/eJ3y94X6Eu") end,
        }
    }
})

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

local function AutoCollect()
    task.spawn(function()
        _G.Box = true
        while _G.Box do
            task.wait()
            pcall(function()
                for _, object in pairs(Workspace.World.Items:GetDescendants()) do
                    local isBox = string.find(object.Name, "Box")
                    local isChest = string.find(object.Name, "Chest")
                    local isWater = object:GetAttribute("Water") == true

                    if (isBox and isWater) or (isChest and isWater) then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(object.Position) * CFrame.new(0, 5, 0)
                            ReplicatedStorage.Action:InvokeServer("Collect", object)
                        end
                        break
                    end
                end
            end)
        end
    end)
end

local function UpdateWalkSpeed(speed)
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
		LocalPlayer.Character.Humanoid.WalkSpeed = speed
	end
end

local MainTab = Window:Tab({
    Title = "Main",
    Icon = "solar:home-angle-2-bold",
    IconColor = Green,
    IconShape = "Square",
})

local section = MainTab:Section({
    Title = "Main",
    Box = true,
    TextTransparency = 0,
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
    Opened = true,
})
    
section:Toggle({
    Title = "Collect Box",
    Flag = "AutoCollectToggle",
    Default = false,
    Callback = function(state)
        _G.Box = state
        if state then
            AutoCollect()
        end
    end,
})

section:Button({
    Title = "Teleport to Spawn",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Workspace.SpawnLocation.Position)
            LocalPlayer.Character.Humanoid.Jump = true
        end
    end,
})

local WalkSpeedValue = 20
local SpeedConnections = {}

section:Slider({
    Title = "Walk Speed",
    Flag = "WalkSpeedSlider",
    Step = 1,
    Value = { Min = 20, Max = 200, Default = WalkSpeedValue },
    Callback = function(value)
        WalkSpeedValue = value
        UpdateWalkSpeed(WalkSpeedValue)

        if SpeedConnections.Loop then
            SpeedConnections.Loop:Disconnect()
        end
        if SpeedConnections.CharacterAdded then
            SpeedConnections.CharacterAdded:Disconnect()
        end

        local Character = LocalPlayer.Character
        local Humanoid = Character and Character:FindFirstChild("Humanoid")

        local function EnforceSpeed()
            if Humanoid and Humanoid.WalkSpeed ~= WalkSpeedValue then
                Humanoid.WalkSpeed = WalkSpeedValue
            end
        end

        if Humanoid then
            SpeedConnections.Loop = Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(EnforceSpeed)
        end

        SpeedConnections.CharacterAdded = LocalPlayer.CharacterAdded:Connect(function(newCharacter)
            local newHumanoid = newCharacter:WaitForChild("Humanoid")
            newHumanoid.WalkSpeed = WalkSpeedValue

            if SpeedConnections.Loop then
                SpeedConnections.Loop:Disconnect()
            end

            SpeedConnections.Loop = newHumanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                if newHumanoid.WalkSpeed ~= WalkSpeedValue then
                    newHumanoid.WalkSpeed = WalkSpeedValue
                end
            end)
        end)
    end
})

section:Button({
    Title = "Inf Jump",
    Callback = function()
        UserInputService.JumpRequest:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
})

local sse = MainTab:Section({
    Title = "Misc",
    Box = true,
    TextTransparency = 0,
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
    Opened = true,
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Action = ReplicatedStorage:WaitForChild("Action")
local loop

sse:Toggle({
    Title = "Auto Activate Item",
    Default = false,
    Callback = function(state)
        if state then
            if loop then task.cancel(loop) end
            loop = task.spawn(function()
                while task.wait(0.05) do
                    pcall(Action.InvokeServer, Action, "ActivatedItem")
                end
            end)
        else
            if loop then
                task.cancel(loop)
                loop = nil
            end
        end
    end
})

local rs = game:GetService("ReplicatedStorage")
local event = rs:WaitForChild("mini_notify").OnClientEvent

print("[Cult Hub] Loaded!")

while true do
    firesignal(event, "Cult Hub", Color3.fromRGB(171, 255, 245))
    task.wait(60)
end

print("[Cult Hub] Loaded!")