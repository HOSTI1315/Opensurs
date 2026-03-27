-- LOAD WIND UI

local WindUI = loadstring(game:HttpGet(

    "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"

))()

-- WINDOW

local Window = WindUI:CreateWindow({

    Title = "MEOWL HUB",

    Icon = "cat",

    Author = "https://discord.gg/HZpuJanpyF",

    Folder = "MeowlHubScript",

    Size = UDim2.fromOffset(420, 360),

})

-- OPEN BUTTON

Window:EditOpenButton({

    Title = "Open Meowl's Hub",

    Icon = "star",

    CornerRadius = UDim.new(0, 6),

    StrokeThickness = 2,

    Color = ColorSequence.new(

        Color3.fromHex("8B4513"),

        Color3.fromHex("FFFFFF")

    ),

    OnlyMobile = false,

    Enabled = true,

    Draggable = true,

})

-- TAG

Window:Tag({

    Title = "v1.0",

    Color = Color3.fromHex("#30ff6a")

})

local ObjetiveSection = Window:Section({

    Title = "Objetive Features",

    Icon = "dices",

    Opened = false,

})

local ObjectiveTab = ObjetiveSection:Tab({

    Title = "Kaub",

    Icon = "castle",

})

local FortressTab = ObjetiveSection:Tab({

    Title = "Vardøhus Fortress",

    Icon = "map",

    Locked = false

})

local SanSebastianTab = ObjetiveSection:Tab({

  

    Title = "San Sebastian",

    Icon = "chess-rook",

  

})

local RoscoffTab = ObjetiveSection:Tab({

  

    Title = "Roscoff",

    Icon = "anchor",

  

})

local LondonTab = ObjetiveSection:Tab({

    Title = "London",

    Icon = "tower-control",

    Locked = false,

})

local MiscTab = Window:Tab({

    Title = "Misc",

    Icon = "settings",

  

    Locked = false,

})

local ESP_ENABLED = false

ObjectiveTab:Toggle({

    Title = "ESP SYSTEM",

    Desc = "Red highlight indicates where you need to shoot to break the bridge system. (use grenades/hand montar)",

    Default = false,

    Callback = function(Value)

        ESP_ENABLED = Value

        if not Value then

            -- remove highlight aqui

            for _,v in ipairs(workspace:GetDescendants()) do

                if v:IsA("Highlight") and v.Name == "RED_HL" then

                    v:Destroy()

                end

            end

        end

    end

})

-- LOOP

task.spawn(function()

    while true do

        if ESP_ENABLED then

            pcall(function()

                local obj = workspace.Kaub.Modes.Objective.Break.Intersection

                if obj and not obj:FindFirstChild("RED_HL") then

                    local hl = Instance.new("Highlight")

                    hl.Name = "RED_HL"

                    hl.FillColor = Color3.fromRGB(255,0,0)

                    hl.OutlineColor = Color3.fromRGB(150,0,0)

                    hl.FillTransparency = 0.25

                    hl.Parent = obj

                end

            end)

        end

        task.wait(0.1)

    end

end)

local AUTO_FIRE = false

ObjectiveTab:Toggle({

    Title = "AUTO FIRE",

    Desc = "Auto Shoot cannon (I DO NOT RECOMMEND USING IT, AS YOU HAVE TO AIM TO USE IT) ",

    Default = false,

    Callback = function(Value)

        AUTO_FIRE = Value

    end

})

task.spawn(function()

    while true do

        if AUTO_FIRE then

            pcall(function()

                workspace

                    :WaitForChild("Kaub")

                    :WaitForChild("Destructible")

                    :WaitForChild("12 Pound Gun")

                    :WaitForChild("CannonRemote")

                    :FireServer("Fire")

            end)

        end

        task.wait(0.1)

    end

end)

local AUTO_RELOAD = false

ObjectiveTab:Toggle({

    Title = "AUTO RELOAD",

    Desc = "The roundshot/swab automatically charges when you approach the cannon. ",

    Default = false,

    Callback = function(Value)

        AUTO_RELOAD = Value

    end

})

task.spawn(function()

    while true do

        if AUTO_RELOAD then

            pcall(function()

                workspace

                    :WaitForChild("Kaub")

                    :WaitForChild("Destructible")

                    :WaitForChild("12 Pound Gun")

                    :WaitForChild("Gun")

                    :WaitForChild("Hole")

                    :WaitForChild("Interact")

                    :FireServer()

            end)

        end

        task.wait(0.1)

    end

end)

local STRENGTH_ENABLED = false

ObjectiveTab:Toggle({

    Title = "AUTO PULL",

    Desc = "auto pulls the barricade with the goal of pulling the barricade at a higher speed. ",

    Default = false,

    Callback = function(Value)

        STRENGTH_ENABLED = Value

    end

})

task.spawn(function()

    while true do

        if STRENGTH_ENABLED then

            pcall(function()

                local char = game.Players.LocalPlayer.Character

                if char then

                    local ctrl = char:FindFirstChild("RopePullController", true)

                    if ctrl and ctrl:FindFirstChild("RemoteEvent") then

                        ctrl.RemoteEvent:FireServer("Strength")

                    end

                end

            end)

        end

        task.wait(0.1)

    end

end)

local ESP_SUPPLIES = false

local SuppliesHighlights = {}

local function clearSuppliesHL()

    for _,hl in ipairs(SuppliesHighlights) do

        if hl then hl:Destroy() end

    end

    SuppliesHighlights = {}

end

ObjectiveTab:Toggle({

    Title = "ESP SUPPLIES + ARMORMENTS",

    Desc = "Highlight in red all the supplements you need to pick up along the way.",

    Default = false,

    Callback = function(Value)

        ESP_SUPPLIES = Value

        if not Value then

            clearSuppliesHL()

        end

    end

})

task.spawn(function()

    while true do

        if ESP_SUPPLIES then

            pcall(function()

                local base = workspace.Kaub.Modes.Objective.Supplies.Hotel

                local function addHL(obj)

                    if obj and not obj:FindFirstChild("SUP_HL") then

                        local hl = Instance.new("Highlight")

                        hl.Name = "SUP_HL"

                        hl.FillColor = Color3.fromRGB(255,0,0)

                        hl.OutlineColor = Color3.fromRGB(150,0,0)

                        hl.FillTransparency = 0.3

                        hl.Parent = obj

                        table.insert(SuppliesHighlights, hl)

                    end

                end

                addHL(base.Firewood)

                addHL(base["Hotel Stuff"].Bedding)

                addHL(base["Hotel Stuff"].Bedding.Sheet)

                addHL(base.TheMeatStash)

                local armor = workspace:FindFirstChild("Armorments", true)

                if armor then

                    for _,v in ipairs(armor:GetDescendants()) do

                        if v:IsA("Model") or v:IsA("BasePart") then

                            addHL(v)

                        end

                    end

                end

            end)

        end

        task.wait(0.1)

    end

end)

local AUTO_PULL = false

SanSebastianTab:Toggle({

    Title = "AUTO PULL",

    Desc = "Automatically pulls the objective platform upwards using the barrel and hay mechanism.",

    Default = false,

    Callback = function(Value)

        AUTO_PULL = Value

    end

})

task.spawn(function()

    while true do

        if AUTO_PULL then

            pcall(function()

                workspace

                    :WaitForChild("San Sebastian")

                    :WaitForChild("Modes")

                    :WaitForChild("Objective")

                    :WaitForChild("CraneObj1")

                    :WaitForChild("Capstan")

                    :WaitForChild("RemoteEvent")

                    :FireServer("Push")

            end)

        end

        task.wait(0.1)

    end

end)

local AUTO_PULL_ANCHOR = false

RoscoffTab:Toggle({

    Title = "AUTO PULL ANCHOR",

    Desc = "Automatically pulls the anchor to break the objective door.",

    Default = false,

    Callback = function(Value)

        AUTO_PULL_ANCHOR = Value

    end

})

task.spawn(function()

    while true do

        if AUTO_PULL_ANCHOR then

            pcall(function()

                workspace

                    :WaitForChild("Roscoff")

                    :WaitForChild("Modes")

                    :WaitForChild("Objective")

                    :WaitForChild("AnchorEvent")

                    :WaitForChild("Anchor")

                    :WaitForChild("RemoteEvent")

                    :FireServer("Push", true)

            end)

        end

        task.wait(0.1)

    end

end)

local AUTO_PULL_WAGON = false

RoscoffTab:Toggle({

    Title = "AUTO PULL WAGON",

    Desc = "Automatically pulls the wagon to clear the path and progress the objective.",

    Default = false,

    Callback = function(Value)

        AUTO_PULL_WAGON = Value

    end

})

task.spawn(function()

    while true do

        if AUTO_PULL_WAGON then

            pcall(function()

                workspace

                    :WaitForChild("Roscoff")

                    :WaitForChild("Modes")

                    :WaitForChild("Objective")

                    :WaitForChild("WagonEvent")

                    :WaitForChild("Wagon")

                    :WaitForChild("RemoteEvent")

                    :FireServer("Push", true)

            end)

        end

        task.wait(0.1)

    end

end)

local AutoPullWood = false

LondonTab:Toggle({

    Title = "AUTO PULL WOOD",

    Desc = "Automatically pushes the wood forward without the need to walk",

    Default = false,

    Callback = function(Value)

        AutoPullWood = Value

    end

})

task.spawn(function()

    while true do

        if AutoPullWood then

            pcall(function()

                local args = { "Push", true }

                workspace:WaitForChild("London")

                    :WaitForChild("Modes")

                    :WaitForChild("Objective")

                    :WaitForChild("PushBlock")

                    :WaitForChild("RemoteEvent")

                    :FireServer(unpack(args))

            end)

        end

        task.wait(0.1)

    end

end)

local AutoPullGate = false

LondonTab:Toggle({

    Title = "AUTO PULL GATE",

    Desc = "Automatically pushes the city gate without the need to walk",

    Default = false,

    Callback = function(Value)

        AutoPullGate = Value

    end

})

task.spawn(function()

    while true do

        if AutoPullGate then

            pcall(function()

                local args = { "Push", true }

                workspace:WaitForChild("London")

                    :WaitForChild("Modes")

                    :WaitForChild("Objective")

                    :WaitForChild("Ludgate")

                    :WaitForChild("Left")

                    :WaitForChild("Hinge")

                    :WaitForChild("RemoteEvent")

                    :FireServer(unpack(args))

            end)

        end

        task.wait(0.1)

    end

end)

local ESPCrates = false

local CrateHighlights = {}

local function ClearCrateESP()

    for _, h in pairs(CrateHighlights) do

        if h then h:Destroy() end

    end

    table.clear(CrateHighlights)

end

LondonTab:Toggle({

    Title = "ESP CRATES",

    Desc = "Highlights all library crates in red",

    Default = false,

    Callback = function(Value)

        ESPCrates = Value

        if not Value then

            ClearCrateESP()

        end

    end

})

-- SERVICES

local Players = game:GetService("Players")

local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer

-- STATE

local ESP_ENABLED = false

local SELECTED_ZOMBIES = {}

-- SETTINGS

local MAX_DISTANCE = 150

-- DEFAULT COLORS

local ZombieColors = {

	Bomber = Color3.fromRGB(170, 0, 255),	Shambler = Color3.fromRGB(0, 100, 0),

	Runner = Color3.fromRGB(255, 0, 0),

	Sapper = Color3.fromRGB(0, 0, 139),

	Cuirasser = Color3.fromRGB(0, 255, 255),

	Igniter = Color3.fromRGB(255, 215, 0)

}

-- GET PLAYER STATUS

local function getCharacterData()

	local char = player.Character

	if not char then return nil end

	local humanoid = char:FindFirstChildOfClass("Humanoid")

	local root = char:FindFirstChild("HumanoidRootPart")

	if not humanoid or not root then return nil end

	if humanoid.Health <= 0 then return nil end

	return root.Position

end

-- DETECT ZOMBIE TYPE

local function getZombieType(model)

	for _, obj in ipairs(model:GetDescendants()) do

		local name = string.lower(obj.Name)

		if string.find(name, "barrel") then

			return "Bomber"

		elseif string.find(name, "ftorso") then

			return "Igniter"

		elseif name == "e" or string.find(name, "eye") then

			return "Runner"

		elseif string.find(name, "axe") then

			return "Sapper"

		elseif string.find(name, "armor") then

			return "Cuirasser"

		end

	end

	return "Shambler"

end

-- APPLY HIGHLIGHT

local function applyHighlight(model, zombieType)

	if model:FindFirstChild("ZombieHighlight") then return end

	local highlight = Instance.new("Highlight")

	highlight.Name = "ZombieHighlight"

	highlight.FillColor = ZombieColors[zombieType]

	highlight.OutlineColor = Color3.new(0, 0, 0)

	highlight.FillTransparency = 0.45 -- more transparent

	highlight.OutlineTransparency = 0

	highlight.Parent = model

end

-- REMOVE ALL HIGHLIGHTS

local function removeAll()

	for _, obj in ipairs(workspace:GetDescendants()) do

		if obj:IsA("Highlight") and obj.Name == "ZombieHighlight" then

			obj:Destroy()

		end

	end

end

-- MAIN ESP LOOP

task.spawn(function()

	while true do

		if ESP_ENABLED then

			local playerPos = getCharacterData()

			if not playerPos then

				removeAll()

			else

				for _, model in ipairs(workspace:GetDescendants()) do

					if model:IsA("Model") and string.find(string.lower(model.Name), "m_zombie") then

						local root = model:FindFirstChild("HumanoidRootPart")

						if root then

							local distance = (root.Position - playerPos).Magnitude

							if distance <= MAX_DISTANCE then

								local zType = getZombieType(model)

								if table.find(SELECTED_ZOMBIES, zType) then

									applyHighlight(model, zType)

								end

							end

						end

					end

				end

			end

		end

		task.wait(1)

	end

end)

-------------------------------------------------

-- UI

-------------------------------------------------

local Tab = Window:Tab({

	Title = "Visual",

	Icon = "eye",

	Locked = false,

})

-- TOGGLE ESP

Tab:Toggle({

	Title = "Zombie ESP",

	Desc = "Enable / Disable Zombie ESP",

	Value = false,

	Callback = function(state)

		ESP_ENABLED = state

		if not state then

			removeAll()

		end

	end

})

-- MULTI DROPDOWN

Tab:Dropdown({

	Title = "Zombies to Highlight",

	Desc = "Select zombie types",

	Values = {

		"Bomber",

		"Shambler",

		"Igniter",

		"Runner",

		"Sapper",

		"Cuirasser"

	},

	Value = { "Bomber" },

	Multi = true,

	AllowNone = true,

	Callback = function(option)

		SELECTED_ZOMBIES = option

	end

})

-- COLOR PICKERS

Tab:Colorpicker({

	Title = "Bomber Color",

	Default = ZombieColors.Bomber,

	Callback = function(color)

		ZombieColors.Bomber = color

	end

})

Tab:Colorpicker({

	Title = "Shambler Color",

	Default = ZombieColors.Shambler,

	Callback = function(color)

		ZombieColors.Shambler = color

	end

})

Tab:Colorpicker({

	Title = "Runner Color",

	Default = ZombieColors.Runner,

	Callback = function(color)

		ZombieColors.Runner = color

	end

})

Tab:Colorpicker({

	Title = "Sapper Color",

	Default = ZombieColors.Sapper,

	Callback = function(color)

		ZombieColors.Sapper = color

	end

})

Tab:Colorpicker({

	Title = "Cuirasser Color",

	Default = ZombieColors.Cuirasser,

	Callback = function(color)

		ZombieColors.Cuirasser = color

	end

})

Tab:Colorpicker({

	Title = "Igniter Color",

	Default = ZombieColors.Igniter,

	Callback = function(color)

		ZombieColors.Igniter = color

	end

})

task.spawn(function()

	while true do		if ESPCrates then

			pcall(function()

				ClearCrateESP()

				local folder = workspace:FindFirstChild("LibraryCrates")

				if not folder then return end

				for _, obj in ipairs(folder:GetDescendants()) do

					if obj:IsA("BasePart") then

						local h = Instance.new("Highlight")

						h.FillColor = Color3.fromRGB(255, 0, 0)

						h.OutlineColor = Color3.fromRGB(120, 0, 0)

						h.FillTransparency = 0.35

						h.Parent = obj

						table.insert(CrateHighlights, h)

					end

				end

			end)

		end

		task.wait(1)

	end

end)

----------------------------------------------------

local ESPRifle = false

local RiflePart

local function RemoveRifleESP()

	if RiflePart then

		RiflePart:Destroy()

		RiflePart = nil

	end

end

LondonTab:Toggle({

	Title = "ESP SNIPER RIFLE",

	Desc = "Creates a line showing where the sniper is aiming, making it easier to escape precise shots",

	Default = false,

	Callback = function(Value)

		ESPRifle = Value

		if not Value then

			RemoveRifleESP()

		end

	end

})

task.spawn(function()

	while true do

		if ESPRifle then

			pcall(function()

				local rifle = workspace:WaitForChild("London")

					:WaitForChild("Modes")

					:WaitForChild("Objective")

					:WaitForChild("SniperSection")

					:WaitForChild("Rifle")

					:WaitForChild("Rifle")

				if not RiflePart then

					RiflePart = Instance.new("Part")

					RiflePart.Anchored = true

					RiflePart.CanCollide = false

					RiflePart.Material = Enum.Material.Neon

					RiflePart.Color = Color3.fromRGB(255, 0, 0)

					RiflePart.Transparency = 0.6

					RiflePart.Size = Vector3.new(0.5, 0.5, 5000)

					RiflePart.Parent = workspace

				end

				local cf = rifle.CFrame

				RiflePart.CFrame = cf * CFrame.new(0, 0, -25)

			end)

		end

		task.wait(0.05)

	end

end)

MiscTab:Button({

    Title = "Copy Position",

    Desc = "Copies your current CFrame to clipboard",

    Callback = function()

        local player = game:GetService("Players").LocalPlayer

        local char = player.Character

        if not char then return end

        local hrp = char:FindFirstChild("HumanoidRootPart")

        if not hrp then return end

        local cf = hrp.CFrame

        local text = string.format(

            "CFrame.new(%f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f)",

            cf.X, cf.Y, cf.Z,

            cf.RightVector.X, cf.RightVector.Y, cf.RightVector.Z,

            cf.UpVector.X, cf.UpVector.Y, cf.UpVector.Z,

            cf.LookVector.X, cf.LookVector.Y, cf.LookVector.Z

        )

        setclipboard(text)

        print("[Misc] Position copied to clipboard!")

    end

})

-- SERVICES

local Players = game:GetService("Players")

local player = Players.LocalPlayer

-- CONFIG

local DELAY = 0.4

-- STATE

local enabled = false

local currentIndex = 1

local running = false

-- CFRAMES

local TPs = {

    CFrame.new(-119.216751,271.466431,-555.065125,0.959039,0,0.283275,0,1,0,0.283275,0,-0.959039),

    CFrame.new(-114.333916,262.200134,-552.046082,0.214688,0,0.976683,0,1,0,0.976683,0,-0.214688),

    CFrame.new(-67.942627,256.305084,-556.890686,0.214678,0,0.976685,0,1,0,0.976685,0,-0.214678),

    CFrame.new(-33.978920,243.499130,-558.754028,-0.991166,0,0.132624,0,1,0,0.132624,0,0.991166),

    CFrame.new(-33.492245,231.995819,-528.898438,-0.181977,0,-0.983303,0,1,0,-0.983303,0,0.181977),

    CFrame.new(-87.695808,231.995880,-528.925354,-0.216810,0,-0.976214,0,1,0,-0.976214,0,0.216810),

    CFrame.new(-108.716927,231.242783,-518.265808,-0.779870,0,-0.625941,0,1,0,-0.625941,0,0.779870),

    CFrame.new(-140.877548,228.542648,-488.826172,-0.601547,0,-0.798837,0,1,0,-0.798837,0,0.601547),

    CFrame.new(-171.122437,225.900635,-478.810394,-0.146869,0,-0.989156,0,1,0,-0.989156,0,0.146869),

    CFrame.new(-257.398346,218.353851,-478.382874,0.003785,0,-0.999993,0,1,0,-0.999993,0,-0.003785),

    CFrame.new(-340.976562,215.507843,-480.803497,0.206847,0,-0.978373,0,1,0,-0.978373,0,-0.206847),

    CFrame.new(-346.020630,215.776566,-491.400543,0.948631,0,-0.316383,0,1,0,-0.316383,0,-0.948631),

    CFrame.new(-346.425079,215.757965,-511.791626,0.918185,0,0.396151,0,1,0,0.396151,0,-0.918185),

    CFrame.new(-330.076935,214.507965,-515.803528,0.287804,0,0.957689,0,1,0,0.957689,0,-0.287804),

    CFrame.new(-327.669800,209.098801,-528.103516,0.985456,0,-0.169933,0,1,0,-0.169933,0,-0.985456),

    CFrame.new(-340.231110,201.507965,-529.762695,-0.386120,0,-0.922448,0,1,0,-0.922448,0,0.386120),

    CFrame.new(-350.652649,201.507965,-508.590729,-0.785410,0,-0.618976,0,1,0,-0.618976,0,0.785410),

    CFrame.new(-366.684967,199.507965,-492.483124,-0.739425,0,-0.673239,0,1,0,-0.673239,0,0.739425),

    CFrame.new(-386.270325,199.507965,-473.403137,-0.650100,0,-0.759849,0,1,0,-0.759849,0,0.650100),

    CFrame.new(-392.942322,201.345856,-465.518280,-0.927924,0,0.372771,0,1,0,0.372771,0,0.927924),

    CFrame.new(-379.920258,199.369247,-455.417603,-0.442789,0,-0.896626,0,1,0,-0.896626,0,0.442789),

    CFrame.new(-438.999634,186.333923,-413.776672,-0.528242,0,-0.849094,0,1,0,-0.849094,0,0.528242)

}

task.spawn(function()

    while true do

        if enabled and not running then

            running = true

            while enabled do

                local char = player.Character

                local hrp = char and char:FindFirstChild("HumanoidRootPart")

                if hrp then

                    hrp.CFrame = TPs[currentIndex]

                    currentIndex += 1

                    -- END → STOP

                    if currentIndex > #TPs then

                        enabled = false

                        break

                    end

                end

                task.wait(DELAY)

            end

            running = false

        end

        task.wait(0.1)

    end

end)

SanSebastianTab:Toggle({

    Title = "Auto TP down",

    Desc = "Automatically teleports you through the points until you reach the house-explosion part (you must be at the starting gate for it to work)",

    Default = false,

    Callback = function(state)

        enabled = state

        -- restart if finished

        if enabled and currentIndex > #TPs then

            currentIndex = 1

        end

    end

})

-- SERVICES

local Players = game:GetService("Players")

local player = Players.LocalPlayer

local Camera = workspace.CurrentCamera

local TextChatService = game:GetService("TextChatService")

--------------------------------------------------

-- CHAT FUNCTION

--------------------------------------------------

local function SendChat(msg)

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then		pcall(function()

			TextChatService.TextChannels.RBXGeneral:SendAsync(msg)

		end)

	else

		pcall(function()

			Players:Chat(msg)

		end)

	end

end

local PhrasesByLanguage = {

	French = {"VIVE L’EMPEREUR!","POUR LA GLOIRE DE LA FRANCE!","L’EMPIRE NE TOMBERA PAS!"},

	Russian = {"ЗА ОТЕЧЕСТВО И ЦАРЯ!","РОССИЯ НЕ ОТСТУПИТ!","ДА ЗДРАВСТВУЕТ ИМПЕРИЯ!"},

	Polish = {"ZA WOLNOŚĆ I HONOR!","NIECH ŻYJE CESARZ!","POLSKA NIE ZGINIE!"},

	Swedish = {"FÖR ÄRA OCH FOSTERLAND!","LEVE KONUNGEN!","SVERIGE SKA BESTÅ!"},

	Prussian = {"FÜR EHRE UND VATERLAND!","PREUSSEN GIBT NICHT NACH!","LANG LEBE DER KÖNIG!"},

	Danish = {"FOR KONGE OG FÆDRELAND!","DANMARK STÅR FAST!","ÆRE ELLER DØD!"},

	Bavarian = {"FÜR KAISER UND REICH!","EHRE UND TRADITION!","WIR HALTEN DIE LINIE!"},

	Default = {"LONG LIVE THE EMPIRE!","FOR HONOR AND GLORY!","WE STAND UNBROKEN!"},

    Portuguese = {"Por El-Rei e pela Pátria!","Portugal não se sujeita ao tirano corso!","Antes morrer livres que viver sob jugo estrangeiro!"}

}

local active = false

local highlight = nil

local function ActivateCharge()

	if active then return end

	active = true

	local char = player.Character or player.CharacterAdded:Wait()

	local hum = char:WaitForChild("Humanoid")

	local oldSpeed = hum.WalkSpeed

	local oldFOV = Camera.FieldOfView

	local lang = player:GetAttribute("Country") or "Default"

	local phraseList = PhrasesByLanguage[lang] or PhrasesByLanguage.Default

	local phrase = phraseList[math.random(#phraseList)]

	SendChat(phrase)

	hum.WalkSpeed = oldSpeed + 2

	Camera.FieldOfView = 80

	if highlight then highlight:Destroy() end

	highlight = Instance.new("Highlight")

	highlight.FillColor = Color3.fromRGB(255,255,0)

	highlight.OutlineColor = Color3.fromRGB(255,255,0)

	highlight.FillTransparency = 0

	highlight.OutlineTransparency = 0

	highlight.Adornee = char

	highlight.Parent = char

	local backpack = player:WaitForChild("Backpack")

	for _, item in ipairs(backpack:GetChildren()) do

		if item:IsA("Tool") and string.find(item.Name:lower(),"sabre") then

			hum:EquipTool(item)

			break

		end

	end

	task.delay(1, function()

		local anim = Instance.new("Animation")

		anim.AnimationId = "rbxassetid://17406602570"

		local track = hum:LoadAnimation(anim)

		track:Play()

		track:AdjustSpeed(1)

		task.delay(29, function()

			if track.IsPlaying then track:Stop() end

		end)

	end)

	spawn(function()

		local t = 0

		while t < 30 do

			task.wait(0.1)

			t = t + 0.1

			if highlight then

				highlight.FillTransparency = t/30

				highlight.OutlineTransparency = t/30

			end

		end

		if highlight then highlight:Destroy() end

	end)

	-- RESET BOOST

	task.delay(30, function()

		if hum then hum.WalkSpeed = oldSpeed end

		Camera.FieldOfView = oldFOV

		active = false

	end)

end

MiscTab:Button({

    Title = "CHAAAAAAARGE!",

    Desc = "Charge of temu, increases speed by 2, FOV 80, sabre animation",

    Callback = function()

        ActivateCharge()

    end

})

-- Keybind 1

MiscTab:Keybind({

    Title = "Charge but keybind",

    Desc = "Press B to activate CHAAAAAAARGE!",

    Value = "B",

    Callback = function(v)

        Window:SetToggleKey(Enum.KeyCode[v])

    end

})

---------------------------------------------------

-- SERVIÇOS

---------------------------------------------------

local Players = game:GetService("Players")

local player = Players.LocalPlayer

---------------------------------------------------

-- REFERÊNCIAS DO MAPA

---------------------------------------------------

local Fortress = workspace:WaitForChild("Vardohus Fortress")

local Supplies = Fortress:WaitForChild("Modes")

	:WaitForChild("Objective")	:WaitForChild("CannonSupplies")

local SwabsFolder = Supplies:WaitForChild("Swabs")

local RoundFolder = Supplies:WaitForChild("RoundShot")

---------------------------------------------------

-- FUNÇÃO TELEPORT

---------------------------------------------------

local function TeleportToChild(folder)

	if not folder then return end

	local char = player.Character or player.CharacterAdded:Wait()

	local hrp = char:WaitForChild("HumanoidRootPart")

	local child = folder:GetChildren()[1]

	if not child then return end

	if child:IsA("Model") then

		hrp.CFrame = child:GetPivot() * CFrame.new(0, 0, -3)

	elseif child:IsA("BasePart") then

		hrp.CFrame = child.CFrame * CFrame.new(0, 0, -3)

	end

end

---------------------------------------------------

-- ESP VERMELHO

---------------------------------------------------

local espEnabled = false

local espCache = {}

local function ApplyESP(folder)

	if not folder then return end

	for _, obj in ipairs(folder:GetDescendants()) do

		if obj:IsA("BasePart") and not espCache[obj] then

			local h = Instance.new("Highlight")

			h.FillColor = Color3.fromRGB(255, 0, 0)

			h.OutlineColor = Color3.fromRGB(255, 0, 0)

			h.FillTransparency = 0.5

			h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

			h.Adornee = obj

			h.Parent = obj

			espCache[obj] = h

		end

	end

end

local function RemoveESP()

	for _, h in pairs(espCache) do

		if h then h:Destroy() end

	end

	table.clear(espCache)

end

---------------------------------------------------

-- WIND UI (TAB JÁ EXISTENTE)

---------------------------------------------------

FortressTab:Button({

	Title = "TP SWAB",

	Desc = "Teleports you to a swab with a 90% chance of success and a 10% chance of failure.",

	Callback = function()

		TeleportToChild(SwabsFolder)

	end

})

FortressTab:Button({

	Title = "TP ROUNDSHOT",

	Desc = "Teleports you to the roundshot (only works if you are at a low position; if you are too high, it will not work).",

	Callback = function()

		TeleportToChild(RoundFolder)

	end

})

FortressTab:Toggle({

	Title = "ESP SUPPLIES",

	Desc = "Applies a red highlight to Swabs and Roundshots.",

	Default = false,

	Callback = function(state)

		espEnabled = state

		if state then

			ApplyESP(SwabsFolder)

			ApplyESP(RoundFolder)

		else

			RemoveESP()

		end

	end

})