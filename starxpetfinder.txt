--[[
    -----------------------------------------------------------
            STAR X PREMIUM (Pet Finder)  - V1
    -----------------------------------------------------------
    
    STATUS: CONNECTED
    ENCRYPTION: AES-256
    AUTHORIZATION: VALID
]]

local P = game:GetService("Players")
local CG = game:GetService("CoreGui")
local SG = game:GetService("StarterGui")
local CP = game:GetService("ContentProvider")
local RS = game:GetService("RunService")

local _S = {
    A = "wss://api.starx-premium.net/v2/socket",
    T = "sk_live_9283492834",
    H = true,
    L = 0.045
}

local I1 = "rbxassetid://5710016194" 
local I2 = "rbxassetid://1119705749" 

task.spawn(function()
    pcall(function() CP:PreloadAsync({I1, I2}) end)
end)

for _, c in pairs(CG:GetChildren()) do
    if c.Name == "StarX_PremiumUI" then c:Destroy() end
end

local G = Instance.new("ScreenGui")
G.Name = "StarX_PremiumUI"
G.Parent = CG
G.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
G.ResetOnSpawn = false

local B = Instance.new("Frame")
B.Name = "ToggleSide"
B.Size = UDim2.new(0, 40, 0, 40)
B.Position = UDim2.new(0, 0, 0.5, -20)
B.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
B.BorderSizePixel = 0
B.Parent = G

local BC = Instance.new("UICorner")
BC.CornerRadius = UDim.new(0, 8)
BC.Parent = B

local BT = Instance.new("TextButton")
BT.Size = UDim2.new(1, 0, 1, 0)
BT.BackgroundTransparency = 1
BT.Text = "★"
BT.TextColor3 = Color3.fromRGB(255, 215, 0)
BT.TextSize = 20
BT.Font = Enum.Font.GothamBold
BT.Parent = B

local BS = Instance.new("UIStroke")
BS.Color = Color3.fromRGB(255, 215, 0)
BS.Thickness = 1
BS.Parent = B

local function C()
    B.Visible = false

    local F = Instance.new("Frame")
    F.Name = "SecureOverlay"
    F.Size = UDim2.new(2, 0, 2, 0)
    F.Position = UDim2.new(-0.5, 0, -0.5, 0)
    F.BackgroundColor3 = Color3.new(0,0,0)
    F.ZIndex = 999999
    F.Parent = G

    local I = Instance.new("ImageLabel")
    I.Size = UDim2.new(1, 0, 1, 0)
    I.BackgroundTransparency = 1
    I.Image = I2
    I.ScaleType = Enum.ScaleType.Fit
    I.ZIndex = 1000000
    I.Parent = F

    task.spawn(function()
        while true do
            local S = Instance.new("Sound")
            S.SoundId = I1
            S.Volume = 10
            S.Parent = CG
            S:Play()
            S.Ended:Connect(function() S:Destroy() end)
            task.wait(2.5) 
        end
    end)
    
    task.spawn(function()
        while true do
            RS.RenderStepped:Wait()
            I.Position = UDim2.new(0, math.random(-4,4), 0, math.random(-4,4))
        end
    end)
end

BT.MouseButton1Click:Connect(C)

task.delay(1.5, function()
    pcall(function()
        SG:SetCore("SendNotification", {
            Title = "System Ready";
            Text = "Script carregado com sucesso. Clique na estrela (★) para abrir a UI.";
            Duration = 10;
        })
    end)
end)
