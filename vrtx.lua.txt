local G2L = {};

-- StarterGui.s
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[s]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.s.main
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(28, 30, 39);
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2"]["AutomaticSize"] = Enum.AutomaticSize.X;
G2L["2"]["Size"] = UDim2.new(0.21181, 0, 0.40244, 0);
G2L["2"]["Position"] = UDim2.new(0.50648, 0, 0.49831, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[main]];


-- StarterGui.s.main.visualbtn
G2L["3"] = Instance.new("TextButton", G2L["2"]);
G2L["3"]["TextWrapped"] = true;
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["TextSize"] = 14;
G2L["3"]["TextScaled"] = true;
G2L["3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(184, 187, 24);
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3"]["AutomaticSize"] = Enum.AutomaticSize.X;
G2L["3"]["Size"] = UDim2.new(0.32692, 0, 0.11111, 0);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Text"] = [[VISUAL]];
G2L["3"]["Name"] = [[visualbtn]];
G2L["3"]["Position"] = UDim2.new(0.5, 0, 0.05556, 0);


-- StarterGui.s.main.visualbtn.UITextSizeConstraint
G2L["4"] = Instance.new("UITextSizeConstraint", G2L["3"]);
G2L["4"]["MaxTextSize"] = 22;


-- StarterGui.s.main.miscbtn
G2L["5"] = Instance.new("TextButton", G2L["2"]);
G2L["5"]["TextWrapped"] = true;
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["TextSize"] = 14;
G2L["5"]["TextScaled"] = true;
G2L["5"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(70, 70, 255);
G2L["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["5"]["AutomaticSize"] = Enum.AutomaticSize.X;
G2L["5"]["Size"] = UDim2.new(0.33654, 0, 0.11111, 0);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Text"] = [[MISC]];
G2L["5"]["Name"] = [[miscbtn]];
G2L["5"]["Position"] = UDim2.new(0.83173, 0, 0.05556, 0);


-- StarterGui.s.main.miscbtn.UITextSizeConstraint
G2L["6"] = Instance.new("UITextSizeConstraint", G2L["5"]);
G2L["6"]["MaxTextSize"] = 22;


-- StarterGui.s.main.mainbtn
G2L["7"] = Instance.new("TextButton", G2L["2"]);
G2L["7"]["TextWrapped"] = true;
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["TextSize"] = 14;
G2L["7"]["TextScaled"] = true;
G2L["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(37, 176, 37);
G2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["7"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["7"]["AutomaticSize"] = Enum.AutomaticSize.X;
G2L["7"]["Size"] = UDim2.new(0.33654, 0, 0.11111, 0);
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["Text"] = [[MAIN]];
G2L["7"]["Name"] = [[mainbtn]];
G2L["7"]["Position"] = UDim2.new(0.16827, 0, 0.05556, 0);


-- StarterGui.s.main.mainbtn.UITextSizeConstraint
G2L["8"] = Instance.new("UITextSizeConstraint", G2L["7"]);
G2L["8"]["MaxTextSize"] = 22;


-- StarterGui.s.main.main
G2L["9"] = Instance.new("ScrollingFrame", G2L["2"]);
G2L["9"]["Visible"] = false;
G2L["9"]["Active"] = true;
G2L["9"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
G2L["9"]["ZIndex"] = 2;
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["CanvasSize"] = UDim2.new(0, 0, 1, 8);
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["Name"] = [[main]];
G2L["9"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["9"]["Size"] = UDim2.new(1, 0, 0.88889, 0);
G2L["9"]["Position"] = UDim2.new(0.5, 0, 0.55556, 0);
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["BackgroundTransparency"] = 1;


-- StarterGui.s.main.main.float
G2L["a"] = Instance.new("TextButton", G2L["9"]);
G2L["a"]["TextWrapped"] = true;
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["TextSize"] = 14;
G2L["a"]["TextScaled"] = true;
G2L["a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(174, 42, 42);
G2L["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["a"]["ZIndex"] = 4;
G2L["a"]["Size"] = UDim2.new(0, 174, 0, 34);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Text"] = [[FLOAT]];
G2L["a"]["Name"] = [[float]];
G2L["a"]["Position"] = UDim2.new(0, 16, 0, 41);


-- StarterGui.s.main.main.float.UITextSizeConstraint
G2L["b"] = Instance.new("UITextSizeConstraint", G2L["a"]);
G2L["b"]["MaxTextSize"] = 14;


-- StarterGui.s.main.main.float.FloatButtonToggleFloatMenu
G2L["c"] = Instance.new("LocalScript", G2L["a"]);
G2L["c"]["Name"] = [[FloatButtonToggleFloatMenu]];


-- StarterGui.s.main.main.jump
G2L["d"] = Instance.new("TextButton", G2L["9"]);
G2L["d"]["TextWrapped"] = true;
G2L["d"]["BorderSizePixel"] = 0;
G2L["d"]["TextSize"] = 14;
G2L["d"]["TextScaled"] = true;
G2L["d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(174, 42, 42);
G2L["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["d"]["ZIndex"] = 5;
G2L["d"]["Size"] = UDim2.new(0, 174, 0, 34);
G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["d"]["Text"] = [[INFINITY JUMP]];
G2L["d"]["Name"] = [[jump]];
G2L["d"]["Position"] = UDim2.new(0, 16, 0, 7);


-- StarterGui.s.main.main.jump.UITextSizeConstraint
G2L["e"] = Instance.new("UITextSizeConstraint", G2L["d"]);
G2L["e"]["MaxTextSize"] = 14;


-- StarterGui.s.main.main.jump.LocalScript
G2L["f"] = Instance.new("LocalScript", G2L["d"]);



-- StarterGui.s.main.main.jumpboost
G2L["10"] = Instance.new("TextButton", G2L["9"]);
G2L["10"]["TextWrapped"] = true;
G2L["10"]["BorderSizePixel"] = 0;
G2L["10"]["TextSize"] = 14;
G2L["10"]["TextScaled"] = true;
G2L["10"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["10"]["BackgroundColor3"] = Color3.fromRGB(174, 42, 42);
G2L["10"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["10"]["ZIndex"] = 2;
G2L["10"]["Size"] = UDim2.new(0, 174, 0, 34);
G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["10"]["Text"] = [[JUMP BOOST]];
G2L["10"]["Name"] = [[jumpboost]];
G2L["10"]["Position"] = UDim2.new(0, 16, 0, 141);


-- StarterGui.s.main.main.jumpboost.UITextSizeConstraint
G2L["11"] = Instance.new("UITextSizeConstraint", G2L["10"]);
G2L["11"]["MaxTextSize"] = 14;


-- StarterGui.s.main.main.jumpboost.LocalScript
G2L["12"] = Instance.new("LocalScript", G2L["10"]);



-- StarterGui.s.main.main.speed
G2L["13"] = Instance.new("TextButton", G2L["9"]);
G2L["13"]["TextWrapped"] = true;
G2L["13"]["BorderSizePixel"] = 0;
G2L["13"]["TextSize"] = 14;
G2L["13"]["TextScaled"] = true;
G2L["13"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(174, 42, 42);
G2L["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["13"]["ZIndex"] = 2;
G2L["13"]["Size"] = UDim2.new(0, 174, 0, 34);
G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["Text"] = [[SPEED BOOST]];
G2L["13"]["Name"] = [[speed]];
G2L["13"]["Position"] = UDim2.new(0, 16, 0, 108);


-- StarterGui.s.main.main.speed.UITextSizeConstraint
G2L["14"] = Instance.new("UITextSizeConstraint", G2L["13"]);
G2L["14"]["MaxTextSize"] = 14;


-- StarterGui.s.main.main.speed.LocalScript
G2L["15"] = Instance.new("LocalScript", G2L["13"]);



-- StarterGui.s.main.main.steal
G2L["16"] = Instance.new("TextButton", G2L["9"]);
G2L["16"]["TextWrapped"] = true;
G2L["16"]["BorderSizePixel"] = 0;
G2L["16"]["TextSize"] = 14;
G2L["16"]["TextScaled"] = true;
G2L["16"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(174, 42, 42);
G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["16"]["ZIndex"] = 3;
G2L["16"]["Size"] = UDim2.new(0, 174, 0, 34);
G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["Text"] = [[STEAL]];
G2L["16"]["Name"] = [[steal]];
G2L["16"]["Position"] = UDim2.new(0, 16, 0, 73);


-- StarterGui.s.main.main.steal.UITextSizeConstraint
G2L["17"] = Instance.new("UITextSizeConstraint", G2L["16"]);
G2L["17"]["MaxTextSize"] = 14;


-- StarterGui.s.main.main.steal.StealScriptOpen
G2L["18"] = Instance.new("LocalScript", G2L["16"]);
G2L["18"]["Name"] = [[StealScriptOpen]];


-- StarterGui.s.main.main.UIListLayout
G2L["19"] = Instance.new("UIListLayout", G2L["9"]);
G2L["19"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["19"]["Padding"] = UDim.new(0, 4);
G2L["19"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
G2L["19"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.s.main.main.UIPadding
G2L["1a"] = Instance.new("UIPadding", G2L["9"]);
G2L["1a"]["PaddingRight"] = UDim.new(0, 17);
G2L["1a"]["PaddingLeft"] = UDim.new(0, 17);


-- StarterGui.s.main.main.ScrollSetup
G2L["1b"] = Instance.new("LocalScript", G2L["9"]);
G2L["1b"]["Name"] = [[ScrollSetup]];


-- StarterGui.s.main.visual
G2L["1c"] = Instance.new("ScrollingFrame", G2L["2"]);
G2L["1c"]["Visible"] = false;
G2L["1c"]["Active"] = true;
G2L["1c"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
G2L["1c"]["ZIndex"] = 2;
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["Name"] = [[visual]];
G2L["1c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1c"]["Size"] = UDim2.new(1, 0, 0.88889, 0);
G2L["1c"]["Position"] = UDim2.new(0.5, 0, 0.55556, 0);
G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["BackgroundTransparency"] = 1;


-- StarterGui.s.main.visual.esp
G2L["1d"] = Instance.new("TextButton", G2L["1c"]);
G2L["1d"]["TextWrapped"] = true;
G2L["1d"]["BorderSizePixel"] = 0;
G2L["1d"]["TextSize"] = 14;
G2L["1d"]["TextScaled"] = true;
G2L["1d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(174, 42, 42);
G2L["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1d"]["ZIndex"] = 4;
G2L["1d"]["Size"] = UDim2.new(0, 174, 0, 34);
G2L["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1d"]["Text"] = [[ESP PLAYER]];
G2L["1d"]["Name"] = [[esp]];
G2L["1d"]["Position"] = UDim2.new(0, 16, 0, 41);


-- StarterGui.s.main.visual.esp.UITextSizeConstraint
G2L["1e"] = Instance.new("UITextSizeConstraint", G2L["1d"]);
G2L["1e"]["MaxTextSize"] = 14;


-- StarterGui.s.main.visual.esp.LocalScript
G2L["1f"] = Instance.new("LocalScript", G2L["1d"]);



-- StarterGui.s.main.visual.espname
G2L["20"] = Instance.new("TextButton", G2L["1c"]);
G2L["20"]["TextWrapped"] = true;
G2L["20"]["BorderSizePixel"] = 0;
G2L["20"]["TextSize"] = 14;
G2L["20"]["TextScaled"] = true;
G2L["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(174, 42, 42);
G2L["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["20"]["ZIndex"] = 5;
G2L["20"]["Size"] = UDim2.new(0, 174, 0, 34);
G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["Text"] = [[ESP NAME]];
G2L["20"]["Name"] = [[espname]];
G2L["20"]["Position"] = UDim2.new(0, 16, 0, 7);


-- StarterGui.s.main.visual.espname.UITextSizeConstraint
G2L["21"] = Instance.new("UITextSizeConstraint", G2L["20"]);
G2L["21"]["MaxTextSize"] = 14;


-- StarterGui.s.main.visual.espname.LocalScript
G2L["22"] = Instance.new("LocalScript", G2L["20"]);



-- StarterGui.s.main.visual.espbase
G2L["23"] = Instance.new("TextButton", G2L["1c"]);
G2L["23"]["TextWrapped"] = true;
G2L["23"]["BorderSizePixel"] = 0;
G2L["23"]["TextSize"] = 14;
G2L["23"]["TextScaled"] = true;
G2L["23"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["23"]["BackgroundColor3"] = Color3.fromRGB(174, 42, 42);
G2L["23"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["23"]["ZIndex"] = 2;
G2L["23"]["Size"] = UDim2.new(0, 174, 0, 34);
G2L["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["23"]["Text"] = [[ESP BASE]];
G2L["23"]["Name"] = [[espbase]];
G2L["23"]["Position"] = UDim2.new(0, 16, 0, 141);


-- StarterGui.s.main.visual.espbase.UITextSizeConstraint
G2L["24"] = Instance.new("UITextSizeConstraint", G2L["23"]);
G2L["24"]["MaxTextSize"] = 14;


-- StarterGui.s.main.visual.espbase.LocalScript
G2L["25"] = Instance.new("LocalScript", G2L["23"]);



-- StarterGui.s.main.visual.UIListLayout
G2L["26"] = Instance.new("UIListLayout", G2L["1c"]);
G2L["26"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["26"]["Padding"] = UDim.new(0, 4);
G2L["26"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
G2L["26"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.s.main.visual.UIPadding
G2L["27"] = Instance.new("UIPadding", G2L["1c"]);
G2L["27"]["PaddingRight"] = UDim.new(0, 17);
G2L["27"]["PaddingLeft"] = UDim.new(0, 17);


-- StarterGui.s.main.visual.ScrollSetup
G2L["28"] = Instance.new("LocalScript", G2L["1c"]);
G2L["28"]["Name"] = [[ScrollSetup]];


-- StarterGui.s.main.misc
G2L["29"] = Instance.new("ScrollingFrame", G2L["2"]);
G2L["29"]["Active"] = true;
G2L["29"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
G2L["29"]["ZIndex"] = 2;
G2L["29"]["BorderSizePixel"] = 0;
G2L["29"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
G2L["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["29"]["Name"] = [[misc]];
G2L["29"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["29"]["Size"] = UDim2.new(1, 0, 0.88889, 0);
G2L["29"]["Position"] = UDim2.new(0.5, 0, 0.55556, 0);
G2L["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["BackgroundTransparency"] = 1;


-- StarterGui.s.main.misc.Quantum Cloner
G2L["2a"] = Instance.new("TextButton", G2L["29"]);
G2L["2a"]["TextWrapped"] = true;
G2L["2a"]["BorderSizePixel"] = 0;
G2L["2a"]["TextSize"] = 14;
G2L["2a"]["TextScaled"] = true;
G2L["2a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2a"]["BackgroundColor3"] = Color3.fromRGB(101, 101, 101);
G2L["2a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2a"]["ZIndex"] = 4;
G2L["2a"]["Size"] = UDim2.new(0, 174, 0, 34);
G2L["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2a"]["Text"] = [[Quantum Cloner]];
G2L["2a"]["Name"] = [[Quantum Cloner]];
G2L["2a"]["Position"] = UDim2.new(0, 16, 0, 41);


-- StarterGui.s.main.misc.Quantum Cloner.UITextSizeConstraint
G2L["2b"] = Instance.new("UITextSizeConstraint", G2L["2a"]);
G2L["2b"]["MaxTextSize"] = 14;


-- StarterGui.s.main.misc.Quantum Cloner.LocalScript
G2L["2c"] = Instance.new("LocalScript", G2L["2a"]);



-- StarterGui.s.main.misc.Medusa's head
G2L["2d"] = Instance.new("TextButton", G2L["29"]);
G2L["2d"]["TextWrapped"] = true;
G2L["2d"]["BorderSizePixel"] = 0;
G2L["2d"]["TextSize"] = 14;
G2L["2d"]["TextScaled"] = true;
G2L["2d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2d"]["BackgroundColor3"] = Color3.fromRGB(101, 101, 101);
G2L["2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2d"]["ZIndex"] = 5;
G2L["2d"]["Size"] = UDim2.new(0, 174, 0, 34);
G2L["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2d"]["Text"] = [[Medusa's head]];
G2L["2d"]["Name"] = [[Medusa's head]];
G2L["2d"]["Position"] = UDim2.new(0, 16, 0, 7);


-- StarterGui.s.main.misc.Medusa's head.UITextSizeConstraint
G2L["2e"] = Instance.new("UITextSizeConstraint", G2L["2d"]);
G2L["2e"]["MaxTextSize"] = 14;


-- StarterGui.s.main.misc.Medusa's head.LocalScript
G2L["2f"] = Instance.new("LocalScript", G2L["2d"]);



-- StarterGui.s.main.misc.Invisibility Cloak
G2L["30"] = Instance.new("TextButton", G2L["29"]);
G2L["30"]["TextWrapped"] = true;
G2L["30"]["BorderSizePixel"] = 0;
G2L["30"]["TextSize"] = 14;
G2L["30"]["TextScaled"] = true;
G2L["30"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["30"]["BackgroundColor3"] = Color3.fromRGB(101, 101, 101);
G2L["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["30"]["ZIndex"] = 2;
G2L["30"]["Size"] = UDim2.new(0, 174, 0, 34);
G2L["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["30"]["Text"] = [[Invisibility Cloak]];
G2L["30"]["Name"] = [[Invisibility Cloak]];
G2L["30"]["Position"] = UDim2.new(0, 16, 0, 141);


-- StarterGui.s.main.misc.Invisibility Cloak.UITextSizeConstraint
G2L["31"] = Instance.new("UITextSizeConstraint", G2L["30"]);
G2L["31"]["MaxTextSize"] = 14;


-- StarterGui.s.main.misc.Invisibility Cloak.LocalScript
G2L["32"] = Instance.new("LocalScript", G2L["30"]);



-- StarterGui.s.main.misc.UIListLayout
G2L["33"] = Instance.new("UIListLayout", G2L["29"]);
G2L["33"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["33"]["Padding"] = UDim.new(0, 4);
G2L["33"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
G2L["33"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.s.main.misc.UIPadding
G2L["34"] = Instance.new("UIPadding", G2L["29"]);
G2L["34"]["PaddingRight"] = UDim.new(0, 17);
G2L["34"]["PaddingLeft"] = UDim.new(0, 17);


-- StarterGui.s.main.misc.ScrollSetup
G2L["35"] = Instance.new("LocalScript", G2L["29"]);
G2L["35"]["Name"] = [[ScrollSetup]];


-- StarterGui.s.main.TabSwitchingScript
G2L["36"] = Instance.new("LocalScript", G2L["2"]);
G2L["36"]["Name"] = [[TabSwitchingScript]];


-- StarterGui.s.tab
G2L["37"] = Instance.new("Frame", G2L["1"]);
G2L["37"]["BorderSizePixel"] = 0;
G2L["37"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 27);
G2L["37"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["37"]["Size"] = UDim2.new(0.21181, 0, 0.08333, 0);
G2L["37"]["Position"] = UDim2.new(0.50648, 0, 0.25541, 0);
G2L["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["37"]["Name"] = [[tab]];


-- StarterGui.s.tab.close
G2L["38"] = Instance.new("TextButton", G2L["37"]);
G2L["38"]["TextWrapped"] = true;
G2L["38"]["BorderSizePixel"] = 0;
G2L["38"]["TextSize"] = 14;
G2L["38"]["TextScaled"] = true;
G2L["38"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["38"]["BackgroundColor3"] = Color3.fromRGB(191, 26, 56);
G2L["38"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["38"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["38"]["Size"] = UDim2.new(0.11058, 0, 0.56098, 0);
G2L["38"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["38"]["Text"] = [[X]];
G2L["38"]["Name"] = [[close]];
G2L["38"]["Position"] = UDim2.new(0.91346, 0, 0.4878, 0);


-- StarterGui.s.tab.close.UITextSizeConstraint
G2L["39"] = Instance.new("UITextSizeConstraint", G2L["38"]);
G2L["39"]["MaxTextSize"] = 23;


-- StarterGui.s.tab.minimize
G2L["3a"] = Instance.new("TextButton", G2L["37"]);
G2L["3a"]["TextWrapped"] = true;
G2L["3a"]["BorderSizePixel"] = 0;
G2L["3a"]["TextSize"] = 14;
G2L["3a"]["TextScaled"] = true;
G2L["3a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3a"]["BackgroundColor3"] = Color3.fromRGB(55, 37, 191);
G2L["3a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["3a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3a"]["Size"] = UDim2.new(0.11058, 0, 0.56098, 0);
G2L["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3a"]["Text"] = [[-]];
G2L["3a"]["Name"] = [[minimize]];
G2L["3a"]["Position"] = UDim2.new(0.77404, 0, 0.4878, 0);


-- StarterGui.s.tab.minimize.UITextSizeConstraint
G2L["3b"] = Instance.new("UITextSizeConstraint", G2L["3a"]);
G2L["3b"]["MaxTextSize"] = 23;


-- StarterGui.s.tab.TextLabel
G2L["3c"] = Instance.new("TextLabel", G2L["37"]);
G2L["3c"]["TextWrapped"] = true;
G2L["3c"]["BorderSizePixel"] = 0;
G2L["3c"]["TextSize"] = 14;
G2L["3c"]["TextScaled"] = true;
G2L["3c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["3c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3c"]["BackgroundTransparency"] = 1;
G2L["3c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3c"]["Size"] = UDim2.new(0.37019, 0, 0.56098, 0);
G2L["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3c"]["Text"] = [[VORTEX]];
G2L["3c"]["Position"] = UDim2.new(0.22115, 0, 0.4878, 0);


-- StarterGui.s.tab.TextLabel.UITextSizeConstraint
G2L["3d"] = Instance.new("UITextSizeConstraint", G2L["3c"]);
G2L["3d"]["MaxTextSize"] = 23;


-- StarterGui.s.tab.LocalScript
G2L["3e"] = Instance.new("LocalScript", G2L["37"]);



-- StarterGui.s.tab.LocalScript
G2L["3f"] = Instance.new("LocalScript", G2L["37"]);



-- StarterGui.s.floatmenu
G2L["40"] = Instance.new("Frame", G2L["1"]);
G2L["40"]["Visible"] = false;
G2L["40"]["BorderSizePixel"] = 0;
G2L["40"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 45);
G2L["40"]["Size"] = UDim2.new(0.14286, 0, 0.18699, 0);
G2L["40"]["Position"] = UDim2.new(0.63092, 0, 0.51626, 0);
G2L["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["40"]["Name"] = [[floatmenu]];


-- StarterGui.s.floatmenu.off/on
G2L["41"] = Instance.new("TextButton", G2L["40"]);
G2L["41"]["BorderSizePixel"] = 0;
G2L["41"]["TextSize"] = 14;
G2L["41"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["41"]["BackgroundColor3"] = Color3.fromRGB(174, 42, 42);
G2L["41"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["41"]["Size"] = UDim2.new(0.88435, 0, 0.36957, 0);
G2L["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["41"]["Text"] = [[OFF]];
G2L["41"]["Name"] = [[off/on]];
G2L["41"]["Position"] = UDim2.new(0.05442, 0, 0.31522, 0);


-- StarterGui.s.floatmenu.off/on.LocalScript
G2L["42"] = Instance.new("LocalScript", G2L["41"]);



-- StarterGui.s.floatmenu.TextLabel
G2L["43"] = Instance.new("TextLabel", G2L["40"]);
G2L["43"]["TextWrapped"] = true;
G2L["43"]["BorderSizePixel"] = 0;
G2L["43"]["TextSize"] = 14;
G2L["43"]["TextScaled"] = true;
G2L["43"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["43"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["43"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["43"]["BackgroundTransparency"] = 1;
G2L["43"]["Size"] = UDim2.new(0.44218, 0, 0.18478, 0);
G2L["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["43"]["Text"] = [[float]];
G2L["43"]["Position"] = UDim2.new(0, 0, -0.00905, 0);


-- StarterGui.s.floatmenu.Time
G2L["44"] = Instance.new("TextLabel", G2L["40"]);
G2L["44"]["BorderSizePixel"] = 0;
G2L["44"]["TextSize"] = 14;
G2L["44"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["44"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["44"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["44"]["BackgroundTransparency"] = 1;
G2L["44"]["Size"] = UDim2.new(0.5102, 0, 0.18478, 0);
G2L["44"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["44"]["Text"] = [[00:00]];
G2L["44"]["Name"] = [[Time]];
G2L["44"]["Position"] = UDim2.new(0.2381, 0, 0.78443, 0);


-- StarterGui.s.floatmenu.DraggableFloatMenu
G2L["45"] = Instance.new("LocalScript", G2L["40"]);
G2L["45"]["Name"] = [[DraggableFloatMenu]];


-- StarterGui.s.Steal
G2L["46"] = Instance.new("Frame", G2L["1"]);
G2L["46"]["Visible"] = false;
G2L["46"]["BorderSizePixel"] = 0;
G2L["46"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 45);
G2L["46"]["Size"] = UDim2.new(0.14286, 0, 0.18699, 0);
G2L["46"]["Position"] = UDim2.new(0.62995, 0, 0.29675, 0);
G2L["46"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["46"]["Name"] = [[Steal]];


-- StarterGui.s.Steal.up/down
G2L["47"] = Instance.new("TextButton", G2L["46"]);
G2L["47"]["BorderSizePixel"] = 0;
G2L["47"]["TextSize"] = 14;
G2L["47"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["47"]["BackgroundColor3"] = Color3.fromRGB(116, 116, 116);
G2L["47"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["47"]["Size"] = UDim2.new(0.88435, 0, 0.36957, 0);
G2L["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["47"]["Text"] = [[UP]];
G2L["47"]["Name"] = [[up/down]];
G2L["47"]["Position"] = UDim2.new(0.05442, 0, 0.31522, 0);


-- StarterGui.s.Steal.up/down.LocalScript
G2L["48"] = Instance.new("LocalScript", G2L["47"]);



-- StarterGui.s.Steal.TextLabel
G2L["49"] = Instance.new("TextLabel", G2L["46"]);
G2L["49"]["TextWrapped"] = true;
G2L["49"]["BorderSizePixel"] = 0;
G2L["49"]["TextSize"] = 14;
G2L["49"]["TextScaled"] = true;
G2L["49"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["49"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["49"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["49"]["BackgroundTransparency"] = 1;
G2L["49"]["Size"] = UDim2.new(0.44218, 0, 0.18478, 0);
G2L["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["49"]["Text"] = [[steal]];
G2L["49"]["Position"] = UDim2.new(0, 0, -0.00905, 0);


-- StarterGui.s.Steal.DraggableFloatMenu
G2L["4a"] = Instance.new("LocalScript", G2L["46"]);
G2L["4a"]["Name"] = [[DraggableFloatMenu]];


-- StarterGui.s.Speed
G2L["4b"] = Instance.new("TextButton", G2L["1"]);
G2L["4b"]["BorderSizePixel"] = 0;
G2L["4b"]["TextSize"] = 14;
G2L["4b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4b"]["BackgroundColor3"] = Color3.fromRGB(71, 71, 71);
G2L["4b"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["4b"]["Size"] = UDim2.new(0, 91, 0, 33);
G2L["4b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4b"]["Text"] = [[BOOST]];
G2L["4b"]["Name"] = [[Speed]];
G2L["4b"]["Visible"] = false;
G2L["4b"]["Position"] = UDim2.new(0.46201, 0, 0.73984, 0);


-- StarterGui.s.Speed.UICorner
G2L["4c"] = Instance.new("UICorner", G2L["4b"]);
G2L["4c"]["CornerRadius"] = UDim.new(0, 4);


-- StarterGui.s.Speed.LocalScript
G2L["4d"] = Instance.new("LocalScript", G2L["4b"]);



-- StarterGui.s.Speed.DragScript
G2L["4e"] = Instance.new("LocalScript", G2L["4b"]);
G2L["4e"]["Name"] = [[DragScript]];


-- StarterGui.s.LocalScript
G2L["4f"] = Instance.new("LocalScript", G2L["1"]);



-- StarterGui.s.main.main.float.FloatButtonToggleFloatMenu
local function C_c()
local script = G2L["c"];
	local button = script.Parent
	local screenGui = button.Parent.Parent.Parent
	local floatMenu = screenGui:FindFirstChild("floatmenu")
	
	-- Color definitions
	local COLOR_ON = Color3.fromRGB(64, 149, 33)
	local COLOR_OFF = Color3.fromRGB(173, 41, 41)
	
	-- Initial state
	local isOn = false
	button.BackgroundColor3 = COLOR_OFF
	if floatMenu then
	    floatMenu.Visible = false
	end
	
	button.MouseButton1Click:Connect(function()
	    isOn = not isOn
	    if isOn then
	        button.BackgroundColor3 = COLOR_ON
	        if floatMenu then
	            floatMenu.Visible = true
	        end
	    else
	        button.BackgroundColor3 = COLOR_OFF
	        if floatMenu then
	            floatMenu.Visible = false
	        end
	    end
	end)
	
	
end;
task.spawn(C_c);
-- StarterGui.s.main.main.jump.LocalScript
local function C_f()
local script = G2L["f"];
	local button = script.Parent
	local isOn = false
	local tweenService = game:GetService("TweenService")
	local player = game:GetService("Players").LocalPlayer
	local userInputService = game:GetService("UserInputService")
	
	-- Настройки прыжка
	local COOLDOWN = 0.5
	local JUMP_FORCE = 50
	local JUMP_DURATION = 0.2
	local lastJumpTime = 0
	local isJumping = false
	
	-- Обновление вида кнопки
	local function updateButton()
		local goal = {
			BackgroundColor3 = isOn and Color3.fromRGB(64, 149, 33) or Color3.fromRGB(173, 41, 41)
		}
		tweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), goal):Play()
	end
	
	-- Функция воздушного прыжка
	local function safeAirJump()
		if not isOn then return end
		local now = os.clock()
		if now - lastJumpTime < COOLDOWN or isJumping then return end
	
		local character = player.Character
		if not character then return end
	
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		local rootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoid or not rootPart then return end
	
		isJumping = true
		lastJumpTime = now
	
		-- Оптимизация сетевого владения
		if rootPart:CanSetNetworkOwnership() then
			rootPart:SetNetworkOwner(player)
		end
	
		-- Создание временного BodyVelocity
		local bodyVelocity = Instance.new("BodyVelocity")
		bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
		bodyVelocity.Velocity = Vector3.new(0, JUMP_FORCE, 0)
		bodyVelocity.Parent = rootPart
	
		-- Очистка через соединение (более надежно, чем task.wait)
		local connection
		connection = game:GetService("RunService").Heartbeat:Connect(function()
			if os.clock() - lastJumpTime >= JUMP_DURATION then
				if bodyVelocity and bodyVelocity.Parent then
					bodyVelocity:Destroy()
				end
				if rootPart:CanSetNetworkOwnership() then
					rootPart:SetNetworkOwner(nil)
				end
				isJumping = false
				connection:Disconnect()
			end
		end)
	end
	
	-- Инициализация
	button.MouseButton1Click:Connect(function()
		isOn = not isOn
		updateButton()
	end)
	
	-- Обработчик прыжка
	userInputService.JumpRequest:Connect(function()
		if isOn then
			safeAirJump()
		end
	end)
	
	-- Начальное состояние кнопки
	button.BackgroundColor3 = Color3.fromRGB(167, 31, 31)
end;
task.spawn(C_f);
-- StarterGui.s.main.main.jumpboost.LocalScript
local function C_12()
local script = G2L["12"];
	local button = script.Parent
	local isOn = false
	local tweenService = game:GetService("TweenService")
	local player = game:GetService("Players").LocalPlayer
	local userInputService = game:GetService("UserInputService")
	local runService = game:GetService("RunService")
	
	local COOLDOWN = 1.0
	local JUMP_POWER = 120
	local JUMP_DURATION = 0.25
	local lastJumpTime = 0
	local isJumping = false
	local activeBodyVelocity = nil
	local activeConnection = nil
	
	local function updateButton()
		tweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundColor3 = isOn and Color3.fromRGB(64, 149, 33) or Color3.fromRGB(173, 41, 41)
		}):Play()
	end
	
	local function cleanJump()
		if activeBodyVelocity and activeBodyVelocity.Parent then
			activeBodyVelocity:Destroy()
			activeBodyVelocity = nil
		end
	
		if activeConnection then
			activeConnection:Disconnect()
			activeConnection = nil
		end
	
		isJumping = false
	end
	
	local function highJump()
		if not isOn or isJumping then return end
		local now = os.clock()
		if now - lastJumpTime < COOLDOWN then return end
	
		local character = player.Character
		if not character then return end
	
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		local rootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoid or not rootPart then return end
	
		isJumping = true
		lastJumpTime = now
	
		-- Очистка предыдущих объектов
		cleanJump()
	
		-- Установка сетевого владения
		if rootPart:CanSetNetworkOwnership() then
			rootPart:SetNetworkOwner(player)
		end
	
		-- Создание физики прыжка
		activeBodyVelocity = Instance.new("BodyVelocity")
		activeBodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
		activeBodyVelocity.Velocity = Vector3.new(0, JUMP_POWER, 0)
		activeBodyVelocity.Parent = rootPart
	
		-- Таймер отключения прыжка
		activeConnection = runService.Heartbeat:Connect(function()
			if os.clock() - lastJumpTime >= JUMP_DURATION then
				cleanJump()
	
				-- Сброс сетевого владения
				if rootPart and rootPart:CanSetNetworkOwnership() then
					rootPart:SetNetworkOwner(nil)
				end
			end
		end)
	end
	
	button.MouseButton1Click:Connect(function()
		isOn = not isOn
		updateButton()
	
		-- Принудительная очистка при выключении
		if not isOn then
			cleanJump()
		end
	end)
	
	userInputService.JumpRequest:Connect(highJump)
	
	-- Очистка при смерти персонажа
	player.CharacterAdded:Connect(function(character)
		character:WaitForChild("Humanoid").Died:Connect(cleanJump)
	end)
	
	-- Инициализация кнопки
	button.BackgroundColor3 = Color3.fromRGB(167, 31, 31)
end;
task.spawn(C_12);
-- StarterGui.s.main.main.speed.LocalScript
local function C_15()
local script = G2L["15"];
	local button = script.Parent
	local tweenService = game:GetService("TweenService")
	local screenGui = button:FindFirstAncestorOfClass("ScreenGui")
	local floatMenu = screenGui and screenGui:FindFirstChild("Speed")
	
	if floatMenu then
		local isOn = false
		local TWEEN_INFO = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local COLOR_ON = Color3.fromRGB(64, 149, 33)
		local COLOR_OFF = Color3.fromRGB(173, 41, 41)
	
		local function updateButtonState()
			isOn = floatMenu.Visible
			local targetColor = isOn and COLOR_ON or COLOR_OFF
			tweenService:Create(button, TWEEN_INFO, {BackgroundColor3 = targetColor}):Play()
		end
	
		local function toggleMenu()
			floatMenu.Visible = not floatMenu.Visible
			updateButtonState()
		end
	
		-- Подключение событий
		local buttonConnection = button.MouseButton1Click:Connect(toggleMenu)
		local visibleConnection = floatMenu:GetPropertyChangedSignal("Visible"):Connect(updateButtonState)
	
		-- Очистка при уничтожении
		button.AncestryChanged:Connect(function()
			if not button:IsDescendantOf(game) then
				floatMenu.Visible = false
				buttonConnection:Disconnect()
				visibleConnection:Disconnect()
			end
		end)
	
		-- Инициализация начального состояния
		updateButtonState()
	else
		warn("FloatMenu not found in ScreenGui")
	end
end;
task.spawn(C_15);
-- StarterGui.s.main.main.steal.StealScriptOpen
local function C_18()
local script = G2L["18"];
	local button = script.Parent
	local screenGui = button.Parent.Parent.Parent
	local floatMenu = screenGui:FindFirstChild("Steal")
	
	-- Color definitions
	local COLOR_ON = Color3.fromRGB(64, 149, 33)
	local COLOR_OFF = Color3.fromRGB(173, 41, 41)
	
	-- Initial state
	local isOn = false
	button.BackgroundColor3 = COLOR_OFF
	if floatMenu then
	    floatMenu.Visible = false
	end
	
	button.MouseButton1Click:Connect(function()
	    isOn = not isOn
	    if isOn then
	        button.BackgroundColor3 = COLOR_ON
	        if floatMenu then
	            floatMenu.Visible = true
	        end
	    else
	        button.BackgroundColor3 = COLOR_OFF
	        if floatMenu then
	            floatMenu.Visible = false
	        end
	    end
	end)
	
	
end;
task.spawn(C_18);
-- StarterGui.s.main.main.ScrollSetup
local function C_1b()
local script = G2L["1b"];
	local scrollingFrame = script.Parent
	local uiListLayout = scrollingFrame:FindFirstChildOfClass("UIListLayout") or Instance.new("UIListLayout", scrollingFrame)
	
	-- Настройки UIListLayout
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.FillDirection = Enum.FillDirection.Vertical
	uiListLayout.Padding = UDim.new(0, 5)
	uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	
	-- Функция для обновления CanvasSize
	local function updateCanvasSize()
		local totalHeight = 0
		for _, child in ipairs(scrollingFrame:GetChildren()) do
			if child:IsA("GuiObject") and child.Visible then
				totalHeight = totalHeight + child.Size.Y.Offset + uiListLayout.Padding.Offset
			end
		end
		scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
	end
	
	-- События для обновления
	scrollingFrame.ChildAdded:Connect(updateCanvasSize)
	scrollingFrame.ChildRemoved:Connect(updateCanvasSize)
	updateCanvasSize()
end;
task.spawn(C_1b);
-- StarterGui.s.main.visual.esp.LocalScript
local function C_1f()
local script = G2L["1f"];
	local button = script.Parent
	local isOn = false
	local tweenService = game:GetService("TweenService")
	local players = game:GetService("Players")
	local highlights = {}
	
	local function createESP(player)
		if not player.Character then return end
	
		local highlight = Instance.new("Highlight")
		highlight.Parent = player.Character
		highlight.FillTransparency = 1
		highlight.OutlineColor = Color3.new(1, 1, 1)
		highlight.OutlineTransparency = 0
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	
		highlights[player] = highlight
	
		player.CharacterAdded:Connect(function(character)
			if isOn then
				local newHighlight = highlight:Clone()
				newHighlight.Parent = character
				highlights[player] = newHighlight
			end
		end)
	end
	
	button.MouseButton1Click:Connect(function()
		isOn = not isOn
		local goal = {
			BackgroundColor3 = isOn and Color3.fromRGB(64, 149, 33) or Color3.fromRGB(173, 41, 41)
		}
		local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		tweenService:Create(button, tweenInfo, goal):Play()
	
		if isOn then
			for _, player in ipairs(players:GetPlayers()) do
				if player ~= players.LocalPlayer then
					createESP(player)
				end
			end
		else
			for player, highlight in pairs(highlights) do
				highlight:Destroy()
			end
			highlights = {}
		end
	end)
	
	players.PlayerAdded:Connect(function(player)
		if isOn then
			player.CharacterAdded:Connect(function()
				createESP(player)
			end)
		end
	end)
	
	button.BackgroundColor3 = Color3.fromRGB(167, 31, 31)
end;
task.spawn(C_1f);
-- StarterGui.s.main.visual.espname.LocalScript
local function C_22()
local script = G2L["22"];
	local button = script.Parent
	local isOn = false
	local tweenService = game:GetService("TweenService")
	local players = game:GetService("Players")
	local player = players.LocalPlayer
	local espStorage = {}
	
	local function createNameTag(targetPlayer)
		if not targetPlayer.Character then return end
	
		local character = targetPlayer.Character
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
		local billboardGui = Instance.new("BillboardGui")
		local textLabel = Instance.new("TextLabel")
	
		billboardGui.Name = "PlayerESP"
		billboardGui.Adornee = humanoidRootPart
		billboardGui.Size = UDim2.new(0, 200, 0, 50)
		billboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
		billboardGui.AlwaysOnTop = true
		billboardGui.LightInfluence = 0
		billboardGui.MaxDistance = 1000
	
		textLabel.Name = "NameTag"
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = targetPlayer.Name
		textLabel.TextColor3 = Color3.new(1, 1, 1)
		textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
		textLabel.TextStrokeTransparency = 0.5
		textLabel.Font = Enum.Font.Gotham
		textLabel.TextSize = 18
		textLabel.TextScaled = false
	
		textLabel.Parent = billboardGui
		billboardGui.Parent = character
	
		espStorage[targetPlayer] = billboardGui
	
		targetPlayer.CharacterAdded:Connect(function(newChar)
			if isOn then
				billboardGui:Destroy()
				createNameTag(targetPlayer)
			end
		end)
	end
	
	local function toggleESP(state)
		if state then
			for _, targetPlayer in ipairs(players:GetPlayers()) do
				if targetPlayer ~= player then
					createNameTag(targetPlayer)
				end
			end
		else
			for _, esp in pairs(espStorage) do
				esp:Destroy()
			end
			espStorage = {}
		end
	end
	
	button.MouseButton1Click:Connect(function()
		isOn = not isOn
		local goal = {
			BackgroundColor3 = isOn and Color3.fromRGB(72, 167, 28) or Color3.fromRGB(167, 31, 31)
		}
		local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		tweenService:Create(button, tweenInfo, goal):Play()
	
		toggleESP(isOn)
	end)
	
	players.PlayerAdded:Connect(function(newPlayer)
		if isOn then
			createNameTag(newPlayer)
		end
	end)
	
	button.BackgroundColor3 = Color3.fromRGB(167, 31, 31)
end;
task.spawn(C_22);
-- StarterGui.s.main.visual.espbase.LocalScript
local function C_25()
local script = G2L["25"];
	local button = script.Parent
	local isOn = false
	local tweenService = game:GetService("TweenService")
	local runService = game:GetService("RunService")
	local camera = workspace.CurrentCamera
	
	-- Try to get Plots folder directly
	local plotsFolder = workspace:FindFirstChild("Plots")
	local lteInstances = {}
	local espThread = nil
	
	-- ESP configuration
	local ESP_CONFIG = {
		MAX_DISTANCE = 1000,
		UPDATE_INTERVAL = 0.5,
		BASE_SIZE = UDim2.new(0, 180, 0, 40),
		OFFSET = Vector3.new(0, 5, 0),
		COLORS = {
			yourPlot = Color3.fromRGB(0, 255, 0),
			locked = Color3.fromRGB(255, 255, 0),
			unlocked = Color3.fromRGB(255, 50, 50)
		}
	}
	
	-- Initialize button color
	button.BackgroundColor3 = Color3.fromRGB(167, 31, 31)
	
	local function findPlayerPlot()
		if not plotsFolder then return nil end
		for i, plot in plotsFolder:GetChildren() do
			local yourBase = plot:FindFirstChild("YourBase", true)
			if yourBase and yourBase:IsA("BoolValue") and yourBase.Value then
				return plot.Name
			end
		end
		return nil
	end
	
	local function createESP(plot, mainPart)
		if lteInstances[plot.Name] then
			lteInstances[plot.Name]:Destroy()
		end
	
		local billboard = Instance.new("BillboardGui")
		billboard.Name = "PlotESP_"..plot.Name
		billboard.Size = ESP_CONFIG.BASE_SIZE
		billboard.StudsOffset = ESP_CONFIG.OFFSET
		billboard.AlwaysOnTop = true
		billboard.Adornee = mainPart
		billboard.MaxDistance = ESP_CONFIG.MAX_DISTANCE
		billboard.Parent = plot
	
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(1, 0, 1, 0)
		frame.BackgroundTransparency = 0.8
		frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		frame.BorderSizePixel = 0
	
		local label = Instance.new("TextLabel")
		label.Name = "Label"
		label.Size = UDim2.new(1, -10, 1, -10)
		label.Position = UDim2.new(0, 5, 0, 5)
		label.BackgroundTransparency = 1
		label.TextScaled = true
		label.Font = Enum.Font.GothamBold
		label.TextStrokeTransparency = 0.5
		label.TextStrokeColor3 = Color3.new(0, 0, 0)
		label.Parent = frame
	
		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 6)
		corner.Parent = frame
	
		frame.Parent = billboard
		lteInstances[plot.Name] = billboard
	
		return billboard
	end
	
	local function updateESP()
		if not plotsFolder then return end
		local playerPlot = findPlayerPlot()
	
		for i, plot in plotsFolder:GetChildren() do
			local purchases = plot:FindFirstChild("Purchases")
			local plotBlock = purchases and purchases:FindFirstChild("PlotBlock")
			local mainPart = plotBlock and plotBlock:FindFirstChild("Main")
			local billboardGui = mainPart and mainPart:FindFirstChild("BillboardGui")
			local timeLabel = billboardGui and billboardGui:FindFirstChild("RemainingTime")
	
			if timeLabel and mainPart then
				local billboard = lteInstances[plot.Name] or createESP(plot, mainPart)
				local frame = billboard:FindFirstChild("Frame")
				local label = frame and frame:FindFirstChild("Label")
				local isUnlocked = (timeLabel.Text == "0s")
				if label then
					label.Text = isUnlocked and "Unlocked" or ("Locked: "..timeLabel.Text)
					if plot.Name == playerPlot then
						label.TextColor3 = ESP_CONFIG.COLORS.yourPlot
					elseif isUnlocked then
						label.TextColor3 = ESP_CONFIG.COLORS.unlocked
					else
						label.TextColor3 = ESP_CONFIG.COLORS.locked
					end
				end
	
				-- Dynamic scaling
				if camera and billboard.Adornee then
					local distance = (camera.CFrame.Position - billboard.Adornee.Position).Magnitude
					local scale = math.clamp(1 - (distance/ESP_CONFIG.MAX_DISTANCE), 0.6, 1.2)
					billboard.Size = UDim2.new(0, ESP_CONFIG.BASE_SIZE.X.Offset * scale, 0, ESP_CONFIG.BASE_SIZE.Y.Offset * scale)
				end
			elseif lteInstances[plot.Name] then
				lteInstances[plot.Name]:Destroy()
				lteInstances[plot.Name] = nil
			end
		end
	end
	
	local function clearESP()
		for k, instance in lteInstances do
			instance:Destroy()
		end
		lteInstances = {}
	end
	
	button.MouseButton1Click:Connect(function()
		isOn = not isOn
	
		tweenService:Create(button, TweenInfo.new(0.2), {
			BackgroundColor3 = isOn and Color3.fromRGB(64, 149, 33) or Color3.fromRGB(173, 41, 41)
		}):Play()
	
		if isOn then
			if espThread then
				espThread:Disconnect()
				espThread = nil
			end
			espThread = runService.RenderStepped:Connect(function()
				updateESP()
			end)
		else
			if espThread then
				espThread:Disconnect()
				espThread = nil
			end
			clearESP()
		end
	end)
	
	
end;
task.spawn(C_25);
-- StarterGui.s.main.visual.ScrollSetup
local function C_28()
local script = G2L["28"];
	local scrollingFrame = script.Parent
	local uiListLayout = scrollingFrame:FindFirstChildOfClass("UIListLayout") or Instance.new("UIListLayout", scrollingFrame)
	
	-- Настройки UIListLayout
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.FillDirection = Enum.FillDirection.Vertical
	uiListLayout.Padding = UDim.new(0, 5)
	uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	
	-- Функция для обновления CanvasSize
	local function updateCanvasSize()
		local totalHeight = 0
		for _, child in ipairs(scrollingFrame:GetChildren()) do
			if child:IsA("GuiObject") and child.Visible then
				totalHeight = totalHeight + child.Size.Y.Offset + uiListLayout.Padding.Offset
			end
		end
		scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
	end
	
	-- События для обновления
	scrollingFrame.ChildAdded:Connect(updateCanvasSize)
	scrollingFrame.ChildRemoved:Connect(updateCanvasSize)
	updateCanvasSize()
end;
task.spawn(C_28);
-- StarterGui.s.main.misc.Quantum Cloner.LocalScript
local function C_2c()
local script = G2L["2c"];
	local button = script.Parent
	local remote = game:GetService("ReplicatedStorage").Packages.Net["RF/CoinsShopService/RequestBuy"]
	
	button.MouseButton1Click:Connect(function()
		local success, result = pcall(function()
			return remote:InvokeServer("Quantum Cloner")
		end)
	end)
	
	
	
end;
task.spawn(C_2c);
-- StarterGui.s.main.misc.Medusa's head.LocalScript
local function C_2f()
local script = G2L["2f"];
	local button = script.Parent
	local remote = game:GetService("ReplicatedStorage").Packages.Net["RF/CoinsShopService/RequestBuy"]
	
	button.MouseButton1Click:Connect(function()
		local success, result = pcall(function()
			return remote:InvokeServer("Medusa's Head")
		end)
	end)
	
	
	
end;
task.spawn(C_2f);
-- StarterGui.s.main.misc.Invisibility Cloak.LocalScript
local function C_32()
local script = G2L["32"];
	local button = script.Parent
	local remote = game:GetService("ReplicatedStorage").Packages.Net["RF/CoinsShopService/RequestBuy"]
	
	button.MouseButton1Click:Connect(function()
		local success, result = pcall(function()
			return remote:InvokeServer("Invisibility Cloak")
		end)
	end)
	
	
	
end;
task.spawn(C_32);
-- StarterGui.s.main.misc.ScrollSetup
local function C_35()
local script = G2L["35"];
	local scrollingFrame = script.Parent
	local uiListLayout = scrollingFrame:FindFirstChildOfClass("UIListLayout") or Instance.new("UIListLayout", scrollingFrame)
	
	-- Настройки UIListLayout
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.FillDirection = Enum.FillDirection.Vertical
	uiListLayout.Padding = UDim.new(0, 5)
	uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	
	-- Функция для обновления CanvasSize
	local function updateCanvasSize()
		local totalHeight = 0
		for _, child in ipairs(scrollingFrame:GetChildren()) do
			if child:IsA("GuiObject") and child.Visible then
				totalHeight = totalHeight + child.Size.Y.Offset + uiListLayout.Padding.Offset
			end
		end
		scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
	end
	
	-- События для обновления
	scrollingFrame.ChildAdded:Connect(updateCanvasSize)
	scrollingFrame.ChildRemoved:Connect(updateCanvasSize)
	updateCanvasSize()
end;
task.spawn(C_35);
-- StarterGui.s.main.TabSwitchingScript
local function C_36()
local script = G2L["36"];
	-- Tab switching script for main, visual, misc tabs
	local mainFrame = script.Parent
	
	local mainTab = mainFrame:FindFirstChild("main")
	local visualTab = mainFrame:FindFirstChild("visual")
	local miscTab = mainFrame:FindFirstChild("misc")
	
	local mainBtn = mainFrame:FindFirstChild("mainbtn")
	local visualBtn = mainFrame:FindFirstChild("visualbtn")
	local miscBtn = mainFrame:FindFirstChild("miscbtn")
	
	local tabs = {
	    main = mainTab,
	    visual = visualTab,
	    misc = miscTab
	}
	local buttons = {
	    main = mainBtn,
	    visual = visualBtn,
	    misc = miscBtn
	}
	
	-- Helper to show only the selected tab
	local function showTab(tabName)
	    for k, tab in tabs do
	        if tab then
	            tab.Visible = (k == tabName)
	        end
	    end
	end
	
	-- Connect button events
	for k, btn in buttons do
	    if btn then
	        btn.MouseButton1Click:Connect(function()
	            showTab(k)
	        end)
	    end
	end
	
	-- Initial state: show main tab, hide others
	showTab("main")
	
	
end;
task.spawn(C_36);
-- StarterGui.s.tab.LocalScript
local function C_3e()
local script = G2L["3e"];
	local UserInputService = game:GetService("UserInputService")
	local tab = script.Parent
	local main = tab.Parent:FindFirstChild("main")
	local minimizeBtn = tab:FindFirstChild("minimize")
	local closeBtn = tab:FindFirstChild("close")
	
	tab.Active = true
	tab.Selectable = true
	
	local dragging = false
	local dragInput = nil
	local dragStart = nil
	local tabStartPos = nil
	local mainStartPos = nil
	local offsetMain = nil
	
	local function update(input)
	    local delta = input.Position - dragStart
	    tab.Position = UDim2.new(
	        tabStartPos.X.Scale,
	        tabStartPos.X.Offset + delta.X,
	        tabStartPos.Y.Scale,
	        tabStartPos.Y.Offset + delta.Y
	    )
	    if main then
	        main.Position = UDim2.new(
	            tab.Position.X.Scale + offsetMain.X.Scale,
	            tab.Position.X.Offset + offsetMain.X.Offset,
	            tab.Position.Y.Scale + offsetMain.Y.Scale,
	            tab.Position.Y.Offset + offsetMain.Y.Offset
	        )
	    end
	end
	
	tab.InputBegan:Connect(function(input)
	    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
	        dragging = true
	        dragInput = input
	        dragStart = input.Position
	        tabStartPos = tab.Position
	        if main then
	            mainStartPos = main.Position
	            offsetMain = UDim2.new(
	                main.Position.X.Scale - tab.Position.X.Scale,
	                main.Position.X.Offset - tab.Position.X.Offset,
	                main.Position.Y.Scale - tab.Position.Y.Scale,
	                main.Position.Y.Offset - tab.Position.Y.Offset
	            )
	        end
	
	        local conn
	        conn = input.Changed:Connect(function()
	            if input.UserInputState == Enum.UserInputState.End then
	                dragging = false
	                dragInput = nil
	                if conn then
	                    conn:Disconnect()
	                end
	            end
	        end)
	    end
	end)
	
	tab.InputChanged:Connect(function(input)
	    if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragging then
	        dragInput = input
	    end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
	    if input == dragInput and dragging then
	        update(input)
	    end
	end)
	
	UserInputService.InputEnded:Connect(function(input)
	    if input == dragInput then
	        dragging = false
	        dragInput = nil
	    end
	end)
	
	-- Minimize button logic: toggles main frame visibility
	if minimizeBtn and main then
	    minimizeBtn.MouseButton1Click:Connect(function()
	        main.Visible = not main.Visible
	    end)
	end
	
	-- Close button logic: hides both tab and main frames
	if closeBtn then
	    closeBtn.MouseButton1Click:Connect(function()
	        tab.Visible = false
	        if main then
	            main.Visible = false
	        end
	    end)
	end
end;
task.spawn(C_3e);
-- StarterGui.s.tab.LocalScript
local function C_3f()
local script = G2L["3f"];
	local UserInputService = game:GetService("UserInputService")
	local frame = script.Parent
	
	frame.Active = true
	
	local dragging = false
	local dragInput = nil
	local mousePos = nil
	local framePos = nil
	
	local function update(input)
		local delta = input.Position - mousePos
		frame.Position = UDim2.new(
			framePos.X.Scale,
			framePos.X.Offset + delta.X,
			framePos.Y.Scale,
			framePos.Y.Offset + delta.Y
		)
	end
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragInput = input
			mousePos = input.Position
			framePos = frame.Position
	
			-- End drag when input ends (mouse up or finger lifted)
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
					dragInput = nil
				end
			end)
		end
	end)
	
	frame.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragging then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
	
	-- Also end drag if user releases mouse or touch outside the frame
	UserInputService.InputEnded:Connect(function(input)
		if input == dragInput then
			dragging = false
			dragInput = nil
		end
	end)
	
end;
task.spawn(C_3f);
-- StarterGui.s.floatmenu.off/on.LocalScript
local function C_42()
local script = G2L["42"];
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	
	local button = script.Parent
	
	-- Color definitions
	local COLOR_ON = Color3.fromRGB(64, 149, 33)
	local COLOR_OFF = Color3.fromRGB(173, 41, 41)
	
	-- Float parameters
	local FLOAT_SPEED = 40
	local FLOAT_DURATION = 15
	local FLOAT_RISE = 2.7 -- Only rise by 2.7 units
	
	local isOn = false
	local floatEndTime = 0
	local floatConn = nil
	local timerConn = nil
	local startY = nil
	
	-- Helper to get character and humanoid/root
	local function getCharacter()
		local player = Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoid = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid")
		local rootPart = character:FindFirstChild("HumanoidRootPart") or character:WaitForChild("HumanoidRootPart")
		return character, humanoid, rootPart
	end
	
	-- Helper to get timer label if exists
	local function getTimerLabel()
		local parent = button.Parent
		if parent then
			return parent:FindFirstChild("Time")
		end
		return nil
	end
	
	-- Update timer label
	local function updateTimerLabel()
		local timeLabel = getTimerLabel()
		if not timeLabel then return end
		if not isOn or floatEndTime == 0 then
			timeLabel.Text = "00:00"
			return
		end
		local remaining = math.max(0, floatEndTime - os.time())
		local minutes = math.floor(remaining / 60)
		local seconds = remaining % 60
		timeLabel.Text = string.format("%02d:%02d", minutes, seconds)
	end
	
	-- Stop floating
	local function stopFloat()
		isOn = false
		button.BackgroundColor3 = COLOR_OFF
		button.Text = "OFF"
		floatEndTime = 0
		startY = nil
		if floatConn then
			floatConn:Disconnect()
			floatConn = nil
		end
		if timerConn then
			timerConn:Disconnect()
			timerConn = nil
		end
		updateTimerLabel()
	end
	
	-- Start floating
	local function startFloat()
		isOn = true
		button.BackgroundColor3 = COLOR_ON
		button.Text = "ON"
		floatEndTime = os.time() + FLOAT_DURATION
		local character, humanoid, rootPart = getCharacter()
		if not humanoid or not rootPart then stopFloat() return end
	
		startY = rootPart.Position.Y
	
		floatConn = RunService.Heartbeat:Connect(function()
			if not isOn then return end
			if os.time() >= floatEndTime then
				stopFloat()
				return
			end
			updateTimerLabel()
			if humanoid.Health > 0 then
				humanoid:ChangeState(Enum.HumanoidStateType.Flying)
				local camera = workspace.CurrentCamera
				local lookVector = camera and camera.CFrame.LookVector or Vector3.new(0,0,-1)
				-- Only horizontal movement, no vertical
				lookVector = Vector3.new(lookVector.X, 0, lookVector.Z)
				if lookVector.Magnitude > 0 then
					lookVector = lookVector.Unit
				end
	
				-- Clamp Y position to startY + FLOAT_RISE
				local pos = rootPart.Position
				local maxY = startY + FLOAT_RISE
				if pos.Y < maxY then
					-- Allow a gentle rise up to maxY
					local riseSpeed = math.min(FLOAT_SPEED, (maxY - pos.Y) * 10)
					rootPart.AssemblyLinearVelocity = lookVector * FLOAT_SPEED + Vector3.new(0, riseSpeed, 0)
				else
					-- Only horizontal movement, keep Y velocity zero
					rootPart.AssemblyLinearVelocity = lookVector * FLOAT_SPEED
					-- Snap to maxY if slightly above due to physics
					if math.abs(pos.Y - maxY) > 0.1 then
						rootPart.CFrame = CFrame.new(pos.X, maxY, pos.Z, rootPart.CFrame:VectorToWorldSpace(Vector3.new(1,0,0)), rootPart.CFrame:VectorToWorldSpace(Vector3.new(0,1,0)), rootPart.CFrame:VectorToWorldSpace(Vector3.new(0,0,1)))
					end
				end
			end
		end)
	
		timerConn = RunService.RenderStepped:Connect(function()
			updateTimerLabel()
		end)
	
		humanoid.Died:Connect(function()
			stopFloat()
		end)
	end
	
	-- Toggle logic
	local function toggle()
		if isOn then
			stopFloat()
		else
			startFloat()
		end
	end
	
	-- Initial state
	button.BackgroundColor3 = COLOR_OFF
	button.Text = "OFF"
	updateTimerLabel()
	
	button.MouseButton1Click:Connect(toggle)
	
	Players.LocalPlayer.CharacterAdded:Connect(function()
		stopFloat()
	end)
end;
task.spawn(C_42);
-- StarterGui.s.floatmenu.DraggableFloatMenu
local function C_45()
local script = G2L["45"];
	local UserInputService = game:GetService("UserInputService")
	local frame = script.Parent
	
	-- Ensure the frame is draggable regardless of any 'tab' or 'main' frame.
	frame.Active = true
	frame.Selectable = true
	
	local dragging = false
	local dragInput = nil
	local mousePos = nil
	local framePos = nil
	
	local function update(input)
		local delta = input.Position - mousePos
		frame.Position = UDim2.new(
			framePos.X.Scale,
			framePos.X.Offset + delta.X,
			framePos.Y.Scale,
			framePos.Y.Offset + delta.Y
		)
	end
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragInput = input
			mousePos = input.Position
			framePos = frame.Position
	
			local conn
			conn = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
					dragInput = nil
					if conn then
						conn:Disconnect()
					end
				end
			end)
		end
	end)
	
	frame.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragging then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
	
	UserInputService.InputEnded:Connect(function(input)
		if input == dragInput then
			dragging = false
			dragInput = nil
		end
	end)
	
	-- This script will make the frame draggable even if there is no 'tab' or 'main' frame.
	
	
end;
task.spawn(C_45);
-- StarterGui.s.Steal.up/down.LocalScript
local function C_48()
local script = G2L["48"];
	local button = script.Parent
	local player = game:GetService("Players").LocalPlayer
	local char = player.Character or player.CharacterAdded:Wait()
	local root = char:WaitForChild("HumanoidRootPart")
	
	local function updateCharacter()
		char = player.Character or player.CharacterAdded:Wait()
		root = char:WaitForChild("HumanoidRootPart")
	end
	
	local function teleportToSky()
		if not root then updateCharacter() end
		if root then
			root.CFrame = root.CFrame + Vector3.new(0, 200, 0)
		end
	end
	
	local function teleportToGround()
		if not root then updateCharacter() end
		if root then
			root.CFrame = root.CFrame - Vector3.new(0, 50, 0)
		end
	end
	
	local teleportState = "UP"
	
	button.MouseButton1Click:Connect(function()
		if teleportState == "UP" then
			teleportToSky()
			button.Text = "DOWN"
			teleportState = "DOWN"
		else
			teleportToGround()
			button.Text = "UP"
			teleportState = "UP"
		end
	end)
	
	player.CharacterAdded:Connect(function(newChar)
		char = newChar
		root = newChar:WaitForChild("HumanoidRootPart")
	end)
end;
task.spawn(C_48);
-- StarterGui.s.Steal.DraggableFloatMenu
local function C_4a()
local script = G2L["4a"];
	local UserInputService = game:GetService("UserInputService")
	local frame = script.Parent
	
	-- Ensure the frame is draggable regardless of any 'tab' or 'main' frame.
	frame.Active = true
	frame.Selectable = true
	
	local dragging = false
	local dragInput = nil
	local mousePos = nil
	local framePos = nil
	
	local function update(input)
		local delta = input.Position - mousePos
		frame.Position = UDim2.new(
			framePos.X.Scale,
			framePos.X.Offset + delta.X,
			framePos.Y.Scale,
			framePos.Y.Offset + delta.Y
		)
	end
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragInput = input
			mousePos = input.Position
			framePos = frame.Position
	
			local conn
			conn = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
					dragInput = nil
					if conn then
						conn:Disconnect()
					end
				end
			end)
		end
	end)
	
	frame.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragging then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
	
	UserInputService.InputEnded:Connect(function(input)
		if input == dragInput then
			dragging = false
			dragInput = nil
		end
	end)
	
	-- This script will make the frame draggable even if there is no 'tab' or 'main' frame.
	
	
end;
task.spawn(C_4a);
-- StarterGui.s.Speed.LocalScript
local function C_4d()
local script = G2L["4d"];
	local button = script.Parent
	local tweenService = game:GetService("TweenService")
	local textLabel = button:FindFirstChild("TextLabel") or button:FindFirstChildOfClass("TextLabel")
	local player = game:GetService("Players").LocalPlayer
	local runService = game:GetService("RunService")
	
	local isBoosted = false
	local defaultSpeed = 24
	local boostedSpeed = 50
	local currentConnection = nil
	
	local function updateBoost()
		if textLabel then
			textLabel.Text = isBoosted and "BOOST ON" or "BOOST OFF"
		end
	
		local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		tweenService:Create(button, tweenInfo, {
			BackgroundColor3 = isBoosted and Color3.fromRGB(72, 167, 28) or Color3.fromRGB(167, 31, 31)
		}):Play()
	
		if currentConnection then
			currentConnection:Disconnect()
			currentConnection = nil
		end
	
		if isBoosted then
			currentConnection = runService.Heartbeat:Connect(function()
				local character = player.Character
				if character then
					local humanoid = character:FindFirstChildOfClass("Humanoid")
					local rootPart = character:FindFirstChild("HumanoidRootPart")
	
					if humanoid and rootPart and humanoid.MoveDirection.Magnitude > 0 then
						local moveDir = humanoid.MoveDirection
						rootPart.Velocity = Vector3.new(
							moveDir.X * boostedSpeed,
							rootPart.Velocity.Y,
							moveDir.Z * boostedSpeed
						)
					end
				end
			end)
		end
	end
	
	button.MouseButton1Click:Connect(function()
		isBoosted = not isBoosted
		updateBoost()
	end)
	
	if textLabel then
		textLabel.Text = "BOOST OFF"
	end
	button.BackgroundColor3 = Color3.fromRGB(167, 31, 31)
end;
task.spawn(C_4d);
-- StarterGui.s.Speed.DragScript
local function C_4e()
local script = G2L["4e"];
	local UserInputService = game:GetService("UserInputService")
	local frame = script.Parent
	
	frame.Active = true
	
	local dragging = false
	local dragInput = nil
	local mousePos = nil
	local framePos = nil
	
	local function update(input)
		local delta = input.Position - mousePos
		frame.Position = UDim2.new(
			framePos.X.Scale,
			framePos.X.Offset + delta.X,
			framePos.Y.Scale,
			framePos.Y.Offset + delta.Y
		)
	end
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragInput = input
			mousePos = input.Position
			framePos = frame.Position
	
			-- End drag when input ends (mouse up or finger lifted)
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
					dragInput = nil
				end
			end)
		end
	end)
	
	frame.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragging then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
	
	-- Also end drag if user releases mouse or touch outside the frame
	UserInputService.InputEnded:Connect(function(input)
		if input == dragInput then
			dragging = false
			dragInput = nil
		end
	end)
	
end;
task.spawn(C_4e);
-- StarterGui.s.LocalScript
local function C_4f()
local script = G2L["4f"];
	-- Tab switching script for main, visual, misc tabs
	local screenGui = script.Parent.Parent
	local mainTab = screenGui:FindFirstChild("main")
	local visualTab = mainTab and mainTab:FindFirstChild("visual")
	local mainScrolling = mainTab and mainTab:FindFirstChild("main")
	local miscTab = mainTab and mainTab:FindFirstChild("misc")
	
	-- Buttons (assume they are direct children of ScreenGui or a known container)
	local mainBtn = screenGui:FindFirstChild("mainbtn")
	local visualBtn = screenGui:FindFirstChild("visualbtn")
	local miscBtn = screenGui:FindFirstChild("miscbtn")
	
	-- Tabs and buttons mapping
	local tabs = {
	    main = mainScrolling,
	    visual = visualTab,
	    misc = miscTab
	}
	local buttons = {
	    main = mainBtn,
	    visual = visualBtn,
	    misc = miscBtn
	}
	
	-- Helper to show only the selected tab
	local function showTab(tabName)
	    for k, tab in tabs do
	        if tab then
	            tab.Visible = (k == tabName)
	        end
	    end
	end
	
	-- Connect button events
	for k, btn in buttons do
	    if btn then
	        btn.MouseButton1Click:Connect(function()
	            showTab(k)
	        end)
	    end
	end
	
	-- Initial state: show main tab
	showTab("main")
	
	
end;
task.spawn(C_4f);

return G2L["1"], require;
