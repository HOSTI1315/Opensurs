
local autopickuptoggle = false

function autopickupfunction()
    spawn(function()
        while autopickuptoggle do
            for _, v in pairs(game.Workspace.Runtime.Potions:GetChildren()) do
                if v:IsA("UnionOperation") then
                    v.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                end
            end
            wait()
        end
    end)
end

local autopotion = false
_G.potion = "Nil"

function autopotionfunction()
    spawn(function()
        while autopotion do
            local args = {
                [1] = _G.potion,
                [2] = 1
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PotionInventoryService"):WaitForChild("RF"):WaitForChild("ConsumePotion"):InvokeServer(unpack(args))
            wait()
        end
    end)
end

local autoall = false

function autoallpotionfunction()
    spawn(function()
        while autoall do
            local potions = {"RollSpeed", "Luck", "Shiny"}
            for _, potion in ipairs(potions) do
                local args = {
                    [1] = potion,
                    [2] = 1
                }

                game:GetService("ReplicatedStorage"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PotionInventoryService"):WaitForChild("RF"):WaitForChild("ConsumePotion"):InvokeServer(unpack(args))
            end
            wait()
        end
    end)
end

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "SolixHub [Free] | Dungeon RNG", HidePremium = false, SaveConfig = true, ConfigFolder = "SolixHub"})



local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Potions"

})

Tab:AddToggle({
	Name = "Auto Pickup Potions!",
	Default = false,
	Callback = function(Value)
		autopickuptoggle = Value
        if autopickuptoggle then
            autopickupfunction()
        end
	end    
})

Tab:AddDropdown({
	Name = "Pick Potion",
	Default = "1",
	Options = {"None","Luck", "Speed", "Shiny"},
	Callback = function(Value)
        if Value == "Speed" then
            _G.potion = "RollSpeed"
        elseif Value == "Luck" then
            _G.potion = "Luck"
        elseif Value == "Shiny" then
            _G.potion = "Shiny"
        end
    end 
})

Tab:AddToggle({
	Name = "Auto Use Potion",
	Default = false,
	Callback = function(Value)
        autopotion = Value
        if autopotion then
            autopotionfunction()
        end
    end 
})

Tab:AddToggle({
	Name = "Auto All Potions",
	Default = false,
    Callback = function(Value)
        autoall = Value
        if autoall then
            autoallpotionfunction()
        end
    end
})


OrionLib:Init()



