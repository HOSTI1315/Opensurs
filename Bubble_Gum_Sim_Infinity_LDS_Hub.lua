-- ts file was generated at discord.gg/25ms


repeat
    wait()
until game:IsLoaded()
local vu1 = getgenv()
local vu2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/refs/heads/main/Library"))()
local v3 = vu2:start("Bubble Gum Simulator INFINITY", "5.0", true)
local v4 = v3:addTab("Main Options")
local v5 = v3:addTab("Auto Egg")
local v6 = v3:addTab("Machines")
v3:addTab("Inventory")
local v7 = v3:addTab("Misc Options")
local v8 = v3:addTab("Teleport")
local vu9 = cloneref(game:GetService("ReplicatedStorage"))
local v10 = cloneref(game:GetService("Players"))
cloneref(game:GetService("Workspace"))
local v11 = cloneref(game:GetService("CollectionService"))
local vu12 = v10.LocalPlayer;
(vu12.Character or vu12.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local vu13 = {}
local vu14 = 10
local vu15 = 20
local vu16 = 0.8
function teleportGradual(p17)
    local v18 = (vu12.Character or vu12.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
    while vu14 < (v18.Position - p17).Magnitude do
        local v19 = v18.Position
        local v20 = p17 - v19
        local v21 = Vector3.new(v20.X, 0, v20.Z)
        local v22 = v21.Magnitude > 0 and v21.Unit * math.random(vu14, vu15) or Vector3.zero
        local v23 = v20.Y
        local v24 = v19 + Vector3.new(v22.X, v23, v22.Z)
        if (v24 - p17).Magnitude >= (v19 - p17).Magnitude then
            v24 = p17
        end
        v18.CFrame = CFrame.new(v24)
        task.wait(vu16)
    end
    v18.CFrame = CFrame.new(p17)
    return true
end
function GetData(p25)
    return require(vu9.Client.Framework.Services.LocalData).Get()[p25]
end
function GetBestShop(p26)
    local v27 = {
        Flavors = vu9.Shared.Data.Flavors,
        Gum = vu9.Shared.Data.Gum
    }
    if not v27[p26] then
        return nil
    end
    local v28 = require(v27[p26])
    local v29 = GetData(p26)
    local v30, v31, v32 = pairs(v28)
    local v33 = {}
    while true do
        local v34
        v32, v34 = v30(v31, v32)
        if v32 == nil then
            break
        end
        if typeof(v34.Cost) == "table" then
            table.insert(v33, {
                Name = v32,
                Cost = v34.Cost
            })
        end
    end
    table.sort(v33, function(p35, p36)
        if typeof(p35.Cost) == "table" and typeof(p36.Cost) == "table" then
            return p35.Cost.Amount < p36.Cost.Amount
        end
    end)
    local v37, v38, v39 = ipairs(v33)
    while true do
        local v40
        v39, v40 = v37(v38, v39)
        if v39 == nil then
            break
        end
        if not v29[v40.Name] then
            return v40, v40.Cost
        end
    end
    return nil
end
function UpdatePets()
    local v41 = GetData("Pets")
    local v42, v43, v44 = pairs(v41)
    while true do
        local v45
        v44, v45 = v42(v43, v44)
        if v44 == nil then
            break
        end
        if v45.Amount then
            table.insert(vu13, v45.Name .. " " .. v45.Amount)
        else
            table.insert(vu13, v45.Name)
        end
    end
end
function GetInfoPet(p46)
    local v47 = GetData("Pets")
    local v48, v49, v50 = pairs(v47)
    while true do
        local v51
        v50, v51 = v48(v49, v50)
        if v50 == nil then
            break
        end
        if v51.Name == p46 then
            return v51
        end
    end
end
function ConfirmTime(p52)
    if p52 then
        return p52 - require(vu9.Shared.Framework.Utilities.Math.Time).now() <= 0
    end
end
UpdatePets()
v4:addLine("Auto Farms:", "Big")
v4:addToggle("Auto Blow Bubble", "By activating this option you will start farming bubbles automatically.", "Big", false, function(p53)
    if p53 then
        while vu1.Settings["Auto Blow Bubble"] do
            local _ = GetData("Bubble").Amount
            task.wait()
            vu9.Shared.Framework.Network.Remote.Event:FireServer("BlowBubble")
        end
    end
end)
v4:addToggle("Auto Collect Coins and Gems", "By activating this option you will automatically get all the coins spawned (tip: use auto teleport for better performance)", "Big", false, function(p54)
    if p54 then
        while vu1.Settings["Auto Collect Coins and Gems"] do
            task.wait()
            local v55, v56, v57 = pairs(workspace.Rendered:GetChildren())
            while true do
                local v58
                v57, v58 = v55(v56, v57)
                if v57 == nil then
                    break
                end
                if v58.Name == "Chunker" then
                    local v59, v60, v61 = pairs(v58:GetChildren())
                    while true do
                        local v62
                        v61, v62 = v59(v60, v61)
                        if v61 == nil then
                            break
                        end
                        if string.len(v62.Name) >= 20 then
                            require(vu9.Shared.Utils.Chunker).new(128, 2):Remove(v62:GetPivot().Position, v62)
                            vu9.Remotes.Pickups.CollectPickup:FireServer(v62.Name)
                            v62:Destroy()
                            task.wait()
                        end
                    end
                end
            end
        end
    end
end)
v4:addLine("Auto Sell:", "Big")
local v63, v64, v65 = v11:GetTagged("Activation")
local v66 = vu13
local v67 = {}
local vu68 = {}
while true do
    local v69, v70 = v63(v64, v65)
    if v69 == nil then
        break
    end
    v65 = v69
    if v70.Name == "Sell" then
        local v71 = v70:GetAttribute("Multiplier")
        local v72 = v70:GetAttribute("Currency") or "Coins"
        table.insert(v67, tostring(v71 .. "x " .. v72))
        vu68[v71 .. "x " .. v72] = v70
    end
end
local vu73 = v4:addCombo("Select Mode", "Only Spam Sell: will only sell at the point you selected / Sell And Back Old Pos: will take you to the point of sale, and then return to your old position", {
    "Only Spam Sell",
    "Sell And Back Old Pos"
})
local vu74 = v4:addCombo("Select Multiplier To Sell", "Select point of sell", v67)
v4:addToggle("Auto Sell Bubbles When Full (Selected)", "By activating this option you will automatically sell when your bubble is full.", "Big", false, function(p75)
    if p75 then
        while vu1.Settings["Auto Sell Bubbles When Full (Selected)"] do
            task.wait()
            local v76 = vu73:getValue()
            local v77 = vu74:getValue()
            local v78 = GetData("Bubble").Amount
            local v79 = GetData("Bubble").Gum
            local v80 = require(vu9.Shared.Data.Gum)
            if v80[v79].Storage == v78 then
                if v76 == "Sell And Back Old Pos" then
                    local v81 = vu12.Character.HumanoidRootPart.Position
                    if teleportGradual(vu68[v77].Root.Position) then
                        repeat
                            task.wait()
                            vu9.Shared.Framework.Network.Remote.Event:FireServer("SellBubble")
                        until v80[v79].Storage ~= GetData("Bubble").Amount or not vu1.Settings["Auto Sell Bubbles When Full (Selected)"]
                        teleportGradual(v81)
                    end
                elseif v76 == "Only Spam Sell" and teleportGradual(vu68[v77].Root.Position) then
                    vu9.Shared.Framework.Network.Remote.Event:FireServer("SellBubble")
                end
            end
        end
    end
end)
local vu82 = require(vu9.Shared.Data.Eggs)
local v83 = {}
table.insert(v83, "Infinity Egg")
local v84, v85, v86 = pairs(vu82)
while true do
    local v87
    v86, v87 = v84(v85, v86)
    if v86 == nil then
        break
    end
    table.insert(v83, v86)
end
v5:addLine("Egg Options:", "Big")
local vu88 = v5:addCombo("Select Egg", "Select the egg you want to open", v83)
v5:addToggle("Auto Buy Egg (Selected)", "When activating this option you will open the selected egg automatically (you need to be close to the egg)", "Big", false, function(p89)
    if p89 then
        while vu1.Settings["Auto Buy Egg (Selected)"] do
            task.wait()
            local v90 = vu88:getValue()
            local v91 = GetData("Coins")
            if v90 == "Infinity Egg" then
                if v91 >= 750000 then
                    vu9.Shared.Framework.Network.Remote.Event:FireServer("HatchEgg", v90, 1)
                end
            elseif vu82[v90].Cost.Amount <= v91 then
                vu9.Shared.Framework.Network.Remote.Event:FireServer("HatchEgg", v90, 1)
            end
        end
    end
end)
v5:addLine("Island\'s Multiplier:", "Big")
local vu92 = v5:addMultiCombo("Select Egg", "Select the egg you want to open", v83)
local vu93 = v5:addMultiCombo("Select Multiplier", "Select the amount of island multiplier you want", {
    "x5",
    "x10",
    "x25",
    "x100"
})
v5:addToggle("TP Island, Open Egg (selected)", "By activating this option, when the egg island you selected has the multiplier, you will be teleported to the island and will automatically buy the egg until the island disappears.", "Big", false, function(p94)
    if p94 then
        while vu1.Settings["TP Island, Open Egg (selected)"] do
            task.wait()
            local vu95 = vu92:getValue()
            local vu96 = vu93:getValue()
            pcall(function()
                local v97, v98, v99 = pairs(workspace.Rendered.Rifts:GetChildren())
                while true do
                    local v100
                    v99, v100 = v97(v98, v99)
                    if v99 == nil or not vu1.Settings["TP Island, Open Egg (selected)"] then
                        break
                    end
                    local v101 = string.gsub(v100.Name, "%-", " ")
                    local v102, v103, v104 = pairs(vu95)
                    while true do
                        local v105
                        v104, v105 = v102(v103, v104)
                        if v104 == nil or not vu1.Settings["TP Island, Open Egg (selected)"] then
                            break
                        end
                        if v101 == string.lower(v105) and table.find(vu96, v100.Display.SurfaceGui.Icon.Luck.Text) then
                            print("tudo ok")
                            if teleportGradual(v100.Display.Position) then
                                repeat
                                    task.wait()
                                    vu9.Shared.Framework.Network.Remote.Event:FireServer("HatchEgg", v105, 1)
                                until not (v100.Parent and vu1.Settings["TP Island, Open Egg (selected)"])
                            end
                        end
                    end
                end
            end)
        end
    end
end)
v6:addLine("Auto Machines / Shops:", "Big")
local v106 = v6:addFolder("Auto Buy Shop")
local vu107 = v106:addMultiCombo("Select Buy", "Select an option", {
    "Gum",
    "Flavors"
})
v106:addToggle("Auto Buy (Selected)", "By activating this option you will automatically buy when you have the coin in the option you selected", "Big", false, function(p108)
    if p108 then
        while vu1.Settings["Auto Buy (Selected)"] do
            task.wait()
            local v109 = vu107:getValue()
            local v110, v111, v112 = pairs(v109)
            while true do
                local v113
                v112, v113 = v110(v111, v112)
                if v112 == nil then
                    break
                end
                local v114, v115 = GetBestShop(v113)
                if v114 and GetData(v115.Currency) >= v114.Cost.Amount then
                    vu9.Shared.Framework.Network.Remote.Event:FireServer("GumShopPurchase", v114.Name)
                end
            end
        end
    end
end)
local v116 = v6:addFolder("Blackmarket")
local v117 = require(vu9.Shared.Data.Shops)
local v118, v119, v120 = pairs(v117["shard-shop"].RandomItems)
local v121 = {}
while true do
    local v122
    v120, v122 = v118(v119, v120)
    if v120 == nil then
        break
    end
    local v123 = v122.Product
    table.insert(v121, tostring(v123.Name .. " " .. v123.Type .. " " .. v123.Level))
end
local vu124 = v116:addMultiCombo("Select Item (s)", "", v121)
v116:addToggle("Auto Buy Item Blackmarket (Selected)", "By activating this option you will automatically buy when you have the coin in the option you selected", "Big", false, function(p125)
    if p125 then
        while vu1.Settings["Auto Buy Item Blackmarket (Selected)"] do
            task.wait()
            local v126 = vu124:getValue()
            local v127, v128, _ = require(vu9.Shared.Utils.ShopUtil):GetItemsData("shard-shop", vu12, require(vu9.Client.Framework.Services.LocalData):Get())
            local v129, v130, v131 = pairs(v127)
            while true do
                local v132
                v131, v132 = v129(v130, v131)
                if v131 == nil then
                    break
                end
                local v133 = v132.Cost
                local v134 = v132.Product
                local v135 = v133.Amount
                local v136 = GetData(v133.Currency)
                local v137 = tostring(v134.Name .. " " .. v134.Type .. " " .. v134.Level)
                if table.find(v126, v137) and (tonumber(v136) >= tonumber(v135) and v128[v131] ~= GetData("Shops")["shard-shop"].Bought[v131]) then
                    print("funcionou")
                    vu9.Shared.Framework.Network.Remote.Event:FireServer("BuyShopItem", "shard-shop", v131)
                end
            end
        end
    end
end)
local v138 = v6:addFolder("Auto Enchanter")
local v139 = require(vu9.Shared.Data.Enchants)
local v140, v141, v142 = pairs(v139)
local v143 = {}
while true do
    local v144
    v142, v144 = v140(v141, v142)
    if v142 == nil then
        break
    end
    local v145 = v142
    for v146 = 1, tonumber(v144.Levels) do
        table.insert(v143, v145 .. " " .. v146)
    end
end
local vu147 = v138:addMultiCombo("Select Enchant", "select the enchant you want to apply to the pet", v143)
local vu148 = v138:addMultiCombo("Select Pet", "select the pet you want to enchant", v66)
local vu149 = v138:addInputBox("Safe Gem Amount")
v138:addToggle("Use Safe Amount Gem", "select a limit amount that you want to limit, for example if you select 10000 you will spend up to 10000", "small", true, function(_)
end)
v138:addToggle("Auto Enchant (Selected)", "By activating this option you will automatically find the pet until you find the enchant you want.", "Big", false, function(p150)
    if p150 then
        while vu1.Settings["Auto Enchant (Selected)"] do
            task.wait()
            local v151 = vu148:getValue()
            local v152 = vu147:getValue()
            local v153 = vu149
            local v154 = tonumber(v153:getValue())
            local v155, v156, v157 = pairs(v152)
            local v158 = {}
            while true do
                local v159
                v157, v159 = v155(v156, v157)
                if v157 == nil then
                    break
                end
                local v160, v161 = string.match(v159, "^(.-)%s*(%d+)$")
                table.insert(v158, {
                    Name = v160,
                    Level = tonumber(v161)
                })
            end
            local v162, v163, v164 = pairs(v151)
            while true do
                local v165
                v164, v165 = v162(v163, v164)
                if v164 == nil then
                    break
                end
                local v166 = GetInfoPet(v165)
                if v166 then
                    local v167 = false
                    if v166.Enchants and # v166.Enchants > 0 then
                        local v168, v169, v170 = pairs(v166.Enchants)
                        while true do
                            local v171
                            v170, v171 = v168(v169, v170)
                            if v170 == nil then
                                break
                            end
                            local v172, v173, v174 = pairs(v158)
                            while true do
                                local v175
                                v174, v175 = v172(v173, v174)
                                if v174 == nil then
                                    break
                                end
                                if v171.Id == v175.Name and tonumber(v171.Level) == v175.Level then
                                    v167 = true
                                    break
                                end
                            end
                            if v167 then
                                break
                            end
                        end
                    end
                    if not v167 then
                        if vu1.Settings["Use Safe Amount Gem"] and v154 then
                            local v176 = GetData("Gems")
                            if v154 < v176 and v154 <= v176 - 150 then
                                vu9.Shared.Framework.Network.Remote.Function:InvokeServer("RerollEnchants", v166.Id)
                            end
                        else
                            vu9.Shared.Framework.Network.Remote.Function:InvokeServer("RerollEnchants", v166.Id)
                        end
                    end
                end
            end
        end
    end
end)
local v177 = v6:addFolder("Alien Shop")
local v178, v179, v180 = pairs(v117["alien-shop"].RandomItems)
local v181 = {}
while true do
    local v182
    v180, v182 = v178(v179, v180)
    if v180 == nil then
        break
    end
    local v183 = v182.Product
    table.insert(v181, tostring((v183.Name or "") .. " " .. (v183.Type or "") .. " " .. (v183.Level or "")))
end
local vu184 = v177:addMultiCombo("Select Item (s)", "", v181)
v177:addToggle("Auto Buy Item Alien Shop (Selected)", "By activating this option you will automatically buy when you have the coin in the option you selected", "Big", false, function(p185)
    if p185 then
        while vu1.Settings["Auto Buy Item Alien Shop (Selected)"] do
            task.wait()
            local v186 = vu184:getValue()
            local v187, v188, _ = require(vu9.Shared.Utils.ShopUtil):GetItemsData("alien-shop", vu12, require(vu9.Client.Framework.Services.LocalData):Get())
            local v189, v190, v191 = pairs(v187)
            while true do
                local v192
                v191, v192 = v189(v190, v191)
                if v191 == nil then
                    break
                end
                local v193 = v192.Cost
                local v194 = v192.Product
                local v195 = v193.Amount
                local v196 = GetData(v193.Currency)
                local v197 = tostring((v194.Name or "") .. " " .. (v194.Type or "") .. " " .. (v194.Level or ""))
                if table.find(v186, v197) and (tonumber(v196) >= tonumber(v195) and v188[v191] ~= GetData("Shops")["alien-shop"].Bought[v191]) then
                    print("funcionou")
                    vu9.Shared.Framework.Network.Remote.Event:FireServer("BuyShopItem", "alien-shop", v191)
                end
            end
        end
    end
end)
local v198 = v6:addFolder("Dice Merchant")
local v199, v200, v201 = pairs(v117["dice-shop"].RandomItems)
local vu202 = vu184
local v203 = {}
while true do
    local v204
    v201, v204 = v199(v200, v201)
    if v201 == nil then
        break
    end
    local v205 = v204.Product
    table.insert(v181, tostring((v205.Name or "") .. " " .. (v205.Type or "") .. " " .. (v205.Level or "")))
end
v198:addMultiCombo("Select Item (s)", "", v203)
v198:addToggle("Auto Buy Item Dice Merchant (Selected)", "By activating this option you will automatically buy when you have the coin in the option you selected", "Big", false, function(p206)
    if p206 then
        while vu1.Settings["Auto Buy Item Dice Merchant (Selected)"] do
            task.wait()
            local v207 = vu202:getValue()
            local v208, v209, _ = require(vu9.Shared.Utils.ShopUtil):GetItemsData("dice-shop", vu12, require(vu9.Client.Framework.Services.LocalData):Get())
            local v210, v211, v212 = pairs(v208)
            while true do
                local v213
                v212, v213 = v210(v211, v212)
                if v212 == nil then
                    break
                end
                local v214 = v213.Cost
                local v215 = v213.Product
                local v216 = v214.Amount
                local v217 = GetData(v214.Currency)
                local v218 = tostring((v215.Name or "") .. " " .. (v215.Type or "") .. " " .. (v215.Level or ""))
                if table.find(v207, v218) and (tonumber(v217) >= tonumber(v216) and v209[v212] ~= GetData("Shops")["dice-shop"].Bought[v212]) then
                    print("funcionou")
                    vu9.Shared.Framework.Network.Remote.Event:FireServer("BuyShopItem", "dice-shop", v212)
                end
            end
        end
    end
end)
v6:addLine("Auto Mine Games:", "Big")
local v219 = v6:addFolder("Doggy Jump")
local vu220 = require(vu9.Client.Gui.Frames.DoggyJump)
v219:addToggle("Auto Win Doggy Jump", "By activating this option you will automatically receive the doggy Jump", "Big", false, function(p221)
    if p221 then
        while vu1.Settings["Auto Win Doggy Jump"] do
            task.wait()
            if GetData("DoggyJump").Claimed < 3 then
                vu220.POINTS_PER_SECOND = 100000
                vu220:startGame()
                wait(3)
                vu220:stopGame()
            end
        end
    end
end)
v219:addToggle("Infinity Score", "When activating this option your score will be set to infinite", "Big", false, function(p222)
    if not vu220.__originalNewScore then
        vu220.__originalNewScore = vu220.POINTS_PER_SECOND
    end
    if p222 then
        vu220.POINTS_PER_SECOND = 100000
    else
        vu220.newObject = vu220.__originalNewScore
    end
end)
v219:addToggle("Remove Obstacles Doggy Jump", "By activating this option, it will no longer spawn objects in the doggy obby", "Big", false, function(p223)
    if not vu220.__originalNewObject then
        vu220.__originalNewObject = vu220.newObject
    end
    if p223 then
        function vu220.newObject()
        end
    else
        vu220.newObject = vu220.__originalNewObject
    end
end)
local v224 = v6:addFolder("Pet Match")
local vu225 = v224:addCombo("Select Difficulty", "Select the difficulty of the pet match", {
    "Easy",
    "Medium",
    "Hard",
    "Insane"
})
v224:addToggle("Auto Win Pet Match (Selected)", "Enabling this option, as soon as available, will start the pet match and win instantly.", "Big", false, function(p226)
    if p226 then
        while vu1.Settings["Auto Win Pet Match (Selected)"] do
            task.wait()
            local v227 = vu225:getValue()
            local v228 = GetData("Cooldowns")
            local v229 = GetData("Tickets")
            if ConfirmTime(v228["Pet Match"]) and tonumber(v229) >= 5000 then
                vu9.Shared.Framework.Network.Remote.Event:FireServer("StartMinigame", "Pet Match", v227)
                wait(3)
                task.wait()
                vu9.Shared.Framework.Network.Remote.Event:FireServer("FinishMinigame")
                if ConfirmTime(GetData("Cooldowns")["Pet Match"]) and vu1.Settings["Auto Win Pet Match (Selected)"] then
                    break
                end
            end
        end
    end
end)
local v230 = v6:addFolder("Cart Escape")
local vu231 = v230:addCombo("Select Difficulty", "Select the difficulty of the cart escape", {
    "Easy",
    "Medium",
    "Hard",
    "Insane"
})
v230:addToggle("Auto Win Cart Escape (Selected)", "Enabling this option, as soon as available, will start the cart escape and win instantly.", "Big", false, function(p232)
    if p232 then
        while vu1.Settings["Auto Win Cart Escape (Selected)"] do
            task.wait()
            local v233 = vu231:getValue()
            local v234 = GetData("Cooldowns")
            local v235 = GetData("Tickets")
            if ConfirmTime(v234["Cart Escape"]) and tonumber(v235) >= 200000 then
                vu9.Shared.Framework.Network.Remote.Event:FireServer("StartMinigame", "Cart Escape", v233)
                wait(3)
                task.wait()
                vu9.Shared.Framework.Network.Remote.Event:FireServer("FinishMinigame")
                if ConfirmTime(GetData("Cooldowns")["Cart Escape"]) and vu1.Settings["Auto Win Cart Escape (Selected)"] then
                    break
                end
            end
        end
    end
end)
local v236 = v6:addFolder("Robot Claw")
local vu237 = v236:addCombo("Select Difficulty", "Select the difficulty of the robot claw", {
    "Easy",
    "Medium",
    "Hard",
    "Insane"
})
v236:addToggle("Auto Win Robot Claw (Selected)", "Enabling this option, as soon as available, will start the cart escape and win instantly.", "Big", false, function(p238)
    if not p238 then
        return
    end
    task.wait()
    local v239, v240, v241 = pairs(workspace.ClawMachine:GetChildren())
    while true do
        local v242
        v241, v242 = v239(v240, v241)
        if v241 == nil then
            break
        end
        if v242.Name == "Capsule" then
            local v243 = v242:GetAttribute("ItemGUID")
            local v244 = vu9.Shared.Framework.Network.Remote.Event:FireServer("GrabMinigameItem", v243)
            v242:Destroy()
            print(v244)
            task.wait(4)
        end
    end
    if workspace.ClawMachine:FindFirstChild("Capsule") and vu1.Settings["Auto Win Robot Claw (Selected)"] then
    end
    vu9.Shared.Framework.Network.Remote.Event:FireServer("FinishMinigame")
    if not vu1.Settings["Auto Win Robot Claw (Selected)"] then
    end
    task.wait()
    local v245 = vu237:getValue()
    local v246 = GetData("Cooldowns")
    local v247 = GetData("Tickets")
    if not ConfirmTime(v246["Robot Claw"]) or tonumber(v247) < 2500000 then
    end
    vu9.Shared.Framework.Network.Remote.Event:FireServer("StartMinigame", "Robot Claw", v245)
    repeat
        task.wait()
    until workspace:FindFirstChild("ClawMachine") or not vu1.Settings["Auto Win Robot Claw (Selected)"]
	
end)
v7:addClick("Reedem All Codes", "By clicking this option you will automatically claim all game codes", "Big", false, function(_)
    local v248 = require(vu9.Shared.Data.Codes)
    local v249, v250, v251 = pairs(v248)
    while true do
        local v252
        v251, v252 = v249(v250, v251)
        if v251 == nil then
            break
        end
        vu9.Shared.Framework.Network.Remote.Function:InvokeServer("RedeemCode", v251)
    end
end)
v7:addToggle("Auto Collect Playtime Rewards", "By activating this option you will automatically collect all available playtime rewards", "Big", false, function(p253)
    if p253 then
        while vu1.Settings["Auto Collect Playtime Rewards"] do
            task.wait()
            for v254 = 1, 9 do
                vu9.Shared.Framework.Network.Remote.Function:InvokeServer("ClaimPlaytime", v254)
            end
        end
    end
end)
v7:addToggle("Auto Claim Free Wheel Spin", "By activating this option you will automatically collect the free wheel spin", "Big", false, function(p255)
    if p255 then
        while vu1.Settings["Auto Claim Free Wheel Spin"] do
            task.wait()
            vu9.Shared.Framework.Network.Remote.Event:FireServer("ClaimFreeWheelSpin")
        end
    end
end)
v7:addToggle("Auto Spin Wheel", "By activating this option you will automatically spin the wheel", "Big", false, function(p256)
    if p256 then
        while vu1.Settings["Auto Spin Wheel"] do
            task.wait()
            vu9.Shared.Framework.Network.Remote.Function:InvokeServer("WheelSpin")
        end
    end
end)
v7:addToggle("Auto Collect Giant Chest", "By activating this option you will automatically collect the giant chest", "Big", false, function(p257)
    if p257 then
        while vu1.Settings["Auto Collect Giant Chest"] do
            task.wait()
            vu9.Shared.Framework.Network.Remote.Event:FireServer("ClaimChest", "Giant Chest")
        end
    end
end)
v7:addToggle("Auto Collect Void Chest", "By activating this option you will automatically collect the void chest", "Big", false, function(p258)
    if p258 then
        while vu1.Settings["Auto Collect Void Chest"] do
            task.wait()
            vu9.Shared.Framework.Network.Remote.Event:FireServer("ClaimChest", "Void Chest")
        end
    end
end)
local vu259 = {
    {
        name = "Spawn",
        path = "Workspace.Worlds.The Overworld.PortalSpawn"
    },
    {
        name = "Floating Island",
        path = "Workspace.Worlds.The Overworld.Islands.Floating Island.Island.Portal.Spawn"
    },
    {
        name = "Outer Space",
        path = "Workspace.Worlds.The Overworld.Islands.Outer Space.Island.Portal.Spawn"
    },
    {
        name = "Twilight",
        path = "Workspace.Worlds.The Overworld.Islands.Twilight.Island.Portal.Spawn"
    },
    {
        name = "The Void",
        path = "Workspace.Worlds.The Overworld.Islands.The Void.Island.Portal.Spawn"
    },
    {
        name = "Zen",
        path = "Workspace.Worlds.The Overworld.Islands.Zen.Island.Portal.Spawn"
    },
    {
        name = "Minigame Paradise",
        path = "Workspace.Worlds.Minigame Paradise.FastTravel.Spawn"
    },
    {
        name = "Dice Island",
        path = "Workspace.Worlds.Minigame Paradise.Islands.Dice Island.Island.Portal.Spawn"
    },
    {
        name = "Minecart",
        path = "Workspace.Worlds.Minigame Paradise.Islands.Minecart Forest.Island.Portal.Spawn"
    },
    {
        name = "Robot Factory",
        path = "Workspace.Worlds.Minigame Paradise.Islands.Robot Factory.Island.Portal.Spawn"
    }
}
local v260, v261, v262 = ipairs(vu259)
while true do
    local vu263
    v262, vu263 = v260(v261, v262)
    if v262 == nil then
        break
    end
    vu2:addTPButton(vu263.name, vu263.name, nil, function()
        vu9.Shared.Framework.Network.Remote.Event:FireServer("Teleport", vu263.path)
    end)
end
v8:addToggle("Show Fast Teleport", "", "Big", false, function(p264)
    if p264 then
        vu2:showFastTP()
    else
        vu2:hideFastTP()
    end
end)
v8:addToggle("Auto Teleport Islands", "When activating this option you will be randomly teleported to the islands (an option created to be used together with auto collect)", "Big", false, function(p265)
    if p265 then
        while vu1.Settings["Auto Teleport Islands"] do
            task.wait()
            local v266, v267, v268 = ipairs(vu259)
            while true do
                local v269
                v268, v269 = v266(v267, v268)
                if v268 == nil or not vu1.Settings["Auto Teleport Islands"] then
                    break
                end
                vu9.Shared.Framework.Network.Remote.Event:FireServer("Teleport", v269.path)
                task.wait(0.2)
            end
        end
    end
end)