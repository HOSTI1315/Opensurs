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
	["_YARHMAd"] = Instance.new("ScreenGui");
	["_Frame"] = Instance.new("Frame");
	["_UICorner"] = Instance.new("UICorner");
	["_UIGradient"] = Instance.new("UIGradient");
	["_UIStroke"] = Instance.new("UIStroke");
	["_UIGradient1"] = Instance.new("UIGradient");
	["_Animator"] = Instance.new("LocalScript");
	["_UIPadding"] = Instance.new("UIPadding");
	["_UIListLayout"] = Instance.new("UIListLayout");
	["_Title"] = Instance.new("TextLabel");
	["_CTA"] = Instance.new("TextButton");
	["_UICorner1"] = Instance.new("UICorner");
	["_UIPadding1"] = Instance.new("UIPadding");
	["_LocalScript"] = Instance.new("LocalScript");
	["_LocalScript1"] = Instance.new("LocalScript");
	["_Progress"] = Instance.new("Frame");
	["_UICorner2"] = Instance.new("UICorner");
	["_Progress1"] = Instance.new("Frame");
	["_UICorner3"] = Instance.new("UICorner");
	["_ImageLabel"] = Instance.new("ImageLabel");
	["_UICorner4"] = Instance.new("UICorner");
	["_ScriptWarning"] = Instance.new("TextLabel");
	["_UIStroke1"] = Instance.new("UIStroke");
}
-- Properties:
Converted["_YARHMAd"].DisplayOrder = 999999999
Converted["_YARHMAd"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_YARHMAd"].Name = "YARHMAd"
Converted["_YARHMAd"].Parent = game:GetService("CoreGui")
Converted["_Frame"].AnchorPoint = Vector2.new(1, 1)
Converted["_Frame"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame"].BorderSizePixel = 0
Converted["_Frame"].Position = UDim2.new(1.5, 0, 1, -10)
Converted["_Frame"].Size = UDim2.new(0, 283, 0, 0)
Converted["_Frame"].Parent = Converted["_YARHMAd"]
Converted["_UICorner"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner"].Parent = Converted["_Frame"]
Converted["_UIGradient"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(36.00000165402889, 36.00000165402889, 36.00000165402889)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(68.00000354647636, 68.00000354647636, 68.00000354647636))
}
Converted["_UIGradient"].Rotation = 68
Converted["_UIGradient"].Parent = Converted["_Frame"]
Converted["_UIStroke"].Color = Color3.fromRGB(255, 255, 255)
Converted["_UIStroke"].Thickness = 2
Converted["_UIStroke"].Parent = Converted["_Frame"]
Converted["_UIGradient1"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(53.00000064074993, 53.00000064074993, 53.00000064074993)),
	ColorSequenceKeypoint.new(0.15224914252758026, Color3.fromRGB(50.69031357765198, 50.69031357765198, 50.69031357765198)),
	ColorSequenceKeypoint.new(0.4723183512687683, Color3.fromRGB(255, 0, 4.000000236555934)),
	ColorSequenceKeypoint.new(0.7577854990959167, Color3.fromRGB(50.13314567506313, 50.13314567506313, 50.13314567506313)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(48.000000938773155, 48.000000938773155, 48.000000938773155))
}
Converted["_UIGradient1"].Rotation = 123
Converted["_UIGradient1"].Parent = Converted["_UIStroke"]
Converted["_UIPadding"].PaddingBottom = UDim.new(0, 10)
Converted["_UIPadding"].PaddingLeft = UDim.new(0, 10)
Converted["_UIPadding"].PaddingRight = UDim.new(0, 10)
Converted["_UIPadding"].PaddingTop = UDim.new(0, 10)
Converted["_UIPadding"].Parent = Converted["_Frame"]
Converted["_UIListLayout"].Padding = UDim.new(0, 8)
Converted["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_UIListLayout"].Parent = Converted["_Frame"]
Converted["_Title"].Font = Enum.Font.Gotham
Converted["_Title"].RichText = true
Converted["_Title"].Text = "title"
Converted["_Title"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Title"].TextScaled = true
Converted["_Title"].TextSize = 14
Converted["_Title"].TextWrapped = true
Converted["_Title"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Title"].BackgroundTransparency = 1
Converted["_Title"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Title"].BorderSizePixel = 0
Converted["_Title"].LayoutOrder = -1
Converted["_Title"].Size = UDim2.new(1, 0, 0, 20)
Converted["_Title"].Name = "Title"
Converted["_Title"].Parent = Converted["_Frame"]
Converted["_CTA"].Font = Enum.Font.Gotham
Converted["_CTA"].Text = "cta"
Converted["_CTA"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_CTA"].TextScaled = true
Converted["_CTA"].TextSize = 14
Converted["_CTA"].TextWrapped = true
Converted["_CTA"].BackgroundColor3 = Color3.fromRGB(46.000001057982445, 46.000001057982445, 46.000001057982445)
Converted["_CTA"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_CTA"].BorderSizePixel = 0
Converted["_CTA"].LayoutOrder = 2
Converted["_CTA"].Size = UDim2.new(1, 0, 0, 35)
Converted["_CTA"].Name = "CTA"
Converted["_CTA"].Parent = Converted["_Frame"]
Converted["_UICorner1"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner1"].Parent = Converted["_CTA"]
Converted["_UIPadding1"].PaddingBottom = UDim.new(0, 7)
Converted["_UIPadding1"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding1"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding1"].PaddingTop = UDim.new(0, 7)
Converted["_UIPadding1"].Parent = Converted["_CTA"]
Converted["_Progress"].AnchorPoint = Vector2.new(0.5, 1)
Converted["_Progress"].BackgroundColor3 = Color3.fromRGB(34.00000177323818, 34.00000177323818, 34.00000177323818)
Converted["_Progress"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Progress"].BorderSizePixel = 0
Converted["_Progress"].ClipsDescendants = true
Converted["_Progress"].LayoutOrder = 9
Converted["_Progress"].Position = UDim2.new(0.5, 0, 1, 0)
Converted["_Progress"].Size = UDim2.new(1, 0, 0, 20)
Converted["_Progress"].Name = "Progress"
Converted["_Progress"].Parent = Converted["_Frame"]
Converted["_UICorner2"].Parent = Converted["_Progress"]
Converted["_Progress1"].AnchorPoint = Vector2.new(0, 0.5)
Converted["_Progress1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Progress1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Progress1"].BorderSizePixel = 0
Converted["_Progress1"].Position = UDim2.new(0, 0, 0.5, 0)
Converted["_Progress1"].Size = UDim2.new(0, 0, 0, 20)
Converted["_Progress1"].Name = "Progress"
Converted["_Progress1"].Parent = Converted["_Progress"]
Converted["_UICorner3"].Parent = Converted["_Progress1"]
Converted["_ImageLabel"].Image = "rbxassetid://122890426136039"
-- Converted["_ImageLabel"].ImageContent = Content
Converted["_ImageLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ImageLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ImageLabel"].BorderSizePixel = 0
Converted["_ImageLabel"].Position = UDim2.new(0, 0, 0.11437013, 0)
Converted["_ImageLabel"].Size = UDim2.new(1, 0, 0, 145)
Converted["_ImageLabel"].Parent = Converted["_Frame"]
Converted["_UICorner4"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner4"].Parent = Converted["_ImageLabel"]
Converted["_ScriptWarning"].Font = Enum.Font.GothamBold
Converted["_ScriptWarning"].Text = "THIS WILL EXECUTE THE ADVERTISER'S SCRIPT."
Converted["_ScriptWarning"].TextColor3 = Color3.fromRGB(255, 0, 4.000000236555934)
Converted["_ScriptWarning"].TextScaled = true
Converted["_ScriptWarning"].TextSize = 14
Converted["_ScriptWarning"].TextWrapped = true
Converted["_ScriptWarning"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ScriptWarning"].BackgroundTransparency = 1
Converted["_ScriptWarning"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ScriptWarning"].BorderSizePixel = 0
Converted["_ScriptWarning"].LayoutOrder = 1
Converted["_ScriptWarning"].Size = UDim2.new(1, 0, 0, 15)
Converted["_ScriptWarning"].Visible = false
Converted["_ScriptWarning"].Name = "ScriptWarning"
Converted["_ScriptWarning"].Parent = Converted["_Frame"]
Converted["_UIStroke1"].Color = Color3.fromRGB(89.00000229477882, 0, 1.0000000591389835)
Converted["_UIStroke1"].Thickness = 2
Converted["_UIStroke1"].Parent = Converted["_ScriptWarning"]
-- Fake Module Scripts:
local fake_module_scripts = {}
-- Fake Local Scripts:
local function OOECGX_fake_script() -- Fake Script: StarterGui.YARHMAd.Frame.UIStroke.UIGradient.Animator
    local script = Instance.new("LocalScript")
    script.Name = "Animator"
    script.Parent = Converted["_UIGradient1"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end
	local ts = game:GetService("TweenService")
	
	ts:Create(script.Parent, TweenInfo.new(
		10, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut,
		math.huge, false), {
			Rotation = -180
		}):Play()
end
local function MTHT_fake_script() -- Fake Script: StarterGui.YARHMAd.Frame.CTA.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_CTA"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end
	
	script.Parent.MouseButton1Click:Connect(function()	
		local addata = getgenv().YARHMADMETADATA
		
		
		if addata["type"] == "script" then
			task.spawn(function()
				loadstring(game:HttpGet(addata["ad"]["link"], true))()
			end)
			script.Parent.Text = "Script ran!"
		else
			setclipboard(addata["ad"]["link"])
			script.Parent.Text = "Link copied to clipboard!"
		end
		
		game:HttpGet("https://yarhm.mhi.im/adcampaign?slot=sidescreen&hit=1")
	end)
end
local function MJODPMW_fake_script() -- Fake Script: StarterGui.YARHMAd.Frame.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_Frame"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end
	local ts = game:GetService("TweenService")
	local http = game:GetService("HttpService")
	
	local rawaddata = game:HttpGet("https://yarhm.mhi.im/adcampaign?slot=sidescreen")
	getgenv().YARHMADMETADATA = http:JSONDecode(rawaddata)
	
	local addata = getgenv().YARHMADMETADATA
	
	if not addata["occupied"] then
		script.Parent.Parent:Destroy()
		return
	end
	
	
	if addata["type"] == "script" then
		script.Parent.ScriptWarning.Visible = true
		script.Parent.ScriptWarning.Text = "THIS WILL EXECUTE THE ADVERTISER'S SCRIPT."
	end
	
	if addata["ad"]["img"] then
		writefile("YARHM/adcache/sidescreen.png", game:HttpGet(addata["ad"]["img"]))
		local imgasset = getcustomasset("YARHM/adcache/sidescreen.png")
		script.Parent.ImageLabel.Image = imgasset
	else
		script.Parent.ImageLabel.Visible = false
	end
	
	script.Parent.Title.Text = addata["ad"]["title"]
	script.Parent.CTA.Text = addata["ad"]["cta"]
	
	script.Parent.Position = UDim2.new(1.5, 0, 1, -10)
	task.wait(2)
	
	ts:Create(script.Parent, TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
		Position = UDim2.new(1, -10, 1, -10)
	}):Play()
	
	local progresser  = ts:Create(script.Parent.Progress.Progress, TweenInfo.new(addata["ad"]["duration"], Enum.EasingStyle.Linear), {
		Size = UDim2.fromScale(1, 1)
	})
	
	progresser:Play()
	progresser.Completed:Wait()
	
	
	ts:Create(script.Parent, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = UDim2.new(1.5, 0, 1, -10)
	}):Play()
	task.wait(0.5)
	script.Parent.Parent:Destroy()
end
coroutine.wrap(OOECGX_fake_script)()
coroutine.wrap(MTHT_fake_script)()
coroutine.wrap(MJODPMW_fake_script)()