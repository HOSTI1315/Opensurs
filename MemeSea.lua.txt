local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("ImageButton")
button.Size = UDim2.new(0, 80, 0, 80)
button.Position = UDim2.new(0.05, 0, 0.05, 0)
button.BackgroundTransparency = 1
button.Image = "rbxassetid://104487529937663"
button.ScaleType = Enum.ScaleType.Fit
button.Parent = gui

local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(1, 0)
uicorner.Parent = button

button.MouseButton1Click:Connect(function()
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
    task.wait(0.05)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.RightControl, false, game)
end)

local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vateq/UILIBrewrites/refs/heads/main/justtestin"))()
local win = SolarisLib:New({
  Name = "Meme Sea - By DYHUB",
  FolderToSave = "SolarisLibStuff"
})

local tab = win:Tab("AutoFarm")
local sec = tab:Section("AutoFarm")

local tab2 = win:Tab("Stats")
local sec2 = tab2:Section("Stats")

local tab6 = win:Tab("Shop")
local sec3 = tab6:Section("Buy/Redeem")

local tab3 = win:Tab("Auto Farm Spec")
local sec4 = tab3:Section("Auto Farm Boss")
local sec42 = tab3:Section("Auto Farm Specified")

local tab5 = win:Tab("Auto Raid")
local autoraidsec = tab5:Section("Auto Raid")

local tab4 = win:Tab("Settings")
local sec6 = tab4:Section("Settings")

_G.candyhub = {
    autofloppa = false,
    tokill = "Floppa",
    questmode = true,
    quest = "Floppa Quest 1",
    autos = true,
    allowbosses = true,
    devtest = true,
    platform = true,
    buyfruitmode = 'Money',
    stats_s = {},
    boss = false,
    weapon = 'Combat',
    memebeast = false,
    autoboss = false,
    tokill_level = 1,
    tokill_bosses = {},
    evilnoob = false,
    amount = 1,
    autoraid = false,
    monsters = {},
    autokillspec = false,
    tokill_monster = 'Red Sus',
}

local function getNil(name,class) 
    return game.Players.LocalPlayer.Character:FindFirstChildOfClass('Tool')
end

local function Press(key)
    local VirtualInputManager = game:GetService("VirtualInputManager")
    VirtualInputManager:SendKeyEvent(true, key, false, nil)
    task.wait()
    VirtualInputManager:SendKeyEvent(false, key, false, nil)
end

local function click(cd)
    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.candyhub.weapon) then
        if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.candyhub.weapon) then
            game.Players.LocalPlayer.Backpack:FindFirstChild(_G.candyhub.weapon).Parent = game.Players.LocalPlayer.Character
        end
    end
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton1(Vector2.new(10000,10000), game:GetService("Workspace").Camera.CFrame)
end

local function CheckQuest()
    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild('QuestGui') then
        if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild('QuestGui'):FindFirstChild('Holder') then
            if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild('QuestGui'):FindFirstChild('Holder'):FindFirstChild('QuestSlot1') then
                return game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible
            end
        end
    end
end

local function SureQuest(QuestTarget)
    if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.QuestGiver.Text ~= QuestTarget then
        local args = {[1] = "Abandon_Quest",[2] = {["QuestSlot"] = "QuestSlot1"}}
        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("QuestEvents"):WaitForChild("Quest"):FireServer(unpack(args))
    end
end

local function GetLevel()
    return game:GetService("Players").LocalPlayer.PlayerData.Level.Value
end

local function Lives()
    if game.Players.LocalPlayer.Character then
        if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
            if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid') then
                if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid').Health >= 1 then
                    return true
                else
                    return false
                end
            end
        end
    end
end

local function StoreEquippedFruit()
    if Lives() then
        local args = {[1] = "Eatable_Power",[2] = {["Action"] = "Store",["Tool"] = getNil("PowerName", "PowerClassName")}}
        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))
    end
end


local function UseAura()
    if Lives() then
        if game.Players.LocalPlayer.Character:FindFirstChild('AuraColor_Folder') then
            if not game.Players.LocalPlayer.Character:FindFirstChild('AuraColor_Folder'):FindFirstChild('LeftHand_AuraColor') then
                game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Ability"):InvokeServer('Aura')
            end
        end
    end
end

-- workspace.Island.MrBeastIsland.Paths:GetChildren()[12]

local function AreaCheck(level)
    if level >= 2200 then
        if not workspace.NPCs.SetSpawn_Npc:FindFirstChild('SetSpawn9') and Lives() and _G.candyhub.autofloppa then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.SpawnLocations["MrBeast Island"].CFrame
        end
    elseif level >= 2100 then
        if not workspace.NPCs.SetSpawn_Npc:FindFirstChild('SetSpawn9') and Lives() and _G.candyhub.autofloppa then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.SpawnLocations["MrBeast Island"].CFrame
        end
    elseif level >= 1900 then
        if not workspace.NPCs.SetSpawn_Npc:FindFirstChild('SetSpawn8') and Lives() and _G.candyhub.autofloppa then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.SpawnLocations["Pvp Arena"].CFrame
        end
    elseif level >= 1700 then
        if not workspace.NPCs.SetSpawn_Npc:FindFirstChild('SetSpawn10') and Lives() and _G.candyhub.autofloppa then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.SpawnLocations["Forgotten Island"].CFrame
        end
    elseif level >= 1450 then
        if not workspace.NPCs.SetSpawn_Npc:FindFirstChild('SetSpawn7') and Lives() and _G.candyhub.autofloppa then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.SpawnLocations["Sus Island"].CFrame
        end
    elseif level >= 1200 then
        if not workspace.NPCs.SetSpawn_Npc:FindFirstChild('SetSpawn6') and Lives() and _G.candyhub.autofloppa then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.SpawnLocations["Moai Island"].CFrame
        end
    elseif level >= 1150 then
        if not workspace.NPCs.SetSpawn_Npc:FindFirstChild('SetSpawn7') and Lives() and _G.candyhub.autofloppa then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.SpawnLocations["Sus Island"].CFrame
        end
    elseif level >= 950 then
        if not workspace.NPCs.SetSpawn_Npc:FindFirstChild('SetSpawn5') and Lives() and _G.candyhub.autofloppa then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.SpawnLocations["Pumpkin Island"].CFrame
        end
    elseif level >= 750 then
        if not workspace.NPCs.SetSpawn_Npc:FindFirstChild('SetSpawn4') and Lives() and _G.candyhub.autofloppa then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.SpawnLocations["Sand Island"].CFrame
        end
    elseif level >= 600 then
        if not workspace.NPCs.SetSpawn_Npc:FindFirstChild('SetSpawn3') and Lives() and _G.candyhub.autofloppa then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.SpawnLocations["Gorilla Island"].CFrame
        end
    elseif level >= 300 then
        if not workspace.NPCs.SetSpawn_Npc:FindFirstChild('SetSpawn2') and Lives() and _G.candyhub.autofloppa then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.SpawnLocations["Snow Island"].CFrame
        end
    elseif level >= 1 then
        if not workspace.NPCs.SetSpawn_Npc:FindFirstChild('SetSpawn1') and Lives() and _G.candyhub.autofloppa then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.SpawnLocations["Floppa Island"].CFrame
        end
    end
    --if Lives() then
    --    if _G.candyhub.autofloppa then
    --        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.QuestLocaion:FindFirstChild(_G.candyhub.quest).CFrame
    --    end
    --end
end

local function UseQuest(proximity)
    if identifyexecutor() == 'Solara' then
        fireproximityprompt(proximity, 5)
    elseif identifyexecutor() == 'Xeno' then
        fireproximityprompt(proximity, 5)
    else
        local VirtualInputManager = game:GetService("VirtualInputManager")
        VirtualInputManager:SendKeyEvent(true, "E", false, nil)
        task.wait()
        VirtualInputManager:SendKeyEvent(false, "E", false, nil)
    end
end

local function GetQuest(npc)
    local u = 'Floppa Quest '
    if npc == 'Floppa' then
        return u..'1'
    elseif npc == 'Golden Floppa' then
        return u..'2'
    elseif npc == 'Big Floppa' then
        return u..'3' -- BOSS
    elseif npc == 'Doge' then
        return u..'4'
    elseif npc == 'Cheems' then
        return u..'5'
    elseif npc == 'Walter Dog' then
        return u..'6' -- BOSS
    elseif npc == 'Staring Fish' then
        return u..'7'
    elseif npc == 'Hamster' then
        return u..'8'
    elseif npc == 'Snow Tree' then
        return u..'9'
    elseif npc == 'The Rock' then
        return u..'10'
    elseif npc == 'Banana Cat' then
        return u..'11'
    elseif npc == 'Egg Dog' then
        return u..'13'
    elseif npc == 'Sus Face' then
        return u..'12' -- BOSS
    elseif npc == 'Popcat' then
        return u..'14'
    elseif npc == 'Gorilla King' then
        return u..'15' -- BOSS
    elseif npc == 'Smiling Cat' then
        return u..'16'
    elseif npc == 'Killerfish' then
        return u..'17'
    elseif npc == 'Bingus' then
        return u..'18'
    elseif npc == 'Obamid' then
        return u..'19' -- BOSS
    elseif npc == 'Floppy' then
        return u..'20'
    elseif npc == 'Creepy Head' then
        return u..'21'
    elseif npc == 'Scary Skull' then
        return u..'22'
    elseif npc == 'Pink Absorber' then
        return u..'24' -- BOSS
    elseif npc == 'Troll Face' then
        return u..'25'
    elseif npc == 'Uncanny Cat' then
        return u..'26'
    elseif npc == 'Quandale Dingle' then
        return u..'27'
    elseif npc == 'Moai' then
        return u..'28' -- BOSS
    elseif npc == 'Evil Noob' then
        return u..'29'
    elseif npc == 'Red Sus' then
        return u..'30'
    elseif npc == 'Sus Duck' then
        return u..'31'
    elseif npc == 'Lord Sus' then
        return u..'32'
    elseif npc == 'Sigma Man' then
        return u..'33'
    elseif npc == 'Dancing Cat' then
        return u..'34'
    elseif npc == 'Toothless Dragon' then
        return u..'35'
    elseif npc == 'Manly Nugget' then
        return u..'36'
    elseif npc == 'Huh Cat' then
        return u..'37'
    elseif npc == 'Mystical Tree' then
        return u..'38'
    elseif npc == 'Old Man' then
        return u..'39'
    elseif npc == 'Nyan Cat' then
        return u..'40'
    elseif npc == 'Baller' then
        return u..'41'
    elseif npc == 'Slicer' then
        return u..'42'
    elseif npc == 'Rick Roller' then
        return u..'43' -- BOSS
    elseif npc == 'Gigachad' then
        return u..'44'
    elseif npc == 'MrBeast' then
        return u..'45' -- BOSS
    elseif npc == 'Handsome Man' then
        return u..'46'
    elseif npc == 'Sogga' then
        return 'Dancing Banana Quest'
    else
        return ''
    end
end

local itemslist = {}
itemslist = {}
for i, item in game.Players.LocalPlayer.Backpack:GetChildren() do
    if not item.Name:match('Power') then
        table.insert(itemslist, tostring(item.Name))
    end
end


local weapondropdown = sec:Dropdown("AutoFarm Weapon: ", itemslist,"Combat","Dropdown", function(t)
    _G.candyhub.weapon = t
end)

sec:Button("Refresh Weapons List", function()
    itemslist = {}
    for i, item in game.Players.LocalPlayer.Backpack:GetChildren() do
        if not item.Name:match('Power') then
            table.insert(itemslist, tostring(item.Name))
        end
    end
    weapondropdown:Refresh(itemslist, true)
end)

local autofarmtoggle = sec:Toggle("Auto Farm", false,"Toggle", function(t)
    _G.candyhub.autofloppa = t
    while _G.candyhub.autofloppa and task.wait() do
        for i,monster in workspace.Monster:GetChildren() do
            if monster.Name == _G.candyhub.tokill then
                if monster:FindFirstChild("HumanoidRootPart") and monster:FindFirstChild("Humanoid") then
                    if Lives() then
                        if monster:FindFirstChild("Humanoid").Health >= 1 then
                            monster:FindFirstChild("HumanoidRootPart").Size=Vector3.new(17,17,17)
                            if _G.candyhub.devtest then
                                monster:FindFirstChild("HumanoidRootPart").Transparency = 0.8
                            end
                            SureQuest(_G.candyhub.quest)
                            if not CheckQuest() then
                                if workspace.NPCs.Quests_Npc:FindFirstChild(_G.candyhub.quest) then
                                    if Lives() and workspace.NPCs.Quests_Npc[_G.candyhub.quest]:FindFirstChild('Block') then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.QuestLocaion:FindFirstChild(_G.candyhub.quest).CFrame
                                        task.wait(0.1)
                                        UseQuest(workspace.NPCs.Quests_Npc[_G.candyhub.quest].Block:FindFirstChild('QuestPrompt'))
                                        UseQuest(workspace.NPCs.Quests_Npc[_G.candyhub.quest].Block:FindFirstChild('QuestPrompt'))
                                        task.wait(0.1)
                                    end
                                else
                                    if Lives() then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.QuestLocaion:FindFirstChild(_G.candyhub.quest).CFrame
                                    end
                                end
                            end
                            UseAura()
                            while monster:FindFirstChild("Humanoid").Health >= 1 and _G.candyhub.autofloppa and Lives() do
                                if monster:FindFirstChild("HumanoidRootPart") then
                                    monster:FindFirstChild("HumanoidRootPart").Size=Vector3.new(17,17,17)
                                    if _G.candyhub.devtest then
                                        monster:FindFirstChild("HumanoidRootPart").Transparency = 0.8
                                    end
                                end
                                if Lives() then
                                    monster:FindFirstChild("HumanoidRootPart").Size=Vector3.new(17,17,17)
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = monster:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, -5, 8)
                                end
                                click(10)
                                task.wait()
                            end
                        end
                    end
                end
            end
        end
    end
end)

sec:Toggle("Allow Bosses", false,"Toggle", function(t)
    _G.candyhub.allowbosses = t
end)

local bringenemiestoggle = sec:Toggle("Bring Enemies (Ignore Bosses)", false,"Toggle", function(t)
    _G.candyhub.bringenemies = t
    while _G.candyhub.bringenemies and task.wait() do
        if _G.candyhub.autofloppa and not _G.candyhub.autoraid and not _G.candyhub.autokillspec then
            for i, monster in workspace.Monster:GetChildren() do
                if monster:FindFirstChild('Humanoid') then
                    if monster:FindFirstChild('Humanoid').Health >= 1 then
                        if monster:FindFirstChild('HumanoidRootPart') and Lives()then
                            if monster.Name == _G.candyhub.tokill and not _G.candyhub.boss then
                                if workspace.NPCs.Quests_Npc:FindFirstChild(_G.candyhub.quest) then
                                    --task.wait(0.5)
                                    if Lives() and workspace.NPCs.Quests_Npc[_G.candyhub.quest]:FindFirstChild('Block') then
                                        monster:FindFirstChild('HumanoidRootPart').CFrame = workspace.NPCs.Quests_Npc[_G.candyhub.quest].Block.CFrame * CFrame.new(0,8,0)
                                        --monster:FindFirstChild('HumanoidRootPart').CFrame = workspace.Location.Enemy_Location:FindFirstChild(monster.Name).CFrame * CFrame.new(0,6,0)
                                    end
                                end
                                --monster:FindFirstChild('HumanoidRootPart').CFrame = workspace.NPCs.Quests_Npc[_G.candyhub.quest].Block.CFrame * CFrame.new(0,5,-8)
                            end
                        end
                    end
                end
            end
        elseif _G.candyhub.autoraid and not _G.candyhub.autofloppa and not _G.candyhub.autokillspec then
            for i, monster in workspace.Monster:GetChildren() do
                if monster:FindFirstChild('Humanoid') then
                    if monster:FindFirstChild('Humanoid').Health >= 1 then
                        if monster:FindFirstChild('HumanoidRootPart') and Lives()then
                            if monster.Name == 'Floppa Man' or monster.Name == 'Epic Doge' or monster.Name == 'Speedy Cheems' or monster.Name == 'Tanky Moai' or monster.Name == 'Killer Nugget' or monster.Name == 'The Stone' or monster.Name == 'Capybara' then
                                if Lives() then
                                    if game.Players.LocalPlayer:GetAttribute('Raiding') ~= '' then
                                        monster:FindFirstChild('HumanoidRootPart').CFrame = workspace.Raids:FindFirstChild('Raid_'..game.Players.LocalPlayer:GetAttribute('Raiding')).Statue.Floppa.CFrame * CFrame.new(0,28,-10)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        elseif _G.candyhub.autokillspec and not _G.candyhub.autofloppa and not _G.candyhub.autoraid then
            for i, monster in workspace.Monster:GetChildren() do
                if monster:FindFirstChild('Humanoid') then
                    if monster:FindFirstChild('Humanoid').Health >= 1 then
                        if monster:FindFirstChild('HumanoidRootPart') and Lives()then
                            if monster.Name == _G.candyhub.tokill_monster then
                                if Lives() then
                                    monster:FindFirstChild('HumanoidRootPart').CFrame = workspace.Location.Enemy_Location:FindFirstChild(monster.Name).CFrame * CFrame.new(0,10,0)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

local memebeasttoggle = sec4:Toggle("Auto Meme Beast", false,"Toggle", function(t)
    _G.candyhub.memebeast = t
    while _G.candyhub.memebeast and task.wait() do
        if workspace:FindFirstChild('Monster'):FindFirstChild('Meme Beast') then
            if Lives() then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.Enemy_Location["Meme Beast"].CFrame
                if not workspace:FindFirstChild('Monster'):FindFirstChild('Meme Beast') then
                    task.wait(1)
                else
                    UseAura()
                    if workspace:FindFirstChild('Monster'):FindFirstChild('Meme Beast'):FindFirstChild('HumanoidRootPart') then
                        if workspace:FindFirstChild('Monster'):FindFirstChild('Meme Beast'):FindFirstChild('Humanoid') then
                            if workspace:FindFirstChild('Monster'):FindFirstChild('Meme Beast'):FindFirstChild('Humanoid').Health >= 1 then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild('Monster'):FindFirstChild('Meme Beast'):FindFirstChild('HumanoidRootPart').CFrame * CFrame.new(0, -5, 8)
                                click(10)
                            end
                        end
                    end
                end
            end
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.Enemy_Location["Meme Beast"].CFrame
            if not workspace:FindFirstChild('Monster'):FindFirstChild('Meme Beast') then
                task.wait(1)
            end
        end
    end
end)

local giantpumptoggle = sec4:Toggle("Auto Giant Pumpkin +(auto summon)", false,"Toggle", function(t)
    _G.candyhub.giantpump = t
    while _G.candyhub.giantpump and task.wait() do
        if workspace:FindFirstChild('Monster'):FindFirstChild('Giant Pumpkin') then
            if Lives() then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.Enemy_Location["Giant Pumpkin"].CFrame
                if not workspace:FindFirstChild('Monster'):FindFirstChild('Giant Pumpkin') then
                    task.wait(1)
                else
                    UseAura()
                    if workspace:FindFirstChild('Monster'):FindFirstChild('Giant Pumpkin'):FindFirstChild('HumanoidRootPart') then
                        if workspace:FindFirstChild('Monster'):FindFirstChild('Giant Pumpkin'):FindFirstChild('Humanoid') then
                            if workspace:FindFirstChild('Monster'):FindFirstChild('Giant Pumpkin'):FindFirstChild('Humanoid').Health >= 1 then
                                if Lives() and _G.candyhub.questmode and not CheckQuest() and GetLevel() >= 1100 then
                                    SureQuest('Floppa Quest 23')
                                    if workspace.NPCs.Quests_Npc:FindFirstChild("Floppa Quest 23") then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Quests_Npc["Floppa Quest 23"].Block.CFrame
                                        task.wait(0.1)
                                        UseQuest(workspace.NPCs.Quests_Npc["Floppa Quest 23"].Block.QuestPrompt, 5)
                                        task.wait(0.1)
                                    end
                                end
                                workspace:FindFirstChild('Monster'):FindFirstChild('Giant Pumpkin'):FindFirstChild('HumanoidRootPart').Size = Vector3.new(20,20,20)
                                if _G.candyhub.devtest then
                                    workspace:FindFirstChild('Monster'):FindFirstChild('Giant Pumpkin'):FindFirstChild('HumanoidRootPart').Transparency = 0.8
                                end
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild('Monster'):FindFirstChild('Giant Pumpkin'):FindFirstChild('HumanoidRootPart').CFrame * CFrame.new(0, -5, 8)
                                click(10)
                            end
                        end
                    end
                end
            end
        else
            if Lives() then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.Enemy_Location["Giant Pumpkin"].CFrame
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Island.PumpkinIsland.Summon1.Summon.CFrame
                task.wait()
                UseQuest(workspace.Island.PumpkinIsland.Summon1.Summon.SummonPrompt,5)
            end
            if not workspace:FindFirstChild('Monster'):FindFirstChild('Giant Pumpkin') then
                task.wait(1)
            end
        end
    end
end)

local evilnoobtoggle = sec4:Toggle("Auto Evil Noob +(auto summon)", false,"Toggle", function(t)
    _G.candyhub.evilnoob = t
    while _G.candyhub.evilnoob and task.wait() do
        if workspace:FindFirstChild('Monster'):FindFirstChild('Evil Noob') then
            if Lives() then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.Enemy_Location["Evil Noob"].CFrame
                if not workspace:FindFirstChild('Monster'):FindFirstChild('Evil Noob') then
                    task.wait(1)
                else
                    UseAura()
                    if workspace:FindFirstChild('Monster'):FindFirstChild('Evil Noob'):FindFirstChild('HumanoidRootPart') then
                        if workspace:FindFirstChild('Monster'):FindFirstChild('Evil Noob'):FindFirstChild('Humanoid') then
                            if workspace:FindFirstChild('Monster'):FindFirstChild('Evil Noob'):FindFirstChild('Humanoid').Health >= 1 then
                                if Lives() and _G.candyhub.questmode and not CheckQuest() and GetLevel() >= 1100 then
                                    SureQuest('Floppa Quest 23')
                                    if workspace.NPCs.Quests_Npc:FindFirstChild(GetQuest('Evil Noob')) then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Quests_Npc[GetQuest('Evil Noob')].Block.CFrame
                                        task.wait(0.1)
                                        UseQuest(workspace.NPCs.Quests_Npc[GetQuest('Evil Noob')].Block.QuestPrompt, 5)
                                        task.wait(0.1)
                                    end
                                end
                                workspace:FindFirstChild('Monster'):FindFirstChild('Evil Noob'):FindFirstChild('HumanoidRootPart').Size = Vector3.new(20,20,20)
                                if _G.candyhub.devtest then
                                    workspace:FindFirstChild('Monster'):FindFirstChild('Evil Noob'):FindFirstChild('HumanoidRootPart').Transparency = 0.8
                                end
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild('Monster'):FindFirstChild('Evil Noob'):FindFirstChild('HumanoidRootPart').CFrame * CFrame.new(0, -5, 8)
                                click(10)
                            end
                        end
                    end
                end
            end
        else
            if Lives() then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.Enemy_Location["Evil Noob"].CFrame
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Island.MoaiIsland.Summon2.Summon.CFrame
                task.wait()
                UseQuest(workspace.Island.MoaiIsland.Summon2.Summon.SummonPrompt,5)
            end
            if not workspace:FindFirstChild('Monster'):FindFirstChild('Evil Noob') then
                task.wait(1)
            end
        end
    end
end)

local lordsustoggle = sec4:Toggle("Auto Lord Sus +(auto summon)", false,"Toggle", function(t)
    _G.candyhub.lordsus = t
    while _G.candyhub.lordsus and task.wait() do
        if workspace:FindFirstChild('Monster'):FindFirstChild('Lord Sus') then
            if Lives() then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.Enemy_Location["Lord Sus"].CFrame
                if not workspace:FindFirstChild('Monster'):FindFirstChild('Lord Sus') then
                    task.wait(1)
                else
                    UseAura()
                    if workspace:FindFirstChild('Monster'):FindFirstChild('Lord Sus'):FindFirstChild('HumanoidRootPart') then
                        if workspace:FindFirstChild('Monster'):FindFirstChild('Lord Sus'):FindFirstChild('Humanoid') then
                            if workspace:FindFirstChild('Monster'):FindFirstChild('Lord Sus'):FindFirstChild('Humanoid').Health >= 1 then
                                if Lives() and _G.candyhub.questmode and not CheckQuest() and GetLevel() >= 1550 then
                                    SureQuest('Floppa Quest 32')
                                    if workspace.NPCs.Quests_Npc:FindFirstChild(GetQuest('Lord Sus')) then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Quests_Npc[GetQuest('Lord Sus')].Block.CFrame
                                        task.wait(0.1)
                                        UseQuest(workspace.NPCs.Quests_Npc[GetQuest('Lord Sus')].Block.QuestPrompt, 5)
                                        task.wait(0.1)
                                    end
                                end
                                workspace:FindFirstChild('Monster'):FindFirstChild('Lord Sus'):FindFirstChild('HumanoidRootPart').Size = Vector3.new(17,17,17)
                                if _G.candyhub.devtest then
                                    workspace:FindFirstChild('Monster'):FindFirstChild('Lord Sus'):FindFirstChild('HumanoidRootPart').Transparency = 0.8
                                end
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild('Monster'):FindFirstChild('Lord Sus'):FindFirstChild('HumanoidRootPart').CFrame * CFrame.new(0, -5, 8)
                                click(10)
                            end
                        end
                    end
                end
            end
        else
            if Lives() then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.Enemy_Location["Lord Sus"].CFrame
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Island.ForgottenIsland.Summon3.Summon.CFrame
                task.wait(0.05)
                UseQuest(workspace.Island.ForgottenIsland.Summon3.Summon:FindFirstChild('SummonPrompt'),5)
            end
            if not workspace:FindFirstChild('Monster'):FindFirstChild('Lord Sus') then
                task.wait(1)
            end
        end
    end
end)


local bosstoggle = sec4:Toggle("Auto Farm Boss", false,"Toggle", function(t)
    _G.candyhub.autoboss = t
    while _G.candyhub.autoboss and task.wait(1) do
        if workspace:FindFirstChild('Monster') then
            if Lives() then
                for i, boss in _G.candyhub.tokill_bosses do
                    if not workspace.Monster:FindFirstChild(boss) then
                        if Lives() then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.Enemy_Location:FindFirstChild(boss).CFrame
                        end
                    end
                    if _G.candyhub.questmode then
                        if workspace:FindFirstChild('NPCs'):FindFirstChild('Quests_Npc'):FindFirstChild(GetQuest(boss)) then
                            if Lives() and workspace.NPCs.Quests_Npc:FindFirstChild(GetQuest(boss)):FindFirstChild('Block') then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Quests_Npc:FindFirstChild(GetQuest(boss)):FindFirstChild('Block').CFrame
                                task.wait(0.001)
                                UseQuest(workspace.NPCs.Quests_Npc:FindFirstChild(GetQuest(boss)):FindFirstChild('Block'):FindFirstChild('QuestPrompt'), 5)
                                task.wait(0.001)
                            end
                        end
                    end
                    if workspace:FindFirstChild('Monster'):FindFirstChild(boss) then
                        if workspace:FindFirstChild('Monster'):FindFirstChild(boss):FindFirstChild('Humanoid') and workspace:FindFirstChild('Monster'):FindFirstChild(boss):FindFirstChild('HumanoidRootPart') then
                            UseAura()
                            while workspace:FindFirstChild('Monster'):FindFirstChild(boss):FindFirstChild("Humanoid").Health >= 1 and _G.candyhub.autoboss and Lives() do
                                if workspace:FindFirstChild('Monster'):FindFirstChild(boss):FindFirstChild("HumanoidRootPart") then
                                    workspace:FindFirstChild('Monster'):FindFirstChild(boss):FindFirstChild("HumanoidRootPart").Size=Vector3.new(17,17,17)
                                    if _G.candyhub.devtest then
                                        workspace:FindFirstChild('Monster'):FindFirstChild(boss):FindFirstChild("HumanoidRootPart").Transparency = 0.8
                                    end
                                end
                                if Lives() then
                                    workspace:FindFirstChild('Monster'):FindFirstChild(boss):FindFirstChild("HumanoidRootPart").Size=Vector3.new(17,17,17)
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild('Monster'):FindFirstChild(boss):FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, -5, 8)
                                end
                                click(10)
                                task.wait()
                            end
                        end
                    end
                end
            end
        end
    end
end)

sec4:MultiDropdown("Boss: ", {"MrBeast","Rick Roller","Moai","Pink Absorber","Obamid","Gorilla King","Sus Face","Walter Dog","Big Floppa"},{"Big Floppa"},"Dropdown", function(t)
    _G.candyhub.tokill_bosses = t
end)

_G.candyhub.monsters = {}
for i, monstre in workspace.Location.Enemy_Location:GetChildren() do
    if monstre.Name ~= 'Big Floppa' and monstre.Name ~= 'Walter Dog' and monstre.Name ~= 'Sus Face' and monstre.Name ~= 'Gorilla King' and monstre.Name ~= 'Obamid' and monstre.Name ~= 'Pink Absorber' and monstre.Name ~= 'Moai' and monstre.Name ~= 'Rick Roller' and monstre.Name ~= 'MrBeast' then
        if monstre.Name ~= 'Meme Beast' and monstre.Name ~= 'Evil Noob' and monstre.Name ~= 'Giant Pumpkin' and monstre.Name ~= 'Lord Sus' and monstre.Name ~= 'Training Log' then
            table.insert(_G.candyhub.monsters,monstre.Name)
        end
    end
end


local farmspectoggle = sec42:Toggle("Auto Farm Specified", false,"Toggle", function(t)
    _G.candyhub.autokillspec = t
    while _G.candyhub.autokillspec and task.wait() do
        if workspace:FindFirstChild('Monster'):FindFirstChild(_G.candyhub.tokill_monster) then
            for i, monster in workspace:FindFirstChild('Monster'):GetChildren() do
                if monster.Name == _G.candyhub.tokill_monster then
                    if _G.candyhub.questmode then
                        SureQuest(GetQuest(_G.candyhub.tokill_monster))
                        if not CheckQuest() then
                            if workspace.NPCs.Quests_Npc:FindFirstChild(GetQuest(_G.candyhub.tokill_monster)) and Lives() then
                                if workspace.NPCs.Quests_Npc:FindFirstChild(GetQuest(_G.candyhub.tokill_monster)):FindFirstChild('Block') then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Quests_Npc:FindFirstChild(GetQuest(_G.candyhub.tokill_monster)):FindFirstChild('Block').CFrame
                                    task.wait(0.05)
                                    UseQuest(workspace.NPCs.Quests_Npc:FindFirstChild(GetQuest(_G.candyhub.tokill_monster)):FindFirstChild('Block'):FindFirstChild('QuestPrompt'), 5)
                                    UseQuest(workspace.NPCs.Quests_Npc:FindFirstChild(GetQuest(_G.candyhub.tokill_monster)):FindFirstChild('Block'):FindFirstChild('QuestPrompt'), 5)
                                    task.wait(0.05)
                                end
                            end
                        end
                    end
                    if monster:FindFirstChild('HumanoidRootPart') and monster:FindFirstChild('Humanoid') then
                        if monster:FindFirstChild('Humanoid').Health >= 1 then
                            if Lives() then
                                while monster:FindFirstChild('Humanoid').Health >= 1 and _G.candyhub.autokillspec do
                                    if Lives() then
                                        UseAura()
                                        monster:FindFirstChild('HumanoidRootPart').Size = Vector3.new(16,16,16)
                                        if _G.candyhub.devtest then
                                            monster:FindFirstChild('HumanoidRootPart').Transparency = 0.8
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = monster:FindFirstChild('HumanoidRootPart').CFrame * CFrame.new(0,-5,8)
                                        click(10)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        else
            if Lives() then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Location.Enemy_Location:FindFirstChild(_G.candyhub.tokill_monster).CFrame
                task.wait(0.5)
            end
        end
    end
end)

sec42:Dropdown("Monster: ", _G.candyhub.monsters,"Red Sus","Dropdown", function(t)
    _G.candyhub.tokill_monster = t
end)

local brgtoggle3 = sec42:Toggle("Bring Enemies (Specified Mode)", false,"Toggle", function(t)
    bringenemiestoggle:Set(t)
end)


-- game.Players.LocalPlayer:GetAttribute('Raiding') -- raid id
-- workspace.Raids:FindFirstChild('Raid_'..game.Players.LocalPlayer:GetAttribute('Raiding')) -- current raid
--[[

if game.Players.LocalPlayer:GetAttribute('Raiding') == '' then
    -- player is not raiding
end

]]

local autoraidtoggle = autoraidsec:Toggle("Auto Farm Raid", false,"Toggle", function(t)
    _G.candyhub.autoraid = t
    while _G.candyhub.autoraid and task.wait() do
        while game.Players.LocalPlayer:GetAttribute('Raiding') == '' or game.Players.LocalPlayer:GetAttribute('Raiding') == nil and task.wait() and _G.candyhub.autoraid do
            if Lives() then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Island.MrBeastIsland.Raid_Area.CFrame
                game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MiscEvents"):WaitForChild("StartRaid"):FireServer("Start")
            end
        end
        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MiscEvents"):WaitForChild("StartRaid"):FireServer("Start")
        for i, monster in workspace:FindFirstChild('Monster'):GetChildren() do
            if monster.Name == 'Super Popcat' or monster.Name == 'Maxwell The Cat' or monster.Name == 'Reverse Master' or monster.Name == 'Floppa Man' or monster.Name == 'Epic Doge' or monster.Name == 'Speedy Cheems' or monster.Name == 'Tanky Moai' or monster.Name == 'Killer Nugget' or monster.Name == 'The Stone' or monster.Name == 'Capybara' then
                if monster:FindFirstChild('HumanoidRootPart') and monster:FindFirstChild('Humanoid') then
                    --if monster.Name == 'Super Popcat' or monster.Name == 'Maxwell The Cat' or monster.Name == 'Reverse Master' then
                    if Lives() then
                        if monster:FindFirstChild('HumanoidRootPart') and monster:FindFirstChild('Humanoid') and monster:FindFirstChild('Humanoid').Health >= 1 then
                            monster:FindFirstChild('HumanoidRootPart').Size = Vector3.new(16,16,16)
                            if _G.candyhub.devtest then
                                monster:FindFirstChild('HumanoidRootPart').Transparency = 0.8
                            end
                        end
                        UseAura()
                        while monster:FindFirstChild('Humanoid') and monster:FindFirstChild('Humanoid').Health >= 1 and _G.candyhub.autoraid and task.wait() do
                            if monster.Name == 'Maxwell The Cat' then
                                if not workspace:FindFirstChild('Monster'):FindFirstChild('Floppa Man') then
                                    if not workspace:FindFirstChild('Monster'):FindFirstChild('Speedy Cheems') then
                                        if not workspace:FindFirstChild('Monster'):FindFirstChild('Epic Dog') then
                                            if not monster:FindFirstChild('Reverse_Mark') then
                                                if Lives() and monster:FindFirstChild('HumanoidRootPart') then
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = monster:FindFirstChild('HumanoidRootPart').CFrame * CFrame.new(0,-5,8)
                                                end
                                            else
                                                if Lives() and monster:FindFirstChild('HumanoidRootPart') then
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = monster:FindFirstChild('HumanoidRootPart').CFrame * CFrame.new(0,-5,13)
                                                end
                                            end
                                        else
                                            break
                                        end
                                    else
                                        break
                                    end
                                else
                                    break
                                end
                            else
                                if not monster:FindFirstChild('Reverse_Mark') then
                                    if Lives() and monster:FindFirstChild('HumanoidRootPart') then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = monster:FindFirstChild('HumanoidRootPart').CFrame * CFrame.new(0,-5,8)
                                    end
                                else
                                    if Lives() and monster:FindFirstChild('HumanoidRootPart') then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = monster:FindFirstChild('HumanoidRootPart').CFrame * CFrame.new(0,-5,13)
                                    end
                                end
                            end
                            --end
                            click(10)
                        end
                    end
                    --end
                end
            end
        end
    end
end)

local brgtoggle2 = autoraidsec:Toggle("Bring Enemies (RaidMode)", false,"Toggle", function(t)
    bringenemiestoggle:Set(t)
end)

sec6:Toggle("No Quests", false,"Toggle", function(t)
    _G.candyhub.questmode = not t
end)

sec6:Bind("Force Stop AutoFarm", Enum.KeyCode.J, false, "BindNormal", function()
    _G.candyhub.autofloppa = false
    --_G.bringenemiestoggle = false
    autofarmtoggle:Set(false)
    --bringenemiestoggle:Set(false)
    _G.candyhub.memebeast = false
    memebeasttoggle:Set(false)
    giantpumptoggle:Set(false)
    _G.candyhub.giantpump = false
    bosstoggle:Set(false)
    _G.candyhub.autoboss = false
    evilnoobtoggle:Set(false)
    _G.candyhub.evilnoob = false
    autoraidtoggle:Set(false)
    _G.candyhub.autoraid = false
    farmspectoggle:Set(false)
    lordsustoggle:Set(false)
end)

sec2:Toggle("Auto Stats", false,"Toggle", function(t)
    _G.candyhub.autostats = t
    while _G.candyhub.autostats and task.wait(0.1) do
        for i, stat in _G.candyhub.stats_s do
            local args = {[1] = {["Target"] = stat,["Action"] = "UpgradeStats",["Amount"] = 1}}
            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("StatsFunction"):InvokeServer(unpack(args))
        end
    end
end)

sec2:MultiDropdown("Stats: ", {"MeleeLevel","DefenseLevel","SwordLevel","MemePowerLevel"},{"MeleeLevel", "DefenseLevel"},"Dropdown", function(t)
    _G.candyhub.stats_s = t
end)

sec3:Button("Redeem Codes", function()
    local codes = {"100MVisits","100KLikes","100KFavorites","100KActive","70KActive","40KActive","20KActive","10KActive","10KMembers","Update4","4KActive","10KLikes","10MVisits","9MVisits"}
    for i, code in codes do
    game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Code"):InvokeServer(code)
    end
end)

sec3:Button("Roll Powers", function()
    for i = 1,_G.candyhub.amount do
        local args = {[1] = "Random_Power",[2] = {["Type"] = "Once",["NPCName"] = "Floppa Gacha",["GachaType"] = _G.candyhub.buyfruitmode}}
        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))
    end
end)
--sec:Slider(title <string>,default <number>,max <number>,minimum <number>,increment <number>, flag <string>, callback <function>)
local slider = sec3:Slider("Slider", 1,500,1,1,"Slider", function(t)
    _G.candyhub.amount = t
end)

sec3:Dropdown("Buy Mode: ", {"Money","Gem"},"Money","Dropdown", function(t)
    _G.candyhub.buyfruitmode = t
end)

while true and task.wait(.5) do
    if GetLevel() >= 2350 then
        _G.candyhub.tokill = "Handsome Man"
        _G.candyhub.quest = "Floppa Quest 46"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 2350
    elseif GetLevel() >= 2300 and _G.candyhub.allowbosses == true then
        _G.candyhub.tokill = "MrBeast"
        _G.candyhub.quest = "Floppa Quest 45"
        _G.candyhub.boss = true
        _G.candyhub.tokill_level = 2300
    elseif GetLevel() >= 2250 then
        _G.candyhub.tokill = "Gigachad"
        _G.candyhub.quest = "Floppa Quest 44"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 2250
    elseif GetLevel() >= 2200 and _G.candyhub.allowbosses == true then
        _G.candyhub.tokill = "Rick Roller"
        _G.candyhub.quest = "Floppa Quest 43"
        _G.candyhub.boss = true
        _G.candyhub.tokill_level = 2200
    elseif GetLevel() >= 2150 then
        _G.candyhub.tokill = "Slicer"
        _G.candyhub.quest = "Floppa Quest 42"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 2150
    elseif GetLevel() >= 2100 then
        _G.candyhub.tokill = "Baller"
        _G.candyhub.quest = "Floppa Quest 41"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 2100
    elseif GetLevel() >= 2050 then
        _G.candyhub.tokill = "Nyan Cat"
        _G.candyhub.quest = "Floppa Quest 40"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 2050
    elseif GetLevel() >= 2000 then
        _G.candyhub.tokill = "Old Man"
        _G.candyhub.quest = "Floppa Quest 39"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 2000
    elseif GetLevel() >= 1950 then
        _G.candyhub.tokill = "Mystical Tree"
        _G.candyhub.quest = "Floppa Quest 38"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 1950
    elseif GetLevel() >= 1900 then
        _G.candyhub.tokill = "Huh Cat"
        _G.candyhub.quest = "Floppa Quest 37"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 1900
    elseif GetLevel() >= 1850 then
        _G.candyhub.tokill = "Manly Nugget"
        _G.candyhub.quest = "Floppa Quest 36"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 1850
    elseif GetLevel() >= 1800 then
        _G.candyhub.tokill = "Toothless Dragon"
        _G.candyhub.quest = "Floppa Quest 35"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 1800
    elseif GetLevel() >= 1750 then
        _G.candyhub.tokill = "Dancing Cat"
        _G.candyhub.quest = "Floppa Quest 34"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 1750
    elseif GetLevel() >= 1700 then
        _G.candyhub.tokill = "Sigma Man"
        _G.candyhub.quest = "Floppa Quest 33"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 1700
    elseif GetLevel() >= 1500 then 
        _G.candyhub.tokill = "Sus Duck"
        _G.candyhub.quest = "Floppa Quest 31"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 1500
    elseif GetLevel() >= 1450 then 
        _G.candyhub.tokill = "Red Sus"
        _G.candyhub.quest = "Floppa Quest 30"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 1450
    elseif GetLevel() >= 1350 and _G.candyhub.allowbosses == true then 
        _G.candyhub.tokill = "Moai"
        _G.candyhub.quest = "Floppa Quest 28"
        _G.candyhub.boss = true
        _G.candyhub.tokill_level = 1350
    elseif GetLevel() >= 1300 then 
        _G.candyhub.tokill = "Quandale Dingle"
        _G.candyhub.quest = "Floppa Quest 27"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 1300
    elseif GetLevel() >= 1250 then 
        _G.candyhub.tokill = "Uncanny Cat"
        _G.candyhub.quest = "Floppa Quest 26"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 1250
    elseif GetLevel() >= 1200 then 
        _G.candyhub.tokill = "Troll Face"
        _G.candyhub.quest = "Floppa Quest 25"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 1200
    elseif GetLevel() >= 1150 and _G.candyhub.allowbosses == true then 
        _G.candyhub.tokill = "Pink Absorber"
        _G.candyhub.quest = "Floppa Quest 24"
        _G.candyhub.boss = true
        _G.candyhub.tokill_level = 1150
    elseif GetLevel() >= 1050 then
        _G.candyhub.tokill = "Scary Skull"
        _G.candyhub.quest = "Floppa Quest 22"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 1050
    elseif GetLevel() >= 1000 then 
        _G.candyhub.tokill = "Creepy Head"
        _G.candyhub.quest = "Floppa Quest 21"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 1000
    elseif GetLevel() >= 950 then 
        _G.candyhub.tokill = "Floppy"
        _G.candyhub.quest = "Floppa Quest 20"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 950
    elseif GetLevel() >= 900 and _G.candyhub.allowbosses == true then 
        _G.candyhub.tokill = "Obamid"
        _G.candyhub.quest = "Floppa Quest 19"
        _G.candyhub.boss = true
        _G.candyhub.tokill_level = 900
    elseif GetLevel() >= 850 then 
        _G.candyhub.tokill = "Bingus"
        _G.candyhub.quest = "Floppa Quest 18"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 850
    elseif GetLevel() >= 800 then 
        _G.candyhub.tokill = "Killerfish"
        _G.candyhub.quest = "Floppa Quest 17"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 800
    elseif GetLevel() >= 750 then 
        _G.candyhub.tokill = "Smiling Cat"
        _G.candyhub.quest = "Floppa Quest 16"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 750
    elseif GetLevel() >= 700 and _G.candyhub.allowbosses == true then 
        _G.candyhub.tokill = "Gorilla King"
        _G.candyhub.quest = "Floppa Quest 15"
        _G.candyhub.boss = true
        _G.candyhub.tokill_level = 700
    elseif GetLevel() >= 650 then
        _G.candyhub.tokill = "Popcat"
        _G.candyhub.quest = "Floppa Quest 14"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 650
    elseif GetLevel() >= 600 then 
        _G.candyhub.tokill = "Egg Dog"
        _G.candyhub.quest = "Floppa Quest 13"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 600
    elseif GetLevel() >= 550 and _G.candyhub.allowbosses == true then 
        _G.candyhub.tokill = "Sus Face"
        _G.candyhub.quest = "Floppa Quest 12"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 550
    elseif GetLevel() >= 500 then 
        _G.candyhub.tokill = "Banana Cat"
        _G.candyhub.quest = "Floppa Quest 11"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 500
    elseif GetLevel() >= 450 then 
        _G.candyhub.tokill = "The Rock"
        _G.candyhub.quest = "Floppa Quest 10"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 450
    elseif GetLevel() >= 400 then 
        _G.candyhub.tokill = "Snow Tree"
        _G.candyhub.quest = "Floppa Quest 9"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 400
    elseif GetLevel() >= 350 then 
        _G.candyhub.tokill = "Hamster"
        _G.candyhub.quest = "Floppa Quest 8"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 350
    elseif GetLevel() >= 300 then 
        _G.candyhub.tokill = "Staring Fish"
        _G.candyhub.quest = "Floppa Quest 7"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 300
    elseif GetLevel() >= 250 and _G.candyhub.allowbosses == true then 
        _G.candyhub.tokill = "Walter Dog"
        _G.candyhub.quest = "Floppa Quest 6"
        _G.candyhub.boss = true
        _G.candyhub.tokill_level = 250
    elseif GetLevel() >= 200 then
        _G.candyhub.tokill = "Cheems"
        _G.candyhub.quest = "Floppa Quest 5"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 200
    elseif GetLevel() >= 150 then
        _G.candyhub.tokill = "Doge"
        _G.candyhub.quest = "Floppa Quest 4"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 150
    elseif GetLevel() >= 100 and _G.candyhub.allowbosses == true then
        _G.candyhub.tokill = "Big Floppa"
        _G.candyhub.quest = "Floppa Quest 3"
        _G.candyhub.boss = true
        _G.candyhub.tokill_level = 100
    elseif GetLevel() >= 50 then
        _G.candyhub.tokill = "Golden Floppa"
        _G.candyhub.quest = "Floppa Quest 2"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 50
    elseif GetLevel() >= 1 then
        _G.candyhub.tokill = "Floppa"
        _G.candyhub.quest = "Floppa Quest 1"
        _G.candyhub.boss = false
        _G.candyhub.tokill_level = 1
    end
    if _G.candyhub.autofloppa then
        AreaCheck(GetLevel())
    end
end

--[[

local args = {
    [1] = "Ability_Teacher",
    [2] = "Giga Chad"
}

game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))

local args = {
    [1] = "FightingStyle_Teacher",
    [2] = "Baller"
}

game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))

local args = {
    [1] = "Weapon_Seller",
    [2] = "Smiling Cat"
}

game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))

local args = {
    [1] = "Weapon_Seller",
    [2] = "Cheems"
}

game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))

local args = {
    [1] = "Weapon_Seller",
    [2] = "Doge"
}

game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))

local args = {
    [1] = "Weapon_Seller",
    [2] = "Hanger"
}

game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))

----------------------------------

]]
