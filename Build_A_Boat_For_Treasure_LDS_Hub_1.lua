-- ts file was generated at discord.gg/25ms


repeat
    wait()
until game:IsLoaded()
local vu1 = getgenv()
local vu2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/refs/heads/main/Library"))()
local vu3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/refs/heads/main/StatsGrind"))()
local v4 = vu2:start("Build a Boat for Treasures", "2.0", true)
local v5 = v4:addTab("Auto Farm")
local v6 = v4:addTab("Auto Build")
local v7 = v4:addTab("Shop Options")
local v8 = v4:addTab("Team Options")
local v9 = v4:addTab("Troll Options")
local v10 = v4:addTab("Events")
local vu11 = cloneref(game:GetService("ReplicatedStorage"))
local v12 = cloneref(game:GetService("Players"))
local vu13 = cloneref(game:GetService("TeleportService"))
local vu14 = v12.LocalPlayer
local vu15 = vu14.Character or vu14.CharacterAdded:Wait()
local _ = vu15.Humanoid
local _ = vu15.HumanoidRootPart
local function vu17(p16)
    if not vu15:FindFirstChild(p16) and vu14.Backpack:FindFirstChild(p16) then
        vu14.Backpack[p16].Parent = vu15
    end
end
local v18, v19, v20 = pairs(workspace.Teams:GetChildren())
local vu21 = vu15
local v22 = {}
local function vu26(p23)
    local v24 = game:GetService("Players"):FindFirstChild(p23)
    local v25 = {
        black = "BlackZone",
        green = "CamoZone",
        magenta = "MagentaZone",
        yellow = "New YellerZone",
        blue = "Really blueZone",
        red = "Really redZone",
        white = "WhiteZone"
    }
    if v24 and (v24.Team and v25[v24.Team.Name]) then
        return workspace:FindFirstChild(v25[v24.Team.Name])
    else
        return nil
    end
end
local function vu30(p27)
    local v28 = vu14:FindFirstChild("Data")
    if v28 then
        local v29 = v28:FindFirstChild(p27)
        if v29 then
            return v29.Value, v29.Used.Value
        end
        warn("Block nao encontrado")
    end
end
while true do
    local v31
    v20, v31 = v18(v19, v20)
    if v20 == nil then
        break
    end
    table.insert(v22, v31.Name)
end
local vu32 = nil
local vu33 = nil
local v34 = getrawmetatable(game)
setreadonly(v34, false)
local vu35 = v34.__namecall
v34.__namecall = newcclosure(function(p36, ...)
    if getnamecallmethod() == "InvokeServer" and p36.Name == "InstaLoadFunction" then
        vu33 = true
    end
    return vu35(p36, ...)
end)
local function vu37()
    repeat
        task.wait()
    until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    vu32 = game.Players.LocalPlayer.Character.HumanoidRootPart
end
v5:addToggle("Auto Farm Safe (Gold + Block)", "", "Big", false, function(p38)
    if p38 then
        local v39 = game:GetService("Players")
        local vu40 = game:GetService("Workspace")
        local vu41 = game:GetService("Lighting")
        local vu42 = v39.LocalPlayer
        local function v51(_)
            local v43 = vu42.Character
            local v44 = vu40.BoatStages.NormalStages
            for v45 = 1, 10 do
                local v46 = v45
                if not vu1.Settings["Auto Farm Safe (Gold + Block)"] then
                    break
                end
                local v47 = v44["CaveStage" .. v46]:FindFirstChild("DarknessPart")
                if v47 then
                    v43.HumanoidRootPart.CFrame = v47.CFrame
                    local v48 = Instance.new("Part", vu42.Character)
                    v48.Anchored = true
                    v48.Transparency = 0.5
                    v48.Position = vu42.Character.HumanoidRootPart.Position - Vector3.new(0, 6, 0)
                    wait(2)
                    v48:Destroy()
                end
            end
            repeat
                wait()
                v43.HumanoidRootPart.CFrame = v44.TheEnd.GoldenChest.Trigger.CFrame
            until vu41.ClockTime ~= 14
            local vu49 = false
            local vu50 = nil
            vu50 = vu42.CharacterAdded:Connect(function()
                vu49 = true
                vu50:Disconnect()
            end)
            repeat
                wait()
            until vu49
            wait(5)
        end
        local v52 = 1
        while vu1.Settings["Auto Farm Safe (Gold + Block)"] do
            task.wait()
            v51(v52)
            v52 = v52 + 1
        end
    end
end)
v5:addToggle("Auto Gold (Fast)", "", "Big", false, function(p53)
    if p53 then
        local vu54 = workspace:WaitForChild("BoatStages"):WaitForChild("NormalStages")
        repeat
            task.wait()
        until vu54.CaveStage1.DarknessPart.Event ~= nil
        spawn(function()
            while true do
                if not vu1.Settings["Auto Gold (Fast)"] then
                    return
                end
                vu37()
                for v62 = 1, 10 do
                    if vu1.Settings["Auto Gold (Fast)"] then
                        if v62 ~= 2 then
                            local v56 = vu54["CaveStage" .. v62].DarknessPart
                            local _ = v56.Event
                            if v56 then
                                local v57 = game.Players.LocalPlayer.Character
                                v57.HumanoidRootPart.CFrame = v56.CFrame
                                local v58 = Instance.new("Part", v57)
                                v58.Anchored = true
                                v58.Position = v57.HumanoidRootPart.Position - Vector3.new(0, 6, 0)
                            end
                            task.delay(0.8, function()
                                workspace.ClaimRiverResultsGold:FireServer()
                            end)
                            if v62 == 10 then
                                local v59 = game.Players.LocalPlayer
                                local v60 = (v59.Character or v59.CharacterAdded:Wait()):FindFirstChild("Humanoid")
                                if v60 then
                                    v60.Health = 0
                                end
                            else
                                local v61 = v62
                                while true do
                                    task.wait()
                                    local v62
                                    if game.Players.LocalPlayer.OtherData["Stage" .. v62].Value ~= "" then
                                        v62 = v61
                                    end
                                    if not vu1.Settings["Auto Gold (Fast)"] then
                                        v62 = v61
                                    end
                                end
                            end
                        end
                    end
                end
                repeat
                    task.wait()
                until vu33
                vu33 = false
                vu37()
            end
        end)
    end
end)
v5:addToggle("Auto Gold Block (Fast)", "", "Big", false, function(p63)
    if p63 then
        local vu64 = workspace:WaitForChild("BoatStages"):WaitForChild("NormalStages")
        local function v65()
            repeat
                task.wait()
            until not vu32
            vu32.CFrame = CFrame.new(vu32.CFrame.X - 10, vu32.CFrame.Y, vu32.CFrame.Z - 10)
            task.wait(0.1)
            vu32.CFrame = CFrame.new(vu32.CFrame.X + 10, vu32.CFrame.Y, vu32.CFrame.Z + 10)
        end
        while vu1.Settings["Auto Gold Block (Fast)"] do
            task.wait()
            if not vu1.Settings["Auto Gold Block (Fast)"] then
                break
            end
            for v66 = 1, 1 do
                local _ = v66
                repeat
                    task.wait()
                until (game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart") or not vu1.Settings["Auto Gold Block (Fast)"]
                vu32 = game.Players.LocalPlayer.Character.HumanoidRootPart
                if workspace.Gravity ~= 0 then
                    workspace.Gravity = 0
                end
                vu32.CFrame = vu64["CaveStage" .. v66].DarknessPart.CFrame
                vu64["CaveStage" .. v66].DarknessPart.Event:Fire()
                while true do
                    v65()
                    if game.Players.LocalPlayer.OtherData["Stage" .. v66 - 1].Value ~= "" then
                        break
                    end
                    if not vu1.Settings["Auto Gold Block (Fast)"] then
                        break
                    end
                end
            end
            pcall(function()
                firetouchinterest(vu32, vu64.TheEnd.GoldenChest.Trigger, 1)
                task.wait()
                firetouchinterest(vu32, vu64.TheEnd.GoldenChest.Trigger, 0)
            end)
            repeat
                task.wait()
            until vu33 == true
            vu33 = not vu1.Settings["Auto Gold Block (Fast)"]
            repeat
                task.wait()
            until workspace:FindFirstChild(game.Players.LocalPlayer.Name) and workspace:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("HumanoidRootPart") or not vu1.Settings["Auto Gold Block (Fast)"]
            workspace.ClaimRiverResultsGold:FireServer()
            for v67 = 1, 10 do
                local _ = v67
                while true do
                    task.wait()
                    if game.Players.LocalPlayer.OtherData["Stage" .. v67 - 1].Value == "" then
                        break
                    end
                    if not vu1.Settings["Auto Gold Block (Fast)"] then
                        break
                    end
                end
            end
        end
    end
end)
v5:addClick("Open Stats Grind", "", "Big", false, function(_)
    vu3.AddSlot("http://www.roblox.com/asset/?id=5445557932", "Gold", game:GetService("Players").LocalPlayer.Data.Gold)
    vu3.AddSlot("rbxassetid://1678364253", "Gold Block", game:GetService("Players").LocalPlayer.Data.GoldBlock)
end)
local vu68 = v6:addCombo("Select Team to Copy", "", {
    "white",
    "black",
    "blue",
    "green",
    "magenta",
    "red",
    "yellow"
})
local function vu71(p69, p70)
    return CFrame.new(p69) * CFrame.Angles(p70:ToEulerAnglesXYZ())
end
local function vu111(p72)
    local v73 = vu11.BuildingParts
    local v74 = workspace:FindFirstChild("FolderGridLDSHUB")
    if not v74 then
        v74 = Instance.new("Folder")
        v74.Name = "FolderGridLDSHUB"
        v74.Parent = workspace
    end
    vu71(p72.SnapC1, p72.AngleSnapC1)
    local v75 = vu71(p72.CFramePos, p72.AngleCFPos)
    if v74 then
        local function vu82(p76, p77)
            local v78, v79, v80 = pairs(p76:GetChildren())
            while true do
                local v81
                v80, v81 = v78(v79, v80)
                if v80 == nil then
                    break
                end
                if v81:IsA("BasePart") then
                    v81.CFrame = v81.CFrame + p77
                    v81.Anchored = true
                elseif v81:IsA("Model") then
                    vu82(v81, p77)
                end
            end
        end
        local v83 = v73:FindFirstChild(p72.NameBlock):Clone()
        local vu84 = v83.PPart
        v83.Parent = v74
        local v85 = v83.PrimaryPart.CFrame.Position
        vu82(v83, v75.Position - v85)
        v83:SetPrimaryPartCFrame(v75)
        vu84.Anchored = true
        vu84.Color = p72.BlockColor
        vu84.Size = p72.BlockSize
        local vu86 = vu84.Color
        if vu84 then
            local v87 = Instance.new("BoolValue")
            v87.Name = "IsZone"
            v87.Value = false
            v87.Parent = vu84
            local function vu95(p88, p89, p90)
                local v91, v92, v93 = ipairs(p88:GetChildren())
                while true do
                    local v94
                    v93, v94 = v91(v92, v93)
                    if v93 == nil then
                        break
                    end
                    if v94:IsA("BasePart") or v94:IsA("MeshPart") then
                        if not p90[v94] then
                            p90[v94] = v94.Color
                        end
                        v94.Color = p89
                    end
                    vu95(v94, p89, p90)
                end
            end
            local function vu102(p96, p97)
                local v98, v99, v100 = ipairs(p96:GetChildren())
                while true do
                    local v101
                    v100, v101 = v98(v99, v100)
                    if v100 == nil then
                        break
                    end
                    if v101:IsA("BasePart") or v101:IsA("MeshPart") and p97[v101] then
                        v101.Color = p97[v101]
                    end
                    vu102(v101, p97)
                end
            end
            local vu103 = {}
            local function v110()
                local v104 = vu26(vu14.Name)
                if v104 then
                    local v105 = v104.Position
                    local v106 = vu84.Position
                    local v107 = v104.Size
                    local v108 = v107.X / 2
                    local v109 = v107.Z / 2
                    if v106.X > v105.X + v108 or (v106.X < v105.X - v108 or (v106.Z > v105.Z + v109 or v106.Z < v105.Z - v109)) then
                        vu84.Color = Color3.fromRGB(255, 0, 0)
                        vu84.IsZone.Value = false
                        vu95(vu84, Color3.fromRGB(255, 0, 0), vu103)
                    else
                        vu84.Color = vu86
                        vu84.IsZone.Value = true
                        vu102(vu84, vu103)
                    end
                end
            end
            vu84:GetPropertyChangedSignal("Position"):Connect(v110)
            v110()
        end
    end
end
local function vu122(p112, p113, p114)
    local v115, _ = vu30(p112.Name)
    if v115 then
        local v116 = {
            NameBlock = p112.Name,
            TotalBlock = v115,
            Anchored = p112.PPart.Anchored,
            CFramePos = p112.PPart.CFrame.Position,
            AngleCFPos = p112.PPart.CFrame,
            BlockColor = p112.PPart.Color,
            BlockSize = p112.PPart.Size
        }
        if p114 then
            v116.IsZone = p112.PPart.IsZone.Value
        end
        local v117 = vu26(p113)
        local v121 = (function(p118, p119)
            local v120 = p119.CFrame:inverse() * p118.CFrame
            return {
                Position = v120.Position + v120.LookVector,
                Angle = v120
            }
        end)(p112.PPart, v117)
        v116.SnapC1 = v121.Position
        v116.AngleSnapC1 = v121.Angle
        return v116
    end
end
local function vu131(pu123)
    if pu123.IsZone then
        local v124 = vu71(pu123.SnapC1, pu123.AngleSnapC1)
        local v125 = vu71(pu123.CFramePos, pu123.AngleCFPos)
        local vu126 = nil
        local vu127 = nil
        vu127 = workspace.Blocks[vu14.Name].ChildAdded:Connect(function(p128)
            if p128.Name == pu123.NameBlock then
                vu126 = p128
                vu127:Disconnect()
                vu127 = nil
            end
        end)
        vu17("BuildingTool")
        local v129 = {
            pu123.NameBlock,
            pu123.TotalBlock,
            pu123.ZoneBlock,
            v124,
            pu123.Anchored,
            v125,
            false
        }
        vu21:WaitForChild("BuildingTool").RF:InvokeServer(unpack(v129))
        local v130 = vu126
        repeat
            task.wait()
        until vu127 == nil
        if v130 then
            vu17("ScalingTool")
            vu21.ScalingTool.RF:InvokeServer(v130, pu123.BlockSize, v125)
            vu17("PaintingTool")
            vu21.PaintingTool.RF:InvokeServer({
                {
                    v130,
                    pu123.BlockColor
                },
                {
                    v130,
                    pu123.BlockColor
                }
            })
        else
            print("Bloco n\195\163o encontrado ap\195\179s a cria\195\167\195\163o.")
        end
    end
end
local function vu141(p132, p133, p134)
    local v135, v136, v137 = ipairs(p132:GetChildren())
    local v138 = {}
    while true do
        local v139
        v137, v139 = v135(v136, v137)
        if v137 == nil then
            break
        end
        if v139:IsA("Model") and v139:FindFirstChild("PPart") then
            local v140 = vu122(v139, p133, p134)
            if v140 then
                v138[# v138 + 1] = v140
            end
        end
    end
    return v138
end
local vu142 = 1
v6:addSlider("Grid Studs (X/Y/Z)", "", 1, 100, function(p143)
    vu142 = p143
end)
local function vu154(p144)
    local v145 = workspace:FindFirstChild("FolderGridLDSHUB")
    if v145 then
        local v146, v147, v148 = pairs(v145:GetChildren())
        while true do
            local v149
            v148, v149 = v146(v147, v148)
            if v148 == nil then
                break
            end
            if v149:IsA("Model") then
                local v150, v151, v152 = pairs(v149:GetDescendants())
                while true do
                    local v153
                    v152, v153 = v150(v151, v152)
                    if v152 == nil then
                        break
                    end
                    if v153:IsA("BasePart") then
                        v153.CFrame = v153.CFrame + p144
                    end
                end
            end
        end
    end
end
local function vu177(p155)
    local v156 = workspace:FindFirstChild("FolderGridLDSHUB")
    if v156 then
        local v157 = Vector3.new(0, 0, 0)
        local v158, v159, v160 = pairs(v156:GetChildren())
        local v161 = 0
        while true do
            local v162
            v160, v162 = v158(v159, v160)
            if v160 == nil then
                break
            end
            if v162:IsA("Model") then
                local v163, v164, v165 = pairs(v162:GetDescendants())
                while true do
                    local v166
                    v165, v166 = v163(v164, v165)
                    if v165 == nil then
                        break
                    end
                    if v166:IsA("BasePart") then
                        v157 = v157 + v166.Position
                        v161 = v161 + 1
                    end
                end
            end
        end
        local v167 = v157 / v161
        local v168 = CFrame.new(v167) * CFrame.fromEulerAnglesXYZ(0, p155, 0) * CFrame.new(- v167.X, - v167.Y, - v167.Z)
        local v169, v170, v171 = pairs(v156:GetChildren())
        while true do
            local v172
            v171, v172 = v169(v170, v171)
            if v171 == nil then
                break
            end
            if v172:IsA("Model") then
                local v173, v174, v175 = pairs(v172:GetDescendants())
                while true do
                    local v176
                    v175, v176 = v173(v174, v175)
                    if v175 == nil then
                        break
                    end
                    if v176:IsA("BasePart") then
                        v176.CFrame = v168 * v176.CFrame
                    end
                end
            end
        end
    end
end
v6:addDoubleClick("-x", "+x", "big", false, function(p178, p179)
    if p178 then
        vu154(Vector3.new(- vu142, 0, 0))
    elseif p179 then
        vu154(Vector3.new(vu142, 0, 0))
    end
end)
v6:addDoubleClick("-y", "+y", "big", false, function(p180, p181)
    if p180 then
        vu154(Vector3.new(0, - vu142, 0))
    elseif p181 then
        vu154(Vector3.new(0, vu142, 0))
    end
end)
v6:addDoubleClick("-z", "+z", "big", false, function(p182, p183)
    if p182 then
        vu154(Vector3.new(0, 0, - vu142))
    elseif p183 then
        vu154(Vector3.new(0, 0, vu142))
    end
end)
v6:addDoubleClick("-Rotation", "+Rotation", "big", false, function(p184, p185)
    if p184 then
        vu177(math.rad(- 90))
    elseif p185 then
        vu177(math.rad(90))
    end
end)
v6:addToggle("Click To View Grid", "", "Big", false, function(p186)
    if p186 then
        local v187 = vu68:getValue()
        local v188, v189, v190 = pairs(game:GetService("Players"):GetChildren())
        while true do
            local v191
            v190, v191 = v188(v189, v190)
            if v190 == nil then
                break
            end
            if v191.Team.Name == v187 then
                local v192 = workspace.Blocks:FindFirstChild(v191.Name)
                if not v192 then
                    return
                end
                local v193 = vu141(v192, v191.Name, false)
                local v194, v195, v196 = ipairs(v193)
                while true do
                    local v197
                    v196, v197 = v194(v195, v196)
                    if v196 == nil then
                        break
                    end
                    vu111(v197)
                end
            end
        end
    else
        workspace:FindFirstChild("FolderGridLDSHUB"):Destroy()
    end
end)
v6:addClick("Click To Build", "", "Big", false, function(_)
    local v198 = vu141(workspace.FolderGridLDSHUB, vu14.Name, true)
    if v198 then
        local v199, v200, v201 = ipairs(v198)
        while true do
            local v202
            v201, v202 = v199(v200, v201)
            if v201 == nil then
                break
            end
            vu131(v202)
        end
        vu2:SendNotification("Your Skibid Build is DONE", "Enjoy!", true)
        workspace:FindFirstChild("FolderGridLDSHUB"):Destroy()
    end
end)
v6:addClick("Click To Build (Fast)", "", "Big", true, function(_)
    local v203 = vu141(workspace.FolderGridLDSHUB, vu14.Name, true)
    if v203 then
        local v204, v205, v206 = ipairs(v203)
        while true do
            local vu207
            v206, vu207 = v204(v205, v206)
            if v206 == nil then
                break
            end
            spawn(function()
                vu131(vu207)
            end)
            wait(0.2)
        end
        vu2:SendNotification("Your Skibid Build is DONE", "Enjoy!", true)
        workspace:FindFirstChild("FolderGridLDSHUB"):Destroy()
    end
end)
v7:addLine("Crates Options:", "Big")
local vu208 = v7:addCombo("Select Crate", "", {
    "Common Chest",
    "Uncommon Chest",
    "Rare Chest",
    "Epic Chest",
    "Legendary Chest"
})
local vu209 = v7:addInputBox("Amount (number)")
v7:addClick("Buy Crate (Selected)", "", "Big", false, function(_)
    local v210 = vu208:getValue()
    local v211 = vu209:getValue()
    workspace.ItemBoughtFromShop:InvokeServer(v210, tonumber(v211))
end)
v7:addToggle("Auto Buy Crate (Selected)", "", "Big", false, function(p212)
    if p212 then
        while vu1.Settings["Auto Buy Crate (Selected)"] do
            task.wait()
            local v213 = vu208:getValue()
            local v214 = vu209:getValue()
            workspace.ItemBoughtFromShop:InvokeServer(v213, tonumber(v214))
        end
    end
end)
v7:addLine("Block Options:", "Big")
local v215, v216, v217 = pairs(vu14.PlayerGui.ShopGui.MainFrame.TabFrame.ShopFrame.ScrollingFrameChests:GetChildren())
local v218 = {}
while true do
    local v219, v220 = v215(v216, v217)
    if v219 == nil then
        break
    end
    v217 = v219
    if v220:IsA("Frame") and (v220.Name ~= "FrameEvent" and (v220.Name ~= "Frame_001" and (v220.Name ~= "Frame_002" and (v220.Name ~= "Frame_003" and v220.Name ~= "Frame_018")))) then
        local v221, v222, v223 = pairs(v220:GetChildren())
        while true do
            local v224
            v223, v224 = v221(v222, v223)
            if v223 == nil then
                break
            end
            if v224:IsA("ImageButton") and v224:FindFirstChild("TextLabel") and (v224.TextLabel:FindFirstChild("GoldImage") and v224.TextLabel.GoldImage.Image ~= "http://www.roblox.com/asset/?id=5471638266") then
                table.insert(v218, v224.Name)
            end
        end
    end
end
local vu225 = v7:addCombo("Select Block", "", v218)
local vu226 = v7:addInputBox("Amount (number)")
v7:addClick("Buy Block (Selected)", "", "Big", false, function(_)
    local v227 = vu225:getValue()
    local v228 = vu225:getValue()
    workspace.ItemBoughtFromShop:InvokeServer(v227, tonumber(v228) or 1)
end)
v7:addToggle("Auto Buy Block (Selected)", "", "Big", false, function(p229)
    if p229 then
        while vu1.Settings["Auto Buy Block (Selected)"] do
            task.wait()
            local v230 = vu225:getValue()
            local v231 = vu226:getValue()
            workspace.ItemBoughtFromShop:InvokeServer(v230, tonumber(v231) or 1)
        end
    end
end)
v7:addClick("Buy Pine (80 Gold) (Amount)", "", "Big", false, function(_)
    local v232 = vu226:getValue()
    workspace.ItemBoughtFromShop:InvokeServer("PineTree", tonumber(v232) or 1)
end)
v7:addLine("Robux Items:", "Big")
local vu233 = {
    ["Gold+"] = 55535084,
    ["Gold++"] = 55535112,
    ["Gold+++"] = 55535174,
    ["Gold++++"] = 1056486509,
    ["+100 Glass Blocks"] = 139124094,
    ["+100 Wood Blocks"] = 139124343,
    ["+100 Neon Blocks"] = 507954328,
    ["+5 Mega Thrusters"] = 139121474,
    ["+4 Huge Wheels"] = 260358235,
    ["+5 Harpoons"] = 315266520,
    ["+5 Golden Harpoons"] = 641075523,
    ["+5 Ultra Thrusters"] = 534134763,
    ["+3 Ultra Jetpacks"] = 558757040,
    ["+3 Sonic Jet Turbines"] = 424770683,
    ["+4 Portals"] = 811892987,
    ["+5 Dragon Harpoons"] = 1109792341,
    ["+5 Duel Harpoons"] = 915766549,
    ["+4 Cookie Wheels"] = 1126385328,
    ["+3 Egg Cannons"] = 1161573715,
    ["+3 Ultra Boat Motors"] = 944487410,
    ["Double Gold"] = 851864421,
    ["Fox Character"] = 911518557,
    ["Penguin Character"] = 911519585,
    ["Chicken Character"] = 911521563
}
local v234, v235, v236 = pairs(vu233)
local v237 = {}
while true do
    local v238
    v236, v238 = v234(v235, v236)
    if v236 == nil then
        break
    end
    table.insert(v237, v236)
end
local vu239 = v7:addCombo("Select Item Robux", "", v237)
v7:addClick("Prompt Robux item (Selected)", "", "Big", false, function(_)
    local v240 = vu239:getValue()
    workspace.PromptRobuxEvent:InvokeServer(vu233[v240], "Product")
end)
local vu241 = v8:addCombo("Select Team", "", v22)
v8:addClick("Teleport to Team (Selected)", "", "Big", false, function(_)
    local v242 = vu241:getValue()
    local v243 = workspace.Teams[v242].Spawns:GetChildren()
    if # v243 > 0 then
        local v244 = v243[math.random(1, # v243)].CFrame * CFrame.new(0, 5, 0)
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(v244)
    end
end)
v8:addClick("Force Share Mode", "", "Big", false, function(_)
    workspace.SettingFunction:InvokeServer("ShareBlocks", true)
end)
v8:addToggle("Remove Isolation Lock (all teams)", "", "Big", false, function(_)
    local v245 = {
        "BlackZone",
        "CamoZone",
        "MagentaZone",
        "New YellerZone",
        "Really blueZone",
        "Really redZone",
        "WhiteZone"
    }
    while vu1.Settings["Remove Isolation Lock (all teams)"] do
        task.wait()
        local v246, v247, v248 = pairs(v245)
        while true do
            local v249
            v248, v249 = v246(v247, v248)
            if v248 == nil then
                break
            end
            local v250 = workspace:FindFirstChild(v249)
            if v250 then
                local v251 = v250:FindFirstChild("Lock")
                if v251 then
                    v251:Destroy()
                end
            end
        end
    end
end)
v9:addToggle("Infinite Gold (Visual)", "", "Big", false, function(p252)
    if p252 then
        for v253 = vu14.Data.Gold.Value, 100000000000 do
            vu14.Data.Gold.Value = vu14.Data.Gold.Value + v253
            task.wait(0.2)
        end
    end
end)
v9:addToggle("Loop Color All Yours Block", "", "Big", false, function(p254)
    if p254 then
        while vu1.Settings["Loop Color All Yours Block"] do
            task.wait()
            local v255 = vu14.Team.Name
            local v256 = game:GetService("Teams")[v255].TeamLeader.Value
            local v257 = workspace.Blocks:FindFirstChild(v256)
            local v258, v259, v260 = ipairs(v257:GetChildren())
            local v261 = {}
            local v262 = 10000
            while true do
                local v263
                v260, v263 = v258(v259, v260)
                if v260 == nil then
                    break
                end
                local v264 = {
                    v263,
                    (Color3.new(math.random(), math.random(), math.random()))
                }
                table.insert(v261, v264)
                if v262 <= # v261 then
                    vu14.Backpack.PaintingTool.RF:InvokeServer(v261)
                    v261 = {}
                end
            end
            if # v261 > 0 then
                vu14.Backpack.PaintingTool.RF:InvokeServer(v261)
            end
        end
    end
end)
v9:addToggle("Loop Delete All Blocks", "", "Big", false, function(_)
    while vu1.Settings["Loop Delete All Blocks"] do
        task.wait()
        workspace.ClearAllPlayersBoatParts:FireServer()
    end
end)
v9:addClick("Delete All Blocks", "", "Big", false, function(_)
    workspace.ClearAllPlayersBoatParts:FireServer()
end)
v10:addClick("Teleport To Christmas", "", "Big", false, function(_)
    vu13:Teleport(1930866268, vu14)
end)
v10:addClick("Teleport To Inner Cloud", "", "Big", false, function(_)
    vu13:Teleport(1930863474, vu14)
end)
v10:addClick("Teleport To Halloween", "", "Big", false, function(_)
    vu13:Teleport(1930665568, vu14)
end)