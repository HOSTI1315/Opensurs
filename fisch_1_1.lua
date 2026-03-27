if not game:IsLoaded() then
    game.Loaded:Wait()
end

if game.CreatorId == 7381705 then 
    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
    local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
    
    local Window = Fluent:CreateWindow({
        Title = "DYHUB | Fisch🦈",
        SubTitle = "dsc.gg/dyhub",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = false,
        Theme = "Darker",
        MinimizeKey = Enum.KeyCode.LeftControl
    })

    local a=Instance.new("ScreenGui")local b=Instance.new("ImageButton")local c=Instance.new("UICorner")a.Name="MobileMinimize"a.Parent=game:GetService("CoreGui")a.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;b.Parent=a;b.BackgroundColor3=Color3.fromRGB(0,0,0)b.BorderColor3=Color3.fromRGB(0,0,0)b.BorderSizePixel=0;b.Position=UDim2.new(0,584,0,14);local originalSize=UDim2.new(0,45,0,45)b.Size=originalSize+UDim2.new(0,originalSize.X.Offset*0.15,0,originalSize.Y.Offset*0.15)b.Image="rbxassetid://131642672159441"c.CornerRadius=UDim.new(0.2,0)c.Parent=b;local dragging=false;local dragInput,mousePos,framePos;b.InputBegan:Connect(function(input)if input.UserInputType==Enum.UserInputType.MouseButton1 then dragging=true;mousePos=input.Position;framePos=b.Position;input.Changed:Connect(function()if input.UserInputState==Enum.UserInputState.End then dragging=false end end)end end)b.InputChanged:Connect(function(input)if input.UserInputType==Enum.UserInputType.MouseMovement then dragInput=input end end)game:GetService("UserInputService").InputChanged:Connect(function(input)if input==dragInput and dragging then local delta=input.Position-mousePos;b.Position=UDim2.new(framePos.X.Scale,framePos.X.Offset+delta.X,framePos.Y.Scale,framePos.Y.Offset+delta.Y)end end)b.MouseButton1Click:Connect(function()Window:Minimize()end)
    
    -- // // // Services // // // --
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local VirtualUser = game:GetService("VirtualUser")
    local HttpService = game:GetService("HttpService")
    local GuiService = game:GetService("GuiService")
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")
    local Players = game:GetService("Players")
    local CoreGui = game:GetService('StarterGui')
    local ContextActionService = game:GetService('ContextActionService')
    local UserInputService = game:GetService('UserInputService')

    -- // // // Locals // // // --
    local LocalPlayer = Players.LocalPlayer
    local LocalCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local HumanoidRootPart = LocalCharacter:FindFirstChild("HumanoidRootPart")
    local UserPlayer = HumanoidRootPart:WaitForChild("user")
    local ActiveFolder = Workspace:FindFirstChild("active")
    local FishingZonesFolder = Workspace:FindFirstChild("zones"):WaitForChild("fishing")
    local TpSpotsFolder = Workspace:FindFirstChild("world"):WaitForChild("spawns"):WaitForChild("TpSpots")
    local NpcFolder = Workspace:FindFirstChild("world"):WaitForChild("npcs")
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui", PlayerGui)
    local shadowCountLabel = Instance.new("TextLabel", screenGui)
    local RenderStepped = RunService.RenderStepped
    local WaitForSomeone = RenderStepped.Wait

    -- // // // Features List // // // --


    -- // // // Variables // // // --
    local CastMode = "Legit"
    local ShakeMode = "Navigation"
    local ReelMode = "Blatant"
    local CollectMode = "Teleports"
    local teleportSpots = {}
    local FreezeChar = false
    local DayOnlyLoop = nil
    local BypassGpsLoop = nil
    local Noclip = false
    local RunCount = false

    -- // // // Functions // // // --
    function ShowNotification(String)
        Fluent:Notify({
            Title = "DYHUB",
            Content = String,
            Duration = 5
        })
    end
    -- // Sending Execution To Discord // --
    local function GetPlayerStats()
        local hud = LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("hud")
        if hud and hud.safezone then
            local coins = hud.safezone:FindFirstChild("coins") and hud.safezone.coins.Text or "N/A"
            local jobId = game.JobId
            local joinScript = string.format("game:GetService('TeleportService'):TeleportToPlaceInstance(%d, '%s', game:GetService('Players').LocalPlayer)", game.PlaceId, jobId)
            return {
                Username = LocalPlayer.Name,
                DisplayName = LocalPlayer.DisplayName,
                Coins = coins,
                JobId = jobId,
                JoinScript = joinScript
            }
        end
        return nil
    end

    game.Players.LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
    spawn(function()
        while true do
            game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("afk"):FireServer(false)
            task.wait(0.01)
        end
    end)

    
        -- // // // Auto Cast // // // --
    local autoCastEnabled = false
    local function autoCast()
        if LocalCharacter then
            local tool = LocalCharacter:FindFirstChildOfClass("Tool")
            if tool then
                local hasBobber = tool:FindFirstChild("bobber")
                if not hasBobber then
                    if CastMode == "Legit" then
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, LocalPlayer, 0)
                        HumanoidRootPart.ChildAdded:Connect(function()
                            if HumanoidRootPart:FindFirstChild("power") ~= nil and HumanoidRootPart.power.powerbar.bar ~= nil then
                                HumanoidRootPart.power.powerbar.bar.Changed:Connect(function(property)
                                    if property == "Size" then
                                        if HumanoidRootPart.power.powerbar.bar.Size == UDim2.new(1, 0, 1, 0) then
                                            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, LocalPlayer, 0)
                                        end
                                    end
                                end)
                            end
                        end)
                    elseif CastMode == "Blatant" then
                        local rod = LocalCharacter and LocalCharacter:FindFirstChildOfClass("Tool")
                        if rod and rod:FindFirstChild("values") and string.find(rod.Name, "Rod") then
                            task.wait(0.5)
                            local Random = math.random(90, 99)
                            rod.events.cast:FireServer(Random)
                        end
                    end
                end
            end
            task.wait(0.5)
        end
    end

    -- // // // Auto Shake // // // --
    local autoShakeEnabled = false
    local autoShakeConnection
    local function autoShake()
        if ShakeMode == "Navigation" then
            task.wait()
            xpcall(function()
                local shakeui = PlayerGui:FindFirstChild("shakeui")
                if not shakeui then return end
                local safezone = shakeui:FindFirstChild("safezone")
                local button = safezone and safezone:FindFirstChild("button")
                task.wait(0.2)
                GuiService.SelectedObject = button
                if GuiService.SelectedObject == button then
                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                end
                task.wait(0.1)
                GuiService.SelectedObject = nil
            end,function (err)
            end)
        elseif ShakeMode == "Mouse" then
            task.wait()
            xpcall(function()
                local shakeui = PlayerGui:FindFirstChild("shakeui")
                if not shakeui then return end
                local safezone = shakeui:FindFirstChild("safezone")
                local button = safezone and safezone:FindFirstChild("button")
                local pos = button.AbsolutePosition
                local size = button.AbsoluteSize
                VirtualInputManager:SendMouseButtonEvent(pos.X + size.X / 2, pos.Y + size.Y / 2, 0, true, LocalPlayer, 0)
                VirtualInputManager:SendMouseButtonEvent(pos.X + size.X / 2, pos.Y + size.Y / 2, 0, false, LocalPlayer, 0)
            end,function (err)
            end)
        end
    end

    local function startAutoShake()
        if autoShakeConnection or not autoShakeEnabled then return end
        autoShakeConnection = RunService.RenderStepped:Connect(autoShake)
    end

    local function stopAutoShake()
        if autoShakeConnection then
            autoShakeConnection:Disconnect()
            autoShakeConnection = nil
        end
    end

    PlayerGui.DescendantAdded:Connect(function(descendant)
        if autoShakeEnabled and descendant.Name == "button" and descendant.Parent and descendant.Parent.Name == "safezone" then
            startAutoShake()
        end
    end)

    PlayerGui.DescendantAdded:Connect(function(descendant)
        if descendant.Name == "playerbar" and descendant.Parent and descendant.Parent.Name == "bar" then
            stopAutoShake()
        end
    end)

    if autoShakeEnabled and PlayerGui:FindFirstChild("shakeui") and PlayerGui.shakeui:FindFirstChild("safezone") and PlayerGui.shakeui.safezone:FindFirstChild("button") then
        startAutoShake()
    end

    -- // // // Auto Reel // // // --
    local autoReelEnabled = false
    local PerfectCatchEnabled = false
    local autoReelConnection
    local function autoReel()
        local reel = PlayerGui:FindFirstChild("reel")
        if not reel then return end
        local bar = reel:FindFirstChild("bar")
        local playerbar = bar and bar:FindFirstChild("playerbar")
        local fish = bar and bar:FindFirstChild("fish")
        if playerbar and fish then
            playerbar.Position = fish.Position
        end
    end

    local function noperfect()
        local reel = PlayerGui:FindFirstChild("reel")
        if not reel then return end
        local bar = reel:FindFirstChild("bar")
        local playerbar = bar and bar:FindFirstChild("playerbar")
        if playerbar then
            playerbar.Position = UDim2.new(0, 0, -35, 0)
            wait(0.2)
        end
    end

    local function startAutoReel()
        if ReelMode == "Legit" then
            if autoReelConnection or not autoReelEnabled then return end
            noperfect()
            task.wait(2)
            autoReelConnection = RunService.RenderStepped:Connect(autoReel)
        elseif ReelMode == "Blatant" then
            local reel = PlayerGui:FindFirstChild("reel")
            if not reel then return end
            local bar = reel:FindFirstChild("bar")
            local playerbar = bar and bar:FindFirstChild("playerbar")
            playerbar:GetPropertyChangedSignal('Position'):Wait()
            game.ReplicatedStorage:WaitForChild("events"):WaitForChild("reelfinished"):FireServer(100, false)
        end
    end

    local function stopAutoReel()
        if autoReelConnection then
            autoReelConnection:Disconnect()
            autoReelConnection = nil
        end
    end

    PlayerGui.DescendantAdded:Connect(function(descendant)
        if autoReelEnabled and descendant.Name == "playerbar" and descendant.Parent and descendant.Parent.Name == "bar" then
            startAutoReel()
        end
    end)

    PlayerGui.DescendantRemoving:Connect(function(descendant)
        if descendant.Name == "playerbar" and descendant.Parent and descendant.Parent.Name == "bar" then
            stopAutoReel()
            if autoCastEnabled then
                task.wait(1)
                autoCast()
            end
        end
    end)

    if autoReelEnabled and PlayerGui:FindFirstChild("reel") and 
        PlayerGui.reel:FindFirstChild("bar") and 
        PlayerGui.reel.bar:FindFirstChild("playerbar") then
        startAutoReel()
    end

    -- // // // Zone Cast // // // --
    ZoneConnection = LocalCharacter.ChildAdded:Connect(function(child)
        if ZoneCast and child:IsA("Tool") and FishingZonesFolder:FindFirstChild(Zone) ~= nil then
            child.ChildAdded:Connect(function(blehh)
                if blehh.Name == "bobber" then
                    local RopeConstraint = blehh:FindFirstChildOfClass("RopeConstraint")
                    if ZoneCast and RopeConstraint ~= nil then
                        RopeConstraint.Changed:Connect(function(property)
                            if property == "Length" then
                                RopeConstraint.Length = math.huge
                            end
                        end)
                        RopeConstraint.Length = math.huge
                    end
                    task.wait(1)
                    while WaitForSomeone(RenderStepped) do
                        if ZoneCast and blehh.Parent ~= nil then
                            task.wait()
                            blehh.CFrame = FishingZonesFolder[Zone].CFrame
                        else
                            break
                        end
                    end
                end
            end)
        end
    end)

    -- // Find TpSpots // --
    local TpSpotsFolder = Workspace:FindFirstChild("world"):WaitForChild("spawns"):WaitForChild("TpSpots")
    for i, v in pairs(TpSpotsFolder:GetChildren()) do
        if table.find(teleportSpots, v.Name) == nil then
            table.insert(teleportSpots, v.Name)
        end
    end

    -- // // // Get Position // // // --
    function GetPosition()
        if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            return {
                Vector3.new(0,0,0),
                Vector3.new(0,0,0),
                Vector3.new(0,0,0)
            }
        end
        return {
            game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X,
            game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y,
            game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z
        }
    end
    function ExportValue(arg1, arg2)
        return tonumber(string.format("%."..(arg2 or 1)..'f', arg1))
    end

    
    -- // // // Sell Item // // // --
    function rememberPosition()
        spawn(function()
            local initialCFrame = HumanoidRootPart.CFrame
    
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bodyVelocity.Parent = HumanoidRootPart
    
            local bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            bodyGyro.D = 100
            bodyGyro.P = 10000
            bodyGyro.CFrame = initialCFrame
            bodyGyro.Parent = HumanoidRootPart
    
            while AutoFreeze do
                HumanoidRootPart.CFrame = initialCFrame
                task.wait(0.01)
            end
            if bodyVelocity then
                bodyVelocity:Destroy()
            end
            if bodyGyro then
                bodyGyro:Destroy()
            end
        end)
    end
    function SellHand()
        local currentPosition = HumanoidRootPart.CFrame
        local sellPosition = CFrame.new(464, 151, 232)
        local wasAutoFreezeActive = false
        if AutoFreeze then
            wasAutoFreezeActive = true
            AutoFreeze = false
        end
        HumanoidRootPart.CFrame = sellPosition
        task.wait(0.5)
        workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant"):WaitForChild("sell"):InvokeServer()
        task.wait(1)
        HumanoidRootPart.CFrame = currentPosition
        if wasAutoFreezeActive then
            AutoFreeze = true
            rememberPosition()
        end
    end
    function SellAll()
        local currentPosition = HumanoidRootPart.CFrame
        local sellPosition = CFrame.new(464, 151, 232)
        local wasAutoFreezeActive = false
        if AutoFreeze then
            wasAutoFreezeActive = true
            AutoFreeze = false
        end
        HumanoidRootPart.CFrame = sellPosition
        task.wait(0.5)
        workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant"):WaitForChild("sellall"):InvokeServer()
        task.wait(1)
        HumanoidRootPart.CFrame = currentPosition
        if wasAutoFreezeActive then
            AutoFreeze = true
            rememberPosition()
        end
    end
    -- // // // Noclip Stepped // // // --
    NoclipConnection = RunService.Stepped:Connect(function()
        if Noclip == true then
            if LocalCharacter ~= nil then
                for i, v in pairs(LocalCharacter:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide == true then
                        v.CanCollide = false
                    end
                end
            end
        end
    end)
    --Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
    local Tabs = {
        Main = Window:AddTab({ Title = "Main", Icon = "gamepad-2" }),
        Items = Window:AddTab({ Title = "Items", Icon = "slack" }),
        Teleports = Window:AddTab({ Title = "Teleports", Icon = "slack" }),
        Misc = Window:AddTab({ Title = "Misc", Icon = "list-ordered" }),
        Tools = Window:AddTab({ Title = "Tools", Icon = "wrench" }),
        Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
    }

    local Options = Fluent.Options

    do -- no delete
        Fluent:Notify({
            Title = "DENG HUB",
            Content = "🐟 Fisch Script",
            SubContent = "Script Update 04/12/24 06:40",
            Duration = 10
        })

        -- ============================================= Other Code =====================================
        -- // Main Tab // --
        local section = Tabs.Main:AddSection("Auto Fishing")
        local autoCast = Tabs.Main:AddToggle("autoCast", {Title = "Auto Cast", Default = false })
        autoCast:OnChanged(function()
            local RodName = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value
            if Options.autoCast.Value == true then
                autoCastEnabled = true
                if LocalPlayer.Backpack:FindFirstChild(RodName) then
                    LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild(RodName))
                end
                if LocalCharacter then
                    local tool = LocalCharacter:FindFirstChildOfClass("Tool")
                    if tool then
                        local hasBobber = tool:FindFirstChild("bobber")
                        if not hasBobber then
                            if CastMode == "Legit" then
                                VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, LocalPlayer, 0)
                                HumanoidRootPart.ChildAdded:Connect(function()
                                    if HumanoidRootPart:FindFirstChild("power") ~= nil and HumanoidRootPart.power.powerbar.bar ~= nil then
                                        HumanoidRootPart.power.powerbar.bar.Changed:Connect(function(property)
                                            if property == "Size" then
                                                if HumanoidRootPart.power.powerbar.bar.Size == UDim2.new(1, 0, 1, 0) then
                                                    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, LocalPlayer, 0)
                                                end
                                            end
                                        end)
                                    end
                                end)
                            elseif CastMode == "Blatant" then
                                local rod = LocalCharacter and LocalCharacter:FindFirstChildOfClass("Tool")
                                if rod and rod:FindFirstChild("values") and string.find(rod.Name, "Rod") then
                                    task.wait(0.5)
                                    local Random = math.random(90, 99)
                                    rod.events.cast:FireServer(Random)
                                end
                            end
                        end
                    end
                    task.wait(1)
                end
            else
                autoCastEnabled = false
            end
        end)
        local autoShake = Tabs.Main:AddToggle("autoShake", {Title = "Auto Shake", Default = false })
        autoShake:OnChanged(function()
            if Options.autoShake.Value == true then
                autoShakeEnabled = true
                startAutoShake()
            else
                autoShakeEnabled = false
                stopAutoShake()
            end
        end)
        local autoReel = Tabs.Main:AddToggle("autoReel", {Title = "Auto Reel", Default = false })
        autoReel:OnChanged(function()
            if Options.autoReel.Value == true then
                autoReelEnabled = true
                startAutoReel()
            else
                autoReelEnabled = false
                stopAutoReel()
            end
        end)
        local FreezeCharacter = Tabs.Main:AddToggle("FreezeCharacter", {Title = "Freeze Character", Default = false })
        FreezeCharacter:OnChanged(function()
            local oldpos = HumanoidRootPart.CFrame
            FreezeChar = Options.FreezeCharacter.Value
            task.wait()
            while WaitForSomeone(RenderStepped) do
                if FreezeChar and HumanoidRootPart ~= nil then
                    task.wait()
                    HumanoidRootPart.CFrame = oldpos
                else
                    break
                end
            end
        end)

        -- // Mode Tab // --
        local section = Tabs.Main:AddSection("Mode Fishing")
        local autoCastMode = Tabs.Main:AddDropdown("autoCastMode", {
            Title = "Auto Cast Mode",
            Values = {"Legit", "Blatant"},
            Multi = false,
            Default = CastMode,
        })
        autoCastMode:OnChanged(function(Value)
            CastMode = Value
        end)
        local autoShakeMode = Tabs.Main:AddDropdown("autoShakeMode", {
            Title = "Auto Shake Mode",
            Values = {"Navigation", "Mouse"},
            Multi = false,
            Default = ShakeMode,
        })
        autoShakeMode:OnChanged(function(Value)
            ShakeMode = Value
        end)
        local autoReelMode = Tabs.Main:AddDropdown("autoReelMode", {
            Title = "Auto Reel Mode",
            Values = {"Legit", "Blatant"},
            Multi = false,
            Default = ReelMode,
        })
        autoReelMode:OnChanged(function(Value)
            ReelMode = Value
        end)

         -- // Sell Tab // --
        local section = Tabs.Items:AddSection("Sell Items")
        Tabs.Items:AddButton({
            Title = "Sell for Hand",
            Description = "",
            Callback = function()
                SellHand()
            end
        })
        Tabs.Items:AddButton({
            Title = "Sell All",
            Description = "",
            Callback = function()
                SellAll()
            end
        })


        -- // Teleports Tab // --
        local section = Tabs.Teleports:AddSection("Select Teleport")
        local IslandTPDropdownUI = Tabs.Teleports:AddDropdown("IslandTPDropdownUI", {
            Title = "Area Teleport",
            Values = teleportSpots,
            Multi = false,
            Default = nil,
        })
        IslandTPDropdownUI:OnChanged(function(Value)
            if teleportSpots ~= nil and HumanoidRootPart ~= nil then
                xpcall(function()
                    HumanoidRootPart.CFrame = TpSpotsFolder:FindFirstChild(Value).CFrame + Vector3.new(0, 5, 0)
                    IslandTPDropdownUI:SetValue(nil)
                end,function (err)
                end)
            end
        end)
        local TotemTPDropdownUI = Tabs.Teleports:AddDropdown("TotemTPDropdownUI", {
            Title = "Select Totem",
            Values = {"Aurora", "Sundial", "Windset", "Smokescreen", "Tempest"},
            Multi = false,
            Default = nil,
        })
        TotemTPDropdownUI:OnChanged(function(Value)
            SelectedTotem = Value
            if SelectedTotem == "Aurora" then
                HumanoidRootPart.CFrame = CFrame.new(-1811, -137, -3282)
                TotemTPDropdownUI:SetValue(nil)
            elseif SelectedTotem == "Sundial" then
                HumanoidRootPart.CFrame = CFrame.new(-1148, 135, -1075)
                TotemTPDropdownUI:SetValue(nil)
            elseif SelectedTotem == "Windset" then
                HumanoidRootPart.CFrame = CFrame.new(2849, 178, 2702)
                TotemTPDropdownUI:SetValue(nil)
            elseif SelectedTotem == "Smokescreen" then
                HumanoidRootPart.CFrame = CFrame.new(2789, 140, -625)
                TotemTPDropdownUI:SetValue(nil)
            elseif SelectedTotem == "Tempest" then
                HumanoidRootPart.CFrame = CFrame.new(35, 133, 1943)
                TotemTPDropdownUI:SetValue(nil)
            end
        end)
        local WorldEventTPDropdownUI = Tabs.Teleports:AddDropdown("WorldEventTPDropdownUI", {
            Title = "Select World Event",
            Values = {"Strange Whirlpool", "Great Hammerhead Shark", "Great White Shark", "Whale Shark", "The Depths - Serpent"},
            Multi = false,
            Default = nil,
        })
        WorldEventTPDropdownUI:OnChanged(function(Value)
            SelectedWorldEvent = Value
            if SelectedWorldEvent == "Strange Whirlpool" then
                local offset = Vector3.new(25, 135, 25)
                local WorldEvent = game.Workspace.zones.fishing:FindFirstChild("Isonade")
                if not WorldEvent then WorldEventTPDropdownUI:SetValue(nil) return ShowNotification("Not found Strange Whirlpool") end
                HumanoidRootPart.CFrame = CFrame.new(game.Workspace.zones.fishing.Isonade.Position + offset)                           -- Strange Whirlpool
                WorldEventTPDropdownUI:SetValue(nil)
            elseif SelectedWorldEvent == "Great Hammerhead Shark" then
                local offset = Vector3.new(0, 135, 0)
                local WorldEvent = game.Workspace.zones.fishing:FindFirstChild("Great Hammerhead Shark")
                if not WorldEvent then WorldEventTPDropdownUI:SetValue(nil) return ShowNotification("Not found Great Hammerhead Shark") end
                HumanoidRootPart.CFrame = CFrame.new(game.Workspace.zones.fishing["Great Hammerhead Shark"].Position + offset)         -- Great Hammerhead Shark
                WorldEventTPDropdownUI:SetValue(nil)
            elseif SelectedWorldEvent == "Great White Shark" then
                local offset = Vector3.new(0, 135, 0)
                local WorldEvent = game.Workspace.zones.fishing:FindFirstChild("Great White Shark")
                if not WorldEvent then WorldEventTPDropdownUI:SetValue(nil) return ShowNotification("Not found Great White Shark") end
                HumanoidRootPart.CFrame = CFrame.new(game.Workspace.zones.fishing["Great White Shark"].Position + offset)               -- Great White Shark
                WorldEventTPDropdownUI:SetValue(nil)
            elseif SelectedWorldEvent == "Whale Shark" then
                local offset = Vector3.new(0, 135, 0)
                local WorldEvent = game.Workspace.zones.fishing:FindFirstChild("Whale Shark")
                if not WorldEvent then WorldEventTPDropdownUI:SetValue(nil) return ShowNotification("Not found Whale Shark") end
                HumanoidRootPart.CFrame = CFrame.new(game.Workspace.zones.fishing["Whale Shark"].Position + offset)                     -- Whale Shark
                WorldEventTPDropdownUI:SetValue(nil)
            elseif SelectedWorldEvent == "The Depths - Serpent" then
                local offset = Vector3.new(0, 50, 0)
                local WorldEvent = game.Workspace.zones.fishing:FindFirstChild("The Depths - Serpent")
                if not WorldEvent then WorldEventTPDropdownUI:SetValue(nil) return ShowNotification("Not found The Depths - Serpent") end
                HumanoidRootPart.CFrame = CFrame.new(game.Workspace.zones.fishing["The Depths - Serpent"].Position + offset)            -- The Depths - Serpent
                WorldEventTPDropdownUI:SetValue(nil)
            end
        end)
        Tabs.Teleports:AddButton({
            Title = "Teleport to Traveler Merchant",
            Description = "Teleports to the Traveler Merchant.",
            Callback = function()
                local Merchant = game.Workspace.active:FindFirstChild("Merchant Boat")
                if not Merchant then return ShowNotification("Not found Merchant") end
                HumanoidRootPart.CFrame = CFrame.new(game.Workspace.active["Merchant Boat"].Boat["Merchant Boat"].r.HandlesR.Position)
            end
        })



        -- // Character Tab // --
        local section = Tabs.Misc:AddSection("Character")
        local WalkOnWater = Tabs.Misc:AddToggle("WalkOnWater", {Title = "Walk On Water", Default = false })
        WalkOnWater:OnChanged(function()
            for i,v in pairs(workspace.zones.fishing:GetChildren()) do
                if v.Name == WalkZone then
                    v.CanCollide = Options.WalkOnWater.Value
                    if v.Name == "Ocean" then
                        for i,v in pairs(workspace.zones.fishing:GetChildren()) do
                            if v.Name == "Deep Ocean" then
                                v.CanCollide = Options.WalkOnWater.Value
                            end
                        end
                    end
                end
            end
        end)
        local WalkOnWaterZone = Tabs.Misc:AddDropdown("WalkOnWaterZone", {
            Title = "Walk On Water Zone",
            Values = {"Ocean", "Desolate Deep", "The Depths"},
            Multi = false,
            Default = "Ocean",
        })
        WalkOnWaterZone:OnChanged(function(Value)
            WalkZone = Value
        end)
        local WalkSpeedSliderUI = Tabs.Misc:AddSlider("WalkSpeedSliderUI", {
            Title = "Walk Speed",
            Min = 16,
            Max = 200,
            Default = 16,
            Rounding = 1,
        })
        WalkSpeedSliderUI:OnChanged(function(value)
            LocalPlayer.Character.Humanoid.WalkSpeed = value
        end)
        local JumpHeightSliderUI = Tabs.Misc:AddSlider("JumpHeightSliderUI", {
            Title = "Jump Height",
            Min = 50,
            Max = 200,
            Default = 50,
            Rounding = 1,
        })
        JumpHeightSliderUI:OnChanged(function(value)
            LocalPlayer.Character.Humanoid.JumpPower = value
        end)

        local ToggleNoclip = Tabs.Misc:AddToggle("ToggleNoclip", {Title = "Noclip", Default = false })
        ToggleNoclip:OnChanged(function()
            Noclip = Options.ToggleNoclip.Value
        end)
        -- // Misc Tab // --
        local section = Tabs.Misc:AddSection("Misc")
        local BypassRadar = Tabs.Misc:AddToggle("BypassRadar", {Title = "Bypass Fish Radar", Default = false })
        BypassRadar:OnChanged(function()
            for _, v in pairs(game:GetService("CollectionService"):GetTagged("radarTag")) do
                if v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
                    v.Enabled = Options.BypassRadar.Value
                end
            end
        end)

        local RemoveFog = Tabs.Misc:AddToggle("RemoveFog", {Title = "Remove Fog", Default = false })
        RemoveFog:OnChanged(function()
            if Options.RemoveFog.Value == true then
                if game:GetService("Lighting"):FindFirstChild("Sky") then
                    game:GetService("Lighting"):FindFirstChild("Sky").Parent = game:GetService("Lighting").bloom
                end
            else
                if game:GetService("Lighting").bloom:FindFirstChild("Sky") then
                    game:GetService("Lighting").bloom:FindFirstChild("Sky").Parent = game:GetService("Lighting")
                end
            end
        end)
        local DayOnly = Tabs.Misc:AddToggle("DayOnly", {Title = "Day Only", Default = false })
        DayOnly:OnChanged(function()
            if Options.DayOnly.Value == true then
                DayOnlyLoop = RunService.Heartbeat:Connect(function()
                    game:GetService("Lighting").TimeOfDay = "12:00:00"
                end)
            else
                if DayOnlyLoop then
                    DayOnlyLoop:Disconnect()
                    DayOnlyLoop = nil
                end
            end
        end)
        local NightOnly = Tabs.Misc:AddToggle("NightOnly", {Title = "Night Only", Default = false })
        NightOnly:OnChanged(function()
            if Options.NightOnly.Value == true then
                NightOnlyLoop = RunService.Heartbeat:Connect(function()
                    game:GetService("Lighting").TimeOfDay = "24:00:00"
                end)
            else
                if NightOnlyLoop then
                    NightOnlyLoop:Disconnect()
                    NightOnlyLoop = nil
                end
            end
        end)
        local HoldDuration = Tabs.Misc:AddToggle("HoldDuration", {Title = "Hold Duration 0 sec", Default = false })
        HoldDuration:OnChanged(function()
            if Options.HoldDuration.Value == true then
                for i,v in ipairs(game:GetService("Workspace"):GetDescendants()) do
                    if v.ClassName == "ProximityPrompt" then
                        v.HoldDuration = 0
                    end
                end
            end
        end)
        local DisableOxygen = Tabs.Misc:AddToggle("DisableOxygen", {Title = "Disable Oxygen", Default = true })
        DisableOxygen:OnChanged(function()
            LocalPlayer.Character.client.oxygen.Disabled = Options.DisableOxygen.Value
        end)

        local IdentityHiderUI = Tabs.Misc:AddToggle("IdentityHiderUI", {Title = "Protect Identity (Steam/Youtube)", Default = false })    
        IdentityHiderUI:OnChanged(function()
            while Options.IdentityHiderUI.Value == true do
                if UserPlayer:FindFirstChild("streak") then UserPlayer.streak.Text = "DENG HUB Script Free | https://discord.gg/Ex7YV4BruG" end
                if UserPlayer:FindFirstChild("level") then UserPlayer.level.Text = "Level: 9999999" end
                if UserPlayer:FindFirstChild("level") then UserPlayer.user.Text = "DENG HUB" end
                local hud = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("hud"):WaitForChild("safezone")
                if hud:FindFirstChild("coins") then hud.coins.Text = "999999999999999" .. " C$" end
                if hud:FindFirstChild("lvl") then hud.lvl.Text = "Level 999999" end
                task.wait(0.01)
            end
        end)
        -- ============================================= Other Code End =================================
        -- ====================================  Tools  ====================================
        local Tools_Option = Tabs.Tools:AddSection("Option")
        Tools_Option:AddButton({
            Title = "White Screen Enabled ✅",
            -- Description = "Click here to Teleport the map.",
            Callback = function()
                game:GetService("RunService"):Set3dRenderingEnabled(false)

            end
        })
        
        Tools_Option:AddButton({
            Title = "White Screen Disabled ❌",
            -- Description = "Click here to Teleport the map.",
            Callback = function()
                game:GetService("RunService"):Set3dRenderingEnabled(true)
            end
        })
        
        Tools_Option:AddButton({
            Title = "Low VFX",
            Callback = function()
                workspace:FindFirstChildOfClass('Terrain').WaterWaveSize = 0
                workspace:FindFirstChildOfClass('Terrain').WaterWaveSpeed = 0
                workspace:FindFirstChildOfClass('Terrain').WaterReflectance = 0
                workspace:FindFirstChildOfClass('Terrain').WaterTransparency = 0
                game:GetService("Lighting").GlobalShadows = false
                game:GetService("Lighting").FogEnd = 9e9
                settings().Rendering.QualityLevel = 1
                for i,v in pairs(workspace:GetDescendants()) do
                    if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                        v.Material = "Plastic"
                        v.Reflectance = 0
                    elseif v:IsA("Decal") then
                        v.Transparency = 1
                    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                        v.Lifetime = NumberRange.new(0)
                    elseif v:IsA("Explosion") then
                        v.BlastPressure = 1
                        v.BlastRadius = 1
                    end
                end
                for i,v in pairs(game:GetService("Lighting"):GetDescendants()) do
                    if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
                        v.Enabled = false
                    end
                end
            end
        })
        Tools_Option:AddButton({
            Title = "BoostFPS",
            Callback = function()
                local ToDisable = {
                    Textures = true,
                    VisualEffects = true,
                    Parts = true,
                    Particles = true,
                    Sky = true
                }
            
                local ToEnable = {
                    FullBright = false
                }
            
                local Stuff = {}
            
                for _, v in next, game:GetDescendants() do
                    if ToDisable.Parts then
                        if v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart") then
                            v.Material = Enum.Material.SmoothPlastic
                            table.insert(Stuff, 1, v)
                        end
                    end
            
                    if ToDisable.Particles then
                        if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Explosion") or v:IsA("Sparkles") or v:IsA("Fire") then
                            v.Enabled = false
                            table.insert(Stuff, 1, v)
                        end
                    end
            
                    if ToDisable.VisualEffects then
                        if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") then
                            v.Enabled = false
                            table.insert(Stuff, 1, v)
                        end
                    end
            
                    if ToDisable.Textures then
                        if v:IsA("Decal") or v:IsA("Texture") then
                            v.Texture = ""
                            table.insert(Stuff, 1, v)
                        end
                    end
            
                    if ToDisable.Sky then
                        if v:IsA("Sky") then
                            v.Parent = nil
                            table.insert(Stuff, 1, v)
                        end
                    end
                end
            
                game:GetService("TestService"):Message("Effects Disabler Script : Successfully disabled "..#Stuff.." assets / effects. Settings :")
            
                for i, v in next, ToDisable do
                    print(tostring(i)..": "..tostring(v))
                end
            
                if ToEnable.FullBright then
                    local Lighting = game:GetService("Lighting")
            
                    Lighting.FogColor = Color3.fromRGB(255, 255, 255)
                    Lighting.FogEnd = math.huge
                    Lighting.FogStart = math.huge
                    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
                    Lighting.Brightness = 5
                    Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
                    Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
                    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
                    Lighting.Outlines = true
                end
            end
        })
        
        local Tools_Tools = Tabs.Tools:AddSection("Tools")
        Tools_Tools:AddButton({
            Title = "Copy Position",
            Callback = function()
                setclipboard(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position))
            end
        })

        local Tools_Addon = Tabs.Tools:AddSection("Addon")
        Tools_Addon:AddButton({
            Title = "Rejoin",
            -- Description = "Click here to Teleport the map.",
            Callback = function()
                local ts = game:GetService("TeleportService") local p = game.Players.LocalPlayer ts:Teleport(game.PlaceId, p) 
            end
        })
        Tools_Addon:AddButton({
            Title = "Hop Server",
            -- Description = "Click here to Teleport the map.",
            Callback = function()
                local PlaceID = game.PlaceId
                local AllIDs = {}
                local foundAnything = ""
                local actualHour = os.date("!*t").hour
                local Deleted = false
                function TPReturner()
                    local Site;
                    if foundAnything == "" then
                        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
                    else
                        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                    end
                    local ID = ""
                    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                        foundAnything = Site.nextPageCursor
                    end
                    local num = 0;
                    for i,v in pairs(Site.data) do
                        local Possible = true
                        ID = tostring(v.id)
                        if tonumber(v.maxPlayers) > tonumber(v.playing) then
                            for _,Existing in pairs(AllIDs) do
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
                            if Possible == true then
                                table.insert(AllIDs, ID)
                                wait()
                                pcall(function()
                                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                                    wait()
                                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                                end)
                                wait(4)
                            end
                        end
                    end
                end

                function Teleport()
                    while wait() do
                        pcall(function()
                            TPReturner()
                            if foundAnything ~= "" then
                                TPReturner()
                            end
                        end)
                    end
                end
                Teleport()
            end
        })
        Tools_Addon:AddButton({
            Title = "Copy JobID",
            -- Description = "Click here to Teleport the map.",
            Callback = function()
                setclipboard(game.JobId)
            end
        })
        local InputJobID = Tools_Addon:AddInput("InputJobID", {
            Title = "JobID",
            Default = "",
            Numeric = false, -- Only allows numbers
            Finished = true, -- Only calls callback when you press enter
            Callback = function(Value)
                JobIdInput = Value 
            end
        })
        Tools_Addon:AddButton({
            Title = "Copy JobID",
            Description = "Click here to Join JobID",
            Callback = function()
                sgame:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, JobIdInput)
            end
        })
        Tools_Addon:AddButton({
            Title = "Close UI",
            -- Description = "Click here to Join JobID",
            Callback = function()
                Fluent:Destroy()
            end
        })
    end


    SaveManager:SetLibrary(Fluent)
    InterfaceManager:SetLibrary(Fluent)

    SaveManager:IgnoreThemeSettings()

    SaveManager:SetIgnoreIndexes({})

    InterfaceManager:SetFolder("DENGHUB2024")
    SaveManager:SetFolder("DENGHUB2024/Fisch")

    InterfaceManager:BuildInterfaceSection(Tabs.Settings)
    SaveManager:BuildConfigSection(Tabs.Settings)


    Window:SelectTab(1)

    
    --AnitiAFK
    local vu = game:GetService("VirtualUser")
    local ViSendMouseButtonEvent = game:service'VirtualInputManager'
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
    coroutine.resume(coroutine.create(function()
        while task.wait() do
            pcall(function() 
                ViSendMouseButtonEvent:SendMouseButtonEvent(795, 595, 0, true, game, 1)
                task.wait(1)
                ViSendMouseButtonEvent:SendMouseButtonEvent(795, 595, 0, false, game, 1)
                task.wait(1000)
            end)
        end
    end))
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        local Vector = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2  - (game:GetService("GuiService"):GetGuiInset().Y/2))
        vu:Button1Down(Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2  - (game:GetService("GuiService"):GetGuiInset().Y/2)))
    end)
    game.Players.LocalPlayer.AttributeChanged:Connect(function(n)
        if n == "Idle" then
            game.Players.LocalPlayer:SetAttribute("Idle", false)
        end
    end)
    --AnitiAFK
    Fluent:Notify({
        Title = "DENG HUB by Adam",
        Content = "The script has been loaded.",
        Duration = 5
    })
    -- You can use the SaveManager:LoadAutoloadConfig() to load a config
    -- which has been marked to be one that auto loads!
    SaveManager:LoadAutoloadConfig()
end
