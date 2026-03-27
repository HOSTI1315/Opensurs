local Client = game.Players.LocalPlayer
local Replicated = game:GetService("ReplicatedStorage")
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local PathfindingService = game:GetService("PathfindingService")
local UIS = game:GetService("UserInputService")
local Rod = game.workspace.PlayerStats[Client.Name].T[Client.Name].Stats.rod.Value
local TeleportSport = Workspace:FindFirstChild("world"):WaitForChild("spawns"):WaitForChild("TpSpots")

local FlyConnection = nil
local InputBeganConn = nil
local InputEndedConn = nil
local bv, bg

local function Equip(path)
    if Client.Backpack:FindFirstChild(tostring(path)) then
        local found = Client.Backpack:FindFirstChild(tostring(path))
        if found then
            Client.Character.Humanoid:EquipTool(found)
        end
    end
end

local function Unequip()
    Client.Character.Humanoid:UnequipTools()
end

local function walkTo(destination: Vector3, value: boolean)
    local character = Client.Character or Client.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local rootPart = character:WaitForChild("HumanoidRootPart")

    local path = PathfindingService:CreatePath({
        AgentCanJump = true,
        AgentJumpHeight = 2,
        AgentHeight = 6,
    })

    local success = pcall(function()
        path:ComputeAsync(rootPart.Position, destination)
    end)

    if success and path.Status == Enum.PathStatus.Success then
        if value then
            for _, wp in ipairs(path:GetWaypoints()) do
                if _G["StopWalking"] then return end
                if humanoid.Health <= 0 then break end

                local finished = false
                local conn
                conn = humanoid.MoveToFinished:Connect(function()
                    finished = true
                    if conn then conn:Disconnect() end
                end)

                humanoid:MoveTo(wp.Position)

                if wp.Action == Enum.PathWaypointAction.Jump then
                    Client.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end

                repeat task.wait() until finished or _G["StopWalking"]
                if _G["StopWalking"] then return end
            end
        end
    else
        warn("Pathfinding failed:", path.Status)
    end
end

if game.workspace.PlayerStats[Client.Name].T[Client.Name] then
    local rod = game.workspace.PlayerStats[Client.Name].T[Client.Name].Stats.rod
    if rod then
        Rod = rod.Value
        rod.Changed:Connect(function(newValue)
            Rod = newValue 
        end)
    end
end

local d = {}
local st = {}
for i,v in require(game:GetService("ReplicatedStorage").shared.modules.library.fish).Rarities do 
table.insert(d,v)
end
for i,v in require(game:GetService("ReplicatedStorage").shared.modules.library.fish) do 
st[i] = v
end

do 
	if Client.PlayerGui:FindFirstChild("Roblox/Fluent") then  Client.PlayerGui:FindFirstChild("Roblox/Fluent"):Destroy() end 
	if Client.PlayerGui:FindFirstChild("ScreenGuis") then  Client.PlayerGui.ScreenGuis:Destroy() end
end

do
	local GC = getconnections or get_signal_cons
	if GC then
		for i,v in ipairs(GC(Client.Idled)) do if v["Disable"] then v["Disable"](v) elseif v["Disconnect"] then v["Disconnect"](v) end end
	else
		Client.Idled:Connect(function() VirtualUser:CaptureController() VirtualUser:ClickButton2(Vector2.new()) end)
	end
end

local mainFolder = "Zepthic"
local path = mainFolder.."/Fisch"
local ConfigName = path.."/"..Client.Name.."-config.json"

local DefaultSettings = {}

local Settings = {}

do 
	if not isfolder(mainFolder) then
		makefolder(mainFolder)
	end

	if not isfolder(path) then
		makefolder(path)
	end

	if isfile(ConfigName) then
		local success, result = pcall(function()
			return HttpService:JSONDecode(readfile(ConfigName))
		end)

		if success and type(result) == "table" then
			Settings = result
		else
			Settings = DefaultSettings
		end
	else
		Settings = DefaultSettings
		writefile(ConfigName, HttpService:JSONEncode(Settings))
	end

	for key, value in ipairs(DefaultSettings) do
		if Settings[key] == nil then
			Settings[key] = value
		end
	end
end

function saveConfig()
	if not isfolder(path) then
		makefolder(path)
	end
	writefile(ConfigName, HttpService:JSONEncode(Settings))
end

local Threads = {}
local func = {}

function Threads.FastForEach(array, callback, yieldEvery)
	yieldEvery = yieldEvery or 10
	for i = 1, #array do
		callback(array[i], i)
		if i % yieldEvery == 0 then
			RunService.Heartbeat:Wait()
		end 
	end
end

func['ATF'] = (function()
    while _G.ATF do task.wait()
        pcall(function() 
            if not Client.Character:FindFirstChild(Rod) then 
                Equip(Rod)
            elseif not Client.PlayerGui:FindFirstChild("shakeui") and not Client.Character:FindFirstChild(Rod).values.casted.Value and Client.Character:FindFirstChild(Rod) then
                repeat task.wait()
                    Client.Character:FindFirstChild(Rod).events.cast:FireServer(100,1)
                until Client.PlayerGui:FindFirstChild("shakeui") or Client.Character:FindFirstChild(Rod).values.casted.Value == true or not _G.AutoFisching
                Client.Character:FindFirstChild(Rod).events.cast:FireServer(100,1)
                if Client.Character:FindFirstChild(Rod):FindFirstChild("bobber") then 
                    if Client.Character:FindFirstChild(Rod).bobber then
                        Client.Character:FindFirstChild(Rod).bobber.CFrame = Client.Character.HumanoidRootPart.CFrame*CFrame.new(0,-18,-3)
                    end
                end
            elseif Client.PlayerGui:FindFirstChild("shakeui") and Client.Character:FindFirstChild(Rod).values.casted.Value then
                local button = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("shakeui").safezone:FindFirstChild("button")
                if button:IsA("ImageButton") and button.Visible then 
                    Client.PlayerGui:FindFirstChild("shakeui").safezone:FindFirstChild("button").Size = UDim2.new(1001, 0, 1001, 0)
                    VirtualUser:Button1Down(Vector2.new(1, 1))
                    VirtualUser:Button1Up(Vector2.new(1, 1))
                end
            end
        end)
    end
end)


task.spawn(function()
    while task.wait() do 
        pcall(function()
            if _G.ATF then
                if _G.FarmingMode == "Normal" or _G.FarmingMode == nil then
                    if Client.Character:FindFirstChild(Rod).values.bite.Value == true then
                        Replicated.events["reelfinished "]:FireServer(100, true)
                    end
                elseif _G.FarmingMode == "Safe Mode" then
                    if Client.PlayerGui.reel then
                        Client.PlayerGui.reel.bar.playerbar.Size = UDim2.new(1, 0, 1, 0)
                    end
                end
                if _G.FarmingMode == "Fast" then
                    pcall(function()
                        if Client.Character:FindFirstChild(Rod):FindFirstChild("values") and Client.Character:FindFirstChild(Rod).values.bite.Value == true then 							
                            for _, track in ipairs(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                                if track.Animation.AnimationId == "rbxassetid://134146970600575"  then 
                                    task.wait(0.4)
                                    Replicated.events["reelfinished "]:FireServer(100,true)
                                    Client.PlayerGui:FindFirstChild("reel"):Destroy()
                                    _G.s = true 
                                end
                            end
                            if _G.s then 
                                task.wait(0.45)
                                Client.Character:FindFirstChild(Rod).events.reset:FireServer()
                                Unequip()
                                _G.s = false
                                _G.b = false
                            end
                        else
                            if not _G.b then 
                                for _, track in ipairs(Client.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                                    if track.Animation.AnimationId == "rbxassetid://113972107465696" or track.Animation.AnimationId == "rbxassetid://111444322239465"  then 
                                        task.wait(0.4)
                                        Client.Character.Humanoid:UnequipTools()
                                        _G.b = true
                                    end
                                end
                            end
                        end		
                    end)				
                end
            end
        end)
    end
end)

func['EFW'] = (function()
    Client.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, not _G.EFW)
end)


func['TSP']  = (function()
    while _G.TSP do task.wait()
        xpcall(function()
            if _G.ATF then
                if not _G.ENF then 
                    Client.Character.HumanoidRootPart.CFrame = _G.PositionFarm
                elseif _G.ENF then 
                    for i,v in ipairs(workspace.zones.fishing:GetChildren()) do 
                        if v.Name == _G.ZoneFarming then 
                            Client.Character.HumanoidRootPart.CFrame = v.CFrame
                        else 
                            Client.Character.HumanoidRootPart.CFrame = _G.PositionFarm
                        end  
                    end
                end
            end
        end,print)
    end
end)

func['DisableNotify'] = (function()
    Client.PlayerGui.hud.safezone.announcements.Visible = not _G.DisableNotify
end)

func['EnabledSelling'] = (function()
    while _G.EnabledSelling do task.wait()
        pcall(function()
            if _G.SellMethod == "Sell with Rarity" then
                for i,v in pairs(Client.Backpack:GetDescendants()) do 
                    if st[v.Name] and st[v.Name].Rarity == _G.Rarities and v:IsA("Tool") then
                        repeat task.wait()
                            Equip(v)
                            Replicated:WaitForChild("events"):WaitForChild("Sell"):InvokeServer()
                            wait(_G.delayfishsell)
                        until not _G.EnabledSelling
                    end
                end
            elseif _G.SellMethod == "Sell All" then
                Replicated:WaitForChild("events"):WaitForChild("SellAll"):InvokeServer()
                wait(_G.delayfishsell)
            end
        end)
    end
end)

func['TreasureMap'] = (function()
    while _G.TreasureMap do task.wait()
        pcall(function()
            if not Client.Character:FindFirstChild("Treasure Map") then
                repeat task.wait()
                    Equip("Treasure Map")
                until Client.Character:FindFirstChild("Treasure Map") or not _G.TreasureMap
            elseif Client.Character:FindFirstChild("Treasure Map") then
                repeat task.wait()
                    Client.Character.HumanoidRootPart.CFrame = CFrame.new(-2828.74292, 214.929657, 1520.1853,0.803240716, -2.94143767e-08, 0.595654547,2.3992726e-08, 1, 1.70273911e-08,-0.595654547, 6.14282569e-10, 0.803240716)
                    local args = {
                        {
                            voice = 4,
                            idle = workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Jack Marrow"):WaitForChild("description"):WaitForChild("idle"),
                            npc = workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Jack Marrow")
                        }
                    }
                    workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Jack Marrow"):WaitForChild("treasure"):WaitForChild("repairmap"):InvokeServer(unpack(args))

                            
                    for _, chest in pairs(workspace.world.chests:GetChildren()) do
                        if chest:IsA("Part") then
                            local attributes = chest:GetAttributes()
                            
                            for attributeName, attributeValue in pairs(attributes) do
                                if attributeName == "x" then
                                    x = attributeValue
                                elseif attributeName == "y" then
                                    y = attributeValue
                                elseif attributeName == "z" then
                                    z = attributeValue
                                end
                            end

                            local args = {
                                [1] = {
                                    ["y"] = y,
                                    ["x"] = x,
                                    ["z"] = z
                                }
                            }
                            
                            Replicated:WaitForChild("events"):WaitForChild("open_treasure"):FireServer(unpack(args))
                        end
                    end
                until not _G.TreasureMap or not Client.Backpack:FindFirstChild("Treasure Map") or not Client.Character:FindFirstChild("Treasure Map")
            end
        end)
    end
end)

func['ATR'] = (function()
    while _G.ATR do task.wait()
        pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("purchase"):FireServer("Trident Rod","Rod",1)
        end)
    end
end)
func['ADR'] = (function()
    while _G.ADR do task.wait()
        pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("purchase"):FireServer("Destiny Rod","Rod",1)
        end)
    end
end)
func['AAR'] = (function()
    while _G.AAR do task.wait()
        pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("purchase"):FireServer("Aurora Rod","Rod",1)
        end)
    end
end)
func['AKR'] = (function()  
    while _G.AKR do task.wait()
        pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("purchase"):FireServer("Kraken Rod","Rod",1)
        end)
    end
end)
func['APR'] = (function()
    while _G.APR do task.wait()
        pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("purchase"):FireServer("Poseidon Rod","Rod",1)
        end)
    end
end)
func['AutoCompleteSecondSea'] = (function()
    while _G.AutoCompleteSecondSea do task.wait()
        pcall(function()
            if workspace.PlayerStats[Client.Name].T[Client.Name].Stats.level.Value >= 251 and not workspace.PlayerStats[Client.Name].T[Client.Name].Stats:FindFirstChild("access_second_sea") then 
                if (CFrame.new(1536.48218, -1692.60022, 6309.69141, 0.998875737, 8.67497789e-08, 0.0474047363, -8.52820321e-08, 1, -3.29845555e-08, -0.0474047363, 2.89047009e-08, 0.998875737).Position - Client.Character.HumanoidRootPart.Position).Magnitude > 1000 then
                    Client.Character.HumanoidRootPart.CFrame = CFrame.new(1536.48218, -1692.60022, 6309.69141, 0.998875737, 8.67497789e-08, 0.0474047363, -8.52820321e-08, 1, -3.29845555e-08, -0.0474047363, 2.89047009e-08, 0.998875737)
                end
                if workspace.CryptOfTheGreenOne.IntroGate["1"].Door.CFrame ~= CFrame.new(1518.30371, -1670.94446, 6054.79883, 0, 0, 1, 0, 1, 0, -1, 0, 0) then
                    if not workspace:WaitForChild("CryptOfTheGreenOne"):WaitForChild("CthuluNPCs"):WaitForChild("Brother Silas"):WaitForChild("SilasesWarningDialog"):WaitForChild("opengate"):InvokeServer({voice = 2,idle = workspace:WaitForChild("CryptOfTheGreenOne"):WaitForChild("CthuluNPCs"):WaitForChild("Brother Silas"):WaitForChild("description"):WaitForChild("idle"),npc = workspace:WaitForChild("CryptOfTheGreenOne"):WaitForChild("CthuluNPCs"):WaitForChild("Brother Silas")}) then 
                        game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/AppraiseAnywhere/HaveValidFish"):InvokeServer()
                        workspace:WaitForChild("CryptOfTheGreenOne"):WaitForChild("CthuluNPCs"):WaitForChild("Brother Silas"):WaitForChild("SilasesWarningDialog"):WaitForChild("opengate"):InvokeServer()
                    end
                end
                if (CFrame.new(1536.69995, -1695.37805, 5896.61523, 1, 0, 0, 0, -1, 0, 0, 0, -1).Position - Client.Character.HumanoidRootPart.Position).Magnitude > 5 then
                    walkTo(Vector3.new(1536.69995, -1695.37805, 5896.61523, 1, 0, 0, 0, -1, 0, 0, 0, -1),_G.AutoCompleteSecondSea)
                end
            end
        end)
    end
end)

func['WhiteScreen'] = (function()
    if _G.WhiteScreen then 
		RunService:Set3dRenderingEnabled(false)
	else
		RunService:Set3dRenderingEnabled(true)
	end
end)

func['INFOXY'] = (function()
    Client.Character.Resources.oxygen.Enabled = not _G.INFOXY
end)

func['Fly'] = (function()
    if _G.Fly then
        local character = Client.Character or Client.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        if not hrp:FindFirstChild("Velocity") then
            bv = Instance.new("BodyVelocity")
            bv.Name = "Velocity"
            bv.MaxForce = Vector3.new(1, 1, 1) * math.huge
            bv.Velocity = Vector3.zero
            bv.P = 1250
            bv.Parent = hrp
        else
            bv = hrp:FindFirstChild("Velocity")
        end

        if not hrp:FindFirstChild("Gyro") then
            bg = Instance.new("BodyGyro")
            bg.Name = "Gyro"
            bg.MaxTorque = Vector3.new(1, 1, 1) * math.huge
            bg.P = 3000
            bg.CFrame = hrp.CFrame
            bg.Parent = hrp
        else
            bg = hrp:FindFirstChild("Gyro")
        end

        local control = {F = 0, B = 0, L = 0, R = 0, U = 0, D = 0}
        local speed = 100

        if InputBeganConn then InputBeganConn:Disconnect() end
        if InputEndedConn then InputEndedConn:Disconnect() end
        if FlyConnection then FlyConnection:Disconnect() end

        InputBeganConn = UIS.InputBegan:Connect(function(input, gpe)
            if gpe then return end
            local key = input.KeyCode
            if key == Enum.KeyCode.W then control.F = 1 end
            if key == Enum.KeyCode.S then control.B = 1 end
            if key == Enum.KeyCode.A then control.L = 1 end
            if key == Enum.KeyCode.D then control.R = 1 end
            if key == Enum.KeyCode.Space then control.U = 1 end
            if key == Enum.KeyCode.LeftControl then control.D = 1 end
        end)

        InputEndedConn = UIS.InputEnded:Connect(function(input)
            local key = input.KeyCode
            if key == Enum.KeyCode.W then control.F = 0 end
            if key == Enum.KeyCode.S then control.B = 0 end
            if key == Enum.KeyCode.A then control.L = 0 end
            if key == Enum.KeyCode.D then control.R = 0 end
            if key == Enum.KeyCode.Space then control.U = 0 end
            if key == Enum.KeyCode.LeftControl then control.D = 0 end
        end)

        FlyConnection = RunService.RenderStepped:Connect(function()
            if not _G.Fly then return end

            local cam = workspace.CurrentCamera
            local moveVec = cam.CFrame.LookVector * (control.F - control.B)
                        + cam.CFrame.RightVector * (control.R - control.L)
                        + Vector3.new(0, 0.1, 0) * (control.U - control.D)

            bv.Velocity = moveVec.Magnitude > 0 and moveVec.Unit * speed or Vector3.zero
            bg.CFrame = CFrame.new(hrp.Position, hrp.Position + cam.CFrame.LookVector)
        end)

    else
        if bv then bv:Destroy() bv = nil end
        if bg then bg:Destroy() bg = nil end
        if InputBeganConn then InputBeganConn:Disconnect() InputBeganConn = nil end
        if InputEndedConn then InputEndedConn:Disconnect() InputEndedConn = nil end
        if FlyConnection then FlyConnection:Disconnect() FlyConnection = nil end
    end
end)


local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/Yenixs/GUI/refs/heads/main/FLUENT"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

do 
	if Client.PlayerGui:FindFirstChild("Roblox/Fluent") then

		local ScreenGui = Instance.new("ScreenGui")
		local Frame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local ImageButton = Instance.new("ImageButton")

		ScreenGui.Name = "ScreenGuis"
		ScreenGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui

		Frame.Parent = ScreenGui
		Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BackgroundTransparency = 0.700
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0.474052399, 0, 0.046491228, 0)
		Frame.Size = UDim2.new(0.0340000018, 0, 0.0700000003, 0)

		UICorner.Parent = Frame

		ImageButton.Parent = Frame
		ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageButton.BackgroundTransparency = 1.000
		ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageButton.BorderSizePixel = 0
		ImageButton.Position = UDim2.new(-0.0250000004, 0, -0.027777778, 0)
		ImageButton.Size = UDim2.new(1.1, 0, 1.1, 0)
		ImageButton.Image = "rbxassetid://103816145608946"

		ImageButton.MouseButton1Click:Connect(function()
			game:GetService("Players").LocalPlayer.PlayerGui["Roblox/Fluent"]:GetChildren()[2].Visible = not game:GetService("Players").LocalPlayer.PlayerGui["Roblox/Fluent"]:GetChildren()[2].Visible
		end)
	end
end 

local Window = Fluent:CreateWindow({
	Title = "Zepthic",
	SubTitle = "Fisch",
	TabWidth = 160,
	Size = UDim2.fromOffset(490, 360),
	Acrylic = false,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.LeftControl 
})

local Tabs = {
	Lobby = Window:AddTab({ Title = "General", Icon = "globe" }),
    ItemAndQuest = Window:AddTab({ Title = "Item & Quest", Icon = "hammer" }),
    Miscellaneous = Window:AddTab({ Title = "Miscellaneous", Icon = "box" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

local function Dropdown(tab, title, values, default, callback)
	local dropdown = tab:AddDropdown(title, {
		Title = title,
		Values = values,
		Multi = false,
		Default = default
	})
	dropdown:OnChanged(callback, saveConfig)
	return dropdown
end
local function MultiDropdown(tab, title, values, default, callback)
	local dropdowns = tab:AddDropdown(title, {
		Title = title,
		Description = "",
		Values = values,
		Multi = true,
		Default = default or {}
	})
	dropdowns:OnChanged(callback, saveConfig)
	return dropdowns
end
local function Toggle(tab, title, settings)
	local toggle = tab:AddToggle(title, { Title = title, Default = Settings[settings] })
	toggle:OnChanged(function(value)
		Settings[settings] = value
		_G[settings] = Settings[settings]
		saveConfig()
		if func[settings] then
			task.spawn(func[settings])
		end
	end)	
	return toggle
end


do 
	Fluent:Notify({
		Title = "Zepthic Loading",
		Content = "Loading...",
		Duration = 5
	})
    Tabs.Lobby:AddSection('🎣 Faming')
    Toggle(Tabs.Lobby, "Auto Fishing", "ATF")
    Toggle(Tabs.Lobby, "Enabled Fishing in Water", "EFW")
    Toggle(Tabs.Lobby, "Enabled Teleport to Saved Position", "TSP")
    Toggle(Tabs.Lobby, "Enabled Fishing Zone", "ENF")
    Dropdown(Tabs.Lobby, "Zone Faming", {"Mosslurker","Whales Pool","Mushgrove Algae Pool","Golden Tide","Isonade","Whale Shark","Great Hammerhead Shark","Great White Shark","The Depths - Serpent","Megalodon Default","The Kraken Pool","Orcas Pool","Lovestorm Eel","Forsaken Veil - Scylla"}, Settings.ZoneFarming, function(value)
		Settings.ZoneFarming = value
		_G.ZoneFarming = value
	end)
    Tabs.Lobby:AddButton({
    Title = "Setup Position",
    Description = "",
    Callback = function()
        local cf = Client.Character.HumanoidRootPart.CFrame
        local components = {cf:GetComponents()}
        Settings.PositionFarm = components
        _G.PositionFarm = cf
        saveConfig()
    end})
    Tabs.Lobby:AddSection('⚙️ Settings')
    Dropdown(Tabs.Lobby, "Reel Method", {"Normal","Fast","Safe Mode"}, Settings.FarmingMode, function(value)
		Settings.FarmingMode = value
		_G.FarmingMode = value
	end)
    Toggle(Tabs.Lobby, "Disable Notify Gui", "DisableNotify")
    Tabs.Lobby:AddSection('💸 Selling')
    Dropdown(Tabs.Lobby, "Select Rarity", d, Settings.Rarities, function(value)
		Settings.Rarities = value
		_G.Rarities = value
	end)
    Dropdown(Tabs.Lobby, "Sell Method", {"Sell with Rarity","Sell All"}, Settings.SellMethod, function(value)
		Settings.SellMethod = value
		_G.SellMethod = value
	end)
    local WaitTime = Tabs.Lobby:AddSlider("Slider", {
		Title = "Delay Fish Sell",
		Description = "Delay to sell fish",
		Default = Settings.delayfishsell or 1,
		Min = 1,
		Max = 100,
		Rounding = 1,
		Callback = function(Value)
			Settings.delayfishsell = Value
            _G.delayfishsell = Value
		end
	})
    Toggle(Tabs.Lobby, "Enabled Sell", "EnabledSelling")
    Tabs.ItemAndQuest:AddSection('🗺️ Treasure Map (Full Option)')
    Toggle(Tabs.ItemAndQuest, "Auto Treasure Map", "TreasureMap")
    Tabs.ItemAndQuest:AddSection('🐟 Rod ')
    Toggle(Tabs.ItemAndQuest, "Auto Trident Rod", "ATR")
    Toggle(Tabs.ItemAndQuest, "Auto Destiny Rod", "ADR")
    Toggle(Tabs.ItemAndQuest, "Auto Aurora Rod", "AAR")
    Toggle(Tabs.ItemAndQuest, "Auto Kraken Rod", "AKR")
    Toggle(Tabs.ItemAndQuest, "Auto Poseidon Rod", "APR")
    Tabs.ItemAndQuest:AddSection('🌏 Second Sea')
    Toggle(Tabs.ItemAndQuest, "Auto Complete Second Sea","AutoCompleteSecondSea")
    Toggle(Tabs.Miscellaneous, "Enabled WhiteScreen","WhiteScreen")
    Toggle(Tabs.Miscellaneous, "Enabled Infinite Oxygen","INFOXY")
    Toggle(Tabs.Miscellaneous, "Enabled Fly","Fly")
end

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
	Title = "Zepthic Loaded Successfully",
	Content = "Fisch Comeplete",
	Duration = 5
})

SaveManager:LoadAutoloadConfig()
