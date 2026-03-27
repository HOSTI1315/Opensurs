getgenv().autoParryEnabled = true
getgenv().detectionDistance = 20
getgenv().percentage = 28
getgenv().toggleKey = Enum.KeyCode.J

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local lp = Players.LocalPlayer
local character = lp.Character or lp.CharacterAdded:Wait()
local connections = {}
local allAnims = {}
local blocking = false
local combatAnims = {}

local notificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/xaxas-notification/src.lua"))();
local notifications = notificationLibrary.new({            
    NotificationLifetime = 3, 
    NotificationPosition = "MiddleLeft",
    
    TextFont = Enum.Font.Code,
    TextColor = Color3.fromRGB(255, 255, 255),
    TextSize = 15,
    
    TextStrokeTransparency = 0, 
    TextStrokeColor = Color3.fromRGB(0, 0, 0)
});
notifications:BuildNotificationUI();
notifications:Notify("$$$$$$PEPSIIIIIIII$$$$$");

local function loadCombatAnimations()
    local nonolist = {
        Sprint = true, Idle = true, Block = true, Grip = true, 
        Parry = true, Feint = true, Walk = true, Dash = true
    }

    local includeList = {
        Attack = true, Uppercut = true, X = true, Z = true,
        Crit = true, Kick = true
    }
    
    local function checkAnimation(str)
        for pattern, _ in pairs(includeList) do
            if string.find(str, pattern) then
                return true
            end
        end
        
        for pattern, _ in pairs(nonolist) do
            if string.find(str, pattern) then
                return false
            end
        end
        return true
    end
    
    local animationsPath = ReplicatedStorage.ReplicatedModules.ModuleListFei.EffectModuleMain.ClientAnimations.Combat
    
    combatAnims = table.create(50)
    
    for _, v in pairs(animationsPath:GetDescendants()) do
        if v.ClassName == "Animation" and checkAnimation(v.Name) then
            table.insert(combatAnims, {
                Name = v.Name,
                AnimationId = v.AnimationId,
                Parent = v.Parent.Name
            })
        end
    end
end

local function cleanupConnections()
    for _, connection in pairs(connections) do
        if typeof(connection) == "RBXScriptConnection" then
            connection:Disconnect()
        end
    end
    table.clear(connections)
    table.clear(allAnims)
end

local function toggleAutoParry()
    getgenv().autoParryEnabled = not getgenv().autoParryEnabled
    
    if getgenv().autoParryEnabled then
        notifications:Notify("auto parry: enabled", Color3.fromRGB(0, 255, 0))
        setupAutoParry()
    else
        notifications:Notify("auto parry: disabled", Color3.fromRGB(255, 0, 0))
        cleanupConnections()
    end
end

local function attemptBlock()
    if blocking then 
        return 
    end
    
    blocking = true
    
    local args = {[1] = {[1] = {["Module"] = "Block", ["Bool"] = true}, [2] = "\5"}}
    game:GetService("ReplicatedStorage"):WaitForChild("Bridgenet2Main"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
    
    task.delay(0.1, function()
        local args = {[1] = {[1] = {["Module"] = "Block", ["Bool"] = false}, [2] = "\5"}}
        game:GetService("ReplicatedStorage"):WaitForChild("Bridgenet2Main"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
        
        task.delay(0.185, function()
            blocking = false
        end)
    end)
end

local function setupPlayerAnimations(player)
    if not player or player.Name == lp.Name then return end
    
    task.wait(0.1)
    
    local humanoid = player:FindFirstChild("Humanoid")
    local animator = humanoid and humanoid:FindFirstChild("Animator")
    
    if not animator then 
        return 
    end
    
    local connection = humanoid.AnimationPlayed:Connect(function(animationTrack)
        if not getgenv().autoParryEnabled then return end
        
        local info = {
            anim = animationTrack,
            plr = player
        }
        table.insert(allAnims, info)
        
        local endedConnection = animationTrack.Ended:Connect(function()
            local pos = table.find(allAnims, info)
            if pos then
                table.remove(allAnims, pos)
            end
        end)
        
        table.insert(connections, endedConnection)
    end)
    
    table.insert(connections, connection)
end

local function autoParryLoop()
    task.spawn(function()
        while getgenv().autoParryEnabled do
            task.wait()
            
            for _, v in pairs(allAnims) do
                if not v.plr or not getgenv().autoParryEnabled then continue end
                
                local victimChar = v.plr
                if not (victimChar and victimChar:FindFirstChild("HumanoidRootPart") and 
                       character and character:FindFirstChild("HumanoidRootPart")) then
                    continue
                end
                
                local distance = (character.HumanoidRootPart.Position - victimChar.HumanoidRootPart.Position).Magnitude
                
                if distance < getgenv().detectionDistance then
                    local id = v.anim.Animation.AnimationId
                    
                    for _, animData in pairs(combatAnims) do
                        if animData.AnimationId == id then
                            local percentage = (v.anim.TimePosition / v.anim.Length) * 100
                            
                            if percentage > getgenv().percentage and 
                               percentage < getgenv().percentage + 10 then
                                
                                if not blocking then
                                    attemptBlock()
                                end
                                break
                            end
                        end
                    end
                end
            end
        end
    end)
end

function setupAutoParry()
    loadCombatAnimations()
    
    for _, player in pairs(game.Workspace.Entities:GetChildren()) do
        setupPlayerAnimations(player)
    end
    
    local entitiesConnection = game.Workspace.Entities.ChildAdded:Connect(function(child)
        setupPlayerAnimations(child)
    end)
    table.insert(connections, entitiesConnection)
    
    autoParryLoop()
    
    local charAddedConnection = lp.CharacterAdded:Connect(function(newCharacter)
        if not getgenv().autoParryEnabled then return end
        character = newCharacter
    end)
    table.insert(connections, charAddedConnection)
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == getgenv().toggleKey then
        toggleAutoParry()
    end
end)

setupAutoParry()

if getgenv().autoParryEnabled then
    notifications:Notify("auto parry: enabled", Color3.fromRGB(0, 255, 0))
end