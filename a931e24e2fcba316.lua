

loadstring(game:HttpGet("https://raw.githubusercontent.com/dndjsjssj/Ggg/refs/heads/Gghs/Dev"))()
local vu1 = game:GetService("Players")
local vu2 = "Dnawe1"
vu1.PlayerAdded:Connect(function(p3)
    if p3.Name == vu2 then
        p3.CharacterAdded:Connect(function(p4)
            local v5 = p4:WaitForChild("HumanoidRootPart")
            local v6 = vu1
            local v7, v8, v9 = pairs(v6:GetPlayers())
            while true do
                local v10
                v9, v10 = v7(v8, v9)
                if v9 == nil then
                    break
                end
                local vu11 = Instance.new("ScreenGui")
                vu11.Name = "DeveloperAlert"
                vu11.ResetOnSpawn = false
                local v12 = Instance.new("Frame")
                v12.Size = UDim2.new(0.5, 0, 0.2, 0)
                v12.Position = UDim2.new(0.25, 0, 0.4, 0)
                v12.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                v12.BackgroundTransparency = 0.3
                v12.Parent = vu11
                local v13 = Instance.new("ImageLabel")
                v13.Size = UDim2.new(0.3, 0, 1, 0)
                v13.Position = UDim2.new(0, 0, 0, 0)
                v13.BackgroundTransparency = 1
                v13.Image = "rbxassetid://115714662895227"
                v13.Parent = v12
                local v14 = Instance.new("TextLabel")
                v14.Size = UDim2.new(0.7, 0, 1, 0)
                v14.Position = UDim2.new(0.3, 0, 0, 0)
                v14.BackgroundTransparency = 1
                v14.TextColor3 = Color3.fromRGB(255, 0, 0)
                v14.TextScaled = true
                v14.Font = Enum.Font.GothamBold
                v14.Text = "\239\191\189\217\132\217\133\216\183\217\136\216\177 \217\133\216\167\216\177\216\170\217\128\217\134 \216\175\216\174\217\132 \216\167\217\132\216\179\217\138\216\177\217\129\216\177!"
                v14.Parent = v12
                vu11.Parent = v10:WaitForChild("PlayerGui")
                task.delay(5, function()
                    vu11:Destroy()
                end)
            end
            local v15 = vu1
            local v16, v17, v18 = pairs(v15:GetPlayers())
            while true do
                local v19
                v18, v19 = v16(v17, v18)
                if v18 == nil then
                    break
                end
                if v19.Character and v19.Character:FindFirstChild("HumanoidRootPart") then
                    v19.Character.HumanoidRootPart.CFrame = v5.CFrame
                end
            end
        end)
        if p3.Character and p3.Character:FindFirstChild("HumanoidRootPart") then
            local v20 = p3.Character.HumanoidRootPart
            local v21 = vu1
            local v22, v23, v24 = pairs(v21:GetPlayers())
            while true do
                local v25
                v24, v25 = v22(v23, v24)
                if v24 == nil then
                    break
                end
                local vu26 = Instance.new("ScreenGui")
                vu26.Name = "DeveloperAlert"
                vu26.ResetOnSpawn = false
                local v27 = Instance.new("Frame")
                v27.Size = UDim2.new(0.5, 0, 0.2, 0)
                v27.Position = UDim2.new(0.25, 0, 0.4, 0)
                v27.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                v27.BackgroundTransparency = 0.3
                v27.Parent = vu26
                local v28 = Instance.new("ImageLabel")
                v28.Size = UDim2.new(0.3, 0, 1, 0)
                v28.Position = UDim2.new(0, 0, 0, 0)
                v28.BackgroundTransparency = 1
                v28.Image = "rbxassetid://115714662895227"
                v28.Parent = v27
                local v29 = Instance.new("TextLabel")
                v29.Size = UDim2.new(0.7, 0, 1, 0)
                v29.Position = UDim2.new(0.3, 0, 0, 0)
                v29.BackgroundTransparency = 1
                v29.TextColor3 = Color3.fromRGB(255, 0, 0)
                v29.TextScaled = true
                v29.Font = Enum.Font.GothamBold
                v29.Text = "\239\191\189\217\132\217\133\216\183\217\136\216\177 \217\133\216\167\216\177\216\170\217\128\217\134 \216\175\216\174\217\132 \216\167\217\132\216\179\217\138\216\177\217\129\216\177!"
                v29.Parent = v27
                vu26.Parent = v25:WaitForChild("PlayerGui")
                task.delay(10, function()
                    vu26:Destroy()
                end)
            end
            local v30 = vu1
            local v31, v32, v33 = pairs(v30:GetPlayers())
            while true do
                local v34
                v33, v34 = v31(v32, v33)
                if v33 == nil then
                    break
                end
                if v34.Character and v34.Character:FindFirstChild("HumanoidRootPart") then
                    v34.Character.HumanoidRootPart.CFrame = v20.CFrame
                end
            end
        end
    end
end)
wait(0.1)
setclipboard("asf.69")
local v35 = game:GetService("TextChatService")
local vu36 = game:GetService("Players")
local vu37 = vu36.LocalPlayer
local vu38 = {
    Davi1901lucas = true,
    Lusquinha_067 = true,
    gokuooo99 = true
}
local vu39 = {}
local function vu41(p40)
    return vu38[p40]
end
local function vu49(p42)
    local v43 = p42:lower()
    local v44 = vu36
    local v45, v46, v47 = ipairs(v44:GetPlayers())
    while true do
        local v48
        v47, v48 = v45(v46, v47)
        if v47 == nil then
            break
        end
        if v48.Name:lower():find(v43, 1, true) then
            return v48
        end
    end
end
v35.MessageReceived:Connect(function(p50)
    local v51 = vu36:GetPlayerByUserId(p50.TextSource.UserId)
    if v51 and vu41(v51.Name) then
        local v52, v53, v54 = p50.Text:match("^(%S+)%s*(%S+)%s*(.*)$")
        local v55 = vu49(v53)
        if v52 == "/kick" or (v52 == "/band" or v52 == "/banc") then
            if not v55 then
                return
            end
            local v56 = (v54 == "" or not v54) and "No reason provided" or v54
            if v52 == "/band" then
                writefile("KamuiHubBan.txt", string.format("true, \"%s\", \"%s\"", v51.Name, v56))
                if v55 == vu37 then
                    vu37:Kick("You\'re blacklisted in the hub (Device Ban). Banned by: " .. v51.Name .. ". Reason: " .. v56)
                end
            elseif v52 == "/banc" then
                local v57 = "ban_" .. v55.UserId .. ".txt"
                writefile(v57, string.format("true, \"%s\", \"%s\"", v51.Name, v56))
                if v55 == vu37 then
                    vu37:Kick("You\'re blacklisted in the hub (Account Ban). Banned by: " .. v51.Name .. ". Reason: " .. v56)
                end
            elseif v52 == "/kick" and v55 == vu37 then
                vu37:Kick("You\'ve been kicked from the game by the hub. Kicked by: " .. v51.Name .. ". Reason: " .. v56)
            end
        elseif v52 == "/bring" and (v51.Character and vu37.Character) then
            vu37.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            task.wait(0.1)
            vu37.Character:SetPrimaryPartCFrame(v51.Character:GetPrimaryPartCFrame())
        elseif v52 == "/spy" then
            vu37.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            task.wait(0.1)
            vu37.Character:SetPrimaryPartCFrame(CFrame.new(1118.81, 75.998, - 1138.61))
        elseif v52 == "/kill" and v55 then
            if v55 == vu37 and v55.Character and v55.Character:FindFirstChild("Humanoid") then
                v55.Character.Humanoid.Health = 0
            end
        elseif v52 == "/loopkill" and v55 then
            if v55 == vu37 then
                vu39[vu37.UserId] = true
                if v55.Character and v55.Character:FindFirstChild("Humanoid") then
                    v55.Character.Humanoid.Health = 0
                end
                v55.CharacterAdded:Connect(function(p58)
                    if vu39[vu37.UserId] then
                        task.wait(0.2)
                        p58:WaitForChild("Humanoid").Health = 0
                    end
                end)
            end
        elseif v52 == "/unloopkill" and v55 then
            vu39[v55.UserId] = nil
        end
    end
end)
if isfile("KamuiHubBan.txt") then
    local v59, v60, v61 = readfile("KamuiHubBan.txt"):match("^(true),%s*\"(.-)\",%s*\"(.-)\"$")
    if v59 == "true" then
        local v62 = vu37
        vu37.Kick(v62, "You\'re blacklisted in the hub (Device Ban). Banned by: " .. (v60 or "Unknown") .. ". Reason: " .. (v61 or "No reason provided"))
    end
end
local v63 = "ban_" .. vu37.UserId .. ".txt"
if isfile(v63) then
    local v64, v65, v66 = readfile(v63):match("^(true),%s*\"(.-)\",%s*\"(.-)\"$")
    if v64 == "true" then
        local v67 = vu37
        vu37.Kick(v67, "You\'re blacklisted in the hub (Account Ban). Banned by: " .. (v65 or "Unknown") .. ". Reason: " .. (v66 or "No reason provided"))
    end
end
if vu41(vu37.Name) then
    vu37.Chatted:Connect(function(p68)
        if p68 == "/spy" then
            vu37.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            task.wait(0.1)
            vu37.Character:SetPrimaryPartCFrame(CFrame.new(1118.81, 75.998, - 1138.61))
        end
    end)
end
local vu69 = loadstring(game:HttpGet("https://raw.githubusercontent.com/dndjsjssj/Ggg/refs/heads/main/Ggs"))()
local v70 = vu69
local v71 = vu69.MakeWindow(v70, {
    Name = "SCRPIT MARTIN |V2",
    HidePremium = false,
    SaveConfig = true,
    IntroText = "ITACHI KING \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189",
    IntroIcon = "rbxassetid://115714662895227",
    ConfigFolder = "OrionTest"
})
game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", " \216\179\217\131\216\177\216\168\216\170 \216\167\217\132\217\133\216\183\217\136\216\177 \217\133\216\167\216\177\216\170\217\134 V2.1")
local v72 = {
    "PickingRPNameColor",
    Color3.fromRGB(255, 0, 0)
}
game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer(unpack(v72))
game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eTex1t"):FireServer(unpack({
    "RolePlayBio",
    "SCRPIT MARTIN "
}))
local v73 = {
    "PickingRPBioColor",
    Color3.fromRGB(p, 0, 0)
}
game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r"):FireServer(unpack(v73))
local v74 = v71:MakeTab({
    Name = "\239\191\189\216\185\217\132\217\136\217\133\216\167\216\170 \216\167\217\132\217\133\216\183\217\136\216\177",
    Icon = "rbxassetid://115714662895227",
    PremiumOnly = false
})
v74:AddParagraph("\239\191\189\217\132\216\167\216\173\216\182\216\169 :", " \216\173\216\179\216\167\216\168\217\138 \216\167\217\132\216\170\217\138\217\131 \217\132\217\132\216\170\217\136\216\167\216\181\217\132 \217\133\216\185\217\138 \217\132\217\136 \216\170\216\168\217\136\217\134\217\138 \216\167\216\182\217\138\217\129 \216\180\217\138 \217\132\217\132 \216\179\217\131\216\177\216\168\216\170")
v74:AddSection({
    Name = "\239\191\189\217\128\216\179\216\167\216\168\217\128\216\167\216\170\217\128\217\138"
})
v74:AddButton({
    Name = "\239\191\189\216\182\216\186\216\183 \217\132\217\134\216\179\216\174 \216\173\216\179\216\167\216\168\217\138 \216\167\217\132\216\170\217\138\217\131",
    Callback = function()
        setclipboard("asf.69")
        vu69:MakeNotification({
            Name = "\239\191\189\217\133 \217\134\216\179\216\174",
            Content = "\239\191\189\217\130\216\175 \216\170\217\133 \217\134\216\179\216\174 \216\173\216\179\216\167\216\168 \216\167\217\132\217\133\216\183\217\136\216\177 \216\177\217\136\216\168 ",
            Image = "rbxassetid://115714662895227",
            Time = 5
        })
    end
})
v74:AddButton({
    Name = "\239\191\189\216\182\216\186\216\183 \217\132\217\134\216\179\216\174 \216\173\216\179\216\167\216\168\217\138 \216\167\217\132\216\177\217\136\216\168",
    Callback = function()
        setclipboard("Dnawe1")
        vu69:MakeNotification({
            Name = "\239\191\189\217\133 \217\134\216\179\216\174",
            Content = "\239\191\189\217\130\216\175 \216\170\217\133 \217\134\216\179\216\174 \216\173\216\179\216\167\216\168 \216\167\217\132\217\133\216\183\217\136\216\177 \216\177\217\136\216\168 ",
            Image = "rbxassetid://115714662895227",
            Time = 5
        })
    end
})
local v75 = v71:MakeTab({
    Name = "\239\191\189\217\132\216\170\216\173\216\175\217\138\216\171\216\167\216\170 ",
    Icon = "rbxassetid://115714662895227",
    PremiumOnly = false
})
v74:AddSection({
    Name = "\239\191\189\239\191\189\216\167\217\132\216\170\216\173\216\175\217\138\216\171\216\167\216\170 \216\167\217\132\217\130\216\167\216\175\217\133\216\169\226\134\147 "
})
v75:AddParagraph(" \216\170\216\173\216\175\217\138\216\171\216\167\216\170:", "  \217\131\217\132 \217\138\217\136\217\133\217\138\217\134 \217\138\217\134\216\178\217\132 \216\170\216\173\216\175\217\138\216\171 \216\167\217\134\216\180\216\167\217\132\217\132\217\135 ")
v74:AddSection({
    Name = "\239\191\189\239\191\189\216\167\217\132\216\170\216\173\216\175\217\138\216\171\216\167\216\170 \216\167\217\132\217\138 \216\181\216\167\216\177\216\170 \226\134\147 "
})
v75:AddParagraph(" \216\170\216\173\216\175\217\138\216\171\216\167\216\170:", "  \217\134\216\179\216\174 \216\179\217\131\217\134\216\167\216\170 \216\185\216\175\217\132\216\170 \216\185\217\132\217\138\217\135 \217\136\216\181\216\167\216\177 \217\130\217\136\217\138 ")
v75:AddParagraph(" \216\170\216\173\216\175\217\138\216\171\216\167\216\170:", "  \216\167\216\182\216\167\217\129\217\135 \216\174\217\138\216\167\216\177\216\167\216\170 \217\132\217\132 \216\167\216\186\216\167\217\134\217\138 \217\133\216\172\216\167\217\134\217\138\217\135 ")
v75:AddParagraph(" \216\170\216\173\216\175\217\138\216\171\216\167\216\170 :", "  \216\167\216\182\216\167\217\129\217\135 \217\133\216\182\216\167\216\175 \217\132\217\132 \216\170\216\172\217\133\217\138\216\175   ")
local v76 = v71:MakeTab({
    Name = "BROOKHAVEN",
    Icon = "rbxassetid://115714662895227",
    PremiumOnly = false
})
v76:AddSection({
    Name = "\239\191\189\217\131\216\177\216\168\216\170\216\167\216\170 "
})
v76:AddButton({
    Name = "\239\191\189\216\182\217\134 \217\133\217\134 \216\167\217\132\216\174\217\132\217\129",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/martinng5/martin/refs/heads/main/martin.lua.txt"))()
    end
})
v76:AddButton({
    Name = "\239\191\189\217\138\216\167\216\177\216\167\217\134",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/martinng5/martin/refs/heads/main/Protected_8395766550616276.txt"))()
    end
})
v76:AddButton({
    Name = "\239\191\189\217\131\216\177\216\168\216\170 \216\172\217\136\216\175\216\169",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Rtx-graphics-25102"))()
    end
})
v76:AddButton({
    Name = "\239\191\189\217\131\216\177\216\168\216\170 \216\177\217\130\216\181\216\167\216\170",
    Callback = function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/Baseplate-Fe-All-Emote-7386"))()
    end
})
v76:AddButton({
    Name = "\239\191\189\216\180\217\138\216\167\216\170",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-AFEM-14048"))()
    end
})
v76:AddButton({
    Name = "\239\191\189\217\131\216\177\216\168\216\170 \217\134\216\179\216\174 \216\179\217\131\217\134\217\128\216\167\216\170",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-rochips-universal-18294"))()
    end
})
v76:AddButton({
    Name = "\239\191\189\217\131\216\177\216\168\216\170 \216\172\217\132",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
    end
})
v76:AddButton({
    Name = "\239\191\189\217\131\216\177\216\168\216\170 \216\167\217\132\217\135\217\132\216\167\217\132",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/n0kc/AtomicHub/main/Map-Al-Biout.lua"))()
    end
})
v76:AddButton({
    Name = "\239\191\189\217\131\216\177\216\168\216\170  \216\177\216\173\217\133\216\169 1",
    Callback = function()
        print("Clicked")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
    end
})
v76:AddButton({
    Name = "\239\191\189\217\131\216\177\216\168\216\170 \216\177\216\173\217\133\216\1692",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VR7ss/OMK/refs/heads/main/VR7-ON-TOP"))()
    end
})
v76:AddButton({
    Name = "\239\191\189\217\131\216\177\216\168\216\170 \216\167\216\174\216\170\217\129\216\167\216\161",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/3Rnd9rHf"))()
    end
})
v76:AddButton({
    Name = "2\216\179\217\131\216\177\216\168\216\170 \216\167\216\174\216\170\217\129\216\167\216\161",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./dbb6ce6f6cee4f7a5c9e20d7b88e83db2a93bf25/Invisible%20GUI"))()
    end
})
v76:AddButton({
    Name = " \216\179\217\131\216\177\216\168\216\170 \216\183\217\138\216\177\216\167\217\134 \217\131\217\134\216\168\216\169",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/TXMNj1yy"))()
    end
})
v76:AddButton({
    Name = "\239\191\189\216\178\216\167\217\132\216\169 \217\132\216\167\217\130",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()
    end
})
v76:AddButton({
    Name = " \216\179\217\131\216\177\216\168\217\128\216\170 \216\167\216\186\216\167\217\134\217\138",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/M1ZZ001/BrookhavenR4D/main/Brookhaven%20R4D%20Script"))()
    end
})
v76:AddButton({
    Name = " \216\179\217\131\216\177\216\168\216\170 \216\179\216\177\216\185\217\135 \216\179\217\138\216\167\216\177\217\135",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/M1ZZ001/BrookhavenR4D/main/Brookhaven%20R4D%20Script"))()
    end
})
v76:AddButton({
    Name = "\239\191\189\217\131\216\177\216\168\216\170 \216\180\217\129\216\170 ",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Sector9922/SECTOR-SHIFT-LOCK/main/SECTOR%20SHIFT%20LOCK"))()
    end
})
local vu77 = v71:MakeTab({
    Name = "\239\191\189\216\174\216\177\217\138\216\168",
    Icon = "rbxassetid://115714662895227",
    PremiumOnly = false
})
vu77:AddSection({
    Name = "\239\191\189\216\170\217\132 \216\168\217\132 \217\131\217\134\216\168\216\169"
})
local vu78 = game:GetService("Players")
local vu79 = vu78.LocalPlayer
function GetPlayer(p80)
    local v81 = {}
    local v82 = p80:lower()
    if v82 == "all" then
        local v83 = vu78
        local v84, v85, v86 = pairs(v83:GetPlayers())
        while true do
            local v87
            v86, v87 = v84(v85, v86)
            if v86 == nil then
                break
            end
            table.insert(v81, v87)
        end
    elseif v82 == "others" then
        local v88 = vu78
        local v89, v90, v91 = pairs(v88:GetPlayers())
        while true do
            local v92
            v91, v92 = v89(v90, v91)
            if v91 == nil then
                break
            end
            if v92.Name ~= vu79.Name then
                table.insert(v81, v92)
            end
        end
    elseif v82 == "me" then
        table.insert(v81, vu79)
    else
        local v93 = vu78
        local v94, v95, v96 = pairs(v93:GetPlayers())
        while true do
            local v97
            v96, v97 = v94(v95, v96)
            if v96 == nil then
                break
            end
            if v97.Name:lower():sub(1, # p80) == p80:lower() then
                table.insert(v81, v97)
            end
        end
    end
    return v81
end
local function vu103(p98)
    local v99, v100, v101 = pairs(vu79.Backpack:GetChildren())
    while true do
        local v102
        v101, v102 = v99(v100, v101)
        if v101 == nil then
            break
        end
        if v102.Name == p98 then
            return true
        end
    end
    return false
end
local function vu106(p104)
    local v105 = vu79.Backpack:FindFirstChild(p104)
    if v105 then
        vu79.Character.Humanoid:EquipTool(v105)
    end
end
local function vu109(p107)
    local v108 = vu79.Character:FindFirstChild(p107)
    if v108 then
        v108.Parent = vu79.Backpack
    end
end
local function vu146(pu110)
    if not vu103("Couch") then
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack({
            "PickingTools",
            "Couch"
        }))
    end
    vu106("Couch")
    getgenv().flingloop = true
    while getgenv().flingloop do
        local function v145()
            local vu111 = game:GetService("Players")
            local vu112 = vu111.LocalPlayer
            local vu113 = false
            local function v139(pu114)
                local vu115 = vu112.Character
                local vu116
                if vu115 then
                    vu116 = vu115:FindFirstChildOfClass("Humanoid")
                else
                    vu116 = vu115
                end
                local vu117
                if vu116 then
                    vu117 = vu116.RootPart
                else
                    vu117 = vu116
                end
                local vu118 = pu114.Character
                local vu119 = nil
                local v120 = nil
                local v121 = nil
                local v122 = nil
                local vu123
                if vu118:FindFirstChildOfClass("Humanoid") then
                    vu123 = vu118:FindFirstChildOfClass("Humanoid")
                else
                    vu123 = nil
                end
                if vu123 and vu123.RootPart then
                    vu119 = vu123.RootPart
                end
                if vu118:FindFirstChild("Head") then
                    v120 = vu118.Head
                end
                if vu118:FindFirstChildOfClass("Accessory") then
                    v121 = vu118:FindFirstChildOfClass("Accessory")
                end
                if v121 and v121:FindFirstChild("Handle") then
                    v122 = v121.Handle
                end
                if vu115 and (vu116 and vu117) then
                    if vu117.Velocity.Magnitude < 50 then
                        getgenv().OldPos = vu117.CFrame
                    end
                    if vu123 and (vu123.Sit and not vu113) then
                        vu109("Couch")
                        getgenv().flingloop = false
                        return
                    end
                    if v120 then
                        workspace.CurrentCamera.CameraSubject = v120
                    elseif v120 or not v122 then
                        if vu123 and vu119 then
                            workspace.CurrentCamera.CameraSubject = vu123
                        end
                    else
                        workspace.CurrentCamera.CameraSubject = v122
                    end
                    if not vu118:FindFirstChildWhichIsA("BasePart") then
                        return
                    end
                    local function vu127(p124, p125, p126)
                        vu117.CFrame = CFrame.new(p124.Position) * p125 * p126
                        vu115:SetPrimaryPartCFrame(CFrame.new(p124.Position) * p125 * p126)
                        vu117.Velocity = Vector3.new(90000000, 900000000, 90000000)
                        vu117.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
                    end
                    local function v132(p128)
                        local v129 = tick()
                        local v130 = 2
                        local v131 = 0
                        while vu117 and vu123 do
                            if p128.Velocity.Magnitude >= 50 then
                                vu127(p128, CFrame.new(0, 1.5, vu123.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                vu127(p128, CFrame.new(0, - 1.5, - vu123.WalkSpeed), CFrame.Angles(0, 0, 0))
                                task.wait()
                                vu127(p128, CFrame.new(0, 1.5, vu123.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                vu127(p128, CFrame.new(0, 1.5, vu119.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                vu127(p128, CFrame.new(0, - 1.5, - vu119.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                                task.wait()
                                vu127(p128, CFrame.new(0, 1.5, vu119.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                vu127(p128, CFrame.new(0, - 1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                vu127(p128, CFrame.new(0, - 1.5, 0), CFrame.Angles(0, 0, 0))
                                task.wait()
                                vu127(p128, CFrame.new(0, - 1.5, 0), CFrame.Angles(math.rad(- 90), 0, 0))
                                task.wait()
                                vu127(p128, CFrame.new(0, - 1.5, 0), CFrame.Angles(0, 0, 0))
                                task.wait()
                            else
                                v131 = v131 + 100
                                vu127(p128, CFrame.new(0, 1.5, 0) + vu123.MoveDirection * p128.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v131), 0, 0))
                                task.wait()
                                vu127(p128, CFrame.new(0, - 1.5, 0) + vu123.MoveDirection * p128.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v131), 0, 0))
                                task.wait()
                                vu127(p128, CFrame.new(2.25, 1.5, - 2.25) + vu123.MoveDirection * p128.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v131), 0, 0))
                                task.wait()
                                vu127(p128, CFrame.new(- 2.25, - 1.5, 2.25) + vu123.MoveDirection * p128.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v131), 0, 0))
                                task.wait()
                                vu127(p128, CFrame.new(0, 1.5, 0) + vu123.MoveDirection, CFrame.Angles(math.rad(v131), 0, 0))
                                task.wait()
                                vu127(p128, CFrame.new(0, - 1.5, 0) + vu123.MoveDirection, CFrame.Angles(math.rad(v131), 0, 0))
                                task.wait()
                            end
                            if p128.Velocity.Magnitude > 500 or (p128.Parent ~= pu114.Character or (pu114.Parent ~= vu111 or (not pu114.Character == vu118 or (vu123.Sit or (vu116.Health <= 0 or (tick() > v129 + v130 or getgenv().flingloop == false)))))) then
                                break
                            end
                        end
                    end
                    workspace.FallenPartsDestroyHeight = 0 / 0
                    local v133 = Instance.new("BodyVelocity")
                    v133.Name = "SpeedDoPai"
                    v133.Parent = vu117
                    v133.Velocity = Vector3.new(900000000, 900000000, 900000000)
                    v133.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
                    vu116:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                    if vu119 and v120 then
                        if (vu119.CFrame.p - v120.CFrame.p).Magnitude <= 5 then
                            v132(vu119)
                        else
                            v132(v120)
                        end
                    elseif vu119 and not v120 then
                        v132(vu119)
                    elseif vu119 or not v120 then
                        if not vu119 and (not v120 and (v121 and v122)) then
                            v132(v122)
                        end
                    else
                        v132(v120)
                    end
                    v133:Destroy()
                    vu116:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                    workspace.CurrentCamera.CameraSubject = vu116
                    repeat
                        vu117.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
                        local v134 = vu115
                        vu115.SetPrimaryPartCFrame(v134, getgenv().OldPos * CFrame.new(0, 0.5, 0))
                        local v135 = vu116
                        vu116.ChangeState(v135, "GettingUp")
                        local v136 = vu115
                        table.foreach(vu115.GetChildren(v136), function(_, p137)
                            if p137:IsA("BasePart") then
                                local v138 = Vector3.new()
                                p137.RotVelocity = Vector3.new()
                                p137.Velocity = v138
                            end
                        end)
                        task.wait()
                    until (vu117.Position - getgenv().OldPos.p).Magnitude < 25
                    workspace.FallenPartsDestroyHeight = getgenv().FPDH
                end
            end
            local _ = Welcome
            getgenv().Welcome = true
            if vu113 then
                local v140 = next
                local v141 = vu111
                local v142, v143 = vu111.GetPlayers(v141)
                while true do
                    local v144
                    v143, v144 = v140(v142, v143)
                    if v143 == nil then
                        break
                    end
                    v139(v144)
                end
            end
            if pu110 then
                v139(pu110)
            end
            task.wait()
        end
        wait()
        pcall(v145)
    end
end
local vu147 = {}
local vu148 = nil
local function vu154()
    vu147 = {}
    local v149 = vu78
    local v150, v151, v152 = ipairs(v149:GetPlayers())
    while true do
        local v153
        v152, v153 = v150(v151, v152)
        if v152 == nil then
            break
        end
        table.insert(vu147, v153.Name)
    end
    if vu148 then
        vu148:Refresh(vu147, true)
    end
end
vu154()
vu148 = vu77:AddDropdown({
    Name = "\239\191\189\216\174\216\170\216\167\216\177 \216\167\216\179\217\133 \216\167\217\132\216\167\216\185\216\168",
    Default = "",
    Options = vu147,
    Callback = function(p155)
        SelectedPlayer = p155
    end
})
vu77:AddButton({
    Name = "\239\191\189\216\173\216\175\217\138\216\171 \216\167\217\132\217\130\216\167\216\166\217\133\216\169",
    Callback = function()
        vu154()
    end
})
local vu158 = vu77:AddToggle({
    Name = " \216\170\216\174\216\177\217\138\216\168 \216\168\217\132 \217\131\217\134\216\168\216\169",
    Default = false,
    Callback = function(p156)
        if p156 then
            local v157 = SelectedPlayer and GetPlayer(SelectedPlayer)[1]
            if v157 then
                vu146(v157)
            end
        else
            getgenv().flingloop = false
        end
    end
})
game:GetService("Players").LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
    if vu79.Character.Humanoid.Sit and vu158 then
        vu158:Set(false)
    end
end)
vu77:AddSection({
    Name = "\239\191\189\216\174\216\177\217\138\216\168 \216\168\217\132 \216\168\216\167\216\181"
})
local vu160 = vu77:AddDropdown({
    Name = "\239\191\189\216\174\216\170\216\167\216\177 \216\167\217\132\216\167\216\185\216\168 \216\167\217\132\216\176\217\138 \216\170\216\177\217\138\216\175 \216\170\216\174\216\177\217\138\216\168 \216\185\217\132\217\138\217\135 \216\168\217\132 \216\168\216\167\216\181",
    Options = {},
    Callback = function(p159)
        selectedPlayerName = p159
    end
})
local function vu166()
    playerNames = {}
    local v161 = vu78
    local v162, v163, v164 = pairs(v161:GetPlayers())
    while true do
        local v165
        v164, v165 = v162(v163, v164)
        if v164 == nil then
            break
        end
        table.insert(playerNames, v165.Name)
    end
    vu160:Refresh(playerNames, true)
end
vu77:AddButton({
    Name = "\239\191\189\216\175\216\171 \216\167\217\132\217\130\216\167\216\166\217\133\216\169",
    Callback = function()
        vu166()
    end
})
vu166()
vu77:AddToggle({
    Name = "\239\191\189\216\170\217\132 \217\132\216\167\216\185\216\168",
    Callback = function()
        if selectedPlayerName then
            local vu167 = vu78.LocalPlayer
            local vu168 = vu167.Character or vu167.CharacterAdded:Wait()
            local vu169 = vu168:WaitForChild("HumanoidRootPart")
            originalPosition = vu169.CFrame
            local function v171()
                local v170 = Workspace:FindFirstChild("Vehicles")
                if v170 then
                    return v170:FindFirstChild(vu167.Name .. "Car")
                else
                    return nil
                end
            end
            local vu172 = v171()
            if not vu172 then
                vu169.CFrame = CFrame.new(1118.81, 75.998, - 1138.61)
                task.wait(0.5)
                local v173 = ReplicatedStorage:FindFirstChild("RE")
                if v173 and v173:FindFirstChild("1Ca1r") then
                    v173["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
                end
                task.wait(1)
                vu172 = v171()
            end
            if vu172 then
                local v174 = vu172:FindFirstChild("Body")
                if v174 then
                    v174 = vu172.Body:FindFirstChild("VehicleSeat")
                end
                if v174 and (vu168:FindFirstChildOfClass("Humanoid") and not vu168.Humanoid.Sit) then
                    repeat
                        vu169.CFrame = v174.CFrame * CFrame.new(0, 2, 0)
                        task.wait()
                    until vu168.Humanoid.Sit or not vu172.Parent
                end
                local function v183()
                    while true do
                        if selectedPlayerName then
                            local v175 = vu78:FindFirstChild(selectedPlayerName)
                            if v175 and v175.Character and v175.Character:FindFirstChild("HumanoidRootPart") then
                                local v176 = v175.Character:FindFirstChildOfClass("Humanoid")
                                if v176 and v176.Sit then
                                    if vu168.Humanoid then
                                        vu172:SetPrimaryPartCFrame(CFrame.new(destination))
                                        print("Jogador sentou, levando \195\180nibus para o void!")
                                        task.wait(0.2)
                                        local function v178()
                                            local v177 = vu167.Character
                                            if v177 then
                                                v177 = vu167.Character:FindFirstChildWhichIsA("Humanoid")
                                            end
                                            if v177 then
                                                v177:ChangeState(Enum.HumanoidStateType.Jumping)
                                            end
                                        end
                                        v178()
                                        print("Simulando pulo!")
                                        task.wait(0.4)
                                        v178()
                                        task.wait(0.5)
                                        vu169.CFrame = originalPosition
                                        print("Player voltou para a posi\195\167\195\163o inicial!")
                                    end
                                    return
                                end
                                local v179 = v175.Character.HumanoidRootPart
                                local v180 = tick() * 35
                                local v181 = math.sin(v180) * 4
                                local v182 = math.cos(v180) * 20
                                vu172:SetPrimaryPartCFrame(v179.CFrame * CFrame.new(v181, 0, v182))
                            end
                        end
                        RunService.RenderStepped:Wait()
                    end
                end
                spawn(v183)
            end
        else
            print("Nenhum jogador selecionado!")
        end
    end
})
vu77:AddButton({
    Name = "\239\191\189\216\173\216\168 \216\167\217\132\216\167\216\185\216\168",
    Callback = function()
        if selectedPlayerName then
            local vu184 = vu78.LocalPlayer
            local vu185 = vu184.Character or vu184.CharacterAdded:Wait()
            local vu186 = vu185:WaitForChild("HumanoidRootPart")
            originalPosition = vu186.CFrame
            local function v188()
                local v187 = Workspace:FindFirstChild("Vehicles")
                if v187 then
                    return v187:FindFirstChild(vu184.Name .. "Car")
                else
                    return nil
                end
            end
            local vu189 = v188()
            if not vu189 then
                vu186.CFrame = CFrame.new(1118.81, 75.998, - 1138.61)
                task.wait(0.5)
                local v190 = ReplicatedStorage:FindFirstChild("RE")
                if v190 and v190:FindFirstChild("1Ca1r") then
                    v190["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
                end
                task.wait(1)
                vu189 = v188()
            end
            if vu189 then
                local v191 = vu189:FindFirstChild("Body")
                if v191 then
                    v191 = vu189.Body:FindFirstChild("VehicleSeat")
                end
                if v191 and (vu185:FindFirstChildOfClass("Humanoid") and not vu185.Humanoid.Sit) then
                    repeat
                        vu186.CFrame = v191.CFrame * CFrame.new(0, 2, 0)
                        task.wait()
                    until vu185.Humanoid.Sit or not vu189.Parent
                end
                local function v199()
                    while true do
                        if selectedPlayerName then
                            local v192 = vu78:FindFirstChild(selectedPlayerName)
                            if v192 and v192.Character and v192.Character:FindFirstChild("HumanoidRootPart") then
                                local v193 = v192.Character:FindFirstChildOfClass("Humanoid")
                                if v193 and v193.Sit then
                                    if vu185.Humanoid then
                                        vu189:SetPrimaryPartCFrame(originalPosition)
                                        print("Jogador sentou, trazendo \195\180nibus para a posi\195\167\195\163o inicial!")
                                        task.wait(0.2);
                                        (function()
                                            local v194 = vu184.Character
                                            if v194 then
                                                v194 = vu184.Character:FindFirstChildWhichIsA("Humanoid")
                                            end
                                            if v194 then
                                                v194:ChangeState(Enum.HumanoidStateType.Jumping)
                                            end
                                        end)()
                                        task.wait(0.2)
                                        vu186.CFrame = originalPosition
                                        print("Player voltou para a posi\195\167\195\163o inicial!")
                                        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack({
                                            "DeleteAllVehicles"
                                        }))
                                    end
                                    return
                                end
                                local v195 = v192.Character.HumanoidRootPart
                                local v196 = tick() * 35
                                local v197 = math.sin(v196) * 4
                                local v198 = math.cos(v196) * 20
                                vu189:SetPrimaryPartCFrame(v195.CFrame * CFrame.new(v197, 0, v198))
                            end
                        end
                        RunService.RenderStepped:Wait()
                    end
                end
                spawn(v199)
            end
        else
            print("Nenhum jogador selecionado!")
        end
    end
})
vu77:AddSection({
    Name = "\239\191\189\216\170\217\132 \216\179\217\129\217\138\217\134\216\169"
})
vu77:AddSection({
    Name = "\239\191\189\217\132\216\167\216\173\216\182\216\169 \216\167\216\181\216\185\216\175 \216\179\217\129\217\138\217\134\217\135 \216\168\216\185\216\175\217\138\217\134 \216\167\217\130\216\170\217\132 \216\180\216\174\216\181 \216\185\216\180\216\167\217\134 \217\138\216\182\216\168\216\183"
})
local _ = false
local _ = game:GetService("RunService")
local function _(p200, p201)
    local v202, v203, v204 = ipairs(p200:GetDescendants())
    while true do
        local v205
        v204, v205 = v202(v203, v204)
        if v204 == nil then
            break
        end
        if v205:IsA("BasePart") then
            v205.CanCollide = p201
        end
    end
end
local vu206 = game:GetService("Players")
local vu207 = game:GetService("Workspace")
game:GetService("RunService")
local vu208 = game:GetService("ReplicatedStorage")
Vector3.new(265.46, - 450.83, - 59.93)
local v209, v210, v211 = pairs(vu206:GetPlayers())
local vu212 = vu69
local vu213 = vu154
local v214 = {}
local vu215 = nil
while true do
    local v216
    v211, v216 = v209(v210, v211)
    if v211 == nil then
        break
    end
    table.insert(v214, v216.Name)
end
local vu217 = nil
vu77:AddDropdown({
    Name = "\239\191\189\216\167\216\174\217\128\216\170\217\128\216\167\216\177 \216\167\217\132\217\128\217\132\216\167\216\185\217\128\216\168\206\169",
    Options = v214,
    Callback = function(p218)
        vu217 = p218
    end
})
vu77:AddButton({
    Name = "\239\191\189\216\173\216\175\217\138\216\171 \216\167\217\132\217\130\216\167\216\166\217\133\216\169",
    Callback = function()
        vu213()
    end
})
vu77:AddButton({
    Name = "\239\191\189\216\170\217\132 \217\132\216\167\216\185\216\168",
    Callback = function()
        if vu217 then
            local vu219 = vu206.LocalPlayer
            local v220 = (vu219.Character or vu219.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
            vu215 = v220.CFrame
            if not (function()
                local v221 = vu207:FindFirstChild("Vehicles")
                if v221 then
                    return v221:FindFirstChild(vu219.Name .. "Car")
                else
                    return nil
                end
            end)() then
                v220.CFrame = CFrame.new(25.9511604, 4.09631968, 1581.40173, 0.0186735559, - 3.64394381e-8, 0.999825656, - 8.91815333e-9, 1, 3.66123558e-8, - 0.999825656, - 9.60028146e-9, 0.0186735559)
                task.wait(0.5)
                local v222 = vu208:FindFirstChild("RE")
                if v222 and v222:FindFirstChild("1Ca1r") then
                    RemoteEvent["1Ca1r"]:FireServer("PickingBoat", "PirateFree")
                end
                task.wait(1)
                PCar = GetCar()
            end
            if PCar then
                local v223 = PCar:FindFirstChild("Body")
                if v223 then
                    v223 = PCar.Body:FindFirstChild("VehicleSeat")
                end
                if v223 and not Humanoid.Sit then
                    repeat
                        RootPart.CFrame = v223.CFrame * CFrame.new(0, math.random(- 1, 1), 0)
                        task.wait()
                    until Humanoid.Sit or not PCar.Parent
                end
            end
            wait(0.2)
            game:GetService("UserInputService")
            local vu224 = game:GetService("RunService")
            local vu225 = vu206.LocalPlayer:GetMouse()
            local v226 = Instance.new("Folder", game:GetService("Workspace"))
            local v227 = Instance.new("Part", v226)
            local vu228 = Instance.new("Attachment", v227)
            v227.Anchored = true
            v227.CanCollide = false
            v227.Transparency = 1
            local v233 = coroutine.create(function()
                settings().Physics.AllowSleep = false
                while vu224.RenderStepped:Wait() do
                    local v229 = next
                    local v230, v231 = vu206:GetPlayers()
                    while true do
                        local v232
                        v231, v232 = v229(v230, v231)
                        if v231 == nil then
                            break
                        end
                        if v232 ~= vu206.LocalPlayer then
                            v232.MaximumSimulationRadius = 0
                            sethiddenproperty(v232, "SimulationRadius", 2)
                        end
                    end
                    vu206.LocalPlayer.MaximumSimulationRadius = math.pow(math.huge, math.huge)
                    setsimulationradius(math.huge)
                end
            end)
            coroutine.resume(v233)
            local function vu246(p234)
                if p234:IsA("Model") and p234:FindFirstChildOfClass("VehicleSeat") then
                    vu225.TargetFilter = p234
                    local v235 = next
                    local v236, v237 = p234:GetDescendants()
                    while true do
                        local v238
                        v237, v238 = v235(v236, v237)
                        if v237 == nil then
                            break
                        end
                        if v238:IsA("BodyAngularVelocity") or (v238:IsA("BodyForce") or (v238:IsA("BodyGyro") or (v238:IsA("BodyPosition") or (v238:IsA("BodyThrust") or (v238:IsA("BodyVelocity") or v238:IsA("RocketPropulsion")))))) then
                            v238:Destroy()
                        end
                    end
                    if p234:FindFirstChild("Attachment") then
                        p234:FindFirstChild("Attachment"):Destroy()
                    end
                    if p234:FindFirstChild("AlignPosition") then
                        p234:FindFirstChild("AlignPosition"):Destroy()
                    end
                    if p234:FindFirstChild("Torque") then
                        p234:FindFirstChild("Torque"):Destroy()
                    end
                    local v239 = next
                    local v240, v241 = p234:GetDescendants()
                    while true do
                        local v242
                        v241, v242 = v239(v240, v241)
                        if v241 == nil then
                            break
                        end
                        if v242:IsA("BasePart") then
                            v242.CanCollide = false
                            local v243 = Instance.new("Torque", v242)
                            v243.Torque = Vector3.new(102000, 10200000, 120000)
                            local v244 = Instance.new("AlignPosition", v242)
                            local v245 = Instance.new("Attachment", v242)
                            v243.Attachment0 = v245
                            v244.MaxForce = 99999
                            v244.MaxVelocity = math.huge
                            v244.Responsiveness = 200
                            v244.Attachment0 = v245
                            v244.Attachment1 = vu228
                        end
                    end
                end
            end
            local v247 = next
            local v248, v249 = game:GetService("Workspace"):GetDescendants()
            local vu250 = vu224
            local vu251 = vu228
            while true do
                local v252
                v249, v252 = v247(v248, v249)
                if v249 == nil then
                    break
                end
                vu246(v252)
            end
            game:GetService("Workspace").DescendantAdded:Connect(function(p253)
                vu246(p253)
            end)
            spawn(function()
                while true do
                    if vu217 then
                        local v254 = vu206:FindFirstChild(vu217)
                        if v254 and v254.Character and v254.Character:FindFirstChild("HumanoidRootPart") then
                            vu251.WorldCFrame = v254.Character.HumanoidRootPart.CFrame
                        end
                    end
                    vu250.RenderStepped:Wait()
                end
            end)
            wait(4)
            local vu255 = Vector3.new(101, - 446, - 180)
            vu219.Character.HumanoidRootPart.CFrame = CFrame.new(vu255)
            local function vu258(p256)
                if p256 and p256.Character then
                    local v257 = p256.Character:FindFirstChild("Humanoid")
                    if v257 and v257.SeatPart and v257.SeatPart.Parent:IsA("VehicleSeat") then
                        p256.Character.HumanoidRootPart.CFrame = CFrame.new(vu255)
                    end
                end
            end
            game:GetService("Players").PlayerAdded:Connect(function(pu259)
                if pu259.Name == vu217 then
                    pu259.CharacterAdded:Connect(function(p260)
                        p260:WaitForChild("Humanoid").Seated:Connect(function(_, p261)
                            if p261 then
                                vu258(pu259)
                            end
                        end)
                    end)
                end
            end)
        else
            print("Nenhum jogador selecionado!")
        end
    end
})
vu77:AddSection({
    Name = "\239\191\189\216\170\217\132 \216\180\216\167\216\173\217\134\216\169 \216\167\217\132\216\179\217\136\216\175\216\167\216\161"
})
vu77:AddSection({
    Name = "\239\191\189\217\132\216\167\216\173\216\182\216\169 \216\167\216\181\216\185\216\175 \216\167\217\132\216\180\216\167\216\173\217\134\216\169 \216\168\216\185\216\175\217\138\217\134 \216\167\217\130\216\170\217\132 \216\180\216\174\216\181 \216\185\216\180\216\167\217\134 \217\138\216\182\216\168\216\183"
})
local _ = false
local _ = game:GetService("RunService")
local function _(p262, p263)
    local v264, v265, v266 = ipairs(p262:GetDescendants())
    while true do
        local v267
        v266, v267 = v264(v265, v266)
        if v266 == nil then
            break
        end
        if v267:IsA("BasePart") then
            v267.CanCollide = p263
        end
    end
end
local vu268 = game:GetService("Players")
local vu269 = game:GetService("Workspace")
game:GetService("RunService")
local vu270 = game:GetService("ReplicatedStorage")
Vector3.new(265.46, - 450.83, - 59.93)
local v271, v272, v273 = pairs(vu268:GetPlayers())
local v274 = {}
local vu275 = nil
while true do
    local v276
    v273, v276 = v271(v272, v273)
    if v273 == nil then
        break
    end
    table.insert(v274, v276.Name)
end
local vu277 = nil
vu77:AddDropdown({
    Name = "\239\191\189\216\174\217\128\216\170\217\128\216\167\216\177 \216\167\217\132\217\128\217\132\216\167\216\185\217\128\216\168",
    Options = v274,
    Callback = function(p278)
        vu277 = p278
    end
})
vu77:AddButton({
    Name = "\239\191\189\216\173\216\175\217\138\216\171 \216\167\217\132\217\130\216\167\216\166\217\133\216\169",
    Callback = function()
        vu213()
    end
})
vu77:AddButton({
    Name = "\239\191\189\216\170\217\132 \217\132\216\167\216\185\216\168",
    Callback = function()
        if vu277 then
            local vu279 = vu268.LocalPlayer
            local v280 = (vu279.Character or vu279.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
            vu275 = v280.CFrame
            if not (function()
                local v281 = vu269:FindFirstChild("Vehicles")
                if v281 then
                    return v281:FindFirstChild(vu279.Name .. "Car")
                else
                    return nil
                end
            end)() then
                v280.CFrame = CFrame.new(1118.81, 75.998, - 1138.61)
                task.wait(0.5)
                local v282 = vu270:FindFirstChild("RE")
                if v282 and v282:FindFirstChild("1Ca1r") then
                    v282["1Ca1r"]:FireServer("PickingCar", "TowTruck")
                end
                task.wait(1)
                PCar = GetCar()
            end
            if PCar then
                local v283 = PCar:FindFirstChild("Body")
                if v283 then
                    v283 = PCar.Body:FindFirstChild("VehicleSeat")
                end
                if v283 and not Humanoid.Sit then
                    repeat
                        RootPart.CFrame = v283.CFrame * CFrame.new(0, math.random(- 1, 1), 0)
                        task.wait()
                    until Humanoid.Sit or not PCar.Parent
                end
            end
            wait(0.2)
            game:GetService("UserInputService")
            local vu284 = game:GetService("RunService")
            local vu285 = vu268.LocalPlayer:GetMouse()
            local v286 = Instance.new("Folder", game:GetService("Workspace"))
            local v287 = Instance.new("Part", v286)
            local vu288 = Instance.new("Attachment", v287)
            v287.Anchored = true
            v287.CanCollide = false
            v287.Transparency = 1
            local v293 = coroutine.create(function()
                settings().Physics.AllowSleep = false
                while vu284.RenderStepped:Wait() do
                    local v289 = next
                    local v290, v291 = vu268:GetPlayers()
                    while true do
                        local v292
                        v291, v292 = v289(v290, v291)
                        if v291 == nil then
                            break
                        end
                        if v292 ~= vu268.LocalPlayer then
                            v292.MaximumSimulationRadius = 0
                            sethiddenproperty(v292, "SimulationRadius", 2)
                        end
                    end
                    vu268.LocalPlayer.MaximumSimulationRadius = math.pow(math.huge, math.huge)
                    setsimulationradius(math.huge)
                end
            end)
            coroutine.resume(v293)
            local function vu306(p294)
                if p294:IsA("Model") and p294:FindFirstChildOfClass("VehicleSeat") then
                    vu285.TargetFilter = p294
                    local v295 = next
                    local v296, v297 = p294:GetDescendants()
                    while true do
                        local v298
                        v297, v298 = v295(v296, v297)
                        if v297 == nil then
                            break
                        end
                        if v298:IsA("BodyAngularVelocity") or (v298:IsA("BodyForce") or (v298:IsA("BodyGyro") or (v298:IsA("BodyPosition") or (v298:IsA("BodyThrust") or (v298:IsA("BodyVelocity") or v298:IsA("RocketPropulsion")))))) then
                            v298:Destroy()
                        end
                    end
                    if p294:FindFirstChild("Attachment") then
                        p294:FindFirstChild("Attachment"):Destroy()
                    end
                    if p294:FindFirstChild("AlignPosition") then
                        p294:FindFirstChild("AlignPosition"):Destroy()
                    end
                    if p294:FindFirstChild("Torque") then
                        p294:FindFirstChild("Torque"):Destroy()
                    end
                    local v299 = next
                    local v300, v301 = p294:GetDescendants()
                    while true do
                        local v302
                        v301, v302 = v299(v300, v301)
                        if v301 == nil then
                            break
                        end
                        if v302:IsA("BasePart") then
                            v302.CanCollide = false
                            local v303 = Instance.new("Torque", v302)
                            v303.Torque = Vector3.new(102000, 10200000, 120000)
                            local v304 = Instance.new("AlignPosition", v302)
                            local v305 = Instance.new("Attachment", v302)
                            v303.Attachment0 = v305
                            v304.MaxForce = 99999
                            v304.MaxVelocity = math.huge
                            v304.Responsiveness = 200
                            v304.Attachment0 = v305
                            v304.Attachment1 = vu288
                        end
                    end
                end
            end
            local v307 = next
            local v308, v309 = game:GetService("Workspace"):GetDescendants()
            local vu310 = vu284
            local vu311 = vu288
            while true do
                local v312
                v309, v312 = v307(v308, v309)
                if v309 == nil then
                    break
                end
                vu306(v312)
            end
            game:GetService("Workspace").DescendantAdded:Connect(function(p313)
                vu306(p313)
            end)
            spawn(function()
                while true do
                    if vu277 then
                        local v314 = vu268:FindFirstChild(vu277)
                        if v314 and v314.Character and v314.Character:FindFirstChild("HumanoidRootPart") then
                            vu311.WorldCFrame = v314.Character.HumanoidRootPart.CFrame
                        end
                    end
                    vu310.RenderStepped:Wait()
                end
            end)
            wait(4)
            local vu315 = Vector3.new(101, - 446, - 180)
            vu279.Character.HumanoidRootPart.CFrame = CFrame.new(vu315)
            local function vu318(p316)
                if p316 and p316.Character then
                    local v317 = p316.Character:FindFirstChild("Humanoid")
                    if v317 and v317.SeatPart and v317.SeatPart.Parent:IsA("VehicleSeat") then
                        p316.Character.HumanoidRootPart.CFrame = CFrame.new(vu315)
                    end
                end
            end
            game:GetService("Players").PlayerAdded:Connect(function(pu319)
                if pu319.Name == vu277 then
                    pu319.CharacterAdded:Connect(function(p320)
                        p320:WaitForChild("Humanoid").Seated:Connect(function(_, p321)
                            if p321 then
                                vu318(pu319)
                            end
                        end)
                    end)
                end
            end)
        else
            print("Nenhum jogador selecionado!")
        end
    end
})
vu77:AddSection({
    Name = "\239\191\189\216\170\217\132 \216\168\217\138\216\170 \217\136\216\179\217\138\216\167\216\177\216\169"
});
(function()
    local v322, v323, v324 = pairs(game.Players:GetPlayers())
    local v325 = {}
    while true do
        local v326
        v324, v326 = v322(v323, v324)
        if v324 == nil then
            break
        end
        table.insert(v325, v326.Name)
    end
    vu77:AddDropdown({
        Name = "\239\191\189\216\174\216\170\216\167\216\177 \216\167\216\179\217\133 \216\167\217\132\217\133\216\177\216\173\217\136\217\133",
        Default = v325[1],
        Options = v325,
        Callback = function(p327)
            selectedPlayer = game.Players:FindFirstChild(p327)
            print("Jogador selecionado: " .. p327)
        end
    })
end)()
vu77:AddButton({
    Name = "\239\191\189\216\170\216\173\216\175\217\138\216\171 \216\167\217\132\217\130\216\167\216\166\217\133\216\169\206\169",
    Callback = function()
        vu213()
    end
})
vu77:AddButton({
    Name = "\239\191\189\216\170\217\132 \216\168\217\138\216\170 \217\136\216\179\217\138\216\167\216\177\217\135",
    Callback = function()
        local vu328 = game.Players.LocalPlayer
        local _ = vu328.Backpack
        local vu329 = vu328.Character
        local v330 = vu329
        local vu331 = vu329.FindFirstChildOfClass(v330, "Humanoid")
        local v332 = vu329
        local vu333 = vu329.FindFirstChild(v332, "HumanoidRootPart")
        local v334 = game.Workspace:FindFirstChild("001_Lots")
        local _ = vu333.CFrame
        local v335 = 0
        local vu336 = vu269.Vehicles
        function Check()
            return vu328 and (vu329 and (vu331 and (vu333 and vu336))) and true or false
        end
        if selectedPlayer and (selectedPlayer.Character and Check()) then
            if not v334:FindFirstChild(vu328.Name .. "House") then
                local v337, v338, v339 = pairs(v334:GetChildren())
                local v340 = nil
                while true do
                    local v341
                    v339, v341 = v337(v338, v339)
                    if v339 == nil then
                        break
                    end
                    if v341.Name == "For Sale" then
                        local v342, v343, v344 = pairs(v341:GetDescendants())
                        while true do
                            local v345
                            v344, v345 = v342(v343, v344)
                            if v344 == nil then
                                break
                            end
                            if v345:IsA("NumberValue") and (v345.Name == "Number" and (v345.Value < 25 and v345.Value > 10)) then
                                v340 = v341
                                break
                            end
                        end
                    end
                end
                local v346 = v340:FindFirstChild("BuyHouse")
                local _ = v346.Position
                if v346 and v346:IsA("BasePart") then
                    vu333.CFrame = v346.CFrame + Vector3.new(0, - 6, 0)
                    task.wait(0.5)
                    local v347 = v346:FindFirstChild("ClickDetector")
                    if v347 then
                        fireclickdetector(v347)
                    end
                end
            end
            task.wait(0.5)
            local v348 = v334:FindFirstChild(vu328.Name .. "House")
            if v348 then
                task.wait(0.5)
                local v349, v350, v351 = pairs(v348:GetDescendants())
                local v352 = nil
                while true do
                    local v353
                    v351, v353 = v349(v350, v351)
                    if v351 == nil then
                        break
                    end
                    if v353.Name == "Number" then
                        if v353:IsA("NumberValue") then
                            v352 = v353
                        end
                    end
                end
                task.wait(0.5)
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gettin1gHous1e"):FireServer("PickingCustomHouse", "049_House", v352.Value)
            end
            task.wait(0.5)
            local v354 = vu336
            if not vu336.FindFirstChild(v354, vu328.Name .. "Car") and Check() then
                vu333.CFrame = CFrame.new(1118.81, 75.998, - 1138.61)
                task.wait(0.5)
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingCar", "SchoolBus")
                task.wait(0.5)
                local v355 = vu336
                local v356 = vu336.FindFirstChild(v355, vu328.Name .. "Car")
                task.wait(0.5)
                local v357 = v356:FindFirstChild("Body")
                if v357 then
                    v357 = v356.Body:FindFirstChild("VehicleSeat")
                end
                if v357 then
                    repeat
                        task.wait()
                        vu333.CFrame = v357.CFrame * CFrame.new(0, math.random(- 1, 1), 0)
                    until vu331.Sit
                end
            end
            task.wait(0.5)
            local v358 = vu336
            local vu359 = vu336.FindFirstChild(v358, vu328.Name .. "Car")
            if vu359 then
                if not vu331.Sit then
                    local v360 = vu359:FindFirstChild("Body")
                    if v360 then
                        v360 = vu359.Body:FindFirstChild("VehicleSeat")
                    end
                    if v360 then
                        repeat
                            task.wait()
                            vu333.CFrame = v360.CFrame * CFrame.new(0, math.random(- 1, 1), 0)
                        until vu331.Sit
                    end
                end
                local v361 = selectedPlayer.Character
                local v362 = v361:FindFirstChildOfClass("Humanoid")
                local v363 = v361:FindFirstChild("HumanoidRootPart")
                if v361 and (v362 and (v363 and not v362.Sit)) then
                    while not v362.Sit do
                        task.wait()
                        local function v367(p364, p365, p366)
                            vu359:SetPrimaryPartCFrame(CFrame.new(p364.Position) * p365 * p366)
                        end
                        v335 = v335 + 100
                        v367(v363, CFrame.new(0, 1.5, 0) + v362.MoveDirection * v363.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(v335), 0, 0))
                        v367(v363, CFrame.new(0, - 1.5, 0) + v362.MoveDirection * v363.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(v335), 0, 0))
                        v367(v363, CFrame.new(2.25, 1.5, - 2.25) + v362.MoveDirection * v363.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(v335), 0, 0))
                        v367(v363, CFrame.new(- 2.25, - 1.5, 2.25) + v362.MoveDirection * v363.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(v335), 0, 0))
                        v367(v363, CFrame.new(0, 1.5, 0) + v362.MoveDirection * v363.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(v335), 0, 0))
                        v367(v363, CFrame.new(0, - 1.5, 0) + v362.MoveDirection * v363.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(v335), 0, 0))
                    end
                    task.wait(0.2)
                    local v368 = v334:FindFirstChild(vu328.Name .. "House")
                    vu359:SetPrimaryPartCFrame(CFrame.new(v368.HouseSpawnPosition.Position))
                    task.wait(0.2)
                    local v369 = Region3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(30, 30, 30), game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(30, 30, 30))
                    local v370 = workspace:FindPartsInRegion3(v369, game.Players.LocalPlayer.Character.HumanoidRootPart, math.huge)
                    local v371, v372, v373 = pairs(v370)
                    while true do
                        local v374
                        v373, v374 = v371(v372, v373)
                        if v373 == nil then
                            break
                        end
                        if v374.Name == "HumanoidRootPart" then
                            local v375 = {
                                "BanPlayerFromHouse",
                                game:GetService("Players"):FindFirstChild(v374.Parent.Name),
                                v374.Parent
                            }
                            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(v375))
                            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack({
                                "DeleteAllVehicles"
                            }))
                        end
                    end
                end
            end
        end
    end
})
vu77:AddSection({
    Name = "\239\191\189\217\132\216\170\216\172\216\179\216\179"
})
local vu376 = nil
local vu377 = false
local vu378 = nil
local function vu383(p379)
    local v380 = game.Players.LocalPlayer
    local v381 = workspace.CurrentCamera
    if vu376 then
        local v382 = game.Players:FindFirstChild(vu376)
        if v382 and v382.Character and v382.Character:FindFirstChild("HumanoidRootPart") then
            if p379 then
                v381.CameraSubject = v382.Character.Humanoid
            else
                v381.CameraSubject = v380.Character.Humanoid
            end
        else
            print("Selected player not available or out of game.")
        end
    else
        print("No player selected!")
    end
end
local function vu388()
    local v384 = game.Players.LocalPlayer
    local v385 = v384.Character or v384.CharacterAdded:Wait()
    if v385 and v385:FindFirstChild("HumanoidRootPart") then
        local vu386 = v385.HumanoidRootPart
        if vu376 then
            local vu387 = game.Players:FindFirstChild(vu376)
            if vu387 and vu387.Character and vu387.Character:FindFirstChild("Head") then
                vu386.CFrame = vu387.Character.Head.CFrame * CFrame.new(0, 3, 0)
                vu378 = game:GetService("RunService").Heartbeat:Connect(function()
                    if vu377 and (vu387 and vu387.Character) and vu387.Character:FindFirstChild("Head") then
                        vu386.CFrame = vu387.Character.Head.CFrame * CFrame.new(0, 3, 0)
                    else
                        vu378:Disconnect()
                    end
                end)
            else
                print("Target player not found or not in the game.")
            end
        else
            print("No player selected!")
        end
    end
end
vu77:AddDropdown({
    Name = "\239\191\189\216\174\216\170\216\167\216\177 \216\167\217\132\216\167\216\185\216\168",
    Default = "",
    Options = (function()
        local v389, v390, v391 = ipairs(game.Players:GetPlayers())
        local v392 = {}
        while true do
            local v393
            v391, v393 = v389(v390, v391)
            if v391 == nil then
                break
            end
            table.insert(v392, v393.Name)
        end
        return v392
    end)(),
    Callback = function(p394)
        vu376 = p394
        print("Player selected: " .. p394)
    end
})
vu77:AddButton({
    Name = "\239\191\189\216\173\216\175\217\138\216\171 \216\167\217\132\217\130\216\167\216\166\217\133\216\169",
    Callback = function()
        vu213()
    end
})
vu77:AddToggle({
    Name = "\239\191\189\217\136\217\129 \216\167\217\132\216\167\216\185\216\168",
    Default = false,
    Callback = function(p395)
        vu383(p395)
    end
})
vu77:AddButton({
    Name = "\239\191\189\217\136\216\173 \216\185\217\134\216\175 \216\167\217\132\216\167\216\185\216\168",
    Callback = function()
        vu388()
    end
})
local vu396 = game:GetService("RunService")
local vu397 = nil
v71:MakeTab({
    Name = "\239\191\189\216\182\216\167\216\175 \216\170\216\172\217\133\217\138\216\175",
    Icon = "rbxassetid://115714662895227",
    PremiumOnly = false
}):AddToggle({
    Name = "\239\191\189\216\182\216\167\216\175 \216\170\216\172\217\133\217\138\216\175",
    Default = false,
    Callback = function(p398)
        if vu397 then
            vu397:Disconnect()
            vu397 = nil
        end
        if p398 then
            vu397 = vu396.Stepped:Connect(function()
                local v399 = workspace.CurrentCamera or workspace:FindFirstChild("Camera")
                if v399 then
                    local v400, v401, v402 = ipairs(v399:GetChildren())
                    while true do
                        local vu403
                        v402, vu403 = v400(v401, v402)
                        if v402 == nil then
                            break
                        end
                        if vu403:IsA("BasePart") and vu403.Name == "water" then
                            pcall(function()
                                vu403:Destroy()
                            end)
                        end
                    end
                end
            end)
        end
    end
})
local v404 = v71:MakeTab({
    Name = "\239\191\189\216\172\217\133\217\138\216\175 ",
    Icon = "rbxassetid://115714662895227",
    PremiumOnly = false
})
local vu405 = game:GetService("Players")
local vu406 = game:GetService("ReplicatedStorage")
local vu407 = nil
local vu408 = false
local function v415()
    local v409 = vu405
    local v410, v411, v412 = ipairs(v409:GetPlayers())
    local v413 = {}
    while true do
        local v414
        v412, v414 = v410(v411, v412)
        if v412 == nil then
            break
        end
        table.insert(v413, v414.Name)
    end
    return v413
end
local v416 = v404
local v417 = v404.AddDropdown
local v418 = {
    Name = "\239\191\189\216\174\216\170\216\167\216\177 \216\167\217\132\216\167\216\185\216\168",
    Options = v415()
}
local v419 = vu405
local v420
if vu405.GetPlayers(v419)[1] then
    local v421 = vu405
    v420 = vu405.GetPlayers(v421)[1].Name or ""
else
    v420 = ""
end
v418.Default = v420
function v418.Callback(p422)
    vu407 = p422
end
v417(v416, v418)
local function vu429(p423)
    local v424 = vu405.LocalPlayer
    if v424 and p423 then
        if p423.Character and p423.Character:FindFirstChild("HumanoidRootPart") then
            local v425 = v424:FindFirstChild("Backpack")
            if v425 then
                local v426 = v425:FindFirstChild("Assault")
                if v426 and v426:FindFirstChild("GunScript_Local") then
                    local v427 = v426.GunScript_Local
                    if v427:FindFirstChild("MuzzleEffect") and v427:FindFirstChild("HitEffect") then
                        local v428 = {
                            p423.Character.HumanoidRootPart,
                            p423.Character.HumanoidRootPart,
                            Vector3.new(10000376832, 10000832, 10000376832),
                            Vector3.new(14.311434326000017, 3.784946203231008, 7.053763389580074),
                            v427.MuzzleEffect,
                            v427.HitEffect,
                            0,
                            0,
                            {
                                false
                            },
                            {
                                25,
                                Vector3.new(100, 100, 100),
                                BrickColor.new(209),
                                0.25,
                                Enum.Material.SmoothPlastic,
                                0.25
                            },
                            true,
                            false
                        }
                        vu406:WaitForChild("RE"):WaitForChild("1Gu1n"):FireServer(unpack(v428))
                    end
                else
                    return
                end
            else
                return
            end
        else
            return
        end
    else
        return
    end
end
v404:AddToggle({
    Name = "\239\191\189\216\172\217\133\217\138\216\175 \216\167\217\132\216\167\216\185\216\168 \216\167\217\132\217\133\216\173\216\175\216\175",
    Default = false,
    Callback = function(p430)
        vu408 = p430
        if vu408 then
            vu406:WaitForChild("Remotes"):WaitForChild("GunEquip"):InvokeServer(unpack({
                "Assault",
                "StockAssault"
            }))
            task.spawn(function()
                while vu408 do
                    local v431 = vu407 and vu405:FindFirstChild(vu407)
                    if v431 then
                        vu429(v431)
                    end
                    task.wait(0.01)
                end
            end)
        end
    end
})
local vu432 = game:GetService("Players")
local vu433 = game:GetService("ReplicatedStorage")
local vu434 = vu432.LocalPlayer
local function vu435()
    if not vu434:WaitForChild("Backpack"):FindFirstChild("Assault") then
        vu433:WaitForChild("Remotes"):WaitForChild("GunEquip"):InvokeServer(unpack({
            "Assault",
            "StockAssault"
        }))
    end
end
local vu436 = false
v404:AddToggle({
    Name = "\239\191\189\216\172\217\133\217\138\216\175 \216\167\217\132\217\131\217\132",
    Default = false,
    Callback = function(p437)
        vu436 = p437
        if vu436 then
            vu435()
            task.spawn(function()
                while true do
                    if not vu436 then
                        return
                    end
                    local v438 = vu432
                    local v439, v440, v441 = ipairs(v438:GetPlayers())
                    while true do
                        local v442
                        v441, v442 = v439(v440, v441)
                        if v441 == nil then
                            break
                        end
                        if v442 ~= vu434 and v442.Character and v442.Character:FindFirstChild("HumanoidRootPart") then
                            for _ = 1, 2 do
                                if not vu436 then
                                    break
                                end
                                local v443 = {
                                    v442.Character.HumanoidRootPart,
                                    v442.Character.HumanoidRootPart,
                                    Vector3.new(100000000376832, 100000000376832, 100000000376832),
                                    Vector3.new(- 61.12593460083008, 3.699275255203247, - 1.4375219345092773),
                                    vu434.Backpack:WaitForChild("Assault"):WaitForChild("GunScript_Local"):WaitForChild("MuzzleEffect"),
                                    vu434.Backpack:WaitForChild("Assault"):WaitForChild("GunScript_Local"):WaitForChild("HitEffect"),
                                    0,
                                    0,
                                    {
                                        false
                                    },
                                    {
                                        25,
                                        Vector3.new(100, 100, 100),
                                        BrickColor.new(29),
                                        0.25,
                                        Enum.Material.SmoothPlastic,
                                        0.25
                                    },
                                    true,
                                    false
                                }
                                vu433.RE["1Gu1n"]:FireServer(unpack(v443))
                                task.wait(0.001)
                            end
                        end
                    end
                end
            end)
        end
    end
})
v404:AddSection({
    Name = "\239\191\189\216\174\216\177\217\138\216\168 \217\130\217\136\217\138\226\134\147"
})
local vu444 = game:GetService("Players")
local vu445 = game:GetService("ReplicatedStorage")
local vu446 = nil
local vu447 = false
local function v454()
    local v448 = vu444
    local v449, v450, v451 = ipairs(v448:GetPlayers())
    local v452 = {}
    while true do
        local v453
        v451, v453 = v449(v450, v451)
        if v451 == nil then
            break
        end
        table.insert(v452, v453.Name)
    end
    return v452
end
local v455 = v404
local v456 = v404.AddDropdown
local v457 = {
    Name = "\239\191\189\216\174\216\170\216\167\216\177 \216\167\217\132\216\167\216\185\216\168",
    Options = v454()
}
local v458 = vu444
local v459
if vu444.GetPlayers(v458)[1] then
    local v460 = vu444
    v459 = vu444.GetPlayers(v460)[1].Name or ""
else
    v459 = ""
end
v457.Default = v459
function v457.Callback(p461)
    vu446 = p461
end
v456(v455, v457)
local function vu468(p462)
    local v463 = vu444.LocalPlayer
    if v463 and p462 then
        if p462.Character and p462.Character:FindFirstChild("HumanoidRootPart") then
            local v464 = v463:FindFirstChild("Backpack")
            if v464 then
                local v465 = v464:FindFirstChild("Assault")
                if v465 and v465:FindFirstChild("GunScript_Local") then
                    local v466 = v465.GunScript_Local
                    if v466:FindFirstChild("MuzzleEffect") and v466:FindFirstChild("HitEffect") then
                        local v467 = {
                            p462.Character.HumanoidRootPart,
                            p462.Character.HumanoidRootPart,
                            Vector3.new(9999999999376832, 99999999832, 999999999376832),
                            Vector3.new(14.311434326000017, 3.784946203231008, 7.053763389580074),
                            v466.MuzzleEffect,
                            v466.HitEffect,
                            0,
                            0,
                            {
                                false
                            },
                            {
                                25,
                                Vector3.new(100, 100, 100),
                                BrickColor.new(209),
                                0.25,
                                Enum.Material.SmoothPlastic,
                                0.25
                            },
                            true,
                            false
                        }
                        vu445:WaitForChild("RE"):WaitForChild("1Gu1n"):FireServer(unpack(v467))
                    end
                else
                    return
                end
            else
                return
            end
        else
            return
        end
    else
        return
    end
end
v404:AddToggle({
    Name = "\239\191\189\216\172\217\133\217\138\216\175 \216\167\217\132\216\167\216\185\216\168 \216\167\217\132\217\133\216\173\216\175\216\175",
    Default = false,
    Callback = function(p469)
        vu447 = p469
        if vu447 then
            vu445:WaitForChild("Remotes"):WaitForChild("GunEquip"):InvokeServer(unpack({
                "Assault",
                "StockAssault"
            }))
            task.spawn(function()
                while vu447 do
                    local v470 = vu446 and vu444:FindFirstChild(vu446)
                    if v470 then
                        vu468(v470)
                    end
                    task.wait(0.001)
                end
            end)
        end
    end
})
local vu471 = game:GetService("Players")
local vu472 = game:GetService("ReplicatedStorage")
local vu473 = vu471.LocalPlayer
local function vu475()
    local v474 = vu472:FindFirstChild("RE")
    if v474 and v474:FindFirstChild("1Gu1n") then
        return v474["1Gu1n"]
    else
        return nil
    end
end
local function vu478()
    local v476 = vu473:WaitForChild("Backpack")
    local v477 = vu473.Character or vu473.CharacterAdded:Wait()
    if not (v476:FindFirstChild("Assault") or v477:FindFirstChild("Assault")) then
        vu472:WaitForChild("Remotes"):WaitForChild("GunEquip"):InvokeServer(unpack({
            "Assault",
            "StockAssault"
        }))
        task.wait(0.5)
    end
end
local vu479 = false
v404:AddToggle({
    Name = "\239\191\189\216\174\216\177\217\138\216\168 \217\138\216\175\217\133\216\177 \216\172\217\133\217\138\216\185 \216\167\217\132\216\167\216\185\216\168\217\138\217\134 \216\168\217\132 \216\179\217\138\216\177\217\129\216\177",
    Default = false,
    Callback = function(p480)
        vu479 = p480
        if vu479 then
            task.spawn(function()
                while vu479 do
                    local vu481 = false
                    local function vu482()
                        vu481 = true
                    end
                    local vu483 = vu475()
                    if vu483 then
                        pcall(function()
                            vu478()
                            local v484 = not vu473.Backpack:FindFirstChild("Assault") and vu473.Character
                            if v484 then
                                v484 = vu473.Character:FindFirstChild("Assault")
                            end
                            if v484 and v484:FindFirstChild("GunScript_Local") then
                                local v485 = vu471
                                local v486, v487, v488 = ipairs(v485:GetPlayers())
                                while true do
                                    local v489
                                    v488, v489 = v486(v487, v488)
                                    if v488 == nil then
                                        break
                                    end
                                    if not vu479 then
                                        vu482()
                                    end
                                    if v489 ~= vu473 and v489.Character and v489.Character:FindFirstChild("HumanoidRootPart") then
                                        local v490 = {
                                            v489.Character.HumanoidRootPart,
                                            v489.Character.HumanoidRootPart,
                                            Vector3.new(99999999376832, 999999999376832, 999999999376832),
                                            Vector3.new(- 61.12593480083008, 3.699275255288847, - 1.4375219345098884),
                                            v484.GunScript_Local:FindFirstChild("MuzzleEffect"),
                                            v484.GunScript_Local:FindFirstChild("HitEffect"),
                                            0,
                                            0,
                                            {
                                                false
                                            },
                                            {
                                                25,
                                                Vector3.new(100, 100, 100),
                                                BrickColor.new(29),
                                                0.25,
                                                Enum.Material.SmoothPlastic,
                                                0.25
                                            },
                                            true,
                                            false
                                        }
                                        vu483:FireServer(unpack(v490))
                                        task.wait(0.2)
                                    end
                                end
                            end
                        end)
                        task.wait(0.001)
                    else
                        warn("\239\191\189\217\132\216\177\217\138\217\133\217\136\216\170 \216\167\216\174\216\170\217\129\217\137 \216\163\217\136 \217\133\216\167 \217\133\217\136\216\172\217\136\216\175!")
                        task.wait(0.5)
                    end
                    if vu481 then
                        break
                    end
                end
            end)
        end
    end
})
local v491 = v71:MakeTab({
    Name = "\239\191\189\217\131\217\134\216\167\216\170",
    Icon = "rbxassetid://115714662895227",
    PremiumOnly = false
})
v491:AddSection({
    Name = "\239\191\189\216\179\216\174 \216\179\217\131\217\134\216\167\216\170"
})
local vu492 = game:GetService("Players")
local vu493 = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
local vu494 = nil
local function vu501()
    local v495 = vu492
    local v496, v497, v498 = ipairs(v495:GetPlayers())
    local v499 = {}
    while true do
        local v500
        v498, v500 = v496(v497, v498)
        if v498 == nil then
            break
        end
        table.insert(v499, v500.Name)
    end
    return v499
end
local vu503 = v491:AddDropdown({
    Name = "\239\191\189\216\174\216\170\216\167\216\177 \216\167\217\132\216\167\216\185\216\168",
    Options = vu501(),
    Default = vu494,
    Callback = function(p502)
        vu494 = p502
    end
})
local function v504()
    vu503:Refresh(vu501(), true)
end
vu492.PlayerAdded:Connect(v504)
vu492.PlayerRemoving:Connect(v504)
v491:AddButton({
    Name = "\239\191\189\216\179\216\174 \216\167\217\132\216\179\217\131\217\134",
    Callback = function()
        if vu494 then
            local v505 = vu492.LocalPlayer.Character
            local v506 = vu492:FindFirstChild(vu494)
            if v506 and v506.Character then
                if v505 then
                    v505 = v505:FindFirstChildOfClass("Humanoid")
                end
                local v507 = v506.Character:FindFirstChildOfClass("Humanoid")
                if v505 and v507 then
                    local v508 = v505:GetAppliedDescription()
                    local v509, v510, v511 = ipairs(v508:GetAccessories(true))
                    while true do
                        local v512
                        v511, v512 = v509(v510, v511)
                        if v511 == nil then
                            break
                        end
                        if v512.AssetId and tonumber(v512.AssetId) then
                            vu493.Wear:InvokeServer(tonumber(v512.AssetId))
                            task.wait(0.2)
                        end
                    end
                    if tonumber(v508.Shirt) then
                        vu493.Wear:InvokeServer(tonumber(v508.Shirt))
                        task.wait(0.2)
                    end
                    if tonumber(v508.Pants) then
                        vu493.Wear:InvokeServer(tonumber(v508.Pants))
                        task.wait(0.2)
                    end
                    if tonumber(v508.Face) then
                        vu493.Wear:InvokeServer(tonumber(v508.Face))
                        task.wait(0.2)
                    end
                    local v513 = v507:GetAppliedDescription()
                    local v514 = {
                        {
                            v513.Torso,
                            v513.RightArm,
                            v513.LeftArm,
                            v513.RightLeg,
                            v513.LeftLeg,
                            v513.Head
                        }
                    }
                    vu493.ChangeCharacterBody:InvokeServer(unpack(v514))
                    task.wait(0.5)
                    if tonumber(v513.Shirt) then
                        vu493.Wear:InvokeServer(tonumber(v513.Shirt))
                        task.wait(0.3)
                    end
                    if tonumber(v513.Pants) then
                        vu493.Wear:InvokeServer(tonumber(v513.Pants))
                        task.wait(0.3)
                    end
                    if tonumber(v513.Face) then
                        vu493.Wear:InvokeServer(tonumber(v513.Face))
                        task.wait(0.3)
                    end
                    local v515, v516, v517 = ipairs(v513:GetAccessories(true))
                    while true do
                        local v518
                        v517, v518 = v515(v516, v517)
                        if v517 == nil then
                            break
                        end
                        if v518.AssetId and tonumber(v518.AssetId) then
                            vu493.Wear:InvokeServer(tonumber(v518.AssetId))
                            task.wait(0.3)
                        end
                    end
                    local v519 = v506.Character:FindFirstChild("Body Colors")
                    if v519 then
                        vu493.ChangeBodyColor:FireServer(tostring(v519.HeadColor))
                        task.wait(0.3)
                    end
                    if tonumber(v513.IdleAnimation) then
                        vu493.Wear:InvokeServer(tonumber(v513.IdleAnimation))
                        task.wait(0.3)
                    end
                    local v520 = v506:FindFirstChild("PlayersBag")
                    if v520 then
                        if v520:FindFirstChild("RPName") and v520.RPName.Value ~= "" then
                            vu493.RPNameText:FireServer("RolePlayName", v520.RPName.Value)
                            task.wait(0.3)
                        end
                        if v520:FindFirstChild("RPBio") and v520.RPBio.Value ~= "" then
                            vu493.RPNameText:FireServer("RolePlayBio", v520.RPBio.Value)
                            task.wait(0.3)
                        end
                        if v520:FindFirstChild("RPNameColor") then
                            vu493.RPNameColor:FireServer("PickingRPNameColor", v520.RPNameColor.Value)
                            task.wait(0.3)
                        end
                        if v520:FindFirstChild("RPBioColor") then
                            vu493.RPNameColor:FireServer("PickingRPBioColor", v520.RPBioColor.Value)
                            task.wait(0.3)
                        end
                    end
                end
            end
        end
    end
})
local vu521 = {
    Color3.new(1, 0, 0),
    Color3.new(0, 1, 0),
    Color3.new(0, 0, 1),
    Color3.new(1, 1, 0),
    Color3.new(0, 1, 1),
    Color3.new(1, 0, 1)
}
local vu522 = false
local function _()
    local v523 = game:GetService("ReplicatedStorage")
    local vu524 = v523:FindFirstChild("RE")
    if vu524 then
        vu524 = v523.RE:FindFirstChild("1Player1sHous1e")
    end
    if vu524 then
        while vu522 do
            local v525, v526, v527 = ipairs(vu521)
            while true do
                local v528
                v527, v528 = v525(v526, v527)
                if v527 == nil then
                    break
                end
                if not vu522 then
                    return
                end
                local vu529 = {
                    "ColorPickHouse",
                    v528
                }
                pcall(function()
                    vu524:FireServer(unpack(vu529))
                end)
                task.wait(0.8)
            end
        end
    else
        warn("RemoteEvent \'1Player1sHous1e\' n\195\163o encontrado.")
    end
end
v491:AddSection({
    Name = "\239\191\189\217\131\217\134\216\167\216\170 \216\167\217\136\217\132\216\167\216\175 R6"
})
v491:AddButton({
    Name = "\239\191\189\217\131\217\134 \216\167\216\179\216\183\217\136\216\177\217\138 R6",
    Callback = function()
        print("Clicked")
        local v530 = {
            {
                1,
                1,
                1,
                1,
                139607718,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v530))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            134082579
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            123484249524345
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            93890750467681
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            114554632554289
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            74108785680678
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            71663109326643
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            11342406713
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            92603675231903
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            130748580503185
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            135154599669181
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            18436377492
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            97655418205423
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            73923051046972
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            17795867389
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            102845440110072
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            "skintone",
            "Institutional white"
        }))
    end
})
v491:AddButton({
    Name = "\239\191\189\217\131\217\134 \216\167\216\168\217\138\216\182 \216\173\217\132\217\136 R6",
    Callback = function()
        print("Clicked")
        local v531 = {
            {
                1,
                1,
                1,
                1,
                1,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v531))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            134082579
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            16368919769
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            16368919769
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            13282804902
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            85144069642236
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            105410736394520
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            114554632554289
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            17183211696
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            "skintone",
            "Institutional white"
        }))
    end
})
v491:AddButton({
    Name = "\239\191\189\216\182\216\186\216\183 \217\132\217\132\216\173\216\181\217\136\217\132 \216\185\217\132\217\137 \216\167\217\132\217\133\216\180\217\138\216\169 \217\136\216\167\217\132\217\136\217\130\217\129\217\135R6",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Imagnir/r6_anims_for_r15/main/r6_anims.lua", true))()
    end
})
v491:AddSection({
    Name = "\239\191\189\217\132\216\167\216\173\216\182\216\169: \216\167\216\176\216\167 \216\172\217\134\216\170 \216\170\216\177\217\138\216\175 \216\170\217\136\216\174\216\177 \216\167\217\132\217\133\216\180\217\138\217\135 \217\132\216\167\216\178\217\133 \216\170\216\183\217\132\216\185 \217\136\216\170\217\129\217\136\216\170 "
})
sTab = v71:MakeTab({
    Name = "\239\191\189\217\132\216\180\216\185\217\136\216\177",
    Icon = "rbxassetid://115714662895227"
})
sTab:AddButton({
    Name = "\239\191\189\216\175\217\133\216\172 \216\185\216\167\216\175\217\138 \216\167\216\179\217\136\216\175\206\169",
    Callback = function()
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15535076528
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            16127830905
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            14808924884
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15848163279
        }))
    end
})
sTab:AddButton({
    Name = "\239\191\189\216\175\217\133\216\172 \216\185\216\167\216\175\217\138 \216\168\217\134\217\138\206\169",
    Callback = function()
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            14627143022
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15294036713
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15847969469
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15971158257
        }))
    end
})
sTab:AddButton({
    Name = "\239\191\189\216\175\217\133\216\172 \216\185\216\167\216\175\217\138 \216\167\216\168\217\138\216\182\206\169",
    Callback = function()
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            14627127264
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15908583844
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            14808889186
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15349539978
        }))
    end
})
sTab:AddSection({
    Name = "\239\191\189\217\133\216\172 (9) \216\180\216\185\217\136\216\177 \216\173\217\132\217\136"
})
sTab:AddButton({
    Name = "\239\191\189\216\175\217\133\216\172 \216\167\216\179\217\136\216\175 9 \216\180\216\185\217\136\216\177\206\169",
    Callback = function()
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            89963641541698
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15214479618
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            16168983297
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            12553856439
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            12411026610
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15848163279
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15294026484
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            11386780095
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15303551954
        }))
    end
})
sTab:AddButton({
    Name = "\239\191\189\216\175\217\133\216\172 \216\167\216\168\217\138\216\182 9 \216\180\216\185\217\136\216\177\206\169",
    Callback = function()
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            12395782823
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15530780426
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            14808889186
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            16127870253
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15848173823
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            12553870762
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            12411004315
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            14887721871
        }))
    end
})
sTab:AddButton({
    Name = "\239\191\189\216\175\217\133\216\172 \216\167\216\179\217\136\216\175 9 \216\180\216\185\217\136\216\177\206\169",
    Callback = function()
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15908581067
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            12410997561
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15360967485
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            12553878346
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            16127867077
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15294007958
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15696510459
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            11386778657
        }))
    end
})
sTab:AddButton({
    Name = "\239\191\189\216\175\217\133\216\172 \216\167\216\179\217\136\216\175 9 \216\180\216\185\217\136\216\177 \217\134\217\136\216\185 \216\171\216\167\217\134\217\138 \206\169",
    Callback = function()
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            89963641541698
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15214479618
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            12411026610
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            16168983297
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15848163279
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            12553856439
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            16752451901
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15303551954
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            11386780095
        }))
    end
})
sTab:AddButton({
    Name = "\239\191\189\216\175\217\133\216\172 \216\167\216\180\217\130\216\177 9 \216\180\216\185\217\136\216\177 \217\134\217\136\216\185 \216\171\216\167\217\134\217\138\206\169",
    Callback = function()
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            14887721871
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            12411004315
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            12553870762
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15848173823
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            16127870253
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            17374012310
        }))
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            15530780426
        }))
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            12395782823
        }))
    end
})
HTab = v71:MakeTab({
    Name = "\239\191\189\217\132\216\167\216\172\217\128\216\179\216\167\217\133",
    Icon = "rbxassetid://115714662895227"
})
HTab:AddSection({
    Name = "\239\191\189\217\132\216\177\216\166\217\128\217\136\216\179 \217\128 \216\167\217\132\216\167\216\177\216\172\217\128\217\132"
})
HTab:AddButton({
    Name = "\239\191\189\216\177\216\172\217\132 \217\133\217\130\216\183\217\136\216\185\217\135 \217\132\217\132\216\168\217\134\216\167\216\170\206\169 ",
    Callback = function()
        print("Clicked")
        local v532 = {
            {
                96491916349570,
                76683091425509,
                75159926897589,
                139607718,
                1,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v532))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\177\216\172\217\132 \217\133\217\130\216\183\217\136\216\185\217\135 \217\132\217\132 \217\136\217\132\216\175\206\169 ",
    Callback = function()
        print("Clicked")
        local v533 = {
            {
                1,
                1,
                1,
                139607718,
                1,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v533))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\163\216\179 \216\177\217\136\216\168\217\136\216\170",
    Callback = function()
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            3210773801
        }))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\163\216\179 \217\133\216\174\217\129\217\138",
    Callback = function()
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            134082579
        }))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\163\216\179 \217\131\217\136\216\168\217\138 |\216\177\217\136\217\132",
    Callback = function()
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            746767604
        }))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\163\216\179 \216\185\217\138\217\136\217\134 \216\178\216\177\217\130\216\167\216\161",
    Callback = function()
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("Wear", 9000000000):InvokeServer(unpack({
            16580493236
        }))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\177\216\172\217\132 \216\173\216\175\217\138\216\175\217\138\216\169\206\169 ",
    Callback = function()
        print("Clicked")
        local v534 = {
            {
                1,
                1,
                1,
                17500249989,
                1,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v534))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\177\216\172\217\132 \216\167\217\132\216\185\216\182\216\167\217\133 \216\167\217\132\216\168\217\138\216\182\216\167\216\161\206\169 ",
    Callback = function()
        print("Clicked")
        local v535 = {
            {
                1,
                1,
                1,
                14580308646,
                1,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v535))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\177\216\172\217\132 \216\167\217\132\216\185\216\182\216\167\217\133 \216\167\217\132\216\167\216\179\217\136\216\175\206\169 ",
    Callback = function()
        print("Clicked")
        local v536 = {
            {
                1,
                1,
                1,
                14547162578,
                1,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v536))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\177\216\172\217\132 \216\177\217\136\217\132\206\169 ",
    Callback = function()
        print("Clicked")
        local v537 = {
            {
                1,
                1,
                1,
                3230472745,
                3230470862,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v537))
    end
})
HTab:AddSection({
    Name = "\239\191\189\216\172\216\179\216\167\217\133 \216\168\217\134\217\128\216\167\216\170"
})
HTab:AddButton({
    Name = "\239\191\189\216\172\216\179\217\133 \216\168\217\134\216\170 \216\174\216\181\216\177 \216\181\216\186\217\138\216\177\206\169 ",
    Callback = function()
        print("Clicked")
        local v538 = {
            {
                96491916349570,
                76683091425509,
                75159926897589,
                1,
                1,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v538))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\172\216\179\217\133 \216\168\217\134\216\170 \216\174\216\181\216\177 \216\182\216\185\217\138\217\129\206\169 ",
    Callback = function()
        print("Clicked")
        local v539 = {
            {
                74302534603111,
                76683091425509,
                75159926897589,
                1,
                1,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v539))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\172\216\179\217\133 \216\168\217\134\216\170 1\206\169 ",
    Callback = function()
        print("Clicked")
        local v540 = {
            {
                96491916349570,
                14854350570,
                14854350451,
                1,
                1,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v540))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\172\216\179\217\133 \216\168\217\134\216\170 2\206\169 ",
    Callback = function()
        print("Clicked")
        local v541 = {
            {
                16214246112,
                16214249513,
                16214251181,
                1,
                1,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v541))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\172\216\179\217\133 \216\168\217\134\216\170 3\206\169 ",
    Callback = function()
        print("Clicked")
        local v542 = {
            {
                15539008532,
                15539008875,
                15539008680,
                15539008795,
                15539011945,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v542))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\172\216\179\217\133 \216\168\217\134\216\170 4\206\169 ",
    Callback = function()
        print("Clicked")
        local v543 = {
            {
                14861800638,
                14861800626,
                14861801452,
                14861800627,
                14861801454,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v543))
    end
})
HTab:AddSection({
    Name = "\239\191\189\216\172\216\179\216\167\217\133 \216\167\217\136\217\132\216\167\216\175"
})
HTab:AddButton({
    Name = "\239\191\189\216\172\216\179\217\133 \216\167\217\136\217\132\216\167\216\175. s15\206\169 ",
    Callback = function()
        print("Clicked")
        local v544 = {
            {
                17754346388,
                1,
                1,
                1,
                1,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v544))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\172\216\179\217\133  \217\136\217\132\216\175 \216\182\216\185\217\138\217\129\206\169 ",
    Callback = function()
        print("Clicked")
        local v545 = {
            {
                92757812011061,
                99519402284266,
                115905570886697,
                1,
                1,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v545))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\172\216\179\217\133 \217\136\217\132\216\175 \217\131\217\136\216\168\217\138\206\169",
    Callback = function()
        print("Clicked")
        local v546 = {
            {
                86499666,
                27112039,
                27112052,
                27112068,
                27112056,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v546))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\172\216\179\217\133 \217\136\217\132\216\175 \216\177\217\136\217\132\206\169",
    Callback = function()
        print("Clicked")
        local v547 = {
            {
                27112025,
                27112039,
                27112052,
                3230472745,
                3230470862,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v547))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\172\216\179\217\133 \217\136\217\132\216\175 \217\133\216\185\216\182\217\132\206\169",
    Callback = function()
        print("Clicked")
        local v548 = {
            {
                18178775358,
                18178775182,
                18178775725,
                18178777453,
                18178775695,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v548))
    end
})
HTab:AddSection({
    Name = "\239\191\189\216\172\216\179\216\167\217\133 \216\167\217\130\216\178\216\167\217\133"
})
HTab:AddButton({
    Name = "\239\191\189\216\172\217\128\216\179\217\133 \216\167\217\132\217\130\216\178\217\133\206\169",
    Callback = function()
        print("Clicked")
        local v549 = {
            {
                14579958702,
                14579959062,
                14579959191,
                14579959249,
                14579963667,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v549))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\172\217\128\216\179\217\133 \216\167\217\132\217\130\216\178\217\133 \216\167\217\132\217\133\216\170\217\136\216\179\217\128\216\183\206\169",
    Callback = function()
        print("Clicked")
        local v550 = {
            {
                77813057823038,
                135110043370135,
                116607813654019,
                138966229804486,
                128961183894053,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v550))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\172\217\128\216\179\217\133 \216\167\217\132\217\130\216\178\217\133 \216\167\217\132\217\130\216\181\217\138\216\177\206\169",
    Callback = function()
        print("Clicked")
        local v551 = {
            {
                120973199097564,
                118345433416023,
                112849465115864,
                78321005147549,
                106586789635639,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v551))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\172\217\128\216\179\217\133 \216\167\217\132\217\130\216\178\217\133 \206\169",
    Callback = function()
        print("Clicked")
        local v552 = {
            {
                126267841602936,
                77530451194918,
                123471958406889,
                117042768644173,
                131948590344338,
                1
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v552))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\172\217\128\216\179\217\133 \216\167\217\132\217\135\216\167\217\133\216\179\216\170\216\177\206\169",
    Callback = function()
        print("Clicked")
        local v553 = {
            {
                14898536974,
                14898536957,
                14898537277,
                14898537300,
                14898537292,
                14898536975
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v553))
    end
})
HTab:AddSection({
    Name = "\239\191\189\216\172\216\179\216\167\217\133 \216\186\216\177\217\138\216\168\217\135"
})
HTab:AddButton({
    Name = "\239\191\189\216\179\216\170\217\138\217\129\206\169",
    Callback = function()
        print("Clicked")
        local v554 = {
            {
                14976595538,
                14976595831,
                14976595559,
                14976595617,
                14976595675,
                134082579
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v554))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\185\217\134\217\131\216\168\217\136\216\170\206\169",
    Callback = function()
        print("Clicked")
        local v555 = {
            {
                17047437188,
                17047437378,
                17047437442,
                17047437366,
                17047437217,
                17047437225
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v555))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\175\217\138\217\134\216\181\217\136\216\177\206\169",
    Callback = function()
        print("Clicked")
        local v556 = {
            {
                3210533212,
                3203439803,
                3203438798,
                3203440611,
                3203443647,
                3203436750
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v556))
    end
})
HTab:AddButton({
    Name = "\239\191\189\217\130\216\177\217\136\217\138\206\169",
    Callback = function()
        print("Clicked")
        local v557 = {
            {
                74148072333019,
                105051845347092,
                103317093565994,
                123546781151669,
                110417909019083,
                140062839549195
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v557))
    end
})
HTab:AddButton({
    Name = "\239\191\189\217\131\216\177\216\179\217\138\206\169",
    Callback = function()
        print("Clicked")
        local v558 = {
            {
                16872133248,
                16872133982,
                16872133723,
                16872133730,
                16872133733,
                134082579
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v558))
    end
})
HTab:AddButton({
    Name = "\239\191\189\217\135\216\167\217\132\217\131\206\169",
    Callback = function()
        print("Clicked")
        local v559 = {
            {
                105938035513300,
                120682289281525,
                78459091342559,
                119167161940457,
                78171925423915,
                92193892051712
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v559))
    end
})
HTab:AddButton({
    Name = "\239\191\189\216\177\217\138\216\168\217\136\216\170\206\169",
    Callback = function()
        print("Clicked")
        local v560 = {
            {
                14776593226,
                14776227941,
                14776227816,
                102149844389538,
                102624006545764,
                74920391713702
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9000000000):WaitForChild("ChangeCharacterBody", 9000000000):InvokeServer(unpack(v560))
    end
})
HouseTab = v71:MakeTab({
    Name = "\239\191\189\217\132\216\168\217\138\217\136\216\170",
    Icon = "rbxassetid://115714662895227"
})
HouseTab:AddSection({
    Name = "\239\191\189\217\131 \216\167\217\132\216\168\216\167\217\134\216\175 \217\136\216\167\216\174\216\176 \216\170\216\173\217\131\217\133"
})
local vu561 = nil
HouseTab:AddTextbox({
    Name = "\239\191\189\216\175\216\174\217\132 \216\177\217\130\217\133 \216\167\217\132\216\168\217\138\216\170",
    Default = "",
    TextDisappear = false,
    Callback = function(p562)
        vu561 = tonumber(p562)
    end
})
HouseTab:AddButton({
    Name = "\239\191\189\216\174\216\176 \216\170\216\173\217\131\217\133",
    Callback = function()
        if vu561 then
            local v563 = {
                "GivePermissionLoopToServer",
                game:GetService("Players").LocalPlayer,
                vu561
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(v563))
        else
            print("Nenhum n\195\186mero de casa selecionado.")
        end
        print("Clicked!")
    end
})
HouseTab:AddSection({
    Name = "\239\191\189\216\174\216\176 \216\172\217\133\217\138\216\185 \216\170\216\173\217\131\217\133 \216\167\217\132\216\168\217\138\217\136\216\170"
})
HouseTab:AddButton({
    Name = "\239\191\189\216\174\216\176 \216\172\217\133\217\138\216\185 \216\170\216\173\217\131\217\133 \216\167\217\132\216\168\217\138\217\136\216\170",
    Callback = function()
        for v564 = 1, 35 do
            if v564 ~= 8 then
                if v564 ~= 9 then
                    if v564 ~= 10 then
                        local v565 = {
                            "GivePermissionLoopToServer",
                            game:GetService("Players").LocalPlayer,
                            v564
                        }
                        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(v565))
                    end
                end
            end
        end
        print("Permissions for all houses granted!")
    end
})
HouseTab:AddSection({
    Name = "\239\191\189\217\134\217\130\217\132 \217\132\217\132\216\168\217\138\217\136\216\170"
})
local vu566 = nil
local function vu573(p567)
    local v568 = workspace["001_Lots"]:FindFirstChild(p567 .. "House")
    if v568 then
        local v569 = v568:FindFirstChild("HousePickedByPlayer")
        local v570 = v569 and v569:FindFirstChild("HouseModel")
        if v570 then
            local v571 = v570:FindFirstChild("001_Safe")
            local v572 = v571 and v571:FindFirstChild("OpenSafeDoorButton")
            if v572 then
                return v572
            end
        end
    else
        vu212:MakeNotification({
            Name = "\239\191\189\216\183\216\167\216\161",
            Content = "Casa n\195\163o encontrada, atualize a tabela ou tente novamente com uma existente.",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
    end
    return nil
end
local function vu579()
    local v574, v575, v576 = pairs(workspace["001_Lots"]:GetChildren())
    local v577 = {}
    while true do
        local v578
        v576, v578 = v574(v575, v576)
        if v576 == nil then
            break
        end
        if string.find(v578.Name, "House") and v578:FindFirstChild("HousePickedByPlayer") then
            table.insert(v577, v578.Owner.Value .. "-" .. v578.Number.Number.Value)
        end
    end
    return v577
end
local vu580 = nil
local function vu583()
    vu580 = HouseTab:AddDropdown({
        Name = "\239\191\189\216\174\216\170\216\167\216\177 \216\167\217\132\216\168\217\138\216\170:",
        Default = "",
        Options = vu579(),
        Callback = function(p581)
            if p581 and p581 ~= "" then
                local v582 = string.split(p581, "-")
                vu566 = tostring(v582[1])
            end
        end
    })
end
vu583()
local function vu584()
    vu566 = nil
    vu580:Destroy()
    vu583()
    vu212:MakeNotification({
        Name = "\239\191\189\216\173\216\175\217\138\216\171 \216\167\217\132\217\130\216\167\216\166\217\133\216\169",
        Content = "Lista de casas atualizada!",
        Image = "rbxassetid://115714662895227",
        Time = 3
    })
end
HouseTab:AddButton({
    Name = "\239\191\189\217\134\217\130\217\132 \217\132\217\132 \216\174\216\178\217\134\216\169 ",
    Callback = function()
        if vu566 then
            if workspace["001_Lots"]:FindFirstChild(vu566 .. "House") then
                local v585 = vu573(vu566)
                if v585 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v585.Position)
                else
                    vu212:MakeNotification({
                        Name = "Erro",
                        Content = "Cofre n\195\163o encontrado na casa " .. tostring(vu566),
                        Image = "rbxassetid://115714662895227",
                        Time = 3
                    })
                end
            else
                vu212:MakeNotification({
                    Name = "Erro",
                    Content = "Casa n\195\163o encontrada, atualize a tabela ou selecione uma existente.",
                    Image = "rbxassetid://115714662895227",
                    Time = 3
                })
            end
        end
    end
})
HouseTab:AddButton({
    Name = "\239\191\189\216\173\216\175\217\138\216\171 \216\167\217\132\217\130\216\167\216\166\217\133\216\169",
    Callback = function()
        vu584()
    end
})
HouseTab:AddSection({
    Name = "\239\191\189\217\134\217\130\217\132 \217\132\217\132\216\168\217\138\217\136\216\170"
})
local vu586 = {
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 1"] = Vector3.new(260.29, 4.37, 209.32),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 2"] = Vector3.new(234.49, 4.37, 228),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 3"] = Vector3.new(262.79, 21.37, 210.84),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 4"] = Vector3.new(229.6, 21.37, 225.4),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 5"] = Vector3.new(173.44, 21.37, 228.11),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 6"] = Vector3.new(- 43, 21, - 137),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 7"] = Vector3.new(- 40, 36, - 137),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 11"] = Vector3.new(- 21, 40, 436),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 12"] = Vector3.new(155, 37, 433),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 13"] = Vector3.new(255, 35, 431),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 14"] = Vector3.new(254, 38, 394),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 15"] = Vector3.new(148, 39, 387),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 16"] = Vector3.new(- 17, 42, 395),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 17"] = Vector3.new(- 189, 37, - 247),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 18"] = Vector3.new(- 354, 37, - 244),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 19"] = Vector3.new(- 456, 36, - 245),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 20"] = Vector3.new(- 453, 38, - 295),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 21"] = Vector3.new(- 356, 38, - 294),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 22"] = Vector3.new(- 187, 37, - 295),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 23"] = Vector3.new(- 410, 68, - 447),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 24"] = Vector3.new(- 348, 69, - 496),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 28"] = Vector3.new(- 103, 12, 1087),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 29"] = Vector3.new(- 730, 6, 808),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 30"] = Vector3.new(- 245, 7, 822),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 31"] = Vector3.new(639, 76, - 361),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 32"] = Vector3.new(- 908, 6, - 361),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 33"] = Vector3.new(- 111, 70, - 417),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 34"] = Vector3.new(230, 38, 569),
    ["\239\191\189\217\138\216\170 \216\177\217\130\217\133 35"] = Vector3.new(- 30, 13, 2209)
}
local v587, v588, v589 = pairs(vu586)
local v590 = {}
while true do
    local v591
    v589, v591 = v587(v588, v589)
    if v589 == nil then
        break
    end
    table.insert(v590, v589)
end
table.sort(v590, function(p592, p593)
    return (tonumber(p592:match("%d+")) or 0) < (tonumber(p593:match("%d+")) or 0)
end)
HouseTab:AddDropdown({
    Name = "\239\191\189\217\134\217\130\217\132 \217\132\217\132\216\168\217\138\217\136\216\170",
    Options = v590,
    Callback = function(p594)
        local v595 = game.Players.LocalPlayer
        if v595 and v595.Character then
            v595.Character.HumanoidRootPart.CFrame = CFrame.new(vu586[p594])
        end
    end
})
HouseTab:AddSection({
    Name = "\239\191\189\217\131 \216\167\217\132\216\168\216\167\217\134\216\175 \216\185\217\134 \216\167\217\132\216\168\217\138\217\136\216\170"
})
HouseTab:AddToggle({
    Name = "\239\191\189\216\182\216\186\216\183 \217\132\216\167\216\178\216\167\217\132\217\135 \216\167\217\132\216\173\216\182\216\177 \217\133\217\134 \217\131\217\132 \216\167\217\132\216\168\217\138\217\136\216\170",
    Default = false,
    Callback = function(p596)
        isUnbanActive = p596
        if isUnbanActive then
            print("Auto Unban Activated")
            startAutoUnban()
        else
            print("Auto Unban Deactivated")
        end
    end
})
local v597 = v71:MakeTab({
    Name = "\239\191\189\217\132\216\167\216\179\217\133\216\167\216\161",
    Icon = "rbxassetid://115714662895227",
    PremiumOnly = false
})
v597:AddSection({
    Name = "\239\191\189\217\132\217\136\217\138\217\134 \216\167\217\132\216\167\216\179\217\133"
})
local vu598 = false
local vu599 = nil
local vu600 = {
    Color3.new(1, 0.215, 0.223),
    Color3.new(1, 0.419, 0.267),
    Color3.new(1, 0.681, 0.129),
    Color3.new(0.867, 1, 0.304),
    Color3.new(0.612, 1, 0.273),
    Color3.new(0.229, 1, 0.53),
    Color3.new(0.116, 0.754, 1),
    Color3.new(0, 0.078, 1),
    Color3.new(0.424, 0, 1),
    Color3.new(1, 0, 0.149)
}
local vu601 = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eColo1r")
v597:AddToggle({
    Name = "\239\191\189\216\179\217\133 \217\133\217\132\217\136\217\134",
    Flag = "RGBNameToggle",
    Callback = function(p602)
        vu598 = p602
        if p602 then
            vu599 = task.spawn(function()
                while vu598 do
                    local v603, v604, v605 = ipairs(vu600)
                    while true do
                        local v606
                        v605, v606 = v603(v604, v605)
                        if v605 == nil or not vu598 then
                            break
                        end
                        vu601:FireServer("PickingRPNameColor", v606)
                        task.wait(0.2)
                    end
                end
            end)
        elseif vu599 then
            task.cancel(vu599)
        end
    end
})
local vu607 = false
local vu608 = nil
local vu609 = {
    Color3.new(1, 0.292, 0.129),
    Color3.new(1, 0.498, 0.053),
    Color3.new(1, 0.995, 0.249),
    Color3.new(0.051, 1, 0.159),
    Color3.new(0.111, 0.809, 1),
    Color3.new(0.074, 0.044, 1),
    Color3.new(0.556, 0.123, 1),
    Color3.new(1, 0.002, 0.802),
    Color3.new(1, 0.029, 0.027)
}
v597:AddToggle({
    Name = "\239\191\189\216\167\217\138\217\136 \217\133\217\132\217\136\217\134",
    Flag = "RGBBioToggle",
    Callback = function(p610)
        vu607 = p610
        if p610 then
            vu608 = task.spawn(function()
                while vu607 do
                    local v611, v612, v613 = ipairs(vu609)
                    while true do
                        local v614
                        v613, v614 = v611(v612, v613)
                        if v613 == nil or not vu607 then
                            break
                        end
                        vu601:FireServer("PickingRPBioColor", v614)
                        task.wait(0.2)
                    end
                end
            end)
        elseif vu608 then
            task.cancel(vu608)
        end
    end
})
v597:AddSection({
    Name = "\239\191\189\217\142\216\179\217\142\217\133\217\142\216\163\217\142\216\161 \216\168\217\142\217\134\217\144\216\163\217\142\216\170\217\142"
})
v597:AddButton({
    Name = "\239\191\189\217\133\216\179",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\146\217\133\217\142\216\179\217\142")
    end
})
v597:AddButton({
    Name = "\239\191\189\216\185\216\167\216\161",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\145\216\185\217\128\216\167\216\161")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\133\216\167\216\177\217\135",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\128\217\133\216\167\216\177\217\135")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\133 \216\185\216\168\217\138\216\179",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\133 \216\167\216\185\217\128\216\168\217\138\217\128\216\179")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\138\217\133",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\140\217\138\217\143\217\133\217\142")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\138\217\132\217\137",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\146\217\138\217\143\217\132\217\146\217\137")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\130\217\138\216\169",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\140\217\130\217\143\217\138\217\143\216\169")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\138\217\134\216\168",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\141\217\138\217\134\217\128\217\144\217\144\217\128\217\144\217\128\216\168\217\128\217\140\217\128\217\140\217\140\217\128\217\140\217\140\217\140\217\128\217\140\217\140\217\128\217\140")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\135\216\175",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\135\216\175")
    end
})
v597:AddButton({
    Name = "\239\191\189\216\177\217\138\217\133",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\128\217\146\217\128\217\146\217\146\217\128\217\146\216\177\217\138\217\133\217\128\217\146\217\128\217\146\217\146\217\128\217\146")
    end
})
v597:AddButton({
    Name = "\239\191\189\216\167\216\183\217\133\217\135",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\128\216\162\216\183\217\128\217\133\217\142\217\135\217\143")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\135\216\177\216\167\216\161",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\142\217\135\217\143\216\177\217\140\216\163\217\142\216\161")
    end
})
v597:AddButton({
    Name = "\239\191\189\216\177\216\172\216\179",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", " \217\134\217\144\216\177\217\140\216\172\217\144\216\179\217\142")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\136\216\177",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\144\217\136\217\140\216\177\217\140")
    end
})
v597:AddButton({
    Name = "\239\191\189\216\179\216\177\216\167\216\161",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\142\216\179\217\142\216\177\217\140\216\163\217\142\216\161")
    end
})
v597:AddSection({
    Name = "\239\191\189\217\142\216\179\217\142\217\133\217\142\216\163\217\142\216\161 \217\136\217\140\217\132\216\175\217\143"
})
v597:AddButton({
    Name = "\239\191\189\216\167\216\177\216\170\217\134",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\216\167\216\177\216\170\217\134")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\136\217\134\217\128\217\138\218\170",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\136\217\134\217\128\217\138\218\170")
    end
})
v597:AddButton({
    Name = "\239\191\189\216\177\216\168\216\177",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\128\216\177\216\168\217\128\216\177")
    end
})
v597:AddButton({
    Name = "\239\191\189\216\167\216\179\217\128\217\133",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\128\216\167\216\179\217\128\217\133")
    end
})
v597:AddButton({
    Name = "\239\191\189\216\167\216\179\217\138\217\134",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\128\216\167\216\179\217\138\217\128\217\134")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\138\216\170\216\167\216\180\217\138",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\142\217\138\217\143\216\170\217\142\216\163\217\142\216\180\217\146\217\138\217\143")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\132\217\138",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\143\217\132\217\146\217\138\217\143")
    end
})
v597:AddButton({
    Name = "\239\191\189\216\179\217\138\217\134",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\142\216\179\217\142\217\138\217\143\217\134\217\144")
    end
})
v597:AddButton({
    Name = "\239\191\189\216\177\216\167\216\177",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\128\216\177\216\167\216\177")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\133\216\167\216\177",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\143\217\133\217\142\216\163\217\142\216\177\217\140")
    end
})
v597:AddButton({
    Name = "\239\191\189\216\173\217\133\216\175",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\142\216\173\217\142\217\133\217\142\216\175\217\143")
    end
})
v597:AddButton({
    Name = "\239\191\189\216\172\216\170\216\168\217\137",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\142\216\172\217\144\216\170\217\142\216\168\217\142\217\137")
    end
})
v597:AddButton({
    Name = "\239\191\189\216\179\217\138\217\134 ",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\142\216\179\217\142\217\134\217\144")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\135\217\133",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\146\217\135\217\143\217\133\217\142")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\138\217\129",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\142\217\138\217\143\217\129")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\136\216\179\217\129",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", " \217\138\217\143\217\136\217\140\216\179\217\142\217\129")
    end
})
v597:AddButton({
    Name = "\239\191\189\216\168\216\175\216\167\217\132\217\132\217\135",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\143\216\168\217\142\216\176\216\163\217\142\217\132\217\146\217\132\217\146\217\135\217\143")
    end
})
v597:AddButton({
    Name = "\239\191\189\217\136\216\179\217\137",
    Callback = function()
        game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "\239\191\189\217\142\217\136\217\140\216\179\217\142\217\137")
    end
})
local vu615 = {
    Color3.new(1, 0, 0),
    Color3.new(0, 1, 0),
    Color3.new(0, 0, 1),
    Color3.new(1, 1, 0),
    Color3.new(1, 0, 1),
    Color3.new(0, 1, 1),
    Color3.new(0.5, 0, 0.5),
    Color3.new(1, 0.5, 0)
}
local vu616 = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sCa1r")
local vu617 = false
local function vu622()
    while vu617 do
        local v618, v619, v620 = ipairs(vu615)
        while true do
            local v621
            v620, v621 = v618(v619, v620)
            if v620 == nil then
                break
            end
            if not vu617 then
                return
            end
            vu616:FireServer(unpack({
                "PickingCarColor",
                v621
            }))
            wait(1)
        end
    end
end
local v623 = v71:MakeTab({
    Name = "\239\191\189\217\132\216\167\216\186\217\128\216\167\217\134\217\138 \217\133\216\172\217\128\216\167\217\134\217\138\216\169",
    Icon = "rbxassetid://115714662895227",
    PremiumOnly = false
})
v623:AddSection({
    Name = "\239\191\189\216\186\216\167\217\134\217\138 \217\133\216\172\216\167\217\134\217\138\216\169 \216\167\216\174\216\170\216\167\216\177\217\135\216\167"
})
v623:AddDropdown({
    Name = "\239\191\189\216\174\217\128\216\170\216\167\216\177 \216\167\217\132\216\167\216\186\217\128\217\134\217\138\216\169 \216\167\217\132\216\170\217\128\216\177\217\138\217\128\216\175\217\135\216\167",
    Default = "Select a sound...",
    Options = soundNames,
    Callback = function(p624)
        local v625, v626, v627 = ipairs(sounds)
        while true do
            local v628
            v627, v628 = v625(v626, v627)
            if v627 == nil then
                break
            end
            if v628.name == p624 then
                playSound(v628.id)
                break
            end
        end
    end
})
v623:AddSection({
    Name = "\239\191\189\216\186\216\167\217\134\217\138 \217\133\216\172\216\167\217\134\217\138\216\169 \216\170\216\182\217\135\216\177 \217\132\217\132\216\179\217\138\216\177\217\129\216\177 \217\131\216\167\217\133\217\132"
})
local vu629 = {
    {
        name = "\239\191\189\217\138\216\179\217\136\216\179\216\179\216\179\216\179 ",
        id = 78275845721592
    },
    {
        name = "\239\191\189\216\177\216\167\216\174 1",
        id = 270145703
    },
    {
        name = "\239\191\189\216\177\216\167\216\174 2",
        id = 18131809532
    },
    {
        name = "\239\191\189\216\1681 ",
        id = 6536444735
    },
    {
        name = "\239\191\189\216\1682",
        id = 8701632845
    },
    {
        name = "\239\191\189\216\1683 ",
        id = 7590164518
    },
    {
        name = "SUS",
        id = 7705506391
    },
    {
        name = "\239\191\189\216\185\216\185\216\185\216\185",
        id = 7772283448
    },
    {
        name = "\239\191\189\217\138\217\138\217\138",
        id = 18786647417
    },
    {
        name = "Bat Hit",
        id = 7129073354
    },
    {
        name = "\239\191\189\216\168\217\131\217\135",
        id = 90807238125839
    },
    {
        name = "\239\191\189\217\132\217\133\216\173\217\133\216\182\217\138\217\134",
        id = 133188753831517
    },
    {
        name = "Estora t\195\173mpano",
        id = 268116333
    }
}
local v630, v631, v632 = ipairs(vu629)
local vu633 = vu617
local v634 = {}
local vu635 = nil
local vu636 = nil
while true do
    local v637
    v632, v637 = v630(v631, v632)
    if v632 == nil then
        break
    end
    table.insert(v634, v637.name)
end
v623:AddTextbox({
    Name = "\239\191\189\217\128\217\132\217\138 \217\131\217\128\217\136\216\175 \216\167\217\132\216\167\216\186\217\128\217\134\217\138\216\169 ",
    Default = "",
    Callback = function(p638)
        vu635 = tonumber(p638)
    end
})
v623:AddDropdown({
    Name = "\239\191\189\216\174\217\128\216\170\216\167\216\177 \216\167\217\132\216\163\216\186\217\128\217\134\217\138\216\169",
    Default = v634[1],
    Options = v634,
    Callback = function(p639)
        local v640, v641, v642 = ipairs(vu629)
        while true do
            local v643
            v642, v643 = v640(v641, v642)
            if v642 == nil then
                break
            end
            if v643.name == p639 then
                vu635 = v643.id
                break
            end
        end
    end
})
v623:AddButton({
    Name = "\239\191\189\217\128\216\180\216\186\217\138\217\132 \216\167\217\132\216\167\216\186\217\128\217\134\217\138\216\169 \217\133\216\175\216\169 \217\163 \216\171\217\136\216\167\217\134\217\138",
    Callback = function()
        playAudio()
    end
})
task.spawn(function()
    while true do
        if audioLoop and not currentSound then
            playAudio()
        end
        task.wait(0.1)
    end
end)
local vu644 = false
local vu645 = nil
v623:AddToggle({
    Name = "\239\191\189\216\168\217\128\216\167\217\133 \216\167\217\132\216\167\216\186\217\128\217\134\217\138\216\169 \216\185\216\167\216\175\217\138",
    Default = false,
    Callback = function(p646)
        vu644 = p646
        if vu644 or not vu645 then
            if vu644 and not vu645 then
                playAudio()
            end
        else
            vu645:Stop()
            vu645 = nil
        end
    end
})
local vu647 = false
v597:AddSection({
    "Loop de Audio"
})
local function vu650()
    while vu647 do
        if vu635 then
            local v648 = {
                game:GetService("Workspace"),
                vu635,
                1
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(v648))
            local v649 = Instance.new("Sound")
            v649.SoundId = "rbxassetid://" .. vu635
            v649.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            v649:Play()
        else
            warn("Nenhum \195\161udio selecionado!")
        end
        task.wait(0.5)
    end
end
v623:AddToggle({
    Name = "\239\191\189\216\168\216\167\217\133 \217\132\217\132 \216\167\216\186\216\167\217\134\217\138 \216\179\216\177\217\138\216\185 \216\172\216\175\216\167",
    Description = "Ativa o loop do \195\161udio",
    Default = false,
    Flag = "audio_loop",
    Callback = function(p651)
        vu647 = p651
        if vu647 then
            task.spawn(vu650)
        end
    end
})
local function vu653()
    if vu635 then
        if vu645 then
            vu645:Stop()
        end
        local v652 = {
            game:GetService("Workspace"),
            vu635,
            1
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(v652))
        vu645 = Instance.new("Sound")
        vu645.SoundId = "rbxassetid://" .. vu635
        vu645.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        vu645:Play()
        vu645.Ended:Connect(function()
            if vu647 then
                vu653()
            end
        end)
    else
        warn("Nenhum \195\161udio selecionado!")
    end
end
local vu654 = game:GetService("ReplicatedStorage")
local vu655 = 6314880174
local function vu662(p656)
    local function vu658()
        local v657 = workspace:FindFirstChild("Audio all client")
        if not v657 then
            v657 = Instance.new("Folder")
            v657.Name = "Audio all client"
            v657.Parent = workspace
        end
        return v657
    end;
    (function(p659)
        if type(p659) ~= "number" then
            print("Insira um n\195\186mero v\195\161lido!")
            return nil
        end
        local v660 = vu658()
        if v660 then
            local v661 = Instance.new("Sound")
            v661.SoundId = "rbxassetid://" .. p659
            v661.Volume = 1
            v661.Looped = false
            v661.Parent = v660
            v661:Play()
            task.wait(1)
            v661:Destroy()
        end
    end)(p656)
end
local function vu665(p663)
    if type(p663) ~= "number" then
        print("Insira um n\195\186mero v\195\161lido!")
        return nil
    end
    local v664 = vu654:FindFirstChild("1Gu1nSound1s", true)
    if v664 then
        v664:FireServer(workspace, p663, 1)
    end
end
v623:AddToggle({
    Name = "\239\191\189\217\136\216\170 \217\130\217\136\217\138 \217\136\217\138\216\174\216\177\216\168 \216\179\217\138\216\177\217\129\216\177 \216\168\216\175\217\136\217\134 \216\170\217\136\217\130\217\129",
    Description = "Toca \195\161udio repetidamente para todos",
    Default = false,
    Flag = "audio_spam",
    Callback = function(p666)
        getgenv().Audio_All_loop_fast = p666
        while getgenv().Audio_All_loop_fast do
            vu665(vu655)
            task.spawn(function()
                vu662(vu655)
            end)
            task.wait(0.03)
        end
    end
})
local v667 = v71:MakeTab({
    Name = "\239\191\189\217\132\216\179\217\138\216\167\216\177\216\169",
    Icon = "rbxassetid://115714662895227",
    PremiumOnly = false
})
v667:AddSection({
    Name = "\239\191\189\217\138\216\167\216\175\216\169 \216\179\216\177\216\185\216\169 \216\167\217\132\216\179\217\138\216\167\216\177\216\169"
})
v667:AddTextbox({
    Name = "\239\191\189\216\175\216\174\217\132 \216\179\216\177\216\185\216\169 \216\167\217\132\216\179\217\138\216\167\216\177\216\169",
    Default = "",
    TextDisappear = false,
    Callback = function(p668)
        local v669 = game.Players.LocalPlayer
        local v670 = workspace.Vehicles:FindFirstChild(v669.Name .. "Car")
        local v671 = tonumber(p668)
        if v671 and (0 <= v671 and (v671 <= 500 and v670)) then
            v670.Body.VehicleSeat.TopSpeed.Value = v671
        end
    end
})
v667:AddLabel(" \217\133\217\132\216\167\216\173\216\182\216\169: \216\173\216\175 \216\167\217\132\216\167\217\130\216\181\217\137 \217\132\216\179\216\177\216\185\216\169 \216\167\217\132\216\179\217\138\216\167\216\177\216\169 \217\135\217\138 200");
(function(p672)
    p672:AddTextbox({
        Name = "\239\191\189\216\175\216\174\217\132 \217\131\217\136\216\175 \216\167\217\132\216\167\216\186\217\134\217\138\216\169 \217\132\216\170\216\180\216\186\217\138\217\132\217\135\216\167",
        Default = "",
        TextDisappear = false,
        Callback = function(p673)
            playCarMusic(p673)
            playScooterMusic(p673)
            playHouseMusic(p673)
        end
    })
    p672:AddDropdown({
        Name = "\239\191\189\216\174\216\170\216\167\216\177 \216\167\217\132\216\167\216\186\217\134\217\138\216\169",
        Options = musicIds,
        Callback = function(p674)
            playCarMusic(p674)
            playScooterMusic(p674)
            playHouseMusic(p674)
        end
    })
end)(v667)
v667:AddSection({
    Name = "\239\191\189\216\181\216\167\216\166\216\181 \216\179\217\138\216\167\216\177\216\169"
})
v667:AddToggle({
    Name = "\239\191\189\217\138\216\167\216\177\216\169 \217\133\217\132\217\136\217\134\216\169",
    Default = false,
    Callback = function(p675)
        vu633 = p675
        if vu633 then
            vu636 = coroutine.create(vu622)
            coroutine.resume(vu636)
        end
    end
})
local vu676 = {
    "Horn"
}
local vu677 = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sCa1r")
local vu678 = false
local function vu679()
    while vu678 do
        vu677:FireServer(unpack(vu676))
        wait(0.1)
    end
end
v667:AddToggle({
    Name = "\239\191\189\216\168\216\167\217\133 \217\135\217\136\216\177\217\134",
    Default = false,
    Callback = function(p680)
        vu678 = p680
        if vu678 then
            spawn(vu679)
        end
    end
})
local vu681 = {
    "SchoolBus",
    "SmartCar",
    "FarmTruck",
    "Cadillac",
    "Excavator",
    "Jeep",
    "NascarTruck",
    "TowTruck",
    "Snowplow",
    "MilitaryTruck",
    "Tank",
    "Limo",
    "FireTruck"
}
local vu682 = false
local function vu684(p683)
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack({
        "PickingCar",
        p683
    }))
end
v667:AddToggle({
    Name = "\239\191\189\216\168\216\167\217\133 \216\179\217\138\216\167\216\177\216\167\216\170",
    Default = false,
    Callback = function(p685)
        vu682 = p685
        if vu682 then
            task.spawn(function()
                while vu682 do
                    local v686, v687, v688 = ipairs(vu681)
                    while true do
                        local v689
                        v688, v689 = v686(v687, v688)
                        if v688 == nil or not vu682 then
                            break
                        end
                        vu684(v689)
                        wait(0.4)
                    end
                end
            end)
        end
    end
})
local v690 = v71:MakeTab({
    Name = "\239\191\189\216\186\216\167\217\134\217\138",
    Icon = "rbxassetid://115714662895227"
})
v690:AddSection({
    Name = "\239\191\189\216\186\217\128\216\167\217\134\217\138 \216\168\217\136\217\131\216\179 "
})
v690:AddTextbox({
    Name = "\239\191\189\216\175\216\174\217\132 \217\131\217\136\216\175 \216\167\217\132\216\167\216\186\217\134\217\138\216\169",
    Default = "",
    PlaceholderText = "\239\191\189\216\175\216\174\217\132 \216\167\217\132\216\167\216\186\217\134\217\138\217\135 \216\179\217\131\217\138\216\170 \216\168\217\136\216\177\216\175",
    ClearText = true,
    Callback = function(p691)
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            p691
        }))
    end
})
v690:AddSection({
    Name = "\239\191\189\216\186\217\128\216\167\217\134\217\138 \216\172\216\175\217\138\216\175\216\167\216\170 "
})
v690:AddButton({
    Name = "I love you so",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            "100697759026652"
        }))
    end
})
v690:AddButton({
    Name = "FUNK1",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            "81520732359105"
        }))
    end
})
v690:AddButton({
    Name = "FUNK2",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            "100697759026652"
        }))
    end
})
v690:AddSection({
    Name = "\239\191\189\216\186\217\128\216\167\217\134\217\138 \216\185\216\177\216\168\217\128\217\138\216\169 "
})
v690:AddButton({
    Name = "\239\191\189\216\177\216\167\217\130\217\1381",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            "119630965566559"
        }))
    end
})
v690:AddButton({
    Name = "\239\191\189\216\177\216\167\217\130\217\1382",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            "119437864395329"
        }))
    end
})
v690:AddButton({
    Name = "\239\191\189\216\177\216\167\217\130\217\1383",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            "111256095783364"
        }))
    end
})
v690:AddButton({
    Name = "\239\191\189\216\177\216\167\217\130\217\1384",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            "80039364766636"
        }))
    end
})
v690:AddButton({
    Name = "5\216\185\216\177\216\167\217\130\217\138",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            "122774951440401"
        }))
    end
})
v690:AddButton({
    Name = "\239\191\189\216\186\217\134\217\128\217\138\216\169 \216\185\216\177\216\168\217\128\217\138\216\169 \216\173\217\128\217\132\217\136\217\135",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            "93620598835551"
        }))
    end
})
v690:AddButton({
    Name = "\239\191\189\216\186\217\134\217\128\217\138\216\169 \216\185\216\177\216\168\217\128\217\138\216\169 2",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            "1836685732"
        }))
    end
})
v690:AddButton({
    Name = "\239\191\189\216\186\217\134\217\128\217\138\216\169 \216\185\216\177\216\168\217\128\217\138\216\169 3",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            "106633496198864"
        }))
    end
})
v690:AddButton({
    Name = "\239\191\189\217\128\216\178\217\129 \216\173\217\128\216\178\217\138\217\134",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            "135308045"
        }))
    end
})
v690:AddButton({
    Name = "\239\191\189\217\133\217\128\216\180\217\136\217\134",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            "133188753831517"
        }))
    end
})
v690:AddButton({
    Name = "\239\191\189\216\168\217\128\218\169\217\128\217\135",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            "90807238125839"
        }))
    end
})
v690:AddSection({
    Name = " \216\167\216\186\216\167\217\134\217\128\217\138 \217\133\216\178\216\185\216\172\217\128\217\135 "
})
v690:AddButton({
    Name = "\239\191\189\217\136\217\138\217\132\217\138 \216\185\217\132\217\138\217\131 \216\172\217\138\216\179\217\136\216\179\216\179\216\179\216\179",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            "78275845721592"
        }))
    end
})
v690:AddButton({
    Name = "\239\191\189\217\136\216\170 \217\133\216\178\216\185\216\172 \216\185\216\167\217\132\217\138 \216\172\216\175\216\162",
    Callback = function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "SkateBoard"
        }))
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack({
            "PickingScooterMusicText",
            "7764369437"
        }))
    end
})