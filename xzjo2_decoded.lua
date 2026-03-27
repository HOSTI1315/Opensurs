

local r0_0 = "deffendersall"
local r1_0 = "https://discord.gg/wcMGAYU2Fc"
local r2_0 = "https://pastefy.app/0Ml2iFFz/raw"
local r3_0 = game:GetService("Players")
local r4_0 = game:GetService("RunService")
local r6_0 = Instance.new("ScreenGui", r3_0.LocalPlayer:WaitForChild("PlayerGui"))
r6_0.Name = "BAR1S & DEFFENDERS"
r6_0.ResetOnSpawn = false
local r7_0 = Instance.new("Frame", r6_0)
r7_0.Size = UDim2.new(0, 400, 0, 150)
r7_0.Position = UDim2.new(0.5, -200, 0.5, -75)
r7_0.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
r7_0.BorderSizePixel = 0
r7_0.Active = true
r7_0.Draggable = true
Instance.new("UICorner", r7_0).CornerRadius = UDim.new(0, 10)
local r8_0 = Instance.new("UIStroke", r7_0)
r8_0.Thickness = 3
r8_0.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
r8_0.LineJoinMode = Enum.LineJoinMode.Round
local r9_0 = 0
r4_0.RenderStepped:Connect(function(r0_3)
  r9_0 = (r9_0 + r0_3 * 0.15) % 1
  r8_0.Color = Color3.fromHSV(r9_0, 1, 1)
end)
local r10_0 = Instance.new("TextLabel", r7_0)
r10_0.Size = UDim2.new(1, 0, 0, 25)
r10_0.Position = UDim2.new(0, 10, 0, 5)
r10_0.BackgroundTransparency = 1
r10_0.Font = Enum.Font.GothamBold
r10_0.TextSize = 16
r10_0.TextXAlignment = Enum.TextXAlignment.Center
local r11_0 = "BAR1S - "
local r12_0 = "DEFFENDERS"
r10_0.Text = r11_0 .. r12_0
r4_0.RenderStepped:Connect(function(r0_5)
  local r2_5 = Color3.fromHSV(tick() * 0.25 % 1, 1, 1)
  local r6_5 = math.floor(r2_5.R * 255)
  local r8_5 = math.floor(r2_5.G * 255)
  local r10_5 = math.floor(r2_5.B * 255)
  r10_0.RichText = true
  r10_0.Text = "<font color=\'rgb(255,255,255)\'>" .. r11_0 .. "</font><font color=\'rgb(" .. r6_5 .. "," .. r8_5 .. "," .. r10_5 .. ")\'>" .. r12_0 .. "</font>"
end)
local r13_0 = Instance.new("TextBox", r7_0)
r13_0.PlaceholderText = "Enter your key..."
r13_0.Size = UDim2.new(1, -20, 0, 35)
r13_0.Position = UDim2.new(0, 10, 0, 35)
r13_0.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
r13_0.TextColor3 = Color3.fromRGB(20, 20, 20)
r13_0.Text = ""
r13_0.Font = Enum.Font.Gotham
r13_0.TextSize = 16
r13_0.BorderSizePixel = 0
Instance.new("UICorner", r13_0).CornerRadius = UDim.new(0, 6)
local r14_0 = Instance.new("TextButton", r7_0)
r14_0.Size = UDim2.new(0, 180, 0, 35)
r14_0.Position = UDim2.new(0, 10, 0, 80)
r14_0.Text = "Verify Key"
r14_0.Font = Enum.Font.GothamBold
r14_0.TextSize = 15
r14_0.TextColor3 = Color3.fromRGB(255, 255, 255)
r14_0.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
r14_0.BorderSizePixel = 0
Instance.new("UICorner", r14_0).CornerRadius = UDim.new(0, 6)
r14_0.Active = false
local r15_0 = Instance.new("TextButton", r7_0)
r15_0.Size = UDim2.new(0, 180, 0, 35)
r15_0.Position = UDim2.new(1, -190, 0, 80)
r15_0.Text = "Discord (Copy Invite)"
r15_0.Font = Enum.Font.GothamBold
r15_0.TextSize = 15
r15_0.TextColor3 = Color3.fromRGB(255, 255, 255)
r15_0.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
r15_0.BorderSizePixel = 0
Instance.new("UICorner", r15_0).CornerRadius = UDim.new(0, 6)
local r16_0 = Instance.new("TextLabel", r7_0)
r16_0.Text = "Join our Discord to get the key."
r16_0.Size = UDim2.new(1, -20, 0, 20)
r16_0.Position = UDim2.new(0, 10, 0, 120)
r16_0.BackgroundTransparency = 1
r16_0.Font = Enum.Font.Gotham
r16_0.TextSize = 13
r16_0.TextColor3 = Color3.fromRGB(220, 220, 220)
r16_0.TextXAlignment = Enum.TextXAlignment.Left
local r17_0 = Instance.new("TextLabel", r7_0)
r17_0.Text = "Status: waiting..."
r17_0.Size = UDim2.new(1, -20, 0, 20)
r17_0.Position = UDim2.new(0, 10, 1, -20)
r17_0.BackgroundTransparency = 1
r17_0.Font = Enum.Font.Gotham
r17_0.TextSize = 13
r17_0.TextColor3 = Color3.fromRGB(190, 190, 190)
r17_0.TextXAlignment = Enum.TextXAlignment.Left
local function r18_0(r0_7, r1_7)
  r17_0.Text = "Status: " .. r0_7
  if r1_7 then
    r17_0.TextColor3 = r1_7
  end
end
local function r19_0()
  if setclipboard then
    pcall(setclipboard, r1_0)
  elseif syn and syn.set_clipboard then
    pcall(syn.set_clipboard, r1_0)
  elseif toclipboard then
    pcall(toclipboard, r1_0)
  end
end
r15_0.MouseButton1Click:Connect(function()
  r19_0()
  r18_0("Invite copied! Join the Discord.", Color3.fromRGB(100, 255, 100))
end)
r13_0:GetPropertyChangedSignal("Text"):Connect(function()
  if r13_0.Text:lower() == r0_0:lower() then
    r14_0.Active = true
    r14_0.BackgroundColor3 = Color3.fromRGB(52, 170, 85)
  else
    r14_0.Active = false
    r14_0.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
  end
end)
r14_0.MouseButton1Click:Connect(function()
  if not r14_0.Active then
    return 
  end
  if r13_0.Text:lower() == r0_0:lower() then
    r18_0("Key valid! Launching script...", Color3.fromRGB(100, 255, 100))
    task.wait(0.3)
    r6_0:Destroy()
    loadstring(game:HttpGet(r2_0))()
  else
    r18_0("Invalid key. Please join the Discord.", Color3.fromRGB(255, 120, 120))
  end
end)
