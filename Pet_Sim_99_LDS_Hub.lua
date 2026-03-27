-- ts file was generated at discord.gg/25ms


repeat
    wait()
until game:IsLoaded()
local vu1 = getgenv()
local vu2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/refs/heads/main/Library"))():start("Pet Simulator 99", "1.0", true):addTab("Main")
local v3 = cloneref(game:GetService("Players"))
local vu4 = cloneref(game:GetService("ReplicatedStorage"))
local vu5 = v3.LocalPlayer
local vu6 = require(vu4.Library.Client.Save).Get()
Char = newcclosure(function()
    return vu5.Character or vu5.CharacterAdded:Wait()
end)
TeleportTo = newcclosure(function(p7)
    Char():SetPrimaryPartCFrame(p7 * CFrame.new(0, 5, 0))
end)
PlotId = newcclosure(function()
    return require(vu4.Library.Client.PlotCmds.ClientPlot).GetLocal().Id
end)
task.spawn(function()
    vu2:addLine("Pets Options:", "Big")
    vu2:addClick("Place Best Pets", "", "Big", false, function(_)
        require(vu4.Library.Client.PlotCmds.ClientPlot)
        local v8 = require(vu4.Library.Types.HalloweenWorld)
        local v9 = require(vu4.Library.Items.Types)
        for v10 = 1, 10 do
            vu4.Network.HalloweenWorld_PickUp:InvokeServer(v10)
        end
        local v11, v12, v13 = pairs(vu6.Inventory.HPillar)
        local v14 = {}
        while true do
            local v15
            v13, v15 = v11(v12, v13)
            if v13 == nil then
                break
            end
            local v16 = v9.From("HPillar", v15)
            local v17 = {
                id = v13,
                pet = v16,
                ganho = v8.ComputePayout(vu5, v16, 1)
            }
            table.insert(v14, v17)
        end
        table.sort(v14, function(p18, p19)
            return p18.ganho > p19.ganho
        end)
        local v20, v21, v22 = ipairs(v14)
        while true do
            local v23
            v22, v23 = v20(v21, v22)
            if v22 == nil then
                break
            end
            print(# v14)
            if v22 > 10 then
                break
            end
            vu4.Network.HalloweenWorld_PlacePet:InvokeServer(v22, v23.id)
        end
    end)
    vu2:addToggle("Auto Collect Candy", "", "Big", false, function(p24)
        if p24 then
            while vu1.Settings["Auto Collect Candy"] do
                task.wait()
                for v25 = 1, 10 do
                    vu4.Network.HalloweenWorld_Claim:InvokeServer(v25)
                end
            end
        end
    end)
    vu2:addLine("Trick or Treat:", "Big")
    local vu26 = vu2:addCombo("Select House", "", {
        "House #1",
        "House #2",
        "House #3",
        "House #4",
        "House #5"
    })
    vu2:addToggle("Auto Trick or Treat (Selected House)", "", "Big", false, function(p27)
        if p27 then
            local v28 = vu26:getValue()
            local v29 = {
                ["House #1"] = 1,
                ["House #2"] = 2,
                ["House #3"] = 3,
                ["House #4"] = 4,
                ["House #5"] = 5
            }
            while vu1.Settings["Auto Trick or Treat (Selected House)"] do
                task.wait()
                vu4.Network.Plots_Invoke:InvokeServer(PlotId(), "PurchaseEgg", v29[v28], 3)
            end
        end
    end)
    vu2:addLine("Egg\'s Options:", "Big")
    local v30 = require(vu4.Library.Directory.EggHalloween)
    local v31, v32, v33 = pairs(v30)
    local v34 = {}
    while true do
        local v35
        v33, v35 = v31(v32, v33)
        if v33 == nil then
            break
        end
        v34[v33] = v35.Icon
    end
    local vu36 = vu2:addMultiImageCombo("Select Egg", "Click to Select", "", v34)
    local vu37 = 1
    vu2:addSlider("Select Amount Slots", "", 1, 10, function(p38)
        vu37 = p38
    end)
    vu2:addToggle("Auto Open Egg (Selected)", "", "Big", false, function(p39)
        if p39 then
            while vu1.Settings["Auto Open Egg (Selected)"] do
                task.wait()
                local v40 = vu36:getValue()
                local v41, v42, v43 = pairs(v40)
                while true do
                    local v44
                    v43, v44 = v41(v42, v43)
                    if v43 == nil then
                        break
                    end
                    for v45 = 1, vu37 do
                        vu4.Network.HalloweenWorld_PickUp:InvokeServer(v45)
                        vu4.Network.HalloweenWorld_PlaceEgg:InvokeServer(v45, v44)
                    end
                end
            end
        end
    end)
end)