local function a(a, b, c)
    local a = Instance.new(a)
    b = b or {}
    local d = b.Parent
    local e = {}
    for b, c in pairs(b) do
        if type(b) == "number" then
            table.insert(e, c)
        elseif b ~= "Parent" then
            if typeof(c) == "Instance" then
                c.Parent = a
            else
                a[b] = c
            end
        end
    end
    if c then
        local b = Instance.new("UICorner")
        b.CornerRadius = c
        b.Parent = a
    end
    for b, b in ipairs(e) do
        if typeof(b) == "Instance" then
            b.Parent = a
        end
    end
    if d then
        a.Parent = d
    end
    return a
end

if gethui():FindFirstChild("FarmHubLoader") then
    gethui():FindFirstChild("FarmHubLoader"):Destroy()
end

if not getgenv().GameName then
    getgenv().GameName = (function()
        local a, b = pcall(function()
            return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
        end)
        return (a and b) or "Jailbreak"
    end)()
end

local b = a("ScreenGui", {
    Name = "FarmHubLoader",
    Parent = gethui(),
    a("Frame", {
        Name = "Window",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(288, 150),
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
        BorderSizePixel = 0,
        a("UIStroke", {
            Color = Color3.new(1, 1, 1),
            Thickness = 1.5,
            Transparency = 0.8
        }),
        a("Folder", {
            Name = "Gradient",
            a("Frame", {
                Name = "GradientAFrame",
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                a("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                }),
                a("UIGradient", {
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(87, 166, 199)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 24, 24))
                    }),
                    Rotation = -60,
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.27),
                        NumberSequenceKeypoint.new(0.44, 1),
                        NumberSequenceKeypoint.new(1, 0.98)
                    })
                })
            }, UDim.new(0, 10)),
            a("Frame", {
                Name = "GradientBFrame",
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                a("UIGradient", {
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(87, 166, 199)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 24, 24))
                    }),
                    Rotation = -120,
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.27),
                        NumberSequenceKeypoint.new(0.44, 1),
                        NumberSequenceKeypoint.new(1, 0.98)
                    })
                }, UDim.new(0, 10))
            })
        }),
        a("Folder", {
            Name = "Shadows",
            a("Frame", {
                Name = "ShadowFrame",
                AnchorPoint = Vector2.new(0, 0),
                AutomaticSize = Enum.AutomaticSize.None,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 0, 0),
                Rotation = 0,
                Size = UDim2.new(1, 0, 1, 0),
                Visible = true,
                ClipsDescendants = false,
                a("UIStroke", {
                    Thickness = 1,
                    Transparency = 0.95
                })
            }, UDim.new(0, 10)),
            a("Frame", {
                Name = "ShadowFrame",
                AnchorPoint = Vector2.new(0, 0),
                AutomaticSize = Enum.AutomaticSize.None,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 0, 0),
                Rotation = 0,
                Size = UDim2.new(1, 0, 1, 0),
                Visible = true,
                ClipsDescendants = false,
                a("UIStroke", {
                    Thickness = 3,
                    Transparency = 0.95
                })
            }, UDim.new(0, 10)),
            a("Frame", {
                Name = "ShadowFrame",
                AnchorPoint = Vector2.new(0, 0),
                AutomaticSize = Enum.AutomaticSize.None,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 0, 0),
                Rotation = 0,
                Size = UDim2.new(1, 0, 1, 0),
                Visible = true,
                ClipsDescendants = false,
                a("UIStroke", {
                    Thickness = 5,
                    Transparency = 0.95
                })
            }, UDim.new(0, 10)),
            a("Frame", {
                Name = "ShadowFrame",
                AnchorPoint = Vector2.new(0, 0),
                AutomaticSize = Enum.AutomaticSize.None,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 0, 0),
                Rotation = 0,
                Size = UDim2.new(1, 0, 1, 0),
                Visible = true,
                ClipsDescendants = false,
                a("UIStroke", {
                    Thickness = 7,
                    Transparency = 0.95
                })
            }, UDim.new(0, 10))
        }),
        a("TextLabel", {
            Name = "Title",
            AnchorPoint = Vector2.new(0, 0),
            AutomaticSize = Enum.AutomaticSize.None,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 10, 0, 0),
            Rotation = 0,
            Size = UDim2.new(1, -20, 0, 35),
            Visible = true,
            ClipsDescendants = false,
            FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold),
            Text = "FarmHub (Loader)\n<font size=\"11\" transparency=\"0.5\">" .. tostring(getgenv().GameName) .. "</font>",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 15,
            TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
            RichText = true,
            TextStrokeTransparency = 1,
            TextTransparency = 0,
            TextTruncate = Enum.TextTruncate.None,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center
        }),
        a("Frame", {
            Name = "Separator",
            AnchorPoint = Vector2.new(0, 0),
            AutomaticSize = Enum.AutomaticSize.None,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 0.9,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 0, 0, 35),
            Rotation = 0,
            Size = UDim2.new(1, 0, 0, 1),
            Visible = true,
            ClipsDescendants = false
        }),
        a("Frame", {
            Name = "KeyFrame",
            AnchorPoint = Vector2.new(0.5, 0.5),
            AutomaticSize = Enum.AutomaticSize.None,
            BackgroundColor3 = Color3.fromRGB(35, 35, 35),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2.new(0.5, 0, 0.6, 0),
            Rotation = 0,
            Size = UDim2.new(0, 260, 0, 30),
            Visible = true,
            ClipsDescendants = false,
            a("TextLabel", {
                Name = "KeyLabelTop",
                AnchorPoint = Vector2.new(0.5, 1),
                AutomaticSize = Enum.AutomaticSize.None,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0.5, 0, 0, -11),
                Rotation = 0,
                Size = UDim2.new(1, 0, 0, 15),
                Visible = true,
                ClipsDescendants = false,
                FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold),
                Text = "Get a key from discord.gg/farmhub",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 12,
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                TextStrokeTransparency = 1,
                TextTransparency = 0,
                TextTruncate = Enum.TextTruncate.None,
                TextWrapped = false,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center
            }),
            a("TextLabel", {
                Name = "KeyStatus",
                AnchorPoint = Vector2.new(0.5, 0),
                AutomaticSize = Enum.AutomaticSize.None,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0.5, 0, 1, 8),
                Rotation = 0,
                Size = UDim2.new(1, 0, 0, 25),
                Visible = true,
                ClipsDescendants = false,
                FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold),
                Text = "Awaiting a key...",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 12,
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                TextStrokeTransparency = 1,
                TextTransparency = 0,
                TextTruncate = Enum.TextTruncate.None,
                TextWrapped = false,
                RichText = true,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center
            }),
            a("Frame", {
                Name = "KeyBox",
                AnchorPoint = Vector2.new(0, 0.5),
                AutomaticSize = Enum.AutomaticSize.None,
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = 0.85,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 0.5, 0),
                Rotation = 0,
                Size = UDim2.new(1, -35, 0, 30),
                Visible = true,
                ClipsDescendants = false,
                a("TextBox", {
                    Name = "KeyInput",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    AutomaticSize = Enum.AutomaticSize.None,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    Rotation = 0,
                    Size = UDim2.new(1, -10, 1, -10),
                    Visible = true,
                    ClipsDescendants = true,
                    FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold),
                    Text = "",
                    PlaceholderText = "Paste key here..",
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 12,
                    TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                    TextStrokeTransparency = 1,
                    TextTransparency = 0,
                    TextTruncate = Enum.TextTruncate.None,
                    TextWrapped = false,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center
                })
            }, UDim.new(01, 0)),
            a("ImageButton", {
                Name = "KeyBtn",
                AnchorPoint = Vector2.new(1, 0.5),
                AutomaticSize = Enum.AutomaticSize.None,
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = 0.80,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(1, 0, 0.5, 0),
                Size = UDim2.new(0, 30, 0, 30),
                Visible = true,
                ClipsDescendants = false,
                Image = "http://www.roblox.com/asset/?id=3926307971",
                ImageRectOffset = Vector2.new(324, 524),
                ImageRectSize = Vector2.new(36, 36),
                ScaleType = Enum.ScaleType.Crop,
                Rotation = -90
            }, UDim.new(01, 0))
        })
    }, UDim.new(0, 10))
})

local c = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()

local d = {
    ["Auto Rob"] = { RequiredRank = 0, ScriptID = "abe6a98cbcb92a402aed6f4ce61e7081" },
    ["Auto Arrest"] = { RequiredRank = 0, ScriptID = "hold" },
    ["Auto Rob UD"] = { RequiredRank = 2, ScriptID = "hold" },
    ["Crate Farm UD"] = { RequiredRank = 2, ScriptID = "hold" }
}

local e = nil

local function f(a)
    e = d[a]
    c.script_id = e.ScriptID
end

local g = b.Window.KeyFrame
local h = g.KeyBox.KeyInput
local i = g.KeyBtn
local j = g.KeyBox
local k = g.KeyLabelTop
local g = g.KeyStatus

local function l(l)
    local m
    f("Auto Rob")
    if l then
        m = c.check_key(l)
    else
        m = c.check_key(script_key or h.Text)
    end
    c.script_id = nil
    e = nil
    if (m.code == "KEY_VALID") then
        local n = 0
        if not isfolder("FarmHub") then
            makefolder("FarmHub")
        end
        if not isfile("FarmHub/auth.lrm") then
            writefile("FarmHub/auth.lrm", script_key or h.Text)
        end
        if m.data.note == "Ad Reward" then
            n = 0
        else
            n = m.data.note:gsub("Tier ", "")
            n = tonumber(n)
        end
        while not pcall(function()
            g.Text = "<font color='rgb(100, 255, 100)'>Key active!</font>\nYou are Tier " .. n .. "."
            j.Visible = false
            i.Visible = false
            k.Text = "Select a script to load."
        end) do
            task.wait()
        end
        local i = a("Frame", {
            Parent = b.Window,
            Name = "KeyFrame",
            AnchorPoint = Vector2.new(0.5, 0.5),
            AutomaticSize = Enum.AutomaticSize.None,
            BackgroundColor3 = Color3.fromRGB(35, 35, 35),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2.new(0.5, 0, 0.6, 0),
            Rotation = 0,
            Size = UDim2.new(0, 260, 0, 30),
            Visible = true,
            ClipsDescendants = false,
            a("TextButton", {
                Name = "DropdownBox",
                AnchorPoint = Vector2.new(0, 0.5),
                AutomaticSize = Enum.AutomaticSize.None,
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = 0.85,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 0.5, 0),
                Rotation = 0,
                Size = UDim2.new(1, -35, 0, 30),
                Visible = true,
                ClipsDescendants = true,
                Text = "",
                a("ImageLabel", {
                    Name = "ClickIndicator",
                    AnchorPoint = Vector2.new(1, 0),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(1, -5, 0, 7),
                    Size = UDim2.new(0, 16, 0, 16),
                    Image = "rbxassetid://11243256070",
                    ImageColor3 = Color3.fromRGB(255, 255, 255),
                    ImageTransparency = 0.3
                }),
                a("TextLabel", {
                    Name = "DropdownLabel",
                    AnchorPoint = Vector2.new(0, 0),
                    AutomaticSize = Enum.AutomaticSize.None,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    Position = UDim2.new(0, 10, 0, 0),
                    Rotation = 0,
                    Size = UDim2.new(1, -30, 0, 30),
                    Visible = true,
                    ClipsDescendants = false,
                    FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold),
                    Text = "Select a script...",
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 12,
                    TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                    TextStrokeTransparency = 1,
                    TextTransparency = 0,
                    TextTruncate = Enum.TextTruncate.None,
                    TextWrapped = false,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center
                }),
                a("Frame", {
                    Name = "OptionsContainer",
                    AnchorPoint = Vector2.new(0, 0),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 10, 0, 30),
                    Size = UDim2.new(1, -20, 1, -30),
                    Visible = false,
                    a("UIListLayout", {
                        Padding = UDim.new(0, 2),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })
                })
            }, UDim.new(1, 0)),
            a("ImageButton", {
                Name = "LoadBtn",
                AnchorPoint = Vector2.new(1, 0.5),
                AutomaticSize = Enum.AutomaticSize.None,
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = 0.80,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(1, 0, 0.5, 0),
                Size = UDim2.new(0, 30, 0, 30),
                Visible = true,
                ClipsDescendants = false,
                Image = "http://www.roblox.com/asset/?id=3926307971",
                ImageRectOffset = Vector2.new(324, 524),
                ImageRectSize = Vector2.new(36, 36),
                ScaleType = Enum.ScaleType.Crop,
                Rotation = -90
            }, UDim.new(1, 0))
        })
        local j = false
        local m = 0
        local o = {}
        for c, d in pairs(d) do
            if n >= d.RequiredRank then
                m = m + 1
                local a = a("TextButton", {
                    Parent = i.DropdownBox.OptionsContainer,
                    Name = c,
                    Size = UDim2.new(1, 0, 0, 20),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold),
                    Text = "- " .. c,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 11,
                    TextXAlignment = Enum.TextXAlignment.Left
                })
                a.MouseButton1Click:Connect(function()
                    f(c)
                    i.DropdownBox.DropdownLabel.Text = "Selected: " .. c
                    j = false
                    i.DropdownBox:TweenSize(UDim2.new(1, -35, 0, 30), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                    i.DropdownBox.UICorner.CornerRadius = UDim.new(1, 0)
                    i.DropdownBox.OptionsContainer.Visible = false
                    g.Visible = true
                    k.Visible = true
                    b.Window:TweenSize(UDim2.new(0, 288, 0, 150), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                end)
            end
        end
        local a = 30 + (m * 22) + 10
        i.DropdownBox.MouseButton1Click:Connect(function()
            if not j then
                j = true
                g.Visible = false
                i.DropdownBox:TweenSize(UDim2.new(1, -35, 0, a), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                i.DropdownBox.UICorner.CornerRadius = UDim.new(0, 8)
                task.wait(0.1)
                i.DropdownBox.OptionsContainer.Visible = true
                k.Visible = false
                b.Window:TweenSize(UDim2.new(0, 288, 0, 100 + a - 30), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
            end
        end)
        i.LoadBtn.MouseButton1Click:Connect(function()
            if e and e.ScriptID == "hold" then
                g.Text = "<font color='rgb(255, 165, 0)'>Script is not available yet.</font>"
            elseif e and e.ScriptID ~= "" then
                g.Text = "Loading script..."
                task.spawn(function()
                    task.wait(1.5)
                    if gethui():FindFirstChild("FarmHubLoader") then
                        gethui():FindFirstChild("FarmHubLoader"):Destroy()
                    end
                end)
                if l then
                    script_key = l
                else
                    script_key = script_key or h.Text
                end
                print("laucnunbg wtf?")
                c.load_script()
                return
            else
                g.Text = "<font color='rgb(255, 165, 0)'>Please select a script first!</font>"
            end
        end)
    elseif (m.code == "KEY_EXPIRED") then
        if isfile("FarmHub/auth.lrm") then
            delfile("FarmHub/auth.lrm")
        end
        while not pcall(function()
            g.Text = "<font color='rgb(255, 100, 100)'>Your key has expired.</font>"
        end) do
            task.wait()
        end
    elseif (m.code == "KEY_BANNED") then
        if isfile("FarmHub/auth.lrm") then
            delfile("FarmHub/auth.lrm")
        end
        while not pcall(function()
            g.Text = "<font color='rgb(255, 100, 100)'>!! You are blacklisted. !!</font>"
        end) do
            task.wait()
        end
    elseif (m.code == "KEY_HWID_LOCKED") then
        while not pcall(function()
            g.Text = "<font color='rgb(255, 165, 0)'>Reset your HWID using the \n#script panel on discord</font>"
        end) do
            task.wait()
        end
    elseif (m.code == "KEY_INCORRECT") then
        while not pcall(function()
            g.Text = "<font color='rgb(255, 165, 0)'>Your key is incorrect.</font>"
        end) do
            task.wait()
        end
    elseif (m.code == "KEY_INVALID") then
        while not pcall(function()
            g.Text = "<font color='rgb(255, 165, 0)'>Your key format is invalid.</font>"
        end) do
            task.wait()
        end
    else
        while not pcall(function()
            g.Text = "<font color='rgb(255, 165, 0)'>LUARMOR ERROR " .. m.code .. "</font>\n" .. m.message
        end) do
            task.wait()
        end
    end
end

local function a(a)
    if not a then
        return
    end
    if not isfolder("FarmHub") then
        makefolder("FarmHub")
    end
    if gethui():FindFirstChild("FarmHubLoader") then
        gethui():FindFirstChild("FarmHubLoader"):Destroy()
    end
    if isfile("FarmHub/auth.lrm") then
        print("alaunch wtf?")
        script_key = readfile("FarmHub/auth.lrm")
        f(a)
        c.load_script()
        return
    end
end

i.MouseButton1Click:Connect(l)

if not isfolder("FarmHub") then
    makefolder("FarmHub")
end

if isfile("FarmHub/auth.lrm") then
    print(":" .. tostring(readfile("FarmHub/auth.lrm")) .. ":")
    l(tostring(readfile("FarmHub/auth.lrm")))
end

return function(b)
    if not b then
        return
    end
    a(b)
end