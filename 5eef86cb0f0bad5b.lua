-- ts file was generated at discord.gg/25ms


local vu1 = loadstring(game:HttpGet("https://lua-library.btteam.net/Library/SystemUI.txt"))()
local v2 = vu1
local v3 = vu1.CreateWindow(v2, "BT Project")
local v4 = {
    Tab_1 = v3:addTab("#Home"),
    Tab_Setting = v3:addTab("#Setting"),
    Tab_2 = v3:addTab("#Main"),
    Tab_3 = v3:addTab("#Raid/Combat"),
    Tab_4 = v3:addTab("#Shop"),
    Tab_5 = v3:addTab("#Stat/Teleport"),
    Tab_6 = v3:addTab("#Misc")
}
local v5 = v4.Tab_1:addSection():addMenu("#Changelog")
v5:addChangelog("[April, 18 2024]")
v5:addChangelog("- Update Mob List")
v5:addChangelog("- Fixed Can\'t Get Quest")
v5:addChangelog("- Fixed Quest at Level 3325")
v5:addChangelog("")
v5:addChangelog("[March, 29 2024]")
v5:addChangelog("- Fixed Menu not Load")
v5:addChangelog("- Fixed some bug")
v5:addChangelog("- Update Sea 3")
v5:addChangelog("- Added Mob Farm")
v5:addChangelog("- Added Auto Kill Kraken")
v5:addChangelog("- Added Auto Sea 3")
v5:addChangelog("- Added Npc ESP and Island ESP")
v5:addChangelog("")
v5:addChangelog("[December, 3 2023]")
v5:addChangelog("- Change to New UI")
v5:addChangelog("- Improved Script")
v5:addChangelog("- Fixed bug issue")
local v6 = v4.Tab_1:addSection():addMenu("#Home")
getgenv().WalkSpeedValue = 26
v6:addTextbox("Speed Hack", getgenv().WalkSpeedValue, function(p7)
    getgenv().WalkSpeedValue = p7
    if getgenv().WalkSpeedValue then
        local vu8 = game:service("Players").LocalPlayer
        vu8.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            vu8.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
        end)
        vu8.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
    end
end)
getgenv().JumpValue = 50
v6:addTextbox("Jump Hack", getgenv().JumpValue, function(p9)
    getgenv().JumpValue = p9
    if getgenv().JumpValue then
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = getgenv().JumpValue
    end
end)
v6:addToggle("Infinite Jump", InfiniteJumpEnabled, function(p10)
    InfiniteJumpEnabled = p10
    if InfiniteJumpEnabled then
        game:GetService("UserInputService").JumpRequest:connect(function()
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end)
    end
end)
v6:addToggle("No Clip", getgenv().NoClip, function(p11)
    getgenv().NoClip = p11
end)
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if getgenv().NoClip then
                local v12, v13, v14 = pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())
                while true do
                    local v15
                    v14, v15 = v12(v13, v14)
                    if v14 == nil then
                        break
                    end
                    if v15:IsA("BasePart") then
                        v15.CanCollide = false
                    end
                end
            end
        end)
    end)
end)
getgenv().AntiAFK = true
v6:addToggle("Anti AFK", getgenv().AntiAFK, function(p16)
    getgenv().AntiAFK = p16
end)
task.spawn(function()
    while wait(0.1) do
        if getgenv().AntiAFK then
            local vu17 = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                vu17:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                wait(1)
                vu17:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)
        end
    end
end)
getgenv().AntiKickClient = true
v6:addToggle("Anti Kick Client", getgenv().AntiKickClient, function(p18)
    getgenv().AntiKickClient = p18
end)
task.spawn(function()
    while wait() do
        if getgenv().AntiKickClient then
            loadstring(game:HttpGet("https://gitlab.com/Sky2836/BT/-/raw/main/antikickclient"))()
        end
    end
end)
v6:addButton("FPS Boost", function()
    local v19 = game
    local v20 = v19.Workspace
    local v21 = v19.Lighting
    local v22 = v20.Terrain
    v22.WaterWaveSize = 0
    v22.WaterWaveSpeed = 0
    v22.WaterReflectance = 0
    v22.WaterTransparency = 0
    v21.GlobalShadows = false
    v21.FogEnd = 9000000000
    v21.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    local v23, v24, v25 = pairs(v19:GetDescendants())
    local v26 = false
    while true do
        local v27
        v25, v27 = v23(v24, v25)
        if v25 == nil then
            break
        end
        if v27:IsA("Part") or (v27:IsA("Union") or (v27:IsA("CornerWedgePart") or v27:IsA("TrussPart"))) then
            v27.Material = "Plastic"
            v27.Reflectance = 0
        elseif v27:IsA("Decal") or v27:IsA("Texture") and v26 then
            v27.Transparency = 1
        elseif v27:IsA("ParticleEmitter") or v27:IsA("Trail") then
            v27.Lifetime = NumberRange.new(0)
        elseif v27:IsA("Explosion") then
            v27.BlastPressure = 1
            v27.BlastRadius = 1
        elseif v27:IsA("Fire") or (v27:IsA("SpotLight") or (v27:IsA("Smoke") or v27:IsA("Sparkles"))) then
            v27.Enabled = false
        elseif v27:IsA("MeshPart") then
            v27.Material = "Plastic"
            v27.Reflectance = 0
            v27.TextureID = 1.0385902758728956e16
        end
    end
    local v28, v29, v30 = pairs(v21:GetChildren())
    while true do
        local v31
        v30, v31 = v28(v29, v30)
        if v30 == nil then
            break
        end
        if v31:IsA("BlurEffect") or (v31:IsA("SunRaysEffect") or (v31:IsA("ColorCorrectionEffect") or (v31:IsA("BloomEffect") or v31:IsA("DepthOfFieldEffect")))) then
            v31.Enabled = false
        end
    end
end)
v6:addButton("Rejoin Server", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)
v6:addButton("Server Hop", function()
    Hop()
end)
function Hop()
    local vu32 = game.PlaceId
    local vu33 = {}
    local vu34 = ""
    local vu35 = os.date("!*t").hour
    function TPReturner()
        local v36
        if vu34 ~= "" then
            v36 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. vu32 .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. vu34))
        else
            v36 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. vu32 .. "/servers/Public?sortOrder=Asc&limit=100"))
        end
        if v36.nextPageCursor and (v36.nextPageCursor ~= "null" and v36.nextPageCursor ~= nil) then
            vu34 = v36.nextPageCursor
        end
        local v37, v38, v39 = pairs(v36.data)
        local v40 = 0
        while true do
            local v41
            v39, v41 = v37(v38, v39)
            if v39 == nil then
                break
            end
            local v42 = true
            local vu43 = tostring(v41.id)
            if tonumber(v41.maxPlayers) > tonumber(v41.playing) then
                local v44, v45, v46 = pairs(vu33)
                while true do
                    local v47
                    v46, v47 = v44(v45, v46)
                    if v46 == nil then
                        break
                    end
                    if v40 == 0 then
                        if tonumber(vu35) ~= tonumber(v47) then
                            pcall(function()
                                vu33 = {}
                                table.insert(vu33, vu35)
                            end)
                        end
                    elseif vu43 == tostring(v47) then
                        v42 = false
                    end
                    v40 = v40 + 1
                end
                if v42 == true then
                    table.insert(vu33, vu43)
                    wait(0.1)
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(vu32, vu43, game.Players.LocalPlayer)
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
                if vu34 ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end
v6:addButton("Teleport To Lower Server", function()
    local vu48 = math.huge
    local vu49 = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local vu50 = nil
    local vu51 = nil
    if not _G.FailedServerID then
        _G.FailedServerID = {}
    end
    local function vu56()
        vu51 = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(vu49))
        local v52, v53, v54 = pairs(vu51.data)
        while true do
            local vu55
            v54, vu55 = v52(v53, v54)
            if v54 == nil then
                break
            end
            pcall(function()
                if type(vu55) == "table" and (vu55.id and (vu55.playing and (tonumber(vu48) > tonumber(vu55.playing) and not table.find(_G.FailedServerID, vu55.id)))) then
                    vu48 = vu55.playing
                    vu50 = vu55.id
                end
            end)
        end
    end
    function getservers()
        pcall(vu56)
        local v57, v58, v59 = pairs(vu51)
        while true do
            local v60
            v59, v60 = v57(v58, v59)
            if v59 == nil then
                break
            end
            if v59 == "nextPageCursor" then
                if vu49:find("&cursor=") then
                    vu49 = vu49:gsub(vu49:sub((vu49:find("&cursor="))), "")
                end
                vu49 = vu49 .. "&cursor=" .. v60
                pcall(getservers)
            end
        end
    end
    pcall(getservers)
    wait(0.1)
    if vu50 ~= game.JobId then
        local _ = vu48 ~= # game:GetService("Players"):GetChildren() - 1
    end
    table.insert(_G.FailedServerID, vu50)
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, vu50)
    while wait(0.1) do
        pcall(function()
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            game.CoreGui.RobloxPromptGui.promptOverlay.DescendantAdded:Connect(function()
                local v61 = game.CoreGui.RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt")
                if v61 and v61.TitleFrame.ErrorTitle.Text == "Disconnected" then
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
v6:addButton("Destroy GUI", function()
    vu1:DestroyGui()
end)
First_World = false
New_World = false
Third_World = false
local v62 = game.PlaceId
if v62 == 4520749081 then
    First_World = true
elseif v62 == 6381829480 then
    New_World = true
elseif v62 == 15759515082 then
    Third_World = true
end
function CheckQuest()
    local v63 = game.Players.LocalPlayer.PlayerStats.lvl.Value
    if First_World then
        if v63 == 1 or (v63 <= 9 or SelectMonster == "Soldier [Lv. 1]") then
            Ms = "Soldier [Lv. 1]"
            NameMon = "Soldier"
            CFrameMon = CFrame.new(- 1858.26648, 48.3086166, - 4367.37305, 0.789979517, 0, 0.613133252, 0, 1, 0, - 0.613133252, 0, 0.789979517)
            QuestName = "Kill 4 Soldiers"
            CFrameQ = CFrame.new(- 1964.24536, 48.5457039, - 4497.66943, 0.613133192, 0, - 0.789979577, 0, 1, 0, 0.789979577, 0, 0.613133192)
        elseif v63 == 10 or (v63 <= 19 or SelectMonster == "Clown Pirate [Lv. 10]") then
            Ms = "Clown Pirate [Lv. 10]"
            QuestName = "Kill 5 Clown Pirates"
            CFrameQ = CFrame.new(- 1891.10437, 48.4441566, - 4524.56885, - 0.71715498, 0, 0.696913719, 0, 1, 0, - 0.696913719, 0, - 0.71715498)
            NameMon = "Clown Pirate"
            CFrameMon = CFrame.new(- 1663.71167, 48.3086166, - 4517.11914, - 0.613133192, 0, 0.789979577, 0, 1, 0, - 0.789979577, 0, - 0.613133192)
        elseif v63 == 20 or (v63 <= 29 or SelectMonster == "Smoky [Lv. 20]") then
            NameMon = "Smoky"
            Ms = "Smoky [Lv. 20]"
            QuestName = "Kill 1 Smoky"
            CFrameQ = CFrame.new(- 1963.02527, 48.432476, - 4614.60742, 0.789979517, 0, 0.613133252, 0, 1, 0, - 0.613133252, 0, 0.789979517)
            NameMon = "Smoky"
            CFrameMon = CFrame.new(- 1842.04382, 91.9375458, - 4748.82275, - 0.613133192, 0, 0.789979577, 0, 1, 0, - 0.789979577, 0, - 0.613133192)
        elseif v63 == 30 or (v63 <= 49 or SelectMonster == "Tashi [Lv. 30]") then
            Ms = "Tashi [Lv. 30]"
            QuestName = "Kill 1 Tashi"
            CFrameQ = CFrame.new(- 2274.91943, 48.4181747, - 4678.51904, 0.541942835, 0, - 0.840415478, 0, 1, 0, 0.840415478, 0, 0.541942835)
            NameMon = "Tashi"
            CFrameMon = CFrame.new(- 2072.18457, 48.3125229, - 4858.35791, - 0.808410168, 0, 0.588619649, 0, 1, 0, - 0.588619649, 0, - 0.808410168)
        elseif v63 == 50 or (v63 <= 74 or SelectMonster == "Clown Swordman [Lv. 50]") then
            Ms = "Clown Swordman [Lv. 50]"
            QuestName = "Kill 6 Clown Swordman"
            CFrameQ = CFrame.new(- 680.229126, 37.8900681, - 3465.37085, - 0.266516447, 0, 0.963830352, 0, 1, 0, - 0.963830352, 0, - 0.266516447)
            NameMon = "Clown Swordman"
            CFrameMon = CFrame.new(- 740.556763, 37.9907684, - 3604.70215, - 0.848012805, 0, - 0.529975712, 0, 1, 0, 0.529975712, 0, - 0.848012805)
        elseif v63 == 75 or (v63 <= 99 or SelectMonster == "The Clown [Lv. 75]") then
            Ms = "The Clown [Lv. 75]"
            QuestName = "Kill 1 The Clown"
            CFrameQ = CFrame.new(- 390.307098, 69.1183777, - 3489.3645, 0.848060429, 0, 0.529899538, 0, 1, 0, - 0.529899538, 0, 0.848060429)
            NameMon = "The Clown"
            CFrameMon = CFrame.new(- 396.701538, 68.9450912, - 3608.98462, - 0.529884458, 0, 0.848069847, 0, 1, 0, - 0.848069847, 0, - 0.529884458)
        elseif v63 == 100 or (v63 <= 119 or SelectMonster == "Commander [Lv. 100]") then
            Ms = "Commander [Lv. 100]"
            QuestName = "Kill 4 Commander"
            CFrameQ = CFrame.new(- 2274.78931, 38.8399048, - 2692.07056, - 0.824105501, 0, 0.566436887, 0, 1, 0, - 0.566436887, 0, - 0.824105501)
            NameMon = "Commander"
            CFrameMon = CFrame.new(- 2101.45166, 39.4603004, - 2548.30273, - 0.913549781, 0, 0.406727046, 0, 1, 0, - 0.406727046, 0, - 0.913549781)
        elseif v63 == 120 or (v63 <= 144 or SelectMonster == "Captain [Lv. 120]") then
            Ms = "Captain [Lv. 120]"
            QuestName = "Kill 1 Captain"
            CFrameQ = CFrame.new(- 2237.04053, 60.2855721, - 2564.8208, 0.719422758, 0.000272446923, - 0.694572389, - 0.000207782898, 0.99999994, 0.000177034352, 0.694572389, 0.0000169577324, 0.719422817)
            NameMon = "Captain"
            CFrameMon = CFrame.new(- 2151.21704, 39.5098267, - 2495.14185, - 0.406715393, 0, - 0.913554907, 0, 1, 0, 0.913554907, 0, - 0.406715393)
        elseif v63 == 145 or (v63 <= 179 or SelectMonster == "The Barbaric [Lv. 145]") then
            Ms = "The Barbaric [Lv. 145]"
            QuestName = "Kill 1 The Barbaric"
            CFrameQ = CFrame.new(- 2464.45166, 68.6041794, - 2539.52637, 0.917908251, 0.000253595645, - 0.39679268, - 0.000253595645, 0.99999994, 0.0000524659517, 0.39679268, 0.0000524659517, 0.917908251)
            NameMon = "The Barbaric"
            CFrameMon = CFrame.new(- 2334.96704, 68.7599182, - 2478.86548, 0.917908311, 0, - 0.39679262, 0, 1, 0, 0.39679262, 0, 0.917908311)
        elseif v63 == 180 or (v63 <= 199 or SelectMonster == "Fighter Fishman [Lv. 180]") then
            Ms = "Fighter Fishman [Lv. 180]"
            QuestName = "Kill 4 Fighter Fishmans"
            CFrameQ = CFrame.new(- 961.875305, 10.8889618, - 1365.06592, 0.819155693, 0, - 0.573571265, 0, 1, 0, 0.573571265, 0, 0.819155693)
            NameMon = "Fighter Fishman"
            CFrameMon = CFrame.new(- 878.519165, 10.6631403, - 1322.21655, 0.807554185, 0, - 0.589793503, 0, 1, 0, 0.589793503, 0, 0.807554185)
        elseif v63 == 200 or (v63 <= 229 or SelectMonster == "Karate Fishman [Lv. 200]") then
            Ms = "Karate Fishman [Lv. 200]"
            QuestName = "Kill 1 Karate Fishman"
            CFrameQ = CFrame.new(- 644.528625, 10.8654766, - 1326.33142, 0.573598742, 0, 0.81913656, 0, 1, 0, - 0.81913656, 0, 0.573598742)
            NameMon = "Karate Fishman"
            CFrameMon = CFrame.new(- 791.52356, 10.6631403, - 1325.77417, 0.57351917, 0, 0.819192171, 0, 1, 0, - 0.819192171, 0, 0.57351917)
        elseif v63 == 230 or (v63 <= 249 or SelectMonster == "Shark Man [Lv. 230]") then
            Ms = "Shark Man [Lv. 230]"
            QuestName = "Kill 1 Shark Man"
            CFrameQ = CFrame.new(- 551.415833, 10.8541784, - 1375.48535, - 0.819156051, 0, 0.573571265, 0, 1, 0, - 0.573571265, 0, - 0.819156051)
            NameMon = "Shark Man"
            CFrameMon = CFrame.new(- 417.191498, 10.7649984, - 1412.51379, 0.573598742, 0, 0.81913656, 0, 1, 0, - 0.81913656, 0, 0.573598742)
        elseif v63 == 250 or (v63 <= 299 or SelectMonster == "Trainer Chef [Lv. 250]") then
            Ms = "Trainer Chef [Lv. 250]"
            QuestName = "Kill 4 Trainer Chef"
            CFrameQ = CFrame.new(- 4093.33862, 64.1752777, - 3018.96143, - 0.724956632, 0, 0.688794911, 0, 1, 0, - 0.688794911, 0, - 0.724956632)
            NameMon = "Trainer Chef"
            CFrameMon = CFrame.new(- 3925.27954, 15.2739077, - 3014.3645, 0.905472755, 0, - 0.424404413, 0, 1, 0, 0.424404413, 0, 0.905472755)
        elseif v63 == 300 or (v63 <= 349 or SelectMonster == "Dark Leg [Lv. 300]") then
            Ms = "Dark Leg [Lv. 300]"
            QuestName = "Kill 1 Dark Leg"
            CFrameQ = CFrame.new(- 4197.79785, 64.1502686, - 3024.42725, 0.880348146, 0, - 0.47432813, 0, 1, 0, 0.47432813, 0, 0.880348146)
            NameMon = "Dark Leg"
            CFrameMon = CFrame.new(- 4237.12598, 18.0044041, - 2861.33813, 0.880390346, 0, - 0.47424978, 0, 1, 0, 0.47424978, 0, 0.880390346)
        elseif v63 == 350 or (v63 <= 399 or SelectMonster == "Dory [Lv. 350]") then
            Ms = "Dory [Lv. 350]"
            QuestName = "Kill 1 Dory"
            CFrameQ = CFrame.new(- 4405.05859, 65.0867538, - 2941.23511, 0.880348146, 0, - 0.47432813, 0, 1, 0, 0.47432813, 0, 0.880348146)
            NameMon = "Dory"
            CFrameMon = CFrame.new(- 4381.65674, 15.29, - 2580.95776, 0.880348146, 0, - 0.47432813, 0, 1, 0, 0.47432813, 0, 0.880348146)
        elseif v63 == 400 or (v63 <= 449 or SelectMonster == "Snow Soldier [Lv. 400]") then
            Ms = "Snow Soldier [Lv. 400]"
            QuestName = "Kill 5 Snow Soldier"
            CFrameQ = CFrame.new(- 5459.9502, 18.4950638, - 1345.18286, - 0.173624277, 0, 0.984811902, 0, 1, 0, - 0.984811902, 0, - 0.173624277)
            NameMon = "Snow Soldier"
            CFrameMon = CFrame.new(- 5383.57471, 18.199625, - 1302.3197, - 0.173624277, 0, 0.984811902, 0, 1, 0, - 0.984811902, 0, - 0.173624277)
        elseif v63 == 450 or (v63 <= 499 or SelectMonster == "King Snow [Lv. 450]") then
            CFrameMon = CFrame.new(- 5520.56787, 18.199625, - 1683.78674, - 0.984812617, 0, - 0.173621148, 0, 1, 0, 0.173621148, 0, - 0.984812617)
            NameMon = "King Snow"
            Ms = "King Snow [Lv. 450]"
            QuestName = "Kill 1 King Snow"
            CFrameQ = CFrame.new(- 5540.91895, 18.3323364, - 1478.97583, 0.173624337, 0, - 0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
        elseif v63 == 500 or (v63 <= 524 or SelectMonster == "Little Dear [Lv. 500]") then
            CFrameMon = CFrame.new(- 5187.27393, 10.8001347, - 1073.98547, 0.854323328, 0, 0.519741893, 0, 1, 0, - 0.519741893, 0, 0.854323328)
            NameMon = "Little Dear"
            Ms = "Little Dear [Lv. 500]"
            QuestName = "Kill 1 Little Dear"
            CFrameQ = CFrame.new(- 5302.30078, 18.1968155, - 1097.25427, 0.853996992, 0, - 0.520277977, 0, 1, 0, 0.520277977, 0, 0.853996992)
        elseif v63 == 525 or (v63 <= 574 or SelectMonster == "Candle Man [Lv. 525]") then
            CFrameMon = CFrame.new(- 2663.28906, 13.0286417, - 676.879517, 0.74314785, 0, 0.669127226, 0, 1, 0, - 0.669127226, 0, 0.74314785)
            NameMon = "Candle Man"
            Ms = "Candle Man [Lv. 525]"
            QuestName = "Kill 1 Candle Man"
            CFrameQ = CFrame.new(- 2732.45239, 13.2010946, - 596.49353, 0.669109941, 0, - 0.743163466, 0, 1, 0, 0.743163466, 0, 0.669109941)
        elseif v63 == 575 or (v63 <= 624 or SelectMonster == "Sand Bandit [Lv. 575]") then
            CFrameMon = CFrame.new(- 2663.28906, 13.0286417, - 676.879517, 0.74314785, 0, 0.669127226, 0, 1, 0, - 0.669127226, 0, 0.74314785)
            NameMon = "Sand Bandit"
            Ms = "Sand Bandit [Lv. 575]"
            QuestName = "Kill 4 Sand Bandit"
            CFrameQ = CFrame.new(- 2732.45239, 13.2010946, - 596.49353, 0.669109941, 0, - 0.743163466, 0, 1, 0, 0.743163466, 0, 0.669109941)
        elseif v63 == 625 or (v63 <= 674 or SelectMonster == "Bomb Man [Lv. 625]") then
            CFrameMon = CFrame.new(- 2874.24951, 13.0182543, - 907.460693, - 0.74314785, 0, - 0.669127226, 0, 1, 0, 0.669127226, 0, - 0.74314785)
            NameMon = "Bomb Man"
            Ms = "Bomb Man [Lv. 625]"
            QuestName = "Kill 1 Bomb Man"
            CFrameQ = CFrame.new(- 2945.33667, 13.1591787, - 805.226074, 0.907637119, 0.0000185504832, - 0.419755667, 0.0000185504832, 1, 0.0000843052112, 0.419755667, - 0.0000843052112, 0.907637119)
        elseif v63 == 675 or (v63 <= 724 or SelectMonster == "Desert Marauder [Lv. 675]") then
            CFrameMon = CFrame.new(- 2874.24951, 13.0182543, - 907.460693, - 0.74314785, 0, - 0.669127226, 0, 1, 0, 0.669127226, 0, - 0.74314785)
            NameMon = "Desert Marauder"
            Ms = "Desert Marauder [Lv. 675]"
            QuestName = "Kill 4 Desert Marauder"
            CFrameQ = CFrame.new(- 2945.33667, 13.1591787, - 805.226074, 0.907637119, 0.0000185504832, - 0.419755667, 0.0000185504832, 1, 0.0000843052112, 0.419755667, - 0.0000843052112, 0.907637119)
        elseif v63 == 725 or (v63 <= 799 or SelectMonster == "King of Sand [Lv. 725]") then
            CFrameMon = CFrame.new(- 3140.69458, 97.1734619, - 469.235657, 0.669109941, 0, - 0.743163466, 0, 1, 0, 0.743163466, 0, 0.669109941)
            NameMon = "King of Sand"
            Ms = "King of Sand [Lv. 725]"
            QuestName = "Kill 1 King of Sand"
            CFrameQ = CFrame.new(- 2953.43921, 43.3160973, - 701.675598, - 0.74314785, 0, - 0.669127226, 0, 1, 0, 0.669127226, 0, - 0.74314785)
        elseif v63 == 800 or (v63 <= 849 or SelectMonster == "Sky Soldier [Lv. 800]") then
            CFrameMon = CFrame.new(- 4570.74414, 222.482254, 1265.38232, 0.829036474, 0, 0.559194624, 0, 1, 0, - 0.559194624, 0, 0.829036474)
            NameMon = "Sky Soldier"
            Ms = "Sky Soldier [Lv. 800]"
            QuestName = "Kill 4 Sky Soldier"
            CFrameQ = CFrame.new(- 4484.68311, 201.045685, 1037.03552, - 0.829036593, 0, - 0.559194624, 0, 1, 0, 0.559194624, 0, - 0.829036593)
        elseif v63 == 850 or (v63 <= 899 or SelectMonster == "Ball Man [Lv. 850]") then
            CFrameMon = CFrame.new(- 3954.23779, 386.595428, 1309.33948, 0.829036474, 0, 0.559194624, 0, 1, 0, - 0.559194624, 0, 0.829036474)
            NameMon = "Ball Man"
            Ms = "Ball Man [Lv. 850]"
            QuestName = "Kill 1 Ball Man"
            CFrameQ = CFrame.new(- 4045.23633, 386.808044, 1207.26416, - 0.5592103, 0, 0.829025805, 0, 1, 0, - 0.829025805, 0, - 0.5592103)
        elseif v63 == 900 or (v63 <= 949 or SelectMonster == "Cloud Warrior [Lv. 900]") then
            CFrameMon = CFrame.new(- 3954.23779, 386.595428, 1309.33948, 0.829036474, 0, 0.559194624, 0, 1, 0, - 0.559194624, 0, 0.829036474)
            NameMon = "Cloud Warrior"
            Ms = "Cloud Warrior [Lv. 900]"
            QuestName = "Kill 4 Cloud Warrior"
            CFrameQ = CFrame.new(- 4045.23633, 386.808044, 1207.26416, - 0.5592103, 0, 0.829025805, 0, 1, 0, - 0.829025805, 0, - 0.5592103)
        elseif v63 == 950 or (v63 <= 999 or SelectMonster == "Rumble Man [Lv. 950]") then
            CFrameMon = CFrame.new(- 4143.70654, 386.591888, 1518.88892, 0.984812498, 0, - 0.173621148, 0, 1, 0, 0.173621148, 0, 0.984812498)
            NameMon = "Rumble Man"
            Ms = "Rumble Man [Lv. 950]"
            QuestName = "Kill 1 Rumble Man"
            CFrameQ = CFrame.new(- 4091.56763, 386.823242, 1340.73145, 0.461702704, 0, 0.887034833, 0, 1, 0, - 0.887034833, 0, 0.461702704)
        elseif v63 == 1000 or (v63 <= 1049 or SelectMonster == "Elite Soldier [Lv. 1000]") then
            CFrameMon = CFrame.new(1928.24121, 11.9755917, 855.181091, 0.374604106, 0, 0.92718488, 0, 1, 0, - 0.92718488, 0, 0.374604106)
            NameMon = "Elite Soldier"
            Ms = "Elite Soldier [Lv. 1000]"
            QuestName = "Kill 4 Elite Soldiers"
            CFrameQ = CFrame.new(1737.24097, 12.2468643, 715.15686, 0.927179396, 0, - 0.374617696, 0, 1, 0, 0.374617696, 0, 0.927179396)
        elseif v63 == 1050 or (v63 <= 1099 or SelectMonster == "High-class Soldier [Lv. 1050]") then
            CFrameMon = CFrame.new(1928.24121, 11.9755917, 855.181091, 0.374604106, 0, 0.92718488, 0, 1, 0, - 0.92718488, 0, 0.374604106)
            NameMon = "High-class Soldier"
            Ms = "High-class Soldier [Lv. 1050]"
            QuestName = "Kill 4 High-class Soldier"
            CFrameQ = CFrame.new(1737.24097, 12.2468643, 715.15686, 0.927179396, 0, - 0.374617696, 0, 1, 0, 0.374617696, 0, 0.927179396)
        elseif v63 == 1100 or (v63 <= 1149 or SelectMonster == "Leader [Lv. 1100]") then
            CFrameMon = CFrame.new(1878.58557, 11.9760256, 614.227234, - 0.927179813, 0, 0.374617696, 0, 1, 0, - 0.374617696, 0, - 0.927179813)
            NameMon = "Leader"
            Ms = "Leader [Lv. 1100]"
            QuestName = "Kill 1 Leader"
            CFrameQ = CFrame.new(1725.7793, 12.2373276, 655.269775, - 0.929240346, 0, 0.369476676, 0, 1, 0, - 0.369476676, 0, - 0.929240346)
        elseif v63 == 1150 or (v63 <= 1199 or SelectMonster == "Pasta [Lv. 1150]") then
            CFrameMon = CFrame.new(1425.4054, 11.9760256, 1164.67407, 0.927179396, 0, - 0.374617696, 0, 1, 0, 0.374617696, 0, 0.927179396)
            NameMon = "Pasta"
            Ms = "Pasta [Lv. 1150]"
            QuestName = "Kill 1 Pasta"
            CFrameQ = CFrame.new(1541.70667, 11.9703064, 982.587341, 0.374604106, 0, 0.92718488, 0, 1, 0, - 0.92718488, 0, 0.374604106)
        elseif v63 == 1200 or (v63 <= 1249 or SelectMonster == "Naval personnel [Lv. 1200]") then
            CFrameMon = CFrame.new(1425.4054, 11.9760256, 1164.67407, 0.927179396, 0, - 0.374617696, 0, 1, 0, 0.374617696, 0, 0.927179396)
            NameMon = "Naval personnel"
            Ms = "Naval personnel [Lv. 1200]"
            QuestName = "Kill 4 Naval personnel"
            CFrameQ = CFrame.new(1541.70667, 11.9703064, 982.587341, 0.374604106, 0, 0.92718488, 0, 1, 0, - 0.92718488, 0, 0.374604106)
        elseif v63 == 1250 or (v63 <= 1299 or SelectMonster == "Wolf [Lv. 1250]") then
            CFrameMon = CFrame.new(- 1396.92517, 13.2015181, 2235.1521, 0.087131381, 0, - 0.996196866, 0, 1, 0, 0.996196866, 0, 0.087131381)
            NameMon = "Wolf"
            Ms = "Wolf [Lv. 1250]"
            QuestName = "Kill 1 Wolf"
            CFrameQ = CFrame.new(- 1248.87866, 13.4013901, 2180.94604, 0.087131381, 0, - 0.996196866, 0, 1, 0, 0.996196866, 0, 0.087131381)
        elseif v63 == 1300 or (v63 <= 1349 or SelectMonster == "Giraffe [Lv. 1300]") then
            CFrameMon = CFrame.new(- 1018.56366, 13.2015219, 2248.64917, - 0.0871315002, 0, 0.996196866, 0, 1, 0, - 0.996196866, 0, - 0.0871315002)
            NameMon = "Giraffe"
            Ms = "Giraffe [Lv. 1300]"
            QuestName = "Kill 1 Giraffe"
            CFrameQ = CFrame.new(- 1187.5531, 13.3929958, 2215.58594, - 0.0871315002, 0, 0.996196866, 0, 1, 0, - 0.996196866, 0, - 0.0871315002)
        elseif v63 == 1350 or (v63 <= 1399 or SelectMonster == "Nautical soldier [Lv. 1350]") then
            CFrameMon = CFrame.new(- 1018.56366, 13.2015219, 2248.64917, - 0.0871315002, 0, 0.996196866, 0, 1, 0, - 0.996196866, 0, - 0.0871315002)
            NameMon = "Nautical soldier"
            Ms = "Nautical soldier [Lv. 1350]"
            QuestName = "Kill 4 Nautical soldier"
            CFrameQ = CFrame.new(- 1187.5531, 13.3929958, 2215.58594, - 0.0871315002, 0, 0.996196866, 0, 1, 0, - 0.996196866, 0, - 0.0871315002)
        elseif v63 == 1400 or (v63 <= 1449 or SelectMonster == "Naval soldier [Lv. 1400]") then
            CFrameMon = CFrame.new(- 1018.56366, 13.2015219, 2248.64917, - 0.0871315002, 0, 0.996196866, 0, 1, 0, - 0.996196866, 0, - 0.0871315002)
            NameMon = "Naval soldier"
            Ms = "Naval soldier [Lv. 1400]"
            QuestName = "Kill 4 Naval soldier"
            CFrameQ = CFrame.new(- 1187.5531, 13.3929958, 2215.58594, - 0.0871315002, 0, 0.996196866, 0, 1, 0, - 0.996196866, 0, - 0.0871315002)
        elseif v63 == 1450 or (v63 <= 1499 or SelectMonster == "Leo [Lv. 1450]") then
            CFrameMon = CFrame.new(- 1157.30847, 13.1322603, 2971.90845, 0.996191859, 0, 0.0871884301, 0, 1, 0, - 0.0871884301, 0, 0.996191859)
            NameMon = "Leo"
            Ms = "Leo [Lv. 1450]"
            QuestName = "Kill 1 Leo"
            CFrameQ = CFrame.new(- 1116.5824, 13.3730688, 2846.62378, 0.996191859, 0, 0.0871884301, 0, 1, 0, - 0.0871884301, 0, 0.996191859)
        elseif v63 == 1500 or (v63 <= 1549 or SelectMonster == "Zombie [Lv. 1500]") then
            CFrameMon = CFrame.new(- 2659.89624, 15.8724298, 4193.10791, 0.876517415, 0, - 0.481370181, 0, 1, 0, 0.481370181, 0, 0.876517415)
            NameMon = "Zombie"
            Ms = "Zombie [Lv. 1500]"
            QuestName = "Kill 5 Zombies"
            CFrameQ = CFrame.new(- 2736.04614, 15.8948669, 4087.54346, 0.876517415, 0, - 0.481370181, 0, 1, 0, 0.481370181, 0, 0.876517415)
        elseif v63 == 1550 or (v63 <= 1599 or SelectMonster == "Elite Zombie [Lv. 1550]") then
            CFrameMon = CFrame.new(- 2659.89624, 15.8724298, 4193.10791, 0.876517415, 0, - 0.481370181, 0, 1, 0, 0.481370181, 0, 0.876517415)
            NameMon = "Elite Zombie"
            Ms = "Elite Zombie [Lv. 1550]"
            QuestName = "Kill 4 Elite Zombies"
            CFrameQ = CFrame.new(- 2736.04614, 15.8948669, 4087.54346, 0.876517415, 0, - 0.481370181, 0, 1, 0, 0.481370181, 0, 0.876517415)
        elseif v63 == 1600 or (v63 <= 1649 or SelectMonster == "Revenant [Lv. 1600]") then
            CFrameMon = CFrame.new(- 2659.89624, 15.8724298, 4193.10791, 0.876517415, 0, - 0.481370181, 0, 1, 0, 0.481370181, 0, 0.876517415)
            NameMon = "Revenant"
            Ms = "Revenant [Lv. 1600]"
            QuestName = "Kill 4 Revenant"
            CFrameQ = CFrame.new(- 2736.04614, 15.8948669, 4087.54346, 0.876517415, 0, - 0.481370181, 0, 1, 0, 0.481370181, 0, 0.876517415)
        elseif v63 == 1650 or (v63 <= 1699 or SelectMonster == "Shadow Master [Lv. 1650]") then
            CFrameMon = CFrame.new(- 2874.3999, 20.1093845, 4331.80664, 0.876517415, 0, - 0.481370181, 0, 1, 0, 0.481370181, 0, 0.876517415)
            NameMon = "Shadow Master"
            Ms = "Shadow Master [Lv. 1650]"
            QuestName = "Kill 1 Shadow Master"
            CFrameQ = CFrame.new(- 2795.85522, 19.7074966, 4233.36816, 0.876517415, 0, - 0.481370181, 0, 1, 0, 0.481370181, 0, 0.876517415)
        elseif v63 == 1700 or (v63 <= 1749 or SelectMonster == "New World Pirate [Lv. 1700]") then
            CFrameMon = CFrame.new(2250.38379, 49.7109604, - 1563.68042, - 0.265993595, 0, - 0.963974833, 0, 1, 0, 0.963974833, 0, - 0.265993595)
            NameMon = "New World Pirate"
            Ms = "New World Pirate [Lv. 1700]"
            QuestName = "Kill 4 New World Pirates"
            CFrameQ = CFrame.new(2393.82886, 49.6681442, - 1780.0116, 0.416827381, 0, 0.908985734, 0, 1, 0, - 0.908985734, 0, 0.416827381)
        elseif v63 == 1750 or (v63 <= 1799 or SelectMonster == "Cutlass Pirate [Lv. 1750]") then
            CFrameMon = CFrame.new(2250.38379, 49.7109604, - 1563.68042, - 0.265993595, 0, - 0.963974833, 0, 1, 0, 0.963974833, 0, - 0.265993595)
            NameMon = "Cutlass Pirate"
            Ms = "Cutlass Pirate [Lv. 1750]"
            QuestName = "Kill 4 Cutlass Pirates"
            CFrameQ = CFrame.new(2393.82886, 49.6681442, - 1780.0116, 0.416827381, 0, 0.908985734, 0, 1, 0, - 0.908985734, 0, 0.416827381)
        elseif v63 == 1800 or (v63 <= 1849 or SelectMonster == "Rear Admiral [Lv. 1800]") then
            CFrameMon = CFrame.new(2243.60181, 49.7222939, - 2200.85645, 0.898518324, 0, - 0.438936025, 0, 1, 0, 0.438936025, 0, 0.898518324)
            NameMon = "Rear Admiral"
            Ms = "Rear Admiral [Lv. 1800]"
            QuestName = "Kill 4 Rear Admirals"
            CFrameQ = CFrame.new(2400.99976, 49.7170563, - 2237.99658, 0.418504179, 0, 0.908214867, 0, 1, 0, - 0.908214867, 0, 0.418504179)
        elseif v63 == 1850 or (v63 <= 1924 or SelectMonster == "True Karate Fishman [Lv. 1850]") then
            CFrameMon = CFrame.new(2319.71899, 49.7188339, - 1920.62341, 0.0156860948, 0, 0.999876916, 0, 1, 0, - 0.999876916, 0, 0.0156860948)
            NameMon = "True Karate Fishman"
            Ms = "True Karate Fishman [Lv. 1850]"
            QuestName = "Kill 1 True Karate Fishman"
            CFrameQ = CFrame.new(2380.30444, 49.9841232, - 2067.11621, 0.0896955132, 0, 0.995969236, 0, 1, 0, - 0.995969236, 0, 0.0896955132)
        elseif v63 == 1925 or (v63 <= 1999 or SelectMonster == "Quake Woman [Lv. 1925]") then
            CFrameMon = CFrame.new(2176.20752, 3.16206908, - 1922.0481, - 0.0306472778, 0, 0.999530256, 0, 1, 0, - 0.999530256, 0, - 0.0306472778)
            NameMon = "Quake Woman"
            Ms = "Quake Woman [Lv. 1925]"
            QuestName = "Kill 1 Quake Woman"
            CFrameQ = CFrame.new(2116.02856, 49.9898415, - 2118.8501, - 0.986789703, 0, - 0.162006646, 0, 1, 0, 0.162006646, 0, - 0.986789703)
        elseif v63 == 2000 or (v63 <= 2049 or SelectMonster == "Fishman [Lv. 2000]") then
            CFrameMon = CFrame.new(- 1617.14282, 40.4917412, 6205.05664, 0.866007268, 0, - 0.500031412, 0, 1, 0, 0.500031412, 0, 0.866007268)
            NameMon = "Fishman"
            Ms = "Fishman [Lv. 2000]"
            QuestName = "Kill 4 Fishmans"
            CFrameQ = CFrame.new(- 1467.95605, 40.6416855, 6226.2334, 0, 0, - 1, 0, 1, 0, 1, 0, 0)
        elseif v63 == 2050 or (v63 <= 2099 or SelectMonster == "Combat Fishman [Lv. 2050]") then
            CFrameMon = CFrame.new(2783.875, 500.24825668335, 13617.719726563)
            NameMon = "Combat Fishman"
            Ms = "Combat Fishman [Lv. 2050]"
            QuestName = "Kill 1 Combat Fishman"
            CFrameQ = CFrame.new(- 1928.69934, 40.6513481, 6267.14844, - 0.941219687, 0, - 0.33779496, 0, 1, 0, 0.33779496, 0, - 0.941219687)
        elseif v63 == 2100 or (v63 <= 2149 or SelectMonster == "Sword Fishman [Lv. 2100]") then
            CFrameMon = CFrame.new(- 1486.51245, 40.4922066, 6687.52686, 0.866007268, 0, - 0.500031412, 0, 1, 0, 0.500031412, 0, 0.866007268)
            NameMon = "Sword Fishman"
            Ms = "Sword Fishman [Lv. 2100]"
            QuestName = "Kill 1 Sword Fishman"
            CFrameQ = CFrame.new(- 1416.47754, 40.4688988, 6434.96338, 0.258653998, 0, - 0.965970039, 0, 1, 0, 0.965970039, 0, 0.258653998)
        elseif v63 == 2150 or (v63 <= 2199 or SelectMonster == "Soldier Fishman [Lv. 2150]") then
            CFrameMon = CFrame.new(- 1970.72742, 44.9945335, 6629.27637, 0.965929627, 0, - 0.258804798, 0, 1, 0, 0.258804798, 0, 0.965929627)
            NameMon = "Soldier Fishman"
            Ms = "Soldier Fishman [Lv. 2150]"
            QuestName = "Kill 4 Soldier Fishman"
            CFrameQ = CFrame.new(- 1773.25989, 40.3806, 6492.67285, 0.976825714, 0, - 0.214036196, 0, 1, 0, 0.214036196, 0, 0.976825714)
        elseif v63 >= 2200 or SelectMonster == "Seasoned Fishman [Lv. 2200]" then
            CFrameMon = CFrame.new(- 1864.91174, 45.271965, 6721.6709, 0.965929627, 0, - 0.258804798, 0, 1, 0, 0.258804798, 0, 0.965929627)
            NameMon = "Seasoned Fishman"
            Ms = "Seasoned Fishman [Lv. 2200]"
            QuestName = "Kill 1 Seasoned Fishman"
            CFrameQ = CFrame.new(- 1920.91528, 40.3306007, 6471.48828, 0.943592668, 0, - 0.33110866, 0, 1, 0, 0.33110866, 0, 0.943592668)
        end
    end
    if New_World then
        if v63 == 2250 or (v63 <= 2299 or SelectMonster == "Beast Pirate [Lv. 2250]") then
            Ms = "Beast Pirate [Lv. 2250]"
            NameMon = "Beast Pirate"
            CFrameMon = CFrame.new(- 4021.76782, 57.4468307, - 52.0627594, - 0.234922409, 0, 0.972014189, 0, 1, 0, - 0.972014189, 0, - 0.234922409)
            QuestName = "Kill 4 Beast Pirates"
            CFrameQ = CFrame.new(- 3849.24146, 57.4148903, 131.030655, - 1, 0, 0, 0, 1, 0, 0, 0, - 1)
        elseif v63 == 2300 or (v63 <= 2349 or SelectMonster == "Beast Swordman [Lv. 2300]") then
            Ms = "Beast Swordman [Lv. 2300]"
            NameMon = "Beast Swordman"
            CFrameMon = CFrame.new(- 4015.1626, 98.5303726, - 434.624268, - 0.997206211, 0, - 0.0747026429, 0, 1, 0, 0.0747026429, 0, - 0.997206211)
            QuestName = "Kill 4 Beast Swordman"
            CFrameQ = CFrame.new(- 4222.24316, 98.4567184, - 300.052979, - 0.0747259855, 0, 0.997204244, 0, 1, 0, - 0.997204244, 0, - 0.0747259855)
        elseif v63 == 2350 or (v63 <= 2399 or SelectMonster == "Gazelle Man [Lv. 2350]") then
            Ms = "Gazelle Man [Lv. 2350]"
            NameMon = "Gazelle Man"
            CFrameMon = CFrame.new(- 4352.5293, 57.4375267, 351.500153, 0.515122354, 0, - 0.857116699, 0, 1, 0, 0.857116699, 0, 0.515122354)
            QuestName = "Kill 1 Gazelle Man"
            CFrameQ = CFrame.new(- 4461.31348, 57.4099236, 142.313705, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        elseif v63 == 2400 or (v63 <= 2449 or SelectMonster == "Bandit Beast Pirate [Lv. 2400]") then
            Ms = "Bandit Beast Pirate [Lv. 2400]"
            NameMon = "Bandit Beast Pirate"
            CFrameMon = CFrame.new(- 4479.9082, 135.992249, - 1000.29736, 0.979581892, 0, - 0.201045707, 0, 1, 0, 0.201045707, 0, 0.979581892)
            QuestName = "Kill 4 Bandit Beast Pirates"
            CFrameQ = CFrame.new(- 4543.40771, 135.910416, - 920.869873, - 0.997206211, 0, - 0.0747026429, 0, 1, 0, 0.0747026429, 0, - 0.997206211)
        elseif v63 == 2450 or (v63 <= 2499 or SelectMonster == "Powerful Beast Pirate [Lv. 2450]") then
            Ms = "Powerful Beast Pirate [Lv. 2450]"
            NameMon = "Powerful Beast Pirate"
            CFrameMon = CFrame.new(- 4711.86426, 135.983475, - 743.344238, 0.0747256875, 0, - 0.997204244, 0, 1, 0, 0.997204244, 0, 0.0747256875)
            QuestName = "Kill 4 Powerful Beast Pirates"
            CFrameQ = CFrame.new(- 4565.70508, 135.964798, - 856.57019, 0.997205853, 0, 0.0747026429, 0, 1, 0, - 0.0747026429, 0, 0.997205853)
        elseif v63 == 2500 or (v63 <= 2549 or SelectMonster == "Violet Samurai [Lv. 2500]") then
            Ms = "Violet Samurai [Lv. 2500]"
            NameMon = "Violet Samurai"
            CFrameMon = CFrame.new(- 5118.91992, 85.7235947, - 1015.17639, - 0.997212648, 0, - 0.0746164992, 0, 1, 0, 0.0746164992, 0, - 0.997212648)
            QuestName = "Kill 1 Violet Samurai"
            CFrameQ = CFrame.new(- 5187.3291, 85.7194901, - 884.026306, - 0.997206211, 0, - 0.0747026429, 0, 1, 0, 0.0747026429, 0, - 0.997206211)
        elseif v63 == 2550 or (v63 <= 2599 or SelectMonster == "Duke [Lv. 2550]") then
            Ms = "Duke [Lv. 2550]"
            NameMon = "Duke"
            CFrameMon = CFrame.new(- 5516.21729, 99.8881607, - 270.93158, - 1, 0, 0, 0, 1, 0, 0, 0, - 1)
            QuestName = "Kill 1 Duke"
            CFrameQ = CFrame.new(- 5411.06689, 100.151543, - 114.538315, - 1, 0, 0, 0, 1, 0, 0, 0, - 1)
        elseif v63 == 2600 or (v63 <= 2649 or SelectMonster == "Magician [Lv. 2600]") then
            Ms = "Magician [Lv. 2600]"
            NameMon = "Magician"
            CFrameMon = CFrame.new(- 4920.82471, 57.4305153, - 132.392319, - 0.934465528, 0, - 0.35605365, 0, 1, 0, 0.35605365, 0, - 0.934465528)
            QuestName = "Kill 1 Magician"
            CFrameQ = CFrame.new(- 4988.33008, 57.3682632, 51.9147339, 0, 0, - 1, 0, 1, 0, 1, 0, 0)
        elseif v63 == 2650 or (v63 <= 2699 or SelectMonster == "Kitsune Samurai [Lv. 2650]") then
            Ms = "Kitsune Samurai [Lv. 2650]"
            NameMon = "Kitsune Samurai"
            CFrameMon = CFrame.new(- 5503.21533, 100.305717, 39.5982246, 0.055486083, 0, - 0.998459458, 0, 1, 0, 0.998459458, 0, 0.055486083)
            QuestName = "Kill 1 Kitsune Samurai"
            CFrameQ = CFrame.new(- 5264.00146, 99.8629913, 174.233093, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        elseif v63 == 2700 or (v63 <= 2749 or SelectMonster == "Elite Beast Pirate [Lv. 2700]") then
            Ms = "Elite Beast Pirate [Lv. 2700]"
            NameMon = "Elite Beast Pirate"
            CFrameMon = CFrame.new(- 4498.23633, 29.3527203, 1259.77734, 0.999238789, 0, 0.0390101261, 0, 1, 0, - 0.0390101261, 0, 0.999238789)
            QuestName = "Kill 4 Elite Beast Pirates"
            CFrameQ = CFrame.new(- 4716.79736, 29.2951603, 1162.22205, 0.999238789, 0, 0.0390101261, 0, 1, 0, - 0.0390101261, 0, 0.999238789)
        elseif v63 == 2750 or (v63 <= 2799 or SelectMonster == "Bear Man [Lv. 2750]") then
            Ms = "Bear Man [Lv. 2750]"
            NameMon = "Bear Man"
            CFrameMon = CFrame.new(- 4695.20898, 29.2999954, 1038.66162, 0.0390424132, 0, - 0.999237597, 0, 1, 0, 0.999237597, 0, 0.0390424132)
            QuestName = "Kill 1 Bear Man"
            CFrameQ = CFrame.new(- 4695.20898, 29.2999954, 1038.66162, 0.0390424132, 0, - 0.999237597, 0, 1, 0, 0.999237597, 0, 0.0390424132)
        elseif v63 == 2800 or (v63 <= 2849 or SelectMonster == "Bean [Lv. 2800]") then
            Ms = "Bean [Lv. 2800]"
            NameMon = "Bean"
            CFrameMon = CFrame.new(- 4184.97119, 29.270134, 1301.55261, 0.999238789, 0, 0.0390101261, 0, 1, 0, - 0.0390101261, 0, 0.999238789)
            QuestName = "Kill 1 Bean"
            CFrameQ = CFrame.new(- 4184.97119, 29.270134, 1301.55261, 0.999238789, 0, 0.0390101261, 0, 1, 0, - 0.0390101261, 0, 0.999238789)
        elseif v63 == 2850 or (v63 <= 2899 or SelectMonster == "Meji [Lv. 2850]") then
            Ms = "Meji [Lv. 2850]"
            NameMon = "Meji"
            CFrameMon = CFrame.new(- 5364.39795, 57.4320602, 1086.26257, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            QuestName = "Kill 1 Meji"
            CFrameQ = CFrame.new(- 5497.25977, 57.3679428, 961.385803, - 1, 0, 0, 0, 1, 0, 0, 0, - 1)
        elseif v63 == 2900 or (v63 <= 2949 or SelectMonster == "Petra [Lv. 2900]") then
            Ms = "Petra [Lv. 2900]"
            NameMon = "Petra"
            CFrameMon = CFrame.new(- 5737.3916, 57.4320602, 1245.047, 0.0431069136, 0, - 0.999070466, 0, 1, 0, 0.999070466, 0, 0.0431069136)
            QuestName = "Kill 1 Petra"
            CFrameQ = CFrame.new(- 5516.57227, 57.3832932, 1180.48547, 0, 0, 1, 0, 1, 0, - 1, 0, 0)
        elseif v63 == 2950 or (v63 <= 2999 or SelectMonster == "Kappa [Lv. 2950]") then
            Ms = "Kappa [Lv. 2950]"
            NameMon = "Kappa"
            CFrameMon = CFrame.new(- 4845.63574, 57.4339714, 2008.89563, - 0.999642015, 0, - 0.0267574284, 0, 1, 0, 0.0267574266, 0, - 0.999642015)
            QuestName = "Kill 1 Kappa"
            CFrameQ = CFrame.new(- 5107.7666, 57.4233932, 1888.81897, - 0.150942802, 0, 0.988542497, 0, 1, 0, - 0.988542497, 0, - 0.150942802)
        elseif v63 == 3000 or (v63 <= 3049 or SelectMonster == "Joey [Lv. 3000]") then
            Ms = "Joey [Lv. 3000]"
            NameMon = "Joey"
            CFrameMon = CFrame.new(- 5198.51416, 57.4375267, 2058.48145, 0, 0, - 1, 0, 1, 0, 1, 0, 0)
            QuestName = "Kill 1 Joey"
            CFrameQ = CFrame.new(- 5159.53955, 57.4356117, 1880.1759, 0.150942862, 0, - 0.988542497, 0, 1, 0, 0.988542497, 0, 0.150942862)
        elseif v63 == 3050 or (v63 <= 3099 or SelectMonster == "Skull Pirate [Lv. 3050]") then
            Ms = "Skull Pirate [Lv. 3050]"
            NameMon = "Skull Pirate"
            CFrameMon = CFrame.new(- 6373.91699, 58.2187729, 7104.33545, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            QuestName = "Kill 4 Skull Pirates"
            CFrameQ = CFrame.new(- 6180.15234, 57.7957458, 6895.4043, 0, 0, - 1, 0, 1, 0, 1, 0, 0)
        elseif v63 == 3100 or (v63 <= 3124 or SelectMonster == "Elite Skeleton [Lv. 3100]") then
            Ms = "Elite Skeleton [Lv. 3100]"
            NameMon = "Elite Skeleton"
            CFrameMon = CFrame.new(- 5891.96777, 98.6641083, 7245.81201, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            QuestName = "Kill 1 Elite Skeleton"
            CFrameQ = CFrame.new(- 6049.23291, 158.727417, 7236.64648, - 0.583810568, 7.02535701e-8, 0.811889887, 3.68069877e-8, 1, - 6.00638828e-8, - 0.811889887, - 5.18270626e-9, - 0.583810568)
        elseif v63 == 3125 or (v63 <= 3124 or SelectMonster == "Desert Thief [Lv. 3125]") then
            Ms = "Desert Thief [Lv. 3125]"
            NameMon = "Desert Thief"
            CFrameMon = CFrame.new(1353.7417, 14.5286579, 1609.04175, 0.946567714, 0, 0.322505146, 0, 1, 0, - 0.322505146, 0, 0.946567714)
            QuestName = "Kill 1 Desert Thief"
            CFrameQ = CFrame.new(1555.65295, 14.4665079, 1328.43701, - 0.322491169, 0, 0.946572542, 0, 1, 0, - 0.946572542, 0, - 0.322491169)
        elseif v63 == 3150 or (v63 <= 3174 or SelectMonster == "Anubis [Lv. 3150]") then
            Ms = "Anubis [Lv. 3150]"
            NameMon = "Anubis"
            CFrameMon = CFrame.new(2272.11255, 18.1082306, 967.890869, - 0.995417833, 0, - 0.0956213921, 0, 1, 0, 0.0956213921, 0, - 0.995417833)
            QuestName = "Kill 1 Anubis"
            CFrameQ = CFrame.new(1849.57507, 14.484683, 984.299866, - 0.897387385, 0, 0.441243589, 0, 1, 0, - 0.441243589, 0, - 0.897387385)
        elseif v63 == 3175 or (v63 <= 3199 or SelectMonster == "Pharaoh [Lv. 3175]") then
            Ms = "Pharaoh [Lv. 3175]"
            NameMon = "Pharaoh"
            CFrameMon = CFrame.new(1886.95374, 52.484005, 1713.79773, 0.576146007, 0, - 0.817346811, 0, 1, 0, 0.817346811, 0, 0.576146007)
            QuestName = "Kill 1 Pharaoh"
            CFrameQ = CFrame.new(2263.40161, 14.4661179, 1473.54675, 0.300918877, 0, 0.953649879, 0, 1, 0, - 0.953649879, 0, 0.300918877)
        elseif v63 == 3200 or (v63 <= 3204 or SelectMonster == "Flame User [Lv. 3200]") then
            Ms = "Flame User [Lv. 3200]"
            NameMon = "Flame User"
            CFrameMon = CFrame.new(2747.37378, 14.5554838, 1847.19946, - 0.0956259966, 0, 0.995417356, 0, 1, 0, - 0.995417356, 0, - 0.0956259966)
            QuestName = "Kill 1 Flame User"
            CFrameQ = CFrame.new(2563.74854, 14.7266712, 1600.75537, - 0.0956259966, 0, 0.995417356, 0, 1, 0, - 0.995417356, 0, - 0.0956259966)
        elseif v63 == 3205 or (v63 <= 3224 or SelectMonster == "Chess Soldier [Lv. 3200]") then
            Ms = "Chess Soldier [Lv. 3200]"
            NameMon = "Chess Soldier"
            CFrameMon = CFrame.new(- 228.520065, 43.9472275, 8016.48096, - 0.994644165, 0, 0.103361435, 0, 1, 0, - 0.103361435, 0, - 0.994644165)
            QuestName = "Kill 4 Chess Soldiers"
            CFrameQ = CFrame.new(- 423.387482, 28.9913864, 7886.23926, - 0.992770553, 0, - 0.12002904, 0, 1, 0, 0.12002904, 0, - 0.992770553)
        elseif v63 == 3225 or (v63 <= 3249 or SelectMonster == "Sunken Vessel [Lv. 3225]") then
            Ms = "Sunken Vessel [Lv. 3225]"
            NameMon = "Sunken Vessel"
            CFrameMon = CFrame.new(- 1079.80652, 50.9818382, 8227.61133, 0.745247126, 0, - 0.666788399, 0, 1, 0, 0.666788399, 0, 0.745247126)
            QuestName = "Kill 1 Sunken Vessel"
            CFrameQ = CFrame.new(- 932.724792, 28.7121162, 7950.34131, - 0.882701278, 0, - 0.469934702, 0, 1, 0, 0.469934702, 0, - 0.882701278)
        elseif v63 == 3250 or (v63 <= 3274 or SelectMonster == "Biscuit Man [Lv. 3250]") then
            Ms = "Biscuit Man [Lv. 3250]"
            NameMon = "Biscuit Man"
            CFrameMon = CFrame.new(- 1528.14978, 188.660568, 8862.65332, 0.256339848, 0, - 0.966586709, 0, 1, 0, 0.966586709, 0, 0.256339848)
            QuestName = "Kill 1 Biscuit Man"
            CFrameQ = CFrame.new(- 1299.80981, 202.373993, 8823.39941, 0.256339848, 0, - 0.966586709, 0, 1, 0, 0.966586709, 0, 0.256339848)
        elseif v63 == 3275 or (v63 <= 3299 or SelectMonster == "Dough Master [Lv. 3275]") then
            Ms = "Dough Master [Lv. 3275]"
            NameMon = "Dough Master"
            CFrameMon = CFrame.new(30327.5195, 24.8895359, 93400.6953, 0.964679062, 0, 0.263428092, 0, 1, 0, - 0.263428092, 0, 0.964679062)
            QuestName = "Kill 1 Dough Master"
            CFrameQ = CFrame.new(- 125.591431, 190.086151, 8911.15625, 0.0108354688, 0, 0.999941289, 0, 1, 0, - 0.999941289, 0, 0.0108354688)
        elseif v63 == 3300 or (v63 <= 3324 or SelectMonster == "Azlan [Lv. 3300]") then
            Ms = "Azlan [Lv. 3300]"
            NameMon = "Azlan"
            CFrameMon = CFrame.new(- 724.650757, 56.9902611, - 2984.38623, - 0.325903177, 0, 0.945403159, 0, 1, 0, - 0.945403159, 0, - 0.325903177)
            QuestName = "Kill 4 Azlan"
            CFrameQ = CFrame.new(- 549.345337, 57.0320244, - 2588.38623, 0.994159877, 0, 0.107917249, 0, 1, 0, - 0.107917249, 0, 0.994159877)
        elseif v63 == 3325 or (v63 <= 3349 or SelectMonster == "The Volcano [Lv. 3325]") then
            Ms = "The Volcano [Lv. 3325]"
            NameMon = "The Volcano"
            CFrameMon = CFrame.new(130.567993, 131.806305, - 3541.48096, 0.668266773, 0, - 0.743921757, 0, 1, 0, 0.743921757, 0, 0.668266773)
            QuestName = "Kill 4 The Volcano"
            CFrameQ = CFrame.new(- 220.802872, 119.976326, - 3494.13574, - 0.92675066, 0, 0.375677317, 0, 1, 0, - 0.375677317, 0, - 0.92675066)
        elseif v63 == 3350 or (v63 <= 3374 or SelectMonster == "The Ice King [Lv. 3350]") then
            Ms = "The Ice King [Lv. 3350]"
            NameMon = "The Ice King"
            CFrameMon = CFrame.new(- 1009.49219, 158.360611, - 3405.92944, - 0.996530652, 0, 0.083228454, 0, 1, 0, - 0.083228454, 0, - 0.996530652)
            QuestName = "Kill 1 The Ice King"
            CFrameQ = CFrame.new(- 1009.49219, 158.360611, - 3405.92944, - 0.996530652, 0, 0.083228454, 0, 1, 0, - 0.083228454, 0, - 0.996530652)
        elseif v63 == 3375 or (v63 <= 3399 or SelectMonster == "The Crimson Demon [Lv. 3375]") then
            Ms = "The Crimson Demon [Lv. 3375]"
            NameMon = "The Crimson Demon"
            CFrameMon = CFrame.new(- 82.085083, 135.136322, - 3913.07056, - 0.9558599, 0, - 0.293823361, 0, 1, 0, 0.293823361, 0, - 0.9558599)
            QuestName = "Kill 1 The Crimson Demon"
            CFrameQ = CFrame.new(- 82.085083, 135.136322, - 3913.07056, - 0.9558599, 0, - 0.293823361, 0, 1, 0, 0.293823361, 0, - 0.9558599)
        elseif v63 == 3400 or (v63 <= 3424 or SelectMonster == "Dark Beard Servant [Lv. 3400]") then
            Ms = "Dark Beard Servant [Lv. 3400]"
            NameMon = "Dark Beard Servant"
            CFrameMon = CFrame.new(- 9197.24023, 59.3387299, - 4650.29102, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            QuestName = "Kill 4 Dark Beard Servant"
            CFrameQ = CFrame.new(- 9267.60938, 57.823555, - 4991.7915, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        elseif v63 == 3425 or (v63 <= 3449 or SelectMonster == "Supreme Swordman [Lv. 3425]") then
            Ms = "Supreme Swordman [Lv. 3425]"
            NameMon = "Supreme Swordman"
            CFrameMon = CFrame.new(- 9676.27246, 59.3471222, - 4553.47754, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            QuestName = "Kill 1 Supreme Swordman"
            CFrameQ = CFrame.new(- 9261.44336, 68.3412399, - 5125.96729, 0, 0, - 1, 0, 1, 0, 1, 0, 0)
        elseif v63 == 3450 or (v63 <= 3474 or SelectMonster == "Sally [Lv. 3450]") then
            Ms = "Sally [Lv. 3450]"
            NameMon = "Sally"
            CFrameMon = CFrame.new(- 9598.53613, 59.3750267, - 5271.25244, 0, 0, - 1, 0, 1, 0, 1, 0, 0)
            QuestName = "Kill 1 Sally"
            CFrameQ = CFrame.new(- 9532.60059, 59.3221931, - 4854.02148, 0.79254514, 0, 0.609813273, 0, 1, 0, - 0.609813273, 0, 0.79254514)
        elseif v63 == 3475 or (v63 <= 3499 or SelectMonster == "Dark Beard [Lv. 3475]") then
            Ms = "Dark Beard [Lv. 3475]"
            NameMon = "Dark Beard"
            CFrameMon = CFrame.new(- 9735.57422, 59.3532562, - 5010.46582, - 1, 0, 0, 0, 1, 0, 0, 0, - 1)
            QuestName = "Kill 1 Dark Beard"
            CFrameQ = CFrame.new(- 9735.57422, 59.3532562, - 5010.46582, - 1, 0, 0, 0, 1, 0, 0, 0, - 1)
        elseif v63 == 3500 or (v63 <= 3524 or SelectMonster == "Vice Admiral [Lv. 3500]") then
            Ms = "Vice Admiral [Lv. 3500]"
            NameMon = "Vice Admiral"
            CFrameMon = CFrame.new(- 9999.10742, 37.8335876, 450.518555, 0.356322587, 0, 0.934362948, 0, 1, 0, - 0.934362948, 0, 0.356322587)
            QuestName = "Kill 5 Vice Admiral"
            CFrameQ = CFrame.new(- 9848.87305, 37.9285622, 930.867859, - 0.999625921, 0, - 0.0273615234, 0, 1, 0, 0.0273615234, 0, - 0.999625921)
        elseif v63 == 3525 or (v63 <= 3549 or SelectMonster == "Pondere [Lv. 3525]") then
            Ms = "Pondere [Lv. 3525]"
            NameMon = "Pondere"
            CFrameMon = CFrame.new(- 10062.9785, 37.8313446, 1418.31311, 0.78332603, 0, - 0.621611178, 0, 1, 0, 0.621611178, 0, 0.78332603)
            QuestName = "Kill 1 Pondere"
            CFrameQ = CFrame.new(- 9923.49219, 37.9401703, 1133.78027, 0.104427755, 0, 0.994532466, 0, 1, 0, - 0.994532466, 0, 0.104427755)
        elseif v63 == 3550 or (v63 <= 3574 or SelectMonster == "Hefty [Lv. 3550]") then
            Ms = "Hefty [Lv. 3550]"
            NameMon = "Hefty"
            CFrameMon = CFrame.new(- 10805.9121, 83.3297806, 972.383362, 0, 0, - 1, 0, 1, 0, 1, 0, 0)
            QuestName = "Kill 1 Hefty"
            CFrameQ = CFrame.new(- 10310.5264, 88.4367447, 999.291565, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        elseif v63 == 3575 or (v63 <= 3599 or SelectMonster == "Lucidus [Lv. 3575]") then
            Ms = "Lucidus [Lv. 3575]"
            NameMon = "Lucidus"
            CFrameMon = CFrame.new(- 10593.1631, 329.381683, 1142.13037, 0.933838964, 0, 0.357693672, 0, 1, 0, - 0.357693672, 0, 0.933838964)
            QuestName = "Kill 1 Lucidus"
            CFrameQ = CFrame.new(- 10593.1631, 329.381683, 1142.13037, 0.933838964, 0, 0.357693672, 0, 1, 0, - 0.357693672, 0, 0.933838964)
        elseif v63 == 3600 or (v63 <= 3624 or SelectMonster == "Fiore Gladiator [Lv. 3600]") then
            Ms = "Fiore Gladiator [Lv. 3600]"
            NameMon = "Fiore Gladiator"
            CFrameMon = CFrame.new(5402.85156, 71.8926697, - 2867.72412, - 0.368119001, 0, 0.929778576, 0, 1, 0, - 0.929778576, 0, - 0.368119001)
            QuestName = "Kill 6 Fiore Gladiator"
            CFrameQ = CFrame.new(5517.44238, 71.8231201, - 2741.59937, - 0.699018955, 0, 0.715103269, 0, 1, 0, - 0.715103269, 0, - 0.699018955)
        elseif v63 == 3625 or (v63 <= 3649 or SelectMonster == "Fiore Fighter [Lv. 3625]") then
            Ms = "Fiore Fighter [Lv. 3625]"
            NameMon = "Fiore Fighter"
            CFrameMon = CFrame.new(5438.84619, 71.8926697, - 2481.49609, 0.407749295, 0, 0.913094103, 0, 1, 0, - 0.913094103, 0, 0.407749295)
            QuestName = "Kill 6 Fiore Fighter"
            CFrameQ = CFrame.new(5509.24268, 71.8113708, - 2592.66089, 0.727575064, 0, - 0.686028123, 0, 1, 0, 0.686028123, 0, 0.727575064)
        elseif v63 == 3650 or (v63 <= 3674 or SelectMonster == "Fiore Pirate [Lv. 3650]") then
            Ms = "Fiore Pirate [Lv. 3650]"
            NameMon = "Fiore Pirate"
            CFrameMon = CFrame.new(6035.91064, 71.8926849, - 2998.12305, 0.768240929, 0, - 0.640160859, 0, 1, 0, 0.640160859, 0, 0.768240929)
            QuestName = "Kill 7 Fiore Pirate"
            CFrameQ = CFrame.new(5932.64307, 106.897644, - 2855.19409, - 0.864078999, 0, 0.503356457, 0, 1, 0, - 0.503356457, 0, - 0.864078999)
        elseif v63 == 3675 or (v63 <= 3699 or SelectMonster == "Lomeo [Lv. 3675]") then
            Ms = "Lomeo [Lv. 3675]"
            NameMon = "Lomeo"
            CFrameMon = CFrame.new(6623.50488, 73.1037216, - 2153.8457, - 0.100727081, 0, 0.994914114, 0, 1, 0, - 0.994914114, 0, - 0.100727081)
            QuestName = "Kill 1 Lomeo"
            CFrameQ = CFrame.new(6284.93359, 71.8186493, - 2160.41016, - 0.994917274, 0, - 0.100695916, 0, 1, 0, 0.100695916, 0, - 0.994917274)
        elseif v63 == 3700 or (v63 <= 3724 or SelectMonster == "Prince Aria [Lv. 3700]") then
            Ms = "Prince Aria [Lv. 3700]"
            NameMon = "Prince Aria"
            CFrameMon = CFrame.new(6853.38574, 150.068878, - 3759.19019, - 0.933587909, 0, - 0.358349502, 0, 1, 0, 0.358349502, 0, - 0.933587909)
            QuestName = "Kill 1 Prince Aria"
            CFrameQ = CFrame.new(6819.37842, 106.709763, - 3102.6936, - 0.955962658, 0, - 0.293489665, 0, 1, 0, 0.293489665, 0, - 0.955962658)
        elseif v63 == 3725 or (v63 <= 3749 or SelectMonster == "Devastate [Lv. 3725]") then
            Ms = "Devastate [Lv. 3725]"
            NameMon = "Devastate"
            CFrameMon = CFrame.new(7423.58252, 81.5720444, - 2544.32275, 0.396896064, 0, 0.917863548, 0, 1, 0, - 0.917863548, 0, 0.396896064)
            QuestName = "Kill 1 Devastate"
            CFrameQ = CFrame.new(6818.05518, 106.745216, - 2829.42163, 0.428514481, 0, - 0.903535068, 0, 1, 0, 0.903535068, 0, 0.428514481)
        elseif v63 == 3750 or (v63 <= 3774 or SelectMonster == "Physicus [Lv. 3750]") then
            Ms = "Physicus [Lv. 3750]"
            NameMon = "Physicus"
            CFrameMon = CFrame.new(8017.04639, 178.501785, - 4339.48486, - 0.982889652, 0, 0.184195086, 0, 1, 0, - 0.184195086, 0, - 0.982889652)
            QuestName = "Kill 1 Physicus"
            CFrameQ = CFrame.new(8121.56982, 176.99292, - 4139.00732, - 0.959672332, 0, - 0.281121612, 0, 1, 0, 0.281121612, 0, - 0.959672332)
        elseif v63 == 3775 or (v63 <= 3799 or SelectMonster == "Floffy [Lv. 3775]") then
            Ms = "Floffy [Lv. 3775]"
            NameMon = "Floffy"
            CFrameMon = CFrame.new(7897.60059, 452.946228, - 2397.40625, 0.461344481, 0, 0.887221098, 0, 1, 0, - 0.887221098, 0, 0.461344481)
            QuestName = "Kill 1 Floffy"
            CFrameQ = CFrame.new(7837.79199, 452.748474, - 2623.31128, 0.219037294, 0, 0.975716531, 0, 1, 0, - 0.975716531, 0, 0.219037294)
        elseif v63 == 3800 or (v63 <= 3849 or SelectMonster == "Dead Troupe [Lv. 3800]") then
            Ms = "Dead Troupe [Lv. 3800]"
            NameMon = "Dead Troupe"
            CFrameMon = CFrame.new(9550.23926, 71.9844055, - 4322.88477, 0.980187833, 0, 0.198070183, 0, 1, 0, - 0.198070183, 0, 0.980187833)
            QuestName = "Kill 4 Dead Troupe"
            CFrameQ = CFrame.new(9413.47852, 88.4959869, - 4423.93604, - 0.888033032, 0, - 0.459780365, 0, 1, 0, 0.459780365, 0, - 0.888033032)
        elseif v63 == 3850 or (v63 <= 3974 or SelectMonster == "Dead Troupe Captain [Lv. 3850]") then
            Ms = "Dead Troupe Captain [Lv. 3850]"
            NameMon = "Dead Troupe Captain"
            CFrameMon = CFrame.new(10085.4346, 71.9687805, - 4075.80664, - 0.565670848, 0, - 0.824631512, 0, 1, 0, 0.824631512, 0, - 0.565670848)
            QuestName = "Kill 4 Dead Troupe Captain"
            CFrameQ = CFrame.new(10029.2803, 102.159523, - 3931.21704, 0.358377755, 0, - 0.933576643, 0, 1, 0, 0.933576643, 0, 0.358377755)
        elseif v63 >= 3975 or SelectMonster == "Ryu [Lv. 3975]" then
            Ms = "Ryu [Lv. 3975]"
            NameMon = "Ryu"
            CFrameMon = CFrame.new(9954.21582, 71.9687805, - 4683.18213, - 0.147114038, 0, 0.989119589, 0, 1, 0, - 0.989119589, 0, - 0.147114038)
            QuestName = "Kill 1 Ryu"
            CFrameQ = CFrame.new(9619.16211, 71.8139114, - 4660.13574, - 0.130802155, 0, - 0.991408527, 0, 1, 0, 0.991408527, 0, - 0.130802155)
        end
    end
    if Third_World then
        if v63 == 4000 or (v63 <= 4049 or SelectMonster == "Deep Diver [Lv. 4000]") then
            Ms = "Deep Diver [Lv. 4000]"
            NameMon = "Deep Diver"
            CFrameMon = CFrame.new(1485.48315, 35.7500153, 969.895996, - 0.300817013, 0, - 0.953681946, 0, 1, 0, 0.953681946, 0, - 0.300817013)
            QuestName = "Kill 4 Deep Diver"
            CFrameQ = CFrame.new(2230.58252, 35.5410423, 924.39502, - 0.786687195, - 4.28852189e-8, 0.61735177, - 6.59950317e-8, 1, - 1.46306007e-8, - 0.61735177, - 5.22518562e-8, - 0.786687195)
        elseif v63 == 4050 or (v63 <= 4099 or SelectMonster == "Fugitive [Lv. 4050]") then
            Ms = "Fugitive [Lv. 4050]"
            NameMon = "Fugitive"
            CFrameMon = CFrame.new(2838.67139, 35.9668121, 1114.66064, 0.585472524, 0, 0.810692251, 0, 1, 0, - 0.810692251, 0, 0.585472524)
            QuestName = "Kill Fugitive"
            CFrameQ = CFrame.new(2230.58252, 35.5410423, 924.39502, - 0.786687195, - 4.28852189e-8, 0.61735177, - 6.59950317e-8, 1, - 1.46306007e-8, - 0.61735177, - 5.22518562e-8, - 0.786687195)
        elseif v63 == 4100 or (v63 <= 4149 or SelectMonster == "Deep one Villager [Lv. 4100]") then
            Ms = "Deep one Villager [Lv. 4100]"
            NameMon = "Deep one Villager"
            CFrameMon = CFrame.new(3467.17163, 203.654388, 915.361755, 0.449452758, 0, 0.893304229, 0, 1, 0, - 0.893304229, 0, 0.449452758)
            QuestName = "Kill 4 Deep one Villager"
            CFrameQ = CFrame.new(2230.58252, 35.5410423, 924.39502, - 0.786687195, 3.06241148e-8, 0.61735177, 4.72041073e-8, 1, 1.0546259e-8, - 0.61735177, 3.7438145e-8, - 0.786687195)
        elseif v63 == 4150 or (v63 <= 4199 or SelectMonster == "Fishman Guardian [Lv. 4150]") then
            Ms = "Fishman Guardian [Lv. 4150]"
            NameMon = "Fishman Guardian"
            CFrameMon = CFrame.new(1779.84167, 35.7861481, 295.482574, 0.353282869, 0, - 0.935516536, 0, 1, 0, 0.935516536, 0, 0.353282869)
            QuestName = "Kill 6 Fishman Guardian"
            CFrameQ = CFrame.new(2047.20459, 35.5419464, - 139.277466, - 0.987440884, - 2.09865139e-8, - 0.157988787, - 2.22481056e-8, 1, 6.21673912e-9, 0.157988787, 9.65361391e-9, - 0.987440884)
        elseif v63 == 4200 or (v63 <= 4249 or SelectMonster == "The deep one [Lv. 4200]") then
            Ms = "The deep one [Lv. 4200]"
            NameMon = "The deep one"
            CFrameMon = CFrame.new(2929.89209, 35.7714996, 84.7305069, - 0.369380116, 0, 0.929278433, 0, 1, 0, - 0.929278433, 0, - 0.369380116)
            QuestName = "Kill The deep one"
            CFrameQ = CFrame.new(2047.20459, 35.5419464, - 139.277466, - 0.987440884, - 2.09865139e-8, - 0.157988787, - 2.22481056e-8, 1, 6.21673912e-9, 0.157988787, 9.65361391e-9, - 0.987440884)
        elseif v63 == 4250 or (v63 <= 4299 or SelectMonster == "Fishman King\'s Guard [Lv. 4250]") then
            Ms = "Fishman King\'s Guard [Lv. 4250]"
            NameMon = "Fishman King\'s Guard"
            CFrameMon = CFrame.new(1942.7832, 35.7138824, - 251.11438, 0.671772957, 0, - 0.740757227, 0, 1, 0, 0.740757227, 0, 0.671772957)
            QuestName = "Kill Fishman King\'s Guard"
            CFrameQ = CFrame.new(2047.20459, 35.5419464, - 139.277466, - 0.987440884, - 2.09865139e-8, - 0.157988787, - 2.22481056e-8, 1, 6.21673912e-9, 0.157988787, 9.65361391e-9, - 0.987440884)
        elseif v63 == 4300 or (v63 <= 4324 or SelectMonster == "Jungle Gorilla [Lv. 4300]") then
            Ms = "Jungle Gorilla [Lv. 4300]"
            NameMon = "Jungle Gorilla"
            CFrameMon = CFrame.new(4305.07227, 45.9609604, 9296.42676, 0.264738023, 0, - 0.964320362, 0, 1, 0, 0.964320362, 0, 0.264738023)
            QuestName = "Kill 5 Jungle Gorilla"
            CFrameQ = CFrame.new(5170.45215, 45.7559166, 9742.71875, 0.724315703, - 5.67119969e-8, 0.689468443, 5.91111728e-8, 1, 2.01558805e-8, - 0.689468443, 2.61560675e-8, 0.724315703)
        elseif v63 == 4325 or (v63 <= 4349 or SelectMonster == "Wilderness Gorilla [Lv. 4325]") then
            Ms = "Wilderness Gorilla [Lv. 4325]"
            NameMon = "Wilderness Gorilla"
            CFrameMon = CFrame.new(4883.46338, 45.9609604, 10061.3721, - 0.227107644, 0, 0.973869681, 0, 1, 0, - 0.973869681, 0, - 0.227107644)
            QuestName = "Kill 5 Wilderness Gorilla"
            CFrameQ = CFrame.new(5170.45215, 45.7559166, 9742.71875, 0.724315703, - 5.67119969e-8, 0.689468443, 5.91111728e-8, 1, 2.01558805e-8, - 0.689468443, 2.61560675e-8, 0.724315703)
        elseif v63 == 4350 or (v63 <= 4374 or SelectMonster == "Jungle Ape [Lv. 4350]") then
            Ms = "Jungle Ape [Lv. 4350]"
            NameMon = "Jungle Ape"
            CFrameMon = CFrame.new(5566.82275, 45.5234604, 9779.37207, - 0.00195252895, 0, 0.999998152, 0, 1, 0, - 0.999998152, 0, - 0.00195252895)
            QuestName = "Kill 5 Jungle Ape"
            CFrameQ = CFrame.new(5170.45215, 45.7559166, 9742.71875, 0.724315703, - 5.67119969e-8, 0.689468443, 5.91111728e-8, 1, 2.01558805e-8, - 0.689468443, 2.61560675e-8, 0.724315703)
        elseif v63 >= 4375 or SelectMonster == "Cyborg Gorilla [Lv. 4375]" then
            Ms = "Cyborg Gorilla [Lv. 4375]"
            NameMon = "Cyborg Gorilla"
            CFrameMon = CFrame.new(5877.31543, 45.9765854, 9377.1377, - 0.115828633, 0, 0.993269384, 0, 1, 0, - 0.993269384, 0, - 0.115828633)
            QuestName = "Kill 1 Cyborg Gorilla"
            CFrameQ = CFrame.new(5170.45215, 45.7559166, 9742.71875, 0.724315703, - 5.67119969e-8, 0.689468443, 5.91111728e-8, 1, 2.01558805e-8, - 0.689468443, 2.61560675e-8, 0.724315703)
        end
    end
end
spawn(function()
    while wait() do
        pcall(function()
            if _G.RaidAttack or (DevilMastery_Farm or (AutoAttackKraken or (AutoFarmNearest or (AutoFarmQuest or (AutoNoFarmQuest or (AutoFarmSelectMonsterQuest or (AutoFarmSelectMonsterNoQuest or (AutoNewWorld or (AutoBigmom or (AutoOden or (AutoGhostship or (AutoHydra or (tptofirst or (tptonew or (BringDevilFruit or (_G.AutoKillply or (_G.KillRaidMon or (_G.SafeRaid or (_G.NoClip or StartFarm))))))))))))))))))) then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local v64 = Instance.new("BodyVelocity")
                    v64.Name = "BodyClip"
                    v64.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    v64.MaxForce = Vector3.new(100000, 100000, 100000)
                    v64.Velocity = Vector3.new(0, 0, 0)
                end
            elseif game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
        end)
    end
end)
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.RaidAttack or (DevilMastery_Farm or (AutoAttackKraken or (AutoFarmNearest or (AutoFarmQuest or (AutoNoFarmQuest or (AutoFarmSelectMonsterQuest or (AutoFarmSelectMonsterNoQuest or (AutoNewWorld or (AutoBigmom or (AutoOden or (AutoGhostship or (AutoHydra or (tptofirst or (tptonew or (BringDevilFruit or (_G.AutoKillply or (_G.KillRaidMon or (_G.SafeRaid or (_G.NoClip or StartFarm))))))))))))))))))) then
                local v65, v66, v67 = pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())
                while true do
                    local v68
                    v67, v68 = v65(v66, v67)
                    if v67 == nil then
                        break
                    end
                    if v68:IsA("BasePart") then
                        v68.CanCollide = false
                    end
                end
            end
        end)
    end)
end)
function Click()
    game:GetService("VirtualUser"):Button1Down(Vector2.new(0.9, 0.9))
    game:GetService("VirtualUser"):Button1Up(Vector2.new(0.9, 0.9))
end
function GetQuest(p69)
    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild(p69) then
        game:GetService("Players").LocalPlayer.PlayerGui[p69].Dialogue.Accept.Size = UDim2.new(0, 5000, 0, 2000)
        game:GetService("Players").LocalPlayer.PlayerGui[p69].Dialogue.Accept.Position = UDim2.new(- 2, 0, - 5, 0)
        game:GetService("Players").LocalPlayer.PlayerGui[p69].Dialogue.Accept.ImageTransparency = 1
        wait(0.5)
        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
        game:GetService("VirtualUser"):Button1Up(Vector2.new(1280, 672))
    end
end
function GetQuestThirdWorldtest(p70, p71)
    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild(p70) then
        game:GetService("Players").LocalPlayer.PlayerGui[p70].Dialogue[p71].Size = UDim2.new(0, 5000, 0, 2000)
        game:GetService("Players").LocalPlayer.PlayerGui[p70].Dialogue[p71].Position = UDim2.new(- 2, 0, - 5, 0)
        game:GetService("Players").LocalPlayer.PlayerGui[p70].Dialogue[p71].ImageTransparency = 1
        wait(0.5)
        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
        game:GetService("VirtualUser"):Button1Up(Vector2.new(1280, 672))
        wait(0.5)
        game:GetService("Players").LocalPlayer.PlayerGui[p70].Dialogue.QuestAccept.Size = UDim2.new(0, 5000, 0, 2000)
        game:GetService("Players").LocalPlayer.PlayerGui[p70].Dialogue.QuestAccept.Position = UDim2.new(- 2, 0, - 5, 0)
        game:GetService("Players").LocalPlayer.PlayerGui[p70].Dialogue.QuestAccept.ImageTransparency = 1
        wait(0.5)
        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
        game:GetService("VirtualUser"):Button1Up(Vector2.new(1280, 672))
    end
end
function GetQuestThirdWorld(p72)
    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild(p72) then
        local v73 = {
            {
                Quest = QuestInfo
            }
        }
        game:GetService("Players").LocalPlayer.PlayerGui.LoreGUI.LOREGUI_REMOTE:InvokeServer(unpack(v73))
    end
end
function TP(p74)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p74
end
function CancelTween(p75)
    if not p75 then
        _G.StopTween = true
        wait(0.1)
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait(0.1)
        _G.StopTween = false
    end
end
function AutoClick()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
end
spawn(function()
    pcall(function()
        while wait() do
            if _G.AttackSWMain then
                local v76 = {
                    "SW_" .. SelectWeapon .. "_M1"
                }
                game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer(unpack(v76))
            end
            if _G.AttackSWMain then
                local v77 = {
                    "FS_" .. SelectWeapon .. "_M1"
                }
                game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer(unpack(v77))
            end
        end
    end)
end)
function AttackMain()
    local v78, v79, v80 = pairs(game.Players.LocalPlayer.Character:GetChildren())
    while true do
        local v81
        v80, v81 = v78(v79, v80)
        if v80 == nil then
            break
        end
        if v81.ClassName == "Tool" then
            if v81.ToolTip ~= "Combat" then
                if v81.ToolTip == "Sword" then
                    local v82 = {
                        "SW_" .. v81.Name .. "_M1"
                    }
                    game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer(unpack(v82))
                end
            else
                local v83 = {
                    "FS_" .. v81.Name .. "_M1"
                }
                game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer(unpack(v83))
            end
        end
    end
end
local v84 = v4.Tab_Setting:addSection():addMenu("#Main Setting")
function EquipTool(pu85)
    pcall(function()
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[pu85])
    end)
end
SelectWeapon = "Melee"
v84:addDropdown("Select Weapon", SelectWeapon, {
    "Melee",
    "Sword",
    "Fruit"
}, function(p86)
    SelectWeapon = p86
end)
task.spawn(function()
    while wait() do
        pcall(function()
            if SelectWeapon ~= "Melee" then
                if SelectWeapon ~= "Sword" then
                    if SelectWeapon == "Fruit" then
                        local v87, v88, v89 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                        while true do
                            local v90
                            v89, v90 = v87(v88, v89)
                            if v89 == nil then
                                break
                            end
                            if v90.ToolTip == "Fruit Power" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v90.Name)) then
                                SelectWeapon = v90.Name
                            end
                        end
                    end
                else
                    local v91, v92, v93 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                    while true do
                        local v94
                        v93, v94 = v91(v92, v93)
                        if v93 == nil then
                            break
                        end
                        if v94.ToolTip == "Sword" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v94.Name)) then
                            SelectWeapon = v94.Name
                        end
                    end
                end
            else
                local v95, v96, v97 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                while true do
                    local v98
                    v97, v98 = v95(v96, v97)
                    if v97 == nil then
                        break
                    end
                    if v98.ToolTip == "Combat" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v98.Name)) then
                        SelectWeapon = v98.Name
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            AttackMain()
        end)
    end
end)
AutoFarmType = "Above"
v84:addDropdown("Select Farm Type", AutoFarmType, {
    "Above",
    "Bellow",
    "Behind"
}, function(p99)
    AutoFarmType = p99
end)
spawn(function()
    while wait(0.1) do
        if AutoFarmType ~= "Above" then
            if AutoFarmType ~= "Bellow" then
                if AutoFarmType == "Behind" then
                    Farm_Mode = CFrame.new(0, 0, DisFarm) * CFrame.Angles(math.rad(0), 0, 0)
                end
            else
                Farm_Mode = CFrame.new(0, DisFarm, 1) * CFrame.Angles(math.rad(90), 0, 0)
            end
        else
            Farm_Mode = CFrame.new(0, DisFarm, - 1) * CFrame.Angles(math.rad(- 90), 0, 0)
        end
    end
end)
DisFarm = 8
v84:addTextbox("Distance", DisFarm, function(p100)
    DisFarm = p100
end)
v84:addToggle("Auto Active Armament Haki", BusoHaki, function(p101)
    BusoHaki = p101
end)
function Haki()
    local v102 = game.Players.LocalPlayer.Character
    if not v102:FindFirstChild("ArmamentBodyGroup") and v102.Haki.Value == 0 then
        game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
        game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
    end
end
spawn(function()
    while task.wait() do
        if BusoHaki then
            pcall(function()
                Haki()
            end)
        end
    end
end)
v84:addToggle("Auto Active Observation Haki", ObservationHak, function(p103)
    ObservationHak = p103
end)
function KenHaki()
    if game.Players.LocalPlayer.Character.KenOpen.Value == false then
        game:service("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
        game:service("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
    end
end
spawn(function()
    while task.wait() do
        if ObservationHak then
            pcall(function()
                KenHaki()
            end)
        end
    end
end)
v84:addToggle("Auto Die if Quest Completed", _G.Death, function(p104)
    _G.Death = p104
end)
v84:addToggle("Disable Notificationd", _G.Notif, function(p105)
    _G.Notif = p105
end)
task.spawn(function()
    while task.wait() do
        if _G.Notif then
            game:GetService("Players").LocalPlayer.PlayerGui.Popup.Disable = true
        else
            game:GetService("Players").LocalPlayer.PlayerGui.Popup.Disable = false
        end
    end
end)
v84:addButton("Reset Character", function()
    game.Players.LocalPlayer.Character.Head:Destroy()
end)
local v106 = v4.Tab_Setting:addSection():addMenu("#Skill Setting")
v106:addToggle("Use Skill Z", SkillZ, function(p107)
    SkillZ = p107
end)
v106:addToggle("Use Skill X", SkillX, function(p108)
    SkillX = p108
end)
v106:addToggle("Use Skill C", SkillC, function(p109)
    SkillC = p109
end)
v106:addToggle("Use Skill V", SkillV, function(p110)
    SkillV = p110
end)
v106:addToggle("Use Skill E", SkillE, function(p111)
    SkillE = p111
end)
spawn(function()
    while task.wait() do
        if SkillZ then
            game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
            wait(0.1)
            game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
        end
        if SkillX then
            game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
            wait(0.1)
            game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
        end
        if SkillC then
            game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
            wait(0.1)
            game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
        end
        if SkillV then
            game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
            wait(0.1)
            game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
        end
        if SkillE then
            game:service("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
            wait(0.1)
            game:service("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
        end
    end
end)
local v112 = v4.Tab_2:addSection()
local v113 = v112:addMenu("#Main Farm")
v113:addToggle("Auto Farm Quest", AutoFarmQuest, function(p114)
    AutoFarmQuest = p114
    SelectMonster = nil
end)
spawn(function()
    while task.wait() do
        if AutoFarmQuest then
            pcall(function()
                CheckQuest()
                if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Visible == false then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQ
                    local v115 = {
                        "take",
                        QuestName
                    }
                    game:GetService("ReplicatedStorage").Chest.Remotes.Functions.Quest:InvokeServer(unpack(v115))
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Visible ~= true then
                    return
                end
                if not game:GetService("Workspace").Monster.Mon:FindFirstChild(Ms) then
                end
                local v116, v117, v118 = pairs(game:GetService("Workspace").Monster.Mon:GetChildren())
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                if not game:GetService("Workspace").Monster.Boss:FindFirstChild(Ms) then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                end
                local v119, v120, v121 = pairs(game:GetService("Workspace").Monster.Boss:GetChildren())
                local v122
                v121, v122 = v119(v120, v121)
                if v121 == nil then
                end
                if not v122:FindFirstChild("Humanoid") or (not v122:FindFirstChild("HumanoidRootPart") or (v122.Humanoid.Health <= 0 or v122.Name ~= Ms)) then
                end
                if true then
                    game:GetService("RunService").Heartbeat:wait()
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.QuestCount.Text, NameMon) then
                        EquipTool(SelectWeapon)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v122.HumanoidRootPart.CFrame * Farm_Mode
                        v122.HumanoidRootPart.Anchored = true
                        MonsterPosition = v122.HumanoidRootPart.Position
                        MonsterName = v122.Name
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.Size = UDim2.new(0.0937409922, 0, 0.140079007, 0)
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.BackgroundTransparency = 0
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.Position = UDim2.new(0.875999987, 0, 0.0450000018, 0)
                    elseif not string.find(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.QuestCount.Text, NameMon) then
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.Size = UDim2.new(0, 5000, 0, 2000)
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.BackgroundTransparency = 1
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.Position = UDim2.new(- 1, 0, - 4, 0)
                        wait(0.3)
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        game:GetService("VirtualUser"):Button1Up(Vector2.new(1280, 672))
                    end
                end
                if AutoFarmQuest and (v122.Parent and v122.Humanoid.Health > 0) and (game:GetService("Workspace").Monster.Boss:FindFirstChild(v122.Name) and game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible ~= false) then
                else
                end
                local v123
                v118, v123 = v116(v117, v118)
                if v118 == nil then
                end
                if not v123:FindFirstChild("Humanoid") or (not v123:FindFirstChild("HumanoidRootPart") or (v123.Humanoid.Health <= 0 or v123.Name ~= Ms)) then
                end
                if true then
                    game:GetService("RunService").Heartbeat:wait()
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.QuestCount.Text, NameMon) then
                        EquipTool(SelectWeapon)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v123.HumanoidRootPart.CFrame * Farm_Mode
                        v123.HumanoidRootPart.Anchored = true
                        MonsterPosition = v123.HumanoidRootPart.Position
                        MonsterName = v123.Name
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.Size = UDim2.new(0.0937409922, 0, 0.140079007, 0)
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.BackgroundTransparency = 0
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.Position = UDim2.new(0.875999987, 0, 0.0450000018, 0)
                    elseif not string.find(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.QuestCount.Text, NameMon) then
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.Size = UDim2.new(0, 5000, 0, 2000)
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.BackgroundTransparency = 1
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.Position = UDim2.new(- 1, 0, - 4, 0)
                        wait(0.3)
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        game:GetService("VirtualUser"):Button1Up(Vector2.new(1280, 672))
                    end
                end
                if AutoFarmQuest and (v123.Parent and v123.Humanoid.Health > 0) and (game:GetService("Workspace").Monster.Mon:FindFirstChild(v123.Name) and game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible ~= false) then
                else
                end
            end)
        end
    end
end)
v113:addToggle("Auto Farm No Quest", AutoNoFarmQuest, function(p124)
    AutoNoFarmQuest = p124
    SelectMonster = nil
end)
spawn(function()
    while task.wait() do
        if AutoNoFarmQuest then
            pcall(function()
                CheckQuest()
                if game:GetService("Workspace").Monster.Mon:FindFirstChild(Ms) then
                    local v125, v126, v127 = pairs(game:GetService("Workspace").Monster.Mon:GetChildren())
                    while true do
                        local v128
                        v127, v128 = v125(v126, v127)
                        if v127 == nil then
                            break
                        end
                        if v128:FindFirstChild("Humanoid") and (v128:FindFirstChild("HumanoidRootPart") and (v128.Humanoid.Health > 0 and v128.Name == Ms)) then
                            repeat
                                game:GetService("RunService").Heartbeat:wait()
                                EquipTool(SelectWeapon)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v128.HumanoidRootPart.CFrame * Farm_Mode
                                v128.HumanoidRootPart.Anchored = true
                                MonsterPosition = v128.HumanoidRootPart.Position
                                MonsterName = v128.Name
                            until not AutoNoFarmQuest or (not v128.Parent or v128.Humanoid.Health <= 0) or not game:GetService("Workspace").Monster.Mon:FindFirstChild(v128.Name)
                        end
                    end
                else
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                end
                if game:GetService("Workspace").Monster.Boss:FindFirstChild(Ms) then
                    local v129, v130, v131 = pairs(game:GetService("Workspace").Monster.Boss:GetChildren())
                    while true do
                        local v132
                        v131, v132 = v129(v130, v131)
                        if v131 == nil then
                            break
                        end
                        if v132:FindFirstChild("Humanoid") and (v132:FindFirstChild("HumanoidRootPart") and (v132.Humanoid.Health > 0 and v132.Name == Ms)) then
                            repeat
                                game:GetService("RunService").Heartbeat:wait()
                                EquipTool(SelectWeapon)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v132.HumanoidRootPart.CFrame * Farm_Mode
                                v132.HumanoidRootPart.Anchored = true
                                MonsterPosition = v132.HumanoidRootPart.Position
                                MonsterName = v132.Name
                            until not AutoNoFarmQuest or (not v132.Parent or v132.Humanoid.Health <= 0) or not game:GetService("Workspace").Monster.Boss:FindFirstChild(v132.Name)
                        end
                    end
                else
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                end
            end)
        end
    end
end)
v113:addToggle("Auto Farm Nearest", AutoFarmNearest, function(p133)
    AutoFarmNearest = p133
end)
spawn(function()
    while task.wait() do
        if AutoFarmNearest then
            pcall(function()
                local v134, v135, v136 = pairs(game:GetService("Workspace").Monster.Mon:GetChildren())
                while true do
                    local v137
                    v136, v137 = v134(v135, v136)
                    if v136 == nil then
                        break
                    end
                    if v137:FindFirstChild("Humanoid") and (v137:FindFirstChild("HumanoidRootPart") and (v137.Humanoid.Health > 0 and (v137.Name and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v137:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 1000))) then
                        repeat
                            game:GetService("RunService").Heartbeat:wait()
                            EquipTool(SelectWeapon)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v137.HumanoidRootPart.CFrame * Farm_Mode
                            v137.HumanoidRootPart.Anchored = true
                            MonsterPosition = v137.HumanoidRootPart.Position
                            MonsterName = v137.Name
                        until not AutoFarmNearest or (not v137.Parent or v137.Humanoid.Health <= 0) or not game:GetService("Workspace").Monster.Mon:FindFirstChild(v137.Name)
                    end
                end
                local v138, v139, v140 = pairs(game:GetService("Workspace").Monster.Boss:GetChildren())
                while true do
                    local v141
                    v140, v141 = v138(v139, v140)
                    if v140 == nil then
                        break
                    end
                    if v141:FindFirstChild("Humanoid") and (v141:FindFirstChild("HumanoidRootPart") and (v141.Humanoid.Health > 0 and (v141.Name and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v141:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 1000))) then
                        repeat
                            game:GetService("RunService").Heartbeat:wait()
                            EquipTool(SelectWeapon)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v141.HumanoidRootPart.CFrame * Farm_Mode
                            v141.HumanoidRootPart.Anchored = true
                            MonsterPosition = v141.HumanoidRootPart.Position
                            MonsterName = v141.Name
                        until not AutoFarmNearest or (not v141.Parent or v141.Humanoid.Health <= 0) or not game:GetService("Workspace").Monster.Boss:FindFirstChild(v141.Name)
                    end
                end
            end)
        end
    end
end)
local v142 = v112:addMenu("#Select Monster Farm")
if First_World then
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
        "Sand Bandit [Lv. 575]",
        "Bomb Man [Lv. 625]",
        "Desert Marauder [Lv. 675]",
        "King of Sand [Lv. 725]",
        "Sky Soldier [Lv. 800]",
        "Ball Man [Lv. 850]",
        "Cloud Warrior [Lv. 900]",
        "Rumble Man [Lv. 950]",
        "Elite Soldier [Lv. 1000]",
        "High-class Soldier [Lv. 1050]",
        "Leader [Lv. 1100]",
        "Pasta [Lv. 1150]",
        "Naval personnel [Lv. 1200]",
        "Wolf [Lv. 1250]",
        "Giraffe [Lv. 1300]",
        "Nautical soldier [Lv. 1350]",
        "Naval soldier [Lv. 1400]",
        "Leo [Lv. 1450]",
        "Zombie [Lv. 1500]",
        "Elite Zombie [Lv. 1550]",
        "Revenant [Lv. 1600]",
        "Shadow Master [Lv. 1650]",
        "New World Pirate [Lv. 1700]",
        "Cutlass Pirate [Lv. 1750]",
        "Rear Admiral [Lv. 1800]",
        "True Karate Fishman [Lv. 1850]",
        "Quake Woman [Lv. 1925]",
        "Fishman [Lv. 2000]",
        "Combat Fishman [Lv. 2050]",
        "Sword Fishman [Lv. 2100]",
        "Soldier Fishman [Lv. 2150]",
        "Seasoned Fishman [Lv. 2200]"
    }
elseif New_World then
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
        "Petra [Lv. 2900]",
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
        "Dough Master [Lv. 3275]",
        "Azlan [Lv. 3300]",
        "The Volcano [Lv. 3325]",
        "The Ice King [Lv. 3350]",
        "The Crimson Demon [Lv. 3375]",
        "Dark Beard Servant [Lv. 3400]",
        "Supreme Swordman [Lv. 3425]",
        "Sally [Lv. 3450]",
        "Dark Beard [Lv. 3475]",
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
elseif Third_World then
    MonsterList = {
        "Deep Diver [Lv. 4000]",
        "Fugitive [Lv. 4050]",
        "Deep one Villager [Lv. 4100]",
        "Fishman Guardian [Lv. 4150]",
        "The deep one [Lv. 4200]",
        "Fishman King\'s Guard [Lv. 4250]",
        "Jungle Gorilla [Lv. 4300]",
        "Wilderness Gorilla [Lv. 4325]",
        "Jungle Ape [Lv. 4350]",
        "Cyborg Gorilla [Lv. 4375]"
    }
end
v142:addDropdown("Select Monster", SelectMonster, MonsterList, function(p143)
    SelectMonster = p143
end)
v142:addToggle("Auto Farm Select Monster Quest", AutoFarmSelectMonsterQuest, function(p144)
    AutoFarmSelectMonsterQuest = p144
end)
spawn(function()
    while task.wait() do
        if AutoFarmSelectMonsterQuest then
            pcall(function()
                CheckQuest()
                if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Visible == false then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQ
                    local v145 = {
                        "take",
                        QuestName
                    }
                    game:GetService("ReplicatedStorage").Chest.Remotes.Functions.Quest:InvokeServer(unpack(v145))
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Visible ~= true then
                    return
                end
                if not game:GetService("Workspace").Monster.Mon:FindFirstChild(SelectMonster) then
                end
                local v146, v147, v148 = pairs(game:GetService("Workspace").Monster.Mon:GetChildren())
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                if not game:GetService("Workspace").Monster.Boss:FindFirstChild(SelectMonster) then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                end
                local v149, v150, v151 = pairs(game:GetService("Workspace").Monster.Boss:GetChildren())
                local v152
                v151, v152 = v149(v150, v151)
                if v151 == nil then
                end
                if not v152:FindFirstChild("Humanoid") or (not v152:FindFirstChild("HumanoidRootPart") or (v152.Humanoid.Health <= 0 or v152.Name ~= SelectMonster)) then
                end
                if true then
                    game:GetService("RunService").Heartbeat:wait()
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.QuestCount.Text, NameMon) then
                        EquipTool(SelectWeapon)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v152.HumanoidRootPart.CFrame * Farm_Mode
                        v152.HumanoidRootPart.Anchored = true
                        MonsterPosition = v152.HumanoidRootPart.Position
                        MonsterName = v152.Name
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.Size = UDim2.new(0.0937409922, 0, 0.140079007, 0)
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.BackgroundTransparency = 0
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.Position = UDim2.new(0.875999987, 0, 0.0450000018, 0)
                    elseif not string.find(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.QuestCount.Text, NameMon) then
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.Size = UDim2.new(0, 5000, 0, 2000)
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.BackgroundTransparency = 1
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.Position = UDim2.new(- 1, 0, - 4, 0)
                        wait(0.3)
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        game:GetService("VirtualUser"):Button1Up(Vector2.new(1280, 672))
                    end
                end
                if AutoFarmSelectMonsterQuest and (v152.Parent and v152.Humanoid.Health > 0) and (game:GetService("Workspace").Monster.Boss:FindFirstChild(v152.Name) and game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Visible ~= false) then
                else
                end
                local v153
                v148, v153 = v146(v147, v148)
                if v148 == nil then
                end
                if not v153:FindFirstChild("Humanoid") or (not v153:FindFirstChild("HumanoidRootPart") or (v153.Humanoid.Health <= 0 or v153.Name ~= SelectMonster)) then
                end
                if true then
                    game:GetService("RunService").Heartbeat:wait()
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.QuestCount.Text, NameMon) then
                        EquipTool(SelectWeapon)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v153.HumanoidRootPart.CFrame * Farm_Mode
                        v153.HumanoidRootPart.Anchored = true
                        MonsterPosition = v153.HumanoidRootPart.Position
                        MonsterName = v153.Name
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.Size = UDim2.new(0.0937409922, 0, 0.140079007, 0)
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.BackgroundTransparency = 0
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.Position = UDim2.new(0.875999987, 0, 0.0450000018, 0)
                    elseif not string.find(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.QuestCount.Text, NameMon) then
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.Size = UDim2.new(0, 5000, 0, 2000)
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.BackgroundTransparency = 1
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Close.Position = UDim2.new(- 1, 0, - 4, 0)
                        wait(0.3)
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        game:GetService("VirtualUser"):Button1Up(Vector2.new(1280, 672))
                    end
                end
                if AutoFarmSelectMonsterQuest and (v153.Parent and v153.Humanoid.Health > 0) and (game:GetService("Workspace").Monster.Mon:FindFirstChild(v153.Name) and game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.Visible ~= false) then
                else
                end
            end)
        end
    end
end)
v142:addToggle("Auto Farm Select Monster No Quest", AutoFarmSelectMonsterNoQuest, function(p154)
    AutoFarmSelectMonsterNoQuest = p154
end)
spawn(function()
    while task.wait() do
        if AutoFarmSelectMonsterNoQuest then
            pcall(function()
                CheckQuest()
                if game:GetService("Workspace").Monster.Mon:FindFirstChild(SelectMonster) then
                    local v155, v156, v157 = pairs(game:GetService("Workspace").Monster.Mon:GetChildren())
                    while true do
                        local v158
                        v157, v158 = v155(v156, v157)
                        if v157 == nil then
                            break
                        end
                        if v158:FindFirstChild("Humanoid") and (v158:FindFirstChild("HumanoidRootPart") and (v158.Humanoid.Health > 0 and v158.Name == SelectMonster)) then
                            repeat
                                game:GetService("RunService").Heartbeat:wait()
                                EquipTool(SelectWeapon)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v158.HumanoidRootPart.CFrame * Farm_Mode
                                v158.HumanoidRootPart.Anchored = true
                                MonsterPosition = v158.HumanoidRootPart.Position
                                MonsterName = v158.Name
                            until not AutoFarmSelectMonsterNoQuest or (not v158.Parent or v158.Humanoid.Health <= 0) or not game:GetService("Workspace").Monster.Mon:FindFirstChild(v158.Name)
                        end
                    end
                else
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                end
                if game:GetService("Workspace").Monster.Boss:FindFirstChild(SelectMonster) then
                    local v159, v160, v161 = pairs(game:GetService("Workspace").Monster.Boss:GetChildren())
                    while true do
                        local v162
                        v161, v162 = v159(v160, v161)
                        if v161 == nil then
                            break
                        end
                        if v162:FindFirstChild("Humanoid") and (v162:FindFirstChild("HumanoidRootPart") and (v162.Humanoid.Health > 0 and v162.Name == SelectMonster)) then
                            repeat
                                game:GetService("RunService").Heartbeat:wait()
                                EquipTool(SelectWeapon)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v162.HumanoidRootPart.CFrame * Farm_Mode
                                v162.HumanoidRootPart.Anchored = true
                                MonsterPosition = v162.HumanoidRootPart.Position
                                MonsterName = v162.Name
                            until not AutoFarmSelectMonsterNoQuest or (not v162.Parent or v162.Humanoid.Health <= 0) or not game:GetService("Workspace").Monster.Boss:FindFirstChild(v162.Name)
                        end
                    end
                else
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                end
            end)
        end
    end
end)
local v163 = v4.Tab_2:addSection()
local v164 = v163:addMenu("#Third Sea")
v164:addButton("TP Craft Hearts NPC", function()
    local v165 = CFrame.new(6557.85498, 457.592377, - 3229.08643, 0.515242755, 2.47797516e-8, - 0.85704428, - 9.72245395e-9, 1, 2.30680364e-8, 0.85704428, - 3.55306451e-9, 0.515242755)
    TP(v165)
end)
v164:addToggle("Auto Kill Kraken", AutoAttackKraken, function(p166)
    AutoAttackKraken = p166
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if AutoAttackKraken and New_World then
                local v167 = CFrame.new(- 8055.90869, 34.0754128, 3221.49634, - 0.85278064, 6.42670415e-8, - 0.522269249, 8.00782303e-8, 1, - 7.70124498e-9, 0.522269249, - 4.83898717e-8, - 0.85278064)
                if game:GetService("Workspace").Monster.Boss:FindFirstChild("Tentacle") then
                    local v168, v169, v170 = pairs(game:GetService("Workspace").Monster.Boss:GetChildren())
                    while true do
                        local v171
                        v170, v171 = v168(v169, v170)
                        if v170 == nil then
                            break
                        end
                        if v171:FindFirstChild("Humanoid") and (v171:FindFirstChild("HumanoidRootPart") and (v171.Humanoid.Health > 0 and v171.Name == "Tentacle")) then
                            repeat
                                task.wait()
                                EquipTool(SelectWeapon)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v171.HumanoidRootPart.CFrame * CFrame.new(0, 0, DisFarm) * CFrame.Angles(math.rad(0), 0, 0)
                                v171.HumanoidRootPart.Anchored = true
                                MonsterPosition = v171.HumanoidRootPart.Position
                                MonsterName = v171.Name
                            until not AutoAttackKraken or (not v171.Parent or v171.Humanoid.Health <= 0) or not game:GetService("Workspace").Monster.Boss:FindFirstChild(v171.Name)
                        end
                    end
                else
                    TP(v167)
                end
            end
        end)
    end
end)
v164:addToggle("Go to 3rd Sea", Auto3rdSea, function(p172)
    Auto3rdSea = p172
end)
spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if Auto3rdSea and New_World then
                TP(CFrame.new(- 6125.42041, 16.7693558, 1804.85571, 0.137907699, 1.81405273e-8, - 0.990445077, - 5.29878754e-8, 1, 1.09376002e-8, 0.990445077, 5.09732025e-8, 0.137907699))
                Click()
                wait(0.5)
                local v173, v174, v175 = pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants())
                while true do
                    local v176
                    v175, v176 = v173(v174, v175)
                    if v175 == nil then
                        break
                    end
                    if v176.Name == "Dialogue" then
                        v176.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                        v176.Accept.Position = UDim2.new(- 2, 0, - 5, 0)
                        v176.Accept.ImageTransparency = 1
                        game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                    end
                end
            end
        end)
    end
end)
local v177 = v163:addMenu("#Quest Farm")
v177:addToggle("Auto New World", AutoNewWorld, function(p178)
    AutoNewWorld = p178
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if AutoNewWorld and First_World then
                local v179 = CFrame.new(2612.00073, 211.413452, - 1809.35864, 0.0310074687, 0.000249804929, 0.999519229, - 0.000369975111, 0.999999881, - 0.000238447508, - 0.999519229, - 0.000362403516, 0.0310075879)
                if game:GetService("Players").LocalPlayer.PlayerStats.SecondSeaProgression.Value ~= "Yes" then
                    if game.Players.LocalPlayer.PlayerStats.lvl.Value == 2250 or game.Players.LocalPlayer.PlayerStats.lvl.Value >= 2250 then
                        if game.Players.LocalPlayer.Character:FindFirstChild("Map") or game.Players.LocalPlayer.Backpack:FindFirstChild("Map") then
                            TP(v179)
                            Click()
                            wait(0.5)
                            local v180, v181, v182 = pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants())
                            while true do
                                local v183
                                v182, v183 = v180(v181, v182)
                                if v182 == nil then
                                    break
                                end
                                if v183.Name == "Dialogue" then
                                    v183.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                                    v183.Accept.Position = UDim2.new(- 2, 0, - 5, 0)
                                    v183.Accept.ImageTransparency = 1
                                    game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                                end
                            end
                        elseif game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible ~= false then
                            if game:GetService("Workspace").Monster.Boss:FindFirstChild("Seasoned Fishman [Lv. 2200]") then
                                local v184, v185, v186 = pairs(game:GetService("Workspace").Monster.Boss:GetChildren())
                                while true do
                                    local v187
                                    v186, v187 = v184(v185, v186)
                                    if v186 == nil then
                                        break
                                    end
                                    if v187:FindFirstChild("Humanoid") and (v187:FindFirstChild("HumanoidRootPart") and (v187.Humanoid.Health > 0 and v187.Name == "Seasoned Fishman [Lv. 2200]")) then
                                        repeat
                                            task.wait()
                                            EquipTool(SelectWeapon)
                                            TP(v187.HumanoidRootPart.CFrame * Farm_Mode)
                                            MonsterPosition = v187.HumanoidRootPart.Position
                                            MonsterName = v187.Name
                                        until v187.Humanoid.Health <= 0 or not AutoNewWorld or (game.Players.LocalPlayer.Character:FindFirstChild("Map") or game.Players.LocalPlayer.Backpack:FindFirstChild("Map"))
                                    end
                                end
                            elseif game:GetService("ReplicatedStorage").MOB:FindFirstChild("Seasoned Fishman [Lv. 2200]") then
                                TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Seasoned Fishman [Lv. 2200]").HumanoidRootPart.CFrame * Farm_Mode)
                            end
                        else
                            TP(v179)
                            Click()
                            wait(0.5)
                            local v188, v189, v190 = pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants())
                            while true do
                                local v191
                                v190, v191 = v188(v189, v190)
                                if v190 == nil then
                                    break
                                end
                                if v191.Name == "Dialogue" then
                                    v191.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                                    v191.Accept.Position = UDim2.new(- 2, 0, - 5, 0)
                                    v191.Accept.ImageTransparency = 1
                                    game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                                end
                            end
                        end
                    end
                else
                    TP(CFrame.new(- 2407.80908, 16.2715569, - 4360.92676, 0.596248031, - 9.03673936e-7, - 0.802800298, - 0.000309376366, 0.99999994, - 0.00023090269, 0.802800179, 0.000386042695, 0.596248031))
                    Click()
                    wait(0.5)
                    local v192, v193, v194 = pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants())
                    while true do
                        local v195
                        v194, v195 = v192(v193, v194)
                        if v194 == nil then
                            break
                        end
                        if v195.Name == "Dialogue" then
                            v195.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                            v195.Accept.Position = UDim2.new(- 2, 0, - 5, 0)
                            v195.Accept.ImageTransparency = 1
                            game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                        end
                    end
                end
            end
        end)
    end
end)
v177:addToggle("Auto Bigmom [MsMother Lv. 7500]", AutoBigmom, function(p196)
    AutoBigmom = p196
end)
spawn(function()
    while task.wait(0.1) do
        if AutoBigmom then
            if game.Workspace.Monster.Boss:FindFirstChild("MsMother [Lv. 7500]") then
                local v197, v198, v199 = pairs(game.Workspace.Monster.Boss:GetChildren())
                while true do
                    local v200
                    v199, v200 = v197(v198, v199)
                    if v199 == nil then
                        break
                    end
                    if v200:FindFirstChild("Humanoid") and (v200:FindFirstChild("HumanoidRootPart") and (v200.Humanoid.Health > 0 and v200.Name == "MsMother [Lv. 7500]")) then
                        repeat
                            task.wait()
                            EquipTool(SelectWeapon)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v200.HumanoidRootPart.CFrame * Farm_Mode
                            MonsterPosition = v200.HumanoidRootPart.Position
                            MonsterName = v200.Name
                        until not AutoBigmom or (not v200.Parent or v200.Humanoid.Health <= 0) or not game:GetService("Workspace").Monster.Boss:FindFirstChild(v200.Name)
                    end
                end
            else
                local v201 = game.Workspace.Island["D - Loaf Island"]:FindFirstChild("Ms Mother")
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v201.CFrame
            end
        end
    end
end)
v177:addToggle("Auto Oden [King Samurai Lv. 3500]", AutoOden, function(p202)
    AutoOden = p202
end)
spawn(function()
    while task.wait(0.1) do
        if AutoOden then
            if game.Workspace.Monster.Boss:FindFirstChild("King Samurai [Lv. 3500]") then
                local v203, v204, v205 = pairs(game.Workspace.Monster.Boss:GetChildren())
                while true do
                    local v206
                    v205, v206 = v203(v204, v205)
                    if v205 == nil then
                        break
                    end
                    if v206:FindFirstChild("Humanoid") and (v206:FindFirstChild("HumanoidRootPart") and (v206.Humanoid.Health > 0 and v206.Name == "King Samurai [Lv. 3500]")) then
                        repeat
                            task.wait()
                            EquipTool(SelectWeapon)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v206.HumanoidRootPart.CFrame * Farm_Mode
                            MonsterPosition = v206.HumanoidRootPart.Position
                            MonsterName = v206.Name
                        until not AutoBigmom or (not v206.Parent or v206.Humanoid.Health <= 0) or not game:GetService("Workspace").Monster.Boss:FindFirstChild(v206.Name)
                    end
                end
            else
                local v207 = game.Workspace.Island["A - Japan"]["King Samurai Spawn"]
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v207.CFrame
            end
        end
    end
end)
v177:addToggle("Auto Ghostship [Beta Tested]", AutoGhostship, function(p208)
    AutoGhostship = p208
end)
spawn(function()
    while task.wait(0.1) do
        if AutoGhostship then
            if game.Workspace.GhostMonster:FindFirstChild("Ghost Ship") then
                local v209, v210, v211 = pairs(game:GetService("Workspace").GhostMonster:GetChildren())
                while true do
                    local v212
                    v211, v212 = v209(v210, v211)
                    if v211 == nil then
                        break
                    end
                    if v212.Name == "Ghost Ship" and (v212:FindFirstChild("Humanoid") and (v212:FindFirstChild("HumanoidRootPart") and v212.Humanoid.Health > 0)) then
                        repeat
                            task.wait()
                            EquipTool(SelectWeapon)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v212.HumanoidRootPart.CFrame * Farm_Mode
                            MonsterPosition = v212.HumanoidRootPart.Position
                            MonsterName = v212.Name
                        until not AutoHydra or (not v212.Parent or v212.Humanoid.Health <= 0) or not game:GetService("Workspace").GhostMonster:FindFirstChild(v212.Name)
                    end
                end
            else
                local v213 = game.Workspace.GhostMonster:FindFirstChild("Ghost Ship")
                TP(v213.HumanoidRootPart.CFrame)
            end
        end
    end
end)
v177:addToggle("Auto Hydra Seaking [Beta Tested]", AutoHydra, function(p214)
    AutoHydra = p214
end)
spawn(function()
    while task.wait(0.1) do
        if AutoHydra then
            if game:GetService("Workspace").SeaMonster:FindFirstChild("SeaKing") then
                local v215, v216, v217 = pairs(game:GetService("Workspace").SeaMonster:GetChildren())
                while true do
                    local v218
                    v217, v218 = v215(v216, v217)
                    if v217 == nil then
                        break
                    end
                    if v218.Name == "SeaKing" and (v218:FindFirstChild("Humanoid") and (v218:FindFirstChild("HumanoidRootPart") and v218.Humanoid.Health > 0)) then
                        repeat
                            task.wait()
                            EquipTool(SelectWeapon)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v218.HumanoidRootPart.CFrame * Farm_Mode
                            MonsterPosition = v218.HumanoidRootPart.Position
                            MonsterName = v218.Name
                        until not AutoHydra or (not v218.Parent or v218.Humanoid.Health <= 0) or not game:GetService("Workspace").SeaMonster:FindFirstChild(v218.Name)
                    end
                end
            else
                local v219 = game:GetService("Workspace").SeaMonster:FindFirstChild("SeaKing")
                TP(v219.HumanoidRootPart.CFrame)
            end
        end
    end
end)
local v220 = v4.Tab_3:addSection():addMenu("#Raids")
v220:addDropdown("Select Weapon", RaidWeapon, {
    "Combat",
    "Sword",
    "Fruit Power"
}, function(p221)
    RaidWeapon = p221
end)
spawn(function()
    while wait() do
        local v222, v223, v224 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
        while true do
            local v225
            v224, v225 = v222(v223, v224)
            if v224 == nil then
                break
            end
            if v225.ToolTip == RaidWeapon then
                RaidWeapon = v225.Name
            end
        end
    end
end)
AutoFarmTypeRaid = "Above"
v220:addDropdown("Select Farm Type", AutoFarmTypeRaid, {
    "Above",
    "Bellow",
    "Behind"
}, function(p226)
    AutoFarmTypeRaid = p226
end)
spawn(function()
    while wait(0.1) do
        if AutoFarmTypeRaid ~= "Above" then
            if AutoFarmTypeRaid ~= "Bellow" then
                if AutoFarmTypeRaid == "Behind" then
                    Farm_Mode_Raid = CFrame.new(0, 0, DisFarmRaid) * CFrame.Angles(math.rad(0), 0, 0)
                end
            else
                Farm_Mode_Raid = CFrame.new(0, DisFarmRaid, 1) * CFrame.Angles(math.rad(90), 0, 0)
            end
        else
            Farm_Mode_Raid = CFrame.new(0, DisFarmRaid, - 1) * CFrame.Angles(math.rad(- 90), 0, 0)
        end
    end
end)
DisFarmRaid = 30
v220:addTextbox("Distance", DisFarmRaid, function(p227)
    DisFarmRaid = p227
end)
v220:addToggle("Auto Farm All Monster", _G.KillRaidMon, function(p228)
    _G.KillRaidMon = p228
end)
task.spawn(function()
    while task.wait() do
        if _G.KillRaidMon then
            pcall(function()
                local v229 = game.Players.localPlayer.Character
                local v230, v231, v232 = pairs(game:GetService("Workspace").MOB:GetChildren())
                while true do
                    local v233
                    v232, v233 = v230(v231, v232)
                    if v232 == nil then
                        break
                    end
                    if v233:IsA("Model") and (v233:FindFirstChild("Humanoid") and v233.Humanoid.Health > 0) then
                        v229.HumanoidRootPart.CFrame = v233.HumanoidRootPart.CFrame * Farm_Mode_Raid
                        EquipTool(RaidWeapon)
                        Haki()
                        AuraMonName = v233.Name
                        AuraMonPosition = v233.HumanoidRootPart.Position
                    end
                end
            end)
        end
    end
end)
v220:addToggle("Skill Z", SZ, function(p234)
    SZ = p234
end)
v220:addToggle("Skill X", SX, function(p235)
    SX = p235
end)
v220:addToggle("Skill C", SC, function(p236)
    SC = p236
end)
v220:addToggle("Skill V", SV, function(p237)
    SV = p237
end)
v220:addToggle("Skill E", SE, function(p238)
    SE = p238
end)
spawn(function()
    while task.wait() do
        if SZ then
            game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
            wait(0.1)
            game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
        end
        if SX then
            game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
            wait(0.1)
            game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
        end
        if SC then
            game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
            wait(0.1)
            game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
        end
        if SV then
            game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
            wait(0.1)
            game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
        end
        if SE then
            game:service("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
            wait(0.1)
            game:service("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
        end
    end
end)
v220:addButton("Teleport To Raid Entrance", function()
    if First_World then
        TP(CFrame.new(2525.18018, 103.666275, - 1933.06555, 0.0362357572, - 9.80570931e-8, 0.999343276, 6.61532908e-8, 1, 9.57228394e-8, - 0.999343276, 6.26412557e-8, 0.0362357572))
    elseif New_World then
        TP(CFrame.new(- 4587.56152, 223.112534, - 70.8032455, 0.827522099, - 9.76606795e-10, 0.561433136, 3.39539374e-9, 1, - 3.26513794e-9, - 0.561433136, 4.60826044e-9, 0.827522099))
    elseif Third_World then
        TP(CFrame.new(2060.24097, 53.1480598, 815.068359, 0.999235451, 3.10308723e-10, 0.0390959792, 2.40261387e-11, 1, - 8.5511731e-9, - 0.0390959792, 8.54557491e-9, 0.999235451))
    end
end)
local v239 = v4.Tab_3:addSection():addMenu("#Combats")
v239:addDropdown("Select Weapon", CombatWeapon, {
    "Combat",
    "Sword",
    "Fruit Power"
}, function(p240)
    CombatWeapon = p240
end)
spawn(function()
    while wait() do
        local v241, v242, v243 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
        while true do
            local v244
            v243, v244 = v241(v242, v243)
            if v243 == nil then
                break
            end
            if v244.ToolTip == CombatWeapon then
                CombatWeapon = v244.Name
            end
        end
    end
end)
AutoFarmTypeCombat = "Above"
v239:addDropdown("Select Farm Type", AutoFarmTypeCombat, {
    "Above",
    "Bellow",
    "Behind"
}, function(p245)
    AutoFarmTypeCombat = p245
end)
spawn(function()
    while wait(0.1) do
        if AutoFarmTypeCombat ~= "Above" then
            if AutoFarmTypeCombat ~= "Bellow" then
                if AutoFarmTypeCombat == "Behind" then
                    Farm_Mode_Combat = CFrame.new(0, 0, DisFarmCombat) * CFrame.Angles(math.rad(0), 0, 0)
                end
            else
                Farm_Mode_Combat = CFrame.new(0, DisFarmCombat, 1) * CFrame.Angles(math.rad(90), 0, 0)
            end
        else
            Farm_Mode_Combat = CFrame.new(0, DisFarmCombat, - 1) * CFrame.Angles(math.rad(- 90), 0, 0)
        end
    end
end)
DisFarmCombat = 30
v239:addTextbox("Distance", DisFarmCombat, function(p246)
    DisFarmCombat = p246
end)
PlayerName = {}
local v247, v248, v249 = pairs(game.Players:GetChildren())
while true do
    local v250
    v249, v250 = v247(v248, v249)
    if v249 == nil then
        break
    end
    if v250.Name ~= game.Players.LocalPlayer.Name then
        table.insert(PlayerName, v250.Name)
    end
end
local vu252 = v239:addDropdown("Select Players", _G.SelectPly, PlayerName, function(p251)
    _G.SelectPly = p251
end)
v239:addButton("Refresh Player", function()
    newPlayerName = {}
    local v253, v254, v255 = pairs(game.Players:GetChildren())
    while true do
        local v256
        v255, v256 = v253(v254, v255)
        if v255 == nil then
            break
        end
        if v256.Name ~= game.Players.LocalPlayer.Name then
            table.insert(newPlayerName, v256.Name)
        end
    end
    vu252:Clear()
    vu252:Refresh(newPlayerName)
end)
v239:addToggle("Spectate Player", Spectate, function(p257)
    Spectate = p257
    local v258 = game.Players.LocalPlayer.Character.Humanoid
    local v259 = game.Players:FindFirstChild(_G.SelectPly)
    repeat
        task.wait()
        game.Workspace.Camera.CameraSubject = v259.Character.Humanoid
    until Spectate == false
    game.Workspace.Camera.CameraSubject = v258
end)
v239:addToggle("Auto Kill Player", _G.AutoKillply, function(p260)
    _G.AutoKillply = p260
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoKillply and (game.Players:FindFirstChild(_G.SelectPly) and game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health > 0) then
                repeat
                    task.wait()
                    EquipTool(CombatWeapon)
                    TP(game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * Farm_Mode_Combat)
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                until game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health <= 0 or not _G.AutoKillply or not game.Players:FindFirstChild(_G.SelectPly)
            end
        end)
    end
end)
local v261 = v4.Tab_4:addSection()
local v262 = v261:addMenu("#Devil Shop")
local v263 = game:GetService("ReplicatedStorage").Chest.Remotes.Functions.GetDFShop:InvokeServer()
local v264, v265, v266 = pairs(v263)
local v267 = {}
while true do
    local v268
    v266, v268 = v264(v265, v266)
    if v266 == nil then
        break
    end
    table.insert(v267, v266)
end
local vu269 = v262:addLabel("")
spawn(function()
    while wait() do
        vu269:Refresh("Shop Refresh in : " .. tostring(game:GetService("ReplicatedStorage").TimeLeft.Value))
    end
end)
local vu271 = v262:addDropdown("Select DevilFruit Shop", DevilFruitSelected, v267, function(p270)
    DevilFruitSelected = p270
end)
v262:addButton("Refresh Indeks DevilFruit Shop", function()
    local v272, v273, v274 = pairs(game:GetService("ReplicatedStorage").Remotes.Functions.GetDFShop:InvokeServer())
    local v275 = {}
    while true do
        local v276
        v274, v276 = v272(v273, v274)
        if v274 == nil then
            break
        end
        table.insert(v275, v274)
    end
    vu271:Clear()
    vu271:Refresh(v275)
end)
v262:addButton("Buy Devil Fruit Shop List", function()
    local v277 = {
        DevilFruitSelected,
        true
    }
    game:GetService("ReplicatedStorage").Remotes.Functions.dfbeli:InvokeServer(unpack(v277))
end)
v262:addButton("Teleport To Devil Fruit Shop", function()
    if First_World then
        TP(CFrame.new(- 2121.1936, 50.5804634, - 4414.01221, - 0.802005529, 8.66488463e-8, - 0.597316563, 1.08040098e-7, 1, 1.47566231e-13, 0.597316563, - 6.45340208e-8, - 0.802005529))
    elseif New_World then
        TP(CFrame.new(- 3781, 61, 245))
    elseif Third_World then
        TP(CFrame.new(2152.42163, 78.8271332, 823.024353, - 0.0636807606, - 1.11927037e-7, - 0.997970343, - 7.70030582e-8, 1, - 1.07241092e-7, 0.997970343, 7.00175775e-8, - 0.0636807606))
    end
end)
local v278 = v261:addMenu("#Random Devil Shop")
v278:addDropdown("Select Key", KeySelected, {
    "Copper Key",
    "Iron Key",
    "Gold Key"
}, function(p279)
    KeySelected = p279
end)
ValueofKey = 1
v278:addTextbox("Key Value", ValueofKey, function(p280)
    ValueofKey = p280
end)
v278:addButton("Buy Key", function()
    local v281 = {
        KeySelected,
        tonumber(ValueofKey)
    }
    game:GetService("ReplicatedStorage").Chest.Remotes.Functions.BuyKey:InvokeServer(unpack(v281))
end)
v278:addButton("Use 1 Key", function()
    local v282 = {
        KeySelected,
        "Open1"
    }
    game:GetService("ReplicatedStorage").Chest.Remotes.Functions.UseKey:InvokeServer(unpack(v282))
end)
v278:addButton("Use 10 Key", function()
    local v283 = {
        KeySelected,
        "Open10"
    }
    game:GetService("ReplicatedStorage").Chest.Remotes.Functions.UseKey:InvokeServer(unpack(v283))
end)
v278:addToggle("Bring All Devil Fruit", BringDevilFruit, function(p284)
    BringDevilFruit = p284
end)
spawn(function()
    while task.wait() do
        if BringDevilFruit then
            pcall(function()
                local v285 = game.Players.LocalPlayer.Character.HumanoidRootPart
                local v286, v287, v288 = pairs(game.Workspace:GetChildren())
                while true do
                    local v289
                    v288, v289 = v286(v287, v288)
                    if v288 == nil then
                        break
                    end
                    if string.find(v289.Name, "Fruit") and v289:IsA("Tool") then
                        v289.Handle.CanCollide = false
                        v289.Handle.CFrame = v285.CFrame
                        wait(0.2)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v289.Handle, 0)
                    end
                end
            end)
        end
    end
end)
local v290 = v4.Tab_4:addSection()
local v291 = v290:addMenu("#Other Shop")
v291:addButton("Water Style Shop", function()
    if New_World then
        TP(CFrame.new(- 4831.19971, 57.822052, 153.415283, - 0.414802402, - 5.48522792e-8, - 0.909911513, - 5.58345725e-8, 1, - 3.48297213e-8, 0.909911513, 3.63570685e-8, - 0.414802402))
    elseif Third_World then
        TP(CFrame.new(1450.51282, 350.189728, - 1466.57898, - 0.608404934, - 2.94144513e-8, 0.793626785, - 6.69786928e-8, 1, - 1.42834331e-8, - 0.793626785, - 6.18461939e-8, - 0.608404934))
    end
end)
v291:addButton("Dragon Claw Shop", function()
    if New_World then
        TP(CFrame.new(- 4603.89355, 337.312164, 599.383667, - 0.962977529, - 4.1851969e-8, - 0.269581646, - 5.81633124e-8, 1, 5.25183914e-8, 0.269581646, 6.625379e-8, - 0.962977529))
    elseif Third_World then
        TP(CFrame.new(1450.51282, 350.189728, - 1466.57898, - 0.608404934, - 2.94144513e-8, 0.793626785, - 6.69786928e-8, 1, - 1.42834331e-8, - 0.793626785, - 6.18461939e-8, - 0.608404934))
    end
end)
v291:addButton("Black Leg Shop", function()
    if First_World then
        TP(CFrame.new(- 4206.44971, 109.067413, - 2932.71362, 0.979351342, 6.7444752e-9, - 0.202165633, - 1.24095703e-8, 1, - 2.67545666e-8, 0.202165633, 2.87109092e-8, 0.979351342))
    elseif New_World then
        TP(CFrame.new(- 4918.97363, 60.340538, 55.1117287, 0.950969398, 1.60718479e-8, 0.309284925, - 1.49673909e-8, 1, - 5.9437637e-9, - 0.309284925, 1.02314912e-9, 0.950969398))
    elseif Third_World then
        TP(CFrame.new(1450.51282, 350.189728, - 1466.57898, - 0.608404934, - 2.94144513e-8, 0.793626785, - 6.69786928e-8, 1, - 1.42834331e-8, - 0.793626785, - 6.18461939e-8, - 0.608404934))
    end
end)
v291:addButton("Electro Shop", function()
    if Third_World then
        TP(CFrame.new(1450.51282, 350.189728, - 1466.57898, - 0.608404934, - 2.94144513e-8, 0.793626785, - 6.69786928e-8, 1, - 1.42834331e-8, - 0.793626785, - 6.18461939e-8, - 0.608404934))
    end
end)
v291:addButton("Sky Jump", function()
    if First_World then
        TP(CFrame.new(- 2192.19214, 48.7368965, - 4475.83301, - 0.543718636, - 7.02707084e-8, - 0.839267552, - 9.75050725e-8, 1, - 2.05600514e-8, 0.839267552, 7.06539609e-8, - 0.543718636))
    elseif New_World then
        TP(CFrame.new(- 3730.19189, 57.8862038, 204.094666, 0.984767377, - 1.1842487e-8, 0.173876956, 7.55866214e-9, 1, 2.5299288e-8, - 0.173876956, - 2.3599636e-8, 0.984767377))
    end
end)
v291:addButton("Reroll Race", function()
    if First_World then
        TP(CFrame.new(- 2074.55688, 76.3055191, - 4497.41357, 0.6812042, - 1.16788412e-9, - 0.732093453, 3.87939153e-10, 1, - 1.23429367e-9, 0.732093453, 5.5679833e-10, 0.6812042))
    elseif New_World then
        TP(CFrame.new(- 4949.18311, 57.822052, 191.524734, - 0.833928227, 3.89729315e-8, 0.551872909, - 1.38614071e-8, 1, - 9.15651981e-8, - 0.551872909, - 8.40085335e-8, - 0.833928227))
    elseif Third_World then
        TP(CFrame.new(2027.91907, 71.6016464, 1102.93164, - 0.519827127, 2.75796008e-8, 0.854271472, - 1.84828295e-8, 1, - 4.3531216e-8, - 0.854271472, - 3.84180616e-8, - 0.519827127))
    end
end)
v291:addButton("Reset Stat", function()
    if First_World then
        TP(CFrame.new(- 2072.95557, 48.7796097, - 4405.29053, 0.461064994, - 2.14056026e-8, 0.887366354, - 5.51042501e-9, 1, 2.69857718e-8, - 0.887366354, - 1.73319599e-8, 0.461064994))
    elseif New_World then
        TP(CFrame.new(- 4843.9707, 58.0297661, 70.0297165, 0.288221925, 5.95155969e-9, 0.957563639, 9.68969527e-9, 1, - 9.13186593e-9, - 0.957563639, 1.19105037e-8, 0.288221925))
    elseif Third_World then
        TP(CFrame.new(2084.32959, 71.6016464, 1097.521, - 0.995686948, 1.40608325e-8, 0.0927765891, 5.94314598e-9, 1, - 8.77734365e-8, - 0.0927765891, - 8.68434782e-8, - 0.995686948))
    end
end)
v291:addButton("Cybrog Shop", function()
    if First_World then
        TP(CFrame.new(- 264.232269, 124.836227, - 1400.2168, - 0.385267437, 7.39628803e-9, - 0.922804952, 1.14298544e-8, 1, 3.24308713e-9, 0.922804952, - 9.29807076e-9, - 0.385267437))
    elseif New_World then
        TP(CFrame.new(- 4969.50391, 57.772007, 165.519562, 0.456807017, 2.94110976e-8, 0.889565825, - 7.4581024e-8, 1, 5.23630428e-9, - 0.889565825, - 6.87367105e-8, 0.456807017))
    end
end)
local v292 = v290:addMenu("#Sword Shop")
v292:addButton("Sword Shop 1", function()
    if First_World then
        TP(CFrame.new(- 2138.3147, 49.2573967, - 4437.98291, - 0.915438652, 4.0901444e-8, 0.402457505, 6.5344814e-8, 1, 4.70055248e-8, - 0.402457505, 6.93291895e-8, - 0.915438652))
    end
end)
v292:addButton("Sword Shop 2", function()
    if First_World then
        TP(CFrame.new(1672.07019, 11.8793468, 686.284363, 0.967680395, 6.7435808e-9, - 0.252179772, - 5.65162894e-9, 1, 5.05437114e-9, 0.252179772, - 3.46578943e-9, 0.967680395))
    end
end)
v292:addButton("Sword Shop 3", function()
    if First_World then
        TP(CFrame.new(2524.99585, 310.606262, - 1582.39551, 0.805992365, 8.32587119e-8, 0.591925919, - 1.05566322e-7, 1, 3.08642667e-9, - 0.591925919, - 6.4975076e-8, 0.805992365))
    end
end)
local v293 = v290:addMenu("#Abilities Shop")
v293:addButton("Soru Shop", function()
    if First_World then
        TP(CFrame.new(- 2502.61523, 41.6567039, - 2731.97021, 0.557856202, - 8.8662965e-8, 0.829937637, - 6.38351283e-9, 1, 1.11121665e-7, - 0.829937637, - 6.72878286e-8, 0.557856202))
    end
end)
v293:addButton("Buso Shop", function()
    if First_World then
        TP(CFrame.new(1658.59546, 14.6423578, 736.61969, 0.90738374, - 4.2174328e-8, 0.420303136, 1.94272456e-8, 1, 5.84015645e-8, - 0.420303136, - 4.48272992e-8, 0.90738374))
    end
end)
v293:addButton("Ken Shop", function()
    if First_World then
        TP(CFrame.new(- 4129.93604, 388.197388, 1147.50427, - 0.812140524, 3.079343e-8, - 0.583461881, 2.34472832e-8, 1, 2.01400319e-8, 0.583461881, 2.67594102e-9, - 0.812140524))
    end
end)
local v294 = v4.Tab_5:addSection():addMenu("#Point Stats")
local vu295 = v294:addLabel("")
spawn(function()
    while task.wait() do
        vu295:Refresh("Your Points is : " .. tostring(game:GetService("Players").LocalPlayer.PlayerStats.Points.Value))
    end
end)
SetPoint = 0
v294:addTextbox("Set Point Value", SetPoint, function(p296)
    SetPoint = p296
end)
v294:addToggle("Melee", MeleePoint, function(p297)
    MeleePoint = p297
end)
v294:addToggle("Defense", DefensePoint, function(p298)
    DefensePoint = p298
end)
v294:addToggle("Sword", SwordPoint, function(p299)
    SwordPoint = p299
end)
v294:addToggle("Devil Fruit", PowerFruitPoint, function(p300)
    PowerFruitPoint = p300
end)
spawn(function()
    while task.wait() do
        if MeleePoint then
            game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame.StatsFrame.RemoteEvent:FireServer("Melee", tonumber(SetPoint))
        end
        if DefensePoint then
            game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame.StatsFrame.RemoteEvent:FireServer("Defense", tonumber(SetPoint))
        end
        if SwordPoint then
            game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame.StatsFrame.RemoteEvent:FireServer("Sword", tonumber(SetPoint))
        end
        if PowerFruitPoint then
            game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame.StatsFrame.RemoteEvent:FireServer("Fruit", tonumber(SetPoint))
        end
    end
end)
local v301 = v4.Tab_5:addSection()
local v302 = v301:addMenu("#World Teleport")
v302:addToggle("TP To First World", tptofirst, function(p303)
    tptofirst = p303
end)
spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if tptofirst then
                if New_World then
                    TP(CFrame.new(- 3337.68384, 16.7377586, 253.360123, - 0.0838643461, - 1.06176607e-7, 0.996477187, - 9.92035609e-9, 1, 1.05717064e-7, - 0.996477187, - 1.01951547e-9, - 0.0838643461))
                    Click()
                    wait(0.5)
                    local v304, v305, v306 = pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants())
                    while true do
                        local v307
                        v306, v307 = v304(v305, v306)
                        if v306 == nil then
                            break
                        end
                        if v307.Name == "Dialogue" then
                            v307.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                            v307.Accept.Position = UDim2.new(- 2, 0, - 5, 0)
                            v307.Accept.ImageTransparency = 1
                            game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                        end
                    end
                elseif Third_World then
                    TP(CFrame.new(2136.01538, 36.2111511, 1392.10986, 0.965848863, - 4.44797888e-6, 0.2591061, 0.0000166980153, 1, - 0.0000450772131, - 0.2591061, 0.0000478643306, 0.965848863))
                    Click()
                    wait(0.5)
                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("The Squid") then
                        game:GetService("Players").LocalPlayer.PlayerGui["The Squid"].Dialogue.FirstSea.Size = UDim2.new(0, 5000, 0, 2000)
                        game:GetService("Players").LocalPlayer.PlayerGui["The Squid"].Dialogue.FirstSea.Position = UDim2.new(- 2, 0, - 5, 0)
                        game:GetService("Players").LocalPlayer.PlayerGui["The Squid"].Dialogue.FirstSea.ImageTransparency = 1
                        wait(0.3)
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        game:GetService("VirtualUser"):Button1Up(Vector2.new(1280, 672))
                    end
                end
            end
        end)
    end
end)
v302:addToggle("TP To Second World", tptonew, function(p308)
    tptonew = p308
end)
spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if tptonew then
                if First_World then
                    TP(CFrame.new(- 2406.98389, 16.7625732, - 4361.74658, 0.736318648, - 7.92259272e-8, - 0.676634967, 4.32970175e-8, 1, - 6.99720388e-8, 0.676634967, 2.2225441e-8, 0.736318648))
                    Click()
                    wait(0.5)
                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Elite Pirate") then
                        game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue.Accept.Size = UDim2.new(0, 5000, 0, 2000)
                        game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue.Accept.Position = UDim2.new(- 2, 0, - 5, 0)
                        game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue.Accept.ImageTransparency = 1
                        wait(0.3)
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        game:GetService("VirtualUser"):Button1Up(Vector2.new(1280, 672))
                    end
                elseif Third_World then
                    TP(CFrame.new(2136.01538, 36.2111511, 1392.10986, 0.965848863, - 4.44797888e-6, 0.2591061, 0.0000166980153, 1, - 0.0000450772131, - 0.2591061, 0.0000478643306, 0.965848863))
                    Click()
                    wait(0.5)
                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("The Squid") then
                        game:GetService("Players").LocalPlayer.PlayerGui["The Squid"].Dialogue.Accept.Size = UDim2.new(0, 5000, 0, 2000)
                        game:GetService("Players").LocalPlayer.PlayerGui["The Squid"].Dialogue.Accept.Position = UDim2.new(- 2, 0, - 5, 0)
                        game:GetService("Players").LocalPlayer.PlayerGui["The Squid"].Dialogue.Accept.ImageTransparency = 1
                        wait(0.3)
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        game:GetService("VirtualUser"):Button1Up(Vector2.new(1280, 672))
                    end
                end
            end
        end)
    end
end)
v302:addToggle("TP To Third World", tptothird, function(p309)
    tptothird = p309
end)
spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if tptothird then
                if First_World then
                    TP(CFrame.new(- 2406.98389, 16.7625732, - 4361.74658, 0.736318648, - 7.92259272e-8, - 0.676634967, 4.32970175e-8, 1, - 6.99720388e-8, 0.676634967, 2.2225441e-8, 0.736318648))
                    Click()
                    wait(0.5)
                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Elite Pirate") then
                        game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue.ThirdSea.Size = UDim2.new(0, 5000, 0, 2000)
                        game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue.ThirdSea.Position = UDim2.new(- 2, 0, - 5, 0)
                        game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue.ThirdSea.ImageTransparency = 1
                        wait(0.3)
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        game:GetService("VirtualUser"):Button1Up(Vector2.new(1280, 672))
                    end
                elseif New_World then
                    TP(CFrame.new(- 6125.41455, 16.769352, 1804.97058, 0.174821615, 9.25885502e-8, - 0.984600127, 6.04198958e-9, 1, 9.51094989e-8, 0.984600127, - 2.25761401e-8, 0.174821615))
                    Click()
                    wait(0.5)
                    local v310, v311, v312 = pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants())
                    while true do
                        local v313
                        v312, v313 = v310(v311, v312)
                        if v312 == nil then
                            break
                        end
                        if v313.Name == "Dialogue" then
                            v313.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                            v313.Accept.Position = UDim2.new(- 2, 0, - 5, 0)
                            v313.Accept.ImageTransparency = 1
                            game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                        end
                    end
                end
            end
        end)
    end
end)
local v314 = v301:addMenu("#Island Teleport")
if First_World then
    IslandList = {
        "Town",
        "Pirate Island",
        "Soldier Town",
        "Shark Island",
        "Cheft Ship",
        "Snow Island",
        "Desert Island",
        "Skyland",
        "Bubbleland",
        "Lobby Island",
        "Zombie Island",
        "War Island",
        "Fishland"
    }
elseif New_World then
    IslandList = {
        "Japan",
        "Skull Island",
        "Desert",
        "Loaf Island",
        "Shred Endangering",
        "Soldier Head Quater",
        "Skull Pirate Island",
        "Fiore",
        "Christmas Island 2"
    }
elseif Third_World then
    IslandList = {
        "The Unearthly"
    }
end
v314:addDropdown("Select Island", SelectedIsland, IslandList, function(p315)
    SelectedIsland = p315
end)
v314:addButton("TP To Island Selected", function()
    if First_World then
        if SelectedIsland ~= "Town" then
            if SelectedIsland ~= "Pirate Island" then
                if SelectedIsland ~= "Soldier Town" then
                    if SelectedIsland ~= "Shark Island" then
                        if SelectedIsland ~= "Cheft Ship" then
                            if SelectedIsland ~= "Snow Island" then
                                if SelectedIsland ~= "Desert Island" then
                                    if SelectedIsland ~= "Skyland" then
                                        if SelectedIsland ~= "Bubbleland" then
                                            if SelectedIsland ~= "Lobby Island" then
                                                if SelectedIsland ~= "Zombie Island" then
                                                    if SelectedIsland ~= "War Island" then
                                                        if SelectedIsland == "Fishland" then
                                                            TP(CFrame.new(- 1711.87207, 59.8886757, 6286.98682, - 0.474394768, - 9.2547026e-8, - 0.880312204, - 7.04004606e-8, 1, - 6.7191408e-8, 0.880312204, 3.00991339e-8, - 0.474394768))
                                                        end
                                                    else
                                                        TP(CFrame.new(2338.43286, 50.1122551, - 2108.44824, - 0.225708127, - 5.97396195e-8, 0.974194944, 1.54544222e-9, 1, 6.16800904e-8, - 0.974194944, 1.54272612e-8, - 0.225708127))
                                                    end
                                                else
                                                    TP(CFrame.new(- 2748.9624, 39.6231308, 4111.93994, - 0.732085228, - 4.1927084e-8, 0.681213081, 3.69794968e-8, 1, 1.01288762e-7, - 0.681213081, 9.93429197e-8, - 0.732085228))
                                                end
                                            else
                                                TP(CFrame.new(- 1161.44763, 9.55576324, 2857.35425, - 0.996191859, 0, - 0.0871884301, 0, 1, 0, 0.0871884301, 0, - 0.996191859))
                                            end
                                        else
                                            TP(CFrame.new(1924.84717, 18.8527756, 672.131226, 0.745370269, 0, - 0.666650653, 0, 1, 0, 0.666650653, 0, 0.745370269))
                                        end
                                    else
                                        TP(CFrame.new(- 4202.37988, 386.984802, 1184.66846, 0.544106424, 1.48959796e-8, 0.839016199, 4.65113531e-10, 1, - 1.80557311e-8, - 0.839016199, 1.02144773e-8, 0.544106424))
                                    end
                                else
                                    TP(CFrame.new(- 2968.4834, 13.3524494, - 855.25769, 0.575817585, - 7.32945864e-8, - 0.817578197, - 1.93911731e-8, 1, - 1.03305553e-7, 0.817578197, 7.53389529e-8, 0.575817585))
                                end
                            else
                                TP(CFrame.new(- 5486.97266, - 18.2214508, - 1378.75208, 0.173624337, 0, - 0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337))
                            end
                        else
                            TP(CFrame.new(- 4130.07031, 17.5725555, - 3066.50098, 0.874531388, 1.24401325e-8, - 0.48496893, - 2.23141345e-8, 1, - 1.45870782e-8, 0.48496893, 2.35785205e-8, 0.874531388))
                        end
                    else
                        TP(CFrame.new(- 648.874207, 10.9532909, - 1451.1272, - 0.958512425, - 3.86548002e-8, 0.28505078, - 2.42516833e-8, 1, 5.40579528e-8, - 0.28505078, 4.49022579e-8, - 0.958512425))
                    end
                else
                    TP(CFrame.new(- 2473.00391, 65.2111664, - 2647.75806, 0.396801293, 0.000239091998, 0.917904556, - 0.0000494664855, 0.99999994, - 0.000239091998, - 0.917904556, 0.0000494664855, 0.396801293))
                end
            else
                TP(CFrame.new(- 424.285919, 65.4002457, - 3490.33789, 0.848060429, 0, 0.529899538, 0, 1, 0, - 0.529899538, 0, 0.848060429))
            end
        else
            TP(CFrame.new(- 2260.14893, 12.9090347, - 4416.52197, - 0.789979458, 0, - 0.613133252, 0, 1, 0, 0.613133252, 0, - 0.789979458))
        end
    elseif New_World then
        if SelectedIsland ~= "Japan" then
            if SelectedIsland ~= "Skull Island" then
                if SelectedIsland ~= "Desert" then
                    if SelectedIsland ~= "Loaf Island" then
                        if SelectedIsland ~= "Shred Endangering" then
                            if SelectedIsland ~= "Soldier Head Quater" then
                                if SelectedIsland ~= "Skull Pirate Island" then
                                    if SelectedIsland ~= "Fiore" then
                                        if SelectedIsland == "Christmas Island 2" then
                                            TP(CFrame.new(- 1478.29321, 32.5745697, 3684.4856, - 0.629995108, - 1.79796746e-8, - 0.776599109, 3.45356277e-8, 1, - 5.1167909e-8, 0.776599109, - 5.90558713e-8, - 0.629995108))
                                        end
                                    else
                                        TP(CFrame.new(6615.63232, 419.649658, - 3119.8064, - 0.93089956, 4.11731378e-8, 0.365275204, 3.28177698e-8, 1, - 2.90824254e-8, - 0.365275204, - 1.50853001e-8, - 0.93089956))
                                    end
                                else
                                    TP(CFrame.new(- 9206.125, 68.7645645, - 5118.07764, 0.75056684, - 5.1875805e-8, 0.660794556, - 2.50228016e-8, 1, 1.06927466e-7, - 0.660794556, - 9.67911404e-8, 0.75056684))
                                end
                            else
                                TP(CFrame.new(- 9597.68848, 38.5504074, 856.945251, - 0.772121608, - 1.63413425e-8, - 0.635474801, 3.01301952e-8, 1, - 6.23242968e-8, 0.635474801, - 6.7268914e-8, - 0.772121608))
                            end
                        else
                            TP(CFrame.new(- 236.558838, 87.9501038, - 2629.58911, 0.952183843, - 2.65457931e-8, 0.305525631, 1.47634855e-8, 1, 4.08746104e-8, - 0.305525631, - 3.44095206e-8, 0.952183843))
                        end
                    else
                        TP(CFrame.new(- 505.924927, 176.478378, 8565.50684, 0.76352632, - 8.47754933e-9, 0.645776689, 3.57045371e-9, 1, 8.90619578e-9, - 0.645776689, - 4.49439908e-9, 0.76352632))
                    end
                else
                    TP(CFrame.new(1140.94678, 14.8728094, 861.088989, 0.747513652, 5.99622894e-8, 0.66424644, - 1.64314784e-8, 1, - 7.1779894e-8, - 0.66424644, 4.27418989e-8, 0.747513652))
                end
            else
                TP(CFrame.new(- 6112.42334, 58.2312317, 6959.77588, - 0.891121864, - 2.23682033e-8, - 0.453764111, 2.32094055e-9, 1, - 5.38527516e-8, 0.453764111, - 4.90425229e-8, - 0.891121864))
            end
        else
            TP(CFrame.new(- 5228.43213, 57.7720108, 768.540405, 0.811916828, 4.5584736e-9, - 0.583773136, - 2.60039767e-9, 1, 4.19198276e-9, 0.583773136, - 1.88549909e-9, 0.811916828))
        end
    elseif Third_World and SelectedIsland == "The Unearthly" then
        TP(CFrame.new(2150.1272, 29.8852539, - 56.2331543, 1, 0, 0, 0, 1, 0, 0, 0, 1))
    end
end)
local v316 = v301:addMenu("#Npc Teleport")
local v317, v318, v319 = pairs(game:GetService("Workspace").AllNPC:GetChildren())
local v320 = {}
while true do
    local v321
    v319, v321 = v317(v318, v319)
    if v319 == nil then
        break
    end
    table.insert(v320, v321.Name)
end
local vu323 = v316:addDropdown("Select NPC", SelectedNpc, v320, function(p322)
    SelectedNpc = p322
end)
v316:addButton("Teleport To NPC", function()
    local v324, v325, v326 = pairs(game:GetService("Workspace").AllNPC:GetChildren())
    while true do
        local v327
        v326, v327 = v324(v325, v326)
        if v326 == nil then
            break
        end
        if SelectedNpc == v327.Name then
            TP(v327.CFrame)
        end
    end
end)
v316:addButton("Refresh Npc", function()
    local v328, v329, v330 = pairs(game:GetService("Workspace").AllNPC:GetChildren())
    local v331 = {}
    while true do
        local v332
        v330, v332 = v328(v329, v330)
        if v330 == nil then
            break
        end
        table.insert(v331, v332.Name)
    end
    vu323:Clear()
    vu323:Refresh(v331)
end)
local v333 = v4.Tab_6:addSection():addMenu("#Left Misc")
function fly()
    local v334 = game.Players.LocalPlayer:GetMouse()
    localplayer = game.Players.LocalPlayer
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local vu335 = game.Players.LocalPlayer.Character.HumanoidRootPart
    local vu336 = 25
    local vu337 = {
        a = false,
        d = false,
        w = false,
        s = false
    }
    local vu338 = nil
    local vu339 = nil
    local function v343()
        local v340 = Instance.new("BodyPosition", vu335)
        local v341 = Instance.new("BodyGyro", vu335)
        v340.Name = "EPIXPOS"
        v340.maxForce = Vector3.new(math.huge, math.huge, math.huge)
        v340.position = vu335.Position
        v341.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
        v341.CFrame = vu335.CFrame
        while true do
            wait()
            localplayer.Character.Humanoid.PlatformStand = true
            local v342 = v341.CFrame - v341.CFrame.p + v340.position
            if not (vu337.w or (vu337.s or (vu337.a or vu337.d))) then
                speed = 1
            end
            if vu337.w then
                v342 = v342 + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed = speed + vu336
            end
            if vu337.s then
                v342 = v342 - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed = speed + vu336
            end
            if vu337.d then
                v342 = v342 * CFrame.new(speed, 0, 0)
                speed = speed + vu336
            end
            if vu337.a then
                v342 = v342 * CFrame.new(- speed, 0, 0)
                speed = speed + vu336
            end
            if vu336 < speed then
                speed = vu336
            end
            v340.position = v342.p
            if vu337.w then
                v341.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(- math.rad(speed * 15), 0, 0)
            elseif vu337.s then
                v341.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(speed * 15), 0, 0)
            else
                v341.CFrame = workspace.CurrentCamera.CoordinateFrame
            end
            if not Fly then
                if v341 then
                    v341:Destroy()
                end
                if v340 then
                    v340:Destroy()
                end
                flying = false
                localplayer.Character.Humanoid.PlatformStand = false
                speed = 0
                return
            end
        end
    end
    vu338 = v334.KeyDown:connect(function(p344)
        if vu335 and vu335.Parent then
            if p344 == "w" then
                vu337.w = true
            elseif p344 == "s" then
                vu337.s = true
            elseif p344 == "a" then
                vu337.a = true
            elseif p344 == "d" then
                vu337.d = true
            end
        else
            flying = false
            vu338:disconnect()
            vu339:disconnect()
        end
    end)
    vu339 = v334.KeyUp:connect(function(p345)
        if p345 == "w" then
            vu337.w = false
        elseif p345 == "s" then
            vu337.s = false
        elseif p345 == "a" then
            vu337.a = false
        elseif p345 == "d" then
            vu337.d = false
        end
    end)
    v343()
end
v333:addToggle("Inf Geppo", InfGeppo, function(p346)
    InfGeppo = p346
end)
spawn(function()
    while wait() do
        local v347 = game.Players.LocalPlayer.Backpack.GeppoNew.cds.Value
        if InfGeppo ~= true then
            if InfGeppo == false then
                game.Players.LocalPlayer.Backpack.GeppoNew.cds.Value = v347
            end
        else
            game.Players.LocalPlayer.Backpack.GeppoNew.cds.Value = 1e18
        end
    end
end)
v333:addToggle("Fly", Flys, function(p348)
    Flys = p348
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
v333:addToggle("No Clip", _G.NoClip, function(p349)
    _G.NoClip = p349
end)
local v350 = v4.Tab_6:addSection():addMenu("#Right Misc")
Number = math.random(1, 1000000)
function FindPlayer()
    local v351, v352, v353 = pairs(game:GetService("Players"):GetChildren())
    while true do
        local vu354
        v353, vu354 = v351(v352, v353)
        if v353 == nil then
            break
        end
        pcall(function()
            if vu354.Character then
                if PlayerESP then
                    if vu354.Character.Head and not vu354.Character.Head:FindFirstChild("PlayerESP" .. Number) then
                        local v355 = Instance.new("BillboardGui", vu354.Character.Head)
                        v355.Name = "PlayerESP" .. Number
                        v355.ExtentsOffset = Vector3.new(0, 1, 0)
                        v355.Size = UDim2.new(1, 200, 1, 30)
                        v355.Adornee = vu354.Character.Head
                        v355.AlwaysOnTop = true
                        local v356 = Instance.new("TextLabel", v355)
                        v356.Font = "GothamBold"
                        v356.FontSize = "Size14"
                        v356.Text = vu354.Name .. "\n" .. math.round((vu354.Character.Head.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                        v356.Size = UDim2.new(1, 0, 1, 0)
                        v356.BackgroundTransparency = 1
                        v356.TextStrokeTransparency = 0.5
                        if vu354.Team ~= game:GetService("Players").LocalPlayer.Team then
                            v356.TextColor3 = Color3.new(255, 0, 0)
                        else
                            v356.TextColor3 = Color3.new(0, 255, 0)
                        end
                    else
                        vu354.Character.Head["PlayerESP" .. Number].TextLabel.Text = vu354.Name .. "\n" .. math.round((vu354.Character.Head.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                    end
                elseif vu354.Character.Head:FindFirstChild("PlayerESP" .. Number) then
                    vu354.Character.Head:FindFirstChild("PlayerESP" .. Number):Destroy()
                end
            end
        end)
    end
end
function FindDevilFruit()
    local v357, v358, v359 = pairs(game:GetService("Workspace").AllDroppedFruit:GetChildren())
    while true do
        local vu360
        v359, vu360 = v357(v358, v359)
        if v359 == nil then
            break
        end
        pcall(function()
            if string.find(vu360.Name, "Fruit") then
                if DevilFruitESP then
                    if string.find(vu360.Name, "Fruit") then
                        if vu360.Handle:FindFirstChild("DevilESP" .. Number) then
                            vu360.Handle["DevilESP" .. Number].TextLabel.Text = vu360.Name .. "\n" .. math.round((vu360.Handle.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                        else
                            local v361 = Instance.new("BillboardGui", vu360.Handle)
                            v361.Name = "DevilESP" .. Number
                            v361.ExtentsOffset = Vector3.new(0, 1, 0)
                            v361.Size = UDim2.new(1, 200, 1, 30)
                            v361.Adornee = vu360.Handle
                            v361.AlwaysOnTop = true
                            local v362 = Instance.new("TextLabel", v361)
                            v362.Font = "GothamBold"
                            v362.FontSize = "Size14"
                            v362.Size = UDim2.new(1, 0, 1, 0)
                            v362.BackgroundTransparency = 1
                            v362.TextStrokeTransparency = 0.5
                            v362.Text = vu360.Name .. "\n" .. math.round((vu360.Handle.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                            v362.TextColor3 = Color3.new(255, 255, 0)
                        end
                    end
                elseif vu360.Handle:FindFirstChild("DevilESP" .. Number) then
                    vu360.Handle:FindFirstChild("DevilESP" .. Number):Destroy()
                end
            end
        end)
    end
end
function FindGhostShip()
    local v363, v364, v365 = pairs(game:GetService("Workspace").GhostMonster:GetChildren())
    while true do
        local vu366
        v365, vu366 = v363(v364, v365)
        if v365 == nil then
            break
        end
        pcall(function()
            if vu366.Name == "Ghost Ship" then
                if GhostShipESP then
                    if vu366.Name == "Ghost Ship" then
                        if vu366.HumanoidRootPart:FindFirstChild("GhostESP" .. Number) then
                            vu366.HumanoidRootPart["GhostESP" .. Number].TextLabel.Text = "Ghost Ship" .. "\n" .. math.round((vu366.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                        else
                            local v367 = Instance.new("BillboardGui", vu366.HumanoidRootPart)
                            v367.Name = "GhostESP" .. Number
                            v367.ExtentsOffset = Vector3.new(0, 1, 0)
                            v367.Size = UDim2.new(1, 200, 1, 30)
                            v367.Adornee = vu366.HumanoidRootPart
                            v367.AlwaysOnTop = true
                            local v368 = Instance.new("TextLabel", v367)
                            v368.Font = "GothamBold"
                            v368.FontSize = "Size14"
                            v368.Size = UDim2.new(1, 0, 1, 0)
                            v368.BackgroundTransparency = 1
                            v368.TextStrokeTransparency = 0.5
                            v368.Text = "Ghost Ship" .. "\n" .. math.round((vu366.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                            v368.TextColor3 = Color3.new(204, 159, 40)
                        end
                    end
                elseif vu366.HumanoidRootPart:FindFirstChild("GhostESP" .. Number) then
                    vu366.HumanoidRootPart:FindFirstChild("GhostESP" .. Number):Destroy()
                end
            end
        end)
    end
end
function FindLegacyIsland()
    local v369, v370, v371 = pairs(game:GetService("Workspace").Island:GetChildren())
    while true do
        local vu372
        v371, vu372 = v369(v370, v371)
        if v371 == nil then
            break
        end
        pcall(function()
            if string.find(vu372.Name, "Legacy Island") then
                if LegacyIslandESP then
                    if string.find(vu372.Name, "Legacy Island") then
                        if vu372.Main:FindFirstChild("GayESP" .. Number) then
                            vu372.Main["GayESP" .. Number].TextLabel.Text = "Legacy Island" .. "\n" .. math.round((vu372.Main.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                        else
                            local v373 = Instance.new("BillboardGui", vu372.Main)
                            v373.Name = "GayESP" .. Number
                            v373.ExtentsOffset = Vector3.new(0, 1, 0)
                            v373.Size = UDim2.new(1, 200, 1, 30)
                            v373.Adornee = vu372.Main
                            v373.AlwaysOnTop = true
                            local v374 = Instance.new("TextLabel", v373)
                            v374.Font = "GothamBold"
                            v374.FontSize = "Size14"
                            v374.Size = UDim2.new(1, 0, 1, 0)
                            v374.BackgroundTransparency = 1
                            v374.TextStrokeTransparency = 0.5
                            v374.Text = "Legacy Island" .. "\n" .. math.round((vu372.Main.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                            v374.TextColor3 = Color3.new(255, 255, 255)
                        end
                    end
                elseif vu372.Main:FindFirstChild("GayESP" .. Number) then
                    vu372.Main:FindFirstChild("GayESP" .. Number):Destroy()
                end
            end
        end)
    end
end
function FindHydraIsland()
    local v375, v376, v377 = pairs(game:GetService("Workspace").Island:GetChildren())
    while true do
        local vu378
        v377, vu378 = v375(v376, v377)
        if v377 == nil then
            break
        end
        pcall(function()
            if string.find(vu378.Name, "Sea King") then
                if HydraIslandESP then
                    if string.find(vu378.Name, "Sea King") then
                        if vu378.Main:FindFirstChild("HydraESP" .. Number) then
                            vu378.Main["HydraESP" .. Number].TextLabel.Text = "Hydra Island" .. "\n" .. math.round((vu378.Main.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                        else
                            local v379 = Instance.new("BillboardGui", vu378.Main)
                            v379.Name = "HydraESP" .. Number
                            v379.ExtentsOffset = Vector3.new(0, 1, 0)
                            v379.Size = UDim2.new(1, 200, 1, 30)
                            v379.Adornee = vu378.Main
                            v379.AlwaysOnTop = true
                            local v380 = Instance.new("TextLabel", v379)
                            v380.Font = "GothamBold"
                            v380.FontSize = "Size14"
                            v380.Size = UDim2.new(1, 0, 1, 0)
                            v380.BackgroundTransparency = 1
                            v380.TextStrokeTransparency = 0.5
                            v380.Text = "Hydra Island" .. "\n" .. math.round((vu378.Main.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                            v380.TextColor3 = Color3.new(0, 255, 255)
                        end
                    end
                elseif vu378.Main:FindFirstChild("HydraESP" .. Number) then
                    vu378.Main:FindFirstChild("HydraESP" .. Number):Destroy()
                end
            end
        end)
    end
end
function ESPIsland()
    local v381, v382, v383 = pairs(game:GetService("Workspace").Island:GetChildren())
    while true do
        local vu384
        v383, vu384 = v381(v382, v383)
        if v383 == nil then
            break
        end
        pcall(function()
            if GetIslandEsp then
                if vu384.ClassName == "Model" then
                    if vu384:FindFirstChild("IslandEsp" .. Number) then
                        vu384["IslandEsp" .. Number].TextLabel.Text = vu384.Name .. "\n" .. math.round((vu384.WorldPivot.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                    else
                        local v385 = Instance.new("BillboardGui", vu384)
                        v385.Name = "IslandEsp" .. Number
                        v385.ExtentsOffset = Vector3.new(0, 1, 0)
                        v385.Size = UDim2.new(1, 200, 1, 30)
                        v385.Adornee = vu384
                        v385.AlwaysOnTop = true
                        local v386 = Instance.new("TextLabel", v385)
                        v386.Font = "GothamBold"
                        v386.FontSize = "Size14"
                        v386.Size = UDim2.new(1, 0, 1, 0)
                        v386.BackgroundTransparency = 1
                        v386.TextStrokeTransparency = 0.5
                        v386.Text = vu384.Name .. "\n" .. math.round((vu384.WorldPivot.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                        v386.TextColor3 = Color3.new(255, 0, 0)
                    end
                end
            elseif vu384:FindFirstChild("IslandEsp" .. Number) then
                vu384:FindFirstChild("IslandEsp" .. Number):Destroy()
            end
        end)
    end
end
function NpcESP()
    local v387, v388, v389 = pairs(game:GetService("Workspace").AllNPC:GetChildren())
    while true do
        local vu390
        v389, vu390 = v387(v388, v389)
        if v389 == nil then
            break
        end
        pcall(function()
            if GetNpcEsp then
                if vu390.ClassName == "Part" and (vu390.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1000 then
                    if vu390:FindFirstChild("NPCESP" .. Number) then
                        vu390["NPCESP" .. Number].TextLabel.Text = vu390.Name .. "\n" .. math.round((vu390.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                    else
                        local v391 = Instance.new("BillboardGui", vu390)
                        v391.Name = "NPCESP" .. Number
                        v391.ExtentsOffset = Vector3.new(0, 1, 0)
                        v391.Size = UDim2.new(1, 200, 1, 30)
                        v391.Adornee = vu390
                        v391.AlwaysOnTop = true
                        local v392 = Instance.new("TextLabel", v391)
                        v392.Font = "GothamBold"
                        v392.FontSize = "Size14"
                        v392.Size = UDim2.new(1, 0, 1, 0)
                        v392.BackgroundTransparency = 1
                        v392.TextStrokeTransparency = 0.5
                        v392.Text = vu390.Name .. "\n" .. math.round((vu390.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 3) .. " m."
                        v392.TextColor3 = Color3.new(255, 255, 0)
                    end
                end
            elseif vu390:FindFirstChild("NPCESP" .. Number) then
                vu390:FindFirstChild("NPCESP" .. Number):Destroy()
            end
        end)
    end
end
v350:addToggle("Esp Player", PlayerESP, function(p393)
    PlayerESP = p393
    while PlayerESP do
        wait()
        FindPlayer()
    end
end)
v350:addToggle("Esp Devil Fruit", DevilFruitESP, function(p394)
    DevilFruitESP = p394
    while DevilFruitESP do
        wait()
        FindDevilFruit()
    end
end)
v350:addToggle("Esp Island", GetIslandEsp, function(p395)
    GetIslandEsp = p395
    while GetIslandEsp do
        wait()
        ESPIsland()
    end
end)
v350:addToggle("Esp NPC", GetNpcEsp, function(p396)
    GetNpcEsp = p396
    while GetNpcEsp do
        wait()
        NpcESP()
    end
end)
v350:addToggle("Esp Legacy Island", LegacyIslandESP, function(p397)
    LegacyIslandESP = p397
    while LegacyIslandESP do
        wait()
        FindLegacyIsland()
    end
end)
v350:addToggle("Esp Hydra Island", HydraIslandESP, function(p398)
    HydraIslandESP = p398
    while HydraIslandESP do
        wait()
        FindHydraIsland()
    end
end)
v350:addToggle("Esp Ghost Ship", GhostShipESP, function(p399)
    GhostShipESP = p399
    while GhostShipESP do
        wait()
        FindGhostShip()
    end
end)