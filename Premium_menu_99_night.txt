local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "By Robanik [99 night in the forest]",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "99 night in the forest",
   LoadingSubtitle = "by robanik",
   ShowText = "Open/close", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "RRFold", -- Create a custom folder for your hub/game
      FileName = "RRcheat"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "https://discord.gg/JjEjpxwd", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "99 NIGHT IN THE FOREST",
      Subtitle = "KEY?",
      Note = "key in discord", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"RR"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("player", "rewind")
local Section = Tab:CreateSection("player")

local Button = Tab:CreateButton({
   Name = "god mode (beta)",
   Callback = function()
   local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Удаляем Humanoid, чтобы не умирать
character:FindFirstChildOfClass("Humanoid"):Destroy()

-- Создаем новый Humanoid, но не привязанный к урону
local fakeHumanoid = Instance.new("Humanoid")
fakeHumanoid.Parent = character
   end,
})

local Button = Tab:CreateButton({
   Name = "other god mode (beta)",
   Callback = function()
   local player = game.Players.LocalPlayer
local humanoid = player.Character:WaitForChild("Humanoid")

humanoid.HealthChanged:Connect(function()
    if humanoid.Health < humanoid.MaxHealth then
        humanoid.Health = humanoid.MaxHealth
    end
end)
   end,
})

local Button = Tab:CreateButton({
   Name = "teleport to player",
   Callback = function()
   --[[
🔧 Убедись, что это LocalScript
Размещать можно в StarterPlayerScripts или StarterGui
]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Создание GUI
local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
screenGui.Name = "TPMenu"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0

-- Выбранный игрок
local selectedPlayer = nil

-- Список игроков
local uiList = Instance.new("UIListLayout", frame)
uiList.SortOrder = Enum.SortOrder.LayoutOrder

-- Заголовок
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "Выбери игрока:"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20

-- Кнопки игроков
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        local btn = Instance.new("TextButton", frame)
        btn.Size = UDim2.new(1, 0, 0, 30)
        btn.Text = player.Name
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Font = Enum.Font.SourceSans
        btn.TextSize = 18

        btn.MouseButton1Click:Connect(function()
            selectedPlayer = player
            -- Подсветка выбора
            for _, otherBtn in pairs(frame:GetChildren()) do
                if otherBtn:IsA("TextButton") then
                    otherBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                end
            end
            btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        end)
    end
end

-- Кнопка "ТП"
local tpButton = Instance.new("TextButton", frame)
tpButton.Size = UDim2.new(1, 0, 0, 30)
tpButton.Text = "Телепортироваться"
tpButton.BackgroundColor3 = Color3.fromRGB(70, 120, 70)
tpButton.TextColor3 = Color3.new(1, 1, 1)
tpButton.Font = Enum.Font.SourceSansBold
tpButton.TextSize = 18

tpButton.MouseButton1Click:Connect(function()
    if selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = selectedPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(2, 0, 0)
        end
    end
    screenGui:Destroy() -- Удалить меню после ТП
end)
   end,
})

local Tab = Window:CreateTab("kill animals", "rewind")
local Section = Tab:CreateSection("kill animals")

local Button = Tab:CreateButton({
   Name = "kill rabbits",
   Callback = function()
   for _, character in pairs(game:GetService("Workspace").Characters:GetChildren()) do
    if character.Name == "Bunny" then
        -- Проверка на наличие Humanoid
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0
        else
            -- Если Humanoid нет, просто удалить объект
            character:Destroy()
        end
    end
end
   end,
})

local Button = Tab:CreateButton({
   Name = "kill wolfs",
   Callback = function()
   -- The function that takes place when the button is pressed
   end,
})

local Tab = Window:CreateTab("hitbox", "rewind")
local Section = Tab:CreateSection("hitbox")

local Button = Tab:CreateButton({
   Name = "hitbox",
   Callback = function()
   local characters = game:GetService("Workspace"):FindFirstChild("Characters")

if characters then
    for _, character in ipairs(characters:GetChildren()) do
        if character.Name == "Bunny" then
            local body = character:FindFirstChild("Body")
            if body and body:IsA("BasePart") then
                body.Size = body.Size * 10
                body.CanCollide = true
            end
        elseif character.Name == "Wolf" then
            local head = character:FindFirstChild("Head")
            if head and head:IsA("BasePart") then
                head.Size = head.Size * 10
                head.CanCollide = true
            end
        end
    end
end
   end,
})

local Tab = Window:CreateTab("esp", "rewind")
local Section = Tab:CreateSection("esp")

local Button = Tab:CreateButton({
   Name = "esp players",
   Callback = function()
   local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Настройки ESP
local settings = {
    BoxColor = Color3.fromRGB(0, 255, 140),
    NameColor = Color3.fromRGB(255, 255, 255),
    TracerColor = Color3.fromRGB(255, 0, 85),
    Font = 2, -- 0=UI, 1=System, 2=Plex
    Thickness = 2,
    Transparency = 1,
    TeamCheck = true,
    Enabled = true
}

-- Хранилище ESP-объектов
local ESPObjects = {}

-- Функция создания ESP
function CreateESP(player)
    local box = Drawing.new("Square")
    box.Thickness = 1.5
    box.Color = settings.BoxColor
    box.Transparency = settings.Transparency
    box.Filled = false

    local name = Drawing.new("Text")
    name.Color = settings.NameColor
    name.Size = 16
    name.Center = true
    name.Outline = true
    name.Font = settings.Font
    name.Transparency = settings.Transparency

    local tracer = Drawing.new("Line")
    tracer.Color = settings.TracerColor
    tracer.Thickness = settings.Thickness
    tracer.Transparency = settings.Transparency

    ESPObjects[player] = {box = box, name = name, tracer = tracer}
end

-- Удаление ESP при выходе
function RemoveESP(player)
    if ESPObjects[player] then
        for _, obj in pairs(ESPObjects[player]) do
            obj:Remove()
        end
        ESPObjects[player] = nil
    end
end

-- Обновление ESP каждый кадр
RunService.RenderStepped:Connect(function()
    if not settings.Enabled then return end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") then
            if not ESPObjects[player] then
                CreateESP(player)
            end

            local hrp = player.Character.HumanoidRootPart
            local humanoid = player.Character.Humanoid
            local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)

            local sizeY = math.clamp(3000 / (hrp.Position - Camera.CFrame.Position).Magnitude, 2, 300)
            local sizeX = sizeY / 1.8
            local topLeft = Vector2.new(screenPos.X - sizeX / 2, screenPos.Y - sizeY / 2)

            local objects = ESPObjects[player]
            if onScreen and humanoid.Health > 0 then
                -- Box
                objects.box.Size = Vector2.new(sizeX, sizeY)
                objects.box.Position = topLeft
                objects.box.Visible = true

                -- Name
                objects.name.Position = Vector2.new(screenPos.X, topLeft.Y - 16)
                objects.name.Text = player.Name
                objects.name.Visible = true

                -- Tracer (из центра экрана)
                objects.tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                objects.tracer.To = Vector2.new(screenPos.X, screenPos.Y + sizeY / 2)
                objects.tracer.Visible = true
            else
                for _, obj in pairs(objects) do
                    obj.Visible = false
                end
            end
        elseif ESPObjects[player] then
            for _, obj in pairs(ESPObjects[player]) do
                obj.Visible = false
            end
        end
    end
end)

-- Обработка входа/выхода игроков
Players.PlayerRemoving:Connect(RemoveESP)
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(1)
        CreateESP(player)
    end)
end)

-- Инициализация
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        CreateESP(player)
    end
end
   end,
})

local Button = Tab:CreateButton({
   Name = "esp rabbits",
   Callback = function()
   local characters = game:GetService("Workspace"):WaitForChild("Characters")

for _, character in pairs(characters:GetChildren()) do
    if character:FindFirstChild("Tail") then
        -- Добавляем Highlight
        local highlight = Instance.new("Highlight")
        highlight.Name = "RabbitHighlight"
        highlight.Adornee = character
        highlight.FillColor = Color3.fromRGB(0, 255, 0) -- зеленый цвет
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.FillTransparency = 0.2
        highlight.OutlineTransparency = 0
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Parent = character

        -- Добавляем BillboardGui с надписью "rabbit"
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "RabbitLabel"
        billboard.Adornee = character.Tail
        billboard.Size = UDim2.new(0, 100, 0, 40)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = "rabbit"
        textLabel.TextColor3 = Color3.new(1, 1, 1)
        textLabel.TextScaled = true
        textLabel.Parent = billboard

        billboard.Parent = character.Tail
    end
end
   end,
})

local Button = Tab:CreateButton({
   Name = "esp deer",
   Callback = function()
   local deer = game:GetService("Workspace"):WaitForChild("Characters"):WaitForChild("Deer")
local hrp = deer:WaitForChild("HRP")

-- Подсветка
local highlight = Instance.new("Highlight")
highlight.Name = "DeerHighlight"
highlight.Adornee = deer
highlight.FillColor = Color3.fromRGB(255, 0, 0) -- красный цвет
highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
highlight.FillTransparency = 0.2
highlight.OutlineTransparency = 0
highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop -- сквозь стены
highlight.Parent = deer

-- Надпись "deer" над HRP
local billboard = Instance.new("BillboardGui")
billboard.Name = "DeerLabel"
billboard.Adornee = hrp
billboard.Size = UDim2.new(0, 100, 0, 40)
billboard.StudsOffset = Vector3.new(0, 3, 0)
billboard.AlwaysOnTop = true

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "deer"
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.TextScaled = true
textLabel.Parent = billboard

billboard.Parent = hrp
   end,
})

local Button = Tab:CreateButton({
   Name = "esp wolf",
   Callback = function()
   local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local espFolder = Instance.new("Folder", Workspace)
espFolder.Name = "ESP_Labels"

-- Функция для создания BillboardGui над головой
local function createESP(head)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "WolfESP"
    billboard.Adornee = head
    billboard.Size = UDim2.new(0, 100, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true

    local label = Instance.new("TextLabel", billboard)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "wolf"
    label.TextColor3 = Color3.new(1, 0, 0)
    label.TextStrokeTransparency = 0
    label.TextScaled = true
    label.Font = Enum.Font.SourceSansBold

    billboard.Parent = espFolder
end

-- Проверка, есть ли уже ESP
local function hasESP(head)
    for _, gui in ipairs(espFolder:GetChildren()) do
        if gui:IsA("BillboardGui") and gui.Adornee == head then
            return true
        end
    end
    return false
end

-- Обновление ESP
local function updateESP()
    for _, char in pairs(Workspace.Characters:GetChildren()) do
        if char:FindFirstChild("Head") and char.Name == "Wolf" and not hasESP(char.Head) then
            createESP(char.Head)
        end
    end

    -- Удаление ESP, если волка больше нет
    for _, gui in ipairs(espFolder:GetChildren()) do
        if not gui.Adornee or not gui.Adornee:IsDescendantOf(Workspace.Characters) then
            gui:Destroy()
        end
    end
end

-- Обновление каждый кадр
RunService.RenderStepped:Connect(updateESP)
   end,
})

local Tab = Window:CreateTab("give items", "rewind")
local Section = Tab:CreateSection("item")

local Button = Tab:CreateButton({
   Name = "log",
   Callback = function()
   local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local targetPart = Workspace.Items.Log.Meshes.log_Cylinder

local function teleportToObjectAndBack()
    -- Сохраняем начальную позицию игрока
    local startPosition = humanoidRootPart.CFrame

    -- Телепортируем игрока к объекту (немного выше, чтобы не застрять)
    humanoidRootPart.CFrame = targetPart.CFrame * CFrame.new(0, 3, 0)
    wait(1)  -- Ждем секунду, чтобы "увидеть" телепорт

    -- Возвращаем игрока обратно
    humanoidRootPart.CFrame = startPosition
    wait(0.5)

    -- Перемещаем объект чуть вперед от игрока (например, 3 единицы вперед по направлению взгляда)
    local forwardVector = humanoidRootPart.CFrame.LookVector
    targetPart.CFrame = humanoidRootPart.CFrame * CFrame.new(forwardVector * 3)
end

teleportToObjectAndBack()
   end,
})

local Button = Tab:CreateButton({
   Name = "coal",
   Callback = function()
   local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local targetPart = Workspace.Items.Coal.Coal

local function teleportToCoalAndBack()
    -- Сохраняем начальную позицию игрока
    local startPosition = humanoidRootPart.CFrame

    -- Телепортируем игрока к объекту (чуть выше)
    humanoidRootPart.CFrame = targetPart.CFrame * CFrame.new(0, 3, 0)
    wait(1)

    -- Возвращаем игрока обратно
    humanoidRootPart.CFrame = startPosition
    wait(0.5)

    -- Перемещаем объект немного вперед от игрока (3 единицы вперед по направлению взгляда)
    local forwardVector = humanoidRootPart.CFrame.LookVector
    targetPart.CFrame = humanoidRootPart.CFrame * CFrame.new(forwardVector * 3)
end

teleportToCoalAndBack()
   end,
})

local Button = Tab:CreateButton({
   Name = "old radio",
   Callback = function()
   local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local targetPart = Workspace.Items["Old Radio"].Main

local function teleportToOldRadioAndBack()
    -- Сохраняем стартовую позицию игрока
    local startPosition = humanoidRootPart.CFrame

    -- Телепортируем к объекту (чуть выше)
    humanoidRootPart.CFrame = targetPart.CFrame * CFrame.new(0, 3, 0)
    wait(1)

    -- Возвращаемся обратно
    humanoidRootPart.CFrame = startPosition
    wait(0.5)

    -- Перемещаем объект чуть вперед от игрока (3 единицы вперед по направлению взгляда)
    local forwardVector = humanoidRootPart.CFrame.LookVector
    targetPart.CFrame = humanoidRootPart.CFrame * CFrame.new(forwardVector * 3)
end

teleportToOldRadioAndBack()
   end,
})

local Button = Tab:CreateButton({
   Name = "fuel canister",
   Callback = function()
   local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local targetPart = Workspace.Items["Fuel Canister"].Main

local function teleportToFuelCanisterAndBack()
    -- Сохраняем стартовую позицию игрока
    local startPosition = humanoidRootPart.CFrame

    -- Телепортируем к объекту (чуть выше)
    humanoidRootPart.CFrame = targetPart.CFrame * CFrame.new(0, 3, 0)
    wait(1)

    -- Возвращаемся обратно
    humanoidRootPart.CFrame = startPosition
    wait(0.5)

    -- Перемещаем объект чуть вперед от игрока (3 единицы вперед по направлению взгляда)
    local forwardVector = humanoidRootPart.CFrame.LookVector
    targetPart.CFrame = humanoidRootPart.CFrame * CFrame.new(forwardVector * 3)
end

teleportToFuelCanisterAndBack()
   end,
})

local Button = Tab:CreateButton({
   Name = "flashlight",
   Callback = function()
   local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local targetPart = Workspace.Items["Old Flashlight"].Main

local function teleportToOldFlashlightAndBack()
    -- Сохраняем стартовую позицию игрока
    local startPosition = humanoidRootPart.CFrame

    -- Телепортируем к объекту (чуть выше)
    humanoidRootPart.CFrame = targetPart.CFrame * CFrame.new(0, 3, 0)
    wait(1)

    -- Возвращаемся обратно
    humanoidRootPart.CFrame = startPosition
    wait(0.5)

    -- Перемещаем объект чуть вперед от игрока (3 единицы вперед по направлению взгляда)
    local forwardVector = humanoidRootPart.CFrame.LookVector
    targetPart.CFrame = humanoidRootPart.CFrame * CFrame.new(forwardVector * 3)
end

teleportToOldFlashlightAndBack()
   end,
})

local Tab = Window:CreateTab("teleport", "rewind")
local Section = Tab:CreateSection("tp")

local Button = Tab:CreateButton({
   Name = "tp spawn",
   Callback = function()
   local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local targetPart = game:GetService("Workspace").Map.Campground.MainFire["Meshes/logseat_Cylinder (1)"]

if targetPart and character:FindFirstChild("HumanoidRootPart") then
    character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, 5, 0)
end
   end,
})

local Button = Tab:CreateButton({
   Name = "tp to shop",
   Callback = function()
   local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local target = game:GetService("Workspace").Characters:FindFirstChild("Pelt Trader")

if target and target:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("HumanoidRootPart") then
    -- Телепортируем немного выше цели, чтобы не застрять
    character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
end
   end,
})

local Section = Tab:CreateSection("kill animals")

local Button = Tab:CreateButton({
   Name = "tp childs",
   Callback = function()
   local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "TPGui"
gui.ResetOnSpawn = false

local selectedName = nil

local buttonNames = {
	"Lost Child",
	"Lost Child2",
	"Lost Child3",
	"Lost Child4"
}

-- Функция отображения надписи
local function showMessage(text, duration)
	local label = Instance.new("TextLabel", gui)
	label.Size = UDim2.new(1, 0, 0.2, 0)
	label.Position = UDim2.new(0, 0, 0.4, 0)
	label.Text = text
	label.TextScaled = true
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.new(1, 0, 0)

	task.delay(duration, function()
		if gui then gui:Destroy() end
	end)
end

-- Функция телепорта
local function teleportTo(name)
	local character = player.Character or player.CharacterAdded:Wait()
	local root = character:WaitForChild("HumanoidRootPart")
	local chars = workspace:FindFirstChild("Characters")

	if chars and chars:FindFirstChild(name) and chars[name]:FindFirstChild("Torso") then
		root.CFrame = chars[name].Torso.CFrame + Vector3.new(0, 5, 0)
	else
		showMessage("Не найдено", 2)
		return
	end

	-- Успешный телепорт → закрыть GUI
	gui:Destroy()
end

-- Кнопки выбора
for i, name in ipairs(buttonNames) do
	local btn = Instance.new("TextButton", gui)
	btn.Size = UDim2.new(0.3, 0, 0.08, 0)
	btn.Position = UDim2.new(0.1, 0, 0.1 + (i - 1) * 0.1, 0)
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.TextScaled = true
	btn.BorderSizePixel = 0

	btn.MouseButton1Click:Connect(function()
		selectedName = name
		for _, child in pairs(gui:GetChildren()) do
			if child:IsA("TextButton") and child ~= btn then
				child.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
			end
		end
		btn.BackgroundColor3 = Color3.fromRGB(30, 130, 30)
	end)
end

-- Кнопка ТП
local tpBtn = Instance.new("TextButton", gui)
tpBtn.Size = UDim2.new(0.5, 0, 0.1, 0)
tpBtn.Position = UDim2.new(0.25, 0, 0.6, 0)
tpBtn.Text = "ТП"
tpBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
tpBtn.TextColor3 = Color3.new(1, 1, 1)
tpBtn.TextScaled = true
tpBtn.BorderSizePixel = 0

tpBtn.MouseButton1Click:Connect(function()
	if selectedName then
		teleportTo(selectedName)
	else
		showMessage("Цель не выбрана", 2)
	end
end)
   end,
})

local Tab = Window:CreateTab("information", "rewind")
local Section = Tab:CreateSection("pelt trader, deer")

local Button = Tab:CreateButton({
   Name = "pelt trader",
   Callback = function()
   local Players = game:GetService("Players")
local player = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

-- Функция для отображения текста
local function showMessage(text, duration)
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = text;
        Color = Color3.new(0, 0, 0); -- Черный цвет
        Font = Enum.Font.SourceSansBold;
        FontSize = Enum.FontSize.Size24;
    })
    
    task.wait(duration)

    -- Очистка сообщения (по желанию, так как системные сообщения нельзя удалить напрямую)
end

-- Отслеживание появления персонажа Pelt Trader
local function checkForPeltTrader()
    local characters = game:GetService("Workspace"):WaitForChild("Characters")

    characters.ChildAdded:Connect(function(child)
        if child.Name == "Pelt Trader" then
            local hrp = child:WaitForChild("HumanoidRootPart", 5)
            if hrp then
                showMessage("Pelt Trader пришел", 2)
            end
        end
    end)
end

checkForPeltTrader()
   end,
})

local Button = Tab:CreateButton({
   Name = "deer",
   Callback = function()
   local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function showCenterText(text, duration)
    local gui = Instance.new("ScreenGui", playerGui)
    gui.Name = "DeerMessage"

    local label = Instance.new("TextLabel", gui)
    label.Size = UDim2.new(1, 0, 0, 50)
    label.Position = UDim2.new(0, 0, 0.45, 0)
    label.Text = text
    label.TextColor3 = Color3.new(0, 0, 0)
    label.BackgroundTransparency = 1
    label.TextScaled = true
    label.Font = Enum.Font.SourceSansBold

    task.wait(duration)
    gui:Destroy()
end

local characters = game:GetService("Workspace"):WaitForChild("Characters")

characters.ChildAdded:Connect(function(child)
    if child.Name == "Deer" then
        local hrp = child:WaitForChild("HumanoidRootPart", 5)
        if hrp then
            showCenterText("Deer пришел", 2)
        end
    end
end)
   end,
})

local Tab = Window:CreateTab("credit", "rewind")
local Section = Tab:CreateSection("credits")

local Button = Tab:CreateButton({
   Name = "BY ROBANIK = GOGSLO2111",
   Callback = function()
   -- The function that takes place when the button is pressed
   end,
})

local Button = Tab:CreateButton({
   Name = "SOMBRITA GAMES = RANDOM_BEAST5",
   Callback = function()
   -- The function that takes place when the button is pressed
   end,
})
