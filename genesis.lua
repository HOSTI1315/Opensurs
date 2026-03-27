getgenv().GunModication = {
    ["AmmoCount"] = 999,
    ["AmmoCount2"] = 999,
    ["RecoilControl"] = 0,
    ["MaxSpread"] = 0,
    ["Auto"] = true,
    ["FireRate"] = 0.02,
    ["ReloadTime"] = 0.02,
    ['EquipTime'] = 0.02
}

getgenv().SelfMovement = {
    ["InfiniteJump"] = false
}

getgenv().Visuals = {
    ["Type"] = "Circle", 
    ["Radius"] = 200,
    ["Color"] = Color3.fromRGB(255, 0, 0),
    ["Filled"] = false,
    ["Thickness"] = 2,          
    ["Position"] = "Center" 
}

getgenv().Aimbot = {
    ['Aim Assist'] = {
        ['enable'] = true,
        ['keybind'] = "E",
        ['bodypart'] = "Head",
        ['teamcheck'] = true,
        ['wallcheck'] = false,
    },
    ['Triggerbot'] = {
        ['enable'] = true,
        ['Keybind'] = 'X',
        ['teamcheck'] = true
    }
}
local cloneref = getgenv().cloneref or function(...) return ...; end
local Game = cloneref(game)

local SelfMovement = getgenv().SelfMovement 
local GunModication = getgenv().GunModication
local Visuals = getgenv().Visuals
local Aimbot = getgenv().Aimbot
--// doesnt work got patched
game:GetService("UserInputService").JumpRequest:Connect(function()
    if SelfMovement["InfiniteJump"] then
        local character = game:GetService("Players").LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState("Jumping")
            end
        end
    end
end)
--// also gun mods but in ammo 
task.spawn(function()
    while task.wait() do
        local player = game:GetService("Players").LocalPlayer
        if player and player:FindFirstChild("PlayerGui") then
            local playerGui = player.PlayerGui:FindFirstChild("GUI")
            if playerGui then
                local variables = playerGui:FindFirstChild("Client") and playerGui.Client:FindFirstChild("Variables")
                if variables then
                    if variables:FindFirstChild("ammocount") then
                        variables.ammocount.Value = GunModication["AmmoCount"]
                    end
                    if variables:FindFirstChild("ammocount2") then
                        variables.ammocount2.Value = GunModication["AmmoCount2"]
                    end
                end
            end
        end
    end
end)
--// gun mods
task.spawn(function()
    while task.wait(5) do
        local weapons = game:GetService("ReplicatedStorage"):FindFirstChild("Weapons")
        if weapons then
            for _, v in pairs(weapons:GetDescendants()) do
                if v:IsA("ValueBase") then
                    if v.Name == "RecoilControl" then
                        v.Value = GunModication["RecoilControl"]
                    elseif v.Name == "MaxSpread" then
                        v.Value = GunModication["MaxSpread"]
                    elseif v.Name == "Auto" then
                        v.Value = GunModication["Auto"]
                    elseif v.Name == "FireRate" then
                        v.Value = GunModication["FireRate"]
                    elseif v.Name == "ReloadTime" then
                        v.Value = GunModication["ReloadTime"]
                    elseif v.Name == "EquipTime" then
                        v.Value = GunModication["EquipTime"]
                    end
                end
            end
        end
    end
end)
--// fov
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local Framework = {}
Framework.Connections = {}

function Framework:DrawFOV(Type, Visuals)
    local radius = Visuals["Radius"] * 2
    local color = Visuals["Color"]
    local filled = Visuals["Filled"]
    local thickness = Visuals["Thickness"]
    local CoreObject, OutlineObject, InlineObject

    if Type == "Circle" then
        CoreObject = Drawing.new("Circle")
        OutlineObject = Drawing.new("Circle")
        InlineObject = Drawing.new("Circle")
    elseif Type == "Square" then
        CoreObject = Drawing.new("Square")
        OutlineObject = Drawing.new("Square")
        InlineObject = Drawing.new("Square")
    end

    if CoreObject then
        CoreObject.Radius = radius
        CoreObject.Thickness = thickness
        CoreObject.Color = color
        CoreObject.Filled = filled
    end
    if OutlineObject then
        OutlineObject.Radius = radius + 2
        OutlineObject.Thickness = thickness
        OutlineObject.Color = Color3.fromRGB(0, 0, 0)
        OutlineObject.Filled = false
    end
    if InlineObject then
        InlineObject.Radius = radius - 2
        InlineObject.Thickness = thickness
        InlineObject.Color = Color3.fromRGB(0, 0, 0)
        InlineObject.Filled = false
    end

    return CoreObject, OutlineObject, InlineObject, Type
end

function Framework:UpdateFOV(CoreObject, OutlineObject, InlineObject, FovType, Position)
    local mouseLocation = UserInputService:GetMouseLocation()
    local ScreenX, ScreenY = Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2
    local xPos, yPos = mouseLocation.X, mouseLocation.Y

    if FovType == "Square" then
        local position = (Position == "Mouse") and Vector2.new(xPos, yPos) or Vector2.new(ScreenX, ScreenY)
        CoreObject.Position = position - CoreObject.Size / 2
        OutlineObject.Position = position - OutlineObject.Size / 2
        InlineObject.Position = position - InlineObject.Size / 2
    elseif FovType == "Circle" then
        local position = (Position == "Mouse") and Vector2.new(xPos, yPos) or Vector2.new(ScreenX, ScreenY)
        CoreObject.Position = position
        OutlineObject.Position = position
        InlineObject.Position = position
    end
end

function Framework:AddFOVConnection(FovCore, FovOutline, FovInline, FovType, Position)
    local connection = RunService.RenderStepped:Connect(function()
        if FovCore and FovOutline and FovInline then
            Framework:UpdateFOV(FovCore, FovOutline, FovInline, FovType, Position)
        end
    end)
    table.insert(Framework.Connections, connection)
end

function Framework:RemoveFOVConnections()
    for _, conn in ipairs(Framework.Connections) do
        conn:Disconnect()
    end
    Framework.Connections = {}
end

local FovCore, FovOutline, FovInline, FovType = Framework:DrawFOV(Visuals["Type"], Visuals)
Framework:AddFOVConnection(FovCore, FovOutline, FovInline, FovType, Visuals["Position"])
--// 
--// rewriting aimbot
local FOV = 1000 -- FOV is always set to 1000
local Inset = game:GetService("GuiService"):GetGuiInset()
local SC = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Active = getgenv().Aimbot['Aim Assist']['enable']

function NotObstructing(Destination, Ignore)
    local Origin = workspace.CurrentCamera.CFrame.Position
    local CheckRay = Ray.new(Origin, Destination - Origin)
    local Hit = workspace:FindPartOnRayWithIgnoreList(CheckRay, Ignore)
    return Hit == nil
end

function ClosestHoe()
    local MaxDist, Nearest = math.huge
    for _, V in pairs(game:GetService("Players"):GetPlayers()) do
        if V ~= game:GetService("Players").LocalPlayer and V.Character and V.Character:FindFirstChild("Humanoid") then
            if getgenv().Aimbot['Aim Assist']['wallcheck'] then
                if getgenv().Aimbot['Aim Assist']['teamcheck'] then
                    if V.Team ~= game:GetService("Players").LocalPlayer.Team then
                        local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[getgenv().Aimbot['Aim Assist']['bodypart']].Position)
                        if Vis and NotObstructing(V.Character[getgenv().Aimbot['Aim Assist']['bodypart']].Position, {game:GetService("Players").LocalPlayer.Character, V.Character}) then
                            local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
                            if Diff < MaxDist and Diff < FOV then
                                MaxDist = Diff
                                Nearest = V
                            end
                        end
                    end
                else
                    local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[getgenv().Aimbot['Aim Assist']['bodypart']].Position)
                    if Vis and NotObstructing(V.Character[getgenv().Aimbot['Aim Assist']['bodypart']].Position, {game:GetService("Players").LocalPlayer.Character, V.Character}) then
                        local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
                        if Diff < MaxDist and Diff < FOV then
                            MaxDist = Diff
                            Nearest = V
                        end
                    end
                end
            else
                if getgenv().Aimbot['Aim Assist']['teamcheck'] then
                    if V.Team ~= game:GetService("Players").LocalPlayer.Team then
                        local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[getgenv().Aimbot['Aim Assist']['bodypart']].Position)
                        if Vis then
                            local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
                            if Diff < MaxDist and Diff < FOV then
                                MaxDist = Diff
                                Nearest = V
                            end
                        end
                    end
                else
                    local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[getgenv().Aimbot['Aim Assist']['bodypart']].Position)
                    if Vis then
                        local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
                        if Diff < MaxDist and Diff < FOV then
                            MaxDist = Diff
                            Nearest = V
                        end
                    end
                end
            end
        end
    end
    return Nearest
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode[getgenv().Aimbot['Aim Assist']['keybind']] then
        Active = not Active
        getgenv().Aimbot['Aim Assist']['enable'] = Active
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if Active then
        local Hoe = ClosestHoe()
        if Hoe and Hoe.Character and Hoe.Character:FindFirstChild(getgenv().Aimbot['Aim Assist']['bodypart']) then
            local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(Hoe.Character[getgenv().Aimbot['Aim Assist']['bodypart']].Position)
            if Vis then
                mousemoverel(Pos.X - Mouse.X, Pos.Y - Mouse.Y)
            end
        end
--//

local function wrd2bro()
    local Players = game:GetService('Players')
    local RunService = game:GetService('RunService')
    local LocalPlayer = Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    local Toggle = true
    local CurrentlyPressed = false

    Mouse.KeyDown:Connect(function(key)
        if key == getgenv().Aimbot['Triggerbot']['Keybind'] then
            Toggle = not Toggle
        end
    end)

    RunService.RenderStepped:Connect(function()
        if Toggle and getgenv().Aimbot['Triggerbot']['enable'] then
            if Mouse.Target and Mouse.Target.Parent:FindFirstChild('Humanoid') then
                if not CurrentlyPressed then
                    CurrentlyPressed = true
                    mouse1press()
                end
            else
                CurrentlyPressed = false
                mouse1release()
            end            
        end
    end)
end

task.spawn(wrd2bro)

local function wrd()
    while true do
        for a = 1, 360, 1 do
            task.wait(0.1)
        end
    end
end

if getgenv().Aimbot['Triggerbot']['teamcheck'] then
    if V.Team ~= game:GetService("Players").LocalPlayer.Team then
    end
end
task.spawn(wrd)