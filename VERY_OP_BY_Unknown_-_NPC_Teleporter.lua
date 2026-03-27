-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]


-- [[ ITS MY FIRST TIME TO SKID THINGS!! ;3 ]]

-- LocalScript: DeliveryNpcTeleporterSmart v9

-- 📍 StarterPlayerScripts

-- 🧠 GUI fijo, minimizar integrado y sin doble recolección del giver.

local Players = game:GetService("Players")

local player = Players.LocalPlayer

if not player then return end

-- 🧍 Obtener HRP

local function getHRP()

	local ch = player.Character or player.CharacterAdded:Wait()	return ch:WaitForChild("HumanoidRootPart", 10)

end

local hrp = getHRP()

player.CharacterAdded:Connect(function(c)

	hrp = c:WaitForChild("HumanoidRootPart", 10)

end)

-- 📦 Posición del Giver

local giverPos = Vector3.new(152.00, 44.73, -204.79)

-- 🔍 Buscar giver y prompt

local function buscarGiver()

	for _, obj in ipairs(workspace:GetDescendants()) do

		if obj:IsA("BasePart") and obj.Name == "Giver" and (obj.Position - giverPos).Magnitude < 10 then

			return obj

		end

	end

end

local function buscarGiverPrompt()

	local giver = buscarGiver()

	if not giver then return end

	return giver:FindFirstChildOfClass("ProximityPrompt")

end

-- 🧭 Buscar carpeta DeliveryNpcs

local function getDeliveryFolder()

	local works = workspace:FindFirstChild("Works")

	if not works then return end

	for _, obj in ipairs(works:GetChildren()) do

		if string.lower(obj.Name) == "deliverynpcs" or string.lower(obj.Name) == "deliverynpc" then

			return obj

		end

	end

end

local function getModelPosition(obj)

	if obj:IsA("BasePart") then return obj.Position end

	if obj:IsA("Model") then

		if obj.PrimaryPart then return obj.PrimaryPart.Position end

		local ok, box = pcall(function() return obj:GetBoundingBox() end)

		if ok and box then return box.Position end

		for _, d in ipairs(obj:GetDescendants()) do

			if d:IsA("BasePart") then return d.Position end

		end

	end

end

local function findPrompt(npc)

	for _, d in ipairs(npc:GetDescendants()) do

		if d:IsA("ProximityPrompt") then return d end

	end

end

-- 🪟 GUI

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

gui.Name = "DeliveryNpcTP_GUI"

gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)

frame.Size = UDim2.new(0, 240, 0, 160)

frame.Position = UDim2.new(0.5, -120, 0.7, 0)

frame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)

frame.BorderSizePixel = 0

frame.Active = true

frame.Draggable = true

local header = Instance.new("Frame", frame)

header.Size = UDim2.new(1, 0, 0, 30)

header.BackgroundColor3 = Color3.fromRGB(50, 50, 60)

header.BorderSizePixel = 0

local title = Instance.new("TextLabel", header)

title.Size = UDim2.new(1, -35, 1, 0)

title.Position = UDim2.new(0, 10, 0, 0)

title.BackgroundTransparency = 1

title.Font = Enum.Font.GothamBold

title.TextColor3 = Color3.fromRGB(255,255,255)

title.Text = "📦 Auto Delivery"

title.TextScaled = true

title.TextXAlignment = Enum.TextXAlignment.Left

local minimizeBtn = Instance.new("TextButton", header)

minimizeBtn.Size = UDim2.new(0, 30, 0, 30)

minimizeBtn.Position = UDim2.new(1, -35, 0, 0)

minimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 90)

minimizeBtn.Text = "-"

minimizeBtn.Font = Enum.Font.GothamBold

minimizeBtn.TextScaled = true

minimizeBtn.TextColor3 = Color3.new(1,1,1)

local info = Instance.new("TextLabel", frame)

info.Size = UDim2.new(1, -10, 0, 40)

info.Position = UDim2.new(0, 5, 0, 40)

info.BackgroundTransparency = 1

info.Font = Enum.Font.Gotham

info.TextScaled = true

info.TextColor3 = Color3.fromRGB(200,200,200)

info.Text = "Listo..."

local btn = Instance.new("TextButton", frame)

btn.Size = UDim2.new(1, -20, 0, 40)

btn.Position = UDim2.new(0, 10, 1, -50)

btn.BackgroundColor3 = Color3.fromRGB(70, 150, 255)

btn.Text = "🚀 Iniciar Loop"

btn.Font = Enum.Font.GothamBold

btn.TextScaled = true

btn.TextColor3 = Color3.new(1,1,1)

-- 🔽 Mini bar

local mini = Instance.new("TextButton", gui)

mini.Size = UDim2.new(0, 160, 0, 30)

mini.BackgroundColor3 = Color3.fromRGB(50, 50, 60)

mini.Text = "📦 Auto Delivery"

mini.Font = Enum.Font.GothamBold

mini.TextScaled = true

mini.TextColor3 = Color3.new(1,1,1)

mini.Visible = false

mini.Active = true

mini.Draggable = true

-- 📉 Minimizar / restaurar

local lastFramePos = frame.Position

minimizeBtn.MouseButton1Click:Connect(function()

	lastFramePos = frame.Position

	frame.Visible = false

	mini.Visible = true

	mini.Position = lastFramePos

end)

mini.MouseButton1Click:Connect(function()

	frame.Visible = true

	mini.Visible = false

	frame.Position = mini.Position

end)

-- 🎁 Recoger pedido

local function recogerPedido()

	info.Text = "🛰️ Yendo al Giver..."

	hrp.CFrame = CFrame.new(giverPos + Vector3.new(0, 4, 0))

	task.wait(0.4)

	local prompt = buscarGiverPrompt()

	if not prompt then

		info.Text = "❌ No se encontró el Giver o su prompt"

		return false

	end

	info.Text = "🎁 Recogiendo pedido..."

	fireproximityprompt(prompt, 1, true)

	task.wait((prompt.HoldDuration or 1) + 0.2)

	info.Text = "✅ Pedido recogido"

	return true

end

-- 🚚 Entregar pedido con 3 intentos

local function entregarPedido()

	local folder = getDeliveryFolder()

	if not folder then

		info.Text = "❌ No se encontró Works.DeliveryNpcs"

		return false

	end

	local npcs = folder:GetChildren()

	if #npcs == 0 then

		info.Text = "📭 No hay NPCs disponibles"

		return false

	end

	for _, npc in ipairs(npcs) do

		local pos = getModelPosition(npc)

		if pos then

			for intento = 1, 3 do

				info.Text = "📦 Intento " .. intento .. " en: " .. npc.Name

				hrp.CFrame = CFrame.new(pos + Vector3.new(0, 5, 0))

				task.wait(0.4)

				local prompt = findPrompt(npc)

				if prompt then

					local originalParent = prompt.Parent

					fireproximityprompt(prompt, 1, true)

					task.wait((prompt.HoldDuration or 1) + 0.3)

					if not prompt.Parent or prompt.Parent ~= originalParent or not prompt:IsDescendantOf(npc) then

						info.Text = "✅ Entregado correctamente a: " .. npc.Name

						task.wait(0.3)

						return true

					end

				end

			end

			info.Text = "⚠️ Falló en " .. npc.Name .. " tras 3 intentos"

			task.wait(0.3)

		end

	end

	info.Text = "⚠️ Ningún NPC aceptó la entrega"

	return false

end

-- 🔁 Loop

local running = false

local function loopRutas()

	running = true

	while running do

		info.Text = "🔄 Nueva ruta..."

		if recogerPedido() then

			task.wait(0.3)

			entregarPedido()

			task.wait(0.3)

			info.Text = "🏁 Regresando al Giver..."

			hrp.CFrame = CFrame.new(giverPos + Vector3.new(0, 4, 0))

			task.wait(0.5)

			info.Text = "✅ Ciclo completado. Repitiendo..."

			task.wait(1)

		else

			info.Text = "❌ Error con el Giver"

			task.wait(1)

		end

	end

end

btn.MouseButton1Click:Connect(function()

	if running then

		running = false

		btn.Text = "🚀 Iniciar Loop"

		btn.BackgroundColor3 = Color3.fromRGB(70, 150, 255)

		info.Text = "⏹️ Ciclo detenido."

	else

		running = true

		btn.Text = "⏹️ Detener Loop"

		btn.BackgroundColor3 = Color3.fromRGB(220, 70, 70)

		task.spawn(loopRutas)

	end

end)

-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]
-- [[ SKIDDED BY MIZUMARU | discord.gg/mxSvSpJe7s ]]