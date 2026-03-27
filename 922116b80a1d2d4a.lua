if not game:IsLoaded() then
    game.Loaded:Wait()
end

if LoadingScriptSlap then
    return
end
LoadingScriptSlap = true
function TweenTp(Part, CFnew, Body, Speed)
    BodyEnter = Body
    if BodyEnter == true then
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") == nil then
            local bv = Instance.new("BodyVelocity")
            bv.Name = "VelocityHandler"
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            bv.MaxForce = Vector3.new(100000, 100000, 100000)
            bv.Velocity = Vector3.new(0, 0, 0)
        end
    end
    local Tween = game:GetService("TweenService"):Create(Part, TweenInfo.new(Speed, Enum.EasingStyle.Linear), {
        CFrame = CFnew
    })
    Tween:Play()
    Tween.Completed:Wait()
    Tween:Cancel()
    if BodyEnter == true then
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler:Destroy()
        end
    end
end
if game.CoreGui:FindFirstChild("Gui Track") == nil then
    local gui = Instance.new("ScreenGui", game.CoreGui)
    gui.Name = "Gui Track"
    gui.Enabled = false
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0.2, 0, 0.1, 0)
    Frame.Position = UDim2.new(0.02, 0, 0.87, 0)
    Frame.BackgroundColor3 = Color3.new(1, 1, 1)
    Frame.BorderColor3 = Color3.new(0, 0, 0)
    Frame.BorderSizePixel = 1
    Frame.Active = true
    Frame.BackgroundTransparency = 0
    Frame.Parent = gui
    local UICorner = Instance.new("UIStroke")
    UICorner.Color = Color3.new(0, 0, 0)
    UICorner.Thickness = 2.5
    UICorner.Parent = Frame
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Frame
    local Frame1 = Instance.new("Frame")
    Frame1.Size = UDim2.new(1, 0, 1, 0)
    Frame1.Position = UDim2.new(0, 0, 0, 0)
    Frame1.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Frame1.BorderColor3 = Color3.new(0, 0, 0)
    Frame1.BorderSizePixel = 1
    Frame1.Active = true
    Frame1.BackgroundTransparency = 0.3
    Frame1.Parent = Frame
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Frame1
    local Frame2 = Instance.new("Frame")
    Frame2.Name = "Frame1"
    Frame2.Size = UDim2.new(1, 0, 1, 0)
    Frame2.Position = UDim2.new(0, 0, 0, 0)
    Frame2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    Frame2.BorderColor3 = Color3.new(0, 0, 0)
    Frame2.BorderSizePixel = 1
    Frame2.Active = true
    Frame2.BackgroundTransparency = 0.15
    Frame2.Parent = Frame1
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Frame2
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Position = UDim2.new(0, 0, 0, 0)
    TextLabel.BackgroundColor3 = Color3.new(0, 0, 0)
    TextLabel.BorderColor3 = Color3.new(0, 0, 0)
    TextLabel.BorderSizePixel = 1
    TextLabel.Text = ""
    TextLabel.TextSize = 15
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextColor3 = Color3.new(0, 0, 0)
    TextLabel.Font = Enum.Font.Code
    TextLabel.TextWrapped = true
    TextLabel.Parent = Frame
end
if game.PlaceId == 6403373529 or game.PlaceId == 9015014224 or game.PlaceId == 11520107397 or game.PlaceId == 124596094333302 then
    if game.ReplicatedStorage:FindFirstChild("AdminGUI") then
        game.ReplicatedStorage.AdminGUI:Destroy()
    end
    if game.ReplicatedStorage:FindFirstChild("Ban") then
        game.ReplicatedStorage.Ban:Destroy()
    end
    if game.StarterPlayer.StarterPlayerScripts:FindFirstChild("ClientAnticheat") then
        game.StarterPlayer.StarterPlayerScripts.ClientAnticheat:Destroy()
    end
    if game.ReplicatedStorage:FindFirstChild("GRAB") then
        game.ReplicatedStorage.GRAB:Destroy()
    end
    if game.ReplicatedStorage:FindFirstChild("SpecialGloveAccess") then
        game.ReplicatedStorage.SpecialGloveAccess:Destroy()
    end
    if game.ReplicatedStorage:FindFirstChild("WalkSpeedChanged") then
        game.ReplicatedStorage.WalkSpeedChanged:Destroy()
    end
    _G.TimeNotify = 5

---Potion---
    _G.GetPotion = {
        ["Grug"] = {
            "Mushroom"
        },
        ["Nightmare"] = {
            "Dark Root",
            "Dark Root",
            "Dark Root"
        },
        ["Confusion"] = {
            "Red Crystal",
            "Blue Crystal",
            "Glowing Mushroom"
        },
        ["Power"] = {
            "Dire Flower",
            "Red Crystal",
            "Wild Vine"
        },
        ["Paralyzing"] = {
            "Plane Flower",
            "Plane Flower"
        },
        ["Haste"] = {
            "Autumn Sprout",
            "Jade Stone"
        },
        ["Invisibility"] = {
            "Hazel Lily",
            "Hazel Lily",
            "Blue Crystal"
        },
        ["Explosion"] = {
            "Red Crystal",
            "Fire Flower",
            "Fire Flower"
        },
        ["Invincible"] = {
            "Elder Wood",
            "Mushroom",
            "Mushroom"
        },
        ["Toxic"] = {
            "Dark Root",
            "Dark Root",
            "Blood Rose",
            "Red Crystal"
        },
        ["Freeze"] = {
            "Winter Rose",
            "Winter Rose",
            "Wild Vine",
            "Blue Crystal",
            "Glowing Mushroom"
        },
        ["Feather"] = {
            "Mushroom",
            "Hazel Lily"
        },
        ["Speed"] = {
            "Mushroom",
            "Mushroom",
            "Plane Flower",
            "Hazel Lily",
            "Blue Crystal"
        },
        ["Lethal"] = {
            "Blood Rose",
            "Blood Rose",
            "Blood Rose",
            "Blood Rose",
            "Blood Rose",
            "Blood Rose",
            "Blood Rose",
            "Blood Rose",
            "Blood Rose",
            "Blood Rose",
            "Dark Root",
            "Dark Root",
            "Dark Root",
            "Dark Root",
            "Dark Root",
            "Dark Root",
            "Dark Root",
            "Dark Root",
            "Dark Root",
            "Dark Root"
        },
        ["Slow"] = {
            "Mushroom",
            "Mushroom",
            "Blue Crystal",
            "Blue Crystal",
            "Jade Stone",
            "Plane Flower"
        },
        ["Antitoxin"] = {
            "Blue Crystal",
            "Glowing Mushroom",
            "Plane Flower",
            "Plane Flower",
            "Elder Wood"
        },
        ["Corrupted Vine"] = {
            "Wild Vine",
            "Wild Vine",
            "Wild Vine",
            "Blood Rose",
            "Dark Root",
            "Elder Wood",
            "Jade Stone"
        },
        ["Field"] = {
            "Hazel Lily",
            "Plane Flower",
            "Plane Flower"
        },
        ["Lost"] = {
            "Blue Crystal",
            "Elder Wood",
            "Elder Wood",
            "Elder Wood",
            "Red Crystal"
        }
    }

---GetSome---
    if game.Workspace:FindFirstChild("NametagChanged") == nil then
        local NametagChanged = Instance.new("StringValue", workspace)
        NametagChanged.Name = "NametagChanged"
        NametagChanged.Value = ""
        local SlapChanged = Instance.new("StringValue", NametagChanged)
        SlapChanged.Name = "SlapChanged"
        SlapChanged.Value = ""
        local GloveChanged = Instance.new("StringValue", NametagChanged)
        GloveChanged.Name = "GloveChanged"
        GloveChanged.Value = ""
    end
    function CheckUnlockGlove(Value)
        return game.Players.LocalPlayer:FindFirstChild("_unlockedGloves") and game.Players.LocalPlayer._unlockedGloves:FindFirstChild(Value)
    end

---SafeSpotBox---
    if workspace:FindFirstChild("SafeBox") == nil then
        local S = Instance.new("Part")
        S.Name = "SafeBox"
        S.Anchored = true
        S.CanCollide = true
        S.Transparency = .5
        S.Position = Vector3.new(- 5500, - 5000, - 5000)
        S.Size = Vector3.new(21, 5, 21)
        S.Parent = workspace
        local S1 = Instance.new("Part")
        S1.Name = "S1"
        S1.Anchored = true
        S1.CanCollide = true
        S1.Transparency = .5
        S1.Position = Vector3.new(- 5499.91, - 4991.5, - 4989.09)
        S1.Size = Vector3.new(20, 13, 2)
        S1.Parent = workspace:FindFirstChild("SafeBox")
        local S2 = Instance.new("Part")
        S2.Name = "S2"
        S2.Anchored = true
        S2.CanCollide = true
        S2.Transparency = .5
        S2.Position = Vector3.new(- 5510.27979, - 4991.5, - 5000.08984, - 4.47034836e-07, 0, 0.999999881, 0, 1, 0, - 0.999999881, 0, - 3.69319451e-07)
        S2.Size = Vector3.new(21, 14, 2)
        S2.Rotation = Vector3.new(0, - 90, 0)
        S2.Parent = workspace:FindFirstChild("SafeBox")
        local S3 = Instance.new("Part")
        S3.Name = "S3"
        S3.Anchored = true
        S3.CanCollide = true
        S3.Transparency = .5
        S3.Position = Vector3.new(- 5499.3, - 4991.5, - 5011.12)
        S3.Size = Vector3.new(21, 13, 2)
        S3.Parent = workspace:FindFirstChild("SafeBox")
        local S4 = Instance.new("Part")
        S4.Name = "S4"
        S4.Anchored = true
        S4.CanCollide = true
        S4.Transparency = .5
        S4.Position = Vector3.new(- 5489.97559, - 4991.5, - 4999.52637, - 4.37113883e-08, 0, 1, 0, 1, 0, - 1, 0, - 4.37113883e-08)
        S4.Size = Vector3.new(22, 13, 2)
        S4.Rotation = Vector3.new(0, - 90, 0)
        S4.Parent = workspace:FindFirstChild("SafeBox")
        local S5 = Instance.new("Part")
        S5.Name = "S5"
        S5.Anchored = true
        S5.CanCollide = true
        S5.Transparency = .5
        S5.Position = Vector3.new(- 5499.39, - 4984, - 5000.07)
        S5.Size = Vector3.new(24, 3, 24)
        S5.Parent = workspace:FindFirstChild("SafeBox")
    end

---Bed---
    if workspace:FindFirstChild("Bed") == nil then
        local Bed = Instance.new("Part")
        Bed.Name = "Bed"
        Bed.Anchored = true
        Bed.Position = Vector3.new(- 100019.5, 104, - 1500)
        Bed.Size = Vector3.new(0.01, 0.01, 10)
        Bed.Parent = workspace
        local B1 = Instance.new("Part")
        B1.Name = "Bed1"
        B1.Anchored = true
        B1.Position = Vector3.new(- 100025, 104, - 1500)
        B1.Size = Vector3.new(1, 6, 7)
        B1.BrickColor = BrickColor.new("Burnt Sienna")
        B1.Parent = workspace:FindFirstChild("Bed")
        local B2 = Instance.new("Part")
        B2.Name = "Bed2"
        B2.Anchored = true
        B2.Position = Vector3.new(- 100023, 104.5, - 1500)
        B2.Size = Vector3.new(2, 1, 6)
        B2.BrickColor = BrickColor.new("Mid gray")
        B2.Parent = workspace:FindFirstChild("Bed")
        local B3 = Instance.new("Part")
        B3.Name = "Bed3"
        B3.Anchored = true
        B3.Position = Vector3.new(- 100019, 104, - 1500)
        B3.Size = Vector3.new(11, 1, 7)
        B3.BrickColor = BrickColor.new("Crimson")
        B3.Parent = workspace:FindFirstChild("Bed")
        local B4 = Instance.new("Part")
        B4.Name = "Bed4"
        B4.Anchored = true
        B4.Position = Vector3.new(- 100013, 104, - 1500)
        B4.Size = Vector3.new(1, 6, 7)
        B4.BrickColor = BrickColor.new("Burnt Sienna")
        B4.Parent = workspace:FindFirstChild("Bed")
        local B5 = Instance.new("Part")
        B5.Name = "Bed5"
        B5.Anchored = true
        B5.Position = Vector3.new(- 100019, 103, - 1500)
        B5.Size = Vector3.new(11, 1, 7)
        B5.BrickColor = BrickColor.new("Dark orange")
        B5.Parent = workspace:FindFirstChild("Bed")
    end

---SafeSpot---
    if workspace:FindFirstChild("Safespot") == nil then
        local Safespot = Instance.new("Part", workspace)
        Safespot.Name = "Safespot"
        Safespot.Position = Vector3.new(10000, - 50, 10000)
        Safespot.Size = Vector3.new(500, 10, 500)
        Safespot.Anchored = true
        Safespot.CanCollide = true
        Safespot.Transparency = .5
        local Safespot1 = Instance.new("Part", workspace)
        Safespot1.Name = "DefendPart"
        Safespot1.Position = Vector3.new(10000.2, 13, 9752.45)
        Safespot1.Size = Vector3.new(500, 117, 5)
        Safespot1.Anchored = true
        Safespot1.CanCollide = true
        Safespot1.Transparency = .5
        Safespot1.Parent = game.workspace.Safespot
        local Safespot2 = Instance.new("Part", workspace)
        Safespot2.Name = "DefendPart1"
        Safespot2.Position = Vector3.new(10248.2, 13, 10002.4)
        Safespot2.Size = Vector3.new(5, 117, 496)
        Safespot2.Anchored = true
        Safespot2.CanCollide = true
        Safespot2.Transparency = .5
        Safespot2.Parent = game.workspace.Safespot
        local Safespot3 = Instance.new("Part", workspace)
        Safespot3.Name = "DefendPart2"
        Safespot3.Position = Vector3.new(9998.13, 13, 10247.2)
        Safespot3.Size = Vector3.new(497, 117, 6)
        Safespot3.Anchored = true
        Safespot3.CanCollide = true
        Safespot3.Transparency = .5
        Safespot3.Parent = game.workspace.Safespot
        local Safespot4 = Instance.new("Part", workspace)
        Safespot4.Name = "DefendPart3"
        Safespot4.Position = Vector3.new(9752.71, 13, 9999.28)
        Safespot4.Size = Vector3.new(7, 117, 490)
        Safespot4.Anchored = true
        Safespot4.CanCollide = true
        Safespot4.Transparency = .5
        Safespot4.Parent = game.workspace.Safespot
        local Safespot5 = Instance.new("Part", workspace)
        Safespot5.Name = "DefendPart4"
        Safespot5.Position = Vector3.new(10001.1, 76, 9999.66)
        Safespot5.Size = Vector3.new(491, 10, 491)
        Safespot5.Anchored = true
        Safespot5.CanCollide = true
        Safespot5.Transparency = .5
        Safespot5.Parent = game.workspace.Safespot
    end

---AntiVoidBadge---
    if workspace:FindFirstChild("Psycho") == nil then
        local Psycho = Instance.new("Part", workspace)
        Psycho.Position = Vector3.new(17800.9082, 2947, - 226.017517, - 0.248515129, 0.00487846136, - 0.968615651, 0.966844261, - 0.0594091415, - 0.248359889, - 0.0587562323, - 0.998221755, 0.0100474358)
        Psycho.Name = "Psycho"
        Psycho.Size = Vector3.new(2000, 1, 2000)
        Psycho.Material = "ForceField"
        Psycho.Anchored = true
        Psycho.Transparency = 1
        Psycho.CanCollide = false
        local Kraken = Instance.new("Part", Psycho)
        Kraken.Position = Vector3.new(221, 29, - 12632)
        Kraken.Name = "Kraken"
        Kraken.Size = Vector3.new(2000, 1, 2000)
        Kraken.Material = "ForceField"
        Kraken.Anchored = true
        Kraken.Transparency = 1
        Kraken.CanCollide = false
        local Retro1 = Instance.new("Part", Psycho)
        Retro1.Position = Vector3.new(- 16643.62890625, 770.0464477539062, 4707.8193359375)
        Retro1.Name = "Retro1"
        Retro1.Size = Vector3.new(2000, 1, 2000)
        Retro1.Material = "ForceField"
        Retro1.Anchored = true
        Retro1.Transparency = 1
        Retro1.CanCollide = false
        local Retro2 = Instance.new("Part", Retro1)
        Retro2.Position = Vector3.new(- 16862.791015625, - 7.879573822021484, 4791.55517578125)
        Retro2.Name = "Retro2"
        Retro2.Size = Vector3.new(2000, 1, 2000)
        Retro2.Material = "ForceField"
        Retro2.Anchored = true
        Retro2.Transparency = 1
        Retro2.CanCollide = false
        local Retro3 = Instance.new("Part", Retro1)
        Retro3.Position = Vector3.new(- 28023.3046875, - 219.92381286621094, 4906.6015625)
        Retro3.Name = "Retro3"
        Retro3.Size = Vector3.new(2000, 1, 2000)
        Retro3.Material = "ForceField"
        Retro3.Anchored = true
        Retro3.Transparency = 1
        Retro3.CanCollide = false
    end

---Anti Void---
    if workspace:FindFirstChild("BobWalk1") == nil then
        local BobWalk1 = Instance.new("Part", workspace)
        BobWalk1.CanCollide = false
        BobWalk1.Anchored = true
        BobWalk1.CFrame = CFrame.new(23.2798462, - 19.8447475, 1.83554196, - 1, 0, 0, 0, - 1, 0, 0, 0, 1)
        BobWalk1.Size = Vector3.new(1139.2593994140625, 1.5, 2048)
        BobWalk1.Name = "BobWalk1"
        BobWalk1.Transparency = 1
        local BobWalk2 = Instance.new("Part", BobWalk1)
        BobWalk2.CanCollide = false
        BobWalk2.Anchored = true
        BobWalk2.CFrame = CFrame.new(- 458.458344, - 9.25, 1.83554196, - 1, 0, 0, 0, - 1, 0, 0, 0, 1)
        BobWalk2.Size = Vector3.new(1139.2593994140625, 1.5, 2048)
        BobWalk2.Name = "BobWalk2"
        BobWalk2.Transparency = 1
        local BobWalk3 = Instance.new("Part", BobWalk1)
        BobWalk3.CanCollide = false
        BobWalk3.Anchored = true
        BobWalk3.CFrame = CFrame.new(- 690.65979, 47.25, 1.83554196, - 1, 0, 0, 0, - 1, 0, 0, 0, 1)
        BobWalk3.Size = Vector3.new(674.8563232421875, 0.6048492789268494, 2048)
        BobWalk3.Name = "BobWalk3"
        BobWalk3.Transparency = 1
        local BobWalk4 = Instance.new("Part", BobWalk1)
        BobWalk4.CanCollide = false
        BobWalk4.Anchored = true
        BobWalk4.CFrame = CFrame.new(402.964996, 29.25, 222.310089, - 1, 0, 0, 0, - 1, 0, 0, 0, 1)
        BobWalk4.Size = Vector3.new(379.88922119140625, 1.5, 160.8837127685547)
        BobWalk4.Name = "BobWalk4"
        BobWalk4.Transparency = 1
        local BobWalk5 = Instance.new("Part", BobWalk1)
        BobWalk5.CanCollide = false
        BobWalk5.Anchored = true
        BobWalk5.Orientation = Vector3.new(0, 0, 171.728)
        BobWalk5.CFrame = CFrame.new(178.719162, - 18.9417267, 1.83554196, - 0.989596844, - 0.143868446, 0, 0.143868446, - 0.989596844, 0, 0, 0, 1)
        BobWalk5.Size = Vector3.new(143.94830322265625, 1.5, 2048)
        BobWalk5.Name = "BobWalk5"
        BobWalk5.Transparency = 1
        local BobWalk6 = Instance.new("Part", BobWalk1)
        BobWalk6.CanCollide = false
        BobWalk6.Anchored = true
        BobWalk6.Orientation = Vector3.new(0, 0, 144.782)
        BobWalk6.CFrame = CFrame.new(- 309.152832, 15.4761791, 1.83554196, - 0.816968799, - 0.576681912, 0, 0.576681912, - 0.816968799, 0, 0, 0, 1)
        BobWalk6.Size = Vector3.new(110.13511657714844, 2.740000009536743, 2048)
        BobWalk6.Name = "BobWalk6"
        BobWalk6.Transparency = 1
        local BobWalk7 = Instance.new("Part", BobWalk1)
        BobWalk7.CanCollide = false
        BobWalk7.Anchored = true
        BobWalk7.Orientation = Vector3.new(0, 0, - 147.002)
        BobWalk7.CFrame = CFrame.new(174.971924, 5.34897423, 222.310089, - 0.838688731, 0.544611216, 0, - 0.544611216, - 0.838688731, 0, 0, 0, 1)
        BobWalk7.Size = Vector3.new(89.76103210449219, 1.5, 160.8837127685547)
        BobWalk7.Name = "BobWalk7"
        BobWalk7.Transparency = 1
        local BobWalk8 = Instance.new("Part", BobWalk1)
        BobWalk8.CanCollide = false
        BobWalk8.Anchored = true
        BobWalk8.Orientation = Vector3.new(0.001, - 90.002, - 138.076)
        BobWalk8.CFrame = CFrame.new(402.965027, 5.49165154, 74.8157959, 2.98023224e-05, - 1.14142895e-05, - 1, - 0.668144584, - 0.744031429, - 1.14142895e-05, - 0.744031489, 0.668144584, - 2.98023224e-05)
        BobWalk8.Size = Vector3.new(74.23055267333984, 1, 379.88922119140625)
        BobWalk8.Name = "BobWalk8"
        BobWalk8.Transparency = 1
        local BobWalk9 = Instance.new("Part", BobWalk1)
        BobWalk9.CanCollide = false
        BobWalk9.Anchored = true
        BobWalk9.CFrame = CFrame.new(402.964996, 29.9136467, 121.981705, - 1, 0, 0, 0, - 1, 0, 0, 0, 1)
        BobWalk9.Size = Vector3.new(379.88922119140625, 1.5, 39.77305603027344)
        BobWalk9.Name = "BobWalk9"
        BobWalk9.Transparency = 1
        local BobWalk10 = Instance.new("WedgePart", BobWalk1)
        BobWalk10.CanCollide = false
        BobWalk10.Anchored = true
        BobWalk10.Orientation = Vector3.new(- 30.453, 117.775, - 102.906)
        BobWalk10.CFrame = CFrame.new(134.084229, - 17.8583984, 94.3953705, 0.541196942, - 0.354067981, 0.762719929, - 0.840263784, - 0.192543149, 0.506837189, - 0.0325982571, - 0.915184677, - 0.401714325)
        BobWalk10.Size = Vector3.new(1, 88.66793823242188, 34.42972946166992)
        BobWalk10.Name = "BobWalk10"
        BobWalk10.Transparency = 1
        local BobWalk11 = Instance.new("WedgePart", BobWalk1)
        BobWalk11.CanCollide = false
        BobWalk11.Anchored = true
        BobWalk11.Orientation = Vector3.new(- 29.779, 117.596, - 13.193)
        BobWalk11.CFrame = CFrame.new(168.441879, 2.46393585, 125.815231, - 0.350553155, - 0.534268022, 0.769201458, - 0.198098332, 0.845035911, 0.496660322, - 0.915352523, 0.0217281878, - 0.402067661)
        BobWalk11.Size = Vector3.new(1, 0.9999924302101135, 82.1865463256836)
        BobWalk11.Name = "BobWalk11"
        BobWalk11.Transparency = 1
        local BobWalk12 = Instance.new("WedgePart", BobWalk1)
        BobWalk12.CanCollide = false
        BobWalk12.Anchored = true
        BobWalk12.Orientation = Vector3.new(26.893, - 124.388, - 108.64)
        BobWalk12.CFrame = CFrame.new(206.315063, 26.9295502, 105.471031, 0.534210563, - 0.415855825, - 0.73599112, - 0.845072925, - 0.285055399, - 0.452321947, - 0.021697551, 0.863601387, - 0.503708005)
        BobWalk12.Size = Vector3.new(1, 13.53612232208252, 9.847718238830566)
        BobWalk12.Name = "BobWalk12"
        BobWalk12.Transparency = 1
        local BobWalk13 = Instance.new("WedgePart", BobWalk1)
        BobWalk13.CanCollide = false
        BobWalk13.Anchored = true
        BobWalk13.Orientation = Vector3.new(- 26.893, 55.613, 108.64)
        BobWalk13.CFrame = CFrame.new(165.965088, 2.12955856, 77.8575592, - 0.53421092, - 0.415855944, 0.735991359, 0.845073164, - 0.285055757, 0.452322066, 0.0216975808, 0.863601625, 0.503708005)
        BobWalk13.Size = Vector3.new(1, 13.53612232208252, 99.8001480102539)
        BobWalk13.Name = "BobWalk13"
        BobWalk13.Transparency = 1
        local BobWalk14 = Instance.new("WedgePart", BobWalk1)
        BobWalk14.CanCollide = false
        BobWalk14.Anchored = true
        BobWalk14.Orientation = Vector3.new(- 0.001, 90.003, 48.072)
        BobWalk14.CFrame = CFrame.new(172.67041, 5.49164963, 74.8157959, - 4.58955765e-05, 2.05039978e-05, 1, 0.743987858, 0.668193102, 2.05039978e-05, - 0.668193102, 0.743987858, - 4.58955765e-05)
        BobWalk14.Size = Vector3.new(1, 74.23055267333984, 80.699951171875)
        BobWalk14.Name = "BobWalk14"
        BobWalk14.Transparency = 1
        local BobWalk15 = Instance.new("WedgePart", BobWalk1)
        BobWalk15.CanCollide = false
        BobWalk15.Anchored = true
        BobWalk15.Orientation = Vector3.new(0, 0, 106.498)
        BobWalk15.CFrame = CFrame.new(212.753906, 30.0632439, 121.981705, - 0.283976078, - 0.95883137, 0, 0.95883137, - 0.283976078, 0, 0, 0, 1)
        BobWalk15.Size = Vector3.new(1, 0.8520558476448059, 39.773048400878906)
        BobWalk15.Name = "BobWalk15"
        BobWalk15.Transparency = 1
        local BobWalk16 = Instance.new("WedgePart", BobWalk1)
        BobWalk16.CanCollide = false
        BobWalk16.Anchored = true
        BobWalk16.Orientation = Vector3.new(29.777, - 62.406, - 75.066)
        BobWalk16.CFrame = CFrame.new(212.884216, 30.1233234, 121.984734, 0.544644356, 0.33412537, - 0.769235253, - 0.838644743, 0.223680317, - 0.496630788, 0.00612583756, 0.915602207, 0.402038693)
        BobWalk16.Size = Vector3.new(1, 36.08900451660156, 16.739320755004883)
        BobWalk16.Name = "BobWalk16"
        BobWalk16.Transparency = 1
        local BobWalk17 = Instance.new("WedgePart", BobWalk1)
        BobWalk17.CanCollide = false
        BobWalk17.Anchored = true
        BobWalk17.Orientation = Vector3.new(- 29.777, 117.594, 75.066)
        BobWalk17.CFrame = CFrame.new(174.83577, 5.55865097, 141.871262, - 0.544644356, 0.33412537, 0.769235253, 0.838644743, 0.223680317, 0.496630788, - 0.00612583756, 0.915602207, - 0.402038693)
        BobWalk17.Size = Vector3.new(1, 36.08900451660156, 82.1865463256836)
        BobWalk17.Name = "BobWalk17"
        BobWalk17.Transparency = 1
        local BobWalk18 = Instance.new("WedgePart", BobWalk1)
        BobWalk18.CanCollide = false
        BobWalk18.Anchored = true
        BobWalk18.Orientation = Vector3.new(30.453, - 62.225, 102.906)
        BobWalk18.CFrame = CFrame.new(165.427338, 2.97219658, 77.884697, - 0.541196942, - 0.354067981, - 0.762719929, 0.840263784, - 0.192543149, - 0.506837189, 0.0325982571, - 0.915184677, 0.401714325)
        BobWalk18.Size = Vector3.new(1, 88.66793823242188, 47.76289749145508)
        BobWalk18.Name = "BobWalk18"
        BobWalk18.Transparency = 1
    end
    if workspace:FindFirstChild("VoidPart") == nil then
        local VoidPart = Instance.new("Part", workspace)
        VoidPart.Position = Vector3.new(- 80.5, - 10.005, - 246.5)
        VoidPart.Name = "VoidPart"
        VoidPart.Size = Vector3.new(2048, 1, 2048)
        VoidPart.Material = "ForceField"
        VoidPart.Anchored = true
        VoidPart.Transparency = 1
        VoidPart.CanCollide = false
        local VoidPart1 = Instance.new("Part", VoidPart)
        VoidPart1.Position = Vector3.new(0, - 50026.5, 0)
        VoidPart1.Name = "VoidPart1"
        VoidPart1.Size = Vector3.new(2048, 70, 2048)
        VoidPart1.Anchored = true
        VoidPart1.Transparency = 1
        VoidPart1.CanCollide = false
        local TournamentAntiVoid = Instance.new("Part", VoidPart)
        TournamentAntiVoid.Name = "TAntiVoid"
        TournamentAntiVoid.Size = Vector3.new(2048, 15, 2048)
        TournamentAntiVoid.Position = Vector3.new(3393, 228, 97)
        TournamentAntiVoid.Anchored = true
        TournamentAntiVoid.Transparency = 1
        TournamentAntiVoid.CanCollide = false
    end
elseif game.PlaceId == 9431156611 then
    if hookmetamethod and getnamecallmethod then
        local bypass;
        bypass = hookmetamethod(game, "__namecall", function(method, ...)
            if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Events.Ban then
                return
            elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Events.AdminGUI then
                return
            elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Events.WS then
                return
            elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Events.WS2 then
                return
            end
            return bypass(method, ...)
        end)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Error",
            Text = "Bypass Success ",
            Icon = "rbxassetid://7733658504",
            Duration = _G.TimeNotify
        })
    elseif not hookmetamethod and not getnamecallmethod then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Error",
            Text = "You cannot bypass, you must be careful",
            Icon = "rbxassetid://7733658504",
            Duration = _G.TimeNotify
        })
    end
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/LinoriaLib/Test.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/LinoriaLib/addons/ThemeManagerCopy.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/LinoriaLib/addons/SaveManagerCopy.lua"))()
local Options = Library.Options
local Toggles = Library.Toggles

function Notification(Message, Time)
    if _G.ChooseNotify == "Obsidian" then
        Library:Notify(Message, Time or 5)
    elseif _G.ChooseNotify == "Roblox" then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Error",
            Text = Message,
            Icon = "rbxassetid://7733658504",
            Duration = Time or 5
        })
    end
    if _G.NotificationSound then
        local sound = Instance.new("Sound", workspace)
        sound.SoundId = "rbxassetid://4590662766"
        sound.Volume = _G.VolumeTime or 2
        sound.PlayOnRemove = true
        sound:Destroy()
    end
end

Library:SetDPIScale(85)
    
if game.PlaceId == 6403373529 or game.PlaceId == 9015014224 or game.PlaceId == 11520107397 or game.PlaceId == 124596094333302 then
    local Window = Library:CreateWindow({
        Title = "Slap Battles 👏",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Info", "rbxassetid://7734053426"),
        Tab1 = Window:AddTab("Script", "rbxassetid://8997387937"),
        Tab2 = Window:AddTab("Anti", "rbxassetid://7734056608"),
        Tab3 = Window:AddTab("Badges", "rbxassetid://7733673987"),
        Tab4 = Window:AddTab("Local", "rbxassetid://4335489011"),
        Tab5 = Window:AddTab("Misc", "rbxassetid://4370318685"),
        Tab6 = Window:AddTab("Gloves Optional", "rbxassetid://7733955740"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local InfoServer1Group = Tabs.Tab:AddLeftGroupbox("Server")
    CanYouFps = InfoServer1Group:AddLabel("Your Fps [ " .. math.floor(workspace:GetRealPhysicsFPS()) .. " ]", true)
    CanYouPing = InfoServer1Group:AddLabel("Your Ping [ " .. game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString() .. " ]", true)
    ServerPlayer = InfoServer1Group:AddLabel("Player In Server [ " .. # game.Players:GetPlayers() .. " / " .. game.Players.MaxPlayers .. " ]", true)
    TimeServer = InfoServer1Group:AddLabel("Server Time [ " .. math.floor(workspace.DistributedGameTime / 60 / 60) .. " Hour | " .. math.floor(workspace.DistributedGameTime / 60) - (math.floor(workspace.DistributedGameTime / 60 / 60) * 60) .. " Minute | " .. math.floor(workspace.DistributedGameTime) - (math.floor(workspace.DistributedGameTime / 60) * 60) .. " Second ]", true)
    TimeNow = InfoServer1Group:AddLabel("Now Time [ " .. os.date("%X") .. " ]", true)
    if tonumber(os.date("%H")) >= 5 and tonumber(os.date("%H")) < 12 then
        AlarmTime = InfoServer1Group:AddLabel("Good Morning [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
    elseif tonumber(os.date("%H")) >= 12 and tonumber(os.date("%H")) < 17 then
        AlarmTime = InfoServer1Group:AddLabel("Good Afternoon [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
    elseif tonumber(os.date("%H")) >= 17 and tonumber(os.date("%H")) < 21 then
        AlarmTime = InfoServer1Group:AddLabel("Good Evening [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
    else
        AlarmTime = InfoServer1Group:AddLabel("Good Night [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
    end
    AgeAccYou = InfoServer1Group:AddLabel("You Account Age [ " .. game.Players.LocalPlayer.AccountAge .. " ]", true)
    if game.Workspace:FindFirstChild("RoomsFolder") then
        PocketSpawn = {}
        for i, v in pairs(game.Workspace.RoomsFolder:GetChildren()) do
            if string.find(v.Name, "'s Room") then
                table.insert(PocketSpawn, v)
            end
        end
    end
    if # PocketSpawn == 0 then
        PocketKeypad = InfoServer1Group:AddLabel("Pocket Room [ No ]", true)
    elseif # PocketSpawn > 0 then
        PocketKeypad = InfoServer1Group:AddLabel("Pocket Room [ Yes ] [ " .. # PocketSpawn .. " ]", true)
    end
    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
        ResetTime = InfoServer1Group:AddLabel("Time Spawn [ " .. game.Players.RespawnTime .. " ]", true)
    else
        ResetTime = InfoServer1Group:AddLabel("Time Spawn [ Not Dead ]", true)
    end
    CodeKeypad = InfoServer1Group:AddLabel("Code Keypad [ " .. tostring((# game.Players:GetPlayers()) * 25 + 1100 - 7) .. " ]", true)
    if not game.Workspace:FindFirstChild("Keypad") then
        KeypadSpawn = InfoServer1Group:AddLabel("Keypad Spawn [ No ]", true)
    else
        KeypadSpawn = InfoServer1Group:AddLabel("Keypad Spawn [ Yes ]", true)
    end
    if not game.Workspace:FindFirstChild("Toolbox") then
        ToolboxSpawn = InfoServer1Group:AddLabel("Player Spawn Toolbox [ No ]", true)
    else
        ToolboxSpawn = InfoServer1Group:AddLabel("Player Spawn Toolbox [ Yes ]", true)
    end
    if not game.Workspace:FindFirstChild("Gravestone") then
        GravestoneSpawn = InfoServer1Group:AddLabel("Gravestone Spawn [ No ]", true)
    else
        GravestoneSpawn = InfoServer1Group:AddLabel("Gravestone Spawn [ Yes ]", true)
    end
    if not game.Workspace:FindFirstChild("Gift") then
        GiftSpawn = InfoServer1Group:AddLabel("Player Spawn Gift [ No ]", true)
    else
        GiftSpawn = InfoServer1Group:AddLabel("Player Spawn Gift [ Yes ]", true)
    end
    if workspace.Arena.island5.Slapples:FindFirstChild("GoldenSlapple") and workspace.Arena.island5.Slapples.GoldenSlapple:FindFirstChild("Glove") and workspace.Arena.island5.Slapples.GoldenSlapple.Glove.Transparency == 1 then
        GoldenSlappleSpawn = InfoServer1Group:AddLabel("Golden Slapple Spawn [ No ]", true)
    else
        GoldenSlappleSpawn = InfoServer1Group:AddLabel("Golden Slapple Spawn [ Yes ]", true)
    end
    if game.Workspace:FindFirstChild("JetOrb") then
        OrbSpawn = InfoServer1Group:AddLabel("Spawn Orb [ Jet ]", true)
    elseif game.Workspace:FindFirstChild("PhaseOrb") then
        OrbSpawn = InfoServer1Group:AddLabel("Spawn Orb [ Phase ]", true)
    elseif game.Workspace:FindFirstChild("SiphonOrb") then
        OrbSpawn = InfoServer1Group:AddLabel("Spawn Orb [ Siphon ]", true)
    elseif game.Workspace:FindFirstChild("MATERIALIZEOrb") then
        OrbSpawn = InfoServer1Group:AddLabel("Spawn Orb [ MATERIALIZE ]", true)
    else
        OrbSpawn = InfoServer1Group:AddLabel("Spawn Orb [ No ]", true)
    end
    CheckNullShards = InfoServer1Group:AddLabel("Check Null Shard [ " .. game.ReplicatedStorage.PlayerData[game.Players.LocalPlayer.Name].NullShards.Value .. " ]", true)
    CheckTournamentWins = InfoServer1Group:AddLabel("Check Tournament Win [ " .. game.ReplicatedStorage.PlayerData[game.Players.LocalPlayer.Name].TournamentWins.Value .. " ]", true)
    CheckSlap = InfoServer1Group:AddLabel("Check Slap [ " .. game.Players.LocalPlayer.leaderstats.Slaps.Value .. " ]", true)
    Glove = {}
    for i, v in pairs(game.Workspace.Lobby.GloveStands:GetChildren()) do
        if v.Name ~= "Unknown" then
            table.insert(Glove, v)
        end
    end
    InfoServer1Group:AddLabel("Much Glove [ " .. # Glove .. " ]", true)
    GloveCheck = InfoServer1Group:AddLabel("You're Using Glove [ " .. game.Players.LocalPlayer.leaderstats.Glove.Value .. " ]", true)
    PlateTime = InfoServer1Group:AddLabel("Plate Time [ " .. game.Players.LocalPlayer.PlayerGui.PlateIndicator.TextLabel.Text .. " ]", true)
    GravityYou = InfoServer1Group:AddLabel("Gravity [ " .. game.Workspace.Gravity .. " ]")
    PositionYou = InfoServer1Group:AddLabel("Position In Your [ " .. tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X) .. ", " .. math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y) .. ", " .. math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)) .. " ]", true)
    local InfoServer3Group = Tabs.Tab:AddLeftGroupbox("Glove Badge / Slap")
    local BadgeSuccess = {}
    local BadgeFailure = {}
    for i, v in pairs(game.Players.LocalPlayer._unlockedGloves:GetChildren()) do
        if v.Value == true then
            table.insert(BadgeSuccess, v)
        end
        if v.Value == false then
            table.insert(BadgeFailure, v)
        end
    end
    InfoServer3Group:AddInput("Players", {
        Default = "",
        Numeric = false,
        Text = "",
        Finished = true,
        Placeholder = "Username",
        Callback = function(Value)
            if Value ~= "" or Value ~= " " then
                local PlayerTarget = Value
                local PlayerTa
                for _, v in pairs(game.Players:GetPlayers()) do
                    if string.sub(v.Name, 1, # PlayerTarget):lower() == PlayerTarget:lower() then
                        PlayerTa = v
                        break
                    end
                end
                if PlayerTa then
                    _G.CheckGlovePlayer = PlayerTa.Name
                    PlayersCheck:SetText("Player Check [ ✅ ] [ " .. _G.CheckGlovePlayer .. " ]", _G.TimeNotify)
                else
                    PlayersCheck:SetText("Player Check [ ❌ ]", _G.TimeNotify)
                end
            end
        end
    })
    GeneralBadge = InfoServer3Group:AddLabel("General Glove / Badge [ ✅ - " .. (# BadgeSuccess == 0 and "Nah" or # BadgeSuccess) .. " / ❌ - " .. (# BadgeFailure == 0 and "Nah" or # BadgeFailure) .. " ]", true)
    PlayersCheck = InfoServer3Group:AddLabel("Player Check [ User ]", true)
    InfoServer3Group:AddButton({
        Text = "Check Glove / Badge",
        Func = function()
            local BadgeSuccess = {}
            local BadgeFailure = {}
            local PlayerTarg = game.Players:FindFirstChild(_G.CheckGlovePlayer) or game.Players.LocalPlayer
            local UnlockedGloves = PlayerTarg:FindFirstChild("_unlockedGloves")
            for i, v in pairs(UnlockedGloves:GetChildren()) do
                if v.Value == true then
                    table.insert(BadgeSuccess, v)
                end
                if v.Value == false then
                    table.insert(BadgeFailure, v)
                end
            end
            GeneralBadge:SetText("General Glove / Badge [ ✅ - " .. (# BadgeSuccess == 0 and "Nah" or # BadgeSuccess) .. " / ❌ - " .. (# BadgeFailure == 0 and "Nah" or # BadgeFailure) .. " ]", true)
            for i, v in pairs(UnlockedGloves:GetChildren()) do
                GloveBadges["Check " .. v.Name]:SetText("Glove [ " .. v.Name .. " - " .. (v.Value == true and "✅" or "❌") .. " ]", true)
            end
        end
    })
    GloveBadges = {}
    for i, v in pairs(game.Players.LocalPlayer._unlockedGloves:GetChildren()) do
        GloveBadges["Check " .. v.Name] = InfoServer3Group:AddLabel("Glove [ " .. v.Name .. " - " .. (v.Value == true and "✅" or "❌") .. " ]", true)
    end
    local InfoServer2Group = Tabs.Tab:AddRightGroupbox("Toggle Return")
    InfoServer2Group:AddToggle("Toggle Set", {
        Text = "Toggle Return",
        Default = false,
        Callback = function(Value)
            _G.AutoSetInfo = Value
            if _G.AutoSetInfo == true then
                AutoSetInfoServer = game:GetService("RunService").RenderStepped:Connect(function()
                    if _G.AutoSetInfo == true then
                        CanYouFps:SetText("Your Fps [ " .. math.floor(workspace:GetRealPhysicsFPS()) .. " ]")
                        CanYouPing:SetText("Your Ping [ " .. game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString() .. " ]")
                        ServerPlayer:SetText("Player In Server [ " .. # game.Players:GetPlayers() .. " / " .. game.Players.MaxPlayers .. " ]", true)
                        TimeServer:SetText("Server Time [ " .. math.floor(workspace.DistributedGameTime / 60 / 60) .. " Hour | " .. math.floor(workspace.DistributedGameTime / 60) - (math.floor(workspace.DistributedGameTime / 60 / 60) * 60) .. " Minute | " .. math.floor(workspace.DistributedGameTime) - (math.floor(workspace.DistributedGameTime / 60) * 60) .. " Second ]")
                        TimeNow:SetText("Now Time [ " .. os.date("%X") .. " ]")
                        if tonumber(os.date("%H")) >= 5 and tonumber(os.date("%H")) < 12 then
                            AlarmTime:SetText("Good Morning [ " .. tonumber(os.date("%H")) .. " Hour ]")
                        elseif tonumber(os.date("%H")) >= 12 and tonumber(os.date("%H")) < 17 then
                            AlarmTime:SetText("Good Afternoon [ " .. tonumber(os.date("%H")) .. " Hour ]")
                        elseif tonumber(os.date("%H")) >= 17 and tonumber(os.date("%H")) < 21 then
                            AlarmTime:SetText("Good Evening [ " .. tonumber(os.date("%H")) .. " Hour ]")
                        else
                            AlarmTime:SetText("Good Night [ " .. tonumber(os.date("%H")) .. " Hour ]")
                        end
                        if game.Workspace:FindFirstChild("RoomsFolder") then
                            PocketSpawn = {}
                            for i, v in pairs(game.Workspace.RoomsFolder:GetChildren()) do
                                if string.find(v.Name, "'s Room") then
                                    table.insert(PocketSpawn, v)
                                end
                            end
                        end
                        if # PocketSpawn == 0 then
                            PocketKeypad:SetText("Pocket Room [ No ]")
                        elseif # PocketSpawn > 0 then
                            PocketKeypad:SetText("Pocket Room [ Yes ] [ " .. # PocketSpawn .. " ]")
                        end
                        AgeAccYou:SetText("You Account Age [ " .. game.Players.LocalPlayer.AccountAge .. " ]")
                        if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                            ResetTime:SetText("Time Spawn [ " .. game.Players.RespawnTime .. " ]")
                        else
                            ResetTime:SetText("Time Spawn [ Not Dead ]")
                        end
                        CodeKeypad:SetText("Code Keypad [ " .. tostring((# game.Players:GetPlayers()) * 25 + 1100 - 7) .. " ]")
                        if not game.Workspace:FindFirstChild("Keypad") then
                            KeypadSpawn:SetText("Keypad Spawn [ No ]")
                        else
                            KeypadSpawn:SetText("Keypad Spawn [ Yes ]")
                        end
                        if not game.Workspace:FindFirstChild("Toolbox") then
                            ToolboxSpawn:SetText("Player Spawn Toolbox [ No ]")
                        else
                            ToolboxSpawn:SetText("Player Spawn Toolbox [ Yes ]")
                        end
                        if not game.Workspace:FindFirstChild("Gravestone") then
                            GravestoneSpawn:SetText("Gravestone Spawn [ No ]")
                        else
                            GravestoneSpawn:SetText("Gravestone Spawn [ Yes ]")
                        end
                        if not game.Workspace:FindFirstChild("Gift") then
                            GiftSpawn:SetText("Player Spawn Gift [ No ]")
                        else
                            GiftSpawn:SetText("Player Spawn Gift [ Yes ]")
                        end
                        if workspace.Arena.island5.Slapples:FindFirstChild("GoldenSlapple") and workspace.Arena.island5.Slapples.GoldenSlapple:FindFirstChild("Glove") and workspace.Arena.island5.Slapples.GoldenSlapple.Glove.Transparency == 1 then
                            GoldenSlappleSpawn:SetText("Golden Slapple Spawn [ No ]")
                        else
                            GoldenSlappleSpawn:SetText("Golden Slapple Spawn [ Yes ]")
                        end
                        if game.Workspace:FindFirstChild("JetOrb") then
                            OrbSpawn:SetText("Spawn Orb [ Jet ]")
                        elseif game.Workspace:FindFirstChild("PhaseOrb") then
                            OrbSpawn:SetText("Spawn Orb [ Phase ]")
                        elseif game.Workspace:FindFirstChild("SiphonOrb") then
                            OrbSpawn:SetText("Spawn Orb [ Siphon ]")
                        elseif game.Workspace:FindFirstChild("MATERIALIZEOrb") then
                            OrbSpawn:SetText("Spawn Orb [ MATERIALIZE ]")
                        else
                            OrbSpawn:SetText("Spawn Orb [ No ]")
                        end
                        CheckNullShards:SetText("Check Null Shard [ " .. game.ReplicatedStorage.PlayerData[game.Players.LocalPlayer.Name].NullShards.Value .. " ]")
                        CheckTournamentWins:SetText("Check Tournament Win [ " .. game.ReplicatedStorage.PlayerData[game.Players.LocalPlayer.Name].TournamentWins.Value .. " ]")
                        CheckSlap:SetText("Check Slap [ " .. game.Players.LocalPlayer.leaderstats.Slaps.Value .. " ]")
                        GloveCheck:SetText("You're Using Glove [ " .. game.Players.LocalPlayer.leaderstats.Glove.Value .. " ]")
                        PlateTime:SetText("Plate Time [ " .. game.Players.LocalPlayer.PlayerGui.PlateIndicator.TextLabel.Text .. " ]")
                        GravityYou:SetText("Gravity [ " .. game.Workspace.Gravity .. " ]", true)
                        PositionYou:SetText("Position In Your [ " .. tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X) .. ", " .. math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y) .. ", " .. math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)) .. " ]")
                    end
                end)
            end
            if _G.AutoSetInfo == false then
                if AutoSetInfoServer then
                    AutoSetInfoServer:Disconnect()
                    AutoSetInfoServer = nil
                    return AutoSetInfoServer
                end
            end
        end
    })
    InfoServer2Group:AddButton("Copy Position", function()
        if setclipboard then
            setclipboard(tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X) .. ", " .. math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y) .. ", " .. math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)))
            Notification("Copied Success", _G.TimeNotify)
        else
            Notification(tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X) .. ", " .. math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y) .. ", " .. math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)), _G.TimeNotify)
        end
    end)
    local InfoServer4Group = Tabs.Tab:AddRightGroupbox("Search Glove Player")
    InfoServer4Group:AddInput("GlovePlayers", {
        Default = "",
        Numeric = false,
        Text = "Search Glove",
        Finished = true,
        Placeholder = "Glove",
        Callback = function(Value)
            local GlovePlayer = Value
            local Glove
            for _, v in pairs(game.Workspace.Lobby.GloveStands:GetChildren()) do
                if string.sub(v.Name, 1, # GlovePlayer):lower() == GlovePlayer:lower() then
                    Glove = v
                    break
                end
            end
            if Glove then
                _G.GlovePlayer = Glove.Name
                TagGlove:SetText("Glove Check [ ✅ ] [ " .. Glove.Name .. " ]", _G.TimeNotify)
            else
                TagGlove:SetText("Glove Check [ ❌ ]", _G.TimeNotify)
            end
        end
    })
    TagGlove = InfoServer4Group:AddLabel("Glove Search [ Nah ]", true)
    InfoServer4Group:AddButton({
        Text = "Search Glove",
        Func = function()
            _G.GloveSearch = {}
            _G.PlayerOwner = {}
            for i, v in pairs(game.Players:GetChildren()) do
                if v ~= game.Players.LocalPlayer then
                    for i, b in pairs(v._unlockedGloves:GetChildren()) do
                        if b.Name == _G.GlovePlayer and b.Value == true then
                            table.insert(_G.GloveSearch, b)
                            _G.PlayerOwner[# _G.PlayerOwner + 1] = (v.Name == v.DisplayName and " • " .. v.Name or " • " .. v.Name .. " (" .. v.DisplayName .. ")")
                            OwnerPlayer:SetText("Owner [\n" .. (_G.PlayerOwner == 0 and "Nah" or (table.concat(_G.PlayerOwner, ",\n"))) .. "\n]")
                        end
                    end
                end
            end
            if # _G.GloveSearch > 0 then
                SearchPlayer:SetText("Player Owner [ " .. (# _G.GloveSearch == 0 and "Nah" or # _G.GloveSearch) .. " ]")
            elseif # _G.GloveSearch == 0 then
                SearchPlayer:SetText("Player Owner [ Nah ]")
            end
        end
    })
    SearchPlayer = InfoServer4Group:AddLabel("Player Owner [ Nah ]", true)
    OwnerPlayer = InfoServer4Group:AddLabel("Owner [ Nah ]", true)
    local InfoServer5Group = Tabs.Tab:AddRightGroupbox("Check")
    InfoServer5Group:AddInput("Players", {
        Default = "",
        Numeric = false,
        Text = "Player",
        Finished = true,
        Placeholder = "Username",
        Callback = function(Value)
            if Value ~= "" or Value ~= " " then
                local PlayerTarget = Value
                local PlayerTa
                for _, v in pairs(game.Players:GetPlayers()) do
                    if string.sub(v.Name, 1, # PlayerTarget):lower() == PlayerTarget:lower() then
                        PlayerTa = v
                        break
                    end
                end
            end
            if PlayerTa then
                _G.CheckPlayer = PlayerTa.Name
                PlayersCheck1:SetText("Player Check [ ✅ ] [ " .. _G.CheckPlayer .. " ]")
            else
                PlayersCheck1:SetText("Player Check [ ❌ ]")
            end
        end
    })
    PlayersCheck1 = InfoServer5Group:AddLabel("Player Check [ Nah ]", true)
    InfoServer5Group:AddToggle("Toggle Set", {
        Text = "Toggle Return",
        Default = false,
        Callback = function(Value)
            _G.AutosetCheckPlayer = Value
            while _G.AutosetCheckPlayer do
                if game.Players[_G.CheckPlayer].Character ~= nil and game.ReplicatedStorage.PlayerData:FindFirstChild(_G.CheckPlayer) ~= nil then
                    CheckNullShardsPlayer:SetText("Check Null Shard [ " .. game.ReplicatedStorage.PlayerData[_G.CheckPlayer].NullShards.Value .. " ]")
                    CheckTournamentWinsPlayer:SetText("Check Tournament Win [ " .. game.ReplicatedStorage.PlayerData[_G.CheckPlayer].TournamentWins.Value .. " ]")
                    CheckSlapPlayer:SetText("Check Slap [ " .. game.Players[_G.CheckPlayer].leaderstats.Slaps.Value .. " ]")
                    GloveCheckPlayer:SetText("Using Glove [ " .. game.Players[_G.CheckPlayer].leaderstats.Glove.Value .. " ]")
                    if game.Players[_G.CheckPlayer].Character ~= nil and game.Players[_G.CheckPlayer].Character:FindFirstChild("HumanoidRootPart") ~= nil then
                        PositionPlayer:SetText("Position [ " .. tostring(math.round(game.Players[_G.CheckPlayer].Character.HumanoidRootPart.Position.X) .. ", " .. math.round(game.Players[_G.CheckPlayer].Character.HumanoidRootPart.Position.Y) .. ", " .. math.round(game.Players[_G.CheckPlayer].Character.HumanoidRootPart.Position.Z)) .. " ]")
                    else
                        PositionPlayer:SetText("Position [ Nah ]")
                    end
                else
                    CheckNullShardsPlayer:SetText("Check Null Shard [ Nah ]")
                    CheckTournamentWinsPlayer:SetText("Check Tournament Win [ Nah ]")
                    CheckSlapPlayer:SetText("Check Slap [ Nah ]")
                    GloveCheckPlayer:SetText("Using Glove [ Nah ]")
                    PositionPlayer:SetText("Position [ Nah ]")
                end
                task.wait()
            end
        end
    })
    CheckNullShardsPlayer = InfoServer5Group:AddLabel("Check Null Shard [ Nah ]", true)
    CheckTournamentWinsPlayer = InfoServer5Group:AddLabel("Check Tournament Win [ Nah ]", true)
    CheckSlapPlayer = InfoServer5Group:AddLabel("Check Slap [ Nah ]", true)
    GloveCheckPlayer = InfoServer5Group:AddLabel("Using Glove [ Nah ]", true)
    PositionPlayer = InfoServer5Group:AddLabel("Position [ Nah ]", true)
    local Script1Group = Tabs.Tab1:AddLeftGroupbox("Script Basic")
    Script1Group:AddButton({
        Text = "Execute | Ui Library",
        Func = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/Executor.lua"))()
        end
    })
    Script1Group:AddButton({
        Text = "Keyboard",
        Func = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
        end
    })
    Script1Group:AddButton({
        Text = "Inf yield Delta",
        Func = function()
            loadstring(game:HttpGet("https://gist.githubusercontent.com/lxnnydev/c533c374ca4c1dcef4e1e10e33fa4a0c/raw/03e74f184f801dad77d3ebe1e2f18c6ac87ca612/delta___IY.gistfile1.txt.lua", true))()
        end
    })
    local Script2Group = Tabs.Tab1:AddRightGroupbox("Script")
    Script2Group:AddButton({
        Text = "Position Gui",
        Func = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/Position.lua", true))()
        end
    })
    Script2Group:AddButton({
        Text = "Dex V2",
        Func = function()
            loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
            wait(2)
            repeat
                task.wait()
                if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Dex") and game.Players.LocalPlayer.PlayerGui.Dex.ResetOnSpawn == true then
                    game.Players.LocalPlayer.PlayerGui.Dex.ResetOnSpawn = false
                end
            until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Dex") and game.Players.LocalPlayer.PlayerGui.Dex.ResetOnSpawn == false
        end
    })
    Script2Group:AddButton({
        Text = "Dex V3",
        Func = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
        end
    })
    Script2Group:AddButton({
        Text = "Dex V4",
        Func = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/Dex-v4.lua"))()
        end
    })
    Script2Group:AddButton({
        Text = "Simple Spy",
        Func = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/SimpleSpy/SourceBeta.lua"))()
        end
    })
    local Anti1Group = Tabs.Tab2:AddLeftGroupbox("Toggle All")
    if game.Workspace:FindFirstChild("NoChanged") == nil then
        local NoChanged = Instance.new("BoolValue", workspace)
        NoChanged.Name = "NoChanged"
    end
    Anti1Group:AddToggle("Toggle Anti", {
        Text = "Toggle Anti",
        Default = false,
        Callback = function(Value)
            game.Workspace.NoChanged.Value = Value
        end
    }):AddKeyPicker("ToggleAnti", {
        Default = "X",
        Text = "Toggle Anti",
        Mode = "Toggle",
        SyncToggleState = true
    })
    local Anti2Group = Tabs.Tab2:AddRightGroupbox("Anti")
    Anti2Group:AddSlider("Transparency Anti Void", {
        Text = "Transparency Anti Void",
        Default = 0.5,
        Min = 0,
        Max = 1,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            _G.Transparency = Value
            if _G.AntiVoid == true then
                if _G.AntiVoidChoose == "Normal" then
                    game.Workspace["VoidPart"].Transparency = Value
                    game.Workspace["VoidPart"]["TAntiVoid"].Transparency = Value
                elseif _G.AntiVoidChoose == "Retro" then
                    game.Workspace["Psycho"]["Retro1"].Transparency = Value
                    game.Workspace["Psycho"]["Retro1"]["Retro2"].Transparency = Value
                    game.Workspace["Psycho"]["Retro1"]["Retro3"].Transparency = Value
                elseif _G.AntiVoidChoose == "Water" then
                    game.Workspace["Psycho"]["Kraken"].Transparency = Value
                elseif _G.AntiVoidChoose == "Psycho" then
                    game.Workspace["Psycho"].Transparency = Value
                elseif _G.AntiVoidChoose == "Bob" then
                    game.Workspace["VoidPart"]["TAntiVoid"].Transparency = Value
                    game.Workspace["BobWalk1"].Transparency = Value
                    for i, v in pairs(game.Workspace.BobWalk1:GetChildren()) do
                        v.Transparency = _G.Transparency
                    end
                end
            end
        end
    })
    if _G.AntiVoidChoose == nil then
        _G.AntiVoidChoose = "Normal"
    end
    Anti2Group:AddDropdown("Choose Anti Void", {
        Text = "Choose Anti Void",
        Values = {
            "Normal",
            "Retro",
            "Water",
            "Psycho",
            "Bob",
            "Fall"
        },
        Default = "Normal",
        Multi = false,
        Callback = function(Value)
            if _G.AntiVoid == true then
                Toggles["Anti Void"]:SetValue(false)
                _G.AntiVoidChoose = Value
                Toggles["Anti Void"]:SetValue(true)
            elseif _G.AntiVoid == false then
                _G.AntiVoidChoose = Value
            end
        end
    })
    Anti2Group:AddToggle("Anti Void", {
        Text = "Anti Void",
        Default = false,
        Callback = function(Value)
            _G.AntiVoid = Value
            if _G.AntiVoidChoose == "Normal" then
                game.Workspace["VoidPart"].CanCollide = Value
                game.Workspace["VoidPart"]["TAntiVoid"].CanCollide = Value
                if Value == false then
                    game.Workspace["VoidPart"].Transparency = 1
                    game.Workspace["VoidPart"]["TAntiVoid"].Transparency = 1
                else
                    game.Workspace["VoidPart"].Transparency = _G.Transparency
                    game.Workspace["VoidPart"]["TAntiVoid"].Transparency = _G.Transparency
                end
            elseif _G.AntiVoidChoose == "Retro" then
                game.Workspace["Psycho"]["Retro1"].CanCollide = Value
                game.Workspace["Psycho"]["Retro1"]["Retro2"].CanCollide = Value
                game.Workspace["Psycho"]["Retro1"]["Retro3"].CanCollide = Value
                if Value == true then
                    game.Workspace["Psycho"]["Retro1"].Transparency = _G.Transparency
                    game.Workspace["Psycho"]["Retro1"]["Retro2"].Transparency = _G.Transparency
                    game.Workspace["Psycho"]["Retro1"]["Retro3"].Transparency = _G.Transparency
                else
                    game.Workspace["Psycho"]["Retro1"].Transparency = 1
                    game.Workspace["Psycho"]["Retro1"]["Retro2"].Transparency = 1
                    game.Workspace["Psycho"]["Retro1"]["Retro3"].Transparency = 1
                end
            elseif _G.AntiVoidChoose == "Water" then
                game.Workspace["Psycho"]["Kraken"].CanCollide = Value
                if Value == true then
                    game.Workspace["Psycho"]["Kraken"].Transparency = _G.Transparency
                else
                    game.Workspace["Psycho"]["Kraken"].Transparency = 1
                end
            elseif _G.AntiVoidChoose == "Psycho" then
                game.Workspace["Psycho"].CanCollide = Value
                if Value == true then
                    game.Workspace["Psycho"].Transparency = _G.Transparency
                else
                    game.Workspace["Psycho"].Transparency = 1
                end
            elseif _G.AntiVoidChoose == "Bob" then
                game.Workspace["VoidPart"]["TAntiVoid"].CanCollide = Value
                game.Workspace["BobWalk1"].CanCollide = Value
                for i, v in pairs(game.Workspace.BobWalk1:GetChildren()) do
                    v.CanCollide = Value
                end
                if Value == true then
                    game.Workspace["VoidPart"]["TAntiVoid"].Transparency = _G.Transparency
                    game.Workspace["BobWalk1"].Transparency = _G.Transparency
                    for i, v in pairs(game.Workspace.BobWalk1:GetChildren()) do
                        v.Transparency = _G.Transparency
                    end
                else
                    game.Workspace["VoidPart"]["TAntiVoid"].Transparency = 1
                    game.Workspace["BobWalk1"].Transparency = 1
                    for i, v in pairs(game.Workspace.BobWalk1:GetChildren()) do
                        v.Transparency = 1
                    end
                end
            elseif _G.AntiVoidChoose == "Fall" then
                while _G.AntiVoid do
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y < - 30 then
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game.Workspace.Origo.CFrame * CFrame.new(0, - 5, 0))
                    end
                    task.wait()
                end
            end
        end
    })
    Anti2Group:AddToggle("Anti Portal", {
        Text = "Anti Portal",
        Default = false,
        Callback = function(Value)
            _G.AntiPortal = Value
            if _G.AntiPortal == true then
                workspace.Lobby.Teleport2.CanTouch = false
                workspace.Lobby.Teleport3.CanTouch = false
                workspace.Lobby.Teleport4.CanTouch = false
                workspace.Lobby.Teleport6.CanTouch = false
            else
                workspace.Lobby.Teleport2.CanTouch = true
                workspace.Lobby.Teleport3.CanTouch = true
                workspace.Lobby.Teleport4.CanTouch = true
                workspace.Lobby.Teleport6.CanTouch = true
            end
        end
    })
    Anti2Group:AddToggle("Anti Admin", {
        Text = "Anti Admin",
        Default = false,
        Callback = function(Value)
            _G.AntiMods = Value
            while _G.AntiMods do
                for i, v in pairs(game.Players:GetChildren()) do
                    if v:GetRankInGroup(9950771) >= 2 then
                        _G.AntiKick = false
                        game.Players.LocalPlayer:Kick("High Rank Player Detected." .. " [ " .. v.Name .. " ]")
                        break
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Kick", {
        Text = "Anti Kick",
        Default = false,
        Callback = function(Value)
            _G.AntiKick = Value
            while _G.AntiKick do
                for i, v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetDescendants()) do
                    if v.Name == "ErrorPrompt" then
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Afk", {
        Text = "Anti Afk",
        Default = false,
        Callback = function(Value)
            _G.AntiAfk = Value
            for i, v in next, getconnections(game.Players.LocalPlayer.Idled) do
                if _G.AntiAfk then
                    v:Disable()
                else
                    v:Enable()
                end
            end
        end
    })
    Anti2Group:AddToggle("Anti Obby", {
        Text = "Anti Obby",
        Default = false,
        Callback = function(Value)
            _G.AntiObby = Value
            while _G.AntiObby do
                for _, v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "Lava") then
                        if v.CanTouch == true then
                            v.CanTouch = false
                        end
                    end
                end
                task.wait()
            end
            if _G.AntiObby == false then
                for _, v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "Lava") then
                        if v.CanTouch == false then
                            v.CanTouch = true
                        end
                    end
                end
            end
        end
    })
    Anti2Group:AddToggle("Anti Megarock", {
        Text = "Anti Megarock | Custom",
        Default = false,
        Callback = function(Value)
            _G.AntiRock = Value
            while _G.AntiRock do
                for _, v in pairs(game.Players:GetChildren()) do
                    if v.Character and v.Character:FindFirstChild("rock") then
                        v.Character.rock.CanTouch = false
                        v.Character.rock.CanQuery = false
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Boss Guide", {
        Text = "Anti Join Boss Guide",
        Default = false,
        Callback = function(Value)
            _G.AntiJoinBossGuide = Value
            while _G.AntiJoinBossGuide do
                for i, v in pairs(workspace.BountyHunterRoom:GetChildren()) do
                    if v.Name == "Model" and v:FindFirstChild("Meshes/boxshadow_Cube.005") and v["Meshes/boxshadow_Cube.005"]:FindFirstChild("Hitbox") then
                        v["Meshes/boxshadow_Cube.005"].Hitbox.CanTouch = false
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Snowball", {
        Text = "Anti Snowball",
        Default = false,
        Callback = function(Value)
            _G.AntiSnowball = Value
            while _G.AntiSnowball do
                for i, v in pairs(workspace:GetChildren()) do
                    if v.Name == "Snowball" then
                        v:Destroy()
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Ball Baller", {
        Text = "Anti Ball Baller",
        Default = false,
        Callback = function(Value)
            _G.AntiBallBaller = Value
            while _G.AntiBallBaller do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "ClonedBall" then
                        v:Destroy()
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Venom Infected", {
        Text = "Anti Venom Infected",
        Default = false,
        Callback = function(Value)
            _G.AntiVenomInfected = Value
            while _G.AntiVenomInfected do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "is_ice" and v.Color == Color3.fromRGB(177, 229, 166) then
                        v.CanTouch = false
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Ghost Player", {
        Text = "Anti Ghost Player",
        Default = false,
        Callback = function(Value)
            _G.AntiGhostPlayer = Value
            while _G.AntiGhostPlayer do
                for i, v in pairs(game.Players:GetChildren()) do
                    if v ~= game.Players.LocalPlayer.Name and game.Workspace:FindFirstChild(v.Name .. "_Body") and game.Workspace[v.Name .. "_Body"]:FindFirstChild("Part") then
                        gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(game.Workspace[v.Name .. "_Body"].Part)
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Trap", {
        Text = "Anti Trap",
        Default = false,
        Callback = function(Value)
            _G.AntiTrap = Value
            while _G.AntiTrap do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "BearTrap" and v:FindFirstChild("HitBox") then
                        v.HitBox.CanTouch = false
                        v.HitBox.CanQuery = false
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Lure", {
        Text = "Anti Lure",
        Default = false,
        Callback = function(Value)
            _G.AntiLure = Value
            while _G.AntiLure do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "_lure") and v:FindFirstChild("Root") and v:FindFirstChild("watercircle") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Root.CFrame
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Mail", {
        Text = "Anti Mail",
        Default = false,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.YouHaveGotMail.Disabled = Value
            _G.AntiMail = Value
            while _G.AntiMail do
                if game.Players.LocalPlayer.Character:FindFirstChild("YouHaveGotMail") then
                    game.Players.LocalPlayer.Character.YouHaveGotMail.Disabled = true
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Water", {
        Text = "Anti Water",
        Default = false,
        Callback = function(Value)
            _G.AntiWater = Value
            while _G.AntiWater do
                if game.Workspace:FindFirstChild("puddles") then
                    for i, v in pairs(game.Workspace.puddles:GetChildren()) do
                        if v.Name == "puddle" then
                            v.CanTouch = false
                        end
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Jail Admin", {
        Text = "Anti Jail Admin",
        Default = false,
        Callback = function(Value)
            _G.AntiJailAdmin = Value
            while _G.AntiJailAdmin do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "jail" then
                        for i, h in pairs(v:GetChildren()) do
                            h.CanCollide = false
                        end
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Mitten Blind", {
        Text = "Anti Mitten Blind",
        Default = false,
        Callback = function(Value)
            _G.AntiMittenBlind = Value
            while _G.AntiMittenBlind do
                if game.Players.LocalPlayer.PlayerGui:FindFirstChild("MittenBlind") then
                    game.Players.LocalPlayer.PlayerGui:FindFirstChild("MittenBlind"):Destroy()
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Knockoff", {
        Text = "Anti Knockoff",
        Default = false,
        Callback = function(Value)
            _G.AntiKnock = Value
            while _G.AntiKnock do
                if game.Workspace.CurrentCamera and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Workspace.CurrentCamera.CameraSubject ~= game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Workspace.CurrentCamera.CameraSubject == game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "'s_falsehead") then
                    game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Hallow", {
        Text = "Anti Hallow - Jack",
        Default = false,
        Callback = function(Value)
            game.Players.LocalPlayer.PlayerScripts.LegacyClient.HallowJackAbilities.Disabled = Value
        end
    })
    Anti2Group:AddToggle("Anti Booster", {
        Text = "Anti Booster",
        Default = false,
        Callback = function(Value)
            _G.AntiBooster = Value
            while _G.AntiBooster do
                for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v.Name == "BoosterObject" then
                        v:Destroy()
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Squid", {
        Text = "Anti Squid",
        Default = false,
        Callback = function(Value)
            _G.AntiSquid = Value
            if _G.AntiSquid == false then
                game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = true
            end
            while _G.AntiSquid do
                if game.Players.LocalPlayer.PlayerGui:FindFirstChild("SquidInk") then
                    game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = false
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Lamp", {
        Text = "Anti Lamp",
        Default = false,
        Callback = function(Value)
            _G.AntiLamp = Value
            while _G.AntiLamp do
                for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
                    if v.Name:find("whiteframe") and v.Enabled == true then
                        v.Enabled = false
                    end
                end
                for i, v in pairs(game.Lighting:GetChildren()) do
                    if v.Name:find("lampcc") and v.Enabled == true then
                        v.Enabled = false
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Pie", {
        Text = "Anti Pie",
        Default = false,
        Callback = function(Value)
            _G.AntiPie = Value
            while _G.AntiPie do
                if game.Players.LocalPlayer.PlayerGui:FindFirstChild("PieSplash") then
                    game.Players.LocalPlayer.PlayerGui:FindFirstChild("PieSplash"):Destroy()
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Conveyor", {
        Text = "Anti Conveyor",
        Default = false,
        Callback = function(Value)
            game.Players.LocalPlayer.PlayerScripts.LegacyClient.ConveyorVictimized.Disabled = Value
        end
    })
    Anti2Group:AddToggle("Anti Ice", {
        Text = "Anti Ice",
        Default = false,
        Callback = function(Value)
            _G.AntiIce = Value
            while _G.AntiIce do
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.Name == "Icecube" then
                        v:Destroy()
                        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                        game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Time Stop", {
        Text = "Anti Time Stop",
        Default = false,
        Callback = function(Value)
            _G.AntiTimestop = Value
            while _G.AntiTimestop do
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.ClassName == "Part" then
                        v.Anchored = false
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Null", {
        Text = "Anti Null",
        Default = false,
        Callback = function(Value)
            _G.AntiNull = Value
            while _G.AntiNull do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Imp" and v:FindFirstChild("Body") then
                        if gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value] ~= nil then
                            gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Body, true)
                        else
                            game:GetService("ReplicatedStorage").GeneralHit:FireServer(v.Body, true)
                        end
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Run", {
        Text = "Anti Run",
        Default = false,
        Callback = function(Value)
            _G.AutoExit = Value
            while _G.AutoExit do
                if game.Players.LocalPlayer.Character:FindFirstChild("InLabyrinth") then
                    for i, v in pairs(workspace:GetChildren()) do
                        if string.find(v.Name, "Labyrinth") and v:FindFirstChild("Doors") then
                            for i, y in ipairs(v.Doors:GetChildren()) do
                                if y:FindFirstChild("Hitbox") and y.Hitbox:FindFirstChild("TouchInterest") then
                                    y.Hitbox.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                end
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Record", {
        Text = "Anti Record",
        Default = false,
        Callback = function(Value)
            _G.AntiRecord = Value
        end
    })
    for i, p in pairs(game.Players:GetChildren()) do
        if p ~= game.Players.LocalPlayer then
            p.Chatted:Connect(function(message)
                Words = message:split(" ")
                if _G.AntiRecord == true then
                    for i, v in pairs(Words) do
                        if v:lower():match("recording") or v:lower():match(" rec") or v:lower():match("record") or v:lower():match("discor") or v:lower():match(" disco") or v:lower():match(" disc") or v:lower():match("ticket") or v:lower():match("tickets") or v:lower():match(" ds") or v:lower():match(" dc") or v:lower():match("dizzy") or v:lower():match("dizzycord") or v:lower():match(" clip") or v:lower():match("proof") or v:lower():match("evidence") then
                            Toggles["Anti Kick"]:SetValue(false)
                            game.Players.LocalPlayer:Kick("Possible player recording detected." .. " [ " .. p.Name .. " ]" .. " [ " .. message .. " ]")
                        end
                    end
                end
            end)
        end
    end
    game.Players.PlayerAdded:Connect(function(Player)
        Player.Chatted:Connect(function(message)
            Words = message:split(" ")
            if _G.AntiRecord == true then
                for i, v in pairs(Words) do
                    if v:lower():match("recording") or v:lower():match(" rec") or v:lower():match("record") or v:lower():match("discor") or v:lower():match(" disco") or v:lower():match(" disc") or v:lower():match("ticket") or v:lower():match("tickets") or v:lower():match(" ds") or v:lower():match(" dc") or v:lower():match("dizzy") or v:lower():match("dizzycord") or v:lower():match(" clip") or v:lower():match("proof") or v:lower():match("evidence") then
                        Toggles["Anti Kick"]:SetValue(false)
                        game.Players.LocalPlayer:Kick("Possible player recording detected." .. " [ " .. Player.Name .. " ]" .. " [ " .. message .. " ]")
                    end
                end
            end
        end)
    end)
    Anti2Group:AddToggle("Anti REDACTED", {
        Text = "Anti [REDACTED]",
        Default = false,
        Callback = function(Value)
            game.Players.LocalPlayer.PlayerScripts.LegacyClient.Well.Disabled = Value
        end
    })
    Anti2Group:AddToggle("Anti Brazil", {
        Text = "Anti Brazil",
        Default = false,
        Callback = function(Value)
            _G.AntiBrazil = Value
            while _G.AntiBrazil do
                for i, v in pairs(game.workspace.Lobby.brazil:GetChildren()) do
                    if v.CanTouch == true then
                        v.CanTouch = false
                    end
                end
                task.wait()
            end
            if _G.AntiBrazil == false then
                for i, v in pairs(game.workspace.Lobby.brazil:GetChildren()) do
                    if v.CanTouch == false then
                        v.CanTouch = true
                    end
                end
            end
        end
    })
    Anti2Group:AddToggle("Anti Za Hando", {
        Text = "Anti Za Hando",
        Default = false,
        Callback = function(Value)
            _G.AntiZaHando = Value
            while _G.AntiZaHando do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.ClassName == "Part" and v.Name == "Part" then
                        v:Destroy()
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Bob", {
        Text = "Anti Bob",
        Default = false,
        Callback = function(Value)
            _G.AntiBob = Value
            while _G.AntiBob do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "ÅBOB_") and v:FindFirstChild("Target") and v.Target.Value == game.Players.LocalPlayer.Name then
                        if v:FindFirstChild("HumanoidRootPart") then
                            v:FindFirstChild("HumanoidRootPart").CFrame = game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].Part.CFrame
                        end
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Fort", {
        Text = "Anti Fort",
        Default = false,
        Callback = function(Value)
            _G.AntiFort = Value
            while _G.AntiFort do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Part" then
                        v.CanCollide = false
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Pusher", {
        Text = "Anti Pusher",
        Default = false,
        Callback = function(Value)
            _G.AntiPusher = Value
            while _G.AntiPusher do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "wall" then
                        v.CanCollide = false
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Defend", {
        Text = "Anti Defend",
        Default = false,
        Callback = function(Value)
            _G.NoclipBarrier = Value
            if _G.NoclipBarrier == false then
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "ÅBarrier") then
                        if v.CanCollide == false then
                            v.CanCollide = true
                        end
                    end
                end
            end
            while _G.NoclipBarrier do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "ÅBarrier") then
                        if v.CanCollide == true then
                            v.CanCollide = false
                        end
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Bubble", {
        Text = "Anti Bubble",
        Default = false,
        Callback = function(Value)
            _G.AntiBubble = Value
            while _G.AntiBubble do
                for i, v in pairs(workspace:GetChildren()) do
                    if v.Name == "BubbleObject" and v:FindFirstChild("Weld") then
                        v:FindFirstChild("Weld"):Destroy()
                    end
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti Stun", {
        Text = "Anti Stun",
        Default = false,
        Callback = function(Value)
            _G.AntiStun = Value
            while _G.AntiStun do
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Workspace:FindFirstChild("Shockwave") and game.Players.LocalPlayer.Character.Ragdolled.Value == false then
                    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                end
                task.wait()
            end
        end
    })
    Anti2Group:AddToggle("Anti COD", {
        Text = "Anti Cube Of Death",
        Default = false,
        Callback = function(Value)
            if Value == true then
                if game.Workspace:FindFirstChild("the cube of death(i heard it kills)", 1) and game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"]:FindFirstChild("Part") then
                    game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
                    game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].Part.CanTouch = false
                end
            else
                if game.Workspace:FindFirstChild("the cube of death(i heard it kills)", 1) and game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"]:FindFirstChild("Part") then
                    game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
                    game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].Part.CanTouch = true
                end
            end
        end
    })
    Anti2Group:AddToggle("Anti Death Barriers", {
        Text = "Anti Death Barriers",
        Default = false,
        Callback = function(Value)
            if Value == true then
                for i, v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                    if v.ClassName == "Part" and v.Name == "BLOCK" then
                        v.CanTouch = false
                    end
                end
                workspace.DEATHBARRIER.CanTouch = false
                workspace.DEATHBARRIER2.CanTouch = false
                workspace.dedBarrier.CanTouch = false
                workspace.ArenaBarrier.CanTouch = false
                workspace.AntiDefaultArena.CanTouch = false
            else
                for i, v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                    if v.ClassName == "Part" and v.Name == "BLOCK" then
                        v.CanTouch = true
                    end
                end
                workspace.DEATHBARRIER.CanTouch = true
                workspace.DEATHBARRIER2.CanTouch = true
                workspace.dedBarrier.CanTouch = true
                workspace.ArenaBarrier.CanTouch = true
                workspace.AntiDefaultArena.CanTouch = true
            end
        end
    })
    Anti2Group:AddToggle("Anti Ragdoll", {
        Text = "Anti Ragdoll",
        Default = false,
        Callback = function(Value)
            _G.AntiRagdoll = Value
            while _G.AntiRagdoll do
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Torso") and game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") then
                    if game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true then
                        repeat
                            task.wait()
                            if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
                                game.Players.LocalPlayer.Character.Torso.Anchored = true
                            end
                        until game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
                        if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
                            game.Players.LocalPlayer.Character.Torso.Anchored = false
                        end
                    end
                end
                task.wait()
            end
        end
    })
    local Badge3Group = Tabs.Tab3:AddLeftGroupbox("Teleport / Show")
    Badge3Group:AddDropdown("Teleport Safe", {
        Text = "Teleport Safe",
        Values = {
            "SafeSpotBox 1.0",
            "SafeSpotBox 2.0",
            "Bed"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            if Value == "SafeSpotBox 1.0" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
            elseif Value == "SafeSpotBox 2.0" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Safespot"].CFrame * CFrame.new(0, 10, 0)
            elseif Value == "Bed" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Bed"].Bed3.CFrame * CFrame.new(0, 0, - 1)
            end
        end
    })
    Badge3Group:AddDropdown("Retro Obby", {
        Text = "Retro Obby",
        Values = {
            "Get Badge",
            "Show All",
            "Off Show All",
            "Teleport Spawn 1",
            "Teleport Spawn 2",
            "Teleport Spawn 3",
            "Click Button"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            if Value == "Get Badge" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.FinishDoor_Retro.Part.CFrame
            elseif Value == "Show All" then
                if game.ReplicatedStorage.Assets:FindFirstChild("Retro") then
                    game.ReplicatedStorage.Assets.Retro.Parent = game.Workspace
                end
            elseif Value == "Off Show All" then
                if game.Workspace:FindFirstChild("Retro") then
                    game.Workspace.Retro.Parent = game.ReplicatedStorage:FindFirstChild("Assets")
                end
            elseif Value == "Teleport Spawn 1" then
                if game.Workspace:FindFirstChild("Retro") and game.Workspace.Retro:FindFirstChild("Map") and game.Workspace.Retro.Map:FindFirstChild("RetroObbyMap") and game.Workspace.Retro.Map.RetroObbyMap:FindFirstChild("Spawn") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Retro.Map.RetroObbyMap.Spawn.CFrame
                end
            elseif Value == "Teleport Spawn 2" then
                if game.Workspace:FindFirstChild("Retro") and game.Workspace.Retro:FindFirstChild("Map") and game.Workspace.Retro.Map:FindFirstChild("RetroObbyMap") and game.Workspace.Retro.Map.RetroObbyMap:FindFirstChild("Spawn_stage2") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Retro.Map.RetroObbyMap.Spawn_stage2.CFrame
                end
            elseif Value == "Teleport Spawn 3" then
                if game.Workspace:FindFirstChild("Retro") and game.Workspace.Retro:FindFirstChild("Map") and game.Workspace.Retro.Map:FindFirstChild("RetroObbyMap") and game.Workspace.Retro.Map.RetroObbyMap:FindFirstChild("Spawn_stage3") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Retro.Map.RetroObbyMap.Spawn_stage3.CFrame
                end
            elseif Value == "Click Button" then
                repeat
                    task.wait()
                    if game.ReplicatedStorage:FindFirstChild("Assets") and game.ReplicatedStorage.Assets:FindFirstChild("Retro") then
                        game.ReplicatedStorage.Assets.Retro.Parent = game.Workspace
                    end
                until game.Workspace:FindFirstChild("Retro") and game.Workspace.Retro:FindFirstChild("Map")
                wait(1.5)
                if game.Workspace:FindFirstChild("Retro") and game.Workspace.Retro:FindFirstChild("Map") then
                    for i, v in pairs(workspace.Retro.Map.RetroObbyMap:GetChildren()) do
                        if v.Name == "Model" and v:FindFirstChild("StaffApp") and v.StaffApp:FindFirstChild("Button") and v.StaffApp.Button:FindFirstChild("ClickDetector") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.StaffApp.Button.CFrame
                            wait(0.3)
                            fireclickdetector(v.StaffApp.Button.ClickDetector)
                        end
                    end
                end
            end
        end
    })
    Badge3Group:AddDropdown("Repressed Memory", {
        Text = "Repressed Memory",
        Values = {
            "Show All",
            "Off Show All",
            "Teleport Enter",
            "Teleport Portal",
            "Teleport Bob Plushie",
            "Click Bob Plushie"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            if Value == "Show All" then
                if game.ReplicatedStorage:FindFirstChild("RepressedMemoriesMap") then
                    game.ReplicatedStorage.RepressedMemoriesMap.Parent = game.Workspace
                end
            elseif Value == "Off Show All" then
                if game.Workspace:FindFirstChild("RepressedMemoriesMap") then
                    game.Workspace.RepressedMemoriesMap.Parent = game.ReplicatedStorage
                end
            elseif Value == "Teleport Enter" then
                if game.Workspace:FindFirstChild("RepressedMemoriesMap") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.RepressedMemories.Limbo.CFrame * CFrame.new(0, - 5, 0)
                end
            elseif Value == "Teleport Portal" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.RepressedMemories.SimonSaysGate.Portal.CFrame
            elseif Value == "Teleport Bob Plushie" then
                if game.Workspace:FindFirstChild("RepressedMemoriesMap") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.RepressedMemories._ugcQuestObjectBobPlushie.Handle.CFrame
                elseif game.ReplicatedStorage:FindFirstChild("RepressedMemoriesMap") then
                    game.ReplicatedStorage.RepressedMemoriesMap.Parent = game.Workspace
                    wait(1.5)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.RepressedMemories._ugcQuestObjectBobPlushie.Handle.CFrame
                end
            elseif Value == "Click Bob Plushie" then
                repeat
                    task.wait()
                    if game.ReplicatedStorage:FindFirstChild("RepressedMemoriesMap") then
                        game.ReplicatedStorage.RepressedMemoriesMap.Parent = game.Workspace
                    end
                until game.Workspace:FindFirstChild("RepressedMemoriesMap")
                wait(1)
                if game.Workspace:FindFirstChild("RepressedMemoriesMap") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.RepressedMemories._ugcQuestObjectBobPlushie.Handle.CFrame
                    wait(0.5)
                    fireclickdetector(workspace.RepressedMemories._ugcQuestObjectBobPlushie.ClickDetector)
                end
                wait(2)
                if game.Workspace:FindFirstChild("RepressedMemoriesMap") then
                    game.Workspace.RepressedMemoriesMap.Parent = game.ReplicatedStorage
                end
            end
        end
    })
    Badge3Group:AddDropdown("Map Kraken", {
        Text = "Map Kraken",
        Values = {
            "Show All",
            "Off Show All",
            "Teleport Enter"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            if Value == "Show All" then
                game.ReplicatedStorage.AbyssAssets.Abyss.Parent = game.Workspace
            elseif Value == "Off Show All" then
                game.Workspace.Abyss.Parent = game.ReplicatedStorage.AbyssAssets
            elseif Value == "Teleport Enter" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Abyss.Spawn.CFrame * CFrame.new(0, 10, 0)
            end
        end
    })
    local Badge1Group = Tabs.Tab3:AddLeftGroupbox("Badge Auto")
    Badge1Group:AddButton({
        Text = "Auto Get Boxing",
        Func = function()
            local teleportFunc = queueonteleport or queue_on_teleport
            if teleportFunc then
                teleportFunc([[
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            repeat wait() until game.Players.LocalPlayer
if game.Workspace:FindFirstChild("BoxingGloves") == nil then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Buildings.house:FindFirstChild("TP").CFrame * CFrame.new(0,10,0)
repeat task.wait()
if game.Workspace:FindFirstChild("BoxingGloves") then
for i,v in pairs(game.Workspace:GetChildren()) do
if v.Name == "BoxingGloves" and v:FindFirstChild("ClickDetector") then
fireclickdetector(v.ClickDetector, 0)
fireclickdetector(v.ClickDetector, 1)
end
end
end
until game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 1223765330375569)
else
for i,v in pairs(game.Workspace:GetChildren()) do
if v.Name == "BoxingGloves" and v:FindFirstChild("ClickDetector") then
fireclickdetector(v.ClickDetector, 0)
fireclickdetector(v.ClickDetector, 1)
end
end
end
]])
            elseif not teleportFunc then
                Notification("Bruh, Not only executor you autoexe", _G.TimeNotify)
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Lobby.brazil.portal.CFrame
        end
    })
    Badge1Group:AddButton({
        Text = "Auto Get Bind",
        Func = function()
            local teleportFunc = queueonteleport or queue_on_teleport
            if teleportFunc then
                teleportFunc([[
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            repeat wait() until game.Players.LocalPlayer
if fireclickdetector then
if game.Workspace:FindFirstChild("Orb") then
fireclickdetector(game.Workspace.Orb.ClickDetector, 0)
fireclickdetector(game.Workspace.Orb.ClickDetector, 1)
end
elseif not fireclickdetector then
if game.Workspace:FindFirstChild("Orb") and game.Workspace.Orb:FindFirstChild("Meshes/rock chain glove_defaultglove_cell.001") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Orb["Meshes/rock chain glove_defaultglove_cell.001"].CFrame
end
end
]])
            elseif not teleportFunc then
                Notification("Bruh, Not only executor you autoexe", _G.TimeNotify)
            end
            game:GetService("TeleportService"):Teleport(74169485398268)
        end
    })
    Badge1Group:AddButton({
        Text = "Auto Get FrostBite",
        Func = function()
            local teleportFunc = queueonteleport or queue_on_teleport
            if teleportFunc then
                teleportFunc([[
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            repeat wait() until game.Players.LocalPlayer
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-554, 177, 56)
wait(0.7)
for i,v in ipairs(game:GetService("Workspace"):GetDescendants()) do
            if v.ClassName == "ProximityPrompt" then
                v.HoldDuration = 0
                fireproximityprompt(v)
            end
        end
]])
            elseif not teleportFunc then
                Notification("Bruh, Not only executor you autoexe", _G.TimeNotify)
            end
            game:GetService("TeleportService"):Teleport(17290438723)
        end
    })
    Badge1Group:AddButton({
        Text = "Auto Get Admin",
        Func = function()
            local teleportFunc = queueonteleport or queue_on_teleport
            if teleportFunc then
                teleportFunc([[
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            repeat wait() until game.Players.LocalPlayer
wait(13.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(502, 76, 59)
task.wait(6)
if getconnections then
for i,v in next, getconnections(game.Players.LocalPlayer.Idled) do
v:Disable() 
end
end
]])
            elseif not teleportFunc then
                Notification("Bruh, Not only executor you autoexe", _G.TimeNotify)
            end
            repeat
                task.wait()
                if game.ReplicatedStorage:FindFirstChild("Assets") and game.ReplicatedStorage.Assets:FindFirstChild("Retro") then
                    game.ReplicatedStorage.Assets.Retro.Parent = game.Workspace
                end
            until game.Workspace:FindFirstChild("Retro") and game.Workspace.Retro:FindFirstChild("Map")
            wait(1.5)
            if game.Workspace:FindFirstChild("Retro") and game.Workspace.Retro:FindFirstChild("Map") then
                for i, v in pairs(workspace.Retro.Map.RetroObbyMap:GetChildren()) do
                    if v.Name == "Model" and v:FindFirstChild("StaffApp") and v.StaffApp:FindFirstChild("Button") and v.StaffApp.Button:FindFirstChild("ClickDetector") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.StaffApp.Button.CFrame
                        wait(0.3)
                        fireclickdetector(v.StaffApp.Button.ClickDetector)
                    end
                end
            end
        end
    })
    Badge1Group:AddButton({
        Text = "Auto Get Chain",
        Func = function()
            if game.Players.LocalPlayer.leaderstats.Slaps.Value >= 1000 then
                local teleportFunc = queueonteleport or queue_on_teleport
                if teleportFunc then
                    teleportFunc([[
        if not game:IsLoaded() then
            game.Loaded:Wait()
        end
        repeat wait() until game.Players.LocalPlayer
repeat wait() until game.Workspace:FindFirstChild("Map") and game.Workspace.Map:FindFirstChild("CodeBrick")
if game.Workspace.Map.CodeBrick.SurfaceGui:FindFirstChild("IMGTemplate") then
local Code = {}
for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                    if v.Name == "IMGTemplate" then
                        if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                    table.insert(Code, "4")
                elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                    table.insert(Code, "2")
                elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                    table.insert(Code, "3")
                elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                    table.insert(Code, "9")
                elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                    table.insert(Code, "8")
                elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                    table.insert(Code, "2")
                elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                    table.insert(Code, "8")
                elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                    table.insert(Code, "3")
                elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                    table.insert(Code, "7")
                elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                    table.insert(Code, "8")
                elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                    table.insert(Code, "2")
                elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                    table.insert(Code, "6")
                elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                    table.insert(Code, "3")
                elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                    table.insert(Code, "6")
                elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                    table.insert(Code, "6")
                elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                    table.insert(Code, "2")
                end
                    end
                end
                end
fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons.Reset.ClickDetector)
wait(0.25)
for i = 1, #Code do
local CodeNah = Code[i]
fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[CodeNah].ClickDetector)
wait(0.25)
end
wait(0.25)
fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons.Enter.ClickDetector)
wait(0.5)
game:GetService("TeleportService"):Teleport(6403373529)
    ]])
                elseif not teleportFunc then
                    Notification("Bruh, Not only executor you autoexe", _G.TimeNotify)
                end
                game:GetService("TeleportService"):Teleport(9431156611)
            else
                Notification("You don't have 1000 slap.", _G.TimeNotify)
            end
        end
    })
    Badge1Group:AddButton({
        Text = "Get Counter + Elude",
        Func = function()
            local teleportFunc = queueonteleport or queue_on_teleport
            if teleportFunc then
                teleportFunc([[
        if not game:IsLoaded() then
            game.Loaded:Wait()
        end
        repeat wait() until game.Players.LocalPlayer
        wait(3)
Time = 121
wait(0.4)
spawn(function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.CounterLever.Main.CFrame
game.Workspace.CounterLever.ClickDetector.MouseClick:Connect(function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,100,0)
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
for i = 1,Time do
Time = Time - 1
game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "You wait time [ "..Time.." ] receive.",Icon = "rbxassetid://7733658504",Duration = 1})
wait(1)
end
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
for i, v in pairs(workspace.Maze:GetChildren()) do
if v.Name == "Part" and v:FindFirstChild("A0") and v:FindFirstChild("ClickDetector") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,-20,0)
v.ClickDetector.MouseClick:Connect(function()
game.Workspace.Ruins.Elude.Glove.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)
end
end
end)
end)
wait(3.5)
fireclickdetector(game.Workspace.CounterLever.ClickDetector)
repeat task.wait() until Time == 0
wait(2)
for i, v in pairs(workspace.Maze:GetChildren()) do
if v.Name == "Part" and v:FindFirstChild("A0") and v:FindFirstChild("ClickDetector") then
fireclickdetector(v.ClickDetector)
end
end
    ]])
            elseif not teleportFunc then
                Notification("Bruh, Not only executor you autoexe", _G.TimeNotify)
            end
            game:GetService("TeleportService"):Teleport(11828384869)
        end
    })
    Badge1Group:AddButton({
        Text = "Get Swordfighter",
        Func = function()
            local teleportFunc = queueonteleport or queue_on_teleport
            if teleportFunc then
                teleportFunc([[
        if not game:IsLoaded() then
            game.Loaded:Wait()
        end
        repeat wait() until game.Players.LocalPlayer
        wait(3)
if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
if workspace.Map.Components.NPCs.FinalBoss:FindFirstChild("FinalBoss") and workspace.Map.Components.NPCs.FinalBoss.FinalBoss:FindFirstChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.Components.NPCs.FinalBoss.FinalBoss.HumanoidRootPart.CFrame * CFrame.new(0, 0, -7)
end
wait(0.36)
game:GetService("Players").LocalPlayer.PlayerGui.SkipButton:FindFirstChild("SkipDialogueButton").Position = UDim2.new(0, 0, 0, 0)
game:GetService("Players").LocalPlayer.PlayerGui.SkipButton:FindFirstChild("SkipDialogueButton").BackgroundTransparency = 0.77
game:GetService("Players").LocalPlayer.PlayerGui.SkipButton:FindFirstChild("SkipDialogueButton").Size = UDim2.new(1, 0, 1, 0)
if workspace.Map.Components.NPCs.FinalBoss:FindFirstChild("FinalBoss") and workspace.Map.Components.NPCs.FinalBoss.FinalBoss:FindFirstChild("Head") then
if fireproximityprompt then
fireproximityprompt(workspace.Map.Components.NPCs.FinalBoss.FinalBoss.Head:FindFirstChild("ProximityPrompt"))
end
end
repeat task.wait() until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("FinalBossHealthBar") and game:GetService("Players").LocalPlayer.PlayerGui.FinalBossHealthBar:FindFirstChild("FinalBossHealthBar").Visible == true
wait(0.5)
repeat task.wait()
if workspace.Map.Components.NPCs.FinalBoss:FindFirstChild("FinalBoss") and workspace.Map.Components.NPCs.FinalBoss.FinalBoss:FindFirstChild("HumanoidRootPart") then
if game.Players.LocalPlayer.Backpack:FindFirstChild("Default") then
game.Players.LocalPlayer.Backpack:FindFirstChild("Default").Parent = game.Players.LocalPlayer.Character
end
workspace.Map.Components.NPCs.FinalBoss.FinalBoss.HumanoidRootPart.Size = Vector3.new(70, 70, 70)
workspace.Map.Components.NPCs.FinalBoss.FinalBoss.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
game:GetService("ReplicatedStorage").Remotes.ToolSwingEvent:FireServer()
end
until game:GetService("Players").LocalPlayer.PlayerGui.SkipButton:FindFirstChild("SkipDialogueButton").Visible == true or game:GetService("Players").LocalPlayer.PlayerGui.FinalBossHealthBar:FindFirstChild("FinalBossHealthBar").Visible == false or workspace.Map.Components.NPCs.FinalBoss:FindFirstChild("BridgeToGlove").Transparency == 0
workspace.Map.Components.NPCs.FinalBoss.FinalBoss.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
repeat task.wait() until workspace.Map.Components.NPCs.FinalBoss:FindFirstChild("BridgeToGlove").Transparency == 0
wait(1)
if workspace.Map.Components:FindFirstChild("GloveIsland") and workspace.Map.Components.GloveIsland:FindFirstChild("ClaimGlove") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.Components.GloveIsland.ClaimGlove.CFrame
wait(1)
while true do
wait(0.3)
if fireproximityprompt then
fireproximityprompt(workspace.Map.Components.GloveIsland.ClaimGlove:FindFirstChild("ProximityPrompt"))
end
end
end
end
    ]])
            elseif not teleportFunc then
                Notification("Bruh, Not only executor you autoexe", _G.TimeNotify)
            end
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if workspace.Arena:FindFirstChild("CannonIsland") and workspace.Arena.CannonIsland:FindFirstChild("Cannon Island [OLD]") then
                    for i, v in pairs(workspace.Arena.CannonIsland:FindFirstChild("Cannon Island [OLD]"):GetChildren()) do
                        if v.Name == "Model" and v:FindFirstChild("Towers") and v.Towers:FindFirstChild("RevealHitbox") and v.Towers:FindFirstChild("TeleportSFHitbox") then
                            repeat
                                task.wait()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Towers.RevealHitbox.CFrame * CFrame.new(3, 0, 0) * CFrame.Angles(math.rad(0), math.rad(50), math.rad(0))
                                wait(0.2)
                                game:GetService("ReplicatedStorage").RetroAbility:FireServer("Ban Hammer")
                            until v.Towers:FindFirstChild("Ring of Fire") ~= nil
                            wait(0.2)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Towers:FindFirstChild("Ring of Fire").CFrame
                        end
                    end
                end
            end
        end
    })
    Badge1Group:AddButton({
        Text = "Get Fight Guide",
        Func = function()
            local teleportFunc = queueonteleport or queue_on_teleport
            if teleportFunc then
                teleportFunc([[
        if not game:IsLoaded() then
            game.Loaded:Wait()
        end
        repeat wait() until game.Players.LocalPlayer
game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "You wait time [ 10 second ].",Icon = "rbxassetid://7733658504",Duration = 1})
wait(10)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3260, -70, 823)
wait(2)
for i,v in pairs(game.Workspace:GetDescendants()) do
                    if v.Name == "ShackLever" and v:FindFirstChild("ClickDetector") then
if fireclickdetector then
fireclickdetector(v.ClickDetector)
end
                    end
                end
repeat task.wait() until workspace.Map.Components:FindFirstChild("GuideNPC") ~= nil
wait(0.56)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(595, 120, -330)
wait(0.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
while true do
for i,v in pairs(game.Workspace:GetChildren()) do
if v.Name == "TrackGloveMissile" or v.Name == "golem" or v.Name == "DungeonGolem" or v.Name == "ReplicaNPC" or v.Name == "GuideNPC" then
if game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern") then
game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern").Parent = game.Players.LocalPlayer.Character
elseif game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
game.Players.LocalPlayer.Character:FindFirstChild("Lantern"):Activate()
if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer("Hit", v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Hitbox") or v:FindFirstChild("Cube.001") or v)
end
end
end
end
end
task.wait()
end
]])
            elseif not teleportFunc then
                Notification("Bruh, Not only executor you autoexe", _G.TimeNotify)
            end
            for i, v in pairs(workspace.BountyHunterRoom:GetChildren()) do
                if v.Name == "Model" and v:FindFirstChild("Meshes/boxshadow_Cube.005") and v["Meshes/boxshadow_Cube.005"]:FindFirstChild("Hitbox") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v["Meshes/boxshadow_Cube.005"].Hitbox.CFrame
                end
            end
        end
    })
    local Badge2Group = Tabs.Tab3:AddRightGroupbox("Badge")
    Badge2Group:AddButton({
        Text = "Get Glove Kinetic",
        Func = function()
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Stun" and game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                OGL = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                repeat
                    task.wait()
                    game.ReplicatedStorage.SelfKnockback:FireServer({
                        ["Force"] = - 99
                    })
                until game.Players.LocalPlayer.Character:WaitForChild("KineticSlappedBadgeCounter").Value >= 100
                wait(1.5)
                repeat
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Stun") then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Stun)
                    end
                    wait(0.1)
                    local players = game.Players:GetChildren()
                    local RandomPlayer = players[math.random(1, # players)]
                    repeat
                        RandomPlayer = players[math.random(1, # players)]
                    until RandomPlayer ~= game.Players.LocalPlayer and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoReverseCard") == nil and RandomPlayer.Character.Humanoid.Health ~= 0
                    Target = RandomPlayer
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame * CFrame.new(0, - 20, 0)
                    wait(0.25)
                    game.ReplicatedStorage.StunR:FireServer(game.Players.LocalPlayer.Character.Stun)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OGL
                    wait(0.5)
                    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("EMPStunBadgeCounter") then
                        Notification("Counter Stun [ " .. game.Players.LocalPlayer.Character.EMPStunBadgeCounter.Value .. " ]", _G.TimeNotify)
                    end
                    wait(12.3)
                until game.Players.LocalPlayer.Character:FindFirstChild("EMPStunBadgeCounter") and game.Players.LocalPlayer.Character.EMPStunBadgeCounter.Value >= 50
            else
                Notification("You don't have Stun equipped, or you aren't in the arena", _G.TimeNotify)
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Auto Win Kraken",
        Func = function()
            if game.Workspace:FindFirstChild("Abyss") ~= nil then
                Notification("When the kraken stops attack, click to hit.", _G.TimeNotify)
                repeat
                    task.wait()
                    if game.Workspace:FindFirstChild("Abyss") and game.Workspace.Abyss:FindFirstChild("Ship") and game.Workspace.Abyss.Ship:FindFirstChild("Ghost_Ship") and game.Workspace.Abyss.Ship.Ghost_Ship:FindFirstChild("Wall") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Abyss.Ship.Ghost_Ship.Wall.CFrame * CFrame.new(0, 10, 0)
                    else
                        break
                    end
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "kraken_hurtbox" then
                            v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                until game.Workspace:FindFirstChild("Abyss") == nil
            else
                Notification("You have enter Map Abyss [ don't show all, not work ]", _G.TimeNotify)
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Get Glove Bomb",
        Func = function()
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Warp" and not game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2124919840) then
                OldTouch = workspace.DEATHBARRIER.CanTouch
                local players = game.Players:GetChildren()
                local RandomPlayer = players[math.random(1, # players)]
                repeat
                    RandomPlayer = players[math.random(1, # players)]
                until RandomPlayer ~= game.Players.LocalPlayer and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("Ragdolled").Value == false
                Target = RandomPlayer
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character:FindFirstChild("HumanoidRootPart").CFrame
                task.wait(0.2)
                game.ReplicatedStorage.WarpHt:FireServer(Target.Character:WaitForChild("HumanoidRootPart"))
                task.wait(0.15)
                if workspace.DEATHBARRIER.CanTouch == true then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").DEATHBARRIER.CFrame
                else
                    workspace.DEATHBARRIER.CanTouch = true
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").DEATHBARRIER.CFrame
                end
                wait(0.1)
                game:GetService("ReplicatedStorage").WLOC:FireServer()
                wait(0.2)
                workspace.DEATHBARRIER.CanTouch = OldTouch
            else
                Notification("You don't have Warp equipped, or you have owner badge", _G.TimeNotify)
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Get Glove Plank",
        Func = function()
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Fort" and not game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 4031317971987872) then
                local OldCFrew = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Safespot"].CFrame * CFrame.new(0, 60, 0)
                wait(0.3)
                game:GetService("ReplicatedStorage").Fortlol:FireServer()
                wait(0.3)
                for i, v in pairs(workspace:GetChildren()) do
                    if v.Name == "Part" and v:FindFirstChild("brownsmoke") and v:FindFirstChild("Sound") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    end
                end
                wait(0.2)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldCFrew
            else
                Notification("You don't have Fort equipped, or you have Owner Badge", _G.TimeNotify)
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Get Glove Blasphemy",
        Func = function()
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "bus" and not game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 3335299217032061) then
                OGL = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                repeat
                    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 or game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
                        break
                    end
                    if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                        local players = game.Players:GetChildren()
                        local RandomPlayer = players[math.random(1, # players)]
                        repeat
                            RandomPlayer = players[math.random(1, # players)]
                        until RandomPlayer ~= game.Players.LocalPlayer and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoReverseCard") == nil and RandomPlayer.Character:FindFirstChild("entered")
                        Target = RandomPlayer
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
                        task.wait(0.34)
                        game:GetService("ReplicatedStorage").busmoment:FireServer()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OGL
                        wait(0.8)
                        repeat
                            task.wait()
                            for i, v in pairs(game.Workspace:GetChildren()) do
                                if v.Name == "BusModel" then
                                    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                end
                            end
                            if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
                                game.Players.LocalPlayer.Character.Torso.Anchored = true
                            end
                        until game.Workspace:FindFirstChild("BusModel") == nil
                        if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
                            game.Players.LocalPlayer.Character.Torso.Anchored = false
                        end
                    end
                    wait(5.5)
                until game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 3335299217032061)
            else
                Notification("You don't have bus equipped, or you have owner badge", _G.TimeNotify)
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Auto Quests Chest All Glove",
        Func = function()
            if workspace.Arena.CannonIsland.TreasureSpots:FindFirstChild("_treasureSpot5").Decal.Transparency == 0 then
                repeat
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.CannonIsland.TreasureSpots:FindFirstChild("_treasureSpot5").CFrame
                    game:GetService("ReplicatedStorage").DigEvent:FireServer({
                        ["index"] = 2,
                        ["cf"] = CFrame.new()
                    })
                until game.Workspace:FindFirstChild("TreasureChestFolder") and game.Workspace.TreasureChestFolder:FindFirstChild("TreasureChest")
                wait(1)
                if game.Workspace:FindFirstChild("TreasureChestFolder") and game.Workspace.TreasureChestFolder:FindFirstChild("TreasureChest") and game.Workspace.TreasureChestFolder.TreasureChest:FindFirstChild("OpenRemote") then
                    game.Workspace.TreasureChestFolder.TreasureChest.OpenRemote:FireServer()
                end
                game:GetService("Players").LocalPlayer.Reset:FireServer()
                repeat
                    task.wait()
                until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health > 0
                wait(0.2)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.BountyHunterRoom.BountyHunterBooth._configPart.CFrame * CFrame.new(- 5, 0, 0)
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Get Glove [Redacted]",
        Func = function()
            if game.Players.LocalPlayer.leaderstats.Slaps.Value >= 5000 then
                for i, v in pairs(workspace.PocketDimension.Doors:GetChildren()) do
                    if game.Players.LocalPlayer:FindFirstChild("_unlockedGloves") and game.Players.LocalPlayer._unlockedGloves:FindFirstChild("[REDACTED]").Value == false then
                        repeat
                            task.wait()
                        until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health > 0
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        task.wait(0.3)
                    end
                end
            else
                Notification("You don't have 5000 slap", _G.TimeNotify)
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Get Glove Tank",
        Func = function()
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Pillow" and game.Players.LocalPlayer:FindFirstChild("_unlockedGloves") and game.Players.LocalPlayer._unlockedGloves:FindFirstChild("Shotgun").Value == true and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer(CFrame.new(260, 36, 191))
                wait(1)
                local Pillow = workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "'s PillowFort")
                repeat
                    task.wait()
                    if workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "'s PillowFort") then
                        game:GetService("ReplicatedStorage").Events.PillowEvent:FireServer("AddPillow")
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pillow.Level0:FindFirstChild("plate").CFrame
                    else
                        game:GetService("ReplicatedStorage").GeneralAbility:FireServer(CFrame.new(260, 36, 191))
                        task.wait(0.2)
                    end
                until workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "'s PillowFort") and Pillow:FindFirstChild("Level0") and Pillow.Level0:FindFirstChild("plate") and Pillow.Level0.plate:FindFirstChild("BillboardGui").level.Text == "Level: 4"
                wait(0.5)
                fireclickdetector(workspace.Lobby.Shotgun.ClickDetector)
                wait(0.5)
                repeat
                    task.wait()
                until game.Players.LocalPlayer.Character
                if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    repeat
                        task.wait()
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                    until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                end
                wait(0.5)
                repeat
                    task.wait()
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == (game.Players.LocalPlayer.Name .. "'s PillowFort") and v:FindFirstChild("Level2") and v.Level2:FindFirstChild("door") then
                            if v.Level2.door:FindFirstChild("Outer").Transparency <= 0 then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Level2.door:FindFirstChild("Outer").CFrame * CFrame.new(0, 0, 7)
                            end
                        end
                    end
                    game:GetService("ReplicatedStorage").GeneralAbility:FireServer("explosive")
                until workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "'s PillowFort") == nil
            else
                Notification("You don't have Pillow equipped, or you don't have owner Shotgun or, you have lobby", _G.TimeNotify)
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Voodoo + Fish + Trap Farm",
        Func = function()
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Ghost" and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
                game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
                fireclickdetector(workspace.Lobby["ZZZZZZZ"].ClickDetector)
                wait(0.2)
                game:GetService("ReplicatedStorage").ZZZZZZZSleep:FireServer()
                fireclickdetector(workspace.Lobby["Brick"].ClickDetector)
                wait(0.2)
                if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    repeat
                        task.wait()
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace.Lobby.Teleport1.CFrame)
                    until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                end
                wait(0.35)
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game.Workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0))
                wait(0.2)
                repeat
                    wait(1)
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Brick") then
                        game.Players.LocalPlayer.Backpack:FindFirstChild("Brick").Parent = game.Players.LocalPlayer.Character
                    end
                    task.wait(0.03)
                    if game.Players.LocalPlayer.Character:FindFirstChild("Brick") then
                        if _G.AutoBrick == "Fast" then
                            game:GetService("ReplicatedStorage").lbrick:FireServer()
                            game:GetService("Players").LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text = game:GetService("Players").LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text + 1
                        elseif _G.AutoBrick == "Slow" then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, x)
                        end
                    end
                until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil or game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2127567042)
            else
                Notification("You don't have Ghost equipped, or You have go to lobby", _G.TimeNotify)
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Get Duck & Orange & Knife Badge",
        Func = function()
            if not game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2124760907) or not game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2128220957) or not game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2124760916) then
                fireclickdetector(game.Workspace.Lobby.Scene.knofe.ClickDetector)
                fireclickdetector(game.Workspace.Arena.island5.Orange.ClickDetector)
                fireclickdetector(game.Workspace.Arena["default island"]["Rubber Ducky"].ClickDetector)
            else
                Notification("You have Owner badge", _G.TimeNotify)
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Get Free Ice Skate",
        Func = function()
            if not game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2906002612987222) then
                game:GetService("ReplicatedStorage").IceSkate:FireServer("Freeze")
            else
                Notification("You have Owner badge", _G.TimeNotify)
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Get Free GRRRRR",
        Func = function()
            if not game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2127861437) then
                game:GetService("ReplicatedStorage").GRRRRR:FireServer(true)
            else
                Notification("You have Owner badge", _G.TimeNotify)
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Get Free Lamp",
        Func = function()
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "ZZZZZZZ" and not game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 490455814138437) then
                for i = 1, 5 do
                    game:GetService("ReplicatedStorage").nightmare:FireServer("LightBroken")
                end
            else
                Notification("You don't have ZZZZZZZ equipped, or Owner badge", _G.TimeNotify)
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Get The Schlop",
        Func = function()
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Cloud" and game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2130032297) and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.CannonIsland.Cannon.Base.CFrame * CFrame.new(0, 2, 35)
                wait(0.3)
                game:GetService("ReplicatedStorage").CloudAbility:FireServer()
                fireclickdetector(workspace.Lobby.fish.ClickDetector)
                wait(0.2)
                if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    repeat
                        task.wait()
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace.Lobby.Teleport1.CFrame)
                    until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                end
                wait(0.3)
                if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.Sit == false then
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("VehicleSeat") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.VehicleSeat.CFrame
                        end
                    end
                end
                wait(0.7)
                for _ = 1, 10 do
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("VehicleSeat") then
                            v.VehicleSeat.CFrame = CFrame.new(245, 129, - 91)
                        end
                    end
                    task.wait()
                end
                wait(0.4)
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                wait(0.5)
                repeat
                    task.wait()
                    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if v.ClassName == "Part" and v.Name ~= "Humanoid" then
                                v.CFrame = game.workspace.Arena.Plate.CFrame
                            end
                        end
                    end
                until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
            else
                Notification("You don't have equiped Cloud | Badge Fish | You are in the lobby.", _G.TimeNotify)
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Get Join Cheese",
        Func = function()
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "el gato" and game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.CannonIsland.Cannon.Base.CFrame * CFrame.new(0, 2, 35)
                wait(0.37)
                workspace.Cheese.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, - 5)
                if fireclickdetector then
                    fireclickdetector(workspace.Cheese.ClickDetector)
                end
            else
                Notification("You don't have el gato equipped, or you aren't in the arena", _G.TimeNotify)
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Get Join Retro",
        Func = function()
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if workspace.Arena:FindFirstChild("CannonIsland") and workspace.Arena.CannonIsland:FindFirstChild("Cannon Island [OLD]") then
                    for i, v in pairs(workspace.Arena.CannonIsland:FindFirstChild("Cannon Island [OLD]"):GetChildren()) do
                        if v.Name == "Model" and v:FindFirstChild("Towers") and v.Towers:FindFirstChild("RevealHitbox") and v.Towers:FindFirstChild("TeleportSFHitbox") then
                            repeat
                                task.wait()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Towers.RevealHitbox.CFrame * CFrame.new(3, 0, 0) * CFrame.Angles(math.rad(0), math.rad(50), math.rad(0))
                                wait(0.2)
                                game:GetService("ReplicatedStorage").RetroAbility:FireServer("Ban Hammer")
                            until v.Towers:FindFirstChild("Ring of Fire") ~= nil
                            wait(0.2)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Towers:FindFirstChild("Ring of Fire").CFrame
                        end
                    end
                end
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Join Map Slenderman",
        Func = function()
            if workspace:FindFirstChild("BountyHunterRoom") and workspace.BountyHunterRoom:FindFirstChild("BountyHunterLever") then
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    if workspace:FindFirstChild("BountyHunterRoom") and workspace.BountyHunterRoom:FindFirstChild("BountyHunterLever") and workspace.BountyHunterRoom.BountyHunterLever:FindFirstChild("Root") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.BountyHunterRoom.BountyHunterLever.Root.CFrame
                        wait(0.4)
                        if fireproximityprompt then
                            fireproximityprompt(workspace.BountyHunterRoom.BountyHunterLever.Root:FindFirstChild("ProximityPrompt"))
                        end
                        repeat
                            task.wait()
                        until workspace.Lobby:FindFirstChild("Clothesline Model") and workspace.Lobby["Clothesline Model"]:FindFirstChild("Part") and workspace.Lobby["Clothesline Model"].Part:FindFirstChild("jerma").Texture == "rbxassetid://16591849948"
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Lobby["Clothesline Model"]:FindFirstChild("Part").CFrame
                        wait(0.3)
                        if fireclickdetector then
                            fireclickdetector(workspace.Lobby["Clothesline Model"].Part:FindFirstChild("ClickDetector"))
                        end
                    end
                end
            else
                Notification("You don't have completed quest hitman", _G.TimeNotify)
            end
        end
    })
    Badge2Group:AddButton({
        Text = "Join Map Egger",
        Func = function()
            if workspace:FindFirstChild("EasterHuntEggs") == nil then
                Notification("You have get Hitman quest", _G.TimeNotify)
                repeat
                    task.wait()
                until workspace:FindFirstChild("EasterHuntEggs")
            end
            if workspace:FindFirstChild("EasterHuntEggs") then
                for i, v in pairs(workspace.EasterHuntEggs:GetChildren()) do
                    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
            wait(0.5)
            if workspace:FindFirstChild("EggTeleport") == nil then
                repeat
                    task.wait()
                until workspace:FindFirstChild("EggTeleport")
            end
            if workspace:FindFirstChild("EggTeleport") and workspace.EggTeleport:FindFirstChild("ClickDetector") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("EggTeleport").CFrame
                if fireclickdetector then
                    fireclickdetector(workspace.EggTeleport.ClickDetector)
                end
            end
        end
    })
    Badge2Group:AddToggle("Friday the 13th", {
        Text = "Auto Join Friday the 13th",
        Default = false,
        Callback = function(Value)
            _G.Fridayth = Value
            while _G.Fridayth do
                if game.Players.LocalPlayer.Character:FindFirstChild("InLabyrinth") then
                    for i, v in pairs(workspace:GetChildren()) do
                        if string.find(v.Name, "Labyrinth") and v:FindFirstChild("PaintingModel") and v.PaintingModel:FindFirstChild("HitBox") then
                            if v.PaintingModel.HitBox:FindFirstChild("TouchInterest") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.PaintingModel:FindFirstChild("HitBox").CFrame
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    })
    Badge2Group:AddDropdown("Farm Bob", {
        Text = "Farm Bob",
        Values = {
            "Walk",
            "Teleport"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.BobFarmCh = Value
        end
    })
    Badge2Group:AddToggle("Bob", {
        Text = "Bob Farm",
        Default = false,
        Callback = function(Value)
            _G.BobFarm = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Replica" and CheckUnlockGlove("bob").Value == false then
                while _G.BobFarm do
                    if game.Players.LocalPlayer.leaderstats.Glove.Value == "Replica" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                            if CheckUnlockGlove("bob").Value == false then
                                if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
                                    if _G.BobFarmCh == "Walk" then
                                        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                                            game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Workspace:FindFirstChild("Lobby"):FindFirstChild("Teleport1").Position)
                                        end
                                    elseif _G.BobFarmCh == "Teleport" then
                                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                                    end
                                end
                                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                                    if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                                        wait(0.17)
                                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, x)
                                        wait(0.12)
                                        game:GetService("Players").LocalPlayer.Reset:FireServer()
                                    end
                                end
                            elseif CheckUnlockGlove("bob").Value == true then
                                Notification("Your got bob", 5)
                                Toggles["Bob"]:SetValue(false)
                            end
                        end
                    end
                    task.wait()
                end
            elseif _G.BobFarm == true then
                Notification("You don't have Replica equipped, or you have owner badge", 5)
                wait(0.05)
                Toggles["Bob"]:SetValue(false)
            end
        end
    })
    Badge2Group:AddToggle("Bus Stab", {
        Text = "Bus Stab",
        Default = false,
        Callback = function(Value)
            _G.BusStab = Value
            while _G.BusStab do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "BusModel" then
                        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("BusStab", {
        Default = "Z",
        Text = "Bus Stab",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Badge2Group:AddToggle("Toolbox Farm", {
        Text = "Toolbox Farm",
        Default = false,
        Callback = function(Value)
            _G.Toolboxfarm = Value
            while _G.Toolboxfarm do
                if game.Workspace:FindFirstChild("Toolbox") then
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "Toolbox" then
                            if v:FindFirstChild("Main") then
                                v.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(- 5, - 1.63, 0)
                            end
                            if fireclickdetector and v:FindFirstChild("ClickDetector") then
                                fireclickdetector(v.ClickDetector, 0)
                                fireclickdetector(v.ClickDetector, 1)
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("ToolboxFarm", {
        Default = "Z",
        Text = "Toolbox Farm",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Badge2Group:AddToggle("Hallow Jack Farm", {
        Text = "Hallow Jack Farm",
        Default = false,
        Callback = function(Value)
            _G.HallowJackFarm = Value
            while _G.HallowJackFarm do
                if workspace:FindFirstChild("Gravestone") then
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "Gravestone" and v:FindFirstChild("ClickDetector") then
                            if game.Players.LocalPlayer.Character:FindFirstChild("KillstreakLevel") and game.Players.LocalPlayer.Character:FindFirstChild("KillstreakLevel").Value > 9 then
                                fireclickdetector(v.ClickDetector, 0)
                                fireclickdetector(v.ClickDetector, 1)
                            end
                        end
                    end
                elseif workspace:FindFirstChild("Gravestone") == nil and game.Players.LocalPlayer.Character:FindFirstChild("KillstreakLevel") and game.Players.LocalPlayer.Character:FindFirstChild("KillstreakLevel").Value > 9 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Safespot"].CFrame * CFrame.new(0, 10, 0)
                end
                task.wait()
            end
        end
    }):AddKeyPicker("HallowJackFarm", {
        Default = "S",
        Text = "Hallow Jack Farm",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Badge2Group:AddToggle("Phase Or Jet Farm", {
        Text = "Phase & Jet Farm",
        Default = false,
        Callback = function(Value)
            _G.PhaseOrJetfarm = Value
            while _G.PhaseOrJetfarm do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "JetOrb" or v.Name == "PhaseOrb" then
                        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("PhaseOrJetFarm", {
        Default = "U",
        Text = "Phase & Jet Farm",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Badge2Group:AddToggle("MATERIALIZE Farm", {
        Text = "MATERIALIZE Farm",
        Default = false,
        Callback = function(Value)
            _G.MATERIALIZEfarm = Value
            while _G.MATERIALIZEfarm do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "MATERIALIZEOrb" then
                        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("MATERIALIZEFarm", {
        Default = "F",
        Text = "MATERIALIZE Farm",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Badge2Group:AddToggle("Siphon Farm", {
        Text = "Siphon Farm",
        Default = false,
        Callback = function(Value)
            _G.Siphonfarm = Value
            while _G.Siphonfarm do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "SiphonOrb" then
                        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("SiphonFarm", {
        Default = "F",
        Text = "Siphon Farm",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Badge2Group:AddToggle("Phase Or Jet Glitch", {
        Text = "Phase & Jet Glitch",
        Default = false,
        Callback = function(Value)
            _G.Glitchfarm = Value
            while _G.Glitchfarm do
                if game.Players.LocalPlayer.leaderstats.Glove.Value == "Error" then
                    if game.Workspace:FindFirstChild("JetOrb") or game.Workspace:FindFirstChild("PhaseOrb") then
                        for i, v in pairs(game.Workspace:GetChildren()) do
                            if v.Name == "JetOrb" or v.Name == "PhaseOrb" then
                                game.ReplicatedStorage.Errorhit:FireServer(v)
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("PhaseOrJetGlitch", {
        Default = "L",
        Text = "Phase & Jet Glitch",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Badge2Group:AddToggle("Gift Farm", {
        Text = "Gift Farm",
        Default = false,
        Callback = function(Value)
            _G.Giftfarm = Value
            while _G.Giftfarm do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Gift" and game.Players.LocalPlayer.Character:FindFirstChild("Head") then
                        v.CFrame = game.Players.LocalPlayer.Character.Head.CFrame
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("GiftFarm", {
        Default = "K",
        Text = "Gift Farm",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Badge2Group:AddDropdown("Farm Brick", {
        Text = "Farm Brick",
        Values = {
            "Slow",
            "Fast"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.AutoBrick = Value
        end
    })
    Badge2Group:AddToggle("AutoFram Brick", {
        Text = "AutoFram Brick",
        Default = false,
        Callback = function(Value)
            _G.Brickfarm = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Brick" then
                while _G.Brickfarm do
                    repeat
                        task.wait()
                    until _G.Brickfarm == false or game.Players.LocalPlayer.Character:FindFirstChild("Brick")
                    if game.Players.LocalPlayer.Character:FindFirstChild("Brick") then
                        if _G.AutoBrick == "Slow" then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, x)
                        elseif _G.AutoBrick == "Fast" then
                            game:GetService("ReplicatedStorage").lbrick:FireServer()
                            game:GetService("Players").LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text = game:GetService("Players").LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text + 1
                        end
                    end
                    task.wait(1.2)
                end
            elseif Brickfarm == true then
                Notification("You don't have Brick equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["AutoFram Brick"]:SetValue(false)
            end
        end
    })
    Badge2Group:AddToggle("Get Tycoon", {
        Text = "Get Tycoon",
        Default = false,
        Callback = function(Value)
            _G.AutoTpPlate = Value
            if game.Players.LocalPlayer.Character:FindFirstChild("entered") and # game.Players:GetPlayers() >= 7 then
                while _G.AutoTpPlate do
                    if game.Players.LocalPlayer.Character:FindFirstChild("entered") and # game.Players:GetPlayers() >= 7 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Arena.Plate.CFrame
                    end
                    task.wait()
                end
            elseif _G.AutoTpPlate == true then
                Notification("You need enter erane, or 7 people the server", _G.TimeNotify)
                wait(0.05)
                Toggles["Get Tycoon"]:SetValue(false)
            end
        end
    })
    local Badge3Group = Tabs.Tab3:AddRightGroupbox("Mastery Badge")
    Badge3Group:AddDropdown("Tycoon Mastery", {
        Text = "Tycoon Mastery",
        Values = {
            "15k Point Die",
            "Defense Tycoon (Walk)",
            "Defense Tycoon (TP)",
            "Kill Player (Tycoon God)"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.TycoonMastery = Value
        end
    })
    Badge3Group:AddToggle("Auto Tycoon Mastery", {
        Text = "Auto Tycoon Mastery",
        Default = false,
        Callback = function(Value)
            _G.AutoTycoonMastery = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Tycoon" then
                while _G.AutoTycoonMastery do
                    if _G.TycoonMastery == "15k Point Die" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                            if game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name) and game.Workspace["ÅTycoon" .. game.Players.LocalPlayer.Name]:GetAttribute("LastCount") < 15000 then
                                for _, v in pairs(game.Workspace:GetChildren()) do
                                    if v.Name:match(game.Players.LocalPlayer.Name) then
                                        for i, x in pairs(v:GetChildren()) do
                                            if x.Name == "TycoonDrop" then
                                                x.CFrame = v.End.CFrame
                                            end
                                        end
                                        if v:FindFirstChild("Click") then
                                            fireclickdetector(v.Click.ClickDetector, 0)
                                            fireclickdetector(v.Click.ClickDetector, 1)
                                        end
                                    end
                                end
                                if game.CoreGui:FindFirstChild("Gui Track").Enabled == false then
                                    game.CoreGui["Gui Track"].Enabled = true
                                elseif game.CoreGui:FindFirstChild("Gui Track").Enabled == true then
                                    game.CoreGui["Gui Track"].Frame:FindFirstChild("TextLabel").Text = "Tycoon Your Point\n" .. game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name):GetAttribute("LastCount") .. " / 15000"
                                    game.CoreGui["Gui Track"].Frame.Frame:FindFirstChild("Frame1").Size = UDim2.new(game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name):GetAttribute("LastCount") / 15000, 0, 1, 0)
                                end
                            elseif game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name) == nil then
                                game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(CFrame.new(17894, - 26.257728576660156, - 3579.11279296875, 0.9996822476387024, - 1.1041408759515647e-10, 0.02520809881389141, 2.8899729831444176e-10, 1, - 7.080715569429685e-09, - 0.02520809881389141, 7.085750652890965e-09, 0.9996822476387024))
                                spawn(function()
                                    repeat
                                        task.wait()
                                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0))
                                    until (game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name) and game.Workspace["ÅTycoon" .. game.Players.LocalPlayer.Name]:GetAttribute("LastCount") >= 15000) or (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0)
                                end)
                                wait(1)
                            end
                            if game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name) and game.Workspace["ÅTycoon" .. game.Players.LocalPlayer.Name]:GetAttribute("LastCount") >= 15000 then
                                if game.CoreGui:FindFirstChild("Gui Track").Enabled == true then
                                    game.CoreGui["Gui Track"].Enabled = false
                                    game.CoreGui["Gui Track"].Frame:FindFirstChild("TextLabel").Text = "Nah"
                                    game.CoreGui["Gui Track"].Frame.Frame:FindFirstChild("Frame1").Size = UDim2.new(1, 0, 1, 0)
                                end
                                repeat
                                    task.wait()
                                    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game.Workspace.DEATHBARRIER.CFrame)
                                until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0
                            end
                        end
                    elseif _G.TycoonMastery:match("Defense Tycoon") then
                        if game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name) then
                            local Target = nil
                            for i, v in pairs(game.Players:GetChildren()) do
                                if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                                    if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character.Ragdolled.Value == false and v.Character:FindFirstChild("Mirage") == nil then
                                        if v.Character.Head:FindFirstChild("UnoReverseCard") == nil then
                                            if (v.Character.HumanoidRootPart.Position - game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name):FindFirstChild("End").Position).Magnitude < 30 then
                                                Target = v.Character
                                            end
                                            if _G.TycoonMastery == "Defense Tycoon (Walk)" then
                                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name):FindFirstChild("End").Position).Magnitude > 45 then
                                                    local DstancePlayer = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                                                    if DstancePlayer < 75 then
                                                        Target = v.Character
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            if Target then
                                if _G.TycoonMastery == "Defense Tycoon (Walk)" then
                                    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                                            if v:IsA("Tool") and v:FindFirstChild("Glove") then
                                                if (v:FindFirstChild("Glove").Position - Target.HumanoidRootPart.Position).Magnitude <= 5 then
                                                    game:GetService("VirtualUser"):ClickButton1(Vector2.new(200, 200))
                                                else
                                                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(Target.HumanoidRootPart.Position)
                                                end
                                            end
                                        end
                                    end
                                elseif _G.TycoonMastery == "Defense Tycoon (TP)" then
                                    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(Target.HumanoidRootPart.CFrame)
                                    wait(0.3)
                                    for i = 1, 1000 do
                                        gloveHits["All"]:FireServer(Target.HumanoidRootPart)
                                    end
                                end
                            else
                                if game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name):FindFirstChild("End") then
                                    if _G.TycoonMastery == "Defense Tycoon (Walk)" then
                                        game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name):FindFirstChild("End").Position)
                                    elseif _G.TycoonMastery == "Defense Tycoon (TP)" then
                                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name):FindFirstChild("End").CFrame)
                                    end
                                end
                            end
                        end
                    elseif _G.TycoonMastery == "Kill Player (Tycoon God)" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                            if game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name) and game.Workspace["ÅTycoon" .. game.Players.LocalPlayer.Name]:GetAttribute("LastCount") < 5000 then
                                for _, v in pairs(game.Workspace:GetChildren()) do
                                    if v.Name:match(game.Players.LocalPlayer.Name) then
                                        for i, x in pairs(v:GetChildren()) do
                                            if x.Name == "TycoonDrop" then
                                                x.CFrame = v.End.CFrame
                                            end
                                        end
                                        if v:FindFirstChild("Click") then
                                            fireclickdetector(v.Click.ClickDetector, 0)
                                            fireclickdetector(v.Click.ClickDetector, 1)
                                        end
                                    end
                                end
                                if game.CoreGui:FindFirstChild("Gui Track").Enabled == false then
                                    game.CoreGui["Gui Track"].Enabled = true
                                elseif game.CoreGui:FindFirstChild("Gui Track").Enabled == true then
                                    game.CoreGui["Gui Track"].Frame:FindFirstChild("TextLabel").Text = "Tycoon Your Point\n" .. game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name):GetAttribute("LastCount") .. " / 5000"
                                    game.CoreGui["Gui Track"].Frame.Frame:FindFirstChild("Frame1").Size = UDim2.new(game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name):GetAttribute("LastCount") / 5000, 0, 1, 0)
                                end
                            elseif game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name) == nil then
                                game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(CFrame.new(17894, - 26.257728576660156, - 3579.11279296875, 0.9996822476387024, - 1.1041408759515647e-10, 0.02520809881389141, 2.8899729831444176e-10, 1, - 7.080715569429685e-09, - 0.02520809881389141, 7.085750652890965e-09, 0.9996822476387024))
                                spawn(function()
                                    repeat
                                        task.wait()
                                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0))
                                    until (game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name) and game.Workspace["ÅTycoon" .. game.Players.LocalPlayer.Name]:GetAttribute("LastCount") >= 5000) or (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0)
                                end)
                                wait(1)
                            end
                            if game.Workspace:FindFirstChild("ÅTycoon" .. game.Players.LocalPlayer.Name) and game.Workspace["ÅTycoon" .. game.Players.LocalPlayer.Name]:GetAttribute("LastCount") >= 5000 then
                                if game.CoreGui:FindFirstChild("Gui Track").Enabled == true then
                                    game.CoreGui["Gui Track"].Enabled = false
                                    game.CoreGui["Gui Track"].Frame:FindFirstChild("TextLabel").Text = "Nah"
                                    game.CoreGui["Gui Track"].Frame.Frame:FindFirstChild("Frame1").Size = UDim2.new(1, 0, 1, 0)
                                end
                                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                    for i, v in pairs(game.Players:GetChildren()) do
                                        if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
                                            if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character.Ragdolled.Value == false and v.Character:FindFirstChild("Mirage") == nil then
                                                if v.Character.Head:FindFirstChild("UnoReverseCard") == nil then
                                                    if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                                                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                                            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(v.Character:FindFirstChild("HumanoidRootPart").CFrame)
                                                            repeat
                                                                task.wait()
                                                            until _G.AutoTycoonMastery == false or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude < 6
                                                            wait(0.35)
                                                            gloveHits["All"]:FireServer(v.Character:FindFirstChild("HumanoidRootPart"))
                                                            wait(0.05)
                                                            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0))
                                                            task.wait(7)
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    task.wait()
                end
                if game.CoreGui:FindFirstChild("Gui Track").Enabled == true then
                    game.CoreGui["Gui Track"].Enabled = false
                    game.CoreGui["Gui Track"].Frame:FindFirstChild("TextLabel").Text = "Nah"
                    game.CoreGui["Gui Track"].Frame.Frame:FindFirstChild("Frame1").Size = UDim2.new(1, 0, 1, 0)
                end
            elseif Value == true then
                Notification("You don't have Tycoon equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Tycoon Mastery"]:SetValue(false)
            end
        end
    })
    Badge3Group:AddDropdown("Phase Mastery", {
        Text = "Phase Mastery",
        Values = {
            "200 Second Island",
            "Slap + Ability",
            "Ability + Slap (2 Sec)"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.PhaceMastery = Value
        end
    })
    Badge3Group:AddToggle("Auto Phase Mastery", {
        Text = "Auto Phase Mastery",
        Default = false,
        Callback = function(Value)
            _G.AutoPhaseMastery = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Phase" then
                while _G.AutoPhaseMastery do
                    if _G.PhaceMastery == "200 Second Island" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            if not _G.PlaceTp then
                                _G.PlaceTp = {
                                    ["Island 1"] = workspace.Arena.island4:FindFirstChild("moyai").CFrame * CFrame.new(0, 0, - 30),
                                    ["Island 2"] = game.workspace:FindFirstChild("Origo").CFrame * CFrame.new(0, - 5, 0),
                                    ["Island 3"] = workspace.Arena.island1["Sakura Tree"]["petal pile"].CFrame * CFrame.new(0, 5, 0),
                                    ["Island 4"] = workspace.Arena.island2["Sakura Tree"]["petal pile"].CFrame * CFrame.new(0, 5, 0),
                                    ["Island 5"] = workspace.Arena.island3["Sakura Tree"]["petal pile"].CFrame * CFrame.new(0, 5, 0),
                                    ["Island 6"] = workspace.Arena.island5:FindFirstChild("Union").CFrame * CFrame.new(0, 3.25, 0),
                                    ["Island 7"] = workspace.Arena.CannonIsland.Cannon:FindFirstChild("Base").CFrame * CFrame.new(0, 0, 35),
                                    ["Island 8"] = workspace.Arena.Fort:FindFirstChild("Floor").CFrame * CFrame.new(0, 5, 0)
                                }
                            end
                            for i, v in pairs(_G.PlaceTp) do
                                if _G.AutoPhaseMastery == true then
                                    game:GetService("ReplicatedStorage").PhaseA:FireServer()
                                    wait(0.3)
                                    repeat
                                        task.wait()
                                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(v)
                                        end
                                    until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BlackheartREAL") == nil
                                    task.wait(1)
                                end
                            end
                        end
                    elseif _G.PhaceMastery == "Slap + Ability" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            for i, v in pairs(game.Players:GetChildren()) do
                                if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
                                    if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character.Ragdolled.Value == false and v.Character:FindFirstChild("Mirage") == nil then
                                        if v.Character.Head:FindFirstChild("UnoReverseCard") == nil then
                                            if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                                                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                                    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(v.Character:FindFirstChild("HumanoidRootPart").CFrame)
                                                    repeat
                                                        task.wait()
                                                    until _G.AutoPhaseMastery == false or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude < 6
                                                    wait(0.35)
                                                    gloveHits["Phase"]:FireServer(v.Character:FindFirstChild("HumanoidRootPart"))
                                                    wait(0.05)
                                                    game:GetService("ReplicatedStorage").PhaseA:FireServer()
                                                    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0))
                                                    wait(0.2)
                                                    repeat
                                                        task.wait()
                                                    until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BlackheartREAL") == nil
                                                    task.wait(3)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    elseif _G.PhaceMastery == "Ability + Slap (2 Sec)" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            for i, v in pairs(game.Players:GetChildren()) do
                                if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
                                    if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character.Ragdolled.Value == false and v.Character:FindFirstChild("Mirage") == nil then
                                        if v.Character.Head:FindFirstChild("UnoReverseCard") == nil then
                                            if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                                                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                                    game:GetService("ReplicatedStorage").PhaseA:FireServer()
                                                    wait(0.25)
                                                    repeat
                                                        task.wait()
                                                    until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BlackheartREAL") == nil
                                                    wait(0.11)
                                                    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(v.Character:FindFirstChild("HumanoidRootPart").CFrame)
                                                    repeat
                                                        task.wait()
                                                    until _G.AutoPhaseMastery == false or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude < 6
                                                    wait(0.35)
                                                    gloveHits["Phase"]:FireServer(v.Character:FindFirstChild("HumanoidRootPart"))
                                                    wait(0.05)
                                                    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0))
                                                    task.wait(3)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    task.wait()
                end
            elseif Value == true then
                Notification("You don't have Phase equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Phase Mastery"]:SetValue(false)
            end
        end
    })
    Badge3Group:AddDropdown("Shard Mastery", {
        Text = "Shard Mastery",
        Values = {
            "Aimbot Overkill",
            "Get Slap",
            "Aimbot Character"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.ShardMastery = Value
        end
    })
    Badge3Group:AddToggle("Auto Shard Mastery", {
        Text = "Auto Shard Mastery",
        Default = false,
        Callback = function(Value)
            _G.AutoShardMastery = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Shard" then
                while _G.AutoShardMastery do
                    if _G.ShardMastery == "Aimbot Overkill" then
                        for i, v in pairs(game.Players:GetChildren()) do
                            if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
                                if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character.Ragdolled.Value == false and v.Character:FindFirstChild("Mirage") == nil then
                                    if v.leaderstats.Glove.Value == "OVERKILL" then
                                        if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled").Value == false then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, Vector3.new(v.Character.HumanoidRootPart.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, v.Character.HumanoidRootPart.Position.Z))
                                        end
                                    end
                                end
                            end
                        end
                    elseif _G.ShardMastery == "Get Slap" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            fireclickdetector(workspace.Lobby.Replica.ClickDetector)
                            wait(0.5)
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character
                            if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    task.wait()
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport2.TouchInterest.Parent, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport2.TouchInterest.Parent, 1)
                                until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                            end
                            wait(0.1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                            wait(0.8)
                            game:GetService("ReplicatedStorage").Duplicate:FireServer(true)
                            game:GetService("Players").LocalPlayer.Reset:FireServer()
                            wait(0.05)
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            fireclickdetector(workspace.Lobby.Shard.ClickDetector)
                            wait(0.3)
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character
                            if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    task.wait()
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                                until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                            end
                            wait(0.2)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                            for i, v in pairs(game.Workspace:GetChildren()) do
                                if v.Name == ("Å" .. game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
                                    repeat
                                        task.wait()
                                        if gloveHits["Shard"] and v:FindFirstChild("HumanoidRootPart") then
                                            gloveHits["Shard"]:FireServer(v:FindFirstChild("HumanoidRootPart"))
                                        end
                                    until v:FindFirstChild("HumanoidRootPart") == nil or _G.AutoShardMastery == false
                                end
                            end
                            wait(0.2)
                            game:GetService("Players").LocalPlayer.Reset:FireServer()
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if _G.AutoShardMastery == true then
                                fireclickdetector(workspace.Lobby.Replica.ClickDetector)
                            else
                                fireclickdetector(workspace.Lobby.Shard.ClickDetector)
                            end
                        end
                    elseif _G.ShardMastery == "Aimbot Character" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local Distance, TargetCharacter = math.huge, nil
                            for i, v in pairs(game.Players:GetChildren()) do
                                if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
                                    if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character.Ragdolled.Value == false and v.Character:FindFirstChild("Mirage") == nil then
                                        if v.Character.Head:FindFirstChild("UnoReverseCard") == nil then
                                            local DistancePlayer = (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.Character.HumanoidRootPart.Position).Magnitude
                                            if DistancePlayer < Distance then
                                                Distance, TargetCharacter = DistancePlayer, v
                                            end
                                        end
                                    end
                                end
                            end
                            if TargetCharacter then
                                if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled").Value == false then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, Vector3.new(TargetCharacter.Character.HumanoidRootPart.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, TargetCharacter.Character.HumanoidRootPart.Position.Z))
                                end
                            end
                        end
                    end
                    task.wait()
                end
            elseif _G.AutoShardMastery == true then
                Notification("You don't have Shard equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Shard Mastery"]:SetValue(false)
            end
        end
    })
    Badge3Group:AddDropdown("Space Mastery", {
        Text = "Space Mastery",
        Values = {
            "Place Time",
            "Complete On Island Slapple"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.SpaceMastery = Value
        end
    })
    Badge3Group:AddToggle("Auto Space Mastery", {
        Text = "Auto Space Mastery",
        Default = false,
        Callback = function(Value)
            _G.AutoSpaceMastery = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Space" then
                while _G.AutoSpaceMastery do
                    if _G.SpaceMastery == "Place Time" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                        task.wait(1)
                        game:GetService("ReplicatedStorage").ZeroGSound:FireServer()
                        game:GetService("Players").LocalPlayer.Reset:FireServer()
                        repeat
                            wait()
                        until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health > 0
                        wait(0.3)
                    elseif _G.SpaceMastery == "Complete On Island Slapple" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character
                            if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    task.wait()
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                                until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                            end
                        end
                        wait(0.5)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(227, 48, 169)
                        wait(0.25)
                        for i, v in ipairs(game.Workspace.Arena.CannonIsland:GetDescendants()) do
                            if v.ClassName == "ProximityPrompt" then
                                fireproximityprompt(v)
                            end
                        end
                        repeat
                            task.wait()
                        until game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true
                        wait(0.3)
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Space") then
                            game.Players.LocalPlayer.Backpack:FindFirstChild("Space").Parent = game.Players.LocalPlayer.Character
                        end
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, x)
                        wait(1)
                        repeat
                            task.wait()
                            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                                    if v.ClassName == "Part" and v.Name ~= "Humanoid" then
                                        v.CFrame = game.workspace.Arena.island5.Union.CFrame * CFrame.new(0, 3.25, 0)
                                    end
                                end
                            end
                        until game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
                        wait(1)
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game.workspace.Arena.island5.Union.CFrame * CFrame.new(0, 3.25, 0))
                        task.wait(6)
                    end
                    task.wait()
                end
            elseif _G.AutoSpaceMastery == true then
                Notification("You don't have Space equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Space Mastery"]:SetValue(false)
            end
        end
    })
    Badge3Group:AddDropdown("Flash Mastery", {
        Text = "Flash Mastery",
        Values = {
            "Time + Slap",
            "Ambush"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.FlashMastery = Value
        end
    })
    Badge3Group:AddToggle("Auto Flash Mastery", {
        Text = "Auto Flash Mastery",
        Default = false,
        Callback = function(Value)
            _G.AutoFlashMastery = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Flash" then
                while _G.AutoFlashMastery do
                    if _G.FlashMastery == "Time + Slap" then
                        for i = 1, 9000 do
                            game:GetService("ReplicatedStorage").FlashTeleport:FireServer()
                        end
                    elseif _G.FlashMastery == "Ambush" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            fireclickdetector(workspace.Lobby.Replica.ClickDetector)
                            wait(0.5)
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character
                            if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    task.wait()
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport2.TouchInterest.Parent, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport2.TouchInterest.Parent, 1)
                                until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                            end
                            wait(0.1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                            wait(0.8)
                            game:GetService("ReplicatedStorage").Duplicate:FireServer(true)
                            game:GetService("Players").LocalPlayer.Reset:FireServer()
                            wait(0.05)
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            fireclickdetector(workspace.Lobby.Flash.ClickDetector)
                            wait(0.3)
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character
                            if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    task.wait()
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                                until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                            end
                            wait(0.2)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                            for i, v in pairs(game.Workspace:GetChildren()) do
                                if v.Name == ("Å" .. game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
                                    task.spawn(function()
                                        repeat
                                            game:GetService("ReplicatedStorage").FlashTeleport:FireServer()
                                            task.wait(5.7)
                                        until v:FindFirstChild("HumanoidRootPart") == nil or _G.AutoFlashMastery == false
                                    end)
                                    wait(0.2)
                                    repeat
                                        task.wait()
                                        if gloveHits["Flash"] and v:FindFirstChild("HumanoidRootPart") then
                                            gloveHits["Flash"]:FireServer(v:FindFirstChild("HumanoidRootPart"))
                                        end
                                    until v:FindFirstChild("HumanoidRootPart") == nil or _G.AutoFlashMastery == false
                                end
                            end
                            wait(0.2)
                            game:GetService("Players").LocalPlayer.Reset:FireServer()
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if _G.AutoFlashMastery == true then
                                fireclickdetector(workspace.Lobby.Replica.ClickDetector)
                            else
                                fireclickdetector(workspace.Lobby.Flash.ClickDetector)
                            end
                        end
                    end
                    task.wait()
                end
            elseif _G.AutoFlashMastery == true then
                Notification("You don't have Flash equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Flash Mastery"]:SetValue(false)
            end
        end
    })
    Badge3Group:AddDropdown("Fort Mastery", {
        Text = "Fort Mastery",
        Values = {
            "Build",
            "Build + Break"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.FortMastery = Value
        end
    })
    Badge3Group:AddToggle("Auto Fort Mastery", {
        Text = "Auto Fort Mastery",
        Default = false,
        Callback = function(Value)
            _G.AutoFortMastery = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Fort" then
                while _G.AutoFortMastery do
                    if _G.FortMastery == "Build + Break" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            repeat
                                task.wait()
                                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 1)
                                end
                            until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                            repeat
                                task.wait()
                                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 1)
                                end
                                if game.Players.LocalPlayer.Backpack:FindFirstChild("Fort") then
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Fort)
                                end
                                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, x)
                                for i, v in pairs(game.Workspace:GetChildren()) do
                                    if v.Name == "Part" and v:FindFirstChild("brownsmoke") and v:FindFirstChild("Sound") and 200 >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude then
                                        if v.CanCollide == true then
                                            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(v.CFrame)
                                            task.wait(0.05)
                                            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false then
                                                game.ReplicatedStorage.SelfKnockback:FireServer({
                                                    ["Force"] = - 99
                                                })
                                            end
                                        end
                                    end
                                end
                            until _G.AutoFortMastery == false or game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0
                        end
                    elseif _G.FortMastery == "Build" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            repeat
                                task.wait()
                                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 1)
                                end
                            until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                            repeat
                                task.wait()
                                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 1)
                                end
                                if game.Players.LocalPlayer.Backpack:FindFirstChild("Fort") then
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Fort)
                                end
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, x)
                                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0))
                            until _G.AutoFortMastery == false or game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0
                        end
                    end
                    task.wait()
                end
            elseif _G.AutoFortMastery == true then
                Notification("You don't have Fort equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Fort Mastery"]:SetValue(false)
            end
        end
    })
    Badge3Group:AddDropdown("Rob Mastery", {
        Text = "Rob Mastery",
        Values = {
            "Studs",
            "Get Kill"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.RobMastery = Value
        end
    })
    local TweenRob = 1
    Badge3Group:AddToggle("Auto Rob Mastery", {
        Text = "Auto Rob Mastery",
        Default = false,
        Callback = function(Value)
            _G.AutoRobMastery = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "rob" then
                while _G.AutoRobMastery do
                    if _G.RobMastery == "Studs" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                            local TweenPlayRob = {
                                CFrame.new(9762, 38, 10237),
                                CFrame.new(9763, 38, 9761),
                                CFrame.new(10241, 38, 9758),
                                CFrame.new(10236, 38, 10236)
                            }
                            function NextTweenRob()
                                local RobFarm = TweenPlayRob[TweenRob]
                                TweenRob = TweenRob + 1
                                if TweenRob > # TweenPlayRob then
                                    TweenRob = 1
                                end
                                return RobFarm
                            end
                            game:GetService("ReplicatedStorage").rob:FireServer()
                            for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
                                if v.Name == "whiteframe" then
                                    v:Destroy()
                                end
                            end
                            if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                                for i, v in pairs(game.Workspace:GetChildren()) do
                                    if v.Name == "Field" and 0 >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude then
                                        local TweenRobTag = NextTweenRob()
                                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(TweenRobTag)
                                        end
                                    end
                                end
                            end
                        end
                    elseif _G.RobMastery == "Get Kill" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            fireclickdetector(workspace.Lobby.Replica.ClickDetector)
                            wait(0.5)
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character
                            if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    task.wait()
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport2.TouchInterest.Parent, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport2.TouchInterest.Parent, 1)
                                until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                            end
                            wait(0.1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                            wait(0.8)
                            game:GetService("ReplicatedStorage").Duplicate:FireServer(true)
                            game:GetService("Players").LocalPlayer.Reset:FireServer()
                            wait(0.05)
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            fireclickdetector(workspace.Lobby.rob.ClickDetector)
                            wait(0.3)
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character
                            if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    task.wait()
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                                until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                            end
                            wait(0.2)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                            wait(0.25)
                            game:GetService("ReplicatedStorage").rob:FireServer()
                            for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
                                if v.Name == "whiteframe" then
                                    v:Destroy()
                                end
                            end
                            repeat
                                task.wait()
                            until _G.AutoRobMastery == false or game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and game.Players.LocalPlayer.Character:FindFirstChild("Head").Transparency == 1
                            wait(0.2)
                            for i, v in pairs(game.Workspace:GetChildren()) do
                                if v.Name == ("Å" .. game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
                                    repeat
                                        task.wait()
                                        if v:FindFirstChild("HumanoidRootPart") then
                                            v:FindFirstChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                        end
                                    until _G.AutoRobMastery == false or v:FindFirstChild("HumanoidRootPart") == nil
                                end
                            end
                            task.wait(0.1)
                            game:GetService("Players").LocalPlayer.Reset:FireServer()
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if _G.WormholeMastery == true then
                                fireclickdetector(workspace.Lobby.Replica.ClickDetector)
                            else
                                fireclickdetector(workspace.Lobby.rob.ClickDetector)
                            end
                        end
                    end
                    task.wait()
                end
            elseif _G.AutoRobMastery == true then
                Notification("You don't have Rob equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Rob Mastery"]:SetValue(false)
            end
        end
    })
    Badge3Group:AddDropdown("Cloud Mastery", {
        Text = "Cloud Mastery",
        Values = {
            "Studs (200k Fly)",
            "Afk (200 Min)",
            "Pickup Player (100 Player)"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.CloudMastery = Value
        end
    })
    local TweenGet = 1
    _G.GetPlayerSit = {}
    Badge3Group:AddToggle("Auto Cloud Mastery", {
        Text = "Auto Cloud Mastery",
        Default = false,
        Callback = function(Value)
            _G.AutoCloudMastery = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Cloud" then
                while _G.AutoCloudMastery do
                    if _G.CloudMastery == "Studs (200k Fly)" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                            local TweenPlay = {
                                CFrame.new(4, 113, 209),
                                CFrame.new(228, 98, - 11),
                                CFrame.new(- 9, 137, - 215),
                                CFrame.new(- 229, 138, 2),
                                CFrame.new(265, 78, 198),
                                CFrame.new(75, - 74, 48),
                                CFrame.new(- 229, 138, 2),
                                CFrame.new(170, - 90, - 101),
                                CFrame.new(- 63, - 88, - 112),
                                CFrame.new(- 123, - 77, 97),
                                CFrame.new(110, - 78, 81),
                                CFrame.new(- 367, - 72, - 11),
                                CFrame.new(- 497, - 73, - 18),
                                CFrame.new(- 437, 106, - 27)
                            }
                            function NextTween()
                                local TweenNextGo = TweenPlay[TweenGet]
                                TweenGet = TweenGet + 1
                                if TweenGet > # TweenPlay then
                                    TweenGet = 1
                                end
                                return TweenNextGo
                            end
                            if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                                for i, v in pairs(game.Workspace:GetChildren()) do
                                    if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("VehicleSeat") then
                                        local TweenTag = NextTween()
                                        v.VehicleSeat.CFrame = TweenTag
                                    end
                                end
                            elseif game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.Sit == false then
                                for i, v in pairs(game.Workspace:GetChildren()) do
                                    if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("VehicleSeat") then
                                        TweenTp(game.Players.LocalPlayer.Character.HumanoidRootPart, v.VehicleSeat.CFrame, true, 0.6)
                                    end
                                end
                            end
                        end
                    elseif _G.CloudMastery == "Afk (200 Min)" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.CannonIsland.Cannon.Base.CFrame * CFrame.new(0, 2, 35)
                            wait(0.3)
                            game:GetService("ReplicatedStorage").CloudAbility:FireServer()
                            fireclickdetector(workspace.Lobby.Diamond.ClickDetector)
                            wait(0.2)
                            if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    task.wait()
                                    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace.Lobby.Teleport1.CFrame)
                                until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                            end
                            wait(0.3)
                            repeat
                                task.wait()
                                if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.Sit == false then
                                    for i, v in pairs(game.Workspace:GetChildren()) do
                                        if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("VehicleSeat") then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.VehicleSeat.CFrame
                                        end
                                    end
                                end
                            until game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.Sit == true
                            task.wait(1)
                            for i, v in pairs(game.Workspace:GetChildren()) do
                                if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("VehicleSeat") then
                                    TweenTp(v.VehicleSeat, CFrame.new(245, 129, - 91), false, 1)
                                end
                            end
                            wait(0.3)
                            game:GetService("ReplicatedStorage").Rockmode:FireServer()
                            Toggles["Anti Afk"]:SetValue(true)
                        end
                    elseif _G.CloudMastery == "Pickup Player (100 Player)" then
                        local players = game.Players:GetChildren()
                        local RandomPlayer = players[math.random(1, # players)]
                        if _G.GetPlayerSit == RandomPlayer then
                            return RandomPlayer
                        end
                        if RandomPlayer ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and RandomPlayer.Character then
                            if RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("HumanoidRootPart") and RandomPlayer.Character:FindFirstChild("Humanoid") and RandomPlayer.Character:FindFirstChild("stevebody") == nil and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character.Humanoid.Sit == false and RandomPlayer.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and RandomPlayer.Character.Ragdolled.Value == false and RandomPlayer.Character:FindFirstChild("Mirage") == nil then
                                repeat
                                    task.wait()
                                    for i, g in pairs(game.Workspace:GetChildren()) do
                                        if g.Name:match(game.Players.LocalPlayer.Name) and g:FindFirstChild("Seat") then
                                            RandomPlayer.Character.HumanoidRootPart.CFrame = g.Seat.CFrame
                                        end
                                    end
                                until RandomPlayer.Character.Humanoid.Sit == true
                                if _G.GetPlayerSit ~= RandomPlayer then
                                    table.insert(_G.GetPlayerSit, RandomPlayer)
                                end
                                if RandomPlayer.Character.Humanoid.Sit == true then
                                    gloveHits["Cloud"]:FireServer(RandomPlayer.Character.HumanoidRootPart)
                                end
                                task.wait(0.5)
                            end
                        end
                    end
                    task.wait()
                end
            elseif _G.AutoCloudMastery == true then
                Notification("You don't have Cloud equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Cloud Mastery"]:SetValue(false)
            end
        end
    })
    Badge3Group:AddDropdown("Wormhole Mastery", {
        Text = "Wormhole Mastery",
        Values = {
            "Place",
            "Teleport Time",
            "Ambush Player"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.WormholeMastery = Value
        end
    })
    Badge3Group:AddToggle("Auto Wormhole Mastery", {
        Text = "Auto Wormhole Mastery",
        Default = false,
        Callback = function(Value)
            _G.AutoWormholeMastery = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Wormhole" then
                while _G.AutoWormholeMastery do
                    if _G.WormholeMastery == "Place" then
                        game:GetService("ReplicatedStorage").WormholePlace:FireServer()
                    elseif _G.WormholeMastery == "Teleport Time" then
                        game:GetService("ReplicatedStorage").WormholeTP:FireServer(CFrame.new(- 57.48336410522461, - 4.672852516174316, 67.94768524169922, 0.5769212245941162, 0.0005397791974246502, 0.8167997002601624, 1.468715993269143e-07, 0.9999997615814209, - 0.0006609398988075554, - 0.8167998790740967, 0.00038141835830174387, 0.5769210457801819))
                    elseif _G.WormholeMastery == "Ambush Player" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            fireclickdetector(workspace.Lobby.Replica.ClickDetector)
                            wait(0.5)
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character
                            if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    task.wait()
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport2.TouchInterest.Parent, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport2.TouchInterest.Parent, 1)
                                until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                            end
                            wait(0.1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                            wait(0.8)
                            game:GetService("ReplicatedStorage").Duplicate:FireServer(true)
                            game:GetService("Players").LocalPlayer.Reset:FireServer()
                            wait(0.05)
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            fireclickdetector(workspace.Lobby.Wormhole.ClickDetector)
                            wait(0.3)
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character
                            if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    task.wait()
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                                until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                            end
                            wait(0.2)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                            wait(0.25)
                            for i, v in pairs(game.Workspace:GetChildren()) do
                                if v.Name == ("Å" .. game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
                                    repeat
                                        task.wait()
                                        if v:FindFirstChild("HumanoidRootPart") then
                                            game:GetService("ReplicatedStorage").WormholeTP:FireServer(CFrame.new(- 57.48336410522461, - 4.672852516174316, 67.94768524169922, 0.5769212245941162, 0.0005397791974246502, 0.8167997002601624, 1.468715993269143e-07, 0.9999997615814209, - 0.0006609398988075554, - 0.8167998790740967, 0.00038141835830174387, 0.5769210457801819))
                                            gloveHits["Wormhole"]:FireServer(v:FindFirstChild("HumanoidRootPart"))
                                        end
                                    until _G.WormholeMastery == false or v:FindFirstChild("HumanoidRootPart") == nil
                                end
                            end
                            task.wait(0.1)
                            game:GetService("Players").LocalPlayer.Reset:FireServer()
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if _G.WormholeMastery == true then
                                fireclickdetector(workspace.Lobby.Replica.ClickDetector)
                            else
                                fireclickdetector(workspace.Lobby.Wormhole.ClickDetector)
                            end
                        end
                    end
                    task.wait()
                end
            elseif _G.AutoWormholeMastery == true then
                Notification("You don't have Wormhole equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Wormhole Mastery"]:SetValue(false)
            end
        end
    })
    Badge3Group:AddDropdown("Run Mastery", {
        Text = "Run Mastery",
        Values = {
            "Esp Player",
            "Auto Kill Player"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.RunMastery = Value
        end
    })
    Badge3Group:AddToggle("Auto Run Mastery", {
        Text = "Auto Run Mastery",
        Default = false,
        Callback = function(Value)
            _G.AutoRunMastery = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Run" then
                if _G.AutoRunMastery == false then
                    if _G.RunMastery == "Esp Player" then
                        for i, v in ipairs(game.Players:GetChildren()) do
                            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("InLabyrinth") then
                                if v.Character.HumanoidRootPart:FindFirstChild("RunEsp") then
                                    v.Character.HumanoidRootPart.RunEsp:Destroy()
                                end
                            end
                        end
                    end
                end
                while _G.AutoRunMastery do
                    if _G.RunMastery == "Esp Player" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("InLabyrinth") then
                            for i, v in ipairs(game.Players:GetChildren()) do
                                if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("InLabyrinth") then
                                    if v.Character.HumanoidRootPart:FindFirstChild("RunEsp") == nil then
                                        RunEsp = Instance.new("BillboardGui", v.Character.HumanoidRootPart)
                                        RunEsp.Adornee = v.Character.HumanoidRootPart
                                        RunEsp.Name = "RunEsp"
                                        RunEsp.Size = UDim2.new(0, 100, 0, 150)
                                        RunEsp.AlwaysOnTop = true
                                        RunEspText = Instance.new("TextLabel", RunEsp)
                                        RunEspText.BackgroundTransparency = 1
                                        RunEspText.Font = Enum.Font.SourceSansBold
                                        RunEspText.Size = UDim2.new(0, 100, 0, 100)
                                        RunEspText.TextSize = 15
                                        RunEspText.TextStrokeTransparency = 0.5
                                        RunEspText.Text = "Target Player"
                                    end
                                elseif v.Character and v.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("InLabyrinth") == nil then
                                    if v.Character.HumanoidRootPart:FindFirstChild("RunEsp") then
                                        v.Character.HumanoidRootPart.RunEsp:Destroy()
                                    end
                                end
                            end
                        end
                    elseif _G.RunMastery == "Auto Kill Player" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("InLabyrinth") then
                            for i, v in ipairs(game.Players:GetChildren()) do
                                if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("InLabyrinth") then
                                    v.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                end
                            end
                        end
                    end
                    task.wait()
                end
            elseif _G.AutoRunMastery == true then
                Notification("You don't have Run equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Run Mastery"]:SetValue(false)
            end
        end
    })
    Badge3Group:AddDropdown("Glovel Mastery", {
        Text = "Glovel Mastery",
        Values = {
            "Dip (350 Time)",
            "Land Player"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.GlovelMastery = Value
        end
    })
    Badge3Group:AddToggle("Auto Glovel Mastery", {
        Text = "Auto Glovel Mastery",
        Default = false,
        Callback = function(Value)
            _G.AutoGlovelMastery = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Glovel" then
                while _G.AutoGlovelMastery do
                    if _G.GlovelMastery == "Dip (350 Time)" then
                        for i = 1, 50 do
                            if _G.AutoGlovelMastery == true then
                                game:GetService("ReplicatedStorage").GlovelFunc:InvokeServer()
                            end
                        end
                        wait(0.4)
                        game:GetService("ReplicatedStorage").GlovelCancel:FireServer()
                    elseif _G.GlovelMastery == "Land Player" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            fireclickdetector(workspace.Lobby.Replica.ClickDetector)
                            wait(0.5)
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character
                            if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    task.wait()
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport2.TouchInterest.Parent, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport2.TouchInterest.Parent, 1)
                                until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                            end
                            wait(0.1)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                            wait(0.8)
                            game:GetService("ReplicatedStorage").Duplicate:FireServer(true)
                            game:GetService("Players").LocalPlayer.Reset:FireServer()
                            wait(0.05)
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            fireclickdetector(workspace.Lobby.Glovel.ClickDetector)
                            wait(0.3)
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character
                            if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    task.wait()
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                                until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                            end
                            wait(0.2)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                            wait(0.25)
                            for i, v in pairs(game.Workspace:GetChildren()) do
                                if v.Name == ("Å" .. game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
                                    repeat
                                        task.wait()
                                        if v:FindFirstChild("HumanoidRootPart") then
                                            gloveHits["Glovel"]:FireServer(v:FindFirstChild("HumanoidRootPart"), true)
                                        end
                                    until _G.AutoGlovelMastery == false or v:FindFirstChild("HumanoidRootPart") == nil
                                end
                            end
                            task.wait(0.1)
                            game:GetService("Players").LocalPlayer.Reset:FireServer()
                            repeat
                                task.wait()
                            until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if _G.AutoGlovelMastery == true then
                                fireclickdetector(workspace.Lobby.Replica.ClickDetector)
                            else
                                fireclickdetector(workspace.Lobby.Glovel.ClickDetector)
                            end
                        end
                    end
                    task.wait()
                end
            elseif _G.AutoGlovelMastery == true then
                Notification("You don't have Glovel equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Glovel Mastery"]:SetValue(false)
            end
        end
    })
    Badge3Group:AddDropdown("Bomb Mastery", {
        Text = "Bomb Mastery",
        Values = {
            "Throw Bomb",
            "Snipe Bomb + Void",
            "Void Kill"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.BombMastery = Value
        end
    })
    Badge3Group:AddToggle("Auto Bomb Mastery", {
        Text = "Auto Bomb Mastery",
        Default = false,
        Callback = function(Value)
            _G.AutoBombMastery = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Bomb" then
                while _G.AutoBombMastery do
                    if _G.BombMastery == "Throw Bomb" then
                        for i = 1, 200 do
                            game:GetService("ReplicatedStorage"):WaitForChild("BombThrow"):FireServer("Ebutton")
                            game:GetService("ReplicatedStorage"):WaitForChild("BombThrow"):FireServer("Ebutton")
                        end
                    elseif _G.BombMastery == "Snipe Bomb + Void" then
                        repeat
                            task.wait()
                        until game.Players.LocalPlayer.Character
                        if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            repeat
                                task.wait()
                                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                            until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Backpack:FindFirstChild("Bomb") then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Bomb)
                        end
                        task.wait()
                        repeat
                            task.wait()
                            if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                            end
                            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, x)
                            end
                        until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "_bømb")
                        wait(0.5)
                        repeat
                            task.wait()
                            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "_bømb") then
                                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "_bømb").CFrame)
                            end
                        until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "_bømb") == nil
                        task.wait(0.75)
                        repeat
                            task.wait()
                            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game.Workspace.DEATHBARRIER.CFrame)
                        until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0
                        repeat
                            task.wait()
                        until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    elseif _G.BombMastery == "Void Kill" then
                        repeat
                            task.wait()
                        until game.Players.LocalPlayer.Character
                        if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            repeat
                                task.wait()
                                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                            until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                        end
                        repeat
                            task.wait()
                            if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                            end
                            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, x)
                            end
                        until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "_bømb")
                        task.wait(0.2)
                        game:GetService("ReplicatedStorage"):WaitForChild("BombThrow"):FireServer("Ebutton")
                        task.wait(0.75)
                        repeat
                            task.wait()
                        until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "_bømb") == nil
                        repeat
                            task.wait()
                            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game.Workspace.DEATHBARRIER.CFrame)
                        until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0
                        repeat
                            task.wait()
                        until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    end
                    task.wait()
                end
            elseif _G.AutoBombMastery == true then
                Notification("You don't have Bomb equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Bomb Mastery"]:SetValue(false)
            end
        end
    })
    Badge3Group:AddToggle("Auto Booster Mastery", {
        Text = "Auto Booster Mastery",
        Default = false,
        Callback = function(Value)
            _G.AutoBoosterMastery = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Booster" then
                while _G.AutoBoosterMastery do
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        fireclickdetector(workspace.Lobby.Replica.ClickDetector)
                        wait(0.5)
                        repeat
                            task.wait()
                        until game.Players.LocalPlayer.Character
                        if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            repeat
                                task.wait()
                                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport2.TouchInterest.Parent, 0)
                                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport2.TouchInterest.Parent, 1)
                            until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                        end
                        wait(0.1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                        wait(0.8)
                        game:GetService("ReplicatedStorage").Duplicate:FireServer(true)
                        game:GetService("Players").LocalPlayer.Reset:FireServer()
                        wait(0.05)
                        repeat
                            task.wait()
                        until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        fireclickdetector(workspace.Lobby.Booster.ClickDetector)
                        wait(0.3)
                        repeat
                            task.wait()
                        until game.Players.LocalPlayer.Character
                        if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            repeat
                                task.wait()
                                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                            until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                        end
                        wait(0.2)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                        wait(0.25)
                        game:GetService("Players").LocalPlayer.Reset:FireServer()
                        spawn(function()
                            for i, v in pairs(game.Workspace:GetChildren()) do
                                if v.Name == ("Å" .. game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
                                    for o = 1, 35 do
                                        if v:FindFirstChild("HumanoidRootPart") then
                                            game.ReplicatedStorage.GeneralHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
                                        end
                                        task.wait()
                                    end
                                end
                            end
                        end)
                        repeat
                            task.wait()
                        until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if _G.AutoFlashMastery == true then
                            fireclickdetector(workspace.Lobby.Replica.ClickDetector)
                        else
                            fireclickdetector(workspace.Lobby.Booster.ClickDetector)
                        end
                    end
                    task.wait()
                end
            elseif _G.AutoBoosterMastery == true then
                Notification("You don't have Booster equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Booster Mastery"]:SetValue(false)
            end
        end
    })
    Badge3Group:AddToggle("Auto Killstreak Mastery", {
        Text = "Auto Killstreak Mastery",
        Default = false,
        Callback = function(Value)
            _G.AutoKillstreakMastery = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Killstreak" then
                while _G.AutoKillstreakMastery do
                    local players = game.Players:GetChildren()
                    local RandomPlayer = players[math.random(1, # players)]
                    if RandomPlayer ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and RandomPlayer.Character then
                        if RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("HumanoidRootPart") and RandomPlayer.Character:FindFirstChild("Humanoid") and RandomPlayer.Character:FindFirstChild("stevebody") == nil and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character.Humanoid.Sit == false and RandomPlayer.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and RandomPlayer.Character:FindFirstChild("Mirage") == nil and RandomPlayer.Character.Humanoid.Health ~= 0 then
                            repeat
                                task.wait()
                                if _G.AutoKillstreakMastery == false then
                                    break
                                end
                                if RandomPlayer.Character.Ragdolled.Value == false then
                                    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(RandomPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, - 10, 0))
                                    task.wait(0.25)
                                    game.ReplicatedStorage.KSHit:FireServer(RandomPlayer.Character:FindFirstChild("HumanoidRootPart"))
                                    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0))
                                    task.wait(0.85)
                                end
                            until RandomPlayer.Character:FindFirstChild("HumanoidRootPart") and RandomPlayer.Character.HumanoidRootPart.Position.Y < - 10 or RandomPlayer.Character:FindFirstChild("Humanoid") and RandomPlayer.Character.Humanoid.Health <= 0
                        end
                    end
                    task.wait()
                end
            elseif _G.AutoKillstreakMastery == true then
                Notification("You don't have Killstreak equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Killstreak Mastery"]:SetValue(false)
            end
        end
    })
    Badge3Group:AddToggle("Auto Spin Mastery", {
        Text = "Auto Spin Mastery",
        Default = false,
        Callback = function(Value)
            _G.AutoSpinMastery = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "spin" then
                while _G.AutoSpinMastery do
                    if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        repeat
                            task.wait()
                            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 0)
                                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 1)
                            end
                        until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                        repeat
                            task.wait()
                            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 0)
                                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 1)
                            end
                            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0))
                        until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0
                    end
                    task.wait()
                end
            elseif _G.AutoSpinMastery == true then
                Notification("You don't have Spin equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Spin Mastery"]:SetValue(false)
            end
        end
    })
    Badge3Group:AddToggle("Auto Brick Mastery", {
        Text = "Auto Big Brick",
        Default = false,
        Callback = function(Value)
            _G.AutoBrickMastery = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Brick" then
                while _G.AutoBrickMastery do
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "Union" then
                            v.Size = Vector3.new(20, 1, 20)
                        end
                    end
                    task.wait()
                end
            elseif _G.AutoBrickMastery == true then
                Notification("You don't have Brick equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Brick Mastery"]:SetValue(false)
            end
        end
    })
    local Local1Group = Tabs.Tab4:AddLeftGroupbox("Speed")
    Local1Group:AddSlider("WalkSpeed", {
        Text = "Speed",
        Default = 20,
        Min = 20,
        Max = 1000,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
            Walkspeed = Value
        end
    })
    Local1Group:AddInput("WalkSpeed1", {
        Default = "20",
        Numeric = false,
        Text = "Speed",
        Placeholder = "UserSpeed",
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
            Walkspeed = Value
        end
    })
    Local1Group:AddToggle("SetSpeed", {
        Text = "Auto Set Speed",
        Default = false,
        Callback = function(Value)
            KeepWalkspeed = Value
            while KeepWalkspeed do
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed ~= Walkspeed then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Walkspeed
                end
                task.wait()
            end
        end
    })
    local Local2Group = Tabs.Tab4:AddRightGroupbox("Jump")
    Local2Group:AddSlider("JumpPower", {
        Text = "Jump",
        Default = 50,
        Min = 50,
        Max = 1000,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
            Jumppower = Value
        end
    })
    Local2Group:AddInput("JumpPower1", {
        Default = "50",
        Numeric = true,
        Text = "Jump",
        Placeholder = "UserJump",
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
            Jumppower = Value
        end
    })
    Local2Group:AddToggle("SetJump", {
        Text = "Auto Set Jump",
        Default = false,
        Callback = function(Value)
            KeepJumppower = Value
            while KeepJumppower do
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.JumpPower ~= Jumppower then
                    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jumppower
                end
                task.wait()
            end
        end
    })
    local Local3Group = Tabs.Tab4:AddLeftGroupbox("Remaining")
    Local3Group:AddSlider("HipHeight", {
        Text = "Hip Height",
        Default = 0,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.HipHeight = Value
            HipHeight = Value
        end
    })
    Local3Group:AddToggle("SetHipHeight", {
        Text = "Auto Set Hip Height",
        Default = false,
        Callback = function(Value)
            KeepHipHeight = Value
            while KeepHipHeight do
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.HipHeight ~= HipHeight then
                    game.Players.LocalPlayer.Character.Humanoid.HipHeight = HipHeight
                end
                task.wait()
            end
        end
    })
    Local3Group:AddSlider("Gravity", {
        Text = "Gravity",
        Default = 0,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            game.Workspace.Gravity = Value
        end
    })
    local Misc2Group = Tabs.Tab5:AddRightGroupbox("Misc Default")
    Misc2Group:AddDropdown("GodMobe", {
        Text = "Godmobe",
        Values = {
            "Godmode",
            "Godmode + Invisibility"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            if Value == "Godmode" then
                if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 1)
                end
                repeat
                    task.wait()
                until game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") or game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool")
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    v.Parent = game.LogService
                end
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    v.Parent = game.LogService
                end
                game:GetService("Players").LocalPlayer.Reset:FireServer()
                wait(3.82)
                for i, v in pairs(game.LogService:GetChildren()) do
                    v.Parent = game.Players.LocalPlayer.Backpack
                end
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0, - 5, 0)
            elseif Value == "Godmode + Invisibility" then
                if game.Players.LocalPlayer.leaderstats.Slaps.Value >= 666 then
                    if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 1)
                    end
                    repeat
                        task.wait()
                    until game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") or game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool")
                    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        v.Parent = game.LogService
                    end
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        v.Parent = game.LogService
                    end
                    game:GetService("Players").LocalPlayer.Reset:FireServer()
                    wait(3.82)
                    OGlove = game.Players.LocalPlayer.leaderstats.Glove.Value
                    fireclickdetector(workspace.Lobby.Ghost.ClickDetector)
                    game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
                    fireclickdetector(workspace.Lobby[OGlove].ClickDetector)
                    for i, v in pairs(game.LogService:GetChildren()) do
                        v.Parent = game.Players.LocalPlayer.Backpack
                    end
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0, - 5, 0)
                    wait(0.5)
                    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v.Name ~= "Humanoid" then
                            v.Transparency = 0
                        end
                    end
                else
                    Notification("You need 666+ slaps", _G.TimeNotify)
                end
            end
        end
    })
    Misc2Group:AddDropdown("Teleport Place", {
        Text = "Teleport",
        Values = {
            "Arena",
            "Lobby",
            "Hunter Room",
            "Tournament",
            "Brazil",
            "Island Slapple",
            "Plate",
            "Cannon Island",
            "Keypad",
            "Cube Of Death",
            "Moai Island",
            "Default Arena",
            "Island 1",
            "Island 2",
            "Island 3"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            if Value == "Arena" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0, - 5, 0)
            elseif Value == "Lobby" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 800, 328, - 2.5)
            elseif Value == "Hunter Room" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.BountyHunterRoom.Union.CFrame * CFrame.new(0, 5, 0)
            elseif Value == "Brazil" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Lobby.brazil.portal.CFrame
            elseif Value == "Island Slapple" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Arena.island5.Union.CFrame * CFrame.new(0, 3.25, 0)
            elseif Value == "Plate" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Arena.Plate.CFrame
            elseif Value == "Tournament" then
                if workspace:FindFirstChild("TournamentIsland") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.TournamentIsland.Spawns.Part.CFrame * CFrame.new(0, 2, 0)
                else
                    Notification("Tournament Island don't not spawn.", _G.TimeNotify)
                end
            elseif Value == "Cannon Island" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.CannonIsland.Cannon.Base.CFrame * CFrame.new(0, 0, 35)
            elseif Value == "Keypad" then
                if not workspace:FindFirstChild("Keypad") then
                    Notification("Server in don't have keypad.", _G.TimeNotify)
                else
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Keypad.Buttons.Enter.CFrame
                end
            elseif Value == "Cube Of Death" then
                if game.Workspace:FindFirstChild("the cube of death(i heard it kills)", 1) then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].Part.CFrame * CFrame.new(0, 5, 0)
                end
            elseif Value == "Moai Island" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(215, - 15.5, 0.5)
            elseif Value == "Default Arena" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120, 360, - 3)
            elseif Value == "Island 1" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 211.210846, - 5.27827597, 4.13719559, - 0.0225322824, 1.83683113e-08, - 0.999746144, - 1.83560154e-08, 1, 1.87866842e-08, 0.999746144, 1.87746618e-08, - 0.0225322824)
            elseif Value == "Island 2" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 8.17191315, - 5.14452887, - 205.249741, - 0.98216176, - 3.48867246e-09, - 0.188037917, - 4.19987778e-09, 1, 3.38382322e-09, 0.188037917, 4.11319823e-09, - 0.98216176)
            elseif Value == "Island 3" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 6.66747713, - 5.06731462, 213.575378, 0.945777893, 2.52095178e-10, 0.324814111, - 3.7823856e-08, 1, 1.09357536e-07, - 0.324814111, - 1.15713661e-07, 0.945777893)
            end
        end
    })
    Misc2Group:AddInput("Players", {
        Default = "",
        Numeric = false,
        Text = "",
        Finished = true,
        Placeholder = "Username",
        Callback = function(Value)
            _G.PlayerTarget = Value
            for _, v in pairs(game.Players:GetPlayers()) do
                if string.sub(v.Name, 1, # _G.PlayerTarget):lower() == _G.PlayerTarget:lower() then
                    PlayerTa = v
                end
            end
            if PlayerTa then
                _G.PlayerPut = PlayerTa.Name
                Notification("Found Player [ " .. PlayerTa.Name .. " ]", _G.TimeNotify)
            else
                Notification("Can't find player", _G.TimeNotify)
            end
        end
    })
    Misc2Group:AddButton("Teleport Player", function()
        if game.Players[_G.PlayerPut].Character and game.Players[_G.PlayerPut].Character:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerPut].Character.HumanoidRootPart.CFrame
        end
    end)
    Misc2Group:AddToggle("Auto Teleport Player", {
        Text = "Auto Teleport Player",
        Default = false,
        Callback = function(Value)
            _G.PlayerTele = Value
            while _G.PlayerTele do
                if game.Players[_G.PlayerPut].Character and game.Players[_G.PlayerPut].Character:FindFirstChild("HumanoidRootPart") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerPut].Character.HumanoidRootPart.CFrame
                end
                task.wait()
            end
        end
    })
    Misc2Group:AddToggle("Auto View Player", {
        Text = "Auto View Player",
        Default = false,
        Callback = function(Value)
            _G.PlayerView = Value
            if _G.PlayerView == false then
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                end
            end
            while _G.PlayerView do
                if game.Players[_G.PlayerPut].Character:FindFirstChild("Humanoid") then
                    game.Workspace.CurrentCamera.CameraSubject = game.Players[_G.PlayerPut].Character:FindFirstChild("Humanoid")
                end
                task.wait()
            end
        end
    })
    Misc2Group:AddInput("FlySpeed", {
        Default = "50",
        Numeric = true,
        Text = "Fly Speed",
        Placeholder = "UserFlySpeed",
        Callback = function(Value)
            _G.SetSpeedFly = Value
        end
    })
    _G.SetSpeedFly = 100
    Misc2Group:AddToggle("Start Fly", {
        Text = "Start Fly",
        Default = false,
        Callback = function(Value)
            _G.StartFly = Value
            if _G.StartFly == false then
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler:Destroy()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler:Destroy()
                    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                end
            end
            while _G.StartFly do
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
                    game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler.CFrame = Workspace.CurrentCamera.CoordinateFrame
                    game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = Vector3.new()
                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X > 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity + game.Workspace.CurrentCamera.CFrame.RightVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X * _G.SetSpeedFly)
                    end
                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X < 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity + game.Workspace.CurrentCamera.CFrame.RightVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X * _G.SetSpeedFly)
                    end
                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z > 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity - game.Workspace.CurrentCamera.CFrame.LookVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z * _G.SetSpeedFly)
                    end
                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z < 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity - game.Workspace.CurrentCamera.CFrame.LookVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z * _G.SetSpeedFly)
                    end
                elseif game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") == nil and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") == nil then
                    local bv = Instance.new("BodyVelocity")
                    local bg = Instance.new("BodyGyro")
                    bv.Name = "VelocityHandler"
                    bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    bv.MaxForce = Vector3.new(0, 0, 0)
                    bv.Velocity = Vector3.new(0, 0, 0)
                    bg.Name = "GyroHandler"
                    bg.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    bg.MaxTorque = Vector3.new(0, 0, 0)
                    bg.P = 1000
                    bg.D = 50
                end
                task.wait()
            end
        end
    }):AddKeyPicker("Fly", {
        Default = "R",
        Text = "Fly",
        Mode = "Toggle",
        SyncToggleState = true
    })
    TabBoxMisc1 = Tabs.Tab5:AddLeftTabbox()
    local Misc1Basic = TabBoxMisc1:AddTab("Misc")
    Misc1Basic:AddToggle("Autofarm Slapples", {
        Text = "Autofarm Slapples",
        Default = false,
        Callback = function(Value)
            _G.SlappleFarm = Value
            while _G.SlappleFarm do
                if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                    for i, v in pairs(workspace.Arena.island5.Slapples:GetChildren()) do
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and v.Name == "Slapple" or v.Name == "GoldenSlapple" and v:FindFirstChild("Glove") and v.Glove:FindFirstChildWhichIsA("TouchTransmitter") then
                            v.Glove.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("AutofarmSlapples", {
        Default = "M",
        Text = "Autofarm Slapples",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Misc1Basic:AddToggle("Autofarm Candy", {
        Text = "Autofarm Candy",
        Default = false,
        Callback = function(Value)
            _G.CandyCornsFarm = Value
            while _G.CandyCornsFarm do
                for i, v in pairs(game.Workspace.CandyCorns:GetChildren()) do
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("AutofarmCandy", {
        Default = "C",
        Text = "Toggle Anti",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Misc1Basic:AddButton({
        Text = "Auto Keypad",
        DoubleClick = true,
        Func = function()
            if not workspace:FindFirstChild("Keypad") then
                Notification("Server in don't have keypad, can have started serverhop", _G.TimeNotify)
                task.wait(1.5)
                for _, v in ipairs(game.HttpService:JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
                    if v.playing < v.maxPlayers and v.JobId ~= game.JobId then
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
                    end
                end
            else
                game.Workspace.CurrentCamera.CameraSubject = workspace.Keypad.Buttons.Enter
                fireclickdetector(workspace:WaitForChild("Keypad").Buttons:FindFirstChild("Reset").ClickDetector)
                local digits = tostring((# game.Players:GetPlayers()) * 25 + 1100 - 7)
                for i = 1, # digits do
                    wait(.5)
                    local digit = digits:sub(i, i)
                    fireclickdetector(workspace:WaitForChild("Keypad").Buttons:FindFirstChild(digit).ClickDetector)
                end
                wait(1)
                fireclickdetector(workspace:WaitForChild("Keypad").Buttons:FindFirstChild("Enter").ClickDetector)
            end
        end
    })
    Misc1Basic:AddToggle("Auto Code Pocket Keypad", {
        Text = "Auto Code Pocket Keypad",
        Default = false,
        Callback = function(Value)
            _G.WriteCodeKeypad = Value
            while _G.WriteCodeKeypad do
                if game.Workspace:FindFirstChild("RoomsFolder") then
                    for i, v in pairs(game.Workspace.RoomsFolder:GetChildren()) do
                        if string.find(v.Name, "'s Room") and v:FindFirstChild("PocketKeypad") then
                            fireclickdetector(v.PocketKeypad.Buttons:FindFirstChild("Reset").ClickDetector)
                            local digits = "4553293"
                            for i = 1, # digits do
                                wait(0.26)
                                _G.CodeOPad = digits:sub(i, i)
                                fireclickdetector(v.PocketKeypad.Buttons:FindFirstChild(_G.CodeOPad).ClickDetector)
                            end
                            task.wait(0.15)
                            fireclickdetector(v.PocketKeypad.Buttons:FindFirstChild("Enter").ClickDetector)
                        end
                    end
                end
                task.wait(3.23)
            end
        end
    })
    Misc1Basic:AddInput("Write Code Keypad", {
        Default = "",
        Numeric = true,
        Text = "Write Code Keypad",
        Placeholder = "UserCode",
        Callback = function(Value)
            _G.writeCode = Value
        end
    })
    Misc1Basic:AddDropdown("Enter Keypad", {
        Text = "Enter Keypad",
        Values = {
            "Not Enter",
            "Enter"
        },
        Default = "Enter",
        Multi = false,
        Callback = function(Value)
            _G.EnterKeypad = Value
        end
    })
    Misc1Basic:AddButton("Write Keypad", function()
        if not workspace:FindFirstChild("Keypad") then
            Notification("Server in don't have keypad.", _G.TimeNotify)
        else
            game.Workspace.CurrentCamera.CameraSubject = workspace.Keypad.Buttons.Enter
            fireclickdetector(workspace:WaitForChild("Keypad").Buttons:FindFirstChild("Reset").ClickDetector)
            for i = 1, # _G.writeCode do
                wait(.35)
                local digit = _G.writeCode:sub(i, i)
                fireclickdetector(workspace:WaitForChild("Keypad").Buttons:FindFirstChild(digit).ClickDetector)
            end
            if _G.EnterKeypad == "Enter" then
                fireclickdetector(workspace:WaitForChild("Keypad").Buttons:FindFirstChild("Enter").ClickDetector)
            end
        end
    end)
    Misc1Basic:AddDropdown("Easter Egg Code", {
        Text = "Easter Egg Code",
        Values = {
            "911",
            "8008",
            "666",
            "6969",
            "1987"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.EggCodes = Value
        end
    })
    Misc1Basic:AddButton("Easter Egg Keypad", function()
        if not workspace:FindFirstChild("Keypad") then
            Notification("Server in don't have keypad.", _G.TimeNotify)
        else
            game.Workspace.CurrentCamera.CameraSubject = workspace.Keypad.Buttons.Enter
            fireclickdetector(workspace:WaitForChild("Keypad").Buttons:FindFirstChild("Reset").ClickDetector)
            for i = 1, # _G.EggCodes do
                wait(.35)
                local digit = _G.EggCodes:sub(i, i)
                fireclickdetector(workspace:WaitForChild("Keypad").Buttons:FindFirstChild(digit).ClickDetector)
            end
            wait(1)
            fireclickdetector(workspace:WaitForChild("Keypad").Buttons:FindFirstChild("Enter").ClickDetector)
        end
    end)
    Misc1Basic:AddDropdown("FarmSlap", {
        Text = "AutoFarm Slap",
        Values = {
            "Aimbot",
            "Teleport",
            "Tween"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.AutoFarmSlapBattles = Value
        end
    })
    Misc1Basic:AddToggle("Auto Farm Slap", {
        Text = "Auto Farm Slap",
        Default = false,
        Callback = function(Value)
            _G.AutoFarmSlap = Value
            while _G.AutoFarmSlap do
                if _G.AutoFarmSlapBattles == "Aimbot" then
                    if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
                        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                            game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Workspace:FindFirstChild("Lobby"):FindFirstChild("Teleport1").Position)
                        end
                    end
                end
                local DstanceHuge, Target = math.huge, nil
                for i, v in pairs(game.Players:GetChildren()) do
                    if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character and game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                        if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character.Ragdolled.Value == false and v.Character:FindFirstChild("Mirage") == nil then
                            if v.Character.Head:FindFirstChild("UnoReverseCard") == nil then
                                if _G.AutoFarmSlap == true then
                                    if _G.AutoFarmSlapBattles == "Teleport" then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 5, 0)
                                        task.wait(0.5)
                                        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Mace" then
                                            gloveHits["Mace"]:FireServer(v.Character.HumanoidRootPart, 100)
                                        elseif gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value] ~= nil then
                                            gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Character.HumanoidRootPart)
                                        else
                                            game:GetService("ReplicatedStorage").GeneralHit:FireServer(v.Character.HumanoidRootPart)
                                        end
                                    elseif _G.AutoFarmSlapBattles == "Tween" then
                                        TweenTp(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0), true, 1)
                                        wait(0.35)
                                        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Mace" then
                                            gloveHits["Mace"]:FireServer(v.Character.HumanoidRootPart, 100)
                                        elseif gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value] ~= nil then
                                            gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Character.HumanoidRootPart)
                                        else
                                            game:GetService("ReplicatedStorage").GeneralHit:FireServer(v.Character.HumanoidRootPart)
                                        end
                                    elseif _G.AutoFarmSlapBattles == "Aimbot" then
                                        local DstancePlayer = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                                        if DstancePlayer < DstanceHuge then
                                            DstanceHuge, Target = DstancePlayer, v.Character
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if Target and _G.AutoFarmSlapBattles == "Aimbot" then
                    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled").Value == false then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, Vector3.new(Target.HumanoidRootPart.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, Target.HumanoidRootPart.Position.Z))
                        end
                        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if v:IsA("Tool") and v:FindFirstChild("Glove") then
                                if (v:FindFirstChild("Glove").Position - Target.HumanoidRootPart.Position).Magnitude <= 5 then
                                    game:GetService("VirtualUser"):ClickButton1(Vector2.new(200, 200))
                                else
                                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(Target.HumanoidRootPart.Position)
                                end
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    })
    Misc1Basic:AddToggle("Auto Spam Ability", {
        Text = "Auto Spam Ability",
        Default = false,
        Callback = function(Value)
            _G.OnAbility = Value
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Fort" do
                game:GetService("ReplicatedStorage").Fortlol:FireServer()
                wait(3.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Home Run" do
                game:GetService("ReplicatedStorage").HomeRun:FireServer({
                    ["start"] = true
                })
                game:GetService("ReplicatedStorage").HomeRun:FireServer({
                    ["finished"] = true
                })
                task.wait(4.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "🗿" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer(game.Players.LocalPlayer.Character.Head.CFrame * CFrame.new(0, - 2, - 10))
                wait(3.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Shukuchi" do
                local players = game.Players:GetChildren()
                local RandomPlayer = players[math.random(1, # players)]
                repeat
                    RandomPlayer = players[math.random(1, # players)]
                until RandomPlayer ~= game.Players.LocalPlayer and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoReverseCard") == nil
                Target = RandomPlayer
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.Head:FindFirstChild("RedEye") == nil then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
                end
                wait(0.09)
                game:GetService("ReplicatedStorage").SM:FireServer(Target)
                wait(0.8)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Slicer" do
                game:GetService("ReplicatedStorage").Slicer:FireServer("sword")
                game:GetService("ReplicatedStorage").Slicer:FireServer("slash", game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame, Vector3.new())
                wait(5.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Reverse" do
                game:GetService("ReplicatedStorage"):WaitForChild("ReverseAbility"):FireServer()
                task.wait(5.7)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "rob" do
                game:GetService("ReplicatedStorage").rob:FireServer()
                wait(3)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "bob" do
                game:GetService("ReplicatedStorage").bob:FireServer()
                wait(9)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Kraken" do
                game:GetService("ReplicatedStorage").KrakenArm:FireServer()
                wait(5)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Sbeve" do
                game:GetService("ReplicatedStorage").KrakenArm:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Psycho" do
                game:GetService("ReplicatedStorage").Psychokinesis:InvokeServer({
                    ["grabEnabled"] = true
                })
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Killstreak" do
                game:GetService("ReplicatedStorage").KSABILI:FireServer()
                wait(6.9)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "bus" do
                game:GetService("ReplicatedStorage").busmoment:FireServer()
                wait(5.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Mitten" do
                game:GetService("ReplicatedStorage").MittenA:FireServer()
                wait(5.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Defense" do
                game:GetService("ReplicatedStorage").Barrier:FireServer()
                wait(0.25)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Bomb" do
                game:GetService("ReplicatedStorage").BombThrow:FireServer()
                wait(2.5)
                game:GetService("ReplicatedStorage").BombThrow:FireServer()
                wait(4.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Replica" do
                game:GetService("ReplicatedStorage").Duplicate:FireServer(true)
                wait(6)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Pusher" do
                game:GetService("ReplicatedStorage").PusherWall:FireServer()
                wait(5.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Jet" do
                local players = game.Players:GetChildren()
                local RandomPlayer = players[math.random(1, # players)]
                repeat
                    RandomPlayer = players[math.random(1, # players)]
                until RandomPlayer ~= game.Players.LocalPlayer and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("rock") == nil
                Target = RandomPlayer
                game:GetService("ReplicatedStorage").AirStrike:FireServer(Target.Character)
                wait(5.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Tableflip" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                wait(3.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Shield" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                wait(3.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Rocky" do
                game:GetService("ReplicatedStorage").RockyShoot:FireServer()
                task.wait(7.5)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "God's Hand" do
                game:GetService("ReplicatedStorage").TimestopJump:FireServer()
                game:GetService("ReplicatedStorage").Timestopchoir:FireServer()
                game:GetService("ReplicatedStorage").Timestop:FireServer()
                wait(50.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Za Hando" do
                game:GetService("ReplicatedStorage").Erase:FireServer()
                wait(5.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Baller" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                wait(4.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Glitch" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                wait(5.34)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Stun" do
                game:GetService("ReplicatedStorage").StunR:FireServer(game:GetService("Players").LocalPlayer.Character.Stun)
                wait(10.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "STOP" do
                game:GetService("ReplicatedStorage").STOP:FireServer(true)
                wait(4.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Quake" do
                game:GetService("ReplicatedStorage"):WaitForChild("QuakeQuake"):FireServer({
                    ["start"] = true
                })
                game:GetService("ReplicatedStorage"):WaitForChild("QuakeQuake"):FireServer({
                    ["finished"] = true
                })
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Track" do
                local players = game.Players:GetChildren()
                local RandomPlayer = players[math.random(1, # players)]
                repeat
                    RandomPlayer = players[math.random(1, # players)]
                until RandomPlayer ~= game.Players.LocalPlayer and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("rock") == nil
                Target = RandomPlayer
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer(Target.Character)
                wait(10.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Mail" do
                game:GetService("ReplicatedStorage").MailSend:FireServer()
                wait(3.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Shard" do
                game:GetService("ReplicatedStorage").Shards:FireServer()
                wait(4.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "fish" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                wait(3.05)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Null" do
                game:GetService("ReplicatedStorage").NullAbility:FireServer()
                wait(0.01)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Counter" do
                game:GetService("ReplicatedStorage").Counter:FireServer()
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
                task.wait(6.2)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Voodoo" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait(6.27)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Swapper" do
                game:GetService("ReplicatedStorage").SLOC:FireServer()
                wait(5.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Gravity" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Bubble" do
                game:GetService("ReplicatedStorage").BubbleThrow:FireServer()
                wait(3.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Slapple" do
                game:GetService("ReplicatedStorage").funnyTree:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                wait(3.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Detonator" do
                game:GetService("ReplicatedStorage").Fart:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Berserk" do
                game:GetService("ReplicatedStorage").BerserkCharge:FireServer(game:GetService("Players").LocalPlayer.Character.Berserk)
                wait(2.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Rojo" do
                game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                })
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Kinetic" do
                OGL = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                for i = 1, 100 do
                    game.ReplicatedStorage.SelfKnockback:FireServer({
                        ["Force"] = 0,
                        ["Direction"] = Vector3.new(0, 0.01, 0)
                    })
                    task.wait(0.05)
                end
                wait(2)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OGL
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Kinetic") then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Kinetic)
                end
                game:GetService("ReplicatedStorage").KineticExpl:FireServer(game.Players.LocalPlayer.Character.Kinetic, game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                wait(2.2)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Dominance" do
                game:GetService("ReplicatedStorage").DominanceAc:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                wait(3.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "[REDACTED]" do
                game:GetService("ReplicatedStorage").Well:FireServer()
                wait(5.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Duelist" do
                game:GetService("ReplicatedStorage").DuelistAbility:FireServer()
                wait(5.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Engineer" do
                game:GetService("ReplicatedStorage").Sentry:FireServer()
                wait(5.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Brick" do
                game:GetService("ReplicatedStorage").lbrick:FireServer()
                game:GetService("Players").LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text = game:GetService("Players").LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text + 1
                wait(1.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Trap" do
                game:GetService("ReplicatedStorage").funnyhilariousbeartrap:FireServer()
                wait(3.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "woah" do
                game:GetService("ReplicatedStorage").VineThud:FireServer()
                wait(5.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Ping Pong" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Recall" do
                game:GetService("ReplicatedStorage").Recall:InvokeServer(game:GetService("Players").LocalPlayer.Character.Recall)
                wait(3.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "ZZZZZZZ" do
                game:GetService("ReplicatedStorage").ZZZZZZZSleep:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Adios" do
                game:GetService("ReplicatedStorage").AdiosActivated:FireServer()
                wait(8.3)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Boogie" do
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Boogie") then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Boogie)
                elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Boogie") == nil then
                    game:GetService("ReplicatedStorage").BoogieBall:FireServer(game.Players.LocalPlayer.Character.Boogie, game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                end
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Balloony" do
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Balloony") then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Balloony)
                elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Balloony") == nil then
                    game:GetService("ReplicatedStorage").GeneralAbility:FireServer(game:GetService("Players").LocalPlayer.Character.Balloony)
                end
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Phase" do
                game:GetService("ReplicatedStorage").PhaseA:FireServer()
                wait(5.475)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Hallow Jack" do
                game:GetService("ReplicatedStorage"):WaitForChild("Hallow"):FireServer()
                wait(3.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Phantom" do
                game:GetService("ReplicatedStorage").PhantomDash:InvokeServer(workspace[game.Players.LocalPlayer.Name].Phantom)
                wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Sparky" do
                game:GetService("ReplicatedStorage").Sparky:FireServer(game:GetService("Players").LocalPlayer.Character.Sparky)
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Charge" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer(game:GetService("Players").LocalPlayer.Character.Charge)
                wait(3.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Coil" do
                game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(game:GetService("Players").LocalPlayer.Character.Coil)
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Walkspeed
                wait(3.1)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Diamond" do
                game:GetService("ReplicatedStorage"):WaitForChild("Rockmode"):FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "MEGAROCK" do
                game:GetService("ReplicatedStorage"):WaitForChild("Rockmode"):FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Excavator" do
                game:GetService("ReplicatedStorage"):WaitForChild("Excavator"):InvokeServer()
                game:GetService("ReplicatedStorage"):WaitForChild("ExcavatorCancel"):FireServer()
                wait(7.3)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Thor" do
                game:GetService("ReplicatedStorage").ThorAbility:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Meteor" do
                game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Sun" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer("Cast")
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Whirlwind" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Guardian Angel" do
                game.ReplicatedStorage.GeneralAbility:FireServer(game.Players.LocalPlayer)
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Parry" do
                game.ReplicatedStorage.GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "MR" do
                game:GetService("ReplicatedStorage").Spherify:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Druid" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait(3.21)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Oven" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Jester" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer("Ability1")
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Ferryman" do
                local players = game.Players:GetChildren()
                local randomPlayer = players[math.random(1, # players)]
                repeat
                    randomPlayer = players[math.random(1, # players)]
                until randomPlayer ~= game.Players.LocalPlayer and randomPlayer.Character:FindFirstChild("entered") and randomPlayer.Character:FindFirstChild("ded") == nil and randomPlayer.Character:FindFirstChild("InLabyrinth") == nil and randomPlayer.Character:FindFirstChild("rock") == nil
                Target = randomPlayer
                game.Players.LocalPlayer.Character.FerrymanStaff.StaffConfig.AbilityEvent:FireServer("Leap")
                wait(1.85)
                game.Players.LocalPlayer.Character.FerrymanStaff.StaffConfig.AbilityEvent:FireServer("FinishLeap", Target.Character.HumanoidRootPart.Position)
                task.wait(5)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Scythe" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Blackhole" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Jebaited" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Blink" do
                game:GetService("ReplicatedStorage").Blink:FireServer("OutOfBody", {
                    ["dir"] = Vector3.new(0, 0, 0),
                    ["ismoving"] = false,
                    ["mousebehavior"] = Enum.MouseBehavior.Default
                })
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Joust" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer("Start")
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 40
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Slapstick" do
                game:GetService("ReplicatedStorage").slapstick:FireServer("charge")
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Firework" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Chicken" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Lamp" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "BONK" do
                game:GetService("ReplicatedStorage").BONK:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Frostbite" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer(2)
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Golem" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer("recall")
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Grab" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Spoonful" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer({
                    ["state"] = "vfx",
                    ["origin"] = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(- 3.141592502593994, 1.0475832223892212, 3.141592502593994),
                    ["vfx"] = "jumptween",
                    ["sendplr"] = game:GetService("Players").LocalPlayer
                })
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer({
                    ["state"] = "vfx",
                    ["cf"] = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(- 2.1319260597229004, 0.651054859161377, 2.3744168281555176),
                    ["vfx"] = "crash"
                })
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "el gato" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "UFO" do
                if game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "'s UFO VFX") == nil and game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "'s UFO") == nil then
                    game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                end
                task.wait(0.3)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Hive" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Siphon" do
                game:GetService("ReplicatedStorage").Events.Siphon:FireServer({
                    ["cf"] = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                })
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Demolition" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer("c4")
                game:GetService("ReplicatedStorage").Events.c4:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Shotgun" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer("buckshot")
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Beachball" do
                if workspace.Balls:FindFirstChild(game.Players.LocalPlayer.Name .. "'s Ball") == nil then
                    game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                end
                wait(0.2)
                if workspace.Balls:FindFirstChild(game.Players.LocalPlayer.Name .. "'s Ball") then
                    game:GetService("ReplicatedStorage").Events.BeachBall:FireServer(workspace.Balls:FindFirstChild(game.Players.LocalPlayer.Name .. "'s Ball"), Vector3.new(game:GetService("Workspace").CurrentCamera.CFrame.LookVector.X, 0, game:GetService("Workspace").CurrentCamera.CFrame.LookVector.Z).Unit * 0.2)
                end
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Water" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer("default")
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "64" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer(game.Players.LocalPlayer.Character.Head.CFrame * CFrame.new(0, - 2, 0) * CFrame.Angles(3.1415927410125732, - 1.2705316543579102, 3.1415927410125732))
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Fan" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Shackle" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Bind" do
                local players = game.Players:GetChildren()
                local randomPlayer = players[math.random(1, # players)]
                repeat
                    randomPlayer = players[math.random(1, # players)]
                until randomPlayer ~= game.Players.LocalPlayer and randomPlayer.Character:FindFirstChild("entered") and randomPlayer.Character:FindFirstChild("ded") == nil and randomPlayer.Character:FindFirstChild("InLabyrinth") == nil and randomPlayer.Character:FindFirstChild("rock") == nil
                Target = randomPlayer
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer("default", {
                    ["goal"] = Target.Character.HumanoidRootPart.CFrame,
                    ["origin"] = Target.Character.Head.CFrame
                })
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Poltergeist" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer("ability2")
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Lawnmower" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer("lawnmower")
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Untitled Tag Glove" do
                game:GetService("ReplicatedStorage").UTGGeneric:FireServer("enableRunMode")
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Virus" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Baby" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait(8)
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Angler" do
                if game.Players.LocalPlayer.Character:FindFirstChild("fishing_rod") then
                    game:GetService("ReplicatedStorage").Events.Fisherman:FireServer("cast")
                end
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Jerry" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(- 3, 0, - 3))
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Snowroller" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                wait(0.3)
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer("release")
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Cherry" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Draw4" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Agger" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Medusa" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer(true)
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Swordfighter" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Hexa" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer(true)
                task.wait()
            end
            while _G.OnAbility and game.Players.LocalPlayer.leaderstats.Glove.Value == "Tank" do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait()
            end
        end
    }):AddKeyPicker("SpamAbility", {
        Default = "B",
        Text = "Auto Spam Ability",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Misc1Basic:AddToggle("Spam Stun Untitled Tag", {
        Text = "Spam Stun Untitled Tag",
        Default = false,
        Callback = function(Value)
            _G.SpamStunUntitledTag = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Untitled Tag Glove" then
                while _G.SpamStunUntitledTag do
                    if game.Players.LocalPlayer.leaderstats.Glove.Value == "Untitled Tag Glove" then
                        game:GetService("ReplicatedStorage").UTGGeneric:FireServer("enableRunMode")
                        for i, v in pairs(game.Players:GetChildren()) do
                            if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
                                if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character.Ragdolled.Value == false and v.Character:FindFirstChild("Mirage") == nil then
                                    if 30 >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude then
                                        game:GetService("ReplicatedStorage").UTGGeneric:FireServer("slideStun", v.Character)
                                    end
                                end
                            end
                        end
                    end
                    task.wait()
                end
            elseif Value == true then
                Notification("You don't have Untitled Tag Glove equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Spam Stun Untitled Tag"]:SetValue(false)
            end
        end
    })
    Misc1Basic:AddToggle("Spam Ability 250 Kill", {
        Text = "Spam Ability 250 Kill",
        Default = false,
        Callback = function(Value)
            _G.SpamAbliKilll = Value
            while _G.SpamAbliKilll do
                if game.Players.LocalPlayer.Character:FindFirstChild("KS250Complete") then
                    game:GetService("ReplicatedStorage").TheForce:FireServer()
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "Part" then
                            v:Destroy()
                        end
                    end
                end
                task.wait()
            end
        end
    })
    Misc1Basic:AddToggle("Infinite Rhythm", {
        Text = "Infinite Rhythm",
        Default = false,
        Callback = function(Value)
            _G.RhythmNoteSpam = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Rhythm" then
                while _G.RhythmNoteSpam do
                    game.Players.LocalPlayer.PlayerGui.Rhythm.LocalScript.Disabled = false
                    game.Players.LocalPlayer.PlayerGui.Rhythm.LocalScript.Disabled = true
                    game.Players.LocalPlayer.Character.Rhythm:Activate()
                    task.wait()
                end
            elseif Value == true then
                Notification("You don't have Rhythm equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Infinite Rhythm"]:SetValue(false)
            end
        end
    })
    Misc1Basic:AddButton("Auto Play Rhythm", function()
        game.Players.LocalPlayer.PlayerGui.Rhythm.MainFrame.Bars.ChildAdded:Connect(function()
            task.delay(1.65, function()
                game.Players.LocalPlayer.Character:FindFirstChild("Rhythm"):Activate()
            end)
        end)
    end)
    Misc1Basic:AddButton("Get All Sword", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Swordfighter" then
            for i, v in pairs({
                "Ice Dagger",
                "Darkheart",
                "Ghostwalker",
                "Venomshank",
                "Windforce",
                "Illumina",
                "Firebrand"
            }) do
                game:GetService("ReplicatedStorage").Events.swordevent:FireServer("AddSword", v)
            end
        else
            Notification("You don't have Swordfighter equipped", _G.TimeNotify)
        end
    end)
    Misc1Basic:AddToggle("Auto Slap Cherry", {
        Text = "Slap Cherry Fast",
        Default = false,
        Callback = function(Value)
            _G.AutoSlapCherry = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Cherry" then
                while _G.AutoSlapCherry do
                    if workspace:FindFirstChild("cherry_storage") then
                        for i, v in pairs(workspace.cherry_storage:GetChildren()) do
                            if v.Name == ("Cherry " .. game.Players.LocalPlayer.Name) and v:FindFirstChild("clone_remote") then
                                v.clone_remote:FireServer()
                            end
                        end
                    end
                    task.wait()
                end
            elseif _G.AutoSlapCherry == true then
                Notification("You don't have Cherry equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Slap Cherry"]:SetValue(false)
            end
        end
    })
    Misc1Basic:AddToggle("Free Emote", {
        Text = "Free Emote",
        Default = false,
        Callback = function(Value)
            _G.LoadingEmote = Value
            Anims = {
                ["L"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["L"]),
                ["GROOVE"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Groove"]),
                ["HELICOPTER"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Helicopter"]),
                ["FLOSS"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Floss"]),
                ["KICK"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Kick"]),
                ["HEADLESS"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Headless"]),
                ["LAUGH"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Laugh"]),
                ["PARKER"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Parker"]),
                ["THRILLER"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Thriller"]),
                ["SPASM"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Spasm"])
            }
            local GuiEmote = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ConsoleEmotes")
            if GuiEmote:FindFirstChild("Emotes") and GuiEmote.Emotes:FindFirstChild("Frame") and GuiEmote.Emotes.Frame:FindFirstChild("Buttons") then
                for i, v in pairs(GuiEmote.Emotes.Frame:FindFirstChild("Buttons"):GetChildren()) do
                    if v:IsA("TextButton") then
                        v.MouseButton1Click:Connect(function()
                            if _G.LoadingEmote == true then
                                game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ConsoleEmotes").Enabled = false
                                for i, v in pairs(Anims) do
                                    if v.IsPlaying then
                                        v:Stop()
                                    end
                                end
                                task.wait()
                                Anims[v.Text]:Play()
                                game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
                                    if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                                        for i, v in pairs(Anims) do
                                            if v.IsPlaying then
                                                v:Stop()
                                            end
                                        end
                                    end
                                end)
                            end
                        end)
                    end
                end
                game.Players.LocalPlayer.Chatted:Connect(function(msg)
                    if _G.LoadingEmote == true then
                        if string.lower(msg) == "/e opengui" then
                            game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ConsoleEmotes").Enabled = true
                        elseif string.lower(msg) == "/e closegui" then
                            game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ConsoleEmotes").Enabled = false
                        end
                        for i, v in pairs(Anims) do
                            if v.IsPlaying then
                                v:Stop()
                            end
                        end
                        task.wait()
                        if string.lower(msg) == "/e l" then
                            Anims["L"]:Play()
                        elseif string.lower(msg) == "/e groove" then
                            Anims["GROOVE"]:Play()
                        elseif string.lower(msg) == "/e helicopter" then
                            Anims["HELICOPTER"]:Play()
                        elseif string.lower(msg) == "/e floss" then
                            Anims["FLOSS"]:Play()
                        elseif string.lower(msg) == "/e kick" then
                            Anims["KICK"]:Play()
                        elseif string.lower(msg) == "/e headless" then
                            Anims["HEADLESS"]:Play()
                        elseif string.lower(msg) == "/e laugh" then
                            Anims["LAUGH"]:Play()
                            game:GetService("ReplicatedStorage").AnimationSound:FireServer("LAUGH")
                        elseif string.lower(msg) == "/e parker" then
                            Anims["PARKER"]:Play()
                        elseif string.lower(msg) == "/e thriller" then
                            Anims["THRILLER"]:Play()
                        elseif string.lower(msg) == "/e spasm" then
                            Anims["SPASM"]:Play()
                        end
                        game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
                            if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                                for i, v in pairs(Anims) do
                                    if v.IsPlaying then
                                        v:Stop()
                                    end
                                end
                            end
                        end)
                    end
                end)
            end
            if loadingNotify then
                return
            else
                loadingNotify = true
                Notification("You have Command /e Name Emote | /e opengui | /e cancelgui", _G.TimeNotify)
            end
        end
    })
    Misc1Basic:AddButton("Destroy All Tycoon", function()
        for i, v in pairs(game.Workspace:GetChildren()) do
            if string.find(v.Name, "ÅTycoon") and v:FindFirstChild("Destruct") then
                for a = 1, 200 do
                    if v:FindFirstChild("Destruct") then
                        fireclickdetector(v.Destruct.ClickDetector, 0)
                        fireclickdetector(v.Destruct.ClickDetector, 1)
                    end
                end
            end
        end
    end)
    Misc1Basic:AddInput("UserGlove", {
        Default = "",
        Numeric = false,
        Text = "Glove",
        Finished = true,
        Placeholder = "UserGlove",
        Callback = function(Value)
            local GlovePlayer = Value
            local Glove
            for _, v in pairs(game.Workspace.Lobby.GloveStands:GetChildren()) do
                if string.sub(v.Name, 1, # GlovePlayer):lower() == GlovePlayer:lower() then
                    Glove = v
                    break
                end
            end
            if Glove then
                _G.EquipGlove = Glove.Name
                Notification("Found Glove [ " .. _G.EquipGlove .. " ]", _G.TimeNotify)
            else
                Notification("Can't find Glove", _G.TimeNotify)
            end
        end
    })
    Misc1Basic:AddDropdown("ChooseEquip", {
        Text = "Equip Glove",
        Values = {
            "Normal",
            "Tournament",
            "Old Glove + Tournament"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.GloveEquipHehe = Value
        end
    })
    Misc1Basic:AddButton("Equip Glove", function()
        if _G.GloveEquipHehe == "Normal" then
            if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
                fireclickdetector(workspace.Lobby[_G.EquipGlove].ClickDetector)
            else
                Notification("You aren't in the lobby.", _G.TimeNotify)
            end
        elseif _G.GloveEquipHehe == "Tournament" or _G.GloveEquipHehe == "Old Glove + Tournament" then
            if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
                if _G.GloveEquipHehe == "Tournament" then
                    fireclickdetector(workspace.Lobby[_G.EquipGlove].ClickDetector)
                end
                wait(0.5)
                repeat
                    task.wait()
                until game.Players.LocalPlayer.Character
                if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    repeat
                        task.wait()
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                    until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                end
                wait(0.3)
                if workspace:FindFirstChild("TournamentIsland") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.TournamentIsland.Spawns.Part.CFrame * CFrame.new(0, 2, 0)
                else
                    Notification("Tournament Island don't not spawn.", _G.TimeNotify)
                end
            else
                Notification("you are in Tournament not equip, 1 you use it.", _G.TimeNotify)
            end
        end
    end)
    Misc1Basic:AddDropdown("ArenaEnter", {
        Text = "Enter",
        Values = {
            "Arena",
            "Arena Default"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.AutoEnter = Value
        end
    })
    Misc1Basic:AddToggle("Auto Enter", {
        Text = "Auto Enter",
        Default = false,
        Callback = function(Value)
            _G.AutoEnterJoin = Value
            while _G.AutoEnterJoin do
                if _G.AutoEnter == "Arena" then
                    if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        repeat
                            task.wait()
                            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 0)
                                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport1, 1)
                            end
                        until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                    end
                elseif _G.AutoEnter == "Arena Default" then
                    if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        repeat
                            task.wait()
                            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport2, 0)
                                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Teleport2, 1)
                            end
                        until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                    end
                end
                task.wait()
            end
        end
    })
    _G.SlapAuraCharacter = "HumanoidRootPart"
    _G.ReachSlapArua = 25
    _G.SlapAuraFriend = "Fight"
    _G.SlapAuraChoose = "Normal"
    Misc1Basic:AddSlider("Reach Aura", {
        Text = "Reach Slap Aura",
        Default = 25,
        Min = 10,
        Max = 50,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            _G.ReachSlapArua = Value
        end
    })
    Misc1Basic:AddDropdown("Slap Friend", {
        Text = "Slap Aura Friend",
        Values = {
            "Fight",
            "Not Fight"
        },
        Default = "Fight",
        Multi = false,
        Callback = function(Value)
            _G.SlapAuraFriend = Value
        end
    })
    Misc1Basic:AddDropdown("ChooseCharacter", {
        Text = "Slap Aura Character",
        Values = {
            "HumanoidRootPart",
            "Head",
            "Left Arm",
            "Left Leg",
            "Right Arm",
            "Right Leg"
        },
        Default = "HumanoidRootPart",
        Multi = false,
        Callback = function(Value)
            _G.SlapAuraCharacter = Value
        end
    })
    Misc1Basic:AddDropdown("Slap Aura Choose", {
        Text = "Slap Aura Choose",
        Values = {
            "Normal",
            "Reverse"
        },
        Default = "Normal",
        Multi = false,
        Callback = function(Value)
            _G.SlapAuraChoose = Value
        end
    })
    Misc1Basic:AddToggle("Slap Aura", {
        Text = "Slap Aura",
        Default = false,
        Callback = function(Value)
            _G.SlapAura = Value
            while _G.SlapAura do
                if _G.SlapAuraChoose == "Normal" then
                    for i, v in pairs(game.Players:GetChildren()) do
                        if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
                            if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character.Ragdolled.Value == false and v.Character:FindFirstChild("Mirage") == nil then
                                if v.Character.Head:FindFirstChild("UnoReverseCard") == nil or game.Players.LocalPlayer.leaderstats.Glove.Value == "Error" then
                                    if _G.ReachSlapArua >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude then
                                        if _G.SlapAuraFriend == "Fight" then
                                            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Mace" then
                                                gloveHits["Mace"]:FireServer(v.Character:WaitForChild(_G.SlapAuraCharacter), 100)
                                            elseif gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value] ~= nil then
                                                gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Character:WaitForChild(_G.SlapAuraCharacter))
                                            else
                                                game.ReplicatedStorage.GeneralHit:FireServer(v.Character:WaitForChild(_G.SlapAuraCharacter))
                                            end
                                        elseif _G.SlapAuraFriend == "Not Fight" then
                                            if not game.Players.LocalPlayer:IsFriendsWith(v.UserId) then
                                                if game.Players.LocalPlayer.leaderstats.Glove.Value == "Mace" then
                                                    gloveHits["Mace"]:FireServer(v.Character:WaitForChild(_G.SlapAuraCharacter), 200)
                                                elseif gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value] ~= nil then
                                                    gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Character:WaitForChild(_G.SlapAuraCharacter))
                                                else
                                                    game.ReplicatedStorage.GeneralHit:FireServer(v.Character:WaitForChild(_G.SlapAuraCharacter))
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if workspace:FindFirstChild("cherry_storage") then
                        for i, v in pairs(workspace.cherry_storage:GetChildren()) do
                            if string.find(v.Name, "Cherry") and v:FindFirstChild("HumanoidRootPart") then
                                if _G.ReachSlapArua >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude then
                                    if game.Players.LocalPlayer.leaderstats.Glove.Value == "Mace" then
                                        gloveHits["Mace"]:FireServer(v:WaitForChild(_G.SlapAuraCharacter), 100)
                                    elseif gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value] ~= nil then
                                        gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v:WaitForChild(_G.SlapAuraCharacter))
                                    else
                                        game.ReplicatedStorage.GeneralHit:FireServer(v:WaitForChild(_G.SlapAuraCharacter))
                                    end
                                end
                            end
                        end
                    end
                    for i, c in pairs(workspace:GetChildren()) do
                        if string.find(c.Name, "Å") and c:FindFirstChild("HumanoidRootPart") then
                            if _G.ReachSlapArua >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - c.HumanoidRootPart.Position).Magnitude then
                                if game.Players.LocalPlayer.leaderstats.Glove.Value == "Mace" then
                                    gloveHits["Mace"]:FireServer(c:WaitForChild(_G.SlapAuraCharacter), 100)
                                elseif gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value] ~= nil then
                                    gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(c:WaitForChild(_G.SlapAuraCharacter))
                                else
                                    game.ReplicatedStorage.GeneralHit:FireServer(c:WaitForChild(_G.SlapAuraCharacter))
                                end
                            end
                        end
                    end
                    if game.Workspace:FindFirstChild("Balls") then
                        for i, g in pairs(workspace:GetChildren()) do
                            if g.Name == "Balls" then
                                for i, z in pairs(g:GetChildren()) do
                                    if string.find(z.Name, "'s Ball") then
                                        if _G.ReachSlapArua >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - z.Position).Magnitude then
                                            game:GetService("ReplicatedStorage").Events.BeachBall:FireServer(z, Vector3.new(game:GetService("Workspace").CurrentCamera.CFrame.LookVector.X, 0, game:GetService("Workspace").CurrentCamera.CFrame.LookVector.Z).Unit * 0.2)
                                        end
                                    end
                                end
                            end
                        end
                    end
                elseif _G.SlapAuraChoose == "Reverse" then
                    for i, v in pairs(game.Players:GetChildren()) do
                        if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
                            if v.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") then
                                if v.Character.Head:FindFirstChild("UnoReverseCard") and game.Players.LocalPlayer.Character.Head:FindFirstChild("UnoReverseCard") then
                                    if _G.ReachSlapArua >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude then
                                        game.ReplicatedStorage.ReverseHit:FireServer(v.Character:WaitForChild(_G.SlapAuraCharacter))
                                    end
                                end
                            end
                        end
                    end
                end
                task.wait(.08)
            end
        end
    }):AddKeyPicker("SlapAura", {
        Default = "H",
        Text = "Slap Aura",
        Mode = "Toggle",
        SyncToggleState = true
    })
    _G.ReachShukuchi = 50
    _G.ShukuchiFriend = "Fight"
    Misc1Basic:AddSlider("Reach Shukuchi", {
        Text = "Reach Shukuchi",
        Default = 50,
        Min = 1,
        Max = 130,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            _G.ReachShukuchi = Value
        end
    })
    Misc1Basic:AddDropdown("Shukuchi Friend", {
        Text = "Shukuchi Friend",
        Values = {
            "Fight",
            "Not Fight"
        },
        Default = "Fight",
        Multi = false,
        Callback = function(Value)
            _G.ShukuchiFriend = Value
        end
    })
    Misc1Basic:AddToggle("Auto Shukuchi Player", {
        Text = "Auto Shukuchi Player",
        Default = false,
        Callback = function(Value)
            _G.AutoShukuchi = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Shukuchi" then
                while _G.AutoShukuchi do
                    for i, v in pairs(game.Players:GetPlayers()) do
                        if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
                            if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character.Head:FindFirstChild("RedEye") == nil and v.Character:FindFirstChild("Mirage") == nil then
                                if v.Character.Head:FindFirstChild("UnoReverseCard") == nil then
                                    if _G.ReachShukuchi >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude then
                                        if _G.ShukuchiFriend == "Fight" then
                                            game:GetService("ReplicatedStorage").SM:FireServer(v)
                                        elseif _G.ShukuchiFriend == "Not Fight" then
                                            if not game.Players.LocalPlayer:IsFriendsWith(v.UserId) then
                                                game:GetService("ReplicatedStorage").SM:FireServer(v)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    task.wait()
                end
            elseif _G.AutoShukuchi == true then
                Notification("You don't have Shukuchi equipped.", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Shukuchi Player"]:SetValue(false)
            end
        end
    })
    _G.ReachHitbox = 10
    Misc1Basic:AddSlider("Reach HitBox", {
        Text = "Reach Hitbox",
        Default = 10,
        Min = 10,
        Max = 30,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            _G.ReachHitbox = Value
        end
    })
    Misc1Basic:AddToggle("Hitbox Player Mod", {
        Text = "Hitbox Player & Mod",
        Default = false,
        Callback = function(Value)
            _G.HitboxPlayer = Value
            while _G.HitboxPlayer do
                for i, v in pairs(game.Players:GetChildren()) do
                    if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        v.Character.HumanoidRootPart.Size = Vector3.new(_G.ReachHitbox, _G.ReachHitbox, _G.ReachHitbox)
                        v.Character.HumanoidRootPart.Transparency = 0.75
                    end
                end
                for i, c in pairs(workspace:GetChildren()) do
                    if string.find(c.Name, "Å") and c:FindFirstChild("HumanoidRootPart") then
                        c.HumanoidRootPart.Size = Vector3.new(_G.ReachHitbox, _G.ReachHitbox, _G.ReachHitbox)
                        c.HumanoidRootPart.Transparency = 0.75
                    end
                end
                task.wait()
            end
            if _G.HitboxPlayer == false then
                for i, v in pairs(game.Players:GetChildren()) do
                    if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        v.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                        v.Character.HumanoidRootPart.Transparency = 1
                    end
                end
                for i, c in pairs(workspace:GetChildren()) do
                    if string.find(c.Name, "Å") and c:FindFirstChild("HumanoidRootPart") then
                        c.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                        c.HumanoidRootPart.Transparency = 1
                    end
                end
            end
        end
    }):AddKeyPicker("Hitbox", {
        Default = "Z",
        Text = "Hitbox Player & Mod",
        Mode = "Toggle",
        SyncToggleState = true
    })
    _G.GloveExtendReach = 5
    Misc1Basic:AddSlider("Extend Glove", {
        Text = "Extend Glove",
        Default = 5,
        Min = 2,
        Max = 20,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            _G.GloveExtendReach = Value
        end
    })
    Misc1Basic:AddDropdown("Extend Option", {
        Text = "Extend Option",
        Values = {
            "Meat Stick",
            "Pancake",
            "Growth",
            "North Korea Wall",
            "Slight Extend"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            GloveExtendOption = Value
        end
    })
    Misc1Basic:AddToggle("Extend Glove", {
        Text = "Extend Glove",
        Default = false,
        Callback = function(Value)
            _G.GloveExtendGet = Value
            if _G.GloveExtendGet == false then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ClassName == "Tool" and v:FindFirstChild("Glove") then
                        v:FindFirstChild("Glove").Size = Vector3.new(2.5, 2.5, 1.7)
                        v:FindFirstChild("Glove").Transparency = 0
                    end
                end
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.ClassName == "Tool" and v:FindFirstChild("Glove") then
                        v:FindFirstChild("Glove").Size = Vector3.new(2.5, 2.5, 1.7)
                        v:FindFirstChild("Glove").Transparency = 0
                    end
                end
            end
            while _G.GloveExtendGet do
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ClassName == "Tool" and v:FindFirstChild("Glove") then
                        if GloveExtendOption == "Meat Stick" then
                            v:FindFirstChild("Glove").Size = Vector3.new(0, _G.GloveExtendReach, 2)
                        elseif GloveExtendOption == "Pancake" then
                            v:FindFirstChild("Glove").Size = Vector3.new(0, _G.GloveExtendReach, _G.GloveExtendReach)
                        elseif GloveExtendOption == "Growth" then
                            v:FindFirstChild("Glove").Size = Vector3.new(_G.GloveExtendReach, _G.GloveExtendReach, _G.GloveExtendReach)
                        elseif GloveExtendOption == "North Korea Wall" then
                            v:FindFirstChild("Glove").Size = Vector3.new(_G.GloveExtendReach, 0, _G.GloveExtendReach)
                        elseif GloveExtendOption == "Slight Extend" then
                            v:FindFirstChild("Glove").Size = Vector3.new(3, 3, 3.7)
                        end
                        v:FindFirstChild("Glove").Transparency = 0.5
                    end
                end
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.ClassName == "Tool" and v:FindFirstChild("Glove") then
                        if GloveExtendOption == "Meat Stick" then
                            v:FindFirstChild("Glove").Size = Vector3.new(0, _G.GloveExtendReach, 2)
                        elseif GloveExtendOption == "Pancake" then
                            v:FindFirstChild("Glove").Size = Vector3.new(0, _G.GloveExtendReach, _G.GloveExtendReach)
                        elseif GloveExtendOption == "Growth" then
                            v:FindFirstChild("Glove").Size = Vector3.new(_G.GloveExtendReach, _G.GloveExtendReach, _G.GloveExtendReach)
                        elseif GloveExtendOption == "North Korea Wall" then
                            v:FindFirstChild("Glove").Size = Vector3.new(_G.GloveExtendReach, 0, _G.GloveExtendReach)
                        elseif GloveExtendOption == "Slight Extend" then
                            v:FindFirstChild("Glove").Size = Vector3.new(3, 3, 3.7)
                        end
                        v:FindFirstChild("Glove").Transparency = 0.5
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("ExtendGlove", {
        Default = "C",
        Text = "Extend Glove",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Misc1Basic:AddInput("Auto Change Nametag", {
        Default = "Auto Change Nametag",
        Numeric = false,
        Text = "",
        Placeholder = "Change",
        Callback = function(Value)
            game.Workspace.NametagChanged.Value = Value
        end
    })
    Misc1Basic:AddToggle("NameTag", {
        Text = "Auto Set NameTag",
        Default = false,
        Callback = function(Value)
            _G.AutoSetNameTag = Value
            while _G.AutoSetNameTag do
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Head") and game.Players.LocalPlayer.Character.Head:FindFirstChild("Nametag") then
                    if game.Players.LocalPlayer.Character.Head.Nametag:FindFirstChild("TextLabel") and game.Players.LocalPlayer.Character.Head.Nametag.TextLabel.Text ~= game.Workspace.NametagChanged.Value then
                        game.Players.LocalPlayer.Character.Head.Nametag.TextLabel.Text = game.Workspace.NametagChanged.Value
                    end
                end
                task.wait()
            end
        end
    })
    Misc1Basic:AddInput("Auto Change Slap", {
        Default = "Auto Change Slap",
        Numeric = false,
        Text = "",
        Placeholder = "Change",
        Callback = function(Value)
            game.Workspace.NametagChanged.SlapChanged.Value = Value
        end
    })
    Misc1Basic:AddToggle("SlapFake", {
        Text = "Auto Set Slap",
        Default = false,
        Callback = function(Value)
            _G.AutoChangeSlapFake = Value
            while _G.AutoChangeSlapFake do
                if game.Players.LocalPlayer.leaderstats.Slaps.Value ~= game.Workspace.NametagChanged.SlapChanged.Value then
                    game.Players.LocalPlayer.leaderstats.Slaps.Value = game.Workspace.NametagChanged.SlapChanged.Value
                end
                task.wait()
            end
        end
    })
    Misc1Basic:AddInput("Auto Change Glove", {
        Default = "Auto Change Glove",
        Numeric = false,
        Text = "",
        Placeholder = "Change",
        Callback = function(Value)
            game.Workspace.NametagChanged.GloveChanged.Value = Value
        end
    })
    Misc1Basic:AddToggle("GloveFake", {
        Text = "Auto Set Glove",
        Default = false,
        Callback = function(Value)
            _G.AutoChangeSlapFake = Value
            while _G.AutoChangeSlapFake do
                if game.Players.LocalPlayer.leaderstats.Glove.Value ~= game.Workspace.NametagChanged.GloveChanged.Value then
                    game.Players.LocalPlayer.leaderstats.Glove.Value = game.Workspace.NametagChanged.GloveChanged.Value
                end
                task.wait()
            end
        end
    })
    Misc1Basic:AddDropdown("Tycoon", {
        Text = "Tycoon",
        Values = {
            "All",
            "Your"
        },
        Default = "All",
        Multi = false,
        Callback = function(Value)
            _G.TycoonAuto = Value
        end
    })
    Misc1Basic:AddToggle("Click Tycoon", {
        Text = "Auto Click Tycoon",
        Default = false,
        Callback = function(Value)
            _G.AutoClickTycoon = Value
            while _G.AutoClickTycoon do
                if _G.TycoonAuto == "All" then
                    for _, v in pairs(game.Workspace:GetChildren()) do
                        if string.find(v.Name, "ÅTycoon") and v:FindFirstChild("Click") then
                            fireclickdetector(v.Click.ClickDetector, 0)
                            fireclickdetector(v.Click.ClickDetector, 1)
                        end
                    end
                elseif _G.TycoonAuto == "Your" then
                    for _, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name:match(game.Players.LocalPlayer.Name) then
                            for i, x in pairs(v:GetChildren()) do
                                if x.Name == "TycoonDrop" then
                                    x.CFrame = v.End.CFrame
                                end
                            end
                            if v:FindFirstChild("Click") then
                                fireclickdetector(v.Click.ClickDetector, 0)
                                fireclickdetector(v.Click.ClickDetector, 1)
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    })
    Misc1Basic:AddToggle("Auto Destroy Tycoon", {
        Text = "Auto Destroy Tycoon",
        Default = false,
        Callback = function(Value)
            _G.AutoDestroyTycoon = Value
            while _G.AutoDestroyTycoon do
                if _G.TycoonAuto == "All" then
                    for _, v in pairs(game.Workspace:GetChildren()) do
                        if string.find(v.Name, "ÅTycoon") and v:FindFirstChild("Destruct") then
                            fireclickdetector(v.Destruct.ClickDetector, 0)
                            fireclickdetector(v.Destruct.ClickDetector, 1)
                        end
                    end
                elseif _G.TycoonAuto == "Your" then
                    for _, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("Destruct") then
                            fireclickdetector(v.Destruct.ClickDetector, 0)
                            fireclickdetector(v.Destruct.ClickDetector, 1)
                        end
                    end
                end
                task.wait()
            end
        end
    })
    local Misc2Esp = TabBoxMisc1:AddTab("Esp")
    _G.ColorESP = Color3.new(255, 255, 255)
    Misc2Esp:AddToggle("Esp Glove", {
        Text = "Esp Glove",
        Default = false,
        Callback = function(Value)
            _G.GloveESP = Value
            if _G.GloveESP == false then
                for i, v in ipairs(game.Players:GetChildren()) do
                    if v.Character:FindFirstChild("Head") and v.Character.Head:FindFirstChild("GloveEsp") then
                        v.Character.Head.GloveEsp:Destroy()
                    end
                    if v.Character and v.Character:FindFirstChild(v.Name) then
                        v.Character[v.Name]:Destroy()
                    end
                    for i, f in pairs(game.Workspace:GetChildren()) do
                        if f.Name == (v.Name .. "_Body") then
                            if f:FindFirstChild("HumanoidRootPart") and f.HumanoidRootPart:FindFirstChild("BodyGloveEsp") then
                                f.HumanoidRootPart.BodyGloveEsp:Destroy()
                                if f:FindFirstChild("HumanoidRootPart") and f.HumanoidRootPart:FindFirstChild("EspBoxBody") then
                                    f.HumanoidRootPart.EspBoxBody:Destroy()
                                end
                            end
                        end
                    end
                    for i, t in pairs(game.Workspace:GetChildren()) do
                        if t.Name == (v.Name .. "_Ghost") then
                            if t:FindFirstChild("RootPart") and t.RootPart:FindFirstChild("GhostGloveEsp") then
                                t.RootPart.GhostGloveEsp:Destroy()
                                if t:FindFirstChild("RootPart") and t.RootPart:FindFirstChild("EspBoxGhost") then
                                    t.RootPart.EspBoxGhost:Destroy()
                                end
                            end
                        end
                    end
                end
            end
            while _G.GloveESP do
                for i, v in ipairs(game.Players:GetChildren()) do
                    if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        if v.Character.Head:FindFirstChild("GloveEsp") and v.Character.Head.GloveEsp:FindFirstChild("TextLabel") and v.Character.Head.GloveEsp.TextLabel.TextColor3 ~= _G.ColorESP then
                            v.Character.Head.GloveEsp.TextLabel.TextColor3 = _G.ColorESP
                        end
                        if v.Character.Head:FindFirstChild("GloveEsp") and v.Character.Head.GloveEsp:FindFirstChild("TextLabel") then
                            v.Character.Head.GloveEsp.TextLabel.Text = (_G.GloveEsp == true and "Glove [ " .. v.leaderstats.Glove.Value .. " ]" or "") .. (_G.DistanceEsp == true and "\nDistance [ " .. string.format("%.1f", (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude) .. " ]" or "") .. (_G.SlapEsp == true and "\nSlap [ " .. v.leaderstats.Slaps.Value .. " ]" or "") .. (_G.NameEsp == true and "\nName [ " .. v.Name .. " ]" or "")
                        end
                        if game.Workspace:FindFirstChild(v.Name .. "_Body") and v.Character.Head:FindFirstChild("GloveEsp") then
                            v.Character.Head.GloveEsp:Destroy()
                        end
                        if game.Workspace:FindFirstChild(v.Name .. "_Body") == nil and v.Character.Head:FindFirstChild("GloveEsp") == nil then
                            GloveEsp = Instance.new("BillboardGui", v.Character.Head)
                            GloveEsp.Adornee = v.Character.Head
                            GloveEsp.Name = "GloveEsp"
                            GloveEsp.Size = UDim2.new(0, 100, 0, 150)
                            GloveEsp.AlwaysOnTop = true
                            GloveEsp.StudsOffset = Vector3.new(0, 3, 0)
                            GloveEspText = Instance.new("TextLabel", GloveEsp)
                            GloveEspText.BackgroundTransparency = 1
                            GloveEspText.Font = Enum.Font.SourceSansBold
                            GloveEspText.Size = UDim2.new(0, 100, 0, 100)
                            GloveEspText.TextSize = _G.TextSize
                            GloveEspText.TextColor3 = _G.ColorESP
                            GloveEspText.TextStrokeTransparency = 0.5
                            GloveEspText.Text = ""
                        end
                        if _G.HighlightEsp == true then
                            if v.Character and v.Character:FindFirstChild(v.Name) == nil then
                                local HighlightEsp = Instance.new("Highlight", v.Character)
                                HighlightEsp.Adornee = v.Character
                                HighlightEsp.Name = v.Name
                                HighlightEsp.OutlineTransparency = 0
                                HighlightEsp.FillTransparency = 0.5
                                HighlightEsp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            end
                        elseif _G.HighlightEsp == false then
                            if v.Character and v.Character:FindFirstChild(v.Name) then
                                v.Character[v.Name]:Destroy()
                            end
                        end
                        if _G.GhostEsp == true then
                            for i, f in pairs(game.Workspace:GetChildren()) do
                                if f.Name == (v.Name .. "_Body") then
                                    if f:FindFirstChild("HumanoidRootPart") and f.HumanoidRootPart:FindFirstChild("BodyGloveEsp") and f.HumanoidRootPart.BodyGloveEsp:FindFirstChild("TextLabel") and f.HumanoidRootPart.BodyGloveEsp.TextLabel.TextColor3 ~= _G.ColorESP then
                                        f.HumanoidRootPart.BodyGloveEsp.TextLabel.TextColor3 = _G.ColorESP
                                        if f:FindFirstChild("HumanoidRootPart") and f.HumanoidRootPart:FindFirstChild("EspBoxBody") and f.HumanoidRootPart.EspBoxBody.Color3 ~= _G.ColorESP then
                                            f.HumanoidRootPart.EspBoxBody.Color3 = _G.ColorESP
                                            if _G.DistanceEsp == true and f:FindFirstChild("HumanoidRootPart") and f.HumanoidRootPart:FindFirstChild("BodyGloveEsp") and f.HumanoidRootPart.BodyGloveEsp:FindFirstChild("TextLabel") then
                                                f.HumanoidRootPart.BodyGloveEsp.TextLabel.Text = "Body [ " .. v.Name .. " ]\nDistance [ " .. string.format("%.1f", (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - f.HumanoidRootPart.Position).Magnitude) .. " ]"
                                            elseif _G.DistanceEsp == false and f:FindFirstChild("HumanoidRootPart") and f.HumanoidRootPart:FindFirstChild("BodyGloveEsp") and f.HumanoidRootPart.BodyGloveEsp:FindFirstChild("TextLabel") and f.HumanoidRootPart.BodyGloveEsp.TextLabel.Text ~= "Body [ " .. v.Name .. " ]" then
                                                f.HumanoidRootPart.BodyGloveEsp.TextLabel.Text = "Body [ " .. v.Name .. " ]"
                                            end
                                        end
                                    end
                                end
                            end
                            for i, t in pairs(game.Workspace:GetChildren()) do
                                if t.Name == (v.Name .. "_Ghost") then
                                    if t:FindFirstChild("RootPart") and t.RootPart:FindFirstChild("GhostGloveEsp") and t.RootPart.GhostGloveEsp:FindFirstChild("TextLabel") and t.RootPart.GhostGloveEsp.TextLabel.TextColor3 ~= _G.ColorESP then
                                        t.RootPart.GhostGloveEsp.TextLabel.TextColor3 = _G.ColorESP
                                        if t:FindFirstChild("RootPart") and t.RootPart:FindFirstChild("EspBoxGhost") and t.RootPart.EspBoxGhost.Color3 ~= _G.ColorESP then
                                            t.RootPart.EspBoxGhost.Color3 = _G.ColorESP
                                            if _G.DistanceEsp == true and t:FindFirstChild("RootPart") and t.RootPart:FindFirstChild("GhostGloveEsp") and t.RootPart.GhostGloveEsp:FindFirstChild("TextLabel") then
                                                t.RootPart.GhostGloveEsp.TextLabel = "Ghost [ " .. v.Name .. " ]\nDistance [ " .. string.format("%.1f", (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - t.RootPart.Position).Magnitude) .. " ]"
                                            elseif _G.DistanceEsp == false and t:FindFirstChild("RootPart") and t.RootPart:FindFirstChild("GhostGloveEsp") and t.RootPart.GhostGloveEsp:FindFirstChild("TextLabel") and t.RootPart.GhostGloveEsp.TextLabel.Text ~= "Ghost [ " .. v.Name .. " ]" then
                                                t.RootPart.GhostGloveEsp.TextLabel.Text = "Ghost [ " .. v.Name .. " ]"
                                            end
                                        end
                                    end
                                end
                            end
                            if game.Workspace:FindFirstChild(v.Name .. "_Body") and game.Workspace[v.Name .. "_Body"]:FindFirstChild("HumanoidRootPart") and game.Workspace[v.Name .. "_Body"].HumanoidRootPart:FindFirstChild("BodyGloveEsp") == nil then
                                BodyGloveEsp = Instance.new("BillboardGui", game.Workspace[v.Name .. "_Body"].HumanoidRootPart)
                                BodyGloveEsp.Adornee = game.Workspace[v.Name .. "_Body"].HumanoidRootPart
                                BodyGloveEsp.Name = "BodyGloveEsp"
                                BodyGloveEsp.Size = UDim2.new(0, 100, 0, 150)
                                BodyGloveEsp.AlwaysOnTop = true
                                BodyGloveEsp.StudsOffset = Vector3.new(0, 3, 0)
                                BodyGloveEspText = Instance.new("TextLabel", BodyGloveEsp)
                                BodyGloveEspText.BackgroundTransparency = 1
                                BodyGloveEspText.Size = UDim2.new(0, 100, 0, 100)
                                BodyGloveEspText.TextSize = _G.TextSize
                                BodyGloveEspText.Font = Enum.Font.SourceSansBold
                                BodyGloveEspText.TextColor3 = _G.ColorESP
                                BodyGloveEspText.TextStrokeTransparency = 0.5
                                BodyGloveEspText.Text = "Body [ " .. v.Name .. " ]"
                                if game.Workspace:FindFirstChild(v.Name .. "_Body") and game.Workspace[v.Name .. "_Body"]:FindFirstChild("HumanoidRootPart") and game.Workspace[v.Name .. "_Body"].HumanoidRootPart:FindFirstChild("EspBoxBody") == nil then
                                    local EspBoxBody = Instance.new("BoxHandleAdornment", game.Workspace[v.Name .. "_Body"].HumanoidRootPart)
                                    EspBoxBody.Name = "EspBoxBody"
                                    EspBoxBody.Size = game.Workspace[v.Name .. "_Body"].HumanoidRootPart.Size
                                    EspBoxBody.Adornee = game.Workspace[v.Name .. "_Body"].HumanoidRootPart
                                    EspBoxBody.Color3 = _G.ColorESP
                                    EspBoxBody.AlwaysOnTop = true
                                    EspBoxBody.ZIndex = 5
                                    EspBoxBody.Transparency = 0.5
                                end
                            end
                            if game.Workspace:FindFirstChild(v.Name .. "_Ghost") and game.Workspace[v.Name .. "_Ghost"]:FindFirstChild("RootPart") and game.Workspace[v.Name .. "_Ghost"].RootPart:FindFirstChild("GhostGloveEsp") == nil then
                                GhostGloveEsp = Instance.new("BillboardGui", game.Workspace[v.Name .. "_Ghost"].RootPart)
                                GhostGloveEsp.Adornee = game.Workspace[v.Name .. "_Ghost"].RootPart
                                GhostGloveEsp.Name = "GhostGloveEsp"
                                GhostGloveEsp.Size = UDim2.new(0, 100, 0, 150)
                                GhostGloveEsp.AlwaysOnTop = true
                                GhostGloveEsp.StudsOffset = Vector3.new(0, 3, 0)
                                GhostGloveEspText = Instance.new("TextLabel", GhostGloveEsp)
                                GhostGloveEspText.BackgroundTransparency = 1
                                GhostGloveEspText.Size = UDim2.new(0, 100, 0, 100)
                                GhostGloveEspText.TextSize = _G.TextSize
                                GhostGloveEspText.Font = Enum.Font.SourceSansBold
                                GhostGloveEspText.TextColor3 = _G.ColorESP
                                GhostGloveEspText.TextStrokeTransparency = 0.5
                                GhostGloveEspText.Text = "Ghost [ " .. v.Name .. " ]"
                                if game.Workspace:FindFirstChild(v.Name .. "_Ghost") and game.Workspace[v.Name .. "_Ghost"]:FindFirstChild("RootPart") and game.Workspace[v.Name .. "_Ghost"].RootPart:FindFirstChild("EspBoxGhost") == nil then
                                    local EspBoxGhost = Instance.new("BoxHandleAdornment", game.Workspace[v.Name .. "_Ghost"].RootPart)
                                    EspBoxGhost.Name = "EspBoxGhost"
                                    EspBoxGhost.Size = game.Workspace[v.Name .. "_Ghost"].RootPart.Size
                                    EspBoxGhost.Adornee = game.Workspace[v.Name .. "_Ghost"].RootPart
                                    EspBoxGhost.Color3 = _G.ColorESP
                                    EspBoxGhost.AlwaysOnTop = true
                                    EspBoxGhost.ZIndex = 5
                                    EspBoxGhost.Transparency = 0.5
                                end
                            end
                        elseif _G.GhostEsp == false then
                            for i, f in pairs(game.Workspace:GetChildren()) do
                                if f.Name == (v.Name .. "_Body") then
                                    if f:FindFirstChild("HumanoidRootPart") and f.HumanoidRootPart:FindFirstChild("BodyGloveEsp") then
                                        f.HumanoidRootPart.BodyGloveEsp:Destroy()
                                        if f:FindFirstChild("HumanoidRootPart") and f.HumanoidRootPart:FindFirstChild("EspBoxBody") then
                                            f.HumanoidRootPart.EspBoxBody:Destroy()
                                        end
                                    end
                                end
                            end
                            for i, t in pairs(game.Workspace:GetChildren()) do
                                if t.Name == (v.Name .. "_Ghost") then
                                    if t:FindFirstChild("RootPart") and t.RootPart:FindFirstChild("GhostGloveEsp") then
                                        t.RootPart.GhostGloveEsp:Destroy()
                                        if t:FindFirstChild("RootPart") and t.RootPart:FindFirstChild("EspBoxGhost") then
                                            t.RootPart.EspBoxGhost:Destroy()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    }):AddColorPicker("Color Esp", {
        Default = Color3.new(255, 255, 255),
        Callback = function(Value)
            _G.ColorESP = Value
        end
    }):AddKeyPicker("EspGlove", {
        Default = "T",
        Text = "Esp Glove",
        Mode = "Toggle",
        SyncToggleState = true
    })
    _G.DistanceEsp = false
    Misc2Esp:AddToggle("Distance Esp", {
        Text = "Distance Esp",
        Default = false,
        Callback = function(Value)
            _G.DistanceEsp = Value
        end
    })
    _G.GloveEsp = false
    Misc2Esp:AddToggle("Glove Esp", {
        Text = "Glove Esp",
        Default = false,
        Callback = function(Value)
            _G.GloveEsp = Value
        end
    })
    _G.SlapEsp = false
    Misc2Esp:AddToggle("Slap Esp", {
        Text = "Slap Esp",
        Default = false,
        Callback = function(Value)
            _G.SlapEsp = Value
        end
    })
    _G.NameEsp = false
    Misc2Esp:AddToggle("Name Esp", {
        Text = "Name Esp",
        Default = false,
        Callback = function(Value)
            _G.NameEsp = Value
        end
    })
    _G.GhostEsp = false
    Misc2Esp:AddToggle("Ghost Esp", {
        Text = "Ghost Esp",
        Default = false,
        Callback = function(Value)
            _G.GhostEsp = Value
        end
    })
    _G.HighlightEsp = false
    Misc2Esp:AddToggle("Highlight Esp", {
        Text = "Highlight Esp",
        Default = false,
        Callback = function(Value)
            _G.HighlightEsp = Value
        end
    })
    _G.TextSize = 10
    Misc2Esp:AddSlider("Size Text Esp", {
        Text = "Size Text Esp",
        Default = 10,
        Min = 10,
        Max = 40,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            _G.TextSize = Value
            for i, v in ipairs(game.Players:GetChildren()) do
                if v.Character:FindFirstChild("Head") and v.Character.Head:FindFirstChild("GloveEsp") and v.Character.Head.GloveEsp:FindFirstChild("TextLabel") and v.Character.Head.GloveEsp.TextLabel.TextSize ~= Value then
                    v.Character.Head.GloveEsp.TextLabel.TextSize = Value
                end
                for i, f in pairs(game.Workspace:GetChildren()) do
                    if f.Name == (v.Name .. "_Body") then
                        if f:FindFirstChild("HumanoidRootPart") and f.HumanoidRootPart:FindFirstChild("BodyGloveEsp") and f.HumanoidRootPart.BodyGloveEsp:FindFirstChild("TextLabel") and f.HumanoidRootPart.BodyGloveEsp.TextLabel.TextSize ~= Value then
                            f.HumanoidRootPart.BodyGloveEsp.TextLabel.TextSize = Value
                        end
                    end
                end
                for i, t in pairs(game.Workspace:GetChildren()) do
                    if t.Name == (v.Name .. "_Ghost") then
                        if t:FindFirstChild("RootPart") and t.RootPart:FindFirstChild("GhostGloveEsp") and t.RootPart.GhostGloveEsp:FindFirstChild("TextLabel") and t.RootPart.GhostGloveEsp.TextLabel.TextSize ~= Value then
                            t.RootPart.GhostGloveEsp.TextLabel.TextSize = Value
                        end
                    end
                end
            end
        end
    })
    local Misc3Group = Tabs.Tab5:AddRightGroupbox("Misc Help")
    Misc3Group:AddInput("Players", {
        Default = "",
        Numeric = false,
        Text = "",
        Finished = true,
        Placeholder = "Username",
        Callback = function(Value)
            _G.PlayerTarget = Value
            for _, v in pairs(game.Players:GetPlayers()) do
                if string.sub(v.Name, 1, # _G.PlayerTarget):lower() == _G.PlayerTarget:lower() then
                    PlayerTa = v
                end
            end
            if PlayerTa then
                _G.PlayerPut1 = PlayerTa.Name
                Notification("Found Player [ " .. PlayerTa.Name .. " ]", _G.TimeNotify)
            else
                Notification("Can't find player", _G.TimeNotify)
            end
        end
    })
    Misc3Group:AddDropdown("Retro", {
        Text = "Retro",
        Values = {
            "Get Retro",
            "Teleport Button",
            "Enter Retro"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.HelpPlayerGetHehe = Value
        end
    })
    Misc3Group:AddButton("Help Player Retro", function()
        if _G.HelpPlayerGetHehe == "Get Retro" then
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Grab" then
                if game.Workspace:FindFirstChild("Retro") == nil then
                    game.ReplicatedStorage.Assets.Retro.Parent = game.Workspace
                end
                wait(1)
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Grab") then
                    game.Players.LocalPlayer.Backpack:FindFirstChild("Grab").Parent = game.Players.LocalPlayer.Character
                end
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                wait(0.2)
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                wait(0.25)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.FinishDoor_Retro.Part.CFrame
                wait(1)
                if game.Players.LocalPlayer.Character:FindFirstChild("Grab") then
                    game.Players.LocalPlayer.Character:FindFirstChild("Grab").Parent = game.Players.LocalPlayer.Backpack
                end
            else
                Notification("You don't have Grab equipped", _G.TimeNotify)
            end
        elseif _G.HelpPlayerGetHehe == "Teleport Button" then
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Grab" then
                if game.Workspace:FindFirstChild("Retro") == nil then
                    game.ReplicatedStorage.Assets.Retro.Parent = game.Workspace
                end
                wait(1)
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Grab") then
                    game.Players.LocalPlayer.Backpack:FindFirstChild("Grab").Parent = game.Players.LocalPlayer.Character
                end
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerPut1].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                wait(0.2)
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                wait(0.25)
                if game.Workspace:FindFirstChild("Retro") and game.Workspace.Retro:FindFirstChild("Map") then
                    for i, v in pairs(workspace.Retro.Map.RetroObbyMap:GetChildren()) do
                        if v.Name == "Model" and v:FindFirstChild("StaffApp") and v.StaffApp:FindFirstChild("Button") and v.StaffApp.Button:FindFirstChild("ClickDetector") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.StaffApp.Button.CFrame
                        end
                    end
                end
                wait(1)
                if game.Players.LocalPlayer.Character:FindFirstChild("Grab") then
                    game.Players.LocalPlayer.Character:FindFirstChild("Grab").Parent = game.Players.LocalPlayer.Backpack
                end
            else
                Notification("You don't have Grab equipped", _G.TimeNotify)
            end
        elseif _G.HelpPlayerGetHehe == "Enter Retro" then
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Glitch" and game.Players.LocalPlayer.leaderstats.Slaps.Value >= 50000 and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players[_G.PlayerPut1].Character:FindFirstChild("entered") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerPut1].Character.HumanoidRootPart.CFrame
                wait(0.35)
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                fireclickdetector(workspace.Lobby["Error"].ClickDetector)
                task.wait(8.5)
                repeat
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerPut1].Character.HumanoidRootPart.CFrame
                until 4.5 >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Players[_G.PlayerPut1].Character.HumanoidRootPart.Position).Magnitude or game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or game.Players[_G.PlayerPut1].Character:FindFirstChild("Humanoid") and game.Players[_G.PlayerPut1].Character.Humanoid.Health <= 0
                wait(0.07)
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health > 0 or game.Players[_G.PlayerPut1].Character:FindFirstChild("Humanoid") and game.Players[_G.PlayerPut1].Character.Humanoid.Health > 0 then
                    game.ReplicatedStorage.Errorhit:FireServer(game.Players[_G.PlayerPut1].Character:WaitForChild("Head"))
                end
            else
                Notification("You have in Lobby | Player [ " .. _G.PlayerPut1 .. " ] in arena, or You don't have Glitch equipped, or you have don't have 50K Slap", _G.TimeNotify)
            end
        end
    end)
    Misc3Group:AddButton("Help Player Quake", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Home Run" and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players[_G.PlayerPut1].leaderstats.Glove.Value == "Berserk" then
            game:GetService("ReplicatedStorage").HomeRun:FireServer({
                ["start"] = true
            })
            fireclickdetector(workspace.Lobby.woah.ClickDetector)
            wait(4.2)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerPut1].Character.HumanoidRootPart.CFrame
            task.wait(.2)
            game:GetService("ReplicatedStorage").VineThud:FireServer()
            task.wait(1)
            fireclickdetector(workspace.Lobby["Home Run"].ClickDetector)
            wait(0.4)
            spawn(function()
                repeat
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerPut1].Character.HumanoidRootPart.CFrame
                until 4.5 >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Players[_G.PlayerPut1].Character.HumanoidRootPart.Position).Magnitude or game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or game.Players[_G.PlayerPut1].Character:FindFirstChild("Humanoid") and game.Players[_G.PlayerPut1].Character.Humanoid.Health <= 0
            end)
            wait(0.7)
            game:GetService("ReplicatedStorage").HomeRun:FireServer({
                ["finished"] = true
            })
        else
            Notification("You don't have Home Run equipped, or you have to go lobby, or player don't have Berserk equipped.", _G.TimeNotify)
        end
    end)
    Misc3Group:AddButton("Help Player Goofy", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Confusion" and game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2133016756) then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerPut1].Character.HumanoidRootPart.CFrame
            wait(0.2)
            game:GetService("ReplicatedStorage").GeneralHit:FireServer(game.Players[_G.PlayerPut1].Character:WaitForChild("HumanoidRootPart"))
            fireclickdetector(workspace.Lobby.Goofy.ClickDetector)
            wait(2)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerPut1].Character.HumanoidRootPart.CFrame
            wait(0.2)
            game:GetService("ReplicatedStorage").GeneralHit:FireServer(game.Players[_G.PlayerPut1].Character:WaitForChild("HumanoidRootPart"))
        else
            Notification("You don't have Confusion equipped, or you have to go lobby.", _G.TimeNotify)
        end
    end)
    Misc3Group:AddSlider("Time Help Berserk", {
        Text = "Time Help Berserk",
        Default = 3,
        Min = 1,
        Max = 3,
        Rounding = 0,
        Callback = function(Value)
            _G.TimeHelpGotIm = Value
        end
    })
    Misc3Group:AddDropdown("Will Teleport Help", {
        Text = "Will Teleport Help",
        Values = {
            "Up To You",
            "SafeSpotBox 1.0",
            "SafeSpotBox 2.0"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.GetTeleportHelp = Value
        end
    })
    Misc3Group:AddButton("Help Player Berserk", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Kinetic" and game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players[_G.PlayerPut1].Character:FindFirstChild("entered") then
            for o = 1, _G.TimeHelpGotIm do
                if _G.GetTeleportHelp == "Up To You" then
                    OGL = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                elseif _G.GetTeleportHelp == "SafeSpotBox 1.0" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                elseif _G.GetTeleportHelp == "SafeSpotBox 2.0" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Safespot"].CFrame * CFrame.new(0, 10, 0)
                end
                game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                repeat
                    task.wait()
                    game.ReplicatedStorage.SelfKnockback:FireServer({
                        ["Force"] = - 99
                    })
                until game.Players.LocalPlayer.Character:WaitForChild("KineticSlappedBadgeCounter").Value >= 100
                wait(2.8)
                if _G.GetTeleportHelp == "Up To You" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OGL
                elseif _G.GetTeleportHelp == "SafeSpotBox 1.0" or _G.GetTeleportHelp == "SafeSpotBox 2.0" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerPut1].Character.Head.CFrame * CFrame.new(0, 5.80, 0)
                end
                wait(0.28)
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Kinetic") then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Kinetic)
                end
                wait(0.19)
                game:GetService("ReplicatedStorage").KineticExpl:FireServer(game.Players.LocalPlayer.Character.Kinetic, game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                wait(0.7)
                if _G.GetTeleportHelp == "Up To You" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OGL
                elseif _G.GetTeleportHelp == "SafeSpotBox 1.0" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["SafeBox"].CFrame * CFrame.new(0, 5, 0)
                elseif _G.GetTeleportHelp == "SafeSpotBox 2.0" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Safespot"].CFrame * CFrame.new(0, 10, 0)
                end
                wait(3.8)
            end
        else
            Notification("You don't have Kinetic equipped, or you have to go Arena, or player have go to arena.", _G.TimeNotify)
        end
    end)
    local Glove1Group = Tabs.Tab6:AddLeftGroupbox("Glove")
    Glove1Group:AddDropdown("Prop", {
        Text = "Prop Ability",
        Values = {
            "Barrel",
            "Bench",
            "Brick",
            "Bush 1",
            "Bush 2",
            "Cauldron",
            "Diamond",
            "Frenzy Bot",
            "Gift",
            "GoldenSlapple",
            "Imp",
            "Jet Orb",
            "Larry",
            "MEGAROCK",
            "Moai Head",
            "Obby 1",
            "Obby 2",
            "Obby 3",
            "Obby 4",
            "Obby 5",
            "Orange",
            "Oven",
            "Phase Heart",
            "Phase Orb",
            "Rock 1",
            "Rock 2",
            "Rock 3",
            "Sentry",
            "Slapple",
            "Snow Peep",
            "Snow Turret",
            "bob",
            "rob",
            "Sbeve"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            PropAbility = Value
        end
    })
    Glove1Group:AddToggle("Spam Prop", {
        Text = "Auto Ability Prop",
        Default = false,
        Callback = function(Value)
            _G.PropSpam = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Prop" then
                while _G.PropSpam do
                    if game.Workspace:FindFirstChild("PropModel_" .. game.Players.LocalPlayer.Name) == nil then
                        game:GetService("ReplicatedStorage").GeneralAbility:FireServer(PropAbility)
                    end
                    task.wait()
                end
            elseif _G.PropSpam == true then
                Notification("You don't have Prop equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Spam Prop"]:SetValue(false)
            end
        end
    })
    Glove1Group:AddDropdown("Santa", {
        Text = "Santa Ability",
        Values = {
            "Bob Plush",
            "Snow Peep",
            "Milk"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            SantaAbility = Value
        end
    })
    Glove1Group:AddToggle("Spam Santa", {
        Text = "Auto Ability Santa",
        Default = false,
        Callback = function(Value)
            SantaSpam = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Santa" then
                while SantaSpam do
                    if SantaAbility == "Bob Plush" then
                        game:GetService("ReplicatedStorage").GeneralAbility:FireServer("bobplush")
                    elseif SantaAbility == "Snow Peep" then
                        game:GetService("ReplicatedStorage").GeneralAbility:FireServer("snowpeep")
                    elseif SantaAbility == "Milk" then
                        game:GetService("ReplicatedStorage").GeneralAbility:FireServer("milk")
                    end
                    task.wait()
                end
            elseif SantaSpam == true then
                Notification("You don't have Santa equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Spam Santa"]:SetValue(false)
            end
        end
    })
    Glove1Group:AddDropdown("AdminAbility", {
        Text = "Admin Ability",
        Values = {
            "Fling",
            "Anvil",
            "Invisibility"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            AbilityAdmin = Value
        end
    })
    Glove1Group:AddToggle("Spam Admin", {
        Text = "Auto Ability Admin",
        Default = false,
        Callback = function(Value)
            AdminSpam = Value
            while AdminSpam do
                game:GetService("ReplicatedStorage").AdminAbility:FireServer(AbilityAdmin)
                task.wait()
            end
        end
    })
    Glove1Group:AddDropdown("RetroAbility", {
        Text = "Retro Ability",
        Values = {
            "Rocket Launcher",
            "Ban Hammer",
            "Bomb"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            RetroAbility = Value
        end
    })
    Glove1Group:AddToggle("Spam Retro", {
        Text = "Auto Ability Retro",
        Default = false,
        Callback = function(Value)
            RetroSpam = Value
            while RetroSpam do
                game:GetService("ReplicatedStorage").RetroAbility:FireServer(RetroAbility)
                task.wait()
            end
        end
    })
    Glove1Group:AddDropdown("SlapStickAbility", {
        Text = "SlapStick Ability",
        Values = {
            "runeffect",
            "fullcharged",
            "dash",
            "addarm",
            "charge",
            "cancelrun",
            "discharge"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            SlapstickAbility = Value
        end
    })
    Glove1Group:AddToggle("Spam Slapstick", {
        Text = "Auto Ability Slapstick",
        Default = false,
        Callback = function(Value)
            SlapstickSpam = Value
            if SlapstickSpam == true then
                game:GetService("ReplicatedStorage").slapstick:FireServer("addarm")
            end
            while SlapstickSpam do
                game:GetService("ReplicatedStorage").slapstick:FireServer(SlapstickAbility)
                task.wait()
            end
        end
    })
    Glove1Group:AddInput("Players", {
        Default = "",
        Numeric = false,
        Text = "",
        Finished = true,
        Placeholder = "Username",
        Callback = function(Value)
            if Value == "Me" or Value == "me" or Value == "Username" or Value == "" then
                SaveThePlayer = game.Players.LocalPlayer.Name
            else
                _G.PlayerTarget = Value
                for _, v in pairs(game.Players:GetPlayers()) do
                    if string.sub(v.Name, 1, # _G.PlayerTarget):lower() == _G.PlayerTarget:lower() then
                        PlayerTa = v
                    end
                end
                if PlayerTa then
                    SaveThePlayer = PlayerTa.Name
                    Notification("Found Player [ " .. PlayerTa.Name .. " ]", _G.TimeNotify)
                else
                    Notification("Can't find player", _G.TimeNotify)
                end
            end
        end
    })
    Glove1Group:AddToggle("Godmobe Player", {
        Text = "Auto Godmobe Player",
        Default = false,
        Callback = function(Value)
            if SaveThePlayer == nil then
                SaveThePlayer = game.Players.LocalPlayer.Name
            end
            GuardianAngelSpam = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Guardian Angel" then
                while GuardianAngelSpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Guardian Angel" do
                    game:GetService("ReplicatedStorage").GeneralAbility:FireServer(game.Players[SaveThePlayer])
                    task.wait()
                end
            elseif GuardianAngelSpam == true then
                Notification("You don't have Guardian Angel equipped.", _G.TimeNotify)
                wait(0.05)
                Toggles["Godmobe Player"]:SetValue(false)
            end
        end
    })
    Glove1Group:AddInput("Players", {
        Default = "",
        Numeric = false,
        Text = "",
        Finished = true,
        Placeholder = "Username",
        Callback = function(Value)
            if Value == "Me" or Value == "me" or Value == "Username" or Value == "" then
                Person = game.Players.LocalPlayer.Name
            else
                _G.PlayerTarget = Value
                for _, v in pairs(game.Players:GetPlayers()) do
                    if string.sub(v.Name, 1, # _G.PlayerTarget):lower() == _G.PlayerTarget:lower() then
                        PlayerTa = v
                    end
                end
                if PlayerTa then
                    Person = PlayerTa.Name
                    Notification("Found Player [ " .. PlayerTa.Name .. " ]", _G.TimeNotify)
                else
                    Notification("Can't find player", _G.TimeNotify)
                end
            end
        end
    })
    Glove1Group:AddDropdown("RojoAbility", {
        Text = "Rojo Ability",
        Values = {
            "Normal",
            "Down"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            RojoAbility = Value
        end
    })
    Glove1Group:AddToggle("RojoAbility", {
        Text = "Auto Ability Rojo",
        Default = false,
        Callback = function(Value)
            if Person == nil then
                Person = game.Players.LocalPlayer.Name
            end
            _G.RojoSpam = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Rojo" then
                while _G.RojoSpam do
                    if RojoAbility == "Normal" then
                        game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {
                            game.Players[Person].Character.HumanoidRootPart.CFrame
                        })
                    elseif RojoAbility == "Down" then
                        game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {
                            game.Players[Person].Character.HumanoidRootPart.CFrame * CFrame.Angles(- 1.5, - 9.99999993922529e-09, - 0.5663706660270691)
                        })
                    end
                    task.wait()
                end
            elseif _G.RojoSpam == true then
                Notification("You don't have Rojo equipped.", _G.TimeNotify)
                wait(0.05)
                Toggles.RojoAbility:SetValue(false)
            end
        end
    })
    Glove1Group:AddInput("Players", {
        Default = "",
        Numeric = false,
        Text = "",
        Finished = true,
        Placeholder = "Username",
        Callback = function(Value)
            if Value == "Me" or Value == "me" or Value == "Username" or Value == "" then
                DivebombExplosion = game.Players.LocalPlayer.Name
            else
                _G.PlayerTarget = Value
                for _, v in pairs(game.Players:GetPlayers()) do
                    if string.sub(v.Name, 1, # _G.PlayerTarget):lower() == _G.PlayerTarget:lower() then
                        PlayerTa = v
                    end
                end
                if PlayerTa then
                    DivebombExplosion = PlayerTa.Name
                    Notification("Found Player [ " .. PlayerTa.Name .. " ]", _G.TimeNotify)
                else
                    Notification("Can't find player", _G.TimeNotify)
                end
            end
        end
    })
    Glove1Group:AddSlider("ChargeExplosion", {
        Text = "Charge Explosion",
        Default = 20,
        Min = 20,
        Max = 100,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            _G.ChargeExplosion = Value
        end
    })
    Glove1Group:AddToggle("Ability Divebomb", {
        Text = "Auto Ability Divebomb",
        Default = false,
        Callback = function(Value)
            if DivebombExplosion == nil then
                DivebombExplosion = game.Players.LocalPlayer.Name
            end
            _G.DivebombSpam = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Divebomb" then
                while _G.DivebombSpam do
                    game:GetService("ReplicatedStorage").RocketJump:InvokeServer({
                        ["chargeAlpha"] = 100,
                        ["rocketJump"] = true
                    })
                    game:GetService("ReplicatedStorage").RocketJump:InvokeServer({
                        ["position"] = game.Players[DivebombExplosion].Character.HumanoidRootPart.Position,
                        ["explosion"] = true,
                        ["explosionAlpha"] = _G.ChargeExplosion
                    })
                    task.wait()
                end
            elseif _G.DivebombSpam == true then
                Notification("You don't have Divebomb equipped.", _G.TimeNotify)
                wait(0.05)
                Toggles["Ability Divebomb"]:SetValue(false)
            end
        end
    })
    Glove1Group:AddInput("Players", {
        Default = "",
        Numeric = false,
        Text = "",
        Finished = true,
        Placeholder = "Username",
        Callback = function(Value)
            _G.PlayerTarget = Value
            for _, v in pairs(game.Players:GetPlayers()) do
                if string.sub(v.Name, 1, # _G.PlayerTarget):lower() == _G.PlayerTarget:lower() then
                    PlayerTa = v
                end
            end
            if PlayerTa then
                _G.BarrelPlayer = PlayerTa.Name
                Notification("Found Player [ " .. PlayerTa.Name .. " ]", _G.TimeNotify)
            else
                Notification("Can't find player", _G.TimeNotify)
            end
        end
    })
    Glove1Group:AddToggle("AbilityBarrelPlayer", {
        Text = "Auto Barrel Player",
        Default = false,
        Callback = function(Value)
            _G.BarrelSpamPlayer = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Barrel" then
                while _G.BarrelSpamPlayer do
                    game:GetService("ReplicatedStorage").GeneralAbility:FireServer({
                        ["cf"] = game.Players[_G.BarrelPlayer].Character.HumanoidRootPart.CFrame
                    })
                    task.wait()
                end
            elseif _G.BarrelSpamPlayer == true then
                Notification("You don't have Barrel equipped.", _G.TimeNotify)
                wait(0.05)
                Toggles.AbilityBarrelPlayer:SetValue(false)
            end
        end
    })
    Glove1Group:AddInput("Players", {
        Default = "",
        Numeric = false,
        Text = "",
        Finished = true,
        Placeholder = "Username",
        Callback = function(Value)
            _G.PlayerTarget = Value
            for _, v in pairs(game.Players:GetPlayers()) do
                if string.sub(v.Name, 1, # _G.PlayerTarget):lower() == _G.PlayerTarget:lower() then
                    PlayerTa = v
                end
            end
            if PlayerTa then
                _G.BarrelPlayer = PlayerTa.Name
                Notification("Found Player [ " .. PlayerTa.Name .. " ]", _G.TimeNotify)
            else
                Notification("Can't find player", _G.TimeNotify)
            end
        end
    })
    Glove1Group:AddDropdown("BindAbility", {
        Text = "Bind Ability",
        Values = {
            "Default",
            "Ultimate"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.BindAbility = Value
        end
    })
    Glove1Group:AddToggle("AbilityBindPlayer", {
        Text = "Auto Bind Player",
        Default = false,
        Callback = function(Value)
            _G.BindSpamPlayer = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Bind" then
                while _G.BindSpamPlayer do
                    if _G.BindAbility == "Default" then
                        game:GetService("ReplicatedStorage").GeneralAbility:FireServer("default", {
                            ["goal"] = game.Players[_G.BindPlayer].Character.HumanoidRootPart.CFrame,
                            ["origin"] = game.Players[_G.BindPlayer].Character.Head.CFrame
                        })
                    elseif _G.BindAbility == "Ultimate" then
                        game:GetService("ReplicatedStorage").GeneralAbility:FireServer("ultimate", {
                            ["goal"] = game.Players[_G.BindPlayer].Character.HumanoidRootPart.CFrame * CFrame.Angles(3.141592502593994, 1.0641214847564697, - 3.141592502593994),
                            ["origin"] = game.Players[_G.BindPlayer].Character.HumanoidRootPart.CFrame * CFrame.Angles(3.141592502593994, 1.0641214847564697, - 3.141592502593994)
                        })
                    end
                    task.wait()
                end
            elseif _G.BindSpamPlayer == true then
                Notification("You don't have Bind equipped.", _G.TimeNotify)
                wait(0.05)
                Toggles.AbilityBindPlayer:SetValue(false)
            end
        end
    })
    _G.PlayerChoose = "Username"
    Glove1Group:AddDropdown("PlayerChoose", {
        Text = "Player Choose",
        Values = {
            "Username",
            "Random"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.PlayerChoose = Value
        end
    })
    Glove1Group:AddInput("Players", {
        Default = "",
        Numeric = false,
        Text = "",
        Finished = true,
        Placeholder = "Username",
        Callback = function(Value)
            _G.PlayerTarget = Value
            for _, v in pairs(game.Players:GetPlayers()) do
                if string.sub(v.Name, 1, # _G.PlayerTarget):lower() == _G.PlayerTarget:lower() then
                    PlayerTa = v
                end
            end
            if PlayerTa then
                _G.PlayerButton = PlayerTa.Name
                Notification("Found Player [ " .. PlayerTa.Name .. " ]", _G.TimeNotify)
            else
                Notification("Can't find player", _G.TimeNotify)
            end
        end
    })
    Glove1Group:AddButton("Player Void", function()
        if _G.PlayerChoose == "Username" then
            if game.Players.LocalPlayer.Character:FindFirstChild("Swapper") or game.Players.LocalPlayer.Backpack:FindFirstChild("Swapper") then
                OGL = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                task.wait(0.25)
                repeat
                    task.wait()
                    if workspace[_G.PlayerButton]:FindFirstChild("HumanoidRootPart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace[_G.PlayerButton].HumanoidRootPart.Position.X, - 70, workspace[_G.PlayerButton].HumanoidRootPart.Position.Z)
                        task.wait(0.37)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                    end
                until game.Players[_G.PlayerButton].Character and workspace[_G.PlayerButton]:FindFirstChild("HumanoidRootPart") and workspace[_G.PlayerButton]:FindFirstChild("entered") and workspace[_G.PlayerButton].Ragdolled.Value == false
                task.wait(0.6)
                game:GetService("ReplicatedStorage").SLOC:FireServer()
                wait(.25)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                task.wait(0.05)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OGL
            else
                Notification("You don't have Swapper equipped, or you aren't in the arena.", _G.TimeNotify)
            end
        elseif _G.PlayerChoose == "Random" then
            if game.Players.LocalPlayer.Character:FindFirstChild("Swapper") or game.Players.LocalPlayer.Backpack:FindFirstChild("Swapper") then
                OGL = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                local players = game.Players:GetChildren()
                local RandomPlayer = players[math.random(1, # players)]
                repeat
                    RandomPlayer = players[math.random(1, # players)]
                until RandomPlayer ~= game.Players.LocalPlayer and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("Ragdolled").Value == false
                Target = RandomPlayer
                repeat
                    task.wait()
                    if Target.Character:FindFirstChild("HumanoidRootPart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Target.Character.HumanoidRootPart.Position.X, - 70, Target.Character.HumanoidRootPart.Position.Z)
                        task.wait(0.37)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                    end
                until Target.Character and Target.Character:FindFirstChild("HumanoidRootPart") and Target.Character:FindFirstChild("entered") and Target.Character:FindFirstChild("Ragdolled").Value == false
                task.wait(0.6)
                game:GetService("ReplicatedStorage").SLOC:FireServer()
                wait(.25)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                task.wait(0.05)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OGL
            else
                Notification("You don't have Swapper equipped, or you aren't in the arena.", _G.TimeNotify)
            end
        end
    end)
    Glove1Group:AddButton("HomeRun Player", function()
        if _G.PlayerChoose == "Username" then
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Home Run" and game.Players[_G.PlayerButton].Character:FindFirstChild("entered") then
                OGL = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                OGLZ = game.Players[_G.PlayerButton].Character.HumanoidRootPart.Size
                game.Players[_G.PlayerButton].Character.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                game:GetService("ReplicatedStorage").HomeRun:FireServer({
                    ["start"] = true
                })
                wait(4.2)
                game:GetService("ReplicatedStorage").HomeRun:FireServer({
                    ["finished"] = true
                })
                task.wait(0.12)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerButton].Character.HumanoidRootPart.CFrame
                task.wait(0.25)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OGL
                game.Players[_G.PlayerButton].Character.HumanoidRootPart.Size = OGLZ
            else
                Notification("You don't have Home Run equipped", _G.TimeNotify)
            end
        elseif _G.PlayerChoose == "Random" then
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Home Run" then
                OGL = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                game:GetService("ReplicatedStorage").HomeRun:FireServer({
                    ["start"] = true
                })
                wait(4.2)
                local players = game.Players:GetChildren()
                local RandomPlayer = players[math.random(1, # players)]
                repeat
                    RandomPlayer = players[math.random(1, # players)]
                until RandomPlayer ~= game.Players.LocalPlayer and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoReverseCard") == nil
                Target = RandomPlayer
                OGLZ = Target.Character.HumanoidRootPart.Size
                Target.Character.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                wait(0.25)
                game:GetService("ReplicatedStorage").HomeRun:FireServer({
                    ["finished"] = true
                })
                task.wait(0.12)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
                task.wait(0.25)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OGL
                Target.Character.HumanoidRootPart.Size = OGLZ
            else
                Notification("You don't have Home Run equipped", _G.TimeNotify)
            end
        end
    end)
    Glove1Group:AddButton("Hive Player", function()
        if _G.PlayerChoose == "Username" then
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Hive" and game.Players[_G.PlayerButton].Character:FindFirstChild("entered") then
                OGL = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                OGLZ = game.Players[_G.PlayerButton].Character.HumanoidRootPart.Size
                game.Players[_G.PlayerButton].Character.HumanoidRootPart.Size = Vector3.new(20, 20, 20)
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait(4.2)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerButton].Character.HumanoidRootPart.CFrame
                wait(0.25)
                game:GetService("ReplicatedStorage"):WaitForChild("GeneralHit"):FireServer(game.Players[_G.PlayerButton].Character:WaitForChild("HumanoidRootPart"))
                wait(0.25)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OGL
                game.Players[_G.PlayerButton].Character.HumanoidRootPart.Size = OGLZ
            else
                Notification("You don't have Hive equipped", _G.TimeNotify)
            end
        elseif _G.PlayerChoose == "Random" then
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Hive" then
                OGL = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait(4.32)
                local players = game.Players:GetChildren()
                local RandomPlayer = players[math.random(1, # players)]
                repeat
                    RandomPlayer = players[math.random(1, # players)]
                until RandomPlayer ~= game.Players.LocalPlayer and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoReverseCard") == nil
                Target = RandomPlayer
                OGLZ = Target.Character.HumanoidRootPart.Size
                Target.Character.HumanoidRootPart.Size = Vector3.new(20, 20, 20)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
                wait(0.25)
                game:GetService("ReplicatedStorage"):WaitForChild("GeneralHit"):FireServer(Target.Character:WaitForChild("HumanoidRootPart"))
                wait(0.22)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OGL
                Target.Character.HumanoidRootPart.Size = OGLZ
            else
                Notification("You don't have Hive equipped", _G.TimeNotify)
            end
        end
    end)
    Glove1Group:AddButton("Quake Player", function()
        if _G.PlayerChoose == "Username" then
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Quake" and game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players[_G.PlayerButton].Character:FindFirstChild("entered") then
                game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Quake)
                OGL = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                game:GetService("ReplicatedStorage"):WaitForChild("QuakeQuake"):FireServer({
                    ["start"] = true
                })
                wait(3.45)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerButton].Character:FindFirstChild("Head").CFrame * CFrame.new(0, 4, 0)
                task.wait(0.18)
                game:GetService("ReplicatedStorage"):WaitForChild("QuakeQuake"):FireServer({
                    ["finished"] = true
                })
                task.wait(0.17)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OGL
                game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
            else
                Notification("You don't have Quake equipped.", _G.TimeNotify)
            end
        elseif _G.PlayerChoose == "Random" then
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Quake" and game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Quake)
                OGL = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                game:GetService("ReplicatedStorage"):WaitForChild("QuakeQuake"):FireServer({
                    ["start"] = true
                })
                wait(4)
                local players = game.Players:GetChildren()
                local RandomPlayer = players[math.random(1, # players)]
                repeat
                    RandomPlayer = players[math.random(1, # players)]
                until RandomPlayer ~= game.Players.LocalPlayer and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoReverseCard") == nil and RandomPlayer.Character:FindFirstChild("entered")
                Target = RandomPlayer
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character:FindFirstChild("Head").CFrame * CFrame.new(0, 4, 0)
                task.wait(0.13)
                game:GetService("ReplicatedStorage"):WaitForChild("QuakeQuake"):FireServer({
                    ["finished"] = true
                })
                task.wait(0.17)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OGL
                game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
            else
                Notification("You don't have Quake equipped.", _G.TimeNotify)
            end
        end
    end)
    Glove1Group:AddButton("Cards Player", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Jester" then
            if _G.PlayerChoose == "Username" then
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer("Ability3", game.Players[_G.PlayerButton])
            elseif _G.PlayerChoose == "Random" then
                local players = game.Players:GetChildren()
                local RandomPlayer = players[math.random(1, # players)]
                repeat
                    RandomPlayer = players[math.random(1, # players)]
                until RandomPlayer ~= game.Players.LocalPlayer and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoReverseCard") == nil and RandomPlayer.Character:FindFirstChild("entered")
                Target = RandomPlayer
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer("Ability3", Target)
            end
        else
            Notification("You don't have Jester glove equipped", _G.TimeNotify)
        end
    end)
    Glove1Group:AddDropdown("Teleport Old Place", {
        Text = "Teleport Old Place",
        Values = {
            "Yes",
            "No",
            "Player"
        },
        Default = "Yes",
        Multi = false,
        Callback = function(Value)
            _G.TeleportOldPlace = Value
        end
    })
    Glove1Group:AddButton("Player Teleport Recall", function()
        if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.leaderstats.Glove.Value == "Recall" then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Recall") then
                game.Players.LocalPlayer.Backpack:FindFirstChild("Recall")
                Parent = game.Players.LocalPlayer.Character
            end
            wait(0.3)
            if _G.TeleportOldPlace == "Yes" then
                OLG = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
            game:GetService("ReplicatedStorage").Recall:InvokeServer(game:GetService("Players").LocalPlayer.Character.Recall)
            wait(2.2)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerButton].Character.Head.CFrame
            task.wait(0.5)
            if _G.TeleportOldPlace == "Yes" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OLG
            elseif _G.TeleportOldPlace == "Player" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerButton].Character.HumanoidRootPart.CFrame
            end
        else
            Notification("You don't have Recall equipped or you haven't in arena.", _G.TimeNotify)
        end
    end)
    Glove1Group:AddButton("Grab Player Teleport", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Grab" and game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players[_G.PlayerButton].Character:FindFirstChild("entered") then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Grab") then
                game.Players.LocalPlayer.Backpack:FindFirstChild("Grab").Parent = game.Players.LocalPlayer.Character
            end
            wait(0.36)
            if _G.TeleportOldPlace == "Yes" then
                OLG = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerButton].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
            wait(0.2)
            game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
            wait(0.15)
            if _G.TeleportOldPlace == "Yes" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OLG
            end
            wait(0.37)
            if game.Players.LocalPlayer.Character:FindFirstChild("Grab") then
                game.Players.LocalPlayer.Character:FindFirstChild("Grab").Parent = game.Players.LocalPlayer.Backpack
            end
        else
            Notification("You don't have Grab equipped, or you have to go Arena, or player go to Arena", _G.TimeNotify)
        end
    end)
    Glove1Group:AddToggle("Auto Oven Player", {
        Text = "Auto Oven Player",
        Default = false,
        Callback = function(Value)
            _G.OvenPlayerAuto = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Oven" then
                while _G.OvenPlayerAuto do
                    if _G.PlayerChoose == "Username" then
                        if not game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "'s Oven") then
                            game:GetService("ReplicatedStorage").GeneralAbility:FireServer(game.Players[_G.PlayerButton].Character.HumanoidRootPart.CFrame)
                        end
                    elseif _G.PlayerChoose == "Random" then
                        local players = game.Players:GetChildren()
                        local RandomPlayer = players[math.random(1, # players)]
                        repeat
                            RandomPlayer = players[math.random(1, # players)]
                        until RandomPlayer ~= game.Players.LocalPlayer and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoReverseCard") == nil and RandomPlayer.Character:FindFirstChild("entered")
                        Target = RandomPlayer
                        if not game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "'s Oven") then
                            game:GetService("ReplicatedStorage").GeneralAbility:FireServer(Target.Character.HumanoidRootPart.CFrame)
                        end
                    end
                    task.wait()
                end
            elseif _G.OvenPlayerAuto == true then
                Notification("You don't have Oven equipped.", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Oven Player"]:SetValue(false)
            end
        end
    })
    Glove1Group:AddToggle("Auto Siphon Player", {
        Text = "Auto Siphon Player",
        Default = false,
        Callback = function(Value)
            _G.AutoSiphonPlayer = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Siphon" then
                while _G.AutoSiphonPlayer do
                    if _G.PlayerChoose == "Username" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players[_G.PlayerButton].Character:FindFirstChild("entered") then
                            game:GetService("ReplicatedStorage").Events.Siphon:FireServer({
                                ["cf"] = game.Players[_G.PlayerButton].Character.HumanoidRootPart.CFrame
                            })
                        end
                    elseif _G.PlayerChoose == "Random" then
                        local players = game.Players:GetChildren()
                        local RandomPlayer = players[math.random(1, # players)]
                        if RandomPlayer ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and RandomPlayer.Character then
                            if RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("HumanoidRootPart") and RandomPlayer.Character:FindFirstChild("stevebody") == nil and RandomPlayer.Character:FindFirstChild("rock") == nil then
                                game:GetService("ReplicatedStorage").Events.Siphon:FireServer({
                                    ["cf"] = RandomPlayer.Character.HumanoidRootPart.CFrame
                                })
                            end
                        end
                    end
                    task.wait()
                end
            elseif _G.AutoSiphonPlayer == true then
                Notification("You don't have Siphon equipped.", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Siphon Player"]:SetValue(false)
            end
        end
    })
    Glove1Group:AddToggle("Auto Sbeve All Player", {
        Text = "Auto Sbeve All Player",
        Default = false,
        Callback = function(Value)
            _G.AutoSbeveAllPlayer = Value
            while _G.AutoSbeveAllPlayer do
                if game.Players.LocalPlayer.leaderstats.Glove.Value == "Sbeve" or game.Players.LocalPlayer.Character:FindFirstChild("stevebody") then
                    for i, v in pairs(game.Players:GetChildren()) do
                        if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
                            if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.Ragdolled.Value == false then
                                v.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.stevebody.CFrame * CFrame.new(0, 3.75, 0)
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    })
    Glove1Group:AddButton("Sbeve All Player", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Sbeve" or game.Players.LocalPlayer.Character:FindFirstChild("stevebody") then
            for i, v in pairs(game.Players:GetChildren()) do
                if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
                    if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.Ragdolled.Value == false then
                        v.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.stevebody.CFrame
                    end
                end
            end
        elseif game.Players.LocalPlayer.Character:FindFirstChild("stevebody") == nil then
            for i, v in pairs(game.Players:GetChildren()) do
                if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
                    if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") then
                        v.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        end
    end)
    Glove1Group:AddButton("Bring All Player", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Lawnmower" then
            game:GetService("ReplicatedStorage").GeneralAbility:FireServer("lawnmower")
            for i, v in pairs(game.Players:GetChildren()) do
                if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
                    if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.Ragdolled.Value == false then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                        wait(0.2)
                    end
                end
            end
        else
            Notification("You don't have Lawnmower equipped.", _G.TimeNotify)
        end
    end)
    Glove1Group:AddDropdown("Black Hole", {
        Text = "Black Hole",
        Values = {
            "Normal",
            "Teleport Cannon Island"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.BlackHoleCre = Value
        end
    })
    Glove1Group:AddButton("Auto Create Black Hole", function()
        if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2125950512) and game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2147429609) then
            if _G.BlackHoleCre == "Normal" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0, 30, 0)
                wait(0.1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                wait(0.05)
                fireclickdetector(workspace.Lobby["rob"].ClickDetector)
                wait(0.3)
                game:GetService("ReplicatedStorage").rob:FireServer()
                wait(4.8)
                fireclickdetector(workspace.Lobby["bob"].ClickDetector)
                task.wait(0.08)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                wait(0.3)
                game:GetService("ReplicatedStorage").bob:FireServer()
                wait(0.5)
                for i = 1, 26 do
                    for _, v in pairs(workspace:GetChildren()) do
                        if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        end
                    end
                end
            elseif _G.BlackHoleCre == "Teleport Cannon Island" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0, 30, 0)
                wait(0.1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                wait(0.05)
                fireclickdetector(workspace.Lobby["rob"].ClickDetector)
                wait(0.3)
                game:GetService("ReplicatedStorage").rob:FireServer()
                wait(4.8)
                fireclickdetector(workspace.Lobby["bob"].ClickDetector)
                task.wait(0.08)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                wait(0.3)
                game:GetService("ReplicatedStorage").bob:FireServer()
                wait(0.5)
                for i = 1, 26 do
                    for _, v in pairs(workspace:GetChildren()) do
                        if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        end
                    end
                end
                wait(0.5)
                repeat
                    task.wait()
                until game.Players.LocalPlayer.Character
                if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    repeat
                        task.wait()
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                    until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                end
                wait(0.27)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(227, 48, 169)
                wait(0.25)
                for i, v in ipairs(game.Workspace.Arena.CannonIsland:GetDescendants()) do
                    if v.ClassName == "ProximityPrompt" then
                        fireproximityprompt(v)
                    end
                end
            end
        else
            Notification("You have in lobby, or You don't have badge bob, or badge rob.", _G.TimeNotify)
        end
    end)
    Glove1Group:AddButton("Auto Enter Map Null", function()
        if game.Workspace:FindFirstChild("Blackhole_Particles") == nil then
            Notification("When will someone create a black hole [ BOB + ROB ].", _G.TimeNotify)
        elseif game.Players.LocalPlayer.Character:FindFirstChild("entered") ~= nil and game.Players.LocalPlayer.leaderstats.Glove.Value ~= "Default" then
            game:GetService("Players").LocalPlayer.Reset:FireServer()
            wait(3.75)
            fireclickdetector(workspace.Lobby.Default.ClickDetector)
            wait(0.5)
            repeat
                task.wait()
            until game.Players.LocalPlayer.Character
            if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                repeat
                    task.wait()
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                until game.Players.LocalPlayer.Character:FindFirstChild("entered")
            end
            wait(0.5)
            repeat
                task.wait()
                if game.Workspace:FindFirstChild("Blackhole_Particles") and game.Workspace.Blackhole_Particles:FindFirstChild("BlackHole") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Blackhole_Particles.BlackHole.CFrame
                end
            until game.Players.LocalPlayer.Character.Humanoid.Health == 0
        elseif game.Players.LocalPlayer.Character:FindFirstChild("entered") ~= nil and game.Players.LocalPlayer.leaderstats.Glove.Value == "Default" then
            repeat
                task.wait()
                if game.Workspace:FindFirstChild("Blackhole_Particles") and game.Workspace.Blackhole_Particles:FindFirstChild("BlackHole") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Blackhole_Particles.BlackHole.CFrame
                end
            until game.Players.LocalPlayer.Character.Humanoid.Health == 0
        elseif game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.leaderstats.Glove.Value == "Default" then
            repeat
                task.wait()
            until game.Players.LocalPlayer.Character
            if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                repeat
                    task.wait()
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                until game.Players.LocalPlayer.Character:FindFirstChild("entered")
            end
            wait(0.5)
            repeat
                task.wait()
                if game.Workspace:FindFirstChild("Blackhole_Particles") and game.Workspace.Blackhole_Particles:FindFirstChild("BlackHole") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Blackhole_Particles.BlackHole.CFrame
                end
            until game.Players.LocalPlayer.Character.Humanoid.Health == 0
        elseif game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.leaderstats.Glove.Value ~= "Default" then
            fireclickdetector(workspace.Lobby.Default.ClickDetector)
            wait(0.07)
            repeat
                task.wait()
            until game.Players.LocalPlayer.Character
            if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                repeat
                    task.wait()
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                until game.Players.LocalPlayer.Character:FindFirstChild("entered")
            end
            wait(0.05)
            repeat
                task.wait()
                if game.Workspace:FindFirstChild("Blackhole_Particles") and game.Workspace.Blackhole_Particles:FindFirstChild("BlackHole") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Blackhole_Particles.BlackHole.CFrame
                end
            until game.Players.LocalPlayer.Character.Humanoid.Health == 0
        end
    end)
    Glove1Group:AddButton("Auto Enter Cannon", function()
        if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
            repeat
                task.wait()
            until game.Players.LocalPlayer.Character
            if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                repeat
                    task.wait()
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                until game.Players.LocalPlayer.Character:FindFirstChild("entered")
            end
            wait(0.2)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(227, 48, 169)
            wait(0.25)
            for i, v in ipairs(game.Workspace.Arena.CannonIsland:GetDescendants()) do
                if v.ClassName == "ProximityPrompt" then
                    fireproximityprompt(v)
                end
            end
        elseif game.Players.LocalPlayer.Character:FindFirstChild("entered") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(227, 48, 169)
            wait(0.25)
            for i, v in ipairs(game.Workspace.Arena.CannonIsland:GetDescendants()) do
                if v.ClassName == "ProximityPrompt" then
                    fireproximityprompt(v)
                end
            end
        end
    end)
    local Glove2Group = Tabs.Tab6:AddRightGroupbox("Misc Glove")
    Glove2Group:AddButton("Spawn Orb Siphon", function()
        if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.leaderstats.Glove.Value == "Siphon" then
            repeat
                task.wait()
                game:GetService("ReplicatedStorage").Events.Siphon:FireServer({
                    ["cf"] = game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].Part.CFrame
                })
            until game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"]:FindFirstChild("siphon_charge")
            repeat
                task.wait()
                if game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"]:FindFirstChild("siphon_charge") then
                    game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            until game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"]:FindFirstChild("siphon_charge") == nil
        else
            Notification("You don't have Siphon equipped or you haven't in arena.", _G.TimeNotify)
        end
    end)
    Glove2Group:AddButton("Ability Lure Safe", function()
        if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.leaderstats.Glove.Value == "Lure" then
            OldTP = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.CannonIsland.Cannon.Base.CFrame * CFrame.new(0, 0, 35)
            task.wait(0.2)
            game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
            task.wait(0.15)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldTP
        else
            Notification("You don't have Lure equipped or you haven't in arena.", _G.TimeNotify)
        end
    end)
    Glove2Group:AddToggle("Auto Collect Ingredients", {
        Text = "Auto Collect Ingredients",
        Default = false,
        Callback = function(Value)
            _G.AutoPickupIngredients = Value
            while _G.AutoPickupIngredients do
                if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" and game.Workspace:FindFirstChild("Alchemist_Ingredients_") then
                    for i, v in pairs(game.Workspace:FindFirstChild("Alchemist_Ingredients_"):GetChildren()) do
                        if v:IsA("Model") and v:FindFirstChild("Clickbox") and v.Clickbox:FindFirstChild("ClickDetector") then
                            v.Clickbox.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                end
                task.wait()
            end
        end
    })
    Glove2Group:AddToggle("Auto Collect Pillow", {
        Text = "Auto Collect Pillow",
        Default = false,
        Callback = function(Value)
            _G.AutoCollectPillow = Value
            while _G.AutoCollectPillow do
                if game.Players.LocalPlayer.leaderstats.Glove.Value == "Pillow" and game.Workspace:FindFirstChild("pillows_") then
                    for i, v in pairs(game.Workspace:FindFirstChild("pillows_"):GetChildren()) do
                        if v.Name == "pillow_model" and v:FindFirstChild("Clickbox") and v.Clickbox:FindFirstChild("ClickDetector") then
                            v.Clickbox.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                end
                task.wait()
            end
        end
    })
    Glove2Group:AddToggle("Infinity Pillow", {
        Text = "Infinity Pillow",
        Default = false,
        Callback = function(Value)
            _G.InfinityPillow = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Pillow" then
                while _G.InfinityPillow do
                    game:GetService("ReplicatedStorage").Events.PillowEvent:FireServer("AddPillow")
                    task.wait()
                end
            elseif _G.InfinityPillow == true then
                Notification("You don't have Pillow equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Infinity Pillow"]:SetValue(false)
            end
        end
    })
    Glove2Group:AddToggle("Infinite Ingredients", {
        Text = "Infinite Ingredients",
        Default = false,
        Callback = function(Value)
            _G.InfiniteIngredients = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
                while _G.InfiniteIngredients do
                    if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Mushroom")
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Glowing Mushroom")
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Fire Flower")
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Winter Rose")
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Dark Root")
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Dire Flower")
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Autumn Sprout")
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Elder Wood")
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Hazel Lily")
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Wild Vine")
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Jade Stone")
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Lamp Grass")
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Plane Flower")
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Blood Rose")
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Red Crystal")
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Blue Crystal")
                        game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Cake Mix")
                    end
                    task.wait()
                end
            elseif _G.InfiniteIngredients == true then
                Toggles["Infinite Ingredients"]:SetValue(false)
                wait(0.05)
                Notification("You don't have Alchemist equipped", _G.TimeNotify)
            end
        end
    })
    Glove2Group:AddDropdown("Potion", {
        Text = "Potion",
        Values = {
            "Grug",
            "Nightmare",
            "Confusion",
            "Power",
            "Paralyzing",
            "Haste",
            "Invisibility",
            "Explosion",
            "Invincible",
            "Toxic",
            "Freeze",
            "Feather",
            "Speed",
            "Lethal",
            "Slow",
            "Antitoxin",
            "Corrupted Vine",
            "Field",
            "Lost"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.MakePotion = Value
        end
    })
    Glove2Group:AddSlider("Potion1", {
        Text = "Potion",
        Default = 1,
        Min = 1,
        Max = 100,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            _G.PotionNumber = Value
        end
    })
    Glove2Group:AddDropdown("Potion2", {
        Text = "Potion",
        Values = {
            "Number",
            "Normal"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.Potion2 = Value
        end
    })
    Glove2Group:AddButton("Get Potions", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
            if not game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "'s Cauldron") then
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
            end
            if _G.Potion2 == "Normal" then
                for i = 1, # _G.GetPotion[_G.MakePotion] do
                    game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("AddItem", _G.GetPotion[_G.MakePotion][i])
                    game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("MixItem", _G.GetPotion[_G.MakePotion][i])
                    task.wait()
                end
                game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
            elseif _G.Potion2 == "Number" then
                for a = 1, _G.PotionNumber do
                    for i = 1, # _G.GetPotion[_G.MakePotion] do
                        game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("AddItem", _G.GetPotion[_G.MakePotion][i])
                        game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("MixItem", _G.GetPotion[_G.MakePotion][i])
                    end
                    game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
                end
            end
        else
            Notification("You don't have Alchemist equipped", _G.TimeNotify)
        end
    end)
    Glove2Group:AddToggle("Auto Get Potion", {
        Text = "Auto Get Potion",
        Default = false,
        Callback = function(Value)
            _G.AutoMakePotion = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
                while _G.AutoMakePotion do
                    if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
                        if not game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "'s Cauldron") then
                            game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                        end
                        for i = 1, # _G.GetPotion[_G.MakePotion] do
                            game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("AddItem", _G.GetPotion[_G.MakePotion][i])
                            game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("MixItem", _G.GetPotion[_G.MakePotion][i])
                        end
                        game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
                    end
                    task.wait(0.01)
                end
            elseif _G.AutoMakePotion == true then
                Toggles["Auto Get Potion"]:SetValue(false)
                wait(0.05)
                Notification("You don't have Alchemist equipped", _G.TimeNotify)
            end
        end
    })
    Glove2Group:AddInput("Players", {
        Default = "",
        Numeric = false,
        Text = "",
        Finished = true,
        Placeholder = "Username",
        Callback = function(Value)
            _G.PlayerTarget = Value
            for _, v in pairs(game.Players:GetPlayers()) do
                if string.sub(v.Name, 1, # _G.PlayerTarget):lower() == _G.PlayerTarget:lower() then
                    PlayerTa = v
                end
            end
            if PlayerTa then
                _G.PlayerButton2 = PlayerTa.Name
                Notification("Found Player [ " .. PlayerTa.Name .. " ]", _G.TimeNotify)
            else
                Notification("Can't find player", _G.TimeNotify)
            end
        end
    })
    Glove2Group:AddInput("SpeedOrbit", {
        Default = "20",
        Numeric = false,
        Text = "Speed",
        Placeholder = "UserSpeed",
        Callback = function(Value)
            if Value == "inf" or Value == "Inf" or Value == "infinity" or Value == "Infinity" then
                OrbitSpeed = 9e9
            else
                OrbitSpeed = Value
            end
        end
    })
    Glove2Group:AddSlider("Extend", {
        Text = "Extend Ability",
        Default = 0,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            _G.ExtendPingPong = Value
        end
    })
    Glove2Group:AddDropdown("Clone", {
        Text = "Clone",
        Values = {
            "Orbit",
            "Orbit Player"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.Clone = Value
        end
    })
    Glove2Group:AddToggle("Auto Clone", {
        Text = "Auto Clone",
        Default = false,
        Callback = function(Value)
            _G.CloneAuto = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Cherry" or game.Players.LocalPlayer.leaderstats.Glove.Value == "Replica" then
                while _G.CloneAuto do
                    if game.Players.LocalPlayer.leaderstats.Glove.Value == "Cherry" then
                        if workspace:FindFirstChild("cherry_storage") then
                            for i, v in pairs(workspace.cherry_storage:GetChildren()) do
                                if v.Name == ("Cherry " .. game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("clone_remote") then
                                    v.clone_remote:FireServer()
                                    if _G.Clone == "Orbit" then
                                        v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(math.cos(tick() * OrbitSpeed + (i - 1) * math.pi / 2) * _G.ExtendPingPong, 0, math.sin(tick() * OrbitSpeed + (i - 1) * math.pi / 2) * _G.ExtendPingPong)
                                    elseif _G.Clone == "Orbit Player" then
                                        v.HumanoidRootPart.CFrame = game.Players[_G.PlayerButton2].Character.HumanoidRootPart.CFrame * CFrame.new(math.cos(tick() * OrbitSpeed + (i - 1) * math.pi / 2) * _G.ExtendPingPong, 0, math.sin(tick() * OrbitSpeed + (i - 1) * math.pi / 2) * _G.ExtendPingPong)
                                    end
                                end
                            end
                        end
                    elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Replica" then
                        for i, v in pairs(game.Workspace:GetChildren()) do
                            if v.Name == ("Å" .. game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
                                if _G.Clone == "Orbit" then
                                    v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(math.cos(tick() * OrbitSpeed + (i - 1) * math.pi / 2) * _G.ExtendPingPong, 0, math.sin(tick() * OrbitSpeed + (i - 1) * math.pi / 2) * _G.ExtendPingPong)
                                elseif _G.Clone == "Orbit Player" then
                                    v.HumanoidRootPart.CFrame = game.Players[_G.PlayerButton2].Character.HumanoidRootPart.CFrame * CFrame.new(math.cos(tick() * OrbitSpeed + (i - 1) * math.pi / 2) * _G.ExtendPingPong, 0, math.sin(tick() * OrbitSpeed + (i - 1) * math.pi / 2) * _G.ExtendPingPong)
                                end
                            end
                        end
                    end
                    task.wait()
                end
            elseif _G.CloneAuto == true then
                Notification("You don't have Cherry or Replica equipped", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Clone"]:SetValue(false)
            end
        end
    })
    Glove2Group:AddDropdown("Ping Pong Choose", {
        Text = "Ping Pong",
        Values = {
            "Fling",
            "Fling Player",
            "Orbit",
            "Orbit Player",
            "Nuke"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            _G.PingPongServer = Value
        end
    })
    Glove2Group:AddToggle("PingPong", {
        Text = "Ping Pong",
        Default = false,
        Callback = function(Value)
            _G.PingPongServerBr = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Ping Pong" then
                PingPongBall = game.Players.LocalPlayer.Name .. "_PingPongBall"
                if _G.PingPongServer == "Orbit" then
                    Orbit = "0"
                    if OrbitSpeed == nil then
                        OrbitSpeed = 1
                    end
                    game.Players.LocalPlayer.Character.Torso.RadioPart.Rotation = game.Players.LocalPlayer.Character.HumanoidRootPart.Rotation
                end
                while _G.PingPongServerBr do
                    if _G.PingPongServer == "Orbit" then
                        game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                        Orbit = Orbit + OrbitSpeed
                        game.Players.LocalPlayer.Character.Torso.RadioPart.Rotation = Vector3.new(- 180, Orbit, - 180)
                        if game.Players.LocalPlayer.Character.Torso.RadioPart:GetChildren()[2] then
                            for i, v in pairs(game.Workspace:GetChildren()) do
                                if v.ClassName == "Part" and v.Name == PingPongBall then
                                    v.CFrame = game.Players.LocalPlayer.Character.Torso.RadioPart.CFrame * CFrame.new(0, 0, - _G.ExtendPingPong) * CFrame.Angles(math.rad(0), math.rad(- 90), math.rad(0))
                                end
                            end
                            for i, v in pairs(game.Players.LocalPlayer.Character.Torso.RadioPart:GetChildren()) do
                                if v.ClassName == "Part" and v.Name == PingPongBall then
                                    v.CFrame = game.Players.LocalPlayer.Character.Torso.RadioPart.CFrame * CFrame.new(0, 0, _G.ExtendPingPong) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0))
                                end
                            end
                        elseif game.Players.LocalPlayer.Character.Torso.RadioPart:GetChildren()[1] or game.Players.LocalPlayer.Character.Torso.RadioPart:GetChildren()[2] then
                            for i, v in pairs(game.Workspace:GetChildren()) do
                                if v.ClassName == "Part" and v.Name == PingPongBall then
                                    v.Parent = game.Players.LocalPlayer.Character.Torso.RadioPart
                                    break
                                end
                            end
                        end
                    elseif _G.PingPongServer == "Orbit Player" then
                        game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                        if game.Players[_G.PlayerButton2].Character and game.Players[_G.PlayerButton2].Character:WaitForChild("Ragdolled").Value == false then
                            for i, v in pairs(game.Workspace:GetChildren()) do
                                if v.Name == (game.Players.LocalPlayer.Name .. "_PingPongBall") then
                                    v.CFrame = game.Players[_G.PlayerButton2].Character.HumanoidRootPart.CFrame * CFrame.new(math.cos(tick() * OrbitSpeed + (i - 1) * math.pi / 2) * _G.ExtendPingPong, 0, math.sin(tick() * OrbitSpeed + (i - 1) * math.pi / 2) * _G.ExtendPingPong)
                                end
                            end
                        end
                    elseif _G.PingPongServer == "Fling" then
                        game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                        for i, v in pairs(game.Players:GetPlayers()) do
                            if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
                                if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character.Ragdolled.Value == false and v.Character:FindFirstChild("Mirage") == nil then
                                    for i, a in pairs(game.Workspace:GetChildren()) do
                                        if a.Name == (game.Players.LocalPlayer.Name .. "_PingPongBall") then
                                            a.CFrame = v.Character.HumanoidRootPart.CFrame
                                        end
                                    end
                                end
                            end
                        end
                    elseif _G.PingPongServer == "Fling Player" then
                        game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                        if game.Players[_G.PlayerButton2].Character and game.Players[_G.PlayerButton2].Character:WaitForChild("Ragdolled").Value == false then
                            for i, v in pairs(game.Workspace:GetChildren()) do
                                if v.Name == (game.Players.LocalPlayer.Name .. "_PingPongBall") then
                                    v.CFrame = game.Players[_G.PlayerButton2].Character.HumanoidRootPart.CFrame
                                end
                            end
                        end
                    elseif _G.PingPongServer == "Nuke" then
                        for i, v in pairs(game.Workspace:GetChildren()) do
                            if v.Name == (game.Players.LocalPlayer.Name .. "_PingPongBall") then
                                v.CFrame = game.workspace.Origo.CFrame * CFrame.new(math.random(- _G.ExtendPingPong, _G.ExtendPingPong), - 5, math.random(- _G.ExtendPingPong, _G.ExtendPingPong))
                            end
                        end
                    end
                    task.wait(0.01)
                end
            elseif Value == true then
                Notification("You don't have Ping Pong equipped.", _G.TimeNotify)
                wait(0.05)
                Toggles["PingPong"]:SetValue(false)
            end
        end
    })
    Glove2Group:AddSlider("ExtendRob", {
        Text = "Extend HitBox Rob",
        Default = 16,
        Min = 16,
        Max = 400,
        Rounding = 1,
        Compact = true,
        Callback = function(Value)
            _G.ExtendHitboxRob = Value
        end
    })
    Glove2Group:AddDropdown("Hitbox Rob", {
        Text = "Hitbox Rob",
        Values = {
            "You",
            "All"
        },
        Default = "All",
        Multi = false,
        Callback = function(Value)
            _G.RobHitbox = Value
        end
    })
    Glove2Group:AddToggle("Hitbox Rob", {
        Text = "Hitbox All Rob & Color",
        Default = false,
        Callback = function(Value)
            _G.HitboxRob = Value
            while _G.HitboxRob do
                if _G.RobHitbox == "All" then
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "Field" then
                            v.Size = Vector3.new(_G.ExtendHitboxRob, _G.ExtendHitboxRob, _G.ExtendHitboxRob)
                            v.BrickColor = BrickColor.new(_G.ColorHitboxRob)
                        end
                    end
                elseif _G.RobHitbox == "You" then
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "Field" and 0 >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude then
                            v.Size = Vector3.new(_G.ExtendHitboxRob, _G.ExtendHitboxRob, _G.ExtendHitboxRob)
                            v.BrickColor = BrickColor.new(_G.ColorHitboxRob)
                        end
                    end
                end
                task.wait()
            end
            if _G.HitboxRob == false then
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Field" then
                        v.Size = Vector3.new(16, 16, 16)
                        v.BrickColor = BrickColor.new(255, 255, 255)
                    end
                end
            end
        end
    }):AddColorPicker("Color Hitbox Rob", {
        Default = Color3.new(255, 255, 255),
        Callback = function(Value)
            _G.ColorHitboxRob = Value
        end
    })
    _G.SetSpeedFlyCloud = 2
    Glove2Group:AddInput("FlySpeed", {
        Default = "2",
        Numeric = true,
        Text = "Fly Speed Cloud",
        Placeholder = "UserFlySpeed",
        Callback = function(Value)
            _G.SetSpeedFlyCloud = Value
        end
    })
    Glove2Group:AddToggle("Cloud Speed", {
        Text = "Cloud Speed",
        Default = false,
        Callback = function(Value)
            _G.CloudSpeed = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Cloud" then
                while _G.CloudSpeed do
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("BodyVelocity") and v:FindFirstChild("VehicleSeat") then
                            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                if 3 >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.VehicleSeat.Position).Magnitude then
                                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X > 0 then
                                        v.BodyVelocity.Velocity = v.BodyVelocity.Velocity + game.Workspace.CurrentCamera.CFrame.RightVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X * _G.SetSpeedFlyCloud)
                                    end
                                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X < 0 then
                                        v.BodyVelocity.Velocity = v.BodyVelocity.Velocity + game.Workspace.CurrentCamera.CFrame.RightVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X * _G.SetSpeedFlyCloud)
                                    end
                                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z > 0 then
                                        v.BodyVelocity.Velocity = v.BodyVelocity.Velocity - game.Workspace.CurrentCamera.CFrame.LookVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z * _G.SetSpeedFlyCloud)
                                    end
                                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z < 0 then
                                        v.BodyVelocity.Velocity = v.BodyVelocity.Velocity - game.Workspace.CurrentCamera.CFrame.LookVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z * _G.SetSpeedFlyCloud)
                                    end
                                end
                            end
                        end
                    end
                    task.wait()
                end
            elseif _G.CloudSpeed == true then
                Notification("You don't have Cloud equipped.", _G.TimeNotify)
                wait(0.05)
                Toggles["Cloud Speed"]:SetValue(false)
            end
        end
    })
    Glove2Group:AddInput("Players", {
        Default = "",
        Numeric = false,
        Text = "",
        Finished = true,
        Placeholder = "Username",
        Callback = function(Value)
            _G.PlayerTarget = Value
            for _, v in pairs(game.Players:GetPlayers()) do
                if string.sub(v.Name, 1, # _G.PlayerTarget):lower() == _G.PlayerTarget:lower() then
                    PlayerTa = v
                end
            end
            if PlayerTa then
                _G.PlayerButton3 = PlayerTa.Name
                Notification("Found Player [ " .. PlayerTa.Name .. " ]", _G.TimeNotify)
            else
                Notification("Can't find player", _G.TimeNotify)
            end
        end
    })
    Glove2Group:AddDropdown("Cloud Bring", {
        Text = "Cloud Bring",
        Values = {
            "Player",
            "Your"
        },
        Default = "Player",
        Multi = false,
        Callback = function(Value)
            _G.CloudBring = Value
        end
    })
    Glove2Group:AddToggle("Auto Bring Cloud", {
        Text = "Auto Bring Cloud",
        Default = false,
        Callback = function(Value)
            _G.BringCloud = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Cloud" then
                while _G.BringCloud do
                    if _G.CloudBring == "Player" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players[_G.PlayerButton3].Character:FindFirstChild("entered") and game.Players[_G.PlayerButton3].Character.Humanoid.Sit == false then
                            for i, v in pairs(game.Workspace:GetChildren()) do
                                if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("VehicleSeat") then
                                    v.VehicleSeat.CFrame = game.Players[_G.PlayerButton3].Character.HumanoidRootPart.CFrame * CFrame.new(0, - 2.32, 0)
                                end
                            end
                        end
                    elseif _G.CloudBring == "Your" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.Sit == false then
                            for i, v in pairs(game.Workspace:GetChildren()) do
                                if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("VehicleSeat") then
                                    v.VehicleSeat.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, - 2.32, 0)
                                end
                            end
                        end
                    end
                    task.wait()
                end
            elseif _G.BringCloud == true then
                Notification("You don't have Cloud equipped.", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Bring Cloud"]:SetValue(false)
            end
        end
    })
    Glove2Group:AddDropdown("Firework Bring", {
        Text = "Firework Bring",
        Values = {
            "Player",
            "Your"
        },
        Default = "Player",
        Multi = false,
        Callback = function(Value)
            _G.FireworkBring = Value
        end
    })
    Glove2Group:AddToggle("Auto Bring Firework", {
        Text = "Auto Bring Firework",
        Default = false,
        Callback = function(Value)
            _G.BringFirework = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Firework" then
                while _G.BringFirework do
                    if _G.FireworkBring == "Player" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players[_G.PlayerButton3].Character:FindFirstChild("entered") and game.Players[_G.PlayerButton3].Character.Humanoid.Sit == false then
                            for i, v in pairs(game.Workspace:GetChildren()) do
                                if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("VehicleSeat") then
                                    v.VehicleSeat.CFrame = game.Players[_G.PlayerButton3].Character.HumanoidRootPart.CFrame
                                end
                            end
                        end
                    elseif _G.FireworkBring == "Your" then
                        if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.Sit == false then
                            for i, v in pairs(game.Workspace:GetChildren()) do
                                if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("VehicleSeat") then
                                    v.VehicleSeat.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                end
                            end
                        end
                    end
                    task.wait()
                end
            elseif _G.BringFirework == true then
                Notification("You don't have Firework equipped.", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Bring Firework"]:SetValue(false)
            end
        end
    })
    Glove2Group:AddToggle("Auto Full Kinetic", {
        Text = "Auto Full Kinetic",
        Default = false,
        Callback = function(Value)
            _G.FullKineticSpam = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Kinetic" and game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                while _G.FullKineticSpam do
                    game.ReplicatedStorage.SelfKnockback:FireServer({
                        ["Force"] = 0,
                        ["Direction"] = Vector3.new(0, 0.01, 0)
                    })
                    task.wait()
                end
            elseif _G.FullKineticSpam == true then
                Notification("You don't have Kinetic equipped.", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Full Kinetic"]:SetValue(false)
            end
        end
    })
    Glove2Group:AddButton("Infinite Invisibility", function()
        if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.leaderstats.Slaps.Value >= 666 then
            OGlove = game.Players.LocalPlayer.leaderstats.Glove.Value
            fireclickdetector(workspace.Lobby.Ghost.ClickDetector)
            game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
            fireclickdetector(workspace.Lobby[OGlove].ClickDetector)
            task.wait(1)
            for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v.Name ~= "Humanoid" then
                    v.Transparency = 0
                end
            end
        else
            Notification("You need to be in lobby and have 666+ slaps.", _G.TimeNotify)
        end
    end)
    Glove2Group:AddToggle("Auto Color Skin", {
        Text = "Auto Color Skin",
        Default = false,
        Callback = function(Value)
            _G.GoldColor = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Golden" then
                while _G.GoldColor do
                    game:GetService("ReplicatedStorage"):WaitForChild("Goldify"):FireServer(false, BrickColor.new(_G.skinColor))
                    task.wait()
                end
            elseif _G.GoldColor == true then
                Notification("You don't have Golden equipped.", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Color Skin"]:SetValue(false)
            end
        end
    }):AddColorPicker("Color Skin", {
        Default = Color3.new(255, 255, 255),
        Callback = function(Value)
            _G.skinColor = Value
        end
    })
    Glove2Group:AddToggle("Auto Rainbow", {
        Text = "Auto Rainbow",
        Default = false,
        Callback = function(Value)
            _G.Rainbow = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Golden" then
                while _G.Rainbow and game.Players.LocalPlayer.leaderstats.Glove.Value == "Golden" do
                    local randomnumber = math.random(1004, 1032)
                    game:GetService("ReplicatedStorage").Goldify:FireServer(false, BrickColor.new(randomnumber))
                    task.wait(0.075)
                end
            elseif _G.Rainbow == true then
                Notification("You don't have Golden equipped.", _G.TimeNotify)
                wait(0.05)
                Toggles["Auto Rainbow"]:SetValue(false)
            end
        end
    })
----// Set Toggle Anti \\-----
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Void"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Portal"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Afk"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Ghost Player"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Kick"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Obby"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Megarock"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Ball Baller"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Trap"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Mail"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Lure"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Water"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Mitten Blind"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Knockoff"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Hallow"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Booster"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Lamp"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Pie"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Ice"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Jail Admin"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Conveyor"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Squid"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Squid"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Time Stop"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Null"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Run"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Record"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti REDACTED"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Bob"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Boss Guide"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Snowball"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Brazil"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Za Hando"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Venom Infected"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Fort"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Pusher"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Defend"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Bubble"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Stun"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti COD"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Death Barriers"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Ragdoll"]:SetValue(game.Workspace.NoChanged.Value)
    end)
    game.Workspace.NoChanged.Changed:Connect(function()
        Toggles["Anti Admin"]:SetValue(game.Workspace.NoChanged.Value)
    end)
elseif game.PlaceId == 11828384869 then
    local Window = Library:CreateWindow({
        Title = "Omega X Article Hub - Maze 👁️p",
        Center = true,
        AutoShow = true,
        Resizable = true,
        AutoLock = true,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Misc", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Badge1 = Tabs.Tab:AddLeftGroupbox("Misc")
    Badge1:AddButton("Get Elude + Counter", function()
        Time = 121
        wait(0.4)
        spawn(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.CounterLever.Main.CFrame
            game.Workspace.CounterLever.ClickDetector.MouseClick:Connect(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0)
                wait(0.2)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                for i = 1, Time do
                    Time = Time - 1
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Error",
                        Text = "You wait time [ " .. Time .. " ] receive.",
                        Icon = "rbxassetid://7733658504",
                        Duration = 1
                    })
                    wait(1)
                end
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                for i, v in pairs(workspace.Maze:GetChildren()) do
                    if v.Name == "Part" and v:FindFirstChild("A0") and v:FindFirstChild("ClickDetector") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, - 20, 0)
                        v.ClickDetector.MouseClick:Connect(function()
                            game.Workspace.Ruins.Elude.Glove.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end)
                    end
                end
            end)
        end)
        wait(3.5)
        fireclickdetector(game.Workspace.CounterLever.ClickDetector)
        repeat
            task.wait()
        until Time == 0
        wait(2)
        for i, v in pairs(workspace.Maze:GetChildren()) do
            if v.Name == "Part" and v:FindFirstChild("A0") and v:FindFirstChild("ClickDetector") then
                fireclickdetector(v.ClickDetector)
            end
        end
    end)
    Badge1:AddButton("Teleport Alchemist Plushie", function()
        if game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored == true then
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace._ugcQuestObjectEludeHat.Handle.CFrame
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace._ugcQuestObjectEludeHat.Handle.CFrame
        end
    end)
elseif game.PlaceId == 13833961666 then
    local Window = Library:CreateWindow({
        Title = "Boss Bob 💥",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    if workspace:FindFirstChild("VoidPart") == nil then
        local VoidPart = Instance.new("Part", workspace)
        VoidPart.Name = "VoidPart"
        VoidPart.Position = Vector3.new(- 36, - 3, 16)
        VoidPart.Size = Vector3.new(2000, 1, 2000)
        VoidPart.Anchored = true
        VoidPart.Transparency = 1
        VoidPart.CanCollide = false
    end
    Tabs = {
        Tab = Window:AddTab("Script", "rbxassetid://8997387937"),
        Tab1 = Window:AddTab("Misc", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Script1Group = Tabs.Tab:AddRightGroupbox("Script")
    Script1Group:AddButton("Fly V3", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Fly_V3.lua"))()
    end)
    Script1Group:AddButton("Anti Lag", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Anti-lag.lua"))()
    end)
    Script1Group:AddButton("Inf Yield", function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'), true))()
    end)
    Script1Group:AddButton("Executor | Ui Library", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/Executor.lua"))()
    end)
    Script1Group:AddButton("RemoteSpy", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/RemoteSpy-V2.lua", true))()
    end)
    local Misc1Group = Tabs.Tab:AddLeftGroupbox("Info")
    CanYouFps = Misc1Group:AddLabel("Your Fps [ " .. math.floor(workspace:GetRealPhysicsFPS()) .. " ]", true)
    CanYouPing = Misc1Group:AddLabel("Your Ping [ " .. game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString() .. " ]", true)
    TimeServer = Misc1Group:AddLabel("Server Time [ " .. math.floor(workspace.DistributedGameTime / 60 / 60) .. " Hour | " .. math.floor(workspace.DistributedGameTime / 60) - (math.floor(workspace.DistributedGameTime / 60 / 60) * 60) .. " Minute | " .. math.floor(workspace.DistributedGameTime) - (math.floor(workspace.DistributedGameTime / 60) * 60) .. " Second ]", true)
    TimeNow = Misc1Group:AddLabel("Now Time [ " .. os.date("%X") .. " ]", true)
    Health = Misc1Group:AddLabel("Health [ " .. game.Players.LocalPlayer.Character.Humanoid.Health .. " ]", true)
    if game.Workspace:FindFirstChild("BossFolder") and game.Workspace.BossFolder:FindFirstChild("Health") then
        HealthBoss = Misc1Group:AddLabel("Health Boss [ " .. game.Workspace.BossFolder.Health.Value .. " ]", true)
    else
        HealthBoss = Misc1Group:AddLabel("Check Health Boss [ Not Started Yet ]", true)
    end
    if tonumber(os.date("%H")) >= 5 and tonumber(os.date("%H")) < 12 then
        AlarmTime = Misc1Group:AddLabel("Good Morning [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
    elseif tonumber(os.date("%H")) >= 12 and tonumber(os.date("%H")) < 17 then
        AlarmTime = Misc1Group:AddLabel("Good Afternoon [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
    elseif tonumber(os.date("%H")) >= 17 and tonumber(os.date("%H")) < 21 then
        AlarmTime = Misc1Group:AddLabel("Good Evening [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
    else
        AlarmTime = Misc1Group:AddLabel("Good Night [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
    end
    AgeAccYou = Misc1Group:AddLabel("You Account Age [ " .. game.Players.LocalPlayer.AccountAge .. " ]", true)
    Misc1Group:AddToggle("Auto Set Info", {
        Text = "Auto Set Info",
        Default = false,
        Callback = function(Value)
            _G.InfoServerSet = Value
            while _G.InfoServerSet do
                CanYouFps:SetText("Your Fps [ " .. math.floor(workspace:GetRealPhysicsFPS()) .. " ]", true)
                CanYouPing:SetText("Your Ping [ " .. game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString() .. " ]", true)
                TimeServer:SetText("Server Time [ " .. math.floor(workspace.DistributedGameTime / 60 / 60) .. " Hour | " .. math.floor(workspace.DistributedGameTime / 60) - (math.floor(workspace.DistributedGameTime / 60 / 60) * 60) .. " Minute | " .. math.floor(workspace.DistributedGameTime) - (math.floor(workspace.DistributedGameTime / 60) * 60) .. " Second ]", true)
                TimeNow:SetText("Now Time [ " .. os.date("%X") .. " ]", true)
                Health:SetText("Health [ " .. game.Players.LocalPlayer.Character.Humanoid.Health .. " ]", true)
                if game.Workspace:FindFirstChild("BossFolder") and game.Workspace.BossFolder:FindFirstChild("Health") then
                    HealthBoss:SetText("Health Boss [ " .. game.Workspace.BossFolder.Health.Value .. " ]", true)
                else
                    HealthBoss:SetText("Check Health Boss [ Not Started Yet ]", true)
                end
                if tonumber(os.date("%H")) >= 5 and tonumber(os.date("%H")) < 12 then
                    AlarmTime:SetText("Good Morning [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
                elseif tonumber(os.date("%H")) >= 12 and tonumber(os.date("%H")) < 17 then
                    AlarmTime:SetText("Good Afternoon [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
                elseif tonumber(os.date("%H")) >= 17 and tonumber(os.date("%H")) < 21 then
                    AlarmTime:SetText("Good Evening [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
                else
                    AlarmTime:SetText("Good Night [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
                end
                AgeAccYou:SetText("You Account Age [ " .. game.Players.LocalPlayer.AccountAge .. " ]", true)
                task.wait()
            end
        end
    })
    local Misc2Group = Tabs.Tab1:AddLeftGroupbox("Combat")
    Misc2Group:AddToggle("Damage Boss", {
        Text = "Damage Boss",
        Default = false,
        Callback = function(Value)
            _G.DameBossBob = Value
            while _G.DameBossBob do
                if game.Workspace:FindFirstChild("bobBoss") then
                    game.Workspace.bobBoss.DamageEvent:FireServer()
                end
                task.wait()
            end
        end
    })
    Misc2Group:AddToggle("Auto Click Tycoon", {
        Text = "Auto Click Tycoon",
        Default = false,
        Callback = function(Value)
            _G.AutoTycoon = Value
            while _G.AutoTycoon do
                for _, v in pairs(workspace:GetChildren()) do
                    if string.find(v.Name, "ÅTycoon") and v:FindFirstChild("Click") then
                        fireclickdetector(v.Click.ClickDetector, 0)
                        fireclickdetector(v.Click.ClickDetector, 1)
                    end
                end
                task.wait()
            end
        end
    })
    Misc2Group:AddDropdown("Glove", {
        Text = "Glove",
        Values = {
            "Killstreak",
            "Reaper",
            "God's Hand",
            "Tycoon"
        },
        Default = "Player",
        Multi = false,
        Callback = function(Value)
            GloveSlap = Value
        end
    })
    Misc2Group:AddToggle("Slap Aura Bob Mini", {
        Text = "Slap Aura Bob Mini",
        Default = false,
        Callback = function(Value)
            _G.SlapBobClone = Value
            while _G.SlapBobClone do
                if game.Workspace:FindFirstChild("BobClone") then
                    for _, v in pairs(workspace:GetChildren()) do
                        if v.Name == "BobClone" then
                            if GloveSlap == "Killstreak" then
                                game:GetService("ReplicatedStorage").KSHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
                            elseif GloveSlap == "Reaper" then
                                game:GetService("ReplicatedStorage").ReaperHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
                            elseif GloveSlap == "God's Hand" then
                                game:GetService("ReplicatedStorage").Godshand:FireServer(v:FindFirstChild("HumanoidRootPart"))
                            elseif GloveSlap == "Tycoon" then
                                game:GetService("ReplicatedStorage").GeneralHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    })
    Misc2Group:AddButton("Slap Aura Bob Mini", function()
        if game.Workspace:FindFirstChild("BobClone") then
            for _, v in pairs(workspace:GetChildren()) do
                if v.Name == "BobClone" then
                    if GloveSlap == "Killstreak" then
                        game:GetService("ReplicatedStorage").KSHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
                    elseif GloveSlap == "Reaper" then
                        game:GetService("ReplicatedStorage").ReaperHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
                    elseif GloveSlap == "God's Hand" then
                        game:GetService("ReplicatedStorage").Godshand:FireServer(v:FindFirstChild("HumanoidRootPart"))
                    elseif GloveSlap == "Tycoon" then
                        game:GetService("ReplicatedStorage").GeneralHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
                    end
                end
            end
        end
    end)
    Misc2Group:AddButton("Button Fight Rock", function()
        if game.CoreGui:FindFirstChild("SlapRock") == nil then
            local ScreenGui = Instance.new("ScreenGui")
            local Button = Instance.new("ImageButton")
            local Corner = Instance.new("UICorner")
            local ParticleEmitter = Instance.new("ParticleEmitter")
            ScreenGui.Parent = game.CoreGui
            ScreenGui.Name = "SlapRock"
            ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            Button.Parent = ScreenGui
            Button.Image = "http://www.roblox.com/asset/?id=85284641800085"
            Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Button.BorderSizePixel = 0
            Button.Position = UDim2.new(0.120833337 - 0.1, 0, 0.0952890813 + 0.01, 0)
            Button.Size = UDim2.new(0, 50, 0, 50)
            Button.Draggable = true
            Corner.Parent = Button
            Corner.CornerRadius = UDim.new(0, 12)
            ParticleEmitter.Parent = Button
            ParticleEmitter.LightEmission = 1
            ParticleEmitter.Size = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.1),
                NumberSequenceKeypoint.new(1, 0)
            })
            ParticleEmitter.Lifetime = NumberRange.new(0.5, 1)
            ParticleEmitter.Rate = 0
            ParticleEmitter.Speed = NumberRange.new(5, 10)
            ParticleEmitter.Color = ColorSequence.new(Color3.fromRGB(255, 85, 255), Color3.fromRGB(85, 255, 255))
            local ParticleEmitterAmin = game:GetService("TweenService"):Create(Button, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Rotation = 360
            })
            Button.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 65, 0, 65)
                }):Play()
            end)
            Button.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 50, 0, 50)
                }):Play()
            end)
            Button.MouseButton1Down:Connect(function()
                for i, v in pairs(workspace:GetChildren()) do
                    if v.Name == "SpiritRock" and v:FindFirstChild("DamageEvent") then
                        v.DamageEvent:FireServer()
                    end
                end
                ParticleEmitter.Rate = 100
                task.delay(1, function()
                    ParticleEmitter.Rate = 0
                end)
                ParticleEmitterAmin:Play()
                ParticleEmitterAmin.Completed:Connect(function()
                    Button.Rotation = 0
                end)
            end)
        end
    end)
    local Misc3Group = Tabs.Tab1:AddRightGroupbox("Anti")
    Misc3Group:AddButton("Anti VFX", function()
        if game.Players.LocalPlayer.PlayerScripts:FindFirstChild("VFXListener") then
            game.Players.LocalPlayer.PlayerScripts:FindFirstChild("VFXListener").Parent = game.ReplicatedStorage
        else
            game.ReplicatedStorage.VFXListener.Parent = game.Players.LocalPlayer.PlayerScripts
        end
    end)
    Misc3Group:AddToggle("Anti Ring", {
        Text = "Anti Ring",
        Default = false,
        Callback = function(Value)
            _G.AntiRing = Value
            while _G.AntiRing do
                if game.Workspace:FindFirstChild("Ring") then
                    game.Workspace:FindFirstChild("Ring"):Destroy()
                end
                task.wait()
            end
        end
    }):AddKeyPicker("AntiRing", {
        Default = "X",
        Text = "Anti Ring",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Misc3Group:AddToggle("Remove Meteors", {
        Text = "Remove Meteor",
        Default = false,
        Callback = function(Value)
            _G.AutoRemoveMeteors = Value
            while _G.AutoRemoveMeteors do
                if game:GetService("Players").LocalPlayer.PlayerScripts.VFXListener:FindFirstChild("BigExplosion") then
                    game:GetService("Players").LocalPlayer.PlayerScripts.VFXListener.BigExplosion:Destroy()
                end
                if game:GetService("Players").LocalPlayer.PlayerScripts.VFXListener:FindFirstChild("SmallMeteorVFX") then
                    game:GetService("Players").LocalPlayer.PlayerScripts.VFXListener.SmallMeteorVFX:Destroy()
                end
                task.wait()
            end
        end
    }):AddKeyPicker("RemoveMeteors", {
        Default = "X",
        Text = "Remove Big Meteors",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Misc3Group:AddToggle("Anti Void Damage", {
        Text = "Anti Void Damage",
        Default = false,
        Callback = function(Value)
            game.Workspace["VoidPart"].CanCollide = Value
            if Value == true then
                game.Workspace["VoidPart"].Transparency = 0.5
            else
                game.Workspace["VoidPart"].Transparency = 1
            end
        end
    }):AddKeyPicker("AntiVoidDamage", {
        Default = "X",
        Text = "Anti Void Damage",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Misc3Group:AddToggle("Anti Ragdoll", {
        Text = "Anti Ragdoll",
        Default = false,
        Callback = function(Value)
            _G.AntiRagdoll = Value
            while _G.AntiRagdoll do
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                    if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true then
                        repeat
                            task.wait()
                            game.Players.LocalPlayer.Character.Torso.Anchored = true
                        until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
                        game.Players.LocalPlayer.Character.Torso.Anchored = false
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("AntiRagdoll", {
        Default = "X",
        Text = "Anti Ragdoll",
        Mode = "Toggle",
        SyncToggleState = true
    })
elseif game.PlaceId == 9431156611 then
    local Window = Library:CreateWindow({
        Title = "Slap Royale 🏆",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Combat", "rbxassetid://7733674079"),
        Tab1 = Window:AddTab("Anti", "rbxassetid://7734056608"),
        Tab2 = Window:AddTab("Misc", "rbxassetid://4370318685"),
        Tab3 = Window:AddTab("Local", "rbxassetid://4335489011"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    TabBoxCombat1 = Tabs.Tab:AddLeftTabbox()
    local Combat1Group = TabBoxCombat1:AddTab("Combat")
    _G.ReachAura = 25
    Combat1Group:AddSlider("Reach Slap", {
        Text = "Reach Slap Aura",
        Default = 25,
        Min = 10,
        Max = 50,
        Rounding = 1,
        Compact = true,
        Callback = function(Value)
            _G.ReachAura = Value
        end
    })
    _G.SlapAuraChoose = "Click Slap"
    Combat1Group:AddDropdown("ChooseSlap", {
        Text = "Slap Aura",
        Values = {
            "Slap Aura",
            "Click Slap"
        },
        Default = "Click Slap",
        Multi = false,
        Callback = function(Value)
            _G.SlapAuraChoose = Value
        end
    })
    Combat1Group:AddToggle("Slap Aura", {
        Text = "Slap Aura",
        Default = false,
        Callback = function(Value)
            _G.SlapAura = Value
            if _G.SlapAuraChoose == "Slap Aura" then
                while _G.SlapAura do
                    for i, v in pairs(game.Players:GetChildren()) do
                        if v ~= game.Players.LocalPlayer and v.Character then
                            if v.Character:FindFirstChild("Dead") == nil and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:WaitForChild("inMatch").Value == true and game.Players.LocalPlayer.Character:WaitForChild("inMatch").Value == true then
                                if _G.ReachAura >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude then
                                    game.ReplicatedStorage.Events.Slap:FireServer(v.Character:WaitForChild("HumanoidRootPart"))
                                end
                            end
                        end
                    end
                    task.wait()
                end
            elseif _G.SlapAuraChoose == "Click Slap" then
                game:GetService("UserInputService").InputBegan:Connect(function(input)
                    if _G.SlapAuraChoose == "Click Slap" and _G.SlapAura == true then
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            for i, v in pairs(game.Players:GetChildren()) do
                                if v ~= game.Players.LocalPlayer and v.Character then
                                    if v.Character:FindFirstChild("Dead") == nil and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:WaitForChild("inMatch").Value == true and game.Players.LocalPlayer.Character:WaitForChild("inMatch").Value == true then
                                        if _G.ReachAura >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude then
                                            game.ReplicatedStorage.Events.Slap:FireServer(v.Character:WaitForChild("HumanoidRootPart"))
                                        end
                                    end
                                end
                            end
                            wait(2)
                        end
                    end
                end)
            end
        end
    }):AddKeyPicker("SlapAura", {
        Default = "F",
        Text = "Slap Aura",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Combat1Group:AddSlider("Extend Glove", {
        Text = "Extend Glove",
        Default = 5,
        Min = 2,
        Max = 50,
        Rounding = 1,
        Compact = true,
        Callback = function(Value)
            _G.GloveExtendReach = Value
        end
    })
    Combat1Group:AddDropdown("Extend Option", {
        Text = "Extend Option",
        Values = {
            "Meat Stick",
            "Pancake",
            "Growth",
            "North Korea Wall",
            "Slight Extend"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            GloveExtendOption = Value
        end
    })
    Combat1Group:AddToggle("Extend Glove", {
        Text = "Extend Glove",
        Default = false,
        Callback = function(Value)
            _G.GloveExtendGet = Value
            while _G.GloveExtendGet do
                if game.Players.LocalPlayer:WaitForChild("Backpack"):FindFirstChildOfClass("Tool") ~= nil then
                    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.Name ~= "Radio" then
                            if v:FindFirstChild("Glove") ~= nil then
                                if GloveExtendOption == "Meat Stick" then
                                    v:FindFirstChild("Glove").Size = Vector3.new(0, _G.GloveExtendReach, 2)
                                elseif GloveExtendOption == "Pancake" then
                                    v:FindFirstChild("Glove").Size = Vector3.new(0, _G.GloveExtendReach, _G.GloveExtendReach)
                                elseif GloveExtendOption == "Growth" then
                                    v:FindFirstChild("Glove").Size = Vector3.new(_G.GloveExtendReach, _G.GloveExtendReach, _G.GloveExtendReach)
                                elseif GloveExtendOption == "North Korea Wall" then
                                    v:FindFirstChild("Glove").Size = Vector3.new(_G.GloveExtendReach, 0, _G.GloveExtendReach)
                                elseif GloveExtendOption == "Slight Extend" then
                                    v:FindFirstChild("Glove").Size = Vector3.new(3, 3, 3.7)
                                end
                                v:FindFirstChild("Glove").Transparency = 0.5
                            end
                        end
                    end
                else
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v:IsA("Tool") and v.Name ~= "Radio" then
                            if v:FindFirstChild("Glove") ~= nil then
                                if GloveExtendOption == "Meat Stick" then
                                    v:FindFirstChild("Glove").Size = Vector3.new(0, _G.GloveExtendReach, 2)
                                elseif GloveExtendOption == "Pancake" then
                                    v:FindFirstChild("Glove").Size = Vector3.new(0, _G.GloveExtendReach, _G.GloveExtendReach)
                                elseif GloveExtendOption == "Growth" then
                                    v:FindFirstChild("Glove").Size = Vector3.new(_G.GloveExtendReach, _G.GloveExtendReach, _G.GloveExtendReach)
                                elseif GloveExtendOption == "North Korea Wall" then
                                    v:FindFirstChild("Glove").Size = Vector3.new(_G.GloveExtendReach, 0, _G.GloveExtendReach)
                                elseif GloveExtendOption == "Slight Extend" then
                                    v:FindFirstChild("Glove").Size = Vector3.new(3, 3, 3.7)
                                end
                                v:FindFirstChild("Glove").Transparency = 0.5
                            end
                        end
                    end
                end
                task.wait()
            end
            if _G.GloveExtendGet == false then
                if game.Players.LocalPlayer:WaitForChild("Backpack"):FindFirstChildOfClass("Tool") ~= nil then
                    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.Name ~= "Radio" then
                            if v:FindFirstChild("Glove") ~= nil then
                                v:FindFirstChild("Glove").Size = Vector3.new(2.5, 2.5, 1.7)
                                v:FindFirstChild("Glove").Transparency = 0
                            end
                        end
                    end
                else
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v:IsA("Tool") and v.Name ~= "Radio" then
                            if v:FindFirstChild("Glove") ~= nil then
                                v:FindFirstChild("Glove").Size = Vector3.new(2.5, 2.5, 1.7)
                                v:FindFirstChild("Glove").Transparency = 0
                            end
                        end
                    end
                end
            end
        end
    }):AddKeyPicker("ExtendGlove", {
        Default = "H",
        Text = "Extend Glove",
        Mode = "Toggle",
        SyncToggleState = true
    })
    _G.ReachHitbox = 10
    Combat1Group:AddSlider("Reach HitBox", {
        Text = "Reach Hitbox",
        Default = 10,
        Min = 10,
        Max = 30,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            _G.ReachHitbox = Value
        end
    })
    Combat1Group:AddToggle("Hitbox Player", {
        Text = "Hitbox Player",
        Default = false,
        Callback = function(Value)
            _G.HitboxPlayer = Value
            while _G.HitboxPlayer do
                for i, v in pairs(game.Players:GetChildren()) do
                    if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        v.Character.HumanoidRootPart.Size = Vector3.new(_G.ReachHitbox, _G.ReachHitbox, _G.ReachHitbox)
                        v.Character.HumanoidRootPart.Transparency = 0.75
                    end
                end
                task.wait()
            end
            if _G.HitboxPlayer == false then
                for i, v in pairs(game.Players:GetChildren()) do
                    if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        v.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                        v.Character.HumanoidRootPart.Transparency = 1
                    end
                end
            end
        end
    }):AddKeyPicker("Hitbox", {
        Default = "Z",
        Text = "Hitbox Player",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Combat1Group:AddInput("FlySpeed", {
        Default = "50",
        Numeric = true,
        Text = "Fly Speed",
        Placeholder = "UserFlySpeed",
        Callback = function(Value)
            _G.SetSpeedFly = Value
        end
    })
    _G.SetSpeedFly = 100
    Combat1Group:AddToggle("Start Fly", {
        Text = "Start Fly",
        Default = false,
        Callback = function(Value)
            _G.StartFly = Value
            if _G.StartFly == false then
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler:Destroy()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler:Destroy()
                    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                end
            end
            while _G.StartFly do
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
                    game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler.CFrame = Workspace.CurrentCamera.CoordinateFrame
                    game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = Vector3.new()
                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X > 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity + game.Workspace.CurrentCamera.CFrame.RightVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X * _G.SetSpeedFly)
                    end
                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X < 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity + game.Workspace.CurrentCamera.CFrame.RightVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X * _G.SetSpeedFly)
                    end
                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z > 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity - game.Workspace.CurrentCamera.CFrame.LookVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z * _G.SetSpeedFly)
                    end
                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z < 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity - game.Workspace.CurrentCamera.CFrame.LookVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z * _G.SetSpeedFly)
                    end
                elseif game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") == nil and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") == nil then
                    local bv = Instance.new("BodyVelocity")
                    local bg = Instance.new("BodyGyro")
                    bv.Name = "VelocityHandler"
                    bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    bv.MaxForce = Vector3.new(0, 0, 0)
                    bv.Velocity = Vector3.new(0, 0, 0)
                    bg.Name = "GyroHandler"
                    bg.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    bg.MaxTorque = Vector3.new(0, 0, 0)
                    bg.P = 1000
                    bg.D = 50
                end
                task.wait()
            end
        end
    }):AddKeyPicker("Fly", {
        Default = "R",
        Text = "Fly",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Combat1Group:AddButton({
        Text = "Leave Bus Early",
        Tooltip = "People Vote You",
        Func = function()
            game:GetService("ReplicatedStorage").Events.BusJumping:FireServer()
            repeat
                task.wait()
            until game.Players.LocalPlayer.PlayerGui:FindFirstChild("JumpPrompt")
            game.Players.LocalPlayer.PlayerGui.JumpPrompt:Destroy()
        end
    })
    local Combat2Group = Tabs.Tab:AddRightGroupbox("Item")
    Combat2Group:AddToggle("Auto Use Item Power", {
        Text = "Auto Use Item Power",
        Default = false,
        Callback = function(Value)
            _G.AutoUseItemPower = Value
            while _G.AutoUseItemPower do
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.Name == "Bull's essence" or v.Name == "Potion of Strength" or v.Name == "Boba" or v.Name == "Speed Potion" or v.Name == "Frog Potion" or v.Name == "Strength Brew" or v.Name == "Frog Brew" or v.Name == "Speed Brew" then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        v:Activate()
                    end
                end
                task.wait()
            end
        end
    })
    Combat2Group:AddToggle("Auto Collect Item", {
        Text = "Auto Collect Item",
        Default = false,
        Callback = function(Value)
            _G.AutoCollectItem = Value
            while _G.AutoCollectItem do
                for i, v in pairs(workspace:FindFirstChild("Items"):GetChildren()) do
                    if v:FindFirstChild("Handle") and _G.AutoCollectItem == true then
                        TweenTp(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), v:FindFirstChild("Handle").CFrame * CFrame.new(0, 3, 0), true, 2)
                        wait(0.15)
                        game:GetService("ReplicatedStorage").Events.Item:FireServer(v.Handle)
                    end
                end
                task.wait()
            end
        end
    })
    Combat2Group:AddToggle("Auto Heal", {
        Text = "Auto Heal",
        Default = false,
        Callback = function(Value)
            _G.AutoHeal = Value
            while _G.AutoHeal do
                for x, n in pairs({
                    "Apple",
                    "Bandage",
                    "Boba",
                    "First Aid Kit",
                    "Healing Brew",
                    "Healing Potion"
                }) do
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.Name == n then
                            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health < 45 then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                v:Activate()
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    })
    Combat2Group:AddButton("Use Item Power", function()
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "Bull's essence" or v.Name == "Potion of Strength" or v.Name == "Boba" or v.Name == "Speed Potion" or v.Name == "Frog Potion" or v.Name == "Strength Brew" or v.Name == "Frog Brew" or v.Name == "Speed Brew" then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                v:Activate()
            end
        end
    end)
    local Esp1Group = TabBoxCombat1:AddTab("ESP")
    Esp1Group:AddToggle("Esp", {
        Text = "Glove Esp",
        Default = false,
        Callback = function(Value)
            _G.GloveESP = Value
            if _G.GloveESP == false then
                for i, v in ipairs(game.Players:GetChildren()) do
                    if v.Character and v.Character:FindFirstChild("Head") and v.Character.Head:FindFirstChild("GloveEsp") then
                        v.Character.Head.GloveEsp:Destroy()
                    end
                end
            end
            while _G.GloveESP do
                for i, v in ipairs(game.Players:GetChildren()) do
                    if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
                        if v.Character.Head:FindFirstChild("GloveEsp") and v.Character.Head.GloveEsp:FindFirstChild("TextLabel") and v.Character.Head.GloveEsp.TextLabel.TextColor3 ~= _G.ColorESP then
                            v.Character.Head.GloveEsp.TextLabel.TextColor3 = _G.ColorESP
                        end
                        if v.Character.Head:FindFirstChild("GloveEsp") and v.Character.Head.GloveEsp:FindFirstChild("TextLabel") then
                            v.Character.Head.GloveEsp.TextLabel.Text = (_G.NameEsp == true and "Name [ " .. v.Name .. " ]" or "") .. (_G.GloveEsp == true and "\nGlove [ " .. v.Glove.Value .. " ]" or "") .. (_G.PowerFull == true and "\nPower [ " .. v.Character.Power.Value .. " ]" or "") .. (_G.HealthEsp == true and "\nHealth [ " .. string.format("%.1f", (v.Character.Health)) .. " ]" or "") .. (_G.DistanceEsp == true and "\nDistance [ " .. string.format("%.1f", (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude) .. " ]" or "") .. (_G.WalkSpeedEsp == true and "Speed [ " .. string.format("%.1f", (v.Character:FindFirstChild("Humanoid").MoveDirection.Magnitude)) .. " ]" or "")
                        end
                        if v.Character.Head:FindFirstChild("GloveEsp") == nil then
                            GloveEsp = Instance.new("BillboardGui", v.Character.Head)
                            GloveEsp.Adornee = v.Character.Head
                            GloveEsp.Name = "GloveEsp"
                            GloveEsp.Size = UDim2.new(0, 100, 0, 150)
                            GloveEsp.StudsOffset = Vector3.new(0, 1, 0)
                            GloveEsp.AlwaysOnTop = true
                            GloveEsp.StudsOffset = Vector3.new(0, 3, 0)
                            GloveEspText = Instance.new("TextLabel", GloveEsp)
                            GloveEspText.BackgroundTransparency = 1
                            GloveEspText.Size = UDim2.new(0, 100, 0, 100)
                            GloveEspText.TextSize = _G.TextSize
                            GloveEspText.Font = Enum.Font.SourceSansBold
                            GloveEspText.TextColor3 = _G.ColorESP
                            GloveEspText.TextStrokeTransparency = 0
                            GloveEspText.Text = ""
                        end
                    end
                end
                task.wait()
            end
        end
    }):AddColorPicker("Color Esp Glove", {
        Default = Color3.new(255, 255, 255),
        Callback = function(Value)
            _G.ColorESP = Value
        end
    }):AddKeyPicker("GloveEsp", {
        Default = "B",
        Text = "Glove Esp",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Esp1Group:AddToggle("Esp1", {
        Text = "Item Esp",
        Default = false,
        Callback = function(Value)
            _G.ItemESP = Value
            if _G.ItemESP == false then
                for i, v in ipairs(game.Workspace.Items:GetChildren()) do
                    if v.ClassName == "Tool" and v:FindFirstChild("Handle") and v.Handle:FindFirstChild("ItemESP") then
                        v.Handle.ItemESP:Destroy()
                    end
                end
                for i, v in pairs(game.Players:GetPlayers()) do
                    for t, g in pairs(v.Character:GetChildren()) do
                        if g:IsA("Tool") and g:FindFirstChild("Handle") and g.Handle:FindFirstChild("ItemESP") then
                            g.Handle.ItemESP:Destroy()
                        end
                    end
                    for w, n in pairs(v.Backpack:GetChildren()) do
                        if n:IsA("Tool") and n:FindFirstChild("Handle") and n.Handle:FindFirstChild("ItemESP") then
                            n.Handle.ItemESP:Destroy()
                        end
                    end
                end
            end
            while _G.ItemESP do
                for i, v in ipairs(game.Workspace.Items:GetChildren()) do
                    if v.ClassName == "Tool" and v:FindFirstChild("Handle") then
                        if v.Handle:FindFirstChild("ItemESP") and v.Handle.ItemESP:FindFirstChild("TextLabel") and v.Handle.ItemESP.TextLabel.TextColor3 ~= _G.ColorESP1 then
                            v.Handle.ItemESP.TextLabel.TextColor3 = _G.ColorESP1
                        end
                        if v.Handle:FindFirstChild("ItemESP") and v.Handle.ItemESP:FindFirstChild("TextLabel") then
                            v.Handle.ItemESP.TextLabel.Text = (_G.NameEsp == true and v.Name or "") .. (_G.DistanceEsp == true and "\nDistance [ " .. string.format("%.1f", (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude) .. " ]" or "")
                        end
                        if v.Handle:FindFirstChild("ItemESP") == nil then
                            ItemESP = Instance.new("BillboardGui", v.Handle)
                            ItemESP.Adornee = v.Handle
                            ItemESP.Name = "ItemESP"
                            ItemESP.Size = UDim2.new(0, 100, 0, 150)
                            ItemESP.StudsOffset = Vector3.new(0, 1, 0)
                            ItemESP.AlwaysOnTop = true
                            ItemESP.StudsOffset = Vector3.new(0, 3, 0)
                            ItemESPText = Instance.new("TextLabel", ItemESP)
                            ItemESPText.BackgroundTransparency = 1
                            ItemESPText.Size = UDim2.new(0, 100, 0, 100)
                            ItemESPText.TextSize = _G.TextSize
                            ItemESPText.Font = Enum.Font.SourceSansBold
                            ItemESPText.TextColor3 = _G.ColorESP1
                            ItemESPText.TextStrokeTransparency = 0
                            ItemESPText.Text = v.Name
                        end
                    end
                end
                for i, v in pairs(game.Players:GetPlayers()) do
                    for t, g in pairs(v.Character:GetChildren()) do
                        if g:IsA("Tool") and g:FindFirstChild("Handle") and g.Handle:FindFirstChild("ItemESP") then
                            g.Handle.ItemESP:Destroy()
                        end
                    end
                    for w, n in pairs(v.Backpack:GetChildren()) do
                        if n:IsA("Tool") and n:FindFirstChild("Handle") and n.Handle:FindFirstChild("ItemESP") then
                            n.Handle.ItemESP:Destroy()
                        end
                    end
                end
                task.wait()
            end
        end
    }):AddColorPicker("Color Esp Item", {
        Default = Color3.new(255, 255, 255),
        Callback = function(Value)
            _G.ColorESP1 = Value
        end
    }):AddKeyPicker("ItemEsp", {
        Default = "L",
        Text = "Item Esp",
        Mode = "Toggle",
        SyncToggleState = true
    })
    _G.DistanceEsp = false
    Esp1Group:AddToggle("Distance Esp", {
        Text = "Distance Esp",
        Default = false,
        Callback = function(Value)
            _G.DistanceEsp = Value
        end
    })
    _G.NameEsp = false
    Esp1Group:AddToggle("Name Esp", {
        Text = "Name Esp",
        Default = false,
        Callback = function(Value)
            _G.NameEsp = Value
        end
    })
    _G.HealthEsp = false
    Esp1Group:AddToggle("Health Esp", {
        Text = "Health Player Esp",
        Default = false,
        Callback = function(Value)
            _G.HealthEsp = Value
        end
    })
    _G.WalkSpeedEsp = false
    Esp1Group:AddToggle("Speed Esp", {
        Text = "Speed Player Esp",
        Default = false,
        Callback = function(Value)
            _G.WalkSpeedEsp = Value
        end
    })
    _G.GloveEsp = false
    Esp1Group:AddToggle("Glove Esp", {
        Text = "Glove Player Esp",
        Default = false,
        Callback = function(Value)
            _G.GloveEsp = Value
        end
    })
    _G.PowerFull = false
    Esp1Group:AddToggle("Power Esp", {
        Text = "Power Player Esp",
        Default = false,
        Callback = function(Value)
            _G.PowerFull = Value
        end
    })
    _G.TextSize = 10
    Esp1Group:AddSlider("Size Text Esp", {
        Text = "Size Text Esp",
        Default = 10,
        Min = 10,
        Max = 40,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            _G.TextSize = Value
            for i, v in ipairs(game.Players:GetChildren()) do
                if v.Character:FindFirstChild("Head") and v.Character.Head:FindFirstChild("GloveEsp") and v.Character.Head.GloveEsp:FindFirstChild("TextLabel") and v.Character.Head.GloveEsp.TextLabel.TextSize ~= Value then
                    v.Character.Head.GloveEsp.TextLabel.TextSize = Value
                end
            end
            for i, v in ipairs(game.Workspace.Items:GetChildren()) do
                if v.ClassName == "Tool" and v:FindFirstChild("Handle") and v.Handle:FindFirstChild("ItemESP") and v.Handle.ItemESP:FindFirstChild("TextLabel") and v.Handle.ItemESP.TextLabel.TextSize ~= Value then
                    v.Handle.ItemESP.TextLabel.TextSize = Value
                end
            end
        end
    })
    local Anti1Group = Tabs.Tab1:AddLeftGroupbox("Anti")
    Anti1Group:AddToggle("Anti Zone", {
        Text = "Anti Zone",
        Default = false,
        Callback = function(Value)
            _G.RemoveZone = Value
            game.Players.LocalPlayer.Character:WaitForChild("inZone").Changed:Connect(function()
                if _G.RemoveZone then
                    game.Players.LocalPlayer.Character:WaitForChild("inZone").Value = false
                end
            end)
        end
    }):AddKeyPicker("AntiZone", {
        Default = "K",
        Text = "Anti Zone",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Anti1Group:AddToggle("Anti Ice", {
        Text = "Anti Ice",
        Default = false,
        Callback = function(Value)
            _G.AntiIce = Value
            while _G.AntiIce do
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.Name == "Icecube" then
                        v:Destroy()
                        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                        game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("AntiIce", {
        Default = "K",
        Text = "Anti Ice",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Anti1Group:AddToggle("Anti Acid", {
        Text = "Anti Acid",
        Default = false,
        Callback = function(Value)
            for i, v in pairs(workspace.Map.AcidAbnormality:GetChildren()) do
                if v.Name == "Acid" and v.ClassName == "Part" then
                    v.CanTouch = not Value
                    v.CanCollide = Value
                end
            end
        end
    }):AddKeyPicker("AntiLavaAcid", {
        Default = "K",
        Text = "Anti Lava & Acid",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Anti1Group:AddToggle("Anti Lava", {
        Text = "Anti Lava",
        Default = false,
        Callback = function(Value)
            if workspace.Map.DragonDepths:FindFirstChild("Lava") then
                workspace.Map.DragonDepths.Lava.CanTouch = not value
                workspace.Map.DragonDepths.Lava.CanCollide = Value
            end
        end
    }):AddKeyPicker("AntiLavaAcid", {
        Default = "K",
        Text = "Anti Lava",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Anti1Group:AddToggle("Anti Record", {
        Text = "Anti Record",
        Default = false,
        Tooltip = "People chat record, you get kick",
        Callback = function(Value)
            AntiRecord = Value
        end
    }):AddKeyPicker("AntiRecord", {
        Default = "K",
        Text = "Anti Record",
        Mode = "Toggle",
        SyncToggleState = true
    })
    for i, p in pairs(game.Players:GetChildren()) do
        if p ~= game.Players.LocalPlayer then
            p.Chatted:Connect(function(message)
                Words = message:split(" ")
                if AntiRecord == true then
                    for i, v in pairs(Words) do
                        if v:lower():match("recording") or v:lower():match(" rec") or v:lower():match("record") or v:lower():match("discor") or v:lower():match(" disco") or v:lower():match(" disc") or v:lower():match("ticket") or v:lower():match("tickets") or v:lower():match(" ds") or v:lower():match(" dc") or v:lower():match("dizzy") or v:lower():match("dizzycord") or v:lower():match(" clip") or v:lower():match("proof") or v:lower():match("evidence") then
                            game.Players.LocalPlayer:Kick("Possible player recording detected." .. " [ " .. p.Name .. " ]" .. " [ " .. message .. " ]")
                        end
                    end
                end
            end)
        end
    end
    game.Players.PlayerAdded:Connect(function(Player)
        Player.Chatted:Connect(function(message)
            Words = message:split(" ")
            if AntiRecord == true then
                for i, v in pairs(Words) do
                    if v:lower():match("recording") or v:lower():match(" rec") or v:lower():match("record") or v:lower():match("discor") or v:lower():match(" disco") or v:lower():match(" disc") or v:lower():match("ticket") or v:lower():match("tickets") or v:lower():match(" ds") or v:lower():match(" dc") or v:lower():match("dizzy") or v:lower():match("dizzycord") or v:lower():match(" clip") or v:lower():match("proof") or v:lower():match("evidence") then
                        game.Players.LocalPlayer:Kick("Possible player recording detected." .. " [ " .. Player.Name .. " ]" .. " [ " .. message .. " ]")
                    end
                end
            end
        end)
    end)
    Anti1Group:AddToggle("Anti Ragdoll", {
        Text = "Anti Ragdoll",
        Default = false,
        Callback = function(Value)
            _G.AntiRagdoll = Value
            while _G.AntiRagdoll do
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                    if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true then
                        repeat
                            task.wait()
                            game.Players.LocalPlayer.Character.Torso.Anchored = true
                        until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
                        game.Players.LocalPlayer.Character.Torso.Anchored = false
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("AntiRagdoll", {
        Default = "K",
        Text = "Anti Ragdoll",
        Mode = "Toggle",
        SyncToggleState = true
    })
    local Misc1Group = Tabs.Tab2:AddLeftGroupbox("Misc")
    CodeLab = Misc1Group:AddLabel("Code [ ???? ]")
    Misc1Group:AddButton("Get Lab Code", function()
        if game.Workspace.Map.CodeBrick.SurfaceGui:FindFirstChild("IMGTemplate") then
            Code = {}
            for i, v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                if v.Name == "IMGTemplate" then
                    if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                        table.insert(Code, "4")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                        table.insert(Code, "2")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                        table.insert(Code, "3")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                        table.insert(Code, "9")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                        table.insert(Code, "8")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                        table.insert(Code, "2")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                        table.insert(Code, "8")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                        table.insert(Code, "3")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                        table.insert(Code, "7")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                        table.insert(Code, "8")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                        table.insert(Code, "2")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                        table.insert(Code, "6")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                        table.insert(Code, "3")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                        table.insert(Code, "6")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                        table.insert(Code, "6")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                        table.insert(Code, "2")
                    end
                end
            end
        end
        CodeLab:SetText("Code [ " .. Code .. " ]")
    end)
    Misc1Group:AddButton("Get Chain", function()
        if game.Workspace.Map.CodeBrick.SurfaceGui:FindFirstChild("IMGTemplate") then
            Code = {}
            for i, v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                if v.Name == "IMGTemplate" then
                    if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                        table.insert(Code, "4")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                        table.insert(Code, "2")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                        table.insert(Code, "3")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                        table.insert(Code, "9")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                        table.insert(Code, "8")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                        table.insert(Code, "2")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                        table.insert(Code, "8")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                        table.insert(Code, "3")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                        table.insert(Code, "7")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                        table.insert(Code, "8")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                        table.insert(Code, "2")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                        table.insert(Code, "6")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                        table.insert(Code, "3")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                        table.insert(Code, "6")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                        table.insert(Code, "6")
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                        table.insert(Code, "2")
                    end
                end
            end
        end
        fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons.Reset.ClickDetector)
        wait(0.25)
        for i = 1, # Code do
            local CodeNah = Code[i]
            fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[CodeNah].ClickDetector)
            wait(0.25)
        end
        wait(0.25)
        fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons.Enter.ClickDetector)
    end)
    Misc1Group:AddButton("Free Emotes", function()
        if LoadingScr then
            return
        end
        LoadingScr = true
        game.Players.LocalPlayer.Chatted:Connect(function(msg)
            Anims = {
                ["L"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["L"]),
                ["Groove"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Groove"]),
                ["Helicopter"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Helicopter"]),
                ["Floss"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Floss"]),
                ["Kick"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Kick"]),
                ["Headless"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Headless"]),
                ["Laugh"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Laugh"]),
                ["Parker"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Parker"]),
                ["Thriller"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Thriller"]),
                ["Spasm"] = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").AnimationPack["Spasm"])
            }
            for i, v in pairs(Anims) do
                if v.IsPlaying then
                    v:Stop()
                end
            end
            task.wait()
            if string.lower(msg) == "/e l" then
                Anims["L"]:Play()
            elseif string.lower(msg) == "/e groove" then
                Anims["Groove"]:Play()
            elseif string.lower(msg) == "/e helicopter" then
                Anims["Helicopter"]:Play()
            elseif string.lower(msg) == "/e floss" then
                Anims["Floss"]:Play()
            elseif string.lower(msg) == "/e kick" then
                Anims["Kick"]:Play()
            elseif string.lower(msg) == "/e headless" then
                Anims["Headless"]:Play()
            elseif string.lower(msg) == "/e laugh" then
                Anims["Laugh"]:Play()
                game:GetService("ReplicatedStorage").AnimationSound:FireServer("LAUGH")
            elseif string.lower(msg) == "/e parker" then
                Anims["Parker"]:Play()
            elseif string.lower(msg) == "/e thriller" then
                Anims["Thriller"]:Play()
            elseif string.lower(msg) == "/e spasm" then
                Anims["Spasm"]:Play()
            end
            game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
                if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                    for i, v in pairs(Anims) do
                        if v.IsPlaying then
                            v:Stop()
                        end
                    end
                end
            end)
        end)
    end)
    local Local1Group = Tabs.Tab3:AddLeftGroupbox("Speed")
    Local1Group:AddSlider("WalkSpeed", {
        Text = "Speed",
        Default = 20,
        Min = 20,
        Max = 1000,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
            Walkspeed = Value
        end
    })
    Local1Group:AddInput("WalkSpeed1", {
        Default = "20",
        Numeric = false,
        Text = "Speed",
        Placeholder = "UserSpeed",
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
            Walkspeed = Value
        end
    })
    Local1Group:AddToggle("SetSpeed", {
        Text = "Auto Set Speed",
        Default = false,
        Callback = function(Value)
            KeepWalkspeed = Value
            while KeepWalkspeed do
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed ~= Walkspeed then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Walkspeed
                end
                task.wait()
            end
        end
    })
    local Local2Group = Tabs.Tab3:AddRightGroupbox("Jump")
    Local2Group:AddSlider("JumpPower", {
        Text = "Jump",
        Default = 50,
        Min = 50,
        Max = 1000,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
            Jumppower = Value
        end
    })
    Local2Group:AddInput("JumpPower1", {
        Default = "50",
        Numeric = true,
        Text = "Jump",
        Placeholder = "UserJump",
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
            Jumppower = Value
        end
    })
    Local2Group:AddToggle("SetJump", {
        Text = "Auto Set Jump",
        Default = false,
        Callback = function(Value)
            KeepJumppower = Value
            while KeepJumppower do
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.JumpPower ~= Jumppower then
                    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jumppower
                end
                task.wait()
            end
        end
    })
elseif game.PlaceId == 14422118326 then
    local Window = Library:CreateWindow({
        Title = "Maze Null ☠️",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Misc", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Misc1Group = Tabs.Tab:AddLeftGroupbox("Misc")
    Misc1Group:AddToggle("Anti Null", {
        Text = "Anti Null",
        Default = false,
        Callback = function(Value)
            _G.AntiNull = Value
            while _G.AntiNull do
                for i, v in pairs(game.Workspace.Mobs:GetChildren()) do
                    if v.Name == "Imp" and v:FindFirstChild("Body") then
                        game:GetService("ReplicatedStorage").b:FireServer(v.Body)
                    end
                end
                task.wait()
            end
        end
    })
    Misc1Group:AddInput("FlySpeed", {
        Default = "50",
        Numeric = true,
        Text = "Fly Speed",
        Placeholder = "UserFlySpeed",
        Callback = function(Value)
            _G.SetSpeedFly = Value
        end
    })
    _G.SetSpeedFly = 100
    Misc1Group:AddToggle("Start Fly", {
        Text = "Start Fly",
        Default = false,
        Callback = function(Value)
            _G.StartFly = Value
            if _G.StartFly == false then
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler:Destroy()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler:Destroy()
                    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                end
            end
            while _G.StartFly do
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
                    game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler.CFrame = Workspace.CurrentCamera.CoordinateFrame
                    game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = Vector3.new()
                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X > 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity + game.Workspace.CurrentCamera.CFrame.RightVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X * _G.SetSpeedFly)
                    end
                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X < 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity + game.Workspace.CurrentCamera.CFrame.RightVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X * _G.SetSpeedFly)
                    end
                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z > 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity - game.Workspace.CurrentCamera.CFrame.LookVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z * _G.SetSpeedFly)
                    end
                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z < 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity - game.Workspace.CurrentCamera.CFrame.LookVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z * _G.SetSpeedFly)
                    end
                elseif game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") == nil and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") == nil then
                    local bv = Instance.new("BodyVelocity")
                    local bg = Instance.new("BodyGyro")
                    bv.Name = "VelocityHandler"
                    bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    bv.MaxForce = Vector3.new(0, 0, 0)
                    bv.Velocity = Vector3.new(0, 0, 0)
                    bg.Name = "GyroHandler"
                    bg.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    bg.MaxTorque = Vector3.new(0, 0, 0)
                    bg.P = 1000
                    bg.D = 50
                end
                task.wait()
            end
        end
    }):AddKeyPicker("Fly", {
        Default = "R",
        Text = "Fly",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Misc1Group:AddButton("Teleport Rob Plushie", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4833.31, - 214, 800.529)
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace._ugcQuestObjectBobPlushie.Handle.CFrame
    end)
    Misc1Group:AddDropdown("Badge", {
        Text = "Badge",
        Values = {
            "Tinkever",
            "Null"
        },
        Default = "",
        Multi = false,
        Callback = function(Value)
            if Value == "Null" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5458, - 184, 1822)
            elseif Value == "Tinkever" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4833.31, - 214, 800.529)
            end
        end
    })
elseif game.PlaceId == 16034567693 then
    local Window = Library:CreateWindow({
        Title = "Omega X Article Hub - ADMIN ROOM",
        Center = true,
        AutoShow = true,
        Resizable = true,
        AutoLock = true,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Misc", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local InfoServer1Group = Tabs.Tab:AddLeftGroupbox("Info")
    CanYouFps = InfoServer1Group:AddLabel("Your Fps [ " .. math.floor(workspace:GetRealPhysicsFPS()) .. " ]", true)
    CanYouPing = InfoServer1Group:AddLabel("Your Ping [ " .. game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString() .. " ]", true)
    ServerPlayer = InfoServer1Group:AddLabel("Player In Server [ " .. # game.Players:GetPlayers() .. " / " .. game.Players.MaxPlayers .. " ]", true)
    TimeServer = InfoServer1Group:AddLabel("Server Time [ " .. math.floor(workspace.DistributedGameTime / 60 / 60) .. " Hour | " .. math.floor(workspace.DistributedGameTime / 60) - (math.floor(workspace.DistributedGameTime / 60 / 60) * 60) .. " Minute | " .. math.floor(workspace.DistributedGameTime) - (math.floor(workspace.DistributedGameTime / 60) * 60) .. " Second ]", true)
    TimeNow = InfoServer1Group:AddLabel("Now Time [ " .. os.date("%X") .. " ]", true)
    if tonumber(os.date("%H")) >= 5 and tonumber(os.date("%H")) < 12 then
        AlarmTime = InfoServer1Group:AddLabel("Good Morning [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
    elseif tonumber(os.date("%H")) >= 12 and tonumber(os.date("%H")) < 17 then
        AlarmTime = InfoServer1Group:AddLabel("Good Afternoon [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
    elseif tonumber(os.date("%H")) >= 17 and tonumber(os.date("%H")) < 21 then
        AlarmTime = InfoServer1Group:AddLabel("Good Evening [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
    else
        AlarmTime = InfoServer1Group:AddLabel("Good Night [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
    end
    AgeAccYou = InfoServer1Group:AddLabel("You Account Age [ " .. game.Players.LocalPlayer.AccountAge .. " ]", true)
    InfoServer1Group:AddToggle("Toggle Set", {
        Text = "Toggle Return",
        Default = false,
        Callback = function(Value)
            _G.AutoSetInfo = Value
            if _G.AutoSetInfo == true then
                AutoSetInfoServer = game:GetService("RunService").RenderStepped:Connect(function()
                    if _G.AutoSetInfo == true then
                        CanYouFps:SetText("Your Fps [ " .. math.floor(workspace:GetRealPhysicsFPS()) .. " ]", true)
                        CanYouPing:SetText("Your Ping [ " .. game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString() .. " ]", true)
                        ServerPlayer:SetText("Player In Server [ " .. # game.Players:GetPlayers() .. " / " .. game.Players.MaxPlayers .. " ]", true)
                        TimeServer:SetText("Server Time [ " .. math.floor(workspace.DistributedGameTime / 60 / 60) .. " Hour | " .. math.floor(workspace.DistributedGameTime / 60) - (math.floor(workspace.DistributedGameTime / 60 / 60) * 60) .. " Minute | " .. math.floor(workspace.DistributedGameTime) - (math.floor(workspace.DistributedGameTime / 60) * 60) .. " Second ]", true)
                        TimeNow:SetText("Now Time [ " .. os.date("%X") .. " ]", true)
                        if tonumber(os.date("%H")) >= 5 and tonumber(os.date("%H")) < 12 then
                            AlarmTime:SetText("Good Morning [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
                        elseif tonumber(os.date("%H")) >= 12 and tonumber(os.date("%H")) < 17 then
                            AlarmTime:SetText("Good Afternoon [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
                        elseif tonumber(os.date("%H")) >= 17 and tonumber(os.date("%H")) < 21 then
                            AlarmTime:SetText("Good Evening [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
                        else
                            AlarmTime:SetText("Good Night [ " .. tonumber(os.date("%H")) .. " Hour ]", true)
                        end
                        AgeAccYou:SetText("You Account Age [ " .. game.Players.LocalPlayer.AccountAge .. " ]", true)
                    end
                end)
            end
            if _G.AutoSetInfo == false then
                if AutoSetInfoServer then
                    AutoSetInfoServer:Disconnect()
                    AutoSetInfoServer = nil
                    return AutoSetInfoServer
                end
            end
        end
    })
    local Misc2Group = Tabs.Tab:AddRightGroupbox("Misc")
    Misc2Group:AddToggle("Anti Afk", {
        Text = "Anti Afk",
        Default = false,
        Callback = function(Value)
            _G.AntiAfk = Value
            for i, v in next, getconnections(game.Players.LocalPlayer.Idled) do
                if _G.AntiAfk then
                    v:Disable()
                else
                    v:Enable()
                end
            end
        end
    })
    Misc2Group:AddButton("Teleport Room", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(502, 76, 59)
        wait(4)
        Toggles["Anti Afk"]:SetValue(true)
    end)
elseif game.PlaceId == 17290438723 then
    local Window = Library:CreateWindow({
        Title = "Omega X Article Hub - Frostbite Map Obby",
        Center = true,
        AutoShow = true,
        Resizable = true,
        AutoLock = true,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Misc", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Misc1Group = Tabs.Tab:AddLeftGroupbox("Misc")
    Misc1Group:AddButton("Teleport Badge", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 554, 177, 56)
        wait(0.7)
        for i, v in ipairs(game:GetService("Workspace"):GetDescendants()) do
            if v.ClassName == "ProximityPrompt" then
                v.HoldDuration = 0
                fireproximityprompt(v)
            end
        end
    end)
elseif game.PlaceId == 18550498098 then
    local Window = Library:CreateWindow({
        Title = "Boss Guide ⚔️",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    if game.Workspace:FindFirstChild("VoidPart") == nil then
        local VoidPart = Instance.new("Part", workspace)
        VoidPart.Position = Vector3.new(538, 55, - 231)
        VoidPart.Name = "VoidPart"
        VoidPart.Size = Vector3.new(2048, 11, 2048)
        VoidPart.Anchored = true
        VoidPart.Transparency = 1
        VoidPart.CanCollide = false
        local Safe = Instance.new("Part", VoidPart)
        Safe.Position = Vector3.new(595, 120, - 330)
        Safe.Name = "Safe"
        Safe.Size = Vector3.new(2000, 10, 2000)
        Safe.Anchored = true
        Safe.Transparency = 0.5
        Safe.CanCollide = true
    end
    Tabs = {
        Tab = Window:AddTab("Misc", "rbxassetid://4370318685"),
        Tab1 = Window:AddTab("Anti", "rbxassetid://7734056608"),
        Tab2 = Window:AddTab("Local", "rbxassetid://4335489011"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Misc1Group = Tabs.Tab:AddLeftGroupbox("Prepare")
    Misc1Group:AddButton("Start Enter + 1 HP", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3258, - 68, 823)
        wait(2.8)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["the cube of life"].Part.CFrame
        wait(0.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["Big Heart"].CFrame
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.ShackLever.Base.CFrame
        wait(0.5)
        for i, v in pairs(game.Workspace:GetDescendants()) do
            if v.Name == "ShackLever" and v:FindFirstChild("ClickDetector") then
                fireclickdetector(v.ClickDetector, 0)
                fireclickdetector(v.ClickDetector, 1)
            end
        end
    end):AddButton("Start Enter", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3258, - 68, 823)
        wait(2)
        for i, v in pairs(game.Workspace:GetDescendants()) do
            if v.Name == "ShackLever" and v:FindFirstChild("ClickDetector") then
                fireclickdetector(v.ClickDetector, 0)
                fireclickdetector(v.ClickDetector, 1)
            end
        end
    end)
    Misc1Group:AddButton("Teleport Safe", function()
        if game.Workspace.VoidPart:FindFirstChild("Safe") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.VoidPart.Safe.CFrame * CFrame.new(0, 25, 0)
        end
    end):AddButton("Guide", function()
        if game.Workspace.VoidPart:FindFirstChild("Safe") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.VoidPart.Safe.CFrame * CFrame.new(0, - 40, 0)
        end
    end)
    Misc1Group:AddButton("Lever Lobby", function()
        for i, v in pairs(game.Workspace:GetDescendants()) do
            if v.Name == "Gate1Lever" and v:FindFirstChild("ClickDetector") then
                fireclickdetector(v.ClickDetector, 0)
                fireclickdetector(v.ClickDetector, 1)
            end
        end
    end)
    Misc1Group:AddInput("FlySpeed", {
        Default = "50",
        Numeric = true,
        Text = "Fly Speed",
        Placeholder = "UserFlySpeed",
        Callback = function(Value)
            _G.SetSpeedFly = Value
        end
    })
    _G.SetSpeedFly = 50
    Misc1Group:AddToggle("Start Fly", {
        Text = "Start Fly",
        Default = false,
        Callback = function(Value)
            _G.StartFly = Value
            if _G.StartFly == false then
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler:Destroy()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler:Destroy()
                    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                end
            end
            while _G.StartFly do
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
                    game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler.CFrame = Workspace.CurrentCamera.CoordinateFrame
                    game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = Vector3.new()
                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X > 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity + game.Workspace.CurrentCamera.CFrame.RightVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X * _G.SetSpeedFly)
                    end
                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X < 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity + game.Workspace.CurrentCamera.CFrame.RightVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X * _G.SetSpeedFly)
                    end
                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z > 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity - game.Workspace.CurrentCamera.CFrame.LookVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z * _G.SetSpeedFly)
                    end
                    if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z < 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity - game.Workspace.CurrentCamera.CFrame.LookVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z * _G.SetSpeedFly)
                    end
                elseif game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") == nil and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") == nil then
                    local bv = Instance.new("BodyVelocity")
                    local bg = Instance.new("BodyGyro")
                    bv.Name = "VelocityHandler"
                    bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    bv.MaxForce = Vector3.new(0, 0, 0)
                    bv.Velocity = Vector3.new(0, 0, 0)
                    bg.Name = "GyroHandler"
                    bg.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    bg.MaxTorque = Vector3.new(0, 0, 0)
                    bg.P = 1000
                    bg.D = 50
                end
                task.wait()
            end
        end
    }):AddKeyPicker("Fly", {
        Default = "R",
        Text = "Fly",
        Mode = "Toggle",
        SyncToggleState = true
    })
    local Misc2Group = Tabs.Tab:AddRightGroupbox("Combat")
    Misc2Group:AddToggle("Fight Trask", {
        Text = "Fight Trask",
        Default = false,
        Callback = function(Value)
            _G.BringTrask = Value
            while _G.BringTrask do
                if game.Workspace:FindFirstChild("TrackGloveMissile") then
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "TrackGloveMissile" then
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern") then
                                game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern").Parent = game.Players.LocalPlayer.Character
                            elseif game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
                                if game.Workspace:FindFirstChild("TrackGloveMissile") and game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
                                    game.Players.LocalPlayer.Character:FindFirstChild("Lantern"):Activate()
                                    if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
                                        game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer("Hit", v)
                                    end
                                end
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("FightTrask", {
        Default = "V",
        Text = "Fight Trask",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Misc2Group:AddToggle("Fight Boss Final", {
        Text = "Fight Boss Final",
        Default = false,
        Callback = function(Value)
            _G.FightBossFinal = Value
            while _G.FightBossFinal do
                if game.Workspace:FindFirstChild("GuideNPC") then
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "GuideNPC" and v:FindFirstChild("HumanoidRootPart") then
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern") then
                                game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern").Parent = game.Players.LocalPlayer.Character
                            elseif game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
                                if game.Workspace:FindFirstChild("GuideNPC") and game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
                                    game.Players.LocalPlayer.Character:FindFirstChild("Lantern"):Activate()
                                    if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
                                        game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer("Hit", v:FindFirstChild("HumanoidRootPart"))
                                    end
                                end
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("FightBossFinal", {
        Default = "V",
        Text = "Fight Boss Final",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Misc2Group:AddToggle("Fight Replica", {
        Text = "Fight Replica",
        Default = false,
        Callback = function(Value)
            _G.FightReplica = Value
            while _G.FightReplica do
                if game.Workspace:FindFirstChild("ReplicaNPC") then
                    for i, v in pairs(game.workspace:GetChildren()) do
                        if v.Name == "ReplicaNPC" and v:FindFirstChild("HumanoidRootPart") then
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern") then
                                game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern").Parent = game.Players.LocalPlayer.Character
                            elseif game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
                                if game.Workspace:FindFirstChild("ReplicaNPC") and game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
                                    game.Players.LocalPlayer.Character:FindFirstChild("Lantern"):Activate()
                                    if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
                                        game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer("Hit", v:FindFirstChild("HumanoidRootPart"))
                                    end
                                end
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("FightReplica", {
        Default = "V",
        Text = "Fight Replica",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Misc2Group:AddToggle("Fight Golem", {
        Text = "Fight Golem",
        Default = false,
        Callback = function(Value)
            _G.FightGolem = Value
            while _G.FightGolem do
                if game.Workspace:FindFirstChild("golem") and game.Workspace.golem:FindFirstChild("Hitbox") then
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "golem" and v:FindFirstChild("Hitbox") then
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern") then
                                game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern").Parent = game.Players.LocalPlayer.Character
                            elseif game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
                                if game.Workspace:FindFirstChild("golem") and game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
                                    game.Players.LocalPlayer.Character:FindFirstChild("Lantern"):Activate()
                                    if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
                                        game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer("Hit", v:FindFirstChild("Hitbox"))
                                    end
                                end
                            end
                        end
                    end
                elseif game.Workspace:FindFirstChild("DungeonGolem") then
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "DungeonGolem" and v:FindFirstChild("Cube.001") then
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern") then
                                game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern").Parent = game.Players.LocalPlayer.Character
                            elseif game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
                                if game.Workspace:FindFirstChild("DungeonGolem") and game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
                                    game.Players.LocalPlayer.Character:FindFirstChild("Lantern"):Activate()
                                    if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
                                        game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer("Hit", v:FindFirstChild("Cube.001"))
                                    end
                                end
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("FightGolem", {
        Default = "V",
        Text = "Fight Golem",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Misc2Group:AddToggle("Fight All", {
        Text = "Fight All",
        Default = false,
        Callback = function(Value)
            _G.FightAll = Value
            while _G.FightAll do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "TrackGloveMissile" or v.Name == "golem" or v.Name == "DungeonGolem" or v.Name == "ReplicaNPC" or v.Name == "GuideNPC" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern") then
                            game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern").Parent = game.Players.LocalPlayer.Character
                        elseif game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
                            if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
                                game.Players.LocalPlayer.Character:FindFirstChild("Lantern"):Activate()
                                if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
                                    game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer("Hit", v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Hitbox") or v:FindFirstChild("Cube.001") or v)
                                end
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    }):AddKeyPicker("FightAll", {
        Default = "O",
        Text = "Fight All",
        Mode = "Toggle",
        SyncToggleState = true
    })
    Misc2Group:AddButton("Fight Potato", function()
        if game.Workspace:FindFirstChild("PotatoLord") then
            for i, v in pairs(game.workspace:GetChildren()) do
                if v.Name == "PotatoLord" and v:FindFirstChild("HumanoidRootPart") then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern") then
                        game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern").Parent = game.Players.LocalPlayer.Character
                    elseif game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
                        if game.Workspace:FindFirstChild("PotatoLord") and game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
                            game.Players.LocalPlayer.Character:FindFirstChild("Lantern"):Activate()
                            if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
                                game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer("Hit", v.HumanoidRootPart)
                            end
                        end
                    end
                end
            end
        end
    end)
    local Anti1Group = Tabs.Tab1:AddLeftGroupbox("Anti")
    Anti1Group:AddToggle("Anti Void", {
        Text = "Anti Void",
        Default = false,
        Callback = function(Value)
            game.Workspace.VoidPart.CanCollide = Value
            if Value == true then
                game.Workspace.VoidPart.Transparency = 0.5
            else
                game.Workspace.VoidPart.Transparency = 1
            end
        end
    })
    Anti1Group:AddToggle("Anti Sbeve", {
        Text = "Anti Sbeve",
        Default = false,
        Callback = function(Value)
            _G.AntiSbeve = Value
            while _G.AntiSbeve do
                for i, v in pairs(game.Workspace.Sbeves:GetChildren()) do
                    if v.Name == "sbeveai" then
                        v.CanTouch = false
                    end
                end
                task.wait()
            end
        end
    })
    Anti1Group:AddToggle("Anti Wall", {
        Text = "Anti Wall",
        Default = false,
        Callback = function(Value)
            _G.AntiWall = Value
            while _G.AntiWall do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "PusherWall" then
                        v.CanCollide = false
                    end
                end
                task.wait()
            end
        end
    })
    local Local1Group = Tabs.Tab2:AddLeftGroupbox("Speed")
    Local1Group:AddSlider("WalkSpeed", {
        Text = "Speed",
        Default = 20,
        Min = 20,
        Max = 1000,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
            Walkspeed = Value
        end
    })
    Local1Group:AddInput("WalkSpeed1", {
        Default = "20",
        Numeric = false,
        Text = "Speed",
        Placeholder = "UserSpeed",
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
            Walkspeed = Value
        end
    })
    Local1Group:AddToggle("SetSpeed", {
        Text = "Auto Set Speed",
        Default = false,
        Callback = function(Value)
            KeepWalkspeed = Value
            while KeepWalkspeed do
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed ~= Walkspeed then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Walkspeed
                end
                task.wait()
            end
        end
    })
    local Local2Group = Tabs.Tab2:AddRightGroupbox("Jump")
    Local2Group:AddSlider("JumpPower", {
        Text = "Jump",
        Default = 50,
        Min = 50,
        Max = 1000,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
            Jumppower = Value
        end
    })
    Local2Group:AddInput("JumpPower1", {
        Default = "50",
        Numeric = true,
        Text = "Jump",
        Placeholder = "UserJump",
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
            Jumppower = Value
        end
    })
    Local2Group:AddToggle("SetJump", {
        Text = "Auto Set Jump",
        Default = false,
        Callback = function(Value)
            KeepJumppower = Value
            while KeepJumppower do
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.JumpPower ~= Jumppower then
                    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jumppower
                end
                task.wait()
            end
        end
    })
elseif game.PlaceId == 7234087065 then
    local Window = Library:CreateWindow({
        Title = "Lobby OOG 🐕",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Misc", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Misc1Group = Tabs.Tab:AddLeftGroupbox("Prepare")
    Misc1Group:AddButton("Teleport Pablo", function()
        if game.Workspace.NPCS:FindFirstChild("Pablo Pinkypoo") and game.Workspace.NPCS["Pablo Pinkypoo"]:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.NPCS["Pablo Pinkypoo"].HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
            wait(0.4)
            for i, v in ipairs(game.Workspace.DialoguePrompts:GetChildren()) do
                if v.Name == "PabloPinkyPoo" and v:FindFirstChild("ProximityPrompt") then
                    fireproximityprompt(v.ProximityPrompt)
                end
            end
        end
    end)
    Misc1Group:AddButton("Teleport Key", function()
        if game.Workspace.QuestStuff:FindFirstChild("Key") and game.Workspace.QuestStuff.Key.Transparency == 0 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.QuestStuff.Key.CFrame
            wait(0.35)
            for i, v in ipairs(game.Workspace.QuestStuff:GetChildren()) do
                if v.Name == "Key" and v:FindFirstChild("ClickDetector") then
                    fireclickdetector(v.ClickDetector, 0)
                    fireclickdetector(v.ClickDetector, 1)
                end
            end
        end
    end)
    Misc1Group:AddButton("Unlock ogg", function()
        if game.Workspace.Buildings:FindFirstChild("oog's cage") and game.Workspace.Buildings["oog's cage"]:FindFirstChild("Door") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Buildings["oog's cage"].Door.Door.CFrame * CFrame.new(- 3, 0, 0)
            wait(0.35)
            for i, v in ipairs(game.Workspace.Buildings["oog's cage"]:GetChildren()) do
                if v.Name == "Door" and v:FindFirstChild("ClickDetector") then
                    fireclickdetector(v.ClickDetector, 0)
                    fireclickdetector(v.ClickDetector, 1)
                end
            end
        end
    end)
    Misc1Group:AddButton("Click Boxer", function()
        if game.Workspace:FindFirstChild("BoxingGloves") == nil then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Buildings.house:FindFirstChild("TP").CFrame * CFrame.new(0, 10, 0)
            wait(1)
            for i, v in pairs(game.Workspace:GetChildren()) do
                if v.Name == "BoxingGloves" and v:FindFirstChild("ClickDetector") then
                    fireclickdetector(v.ClickDetector, 0)
                    fireclickdetector(v.ClickDetector, 1)
                end
            end
        else
            for i, v in pairs(game.Workspace:GetChildren()) do
                if v.Name == "BoxingGloves" and v:FindFirstChild("ClickDetector") then
                    fireclickdetector(v.ClickDetector, 0)
                    fireclickdetector(v.ClickDetector, 1)
                end
            end
        end
    end)
    Misc1Group:AddButton("Teleport Event Area", function()
        for i, v in ipairs(workspace.Signs:GetChildren()) do
            if v.Name == "Sign" and v:FindFirstChild("Text") and v.Text:FindFirstChild("ClickDetector") then
                if fireclickdetector then
                    fireclickdetector(v.Text.ClickDetector, 0)
                    fireclickdetector(v.Text.ClickDetector, 1)
                elseif not fireclickdetector then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Text.CFrame
                end
            end
        end
    end)
    Misc1Group:AddButton("Teleport Designer Roblox", function()
        repeat
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(249, 94, - 62841)
        until workspace.Buildings:FindFirstChild("wizard twoer 2")
        wait(0.8)
        for i, v in pairs(workspace.Buildings["wizard twoer 2"]:GetChildren()) do
            if v.Name == "Model" and v:FindFirstChild("Trigger") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChild("Trigger").CFrame
            end
        end
    end)
    Misc1Group:AddToggle("Auto Tp Clock", {
        Text = "Auto Teleport Clock",
        Default = false,
        Callback = function(Value)
            _G.AutoTPClock = Value
            while _G.AutoTPClock do
                for i, v in pairs(workspace.Buildings:GetChildren()) do
                    if v.Name == "wizard twoer" and v:FindFirstChild("Cone") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Cone.CFrame * CFrame.new(0, 15, 0)
                    end
                end
                task.wait()
            end
        end
    })
elseif game.PlaceId == 74169485398268 then
    local Window = Library:CreateWindow({
        Title = "Maze Bind 👁️‍🗨️",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Misc", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Misc1Group = Tabs.Tab:AddLeftGroupbox("Get / Teleport")
    Misc1Group:AddButton("Teleport Glove", function()
        if fireclickdetector then
            if game.Workspace:FindFirstChild("Orb") then
                fireclickdetector(game.Workspace.Orb.ClickDetector, 0)
                fireclickdetector(game.Workspace.Orb.ClickDetector, 1)
            end
        elseif not fireclickdetector then
            if game.Workspace:FindFirstChild("Orb") and game.Workspace.Orb:FindFirstChild("Meshes/rock chain glove_defaultglove_cell.001") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Orb["Meshes/rock chain glove_defaultglove_cell.001"].CFrame
            end
        end
    end)
elseif game.PlaceId == 102908326578005 then
    local Window = Library:CreateWindow({
        Title = "OOG Home Jorgis 🏠",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Misc", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Misc1Group = Tabs.Tab:AddLeftGroupbox("Misc")
    Misc1Group:AddButton("Ball Teleport", function()
        for i, v in ipairs(workspace.Furniture.jorgisBasketballs:GetChildren()) do
            if v.Name == "B-Ball" and v:FindFirstChild("ClickDetector") then
                if not fireclickdetector then
                    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                elseif fireclickdetector then
                    fireclickdetector(v.ClickDetector, 0)
                    fireclickdetector(v.ClickDetector, 1)
                end
            end
        end
    end)
    Misc1Group:AddButton("Key Teleport", function()
        for i, v in ipairs(workspace.Furniture.jorgisDresser:GetChildren()) do
            if v.Name == "Drawer" and v:FindFirstChild("Handle") and v.Handle:FindFirstChild("ClickDetector") then
                if not fireclickdetector then
                    v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                elseif fireclickdetector then
                    fireclickdetector(v.Handle.ClickDetector, 0)
                    fireclickdetector(v.Handle.ClickDetector, 1)
                end
            end
        end
    end)
    Misc1Group:AddButton("Teleport Door", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Furniture.finalDoor.Base.Base.CFrame
    end)
elseif game.PlaceId == 115782629143468 then
    local Window = Library:CreateWindow({
        Title = "TOH 🪜",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Misc", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Misc1Group = Tabs.Tab:AddLeftGroupbox("Misc")
    Misc1Group:AddButton("Teleport Badge", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 31, 187, 0)
    end)
elseif game.PlaceId == 92516899071319 then
    local Window = Library:CreateWindow({
        Title = "Map Dreams 💤",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Misc", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Misc1Group = Tabs.Tab:AddLeftGroupbox("Misc")
    Misc1Group:AddToggle("Auto Collect Pillow", {
        Text = "Auto Collect Pillow",
        Default = false,
        Callback = function(Value)
            _G.AutoCollectPillow = Value
            while _G.AutoCollectPillow do
                for i, v in pairs(game.Workspace.map:GetChildren()) do
                    if v.Name == "Meshes/pillow1" and v:FindFirstChild("ClickDetector") then
                        fireclickdetector(v:FindFirstChild("ClickDetector"))
                    end
                end
                task.wait()
            end
        end
    })
    Misc1Group:AddButton("Pick Up Unstable Artifact", function()
        workspace["Unstable Artifact"].Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end)
elseif game.PlaceId == 118650724506449 then
    local Window = Library:CreateWindow({
        Title = "Bad Dreams 💤",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Main", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Misc2Group = Tabs.Tab:AddLeftGroupbox("Badge")
    Misc2Group:AddButton("Teleport Badge", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.rooms["room exit"].EXIT.CFrame
    end)
elseif game.PlaceId == 97220865182663 then
    local Window = Library:CreateWindow({
        Title = "Boss Mouse 🐀",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    if workspace.Game:FindFirstChild("Buildings") and workspace.Game.Buildings:FindFirstChild("City") and workspace.Game.Buildings.City:FindFirstChild("City") == nil then
        game:GetService("ReplicatedStorage").Remotes.PlaceBuilding:FireServer("City", Vector3.new(4.6566128730773926e-09, 43.496280670166016, - 45), 0)
    end
    Tabs = {
        Tab = Window:AddTab("Main", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Misc1Group = Tabs.Tab:AddLeftGroupbox("Badge")
    Misc1Group:AddButton("Get Glove 3000 Orb", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UnlockGloveWithOrbs"):FireServer()
    end)
    Misc1Group:AddToggle("Auto Slap Rat", {
        Text = "Auto Slap Rat",
        Default = false,
        Callback = function(Value)
            _G.AutoSlapMouse = Value
            while _G.AutoSlapMouse do
                if game.Workspace:FindFirstChild("Game") and game.Workspace.Game:FindFirstChild("Enemies") then
                    for i, v in pairs(workspace.Game.Enemies:GetChildren()) do
                        if v.Name == "Rat" and v:FindFirstChild("Hitbox") then
                            v.Hitbox.Anchored = true
                            game:GetService("ReplicatedStorage").Remotes.GloveHit:FireServer(v.Hitbox)
                        end
                    end
                end
                task.wait()
            end
        end
    })
    Misc1Group:AddToggle("AutoFarm Apple", {
        Text = "AutoFarm Apple",
        Default = false,
        Callback = function(Value)
            _G.AutoFarmApple = Value
            while _G.AutoFarmApple do
                if game.Workspace:FindFirstChild("Game") and game.Workspace.Game:FindFirstChild("Buildings") then
                    for i, v in pairs(workspace.Game.Buildings:GetChildren()) do
                        if v.Name == "Farm" and v:FindFirstChild("Farm") then
                            for i, b in pairs(v:GetChildren()) do
                                if b.Name == "Farm" and b:FindFirstChild("Hitbox") then
                                    game:GetService("ReplicatedStorage").Remotes.GloveHit:FireServer(b.Hitbox)
                                end
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    })
elseif game.PlaceId == 98726100529621 then
    local Window = Library:CreateWindow({
        Title = "Map Obby Hexa 🔰",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Main", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Misc1Group = Tabs.Tab:AddLeftGroupbox("Badge")
    Misc1Group:AddButton("Get Glove", function()
        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and workspace:FindFirstChild("Part I") then
            workspace["Part I"].Obby["end"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            wait(10.5)
            repeat
                task.wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(97, 14, 644)
            until workspace["Part 2"]:FindFirstChild("Portal")
            task.wait(2.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Part 2"].Portal.CFrame
            wait(9.5)
            workspace["Part 3"].TpToNext.HitBox.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            if fireclickdetector then
                fireclickdetector(workspace["Part 3"].TpToNext.HitBox:FindFirstChild("Click"))
            end
            repeat
                task.wait()
            until workspace:FindFirstChild("Part 4")
            wait(7)
            workspace["Part 4"].TPPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            wait(7)
            workspace["Part 5"].Glove.Hitbox.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            if fireclickdetector then
                fireclickdetector(workspace["Part 5"].Glove.Hitbox:FindFirstChild("Click"))
            end
            repeat
                task.wait()
            until workspace:FindFirstChild("Finale") and workspace.Finale:FindFirstChild("Reward")
            wait(7)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Finale.Reward.Hitbox.CFrame
            if fireclickdetector then
                fireclickdetector(workspace.Finale.Reward.Hitbox:FindFirstChild("Click"))
            end
        end
    end)
elseif game.PlaceId == 136005148166028 then
    local Window = Library:CreateWindow({
        Title = "Map Designer Roblox 🛠️",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Main", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Misc1Group = Tabs.Tab:AddLeftGroupbox("Badge")
    Misc1Group:AddButton("Get Badge", function()
        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if fireclickdetector then
                fireclickdetector(workspace.Kitchen.Fridge.HitBox:FindFirstChild("ClickDetector"))
            end
            repeat
                task.wait()
            until workspace.Kitchen.Fridge:FindFirstChild("GrantAward") or workspace.Kitchen.Fridge:FindFirstChild("GrantAward") == nil
            wait(0.25)
            if fireclickdetector then
                if workspace.Kitchen.Fridge:FindFirstChild("GrantAward") then
                    fireclickdetector(workspace.Kitchen.Fridge.GrantAward:FindFirstChild("ClickDetector"))
                end
            end
            repeat
                task.wait()
            until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Brewzucki") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Brewzucki")
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Brewzucki") then
                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Brewzucki").Parent = game:GetService("Players").LocalPlayer.Backpack
            end
            wait(0.5)
            if fireclickdetector then
                if workspace.Microwave:FindFirstChild("HitBox") then
                    fireclickdetector(workspace.Microwave.HitBox:FindFirstChild("ClickDetector"))
                end
            end
            wait(0.8)
            repeat
                task.wait()
                if fireclickdetector then
                    if workspace.Microwave:FindFirstChild("HitBox") then
                        fireclickdetector(workspace.Microwave.HitBox:FindFirstChild("ClickDetector"))
                    end
                end
            until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Brewzucki") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Brewzucki")
            wait(0.2)
            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Brewzucki") then
                game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Brewzucki").Parent = game:GetService("Players").LocalPlayer.Character
            end
            wait(0.3)
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Brewzucki") then
                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Brewzucki"):Activate()
            end
            wait(3.5)
            if fireclickdetector then
                fireclickdetector(workspace.BasementTable.HitBox:FindFirstChild("ClickDetector"))
            end
            wait(1)
            if fireproximityprompt then
                fireproximityprompt(workspace.BasementDoor.Door.Base:FindFirstChild("ProximityPrompt"))
            end
            wait(0.5)
            if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("RealComputerScreenGui") ~= nil then
                if workspace.ComputerChair:FindFirstChild("Seat") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ComputerChair.Seat.CFrame
                end
                repeat
                    task.wait()
                until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("RealComputerScreenGui") and game:GetService("Players").LocalPlayer.PlayerGui.RealComputerScreenGui.Enabled == true
                wait(0.5)
                if game:GetService("Players").LocalPlayer.PlayerGui.RealComputerScreenGui.ComputerScreen:FindFirstChild("SuggestionsQTE").Visible == true then
                    repeat
                        task.wait()
                        for i, v in pairs(game.Players.LocalPlayer.PlayerGui.RealComputerScreenGui.ComputerScreen.SuggestionsQTE:GetChildren()) do
                            if v.Name:find("Popup_") then
                                v.Position = game:GetService("Players").LocalPlayer.PlayerGui.RealComputerScreenGui.ComputerScreen.SuggestionsQTE:FindFirstChild("RecyclingBin").Position
                            end
                        end
                    until game:GetService("Players").LocalPlayer.PlayerGui.RealComputerScreenGui.ComputerScreen:FindFirstChild("UpdateGameQTE").Visible == true
                    game:GetService("Players").LocalPlayer.PlayerGui.RealComputerScreenGui.ComputerScreen.UpdateGameQTE.MainFrame.PatchNotesTextBox.Text = "Articles - Hub, how do you feel, or are things in your life okay, you must be struggling, do you see you are tired or not?, Skibidi Toilet Dop Dop Yes Yes"
                    repeat
                        task.wait()
                    until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("RealComputerScreenGui") == nil
                    wait(0.5)
                    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true then
                        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Sit = false
                    end
                end
                wait(0.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Stages.Stage4:FindFirstChild("CloseDavidsDoor").CFrame
                wait(0.7)
                GuiClick = game:GetService("Players").LocalPlayer.PlayerGui.DavidShrineQTE:FindFirstChild("DavidShrineQTE")
                repeat
                    task.wait()
                    if GuiClick.Mobile.SpawnArea:FindFirstChild("TapLabel") then
                        GuiClick.Mobile.SpawnArea:FindFirstChild("TapLabel").Size = UDim2.new(1001, 0, 1001, 0)
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1, 1))
                        game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))
                    elseif GuiClick:FindFirstChild("PC").Visible == true and GuiClick.PC:FindFirstChild("QuickTimeLabel").Visible == true then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, GuiClick.PC.QuickTimeLabel.Text, false, x)
                    end
                until game:GetService("Players").LocalPlayer.PlayerGui.DavidShrineQTE.DavidShrineQTE:FindFirstChild("ScoreLabel").Visible == true and game:GetService("Players").LocalPlayer.PlayerGui.DavidShrineQTE.DavidShrineQTE:FindFirstChild("ScoreLabel").Text == "Score: 150"
            end
        end
    end)
elseif game.PlaceId == 117232463555132 then
    local Window = Library:CreateWindow({
        Title = "Map Retro Boss ⚔️",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Main", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Misc1Group = Tabs.Tab:AddLeftGroupbox("Badge")
    Misc1Group:AddButton("Get Badge", function()
        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if workspace.Map.Components.NPCs.FinalBoss:FindFirstChild("FinalBoss") and workspace.Map.Components.NPCs.FinalBoss.FinalBoss:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.Components.NPCs.FinalBoss.FinalBoss.HumanoidRootPart.CFrame * CFrame.new(0, 0, - 7)
            end
            wait(0.36)
            game:GetService("Players").LocalPlayer.PlayerGui.SkipButton:FindFirstChild("SkipDialogueButton").Position = UDim2.new(0, 0, 0, 0)
            game:GetService("Players").LocalPlayer.PlayerGui.SkipButton:FindFirstChild("SkipDialogueButton").BackgroundTransparency = 0.77
            game:GetService("Players").LocalPlayer.PlayerGui.SkipButton:FindFirstChild("SkipDialogueButton").Size = UDim2.new(1, 0, 1, 0)
            if workspace.Map.Components.NPCs.FinalBoss:FindFirstChild("FinalBoss") and workspace.Map.Components.NPCs.FinalBoss.FinalBoss:FindFirstChild("Head") then
                if fireproximityprompt then
                    fireproximityprompt(workspace.Map.Components.NPCs.FinalBoss.FinalBoss.Head:FindFirstChild("ProximityPrompt"))
                end
            end
            repeat
                task.wait()
            until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("FinalBossHealthBar") and game:GetService("Players").LocalPlayer.PlayerGui.FinalBossHealthBar:FindFirstChild("FinalBossHealthBar").Visible == true
            wait(0.5)
            repeat
                task.wait()
                if workspace.Map.Components.NPCs.FinalBoss:FindFirstChild("FinalBoss") and workspace.Map.Components.NPCs.FinalBoss.FinalBoss:FindFirstChild("HumanoidRootPart") then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Default") then
                        game.Players.LocalPlayer.Backpack:FindFirstChild("Default").Parent = game.Players.LocalPlayer.Character
                    end
                    workspace.Map.Components.NPCs.FinalBoss.FinalBoss.HumanoidRootPart.Size = Vector3.new(70, 70, 70)
                    workspace.Map.Components.NPCs.FinalBoss.FinalBoss.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, - 5)
                    game:GetService("ReplicatedStorage").Remotes.ToolSwingEvent:FireServer()
                end
            until game:GetService("Players").LocalPlayer.PlayerGui.SkipButton:FindFirstChild("SkipDialogueButton").Visible == true or game:GetService("Players").LocalPlayer.PlayerGui.FinalBossHealthBar:FindFirstChild("FinalBossHealthBar").Visible == false or workspace.Map.Components.NPCs.FinalBoss:FindFirstChild("BridgeToGlove").Transparency == 0
            workspace.Map.Components.NPCs.FinalBoss.FinalBoss.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
            repeat
                task.wait()
            until workspace.Map.Components.NPCs.FinalBoss:FindFirstChild("BridgeToGlove").Transparency == 0
            wait(1)
            if workspace.Map.Components:FindFirstChild("GloveIsland") and workspace.Map.Components.GloveIsland:FindFirstChild("ClaimGlove") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.Components.GloveIsland.ClaimGlove.CFrame
                wait(1)
                while true do
                    wait(0.3)
                    if fireproximityprompt then
                        fireproximityprompt(workspace.Map.Components.GloveIsland.ClaimGlove:FindFirstChild("ProximityPrompt"))
                    end
                end
            end
        end
    end)
elseif game.PlaceId == 132277598079047 then
    local Window = Library:CreateWindow({
        Title = "Nightmade Slender 🌑",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Main", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Misc1Group = Tabs.Tab:AddLeftGroupbox("Badge")
    Misc1Group:AddButton("Get Badge", function()
        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            for i, v in pairs(workspace:FindFirstChild("Pages"):GetChildren()) do
                if v.Name == "Page" and v:FindFirstChild("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Part.CFrame
                    wait(0.38)
                    if fireproximityprompt then
                        fireproximityprompt(v.Part:FindFirstChild("ProximityPrompt"))
                    end
                end
            end
        end
    end)
elseif game.PlaceId == 129665246576996 then
    local Window = Library:CreateWindow({
        Title = "Map Egger 🥚",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Main", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Misc1Group = Tabs.Tab:AddLeftGroupbox("Badge")
    Misc1Group:AddButton("Get Badge", function()
        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if workspace:FindFirstChild("Kenneth") and workspace.Kenneth:FindFirstChild("Head") and workspace.Kenneth.Head:FindFirstChild("ProximityPrompt") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Kenneth.Head.CFrame
                wait(0.6)
                if fireproximityprompt then
                    fireproximityprompt(workspace.Kenneth.Head.ProximityPrompt)
                end
            end
            for i, v in pairs(workspace:FindFirstChild("TrialCompletedPoints"):GetChildren()) do
                if v.Name:find("Trial") and v:FindFirstChild("root") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.root.CFrame
                    wait(0.8)
                end
            end
            wait(2.5)
            if workspace:FindFirstChild("Kenneth") and workspace.Kenneth:FindFirstChild("Head") and workspace.Kenneth.Head:FindFirstChild("ProximityPrompt") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Kenneth.Head.CFrame
                wait(0.6)
                if fireproximityprompt then
                    fireproximityprompt(workspace.Kenneth.Head.ProximityPrompt)
                end
            end
        end
    end)
elseif game.PlaceId == 136690395520488 then
    local Window = Library:CreateWindow({
        Title = "Friday the 13th 🔪",
        Center = true,
        AutoShow = true,
        Resizable = true,
        Footer = "Omega X Article Hub Version: 1.0.5",
        Icon = 83462777349222,
        ShowCustomCursor = true,
        NotifySide = "Right",
        TabPadding = 2,
        MenuFadeTime = 0
    })
    Tabs = {
        Tab = Window:AddTab("Main", "rbxassetid://4370318685"),
        ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
    }
    local Misc1Group = Tabs.Tab:AddLeftGroupbox("Badge")
    Misc1Group:AddButton("Get Badge", function()
        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Sit = false
            end
            local MapStuff = game.Workspace:FindFirstChild("Map") and game.Workspace.Map:FindFirstChild("PuzzleStuff")
            wait(0.5)
            if MapStuff:FindFirstChild("ButtonPlants") then
                for i, v in pairs(MapStuff:FindFirstChild("ButtonPlants"):GetChildren()) do
                    if v.Name == "Plant" and v:FindFirstChild("Button") and v:FindFirstChild("Hitbox") and v.Hitbox:FindFirstChild("ClickDetector") then
                        repeat
                            task.wait()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Button.CFrame
                            if fireclickdetector then
                                fireclickdetector(v.Hitbox:FindFirstChild("ClickDetector"))
                            end
                        until v.Button:FindFirstChildOfClass("Sound") and v.Button:FindFirstChildOfClass("Sound").Playing
                    end
                end
            end
            wait(0.3)
            repeat
                task.wait()
                if MapStuff:FindFirstChild("Sledgehammer") and MapStuff.Sledgehammer:FindFirstChild("Hitbox") then
                    if fireclickdetector then
                        fireclickdetector(MapStuff.Sledgehammer.Hitbox:FindFirstChild("ClickDetector"))
                    end
                end
            until game.Players.LocalPlayer.Backpack:FindFirstChild("Sledgehammer") or game.Players.LocalPlayer.Character:FindFirstChild("Sledgehammer")
            wait(0.2)
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Sledgehammer") then
                game.Players.LocalPlayer.Backpack:FindFirstChild("Sledgehammer").Parent = game.Players.LocalPlayer.Character
                wait(0.2)
            end
            if MapStuff:FindFirstChild("Glass") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = MapStuff.Glass.CFrame
                wait(0.3)
                if fireclickdetector then
                    fireclickdetector(MapStuff.Glass:FindFirstChild("ClickDetector"))
                end
            end
            wait(0.5)
            if MapStuff:FindFirstChild("AddAmountsPanel") and MapStuff.AddAmountsPanel:FindFirstChild("Screen") and MapStuff.AddAmountsPanel.Screen:FindFirstChild("SurfaceGui") and MapStuff.AddAmountsPanel.Screen.SurfaceGui:FindFirstChild("TextLabel") then
                local Value = MapStuff.AddAmountsPanel.Screen.SurfaceGui.TextLabel.Text
                Notification('Please calculate Panel the number "' .. MapStuff.AddAmountsPanel.Screen.SurfaceGui.TextLabel.Text .. '" (' .. string.sub(Value, 1, 3) .. " = " .. string.sub(Value, 4, 6) .. ")", 5)
            end
            repeat
                task.wait()
            until MapStuff:FindFirstChild("AddAmountsPanel") and MapStuff.AddAmountsPanel:FindFirstChild("Screen") and MapStuff.AddAmountsPanel.Screen:FindFirstChild("SurfaceGui") and MapStuff.AddAmountsPanel.Screen.SurfaceGui:FindFirstChild("TextLabel") and MapStuff.AddAmountsPanel.Screen.SurfaceGui.TextLabel.Text == "UNLOCKED"
            repeat
                task.wait(1.5)
                if MapStuff:FindFirstChild("ShovelChest") and MapStuff.ShovelChest:FindFirstChild("Hitbox") then
                    if fireclickdetector then
                        fireclickdetector(MapStuff.ShovelChest.Hitbox:FindFirstChild("ClickDetector"))
                    end
                end
            until game.Players.LocalPlayer.Backpack:FindFirstChild("Shovel") or game.Players.LocalPlayer.Character:FindFirstChild("Shovel")
            wait(0.5)
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Shovel") then
                game.Players.LocalPlayer.Backpack:FindFirstChild("Shovel").Parent = game.Players.LocalPlayer.Character
                wait(0.3)
            end
            if MapStuff:FindFirstChild("Grave"):FindFirstChild("Hitbox") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = MapStuff:FindFirstChild("Grave"):FindFirstChild("Hitbox").CFrame * CFrame.new(0, 25, 0)
                wait(0.3)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                wait(0.3)
                if fireclickdetector then
                    fireclickdetector(MapStuff:FindFirstChild("Grave"):FindFirstChild("Hitbox"):FindFirstChild("ClickDetector"))
                end
            end
            wait(2)
            repeat
                task.wait(0.05)
                if game.Workspace:FindFirstChild("Rig") and game.Workspace.Rig:FindFirstChild("HumanoidRootPart") then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern") then
                        game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern").Parent = game.Players.LocalPlayer.Character
                    elseif game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
                        if game.Workspace:FindFirstChild("Rig") and game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then
                            game.Players.LocalPlayer.Character:FindFirstChild("Lantern"):Activate()
                            if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then
                                game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer("Hit", game.Workspace.Rig:FindFirstChild("HumanoidRootPart"))
                            end
                        end
                    end
                end
            until workspace:FindFirstChild("Slasher") and workspace.Slasher:FindFirstChild("Glove")
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            task.wait(0.3)
            repeat
                task.wait()
                if workspace:FindFirstChild("Slasher") and workspace.Slasher:FindFirstChild("Glove") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Slasher.Glove.CFrame * CFrame.new(0, 3, 0)
                end
            until workspace:FindFirstChild("Slasher") == nil
        end
    end)
end

local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")
local CreditsGroup = Tabs["UI Settings"]:AddRightGroupbox("Credits")
local Info = Tabs["UI Settings"]:AddRightGroupbox("Info")

MenuGroup:AddDropdown("NotifySide", {
    Text = "Notification Side",
    Values = {
        "Left",
        "Right"
    },
    Default = "Right",
    Multi = false,
    Callback = function(Value)
        Library.NotifySide = Value
    end
})

_G.ChooseNotify = "Obsidian"
MenuGroup:AddDropdown("NotifyChoose", {
    Text = "Notification Choose",
    Values = {
        "Obsidian",
        "Roblox"
    },
    Default = "",
    Multi = false,
    Callback = function(Value)
        _G.ChooseNotify = Value
    end
})

_G.BackpackV2 = true
MenuGroup:AddToggle("Backpack v2", {
    Text = "Backpack v2",
    Default = true, 
    Callback = function(Value)
        _G.BackpackV2 = Value 
    end
})

_G.NotificationSound = true
MenuGroup:AddToggle("NotifySound", {
    Text = "Notification Sound",
    Default = true, 
    Callback = function(Value)
        _G.NotificationSound = Value 
    end
})

MenuGroup:AddSlider("Volume Notification", {
    Text = "Volume Notification",
    Default = 2,
    Min = 2,
    Max = 10,
    Rounding = 1,
    Compact = true,
    Callback = function(Value)
        _G.VolumeTime = Value
    end
})

MenuGroup:AddSlider("Time Notification", {
    Text = "Time Notification",
    Default = 5,
    Min = 1,
    Max = 25,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        _G.TimeNotify = Value
    end
})

MenuGroup:AddToggle("KeybindMenuOpen", {
    Default = false,
    Text = "Open Keybind Menu",
    Callback = function(Value)
        Library.KeybindFrame.Visible = Value
    end
})
MenuGroup:AddToggle("ShowCustomCursor", {
    Text = "Custom Cursor",
    Default = true,
    Callback = function(Value)
        Library.ShowCustomCursor = Value
    end
})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
    Default = "RightShift",
    NoUI = true,
    Text = "Menu keybind"
})
_G.LinkJoin = loadstring(game:HttpGet("https://pastefy.app/2LKQlhQM/raw"))()
MenuGroup:AddButton("Copy Link Discord", function()
    if setclipboard then
        setclipboard(_G.LinkJoin["Discord"])
        Library:Notify("Copied discord link to clipboard!")
    else
        Library:Notify("Discord link: " .. _G.LinkJoin["Discord"], 10)
    end
end):AddButton("Copy Link Zalo", function()
    if setclipboard then
        setclipboard(_G.LinkJoin["Zalo"])
        Library:Notify("Copied Zalo link to clipboard!")
    else
        Library:Notify("Zalo link: " .. _G.LinkJoin["Zalo"], 10)
    end
end)
MenuGroup:AddButton("Unload", function()
    Library:Unload()
end)
CreditsGroup:AddLabel("AmongUs - Python / Dex / Script", true)
CreditsGroup:AddLabel("Giang Hub - Script / Dex", true)
CreditsGroup:AddLabel("Cao Mod - Script / Dex", true)

Info:AddLabel("Counter [ " .. game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(game.Players.LocalPlayer) .. " ]", true)
Info:AddLabel("Executor [ " .. identifyexecutor() .. " ]", true)
Info:AddLabel("Job Id [ " .. game.JobId .. " ]", true)
Info:AddDivider()
Info:AddButton("Copy JobId", function()
    if setclipboard then
        setclipboard(tostring(game.JobId))
        Library:Notify("Copied Success")
    else
        Library:Notify(tostring(game.JobId), 10)
    end
end)

Info:AddInput("Join Job", {
    Default = "Nah",
    Numeric = false,
    Text = "Join Job",
    Placeholder = "UserJobId",
    Callback = function(Value)
        _G.JobIdJoin = Value
    end
})

Info:AddButton("Join JobId", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, _G.JobIdJoin, game.Players.LocalPlayer)
end)

Info:AddButton("Copy Join JobId", function()
    if setclipboard then
        setclipboard('game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, ' .. game.JobId .. ", game.Players.LocalPlayer)")
        Library:Notify("Copied Success") 
    else
        Library:Notify(tostring(game.JobId), 10)
    end
end)

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig() 
------------------------------------------------------------------------
if _G.Backpack == nil then
    _G.Backpack = {
        ["Old"] = {
            ["Hotbar"] = game:GetService("CoreGui").RobloxGui.Backpack.Hotbar.Position,
            ["Inventory"] = game:GetService("CoreGui").RobloxGui.Backpack.Inventory.Position,
            ["Backpack Number"] = {}
        },
        ["New"] = {
            ["Hotbar"] = (game:GetService("CoreGui").RobloxGui.Backpack.Hotbar.Position + UDim2.new(0, 0, 0, - 10)),
            ["Inventory"] = UDim2.new(0.5, - 100, 1, - 260),
            ["Backpack Number"] = {}
        }
    }
    wait()
    for i, v in pairs(game:GetService("CoreGui").RobloxGui.Backpack.Hotbar:GetChildren()) do
        if v:IsA("TextButton") then
            _G.Backpack["Old"]["Backpack Number"][v.Name] = v.Position
            _G.Backpack["New"]["Backpack Number"][v.Name] = UDim2.new(0, 3, 0, 3)
        end
    end
end
spawn(function()
    while true do
        if game:GetService("CoreGui").RobloxGui.Backpack:FindFirstChild("Hotbar") then
            game:GetService("CoreGui").RobloxGui.Backpack.Hotbar.Position = (_G.BackpackV2 == true and (_G.Backpack["New"]["Hotbar"]) or (_G.Backpack["Old"]["Hotbar"]))
        end
        if game:GetService("CoreGui").RobloxGui.Backpack:FindFirstChild("Inventory") then
            game:GetService("CoreGui").RobloxGui.Backpack.Inventory.Position = (_G.BackpackV2 == true and (_G.Backpack["New"]["Inventory"]) or (_G.Backpack["Old"]["Inventory"]))
        end
        for i, v in pairs(game:GetService("CoreGui").RobloxGui.Backpack.Hotbar:GetChildren()) do
            if v:IsA("TextButton") and v:FindFirstChild("Number") then
                v.Number.Position = (_G.BackpackV2 == true and (_G.Backpack["New"]["Backpack Number"][v.Name]) or (_G.Backpack["Old"]["Backpack Number"][v.Name]))
            end
        end
        if _G.BackpackV2 == true then
            for i, v in pairs(game:GetService("CoreGui").RobloxGui.Backpack.Hotbar:GetChildren()) do
                if v:IsA("TextButton") then
                    if v:FindFirstChild("Equipped") then
                        v.Equipped.Visible = false
                    end
                    if v:FindFirstChild("Equipped") and v:FindFirstChild("SelectionObjectClipper") then
                        v.SelectionObjectClipper.Visible = true
                    else
                        v.SelectionObjectClipper.Visible = false
                    end
                    if v:FindFirstChild("UICorner") == nil then
                        local RobloxUi = Instance.new("UICorner", v)
                        RobloxUi.CornerRadius = UDim.new(0, 10)
                    end
                end
            end
            for i, v in pairs(game:GetService("CoreGui").RobloxGui.Backpack.Inventory.ScrollingFrame.UIGridFrame:GetChildren()) do
                if v:IsA("TextButton") then
                    if v:FindFirstChild("Equipped") then
                        v.Equipped.Visible = false
                    end
                    if v:FindFirstChild("Equipped") and v:FindFirstChild("SelectionObjectClipper") then
                        v.SelectionObjectClipper.Visible = true
                    else
                        v.SelectionObjectClipper.Visible = false
                    end
                    if v:FindFirstChild("UICorner") == nil then
                        local RobloxUi = Instance.new("UICorner", v)
                        RobloxUi.CornerRadius = UDim.new(0, 10)
                    end
                end
            end
            for i, v in pairs(game:GetService("CoreGui").RobloxGui.Backpack.Inventory:GetChildren()) do
                if v.Name == "Search" then
                    if v:FindFirstChild("UICorner") == nil then
                        local RobloxUi = Instance.new("UICorner", v)
                        RobloxUi.CornerRadius = UDim.new(0, 10)
                    end
                    if v:FindFirstChild("X") and v["X"]:FindFirstChild("UICorner") == nil then
                        local RobloxUi = Instance.new("UICorner", v["X"])
                        RobloxUi.CornerRadius = UDim.new(0, 10)
                    end
                end
            end
            if game:GetService("CoreGui").RobloxGui.Backpack:FindFirstChild("Inventory") and game:GetService("CoreGui").RobloxGui.Backpack.Inventory:FindFirstChild("UICorner") == nil then
                local RobloxUi = Instance.new("UICorner", game:GetService("CoreGui").RobloxGui.Backpack.Inventory)
                RobloxUi.CornerRadius = UDim.new(0, 10)
            end
        elseif _G.BackpackV2 == false then
            for i, v in pairs(game:GetService("CoreGui").RobloxGui.Backpack.Hotbar:GetChildren()) do
                if v:IsA("TextButton") then
                    if v:FindFirstChild("Equipped") then
                        v.Equipped.Visible = true
                    end
                    if v:FindFirstChild("SelectionObjectClipper") then
                        v.SelectionObjectClipper.Visible = false
                    end
                    if v:FindFirstChild("UICorner") then
                        v:FindFirstChild("UICorner"):Destroy()
                    end
                end
            end
            for i, v in pairs(game:GetService("CoreGui").RobloxGui.Backpack.Inventory.ScrollingFrame.UIGridFrame:GetChildren()) do
                if v:IsA("TextButton") then
                    if v:FindFirstChild("Equipped") then
                        v.Equipped.Visible = true
                    end
                    if v:FindFirstChild("SelectionObjectClipper") then
                        v.SelectionObjectClipper.Visible = false
                    end
                    if v:FindFirstChild("UICorner") then
                        v:FindFirstChild("UICorner"):Destroy()
                    end
                end
            end
            for i, v in pairs(game:GetService("CoreGui").RobloxGui.Backpack.Inventory:GetChildren()) do
                if v.Name == "Search" then
                    if v:FindFirstChild("UICorner") then
                        v:FindFirstChild("UICorner"):Destroy()
                    end
                    if v:FindFirstChild("X") and v["X"]:FindFirstChild("UICorner") then
                        v["X"]:FindFirstChild("UICorner"):Destroy()
                    end
                end
            end
            if game:GetService("CoreGui").RobloxGui.Backpack:FindFirstChild("Inventory") and game:GetService("CoreGui").RobloxGui.Backpack.Inventory:FindFirstChild("UICorner") then
                game:GetService("CoreGui").RobloxGui.Backpack.Inventory:FindFirstChild("UICorner"):Destroy()
            end
        end
        task.wait()
    end
end)

for i, v in pairs(game:GetService("CoreGui").RobloxGui.Backpack.Hotbar:GetChildren()) do
    if v:IsA("TextButton") then
        v.MouseEnter:Connect(function()
            if _G.BackpackV2 == true then
                local sound = Instance.new("Sound", workspace)
                sound.SoundId = "rbxassetid://10066942189"
                sound.Volume = 2
                sound.PlaybackSpeed = 1
                sound.PlayOnRemove = true
                sound:Destroy()
                game:GetService("TweenService"):Create(v, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 70, 0, 70)
                }):Play()
            end
        end)
        v.MouseLeave:Connect(function()
            if _G.BackpackV2 == true then
                local sound = Instance.new("Sound", workspace)
                sound.SoundId = "rbxassetid://10066942189"
                sound.Volume = 2
                sound.PlaybackSpeed = 1
                sound.PlayOnRemove = true
                sound:Destroy()
                game:GetService("TweenService"):Create(v, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 60, 0, 60)
                }):Play()
            end
        end)
        v.MouseButton1Click:Connect(function()
            if _G.BackpackV2 == true then
                spawn(function()
                    game:GetService("TweenService"):Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 70, 0, 70)
                    }):Play()
                    local TweenGui = game:GetService("TweenService"):Create(v, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Rotation = 360
                    })
                    TweenGui:Play()
                    TweenGui.Completed:Connect(function()
                        v.Rotation = 0
                    end)
                    game:GetService("TweenService"):Create(v, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 60, 0, 60)
                    }):Play()
                end)
                local sound = Instance.new("Sound", workspace)
                sound.SoundId = "rbxassetid://10066936758"
                sound.Volume = 2
                sound.PlaybackSpeed = 1
                sound.PlayOnRemove = true
                sound:Destroy()
            end
        end)
    end
end

spawn(function()
    game:GetService("CoreGui").RobloxGui.Backpack.Inventory.ScrollingFrame.UIGridFrame.ChildAdded:Connect(function(v)
        if v:IsA("TextButton") then
            v.MouseEnter:Connect(function()
                if _G.BackpackV2 == true then
                    local sound = Instance.new("Sound", workspace)
                    sound.SoundId = "rbxassetid://10066942189"
                    sound.Volume = 2
                    sound.PlaybackSpeed = 1
                    sound.PlayOnRemove = true
                    sound:Destroy()
                    game:GetService("TweenService"):Create(v, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 70, 0, 70)
                    }):Play()
                end
            end)
            v.MouseLeave:Connect(function()
                if _G.BackpackV2 == true then
                    local sound = Instance.new("Sound", workspace)
                    sound.SoundId = "rbxassetid://10066942189"
                    sound.Volume = 2
                    sound.PlaybackSpeed = 1
                    sound.PlayOnRemove = true
                    sound:Destroy()
                    game:GetService("TweenService"):Create(v, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 60, 0, 60)
                    }):Play()
                end
            end)
            v.MouseButton1Click:Connect(function()
                if _G.BackpackV2 == true then
                    spawn(function()
                        game:GetService("TweenService"):Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = UDim2.new(0, 70, 0, 70)
                        }):Play()
                        local TweenGui = game:GetService("TweenService"):Create(v, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Rotation = 360
                        })
                        TweenGui:Play()
                        TweenGui.Completed:Connect(function()
                            v.Rotation = 0
                        end)
                        game:GetService("TweenService"):Create(v, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = UDim2.new(0, 60, 0, 60)
                        }):Play()
                    end)
                    local sound = Instance.new("Sound", workspace)
                    sound.SoundId = "rbxassetid://10066936758"
                    sound.Volume = 2
                    sound.PlaybackSpeed = 1
                    sound.PlayOnRemove = true
                    sound:Destroy()
                end
            end)
        end
    end)
end)
------------------------------------------------------------------------
gloveHits = {
    ["All"] = game.ReplicatedStorage.GeneralHit,
	------------------------------------------------------------------------
    ["Default"] = game.ReplicatedStorage.b,
    ["Extended"] = game.ReplicatedStorage.b,
    ------------------------------------------------------------------------
    ["ZZZZZZZ"] = game.ReplicatedStorage.ZZZZZZZHit,
    ["Brick"] = game.ReplicatedStorage.BrickHit,
    ["Snow"] = game.ReplicatedStorage.SnowHit,
    ["Pull"] = game.ReplicatedStorage.PullHit,
    ["Flash"] = game.ReplicatedStorage.FlashHit,
    ["Spring"] = game.ReplicatedStorage.springhit,
    ["Swapper"] = game.ReplicatedStorage.HitSwapper,
    ["Bull"] = game.ReplicatedStorage.BullHit,
    ["Dice"] = game.ReplicatedStorage.DiceHit,
    ["Ghost"] = game.ReplicatedStorage.GhostHit,
    ["Stun"] = game.ReplicatedStorage.HtStun,
    ["Za Hando"] = game.ReplicatedStorage.zhramt,
    ["Fort"] = game.ReplicatedStorage.Fort,
    ["Magnet"] = game.ReplicatedStorage.MagnetHIT,
    ["Pusher"] = game.ReplicatedStorage.PusherHit,
    ["Anchor"] = game.ReplicatedStorage.hitAnchor,
    ["Space"] = game.ReplicatedStorage.HtSpace,
    ["Boomerang"] = game.ReplicatedStorage.BoomerangH,
    ["Speedrun"] = game.ReplicatedStorage.Speedrunhit,
    ["Mail"] = game.ReplicatedStorage.MailHit,
    ["Golden"] = game.ReplicatedStorage.GoldenHit,
    ["MR"] = game.ReplicatedStorage.MisterHit,
    ["Reaper"] = game.ReplicatedStorage.ReaperHit,
    ["Replica"] = game.ReplicatedStorage.ReplicaHit,
    ["Defense"] = game.ReplicatedStorage.DefenseHit,
    ["Killstreak"] = game.ReplicatedStorage.KSHit,
    ["Reverse"] = game.ReplicatedStorage.ReverseHit,
    ["Shukuchi"] = game.ReplicatedStorage.ShukuchiHit,
    ["Duelist"] = game.ReplicatedStorage.DuelistHit,
    ["woah"] = game.ReplicatedStorage.woahHit,
    ["Ice"] = game.ReplicatedStorage.IceHit,
    ["Adios"] = game.ReplicatedStorage.hitAdios,
    ["Blocked"] = game.ReplicatedStorage.BlockedHit,
    ["Engineer"] = game.ReplicatedStorage.engiehit,
    ["Rocky"] = game.ReplicatedStorage.RockyHit,
    ["Conveyor"] = game.ReplicatedStorage.ConvHit,
    ["STOP"] = game.ReplicatedStorage.STOP,
    ["Phantom"] = game.ReplicatedStorage.PhantomHit,
    ["Wormhole"] = game.ReplicatedStorage.WormHit,
    ["Acrobat"] = game.ReplicatedStorage.AcHit,
    ["Plague"] = game.ReplicatedStorage.PlagueHit,
    ["[REDACTED]"] = game.ReplicatedStorage.ReHit,
    ["bus"] = game.ReplicatedStorage.hitbus,
    ["Phase"] = game.ReplicatedStorage.PhaseH,
    ["Warp"] = game.ReplicatedStorage.WarpHt,
    ["Bomb"] = game.ReplicatedStorage.BombHit,
    ["Bubble"] = game.ReplicatedStorage.BubbleHit,
    ["Jet"] = game.ReplicatedStorage.JetHit,
    ["Shard"] = game.ReplicatedStorage.ShardHIT,
    ["potato"] = game.ReplicatedStorage.potatohit,
    ["CULT"] = game.ReplicatedStorage.CULTHit,
    ["bob"] = game.ReplicatedStorage.bobhit,
    ["Buddies"] = game.ReplicatedStorage.buddiesHIT,
    ["Spy"] = game.ReplicatedStorage.SpyHit,
    ["Detonator"] = game.ReplicatedStorage.DetonatorHit,
    ["Rage"] = game.ReplicatedStorage.GRRRR,
    ["Trap"] = game.ReplicatedStorage.traphi,
    ["Orbit"] = game.ReplicatedStorage.Orbihit,
    ["Hybrid"] = game.ReplicatedStorage.HybridCLAP,
    ["Slapple"] = game.ReplicatedStorage.SlappleHit,
    ["Disarm"] = game.ReplicatedStorage.DisarmH,
    ["Dominance"] = game.ReplicatedStorage.DominanceHit,
    ["Link"] = game.ReplicatedStorage.LinkHit,
    ["Rojo"] = game.ReplicatedStorage.RojoHit,
    ["rob"] = game.ReplicatedStorage.robhit,
    ["Rhythm"] = game.ReplicatedStorage.rhythmhit,
    ["Nightmare"] = game.ReplicatedStorage.nightmarehit,
    ["Hitman"] = game.ReplicatedStorage.HitmanHit,
    ["Thor"] = game.ReplicatedStorage.ThorHit,
    ["Retro"] = game.ReplicatedStorage.RetroHit,
    ["Cloud"] = game.ReplicatedStorage.CloudHit,
    ["Null"] = game.ReplicatedStorage.NullHit,
    ["spin"] = game.ReplicatedStorage.spinhit,
    ------------------------------------------------------------------------
    ["Poltergeist"] = game.ReplicatedStorage.UTGHit,
    ["Clock"] = game.ReplicatedStorage.UTGHit,
    ["Untitled Tag Glove"] = game.ReplicatedStorage.UTGHit,
    ------------------------------------------------------------------------
    ["Kinetic"] = game.ReplicatedStorage.HtStun,
    ["Recall"] = game.ReplicatedStorage.HtStun,
    ["Balloony"] = game.ReplicatedStorage.HtStun,
    ["Sparky"] = game.ReplicatedStorage.HtStun,
    ["Boogie"] = game.ReplicatedStorage.HtStun,
    ["Stun"] = game.ReplicatedStorage.HtStun,
    ["Coil"] = game.ReplicatedStorage.HtStun,
    ------------------------------------------------------------------------
    ["Diamond"] = game.ReplicatedStorage.DiamondHit,
    ["Megarock"] = game.ReplicatedStorage.DiamondHit,
    ------------------------------------------------------------------------
    ["Moon"] = game.ReplicatedStorage.CelestialHit,
    ["Jupiter"] = game.ReplicatedStorage.CelestialHit,
    ------------------------------------------------------------------------
    ["Mitten"] = game.ReplicatedStorage.MittenHit,
    ["Hallow Jack"] = game.ReplicatedStorage.HallowHIT,
    ------------------------------------------------------------------------
    ["OVERKILL"] = game.ReplicatedStorage.Overkillhit,
    ["The Flex"] = game.ReplicatedStorage.FlexHit,
    ["Custom"] = game.ReplicatedStorage.CustomHit,
    ["God's Hand"] = game.ReplicatedStorage.Godshand,
    ["Error"] = game.ReplicatedStorage.Errorhit
}