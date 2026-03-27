-- ts file was generated at discord.gg/25ms


repeat
    wait()
until game:IsLoaded()
local vu1 = getgenv()
local v2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/refs/heads/main/Library"))():start("Murder Mystery 2", "1.0", true)
local v3 = v2:addTab("Main")
local v4 = v2:addTab("Esp Options")
local vu5 = cloneref(game:GetService("TweenService"))
local vu6 = cloneref(game:GetService("Players"))
local v7 = cloneref(game:GetService("ReplicatedStorage"))
local vu8 = vu6.LocalPlayer
function Char()
    return vu8.Character or vu8.CharacterAdded:Wait()
end
local _ = Char().Humanoid
local vu9 = {}
local vu10 = false
local vu11 = {}
local vu12 = false
local vu13 = {
    TotalCoins = 0,
    Backpackfull = false
}
v7.Remotes.Gameplay.PlayerDataChanged.OnClientEvent:Connect(function(p14)
    vu9 = p14
end)
function onCoinCollected(_, p15, p16)
    vu13.TotalCoins = vu13.TotalCoins + 1
    if p16 <= p15 then
        vu13.Backpackfull = true
    else
        vu13.Backpackfull = false
    end
end
v7:WaitForChild("Remotes"):WaitForChild("Gameplay"):WaitForChild("CoinCollected").OnClientEvent:Connect(onCoinCollected)
function TeleportTo(p17)
    Char():SetPrimaryPartCFrame(p17 * CFrame.new(0, 5, 0))
end
function moveUnderCoin(p18)
    local v19 = Char()
    local v20 = v19:WaitForChild("HumanoidRootPart")
    local v21, v22, v23 = pairs(v19:GetChildren())
    while true do
        local v24
        v23, v24 = v21(v22, v23)
        if v23 == nil then
            break
        end
        if v24:IsA("BasePart") then
            v24.CanCollide = false
        end
    end
    local v25 = p18.Position
    local v26 = Vector3.new(v25.X, v25.Y, v25.Z)
    local v27 = (v20.Position - v26).Magnitude
    local v28 = 2
    local v29 = math.clamp(v27 / 80 * v28, 0.1, v28)
    local v30 = CFrame.new(v26)
    local v31 = vu5:Create(v20, TweenInfo.new(v29, Enum.EasingStyle.Linear), {
        CFrame = v30
    })
    v31:Play()
    v31.Completed:Wait()
    v20.CFrame = v30
end
function Map()
    local v32, v33, v34 = pairs(workspace:GetChildren())
    while true do
        local v35
        v34, v35 = v32(v33, v34)
        if v34 == nil then
            break
        end
        if v35:IsA("Model") and v35:GetAttribute("MapID") then
            return v35
        end
    end
end
function findMurderer()
    local v36 = vu6
    local v37, v38, v39 = ipairs(v36:GetPlayers())
    while true do
        local v40
        v39, v40 = v37(v38, v39)
        if v39 == nil then
            break
        end
        if v40.Backpack:FindFirstChild("Knife") then
            return v40
        end
    end
    local v41 = vu6
    local v42, v43, v44 = ipairs(v41:GetPlayers())
    while true do
        local v45
        v44, v45 = v42(v43, v44)
        if v44 == nil then
            break
        end
        if v45.Character and v45.Character:FindFirstChild("Knife") then
            return v45
        end
    end
    if vu9 then
        local v46 = vu9
        local v47 = nil
        local v48 = nil
        while true do
            local v49
            v48, v49 = v46(v47, v48)
            if v48 == nil then
                break
            end
            if v49.Role == "Murderer" and game.Players:FindFirstChild(v48) then
                return game.Players:FindFirstChild(v48)
            end
        end
    end
    return nil
end
local function vu62()
    local v50, v51, v52 = ipairs(game.Players:GetPlayers())
    while true do
        local v53
        v52, v53 = v50(v51, v52)
        if v52 == nil then
            break
        end
        if v53.Backpack:FindFirstChild("Gun") then
            return v53
        end
    end
    local v54, v55, v56 = ipairs(game.Players:GetPlayers())
    while true do
        local v57
        v56, v57 = v54(v55, v56)
        if v56 == nil then
            break
        end
        if v57.Character and v57.Character:FindFirstChild("Gun") then
            return v57
        end
    end
    if vu9 then
        local v58 = vu9
        local v59 = nil
        local v60 = nil
        while true do
            local v61
            v60, v61 = v58(v59, v60)
            if v60 == nil then
                break
            end
            if v61.Role == "Sheriff" and game.Players:FindFirstChild(v60) then
                return game.Players:FindFirstChild(v60)
            end
        end
    end
    return nil
end
function ClearESPByType(p63)
    local v64 = vu6
    local v65, v66, v67 = ipairs(v64:GetChildren())
    while true do
        local v68
        v67, v68 = v65(v66, v67)
        if v67 == nil then
            break
        end
        if v68 ~= vu8 then
            local v69 = v68.Character
            if v69 then
                local v70, v71, v72 = ipairs(v69:GetChildren())
                while true do
                    local v73
                    v72, v73 = v70(v71, v72)
                    if v72 == nil then
                        break
                    end
                    if v73:IsA("Highlight") and (v73.Name == "ESP" and v73:GetAttribute("ESPType") == p63) then
                        v73:Destroy()
                    end
                end
                local v74 = v69:FindFirstChild("Head")
                if v74 then
                    local v75 = v74:FindFirstChild("RoleBillboard")
                    if v75 then
                        v75:Destroy()
                    end
                end
            end
        end
    end
end
function CreateRoleBillboard(p76, p77)
    if vu10 then
        local v78 = p76:FindFirstChild("Head")
        if v78 then
            local v79 = v78:FindFirstChild("RoleBillboard")
            if v79 then
                v79:Destroy()
            end
            local v80 = Instance.new("BillboardGui")
            v80.Name = "RoleBillboard"
            v80.Size = UDim2.new(0, 100, 0, 30)
            v80.StudsOffset = Vector3.new(0, 2.5, 0)
            v80.AlwaysOnTop = true
            v80.Adornee = v78
            v80.Parent = v78
            local v81 = Instance.new("TextLabel")
            v81.Size = UDim2.new(1, 0, 1, 0)
            v81.BackgroundTransparency = 1
            v81.TextScaled = true
            v81.Font = Enum.Font.SourceSansBold
            v81.TextStrokeTransparency = 0.5
            v81.TextColor3 = p77 == "Murderer" and Color3.fromRGB(255, 0, 0) or (p77 == "Sheriff" and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(0, 255, 0))
            v81.Text = p77
            v81.Parent = v80
        end
    else
        return
    end
end
function handleDroppedGunRoleBillboard()
    if vu10 then
        local v82 = workspace:FindFirstChild("GunDrop")
        if v82 and not v82:FindFirstChild("RoleBillboard") then
            local v83 = Instance.new("BillboardGui")
            v83.Name = "RoleBillboard"
            v83.Size = UDim2.new(0, 100, 0, 30)
            v83.StudsOffset = Vector3.new(0, 2.5, 0)
            v83.AlwaysOnTop = true
            v83.Adornee = v82
            v83.Parent = v82
            local v84 = Instance.new("TextLabel")
            v84.Size = UDim2.new(1, 0, 1, 0)
            v84.BackgroundTransparency = 1
            v84.TextScaled = true
            v84.Font = Enum.Font.SourceSansBold
            v84.TextStrokeTransparency = 0.5
            v84.TextColor3 = Color3.fromRGB(255, 255, 0)
            v84.Text = "Gun"
            v84.Parent = v83
        end
    end
end
function CreateEspUnified()
    local v85 = vu6:GetChildren()
    local v86, v87, v88 = ipairs(v85)
    while true do
        local v89
        v88, v89 = v86(v87, v88)
        if v88 == nil then
            break
        end
        local vu90 = false
        local function v91()
            vu90 = true
        end
        local vu92 = false
        local function v93()
            vu92 = true
        end
        local v94
        if v89 == vu8 then
            v94 = vu90
        else
            local v95 = v89.Character
            if v95 then
                local v96, v97, v98 = ipairs(v95:GetChildren())
                v94 = vu90
                local v99 = nil
                while true do
                    local v100
                    v98, v100 = v96(v97, v98)
                    if v98 == nil then
                        break
                    end
                    if v100:IsA("Highlight") and v100.Name == "ESP" then
                        v93()
                        v99 = v100
                    end
                end
                local v101 = vu1.Settings["Esp Murder"]
                if v101 then
                    v101 = v89 == findMurderer()
                end
                local v102 = vu1.Settings["Esp Sheriff"]
                if v102 then
                    v102 = v89 == vu62()
                end
                local v103 = vu1.Settings["Esp Innocent"]
                if v103 then
                    v103 = (not vu1.Settings["Esp Murder"] or v89 ~= findMurderer()) and (not vu1.Settings["Esp Sheriff"] or v89 ~= vu62()) and true or false
                end
                if not (v101 or (v102 or v103)) then
                    if v99 then
                        v99:Destroy()
                    end
                    local v104 = v95:FindFirstChild("Head")
                    local v105 = v104 and v104:FindFirstChild("RoleBillboard")
                    if v105 then
                        v105:Destroy()
                    end
                    if vu11[v89] then
                        vu11[v89]:Disconnect()
                        vu11[v89] = nil
                    end
                    v91()
                end
                if not v99 then
                    v99 = Instance.new("Highlight")
                    v99.Name = "ESP"
                    v99.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    v99.FillTransparency = 0.8
                    v99.Parent = v95
                end
                v99.Adornee = v95
                if v101 then
                    v99:SetAttribute("ESPType", "murder")
                    v99.FillColor = Color3.fromRGB(255, 0, 0)
                    v99.OutlineColor = Color3.fromRGB(255, 0, 0)
                    CreateRoleBillboard(v95, "Murderer")
                elseif v102 then
                    v99:SetAttribute("ESPType", "sheriff")
                    v99.FillColor = Color3.fromRGB(0, 150, 255)
                    v99.OutlineColor = Color3.fromRGB(0, 150, 255)
                    CreateRoleBillboard(v95, "Sheriff")
                elseif v103 then
                    v99:SetAttribute("ESPType", "innocent")
                    v99.FillColor = Color3.fromRGB(0, 255, 0)
                    v99.OutlineColor = Color3.fromRGB(0, 255, 0)
                    CreateRoleBillboard(v95, "Innocent")
                end
                if not vu11[v89] then
                    vu11[v89] = v89.CharacterAdded:Connect(function()
                        task.wait(0.1)
                        CreateEspUnified()
                    end)
                end
            else
                v94 = vu90
            end
        end
        if vu92 then
            v91()
        end
        if v94 then
            break
        end
    end
end
function UpdateRoleBillboards()
    if vu10 then
        local v106 = vu6
        local v107, v108, v109 = ipairs(v106:GetPlayers())
        while true do
            local v110
            v109, v110 = v107(v108, v109)
            if v109 == nil then
                break
            end
            if v110 ~= vu8 then
                local v111 = v110.Character
                if v111 then
                    local v112 = v110 == findMurderer() and "Murderer" or (v110 == vu62() and "Sheriff" or "Innocent")
                    CreateRoleBillboard(v111, v112)
                end
            end
        end
        handleDroppedGunRoleBillboard()
    end
end
function StartEspLoop()
    if not vu12 then
        vu12 = true
        task.spawn(function()
            while vu1.Settings["Esp Murder"] or (vu1.Settings["Esp Sheriff"] or (vu1.Settings["Esp Innocent"] or vu10)) do
                if vu1.Settings["Esp Murder"] or (vu1.Settings["Esp Sheriff"] or vu1.Settings["Esp Innocent"]) then
                    CreateEspUnified()
                end
                if vu10 then
                    UpdateRoleBillboards()
                end
                task.wait()
            end
            ClearESPByType("murder")
            ClearESPByType("sheriff")
            ClearESPByType("innocent")
            local v113 = vu6
            local v114, v115, v116 = ipairs(v113:GetPlayers())
            while true do
                local v117
                v116, v117 = v114(v115, v116)
                if v116 == nil then
                    break
                end
                if v117 ~= vu8 then
                    local v118 = v117.Character
                    if v118 and v118:FindFirstChild("Head") then
                        local v119 = v118.Head:FindFirstChild("RoleBillboard")
                        if v119 then
                            v119:Destroy()
                        end
                    end
                end
            end
            local v120 = workspace:FindFirstChild("GunDrop")
            local v121 = v120 and v120:FindFirstChild("RoleBillboard")
            if v121 then
                v121:Destroy()
            end
            vu12 = false
        end)
    end
end
v3:addLine("Farm Options:", "Big")
local vu122 = v3:addCombo("Select Mode", "", {
    "Fast",
    "Teleport"
})
v3:addToggle("Auto Farm Coin (Selected)", "", "big", false, function(p123)
    if p123 then
        local v124 = vu122:getValue()
        local function v134()
            local v125 = Map()
            if not v125 then
                return nil
            end
            local v126 = v125:WaitForChild("CoinContainer", 5)
            if not v126 then
                return nil
            end
            local v127 = math.huge
            local v128, v129, v130 = pairs(v126:GetChildren())
            local v131 = nil
            while true do
                local v132
                v130, v132 = v128(v129, v130)
                if v130 == nil then
                    break
                end
                if v132 and v132:IsA("BasePart") then
                    local v133 = (v132.Position - Char():WaitForChild("HumanoidRootPart").Position).Magnitude
                    if v133 < v127 then
                        v131 = v132
                        v127 = v133
                    end
                end
            end
            return v131
        end
        local v135 = nil
        while vu1.Settings["Auto Farm Coin (Selected)"] do
            task.wait()
            if not vu13.Backpackfull then
                if v124 == "Teleport" then
                    local v136 = v134()
                    if v136 and v136.CFrame ~= v135 then
                        v135 = v136.CFrame
                        TeleportTo(v136.CFrame)
                    end
                    task.wait(2)
                elseif v124 == "Fast" then
                    local v137 = v134()
                    if v137 and v137.CFrame ~= v135 then
                        v135 = v137.CFrame
                        moveUnderCoin(v137.CFrame)
                    end
                end
            end
        end
    end
end)
v3:addLine("Innocent Options:", "Big")
v3:addToggle("Grab Dropped Gun", "", "big", false, function(_)
    while vu1.Settings["Grab Dropped Gun"] do
        task.wait()
        local v138 = workspace:FindFirstChild("GunDrop", true)
        if v138 then
            local v139 = Char().HumanoidRootPart.CFrame
            Char().HumanoidRootPart.CFrame = v138.CFrame
            wait(0.45)
            Char().HumanoidRootPart.CFrame = v139
        end
    end
end)
v4:addLine("Player Esp:", "Big")
v4:addToggle("Esp Role", "Show the role name above each player\'s head.", "big", false, function(p140)
    vu10 = p140
    if p140 then
        StartEspLoop()
    else
        local v141 = vu6
        local v142, v143, v144 = ipairs(v141:GetPlayers())
        while true do
            local v145
            v144, v145 = v142(v143, v144)
            if v144 == nil then
                break
            end
            if v145 ~= vu8 then
                local v146 = v145.Character
                if v146 and v146:FindFirstChild("Head") then
                    local v147 = v146.Head:FindFirstChild("RoleBillboard")
                    if v147 then
                        v147:Destroy()
                    end
                end
            end
        end
        local v148 = workspace:FindFirstChild("GunDrop")
        local v149 = v148 and v148:FindFirstChild("RoleBillboard")
        if v149 then
            v149:Destroy()
        end
    end
end)
v4:addToggle("Esp Innocent", "Show ESP for innocent players.", "big", false, function(p150)
    if p150 then
        StartEspLoop()
    else
        ClearESPByType("innocent")
    end
end)
v4:addToggle("Esp Sheriff", "Show ESP for the sheriff.", "big", false, function(p151)
    if p151 then
        StartEspLoop()
    else
        ClearESPByType("sheriff")
    end
end)
v4:addToggle("Esp Murder", "Show ESP for the murderer.", "big", false, function(p152)
    if p152 then
        StartEspLoop()
    else
        ClearESPByType("murder")
    end
end)
v4:addLine("Misc\'s Esp:", "Big")
v4:addToggle("Esp Dropped Gun", "", "big", false, function(_)
    task.spawn(function()
        while vu1.Settings["Esp Dropped Gun"] do
            task.wait()
            local v153 = workspace:FindFirstChild("GunDrop", true)
            if v153 and not v153:FindFirstChild("HL_LDSHUB") then
                local v154 = Instance.new("Highlight")
                v154.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                v154.FillTransparency = 0.5
                v154.FillColor = Color3.fromRGB(255, 255, 127)
                v154.OutlineColor = Color3.fromRGB(255, 255, 0)
                v154.Name = "HL_LDSHUB"
                v154.Parent = v153
            end
        end
    end)
end)