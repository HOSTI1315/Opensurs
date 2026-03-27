-- ts file was generated at discord.gg/25ms


repeat
    wait()
until game:IsLoaded()
local vu1 = getgenv()
local v2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/refs/heads/main/Library"))():start("Drill Digging Simulator", "1.0", true)
local v3 = v2:addTab("Auto Farm")
local v4 = v2:addTab("World Options")
local v5 = v2:addTab("Auto Egg")
local vu6 = cloneref(game:GetService("Players").LocalPlayer)
local vu7 = cloneref(game:GetService("ReplicatedStorage"))
function TeleportTo(p8)
    (vu6.Character or vu6.CharacterAdded:Wait()):SetPrimaryPartCFrame(p8 * CFrame.new(0, 5, 0))
end
function GetToolPlayer()
    local v9 = vu6.Character or vu6.CharacterAdded:Wait()
    local v10 = v9:FindFirstChildOfClass("Tool")
    if v10 then
        return v10
    end
    local v11 = vu6.Backpack:FindFirstChildOfClass("Tool")
    if v11 then
        v11.Parent = v9
        return v11
    end
end
v3:addToggle("Inf Money", "", "big", false, function(p12)
    if p12 then
        while vu1.Settings["Inf Money"] do
            task.wait()
            vu7.GiveCash:FireServer(GetToolPlayer())
        end
    end
end)
v3:addToggle("Auto Drill", "", "big", false, function(p13)
    if p13 then
        while vu1.Settings["Auto Drill"] do
            task.wait()
            require(vu7.DigModule).StartDigConn(GetToolPlayer())
        end
    end
end)
v3:addToggle("Auto Buy Drill", "", "big", false, function(p14)
    if p14 then
        while vu1.Settings["Auto Buy Drill"] do
            task.wait()
            local v15 = vu7.DrillShop.GetOwnedDrills:InvokeServer(game.Players.LocalPlayer)
            local v16 = vu7.DrillShop.GetSkinPrices:InvokeServer(game.Players.LocalPlayer)
            local v17, v18, v19 = pairs(v16)
            local v20 = {}
            while true do
                local v21
                v19, v21 = v17(v18, v19)
                if v19 == nil then
                    break
                end
                table.insert(v20, {
                    Name = v19,
                    LayoutOrder = v21.LayoutOrder,
                    Price = v21.Price
                })
            end
            table.sort(v20, function(p22, p23)
                return p22.LayoutOrder < p23.LayoutOrder
            end)
            local v24, v25, v26 = ipairs(v20)
            while true do
                local v27
                v26, v27 = v24(v25, v26)
                if v26 == nil then
                    break
                end
                if not v15[v27.Name] then
                    if vu6.leaderstats.Cash.Value >= tonumber(v27.Price) then
                        vu7.DrillShop.BuySkin:InvokeServer(v27.Name)
                        vu7.DrillShop.EquipSkin:InvokeServer(v27.Name, true)
                    end
                    break
                end
            end
        end
    end
end)
v3:addToggle("Auto Win All Worlds", "", "big", false, function(p28)
    if p28 then
        while vu1.Settings["Auto Win All Worlds"] do
            task.wait()
            local v29 = vu6.Character or vu6.CharacterAdded:Wait()
            local _ = v29.Humanoid
            local v30 = v29.HumanoidRootPart
            local v31, v32, v33 = pairs(workspace.Worlds:GetChildren())
            while true do
                local v34
                v33, v34 = v31(v32, v33)
                if v33 == nil then
                    break
                end
                local v35 = v34.EndZone.EndCircle.Part
                firetouchinterest(v30, v35, 0)
                task.wait(0.1)
                firetouchinterest(v30, v35, 1)
            end
        end
    end
end)
v3:addToggle("Upscale Dig Size", "", "big", false, function(p36)
    if p36 then
        while vu1.Settings["Upscale Dig Size"] do
            task.wait()
            local v37 = GetToolPlayer()
            if v37 then
                v37:SetAttribute("DigSize", 75)
            end
        end
    end
end)
v3:addClick("UpScale Drill Power", "", "big", false, function(_)
    vu6.DrillPowerMultiplier.Value = 50
end)
v4:addToggle("Unlock All Worlds", "", "big", false, function(p38)
    if p38 then
        while vu1.Settings["Unlock All Worlds"] do
            task.wait()
            local v39 = require(vu7.WorldModule)
            local v40, v41, v42 = pairs(vu7.Worlds:GetChildren())
            while true do
                local v43
                v42, v43 = v40(v41, v42)
                if v42 == nil then
                    break
                end
                v39:UnlockWorld(v43.Name)
            end
        end
    end
end)
local v44, v45, v46 = pairs(vu7.Worlds:GetChildren())
local vu47 = vu7
local vu48 = vu6
local vu49 = vu1
local v50 = {}
while true do
    local v51
    v46, v51 = v44(v45, v46)
    if v46 == nil then
        break
    end
    table.insert(v50, v51.Name)
end
local vu52 = v4:addCombo("Select World", "", v50)
v4:addToggle("Auto Win (Selected)", "", "big", false, function(p53)
    if p53 then
        while vu49.Settings["Auto Win (Selected)"] do
            task.wait()
            local v54 = vu48.Character or vu48.CharacterAdded:Wait()
            local _ = v54.Humanoid
            local v55 = v54.HumanoidRootPart
            local v56 = vu52:getValue()
            local v57 = workspace.Worlds[v56].EndZone.EndCircle.Part
            firetouchinterest(v55, v57, 0)
            task.wait(0.1)
            firetouchinterest(v55, v57, 1)
        end
    end
end)
local v58, v59, v60 = pairs(vu47.KPets.Eggs:GetChildren())
local v61 = {}
while true do
    local v62
    v60, v62 = v58(v59, v60)
    if v60 == nil then
        break
    end
    table.insert(v61, v62.Name)
end
local vu63 = v5:addCombo("Select Egg", "", v61)
v5:addToggle("Auto Open Egg (Seleceted)", "", "big", false, function(p64)
    if p64 then
        while vu49.Settings["Auto Open Egg (Seleceted)"] do
            task.wait(1)
            local v65 = vu63:getValue()
            local v66 = vu48.leaderstats.Cash
            local v67 = vu48.PlayerGui.Main.Frames.Pets.Others.Storage.Amount.Text
            local v68, v69 = string.match(v67, "(%d+)/(%d+)")
            if v65 and (v66.Value >= vu47.KPets.Eggs[v65].Cost.Value and tonumber(v68) < tonumber(v69)) then
                vu47.KPets.Events.Hatch:FireServer(v65, 1)
            end
        end
    end
end)
v5:addClick("Open Max Egg Your Cash Can (Seleceted)", "", "big", false, function(_)
    local v70 = vu63:getValue()
    local v71 = vu48.leaderstats.Cash
    local _ = vu48.PlayerGui.Main.Frames.Pets.Others.Storage.Amount.Text
    local v72 = math.round(v71)
    if v70 and v71.Value >= vu47.KPets.Eggs[v70].Cost.Value then
        vu47.KPets.Events.Hatch:FireServer(v70, v72 / vu47.KPets.Eggs[v70].Cost.Value)
    end
end)
v5:addClick("Open Egg To Max Your Empty Slots (Seleceted)", "", "big", false, function(_)
    local v73 = vu63:getValue()
    local v74 = vu48.leaderstats.Cash
    local v75 = vu48.PlayerGui.Main.Frames.Pets.Others.Storage.Amount.Text
    local v76, v77 = string.match(v75, "(%d+)/(%d+)")
    local v78 = tonumber(v77)
    local v79 = tonumber(v76)
    if v73 and v74.Value >= vu47.KPets.Eggs[v73].Cost.Value then
        vu47.KPets.Events.Hatch:FireServer(v73, v78 - v79)
    end
end)
v5:addClick("Free Gamepass 8x Egg", "", "big", false, function(_)
    vu48.Data.Gamepasses.X8EggsHatch.Value = true
end)