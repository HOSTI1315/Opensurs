


local r0_0 = game:GetService("Players")
local r1_0 = game:GetService("TweenService")
local r2_0 = game:GetService("CoreGui")
local function r3_0()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxcc/universalscripts/refs/heads/main/sources/fisch", true))()
end
local function r4_0()
  local r0_7 = "yCNMpytG"
  local r1_7 = game:GetService("HttpService")
  local r2_7 = http_request
  if not r2_7 then
    r2_7 = request
    if not r2_7 then
      r2_7 = syn
      if r2_7 then
        r2_7 = syn.request
        if not r2_7 then
          ::label_18::
          r2_7 = fluxus
          if r2_7 then
            r2_7 = fluxus.request or http and http.request
          else
            goto label_25	-- block#6 is visited secondly
          end
        end
      else
        goto label_18	-- block#4 is visited secondly
      end
    end
  end
  request2 = r2_7
  if request2 then
    local r3_7 = {
      Url = "http://127.0.0.1:6463/rpc?v=1",
      Method = "POST",
      Headers = {
        ["Content-Type"] = "application/json",
        Origin = "https://discord.com",
      },
    }
    r3_7.Body = r1_7:JSONEncode({
      cmd = "INVITE_BROWSER",
      nonce = r1_7:GenerateGUID(false),
      args = {
        code = r0_7,
      },
    })
    request2(r3_7)
  end
  for r5_7 = 1, 25, 1 do
    print("Join .gg/yCNMpytG for more cracks!!!")
  end
  r2_7 = Instance.new("ScreenGui")
  r2_7.Name = "VenoxLoadingOverlay"
  r2_7.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  r2_7.DisplayOrder = 999999999
  r2_7.IgnoreGuiInset = true
  r2_7.Parent = r2_0
  local r3_7 = Instance.new("Frame")
  r3_7.Name = "Background"
  r3_7.Parent = r2_7
  r3_7.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
  r3_7.BorderSizePixel = 0
  r3_7.Size = UDim2.new(1, 0, 1, 0)
  local r4_7 = Instance.new("BlurEffect")
  r4_7.Parent = game:GetService("Lighting")
  r4_7.Size = 0
  local r5_7 = Instance.new("Frame")
  r5_7.Name = "GradientOverlay"
  r5_7.Parent = r3_7
  r5_7.BackgroundTransparency = 0.7
  r5_7.BorderSizePixel = 0
  r5_7.Size = UDim2.new(1, 0, 1, 0)
  local r6_7 = Instance.new("UIGradient")
  r6_7.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(98, 195, 247)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(152, 89, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(98, 195, 247))
  })
  r6_7.Parent = r5_7
  r6_7.Rotation = 45
  local r7_7 = Instance.new("Frame")
  r7_7.Name = "Container"
  r7_7.Parent = r3_7
  r7_7.AnchorPoint = Vector2.new(0.5, 0.5)
  r7_7.Position = UDim2.new(0.5, 0, 0.5, 0)
  r7_7.Size = UDim2.new(1, 0, 0, 200)
  r7_7.BackgroundTransparency = 1
  local r8_7 = Instance.new("TextLabel")
  r8_7.Name = "Title"
  r8_7.Parent = r7_7
  r8_7.BackgroundTransparency = 1
  r8_7.Position = UDim2.new(0.5, 0, 0, 0)
  r8_7.AnchorPoint = Vector2.new(0.5, 0)
  r8_7.Size = UDim2.new(0, 800, 0, 80)
  r8_7.Font = Enum.Font.GothamBold
  r8_7.Text = "CRACKED BY VENOX"
  r8_7.TextColor3 = Color3.fromRGB(255, 255, 255)
  r8_7.TextSize = 64
  r8_7.TextStrokeTransparency = 0.8
  local r9_7 = Instance.new("Frame")
  r9_7.Name = "Underline"
  r9_7.Parent = r7_7
  r9_7.AnchorPoint = Vector2.new(0.5, 0)
  r9_7.Position = UDim2.new(0.5, 0, 0, 90)
  r9_7.Size = UDim2.new(0, 0, 0, 3)
  r9_7.BorderSizePixel = 0
  r9_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  local r10_7 = Instance.new("Frame")
  r10_7.Name = "LoadingBarContainer"
  r10_7.Parent = r7_7
  r10_7.AnchorPoint = Vector2.new(0.5, 0)
  r10_7.Position = UDim2.new(0.5, 0, 0, 120)
  r10_7.Size = UDim2.new(0, 400, 0, 6)
  r10_7.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
  r10_7.BorderSizePixel = 0
  local r11_7 = Instance.new("Frame")
  r11_7.Name = "LoadingBar"
  r11_7.Parent = r10_7
  r11_7.Size = UDim2.new(0, 0, 1, 0)
  r11_7.BorderSizePixel = 0
  r11_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  local r12_7 = Instance.new("UIGradient")
  r12_7.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(98, 195, 247)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(152, 89, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(98, 195, 247))
  })
  r12_7.Parent = r11_7
  local r13_7 = Instance.new("TextLabel")
  r13_7.Name = "Status"
  r13_7.Parent = r7_7
  r13_7.BackgroundTransparency = 1
  r13_7.Position = UDim2.new(0.5, 0, 0, 140)
  r13_7.AnchorPoint = Vector2.new(0.5, 0)
  r13_7.Size = UDim2.new(0, 300, 0, 30)
  r13_7.Font = Enum.Font.Gotham
  r13_7.Text = "Initializing..."
  r13_7.TextColor3 = Color3.fromRGB(255, 255, 255)
  r13_7.TextSize = 18
  r13_7.TextTransparency = 0.2
  local r14_7 = Instance.new("TextLabel")
  r14_7.Name = "DiscordCredits"
  r14_7.Parent = r7_7
  r14_7.BackgroundTransparency = 1
  r14_7.Position = UDim2.new(0.5, 0, 0, 180)
  r14_7.AnchorPoint = Vector2.new(0.5, 0)
  r14_7.Size = UDim2.new(0, 400, 0, 30)
  r14_7.Font = Enum.Font.Gotham
  r14_7.Text = "Join discord.gg/yCNMpytG for more!"
  r14_7.TextColor3 = Color3.fromRGB(152, 89, 255)
  r14_7.TextSize = 16
  r14_7.TextTransparency = 0.2
  local r15_7 = Instance.new("TextButton")
  r15_7.Name = "DiscordButton"
  r15_7.Parent = r7_7
  r15_7.BackgroundTransparency = 1
  r15_7.Position = UDim2.new(0.5, 0, 0, 180)
  r15_7.AnchorPoint = Vector2.new(0.5, 0)
  r15_7.Size = UDim2.new(0, 400, 0, 30)
  r15_7.Font = Enum.Font.Gotham
  r15_7.Text = "Join discord.gg/yCNMpytG for more!"
  r15_7.TextColor3 = Color3.fromRGB(152, 89, 255)
  r15_7.TextSize = 16
  r15_7.TextTransparency = 0.2
  r15_7.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(r15_7, TweenInfo.new(0.3), {
      TextTransparency = 0,
      TextColor3 = Color3.fromRGB(98, 195, 247),
    }):Play()
  end)
  r15_7.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(r15_7, TweenInfo.new(0.3), {
      TextTransparency = 0.2,
      TextColor3 = Color3.fromRGB(152, 89, 255),
    }):Play()
  end)
  r15_7.MouseButton1Click:Connect(function()
    clipBoard("discord.gg/yCNMpytG")
    r15_7.Text = "Discord link copied!"
    wait(1)
    r15_7.Text = "Join discord.gg/yCNMpytG for more!"
  end)
  return r2_7, r3_7, r11_7, r13_7, r4_7
end
local r6_0, r7_0 = pcall(function()
  local r0_2, r1_2, r2_2, r3_2, r4_2 = r4_0()
  for r9_2, r10_2 in ipairs({
    {
      text = "Initializing...",
      progress = 0.2,
      func = function()
        wait(0.5)
      end,
    },
    {
      text = "Checking game...",
      progress = 0.4,
      func = function()
        wait(0.5)
      end,
    },
    {
      text = "Loading main script...",
      progress = 0.7,
      func = function()
        local r0_6, r1_6 = pcall(r3_0)
        if not r0_6 then
          warn("Script load error:", r1_6)
          r3_2.Text = "Error loading script!"
          wait(1)
          return false
        end
        return true
      end,
    },
    {
      text = "Finalizing...",
      progress = 1,
      func = function()
        wait(0.5)
      end,
    }
  }) do
    r3_2.Text = r10_2.text
    r1_0:Create(r2_2, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
      Size = UDim2.new(r10_2.progress, 0, 1, 0),
    }):Play()
    if r10_2.func() == false then
      r1_0:Create(r1_2, TweenInfo.new(1, Enum.EasingStyle.Quad), {
        BackgroundTransparency = 1,
      }):Play()
      wait(1)
      r0_2:Destroy()
      r4_2:Destroy()
      return 
    end
  end
  wait(0.5)
  local r6_2 = r1_0:Create(r1_2, TweenInfo.new(1, Enum.EasingStyle.Quad), {
    BackgroundTransparency = 1,
  })
  local r7_2 = r1_0:Create(r4_2, TweenInfo.new(1, Enum.EasingStyle.Quad), {
    Size = 0,
  })
  r6_2:Play()
  r7_2:Play()
  for r11_2, r12_2 in pairs(r0_2:GetDescendants()) do
    if r12_2:IsA("Frame") then
      r1_0:Create(r12_2, TweenInfo.new(1, Enum.EasingStyle.Quad), {
        BackgroundTransparency = 1,
      }):Play()
    elseif r12_2:IsA("TextLabel") then
      r1_0:Create(r12_2, TweenInfo.new(1, Enum.EasingStyle.Quad), {
        TextTransparency = 1,
        BackgroundTransparency = 1,
      }):Play()
    end
  end
  wait(1)
  r4_2:Destroy()
  r0_2:Destroy()
end)
if not r6_0 then
  warn("Loading error:", r7_0)
end
