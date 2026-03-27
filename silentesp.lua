local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/linemaster2/esp-library/main/library.lua"))();
local notificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/xaxas-notification/src.lua"))()
local notifications = notificationLibrary.new({
    NotificationLifetime = 3,
    NotificationPosition = "Middle",
    TextFont = Enum.Font.Code,
    TextColor = Color3.fromRGB(255, 255, 255),
    TextSize = 15,
    TextStrokeTransparency = 0,
    TextStrokeColor = Color3.fromRGB(0, 0, 0)
})

notifications:BuildNotificationUI()
notifications:Notify("Yun v5")

ESP.Enabled = true;

ESP.ShowBox = true;
ESP.BoxType = "Corner Box Esp";
ESP.ShowName = true;
ESP.ShowHealth = true;
ESP.ShowTracer = false;
ESP.ShowDistance = true;


local toggleKey = Enum.KeyCode.Y
local silentAimEnabled = false

local replicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")
local camera = workspace.CurrentCamera
local utility = require(replicatedStorage.Modules.Utility)

local function toggleSilentAim()
    silentAimEnabled = not silentAimEnabled
    local status = silentAimEnabled and "enabled" or "disabled"
    notifications:Notify("Yun v5 " .. status)
end

local function getPlayers()
    local entities = {}

    for _, child in ipairs(workspace:GetChildren()) do
        if child:FindFirstChildOfClass("Humanoid") then
            table.insert(entities, child)
        elseif child.Name == "HurtEffect" then
            for _, hurtPlayer in ipairs(child:GetChildren()) do
                if hurtPlayer.ClassName ~= "Highlight" then
                    table.insert(entities, hurtPlayer)
                end
            end
        end
    end
    return entities
end

local function getClosestPlayer()
    local closest, closestDistance = nil, math.huge
    local character = players.LocalPlayer.Character

    if not character then return end

    for _, player in ipairs(getPlayers()) do
        if player == players.LocalPlayer then continue end
        if not player:FindFirstChild("HumanoidRootPart") then continue end

        local position, onScreen = camera:WorldToViewportPoint(player.HumanoidRootPart.Position)

        if not onScreen then continue end

        local center = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
        local distance = (center - Vector2.new(position.X, position.Y)).Magnitude

        if distance < closestDistance then
            closest = player
            closestDistance = distance
        end
    end
    return closest
end

local oldRaycast = utility.Raycast
utility.Raycast = function(...)
    local arguments = {...}

    if silentAimEnabled and #arguments > 0 and arguments[4] == 999 then
        local closest = getClosestPlayer()

        if closest then
            arguments[3] = closest.Head.Position
        end
    end
    return oldRaycast(unpack(arguments))
end

game:GetService("UserInputService").InputBegan:Connect(function(input, isProcessed)
    if not isProcessed and input.KeyCode == toggleKey then
        toggleSilentAim()
    end
end)