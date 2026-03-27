-- This file is licensed under the Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/legalcode.txt for details.
local player = game:GetService("Players").LocalPlayer

function init()
	local playerModel = workspace:WaitForChild(player.Name)
	if playerModel then
		local gun = playerModel:WaitForChild("GunController")
		if gun then
			gun:Destroy()
		end

		local knife = playerModel:WaitForChild("KnifeController")
		if knife then
			knife:Destroy()
		end
	end
end

task.spawn(init)
return player.CharacterAdded:Connect(init)