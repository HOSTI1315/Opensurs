--@rznnq ui 
--ANTI SENTRY//TORRETA-DISCORD @rznnq (working in STEAL A BRAINROT uwu)
local anti_sentry_byrznnq = true
local DETECTION_DISTANCE = 60 --change this number if you want it to detect further//cambia este numero si quieres que detecte mas lejos
local PULL_DISTANCE = -5
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local target = nil
local connection = nil
local function getCharacter()
    return player.Character
end
local function getWeapon()
    local char = getCharacter()
    if not char then return nil end
    return player.Backpack:FindFirstChild("Bat") or char:FindFirstChild("Bat")
end
local function findTarget()
    local char = getCharacter()
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local rootPos = char.HumanoidRootPart.Position
    for _, obj in pairs(workspace:GetChildren()) do
        if obj.Name:find("Sentry") and not obj.Name:lower():find("bullet") then
            local ownerId = obj.Name:match("Sentry_(%d+)")
            if ownerId and tonumber(ownerId) == player.UserId then
                continue
            end
            local part = obj:IsA("BasePart") and obj
                or obj:IsA("Model") and (obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart"))
            if part and (rootPos - part.Position).Magnitude <= DETECTION_DISTANCE then
                return obj
            end
        end
    end
end
local function moveTarget(obj)
    local char = getCharacter()
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    for _, part in pairs(obj:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
    local root = char.HumanoidRootPart
    local cf = root.CFrame * CFrame.new(0, 0, PULL_DISTANCE)
    if obj:IsA("BasePart") then
        obj.CFrame = cf
    elseif obj:IsA("Model") then
        local main = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
        if main then
            main.CFrame = cf
        end
    end
end
local function attack()
    local char = getCharacter()
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local weapon = getWeapon()
    if not weapon then return end
    if weapon.Parent == player.Backpack then
        hum:EquipTool(weapon)
        task.wait(0.1)
    end
    local handle = weapon:FindFirstChild("Handle")
    if handle then
        handle.CanCollide = false
    end
    pcall(function()
        weapon:Activate()
    end)
    for _, r in pairs(weapon:GetDescendants()) do
        if r:IsA("RemoteEvent") then
            pcall(function()
                r:FireServer()
            end)
        end
    end
end
local function start()
    if connection then return end
    connection = RunService.Heartbeat:Connect(function()
        if not anti_sentry_byrznnq then return end
        if target and target.Parent == workspace then
            moveTarget(target)
            attack()
        else
            target = findTarget()
        end
    end)
end
local function stop()
    if connection then
        connection:Disconnect()
        connection = nil
    end
    target = nil
end
player.CharacterAdded:Connect(function()
    task.wait(0.5)
    if anti_sentry_byrznnq then
        start()
    else
        stop()
    end
end)
if anti_sentry_byrznnq then
    start()
end