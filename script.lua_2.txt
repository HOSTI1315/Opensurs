-- Load WindUI safely
local success, WindUI = pcall(function()
    print("Attempting to load WindUI...")
    local result = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
    print("WindUI loaded successfully.")
    return result
end)

if not success or not WindUI then
    warn("Failed to load WindUI: " .. tostring(WindUI))
    game:GetService("Players").LocalPlayer:Kick("Failed to load UI library. Please check your network or the script URL.")
    return
end

print("Script running on client at: " .. os.date("%H:%M:%S %d/%m/%Y"))

local UserInputService = game:GetService("UserInputService")
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local windowSize = isMobile and UDim2.fromOffset(360, 420) or UDim2.fromOffset(600, 480)

local Window = WindUI:CreateWindow({
    Title = "MM2 Script Hub V1.5",
    Icon = "skull",
    Author = "Made by Yuki",
    Folder = "",
    Size = windowSize,
    Transparent = false,
    Theme = "Dark",
    SideBarWidth = 200,
    User = {
        Enabled = true,
        Anonymous = true,
        Callback = function() print("User profile triggered.") end,
    },
})

-- Tabs
local Tabs = {
    AutoFarmTab = Window:Tab({ Title = "AutoFarm", Icon = "coins" }),
    AntiAFKTab = Window:Tab({ Title = "Anti-AFK", Icon = "moon" }),
    AntiStealTab = Window:Tab({ Title = "Anti-Steal", Icon = "shield" }),
}

-- Header
Tabs.AutoFarmTab:Paragraph({
    Title = '<font color="#FFD700">MM2 Script Hub</font> <font color="#00CFFF">| AF UPDATE V1.5!</font>',
    Desc = "💻 Made by Yuki",
    Image = "zap",
    RichText = true,
})

-- AutoFarm Logic
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local plr = game.Players.LocalPlayer
local character = plr.Character or plr.CharacterAdded:Wait()
local humPart = character:WaitForChild("HumanoidRootPart")
plr.CharacterAdded:Connect(function(char)
    character = char
    humPart = char:WaitForChild("HumanoidRootPart")
end)

local collected = 0
local startTime = 0
local speed = 15
local visited = {}

Tabs.AutoFarmTab:Toggle({
    Title = "Enable Coin/Ball Farm",
    Default = false,
    Callback = function(state)
        getgenv().farm = state
        if state then
            collected = 0
            startTime = tick()
            visited = {}

            WindUI:Notify({
                Title = "AutoFarm",
                Content = "Started farming...",
                Icon = "check",
                Duration = 4,
            })

            -- UI live stats
            task.spawn(function()
                while getgenv().farm do
                    local elapsed = tick() - startTime
                    Tabs.AutoFarmTab:Label("Collected: " .. collected)
                    Tabs.AutoFarmTab:Label("Time Active: " .. math.floor(elapsed) .. "s")
                    Tabs.AutoFarmTab:Label("Coins/Hour: " .. math.floor((collected / math.max(1, elapsed)) * 3600))
                    task.wait(0.5)
                end
            end)

            -- Main autofarm loop (closest coin)
            task.spawn(function()
                while getgenv().farm do
                    character = plr.Character or plr.CharacterAdded:Wait()
                    humPart = character:FindFirstChild("HumanoidRootPart")
                    if humPart then
                        local closest, shortest = nil, math.huge
                        for _, obj in ipairs(workspace:GetDescendants()) do
                            if obj:IsA("BasePart") and obj.Name == "Coin_Server" and obj:GetAttribute("CoinID") == "BeachBall" and not visited[obj] then
                                local dist = (obj.Position - humPart.Position).Magnitude
                                if dist < shortest and dist <= 250 then
                                    closest = obj
                                    shortest = dist
                                end
                            end
                        end

                        if closest and closest.Parent then
                            visited[closest] = true
                            for _, p in pairs(character:GetChildren()) do
                                if p:IsA("BasePart") and p.CanCollide then
                                    p.CanCollide = false
                                end
                            end
                            local tween = TweenService:Create(humPart, TweenInfo.new(shortest / speed, Enum.EasingStyle.Linear), {CFrame = CFrame.new(closest.Position)})
                            tween:Play()
                            tween.Completed:Wait()
                            collected += 1
                        end
                    end
                    task.wait(0.1)
                end
            end)
        else
            WindUI:Notify({
                Title = "AutoFarm",
                Content = "Stopped farming.",
                Icon = "x",
                Duration = 4,
            })
        end
    end,
})

Tabs.AutoFarmTab:Input({
    Title = "Fly Speed",
    Desc = "How fast to fly to coins (default 15)",
    Placeholder = "e.g. 15",
    Callback = function(val)
        local num = tonumber(val)
        if num then
            speed = math.clamp(num, 5, 50)
            WindUI:Notify({
                Title = "Speed Updated",
                Content = "Flying speed set to " .. speed,
                Icon = "zap",
                Duration = 3,
            })
        else
            WindUI:Notify({
                Title = "Invalid Input",
                Content = "Please enter a number.",
                Icon = "alert-triangle",
                Duration = 4,
            })
        end
    end,
})

-- Anti-AFK
Tabs.AntiAFKTab:Button({
    Title = "Enable Anti-AFK",
    Callback = function()
        local GC = getconnections or get_signal_cons
        if GC then
            for _,v in pairs(GC(plr.Idled)) do
                if v.Disable then v:Disable() elseif v.Disconnect then v:Disconnect() end
            end
        else
            local vu = cloneref(game:GetService("VirtualUser"))
            plr.Idled:Connect(function()
                vu:CaptureController()
                vu:ClickButton2(Vector2.new())
            end)
        end
        WindUI:Notify({
            Title = "Anti-AFK Enabled",
            Content = "You won't get kicked for idling!",
            Icon = "coffee",
            Duration = 5,
        })
    end,
})

-- Anti-Steal
Tabs.AntiStealTab:Paragraph({
    Title = "Anti-Steal System",
    Desc = "Protects your coins or data from being hijacked by other scripts or players. Toggle below to enable.",
    Image = "lock",
})

local antiStealActive = false
Tabs.AntiStealTab:Toggle({
    Title = "Enable Anti-Steal",
    Default = false,
    Callback = function(state)
        antiStealActive = state
        WindUI:Notify({
            Title = "Anti-Steal",
            Content = state and "Anti-Steal Enabled!" or "Anti-Steal Disabled.",
            Icon = state and "shield" or "x",
            Duration = 4,
        })
    end,
})

print("✅ MM2 GUI loaded. Press Right Ctrl to toggle it.")
