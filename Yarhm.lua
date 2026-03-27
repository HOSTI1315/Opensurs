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
	["_YARHMNetwork"] = Instance.new("ScreenGui");
	["_GlobalMessage"] = Instance.new("Frame");
	["_UICorner"] = Instance.new("UICorner");
	["_UIGradient"] = Instance.new("UIGradient");
	["_UIStroke"] = Instance.new("UIStroke");
	["_UIGradient1"] = Instance.new("UIGradient");
	["_Animator"] = Instance.new("LocalScript");
	["_UIPadding"] = Instance.new("UIPadding");
	["_UIListLayout"] = Instance.new("UIListLayout");
	["_Title"] = Instance.new("TextLabel");
	["_Comment"] = Instance.new("Frame");
	["_UICorner1"] = Instance.new("UICorner");
	["_UIPadding1"] = Instance.new("UIPadding");
	["_TextBox"] = Instance.new("TextBox");
	["_UIFlexItem"] = Instance.new("UIFlexItem");
	["_Send"] = Instance.new("TextButton");
	["_UICorner2"] = Instance.new("UICorner");
	["_UIPadding2"] = Instance.new("UIPadding");
	["_UIListLayout1"] = Instance.new("UIListLayout");
	["_Content"] = Instance.new("TextLabel");
	["_UIPadding3"] = Instance.new("UIPadding");
	["_By"] = Instance.new("TextLabel");
	["_Actions"] = Instance.new("Frame");
	["_Ignore"] = Instance.new("TextButton");
	["_UICorner3"] = Instance.new("UICorner");
	["_UIPadding4"] = Instance.new("UIPadding");
	["_UIFlexItem1"] = Instance.new("UIFlexItem");
	["_UIListLayout2"] = Instance.new("UIListLayout");
	["_Close"] = Instance.new("TextButton");
	["_UICorner4"] = Instance.new("UICorner");
	["_UIPadding5"] = Instance.new("UIPadding");
	["_UIFlexItem2"] = Instance.new("UIFlexItem");
	["_Image"] = Instance.new("ImageLabel");
	["_UICorner5"] = Instance.new("UICorner");
	["_Poll"] = Instance.new("Frame");
	["_UICorner6"] = Instance.new("UICorner");
	["_UIPadding6"] = Instance.new("UIPadding");
	["_UIListLayout3"] = Instance.new("UIListLayout");
	["_OptionPlaceholder"] = Instance.new("TextButton");
	["_CanvasGroup"] = Instance.new("CanvasGroup");
	["_Progress"] = Instance.new("Frame");
	["_Container"] = Instance.new("Frame");
	["_UIPadding7"] = Instance.new("UIPadding");
	["_OptionText"] = Instance.new("TextLabel");
	["_Votes"] = Instance.new("TextLabel");
	["_UICorner7"] = Instance.new("UICorner");
	["_UICorner8"] = Instance.new("UICorner");
	["_Check"] = Instance.new("ImageLabel");
	["_UIScale"] = Instance.new("UIScale");
	["_Voted"] = Instance.new("ObjectValue");
	["_Network"] = Instance.new("LocalScript");
	["_Messages"] = Instance.new("Frame");
	["_UIListLayout4"] = Instance.new("UIListLayout");
	["_HoldComment"] = Instance.new("Frame");
	["_TextLabel"] = Instance.new("TextLabel");
}
-- Properties:
Converted["_YARHMNetwork"].DisplayOrder = 999999999
Converted["_YARHMNetwork"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_YARHMNetwork"].Name = "YARHMNetwork"
Converted["_YARHMNetwork"].Parent = game:GetService("CoreGui")
Converted["_GlobalMessage"].AnchorPoint = Vector2.new(1, 0.5)
Converted["_GlobalMessage"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_GlobalMessage"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_GlobalMessage"].BackgroundTransparency = 0.30000001192092896
Converted["_GlobalMessage"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_GlobalMessage"].BorderSizePixel = 0
Converted["_GlobalMessage"].Position = UDim2.new(2, -10, 1, -10)
Converted["_GlobalMessage"].Size = UDim2.new(0, 283, 0, 0)
Converted["_GlobalMessage"].Name = "GlobalMessage"
Converted["_GlobalMessage"].Parent = Converted["_YARHMNetwork"]
Converted["_UICorner"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner"].Parent = Converted["_GlobalMessage"]
Converted["_UIGradient"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(36.00000165402889, 36.00000165402889, 36.00000165402889)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(68.00000354647636, 68.00000354647636, 68.00000354647636))
}
Converted["_UIGradient"].Rotation = 68
Converted["_UIGradient"].Parent = Converted["_GlobalMessage"]
Converted["_UIStroke"].Color = Color3.fromRGB(255, 255, 255)
Converted["_UIStroke"].Thickness = 2
Converted["_UIStroke"].Parent = Converted["_GlobalMessage"]
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
Converted["_UIPadding"].Parent = Converted["_GlobalMessage"]
Converted["_UIListLayout"].Padding = UDim.new(0, 8)
Converted["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_UIListLayout"].Parent = Converted["_GlobalMessage"]
Converted["_Title"].Font = Enum.Font.Unknown
Converted["_Title"].RichText = true
Converted["_Title"].Text = "YARHM Global Announcement"
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
Converted["_Title"].Parent = Converted["_GlobalMessage"]
Converted["_Comment"].AnchorPoint = Vector2.new(0.5, 1)
Converted["_Comment"].BackgroundColor3 = Color3.fromRGB(34.00000177323818, 34.00000177323818, 34.00000177323818)
Converted["_Comment"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Comment"].BorderSizePixel = 0
Converted["_Comment"].ClipsDescendants = true
Converted["_Comment"].LayoutOrder = 9
Converted["_Comment"].Position = UDim2.new(0.5, 0, 1, 0)
Converted["_Comment"].Size = UDim2.new(1, 0, 0, 35)
Converted["_Comment"].Name = "Comment"
Converted["_Comment"].Parent = Converted["_GlobalMessage"]
Converted["_UICorner1"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner1"].Parent = Converted["_Comment"]
Converted["_UIPadding1"].PaddingBottom = UDim.new(0, 6)
Converted["_UIPadding1"].PaddingLeft = UDim.new(0, 16)
Converted["_UIPadding1"].PaddingRight = UDim.new(0, 6)
Converted["_UIPadding1"].PaddingTop = UDim.new(0, 6)
Converted["_UIPadding1"].Parent = Converted["_Comment"]
Converted["_TextBox"].Font = Enum.Font.Gotham
Converted["_TextBox"].PlaceholderText = "Respond..."
Converted["_TextBox"].Text = ""
Converted["_TextBox"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextBox"].TextSize = 14
Converted["_TextBox"].TextWrapped = true
Converted["_TextBox"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextBox"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextBox"].BackgroundTransparency = 1
Converted["_TextBox"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextBox"].BorderSizePixel = 0
Converted["_TextBox"].Size = UDim2.new(0, 0, 1, 0)
Converted["_TextBox"].Parent = Converted["_Comment"]
Converted["_UIFlexItem"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem"].Parent = Converted["_TextBox"]
Converted["_Send"].Font = Enum.Font.Gotham
Converted["_Send"].Text = "Send"
Converted["_Send"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Send"].TextScaled = true
Converted["_Send"].TextSize = 14
Converted["_Send"].TextWrapped = true
Converted["_Send"].BackgroundColor3 = Color3.fromRGB(46.000001057982445, 46.000001057982445, 46.000001057982445)
Converted["_Send"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Send"].BorderSizePixel = 0
Converted["_Send"].Size = UDim2.new(0, 60, 1, 0)
Converted["_Send"].Name = "Send"
Converted["_Send"].Parent = Converted["_Comment"]
Converted["_UICorner2"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner2"].Parent = Converted["_Send"]
Converted["_UIPadding2"].PaddingBottom = UDim.new(0, 4)
Converted["_UIPadding2"].PaddingLeft = UDim.new(0, 4)
Converted["_UIPadding2"].PaddingRight = UDim.new(0, 4)
Converted["_UIPadding2"].PaddingTop = UDim.new(0, 5)
Converted["_UIPadding2"].Parent = Converted["_Send"]
Converted["_UIListLayout1"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout1"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout1"].Parent = Converted["_Comment"]
Converted["_Content"].Font = Enum.Font.Unknown
Converted["_Content"].RichText = true
Converted["_Content"].Text = "something thought provoking"
Converted["_Content"].TextColor3 = Color3.fromRGB(255, 217.00001746416092, 217.00001746416092)
Converted["_Content"].TextSize = 24
Converted["_Content"].TextWrapped = true
Converted["_Content"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_Content"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Content"].BackgroundTransparency = 1
Converted["_Content"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Content"].BorderSizePixel = 0
Converted["_Content"].LayoutOrder = -1
Converted["_Content"].Size = UDim2.new(1, 0, 0, 100)
Converted["_Content"].Name = "Content"
Converted["_Content"].Parent = Converted["_GlobalMessage"]
Converted["_UIPadding3"].PaddingBottom = UDim.new(0, 16)
Converted["_UIPadding3"].PaddingTop = UDim.new(0, 16)
Converted["_UIPadding3"].Parent = Converted["_Content"]
Converted["_By"].Font = Enum.Font.Unknown
Converted["_By"].RichText = true
Converted["_By"].Text = "from ImperialMentor"
Converted["_By"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_By"].TextScaled = true
Converted["_By"].TextSize = 24
Converted["_By"].TextTransparency = 0.699999988079071
Converted["_By"].TextWrapped = true
Converted["_By"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_By"].BackgroundTransparency = 1
Converted["_By"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_By"].BorderSizePixel = 0
Converted["_By"].LayoutOrder = 2
Converted["_By"].Size = UDim2.new(1, 0, 0, 15)
Converted["_By"].Name = "By"
Converted["_By"].Parent = Converted["_GlobalMessage"]
Converted["_Actions"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Actions"].BackgroundTransparency = 1
Converted["_Actions"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Actions"].BorderSizePixel = 0
Converted["_Actions"].LayoutOrder = 15
Converted["_Actions"].Size = UDim2.new(1, 0, 0, 30)
Converted["_Actions"].Name = "Actions"
Converted["_Actions"].Parent = Converted["_GlobalMessage"]
Converted["_Ignore"].Font = Enum.Font.GothamBold
Converted["_Ignore"].Text = "Ignore for now"
Converted["_Ignore"].TextColor3 = Color3.fromRGB(255, 184.00000423192978, 184.00000423192978)
Converted["_Ignore"].TextScaled = true
Converted["_Ignore"].TextSize = 14
Converted["_Ignore"].TextWrapped = true
Converted["_Ignore"].BackgroundColor3 = Color3.fromRGB(46.000001057982445, 0, 0)
Converted["_Ignore"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Ignore"].BorderSizePixel = 0
Converted["_Ignore"].LayoutOrder = 15
Converted["_Ignore"].Size = UDim2.new(0, 0, 0, 30)
Converted["_Ignore"].Name = "Ignore"
Converted["_Ignore"].Parent = Converted["_Actions"]
Converted["_UICorner3"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner3"].Parent = Converted["_Ignore"]
Converted["_UIPadding4"].PaddingBottom = UDim.new(0, 7)
Converted["_UIPadding4"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding4"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding4"].PaddingTop = UDim.new(0, 7)
Converted["_UIPadding4"].Parent = Converted["_Ignore"]
Converted["_UIFlexItem1"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem1"].Parent = Converted["_Ignore"]
Converted["_UIListLayout2"].HorizontalFlex = Enum.UIFlexAlignment.Fill
Converted["_UIListLayout2"].Padding = UDim.new(0, 6)
Converted["_UIListLayout2"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout2"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout2"].Parent = Converted["_Actions"]
Converted["_Close"].Font = Enum.Font.GothamBold
Converted["_Close"].Text = "Close"
Converted["_Close"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Close"].TextScaled = true
Converted["_Close"].TextSize = 14
Converted["_Close"].TextWrapped = true
Converted["_Close"].BackgroundColor3 = Color3.fromRGB(46.000001057982445, 46.000001057982445, 46.000001057982445)
Converted["_Close"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Close"].BorderSizePixel = 0
Converted["_Close"].LayoutOrder = 15
Converted["_Close"].Size = UDim2.new(0, 0, 0, 30)
Converted["_Close"].Name = "Close"
Converted["_Close"].Parent = Converted["_Actions"]
Converted["_UICorner4"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner4"].Parent = Converted["_Close"]
Converted["_UIPadding5"].PaddingBottom = UDim.new(0, 7)
Converted["_UIPadding5"].PaddingLeft = UDim.new(0, 7)
Converted["_UIPadding5"].PaddingRight = UDim.new(0, 7)
Converted["_UIPadding5"].PaddingTop = UDim.new(0, 7)
Converted["_UIPadding5"].Parent = Converted["_Close"]
Converted["_UIFlexItem2"].FlexMode = Enum.UIFlexMode.Grow
Converted["_UIFlexItem2"].Parent = Converted["_Close"]
Converted["_Image"].Image = "rbxassetid://11818627057"
-- Converted["_Image"].ImageContent = Content
Converted["_Image"].ScaleType = Enum.ScaleType.Fit
Converted["_Image"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Image"].BackgroundTransparency = 1
Converted["_Image"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Image"].BorderSizePixel = 0
Converted["_Image"].LayoutOrder = -1
Converted["_Image"].Size = UDim2.new(1, 0, 0, 100)
Converted["_Image"].Visible = false
Converted["_Image"].Name = "Image"
Converted["_Image"].Parent = Converted["_GlobalMessage"]
Converted["_UICorner5"].Parent = Converted["_Image"]
Converted["_Poll"].AnchorPoint = Vector2.new(0.5, 1)
Converted["_Poll"].AutomaticSize = Enum.AutomaticSize.Y
Converted["_Poll"].BackgroundColor3 = Color3.fromRGB(34.00000177323818, 34.00000177323818, 34.00000177323818)
Converted["_Poll"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Poll"].BorderSizePixel = 0
Converted["_Poll"].ClipsDescendants = true
Converted["_Poll"].LayoutOrder = 8
Converted["_Poll"].Position = UDim2.new(0.5, 0, 1, 0)
Converted["_Poll"].Size = UDim2.new(1, 0, 0, 35)
Converted["_Poll"].Visible = false
Converted["_Poll"].Name = "Poll"
Converted["_Poll"].Parent = Converted["_GlobalMessage"]
Converted["_UICorner6"].CornerRadius = UDim.new(0, 16)
Converted["_UICorner6"].Parent = Converted["_Poll"]
Converted["_UIPadding6"].PaddingBottom = UDim.new(0, 6)
Converted["_UIPadding6"].PaddingLeft = UDim.new(0, 6)
Converted["_UIPadding6"].PaddingRight = UDim.new(0, 6)
Converted["_UIPadding6"].PaddingTop = UDim.new(0, 6)
Converted["_UIPadding6"].Parent = Converted["_Poll"]
Converted["_UIListLayout3"].Padding = UDim.new(0, 6)
Converted["_UIListLayout3"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout3"].Parent = Converted["_Poll"]
Converted["_OptionPlaceholder"].Font = Enum.Font.Gotham
Converted["_OptionPlaceholder"].Text = "Send"
Converted["_OptionPlaceholder"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_OptionPlaceholder"].TextScaled = true
Converted["_OptionPlaceholder"].TextSize = 14
Converted["_OptionPlaceholder"].TextTransparency = 1
Converted["_OptionPlaceholder"].TextWrapped = true
Converted["_OptionPlaceholder"].BackgroundColor3 = Color3.fromRGB(46.000001057982445, 46.000001057982445, 46.000001057982445)
Converted["_OptionPlaceholder"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_OptionPlaceholder"].BorderSizePixel = 0
Converted["_OptionPlaceholder"].ClipsDescendants = true
Converted["_OptionPlaceholder"].Size = UDim2.new(1, 0, 0, 50)
Converted["_OptionPlaceholder"].Visible = false
Converted["_OptionPlaceholder"].Name = "OptionPlaceholder"
Converted["_OptionPlaceholder"].Parent = Converted["_Poll"]
Converted["_CanvasGroup"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_CanvasGroup"].BackgroundTransparency = 1
Converted["_CanvasGroup"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_CanvasGroup"].BorderSizePixel = 0
Converted["_CanvasGroup"].Size = UDim2.new(1, 0, 1, 0)
Converted["_CanvasGroup"].Parent = Converted["_OptionPlaceholder"]
Converted["_Progress"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Progress"].BackgroundTransparency = 0.8500000238418579
Converted["_Progress"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Progress"].BorderSizePixel = 0
Converted["_Progress"].Size = UDim2.new(0, 0, 1, 0)
Converted["_Progress"].ZIndex = -99
Converted["_Progress"].Name = "Progress"
Converted["_Progress"].Parent = Converted["_CanvasGroup"]
Converted["_Container"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Container"].BackgroundTransparency = 1
Converted["_Container"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Container"].BorderSizePixel = 0
Converted["_Container"].ClipsDescendants = true
Converted["_Container"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Container"].Name = "Container"
Converted["_Container"].Parent = Converted["_CanvasGroup"]
Converted["_UIPadding7"].PaddingBottom = UDim.new(0, 8)
Converted["_UIPadding7"].PaddingLeft = UDim.new(0, 8)
Converted["_UIPadding7"].PaddingRight = UDim.new(0, 8)
Converted["_UIPadding7"].PaddingTop = UDim.new(0, 8)
Converted["_UIPadding7"].Parent = Converted["_Container"]
Converted["_OptionText"].Font = Enum.Font.GothamBold
Converted["_OptionText"].Text = "something something"
Converted["_OptionText"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_OptionText"].TextScaled = true
Converted["_OptionText"].TextSize = 14
Converted["_OptionText"].TextWrapped = true
Converted["_OptionText"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_OptionText"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_OptionText"].BackgroundTransparency = 1
Converted["_OptionText"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_OptionText"].BorderSizePixel = 0
Converted["_OptionText"].Size = UDim2.new(1, 0, 0.5, 0)
Converted["_OptionText"].Name = "OptionText"
Converted["_OptionText"].Parent = Converted["_Container"]
Converted["_Votes"].Font = Enum.Font.Unknown
Converted["_Votes"].Text = "234 votes"
Converted["_Votes"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Votes"].TextScaled = true
Converted["_Votes"].TextSize = 14
Converted["_Votes"].TextWrapped = true
Converted["_Votes"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Votes"].AnchorPoint = Vector2.new(0, 1)
Converted["_Votes"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Votes"].BackgroundTransparency = 1
Converted["_Votes"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Votes"].BorderSizePixel = 0
Converted["_Votes"].Position = UDim2.new(0, 0, 1, 0)
Converted["_Votes"].Size = UDim2.new(1, 0, 0.5, -4)
Converted["_Votes"].Name = "Votes"
Converted["_Votes"].Parent = Converted["_Container"]
Converted["_UICorner7"].CornerRadius = UDim.new(0, 12)
Converted["_UICorner7"].Parent = Converted["_CanvasGroup"]
Converted["_UICorner8"].CornerRadius = UDim.new(0, 12)
Converted["_UICorner8"].Parent = Converted["_OptionPlaceholder"]
Converted["_Check"].Image = "rbxassetid://5107142152"
-- Converted["_Check"].ImageContent = Content
Converted["_Check"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Check"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Check"].BackgroundTransparency = 1
Converted["_Check"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Check"].BorderSizePixel = 0
Converted["_Check"].Position = UDim2.new(1, -30, 0.5, 0)
Converted["_Check"].Size = UDim2.new(0, 35, 0, 35)
Converted["_Check"].Name = "Check"
Converted["_Check"].Parent = Converted["_OptionPlaceholder"]
Converted["_UIScale"].Scale = 1.0000000116860974e-07
Converted["_UIScale"].Parent = Converted["_Check"]
Converted["_Voted"].Name = "Voted"
Converted["_Voted"].Parent = Converted["_Poll"]
Converted["_Messages"].AnchorPoint = Vector2.new(1, 0)
Converted["_Messages"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Messages"].BackgroundTransparency = 1
Converted["_Messages"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Messages"].BorderSizePixel = 0
Converted["_Messages"].ClipsDescendants = true
Converted["_Messages"].Position = UDim2.new(1, -10, 0.0500000007, 0)
Converted["_Messages"].Size = UDim2.new(0, 283, 0.300000012, 0)
Converted["_Messages"].Name = "Messages"
Converted["_Messages"].Parent = Converted["_YARHMNetwork"]
Converted["_UIListLayout4"].Padding = UDim.new(0, 2)
Converted["_UIListLayout4"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout4"].VerticalAlignment = Enum.VerticalAlignment.Bottom
Converted["_UIListLayout4"].Parent = Converted["_Messages"]
Converted["_HoldComment"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_HoldComment"].BackgroundTransparency = 1
Converted["_HoldComment"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_HoldComment"].BorderSizePixel = 0
Converted["_HoldComment"].Size = UDim2.new(1, 0, 0, 15)
Converted["_HoldComment"].Visible = false
Converted["_HoldComment"].Name = "HoldComment"
Converted["_HoldComment"].Parent = Converted["_Messages"]
Converted["_TextLabel"].Font = Enum.Font.Gotham
Converted["_TextLabel"].RichText = true
Converted["_TextLabel"].Text = "<b>hello</b>: hello"
Converted["_TextLabel"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].TextScaled = true
Converted["_TextLabel"].TextSize = 14
Converted["_TextLabel"].TextWrapped = true
Converted["_TextLabel"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].BackgroundTransparency = 1
Converted["_TextLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel"].BorderSizePixel = 0
Converted["_TextLabel"].Position = UDim2.new(1, 0, 0, 0)
Converted["_TextLabel"].Size = UDim2.new(1, 0, 1, 0)
Converted["_TextLabel"].Parent = Converted["_HoldComment"]
-- Module Scripts:
local module_scripts = {}
-- Routine Local Scripts:
local function VQBL_routine() -- Script: StarterGui.YARHMNetwork.GlobalMessage.UIStroke.UIGradient.Animator
    local script = Instance.new("LocalScript")
    script.Name = "Animator"
    script.Parent = Converted["_UIGradient1"]
    local req = require
    local require = function(obj)
        local fake = module_scripts[obj]
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
local function DYUODA_routine() -- Script: StarterGui.YARHMNetwork.Network
    local script = Instance.new("LocalScript")
    script.Name = "Network"
    script.Parent = Converted["_YARHMNetwork"]
    local req = require
    local require = function(obj)
        local fake = module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end
	local getgenv = getgenv or function() return _G end
	if getgenv().YARHMNetwork_available then
		return
	end
	
	local WebSocket = WebSocket or nil
	if game:GetService("RunService"):IsStudio() then
		WebSocket = require(game.ReplicatedStorage.WebSocketStub)
	end
	
	-- yeah opensource and all sht but dont get any ideas.
	-- i ratelimit and filter everything serverside
	
	local CoreGui = game:GetService("StarterGui")
	local HTS = game:GetService("HttpService")
	local TS = game:GetService("TweenService")
	local Players = game:GetService("Players")
	local Debris = game:GetService("Debris")
	
	local gbmFrame = script.Parent.GlobalMessage
	
	
	gbmFrame.By.Font = Enum.Font.Montserrat
	gbmFrame.Content.Font = Enum.Font.Montserrat
	gbmFrame.Title.Font = Enum.Font.Montserrat
	
	gbmFrame.Poll.OptionPlaceholder.CanvasGroup.Container.Votes.Font = Enum.Font.Montserrat
	
	local function ntfc(t, m)
		if true then return end -- disable notifications for now
		CoreGui:SetCore("SendNotification", {
			Title = t;
			Text = m;
			Duration = 5;
		})	
	end
	local function jsn(t)
		return HTS:JSONEncode(t)
	end
	local WEBSOCKET_URL = "wss://yarhm.mhi.im/nwk"
	
	if not WebSocket then ntfc("No YARHM Network", "Your runtime does not support WebSockets. You will not be connected.") return end
	
	task.wait(1)
	
	local WEBSOCKET_CLIENT = WebSocket.connect(WEBSOCKET_URL)
	WEBSOCKET_CLIENT:Send(jsn({command = "ack", name = Players.LocalPlayer.Name}))
	
	local lastPos = Vector3.zero
	
	local function startRecordingForRoot(rootPart, playerName)
		local function getYawOrientation(cf)
			local look = cf.LookVector
			local yaw = math.atan2(look.X, look.Z)
			return math.sin(yaw), math.cos(yaw)
		end
	
		local humanoid = rootPart and rootPart.Parent:FindFirstChildWhichIsA("Humanoid")
	
		while true do
			if not rootPart or not rootPart.Parent then
				break
			end
	
			local history = {}
			local lastPos = rootPart.Position
			local visualPoints = {}
	
			for i = 1, 9 do
				task.wait(0.1)
				if not rootPart or not rootPart.Parent then
					break
				end
	
				local currentPos = rootPart.Position
				local recordedPos = currentPos - lastPos
				local velocity = rootPart.AssemblyLinearVelocity
				local sinYaw, cosYaw = getYawOrientation(rootPart.CFrame)
				local moveDir = humanoid and humanoid.MoveDirection or Vector3.zero
	
				local entry
				if velocity.Magnitude > 0.001 then
					entry = {
						recordedPos.X, recordedPos.Y, recordedPos.Z,
						velocity.X, velocity.Y, velocity.Z,
						sinYaw, cosYaw,
						moveDir.X, moveDir.Y, moveDir.Z
					}
				else
					entry = { 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0 }
				end
	
				local rootclone = rootPart:Clone()
				rootclone.CanCollide = false
				rootclone.Parent = workspace
				rootclone.Transparency = 0.9
				rootclone.Anchored = true
				rootclone.Size = Vector3.new(0.1, 0.1, 0.1)
				Debris:AddItem(rootclone, 0.7)
	
				table.insert(history, entry)
				lastPos = currentPos
			end
	
			if not rootPart or not rootPart.Parent then
				break
			end
	
	
			local payload = {
				history = history,
			}
	
			return payload
		end
	end
	
	
	
	
	
	
	
	local ignoringGlobalMessages = false
	
	local lastAnnouncementOverrideShow = false
	
	local waitingForPrediction = false
	local waitPredPosResult = Vector3.zero
	
	local lastPollOptions = {}
	
	gbmFrame.Position = UDim2.new(2, -10, 0.5, -10)
	
	WEBSOCKET_CLIENT.OnMessage:Connect(function(rawm)
		local m = HTS:JSONDecode(rawm)
		
		if m["globalMessage"] then
			if ignoringGlobalMessages and not m["overrideShow"] then return end
			local msg = m["globalMessage"]
			local from = m["from"] or "Developer"
			local allowCommenting = m["allowCommenting"] or false
			local polloptions = m["poll"] or {}
			local overrideShow = m["overrideShow"] or false
			local image = m["image"] or ""
			gbmFrame.Content.Text = msg
			gbmFrame.By.Text = "from " .. from
			
			gbmFrame.Comment.Visible = allowCommenting
			
			gbmFrame.Comment.Send.Interactable = allowCommenting
			gbmFrame.Comment.Send.Text = "Send"
			
			gbmFrame.Actions.Visible = not overrideShow
			lastAnnouncementOverrideShow = overrideShow
			
			gbmFrame.Poll.Voted.Value = nil
			for _, i in ipairs(gbmFrame.Poll:GetChildren()) do if i.Name == "Option" then i:Destroy() end end
			if #polloptions > 0 then
				gbmFrame.Poll.Visible = true
				for _, optName in polloptions do
					local option = script.Parent.GlobalMessage.Poll.OptionPlaceholder:Clone()
					option.Name = "Option"
					option.Parent = gbmFrame.Poll
					option.Visible = true
					
					option:SetAttribute("opt", optName)
					
					option.CanvasGroup.Container.OptionText.Text = optName
					option.CanvasGroup.Container.Votes.Text = "0 Votes"
					
					option.MouseButton1Click:Connect(function()
						if gbmFrame.Poll.Voted.Value == nil then
							gbmFrame.Poll.Voted.Value = option
							print(optName)
							WEBSOCKET_CLIENT:Send(jsn({command = "pollvote", voting = optName}))
						end
					end)
				end
			else
				gbmFrame.Poll.Visible = false
			end
			
			if string.find(image, "https") then
				delfile("YARHM/cache/annc.png")
				local imgdata = game:HttpGet(image)
				writefile("YARHM/cache/annc.png", imgdata)
				gbmFrame.Image.Image = getcustomasset("YARHM/cache/annc.png")
				gbmFrame.Image.Visible = true
			else
				gbmFrame.Image.Visible = false
			end
			
			TS:Create(gbmFrame, TweenInfo.new(0.6, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				Position = UDim2.new(1, -10, 0.5, -10)
			}):Play()
			
			task.spawn(function()
				task.wait(30)
				TS:Create(gbmFrame, TweenInfo.new(0.6, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					Position = UDim2.new(2, -10, 0.5, -10)
				}):Play()
			end)
			
		end
		
		if m["pollValuesUpdate"] then
			print(m["pollValuesUpdate"])
			local totalVotes = 0
			for _, pollOpt in m["pollValuesUpdate"] do totalVotes += pollOpt[2] end
			for _, pollOpt in m["pollValuesUpdate"] do
				for _, i in ipairs(gbmFrame.Poll:GetChildren()) do
					if i:GetAttribute("opt") == pollOpt[1] then
						i.CanvasGroup.Container.Votes.Text = pollOpt[2] .. " Votes"
						
						TS:Create(i.CanvasGroup.Progress, TweenInfo.new(0.1), {
							Size = UDim2.new(pollOpt[2] / totalVotes, 0, 1, 0)
						}):Play()
					end
				end
			end
		end
		
		if m["comment"] then
			task.spawn(function()
				if ignoringGlobalMessages and not lastAnnouncementOverrideShow then return end
				local msg = m["comment"]
				local commentObject = script.Parent.Messages.HoldComment:Clone()
				commentObject.Parent = script.Parent.Messages
				commentObject.Visible = true
				commentObject.TextLabel.Text = `<b>{msg.name}</b>: {msg.data}`
				
				if msg.name == Players.LocalPlayer.Name then
					commentObject.TextLabel.TextColor3 = Color3.fromRGB(198, 255, 76)
				end
				
				TS:Create(commentObject.TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					Position = UDim2.new()
				}):Play()
				
				task.wait(1)
				
				local fdo = TS:Create(commentObject.TextLabel, TweenInfo.new(1), {
					TextTransparency = 1
				})
				fdo:Play()
				fdo.Completed:Wait()
				
				commentObject:Destroy()
			end)		
		end
	
		if m["status"] then
			ntfc("YARHM Network", m["status"])
		end
	
		if m["prediction"] then
			if waitingForPrediction then
				waitingForPrediction = false
				waitPredPosResult = Vector3.new(m["prediction"][1][1], m["prediction"][1][2], m["prediction"][1][3])
				ntfc("YARHM Network", "Prediction received: " .. tostring(waitPredPosResult))
			else
				ntfc("YARHM Network", "Received prediction, no function is requesting..")
			end
			-- local player = Players.LocalPlayer
			-- local root = player.Character:WaitForChild("HumanoidRootPart")
			-- print(m)
			-- local rootclone = root:Clone()
			-- rootclone.CanCollide = false
			-- rootclone.Position = lastPos + Vector3.new(m["prediction"][1][1], m["prediction"][1][2], m["prediction"][1][3])
			-- rootclone.Parent = workspace
			-- rootclone.Color = Color3.fromRGB(0, 213, 255)
			-- rootclone.Transparency = 0.5
			-- rootclone.Anchored = true
			-- rootclone.Name = "predict"
			-- Debris:AddItem(rootclone, 0.7)
		end
	end)
	
	WEBSOCKET_CLIENT.OnClose:Connect(function()
		ntfc("YARHM Network disconnected", "Something has disconnected you from YARHM Network. You will not be reconnected.")
		getgenv().YARHMNetwork_available = false	
	end)
	
	
	
	gbmFrame.Comment.Send.MouseButton1Click:Connect(function()
		local cmt = gbmFrame.Comment.TextBox.Text
		if #cmt > 1 then
			WEBSOCKET_CLIENT:Send(jsn({command = "comment", name = Players.LocalPlayer.Name, data = cmt}))
		end
		gbmFrame.Comment.TextBox.Text = ""
		gbmFrame.Comment.Send.Text = "Sent!"
		task.wait(0.5)
		gbmFrame.Comment.Send.Text = "Send"
		--gbmFrame.Comment.Send.Interactable = false
	end)
	
	gbmFrame.Actions.Close.MouseButton1Click:Connect(function()
		TS:Create(gbmFrame, TweenInfo.new(0.6, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			Position = UDim2.new(2, -10, 1, -10)
		}):Play()
	end)
	
	gbmFrame.Actions.Ignore.MouseButton1Click:Connect(function()
		ignoringGlobalMessages = true
		TS:Create(gbmFrame, TweenInfo.new(0.6, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			Position = UDim2.new(2, -10, 1, -10)
		}):Play()
	end)
	
	gbmFrame.Poll.Voted.Changed:Connect(function(v)
		for _, i in ipairs(gbmFrame.Poll:GetChildren()) do
			if i:IsA("TextButton") and i:FindFirstChild("Check") then TS:Create(i.Check.UIScale, TweenInfo.new(1.25, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), { Scale = 0 }):Play() end
		end
		TS:Create((gbmFrame.Poll.Voted.Value).Check.UIScale, TweenInfo.new(1.25, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), { Scale = 1 }):Play()
	end)
	
	
	getgenv().YARHMNetwork_predictPos = function(pl)
		local player = pl
		local root = player.Character:WaitForChild("HumanoidRootPart")
		lastPos = root.Position
		local history = startRecordingForRoot(root)["history"]
	
	
		lastPos = root.Position
	
		WEBSOCKET_CLIENT:Send(jsn({command = "predict", data = history}))
		ntfc("YARHM Network", "History collected, sent data. Waiting..")
		waitingForPrediction = true
		repeat task.wait(0.1) until not waitingForPrediction
		if waitPredPosResult ~= Vector3.zero then
			return lastPos + waitPredPosResult
		end 
	end
	
	getgenv().YARHMNetwork_available = true
end
coroutine.wrap(VQBL_routine)()
coroutine.wrap(DYUODA_routine)()