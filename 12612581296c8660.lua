-- ts file was generated at discord.gg/25ms


function runAutoAccept()
    local vu1 = {
        "EnterTheGame",
        {}
    }
    local v2, v3 = pcall(function()
        game:GetService("ReplicatedStorage").Chest.Remotes.Functions.EtcFunction:InvokeServer(unpack(vu1))
    end)
    if v2 then
        print("AutoAccept executed successfully.")
        return true
    else
        warn("Failed to execute AutoAccept: ", v3)
        return false
    end
end
runAutoAccept()
wait(1)
local v4 = game.Players
repeat
    Client = v4.LocalPlayer
    wait()
until Client
local vu5 = game:GetService("TeleportService")
game:GetService("Players")
local _ = game.PlaceId
Char = Client.Character
vu = game:GetService("VirtualUser")
Sea1 = game.PlaceId == 4520749081
Sea2 = game.PlaceId == 6381829480
Sea3 = game.PlaceId == 15759515082
cheatKey = {}
myWeapon = {
    Melee = "",
    Sword = "",
    Fruit = ""
}
addSkill = "?"
_G.Settings = {
    Select_Weapon = "Sword",
    Auto_Sea31 = false,
    Select_Skill = true,
    SkillZ = false,
    SkillX = false,
    SkillC = false,
    SkillV = false,
    SkillB = false,
    SkillE = false
}
local vu6 = "zensave1"
local vu7 = Client.Name .. " Config.json"
function SaveSettings()
    local v8 = game:GetService("HttpService"):JSONEncode(_G.Settings)
    if writefile then
        if isfolder(vu6) then
            if isfolder(vu6 .. "/King Legacy") then
                writefile(vu6 .. "/King Legacy/" .. vu7, v8)
            else
                makefolder(vu6 .. "/King Legacy")
                writefile(vu6 .. "/King Legacy/" .. vu7, v8)
            end
        else
            makefolder(vu6)
            makefolder(vu6 .. "/King Legacy")
            writefile(vu6 .. "/King Legacy/" .. vu7, v8)
        end
    end
end
function LoadSettings()
    local v9 = game:GetService("HttpService")
    if isfile(vu6 .. "/King Legacy/" .. vu7) then
        local v10, v11, v12 = pairs(v9:JSONDecode(readfile(vu6 .. "/King Legacy/" .. vu7)) or _G.Settings)
        while true do
            local v13
            v12, v13 = v10(v11, v12)
            if v12 == nil then
                break
            end
            _G.Settings[v12] = v13
        end
    end
end
LoadSettings()
Client.Idled:connect(function()
    vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
GUI = Client.PlayerGui
Repli = game:GetService("ReplicatedStorage")
QuestManager = game:GetService("ReplicatedStorage").Chest.Modules.QuestManager
task.spawn(function()
    while task.wait() do
        pcall(function()
            if NeedNoClip then
                if Client and (Client:FindFirstChild("Character") and Client.Character.Humanoid.Sit == true) then
                    Client.Character.Humanoid.Sit = false
                end
                local v14, v15, v16 = pairs(Char:GetDescendants())
                while true do
                    local v17
                    v16, v17 = v14(v15, v16)
                    if v16 == nil then
                        break
                    end
                    if v17:IsA("BasePart") then
                        v17.CanCollide = false
                    end
                end
                if Char and not Char.UpperTorso:FindFirstChild("BodyClip") then
                    local v18 = Instance.new("BodyVelocity")
                    v18.Parent = Char.UpperTorso
                    v18.Name = "BodyClip"
                    local v19 = Vector3.new(math.huge, math.huge, math.huge)
                    v18.Velocity = Vector3.new(0, 1, 0)
                    v18.MaxForce = v19
                elseif Char and (Char.UpperTorso:FindFirstChild("BodyClip") and Char and Char.UpperTorso:FindFirstChild("BodyClip")) then
                    Char.UpperTorso:FindFirstChild("BodyClip").MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    Char.UpperTorso:FindFirstChild("BodyClip").Velocity = Vector3.new(0, 0, 0)
                end
            elseif Char and Char.UpperTorso:FindFirstChild("BodyClip") then
                Char.UpperTorso:FindFirstChild("BodyClip"):Destroy()
            end
        end)
    end
end)
local vu20 = nil
local vu21 = nil
function getTool()
    local v22, v23, v24 = pairs(Client.Character:GetChildren())
    while true do
        local v25
        v24, v25 = v22(v23, v24)
        if v24 == nil then
            break
        end
        if v25:IsA("Tool") then
            if v25.ToolTip == "Fruit Power" then
                addSkill = "DF"
            end
            vu20 = tostring(v25.Name)
            vu21 = v25.ToolTip
        end
    end
    return vu20
end
local vu31 = {
    CheckOnCooldown = function(p26)
        getTool()
        local v27 = string.upper(p26 or "Z")
        local v28 = Client.PlayerGui.SkillCooldown
        local v29 = nil
        if vu21 ~= "Sword" then
            if vu21 ~= "Combat" then
                if vu21 == "Fruit Power" then
                    v29 = v28:FindFirstChild("DFFrame")
                end
            else
                v29 = v28:FindFirstChild("FSFrame")
            end
        else
            v29 = v28:FindFirstChild("SWFrame")
        end
        if not (v29 and v29:FindFirstChild(v27)) then
            return true
        end
        local v30 = v29[v27]
        return not v30:FindFirstChild("Locked").Visible and v30.Frame.Frame.AbsoluteSize.X > 0 and true or false
    end
}
function getPlayerMaterial(p32)
    local v33 = game:GetService("HttpService")
    local v34, v35, v36 = pairs(v33:JSONDecode(Client.PlayerStats.Material.Value))
    while true do
        local v37
        v36, v37 = v34(v35, v36)
        if v36 == nil then
            break
        end
        if v36 == p32 then
            return v37
        end
    end
    return 0
end
QuestMaterial = {
    ["3350"] = {
        Material = "Ice Crystal",
        Kills = "Azlan [Lv. 3300]",
        QuestTitle = "Kill 4 Azlan",
        Level = 3300
    },
    ["3375"] = {
        Material = "Magma Crystal",
        Kills = "The Volcano [Lv. 3325]",
        QuestTitle = "Kill 4 The Volcano",
        Level = 3325
    },
    ["3475"] = {
        Material = "Dark Beard\'s Totem",
        Kills = "Sally [Lv. 3450]",
        QuestTitle = "Kill 1 Sally",
        Level = 3450
    },
    ["3575"] = {
        Material = "Lucidus\'s Totem",
        Kills = "Vice Admiral [Lv. 3500]",
        QuestTitle = "Kill 5 Vice Admiral",
        Level = 3500
    }
}
function GetQuestData(p38)
    local vu39 = Client.PlayerStats.lvl.Value
    local v40, v41, v42 = pairs(require(game.ReplicatedStorage.Chest.Modules.QuestManager))
    local v43 = {}
    while true do
        local vu44, vu45 = v40(v41, v42)
        if vu44 == nil then
            break
        end
        v42 = vu44
        if not vu45.DailyQuest then
            local _ = vu45.Level ~= 0
            tonumber(vu45.Mob:match("Lv%. (%d+)"))
            if vu45.Mob:match("Lv") and (p38 or vu45.Level <= vu39) then
                table.insert(v43, {
                    LevelRequired = vu45.Level or 1,
                    Mob = (function()
                        return vu39 >= 3300 and vu39 < 3375 and "Azlan [Lv. 3300]" or vu45.Mob
                    end)(),
                    QuestTitle = (function()
                        return vu39 >= 3300 and vu39 < 3375 and "Kill 4 Azlan" or vu44
                    end)(),
                    NPC = (function()
                        local v46, v47, v48 = pairs(game:GetService("Workspace"):FindFirstChild("AllNPC"):GetChildren())
                        local v49 = {}
                        while true do
                            local v50
                            v48, v50 = v46(v47, v48)
                            if v48 == nil then
                                break
                            end
                            if v50:GetAttribute("LevelMin") and vu45.Level >= v50:GetAttribute("LevelMin") then
                                v49[# v49 + 1] = {
                                    Level = v50:GetAttribute("LevelMin"),
                                    CFrame = v50.CFrame
                                }
                            end
                        end
                        table.sort(v49, function(p51, p52)
                            return p51.Level > p52.Level
                        end)
                        return v49[1]
                    end)()
                })
            end
        end
    end
    table.sort(v43, function(p53, p54)
        return p53.LevelRequired > p54.LevelRequired
    end)
    if MaxLevelOfSea > vu39 or not Sea2 then
        if MaxLevelOfSea <= vu39 and Sea1 then
            v43[1].Mob = "Seasoned Fishman [Lv. 2200]"
            v43[1].LevelRequired = 2200
            v43[1].QuestTitle = "Kill 1 Seasoned Fishman"
        end
    else
        v43[1].Mob = "Ryu [Lv. 3975]"
        v43[1].LevelRequired = 3950
        v43[1].QuestTitle = "Kill 1 Ryu"
    end
    local v55, v56, v57 = pairs(QuestMaterial)
    while true do
        local v58, v59 = v55(v56, v57)
        if v58 == nil then
            break
        end
        v57 = v58
        if v43[1].LevelRequired == tonumber(v58) then
            local v60, v61, v62 = pairs(workspace.Monster.Mon:GetChildren())
            local v63 = nil
            while true do
                local v64
                v62, v64 = v60(v61, v62)
                if v62 == nil then
                    break
                end
                if v64.Name == v43[1].Mob and (v64:FindFirstChild("Humanoid") and (v64:FindFirstChild("HumanoidRootPart") and v64.Humanoid.Health > 0)) then
                    v63 = true
                end
            end
            local v65, v66, v67 = pairs(workspace.Monster.Boss:GetChildren())
            while true do
                local v68
                v67, v68 = v65(v66, v67)
                if v67 == nil then
                    break
                end
                if v68.Name == v43[1].Mob and (v68:FindFirstChild("Humanoid") and (v68:FindFirstChild("HumanoidRootPart") and v68.Humanoid.Health > 0)) then
                    v63 = true
                end
            end
            local v69, v70, v71 = pairs(game:GetService("ReplicatedStorage").MOB:GetChildren())
            while true do
                local v72
                v71, v72 = v69(v70, v71)
                if v71 == nil then
                    break
                end
                if v72.Name == v43[1].Mob and (v72:FindFirstChild("Humanoid") and (v72:FindFirstChild("HumanoidRootPart") and v72.Humanoid.Health > 0)) then
                    v63 = true
                end
            end
            if getPlayerMaterial(v59.Material) > 0 or v63 then
                if getPlayerMaterial(v59.Material) > 0 and not v63 then
                    local v73 = {
                        "QuestSpawnBoss",
                        {
                            SuccessQuest = "Quest Accepted.",
                            BossName = v43[1].Mob,
                            LevelNeed = v43[1].LevelRequired,
                            QuestName = v43[1].QuestTitle,
                            MaterialNeed = v59.Material
                        }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("EtcFunction"):InvokeServer(unpack(v73))
                end
            else
                v43[1].Mob = v59.Kills
                v43[1].LevelRequired = v59.Level
                v43[1].QuestTitle = v59.QuestTitle
            end
        end
    end
    return v43[1]
end
local v74, v75, v76 = pairs(game:GetService("Workspace"):FindFirstChild("AllNPC"):GetChildren())
while true do
    local v77, v78 = v74(v75, v76)
    if v77 == nil then
        break
    end
    v76 = v77
    if v78:GetAttribute("LevelMax") then
        lvmax = v78:GetAttribute("LevelMax")
        if not MaxLevelOfSea or lvmax > MaxLevelOfSea then
            MaxLevelOfSea = lvmax
        end
    end
    if v78:GetAttribute("LevelMin") then
        lvmin = v78:GetAttribute("LevelMin")
        if not MinLevelOfSea or lvmin < MinLevelOfSea then
            MinLevelOfSea = lvmax
        end
    end
end
function tp(pu79)
    pcall(function()
        local v80 = Client
        if v80 then
            v80 = Client.Character
        end
        if v80:FindFirstChild("Humanoid") and v80.Humanoid.Sit == true then
            v80.Humanoid.Sit = false
        end
        NeedNoClip = true
        local v81 = {
            Target = pu79.Target or print("mae mung tai."),
            Mod = pu79.Mod or CFrame.new(0, 0, 0)
        }
        v80:FindFirstChild("HumanoidRootPart").CFrame = v81.Target * v81.Mod
    end)
end
function Tp(p82)
    if Client.Character.Humanoid.Sit == true then
        Client.Character.Humanoid.Sit = false
    end
    local v83, v84, v85 = pairs(Client.Character:GetDescendants())
    while true do
        local v86
        v85, v86 = v83(v84, v85)
        if v85 == nil then
            break
        end
        if v86:IsA("BasePart") then
            v86.CanCollide = false
        end
    end
    if not Client.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
        local v87 = Instance.new("BodyVelocity")
        v87.Parent = Client.Character.HumanoidRootPart
        v87.Name = "BodyClip"
        local v88 = Vector3.new(5, math.huge, 5)
        v87.Velocity = Vector3.new(0, 0, 0)
        v87.MaxForce = v88
    end
    Client.Character.HumanoidRootPart.CFrame = p82
end
function tp1(p89)
    local v90 = game.Players.LocalPlayer
    if v90 and v90.Character and v90.Character:FindFirstChild("HumanoidRootPart") then
        v90.Character:FindFirstChild("HumanoidRootPart").CFrame = p89
    else
        warn("Player\'s character or HumanoidRootPart not found!")
    end
end
function EquipTools(p91)
    if Client.Backpack:FindFirstChild(p91) then
        local v92 = Client.Backpack:FindFirstChild(p91)
        Client.Character.Humanoid:EquipTool(v92)
    end
end
function UnEquipTools(p93)
    if Client.Character:FindFirstChild(p93) then
        wait(0.5)
        Client.Character:FindFirstChild(p93).Parent = Client.LocalPlayer.Backpack
        wait(0.1)
    end
end
local vu94 = {
    "Melee",
    "Sword",
    "Fruit Power"
}
local vu95 = 1
function Attack()
    if _G.Settings.Select_Weapon ~= "Melee" then
        if _G.Settings.Select_Weapon ~= "Sword" then
            if _G.Settings.Select_Weapon ~= "all In One" then
                game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer("FS_" .. _G.Weapon .. "_M1")
            else
                local v96 = vu94[vu95]
                if v96 == "Sword" then
                    addSkill = "SW"
                    delay(0.1, function()
                        game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer("SW_" .. myWeapon.Sword .. "_M1")
                    end)
                elseif v96 == "Melee" then
                    addSkill = "FS"
                    game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer("FS_" .. myWeapon.Melee .. "_M1")
                elseif v96 == "Fruit Power" then
                    addSkill = "FP"
                    game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer("FP_" .. myWeapon["Fruit Power"] .. "_M1")
                end
                EquipTools(myWeapon[v96])
                vu95 = vu95 + 1
                if vu95 > # vu94 then
                    vu95 = 1
                end
            end
        else
            addSkill = "SW"
            game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer("SW_" .. _G.Weapon .. "_M1")
        end
    else
        addSkill = "FS"
        game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer("FS_" .. _G.Weapon .. "_M1")
    end
    if _G.Settings.Select_Weapon ~= "all In One" then
        EquipTools(_G.Weapon)
    end
end
local vu97 = {
    Z = 0,
    X = 0,
    C = 0,
    V = 0,
    B = 0,
    E = 0
}
local function vu104()
    if _G.Settings.Select_Skill then
        local v98 = {
            {
                key = "Z",
                enabled = _G.Settings.SkillZ,
                holdTime = vu97.Z
            },
            {
                key = "X",
                enabled = _G.Settings.SkillX,
                holdTime = vu97.X
            },
            {
                key = "C",
                enabled = _G.Settings.SkillC,
                holdTime = vu97.C
            },
            {
                key = "V",
                enabled = _G.Settings.SkillV,
                holdTime = vu97.V
            },
            {
                key = "B",
                enabled = _G.Settings.SkillB,
                holdTime = vu97.B
            },
            {
                key = "E",
                enabled = _G.Settings.SkillE,
                holdTime = vu97.E
            }
        }
        local v99, v100, v101 = ipairs(v98)
        while true do
            local v102
            v101, v102 = v99(v100, v101)
            if v101 == nil then
                break
            end
            if v102.enabled and not vu31.CheckOnCooldown(v102.key) then
                local v103 = game:GetService("VirtualInputManager")
                v103:SendKeyEvent(true, v102.key, false, game)
                wait(v102.holdTime)
                v103:SendKeyEvent(false, v102.key, false, game)
            end
        end
    end
end
local function vu106(p105)
    if p105 then
        game:GetService("GuiService").SelectedObject = p105
        task.wait(0.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Return, false, game)
        task.wait(0.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        task.wait(0.1)
        game:GetService("GuiService").SelectedObject = nil
    else
        warn("Invalid UI path provided to ClickUI")
    end
end
function click(p107)
    for _ = 1, p107 or 3 do
        game:GetService("VirtualUser"):Button1Down(Vector2.new(1, 1))
        game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))
    end
end
function Click(p108)
    for _ = 1, p108 or 3 do
        game:GetService("VirtualUser"):Button1Down(Vector2.new(1, 1))
        game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))
    end
end
function toQuest(p109, p110, p111)
    local v112 = p111 or true
    local v113 = p110 or "QuestLvl"
    local v114 = p109 or (Sea1 and "Elite Pirate" or (Sea3 and "The Squid" or p109))
    local v115 = p110 == 1 and Sea2 and "Elite Pirate" or (p110 == 3 and Sea2 and "The Squid" or v114)
    local v116 = workspace.AllNPC:FindFirstChild(v115)
    if v116 then
        v115 = v116.CFrame
    end
    local v117 = v112 and v115 and Client.Character:FindFirstChild("HumanoidRootPart")
    if v117 then
        v117.CFrame = v115 * CFrame.new(0, 0, - 3)
    end
    local v118 = game.Players.LocalPlayer.Character.HumanoidRootPart
    if v118 then
        v118.Anchored = true
        wait(0.1)
        v118.Anchored = false
    end
    vu:Button1Down(Vector2.new(1, 1))
    vu:Button1Up(Vector2.new(1, 1))
    wait(0.5)
    local v119, v120, v121 = pairs(Client.PlayerGui:GetChildren())
    while true do
        local v122
        v121, v122 = v119(v120, v121)
        if v121 == nil then
            break
        end
        if string.find(v122.Name, v113) then
            local v123 = v122:FindFirstChild("Dialogue")
            if v123 and v123:FindFirstChild("Accept") then
                local v124 = v123.Accept
                if game.PlaceId == 4520749081 or (game.PlaceId == 6381829480 or v112) then
                    v124.Size = UDim2.new(1001, 0, 1001, 0)
                    v124.Text.TextTransparency = 1
                    v124.Position = UDim2.new(0.5, 0, 0.5, 0)
                    v124.AnchorPoint = Vector2.new(0.5, 0.5)
                else
                    local v125, v126, v127 = pairs(v123:GetChildren())
                    while true do
                        local v128
                        v127, v128 = v125(v126, v127)
                        if v127 == nil then
                            break
                        end
                        if string.find(v128.Name, "Quest") or v128.Name == "QuestAccept" then
                            v128.Size = UDim2.new(1001, 0, 1001, 0)
                            v128.Text.TextTransparency = 1
                            v128.Position = UDim2.new(0.5, 0, 0.5, 0)
                            v128.AnchorPoint = Vector2.new(0.5, 0.5)
                        end
                    end
                    if string.find(v122.Text.Text, "Talk") then
                        local v129 = v123:FindFirstChild("QuestAccept")
                        if v129 then
                            v129.Size = UDim2.new(1001, 0, 1001, 0)
                            v129.Text.TextTransparency = 1
                            v129.Position = UDim2.new(0.5, 0, 0.5, 0)
                            v129.AnchorPoint = Vector2.new(0.5, 0.5)
                        end
                    end
                end
                if v124 then
                    v124:Click()
                end
            end
        end
    end
end
function HopServer(p130)
    local v131 = p130 or false
    local vu132 = game:GetService("HttpService")
    local v133 = game.PlaceId
    local vu134 = "https://games.roblox.com/v1/games/" .. v133 .. "/servers/Public?sortOrder=Asc&limit=100"
    local function v136(p135)
        return vu132:JSONDecode((game:HttpGet(vu134 .. (p135 and "&cursor=" .. p135 or ""))))
    end
    local v137 = nil
    repeat
        local v138 = v136(v137)
        local v139 = v138.data[1]
        v137 = v138.nextPageCursor
    until v139
    while true do
        if v131 then
            if request then
                local v140 = {}
                local v141 = request({
                    Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)
                }).Body
                local v142 = game:GetService("HttpService"):JSONDecode(v141)
                if v142 and v142.data then
                    local v143 = next
                    local v144 = v142.data
                    local v145 = nil
                    while true do
                        local v146
                        v145, v146 = v143(v144, v145)
                        if v145 == nil then
                            break
                        end
                        if type(v146) == "table" and (tonumber(v146.playing) and (tonumber(v146.maxPlayers) and (v146.playing < v146.maxPlayers and v146.id ~= game.JobId))) then
                            table.insert(v140, 1, v146.id)
                        end
                    end
                end
                if # v140 <= 0 then
                    return "Couldn\'t find a server."
                end
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v140[math.random(1, # v140)], Client)
            end
        else
            game:GetService("TeleportService"):TeleportToPlaceInstance(v133, v139.id, Client)
        end
        wait()
        if game.PlaceId ~= game.PlaceId then
            return
        end
    end
end
function dist(p147, p148, p149)
    local v150 = Client
    if v150 then
        v150 = Client.Character
    end
    local v151 = p148 or v150.HumanoidRootPart.Position
    local v152 = Vector3.new
    local v153 = p147.X
    local v154
    if p149 then
        v154 = false
    else
        v154 = p147.Y
    end
    local v155 = v152(v153, v154, p147.Z)
    local v156 = Vector3.new
    local v157 = v151.X
    local v158
    if p149 then
        v158 = false
    else
        v158 = v151.Y
    end
    return (v155 - v156(v157, v158, v151.Z)).magnitude
end
local vu159 = 0
function seaChest()
    wait(3)
    local function v160()
        if _G.Settings.Monter_Hop or _G.Settings.Auto_Sea31 then
            task.wait(3.5)
            HopServer(false)
        end
    end
    if not workspace.SeaMonster:FindFirstChild("SeaKing") and (not game:GetService("Workspace").SeaMonster:FindFirstChild("HydraSeaKing") and ((function()
        local v161, v162, v163 = ipairs({
            "Legacy Island1",
            "Legacy Island2",
            "Legacy Island3",
            "Legacy Island4"
        })
        while true do
            local v164
            v163, v164 = v161(v162, v163)
            if v163 == nil then
                break
            end
            local v165 = game:GetService("Workspace").Island:FindFirstChild(v164)
            if v165 then
                return v165
            end
        end
        return nil
    end)() or (function()
        local v166, v167, v168 = pairs(workspace:FindFirstChild("Island"):GetChildren())
        while true do
            local v169
            v168, v169 = v166(v167, v168)
            if v168 == nil then
                break
            end
            if v169.Name:match("Sea King") then
                return true
            end
        end
        return false
    end)())) then
        local v170, v171, v172 = ipairs({
            "Legacy Island1",
            "Legacy Island2",
            "Legacy Island3",
            "Legacy Island4"
        })
        while true do
            local v173
            v172, v173 = v170(v171, v172)
            if v172 == nil then
                break
            end
            local v174 = game:GetService("Workspace").Island:FindFirstChild(v173)
            if v174 then
                tp({
                    Target = v174.ChestSpawner.CFrame
                })
                Client.PlayerStats.beli.Value = Client.PlayerStats.beli.Value + 50
                wait(3)
                if dist(v174.ChestSpawner.Position, Client.Character.HumanoidRootPart.Position) < 10 and Client.PlayerStats.beli.Value > vu159 + 1 then
                    print(vu159, " : ", Client.PlayerStats.beli.Value)
                    v160()
                end
            end
        end
        local v175, v176, v177 = pairs(workspace:FindFirstChild("Island"):GetChildren())
        while true do
            local v178
            v177, v178 = v175(v176, v177)
            if v177 == nil then
                break
            end
            if v178.Name:match("Sea King") then
                tp({
                    Target = v178.HydraStand.CFrame
                })
            end
        end
    end
end
local function vu189(...)
    local v179 = {
        ...
    }
    local v180 = v179[1]
    local v181 = nil
    if type(v180) ~= "vector" then
        if type(v180) ~= "userdata" then
            if type(v180) == "number" then
                v181 = CFrame.new(unpack(v179)).p
            end
        else
            v181 = v180.Position
        end
    else
        v181 = v180
    end
    local v182 = math.huge
    local v183, v184, v185 = pairs(workspace.Island:GetChildren())
    local v186 = nil
    while true do
        local v187
        v185, v187 = v183(v184, v185)
        if v185 == nil then
            break
        end
        if v187:IsA("Model") then
            local v188 = (v181 - v187:GetModelCFrame().p).Magnitude
            if v188 < v182 then
                v186 = v187.Name
                v182 = v188
            end
        end
    end
    if v186 then
        return v186
    end
end
local vu190 = {}
local function vu197(p191)
    local v192, v193, v194 = pairs(workspace.AllNPC:GetChildren())
    while true do
        local v195
        v194, v195 = v192(v193, v194)
        if v194 == nil then
            break
        end
        local v196 = vu189(v195.CFrame)
        if v196 == vu189(p191) then
            if not vu190[v196] then
                vu190[v196] = {}
            end
            table.insert(vu190[v196], v195.CFrame)
        end
    end
end
local vu198 = {}
function adjustPosition(p199, p200)
    local v201 = _G.Disfarm or 7.5
    return p199 * (({
        Above = CFrame.new(0, v201, 0),
        Beside = CFrame.new(v201, 0, 0),
        Lower = CFrame.new(0, - v201, 0)
    })[p200] or CFrame.new())
end
function getTargetPosition(p202, p203)
    local v204 = p202:FindFirstChild("HumanoidRootPart")
    if v204 then
        local v205 = v204.Position
        local v206 = v205 + (({
            Above = Vector3.new(0, _G.Disfarm or 7.5, 0),
            Beside = Vector3.new(_G.Disfarm or 7.5, 0, 0),
            Lower = Vector3.new(0, - (_G.Disfarm or 7.5), 0)
        })[p203] or Vector3.new())
        if p203 == "Beside" or p203 == "Lower" then
            return CFrame.new(v206, v205)
        else
            return CFrame.new(v206)
        end
    else
        return nil
    end
end
function vu198.Bring(p207, p208)
    if _G.Settings.Bring_Nearest_Mobs_Together then
        local v209, v210, v211 = pairs(workspace.Monster.Mon:GetChildren())
        while true do
            local v212
            v211, v212 = v209(v210, v211)
            if v211 == nil then
                break
            end
            local v213 = v212:FindFirstChild("Humanoid")
            local v214 = v212:FindFirstChild("HumanoidRootPart")
            if v212.Name == p207.Name and (v213 and (v213.Health > 0 and v214)) then
                v214.CFrame = p208
                v213.PlatformStand = true
                v213:ChangeState(11)
                v213:ChangeState(14)
                setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
            end
        end
    end
end
function vu198.attack(p215, pu216, _)
    local vu217 = GetQuestData()
    local v218, v219
    if Sea2 then
        v218 = game:GetService("Workspace").SeaMonster:GetChildren()
        v219 = game.Workspace:FindFirstChild("GhostMonster") and (game.Workspace.GhostMonster:GetChildren() or {}) or {}
    elseif Sea3 then
        v218 = game:GetService("Workspace").SeaMonster:GetChildren()
        v219 = {}
    else
        v218 = game:GetService("ReplicatedStorage").MOB:GetChildren()
        v219 = game:GetService("ReplicatedStorage").MOB:GetChildren()
    end
    local function vu223(p220)
        if p220 and (p220:FindFirstChild("Humanoid") and p220:FindFirstChild("HumanoidRootPart")) then
            local v221 = math.floor(p220.Humanoid.Health / p220.Humanoid.MaxHealth * 100)
            local v222 = p220.Humanoid.Health > 0 and "Alive" or "Dead"
            _G.LabelAutoFarm = string.format("Farming: %s", p220.Name)
            _G.Questname = string.format("Quest: %s", vu217.QuestTitle)
            _G.LabelHealth = string.format("Status: %s | Health: %d%%", v222, v221)
        else
            _G.LabelAutoFarm = "No target detected."
        end
    end
    local function v228(pu224)
        if not (_G.Settings[pu216] and pu224.Parent) then
            return
        end
        while true do
            task.wait()
            if pu224:FindFirstChild("Humanoid") and pu224:FindFirstChild("HumanoidRootPart") then
                local v225 = pu224.Humanoid.Health
                local v226 = pu224.HumanoidRootPart.Position.Y
                vu223(pu224)
                if 0 < v225 and (- 100 < v226 and v226 < 1500) then
                    tp({
                        Target = getTargetPosition(pu224, _G.Settings.PositionFarm),
                        Mod = _G.Settings.PositionFarm == "Above" and CFrame.Angles(math.rad(- 90), 0, 0) or CFrame.new()
                    })
                    task.spawn(function()
                        Attack()
                        getgenv().PosMonSkill = pu224.HumanoidRootPart
                        vu104()
                    end)
                    if not pu224:FindFirstChild("Next") then
                        vu198.Bring(pu224, pu224.HumanoidRootPart.CFrame)
                        local vu227 = Instance.new("Folder", pu224)
                        vu227.Name = "Next"
                        task.delay(1, function()
                            vu227:Destroy()
                        end)
                    end
                end
            end
            if pu224.Humanoid.Health <= 0 or not (pu224.Parent and _G.Settings[pu216]) then
                return
            end
        end
    end
    local v229, v230, v231 = ipairs({
        workspace.Monster.Boss:GetChildren(),
        workspace.Monster.Mon:GetChildren(),
        game:GetService("Workspace").SeaMonster:GetChildren(),
        v219,
        v218,
        game:GetService("ReplicatedStorage").MOB:GetChildren()
    })
    while true do
        local v232
        v231, v232 = v229(v230, v231)
        if v231 == nil then
            break
        end
        local v233, v234, v235 = ipairs(v232)
        while true do
            local v236
            v235, v236 = v233(v234, v235)
            if v235 == nil then
                break
            end
            if table.find(p215, v236.Name) then
                v228(v236)
            elseif v236:FindFirstChild("Humanoid") and (v236:FindFirstChild("HumanoidRootPart") and v236.Humanoid.Health > 0) then
                tp({
                    Target = v236.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0)
                })
            end
        end
    end
end
function vu198.find(pu237)
    local v238, v239
    if Sea2 then
        v238 = game:GetService("Workspace").SeaMonster:GetChildren()
        v239 = game.Workspace:FindFirstChild("GhostMonster"):GetChildren()
    elseif Sea3 then
        v238 = game:GetService("Workspace").SeaMonster:GetChildren()
        v239 = game:GetService("ReplicatedStorage").MOB:GetChildren()
    else
        v238 = game:GetService("ReplicatedStorage").MOB:GetChildren()
        v239 = game:GetService("ReplicatedStorage").MOB:GetChildren()
    end
    local function vu242(p240)
        local v241 = p240:FindFirstChild("Humanoid")
        if v241 then
            v241 = p240.Humanoid.Health > 0
        end
        return v241
    end
    local function v248(p243)
        local v244, v245, v246 = pairs(p243)
        while true do
            local v247
            v246, v247 = v244(v245, v246)
            if v246 == nil then
                break
            end
            if table.find(pu237, v247.Name) and vu242(v247) then
                return true
            end
        end
        return false
    end
    return v248(workspace.Monster.Mon:GetChildren()) or (v248(workspace.Monster.Boss:GetChildren()) or (v248(v239) or v248(v238)) or v248(game:GetService("ReplicatedStorage").MOB:GetChildren()) or (v248(workspace.Monster.Mon:GetChildren()) or v248(workspace.Monster.Boss:GetChildren())))
end
function vu198.attackMon(pu249, pu250, _)
    local vu251 = Client.PlayerGui.MainGui.QuestFrame.QuestBoard
    local v252, v253
    if Sea2 or Sea3 then
        v252 = game:GetService("Workspace").SeaMonster:GetChildren()
        v253 = game.Workspace:FindFirstChild("GhostMonster"):GetChildren()
    else
        v252 = game:GetService("ReplicatedStorage").MOB:GetChildren()
        v253 = game:GetService("ReplicatedStorage").MOB:GetChildren()
    end
    local function vu254()
        return _G.Settings[pu250] ~= nil
    end
    local function vu257(p255)
        local v256 = p255:FindFirstChild("Humanoid") and p255:FindFirstChild("HumanoidRootPart")
        if v256 then
            v256 = p255.Humanoid.Health > 0 and (p255.HumanoidRootPart.Position.Y > - 100 and p255.HumanoidRootPart.Position.Y < 1500)
        end
        return v256
    end
    local function vu259(pu258)
        while true do
            task.wait()
            if vu257(pu258) then
                tp({
                    Target = getTargetPosition(pu258, _G.Settings.PositionFarm),
                    Mod = _G.Settings.PositionFarm == "Above" and CFrame.Angles(math.rad(- 90), 0, 0) or CFrame.new()
                })
                task.spawn(function()
                    Attack()
                    getgenv().PosMonSkill = pu258.HumanoidRootPart
                    vu104()
                end)
            end
            if not vu254() or pu250 == "Auto_Farm_Level1" and not (vu251.Visible and vu251.TextFrame.QuestCount.Text:find(pu258.Name:gsub("%[Lv%.%s*%d+%]", ""))) or (not pu258.Parent or (pu258.Humanoid.Health <= 0 or (not pu258:FindFirstChild("HumanoidRootPart") or (pu258.HumanoidRootPart.Position.Y < - 100 or pu258.HumanoidRootPart.Position.Y > 1500)))) then
                return
            end
        end
    end;
    (function(p260)
        local v261, v262, v263 = ipairs(p260)
        while true do
            local v264
            v263, v264 = v261(v262, v263)
            if v263 == nil then
                break
            end
            local v265, v266, v267 = ipairs(v264)
            while true do
                local v268
                v267, v268 = v265(v266, v267)
                if v267 == nil then
                    break
                end
                if table.find(pu249, v268.Name) and vu254() then
                    if vu257(v268) then
                        vu259(v268)
                    elseif v264 == game:GetService("ReplicatedStorage").MOB:GetChildren() then
                        Tp(v268.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0))
                    end
                end
            end
        end
    end)({
        workspace.Monster.Boss:GetChildren(),
        workspace.Monster.Mon:GetChildren(),
        v253,
        v252,
        game:GetService("ReplicatedStorage").MOB:GetChildren()
    })
end
function vu198.find(pu269)
    local v270, v271
    if Sea2 then
        v270 = game:GetService("Workspace").SeaMonster:GetChildren()
        v271 = game.Workspace:FindFirstChild("GhostMonster"):GetChildren()
    elseif Sea3 then
        v270 = game:GetService("Workspace").SeaMonster:GetChildren()
        v271 = game:GetService("ReplicatedStorage").MOB:GetChildren()
    else
        v270 = game:GetService("ReplicatedStorage").MOB:GetChildren()
        v271 = game:GetService("ReplicatedStorage").MOB:GetChildren()
    end
    local function vu274(p272)
        local v273 = p272:FindFirstChild("Humanoid")
        if v273 then
            v273 = p272.Humanoid.Health > 0
        end
        return v273
    end
    local function v280(p275)
        local v276, v277, v278 = pairs(p275)
        while true do
            local v279
            v278, v279 = v276(v277, v278)
            if v278 == nil then
                break
            end
            if table.find(pu269, v279.Name) and vu274(v279) then
                return true
            end
        end
        return false
    end
    return v280(workspace.Monster.Mon:GetChildren()) or (v280(workspace.Monster.Boss:GetChildren()) or (v280(v271) or v280(v270)) or v280(game:GetService("ReplicatedStorage").MOB:GetChildren()) or (v280(workspace.Monster.Mon:GetChildren()) or v280(workspace.Monster.Boss:GetChildren())))
end
function loadIslandForAllNPCs(p281, p282)
    local v283 = vu190[p281]
    if not _G.Settings.Auto_Farm_Level1 or vu198.find({
        p282
    }) then
        return "Entity Spawn"
    end
    if not v283 or # v283 <= 0 then
        return "No NPCs found on island: " .. p281
    end
    local v284, v285, v286 = pairs(v283)
    while true do
        local v287
        v286, v287 = v284(v285, v286)
        if v286 == nil or (not _G.Settings.Auto_Farm_Level1 or vu198.find({
            p282
        })) then
            break
        end
        Client.Character.HumanoidRootPart.CFrame = v287 * CFrame.new(0, 50, - math.random(5, 10))
        wait(0.5)
    end
    return "Loaded all NPC positions on island: " .. p281
end
local function vu294(p288, p289)
    if p288.LevelRequired ~= 3750 then
        if p288.LevelRequired ~= 3775 then
            if p288.LevelRequired ~= 4750 then
                vu197(p289)
                loadIslandForAllNPCs(vu189(p289), p288.Mob)
            else
                local v290 = tp
                local v291 = {
                    Target = workspace.Island["Forgotten Coliseum"].Vacuus.Base:GetChildren()[179].CFrame * CFrame.new(0, 20, 0)
                }
                v290(v291)
            end
        else
            local v292 = tp
            local v293 = {
                Target = workspace.Island["H - Fiore"].Italian.Base.Mountain.Model:GetChildren()[9].CFrame * CFrame.new(0, 20, 0)
            }
            v292(v293)
        end
    else
        tp({
            Target = workspace.Island["H - Fiore"].Lab.Lab.Base.CFrame * CFrame.new(0, 20, 0)
        })
    end
end
local vu295 = {}
local vu296 = nil
GetQuestData()
function vu295.Auto_Farm_Level1()
    local vu297 = "Auto_Farm_Level1"
    while _G.Settings[vu297] and task.wait() do
        local v302, v303 = pcall(function()
            local v298 = GetQuestData()
            local v299 = v298.NPC.CFrame
            if Client.CurrentQuest.Value ~= v298.QuestTitle or Client.CurrentQuest.Value == "" then
                tp({
                    Target = v299
                })
                Repli:WaitForChild("Chest").Remotes.Functions.Quest:InvokeServer("take", v298.QuestTitle)
            elseif Client.CurrentQuest.Value == v298.QuestTitle then
                if v298.Mob ~= "Dough Master [Lv. 3275]" or v298.LevelRequired ~= 3275 then
                    local v300 = Repli.MOB:FindFirstChild(v298.Mob)
                    if v300 then
                        tp({
                            Target = v300:GetModelCFrame() * CFrame.new(0, 20, 0)
                        })
                    elseif v298.LevelRequired < 3265 or vu296 ~= nil then
                        local v301 = {
                            Target = vu296 or v299
                        }
                        tp(v301)
                    else
                        vu294(v298, v299)
                    end
                else
                    tp({
                        Target = CFrame.new(30279.0625, 69.36441802978516, 93166.2734375)
                    })
                end
                if vu198.find({
                    v298.Mob
                }) then
                    delay(0.5, function()
                        vu296 = nil
                    end)
                    vu198.attack({
                        v298.Mob
                    }, vu297)
                    delay(0.5, function()
                        vu296 = Client.Character.HumanoidRootPart.CFrame
                    end)
                end
            end
        end)
        if not v302 then
            warn(v303, ": " .. vu297)
        end
    end
end
local vu304 = {}
function vu295.Auto_Sea21()
    local vu305 = "Auto_Sea21"
    while _G.Settings[vu305] and task.wait() do
        local v308, v309 = pcall(function()
            if Sea1 and (Client.PlayerStats.lvl.Value >= 2250 and Client.PlayerStats.lvl.Value < 4000) then
                if _G.Settings.Auto_Farm_Level1 then
                    _G.Settings.Auto_Farm_Level1 = false
                end
                if Client.PlayerStats.SecondSeaProgression.Value ~= "Yes" then
                    if getPlayerMaterial("Map") <= 0 then
                        if GUI.MainGui.QuestFrame.QuestBoard.Visible then
                            if Repli.MOB:FindFirstChild("Seasoned Fishman [Lv. 2200]") then
                                local v306 = tp
                                local v307 = {
                                    Target = Repli.MOB:FindFirstChild("Seasoned Fishman [Lv. 2200]"):GetPivot()
                                }
                                v306(v307)
                            else
                                tp({
                                    Target = CFrame.new(- 1865.43481, 45.2696266, 6722.8501, 0.965929627, 0, - 0.258804798, 0, 1, 0, 0.258804798, 0, 0.965929627)
                                })
                            end
                            if vu198.find({
                                "Seasoned Fishman [Lv. 2200]"
                            }) then
                                vu198.attack({
                                    "Seasoned Fishman [Lv. 2200]"
                                }, vu305)
                            end
                        else
                            toQuest(workspace.AllNPC.Traveler.CFrame)
                            wait(0.5)
                            tp({
                                Target = workspace.AllNPC.Traveler.CFrame * CFrame.new(0, 0, - 10)
                            })
                        end
                    else
                        toQuest(workspace.AllNPC.Traveler.CFrame)
                        wait(0.5)
                        tp({
                            Target = workspace.AllNPC.Traveler.CFrame * CFrame.new(0, 0, - 10)
                        })
                    end
                else
                    toQuest(vu304["Teleport To Sea 2"], 2)
                end
            end
        end)
        if not v308 then
            warn(v309, ": " .. vu305)
        end
    end
end
function vu295.Auto_Sea31()
    local vu310 = "Auto_Sea31"
    while _G.Settings[vu310] and task.wait() do
        local v322, v323 = pcall(function()
            if Client.PlayerStats.lvl.Value >= 4000 and not Sea3 then
                if _G.Settings.Auto_Farm_Level1 then
                    _G.Settings.Auto_Farm_Level1 = false
                end
                if getPlayerMaterial("Kraken\'s Cache") <= 0 then
                    if vu198.find({
                        "Tentacle"
                    }) then
                        vu198.attackMon({
                            "Tentacle"
                        }, vu310, 10)
                    elseif getPlayerMaterial("Heart of Sea") <= 0 then
                        if getPlayerMaterial("Kraken\'s Cache") > 0 then
                            return
                        end
                        if not vu198.find({
                            "Tentacle"
                        }) then
                            local v311 = {
                                Log = 50,
                                ["Pile of Bones"] = 10,
                                ["Fresh Fish"] = 50,
                                ["Angellic\'s Feather"] = 14,
                                ["Sea King\'s Blood"] = 1
                            }
                            local v312 = {
                                Sea1 = workspace.AllNPC:FindFirstChild("Elite Pirate").CFrame,
                                Sea2 = workspace.AllNPC:FindFirstChild("Elite Pirate").CFrame
                            }
                            if getPlayerMaterial("Log") >= v311.Log then
                                if getPlayerMaterial("Pile of Bones") >= v311["Pile of Bones"] then
                                    if getPlayerMaterial("Fresh Fish") >= v311["Fresh Fish"] then
                                        if getPlayerMaterial("Angellic\'s Feather") >= v311["Angellic\'s Feather"] then
                                            if getPlayerMaterial("Sea King\'s Blood") >= v311["Sea King\'s Blood"] then
                                                if Sea2 then
                                                    toQuest(workspace.AllNPC:FindFirstChild("Jack Stones").CFrame)
                                                    local v313, v314, v315 = pairs(Client.PlayerGui:GetChildren())
                                                    while true do
                                                        local v316
                                                        v315, v316 = v313(v314, v315)
                                                        if v315 == nil then
                                                            break
                                                        end
                                                        if v316.Name == "CraftingMaterialUI" then
                                                            if v316:FindFirstChild("Frame") and v316.Frame.OrbName.Text ~= "Heart of Sea" then
                                                                v316.Frame.Materials.AnchorPoint = Vector2.new(0, 0)
                                                                v316.Frame.Materials.Position = UDim2.new(0, 0, 0, 0)
                                                                v316.Frame.Materials.Visible = true
                                                                if v316.Frame.Materials:FindFirstChild("ScrollingFrame") then
                                                                    v316.Frame.Materials:FindFirstChild("ScrollingFrame").ClipsDescendants = false
                                                                    if v316.Frame.Materials:FindFirstChild("ScrollingFrame"):FindFirstChild("UIGridLayout") then
                                                                        v316.Frame.Materials:FindFirstChild("ScrollingFrame"):FindFirstChild("UIGridLayout").CellSize = UDim2.new(1001, 0, 1001, 0)
                                                                    end
                                                                    if v316.Frame.Materials:FindFirstChild("ScrollingFrame"):FindFirstChild("Diamond Key") then
                                                                        v316.Frame.Materials:FindFirstChild("ScrollingFrame"):FindFirstChild("Diamond Key").Visible = false
                                                                    end
                                                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1, 1))
                                                                    game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))
                                                                end
                                                            elseif v316.Frame.OrbName.Text == "Heart of Sea" then
                                                                v316.Frame.CraftButton.Size = UDim2.new(1001, 0, 1001, 0)
                                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1, 1))
                                                                game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))
                                                            end
                                                        end
                                                    end
                                                else
                                                    toQuest(v312.Sea2)
                                                end
                                            elseif Sea2 then
                                                warn("Sea King\'s Blood Not Have")
                                                if vu198.find({
                                                    "SeaKing",
                                                    "HydraSeaKing"
                                                }) then
                                                    vu198.attack({
                                                        "SeaKing",
                                                        "HydraSeaKing"
                                                    }, vu310)
                                                else
                                                    seaChest()
                                                end
                                            else
                                                toQuest(v312.Sea2)
                                            end
                                        elseif Sea1 then
                                            if vu198.find({
                                                "Sky Soldier [Lv. 800]",
                                                "Ball Man [Lv. 850]"
                                            }) then
                                                vu198.attack({
                                                    "Sky Soldier [Lv. 800]",
                                                    "Ball Man [Lv. 850]"
                                                }, vu310)
                                            else
                                                tp({
                                                    Target = workspace.Island["H - Skyland"].Sky.Base:GetChildren()[4].CFrame
                                                })
                                            end
                                        else
                                            toQuest(v312.Sea1)
                                        end
                                    elseif Sea1 then
                                        if vu198.find({
                                            "Karate Fishman [Lv. 200]",
                                            "Fighter Fishman [Lv. 180]",
                                            "Shark Man [Lv. 230]"
                                        }) then
                                            vu198.attack({
                                                "Karate Fishman [Lv. 200]",
                                                "Fighter Fishman [Lv. 180]",
                                                "Shark Man [Lv. 230]"
                                            }, vu310)
                                        else
                                            tp({
                                                Target = workspace.Island["D - Shark Island"].D.Base:GetChildren()[57].CFrame
                                            })
                                        end
                                    else
                                        toQuest(v312.Sea1)
                                    end
                                elseif Sea2 then
                                    if vu198.find({
                                        "Skull Pirate [Lv. 3050]"
                                    }) then
                                        vu198.attack({
                                            "Skull Pirate [Lv. 3050]"
                                        }, vu310)
                                    else
                                        tp({
                                            Target = CFrame.new(- 5996.76953125, 462.4600524902344, 7296.43115234375) * CFrame.new(0, - 50, 0)
                                        })
                                    end
                                else
                                    toQuest(v312.Sea2)
                                end
                            else
                                if not Sea2 then
                                    toQuest(v312.Sea2)
                                    return
                                end
                                local v317, v318, v319 = pairs(game:GetService("Workspace"):GetDescendants())
                                while true do
                                    local v320
                                    v319, v320 = v317(v318, v319)
                                    if v319 == nil then
                                        break
                                    end
                                    if string.find(v320.Name, "Tree") and (v320:FindFirstChild("Part") and v320.Part.Transparency == 0) then
                                        task.wait(1.5)
                                        if _G.Settings[vu310] or (getPlayerMaterial("Log") <= v311.Log or not vu198.find({
                                            "Tentacle"
                                        })) then
                                            while true do
                                                wait()
                                                local v321 = {
                                                    Target = v320:GetModelCFrame()
                                                }
                                                tp(v321)
                                                if not (Client.Backpack:FindFirstChild("Bisento") or Client.Character:FindFirstChild("Bisento")) then
                                                    game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("InventoryEq"):InvokeServer(unpack({
                                                        "Bisento"
                                                    }))
                                                end
                                                EquipTools("Bisento")
                                                if not (vu31.CheckOnCooldown("Z") and vu31.CheckOnCooldown("X")) then
                                                    game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                                                    game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                                                    game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                                    game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                                                end
                                                if not _G.Settings[vu310] or (vu31.CheckOnCooldown("Z") or (vu31.CheckOnCooldown("X") or (vu198.find({
                                                    "Tentacle"
                                                }) or getPlayerMaterial("Kraken\'s Cache") > 0))) then
                                                end
                                            end
                                        end
                                    end
                                    if not _G.Settings[vu310] or (getPlayerMaterial("Log") >= v311.Log or (vu198.find({
                                        "Tentacle"
                                    }) or getPlayerMaterial("Kraken\'s Cache") > 0)) then
                                        break
                                    end
                                end
                            end
                        end
                    elseif Client.PlayerGui:FindFirstChild("CraftingMaterialUI") then
                        Client.PlayerGui:FindFirstChild("CraftingMaterialUI"):Destroy()
                        Client.Character.Humanoid:ChangeState(15)
                    else
                        toQuest(workspace.AllNPC:FindFirstChild("Summon Tentacle").CFrame)
                    end
                else
                    toQuest(workspace.AllNPC:FindFirstChild("The Squid").CFrame)
                    wait(0.5)
                    tp({
                        Target = workspace.AllNPC:FindFirstChild("The Squid").CFrame * CFrame.new(0, 10, - 10)
                    })
                end
            end
        end)
        if not v322 then
            warn(v323, ": " .. vu310)
        end
    end
end
local vu324 = {}
function vu295.Auto_Kill_Minion1()
    local vu325 = "Auto_Kill_Minion1"
    while _G.Settings[vu325] and task.wait() do
        local v340, v341 = pcall(function()
            local v326 = workspace.EventSpawns:GetChildren()
            local v327, v328, v329 = pairs(v326)
            local v330 = false
            while true do
                local v331
                v329, v331 = v327(v328, v329)
                if v329 == nil then
                    break
                end
                if v331.Name == "Spawn" and v331:FindFirstChild("Chest") then
                    local v332 = v331.Chest.RootPart.CFrame
                    if not vu324[v332] then
                        vu324[v332] = true
                        tp({
                            Target = v332
                        })
                        for v333 = 1, 7 do
                            local v334 = "Chest" .. v333
                            local vu335 = game:GetService("Workspace"):FindFirstChild(v334)
                            if vu335 then
                                pcall(function()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = vu335.RootPart.CFrame
                                end)
                            end
                        end
                    end
                end
                if vu198.find({
                    "Minion",
                    "Boss"
                }) then
                    vu198.attack({
                        "Minion",
                        "Boss"
                    }, vu325)
                    v330 = true
                    break
                end
            end
            if not v330 then
                local v336, v337, v338 = pairs(v326)
                while true do
                    local vu339
                    v338, vu339 = v336(v337, v338)
                    if v338 == nil then
                        break
                    end
                    if vu339.Name == "Spawn" then
                        pcall(function()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = vu339.CFrame
                        end)
                        task.wait(1)
                        if vu198.find({
                            "Minion",
                            "Boss"
                        }) then
                            vu198.attack({
                                "Minion",
                                "Boss"
                            }, vu325)
                            break
                        end
                    end
                end
            end
        end)
        if not v340 then
            warn(v341, ": " .. vu325)
        end
    end
end
function vu295.Auto_Farm_Nearest_Mob()
    local vu342 = "Auto_Farm_Nearest_Mob"
    while _G.Settings[vu342] and task.wait() do
        local v349, v350 = pcall(function()
            local v343, v344, v345 = pairs(game:GetService("Workspace").Monster.Mon:GetChildren())
            while true do
                local v346
                v345, v346 = v343(v344, v345)
                if v345 == nil then
                    break
                end
                local v347 = v346:FindFirstChild("Humanoid")
                local v348 = v346:FindFirstChild("HumanoidRootPart")
                if v347 and (v348 and (v347.Health > 0 and ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v348.Position).Magnitude <= 1000 and vu198.find({
                    v346.Name
                })))) then
                    vu198.attack({
                        v346.Name
                    }, vu342)
                end
            end
        end)
        if not v349 then
            warn(v350, ": " .. vu342)
        end
    end
end
function vu295.Auto_Kill_Sea_King1()
    local vu351 = "Auto_Kill_Sea_King1"
    while _G.Settings[vu351] and task.wait() do
        local v352, v353 = pcall(function()
            if vu198.find({
                "SeaKing"
            }) then
                vu198.attack({
                    "SeaKing"
                }, vu351)
            else
                seaChest()
            end
        end)
        if not v352 then
            warn(v353, ": " .. vu351)
        end
    end
end
function vu295.Auto_Kill_GhostMonster1()
    local vu354 = "Auto_Kill_GhostMonster1"
    while _G.Settings[vu354] and task.wait() do
        local v359, v360 = pcall(function()
            if vu198.find({
                "Ghost Ship"
            }) then
                vu159 = Client.PlayerStats.beli.Value
                vu198.attack({
                    "Ghost Ship"
                }, vu354)
            else
                local v355, v356, v357 = pairs(game.Workspace:GetChildren())
                while true do
                    local v358
                    v357, v358 = v355(v356, v357)
                    if v357 == nil then
                        break
                    end
                    if v358.Name:match("Chest") and (v358.PrimaryPart and (cheatKey[v358.PrimaryPart.CFrame] == false or cheatKey[v358.PrimaryPart.CFrame] == nil)) then
                        Tp(v358.PrimaryPart.CFrame)
                        cheatKey[v358.PrimaryPart.CFrame] = true
                        task.wait(0.3)
                    else
                        cheatKey = {}
                    end
                end
            end
        end)
        if not v359 then
            print("Error in Auto_Kill_GhostMonster1:", v360)
        end
        task.wait()
    end
end
function vu295.Abyssal_Tyrant()
    local vu361 = "Abyssal_Tyrant"
    while _G.Settings[vu361] and task.wait() do
        local v362, v363 = pcall(function()
            if vu198.find({
                "SeaDragon"
            }) then
                vu198.attack({
                    "SeaDragon"
                }, vu361)
            end
        end)
        if not v362 then
            warn(v363, ": " .. vu361)
        end
    end
end
function vu295.Chaos_Kraken()
    local vu364 = "Chaos_Kraken"
    while _G.Settings[vu364] and task.wait() do
        local v365, v366 = pcall(function()
            if vu198.find({
                "FuryTentacle"
            }) then
                vu198.attack({
                    "FuryTentacle"
                }, vu364)
            end
        end)
        if not v365 then
            warn(v366, ": " .. vu364)
        end
    end
end
function vu295.Deepsea_Crusher()
    local vu367 = "Deepsea_Crusher"
    while _G.Settings[vu367] and task.wait() do
        local v368, v369 = pcall(function()
            if vu198.find({
                "ThirdSeaEldritch Crab"
            }) then
                vu198.attack({
                    "ThirdSeaEldritch Crab"
                }, vu367)
            end
        end)
        if not v368 then
            warn(v369, ": " .. vu367)
        end
    end
end
function vu295.auto_draken()
    local vu370 = "auto_draken"
    while _G.Settings[vu370] and task.wait() do
        local v371, v372 = pcall(function()
            if vu198.find({
                "ThirdSeaDragon"
            }) then
                vu198.attack({
                    "ThirdSeaDragon"
                }, vu370)
            end
        end)
        if not v371 then
            warn(v372, ": " .. vu370)
        end
    end
end
function vu295.Auto_Kill_Hydar_Sea_King1()
    local vu373 = "Auto_Kill_Hydar_Sea_King1"
    while _G.Settings[vu373] and task.wait() do
        local v374, v375 = pcall(function()
            if vu198.find({
                "HydraSeaKing"
            }) then
                vu198.attack({
                    "HydraSeaKing"
                }, vu373)
            else
                seaChest()
            end
        end)
        if not v374 then
            warn(v375, ": " .. vu373)
        end
    end
end
function vu295.Auto_Kill_Kaido1()
    local vu376 = "Auto_Kill_Kaido1"
    while _G.Settings[vu376] and task.wait() do
        local v377, v378 = pcall(function()
            if vu198.find({
                "Dragon [Lv. 5000]"
            }) then
                vu198.attack({
                    "Dragon [Lv. 5000]"
                }, vu376)
            elseif getPlayerMaterial("Dragon\'s Orb") <= 0 or not _G.Settings.Auto_Spawn_Kaido then
                if vu198.find({
                    "Elite Skeleton [Lv. 3100]"
                }) then
                    vu198.attack({
                        "Elite Skeleton [Lv. 3100]"
                    }, vu376)
                else
                    tp({
                        Target = CFrame.new(- 5996.76953125, 462.4600524902344, 7296.43115234375) * CFrame.new(0, - 50, 0)
                    })
                end
            else
                toQuest(workspace.AllNPC:FindFirstChild("SummonDragon").CFrame, "SummonDragon")
            end
        end)
        if not v377 then
            warn(v378, ": " .. vu376)
        end
    end
end
function vu295.Auto_Expert_Swordman1()
    local vu379 = "Auto_Expert_Swordman1"
    while _G.Settings[vu379] and task.wait() do
        local v380, v381 = pcall(function()
            if vu198.find({
                "Expert Swordman [Lv. 3000]"
            }) then
                vu198.attack({
                    "Expert Swordman [Lv. 3000]"
                }, vu379)
            end
        end)
        if not v380 then
            warn(v381, ": " .. vu379)
        end
    end
end
function vu295.auto_bushido()
    local vu382 = "auto_bushido"
    while _G.Settings[vu382] and task.wait() do
        local v383, v384 = pcall(function()
            if vu198.find({
                "Bushido Ape [Lv. 5000]"
            }) then
                vu198.attack({
                    "Bushido Ape [Lv. 5000]"
                }, vu382)
            end
        end)
        if not v383 then
            warn(v384, ": " .. vu382)
        end
    end
end
function vu295.auto_lordsaber()
    local vu385 = "auto_lordsaber"
    while _G.Settings[vu385] and task.wait() do
        local v386, v387 = pcall(function()
            if vu198.find({
                "Lord of Saber [Lv. 8500]"
            }) then
                vu198.attack({
                    "Lord of Saber [Lv. 8500]"
                }, vu385)
            end
        end)
        if not v386 then
            warn(v387, ": " .. vu385)
        end
    end
end
function vu295.auto_jacko()
    local vu388 = "auto_jacko"
    while _G.Settings[vu388] and task.wait() do
        local v390, v391 = pcall(function()
            if vu198.find({
                "Jack o lantern [Lv. 10000]"
            }) then
                vu198.attack({
                    "Jack o lantern [Lv. 10000]"
                }, vu388)
            else
                local v389 = (getPlayerMaterial("Candy") > 50 and _G.Settings.auto_jackoo and true or false) and workspace.AllNPC:FindFirstChild("SummonJackolantern")
                if v389 then
                    toQuest(v389.CFrame, "SummonJackolantern")
                end
            end
        end)
        if not v390 then
            warn(v391, ": " .. vu388)
        end
    end
end
function vu295.auto_skull()
    local vu392 = "auto_skull"
    while _G.Settings[vu392] and task.wait() do
        local v393, v394 = pcall(function()
            if vu198.find({
                "Skull King"
            }) then
                vu198.attack({
                    "Skull King"
                }, vu392)
            end
        end)
        if not v393 then
            warn(v394, ": " .. vu392)
        end
    end
end
function vu295.auto_farm_candy()
    local vu395 = "auto_farm_candy"
    while _G.Settings[vu395] and task.wait() do
        local v396, v397 = pcall(function()
            if Sea1 then
                if vu198.find({
                    "Zombie [Lv. 1500]"
                }) then
                    vu198.attack({
                        "Zombie [Lv. 1500]"
                    }, vu395)
                end
            elseif Sea2 then
                if vu198.find({
                    "Elite Skeleton [Lv. 3100]"
                }) then
                    vu198.attack({
                        "Elite Skeleton [Lv. 3100]"
                    }, vu395)
                elseif vu198.find({
                    "Skull Pirate [Lv. 3050]"
                }) then
                    vu198.attack({
                        "Skull Pirate [Lv. 3050]"
                    }, vu395)
                else
                    tp({
                        Target = CFrame.new(- 5996.76953125, 462.4600524902344, 7296.43115234375) * CFrame.new(0, - 50, 0)
                    })
                end
            elseif Sea3 and vu198.find({
                "Wilderness Gorilla [Lv. 4325]"
            }) then
                vu198.attack({
                    "Wilderness Gorilla [Lv. 4325]"
                }, vu395)
            end
        end)
        if not v396 then
            warn(v397, ": " .. vu395)
        end
    end
end
function vu295.auto_third_event()
    funcx = "auto_third_event"
    local v398 = {
        {
            name = "SeaDragon"
        },
        {
            name = "ThirdSeaEldritch Crab"
        },
        {
            name = "ThirdSeaDragon"
        },
        {
            name = "FuryTentacle"
        }
    }
    while _G.Settings[funcx] and task.wait(1) do
        local v399, v400, v401 = ipairs(v398)
        while true do
            local vu402
            v401, vu402 = v399(v400, v401)
            if v401 == nil then
                break
            end
            if _G.Settings[vu402.name] then
                local v403, v404 = pcall(function()
                    vu198.attack({
                        vu402.name
                    }, funcx)
                end)
                if not v403 then
                    warn("Error in " .. funcx .. ": " .. v404)
                end
            end
        end
    end
end
function vu295.goriila()
    local vu405 = "goriila"
    while _G.Settings[vu405] and task.wait() do
        local v406, v407 = pcall(function()
            if vu198.find({
                "Jungle Gorilla [Lv. 4300]"
            }) then
                vu198.attack({
                    "Jungle Gorilla [Lv. 4300]"
                }, vu405)
            end
        end)
        if not v406 then
            warn(v407, ": " .. vu405)
        end
    end
end
function vu295.Auto_Kill_BigMom()
    local vu408 = "Auto_Kill_BigMom"
    while _G.Settings[vu408] and task.wait() do
        local v409, v410 = pcall(function()
            if vu198.find({
                "Ms. Mother [Lv. 7500]"
            }) then
                vu198.attack({
                    "Ms. Mother [Lv. 7500]"
                }, vu408)
            else
                tp(CFrame.new(- 343, 177, 9087))
            end
        end)
        if not v409 then
            warn(v410, ": " .. vu408)
        end
    end
end
function vu295.King_Samurai()
    local vu411 = "King_Samurai"
    while _G.Settings[vu411] and task.wait() do
        local v412, v413 = pcall(function()
            if vu198.find({
                "King Samurai [Lv. 3500]"
            }) then
                vu198.attack({
                    "King Samurai [Lv. 3500]"
                }, vu411)
            end
        end)
        if not v412 then
            warn(v413, ": " .. vu411)
        end
    end
end
function vu295.auto_quake()
    local vu414 = "auto_quake"
    while _G.Settings[vu414] and task.wait() do
        local v415, v416 = pcall(function()
            if vu198.find({
                "Quake Woman [Lv. 1925]"
            }) then
                vu198.attack({
                    "Quake Woman [Lv. 1925]"
                }, vu414)
            end
        end)
        if not v415 then
            warn(v416, ": " .. vu414)
        end
    end
end
function vu295.AUTOOBSERVE2()
    local vu417 = "AUTOOBSERVE2"
    while _G.Settings[vu417] and task.wait() do
        local v418, v419 = pcall(function()
            toQuest(workspace.AllNPC:FindFirstChild("Stranger Uncle").CFrame, "Stranger Uncle")
            if vu198.find({
                "LeePung [Lv. 5000]"
            }) then
                vu198.attack({
                    "LeePung [Lv. 5000]"
                }, vu417)
            else
                toQuest(workspace.AllNPC:FindFirstChild("Stranger Uncle").CFrame, "Stranger Uncle")
            end
            toQuest(workspace.AllNPC:FindFirstChild("Stranger Uncle").CFrame, "Stranger Uncle")
        end)
        if not v418 then
            warn(v419, ": " .. vu417)
        end
    end
end
local vu420 = {
    ["Jack o lantern [Lv. 10000]"] = "Jack o lantern",
    ["King Samurai [Lv. 3500]"] = "King Samurai",
    ["Dragon [Lv. 5000]"] = "Dragon",
    ["Ms. Mother [Lv. 7500]"] = "Ms. Mother",
    ["Lord of Saber [Lv. 8500]"] = "Lord of Saber",
    ["Bushido Ape [Lv. 5000]"] = "Bushido Ape"
}
local function vu422(p421)
    return vu420[p421] or p421
end
function vu295.auto_hop_boss()
    local vu423 = "auto_hop_boss"
    while true do
        if not _G.Settings[vu423] then
            print("Auto-hop disabled. Stopping the function.")
            break
        end
        local v431, v432 = pcall(function()
            local v424 = _G.Settings.selectbosss or {}
            local v425, v426, v427 = pairs(v424)
            local v428 = false
            while true do
                local v429
                v427, v429 = v425(v426, v427)
                if v427 == nil then
                    break
                end
                if vu198.find({
                    v429
                }) then
                    local v430 = vu422(v429)
                    print("Entity found: " .. v430 .. ". Stopping auto-hop.")
                    _G.Settings[vu423] = false
                    v428 = true
                    break
                end
            end
            if not v428 then
                print("No selected entities found. Waiting " .. _G.Settings.HopDelay .. " seconds before hopping...")
                task.wait(_G.Settings.HopDelay)
                HopServer()
            end
        end)
        if not v431 then
            warn(v432, ": " .. vu423)
        end
        if not _G.Settings[vu423] then
            break
        end
    end
end
local vu433 = {
    FuryTentacle = "Chaos Kraken",
    ["ThirdSeaEldritch Crab"] = "Deepsea Crusher",
    ThirdSeaDragon = "Drakenfyr the Inferno King",
    SeaDragon = "Abyssal Tyrant",
    ["Skull King"] = "Skull King",
    ["Ghost Ship"] = "Ghost Ship",
    HydraSeaKing = "Hydra Sea King",
    SeaKing = "Sea King"
}
local function vu435(p434)
    return vu433[p434] or p434
end
function vu295.auto_hop()
    local vu436 = "auto_hop"
    while wait() do
        if not _G.Settings[vu436] then
            print("Auto-hop disabled. Stopping the function.")
            break
        end
        local v444, v445 = pcall(function()
            local v437 = _G.Settings.SelectedEntities or {}
            local v438, v439, v440 = pairs(v437)
            local v441 = false
            while true do
                local v442
                v440, v442 = v438(v439, v440)
                if v440 == nil then
                    break
                end
                if vu198.find({
                    v442
                }) then
                    local v443 = vu435(v442)
                    print("Entity found: " .. v443 .. ". Stopping auto-hop.")
                    _G.Settings[vu436] = false
                    v441 = true
                    break
                end
            end
            if not v441 then
                HopServer()
            end
        end)
        if not v444 then
            warn(v445, ": " .. vu436)
        end
        if not _G.Settings[vu436] then
            break
        end
    end
end
function vu295.auto_hakiv2()
    local vu446 = "auto_hakiv2"
    while _G.Settings[vu446] and task.wait() do
        local v447, v448 = pcall(function()
            if vu198.find({
                "Dark Beard [Lv. 3475]"
            }) then
                vu198.attack({
                    "Dark Beard [Lv. 3475]"
                }, vu446)
            elseif getPlayerMaterial("Dark Beard\'s Totem") <= 0 then
                if vu198.find({
                    "Sally [Lv. 3450]"
                }) then
                    vu198.attack({
                        "Sally [Lv. 3450]"
                    }, vu446)
                else
                    toQuest(workspace.AllNPC:FindFirstChild("Lee").CFrame, "Lee")
                    wait(5)
                    toQuest(workspace.AllNPC:FindFirstChild("Pung").CFrame, "Pung")
                    wait(5)
                    if getPlayerMaterial("Dark Beard\'s Totem") <= 0 and vu198.find({
                        "Sally [Lv. 3450]"
                    }) then
                        vu198.attack({
                            "Sally [Lv. 3450]"
                        }, vu446)
                    end
                    if getPlayerMaterial("Dark Beard\'s Totem") > 0 then
                        game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("EtcFunction"):InvokeServer(unpack(args))
                    end
                end
            else
                game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("EtcFunction"):InvokeServer(unpack({
                    "QuestSpawnBoss",
                    {
                        SuccessQuest = "Quest Accepted.",
                        BossName = "Dark Beard [Lv. 3475]",
                        LevelNeed = 3475,
                        QuestName = "Kill 1 Dark Beard",
                        MaterialNeed = "Dark Beard\'s Totem",
                        AI_Name = "Dark Beard",
                        LevelLow = "You must be Level 3,475 to accept this quest."
                    }
                }))
            end
        end)
        if not v447 then
            warn(v448, ": " .. vu446)
        end
    end
end
function MaterialMon()
    if SelectMaterial ~= "Rusted Scrap" then
        if SelectMaterial ~= "Iron Ingot" then
            if SelectMaterial ~= "Leather" then
                if SelectMaterial ~= "Angellic\'s Feather" then
                    if SelectMaterial ~= "Carrot" then
                        if SelectMaterial ~= "Gun Powder" then
                            if SelectMaterial ~= "Fresh Fish" then
                                if SelectMaterial ~= "Undead Ooze" then
                                    if SelectMaterial ~= "Shark Canine" then
                                        if SelectMaterial ~= "Bread Crumps" then
                                            if SelectMaterial ~= "Pile of Bones" then
                                                if SelectMaterial ~= "Thief\'s Rag" then
                                                    if SelectMaterial ~= "Dragon Orb" then
                                                        if SelectMaterial ~= "Lucidu\'s Totem" then
                                                            if SelectMaterial ~= "Dark Beard Totem" then
                                                                if SelectMaterial ~= "Magma Crystal" then
                                                                    if SelectMaterial ~= "Ice Crystals" then
                                                                        if SelectMaterial ~= "Samurai Bandage" then
                                                                            if SelectMaterial ~= "Lost Ruby" then
                                                                                if SelectMaterial ~= "Essence of Fire" then
                                                                                    if SelectMaterial ~= "Twilight Orb" then
                                                                                        if SelectMaterial ~= "Vital Fluid" then
                                                                                            if SelectMaterial ~= "Coral and Pearl" then
                                                                                                if SelectMaterial ~= "Shark Fin" then
                                                                                                    if SelectMaterial == "Diverse Sphere" then
                                                                                                        MMon = "Gazelle Man [Lv. 2350]"
                                                                                                    end
                                                                                                else
                                                                                                    MMon = "Fishman Guardian [Lv. 4150]"
                                                                                                end
                                                                                            else
                                                                                                MMon = "Fugitive [Lv. 4050]"
                                                                                            end
                                                                                        else
                                                                                            MMon = "Shadow Master [Lv. 1650]"
                                                                                        end
                                                                                    else
                                                                                        MMon = "Shadow Master [Lv. 1600]"
                                                                                    end
                                                                                else
                                                                                    MMon = "Flame User [Lv. 3200]"
                                                                                end
                                                                            else
                                                                                MMon = "Anubis [Lv. 3150]"
                                                                            end
                                                                        else
                                                                            MMon = "Kitsune Samurai [Lv. 2650]"
                                                                        end
                                                                    else
                                                                        MMon = "Azlan [Lv. 3300]"
                                                                    end
                                                                else
                                                                    MMon = "The Volcano [Lv. 3325]"
                                                                end
                                                            else
                                                                MMon = "Dark Beard Servant [Lv. 3400]"
                                                            end
                                                        else
                                                            MMon = "Vice Admiral [Lv. 3500]"
                                                        end
                                                    else
                                                        MMon = "Elite Skeleton [Lv. 3100]"
                                                    end
                                                else
                                                    MMon = "Desert Thief [Lv. 3125]"
                                                end
                                            else
                                                MMon = "Skull Pirate [Lv. 3050]"
                                            end
                                        else
                                            MMon = "Chess Soldier [Lv. 3200]"
                                        end
                                    else
                                        MMon = "Seasoned Fishman [Lv. 2200]"
                                    end
                                elseif Sea1 then
                                    MMon = "Zombie [Lv. 1500]"
                                elseif Sea2 then
                                    MMon = "Sally [Lv. 3450]"
                                end
                            else
                                MMon = "Karate Fishman [Lv. 200]"
                            end
                        elseif Sea1 then
                            MMon = "Ball Man [Lv. 850]"
                        elseif Sea2 then
                            MMon = "Lomeo [Lv. 3675]"
                        end
                    else
                        MMon = "Beast Swordman [Lv. 2300]"
                    end
                else
                    MMon = "Sky Soldier [Lv. 800]"
                end
            elseif Sea1 then
                MMon = "Commander [Lv. 100]"
            elseif Sea2 then
                MMon = "Duke [Lv. 2550]"
            end
        else
            MMon = "Beast Pirate [Lv. 2250]"
        end
    elseif Sea1 then
        MMon = "Elite Soldier [Lv. 1000]"
    elseif Sea2 then
        MMon = "Beast Swordman [Lv. 2300]"
    end
end
if Sea1 then
    MonsterList = {
        "Soldier [Lv. 1]",
        "Clown Pirate [Lv. 10]",
        "Smoky [Lv. 20]",
        "Tashi [Lv. 30]",
        "Clown Swordman [Lv. 50]",
        "The Clown [Lv. 75]",
        "Commander [Lv. 100]",
        "Captain [Lv. 120]",
        "The Barbaric [Lv. 145]",
        "Fighter Fishman [Lv. 180]",
        "Karate Fishman [Lv. 200]",
        "Shark Man [Lv. 230]",
        "Trainer Chef [Lv. 250]",
        "Dark Leg [Lv. 300]",
        "Dory [Lv. 350]",
        "Snow Soldier [Lv. 400]",
        "King Snow [Lv. 450]",
        "Little Dear [Lv. 500]",
        "Candle Man [Lv. 525]",
        "Bomb Man [Lv. 625]",
        "King of Sand [Lv. 725]",
        "Sky Soldier [Lv. 800]",
        "Ball Man [Lv. 850]",
        "Rumble Man [Lv. 900]",
        "Elite Soldier [Lv. 1000]",
        "Leader [Lv. 1100]",
        "Pasta [Lv. 1150]",
        "Wolf [Lv. 1250]",
        "Giraffe [Lv. 1325]",
        "Leo [Lv. 1400]",
        "Zombie [Lv. 1500]",
        "Shadow Master [Lv. 1600]",
        "New World Pirate [Lv. 1700]",
        "Rear Admiral [Lv. 1800]",
        "True Karate Fishman [Lv. 1850]",
        "Quake Woman [Lv. 1925]",
        "Fishman [Lv. 2000]",
        "Combat Fishman [Lv. 2050]",
        "Sword Fishman [Lv. 2100]",
        "Soldier Fishman [Lv. 2150]",
        "Seasoned Fishman [Lv. 2200]"
    }
elseif Sea2 then
    MonsterList = {
        "Beast Pirate [Lv. 2250]",
        "Beast Swordman [Lv. 2300]",
        "Gazelle Man [Lv. 2350]",
        "Bandit Beast Pirate [Lv. 2400]",
        "Powerful Beast Pirate [Lv. 2450]",
        "Violet Samurai [Lv. 2500]",
        "Duke [Lv. 2550]",
        "Magician [Lv. 2600]",
        "Kitsune Samurai [Lv. 2650]",
        "Elite Beast Pirate [Lv. 2700]",
        "Bear Man [Lv. 2750]",
        "Bean [Lv. 2800]",
        "Meji [Lv. 2850]",
        "Pachy Woman [Lv. 2950]",
        "Kappa [Lv. 2950]",
        "Joey [Lv. 3000]",
        "Skull Pirate [Lv. 3050]",
        "Elite Skeleton [Lv. 3100]",
        "Desert Thief [Lv. 3125]",
        "Anubis [Lv. 3150]",
        "Pharaoh [Lv. 3175]",
        "Flame User [Lv. 3200]",
        "Chess Soldier [Lv. 3200]",
        "Sunken Vessel [Lv. 3225]",
        "Biscuit Man [Lv. 3250]",
        "Azlan [Lv. 3300]",
        "The Volcano [Lv. 3325]",
        "Dark Beard Servant [Lv. 3400]",
        "Supreme Swordman [Lv. 3425]",
        "Sally [Lv. 3450]",
        "Vice Admiral [Lv. 3500]",
        "Pondere [Lv. 3525]",
        "Hefty [Lv. 3550]",
        "Lucidus [Lv. 3575]",
        "Fiore Gladiator [Lv. 3600]",
        "Fiore Fighter [Lv. 3625]",
        "Fiore Pirate [Lv. 3650]",
        "Lomeo [Lv. 3675]",
        "Prince Aria [Lv. 3700]",
        "Devastate [Lv. 3725]",
        "Physicus [Lv. 3750]",
        "Floffy [Lv. 3775]",
        "Dead Troupe [Lv. 3800]",
        "Dead Troupe Captain [Lv. 3850]",
        "Ryu [Lv. 3975]"
    }
elseif Sea3 then
    MonsterList = {
        "Fugitive [Lv. 4050]",
        "Fishman Guardian [Lv. 4150]"
    }
end
local v449 = Sea1 and {
    "Rusted Scrap",
    "Leather",
    "Angellic\'s Feather",
    "Gun Powder",
    "Fresh Fish",
    "Undead Ooze",
    "Shark Canine"
} or (Sea2 and {
    "Rusted Scrap",
    "Leather",
    "Iron Ingot",
    "Carrot",
    "Mystic Droplet",
    "Gun Powder",
    "Bread Crumps",
    "Undead Ooze",
    "Pile of Bones",
    "Thief\'s Rag",
    "Dragon Orb",
    "Lucidu\'s Totem",
    "Dark Beard Totem",
    "Ice Crystals",
    "Magma Crystal",
    "Samurai Bandage",
    "Lost Ruby",
    "Essence of Fire",
    "Twilight Orb",
    "Vital Fluid",
    "Phoenix Tear",
    "Diverse Sphere"
} or (Sea3 and {
    "Coral and Pearl",
    "Shark Fin"
} or nil))
local v450 = {
    "Gazelle Man [Lv. 2350]",
    "Violet Samurai [Lv. 2500]",
    "Duke [Lv. 2550]",
    "Magician [Lv. 2600]",
    "Kitsune Samurai [Lv. 2650]",
    "Bear Man [Lv. 2750]",
    "Bean [Lv. 2800]",
    "Meji [Lv. 2850]",
    "Petra [Lv. 2900]",
    "Kappa [Lv. 2950]",
    "Joey [Lv. 3000]",
    "Elite Skeleton [Lv. 3100]",
    "Desert Thief [Lv. 3125]",
    "Anubis [Lv. 3150]",
    "Pharaoh [Lv. 3175]",
    "Flame User [Lv. 3200]",
    "Sunken Vessel [Lv. 3225]",
    "Biscuit Man [Lv. 3250]",
    "Dough Master [Lv. 3275]",
    "Supreme Swordman [Lv. 3425]",
    "Sally [Lv. 3450]",
    "Pondere [Lv. 3525]",
    "Hefty [Lv. 3550]",
    "Lomeo [Lv. 3675]",
    "Prince Aria [Lv. 3700]",
    "Devastate [Lv. 3725]",
    "Physicus [Lv. 3750]",
    "Floffy [Lv. 3775]",
    "Ryu [Lv. 3975]"
}
local v451 = {
    "Fugitive [Lv. 4050]",
    "The deep one [Lv. 4200]",
    "Fishman King\'s Guard [Lv. 4250]",
    "Cyborg Gorilla [Lv. 4375]",
    "Ripcurrent Raider [Lv. 4400]",
    "Tidal Warrior [Lv. 4450]",
    "Ocean Gladiator [Lv. 4500]",
    "Electro Abyss Warrior [Lv. 4600]",
    "Inferno Diver [Lv. 4650]",
    "Tempest Tidebreaker [Lv. 4700]",
    "Abyssal Swordman [Lv. 4750]"
}
local v452 = nil
if Sea1 then
    v451 = {
        "Smoky [Lv. 20]",
        "Tashi [Lv. 30]",
        "The Clown [Lv. 75]",
        "Captain [Lv. 120]",
        "The Barbaric [Lv. 145]",
        "Karate Fishman [Lv. 200]",
        "Shark Man [Lv. 230]",
        "Dark Leg [Lv. 300]",
        "Dory [Lv. 350]",
        "King Snow [Lv. 450]",
        "Little Dear [Lv. 500]",
        "Candle Man [Lv. 525]",
        "Bomb Man [Lv. 625]",
        "King of Sand [Lv. 725]",
        "Ball Man [Lv. 850]",
        "Rumble Man [Lv. 950]",
        "Leader [Lv. 1100]",
        "Pasta [Lv. 1150]",
        "Wolf [Lv. 1250]",
        "Giraffe [Lv. 1300]",
        "Leo [Lv. 1450]",
        "Shadow Master [Lv. 1650]",
        "True Karate Fishman [Lv. 1850]",
        "Quake Woman [Lv. 1925]",
        "Combat Fishman [Lv. 2050]",
        "Sword Fishman [Lv. 2100]",
        "Seasoned Fishman [Lv. 2200]"
    }
elseif Sea2 then
    v451 = v450
elseif not Sea3 then
    v451 = v452
end
local v453, v454, v455 = pairs(game:GetService("Workspace").Areas:GetChildren())
local v456 = vu422
local v457 = vu435
local vu458 = vu97
local vu459 = vu198
local v460 = {}
while true do
    local v461
    v455, v461 = v453(v454, v455)
    if v455 == nil then
        break
    end
    if v461.Name ~= "Sea of dust" then
        table.insert(v460, v461.Name)
    end
end
function vu295.autofarmbosses()
    local v462 = "autofarmbosses"
    while _G.Settings[v462] and task.wait() do
        if vu459.find({
            selectedBoss
        }) then
            vu459.attack({
                selectedBoss
            }, v462)
        end
    end
end
function vu295.AutoFarmMaterial()
    local v463 = "AutoFarmMaterial"
    while _G.Settings[v463] and task.wait() do
        MaterialMon()
        if MMon and vu459.find({
            MMon
        }) then
            vu459.attack({
                MMon
            }, v463)
        end
    end
end
function getSpawn()
    task.spawn(function()
        while task.wait(1) do
            local v478, v479 = pcall(function()
                local v464 = game.Players.LocalPlayer.Backpack
                if _G.Settings.Select_Weapon == "Melee" or (_G.Settings.Select_Weapon == "Sword" or _G.Settings.Select_Weapon == "Fruit Power") then
                    local v465 = _G.Settings.Select_Weapon == "Melee" and "Combat" or (_G.Settings.Select_Weapon == "Sword" and "Sword" or "Fruit Power")
                    local v466, v467, v468 = pairs(v464:GetChildren())
                    while true do
                        local v469
                        v468, v469 = v466(v467, v468)
                        if v468 == nil then
                            break
                        end
                        if v469.ClassName == "Tool" and v469.ToolTip == v465 then
                            _G.Weapon = tostring(v469.Name)
                        end
                    end
                elseif _G.Settings.Select_Weapon ~= "all In One" then
                    _G.Settings.Select_Weapon = "Melee"
                else
                    local v470, v471, v472 = pairs(v464:GetChildren())
                    while true do
                        local v473
                        v472, v473 = v470(v471, v472)
                        if v472 == nil then
                            break
                        end
                        if v473.ClassName == "Tool" then
                            if v473.ToolTip ~= "Sword" then
                                if v473.ToolTip ~= "Combat" then
                                    if v473.ToolTip == "Fruit Power" then
                                        myWeapon["Fruit Power"] = tostring(v473.Name)
                                    end
                                else
                                    myWeapon.Melee = tostring(v473.Name)
                                end
                            else
                                myWeapon.Sword = tostring(v473.Name)
                            end
                        end
                    end
                end
                local v474, v475, v476 = pairs(v464:GetChildren())
                while true do
                    local v477
                    v476, v477 = v474(v475, v476)
                    if v476 == nil then
                        break
                    end
                    if v477.ClassName == "Tool" and v477.ToolTip == "Fruit Power" then
                        myWeapon.Fruit = tostring(v477.Name)
                    end
                end
            end)
            if not v478 then
                print("Error in getSpawn: ", v479)
            end
        end
    end)
end
local vu480 = game.PlaceId
if vu480 ~= 4520749081 then
    if vu480 ~= 6381829480 then
        if vu480 == 5931540094 then
            Colossuem = true
        end
    else
        Sea2 = true
    end
else
    Sea1 = true
end
local _ = game:GetService("Players").LocalPlayer
game:GetService("TextService")
game:GetService("TweenService")
game:GetService("UserInputService")
game:GetService("HttpService")
game:GetService("CoreGui")
local vu481 = game:GetService("Players").LocalPlayer
game:GetService("UserInputService")
game:GetService("TweenService")
game:GetService("RunService")
local v482 = vu481
vu481.GetMouse(v482)
game:GetService("VirtualInputManager")
game:GetService("VirtualUser")
game:GetService("HttpService")
game:GetService("Lighting")
game:GetService("ReplicatedStorage")
game:GetService("TeleportService")
local _ = game:GetService("StarterGui")
local function _()
    return vu481.Character or vu481.CharacterAdded:Wait()
end
local vu483 = pairs
local vu484 = ipairs
local _ = game:GetService("Players").LocalPlayer
local vu485 = game:GetService("TextService")
local vu486 = game:GetService("TweenService")
game:GetService("UserInputService")
game:GetService("HttpService")
game:GetService("CoreGui")
local vu487 = game:GetService("Players").LocalPlayer
local vu488 = game:GetService("UserInputService")
game:GetService("TweenService")
game:GetService("RunService")
local v489 = vu487
vu487.GetMouse(v489)
game:GetService("VirtualInputManager")
game:GetService("VirtualUser")
game:GetService("HttpService")
game:GetService("Lighting")
game:GetService("ReplicatedStorage")
game:GetService("TeleportService")
local _ = game:GetService("StarterGui")
local function _()
    return vu487.Character or vu487.CharacterAdded:Wait()
end
local vu490 = {
    Bind = Enum.KeyCode.RightControl
}
local vu491 = game:GetService("UserInputService")
local vu492 = {
    Config = {
        MainColor = Color3.fromRGB(128, 0, 128),
        DropColor = Color3.fromRGB(100, 0, 100),
        ["UI Size"] = UDim2.new(0.1, 400, 0.1, 250)
    },
    CoreGui = game:FindFirstChild("CoreGui") or game.Players.LocalPlayer.PlayerGui,
    Windows = {}
}
local vu493 = protectgui or (syn and syn.protect_gui or function()
end)
local function vu496(p494)
    local v495 = Instance.new("TextButton")
    v495.Size = UDim2.new(1, 0, 1, 0)
    v495.BackgroundTransparency = 1
    v495.TextTransparency = 1
    v495.Text = ""
    v495.Parent = p494
    v495.ZIndex = 5000
    return v495
end
function vu492.GetTextSize(_, p497)
    return vu485:GetTextSize(p497.Text, p497.TextSize, p497.Font, Vector2.new(math.huge, math.huge))
end
local function vu502(pu498)
    task.spawn(function()
        local vu499 = 1
        local vu500 = pu498:WaitForChild("UIListLayout", 9999999)
        pu498.CanvasSize = UDim2.new(0, 0, 0, vu500.AbsoluteContentSize.Y + vu499)
        local v501 = vu500
        vu500.GetPropertyChangedSignal(v501, "AbsoluteContentSize"):Connect(function()
            pu498.CanvasSize = UDim2.new(0, 0, 0, vu500.AbsoluteContentSize.Y + vu499)
        end)
    end)
end
local function vu507(pu503)
    task.spawn(function()
        local vu504 = 1
        local vu505 = pu503:WaitForChild("UIListLayout", 9999999)
        pu503.CanvasSize = UDim2.new(0, vu505.AbsoluteContentSize.X + vu504, 0, 0)
        local v506 = vu505
        vu505.GetPropertyChangedSignal(v506, "AbsoluteContentSize"):Connect(function()
            pu503.CanvasSize = UDim2.new(0, vu505.AbsoluteContentSize.X + vu504, 0, 0)
        end)
    end)
end
function vu492.NewWindow(_, _, p508, p509)
    local vu510 = p509 or "0"
    local vu511 = {
        Toggle = Enum.KeyCode.LeftControl,
        Tabs = {},
        TabSelect = 1
    }
    local vu512 = Instance.new("ScreenGui")
    local vu513 = Instance.new("Frame")
    local v514 = Instance.new("UICorner")
    local v515 = Instance.new("ImageLabel")
    local v516 = Instance.new("Frame")
    local v517 = Instance.new("ImageLabel")
    local v518 = Instance.new("UICorner")
    local v519 = Instance.new("TextLabel")
    local vu520 = Instance.new("TextLabel")
    local v521 = Instance.new("UIGradient")
    Instance.new("UIGradient")
    local v522 = Instance.new("Frame")
    local vu523 = Instance.new("ScrollingFrame")
    local v524 = Instance.new("UIListLayout")
    local vu525 = Instance.new("Frame")
    local v526 = Instance.new("ImageLabel")
    local v527 = Instance.new("UICorner")
    local v528 = Instance.new("UICorner")
    local v529 = Instance.new("Frame")
    local v530 = Instance.new("UICorner")
    vu512.Name = "Main"
    vu512.Parent = vu492.CoreGui
    vu512.ResetOnSpawn = false
    vu512.IgnoreGuiInset = true
    vu512.ZIndexBehavior = Enum.ZIndexBehavior.Global
    vu493(vu512)
    vu513.Parent = vu512
    vu513.AnchorPoint = Vector2.new(0.5, 0.5)
    vu513.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    vu513.BackgroundTransparency = 0
    vu513.BorderColor3 = Color3.fromRGB(0, 0, 0)
    vu513.BorderSizePixel = 0
    vu513.Position = UDim2.new(0.5, 0, 0.5, 0)
    vu513.Size = UDim2.fromScale(0, 0)
    vu513.SizeConstraint = Enum.SizeConstraint.RelativeYY
    vu513.ClipsDescendants = true
    vu486:Create(vu513, TweenInfo.new(1.5), {
        Size = vu492.Config["UI Size"]
    }):Play()
    v514.Parent = vu513
    v515.Name = "DropShadow"
    v515.Parent = vu513
    v515.AnchorPoint = Vector2.new(0.5, 0.5)
    v515.BackgroundTransparency = 1
    v515.BorderSizePixel = 0
    v515.Position = UDim2.new(0.5, 0, 0.5, 0)
    v515.Size = UDim2.new(1, 47, 1, 47)
    v515.ZIndex = 0
    v515.Image = "rbxassetid://6015897843"
    v515.ImageColor3 = Color3.fromRGB(0, 0, 0)
    v515.ImageTransparency = 0.5
    v515.ScaleType = Enum.ScaleType.Slice
    v515.SliceCenter = Rect.new(49, 49, 450, 450)
    v515.Rotation = 0.01
    v516.Name = "Topbar"
    v516.Parent = vu513
    v516.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v516.BackgroundTransparency = 1
    v516.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v516.BorderSizePixel = 0
    v516.Size = UDim2.new(1, 0, 0.09, 0)
    v516.ZIndex = 2
    v529.Parent = vu513
    v529.AnchorPoint = Vector2.new(0.5, 0.5)
    v529.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
    v529.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v529.BorderSizePixel = 0
    v529.BackgroundTransparency = 0.5
    v529.Position = UDim2.new(0.5, 0, 0.1, 0)
    v529.Size = UDim2.new(0.95, 0, 0.005, 0)
    v529.ZIndex = 5
    local v531 = Instance.new("UIGradient")
    v531.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(221, 160, 221)),
        ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
    })
    v531.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(0.6, 0),
        NumberSequenceKeypoint.new(1, 0.5)
    })
    v531.Parent = v529
    v530.CornerRadius = UDim.new(0, 3)
    v530.Parent = v529
    v517.Name = "HubLogo"
    v517.Parent = v516
    v517.AnchorPoint = Vector2.new(0.5, 0.5)
    v517.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v517.BackgroundTransparency = 1
    v517.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v517.BorderSizePixel = 0
    v517.Position = UDim2.new(0.0450000018, 0, 0.6, 0)
    v517.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
    v517.SizeConstraint = Enum.SizeConstraint.RelativeYY
    v517.ZIndex = 3
    v517.Image = vu510
    v518.Parent = v517
    v519.Name = "TextTitle"
    v519.Parent = v516
    v519.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v519.BackgroundTransparency = 1
    v519.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v519.BorderSizePixel = 0
    v519.Position = UDim2.new(0.103366353, 0, 0.2099998972, 0)
    v519.Size = UDim2.new(0.896555603, 0, 0.433997005, 0)
    v519.ZIndex = 3
    v519.Font = Enum.Font.GothamBold
    v519.Text = "TSUO HUB<font color=\'rgb(128,0,128)\'> KING LEGACY</font>"
    v519.RichText = true
    v519.TextColor3 = Color3.fromRGB(255, 255, 255)
    v519.TextScaled = true
    v519.TextSize = 14
    v519.TextWrapped = true
    v519.TextXAlignment = Enum.TextXAlignment.Left
    vu520.Name = "TextDescription"
    vu520.Parent = v516
    vu520.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    vu520.BackgroundTransparency = 1
    vu520.BorderColor3 = Color3.fromRGB(0, 0, 0)
    vu520.BorderSizePixel = 0
    vu520.Position = UDim2.new(0.103366353, 0, 0.65399694, 0)
    vu520.Size = UDim2.new(0, 80, 0.300000012, 0)
    vu520.ZIndex = 3
    vu520.Font = Enum.Font.GothamBold
    vu520.Text = p508 or "..."
    vu520.TextColor3 = Color3.fromRGB(255, 255, 255)
    vu520.TextScaled = false
    vu520.TextSize = 10
    vu520.TextWrapped = true
    vu520.TextXAlignment = Enum.TextXAlignment.Left
    game:GetService("TweenService")
    local v532 = Instance.new("ImageButton")
    v532.Name = "Exit"
    v532.Parent = v516
    v532.AnchorPoint = Vector2.new(1, 0)
    v532.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v532.BackgroundTransparency = 1
    v532.BorderSizePixel = 0
    v532.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v532.Position = UDim2.new(1, - 8, 0, 10)
    v532.Size = UDim2.new(0, 20, 0, 20)
    v532.Image = "rbxassetid://10747384394"
    local v533 = Instance.new("ImageButton")
    v533.Name = "Minimize"
    v533.Parent = v516
    v533.AnchorPoint = Vector2.new(1, 0)
    v533.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v533.BackgroundTransparency = 1
    v533.BorderSizePixel = 0
    v533.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v533.Position = UDim2.new(1, - 33, 0, 10)
    v533.Size = UDim2.new(0, 20, 0, 20)
    v533.Image = "rbxassetid://10734896206"
    v533.MouseButton1Click:Connect(function()
    end)
    v532.MouseButton1Click:Connect(function()
        vu512:Destroy()
        vu513:Destroy()
        Frames:Destroy()
        Toggle:Destroy()
    end);
    (function()
        local v534 = vu492:GetTextSize(vu520)
        vu486:Create(vu520, TweenInfo.new(0.5), {
            Size = UDim2.new(0, v534.X, 0.3, 0)
        }):Play()
    end)()
    v521.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, vu492.Config.MainColor),
        ColorSequenceKeypoint.new(1, vu492.Config.DropColor)
    })
    v521.Parent = vu520
    v522.Name = "MenuFrames"
    v522.Parent = vu513
    v522.AnchorPoint = Vector2.new(0.5, 0)
    v522.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v522.BackgroundTransparency = 1
    v522.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v522.BorderSizePixel = 0
    v522.Position = UDim2.new(0.5, 0, 0.075000003, 0)
    v522.Size = UDim2.new(0.949999988, 0, 0.0799999982, 0)
    v522.ZIndex = 2
    vu523.Name = "MenuScroll"
    vu523.Parent = v522
    vu523.Active = true
    vu523.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    vu523.BackgroundTransparency = 1
    vu523.BorderColor3 = Color3.fromRGB(0, 0, 0)
    vu523.BorderSizePixel = 0
    vu523.Size = UDim2.new(1, 0, 1, 0)
    vu523.ZIndex = 3
    vu523.CanvasSize = UDim2.new(2, 0, 0, 0)
    vu523.ScrollBarThickness = 0
    vu523.TopImage = ""
    vu507(vu523)
    v524.Parent = vu523
    v524.FillDirection = Enum.FillDirection.Horizontal
    v524.SortOrder = Enum.SortOrder.LayoutOrder
    v524.VerticalAlignment = Enum.VerticalAlignment.Center
    v524.Padding = UDim.new(0, 8)
    vu525.Name = "CloseUI"
    vu525.Parent = vu513
    vu525.AnchorPoint = Vector2.new(0.5, 0.5)
    vu525.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    vu525.BorderColor3 = Color3.fromRGB(0, 0, 0)
    vu525.BorderSizePixel = 0
    vu525.Position = UDim2.new(0.5, 0, 0.5, 0)
    vu525.Visible = false
    vu525.ZIndex = 45
    vu525.Size = UDim2.fromScale(1, 1)
    vu486:Create(vu525, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        Size = UDim2.fromScale(0, 0)
    }):Play()
    v526.Name = "HubLogo"
    v526.Parent = vu525
    v526.AnchorPoint = Vector2.new(0.5, 0.5)
    v526.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v526.BackgroundTransparency = 1
    v526.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v526.BorderSizePixel = 0
    v526.Position = UDim2.new(0.5, 0, 0.5, 0)
    v526.Size = UDim2.new(0.25, 0, 0.25, 0)
    v526.SizeConstraint = Enum.SizeConstraint.RelativeYY
    v526.ZIndex = 55
    v526.Image = vu510
    v527.Parent = v526
    v528.Parent = vu525
    local v535 = Instance.new("UIStroke")
    v535.Color = Color3.fromRGB(37, 37, 37)
    v535.Parent = vu525
    local vu536 = nil
    local vu537 = 0.1
    local vu538 = nil
    local vu539 = nil
    local vu540 = true
    local v541 = vu513
    vu513.GetPropertyChangedSignal(v541, "Size"):Connect(function()
        if vu513.Size.X.Scale > 0 then
            vu513.Visible = true
        else
            vu513.Visible = false
        end
    end)
    local v542 = vu525
    vu525.GetPropertyChangedSignal(v542, "Size"):Connect(function()
        if vu525.Size.X.Scale > 0 then
            vu525.Visible = true
        else
            vu525.Visible = false
        end
    end)
    local function vu544(p543)
        if p543 then
            vu486:Create(vu513, TweenInfo.new(0.5), {
                Size = vu492.Config["UI Size"]
            }):Play()
            vu486:Create(vu525, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                Size = UDim2.fromScale(0, 0)
            }):Play()
        else
            vu486:Create(vu513, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                Size = UDim2.fromScale(0, 0)
            }):Play()
            vu486:Create(vu525, TweenInfo.new(0.5), {
                Size = UDim2.fromScale(1, 1)
            }):Play()
        end
    end
    task.spawn(function()
        local v545 = Instance.new("ScreenGui")
        local vu546 = Instance.new("Frame")
        local v547 = Instance.new("UICorner")
        local v548 = Instance.new("UIStroke")
        local v549 = Instance.new("ImageLabel")
        local v550 = Instance.new("ImageLabel")
        v545.Name = "Toggle"
        v545.Parent = vu492.CoreGui or game.Players.LocalPlayer:WaitForChild("PlayerGui")
        v545.ZIndexBehavior = Enum.ZIndexBehavior.Global
        vu546.Name = "c4"
        vu546.Parent = v545
        vu546.AnchorPoint = Vector2.new(0.5, 0.5)
        vu546.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        vu546.BorderColor3 = Color3.fromRGB(0, 0, 0)
        vu546.BorderSizePixel = 0
        vu546.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
        vu546.Size = UDim2.new(0, 65, 0, 65)
        vu546.SizeConstraint = Enum.SizeConstraint.RelativeYY
        vu546.ZIndex = 67
        v547.Parent = vu546
        v548.Color = Color3.fromRGB(121, 121, 121)
        v548.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        v548.Parent = vu546
        v549.Name = "logo"
        v549.Parent = vu546
        v549.AnchorPoint = Vector2.new(0.5, 0.5)
        v549.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v549.BackgroundTransparency = 1.01
        v549.BorderColor3 = Color3.fromRGB(0, 0, 0)
        v549.BorderSizePixel = 0
        v549.Position = UDim2.new(0.5, 0, 0.5, 0)
        v549.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
        v549.ZIndex = 68
        v549.Image = vu510
        v550.Name = "DropShadow"
        v550.Parent = vu546
        v550.AnchorPoint = Vector2.new(0.5, 0.5)
        v550.BackgroundTransparency = 1
        v550.BorderSizePixel = 0
        v550.Position = UDim2.new(0.5, 0, 0.5, 0)
        v550.Size = UDim2.new(1, 47, 1, 47)
        v550.ZIndex = 66
        v550.Image = "rbxassetid://6015897843"
        v550.ImageColor3 = Color3.fromRGB(0, 0, 0)
        v550.ImageTransparency = 0.5
        v550.ScaleType = Enum.ScaleType.Slice
        v550.SliceCenter = Rect.new(49, 49, 450, 450)
        local vu551 = false
        local vu552 = nil
        local vu553 = nil
        local vu554 = vu546.Position
        local function vu558(p555)
            local v556 = p555.Position - vu552
            local v557 = UDim2.new(vu553.X.Scale, vu553.X.Offset + v556.X, vu553.Y.Scale, vu553.Y.Offset + v556.Y)
            game:GetService("TweenService"):Create(vu546, TweenInfo.new(vu537), {
                Position = v557
            }):Play()
        end
        local v559 = vu496(vu546)
        v559.ZIndex = 68
        v559.MouseButton1Click:Connect(function()
            if vu554 == vu546.Position then
                vu540 = not vu540
                vu544(vu540)
            end
        end)
        v559.InputBegan:Connect(function(pu560)
            if pu560.UserInputType == Enum.UserInputType.MouseButton1 or pu560.UserInputType == Enum.UserInputType.Touch then
                vu551 = true
                vu552 = pu560.Position
                vu553 = vu546.Position
                vu554 = vu546.Position
                pu560.Changed:Connect(function()
                    if pu560.UserInputState == Enum.UserInputState.End then
                        vu551 = false
                    end
                end)
            end
        end)
        vu491.InputChanged:Connect(function(p561)
            if (p561.UserInputType == Enum.UserInputType.MouseMovement or p561.UserInputType == Enum.UserInputType.Touch) and vu551 then
                vu558(p561)
            end
        end)
    end)
    vu488.InputBegan:Connect(function(p562, _)
        if p562.KeyCode == vu490.Bind then
            if uitoggled ~= false then
                vu513:TweenSize(UDim2.new(0.100000001, 410, 0.100000001, 240), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 1, true)
                vu512.Enabled = true
                uitoggled = false
            else
                vu513:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 1, true)
                uitoggled = true
                task.wait(0.5)
                vu512.Enabled = false
            end
        end
    end)
    local function vu566(p563)
        local v564 = p563.Position - vu538
        local v565 = UDim2.new(vu539.X.Scale, vu539.X.Offset + v564.X, vu539.Y.Scale, vu539.Y.Offset + v564.Y)
        game:GetService("TweenService"):Create(vu513, TweenInfo.new(vu537), {
            Position = v565
        }):Play()
    end
    v516.InputBegan:Connect(function(pu567)
        if pu567.UserInputType == Enum.UserInputType.MouseButton1 or pu567.UserInputType == Enum.UserInputType.Touch then
            vu536 = true
            vu538 = pu567.Position
            vu539 = vu513.Position
            pu567.Changed:Connect(function()
                if pu567.UserInputState == Enum.UserInputState.End then
                    vu536 = false
                end
            end)
        end
    end)
    vu491.InputChanged:Connect(function(p568)
        if (p568.UserInputType == Enum.UserInputType.MouseMovement or p568.UserInputType == Enum.UserInputType.Touch) and vu536 then
            vu566(p568)
        end
    end)
    vu491.InputBegan:Connect(function(p569, p570)
        if not p570 then
            if p569.KeyCode == vu511.Toggle then
                vu540 = not vu540
                vu544(vu540)
            end
        end
    end)
    function vu511.AddMenu(_, p571, p572, p573, p574)
        local vu575 = p574 or "tab"
        local vu576 = {
            Checker = {}
        }
        local vu577 = Instance.new("Frame")
        local v578 = Instance.new("UIAspectRatioConstraint")
        local v579 = Instance.new("UICorner")
        local v580 = Instance.new("ImageLabel")
        local vu581 = Instance.new("TextLabel")
        local v582 = Instance.new("TextLabel")
        local vu583 = Instance.new("TextButton")
        vu577.Name = "MenuButton"
        vu577.Parent = vu523
        vu577.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        vu577.BackgroundTransparency = 1
        vu577.BorderColor3 = Color3.fromRGB(0, 0, 0)
        vu577.BorderSizePixel = 0
        vu577.ClipsDescendants = false
        vu577.Size = UDim2.new(0.5, 0, 0.75, 0)
        vu577.ZIndex = 4
        v578.Parent = vu577
        v578.AspectRatio = 0.1
        v578.AspectType = Enum.AspectType.ScaleWithParentSize
        v578.DominantAxis = Enum.DominantAxis.Height
        vu486:Create(v578, TweenInfo.new(0.3 + # vu511.Tabs / 10, Enum.EasingStyle.Back), {
            AspectRatio = 4
        }):Play()
        v579.CornerRadius = UDim.new(0, 3)
        v579.Parent = vu577
        v580.Name = "MenuLogo"
        v580.Parent = vu577
        v580.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v580.BackgroundTransparency = 1
        v580.BorderColor3 = Color3.fromRGB(0, 0, 0)
        v580.BorderSizePixel = 0
        v580.Size = UDim2.new(1, 0, 1, 0)
        v580.SizeConstraint = Enum.SizeConstraint.RelativeYY
        v580.ZIndex = 5
        v580.Image = p573
        vu581.Name = "MenuText"
        vu581.Parent = vu577
        vu581.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        vu581.BackgroundTransparency = 1
        vu581.BorderColor3 = Color3.fromRGB(0, 0, 0)
        vu581.BorderSizePixel = 0
        vu581.Position = UDim2.new(0.010877919, 0, 0.5, 0)
        vu581.Size = UDim2.new(2.10955262, 0, 0.5, 0)
        vu581.ZIndex = 5
        vu581.Font = Enum.Font.GothamBold
        vu581.Text = p571 or "Menu"
        vu581.TextColor3 = Color3.fromRGB(100, 100, 15)
        vu581.TextTransparency = 0.8
        vu581.TextScaled = true
        vu581.TextSize = 14
        vu581.TextWrapped = true
        vu581.TextXAlignment = Enum.TextXAlignment.Left
        v582.Name = "MenuDesc"
        v582.Parent = vu577
        v582.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v582.BackgroundTransparency = 1
        v582.BorderColor3 = Color3.fromRGB(0, 0, 0)
        v582.BorderSizePixel = 0
        v582.Position = UDim2.new(0.11100589, 0, 0.600000083, 0)
        v582.Size = UDim2.new(2.10955262, 0, 0.349999547, 0)
        v582.ZIndex = 5
        v582.Font = Enum.Font.GothamBold
        v582.Text = p572 or "Description"
        v582.TextColor3 = Color3.fromRGB(255, 255, 255)
        v582.TextScaled = true
        v582.TextSize = 14
        v582.TextTransparency = 0.8
        v582.TextWrapped = true
        v582.TextXAlignment = Enum.TextXAlignment.Left
        vu583.Name = "Button"
        vu583.Parent = vu577
        vu583.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        vu583.BackgroundTransparency = 1
        vu583.BorderColor3 = Color3.fromRGB(0, 0, 0)
        vu583.BorderSizePixel = 0
        vu583.Size = UDim2.new(1, 0, 1, 0)
        vu583.ZIndex = 25
        vu583.Font = Enum.Font.SourceSans
        vu583.Text = ""
        vu583.TextColor3 = Color3.fromRGB(0, 0, 0)
        vu583.TextSize = 14
        vu583.TextTransparency = 1
        local vu584 = nil
        if vu575:find("tab") then
            vu584 = Instance.new("Frame")
            local v585 = Instance.new("Frame")
            local v586 = Instance.new("Frame")
            local v587 = Instance.new("UICorner")
            local v588 = Instance.new("UIStroke")
            local vu589 = Instance.new("TextLabel")
            local vu590 = Instance.new("ImageLabel")
            local v591 = Instance.new("UICorner")
            local vu592 = Instance.new("TextBox")
            local v593 = Instance.new("Frame")
            local v594 = Instance.new("Frame")
            local vu595 = Instance.new("ScrollingFrame")
            local v596 = Instance.new("UIListLayout")
            local v597 = Instance.new("Frame")
            vu584.Name = "PageFrames"
            vu584.Parent = vu513
            vu584.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            vu584.BackgroundTransparency = 1
            vu584.BorderColor3 = Color3.fromRGB(0, 0, 0)
            vu584.BorderSizePixel = 0
            vu584.ClipsDescendants = true
            vu584.Position = UDim2.new(0, 0, 0.163185388, 0)
            vu584.Size = UDim2.new(1, 0, 0.836814642, 0)
            vu584.ZIndex = 4
            v585.Name = "Search"
            v585.Parent = vu584
            v585.AnchorPoint = Vector2.new(0.5, 0.5)
            v585.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            v585.BackgroundTransparency = 1
            v585.BorderColor3 = Color3.fromRGB(0, 0, 0)
            v585.BorderSizePixel = 0
            v585.ClipsDescendants = true
            v585.Position = UDim2.new(0.187006071, 0, 0.5, 0)
            v585.Size = UDim2.new(0.354012221, 0, 0.980000138, 0)
            v585.ZIndex = 4
            v586.Name = "SearchEngine"
            v586.Parent = v585
            v586.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            v586.BorderColor3 = Color3.fromRGB(0, 0, 0)
            v586.BorderSizePixel = 0
            v586.ClipsDescendants = true
            v586.Size = UDim2.new(1, 0, 0.0680000037, 0)
            v586.ZIndex = 6
            v587.CornerRadius = UDim.new(0, 2)
            v587.Parent = v586
            v588.Thickness = 0.5
            v588.Color = Color3.fromRGB(39, 39, 39)
            v588.Parent = v586
            vu589.Name = "LabelText"
            vu589.Parent = v586
            vu589.AnchorPoint = Vector2.new(0.5, 0.5)
            vu589.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            vu589.BackgroundTransparency = 1
            vu589.BorderColor3 = Color3.fromRGB(0, 0, 0)
            vu589.BorderSizePixel = 0
            vu589.Position = UDim2.new(0.612374663, 0, 0.499999851, 0)
            vu589.Size = UDim2.new(0.871346772, 0, 0.50000006, 0)
            vu589.ZIndex = 6
            vu589.Font = Enum.Font.GothamBold
            vu589.Text = "Search"
            vu589.TextColor3 = Color3.fromRGB(255, 255, 255)
            vu589.TextScaled = true
            vu589.TextSize = 14
            vu589.TextTransparency = 0.75
            vu589.TextWrapped = true
            vu589.TextXAlignment = Enum.TextXAlignment.Left
            vu590.Name = "SearchIcon"
            vu590.Parent = v586
            vu590.AnchorPoint = Vector2.new(0.5, 0.5)
            vu590.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            vu590.BackgroundTransparency = 1
            vu590.BorderColor3 = Color3.fromRGB(0, 0, 0)
            vu590.BorderSizePixel = 0
            vu590.Position = UDim2.new(0.075000003, 0, 0.5, 0)
            vu590.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
            vu590.SizeConstraint = Enum.SizeConstraint.RelativeYY
            vu590.ZIndex = 6
            vu590.Image = "rbxassetid://7734052925"
            vu590.ImageTransparency = 0.75
            v591.CornerRadius = UDim.new(0, 6)
            v591.Parent = vu590
            vu592.Name = "searchbox"
            vu592.Parent = v586
            vu592.AnchorPoint = Vector2.new(0.5, 0.5)
            vu592.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            vu592.BackgroundTransparency = 1
            vu592.BorderColor3 = Color3.fromRGB(0, 0, 0)
            vu592.BorderSizePixel = 0
            vu592.Position = UDim2.new(1.46321285, 0, 0.499999851, 0)
            vu592.Size = UDim2.new(2.66615963, 0, 0.50000006, 0)
            vu592.ZIndex = 7
            vu592.ClearTextOnFocus = false
            vu592.Font = Enum.Font.GothamBold
            vu592.Text = ""
            vu592.TextColor3 = Color3.fromRGB(255, 255, 255)
            vu592.TextScaled = true
            vu592.TextSize = 14
            vu592.TextWrapped = true
            vu592.TextXAlignment = Enum.TextXAlignment.Left
            v593.Parent = v585
            v593.Active = true
            v593.AnchorPoint = Vector2.new(0, 0.5)
            v593.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
            v593.BorderColor3 = Color3.fromRGB(0, 0, 0)
            v593.BorderSizePixel = 0
            v593.Position = UDim2.new(1.01999998, 0, 0.5, 0)
            v593.Rotation = 0
            v593.Size = UDim2.new(0.00499999989, 0, 1, 0)
            v593.ZIndex = 3
            v594.Parent = v593
            v594.Active = true
            v594.AnchorPoint = Vector2.new(0, 0.5)
            v594.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
            v594.BorderColor3 = Color3.fromRGB(0, 0, 0)
            v594.BorderSizePixel = 0
            v594.Position = UDim2.new(1.00999999, 0, 0.5, 0)
            v594.Size = UDim2.new(1, 0, 1, 0)
            v594.ZIndex = 3
            vu595.Name = "TabFrames"
            vu595.Parent = v585
            vu595.Active = true
            vu595.AnchorPoint = Vector2.new(0.5, 0.5)
            vu595.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            vu595.BackgroundTransparency = 1
            vu595.BorderColor3 = Color3.fromRGB(0, 0, 0)
            vu595.BorderSizePixel = 0
            vu595.ClipsDescendants = false
            vu595.Position = UDim2.new(0.500000119, 0, 0.549316823, 0)
            vu595.Size = UDim2.new(0.949999988, 0, 0.901000023, 0)
            vu595.ZIndex = 6
            vu595.ScrollBarThickness = 0
            vu502(vu595)
            v596.Parent = vu595
            v596.HorizontalAlignment = Enum.HorizontalAlignment.Center
            v596.SortOrder = Enum.SortOrder.LayoutOrder
            v596.Padding = UDim.new(0, 4)
            v597.Name = "Main"
            v597.Parent = vu584
            v597.AnchorPoint = Vector2.new(0.5, 0.5)
            v597.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            v597.BackgroundTransparency = 1
            v597.BorderColor3 = Color3.fromRGB(0, 0, 0)
            v597.BorderSizePixel = 0
            v597.ClipsDescendants = true
            v597.Position = UDim2.new(0.685165405, 0, 0.5, 0)
            v597.Size = UDim2.new(0.609669089, 0, 0.980000019, 0)
            v597.ZIndex = 4
            vu592.Focused:Connect(function()
                vu486:Create(vu589, TweenInfo.new(0.1), {
                    TextTransparency = 1
                }):Play()
                vu486:Create(vu590, TweenInfo.new(0.1), {
                    ImageTransparency = 1
                }):Play()
            end)
            vu592.FocusLost:Connect(function()
                if # vu592.Text <= 0 then
                    vu486:Create(vu589, TweenInfo.new(0.1), {
                        TextTransparency = 0.75
                    }):Play()
                    vu486:Create(vu590, TweenInfo.new(0.1), {
                        ImageTransparency = 0.75
                    }):Play()
                    local v598, v599, v600 = vu484(vu595:GetChildren())
                    while true do
                        local v601
                        v600, v601 = v598(v599, v600)
                        if v600 == nil then
                            break
                        end
                        if v601:IsA("Frame") then
                            v601.Visible = true
                        end
                    end
                else
                    local v602, v603, v604 = vu484(vu595:GetChildren())
                    while true do
                        local v605
                        v604, v605 = v602(v603, v604)
                        if v604 == nil then
                            break
                        end
                        if v605:IsA("Frame") then
                            if v605.Name:lower():find(vu592.Text:lower()) then
                                v605.Visible = true
                            else
                                v605.Visible = false
                            end
                        end
                    end
                end
            end)
            local v606 = vu592
            vu592.GetPropertyChangedSignal(v606, "Text"):Connect(function()
                if # vu592.Text <= 0 then
                    vu486:Create(vu589, TweenInfo.new(0.1), {
                        TextTransparency = 0.75
                    }):Play()
                    vu486:Create(vu590, TweenInfo.new(0.1), {
                        ImageTransparency = 0.75
                    }):Play()
                    local v607, v608, v609 = vu484(vu595:GetChildren())
                    while true do
                        local v610
                        v609, v610 = v607(v608, v609)
                        if v609 == nil then
                            break
                        end
                        if v610:IsA("Frame") then
                            v610.Visible = true
                        end
                    end
                else
                    vu486:Create(vu589, TweenInfo.new(0.1), {
                        TextTransparency = 1
                    }):Play()
                    vu486:Create(vu590, TweenInfo.new(0.1), {
                        ImageTransparency = 1
                    }):Play()
                    local v611, v612, v613 = vu484(vu595:GetChildren())
                    while true do
                        local v614
                        v613, v614 = v611(v612, v613)
                        if v613 == nil then
                            break
                        end
                        if v614:IsA("Frame") then
                            if v614.Name:lower():find(vu592.Text:lower()) then
                                v614.Visible = true
                            else
                                v614.Visible = false
                            end
                        end
                    end
                end
            end)
        elseif vu575:find("change") then
            vu584 = Instance.new("Frame")
            local v615 = Instance.new("Frame")
            local v616 = Instance.new("ScrollingFrame")
            local v617 = Instance.new("UIListLayout")
            local v618 = Instance.new("Frame")
            local v619 = Instance.new("UICorner")
            vu502(v616)
            vu584.Name = "ChangeLog"
            vu584.Parent = vu513
            vu584.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            vu584.BackgroundTransparency = 1
            vu584.BorderColor3 = Color3.fromRGB(0, 0, 0)
            vu584.BorderSizePixel = 0
            vu584.Position = UDim2.new(0, 0, 0.163185388, 0)
            vu584.Size = UDim2.new(1, 0, 0.836814642, 0)
            vu584.Visible = true
            vu584.ZIndex = 4
            v615.Name = "Main"
            v615.Parent = vu584
            v615.AnchorPoint = Vector2.new(0.5, 0.5)
            v615.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            v615.BackgroundTransparency = 1
            v615.BorderColor3 = Color3.fromRGB(0, 0, 0)
            v615.BorderSizePixel = 0
            v615.ClipsDescendants = true
            v615.Position = UDim2.new(0.5, 0, 0.5, 0)
            v615.Size = UDim2.new(0.949999988, 0, 0.949999988, 0)
            v615.ZIndex = 4
            v616.Name = "MainScrolling"
            v616.Parent = v615
            v616.Active = true
            v616.AnchorPoint = Vector2.new(0.5, 0.5)
            v616.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            v616.BackgroundTransparency = 1
            v616.BorderColor3 = Color3.fromRGB(0, 0, 0)
            v616.BorderSizePixel = 0
            v616.ClipsDescendants = false
            v616.Position = UDim2.new(0.5, 0, 0.5, 0)
            v616.Size = UDim2.new(0.99000001, 0, 1, 0)
            v616.ZIndex = 2
            v616.ScrollBarThickness = 0
            v617.Parent = v616
            v617.HorizontalAlignment = Enum.HorizontalAlignment.Center
            v617.SortOrder = Enum.SortOrder.LayoutOrder
            v617.Padding = UDim.new(0, 5)
            v618.Parent = vu584
            v618.AnchorPoint = Vector2.new(0.5, 1)
            v618.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
            v618.BorderColor3 = Color3.fromRGB(0, 0, 0)
            v618.BorderSizePixel = 0
            v618.Position = UDim2.new(0.5, 0, 0, 0)
            v618.Size = UDim2.new(0.949999988, 0, 0.00499999989, 0)
            v619.CornerRadius = UDim.new(0.5, 0)
            v619.Parent = v618
        end
        local vu620 = # vu511.Tabs + 1
        local function v622(p621)
            if p621 then
                vu486:Create(vu584, TweenInfo.new(0.3), {
                    Position = UDim2.fromScale(0, 0.163)
                }):Play()
                vu486:Create(vu581, TweenInfo.new(0.1 + vu620 / 10), {
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextTransparency = 0.8
                }):Play()
            else
                if vu620 >= vu511.TabSelect then
                    vu486:Create(vu584, TweenInfo.new(0.3), {
                        Position = UDim2.fromScale(1, 0.163)
                    }):Play()
                else
                    vu486:Create(vu584, TweenInfo.new(0.3), {
                        Position = UDim2.fromScale(- 1, 0.163)
                    }):Play()
                end
                vu486:Create(vu581, TweenInfo.new(0.1), {
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextTransparency = 0.25
                }):Play()
            end
        end
        if vu511.Tabs[1] then
            v622(false)
        else
            v622(true)
        end
        table.insert(vu511.Tabs, {
            vu577,
            v622
        })
        vu620 = # vu511.Tabs
        vu583.MouseButton1Click:Connect(function()
            vu511.TabSelect = vu620
            local v623, v624, v625 = vu484(vu511.Tabs)
            while true do
                local v626
                v625, v626 = v623(v624, v625)
                if v625 == nil then
                    break
                end
                if v626[1] ~= vu577 then
                    v626[2](false)
                else
                    vu511.TabSelect = v625
                    v626[2](true)
                end
            end
        end)
        function vu576.AddTab(_, p627, p628, p629)
            local v630 = {}
            local vu631 = nil
            if vu575:find("tab") then
                local vu632 = Instance.new("ScrollingFrame")
                local v633 = Instance.new("UIListLayout")
                vu502(vu632)
                vu631 = vu632
                vu632.Name = tostring(p627 or "Main")
                vu632.Name = "MainScrolling"
                vu632.Parent = vu584:WaitForChild("Main")
                vu632.Active = true
                vu632.AnchorPoint = Vector2.new(0.5, 0.5)
                vu632.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                vu632.BackgroundTransparency = 1
                vu632.BorderColor3 = Color3.fromRGB(0, 0, 0)
                vu632.BorderSizePixel = 0
                vu632.ClipsDescendants = false
                vu632.Position = UDim2.new(0.1, 0, 0.1, 0)
                vu632.Size = UDim2.new(0.99500001, 0, 1, 0)
                vu632.ZIndex = 2
                vu632.ScrollBarThickness = 0
                v633.Parent = vu632
                v633.HorizontalAlignment = Enum.HorizontalAlignment.Center
                v633.SortOrder = Enum.SortOrder.LayoutOrder
                v633.Padding = UDim.new(0, 1.5)
                local v634 = Instance.new("Frame")
                local v635 = Instance.new("UIAspectRatioConstraint")
                local v636 = Instance.new("UICorner")
                local vu637 = Instance.new("UIStroke")
                local v638 = Instance.new("UIGradient")
                local vu639 = Instance.new("ImageLabel")
                local vu640 = Instance.new("TextLabel")
                local vu641 = Instance.new("TextLabel")
                local v642 = Instance.new("TextButton")
                v634.Name = tostring(p627 or "Main")
                v634.Parent = vu584:WaitForChild("Search"):WaitForChild("TabFrames")
                v634.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                v634.BorderColor3 = Color3.fromRGB(0, 0, 0)
                v634.BorderSizePixel = 0
                v634.Size = UDim2.new(1, 0, 1, 0)
                v634.ZIndex = 5
                v635.Parent = v634
                v635.AspectRatio = 4.25
                v635.AspectType = Enum.AspectType.ScaleWithParentSize
                v636.CornerRadius = UDim.new(0, 3)
                v636.Parent = v634
                vu637.Transparency = 0.25
                vu637.Color = Color3.fromRGB(128, 0, 128)
                vu637.Parent = v634
                v638.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.5),
                    NumberSequenceKeypoint.new(0.2, 0),
                    NumberSequenceKeypoint.new(0.8, 0),
                    NumberSequenceKeypoint.new(1, 0.5)
                })
                v638.Parent = vu637
                vu639.Name = "TabIcon"
                vu639.Parent = v634
                vu639.AnchorPoint = Vector2.new(0.5, 0.5)
                vu639.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                vu639.BackgroundTransparency = 1
                vu639.BorderColor3 = Color3.fromRGB(0, 0, 0)
                vu639.BorderSizePixel = 0
                vu639.Position = UDim2.new(0.135000005, 0, 0.5, 0)
                vu639.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
                vu639.SizeConstraint = Enum.SizeConstraint.RelativeYY
                vu639.ZIndex = 6
                vu639.Image = "rbxassetid://" .. p628
                vu640.Name = "Text"
                vu640.Parent = v634
                vu640.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                vu640.BackgroundTransparency = 1
                vu640.BorderColor3 = Color3.fromRGB(0, 0, 0)
                vu640.BorderSizePixel = 0
                vu640.Position = UDim2.new(0.246999651, 0, 0.200000003, 0)
                vu640.Size = UDim2.new(0.753000021, 0, 0.400000006, 0)
                vu640.ZIndex = 7
                vu640.Font = Enum.Font.GothamBold
                vu640.Text = p627 or "Main"
                vu640.TextColor3 = Color3.fromRGB(255, 255, 255)
                vu640.TextScaled = true
                vu640.TextSize = 14
                vu640.TextWrapped = true
                vu640.TextXAlignment = Enum.TextXAlignment.Left
                vu641.Name = "Description"
                vu641.Parent = v634
                vu641.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                vu641.BackgroundTransparency = 1
                vu641.BorderColor3 = Color3.fromRGB(0, 0, 0)
                vu641.BorderSizePixel = 0
                vu641.Position = UDim2.new(0.246999651, 0, 0.600000024, 0)
                vu641.Size = UDim2.new(0.753000081, 0, 0.25, 0)
                vu641.ZIndex = 7
                vu641.Font = Enum.Font.GothamBold
                vu641.Text = p629 or "loadstring()()"
                vu641.TextColor3 = Color3.fromRGB(255, 255, 255)
                vu641.TextScaled = true
                vu641.TextSize = 14
                vu641.TextTransparency = 0.5
                vu641.TextWrapped = true
                vu641.TextXAlignment = Enum.TextXAlignment.Left
                v642.Name = "Button"
                v642.Parent = v634
                v642.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v642.BackgroundTransparency = 1
                v642.BorderColor3 = Color3.fromRGB(0, 0, 0)
                v642.BorderSizePixel = 0
                v642.Size = UDim2.new(1, 0, 1, 0)
                v642.ZIndex = 25
                v642.Font = Enum.Font.SourceSans
                v642.Text = ""
                v642.TextColor3 = Color3.fromRGB(0, 0, 0)
                v642.TextSize = 14
                v642.TextTransparency = 1
                local function v644(p643)
                    UDim2.fromScale(0.9, 0.95)
                    if p643 then
                        vu640.TextColor3 = Color3.fromRGB(128, 0, 128)
                        vu486:Create(vu639, TweenInfo.new(0.15), {
                            ImageTransparency = 0
                        }):Play()
                        vu486:Create(vu641, TweenInfo.new(0.15), {
                            TextTransparency = 0.5
                        }):Play()
                        vu486:Create(vu640, TweenInfo.new(0.15), {
                            TextTransparency = 0
                        }):Play()
                        vu486:Create(vu637, TweenInfo.new(0.15), {
                            Transparency = 0.25
                        }):Play()
                        vu486:Create(vu632, TweenInfo.new(0.4), {
                            Position = UDim2.new(0.5, 0, 0.5, 0)
                        }):Play()
                    else
                        vu640.TextColor3 = Color3.fromRGB(255, 255, 255)
                        vu486:Create(vu639, TweenInfo.new(0.15), {
                            ImageTransparency = 0.55
                        }):Play()
                        vu486:Create(vu641, TweenInfo.new(0.15), {
                            TextTransparency = 0.85
                        }):Play()
                        vu486:Create(vu640, TweenInfo.new(0.15), {
                            TextTransparency = 0.55
                        }):Play()
                        vu486:Create(vu637, TweenInfo.new(0.15), {
                            Transparency = 0.65
                        }):Play()
                        vu486:Create(vu632, TweenInfo.new(0.4), {
                            Position = UDim2.fromScale(1.55, 0.5)
                        }):Play()
                    end
                end
                if vu576[1] then
                    v644(false)
                else
                    v644(true)
                end
                table.insert(vu576, {
                    v644,
                    vu639
                })
                v642.MouseButton1Click:Connect(function()
                    local v645, v646, v647 = vu484(vu576)
                    while true do
                        local v648
                        v647, v648 = v645(v646, v647)
                        if v647 == nil then
                            break
                        end
                        if v648[2] ~= vu639 then
                            v648[1](false)
                        else
                            v648[1](true)
                        end
                    end
                end)
            elseif vu575:find("change") then
                vu631 = vu584:FindFirstChild("Main"):FindFirstChild("MainScrolling")
            end
            function v630.AddLabel(_, pu649, p650)
                local vu651 = Instance.new("TextLabel")
                local v652 = Instance.new("UIAspectRatioConstraint")
                vu651.Name = "SectionTitle"
                vu651.Parent = vu631
                vu651.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                vu651.BackgroundTransparency = 1
                vu651.BorderSizePixel = 0
                vu651.Size = UDim2.new(0.980000019, 0, 0.5, 0)
                vu651.ZIndex = 4
                vu651.Font = Enum.Font.GothamBold
                vu651.TextColor3 = Color3.fromRGB(255, 255, 255)
                vu651.TextScaled = true
                vu651.TextSize = 14
                vu651.TextWrapped = true
                vu651.TextXAlignment = Enum.TextXAlignment.Left
                vu651.Text = pu649 .. ": " .. (p650 == "positive" and "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189" or "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
                v652.Parent = vu651
                v652.AspectRatio = 23
                v652.AspectType = Enum.AspectType.ScaleWithParentSize
                return {
                    SetStatus = function(_, p653)
                        vu651.Text = pu649 .. ": " .. (p653 == "positive" and "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189" or "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
                    end,
                    Delete = function(_)
                        vu651:Destroy()
                    end
                }
            end
            function v630.AddSection(_, p654, p655, p656, _)
                local v657 = Instance.new("TextLabel")
                local v658 = Instance.new("UIAspectRatioConstraint")
                local vu659 = {}
                v657.Name = "SectionTitle"
                v657.Parent = vu631
                v657.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v657.BackgroundTransparency = 1
                v657.Size = UDim2.new(0.98, 0, 0.5, 0)
                v657.ZIndex = 4
                v657.Font = Enum.Font.GothamBold
                v657.Text = p654 or "SECTION"
                v657.TextColor3 = Color3.fromRGB(255, 255, 255)
                v657.TextScaled = true
                v657.TextWrapped = true
                v657.TextXAlignment = Enum.TextXAlignment.Left
                v658.Parent = v657
                v658.AspectRatio = 23
                v658.AspectType = Enum.AspectType.ScaleWithParentSize
                local vu660 = Instance.new("Frame")
                local v661 = Instance.new("UICorner")
                local vu662 = Instance.new("UIStroke")
                local vu663 = Instance.new("UIListLayout")
                local v664 = Instance.new("Frame")
                local v665 = Instance.new("UIAspectRatioConstraint")
                local v666 = Instance.new("ImageLabel")
                local v667 = Instance.new("ImageLabel")
                local v668 = Instance.new("TextLabel")
                local v669 = Instance.new("TextLabel")
                local v670 = Instance.new("Frame")
                local v671 = Instance.new("UICorner")
                local function vu673()
                    local v672 = vu663.AbsoluteContentSize.Y
                    vu660.Size = UDim2.new(1, 0, 0, v672 + 10)
                    vu662.Thickness = 1
                end
                local v674 = vu663
                vu663.GetPropertyChangedSignal(v674, "AbsoluteContentSize"):Connect(vu673)
                vu660.ChildAdded:Connect(vu673)
                vu660.ChildRemoved:Connect(vu673)
                vu660.Name = "SectionFrame"
                vu660.Parent = vu631
                vu660.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                vu660.BackgroundTransparency = 0.6
                vu660.Size = UDim2.new(1, - 10, 0, 65)
                vu660.ZIndex = 4
                vu660.ClipsDescendants = true
                vu673()
                v661.Parent = vu660
                vu662.Color = Color3.fromRGB(128, 0, 128)
                vu662.Transparency = 0.9
                vu662.Parent = vu660
                vu662.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                vu663.Parent = vu660
                vu663.HorizontalAlignment = Enum.HorizontalAlignment.Center
                vu663.SortOrder = Enum.SortOrder.LayoutOrder
                vu663.Padding = UDim.new(0, 5)
                v664.Name = "Header"
                v664.Parent = vu660
                v664.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v664.BackgroundTransparency = 1
                v664.Size = UDim2.new(0.95, 0, 0.5, 0)
                v664.ZIndex = 5
                v665.Parent = v664
                v665.AspectRatio = 4
                v665.AspectType = Enum.AspectType.ScaleWithParentSize
                v666.Name = "SectionIcon"
                v666.Parent = v664
                v666.AnchorPoint = Vector2.new(0, 0.5)
                v666.BackgroundTransparency = 1
                v666.Position = UDim2.new(0.05, 0, 0.4, 0)
                v666.Size = UDim2.new(0.5, 0, 0.5, 0)
                v666.SizeConstraint = Enum.SizeConstraint.RelativeYY
                v666.ZIndex = 6
                v666.Image = "rbxassetid://119522694447910"
                v667.Name = "SectionIcon"
                v667.Parent = v664
                v667.AnchorPoint = Vector2.new(0.5, 0.7)
                v667.BackgroundTransparency = 1
                v667.Position = UDim2.new(0.95, 0, 0.6, 0)
                v667.Size = UDim2.new(0.5, 0, 0.5, 0)
                v667.SizeConstraint = Enum.SizeConstraint.RelativeYY
                v667.ZIndex = 6
                v667.Image = "rbxassetid://"
                v668.Name = "SectionHeadTest"
                v668.Parent = v664
                v668.BackgroundTransparency = 1
                v668.Position = UDim2.new(0.22, 0, 0.095, 0)
                v668.Size = UDim2.new(0.7, 0, 0.195, 0)
                v668.ZIndex = 5
                v668.Font = Enum.Font.GothamBold
                v668.Text = p655 or "Data Settings"
                v668.TextColor3 = Color3.fromRGB(255, 255, 255)
                v668.TextScaled = true
                v668.TextWrapped = true
                v668.TextXAlignment = Enum.TextXAlignment.Left
                v669.Name = "SectionDescription"
                v669.Parent = v664
                v669.BackgroundTransparency = 1
                v669.Position = UDim2.new(0.22, 0, 0.255, 0)
                v669.Size = UDim2.new(0.7, 0, 0.495, 0)
                v669.ZIndex = 5
                v669.Font = Enum.Font.GothamBold
                v669.Text = p656 or "Save The Setting"
                v669.TextColor3 = Color3.fromRGB(255, 255, 255)
                v669.TextSize = 11
                v669.TextTransparency = 0.5
                v669.TextWrapped = true
                v669.TextXAlignment = Enum.TextXAlignment.Left
                v670.Parent = v664
                v670.AnchorPoint = Vector2.new(0.5, 0.5)
                v670.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
                v670.BackgroundTransparency = 0.6
                v670.Position = UDim2.new(0.5, 0, 0.9, 0)
                v670.Size = UDim2.new(0.95, 0, 0.02, 0)
                v670.ZIndex = 5
                v671.CornerRadius = UDim.new(0.5, 0)
                v671.Parent = v670
                function vu659.Update(_)
                    vu673()
                end
                function vu659.AddLabel(_, p675)
                    local vu676 = Instance.new("TextLabel")
                    local v677 = Instance.new("UIAspectRatioConstraint")
                    local v678 = {}
                    vu676.Name = "SectionTitle"
                    vu676.Parent = vu660
                    vu676.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu676.BackgroundTransparency = 1
                    vu676.BorderSizePixel = 0
                    vu676.Size = UDim2.new(0.92, 0, 0.5, 0)
                    vu676.ZIndex = 4
                    vu676.Font = Enum.Font.GothamBold
                    vu676.Text = p675 or "SECTION"
                    vu676.TextColor3 = Color3.fromRGB(255, 255, 255)
                    vu676.TextTransparency = 0.5
                    vu676.TextScaled = false
                    vu676.TextSize = 12
                    vu676.TextWrapped = true
                    vu676.TextXAlignment = Enum.TextXAlignment.Left
                    v677.Parent = vu676
                    v677.AspectRatio = 23
                    v677.AspectType = Enum.AspectType.ScaleWithParentSize
                    function v678.Set(_, p679)
                        vu676.Text = tostring(p679)
                    end
                    function v678.Delete(_)
                        vu676:Destroy()
                        vu673()
                    end
                    vu659:Update()
                    return v678
                end
                function vu659.AddSeperator(_, p680)
                    local v681 = Instance.new("Frame")
                    local v682 = Instance.new("Frame")
                    local v683 = Instance.new("TextLabel")
                    local v684 = Instance.new("Frame")
                    local v685 = Instance.new("TextLabel")
                    local v686 = Instance.new("TextLabel")
                    local v687 = Instance.new("UIStroke")
                    local v688 = Instance.new("UICorner")
                    v681.Name = "Seperator"
                    v681.Parent = vu660
                    v681.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    v681.BorderSizePixel = 0
                    v681.BackgroundTransparency = 1
                    v681.ZIndex = 4
                    v681.Size = UDim2.new(0.9, 0, 0, 30)
                    v688.CornerRadius = UDim.new(0.4, 0)
                    v688.Parent = v681
                    v687.Color = Color3.fromRGB(128, 0, 128)
                    v687.Transparency = 0.5
                    v687.Parent = v681
                    v687.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    v682.Name = "Sep1"
                    v682.Parent = v681
                    v682.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
                    v682.BackgroundTransparency = 0
                    v682.ZIndex = 10
                    v682.BorderSizePixel = 0
                    v682.ZIndex = 6
                    v682.Position = UDim2.new(0, 10, 0, 10)
                    v682.Size = UDim2.new(0, 90, 0, 2)
                    v682.Visible = false
                    v683.Name = "Sep2"
                    v683.Parent = v681
                    v683.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v683.BackgroundTransparency = 1
                    v683.AnchorPoint = Vector2.new(0.5, 0.5)
                    v683.Position = UDim2.new(0.5, 0, 0.5, 0)
                    v683.Size = UDim2.new(0.95, 0, 0, 30)
                    v683.Font = Enum.Font.SourceSansBold
                    v683.Text = p680
                    v683.RichText = true
                    v683.ZIndex = 6
                    v683.TextColor3 = Color3.fromRGB(255, 255, 255)
                    v683.TextTransparency = 0.5
                    v683.TextSize = 18
                    v685.Name = "Sep2"
                    v685.Parent = v681
                    v685.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v685.BackgroundTransparency = 1
                    v685.Position = UDim2.new(0, 0, 0, 0)
                    v685.Size = UDim2.new(0.3385, 0, 0, 30)
                    v685.Font = Enum.Font.SourceSansBold
                    v685.Text = "<<"
                    v685.RichText = true
                    v685.ZIndex = 6
                    v685.TextColor3 = Color3.fromRGB(128, 0, 128)
                    v685.TextSize = 20
                    v686.Name = "Sep2"
                    v686.Parent = v681
                    v686.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v686.BackgroundTransparency = 1
                    v686.Position = UDim2.new(0, 0, 0, 0)
                    v686.AnchorPoint = Vector2.new(1, 0.5)
                    v686.Position = UDim2.new(0.8, 0, 0.5, 0)
                    v686.Font = Enum.Font.SourceSansBold
                    v686.Text = ">>"
                    v686.RichText = true
                    v686.ZIndex = 6
                    v686.TextColor3 = Color3.fromRGB(128, 0, 128)
                    v686.TextSize = 20
                    v684.Name = "Sep3"
                    v684.Parent = v681
                    v684.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
                    v684.BackgroundTransparency = 0.1
                    v684.BorderSizePixel = 0
                    v684.ZIndex = 6
                    v684.Visible = false
                    v684.Position = UDim2.new(0, 280, 0, 10)
                    v684.Size = UDim2.new(0, 90, 0, 2)
                end
                function vu659.addLabel(_, p689)
                    local vu690 = Instance.new("TextLabel")
                    local v691 = Instance.new("UIPadding")
                    local v692 = {}
                    vu690.Name = "Label"
                    vu690.Parent = vu660
                    vu690.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu690.BackgroundTransparency = 1
                    vu690.Size = UDim2.new(0, 270, 0, 20)
                    vu690.Font = Enum.Font.GothamBold
                    vu690.TextColor3 = Color3.fromRGB(225, 225, 225)
                    vu690.TextTransparency = 0.5
                    vu690.TextSize = 10
                    vu690.Text = p689
                    vu690.ZIndex = 5
                    vu690.TextXAlignment = Enum.TextXAlignment.Left
                    v691.PaddingLeft = UDim.new(0, 10)
                    v691.Parent = vu690
                    v691.Name = "PaddingLabel"
                    function v692.Set(_, p693)
                        vu690.Text = p693
                    end
                    return v692
                end
                function vu659.Textbox(_, p694, p695, pu696)
                    local v697 = Instance.new("Frame")
                    v697.Name = "Input"
                    v697.Parent = vu660
                    v697.BorderSizePixel = 0
                    v697.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    v697.Size = UDim2.new(0.94, 0, 0, 30)
                    v697.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    v697.ZIndex = 6
                    local v698 = Instance.new("UIStroke")
                    v698.Color = Color3.fromRGB(255, 255, 255)
                    v698.Thickness = 1
                    v698.Transparency = 0.95
                    v698.Name = "UiToggle_UiStroke1"
                    v698.Parent = v697
                    local v699 = Instance.new("UICorner")
                    v699.Parent = v697
                    v699.CornerRadius = UDim.new(0, 2)
                    local v700 = Instance.new("TextLabel")
                    v700.Name = "Title"
                    v700.Parent = v697
                    v700.BorderSizePixel = 0
                    v700.TextXAlignment = Enum.TextXAlignment.Left
                    v700.TextTransparency = 0.2
                    v700.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v700.TextSize = 12
                    v700.Font = Enum.Font.GothamBold
                    v700.TextColor3 = Color3.fromRGB(255, 255, 255)
                    v700.BackgroundTransparency = 1
                    v700.Size = UDim2.new(2, 0, 1, 0)
                    v700.Position = UDim2.new(0.02, 0, 0, 0)
                    v700.Text = p694
                    v700.ZIndex = 6
                    local vu701 = Instance.new("TextBox")
                    vu701.Name = "TextBox"
                    vu701.Parent = v697
                    vu701.CursorPosition = - 1
                    vu701.TextColor3 = Color3.fromRGB(255, 255, 255)
                    vu701.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
                    vu701.BorderSizePixel = 0
                    vu701.TextTransparency = 0.2
                    vu701.TextSize = 10
                    vu701.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                    vu701.Font = Enum.Font.GothamBold
                    vu701.ClipsDescendants = true
                    vu701.AnchorPoint = Vector2.new(1, 0)
                    vu701.PlaceholderText = p695 .. "....."
                    vu701.Size = UDim2.new(0, 150, 0, 25)
                    vu701.Position = UDim2.new(1, - 8, 0, 2)
                    vu701.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu701.Text = ""
                    vu701.ZIndex = 6
                    local v702 = Instance.new("UICorner")
                    v702.Parent = vu701
                    v702.CornerRadius = UDim.new(0, 8)
                    vu701.FocusLost:Connect(function(p703)
                        if p703 then
                            pu696(vu701.Text)
                        end
                    end)
                end
                function vu659.Toggle1(_, p704, pu705, pu706)
                    local vu707 = Instance.new("Frame")
                    local v708 = Instance.new("UIAspectRatioConstraint")
                    local v709 = Instance.new("Frame")
                    local v710 = Instance.new("UICorner")
                    local vu711 = Instance.new("TextLabel")
                    local v712 = Instance.new("Frame")
                    local v713 = Instance.new("UICorner")
                    local vu714 = Instance.new("ImageLabel")
                    local vu715 = Instance.new("Frame")
                    local v716 = Instance.new("UIGradient")
                    local v717 = Instance.new("UICorner")
                    vu707.Name = "Toggle"
                    vu707.Parent = vu660
                    vu707.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu707.BackgroundTransparency = 1
                    vu707.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu707.BorderSizePixel = 0
                    vu707.Size = UDim2.new(0.980000019, 0, 0.5, 0)
                    vu707.ZIndex = 5
                    v708.Parent = vu707
                    v708.AspectRatio = 11.5
                    v708.AspectType = Enum.AspectType.ScaleWithParentSize
                    v709.Name = "MainFrame"
                    v709.Parent = vu707
                    v709.AnchorPoint = Vector2.new(0.5, 0)
                    v709.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v709.BackgroundTransparency = 1
                    v709.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    v709.BorderSizePixel = 0
                    v709.Position = UDim2.new(0.5, 0, 0, 0)
                    v709.Size = UDim2.new(0.949999988, 0, 1, 0)
                    v709.ZIndex = 6
                    v710.CornerRadius = UDim.new(0, 3)
                    v710.Parent = v709
                    vu711.Name = "Text"
                    vu711.Parent = v709
                    vu711.AnchorPoint = Vector2.new(0.5, 0.5)
                    vu711.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu711.BackgroundTransparency = 1
                    vu711.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu711.BorderSizePixel = 0
                    vu711.Position = UDim2.new(0.531999981, 0, 0.5, 0)
                    vu711.Size = UDim2.new(1.12300003, 0, 0.524999976, 0)
                    vu711.ZIndex = 6
                    vu711.Font = Enum.Font.GothamBold
                    vu711.Text = p704 or "Auto Fuck"
                    vu711.TextColor3 = Color3.fromRGB(255, 255, 255)
                    vu711.TextScaled = true
                    vu711.TextSize = 14
                    vu711.TextWrapped = true
                    vu711.TextXAlignment = Enum.TextXAlignment.Left
                    v712.Name = "System"
                    v712.Parent = v709
                    v712.AnchorPoint = Vector2.new(0.5, 0.5)
                    v712.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    v712.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    v712.BorderSizePixel = 0
                    v712.BackgroundTransparency = 1
                    v712.Position = UDim2.new(10.0419999994, 0, 0.5, 0)
                    v712.Size = UDim2.new(0.824999988, 0, 0.824999988, 0)
                    v712.SizeConstraint = Enum.SizeConstraint.RelativeYY
                    v712.ZIndex = 6
                    v713.CornerRadius = UDim.new(0, 3)
                    v713.Parent = v712
                    vu714.Name = "TurnOn"
                    vu714.Parent = v712
                    vu714.AnchorPoint = Vector2.new(0.5, 0.5)
                    vu714.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu714.BackgroundTransparency = 1
                    vu714.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu714.BorderSizePixel = 0
                    vu714.Position = UDim2.new(0.5, 0, 0.5, 0)
                    vu714.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
                    vu714.ZIndex = 7
                    vu714.Image = "rbxassetid://3944680095"
                    vu714.ImageColor3 = Color3.fromRGB(0, 0, 0)
                    vu714.ImageTransparency = 1
                    vu715.Name = "Box"
                    vu715.Parent = v712
                    vu715.AnchorPoint = Vector2.new(0.5, 0.5)
                    vu715.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu715.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu715.BorderSizePixel = 0
                    vu715.Position = UDim2.new(0.5, 0, 0.5, 0)
                    vu715.ZIndex = 6
                    v716.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, vu492.Config.MainColor),
                        ColorSequenceKeypoint.new(1, vu492.Config.DropColor)
                    })
                    v716.Rotation = 45
                    v716.Parent = vu715
                    v717.CornerRadius = UDim.new(0, 4)
                    v717.Parent = vu715
                    local function vu719(p718)
                        if p718 then
                            vu486:Create(vu714, TweenInfo.new(0.4), {
                                ImageTransparency = 0
                            }):Play()
                            vu486:Create(vu715, TweenInfo.new(0.3), {
                                Size = UDim2.fromScale(1, 1)
                            }):Play()
                            vu486:Create(vu714, TweenInfo.new(0.55), {
                                ImageColor3 = vu492.Config.MainColor
                            }):Play()
                        else
                            vu486:Create(vu714, TweenInfo.new(0.4), {
                                ImageTransparency = 1
                            }):Play()
                            vu486:Create(vu715, TweenInfo.new(0.3), {
                                Size = UDim2.fromScale(0, 0)
                            }):Play()
                            vu486:Create(vu714, TweenInfo.new(0.555), {
                                ImageColor3 = Color3.fromRGB(0, 0, 0)
                            }):Play()
                        end
                    end
                    vu719(pu705)
                    vu496(v709).MouseButton1Click:Connect(function()
                        pu705 = not pu705
                        vu719(pu705)
                        if pu706 then
                            pu706(pu705)
                        end
                    end)
                    vu659:Update()
                    return {
                        Text = function(_, ...)
                            vu711.Text = tostring(...)
                        end,
                        Value = function(_, p720)
                            pu705 = p720
                            vu719(p720)
                            if pu706 then
                                pu706(pu705)
                            end
                        end,
                        Delete = function(_)
                            vu707:Destroy()
                            vu673()
                        end
                    }
                end
                function vu659.AddToggle1(_, p721, pu722, pu723)
                    local v724 = Instance.new("Frame")
                    local v725 = Instance.new("UICorner")
                    local v726 = Instance.new("TextButton")
                    local v727 = Instance.new("TextLabel")
                    local v728 = Instance.new("Frame")
                    local v729 = Instance.new("UICorner")
                    local vu730 = Instance.new("ImageLabel")
                    local v731 = Instance.new("UICorner")
                    local v732 = Instance.new("UIGradient")
                    local v733 = Instance.new("UIAspectRatioConstraint")
                    v724.Name = "Toggle"
                    v724.Parent = vu660
                    v724.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    v724.BackgroundTransparency = 1
                    v724.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    v724.BorderSizePixel = 0
                    v724.Size = UDim2.new(0.980000019, 0, 0.5, 0)
                    v724.ZIndex = 5
                    v733.Parent = v724
                    v733.AspectRatio = 11.5
                    v733.AspectType = Enum.AspectType.ScaleWithParentSize
                    v725.CornerRadius = UDim.new(0, 3)
                    v725.Name = "UICorner_Toggle"
                    v725.Parent = v724
                    v726.Name = "Toggle_Click"
                    v726.Parent = v724
                    v726.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v726.BackgroundTransparency = 1
                    v726.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    v726.BorderSizePixel = 0
                    v726.Size = UDim2.new(1, 0, 1, 0)
                    v726.Font = Enum.Font.SourceSans
                    v726.Text = ""
                    v726.TextColor3 = Color3.fromRGB(0, 0, 0)
                    v726.TextSize = 1
                    v726.ZIndex = 6
                    v727.Name = "Toggle_Text"
                    v727.Parent = v724
                    v727.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v727.BackgroundTransparency = 1
                    v727.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    v727.BorderSizePixel = 0
                    v727.Position = UDim2.new(0.14399981, 0, 0.32, 0)
                    v727.Size = UDim2.new(1.13500003, 0, 0.424999976, 0)
                    v727.Font = Enum.Font.GothamBold
                    v727.Text = p721
                    v727.TextColor3 = Color3.fromRGB(255, 255, 255)
                    v727.TextSize = 14
                    v727.TextXAlignment = Enum.TextXAlignment.Left
                    v727.ZIndex = 6
                    v727.TextScaled = true
                    v728.Name = "Toggle_Icon"
                    v728.Parent = v724
                    v728.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
                    v728.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    v728.BorderSizePixel = 0
                    v728.Position = UDim2.new(0.035, 0, 0.181818187, 0)
                    v728.Size = UDim2.new(0, 25, 0, 23)
                    v728.ZIndex = 6
                    v729.CornerRadius = UDim.new(0, 3)
                    v729.Name = "UICorner_Toggle2"
                    v729.Parent = v728
                    vu730.Parent = v728
                    vu730.AnchorPoint = Vector2.new(0.5, 0.5)
                    vu730.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
                    vu730.BackgroundTransparency = 1
                    vu730.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu730.BorderSizePixel = 0
                    vu730.Position = UDim2.new(0.519999981, 0, 0.550000012, 0)
                    vu730.Size = UDim2.new(0, 30, 0, 30)
                    vu730.Image = "http://www.roblox.com/asset/?id=6031068421"
                    vu730.ImageColor3 = Color3.fromRGB(128, 0, 128)
                    vu730.Visible = false
                    vu730.ZIndex = 6
                    v731.CornerRadius = UDim.new(0, 3)
                    v731.Name = "UICorner_Toggle2"
                    v731.Parent = vu730
                    v732.Parent = vu730
                    if pu722 == true then
                        pu722 = true
                        vu730.Visible = true
                        pcall(pu723, pu722)
                    end
                    v726.MouseButton1Click:Connect(function()
                        if pu722 then
                            pu722 = false
                            vu730.Visible = false
                        else
                            pu722 = true
                            vu730.Visible = true
                        end
                        pcall(pu723, pu722)
                    end)
                end
                function vu659.AddToggle(_, p734, pu735, pu736)
                    local vu737 = Instance.new("Frame")
                    local v738 = Instance.new("UIAspectRatioConstraint")
                    local v739 = Instance.new("Frame")
                    local v740 = Instance.new("UICorner")
                    local vu741 = Instance.new("TextLabel")
                    local v742 = Instance.new("Frame")
                    local v743 = Instance.new("UICorner")
                    local vu744 = Instance.new("ImageLabel")
                    local vu745 = Instance.new("Frame")
                    local v746 = Instance.new("UIGradient")
                    local v747 = Instance.new("UICorner")
                    vu737.Name = "Toggle"
                    vu737.Parent = vu660
                    vu737.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu737.BackgroundTransparency = 1
                    vu737.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu737.BorderSizePixel = 0
                    vu737.Size = UDim2.new(0.980000019, 0, 0.5, 0)
                    vu737.ZIndex = 4
                    v738.Parent = vu737
                    v738.AspectRatio = 11.5
                    v738.AspectType = Enum.AspectType.ScaleWithParentSize
                    v739.Name = "MainFrame"
                    v739.Parent = vu737
                    v739.AnchorPoint = Vector2.new(0.5, 0)
                    v739.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v739.BackgroundTransparency = 1
                    v739.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    v739.BorderSizePixel = 0
                    v739.Position = UDim2.new(0.5, 0, 0, 0)
                    v739.Size = UDim2.new(0.949999988, 0, 1, 0)
                    v739.ZIndex = 5
                    v740.CornerRadius = UDim.new(0, 3)
                    v740.Parent = v739
                    vu741.Name = "Text"
                    vu741.Parent = v739
                    vu741.AnchorPoint = Vector2.new(0.5, 0.5)
                    vu741.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu741.BackgroundTransparency = 1
                    vu741.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu741.BorderSizePixel = 0
                    vu741.Position = UDim2.new(0.681999981, 0, 0.5, 0)
                    vu741.Size = UDim2.new(1.12300003, 0, 0.524999976, 0)
                    vu741.ZIndex = 5
                    vu741.Font = Enum.Font.GothamBold
                    vu741.Text = p734 or "Auto Fuck"
                    vu741.TextColor3 = Color3.fromRGB(255, 255, 255)
                    vu741.TextScaled = true
                    vu741.TextSize = 14
                    vu741.TextWrapped = true
                    vu741.TextXAlignment = Enum.TextXAlignment.Left
                    v742.Name = "System"
                    v742.Parent = v739
                    v742.AnchorPoint = Vector2.new(0.5, 0.5)
                    v742.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    v742.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    v742.BorderSizePixel = 0
                    v742.Position = UDim2.new(0.0419999994, 0, 0.5, 0)
                    v742.Size = UDim2.new(0.824999988, 0, 0.824999988, 0)
                    v742.SizeConstraint = Enum.SizeConstraint.RelativeYY
                    v742.ZIndex = 5
                    v743.CornerRadius = UDim.new(0, 3)
                    v743.Parent = v742
                    vu744.Name = "TurnOn"
                    vu744.Parent = v742
                    vu744.AnchorPoint = Vector2.new(0.5, 0.5)
                    vu744.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu744.BackgroundTransparency = 1
                    vu744.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu744.BorderSizePixel = 0
                    vu744.Position = UDim2.new(0.5, 0, 0.5, 0)
                    vu744.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
                    vu744.ZIndex = 6
                    vu744.Image = "rbxassetid://3944680095"
                    vu744.ImageColor3 = Color3.fromRGB(0, 0, 0)
                    vu744.ImageTransparency = 1
                    vu745.Name = "Box"
                    vu745.Parent = v742
                    vu745.AnchorPoint = Vector2.new(0.5, 0.5)
                    vu745.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu745.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu745.BorderSizePixel = 0
                    vu745.Position = UDim2.new(0.5, 0, 0.5, 0)
                    vu745.ZIndex = 5
                    v746.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, vu492.Config.MainColor),
                        ColorSequenceKeypoint.new(1, vu492.Config.DropColor)
                    })
                    v746.Rotation = 45
                    v746.Parent = vu745
                    v747.CornerRadius = UDim.new(0, 4)
                    v747.Parent = vu745
                    local function vu749(p748)
                        if p748 then
                            vu486:Create(vu744, TweenInfo.new(0.4), {
                                ImageTransparency = 0
                            }):Play()
                            vu486:Create(vu745, TweenInfo.new(0.3), {
                                Size = UDim2.fromScale(1, 1)
                            }):Play()
                            vu486:Create(vu744, TweenInfo.new(0.55), {
                                ImageColor3 = vu492.Config.MainColor
                            }):Play()
                        else
                            vu486:Create(vu744, TweenInfo.new(0.4), {
                                ImageTransparency = 1
                            }):Play()
                            vu486:Create(vu745, TweenInfo.new(0.3), {
                                Size = UDim2.fromScale(0, 0)
                            }):Play()
                            vu486:Create(vu744, TweenInfo.new(0.555), {
                                ImageColor3 = Color3.fromRGB(0, 0, 0)
                            }):Play()
                        end
                    end
                    vu749(pu735)
                    vu496(v739).MouseButton1Click:Connect(function()
                        pu735 = not pu735
                        vu749(pu735)
                        if pu736 then
                            pu736(pu735)
                        end
                    end)
                    if pu735 == true then
                        pu735 = true
                        vu749(pu735)
                        pcall(pu736, pu735)
                    end
                    vu659:Update()
                    return {
                        Text = function(_, ...)
                            vu741.Text = tostring(...)
                        end,
                        Value = function(_, p750)
                            pu735 = p750
                            vu749(p750)
                            if pu736 then
                                pu736(pu735)
                            end
                        end,
                        Delete = function(_)
                            vu737:Destroy()
                            vu673()
                        end
                    }
                end
                function vu659.MultiDropdown(_, p751, p752, pu753, pu754)
                    local vu755 = pu753 or {}
                    local vu756 = false
                    local vu757 = Instance.new("Frame")
                    local v758 = Instance.new("UICorner")
                    local vu759 = Instance.new("TextLabel")
                    local v760 = Instance.new("TextLabel")
                    local vu761 = Instance.new("ScrollingFrame")
                    local v762 = Instance.new("UIListLayout")
                    local v763 = Instance.new("UIPadding")
                    local v764 = Instance.new("TextButton")
                    local vu765 = Instance.new("ImageLabel")
                    vu757.Name = "Dropdown"
                    vu757.Parent = vu660
                    vu757.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    vu757.ClipsDescendants = true
                    vu757.Size = UDim2.new(0.94, 0, 0, 30)
                    vu757.ZIndex = 6
                    v758.CornerRadius = UDim.new(0, 3)
                    v758.Parent = vu757
                    v760.Name = "DropTitle1"
                    v760.Parent = vu757
                    v760.BackgroundTransparency = 1
                    v760.Size = UDim2.new(0.9, 0, 0, 20)
                    v760.Font = Enum.Font.GothamBold
                    v760.Text = "  " .. p751
                    v760.TextColor3 = Color3.fromRGB(225, 225, 225)
                    v760.TextSize = 12
                    v760.TextXAlignment = Enum.TextXAlignment.Left
                    v760.ZIndex = 6
                    vu759.Name = "DropTitle"
                    vu759.Parent = vu757
                    vu759.BackgroundTransparency = 1
                    vu759.Size = UDim2.new(0.9, 0, 0, 38)
                    vu759.Font = Enum.Font.GothamBold
                    vu759.TextColor3 = Color3.fromRGB(190, 190, 190)
                    vu759.TextSize = 9
                    vu759.TextXAlignment = Enum.TextXAlignment.Left
                    vu759.ZIndex = 6
                    vu759.TextScaled = false
                    vu761.Name = "DropScroll"
                    vu761.Parent = vu759
                    vu761.Active = true
                    vu761.BackgroundTransparency = 1
                    vu761.Position = UDim2.new(0, 0, 0, 31)
                    vu761.Size = UDim2.new(0.99, 0, 0, 150)
                    vu761.CanvasSize = UDim2.new(0, 0, 0, 0)
                    vu761.ScrollBarThickness = 20
                    vu761.ZIndex = 6
                    v762.Parent = vu761
                    v762.SortOrder = Enum.SortOrder.LayoutOrder
                    v762.Padding = UDim.new(0, 5)
                    v763.Parent = vu761
                    v763.PaddingLeft = UDim.new(0, 5)
                    v763.PaddingTop = UDim.new(0, 5)
                    vu765.Name = "DropImage"
                    vu765.Parent = vu757
                    vu765.BackgroundTransparency = 1
                    vu765.Position = UDim2.new(0.9, 0, 0, 6)
                    vu765.Rotation = 180
                    vu765.Size = UDim2.new(0, 20, 0, 20)
                    vu765.Image = "rbxassetid://10734963191"
                    vu765.ZIndex = 6
                    v764.Name = "DropButton"
                    v764.Parent = vu757
                    v764.BackgroundTransparency = 1
                    v764.Size = UDim2.new(0.95, 0, 0, 31)
                    v764.Font = Enum.Font.GothamBold
                    v764.Text = ""
                    v764.ZIndex = 6
                    local function vu766()
                        if # vu755 <= 0 then
                            return (not pu753 or # pu753 <= 0) and "   Select Multiple: " or "   " .. "Select Multiple: " .. table.concat(pu753, ", ")
                        else
                            return "   " .. "Select Multiple: " .. table.concat(vu755, ", ")
                        end
                    end
                    local vu767
                    if pu753 then
                        vu755 = pu753
                        vu767 = vu755
                    else
                        vu755 = {}
                        vu767 = vu755
                    end
                    vu759.Text = vu766()
                    local v768, v769, v770 = vu484(p752)
                    while true do
                        local vu771
                        v770, vu771 = v768(v769, v770)
                        if v770 == nil then
                            break
                        end
                        local vu772 = Instance.new("TextButton")
                        local v773 = Instance.new("UICorner")
                        vu772.Name = "Item"
                        vu772.Parent = vu761
                        vu772.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                        vu772.Size = UDim2.new(0.99, 0, 0, 20)
                        vu772.Font = Enum.Font.GothamBold
                        vu772.Text = tostring(vu771)
                        vu772.TextColor3 = Color3.fromRGB(225, 225, 225)
                        vu772.TextSize = 13
                        vu772.ZIndex = 6
                        v773.CornerRadius = UDim.new(0, 4)
                        v773.Parent = vu772
                        if table.find(vu767, vu771) then
                            vu772.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                        end
                        vu772.MouseButton1Click:Connect(function()
                            if table.find(vu767, vu771) then
                                table.remove(vu767, table.find(vu767, vu771))
                                vu772.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                            else
                                table.insert(vu767, vu771)
                                vu772.BackgroundColor3 = Color3.fromRGB(0, 50, 0)
                            end
                            vu759.Text = vu766()
                            pu754(vu767)
                        end)
                    end
                    vu761.CanvasSize = UDim2.new(0, 0, 0, v762.AbsoluteContentSize.Y + 5)
                    v764.MouseButton1Click:Connect(function()
                        if vu756 then
                            vu756 = false
                            vu757:TweenSize(UDim2.new(0.94, 0, 0, 30), "Out", "Quad", 0.3, true)
                            vu765.Rotation = 180
                        else
                            vu756 = true
                            vu757:TweenSize(UDim2.new(0.94, 0, 0, 181), "Out", "Quad", 0.3, true)
                            vu765.Rotation = 0
                        end
                    end)
                    return {
                        Add = function(_, pu774)
                            local vu775 = Instance.new("TextButton")
                            local v776 = Instance.new("UICorner")
                            vu775.Name = "Item"
                            vu775.Parent = vu761
                            vu775.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                            vu775.Size = UDim2.new(0.99, 0, 0, 20)
                            vu775.Font = Enum.Font.GothamBold
                            vu775.Text = tostring(pu774)
                            vu775.TextColor3 = Color3.fromRGB(225, 225, 225)
                            vu775.TextSize = 13
                            vu775.ZIndex = 6
                            v776.CornerRadius = UDim.new(0, 4)
                            v776.Parent = vu775
                            vu775.MouseButton1Click:Connect(function()
                                if table.find(vu767, pu774) then
                                    table.remove(vu767, table.find(vu767, pu774))
                                    vu775.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                                else
                                    table.insert(vu767, pu774)
                                    vu775.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                                end
                                vu759.Text = vu766()
                                pu754(vu767)
                            end)
                        end,
                        Clear = function()
                            vu767 = {}
                            vu759.Text = "   Select Multiple : "
                            local v777, v778, v779 = vu484(vu761:GetChildren())
                            while true do
                                local v780
                                v779, v780 = v777(v778, v779)
                                if v779 == nil then
                                    break
                                end
                                if v780:IsA("TextButton") then
                                    v780.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                                end
                            end
                            pu754(vu767)
                        end
                    }
                end
                function vu659.AddDropdown(_, pu781, pu782, pu783, pu784)
                    local vu785 = Instance.new("Frame")
                    local v786 = Instance.new("UICorner")
                    local v787 = Instance.new("UICorner")
                    local vu788 = Instance.new("TextLabel")
                    local vu789 = Instance.new("ScrollingFrame")
                    local v790 = Instance.new("UIListLayout")
                    local v791 = Instance.new("UIPadding")
                    local v792 = Instance.new("TextButton")
                    local vu793 = Instance.new("ImageLabel")
                    Instance.new("UIStroke")
                    Instance.new("TextBox")
                    vu785.Name = "Dropdown"
                    vu785.Parent = vu660
                    vu785.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    vu785.BackgroundTransparency = 0
                    vu785.ClipsDescendants = true
                    vu785.Size = UDim2.new(0.94, 0, 0, 30)
                    vu785.ZIndex = 6
                    local v794 = Instance.new("UIStroke")
                    v794.Color = Color3.fromRGB(255, 255, 255)
                    v794.Thickness = 1
                    v794.Transparency = 0.95
                    v794.Name = "UiToggle_UiStroke1"
                    v794.Parent = vu785
                    v786.CornerRadius = UDim.new(0, 3)
                    v786.Parent = vu785
                    function getpro()
                        if not pu783 then
                            return "   " .. pu781 .. " : "
                        end
                        if not table.find(pu782, pu783) then
                            return "   " .. pu781 .. " : "
                        end
                        pu784(pu783)
                        return "   " .. pu781 .. " : " .. pu783
                    end
                    vu788.Name = "DropTitle"
                    vu788.Parent = vu785
                    vu788.BackgroundColor3 = Color3.fromRGB(224, 224, 224)
                    vu788.BackgroundTransparency = 1
                    vu788.Size = UDim2.new(0.9, 0, 0, 31)
                    vu788.Font = Enum.Font.GothamBold
                    vu788.Text = getpro()
                    vu788.TextColor3 = Color3.fromRGB(225, 225, 225)
                    vu788.TextSize = 12
                    vu788.TextXAlignment = Enum.TextXAlignment.Left
                    vu788.ZIndex = 6
                    vu789.Name = "DropScroll"
                    vu789.Parent = vu788
                    vu789.Active = true
                    vu789.BackgroundColor3 = Color3.fromRGB(224, 224, 224)
                    vu789.BackgroundTransparency = 1
                    vu789.BorderSizePixel = 0
                    vu789.Position = UDim2.new(0, 0, 0, 31)
                    vu789.Size = UDim2.new(0.99, 0, 0, 150)
                    vu789.CanvasSize = UDim2.new(0, 0, 0, 0)
                    vu789.ScrollBarThickness = 20
                    vu789.ZIndex = 6
                    v790.Parent = vu789
                    v790.SortOrder = Enum.SortOrder.LayoutOrder
                    v790.Padding = UDim.new(0, 5)
                    v791.Parent = vu789
                    v791.PaddingLeft = UDim.new(0, 5)
                    v791.PaddingTop = UDim.new(0, 5)
                    vu793.Name = "DropImage"
                    vu793.Parent = vu785
                    vu793.BackgroundColor3 = Color3.fromRGB(224, 224, 224)
                    vu793.BackgroundTransparency = 1
                    vu793.Position = UDim2.new(0.9, 0, 0, 6)
                    vu793.Rotation = 180
                    vu793.Size = UDim2.new(0, 20, 0, 20)
                    vu793.Image = "rbxassetid://10734963191"
                    vu793.ZIndex = 6
                    v792.Name = "DropButton"
                    v792.Parent = vu785
                    v792.BackgroundColor3 = Color3.fromRGB(224, 224, 224)
                    v792.BackgroundTransparency = 1
                    v792.Size = UDim2.new(0.95, 0, 0, 31)
                    v792.Font = Enum.Font.GothamBold
                    v792.Text = ""
                    v792.TextColor3 = Color3.fromRGB(0, 0, 0)
                    v792.TextSize = 14
                    v792.ZIndex = 6
                    local v795 = next
                    local v796 = nil
                    local vu797 = false
                    while true do
                        local v798
                        v796, v798 = v795(pu782, v796)
                        if v796 == nil then
                            break
                        end
                        local vu799 = Instance.new("TextButton")
                        vu799.Name = "Item"
                        vu799.Parent = vu789
                        vu799.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                        vu799.BackgroundTransparency = 0
                        vu799.Size = UDim2.new(0.99, 0, 0, 20)
                        vu799.BorderSizePixel = 0
                        vu799.Font = Enum.Font.GothamBold
                        vu799.Text = tostring(v798)
                        vu799.TextColor3 = Color3.fromRGB(225, 225, 225)
                        vu799.TextSize = 13
                        vu799.TextTransparency = 0
                        vu799.ZIndex = 6
                        v787.CornerRadius = UDim.new(0, 4)
                        v787.Parent = vu799
                        vu799.MouseEnter:Connect(function()
                            vu486:Create(vu799, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                TextTransparency = 0
                            }):Play()
                        end)
                        vu799.MouseLeave:Connect(function()
                            vu486:Create(vu799, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                TextTransparency = 0.5
                            }):Play()
                        end)
                        vu799.MouseButton1Click:Connect(function()
                            vu797 = false
                            vu785:TweenSize(UDim2.new(0.94, 0, 0, 30), "Out", "Quad", 0.3, true)
                            vu486:Create(vu793, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Rotation = 180
                            }):Play()
                            pu784(vu799.Text)
                            vu788.Text = "   " .. pu781 .. " : " .. vu799.Text
                        end)
                    end
                    vu789.CanvasSize = UDim2.new(0, 0, 0, v790.AbsoluteContentSize.Y + 500)
                    v792.MouseButton1Click:Connect(function()
                        if vu797 ~= false then
                            vu797 = false
                            vu785:TweenSize(UDim2.new(0.94, 0, 0, 30), "Out", "Quad", 0.3, true)
                            vu486:Create(vu793, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Rotation = 180
                            }):Play()
                        else
                            vu797 = true
                            vu785:TweenSize(UDim2.new(0.94, 0, 0, 131), "Out", "Quad", 0.3, true)
                            vu486:Create(vu793, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Rotation = 0
                            }):Play()
                        end
                    end)
                    return {
                        Add = function(_, p800)
                            local vu801 = Instance.new("TextButton")
                            vu801.Name = "Item"
                            vu801.Parent = vu789
                            vu801.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                            vu801.BackgroundTransparency = 0
                            vu801.Size = UDim2.new(0.99, 0, 0, 18)
                            vu801.BorderSizePixel = 0
                            vu801.Font = Enum.Font.GothamBold
                            vu801.Text = tostring(p800)
                            vu801.TextColor3 = Color3.fromRGB(225, 225, 225)
                            vu801.TextSize = 13
                            vu801.TextTransparency = 0
                            vu801.ZIndex = 6
                            local v802 = Instance.new("UICorner")
                            v802.CornerRadius = UDim.new(0, 4)
                            v802.Parent = vu801
                            vu801.MouseEnter:Connect(function()
                                vu486:Create(vu801, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    TextTransparency = 0
                                }):Play()
                            end)
                            vu801.MouseLeave:Connect(function()
                                vu486:Create(vu801, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    TextTransparency = 0.5
                                }):Play()
                            end)
                            vu801.MouseButton1Click:Connect(function()
                                vu797 = false
                                vu785:TweenSize(UDim2.new(0.94, 0, 0, 31), "Out", "Quad", 0.3, true)
                                vu486:Create(vu793, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    Rotation = 180
                                }):Play()
                                pu784(vu801.Text)
                                vu788.Text = "   " .. pu781 .. " : " .. vu801.Text
                            end)
                        end,
                        Clear = function(_)
                            vu788.Text = "   Refresh Successfully"
                            vu788.TextColor3 = Color3.fromRGB(0, 225, 0)
                            wait(0.5)
                            vu788.Text = tostring("   " .. pu781) .. " : "
                            vu788.TextColor3 = Color3.fromRGB(225, 225, 255)
                            vu797 = false
                            vu785:TweenSize(UDim2.new(0.94, 0, 0, 31), "Out", "Quad", 0.3, true)
                            vu486:Create(vu793, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Rotation = 180
                            }):Play()
                            local v803 = next
                            local v804, v805 = vu789:GetChildren()
                            while true do
                                local v806
                                v805, v806 = v803(v804, v805)
                                if v805 == nil then
                                    break
                                end
                                if v806:IsA("TextButton") then
                                    v806:Destroy()
                                end
                            end
                        end
                    }
                end
                function vu659.Slider(_, p807, pu808, pu809, pu810, pu811)
                    local v812 = Instance.new("Frame")
                    local v813 = Instance.new("TextLabel")
                    local v814 = Instance.new("Frame")
                    local vu815 = Instance.new("TextBox")
                    local v816 = Instance.new("UICorner")
                    local vu817 = Instance.new("Frame")
                    local v818 = Instance.new("UICorner")
                    local v819 = Instance.new("Frame")
                    local v820 = Instance.new("UICorner")
                    local vu821 = Instance.new("Frame")
                    local v822 = Instance.new("UICorner")
                    local v823 = {}
                    v812.Name = "SliderFrame"
                    v812.Parent = vu660
                    v812.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    v812.Position = UDim2.new(0.109489053, 0, 0.708609283, 0)
                    v812.Size = UDim2.new(0.94, 0, 0, 40)
                    v812.BackgroundTransparency = 0
                    v812.ZIndex = 16
                    local v824 = Instance.new("UIStroke")
                    v824.Color = Color3.fromRGB(255, 255, 255)
                    v824.Thickness = 1
                    v824.Transparency = 0.95
                    v824.Name = "UiToggle_UiStroke1"
                    v824.Parent = v812
                    local v825 = Instance.new("UICorner")
                    v825.CornerRadius = UDim.new(0, 4)
                    v825.Parent = v812
                    v813.Name = "LabelNameSlider"
                    v813.Parent = v812
                    v813.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v813.BackgroundTransparency = 1
                    v813.Position = UDim2.new(0.0229926974, 0, 0.0396823473, 0)
                    v813.Size = UDim2.new(0, 182, 0, 25)
                    v813.Font = Enum.Font.GothamBold
                    v813.Text = tostring(p807)
                    v813.TextColor3 = Color3.fromRGB(255, 255, 255)
                    v813.TextSize = 14
                    v813.TextXAlignment = Enum.TextXAlignment.Left
                    v813.ZIndex = 16
                    v814.Name = "ShowValueFrame"
                    v814.Parent = v812
                    v814.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    v814.BackgroundTransparency = 1
                    v814.Position = UDim2.new(0.733576655, 0, 0.0656082779, 0)
                    v814.Size = UDim2.new(0, 58, 0, 21)
                    v814.ZIndex = 16
                    vu815.Name = "CustomValue"
                    vu815.Parent = v814
                    vu815.AnchorPoint = Vector2.new(0.5, 0.5)
                    vu815.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    vu815.Position = UDim2.new(0.7, 0, 0.5, 0)
                    vu815.Size = UDim2.new(0, 55, 0, 21)
                    vu815.Font = Enum.Font.GothamBold
                    vu815.Text = "50"
                    vu815.TextColor3 = Color3.fromRGB(255, 255, 255)
                    vu815.TextSize = 11
                    vu815.ZIndex = 16
                    v816.CornerRadius = UDim.new(0, 4)
                    v816.Name = "ShowValueFrameUICorner"
                    v816.Parent = vu815
                    vu817.Name = "ValueFrame"
                    vu817.Parent = v812
                    vu817.AnchorPoint = Vector2.new(0.5, 0.5)
                    vu817.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    vu817.Position = UDim2.new(0.5, 0, 0.8, 0)
                    vu817.Size = UDim2.new(0.85, 0, 0, 5)
                    vu817.ZIndex = 16
                    v818.CornerRadius = UDim.new(0, 30)
                    v818.Name = "ValueFrameUICorner"
                    v818.Parent = vu817
                    v819.Name = "PartValue"
                    v819.Parent = vu817
                    v819.AnchorPoint = Vector2.new(0.5, 0.5)
                    v819.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
                    v819.BackgroundTransparency = 1
                    v819.Position = UDim2.new(0.5, 0, 0.8, 0)
                    v819.Size = UDim2.new(0.85, 0, 0, 5)
                    v819.ZIndex = 16
                    v820.CornerRadius = UDim.new(0, 30)
                    v820.Name = "PartValueUICorner"
                    v820.Parent = v819
                    vu821.Name = "MainValue"
                    vu821.Parent = vu817
                    vu821.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
                    vu821.Size = UDim2.new((pu810 or 0) / pu809, 0, 0, 5)
                    vu821.BorderSizePixel = 0
                    vu821.ZIndex = 16
                    v822.CornerRadius = UDim.new(0, 30)
                    v822.Name = "MainValueUICorner"
                    v822.Parent = vu821
                    local vu826 = Instance.new("Frame")
                    vu826.Name = "ConneValue"
                    vu826.Parent = v819
                    vu826.AnchorPoint = Vector2.new(0.7, 0.7)
                    vu826.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
                    vu826.Position = UDim2.new((pu810 or 0) / pu809, 0.5, 0.5, 0, 0)
                    vu826.Size = UDim2.new(0, 10, 0, 10)
                    vu826.BorderSizePixel = 0
                    vu826.ZIndex = 16
                    local v827 = Instance.new("UICorner")
                    v827.CornerRadius = UDim.new(0, 10)
                    v827.Parent = vu826
                    floor = true
                    if floor ~= true then
                        vu815.Text = tostring(pu810 and (math.floor(pu810 / pu809 * (pu809 - pu808) + pu808) or 0) or 0)
                    else
                        vu815.Text = tostring(pu810 and (string.format(pu810 / pu809 * (pu809 - pu808) + pu808) or 0) or 0)
                    end
                    local function vu832(p828)
                        local v829 = UDim2.new(math.clamp((p828.Position.X - vu817.AbsolutePosition.X) / vu817.AbsoluteSize.X, 0, 1), 0, 0.5, 0)
                        vu821:TweenSize(UDim2.new(math.clamp((p828.Position.X - vu817.AbsolutePosition.X) / vu817.AbsoluteSize.X, 0, 1), 0, 0, 5), "Out", "Sine", 0.2, true)
                        vu826:TweenPosition(v829, "Out", "Sine", 0.2, true)
                        if floor ~= true then
                            local v830 = math.floor(v829.X.Scale * pu809 / pu809 * (pu809 - pu808) + pu808)
                            vu815.Text = tostring(v830)
                            pu811(v830)
                        else
                            local v831 = string.format("%.0f", v829.X.Scale * pu809 / pu809 * (pu809 - pu808) + pu808)
                            vu815.Text = tostring(v831)
                            pu811(v831)
                        end
                    end
                    local vu833 = false
                    vu826.InputBegan:Connect(function(p834)
                        if p834.UserInputType == Enum.UserInputType.MouseButton1 then
                            vu833 = true
                        end
                    end)
                    vu826.InputEnded:Connect(function(p835)
                        if p835.UserInputType == Enum.UserInputType.MouseButton1 then
                            vu833 = false
                        end
                    end)
                    v812.InputBegan:Connect(function(p836)
                        if p836.UserInputType == Enum.UserInputType.MouseButton1 then
                            vu833 = true
                        end
                    end)
                    v812.InputEnded:Connect(function(p837)
                        if p837.UserInputType == Enum.UserInputType.MouseButton1 then
                            vu833 = false
                        end
                    end)
                    vu817.InputBegan:Connect(function(p838)
                        if p838.UserInputType == Enum.UserInputType.MouseButton1 then
                            vu833 = true
                        end
                    end)
                    vu817.InputEnded:Connect(function(p839)
                        if p839.UserInputType == Enum.UserInputType.MouseButton1 then
                            vu833 = false
                        end
                    end)
                    game:GetService("UserInputService").InputChanged:Connect(function(p840)
                        if vu833 and p840.UserInputType == Enum.UserInputType.MouseMovement then
                            vu832(p840)
                        end
                    end)
                    vu815.FocusLost:Connect(function()
                        if vu815.Text == "" then
                            vu815.Text = pu810
                        end
                        if pu809 < tonumber(vu815.Text) then
                            vu815.Text = pu809
                        end
                        vu821:TweenSize(UDim2.new((vu815.Text or 0) / pu809, 0, 0, 5), "Out", "Sine", 0.2, true)
                        vu826:TweenPosition(UDim2.new((vu815.Text or 0) / pu809, 0, 0.6, 0), "Out", "Sine", 0.2, true)
                        if floor ~= true then
                            local v841 = vu815
                            local v842 = tostring
                            local v843 = vu815.Text
                            if v843 then
                                v843 = math.floor(vu815.Text / pu809 * (pu809 - pu808) + pu808)
                            end
                            v841.Text = v842(v843)
                        else
                            local v844 = vu815
                            local v845 = tostring
                            local v846 = vu815.Text
                            if v846 then
                                v846 = string.format("%.0f", vu815.Text / pu809 * (pu809 - pu808) + pu808)
                            end
                            v844.Text = v845(v846)
                        end
                        pcall(pu811, vu815.Text)
                    end)
                    function v823.Update(_, pu847)
                        vu821:TweenSize(UDim2.new((pu847 or 0) / pu809, 0, 0, 5), "Out", "Sine", 0.2, true)
                        vu826:TweenPosition(UDim2.new((pu847 or 0) / pu809, 0.5, 0.5, 0, 0), "Out", "Sine", 0.2, true)
                        vu815.Text = pu847
                        pcall(function()
                            pu811(pu847)
                        end)
                    end
                    return v823
                end
                local vu848 = game:GetService("TweenService")
                function vu659.dROPDS(_, pu849, pu850, pu851, pu852)
                    local vu853 = {}
                    local vu854 = Instance.new("Frame")
                    local v855 = Instance.new("UICorner")
                    local v856 = Instance.new("Frame")
                    local v857 = Instance.new("UICorner")
                    local vu858 = Instance.new("TextLabel")
                    local vu859 = Instance.new("ImageButton")
                    local vu860 = Instance.new("ScrollingFrame")
                    local vu861 = Instance.new("UIListLayout")
                    local v862 = Instance.new("UIPadding")
                    local vu863 = Instance.new("TextBox")
                    vu854.Name = "MainDropDown"
                    vu854.Parent = vu660
                    vu854.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    vu854.BackgroundTransparency = 0.7
                    vu854.BorderSizePixel = 0
                    vu854.ClipsDescendants = true
                    vu854.Size = UDim2.new(0.94, 0, 0, 30)
                    vu854.ZIndex = 16
                    local v864 = Instance.new("UIStroke")
                    v864.Color = Color3.fromRGB(255, 255, 255)
                    v864.Thickness = 1
                    v864.Transparency = 0.95
                    v864.Name = "UiToggle_UiStroke1"
                    v864.Parent = vu854
                    v855.CornerRadius = UDim.new(0, 4)
                    v855.Parent = vu854
                    v856.Name = "MainDropDown_2"
                    v856.Parent = vu854
                    v856.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    v856.BackgroundTransparency = 0.7
                    v856.BorderSizePixel = 0
                    v856.ClipsDescendants = true
                    v856.Size = UDim2.new(1, 0, 0, 30)
                    v856.ZIndex = 16
                    v857.CornerRadius = UDim.new(0, 4)
                    v857.Parent = v856
                    function getpro()
                        if not pu851 then
                            return pu849 .. " : "
                        end
                        if not table.find(pu850, pu851) then
                            return pu849 .. " : "
                        end
                        pu852(pu851)
                        return pu849 .. " : " .. pu851
                    end
                    vu858.Name = "Text"
                    vu858.Parent = v856
                    vu858.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu858.BackgroundTransparency = 1
                    vu858.Position = UDim2.new(0, 10, 0, 10)
                    vu858.Size = UDim2.new(0, 62, 0, 12)
                    vu858.ZIndex = 16
                    vu858.Font = Enum.Font.GothamBold
                    vu858.Text = getpro()
                    vu858.TextColor3 = Color3.fromRGB(255, 255, 255)
                    vu858.TextSize = 12
                    vu858.TextXAlignment = Enum.TextXAlignment.Left
                    vu859.Parent = v856
                    vu859.AnchorPoint = Vector2.new(0, 0.5)
                    vu859.BackgroundTransparency = 1
                    vu859.Position = UDim2.new(1, - 25, 0.5, 0)
                    vu859.Size = UDim2.new(0, 12, 0, 12)
                    vu859.ZIndex = 16
                    vu859.Image = "http://www.roblox.com/asset/?id=10734963191"
                    vu863.Parent = vu854
                    vu863.Size = UDim2.new(1, - 20, 0, 30)
                    vu863.PlaceholderText = "  Search..."
                    vu863.TextColor3 = Color3.new(1, 1, 1)
                    vu863.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    vu863.BorderSizePixel = 1
                    vu863.Position = UDim2.new(0, 0.5, 0, 35)
                    vu863.ZIndex = 20
                    vu863.Visible = false
                    vu863.Text = ""
                    vu863.BorderSizePixel = 0
                    vu863.ClearTextOnFocus = false
                    vu863.Font = Enum.Font.GothamBold
                    vu863.TextWrapped = true
                    vu863.TextXAlignment = Enum.TextXAlignment.Left
                    vu863.TextSize = 10
                    local v865 = Instance.new("UICorner")
                    v865.CornerRadius = UDim.new(0, 4)
                    v865.Parent = vu863
                    local v866 = Instance.new("UIStroke")
                    v866.Color = Color3.fromRGB(255, 255, 255)
                    v866.Thickness = 1
                    v866.Transparency = 0.95
                    v866.Name = "UiToggle_UiStroke1"
                    v866.Parent = vu863
                    vu860.Name = "Scroll_Items"
                    vu860.Parent = vu854
                    vu860.Active = true
                    vu860.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu860.BackgroundTransparency = 1
                    vu860.BorderSizePixel = 0
                    vu860.ZIndex = 20
                    vu860.Position = UDim2.new(0, 0, 0, 70)
                    vu860.Size = UDim2.new(1, 0, 1, 500)
                    vu860.ScrollBarThickness = 20
                    vu861.Parent = vu860
                    vu861.SortOrder = Enum.SortOrder.LayoutOrder
                    vu861.Padding = UDim.new(0, 5)
                    v862.Parent = vu860
                    v862.PaddingLeft = UDim.new(0, 10)
                    v862.PaddingTop = UDim.new(0, 10)
                    local vu867 = false
                    function vu853.TogglePanel(_, p868)
                        vu848:Create(vu854, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = p868 and UDim2.new(0.92, 0, 0, 300) or UDim2.new(0.92, 0, 0, 30)
                        }):Play()
                        vu848:Create(vu859, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Rotation = p868 and 180 or 0
                        }):Play()
                        vu863.Visible = p868
                    end
                    vu859.MouseButton1Click:Connect(function()
                        vu867 = not vu867
                        vu853:TogglePanel(vu867)
                    end)
                    function vu853.Add(_, pu869)
                        local v870 = Instance.new("TextButton")
                        local v871 = Instance.new("UICorner")
                        v870.Name = pu869
                        v870.Parent = vu860
                        v870.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                        v870.BorderSizePixel = 0
                        v870.ClipsDescendants = true
                        v870.Size = UDim2.new(1, - 10, 0, 25)
                        v870.ZIndex = 17
                        v870.AutoButtonColor = false
                        v870.Font = Enum.Font.GothamBold
                        v870.Text = pu869
                        v870.TextColor3 = Color3.fromRGB(255, 255, 255)
                        v870.TextSize = 12
                        v871.CornerRadius = UDim.new(0, 4)
                        v871.Parent = v870
                        function vu853.Clear(_)
                            local v872, v873, v874 = vu483(vu860:GetChildren())
                            while true do
                                local v875
                                v874, v875 = v872(v873, v874)
                                if v874 == nil then
                                    break
                                end
                                if v875:IsA("TextButton") then
                                    v875:Destroy()
                                    vu858.TextColor3 = Color3.fromRGB(0, 255, 0)
                                    vu858.Text = pu849 .. " : Refresh Succesfully"
                                    wait(0.2)
                                    vu858.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    vu858.Text = pu849 .. " : ..."
                                end
                            end
                        end
                        v870.MouseButton1Click:Connect(function()
                            vu867 = false
                            vu853:TogglePanel(false)
                            pu852(pu869)
                            vu858.Text = pu849 .. " : " .. pu869
                        end)
                        vu860.CanvasSize = UDim2.new(0, 0, 0, vu861.AbsoluteContentSize.Y + 20)
                    end
                    local v876 = vu861
                    vu861.GetPropertyChangedSignal(v876, "AbsoluteContentSize"):Connect(function()
                        vu860.CanvasSize = UDim2.new(0, 0, 0, vu861.AbsoluteContentSize.Y + 20)
                    end)
                    local v877, v878, v879 = vu484(pu850)
                    local vu880 = vu860
                    local vu881 = vu863
                    local v882 = vu853
                    while true do
                        local v883
                        v879, v883 = v877(v878, v879)
                        if v879 == nil then
                            break
                        end
                        v882:Add(v883)
                    end
                    vu881:GetPropertyChangedSignal("Text"):Connect(function()
                        local v884 = string.lower(vu881.Text)
                        local v885, v886, v887 = vu483(vu880:GetChildren())
                        while true do
                            local v888
                            v887, v888 = v885(v886, v887)
                            if v887 == nil then
                                break
                            end
                            if v888:IsA("TextButton") then
                                v888.Visible = string.find(string.lower(v888.Name), v884) ~= nil
                            end
                        end
                    end)
                    return v882
                end
                function vu659.Button(_, p889, p890)
                    local vu891 = p890 or function()
                    end
                    local vu892 = Instance.new("Frame")
                    local v893 = Instance.new("UIAspectRatioConstraint")
                    local v894 = Instance.new("Frame")
                    local v895 = Instance.new("UICorner")
                    local vu896 = Instance.new("UIGradient")
                    local vu897 = Instance.new("TextLabel")
                    vu892.Name = "Button"
                    vu892.Parent = vu660
                    vu892.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu892.BackgroundTransparency = 1
                    vu892.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu892.BorderSizePixel = 0
                    vu892.Size = UDim2.new(0.980000019, 0, 0.5, 0)
                    vu892.ZIndex = 5
                    v893.Parent = vu892
                    v893.AspectRatio = 11.5
                    v893.AspectType = Enum.AspectType.ScaleWithParentSize
                    v894.Name = "ButtonMainFrame"
                    v894.Parent = vu892
                    v894.AnchorPoint = Vector2.new(0.5, 0)
                    v894.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v894.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    v894.BorderSizePixel = 0
                    v894.Position = UDim2.new(0.5, 0, 0, 0)
                    v894.Size = UDim2.new(0.949999988, 0, 1, 0)
                    v894.ZIndex = 6
                    v895.CornerRadius = UDim.new(0, 3)
                    v895.Parent = v894
                    vu896.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, vu492.Config.MainColor),
                        ColorSequenceKeypoint.new(1, vu492.Config.DropColor)
                    })
                    vu896.Rotation = 90
                    vu896.Parent = v894
                    vu897.Name = "Text"
                    vu897.Parent = v894
                    vu897.AnchorPoint = Vector2.new(0.5, 0.5)
                    vu897.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu897.BackgroundTransparency = 1
                    vu897.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu897.BorderSizePixel = 0
                    vu897.Position = UDim2.new(0.5, 0, 0.5, 0)
                    vu897.Size = UDim2.new(1, 0, 0.600000024, 0)
                    vu897.ZIndex = 6
                    vu897.Font = Enum.Font.GothamBold
                    vu897.Text = p889 or "Sea Event"
                    vu897.TextColor3 = Color3.fromRGB(255, 255, 255)
                    vu897.TextScaled = false
                    vu897.TextSize = 14
                    vu897.TextWrapped = true
                    local v898 = vu496(v894)
                    v898.MouseButton1Down:Connect(function()
                        vu848:Create(vu896, TweenInfo.new(0.1), {
                            Offset = Vector2.new(0, 1)
                        }):Play()
                    end)
                    v898.MouseButton1Up:Connect(function()
                        vu848:Create(vu896, TweenInfo.new(0.1), {
                            Offset = Vector2.new(0, 0)
                        }):Play()
                    end)
                    v898.MouseButton1Click:Connect(vu891)
                    return {
                        Text = function(_, ...)
                            vu897.Text = tostring(...)
                        end,
                        Fire = function(_, ...)
                            vu891(...)
                        end,
                        Delete = function(_)
                            vu892:Destroy()
                            vu673()
                        end
                    }
                end
                function vu659.Slider1(_, p899, p900, p901, p902, p903)
                    local vu904 = {
                        Min = p900 or 0,
                        Max = p901 or 100
                    }
                    vu904.Default = p902 or vu904.Min
                    local vu905 = p903 or function()
                    end
                    local v906 = Instance.new("Frame")
                    local v907 = Instance.new("UIAspectRatioConstraint")
                    local v908 = Instance.new("Frame")
                    local vu909 = Instance.new("TextLabel")
                    local vu910 = Instance.new("Frame")
                    local v911 = Instance.new("UICorner")
                    local vu912 = Instance.new("Frame")
                    local v913 = Instance.new("UICorner")
                    local v914 = Instance.new("Frame")
                    local v915 = Instance.new("UICorner")
                    local vu916 = Instance.new("TextLabel")
                    v906.Name = "Slider"
                    v906.Parent = vu660
                    v906.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v906.BackgroundTransparency = 1
                    v906.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    v906.BorderSizePixel = 0
                    v906.Size = UDim2.new(0.980000019, 0, 0.5, 0)
                    v906.ZIndex = 5
                    v907.Parent = v906
                    v907.AspectRatio = 12
                    v907.AspectType = Enum.AspectType.ScaleWithParentSize
                    v908.Name = "MainFrame"
                    v908.Parent = v906
                    v908.AnchorPoint = Vector2.new(0.5, 0)
                    v908.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v908.BackgroundTransparency = 1
                    v908.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    v908.BorderSizePixel = 0
                    v908.Position = UDim2.new(0.5, 0, 0, 0)
                    v908.Size = UDim2.new(0.949999988, 0, 1, 0)
                    v908.ZIndex = 6
                    vu909.Name = "Text"
                    vu909.Parent = v908
                    vu909.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu909.BackgroundTransparency = 1
                    vu909.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu909.BorderSizePixel = 0
                    vu909.Position = UDim2.new(0.00999999978, 0, 0, 0)
                    vu909.Size = UDim2.new(0.959999979, 0, 0.5, 0)
                    vu909.ZIndex = 6
                    vu909.Font = Enum.Font.GothamBold
                    vu909.Text = p899 or "Slider"
                    vu909.TextColor3 = Color3.fromRGB(255, 255, 255)
                    vu909.TextScaled = true
                    vu909.TextSize = 14
                    vu909.TextWrapped = true
                    vu909.TextXAlignment = Enum.TextXAlignment.Left
                    vu910.Name = "System"
                    vu910.Parent = v908
                    vu910.AnchorPoint = Vector2.new(0.5, 0.5)
                    vu910.BackgroundColor3 = Color3.fromRGB(76, 81, 82)
                    vu910.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu910.BorderSizePixel = 0
                    vu910.Position = UDim2.new(0.5, 0, 0.699999988, 0)
                    vu910.Size = UDim2.new(0.970000029, 0, 0.194999993, 0)
                    vu910.ZIndex = 6
                    v911.CornerRadius = UDim.new(1, 0)
                    v911.Parent = vu910
                    vu912.Name = "Slide"
                    vu912.Parent = vu910
                    vu912.BackgroundColor3 = vu492.Config.MainColor
                    vu912.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu912.BorderSizePixel = 0
                    vu912.Size = UDim2.new(0.100000001, 0, 1, 0)
                    vu912.ZIndex = 8
                    v913.CornerRadius = UDim.new(1, 0)
                    v913.Parent = vu912
                    v914.Name = "Control"
                    v914.Parent = vu912
                    v914.AnchorPoint = Vector2.new(0.5, 0.5)
                    v914.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v914.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    v914.BorderSizePixel = 0
                    v914.Position = UDim2.new(1, 0, 0.5, 0)
                    v914.Size = UDim2.new(1.64999998, 0, 2.6500001, 0)
                    v914.SizeConstraint = Enum.SizeConstraint.RelativeYY
                    v914.ZIndex = 8
                    v915.CornerRadius = UDim.new(0.5, 0)
                    v915.Parent = v914
                    vu916.Name = "ValueText"
                    vu916.Parent = v908
                    vu916.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu916.BackgroundTransparency = 1
                    vu916.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu916.BorderSizePixel = 0
                    vu916.Position = UDim2.new(0.6910429, 0, 0, 0)
                    vu916.Size = UDim2.new(0.27895698, 0, 0, 0)
                    vu916.ZIndex = 6
                    vu916.Font = Enum.Font.GothamBold
                    vu916.Text = tostring(vu904.Default) .. tostring(vu904.VALUE)
                    vu916.TextColor3 = Color3.fromRGB(255, 255, 255)
                    vu916.TextScaled = true
                    vu916.TextSize = 14
                    vu916.TextWrapped = true
                    vu916.TextXAlignment = Enum.TextXAlignment.Right
                    vu916.TextTransparency = 1
                    vu848:Create(vu912, TweenInfo.new(0.1), {
                        Size = UDim2.fromScale(vu904.Default / vu904.Max, 1)
                    }):Play()
                    local vu917 = false
                    local function vu922(p918)
                        local v919 = math.clamp((p918.Position.X - vu910.AbsolutePosition.X) / vu910.AbsoluteSize.X, 0, 1)
                        local v920 = math.floor((vu904.Max - vu904.Min) * v919 + vu904.Min)
                        local v921 = UDim2.fromScale(v919, 1)
                        vu916.Text = tostring(v920) .. tostring(vu904.VALUE)
                        vu848:Create(vu912, TweenInfo.new(0.1), {
                            Size = v921
                        }):Play()
                        vu905(v920)
                    end
                    v908.InputBegan:Connect(function(p923)
                        if p923.UserInputType == Enum.UserInputType.MouseButton1 or p923.UserInputType == Enum.UserInputType.Touch then
                            vu917 = true
                            vu848:Create(vu916, TweenInfo.new(0.1), {
                                Size = UDim2.new(0.27895698, 0, 0.5, 0),
                                TextTransparency = 0.1
                            }):Play()
                            vu922(p923)
                        end
                    end)
                    v908.InputEnded:Connect(function(p924)
                        if p924.UserInputType == Enum.UserInputType.MouseButton1 or p924.UserInputType == Enum.UserInputType.Touch then
                            vu917 = false
                        end
                    end)
                    vu491.InputChanged:Connect(function(p925)
                        if vu917 and (p925.UserInputType == Enum.UserInputType.MouseMovement or p925.UserInputType == Enum.UserInputType.Touch) then
                            vu922(p925)
                        end
                    end)
                    return {
                        Text = function(_, ...)
                            vu909.Text = tostring(...)
                        end,
                        Value = function(_, p926)
                            vu916.Text = tostring(p926) .. tostring(vu904.VALUE)
                            vu905(p926)
                        end,
                        Fire = function(_, ...)
                            vu905(...)
                        end,
                        Delete = function(_)
                            vu583:Destroy()
                            vu673()
                        end
                    }
                end
                function vu659.Dropdown1(_, p927, _, pu928, p929)
                    local v930 = Instance.new("Frame")
                    local vu931 = Instance.new("UIAspectRatioConstraint")
                    local vu932 = Instance.new("TextLabel")
                    local v933 = Instance.new("UIAspectRatioConstraint")
                    local v934 = Instance.new("UIListLayout")
                    local vu935 = Instance.new("Frame")
                    local v936 = Instance.new("UIStroke")
                    local v937 = Instance.new("UIGradient")
                    local v938 = Instance.new("UICorner")
                    local v939 = Instance.new("Frame")
                    local v940 = Instance.new("UIAspectRatioConstraint")
                    local vu941 = Instance.new("ImageLabel")
                    local vu942 = Instance.new("TextLabel")
                    local v943 = Instance.new("UIGradient")
                    local v944 = Instance.new("UIListLayout")
                    local vu945 = Instance.new("ScrollingFrame")
                    local v946 = Instance.new("UIAspectRatioConstraint")
                    local v947 = Instance.new("UIListLayout")
                    local vu948 = p929 or function()
                    end
                    vu502(vu945)
                    local function vu955(p949)
                        if typeof(p949) ~= "table" then
                            return tostring(Default or "None")
                        end
                        local v950, v951, v952 = vu484(p949)
                        local v953 = ""
                        while true do
                            local v954
                            v952, v954 = v950(v951, v952)
                            if v952 == nil then
                                break
                            end
                            v953 = v953 .. " " .. tostring(v954) .. " ,"
                        end
                        return v953:sub(0, # v953 - 1)
                    end
                    v930.Name = "Dropdown"
                    v930.Parent = vu660
                    v930.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v930.BackgroundTransparency = 1
                    v930.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    v930.BorderSizePixel = 0
                    v930.Size = UDim2.new(0.980000019, 0, 0.5, 0)
                    v930.ZIndex = 5
                    vu931.Parent = v930
                    vu931.AspectRatio = 6.5
                    vu931.AspectType = Enum.AspectType.ScaleWithParentSize
                    vu932.Name = "Text"
                    vu932.Parent = v930
                    vu932.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu932.BackgroundTransparency = 1
                    vu932.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu932.BorderSizePixel = 0
                    vu932.Size = UDim2.new(0.959999979, 0, 0.5, 0)
                    vu932.ZIndex = 6
                    vu932.Font = Enum.Font.GothamBold
                    vu932.Text = p927 or "Select Gays"
                    vu932.TextColor3 = Color3.fromRGB(255, 255, 255)
                    vu932.TextScaled = true
                    vu932.TextSize = 14
                    vu932.TextWrapped = true
                    vu932.TextXAlignment = Enum.TextXAlignment.Left
                    v933.Parent = vu932
                    v933.AspectRatio = 22
                    v933.AspectType = Enum.AspectType.ScaleWithParentSize
                    v934.Parent = v930
                    v934.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    v934.SortOrder = Enum.SortOrder.LayoutOrder
                    v934.Padding = UDim.new(0, 3)
                    vu935.Name = "DropFrame"
                    vu935.Parent = v930
                    vu935.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                    vu935.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu935.BorderSizePixel = 0
                    vu935.ClipsDescendants = true
                    vu935.Position = UDim2.new(0.0200000405, 0, 0.373297691, 0)
                    vu935.Size = UDim2.new(0.959999979, 0, 0.550000012, 0)
                    vu935.ZIndex = 6
                    v936.Color = Color3.fromRGB(37, 37, 37)
                    v936.Parent = vu935
                    v937.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.68),
                        NumberSequenceKeypoint.new(0.2, 0),
                        NumberSequenceKeypoint.new(0.8, 0),
                        NumberSequenceKeypoint.new(1, 0.67)
                    })
                    v937.Parent = v936
                    v938.CornerRadius = UDim.new(0, 2)
                    v938.Parent = vu935
                    v939.Name = "Header"
                    v939.Parent = vu935
                    v939.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v939.BackgroundTransparency = 1
                    v939.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    v939.BorderSizePixel = 0
                    v939.Size = UDim2.new(0.925000012, 0, 1, 0)
                    v939.ZIndex = 7
                    v940.Parent = v939
                    v940.AspectRatio = 12
                    v940.AspectType = Enum.AspectType.ScaleWithParentSize
                    vu941.Name = "Icon"
                    vu941.Parent = v939
                    vu941.AnchorPoint = Vector2.new(0.5, 0.5)
                    vu941.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu941.BackgroundTransparency = 1
                    vu941.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu941.BorderSizePixel = 0
                    vu941.Position = UDim2.new(0.939999998, 0, 0.5, 0)
                    vu941.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
                    vu941.SizeConstraint = Enum.SizeConstraint.RelativeYY
                    vu941.ZIndex = 7
                    vu941.Image = "rbxassetid://7733717447"
                    vu942.Name = "SelectText"
                    vu942.Parent = v939
                    vu942.AnchorPoint = Vector2.new(0.5, 0.5)
                    vu942.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu942.BackgroundTransparency = 1
                    vu942.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu942.BorderSizePixel = 0
                    vu942.Position = UDim2.new(0.437301666, 0, 0.499999493, 0)
                    vu942.Size = UDim2.new(0.864019156, 0, 0.550000012, 0)
                    vu942.ZIndex = 8
                    vu942.Font = Enum.Font.GothamBold
                    vu942.Text = vu955(Default or "None")
                    vu942.TextColor3 = Color3.fromRGB(255, 255, 255)
                    vu942.TextScaled = true
                    vu942.TextSize = 14
                    vu942.TextTransparency = 0.5
                    vu942.TextWrapped = true
                    vu942.TextXAlignment = Enum.TextXAlignment.Left
                    v943.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0),
                        NumberSequenceKeypoint.new(0.9, 0),
                        NumberSequenceKeypoint.new(1, 1)
                    })
                    v943.Parent = vu942
                    v944.Parent = vu935
                    v944.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    v944.SortOrder = Enum.SortOrder.LayoutOrder
                    v944.Padding = UDim.new(0, 3)
                    vu945.Parent = vu935
                    vu945.Active = true
                    vu945.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu945.BackgroundTransparency = 1
                    vu945.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    vu945.BorderSizePixel = 0
                    vu945.Size = UDim2.new(1, 0, 5.6500001, 0)
                    vu945.ZIndex = 6
                    vu945.ScrollBarThickness = 0
                    v946.Parent = vu945
                    v946.AspectRatio = 1.95
                    v946.AspectType = Enum.AspectType.ScaleWithParentSize
                    v947.Parent = vu945
                    v947.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    v947.SortOrder = Enum.SortOrder.LayoutOrder
                    v947.Padding = UDim.new(0, 3)
                    vu931:GetPropertyChangedSignal("AspectRatio"):Connect(vu673)
                    vu935:GetPropertyChangedSignal("Size"):Connect(function()
                        if vu935.Size.Y.Scale < 0.85 then
                            vu945.Visible = false
                        else
                            vu945.Visible = true
                        end
                    end)
                    local function vu957(p956)
                        if p956 then
                            vu848:Create(vu931, TweenInfo.new(0.3), {
                                AspectRatio = 1.5
                            }):Play()
                            vu848:Create(vu935, TweenInfo.new(0.3), {
                                Size = UDim2.fromScale(0.96, 0.9)
                            }):Play()
                            vu848:Create(vu941, TweenInfo.new(0.3), {
                                ImageColor3 = vu492.Config.MainColor,
                                Size = UDim2.new(0.959999976, 0, 0.959999976, 0)
                            }):Play()
                        else
                            vu848:Create(vu931, TweenInfo.new(0.3), {
                                AspectRatio = 6.5
                            }):Play()
                            vu848:Create(vu935, TweenInfo.new(0.3), {
                                Size = UDim2.fromScale(0.96, 0.55)
                            }):Play()
                            vu848:Create(vu941, TweenInfo.new(0.3), {
                                ImageColor3 = Color3.fromRGB(255, 255, 255),
                                Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
                            }):Play()
                        end
                    end
                    vu957(false)
                    local v958 = {}
                    local vu959 = false
                    local vu960 = typeof(v958) ~= "table" and {
                        v958
                    } or v958
                    local function vu974(p961)
                        local v962 = Instance.new("Frame")
                        local v963 = Instance.new("UIAspectRatioConstraint")
                        local v964 = Instance.new("Frame")
                        local v965 = Instance.new("UICorner")
                        local v966 = Instance.new("TextLabel")
                        local v967 = Instance.new("Frame")
                        local v968 = Instance.new("UICorner")
                        local vu969 = Instance.new("ImageLabel")
                        local vu970 = Instance.new("Frame")
                        local v971 = Instance.new("UIGradient")
                        local v972 = Instance.new("UICorner")
                        v962.Name = "DropdownObject"
                        v962.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        v962.BackgroundTransparency = 1
                        v962.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        v962.BorderSizePixel = 0
                        v962.Size = UDim2.new(0.980000019, 0, 0.5, 0)
                        v962.ZIndex = 5
                        v963.Parent = v962
                        v963.AspectRatio = 11.5
                        v963.AspectType = Enum.AspectType.ScaleWithParentSize
                        v964.Name = "MainFrame"
                        v964.Parent = v962
                        v964.AnchorPoint = Vector2.new(0.5, 0)
                        v964.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        v964.BackgroundTransparency = 1
                        v964.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        v964.BorderSizePixel = 0
                        v964.Position = UDim2.new(0.409999996, 0, 0, 0)
                        v964.Size = UDim2.new(0.800000012, 0, 1, 0)
                        v964.ZIndex = 6
                        v965.CornerRadius = UDim.new(0, 3)
                        v965.Parent = v964
                        v966.Name = "Text"
                        v966.Parent = v964
                        v966.AnchorPoint = Vector2.new(0.5, 0.5)
                        v966.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        v966.BackgroundTransparency = 1
                        v966.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        v966.BorderSizePixel = 0
                        v966.Position = UDim2.new(0.75, 0, 0.5, 0)
                        v966.Size = UDim2.new(1.12300003, 0, 0.524999976, 0)
                        v966.ZIndex = 6
                        v966.Font = Enum.Font.GothamBold
                        v966.Text = tostring(p961)
                        v966.TextColor3 = Color3.fromRGB(255, 255, 255)
                        v966.TextScaled = true
                        v966.TextSize = 14
                        v966.TextWrapped = true
                        v966.TextXAlignment = Enum.TextXAlignment.Left
                        v967.Name = "System"
                        v967.Parent = v964
                        v967.AnchorPoint = Vector2.new(0.5, 0.5)
                        v967.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                        v967.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        v967.BorderSizePixel = 0
                        v967.Position = UDim2.new(0.109999999, 0, 0.5, 0)
                        v967.Size = UDim2.new(0.824999988, 0, 0.824999988, 0)
                        v967.SizeConstraint = Enum.SizeConstraint.RelativeYY
                        v967.ZIndex = 6
                        v968.CornerRadius = UDim.new(0, 3)
                        v968.Parent = v967
                        vu969.Name = "TurnOn"
                        vu969.Parent = v967
                        vu969.AnchorPoint = Vector2.new(0.5, 0.5)
                        vu969.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        vu969.BackgroundTransparency = 1
                        vu969.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        vu969.BorderSizePixel = 0
                        vu969.Position = UDim2.new(0.5, 0, 0.5, 0)
                        vu969.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
                        vu969.ZIndex = 7
                        vu969.Image = "rbxassetid://3944680095"
                        vu969.ImageColor3 = Color3.fromRGB(0, 0, 0)
                        vu969.ImageTransparency = 1
                        vu970.Name = "Box"
                        vu970.Parent = v967
                        vu970.AnchorPoint = Vector2.new(0.5, 0.5)
                        vu970.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        vu970.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        vu970.BorderSizePixel = 0
                        vu970.Position = UDim2.new(0.5, 0, 0.5, 0)
                        vu970.ZIndex = 6
                        v971.Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, vu492.Config.MainColor),
                            ColorSequenceKeypoint.new(1, vu492.Config.DropColor)
                        })
                        v971.Rotation = 45
                        v971.Parent = vu970
                        v972.CornerRadius = UDim.new(0, 4)
                        v972.Parent = vu970
                        return v962, function(p973)
                            if p973 then
                                vu848:Create(vu969, TweenInfo.new(0.4), {
                                    ImageTransparency = 0
                                }):Play()
                                vu848:Create(vu970, TweenInfo.new(0.3), {
                                    Size = UDim2.fromScale(1, 1)
                                }):Play()
                                vu848:Create(vu969, TweenInfo.new(0.55), {
                                    ImageColor3 = vu492.Config.MainColor
                                }):Play()
                            else
                                vu848:Create(vu969, TweenInfo.new(0.4), {
                                    ImageTransparency = 1
                                }):Play()
                                vu848:Create(vu970, TweenInfo.new(0.3), {
                                    Size = UDim2.fromScale(0, 0)
                                }):Play()
                                vu848:Create(vu969, TweenInfo.new(0.555), {
                                    ImageColor3 = Color3.fromRGB(0, 0, 0)
                                }):Play()
                            end
                        end
                    end
                    local function vu991()
                        local v975, v976, v977 = vu484(vu945:GetChildren())
                        while true do
                            local v978
                            v977, v978 = v975(v976, v977)
                            if v977 == nil then
                                break
                            end
                            if v978:IsA("Frame") then
                                v978:Destroy()
                            end
                        end
                        vu945:SetAttribute("Key", tostring(math.random(1, 1000)))
                        local v979, v980, v981 = vu483(DropdownInfo)
                        while true do
                            local vu982
                            v981, vu982 = v979(v980, v981)
                            if v981 == nil then
                                break
                            end
                            local v983, vu984 = vu974(tostring(vu982))
                            local vu985 = false
                            local vu986 = 0
                            v983.Parent = vu945
                            if v981 == Default or vu982 == Default then
                                vu984(true)
                                table.insert(vu960, vu982)
                                vu985 = true
                            else
                                vu984(false)
                            end
                            vu496(v983).MouseButton1Click:Connect(function()
                                vu985 = not vu985
                                if vu985 then
                                    if pu928 < # vu960 + 1 then
                                        vu985 = not vu985
                                        return
                                    end
                                    if not table.find(vu960, vu982) then
                                        table.insert(vu960, vu982)
                                        vu986 = # vu960
                                    end
                                else
                                    local v987, v988, v989 = vu484(vu960)
                                    while true do
                                        local v990
                                        v989, v990 = v987(v988, v989)
                                        if v989 == nil then
                                            break
                                        end
                                        if v990 == vu982 then
                                            table.remove(vu960, v989)
                                        end
                                    end
                                end
                                vu984(vu985)
                                vu942.Text = vu955(vu960)
                                vu948(vu960, vu982)
                            end)
                        end
                    end
                    vu991()
                    vu496(v939).MouseButton1Click:Connect(function()
                        vu959 = not vu959
                        vu957(vu959)
                    end)
                    return {
                        Text = function(_, ...)
                            vu932.Text = tostring(...)
                        end,
                        Refresh = function(_, p992)
                            DropdownInfo = p992
                            vu991()
                        end,
                        Fire = function(_, ...)
                            vu948(...)
                        end,
                        Delete = function(_)
                            vu583:Destroy()
                            vu673()
                        end
                    }
                end
                return vu659
            end
            return v630
        end
        return vu576
    end
    return vu511
end
local v993 = identifyexecutor()
local v994 = v993 == "Solara" and "Solara - Some functions may not work like fast attack etc.." or v993
name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
loadstring(game:HttpGet("https://raw.githubusercontent.com/UnknownScri/Script/refs/heads/main/testing"))()
_G.Title = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local v995 = vu492:NewWindow("", "Executor : " .. v994, "rbxassetid://119522694447910"):AddMenu("", "Game : " .. name .. "   Version : PREMUIM", "ticket", "tab")
local v996 = v995:AddTab("Configs Farm", 10734950020, "distance,bringmob")
local v997 = v995:AddTab("Main Farm", 6035153656, "farm,bossess,etc.")
local v998 = v995:AddTab("Halloween Event", 6034467796, "farm,bossess,etc.")
local v999 = v995:AddTab("World Bosses", 15557776256, "farm,bossess,etc.")
local v1000 = v995:AddTab("Sea Event", 6034754442, "farm,bossess,etc.")
local v1001 = v995:AddTab("Local Player", 14477563495, "auto stats melee,sword,fruit")
local v1002 = v995:AddTab("Travel Seas", 14477598542, "teleport sea,hop")
local v1003 = v995:AddTab("Shops", 14477621526, "auto buy sword,fruit")
local v1004 = v995:AddTab("Dungeon", 14477517268, "auto raid,autoskill")
local v1005 = v995:AddTab("Misc", 14477663692, "other,config")
local v1006 = v1001:AddSection("", "Auto Stats", "auto add melee,fruit,sword stats", "rbxassetid://14477563495")
local v1007 = v1001:AddSection("", "Player Combat", "auto kill player,spectate etc..", "rbxassetid://14477563495")
local v1008 = v1002:AddSection("", "World", "travel first, second, third sea", "rbxassetid://14477598542")
local v1009 = v1002:AddSection("", "Seas", "travel island and npc in any sea", "rbxassetid://14477598542")
local v1010 = v1003:AddSection("", "Fruit Shop", "auto buy key, auto open,", "rbxassetid://14477621526")
local v1011 = v1003:AddSection("", "Others", "auto teleport to abilities shops", "rbxassetid://14477621526")
local v1012 = v1004:AddSection("", "Auto Raid", "auto farm raid, auto kill mob", "rbxassetid://14477517268")
local v1013 = v1005:AddSection("", "Misc", "Bost fps,hide ui,destroy", "rbxassetid://14477663692")
local v1014 = v1005:AddSection("", "Esp", "esp player, islands, ghostship,etc..", "rbxassetid://14477663692")
local vu1015 = game:GetService("Players")
local v1016 = vu1015.LocalPlayer
local _ = script.Parent
local _, _ = vu1015:GetUserThumbnailAsync(v1016.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
local vu1017 = nil
function Toggle(p1018, p1019, ...)
    local v1021, v1021 = ...
    local v1022
    if v1021 or type(v1021) ~= "function" then
        v1022 = v1021
    else
        v1022 = nil
    end
    local vu1023 = v1022 or ...
    return p1019:AddToggle(p1018, _G.Settings[vu1023], v1021 or function(p1024)
        _G.Settings[vu1023] = p1024
        SaveSettings()
        vu1017 = task.spawn(vu295[vu1023])
        if not p1024 and vu1017 then
            task.cancel(vu1017)
            NeedNoClip = false
        end
    end)
end
function Dropdown(p1025, p1026, p1027, ...)
    local v1028, v1029 = ...
    if not v1029 and type(v1028) == "function" then
        v1028 = nil
    end
    local vu1030 = v1028 or ...
    return p1027:AddDropdown(p1025, p1026, _G.Settings[vu1030], function(p1031)
        _G.Settings[vu1030] = p1031
        SaveSettings()
    end)
end
function AddMultiDropdown(p1032, p1033, p1034, ...)
    local v1035, v1036 = ...
    if not v1036 and type(v1035) == "function" then
        v1035 = nil
    end
    local vu1037 = v1035 or ...
    return p1034:MultiDropdown(p1032, _G.Settings[vu1037], p1033, function(p1038)
        _G.Settings[vu1037] = p1038
        SaveSettings()
    end)
end
function Label(p1039, p1040, p1041)
    if p1041 then
        return p1040:AddLabel(p1039)
    else
        return p1040:AddLabel(Name)
    end
end
LoadSettings()
local v1042 = v997:AddSection("", "Main Farming", "auto farm leve, materials, auto 1/2 sea", "rbxassetid://10734975692")
local vu1043 = v1042:AddLabel("Auto Farming: Inactive")
local vu1044 = v1042:AddLabel("Quest: N/A")
local vu1045 = v1042:AddLabel("Health: N/A")
local function vu1046()
    if vu1043 then
        vu1043:Set(_G.LabelAutoFarm or "Auto Farming: Inactive")
    end
    if vu1044 then
        vu1044:Set(_G.Questname)
    end
    if vu1045 then
        vu1045:Set(_G.LabelHealth or "Health: N/A")
    end
end
task.spawn(function()
    while task.wait(0.5) do
        vu1046()
    end
end)
local function vu1050(p1047)
    local v1048 = game.Players.LocalPlayer
    if v1048 and (v1048.Backpack and v1048.Character) and v1048.Character:FindFirstChild("Humanoid") then
        local v1049 = v1048.Backpack:FindFirstChild(p1047)
        if v1049 then
            v1048.Character.Humanoid:EquipTool(v1049)
        else
            warn("Tool not found in Backpack: " .. p1047)
        end
    else
        warn("Player, Character, or Humanoid not available.")
    end
end
Toggle("Auto Farm Level", v1042, "Auto_Farm_Level1")
Toggle("Auto Farm Near", v1042, "Auto_Farm_Nearest_Mob")
if Sea1 then
    Toggle("Auto Second Sea [Lv. 2250]", v1042, "Auto_Sea21")
elseif Sea2 then
    Toggle("Auto Third World [Lv. 4000]", v1042, "Auto_Sea31")
    Toggle("Auto Haki V2", v1042, "auto_hakiv2")
    Toggle("Auto Observation V2", v1042, "AUTOOBSERVE2")
end
v1042:AddSeperator("Boss Farm")
v1042:AddDropdown("Select Boss", v451, "", function(p1051)
    selectedBoss = p1051
end)
Toggle("Auto Farm Boss", v1042, "autofarmbosses")
v1042:AddSeperator("Material Farm")
v1042:AddDropdown("Select Material", v449, "", function(p1052)
    SelectMaterial = p1052
    MaterialMon()
end)
Toggle("Auto Farm Materials", v1042, "AutoFarmMaterial")
v1042:AddSeperator("Accessories")
local v1053, v1054, v1055 = vu484(game:GetService("Players").LocalPlayer:WaitForChild("Accessories"):GetChildren())
local v1056 = {}
while true do
    local v1057
    v1055, v1057 = v1053(v1054, v1055)
    if v1055 == nil then
        break
    end
    table.insert(v1056, v1057.Name)
end
v1042:AddDropdown("Select Accessory", v1056, "", function(p1058)
    _G.selectedAccessory = p1058
end)
v1042:AddToggle("Auto Equip Selected Accessory", _G.autoEquipAccessory, function(p1059)
    _G.autoEquipAccessory = p1059
    if p1059 then
        spawn(function()
            while _G.autoEquipAccessory do
                if _G.selectedAccessory then
                    local v1060 = {
                        _G.selectedAccessory
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("AccessoryEq"):InvokeServer(unpack(v1060))
                end
                wait(1)
            end
        end)
    end
end)
v1042:AddSeperator("Passive Tree")
local vu1061 = v1042:AddLabel("Status : " .. _G.redcircle)
task.spawn(function()
    while true do
        task.wait(1)
        local v1062 = game:GetService("ReplicatedStorage"):FindFirstChild("NPC")
        if v1062 then
            v1062 = game:GetService("ReplicatedStorage").NPC:FindFirstChild("PassiveTree")
        end
        if v1062 then
            vu1061:Set("Check PassiveTree: " .. _G.greencircle)
        else
            vu1061:Set("Check PassiveTree: " .. _G.redcircle)
        end
    end
end)
v1042:AddToggle("Teleport Passive", false, function(p1063)
    _G.autopassive = p1063
end)
spawn(function()
    while true do
        local v1064 = _G.autopassive and workspace:WaitForChild("AllNPC"):WaitForChild("PassiveTree")
        if v1064 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1064.CFrame
        end
        wait(1)
    end
end)
v1042:AddToggle("Auto Hop", false, function(_)
    Serverhop()
end)
v1042:AddSeperator("Codes")
local function vu1066(p1065)
    game:GetService("ReplicatedStorage").Chest.Remotes.Functions.redeemcode:InvokeServer(unpack({
        p1065
    }))
end
v1042:AddDropdown("Select Code", {
    "IslandQuestRepeat",
    "X100KSuccess",
    "FruitAwakeningTime",
    "Halloween2024",
    "Update7.1",
    "DragonColorRefund",
    "PlayKingLegacyFor5Gems",
    "RainbowDragon",
    "<3LEEPUNGG",
    "Update7.0.4",
    "SKGames",
    "PassiveMaster",
    "InfernoKingAwaits",
    "Update7Release",
    "TelekinesisFruitPower",
    "EpicAdventure",
    "WELCOMETOKINGLEGACY",
    "FREESTATSRESET",
    "DinoxLive",
    "2MFAV",
    "Peodiz"
}, "IslandQuestRepeat", function(p1067)
    _G.SelectedCode = p1067
    print("Selected Code:", _G.SelectedCode)
end)
v1042:AddToggle("Use Selected Code", false, function(p1068)
    _G.Settings.UseCode = p1068
    print("Use Selected Code:", _G.Settings.UseCode)
    if _G.Settings.UseCode and _G.SelectedCode then
        vu1066(_G.SelectedCode)
    end
end)
local v1069 = v998:AddSection("", "Halloween Event", "auto farm cady any sea auto spawn bosses", "rbxassetid://6034684949")
local vu1070 = v1069:AddLabel("Total Candy : ")
spawn(function()
    while task.wait(0.1) do
        local v1071 = Client:FindFirstChild("PlayerStats") and (Client.PlayerStats:FindFirstChild("Material") and (Client.PlayerStats.Material:FindFirstChild("Candy") and Client.PlayerStats.Material.Candy.Value)) or getPlayerMaterial("Candy")
        if v1071 then
            vu1070:Set("Total Candy : " .. tostring(v1071))
        else
            vu1070:Set("Total Candy : N/A")
        end
    end
end)
local vu1072 = v1069:AddLabel("Status : " .. _G.redcircle)
task.spawn(function()
    while task.wait(1) do
        vu1072:Set(vu459.find({
            "Skull King"
        }) and "Check Skull King Mon: " .. _G.greencircle or "Check Skull King Mon: " .. _G.redcircle)
    end
end)
local vu1073 = v1069:AddLabel("Status : " .. _G.redcircle)
task.spawn(function()
    while task.wait(1) do
        vu1073:Set(vu459.find({
            "Jack o lantern [Lv. 10000]"
        }) and "Check Jack O Lantern Mon: " .. _G.greencircle or "Check Jack O Lantern Mon: " .. _G.redcircle)
    end
end)
Toggle("Auto Farm Candy", v1069, "auto_farm_candy")
Toggle("Auto Kill Jack O Lantern", v1069, "auto_jacko")
Toggle("Auto Summon Jack O Lantern [50 Candy]", v1069, "auto_jackoo")
Toggle("Auto Kill Skull King", v1069, "auto_skull")
local v1074 = v999:AddSection("", "Main Bosses", "auto farm cady any sea auto spawn bosses", "rbxassetid://6034684949")
v1074:AddSeperator("Server Hop")
v1074:MultiDropdown("Select World Boss to Hop", {
    v456("Jack o lantern [Lv. 10000]"),
    v456("King Samurai [Lv. 3500]"),
    v456("Dragon [Lv. 5000]"),
    v456("Ms. Mother [Lv. 7500]"),
    v456("Lord of Saber [Lv. 8500]"),
    v456("Bushido Ape [Lv. 5000]")
}, _G.Settings.selectbosss or {}, function(p1075)
    _G.Settings.selectbosss = p1075
    print("Selected entities: ", table.concat(selectbosss, ", "))
    SaveSettings()
end)
Toggle("Auto Hop Until Found World Boss", v1074, "auto_hop_boss")
v1074:Slider("Hop Delay (seconds)", 0, 60, _G.Settings.HopDelay or 15, function(p1076)
    _G.Settings.HopDelay = p1076
    SaveSettings()
end)
v1074:AddSeperator("Minion")
local vu1077 = v1074:AddLabel("Status : " .. _G.redcircle)
task.spawn(function()
    while task.wait(1) do
        vu1077:Set(vu459.find({
            "Minion",
            "Boss"
        }) and "Check Minion Mon: " .. _G.greencircle or "Check Minion Mon: " .. _G.redcircle)
    end
end)
Toggle("Auto Kill Minion", v1074, "Auto_Kill_Minion1")
v1074:AddToggle("Auto Hop Minion", false, function(_)
    HopServer()
end)
if Sea1 then
    v1074:AddSeperator("Saber")
    local vu1078 = v1074:AddLabel("Status : " .. _G.redcircle)
    task.spawn(function()
        while task.wait(1) do
            vu1078:Set(vu459.find({
                "Expert Swordman [Lv. 3000]"
            }) and "Check Expert Swordman Mon: " .. _G.greencircle or "Check Expert Swordman Mon: " .. _G.redcircle)
        end
    end)
    Toggle("Auto Kill Expert Swordman", v1074, "Auto_Expert_Swordman1")
end
if Sea2 then
    v1074:AddSeperator("Kaido Boss")
    local vu1079 = v1074:AddLabel("Status : " .. _G.redcircle)
    task.spawn(function()
        while task.wait(1) do
            vu1079:Set(vu459.find({
                "Dragon [Lv. 5000]"
            }) and "Check Dragon Mon: " .. _G.greencircle or "Check Dragon Mon: " .. _G.redcircle)
        end
    end)
    Toggle("Auto Fully Kaido", v1074, "Auto_Kill_Kaido1")
    Toggle("Auto Summon Kaido", v1074, "Auto_Spawn_Kaido")
    v1074:AddToggle("Auto Hop Kaido", false, function(_)
        Serverhop()
    end)
    v1074:AddSeperator("Big Mom")
    local vu1080 = v1074:AddLabel("Status : " .. _G.redcircle)
    task.spawn(function()
        while task.wait(1) do
            vu1080:Set(vu459.find({
                "Ms. Mother [Lv. 7500]"
            }) and "Check BigMom Mon: " .. _G.greencircle or "Check BigMom Mon: " .. _G.redcircle)
        end
    end)
    Toggle("Auto Kill BigMom", v1074, "Auto_Kill_BigMom")
    v1074:AddToggle("Auto Big Mom Hop", false, function(_)
        Serverhop()
    end)
    v1074:AddSeperator("King Samurai")
    local vu1081 = v1074:AddLabel("Status : " .. _G.redcircle)
    task.spawn(function()
        while task.wait(1) do
            vu1081:Set(vu459.find({
                "King Samurai [Lv. 3500]"
            }) and "Check King Samurai Mon: " .. _G.greencircle or "Check King Samurai Mon: " .. _G.redcircle)
        end
    end)
    Toggle("Auto Kill King Samurai", v1074, "King_Samurai")
    v1074:AddToggle("Auto King Samurai Hop", false, function(_)
        Serverhop()
    end)
end
if Sea3 then
    v1074:AddSeperator("Lord Of Saber")
    local vu1082 = v1074:AddLabel("Status : " .. _G.redcircle)
    task.spawn(function()
        while task.wait(1) do
            vu1082:Set(vu459.find({
                "Lord of Saber [Lv. 8500]"
            }) and "Check Lord Of Saber Mon: " .. _G.greencircle or "Check Lord Of Saber Mon: " .. _G.redcircle)
        end
    end)
    Toggle("Auto Kill Lord of Saber", v1074, "auto_lordsaber")
    v1074:AddToggle("Auto Hop Lord of Saber", false, function(_)
        Serverhop()
    end)
    v1074:AddSeperator("Bushido Ape")
    local vu1083 = v1074:AddLabel("Status : " .. _G.redcircle)
    task.spawn(function()
        while task.wait(1) do
            vu1083:Set(vu459.find({
                "Bushido Ape [Lv. 5000]"
            }) and "Check Bushido Ape Mon: " .. _G.greencircle or "Check Bushido Ape Mon: " .. _G.redcircle)
        end
    end)
    Toggle("Auto Kill Bushido Ape", v1074, "auto_bushido")
    v1074:AddToggle("Auto Hop Bushido Ape", false, function(_)
        Serverhop()
    end)
end
if Sea1 then
    _G.sesas = "First Sea"
elseif Sea2 then
    _G.sesas = "Second Sea"
elseif Sea3 then
    _G.sesas = "Third Sea"
end
local v1084 = v1000:AddSection("", _G.sesas .. " Event", "auto kill sea event bosses in any sea!", "http://www.roblox.com/asset/?id=6035078898")
if Sea1 then
    v1084:AddLabel("No Sea Event on First Sea!!")
end
v1084:AddSeperator("Server Hop")
v1084:MultiDropdown("Select Sea Monster to Hop", {
    v457("SeaDragon"),
    v457("FuryTentacle"),
    v457("ThirdSeaEldritch Crab"),
    v457("ThirdSeaDragon"),
    v457("Skull King"),
    v457("SeaKing"),
    v457("HydraSeaKing"),
    v457("Ghost Ship")
}, _G.Settings.SelectedEntities or {}, function(p1085)
    _G.Settings.SelectedEntities = p1085
    print("Selected entities: ", table.concat(p1085, ", "))
    SaveSettings()
end)
Toggle("Auto Hop Until Found Sea Monster", v1084, "auto_hop")
v1084:Slider("Hop Delay (seconds)", 0, 60, _G.Settings.HopDelay or 15, function(p1086)
    _G.Settings.HopDelay = p1086
    SaveSettings()
end)
if Sea2 then
    local function vu1090(p1087, p1088, p1089)
        return string.format("%02dh %02dm %02ds", tonumber(p1087), tonumber(p1088), tonumber(p1089))
    end
    local function vu1094()
        local v1091 = game:GetService("Workspace").SeaMonster:FindFirstChild("SeaKing")
        if not (v1091 and v1091:FindFirstChild("Humanoid")) then
            return "\226\157\140 0 / 0 HP (0%)"
        end
        local v1092 = v1091.Humanoid
        local v1093 = v1092.Health / v1092.MaxHealth * 100
        return string.format("\226\156\133 %d / %d HP (%.0f%%)", math.floor(v1092.Health), math.floor(v1092.MaxHealth), v1093)
    end
    local function vu1103()
        local v1095 = game.Workspace:FindFirstChild("GhostMonster")
        local v1096 = "\226\157\140 0 / 0 HP (0%)"
        if v1095 then
            local v1097, v1098, v1099 = vu483(v1095:GetChildren())
            while true do
                local v1100
                v1099, v1100 = v1097(v1098, v1099)
                if v1099 == nil then
                    break
                end
                if v1100:IsA("Model") and v1100:FindFirstChild("Humanoid") then
                    local v1101 = v1100.Humanoid
                    local v1102 = v1101.Health / v1101.MaxHealth * 100
                    v1096 = string.format("\226\156\133 %d / %d HP (%.0f%%)", math.floor(v1101.Health), math.floor(v1101.MaxHealth), v1102)
                end
            end
        end
        return v1096
    end
    v1084:AddSeperator("Sea King")
    local vu1104 = v1084:AddLabel("Status : " .. _G.redcircle)
    task.spawn(function()
        while task.wait(1) do
            vu1104:Set(vu459.find({
                "SeaKing"
            }) and "Check Sea king Mon: " .. _G.greencircle or "Check Sea King Mon: " .. _G.redcircle)
        end
    end)
    local vu1105 = v1084:AddLabel("HP : N/A")
    local vu1106 = v1084:AddLabel("Next Spawn : N/A")
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                vu1105:Set("HP : " .. vu1094())
                local v1107 = game:GetService("ReplicatedStorage"):GetAttribute("SeaMonsterSpawnText")
                if v1107 and v1107:match("^(%d+):(%d+):(%d+)$") then
                    local v1108, v1109, v1110 = v1107:match("(%d+):(%d+):(%d+)")
                    vu1106:Set("Next Spawn : " .. vu1090(v1108, v1109, v1110))
                else
                    vu1106:Set("Next Spawn : " .. Formatted_SeaKingTime)
                end
            end)
        end
    end)
    Toggle("Auto Kill Sea King", v1084, "Auto_Kill_Sea_King1")
    v1084:AddSeperator("Hydra Boss")
    local vu1111 = v1084:AddLabel("Status : " .. _G.redcircle)
    task.spawn(function()
        while task.wait(1) do
            vu1111:Set(vu459.find({
                "HydraSeaKing"
            }) and "Check Hydra Sea King Mon: " .. _G.greencircle or "Check Hydra Sea King Mon: " .. _G.redcircle)
        end
    end)
    Toggle("Auto Kill Hydra Boss", v1084, "Auto_Kill_Hydar_Sea_King1")
    v1084:AddSeperator("Ghost Ship")
    local vu1112 = v1084:AddLabel("Status : " .. _G.redcircle)
    task.spawn(function()
        while task.wait(1) do
            vu1112:Set(vu459.find({
                "Ghost Ship"
            }) and "Check Ghost Ship Mon: " .. _G.greencircle or "Check Ghost Ship Mon: " .. _G.redcircle)
        end
    end)
    local vu1113 = v1084:AddLabel("HP : N/A")
    local vu1114 = v1084:AddLabel("Next Spawn : N/A")
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                vu1113:Set("HP : " .. vu1103())
                local v1115 = game:GetService("ReplicatedStorage"):GetAttribute("GhostShipSpawnText")
                if v1115 and v1115:match("^(%d+):(%d+):(%d+)$") then
                    local v1116, v1117, v1118 = v1115:match("(%d+):(%d+):(%d+)")
                    vu1114:Set("Next Spawn : " .. vu1090(v1116, v1117, v1118))
                else
                    vu1114:Set("Next Spawn : N/A")
                end
            end)
        end
    end)
    Toggle("Auto Attack Ghost Ship", v1084, "Auto_Kill_GhostMonster1")
end
if Sea3 then
    local vu1119 = v1084:AddLabel("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Blood Moon Status: ")
    local vu1120 = 3
    local vu1121 = 6
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                local v1122, v1123, v1124 = game:GetService("Lighting").TimeOfDay:match("^(%d+):(%d+):(%d+)$")
                local v1125 = tonumber(v1122)
                local v1126 = tonumber(v1123)
                local v1127 = tonumber(v1124)
                local v1128 = game:GetService("Lighting"):GetAttribute("Day") or 1
                if v1128 == vu1120 and vu1121 <= v1125 then
                    local v1129 = v1125 - vu1121
                    vu1119:Set(string.format("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Blood Moon Starting In: %02dH:%02dM:%02dS", v1129, v1126, v1127))
                else
                    local v1130 = vu1120 - v1128
                    if v1130 < 0 then
                        v1130 = v1130 + 7
                    end
                    local v1131 = v1130 * 24 + (vu1121 - v1125 - 1)
                    if v1131 < 0 then
                        v1131 = v1131 + 24
                    end
                    local v1132 = 59 - v1126
                    if 59 - v1127 == 59 then
                        v1132 = v1132 + 1
                    end
                    vu1119:Set(string.format("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Blood Moon Active: %02dH:%02dM:%02dS", math.floor(v1131 / 24), v1131 % 24, v1132))
                end
            end)
        end
    end)
    local vu1133 = v1084:AddLabel("Next Spawn: N/A")
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                local v1134 = game:GetService("ReplicatedStorage"):GetAttribute("ThirdSeaMonsterSpawnText")
                if v1134 then
                    if v1134:match("^(%d+):(%d+):(%d+)$") then
                        local v1135, v1136, v1137 = v1134:match("(%d+):(%d+):(%d+)")
                        vu1133:Set(string.format("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 SeaEventTime Spawn in: %02dH:%02dM:%02dS", tonumber(v1135), tonumber(v1136), tonumber(v1137)))
                    else
                        vu1133:Set("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 SeaEventTime Next Spawn: " .. v1134)
                    end
                else
                    vu1133:Set("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 SeaEventTime Next Spawn: " .. v1134)
                end
            end)
        end
    end)
    v1084:AddSeperator("Abyssal Tyrant")
    local vu1138 = v1084:AddLabel("Status : " .. _G.redcircle)
    task.spawn(function()
        while task.wait(1) do
            vu1138:Set(vu459.find({
                "SeaDragon"
            }) and "Check Abyssal TyrantMon: " .. _G.greencircle or "Check Abyssal TyrantMon: " .. _G.redcircle)
        end
    end)
    Toggle("Auto Kill Abyssal Tyrant", v1084, "Abyssal_Tyrant")
    v1084:AddSeperator("Chaos Kraken Boss")
    local vu1139 = v1084:AddLabel("Status : " .. _G.redcircle)
    task.spawn(function()
        while task.wait(1) do
            vu1139:Set(vu459.find({
                "FuryTentacle"
            }) and "Check Chaos Kraken Mon: " .. _G.greencircle or "Check Chaos Kraken Mon: " .. _G.redcircle)
        end
    end)
    Toggle("Auto Kill Chaos Kraken Boss", v1084, "Chaos_Kraken")
    v1084:AddSeperator("Deepsea Crusher")
    local vu1140 = v1084:AddLabel("Status : " .. _G.redcircle)
    task.spawn(function()
        while task.wait(1) do
            vu1140:Set(vu459.find({
                "ThirdSeaEldritch Crab"
            }) and "Check Deepsea Crusher Mon: " .. _G.greencircle or "Check Deepsea Crusher Mon: " .. _G.redcircle)
        end
    end)
    Toggle("Auto Kill Deepsea Crusher Boss", v1084, "Deepsea_Crusher")
    v1084:AddSeperator("Drakenfyr")
    local vu1141 = v1084:AddLabel("Status : " .. _G.redcircle)
    task.spawn(function()
        while task.wait(1) do
            vu1141:Set(vu459.find({
                "ThirdSeaDragon"
            }) and "Check Drakenfyr Mon: " .. _G.greencircle or "Check Drakenfyr Mon: " .. _G.redcircle)
        end
    end)
    Toggle("Auto Kill Drakenfyr the Inferno King", v1084, "auto_draken")
end
local v1142 = v996:AddSection("Settings", "Script Made By jay#0050", "Join Tsuo Hub Discord For Updates! \nuse at your own risk.", "http://www.roblox.com/asset/?id=6031233840")
Dropdown("Select Weapon ", {
    "Melee",
    "Sword",
    "Fruit Power",
    "all In One"
}, v1142, "Select_Weapon")
v1142:AddDropdown("Position Farm", {
    "Above",
    "Beside",
    "Lower"
}, _G.Settings.PositionFarm, function(p1143)
    _G.Settings.PositionFarm = p1143
    SaveSettings()
end)
v1142:Slider("DisFarm", 0, 100, _G.Disfarm or 7.5, function(p1144)
    _G.Disfarm = p1144
end)
Toggle("Bring Mob (Work 80%)", v1142, "Bring_Nearest_Mobs_Together")
function EnableBuso()
    local v1145 = Client
    if v1145 then
        v1145 = Client.Character
    end
    repeat
        wait()
    until v1145 or not v1145 and tick() - RecentlySpawn > RespawnTime
    if v1145:WaitForChild("Services"):FindFirstChild("Haki") and v1145:WaitForChild("Services"):FindFirstChild("Haki").Value == 0 then
        Client.PlayerStats.BusoShopValue.Value = "BusoHaki"
        game:GetService("ReplicatedStorage").Chest.Remotes.Events.Armament:FireServer()
        repeat
            wait(1)
        until v1145:WaitForChild("Services"):FindFirstChild("Haki").Value == 1
    end
end
v1142:AddToggle("Enable Buso", true, function(p1146)
    _G.Settings.EnableBuso = p1146
    print("Toggle Enable Buso is:", _G.Settings.EnableBuso)
    spawn(function()
        while _G.Settings.EnableBuso do
            EnableBuso()
            wait(0.4)
        end
    end)
    SaveSettings()
end)
v1142:AddToggle("Auto Active Observation Haki", _G.Settings.ObservationHak, function(p1147)
    _G.Settings.ObservationHak = p1147
    SaveSettings()
end)
Toggle("White screen ", v1142, function(p1148)
    game:GetService("RunService"):Set3dRenderingEnabled(not p1148)
end)
v1142:AddToggle("Auto Hide Level Up Text", _G.AutoHideLevelText, function(p1149)
    _G.AutoHideLevelText = p1149
end)
spawn(function()
    while true do
        if _G.AutoHideLevelText then
            local v1150 = game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Gui"):WaitForChild("LevelUp")
            if v1150 then
                v1150.Visible = false
            end
            local v1151 = game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Gui"):WaitForChild("ItemDrop")
            if v1151 then
                v1151.Visible = false
            end
        end
        wait(1)
    end
end)
_G.autohidehealth = _G.autohidehealth or false
local vu1152 = {
    workspace.Monster.Boss,
    workspace.Monster.Mon,
    game:GetService("ReplicatedStorage").MOB
}
local function vu1164(p1153)
    local v1154, v1155, v1156 = vu484(vu1152)
    while true do
        local v1157
        v1156, v1157 = v1154(v1155, v1156)
        if v1156 == nil then
            break
        end
        local v1158, v1159, v1160 = vu484(v1157:GetChildren())
        while true do
            local v1161
            v1160, v1161 = v1158(v1159, v1160)
            if v1160 == nil then
                break
            end
            local v1162 = v1161:FindFirstChild("BillboardGui")
            if v1162 then
                v1162.Enabled = not p1153
            end
            local v1163 = v1161:FindFirstChild("Humanoid")
            if v1163 then
                v1163.DisplayDistanceType = p1153 and Enum.HumanoidDisplayDistanceType.None or Enum.HumanoidDisplayDistanceType.Viewer
            end
        end
    end
end
local function vu1165()
    spawn(function()
        while _G.autohidehealth do
            vu1164(true)
            task.wait(1)
        end
        vu1164(false)
    end)
end
v1142:AddToggle("Auto Hide Mob Health", _G.autohidehealth, function(p1166)
    _G.autohidehealth = p1166
    if _G.autohidehealth then
        vu1165()
    else
        vu1164(false)
    end
    SaveSettings()
end)
v1142:AddToggle("Delete Damage Text", _G.DeleteDamage, function(p1167)
    _G.Delete = p1167
end)
v1142:AddToggle("Delete Heavy Effect", _G.DeleteEffext, function(p1168)
    _G.DeleteEffext = p1168
end)
spawn(function()
    while wait() do
        if _G.DeleteDamage then
            pcall(function()
                if game:GetService("Workspace"):FindFirstChild("DamageShow") then
                    game:GetService("Workspace"):FindFirstChild("DamageShow").Parent = game:GetService("Workspace").Camera
                end
            end)
        else
            pcall(function()
                if game:GetService("Workspace").Camera:FindFirstChild("DamageShow") then
                    game:GetService("Workspace").Camera:FindFirstChild("DamageShow").Parent = game:GetService("Workspace")
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.DeleteEffext then
            pcall(function()
                if game:GetService("Workspace"):FindFirstChild("Effects") then
                    game:GetService("Workspace"):FindFirstChild("Effects").Parent = game:GetService("Workspace").Camera
                end
            end)
        else
            pcall(function()
                if game:GetService("Workspace").Camera:FindFirstChild("Effects") then
                    game:GetService("Workspace").Camera:FindFirstChild("Effects").Parent = game:GetService("Workspace")
                end
            end)
        end
    end
end)
function KenHaki()
    local _ = game.Players.LocalPlayer.Character
    if workspace.PlayerCharacters.justachilllguy.Services.KenHaki == false then
        game:service("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
        game:service("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
    end
end
spawn(function()
    while task.wait() do
        if _G.Settings.ObservationHak then
            pcall(function()
                KenHaki()
            end)
        end
    end
end)
v1142:AddSeperator("Auto Use Skill")
v1142:AddToggle("Use Skill Z", _G.Settings.SkillZ, function(p1169)
    _G.Settings.SkillZ = p1169
    SaveSettings()
end)
v1142:AddToggle("Use Skill X", _G.Settings.SkillX, function(p1170)
    _G.Settings.SkillX = p1170
    SaveSettings()
end)
v1142:AddToggle("Use Skill C", _G.Settings.SkillC, function(p1171)
    _G.Settings.SkillC = p1171
    SaveSettings()
end)
v1142:AddToggle("Use Skill V", _G.Settings.SkillV, function(p1172)
    _G.Settings.SkillV = p1172
    SaveSettings()
end)
v1142:AddToggle("Use Skill B", _G.Settings.SkillB, function(p1173)
    _G.Settings.SkillB = p1173
    SaveSettings()
end)
v1142:AddToggle("Use Skill E", _G.Settings.SkillE, function(p1174)
    _G.Settings.SkillE = p1174
    SaveSettings()
end)
v1142:AddSeperator("Hold Skill")
v1142:Slider("Hold Z", 0, 100, vu458.Z, function(p1175)
    vu458.Z = p1175
    SaveSettings()
end)
v1142:Slider("Hold X", 0, 100, vu458.X, function(p1176)
    vu458.X = p1176
    SaveSettings()
end)
v1142:Slider("Hold C", 0, 100, vu458.C, function(p1177)
    vu458.C = p1177
    SaveSettings()
end)
v1142:Slider("Hold V", 0, 100, vu458.V, function(p1178)
    vu458.V = p1178
    SaveSettings()
end)
v1142:Slider("Hold B", 0, 100, vu458.B, function(p1179)
    vu458.B = p1179
    SaveSettings()
end)
v1142:Slider("Hold E", 0, 100, vu458.E, function(p1180)
    vu458.E = p1180
    SaveSettings()
end)
local vu1181 = 1
local vu1182 = false
local vu1183 = false
local vu1184 = false
local vu1185 = false
local vu1186 = true
local vu1187 = v1006:AddLabel("")
spawn(function()
    while task.wait() do
        vu1187:Set("Your Points: " .. tostring(game:GetService("Players").LocalPlayer.PlayerStats.Points.Value))
    end
end)
spawn(function()
    while task.wait() do
        if vu1186 then
            local v1188, v1189, v1190 = vu484({
                "Melee",
                "Defense",
                "Sword",
                "Fruit"
            })
            while true do
                local v1191
                v1190, v1191 = v1188(v1189, v1190)
                if v1190 == nil then
                    break
                end
                if v1191 == "Melee" and vu1182 or (v1191 == "Defense" and vu1183 or (v1191 == "Sword" and vu1184 or v1191 == "Fruit" and vu1185)) then
                    local v1192 = {
                        v1191,
                        vu1181
                    }
                    Client.PlayerGui.MainGui.StarterFrame.StatsFrame.RemoteEvent:FireServer(unpack(v1192))
                end
            end
        end
    end
end)
local vu1193 = v1006:AddLabel("")
local vu1194 = v1006:AddLabel("")
local vu1195 = v1006:AddLabel("")
local vu1196 = v1006:AddLabel("")
local vu1197 = v1006:AddLabel("")
spawn(function()
    while task.wait(0.1) do
        vu1193:Set("Level : " .. tostring(game:GetService("Players").LocalPlayer.PlayerStats.lvl.Value))
        vu1194:Set("Melee : " .. tostring(game:GetService("Players").LocalPlayer.PlayerStats.Melee.Value))
        vu1195:Set("Defense : " .. tostring(game:GetService("Players").LocalPlayer.PlayerStats.Defense.Value))
        vu1196:Set("Sword : " .. tostring(game:GetService("Players").LocalPlayer.PlayerStats.sword.Value))
        vu1197:Set("Devil Fruit : " .. tostring(game:GetService("Players").LocalPlayer.PlayerStats.DF.Value))
    end
end)
v1006:AddToggle("Melee", vu1182, function(p1198)
    vu1182 = p1198
end)
v1006:AddToggle("Defense", vu1183, function(p1199)
    vu1183 = p1199
end)
v1006:AddToggle("Sword", vu1184, function(p1200)
    vu1184 = p1200
end)
v1006:AddToggle("Devil Fruit", vu1185, function(p1201)
    vu1185 = p1201
end)
PlayerName = {}
local v1202, v1203, v1204 = vu483(game.Players:GetChildren())
while true do
    local v1205, v1206 = v1202(v1203, v1204)
    if v1205 == nil then
        break
    end
    v1204 = v1205
    if v1206.Name ~= game.Players.LocalPlayer.Name then
        table.insert(PlayerName, v1206.Name)
    end
end
local vu1208 = v1007:AddDropdown("Select Players", PlayerName, "", function(p1207)
    _G.SelectPly = p1207
end)
v1007:Button("Refresh Player", function()
    newPlayerName = {}
    local v1209, v1210, v1211 = vu483(game.Players:GetChildren())
    while true do
        local v1212
        v1211, v1212 = v1209(v1210, v1211)
        if v1211 == nil then
            break
        end
        if v1212.Name ~= game.Players.LocalPlayer.Name then
            table.insert(newPlayerName, v1212.Name)
        end
    end
    vu1208:Refresh(newPlayerName)
end)
v1007:AddToggle("Spectate Player", Spectate, function(p1213)
    Spectate = p1213
    local v1214 = game.Players.LocalPlayer.Character.Humanoid
    local v1215 = game.Players:FindFirstChild(_G.SelectPly)
    repeat
        task.wait()
        game.Workspace.Camera.CameraSubject = v1215.Character.Humanoid
    until Spectate == false
    game.Workspace.Camera.CameraSubject = v1214
end)
v1007:Button("Teleport", function()
    Tp(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame)
end)
v1007:AddToggle("Auto Kill Player", _G.AutoKillply, function(p1216)
    _G.AutoKillply = p1216
    CancelTween(_G.AutoKillply)
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoKillply and (game.Players:FindFirstChild(_G.SelectPly) and game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health > 0) then
                repeat
                    task.wait()
                    Attack()
                    Tp(game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * Farm_Mode)
                until game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health <= 0 or not _G.AutoKillply or not game.Players:FindFirstChild(_G.SelectPly)
            end
        end)
    end
end)
v1008:AddSeperator("Server")
v1008:Button("Rejoin Server", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)
v1008:Button("Server Hop", function()
    Hop()
end)
function Hop()
    local vu1217 = game.PlaceId
    local vu1218 = {}
    local vu1219 = ""
    local vu1220 = os.date("!*t").hour
    function TPReturner()
        local v1221
        if vu1219 ~= "" then
            v1221 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. vu1217 .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. vu1219))
        else
            v1221 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. vu1217 .. "/servers/Public?sortOrder=Asc&limit=100"))
        end
        if v1221.nextPageCursor and (v1221.nextPageCursor ~= "null" and v1221.nextPageCursor ~= nil) then
            vu1219 = v1221.nextPageCursor
        end
        local v1222, v1223, v1224 = vu483(v1221.data)
        local v1225 = 0
        while true do
            local v1226
            v1224, v1226 = v1222(v1223, v1224)
            if v1224 == nil then
                break
            end
            local v1227 = true
            local vu1228 = tostring(v1226.id)
            if tonumber(v1226.maxPlayers) > tonumber(v1226.playing) then
                local v1229, v1230, v1231 = vu483(vu1218)
                while true do
                    local v1232
                    v1231, v1232 = v1229(v1230, v1231)
                    if v1231 == nil then
                        break
                    end
                    if v1225 == 0 then
                        if tonumber(vu1220) ~= tonumber(v1232) then
                            pcall(function()
                                vu1218 = {}
                                table.insert(vu1218, vu1220)
                            end)
                        end
                    elseif vu1228 == tostring(v1232) then
                        v1227 = false
                    end
                    v1225 = v1225 + 1
                end
                if v1227 == true then
                    table.insert(vu1218, vu1228)
                    wait(0.1)
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(vu1217, vu1228, game.Players.LocalPlayer)
                    end)
                    wait(0.1)
                end
            end
        end
    end
    function Teleport()
        while wait(0.1) do
            pcall(function()
                TPReturner()
                if vu1219 ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end
v1008:Button("Teleport To Lower Server", function()
    local vu1233 = math.huge
    local vu1234 = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local vu1235 = nil
    local vu1236 = nil
    if not _G.FailedServerID then
        _G.FailedServerID = {}
    end
    local function vu1241()
        vu1236 = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(vu1234))
        local v1237, v1238, v1239 = vu483(vu1236.data)
        while true do
            local vu1240
            v1239, vu1240 = v1237(v1238, v1239)
            if v1239 == nil then
                break
            end
            pcall(function()
                if type(vu1240) == "table" and (vu1240.id and (vu1240.playing and (tonumber(vu1233) > tonumber(vu1240.playing) and not table.find(_G.FailedServerID, vu1240.id)))) then
                    vu1233 = vu1240.playing
                    vu1235 = vu1240.id
                end
            end)
        end
    end
    function getservers()
        pcall(vu1241)
        local v1242, v1243, v1244 = vu483(vu1236)
        while true do
            local v1245
            v1244, v1245 = v1242(v1243, v1244)
            if v1244 == nil then
                break
            end
            if v1244 == "nextPageCursor" then
                if vu1234:find("&cursor=") then
                    vu1234 = vu1234:gsub(vu1234:sub((vu1234:find("&cursor="))), "")
                end
                vu1234 = vu1234 .. "&cursor=" .. v1245
                pcall(getservers)
            end
        end
    end
    pcall(getservers)
    wait(0.1)
    if vu1235 ~= game.JobId then
        local _ = vu1233 ~= # game:GetService("Players"):GetChildren() - 1
    end
    table.insert(_G.FailedServerID, vu1235)
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, vu1235)
    while wait(0.1) do
        pcall(function()
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            game.CoreGui.RobloxPromptGui.promptOverlay.DescendantAdded:Connect(function()
                local v1246 = game.CoreGui.RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt")
                if v1246 and v1246.TitleFrame.ErrorTitle.Text == "Disconnected" then
                    if # game.Players:GetPlayers() > 1 then
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
                    else
                        game.Players.LocalPlayer:Kick("\nRejoining...")
                        wait(0.1)
                        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
                    end
                end
            end)
        end)
    end
end)
v1008:Textbox("Join Server(Join Discord!)", "Enter Job ID", function(p1247)
    if p1247:sub(1, 7) ~= "ZenHub_" then
        warn("Invalid join code format. The code must start with \'ZenHub_\'.")
    else
        local vu1248 = p1247:sub(8)
        if vu1248 and vu1248 ~= "" then
            local v1249, v1250 = pcall(function()
                vu5:TeleportToPlaceInstance(vu480, vu1248, vu1015.LocalPlayer)
            end)
            if v1249 then
                print("Successfully teleported!")
            else
                warn("Teleport failed:", v1250)
            end
        else
            warn("Invalid Job ID format.")
        end
    end
end)
v1008:AddToggle("Teleport First Sea", false, function()
    toQuest(workspace.AllNPC:FindFirstChild("Elite Pirate").CFrame, "Elite Pirate")
end)
v1008:AddToggle("Teleport Second Sea", false, function()
    toQuest(workspace.AllNPC:FindFirstChild("Elite Pirate").CFrame, "Elite Pirate")
end)
v1008:AddToggle("Teleport Third Sea", false, function()
    toQuest(workspace.AllNPC:FindFirstChild("The Squid").CFrame, "The Squid")
end)
v1008:AddSeperator("Teleport Island")
local v1251, v1252, v1253 = vu483(game:GetService("Workspace").Areas:GetChildren())
local v1254 = {}
while true do
    local v1255, v1256 = v1251(v1252, v1253)
    if v1255 == nil then
        break
    end
    v1253 = v1255
    if v1256.Name ~= "Sea of dust" then
        table.insert(v1254, v1256.Name)
    end
end
local vu1257 = "None"
v1008:AddDropdown("Island Select", v1254, "", function(p1258)
    vu1257 = p1258
end)
v1008:Button("Teleport To Island", function()
    if vu1257 == "None" then
        warn("Please select an island.")
    else
        local v1259, v1260, v1261 = vu483(game:GetService("Workspace").Areas:GetChildren())
        while true do
            local v1262
            v1261, v1262 = v1259(v1260, v1261)
            if v1261 == nil then
                break
            end
            if v1262.Name == vu1257 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1262.CFrame * CFrame.new(0, 300, 0)
                break
            end
        end
    end
end)
v1009:AddLabel("Npc Teleport")
local v1263, v1264, v1265 = vu483(game:GetService("Workspace").AllNPC:GetChildren())
local v1266 = {}
while true do
    local v1267
    v1265, v1267 = v1263(v1264, v1265)
    if v1265 == nil then
        break
    end
    table.insert(v1266, v1267.Name)
end
local vu1269 = v1009:AddDropdown("Select NPC", Colossuem and {
    ""
} or v1266, "", function(p1268)
    SelectedNpc = p1268
end)
v1009:Button("Teleport To NPC", function()
    local v1270, v1271, v1272 = vu483(game:GetService("Workspace").AllNPC:GetChildren())
    while true do
        local v1273
        v1272, v1273 = v1270(v1271, v1272)
        if v1272 == nil then
            break
        end
        if SelectedNpc == v1273.Name then
            tp1(v1273.CFrame)
        end
    end
end)
v1009:Button("Refresh Npc", function()
    local v1274, v1275, v1276 = vu483(game:GetService("Workspace").AllNPC:GetChildren())
    local v1277 = {}
    while true do
        local v1278
        v1276, v1278 = v1274(v1275, v1276)
        if v1276 == nil then
            break
        end
        table.insert(v1277, v1278.Name)
    end
    vu1269:Add(v1277)
end)
v1010:AddSeperator("Keys")
_G.selectedBuyKey = _G.selectedBuyKey or "Copper Key"
_G.buyAmount = 1
_G.buykey = _G.buykey or false
v1010:AddDropdown("Select key to buy", {
    "Iron Key",
    "Copper Key",
    "Gold Key"
}, _G.selectedBuyKey, function(p1279)
    _G.selectedBuyKey = p1279
end)
v1010:AddToggle("Auto-buy selected key", _G.buykey, function(p1280)
    _G.buykey = p1280
    if _G.buykey then
        spawn(function()
            while _G.buykey do
                BuyKey(_G.selectedBuyKey, _G.buyAmount)
                wait(1)
            end
        end)
    end
end)
function BuyKey(p1281, p1282)
    local vu1283 = {
        p1281,
        p1282
    }
    local v1284, v1285 = pcall(function()
        return game:GetService("ReplicatedStorage").Chest.Remotes.Functions.BuyKey:InvokeServer(unpack(vu1283))
    end)
    if not (v1284 and v1285) then
        warn("Failed to purchase key:", p1281, "Amount:", p1282, "Error:", v1285)
    end
end
v1010:AddToggle("Auto open Key", _G.openkey, function(p1286)
    _G.openkey = p1286
    if _G.openkey then
        if not _G.autoOpening then
            _G.autoOpening = true
            task.spawn(function()
                local v1287 = {
                    "Iron Key",
                    "Copper Key",
                    "Gold Key"
                }
                while _G.openkey do
                    local v1288, v1289, v1290 = vu484(v1287)
                    while true do
                        local v1291
                        v1290, v1291 = v1288(v1289, v1290)
                        if v1290 == nil then
                            break
                        end
                        OpenKey(v1291)
                    end
                end
                _G.autoOpening = false
            end)
        end
    else
        _G.autoOpening = false
    end
end)
function OpenKey(p1292)
    if p1292 then
        local vu1293 = {
            p1292,
            "Open1"
        }
        local v1294, v1295 = pcall(function()
            return game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("UseKey"):InvokeServer(unpack(vu1293))
        end)
        if not (v1294 and v1295) then
            warn("Failed to open key:", p1292, "Error:", v1295)
        end
    else
        warn("No key selected")
    end
end
local vu1296 = {
    "SpinFruit",
    "BombFruit",
    "BarrierFruit",
    "HumanFruit",
    "SmokeFruit",
    "SpikeFruit",
    "PawFruit",
    "ShadowFruit",
    "LoveFruit",
    "StringFruit",
    "IceFruit",
    "SandFruit",
    "PhoenixFruit",
    "GumFruit",
    "MagmaFruit",
    "LightFruit",
    "FlameFruit",
    "QuakeFruit",
    "RumbleFruit",
    "GravityFruit",
    "SnowFruit",
    "DoughFruit",
    "ToyFruit",
    "DragonFruit",
    "SpinoFruit",
    "LeopardFruit",
    "BuddhaFruit",
    "OpFruit"
}
_G.autocollectfruit = false
task.spawn(function()
    while true do
        if _G.autocollectfruit then
            pcall(function()
                local v1297, v1298, v1299 = vu483(vu1296)
                while true do
                    local v1300
                    v1299, v1300 = v1297(v1298, v1299)
                    if v1299 == nil then
                        break
                    end
                    local v1301 = game.Players.LocalPlayer
                    local v1302 = v1301.Character
                    local v1303 = v1301.PlayerGui
                    if v1302:FindFirstChild(v1300) and not v1303:FindFirstChild("EatFruitBecky") then
                        print(v1300 .. " is equipped but no EatFruitBecky UI found.")
                    elseif v1303:FindFirstChild("EatFruitBecky") then
                        vu106(v1303:FindFirstChild("EatFruitBecky").Dialogue.Collect)
                        wait(1)
                    elseif v1301.Backpack:FindFirstChild(v1300) then
                        vu1050(v1300)
                        wait(1)
                        Click()
                        click()
                    else
                        warn("Fruit not found: " .. v1300)
                    end
                end
            end)
        end
        task.wait(1)
    end
end)
v1010:AddToggle("Auto Store Fruit", _G.autocollectfruit, function(p1304)
    _G.autocollectfruit = p1304
    if _G.autocollectfruit then
        print("Auto Collect Fruit: Enabled")
    else
        print("Auto Collect Fruit: Disabled")
    end
end)
v1010:AddSeperator("Gacha Fruit")
DevilFruitList = {
    "SpinFruit",
    "BombFruit",
    "BarrierFruit",
    "HumanFruit",
    "SmokeFruit",
    "SpikeFruit",
    "PawFruit",
    "ShadowFruit",
    "LoveFruit",
    "StringFruit",
    "IceFruit",
    "SandFruit",
    "PhoenixFruit",
    "GumFruit",
    "MagmaFruit",
    "LightFruit",
    "FlameFruit",
    "QuakeFruit",
    "RumbleFruit",
    "GravityFruit",
    "SnowFruit",
    "DoughFruit",
    "ToyFruit",
    "DragonFruit",
    "SpinoFruit",
    "LeopardFruit",
    "BuddhaFruit",
    "OpFruit"
}
v1010:AddDropdown("Select Devil Fruit", DevilFruitList, "", function(p1305)
    DevilFruitSelected = p1305
end)
v1010:AddToggle("Auto Buy Devil Fruit", BuyDevilFruit, function(p1306)
    BuyDevilFruit = p1306
end)
task.spawn(function()
    while task.wait() do
        if BuyDevilFruit then
            pcall(function()
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(DevilFruitSelected) and game:GetService("Players").LocalPlayer.Character:FindFirstChild(DevilFruitSelected) == nil then
                    local v1307 = {
                        DevilFruitSelected,
                        true
                    }
                    game:GetService("ReplicatedStorage").Chest.Remotes.Functions.BuyFruitStock:InvokeServer(unpack(v1307))
                end
            end)
        end
    end
end)
v1010:AddToggle("Bring All Devil Fruit", BringDevilFruit, function(p1308)
    BringDevilFruit = p1308
end)
spawn(function()
    while task.wait() do
        if BringDevilFruit then
            pcall(function()
                local v1309 = game.Players.LocalPlayer.Character.HumanoidRootPart
                local v1310, v1311, v1312 = vu483(game.Workspace:GetChildren())
                while true do
                    local v1313
                    v1312, v1313 = v1310(v1311, v1312)
                    if v1312 == nil then
                        break
                    end
                    if string.find(v1313.Name, "Fruit") and v1313:IsA("Tool") then
                        v1313.Handle.CanCollide = false
                        v1313.Handle.CFrame = v1309.CFrame
                        wait(0.2)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v1313.Handle, 0)
                    end
                end
            end)
        end
    end
end)
v1010:Button("Teleport To Random Devil Fruit Shop", function()
    toQuest(workspace.AllNPC:FindFirstChild("DFruitShop").CFrame)
end)
v1010:Button("Teleport To Devil Fruit Shop", function()
    toQuest(workspace.AllNPC:FindFirstChild("DFruitShop").CFrame)
end)
if Sea1 then
    v1011:Button("Soru Shop", function()
        tp1(CFrame.new(- 2519, 75, - 2649))
    end)
    v1011:Button("Buso Shop", function()
        tp1(CFrame.new(1953, 44, 914))
    end)
    v1011:Button("Ken Shop", function()
        tp1(CFrame.new(- 4960, 462, 1175))
    end)
    v1011:Button("Katana", function()
        tp1(CFrame.new(- 2064, 49, - 4258))
    end)
    v1011:Button("Pipe Sword", function()
        tp1(CFrame.new(1519, 18, 1008))
    end)
    v1011:Button("Mini Race", function()
        tp1(CFrame.new(2505, 282, - 1609))
    end)
elseif Sea2 then
    v1011:Button("Water Style Shop", function()
        tp1(CFrame.new(- 4831.19971, 57.822052, 153.415283, - 0.414802402, - 5.48522792e-8, - 0.909911513, - 5.58345725e-8, 1, - 3.48297213e-8, 0.909911513, 3.63570685e-8, - 0.414802402))
    end)
    v1011:Button("Dragon Claw Shop", function()
        tp1(CFrame.new(- 4603.89355, 337.312164, 599.383667, - 0.962977529, - 4.1851969e-8, - 0.269581646, - 5.81633124e-8, 1, 5.25183914e-8, 0.269581646, 6.625379e-8, - 0.962977529))
    end)
end
v1011:Button("Sky Jump", function()
    if Sea1 then
        tp1(CFrame.new(- 2192.19214, 48.7368965, - 4475.83301, - 0.543718636, - 7.02707084e-8, - 0.839267552, - 9.75050725e-8, 1, - 2.05600514e-8, 0.839267552, 7.06539609e-8, - 0.543718636))
    elseif Sea2 then
        tp1(CFrame.new(- 3730.19189, 57.8862038, 204.094666, 0.984767377, - 1.1842487e-8, 0.173876956, 7.55866214e-9, 1, 2.5299288e-8, - 0.173876956, - 2.3599636e-8, 0.984767377))
    end
end)
v1011:Button("Reroll Race", function()
    if Sea1 then
        tp1(CFrame.new(- 2074.55688, 76.3055191, - 4497.41357, 0.6812042, - 1.16788412e-9, - 0.732093453, 3.87939153e-10, 1, - 1.23429367e-9, 0.732093453, 5.5679833e-10, 0.6812042))
    elseif Sea2 then
        tp1(CFrame.new(- 4949.18311, 57.822052, 191.524734, - 0.833928227, 3.89729315e-8, 0.551872909, - 1.38614071e-8, 1, - 9.15651981e-8, - 0.551872909, - 8.40085335e-8, - 0.833928227))
    end
end)
v1011:Button("Reset Stat", function()
    if Sea1 then
        tp1(CFrame.new(- 2072.95557, 48.7796097, - 4405.29053, 0.461064994, - 2.14056026e-8, 0.887366354, - 5.51042501e-9, 1, 2.69857718e-8, - 0.887366354, - 1.73319599e-8, 0.461064994))
    elseif Sea2 then
        tp1(CFrame.new(- 4843.9707, 58.0297661, 70.0297165, 0.288221925, 5.95155969e-9, 0.957563639, 9.68969527e-9, 1, - 9.13186593e-9, - 0.957563639, 1.19105037e-8, 0.288221925))
    end
end)
v1011:Button("Black Leg Shop", function()
    if Sea1 then
        tp1(CFrame.new(- 4206.44971, 109.067413, - 2932.71362, 0.979351342, 6.7444752e-9, - 0.202165633, - 1.24095703e-8, 1, - 2.67545666e-8, 0.202165633, 2.87109092e-8, 0.979351342))
    elseif Sea2 then
        tp1(CFrame.new(- 4918.97363, 60.340538, 55.1117287, 0.950969398, 1.60718479e-8, 0.309284925, - 1.49673909e-8, 1, - 5.9437637e-9, - 0.309284925, 1.02314912e-9, 0.950969398))
    end
end)
v1011:Button("Cybrog Shop", function()
    if Sea1 then
        tp1(CFrame.new(- 264.232269, 124.836227, - 1400.2168, - 0.385267437, 7.39628803e-9, - 0.922804952, 1.14298544e-8, 1, 3.24308713e-9, 0.922804952, - 9.29807076e-9, - 0.385267437))
    elseif Sea2 then
        tp1(CFrame.new(- 4969.50391, 57.772007, 165.519562, 0.456807017, 2.94110976e-8, 0.889565825, - 7.4581024e-8, 1, 5.23630428e-9, - 0.889565825, - 6.87367105e-8, 0.456807017))
    end
end)
if not Colossuem then
    v1012:AddLabel("In Dungeon Only!")
end
function UseSkill(p1314)
    Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
    game:GetService("VirtualInputManager"):SendKeyEvent(true, p1314, false, game)
    task.wait()
    game:GetService("VirtualInputManager"):SendKeyEvent(false, p1314, false, game)
end
v1012:Button("Teleport To Raid Entrance", function()
    tp1(CFrame.new(- 4567, 223, - 80))
end)
if Colossuem then
    v1012:AddToggle("Auto Farm Dungeon", _G.AutoFarmDungeon, function(p1315)
        _G.AutoFarmDungeon = p1315
    end)
    v1012:Slider("Safe Raid Health", 1, 100, 50, function(p1316)
        _G.SaveAt = p1316
    end)
    v1012:Slider("Distance", 1, 100, 30, function(p1317)
        DistanceDungeon = p1317
    end)
    spawn(function()
        while wait() do
            if _G.AutoFarmDungeon and not _G.NotEquip then
                pcall(function()
                    local v1318, v1319, v1320 = vu484(game:GetService("Players").LocalPlayer.Backpack:GetChildren())
                    while true do
                        local v1321
                        v1320, v1321 = v1318(v1319, v1320)
                        if v1320 == nil then
                            break
                        end
                        if v1321:IsA("Tool") then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1321)
                        end
                    end
                end)
            end
        end
    end)
    spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoFarmDungeon then
                    if game.Players.LocalPlayer.Character.Humanoid.Health <= game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt then
                        AutoFarmMobDungeon = false
                        AutoSaveModeDungeon = true
                    else
                        AutoFarmMobDungeon = true
                        AutoSaveModeDungeon = false
                    end
                end
            end)
        end
    end)
    spawn(function()
        while wait() do
            if _G.AutoFarmDungeon and AutoFarmMobDungeon then
                pcall(function()
                    if game.Players.LocalPlayer.Character.Humanoid.Health > game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt then
                        local v1322, v1323, v1324 = vu483(game:GetService("Workspace").MOB:GetChildren())
                        while true do
                            local v1325
                            v1324, v1325 = v1322(v1323, v1324)
                            if v1324 == nil then
                                break
                            end
                            if v1325:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    task.wait()
                                    _G.NotEquip = false
                                    tp1(v1325.HumanoidRootPart.CFrame * CFrame.new(0, 15, DistanceDungeon))
                                    wait(0.5)
                                    UseSkill("B")
                                    wait(0.5)
                                    UseSkill("Z")
                                    wait(0.5)
                                    UseSkill("X")
                                    wait(0.5)
                                    UseSkill("C")
                                    wait(0.5)
                                    UseSkill("V")
                                    wait(0.5)
                                until v1325.Humanoid.Health <= 0 or (not _G.AutoFarmDungeon or (not AutoFarmMobDungeon or game.Players.LocalPlayer.Character.Humanoid.Health <= game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt))
                            end
                        end
                    end
                end)
            end
        end
    end)
    spawn(function()
        while wait() do
            if _G.AutoFarmDungeon and AutoSaveModeDungeon then
                pcall(function()
                    if game.Players.LocalPlayer.Character.Humanoid.Health > game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt then
                        return
                    else
                        while true do
                            if true then
                                task.wait()
                                _G.NotEquip = true
                                if game:GetService("Workspace").Island:FindFirstChild("Arena1") then
                                    tp1(CFrame.new(- 9.393295288085938, 201.8232879638672, 16.94792366027832))
                                else
                                    tp1(CFrame.new(- 19.639192581176758, 182.88330078125, 6.57674503326416))
                                end
                            end
                            local v1326, v1327, v1328 = vu483(game.Players.LocalPlayer.Backpack:GetChildren())
                            while true do
                                local v1329
                                v1328, v1329 = v1326(v1327, v1328)
                                if v1328 == nil then
                                    break
                                end
                                if v1329:IsA("Tool") and v1329.ToolTip == "Fruit Power" then
                                    EquipWeapon(v1329.Name)
                                end
                            end
                            local v1330, v1331, v1332 = vu483(game.Players.LocalPlayer.Character:GetChildren())
                            while true do
                                local v1333
                                v1332, v1333 = v1330(v1331, v1332)
                                if v1332 == nil then
                                    break
                                end
                                if v1333:IsA("Tool") and v1333.ToolTip == "Fruit Power" then
                                    EquipWeapon(v1333.Name)
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                            if game.Players.LocalPlayer.Character.Humanoid.Health == game.Players.LocalPlayer.Character.Humanoid.MaxHealth or not (AutoSaveModeDungeon and _G.AutoFarmDungeon) then
                                _G.NotEquip = false
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                            end
                        end
                    end
                end)
            end
        end
    end)
end
v1013:AddToggle("Inf Geppo", InfGeppo, function(p1334)
    InfGeppo = p1334
end)
v1013:AddToggle("Fly", Flys, function(p1335)
    Flys = p1335
end)
spawn(function()
    while wait() do
        pcall(function()
            if Flys then
                fly()
            end
        end)
    end
end)
function fly()
    local v1336 = game.Players.LocalPlayer:GetMouse("")
    localplayer = game.Players.LocalPlayer
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local vu1337 = game.Players.LocalPlayer.Character.HumanoidRootPart
    local vu1338 = 25
    local vu1339 = {
        a = false,
        d = false,
        w = false,
        s = false
    }
    local vu1340 = nil
    local vu1341 = nil
    local function v1345()
        local v1342 = Instance.new("BodyPosition", vu1337)
        local v1343 = Instance.new("BodyGyro", vu1337)
        v1342.Name = "EPIXPOS"
        v1342.maxForce = Vector3.new(math.huge, math.huge, math.huge)
        v1342.position = vu1337.Position
        v1343.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
        v1343.CFrame = vu1337.CFrame
        while true do
            wait()
            localplayer.Character.Humanoid.PlatformStand = true
            local v1344 = v1343.CFrame - v1343.CFrame.p + v1342.position
            if not (vu1339.w or (vu1339.s or (vu1339.a or vu1339.d))) then
                speed = 1
            end
            if vu1339.w then
                v1344 = v1344 + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed = speed + vu1338
            end
            if vu1339.s then
                v1344 = v1344 - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed = speed + vu1338
            end
            if vu1339.d then
                v1344 = v1344 * CFrame.new(speed, 0, 0)
                speed = speed + vu1338
            end
            if vu1339.a then
                v1344 = v1344 * CFrame.new(- speed, 0, 0)
                speed = speed + vu1338
            end
            if vu1338 < speed then
                speed = vu1338
            end
            v1342.position = v1344.p
            if vu1339.w then
                v1343.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(- math.rad(speed * 15), 0, 0)
            elseif vu1339.s then
                v1343.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(speed * 15), 0, 0)
            else
                v1343.CFrame = workspace.CurrentCamera.CoordinateFrame
            end
            if not Fly then
                if v1343 then
                    v1343:Destroy()
                end
                if v1342 then
                    v1342:Destroy()
                end
                flying = false
                localplayer.Character.Humanoid.PlatformStand = false
                speed = 0
                return
            end
        end
    end
    vu1340 = v1336.KeyDown:connect(function(p1346)
        if vu1337 and vu1337.Parent then
            if p1346 == "w" then
                vu1339.w = true
            elseif p1346 == "s" then
                vu1339.s = true
            elseif p1346 == "a" then
                vu1339.a = true
            elseif p1346 == "d" then
                vu1339.d = true
            end
        else
            flying = false
            vu1340:disconnect()
            vu1341:disconnect()
        end
    end)
    vu1341 = v1336.KeyUp:connect(function(p1347)
        if p1347 == "w" then
            vu1339.w = false
        elseif p1347 == "s" then
            vu1339.s = false
        elseif p1347 == "a" then
            vu1339.a = false
        elseif p1347 == "d" then
            vu1339.d = false
        end
    end)
    v1345()
end
v1013:AddToggle("No Clip", _G.NoClip, function(p1348)
    _G.NoClip = p1348
end)
v1014:AddToggle("Esp Player", PlayerESP, function(p1349)
    PlayerESP = p1349
    while PlayerESP do
        wait()
        FindPlayer()
    end
end)
v1014:AddToggle("Esp Devil Fruit", DevilFruitESP, function(p1350)
    DevilFruitESP = p1350
    while DevilFruitESP do
        wait()
        FindDevilFruit()
    end
end)
v1014:AddToggle("Esp Legacy Island", LegacyIslandESP, function(p1351)
    LegacyIslandESP = p1351
    while LegacyIslandESP do
        wait()
        FindLegacyIsland()
    end
end)
v1014:AddToggle("Esp Hydra Island", HydraIslandESP, function(p1352)
    HydraIslandESP = p1352
    while HydraIslandESP do
        wait()
        FindHydraIsland()
    end
end)
v1014:AddToggle("Esp Ghost Ship", GhostShipESP, function(p1353)
    GhostShipESP = p1353
    while GhostShipESP do
        wait()
        FindGhostShip()
    end
end)
Number = math.random(1, 1000000)
function FindPlayer()
    local v1354, v1355, v1356 = vu483(game:GetService("Players"):GetChildren())
    while true do
        local vu1357
        v1356, vu1357 = v1354(v1355, v1356)
        if v1356 == nil then
            break
        end
        pcall(function()
            if vu1357.Character then
                if PlayerESP then
                    if vu1357.Character.Head and not vu1357.Character.Head:FindFirstChild("PlayerESP" .. Number) then
                        local v1358 = Instance.new("BillboardGui", vu1357.Character.Head)
                        v1358.Name = "PlayerESP" .. Number
                        v1358.ExtentsOffset = Vector3.new(0, 1, 0)
                        v1358.Size = UDim2.new(1, 200, 1, 30)
                        v1358.Adornee = vu1357.Character.Head
                        v1358.AlwaysOnTop = true
                        local v1359 = Instance.new("TextLabel", v1358)
                        v1359.Font = "GothamBold"
                        v1359.FontSize = "Size14"
                        v1359.Text = vu1357.Name .. "\n" .. math.round((vu1357.Character.Head.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                        v1359.Size = UDim2.new(1, 0, 1, 0)
                        v1359.BackgroundTransparency = 1
                        v1359.TextStrokeTransparency = 0.5
                        if vu1357.Team ~= game:GetService("Players").LocalPlayer.Team then
                            v1359.TextColor3 = Color3.new(255, 0, 0)
                        else
                            v1359.TextColor3 = Color3.new(0, 255, 0)
                        end
                    else
                        vu1357.Character.Head["PlayerESP" .. Number].TextLabel.Text = vu1357.Name .. "\n" .. math.round((vu1357.Character.Head.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                    end
                elseif vu1357.Character.Head:FindFirstChild("PlayerESP" .. Number) then
                    vu1357.Character.Head:FindFirstChild("PlayerESP" .. Number):Destroy()
                end
            end
        end)
    end
end
function FindDevilFruit()
    local v1360, v1361, v1362 = vu483(game:GetService("Workspace"):GetChildren())
    while true do
        local vu1363
        v1362, vu1363 = v1360(v1361, v1362)
        if v1362 == nil then
            break
        end
        pcall(function()
            if string.find(vu1363.Name, "Fruit") then
                if DevilFruitESP then
                    if string.find(vu1363.Name, "Fruit") then
                        if vu1363.Handle:FindFirstChild("DevilESP" .. Number) then
                            vu1363.Handle["DevilESP" .. Number].TextLabel.Text = vu1363.Name .. "\n" .. math.round((vu1363.Handle.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                        else
                            local v1364 = Instance.new("BillboardGui", vu1363.Handle)
                            v1364.Name = "DevilESP" .. Number
                            v1364.ExtentsOffset = Vector3.new(0, 1, 0)
                            v1364.Size = UDim2.new(1, 200, 1, 30)
                            v1364.Adornee = vu1363.Handle
                            v1364.AlwaysOnTop = true
                            local v1365 = Instance.new("TextLabel", v1364)
                            v1365.Font = "GothamBold"
                            v1365.FontSize = "Size14"
                            v1365.Size = UDim2.new(1, 0, 1, 0)
                            v1365.BackgroundTransparency = 1
                            v1365.TextStrokeTransparency = 0.5
                            v1365.Text = vu1363.Name .. "\n" .. math.round((vu1363.Handle.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                            v1365.TextColor3 = Color3.new(255, 255, 0)
                        end
                    end
                elseif vu1363.Handle:FindFirstChild("DevilESP" .. Number) then
                    vu1363.Handle:FindFirstChild("DevilESP" .. Number):Destroy()
                end
            end
        end)
    end
end
function FindGhostShip()
    local v1366, v1367, v1368 = vu483(game:GetService("Workspace").GhostMonster:GetChildren())
    while true do
        local vu1369
        v1368, vu1369 = v1366(v1367, v1368)
        if v1368 == nil then
            break
        end
        pcall(function()
            if vu1369.Name == "Ghost Ship" then
                if GhostShipESP then
                    if vu1369.Name == "Ghost Ship" then
                        if vu1369.HumanoidRootPart:FindFirstChild("GhostESP" .. Number) then
                            vu1369.HumanoidRootPart["GhostESP" .. Number].TextLabel.Text = "Ghost Ship" .. "\n" .. math.round((vu1369.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                        else
                            local v1370 = Instance.new("BillboardGui", vu1369.HumanoidRootPart)
                            v1370.Name = "GhostESP" .. Number
                            v1370.ExtentsOffset = Vector3.new(0, 1, 0)
                            v1370.Size = UDim2.new(1, 200, 1, 30)
                            v1370.Adornee = vu1369.HumanoidRootPart
                            v1370.AlwaysOnTop = true
                            local v1371 = Instance.new("TextLabel", v1370)
                            v1371.Font = "GothamBold"
                            v1371.FontSize = "Size14"
                            v1371.Size = UDim2.new(1, 0, 1, 0)
                            v1371.BackgroundTransparency = 1
                            v1371.TextStrokeTransparency = 0.5
                            v1371.Text = "Ghost Ship" .. "\n" .. math.round((vu1369.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                            v1371.TextColor3 = Color3.new(204, 159, 40)
                        end
                    end
                elseif vu1369.HumanoidRootPart:FindFirstChild("GhostESP" .. Number) then
                    vu1369.HumanoidRootPart:FindFirstChild("GhostESP" .. Number):Destroy()
                end
            end
        end)
    end
end
function FindLegacyIsland()
    local v1372, v1373, v1374 = vu483(game:GetService("Workspace").Island:GetChildren())
    while true do
        local vu1375
        v1374, vu1375 = v1372(v1373, v1374)
        if v1374 == nil then
            break
        end
        pcall(function()
            if string.find(vu1375.Name, "Legacy Island") then
                if LegacyIslandESP then
                    if string.find(vu1375.Name, "Legacy Island") then
                        if vu1375.Main:FindFirstChild("GayESP" .. Number) then
                            vu1375.Main["GhostESP" .. Number].TextLabel.Text = "Legacy Island" .. "\n" .. math.round((vu1375.Main.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                        else
                            local v1376 = Instance.new("BillboardGui", vu1375.Main)
                            v1376.Name = "GayESP" .. Number
                            v1376.ExtentsOffset = Vector3.new(0, 1, 0)
                            v1376.Size = UDim2.new(1, 200, 1, 30)
                            v1376.Adornee = vu1375.Main
                            v1376.AlwaysOnTop = true
                            local v1377 = Instance.new("TextLabel", v1376)
                            v1377.Font = "GothamBold"
                            v1377.FontSize = "Size14"
                            v1377.Size = UDim2.new(1, 0, 1, 0)
                            v1377.BackgroundTransparency = 1
                            v1377.TextStrokeTransparency = 0.5
                            v1377.Text = "Legacy Island" .. "\n" .. math.round((vu1375.Main.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                            v1377.TextColor3 = Color3.new(255, 255, 255)
                        end
                    end
                elseif vu1375.Main:FindFirstChild("GayESP" .. Number) then
                    vu1375.Main:FindFirstChild("GayESP" .. Number):Destroy()
                end
            end
        end)
    end
end
function FindHydraIsland()
    local v1378, v1379, v1380 = vu483(game:GetService("Workspace").Island:GetChildren())
    while true do
        local vu1381
        v1380, vu1381 = v1378(v1379, v1380)
        if v1380 == nil then
            break
        end
        pcall(function()
            if string.find(vu1381.Name, "Sea King") then
                if HydraIslandESP then
                    if string.find(vu1381.Name, "Sea King") then
                        if vu1381.Main:FindFirstChild("HydraESP" .. Number) then
                            vu1381.Main["GhostESP" .. Number].TextLabel.Text = "Hydra Island" .. "\n" .. math.round((vu1381.Main.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                        else
                            local v1382 = Instance.new("BillboardGui", vu1381.Main)
                            v1382.Name = "HydraESP" .. Number
                            v1382.ExtentsOffset = Vector3.new(0, 1, 0)
                            v1382.Size = UDim2.new(1, 200, 1, 30)
                            v1382.Adornee = vu1381.Main
                            v1382.AlwaysOnTop = true
                            local v1383 = Instance.new("TextLabel", v1382)
                            v1383.Font = "GothamBold"
                            v1383.FontSize = "Size14"
                            v1383.Size = UDim2.new(1, 0, 1, 0)
                            v1383.BackgroundTransparency = 1
                            v1383.TextStrokeTransparency = 0.5
                            v1383.Text = "Hydra Island" .. "\n" .. math.round((vu1381.Main.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                            v1383.TextColor3 = Color3.new(0, 255, 255)
                        end
                    end
                elseif vu1381.Main:FindFirstChild("HydraESP" .. Number) then
                    vu1381.Main:FindFirstChild("HydraESP" .. Number):Destroy()
                end
            end
        end)
    end
end
loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenHubbScript/Main/refs/heads/main/log"))()
getSpawn()
local v1384 = getrawmetatable(game)
local vu1385 = v1384.__namecall
setreadonly(v1384, false)
function v1384.__namecall(...)
    local v1386 = {
        ...
    }
    if getnamecallmethod() == "InvokeServer" and (tostring(v1386[1]) == "SkillAction" and getgenv().PosMonSkill) then
        if not v1386[3] then
            return vu1385(...)
        end
        if v1386[3].Type == "Up" or v1386[3].Type == "Down" then
            v1386[3].MouseHit = getgenv().PosMonSkill
            return vu1385(unpack(v1386))
        end
    end
    return vu1385(...)
end