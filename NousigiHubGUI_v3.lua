--!nonstrict
--[[
================================================================================
  Nousigi Hub GUI  —  динамическая UI-библиотека + MacLib facade          v3.0
================================================================================
  ОДИН ФАЙЛ. Никаких require / HttpGet / loadstring / внешних ассетов кроме
  штатных rbxassetid. Работает и в Roblox Studio (LocalScript в
  StarterPlayerScripts или StarterGui), и под экзекьютором (gethui).

  Визуальные константы и шаблоны контролов сняты с живого "Nousigi Hub GUI"
  через Roblox MCP. В отличие от статического snapshot v3, этот файл НЕ
  поднимает заранее зафиксированные 13 970 Instance: страницы, секции и
  контролы создаются динамически из вызовов API. В комплекте:
    • топбар: логотип, заголовок, кнопка сворачивания сайдбара, строка
      глобального поиска с плашкой "Ctrl K";
    • сайдбар: заголовок игры, список страниц, вложенные подстраницы,
      нижняя кнопка "UI Setting";
    • контент: UIPageLayout со слайдом, страницы со скроллом;
    • секции: сворачивание, собственный поиск по виджетам, «склейка» подряд
      идущих виджетов (bridge + маски углов), вложенные подсекции;
    • виджеты: Toggle, Dropdown (одиночный/мульти/с поиском), Slider, Button,
      Input, Keybind, Label, Priority-list (drag&drop), Divider, Gap;
    • оверлей глобального поиска (Ctrl K) по всем виджетам всех страниц;
    • второй ScreenGui [ETC]: плавающая кнопка скрытия, уведомления сверху и
      снизу, всплывающие сообщения, модальные окна с затемнением;
    • ресайз за уголок, перетаскивание за шапку, масштаб UI.

  Внизу файла находится совместимый facade для скриптов, написанных под
  MacLib: Window -> TabGroup -> Tab -> Section -> widgets, MacLib.Options,
  автосохранение и загрузка прежнего JSON-конфига. DEMO в библиотеке нет.

--------------------------------------------------------------------------------
  API
--------------------------------------------------------------------------------
  local UI = Nousigi.new{ Title=, Menu=, Size=, Key=, Logo= }

  local page  = UI:Page("Macro", { Order=, Hidden=, Icon= })
  local sub   = page:SubPage("Advanced")          -- вложенный пункт сайдбара

  local sec   = page:Section("Information", { Collapsible=false, Color=, Open= })
  local inner = sec:Section("Nested")             -- подсекция

  sec:Label(text, { Color= })                      -> :Set(text)
  sec:Divider()
  sec:Toggle  { Name=, Desc=, Default=, Flag=, Callback=(bool) }         -> :Set/:Get
  sec:Dropdown{ Name=, Desc=, Options={}, Multi=, Search=, Default=,
                Placeholder=, Connect=, Flag=, Callback=(sel) }
                -> :Set/:Get/:SetOptions/:Open/:Close
  sec:Slider  { Name=, Desc=, Min=, Max=, Default=, Decimals=, Suffix=,
                Flag=, Callback=(num) }                                   -> :Set/:Get
  sec:Button  { Name=, Desc=, Text=, Callback=() }                        -> :SetText
  sec:Input   { Name=, Desc=, Placeholder=, Default=, Numeric=,
                Flag=, Callback=(text, enterPressed) }                    -> :Set/:Get
  sec:Keybind { Name=, Desc=, Default=Enum.KeyCode.X, Flag=,
                Callback=(KeyCode) }                                      -> :Get
  sec:Priority{ Name=, Desc=, Items={}, Flag=, Callback=(orderedList) }   -> :Set/:Get

  page:Gap()

  UI:Notify{ Title=, Text=, Duration=, Position="top"|"bottom", Color= }
  UI:Message(text, duration)
  UI:Dialog{ Title=, Text=, Buttons={ {Name=, Callback=, Primary=} } }
  UI:Select("Macro")        UI:SetScale(1.2)      UI:SetVisible(bool)
  UI:GetConfig()            UI:LoadConfig(tbl)    UI:Destroy()

  -- drop-in API для существующего хаба:
  local MacLib = loadstring(source)()
  local Window = MacLib:Window{ Title=, Size=UDim2.fromOffset(...), ... }
  local Group  = Window:TabGroup()
  local Tab    = Group:Tab{ Name=, Image= }
  local Sec    = Tab:Section{ Side="Left", Name=, Collapsible=true }
  local Opt    = Sec:Toggle({ Name=, Default=, Callback= }, "MyFlag")
================================================================================
]]

local Players          = game:GetService("Players")
local RunService       = game:GetService("RunService")
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService      = game:GetService("HttpService")
local GuiService       = game:GetService("GuiService")

local LocalPlayer = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer

--==============================================================================
--  ТЕМА  (значения сняты с оригинала)
--==============================================================================

local T = {
	Accent      = Color3.fromRGB(131, 181, 255), -- активная вкладка, чекбокс, кнопка, полоса слайдера
	AccentHover = Color3.fromRGB(160, 200, 255),
	AccentDown  = Color3.fromRGB(100, 150, 225),
	AccentSoft  = Color3.fromRGB(114, 142, 185), -- заголовок обычной секции
	AccentLight = Color3.fromRGB(184, 212, 255), -- заголовок информационной секции

	Window      = Color3.fromRGB(20, 20, 20),  -- корпус окна и поля ввода
	Panel       = Color3.fromRGB(40, 40, 40),  -- топбар, сайдбар, область контента
	Section     = Color3.fromRGB(53, 53, 53),  -- контейнер секции
	Widget      = Color3.fromRGB(38, 38, 38),  -- подложка виджета
	Chip        = Color3.fromRGB(30, 30, 30),  -- квадратики collapse / search
	Shortcut    = Color3.fromRGB(63, 63, 63),  -- плашка "Ctrl K"
	Overlay     = Color3.fromRGB(70, 70, 70),  -- окно глобального поиска

	Text        = Color3.fromRGB(255, 255, 255),
	TextDim     = Color3.fromRGB(168, 168, 168),
	Placeholder = Color3.fromRGB(128, 128, 128),

	Ok          = Color3.fromRGB(120, 220, 150),
	Warn        = Color3.fromRGB(255, 183,  89),
	Bad         = Color3.fromRGB(237,  66,  69),

	-- BackgroundColor3, который оригинал оставляет у прозрачных фреймов
	Dead        = Color3.fromRGB(163, 162, 165),
}

-- Спрайтовые атласы Roblox + одиночные иконки
local ICON = {
	SheetChevron = "rbxassetid://8445471499", RectChevron = Vector2.new(904, 404),
	SheetClose   = "rbxassetid://8445470984", RectClose   = Vector2.new(304, 304),
	SheetUp      = "rbxassetid://8445470826", RectUp      = Vector2.new(704, 304),
	SheetResize  = "rbxassetid://8445470189", RectResize  = Vector2.new(704, 604),
	SheetCheck   = "rbxassetid://8445471173", RectCheck   = Vector2.new(504, 604),
	Sprite96     = Vector2.new(96, 96),

	Logo      = "rbxassetid://16791647668",
	SearchTop = "rbxassetid://11293977875",
	Search    = "rbxassetid://10734943674",
	Gear      = "rbxassetid://10709810948",
	Play      = "rbxassetid://12974400533",
	Pencil    = "rbxassetid://14187783356",
	Drag      = "rbxassetid://11422141155",
}

local function mkFont(weight)
	return Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight[weight], Enum.FontStyle.Normal)
end
local FONT = {
	Bold     = mkFont("Bold"),
	SemiBold = mkFont("SemiBold"),
	Medium   = mkFont("Medium"),
	Regular  = mkFont("Regular"),
	Light    = mkFont("Light"),
	-- шрифт «пустых» кликабельных областей в оригинале
	Blank    = Font.new("rbxasset://fonts/families/LegacyArial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
}

local TW_FAST = TweenInfo.new(0.15, Enum.EasingStyle.Quad,  Enum.EasingDirection.Out)
local TW_MED  = TweenInfo.new(0.20, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local TW_SLOW = TweenInfo.new(0.30, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

--==============================================================================
--  МЕЛКИЕ ХЕЛПЕРЫ
--==============================================================================

local function new(class, props, children)
	local inst = Instance.new(class)
	local parent = props and props.Parent
	for k, v in pairs(props or {}) do
		if k ~= "Parent" then inst[k] = v end
	end
	for _, c in ipairs(children or {}) do c.Parent = inst end
	if parent then inst.Parent = parent end
	return inst
end

local function corner(r)
	return new("UICorner", { CornerRadius = UDim.new(0, r or 4) })
end

local function pill()
	return new("UICorner", { CornerRadius = UDim.new(1, 0) })
end

local function stroke(color, thickness, transparency)
	return new("UIStroke", {
		Color = color or T.Text,
		Thickness = thickness or 1,
		Transparency = transparency == nil and 0.5 or transparency,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
	})
end

local function list(dir, halign, valign, pad, sort)
	return new("UIListLayout", {
		FillDirection       = Enum.FillDirection[dir or "Vertical"],
		HorizontalAlignment = Enum.HorizontalAlignment[halign or "Center"],
		VerticalAlignment   = Enum.VerticalAlignment[valign or "Top"],
		SortOrder           = Enum.SortOrder[sort or "LayoutOrder"],
		Padding             = UDim.new(0, pad or 0),
	})
end

-- Оригинал у всех прозрачных фреймов держит BackgroundColor3 = 163,162,165
local function ghost(p)
	p = p or {}
	p.BackgroundColor3 = T.Dead
	p.BackgroundTransparency = 1
	p.BorderSizePixel = 0
	return p
end

local function tween(inst, info, goal)
	local t = TweenService:Create(inst, info, goal)
	t:Play()
	return t
end

local function sprite(class, sheet, rect, props)
	local p = ghost(props or {})
	p.Image = sheet
	p.ImageRectOffset = rect
	p.ImageRectSize = ICON.Sprite96
	p.ImageColor3 = p.ImageColor3 or T.Text
	return new(class, p)
end

local function hitbox(props)
	local p = ghost(props or {})
	p.Text = ""
	p.TextSize = 8
	p.FontFace = FONT.Blank
	p.TextColor3 = Color3.fromRGB(27, 42, 53)
	p.AutoButtonColor = false
	return new("TextButton", p)
end

-- Стандартная «шапка» виджета: заголовок + описание
local function widgetHeader(parent, kind, name, desc, titleOffsetY)
	new("TextLabel", ghost {
		Name = kind .. "-title",
		Size = UDim2.new(1, -10, 0, 20),
		Position = UDim2.fromOffset(5, titleOffsetY or -5),
		Text = name,
		RichText = true,
		TextColor3 = T.Text,
		TextSize = 16,
		FontFace = FONT.SemiBold,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = parent,
	})
	return new("TextLabel", ghost {
		Name = kind .. "-description",
		Size = UDim2.new(1, -10, 0, 15),
		Position = UDim2.fromOffset(10, 15),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = desc or "",
		RichText = true,
		TextWrapped = true,
		TextColor3 = T.TextDim,
		TextSize = 15,
		FontFace = FONT.Light,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = parent,
	})
end

local function keyName(code)
	if not code then return "None" end
	local n = code.Name
	n = n:gsub("^Left", "L-"):gsub("^Right", "R-")
	return n
end

local function stripRich(s)
	return (tostring(s):gsub("<[^>]->", ""))
end

local function setClipboard(text)
	local fn = (typeof(setclipboard) == "function" and setclipboard)
		or (typeof(toclipboard) == "function" and toclipboard)
	if fn then
		local ok = pcall(fn, text)
		if ok then return true end
	end
	return false
end

--==============================================================================
--  БИБЛИОТЕКА
--==============================================================================

local Nousigi  = {}; Nousigi.__index  = Nousigi
local Page     = {}; Page.__index     = Page
local Section  = {}; Section.__index  = Section

--------------------------------------------------------------------------------
--  Создание окна
--------------------------------------------------------------------------------

function Nousigi.new(cfg)
	cfg = cfg or {}
	local self = setmetatable({}, Nousigi)

	self.Title      = cfg.Title or 'Nousigi <font color="#ffb759" transparency="0">[PRO]</font>'
	self.MenuTitle  = cfg.Menu  or "ANIME EXPEDITIONS"
	self.BaseSize   = cfg.Size  or Vector2.new(750, 420)
	self.ToggleKey  = cfg.Key   or Enum.KeyCode.LeftControl
	self.LogoImage  = cfg.Logo  or ICON.Logo

	self.Pages       = {}
	self.PageOrder   = {}
	self.Index       = {}     -- глобальный индекс виджетов для Ctrl+K
	self.Flags       = {}     -- Flag -> виджет (для конфига)
	self.Conns       = {}
	self.SectionByFrame = {}
	self.SidebarOpen = true
	self.Scale       = 1
	self.Visible     = true

	self:_buildMain()
	self:_buildExtra()
	self:_wireInput()

	return self
end

function Nousigi:_track(conn)
	self.Conns[#self.Conns + 1] = conn
	return conn
end

-- Родитель ScreenGui: gethui() под экзекьютором, PlayerGui в Studio
function Nousigi:_screenGui(name, order)
	local gui = new("ScreenGui", {
		Name           = name,
		DisplayOrder   = order,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		ResetOnSpawn   = false,
		IgnoreGuiInset = false,
	})
	local ok = false
	if typeof(gethui) == "function" then
		pcall(function() gui.Parent = gethui(); ok = gui.Parent ~= nil end)
	end
	if not ok then
		local pg = LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui")
		gui.Parent = pg
	end
	return gui
end

--------------------------------------------------------------------------------
--  Основное окно
--------------------------------------------------------------------------------

function Nousigi:_buildMain()
	local gui = self:_screenGui("Nousigi Hub GUI", 5)
	self.Gui = gui

	local root = new("Frame", ghost {
		Name = "main-root",
		Size = UDim2.fromOffset(self.BaseSize.X, self.BaseSize.Y),
		Position = UDim2.new(0.5, -self.BaseSize.X / 2, 0.5, -self.BaseSize.Y / 2),
		Parent = gui,
	})
	self.Root = root
	self.UIScale = new("UIScale", { Scale = 1, Parent = root })

	local holder = new("Frame", {
		Name = "main-holder",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = T.Window,
		BorderSizePixel = 0,
		Parent = root,
	}, {
		corner(4),
		new("UIStroke", { Name = "main-holder-stroke", Color = T.Accent, Thickness = 1, Transparency = 0.5 }),
	})
	self.Holder = holder

	---------------------------------------------------------------- топбар
	local top = new("Frame", {
		Name = "main-top",
		Size = UDim2.new(1, 0, 0, 30),
		BackgroundColor3 = T.Panel,
		BorderSizePixel = 0,
		Parent = holder,
	}, {
		corner(4),
		new("Frame", {  -- скрывает нижние скругления топбара
			Name = "top-hide-corner",
			Size = UDim2.new(1, 0, 0, 2),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = T.Panel,
			BorderSizePixel = 0,
		}),
	})
	self.Top = top

	new("ImageLabel", ghost {
		Name = "top-img",
		Image = self.LogoImage,
		Size = UDim2.fromOffset(25, 25),
		Position = UDim2.fromOffset(5, 2),
		Parent = top,
	})

	self.TitleLabel = new("TextLabel", ghost {
		Name = "top-label",
		Text = self.Title,
		RichText = true,
		TextColor3 = T.Accent,
		TextSize = 16,
		FontFace = FONT.Bold,
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.fromOffset(140, 20),
		Position = UDim2.fromOffset(35, 5),
		Parent = top,
	})

	-- кнопка сворачивания сайдбара
	local siderRoot = new("Frame", ghost {
		Name = "top-sider",
		Size = UDim2.fromOffset(20, 20),
		Position = UDim2.fromOffset(180, 5),
		Parent = top,
	})
	self.SiderIcon = sprite("ImageLabel", ICON.SheetChevron, ICON.RectChevron, {
		Name = "top-sider-ico",
		Size = UDim2.new(1, 6, 1, 6),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Rotation = 90,
		Parent = siderRoot,
	})
	local siderBtn = hitbox { Name = "top-sider-btn", Size = UDim2.fromScale(1, 1), Parent = siderRoot }
	self:_track(siderBtn.MouseButton1Click:Connect(function() self:ToggleSidebar() end))

	-- вертикальный разделитель с градиентом-затуханием
	new("Frame", {
		Name = "top-gap-horizontal",
		Size = UDim2.new(0, 2, 1, -10),
		Position = UDim2.fromOffset(205, 5),
		BackgroundColor3 = T.Dead,
		BorderSizePixel = 0,
		Parent = top,
	}, {
		pill(),
		new("UIGradient", {
			Name = "section-title-line-gradient",
			Rotation = 90,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(0.25, 0.5),
				NumberSequenceKeypoint.new(0.75, 0.5),
				NumberSequenceKeypoint.new(1, 1),
			}),
		}),
	})

	-- строка глобального поиска
	local searchRoot = new("Frame", ghost {
		Name = "top-search-root",
		Size = UDim2.new(1, -220, 0, 20),
		Position = UDim2.fromOffset(215, 5),
		Parent = top,
	})
	new("ImageLabel", ghost {
		Name = "top-search-ico",
		Image = ICON.SearchTop,
		Size = UDim2.fromOffset(18, 18),
		Position = UDim2.fromScale(0, 0.5),
		AnchorPoint = Vector2.new(0, 0.5),
		Parent = searchRoot,
	})
	self.TopSearch = new("TextBox", ghost {
		Name = "top-search-box",
		Size = UDim2.new(1, -85, 1, 0),
		Position = UDim2.fromOffset(25, 0),
		ClipsDescendants = true,
		Text = "",
		PlaceholderText = "Enter keywords to search features....",
		PlaceholderColor3 = T.Placeholder,
		TextColor3 = T.Text,
		TextSize = 16,
		FontFace = FONT.Medium,
		TextXAlignment = Enum.TextXAlignment.Left,
		ClearTextOnFocus = false,
		Parent = searchRoot,
	})
	new("Frame", {
		Name = "search-shortcut",
		Size = UDim2.new(0, 50, 1, 0),
		Position = UDim2.fromScale(1, 0.5),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundColor3 = T.Shortcut,
		BorderSizePixel = 0,
		Parent = searchRoot,
	}, {
		corner(4),
		stroke(T.Text, 1, 0.5),
		new("TextLabel", ghost {
			Name = "search-shortcut-bind",
			Size = UDim2.fromScale(1, 1),
			Text = "Ctrl K",
			TextColor3 = T.Text,
			TextSize = 16,
			FontFace = FONT.Medium,
		}),
	})

	---------------------------------------------------------------- сайдбар
	local sider = new("CanvasGroup", ghost {
		Name = "sider-layout",
		Size = UDim2.new(0, 170, 1, -35),
		Position = UDim2.fromOffset(5, 35),
		ClipsDescendants = true,
		Parent = holder,
	})
	self.Sider = sider

	local menuRoot = new("Frame", {
		Name = "menu-root",
		Size = UDim2.new(1, 0, 1, -40),
		BackgroundColor3 = T.Panel,
		BorderSizePixel = 0,
		Parent = sider,
	}, { corner(4) })

	self.MenuTitleLabel = new("TextLabel", ghost {
		Name = "menu-root-title",
		Size = UDim2.new(1, -10, 0, 25),
		Position = UDim2.fromOffset(5, 0),
		Text = self.MenuTitle,
		RichText = true,
		TextColor3 = T.Text,
		TextSize = 16,
		FontFace = FONT.Bold,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = menuRoot,
	})

	self.Menu = new("ScrollingFrame", ghost {
		Name = "menu-content",
		Size = UDim2.new(1, 0, 1, -25),
		Position = UDim2.fromOffset(0, 25),
		ClipsDescendants = true,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 5,
		ScrollBarImageColor3 = T.Text,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		VerticalScrollBarInset = Enum.ScrollBarInset.None,
		TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
		MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
		BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
		Parent = menuRoot,
	}, { list("Vertical", "Left", "Top", 5) })

	local settingRoot = new("Frame", {
		Name = "setting-root",
		Size = UDim2.new(1, 0, 0, 30),
		Position = UDim2.new(0, 0, 1, -5),
		AnchorPoint = Vector2.new(0, 1),
		BackgroundColor3 = T.Panel,
		BorderSizePixel = 0,
		Parent = sider,
	}, {
		corner(4),
		new("ImageLabel", ghost {
			Name = "setting-ico",
			Image = ICON.Gear,
			Size = UDim2.fromOffset(20, 20),
			Position = UDim2.fromOffset(5, 5),
		}),
		new("TextLabel", ghost {
			Name = "setting-text",
			Size = UDim2.new(1, -40, 1, 0),
			Position = UDim2.fromOffset(30, 0),
			Text = "UI Setting",
			TextColor3 = T.Text,
			TextSize = 16,
			FontFace = FONT.Bold,
			TextXAlignment = Enum.TextXAlignment.Left,
		}),
	})
	local settingBtn = hitbox { Name = "setting-btn", Size = UDim2.fromScale(1, 1), Parent = settingRoot }
	self:_track(settingBtn.MouseButton1Click:Connect(function()
		if self.Pages["UI Setting"] then self:Select("UI Setting") end
	end))

	---------------------------------------------------------------- контент
	self.Content = new("Frame", {
		Name = "content-root",
		Size = UDim2.new(1, -185, 1, -40),
		Position = UDim2.fromOffset(180, 35),
		BackgroundColor3 = T.Panel,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = holder,
	}, { corner(4) })

	self.PageLayout = new("UIPageLayout", {
		Name = "content-page-layout",
		Animated = true,
		Circular = false,
		EasingDirection = Enum.EasingDirection.InOut,
		EasingStyle = Enum.EasingStyle.Quart,
		TweenTime = 0.125,
		FillDirection = Enum.FillDirection.Vertical,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 5),
		Parent = self.Content,
	})

	self:_buildSearchOverlay()

	---------------------------------------------------------------- ресайз
	local resizeBtn = new("ImageButton", ghost {
		Name = "resize-btn",
		Size = UDim2.fromOffset(25, 25),
		Position = UDim2.fromScale(1, 1),
		AnchorPoint = Vector2.new(1, 1),
		ZIndex = 2,
		Image = "",
		AutoButtonColor = false,
		Parent = root,
	})
	local rzIco = sprite("ImageLabel", ICON.SheetResize, ICON.RectResize, {
		Name = "resize-btn-ico",
		Size = UDim2.fromOffset(24, 24),
		ZIndex = 3,
		Parent = resizeBtn,
	})
	new("UIAspectRatioConstraint", { AspectRatio = 1, DominantAxis = Enum.DominantAxis.Height, Parent = rzIco })

	self:_wireDrag(top)
	self:_wireResize(resizeBtn)
end

--------------------------------------------------------------------------------
--  Второй ScreenGui: кнопка скрытия, уведомления, сообщения, модалки
--------------------------------------------------------------------------------

function Nousigi:_buildExtra()
	local gui = self:_screenGui("Nousigi Hub GUI [ETC]", 6)
	self.ExtraGui = gui

	-- плавающая круглая кнопка «скрыть/показать»
	local hide = hitbox {
		Name = "btn-hide",
		Size = UDim2.fromOffset(50, 50),
		Position = UDim2.new(0, 15, 1, -15),
		AnchorPoint = Vector2.new(0, 1),
		Visible = false,
		Parent = gui,
	}
	new("Frame", {
		Name = "btn-hide-bg",
		Size = UDim2.fromOffset(50, 50),
		Position = UDim2.new(0, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		BackgroundColor3 = T.Text,
		BorderSizePixel = 0,
		Parent = hide,
	}, {
		pill(),
		new("ImageLabel", ghost {
			Name = "img-hide",
			Image = self.LogoImage,
			Size = UDim2.fromOffset(40, 40),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
		}),
	})
	self.HideButton = hide
	self:_track(hide.MouseButton1Click:Connect(function() self:SetVisible(not self.Visible) end))

	local function holderFrame(name, halign, valign)
		return new("Frame", ghost {
			Name = name,
			Size = UDim2.new(1, -10, 1, -10),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Parent = gui,
		}, { list("Vertical", halign, valign, 5, "Name") })
	end

	self.MessageHolder = holderFrame("message-holder",             "Center", "Top")
	self.NotifyTop     = holderFrame("notification-holder-top",    "Right",  "Top")
	self.NotifyBottom  = holderFrame("notification-holder-bottom", "Right",  "Bottom")

	local modal = new("Frame", ghost {
		Name = "modal-holder",
		Size = UDim2.new(1, -10, 1, -10),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Visible = false,
		Parent = gui,
	})
	new("Frame", {
		Name = "modal-backdrop",
		Size = UDim2.fromScale(2, 2),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Parent = modal,
	})
	self.ModalHolder = modal
end

--------------------------------------------------------------------------------
--  Ввод: перетаскивание, ресайз, горячие клавиши
--------------------------------------------------------------------------------

function Nousigi:_wireDrag(handle)
	local dragging, startPos, startOffset
	self:_track(handle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
			dragging, startPos, startOffset = true, input.Position, self.Root.Position
			local c; c = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false; c:Disconnect() end
			end)
		end
	end))
	self:_track(UserInputService.InputChanged:Connect(function(input)
		if not dragging then return end
		if input.UserInputType ~= Enum.UserInputType.MouseMovement
		and input.UserInputType ~= Enum.UserInputType.Touch then return end
		local d = input.Position - startPos
		self.Root.Position = UDim2.new(
			startOffset.X.Scale, startOffset.X.Offset + d.X,
			startOffset.Y.Scale, startOffset.Y.Offset + d.Y)
	end))
end

function Nousigi:_wireResize(btn)
	local resizing, startPos, startSize
	self:_track(btn.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
			resizing, startPos = true, input.Position
			startSize = Vector2.new(self.Root.Size.X.Offset, self.Root.Size.Y.Offset)
			local c; c = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then resizing = false; c:Disconnect() end
			end)
		end
	end))
	self:_track(UserInputService.InputChanged:Connect(function(input)
		if not resizing then return end
		if input.UserInputType ~= Enum.UserInputType.MouseMovement
		and input.UserInputType ~= Enum.UserInputType.Touch then return end
		local d = (input.Position - startPos) / math.max(0.01, self.Scale)
		self.Root.Size = UDim2.fromOffset(
			math.clamp(startSize.X + d.X, 520, 1600),
			math.clamp(startSize.Y + d.Y, 300, 1000))
	end))
end

function Nousigi:_wireInput()
	local modifierDown = false
	local modifierUsedInChord = false
	local function isModifierKey(key)
		return key == Enum.KeyCode.LeftControl or key == Enum.KeyCode.RightControl
	end

	self:_track(self.TopSearch.Focused:Connect(function() self:OpenSearch() end))
	self:_track(self.TopSearch:GetPropertyChangedSignal("Text"):Connect(function()
		self:_filterSearch(self.TopSearch.Text)
	end))

	self:_track(UserInputService.InputBegan:Connect(function(input, gpe)
		if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
		local ctrl = UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
			or UserInputService:IsKeyDown(Enum.KeyCode.RightControl)

		if input.KeyCode == Enum.KeyCode.K and ctrl then
			if modifierDown then modifierUsedInChord = true end
			if not self.Visible then self:SetVisible(true) end
			if self.SearchOpen then self:CloseSearch() else self:OpenSearch() end
			return
		end
		if gpe then return end
		if input.KeyCode == Enum.KeyCode.Escape and self.SearchOpen then
			self:CloseSearch()
		elseif input.KeyCode == self.ToggleKey then
			-- Left/RightControl часто используется как клавиша окна, а Ctrl+K —
			-- поиск. Для модификатора ждём отпускания: так Ctrl+K не прячет UI.
			if isModifierKey(self.ToggleKey) then
				modifierDown = true
				modifierUsedInChord = false
			else
				self:SetVisible(not self.Visible)
			end
		end
	end))

	self:_track(UserInputService.InputEnded:Connect(function(input)
		if input.KeyCode ~= self.ToggleKey or not isModifierKey(self.ToggleKey) then return end
		local shouldToggle = modifierDown and not modifierUsedInChord
		modifierDown, modifierUsedInChord = false, false
		if shouldToggle then self:SetVisible(not self.Visible) end
	end))
end

function Nousigi:SetVisible(state)
	self.Visible = state and true or false
	self.Root.Visible = self.Visible
	if self.HideButtonEnabled then
		self.HideButton.Visible = true
	end
end

function Nousigi:SetScale(scale)
	self.Scale = math.clamp(scale, 0.5, 2)
	self.UIScale.Scale = self.Scale
end

function Nousigi:ToggleSidebar()
	self.SidebarOpen = not self.SidebarOpen
	if self.SidebarOpen then
		tween(self.Sider,     TW_MED, { Size = UDim2.new(0, 170, 1, -35) })
		tween(self.Content,   TW_MED, { Size = UDim2.new(1, -185, 1, -40), Position = UDim2.fromOffset(180, 35) })
		tween(self.SiderIcon, TW_MED, { Rotation = 90 })
	else
		tween(self.Sider,     TW_MED, { Size = UDim2.new(0, 0, 1, -35) })
		tween(self.Content,   TW_MED, { Size = UDim2.new(1, -10, 1, -40), Position = UDim2.fromOffset(5, 35) })
		tween(self.SiderIcon, TW_MED, { Rotation = -90 })
	end
end

--------------------------------------------------------------------------------
--  Оверлей глобального поиска (Ctrl + K)
--------------------------------------------------------------------------------

function Nousigi:_buildSearchOverlay()
	local overlay = new("CanvasGroup", {
		Name = "search-root",
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = 0.6,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Visible = false,
		GroupTransparency = 1,
		ZIndex = 5,
		Parent = self.Holder,
	})

	local box = new("Frame", {
		Name = "search-holder",
		Size = UDim2.new(1, -70, 1, -60),
		Position = UDim2.new(0.5, 0, 0, 35),
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundColor3 = T.Overlay,
		BackgroundTransparency = 0.25,
		BorderSizePixel = 0,
		ZIndex = 9,
		Parent = overlay,
	}, { corner(4) })

	sprite("ImageLabel", ICON.SheetUp, ICON.RectUp, {
		Name = "search-arrow-drop-up",
		Size = UDim2.fromOffset(50, 50),
		Position = UDim2.new(0.5, 0, 0, -27),
		ImageColor3 = T.Overlay,
		ZIndex = 9,
		Parent = box,
	})

	local closeBtn = sprite("ImageButton", ICON.SheetClose, ICON.RectClose, {
		Name = "search-close-btn",
		Size = UDim2.fromOffset(24, 24),
		Position = UDim2.fromScale(1, 0),
		AnchorPoint = Vector2.new(1, 0),
		ZIndex = 10,
		AutoButtonColor = false,
		Parent = box,
	})

	new("TextLabel", ghost {
		Name = "search-hint",
		Size = UDim2.new(1, -40, 0, 25),
		Position = UDim2.fromOffset(10, 2),
		Text = "Search results — click an entry to jump to it",
		TextColor3 = T.Text,
		TextSize = 15,
		FontFace = FONT.Light,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 10,
		Parent = box,
	})

	self.SearchList = new("ScrollingFrame", ghost {
		Name = "search-container",
		Size = UDim2.new(1, 0, 1, -35),
		Position = UDim2.fromOffset(0, 30),
		ClipsDescendants = true,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 5,
		ScrollBarImageColor3 = T.Text,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		VerticalScrollBarInset = Enum.ScrollBarInset.None,
		ZIndex = 10,
		Parent = box,
	}, { list("Vertical", "Center", "Top", 5) })

	self.SearchOverlay = overlay
	self.SearchOpen = false
	self:_track(closeBtn.MouseButton1Click:Connect(function() self:CloseSearch() end))
end

function Nousigi:OpenSearch()
	if self.SearchOpen then return end
	self.SearchOpen = true
	self.SearchOverlay.Visible = true
	tween(self.SearchOverlay, TW_FAST, { GroupTransparency = 0 })
	self:_filterSearch(self.TopSearch.Text)
end

function Nousigi:CloseSearch()
	if not self.SearchOpen then return end
	self.SearchOpen = false
	local t = tween(self.SearchOverlay, TW_FAST, { GroupTransparency = 1 })
	t.Completed:Once(function()
		if not self.SearchOpen then self.SearchOverlay.Visible = false end
	end)
end

-- Регистрация виджета в индексе Ctrl+K
function Nousigi:_index(name, section, instance)
	local pageName = section.Page.Name
	local entry = new("Frame", ghost {
		Name = name,
		Size = UDim2.new(1, -10, 0, 42),
		ZIndex = 10,
		Parent = self.SearchList,
	})
	new("Frame", {
		Name = "entry-bg",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = T.Widget,
		BorderSizePixel = 0,
		ZIndex = 10,
		Parent = entry,
	}, { corner(4) })
	new("TextLabel", ghost {
		Name = name .. "-title",
		Size = UDim2.new(1, -20, 0, 20),
		Position = UDim2.fromOffset(10, 2),
		Text = name,
		RichText = true,
		TextColor3 = T.Text,
		TextSize = 16,
		FontFace = FONT.SemiBold,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 11,
		Parent = entry,
	})
	new("TextLabel", ghost {
		Name = name .. "-page",
		Size = UDim2.new(1, -20, 0, 16),
		Position = UDim2.fromOffset(10, 22),
		Text = string.format('<font color="#83b5ff">%s</font>  ›  %s', pageName, stripRich(section.Title)),
		RichText = true,
		TextColor3 = T.TextDim,
		TextSize = 15,
		FontFace = FONT.Light,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 11,
		Parent = entry,
	})
	local btn = hitbox { Name = "entry-btn", Size = UDim2.fromScale(1, 1), ZIndex = 12, Parent = entry }

	btn.MouseEnter:Connect(function()
		tween(entry["entry-bg"], TW_FAST, { BackgroundColor3 = T.Section })
	end)
	btn.MouseLeave:Connect(function()
		tween(entry["entry-bg"], TW_FAST, { BackgroundColor3 = T.Widget })
	end)
	btn.MouseButton1Click:Connect(function()
		self:CloseSearch()
		self:Select(pageName)
		-- раскрыть все секции по цепочке вверх и подскроллить к виджету
		local chain, node = {}, section
		while node do
			chain[#chain + 1] = node
			node = node.ParentSection
		end
		for i = #chain, 1, -1 do
			if chain[i].Collapsible then chain[i]:SetCollapsed(false) end
		end
		task.delay(0.25, function()
			if instance and instance.Parent then
				local holder = section.Page.Holder
				local y = instance.AbsolutePosition.Y - holder.AbsolutePosition.Y + holder.CanvasPosition.Y
				holder.CanvasPosition = Vector2.new(0, math.max(0, y - 40))
			end
		end)
	end)

	self.Index[#self.Index + 1] = {
		name = stripRich(name):lower(),
		page = pageName:lower(),
		section = stripRich(section.Title):lower(),
		entry = entry,
	}
end

function Nousigi:_filterSearch(query)
	query = (query or ""):lower():gsub("^%s+", ""):gsub("%s+$", "")
	local shown = 0
	for _, it in ipairs(self.Index) do
		local hit = (query == "")
			or it.name:find(query, 1, true) ~= nil
			or it.page:find(query, 1, true) ~= nil
			or it.section:find(query, 1, true) ~= nil
		it.entry.Visible = hit
		if hit then shown += 1 end
	end
	return shown
end

--------------------------------------------------------------------------------
--  Уведомления / сообщения / модалки
--------------------------------------------------------------------------------

function Nousigi:Notify(cfg)
	if type(cfg) == "string" then cfg = { Text = cfg } end
	cfg = cfg or {}
	local holder = (cfg.Position == "top") and self.NotifyTop or self.NotifyBottom
	local accent = cfg.Color or T.Accent

	local card = new("Frame", {
		Name = os.clock() .. "-notify",
		Size = UDim2.new(0, 260, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = T.Panel,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Parent = holder,
	}, { corner(4), stroke(accent, 1, 0.5), new("UIPadding", { PaddingBottom = UDim.new(0, 10) }) })

	local y = 6
	local titleLbl
	if cfg.Title then
		titleLbl = new("TextLabel", ghost {
			Name = "notify-title",
			Size = UDim2.new(1, -20, 0, 20),
			Position = UDim2.fromOffset(10, y),
			Text = cfg.Title,
			RichText = true,
			TextColor3 = accent,
			TextTransparency = 1,
			TextSize = 16,
			FontFace = FONT.SemiBold,
			TextXAlignment = Enum.TextXAlignment.Left,
			Parent = card,
		})
		y += 20
	end
	local bodyLbl = new("TextLabel", ghost {
		Name = "notify-body",
		Size = UDim2.new(1, -20, 0, 0),
		Position = UDim2.fromOffset(10, y),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = cfg.Text or "",
		RichText = true,
		TextWrapped = true,
		TextColor3 = T.Text,
		TextTransparency = 1,
		TextSize = 15,
		FontFace = FONT.Medium,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = card,
	})

	tween(card, TW_FAST, { BackgroundTransparency = 0 })
	tween(bodyLbl, TW_FAST, { TextTransparency = 0 })
	if titleLbl then tween(titleLbl, TW_FAST, { TextTransparency = 0 }) end

	task.delay(cfg.Duration or 4, function()
		if not card.Parent then return end
		tween(card, TW_FAST, { BackgroundTransparency = 1 })
		if titleLbl then tween(titleLbl, TW_FAST, { TextTransparency = 1 }) end
		local t = tween(bodyLbl, TW_FAST, { TextTransparency = 1 })
		t.Completed:Once(function() card:Destroy() end)
	end)
	return card
end

function Nousigi:Message(text, duration)
	local card = new("Frame", {
		Name = os.clock() .. "-message",
		Size = UDim2.new(0, 0, 0, 26),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = T.Window,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Parent = self.MessageHolder,
	}, { corner(4), stroke(T.Accent, 1, 0.5) })

	local lbl = new("TextLabel", ghost {
		Size = UDim2.new(0, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.X,
		Text = "  " .. tostring(text) .. "  ",
		RichText = true,
		TextColor3 = T.Text,
		TextTransparency = 1,
		TextSize = 15,
		FontFace = FONT.Medium,
		Parent = card,
	})

	tween(card, TW_FAST, { BackgroundTransparency = 0.15 })
	tween(lbl,  TW_FAST, { TextTransparency = 0 })
	task.delay(duration or 3, function()
		if not card.Parent then return end
		tween(card, TW_FAST, { BackgroundTransparency = 1 })
		local t = tween(lbl, TW_FAST, { TextTransparency = 1 })
		t.Completed:Once(function() card:Destroy() end)
	end)
end

function Nousigi:Dialog(cfg)
	cfg = cfg or {}
	local holder = self.ModalHolder
	local backdrop = holder["modal-backdrop"]
	holder.Visible = true
	tween(backdrop, TW_FAST, { BackgroundTransparency = 0.5 })

	local box = new("Frame", {
		Name = "modal-box",
		Size = UDim2.fromOffset(360, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = T.Panel,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Parent = holder,
	}, { corner(4), stroke(T.Accent, 1, 0.4), new("UIPadding", { PaddingBottom = UDim.new(0, 12) }) })

	new("TextLabel", ghost {
		Name = "modal-title",
		Size = UDim2.new(1, -20, 0, 26),
		Position = UDim2.fromOffset(10, 6),
		Text = cfg.Title or "Confirm",
		RichText = true,
		TextColor3 = T.Accent,
		TextSize = 17,
		FontFace = FONT.Bold,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = box,
	})
	local body = new("TextLabel", ghost {
		Name = "modal-body",
		Size = UDim2.new(1, -20, 0, 0),
		Position = UDim2.fromOffset(10, 34),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = cfg.Text or "",
		RichText = true,
		TextWrapped = true,
		TextColor3 = T.Text,
		TextSize = 15,
		FontFace = FONT.Regular,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = box,
	})

	local row = new("Frame", ghost {
		Name = "modal-buttons",
		Size = UDim2.new(1, -20, 0, 28),
		Position = UDim2.fromOffset(10, 0),
		Parent = box,
	}, { list("Horizontal", "Right", "Center", 6) })

	local function close()
		tween(backdrop, TW_FAST, { BackgroundTransparency = 1 })
		local t = tween(box, TW_FAST, { BackgroundTransparency = 1 })
		t.Completed:Once(function()
			box:Destroy()
			holder.Visible = false
		end)
	end

	local buttons = cfg.Buttons or { { Name = "OK" } }
	for i, def in ipairs(buttons) do
		local btnFrame = new("Frame", {
			Name = "modal-btn-" .. (def.Name or i),
			Size = UDim2.fromOffset(96, 26),
			BackgroundColor3 = def.Primary and T.Accent or T.Window,
			BorderSizePixel = 0,
			LayoutOrder = i,
			Parent = row,
		}, { corner(4), stroke(T.Text, 1, def.Primary and 0.8 or 0.5) })
		local b = new("TextButton", ghost {
			Size = UDim2.fromScale(1, 1),
			Text = def.Name or ("Button " .. i),
			TextColor3 = T.Text,
			TextSize = 15,
			FontFace = FONT.SemiBold,
			AutoButtonColor = false,
			Parent = btnFrame,
		})
		b.MouseButton1Click:Connect(function()
			close()
			if def.Callback then task.spawn(def.Callback) end
		end)
	end

	-- поставить ряд кнопок под текстом
	local function layout()
		row.Position = UDim2.fromOffset(10, 40 + body.AbsoluteSize.Y + 8)
	end
	body:GetPropertyChangedSignal("AbsoluteSize"):Connect(layout)
	task.defer(layout)

	tween(box, TW_FAST, { BackgroundTransparency = 0 })
	return { Close = close }
end

--------------------------------------------------------------------------------
--  Страницы
--------------------------------------------------------------------------------

function Nousigi:Page(name, opts)
	opts = opts or {}
	local win = self
	local p = setmetatable({
		Name = name, Window = self,
		Order = opts.Order or #self.PageOrder,
		SubPages = {},
	}, Page)

	local container = new("CanvasGroup", ghost {
		Name = "pageContainer-" .. name,
		Size = UDim2.fromScale(1, 1),
		ClipsDescendants = true,
		LayoutOrder = p.Order,
		GroupTransparency = 0,
		Parent = self.Content,
	})

	p.TitleLabel = new("TextLabel", ghost {
		Name = "content-title",
		Size = UDim2.new(1, -10, 0, 25),
		Position = UDim2.fromOffset(5, 0),
		Text = name,
		RichText = true,
		TextColor3 = T.Text,
		TextSize = 19,
		FontFace = FONT.SemiBold,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = container,
	})

	p.Holder = new("ScrollingFrame", ghost {
		Name = "content-page-holder",
		Size = UDim2.new(1, -5, 1, -30),
		Position = UDim2.fromOffset(5, 30),
		ClipsDescendants = true,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 5,
		ScrollBarImageColor3 = T.Text,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		VerticalScrollBarInset = Enum.ScrollBarInset.None,
		Parent = container,
	}, { list("Vertical", "Left", "Top", 5) })

	p.Container = container

	if not opts.Hidden then
		local item = new("Frame", ghost {
			Name = "menu-child-" .. name,
			Size = UDim2.new(1, -10, 0, 20),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p.Order,
			Parent = self.Menu,
		}, { list("Vertical", "Right", "Top", 5) })

		local sel = new("Frame", ghost {
			Name = "page-selector",
			Size = UDim2.new(1, 0, 0, 20),
			LayoutOrder = 0,
			Parent = item,
		})
		p.MenuBg = new("Frame", {
			Name = "menu-child-bg",
			Size = UDim2.new(1, -5, 1, 0),
			Position = UDim2.fromOffset(5, 0),
			BackgroundColor3 = T.Accent,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = sel,
		}, { corner(4) })
		new("TextLabel", ghost {
			Name = "menu-child-label",
			Size = UDim2.new(1, -10, 1, 0),
			Position = UDim2.fromOffset(10, 0),
			Text = name,
			TextColor3 = T.Text,
			TextSize = 16,
			FontFace = FONT.Bold,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			Parent = sel,
		})
		local btn = hitbox { Name = "menu-child-btn", Size = UDim2.fromScale(1, 1), Parent = sel }

		-- контейнер под вложенные пункты
		p.SubMenu = new("Frame", ghost {
			Name = "page-selector-child",
			Size = UDim2.new(1, -5, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = 1,
			Parent = item,
		}, { list("Vertical", "Left", "Top", 5) })

		p.MenuItem = item
		btn.MouseButton1Click:Connect(function() win:Select(name) end)
		btn.MouseEnter:Connect(function()
			if win.Current ~= name then tween(p.MenuBg, TW_FAST, { BackgroundTransparency = 0.85 }) end
		end)
		btn.MouseLeave:Connect(function()
			if win.Current ~= name then tween(p.MenuBg, TW_FAST, { BackgroundTransparency = 1 }) end
		end)
	end

	self.Pages[name] = p
	self.PageOrder[#self.PageOrder + 1] = name
	if not self.Current then self:Select(name) end
	return p
end

-- Вложенная страница: свой pageContainer + пункт под родительским в сайдбаре
function Page:SubPage(name, opts)
	opts = opts or {}
	local win = self.Window
	local full = name
	local sub = win:Page(full, { Hidden = true, Order = self.Order + 0.001 * (#self.SubPages + 1) })
	self.SubPages[#self.SubPages + 1] = sub

	if self.SubMenu then
		local sel = new("Frame", ghost {
			Name = "page-selector-" .. name,
			Size = UDim2.new(1, 0, 0, 18),
			LayoutOrder = #self.SubPages,
			Parent = self.SubMenu,
		})
		local bg = new("Frame", {
			Name = "menu-child-bg",
			Size = UDim2.new(1, -15, 1, 0),
			Position = UDim2.fromOffset(15, 0),
			BackgroundColor3 = T.Accent,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Parent = sel,
		}, { corner(4) })
		new("TextLabel", ghost {
			Name = "menu-child-label",
			Size = UDim2.new(1, -20, 1, 0),
			Position = UDim2.fromOffset(20, 0),
			Text = "› " .. name,
			TextColor3 = T.TextDim,
			TextSize = 15,
			FontFace = FONT.Medium,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			Parent = sel,
		})
		local btn = hitbox { Name = "menu-child-btn", Size = UDim2.fromScale(1, 1), Parent = sel }
		sub.MenuBg = bg
		btn.MouseButton1Click:Connect(function() win:Select(full) end)
		btn.MouseEnter:Connect(function()
			if win.Current ~= full then tween(bg, TW_FAST, { BackgroundTransparency = 0.85 }) end
		end)
		btn.MouseLeave:Connect(function()
			if win.Current ~= full then tween(bg, TW_FAST, { BackgroundTransparency = 1 }) end
		end)
	end
	return sub
end

function Nousigi:Select(name)
	local p = self.Pages[name]
	if not p then return end
	self.Current = name
	for n, other in pairs(self.Pages) do
		if other.MenuBg then
			tween(other.MenuBg, TW_FAST, { BackgroundTransparency = (n == name) and 0 or 1 })
		end
	end
	pcall(function() self.PageLayout:JumpTo(p.Container) end)
end

function Page:Gap(height)
	return new("Frame", ghost {
		Name = "section-gap",
		Size = UDim2.new(1, -10, 0, height or 27),
		ClipsDescendants = true,
		Parent = self.Holder,
	})
end

function Page:SetTitle(text)
	self.TitleLabel.Text = text
end

--------------------------------------------------------------------------------
--  Секции
--------------------------------------------------------------------------------

local function buildSection(page, title, opts, parentSection)
	opts = opts or {}
	local win = page.Window
	local collapsible = opts.Collapsible ~= false
	local color = opts.Color or (collapsible and T.AccentSoft or T.AccentLight)

	local s = setmetatable({
		Title = title,
		Page = page,
		Window = win,
		ParentSection = parentSection,
		Collapsible = collapsible,
		Collapsed = collapsible and (opts.Open ~= true) or false,
		Widgets = {},
		Color = color,
	}, Section)

	local frame = new("Frame", {
		Name = "section-container-" .. title,
		Size = UDim2.new(1, -10, 0, 27),
		BackgroundColor3 = T.Section,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = parentSection and parentSection.Frame or page.Holder,
	}, {
		corner(4),
		list("Vertical", "Center", "Top", 5),
		new("UISizeConstraint", { MinSize = Vector2.new(0, 0) }),
	})
	s.Frame  = frame
	s.Layout = frame:FindFirstChildOfClass("UIListLayout")
	win.SectionByFrame[frame] = s

	------------------------------------------------------------------ шапка
	local top = new("Frame", ghost {
		Name = "section-top",
		Size = UDim2.new(1, -10, 0, 25),
		LayoutOrder = 0,
		Parent = frame,
	}, { list("Horizontal", "Left", "Center", 5) })

	if collapsible then
		local chip = new("Frame", {
			Name = "section-collapse-root",
			Size = UDim2.fromOffset(20, 20),
			BackgroundColor3 = T.Chip,
			BorderSizePixel = 0,
			LayoutOrder = 0,
			Parent = top,
		}, { corner(4) })
		s.Chevron = sprite("ImageButton", ICON.SheetChevron, ICON.RectChevron, {
			Name = "section-collapse-btn",
			Size = UDim2.new(1, 6, 1, 6),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Rotation = -90,
			AutoButtonColor = false,
			Parent = chip,
		})
		s.Chevron.MouseButton1Click:Connect(function() s:SetCollapsed(not s.Collapsed) end)
	end

	new("Frame", {
		Name = "section-title-line",
		Size = UDim2.fromOffset(5, 2),
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = color,
		BackgroundTransparency = 0.25,
		BorderSizePixel = 0,
		LayoutOrder = 1,
		Parent = top,
	})

	local titleLabel = new("TextLabel", ghost {
		Name = "section-title",
		Size = UDim2.fromOffset(0, 24),
		AutomaticSize = Enum.AutomaticSize.X,
		Text = title,
		RichText = true,
		TextColor3 = color,
		TextSize = 16,
		FontFace = FONT.SemiBold,
		TextXAlignment = Enum.TextXAlignment.Left,
		LayoutOrder = 2,
		Parent = top,
	})
	s.TitleLabel = titleLabel

	local line = new("Frame", {
		Name = "section-title-line-1",
		Size = UDim2.new(1, -204, 0, 2),
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = color,
		BorderSizePixel = 0,
		LayoutOrder = 3,
		Parent = top,
	}, {
		new("UIGradient", {
			Name = "section-title-line-gradient",
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0.25),
				NumberSequenceKeypoint.new(0.5, 0.25),
				NumberSequenceKeypoint.new(1, 1),
			}),
		}),
	})

	-- линия занимает всё, что осталось между заголовком и кнопкой поиска:
	-- 20(collapse)+5 + 5(line)+5 + title +5 + line1 +5 + 20(search) = ширина строки
	local reserve = collapsible and 65 or 40
	local function fitLine()
		line.Size = UDim2.new(1, -(math.ceil(titleLabel.AbsoluteSize.X) + reserve), 0, 2)
	end
	titleLabel:GetPropertyChangedSignal("AbsoluteSize"):Connect(fitLine)
	task.defer(fitLine)

	local searchChip = new("Frame", {
		Name = "section-search-top",
		Size = UDim2.fromOffset(20, 20),
		BackgroundColor3 = T.Chip,
		BorderSizePixel = 0,
		LayoutOrder = 4,
		Parent = top,
	}, { corner(4) })
	local searchChipBtn = new("ImageButton", ghost {
		Name = "section-search-btn",
		Image = ICON.Search,
		Size = UDim2.new(1, -4, 1, -4),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutoButtonColor = false,
		Parent = searchChip,
	})

	------------------------------------------------------------ строка поиска
	local searchRoot = new("Frame", ghost {
		Name = "section-search-root",
		Size = UDim2.new(1, 0, 0, 0),
		ClipsDescendants = true,
		LayoutOrder = 1,
		Parent = frame,
	})
	local bar = new("Frame", {
		Name = "section-search",
		Size = UDim2.new(1, -10, 0, 25),
		Position = UDim2.fromOffset(5, 2),
		BackgroundColor3 = T.Widget,
		BorderSizePixel = 0,
		Parent = searchRoot,
	}, { corner(2), stroke(T.Text, 0.5, 0) })

	local barHold = new("Frame", ghost {
		Name = "section-value-holder",
		Size = UDim2.new(1, -5, 1, 0),
		Position = UDim2.fromOffset(5, 0),
		Parent = bar,
	})
	new("ImageLabel", ghost {
		Name = "search-ico",
		Image = ICON.Search,
		Size = UDim2.fromOffset(16, 16),
		Position = UDim2.fromScale(0, 0.5),
		AnchorPoint = Vector2.new(0, 0.5),
		Parent = barHold,
	})
	local searchValue = new("TextBox", ghost {
		Name = "search-value",
		Size = UDim2.new(1, -23, 1, 0),
		Position = UDim2.fromOffset(20, 0),
		Text = "",
		PlaceholderText = "Enter keywords to search features....",
		PlaceholderColor3 = T.Placeholder,
		TextColor3 = T.Text,
		TextSize = 16,
		FontFace = FONT.Medium,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ClearTextOnFocus = false,
		Parent = barHold,
	})
	s.SearchRoot, s.SearchValue, s.SearchOpen = searchRoot, searchValue, false

	searchChipBtn.MouseButton1Click:Connect(function()
		s.SearchOpen = not s.SearchOpen
		if s.SearchOpen and s.Collapsed then s:SetCollapsed(false) end
		tween(searchRoot, TW_FAST, { Size = UDim2.new(1, 0, 0, s.SearchOpen and 29 or 0) })
		if s.SearchOpen then
			task.defer(function() pcall(function() searchValue:CaptureFocus() end) end)
		else
			searchValue.Text = ""
		end
		task.delay(0.16, function() s:Refresh() end)
	end)

	searchValue:GetPropertyChangedSignal("Text"):Connect(function()
		local q = searchValue.Text:lower()
		for _, w in ipairs(s.Widgets) do
			w.Frame.Visible = (q == "") or stripRich(w.Name):lower():find(q, 1, true) ~= nil
		end
		task.defer(function() s:Refresh() end)
	end)

	s.Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		if not s.Collapsed then s:Refresh() end
	end)

	if s.Collapsed then
		frame.Size = UDim2.new(1, -10, 0, 27)
	else
		task.defer(function() s:Refresh() end)
	end

	return s
end

function Page:Section(title, opts)
	return buildSection(self, title, opts, nil)
end

function Section:Section(title, opts)
	return buildSection(self.Page, title, opts, self)
end

function Section:ExpandedHeight()
	return math.max(27, self.Layout.AbsoluteContentSize.Y + 2 + (self.Overlay or 0))
end

-- Секция клипует содержимое, поэтому раскрытый список дропдауна вылезал бы за
-- её нижнюю границу. Виджет сообщает, сколько пикселей ему не хватает, и
-- секция временно на столько же вырастает.
function Section:SetOverlay(px)
	local v = math.max(0, px or 0)
	if v == (self.Overlay or 0) then return end
	self.Overlay = v
	if not self.Collapsed then
		tween(self.Frame, TW_FAST, { Size = UDim2.new(1, -10, 0, self:ExpandedHeight()) })
	end
	if self.ParentSection then
		task.delay(0.16, function() self.ParentSection:Refresh() end)
	end
end

-- Поднять обёртку виджета над соседями: при ZIndexBehavior.Sibling выпадающий
-- список иначе уходит под фон следующего виджета.
function Section:Raise(wrap, state)
	wrap.ZIndex = state and 20 or 1
end

function Section:Refresh()
	if self.Collapsed then
		self.Frame.Size = UDim2.new(1, -10, 0, 27)
	else
		self.Frame.Size = UDim2.new(1, -10, 0, self:ExpandedHeight())
	end
	-- родительская секция должна пересчитать свою высоту
	if self.ParentSection and not self.ParentSection.Collapsed then
		task.defer(function() self.ParentSection:Refresh() end)
	end
end

function Section:SetCollapsed(state)
	if not self.Collapsible then return end
	self.Collapsed = state and true or false
	self.Frame:SetAttribute("Collapsed", self.Collapsed)
	if self.Collapsed then
		-- свернули — закрываем всё раскрытое внутри, иначе высота «залипнет»
		for _, w in ipairs(self.Widgets) do
			if w.Api and w.Api.Close then pcall(w.Api.Close, w.Api) end
		end
		self.Overlay = 0
	end
	if self.Chevron then
		tween(self.Chevron, TW_MED, { Rotation = self.Collapsed and -90 or 0 })
	end
	tween(self.Frame, TW_MED, {
		Size = UDim2.new(1, -10, 0, self.Collapsed and 27 or self:ExpandedHeight()),
	})
	if self.ParentSection and not self.ParentSection.Collapsed then
		task.delay(0.21, function() self.ParentSection:Refresh() end)
	end
end

function Section:SetTitle(text)
	self.Title = text
	self.TitleLabel.Text = text
end

--==============================================================================
--  ВИДЖЕТЫ
--==============================================================================

-- «Склейка» подряд идущих виджетов: мостик + маски углов, как
-- connected-background-* в оригинале. Оригинал применяет это ТОЛЬКО к
-- select-input (у остальных обёрток свой UIListLayout, туда мостик не влезет).
local function connectToPrevious(section, wrap, kind)
	local prev = section.LastKind
	section.LastKind = kind
	if kind == nil or prev ~= kind then return end
	new("Frame", {
		Name = "connected-background-bridge",
		Size = UDim2.new(1, -10, 0, 5),
		Position = UDim2.fromOffset(5, -5),
		BackgroundColor3 = T.Widget,
		BorderSizePixel = 0,
		Parent = wrap,
	})
	new("Frame", {
		Name = "connected-background-left-mask",
		Size = UDim2.fromOffset(4, 13),
		Position = UDim2.fromOffset(5, -9),
		BackgroundColor3 = T.Widget,
		BorderSizePixel = 0,
		Parent = wrap,
	})
	new("Frame", {
		Name = "connected-background-right-mask",
		Size = UDim2.fromOffset(4, 13),
		Position = UDim2.new(1, -9, 0, -9),
		BackgroundColor3 = T.Widget,
		BorderSizePixel = 0,
		Parent = wrap,
	})
end

local function registerWidget(section, name, frame, api, flag)
	section.Widgets[#section.Widgets + 1] = { Name = name, Frame = frame, Api = api }
	section.Window:_index(name, section, frame)
	if flag then section.Window.Flags[flag] = api end
	task.defer(function() section:Refresh() end)
end

--------------------------------------------------------------------------------
--  Label / Divider
--------------------------------------------------------------------------------

function Section:Label(text, opts)
	opts = opts or {}
	self.LastKind = nil
	local wrap = new("Frame", ghost {
		Name = "label-" .. stripRich(text):sub(1, 40),
		Size = UDim2.new(1, 0, 0, 17),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = self.Frame,
	})
	new("Frame", {
		Name = "label-bg",
		Size = UDim2.new(1, -10, 1, 6),
		Position = UDim2.new(0.5, 0, 0.5, 3),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = T.Widget,
		BorderSizePixel = 0,
		Parent = wrap,
	}, { corner(4) })
	local label = new("TextLabel", ghost {
		Name = "label-title",
		Size = UDim2.new(1, -25, 0, 0),
		Position = UDim2.fromOffset(10, 3),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = text,
		RichText = true,
		TextWrapped = true,
		TextColor3 = opts.Color or T.Text,
		TextSize = 16,
		FontFace = FONT.Regular,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = wrap,
	})

	self.Widgets[#self.Widgets + 1] = { Name = stripRich(text), Frame = wrap }
	task.defer(function() self:Refresh() end)
	return { Frame = wrap, Set = function(_, t) label.Text = t end }
end

function Section:Divider()
	self.LastKind = nil
	new("Frame", {
		Name = "section-divider",
		Size = UDim2.new(1, -20, 0, 1),
		BackgroundColor3 = T.Text,
		BackgroundTransparency = 0.85,
		BorderSizePixel = 0,
		Parent = self.Frame,
	})
	task.defer(function() self:Refresh() end)
end

--------------------------------------------------------------------------------
--  Toggle  (input-checkbox)
--------------------------------------------------------------------------------

function Section:Toggle(cfg)
	cfg = cfg or {}
	local name  = cfg.Name or "Toggle"
	local state = cfg.Default and true or false

	local wrap = new("Frame", ghost {
		Name = "input-checkbox-" .. name,
		Size = UDim2.new(1, 0, 0, 10),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = self.Frame,
	}, { list("Vertical", "Center", "Top", 5) })

	local container = new("Frame", ghost {
		Name = "checkbox-container",
		Size = UDim2.new(1, -10, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = wrap,
	})
	new("Frame", {
		Name = "checkbox-container-bg",
		Size = UDim2.new(1, 0, 1, 6),
		BackgroundColor3 = T.Widget,
		BorderSizePixel = 0,
		Parent = container,
	}, { corner(4) })

	new("TextLabel", ghost {
		Name = "checkbox-title",
		Size = UDim2.new(1, -10, 0, 20),
		Position = UDim2.fromOffset(10, 0),
		Text = name,
		RichText = true,
		TextColor3 = T.Text,
		TextSize = 16,
		FontFace = FONT.SemiBold,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = container,
	})
	new("TextLabel", ghost {
		Name = "checkbox-description",
		Size = UDim2.new(1, -50, 0, 0),
		Position = UDim2.fromOffset(15, 20),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = cfg.Desc or "",
		RichText = true,
		TextWrapped = true,
		TextColor3 = T.TextDim,
		TextSize = 15,
		FontFace = FONT.Light,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = container,
	})

	local box = new("Frame", {
		Name = "checkbox-box",
		Size = UDim2.fromOffset(25, 25),
		Position = UDim2.new(1, -5, 0.5, 3),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundColor3 = T.Window,
		BorderSizePixel = 0,
		Parent = container,
	}, { corner(4) })

	local checked = new("CanvasGroup", {
		Name = "checkbox-box-checked",
		Size = UDim2.new(1, -8, 1, -8),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = T.Accent,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		GroupTransparency = state and 0 or 1,
		Parent = box,
	}, { corner(4) })
	sprite("ImageLabel", ICON.SheetCheck, ICON.RectCheck, {
		Name = "checkbox-check-ico",
		Size = UDim2.fromScale(1, 1),
		Parent = checked,
	})

	local btn = hitbox { Name = "checkbox-btn", Size = UDim2.new(1, 0, 1, 6), Parent = box }

	local api = { Frame = wrap, Kind = "Toggle", Value = state }
	function api:Set(v, silent)
		v = v and true or false
		api.Value = v
		tween(checked, TW_FAST, { GroupTransparency = v and 0 or 1 })
		if not silent and cfg.Callback then task.spawn(cfg.Callback, v) end
	end
	function api:Get() return api.Value end

	btn.MouseButton1Click:Connect(function() api:Set(not api.Value) end)

	connectToPrevious(self, wrap, nil)  -- у checkbox-обёртки свой layout, склейки в оригинале нет
	registerWidget(self, name, wrap, api, cfg.Flag)
	-- Native API может явно запросить callback на дефолте. MacLib facade этого
	-- не делает: MacLib при создании Toggle выставляет Default без Callback.
	if state and cfg.FireDefault and cfg.Callback then task.spawn(cfg.Callback, true) end
	return api
end

--------------------------------------------------------------------------------
--  Dropdown  (select-input)
--------------------------------------------------------------------------------

function Section:Dropdown(cfg)
	cfg = cfg or {}
	local section = self
	local name    = cfg.Name or "Select"
	local multi   = cfg.Multi and true or false
	local options = cfg.Options or {}

	local wrap = new("Frame", ghost {
		Name = "select-input-" .. name,
		Size = UDim2.new(1, 0, 0, 10),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = self.Frame,
	})

	local bg = new("Frame", {
		Name = "select-bg",
		Size = UDim2.new(1, -10, 1, 15),
		Position = UDim2.fromOffset(5, 0),
		BackgroundColor3 = T.Widget,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = wrap,
	}, { corner(4), list("Vertical", "Center", "Top", 0, "Name") })

	local head = new("Frame", ghost {
		Name = "select-container",
		Size = UDim2.new(1, -10, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = bg,
	})
	new("Frame", ghost { Name = "select-container-gap", Size = UDim2.new(1, 0, 1, 6), Parent = head })
	new("TextLabel", ghost {
		Name = "select-title",
		Size = UDim2.new(1, -10, 0, 20),
		Position = UDim2.fromOffset(5, 5),
		Text = name,
		RichText = true,
		TextColor3 = T.Text,
		TextSize = 16,
		FontFace = FONT.SemiBold,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = head,
	})
	if cfg.Desc then
		new("TextLabel", ghost {
			Name = "select-description",
			Size = UDim2.new(1, -10, 0, 15),
			Position = UDim2.fromOffset(10, 25),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = cfg.Desc,
			RichText = true,
			TextWrapped = true,
			TextColor3 = T.TextDim,
			TextSize = 15,
			FontFace = FONT.Light,
			TextXAlignment = Enum.TextXAlignment.Left,
			Parent = head,
		})
	end

	local value = new("Frame", {
		Name = "select-value",
		Size = UDim2.new(1, -20, 0, 25),
		BackgroundColor3 = T.Window,
		BorderSizePixel = 0,
		Parent = bg,
	}, { corner(4), stroke(T.Text, 1, 0.5) })

	local valueHold = new("Frame", ghost {
		Name = "select-value-holder",
		Size = UDim2.new(1, -35, 1, 0),
		Position = UDim2.fromOffset(5, 0),
		ClipsDescendants = true,
		Parent = value,
	})
	local valueBox = new("TextBox", ghost {
		Name = "selected-value",
		Size = UDim2.fromScale(1, 1),
		Text = "",
		PlaceholderText = cfg.Placeholder or name,
		PlaceholderColor3 = T.Placeholder,
		TextColor3 = T.Text,
		TextSize = 16,
		FontFace = FONT.Medium,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.SplitWord,
		TextEditable = false,
		ClearTextOnFocus = false,
		Parent = valueHold,
	})

	local openBtn = hitbox {
		Name = "select-open-btn",
		Size = UDim2.fromOffset(25, 25),
		Position = UDim2.new(1, 0, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		Parent = value,
	}
	local openIco = sprite("ImageLabel", ICON.SheetChevron, ICON.RectChevron, {
		Name = "select-open-ico",
		Size = UDim2.fromOffset(25, 25),
		Position = UDim2.fromScale(1, 0),
		AnchorPoint = Vector2.new(1, 0),
		Parent = openBtn,
	})

	local drop = new("CanvasGroup", {
		Name = "selected-holder",
		Size = UDim2.new(1, 0, 0, 0),
		Position = UDim2.new(0, 0, 1, 5),
		BackgroundColor3 = T.Window,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Visible = false,
		GroupTransparency = 1,
		ZIndex = 3,
		Parent = value,
	}, { corner(4) })

	-- поиск внутри списка опций
	local searchBar, searchBox
	if cfg.Search then
		searchBar = new("Frame", {
			Name = "option-search",
			Size = UDim2.new(1, -10, 0, 22),
			Position = UDim2.fromOffset(5, 5),
			BackgroundColor3 = T.Widget,
			BorderSizePixel = 0,
			ZIndex = 4,
			Parent = drop,
		}, { corner(2), stroke(T.Text, 0.5, 0) })
		searchBox = new("TextBox", ghost {
			Name = "search-value",
			Size = UDim2.new(1, -10, 1, 0),
			Position = UDim2.fromOffset(5, 0),
			Text = "",
			PlaceholderText = "Keywords...",
			PlaceholderColor3 = T.Placeholder,
			TextColor3 = T.Text,
			TextSize = 15,
			FontFace = FONT.Medium,
			TextXAlignment = Enum.TextXAlignment.Left,
			ClearTextOnFocus = false,
			ZIndex = 5,
			Parent = searchBar,
		})
	end

	local dropList = new("ScrollingFrame", ghost {
		Name = "selected-container",
		Size = UDim2.new(1, 0, 1, cfg.Search and -37 or -10),
		Position = UDim2.fromOffset(0, cfg.Search and 32 or 5),
		ClipsDescendants = true,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 5,
		ScrollBarImageColor3 = T.Text,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		VerticalScrollBarInset = Enum.ScrollBarInset.None,
		ZIndex = 3,
		Parent = drop,
	}, { list("Vertical", "Center", "Top", 5) })

	------------------------------------------------------------------- логика
	local selected = multi and {} or nil
	local rows, isOpen = {}, false
	local api = { Frame = wrap, Kind = "Dropdown", Multi = multi }

	local function display()
		if multi then
			local acc = {}
			for _, o in ipairs(options) do if selected[o] then acc[#acc + 1] = tostring(o) end end
			valueBox.Text = table.concat(acc, ", ")
		else
			valueBox.Text = selected and tostring(selected) or ""
		end
	end

	local function isOn(opt)
		if multi then return selected[opt] == true end
		return selected == opt
	end

	local function paint(row, on)
		tween(row, TW_FAST, { BackgroundTransparency = on and 0 or 1 })
	end

	local function fire()
		if not cfg.Callback then return end
		if multi then
			local copy = {}
			for k, v in pairs(selected) do if v then copy[k] = true end end
			task.spawn(cfg.Callback, copy)
		else
			task.spawn(cfg.Callback, selected)
		end
	end

	local function visibleCount()
		local n = 0
		for _, r in pairs(rows) do if r.Visible then n += 1 end end
		return n
	end

	-- Секция клипует детей: просим её вырасти ровно настолько, насколько
	-- раскрытый список вылезает за её нижний край.
	local function claimSpace(height)
		if height <= 0 then
			section:SetOverlay(0)
			return
		end
		local scale = math.max(0.01, section.Window.Scale)
		local dropTop  = (drop.AbsolutePosition.Y - section.Frame.AbsolutePosition.Y) / scale
		local secH     = section.Frame.AbsoluteSize.Y / scale
		local overflow = (dropTop + height + 8) - secH
		section:SetOverlay(math.max(0, overflow))
	end

	local function resize()
		if not isOpen then return end
		local rowsH = visibleCount() * 30 + 10
		local h = math.clamp(rowsH + (cfg.Search and 27 or 0), 40, 310)
		tween(drop, TW_FAST, { Size = UDim2.new(1, 0, 0, h) })
		task.defer(claimSpace, h)
	end

	local function buildRows()
		for _, r in pairs(rows) do r:Destroy() end
		rows = {}
		for i, opt in ipairs(options) do
			local row = new("Frame", {
				Name = tostring(opt),
				Size = UDim2.new(1, -10, 0, 25),
				BackgroundColor3 = T.Accent,
				BackgroundTransparency = isOn(opt) and 0 or 1,
				BorderSizePixel = 0,
				LayoutOrder = i,
				ZIndex = 4,
				Parent = dropList,
			}, { corner(4) })
			new("TextLabel", ghost {
				Name = "option-label",
				Size = UDim2.new(1, -10, 1, 0),
				Position = UDim2.fromOffset(5, 0),
				Text = tostring(opt),
				RichText = true,
				TextColor3 = T.Text,
				TextSize = 16,
				FontFace = FONT.Medium,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.SplitWord,
				ZIndex = 5,
				Parent = row,
			})
			local b = hitbox { Name = "option-select-btn", Size = UDim2.fromScale(1, 1), ZIndex = 6, Parent = row }

			b.MouseButton1Click:Connect(function()
				if multi then
					selected[opt] = (not selected[opt]) or nil
					paint(row, selected[opt] == true)
				else
					selected = opt
					for o, r in pairs(rows) do paint(r, o == opt) end
					api:Close()
				end
				display()
				fire()
			end)
			b.MouseEnter:Connect(function()
				if not isOn(opt) then tween(row, TW_FAST, { BackgroundTransparency = 0.85 }) end
			end)
			b.MouseLeave:Connect(function()
				if not isOn(opt) then tween(row, TW_FAST, { BackgroundTransparency = 1 }) end
			end)

			rows[opt] = row
		end
	end

	if searchBox then
		searchBox:GetPropertyChangedSignal("Text"):Connect(function()
			local q = searchBox.Text:lower()
			for opt, row in pairs(rows) do
				row.Visible = (q == "") or stripRich(opt):lower():find(q, 1, true) ~= nil
			end
			resize()
		end)
	end

	function api:Open()
		if isOpen then return end
		-- одновременно открыт только один список внутри секции
		for _, w in ipairs(section.Widgets) do
			if w.Api and w.Api ~= api and w.Api.Close then pcall(w.Api.Close, w.Api) end
		end
		isOpen = true
		section:Raise(wrap, true)
		drop.Visible = true
		tween(drop, TW_MED, { GroupTransparency = 0 })
		tween(openIco, TW_MED, { Rotation = 180 })
		resize()
	end

	function api:Close()
		if not isOpen then return end
		isOpen = false
		section:Raise(wrap, false)
		section:SetOverlay(0)
		tween(openIco, TW_MED, { Rotation = 0 })
		local t = tween(drop, TW_MED, { Size = UDim2.new(1, 0, 0, 0), GroupTransparency = 1 })
		t.Completed:Once(function() if not isOpen then drop.Visible = false end end)
	end

	function api:SetOptions(newOptions)
		options = newOptions or {}
		if multi then
			for k in pairs(selected) do
				local keep = false
				for _, o in ipairs(options) do if o == k then keep = true break end end
				if not keep then selected[k] = nil end
			end
		else
			local keep = false
			for _, o in ipairs(options) do if o == selected then keep = true break end end
			if not keep then selected = nil end
		end
		buildRows(); display(); resize()
	end

	function api:GetOptions() return options end

	function api:Set(v, silent)
		if multi then
			selected = {}
			if type(v) == "table" then
				if #v > 0 then
					for _, o in ipairs(v) do selected[o] = true end
				else
					for k, on in pairs(v) do if on then selected[k] = true end end
				end
			end
		else
			selected = v
		end
		for o, r in pairs(rows) do paint(r, isOn(o)) end
		display()
		if not silent then fire() end
	end

	function api:Get()
		if not multi then return selected end
		local copy = {}
		for k, v in pairs(selected) do if v then copy[k] = true end end
		return copy
	end

	openBtn.MouseButton1Click:Connect(function()
		if isOpen then api:Close() else api:Open() end
	end)

	buildRows()
	if cfg.Default ~= nil then api:Set(cfg.Default, true) end
	display()

	connectToPrevious(self, wrap, cfg.Connect ~= false and "select" or nil)
	registerWidget(self, name, wrap, api, cfg.Flag)
	return api
end

--------------------------------------------------------------------------------
--  Slider  (slider-input)
--------------------------------------------------------------------------------

function Section:Slider(cfg)
	cfg = cfg or {}
	local name     = cfg.Name or "Slider"
	local min      = cfg.Min or 0
	local max      = cfg.Max or 100
	local decimals = cfg.Decimals or 0
	local suffix   = cfg.Suffix or ""

	local function round(v)
		local m = 10 ^ decimals
		return math.floor(v * m + 0.5) / m
	end
	local value = math.clamp(round(cfg.Default or min), min, max)

	local wrap = new("Frame", ghost {
		Name = "slider-input-" .. name,
		Size = UDim2.new(1, 0, 0, 10),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = self.Frame,
	})

	local bg = new("Frame", {
		Name = "slider-bg",
		Size = UDim2.new(1, -10, 1, 15),
		Position = UDim2.fromOffset(5, 0),
		BackgroundColor3 = T.Widget,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = wrap,
	}, { corner(4), list("Vertical", "Center", "Center", 0) })

	local titleBox = new("Frame", ghost {
		Name = "slider-title-container",
		Size = UDim2.new(1, -10, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = 0,
		Parent = bg,
	})
	new("Frame", ghost { Name = "slider-title-container-gap", Size = UDim2.new(1, 0, 1, 6), Parent = titleBox })
	widgetHeader(titleBox, "slider", name, cfg.Desc, -5)

	local row = new("Frame", ghost {
		Name = "slider-container",
		Size = UDim2.new(1, -10, 0, 25),
		LayoutOrder = 1,
		Parent = bg,
	})

	local barBox = new("Frame", {
		Name = "bar-container",
		Size = UDim2.new(1, -70, 0, 6),
		Position = UDim2.new(0, 5, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = T.Window,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = row,
	}, { pill() })

	local bar = new("Frame", {
		Name = "bar",
		Size = UDim2.new(0, 0, 0, 6),
		BackgroundColor3 = T.Accent,
		BorderSizePixel = 0,
		Parent = barBox,
	}, { pill() })

	local barBtn = hitbox { Name = "bar-btn", Size = UDim2.fromScale(1, 1), Parent = barBox }

	local valueBox = new("Frame", {
		Name = "slider-value-main",
		Size = UDim2.fromOffset(60, 25),
		Position = UDim2.new(1, 0, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundColor3 = T.Window,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = row,
	}, { corner(4), stroke(T.Text, 1, 0.5) })

	local valueHold = new("Frame", ghost {
		Name = "slider-value-holder",
		Size = UDim2.new(1, -5, 1, 0),
		Position = UDim2.fromOffset(5, 0),
		Parent = valueBox,
	})
	local valueText = new("TextBox", ghost {
		Name = "slider-value",
		Size = UDim2.new(1, -5, 1, 0),
		Text = tostring(value) .. suffix,
		TextColor3 = T.Text,
		TextSize = 16,
		FontFace = FONT.Medium,
		ClearTextOnFocus = false,
		Parent = valueHold,
	})

	local api = { Frame = wrap, Kind = "Slider", Value = value }

	local function apply(v, silent)
		v = math.clamp(round(v), min, max)
		api.Value = v
		local alpha = (max > min) and (v - min) / (max - min) or 0
		bar.Size = UDim2.new(alpha, 0, 0, 6)
		valueText.Text = tostring(v) .. suffix
		if not silent and cfg.Callback then task.spawn(cfg.Callback, v) end
	end
	function api:Set(v, silent) apply(v, silent) end
	function api:Get() return api.Value end

	local dragging = false
	local function fromX(x)
		local a = math.clamp((x - barBox.AbsolutePosition.X) / math.max(1, barBox.AbsoluteSize.X), 0, 1)
		apply(min + (max - min) * a)
	end

	barBtn.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			fromX(input.Position.X)
		end
	end)
	self.Window:_track(UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
	end))
	self.Window:_track(UserInputService.InputChanged:Connect(function(input)
		if not dragging then return end
		if input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch then fromX(input.Position.X) end
	end))

	valueText.FocusLost:Connect(function()
		local n = tonumber((valueText.Text:gsub("%a", "")))
		if n then apply(n) else valueText.Text = tostring(api.Value) .. suffix end
	end)

	apply(value, true)
	connectToPrevious(self, wrap, nil)  -- у slider-обёртки свой layout, склейки в оригинале нет
	registerWidget(self, name, wrap, api, cfg.Flag)
	return api
end

--------------------------------------------------------------------------------
--  Button  (button-input)
--------------------------------------------------------------------------------

function Section:Button(cfg)
	cfg = cfg or {}
	local name = cfg.Name or "Button"

	local wrap = new("Frame", ghost {
		Name = "button-input-" .. name,
		Size = UDim2.new(1, 0, 0, 10),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = self.Frame,
	})

	local bg = new("Frame", {
		Name = "button-bg",
		Size = UDim2.new(1, -10, 1, 15),
		Position = UDim2.fromOffset(5, 0),
		BackgroundColor3 = T.Widget,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = wrap,
	}, { corner(4), list("Vertical", "Center", "Center", 0, "Name") })

	local head = new("Frame", ghost {
		Name = "button-container",
		Size = UDim2.new(1, -10, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = bg,
	})
	new("Frame", ghost { Name = "button-container-gap", Size = UDim2.new(1, 0, 1, 6), Parent = head })
	widgetHeader(head, "button", name, cfg.Desc, -5)

	local main = new("Frame", {
		Name = "button-main",
		Size = UDim2.new(1, -10, 0, 25),
		BackgroundColor3 = T.Accent,
		BorderSizePixel = 0,
		Parent = bg,
	}, { corner(4) })

	local hold = new("Frame", ghost {
		Name = "button-holder",
		Size = UDim2.new(1, -5, 1, 0),
		Position = UDim2.fromOffset(5, 0),
		Parent = main,
	})
	local btn = new("TextButton", ghost {
		Name = "button",
		Size = UDim2.new(1, -15, 1, 0),
		Position = UDim2.fromOffset(20, 0),
		Text = cfg.Text or "Click me >.<",
		TextColor3 = T.Text,
		TextSize = 15,
		FontFace = FONT.SemiBold,
		TextXAlignment = Enum.TextXAlignment.Left,
		AutoButtonColor = false,
		Parent = hold,
	})
	local icoHold = new("Frame", ghost {
		Name = "button-ico-holder",
		Size = UDim2.fromOffset(17, 17),
		Position = UDim2.fromScale(0, 0.5),
		AnchorPoint = Vector2.new(0, 0.5),
		Parent = hold,
	})
	new("ImageLabel", ghost {
		Name = "button-ico",
		Image = cfg.Icon or ICON.Play,
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Parent = icoHold,
	})

	btn.MouseEnter:Connect(function() tween(main, TW_FAST, { BackgroundColor3 = T.AccentHover }) end)
	btn.MouseLeave:Connect(function() tween(main, TW_FAST, { BackgroundColor3 = T.Accent }) end)
	btn.MouseButton1Click:Connect(function()
		tween(main, TW_FAST, { BackgroundColor3 = T.AccentDown })
		task.delay(0.12, function() tween(main, TW_FAST, { BackgroundColor3 = T.Accent }) end)
		if cfg.Callback then task.spawn(cfg.Callback) end
	end)

	local api = { Frame = wrap, Kind = "Button" }
	function api:SetText(t) btn.Text = t end

	connectToPrevious(self, wrap, nil)  -- у button-обёртки свой layout, склейки в оригинале нет
	registerWidget(self, name, wrap, api, nil)
	return api
end

--------------------------------------------------------------------------------
--  Input  (box-input)
--------------------------------------------------------------------------------

function Section:Input(cfg)
	cfg = cfg or {}
	local name = cfg.Name or "Input"

	local wrap = new("Frame", ghost {
		Name = "box-input-" .. name,
		Size = UDim2.new(1, 0, 0, 10),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = self.Frame,
	})

	local bg = new("Frame", {
		Name = "box-bg",
		Size = UDim2.new(1, -10, 1, 15),
		Position = UDim2.fromOffset(5, 0),
		BackgroundColor3 = T.Widget,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = wrap,
	}, { corner(4), list("Vertical", "Center", "Center", 0, "Name") })

	local head = new("Frame", ghost {
		Name = "box-container",
		Size = UDim2.new(1, -10, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = bg,
	})
	new("Frame", ghost { Name = "box-container-gap", Size = UDim2.new(1, 0, 1, 6), Parent = head })
	widgetHeader(head, "box", name, cfg.Desc, -5)

	local box = new("Frame", {
		Name = "box-value",
		Size = UDim2.new(1, -10, 0, 25),
		BackgroundColor3 = T.Window,
		BorderSizePixel = 0,
		Parent = bg,
	}, { corner(4), stroke(T.Text, 1, 0.5) })

	local hold = new("Frame", ghost {
		Name = "box-value-holder",
		Size = UDim2.new(1, -5, 1, 0),
		Position = UDim2.fromOffset(5, 0),
		Parent = box,
	})
	new("ImageLabel", ghost {
		Name = "button-ico",
		Image = ICON.Pencil,
		Size = UDim2.fromOffset(20, 20),
		Position = UDim2.fromScale(0, 0.5),
		AnchorPoint = Vector2.new(0, 0.5),
		Parent = hold,
	})
	local field = new("TextBox", ghost {
		Name = "box-value",
		Size = UDim2.new(1, -27, 1, 0),
		Position = UDim2.fromOffset(25, 0),
		Text = cfg.Default or "",
		PlaceholderText = cfg.Placeholder or name,
		PlaceholderColor3 = T.Placeholder,
		TextColor3 = T.Text,
		TextSize = 16,
		FontFace = FONT.Medium,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ClearTextOnFocus = false,
		Parent = hold,
	})

	if cfg.Numeric then
		field:GetPropertyChangedSignal("Text"):Connect(function()
			local cleaned = field.Text:gsub("[^%d%.%-]", "")
			if cleaned ~= field.Text then field.Text = cleaned end
		end)
	end

	field.FocusLost:Connect(function(enter)
		if cfg.Callback then task.spawn(cfg.Callback, field.Text, enter) end
	end)

	local api = { Frame = wrap, Kind = "Input" }
	function api:Get() return field.Text end
	function api:Set(t, silent)
		field.Text = tostring(t or "")
		if not silent and cfg.Callback then task.spawn(cfg.Callback, field.Text, false) end
	end

	connectToPrevious(self, wrap, nil)  -- у box-обёртки свой layout, склейки в оригинале нет
	registerWidget(self, name, wrap, api, cfg.Flag)
	return api
end

--------------------------------------------------------------------------------
--  Keybind  (bind-input)
--------------------------------------------------------------------------------

function Section:Keybind(cfg)
	cfg = cfg or {}
	local name = cfg.Name or "Keybind"
	local key  = cfg.Default

	local wrap = new("Frame", ghost {
		Name = "bind-input-" .. name,
		Size = UDim2.new(1, 0, 0, 41),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = self.Frame,
	}, { list("Vertical", "Center", "Center", 5, "Name") })

	local container = new("Frame", ghost {
		Name = "bind-container",
		Size = UDim2.new(1, -10, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = wrap,
	})
	new("Frame", ghost { Name = "bind-container-gap", Size = UDim2.new(1, 0, 1, 6), Parent = container })
	new("Frame", {
		Name = "bind-container-bg",
		Size = UDim2.new(1, 0, 1, 5),
		BackgroundColor3 = T.Widget,
		BorderSizePixel = 0,
		Parent = container,
	}, { corner(4) })
	new("TextLabel", ghost {
		Name = "bind-title",
		Size = UDim2.new(1, -10, 0, 20),
		Position = UDim2.fromOffset(10, 0),
		Text = name,
		RichText = true,
		TextColor3 = T.Text,
		TextSize = 16,
		FontFace = FONT.SemiBold,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = container,
	})
	new("TextLabel", ghost {
		Name = "bind-description",
		Size = UDim2.new(1, -120, 0, 0),
		Position = UDim2.fromOffset(15, 20),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = cfg.Desc or "",
		RichText = true,
		TextWrapped = true,
		TextColor3 = T.TextDim,
		TextSize = 15,
		FontFace = FONT.Light,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = container,
	})

	local box = new("Frame", {
		Name = "bind-box",
		Size = UDim2.fromOffset(100, 25),
		Position = UDim2.new(1, -5, 0.5, 3),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundColor3 = T.Window,
		BorderSizePixel = 0,
		Parent = container,
	}, { corner(4) })

	local label = new("TextLabel", ghost {
		Name = "bind-value",
		Size = UDim2.new(1, -10, 1, 0),
		Position = UDim2.fromOffset(5, 0),
		Text = keyName(key),
		TextColor3 = T.Text,
		TextSize = 16,
		FontFace = FONT.SemiBold,
		Parent = box,
	})
	local btn = hitbox { Name = "bind-btn", Size = UDim2.new(1, 0, 1, 6), Parent = box }

	local listening = false
	btn.MouseButton1Click:Connect(function()
		if listening then return end
		listening = true
		label.Text = "..."
		local c
		c = UserInputService.InputBegan:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
			c:Disconnect()
			listening = false
			if input.KeyCode == Enum.KeyCode.Escape then
				label.Text = keyName(key)
				return
			end
			key = input.KeyCode
			label.Text = keyName(key)
			if cfg.Callback then task.spawn(cfg.Callback, key) end
		end)
	end)

	local api = { Frame = wrap, Kind = "Keybind" }
	function api:Get() return key end
	function api:Set(k, silent)
		key = k
		label.Text = keyName(key)
		if not silent and cfg.Callback then task.spawn(cfg.Callback, key) end
	end

	connectToPrevious(self, wrap, nil)  -- у bind-обёртки свой layout, склейки в оригинале нет
	registerWidget(self, name, wrap, api, cfg.Flag)
	return api
end

--------------------------------------------------------------------------------
--  Priority list  (trello-input) — перетаскиванием меняется порядок
--------------------------------------------------------------------------------

function Section:Priority(cfg)
	cfg = cfg or {}
	local section = self
	local name  = cfg.Name or "Priority"
	local items = {}
	for i, v in ipairs(cfg.Items or {}) do items[i] = v end

	local ROW_H, GAP = 20, 5
	local STEP = ROW_H + GAP

	local wrap = new("Frame", ghost {
		Name = "trello-input-" .. name,
		Size = UDim2.new(1, 0, 0, 10),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = self.Frame,
	})

	local bg = new("Frame", {
		Name = "trello-bg",
		Size = UDim2.new(1, -10, 1, 15),
		Position = UDim2.fromOffset(5, 0),
		BackgroundColor3 = T.Widget,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = wrap,
	}, { corner(4), list("Vertical", "Center", "Top", 0, "Name") })

	local head = new("Frame", ghost {
		Name = "trello-container",
		Size = UDim2.new(1, -10, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = bg,
	})
	new("Frame", ghost { Name = "trello-container-gap", Size = UDim2.new(1, 0, 1, 6), Parent = head })
	new("TextLabel", ghost {
		Name = "trello-title",
		Size = UDim2.new(1, -10, 0, 20),
		Position = UDim2.fromOffset(5, 5),
		Text = name,
		RichText = true,
		TextColor3 = T.Text,
		TextSize = 16,
		FontFace = FONT.Bold,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = head,
	})
	new("TextLabel", ghost {
		Name = "trello-description",
		Size = UDim2.new(1, -10, 0, 15),
		Position = UDim2.fromOffset(10, 23),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = cfg.Desc or "Drag to set which entry runs first (highest number = highest priority)",
		RichText = true,
		TextWrapped = true,
		TextColor3 = T.TextDim,
		TextSize = 15,
		FontFace = FONT.Regular,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = head,
	})

	local value = new("Frame", {
		Name = "trello-value",
		Size = UDim2.new(1, -20, 0, 25),
		BackgroundColor3 = T.Window,
		BorderSizePixel = 0,
		Parent = bg,
	}, { corner(4), stroke(T.Text, 1, 0.5) })

	local valueHold = new("Frame", ghost {
		Name = "trello-value-holder",
		Size = UDim2.new(1, -35, 1, 0),
		Position = UDim2.fromOffset(5, 0),
		ClipsDescendants = true,
		Parent = value,
	})
	local summary = new("TextBox", ghost {
		Name = "selected-value",
		Size = UDim2.fromScale(1, 1),
		Text = "",
		PlaceholderText = name,
		PlaceholderColor3 = T.Placeholder,
		TextColor3 = T.Text,
		TextSize = 16,
		FontFace = FONT.Medium,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.SplitWord,
		TextEditable = false,
		ClearTextOnFocus = false,
		Parent = valueHold,
	})

	local openBtn = hitbox {
		Name = "trello-open-btn",
		Size = UDim2.fromOffset(25, 25),
		Position = UDim2.new(1, 0, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		Parent = value,
	}
	new("ImageLabel", ghost {
		Name = "trello-open-ico",
		Image = ICON.Drag,
		Size = UDim2.fromOffset(25, 25),
		Position = UDim2.fromScale(1, 0),
		AnchorPoint = Vector2.new(1, 0),
		Parent = openBtn,
	})

	local drop = new("CanvasGroup", {
		Name = "trello-options-holder",
		Size = UDim2.new(1, 0, 0, 0),
		Position = UDim2.new(0, 0, 1, 5),
		BackgroundColor3 = T.Window,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Visible = false,
		GroupTransparency = 1,
		ZIndex = 3,
		Parent = value,
	}, { corner(4) })

	local canvas = new("ScrollingFrame", ghost {
		Name = "trello-options-container",
		Size = UDim2.new(1, 0, 1, -10),
		Position = UDim2.fromOffset(0, 5),
		ClipsDescendants = true,
		CanvasSize = UDim2.new(),
		ScrollBarThickness = 5,
		ScrollBarImageColor3 = T.Text,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		VerticalScrollBarInset = Enum.ScrollBarInset.None,
		ZIndex = 3,
		Parent = drop,
	})

	local rows, isOpen = {}, false
	local api = { Frame = wrap, Kind = "Priority" }

	local function updateSummary()
		summary.PlaceholderText = name .. ": " .. table.concat(items, " > ")
		summary.Text = ""
	end

	local function layoutRows(skip)
		for i, item in ipairs(items) do
			local row = rows[item]
			if row then
				local n = #items - i          -- верхний = наибольший приоритет
				row.LayoutOrder = i
				row.Frame["trello-value-bg"]["trello-value-text"].Text =
					string.format("<b>%d</b>. %s", n, item)
				row.Frame["trello-value-bg"]["trello-value-num"]["trello-value-holder"]["trello-value"].Text = tostring(n)
				if row.Frame ~= skip then
					row.Frame.Position = UDim2.fromOffset(0, (i - 1) * STEP)
				end
			end
		end
		canvas.CanvasSize = UDim2.fromOffset(0, #items * STEP)
		updateSummary()
	end

	local function fire()
		if cfg.Callback then
			local copy = table.clone(items)
			task.spawn(cfg.Callback, copy)
		end
	end

	local function makeRow(item)
		local frame = new("Frame", ghost {
			Name = item,
			Size = UDim2.new(1, 0, 0, ROW_H),
			ZIndex = 4,
			Parent = canvas,
		})
		local rowBg = new("Frame", {
			Name = "trello-value-bg",
			Size = UDim2.new(1, -15, 0, ROW_H),
			Position = UDim2.fromOffset(5, 0),
			BackgroundColor3 = T.Widget,
			BorderSizePixel = 0,
			ZIndex = 4,
			Parent = frame,
		}, { corner(4) })

		new("TextLabel", ghost {
			Name = "trello-value-text",
			Size = UDim2.new(1, -85, 0, ROW_H),
			Position = UDim2.fromOffset(5, 0),
			Text = item,
			RichText = true,
			TextWrapped = true,
			TextColor3 = T.Text,
			TextSize = 16,
			FontFace = FONT.Medium,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 5,
			Parent = rowBg,
		})

		local numBox = new("Frame", {
			Name = "trello-value-num",
			Size = UDim2.fromOffset(70, 14),
			Position = UDim2.new(1, -3, 0, 3),
			AnchorPoint = Vector2.new(1, 0),
			BackgroundColor3 = T.Window,
			BorderSizePixel = 0,
			ZIndex = 5,
			Parent = rowBg,
		}, { corner(2), stroke(T.Text, 0.7, 0) })
		local numHold = new("Frame", ghost {
			Name = "trello-value-holder",
			Size = UDim2.new(1, -5, 1, 0),
			Position = UDim2.fromOffset(5, 0),
			ZIndex = 5,
			Parent = numBox,
		})
		new("TextBox", ghost {
			Name = "trello-value",
			Size = UDim2.new(1, -5, 1, 0),
			Text = "0",
			TextColor3 = T.Text,
			TextSize = 16,
			FontFace = FONT.Medium,
			TextEditable = false,
			ClearTextOnFocus = false,
			ZIndex = 6,
			Parent = numHold,
		})

		local grab = hitbox { Name = "trello-grab", Size = UDim2.fromScale(1, 1), ZIndex = 7, Parent = frame }

		-- перетаскивание строки
		local dragging, startY, startIndex = false, 0, 1
		grab.InputBegan:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseButton1
			and input.UserInputType ~= Enum.UserInputType.Touch then return end
			dragging = true
			startY = input.Position.Y
			for i, v in ipairs(items) do if v == item then startIndex = i break end end
			frame.ZIndex = 20
			rowBg.BackgroundColor3 = T.Section
		end)

		local moveConn = UserInputService.InputChanged:Connect(function(input)
			if not dragging then return end
			if input.UserInputType ~= Enum.UserInputType.MouseMovement
			and input.UserInputType ~= Enum.UserInputType.Touch then return end
			local dy = (input.Position.Y - startY) / math.max(0.01, self.Window.Scale)
			frame.Position = UDim2.fromOffset(0, (startIndex - 1) * STEP + dy)

			local target = math.clamp(math.floor(((startIndex - 1) * STEP + dy) / STEP + 0.5) + 1, 1, #items)
			local cur
			for i, v in ipairs(items) do if v == item then cur = i break end end
			if cur and target ~= cur then
				table.remove(items, cur)
				table.insert(items, target, item)
				layoutRows(frame)
			end
		end)

		local endConn = UserInputService.InputEnded:Connect(function(input)
			if not dragging then return end
			if input.UserInputType ~= Enum.UserInputType.MouseButton1
			and input.UserInputType ~= Enum.UserInputType.Touch then return end
			dragging = false
			frame.ZIndex = 4
			rowBg.BackgroundColor3 = T.Widget
			layoutRows()
			fire()
		end)

		self.Window:_track(moveConn)
		self.Window:_track(endConn)

		return { Frame = frame }
	end

	for _, item in ipairs(items) do rows[item] = makeRow(item) end
	layoutRows()

	function api:Open()
		if isOpen then return end
		for _, w in ipairs(section.Widgets) do
			if w.Api and w.Api ~= api and w.Api.Close then pcall(w.Api.Close, w.Api) end
		end
		isOpen = true
		section:Raise(wrap, true)
		drop.Visible = true
		local h = math.clamp(#items * STEP + 10, 40, 240)
		tween(drop, TW_MED, { Size = UDim2.new(1, 0, 0, h), GroupTransparency = 0 })
		task.defer(function()
			local scale = math.max(0.01, section.Window.Scale)
			local dropTop = (drop.AbsolutePosition.Y - section.Frame.AbsolutePosition.Y) / scale
			local secH    = section.Frame.AbsoluteSize.Y / scale
			section:SetOverlay(math.max(0, (dropTop + h + 8) - secH))
		end)
	end
	function api:Close()
		if not isOpen then return end
		isOpen = false
		section:Raise(wrap, false)
		section:SetOverlay(0)
		local t = tween(drop, TW_MED, { Size = UDim2.new(1, 0, 0, 0), GroupTransparency = 1 })
		t.Completed:Once(function() if not isOpen then drop.Visible = false end end)
	end
	function api:Get() return table.clone(items) end
	function api:Set(order, silent)
		if type(order) ~= "table" then return end
		local seen, out = {}, {}
		for _, v in ipairs(order) do
			if rows[v] and not seen[v] then out[#out + 1] = v; seen[v] = true end
		end
		for _, v in ipairs(items) do if not seen[v] then out[#out + 1] = v end end
		items = out
		layoutRows()
		if not silent then fire() end
	end

	openBtn.MouseButton1Click:Connect(function()
		if isOpen then api:Close() else api:Open() end
	end)

	connectToPrevious(self, wrap, nil)  -- у trello-обёртки свой layout, склейки в оригинале нет
	registerWidget(self, name, wrap, api, cfg.Flag)
	return api
end

--==============================================================================
--  КОНФИГ  (Flag -> значение)
--==============================================================================

function Nousigi:GetConfig()
	local out = {}
	for flag, api in pairs(self.Flags) do
		if api.Get then
			local ok, v = pcall(api.Get, api)
			if ok then
				if typeof(v) == "EnumItem" then v = v.Name end
				out[flag] = v
			end
		end
	end
	return out
end

function Nousigi:LoadConfig(tbl)
	if type(tbl) ~= "table" then return false end
	for flag, v in pairs(tbl) do
		local api = self.Flags[flag]
		if api and api.Set then
			if api.Kind == "Keybind" and type(v) == "string" then
				v = Enum.KeyCode[v] or v
			end
			pcall(api.Set, api, v)
		end
	end
	return true
end

function Nousigi:ExportConfig()
	local ok, json = pcall(function()
		return HttpService:JSONEncode(self:GetConfig())
	end)
	if not ok then return nil end
	if not setClipboard(json) then
		print("[Nousigi] config:", json)
	end
	return json
end

function Nousigi:ImportConfig(json)
	local ok, tbl = pcall(function() return HttpService:JSONDecode(json) end)
	if not ok then return false end
	return self:LoadConfig(tbl)
end

function Nousigi:Destroy()
	if self.Destroyed then return end
	self.Destroyed = true
	for _, c in ipairs(self.Conns) do pcall(function() c:Disconnect() end) end
	table.clear(self.Conns)
	if self.Gui then self.Gui:Destroy() end
	if self.ExtraGui then self.ExtraGui:Destroy() end
end

--==============================================================================

--==============================================================================
--  MACLIB-COMPAT FACADE
--
--  Это не binder к заранее созданным Instance. Каждый вызов ниже создаёт
--  настоящий динамический Nousigi widget и возвращает живой объект с теми же
--  методами/полями, которыми пользуется существующий Apel Hub.
--==============================================================================

local MacLib = (function()
	local Lib = {
		Options = {},
		Folder = "NousigiHub",
		ConfigMode = "shared",
		Native = Nousigi,
		Theme = T,
	}

	local function shallowCopy(t)
		local out = {}
		for k, v in pairs(t or {}) do out[k] = v end
		return out
	end

	local function asSettings(v, fallback)
		if type(v) == "table" then return v end
		return { Name = tostring(v or fallback or "") }
	end

	local function callback(fn, ...)
		if type(fn) ~= "function" then return true end
		return pcall(fn, ...)
	end

	local function refresh(section)
		if section and section._raw then
			task.defer(function()
				pcall(function() section._raw:Refresh() end)
			end)
		end
	end

	local function setChildText(frame, childName, text)
		if not frame then return end
		local target = frame:FindFirstChild(childName, true)
		if target and (target:IsA("TextLabel") or target:IsA("TextButton") or target:IsA("TextBox")) then
			target.Text = tostring(text or "")
		end
	end

	local function firstTextBox(frame)
		if not frame then return nil end
		for _, d in ipairs(frame:GetDescendants()) do
			if d:IsA("TextBox") then return d end
		end
	end

	local function common(obj, raw, section)
		obj._raw = raw
		obj.Frame = raw and raw.Frame
		obj.IgnoreConfig = obj.IgnoreConfig == true
		function obj:SetVisibility(state)
			if self.Frame then self.Frame.Visible = state and true or false end
			refresh(section)
		end
		return obj
	end

	local function putFlag(flag, obj)
		if flag ~= nil and flag ~= "" then Lib.Options[flag] = obj end
		return obj
	end

	local function descOf(settings)
		return settings.Description or settings.Desc
	end

	------------------------------------------------------------------------
	-- Widget adapters
	------------------------------------------------------------------------

	local function makeToggle(section, settings, flag)
		settings = asSettings(settings, "Toggle")
		flag = flag or settings.Flag
		local obj = {
			Class = "Toggle",
			Settings = settings,
			IgnoreConfig = settings.IgnoreConfig == true,
			State = settings.Default and true or false,
		}
		local raw
		raw = section._raw:Toggle({
			Name = settings.Name or "Toggle",
			Desc = descOf(settings),
			Default = obj.State,
			FireDefault = false,
			Callback = function(v)
				obj.State = v and true or false
				callback(settings.Callback, obj.State)
				Lib:AutoSave()
			end,
		})
		common(obj, raw, section)

		function obj:UpdateState(state, skipAutoSave)
			self.State = state and true or false
			raw:Set(self.State, true)
			callback(settings.Callback, self.State)
			if not skipAutoSave then Lib:AutoSave() end
		end
		function obj:GetState() return self.State end
		function obj:Toggle() self:UpdateState(not self.State) end
		function obj:UpdateName(name)
			settings.Name = tostring(name)
			setChildText(self.Frame, "checkbox-title", name)
		end
		return putFlag(flag, obj)
	end

	local function makeSlider(section, settings, flag)
		settings = asSettings(settings, "Slider")
		flag = flag or settings.Flag
		local obj = {
			Class = "Slider",
			Settings = settings,
			IgnoreConfig = settings.IgnoreConfig == true,
			Value = tonumber(settings.Default),
		}
		local raw
		raw = section._raw:Slider({
			Name = settings.Name or "Slider",
			Desc = descOf(settings),
			Min = settings.Minimum ~= nil and settings.Minimum or settings.Min,
			Max = settings.Maximum ~= nil and settings.Maximum or settings.Max,
			Default = settings.Default,
			Decimals = settings.Precision ~= nil and settings.Precision or settings.Decimals,
			Suffix = settings.Suffix,
			Callback = function(v)
				obj.Value = v
				callback(settings.Callback, v)
				Lib:AutoSave()
			end,
		})
		common(obj, raw, section)
		obj.Value = raw:Get()

		function obj:UpdateValue(value, skipAutoSave)
			local n = tonumber(value)
			if n == nil then return end
			raw:Set(n, true)
			self.Value = raw:Get()
			callback(settings.Callback, self.Value)
			if not skipAutoSave then Lib:AutoSave() end
		end
		function obj:GetValue() return self.Value end
		function obj:UpdateName(name)
			settings.Name = tostring(name)
			setChildText(self.Frame, "slider-title", name)
		end
		return putFlag(flag, obj)
	end

	local function makeButton(section, settings)
		settings = asSettings(settings, "Button")
		local raw = section._raw:Button({
			Name = settings.Name or "Button",
			Desc = descOf(settings),
			Text = settings.Text,
			Icon = settings.Icon or settings.Image,
			Callback = settings.Callback,
		})
		local obj = common({
			Class = "Button",
			Settings = settings,
			IgnoreConfig = true,
		}, raw, section)
		function obj:UpdateName(name)
			settings.Name = tostring(name)
			setChildText(self.Frame, "button-title", name)
		end
		function obj:UpdateText(text)
			raw:SetText(tostring(text or ""))
		end
		return obj
	end

	local function makeInput(section, settings, flag)
		settings = asSettings(settings, "Input")
		flag = flag or settings.Flag
		local obj = {
			Class = "Input",
			Settings = settings,
			IgnoreConfig = settings.IgnoreConfig == true,
			Text = tostring(settings.Default or ""),
		}
		local accepted = tostring(settings.AcceptedCharacters or "")
		local raw
		raw = section._raw:Input({
			Name = settings.Name or "Input",
			Desc = descOf(settings),
			Default = obj.Text,
			Placeholder = settings.Placeholder,
			Numeric = settings.Numeric or accepted == "Number" or accepted == "Numeric",
			Callback = function(text, enterPressed)
				obj.Text = tostring(text or "")
				callback(settings.Callback, obj.Text, enterPressed)
				Lib:AutoSave()
			end,
		})
		common(obj, raw, section)

		function obj:UpdateText(text, skipAutoSave)
			raw:Set(tostring(text or ""), true)
			self.Text = raw:Get()
			callback(settings.Callback, self.Text)
			if not skipAutoSave then Lib:AutoSave() end
		end
		function obj:GetInput() return self.Text end
		function obj:GetValue() return self.Text end
		function obj:UpdateName(name)
			settings.Name = tostring(name)
			setChildText(self.Frame, "box-title", name)
		end
		function obj:UpdatePlaceholder(text)
			settings.Placeholder = tostring(text or "")
			local box = firstTextBox(self.Frame)
			if box then box.PlaceholderText = settings.Placeholder end
		end
		return putFlag(flag, obj)
	end

	local function makeKeybind(section, settings, flag)
		settings = asSettings(settings, "Keybind")
		flag = flag or settings.Flag
		local obj = {
			Class = "Keybind",
			Settings = settings,
			IgnoreConfig = settings.IgnoreConfig == true,
			BindKey = settings.Default,
		}
		local raw
		raw = section._raw:Keybind({
			Name = settings.Name or "Keybind",
			Desc = descOf(settings),
			Default = obj.BindKey,
			-- В native callback приходит НОВАЯ привязка. В MacLib Callback —
			-- действие при нажатии уже привязанной клавиши, поэтому это разные
			-- события.
			Callback = function(key)
				obj.BindKey = key
				callback(settings.onBinded, key)
				Lib:AutoSave()
			end,
		})
		common(obj, raw, section)

		local win = section._window
		if win and win._ui then
			win._ui:_track(UserInputService.InputBegan:Connect(function(input, gpe)
				if gpe or not obj.BindKey or UserInputService:GetFocusedTextBox() then return end
				if input.KeyCode == obj.BindKey or input.UserInputType == obj.BindKey then
					callback(settings.Callback, obj.BindKey)
					callback(settings.onBindHeld, true, obj.BindKey)
				end
			end))
			win._ui:_track(UserInputService.InputEnded:Connect(function(input)
				if not obj.BindKey then return end
				if input.KeyCode == obj.BindKey or input.UserInputType == obj.BindKey then
					callback(settings.onBindHeld, false, obj.BindKey)
				end
			end))
		end

		function obj:Bind(key)
			self.BindKey = key
			raw:Set(key, true)
		end
		function obj:Unbind()
			self.BindKey = nil
			raw:Set(nil, true)
		end
		function obj:GetBind() return self.BindKey end
		function obj:GetValue() return self.BindKey end
		function obj:UpdateName(name)
			settings.Name = tostring(name)
			setChildText(self.Frame, "bind-title", name)
		end
		return putFlag(flag, obj)
	end

	local function optionIndex(options, value)
		for i, opt in ipairs(options) do
			if opt == value then return i end
		end
	end

	local function copyArray(list)
		local out = {}
		for i, v in ipairs(list or {}) do out[i] = v end
		return out
	end

	local function makeDropdown(section, settings, flag)
		settings = asSettings(settings, "Dropdown")
		flag = flag or settings.Flag
		local initialOptions = copyArray(settings.Options or {})
		local obj = {
			Class = "Dropdown",
			Settings = settings,
			IgnoreConfig = settings.IgnoreConfig == true,
			Multi = settings.Multi and true or false,
			Value = nil,
			_options = initialOptions,
		}

		local function multiArrayFromMap(map)
			local out, seen = {}, {}
			-- Уже выбранные элементы сохраняют порядок выбора. Новый клик
			-- добавляется в хвост — именно так MacLib ведёт Selected/.Value.
			for _, opt in ipairs(obj.Value or {}) do
				if map and map[opt] then out[#out + 1] = opt; seen[opt] = true end
			end
			for _, opt in ipairs(obj._options) do
				if map and map[opt] and not seen[opt] then out[#out + 1] = opt end
			end
			return out
		end

		local function multiMapFromArray(arr)
			local out = {}
			for _, opt in ipairs(arr or {}) do out[opt] = true end
			return out
		end

		local function normalizeSingle(v)
			if type(v) == "number" then return obj._options[v] end
			if optionIndex(obj._options, v) then return v end
			if type(v) == "table" then
				local first = v[1]
				if optionIndex(obj._options, first) then return first end
			end
			return nil
		end

		local function normalizeMulti(v)
			if type(v) ~= "table" then return {}, v == nil and 0 or 1 end
			local wanted, requested = {}, 0
			if #v > 0 then
				local out, seen = {}, {}
				for _, item in ipairs(v) do
					requested += 1
					if optionIndex(obj._options, item) and not seen[item] then
						out[#out + 1] = item
						seen[item] = true
					end
				end
				return out, requested
			else
				for item, on in pairs(v) do
					if on then wanted[item] = true; requested += 1 end
				end
			end
			local out = {}
			for _, opt in ipairs(obj._options) do
				if wanted[opt] then out[#out + 1] = opt end
			end
			return out, requested
		end

		local raw
		raw = section._raw:Dropdown({
			Name = settings.Name or "Dropdown",
			Desc = descOf(settings),
			Options = initialOptions,
			Multi = obj.Multi,
			Search = settings.Search,
			Placeholder = settings.Placeholder,
			Connect = settings.Connect,
			Default = nil,
			Callback = function(value)
				if obj.Multi then
					obj.Value = multiArrayFromMap(value)
				else
					obj.Value = value
				end
				callback(settings.Callback, value)
				Lib:AutoSave()
			end,
		})
		common(obj, raw, section)

		local function applySilent(value)
			if obj.Multi then
				local arr = normalizeMulti(value)
				raw:Set(arr, true)
				obj.Value = copyArray(arr)
				return true
			end
			local one = normalizeSingle(value)
			if one == nil then return false end
			raw:Set(one, true)
			obj.Value = one
			return true
		end

		if settings.Default ~= nil then applySilent(settings.Default) end

		function obj:UpdateSelection(value, skipAutoSave)
			if value == nil then return end
			local cbValue
			if self.Multi then
				local arr, requested = normalizeMulti(value)
				if requested > 0 and #arr == 0 then
					self._PendingValue = value
					self._PendingSkipAutoSave = skipAutoSave
					return
				end
				raw:Set(arr, true)
				self.Value = copyArray(arr)
				cbValue = multiMapFromArray(arr)
			else
				local one = normalizeSingle(value)
				if one == nil then
					self._PendingValue = value
					self._PendingSkipAutoSave = skipAutoSave
					return
				end
				raw:Set(one, true)
				self.Value = one
				cbValue = one
			end
			self._PendingValue, self._PendingSkipAutoSave = nil, nil
			callback(settings.Callback, cbValue)
			if not skipAutoSave then Lib:AutoSave() end
		end

		function obj:GetValue()
			if self.Multi then return copyArray(self.Value or {}) end
			return self.Value
		end

		function obj:GetOptions()
			local result = {}
			local selected = {}
			if self.Multi then
				for _, v in ipairs(self.Value or {}) do selected[v] = true end
			elseif self.Value ~= nil then
				selected[self.Value] = true
			end
			for _, opt in ipairs(self._options) do result[opt] = selected[opt] == true end
			return result
		end

		function obj:IsOption(name)
			return optionIndex(self._options, name) ~= nil
		end

		function obj:ClearOptions()
			-- Как MacLib: Value переживает ClearOptions, чтобы Clear -> Insert мог
			-- восстановить прежний выбор без лишнего Callback.
			self._options = {}
			settings.Options = self._options
			raw:SetOptions({})
		end

		function obj:InsertOptions(newOptions)
			if type(newOptions) ~= "table" then return end
			for _, value in ipairs(newOptions) do
				if not optionIndex(self._options, value) then
					self._options[#self._options + 1] = value
				end
			end
			settings.Options = self._options
			raw:SetOptions(self._options)

			if self._PendingValue ~= nil then
				local pending, skip = self._PendingValue, self._PendingSkipAutoSave
				self._PendingValue, self._PendingSkipAutoSave = nil, nil
				self:UpdateSelection(pending, skip)
			elseif self.Value ~= nil then
				applySilent(self.Value)
			end
		end

		function obj:RemoveOptions(remove)
			if type(remove) ~= "table" then return end
			local removeSet = {}
			for _, value in ipairs(remove) do removeSet[value] = true end
			local kept = {}
			for _, value in ipairs(self._options) do
				if not removeSet[value] then kept[#kept + 1] = value end
			end
			self._options = kept
			settings.Options = kept
			raw:SetOptions(kept)
			if self.Multi then
				local selected = {}
				for _, value in ipairs(self.Value or {}) do
					if not removeSet[value] and optionIndex(kept, value) then selected[#selected + 1] = value end
				end
				self.Value = selected
				raw:Set(selected, true)
			elseif removeSet[self.Value] then
				self.Value = nil
				raw:Set(nil, true)
			elseif self.Value ~= nil then
				raw:Set(self.Value, true)
			end
		end

		function obj:UpdateName(name)
			settings.Name = tostring(name)
			setChildText(self.Frame, "select-title", name)
		end
		function obj:Open() return raw:Open() end
		function obj:Close() return raw:Close() end
		return putFlag(flag, obj)
	end

	local function makeSimpleText(section, settings, kind)
		settings = type(settings) == "table" and settings or { Text = tostring(settings or "") }
		local text = tostring(settings.Text or settings.Name or "")
		local color = kind == "Header" and T.AccentLight or (kind == "SubLabel" and T.TextDim or settings.Color)
		local prefix, suffix = "", ""
		if kind == "Header" then prefix, suffix = "<b>", "</b>" end
		local raw = section._raw:Label(prefix .. text .. suffix, { Color = color })
		local obj = common({
			Class = kind,
			Settings = settings,
			IgnoreConfig = true,
		}, raw, section)
		function obj:UpdateName(newText)
			text = tostring(newText or "")
			settings.Text = text
			raw:Set(prefix .. text .. suffix)
		end
		function obj:UpdateText(newText) self:UpdateName(newText) end
		function obj:Set(newText) self:UpdateName(newText) end
		return obj
	end

	local function makeParagraph(section, settings)
		settings = type(settings) == "table" and settings or { Body = tostring(settings or "") }
		local header = tostring(settings.Header or "")
		local body = tostring(settings.Body or "")
		local function composed()
			if header == "" then return body end
			return '<font color="#B8D4FF"><b>' .. header .. "</b></font>\n" .. body
		end
		local raw = section._raw:Label(composed(), { Color = T.TextDim })
		local obj = common({
			Class = "Paragraph",
			Settings = settings,
			IgnoreConfig = true,
		}, raw, section)
		function obj:UpdateBody(value)
			body = tostring(value or "")
			settings.Body = body
			raw:Set(composed())
		end
		function obj:UpdateHeader(value)
			header = tostring(value or "")
			settings.Header = header
			raw:Set(composed())
		end
		return obj
	end

	------------------------------------------------------------------------
	-- Section / Tab / Window adapters
	------------------------------------------------------------------------

	local function wrapSection(window, tab, raw, settings, flag)
		local section = {
			Class = "Section",
			Settings = settings,
			IgnoreConfig = settings.IgnoreConfig == true,
			_raw = raw,
			_window = window,
			_tab = tab,
			Side = settings.Side,
		}
		function section:Toggle(s, f) return makeToggle(self, s, f) end
		function section:Slider(s, f) return makeSlider(self, s, f) end
		function section:Button(s) return makeButton(self, s) end
		function section:Input(s, f) return makeInput(self, s, f) end
		function section:Keybind(s, f) return makeKeybind(self, s, f) end
		function section:Dropdown(s, f) return makeDropdown(self, s, f) end
		function section:Label(s) return makeSimpleText(self, s, "Label") end
		function section:Header(s) return makeSimpleText(self, s, "Header") end
		function section:SubLabel(s) return makeSimpleText(self, s, "SubLabel") end
		function section:Paragraph(s) return makeParagraph(self, s) end
		function section:Divider() return self._raw:Divider() end
		function section:SetVisibility(state)
			self._raw.Frame.Visible = state and true or false
		end
		function section:UpdateName(name)
			settings.Name = tostring(name)
			self._raw:SetTitle(settings.Name)
		end
		function section:SetCollapsed(state) self._raw:SetCollapsed(state) end
		function section:GetCollapsed() return self._raw.Collapsed and true or false end
		function section:LoadCollapsed(state) self._raw:SetCollapsed(state) end
		function section:Section(childSettings, childFlag)
			childSettings = asSettings(childSettings, "Section")
			local childRaw = self._raw:Section(childSettings.Name or "Section", {
				Collapsible = childSettings.Collapsible ~= false,
				Open = childSettings.Open ~= false and childSettings.Collapsed ~= true,
				Color = childSettings.Color,
			})
			local child = wrapSection(window, tab, childRaw, childSettings, childFlag)
			if childFlag then putFlag(childFlag, child) end
			return child
		end
		if flag then putFlag(flag, section) end
		return section
	end

	local function createTab(window, settings)
		settings = asSettings(settings, "Tab")
		local page = window._ui:Page(settings.Name or "Tab", {
			Order = settings.Order,
			Hidden = settings.Hidden,
			Icon = settings.Image or settings.Icon,
		})
		local tab = {
			Settings = settings,
			_page = page,
			_window = window,
			_sections = {},
		}
		function tab:Section(sectionSettings, flag)
			sectionSettings = asSettings(sectionSettings, "Section")
			local raw = page:Section(sectionSettings.Name or "Section", {
				Collapsible = sectionSettings.Collapsible ~= false,
				-- MacLib sections are open by default; Nousigi native sections are
				-- collapsed by default. Facade keeps the caller's expectation.
				Open = sectionSettings.Open ~= false and sectionSettings.Collapsed ~= true,
				Color = sectionSettings.Color,
			})
			local wrapped = wrapSection(window, self, raw, sectionSettings, flag)
			self._sections[#self._sections + 1] = wrapped
			return wrapped
		end
		function tab:Select() window._ui:Select(page.Name) end
		function tab:SetVisibility(state)
			if page.MenuItem then page.MenuItem.Visible = state and true or false end
		end
		function tab:UpdateName(name)
			settings.Name = tostring(name)
			page:SetTitle(settings.Name)
			if page.MenuItem then setChildText(page.MenuItem, "menu-child-label", settings.Name) end
		end
		return tab
	end

	local function sizeVector(size)
		if typeof(size) == "Vector2" then return size end
		if typeof(size) == "UDim2" then
			local viewport = Vector2.new(0, 0)
			pcall(function()
				if workspace.CurrentCamera then viewport = workspace.CurrentCamera.ViewportSize end
			end)
			return Vector2.new(
				viewport.X * size.X.Scale + size.X.Offset,
				viewport.Y * size.Y.Scale + size.Y.Offset
			)
		end
		return Vector2.new(750, 420)
	end

	local function destroyOldScreens()
		local roots = {}
		local pg = LocalPlayer and LocalPlayer:FindFirstChildOfClass("PlayerGui")
		if pg then roots[#roots + 1] = pg end
		if typeof(gethui) == "function" then
			local ok, hui = pcall(gethui)
			if ok and hui then roots[#roots + 1] = hui end
		end
		for _, root in ipairs(roots) do
			pcall(function()
				for _, child in ipairs(root:GetChildren()) do
					if child.Name == "Nousigi Hub GUI" or child.Name == "Nousigi Hub GUI [ETC]" then
						child:Destroy()
					end
				end
			end)
		end
	end

	function Lib:Window(settings)
		settings = settings or {}
		if self._window and not self._window._unloaded then
			pcall(function() self._window:Unload() end)
		end
		local sharedEnv
		if typeof(getgenv) == "function" then
			local ok, env = pcall(getgenv)
			if ok and type(env) == "table" then sharedEnv = env end
		end
		-- Если прошлый запуск оборвался до Window:Unload(), одного Destroy GUI
		-- недостаточно: глобальные UIS-коннекты продолжают держать весь старый
		-- граф. Новый экземпляр библиотеки умеет дочистить предшественника.
		if sharedEnv and type(sharedEnv._NousigiHubCleanup) == "function" then
			pcall(sharedEnv._NousigiHubCleanup)
		end
		table.clear(self.Options)
		destroyOldScreens()

		local title = tostring(settings.Title or "Nousigi Hub")
		local menu = settings.Menu
		if not menu then
			menu = title:match("^(.-)%s*|") or title
			menu = tostring(menu):upper()
		end
		local ui = Nousigi.new({
			Title = title,
			Menu = menu,
			Size = sizeVector(settings.Size),
			Key = settings.Keybind or Enum.KeyCode.RightControl,
			Logo = settings.Logo or settings.Icon,
		})
		-- При UIScale окно остаётся по центру (MacLib-совместимое поведение).
		ui.Root.AnchorPoint = Vector2.new(0.5, 0.5)
		ui.Root.Position = UDim2.fromScale(0.5, 0.5)
		pcall(function() ui.Gui.DisplayOrder = 2147483647 end)
		pcall(function() ui.ExtraGui.DisplayOrder = 2147483647 end)
		local cleanup = function() pcall(function() ui:Destroy() end) end
		if sharedEnv then sharedEnv._NousigiHubCleanup = cleanup end

		local window = {
			Settings = settings,
			_ui = ui,
			_tabs = {},
			_tabsByName = {},
			_notifications = true,
			_acrylic = settings.AcrylicBlur and true or false,
			_showUserInfo = settings.ShowUserInfo ~= false,
			_unloadCallbacks = {},
			_unloaded = false,
		}
		self._window = window

		function window:TabGroup()
			local group = { _window = self }
			function group:Tab(tabSettings)
				local tab = createTab(window, tabSettings)
				window._tabs[#window._tabs + 1] = tab
				window._tabsByName[tab.Settings.Name] = tab
				return tab
			end
			return group
		end

		function window:SetState(state) ui:SetVisible(state) end
		function window:GetState() return ui.Visible end
		function window:SetScale(scale) ui:SetScale(tonumber(scale) or 1) end
		function window:GetScale() return ui.Scale end
		function window:SetKeybind(key) ui.ToggleKey = key end
		function window:SetAcrylicBlurState(state) self._acrylic = state and true or false end
		function window:GetAcrylicBlurState() return self._acrylic end
		function window:SetUserInfoState(state) self._showUserInfo = state and true or false end
		function window:GetUserInfoState() return self._showUserInfo end
		function window:SetNotificationsState(state)
			self._notifications = state and true or false
			ui.NotifyTop.Visible = self._notifications
			ui.NotifyBottom.Visible = self._notifications
		end
		function window:GetNotificationsState() return self._notifications end
		function window:SetSize(size)
			if typeof(size) == "UDim2" then
				ui.Root.Size = size
			else
				local v = sizeVector(size)
				ui.Root.Size = UDim2.fromOffset(v.X, v.Y)
			end
		end
		function window:GetSize() return ui.Root.Size end

		function window:Notify(notifySettings)
			notifySettings = notifySettings or {}
			if not self._notifications then return { Cancel = function() end } end
			local card = ui:Notify({
				Title = notifySettings.Title,
				Text = notifySettings.Description or notifySettings.Text or "",
				Duration = notifySettings.Lifetime or notifySettings.Duration,
				Position = notifySettings.Position,
				Color = notifySettings.Color,
			})
			local api = { Frame = card }
			function api:Cancel() if card and card.Parent then card:Destroy() end end
			function api:UpdateTitle(text) setChildText(card, "notify-title", text) end
			function api:UpdateDescription(text) setChildText(card, "notify-body", text) end
			function api:Resize(x) if card then card.Size = UDim2.new(0, tonumber(x) or 260, 0, 0) end end
			return api
		end

		function window:Dialog(dialogSettings)
			dialogSettings = dialogSettings or {}
			local raw = ui:Dialog({
				Title = dialogSettings.Title,
				Text = dialogSettings.Description or dialogSettings.Text,
				Buttons = dialogSettings.Buttons,
			})
			return {
				Cancel = function() if raw and raw.Close then raw:Close() end end,
			}
		end

		function window:GlobalSetting(globalSettings)
			globalSettings = asSettings(globalSettings, "Setting")
			local tab = self._tabsByName.Settings or self._tabs[#self._tabs] or self._tabs[1]
			if not tab then
				tab = createTab(self, { Name = "UI Setting" })
				self._tabs[#self._tabs + 1] = tab
				self._tabsByName["UI Setting"] = tab
			end
			local section = tab._sections[1]
			if not section then
				section = tab:Section({ Name = "UI Settings", Collapsible = false })
			end
			return section:Toggle(globalSettings)
		end

		function window:CreateMinimizer(config)
			config = config or {}
			ui.HideButtonEnabled = true
			local button = ui.HideButton
			if config.Size then
				button.Size = config.Size
				local bg = button:FindFirstChild("btn-hide-bg")
				if bg then bg.Size = UDim2.fromScale(1, 1) end
			end
			if config.Position then
				button.AnchorPoint = Vector2.new(1, 0.5)
				button.Position = config.Position
			end
			if config.Icon then
				local img = button:FindFirstChild("img-hide", true)
				if img then img.Image = config.Icon end
			end
			button.Visible = true
			local minimizer = { Button = button, Gui = ui.ExtraGui }
			function minimizer:Destroy()
				ui.HideButtonEnabled = false
				button.Visible = false
			end
			return minimizer
		end

		function window:SetKeyTimer(expiresAt)
			-- Nousigi topbar не имеет отдельного key-timer slot. Значение
			-- сохраняем в API, чтобы вызов был совместим и доступен скрипту.
			self.KeyExpiresAt = expiresAt
		end

		function window.onUnloaded(a, b)
			local fn = b or a
			if type(fn) == "function" then
				window._unloadCallbacks[#window._unloadCallbacks + 1] = fn
			end
		end

		function window:Unload()
			if self._unloaded then return end
			self._unloaded = true
			for _, fn in ipairs(self._unloadCallbacks) do callback(fn) end
			ui:Destroy()
			if sharedEnv and sharedEnv._NousigiHubCleanup == cleanup then
				sharedEnv._NousigiHubCleanup = nil
			end
		end

		return window
	end

	------------------------------------------------------------------------
	-- Config compatibility (тот же общий формат MacLib: {objects={...}})
	------------------------------------------------------------------------

	local function fileApi()
		return type(isfolder) == "function" and type(makefolder) == "function"
			and type(isfile) == "function" and type(readfile) == "function"
			and type(writefile) == "function"
	end

	local function ensureDir(path)
		if not fileApi() then return false end
		if not isfolder(path) then makefolder(path) end
		return true
	end

	local function baseGameFolder()
		if not fileApi() then return nil end
		ensureDir(Lib.Folder)
		ensureDir(Lib.Folder .. "/settings")
		local place = Lib.Folder .. "/settings/" .. tostring(game.PlaceId)
		if isfolder(place) then return place end
		local creator = Lib.Folder .. "/settings/" .. tostring(game.CreatorId)
		ensureDir(creator)
		return creator
	end

	local function gameFolder()
		local base = baseGameFolder()
		if not base then return nil end
		if Lib.ConfigMode ~= "perUser" then return base end
		local user = base .. "/" .. tostring(LocalPlayer.UserId)
		ensureDir(user)
		return user
	end

	local function loadConfigMode()
		local base = baseGameFolder()
		if not base then return end
		local path = base .. "/config_mode.txt"
		if isfile(path) then
			local mode = tostring(readfile(path) or "")
			Lib.ConfigMode = mode == "perUser" and "perUser" or "shared"
		end
	end

	local function ensureAutoload()
		local dir = gameFolder()
		if not dir then return nil end
		local path = dir .. "/autoload.txt"
		if not isfile(path) then
			local base = baseGameFolder()
			local legacy = base and (base .. "/autoload.txt")
			if legacy and legacy ~= path and isfile(legacy) then
				writefile(path, readfile(legacy))
			else
				writefile(path, "default")
			end
		end
		return path
	end

	local function autoName()
		local path = ensureAutoload()
		if not path then return nil end
		local name = tostring(readfile(path) or ""):gsub("%s+$", "")
		if name == "" then
			name = "default"
			writefile(path, name)
		end
		return name
	end

	function Lib:SetFolder(folder)
		if type(folder) == "string" and folder ~= "" then self.Folder = folder end
		if not fileApi() then return "Config system unavailable." end
		baseGameFolder()
		loadConfigMode()
		return true
	end

	function Lib:SaveConfigMode()
		if not fileApi() then return "Config system unavailable." end
		local base = baseGameFolder()
		writefile(base .. "/config_mode.txt", self.ConfigMode == "perUser" and "perUser" or "shared")
		return true
	end

	local function serialize(flag, obj)
		if obj.Class == "Toggle" then
			return { type = "Toggle", flag = flag, state = obj.State and true or false }
		elseif obj.Class == "Slider" then
			return { type = "Slider", flag = flag, value = obj.Value ~= nil and tostring(obj.Value) or false }
		elseif obj.Class == "Input" then
			return { type = "Input", flag = flag, text = obj.Text }
		elseif obj.Class == "Dropdown" then
			return { type = "Dropdown", flag = flag, value = obj.Value }
		elseif obj.Class == "Keybind" then
			local key = obj:GetBind()
			if typeof(key) ~= "EnumItem" then return { type = "Keybind", flag = flag } end
			return {
				type = "Keybind",
				flag = flag,
				bind = key.Name,
				bindType = key.EnumType == Enum.UserInputType and "UserInputType" or "KeyCode",
			}
		elseif obj.Class == "Section" then
			return { type = "Section", flag = flag, collapsed = obj:GetCollapsed() }
		end
	end

	function Lib:SaveConfig(name)
		if not fileApi() then return false, "Config system unavailable." end
		if not name or name == "" then return false, "Please select a config file." end
		local dir = gameFolder()
		local data = { objects = {} }
		for flag, obj in pairs(self.Options) do
			if not obj.IgnoreConfig then
				local encoded = serialize(flag, obj)
				if encoded then data.objects[#data.objects + 1] = encoded end
			end
		end
		table.sort(data.objects, function(a, b) return tostring(a.flag) < tostring(b.flag) end)
		local ok, json = pcall(function() return HttpService:JSONEncode(data) end)
		if not ok then return false, tostring(json) end
		writefile(dir .. "/" .. tostring(name) .. ".json", json)
		return true
	end

	local function loadObject(item)
		if type(item) ~= "table" then return end
		local obj = Lib.Options[item.flag]
		if not obj or obj.IgnoreConfig then return end
		if item.type == "Toggle" and obj.UpdateState then
			obj:UpdateState(item.state and true or false, true)
		elseif item.type == "Slider" and obj.UpdateValue and item.value ~= nil and item.value ~= false then
			obj:UpdateValue(item.value, true)
		elseif item.type == "Input" and obj.UpdateText and type(item.text) == "string" then
			obj:UpdateText(item.text, true)
		elseif item.type == "Dropdown" and obj.UpdateSelection and item.value ~= nil then
			obj:UpdateSelection(item.value, true)
		elseif item.type == "Keybind" and obj.Bind and item.bind then
			local enumType = tostring(item.bindType or "")
			local key
			if enumType == "UserInputType" or enumType == "Enum.UserInputType" then
				key = Enum.UserInputType[item.bind]
			else
				key = Enum.KeyCode[item.bind]
			end
			if key then obj:Bind(key) end
		elseif item.type == "Section" and obj.LoadCollapsed then
			obj:LoadCollapsed(item.collapsed)
		end
	end

	function Lib:LoadConfig(name)
		if not fileApi() then return false, "Config system unavailable." end
		if not name or name == "" then return false, "Please select a config file." end
		local dir = gameFolder()
		local path = dir .. "/" .. tostring(name) .. ".json"
		if not isfile(path) then
			local base = baseGameFolder()
			local fallback = base and (base .. "/" .. tostring(name) .. ".json")
			if fallback and isfile(fallback) then path = fallback else return false, "Invalid file" end
		end
		local ok, data = pcall(function() return HttpService:JSONDecode(readfile(path)) end)
		if not ok or type(data) ~= "table" then return false, "Unable to decode JSON data." end
		for _, item in ipairs(data.objects or {}) do
			pcall(loadObject, item)
		end
		return true
	end

	function Lib:AutoSave()
		if not fileApi() then return end
		local name = autoName()
		if not name then return end
		self._saveSerial = (self._saveSerial or 0) + 1
		local serial = self._saveSerial
		task.delay(0.15, function()
			if serial == Lib._saveSerial then pcall(function() Lib:SaveConfig(name) end) end
		end)
	end

	function Lib:LoadAutoLoadConfig()
		if not fileApi() then return "Config system unavailable." end
		local name = autoName()
		if not name then return false, "No autoload file" end
		local dir = gameFolder()
		local direct = dir .. "/" .. name .. ".json"
		local base = baseGameFolder()
		local fallback = base and (base .. "/" .. name .. ".json")
		if not isfile(direct) and not (fallback and isfile(fallback)) then
			local ok, err = self:SaveConfig(name)
			if not ok then return false, err end
		end
		local ok, err = self:LoadConfig(name)
		if ok and self._window then
			self._window:Notify({
				Title = "Interface",
				Description = string.format("Autoloaded config: %q", name),
			})
		end
		return ok, err
	end

	-- Доступ к native constructor остаётся, если нужен новый код без facade.
	Lib.new = Nousigi.new
	return Lib
end)()

return MacLib
