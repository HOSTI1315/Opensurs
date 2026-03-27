--[[PUT CREDIT @theycallmemiz | THIS SPAWNER IS VISUAL ONLY AND I MADE IT BY HANDDDD.... >:( NO CREDIT = NO UPDATE]]
--[[PUT CREDIT @theycallmemiz | THIS SPAWNER IS VISUAL ONLY AND I MADE IT BY HANDDDD.... >:( NO CREDIT = NO UPDATE]]
--[[PUT CREDIT @theycallmemiz | THIS SPAWNER IS VISUAL ONLY AND I MADE IT BY HANDDDD.... >:( NO CREDIT = NO UPDATE]]
--[[PUT CREDIT @theycallmemiz | THIS SPAWNER IS VISUAL ONLY AND I MADE IT BY HANDDDD.... >:( NO CREDIT = NO UPDATE]]
--[[PUT CREDIT @theycallmemiz | THIS SPAWNER IS VISUAL ONLY AND I MADE IT BY HANDDDD.... >:( NO CREDIT = NO UPDATE]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local RunService = game:GetService("RunService")

local offset = 0

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Brainrot Spawner",
    Icon = "brain",
    Author = "discord.gg/mxSvSpJe7s",
    Theme = "Dark"
})

local Tab = Window:Tab({
    Title = "Spawner",
    Icon = "box",
    Desc = "MizuHub"
})

Window:SelectTab(1)

local BrainrotStats = {

["Noobini Pizzanini"] = { Price = 10, Generation = 1 },
["Lirili Larila"] = { Price = 12, Generation = 1 },
["Tim Cheese"] = { Price = 15, Generation = 2 },
["FluriFlura"] = { Price = 18, Generation = 2 },
["Talpa Di Fero"] = { Price = 22, Generation = 3 },
["Svinina Bombardino"] = { Price = 25, Generation = 3 },
["Pipi Kiwi"] = { Price = 28, Generation = 4 },
["Racooni Jandelini"] = { Price = 32, Generation = 4 },
["Pipi Corni"] = { Price = 35, Generation = 5 },
["Tartaragno"] = { Price = 1.5K, Generation = 13 },

["Trippi Troppi"] = { Price = 80, Generation = 10 },
["Gangster Footera"] = { Price = 95, Generation = 12 },
["Bandito Bobritto"] = { Price = 4.5K, Generation = 35 },
["Boneca Ambalabu"] = { Price = 125, Generation = 16 },
["Cacto Hipopotamo"] = { Price = 140, Generation = 18 },
["Ta Ta Ta Ta Sahur"] = { Price = 160, Generation = 20 },
["Tric Trac Baraboom"] = { Price = 180, Generation = 22 },
["Pipi Avocado"] = { Price = 200, Generation = 25 },

["Cappuccino Assassino"] = { Price = 350, Generation = 40 },
["Brr Brr Patapim"] = { Price = 380, Generation = 45 },
["Trulimero Trulicina"] = { Price = 420, Generation = 50 },
["Bambini Crostini"] = { Price = 22,500, Generation = 135 },
["Bananita Dolphinita"] = { Price = 25K, Generation = 150 },
["Perochello Lemonchello"] = { Price = 550, Generation = 65 },
["Avocadini Antilopini"] = { Price = 17.5K, Generation = 115 },
["Brri Brri Bicus Dicus Bombicus"] = { Price = 600, Generation = 70 },
["Avocadini Guffo"] = { Price = 35K, Generation = 255 },
["Salamino Penguino"] = { Price = 700, Generation = 80 },
["Ti Ti Ti Sahur"] = { Price = 760, Generation = 85 },
["Bandito Axolito"] = { Price = 12.5K, Generation = 90 },
["Penguino Cocosino"] = { Price = 820, Generation = 90 },

["Burbaloni Loliloli"] = { Price = 1500, Generation = 150 },
["Chimpazini Bananini"] = { Price = 1700, Generation = 170 },
["Ballerina Cappuccina"] = { Price = 100K, Generation = 500 },
["Chef Crabracadabra"] = { Price = 2200, Generation = 220 },
["Lionel Cactuseli"] = { Price = 2500, Generation = 250 },
["Glorbo Fruttodrillio"] = { Price = 2800, Generation = 280 },
["Blueberrini Octupusini"] = { Price = 3100, Generation = 310 },
["Strawberelli Flamingelli"] = { Price = 3500, Generation = 350 },
["Pandaccini Bananini"] = { Price = 3900, Generation = 390 },
["Cocosini Mama"] = { Price = 4300, Generation = 430 },
["Sigma Boy"] = { Price = 4800, Generation = 480 },
["Pi Pi Watermelon"] = { Price = 5400, Generation = 540 },

["Frigo Camelo"] = { Price = 9000, Generation = 900 },
["Orangutini Ananassini"] = { Price = 10000, Generation = 1000 },
["Rhino Toasterino"] = { Price = 11000, Generation = 1100 },
["Bombardiro Crocodilo"] = { Price = 13000, Generation = 1300 },
["Bombombini Gusini"] = { Price = 15000, Generation = 1500 },
["Cavallo Virtuso"] = { Price = 17000, Generation = 1700 },
["Gorillo Watermelondrillo"] = { Price = 20000, Generation = 2000 },
["Avocadorilla"] = { Price = 2M, Generation = 7K },
["Bananito Bandito"] = { Price = 4.9M, Generation = 16.5K },
["Tob Tobi Tobi"] = { Price = 92822, Generation = 2600 },
["Ganganzelli Trulala"] = { Price = 30000, Generation = 3000 },
["Te Te Te Sahur"] = { Price = 34000, Generation = 3400 },
["Tracoducotulo Delapeladustuz"] = { Price = 38000, Generation = 3800 },
["Spioniro Golubiro"] = { Price = 42000, Generation = 4200 },
["Zibra Zubra Zibralini"] = { Price = 46000, Generation = 4600 },
["Tigrilini Watermelini"] = { Price = 52000, Generation = 5200 },

["Strawberry Elephant"] = { Price = 250M, Generation = 500B },
["Meowl"] = { Price = 275M, Generation = 350B },

["Coco Elefanto"] = { Price = 150000, Generation = 15000 },
["Giraffa Celestre"] = { Price = 180000, Generation = 18000 },
["Gattatino Nyanino"] = { Price = 200000, Generation = 20000 },
["Chihuanini Taconini"] = { Price = 220000, Generation = 22000 },
["Matteo"] = { Price = 250000, Generation = 25000 },
["Belula Beluga"] = { Price = 60M, Generation = 290K },
["Bambu Bambu Sahur"] = { Price = 47.5M, Generation = 275K },
["Ballerina Peppermintina"] = { Price = 37.5M, Generation = 215K },
["Aquanaut"] = { Price = 45.5M, Generation = 245K },
["Tralalero Tralala"] = { Price = 280000, Generation = 28000 },
["Espresso Signora"] = { Price = 310000, Generation = 31000 },
["Odin Din Din Dun"] = { Price = 350000, Generation = 35000 },
["Statunino Libertino"] = { Price = 400000, Generation = 40000 },
["Trenostruzzo Turbo 300"] = { Price = 450000, Generation = 45000 },
["Ballerino Lololo"] = { Price = 35.1M, Generation = 200K },
["Los Orcalitos"] = { Price = 550000, Generation = 55000 },
["Tralalita Tralala"] = { Price = 600000, Generation = 60000 },
["Uribini Flamenguini"] = { Price = 650000, Generation = 65000 },
["Los Crocodillitos"] = { Price = 700000, Generation = 70000 },
["Piccione Macchina"] = { Price = 750000, Generation = 75000 },
["Trippi Troppi Troppa Trippi"] = { Price = 800000, Generation = 80000 },
["Tukanno Bananno"] = { Price = 850000, Generation = 85000 },
["Tipi Topi Taco"] = { Price = 900000, Generation = 90000 },
["Alessio"] = { Price = 17.5M, Generation = 85K },
["Antonio"] = { Price = 6M, Generation = 18.5K },
["Anpali Babel"] = { Price = 48M, Generation = 280K },
["Extinct Ballerina"] = { Price = 950000, Generation = 95000 },
["Gattito Tacoto"] = { Price = 1000000, Generation = 100000 },
["Pakrahmatmamat"] = { Price = 1100000, Generation = 110000 },
["Tractoro Dinosauro"] = { Price = 1200000, Generation = 120000 },
["Los Tipi Tacos"] = { Price = 1300000, Generation = 130000 },

["Admin Lucky Block"] = { Price = 100M, Generation = 0 },
["Developini Braziliaspidini"] = { Price = 1T, Generation = 2.5B },

["Job Job Job Sahur"] = { Price = 50000, Generation = 5000 },
["Pumpkini Spyderini"] = { Price = 165M, Generation = 650K },
["Sammyini Spyderini"] = { Price = 100M, Generation = 325K },
["La Grande Combinasion"] = { Price = 80000, Generation = 8000 },
["25"] = { Price = 600M, Generation = 2.5M },
["67"] = { Price = 1.2B, Generation = 7.5M },
["Giftini Spyderini"] = { Price = 240M, Generation = 999.9K },
["Chimpanzini Spiderini"] = { Price = 100M, Generation = 325K },
["Agarrini La Palini"] = { Price = 80M, Generation = 425K },
["Las Sis"] = { Price = 70000, Generation = 7000 },
["Los Chicleteiras"] = { Price = 1.2B, Generation = 7M },
["La Vacca Staturno Saturnita"] = { Price = 90000, Generation = 9000 },
["Chimpazini Spiderini"] = { Price = 100000, Generation = 10000 },
["Extinct Tralalero"] = { Price = 120000, Generation = 12000 },
["Extinct Matteo"] = { Price = 140000, Generation = 14000 },
["Los Tralaleritos"] = { Price = 160000, Generation = 16000 },
["Los Spyderrinis"] = { Price = 125M, Generation = 425K },
["Mieteteira Bicicleteira"] = { Price = 2.7B, Generation = 26M },
["La Karkerkar Combinasion"] = { Price = 180000, Generation = 18000 },
["Graipuss Medussi"] = { Price = 200000, Generation = 20000 },
["Nuclearo Dinossauro"] = { Price = 250000, Generation = 25000 },
["La Extinct Grande"] = { Price = 300000, Generation = 30000 },
["Garama and Madundung"] = { Price = 350000, Generation = 35000 },
["Torrtuginni Dragonfruitini"] = { Price = 400000, Generation = 40000 },
["Pirulitoita Bicicleteira"] = { Price = 600M, Generation = 2.5M },
["Pot Hotspot"] = { Price = 450000, Generation = 45000 },
["1x1x1x1"] = { Price = 255.5M, Generation = 1.1M },
["Chicleteira Noelteira"] = { Price = 2B, Generation = 15M },
["Ketupat Kepat"] = { Price = 600000, Generation = 60000 },
["Ketchuru and Musturu"] = { Price = 700000, Generation = 70000 },
}

local Brainrots = {}
for _, model in ipairs(ReplicatedStorage.Models.Animals:GetChildren()) do
    table.insert(Brainrots, model.Name)
end

local SelectedBrainrot = Brainrots[1]

Tab:Dropdown({
    Title = "Select Brainrot(s)",
    Desc = "Select A Existing Brainrot(s) You Wanted To Spawn!",
    Values = Brainrots,
    Callback = function(v)
        SelectedBrainrot = v
    end
})

local EasyVisuals = require(game:GetService("ReplicatedStorage").Packages.EasyVisuals)

Tab:Button({
    Title = "Spawn Selected Brainrot",
    Callback = function()
        if not SelectedBrainrot then
            warn("No Brainrot selected!")
            return
        end

        local player = Players.LocalPlayer
        local SecretBrainrots = {
            "Job Job Job Sahur",
            "La Grande Combinasion",
            "Chicleteira Noelteira",
            "67",
            "25",
            "Las Sis",
            "La Vacca Staturno Saturnita",
            "Pirulitoita Bicicleteira",
            "Chimpazini Spiderini",
            "Extinct Tralalero",
            "Extinct Matteo",
            "Los Tralaleritos",
            "La Karkerkar Combinasion",
            "Las Tralaleritas",
            "Los Spyderrinis",
            "Graipuss Medussi",
            "La Grande Combinasion",
            "Nuclearo Dinossauro",
            "La Extinct Grande",
            "Garama and Madundung",
            "Torrtuginni Dragonfruitini",
            "Pot Hotspot",
            "Las Vaquitas Saturnitas",
            "Chicleteira Bicicleteira",
            "Agarrini La Palini",
            "Dragon Cannelloni",
            "Los Combinasionas",
            "Karkerkar Kurkur",
            "Los Hotspotsitos",
            "Los Chicleteiras",
            "La Sahur Combinasion",
            "Quesadilla Crocadilla",
            "Esok Sekolah",
            "Mieteteira Bicicleteira",
            "Los Matteos",
            "Dul Dul Dul",
            "1x1x1x1",
            "Pumpkini Spyderini",
            "Blackhole Goat",
            "Nooo My Hotspot",
            "Sammyini Spyderini",
            "Giftini Spyderini",
            "Spaghetti Tualetti",
            "Chimpanzini Spiderini",
            "Los Noo My Hotspotsitos",
            "Celularcini Viciosini",
            "Tralaledon",
            "La Supreme Combinasion",
            "Ketupat Kepat",
            "Ketchuru and Musturu"
        }

        local GodBrainrots = {
            "Coco Elefanto",
            "Giraffa Celestre",
            "Anpali Babel",
            "Bambu Bambu Sahur",
            "Ballerina Peppermintina",
            "Aquanaut",
            "Gattatino Nyanino",
            "Chihuanini Taconini",
            "Matteo",
            "Tralalero Tralala",
            "Espresso Signora",
            "Odin Din Din Dun",
            "Antonio",
            "Statunino Libertino",
            "Trenostruzzo Turbo 300",
            "Ballerino Lololo",
            "Los Orcalitos",
            "Alessio",
            "Tralalita Tralala",
            "Belula Beluga",
            "Uribini Flamenguini",
            "Los Crocodillitos",
            "Piccione Macchina",
            "Trippi Troppi Troppa Trippi",
            "Tukanno Bananno",
            "Tipi Topi Taco",
            "Extinct Ballerina",
            "Gattito Tacoto",
            "Pakrahmatmamat",
            "Tractoro Dinosauro",
            "Los Tipi Tacos"
        }

        local OGBrainrots = {
            "Strawberry Elephant",
            "Meowl"
        }

        local CommonBrainrots = {
            "Noobini Pizzanini",
            "Lirili Larila",
            "Tim Cheese",
            "Tartaragno",
            "FluriFlura",
            "Talpa Di Fero",
            "Svinina Bombardino",
            "Pipi Kiwi",
            "Racooni Jandelini",
            "Pipi Corni"
        }

        local RareBrainrots = {
            "Trippi Troppi",
            "Gangster Footera",
            "Bandito Bobritto",
            "Boneca Ambalabu",
            "Cacto Hipopotamo",
            "Ta Ta Ta Ta Sahur",
            "Tric Trac Baraboom",
            "Pipi Avocado"
        }

        local EpicBrainrots = {
            "Cappuccino Assassino",
            "Brr Brr Patapim",
            "Trulimero Trulicina",
            "Bambini Crostini",
            "Bananita Dolphinita",
            "Perochello Lemonchello",
            "Brri Brri Bicus Dicus Bombicus",
            "Avocadini Antilopini",
            "Avocadini Guffo",
            "Salamino Penguino",
            "Ti Ti Ti Sahur",
            "Penguino Cocosino"
       }

       local LegendaryBrainrots = {
           "Burbaloni Loliloli",
           "Chimpazini Bananini",
           "Ballerina Cappuccina",
           "Chef Crabracadabra",
           "Lionel Cactuseli",
           "Glorbo Fruttodrillio",
           "Blueberrini Octupusini",
           "Strawberelli Flamingelli",
           "Pandaccini Bananini",
           "Cocosini Mama",
           "Sigma Boy",
           "Pi Pi Watermelon"
      }
  
      local MythicBrainrots = {
          "Frigo Camelo",
          "Orangutini Ananassini",
          "Rhino Toasterino",
          "Bombardiro Crocodilo",
          "Bombombini Gusini",
          "Cavallo Virtuso",
          "Gorillo Watermelondrillo",
          "Bananito Bandito",
          "Avocadorilla",
          "Tob Tobi Tobi",
          "Ganganzelli Trulala",
          "Te Te Te Sahur",
          "Tracoducotulo Delapeladustuz",
          "Spioniro Golubiro",
          "Zibra Zubra Zibralini",
          "Tigrilini Watermelini"
     }

     local AdminBrainrots = {
         "Admin Lucky Block",
         "Developini Braziliaspidini"
     }

        -- Find my player's plot (@theycallmemiz)
        local myPlot
        for _, plot in ipairs(workspace.Plots:GetChildren()) do
            if plot:GetAttribute("Player") == player.Name then
                myPlot = plot
                break
            end
        end
        if not myPlot then
            warn("Player Plot Not Found")
            return
        end

        -- Find first empty podium
        local targetPodium
        for i = 1, #myPlot.AnimalPodiums:GetChildren() do
            local podium = myPlot.AnimalPodiums:FindFirstChild(tostring(i))
            if podium then
                local spawnPart = podium:FindFirstChild("Base") and podium.Base:FindFirstChild("Spawn")
                if spawnPart then
                    local occupied = false
                    for _, obj in ipairs(spawnPart:GetChildren()) do
                        if obj:IsA("Model") or (obj:IsA("Attachment") and obj:FindFirstChild("AnimalOverhead")) then
                            occupied = true
                            break
                        end
                    end
                    if not occupied then
                        targetPodium = podium
                        break
                    end
                end
            end
        end

        if not targetPodium then
            warn("All podiums are full")
            return
        end

        local spawnPart = targetPodium.Base.Spawn

        local model = ReplicatedStorage.Models.Animals[SelectedBrainrot]:Clone()
        model.Parent = spawnPart
        model:SetAttribute("Mutation", "None") -- I put none because there's no Mutation/Traits Still xd
        model:SetAttribute("Traits", "None")

        -- Determine height offset
       local heightOffset = 2 -- default for most Brainrots

       if SelectedBrainrot == "Strawberry Elephant" then
           heightOffset = 4 -- higher for big OG
       elseif SelectedBrainrot == "Meowl" then
           heightOffset = 2 -- optional if Meowl is slightly bigger
      end

       if model.PrimaryPart then
           model.PrimaryPart.Anchored = true
           model.PrimaryPart.CanCollide = false
           model:SetPrimaryPartCFrame(spawnPart.CFrame + Vector3.new(0, heightOffset, 0))
      end

        local attach = Instance.new("Attachment")
        attach.Parent = model.PrimaryPart
        attach.Position = Vector3.new(0, model:GetExtentsSize().Y / 2 - 0.3, 0)

        local overhead = ReplicatedStorage.Overheads.AnimalOverhead:Clone()
        overhead.Parent = attach

        -- Clean up unused UI elements
        local mutation = overhead:FindFirstChild("Mutation")
        if mutation then mutation:Destroy() end

        local display = overhead:FindFirstChild("DisplayName", true)
        if display then
            display.Text = SelectedBrainrot
        end

        local stats = BrainrotStats[SelectedBrainrot]
           if stats then
        local priceLabel = overhead:FindFirstChild("Price", true)
           if priceLabel then
        priceLabel.Text = "$" .. stats.Price .. "/s"
    end

        local genLabel = overhead:FindFirstChild("Generation", true)
    if genLabel then
        if SelectedBrainrot == "Admin Lucky Block" or SelectedBrainrot == "Secret Lucky Block" then
            genLabel.Text = "READY!"
        else
            genLabel.Text = "$" .. stats.Generation .. "/s"
        end
    end

        local rarity = overhead:FindFirstChild("Rarity", true)
        if rarity then
            for _, v in ipairs(rarity:GetChildren()) do
                v:Destroy()
            end

                if table.find(OGBrainrots, SelectedBrainrot) then
            rarity.Text = "OG"
            rarity.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text

            local stroke = Instance.new("UIStroke")
            stroke.Thickness = 4
            stroke.Color = Color3.fromRGB(255, 255, 255) -- White stroke
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
            stroke.Parent = rarity

            local effect = EasyVisuals.new(rarity, "Matrix", 0.95, 1) -- Gold moving gradient
            -- effect.EffectObjects contains the UIGradient/UIStroke instances automatically

            elseif table.find(GodBrainrots, SelectedBrainrot) then
            rarity.Text = "Brainrot God"
            rarity.TextColor3 = Color3.fromRGB(255, 255, 255)

            local effect = EasyVisuals.new(rarity, "Rainbow", 0.95, 1)

           local stroke = Instance.new("UIStroke")
           stroke.Thickness = 4
           stroke.Color = Color3.new(0, 0, 0)
           stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
           stroke.Parent = rarity

           -- Add gradient to stroke (optional, uses same EasyVisuals for stroke if needed : just change it skid xd)
           local strokeEffect = EasyVisuals.new(stroke, "Rainbow", 0.95, 1)
    
            elseif table.find(SecretBrainrots, SelectedBrainrot) then
                rarity.Text = "Secret"
                rarity.TextColor3 = Color3.new(0,0,0)
                EasyVisuals.new(rarity, "Zebra", 0.95, 1)
      
                rarity.Text = "Secret"
                rarity.TextColor3 = Color3.new(0.5,0.5,0.5)
                local stroke = Instance.new("UIStroke")
                stroke.Thickness = 1
                stroke.Color = Color3.new(0.7,0.7,0.7)
                stroke.Parent = rarity

            elseif table.find(AdminBrainrots, SelectedBrainrot) then
                rarity.Text = "Admin"
                rarity.TextColor3 = Color3.new(0,0,0)
                EasyVisuals.new(rarity, "YellowRed", 0.95, 1)
      
                rarity.Text = "Admin"
                rarity.TextColor3 = Color3.new(255, 255, 255)
                local stroke = Instance.new("UIStroke")
                stroke.Thickness = 2
                stroke.Color = Color3.new(0,0,0)
                stroke.Parent = rarity

            elseif SelectedBrainrotRarity == "Common" then
                rarity.Text = "Common"
                rarity.TextColor3 = Color3.fromRGB(0, 171, 40)
                local stroke = Instance.new("UIStroke")
                stroke.Thickness = 4
                stroke.Color = Color3.fromRGB(0, 0, 0)
                stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
                stroke.Parent = rarity

            elseif SelectedBrainrotRarity == "Rare" then
                rarity.Text = "Rare"
                rarity.TextColor3 = Color3.fromRGB(0, 131, 17)
                local stroke = Instance.new("UIStroke")
                stroke.Thickness = 4
                stroke.Color = Color3.fromRGB(0, 0, 0)
                stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
                stroke.Parent = rarity

            elseif SelectedBrainrotRarity == "Legendary" then
                rarity.Text = "Legendary"
                rarity.TextColor3 = Color3.fromRGB(251, 255, 0)
                local stroke = Instance.new("UIStroke")
                stroke.Thickness = 4
                stroke.Color = Color3.fromRGB(0, 0, 0)
                stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
                stroke.Parent = rarity

            elseif SelectedBrainrotRarity == "Epic" then
                rarity.Text = "Epic"
                rarity.TextColor3 = Color3.fromRGB(134, 0, 171)
                local stroke = Instance.new("UIStroke")
                stroke.Thickness = 4
                stroke.Color = Color3.fromRGB(0, 0, 0)
                stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
                stroke.Parent = rarity

            elseif SelectedBrainrotRarity == "Mythic" then
                rarity.Text = "Mythic"
                rarity.TextColor3 = Color3.fromRGB(255, 0, 0)
                local stroke = Instance.new("UIStroke")
                stroke.Thickness = 4
                stroke.Color = Color3.fromRGB(0, 0, 0)
                stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
                stroke.Parent = rarity
        end
   end

        local promptAttachment = spawnPart:FindFirstChild("PromptAttachment") or Instance.new("Attachment")
        promptAttachment.Name = "PromptAttachment"
        promptAttachment.Parent = spawnPart
        promptAttachment:ClearAllChildren()

        local grab = Instance.new("ProximityPrompt")
        grab.ActionText = "Grab"
        grab.ObjectText = SelectedBrainrot
        grab.KeyboardKeyCode = Enum.KeyCode.E
        grab.HoldDuration = 1.5
        grab.MaxActivationDistance = 10
        grab.Style = Enum.ProximityPromptStyle.Custom
        grab:SetAttribute("State", "Grab")
        grab.Parent = promptAttachment

        local sell = Instance.new("ProximityPrompt")
        sell.ActionText = "Sell: $100B"
        sell.KeyboardKeyCode = Enum.KeyCode.F
        sell.HoldDuration = 1.5
        sell.MaxActivationDistance = 10
        sell.Style = Enum.ProximityPromptStyle.Custom
        sell.UIOffset = Vector2.new(0, -72)
        sell:SetAttribute("State", "Sell")
        sell.Parent = promptAttachment
    end
})

