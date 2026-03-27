local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Dandy's World Hub(By hex233222)",
   LoadingTitle = "By Hex233222 :) Try dandy bin hub too:)",
   LoadingSubtitle = "Thanks for using this hub :D",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "dandysworldexploits", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Dandy's World Key",
      Subtitle = "Key System",
      Note = "Ksy is Ilikemyself",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Ilikemyself"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})


Rayfield:Notify({
   Title = "¿Discord Server?",
   Content = "Hi, this is my hub thx for using it :D. If u want to join Dandy Bin Server(Pretty good discord server): https://discord.gg/dandysworldexploits/If u wanna join My discord Server: https://discord.gg/PPnuZMRe",
   Duration = 10.5,
   Image = 14594913232,
   Actions = { -- Notification Buttons

      Ignore = { -- Duplicate this table (or remove it) to add and remove buttons to the notification.
         Name = "Okay!",
         Callback = function()
            print("The user tapped Okay!")
         end
      },

},
})


local Tab = Window:CreateTab("Visuals", 11931408925) -- Title, Image
local Section = Tab:CreateSection("Visuals")
local Button = Tab:CreateButton({
   Name = "Esp Twisteds",
   Callback = function()
   local function highlightMonsters()
    local currentRoom = workspace:FindFirstChild("CurrentRoom")
    if currentRoom then
        for _, item in pairs(currentRoom:GetChildren()) do
            if item:IsA("Model") then
                local monstersFolder = item:FindFirstChild("Monsters")
                if monstersFolder then
                    for _, monster in pairs(monstersFolder:GetChildren()) do
                        if monster:IsA("Model") then
                            -- Verifica si ya tiene un Highlight para evitar duplicados
                            if not monster:FindFirstChildOfClass("Highlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Parent = monster
                                highlight.FillColor = Color3.new(1, 0, 0)  -- Rojo
                                highlight.OutlineColor = Color3.new(1, 1, 1)  -- Blanco
                                highlight.FillTransparency = 0.5
                            end
                        end
                    end
                end
            end
        end
    end
end

-- Ejecuta la función cada segundo
while true do
    highlightMonsters()
    wait(1)
end
   end,
})


local Button = Tab:CreateButton({
   Name = "Esp Items",
   Callback = function()
   local highlightOutlineColor = Color3.new(1, 1, 1)  -- Blanco
local highlightFillColor = Color3.new(0, 0, 1)     -- Azul

-- Función para agregar Highlight a un modelo
local function addHighlightToModel(model)
    -- Verifica si ya tiene un Highlight para evitar duplicados
    if not model:FindFirstChildOfClass("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.OutlineColor = highlightOutlineColor
        highlight.FillColor = highlightFillColor
        highlight.FillTransparency = 0.5 -- Transparencia del relleno (0 es completamente sólido)
        highlight.Parent = model
    end
end

-- Ejecuta el proceso cada segundo
while true do
    -- Busca la carpeta CurrentRoom en Workspace
    local currentRoom = game.Workspace:FindFirstChild("CurrentRoom")
    if currentRoom and currentRoom:IsA("Folder") then
        -- Recorre todos los objetos dentro de CurrentRoom
        for _, item in pairs(currentRoom:GetChildren()) do
            -- Verifica si el objeto es un modelo
            if item:IsA("Model") then
                -- Busca la carpeta Items dentro del modelo
                local itemsFolder = item:FindFirstChild("Items")
                if itemsFolder and itemsFolder:IsA("Folder") then
                    -- Recorre todos los modelos dentro de Items y les agrega un Highlight
                    for _, subItem in pairs(itemsFolder:GetChildren()) do
                        if subItem:IsA("Model") then
                            addHighlightToModel(subItem)
                        end
                    end
                end
            end
        end
    end
    -- Espera 1 segundo antes de repetir
    wait(1)
end
   end,
})

local Button = Tab:CreateButton({
   Name = "Esp Machines",
   Callback = function()
   local function highlightGenerators()
    local currentRoom = workspace:FindFirstChild("CurrentRoom")
    if currentRoom then
        for _, item in pairs(currentRoom:GetChildren()) do
            if item:IsA("Model") then
                local generatorsFolder = item:FindFirstChild("Generators")
                if generatorsFolder then
                    for _, generator in pairs(generatorsFolder:GetChildren()) do
                        if generator:IsA("Model") then
                            -- Verifica si ya tiene un Highlight para evitar duplicados
                            if not generator:FindFirstChildOfClass("Highlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Parent = generator
                                highlight.FillColor = Color3.new(0, 1, 0)
                                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                highlight.FillTransparency = 0.5
                            end
                        end
                    end
                end
            end
        end
    end
end

-- Ejecuta la función cada segundo
while true do
    highlightGenerators()
    wait(1)
end
   end,
})

local Button = Tab:CreateButton({
   Name = "Esp Players",
   Callback = function()
   local Players = game:GetService("Players")

-- Función para agregar o actualizar el Highlight en un personaje
local function addHighlight(character)
    -- Verifica si ya existe un Highlight en el personaje
    local highlight = character:FindFirstChildOfClass("Highlight")
    
    -- Si no existe, crea uno nuevo
    if not highlight then
        highlight = Instance.new("Highlight")
        highlight.Parent = character
    end

    -- Configura los colores del Highlight
    highlight.FillColor = Color3.fromRGB(0, 0, 255) -- Azul
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- Blanco
end

-- Función para aplicar el Highlight a todos los jugadores cada segundo
local function applyHighlights()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character then
            addHighlight(player.Character)
        end
    end
end

-- Ejecuta applyHighlights cada segundo
while true do
    applyHighlights()
    wait(1)
end
   end,
})

local Section = Tab:CreateSection("Better Visuals")

local Button = Tab:CreateButton({
   Name = "Client Sided Dandy(By Craze NOT MINE, Use Boxten)",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/LrGDCr7Z"))()
   end,
})









local Button = Tab:CreateButton({
   Name = "Remove Skill Check",
   Callback = function()
   local player = game:GetService("Players").LocalPlayer
local skillCheckFrame = player.PlayerGui.ScreenGui.Menu:FindFirstChild("SkillCheckFrame")

if skillCheckFrame then
    skillCheckFrame:Destroy()
end
   end,
})

local Button = Tab:CreateButton({
   Name = "Delete Dev Door(Lobby)",
   Callback = function()
   workspace.DevDoor:Destroy()
wait(1)
workspace.DevDoor2:Destroy()
   end,
})

local Button = Tab:CreateButton({
   Name = "Funny Twisteds",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/JhdK4Z3k"))();
   end,
})

local Button = Tab:CreateButton({
   Name = "Lobotomy (Not mine, by Slendy. VOLUME WARNING)",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Slendyvn/Dandy-script/refs/heads/main/E"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "See unused gui for 5 seconds",
   Callback = function()
   local player = game:GetService("Players").LocalPlayer
local selectionFrame2 = player.PlayerGui.ScreenGui:FindFirstChild("SelectionFrame2")

if selectionFrame2 then
    selectionFrame2.Visible = true -- Hacer que el frame sea visible

    wait(5) -- Esperar 5 segundos

    selectionFrame2.Visible = false -- Ocultar el frame
end
   end,
})


local Tab2 = Window:CreateTab("Main", 75857255600984) -- Title, Image
local Section = Tab2:CreateSection("GUI")

local Button = Tab2:CreateButton({
   Name = "Walkspeed",
   Callback = function()
   local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

-- Crear GUI principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Hex233222 Speed Changer"
screenGui.Parent = playerGui

-- Crear el Frame principal (la ventana arrastrable)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 250, 0, 150)
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -75) -- Centrado en la pantalla
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Blanco
mainFrame.BorderSizePixel = 2
mainFrame.Visible = true -- Inicialmente visible
mainFrame.Parent = screenGui

-- Crear un título para el GUI
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Hex233222 Speed Changer"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 18
titleLabel.TextColor3 = Color3.fromRGB(0, 0, 0) -- Texto negro
titleLabel.Parent = mainFrame

-- Crear el Slider para ajustar la distancia de teleportación
local slider = Instance.new("TextButton")
slider.Size = UDim2.new(1, 0, 0.2, 0)
slider.Position = UDim2.new(0, 0, 0.3, 0)
slider.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
slider.Text = "Adjust Teleport Distance"
slider.Font = Enum.Font.SourceSans
slider.TextSize = 18
slider.Parent = mainFrame

local currentDistanceLabel = Instance.new("TextLabel")
currentDistanceLabel.Size = UDim2.new(1, 0, 0.2, 0)
currentDistanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
currentDistanceLabel.BackgroundTransparency = 1
currentDistanceLabel.Text = "Teleport Distance: 1"
currentDistanceLabel.Font = Enum.Font.SourceSans
currentDistanceLabel.TextSize = 18
currentDistanceLabel.TextColor3 = Color3.fromRGB(0, 0, 0) -- Texto negro
currentDistanceLabel.Parent = mainFrame

-- Crear un botón para cerrar el GUI
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -25, 0, 5) -- Arriba a la derecha del Frame
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Text = "X"
closeButton.TextScaled = true
closeButton.Parent = mainFrame

-- Funcionalidad para cerrar el GUI
closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false -- Oculta el GUI al presionar el botón cerrar
end)

-- Variables para teleportar al jugador
local minDistance = 0.5
local maxDistance = 5
local teleportDistance = minDistance
local teleportSpeed = 0.01 -- Hacemos el tiempo entre teletransportes más rápido

-- Función para teletransportar al jugador cuando se mueve
local function teleportPlayer()
    local moveDirection = humanoid.MoveDirection
    if moveDirection.Magnitude > 0 then
        -- Calcular la nueva posición de teletransporte
        local newPosition = humanoidRootPart.Position + moveDirection.Unit * teleportDistance
        
        -- Girar al jugador en la dirección de movimiento
        local newCFrame = CFrame.new(newPosition, newPosition + moveDirection)
        humanoidRootPart.CFrame = newCFrame
    end
end

-- Ajustar la distancia de teletransporte con el slider
slider.MouseButton1Click:Connect(function()
    teleportDistance = teleportDistance + 0.5
    if teleportDistance > maxDistance then
        teleportDistance = minDistance
    end
    currentDistanceLabel.Text = "Teleport Distance: " .. teleportDistance
end)

-- Función que ejecuta la teletransportación constantemente
local function startTPWalk()
    while true do
        teleportPlayer()
        wait(teleportSpeed) -- Aumenta la velocidad de la teletransportación
    end
end

-- Iniciar el TPWalk en un bucle
spawn(startTPWalk)

-- Funcionalidad de arrastrar el GUI
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
   end,
})

local Button = Tab2:CreateButton({
   Name = "Inf stamima(Select toon movement stars)",
   Callback = function()
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Crear un marco deslizable (ScrollingFrame) con tamaño restaurado
local mainFrame = Instance.new("ScrollingFrame")
mainFrame.Size = UDim2.new(0.25, 0, 0.35, 0)  -- Tamaño ajustado al 25% del ancho y 35% del alto de la pantalla
mainFrame.Position = UDim2.new(0.375, 0, 0.375, 0)  -- Centra el marco en la pantalla
mainFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
mainFrame.Draggable = true
mainFrame.Active = true
mainFrame.ScrollBarThickness = 8
mainFrame.Parent = screenGui

-- Crear el marco superior con el texto "Select Character Speed"
local topFrame = Instance.new("Frame")
topFrame.Size = UDim2.new(1, 0, 0.3, 0)
topFrame.Position = UDim2.new(0, 0, 0, 0)
topFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
topFrame.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -20, 1, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "Select Character Speed"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.TextScaled = true
titleLabel.Parent = topFrame

-- Función para crear un botón de "correr" con alternancia de velocidad
local function createRunButton(speed)
    local runButton = Instance.new("TextButton")
    runButton.Size = UDim2.new(0.15, 0, 0.08, 0)
    runButton.Position = UDim2.new(0.85, 0, 0.85, 0)
    runButton.Text = "Run (" .. speed .. ")"
    runButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    runButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    runButton.TextScaled = true
    runButton.Parent = screenGui
    runButton.Draggable = true -- Hacer que el botón sea arrastrable

    local isRunning = false -- Variable para alternar entre correr y caminar
    local defaultSpeed = 16 -- Velocidad base del jugador

    -- Bucle para actualizar la velocidad cada 0.001 segundos mientras está en modo "correr"
    spawn(function()
        while true do
            if isRunning then
                local player = game.Players.LocalPlayer
                if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.WalkSpeed = speed
                end
            end
            wait(0.001) -- Esperar 0.001 segundos entre cada actualización
        end
    end)

    runButton.MouseButton1Click:Connect(function()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            if isRunning then
                -- Si está corriendo, volver a la velocidad normal
                player.Character.Humanoid.WalkSpeed = defaultSpeed
                isRunning = false
                runButton.Text = "Run (" .. speed .. ")" -- Texto cuando está detenido
            else
                -- Si está detenido, correr a la velocidad seleccionada
                isRunning = true
                runButton.Text = "Stop" -- Texto cuando está corriendo
            end
        end
    end)

    -- Agregar un botón para cerrar el botón de "Run"
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0.1, 0, 0.1, 0) -- Tamaño aumentado
    closeButton.Position = UDim2.new(0.9, 0, 0, 0) -- Ajustar posición para que esté en la esquina superior derecha
    closeButton.Text = "X"
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.TextScaled = true
    closeButton.Parent = runButton

    closeButton.MouseButton1Click:Connect(function()
        runButton:Destroy() -- Eliminar el botón de "Run"
    end)
end

-- Crear botón de velocidad y manejar el clic para cada velocidad
local function createSpeedButton(stars, speed, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.6, 0, 0.2, 0)
    button.Position = position
    button.Text = stars
    button.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    button.TextScaled = true
    button.Parent = mainFrame

    button.MouseButton1Click:Connect(function()
        screenGui:ClearAllChildren() -- Destruir la interfaz actual
        createRunButton(speed) -- Crear el botón de "correr" con la velocidad seleccionada
    end)
end

-- Crear botones de velocidad con diferentes opciones
createSpeedButton("⭐", 20, UDim2.new(0.2, 0, 0.2, 0))
createSpeedButton("⭐⭐", 22.5, UDim2.new(0.2, 0, 0.4, 0))
createSpeedButton("⭐⭐⭐", 25, UDim2.new(0.2, 0, 0.6, 0))
createSpeedButton("⭐⭐⭐⭐", 27.5, UDim2.new(0.2, 0, 0.8, 0))
createSpeedButton("⭐⭐⭐⭐⭐", 30, UDim2.new(0.2, 0, 1, 0)) -- Botón de 5 estrellas
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Crear un marco deslizable (ScrollingFrame) con tamaño restaurado
local mainFrame = Instance.new("ScrollingFrame")
mainFrame.Size = UDim2.new(0.25, 0, 0.35, 0)  -- Tamaño ajustado al 25% del ancho y 35% del alto de la pantalla
mainFrame.Position = UDim2.new(0.375, 0, 0.375, 0)  -- Centra el marco en la pantalla
mainFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
mainFrame.Draggable = true
mainFrame.Active = true
mainFrame.ScrollBarThickness = 8
mainFrame.Parent = screenGui

-- Crear el marco superior con el texto "Select Character Speed"
local topFrame = Instance.new("Frame")
topFrame.Size = UDim2.new(1, 0, 0.3, 0)
topFrame.Position = UDim2.new(0, 0, 0, 0)
topFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
topFrame.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -20, 1, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "Select Character Speed"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.TextScaled = true
titleLabel.Parent = topFrame

-- Función para crear un botón de "correr" con alternancia de velocidad
local function createRunButton(speed)
    local runButton = Instance.new("TextButton")
    runButton.Size = UDim2.new(0.15, 0, 0.08, 0)
    runButton.Position = UDim2.new(0.85, 0, 0.85, 0)
    runButton.Text = "Run (" .. speed .. ")"
    runButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    runButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    runButton.TextScaled = true
    runButton.Parent = screenGui
    runButton.Draggable = true -- Hacer que el botón sea arrastrable

    local isRunning = false -- Variable para alternar entre correr y caminar
    local defaultSpeed = 16 -- Velocidad base del jugador

    -- Bucle para actualizar la velocidad cada 0.001 segundos mientras está en modo "correr"
    spawn(function()
        while true do
            if isRunning then
                local player = game.Players.LocalPlayer
                if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.WalkSpeed = speed
                end
            end
            wait(0.001) -- Esperar 0.001 segundos entre cada actualización
        end
    end)

    runButton.MouseButton1Click:Connect(function()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            if isRunning then
                -- Si está corriendo, volver a la velocidad normal
                player.Character.Humanoid.WalkSpeed = defaultSpeed
                isRunning = false
                runButton.Text = "Run (" .. speed .. ")" -- Texto cuando está detenido
            else
                -- Si está detenido, correr a la velocidad seleccionada
                isRunning = true
                runButton.Text = "Stop" -- Texto cuando está corriendo
            end
        end
    end)

    -- Agregar un botón para cerrar el botón de "Run"
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0.1, 0, 0.1, 0) -- Tamaño aumentado
    closeButton.Position = UDim2.new(0.9, 0, 0, 0) -- Ajustar posición para que esté en la esquina superior derecha
    closeButton.Text = "X"
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.TextScaled = true
    closeButton.Parent = runButton

    closeButton.MouseButton1Click:Connect(function()
        runButton:Destroy() -- Eliminar el botón de "Run"
    end)
end

-- Crear botón de velocidad y manejar el clic para cada velocidad
local function createSpeedButton(stars, speed, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.6, 0, 0.2, 0)
    button.Position = position
    button.Text = stars
    button.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    button.TextScaled = true
    button.Parent = mainFrame

    button.MouseButton1Click:Connect(function()
        screenGui:ClearAllChildren() -- Destruir la interfaz actual
        createRunButton(speed) -- Crear el botón de "correr" con la velocidad seleccionada
    end)
end

-- Crear botones de velocidad con diferentes opciones
createSpeedButton("⭐", 20, UDim2.new(0.2, 0, 0.2, 0))
createSpeedButton("⭐⭐", 22.5, UDim2.new(0.2, 0, 0.4, 0))
createSpeedButton("⭐⭐⭐", 25, UDim2.new(0.2, 0, 0.6, 0))
createSpeedButton("⭐⭐⭐⭐", 27.5, UDim2.new(0.2, 0, 0.8, 0))
createSpeedButton("⭐⭐⭐⭐⭐", 30, UDim2.new(0.2, 0, 1, 0)) -- Botón de 5 estrellas
   end,
})


local Button = Tab2:CreateButton({
   Name = "Enable Jump (Be carefull)",
   Callback = function()
   local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Crear GUI principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Hex233222 Jump Enabler"
screenGui.Parent = playerGui

-- Crear el Frame principal (la ventana arrastrable)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 100)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -50) -- Centrado en la pantalla
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Blanco
mainFrame.BorderSizePixel = 2
mainFrame.Visible = true -- Inicialmente visible
mainFrame.Parent = screenGui

-- Crear un título para el GUI
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.3, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Hex233222 Jump Enabler"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 18
titleLabel.TextColor3 = Color3.fromRGB(0, 0, 0) -- Texto negro
titleLabel.Parent = mainFrame

-- Crear botón para habilitar el salto
local jumpButton = Instance.new("TextButton")
jumpButton.Size = UDim2.new(1, 0, 0.35, 0)
jumpButton.Position = UDim2.new(0, 0, 0.3, 0)
jumpButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
jumpButton.Text = "Enable Jump"
jumpButton.Font = Enum.Font.SourceSansBold
jumpButton.TextSize = 18
jumpButton.Parent = mainFrame

-- Crear botón para deshabilitar el salto
local disableJumpButton = Instance.new("TextButton")
disableJumpButton.Size = UDim2.new(1, 0, 0.35, 0)
disableJumpButton.Position = UDim2.new(0, 0, 0.65, 0)
disableJumpButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
disableJumpButton.Text = "Disable Jump"
disableJumpButton.Font = Enum.Font.SourceSansBold
disableJumpButton.TextSize = 18
disableJumpButton.Parent = mainFrame

-- Crear un botón para cerrar el GUI
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -25, 0, 5) -- Arriba a la derecha del Frame
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Text = "X"
closeButton.TextScaled = true
closeButton.Parent = mainFrame

-- Habilitar el salto
jumpButton.MouseButton1Click:Connect(function()
    humanoid.JumpPower = 16 -- Establecer una potencia de salto estándar
end)

-- Deshabilitar el salto
disableJumpButton.MouseButton1Click:Connect(function()
    humanoid.JumpPower = 0 -- Deshabilitar el salto
end)

-- Funcionalidad para cerrar el GUI
closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false -- Oculta el GUI al presionar el botón cerrar
end)

-- Crear un botón fuera del GUI para abrirlo nuevamente
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 100, 0, 50)
openButton.Position = UDim2.new(0.5, -50, 0.9, -25) -- Cerca de la parte inferior de la pantalla
openButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
openButton.Text = "Open GUI"
openButton.TextScaled = true
openButton.Parent = screenGui

-- Funcionalidad para abrir el GUI
openButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = true -- Muestra el GUI nuevamente
end)

-- Funcionalidad de arrastrar el GUI
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
   end,
})

local Button = Tab2:CreateButton({
   Name = "Autofarm (Use after floor 1. And use auto skill check",
   Callback = function()
   local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Hex233222 Control"
screenGui.Parent = playerGui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 250, 0, 180)
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -90)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Title Label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -40, 0.2, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 5)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Hex233222 Control"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 20
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Parent = mainFrame

-- Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, -20, 0.25, 0)
toggleButton.Position = UDim2.new(0, 10, 0.25, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0) -- Dark green
toggleButton.Text = "Activate"
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 18
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10)
buttonCorner.Parent = toggleButton

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.2, 0, 0.2, 0)
closeButton.Position = UDim2.new(0.8, 0, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0) -- Dark red
closeButton.Text = "X"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

-- Notification Label
local notificationLabel = Instance.new("TextLabel")
notificationLabel.Size = UDim2.new(1, -20, 0.4, 0)
notificationLabel.Position = UDim2.new(0, 10, 0.6, 0)
notificationLabel.BackgroundTransparency = 1
notificationLabel.Text = ""
notificationLabel.TextWrapped = true
notificationLabel.Font = Enum.Font.Gotham
notificationLabel.TextSize = 14
notificationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
notificationLabel.Parent = mainFrame

-- Script control variables
local scriptEnabled = false
local mainLoopCoroutine

-- Toggle function
local function toggleScript()
    if scriptEnabled then
        scriptEnabled = false
        toggleButton.Text = "Activate"
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0) -- Dark green
        if mainLoopCoroutine then
            coroutine.close(mainLoopCoroutine)
        end
    else
        scriptEnabled = true
        toggleButton.Text = "Deactivate"
        toggleButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0) -- Dark red

        -- Main loop coroutine
        mainLoopCoroutine = coroutine.create(function()
            local elevatorsFolder = game.Workspace:FindFirstChild("Elevators")
            local currentRoomFolder = game.Workspace:FindFirstChild("CurrentRoom")
            local character = player.Character or player.CharacterAdded:Wait()
            local isBeingChased = false
            local lastGeneratorUsed = nil

            local function teleportToDoorHitbox()
                if elevatorsFolder then
                    local elevatorModel = elevatorsFolder:FindFirstChild("Elevator")
                    if elevatorModel then
                        local doorHitbox = elevatorModel:FindFirstChild("DoorHitbox")
                        if doorHitbox then
                            character:SetPrimaryPartCFrame(doorHitbox.CFrame + Vector3.new(0, 50, 0))
                        end
                    end
                end
            end

            local function findBestGenerator()
                if not currentRoomFolder then return nil end
                local bestGenerator = nil
                local lowestAmount = math.huge

                for _, room in pairs(currentRoomFolder:GetChildren()) do
                    if room:IsA("Model") then
                        local generatorsFolder = room:FindFirstChild("Generators")
                        if generatorsFolder then
                            for _, generator in pairs(generatorsFolder:GetChildren()) do
                                if generator:IsA("Model") and generator ~= lastGeneratorUsed then
                                    local statsFolder = generator:FindFirstChild("Stats")
                                    if statsFolder then
                                        local currentAmount = statsFolder:FindFirstChild("CurrentAmount")
                                        if currentAmount and currentAmount:IsA("NumberValue") and currentAmount.Value < lowestAmount then
                                            bestGenerator = generator
                                            lowestAmount = currentAmount.Value
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                return bestGenerator
            end

            local function teleportToGenerator(generator)
                if generator then
                    local lightPart = generator:FindFirstChild("Light")
                    if lightPart and lightPart:IsA("BasePart") then
                        character:SetPrimaryPartCFrame(lightPart.CFrame)
                        wait(0.01)
                    end

                    local promptPart = generator:FindFirstChild("Prompt")
                    if promptPart and promptPart:IsA("BasePart") then
                        local proximityPrompt = promptPart:FindFirstChild("ProximityPrompt")
                        if proximityPrompt and proximityPrompt:IsA("ProximityPrompt") then
                            for i = 1, 3 do
                                fireproximityprompt(proximityPrompt)
                                wait(0.1)
                            end
                        end
                    end
                end
                lastGeneratorUsed = generator
                return true
            end

            local function monitorAllMonsters()
                for _, room in pairs(currentRoomFolder:GetChildren()) do
                    local monstersFolder = room:FindFirstChild("Monsters")
                    if monstersFolder then
                        local monsterNames = {}
                        for _, monster in pairs(monstersFolder:GetChildren()) do
                            table.insert(monsterNames, monster.Name)
                            local chaserScript = monster:FindFirstChild("Chaser")
                            if chaserScript then
                                local chasingValue = chaserScript:FindFirstChild("Chasing")
                                if chasingValue and chasingValue:IsA("BoolValue") then
                                    chasingValue.Changed:Connect(function(newValue)
                                        if newValue == true and not isBeingChased then
                                            isBeingChased = true
                                            while chasingValue.Value == true do
                                                teleportToDoorHitbox()
                                                wait(0.01)
                                            end
                                            wait(5)
                                            isBeingChased = false
                                        end
                                    end)
                                end
                            end
                        end
                        notificationLabel.Text = "Monsters detected: " .. table.concat(monsterNames, ", ")
                    else
                        notificationLabel.Text = ""
                    end
                end
            end

            local function mainLoop()
                while scriptEnabled do
                    if not isBeingChased then
                        monitorAllMonsters()

                        local bestGenerator = findBestGenerator()
                        if bestGenerator then
                            local success = teleportToGenerator(bestGenerator)
                            if success then
                                wait(0.05)
                            end
                        end
                    end
                    wait(0.05)
                end
            end

            mainLoop()
        end)

        coroutine.resume(mainLoopCoroutine)
    end
end

-- Close function
local function closeGui()
    screenGui:Destroy()
end

toggleButton.MouseButton1Click:Connect(toggleScript)
closeButton.MouseButton1Click:Connect(closeGui)

-- Drag functionality
local dragging, dragInput, dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
        
   end,
})

local Section3 = Tab2:CreateSection("Other Mains")


local Slider = Tab2:CreateSlider({
   Name = "JumpPower",
   Range = {0, 100},
   Increment = 10,
   Suffix = "JumpPower",
   CurrentValue = 0,
   Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(JumpPower)
   local player = game.Players.LocalPlayer -- Obtiene el jugador local
local character = player.Character or player.CharacterAdded:Wait() -- Asegura que el personaje esté disponible

-- Cambia el JumpPower
local newJumpPower = JumpPower -- Cambia este valor al que desees
character.Humanoid.JumpPower = newJumpPower

-- Opcional: Mensaje de confirmación
print("El JumpPower ha sido cambiado a " .. newJumpPower)
   end,
})

local Slider = Tab2:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 170},
   Increment = 10,
   Suffix = "Walkspeed",
   CurrentValue = 16,
   Flag = "Slider3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

while true do
    character.Humanoid.WalkSpeed = Value
    wait(0.001)
end
   end,
})


local Button = Tab2:CreateButton({
   Name = "No Vee Ad Pop Ups",
   Callback = function()
   local player = game:GetService("Players").LocalPlayer
local popUp = player.PlayerGui.ScreenGui:FindFirstChild("PopUp")

if popUp then
    popUp:Destroy()
end
   end,
})

local Button = Tab2:CreateButton({
   Name = "Delete InvisBorders",
   Callback = function()
      local currentRoom = game.Workspace:FindFirstChild("CurrentRoom")

if currentRoom then
    -- Busca un modelo dentro de "CurrentRoom"
    local model = currentRoom:FindFirstChildOfClass("Model")
    
    if model then
        -- Busca una carpeta llamada "FreeArea" dentro del modelo
        local freeArea = model:FindFirstChild("FreeArea")
        
        if freeArea then
            -- Recorre todos los objetos dentro de "FreeArea" para eliminar los que se llaman "InvisBorder"
            for _, child in ipairs(freeArea:GetChildren()) do
                if child:IsA("Part") and child.Name == "InvisBorder" then
                    child:Destroy()
                end
            end
        else
            warn("No se encontró la carpeta 'FreeArea' dentro del modelo.")
        end
    else
        warn("No se encontró un modelo dentro de 'CurrentRoom'.")
    end
else
    warn("No se encontró la carpeta 'CurrentRoom' en el Workspace.")
end
   end,
})


local Button = Tab2:CreateButton({
   Name = "Remove Fog",
   Callback = function()
   game.Lighting.FogEnd = math.huge  
game.Lighting.FogStart = math.huge  
game.Lighting.FogColor = Color3.new(1, 1, 1)  

print("Niebla removida exitosamente.")
   end,
})

local Button = Tab2:CreateButton({
   Name = "Auto Skill check 99% chance (Credits to: Luke_Scripter) ",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Dandy's-World-ALPHA-Dandy-s-Auto-Skill-Check-21849"))()
   end,
})


local Button = Tab2:CreateButton({
   Name = "FullBright",
   Callback = function()
   local player = game.Players.LocalPlayer
local lighting = game:GetService("Lighting")

-- Función para establecer la iluminación solo para el jugador
local function setPlayerLighting()
    lighting.Brightness = 3 -- Ajusta el brillo (puedes modificar este valor)
    lighting.Ambient = Color3.fromRGB(255, 255, 255) -- Luz interior clara
    lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255) -- Luz exterior clara
    lighting.FogEnd = 500 -- Extiende el alcance de la visibilidad (quita cualquier niebla)
    lighting.ClockTime = 12 -- Establece la hora del día al mediodía
end

-- Llama a la función para establecer la iluminación
setPlayerLighting()

-- Opcional: resetea la iluminación cuando el jugador salga
player.CharacterAdded:Connect(function()
    setPlayerLighting()
end)
   end,
})

local Button = Tab2:CreateButton({
   Name = "Auto use active ability",
   Callback = function()
   local function invokeAbilityEvent()
    local args = {
        [1] = game:GetService("Players").LocalPlayer.Character,
        [2] = CFrame.new(-65.78115844726562, 145.7693634033203, 86.53424072265625) * CFrame.Angles(4.4136689858476075e-09, 2.9576958503043716e-16, 5.338084818617972e-08),
        [3] = false
    }
    game:GetService("ReplicatedStorage").Events.AbilityEvent:InvokeServer(unpack(args))
end

-- Bucle para repetir la ejecución del evento cada 0.3 segundos
while true do
    invokeAbilityEvent() -- Ejecutar la función que invoca el evento
    wait(0.3) -- Esperar 0.3 segundos antes de repetir
end

   end,
})

local Button = Tab2:CreateButton({
   Name = "Auto Boost Yourself (Shelly Only)",
   Callback = function()
   local player = game.Players.LocalPlayer
local playerModel = workspace:FindFirstChild("InGamePlayers"):FindFirstChild(player.Name)

if playerModel then
    local currentRoom = workspace:FindFirstChild("CurrentRoom")
    
    if currentRoom then
        while true do
            for _, model in ipairs(currentRoom:GetChildren()) do
                local generatorsFolder = model:FindFirstChild("Generators")
                
                if generatorsFolder then
                    for _, generator in ipairs(generatorsFolder:GetChildren()) do
                        local statsFolder = generator:FindFirstChild("Stats")
                        
                        if statsFolder then
                            local activePlayer = statsFolder:FindFirstChild("ActivePlayer")
                            
                            if activePlayer and activePlayer.Value == playerModel then
                                -- Activar el script y hacer print
                                print("El ActivePlayer está activo para el jugador:", player.Name)
                                
                                local args = {
                                    [1] = player.Character,
                                    [2] = CFrame.new(-179.29843139648438, 146.2311248779297, -164.61495971679688) * CFrame.Angles(3.1415927410125732, 0.4017193913459778, -3.141592502593994),
                                    [3] = player.Character
                                }

                                game:GetService("ReplicatedStorage").Events.AbilityEvent:InvokeServer(unpack(args))
                            end
                        end
                    end
                end
            end
            wait(1)  -- Esperar 1 segundo antes de verificar nuevamente
        end
    end
end
   end,
})

local Button = Tab2:CreateButton({
   Name = "Heal Yourself (Sprout) ",
   Callback = function()
   local args = {
    [1] = game:GetService("Players").LocalPlayer.Character,
    [2] = CFrame.new(-179.29843139648438, 146.2311248779297, -164.61495971679688) * CFrame.Angles(3.1415927410125732, 0.4017193913459778, -3.141592502593994),
    [3] = game:GetService("Players").LocalPlayer.Character
}

game:GetService("ReplicatedStorage").Events.AbilityEvent:InvokeServer(unpack(args))
   end,
})

local Button = Tab2:CreateButton({
   Name = "Dandy character icon(by dandy bin server)",
   Callback = function()
   local args = {
    [1] = "Dandy"
}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Voted"):InvokeServer(unpack(args))
   end,
})
;
local Button = Tab2:CreateButton({
   Name = "Auto Gte(Use with autofarm)",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/A8j6QYfT"))();
   end,
})


local Section10 = Tab2:CreateSection("Performance Options")

local Button = Tab2:CreateButton({
   Name = "Anti Lag",
   Callback = function()
   local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Función para reducir el lag
local function reduceLag()
    -- Desactiva y elimina texturas y efectos visuales en el entorno de Workspace
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Decal") or part:IsA("Texture") or part:IsA("ParticleEmitter") then
            part:Destroy()  -- Elimina efectos visuales
        elseif part:IsA("MeshPart") then
            part.TextureID = ""  -- Elimina la textura de la MeshPart
            part.Material = Enum.Material.SmoothPlastic  -- Cambia el material para simplificar
            part.Reflectance = 0
        elseif part:IsA("BasePart") and part.Transparency < 1 then
            part.Material = Enum.Material.SmoothPlastic  -- Cambia materiales para mejorar rendimiento
            part.Reflectance = 0
        end
    end

    -- Desactiva efectos visuales de la herramienta o accesorios del jugador
    for _, accessory in pairs(character:GetChildren()) do
        if accessory:IsA("Accessory") then
            for _, descendant in pairs(accessory:GetDescendants()) do
                if descendant:IsA("ParticleEmitter") or descendant:IsA("Decal") or descendant:IsA("Texture") then
                    descendant:Destroy()
                end
            end
        end
    end

    -- Ajusta la iluminación del juego para reducir el consumo de recursos
    game.Lighting.GlobalShadows = false
    game.Lighting.Brightness = 1
    game.Lighting.OutdoorAmbient = Color3.new(1, 1, 1)

    -- Desactiva sonidos innecesarios
    for _, sound in pairs(workspace:GetDescendants()) do
        if sound:IsA("Sound") then
            sound:Stop()  -- Detiene sonidos, pero no los elimina
        end
    end

    -- Ajusta los efectos visuales de la interfaz de usuario
    for _, uiElement in pairs(player.PlayerGui:GetDescendants()) do
        if uiElement:IsA("ImageLabel") or uiElement:IsA("ImageButton") then
            uiElement.ImageTransparency = 1  -- Reduce la visibilidad de las imágenes en lugar de ocultarlas completamente
        end
    end
end

-- Ejecuta la función de reducción de lag
reduceLag()
   end,
})

local Button = Tab2:CreateButton({
   Name = "Show FPS",
   Callback = function()
   local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.Name = "FPSGui"

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Parent = screenGui
fpsLabel.Size = UDim2.new(0, 200, 0, 50)  -- Tamaño del texto
fpsLabel.Position = UDim2.new(0, 10, 0, 10)  -- Posición en la esquina superior izquierda
fpsLabel.BackgroundTransparency = 1  -- Fondo transparente
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Color blanco
fpsLabel.TextStrokeTransparency = 0.5  -- Borde de texto semitransparente
fpsLabel.TextSize = 24
fpsLabel.Font = Enum.Font.SourceSansBold

-- Crear un UIGradient para el efecto de color
local uiGradient = Instance.new("UIGradient")
uiGradient.Parent = fpsLabel

-- Variables para calcular FPS
local lastTime = tick()
local frameCount = 0

-- Actualizar los FPS cada segundo
game:GetService("RunService").RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local currentTime = tick()
    
    -- Si ha pasado un segundo, actualizar el texto de FPS
    if currentTime - lastTime >= 0.5 then
        local fps = frameCount
        fpsLabel.Text = "FPS: " .. tostring(fps)
        frameCount = 0
        lastTime = currentTime

        -- Cambiar el color del texto y el gradiente si los FPS son menores a 20
        if fps < 20 then
            local redValue = math.clamp(1 - (fps / 20), 0, 1) -- Calcular el valor rojo basado en los FPS
            fpsLabel.TextColor3 = Color3.fromRGB(255 * redValue, 0, 0) -- Cambiar el color del texto a rojo
            uiGradient.Color = ColorSequence.new(Color3.fromRGB(255 * redValue, 0, 0), Color3.fromRGB(255, 0, 0)) -- Aplicar el gradiente rojo
           uiGradient.Rotation = 90
        else
            fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Volver al color blanco
            uiGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255)) -- Gradiente transparente
        end
    end
end)
   end,
})

local Tab3 = Window:CreateTab("TP(Lobby)", 12941020168) -- Title, Image

local Section7 = Tab3:CreateSection("TP")

local Button = Tab3:CreateButton({
   Name = "TP To mastery room",
   Callback = function()
   local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Nombre del modelo a buscar
local modelName = "Bed"  -- Cambia esto si necesitas otro nombre
local targetMeshPartName = "JackInTheBox"  -- Nombre de la MeshPart a buscar

-- Buscar el modelo en Workspace
local bedModel = game.Workspace:FindFirstChild(modelName)

if bedModel and bedModel:IsA("Model") then
    -- Buscar la MeshPart dentro del modelo
    local jackInTheBox = bedModel:FindFirstChild(targetMeshPartName)

    if jackInTheBox and jackInTheBox:IsA("MeshPart") then
        -- Teletransportar al jugador a la MeshPart
        character:SetPrimaryPartCFrame(jackInTheBox.CFrame)
        print("Jugador teletransportado a JackInTheBox.")
    else
        warn("MeshPart 'JackInTheBox' no encontrada en el modelo 'Bed'.")
    end
else
    warn("Modelo 'Bed' no encontrado en Workspace.")
end
   end,
})

local Button = Tab3:CreateButton({
   Name = "TP To Skin summons",
   Callback = function()
   local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Definir el nombre de la carpeta a buscar
local folderName = "RevealRoom"  -- Cambia esto al nombre de la carpeta que buscas
local targetMeshPartName = "CurtainL"   -- Nombre de la MeshPart a buscar

-- Buscar la carpeta en Workspace
local folder = game.Workspace:FindFirstChild(folderName)

if folder then
    -- Buscar la MeshPart en la carpeta
    local curtainMeshPart = folder:FindFirstChild(targetMeshPartName)

    if curtainMeshPart and curtainMeshPart:IsA("MeshPart") then
        -- Teletransportar al jugador a la MeshPart
        character:SetPrimaryPartCFrame(curtainMeshPart.CFrame)
        print("Jugador teletransportado a CurtainL.")
    else
        warn("MeshPart 'CurtainL' no encontrada en la carpeta.")
    end
else
    warn("Carpeta '" .. folderName .. "' no encontrada en Workspace.")
end
   end,
})


local Button = Tab3:CreateButton({
   Name = "TP to players spawn",
   Callback = function()
   local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Verificar si existe la SpawnLocation en workspace
local spawnLocation = workspace:FindFirstChild("SpawnLocation")
if not spawnLocation then
    warn("No se encontró la SpawnLocation en Workspace.")
    return
end

-- Teletransportar al jugador a la posición de SpawnLocation
rootPart.CFrame = spawnLocation.CFrame + Vector3.new(0, 3, 0) -- Añade una pequeña altura para evitar colisiones
print("Jugador teletransportado a la SpawnLocation.")
   end,
})


local Tab4 = Window:CreateTab("Troll", 9943307858) -- Title, Image

local Section6 = Tab4:CreateSection("Trolls")

local Button = Tab4:CreateButton({
   Name = "Follow Player",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20follow%20player%20script'))()
   end,
})

local Slider = Tab4:CreateSlider({
   Name = "Spin🤑",
   Range = {0, 250},
   Increment = 10,
   Suffix = "Spin Speed",
   CurrentValue = 0,
   Flag = "Slider10", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(force)
power = force 

game:GetService('RunService').Stepped:connect(function()
    game.Players.LocalPlayer.Character.Head.CanCollide = true
    game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
    game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
    game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = true
end)
wait(.1)
local bambam = Instance.new("BodyThrust")
bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
bambam.Force = Vector3.new(power,0,power)
bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

   end,
})

local Button = Tab4:CreateButton({
   Name = "Player Bang(GUI)🤑",
   Callback = function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Obtener el jugador local y su personaje
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Crear GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 300)
frame.Position = UDim2.new(0.5, -150, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Parent = screenGui
frame.Draggable = true
frame.Active = true

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.2, 0, 0.15, 0)
closeButton.Position = UDim2.new(0.8, 0, 0, 0)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Parent = frame

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0.9, 0, 0.1, 0)
titleLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
titleLabel.Text = "Dandy's world player banger🤑"
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextScaled = true
titleLabel.Parent = frame

local instructionLabel = Instance.new("TextLabel")
instructionLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
instructionLabel.Position = UDim2.new(0.1, 0, 0.15, 0)
instructionLabel.Text = "Enter Player Name:"
instructionLabel.BackgroundTransparency = 1
instructionLabel.TextColor3 = Color3.new(1, 1, 1)
instructionLabel.Parent = frame

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.8, 0, 0.3, 0)
textBox.Position = UDim2.new(0.1, 0, 0.35, 0)
textBox.PlaceholderText = "Enter player name"
textBox.Text = ""
textBox.Parent = frame

local confirmButton = Instance.new("TextButton")
confirmButton.Size = UDim2.new(0.8, 0, 0.2, 0)
confirmButton.Position = UDim2.new(0.1, 0, 0.68, 0)
confirmButton.Text = "Confirm"
confirmButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
confirmButton.TextColor3 = Color3.new(1, 1, 1)
confirmButton.Parent = frame

local followingLabel = Instance.new("TextLabel")
followingLabel.Size = UDim2.new(0.8, 0, 0.15, 0)
followingLabel.Position = UDim2.new(0.1, 0, 0.85, 0)
followingLabel.BackgroundTransparency = 1
followingLabel.TextColor3 = Color3.new(1, 1, 1)
followingLabel.Text = "Currently following: None"
followingLabel.Parent = frame

local stopButton = Instance.new("TextButton")
stopButton.Size = UDim2.new(0.8, 0, 0.2, 0)
stopButton.Position = UDim2.new(0.1, 0, 0.75, 0)
stopButton.Text = "Stop Banging"
stopButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
stopButton.TextColor3 = Color3.new(1, 1, 1)
stopButton.Parent = frame

-- TextLabel para mensajes de error
local errorLabel = Instance.new("TextLabel")
errorLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
errorLabel.Position = UDim2.new(0.1, 0, 0.25, 0)
errorLabel.BackgroundTransparency = 1
errorLabel.TextColor3 = Color3.fromRGB(1, 0, 0)
errorLabel.Text = ""
errorLabel.Parent = frame

-- Variables de seguimiento
local targetPlayer = nil
local followSpeed = 50 -- Aumentar la velocidad de seguimiento
local animationId = "rbxassetid://17561277632"
local animation = Instance.new("Animation")
animation.AnimationId = animationId
local animationTrack

-- Función para buscar el primer jugador cuyo nombre comienza con el texto ingresado
local function autocompletePlayerName(input)
    for _, potentialTarget in ipairs(Players:GetPlayers()) do
        if potentialTarget.DisplayName:lower():sub(1, #input) == input:lower() then
            if potentialTarget.DisplayName ~= potentialTarget.Name then
                errorLabel.Text = "Wrong, maybe u wanted to try: " .. potentialTarget.Name
            end
            return potentialTarget
        elseif potentialTarget.Name:lower():sub(1, #input) == input:lower() then
            return potentialTarget
        end
    end
    return nil
end

-- Evento cuando se presiona el botón de confirmación
confirmButton.MouseButton1Click:Connect(function()
    local inputText = textBox.Text
    local playerMatch = autocompletePlayerName(inputText)

    if playerMatch then
        targetPlayer = playerMatch
        followingLabel.Text = "Currently following: " .. targetPlayer.Name
        errorLabel.Text = ""
        print("Following:", targetPlayer.Name)

        -- Reproducir la animación
        animationTrack = humanoid:LoadAnimation(animation)
        animationTrack:Play()
    else
        errorLabel.Text = "Invalid Username"
        print("Player not found.")
    end
end)

-- Evento cuando se presiona el botón de detener seguimiento
stopButton.MouseButton1Click:Connect(function()
    targetPlayer = nil
    followingLabel.Text = "Currently following: None"
    errorLabel.Text = ""
    print("Stopped following.")
    
    -- Detener la animación
    if animationTrack then
        animationTrack:Stop()
    end
end)

-- Función para seguir al objetivo
local function followTarget()
    if targetPlayer and targetPlayer.Character then
        local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if targetRoot then
            -- Calcular la posición detrás del objetivo
            local behindPosition = targetRoot.Position - (targetRoot.CFrame.LookVector * 3)

            -- Girar hacia el objetivo
            rootPart.CFrame = CFrame.new(rootPart.Position, targetRoot.Position)

            -- Moverse hacia la posición detrás del objetivo
            local distance = (behindPosition - rootPart.Position).magnitude
            if distance > 2 then
                local direction = (behindPosition - rootPart.Position).unit
                rootPart.Velocity = direction * followSpeed
            else
                rootPart.Velocity = Vector3.new(0, 0, 0)
            end
        end
    else
        rootPart.Velocity = Vector3.new(0, 0, 0)
    end
end

-- Actualizar la posición cada frame
RunService.Heartbeat:Connect(followTarget)
   end,
})

local Section9 = Tab4:CreateSection("Animations")


local Slider = Tab4:CreateSlider({
   Name = "Shrimpo Extract",
   Range = {0, 50},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 0,
   Flag = "Hi", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(SpeedValue)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Crea la animación
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://17561277632"  -- ID de la animación

-- Carga la animación
local animationTrack = humanoid:LoadAnimation(animation)

-- Función para reproducir o detener la animación según la velocidad
local function playAnimation(speed)
    if speed == 0 then
        animationTrack:Stop()  -- Detiene la animación si la velocidad es 0
    else
        if not animationTrack.IsPlaying then
            animationTrack:Play()
        end
        animationTrack:AdjustSpeed(speed)  -- Ajusta la velocidad de la animación
    end
end

-- Ejemplo de uso: puedes ajustar la velocidad como desees
local desiredSpeed = SpeedValue  -- Cambia este valor para ajustar la velocidad
playAnimation(desiredSpeed)
   end,
})

local Button = Tab4:CreateButton({
   Name = "Flutter Ability",
   Callback = function()
   local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Crea la animación
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://18226927388"  -- ID de la animación

-- Carga la animación
local animationTrack = humanoid:LoadAnimation(animation)

-- Función para reproducir la animación
local function playAnimation()
    animationTrack:Play()  -- Reproduce la animación
end

-- Llama a la función para reproducir la animación
playAnimation()
   end,
})

local Button = Tab4:CreateButton({
   Name = "Razzle & Dazzle Sit",
   Callback = function()
   local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Crea la animación
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://18989418012"  -- ID de la animación

-- Carga la animación
local animationTrack = humanoid:LoadAnimation(animation)

-- Función para reproducir la animación
local function playAnimation()
    animationTrack:Play()  -- Reproduce la animación
end

-- Llama a la función para reproducir la animación
playAnimation()
   end,
})

local Button = Tab4:CreateButton({
   Name = "Wave",
   Callback = function()
   local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Crea la animación
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://17059625743"  -- ID de la animación

-- Carga la animación
local animationTrack = humanoid:LoadAnimation(animation)

-- Función para reproducir la animación
local function playAnimation()
    animationTrack:Play()  -- Reproduce la animación
end

-- Llama a la función para reproducir la animación
playAnimation()
   end,
})


local Button = Tab4:CreateButton({
   Name = "Flutter Chase",
   Callback = function()
   local humanoid = character:WaitForChild("Humanoid")

-- Crear una nueva instancia de Animation
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://18239928544"

-- Cargar la animación en el Humanoid
local animationTrack = humanoid:LoadAnimation(animation)

-- Reproducir la animación
animationTrack:Play()
   end,
})

local Section = Tab4:CreateSection("Client Sideds Trolls")


local Button = Tab4:CreateButton({
   Name = "Admin Panel(Just for showing)",
   Callback = function()
   local devframe = game.ReplicatedStorage.Admin.DevFrame

devframe.Frame.Visible = true
devframe.Frame.Parent = game.Players.LocalPlayer.PlayerGui.MainGui
   end,
})

local Slider = Tab4:CreateSlider({
   Name = "Get Fake Ichor",
   Range = {0, 100000000},
   Increment = 10,
   Suffix = "Ichor",
   CurrentValue = 10,
   Flag = "Slider5", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   local player = game.Players.LocalPlayer.UserId

game.ReplicatedStorage.PlayerData:FindFirstChild(player).Coin.Value += (Value)
   end,
})

local Slider = Tab4:CreateSlider({
   Name = "Fake Highest Floor",
   Range = {0, 10000},
   Increment = 1,
   Suffix = "Floor",
   CurrentValue = 0,
   Flag = "Slider8", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Floor)
   local player = game.Players.LocalPlayer.UserId

game.ReplicatedStorage.PlayerData:FindFirstChild(player).HighestFloor.Value = Floor
   end,
})
local Button = Tab4:CreateButton({
   Name = "Fake get all toons(Reset after clicking)",
   Callback = function()
   local player = game.Players.LocalPlayer.UserId
local folder = game.ReplicatedStorage.PlayerData:FindFirstChild(player).Towers

local names = {"Boxten", "Brightney", "Cosmo", "Finn", "Flutter", "Gigi", "Glisten", "Goob", "Poppy", "RazzleDazzle", "Rodger", "Scraps", "Shrimpo", "Teagan", "Tisha", "Toodles", "Sprout", "Vee", "Dandy", "Shelly", "Pebble", "Astro", "Dandy"}
for _, name in pairs(names) do
    local toon = Instance.new("StringValue", folder)
    toon.Name = name
    toon.Value = "Default"
end
   end,
})


local Tab15 = Window:CreateTab("Client-Sided Skins", 18352963097) -- Title, Image

local Section = Tab15:CreateSection("Add-Ons")

local Button = Tab15:CreateButton({
   Name = "Plushie Dandy🧸(Use Client Sided Dandy)",
   Callback = function()
   local player = game.Players.LocalPlayer
local playerName = player.Name
local workspace = game.Workspace
local inGamePlayersFolder = workspace:FindFirstChild("InGamePlayers")

if inGamePlayersFolder then
    local playerModel = inGamePlayersFolder:FindFirstChild(playerName)
    if playerModel then
        local bodyPart = playerModel:FindFirstChild("Body")
        local headPart = playerModel:FindFirstChild("Head")
        
        if bodyPart and bodyPart:IsA("MeshPart") then
            bodyPart.TextureID = "rbxassetid://18857813525"
        end
        
        if headPart and headPart:IsA("MeshPart") then
            headPart.TextureID = "rbxassetid://18857813525"
        end
    else
        warn("Modelo del jugador no encontrado en la carpeta InGamePlayers.")
    end
else
    warn("Carpeta InGamePlayers no encontrada en Workspace.")
end
   end,
})

local Button = Tab15:CreateButton({
   Name = "Weird Pebble Skin",
   Callback = function()
   local player = game.Players.LocalPlayer
local playerName = player.Name
local workspace = game.Workspace
local inGamePlayersFolder = workspace:FindFirstChild("InGamePlayers")

if inGamePlayersFolder then
    local playerModel = inGamePlayersFolder:FindFirstChild(playerName)
    if playerModel then
        -- Buscar EyeL, EyeR, y UpperTorso y cambiar sus texturas si existen y son MeshParts
        local eyeL = playerModel:FindFirstChild("EyeL")
        local eyeR = playerModel:FindFirstChild("EyeR")
        local upperTorso = playerModel:FindFirstChild("UpperTorso")
        
        if eyeL and eyeL:IsA("MeshPart") then
            eyeL.TextureID = "rbxassetid://18865385829"
        end
        
        if eyeR and eyeR:IsA("MeshPart") then
            eyeR.TextureID = "rbxassetid://18865385829"
        end
        
        if upperTorso and upperTorso:IsA("MeshPart") then
            upperTorso.TextureID = "rbxassetid://18865385829"
        end
    else
        warn("Modelo del jugador no encontrado en la carpeta InGamePlayers.")
    end
else
    warn("Carpeta InGamePlayers no encontrada en Workspace.")
end
   end,
})

local Button = Tab15:CreateButton({
   Name = "🟦🖥️Blue Vee🖥️🟦",
   Callback = function()
   local player = game.Players.LocalPlayer
local playerName = player.Name
local workspace = game:GetService("Workspace")

-- IDs de las texturas y mesh a aplicar
local bodyTextureId = "rbxassetid://18944440468"
local micMeshId = "rbxassetid://102768583995591"
local headTextureId = "rbxassetid://18944440468"

-- Buscar la carpeta y el modelo del jugador
local inGamePlayersFolder = workspace:FindFirstChild("InGamePlayers")
if inGamePlayersFolder then
    local playerModel = inGamePlayersFolder:FindFirstChild(playerName)
    if playerModel then
        -- Cambiar textura de 'Body'
        local body = playerModel:FindFirstChild("Body")
        if body and body:IsA("MeshPart") then
            body.TextureID = bodyTextureId
        end

        -- Cambiar mesh de 'Mic' y ajustar la transparencia
        local mic = playerModel:FindFirstChild("Mic")
        if mic and mic:IsA("MeshPart") then
            mic.MeshId = micMeshId
            -- Cambiar transparencia del Mic a 1 (totalmente transparente)
            mic.Transparency = 1
        end

        -- Cambiar textura de 'Head'
        local head = playerModel:FindFirstChild("Head")
        if head and head:IsA("MeshPart") then
            head.TextureID = headTextureId
        end
    end
end
   end,
})

local Button = Tab15:CreateButton({
   Name = "😀Happy Pebble Skin😀",
   Callback = function()
   local player = game.Players.LocalPlayer
local playerName = player.Name
local workspace = game:GetService("Workspace")

-- IDs de las texturas a aplicar
local eyeTextureId = "rbxassetid://18983090757"
local torsoTextureId = "rbxassetid://18983090757"

-- Buscar la carpeta y el modelo del jugador
local inGamePlayersFolder = workspace:FindFirstChild("InGamePlayers")
if inGamePlayersFolder then
    local playerModel = inGamePlayersFolder:FindFirstChild(playerName)
    if playerModel then
        -- Cambiar textura de 'EyeL'
        local eyeL = playerModel:FindFirstChild("EyeL")
        if eyeL and eyeL:IsA("MeshPart") then
            eyeL.TextureID = eyeTextureId
        end

        -- Cambiar textura de 'EyeR'
        local eyeR = playerModel:FindFirstChild("EyeR")
        if eyeR and eyeR:IsA("MeshPart") then
            eyeR.TextureID = eyeTextureId
        end

        -- Cambiar textura de 'UpperTorso'
        local upperTorso = playerModel:FindFirstChild("UpperTorso")
        if upperTorso and upperTorso:IsA("MeshPart") then
            upperTorso.TextureID = torsoTextureId
        end
    end
end
   end,
})

local Button = Tab15:CreateButton({
   Name = "Bald Dandy(Skin for Client Sided Dandy)",
   Callback = function()
   local player = game.Players.LocalPlayer
local playerName = player.Name
local workspace = game:GetService("Workspace")

-- Buscar la carpeta y el modelo del jugador
local inGamePlayersFolder = workspace:FindFirstChild("InGamePlayers")
if inGamePlayersFolder then
    local playerModel = inGamePlayersFolder:FindFirstChild(playerName)
    if playerModel then
        -- Buscar y eliminar 'Hair' si existe
        local hair = playerModel:FindFirstChild("Hair")
        if hair and hair:IsA("MeshPart") then
            hair:Destroy()
        end
    end
end
   end,
})
