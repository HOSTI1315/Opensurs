--@rznnq ui 
--ESP TIMER BASES DISCORD @rznnq (working in STEAL A BRAINROT uwu)
local RunService = game:GetService("RunService")
local plotsFolder = workspace:FindFirstChild("Plots")
local baseEspInstances = {}
local espBaseThread
local function createBaseESP(plot, mainPart)
    if baseEspInstances[plot.Name] then
        baseEspInstances[plot.Name]:Destroy()
    end
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "rznnq" .. plot.Name
    billboard.Size = UDim2.new(0, 50, 0, 25)
    billboard.StudsOffset = Vector3.new(0, 5, 0)
    billboard.AlwaysOnTop = true
    billboard.Adornee = mainPart
    billboard.MaxDistance = 1000
    billboard.Parent = plot
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextScaled = true
    label.Font = Enum.Font.Arcade
    label.TextColor3 = Color3.fromRGB(255, 255, 0)
    label.TextStrokeTransparency = 0
    label.TextStrokeColor3 = Color3.new(0, 0, 0)
    label.Parent = billboard
    baseEspInstances[plot.Name] = billboard
    return billboard
end
local function updateBaseESP()
    if not plotsFolder then return end

    for _, plot in ipairs(plotsFolder:GetChildren()) do
        local purchases = plot:FindFirstChild("Purchases")
        local plotBlock = purchases and purchases:FindFirstChild("PlotBlock")
        local mainPart = plotBlock and plotBlock:FindFirstChild("Main")
        local billboard = baseEspInstances[plot.Name]

        local timeLabel = mainPart
            and mainPart:FindFirstChild("BillboardGui")
            and mainPart.BillboardGui:FindFirstChild("RemainingTime")

        if timeLabel and mainPart then
            billboard = billboard or createBaseESP(plot, mainPart)
            local label = billboard:FindFirstChildWhichIsA("TextLabel")
            if label then
                label.Text = timeLabel.Text
            end
        elseif billboard then
            billboard:Destroy()
            baseEspInstances[plot.Name] = nil
        end
    end
end
espBaseThread = RunService.RenderStepped:Connect(updateBaseESP)
