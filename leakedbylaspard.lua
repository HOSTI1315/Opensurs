repeat task.wait() until game:IsLoaded()

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.IgnoreGuiInset = true

-- CARD UI
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 360, 0, 220)
frame.Position = UDim2.new(0.5, -180, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.ZIndex = 50
frame.ClipsDescendants = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 16)

-- TITLE
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 8)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.Text = "LanHubV2  : 99 Night In The Forest — Update Log"
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.ZIndex = 51

-- CONTENT
local content = Instance.new("TextLabel", frame)
content.Size = UDim2.new(1, -20, 1, -60)
content.Position = UDim2.new(0, 10, 0, 50)
content.BackgroundTransparency = 1
content.Font = Enum.Font.Gotham
content.TextSize = 13
content.TextColor3 = Color3.fromRGB(230, 230, 230)
content.TextWrapped = true
content.TextYAlignment = Enum.TextYAlignment.Top
content.ZIndex = 51
content.Text = [[ Added Auto Candy , Added Status
Update: November 5th, 2025 — Wednesday
]]

-- ANIMATION
frame.Size = UDim2.new(0, 0, 0, 0)
frame.Position = UDim2.new(10, 0, 0.5, 0)
frame.Visible = true

-- grow animation
game:GetService("TweenService"):Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
	Size = UDim2.new(0, 360, 0, 220),
	Position = UDim2.new(0.5, -180, 0.5, -110)
}):Play()

task.wait(5)

-- shrink + move down animation
local tween = game:GetService("TweenService"):Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
	Size = UDim2.new(0, 280, 0, 100),
	Position = UDim2.new(0.5, -140, 1, 40),
	BackgroundTransparency = 0.8
})
tween:Play()
tween.Completed:Wait()

frame:Destroy()
gui:Destroy()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

-- ========== BLUR ==========
local blur = Lighting:FindFirstChild("LanHubBlur") or Instance.new("BlurEffect")
blur.Name = "LanHubBlur"
blur.Size = 0
blur.Parent = Lighting
local function setBlur(on) blur.Size = on and 18 or 0 end


local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "LanHub - 99 Night In The Forest",
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by LanHub",
   Theme = "AmberGlow",
   ToggleUIKeybind = "K",

   ConfigurationSaving = {
      Enabled = true,
      FileName = "LanHub_99NITF"
   },

   KeySystem = false
})

-- Notification
Rayfield:Notify({
   Title = "LanHub Loaded!",
   Content = "Enjoy the script :)",
   Duration = 5
})

-- Tabs
local MainTab = Window:CreateTab("Main", "rocket")

-- Auto Candy Toggle
_G.Auto = false

local Toggle = MainTab:CreateToggle({
   Name = "Auto Candy",
   CurrentValue = false,
   Flag = "AutoCandy",
   Callback = function(Value)
       _G.Auto = Value
   end,
})

-- Auto Candy Logic
task.spawn(function()
   local ReplicatedStorage = game:GetService("ReplicatedStorage")
   local Event = ReplicatedStorage.RemoteEvents.CarnivalCompleteShootingGallery

   local function findTargets(parent, depth)
      if depth > 3 then return {} end
      local targets = {}

      for _, child in ipairs(parent:GetChildren()) do
         if child:IsA("BasePart") then
            table.insert(targets, child)
         end

         for _, subTarget in ipairs(findTargets(child, depth + 1)) do
            table.insert(targets, subTarget)
         end
      end

      return targets
   end

   while task.wait(2.5) do
      if not _G.Auto then continue end

      local areas = { workspace.Map, workspace.Items, workspace.Characters }
      local targets = {}

      for _, area in ipairs(areas) do
         for _, t in ipairs(findTargets(area, 0)) do
            table.insert(targets, t)
         end
      end

      for _, target in ipairs(targets) do
         if not _G.Auto then break end
         pcall(function()
            Event:FireServer(target)
         end)
         task.wait(0.05)
      end
   end
end)

-- Info Paragraph
MainTab:CreateParagraph({
   Title = "Candy Status",
   Content = "Collecting automatically when enabled."
})