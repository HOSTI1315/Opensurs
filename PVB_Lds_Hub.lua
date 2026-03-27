-- ts file was generated at discord.gg/25ms


repeat
    wait()
until game:IsLoaded()
local vu1 = getgenv()
local v2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/refs/heads/main/Library"))():start("Plants Vs Brainrots", "3.0", true)
local v3 = v2:addTab("Main Options")
local v4 = v2:addTab("Plants")
local v5 = v2:addTab("Brainrot")
local v6 = v2:addTab("Auto Buy")
local v7 = v2:addTab("Fuse Machine")
local v8 = cloneref(game:GetService("Players"))
local vu9 = cloneref(game:GetService("ReplicatedStorage"))
local vu10 = v8.LocalPlayer
local v11 = {}
local v12 = {}
Char = newcclosure(function()
    return vu10.Character or vu10.CharacterAdded:Wait()
end)
TeleportTo = newcclosure(function(p13)
    Char():SetPrimaryPartCFrame(p13 * CFrame.new(0, 5, 0))
end)
GetPlot = newcclosure(function()
    local v14 = workspace.Plots
    local v15, v16, v17 = pairs(v14:GetChildren())
    while true do
        local v18
        v17, v18 = v15(v16, v17)
        if v17 == nil then
            break
        end
        if v18:GetAttribute("Owner") == vu10.Name then
            return v18
        end
    end
end)
PlMoney = newcclosure(function()
    return vu10.leaderstats.Money.Value
end)
PlayerHasItem = newcclosure(function(p19)
    local v20, v21, v22 = pairs(vu10.Backpack:GetChildren())
    while true do
        local v23
        v22, v23 = v20(v21, v22)
        if v22 == nil then
            break
        end
        if v23:IsA("Tool") and (string.find(v23.Name, p19) and not string.find(v23.Name, "Seed")) then
            return true, v23
        end
    end
end)
EquipTool = newcclosure(function(p24)
    local v25 = vu10:FindFirstChild("Backpack")
    local v26 = Char()
    if v25 then
        local v27, v28, v29 = pairs(v26:GetChildren())
        while true do
            local v30
            v29, v30 = v27(v28, v29)
            if v29 == nil then
                break
            end
            if v30:IsA("Tool") then
                v30.Parent = v25
            end
        end
        if p24 and p24:IsA("Tool") then
            p24.Parent = v26
        end
    end
end)
fireproximityprompt = newcclosure(function(p31, p32, p33)
    if p31.ClassName ~= "ProximityPrompt" then
        error("userdata<ProximityPrompt> expected")
    else
        local v34 = p32 or 1
        local v35 = p31.HoldDuration
        if p33 then
            p31.HoldDuration = 0
        end
        for _ = 1, v34 do
            p31:InputHoldBegin()
            if not p33 then
                wait(p31.HoldDuration)
            end
            p31:InputHoldEnd()
        end
        p31.HoldDuration = v35
    end
end)
local vu36 = {}
local function vu45(p37, p38)
    local v39 = p38:FindFirstChild("Stock")
    local v40 = p38:FindFirstChild("Buttons")
    local v41 = v40 and v40:FindFirstChild("Buy")
    if v41 then
        v41 = v40.Buy:FindFirstChild("TextLabel")
    end
    vu36[p37] = vu36[p37] or {}
    if v39 and v39:IsA("TextLabel") then
        local v42 = tonumber(v39.Text:match("x(%d+)")) or 0
        vu36[p37][p38.Name] = vu36[p37][p38.Name] or {}
        vu36[p37][p38.Name].stock = v42
    end
    if v41 and v41:IsA("TextLabel") then
        local v43 = v41.Text:gsub("[$,]", "")
        local v44 = tonumber(v43) or 0
        vu36[p37][p38.Name] = vu36[p37][p38.Name] or {}
        vu36[p37][p38.Name].price = v44
    end
end
local function v57(pu46, p47)
    local v48, v49, v50 = ipairs(p47:GetChildren())
    while true do
        local vu51
        v50, vu51 = v48(v49, v50)
        if v50 == nil then
            break
        end
        if vu51:IsA("Frame") then
            vu45(pu46, vu51)
            local v52 = vu51:FindFirstChild("Stock")
            if v52 and v52:IsA("TextLabel") then
                v52:GetPropertyChangedSignal("Text"):Connect(function()
                    vu45(pu46, vu51)
                end)
            end
            local v53 = vu51:FindFirstChild("Buttons") and vu51.Buttons:FindFirstChild("Buy")
            if v53 then
                v53 = vu51.Buttons.Buy:FindFirstChild("TextLabel")
            end
            if v53 and v53:IsA("TextLabel") then
                v53:GetPropertyChangedSignal("Text"):Connect(function()
                    vu45(pu46, vu51)
                end)
            end
        end
    end
    p47.ChildAdded:Connect(function(pu54)
        if pu54:IsA("Frame") then
            vu45(pu46, pu54)
            local v55 = pu54:FindFirstChild("Stock")
            if v55 and v55:IsA("TextLabel") then
                v55:GetPropertyChangedSignal("Text"):Connect(function()
                    vu45(pu46, pu54)
                end)
            end
            local v56 = pu54:FindFirstChild("Buttons") and pu54.Buttons:FindFirstChild("Buy")
            if v56 then
                v56 = pu54.Buttons.Buy:FindFirstChild("TextLabel")
            end
            if v56 and v56:IsA("TextLabel") then
                v56:GetPropertyChangedSignal("Text"):Connect(function()
                    vu45(pu46, pu54)
                end)
            end
        end
    end)
end
local v58 = vu10.PlayerGui.Main
v57("Seeds", v58.Seeds.Frame.ScrollingFrame)
v57("Gears", v58.Gears.Frame.ScrollingFrame)
local function vu59()
    return # vu10.Backpack:GetChildren()
end
local vu60 = {}
local function v62(p61)
    if p61:IsA("Tool") then
        if p61:GetAttribute("IsPlant") then
            vu60[p61] = {
                Name = p61:GetAttribute("ItemName"),
                Damage = p61:GetAttribute("Damage"),
                ID = p61:GetAttribute("ID"),
                tool = p61
            }
        end
    else
        return
    end
end
local function v64(p63)
    if vu60[p63] then
        vu60[p63] = nil
    end
end
local v65 = vu10
local v66, v67, v68 = pairs(vu10.WaitForChild(v65, "Backpack"):GetChildren())
local vu69 = vu36
local vu70 = vu60
local vu71 = vu10
while true do
    local v72
    v68, v72 = v66(v67, v68)
    if v68 == nil then
        break
    end
    v62(v72)
end
vu71.Backpack.ChildAdded:Connect(v62)
vu71.Backpack.ChildRemoved:Connect(v64)
local v73, v74, v75 = ipairs(GetPlot().Rows:GetChildren())
local v76 = {}
while true do
    local v77, v78 = v73(v74, v75)
    if v77 == nil then
        break
    end
    v75 = v77
    if v78:GetAttribute("Enabled") then
        table.insert(v76, v78)
    end
end
v3:addLine("Battle Options:", "Big")
v3:addToggle("Auto Brainrot Invasion", "", "big", false, function(p79)
    if p79 then
        while vu1.Settings["Auto Brainrot Invasion"] do
            task.wait()
            if not vu71.PlayerGui.Main.Rebirth.Frame.Rebirth.StillNeed.Visible then
                vu9.Remotes.MissionServicesRemotes.RequestStartInvasion:FireServer()
            end
        end
    end
end)
v3:addLine("Base Options:", "Big")
local vu80 = 0
v3:addSlider("Select Cooldown (seconds)", "", 1, 60, function(p81)
    vu80 = p81
end)
v3:addToggle("Auto Collect Cash", "", "big", false, function(p82)
    if p82 then
        while vu1.Settings["Auto Collect Cash"] do
            local v83 = Char():WaitForChild("HumanoidRootPart")
            local v84 = v83.CFrame
            local v85, v86, v87 = ipairs(GetPlot():WaitForChild("Plants"):GetChildren())
            while true do
                local v88
                v87, v88 = v85(v86, v87)
                if v87 == nil then
                    break
                end
                local vu89 = false
                local function v90()
                    vu89 = true
                end
                if not vu1.Settings["Auto Collect Cash"] then
                    v90()
                end
                if v88:GetAttribute("Money") then
                    print(v88.Name)
                    local v91 = v88:FindFirstChild("Platform"):GetChildren()[1]
                    if v91 and v91.Transparency ~= 1 then
                        v83.CFrame = v91.CFrame + Vector3.new(0, 3, 0)
                    end
                    task.wait(0.15)
                end
                if vu89 then
                    break
                end
            end
            v83.CFrame = v84
            task.wait(vu80)
        end
    end
end)
v3:addLine("Tool Options:", "Big")
v3:addToggle("Aura Hit Brainrot (Faster)", "", "big", false, function(p92)
    if p92 then
        while vu1.Settings["Aura Hit Brainrot (Faster)"] do
            task.wait()
            local v93 = Char():WaitForChild("HumanoidRootPart")
            local v94 = workspace.ScriptedMap:WaitForChild("Brainrots")
            local v95, v96, v97 = ipairs(v94:GetChildren())
            local v98 = nil
            local v99 = 25
            while true do
                local v100
                v97, v100 = v95(v96, v97)
                if v97 == nil or not vu1.Settings["Aura Hit Brainrot (Faster)"] then
                    break
                end
                if v100:IsA("Model") or v100:IsA("Part") then
                    local v101 = v100:FindFirstChild("HumanoidRootPart") or v100:FindFirstChildWhichIsA("BasePart")
                    if v101 then
                        local v102 = (v101.Position - v93.Position).Magnitude
                        if v102 < v99 then
                            v99 = v102
                            v98 = v100
                        end
                    end
                end
            end
            if v98 then
                vu9.Remotes.AttacksServer.WeaponAttack:FireServer({
                    v98.Name
                })
            end
        end
    end
end)
v3:addLine("Rebirth Options:", "Big")
v3:addToggle("Auto Rebirth", "", "big", false, function(p103)
    if p103 then
        while vu1.Settings["Auto Rebirth"] do
            task.wait()
            if not vu71.PlayerGui.Main.Rebirth.Frame.Rebirth.StillNeed.Visible then
                vu9.Remotes.Rebirth:FireServer()
            end
        end
    end
end)
v4:addLine("Garden/Row Options:", "Big")
local vu104 = 1
v4:addSlider("Select Plant Limit", "Add your plant limit, that is, the maximum you can put in total.", 1, 65, function(p105)
    vu104 = p105
end)
v4:addToggle("Auto Set Up Best Plants", "", "big", false, function(p106)
    if p106 then
        local v107 = GetPlot().Rows
        local v108, v109, v110 = pairs(vu70)
        local v111 = {}
        while true do
            local v112
            v110, v112 = v108(v109, v110)
            if v110 == nil then
                break
            end
            table.insert(v111, {
                Tool = v110,
                Name = v112.Name,
                Damage = v112.Damage,
                ID = v112.ID,
                Itemtool = v112.tool
            })
        end
        table.sort(v111, function(p113, p114)
            return (p113.Damage or 0) > (p114.Damage or 0)
        end)
        local v115 = {}
        for v116 = 1, math.min(vu104, # v111) do
            table.insert(v115, v111[v116])
        end
        local v117, v118, v119 = ipairs(v107:GetChildren())
        local v120 = {}
        while true do
            local v121
            v119, v121 = v117(v118, v119)
            if v119 == nil then
                break
            end
            if v121:GetAttribute("Enabled") then
                table.insert(v120, v121)
            end
        end
        local v122 = {}
        for v123 = 1, # v120 do
            v122[v123] = {
                totalDamage = 0,
                plants = {}
            }
        end
        local v124, v125, v126 = ipairs(v115)
        local v127 = 1
        while true do
            local v128
            v126, v128 = v124(v125, v126)
            if v126 == nil then
                break
            end
            table.sort(v122, function(p129, p130)
                return p129.totalDamage < p130.totalDamage
            end)
            local v131 = v122[v127]
            table.insert(v131.plants, v128)
            v131.totalDamage = v131.totalDamage + v128.Damage or 0
            v127 = v127 + 1
            if # v122 < v127 then
                v127 = 1
            end
        end
        local v132, v133, v134 = ipairs(v122)
        while true do
            local v135
            v134, v135 = v132(v133, v134)
            if v134 == nil then
                break
            end
            local vu136 = false
            local function v137()
                vu136 = true
            end
            local vu138 = false
            local function v139()
                vu138 = true
            end
            local v140 = v120[v134]
            local v141
            if v140 then
                local v142 = v140:FindFirstChild("Grass")
                if not v142 then
                    warn("Row sem Grass:", v140.Name)
                    v137()
                end
                local v143 = v142:GetChildren()
                table.sort(v143, function(p144, p145)
                    return tonumber(p144.Name) < tonumber(p145.Name)
                end)
                local v146, v147, v148 = ipairs(v135.plants)
                v141 = vu136
                while true do
                    local v149
                    v148, v149 = v146(v147, v148)
                    if v148 == nil then
                        break
                    end
                    local v150 = v143[v148]
                    if not v150 then
                        v139()
                    end
                    EquipTool(v149.Itemtool)
                    task.wait(0.4)
                    local v151 = v150.Position
                    local v152 = v151.Y + v150.Size.Y / 2
                    local v153 = CFrame.new(Vector3.new(v151.X, v152, v151.Z))
                    local v154 = {
                        {
                            ID = v149.ID,
                            CFrame = v153,
                            Item = v149.Name,
                            Floor = v150
                        }
                    }
                    vu9.Remotes.PlaceItem:FireServer(unpack(v154))
                end
            else
                v141 = vu136
            end
            if vu138 then
                v137()
            end
            if v141 then
                break
            end
        end
    end
end)
v4:addClick("Pick Up All Plants", "", "big", false, function()
    local v155, v156, v157 = pairs(GetPlot().Hitboxes:GetChildren())
    while true do
        local v158
        v157, v158 = v155(v156, v157)
        if v157 == nil then
            break
        end
        print(v158.Name)
        vu9.Remotes.RemoveItem:FireServer(v158.Name)
    end
end)
v5:addLine("Brainrot\'s Options:", "Big")
v5:addClick("Equip Best and Sell All", "", "big", false, function()
    vu9.Remotes.EquipBestBrainrots:FireServer()
    task.wait(0.5)
    vu9.Remotes.ItemSell:FireServer()
end)
v5:addToggle("Auto Sell When Is Full", "", "big", false, function(p159)
    if p159 then
        while vu1.Settings["Auto Sell When Is Full"] do
            task.wait()
            if vu59() >= 250 then
                vu9.Remotes.ItemSell:FireServer()
            end
        end
    end
end)
v5:addToggle("Auto Equip Best and Sell All When is full", "", "big", false, function(p160)
    if p160 then
        while vu1.Settings["Auto Equip Best and Sell All When is full"] do
            task.wait()
            if vu59() >= 250 then
                vu9.Remotes.EquipBestBrainrots:FireServer()
                task.wait(0.5)
                vu9.Remotes.ItemSell:FireServer()
            end
        end
    end
end)
v6:addLine("Shop Options:", "Big")
local v161, v162, v163 = pairs(vu71.PlayerGui.Main.Seeds.Frame.ScrollingFrame:GetChildren())
while true do
    local v164
    v163, v164 = v161(v162, v163)
    if v163 == nil then
        break
    end
    if v164:IsA("Frame") and v164.Name ~= "Padding" then
        v11[v164.Name] = v164.ViewportFrame
    end
end
local v165, v166, v167 = pairs(vu71.PlayerGui.Main.Gears.Frame.ScrollingFrame:GetChildren())
while true do
    local v168
    v167, v168 = v165(v166, v167)
    if v167 == nil then
        break
    end
    if v168:IsA("Frame") and v168.Name ~= "Padding" then
        v12[v168.Name] = v168.Icon.Image
    end
end
local vu169 = v6:addMultiImageCombo("Select Seed", "Click To Select", "", v11)
v6:addToggle("Auto Buy Seed (Selected)", "", "big", false, function(p170)
    if p170 then
        while vu1.Settings["Auto Buy Seed (Selected)"] do
            task.wait()
            local v171 = vu169:getValue()
            local v172, v173, v174 = pairs(v171)
            while true do
                local vu175
                v174, vu175 = v172(v173, v174)
                if v174 == nil then
                    break
                end
                if vu69.Seeds[vu175].stock > 0 and PlMoney() >= vu69.Seeds[vu175].price then
                    spawn(function()
                        for _ = 1, vu69.Seeds[vu175].stock do
                            vu9.Remotes.BuyItem:FireServer(vu175)
                            task.wait()
                        end
                    end)
                end
            end
        end
    end
end)
local vu176 = v6:addMultiImageCombo("Select Gear", "Click To Select", "", v12)
v6:addToggle("Auto Buy Gear (Selected)", "", "big", false, function(p177)
    if p177 then
        while vu1.Settings["Auto Buy Gear (Selected)"] do
            task.wait()
            local v178 = vu176:getValue()
            local v179, v180, v181 = pairs(v178)
            while true do
                local vu182
                v181, vu182 = v179(v180, v181)
                if v181 == nil then
                    break
                end
                if vu69.Gears[vu182].stock > 0 and PlMoney() >= vu69.Gears[vu182].price then
                    spawn(function()
                        for _ = 1, vu69.Gears[vu182].stock do
                            vu9.Remotes.BuyGear:FireServer(vu182)
                            task.wait()
                        end
                    end)
                end
            end
        end
    end
end)
local v183 = v7:addFolder("Fuse Machine")
local vu184 = {
    Cactus = {
        Brainrot = "Noobini Bananini",
        Result = "Noobini Cactusini"
    },
    Strawberry = {
        Brainrot = "Orangutini Ananassini",
        Result = "Orangutini Strawberrini"
    },
    Pumpkin = {
        Brainrot = "Svinino Bombondino",
        Result = "Svinino Pumpkinino"
    },
    Sunflower = {
        Brainrot = "Brr Brr Patapim",
        Result = "Brr Brr Sunflowerim"
    },
    ["Dragon Fruit"] = {
        Brainrot = "Bananita Dolphinita",
        Result = "Dragonfrutina Dolphinita"
    },
    Eggplant = {
        Brainrot = "Burbaloni Lulliloli",
        Result = "Eggplantini Burbalonini"
    },
    Watermelon = {
        Brainrot = "Bombardiro Crocodilo",
        Result = "Bombardilo Watermelondrilo"
    },
    Cocotank = {
        Brainrot = "Giraffa Celeste",
        Result = "Cocotanko Giraffanto"
    },
    ["Carnivorous Plant"] = {
        Brainrot = "Tralalero Tralala",
        Result = "Carnivourita Tralalerita"
    },
    ["Mr Carrot"] = {
        Brainrot = "Los Tralaleritos",
        Result = "Los Mr Carrotitos"
    },
    ["King Limone"] = {
        Brainrot = "Meowzio Sushini",
        Result = "Lemowzio"
    }
}
local v185, v186, v187 = pairs(vu184)
local v188 = {}
while true do
    local v189
    v187, v189 = v185(v186, v187)
    if v187 == nil then
        break
    end
    table.insert(v188, v187)
end
local vu190 = v183:addMultiCombo("Select Plant To Fuse", "", v188)
v183:addToggle("Auto Fuse Machine (Selected)", "", "big", false, function(p191)
    if p191 then
        while vu1.Settings["Auto Fuse Machine (Selected)"] do
            task.wait()
            local v192 = vu190:getValue()
            local v193 = workspace.ScriptedMap.FuseMachine
            local v194 = v193.PlaceBrainrot
            local v195 = v193.PlacePlant
            local v196 = v193.Confirm
            local v197 = v193.UI.GUI.Timer.Text
            if not string.match(v197, "%d") then
                local v198, v199, v200 = pairs(v192)
                while true do
                    local v201
                    v200, v201 = v198(v199, v200)
                    if v200 == nil or (string.match(v197, "%d") or not vu1.Settings["Auto Fuse Machine (Selected)"]) then
                        break
                    end
                    local v202 = vu184[v201]
                    local v203, v204 = PlayerHasItem(v202.Brainrot)
                    local v205, v206 = PlayerHasItem(v201)
                    if v205 and v203 then
                        TeleportTo(v195.CFrame)
                        EquipTool(v206)
                        task.wait(1)
                        fireproximityprompt(v195.ProximityPrompt, 1, false)
                        TeleportTo(v194.CFrame)
                        EquipTool(v204)
                        task.wait(1)
                        fireproximityprompt(v194.ProximityPrompt, 1, false)
                        task.wait(1)
                        TeleportTo(v196.CFrame)
                        fireproximityprompt(v196.ProximityPrompt, 1, false)
                    end
                end
            end
        end
    end
end)