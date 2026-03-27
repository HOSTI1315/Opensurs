local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local DESYNC_FLAGS = {
    {"DFIntS2PhysicsSenderRate", "-30"},          
    {"WorldStepMax", "-1"},                                 
    {"DFIntTouchSenderMaxBandwidthBps", "-1"},            
    {"DFFlagUseClientAuthoritativePhysicsForHumanoids", "True"},
    {"DFFlagClientCharacterControllerPhysicsOverride", "True"},
    {"DFIntSimBlockLargeLocalToolWeldManipulationsThreshold", "-1"},
    {"DFIntClientPhysicsMaxSendRate", "2147483647"},
    {"DFIntPhysicsSenderRate", "2147483647"},
    {"DFIntClientPhysicsSendRate", "2147483647"},
    {"DFIntNetworkSendRate", "2147483647"},
    {"DFIntDebugSimPrimalNewtonIts", "0"},
    {"DFIntDebugSimPrimalPreconditioner", "0"},
    {"DFIntDebugSimPrimalPreconditionerMinExp", "0"},
    {"DFIntDebugSimPrimalToleranceInv", "0"},
    {"DFIntMinClientSimulationRadius", "2147000000"},
    {"DFIntMaxClientSimulationRadius", "2147000000"},
    {"DFIntClientSimulationRadiusBuffer", "2147000000"},
    {"DFIntMinimalSimRadiusBuffer", "2147000000"},
    {"DFIntSimVelocityCorrectionDampening", "0"},
    {"DFIntSimPositionCorrectionDampening", "0"},
    {"DFFlagDebugDisablePositionCorrection", "True"},
    {"GameNetPVHeaderRotationalVelocityZeroCutoffExponent", "-2147483647"},
    {"GameNetPVHeaderLinearVelocityZeroCutoffExponent", "-2147483647"},
    {"DFIntUnstickForceAttackInTenths", "-20"},
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "desync"
if gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = CoreGui
end

local MainButton = Instance.new("TextButton")
MainButton.Name = "DesyncMacro"
MainButton.Parent = ScreenGui
MainButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainButton.Position = UDim2.new(0.85, 0, 0.4, 0)
MainButton.Size = UDim2.new(0, 65, 0, 65)
MainButton.Font = Enum.Font.FredokaOne
MainButton.Text = "DESYNCOFF"
MainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MainButton.TextSize = 14
MainButton.AutoButtonColor = true

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(1, 0)
Corner.Parent = MainButton

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(255, 255, 255)
Stroke.Thickness = 3
Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Stroke.Parent = MainButton


local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainButton.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

MainButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)


local isMacroActive = false
local loopConnection = nil

local function spamFlags()
    if setfflag then
        for _, flagData in ipairs(DESYNC_FLAGS) do
            pcall(function()
                setfflag(flagData[1], flagData[2])
            end)
        end
    end
end

MainButton.MouseButton1Click:Connect(function()
    isMacroActive = not isMacroActive
    
    if isMacroActive then
        MainButton.Text = "DESYNCACTIVE"
        MainButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        Stroke.Color = Color3.fromRGB(255, 150, 150)
        loopConnection = RunService.RenderStepped:Connect(spamFlags)
        
    else
        MainButton.Text = "DESYNCOFF"
        MainButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        Stroke.Color = Color3.fromRGB(255, 255, 255)
        
        if loopConnection then
            loopConnection:Disconnect()
            loopConnection = nil
        end
        
        if setfflag then
            pcall(function()
                for _, flagData in ipairs(DESYNC_FLAGS) do
                    setfflag(flagData[1], "False")
                end
            end)
        end
    end
end)