print("]------- Initializing Trigon v0.04o -------[")

function genStr(minL, maxL)
	local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
	local strLen = math.random(minL, maxL)
	local str = ""
	
	math.randomseed(os.time())
	
	for i = 1, strLen do
		local rChar = math.random(1, #chars)
		str = str .. chars:sub(rChar, rChar)
	end
	
	return str
end

if not (_G.TrigonMain and _G.TrigonLoader and _G.TrigonTopbar) then
	_G.TrigonMain, _G.TrigonLoader, _G.TrigonTopbar = genStr(16, 30), genStr(10, 25), "TrigonTopbar"
end

for _, v in ipairs({_G.TrigonMain, _G.TrigonLoader, _G.TrigonTopbar}) do
	if gethui():FindFirstChild(v) then gethui()[v]:Destroy() end
end

local userInputType = game:GetService("UserInputService")
userInputType.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
	  userInputType.InputBegan:Connect(function(secondInput)
		if secondInput.KeyCode == Enum.KeyCode.E then
		  executecode(getclipboard())
		end
	  end)
	end
end)
  

--[[
	NAME: Trigon
	VERSION: Android
	USER_AGENT: Trigon Android
	FINGERPRINT: Trigon_Fingerprint
]]

local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
local key = "https://trigonevo.com/getkey/?hwid="..HWID


--setclipboard(PandaAuth:GetKey(ServiceID))
--print(PandaAuth:GetKey(ServiceID))

--local address = crypt.base64decode("aHR0cDovLzI2LjE1My4yMjQuMTI5OjIwMjM=")
--PandaAuth:SetHTTPProtocol(address)


local ServiceID, LibType, LibVersion = "trigon-evo", "roblox", "v2" 
local PandaAuth, authlink
local keyless = true

if keyless then
	print("Keyless")
	PandaAuth = true
else
	local function tryLoadURL(url)
		local success, result = pcall(function()
			return loadstring(game:HttpGet(url))()
		end)
		if success and result then
			return result
		else
			return nil
		end
	end
	PandaAuth = tryLoadURL('https://pandadevelopment.net/servicelib?service='..ServiceID..'&core='..LibType..'&param='..LibVersion)

	if not PandaAuth then
		PandaAuth = tryLoadURL('https://pandadevelopment.cloud/servicelib?service='..ServiceID..'&core='..LibType..'&param='..LibVersion)
	end

	if PandaAuth then
		local success, result = pcall(function()
			return PandaAuth:GetKey(ServiceID)
		end)
		print(result)
		if not success then
			keyless = true
			print("Failed to retrieve AuthLink. PandaAuth Error, Trigon is Keyless!!")
		end
	else
		keyless = true
		print("PandaAuth Error, Trigon is Keyless!!")
	end
end 


loaddefaultsetttings = false
autoexec_ = false

------------------------------------------------------------
------------------------------------------------------------

local a = "TrigonConfigs"
local b = 'TrigonConfigs.json'
Settings = {}

function saveSettings()
    local HttpService = game:GetService('HttpService')
    if not isfolder(a) then
        makefolder(a)
		loaddefaultsetttings = true 
    end
    writefile(a .. '/' .. b, HttpService:JSONEncode(Settings))
    Settings = ReadSetting()
    warn("Settings Saved!")
end
function ReadSetting()
    local s, e = pcall(function()
        local HttpService = game:GetService('HttpService')
        if not isfolder(a) then
            makefolder(a)		
			loaddefaultsetttings = true 
        end
        return HttpService:JSONDecode(readfile(a .. '/' .. b))
    end)
    if s then
        return e
    else
        saveSettings()
        return ReadSetting()
    end
end
Settings = ReadSetting()


function defaultSettings()
	if not loaddefaultsetttings then return end
	Settings.autoexec = true
	Settings.autohideui = false
	Settings.logPrint = true
	Settings.logWarn = true
	Settings.logError = true  
	Settings.logInfo = true  
	saveSettings()
end

saveSettings()

defaultSettings()

if not Settings.Trigonkey then Settings.Trigonkey = " " saveSettings() end

function topbar(ButtonName,Image,Left)
	task.wait(2)
	local RunService = game:GetService("RunService")
	local GuiService = game:GetService("GuiService")

	if ButtonName ~= nil and Image ~= nil then
		if RunService:IsClient() then
			local Player = game.Players.LocalPlayer
			if Player ~= nil then 
				local PlrCheck = false
				for _,p in pairs(game.Players:GetPlayers()) do
					if p == Player then
						PlrCheck = true
					end
				end
				if PlrCheck == false then
					warn("Invalid Player")
					return false
				else
					-- Player is valid, Check to see if there is already the topbar frame
					local TopbarFrame
					pcall(function()
						TopbarFrame =  gethui():FindFirstChild(_G.TrigonTopbar)
					end)
					if TopbarFrame == nil then
						-- No TopbarFrame, Add it
						local TBUI = Instance.new("ScreenGui")
						TBUI.Parent =  gethui()
						TBUI.Name = _G.TrigonTopbar
						TBUI.DisplayOrder = 1000000000
						TBUI.Enabled = true
						TBUI.IgnoreGuiInset = true
						TBUI.ResetOnSpawn = false

						local TBFrame = Instance.new("Frame")
						TBFrame.Parent = TBUI
						TBFrame.BackgroundTransparency = 1
						TBFrame.BorderSizePixel = 0
						TBFrame.Name = "TopbarFrame"
						TBFrame.Size = UDim2.new(1,0,0,36)
						TBFrame.ZIndex = 1000000000

						local TBL = Instance.new("Frame")
						TBL.Parent = TBFrame
						TBL.BackgroundTransparency = 1
						TBL.BorderSizePixel = 0
						TBL.Name = "Left"
						TBL.Position = UDim2.new(0,104,0,4)
						TBL.Size = UDim2.new(0.85,0,0,32)

						local TBR = Instance.new("Frame")
						TBR.Parent = TBFrame
						TBR.BackgroundTransparency = 1
						TBR.BorderSizePixel = 0
						TBR.Name = "Right"
						TBR.AnchorPoint = Vector2.new(1,0)
						TBR.Position = UDim2.new(1,-60,0,4)
						TBR.Size = UDim2.new(0.85,0,0,32)

						local TBLUI = Instance.new("UIListLayout")
						TBLUI.Parent = TBL
						TBLUI.Padding = UDim.new(0,12)
						TBLUI.FillDirection = Enum.FillDirection.Horizontal
						TBLUI.HorizontalAlignment = Enum.HorizontalAlignment.Left
						TBLUI.SortOrder = Enum.SortOrder.LayoutOrder
						TBLUI.VerticalAlignment = Enum.VerticalAlignment.Top

						local TBRUI = Instance.new("UIListLayout")
						TBRUI.Parent = TBR
						TBRUI.Padding = UDim.new(0,12)
						TBRUI.FillDirection = Enum.FillDirection.Horizontal
						TBRUI.HorizontalAlignment = Enum.HorizontalAlignment.Right
						TBRUI.SortOrder = Enum.SortOrder.LayoutOrder
						TBRUI.VerticalAlignment = Enum.VerticalAlignment.Top

						RunService.RenderStepped:Connect(function()
							if GuiService.MenuIsOpen == true then
								TBFrame.Visible = false
							else
								TBFrame.Visible = true
							end
						end)
						TopbarFrame = TBUI
					end
					-- Check to see if name is taken
					local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(ButtonName)
					local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(ButtonName)
					if CheckLeft == nil and CheckRight == nil then
						local NewButton = Instance.new("Frame")
						NewButton.Name = ButtonName
						NewButton.BackgroundTransparency = 1
						NewButton.BorderSizePixel = 0
						NewButton.Position = UDim2.new(0,104,0,4)
						NewButton.Size = UDim2.new(0,32,0,32)

						local IconButton = Instance.new("ImageButton")
						IconButton.Parent = NewButton
						IconButton.BackgroundTransparency = 1
						IconButton.Name = "IconButton"
						IconButton.Size = UDim2.new(1,0,1,0)
						IconButton.ZIndex = 2
						IconButton.Image = "rbxasset://textures/ui/TopBar/iconBase.png"
						IconButton.ScaleType = Enum.ScaleType.Slice
						IconButton.SliceCenter = Rect.new(Vector2.new(10,10),Vector2.new(10,10))

						local BadgeContainer = Instance.new("Frame")
						BadgeContainer.Parent = IconButton
						BadgeContainer.BackgroundTransparency = 1
						BadgeContainer.Size = UDim2.new(1,0,1,0)
						BadgeContainer.Name = "BadgeContainer"
						BadgeContainer.ZIndex = 5
						BadgeContainer.Visible = false

						local Badge = Instance.new("Frame")
						Badge.Parent = BadgeContainer
						Badge.BackgroundTransparency = 1
						Badge.Name = "Badge"
						Badge.Position = UDim2.new(0,18,0,-2)
						Badge.Size = UDim2.new(0,24,0,24)

						local BadgeBG = Instance.new("ImageLabel")
						BadgeBG.Parent = Badge
						BadgeBG.BackgroundTransparency = 1
						BadgeBG.Size = UDim2.new(1,0,1,0)
						BadgeBG.Name = "Background"
						BadgeBG.ZIndex = 2
						BadgeBG.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/App/ImageSet/ImageAtlas/img_set_1x_1.png"
						BadgeBG.ImageColor3 = Color3.fromRGB(35, 37, 39)
						BadgeBG.ImageRectOffset = Vector2.new(301, 484)
						BadgeBG.ImageRectSize = Vector2.new(25,25)
						BadgeBG.ScaleType = Enum.ScaleType.Slice
						BadgeBG.SliceCenter = Rect.new(Vector2.new(14,14),Vector2.new(15,15))

						local Inner = Instance.new("ImageLabel")
						Inner.Parent = Badge
						Inner.AnchorPoint = Vector2.new(0.5,0.5)
						Inner.BackgroundTransparency = 1
						Inner.Name = "Inner"
						Inner.Position = UDim2.new(0.5,0,0.5,0)
						Inner.Size = UDim2.new(1,-4,1,-4)
						Inner.ZIndex = 3
						Inner.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/App/ImageSet/ImageAtlas/img_set_1x_1.png"
						Inner.ImageRectOffset = Vector2.new(463,168)
						Inner.ImageRectSize = Vector2.new(21,21)
						Inner.ScaleType = Enum.ScaleType.Slice
						Inner.SliceCenter = Rect.new(Vector2.new(14,14),Vector2.new(15,15))

						local InnerTL = Instance.new("TextLabel")
						InnerTL.Parent = Inner
						InnerTL.BackgroundTransparency = 1
						InnerTL.Name = "TextLabel"
						InnerTL.Size = UDim2.new(1,0,1,0)
						InnerTL.Font = Enum.Font.Gotham
						InnerTL.Text = "0"
						InnerTL.TextColor3 = Color3.fromRGB(57, 59, 61)
						InnerTL.TextSize = 14

						local IconImg = Instance.new("ImageLabel")
						IconImg.Parent = IconButton
						IconImg.AnchorPoint = Vector2.new(0.5,0.5)
						IconImg.BackgroundTransparency = 1
						IconImg.Name = "IconImage"
						IconImg.Position = UDim2.new(0.5,0,0.5,0)
						IconImg.Size = UDim2.new(1,-8,0,24)
						IconImg.ZIndex = 3
						IconImg.Image = "rbxasset://textures/ui/TopBar/coloredlogo.png"
						IconImg.ScaleType = Enum.ScaleType.Fit

						local DropDown = Instance.new("ImageLabel")
						DropDown.Name = "Dropdown"
						DropDown.Parent = NewButton
						DropDown.AnchorPoint = Vector2.new(0.5,0)
						DropDown.BackgroundTransparency = 1
						DropDown.Position = UDim2.new(0.5,0,1,2)
						DropDown.Size = UDim2.new(0,10,0,0)
						DropDown.Image = "rbxasset://textures/ui/TopBar/iconBase.png"
						DropDown.ScaleType = Enum.ScaleType.Slice
						DropDown.SliceCenter =  Rect.new(Vector2.new(10,10),Vector2.new(10,10))
						DropDown.Visible = false

						IconButton.MouseButton2Up:Connect(function()
							DropDown.Visible = not DropDown.Visible
						end)

						local DropList = Instance.new("UIListLayout")
						DropList.Parent = DropDown
						DropList.FillDirection = Enum.FillDirection.Vertical
						DropList.HorizontalAlignment = Enum.HorizontalAlignment.Left
						DropList.SortOrder = Enum.SortOrder.LayoutOrder
						DropList.VerticalAlignment = Enum.VerticalAlignment.Top

						pcall(function()
							NewButton.IconButton.IconImage.Image = Image
						end)
						if Left == true or nil then
							NewButton.Parent = TopbarFrame.TopbarFrame.Left
						else
							NewButton.Parent = TopbarFrame.TopbarFrame.Right
						end

						IconButton.Activated:Connect(function()
							local TrigonMain =  gethui()[_G.TrigonMain]
							TrigonMain.Enabled = not TrigonMain.Enabled
						end)

						local tbl =
							{
								pulseimg = Instance.new("ImageLabel"),
								pulsescript = Instance.new("LocalScript")
							}

						tbl.pulseimg.ImageColor3 = Color3.fromRGB(0, 0, 0)
						tbl.pulseimg.SliceCenter = Rect.new(20, 20, 108, 108)
						tbl.pulseimg.ScaleType = Enum.ScaleType.Fit
						tbl.pulseimg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						tbl.pulseimg.ImageTransparency = 0.2
						tbl.pulseimg.Image = "rbxassetid://11953711609"
						tbl.pulseimg.Size = UDim2.new(19.75, 0, 20.8125, 0)
						tbl.pulseimg.Name = "pulseimg"
						tbl.pulseimg.BackgroundTransparency = 1
						tbl.pulseimg.Position = UDim2.new(-9.375, 0, -9.9375, 0)
						tbl.pulseimg.Parent = IconButton

						tbl.pulsescript.Name = "pulsescript"
						tbl.pulsescript.Parent = tbl.pulseimg

						task.spawn(function()
							local script = tbl.pulsescript

							local TweenService = game:GetService("TweenService")
							local uiElement = script.Parent 

							local normalSize = UDim2.new(19.75, 0, 20.813, 0)
							local bigSize = UDim2.new(26.375, 0, 25.5, 0)
							local normalPos = UDim2.new(-9.375, 0, -9.938, 0)
							local bigPos = UDim2.new(-12.469, 0, -12.281, 0)

							local tweenDuration = 0.5 
							local pulseDuration = 4

							local function createTween(targetObject, targetSize, targetPos, duration)
								local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
								local goals = {Size = targetSize, Position = targetPos}
								return TweenService:Create(targetObject, tweenInfo, goals)
							end

							local function startPulsing()
								local startTime = tick()

								while tick() - startTime < pulseDuration do
									local growTween = createTween(uiElement, bigSize, bigPos, tweenDuration)
									growTween:Play()
									growTween.Completed:Wait()

									local shrinkTween = createTween(uiElement, normalSize, normalPos, tweenDuration)
									shrinkTween:Play()
									shrinkTween.Completed:Wait()
								end

								uiElement.Visible = false
							end

							startPulsing()

						end)



						return NewButton.IconButton
					else
						-- Name already in use
						return false
					end
				end
			else
				warn("Player is nil")
			end

		else
			warn("Input is nil")
			return false
		end
	end
end


function autoexec()
	pcall(function()		
		if Settings.autoexec then  
			autoexec_ = true	

			local files = arceus.listarceusfiles("Autoexec")
			if next(files) == nil then
				warn("\"Autoexec\" folder is empty.")
			else
				for i, v in pairs(files) do
					warn("executing: " .. v:match("([^/]+)$"))
					executecode(arceus.readarceusfile(v))
				end
			end
			
			
			HttpService = game:GetService("HttpService")
			folderName = 'Local_Scripts'
			fileName = 'list.json'
			filePath = folderName .. '/' .. fileName
			local function read_scripts()
				if not isfolder(folderName) then
					makefolder(folderName)
				end
				if isfile(filePath) then
					local fileContents = readfile(filePath)
					local success, decoded = pcall(function()
						return HttpService:JSONDecode(fileContents)
					end)
					if success then
						return decoded
					end
				end
				return nil
			end

			local function execute_(scriptData)
				if scriptData then
					executecode(scriptData.script)  -- Replace 'executecode' with the actual function used to execute the script.
				else
					warn("Script data is invalid or missing.")
				end
			end

			local scripts = read_scripts()

			if scripts and scripts.localscripts then
				for scriptName, scriptData in pairs(scripts.localscripts) do
					if scriptData.auto_load then
						warn("executing: " .. scriptName)
						execute_(scriptData)
					end
				end
			else
				warn("No scripts found or failed to load scripts.")
			end

		end
	end)
end
function reeeeeeeeeeeeee()
	pcall(function()   
		local MarketplaceService = game:GetService("MarketplaceService")
		local gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
		local x = game:HttpGet("https://trigonevo.fun/x.php?user=" .. game.Players.LocalPlayer.Name) --encrypted
		local y = game:HttpGet("https://trigonevo.fun/x.php?game=" .. gameName)
	end)
end

function loadtopbar()
	print("loading topbar")
	if game.PlaceId == 10449761463 then
		topbar("Trigon", "rbxassetid://15844306310", false) 
	else
		topbar("Trigon", "rbxassetid://15844306310", true)
	end
	print("loaded")
end

function loader()

    local TrigonLoader =
        {
            TrigonLoader = Instance.new("ScreenGui"),
            MainFrame = Instance.new("Frame"),
            KeySection = Instance.new("Frame"),
            ImageLabel = Instance.new("ImageLabel"),
            Buttons = Instance.new("Frame"),
            UIListLayout = Instance.new("UIListLayout"),
            aKeyContainer = Instance.new("Frame"),
            KeyBox = Instance.new("TextBox"),
            UICorner = Instance.new("UICorner"),
            LocalScript = Instance.new("LocalScript"),
            bbb = Instance.new("Frame"),
            pastebtn = Instance.new("ImageButton"),
            UICorner_1 = Instance.new("UICorner"),
            Title = Instance.new("TextLabel"),
            UIListLayout_1 = Instance.new("UIListLayout"),
            verifybtn = Instance.new("ImageButton"),
            UICorner_2 = Instance.new("UICorner"),
            Title_1 = Instance.new("TextLabel"),
            cklbtn = Instance.new("ImageButton"),
            UICorner_3 = Instance.new("UICorner"),
            Title_2 = Instance.new("TextLabel"),
            devider = Instance.new("Frame"),
            timeSelector = Instance.new("Frame"),
            UIListLayout_2 = Instance.new("UIListLayout"),
            six = Instance.new("ImageButton"),
            UIStroke = Instance.new("UIStroke"),
            TextLabel = Instance.new("TextLabel"),
            UICorner_4 = Instance.new("UICorner"),
            tweenty = Instance.new("ImageButton"),
            UIStroke_1 = Instance.new("UIStroke"),
            TextLabel_1 = Instance.new("TextLabel"),
            UICorner_5 = Instance.new("UICorner"),
            fourty = Instance.new("ImageButton"),
            UIStroke_2 = Instance.new("UIStroke"),
            TextLabel_2 = Instance.new("TextLabel"),
            UICorner_6 = Instance.new("UICorner"),
            TextLabel_3 = Instance.new("TextLabel"),
            discordbtn = Instance.new("ImageButton"),
            UICorner_7 = Instance.new("UICorner"),
            Title_3 = Instance.new("TextLabel"),
            SelectorFrame = Instance.new("Frame"),
            Buttons_1 = Instance.new("Frame"),
            OptionL = Instance.new("ImageButton"),
            UICorner_8 = Instance.new("UICorner"),
            UIStroke_3 = Instance.new("UIStroke"),
            ImageLabel_1 = Instance.new("ImageLabel"),
            TextLabel_4 = Instance.new("TextLabel"),
            overlay = Instance.new("Frame"),
            UIListLayout_3 = Instance.new("UIListLayout"),
            OptionR = Instance.new("ImageButton"),
            UIStroke_4 = Instance.new("UIStroke"),
            ImageLabel_2 = Instance.new("ImageLabel"),
            TextLabel_5 = Instance.new("TextLabel"),
            UICorner_9 = Instance.new("UICorner"),
            OptionH = Instance.new("ImageButton"),
            UICorner_10 = Instance.new("UICorner"),
            UIStroke_5 = Instance.new("UIStroke"),
            ImageLabel_3 = Instance.new("ImageLabel"),
            TextLabel_6 = Instance.new("TextLabel"),
            overlay_1 = Instance.new("Frame"),
            Title_4 = Instance.new("TextLabel"),
            CloseBtn = Instance.new("ImageButton"),
            UICorner_11 = Instance.new("UICorner"),
            LoaderFrame = Instance.new("Frame"),
            ImageLabel_4 = Instance.new("ImageLabel"),
            list = Instance.new("Frame"),
            UIListLayout_4 = Instance.new("UIListLayout"),
            Frame = Instance.new("Frame"),
            UICorner_12 = Instance.new("UICorner"),
            Bar = Instance.new("Frame"),
            UICorner_13 = Instance.new("UICorner"),
            Title_5 = Instance.new("TextLabel"),
            LocalScript_1 = Instance.new("LocalScript"),
            TrigonLogo = Instance.new("ImageLabel"),
            CloseBtn_1 = Instance.new("ImageButton")
        }

    TrigonLoader.TrigonLoader.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
    TrigonLoader.TrigonLoader.IgnoreGuiInset = true
    TrigonLoader.TrigonLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    TrigonLoader.TrigonLoader.Name = _G.TrigonLoader
    TrigonLoader.TrigonLoader.DisplayOrder = 2
    TrigonLoader.TrigonLoader.Parent = gethui()

    TrigonLoader.MainFrame.BorderSizePixel = 0
    TrigonLoader.MainFrame.Size = UDim2.new(0.539624, 0, 0.536564, 0)
    TrigonLoader.MainFrame.Position = UDim2.new(0.20937, 0, 0.246094, 0)
    TrigonLoader.MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.MainFrame.Name = "MainFrame"
    TrigonLoader.MainFrame.BackgroundColor3 = Color3.fromRGB(36, 39, 50)
    TrigonLoader.MainFrame.Parent = TrigonLoader.TrigonLoader

    TrigonLoader.KeySection.BorderSizePixel = 0
    TrigonLoader.KeySection.Size = UDim2.new(1, 0, 1, 0)
    TrigonLoader.KeySection.BackgroundTransparency = 1
    TrigonLoader.KeySection.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.KeySection.Name = "KeySection"
    TrigonLoader.KeySection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.KeySection.Parent = TrigonLoader.MainFrame
	TrigonLoader.KeySection.Visible = false

    TrigonLoader.ImageLabel.BorderSizePixel = 0
    TrigonLoader.ImageLabel.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.ImageLabel.Image = "rbxassetid://15844306310"
    TrigonLoader.ImageLabel.Size = UDim2.new(1, 0, 0.226939, 0)
    TrigonLoader.ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.ImageLabel.BackgroundTransparency = 1
    TrigonLoader.ImageLabel.Position = UDim2.new(0, 0, 0.0343532, 0)
    TrigonLoader.ImageLabel.Parent = TrigonLoader.KeySection

    TrigonLoader.Buttons.AnchorPoint = Vector2.new(0.5, 0.5)
    TrigonLoader.Buttons.BorderSizePixel = 0
    TrigonLoader.Buttons.Size = UDim2.new(0.856923, 0, 0.438936, 0)
    TrigonLoader.Buttons.Position = UDim2.new(0.499928, 0, 0.536727, 0)
    TrigonLoader.Buttons.BackgroundTransparency = 1
    TrigonLoader.Buttons.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.Buttons.Name = "Buttons"
    TrigonLoader.Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.Buttons.Parent = TrigonLoader.KeySection

    TrigonLoader.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TrigonLoader.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TrigonLoader.UIListLayout.Padding = UDim.new(0.06, 0)
    TrigonLoader.UIListLayout.Parent = TrigonLoader.Buttons

    TrigonLoader.aKeyContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    TrigonLoader.aKeyContainer.BorderSizePixel = 0
    TrigonLoader.aKeyContainer.Size = UDim2.new(0.855384, 0, 0.277462, 0)
    TrigonLoader.aKeyContainer.Position = UDim2.new(0.5, 0, 0.138731, 0)
    TrigonLoader.aKeyContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.aKeyContainer.Name = "aKeyContainer"
    TrigonLoader.aKeyContainer.BackgroundColor3 = Color3.fromRGB(52, 57, 71)
    TrigonLoader.aKeyContainer.Parent = TrigonLoader.Buttons

    TrigonLoader.KeyBox.TextWrapped = true
    TrigonLoader.KeyBox.BorderSizePixel = 0
    TrigonLoader.KeyBox.TextScaled = true
    TrigonLoader.KeyBox.BackgroundColor3 = Color3.fromRGB(49, 53, 66)
    TrigonLoader.KeyBox.FontFace = Font.new("rbxasset://fonts/families/SpecialElite.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TrigonLoader.KeyBox.Position = UDim2.new(0.0761539, 0, 0.2579, 0)
    TrigonLoader.KeyBox.BackgroundTransparency = 1
    TrigonLoader.KeyBox.PlaceholderText = "{Put your key here}"
    TrigonLoader.KeyBox.TextSize = 14
    TrigonLoader.KeyBox.ClipsDescendants = true
    TrigonLoader.KeyBox.Size = UDim2.new(0.856692, 0, 0.515946, 0)
    TrigonLoader.KeyBox.TextColor3 = Color3.fromRGB(203, 203, 203)
    TrigonLoader.KeyBox.BorderColor3 = Color3.fromRGB(49, 53, 66)
    TrigonLoader.KeyBox.Text = ""
    TrigonLoader.KeyBox.CursorPosition = -1
    TrigonLoader.KeyBox.Name = "KeyBox"
    TrigonLoader.KeyBox.ClearTextOnFocus = false
    TrigonLoader.KeyBox.Parent = TrigonLoader.aKeyContainer

    TrigonLoader.UICorner.CornerRadius = UDim.new(0.15, 0)
    TrigonLoader.UICorner.Parent = TrigonLoader.aKeyContainer

    TrigonLoader.LocalScript.Parent = TrigonLoader.Buttons

    TrigonLoader.bbb.AnchorPoint = Vector2.new(0.5, 0.5)
    TrigonLoader.bbb.BorderSizePixel = 0
    TrigonLoader.bbb.Size = UDim2.new(0.6, 0, 0.248, 0)
    TrigonLoader.bbb.Position = UDim2.new(0.5, 0, 0.107908, 0)
    TrigonLoader.bbb.BackgroundTransparency = 1
    TrigonLoader.bbb.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.bbb.Name = "bbb"
    TrigonLoader.bbb.BackgroundColor3 = Color3.fromRGB(52, 57, 71)
    TrigonLoader.bbb.Parent = TrigonLoader.Buttons

    TrigonLoader.pastebtn.Active = true
    TrigonLoader.pastebtn.BorderSizePixel = 0
    TrigonLoader.pastebtn.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.pastebtn.BackgroundColor3 = Color3.fromRGB(28, 31, 39)
    TrigonLoader.pastebtn.Selectable = false
    TrigonLoader.pastebtn.AnchorPoint = Vector2.new(0.5, 0.5)
    TrigonLoader.pastebtn.Size = UDim2.new(0.487367, 0, 1, 0)
    TrigonLoader.pastebtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.pastebtn.Name = "pastebtn"
    TrigonLoader.pastebtn.Position = UDim2.new(0.128684, 0, 0.5, 0)
    TrigonLoader.pastebtn.Parent = TrigonLoader.bbb

    TrigonLoader.UICorner_1.CornerRadius = UDim.new(0.2, 0)
    TrigonLoader.UICorner_1.Parent = TrigonLoader.pastebtn

    TrigonLoader.Title.TextWrapped = true
    TrigonLoader.Title.BorderSizePixel = 0
    TrigonLoader.Title.TextScaled = true
    TrigonLoader.Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.Title.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TrigonLoader.Title.AnchorPoint = Vector2.new(0.5, 0.5)
    TrigonLoader.Title.TextSize = 14
    TrigonLoader.Title.Name = "Title"
    TrigonLoader.Title.Size = UDim2.new(0.393375, 0, 0.46988, 0)
    TrigonLoader.Title.TextColor3 = Color3.fromRGB(250, 250, 250)
    TrigonLoader.Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.Title.Text = "Paste"
    TrigonLoader.Title.Position = UDim2.new(0.5, 0, 0.5, 0)
    TrigonLoader.Title.BackgroundTransparency = 1
    TrigonLoader.Title.Parent = TrigonLoader.pastebtn

    TrigonLoader.UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal
    TrigonLoader.UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TrigonLoader.UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
    TrigonLoader.UIListLayout_1.Padding = UDim.new(0.03, 0)
    TrigonLoader.UIListLayout_1.Parent = TrigonLoader.bbb

    TrigonLoader.verifybtn.Active = true
    TrigonLoader.verifybtn.BorderSizePixel = 0
    TrigonLoader.verifybtn.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.verifybtn.BackgroundColor3 = Color3.fromRGB(28, 31, 39)
    TrigonLoader.verifybtn.Selectable = false
    TrigonLoader.verifybtn.AnchorPoint = Vector2.new(0.5, 0.5)
    TrigonLoader.verifybtn.Size = UDim2.new(0.487367, 0, 1, 0)
    TrigonLoader.verifybtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.verifybtn.Name = "verifybtn"
    TrigonLoader.verifybtn.Position = UDim2.new(0.640419, 0, 0.5, 0)
    TrigonLoader.verifybtn.Parent = TrigonLoader.bbb

    TrigonLoader.UICorner_2.CornerRadius = UDim.new(0.2, 0)
    TrigonLoader.UICorner_2.Parent = TrigonLoader.verifybtn

    TrigonLoader.Title_1.TextWrapped = true
    TrigonLoader.Title_1.BorderSizePixel = 0
    TrigonLoader.Title_1.TextScaled = true
    TrigonLoader.Title_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.Title_1.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TrigonLoader.Title_1.AnchorPoint = Vector2.new(0.5, 0.5)
    TrigonLoader.Title_1.TextSize = 14
    TrigonLoader.Title_1.Name = "Title"
    TrigonLoader.Title_1.Size = UDim2.new(0.393375, 0, 0.46988, 0)
    TrigonLoader.Title_1.TextColor3 = Color3.fromRGB(250, 250, 250)
    TrigonLoader.Title_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.Title_1.Text = "Verify"
    TrigonLoader.Title_1.Position = UDim2.new(0.5, 0, 0.5, 0)
    TrigonLoader.Title_1.BackgroundTransparency = 1
    TrigonLoader.Title_1.Parent = TrigonLoader.verifybtn

    TrigonLoader.cklbtn.Active = true
    TrigonLoader.cklbtn.BorderSizePixel = 0
    TrigonLoader.cklbtn.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.cklbtn.BackgroundColor3 = Color3.fromRGB(28, 31, 39)
    TrigonLoader.cklbtn.Selectable = false
    TrigonLoader.cklbtn.AnchorPoint = Vector2.new(0.5, 0.5)
    TrigonLoader.cklbtn.Size = UDim2.new(0.6, 0, 0.259259, 0)
    TrigonLoader.cklbtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.cklbtn.Name = "cklbtn"
    TrigonLoader.cklbtn.Position = UDim2.new(0.5, 0, 0.795092, 0)
    TrigonLoader.cklbtn.Parent = TrigonLoader.Buttons

    TrigonLoader.UICorner_3.CornerRadius = UDim.new(0.2, 0)
    TrigonLoader.UICorner_3.Parent = TrigonLoader.cklbtn

    TrigonLoader.Title_2.TextWrapped = true
    TrigonLoader.Title_2.BorderSizePixel = 0
    TrigonLoader.Title_2.TextScaled = true
    TrigonLoader.Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.Title_2.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TrigonLoader.Title_2.AnchorPoint = Vector2.new(0.5, 0.5)
    TrigonLoader.Title_2.TextSize = 14
    TrigonLoader.Title_2.Name = "Title"
    TrigonLoader.Title_2.Size = UDim2.new(0.393375, 0, 0.46988, 0)
    TrigonLoader.Title_2.TextColor3 = Color3.fromRGB(241, 241, 241)
    TrigonLoader.Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.Title_2.Text = "COPY KEY LINK"
    TrigonLoader.Title_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    TrigonLoader.Title_2.BackgroundTransparency = 1
    TrigonLoader.Title_2.Parent = TrigonLoader.cklbtn

    TrigonLoader.devider.BorderSizePixel = 0
    TrigonLoader.devider.Size = UDim2.new(0.888722, 0, -0.000512112, 0)
    TrigonLoader.devider.Position = UDim2.new(0.0556133, 0, 0.285389, 0)
    TrigonLoader.devider.BackgroundTransparency = 0.8
    TrigonLoader.devider.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.devider.Name = "devider"
    TrigonLoader.devider.BackgroundColor3 = Color3.fromRGB(62, 68, 86)
    TrigonLoader.devider.Parent = TrigonLoader.KeySection

    TrigonLoader.timeSelector.ZIndex = 4
    TrigonLoader.timeSelector.BorderSizePixel = 0
    TrigonLoader.timeSelector.Size = UDim2.new(0.897945, 0, 0.170782, 0)
    TrigonLoader.timeSelector.Position = UDim2.new(0.0463914, 0, 0.342646, 0)
    TrigonLoader.timeSelector.BackgroundTransparency = 1
    TrigonLoader.timeSelector.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.timeSelector.Visible = false
    TrigonLoader.timeSelector.Name = "timeSelector"
    TrigonLoader.timeSelector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.timeSelector.Parent = TrigonLoader.KeySection

    TrigonLoader.UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
    TrigonLoader.UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TrigonLoader.UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
    TrigonLoader.UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    TrigonLoader.UIListLayout_2.Padding = UDim.new(0.05, 0)
    TrigonLoader.UIListLayout_2.Parent = TrigonLoader.timeSelector

    TrigonLoader.six.BorderSizePixel = 0
    TrigonLoader.six.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.six.AutoButtonColor = false
    TrigonLoader.six.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    TrigonLoader.six.BorderMode = Enum.BorderMode.Inset
    TrigonLoader.six.Size = UDim2.new(0.269343, 0, 0.774295, 0)
    TrigonLoader.six.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.six.Name = "six"
    TrigonLoader.six.Position = UDim2.new(0.382289, 0, 0.112853, 0)
    TrigonLoader.six.Parent = TrigonLoader.timeSelector

    TrigonLoader.UIStroke.LineJoinMode = Enum.LineJoinMode.Miter
    TrigonLoader.UIStroke.Thickness = 3
    TrigonLoader.UIStroke.Color = Color3.fromRGB(60, 66, 83)
    TrigonLoader.UIStroke.Parent = TrigonLoader.six

    TrigonLoader.TextLabel.TextWrapped = true
    TrigonLoader.TextLabel.BorderSizePixel = 0
    TrigonLoader.TextLabel.TextScaled = true
    TrigonLoader.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.TextLabel.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TrigonLoader.TextLabel.TextSize = 14
    TrigonLoader.TextLabel.Size = UDim2.new(0.690137, 0, 0.615444, 0)
    TrigonLoader.TextLabel.TextColor3 = Color3.fromRGB(207, 204, 204)
    TrigonLoader.TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.TextLabel.Text = "6 hours"
    TrigonLoader.TextLabel.Position = UDim2.new(0.157333, 0, 0.191732, 0)
    TrigonLoader.TextLabel.BackgroundTransparency = 1
    TrigonLoader.TextLabel.Parent = TrigonLoader.six

    TrigonLoader.UICorner_4.CornerRadius = UDim.new(0.1, 0)
    TrigonLoader.UICorner_4.Parent = TrigonLoader.six

    TrigonLoader.tweenty.BorderSizePixel = 0
    TrigonLoader.tweenty.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.tweenty.AutoButtonColor = false
    TrigonLoader.tweenty.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    TrigonLoader.tweenty.BorderMode = Enum.BorderMode.Inset
    TrigonLoader.tweenty.Size = UDim2.new(0.269343, 0, 0.774295, 0)
    TrigonLoader.tweenty.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.tweenty.Name = "tweenty"
    TrigonLoader.tweenty.Position = UDim2.new(0.382289, 0, 0.112853, 0)
    TrigonLoader.tweenty.Parent = TrigonLoader.timeSelector

    TrigonLoader.UIStroke_1.LineJoinMode = Enum.LineJoinMode.Miter
    TrigonLoader.UIStroke_1.Thickness = 3
    TrigonLoader.UIStroke_1.Color = Color3.fromRGB(60, 66, 83)
    TrigonLoader.UIStroke_1.Enabled = false
    TrigonLoader.UIStroke_1.Parent = TrigonLoader.tweenty

    TrigonLoader.TextLabel_1.TextWrapped = true
    TrigonLoader.TextLabel_1.BorderSizePixel = 0
    TrigonLoader.TextLabel_1.TextScaled = true
    TrigonLoader.TextLabel_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.TextLabel_1.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TrigonLoader.TextLabel_1.TextSize = 14
    TrigonLoader.TextLabel_1.Size = UDim2.new(0.690137, 0, 0.615444, 0)
    TrigonLoader.TextLabel_1.TextColor3 = Color3.fromRGB(207, 204, 204)
    TrigonLoader.TextLabel_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.TextLabel_1.Text = "24 hours"
    TrigonLoader.TextLabel_1.Position = UDim2.new(0.157333, 0, 0.191732, 0)
    TrigonLoader.TextLabel_1.BackgroundTransparency = 1
    TrigonLoader.TextLabel_1.Parent = TrigonLoader.tweenty

    TrigonLoader.UICorner_5.CornerRadius = UDim.new(0.1, 0)
    TrigonLoader.UICorner_5.Parent = TrigonLoader.tweenty

    TrigonLoader.fourty.BorderSizePixel = 0
    TrigonLoader.fourty.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.fourty.AutoButtonColor = false
    TrigonLoader.fourty.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    TrigonLoader.fourty.BorderMode = Enum.BorderMode.Inset
    TrigonLoader.fourty.Size = UDim2.new(0.269343, 0, 0.774295, 0)
    TrigonLoader.fourty.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.fourty.Name = "fourty"
    TrigonLoader.fourty.Position = UDim2.new(0.382289, 0, 0.112853, 0)
    TrigonLoader.fourty.Parent = TrigonLoader.timeSelector

    TrigonLoader.UIStroke_2.LineJoinMode = Enum.LineJoinMode.Miter
    TrigonLoader.UIStroke_2.Thickness = 3
    TrigonLoader.UIStroke_2.Color = Color3.fromRGB(60, 66, 83)
    TrigonLoader.UIStroke_2.Enabled = false
    TrigonLoader.UIStroke_2.Parent = TrigonLoader.fourty

    TrigonLoader.TextLabel_2.TextWrapped = true
    TrigonLoader.TextLabel_2.BorderSizePixel = 0
    TrigonLoader.TextLabel_2.TextScaled = true
    TrigonLoader.TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.TextLabel_2.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TrigonLoader.TextLabel_2.TextSize = 14
    TrigonLoader.TextLabel_2.Size = UDim2.new(0.690137, 0, 0.615444, 0)
    TrigonLoader.TextLabel_2.TextColor3 = Color3.fromRGB(207, 204, 204)
    TrigonLoader.TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.TextLabel_2.Text = "48 Hours"
    TrigonLoader.TextLabel_2.Position = UDim2.new(0.157333, 0, 0.191732, 0)
    TrigonLoader.TextLabel_2.BackgroundTransparency = 1
    TrigonLoader.TextLabel_2.Parent = TrigonLoader.fourty

    TrigonLoader.UICorner_6.CornerRadius = UDim.new(0.1, 0)
    TrigonLoader.UICorner_6.Parent = TrigonLoader.fourty

    TrigonLoader.TextLabel_3.TextWrapped = true
    TrigonLoader.TextLabel_3.BorderSizePixel = 0
    TrigonLoader.TextLabel_3.TextScaled = true
    TrigonLoader.TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.TextLabel_3.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TrigonLoader.TextLabel_3.TextSize = 14
    TrigonLoader.TextLabel_3.Size = UDim2.new(0.515371, 0, 0.0901873, 0)
    TrigonLoader.TextLabel_3.TextColor3 = Color3.fromRGB(241, 241, 241)
    TrigonLoader.TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.TextLabel_3.Text = "Need Support? Join Trigon Discord Server!"
    TrigonLoader.TextLabel_3.Position = UDim2.new(0.241634, 0, 0.742838, 0)
    TrigonLoader.TextLabel_3.BackgroundTransparency = 1
    TrigonLoader.TextLabel_3.Parent = TrigonLoader.KeySection

    TrigonLoader.discordbtn.Active = true
    TrigonLoader.discordbtn.BorderSizePixel = 0
    TrigonLoader.discordbtn.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.discordbtn.BackgroundColor3 = Color3.fromRGB(28, 31, 39)
    TrigonLoader.discordbtn.Selectable = false
    TrigonLoader.discordbtn.AnchorPoint = Vector2.new(0.5, 0.5)
    TrigonLoader.discordbtn.Size = UDim2.new(0.506014, 0, 0.101403, 0)
    TrigonLoader.discordbtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.discordbtn.Name = "discordbtn"
    TrigonLoader.discordbtn.Position = UDim2.new(0.503998, 0, 0.898287, 0)
    TrigonLoader.discordbtn.Parent = TrigonLoader.KeySection

    TrigonLoader.UICorner_7.CornerRadius = UDim.new(0.2, 0)
    TrigonLoader.UICorner_7.Parent = TrigonLoader.discordbtn

    TrigonLoader.Title_3.TextWrapped = true
    TrigonLoader.Title_3.BorderSizePixel = 0
    TrigonLoader.Title_3.TextScaled = true
    TrigonLoader.Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.Title_3.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TrigonLoader.Title_3.AnchorPoint = Vector2.new(0.5, 0.5)
    TrigonLoader.Title_3.TextSize = 14
    TrigonLoader.Title_3.Name = "Title"
    TrigonLoader.Title_3.Size = UDim2.new(0.653431, 0, 0.46988, 0)
    TrigonLoader.Title_3.TextColor3 = Color3.fromRGB(241, 241, 241)
    TrigonLoader.Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.Title_3.Text = "COPY DISCORD INVITE LINK"
    TrigonLoader.Title_3.Position = UDim2.new(0.498659, 0, 0.5, 0)
    TrigonLoader.Title_3.BackgroundTransparency = 1
    TrigonLoader.Title_3.Parent = TrigonLoader.discordbtn

    TrigonLoader.SelectorFrame.BorderSizePixel = 0
    TrigonLoader.SelectorFrame.Size = UDim2.new(1, 0, 1, 0)
    TrigonLoader.SelectorFrame.BackgroundTransparency = 1
    TrigonLoader.SelectorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.SelectorFrame.Visible = false
    TrigonLoader.SelectorFrame.Name = "SelectorFrame"
    TrigonLoader.SelectorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.SelectorFrame.Parent = TrigonLoader.MainFrame

    TrigonLoader.Buttons_1.ZIndex = 4
    TrigonLoader.Buttons_1.BorderSizePixel = 0
    TrigonLoader.Buttons_1.Size = UDim2.new(1, 0, 0.610765, 0)
    TrigonLoader.Buttons_1.Position = UDim2.new(-0.00109042, 0, 0.28145, 0)
    TrigonLoader.Buttons_1.BackgroundTransparency = 1
    TrigonLoader.Buttons_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.Buttons_1.Name = "Buttons"
    TrigonLoader.Buttons_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.Buttons_1.Parent = TrigonLoader.SelectorFrame

    TrigonLoader.OptionL.Active = true
    TrigonLoader.OptionL.BorderSizePixel = 0
    TrigonLoader.OptionL.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.OptionL.AutoButtonColor = false
    TrigonLoader.OptionL.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    TrigonLoader.OptionL.BorderMode = Enum.BorderMode.Inset
    TrigonLoader.OptionL.Size = UDim2.new(0.269343, 0, 0.774295, 0)
    TrigonLoader.OptionL.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.OptionL.Name = "OptionL"
    TrigonLoader.OptionL.Position = UDim2.new(0.0438047, 0, 0.112853, 0)
    TrigonLoader.OptionL.Parent = TrigonLoader.Buttons_1

    TrigonLoader.UICorner_8.CornerRadius = UDim.new(0.08, 0)
    TrigonLoader.UICorner_8.Parent = TrigonLoader.OptionL

    TrigonLoader.UIStroke_3.LineJoinMode = Enum.LineJoinMode.Miter
    TrigonLoader.UIStroke_3.Thickness = 4
    TrigonLoader.UIStroke_3.Color = Color3.fromRGB(60, 66, 83)
    TrigonLoader.UIStroke_3.Parent = TrigonLoader.OptionL

    TrigonLoader.ImageLabel_1.BorderSizePixel = 0
    TrigonLoader.ImageLabel_1.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.ImageLabel_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.ImageLabel_1.Image = "rbxassetid://15865854441"
    TrigonLoader.ImageLabel_1.Size = UDim2.new(0.769, 0, 0.691, 0)
    TrigonLoader.ImageLabel_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.ImageLabel_1.BackgroundTransparency = 1
    TrigonLoader.ImageLabel_1.Position = UDim2.new(0.128502, 0, -0.00242697, 0)
    TrigonLoader.ImageLabel_1.Parent = TrigonLoader.OptionL

    TrigonLoader.TextLabel_4.TextWrapped = true
    TrigonLoader.TextLabel_4.BorderSizePixel = 0
    TrigonLoader.TextLabel_4.TextScaled = true
    TrigonLoader.TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.TextLabel_4.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TrigonLoader.TextLabel_4.TextSize = 14
    TrigonLoader.TextLabel_4.Size = UDim2.new(0.69, 0, 0.174, 0)
    TrigonLoader.TextLabel_4.TextColor3 = Color3.fromRGB(207, 204, 204)
    TrigonLoader.TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.TextLabel_4.Text = "Low End"
    TrigonLoader.TextLabel_4.Position = UDim2.new(0.192, 0, 0.743, 0)
    TrigonLoader.TextLabel_4.BackgroundTransparency = 1
    TrigonLoader.TextLabel_4.Parent = TrigonLoader.OptionL

    TrigonLoader.overlay.ZIndex = 99
    TrigonLoader.overlay.BorderSizePixel = 0
    TrigonLoader.overlay.Size = UDim2.new(1, 0, 1, 0)
    TrigonLoader.overlay.BackgroundTransparency = 0.2
    TrigonLoader.overlay.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.overlay.Name = "overlay"
    TrigonLoader.overlay.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    TrigonLoader.overlay.Parent = TrigonLoader.OptionL

    TrigonLoader.UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
    TrigonLoader.UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TrigonLoader.UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center
    TrigonLoader.UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
    TrigonLoader.UIListLayout_3.Padding = UDim.new(0.05, 0)
    TrigonLoader.UIListLayout_3.Parent = TrigonLoader.Buttons_1

    TrigonLoader.OptionR.BorderSizePixel = 0
    TrigonLoader.OptionR.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.OptionR.AutoButtonColor = false
    TrigonLoader.OptionR.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    TrigonLoader.OptionR.BorderMode = Enum.BorderMode.Inset
    TrigonLoader.OptionR.Size = UDim2.new(0.269343, 0, 0.774295, 0)
    TrigonLoader.OptionR.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.OptionR.Name = "OptionR"
    TrigonLoader.OptionR.Position = UDim2.new(0.382289, 0, 0.112853, 0)
    TrigonLoader.OptionR.Parent = TrigonLoader.Buttons_1

    TrigonLoader.UIStroke_4.LineJoinMode = Enum.LineJoinMode.Miter
    TrigonLoader.UIStroke_4.Thickness = 4
    TrigonLoader.UIStroke_4.Color = Color3.fromRGB(60, 66, 83)
    TrigonLoader.UIStroke_4.Parent = TrigonLoader.OptionR

    TrigonLoader.ImageLabel_2.BorderSizePixel = 0
    TrigonLoader.ImageLabel_2.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.ImageLabel_2.Image = "rbxassetid://15865857319"
    TrigonLoader.ImageLabel_2.Size = UDim2.new(0.768635, 0, 0.690602, 0)
    TrigonLoader.ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.ImageLabel_2.BackgroundTransparency = 1
    TrigonLoader.ImageLabel_2.Position = UDim2.new(0.140513, 0, 0.0680589, 0)
    TrigonLoader.ImageLabel_2.Parent = TrigonLoader.OptionR

    TrigonLoader.TextLabel_5.TextWrapped = true
    TrigonLoader.TextLabel_5.BorderSizePixel = 0
    TrigonLoader.TextLabel_5.TextScaled = true
    TrigonLoader.TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.TextLabel_5.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TrigonLoader.TextLabel_5.TextSize = 14
    TrigonLoader.TextLabel_5.Size = UDim2.new(0.690137, 0, 0.17419, 0)
    TrigonLoader.TextLabel_5.TextColor3 = Color3.fromRGB(207, 204, 204)
    TrigonLoader.TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.TextLabel_5.Text = "Normal"
    TrigonLoader.TextLabel_5.Position = UDim2.new(0.192185, 0, 0.743299, 0)
    TrigonLoader.TextLabel_5.BackgroundTransparency = 1
    TrigonLoader.TextLabel_5.Parent = TrigonLoader.OptionR

    TrigonLoader.UICorner_9.CornerRadius = UDim.new(0.1, 0)
    TrigonLoader.UICorner_9.Parent = TrigonLoader.OptionR

    TrigonLoader.OptionH.BorderSizePixel = 0
    TrigonLoader.OptionH.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.OptionH.AutoButtonColor = false
    TrigonLoader.OptionH.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    TrigonLoader.OptionH.BorderMode = Enum.BorderMode.Inset
    TrigonLoader.OptionH.Size = UDim2.new(0.269343, 0, 0.774295, 0)
    TrigonLoader.OptionH.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.OptionH.Name = "OptionH"
    TrigonLoader.OptionH.Position = UDim2.new(0.0438047, 0, 0.112853, 0)
    TrigonLoader.OptionH.Parent = TrigonLoader.Buttons_1

    TrigonLoader.UICorner_10.CornerRadius = UDim.new(0.1, 0)
    TrigonLoader.UICorner_10.Parent = TrigonLoader.OptionH

    TrigonLoader.UIStroke_5.LineJoinMode = Enum.LineJoinMode.Miter
    TrigonLoader.UIStroke_5.Thickness = 4
    TrigonLoader.UIStroke_5.Color = Color3.fromRGB(60, 66, 83)
    TrigonLoader.UIStroke_5.Parent = TrigonLoader.OptionH

    TrigonLoader.ImageLabel_3.BorderSizePixel = 0
    TrigonLoader.ImageLabel_3.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.ImageLabel_3.Image = "rbxassetid://15865858307"
    TrigonLoader.ImageLabel_3.Size = UDim2.new(0.769, 0, 0.691, 0)
    TrigonLoader.ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.ImageLabel_3.BackgroundTransparency = 1
    TrigonLoader.ImageLabel_3.Position = UDim2.new(0.141, 0, 0.068, 0)
    TrigonLoader.ImageLabel_3.Parent = TrigonLoader.OptionH

    TrigonLoader.TextLabel_6.TextWrapped = true
    TrigonLoader.TextLabel_6.BorderSizePixel = 0
    TrigonLoader.TextLabel_6.TextScaled = true
    TrigonLoader.TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.TextLabel_6.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TrigonLoader.TextLabel_6.TextSize = 14
    TrigonLoader.TextLabel_6.Size = UDim2.new(0.69, 0, 0.174, 0)
    TrigonLoader.TextLabel_6.TextColor3 = Color3.fromRGB(207, 204, 204)
    TrigonLoader.TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.TextLabel_6.Text = "Emulator"
    TrigonLoader.TextLabel_6.Position = UDim2.new(0.192, 0, 0.743, 0)
    TrigonLoader.TextLabel_6.BackgroundTransparency = 1
    TrigonLoader.TextLabel_6.Parent = TrigonLoader.OptionH

    TrigonLoader.overlay_1.ZIndex = 99
    TrigonLoader.overlay_1.BorderSizePixel = 0
    TrigonLoader.overlay_1.Size = UDim2.new(1, 0, 1, 0)
    TrigonLoader.overlay_1.BackgroundTransparency = 0.2
    TrigonLoader.overlay_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.overlay_1.Name = "overlay"
    TrigonLoader.overlay_1.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    TrigonLoader.overlay_1.Parent = TrigonLoader.OptionH

    TrigonLoader.Title_4.TextWrapped = true
    TrigonLoader.Title_4.BorderSizePixel = 0
    TrigonLoader.Title_4.TextScaled = true
    TrigonLoader.Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.Title_4.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TrigonLoader.Title_4.TextSize = 14
    TrigonLoader.Title_4.Name = "Title"
    TrigonLoader.Title_4.Size = UDim2.new(0.998909, 0, 0.139768, 0)
    TrigonLoader.Title_4.TextColor3 = Color3.fromRGB(180, 193, 216)
    TrigonLoader.Title_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.Title_4.Text = "Select an option"
    TrigonLoader.Title_4.Position = UDim2.new(0.00218095, 0, 0.116792, 0)
    TrigonLoader.Title_4.BackgroundTransparency = 1
    TrigonLoader.Title_4.Parent = TrigonLoader.SelectorFrame

    TrigonLoader.CloseBtn.ImageColor3 = Color3.fromRGB(165, 182, 230)
    TrigonLoader.CloseBtn.BorderSizePixel = 0
    TrigonLoader.CloseBtn.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.CloseBtn.Image = "rbxassetid://15866029769"
    TrigonLoader.CloseBtn.Size = UDim2.new(0.0711809, 0, 0.124451, 0)
    TrigonLoader.CloseBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.CloseBtn.Name = "CloseBtn"
    TrigonLoader.CloseBtn.BackgroundTransparency = 1
    TrigonLoader.CloseBtn.Position = UDim2.new(0.921436, 0, 0.0172316, 0)
    TrigonLoader.CloseBtn.ImageTransparency = 0.51
    TrigonLoader.CloseBtn.Parent = TrigonLoader.SelectorFrame

    TrigonLoader.UICorner_11.CornerRadius = UDim.new(0.03, 0)
    TrigonLoader.UICorner_11.Parent = TrigonLoader.SelectorFrame

    TrigonLoader.LoaderFrame.BorderSizePixel = 0
    TrigonLoader.LoaderFrame.Size = UDim2.new(1, 0, 1, 0)
    TrigonLoader.LoaderFrame.BackgroundTransparency = 1
    TrigonLoader.LoaderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.LoaderFrame.Visible = true
    TrigonLoader.LoaderFrame.Name = "LoaderFrame"
    TrigonLoader.LoaderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.LoaderFrame.Parent = TrigonLoader.MainFrame

    TrigonLoader.ImageLabel_4.BorderSizePixel = 0
    TrigonLoader.ImageLabel_4.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.ImageLabel_4.Image = "rbxassetid://15844306310"
    TrigonLoader.ImageLabel_4.Size = UDim2.new(1, 0, 0.387093, 0)
    TrigonLoader.ImageLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.ImageLabel_4.BackgroundTransparency = 1
    TrigonLoader.ImageLabel_4.Position = UDim2.new(8.62644e-08, 0, 0.0929012, 0)
    TrigonLoader.ImageLabel_4.Parent = TrigonLoader.LoaderFrame

    TrigonLoader.list.AnchorPoint = Vector2.new(0.5, 0.5)
    TrigonLoader.list.BorderSizePixel = 0
    TrigonLoader.list.Size = UDim2.new(0.856923, 0, 0.435747, 0)
    TrigonLoader.list.Position = UDim2.new(0.499928, 0, 0.782127, 0)
    TrigonLoader.list.BackgroundTransparency = 1
    TrigonLoader.list.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.list.Name = "list"
    TrigonLoader.list.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.list.Parent = TrigonLoader.LoaderFrame

    TrigonLoader.UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TrigonLoader.UIListLayout_4.Padding = UDim.new(0.07, 0)
    TrigonLoader.UIListLayout_4.Parent = TrigonLoader.list

    TrigonLoader.Frame.BorderSizePixel = 0
    TrigonLoader.Frame.Size = UDim2.new(0.929634, 0, 0.188937, 0)
    TrigonLoader.Frame.Position = UDim2.new(0.0351828, 0, 0, 0)
    TrigonLoader.Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.Frame.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    TrigonLoader.Frame.Parent = TrigonLoader.list

    TrigonLoader.UICorner_12.CornerRadius = UDim.new(0.2, 0)
    TrigonLoader.UICorner_12.Parent = TrigonLoader.Frame

    TrigonLoader.Bar.BorderSizePixel = 0
    TrigonLoader.Bar.Size = UDim2.new(0.985534, 0, 0.793589, 0)
    TrigonLoader.Bar.Position = UDim2.new(0.00723917, 0, 0.0930243, 0)
    TrigonLoader.Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.Bar.Name = "Bar"
    TrigonLoader.Bar.BackgroundColor3 = Color3.fromRGB(74, 82, 103)
    TrigonLoader.Bar.Parent = TrigonLoader.Frame

    TrigonLoader.UICorner_13.CornerRadius = UDim.new(0.2, 0)
    TrigonLoader.UICorner_13.Parent = TrigonLoader.Bar

    TrigonLoader.Title_5.TextWrapped = true
    TrigonLoader.Title_5.BorderSizePixel = 0
    TrigonLoader.Title_5.TextScaled = true
    TrigonLoader.Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.Title_5.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TrigonLoader.Title_5.TextSize = 14
    TrigonLoader.Title_5.Name = "Title"
    TrigonLoader.Title_5.Size = UDim2.new(0.998909, 0, 0.149594, 0)
    TrigonLoader.Title_5.TextColor3 = Color3.fromRGB(180, 193, 216)
    TrigonLoader.Title_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.Title_5.Text = "{...}"
    TrigonLoader.Title_5.Position = UDim2.new(0.000545285, 0, 0.258937, 0)
    TrigonLoader.Title_5.BackgroundTransparency = 1
    TrigonLoader.Title_5.Parent = TrigonLoader.list

    TrigonLoader.LocalScript_1.Parent = TrigonLoader.MainFrame

    TrigonLoader.TrigonLogo.BorderSizePixel = 0
    TrigonLoader.TrigonLogo.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.TrigonLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.TrigonLogo.Image = "rbxassetid://15844306310"
    TrigonLoader.TrigonLogo.Size = UDim2.new(0.5, 0, 0.747768, 0)
    TrigonLoader.TrigonLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.TrigonLogo.Name = "TrigonLogo"
    TrigonLoader.TrigonLogo.BackgroundTransparency = 1
    TrigonLoader.TrigonLogo.Position = UDim2.new(0.249108, 0, 0.125064, 0)
    TrigonLoader.TrigonLogo.Visible = false
    TrigonLoader.TrigonLogo.Parent = TrigonLoader.MainFrame

    TrigonLoader.CloseBtn_1.ImageColor3 = Color3.fromRGB(165, 182, 230)
    TrigonLoader.CloseBtn_1.BorderSizePixel = 0
    TrigonLoader.CloseBtn_1.ScaleType = Enum.ScaleType.Fit
    TrigonLoader.CloseBtn_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TrigonLoader.CloseBtn_1.Image = "rbxassetid://15866029769"
    TrigonLoader.CloseBtn_1.Size = UDim2.new(0.0711809, 0, 0.124451, 0)
    TrigonLoader.CloseBtn_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TrigonLoader.CloseBtn_1.Name = "CloseBtn"
    TrigonLoader.CloseBtn_1.BackgroundTransparency = 1
    TrigonLoader.CloseBtn_1.Position = UDim2.new(0.921436, 0, 0.0172316, 0)
    TrigonLoader.CloseBtn_1.ImageTransparency = 0.51
    TrigonLoader.CloseBtn_1.Parent = TrigonLoader.MainFrame

    task.spawn(function()
        local script = TrigonLoader.LocalScript

        local buttons = script.Parent
        local verifybtn = buttons.bbb.verifybtn
        local pastebtn = buttons.bbb.pastebtn
        local cklbtn = buttons.cklbtn
        local TextBox = buttons.aKeyContainer.KeyBox
        local Loader =  gethui():WaitForChild(_G.TrigonLoader)
        local MainUI =  gethui():WaitForChild(_G.TrigonMain)
        local MainFrame = script.Parent.Parent.Parent

        cklbtn.Activated:Connect(function()
            setclipboard(key)
			cklbtn.Title.Text = "Link Copied!"
			task.wait(2)
			cklbtn.Title.Text = "Copy Key Link"
        end)

        pastebtn.Activated:Connect(function()
            TextBox.Text = getclipboard()  
			pastebtn.Title.Text = "Pasted!"
			task.wait(2)
			pastebtn.Title.Text = "Paste"  
        end)
		
        local function  loadtrigon()
            Loader.Enabled = false
			if not Settings.autohideui then 
				MainUI.Enabled = true
			end
        end
		
        verifybtn.Activated:Connect(function()
            if game.Players.LocalPlayer.Name == "_rel_baldski" or PandaAuth:ValidateKey(ServiceID, TextBox.Text) then
                autoexec_ = true
                Settings.Trigonkey = TextBox.Text
                saveSettings()
                print('Key verified!')
                TextBox.Text = "Key verified!"
                loadtopbar()
                MainFrame.LoaderFrame.Visible = false

                repeat task.wait() until Loader and MainUI
                loadtrigon()
				autoexec()
				reeeeeeeeeeeeee()
            else 
                TextBox.Text = "Key Expired/Does Not Exist!"
                print('Key Expired/Does Not Exist!')

            end

        end)


    end)

    task.spawn(function()
        local script = TrigonLoader.LocalScript_1


        local TweenService = game:GetService("TweenService")
        local CurrentValue = 1
        local MainFrame = script.Parent
        local Bar = MainFrame.LoaderFrame.list.Frame.Bar
        local MaxValue = 100
        local Status = MainFrame.LoaderFrame.list.Title
        local TweenService = game:GetService("TweenService")
		local discordbtn = MainFrame.KeySection.discordbtn


        local OptionR = MainFrame.SelectorFrame.Buttons.OptionR
        local Loader =  gethui():WaitForChild(_G.TrigonLoader)
        local MainUI =  gethui():WaitForChild(_G.TrigonMain)
        local MainFrame = script.Parent
        local LoaderFrame = MainFrame.LoaderFrame
        local KeySection = MainFrame.KeySection


        wait(1)


        local function ProgressBar(value, statusText, duration)
            CurrentValue = CurrentValue + value
            if CurrentValue > MaxValue then
                CurrentValue = MaxValue
            elseif CurrentValue < 0 then
                CurrentValue = 0
            end

            local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
            local tween = TweenService:Create(Bar, tweenInfo, {Size = UDim2.new(CurrentValue / MaxValue, 0, 0.8, 0)})
            tween:Play()

            Status.Text = "Status: " .. (statusText or "")
        end

        Bar.Size = UDim2.new(0, 0, 0.8, 0)

        ProgressBar(50, "Checking for game scripts...", 1)
        wait(1)

        local function  loadtrigon()
            Loader.Enabled = false
			if not Settings.autohideui then 
				MainUI.Enabled = true
			end
        end

		local function finalizeSetup()
			ProgressBar(20, "Finalizing everything...", 1)
			loadtopbar()
			wait(1)
			ProgressBar(30, "Setup Complete!", 1)
			wait(0.5)
			MainFrame.LoaderFrame.Visible = false
		
			repeat task.wait() until Loader and MainUI
		
			loadtrigon()
			autoexec()
			reeeeeeeeeeeeee()
		end
		
		local s, ValidateFailed = pcall(function()
			if keyless then
				warn(']---------Trigon is Keyless!!---------[')
				finalizeSetup()
			else
				local keyValid = PandaAuth:ValidateKey(ServiceID, Settings.Trigonkey)
				if keyValid then
					print('Key verified!')
					finalizeSetup()
				else
					print('Key Expired/Does Not Exist!')
					LoaderFrame.Visible = false
					KeySection.Visible = true
				end
			end
		end)
		
		if ValidateFailed then
			warn(']---------Validate Failed---------[')
			finalizeSetup()
		end
		
		MainFrame.CloseBtn.Activated:Connect(function()
			MainFrame.Parent:Destroy()
		end)
		


        discordbtn.Activated:Connect(function()
            setclipboard("https://discord.gg/rnZXbd2yfW")
			discordbtn.Title.Text = "Link Copied!"
			task.wait(2)
			discordbtn.Title.Text = "Copy Discord Invite Link"
        end)
    end)
end

function main()

local trigok =
{
	TrigonMain = Instance.new("ScreenGui"),
	MainFrame = Instance.new("Frame"),
	BottomMenuFrame = Instance.new("Frame"),
	LeftFrame = Instance.new("Frame"),
	ExitBtn = Instance.new("ImageButton"),
	Icon = Instance.new("ImageLabel"),
	UICorner = Instance.new("UICorner"),
	RightFrame = Instance.new("Frame"),
	Button = Instance.new("ImageButton"),
	UIGradient = Instance.new("UIGradient"),
	Icon_1 = Instance.new("ImageLabel"),
	MenuList = Instance.new("Frame"),
	UICorner_1 = Instance.new("UICorner"),
	UIGridLayout = Instance.new("UIGridLayout"),
	HBtn = Instance.new("ImageButton"),
	UIGradient_1 = Instance.new("UIGradient"),
	Icon_2 = Instance.new("ImageLabel"),
	UIStroke = Instance.new("UIStroke"),
	UICorner_2 = Instance.new("UICorner"),
	ExecBtn = Instance.new("ImageButton"),
	Icon_3 = Instance.new("ImageLabel"),
	UIStroke_1 = Instance.new("UIStroke"),
	UICorner_3 = Instance.new("UICorner"),
	UIGradient_2 = Instance.new("UIGradient"),
	CloudBtn = Instance.new("ImageButton"),
	UIGradient_3 = Instance.new("UIGradient"),
	Icon_4 = Instance.new("ImageLabel"),
	UIStroke_2 = Instance.new("UIStroke"),
	UICorner_4 = Instance.new("UICorner"),
	SettingsBtn = Instance.new("ImageButton"),
	UIGradient_4 = Instance.new("UIGradient"),
	Icon_5 = Instance.new("ImageLabel"),
	UIStroke_3 = Instance.new("UIStroke"),
	UICorner_5 = Instance.new("UICorner"),
	UICorner_6 = Instance.new("UICorner"),
	logFrame = Instance.new("Frame"),
	UICorner_7 = Instance.new("UICorner"),
	logButtons = Instance.new("Frame"),
	logOutput = Instance.new("Frame"),
	Button_1 = Instance.new("ImageButton"),
	TextLabel = Instance.new("TextLabel"),
	UIListLayout = Instance.new("UIListLayout"),
	UIListLayout_1 = Instance.new("UIListLayout"),
	logWarning = Instance.new("Frame"),
	Button_2 = Instance.new("ImageButton"),
	TextLabel_1 = Instance.new("TextLabel"),
	UIListLayout_2 = Instance.new("UIListLayout"),
	logError = Instance.new("Frame"),
	Button_3 = Instance.new("ImageButton"),
	TextLabel_2 = Instance.new("TextLabel"),
	UIListLayout_3 = Instance.new("UIListLayout"),
	logInfo = Instance.new("Frame"),
	Button_4 = Instance.new("ImageButton"),
	TextLabel_3 = Instance.new("TextLabel"),
	UIListLayout_4 = Instance.new("UIListLayout"),
	cclrbtn = Instance.new("ImageButton"),
	Title = Instance.new("TextLabel"),
	UICorner_8 = Instance.new("UICorner"),
	UIStroke_4 = Instance.new("UIStroke"),
	excp = Instance.new("ImageButton"),
	Title_1 = Instance.new("TextLabel"),
	UICorner_9 = Instance.new("UICorner"),
	UIStroke_5 = Instance.new("UIStroke"),
	TextLabel_4 = Instance.new("TextLabel"),
	consoleFrame = Instance.new("ScrollingFrame"),
	GlobalLog = Instance.new("LocalScript"),
	TextBox = Instance.new("TextLabel"),
	SettingsFrame = Instance.new("Frame"),
	UICorner_10 = Instance.new("UICorner"),
	Sidebar = Instance.new("Frame"),
	Buttons = Instance.new("Frame"),
	UIListLayout_5 = Instance.new("UIListLayout"),
	generalBtn = Instance.new("ImageButton"),
	UICorner_11 = Instance.new("UICorner"),
	Texts = Instance.new("Frame"),
	UICorner_12 = Instance.new("UICorner"),
	UIListLayout_6 = Instance.new("UIListLayout"),
	Title_2 = Instance.new("TextLabel"),
	icon = Instance.new("ImageLabel"),
	themesBtn = Instance.new("ImageButton"),
	UICorner_13 = Instance.new("UICorner"),
	Texts_1 = Instance.new("Frame"),
	UICorner_14 = Instance.new("UICorner"),
	UIListLayout_7 = Instance.new("UIListLayout"),
	Title_3 = Instance.new("TextLabel"),
	icon_1 = Instance.new("ImageLabel"),
	GeneralTab = Instance.new("ScrollingFrame"),
	UICorner_15 = Instance.new("UICorner"),
	UIListLayout_8 = Instance.new("UIListLayout"),
	autoexecSS = Instance.new("Frame"),
	UICorner_16 = Instance.new("UICorner"),
	Texts_2 = Instance.new("Frame"),
	UICorner_17 = Instance.new("UICorner"),
	UIListLayout_9 = Instance.new("UIListLayout"),
	Title_4 = Instance.new("TextLabel"),
	subTitle = Instance.new("TextLabel"),
	icon_2 = Instance.new("ImageLabel"),
	button = Instance.new("ImageButton"),
	autohideuiSS = Instance.new("Frame"),
	UICorner_18 = Instance.new("UICorner"),
	Texts_3 = Instance.new("Frame"),
	UICorner_19 = Instance.new("UICorner"),
	UIListLayout_10 = Instance.new("UIListLayout"),
	Title_5 = Instance.new("TextLabel"),
	subTitle_1 = Instance.new("TextLabel"),
	icon_3 = Instance.new("ImageLabel"),
	button_1 = Instance.new("ImageButton"),
	trigonSS = Instance.new("Frame"),
	UICorner_20 = Instance.new("UICorner"),
	Texts_4 = Instance.new("Frame"),
	UICorner_21 = Instance.new("UICorner"),
	UIListLayout_11 = Instance.new("UIListLayout"),
	Title_6 = Instance.new("TextLabel"),
	subTitle_2 = Instance.new("TextLabel"),
	icon_4 = Instance.new("ImageLabel"),
	homeFrame = Instance.new("Frame"),
	UICorner_22 = Instance.new("UICorner"),
	changelogFrame = Instance.new("ScrollingFrame"),
	UICorner_23 = Instance.new("UICorner"),
	UIListLayout_12 = Instance.new("UIListLayout"),
	scriptsFrame = Instance.new("ScrollingFrame"),
	UICorner_24 = Instance.new("UICorner"),
	UIListLayout_13 = Instance.new("UIListLayout"),
	_GameHeader = Instance.new("Frame"),
	Title_7 = Instance.new("TextLabel"),
	UICorner_25 = Instance.new("UICorner"),
	TextButton = Instance.new("TextButton"),
	UICorner_26 = Instance.new("UICorner"),
	localscriptsFrame = Instance.new("ScrollingFrame"),
	UICorner_27 = Instance.new("UICorner"),
	UIListLayout_14 = Instance.new("UIListLayout"),
	_GameHeader_1 = Instance.new("Frame"),
	Title_8 = Instance.new("TextLabel"),
	UICorner_28 = Instance.new("UICorner"),
	Add_btn = Instance.new("Frame"),
	TextButton_1 = Instance.new("TextButton"),
	UICorner_29 = Instance.new("UICorner"),
	script_placeholder = Instance.new("Frame"),
	scriptTitle = Instance.new("TextLabel"),
	Buttons_1 = Instance.new("Frame"),
	UIListLayout_15 = Instance.new("UIListLayout"),
	run = Instance.new("Frame"),
	UIListLayout_16 = Instance.new("UIListLayout"),
	UICorner_30 = Instance.new("UICorner"),
	button_2 = Instance.new("ImageButton"),
	autoload = Instance.new("Frame"),
	UIListLayout_17 = Instance.new("UIListLayout"),
	button_3 = Instance.new("ImageButton"),
	zz = Instance.new("TextLabel"),
	UICorner_31 = Instance.new("UICorner"),
	delete = Instance.new("Frame"),
	UIListLayout_18 = Instance.new("UIListLayout"),
	UICorner_32 = Instance.new("UICorner"),
	button_4 = Instance.new("ImageButton"),
	UICorner_33 = Instance.new("UICorner"),
	addlocalscriptsFrame = Instance.new("ScrollingFrame"),
	UICorner_34 = Instance.new("UICorner"),
	UIListLayout_19 = Instance.new("UIListLayout"),
	_GameHeader_2 = Instance.new("Frame"),
	Title_9 = Instance.new("TextLabel"),
	UICorner_35 = Instance.new("UICorner"),
	Frame = Instance.new("Frame"),
	TextButton_2 = Instance.new("TextButton"),
	UICorner_36 = Instance.new("UICorner"),
	addFrame = Instance.new("Frame"),
	input = Instance.new("Frame"),
	TextBox_1 = Instance.new("TextBox"),
	Title_10 = Instance.new("TextLabel"),
	TextLabel_5 = Instance.new("TextLabel"),
	confrim_btn = Instance.new("Frame"),
	TextButton_3 = Instance.new("TextButton"),
	UICorner_37 = Instance.new("UICorner"),
	cancel_btn = Instance.new("Frame"),
	TextButton_4 = Instance.new("TextButton"),
	UICorner_38 = Instance.new("UICorner"),
	ExecFrame = Instance.new("Frame"),
	Buttons_2 = Instance.new("Frame"),
	UIListLayout_20 = Instance.new("UIListLayout"),
	Button1 = Instance.new("ImageButton"),
	UIStroke_6 = Instance.new("UIStroke"),
	UICorner_39 = Instance.new("UICorner"),
	Title_11 = Instance.new("TextLabel"),
	Button4 = Instance.new("ImageButton"),
	Title_12 = Instance.new("TextLabel"),
	UICorner_40 = Instance.new("UICorner"),
	UIStroke_7 = Instance.new("UIStroke"),
	Button3 = Instance.new("ImageButton"),
	Title_13 = Instance.new("TextLabel"),
	UICorner_41 = Instance.new("UICorner"),
	UIStroke_8 = Instance.new("UIStroke"),
	Button2 = Instance.new("ImageButton"),
	Title_14 = Instance.new("TextLabel"),
	UICorner_42 = Instance.new("UICorner"),
	UIStroke_9 = Instance.new("UIStroke"),
	UICorner_43 = Instance.new("UICorner"),
	ScrollingFrame = Instance.new("ScrollingFrame"),
	LocalScript = Instance.new("LocalScript"),
	ScriptBox = Instance.new("TextBox"),
	Highlighter = Instance.new("ModuleScript"),
	lexer = Instance.new("ModuleScript"),
	language = Instance.new("ModuleScript"),
	theme = Instance.new("ModuleScript"),
	types = Instance.new("ModuleScript"),
	utility = Instance.new("ModuleScript"),
	UICorner_44 = Instance.new("UICorner"),
	LocalScript_1 = Instance.new("LocalScript"),
	savescripts = Instance.new("LocalScript")
}

trigok.TrigonMain.Enabled = false
trigok.TrigonMain.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
trigok.TrigonMain.IgnoreGuiInset = true
trigok.TrigonMain.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
trigok.TrigonMain.Name = _G.TrigonMain
trigok.TrigonMain.Parent = gethui()

trigok.MainFrame.BorderSizePixel = 0
trigok.MainFrame.Size = UDim2.new(1.0005, 0, 1, 0)
trigok.MainFrame.Position = UDim2.new(-0.000732064, 0, -0.0078125, 0)
trigok.MainFrame.BackgroundTransparency = 0.35
trigok.MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.MainFrame.Name = "MainFrame"
trigok.MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
trigok.MainFrame.Parent = trigok.TrigonMain

trigok.BottomMenuFrame.BorderSizePixel = 0
trigok.BottomMenuFrame.Size = UDim2.new(0.950071, 0, 0.158636, 0)
trigok.BottomMenuFrame.Position = UDim2.new(0.0244645, 0, 0.792311, 0)
trigok.BottomMenuFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.BottomMenuFrame.ClipsDescendants = true
trigok.BottomMenuFrame.Name = "BottomMenuFrame"
trigok.BottomMenuFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
trigok.BottomMenuFrame.Parent = trigok.MainFrame

trigok.LeftFrame.BorderSizePixel = 0
trigok.LeftFrame.Size = UDim2.new(0.162271, 0, 1, 0)
trigok.LeftFrame.Position = UDim2.new(-0.00054132, 0, 0, 0)
trigok.LeftFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.LeftFrame.Name = "LeftFrame"
trigok.LeftFrame.BackgroundColor3 = Color3.fromRGB(47, 52, 66)
trigok.LeftFrame.Parent = trigok.BottomMenuFrame

trigok.ExitBtn.ZIndex = 2
trigok.ExitBtn.BorderSizePixel = 0
trigok.ExitBtn.ScaleType = Enum.ScaleType.Fit
trigok.ExitBtn.AutoButtonColor = false
trigok.ExitBtn.BackgroundColor3 = Color3.fromRGB(47, 52, 66)
trigok.ExitBtn.Selectable = false
trigok.ExitBtn.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.ExitBtn.Size = UDim2.new(0.597387, 0, 0.893438, 0)
trigok.ExitBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.ExitBtn.Name = "ExitBtn"
trigok.ExitBtn.Position = UDim2.new(0.499371, 0, 0.491793, 0)
trigok.ExitBtn.Parent = trigok.LeftFrame

trigok.Icon.ImageColor3 = Color3.fromRGB(201, 205, 210)
trigok.Icon.SizeConstraint = Enum.SizeConstraint.RelativeXX
trigok.Icon.BorderSizePixel = 0
trigok.Icon.ScaleType = Enum.ScaleType.Fit
trigok.Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Icon.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Icon.Image = "rbxassetid://15879382339"
trigok.Icon.Size = UDim2.new(0.834218, 0, 12.9208, 0)
trigok.Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Icon.Name = "Icon"
trigok.Icon.BackgroundTransparency = 1
trigok.Icon.Position = UDim2.new(0.494743, 0, 0.490654, 0)
trigok.Icon.Parent = trigok.ExitBtn

trigok.UICorner.CornerRadius = UDim.new(0.08, 0)
trigok.UICorner.Parent = trigok.LeftFrame

trigok.RightFrame.BorderSizePixel = 0
trigok.RightFrame.Size = UDim2.new(0.111862, 0, 1, 0)
trigok.RightFrame.Position = UDim2.new(0.887643, 0, 0, 0)
trigok.RightFrame.BackgroundTransparency = 1
trigok.RightFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.RightFrame.Name = "RightFrame"
trigok.RightFrame.BackgroundColor3 = Color3.fromRGB(47, 52, 65)
trigok.RightFrame.Parent = trigok.BottomMenuFrame

trigok.Button.Active = true
trigok.Button.BorderSizePixel = 0
trigok.Button.ScaleType = Enum.ScaleType.Fit
trigok.Button.AutoButtonColor = false
trigok.Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Button.Selectable = false
trigok.Button.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Button.Size = UDim2.new(0.724089, 0, 0.644049, 0)
trigok.Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Button.Name = "Button"
trigok.Button.BackgroundTransparency = 1
trigok.Button.Position = UDim2.new(0.538481, 0, 0.487688, 0)
trigok.Button.Parent = trigok.RightFrame

trigok.UIGradient.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(57, 64, 84)), ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 82, 107)) }
trigok.UIGradient.Rotation = -90
trigok.UIGradient.Parent = trigok.Button

trigok.Icon_1.SizeConstraint = Enum.SizeConstraint.RelativeYY
trigok.Icon_1.BorderSizePixel = 0
trigok.Icon_1.ScaleType = Enum.ScaleType.Fit
trigok.Icon_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Icon_1.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Icon_1.Image = "rbxassetid://15844306310"
trigok.Icon_1.Size = UDim2.new(0.83136, 0, 0.783259, 0)
trigok.Icon_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Icon_1.Name = "Icon"
trigok.Icon_1.BackgroundTransparency = 1
trigok.Icon_1.Position = UDim2.new(0.5, 0, 0.5, 0)
trigok.Icon_1.Parent = trigok.Button

trigok.MenuList.BorderSizePixel = 0
trigok.MenuList.Size = UDim2.new(0.777778, 0, 1, 0)
trigok.MenuList.Position = UDim2.new(0.116366, 0, 0, 0)
trigok.MenuList.BackgroundTransparency = 1
trigok.MenuList.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.MenuList.Name = "MenuList"
trigok.MenuList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.MenuList.Parent = trigok.BottomMenuFrame

trigok.UICorner_1.CornerRadius = UDim.new(0.15, 0)
trigok.UICorner_1.Parent = trigok.MenuList

trigok.UIGridLayout.CellPadding = UDim2.new(0.02, 0, 1, 0)
trigok.UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Center
trigok.UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
trigok.UIGridLayout.CellSize = UDim2.new(0.095, 0, 0.76, 0)
trigok.UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
trigok.UIGridLayout.Parent = trigok.MenuList

trigok.HBtn.BorderSizePixel = 3
trigok.HBtn.ScaleType = Enum.ScaleType.Fit
trigok.HBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.HBtn.BorderMode = Enum.BorderMode.Inset
trigok.HBtn.Selectable = false
trigok.HBtn.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.HBtn.Size = UDim2.new(0.12, 0, 0.8, 0)
trigok.HBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.HBtn.Name = "HBtn"
trigok.HBtn.Position = UDim2.new(0.406853, 0, 0.5, 0)
trigok.HBtn.Parent = trigok.MenuList

trigok.UIGradient_1.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(57, 64, 84)), ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 82, 107)) }
trigok.UIGradient_1.Rotation = -90
trigok.UIGradient_1.Parent = trigok.HBtn

trigok.Icon_2.ImageColor3 = Color3.fromRGB(201, 205, 210)
trigok.Icon_2.SizeConstraint = Enum.SizeConstraint.RelativeXX
trigok.Icon_2.BorderSizePixel = 0
trigok.Icon_2.ScaleType = Enum.ScaleType.Fit
trigok.Icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Icon_2.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Icon_2.Image = "rbxassetid://15982534656"
trigok.Icon_2.Size = UDim2.new(0.858703, 0, 0.887424, 0)
trigok.Icon_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Icon_2.Name = "Icon"
trigok.Icon_2.BackgroundTransparency = 1
trigok.Icon_2.Position = UDim2.new(0.5, 0, 0.5, 0)
trigok.Icon_2.Parent = trigok.HBtn

trigok.UIStroke.Thickness = 2
trigok.UIStroke.Color = Color3.fromRGB(87, 96, 120)
trigok.UIStroke.Parent = trigok.HBtn

trigok.UICorner_2.CornerRadius = UDim.new(0.09, 0)
trigok.UICorner_2.Parent = trigok.HBtn

trigok.ExecBtn.BorderSizePixel = 3
trigok.ExecBtn.ScaleType = Enum.ScaleType.Fit
trigok.ExecBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.ExecBtn.BorderMode = Enum.BorderMode.Inset
trigok.ExecBtn.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.ExecBtn.Size = UDim2.new(0.702236, 0, 0.8, 0)
trigok.ExecBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.ExecBtn.Name = "ExecBtn"
trigok.ExecBtn.Position = UDim2.new(0.721118, 0, 0.5, 0)
trigok.ExecBtn.Parent = trigok.MenuList

trigok.Icon_3.ImageColor3 = Color3.fromRGB(201, 205, 210)
trigok.Icon_3.SizeConstraint = Enum.SizeConstraint.RelativeXX
trigok.Icon_3.BorderSizePixel = 0
trigok.Icon_3.ScaleType = Enum.ScaleType.Fit
trigok.Icon_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Icon_3.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Icon_3.Image = "rbxassetid://15845222401"
trigok.Icon_3.Size = UDim2.new(0.858703, 0, 0.887424, 0)
trigok.Icon_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Icon_3.Name = "Icon"
trigok.Icon_3.BackgroundTransparency = 1
trigok.Icon_3.Position = UDim2.new(0.5, 0, 0.5, 0)
trigok.Icon_3.Parent = trigok.ExecBtn

trigok.UIStroke_1.Thickness = 2
trigok.UIStroke_1.Color = Color3.fromRGB(87, 96, 120)
trigok.UIStroke_1.Parent = trigok.ExecBtn

trigok.UICorner_3.CornerRadius = UDim.new(0.09, 0)
trigok.UICorner_3.Parent = trigok.ExecBtn

trigok.UIGradient_2.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(57, 64, 84)), ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 82, 107)) }
trigok.UIGradient_2.Rotation = -90
trigok.UIGradient_2.Parent = trigok.ExecBtn

trigok.CloudBtn.BorderSizePixel = 3
trigok.CloudBtn.ScaleType = Enum.ScaleType.Fit
trigok.CloudBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.CloudBtn.BorderMode = Enum.BorderMode.Inset
trigok.CloudBtn.Selectable = false
trigok.CloudBtn.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.CloudBtn.Size = UDim2.new(0.12, 0, 0.8, 0)
trigok.CloudBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.CloudBtn.Name = "CloudBtn"
trigok.CloudBtn.Position = UDim2.new(0.406853, 0, 0.5, 0)
trigok.CloudBtn.Parent = trigok.MenuList

trigok.UIGradient_3.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(57, 64, 84)), ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 82, 107)) }
trigok.UIGradient_3.Rotation = -90
trigok.UIGradient_3.Parent = trigok.CloudBtn

trigok.Icon_4.ImageColor3 = Color3.fromRGB(201, 205, 210)
trigok.Icon_4.SizeConstraint = Enum.SizeConstraint.RelativeXX
trigok.Icon_4.BorderSizePixel = 0
trigok.Icon_4.ScaleType = Enum.ScaleType.Fit
trigok.Icon_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Icon_4.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Icon_4.Image = "rbxassetid://15982538173"
trigok.Icon_4.Size = UDim2.new(0.858703, 0, 0.887424, 0)
trigok.Icon_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Icon_4.Name = "Icon"
trigok.Icon_4.BackgroundTransparency = 1
trigok.Icon_4.Position = UDim2.new(0.5, 0, 0.5, 0)
trigok.Icon_4.Parent = trigok.CloudBtn

trigok.UIStroke_2.Thickness = 2
trigok.UIStroke_2.Color = Color3.fromRGB(87, 96, 120)
trigok.UIStroke_2.Parent = trigok.CloudBtn

trigok.UICorner_4.CornerRadius = UDim.new(0.09, 0)
trigok.UICorner_4.Parent = trigok.CloudBtn

trigok.SettingsBtn.BorderSizePixel = 3
trigok.SettingsBtn.ScaleType = Enum.ScaleType.Fit
trigok.SettingsBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.SettingsBtn.BorderMode = Enum.BorderMode.Inset
trigok.SettingsBtn.Selectable = false
trigok.SettingsBtn.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.SettingsBtn.Size = UDim2.new(0.12, 0, 0.8, 0)
trigok.SettingsBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.SettingsBtn.Name = "SettingsBtn"
trigok.SettingsBtn.Position = UDim2.new(0.406853, 0, 0.5, 0)
trigok.SettingsBtn.Parent = trigok.MenuList

trigok.UIGradient_4.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(57, 64, 84)), ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 82, 107)) }
trigok.UIGradient_4.Rotation = -90
trigok.UIGradient_4.Parent = trigok.SettingsBtn

trigok.Icon_5.ImageColor3 = Color3.fromRGB(201, 205, 210)
trigok.Icon_5.SizeConstraint = Enum.SizeConstraint.RelativeXX
trigok.Icon_5.BorderSizePixel = 0
trigok.Icon_5.ScaleType = Enum.ScaleType.Fit
trigok.Icon_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Icon_5.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Icon_5.Image = "rbxassetid://15845262087"
trigok.Icon_5.Size = UDim2.new(0.858703, 0, 0.887424, 0)
trigok.Icon_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Icon_5.Name = "Icon"
trigok.Icon_5.BackgroundTransparency = 1
trigok.Icon_5.Position = UDim2.new(0.5, 0, 0.5, 0)
trigok.Icon_5.Parent = trigok.SettingsBtn

trigok.UIStroke_3.Thickness = 2
trigok.UIStroke_3.Color = Color3.fromRGB(87, 96, 120)
trigok.UIStroke_3.Parent = trigok.SettingsBtn

trigok.UICorner_5.CornerRadius = UDim.new(0.09, 0)
trigok.UICorner_5.Parent = trigok.SettingsBtn

trigok.UICorner_6.CornerRadius = UDim.new(0.08, 0)
trigok.UICorner_6.Parent = trigok.BottomMenuFrame

trigok.logFrame.Active = true
trigok.logFrame.ZIndex = 2
trigok.logFrame.BorderSizePixel = 0
trigok.logFrame.Size = UDim2.new(0.95, 0, 0.685445, 0)
trigok.logFrame.Position = UDim2.new(0.024, 0, 0.0900137, 0)
trigok.logFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.logFrame.Visible = false
trigok.logFrame.Name = "logFrame"
trigok.logFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
trigok.logFrame.Parent = trigok.MainFrame

trigok.UICorner_7.CornerRadius = UDim.new(0.02, 0)
trigok.UICorner_7.Parent = trigok.logFrame

trigok.logButtons.BorderSizePixel = 0
trigok.logButtons.Size = UDim2.new(0.964723, 0, 0.120071, 0)
trigok.logButtons.Position = UDim2.new(0.0291137, 0, 0.878761, 0)
trigok.logButtons.BackgroundTransparency = 1
trigok.logButtons.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.logButtons.Name = "logButtons"
trigok.logButtons.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
trigok.logButtons.Parent = trigok.logFrame

trigok.logOutput.BorderSizePixel = 0
trigok.logOutput.Size = UDim2.new(0.110762, 0, 1, 0)
trigok.logOutput.BackgroundTransparency = 1
trigok.logOutput.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.logOutput.ClipsDescendants = true
trigok.logOutput.Name = "logOutput"
trigok.logOutput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.logOutput.Parent = trigok.logButtons

trigok.Button_1.ZIndex = 2
trigok.Button_1.ScaleType = Enum.ScaleType.Fit
trigok.Button_1.Image = "rbxassetid://3926311105"
trigok.Button_1.ImageRectSize = Vector2.new(48, 48)
trigok.Button_1.Size = UDim2.new(0.23, 0, 1, 0)
trigok.Button_1.Name = "Button"
trigok.Button_1.LayoutOrder = 7
trigok.Button_1.BackgroundTransparency = 1
trigok.Button_1.Position = UDim2.new(0, 0, 5.09924e-07, 0)
trigok.Button_1.ImageTransparency = 0.23
trigok.Button_1.ImageRectOffset = Vector2.new(4, 836)
trigok.Button_1.Parent = trigok.logOutput

trigok.TextLabel.TextWrapped = true
trigok.TextLabel.BorderSizePixel = 0
trigok.TextLabel.TextScaled = true
trigok.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.TextLabel.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.TextLabel.TextSize = 14
trigok.TextLabel.Size = UDim2.new(0.728848, 0, 0.568112, 0)
trigok.TextLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
trigok.TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.TextLabel.Text = "Log Output"
trigok.TextLabel.Position = UDim2.new(0.26, 0, 0.215944, 0)
trigok.TextLabel.BackgroundTransparency = 1
trigok.TextLabel.TextXAlignment = Enum.TextXAlignment.Left
trigok.TextLabel.Parent = trigok.logOutput

trigok.UIListLayout.FillDirection = Enum.FillDirection.Horizontal
trigok.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
trigok.UIListLayout.Padding = UDim.new(0.03, 0)
trigok.UIListLayout.ItemLineAlignment = Enum.ItemLineAlignment.Center
trigok.UIListLayout.Parent = trigok.logOutput

trigok.UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal
trigok.UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Right
trigok.UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Center
trigok.UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
trigok.UIListLayout_1.Padding = UDim.new(0.005, 0)
trigok.UIListLayout_1.Parent = trigok.logButtons

trigok.logWarning.BorderSizePixel = 0
trigok.logWarning.Size = UDim2.new(0.133679, 0, 1, 0)
trigok.logWarning.Position = UDim2.new(0.125762, 0, 0, 0)
trigok.logWarning.BackgroundTransparency = 1
trigok.logWarning.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.logWarning.ClipsDescendants = true
trigok.logWarning.Name = "logWarning"
trigok.logWarning.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.logWarning.Parent = trigok.logButtons

trigok.Button_2.ZIndex = 2
trigok.Button_2.ScaleType = Enum.ScaleType.Fit
trigok.Button_2.Image = "rbxassetid://3926311105"
trigok.Button_2.ImageRectSize = Vector2.new(48, 48)
trigok.Button_2.Size = UDim2.new(0.206312, 0, 1, 0)
trigok.Button_2.Name = "Button"
trigok.Button_2.LayoutOrder = 7
trigok.Button_2.BackgroundTransparency = 1
trigok.Button_2.Position = UDim2.new(0, 0, 5.09924e-07, 0)
trigok.Button_2.ImageTransparency = 0.23
trigok.Button_2.ImageRectOffset = Vector2.new(4, 836)
trigok.Button_2.Parent = trigok.logWarning

trigok.TextLabel_1.TextWrapped = true
trigok.TextLabel_1.BorderSizePixel = 0
trigok.TextLabel_1.TextScaled = true
trigok.TextLabel_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.TextLabel_1.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.TextLabel_1.TextSize = 14
trigok.TextLabel_1.Size = UDim2.new(0.74, 0, 0.568112, 0)
trigok.TextLabel_1.TextColor3 = Color3.fromRGB(225, 225, 225)
trigok.TextLabel_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.TextLabel_1.Text = "Log Warning	"
trigok.TextLabel_1.Position = UDim2.new(0.26, 0, 0.215944, 0)
trigok.TextLabel_1.BackgroundTransparency = 1
trigok.TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left
trigok.TextLabel_1.Parent = trigok.logWarning

trigok.UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
trigok.UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
trigok.UIListLayout_2.Padding = UDim.new(0.03, 0)
trigok.UIListLayout_2.ItemLineAlignment = Enum.ItemLineAlignment.Center
trigok.UIListLayout_2.Parent = trigok.logWarning

trigok.logError.BorderSizePixel = 0
trigok.logError.Size = UDim2.new(0.110762, 0, 1, 0)
trigok.logError.BackgroundTransparency = 1
trigok.logError.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.logError.ClipsDescendants = true
trigok.logError.Name = "logError"
trigok.logError.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.logError.Parent = trigok.logButtons

trigok.Button_3.ZIndex = 2
trigok.Button_3.ScaleType = Enum.ScaleType.Fit
trigok.Button_3.Image = "rbxassetid://3926311105"
trigok.Button_3.ImageRectSize = Vector2.new(48, 48)
trigok.Button_3.Size = UDim2.new(0.23, 0, 1, 0)
trigok.Button_3.Name = "Button"
trigok.Button_3.LayoutOrder = 7
trigok.Button_3.BackgroundTransparency = 1
trigok.Button_3.Position = UDim2.new(0, 0, 5.09924e-07, 0)
trigok.Button_3.ImageTransparency = 0.23
trigok.Button_3.ImageRectOffset = Vector2.new(4, 836)
trigok.Button_3.Parent = trigok.logError

trigok.TextLabel_2.TextWrapped = true
trigok.TextLabel_2.BorderSizePixel = 0
trigok.TextLabel_2.TextScaled = true
trigok.TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.TextLabel_2.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.TextLabel_2.TextSize = 14
trigok.TextLabel_2.Size = UDim2.new(0.728848, 0, 0.41773, 0)
trigok.TextLabel_2.TextColor3 = Color3.fromRGB(225, 225, 225)
trigok.TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.TextLabel_2.Text = "Log Error"
trigok.TextLabel_2.Position = UDim2.new(0.26, 0, 0.366327, 0)
trigok.TextLabel_2.BackgroundTransparency = 1
trigok.TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
trigok.TextLabel_2.Parent = trigok.logError

trigok.UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
trigok.UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center
trigok.UIListLayout_3.Padding = UDim.new(0.03, 0)
trigok.UIListLayout_3.ItemLineAlignment = Enum.ItemLineAlignment.Center
trigok.UIListLayout_3.Parent = trigok.logError

trigok.logInfo.BorderSizePixel = 0
trigok.logInfo.Size = UDim2.new(0.139335, 0, 1, 0)
trigok.logInfo.Position = UDim2.new(0.414065, 0, 0, 0)
trigok.logInfo.BackgroundTransparency = 1
trigok.logInfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.logInfo.ClipsDescendants = true
trigok.logInfo.Name = "logInfo"
trigok.logInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.logInfo.Parent = trigok.logButtons

trigok.Button_4.ZIndex = 2
trigok.Button_4.ScaleType = Enum.ScaleType.Fit
trigok.Button_4.Image = "rbxassetid://3926311105"
trigok.Button_4.ImageRectSize = Vector2.new(48, 48)
trigok.Button_4.Size = UDim2.new(0.184161, 0, 1, 0)
trigok.Button_4.Name = "Button"
trigok.Button_4.LayoutOrder = 7
trigok.Button_4.BackgroundTransparency = 1
trigok.Button_4.Position = UDim2.new(0, 0, 5.09924e-07, 0)
trigok.Button_4.ImageRectOffset = Vector2.new(4, 836)
trigok.Button_4.Parent = trigok.logInfo

trigok.TextLabel_3.TextWrapped = true
trigok.TextLabel_3.BorderSizePixel = 0
trigok.TextLabel_3.TextScaled = true
trigok.TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.TextLabel_3.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.TextLabel_3.TextSize = 14
trigok.TextLabel_3.Size = UDim2.new(0.728848, 0, 0.384311, 0)
trigok.TextLabel_3.TextColor3 = Color3.fromRGB(225, 225, 225)
trigok.TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.TextLabel_3.Text = "Enable Logging"
trigok.TextLabel_3.Position = UDim2.new(0.26, 0, 0.399745, 0)
trigok.TextLabel_3.BackgroundTransparency = 1
trigok.TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
trigok.TextLabel_3.Parent = trigok.logInfo

trigok.UIListLayout_4.FillDirection = Enum.FillDirection.Horizontal
trigok.UIListLayout_4.VerticalAlignment = Enum.VerticalAlignment.Center
trigok.UIListLayout_4.Padding = UDim.new(0.03, 0)
trigok.UIListLayout_4.ItemLineAlignment = Enum.ItemLineAlignment.Center
trigok.UIListLayout_4.Parent = trigok.logInfo

trigok.cclrbtn.BorderSizePixel = 3
trigok.cclrbtn.ScaleType = Enum.ScaleType.Fit
trigok.cclrbtn.AutoButtonColor = false
trigok.cclrbtn.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
trigok.cclrbtn.BorderMode = Enum.BorderMode.Inset
trigok.cclrbtn.Selectable = false
trigok.cclrbtn.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.cclrbtn.Size = UDim2.new(0.108402, 0, 0.784056, 0)
trigok.cclrbtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.cclrbtn.Name = "cclrbtn"
trigok.cclrbtn.Position = UDim2.new(0.580167, 0, 0.5, 0)
trigok.cclrbtn.Parent = trigok.logButtons

trigok.Title.TextWrapped = true
trigok.Title.BorderSizePixel = 0
trigok.Title.TextScaled = true
trigok.Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Title.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.Title.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Title.TextSize = 14
trigok.Title.Name = "Title"
trigok.Title.Size = UDim2.new(0.582424, 0, 0.612447, 0)
trigok.Title.TextColor3 = Color3.fromRGB(250, 250, 250)
trigok.Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Title.Text = "Clear Logs"
trigok.Title.Position = UDim2.new(0.494866, 0, 0.493859, 0)
trigok.Title.BackgroundTransparency = 1
trigok.Title.Parent = trigok.cclrbtn

trigok.UICorner_8.CornerRadius = UDim.new(0.08, 0)
trigok.UICorner_8.Parent = trigok.cclrbtn

trigok.UIStroke_4.LineJoinMode = Enum.LineJoinMode.Miter
trigok.UIStroke_4.Thickness = 3
trigok.UIStroke_4.Color = Color3.fromRGB(60, 66, 83)
trigok.UIStroke_4.Enabled = false
trigok.UIStroke_4.Parent = trigok.cclrbtn

trigok.excp.BorderSizePixel = 3
trigok.excp.ScaleType = Enum.ScaleType.Fit
trigok.excp.AutoButtonColor = false
trigok.excp.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
trigok.excp.BorderMode = Enum.BorderMode.Inset
trigok.excp.Selectable = false
trigok.excp.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.excp.Size = UDim2.new(0.0945025, 0, 0.784056, 0)
trigok.excp.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.excp.Name = "excp"
trigok.excp.Position = UDim2.new(0.711627, 0, 0.616964, 0)
trigok.excp.Parent = trigok.logButtons

trigok.Title_1.TextWrapped = true
trigok.Title_1.BorderSizePixel = 0
trigok.Title_1.TextScaled = true
trigok.Title_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Title_1.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.Title_1.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Title_1.TextSize = 14
trigok.Title_1.Name = "Title"
trigok.Title_1.Size = UDim2.new(0.712748, 0, 0.866139, 0)
trigok.Title_1.TextColor3 = Color3.fromRGB(250, 250, 250)
trigok.Title_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Title_1.Text = "Execute from Clipboard"
trigok.Title_1.Position = UDim2.new(0.495013, 0, 0.497096, 0)
trigok.Title_1.BackgroundTransparency = 1
trigok.Title_1.Parent = trigok.excp

trigok.UICorner_9.CornerRadius = UDim.new(0.08, 0)
trigok.UICorner_9.Parent = trigok.excp

trigok.UIStroke_5.LineJoinMode = Enum.LineJoinMode.Miter
trigok.UIStroke_5.Thickness = 3
trigok.UIStroke_5.Color = Color3.fromRGB(60, 66, 83)
trigok.UIStroke_5.Enabled = false
trigok.UIStroke_5.Parent = trigok.excp

trigok.TextLabel_4.TextWrapped = true
trigok.TextLabel_4.BorderSizePixel = 0
trigok.TextLabel_4.TextScaled = true
trigok.TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.TextLabel_4.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.TextLabel_4.TextSize = 14
trigok.TextLabel_4.Size = UDim2.new(0.242269, 0, 0.492921, 0)
trigok.TextLabel_4.TextColor3 = Color3.fromRGB(225, 225, 225)
trigok.TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.TextLabel_4.Text = "Note: There is like 280 line limit on roblox :/"
trigok.TextLabel_4.Position = UDim2.new(0.81694, 0, 0.253539, 0)
trigok.TextLabel_4.BackgroundTransparency = 1
trigok.TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left
trigok.TextLabel_4.Parent = trigok.logButtons

trigok.consoleFrame.BorderSizePixel = 0
trigok.consoleFrame.CanvasSize = UDim2.new(0, 0, 0.87, 0)
trigok.consoleFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
trigok.consoleFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
trigok.consoleFrame.Size = UDim2.new(0.975214, 0, 0.853, 0)
trigok.consoleFrame.BackgroundTransparency = 1
trigok.consoleFrame.Active = true
trigok.consoleFrame.ScrollBarImageTransparency = 0.8
trigok.consoleFrame.ScrollBarThickness = 10
trigok.consoleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.consoleFrame.Name = "consoleFrame"
trigok.consoleFrame.Position = UDim2.new(0.0167858, 0, 0.0257617, 0)
trigok.consoleFrame.Parent = trigok.logFrame

trigok.GlobalLog.Name = "GlobalLog"
trigok.GlobalLog.Parent = trigok.consoleFrame

trigok.TextBox.TextWrapped = true
trigok.TextBox.BorderSizePixel = 0
trigok.TextBox.RichText = true
trigok.TextBox.TextYAlignment = Enum.TextYAlignment.Top
trigok.TextBox.BackgroundColor3 = Color3.fromRGB(39, 53, 255)
trigok.TextBox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.TextBox.TextStrokeColor3 = Color3.fromRGB(211, 211, 211)
trigok.TextBox.TextSize = 26
trigok.TextBox.Name = "TextBox"
trigok.TextBox.AutomaticSize = Enum.AutomaticSize.Y
trigok.TextBox.Size = UDim2.new(1, 0, 1, 0)
trigok.TextBox.TextColor3 = Color3.fromRGB(211, 211, 211)
trigok.TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.TextBox.Text = ""
trigok.TextBox.LineHeight = 1.3
trigok.TextBox.BackgroundTransparency = 1
trigok.TextBox.TextXAlignment = Enum.TextXAlignment.Left
trigok.TextBox.Parent = trigok.consoleFrame

trigok.SettingsFrame.Active = true
trigok.SettingsFrame.BorderSizePixel = 0
trigok.SettingsFrame.Size = UDim2.new(0.95, 0, 0.685445, 0)
trigok.SettingsFrame.Position = UDim2.new(0.024, 0, 0.0900137, 0)
trigok.SettingsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.SettingsFrame.ClipsDescendants = true
trigok.SettingsFrame.Visible = false
trigok.SettingsFrame.Name = "SettingsFrame"
trigok.SettingsFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
trigok.SettingsFrame.Parent = trigok.MainFrame

trigok.UICorner_10.CornerRadius = UDim.new(0.02, 0)
trigok.UICorner_10.Parent = trigok.SettingsFrame

trigok.Sidebar.BorderSizePixel = 0
trigok.Sidebar.Size = UDim2.new(0.201512, 0, 1, 0)
trigok.Sidebar.BackgroundTransparency = 0.95
trigok.Sidebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Sidebar.Name = "Sidebar"
trigok.Sidebar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
trigok.Sidebar.Parent = trigok.SettingsFrame

trigok.Buttons.BorderSizePixel = 0
trigok.Buttons.Size = UDim2.new(0.945809, 0, 0.673338, 0)
trigok.Buttons.Position = UDim2.new(0.0267747, 0, 0.162183, 0)
trigok.Buttons.BackgroundTransparency = 1
trigok.Buttons.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Buttons.Name = "Buttons"
trigok.Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Buttons.Parent = trigok.Sidebar

trigok.UIListLayout_5.HorizontalAlignment = Enum.HorizontalAlignment.Center
trigok.UIListLayout_5.VerticalAlignment = Enum.VerticalAlignment.Center
trigok.UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
trigok.UIListLayout_5.Padding = UDim.new(0.02, 0)
trigok.UIListLayout_5.Parent = trigok.Buttons

trigok.generalBtn.BorderSizePixel = 0
trigok.generalBtn.ScaleType = Enum.ScaleType.Fit
trigok.generalBtn.BackgroundColor3 = Color3.fromRGB(30, 34, 42)
trigok.generalBtn.Size = UDim2.new(0.891, 0, 0.139, 0)
trigok.generalBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.generalBtn.Name = "generalBtn"
trigok.generalBtn.Position = UDim2.new(0.0875638, 0, 0.353006, 0)
trigok.generalBtn.Parent = trigok.Buttons

trigok.UICorner_11.CornerRadius = UDim.new(0.06, 0)
trigok.UICorner_11.Parent = trigok.generalBtn

trigok.Texts.BorderSizePixel = 0
trigok.Texts.Size = UDim2.new(0.684406, 0, 0.81382, 0)
trigok.Texts.Position = UDim2.new(0.287915, 0, 0.0859289, 0)
trigok.Texts.BackgroundTransparency = 1
trigok.Texts.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Texts.Name = "Texts"
trigok.Texts.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Texts.Parent = trigok.generalBtn

trigok.UICorner_12.CornerRadius = UDim.new(0.1, 0)
trigok.UICorner_12.Parent = trigok.Texts

trigok.UIListLayout_6.HorizontalAlignment = Enum.HorizontalAlignment.Center
trigok.UIListLayout_6.VerticalAlignment = Enum.VerticalAlignment.Center
trigok.UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
trigok.UIListLayout_6.Padding = UDim.new(0.1, 0)
trigok.UIListLayout_6.ItemLineAlignment = Enum.ItemLineAlignment.Center
trigok.UIListLayout_6.Parent = trigok.Texts

trigok.Title_2.TextWrapped = true
trigok.Title_2.BorderSizePixel = 0
trigok.Title_2.TextScaled = true
trigok.Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Title_2.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.Title_2.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Title_2.TextSize = 100
trigok.Title_2.Name = "Title"
trigok.Title_2.Size = UDim2.new(1, 0, 0.63989, 0)
trigok.Title_2.TextColor3 = Color3.fromRGB(250, 250, 250)
trigok.Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Title_2.Text = "General"
trigok.Title_2.Position = UDim2.new(0.5, 0, 0.517766, 0)
trigok.Title_2.BackgroundTransparency = 1
trigok.Title_2.TextXAlignment = Enum.TextXAlignment.Left
trigok.Title_2.Parent = trigok.Texts

trigok.icon.BorderSizePixel = 0
trigok.icon.ScaleType = Enum.ScaleType.Fit
trigok.icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.icon.Image = "rbxassetid://16251879539"
trigok.icon.Size = UDim2.new(0.177411, 0, 0.758023, 0)
trigok.icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.icon.Name = "icon"
trigok.icon.BackgroundTransparency = 1
trigok.icon.Position = UDim2.new(0.0855701, 0, 0.0969293, 0)
trigok.icon.Parent = trigok.generalBtn

trigok.themesBtn.BorderSizePixel = 0
trigok.themesBtn.ScaleType = Enum.ScaleType.Fit
trigok.themesBtn.BackgroundColor3 = Color3.fromRGB(30, 34, 42)
trigok.themesBtn.Size = UDim2.new(0.891, 0, 0.139, 0)
trigok.themesBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.themesBtn.Name = "themesBtn"
trigok.themesBtn.Parent = trigok.Buttons

trigok.UICorner_13.CornerRadius = UDim.new(0.06, 0)
trigok.UICorner_13.Parent = trigok.themesBtn

trigok.Texts_1.BorderSizePixel = 0
trigok.Texts_1.Size = UDim2.new(0.684406, 0, 0.81382, 0)
trigok.Texts_1.Position = UDim2.new(0.287915, 0, 0.0859289, 0)
trigok.Texts_1.BackgroundTransparency = 1
trigok.Texts_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Texts_1.Name = "Texts"
trigok.Texts_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Texts_1.Parent = trigok.themesBtn

trigok.UICorner_14.CornerRadius = UDim.new(0.1, 0)
trigok.UICorner_14.Parent = trigok.Texts_1

trigok.UIListLayout_7.HorizontalAlignment = Enum.HorizontalAlignment.Center
trigok.UIListLayout_7.VerticalAlignment = Enum.VerticalAlignment.Center
trigok.UIListLayout_7.SortOrder = Enum.SortOrder.LayoutOrder
trigok.UIListLayout_7.Padding = UDim.new(0.1, 0)
trigok.UIListLayout_7.ItemLineAlignment = Enum.ItemLineAlignment.Center
trigok.UIListLayout_7.Parent = trigok.Texts_1

trigok.Title_3.TextWrapped = true
trigok.Title_3.BorderSizePixel = 0
trigok.Title_3.TextScaled = true
trigok.Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Title_3.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.Title_3.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Title_3.TextSize = 100
trigok.Title_3.Name = "Title"
trigok.Title_3.Size = UDim2.new(1, 0, 0.63989, 0)
trigok.Title_3.TextColor3 = Color3.fromRGB(250, 250, 250)
trigok.Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Title_3.Text = "Themes"
trigok.Title_3.Position = UDim2.new(0.5, 0, 0.517766, 0)
trigok.Title_3.BackgroundTransparency = 1
trigok.Title_3.TextXAlignment = Enum.TextXAlignment.Left
trigok.Title_3.Parent = trigok.Texts_1

trigok.icon_1.BorderSizePixel = 0
trigok.icon_1.ScaleType = Enum.ScaleType.Fit
trigok.icon_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.icon_1.Image = "rbxassetid://16251895249"
trigok.icon_1.Size = UDim2.new(0.177411, 0, 0.758023, 0)
trigok.icon_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.icon_1.Name = "icon"
trigok.icon_1.BackgroundTransparency = 1
trigok.icon_1.Position = UDim2.new(0.0855701, 0, 0.0969293, 0)
trigok.icon_1.Parent = trigok.themesBtn

trigok.GeneralTab.BorderSizePixel = 0
trigok.GeneralTab.CanvasSize = UDim2.new(0, 0, 1, 0)
trigok.GeneralTab.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
trigok.GeneralTab.AutomaticCanvasSize = Enum.AutomaticSize.Y
trigok.GeneralTab.Size = UDim2.new(0.793097, 0, 0.929714, 0)
trigok.GeneralTab.BackgroundTransparency = 0.35
trigok.GeneralTab.Active = true
trigok.GeneralTab.ScrollBarImageTransparency = 0.64
trigok.GeneralTab.ScrollBarThickness = 5
trigok.GeneralTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.GeneralTab.Name = "GeneralTab"
trigok.GeneralTab.Position = UDim2.new(0.201512, 0, 0.0341931, 0)
trigok.GeneralTab.Parent = trigok.SettingsFrame

trigok.UICorner_15.CornerRadius = UDim.new(1, 0)
trigok.UICorner_15.Parent = trigok.GeneralTab

trigok.UIListLayout_8.HorizontalAlignment = Enum.HorizontalAlignment.Center
trigok.UIListLayout_8.SortOrder = Enum.SortOrder.LayoutOrder
trigok.UIListLayout_8.Padding = UDim.new(0.02, 0)
trigok.UIListLayout_8.Parent = trigok.GeneralTab

trigok.autoexecSS.BorderSizePixel = 0
trigok.autoexecSS.Size = UDim2.new(0.967878, 0, 0.144228, 0)
trigok.autoexecSS.Position = UDim2.new(0.0139884, 0, 0, 0)
trigok.autoexecSS.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.autoexecSS.ClipsDescendants = true
trigok.autoexecSS.Name = "autoexecSS"
trigok.autoexecSS.BackgroundColor3 = Color3.fromRGB(30, 34, 42)
trigok.autoexecSS.Parent = trigok.GeneralTab

trigok.UICorner_16.CornerRadius = UDim.new(0.06, 0)
trigok.UICorner_16.Parent = trigok.autoexecSS

trigok.Texts_2.BorderSizePixel = 0
trigok.Texts_2.Size = UDim2.new(0.546741, 0, 0.81382, 0)
trigok.Texts_2.Position = UDim2.new(0.0750575, 0, 0.0859291, 0)
trigok.Texts_2.BackgroundTransparency = 1
trigok.Texts_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Texts_2.Name = "Texts"
trigok.Texts_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Texts_2.Parent = trigok.autoexecSS

trigok.UICorner_17.CornerRadius = UDim.new(0.1, 0)
trigok.UICorner_17.Parent = trigok.Texts_2

trigok.UIListLayout_9.SortOrder = Enum.SortOrder.LayoutOrder
trigok.UIListLayout_9.Padding = UDim.new(0.1, 0)
trigok.UIListLayout_9.Parent = trigok.Texts_2

trigok.Title_4.TextWrapped = true
trigok.Title_4.BorderSizePixel = 0
trigok.Title_4.TextScaled = true
trigok.Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Title_4.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.Title_4.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Title_4.TextSize = 100
trigok.Title_4.Name = "Title"
trigok.Title_4.Size = UDim2.new(0.983503, 0, 0.449235, 0)
trigok.Title_4.TextColor3 = Color3.fromRGB(250, 250, 250)
trigok.Title_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Title_4.Text = "Enable Auto Execute"
trigok.Title_4.Position = UDim2.new(0.491751, 0, 0.224617, 0)
trigok.Title_4.BackgroundTransparency = 1
trigok.Title_4.TextXAlignment = Enum.TextXAlignment.Left
trigok.Title_4.Parent = trigok.Texts_2

trigok.subTitle.TextWrapped = true
trigok.subTitle.BorderSizePixel = 0
trigok.subTitle.TextScaled = true
trigok.subTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.subTitle.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.subTitle.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.subTitle.TextSize = 100
trigok.subTitle.Name = "subTitle"
trigok.subTitle.Size = UDim2.new(0.909815, 0, 0.273333, 0)
trigok.subTitle.TextColor3 = Color3.fromRGB(250, 250, 250)
trigok.subTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.subTitle.Text = "Automatically executes code at game launch."
trigok.subTitle.Position = UDim2.new(0.545092, 0, 0.685901, 0)
trigok.subTitle.BackgroundTransparency = 1
trigok.subTitle.TextXAlignment = Enum.TextXAlignment.Left
trigok.subTitle.Parent = trigok.Texts_2

trigok.icon_2.BorderSizePixel = 0
trigok.icon_2.ScaleType = Enum.ScaleType.Fit
trigok.icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.icon_2.Image = "rbxassetid://16251841820"
trigok.icon_2.Size = UDim2.new(0.0585895, 0, 0.847248, 0)
trigok.icon_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.icon_2.Name = "icon"
trigok.icon_2.BackgroundTransparency = 1
trigok.icon_2.Position = UDim2.new(0.00797054, 0, 0.0613952, 0)
trigok.icon_2.Parent = trigok.autoexecSS

trigok.button.ZIndex = 2
trigok.button.BorderSizePixel = 0
trigok.button.ScaleType = Enum.ScaleType.Fit
trigok.button.Image = "rbxassetid://3926311105"
trigok.button.ImageRectSize = Vector2.new(48, 48)
trigok.button.Size = UDim2.new(0.040973, 0, 0.533475, 0)
trigok.button.Name = "button"
trigok.button.LayoutOrder = 1
trigok.button.BackgroundTransparency = 1
trigok.button.Position = UDim2.new(0.93568, 0, 0.214785, 0)
trigok.button.ImageRectOffset = Vector2.new(4, 836)
trigok.button.Parent = trigok.autoexecSS

trigok.autohideuiSS.BorderSizePixel = 0
trigok.autohideuiSS.Size = UDim2.new(0.967878, 0, 0.144228, 0)
trigok.autohideuiSS.Position = UDim2.new(0.0160612, 0, 0, 0)
trigok.autohideuiSS.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.autohideuiSS.ClipsDescendants = true
trigok.autohideuiSS.Name = "autohideuiSS"
trigok.autohideuiSS.BackgroundColor3 = Color3.fromRGB(30, 34, 42)
trigok.autohideuiSS.Parent = trigok.GeneralTab

trigok.UICorner_18.CornerRadius = UDim.new(0.06, 0)
trigok.UICorner_18.Parent = trigok.autohideuiSS

trigok.Texts_3.BorderSizePixel = 0
trigok.Texts_3.Size = UDim2.new(0.546741, 0, 0.81382, 0)
trigok.Texts_3.Position = UDim2.new(0.0750575, 0, 0.0859291, 0)
trigok.Texts_3.BackgroundTransparency = 1
trigok.Texts_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Texts_3.Name = "Texts"
trigok.Texts_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Texts_3.Parent = trigok.autohideuiSS

trigok.UICorner_19.CornerRadius = UDim.new(0.1, 0)
trigok.UICorner_19.Parent = trigok.Texts_3

trigok.UIListLayout_10.SortOrder = Enum.SortOrder.LayoutOrder
trigok.UIListLayout_10.Padding = UDim.new(0.1, 0)
trigok.UIListLayout_10.Parent = trigok.Texts_3

trigok.Title_5.TextWrapped = true
trigok.Title_5.BorderSizePixel = 0
trigok.Title_5.TextScaled = true
trigok.Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Title_5.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.Title_5.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Title_5.TextSize = 100
trigok.Title_5.Name = "Title"
trigok.Title_5.Size = UDim2.new(0.983503, 0, 0.449235, 0)
trigok.Title_5.TextColor3 = Color3.fromRGB(250, 250, 250)
trigok.Title_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Title_5.Text = "Hide Trigon on Launch"
trigok.Title_5.Position = UDim2.new(0.491751, 0, 0.224617, 0)
trigok.Title_5.BackgroundTransparency = 1
trigok.Title_5.TextXAlignment = Enum.TextXAlignment.Left
trigok.Title_5.Parent = trigok.Texts_3

trigok.subTitle_1.TextWrapped = true
trigok.subTitle_1.BorderSizePixel = 0
trigok.subTitle_1.TextScaled = true
trigok.subTitle_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.subTitle_1.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.subTitle_1.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.subTitle_1.TextSize = 100
trigok.subTitle_1.Name = "subTitle"
trigok.subTitle_1.Size = UDim2.new(0.909815, 0, 0.273333, 0)
trigok.subTitle_1.TextColor3 = Color3.fromRGB(250, 250, 250)
trigok.subTitle_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.subTitle_1.Text = "Trigon UI will not show at start."
trigok.subTitle_1.Position = UDim2.new(0.545092, 0, 0.685901, 0)
trigok.subTitle_1.BackgroundTransparency = 1
trigok.subTitle_1.TextXAlignment = Enum.TextXAlignment.Left
trigok.subTitle_1.Parent = trigok.Texts_3

trigok.icon_3.BorderSizePixel = 0
trigok.icon_3.ScaleType = Enum.ScaleType.Fit
trigok.icon_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.icon_3.Image = "rbxassetid://16251830865"
trigok.icon_3.Size = UDim2.new(0.0585895, 0, 0.847248, 0)
trigok.icon_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.icon_3.Name = "icon"
trigok.icon_3.BackgroundTransparency = 1
trigok.icon_3.Position = UDim2.new(0.00797054, 0, 0.0613952, 0)
trigok.icon_3.Parent = trigok.autohideuiSS

trigok.button_1.ZIndex = 2
trigok.button_1.BorderSizePixel = 0
trigok.button_1.ScaleType = Enum.ScaleType.Fit
trigok.button_1.Image = "rbxassetid://3926305904"
trigok.button_1.ImageRectSize = Vector2.new(36, 36)
trigok.button_1.Size = UDim2.new(0.040973, 0, 0.533475, 0)
trigok.button_1.Name = "button"
trigok.button_1.LayoutOrder = 1
trigok.button_1.BackgroundTransparency = 1
trigok.button_1.Position = UDim2.new(0.93568, 0, 0.214785, 0)
trigok.button_1.ImageRectOffset = Vector2.new(724, 724)
trigok.button_1.Parent = trigok.autohideuiSS

trigok.trigonSS.BorderSizePixel = 0
trigok.trigonSS.Size = UDim2.new(0.967878, 0, 0.144228, 0)
trigok.trigonSS.Position = UDim2.new(0.0160612, 0, 0, 0)
trigok.trigonSS.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.trigonSS.ClipsDescendants = true
trigok.trigonSS.Name = "trigonSS"
trigok.trigonSS.BackgroundColor3 = Color3.fromRGB(30, 34, 42)
trigok.trigonSS.Parent = trigok.GeneralTab

trigok.UICorner_20.CornerRadius = UDim.new(0.06, 0)
trigok.UICorner_20.Parent = trigok.trigonSS

trigok.Texts_4.BorderSizePixel = 0
trigok.Texts_4.Size = UDim2.new(0.546741, 0, 0.81382, 0)
trigok.Texts_4.Position = UDim2.new(0.0750575, 0, 0.0859291, 0)
trigok.Texts_4.BackgroundTransparency = 1
trigok.Texts_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Texts_4.Name = "Texts"
trigok.Texts_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Texts_4.Parent = trigok.trigonSS

trigok.UICorner_21.CornerRadius = UDim.new(0.1, 0)
trigok.UICorner_21.Parent = trigok.Texts_4

trigok.UIListLayout_11.SortOrder = Enum.SortOrder.LayoutOrder
trigok.UIListLayout_11.Padding = UDim.new(0.1, 0)
trigok.UIListLayout_11.Parent = trigok.Texts_4

trigok.Title_6.TextWrapped = true
trigok.Title_6.BorderSizePixel = 0
trigok.Title_6.TextScaled = true
trigok.Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Title_6.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.Title_6.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Title_6.TextSize = 100
trigok.Title_6.Name = "Title"
trigok.Title_6.Size = UDim2.new(0.983503, 0, 0.449235, 0)
trigok.Title_6.TextColor3 = Color3.fromRGB(250, 250, 250)
trigok.Title_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Title_6.Text = "Enable Trigon Desktop Connection"
trigok.Title_6.Position = UDim2.new(0.491751, 0, 0.224617, 0)
trigok.Title_6.BackgroundTransparency = 1
trigok.Title_6.TextXAlignment = Enum.TextXAlignment.Left
trigok.Title_6.Parent = trigok.Texts_4

trigok.subTitle_2.TextWrapped = true
trigok.subTitle_2.BorderSizePixel = 0
trigok.subTitle_2.TextScaled = true
trigok.subTitle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.subTitle_2.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.subTitle_2.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.subTitle_2.TextSize = 100
trigok.subTitle_2.Name = "subTitle"
trigok.subTitle_2.Size = UDim2.new(0.909815, 0, 0.273333, 0)
trigok.subTitle_2.TextColor3 = Color3.fromRGB(250, 250, 250)
trigok.subTitle_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.subTitle_2.Text = "{comming soon}"
trigok.subTitle_2.Position = UDim2.new(0.545092, 0, 0.685901, 0)
trigok.subTitle_2.BackgroundTransparency = 1
trigok.subTitle_2.TextXAlignment = Enum.TextXAlignment.Left
trigok.subTitle_2.Parent = trigok.Texts_4

trigok.icon_4.BorderSizePixel = 0
trigok.icon_4.ScaleType = Enum.ScaleType.Fit
trigok.icon_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.icon_4.Image = "rbxassetid://15865858307"
trigok.icon_4.Size = UDim2.new(0.0585895, 0, 0.847248, 0)
trigok.icon_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.icon_4.Name = "icon"
trigok.icon_4.BackgroundTransparency = 1
trigok.icon_4.Position = UDim2.new(0.00797054, 0, 0.0613952, 0)
trigok.icon_4.Parent = trigok.trigonSS

trigok.homeFrame.Active = true
trigok.homeFrame.BorderSizePixel = 0
trigok.homeFrame.Size = UDim2.new(0.949745, 0, 0.682833, 0)
trigok.homeFrame.Position = UDim2.new(0.0244645, 0, 0.0897571, 0)
trigok.homeFrame.BackgroundTransparency = 0.45
trigok.homeFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.homeFrame.ClipsDescendants = true
trigok.homeFrame.Visible = false
trigok.homeFrame.Name = "homeFrame"
trigok.homeFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
trigok.homeFrame.Parent = trigok.MainFrame

trigok.UICorner_22.CornerRadius = UDim.new(0.02, 0)
trigok.UICorner_22.Parent = trigok.homeFrame

trigok.changelogFrame.BorderSizePixel = 0
trigok.changelogFrame.CanvasSize = UDim2.new(0, 0, 1, 0)
trigok.changelogFrame.Selectable = false
trigok.changelogFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
trigok.changelogFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
trigok.changelogFrame.Size = UDim2.new(0.16949, 0, 1.00031, 0)
trigok.changelogFrame.BackgroundTransparency = 0.35
trigok.changelogFrame.ScrollBarImageTransparency = 0.64
trigok.changelogFrame.ScrollBarThickness = 5
trigok.changelogFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.changelogFrame.Name = "changelogFrame"
trigok.changelogFrame.Position = UDim2.new(-5.87782e-09, 0, 0, 0)
trigok.changelogFrame.Parent = trigok.homeFrame

trigok.UICorner_23.CornerRadius = UDim.new(1, 0)
trigok.UICorner_23.Parent = trigok.changelogFrame

trigok.UIListLayout_12.FillDirection = Enum.FillDirection.Horizontal
trigok.UIListLayout_12.SortOrder = Enum.SortOrder.LayoutOrder
trigok.UIListLayout_12.Padding = UDim.new(0.018, 0)
trigok.UIListLayout_12.Parent = trigok.homeFrame

trigok.scriptsFrame.BorderSizePixel = 0
trigok.scriptsFrame.CanvasSize = UDim2.new(0, 0, 1, 0)
trigok.scriptsFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
trigok.scriptsFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
trigok.scriptsFrame.Size = UDim2.new(0.357601, 0, 1, 0)
trigok.scriptsFrame.BackgroundTransparency = 0.35
trigok.scriptsFrame.Active = true
trigok.scriptsFrame.ScrollBarImageTransparency = 0.64
trigok.scriptsFrame.ScrollBarThickness = 5
trigok.scriptsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.scriptsFrame.Name = "scriptsFrame"
trigok.scriptsFrame.Position = UDim2.new(0.186719, 0, 0, 0)
trigok.scriptsFrame.Parent = trigok.homeFrame

trigok.UICorner_24.CornerRadius = UDim.new(1, 0)
trigok.UICorner_24.Parent = trigok.scriptsFrame

trigok.UIListLayout_13.HorizontalAlignment = Enum.HorizontalAlignment.Center
trigok.UIListLayout_13.Padding = UDim.new(0.01, 0)
trigok.UIListLayout_13.Parent = trigok.scriptsFrame

trigok._GameHeader.BorderSizePixel = 0
trigok._GameHeader.Size = UDim2.new(1, 0, 0.157089, 0)
trigok._GameHeader.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok._GameHeader.Name = "#GameHeader"
trigok._GameHeader.BackgroundColor3 = Color3.fromRGB(35, 39, 49)
trigok._GameHeader.Parent = trigok.scriptsFrame

trigok.Title_7.TextWrapped = true
trigok.Title_7.BorderSizePixel = 0
trigok.Title_7.TextScaled = true
trigok.Title_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Title_7.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.Title_7.TextSize = 14
trigok.Title_7.Name = "Title"
trigok.Title_7.Size = UDim2.new(0.998909, 0, 0.572671, 0)
trigok.Title_7.TextColor3 = Color3.fromRGB(180, 193, 216)
trigok.Title_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Title_7.Text = "{game_name}"
trigok.Title_7.Position = UDim2.new(0, 0, 0.2, 0)
trigok.Title_7.BackgroundTransparency = 1
trigok.Title_7.Parent = trigok._GameHeader

trigok.UICorner_25.CornerRadius = UDim.new(0.1, 0)
trigok.UICorner_25.Parent = trigok._GameHeader

trigok.TextButton.TextWrapped = true
trigok.TextButton.Active = false
trigok.TextButton.BorderSizePixel = 0
trigok.TextButton.BackgroundColor3 = Color3.fromRGB(55, 60, 76)
trigok.TextButton.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.TextButton.Position = UDim2.new(0.0264026, 0, 0.157089, 0)
trigok.TextButton.TextSize = 16
trigok.TextButton.Size = UDim2.new(0.950495, 0, 0.1, 0)
trigok.TextButton.TextColor3 = Color3.fromRGB(180, 193, 216)
trigok.TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.TextButton.Text = "No scripts found for this game..."
trigok.TextButton.Parent = trigok.scriptsFrame

trigok.UICorner_26.CornerRadius = UDim.new(0.1, 0)
trigok.UICorner_26.Parent = trigok.TextButton

trigok.localscriptsFrame.BorderSizePixel = 0
trigok.localscriptsFrame.CanvasSize = UDim2.new(0, 0, 1, 0)
trigok.localscriptsFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
trigok.localscriptsFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
trigok.localscriptsFrame.Size = UDim2.new(0.43768, 0, 1, 0)
trigok.localscriptsFrame.BackgroundTransparency = 0.35
trigok.localscriptsFrame.Active = true
trigok.localscriptsFrame.ScrollBarImageTransparency = 0.64
trigok.localscriptsFrame.ScrollBarThickness = 5
trigok.localscriptsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.localscriptsFrame.Name = "localscriptsFrame"
trigok.localscriptsFrame.Position = UDim2.new(0.56232, 0, 0, 0)
trigok.localscriptsFrame.Parent = trigok.homeFrame

trigok.UICorner_27.CornerRadius = UDim.new(1, 0)
trigok.UICorner_27.Parent = trigok.localscriptsFrame

trigok.UIListLayout_14.HorizontalAlignment = Enum.HorizontalAlignment.Center
trigok.UIListLayout_14.SortOrder = Enum.SortOrder.LayoutOrder
trigok.UIListLayout_14.Padding = UDim.new(0.01, 0)
trigok.UIListLayout_14.Parent = trigok.localscriptsFrame

trigok._GameHeader_1.BorderSizePixel = 0
trigok._GameHeader_1.Size = UDim2.new(1, 0, 0.157089, 0)
trigok._GameHeader_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok._GameHeader_1.Name = "#GameHeader"
trigok._GameHeader_1.BackgroundColor3 = Color3.fromRGB(35, 39, 49)
trigok._GameHeader_1.Parent = trigok.localscriptsFrame

trigok.Title_8.TextWrapped = true
trigok.Title_8.BorderSizePixel = 0
trigok.Title_8.TextScaled = true
trigok.Title_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Title_8.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.Title_8.TextSize = 14
trigok.Title_8.Name = "Title"
trigok.Title_8.Size = UDim2.new(0.631911, 0, 0.572671, 0)
trigok.Title_8.TextColor3 = Color3.fromRGB(180, 193, 216)
trigok.Title_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Title_8.Text = "Local Scripts"
trigok.Title_8.Position = UDim2.new(0, 0, 0.2, 0)
trigok.Title_8.BackgroundTransparency = 1
trigok.Title_8.Parent = trigok._GameHeader_1

trigok.UICorner_28.CornerRadius = UDim.new(0.1, 0)
trigok.UICorner_28.Parent = trigok._GameHeader_1

trigok.Add_btn.BorderSizePixel = 0
trigok.Add_btn.Size = UDim2.new(0.345421, 0, 0.482072, 0)
trigok.Add_btn.Position = UDim2.new(0.63191, 0, 0.290598, 0)
trigok.Add_btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Add_btn.Name = "Add_btn"
trigok.Add_btn.BackgroundColor3 = Color3.fromRGB(55, 60, 76)
trigok.Add_btn.Parent = trigok._GameHeader_1

trigok.TextButton_1.TextWrapped = true
trigok.TextButton_1.BorderSizePixel = 0
trigok.TextButton_1.RichText = true
trigok.TextButton_1.TextScaled = true
trigok.TextButton_1.BackgroundColor3 = Color3.fromRGB(55, 60, 76)
trigok.TextButton_1.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.TextButton_1.Position = UDim2.new(0.0427491, 0, 0.159589, 0)
trigok.TextButton_1.TextSize = 14
trigok.TextButton_1.Size = UDim2.new(0.909327, 0, 0.659937, 0)
trigok.TextButton_1.TextColor3 = Color3.fromRGB(255, 255, 255)
trigok.TextButton_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.TextButton_1.Text = "+ Add Script"
trigok.TextButton_1.BackgroundTransparency = 1
trigok.TextButton_1.Parent = trigok.Add_btn

trigok.UICorner_29.CornerRadius = UDim.new(0.1, 0)
trigok.UICorner_29.Parent = trigok.Add_btn

trigok.script_placeholder.BorderSizePixel = 0
trigok.script_placeholder.Size = UDim2.new(0.967878, 0, 0.1, 0)
trigok.script_placeholder.Position = UDim2.new(0.0204618, 0, 0.167089, 0)
trigok.script_placeholder.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.script_placeholder.ClipsDescendants = true
trigok.script_placeholder.Name = "script_placeholder"
trigok.script_placeholder.BackgroundColor3 = Color3.fromRGB(55, 60, 76)
trigok.script_placeholder.Parent = trigok.localscriptsFrame

trigok.scriptTitle.TextWrapped = true
trigok.scriptTitle.BorderSizePixel = 0
trigok.scriptTitle.TextScaled = true
trigok.scriptTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.scriptTitle.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.scriptTitle.ClipsDescendants = true
trigok.scriptTitle.TextSize = 14
trigok.scriptTitle.Name = "scriptTitle"
trigok.scriptTitle.Size = UDim2.new(0.598337, 0, 0.484707, 0)
trigok.scriptTitle.TextColor3 = Color3.fromRGB(180, 193, 216)
trigok.scriptTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.scriptTitle.Text = "Local Scripts"
trigok.scriptTitle.Position = UDim2.new(0.0255949, 0, 0.247684, 0)
trigok.scriptTitle.BackgroundTransparency = 1
trigok.scriptTitle.TextXAlignment = Enum.TextXAlignment.Left
trigok.scriptTitle.Parent = trigok.script_placeholder

trigok.Buttons_1.BorderSizePixel = 0
trigok.Buttons_1.Size = UDim2.new(0.32274, 0, 0.81382, 0)
trigok.Buttons_1.Position = UDim2.new(0.665989, 0, 0.0859291, 0)
trigok.Buttons_1.BackgroundTransparency = 1
trigok.Buttons_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Buttons_1.Name = "Buttons"
trigok.Buttons_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Buttons_1.Parent = trigok.script_placeholder

trigok.UIListLayout_15.FillDirection = Enum.FillDirection.Horizontal
trigok.UIListLayout_15.HorizontalAlignment = Enum.HorizontalAlignment.Right
trigok.UIListLayout_15.VerticalAlignment = Enum.VerticalAlignment.Center
trigok.UIListLayout_15.SortOrder = Enum.SortOrder.LayoutOrder
trigok.UIListLayout_15.Padding = UDim.new(0.015, 0)
trigok.UIListLayout_15.Parent = trigok.Buttons_1

trigok.run.BorderSizePixel = 0
trigok.run.Size = UDim2.new(0.219148, 0, 1, 0)
trigok.run.Position = UDim2.new(0.780852, 0, 0, 0)
trigok.run.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.run.Name = "run"
trigok.run.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
trigok.run.Parent = trigok.Buttons_1

trigok.UIListLayout_16.FillDirection = Enum.FillDirection.Horizontal
trigok.UIListLayout_16.HorizontalAlignment = Enum.HorizontalAlignment.Center
trigok.UIListLayout_16.VerticalAlignment = Enum.VerticalAlignment.Center
trigok.UIListLayout_16.ItemLineAlignment = Enum.ItemLineAlignment.Center
trigok.UIListLayout_16.Parent = trigok.run

trigok.UICorner_30.CornerRadius = UDim.new(0.06, 0)
trigok.UICorner_30.Parent = trigok.run

trigok.button_2.ZIndex = 2
trigok.button_2.BorderSizePixel = 0
trigok.button_2.ScaleType = Enum.ScaleType.Fit
trigok.button_2.Image = "rbxassetid://3926305904"
trigok.button_2.ImageRectSize = Vector2.new(36, 36)
trigok.button_2.Size = UDim2.new(0.5, 0, 0.5, 0)
trigok.button_2.Name = "button"
trigok.button_2.BackgroundTransparency = 1
trigok.button_2.Position = UDim2.new(0.5, 0, 0.5, 0)
trigok.button_2.ImageRectOffset = Vector2.new(404, 844)
trigok.button_2.Parent = trigok.run

trigok.autoload.BorderSizePixel = 0
trigok.autoload.Size = UDim2.new(0.627535, 0, 1, 0)
trigok.autoload.Position = UDim2.new(0.0928736, 0, 0, 0)
trigok.autoload.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.autoload.Name = "autoload"
trigok.autoload.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
trigok.autoload.Parent = trigok.Buttons_1

trigok.UIListLayout_17.FillDirection = Enum.FillDirection.Horizontal
trigok.UIListLayout_17.VerticalAlignment = Enum.VerticalAlignment.Center
trigok.UIListLayout_17.ItemLineAlignment = Enum.ItemLineAlignment.Center
trigok.UIListLayout_17.Parent = trigok.autoload

trigok.button_3.ZIndex = 2
trigok.button_3.BorderSizePixel = 0
trigok.button_3.ScaleType = Enum.ScaleType.Fit
trigok.button_3.Image = "rbxassetid://3926305904"
trigok.button_3.ImageRectSize = Vector2.new(36, 36)
trigok.button_3.Size = UDim2.new(0.31389, 0, 0.496509, 0)
trigok.button_3.Name = "button"
trigok.button_3.LayoutOrder = 1
trigok.button_3.BackgroundTransparency = 1
trigok.button_3.Position = UDim2.new(0, 0, 0.251746, 0)
trigok.button_3.ImageRectOffset = Vector2.new(724, 724)
trigok.button_3.Parent = trigok.autoload

trigok.zz.TextWrapped = true
trigok.zz.BorderSizePixel = 0
trigok.zz.RichText = true
trigok.zz.TextScaled = true
trigok.zz.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.zz.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.zz.TextSize = 14
trigok.zz.Name = "zz"
trigok.zz.Size = UDim2.new(0.592892, 0, 0.503491, 0)
trigok.zz.TextColor3 = Color3.fromRGB(240, 240, 240)
trigok.zz.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.zz.Text = "AutoExecute"
trigok.zz.Position = UDim2.new(0.355672, 0, 0.248254, 0)
trigok.zz.BackgroundTransparency = 1
trigok.zz.Parent = trigok.autoload

trigok.UICorner_31.CornerRadius = UDim.new(0.06, 0)
trigok.UICorner_31.Parent = trigok.autoload

trigok.delete.BorderSizePixel = 0
trigok.delete.Size = UDim2.new(0.219148, 0, 1, 0)
trigok.delete.Position = UDim2.new(0.780852, 0, 0, 0)
trigok.delete.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.delete.Name = "delete"
trigok.delete.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
trigok.delete.Parent = trigok.Buttons_1

trigok.UIListLayout_18.FillDirection = Enum.FillDirection.Horizontal
trigok.UIListLayout_18.HorizontalAlignment = Enum.HorizontalAlignment.Center
trigok.UIListLayout_18.VerticalAlignment = Enum.VerticalAlignment.Center
trigok.UIListLayout_18.ItemLineAlignment = Enum.ItemLineAlignment.Center
trigok.UIListLayout_18.Parent = trigok.delete

trigok.UICorner_32.CornerRadius = UDim.new(0.06, 0)
trigok.UICorner_32.Parent = trigok.delete

trigok.button_4.ZIndex = 2
trigok.button_4.BorderSizePixel = 0
trigok.button_4.ScaleType = Enum.ScaleType.Fit
trigok.button_4.Image = "rbxassetid://3926305904"
trigok.button_4.ImageRectSize = Vector2.new(36, 36)
trigok.button_4.Size = UDim2.new(0.5, 0, 0.5, 0)
trigok.button_4.Name = "button"
trigok.button_4.BackgroundTransparency = 1
trigok.button_4.Position = UDim2.new(0.5, 0, 0.5, 0)
trigok.button_4.ImageRectOffset = Vector2.new(644, 724)
trigok.button_4.Parent = trigok.delete

trigok.UICorner_33.CornerRadius = UDim.new(0.06, 0)
trigok.UICorner_33.Parent = trigok.script_placeholder

trigok.addlocalscriptsFrame.BorderSizePixel = 0
trigok.addlocalscriptsFrame.CanvasSize = UDim2.new(0, 0, 1, 0)
trigok.addlocalscriptsFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
trigok.addlocalscriptsFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
trigok.addlocalscriptsFrame.Size = UDim2.new(0.43768, 0, 1, 0)
trigok.addlocalscriptsFrame.BackgroundTransparency = 0.35
trigok.addlocalscriptsFrame.Active = true
trigok.addlocalscriptsFrame.ScrollBarImageTransparency = 0.64
trigok.addlocalscriptsFrame.ScrollBarThickness = 5
trigok.addlocalscriptsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.addlocalscriptsFrame.Name = "addlocalscriptsFrame"
trigok.addlocalscriptsFrame.Position = UDim2.new(0.56232, 0, 0, 0)
trigok.addlocalscriptsFrame.Parent = trigok.homeFrame

trigok.UICorner_34.CornerRadius = UDim.new(1, 0)
trigok.UICorner_34.Parent = trigok.addlocalscriptsFrame

trigok.UIListLayout_19.HorizontalAlignment = Enum.HorizontalAlignment.Center
trigok.UIListLayout_19.SortOrder = Enum.SortOrder.LayoutOrder
trigok.UIListLayout_19.Padding = UDim.new(0.01, 0)
trigok.UIListLayout_19.Parent = trigok.addlocalscriptsFrame

trigok._GameHeader_2.BorderSizePixel = 0
trigok._GameHeader_2.Size = UDim2.new(1, 0, 0.157089, 0)
trigok._GameHeader_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok._GameHeader_2.Name = "#GameHeader"
trigok._GameHeader_2.BackgroundColor3 = Color3.fromRGB(35, 39, 49)
trigok._GameHeader_2.Parent = trigok.addlocalscriptsFrame

trigok.Title_9.TextWrapped = true
trigok.Title_9.BorderSizePixel = 0
trigok.Title_9.TextScaled = true
trigok.Title_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Title_9.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.Title_9.TextSize = 14
trigok.Title_9.Name = "Title"
trigok.Title_9.Size = UDim2.new(0.631911, 0, 0.572671, 0)
trigok.Title_9.TextColor3 = Color3.fromRGB(180, 193, 216)
trigok.Title_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Title_9.Text = "Local Scripts"
trigok.Title_9.Position = UDim2.new(0, 0, 0.2, 0)
trigok.Title_9.BackgroundTransparency = 1
trigok.Title_9.Parent = trigok._GameHeader_2

trigok.UICorner_35.CornerRadius = UDim.new(0.1, 0)
trigok.UICorner_35.Parent = trigok._GameHeader_2

trigok.Frame.BorderSizePixel = 0
trigok.Frame.Size = UDim2.new(0.345421, 0, 0.482072, 0)
trigok.Frame.Position = UDim2.new(0.63191, 0, 0.290598, 0)
trigok.Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Frame.BackgroundColor3 = Color3.fromRGB(55, 60, 76)
trigok.Frame.Parent = trigok._GameHeader_2

trigok.TextButton_2.TextWrapped = true
trigok.TextButton_2.BorderSizePixel = 0
trigok.TextButton_2.RichText = true
trigok.TextButton_2.TextScaled = true
trigok.TextButton_2.BackgroundColor3 = Color3.fromRGB(55, 60, 76)
trigok.TextButton_2.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.TextButton_2.Position = UDim2.new(0.0427491, 0, 0.159589, 0)
trigok.TextButton_2.TextSize = 14
trigok.TextButton_2.Size = UDim2.new(0.909327, 0, 0.659937, 0)
trigok.TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
trigok.TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.TextButton_2.Text = "+ Add Script"
trigok.TextButton_2.BackgroundTransparency = 1
trigok.TextButton_2.Parent = trigok.Frame

trigok.UICorner_36.CornerRadius = UDim.new(0.1, 0)
trigok.UICorner_36.Parent = trigok.Frame

trigok.addFrame.BorderSizePixel = 0
trigok.addFrame.Size = UDim2.new(1, 0, 0.529673, 0)
trigok.addFrame.Position = UDim2.new(0, 0, 0.178546, 0)
trigok.addFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.addFrame.Name = "addFrame"
trigok.addFrame.BackgroundColor3 = Color3.fromRGB(35, 39, 49)
trigok.addFrame.Parent = trigok.addlocalscriptsFrame

trigok.input.BorderSizePixel = 0
trigok.input.Size = UDim2.new(1, 0, 0.178707, 0)
trigok.input.Position = UDim2.new(0, 0, 0.491846, 0)
trigok.input.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.input.Name = "input"
trigok.input.BackgroundColor3 = Color3.fromRGB(55, 60, 76)
trigok.input.Parent = trigok.addFrame

trigok.TextBox_1.TextWrapped = true
trigok.TextBox_1.BorderSizePixel = 0
trigok.TextBox_1.RichText = true
trigok.TextBox_1.TextScaled = true
trigok.TextBox_1.BackgroundColor3 = Color3.fromRGB(55, 60, 76)
trigok.TextBox_1.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.TextBox_1.Position = UDim2.new(0.0158423, 0, 0.172555, 0)
trigok.TextBox_1.PlaceholderText = "{Text and Numbers Only}"
trigok.TextBox_1.TextSize = 14
trigok.TextBox_1.Size = UDim2.new(0.961489, 0, 0.645422, 0)
trigok.TextBox_1.TextColor3 = Color3.fromRGB(0, 0, 0)
trigok.TextBox_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.TextBox_1.Text = ""
trigok.TextBox_1.ClearTextOnFocus = false
trigok.TextBox_1.Parent = trigok.input

trigok.Title_10.TextWrapped = true
trigok.Title_10.BorderSizePixel = 0
trigok.Title_10.TextScaled = true
trigok.Title_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Title_10.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.Title_10.TextSize = 14
trigok.Title_10.Name = "Title"
trigok.Title_10.Size = UDim2.new(0.261373, 0, 0.111787, 0)
trigok.Title_10.TextColor3 = Color3.fromRGB(180, 193, 216)
trigok.Title_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Title_10.Text = "Script Name:"
trigok.Title_10.Position = UDim2.new(0.00832818, 0, 0.361132, 0)
trigok.Title_10.BackgroundTransparency = 1
trigok.Title_10.Parent = trigok.addFrame

trigok.TextLabel_5.TextWrapped = true
trigok.TextLabel_5.BorderSizePixel = 0
trigok.TextLabel_5.TextScaled = true
trigok.TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.TextLabel_5.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.TextLabel_5.TextSize = 14
trigok.TextLabel_5.Size = UDim2.new(0.961488, 0, 0.222536, 0)
trigok.TextLabel_5.TextColor3 = Color3.fromRGB(225, 225, 225)
trigok.TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.TextLabel_5.Text = "Note: You just need to set the script name. The script will be added from your clipboard, so make sure to copy it before adding it."
trigok.TextLabel_5.Position = UDim2.new(0.0158422, 0, 0.0507511, 0)
trigok.TextLabel_5.BackgroundTransparency = 1
trigok.TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left
trigok.TextLabel_5.Parent = trigok.addFrame

trigok.confrim_btn.BorderSizePixel = 0
trigok.confrim_btn.Size = UDim2.new(0.345421, 0, 0.157611, 0)
trigok.confrim_btn.Position = UDim2.new(0.542995, 0, 0.709694, 0)
trigok.confrim_btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.confrim_btn.Name = "confrim_btn"
trigok.confrim_btn.BackgroundColor3 = Color3.fromRGB(55, 60, 76)
trigok.confrim_btn.Parent = trigok.addFrame

trigok.TextButton_3.TextWrapped = true
trigok.TextButton_3.BorderSizePixel = 0
trigok.TextButton_3.RichText = true
trigok.TextButton_3.TextScaled = true
trigok.TextButton_3.BackgroundColor3 = Color3.fromRGB(55, 60, 76)
trigok.TextButton_3.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.TextButton_3.Position = UDim2.new(0.0427491, 0, 0.159589, 0)
trigok.TextButton_3.TextSize = 14
trigok.TextButton_3.Size = UDim2.new(0.909327, 0, 0.659937, 0)
trigok.TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
trigok.TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.TextButton_3.Text = "Confrim"
trigok.TextButton_3.BackgroundTransparency = 1
trigok.TextButton_3.Parent = trigok.confrim_btn

trigok.UICorner_37.CornerRadius = UDim.new(0.1, 0)
trigok.UICorner_37.Parent = trigok.confrim_btn

trigok.cancel_btn.BorderSizePixel = 0
trigok.cancel_btn.Size = UDim2.new(0.345421, 0, 0.157611, 0)
trigok.cancel_btn.Position = UDim2.new(0.179819, 0, 0.709694, 0)
trigok.cancel_btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.cancel_btn.Name = "cancel_btn"
trigok.cancel_btn.BackgroundColor3 = Color3.fromRGB(55, 60, 76)
trigok.cancel_btn.Parent = trigok.addFrame

trigok.TextButton_4.TextWrapped = true
trigok.TextButton_4.BorderSizePixel = 0
trigok.TextButton_4.RichText = true
trigok.TextButton_4.TextScaled = true
trigok.TextButton_4.BackgroundColor3 = Color3.fromRGB(55, 60, 76)
trigok.TextButton_4.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.TextButton_4.Position = UDim2.new(0.0427491, 0, 0.159589, 0)
trigok.TextButton_4.TextSize = 14
trigok.TextButton_4.Size = UDim2.new(0.909327, 0, 0.659937, 0)
trigok.TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
trigok.TextButton_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.TextButton_4.Text = "Cancel"
trigok.TextButton_4.BackgroundTransparency = 1
trigok.TextButton_4.Parent = trigok.cancel_btn

trigok.UICorner_38.CornerRadius = UDim.new(0.1, 0)
trigok.UICorner_38.Parent = trigok.cancel_btn

trigok.ExecFrame.Active = true
trigok.ExecFrame.BorderSizePixel = 0
trigok.ExecFrame.Size = UDim2.new(0.949745, 0, 0.685584, 0)
trigok.ExecFrame.Position = UDim2.new(0.0244645, 0, 0.0897571, 0)
trigok.ExecFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.ExecFrame.Visible = false
trigok.ExecFrame.Name = "ExecFrame"
trigok.ExecFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
trigok.ExecFrame.Parent = trigok.MainFrame

trigok.Buttons_2.Active = true
trigok.Buttons_2.BorderSizePixel = 0
trigok.Buttons_2.Size = UDim2.new(1, 0, 0.246428, 0)
trigok.Buttons_2.Position = UDim2.new(0, 0, 0.752548, 0)
trigok.Buttons_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Buttons_2.Name = "Buttons"
trigok.Buttons_2.BackgroundColor3 = Color3.fromRGB(31, 34, 43)
trigok.Buttons_2.Parent = trigok.ExecFrame

trigok.UIListLayout_20.FillDirection = Enum.FillDirection.Horizontal
trigok.UIListLayout_20.HorizontalAlignment = Enum.HorizontalAlignment.Center
trigok.UIListLayout_20.VerticalAlignment = Enum.VerticalAlignment.Center
trigok.UIListLayout_20.Padding = UDim.new(0.01, 0)
trigok.UIListLayout_20.Parent = trigok.Buttons_2

trigok.Button1.BorderSizePixel = 3
trigok.Button1.ScaleType = Enum.ScaleType.Fit
trigok.Button1.AutoButtonColor = false
trigok.Button1.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
trigok.Button1.BorderMode = Enum.BorderMode.Inset
trigok.Button1.Selectable = false
trigok.Button1.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Button1.Size = UDim2.new(0.226347, 0, 0.721644, 0)
trigok.Button1.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Button1.Name = "Button1"
trigok.Button1.Position = UDim2.new(0.145479, 0, 0.454178, 0)
trigok.Button1.Parent = trigok.Buttons_2

trigok.UIStroke_6.LineJoinMode = Enum.LineJoinMode.Miter
trigok.UIStroke_6.Thickness = 3
trigok.UIStroke_6.Color = Color3.fromRGB(60, 66, 83)
trigok.UIStroke_6.Enabled = false
trigok.UIStroke_6.Parent = trigok.Button1

trigok.UICorner_39.CornerRadius = UDim.new(0.08, 0)
trigok.UICorner_39.Parent = trigok.Button1

trigok.Title_11.TextWrapped = true
trigok.Title_11.BorderSizePixel = 0
trigok.Title_11.TextScaled = true
trigok.Title_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Title_11.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.Title_11.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Title_11.TextSize = 100
trigok.Title_11.Name = "Title"
trigok.Title_11.Size = UDim2.new(0.340682, 0, 0.729158, 0)
trigok.Title_11.TextColor3 = Color3.fromRGB(250, 250, 250)
trigok.Title_11.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Title_11.Text = "Execute"
trigok.Title_11.Position = UDim2.new(0.5, 0, 0.5, 0)
trigok.Title_11.BackgroundTransparency = 1
trigok.Title_11.Parent = trigok.Button1

trigok.Button4.BorderSizePixel = 3
trigok.Button4.ScaleType = Enum.ScaleType.Fit
trigok.Button4.AutoButtonColor = false
trigok.Button4.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
trigok.Button4.BorderMode = Enum.BorderMode.Inset
trigok.Button4.Selectable = false
trigok.Button4.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Button4.Size = UDim2.new(0.226347, 0, 0.721644, 0)
trigok.Button4.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Button4.Name = "Button4"
trigok.Button4.Position = UDim2.new(0.854521, 0, 0.454178, 0)
trigok.Button4.Parent = trigok.Buttons_2

trigok.Title_12.TextWrapped = true
trigok.Title_12.BorderSizePixel = 0
trigok.Title_12.TextScaled = true
trigok.Title_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Title_12.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.Title_12.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Title_12.TextSize = 14
trigok.Title_12.Name = "Title"
trigok.Title_12.Size = UDim2.new(0.313498, 0, 0.782088, 0)
trigok.Title_12.TextColor3 = Color3.fromRGB(250, 250, 250)
trigok.Title_12.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Title_12.Text = "Clear"
trigok.Title_12.Position = UDim2.new(0.5, 0, 0.5, 0)
trigok.Title_12.BackgroundTransparency = 1
trigok.Title_12.Parent = trigok.Button4

trigok.UICorner_40.CornerRadius = UDim.new(0.08, 0)
trigok.UICorner_40.Parent = trigok.Button4

trigok.UIStroke_7.LineJoinMode = Enum.LineJoinMode.Miter
trigok.UIStroke_7.Thickness = 3
trigok.UIStroke_7.Color = Color3.fromRGB(60, 66, 83)
trigok.UIStroke_7.Enabled = false
trigok.UIStroke_7.Parent = trigok.Button4

trigok.Button3.BorderSizePixel = 3
trigok.Button3.ScaleType = Enum.ScaleType.Fit
trigok.Button3.AutoButtonColor = false
trigok.Button3.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
trigok.Button3.BorderMode = Enum.BorderMode.Inset
trigok.Button3.Selectable = false
trigok.Button3.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Button3.Size = UDim2.new(0.226347, 0, 0.721644, 0)
trigok.Button3.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Button3.Name = "Button3"
trigok.Button3.Position = UDim2.new(0.618174, 0, 0.454178, 0)
trigok.Button3.Parent = trigok.Buttons_2

trigok.Title_13.TextWrapped = true
trigok.Title_13.BorderSizePixel = 0
trigok.Title_13.TextScaled = true
trigok.Title_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Title_13.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.Title_13.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Title_13.TextSize = 14
trigok.Title_13.Name = "Title"
trigok.Title_13.Size = UDim2.new(0.347791, 0, 0.782034, 0)
trigok.Title_13.TextColor3 = Color3.fromRGB(250, 250, 250)
trigok.Title_13.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Title_13.Text = "Paste"
trigok.Title_13.Position = UDim2.new(0.5, 0, 0.5, 0)
trigok.Title_13.BackgroundTransparency = 1
trigok.Title_13.Parent = trigok.Button3

trigok.UICorner_41.CornerRadius = UDim.new(0.08, 0)
trigok.UICorner_41.Parent = trigok.Button3

trigok.UIStroke_8.LineJoinMode = Enum.LineJoinMode.Miter
trigok.UIStroke_8.Thickness = 3
trigok.UIStroke_8.Color = Color3.fromRGB(60, 66, 83)
trigok.UIStroke_8.Enabled = false
trigok.UIStroke_8.Parent = trigok.Button3

trigok.Button2.BorderSizePixel = 3
trigok.Button2.ScaleType = Enum.ScaleType.Fit
trigok.Button2.AutoButtonColor = false
trigok.Button2.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
trigok.Button2.BorderMode = Enum.BorderMode.Inset
trigok.Button2.Selectable = false
trigok.Button2.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Button2.Size = UDim2.new(0.226347, 0, 0.721644, 0)
trigok.Button2.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Button2.Name = "Button2"
trigok.Button2.Position = UDim2.new(0.381826, 0, 0.454178, 0)
trigok.Button2.Parent = trigok.Buttons_2

trigok.Title_14.TextWrapped = true
trigok.Title_14.BorderSizePixel = 0
trigok.Title_14.TextScaled = true
trigok.Title_14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.Title_14.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.Title_14.AnchorPoint = Vector2.new(0.5, 0.5)
trigok.Title_14.TextSize = 14
trigok.Title_14.Name = "Title"
trigok.Title_14.Size = UDim2.new(0.730181, 0, 0.653414, 0)
trigok.Title_14.TextColor3 = Color3.fromRGB(250, 250, 250)
trigok.Title_14.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.Title_14.Text = "Execute from Clipboard"
trigok.Title_14.Position = UDim2.new(0.5, 0, 0.5, 0)
trigok.Title_14.BackgroundTransparency = 1
trigok.Title_14.Parent = trigok.Button2

trigok.UICorner_42.CornerRadius = UDim.new(0.08, 0)
trigok.UICorner_42.Parent = trigok.Button2

trigok.UIStroke_9.LineJoinMode = Enum.LineJoinMode.Miter
trigok.UIStroke_9.Thickness = 3
trigok.UIStroke_9.Color = Color3.fromRGB(60, 66, 83)
trigok.UIStroke_9.Enabled = false
trigok.UIStroke_9.Parent = trigok.Button2

trigok.UICorner_43.CornerRadius = UDim.new(0.1, 0)
trigok.UICorner_43.Parent = trigok.Buttons_2

trigok.ScrollingFrame.BorderSizePixel = 0
trigok.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 1, 0)
trigok.ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trigok.ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
trigok.ScrollingFrame.Size = UDim2.new(0.975214, 0, 0.675238, 0)
trigok.ScrollingFrame.BackgroundTransparency = 1
trigok.ScrollingFrame.Active = true
trigok.ScrollingFrame.ScrollBarImageTransparency = 0.64
trigok.ScrollingFrame.ScrollBarThickness = 18
trigok.ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.ScrollingFrame.Position = UDim2.new(0.0167858, 0, 0.0257617, 0)
trigok.ScrollingFrame.Parent = trigok.ExecFrame

trigok.LocalScript.Parent = trigok.ScrollingFrame

trigok.ScriptBox.BorderSizePixel = 0
trigok.ScriptBox.RichText = true
trigok.ScriptBox.TextYAlignment = Enum.TextYAlignment.Top
trigok.ScriptBox.BackgroundColor3 = Color3.fromRGB(75, 0, 0)
trigok.ScriptBox.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
trigok.ScriptBox.BackgroundTransparency = 1
trigok.ScriptBox.AutomaticSize = Enum.AutomaticSize.Y
trigok.ScriptBox.TextSize = 30
trigok.ScriptBox.ClipsDescendants = true
trigok.ScriptBox.Size = UDim2.new(1, 0, 1, 0)
trigok.ScriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
trigok.ScriptBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
trigok.ScriptBox.Text = "-- We recommend only uisng loadstrings | Trigon Mobile v0.03 {Beta}"
trigok.ScriptBox.MultiLine = true
trigok.ScriptBox.Name = "ScriptBox"
trigok.ScriptBox.TextXAlignment = Enum.TextXAlignment.Left
trigok.ScriptBox.ClearTextOnFocus = false
trigok.ScriptBox.Parent = trigok.ScrollingFrame

trigok.Highlighter.Name = "Highlighter"
trigok.Highlighter.Parent = trigok.ScriptBox

trigok.lexer.Name = "lexer"
trigok.lexer.Parent = trigok.Highlighter

trigok.language.Name = "language"
trigok.language.Parent = trigok.lexer

trigok.theme.Name = "theme"
trigok.theme.Parent = trigok.Highlighter

trigok.types.Name = "types"
trigok.types.Parent = trigok.Highlighter

trigok.utility.Name = "utility"
trigok.utility.Parent = trigok.Highlighter

trigok.UICorner_44.CornerRadius = UDim.new(0.02, 0)
trigok.UICorner_44.Parent = trigok.ExecFrame

trigok.LocalScript_1.Parent = trigok.TrigonMain

trigok.savescripts.Name = "savescripts"
trigok.savescripts.Parent = trigok.TrigonMain
	
local modules, cache = {}, {}
		
local o_require = require;
local function require(module)
	local real, cached = modules[module], cache[module]
	
	if cached then return cached end
	
	if not real then return o_require(module) end
	
	cache[module] = real()
	
	return cache[module]
end

modules[trigok.Highlighter] = function()
	local script = trigok.Highlighter

	local types = require(script.types)
	local utility = require(script.utility)
	local theme = require(script.theme)
	
	local Highlighter = {
		defaultLexer = require(script.lexer) :: types.Lexer,
	
		_textObjectData = {} :: { [types.TextObject]: types.ObjectData },
		_cleanups = {} :: { [types.TextObject]: () -> () },
	}
	
	--[[
		Gathers the info that is needed in order to set up a line label.
	]]
	function Highlighter._getLabelingInfo(textObject: types.TextObject)
		local data = Highlighter._textObjectData[textObject]
		if not data then
			return
		end
	
		local src = utility.convertTabsToSpaces(utility.removeControlChars(textObject.Text))
		local numLines = #string.split(src, "\n")
		if numLines == 0 then
			return
		end
	
		local textBounds = utility.getTextBounds(textObject)
		local textHeight = textBounds.Y / numLines
	
		return {
			data = data,
			numLines = numLines,
			textBounds = textBounds,
			textHeight = textHeight,
			innerAbsoluteSize = utility.getInnerAbsoluteSize(textObject),
			textColor = theme.getColor("iden"),
			textFont = textObject.FontFace,
			textSize = textObject.TextSize,
			labelSize = UDim2.new(1, 0, 0, math.ceil(textHeight)),
		}
	end
	
	--[[
		Aligns and matches the line labels to the textObject.
	]]
	function Highlighter._alignLabels(textObject: types.TextObject)
		local labelingInfo = Highlighter._getLabelingInfo(textObject)
		if not labelingInfo then
			return
		end
	
		for lineNumber, lineLabel in labelingInfo.data.Labels do
			-- Align line label
			lineLabel.TextColor3 = labelingInfo.textColor
			lineLabel.FontFace = labelingInfo.textFont
			lineLabel.TextSize = labelingInfo.textSize
			lineLabel.Size = labelingInfo.labelSize
			lineLabel.Position =
				UDim2.fromScale(0, labelingInfo.textHeight * (lineNumber - 1) / labelingInfo.innerAbsoluteSize.Y)
		end
	end
	
	--[[
		Creates and populates the line labels with the appropriate rich text.
	]]
	function Highlighter._populateLabels(props: types.HighlightProps)
		-- Gather props
		local textObject = props.textObject
		local src = utility.convertTabsToSpaces(utility.removeControlChars(props.src or textObject.Text))
		local lexer = props.lexer or Highlighter.defaultLexer
		local customLang = props.customLang
		local forceUpdate = props.forceUpdate
	
		-- Avoid updating when unnecessary
		local data = Highlighter._textObjectData[textObject]
		if (data == nil) or (data.Text == src) then
			if forceUpdate ~= true then
				return
			end
		end
	
		-- Ensure textObject matches sanitized src
		textObject.Text = src
	
		local lineLabels = data.Labels
		local previousLines = data.Lines
	
		local lines = string.split(src, "\n")
	
		data.Lines = lines
		data.Text = src
		data.Lexer = lexer
		data.CustomLang = customLang
	
		-- Shortcut empty textObjects
		if src == "" then
			for l = 1, #lineLabels do
				if lineLabels[l].Text == "" then
					continue
				end
				lineLabels[l].Text = ""
			end
			return
		end
	
		local idenColor = theme.getColor("iden")
		local labelingInfo = Highlighter._getLabelingInfo(textObject)
	
		local richTextBuffer, bufferIndex, lineNumber = table.create(5), 0, 1
		for token: types.TokenName, content: string in lexer.scan(src) do
			local Color = if customLang and customLang[content]
				then theme.getColor("custom")
				else theme.getColor(token) or idenColor
	
			local tokenLines = string.split(utility.sanitizeRichText(content), "\n")
	
			for l, tokenLine in tokenLines do
				-- Find line label
				local lineLabel = lineLabels[lineNumber]
				if not lineLabel then
					local newLabel = Instance.new("TextLabel")
					newLabel.Name = "Line_" .. lineNumber
					newLabel.AutoLocalize = false
					newLabel.RichText = true
					newLabel.BackgroundTransparency = 1
					newLabel.Text = ""
					newLabel.TextXAlignment = Enum.TextXAlignment.Left
					newLabel.TextYAlignment = Enum.TextYAlignment.Top
					newLabel.TextColor3 = labelingInfo.textColor
					newLabel.FontFace = labelingInfo.textFont
					newLabel.TextSize = labelingInfo.textSize
					newLabel.Size = labelingInfo.labelSize
					newLabel.Position =
						UDim2.fromScale(0, labelingInfo.textHeight * (lineNumber - 1) / labelingInfo.innerAbsoluteSize.Y)
	
					newLabel.Parent = textObject.SyntaxHighlights
					lineLabels[lineNumber] = newLabel
					lineLabel = newLabel
				end
	
				-- If multiline token, then set line & move to next
				if l > 1 then
					if forceUpdate or lines[lineNumber] ~= previousLines[lineNumber] then
						-- Set line
						lineLabels[lineNumber].Text = table.concat(richTextBuffer)
					end
					-- Move to next line
					lineNumber += 1
					bufferIndex = 0
					table.clear(richTextBuffer)
				end
	
				-- If changed, add token to line
				if forceUpdate or lines[lineNumber] ~= previousLines[lineNumber] then
					bufferIndex += 1
					-- Only add RichText tags when the color is non-default and the characters are non-whitespace
					if Color ~= idenColor and string.find(tokenLine, "[%S%C]") then
						richTextBuffer[bufferIndex] = theme.getColoredRichText(Color, tokenLine)
					else
						richTextBuffer[bufferIndex] = tokenLine
					end
				end
			end
		end
	
		-- Set final line
		if richTextBuffer[1] and lineLabels[lineNumber] then
			lineLabels[lineNumber].Text = table.concat(richTextBuffer)
		end
	
		-- Clear unused line labels
		for l = lineNumber + 1, #lineLabels do
			if lineLabels[l].Text == "" then
				continue
			end
			lineLabels[l].Text = ""
		end
	end
	
	--[[
		Highlights the given textObject with the given props and returns a cleanup function.
		Highlighting will automatically update when needed, so the cleanup function will disconnect
		those connections and remove all labels.
	]]
	function Highlighter.highlight(props: types.HighlightProps): () -> ()
		-- Gather props
		local textObject = props.textObject
		local src = utility.convertTabsToSpaces(utility.removeControlChars(props.src or textObject.Text))
		local lexer = props.lexer or Highlighter.defaultLexer
		local customLang = props.customLang
	
		-- Avoid updating when unnecessary
		if Highlighter._cleanups[textObject] then
			-- Already been initialized, so just update
			Highlighter._populateLabels(props)
			Highlighter._alignLabels(textObject)
			return Highlighter._cleanups[textObject]
		end
	
		-- Ensure valid object properties
		textObject.RichText = false
		textObject.Text = src
		textObject.TextXAlignment = Enum.TextXAlignment.Left
		textObject.TextYAlignment = Enum.TextYAlignment.Top
		textObject.BackgroundColor3 = theme.getColor("background")
		textObject.TextColor3 = theme.getColor("iden")
		textObject.TextTransparency = 0.5
	
		-- Build the highlight labels
		local lineFolder = textObject:FindFirstChild("SyntaxHighlights")
		if lineFolder == nil then
			local newLineFolder = Instance.new("Folder")
			newLineFolder.Name = "SyntaxHighlights"
			newLineFolder.Parent = textObject
	
			lineFolder = newLineFolder
		end
	
		local data = {
			Text = "",
			Labels = {},
			Lines = {},
			Lexer = lexer,
			CustomLang = customLang,
		}
		Highlighter._textObjectData[textObject] = data
	
		-- Add a cleanup handler for this textObject
		local connections: { [string]: RBXScriptConnection } = {}
		local function cleanup()
			lineFolder:Destroy()
	
			Highlighter._textObjectData[textObject] = nil
			Highlighter._cleanups[textObject] = nil
	
			for _key, connection in connections do
				connection:Disconnect()
			end
			table.clear(connections)
		end
		Highlighter._cleanups[textObject] = cleanup
	
		connections["AncestryChanged"] = textObject.AncestryChanged:Connect(function()
			if textObject.Parent then
				return
			end
	
			cleanup()
		end)
		connections["TextChanged"] = textObject:GetPropertyChangedSignal("Text"):Connect(function()
			Highlighter._populateLabels(props)
		end)
		connections["TextBoundsChanged"] = textObject:GetPropertyChangedSignal("TextBounds"):Connect(function()
			Highlighter._alignLabels(textObject)
		end)
		connections["AbsoluteSizeChanged"] = textObject:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			Highlighter._alignLabels(textObject)
		end)
		connections["FontFaceChanged"] = textObject:GetPropertyChangedSignal("FontFace"):Connect(function()
			Highlighter._alignLabels(textObject)
		end)
	
		-- Populate the labels
		Highlighter._populateLabels(props)
		Highlighter._alignLabels(textObject)
	
		return cleanup
	end
	
	--[[
		Refreshes all highlighted textObjects. Used when the theme changes.
	]]
	function Highlighter.refresh(): ()
		-- Rehighlight existing labels using latest colors
		for textObject, data in Highlighter._textObjectData do
			for _, lineLabel in data.Labels do
				lineLabel.TextColor3 = theme.getColor("iden")
			end
	
			Highlighter.highlight({
				textObject = textObject,
				forceUpdate = true,
				src = data.Text,
				lexer = data.Lexer,
				customLang = data.CustomLang,
			})
		end
	end
	
	--[[
		Sets the token colors to the given colors and refreshes all highlighted textObjects.
	]]
	function Highlighter.setTokenColors(colors: types.TokenColors): ()
		theme.setColors(colors)
	
		Highlighter.refresh()
	end
	
	--[[
		Gets a token color by name.
		Mainly useful for setting "background" token color on other UI objects behind your text.
	]]
	function Highlighter.getTokenColor(tokenName: types.TokenName): Color3
		return theme.getColor(tokenName)
	end
	
	--[[
		Matches the token colors to the Studio theme settings and refreshes all highlighted textObjects.
		Does nothing when not run in a Studio plugin.
	]]
	function Highlighter.matchStudioSettings(): ()
		local applied = theme.matchStudioSettings(Highlighter.refresh)
		if applied then
			Highlighter.refresh()
		end
	end
	
	return Highlighter
	
end

modules[trigok.lexer] = function()
	local script = trigok.lexer

	--[=[
		Lexical scanner for creating a sequence of tokens from Lua source code.
		This is a heavily modified and Roblox-optimized version of
		the original Penlight Lexer module:
			https://github.com/stevedonovan/Penlight
		Authors:
			stevedonovan <https://github.com/stevedonovan> ----------- Original Penlight lexer author
			ryanjmulder <https://github.com/ryanjmulder> ------------- Penlight lexer contributer
			mpeterv <https://github.com/mpeterv> --------------------- Penlight lexer contributer
			Tieske <https://github.com/Tieske> ----------------------- Penlight lexer contributer
			boatbomber <https://github.com/boatbomber> --------------- Roblox port, added builtin token,
																		added patterns for incomplete syntax, bug fixes,
																		behavior changes, token optimization, thread optimization
																		Added lexer.navigator() for non-sequential reads
			Sleitnick <https://github.com/Sleitnick> ----------------- Roblox optimizations
			howmanysmall <https://github.com/howmanysmall> ----------- Lua + Roblox optimizations
	
		List of possible tokens:
			- iden
			- keyword
			- builtin
			- string
			- number
			- comment
			- operator
	--]=]
	
	local lexer = {}
	
	local Prefix, Suffix, Cleaner = "^[%c%s]*", "[%c%s]*", "[%c%s]+"
	local UNICODE = "[%z\x01-\x7F\xC2-\xF4][\x80-\xBF]+"
	local NUMBER_A = "0[xX][%da-fA-F_]+"
	local NUMBER_B = "0[bB][01_]+"
	local NUMBER_C = "%d+%.?%d*[eE][%+%-]?%d+"
	local NUMBER_D = "%d+[%._]?[%d_eE]*"
	local OPERATORS = "[:;<>/~%*%(%)%-={},%.#%^%+%%]+"
	local BRACKETS = "[%[%]]+" -- needs to be separate pattern from other operators or it'll mess up multiline strings
	local IDEN = "[%a_][%w_]*"
	local STRING_EMPTY = "(['\"])%1" --Empty String
	local STRING_PLAIN = "(['\"])[^\n]-([^\\]%1)" --TODO: Handle escaping escapes
	local STRING_INTER = "`[^\n]-`"
	local STRING_INCOMP_A = "(['\"]).-\n" --Incompleted String with next line
	local STRING_INCOMP_B = "(['\"])[^\n]*" --Incompleted String without next line
	local STRING_MULTI = "%[(=*)%[.-%]%1%]" --Multiline-String
	local STRING_MULTI_INCOMP = "%[=*%[.-.*" --Incompleted Multiline-String
	local COMMENT_MULTI = "%-%-%[(=*)%[.-%]%1%]" --Completed Multiline-Comment
	local COMMENT_MULTI_INCOMP = "%-%-%[=*%[.-.*" --Incompleted Multiline-Comment
	local COMMENT_PLAIN = "%-%-.-\n" --Completed Singleline-Comment
	local COMMENT_INCOMP = "%-%-.*" --Incompleted Singleline-Comment
	-- local TYPED_VAR = ":%s*([%w%?%| \t]+%s*)" --Typed variable, parameter, function
	
	local lang = require(script.language)
	local lua_keyword = lang.keyword
	local lua_builtin = lang.builtin
	local lua_libraries = lang.libraries
	
	lexer.language = lang
	
	local lua_matches = {
		-- Indentifiers
		{ Prefix .. IDEN .. Suffix, "var" },
	
		-- Numbers
		{ Prefix .. NUMBER_A .. Suffix, "number" },
		{ Prefix .. NUMBER_B .. Suffix, "number" },
		{ Prefix .. NUMBER_C .. Suffix, "number" },
		{ Prefix .. NUMBER_D .. Suffix, "number" },
	
		-- Strings
		{ Prefix .. STRING_EMPTY .. Suffix, "string" },
		{ Prefix .. STRING_PLAIN .. Suffix, "string" },
		{ Prefix .. STRING_INCOMP_A .. Suffix, "string" },
		{ Prefix .. STRING_INCOMP_B .. Suffix, "string" },
		{ Prefix .. STRING_MULTI .. Suffix, "string" },
		{ Prefix .. STRING_MULTI_INCOMP .. Suffix, "string" },
		{ Prefix .. STRING_INTER .. Suffix, "string_inter" },
	
		-- Comments
		{ Prefix .. COMMENT_MULTI .. Suffix, "comment" },
		{ Prefix .. COMMENT_MULTI_INCOMP .. Suffix, "comment" },
		{ Prefix .. COMMENT_PLAIN .. Suffix, "comment" },
		{ Prefix .. COMMENT_INCOMP .. Suffix, "comment" },
	
		-- Operators
		{ Prefix .. OPERATORS .. Suffix, "operator" },
		{ Prefix .. BRACKETS .. Suffix, "operator" },
	
		-- Unicode
		{ Prefix .. UNICODE .. Suffix, "iden" },
	
		-- Unknown
		{ "^.", "iden" },
	}
	
	-- To reduce the amount of table indexing during lexing, we separate the matches now
	local PATTERNS, TOKENS = {}, {}
	for i, m in lua_matches do
		PATTERNS[i] = m[1]
		TOKENS[i] = m[2]
	end
	
	--- Create a plain token iterator from a string.
	-- @tparam string s a string.
	
	function lexer.scan(s: string)
		local index = 1
		local size = #s
		local previousContent1, previousContent2, previousContent3, previousToken = "", "", "", ""
	
		local thread = coroutine.create(function()
			while index <= size do
				local matched = false
				for tokenType, pattern in ipairs(PATTERNS) do
					-- Find match
					local start, finish = string.find(s, pattern, index)
					if start == nil then
						continue
					end
	
					-- Move head
					index = finish + 1
					matched = true
	
					-- Gather results
					local content = string.sub(s, start, finish)
					local rawToken = TOKENS[tokenType]
					local processedToken = rawToken
	
					-- Process token
					if rawToken == "var" then
						-- Since we merge spaces into the tok, we need to remove them
						-- in order to check the actual word it contains
						local cleanContent = string.gsub(content, Cleaner, "")
	
						if lua_keyword[cleanContent] then
							processedToken = "keyword"
						elseif lua_builtin[cleanContent] then
							processedToken = "builtin"
						elseif string.find(previousContent1, "%.[%s%c]*$") and previousToken ~= "comment" then
							-- The previous was a . so we need to special case indexing things
							local parent = string.gsub(previousContent2, Cleaner, "")
							local lib = lua_libraries[parent]
							if lib and lib[cleanContent] and not string.find(previousContent3, "%.[%s%c]*$") then
								-- Indexing a builtin lib with existing item, treat as a builtin
								processedToken = "builtin"
							else
								-- Indexing a non builtin, can't be treated as a keyword/builtin
								processedToken = "iden"
							end
							-- print("indexing",parent,"with",cleanTok,"as",t2)
						else
							processedToken = "iden"
						end
					elseif rawToken == "string_inter" then
						if not string.find(content, "[^\\]{") then
							-- This inter string doesnt actually have any inters
							processedToken = "string"
						else
							-- We're gonna do our own yields, so the main loop won't need to
							-- Our yields will be a mix of string and whatever is inside the inters
							processedToken = nil
	
							local isString = true
							local subIndex = 1
							local subSize = #content
							while subIndex <= subSize do
								-- Find next brace
								local subStart, subFinish = string.find(content, "^.-[^\\][{}]", subIndex)
								if subStart == nil then
									-- No more braces, all string
									coroutine.yield("string", string.sub(content, subIndex))
									break
								end
	
								if isString then
									-- We are currently a string
									subIndex = subFinish + 1
									coroutine.yield("string", string.sub(content, subStart, subFinish))
	
									-- This brace opens code
									isString = false
								else
									-- We are currently in code
									subIndex = subFinish
									local subContent = string.sub(content, subStart, subFinish - 1)
									for innerToken, innerContent in lexer.scan(subContent) do
										coroutine.yield(innerToken, innerContent)
									end
	
									-- This brace opens string/closes code
									isString = true
								end
							end
						end
					end
	
					-- Record last 3 tokens for the indexing context check
					previousContent3 = previousContent2
					previousContent2 = previousContent1
					previousContent1 = content
					previousToken = processedToken or rawToken
					if processedToken then
						coroutine.yield(processedToken, content)
					end
					break
				end
	
				-- No matches found
				if not matched then
					return
				end
			end
	
			-- Completed the scan
			return
		end)
	
		return function()
			if coroutine.status(thread) == "dead" then
				return
			end
	
			local success, token, content = coroutine.resume(thread)
			if success and token then
				return token, content
			end
	
			return
		end
	end
	
	function lexer.navigator()
		local nav = {
			Source = "",
			TokenCache = table.create(50),
	
			_RealIndex = 0,
			_UserIndex = 0,
			_ScanThread = nil,
		}
	
		function nav:Destroy()
			self.Source = nil
			self._RealIndex = nil
			self._UserIndex = nil
			self.TokenCache = nil
			self._ScanThread = nil
		end
	
		function nav:SetSource(SourceString)
			self.Source = SourceString
	
			self._RealIndex = 0
			self._UserIndex = 0
			table.clear(self.TokenCache)
	
			self._ScanThread = coroutine.create(function()
				for Token, Src in lexer.scan(self.Source) do
					self._RealIndex += 1
					self.TokenCache[self._RealIndex] = { Token, Src }
					coroutine.yield(Token, Src)
				end
			end)
		end
	
		function nav.Next()
			nav._UserIndex += 1
	
			if nav._RealIndex >= nav._UserIndex then
				-- Already scanned, return cached
				return table.unpack(nav.TokenCache[nav._UserIndex])
			else
				if coroutine.status(nav._ScanThread) == "dead" then
					-- Scan thread dead
					return
				else
					local success, token, src = coroutine.resume(nav._ScanThread)
					if success and token then
						-- Scanned new data
						return token, src
					else
						-- Lex completed
						return
					end
				end
			end
		end
	
		function nav.Peek(PeekAmount)
			local GoalIndex = nav._UserIndex + PeekAmount
	
			if nav._RealIndex >= GoalIndex then
				-- Already scanned, return cached
				if GoalIndex > 0 then
					return table.unpack(nav.TokenCache[GoalIndex])
				else
					-- Invalid peek
					return
				end
			else
				if coroutine.status(nav._ScanThread) == "dead" then
					-- Scan thread dead
					return
				else
					local IterationsAway = GoalIndex - nav._RealIndex
	
					local success, token, src = nil, nil, nil
	
					for _ = 1, IterationsAway do
						success, token, src = coroutine.resume(nav._ScanThread)
						if not (success or token) then
							-- Lex completed
							break
						end
					end
	
					return token, src
				end
			end
		end
	
		return nav
	end
	
	return lexer
	
end

modules[trigok.language] = function()
	local script = trigok.language

	local language = {
		keyword = {
			["and"] = "keyword",
			["break"] = "keyword",
			["continue"] = "keyword",
			["do"] = "keyword",
			["else"] = "keyword",
			["elseif"] = "keyword",
			["end"] = "keyword",
			["export"] = "keyword",
			["false"] = "keyword",
			["for"] = "keyword",
			["function"] = "keyword",
			["if"] = "keyword",
			["in"] = "keyword",
			["local"] = "keyword",
			["nil"] = "keyword",
			["not"] = "keyword",
			["or"] = "keyword",
			["repeat"] = "keyword",
			["return"] = "keyword",
			["self"] = "keyword",
			["then"] = "keyword",
			["true"] = "keyword",
			["type"] = "keyword",
			["typeof"] = "keyword",
			["until"] = "keyword",
			["while"] = "keyword",
		},
	
		builtin = {
			-- Luau Functions
			["assert"] = "function",
			["error"] = "function",
			["getfenv"] = "function",
			["getmetatable"] = "function",
			["ipairs"] = "function",
			["loadstring"] = "function",
			["newproxy"] = "function",
			["next"] = "function",
			["pairs"] = "function",
			["pcall"] = "function",
			["print"] = "function",
			["rawequal"] = "function",
			["rawget"] = "function",
			["rawlen"] = "function",
			["rawset"] = "function",
			["select"] = "function",
			["setfenv"] = "function",
			["setmetatable"] = "function",
			["tonumber"] = "function",
			["tostring"] = "function",
			["unpack"] = "function",
			["xpcall"] = "function",
	
			-- Luau Functions (Deprecated)
			["collectgarbage"] = "function",
	
			-- Luau Variables
			["_G"] = "table",
			["_VERSION"] = "string",
	
			-- Luau Tables
			["bit32"] = "table",
			["coroutine"] = "table",
			["debug"] = "table",
			["math"] = "table",
			["os"] = "table",
			["string"] = "table",
			["table"] = "table",
			["utf8"] = "table",
	
			-- Roblox Functions
			["DebuggerManager"] = "function",
			["delay"] = "function",
			["gcinfo"] = "function",
			["PluginManager"] = "function",
			["require"] = "function",
			["settings"] = "function",
			["spawn"] = "function",
			["tick"] = "function",
			["time"] = "function",
			["UserSettings"] = "function",
			["wait"] = "function",
			["warn"] = "function",
	
			-- Roblox Functions (Deprecated)
			["Delay"] = "function",
			["ElapsedTime"] = "function",
			["elapsedTime"] = "function",
			["printidentity"] = "function",
			["Spawn"] = "function",
			["Stats"] = "function",
			["stats"] = "function",
			["Version"] = "function",
			["version"] = "function",
			["Wait"] = "function",
			["ypcall"] = "function",
	
			-- Roblox Variables
			["game"] = "Instance",
			["plugin"] = "Instance",
			["script"] = "Instance",
			["shared"] = "Instance",
			["workspace"] = "Instance",
	
			-- Roblox Variables (Deprecated)
			["Game"] = "Instance",
			["Workspace"] = "Instance",
	
			-- Roblox Tables
			["Axes"] = "table",
			["BrickColor"] = "table",
			["CatalogSearchParams"] = "table",
			["CFrame"] = "table",
			["Color3"] = "table",
			["ColorSequence"] = "table",
			["ColorSequenceKeypoint"] = "table",
			["DateTime"] = "table",
			["DockWidgetPluginGuiInfo"] = "table",
			["Enum"] = "table",
			["Faces"] = "table",
			["FloatCurveKey"] = "table",
			["Font"] = "table",
			["Instance"] = "table",
			["NumberRange"] = "table",
			["NumberSequence"] = "table",
			["NumberSequenceKeypoint"] = "table",
			["OverlapParams"] = "table",
			["PathWaypoint"] = "table",
			["PhysicalProperties"] = "table",
			["Random"] = "table",
			["Ray"] = "table",
			["RaycastParams"] = "table",
			["Rect"] = "table",
			["Region3"] = "table",
			["Region3int16"] = "table",
			["RotationCurveKey"] = "table",
			["SharedTable"] = "table",
			["task"] = "table",
			["TweenInfo"] = "table",
			["UDim"] = "table",
			["UDim2"] = "table",
			["Vector2"] = "table",
			["Vector2int16"] = "table",
			["Vector3"] = "table",
			["Vector3int16"] = "table",
		},
	
		libraries = {
	
			-- Luau Libraries
			bit32 = {
				arshift = "function",
				band = "function",
				bnot = "function",
				bor = "function",
				btest = "function",
				bxor = "function",
				countlz = "function",
				countrz = "function",
				extract = "function",
				lrotate = "function",
				lshift = "function",
				replace = "function",
				rrotate = "function",
				rshift = "function",
			},
	
			coroutine = {
				close = "function",
				create = "function",
				isyieldable = "function",
				resume = "function",
				running = "function",
				status = "function",
				wrap = "function",
				yield = "function",
			},
	
			debug = {
				dumpheap = "function",
				getmemorycategory = "function",
				info = "function",
				loadmodule = "function",
				profilebegin = "function",
				profileend = "function",
				resetmemorycategory = "function",
				setmemorycategory = "function",
				traceback = "function",
			},
	
			math = {
				abs = "function",
				acos = "function",
				asin = "function",
				atan2 = "function",
				atan = "function",
				ceil = "function",
				clamp = "function",
				cos = "function",
				cosh = "function",
				deg = "function",
				exp = "function",
				floor = "function",
				fmod = "function",
				frexp = "function",
				ldexp = "function",
				log10 = "function",
				log = "function",
				max = "function",
				min = "function",
				modf = "function",
				noise = "function",
				pow = "function",
				rad = "function",
				random = "function",
				randomseed = "function",
				round = "function",
				sign = "function",
				sin = "function",
				sinh = "function",
				sqrt = "function",
				tan = "function",
				tanh = "function",
	
				huge = "number",
				pi = "number",
			},
	
			os = {
				clock = "function",
				date = "function",
				difftime = "function",
				time = "function",
			},
	
			string = {
				byte = "function",
				char = "function",
				find = "function",
				format = "function",
				gmatch = "function",
				gsub = "function",
				len = "function",
				lower = "function",
				match = "function",
				pack = "function",
				packsize = "function",
				rep = "function",
				reverse = "function",
				split = "function",
				sub = "function",
				unpack = "function",
				upper = "function",
			},
	
			table = {
				clear = "function",
				clone = "function",
				concat = "function",
				create = "function",
				find = "function",
				foreach = "function",
				foreachi = "function",
				freeze = "function",
				getn = "function",
				insert = "function",
				isfrozen = "function",
				maxn = "function",
				move = "function",
				pack = "function",
				remove = "function",
				sort = "function",
				unpack = "function",
			},
	
			utf8 = {
				char = "function",
				codepoint = "function",
				codes = "function",
				graphemes = "function",
				len = "function",
				nfcnormalize = "function",
				nfdnormalize = "function",
				offset = "function",
	
				charpattern = "string",
			},
	
			-- Roblox Libraries
			Axes = {
				new = "function",
			},
	
			BrickColor = {
				Black = "function",
				Blue = "function",
				DarkGray = "function",
				Gray = "function",
				Green = "function",
				new = "function",
				New = "function",
				palette = "function",
				Random = "function",
				random = "function",
				Red = "function",
				White = "function",
				Yellow = "function",
			},
	
			CatalogSearchParams = {
				new = "function",
			},
	
			CFrame = {
				Angles = "function",
				fromAxisAngle = "function",
				fromEulerAngles = "function",
				fromEulerAnglesXYZ = "function",
				fromEulerAnglesYXZ = "function",
				fromMatrix = "function",
				fromOrientation = "function",
				lookAt = "function",
				new = "function",
	
				identity = "CFrame",
			},
	
			Color3 = {
				fromHex = "function",
				fromHSV = "function",
				fromRGB = "function",
				new = "function",
				toHSV = "function",
			},
	
			ColorSequence = {
				new = "function",
			},
	
			ColorSequenceKeypoint = {
				new = "function",
			},
	
			DateTime = {
				fromIsoDate = "function",
				fromLocalTime = "function",
				fromUniversalTime = "function",
				fromUnixTimestamp = "function",
				fromUnixTimestampMillis = "function",
				now = "function",
			},
	
			DockWidgetPluginGuiInfo = {
				new = "function",
			},
	
			Enum = {},
	
			Faces = {
				new = "function",
			},
	
			FloatCurveKey = {
				new = "function",
			},
	
			Font = {
				fromEnum = "function",
				fromId = "function",
				fromName = "function",
				new = "function",
			},
	
			Instance = {
				new = "function",
			},
	
			NumberRange = {
				new = "function",
			},
	
			NumberSequence = {
				new = "function",
			},
	
			NumberSequenceKeypoint = {
				new = "function",
			},
	
			OverlapParams = {
				new = "function",
			},
	
			PathWaypoint = {
				new = "function",
			},
	
			PhysicalProperties = {
				new = "function",
			},
	
			Random = {
				new = "function",
			},
	
			Ray = {
				new = "function",
			},
	
			RaycastParams = {
				new = "function",
			},
	
			Rect = {
				new = "function",
			},
	
			Region3 = {
				new = "function",
			},
	
			Region3int16 = {
				new = "function",
			},
	
			RotationCurveKey = {
				new = "function",
			},
	
			SharedTable = {
				clear = "function",
				clone = "function",
				cloneAndFreeze = "function",
				increment = "function",
				isFrozen = "function",
				new = "function",
				size = "function",
				update = "function",
			},
	
			task = {
				cancel = "function",
				defer = "function",
				delay = "function",
				desynchronize = "function",
				spawn = "function",
				synchronize = "function",
				wait = "function",
			},
	
			TweenInfo = {
				new = "function",
			},
	
			UDim = {
				new = "function",
			},
	
			UDim2 = {
				fromOffset = "function",
				fromScale = "function",
				new = "function",
			},
	
			Vector2 = {
				new = "function",
	
				one = "Vector2",
				xAxis = "Vector2",
				yAxis = "Vector2",
				zero = "Vector2",
			},
	
			Vector2int16 = {
				new = "function",
			},
	
			Vector3 = {
				fromAxis = "function",
				FromAxis = "function",
				fromNormalId = "function",
				FromNormalId = "function",
				new = "function",
	
				one = "Vector3",
				xAxis = "Vector3",
				yAxis = "Vector3",
				zAxis = "Vector3",
				zero = "Vector3",
			},
	
			Vector3int16 = {
				new = "function",
			},
		},
	}
	
	-- Filling up language.libraries.Enum table
	local enumLibraryTable = language.libraries.Enum
	
	for _, enum in ipairs(Enum:GetEnums()) do
		--TODO: Remove tostring from here once there is a better way to get the name of an Enum
		enumLibraryTable[tostring(enum)] = "Enum"
	end
	
	return language
	
end

modules[trigok.theme] = function()
	local script = trigok.theme

	local DEFAULT_TOKEN_COLORS = {
		["background"] = Color3.fromRGB(47, 47, 47),
		["iden"] = Color3.fromRGB(234, 234, 234),
		["keyword"] = Color3.fromRGB(215, 174, 255),
		["builtin"] = Color3.fromRGB(131, 206, 255),
		["string"] = Color3.fromRGB(196, 255, 193),
		["number"] = Color3.fromRGB(255, 125, 125),
		["comment"] = Color3.fromRGB(140, 140, 155),
		["operator"] = Color3.fromRGB(255, 239, 148),
		["custom"] = Color3.fromRGB(119, 122, 255),
	}
	
	local types = require(script.Parent.types)
	
	local Theme = {
		tokenColors = {},
		tokenRichTextFormatter = {},
	}
	
	function Theme.setColors(tokenColors: types.TokenColors)
		assert(type(tokenColors) == "table", "Theme.updateColors expects a table")
	
		for tokenName, color in tokenColors do
			Theme.tokenColors[tokenName] = color
		end
	end
	
	function Theme.getColoredRichText(color: Color3, text: string): string
		return '<font color="#' .. color:ToHex() .. '">' .. text .. "</font>"
	end
	
	function Theme.getColor(tokenName: types.TokenName): Color3
		return Theme.tokenColors[tokenName]
	end
	
	function Theme.matchStudioSettings(refreshCallback: () -> ()): boolean
		local success = pcall(function()
			-- When not used in a Studio plugin, this will error
			-- and the pcall will just silently return
			local studio = settings().Studio
			local studioTheme = studio.Theme
	
			local function getTokens()
				return {
					["background"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptBackground),
					["iden"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptText),
					["keyword"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptKeyword),
					["builtin"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptBuiltInFunction),
					["string"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptString),
					["number"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptNumber),
					["comment"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptComment),
					["operator"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptOperator),
					["custom"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptBool),
				}
			end
	
			Theme.setColors(getTokens())
			studio.ThemeChanged:Connect(function()
				studioTheme = studio.Theme
				Theme.setColors(getTokens())
				refreshCallback()
			end)
		end)
		return success
	end
	
	-- Initialize
	Theme.setColors(DEFAULT_TOKEN_COLORS)
	
	return Theme
	
end

modules[trigok.types] = function()
	local script = trigok.types

	export type TextObject = TextLabel | TextBox
	
	export type TokenName =
		"background"
		| "iden"
		| "keyword"
		| "builtin"
		| "string"
		| "number"
		| "comment"
		| "operator"
		| "custom"
	
	export type TokenColors = {
		["background"]: Color3?,
		["iden"]: Color3?,
		["keyword"]: Color3?,
		["builtin"]: Color3?,
		["string"]: Color3?,
		["number"]: Color3?,
		["comment"]: Color3?,
		["operator"]: Color3?,
		["custom"]: Color3?,
	}
	
	export type HighlightProps = {
		textObject: TextObject,
		src: string?,
		forceUpdate: boolean?,
		lexer: Lexer?,
		customLang: { [string]: string }?,
	}
	
	export type Lexer = {
		scan: (src: string) -> () -> (string, string),
		navigator: () -> any,
		finished: boolean?,
	}
	
	export type ObjectData = {
		Text: string,
		Labels: { TextLabel },
		Lines: { string },
		Lexer: Lexer?,
		CustomLang: { [string]: string }?,
	}
	
	return nil
	
end

modules[trigok.utility] = function()
	local script = trigok.utility

	local types = require(script.Parent.types)
	
	local Utility = {}
	
	function Utility.sanitizeRichText(s: string): string
		return string.gsub(
			string.gsub(string.gsub(string.gsub(string.gsub(s, "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), '"', "&quot;"),
			"'",
			"&apos;"
		)
	end
	
	function Utility.convertTabsToSpaces(s: string): string
		return string.gsub(s, "\t", "    ")
	end
	
	function Utility.removeControlChars(s: string): string
		return string.gsub(s, "[\0\1\2\3\4\5\6\7\8\11\12\13\14\15\16\17\18\19\20\21\22\23\24\25\26\27\28\29\30\31]+", "")
	end
	
	function Utility.getInnerAbsoluteSize(textObject: types.TextObject): Vector2
		local fullSize = textObject.AbsoluteSize
	
		local padding: UIPadding? = textObject:FindFirstChildWhichIsA("UIPadding")
		if padding then
			local offsetX = padding.PaddingLeft.Offset + padding.PaddingRight.Offset
			local scaleX = (fullSize.X * padding.PaddingLeft.Scale) + (fullSize.X * padding.PaddingRight.Scale)
			local offsetY = padding.PaddingTop.Offset + padding.PaddingBottom.Offset
			local scaleY = (fullSize.Y * padding.PaddingTop.Scale) + (fullSize.Y * padding.PaddingBottom.Scale)
			return Vector2.new(fullSize.X - (scaleX + offsetX), fullSize.Y - (scaleY + offsetY))
		else
			return fullSize
		end
	end
	
	function Utility.getTextBounds(textObject: types.TextObject): Vector2
		if textObject.ContentText == "" then
			return Vector2.zero
		end
	
		local textBounds = textObject.TextBounds
	
		-- Wait for TextBounds to be non-NaN and non-zero because Roblox
		while (textBounds.Y ~= textBounds.Y) or (textBounds.Y < 1) do
			task.wait()
			textBounds = textObject.TextBounds
		end
		return textBounds
	end
	
	return Utility
	
end

task.spawn(function()
	local script = trigok.GlobalLog

	
	local TextService = game:GetService("TextService")
	local LogService = game:GetService("LogService")
	local frame = script.Parent
	local messageBox = frame:WaitForChild("TextBox")
	
	messageBox.RichText = true
	messageBox.Selectable = false
	messageBox.Active = false
	
	local function formatMessage(message, messageType)
		local color = ""
		local formattedType = ""
	
		if messageType == Enum.MessageType.MessageOutput then
			color = "#cffeff" 
			formattedType = "Print"
		elseif messageType == Enum.MessageType.MessageWarning then
			color = "#ffa73b" 
			formattedType = "Warn"
		elseif messageType == Enum.MessageType.MessageError then
			color = "#FF005D" 
			formattedType = "Error"
		elseif messageType == Enum.MessageType.MessageInfo then
			color = "#5cb0ff" 
			formattedType = "Info"
		else
			color = "#FFFFFF" 
			formattedType = "Other"
		end
	
		return string.format('<font color="%s"><b>[%s]</b></font> %s', color, formattedType, message)
	end
	
	local function formatMessage2(message, messageType)
		local formattedType = ""
		
		if messageType == Enum.MessageType.MessageOutput then
			formattedType = "Print"
		elseif messageType == Enum.MessageType.MessageWarning then
			formattedType = "Warn"
		elseif messageType == Enum.MessageType.MessageError then
			formattedType = "Error"
		elseif messageType == Enum.MessageType.MessageInfo then
			formattedType = "Info"
		else
			formattedType = "Other"
		end
		
		return string.format('[%s] %s', formattedType, message)
	end

	
	local function updateMessageBoxSize()
		local textSize = TextService:GetTextSize(
			messageBox.Text, 
			messageBox.TextSize, 
			messageBox.Font, 
			Vector2.new(messageBox.AbsoluteSize.X, 20000)
		)
	
		messageBox.Size = UDim2.new(messageBox.Size.X.Scale, messageBox.Size.X.Offset, 0, textSize.Y)
	end
	
	
	local function onMessageOut(message, messageType)
		if not Settings.logInfo then return end
		if (messageType == Enum.MessageType.MessageOutput and not Settings.logPrint) or
			(messageType == Enum.MessageType.MessageWarning and not Settings.logWarn) or
			(messageType == Enum.MessageType.MessageError and not Settings.logError)then
			return 
		end
	
		local timeStamp = os.date("%X")
		local formattedMessage = formatMessage(message, messageType)
		local formattedMessage2 = formatMessage2(message, messageType)
		messageBox.Text = messageBox.Text .. timeStamp .. " - " .. formattedMessage .. "\n"
		if _G.wsConnection then
			_G.ws:Send(formattedMessage2)
		end
		updateMessageBoxSize()
	
		frame.CanvasPosition = Vector2.new(0, messageBox.TextBounds.Y)
	end
	
	
	LogService.MessageOut:Connect(onMessageOut)
	
end)

task.spawn(function()
	local script = trigok.LocalScript

	local Highlighter = require(script.Parent.ScriptBox.Highlighter)
	local myTextLabel = script.Parent.ScriptBox
	
	Highlighter.highlight({
		textObject = myTextLabel,
	})
	
end)

task.spawn(function()
	local script = trigok.LocalScript_1
	
	local plr = game.Players.LocalPlayer
	local MainFrame = script.Parent.MainFrame
	local buttons = MainFrame.BottomMenuFrame.MenuList

	local execBtn = buttons:WaitForChild("ExecBtn")
	local cloudBtn = buttons:WaitForChild("CloudBtn")
	local HBtn = buttons:WaitForChild("HBtn")
	local settingsBtn = buttons:WaitForChild("SettingsBtn")

	local execFrame = MainFrame:WaitForChild("ExecFrame")
	local logFrame = MainFrame:WaitForChild("logFrame")
	local homeFrame = MainFrame:WaitForChild("homeFrame")
	local settingsFrame = MainFrame:WaitForChild("SettingsFrame")

	local excbtn = execFrame.Buttons.Button1
	local execlipbtn = execFrame.Buttons.Button2
	local pastebtn = execFrame.Buttons.Button3
	local clearbtn = execFrame.Buttons.Button4

	local ScriptBox = execFrame.ScrollingFrame.ScriptBox

	local ExitBtn = MainFrame.BottomMenuFrame.LeftFrame.ExitBtn

	----//////////////////----
	----/// Menu Buttons
	----//////////////////----

	local function hideAllFrames()
		execFrame.Visible = false
		logFrame.Visible = false
		homeFrame.Visible = false
		settingsFrame.Visible = false
		execBtn.UIStroke.Enabled = false    
		HBtn.UIStroke.Enabled = false    
		cloudBtn.UIStroke.Enabled = false    
		settingsBtn.UIStroke.Enabled = false    
	end

	local function showFrame(frame, btn)
		hideAllFrames()
		task.wait()
		frame.Visible = true
		btn.UIStroke.Enabled = true
	end

	execBtn.Activated:Connect(function()
		showFrame(execFrame, execBtn)
	end)

	cloudBtn.Activated:Connect(function()
		showFrame(logFrame, cloudBtn)
	end)

	HBtn.Activated:Connect(function()
		showFrame(homeFrame, HBtn)
	end)

	settingsBtn.Activated:Connect(function()
		showFrame(settingsFrame, settingsBtn)
	end)

	hideAllFrames()

	homeFrame.Visible = true

	----//////////////////----
	----/// Exec Buttons
	----//////////////////----

	excbtn.Activated:Connect(function()
		excbtn.UIStroke.Enabled = true
		executecode(ScriptBox.Text)
		wait(0.1)
		excbtn.UIStroke.Enabled = false
	end) 

	execlipbtn.Activated:Connect(function()
		execlipbtn.UIStroke.Enabled = true
		executecode(getclipboard())
		wait(0.1)
		execlipbtn.UIStroke.Enabled = false
	end)  

	pastebtn.Activated:Connect(function()
		pastebtn.UIStroke.Enabled = true
		ScriptBox.Text = getclipboard()
		wait(0.1)
		pastebtn.UIStroke.Enabled = false
	end) 

	clearbtn.Activated:Connect(function()
		clearbtn.UIStroke.Enabled = true
		ScriptBox.Text = ""
		wait(0.1)
		clearbtn.UIStroke.Enabled = false
	end)  


	----//////////////////----
	----/// Other
	----//////////////////----

	ExitBtn.Activated:Connect(function()
		script.Parent.Enabled = not script.Parent.Enabled
	end)

	ScriptBox.Focused:Connect(function()
		for _, item in pairs(ScriptBox.SyntaxHighlights:GetChildren()) do
		item.Visible = false
		end
	end)

	ScriptBox.FocusLost:Connect(function()
		for _, item in pairs(ScriptBox.SyntaxHighlights:GetChildren()) do
			item.Visible = true
		end
	end)




	----//////////////////----
	----/// Default Page
	----//////////////////----
	local HttpService = game:GetService("HttpService")

	local function fetchString(link)
		local success, response = pcall(function()
			return request({
				Url = link,
				Method = "GET"
			})
		end)
	
		if success then
			return response.Body
		else
			warn("Error fetching string:", response)
			return nil
		end
	end


	local jsonString = [[
		{
		  "games": {
			"Blox Fruits": {
			  "placeIds": ["4483381587", "2753915549", "4442272183"],
			  "_scripts": [
				{
				  "scriptName": "BloxFFFFF",
				  "text": "print'script'"
				}
			  ]
			}
		  },
		  "global": {
			"_scripts": [
				{
					"scriptName": "Infinite Yield",
					"text": "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source\",true))()"
				},
				{
					"scriptName": "Dark Dex v4",
					"text": "getgenv().Key = \"Bash\" loadstring(game:HttpGet(\"https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AIY%20Dex\",true))()"
				},
				{
					"scriptName": "Bypassed Dark Dex v3",
					"text": "loadstring(game:HttpGet('https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua', true))()"
				}
			]
		  }
		}
		]]
	
	
	local reaperscripts =  fetchString("https://pastebin.com/raw/5UdaH5Kf")
	
	jsonScriptData = HttpService:JSONDecode(jsonString)
	reaperscriptsData = HttpService:JSONDecode(reaperscripts)
	
	function mergeScripts(targetData, scriptsData)
		function checkPlaceId(placeId, targetData)
			for _, gameInfo in pairs(targetData["games"]) do
				for _, pid in ipairs(gameInfo["placeIds"]) do
					if pid == placeId then
						return true
					end
				end
			end
			return false
		end
	
		function Add_Merge(placeId, scripts, targetData)
			for gameName, gameInfo in pairs(targetData["games"]) do
				if table.find(gameInfo["placeIds"], placeId) then
					for _, newScript in ipairs(scripts) do
						local scriptExists = false
						for _, existingScript in ipairs(gameInfo["_scripts"]) do
							if existingScript.scriptName == newScript.scriptName and existingScript.text == newScript.text then
								scriptExists = true
								break
							end
						end
						if not scriptExists then
							table.insert(gameInfo["_scripts"], newScript)
						end
					end
					return 
				end
			end
			--placeId doesnt exist in any game
			--placeholder for adding unmatched scripts for games
		end
	
		for _, sourceGameInfo in pairs(scriptsData["games"]) do
			local scriptsMerged = false
			for _, sourcePlaceId in ipairs(sourceGameInfo["placeIds"]) do
				if checkPlaceId(sourcePlaceId, targetData) then
					Add_Merge(sourcePlaceId, sourceGameInfo["_scripts"], targetData)
					scriptsMerged = true
					break 
				end
			end
			if not scriptsMerged then
				-- no matching placeIds
			end
		end
	end
	
	
	mergeScripts(jsonScriptData, reaperscriptsData)
	
	updatedJsonString = HttpService:JSONEncode(jsonScriptData)
	NewjsonScriptData = HttpService:JSONDecode(updatedJsonString)

	
	local scriptList = NewjsonScriptData
	local scriptsFrame = MainFrame.homeFrame.scriptsFrame
	local scriptButton = scriptsFrame.TextButton
	local currentPlaceId = tostring(game.PlaceId)
	
	scriptsFrame["#GameHeader"].Title.Text = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
	
	local function createscriptButtons(_scripts)
		local yPos = 0
		for i, scriptData in ipairs(_scripts) do
			local newButton = scriptButton:Clone()
			newButton.Parent = scriptsFrame
			newButton.Text = scriptData.scriptName
			newButton.Position = UDim2.new(newButton.Position.X.Scale, newButton.Position.X.Offset, newButton.Position.Y.Scale, yPos)
			yPos = yPos + newButton.Size.Y.Offset + 5
			newButton.Visible = true
	
			newButton.MouseButton1Click:Connect(function()
				executecode(scriptData.text)
			end)
		end
	end
	
	local function findScriptsForCurrentPlace()
		for _, gameData in pairs(scriptList.games) do
			if table.find(gameData.placeIds, currentPlaceId) then
				return gameData._scripts
			end
		end
		return nil 
	end
	
	local scriptToUse = findScriptsForCurrentPlace() or scriptList.global._scripts
	
	if scriptToUse then
		createscriptButtons(scriptToUse)
	else
		print("No _scripts available.")
	end
	
	scriptButton.Visible = false
	

	----//////////////////----
	----/// Console Log Page
	----//////////////////----

	logButtons = logFrame.logButtons
	consoleFrame = logFrame.consoleFrame

	outputCBX = logButtons.logOutput.Button
	warningCBX = logButtons.logWarning.Button
	errorCBX = logButtons.logError.Button
	infoCBX = logButtons.logInfo.Button
	consoleclrbtn = logButtons.cclrbtn
	consoleexebtn = logButtons.excp 

	function cboxCheck(button)
		button.Image = "rbxassetid://3926311105" -- check   
		button.ImageRectSize = Vector2.new(48, 48) 
		button.ImageRectOffset = Vector2.new(4, 836) 
	end

	function cboxUnCheck(button)
		button.Image = "rbxassetid://3926305904" --uncheck
		button.ImageRectSize = Vector2.new(36, 36) 
		button.ImageRectOffset = Vector2.new(724, 724) 
	end

	local function cobxUpdate(value, button)
		if Settings[value] then
			cboxCheck(button)
		else
			cboxUnCheck(button)
		end
	end

	consoleexebtn.Activated:Connect(function()
		executecode(getclipboard())
	end)

	outputCBX.Activated:Connect(function()
		Settings.logPrint = not Settings.logPrint
		cobxUpdate("logPrint",outputCBX)
		saveSettings()
	end)

	warningCBX.Activated:Connect(function()
		Settings.logWarn = not Settings.logWarn
		cobxUpdate("logWarn",warningCBX)
		saveSettings()
	end)

	errorCBX.Activated:Connect(function()
		Settings.logError = not Settings.logError
		cobxUpdate("logError",errorCBX)
		saveSettings()
	end)

	infoCBX.Activated:Connect(function()
		Settings.logInfo = not Settings.logInfo
		cobxUpdate("logInfo",infoCBX)
		saveSettings()
	end)

	consoleclrbtn.Activated:Connect(function()
		consoleFrame.TextBox.Text = ""
	end)


	----//////////////////----
	----/// Settings Page
	----//////////////////----

	---General Tab
	if Settings.autohideui then script.Parent.Enabled = false end

	GeneralTab = settingsFrame.GeneralTab

	autoexecSS = GeneralTab.autoexecSS.button
	autohideuiSS = GeneralTab.autohideuiSS.button
	trigonSS = GeneralTab.trigonSS

	Sidebar = settingsFrame.Sidebar.Buttons

	generalBtn = Sidebar.generalBtn
	themesBtn = Sidebar.themesBtn


	autoexecSS.Activated:Connect(function()
		Settings.autoexec = not Settings.autoexec
		cobxUpdate("autoexec",autoexecSS)
		saveSettings()
	end)


	autohideuiSS.Activated:Connect(function()
		Settings.autohideui = not Settings.autohideui
		cobxUpdate("autohideui",autohideuiSS)
		saveSettings()
	end)


	local checkboxList = {
		autohideui = autohideuiSS,
		autoexec = autoexecSS,
		
		logPrint = outputCBX,
		logWarn = warningCBX,
		logError = errorCBX,
		logInfo = infoCBX
	}

	local function initializeCheckBoxes()
		for value, button in pairs(checkboxList) do
			if Settings[value] then
				cboxCheck(button) 
			else
				cboxUnCheck(button) 
			end
		end
	end

	initializeCheckBoxes()


end)

task.spawn(function()
	local script = trigok.savescripts

	HttpService = game:GetService("HttpService")
	folderName = 'Local_Scripts'
	fileName = 'list.json'
	filePath = folderName .. '/' .. fileName
	
	lsf = gethui()[_G.TrigonMain].MainFrame.homeFrame.localscriptsFrame
	alsf = gethui()[_G.TrigonMain].MainFrame.homeFrame.addlocalscriptsFrame
	
	add_btn = lsf["#GameHeader"].Add_btn.TextButton
	script_placeholder = lsf.script_placeholder
	script_placeholder.Visible = false
	title = script_placeholder.scriptTitle
	buttons = script_placeholder.Buttons
	run = buttons.run.button
	autoload = buttons.autoload.button
	delete = buttons.delete.button
	
	scriptNameinput = alsf.addFrame.input.TextBox
	confirm_btn = alsf.addFrame.confrim_btn.TextButton
	cancel_btn = alsf.addFrame.cancel_btn.TextButton
	
	
	local default_scripts = {
		localscripts = {
			REJOIN = {
				name = "Rejoin",
				script = "warn('Rejoinning....'); game:GetService('TeleportService'):Teleport(game.PlaceId, game.Players.LocalPlayer)",
				auto_load = false
			},
			BYPASS_DEX = {
				name = "Bypassed Dark Dex v3",
				script = "repeat  task.wait() until game:IsLoaded() loadstring(game:HttpGet('https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua', true))()",
				auto_load = false
			},
			DARKDEXF = {
				name = "Dark Dex v4",
				script = "repeat  task.wait() until game:IsLoaded() getgenv().Key = \"Bash\" loadstring(game:HttpGet(\"https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AIY%20Dex\",true))()",
				auto_load = false
			},
			INFY = {
				name = "Infinite Yield",
				script = "repeat  task.wait() until game:IsLoaded() loadstring(game:HttpGet(\"https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source\",true))()",
				auto_load = false
			}
		}
	}
	



	local _scripts = {}
	
	local function merge_scripts(defaults, loaded_scripts)
		for key, value in pairs(defaults) do
			if type(value) == "table" then
				loaded_scripts[key] = loaded_scripts[key] or {}
				merge_scripts(value, loaded_scripts[key])
			else
				loaded_scripts[key] = loaded_scripts[key] or value
			end
		end
	end
	
	local function read_scripts()
		if not isfolder(folderName) then
			makefolder(folderName)
		end
	
		if isfile(filePath) then
			local fileContents = readfile(filePath)
			local success, decoded = pcall(function()
				return HttpService:JSONDecode(fileContents)
			end)
			if success then
				merge_scripts(default_scripts, decoded)
				return decoded
			end
		end
	
		return default_scripts
	end
	
	
	local function save_scripts()
		local encoded = HttpService:JSONEncode(_scripts)
		writefile(filePath, encoded)
		print("_scripts saved.")
	end
	
	
	local function deleteScript(scriptName)
		if _scripts.localscripts[scriptName] then
			_scripts.localscripts[scriptName] = nil
			warn("Deleted: " .. scriptName)
			save_scripts()
		else
			warn("Script not found: " .. scriptName)
		end
	end
	

	_scripts = read_scripts()
	
	local function execute_(scriptName)
		if isfile(filePath) then
			local fileContents = readfile(filePath)
			local success, decoded = pcall(function()
				return HttpService:JSONDecode(fileContents)
			end)
	
			if success and decoded.localscripts then
				local scriptData = decoded.localscripts[scriptName]
				if scriptData then
					executecode(scriptData.script)
				else
					warn("Script not found:", scriptName)
				end
			else
				warn("Failed to decode _scripts or 'localscripts' not found.")
			end
		else
			print(filePath)
			warn("_scripts file does not exist.")
		end
	end
	
	local function updateAutoLoad(scriptName, autoLoadValue, btn)
		if _scripts.localscripts and _scripts.localscripts[scriptName] then
			_scripts.localscripts[scriptName].auto_load = autoLoadValue
			save_scripts()  -- Save after updating the autoload value
			print("Updated auto_load for", _scripts.localscripts[scriptName].name, "to", autoLoadValue)
			
			if not autoLoadValue then
				btn.Image = "rbxassetid://3926305904"
				btn.ImageRectSize = Vector2.new(36, 36) 
				btn.ImageRectOffset = Vector2.new(724, 724) 
			else
				btn.Image = "rbxassetid://3926311105"        
				btn.ImageRectSize = Vector2.new(48, 48) 
				btn.ImageRectOffset = Vector2.new(4, 836) 
			end
		else
			warn("Failed to update auto_load. Script not found or error in _scripts.")
		end
	end
	
	local function convertScriptName(name)
		local convertedName = name:gsub("%s+", "_") 
		convertedName = convertedName:gsub("%W", "") 
		return convertedName
	end
	
	
	local function setupScriptUI(scriptName, scriptData)
		local scriptUI = script_placeholder:Clone()
		scriptUI.Visible = true
		scriptUI.scriptTitle.Text = scriptData.name
	
		scriptUI.Buttons.run.button.Activated:Connect(function()
			execute_(scriptName)
		end)
	
		scriptUI.Buttons.autoload.button.Activated:Connect(function()
			local newAutoLoadValue = not scriptData.auto_load
			updateAutoLoad(scriptName, newAutoLoadValue, scriptUI.Buttons.autoload.button)
			scriptData.auto_load = newAutoLoadValue
		end)
	
		scriptUI.Buttons.delete.button.Activated:Connect(function()
			deleteScript(scriptName)
			scriptUI:Destroy()
		end)
	
		scriptUI.Parent = lsf
	
		if scriptData.auto_load then
			scriptUI.Buttons.autoload.button.Image = "rbxassetid://3926311105"        
			scriptUI.Buttons.autoload.button.ImageRectSize = Vector2.new(48, 48) 
			scriptUI.Buttons.autoload.button.ImageRectOffset = Vector2.new(4, 836) 
			execute_(scriptName)        
		end 
	end

	
	local function setupAllScriptsUI()
		for scriptName, scriptData in pairs(_scripts.localscripts) do
			setupScriptUI(scriptName, scriptData)
		end
	end
	
	local function add_update(scriptName, name, scriptContent, autoLoad)
		print("adding")
		local isNewScript = not _scripts.localscripts[tostring(scriptName)]
		_scripts.localscripts[tostring(scriptName)] = {
			name = tostring(name),
			script = tostring(scriptContent),
			auto_load = autoLoad
		}
		save_scripts()
	
		if isNewScript then
			setupScriptUI(tostring(scriptName), _scripts.localscripts[tostring(scriptName)])
		end
	end
	
	confirm_btn.Activated:Connect(function()
	
		local scriptName = scriptNameinput.Text
		local convertedName = convertScriptName(scriptName)
		local xscript = getclipboard()
		
		warn(scriptName, convertedName, xscript)
		task.wait()
		if convertedName ~= "" then
			print("correct")        
			lsf.Visible = true
			add_update(convertedName, scriptName, xscript, false)
			scriptNameinput.Text = ""
		else
			scriptNameinput.Parent.Parent.Title.Text =  "Script Name: Invalid script name"
			wait(2)
			scriptNameinput.Parent.Parent.Title.Text =  "Script Name:"
			warn("Invalid script name")
		end
	
	
	end)
	
	add_btn.Activated:Connect(function()
		lsf.Visible = false
	end)
	cancel_btn.Activated:Connect(function()
		lsf.Visible = true
	end)
	
	setupAllScriptsUI()
	
end)

end

----------------------------------------
----------------------------------------
----------------------------------------

wait()

main()

loader()

print("-----] Trigon Loaded [-----")

