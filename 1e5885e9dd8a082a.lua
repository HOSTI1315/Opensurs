

local vu1 = "5945"
local vu2 = false
local vu3 = game:GetService("HttpService")
local vu4 = game:GetService("TweenService")
local vu5 = game:GetService("UserInputService")
local vu6 = game:GetService("Players")
local vu7 = {
    "https://api.platoboost.app",
    "https://api.platoboost.net"
}
local vu8 = false
local vu9 = ""
local vu10 = 0
local vu11 = nil
local vu13 = setclipboard or (toclipboard or function(p12)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Clipboard",
        Text = "Copied to clipboard: " .. p12,
        Duration = 5
    })
end)
local vu14 = request or (http_request or syn and syn.request or (http and http.request or function()
    return {
        StatusCode = 0,
        Body = ""
    }
end))
local vu15 = gethwid or function()
    return game:GetService("RbxAnalyticsService"):GetClientId()
end
local function vu19(p16, p17, p18)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = p16,
        Text = p17,
        Duration = p18 or 5
    })
end
local function vu23(p20)
    local v21, v22 = pcall(vu3.JSONDecode, vu3, p20)
    return v21 and v22 and v22 or nil
end
local function vu27(p24)
    local v25, v26 = pcall(vu3.JSONEncode, vu3, p24)
    return v25 and v26 and v26 or "{}"
end
local function vu37(p28)
    local v29 = tostring(p28)
    local v30 = {}
    for v31 = 1, # v29 do
        table.insert(v30, string.byte(v29, v31))
    end
    local v32, v33, v34 = ipairs(v30)
    local v35 = ""
    while true do
        local v36
        v34, v36 = v32(v33, v34)
        if v34 == nil then
            break
        end
        v35 = v35 .. string.format("%02x", v36)
    end
    return v35
end
local function vu41()
    local v38 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local v39 = ""
    for _ = 1, 16 do
        local v40 = math.random(1, # v38)
        v39 = v39 .. string.sub(v38, v40, v40)
    end
    return v39
end
local function vu45(pu42)
    local v44, v44 = pcall(function()
        return vu14({
            Url = pu42 .. "/public/connectivity",
            Method = "GET",
            Timeout = 10
        })
    end)
    if v44 then
        if v44 then
            v44 = v44.StatusCode == 200 or v44.StatusCode == 429
        end
    end
    return v44
end
local function vu50()
    local v46, v47, v48 = ipairs(vu7)
    while true do
        local v49
        v48, v49 = v46(v47, v48)
        if v48 == nil then
            break
        end
        if vu45(v49) then
            vu11 = v49
            vu19("API", "Connected to " .. v49, 3)
            return true
        end
    end
    vu19("Error", "Failed to connect to API servers", 5)
    return false
end
local function vu58(p51, pu52, pu53)
    if not vu11 then
        return nil
    end
    local vu54 = vu11 .. p51
    local vu55 = {
        ["Content-Type"] = "application/json"
    }
    local v56, v57 = pcall(function()
        return vu14({
            Url = vu54,
            Method = pu52,
            Body = pu53,
            Headers = vu55,
            Timeout = 15
        })
    end)
    return v56 and v57 and v57 or nil
end
local function vu61()
    if vu10 + 600 <= os.time() then
        local v59 = vu58("/public/start", "POST", vu27({
            service = vu1,
            identifier = vu37(vu15())
        }))
        if v59 then
            if v59.StatusCode ~= 200 then
                if v59.StatusCode ~= 429 then
                    return false, "API error: " .. tostring(v59.StatusCode)
                else
                    return false, "Rate limited. Please wait 20 seconds."
                end
            else
                local v60 = vu23(v59.Body)
                if not (v60 and (v60.success and v60.data)) then
                    return false, v60 and v60.message or "Invalid response"
                end
                vu9 = v60.data.url
                vu10 = os.time()
                return true, vu9
            end
        else
            return false, "Network error"
        end
    else
        return true, vu9
    end
end
local function vu66(p62)
    if not vu11 or (vu8 or (not p62 or p62 == "")) then
        return false
    end
    vu8 = true
    local v63 = "?identifier=" .. vu37(vu15()) .. "&key=" .. p62
    if vu2 then
        v63 = v63 .. "&nonce=" .. vu41()
    end
    local v64 = vu58("/public/whitelist/" .. vu1 .. v63, "GET", nil)
    vu8 = false
    if not v64 or v64.StatusCode ~= 200 then
        return false
    end
    local v65 = vu23(v64.Body)
    return v65 and (v65.success and (v65.data and v65.data.valid)) or false
end
local function vu71(p67)
    if not vu11 then
        return false
    end
    local v68 = {
        identifier = vu37(vu15()),
        key = p67
    }
    if vu2 then
        v68.nonce = vu41()
    end
    local v69 = vu58("/public/redeem/" .. vu1, "POST", vu27(v68))
    if not v69 or v69.StatusCode ~= 200 then
        return false
    end
    local v70 = vu23(v69.Body)
    return v70 and (v70.success and (v70.data and v70.data.valid)) or false
end
local function vu75(p72)
    if not isfolder then
        return false
    end
    local v73 = "Ritter"
    local v74 = "Ritter/Key"
    if not isfolder(v73) then
        makefolder(v73)
    end
    if not isfile then
        return false
    end
    writefile(v74, p72)
    return true
end
local function vu78()
    if not isfile then
        return false, nil
    end
    local v76 = "Ritter/Key"
    if isfile(v76) then
        local v77 = readfile(v76)
        if v77 and (v77 ~= "" and (vu66(v77) and vu71(v77))) then
            return true, v77
        end
        pcall(delfile, v76)
    end
    return false, nil
end
local function vu88(pu79)
    local v80 = vu6.LocalPlayer:FindFirstChildOfClass("PlayerGui") or game:GetService("CoreGui")
    local vu81 = Instance.new("ScreenGui")
    vu81.IgnoreGuiInset = true
    vu81.ResetOnSpawn = false
    vu81.Parent = v80
    local v82 = Instance.new("Frame")
    v82.Size = UDim2.new(1, 0, 1, 0)
    v82.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    v82.Parent = vu81
    local v83 = Instance.new("Frame")
    v83.Size = UDim2.new(0.3, 0, 0.2, 0)
    v83.Position = UDim2.new(0.5, 0, 0.5, 0)
    v83.AnchorPoint = Vector2.new(0.5, 0.5)
    v83.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    v83.Parent = vu81
    Instance.new("UICorner", v83)
    local v84 = Instance.new("TextLabel")
    v84.Size = UDim2.new(1, 0, 0.5, 0)
    v84.BackgroundTransparency = 1
    v84.Text = "VERIFYING KEY..."
    v84.TextColor3 = Color3.fromRGB(255, 255, 255)
    v84.Font = Enum.Font.GothamBold
    v84.TextScaled = true
    v84.Parent = v83
    local v85 = Instance.new("Frame")
    v85.Size = UDim2.new(0.8, 0, 0.2, 0)
    v85.Position = UDim2.new(0.1, 0, 0.7, 0)
    v85.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    v85.Parent = v83
    Instance.new("UICorner", v85)
    local v86 = Instance.new("Frame")
    v86.Size = UDim2.new(0, 0, 1, 0)
    v86.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    v86.Parent = v85
    Instance.new("UICorner", v86)
    local v87 = vu4:Create(v86, TweenInfo.new(2, Enum.EasingStyle.Quad), {
        Size = UDim2.new(1, 0, 1, 0)
    })
    v87:Play()
    v87.Completed:Connect(function()
        vu81:Destroy()
        if pu79 then
            pu79()
        end
    end)
end
local function vu106(pu89, _)
    local v90 = vu6.LocalPlayer:FindFirstChildOfClass("PlayerGui") or game:GetService("CoreGui")
    local vu91 = Instance.new("ScreenGui")
    vu91.IgnoreGuiInset = true
    vu91.ResetOnSpawn = false
    vu91.Parent = v90
    local v92 = Instance.new("Frame")
    v92.Size = UDim2.new(1, 0, 1, 0)
    v92.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v92.BackgroundTransparency = 0.3
    v92.Parent = vu91
    local v93 = Instance.new("Frame")
    v93.Size = UDim2.new(0.35, 0, 0.45, 0)
    v93.Position = UDim2.new(0.5, 0, 0.5, 0)
    v93.AnchorPoint = Vector2.new(0.5, 0.5)
    v93.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    v93.Parent = vu91
    Instance.new("UICorner", v93)
    local v94 = Instance.new("UIStroke")
    v94.Color = Color3.fromRGB(80, 160, 255)
    v94.Thickness = 3
    v94.Parent = v93
    local v95 = Instance.new("TextLabel")
    v95.Size = UDim2.new(1, 0, 0.2, 0)
    v95.BackgroundTransparency = 1
    v95.Text = "KEY VERIFICATION"
    v95.TextColor3 = Color3.fromRGB(80, 160, 255)
    v95.Font = Enum.Font.GothamBold
    v95.TextSize = 24
    v95.Parent = v93
    local v96 = Instance.new("Frame")
    v96.Size = UDim2.new(0.85, 0, 0.17, 0)
    v96.Position = UDim2.new(0.075, 0, 0.3, 0)
    v96.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
    v96.Parent = v93
    Instance.new("UICorner", v96)
    local vu97 = Instance.new("TextBox")
    vu97.Size = UDim2.new(0.9, 0, 0.8, 0)
    vu97.Position = UDim2.new(0.05, 0, 0.1, 0)
    vu97.BackgroundTransparency = 1
    vu97.TextColor3 = Color3.fromRGB(255, 255, 255)
    vu97.PlaceholderText = "Enter your key here..."
    vu97.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    vu97.Font = Enum.Font.Gotham
    vu97.TextSize = 16
    vu97.ClearTextOnFocus = false
    vu97.Parent = v96
    local vu98 = Instance.new("TextButton")
    vu98.Size = UDim2.new(0.85, 0, 0.17, 0)
    vu98.Position = UDim2.new(0.075, 0, 0.55, 0)
    vu98.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    vu98.Text = "VERIFY KEY"
    vu98.TextColor3 = Color3.fromRGB(255, 255, 255)
    vu98.Font = Enum.Font.GothamBold
    vu98.TextSize = 16
    vu98.Parent = v93
    Instance.new("UICorner", vu98)
    local v99 = Instance.new("TextButton")
    v99.Size = UDim2.new(0.85, 0, 0.17, 0)
    v99.Position = UDim2.new(0.075, 0, 0.75, 0)
    v99.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
    v99.Text = "GET KEY"
    v99.TextColor3 = Color3.fromRGB(255, 255, 255)
    v99.Font = Enum.Font.GothamBold
    v99.TextSize = 16
    v99.Parent = v93
    Instance.new("UICorner", v99)
    vu98.MouseButton1Click:Connect(function()
        local vu100 = string.gsub(vu97.Text, "%s+", "")
        if vu100 == "" then
            vu19("Error", "Please enter a key", 3)
        else
            vu98.Text = "VERIFYING..."
            vu98.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            vu98.AutoButtonColor = false
            vu88(function()
                local v101 = vu66(vu100)
                if v101 then
                    v101 = vu71(vu100)
                end
                if v101 then
                    vu19("Success", "Key verified successfully!", 5)
                    pu89(vu100, true)
                    vu91:Destroy()
                else
                    vu19("Error", "Invalid key", 5)
                    vu98.Text = "VERIFY KEY"
                    vu98.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
                    vu98.AutoButtonColor = true
                    pu89(vu100, false)
                end
            end)
        end
    end)
    v99.MouseButton1Click:Connect(function()
        local v102, v103 = vu61()
        if v102 then
            vu13(v103)
            vu19("Success", "Auth link copied to clipboard!", 5)
        else
            vu19("Error", v103 or "Failed to get auth link", 5)
        end
    end)
    vu5.InputBegan:Connect(function(p104, p105)
        if not p105 and p104.KeyCode == Enum.KeyCode.Escape then
            vu91:Destroy()
        end
    end)
    return vu91
end;
(function()
    repeat
        task.wait()
    until game:IsLoaded() and vu6.LocalPlayer
    if vu50() then
        local v107, _ = vu78()
        if v107 then
            vu19("Success", "Auto-login successful!", 3)
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d29f750a5d2c74070b792230ccde0f69.lua"))()
        else
            vu106(function(p108, p109)
                if p109 then
                    vu75(p108)
                    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d29f750a5d2c74070b792230ccde0f69.lua"))()
                    vu19("Success", "Welcome! Key saved for future use.", 5)
                end
            end, function()
            end)
        end
    else
        vu19("Error", "Cannot proceed without API connection", 5)
        return
    end
end)()