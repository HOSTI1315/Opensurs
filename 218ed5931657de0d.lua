-- ts file was generated at discord.gg/25ms


local vu1 = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local v2 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v3 = game:GetService("UserInputService")
local v4 = game:GetService("Players")
local vu5 = v4.LocalPlayer
local vu6 = v4.LocalPlayer
local vu7 = (vu6.Character or vu6.CharacterAdded:Wait()):WaitForChild("Humanoid")
game:GetService("HttpService")
local v8 = v2:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net")
v2:WaitForChild("Packages")
game:GetService("ReplicatedStorage")
local vu9 = v8:WaitForChild("RF/ChargeFishingRod")
local vu10 = v8:WaitForChild("RF/RequestFishingMinigameStarted")
local vu11 = v8:WaitForChild("RE/FishingCompleted")
local vu12 = v8:WaitForChild("RE/EquipToolFromHotbar")
local vu13 = v8:WaitForChild("RF/SellAllItems")
local vu14 = v8:WaitForChild("RF/CancelFishingInputs")
local vu15 = v8:WaitForChild("RE/ActivateEnchantingAltar")
local vu16 = v8:WaitForChild("URE/UpdateOxygen")
v8:WaitForChild("RE/ObtainedNewFishNotification")
local vu17 = require(game:GetService("ReplicatedStorage").Controllers.FishingController)
v3.JumpRequest:Connect(function()
    local v18 = _G.InfiniteJump and (vu6.Character or vu6.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid")
    if v18 then
        v18:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
vu6.CharacterAdded:Connect(function(p19)
    local v20 = p19:WaitForChild("Humanoid")
    v20.UseJumpPower = true
    v20.JumpPower = _G.CustomJumpPower or 50
end)
local v21 = vu1:CreateWindow({
    Title = "SoraHub",
    Icon = "rbxassetid://99464676738903",
    Author = "Fish It",
    Folder = "SoraHub",
    Size = UDim2.new(0, 280, 0, 320),
    Background = "rbxassetid://6317530047",
    BackgroundImageTransparency = 0.7,
    SideBarWidth = 170,
    HasOutline = true
})
local v22 = {
    I = v21:Tab({
        Title = "Home",
        Icon = "cat"
    }),
    M = v21:Tab({
        Title = "Fishing",
        Icon = "dog"
    }),
    S = v21:Tab({
        Title = "Shop",
        Icon = "piggy-bank"
    }),
    Q = v21:Tab({
        Title = "Quest",
        Icon = "bird"
    }),
    U = v21:Tab({
        Title = "Utility",
        Icon = "rat"
    }),
    T = v21:Tab({
        Title = "Teleport",
        Icon = "rabbit"
    }),
    MSC = v21:Tab({
        Title = "Misc",
        Icon = "turtle"
    })
}
v22.I:Section({
    Title = "Support",
    TextXAlignment = "Left",
    TextSize = 17
})
v22.I:Button({
    Title = "Discord Server",
    Desc = "click to copy link",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/rTbaUq4j")
        end
    end
})
v22.I:Section({
    Title = "User Settings",
    TextXAlignment = "Left",
    TextSize = 17
})
v22.I:Input({
    Title = "WalkSpeed",
    Desc = "Minimum 16 speed",
    Value = "16",
    InputIcon = "bird",
    Type = "Input",
    Placeholder = "Enter number...",
    Callback = function(p23)
        local v24 = tonumber(p23)
        if v24 and 16 <= v24 then
            vu7.WalkSpeed = v24
        else
            vu7.WalkSpeed = 16
        end
    end
})
v22.I:Input({
    Title = "Jump Power",
    Desc = "Minimum 50 jump",
    Value = "50",
    InputIcon = "bird",
    Type = "Input",
    Placeholder = "Enter number...",
    Callback = function(p25)
        local v26 = tonumber(p25)
        if v26 then
            _G.CustomJumpPower = v26
            local v27 = vu6.Character
            if v27 then
                v27 = vu6.Character:FindFirstChildOfClass("Humanoid")
            end
            if v27 then
                v27.UseJumpPower = true
                v27.JumpPower = v26
            end
        end
    end
})
v22.I:Button({
    Title = "Reset Speed & Jump",
    Desc = "Return to normal (16 speed, 50 jump)",
    Callback = function()
        vu7.WalkSpeed = 16
        _G.CustomJumpPower = 50
        local v28 = vu6.Character
        if v28 then
            v28 = vu6.Character:FindFirstChildOfClass("Humanoid")
        end
        if v28 then
            v28.UseJumpPower = true
            v28.JumpPower = 50
        end
    end
})
v22.I:Toggle({
    Title = "Infinite Jump",
    Desc = "activate to use infinite jump",
    Icon = "bird",
    Type = "Checkbox",
    Default = false,
    Callback = function(p29)
        _G.InfiniteJump = p29
    end
})
v22.M:Section({
    Title = "Legit",
    TextXAlignment = "Left",
    TextSize = 17
})
local vu30 = false
local vu31 = false
local vu32 = nil
local vu33 = nil
local vu34 = game:GetService("Players").LocalPlayer
local v35 = vu34
local vu36 = vu34.WaitForChild(v35, "PlayerGui")
local vu37 = workspace.CurrentCamera
local vu38 = game:GetService("VirtualInputManager")
local vu39 = {}
local function vu40()
end
local function vu44()
    local v41 = vu37.ViewportSize
    local v42 = v41.X * 0.95
    local v43 = v41.Y * 0.95
    vu38:SendMouseButtonEvent(v42, v43, 0, true, nil, 0)
    vu38:SendMouseButtonEvent(v42, v43, 0, false, nil, 0)
end
local function vu45()
    vu31 = false
    if vu33 then
        vu17._getPower = vu33
    end
end
local function vu47()
    pcall(function()
        while vu30 do
            if not vu34.Character then
                vu34.CharacterAdded:Wait()
            end
            if not vu30 then
                break
            end
            if vu12 then
                pcall(vu12.FireServer, vu12, 1)
            end
            task.wait(0.1)
            if not vu31 then
                vu44()
                vu31 = true
            end
            local v46 = vu36:FindFirstChild("Fishing")
            if v46 then
                v46 = vu36.Fishing:FindFirstChild("Main")
            end
            if v46 and v46.Visible then
                for _ = 1, 20 do
                    if not vu30 then
                        break
                    end
                    vu44()
                    task.wait(0.02)
                end
            end
            task.wait(0.1)
        end
    end)
    vu45()
end
local function vu49(p48)
    vu30 = p48
    vu39.AutoLegitFish = p48
    vu40()
    if p48 then
        if not vu33 then
            vu33 = vu17._getPower
        end
        function vu17._getPower()
            return 1
        end
        vu31 = false
        if vu32 then
            task.cancel(vu32)
        end
        vu32 = task.spawn(vu47)
        print("Auto Legit Fish: Started")
    else
        vu45()
        if vu32 then
            task.cancel(vu32)
            vu32 = nil
        end
    end
end
v22.M:Toggle({
    Title = "Auto Legit Fish",
    Desc = "Automatically fishes for you",
    Type = "Checkbox",
    Default = false,
    Callback = function(p50)
        vu49(p50)
    end
})
v22.M:Section({
    Title = "Fishing",
    TextXAlignment = "Left",
    TextSize = 17
})
local vu51 = false
local vu52 = 0.1
local vu53 = 1
local function vu54()
    local _, _ = pcall(function()
        vu12:FireServer(1)
    end)
end
local function vu55()
    if vu51 then
        local _, _ = pcall(function()
            vu9:InvokeServer(1756863567.217075)
            vu10:InvokeServer(- 139.63796997070312, 0.9964792798079721)
        end)
        task.wait(vu52)
        local _, _ = pcall(function()
            vu14:InvokeServer()
        end)
        if vu51 then
            local _, _ = pcall(function()
                vu9:InvokeServer(1756863567.217075)
                vu10:InvokeServer(- 139.63796997070312, 0.9964792798079721)
            end)
            task.wait(vu53)
            local _, _ = pcall(function()
                vu11:FireServer()
            end)
            task.spawn(vu55)
        end
    else
        return
    end
end
local function vu56()
    if not vu51 then
        vu51 = true
        vu54()
        task.wait(0.5)
        task.spawn(vu55)
    end
end
local function vu57()
    vu51 = false
end
v22.M:Toggle({
    Title = "Instant Fishing",
    Desc = "Another Instant Fishing If Instant Fishing Fixed",
    Type = "Checkbox",
    Callback = function(p58)
        if p58 then
            vu56()
        else
            vu57()
        end
    end
})
local vu59 = nil
vu59 = v22.M:Input({
    Title = "Custom Complete Delay",
    Desc = "Enter delay in seconds",
    Value = tostring(vu53),
    InputIcon = "timer",
    Type = "Input",
    Placeholder = "Enter number...",
    Callback = function(p60)
        local v61 = tonumber(p60)
        if v61 and 0 < v61 then
            vu53 = v61
        elseif vu59 then
            vu59:Set(tostring(vu53))
        end
    end
})
local vu62 = nil
vu62 = v22.M:Input({
    Title = "Custom Cancel Delay",
    Desc = "Enter delay in seconds",
    Value = tostring(vu52),
    InputIcon = "timer",
    Type = "Input",
    Placeholder = "Enter number...",
    Callback = function(p63)
        local v64 = tonumber(p63)
        if v64 and 0 < v64 then
            vu52 = v64
        elseif vu62 then
            vu62:Set(tostring(vu52))
        end
    end
})
local vu65 = false
local vu66 = 2
local vu67 = 1.25
local function vu68()
    local _, _ = pcall(function()
        vu12:FireServer(1)
    end)
end
local function vu69()
    task.spawn(function()
        vu14:InvokeServer()
        task.wait(vu66)
        vu9:InvokeServer(1756863567.217075)
        vu10:InvokeServer(- 139.63796997070312, 0.9964792798079721)
        task.wait(vu67)
        vu11:FireServer()
    end)
end
local function vu70()
    vu69()
end
_G.ReelSuper = 2
local function vu72()
    if not vu65 then
        vu65 = true
        vu68()
        task.spawn(function()
            while vu65 do
                local v71 = tick()
                vu70()
                while vu65 and tick() - v71 < _G.ReelSuper do
                    task.wait()
                end
            end
        end)
    end
end
local function vu73()
    vu65 = false
end
v22.M:Toggle({
    Title = "Super Instant Fishing",
    Desc = "Setting depend on your rods",
    Type = "Checkbox",
    Callback = function(p74)
        if p74 then
            vu72()
        else
            vu73()
        end
    end
})
local vu75 = nil
vu75 = v22.M:Input({
    Title = "Custom Delay Reel",
    Desc = "Enter delay in seconds",
    Value = tostring(vu66),
    InputIcon = "timer",
    Type = "Input",
    Placeholder = "Enter number...",
    Callback = function(p76)
        local v77 = tonumber(p76)
        if v77 and 0 < v77 then
            vu66 = v77
        elseif vu75 then
            vu75:Set(tostring(vu66))
        end
    end
})
local vu78 = nil
vu78 = v22.M:Input({
    Title = "Custom Complete Delay",
    Desc = "Enter delay in seconds",
    Value = tostring(vu67),
    InputIcon = "timer",
    Type = "Input",
    Placeholder = "Enter number...",
    Callback = function(p79)
        local v80 = tonumber(p79)
        if v80 and 0 < v80 then
            vu67 = v80
        elseif vu78 then
            vu78:Set(tostring(vu67))
        end
    end
})
v22.M:Section({
    Title = "Super Instant Fishing",
    TextXAlignment = "Left",
    TextSize = 17
})
local vu81 = false
local vu82 = 1.05
local vu83 = 0.16
local function vu84()
    local _, _ = pcall(function()
        vu12:FireServer(1)
    end)
end
local function vu85()
    task.spawn(function()
        vu14:InvokeServer()
        task.wait(vu82)
        vu9:InvokeServer(1756863567.217075)
        vu10:InvokeServer(- 139.63796997070312, 0.9964792798079721)
        task.wait(vu83)
        vu11:FireServer()
    end)
end
local function vu86()
    vu85()
end
_G.ReelSuper = 1.05
local function vu88()
    if not vu81 then
        vu81 = true
        vu84()
        task.spawn(function()
            while vu81 do
                local v87 = tick()
                vu86()
                while vu81 and tick() - v87 < _G.ReelSuper do
                    task.wait()
                end
            end
        end)
    end
end
local function vu89()
    vu81 = false
end
v22.M:Toggle({
    Title = "Super Instant Fishing V2",
    Desc = "Super Instant Fishing For u have Scythe <3",
    Type = "Checkbox",
    Callback = function(p90)
        if p90 then
            vu88()
        else
            vu89()
        end
    end
})
local vu91 = nil
vu91 = v22.M:Input({
    Title = "Custom Complete Delay",
    Desc = "Enter delay in seconds",
    Value = tostring(vu83),
    InputIcon = "timer",
    Type = "Input",
    Placeholder = "Enter number...",
    Callback = function(p92)
        local v93 = tonumber(p92)
        if v93 and 0 < v93 then
            vu83 = v93
        elseif vu91 then
            vu91:Set(tostring(vu83))
        end
    end
})
local vu94 = nil
vu94 = v22.M:Input({
    Title = "Custom Cancel Delay",
    Desc = "Enter delay in seconds",
    Value = tostring(vu82),
    InputIcon = "timer",
    Type = "Input",
    Placeholder = "Enter number...",
    Callback = function(p95)
        local v96 = tonumber(p95)
        if v96 and 0 < v96 then
            vu82 = v96
        elseif vu94 then
            vu94:Set(tostring(vu82))
        end
    end
})
v22.M:Section({
    Title = "Enchant",
    TextXAlignment = "Left",
    TextSize = 17
})
v22.M:Toggle({
    Title = "Auto Enchant Rod",
    Desc = "Automatically enchant your equipped rod",
    Type = "Checkbox",
    Callback = function()
        local v97 = Vector3.new(3231, - 1303, 1402)
        local v98 = workspace:WaitForChild("Characters"):FindFirstChild(vu34.Name)
        if v98 then
            v98 = v98:FindFirstChild("HumanoidRootPart")
        end
        if v98 then
            NotifyInfo("Preparing Enchant...", "Please manually place Enchant Stone into slot 5 before we begin...", 5)
            task.wait(3)
            local v99 = game:GetService("Players").LocalPlayer.PlayerGui.Backpack.Display:GetChildren()[10]
            local v100 = v99 and v99:FindFirstChild("Inner") and v99.Inner:FindFirstChild("Tags")
            if v100 then
                v100 = v99.Inner.Tags:FindFirstChild("ItemName")
            end
            if v100 and v100.Text:lower():find("enchant") then
                NotifyInfo("Enchanting...", "Enchanting in progress, please wait...", 7)
                local v101 = v98.Position
                task.wait(1)
                v98.CFrame = CFrame.new(v97 + Vector3.new(0, 5, 0))
                task.wait(1.2)
                pcall(function()
                    vu12:FireServer(5)
                    task.wait(0.5)
                    vu15:FireServer()
                    task.wait(7)
                end)
                task.wait(0.9)
                v98.CFrame = CFrame.new(v101 + Vector3.new(0, 3, 0))
            else
                NotifyError("Auto Enchant Rod", "Slot 5 does not contain an Enchant Stone.")
            end
        else
            NotifyError("Auto Enchant Rod", "Failed to get character HRP.")
            return
        end
    end
})
v22.M:Section({
    Title = "Notification",
    TextXAlignment = "Left",
    TextSize = 17
})
local function vu109(p102)
    local v103 = vu6:WaitForChild("PlayerGui"):FindFirstChild("Small Notification")
    if v103 then
        local v104 = v103:FindFirstChild("Display")
        if v104 then
            local v105, v106, v107 = ipairs(v104:GetChildren())
            while true do
                local v108
                v107, v108 = v105(v106, v107)
                if v107 == nil then
                    break
                end
                if v108:IsA("GuiObject") then
                    v108.Visible = p102
                end
            end
        end
    else
        return
    end
end
v22.M:Toggle({
    Title = "Caught Notification",
    Desc = "Use this For Disable ur Notification caught",
    Default = true,
    Callback = function(p110)
        if p110 then
            vu109(false)
        else
            vu109(true)
        end
    end
})
v22.S:Section({
    Title = "Selling",
    TextXAlignment = "Left",
    TextSize = 17
})
v22.S:Toggle({
    Title = "Auto Sell",
    Desc = "Automatic fish sales",
    Icon = "coins",
    Type = "Checkbox",
    Default = false,
    Callback = function(p111)
        _G.AutoSell = p111
        task.spawn(function()
            while _G.AutoSell do
                task.wait(5)
                pcall(function()
                    vu13:InvokeServer()
                end)
            end
        end)
    end
})
v22.S:Input({
    Title = "Auto Sell Input Amount",
    Desc = "Set the number of fish to catch before auto-selling. Default is 30.",
    Placeholder = "Default: 30",
    Type = "Input",
    Value = tostring(threshold),
    InputIcon = "timer",
    Callback = function(p112)
        local v113 = tonumber(p112)
        if v113 then
            threshold = v113
            vu1:Notify({
                Title = "Threshold Updated",
                Description = "Fish will be sold automatically when catch reaches " .. threshold,
                Duration = 1
            })
        else
            vu1:Notify({
                Title = "Invalid Input",
                Description = "Please enter a number, not text.",
                Duration = 1
            })
        end
    end
})
v22.Q:Section({
    Title = "Deep Sea Quest",
    TextXAlignment = "Left",
    TextSize = 17
})
local vu114 = {
    player = v4.LocalPlayer
}
local vu115 = v22.Q:Paragraph({
    Title = "Deep Sea Panel",
    Desc = ""
})
v22.Q:Divider()
v22.Q:Toggle({
    Title = "Auto Deep Sea Quest",
    Default = false,
    Callback = function(p116)
        vu114.autoDeepSea = p116
        task.spawn(function()
            while true do
                if true then
                    if not vu114.autoDeepSea then
                        return
                    end
                    local v117 = workspace:FindFirstChild("!!! MENU RINGS")
                    if v117 then
                        v117 = v117:FindFirstChild("Deep Sea Tracker")
                    end
                    if not v117 then
                    end
                end
                local v118 = v117:FindFirstChild("Board") and v117.Board:FindFirstChild("Gui")
                if v118 then
                    v118 = v117.Board.Gui:FindFirstChild("Content")
                end
                if v118 then
                    local v119, v120, v121 = ipairs(v118:GetChildren())
                    local v122 = nil
                    while true do
                        local v123
                        v121, v123 = v119(v120, v121)
                        if v121 == nil then
                            v123 = v122
                        end
                        if v123:IsA("TextLabel") and v123.Name ~= "Header" then
                            break
                        end
                    end
                    if v123 then
                        local v124 = string.lower(v123.Text)
                        local v125 = vu114.player.Character
                        if v125 then
                            v125 = vu114.player.Character:FindFirstChild("HumanoidRootPart")
                        end
                        if v125 then
                            if string.find(v124, "100%%") then
                                v125.CFrame = CFrame.new(- 3763, - 135, - 995) * CFrame.Angles(0, math.rad(180), 0)
                            else
                                v125.CFrame = CFrame.new(- 3599, - 276, - 1641)
                            end
                        end
                    end
                end
                task.wait(1)
            end
        end)
    end
})
v22.Q:Section({
    Title = "Element Quest",
    TextXAlignment = "Left",
    TextSize = 17
})
local vu126 = v22.Q:Paragraph({
    Title = "Element Panel",
    Desc = ""
})
v22.Q:Divider()
v22.Q:Toggle({
    Title = "Auto Element Quest",
    Default = false,
    Callback = function(p127)
        vu114.autoElement = p127
        task.spawn(function()
            local v128 = false
            while vu114.autoElement and not v128 do
                local v129 = workspace:FindFirstChild("!!! MENU RINGS")
                if v129 then
                    v129 = v129:FindFirstChild("Element Tracker")
                end
                if v129 then
                    local v130 = v129:FindFirstChild("Board") and v129.Board:FindFirstChild("Gui")
                    if v130 then
                        v130 = v129.Board.Gui:FindFirstChild("Content")
                    end
                    if v130 then
                        local v131, v132, v133 = ipairs(v130:GetChildren())
                        local v134 = {}
                        while true do
                            local v135
                            v133, v135 = v131(v132, v133)
                            if v133 == nil then
                                break
                            end
                            if v135:IsA("TextLabel") and v135.Name ~= "Header" then
                                table.insert(v134, string.lower(v135.Text))
                            end
                        end
                        local v136 = vu114.player.Character
                        if v136 then
                            v136 = vu114.player.Character:FindFirstChild("HumanoidRootPart")
                        end
                        if v136 and # v134 >= 4 then
                            local v137 = v134[2]
                            local v138 = v134[4]
                            if string.find(v138, "100%%") then
                                if string.find(v138, "100%%") and not string.find(v137, "100%%") then
                                    v136.CFrame = CFrame.new(1453, - 22, - 636)
                                elseif string.find(v137, "100%%") then
                                    v136.CFrame = CFrame.new(1480, 128, - 593)
                                    v128 = true
                                    vu114.autoElement = false
                                    if vu126 and vu126.SetDesc then
                                        vu126:SetDesc("Element Quest Completed!")
                                    end
                                end
                            else
                                v136.CFrame = CFrame.new(1484, 3, - 336) * CFrame.Angles(0, math.rad(180), 0)
                            end
                        end
                    end
                end
                task.wait(2)
            end
        end)
    end
})
local function vu148(p139)
    local v140 = workspace["!!! MENU RINGS"]:FindFirstChild(p139)
    if not v140 then
        return ""
    end
    local v141 = v140:FindFirstChild("Board") and v140.Board:FindFirstChild("Gui")
    if v141 then
        v141 = v140.Board.Gui:FindFirstChild("Content")
    end
    if not v141 then
        return ""
    end
    local v142, v143, v144 = ipairs(v141:GetChildren())
    local v145 = {}
    local v146 = 1
    while true do
        local v147
        v144, v147 = v142(v143, v144)
        if v144 == nil then
            break
        end
        if v147:IsA("TextLabel") and v147.Name ~= "Header" then
            table.insert(v145, v146 .. ". " .. v147.Text)
            v146 = v146 + 1
        end
    end
    return table.concat(v145, "\n")
end
task.spawn(function()
    while task.wait(2) do
        vu126:SetDesc(vu148("Element Tracker"))
        vu115:SetDesc(vu148("Deep Sea Tracker"))
    end
end)
v22.Q:Section({
    Title = "Artifact",
    TextXAlignment = "Left",
    TextSize = 17
})
local vu149 = game:GetService("ReplicatedStorage")
local v150 = game:GetService("Players")
game:GetService("RunService")
game:GetService("TweenService")
local vu151 = v150.LocalPlayer
local v152 = vu151
local vu153 = vu151.WaitForChild(v152, "PlayerGui")
local vu154 = {
    ["Hourglass Diamond Artifact"] = {
        Koordinat = Vector3.new(1478.0726, 5.7806, - 847.1714),
        ArahHadap = Vector3.new(- 0.1844, 0, 0.9828)
    },
    ["Diamond Artifact"] = {
        Koordinat = Vector3.new(1837.9366, 4.3452, - 306.2985),
        ArahHadap = Vector3.new(0.8314, 0, - 0.5556)
    },
    ["Arrow Artifact"] = {
        Koordinat = Vector3.new(877.6763, 3.0565, - 333.3725),
        ArahHadap = Vector3.new(- 0.9714, 0, 0.2372)
    },
    ["Crescent Artifact"] = {
        Koordinat = Vector3.new(1402.8289, 3.3359, 122.6733),
        ArahHadap = Vector3.new(- 0.2753, 0, 0.9613)
    }
}
local vu155 = {
    ["Arrow Artifact"] = 265,
    ["Crescent Artifact"] = 266,
    ["Diamond Artifact"] = 267,
    ["Hourglass Diamond Artifact"] = 271
}
local vu156 = false
local vu157 = false
local vu158 = nil
local vu159 = nil
local vu160 = nil
local function vu164()
    local v161 = workspace.CurrentCamera.ViewportSize
    local v162 = v161.X * 0.95
    local v163 = v161.Y * 0.95
    vu38:SendMouseButtonEvent(v162, v163, 0, true, nil, 0)
    vu38:SendMouseButtonEvent(v162, v163, 0, false, nil, 0)
end
local function vu165()
    vu157 = false
    if vu159 then
        vu17._getPower = vu159
        vu159 = nil
    end
end
local function vu167()
    pcall(function()
        while vu156 do
            if not vu151.Character then
                vu151.CharacterAdded:Wait()
            end
            if not vu156 then
                break
            end
            if vu160 then
                pcall(vu160.FireServer, vu160, 1)
            end
            task.wait(0.1)
            if not vu157 then
                vu164()
                vu157 = true
            end
            local v166 = vu153:FindFirstChild("Fishing")
            if v166 then
                v166 = v166:FindFirstChild("Main")
            end
            if v166 and v166.Visible then
                for _ = 1, 20 do
                    if not vu156 then
                        break
                    end
                    vu164()
                    task.wait(0.02)
                end
            end
            task.wait(0.1)
        end
    end)
    vu165()
end
local function vu169(p168)
    vu156 = p168
    if p168 then
        if not vu159 then
            vu159 = vu17._getPower
        end
        function vu17._getPower()
            return 1
        end
        vu157 = false
        if vu158 then
            task.cancel(vu158)
        end
        vu158 = task.spawn(vu167)
    else
        vu165()
        if vu158 then
            task.cancel(vu158)
            vu158 = nil
        end
    end
end
local function vu182()
    local v170 = require(vu149:WaitForChild("Packages"):WaitForChild("Replion")).Client:WaitReplion("Data", vu151)
    if not v170 then
        return {}, {}
    end
    local v171 = v170:Get("TempleLevers") or {}
    local v172 = v170:Get({
        "Inventory",
        "Items"
    }) or {}
    local v173, v174, v175 = ipairs(v172)
    local v176 = {}
    while true do
        local v177
        v175, v177 = v173(v174, v175)
        if v175 == nil then
            break
        end
        local v178, v179, v180 = pairs(vu155)
        while true do
            local v181
            v180, v181 = v178(v179, v180)
            if v180 == nil then
                break
            end
            if v177.Id == v181 then
                v176[v180] = true
            end
        end
    end
    return v171, v176
end
local function vu195()
    local v183, _ = vu182()
    local v184, v185, v186 = pairs(vu155)
    local v187 = {}
    while true do
        local v188
        v186, v188 = v184(v185, v186)
        if v186 == nil then
            break
        end
        table.insert(v187, (v183[v186] and "\226\156\133 Lever Placed: " or "\226\157\140 Not Placed: ") .. v186)
    end
    local v189 = table.concat(v187, "\n")
    local v190, v191, v192 = pairs(vu155)
    local v193 = true
    while true do
        local v194
        v192, v194 = v190(v191, v192)
        if v192 == nil then
            break
        end
        if not v183[v192] then
            v193 = false
            break
        end
    end
    if v193 then
        v189 = v189 .. "\n\n\226\156\133 All levers have been placed!"
    end
    return v189
end
local vu196 = v22.Q:Paragraph({
    Title = "Temple Artifact Progress",
    Desc = vu195()
})
local function vu197()
    return (vu151.Character or vu151.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
end
local function vu203(p198)
    local v199 = vu197()
    local v200 = vu154[p198]
    if v199 and v200 then
        local v201 = v200.Koordinat
        local v202 = v200.ArahHadap
        v199.CFrame = CFrame.new(v201, v201 + v202)
    end
end
local vu204 = false
local function vu214()
    if not vu204 then
        return
    end
    local v205, v206 = vu182()
    local v207 = vu149:FindFirstChild("Remotes")
    local v208, v209, v210 = pairs(vu155)
    if not v205[v210] then
        if not v206[v210] then
            vu203(v210)
            vu169(true)
            while true do
                task.wait(0.5)
                local v211 = vu153:FindFirstChild("Fishing")
                if v211 then
                    v211 = v211:FindFirstChild("Main")
                end
                if not (v211 and (v211.Visible and vu204)) then
                    vu169(false)
                    break
                end
            end
        end
        local v212 = v207 and v207:FindFirstChild("RE_PlaceLeverItem")
        if v212 then
            v212:FireServer(v210)
        end
        task.wait(1)
    end
    local v213
    v210, v213 = v208(v209, v210)
    if v210 ~= nil then
    else
    end
    vu196:SetDesc(vu195())
    task.wait(5)
	
end
local vu215 = Instance.new("ScreenGui")
vu215.Name = "ArtifactOverlay"
vu215.ResetOnSpawn = false
vu215.IgnoreGuiInset = true
vu215.Parent = vu153
vu215.Enabled = false
local v216 = Instance.new("Frame")
v216.Size = UDim2.new(1, 0, 1, 0)
v216.BackgroundColor3 = Color3.new(0, 0, 0)
v216.BackgroundTransparency = 0.6
v216.Parent = vu215
local v217 = Instance.new("Frame")
v217.AnchorPoint = Vector2.new(0.5, 0.5)
v217.Position = UDim2.new(0.5, 0, 0.5, 0)
v217.Size = UDim2.new(0, 400, 0, 320)
v217.BackgroundTransparency = 1
v217.Parent = vu215
local vu218 = Instance.new("ImageLabel")
vu218.Size = UDim2.new(0, 120, 0, 120)
vu218.Position = UDim2.new(0.5, 0, 0, 0)
vu218.AnchorPoint = Vector2.new(0.5, 0)
vu218.BackgroundTransparency = 1
vu218.Image = "rbxassetid://99464676738903"
vu218.Parent = v217
local vu219 = Instance.new("TextLabel")
vu219.Size = UDim2.new(1, 0, 0, 35)
vu219.Position = UDim2.new(0.5, 0, 0, 120)
vu219.AnchorPoint = Vector2.new(0.5, 0)
vu219.BackgroundTransparency = 1
vu219.Text = "SoraHub"
vu219.Font = Enum.Font.GothamBold
vu219.TextSize = 30
vu219.TextColor3 = Color3.fromRGB(255, 255, 255)
vu219.TextStrokeTransparency = 0.3
vu219.Parent = v217
local vu220 = Instance.new("TextLabel")
vu220.Size = UDim2.new(0.9, 0, 0, 60)
vu220.Position = UDim2.new(0.5, 0, 0, 160)
vu220.AnchorPoint = Vector2.new(0.5, 0)
vu220.BackgroundTransparency = 1
vu220.Text = "Do not make any movements to avoid disturbing the system"
vu220.Font = Enum.Font.Gotham
vu220.TextSize = 18
vu220.TextWrapped = true
vu220.TextColor3 = Color3.fromRGB(255, 255, 255)
vu220.TextStrokeTransparency = 0.5
vu220.Parent = v217
local vu221 = Instance.new("TextLabel")
vu221.Size = UDim2.new(1, 0, 0, 25)
vu221.Position = UDim2.new(0.5, 0, 0, 220)
vu221.AnchorPoint = Vector2.new(0.5, 0)
vu221.BackgroundTransparency = 1
vu221.Text = "https://discord.gg/rTbaUq4j"
vu221.Font = Enum.Font.GothamSemibold
vu221.TextSize = 16
vu221.TextColor3 = Color3.fromRGB(220, 170, 255)
vu221.TextStrokeTransparency = 0.6
vu221.Parent = v217
local function vu227(p222, p223, p224, p225, p226)
    vu215.Enabled = p222
    if p223 then
        vu219.Text = p223
    end
    if p224 then
        vu220.Text = p224
    end
    if p225 then
        vu221.Text = p225
    end
    if p226 then
        vu218.Image = "rbxassetid://" .. tostring(p226)
    end
end
v22.Q:Toggle({
    Title = "Auto Farm Artifact",
    Desc = "Automatically farm artifacts and place levers",
    Default = false,
    Callback = function(p228)
        vu204 = p228
        if p228 then
            vu227(true)
            task.spawn(vu214)
        else
            vu169(false)
            vu227(false)
        end
    end
})
v22.T:Section({
    Title = "Teleport",
    TextXAlignment = "Left",
    TextSize = 17
})
v22.T:Dropdown({
    Title = "Select Location",
    Values = {
        "Esoteric Island",
        "Kohana",
        "Kohana Volcano",
        "Kohana 1",
        "Kohana 2",
        "Coral Refs",
        "Enchant Room",
        "Tropical Grove",
        "Weather Machine",
        "Spawn",
        "Coral Refs 1",
        "Coral Reefs 2",
        "Coral Reefs 3",
        "Volcano",
        "Sisyphus Statue",
        "Treasure Room",
        "Crater Island Top",
        "Crater Island Ground",
        "Lost Shore",
        "Stingray Shores",
        "Tropical Grove",
        "Ice Sea",
        "Tropical Grove Cave 1",
        "Tropical Grove Cave 2",
        "Tropical Grove Highground",
        "Fisherman Island Underground",
        "Fisherman Island Mid",
        "Fisherman Island Left",
        "Fisherman Island Right",
        "Jungle",
        "Temple Guardian",
        "Underground Cellar",
        "Sacred Temple"
    },
    Callback = function(p229)
        local v230 = {
            ["Esoteric Island"] = Vector3.new(1990, 5, 1398),
            Kohana = Vector3.new(- 603, 3, 719),
            ["Coral Refs"] = Vector3.new(- 2855, 47, 1996),
            ["Enchant Room"] = Vector3.new(3221, - 1303, 1406),
            Spawn = Vector3.new(33, 9, 2810),
            Volcano = Vector3.new(- 632, 55, 197),
            ["Treasure Room"] = Vector3.new(- 3602.01, - 266.57, - 1577.18),
            ["Sisyphus Statue"] = Vector3.new(- 3703.69, - 135.57, - 1017.17),
            ["Crater Island Top"] = Vector3.new(1011.29, 22.68, 5076.27),
            ["Crater Island Ground"] = Vector3.new(1079.57, 3.64, 5080.35),
            ["Coral Reefs 1"] = Vector3.new(- 3031.88, 2.52, 2276.36),
            ["Coral Reefs 2"] = Vector3.new(- 3270.86, 2.5, 2228.1),
            ["Coral Reefs 3"] = Vector3.new(- 3136.1, 2.61, 2126.11),
            ["Lost Shore"] = Vector3.new(- 3737.97, 5.43, - 854.68),
            ["Weather Machine"] = Vector3.new(- 1524.88, 2.87, 1915.56),
            ["Kohana Volcano"] = Vector3.new(- 561.81, 21.24, 156.72),
            ["Kohana 1"] = Vector3.new(- 367.77, 6.75, 521.91),
            ["Kohana 2"] = Vector3.new(- 623.96, 19.25, 419.36),
            ["Stingray Shores"] = Vector3.new(44.41, 28.83, 3048.93),
            ["Tropical Grove"] = Vector3.new(- 2018.91, 9.04, 3750.59),
            ["Ice Sea"] = Vector3.new(2164, 7, 3269),
            ["Tropical Grove Cave 1"] = Vector3.new(- 2151, 3, 3671),
            ["Tropical Grove Cave 2"] = Vector3.new(- 2018, 5, 3756),
            ["Tropical Grove Highground"] = Vector3.new(- 2139, 53, 3624),
            ["Fisherman Island Underground"] = Vector3.new(- 62, 3, 2846),
            ["Fisherman Island Mid"] = Vector3.new(33, 3, 2764),
            ["Fisherman Island Left"] = Vector3.new(- 26, 10, 2686),
            ["Fisherman Island Right"] = Vector3.new(95, 10, 2684),
            Jungle = Vector3.new(1491.21667, 6.35540199, - 848.057617),
            ["Temple Guardian"] = Vector3.new(1481.58691, 127.624985, - 596.321777),
            ["Underground Cellar"] = Vector3.new(2113.85693, - 91.1985855, - 699.206787),
            ["Sacred Temple"] = Vector3.new(1478.45508, - 21.8498955, - 630.773315)
        }
        if vu6.Character and vu6.Character:FindFirstChild("HumanoidRootPart") then
            vu6.Character.HumanoidRootPart.CFrame = CFrame.new(v230[p229])
        end
    end
})
v22.T:Section({
    Title = "Fishing Spot",
    TextXAlignment = "Left",
    TextSize = 17
})
local vu231 = {
    enabled = false,
    selectedEvent = nil,
    originalPosition = nil,
    platform = nil,
    isAtEvent = false
}
v22.T:Dropdown({
    Title = "Select Event",
    Values = {
        "Megalodon Hunt",
        "Admin Event",
        "Ghost Worm",
        "Worm Hunt",
        "Shark Hunt",
        "Ghost Shark Hunt",
        "Shocked",
        "Black Hole",
        "Meteor Rain"
    },
    AllowNone = true,
    Multi = true,
    Callback = function(p232)
        vu231.selectedEvent = p232
    end
})
v22.T:Toggle({
    Title = "Auto Teleport Spawned Event",
    Desc = "Automatically teleports you to the chosen spawned event.",
    Value = false,
    Callback = function(p233)
        vu231.enabled = p233
        if not p233 and (vu231.isAtEvent and vu231.originalPosition) then
            if vu5 and (vu5.Character and vu5.Character.PrimaryPart) then
                local v234 = vu5.Character.PrimaryPart
                if v234.Anchored then
                    v234.Anchored = false
                    task.wait(0.1)
                end
                v234.CFrame = vu231.originalPosition
                if lockPositionState.enabled then
                    lockPositionState.position = v234.CFrame
                end
            end
            vu231.isAtEvent = false
        end
    end
})
local function vu251(p235)
    local v236 = Workspace:FindFirstChild("!!! MENU RINGS")
    if not v236 then
        return nil
    end
    local v237 = p235:lower()
    local v238, v239, v240 = ipairs(v236:GetChildren())
    while true do
        local v241
        v240, v241 = v238(v239, v240)
        if v240 == nil then
            break
        end
        if v241.Name == "Props" then
            local v242, v243, v244 = ipairs(v241:GetChildren())
            while true do
                local v245
                v244, v245 = v242(v243, v244)
                if v244 == nil then
                    break
                end
                if v245.Name:lower() == v237 then
                    if v245:IsA("Model") then
                        local v246 = v245.PrimaryPart or v245:FindFirstChildWhichIsA("BasePart")
                        if v246 then
                            return v246
                        end
                    elseif v245:IsA("BasePart") then
                        return v245
                    end
                end
                local v247, v248, v249 = ipairs(v245:GetDescendants())
                while true do
                    local v250
                    v249, v250 = v247(v248, v249)
                    if v249 == nil then
                        break
                    end
                    if v250:IsA("TextLabel") and v250.Text:lower() == v237 then
                        while v250 and v250 ~= v241 do
                            if v250:IsA("BasePart") then
                                return v250
                            end
                            v250 = v250.Parent
                        end
                    end
                end
            end
        end
    end
    return nil
end
task.spawn(function()
    while task.wait(5) do
        local vu252 = false
        local function v253()
            vu252 = true
        end
        if vu231.enabled and (vu231.selectedEvent and (vu5.Character and vu5.Character.PrimaryPart)) then
            local v254 = Workspace.Characters:FindFirstChild(vu151.Name)
            if v254 then
                v254 = v254:FindFirstChild("HumanoidRootPart")
            end
            if v254 then
                local v255, v256, v257 = ipairs(vu231.selectedEvent)
                local v258 = nil
                while true do
                    local v259
                    v257, v259 = v255(v256, v257)
                    if v257 == nil then
                        break
                    end
                    local v260 = vu251(v259)
                    if v260 then
                        v253()
                        v258 = v260
                    end
                end
                if v258 and not vu231.isAtEvent then
                    vu231.isAtEvent = true
                    vu231.originalPosition = v254.CFrame
                    floatPlat(true)
                    FloatPlayer:Set(true)
                    v254.Velocity = Vector3.zero
                    v254.CFrame = v258.CFrame * CFrame.new(20, 30, 0)
                    if lockPositionState.enabled then
                        lockPositionState.position = v254.CFrame
                    end
                elseif not v258 and vu231.isAtEvent then
                    floatPlat(false)
                    FloatPlayer:Set(false)
                    if vu231.originalPosition then
                        v254.CFrame = vu231.originalPosition
                        if lockPositionState.enabled then
                            lockPositionState.position = v254.CFrame
                        end
                    end
                    vu231.isAtEvent = false
                end
            end
        end
        if vu252 then
            break
        end
    end
end)
v22.U:Section({
    Title = "Utility",
    TextXAlignment = "Left",
    TextSize = 17
})
local vu261 = false
local vu262 = "Legendary"
local vu263 = {
    ["Artifact Items"] = {
        Ids = {
            265,
            266,
            267,
            271
        }
    },
    Legendary = {
        TierName = "Legendary"
    },
    Mythic = {
        TierName = "Mythic"
    },
    Secret = {
        TierName = "SECRET"
    }
}
local function vu276(p264)
    local v265 = Data:Get("Inventory")
    if v265 and v265.Items then
        local v266, v267, v268 = pairs(v265.Items)
        while true do
            local v269
            v268, v269 = v266(v267, v268)
            if v268 == nil then
                break
            end
            local v270 = v269.Id
            if v270 then
                if p264 == "Artifact Items" then
                    local v271, v272, v273 = ipairs(vu263["Artifact Items"].Ids)
                    while true do
                        local v274
                        v273, v274 = v271(v272, v273)
                        if v273 == nil then
                            break
                        end
                        if v269.Id == v274 and (v269.UUID and not v269.Favorited) then
                            REFavoriteItem:FireServer(v269.UUID)
                        end
                    end
                elseif v270.Data.Type == "Fishes" and v270.Probability then
                    local v275 = TierUtility.GetTierFromRarity(nil, v270.Probability.Chance)
                    if v275 and (v275.Name == vu263[p264].TierName and (v269.UUID and not v269.Favorited)) then
                        REFavoriteItem:FireServer(v269.UUID)
                    end
                end
            end
        end
    end
end
v22.U:Dropdown({
    Title = "Favorite Tier",
    Desc = "Select which item type or rarity you want to auto-favorite.",
    Values = {
        "Artifact Items",
        "Legendary",
        "Mythic",
        "Secret"
    },
    Default = "Legendary",
    Multi = false,
    Callback = function(p277)
        vu262 = p277
        vu1:Notify({
            Title = "Favorite Tier Selected",
            Description = "Now set to favorite: " .. vu262,
            Duration = 2
        })
    end
})
v22.U:Toggle({
    Title = "Auto Favorite",
    Desc = "Automatically favorite selected tier in your inventory.",
    Type = "Checkbox",
    Default = false,
    Callback = function(p278)
        vu261 = p278
        if p278 then
            task.spawn(function()
                while vu261 do
                    vu276(vu262)
                    task.wait(10)
                end
            end)
        end
    end
})
local vu279 = false
local vu280 = nil
local function vu281()
    if not vu280 then
        vu279 = true
        vu280 = coroutine.create(function()
            while vu279 do
                vu16:FireServer(- 9999)
                wait(0.5)
            end
        end)
        coroutine.resume(vu280)
    end
end
local function vu282()
    vu279 = false
    vu280 = nil
end
v22.U:Toggle({
    Title = "Oxygen Bypass",
    Desc = "Cant Die",
    Icon = "shield",
    Type = "Checkbox",
    Default = false,
    Callback = function(p283)
        if p283 then
            vu281()
        else
            vu282()
        end
    end
})
v22.U:Toggle({
    Title = "Freeze Character",
    Desc = "For Help Instant Fishing",
    Type = "Checkbox",
    Default = false,
    Callback = function(p284)
        _G.FreezeCharacter = p284
        if p284 then
            local v285 = game.Players.LocalPlayer.Character
            local vu286 = v285 and v285:FindFirstChild("HumanoidRootPart")
            if vu286 then
                originalCFrame = vu286.CFrame
                freezeConnection = game:GetService("RunService").Heartbeat:Connect(function()
                    if _G.FreezeCharacter and vu286 then
                        vu286.CFrame = originalCFrame
                    end
                end)
            end
        elseif freezeConnection then
            freezeConnection:Disconnect()
            freezeConnection = nil
        end
    end
})
v22.MSC:Section({
    Title = "Misc",
    TextXAlignment = "Left",
    TextSize = 17
})
game:GetService("ReplicatedStorage")
local v287 = game:GetService("Players")
local v288 = (v287.LocalPlayer.Character or v287.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart"):WaitForChild("Overhead")
local vu289 = v288.Content.Header
local vu290 = v288.LevelContainer.Label
local vu291 = vu289.Text
local vu292 = vu290.Text
local vu293 = vu291
local vu294 = vu292
local vu295 = false
v22.MSC:Input({
    Title = "Hide Name",
    Placeholder = "SORAHUB",
    Default = vu291,
    Callback = function(p296)
        vu293 = p296
        if vu295 then
            vu289.Text = vu293
        end
    end
})
v22.MSC:Input({
    Title = "Hide Level",
    Placeholder = "SORAHUB",
    Default = vu292,
    Callback = function(p297)
        vu294 = p297
        if vu295 then
            vu290.Text = vu294
        end
    end
})
v22.MSC:Toggle({
    Title = "Start Hide Identifier",
    Default = false,
    Callback = function(p298)
        vu295 = p298
        if p298 then
            vu289.Text = vu293
            vu290.Text = vu294
        else
            vu289.Text = vu291
            vu290.Text = vu292
            vu289.TextColor3 = Color3.new(1, 1, 1)
            vu290.TextColor3 = Color3.new(1, 1, 1)
        end
    end
})
coroutine.wrap(function()
    local v299 = 0
    while true do
        if vu295 then
            v299 = (v299 + 0.01) % 1
            local v300 = Color3.fromHSV(v299, 1, 1)
            vu289.TextColor3 = v300
            vu290.TextColor3 = v300
        else
            vu289.TextColor3 = Color3.new(1, 1, 1)
            vu290.TextColor3 = Color3.new(1, 1, 1)
        end
        wait(0.05)
    end
end)()
v22.MSC:Section({
    Title = "Other",
    TextXAlignment = "Left",
    TextSize = 17
})
v22.MSC:Toggle({
    Title = "AntiAFK",
    Desc = "Prevent Roblox from kicking you when idle",
    Icon = "shield",
    Type = "Checkbox",
    Default = false,
    Callback = function(p301)
        _G.AntiAFK = p301
        local vu302 = game:GetService("VirtualUser")
        task.spawn(function()
            while _G.AntiAFK do
                task.wait(60)
                pcall(function()
                    vu302:CaptureController()
                    vu302:ClickButton2(Vector2.new())
                end)
            end
        end)
    end
})
v22.MSC:Toggle({
    Title = "Auto Reconnect",
    Desc = "Automatic reconnect if disconnected",
    Icon = "plug-zap",
    Type = "Checkbox",
    Default = false,
    Callback = function(p303)
        _G.AutoReconnect = p303
        if p303 then
            task.spawn(function()
                while _G.AutoReconnect do
                    task.wait(2)
                    local v304 = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui")
                    local v305 = v304 and v304:FindFirstChild("promptOverlay")
                    if v305 then
                        local v306 = v305:FindFirstChild("ButtonPrimary")
                        if v306 and v306.Visible then
                            firesignal(v306.MouseButton1Click)
                        end
                    end
                end
            end)
        end
    end
})