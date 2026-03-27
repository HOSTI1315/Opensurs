-- ts file was generated at discord.gg/25ms


repeat
    wait()
until game:IsLoaded()
local vu1 = getgenv()
local v2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/refs/heads/main/Library"))():start("Brainrot Evolution", "v1.0", true)
local v3 = v2:addTab("Auto Farm")
local v4 = v2:addTab("Auto Egg")
local v5 = v2:addTab("Auto Collect")
local vu6 = cloneref(game:GetService("ReplicatedStorage"))
local vu7 = cloneref(game:GetService("Players")).LocalPlayer
function Character()
    local v8 = vu7.Character or vu7.CharacterAdded:Wait()
    if v8 then
        return v8
    end
end
function TeleportTo(p9)
    Character().HumanoidRootPart.CFrame = p9
end
function GetData(p10)
    return require(vu6.Packages.Knit).GetController("ReplicaListener"):GetReplica().Data[p10]
end
function GetPlayerDamage()
    local vu11 = require(vu6.Packages.Knit)
    local vu12 = require(vu6.GameInfo.MonsterInfo)
    local vu13 = require(vu6.GameInfo.MultiplierInfo)
    require(vu6.Shared.Abbreviation)
    local vu14 = nil
    vu11.OnStart():andThen(function()
        local v15 = vu11.GetController("ReplicaListener"):GetReplica()
        if v15 then
            local v16 = v15.Data.MonsterService.EquippedMonster
            vu14 = vu13.Damage.FinalCalculation(vu7, v15.Data) or vu12[v16].Damage or 0
        end
    end)
    if vu14 then
        return vu14
    end
end
local vu17 = require(vu6.GameInfo.MonsterInfo)
local v18, v19, v20 = pairs(vu17)
local vu21 = vu7
local vu22 = vu6
local v23 = {}
while true do
    local v24
    v20, v24 = v18(v19, v20)
    if v20 == nil then
        break
    end
    table.insert(v23, v20)
end
local vu25 = v3:addMultiCombo("Select Monster", "", v23)
v3:addToggle("Auto Attack Monster (Selected)", "", "big", false, function(p26)
    if p26 then
        while vu1.Settings["Auto Attack Monster (Selected)"] do
            task.wait()
            pcall(function()
                local v27 = vu25:getValue()
                local v28, v29, v30 = pairs(v27)
                while true do
                    local v31
                    v30, v31 = v28(v29, v30)
                    if v30 == nil or not vu1.Settings["Auto Attack Monster (Selected)"] then
                        break
                    end
                    local v32, v33, v34 = pairs(workspace:GetChildren())
                    while true do
                        local v35
                        v34, v35 = v32(v33, v34)
                        if v34 == nil or not vu1.Settings["Auto Attack Monster (Selected)"] then
                            break
                        end
                        if v35:IsA("Model") and (string.find(v35.Name, v31) and v35.PrimaryPart) then
                            local v36 = v35.PrimaryPart.CFrame
                            repeat
                                task.wait()
                                TeleportTo(v36 + Vector3.new(0, 6, 0))
                                vu22.Packages.Knit.Services.MonsterService.RF.RequestAttack:InvokeServer(v36)
                            until not v35.Parent
                        end
                    end
                end
            end)
        end
    end
end)
v3:addToggle("Auto Attack Best Monster", "", "big", true, function(p37)
    if p37 then
        while vu1.Settings["Auto Attack Best Monster"] do
            task.wait()
            pcall(function()
                local v38 = GetPlayerDamage()
                local v39, v40, v41 = pairs(vu17)
                local v42 = {}
                local v43 = nil
                while true do
                    local v44
                    v41, v44 = v39(v40, v41)
                    if v41 == nil or not vu1.Settings["Auto Attack Best Monster"] then
                        break
                    end
                    if v44.MaxHealth then
                        table.insert(v42, {
                            Name = v41,
                            Data = v44
                        })
                    end
                end
                table.sort(v42, function(p45, p46)
                    return p45.Data.MaxHealth < p46.Data.MaxHealth
                end)
                local v47, v48, v49 = ipairs(v42)
                while true do
                    local v50
                    v49, v50 = v47(v48, v49)
                    if v49 == nil or not vu1.Settings["Auto Attack Best Monster"] then
                        break
                    end
                    local v51 = v50.Data.MaxHealth
                    if math.ceil(v51 / v38) <= 20 then
                        v43 = v49
                    end
                end
                local v52 = nil
                if v43 then
                    local v53, v54, v55 = ipairs({
                        0,
                        1,
                        - 1,
                        2,
                        - 2,
                        3,
                        - 3
                    })
                    while true do
                        local v56
                        v55, v56 = v53(v54, v55)
                        if v55 == nil or not vu1.Settings["Auto Attack Best Monster"] then
                            break
                        end
                        local v57 = v42[v43 + v56]
                        if v57 and workspace:FindFirstChild(v57.Name) then
                            v52 = {
                                Name = v57.Name,
                                MaxHealth = v57.Data.MaxHealth,
                                Times = math.ceil(v57.Data.MaxHealth / v38)
                            }
                            break
                        end
                    end
                end
                local v58 = v52 and workspace:FindFirstChild(v52.Name)
                if v58 then
                    repeat
                        task.wait()
                        TeleportTo(v58.PrimaryPart.CFrame + Vector3.new(0, 6, 0))
                        vu22.Packages.Knit.Services.MonsterService.RF.RequestAttack:InvokeServer(v58.PrimaryPart.CFrame)
                    until not (v58.Parent and vu1.Settings["Auto Attack Best Monster"])
                end
            end)
        end
    end
end)
local vu59 = require(vu22.GameInfo.EggsInfo)
local v60, v61, v62 = pairs(vu59)
local v63 = {}
while true do
    local v64
    v62, v64 = v60(v61, v62)
    if v62 == nil then
        break
    end
    table.insert(v63, v62)
end
local vu65 = v4:addCombo("Select Egg", "", v63)
v4:addToggle("Auto Open Egg (Selected)", "", "big", false, function(p66)
    if p66 then
        while vu1.Settings["Auto Open Egg (Selected)"] do
            task.wait()
            pcall(function()
                local v67 = vu65:getValue()
                if math.round(GetData("Currencies").Wins) >= vu59[v67].Cost.Amount then
                    vu22.Packages.Knit.Services.EggService.RF.OpenEgg:InvokeServer(v67, 1, false)
                end
            end)
        end
    end
end)
v5:addToggle("Auto Collect Playtime Rewards", "", "big", false, function(p68)
    if p68 then
        while vu1.Settings["Auto Collect Playtime Rewards"] do
            task.wait()
            pcall(function()
                local v81 = (function()
                    local v69 = vu21.PlayerGui.Windows.Gifts.Container:GetChildren()
                    local v70 = GetData("GiftService")
                    local v71, v72, v73 = pairs(v69)
                    local v74 = {}
                    while true do
                        local v75
                        v73, v75 = v71(v72, v73)
                        if v73 == nil or not vu1.Settings["Auto Collect Playtime Rewards"] then
                            return v74
                        end
                        if v75:IsA("Frame") then
                            local v76 = v75.LayoutOrder
                            local v77 = v75.Frame.Timer.Text
                            local v78 = false
                            for v79 = 1, 11 do
                                if v70.GiftsCollected[v79] == v76 then
                                    v78 = true
                                    break
                                end
                            end
                            local v80 = {
                                id = v76,
                                status = v78 and "Collected" or (v77 == "Claim!" and "Ready" or "Waiting")
                            }
                            if v78 or (v77 == "Claim!" or not v77) then
                                v77 = nil
                            end
                            v80.timeLeft = v77
                            v74[v76] = v80
                        end
                    end
                end)()
                local v82, v83, v84 = pairs(v81)
                while true do
                    local v85
                    v84, v85 = v82(v83, v84)
                    if v84 == nil or not vu1.Settings["Auto Collect Playtime Rewards"] then
                        break
                    end
                    if v85.timeLeft == "Ready" then
                        vu22.Packages.Knit.Services.GiftService.RF.CollectGift:InvokeServer(v84)
                    end
                end
            end)
        end
    end
end)