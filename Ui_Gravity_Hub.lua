-- LocalScript: GravityHub
-- by realtboy

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")


if playerGui:FindFirstChild("GravityHubUi") then
	playerGui.GodHub_UI:Destroy()
end


local gui = Instance.new("ScreenGui")
gui.Name = "GravityHubUi"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui


local main = Instance.new("Frame")
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.Size = UDim2.new(0, 400, 0, 250)
main.BackgroundTransparency = 1
main.Parent = gui


local icon = Instance.new("ImageLabel")
icon.AnchorPoint = Vector2.new(0.5, 0)
icon.Position = UDim2.new(0.5, 0, 0, 0)
icon.Size = UDim2.new(0, 90, 0, 90)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://73675787844710"
icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
icon.ImageTransparency = 0.05
icon.ImageRectOffset = Vector2.new(0, 0)
icon.ImageRectSize = Vector2.new(0, 0)
icon.ZIndex = 10
icon.Parent = main


local glow = Instance.new("UIStroke")
glow.Color = Color3.fromRGB(255, 200, 50)
glow.Thickness = 2
glow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
glow.Parent = icon


local title = Instance.new("TextLabel")
title.AnchorPoint = Vector2.new(0.5, 0)
title.Position = UDim2.new(0.5, 0, 0.37, 0)
title.Size = UDim2.new(0, 300, 0, 50)
title.BackgroundTransparency = 1
title.Text = "GravityHub"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255, 225, 70)
title.TextStrokeTransparency = 0.3
title.Parent = main


local combat = Instance.new("TextLabel")
combat.AnchorPoint = Vector2.new(0.5, 0)
combat.Position = UDim2.new(0.5, 0, 0.55, 0)
combat.Size = UDim2.new(0, 250, 0, 30)
combat.BackgroundTransparency = 1
combat.Text = "by realtboy"
combat.Font = Enum.Font.GothamSemibold
combat.TextScaled = true
combat.TextColor3 = Color3.fromRGB(255, 60, 60)
combat.TextStrokeTransparency = 0.4
combat.Parent = main

local info = Instance.new("TextLabel")
info.AnchorPoint = Vector2.new(0.5, 0)
info.Position = UDim2.new(0.5, 0, 0.72, 0)
info.Size = UDim2.new(0, 380, 0, 25)
info.BackgroundTransparency = 1
info.Text = "FPS: 0 | Executor: Delta | Players: 0 | Ping: 0ms"
info.Font = Enum.Font.GothamSemibold
info.TextScaled = true
info.TextColor3 = Color3.fromRGB(255, 220, 90)
info.TextStrokeTransparency = 0.5
info.Parent = main

-- Dòng Discord
local discord = Instance.new("TextLabel")
discord.AnchorPoint = Vector2.new(0.5, 0)
discord.Position = UDim2.new(0.5, 0, 0.86, 0)
discord.Size = UDim2.new(0, 450, 0, 25)
discord.BackgroundTransparency = 1
discord.Text = "Status : https://discord.gg/s4sMmn7BrQ"
discord.Font = Enum.Font.GothamSemibold
discord.TextScaled = true
discord.TextColor3 = Color3.fromRGB(255, 230, 90)
discord.TextStrokeTransparency = 0.5
discord.Parent = main

task.spawn(function()
	while task.wait(0.05) do
		local tween = TweenService:Create(icon, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
			ImageTransparency = 0.1
		})
		tween:Play()
		tween.Completed:Wait()
	end
end)


local frames, lastTime, fps = 0, tick(), 0
RunService.Heartbeat:Connect(function()
	frames += 1
	if tick() - lastTime >= 1 then
		fps = frames
		frames = 0
		lastTime = tick()
		local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue() or 0)
		local players = #Players:GetPlayers()
		info.Text = string.format("FPS: %d | Executor: Delta | Players: %d | Ping: %dms", fps, players, ping)
	end
end)