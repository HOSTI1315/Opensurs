--@rznnq ui 
--FLOAT-DISCORD @rznnq (working in STEAL A BRAINROT uwu)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local floatEnabled = true
local platform
local function enableFloat()
	if platform then platform:Destroy() end
	platform = Instance.new("Part")
	platform.Size = Vector3.new(6, 1, 6)
	platform.Anchored = true
	platform.CanCollide = true
	platform.Transparency = 1
	platform.Parent = workspace
	task.spawn(function()
		while floatEnabled and platform do
			if hrp then
				platform.Position = hrp.Position - Vector3.new(0, 3, 0)
			end
			task.wait(0.05)
		end
	end)
end
if floatEnabled then
	enableFloat()
end
player.CharacterAdded:Connect(function(char)
	character = char
	hrp = char:WaitForChild("HumanoidRootPart")
	if floatEnabled then
		enableFloat()
	end
end)

--PUEDES HACER UNA UI PARA ACTIVAR O DESACTIVAR, SI NO SABES COMO HACERLA AQUI TE DEJO EL EJEMPLO
--YOU CAN MAKE A UI TO ACTIVATE OR DEACTIVATE, IF YOU DON'T KNOW HOW TO DO IT HERE IS THE EXAMPLE

--local Players = game:GetService("Players")
--local player = Players.LocalPlayer
--local PlayerGui = player:WaitForChild("PlayerGui")
--local gui = Instance.new("ScreenGui")
--gui.Name = "ui ejemplo//example ui"
--gui.ResetOnSpawn = false
--gui.Parent = PlayerGui
--local button = Instance.new("TextButton")
--button.Size = UDim2.new(0, 120, 0, 36)
--button.Position = UDim2.new(1, -200, 0.5, -18)
--button.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
--button.Text = "OFF"
--button.TextColor3 = Color3.fromRGB(255, 255, 255)
--button.Font = Enum.Font.GothamBold
--button.TextSize = 14
--button.Parent = gui
--Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)
--local enabled = false
--button.MouseButton1Click:Connect(function()
--	enabled = not enabled
--	if enabled then
--		button.Text = "ON"
--	else
--		button.Text = "OFF"
--	end
--end)


--remove (--) ui basic