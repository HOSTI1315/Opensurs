-- 🌈 Blade Ball おしゃれGUI（UIデザイン部分）

-- サービス
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- メインUIフレーム
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "BladeBallUI"
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.35, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BackgroundTransparency = 0.2
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true

-- 丸角と影
local corner = Instance.new("UICorner", MainFrame)
corner.CornerRadius = UDim.new(0, 16)
local shadow = Instance.new("ImageLabel", MainFrame)
shadow.Name = "Shadow"
shadow.ZIndex = -1
shadow.Position = UDim2.new(0, -20, 0, -20)
shadow.Size = UDim2.new(1, 40, 1, 40)
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.6
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)

-- タイトルバー
local TitleBar = Instance.new("Frame", MainFrame)
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TitleBar.BorderSizePixel = 0
local TitleCorner = Instance.new("UICorner", TitleBar)
TitleCorner.CornerRadius = UDim.new(0, 16)

local TitleLabel = Instance.new("TextLabel", TitleBar)
TitleLabel.Size = UDim2.new(1, -40, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "⚔️ Blade Ball ツール"
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 18
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- 最小化ボタン
local MinimizeButton = Instance.new("TextButton", TitleBar)
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -35, 0.5, -15)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Text = "―"
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 18
MinimizeButton.TextColor3 = Color3.fromRGB(200, 200, 200)

-- 中身用コンテナ
local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Position = UDim2.new(0, 0, 0, 40)
ContentFrame.Size = UDim2.new(1, 0, 1, -40)
ContentFrame.BackgroundTransparency = 1

-- ボタン作成関数
local function createButton(name)
	local btn = Instance.new("TextButton", ContentFrame)
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, (#ContentFrame:GetChildren()-1) * 45 + 10)
	btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	btn.Text = name
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 16
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	
	local btnCorner = Instance.new("UICorner", btn)
	btnCorner.CornerRadius = UDim.new(0, 10)
	
	btn.MouseEnter:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	end)
	btn.MouseLeave:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	end)
	
	return btn
end

-- デモ用ボタン（後で機能を入れる）
createButton("🎯 オートエイム")
createButton("🛡 自動パリィ（近距離）")
createButton("⚡ 自動パリィ（即反応）")
createButton("👀 ESP")
createButton("✨ 無敵（Godモード）")

-- 最小化動作
local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		ContentFrame.Visible = false
		MainFrame:TweenSize(UDim2.new(0, 300, 0, 40), "Out", "Quad", 0.3, true)
	else
		ContentFrame.Visible = true
		MainFrame:TweenSize(UDim2.new(0, 300, 0, 400), "Out", "Quad", 0.3, true)
	end
end)
-- ⚔️ Blade Ball GUI - フル機能版

-- サービス取得
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")

-- メインUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "BladeBallUI"
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.35, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BackgroundTransparency = 0.2
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true

local corner = Instance.new("UICorner", MainFrame)
corner.CornerRadius = UDim.new(0, 16)
local shadow = Instance.new("ImageLabel", MainFrame)
shadow.ZIndex = -1
shadow.Position = UDim2.new(0, -20, 0, -20)
shadow.Size = UDim2.new(1, 40, 1, 40)
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.6
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)

local TitleBar = Instance.new("Frame", MainFrame)
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TitleBar.BorderSizePixel = 0
local TitleCorner = Instance.new("UICorner", TitleBar)
TitleCorner.CornerRadius = UDim.new(0, 16)

local TitleLabel = Instance.new("TextLabel", TitleBar)
TitleLabel.Size = UDim2.new(1, -40, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "⚔️ Blade Ball ツール"
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 18
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local MinimizeButton = Instance.new("TextButton", TitleBar)
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -35, 0.5, -15)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Text = "―"
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 18
MinimizeButton.TextColor3 = Color3.fromRGB(200, 200, 200)

local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Position = UDim2.new(0, 0, 0, 40)
ContentFrame.Size = UDim2.new(1, 0, 1, -40)
ContentFrame.BackgroundTransparency = 1

local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		ContentFrame.Visible = false
		MainFrame:TweenSize(UDim2.new(0, 300, 0, 40), "Out", "Quad", 0.3, true)
	else
		ContentFrame.Visible = true
		MainFrame:TweenSize(UDim2.new(0, 300, 0, 400), "Out", "Quad", 0.3, true)
	end
end)

-- トグル状態
local AutoAim = false
local AutoParryNear = false
local AutoParryInstant = false
local ESP = false
local God = false

-- ボタン作成関数
local function createButton(name, callback)
	local btn = Instance.new("TextButton", ContentFrame)
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, (#ContentFrame:GetChildren()-1) * 45 + 10)
	btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	btn.Text = name.."：OFF"
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 16
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)

	local btnCorner = Instance.new("UICorner", btn)
	btnCorner.CornerRadius = UDim.new(0, 10)

	local on = false
	btn.MouseButton1Click:Connect(function()
		on = not on
		btn.Text = name.."："..(on and "ON" or "OFF")
		btn.BackgroundColor3 = on and Color3.fromRGB(0, 170, 120) or Color3.fromRGB(60, 60, 60)
		callback(on)
	end)
end

-- 🎯 オートエイム
createButton("🎯 オートエイム", function(state)
	AutoAim = state
end)
task.spawn(function()
	while task.wait() do
		if AutoAim then
			local ball = workspace:FindFirstChild("Ball")
			if ball then
				Camera.CFrame = CFrame.new(Camera.CFrame.Position, ball.Position)
			end
		end
	end
end)

-- 🛡 自動パリィ（近距離）
createButton("🛡 自動パリィ（近距離）", function(state)
	AutoParryNear = state
end)
task.spawn(function()
	while task.wait(0.1) do
		if AutoParryNear and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
			local ball = workspace:FindFirstChild("Ball")
			if ball and (ball.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 15 then
				local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
				if remote and remote:FindFirstChild("Parry") then
					remote.Parry:FireServer()
				end
			end
		end
	end
end)

-- ⚡ 自動パリィ（即反応）
createButton("⚡ 自動パリィ（即反応）", function(state)
	AutoParryInstant = state
end)
task.spawn(function()
	while task.wait(0.05) do
		if AutoParryInstant then
			local ball = workspace:FindFirstChild("Ball")
			if ball and ball.AssemblyLinearVelocity.Magnitude > 60 then
				local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
				if remote and remote:FindFirstChild("Parry") then
					remote.Parry:FireServer()
				end
			end
		end
	end
end)

-- 👀 ESP
createButton("👀 ESP", function(state)
	ESP = state
	if not state then
		for _, v in ipairs(workspace:GetChildren()) do
			if v:FindFirstChild("ESP") then v.ESP:Destroy() end
		end
	end
end)
task.spawn(function()
	while task.wait(1) do
		if ESP then
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
					if not plr.Character:FindFirstChild("ESP") then
						local billboard = Instance.new("BillboardGui", plr.Character)
						billboard.Name = "ESP"
						billboard.Adornee = plr.Character.HumanoidRootPart
						billboard.Size = UDim2.new(0, 100, 0, 50)
						billboard.AlwaysOnTop = true
						local text = Instance.new("TextLabel", billboard)
						text.Size = UDim2.new(1,0,1,0)
						text.BackgroundTransparency = 1
						text.Text = plr.Name
						text.TextColor3 = Color3.fromRGB(255, 0, 0)
						text.TextStrokeTransparency = 0
						text.TextScaled = true
					end
				end
			end
		end
	end
end)

-- ✨ 無敵（Godモード）
createButton("✨ 無敵（Godモード）", function(state)
	God = state
	local char = LocalPlayer.Character
	if not char then return end
	local humanoid = char:FindFirstChild("Humanoid")
	if not humanoid then return end

	if state then
		humanoid.Name = "GodHumanoid"
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
		humanoid.Health = humanoid.MaxHealth
	else
		humanoid.Name = "Humanoid"
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
	end
end)
