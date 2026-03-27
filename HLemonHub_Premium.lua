local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "HLemon Hub | Premium Version",
   Icon = 0,
   LoadingTitle = "Loding....",
   LoadingSubtitle = "Script by Hanzo",
   Theme = "DarkBlue",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "HanzHub",
      FileName = "Hanz Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "ECxQFc97F5",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Han Key",
      Subtitle = "Key system",
      Note = "Mau Key? Buy Key Premium",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Premium_jfgue786eh767et75egyf5"}
   }
})

local Tab = Window:CreateTab("Discord Invite", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Menu")

local Button = Tab:CreateButton({
   Name = "Copy Discord Link",
   Callback = function()
      -- Ganti link di sini dengan link Discord kamu
      setclipboard("https://discord.gg/ECxQFc97F5")
      
      -- Tampilkan notifikasi bahwa link sudah dicopy
      Rayfield:Notify({
         Title = "Copied!",
         Content = "Discord link copied to clipboard.",
         Duration = 2,
         Image = 4483362458,
         Actions = {
            Ignore = {
               Name = "OK",
               Callback = function() end
            }
         }
      })
   end,
})

local Tab = Window:CreateTab("[⚙️]Setting", nil)
local Section = Tab:CreateSection("Menu")

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local infJumpEnabled = false
local infJumpConnection = nil

local Toggle = Tab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "ToggleInfJump",
   Callback = function(Value)
      infJumpEnabled = Value

      if infJumpEnabled then
         infJumpConnection = UserInputService.JumpRequest:Connect(function()
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            if humanoid then
               humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
         end)
      else
         if infJumpConnection then
            infJumpConnection:Disconnect()
            infJumpConnection = nil
         end
      end
   end,
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local aimbotEnabled = false
local targetBox = nil
local distanceLabel = nil
local connection = nil

-- Fungsi cari player terdekat
local function getClosestPlayer()
    local closest, distance = nil, math.huge
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local screenPoint, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            if onScreen then
                local dist = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                if dist < distance then
                    closest = player
                    distance = dist
                end
            end
        end
    end
    return closest
end

-- Buat ESP Box
local function createESPBox(target)
    if targetBox then targetBox:Destroy() end
    local hrp = target.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local box = Instance.new("BoxHandleAdornment")
    box.Name = "TargetBox"
    box.Adornee = hrp
    box.Size = Vector3.new(3, 6, 3)
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Color3 = Color3.fromRGB(255, 0, 0)
    box.Transparency = 0.5
    box.Parent = hrp

    targetBox = box
end

-- Buat Label Jarak
local function createDistanceLabel(target)
    if distanceLabel then distanceLabel:Destroy() end
    local head = target.Character:FindFirstChild("Head")
    if not head then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "DistanceLabel"
    billboard.Adornee = head
    billboard.Size = UDim2.new(0, 100, 0, 20)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = head

    local textLabel = Instance.new("TextLabel", billboard)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.TextStrokeTransparency = 0
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextScaled = true
    textLabel.Text = "..."

    distanceLabel = billboard

    return textLabel
end

-- Toggle Aimbot
local Toggle = Tab:CreateToggle({
   Name = "AimbotLock",
   CurrentValue = false,
   Flag = "ToggleAimbot",
   Callback = function(v)
      aimbotEnabled = v
      
      if aimbotEnabled then
         connection = RunService.RenderStepped:Connect(function()
            local target = getClosestPlayer()
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = target.Character.HumanoidRootPart
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, hrp.Position)

                createESPBox(target)

                local textLabel = createDistanceLabel(target)
                if textLabel then
                    local distance = math.floor((LocalPlayer.Character.HumanoidRootPart.Position - hrp.Position).Magnitude)
                    textLabel.Text = "Jarak: " .. distance .. "m"
                end
            end
         end)
      else
         if connection then
            connection:Disconnect()
            connection = nil
         end
         if targetBox then
            targetBox:Destroy()
            targetBox = nil
         end
         if distanceLabel then
            distanceLabel:Destroy()
            distanceLabel = nil
         end
      end
   end,
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Toggle = Tab:CreateToggle({
    Name = "Invisible",
    CurrentValue = false,
    Flag = "ToggleInvisible",
    Callback = function(Value)
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then
                part.Transparency = Value and 1 or 0
            elseif part:IsA("ParticleEmitter") or part:IsA("Trail") then
                part.Enabled = not Value
            end
        end
    end,
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local espEnabled = false
local espFolder = Instance.new("Folder", game.CoreGui)
espFolder.Name = "ESP_Objects"

local function createESP(player)
    if player == LocalPlayer then return end
    if player.Character and player.Character:FindFirstChild("Head") then
        local head = player.Character.Head

        -- Buat BillboardGui di atas kepala
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP Player"
        billboard.Adornee = head
        billboard.Size = UDim2.new(0, 100, 0, 20)
        billboard.AlwaysOnTop = true
        billboard.StudsOffset = Vector3.new(0, 2, 0)
        billboard.Parent = espFolder

        -- Tambahkan TextLabel
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = player.Name
        label.TextColor3 = Color3.fromRGB(255, 0, 0)
        label.TextStrokeTransparency = 0
        label.TextScaled = true
        label.Font = Enum.Font.SourceSansBold
        label.Parent = billboard
    end
end

local function removeAllESP()
    espFolder:ClearAllChildren()
end

-- Toggle GUI ESP
local Toggle = Tab:CreateToggle({
    Name = "ESP Player",
    CurrentValue = false,
    Flag = "ToggleESP",
    Callback = function(Value)
        espEnabled = Value

        if espEnabled then
            -- Tambahkan ESP ke semua player yang ada
            for _, player in pairs(Players:GetPlayers()) do
                createESP(player)
            end

            -- Tambahkan ESP saat player baru join
            Players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function()
                    wait(1)
                    if espEnabled then
                        createESP(player)
                    end
                end)
            end)

            -- Update jika karakter respawn
            for _, player in pairs(Players:GetPlayers()) do
                player.CharacterAdded:Connect(function()
                    wait(1)
                    if espEnabled then
                        createESP(player)
                    end
                end)
            end
        else
            -- Hapus semua ESP
            removeAllESP()
        end
    end,
})

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local Button = Tab:CreateButton({
   Name = "Rejoin Server",
   Callback = function()
      local player = Players.LocalPlayer
      TeleportService:Teleport(game.PlaceId, player)
   end,
})


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Button = Tab:CreateButton({
   Name = "Respawn",
   Callback = function()
      local character = LocalPlayer.Character
      if character then
         -- Bunuh karakter (akan respawn otomatis)
         character:BreakJoints()
      end
   end,
})

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local noclipConnection = nil

local Toggle = Tab:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Flag = "ToggleNoclip",
   Callback = function(Value)
      if Value then
         -- Nyalakan Noclip
         noclipConnection = RunService.Stepped:Connect(function()
            local character = LocalPlayer.Character
            if character then
               for _, part in pairs(character:GetDescendants()) do
                  if part:IsA("BasePart") then
                     part.CanCollide = false
                  end
               end
            end
         end)
      else
         -- Matikan Noclip
         if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
         end

         -- Kembalikan CanCollide true (opsional)
         local character = LocalPlayer.Character
         if character then
            for _, part in pairs(character:GetDescendants()) do
               if part:IsA("BasePart") then
                  part.CanCollide = true
               end
            end
         end
      end
   end,
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local walkSpeedEnabled = false
local currentSpeed = 16 -- default awal

-- 🔘 Toggle ON/OFF
local Toggle = Tab:CreateToggle({
    Name = "WalkSpeed On",
    CurrentValue = false,
    Flag = "ToggleWalkSpeed",
    Callback = function(enabled)
        walkSpeedEnabled = enabled

        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if walkSpeedEnabled then
                humanoid.WalkSpeed = currentSpeed
            else
                humanoid.WalkSpeed = 16 -- default
            end
        end
    end,
})

-- 📏 Slider
local Slider = Tab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 300},
    Increment = 10,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "SliderWalkSpeed",
    Callback = function(value)
        currentSpeed = value

        if walkSpeedEnabled then
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = currentSpeed
            end
        end
    end,
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local jumpPowerEnabled = false
local currentJumpPower = 50 -- nilai awal

-- 🔘 Toggle ON/OFF
local Toggle = Tab:CreateToggle({
    Name = "JumpPower On",
    CurrentValue = false,
    Flag = "ToggleJumpPower",
    Callback = function(enabled)
        jumpPowerEnabled = enabled

        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if jumpPowerEnabled then
                humanoid.JumpPower = currentJumpPower
            else
                humanoid.JumpPower = 50 -- default Roblox
            end
        end
    end,
})

-- 📏 Slider
local Slider = Tab:CreateSlider({
    Name = "JumpPower",
    Range = {16, 300},
    Increment = 10,
    Suffix = "JumpPower",
    CurrentValue = 50,
    Flag = "SliderJumpPower",
    Callback = function(value)
        currentJumpPower = value

        if jumpPowerEnabled then
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = currentJumpPower
            end
        end
    end,
})

local Tab = Window:CreateTab("[🥕] Grow A Garden", nil)
local Section = Tab:CreateSection("Menu")

local Button = Tab:CreateButton({
   Name = "Lunor",
   Callback = function(v)
   v = loadstring(game:HttpGet("https://lunor.dev/loader"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Alchemy",
   Callback = function(v)
   v = loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Than Hub",
   Callback = function(v)
   v = loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Speed Hub",
   Callback = function(v)
   v = loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
   end,
})

local Tab = Window:CreateTab("[🍎] Blox Fruit", nil)
local Section = Tab:CreateSection("Menu")

local Button = Tab:CreateButton({
   Name = "Redz",
   Callback = function(v)
   v = loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)
   end,
})

local Tab = Window:CreateTab("[🟣] Arise Crossover", nil)
local Section = Tab:CreateSection("Menu Coming soon")

local Tab = Window:CreateTab("[🗡] Blade ball", nil)
local Section = Tab:CreateSection("Menu Coming soon")

local Tab = Window:CreateTab("[🐟] Fisch", nil)
local Section = Tab:CreateSection("Menu Coming soon")

local Tab = Window:CreateTab("[🌮] Steal a Brainrot", nil)
local Section = Tab:CreateSection("Menu Coming soon")

STab:CreateButton({
   Name = "Discord Invite",
   Callback = function()
      setclipboard("https://discord.gg/EJkYJMt337")
      Rayfield:Notify({
         Title = "Copied!",
         Content = "Discord link copied to clipboard.",
         Duration = 2,
         Image = 4483362458,
         Actions = {
            Ignore = {
               Name = "OK",
               Callback = function() end
            }
         }
      })
   end,
})
