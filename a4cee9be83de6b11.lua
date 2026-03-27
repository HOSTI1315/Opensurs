

if game:GetService("CoreGui"):FindFirstChild("ToraScript") then
    game:GetService("CoreGui").ToraScript:Destroy()
end
local v1 = game:HttpGet("https://rawscripts.net/raw/Steal-a-Brainrot-Anti-Kick-Bypass-41960")
loadstring(v1)()
local v2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/liebertsx/Tora-Library/main/src/librarynew", true))()
local v3 = v2:CreateWindow("Steal a Brainrot")
local vu4 = game:GetService("TweenService")
local vu5 = game:GetService("Players").LocalPlayer
v3:AddButton({
    text = "Instant Steals",
    flag = "button",
    callback = function()
        local v6 = vu5:WaitForChild("PlayerGui")
        local v7 = v6:FindFirstChild("LoadingBarGui")
        if not v7 then
            v7 = Instance.new("ScreenGui")
            v7.Name = "LoadingBarGui"
            v7.ResetOnSpawn = false
            v7.Parent = v6
            local v8 = Instance.new("Frame", v7)
            v8.Name = "MainFrame"
            v8.Size = UDim2.new(0, 300, 0, 30)
            v8.Position = UDim2.new(0.5, - 150, 0.8, 0)
            v8.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            v8.BorderSizePixel = 0
            v8.Visible = false
            Instance.new("UICorner", v8).CornerRadius = UDim.new(0, 10)
            local v9 = Instance.new("Frame", v8)
            v9.Name = "Bar"
            v9.Size = UDim2.new(0, 0, 1, 0)
            v9.Position = UDim2.new(0, 0, 0, 0)
            v9.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            v9.BorderSizePixel = 0
            Instance.new("UICorner", v9).CornerRadius = UDim.new(0, 10)
            local v10 = Instance.new("TextLabel", v8)
            v10.Name = "Label"
            v10.Size = UDim2.new(1, 0, 1, 0)
            v10.Position = UDim2.new(0, 0, 0, 0)
            v10.BackgroundTransparency = 1
            v10.Text = "Wait..."
            v10.TextColor3 = Color3.new(1, 1, 1)
            v10.TextScaled = true
            v10.Font = Enum.Font.GothamBold
        end
        local v11 = v7.MainFrame
        local v12 = v11.Bar
        v11.Visible = true
        v12.Size = UDim2.new(0, 0, 1, 0)
        local v13 = vu4:Create(v12, TweenInfo.new(3, Enum.EasingStyle.Linear), {
            Size = UDim2.new(1, 0, 1, 0)
        })
        v13:Play()
        v13.Completed:Wait()
        v11.Visible = false
        local v14, v15, v16 = pairs(workspace.Plots:GetDescendants())
        while true do
            local v17
            v16, v17 = v14(v15, v16)
            if v16 == nil then
                break
            end
            if v17.Name == "DeliveryHitbox" then
                firetouchinterest(vu5.Character.HumanoidRootPart, v17, 0)
                wait()
                firetouchinterest(vu5.Character.HumanoidRootPart, v17, 1)
            end
        end
    end
})
v3:AddToggle({
    text = "HipHeight",
    flag = "toggle",
    state = false,
    callback = function(p18)
        _G.Height = p18
        print("Height: ", p18)
        if p18 then
            _G.Height = true
            while _G.Height do
                wait()
                pcall(function()
                    repeat
                        task.wait()
                        game.Players.LocalPlayer.Character.Humanoid.HipHeight = 19
                    until _G.Height == false
                    wait(1)
                end)
            end
        else
            _G.Height = false
            wait()
            game.Players.LocalPlayer.Character.Humanoid.HipHeight = 2
        end
    end
})
game:GetService("RunService")
local vu19 = {}
local function vu26(p20, p21)
    local v22 = Instance.new("BillboardGui")
    v22.Name = "CustomESP"
    v22.Size = UDim2.new(0, 120, 0, 50)
    local v23 = p20:IsA("BasePart") and p20 and p20 or p20:FindFirstChildWhichIsA("BasePart")
    if v23 then
        local v24 = Instance.new("Part")
        v24.Anchored = true
        v24.CanCollide = false
        v24.Transparency = 1
        v24.Size = Vector3.new(1, 1, 1)
        v24.CFrame = v23.CFrame * CFrame.new(0, 20, 0)
        v24.Parent = workspace
        v22.Adornee = v24
    else
        v22.Adornee = nil
    end
    v22.AlwaysOnTop = true
    v22.Parent = p20
    local v25 = Instance.new("TextLabel")
    v25.Size = UDim2.new(1, 0, 1, 0)
    v25.BackgroundTransparency = 1
    v25.TextColor3 = Color3.new(1, 0, 0)
    v25.TextStrokeTransparency = 0
    v25.Font = Enum.Font.SourceSansBold
    v25.TextScaled = true
    v25.Text = p21
    v25.Parent = v22
    return v22, v25
end
v3:AddToggle({
    text = "Locked ESP",
    flag = "toggle",
    state = false,
    callback = function(p27)
        _G.Locked = p27
        print("Locked: ", p27)
        if p27 then
            task.spawn(function()
                if not _G.Locked then
                    local v28, v29, v30 = pairs(vu19)
                    while true do
                        local v31
                        v30, v31 = v28(v29, v30)
                        if v30 == nil then
                            break
                        end
                        if v31.billboard and v31.billboard.Parent then
                            v31.billboard:Destroy()
                        end
                        if v31.adorneePartClone and v31.adorneePartClone.Parent then
                            v31.adorneePartClone:Destroy()
                        end
                    end
                    vu19 = {}
                    return
                end
                local v32, v33, v34 = pairs(workspace.Plots:GetChildren())
                while true do
                    local v35
                    v34, v35 = v32(v33, v34)
                    if v34 == nil then
                        break
                    end
                    local v36 = v35:FindFirstChild("Purchases")
                    if v36 then
                        v36 = v36:FindFirstChild("PlotBlock")
                    end
                    if v36 then
                        v36 = v36:FindFirstChild("Main")
                    end
                    if v36 then
                        v36 = v36:FindFirstChild("BillboardGui")
                    end
                    if v36 then
                        local v37, v38, v39 = pairs(v36:GetDescendants())
                        while true do
                            local v40
                            v39, v40 = v37(v38, v39)
                            if v39 == nil then
                                break
                            end
                            if v40.Name == "Locked" and v40.Visible == true then
                                local v41 = v40.Parent.Parent.Parent.Parent.Parent
                                local v42 = "Locked: " .. (v40.Parent:FindFirstChild("RemainingTime") and v40.Parent.RemainingTime.Text or "No Time")
                                if vu19[v41] then
                                    vu19[v41].label.Text = v42
                                    if vu19[v41].adorneePartClone and v41:IsA("BasePart") then
                                        vu19[v41].adorneePartClone.CFrame = v41.CFrame * CFrame.new(0, 20, 0)
                                    end
                                else
                                    local v43, v44 = vu26(v41, v42)
                                    vu19[v41] = {
                                        billboard = v43,
                                        label = v44,
                                        adorneePartClone = v43.Adornee
                                    }
                                end
                            end
                        end
                    end
                end
                local v45, v46, v47 = pairs(vu19)
                local v48, v49, v50 = pairs(workspace.Plots:GetChildren())
                local v51 = v47
                local v52 = false
                while true do
                    local v53
                    v50, v53 = v48(v49, v50)
                    if v50 == nil then
                        break
                    end
                    local v54 = v53:FindFirstChild("Purchases")
                    if v54 then
                        v54 = v54:FindFirstChild("PlotBlock")
                    end
                    if v54 then
                        v54 = v54:FindFirstChild("Main")
                    end
                    if v54 then
                        v54 = v54:FindFirstChild("BillboardGui")
                    end
                    if v54 then
                        local v55, v56, v57 = pairs(v54:GetDescendants())
                        while true do
                            local v58
                            v57, v58 = v55(v56, v57)
                            if v57 == nil then
                                break
                            end
                            if v58.Name == "Locked" and (v58.Visible == true and v58.Parent.Parent.Parent.Parent.Parent == v51) then
                                v52 = true
                                break
                            end
                        end
                    end
                    if v52 then
                    end
                end
                if not v52 then
                    if v59.billboard and v59.billboard.Parent then
                        v59.billboard:Destroy()
                    end
                    if v59.adorneePartClone and v59.adorneePartClone.Parent then
                        v59.adorneePartClone:Destroy()
                    end
                    vu19[v51] = nil
                end
                local v59
                v47, v59 = v45(v46, v47)
                if v47 ~= nil then
                else
                end
                task.wait(1)
            end)
        else
            local v60, v61, v62 = pairs(vu19)
            while true do
                local v63
                v62, v63 = v60(v61, v62)
                if v62 == nil then
                    break
                end
                if v63.billboard and v63.billboard.Parent then
                    v63.billboard:Destroy()
                end
                if v63.adorneePartClone and v63.adorneePartClone.Parent then
                    v63.adorneePartClone:Destroy()
                end
            end
            vu19 = {}
        end
    end
})
local vu64 = game:GetService("Players")
game:GetService("RunService")
local vu65 = vu64.LocalPlayer
local vu66 = false
local vu67 = {}
local function vu74(p68)
    if not vu67[p68] then
        vu67[p68] = {}
        local v69, v70, v71 = ipairs(p68:GetChildren())
        while true do
            local v72
            v71, v72 = v69(v70, v71)
            if v71 == nil then
                break
            end
            if v72:IsA("BasePart") and v72.Name ~= "HumanoidRootPart" then
                local v73 = Instance.new("BoxHandleAdornment")
                v73.Size = v72.Size
                v73.Adornee = v72
                v73.AlwaysOnTop = true
                v73.ZIndex = 5
                v73.Color3 = Color3.fromRGB(255, 0, 0)
                v73.Transparency = 0.5
                v73.Name = "ESPPart"
                v73.Parent = v72
                table.insert(vu67[p68], v73)
            end
        end
    end
end
local function vu83()
    local v75, v76, v77 = pairs(vu67)
    while true do
        local v78
        v77, v78 = v75(v76, v77)
        if v77 == nil then
            break
        end
        local v79, v80, v81 = ipairs(v78)
        while true do
            local v82
            v81, v82 = v79(v80, v81)
            if v81 == nil then
                break
            end
            if v82 and v82.Parent then
                v82:Destroy()
            end
        end
    end
    vu67 = {}
end
task.spawn(function()
    while true do
        if vu66 then
            vu83()
            local v84 = vu64
            local v85, v86, v87 = pairs(v84:GetPlayers())
            while true do
                local v88
                v87, v88 = v85(v86, v87)
                if v87 == nil then
                    break
                end
                if v88 ~= vu65 and v88.Character and v88.Character:FindFirstChild("Humanoid") then
                    vu74(v88.Character)
                end
            end
        end
        task.wait(2)
    end
end)
v3:AddToggle({
    text = "Player ESP",
    flag = "esp_boxes",
    state = false,
    callback = function(p89)
        vu66 = p89
        if not p89 then
            vu83()
        end
    end
})
v3:AddToggle({
    text = "Instant Press",
    flag = "toggle",
    state = false,
    callback = function(p90)
        _G.Press = p90
        print("Press: ", p90)
        if p90 then
            Press()
        end
    end
})
function Press()
    spawn(function()
        _G.Press = true
        while _G.Press do
            wait()
            pcall(function()
                game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(p91)
                    fireproximityprompt(p91)
                end)
                wait(0.2)
            end)
        end
    end)
end
v3:AddButton({
    text = "Expand area",
    flag = "button",
    callback = function()
        local v92, v93, v94 = pairs(workspace.Map:GetChildren())
        while true do
            local v95
            v94, v95 = v92(v93, v94)
            if v94 == nil then
                break
            end
            if v95.Name == "Part" and v95.Size.Z == 4 then
                v95.Size = Vector3.new(v95.Size.X, v95.Size.Y, 20)
            end
        end
        local v96, v97, v98 = pairs(workspace.Map:GetChildren())
        while true do
            local v99
            v98, v99 = v96(v97, v98)
            if v98 == nil then
                break
            end
            if v99.Name == "Part" and v99.Size.X == 4 then
                v99.Size = Vector3.new(20, v99.Size.Y, v99.Size.Z)
            end
        end
        local v100, v101, v102 = pairs(workspace.Plots:GetDescendants())
        while true do
            local v103
            v102, v103 = v100(v101, v102)
            if v102 == nil then
                break
            end
            if v103.Name == "structure base home" and (v103.Size.X == 53 and v103.CFrame.Position.Y < 10) then
                v103.Size = Vector3.new(v103.Size.X, 70, v103.Size.Z)
            end
        end
    end
})
v3:AddButton({
    text = "Reset",
    flag = "button",
    callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})
v3:AddLabel({
    text = "YouTube: Tora IsMe"
})
v2:Init()