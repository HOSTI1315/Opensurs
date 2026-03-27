if not game:IsLoaded() then
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Script loading",
		Text = "Waiting for the game to finish loading!",
		Duration = 5
	})
	game.Loaded:Wait()
end
		-- Instances:
local Converted = {
	["_YARHMKofi"] = Instance.new("ScreenGui");
	["_Frame"] = Instance.new("CanvasGroup");
	["_UICorner"] = Instance.new("UICorner");
	["_UIListLayout"] = Instance.new("UIListLayout");
	["_TextLabel"] = Instance.new("TextLabel");
	["_UIPadding"] = Instance.new("UIPadding");
	["_des"] = Instance.new("TextLabel");
	["_UIFlexItem"] = Instance.new("UIFlexItem");
	["_UIScale"] = Instance.new("UIScale");
	["_LocalScript"] = Instance.new("LocalScript");
	["_Frame1"] = Instance.new("Frame");
	["_donate"] = Instance.new("TextButton");
	["_UICorner1"] = Instance.new("UICorner");
	["_UIFlexItem1"] = Instance.new("UIFlexItem");
	["_UIPadding1"] = Instance.new("UIPadding");
	["_UIListLayout1"] = Instance.new("UIListLayout");
	["_remind"] = Instance.new("TextButton");
	["_UICorner2"] = Instance.new("UICorner");
	["_UIPadding2"] = Instance.new("UIPadding");
	["_UIFlexItem2"] = Instance.new("UIFlexItem");
	["_dontshow"] = Instance.new("TextButton");
	["_UICorner3"] = Instance.new("UICorner");
	["_UIPadding3"] = Instance.new("UIPadding");
	["_UIFlexItem3"] = Instance.new("UIFlexItem");
}
-- Properties:
Converted["_YARHMKofi"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_YARHMKofi"].Name = "YARHMKofi"
Converted["_YARHMKofi"].Parent = game:GetService("CoreGui")
Converted["_Frame"].GroupTransparency = 1
Converted["_Frame"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(30.00000201165676, 30.00000201165676, 30.00000201165676)
Converted["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame"].BorderSizePixel = 0
Converted["_Frame"].Position = UDim2.new(0.5, 0, 0.699999988, 0)
Converted["_Frame"].Size = UDim2.new(0, 350, 0, 250)
Converted["_Frame"].Name = "Frame"
Converted["_Frame"].Parent = Converted["_YARHMKofi"]
Converted["_UICorner"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner"].Parent = Converted["_Frame"]
Converted["_UIListLayout"].Padding = UDim.new(0, 8)
Converted["_UIListLayout"].HorizontalAlignment = Enum.HorizontalAlignment.Center
Converted["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout"].Parent = Converted["_Frame"]
Converted["_TextLabel"].Font = Enum.Font.GothamBold
Converted["_TextLabel"].Text = "YARHM has been proudly keyless"
Converted["_TextLabel"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].TextScaled = true
Converted["_TextLabel"].TextSize = 14
Converted["_TextLabel"].TextWrapped = true
Converted["_TextLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].BackgroundTransparency = 1
Converted["_TextLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel"].BorderSizePixel = 0
Converted["_TextLabel"].Size = UDim2.new(1, 0, 0, 20)
Converted["_TextLabel"].Parent = Converted["_Frame"]
Converted["_UIPadding"].PaddingBottom = UDim.new(0, 16)
Converted["_UIPadding"].PaddingLeft = UDim.new(0, 16)
Converted["_UIPadding"].PaddingRight = UDim.new(0, 16)
Converted["_UIPadding"].PaddingTop = UDim.new(0, 16)
Converted["_UIPadding"].Parent = Converted["_Frame"]
Converted["_des"].Font = Enum.Font.Gotham
Converted["_des"].RichText = true
Converted["_des"].Text = ""
Converted["_des"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_des"].TextScaled = true
Converted["_des"].TextSize = 11
Converted["_des"].TextWrapped = true
Converted["_des"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_des"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_des"].BackgroundTransparency = 1
Converted["_des"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_des"].BorderSizePixel = 0
Converted["_des"].Size = UDim2.new(1, 0, 0, 0)
Converted["_des"].Name = "des"
Converted["_des"].Parent = Converted["_Frame"]
Converted["_UIFlexItem"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem"].Parent = Converted["_des"]
Converted["_UIScale"].Scale = 0.8999999761581421
Converted["_UIScale"].Parent = Converted["_Frame"]
Converted["_Frame1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Frame1"].BackgroundTransparency = 1
Converted["_Frame1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame1"].BorderSizePixel = 0
Converted["_Frame1"].Size = UDim2.new(1, 0, 0, 30)
Converted["_Frame1"].Parent = Converted["_Frame"]
Converted["_donate"].Font = Enum.Font.Gotham
Converted["_donate"].Text = "Donate through Ko-fi"
Converted["_donate"].TextColor3 = Color3.fromRGB(170.0000050663948, 255, 130.0000074505806)
Converted["_donate"].TextScaled = true
Converted["_donate"].TextSize = 14
Converted["_donate"].TextWrapped = true
Converted["_donate"].BackgroundColor3 = Color3.fromRGB(20.000000707805157, 46.000001057982445, 0)
Converted["_donate"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_donate"].BorderSizePixel = 0
Converted["_donate"].LayoutOrder = 1
Converted["_donate"].Size = UDim2.new(0, 0, 1, 0)
Converted["_donate"].Name = "donate"
Converted["_donate"].Parent = Converted["_Frame1"]
Converted["_UICorner1"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner1"].Parent = Converted["_donate"]
Converted["_UIFlexItem1"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem1"].Parent = Converted["_donate"]
Converted["_UIPadding1"].PaddingBottom = UDim.new(0, 3)
Converted["_UIPadding1"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding1"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding1"].PaddingTop = UDim.new(0, 3)
Converted["_UIPadding1"].Parent = Converted["_donate"]
Converted["_UIListLayout1"].Padding = UDim.new(0, 5)
Converted["_UIListLayout1"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout1"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout1"].Parent = Converted["_Frame1"]
Converted["_remind"].Font = Enum.Font.Gotham
Converted["_remind"].Text = "Remind me later"
Converted["_remind"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_remind"].TextScaled = true
Converted["_remind"].TextSize = 14
Converted["_remind"].TextWrapped = true
Converted["_remind"].BackgroundColor3 = Color3.fromRGB(46.000001057982445, 46.000001057982445, 46.000001057982445)
Converted["_remind"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_remind"].BorderSizePixel = 0
Converted["_remind"].Size = UDim2.new(0, 0, 1, 0)
Converted["_remind"].Name = "remind"
Converted["_remind"].Parent = Converted["_Frame1"]
Converted["_UICorner2"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner2"].Parent = Converted["_remind"]
Converted["_UIPadding2"].PaddingBottom = UDim.new(0, 3)
Converted["_UIPadding2"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding2"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding2"].PaddingTop = UDim.new(0, 3)
Converted["_UIPadding2"].Parent = Converted["_remind"]
Converted["_UIFlexItem2"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem2"].Parent = Converted["_remind"]
Converted["_dontshow"].Font = Enum.Font.Gotham
Converted["_dontshow"].Text = "Don't show again"
Converted["_dontshow"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_dontshow"].TextScaled = true
Converted["_dontshow"].TextSize = 14
Converted["_dontshow"].TextWrapped = true
Converted["_dontshow"].BackgroundColor3 = Color3.fromRGB(46.000001057982445, 46.000001057982445, 46.000001057982445)
Converted["_dontshow"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_dontshow"].BorderSizePixel = 0
Converted["_dontshow"].LayoutOrder = 2
Converted["_dontshow"].Size = UDim2.new(0, 0, 1, 0)
Converted["_dontshow"].Name = "dontshow"
Converted["_dontshow"].Parent = Converted["_Frame1"]
Converted["_UICorner3"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner3"].Parent = Converted["_dontshow"]
Converted["_UIPadding3"].PaddingBottom = UDim.new(0, 3)
Converted["_UIPadding3"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding3"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding3"].PaddingTop = UDim.new(0, 3)
Converted["_UIPadding3"].Parent = Converted["_dontshow"]
Converted["_UIFlexItem3"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem3"].Parent = Converted["_dontshow"]
-- Module Scripts:
local module_scripts = {}
-- Routine Local Scripts:
local function PAXXQX_routine() -- Script: StarterGui.YARHMKofi.Frame.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_Frame"]
    local req = require
    local require = function(obj)
        local fake = module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end
        local DontShow
        pcall(function()
            DontShow = readfile("YARHMNoShowKofi.switch") 
        end)
	if DontShow == "1" or math.random(1, 5) ~= 1 then
		script.Parent.Parent:Destroy()
		return	
	end
	local ts = game:GetService("TweenService")
	
	local dft = TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
	
	
	script.Parent.des.Text = [[..and will always be.
	We've been able to serve hundreds of thousands of requests per day, active, live websites, AI integrations and more awesome stuff, <b>without shoving a single adlink to our users</b> (let alone force you to go through more than 6.. but hey yarhm's not that kinda script).
	The team has not pulled a single cent out of any of our products, including YARHM and AFEM. We do not do PAID ads. Advertisements in-script are often from the team ourselves.
	
	We're only looking for additional support through our <b>Ko-fi</b> page! This way, we can continue to improve and add new features to our products with your support.
	Don't worry, we're still keyless. For a very, very long while.]]
	
	ts:Create(script.Parent, dft, {
		GroupTransparency = 0
	}):Play()
	ts:Create(script.Parent.UIScale, dft, {
		Scale = 1
	}):Play()
	
	script.Parent.Frame.donate.MouseButton1Click:Connect(function()
		setclipboard("https://ko-fi.com/goteam")
		script.Parent.Frame.donate.Text = "Link copied to clipboard"
	end)
	
	script.Parent.Frame.remind.MouseButton1Click:Connect(function()
		ts:Create(script.Parent, dft, {
			GroupTransparency = 1
		}):Play()
		ts:Create(script.Parent.UIScale, dft, {
			Scale = 0.9
		}):Play()
		
		task.wait(1.1)
		script.Parent.Parent:Destroy()
	end)
	
	script.Parent.Frame.dontshow.MouseButton1Click:Connect(function()
		writefile("YARHMNoShowKofi.switch", '1')
		
		ts:Create(script.Parent, dft, {
			GroupTransparency = 1
		}):Play()
		ts:Create(script.Parent.UIScale, dft, {
			Scale = 0.9
		}):Play()
	
		task.wait(1.1)
		script.Parent.Parent:Destroy()
	end)
end
coroutine.wrap(PAXXQX_routine)()