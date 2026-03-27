--@rznnq ui 
--ESP PLAYERS,HITBOX-DISCORD @rznnq (working in STEAL A BRAINROT uwu)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local madebyrznnq = true
local espConnections = {}
local function createESP(plr)
    if plr == player then return end
    if not plr.Character then return end
    if plr.Character:FindFirstChild("followme@rznnq") then return end
    local char = plr.Character
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local head = char:FindFirstChild("Head")
    if not (hrp and head) then return end
    local hitbox = Instance.new("BoxHandleAdornment")
    hitbox.Name = "follow me @rznnq"
    hitbox.Adornee = hrp
    hitbox.Size = Vector3.new(4, 6, 2)
    hitbox.Color3 = Color3.fromRGB(128, 0, 128)
    hitbox.Transparency = 0.6
    hitbox.ZIndex = 10
    hitbox.AlwaysOnTop = true
    hitbox.Parent = char
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "cpsito riko"
    billboard.Adornee = head
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = char
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = plr.DisplayName or plr.Name
    label.TextColor3 = Color3.fromRGB(255, 0, 255)
    label.Font = Enum.Font.Arcade
    label.TextScaled = true
    label.TextStrokeTransparency = 0.7
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.Parent = billboard
end
local function removeESP(plr)
    if not plr.Character then return end
    local hitbox = plr.Character:FindFirstChild("ESP_Hitbox")
    local nameGui = plr.Character:FindFirstChild("ESP_Name")
    if hitbox then hitbox:Destroy() end
    if nameGui then nameGui:Destroy() end
end
local function enableESP()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player then
            if plr.Character then
                createESP(plr)
            end
            local conn = plr.CharacterAdded:Connect(function()
                task.wait(0.1)
                if madebyrznnq then
                    createESP(plr)
                end
            end)
            table.insert(espConnections, conn)
        end
    end
    local playerAddedConn = Players.PlayerAdded:Connect(function(plr)
        if plr == player then return end

        local charAddedConn = plr.CharacterAdded:Connect(function()
            task.wait(0.1)
            if madebyrznnq then
                createESP(plr)
            end
        end)
        table.insert(espConnections, charAddedConn)
    end)
    table.insert(espConnections, playerAddedConn)
end
local function disableESP()
    for _, plr in ipairs(Players:GetPlayers()) do
        removeESP(plr)
    end
    for _, conn in ipairs(espConnections) do
        if conn and conn.Connected then
            conn:Disconnect()
        end
    end
    espConnections = {}
end
player.CharacterAdded:Connect(function()
    task.wait(0.1)
    if madebyrznnq then
        enableESP()
    else
        disableESP()
    end
end)
if madebyrznnq then
    enableESP()
end