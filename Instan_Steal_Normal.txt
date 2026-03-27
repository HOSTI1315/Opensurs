-- Bersihkan GUI lama
pcall(function()
	game.CoreGui:FindFirstChild("StealHelper"):Destroy()
end)

-- GUI Utama
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "StealHelper"
gui.ResetOnSpawn = false

-- Frame (ukuran 20% lebih kecil)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 176, 0, 104)
frame.Position = UDim2.new(0.1, 0, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- UI Corner
local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 10)

-- Judul
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 25)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Steal Helper 1"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

-- Garis bawah judul
local garis = Instance.new("Frame", frame)
garis.Size = UDim2.new(1, -20, 0, 1)
garis.Position = UDim2.new(0, 10, 0, 25)
garis.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
garis.BorderSizePixel = 0

-- 
local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.90, 0, 0, 34) -- Dibesar 20%
button.Position = UDim2.new(0.05, 0, 0, 42) -- Rata tengah sempurna
button.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamSemibold
button.TextSize = 14
button.Text = "▶ Start"
button.AutoButtonColor = false
--
-- UICorner tombol
local btnCorner = Instance.new("UICorner", button)
btnCorner.CornerRadius = UDim.new(0, 6)

-- Hover effect
button.MouseEnter:Connect(function()
	button.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
end)
button.MouseLeave:Connect(function()
	button.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
end)

-- Variabel
local active = false
local moveConn, touchConn = nil, nil

-- Fungsi cari semua target
local function getAllTargetParts()
	local parts = {}
	local size1 = Vector3.new(13.128019332885742, 17, 0.25)
	local size2 = Vector3.new(13.128019332885742, 17, 0.25)
	
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj:IsA("BasePart") and obj.Name == "structure base home" then
			if (obj.Size - size1).Magnitude < 0.01 or (obj.Size - size2).Magnitude < 0.01 then
				table.insert(parts, obj)
			end
		end
	end
	return parts
end

-- Buat part jmj
local function buatJMJSemua()
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") and v.Name == "jmj" then
			v:Destroy()
		end
	end

	local targetParts = getAllTargetParts()
	local jmjParts = {}

	for _, target in ipairs(targetParts) do
		local jmj = Instance.new("Part", workspace)
		jmj.Name = "jmj"
		jmj.Size = Vector3.new(0.5, 20, 70)
		jmj.Anchored = true
		jmj.CanCollide = false
		jmj.Transparency = 1
		jmj.BrickColor = BrickColor.new("Bright yellow")
		jmj.Position = target.Position + Vector3.new(0, target.Size.Y / 4 + target.Size.Y / 2, 0) - Vector3.new(0, 0.5, 0)
		table.insert(jmjParts, jmj)
	end

	return jmjParts
end

-- Dorong ke part jmj
local function dorongKeJMJ(jmjParts)
	local player = game.Players.LocalPlayer
	local char = player.Character or player.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")
	local humanoid = char:WaitForChild("Humanoid")

	local nearestJMJ, shortestDistance = nil, 70
	for _, jmj in pairs(jmjParts) do
		local dist = (jmj.Position - hrp.Position).Magnitude
		if dist < shortestDistance then
			nearestJMJ = jmj
			shortestDistance = dist
		end
	end

	if not nearestJMJ then return end

	local direction = (nearestJMJ.Position - hrp.Position).Unit
	local move = true
	local sudahSentuh = false

	moveConn = game:GetService("RunService").Heartbeat:Connect(function()
		if not move or not hrp then return end
		local newVel = direction * 43
		hrp.Velocity = Vector3.new(newVel.X, hrp.Velocity.Y, newVel.Z)
	end)

	touchConn = nearestJMJ.Touched:Connect(function(hit)
		if hit and hit:IsDescendantOf(char) and not sudahSentuh then
			sudahSentuh = true
			move = false -- Hentikan gerakan dulu

			task.delay(0.1, function() -- Tunggu 0.1 detik DULU, baru loncat
				humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				hrp.Velocity = Vector3.new(0, 160, 0)
				button.Text = "▶ Start"
				active = false

				if moveConn then moveConn:Disconnect() end
				if touchConn then touchConn:Disconnect() end

				for _, p in pairs(workspace:GetDescendants()) do
					if p:IsA("BasePart") and p.Name == "jmj" then
						p:Destroy()
					end
				end
			end)
		end
	end)
end

-- Ketika tombol diklik
button.MouseButton1Click:Connect(function()
	active = not active
	button.Text = active and "■ Stop" or "▶ Start"

	if moveConn then moveConn:Disconnect() end
	if touchConn then touchConn:Disconnect() end

	for _, p in pairs(workspace:GetDescendants()) do
		if p:IsA("BasePart") and p.Name == "jmj" then
			p:Destroy()
		end
	end

	if not active then return end

	local jmjParts = buatJMJSemua()
	dorongKeJMJ(jmjParts)
end)





task.wait(1) -- beri jeda biar GUI keburu siap
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Tips Message!",
	Text = "For Base Flor 1",
	Duration = 4
})