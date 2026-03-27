if game.placeId == 4924922222 then
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Sander X  | Brookhaven RP | ", HidePremium = false, IntroText = "Sander X   ", SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Informations",
	Icon = "rbxassetid://17326583943",
	PremiumOnly = false
})
Tab:AddParagraph("Welcome to Sander X","Thank you for using my scripts. The owner is Wojtes_BMW and his YouTube channel is OFFYT")
Tab:AddParagraph("Update New Version","|1| bug repair |2| Adding Music id |3| 24 music added |4| added Home and information menu, Teleportation,ESP menu |5| Added view,Goto,Kill,Bring improvements |6| Added secrets to teleportation and much more |7| added more modifications to avatar") 

local Tab = Window:MakeTab({
	Name = "Home",
	Icon = "rbxassetid://10723407389",
	PremiumOnly = false
})

Tab:AddSection({
    Name = "View/Goto"
})

-- Toggle para a função de visualização
local viewEnabled = false
local selectedViewPlayer = nil
local characterAddedConnection = nil

-- Função para ativar ou desativar a visualização do jogador
local function toggleView(enabled)
    if enabled then
        if selectedViewPlayer then
            local player = selectedViewPlayer
            if player then
                game.Workspace.CurrentCamera.CameraSubject = player.Character
                if characterAddedConnection then
                    characterAddedConnection:Disconnect()
                end
                characterAddedConnection = player.CharacterAdded:Connect(function(character)
                    game.Workspace.CurrentCamera.CameraSubject = character
                end)
                OrionLib:MakeNotification({
                    Name = "View",
                    Content = "You're watching: " .. player.Name,
                    Image = "rbxassetid://4483345998",
                    Time = 6
                })
            else
                print("Jogador não encontrado.")
                viewEnabled = false
            end
        else
            print("Nenhum jogador selecionado para a visualização.")
            viewEnabled = false
        end
    else
        if characterAddedConnection then
            characterAddedConnection:Disconnect()
            characterAddedConnection = nil
        end
        game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
    end
end

-- Função para encontrar jogador por nome parcial ou apelido (usando apenas as 2 primeiras letras)
local function findPlayerByPartialNameOrNickname(partialName)
    local partial = partialName:sub(1, 2):lower()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Name:lower():sub(1, 2) == partial or (player.DisplayName and player.DisplayName:lower():sub(1, 2) == partial) then
            return player
        end
    end
    return nil
end

-- Adicionar o textbox para entrada do nome parcial ou apelido do jogador
Tab:AddTextbox({
    Name = "Player Name -->",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        selectedViewPlayer = findPlayerByPartialNameOrNickname(value)
        if selectedViewPlayer then
            print("Jogador encontrado: " .. selectedViewPlayer.Name)
            if viewEnabled then
                toggleView(false)
                toggleView(true)
            end
        else
            print("Nenhum jogador encontrado com esse nome ou apelido.")
            if viewEnabled then
                toggleView(false)
            end
        end
    end
})

-- Adicionar o toggle "View" à seção "Visualização"
Tab:AddToggle({
    Name = "View",
    Default = false,
    Callback = function(enabled)
        viewEnabled = enabled
        toggleView(enabled)
    end
})

-- Lista de seleção de jogadores para "Goto"
local gotoPlayerList = {}
for _, player in ipairs(game.Players:GetPlayers()) do
    table.insert(gotoPlayerList, player.Name)
end

local selectedGotoPlayer = nil

-- Adicionar um ListPlayer para selecionar o jogador alvo para "Goto"
Tab:AddDropdown({
    Name = "Choose who you want to Goto",
    Description = "Selecione o jogador alvo para o Goto (couch)",
    Options = gotoPlayerList,
    Callback = function(playerName)
        selectedGotoPlayer = playerName
    end
})

-- Adicionar o botão "Goto" à seção "View/Goto"
Tab:AddButton({
    Name = "Goto",
    Description = "This player is not on the list",
    Callback = function()
        if selectedGotoPlayer then
            local player = game.Players:FindFirstChild(selectedGotoPlayer)
            if player then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
            else
                print("Jogador não encontrado.")
            end
        else
            print("Nenhum jogador selecionado para o Goto.")
        end
    end
})

-- Conectar eventos de jogador removido
game.Players.PlayerRemoving:Connect(function(player)
    if selectedViewPlayer == player then
        selectedViewPlayer = nil
        if viewEnabled then
            toggleView(false)
            OrionLib:MakeNotification({
                Name = "Sander X",
                Content = player.Name .. " has left",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
end)

-- Função para manter a câmera no jogador selecionado
local function maintainView()
    while wait() do
        if viewEnabled and selectedViewPlayer then
            local player = selectedViewPlayer
            if player and game.Workspace.CurrentCamera.CameraSubject ~= player.Character then
                game.Workspace.CurrentCamera.CameraSubject = player.Character
            end
        end
    end
end

-- Iniciar a função de manutenção da câmera
spawn(maintainView)

local Section = Tab:AddSection({
	Name = "Others Kill"
})
local selectedKillAdvancedPlayer = nil
local couchEquipped = false

local function killAdvancedPlayer()
    if selectedKillAdvancedPlayer then
        local player = game.Players:FindFirstChild(selectedKillAdvancedPlayer)
        if player then
            -- Equipa o item 'Couch' no inventário se ainda não estiver equipado
            local backpack = game.Players.LocalPlayer.Backpack
            if backpack and not couchEquipped then
                local couch = backpack:FindFirstChild("Couch")
                if couch then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(couch)
                    couchEquipped = true
                else
                    print("O item 'Couch' não foi encontrado no seu inventário.")
                end
            end
            
            -- Looping de teleportes no jogador selecionado da lista
            while true do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
                wait(0.0) -- Intervalo entre cada teleporte, ajuste conforme necessário
                
                -- Verifica se o jogador sentou no 'Couch' e realiza o teleporte para o céu
                if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.SeatPart then
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleporta para cima
                    wait(0.0) -- Espera um pouco antes de teleportar de volta para evitar bugs
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleporta para cima novamente
                    wait(0.0) -- Espera um pouco antes de teleportar de volta para evitar bugs
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(505, -75, 143) -- Teleporta de volta para a posição original
                    break -- Sai do loop após teleportar de volta
                end
            end
            
            -- Remove o item 'Couch' da mão do jogador após o teleporte para o céu
            if couchEquipped then
                local backpack = game.Players.LocalPlayer.Backpack
                if backpack then
                    local couch = backpack:FindFirstChild("Couch")
                    if couch then
                        couch.Parent = nil -- Remove o 'Couch' do inventário
                        couchEquipped = false
                    end
                end
            end
        else
            print("Jogador não encontrado.")
        end
    else
        print("Nenhum jogador selecionado para o Bring Avançado.")
    end
end

-- Lista de Players para Bring Avançado
local killAdvancedPlayerList = {}
for _, player in ipairs(game.Players:GetPlayers()) do
    table.insert(killAdvancedPlayerList, player.Name)
end

Tab:AddDropdown({
    Name = "Choose who you want to Bring (couch)",
    Description = "Selecione o jogador alvo para o Bring Avançado",
    Options = killAdvancedPlayerList,
    Callback = function(playerName)
        selectedKillAdvancedPlayer = playerName
  end
})

Tab:AddButton({
    Name = "Bring",
    Description = "Equipa o item 'Couch' e teleporta o jogador selecionado",
    Callback = function()
        killAdvancedPlayer()
    end
})
Tab:AddButton({
	Name = "Kill Player (use the sofa)",
	Callback = function()
--Sofá 
	local args = {
    [1] = "PickingTools",
    [2] = "Couch"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))

--kill

loadstring(game:HttpGet("https://pastebin.com/raw/yFP31TBf"))()
  	end    
})
Tab:AddButton({
	Name = "Void player (use the sofa)",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Void'))()
  	end    
})
local Tab = Window:MakeTab({
	Name = "Avatar",
	Icon = "rbxassetid://7743876054",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Reset Avatar"
})
Tab:AddButton({
	Name = "Refresh Character",
	Callback = function()
local args = {
    [1] = "OCA"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
end
})
local Section = Tab:AddSection({
	Name = "Cheat Players (Troll)"
})

Tab:AddButton({
Name = "Assassin",
	Callback = function()
	--Assain
 
	local args = {
    [1] = "wear",
    [2] = 15133320948
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end
})
Tab:AddButton({
Name = "Small Men",
	Callback = function()
	--Assain
 
	local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 14731377941,
        [2] = 14731377894,
        [3] = 14731377875,
        [4] = 14731384498,
        [5] = 14731377938,
        [6] = 0
    },
    [3] = "Stick Bug"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
--Man
 
local args = {
    [1] = "wear",
    [2] = 6564572490
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
--speed
 
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 90
end
})
Tab:AddButton({
Name = "See the entire city of Brookhaven",
     Callback = function()
     local plr = game.Players.LocalPlayer
local char = plr.Character
local hrp = char.HumanoidRootPart
 
hrp.CFrame = CFrame.new(-157.49581909179688, 136.7017364501953, 123.78034210205078) 
       --block
       -- Create a new part
local redBlock = Instance.new("Part")
 
-- Set the properties of the part
redBlock.Size = Vector3.new(4, 2, 3) -- Adjust the size as needed
redBlock.Color = Color3.fromRGB(255, 0, 0) -- Set the color to red
redBlock.Position = Vector3.new(0, 10, 0) -- Adjust the position as needed
 
-- Parent the part to the workspace so it appears in the game
redBlock.Parent = game.Workspace
end
})
    
local Section = Tab:AddSection({
	Name = "head"
})
Tab:AddButton({
	Name = "Headless",
	Callback = function()
      		local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 134082579
    },
    [3] = "by:REDz"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
  	end    
})
local Section = Tab:AddSection({
	Name = "Characters"
})
Tab:AddButton({
	Name = "The Overseer",
	Callback = function()
	local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 81725326,
        [2] = 81725366,
        [3] = 81725392,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "by:REDz"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
end
})
Tab:AddButton({
	Name = "French fries gang",
	Callback = function()
	local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 5392155773,
        [2] = 5392150804,
        [3] = 5392146467,
        [4] = 5392152751,
        [5] = 5392148570,
        [6] = 1
    },
    [3] = "by:REDz"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
end
})    
Tab:AddButton({
	Name = "Korblox",
	Callback = function()
      		local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 139607770,
        [2] = 139607625,
        [3] = 139607570,
        [4] = 139607718,
        [5] = 139607673,
        [6] = 1
    },
    [3] = "by:REDz"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
  	end    
})
Tab:AddButton({
	Name = "Ice Knight",
	Callback = function()
      		local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 139572697,
        [3] = 139572600,
        [4] = 139572888,
        [5] = 139572789,
        [6] = 139572973
    },
    [3] = "by:REDz"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
  	end    
})
local Section = Tab:AddSection({
	Name = "Dominus"
})
Tab:AddButton({
	Name = "Dominus Frigidus",
	Callback = function()
    local args = {
    [1] = "wear",
    [2] = 48545806
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
  	end    
})
Tab:AddButton({
Name = "Dominus infernus",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 31101391
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "Dominus Empyreus",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 64444871
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "Dominus Empyreus",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 21070012
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "Dominus Astra",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 162067148
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddDropdown({
	Name = "Dominus Fake",
	Default = "1",
	Options = {"Dominus Chocolate",},
	Callback = function(Value)
local args = {
    [1] = "wear",
    [2] = 16392602102
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
	end    
})
local Section = Tab:AddSection({
	Name = "Valk"
})
Tab:AddButton({
Name = "Valk Violet",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 1402432199
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "Valk Emerald",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 2830437685
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "Valk Ice",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 4390891467
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "Valk Shine Time",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 1180433861
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})

local Tab = Window:MakeTab({
	Name = "House",
	Icon = "rbxassetid://10723407389",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "House"
})
Tab:AddButton({
Name = "Delete Home",
     Callback = function()
	local args = {
    [1] = "PlayerSellHouse"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sHous1eChoic1e"):FireServer(unpack(args))
   end
})
local Section = Tab:AddSection({
	Name = "House Config"
})
Tab:AddButton({
Name = "Open/Close Windows",
     Callback = function()
	local args = {
    [1] = "Curtains"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sHous1e"):FireServer(unpack(args))
   end
})
Tab:AddButton({
Name = "Lock/Unlock Doors",
     Callback = function()
	local args = {
    [1] = "LockDoors"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sHous1e"):FireServer(unpack(args))
   end
})
Tab:AddButton({
Name = "Open/Close Garage",
     Callback = function()
	local args = {
    [1] = "GarageDoor"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sHous1e"):FireServer(unpack(args))
   end
})
local Section = Tab:AddSection({
	Name = "Fire House"
})
Tab:AddButton({
Name = "FIRE ON",
     Callback = function()
	local args = {
    [1] = "PlayerWantsFireOnFirePassNotShowingAnyone"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sHous1e"):FireServer(unpack(args))
   end
})   
local Tab = Window:MakeTab({
	Name = "Troling",
	Icon = "rbxassetid://2005276185",
	PremiumOnly = false
})   

 local Section = Tab:AddSection({
	Name = "Super Small"
})
Tab:AddButton({
Name = "Stay Small",
     Callback = function()
	local args = {
    [1] = "CharacterSizeDown",
    [2] = 4
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
end
})
Tab:AddButton({
Name = "Back to Size",
     Callback = function()
	local args = {
    [1] = "CharacterSizeUp",
    [2] = 1
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
end
})  
Tab:AddButton({
Name = "Rainbow Ghost",
     Callback = function()
     --Size
     
     local args = {
    [1] = "CharacterSizeDown",
    [2] = 4
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))

--Item

local args = {
    [1] = "wear",
    [2] = 173624651
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))

--outro

local args = {
    [1] = "wear",
    [2] = 141742418
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end
}) 
local Section = Tab:AddSection({
	Name = "Player"
})

Tab:AddButton({
	Name = "Reset (click K)",
	Callback = function()
      		--This script was made for you to be able to kill/"reset" your character if resetting your character is not an option, or has 
--been taken out. This script will also work as a suicide command.

-- Function to handle player's death
local function forceResetAction()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.Health = 0
    end
end

-- Bind the function to a keyboard input (e.g., press 'K' to kill)
game:GetService("UserInputService").InputBegan:Connect(function(input, isProcessed)
    if isProcessed then
        return
    end

    if input.KeyCode == Enum.KeyCode.K then
        forceResetAction()
    end
end)

  	end    
})
    
Tab:AddButton({
	Name = "FlingGUI",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/ATJMjc8v", true))()
  	end    
})

Tab:AddButton({
	Name = "View People GUI",
	Callback = function()
      		--Made by N3xul
local runDummyScript = function(f,scri)
local oldenv = getfenv(f)
local newenv = setmetatable({}, {
__index = function(_, k)
if k:lower() == 'script' then
return scri
else
return oldenv[k]
end
end
})
setfenv(f, newenv)
ypcall(function() f() end)
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting")) 
mas.Name = "CompiledModel"
o1 = Instance.new("ScreenGui")
o2 = Instance.new("Frame")
o3 = Instance.new("TextButton")
o4 = Instance.new("TextButton")
o5 = Instance.new("TextLabel")
o6 = Instance.new("ImageButton")
o7 = Instance.new("LocalScript")
o1.Name = "SpectateGui"
o1.Parent = mas
o2.Name = "Bar"
o2.Parent = o1
o2.Position = UDim2.new(-1,-100,0.87999999523163,-50)
o2.Size = UDim2.new(0,200,0,50)
o2.Position = UDim2.new(-1,-100,0.87999999523163,-50)
o2.BackgroundColor3 = Color3.new(0, 0, 0)
o2.BackgroundTransparency = 0.20000000298023
o2.BorderSizePixel = 5
o3.Name = "Previous"
o3.Parent = o2
o3.Size = UDim2.new(0.25,0,1,0)
o3.Text = "<"
o3.BackgroundColor3 = Color3.new(0.52549, 0.52549, 0.52549)
o3.BorderColor3 = Color3.new(0.509804, 0.796079, 1)
o3.BorderSizePixel = 0
o3.Font = Enum.Font.SourceSans
o3.FontSize = Enum.FontSize.Size48
o3.TextColor3 = Color3.new(1, 1, 1)
o4.Name = "Next"
o4.Parent = o2
o4.Position = UDim2.new(1,0,0,0)
o4.Size = UDim2.new(-0.25,0,1,0)
o4.Text = ">"
o4.Position = UDim2.new(1,0,0,0)
o4.BackgroundColor3 = Color3.new(0.52549, 0.52549, 0.52549)
o4.BorderColor3 = Color3.new(0.509804, 0.796079, 1)
o4.BorderSizePixel = 0
o4.Font = Enum.Font.SourceSans
o4.FontSize = Enum.FontSize.Size48
o4.TextColor3 = Color3.new(1, 1, 1)
o5.Name = "Title"
o5.Parent = o2
o5.Position = UDim2.new(0.27500000596046,0,0,0)
o5.Size = UDim2.new(0.44999998807907,0,1,0)
o5.Text = ""
o5.Position = UDim2.new(0.27500000596046,0,0,0)
o5.BackgroundColor3 = Color3.new(1, 1, 1)
o5.BackgroundTransparency = 1
o5.Font = Enum.Font.SourceSans
o5.FontSize = Enum.FontSize.Size14
o5.TextColor3 = Color3.new(1, 1, 1)
o5.TextScaled = true
o5.TextWrapped = true
o6.Name = "Button"
o6.Parent = o1
o6.Position = UDim2.new(0,0,0.5,-25)
o6.Size = UDim2.new(0,50,0,50)
o6.Position = UDim2.new(0,0,0.5,-25)
o6.BackgroundColor3 = Color3.new(1, 1, 1)
o6.BackgroundTransparency = 0.30000001192093
o6.BorderSizePixel = 5
o6.Image = "http://www.roblox.com/asset/?id=176106970"
o7.Parent = o1
table.insert(cors,coroutine.create(function()
wait()
runDummyScript(function()
-- By Wojtes_BMW

cam = game.Workspace.CurrentCamera

local bar = script.Parent.Bar
local title = bar.Title
local prev = bar.Previous
local nex = bar.Next
local button = script.Parent.Button

function get()
	for _,v in pairs(game.Players:GetPlayers())do
		if v.Name == title.Text then
			return(_)
		end
	end
end


local debounce = false
button.MouseButton1Click:connect(function()
	if debounce == false then debounce = true
		bar:TweenPosition(UDim2.new(.5,-100,0.88,-50),"In","Linear",1,true)
		pcall(function()
				title.Text = game.Players:GetPlayerFromCharacter(cam.CameraSubject.Parent).Name
		end)
	elseif debounce == true then debounce = false
		pcall(function() cam.CameraSubject = game.Players.LocalPlayer.Character.Humanoid end)
			bar:TweenPosition(UDim2.new(-1,-100,0.88,-50),"In","Linear",1,true)
		end
end)

prev.MouseButton1Click:connect(function()
	wait(.1)
	local players = game.Players:GetPlayers()
	local num = get()
	if not pcall(function() 
		cam.CameraSubject = players[num-1].Character.Humanoid
		end) then
		cam.CameraSubject = players[#players].Character.Humanoid
	end
pcall(function()
				title.Text = game.Players:GetPlayerFromCharacter(cam.CameraSubject.Parent).Name
		end)
end)

nex.MouseButton1Click:connect(function()
	wait(.1)
	local players = game.Players:GetPlayers()
	local num = get()
	if not pcall(function() 
		cam.CameraSubject = players[num+1].Character.Humanoid
		end) then
		cam.CameraSubject = players[1].Character.Humanoid
	end
pcall(function()
				title.Text = game.Players:GetPlayerFromCharacter(cam.CameraSubject.Parent).Name
		end)
end)


end,o7)
end))
mas.Parent = workspace
mas:MakeJoints()
local mas1 = mas:GetChildren()
for i=1,#mas1 do
	mas1[i].Parent = game:GetService("Players").LocalPlayer.PlayerGui 
	ypcall(function() mas1[i]:MakeJoints() end)
end
mas:Destroy()
for i=1,#cors do
coroutine.resume(cors[i])
end
  	end    
})

Tab:AddButton({
Name = "TP ALL (Take the Sofa in hand)",
     Callback = function()
--Fling aall

loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
   end
}) 
Tab:AddSlider({
	Name = "SpeedWalk",
	Min = 16,
	Max = 500,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 10,
	ValueName = "Speed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
	end    
})

--[[
Name = <string> - The name of the slider.
Min = <number> - The minimal value of the slider.
Max = <number> - The maxium value of the slider.
Increment = <number> - How much the slider will change value when dragging.
Default = <number> - The default value of the slider.
ValueName = <string> - The text after the value number.
Callback = <function> - The function of the slider.
]]

Tab:AddSlider({
	Name = "JumpPower",
	Min = 50,
	Max = 500,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 10,
	ValueName = "Jump",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
	end    
})

--[[
Name = <string> - The name of the slider.
Min = <number> - The minimal value of the slider.
Max = <number> - The maxium value of the slider.
Increment = <number> - How much the slider will change value when dragging.
Default = <number> - The default value of the slider.
ValueName = <string> - The text after the value number.
Callback = <function> - The function of

    

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

OrionLib:MakeNotification({
	Name = "Welcome to Sander X",
	Content = "This hub was created by Wojtes_BMW",
	Image = "rbxassetid://10734972463",
	Time = 5
})

local Tab = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://17390185422",
    PremiumOnly = false
})
local Section = Tab:AddSection({
    Name = "Teleport map"
})
Tab:AddButton({
	Name = "Teleport to Spawn",
	Callback = function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4, 4, 2)
  	end    
})
Tab:AddButton({
	Name = "Brookhaven Electric",
	Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(236, 4, 829)
  	end    
})
Tab:AddButton({
	Name = "Inside Electric",
	Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(235, 5, 812)
  	end    
})
-- Teleport to Criminal Button Function
local function teleportToCriminal()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-119, -28, 235)
end

Tab:AddButton({
    Name = "Criminal",
    Description = "Teleport to Criminal coordinates",
    Callback = function()
        teleportToCriminal()
    end
})
-- Teleport to Agency Base 1 Button Function
local function teleportToAgencyBase1()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(178, 3, -427)
end

-- Teleport to Agency Base 1 Button
Tab:AddButton({
    Name = "Teleport to Agency Base 1",
    Description = "Teleport to Agency Base 1 coordinates",
    Callback = function()
        teleportToAgencyBase1()
    end
})

-- Teleport to House Abandoned Button Function
local function teleportToHouseAbandoned()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(986, 4, 63)
end

Tab:AddButton({
	Name = "Teleport to secret agency room",
	Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-337, 17, 56)
  	end    
})
Tab:AddButton({
    Name = "House Abandoned",
    Description = "Teleport to House Abandoned coordinates",
    Callback = function()
        teleportToHouseAbandoned()
    end
})

-- Teleport to Portal Agency Button Function
local function teleportToPortalAgency()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(672, 4, -296)
end

Tab:AddButton({
    Name = "Portal Agency",
    Description = "Teleport to Portal Agency coordinates",
    Callback = function()
        teleportToPortalAgency()
    end
})
-- Teleport to Hospital Button Function
local function teleportToHospital()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-309, 4, 71)
end

Tab:AddButton({
    Name = "Hospital",
    Description = "Teleport to the coordinates of the Hospital",
    Callback = function()
        teleportToHospital()
    end
})

-- Teleport to Arch Button Function
local function teleportToArch()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-589, 141, -59)
end

Tab:AddButton({
    Name = "Arcada",
    Description = "Teleport to the coordinates of the Arc",
    Callback = function()
        teleportToArch()
    end
})
-- Function to teleport to On Top of School
local function teleportToOnTopOfSchool()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-370, 50, 173)
end

Tab:AddButton({
    Name = "Above the School",
    Description = "Teleports to the coordinates Above the School",
    Callback = function()
        teleportToOnTopOfSchool()
    end
})
Tab:AddButton({
	Name = "Teleport to above the hotel",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(233, 38, 214)
  	end    
})
Tab:AddButton({
	Name = "Inside the apartment",
	Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8, 20, -161)
  	end    
})
Tab:AddButton({
Name = "See the entire city of Brookhaven",
     Callback = function()
     local plr = game.Players.LocalPlayer
local char = plr.Character
local hrp = char.HumanoidRootPart

hrp.CFrame = CFrame.new(-157.49581909179688, 136.7017364501953, 123.78034210205078) 
end
})
Tab:AddButton({
	Name = "Stay on top of the shopping mall",
	Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144, 41, -148)		
  	end    
})
Tab:AddButton({
	Name = "cemetery",
	Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-483.2502746582031, 4.351785659790039, 51.08787155151367)
  	end    
})
-- Function to teleport to Mountain 1
local function teleportToMountain1()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-670, 251, 765)
end

Tab:AddButton({
    Name = "Montain",
    Description = "Teleports to the coordinates of Mountain",
    Callback = function()
        teleportToMountain1()
    end
})
local Section = Tab:AddSection({
	Name = "Bank Brookhaven"
})
Tab:AddButton({
Name = "Bank Job",
     Callback = function()
     local args = {
    [1] = "GiveJobUIMenu",
    [2] = "5183368649",
    [3] = "17441252635",
    [4] = true
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Jo1b"):FireServer(unpack(args))
     end
})
Tab:AddButton({
Name = "Rob bank",
     Callback = function()
     local plr = game.Players.LocalPlayer
local char = plr.Character
local hrp = char.HumanoidRootPart

hrp.CFrame = CFrame.new(-6.593982696533203, 17.95779800415039, 269.07952880859375) 

--get bomb

local args = {
    [1] = "PickingTools",
    [2] = "Bomb"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
      end
})
Tab:AddButton({
    Name = "Get Banco Chave",
    Callback = function()
local args = {
    [1] = "PickingTools",
    [2] = "BankKeyCard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
      end    
})
local Section = Tab:AddSection({
	Name = "Secret"
})
Tab:AddButton({
	Name = "Teleport to Secret place on the beach",
	Callback = function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-279, 22, 1116)
  	end    
})
-- Teleport to Secret Location Button Function
local function teleportToSecretLocation()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(505, -75, 143)
end

Tab:AddButton({
    Name = "Secret Location",
    Description = "Teleport to Secret Location coordinates",
    Callback = function()
        teleportToSecretLocation()
    end
})
Tab:AddButton({
Name = "Secret 1",
     Callback = function()
     local plr = game.Players.LocalPlayer
local char = plr.Character
local hrp = char.HumanoidRootPart

hrp.CFrame = CFrame.new(223.24264526367188, -37.5954704284668, -153.50656127929688) 
end 
})
Tab:AddButton({
Name = "Secret 2 (Mansion)",
     Callback = function()
     local plr = game.Players.LocalPlayer
local char = plr.Character
local hrp = char.HumanoidRootPart

hrp.CFrame = CFrame.new(-350.3148498535156, 45.385169982910156, -123.7399673461914) 
end
})
Tab:AddButton({
Name = "Secret 3 (police station )",
     Callback = function()
     local plr = game.Players.LocalPlayer
local char = plr.Character
local hrp = char.HumanoidRootPart

hrp.CFrame = CFrame.new(-151.79331970214844, 22.575626373291016, 7.7789154052734375) 
end
})
-- Teleport to Secret Room in Workshop Button Function
local function teleportToSecretRoomInWorkshop()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 4, -495)
end

Tab:AddButton({
    Name = "Secret",
    Description = "Teleports to the coordinates of the Secret Room Workshop",
    Callback = function()
        teleportToSecretRoomInWorkshop()
    end
})

-- Teleport to Secret Room 2 Button Function
local function teleportToSecretRoom2()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-343, 4, -613)
end

Tab:AddButton({
    Name = "Secret 2",
    Description = "Teleports to the coordinates of Secret Room 2",
    Callback = function()
        teleportToSecretRoom2()
    end
})
Tab:AddButton({
	Name = "Limbo platform",
	Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17.99738883972168, -28.77614974975586, -61.85468673706055)
  	end    
})
Tab:AddButton({
	Name = "X-ray",
	Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-349, 4.438033580780029, 98)
  	end    
})
Tab:AddButton({
	Name = "Inside the X-RAY",
	Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-57.210060119628906, -11.819289207458496, 109.7131729125976)
  	end    
})
Tab:AddButton({
	Name = "Under the boat",
	Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108.2221450805664, 0.3154836893081665, 873.8525390625)
  	end    
})
Tab:AddButton({
	Name = "Under the start",
	Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-26, -8.490150451660156, 14)
  	end    
})
local Section = Tab:AddSection({
	Name = "billboard"
})
Tab:AddButton({
Name = "BillBoard 1",
     Callback = function()
     local plr = game.Players.LocalPlayer
local char = plr.Character
local hrp = char.HumanoidRootPart

hrp.CFrame = CFrame.new(-242.68215942382812, 89.68680572509766, -549.6495361328125) 
end
})
Tab:AddButton({
Name = "BillBoard 2",
     Callback = function()
     local plr = game.Players.LocalPlayer
local char = plr.Character
local hrp = char.HumanoidRootPart

hrp.CFrame = CFrame.new(-630.480712890625, 26.586822509765625, 365.14093017578125) 
end
})
Tab:AddButton({
	Name = "BillBoard 3",
	Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(447, 64, 510)
  	end    
})
local Section = Tab:AddSection({
	Name = "Other"
})
Tab:AddButton({
	Name = "Portal",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Portal'))()
  	end    
})
local Tab = Window:MakeTab({
    Name = "ESP Menu",
    Icon = "rbxassetid://17390182703"
})

    Tab:AddSection({
    Name = "Esp toggle. What to see Players through the wall:"
})

--Variables
local camera = workspace.CurrentCamera;
local CoreGui = game:GetService("CoreGui");
local uis = game:GetService("UserInputService");
local run = game:GetService("RunService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
 
local plyr = game.Players.LocalPlayer;
local mouse = plyr:GetMouse();
local char = plyr.Character or plyr.CharacterAdded:Wait();
local hrp = char:WaitForChild("HumanoidRootPart", math.huge);
local hum = char:WaitForChild("Humanoid", math.huge);
 
--Functions
plyr.CharacterAdded:Connect(function(New_Char)
    char = New_Char;
    hrp = New_Char:WaitForChild("HumanoidRootPart", math.huge);
    hum = New_Char:WaitForChild("Humanoid", math.huge);
end)
 
--//Esp
local esp_conn_1 = nil;
local esp_conn_2 = nil;
local esp_conn_3 = nil;
 
local esp_transparency = 0.5;
local esp_blacklist_team = false;
local esp_enabled = false;
local esp_strict_team_blacklist = false;
 
function esp_update_esp_t()
    for _, v in pairs(CoreGui:GetChildren()) do
        if string.find(v.Name, "_ESP") and v:IsA("Folder") then
            for _, v in pairs(v:GetChildren()) do
                if v:IsA("BoxHandleAdornment") then
                    v.Transparency = esp_transparency;
                end
            end
        end
    end
end
 
function esp_update_esp_b(toggle_main)
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= plyr then
            local function esp_update_start(toggle)
                local folder = CoreGui:FindFirstChild(v.Name.."_ESP");
                if toggle then
                    if folder then
                        for _, t in pairs(folder:GetChildren()) do
                            if t:IsA("BoxHandleAdornment") then
                                t:Destroy();
                            end
                        end
                    end
                else
                    if not folder then
                        folder = Instance.new("Folder", CoreGui);
                        folder.Name = v.Name.."_ESP";
                    end
                    if folder and #folder:GetChildren() <= 0 then
                        if esp_enabled then
                            local v_char = v.Character;
                            if v_char then
                                for _, t in pairs(v_char:GetChildren()) do
                                    if t:IsA("BasePart") then
                                        local bha = Instance.new("BoxHandleAdornment", folder);
                                        bha.Adornee = t;
                                        bha.Size = t.Size;
                                        bha.ZIndex = 10;
                                        bha.Transparency = esp_transparency;
                                        bha.AlwaysOnTop = true;
                                        bha.Color = v.TeamColor;
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if toggle_main then
                if (v.TeamColor ~= plyr.TeamColor) then
                    if (esp_strict_team_blacklist == true) then
                        if (v.Team ~= plyr.Team) then
                            esp_update_start(false);
                        else
                            esp_update_start(true);
                        end
                    else
                        esp_update_start(false);
                    end
                else
                    esp_update_start(true);
                end
            else
                esp_update_start(false);
            end
        end
    end
end
 
function ToggleEsp(toggle)
    if toggle then
        local function Esp_PlayerFound(p)
            local esp_char_conn1 = nil;
            local esp_char_conn2 = nil;
            local esp_plyr_conn1 = nil;
            local folder = CoreGui:FindFirstChild(p.Name.."_ESP");
            if not folder then
                folder = Instance.new("Folder", CoreGui);
                folder.Name = p.Name.."_ESP";
            end
            if p ~= plyr then
                local function esp_disconnect_functions()
                    pcall(function()
                        esp_char_conn1:Disconnect();
                        esp_char_conn2:Disconnect();
                        esp_plyr_conn1:Disconnect();
                    end)
                    esp_char_conn1 = nil;
                    esp_char_conn2 = nil;
                    esp_plyr_conn1 = nil;
                end
                local function Esp_CharFound(c)
                    if not toggle then
                        esp_disconnect_functions();
                        return;
                    end
                    if esp_blacklist_team == true then
                        if (p.TeamColor == plyr.TeamColor) then
                            if esp_strict_team_blacklist == true then
                                if (p.Team == plyr.Team) then
                                    return;
                                end
                            else
                                return;
                            end
                        end
                    end
                    task.spawn(function()
                        task.wait();
                        for _, v in pairs(c:GetChildren()) do
                            if v:IsA("BasePart") then
                                local bha = Instance.new("BoxHandleAdornment", folder);
                                bha.Adornee = v;
                                bha.Size = v.Size;
                                bha.ZIndex = 10;
                                bha.Transparency = esp_transparency;
                                bha.AlwaysOnTop = true;
                                bha.Color = p.TeamColor;
                            end
                        end
                    end)
                    esp_char_conn2 = c.ChildAdded:Connect(function(child)
                        if child:IsA("BasePart") then
                            if folder then
                                local bha = Instance.new("BoxHandleAdornment", folder);
                                bha.Adornee = child;
                                bha.Size = child.Size;
                                bha.ZIndex = 10;
                                bha.Transparency = esp_transparency;
                                bha.AlwaysOnTop = true;
                                bha.Color = p.TeamColor;
                            end
                        end
                    end)
                end
                if p.Character then
                    Esp_CharFound(p.Character);
                end
                esp_char_conn1 = p.CharacterAdded:Connect(Esp_CharFound);
                esp_plyr_conn1 = p.Changed:Connect(function(property)
                    if property == "TeamColor" then
                        if folder then
                            for _, v in pairs(folder:GetChildren()) do
                                if v:IsA("BoxHandleAdornment") then
                                    v.Color = p.TeamColor;
                                end
                            end
                        end
                    end
                    if property == "Team" then
                        if folder then
                            for _, v in pairs(folder:GetChildren()) do
                                if v:IsA("BoxHandleAdornment") then
                                    v.Color = p.TeamColor;
                                end
                            end
                        end
                        esp_update_esp_b(esp_blacklist_team);
                    end
                end)
            end
        end
        for _, v in pairs(game.Players:GetPlayers()) do
            Esp_PlayerFound(v);
        end
        esp_conn_1 = game.Players.PlayerAdded:Connect(function(plyr)
            Esp_PlayerFound(plyr);
        end)
        esp_conn_2 = game.Players.PlayerRemoving:Connect(function(p)
            local gui_found = CoreGui:FindFirstChild(p.Name.."_ESP");
            if gui_found then
                gui_found:Destroy();
            end
        end)
        esp_conn_3 = plyr.Changed:Connect(function(property)
            if property == "Team" or property == "TeamColor" then
                ToggleEsp(false);
                task.wait();
                if esp_enabled == true then
                    ToggleEsp(true);
                end
            end
        end)
    else
        pcall(function()
            esp_conn_1:Disconnect();
        end)
        esp_conn_1 = nil;
        pcall(function()
            esp_conn_2:Disconnect();
        end)
        esp_conn_2 = nil;
        pcall(function()
            esp_conn_3:Disconnect();
        end)
        esp_conn_3 = nil;
        for _, v in pairs(CoreGui:GetChildren()) do
            if string.find(v.Name, "_ESP") and v:IsA("Folder") then
                v:Destroy();
            end
        end
    end
end
--//
local Default_Disable = false;
Tab:AddToggle({
    Name = "Esp",
    Default = false,
    Callback = function(Value)
        if Default_Disable == false then
            Default_Disable = true;
            return;
        end
        esp_enabled = Value;
        ToggleEsp(Value);
    end    
})
--Variables
local camera = workspace.CurrentCamera;
local CoreGui = game:GetService("CoreGui");
local uis = game:GetService("UserInputService");
local run = game:GetService("RunService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
 
local plyr = game.Players.LocalPlayer;
local mouse = plyr:GetMouse();
local char = plyr.Character or plyr.CharacterAdded:Wait();
local hrp = char:WaitForChild("HumanoidRootPart", math.huge);
local hum = char:WaitForChild("Humanoid", math.huge);
 
--Functions
plyr.CharacterAdded:Connect(function(New_Char)
    char = New_Char;
    hrp = New_Char:WaitForChild("HumanoidRootPart", math.huge);
    hum = New_Char:WaitForChild("Humanoid", math.huge);
end)
 
local Default_Disable = false;
Tab:AddSlider({
	Name = "Esp Box Transparency",
	Min = 0,
	Max = 1,
	Default = 0.5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 0.1,
	ValueName = "Transparency",
	Callback = function(Value)
        if Default_Disable == false then
            Default_Disable = true;
            return;
        end
		esp_transparency = Value;
        esp_update_esp_t();
	end    
})
Tab:AddButton({
	Name = "Esp Hack",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/E0f9BeRH"))()
  	end    
})   

Tab:AddSection({
    Name = "Colors ESP"
})
    
local espEnabled = false
local playerLabels = {}
 
local function toggleESP()
    espEnabled = not espEnabled
    if espEnabled then
        print("ESP activated!")
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Head") then
                local playerNameLabel = Instance.new("BillboardGui")
                playerNameLabel.Name = "PlayerNameLabel"
                playerNameLabel.AlwaysOnTop = true
                playerNameLabel.Size = UDim2.new(0, 100, 0, 20)
                playerNameLabel.StudsOffset = Vector3.new(0, 2, 0)
                playerNameLabel.Adornee = player.Character:FindFirstChild("Head")
 
local playerNameText = Instance.new("TextLabel")
                playerNameText.Name = "PlayerName"
                playerNameText.Text = player.Name
                playerNameText.Size = UDim2.new(1, 0, 1, 0)
                playerNameText.TextColor3 = Color3.fromRGB(0, 0, 0) -- Azul
                playerNameText.BackgroundTransparency = 1
                playerNameText.Font = Enum.Font.SourceSansSemibold
                playerNameText.TextSize = 16
                playerNameText.Parent = playerNameLabel
 
                playerNameLabel.Parent = game.CoreGui
                playerLabels[player.Name] = playerNameLabel
            end
        end
    else
        print("ESP desativado!")
        for playerName, playerNameLabel in pairs(playerLabels) do
            playerNameLabel:Destroy()
            playerLabels[playerName] = nil
        end
    end
end
 
Tab:AddButton({
    Name = "ESP Black",
    Description = "Activate and deactivate player name ESP",
    Callback = function()
        toggleESP()
    end
})
-- Variável para verificar se o recurso ESP V3 está ativo
local espV3Enabled = false
 
-- Dicionário para armazenar os rótulos dos jogadores
local playerLabels = {}
 
-- Cor única para os nomes dos jogadores
local nameColor = Color3.new(1, 0, 0) -- Vermelho
local outlineColor = Color3.new(0, 0, 0) -- Preto
 
-- Função para ativar ou desativar o ESP V3
local function toggleEspV3()
    espV3Enabled = not espV3Enabled
 
    if espV3Enabled then
        print("ESP V3 ativado!")
        -- Adiciona rótulos de nome para todos os jogadores
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Head") then
                local head = player.Character:FindFirstChild("Head")
 
                -- Cria um rótulo de nome sobre a cabeça do jogador
                local playerNameLabel = Instance.new("BillboardGui")
                playerNameLabel.Name = "PlayerNameLabel"
                playerNameLabel.AlwaysOnTop = true
                playerNameLabel.Size = UDim2.new(0, 100, 0, 20)
                playerNameLabel.StudsOffset = Vector3.new(0, 2, 0)
                playerNameLabel.Adornee = head
 
                local playerNameText = Instance.new("TextLabel")
                playerNameText.Name = "PlayerName"
                playerNameText.Text = player.Name
                playerNameText.Size = UDim2.new(1, 0, 1, 0)
                playerNameText.TextColor3 = nameColor
                playerNameText.BackgroundTransparency = 1
                playerNameText.Font = Enum.Font.SourceSansSemibold
                playerNameText.TextSize = 16
 
                -- Adiciona uma borda preta ao texto
                playerNameText.TextStrokeTransparency = 0 -- Borda preta visível
                playerNameText.TextStrokeColor3 = outlineColor
 
                playerNameText.Parent = playerNameLabel
 
                -- Adiciona o rótulo ao dicionário playerLabels
                playerLabels[player.Name] = playerNameLabel
 
                -- Define o rótulo como filho da cabeça do jogador
                playerNameLabel.Parent = head
            end
        end
    else
        print("ESP V3 desativado!")
        -- Remove os rótulos sobre as cabeças dos jogadores
        for _, playerLabel in pairs(playerLabels) do
            if playerLabel then
                playerLabel:Destroy()
            end
        end
        -- Limpa o dicionário playerLabels
        playerLabels = {}
    end
end
 
-- Adiciona o botão "ESP V2" à seção ESP
Tab:AddButton({
    Name = "ESP Red",
    Description = "Red Nick Players ",
    Callback = function()
        toggleEspV3()
    end
})
 
local espEnabled = false
local playerLabels = {}
 
local function toggleESPWithLines()
    espEnabled = not espEnabled
    if espEnabled then
        print("ESP with lines activated!")
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Head") then
                local torso = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local head = player.Character:FindFirstChild("Head")
                if torso and head then
                    local line = Instance.new("LineHandleAdornment")
                    line.Adornee = torso
                    line.Color3 = Color3.new(0, 0, 0) -- Preto
                    line.Thickness = 1 -- Espessura da linha
                    line.Transparency = 0.5 -- Transparência da linha
                    line.Parent = torso
 
                    -- Atualiza a posição da linha para a cabeça do jogador
                    line.CFrame = CFrame.new(torso.Position, head.Position)
 
                    -- Adiciona o nome do jogador com uma borda preta e texto branco
                    local playerNameLabel = Instance.new("BillboardGui")
                    playerNameLabel.Name = "PlayerNameLabel"
                    playerNameLabel.AlwaysOnTop = true
                    playerNameLabel.Size = UDim2.new(0, 100, 0, 20)
                    playerNameLabel.StudsOffset = Vector3.new(0, 2, 0)
                    playerNameLabel.Adornee = head
 
                    local playerNameText = Instance.new("TextLabel")
                    playerNameText.Name = "PlayerName"
                    playerNameText.Text = player.Name
                    playerNameText.Size = UDim2.new(1, 0, 1, 0)
                    playerNameText.TextColor3 = Color3.new(1, 1, 1) -- Branco
                    playerNameText.BackgroundTransparency = 1
                    playerNameText.Font = Enum.Font.SourceSansSemibold
                    playerNameText.TextSize = 16
                    playerNameText.Parent = playerNameLabel
 
                    -- Adiciona a borda preta
                    local playerNameOutline = playerNameText:Clone()
                    playerNameOutline.TextColor3 = Color3.new(0, 0, 0) -- Preto
                    playerNameOutline.Position = UDim2.new(0, -1, 0, -1)
                    playerNameOutline.Parent = playerNameLabel
 
                    playerNameLabel.Parent = game.CoreGui
                    playerLabels[player.Name] = playerNameLabel
                end
            end
        end
    else
        print("ESP com linhas desativado!")
        for playerName, playerNameLabel in pairs(playerLabels) do
            playerNameLabel:Destroy()
            playerLabels[playerName] = nil
        end
    end
end
 
Tab:AddButton({
    Name = "ESP Black with White",
    Description = "Enables and disables player lines for all players' heads",
    Callback = function()
        toggleESPWithLines()
    end
})
local espEnabled = false
local playerLabels = {}
 
local function toggleESP()
    espEnabled = not espEnabled
    if espEnabled then
        print("ESP activated!")
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Head") then
                local playerNameLabel = Instance.new("BillboardGui")
                playerNameLabel.Name = "PlayerNameLabel"
                playerNameLabel.AlwaysOnTop = true
                playerNameLabel.Size = UDim2.new(0, 100, 0, 20)
                playerNameLabel.StudsOffset = Vector3.new(0, 2, 0)
                playerNameLabel.Adornee = player.Character:FindFirstChild("Head")
 
local playerNameText = Instance.new("TextLabel")
                playerNameText.Name = "PlayerName"
                playerNameText.Text = player.Name
                playerNameText.Size = UDim2.new(1, 0, 1, 0)
                playerNameText.TextColor3 = Color3.fromRGB(48, 252, 3) -- Azul
                playerNameText.BackgroundTransparency = 1
                playerNameText.Font = Enum.Font.SourceSansSemibold
                playerNameText.TextSize = 16
                playerNameText.Parent = playerNameLabel
 
                playerNameLabel.Parent = game.CoreGui
                playerLabels[player.Name] = playerNameLabel
            end
        end
    else
        print("ESP deactivated!")
        for playerName, playerNameLabel in pairs(playerLabels) do
            playerNameLabel:Destroy()
            playerLabels[playerName] = nil
        end
    end
end
 
Tab:AddButton({
    Name = "ESP Green",
    Description = "Activate and deactivate player name ESP",
    Callback = function()
        toggleESP()
    end
})

local Tab = Window:MakeTab({
	Name = "Skins",
	Icon = "rbxassetid://7743876054",
	PremiumOnly = false
})   

local Section = Tab:AddSection({
	Name = "Reset Avatar"
})
Tab:AddButton({
	Name = "Refresh Character",
	Callback = function()
local args = {
    [1] = "OCA"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
end
})   

local Section = Tab:AddSection({
	Name = "Horror skins"
})
Tab:AddButton({
Name = "Jeff The killer",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 14502327402
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "Smile Dog",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 14761007249
}
                
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "Mario Victim 1",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 14732524763
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "Jermas Eyes",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 14817978441
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})              
Tab:AddButton({
Name = "SCP-096 ",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 14952594200
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "Scary Girl",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 14567023223
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "Eyes",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 14701936208
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
local Section = Tab:AddSection({
	Name = "Meme skins"
})

Tab:AddButton({
Name = "cashOh Bro",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 17040765338
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})  
Tab:AddButton({
Name = "Nikocado Avocado",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 15036970502
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})  

Tab:AddButton({
Name = "Shrek",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 15105007162
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})     
Tab:AddButton({
Name = "Arab WallTuh",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 14605941742
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "Sigma Dog",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 17198646013
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "Black Man",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 17378489658
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
    Tab:AddButton({
Name = "Socked Guy",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 14952570512
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "BackRooms",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 14808582694
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})

Tab:AddButton({
Name = "Jerma Guy",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 14931045983
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
}) 
local Section = Tab:AddSection({
	Name = "Meme skins"
})

Tab:AddButton({
Name = "cashOh Bro",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 17040765338
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})  
Tab:AddButton({
Name = "Nikocado Avocado",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 15036970502
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})  

Tab:AddButton({
Name = "Shrek",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 15105007162
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})     
Tab:AddButton({
Name = "Arab WallTuh",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 14605941742
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "Sigma Dog",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 17198646013
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "Black Man",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 17378489658
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
    Tab:AddButton({
Name = "Socked Guy",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 14952570512
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})
Tab:AddButton({
Name = "BackRooms",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 14808582694
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})

Tab:AddButton({
Name = "Jerma Guy",
	Callback = function()
	local args = {
    [1] = "wear",
    [2] = 14931045983
}               

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
end    
})          
local Tab = Window:MakeTab({
	Name = "Car Music",
	Icon = "rbxassetid://7733708835",
	PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Music ID: (Gamepass)"
})
Tab:AddLabel("Paste Id song");
-- Adicionar uma TextBox para inserir IDs de músicas
local musicTextBox = Tab:AddTextbox({
    Name = "Music ID",
    Default = "",
    TextDisappear = false,  -- Se true, o texto some após a entrada; se false, fica visível.
    Callback = function(value)
        -- Esta função é chamada sempre que o usuário insere um valor na TextBox.
        -- Podemos armazenar o valor em uma variável global ou em uma variável local.
        musicId = value
    end
})

-- Adicionar um botão "Play Music" à seção "Car"
Tab:AddButton({
    Name = "Play Music",
    Description = "the Music Is only Car",
    Callback = function()
        -- Verifica se um ID de música foi inserido na TextBox
        if musicId and musicId ~= "" then
            -- Chama o evento para tocar o som com base no ID inserido
            local args = {
                [1] = "PickingCarMusicText",
                [2] = musicId  -- Usar o ID de música inserido na TextBox
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
        else
            -- Se nenhum ID foi inserido, você pode adicionar um aviso ou mensagem para o usuário
            print("..")
        end
    end
})

local Section = Tab:AddSection({
	Name = "Drip Music(Gamepass)"
})

    
Tab:AddButton({
Name = "2 Guns",
     Callback = function()
	local args = {
    [1] = "PickingCarMusicText",
    [2] = "17422075096"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})                    
Tab:AddButton({
Name = "Bomba",
     Callback = function()
	local args = {
    [1] = "PickingCarMusicText",
    [2] = "6896306675"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})                    
 Tab:AddButton({
Name = "Sound HD",
     Callback = function()
	local args = {
    [1] = "PickingCarMusicText",
    [2] = "6691117911"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end 
})                                   
Tab:AddButton({
Name = "Moskau",
     Callback = function()
	local args = {
    [1] = "PickingCarMusicText",
    [2] = "135055100"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
}) 
Tab:AddButton({
Name = "Darkie",
     Callback = function()
	local args = {
    [1] = "PickingCarMusicText",
    [2] = "7886361473"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})                      
Tab:AddButton({
Name = "Natsuipx",
     Callback = function()
	local args = {
    [1] = "PickingCarMusicText",
    [2] = "6950593634"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})              
Tab:AddButton({
Name = "Woah That",
     Callback = function()
	local args = {
    [1] = "PickingCarMusicText",
    [2] = "6772846771"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})     
Tab:AddButton({
Name = "Mafia",
     Callback = function()
	local args = {
    [1] = "PickingCarMusicText",
    [2] = "6674211522"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})     
Tab:AddButton({
Name = "Rusian Drip",
     Callback = function()
	local args = {
    [1] = "PickingCarMusicText",
    [2] = "6813220211"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})  
local Section = Tab:AddSection({
	Name = "Scary Music(Gamepass)"
})

Tab:AddButton({
Name = "Torture Scream",
     Callback = function()
	local args = {
    [1] = "PickingCarMusicText",
    [2] = "147758746"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
Name = "Scary Scream",
     Callback = function()
	local args = {
    [1] = "PickingCarMusicText",
    [2] = "8325519723"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
}) 
Tab:AddButton({
	Name = "Kira laught",
	Callback = function()
    local args = {
    [1] = "PickingCarMusicText",
    [2] = "6189662330"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
	Name = "Demon song",
	Callback = function()
    local args = {
    [1] = "PickingCarMusicText",
    [2] = "3441003140"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})    
local Section = Tab:AddSection({
	Name = "Funny Music(Gamepass)"
})

Tab:AddButton({
Name = "Coca Cola ESTUNA",
     Callback = function()
	local args = {
    [1] = "PickingCarMusicText",
    [2] = "7944055563"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})     
Tab:AddButton({
Name = "Funny scream ",
     Callback = function()
	local args = {
    [1] = "PickingCarMusicText",
    [2] = "9094639541"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})

Tab:AddSection({
    Name = "Music Sirenes:"
})
    
Tab:AddButton({
Name = "Sirene",
     Callback = function()
    local args = {
    [1] = "PickingCarMusicText",
    [2] = "530137633"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
Name = "Siren Head",
     Callback = function()
    local args = {
    [1] = "PickingCarMusicText",
    [2] = "5681392704"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
Name = "Siren head alert",
     Callback = function()
    local args = {
    [1] = "PickingCarMusicText",
    [2] = "5681392074"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
    Name = "Alert",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "1001651643"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
	Name = "Music",
	Callback = function()
    local args = {
    [1] = "PickingCarMusicText",
    [2] = "530137633"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
    Name = "Sirene 2",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "4456877894"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
    Name = "Alarm",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "792323017"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
    Name = "Nuke Siren",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "6525690145"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
    Name = "Nuke Warning",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "6933037531"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
    Name = "Sirene 3",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "8949138878"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
    Name = "Alarm Sirene",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "9114373480"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
    Name = "SCP",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "819357857"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
    Name = "WarGames Alarm",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "4526853870"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
    Name = "Alarm de raind",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "2018312818"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
    Name = "Damage zone alert",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "9114024787"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
    Name = "Alarm raind",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "9100608788"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
    Name = "Sirene raind server",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "6456981311"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})

Tab:AddSection({
    Name = "Others:"
})
    
Tab:AddButton({
    Name = "Moto song",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "6491883020"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})

Tab:AddButton({
    Name = "Tubers - Rock",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "7795812961"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
    Name = "Fnaf Song",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "6913550990"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})
Tab:AddButton({
    Name = "Cartola Hub troll - Song",
    Callback = function()
      local args = {
    [1] = "PickingCarMusicText",
    [2] = "7705506391"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
   end
})   
local Tab = Window:MakeTab({
	Name = "Admin Script",
	Icon = "rbxassetid://10723364605",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Admin Script"
})
    
--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

Tab:AddButton({
	Name = "Infinite Yeld FE  (all Games)",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
    
Tab:AddButton({
	Name = "REWIZ Commands",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/KNUzQPYS", true))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Universal Script Cmd",
	Callback = function()
      		loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Cmd-12392"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]     

local Tab = Window:MakeTab({
	Name = "Hub Script",
	Icon = "rbxassetid://7733752630",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

local Section = Tab:AddSection({
	Name = "Script"
})
    
Tab:AddButton({
	Name = "R4D HUB",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/M1ZZ001/BrookhavenR4D/main/Brookhaven%20R4D%20Script'))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

    Tab:AddButton({
	Name = "REDz HUB",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/REDzHUB/main/REDzHUB"))()
  	end    
})

    
    
end
OrionLib:Init()
