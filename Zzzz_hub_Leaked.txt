--=========================================================
-- ZZZZ HUB 6 took 40 hours :D - OPTIMIZED VERSION
--=========================================================

-- Anti-Skid Protection & Obfuscation (Optimized)
_G._0x4A2B = {[1]="\108\111\99\97\108",[2]="\103\97\109\101",[3]="\71\101\116\83\101\114\118\105\99\101",[4]="\80\108\97\121\101\114\115",[5]="\76\111\99\97\108\80\108\97\121\101\114"}
_G._0x3F8C = function(_0x1A2B) 
    return _G._0x4A2B[_0x1A2B] or ""
end
_G._0x7E9D = _G._0x3F8C(1) .. " " .. _G._0x3F8C(2) .. " = " .. _G._0x3F8C(2) .. ":" .. _G._0x3F8C(3) .. "(" .. _G._0x3F8C(4) .. "):" .. _G._0x3F8C(5) .. "()"

-- Global variable declarations to reduce local variable usage
_G.Services = {
    Players = game:GetService("Players"),
    RunService = game:GetService("RunService"),
    UserInputService = game:GetService("UserInputService"),
    TweenService = game:GetService("TweenService"),
    HttpService = game:GetService("HttpService"),
    TeleportService = game:GetService("TeleportService")
}
_G.player = _G.Services.Players.LocalPlayer
pcall(function()
    _G.character = _G.player.Character or _G.player.CharacterAdded:Wait()
    _G.humanoid = _G.character:FindFirstChildOfClass("Humanoid")
    _G.humanoidRootPart = _G.character:FindFirstChild("HumanoidRootPart")
end)

-- Safe execution of obfuscated code
pcall(function()
    loadstring(_G._0x7E9D)()
end)

-- Anti-Debug Protection (Optimized)
_G._0x9B2C = function()
    pcall(function()
        _G._0x5D8E = debug.getinfo
        if _G._0x5D8E then
            _G._0x2F4A = _G._0x5D8E(1, "S")
            if _G._0x2F4A and _G._0x2F4A.source and _G._0x2F4A.source:find("@") then
                game:GetService("Players").LocalPlayer:Kick("stop trying to skid kid")
            end
        end
    end)
end
pcall(_G._0x9B2C)

-- Advanced Anti-Exploit System
if not hookmetamethod then
    warn(
        '[Anti-Exploit] Your exploit does not support hookmetamethod. Exiting.'
    )
    return
end

-- Executor Compatibility Checks
_G.checkExecutorSupport = function()
    _G.compatibility = {
        hookmetamethod = hookmetamethod ~= nil,
        getrawmetatable = getrawmetatable ~= nil,
        setrawmetatable = setrawmetatable ~= nil,
        islclosure = islclosure ~= nil,
        newcclosure = newcclosure ~= nil,
        sethiddenproperty = sethiddenproperty ~= nil,
        gethiddenproperty = gethiddenproperty ~= nil,
        getgenv = getgenv ~= nil,
        getrenv = getrenv ~= nil,
        writefile = writefile ~= nil,
        readfile = readfile ~= nil,
        isfile = isfile ~= nil,
        delfile = delfile ~= nil,
        listfiles = listfiles ~= nil,
        makefolder = makefolder ~= nil,
        isfolder = isfolder ~= nil,
        delfolder = delfolder ~= nil,
        listfolders = listfolders ~= nil,
        gethui = gethui ~= nil,
        get_hidden_ui = get_hidden_ui ~= nil,
        syn = syn ~= nil,
        http_request = http_request ~= nil,
        request = request ~= nil,
        gameHttpGet = game.HttpGet ~= nil
    }
    
    print("🔍 Executor Compatibility Check:")
    for feature, supported in pairs(_G.compatibility) do
        print("  " .. (supported and "✅" or "❌") .. " " .. feature)
    end
    
    return _G.compatibility
end

_G.EXECUTOR_SUPPORT = _G.checkExecutorSupport()

-- Safe File Operations
_G.safeWriteFile = function(path, content)
    if not _G.EXECUTOR_SUPPORT.writefile then
        warn("❌ writefile not supported on this executor")
        return false
    end
    local success, err = pcall(writefile, path, content)
    if not success then
        warn("❌ Failed to write file: " .. tostring(err))
        return false
    end
    return true
end

_G.safeReadFile = function(path)
    if not _G.EXECUTOR_SUPPORT.readfile then
        warn("❌ readfile not supported on this executor")
        return nil
    end
    local success, content = pcall(readfile, path)
    if not success then
        warn("❌ Failed to read file: " .. tostring(content))
        return nil
    end
    return content
end

_G.safeIsFile = function(path)
    if not _G.EXECUTOR_SUPPORT.isfile then
        return false
    end
    local success, exists = pcall(isfile, path)
    return success and exists
end

_G.safeMakeFolder = function(path)
    if not _G.EXECUTOR_SUPPORT.makefolder then
        warn("❌ makefolder not supported on this executor")
        return false
    end
    local success, err = pcall(makefolder, path)
    if not success then
        warn("❌ Failed to create folder: " .. tostring(err))
        return false
    end
    return true
end

-- Safe Hidden Property Operations
_G.safeSetHiddenProperty = function(instance, property, value)
    if not _G.EXECUTOR_SUPPORT.sethiddenproperty then
        warn("❌ sethiddenproperty not supported on this executor")
        return false
    end
    local success, err = pcall(sethiddenproperty, instance, property, value)
    if not success then
        warn("❌ Failed to set hidden property: " .. tostring(err))
        return false
    end
    return true
end

_G.safeGetHiddenProperty = function(instance, property)
    if not _G.EXECUTOR_SUPPORT.gethiddenproperty then
        warn("❌ gethiddenproperty not supported on this executor")
        return nil
    end
    local success, value = pcall(gethiddenproperty, instance, property)
    if not success then
        warn("❌ Failed to get hidden property: " .. tostring(value))
        return nil
    end
    return value
end

-- Safe HTTP Operations
_G.safeHttpGet = function(url)
    if _G.EXECUTOR_SUPPORT.http_request then
        local success, response = pcall(http_request, {
            Url = url,
            Method = "GET"
        })
        if success and response and response.Body then
            return response.Body
        end
    elseif _G.EXECUTOR_SUPPORT.request then
        local success, response = pcall(request, {
            Url = url,
            Method = "GET"
        })
        if success and response and response.Body then
            return response.Body
        end
    elseif _G.EXECUTOR_SUPPORT.gameHttpGet then
        local success, response = pcall(game.HttpGet, game, url)
        if success then
            return response
        end
    else
        warn("❌ No HTTP GET method available on this executor")
    end
    return nil
end

local AE = {
	-- Services: lazy-cache
	S = setmetatable({}, {
		__index = function(t, k)
			local v = game:GetService(k)
			rawset(t, k, v)
			return v
		end,
	}),

	CFG = {
		KickEnabled = true, -- Still kicks but prevents stack overflow
		CrashEnabled = false,
		NotifyEnabled = false, -- Disable notifications to prevent conflicts

		ScanInterval = 2.0, -- Much slower scanning to prevent stack overflow
		ConsecutiveHooksRequired = 3, -- Moderate detection threshold

		SpyTextPhrases = {
			'clear logs',
			'exclude',
			'excludes',
			'ignore remotes',
		},
		BlacklistedPrintPhrases = {
			'blacklisted',
			'remotespy',
			'dex explorer',
		},

		DexStrictNames = {
			['ExplorerSelections'] = true,
			['EditAttributeButton'] = true,
			['Dex'] = true,
			['DEX'] = true,
		},
		DexWatchImages = {
			['rbxassetid://5054663650'] = true,
			['rbxassetid://1427967925'] = true,
			['rbxassetid://9887697099'] = true,
			['rbxassetid://9887696628'] = true,
			['rbxassetid://9896472554'] = true,
			['rbxassetid://9887696922'] = true,
			['rbxassetid://9887696242'] = true,
			['http://www.roblox.com/asset/?id=413369623'] = true,
			['rbxassetid://169476802'] = true,
		},
	},

	-- state
	state = {
		original_namecall = nil,
		BASE = { FireServer = nil, InvokeServer = nil },
		dex_hits = 0,
		dex_lastHit = 0,
		consecutive = 0,
	},

	TEXT_CLASSES = { TextLabel = true, TextButton = true, TextBox = true },

	getnamecallmethod = getnamecallmethod or function()
		return ''
	end,
}

--============================== Helpers ==================================--

AE.tolower = function(s)
	local ok, v = pcall(string.lower, s)
	return (ok and type(v) == 'string') and v or ''
end

AE.is_c_closure = function(fn)
	local okIs, isLua = pcall(function()
		if islclosure then
			return islclosure(fn)
		end
		return nil
	end)
	if okIs and isLua ~= nil then
		return not isLua
	end
	local ok, src = pcall(function()
		return debug.info(fn, 's')
	end)
	if ok and type(src) == 'string' then
		return src == '[C]'
	end
	return true
end

AE.notify = function(title, text)
	if not AE.CFG.NotifyEnabled then
		return
	end
	pcall(function()
		AE.S.StarterGui:SetCore('SendNotification', {
			Title = title,
			Text = text or '',
			Duration = 5,
		})
	end)
	print(('[Anti-Exploit] %s - %s'):format(title, text or ''))
end

AE.applyPunishment = function(reason)
	local LP = AE.S.Players.LocalPlayer
	if AE.CFG.KickEnabled then
		pcall(function()
			LP:Kick(reason or 'Skid detected.')
		end)
	end
	if AE.CFG.CrashEnabled then
		task.spawn(function()
			while true do
				pcall(function()
					local a = {}
					for i = 1, 1e8 do
						a[i] = i
					end
				end)
			end
		end)
	end
	if not AE.CFG.KickEnabled and not AE.CFG.CrashEnabled then
		AE.notify(
			'Anti-Exploit Alert',
			tostring(reason or 'Suspicious activity')
		)
	end
end

--========================== Spy Text Detector ============================--

AE.textHasSpyPhrase = function(str)
	if type(str) ~= 'string' or #str == 0 then
		return false
	end
	local s = AE.tolower(str)
	for _, p in ipairs(AE.CFG.SpyTextPhrases) do
		if string.find(s, p, 1, true) then
			return true
		end
	end
	return false
end

AE.checkSpyText = function(inst)
	if not inst or not AE.TEXT_CLASSES[inst.ClassName] then
		return
	end
	local ok, txt = pcall(function()
		return inst.Text
	end)
	if ok and AE.textHasSpyPhrase(txt) then
		AE.applyPunishment('Spying on me is not cool.')
	end
end

AE.bindTextWatcher = function(inst)
	if not inst or not AE.TEXT_CLASSES[inst.ClassName] then
		return
	end
	AE.checkSpyText(inst)
	pcall(function()
		inst:GetPropertyChangedSignal('Text'):Connect(function()
			AE.checkSpyText(inst)
		end)
	end)
end

--======================= Remote Hook Detection ===========================--

AE.captureOriginals = function()
	local ok, mt = pcall(getrawmetatable, game)
	if ok and mt then
		AE.state.original_namecall = rawget(mt, '__namecall')
	end

	local e = Instance.new('RemoteEvent')
	AE.state.BASE.FireServer = e.FireServer
	e:Destroy()

	local f = Instance.new('RemoteFunction')
	AE.state.BASE.InvokeServer = f.InvokeServer
	f:Destroy()
end

AE.namecall_hooked_strict = function()
	local ok, mt = pcall(getrawmetatable, game)
	if not ok or not mt or not AE.state.original_namecall then
		return false
	end
	local cur = rawget(mt, '__namecall')
	if type(cur) ~= 'function' then
		return true
	end
	if cur == AE.state.original_namecall then
		return false
	end
	if not AE.is_c_closure(cur) then
		return true
	end
	return false
end

AE.fireserver_hooked_strict = function()
	if not AE.state.BASE.FireServer then
		return false
	end
	local e = Instance.new('RemoteEvent')
	local cur = e.FireServer
	e:Destroy()
	if type(cur) ~= 'function' then
		return true
	end
	if cur ~= AE.state.BASE.FireServer and not AE.is_c_closure(cur) then
		return true
	end
	return false
end

AE.invokeserver_hooked_strict = function()
	if not AE.state.BASE.InvokeServer then
		return false
	end
	local f = Instance.new('RemoteFunction')
	local cur = f.InvokeServer
	f:Destroy()
	if type(cur) ~= 'function' then
		return true
	end
	if cur ~= AE.state.BASE.InvokeServer and not AE.is_c_closure(cur) then
		return true
	end
	return false
end

AE.startHookScan = function()
	task.spawn(function()
		while true do
			pcall(function() -- Wrap in pcall to prevent crashes
				local hooked = AE.namecall_hooked_strict()
					or AE.fireserver_hooked_strict()
					or AE.invokeserver_hooked_strict()

				if hooked then
					AE.state.consecutive += 1
					if AE.state.consecutive >= AE.CFG.ConsecutiveHooksRequired then
						AE.applyPunishment('skid detected.')
						return
					end
				else
					AE.state.consecutive = 0
				end
			end)
			task.wait(AE.CFG.ScanInterval)
		end
	end)
end

--========================== Dex / Explorer Hunter ========================--

AE.wordHasBareDex = function(s)
	s = string.lower(s or '')
	if
		s:find('[^%a]dex[^%a]')
		or s:find('^dex[^%a]')
		or s:find('[^%a]dex$')
		or s == 'dex'
	then
		if not (s:find('index') or s:find('codex') or s:find('dexterity')) then
			return true
		end
	end
	return false
end

AE.looksLikeDexStrict = function(inst)
	if not inst then
		return false
	end

	if AE.CFG.DexStrictNames[inst.Name] then
		return true
	end

	if inst:IsA('ImageLabel') then
		local ok, img = pcall(function()
			return inst.Image
		end)
		if ok and img and AE.CFG.DexWatchImages[img] then
			return true
		end
	end

	if inst.Name == 'ExplorerSelections' then
		local p = inst.Parent
		if p and p.Name == 'RobloxGui' then
			return true
		end
	end

	if inst:IsA('ScreenGui') or inst:IsA('Frame') then
		if AE.wordHasBareDex(inst.Name) then
			local hasTypicalChild = false
			for _, d in ipairs(inst:GetDescendants()) do
				local n = d.Name
				if
					n == 'Explorer'
					or n == 'Properties'
					or n == 'TopBar'
					or n == 'RightPanel'
				then
					hasTypicalChild = true
					break
				end
			end
			if hasTypicalChild then
				return true
			end
		end
	end
	return false
end

AE.dexHit = function()
	local now = os.clock()
	if now - AE.state.dex_lastHit > 3.0 then -- Moderate time window
		AE.state.dex_hits = 0
	end
	AE.state.dex_lastHit = now
	AE.state.dex_hits += 1
	if AE.state.dex_hits >= 3 then -- Moderate threshold for kicking
		AE.applyPunishment(
			'skid detected.'
		)
	end
end

AE.checkDex = function(inst)
	local ok, res = pcall(AE.looksLikeDexStrict, inst)
	if ok and res then
		AE.dexHit()
	end
end

AE.bindNameWatcher = function(inst)
	if not inst or not inst.GetPropertyChangedSignal then
		return
	end
	pcall(function()
		inst:GetPropertyChangedSignal('Name'):Connect(function()
			AE.checkDex(inst)
		end)
	end)
end

--============================= Safe Print Hook ===========================--

AE.installPrintHook = function()
	-- Safe print hook that prevents stack overflow
	AE.oldPrint = print
	local hookActive = false
	
	local newPrint = function(...)
		if hookActive then
			return AE.oldPrint(...) -- Prevent recursion
		end
		
		hookActive = true
		local n = select('#', ...)
		for i = 1, n do
			local arg = select(i, ...)
			if type(arg) == 'string' then
				local s = AE.tolower(arg)
				for _, p in ipairs(AE.CFG.BlacklistedPrintPhrases) do
					if string.find(s, p, 1, true) then
						hookActive = false
						AE.applyPunishment('skid detected.')
						return -- block
					end
				end
			end
		end
		hookActive = false
		return AE.oldPrint(...)
	end

	-- Only hook if safe to do so
	pcall(function()
		if getgenv then
			getgenv().print = newPrint
		else
			_G.print = newPrint
		end
	end)
end

--=============================== Bootstrap ===============================--

do
	-- Reduced monitoring to prevent performance issues
	-- Only monitor new descendants, not existing ones
	AE.S.CoreGui.DescendantAdded:Connect(function(d)
		-- Only check for obvious threats, not everything
		pcall(function()
			AE.checkDex(d)
		end)
	end)

	-- Remote baseline + scanner (less aggressive)
	pcall(function()
		AE.captureOriginals()
		AE.startHookScan()
	end)

	-- Print hook (simplified)
	AE.installPrintHook()
end

-- String Obfuscation Helper (Optimized)
_G._0x8E3F = function(str)
    if not str then return "" end
    local result = ""
    for i = 1, #str do
        result = result .. string.char(string.byte(str, i) + 1)
    end
    return result
end

-- Function Name Scrambling (safe)
pcall(function()
    _G._0x1A2B = _G._0x8E3F("createProtectedScreenGui")
    _G._0x2B3C = _G._0x8E3F("createMobileCompatibleGui")
    _G._0x3C4D = _G._0x8E3F("detectExecutor")
end)

-- Mobile Executor Detection & Compatibility
_G.detectExecutor = function()
    _G.executor = "unknown"
    if getgenv and getgenv().executor then
        _G.executor = getgenv().executor
    elseif syn and syn.request then
        _G.executor = "synapse"
    elseif krnl and krnl.request then
        _G.executor = "krnl"
    elseif fluxus and fluxus.request then
        _G.executor = "fluxus"
    elseif is_sirhurt_closure then
        _G.executor = "sirhurt"
    elseif identifyexecutor then
        _G.executor = identifyexecutor()
    end
    return _G.executor
end

_G.executor = _G.detectExecutor()
_G.isMobile = _G.executor:find("mobile") or _G.executor:find("android") or _G.executor:find("ios")

-- Enhanced UI Creation for Mobile Compatibility
_G.createMobileCompatibleGui = function(name)
    _G.gui = nil
    
    -- Executor-specific optimizations
    if _G.isMobile then
        -- Mobile-specific methods
        _G.mobileMethods = {
            function()
                if syn and syn.protect_gui then
                    _G.gui = Instance.new("ScreenGui")
                    _G.gui.Name = name
                    _G.gui.ResetOnSpawn = false
                    _G.gui.Parent = game:GetService("CoreGui")
                    syn.protect_gui(_G.gui)
                    _G.gui.IgnoreGuiInset = true
                    return _G.gui
                end
            end,
            function()
                if gethui then
                    _G.gui = Instance.new("ScreenGui")
                    _G.gui.Name = name
                    _G.gui.ResetOnSpawn = false
                    _G.gui.Parent = gethui()
                    _G.gui.IgnoreGuiInset = true
                    return _G.gui
                end
            end,
            function()
                _G.gui = Instance.new("ScreenGui")
                _G.gui.Name = name
                _G.gui.ResetOnSpawn = false
                _G.gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
                _G.gui.IgnoreGuiInset = true
                return _G.gui
            end
        }
        
        for i, method in ipairs(_G.mobileMethods) do
            _G.success, _G.result = pcall(method)
            if _G.success and _G.result then
                return _G.result
            end
        end
    else
        -- PC-specific methods
        _G.pcMethods = {
            function() 
                if syn and syn.protect_gui then
                    _G.gui = Instance.new("ScreenGui")
                    _G.gui.Name = name
                    _G.gui.ResetOnSpawn = false
                    _G.gui.Parent = game:GetService("CoreGui")
                    syn.protect_gui(_G.gui)
                    return _G.gui
                end
            end,
            function()
                if gethui then
                    _G.gui = Instance.new("ScreenGui")
                    _G.gui.Name = name
                    _G.gui.ResetOnSpawn = false
                    _G.gui.Parent = gethui()
                    return _G.gui
                end
            end,
            function()
                if get_hidden_ui then
                    _G.gui = Instance.new("ScreenGui")
                    _G.gui.Name = name
                    _G.gui.ResetOnSpawn = false
                    _G.gui.Parent = get_hidden_ui()
                    return _G.gui
                end
            end,
            function()
                _G.gui = Instance.new("ScreenGui")
                _G.gui.Name = name
                _G.gui.ResetOnSpawn = false
                _G.gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
                return _G.gui
            end
        }
        
        for i, method in ipairs(_G.pcMethods) do
            _G.success, _G.result = pcall(method)
            if _G.success and _G.result then
                return _G.result
            end
        end
    end
    
    return nil
end

-- Mobile Touch Optimization
_G.optimizeForMobile = function(gui)
    if _G.isMobile then
        pcall(function()
            gui.IgnoreGuiInset = true
            gui.ResetOnSpawn = false
            gui.DisplayOrder = 999999999
            
            -- Mobile-specific attributes
            if gui.SetAttribute then
                gui:SetAttribute("MobileOptimized", true)
                gui:SetAttribute("TouchEnabled", true)
            end
        end)
    end
end

--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
local username = player.Name


local CONFIG = {
    Colors = {
        Background = Color3.fromRGB(18, 18, 18),
        Sidebar = Color3.fromRGB(22, 22, 22),
        Panel = Color3.fromRGB(28, 28, 28),
        Stroke = Color3.fromRGB(50, 50, 50),
        Text = Color3.fromRGB(240, 240, 240),
        SubText = Color3.fromRGB(160, 160, 160),
        Accent = Color3.fromRGB(14, 144, 210),
        Hover = Color3.fromRGB(40, 40, 40),
        Danger = Color3.fromRGB(220, 70, 70),
        SwitchOff = Color3.fromRGB(70, 70, 70),
        SwitchOn = Color3.fromRGB(14, 144, 210),
        SectionHeader = Color3.fromRGB(38, 38, 38),
        ESPHighlight = Color3.fromRGB(255, 0, 0),
        PlotESPHighlight = Color3.fromRGB(0, 255, 0),
        BrainrotESPHighlight = Color3.fromRGB(0, 0, 255), -- New color for Brainrot ESP
    },
    UI = {
        CornerRadius = UDim.new(0, 10),
        AnimationSpeed = 0.2,
        FrameSize = UDim2.new(0, 580, 0, 380),
        SidebarWidth = 140,
        MinimizedSize = UDim2.new(0, 580, 0, 40),
        SettingsFrameSize = UDim2.new(0, 400, 0, 300),
        TextSize = 14,
        TitleTextSize = 18,
        HeaderTextSize = 15,
        ButtonTextSize = 14,
        -- UI State Persistence
        IsMinimized = false,
        SettingsOpen = false,
        CurrentTab = "Movement",
        InputTextSize = 14,
        Font = Enum.Font.Gotham,
        TitleFont = Enum.Font.GothamBold,
        HeaderFont = Enum.Font.GothamBold,
        ButtonFont = Enum.Font.GothamMedium,
        InputFont = Enum.Font.Gotham,
        Transparency = 0,
        BackgroundTransparency = 0,
        StrokeTransparency = 0.4,
        HoverTransparency = 0.1,
        ActiveTransparency = 0.2,
    },
    ESP = {
        UpdateInterval = 0.1,
        PlayerESP = {
            ShowDistance = true,
            ShowItems = true,
            TextSize = 18,
            DistanceTextSize = 14,
            ItemTextSize = 12,
            UsernameColor = Color3.fromRGB(255, 255, 255),
            DistanceColor = Color3.fromRGB(255, 255, 255),
            ItemColor = Color3.fromRGB(255, 255, 255),
            HighlightColor = Color3.fromRGB(255, 0, 0),
            OutlineColor = Color3.fromRGB(0, 0, 0),
            OutlineTransparency = 0.4,
            FillTransparency = 1,
        },
        PlotESP = {
            ShowDistance = true,
            ShowOwner = true,
            ShowTime = true,
            TextSize = 16,
            DistanceTextSize = 14,
            OwnerTextSize = 16,
            TimeTextSize = 14,
            OwnerColor = Color3.fromRGB(255, 255, 255),
            DistanceColor = Color3.fromRGB(255, 255, 255),
            TimeColor = Color3.fromRGB(160, 160, 160),
            HighlightColor = Color3.fromRGB(0, 255, 0),
            OutlineColor = Color3.fromRGB(0, 0, 0),
            OutlineTransparency = 0.4,
            FillTransparency = 1,
        },
    },
    Movement = {
        Speed = 43,
        MaxSpeed = 45,
        JumpPower = 73.5,
        Rise = {
            Enabled = false,
            Speed = 5,
            MaxHeight = 500,
        },
        Unhittable = {
            IntermediateSize = { X = 2, Y = 20, Z = 1 },
            TallSize = { X = 2, Y = 40, Z = 1 },
        },
        Resize = {
            TargetSize = { X = 2, Y = 10, Z = 1 },
		},
		Float = {
			Enabled = false,
			DescentSpeed = 2.5, -- Downward speed (2.5 = gentle; adjust: 1 = slower, 4 = faster)
			VelocityBlend = 1, -- Slight randomization to avoid anti-cheat detection
        },
        Helicopter = {
            Enabled = false,
            RotationSpeed = 20, -- How fast to rotate
        },
        GrappleFlight = {
            Enabled = false,
            Speed = 150, -- Flight speed
        },
        InfiniteJump = {
            Enabled = false,
            JumpPower = 42, -- Jump velocity
            Cooldown = 0.2, -- Cooldown between jumps
        },
        BrainrotESP = {
            Enabled = false,
            TextSize = 20,
            DistanceTextSize = 16,
            UsernameColor = Color3.fromRGB(255, 215, 0), -- Gold color
            DistanceColor = Color3.fromRGB(255, 255, 255),
            HighlightColor = Color3.fromRGB(0, 0, 255), -- Blue highlight for brainrot
            OutlineColor = Color3.fromRGB(0, 0, 0),
            FillTransparency = 0.5,
		},
    },
    DiscordLink = "https://discord.gg/zzzzhub",
}

_G.OpenCircularToggles = {}  -- Sigma Table

-- Settings file path
local SETTINGS_FILE = "ZZZZ_HUB_Settings.json"

_G.saveSettings = function()
    pcall(function()
        local settings = {
            ESP = {
                PlayerESP = CONFIG.ESP.PlayerESP,
                PlotESP = CONFIG.ESP.PlotESP,
                BrainrotESP = CONFIG.ESP.BrainrotESP,
            },
            Movement = {
                Speed = CONFIG.Movement.Speed,
                MaxSpeed = CONFIG.Movement.MaxSpeed,
                JumpPower = CONFIG.Movement.JumpPower,
                Float = CONFIG.Movement.Float,
                Rise = CONFIG.Movement.Rise,
                Helicopter = CONFIG.Movement.Helicopter,
                GrappleFlight = CONFIG.Movement.GrappleFlight,
                InfiniteJump = CONFIG.Movement.InfiniteJump,
            },
            UI = CONFIG.UI,
            Colors = CONFIG.Colors,
            AntiKick = CONFIG.AntiKick,
            OpenCircularToggles = {},  -- Save open draggable toggle positions
            ToggleStates = _G.SavedToggleStates or {}  -- Save toggle states
        }
        -- Serialize OpenCircularToggles (UDim2 to table)
        for name, pos in pairs(_G.OpenCircularToggles) do
            settings.OpenCircularToggles[name] = {
                XScale = pos.X.Scale,
                XOffset = pos.X.Offset,
                YScale = pos.Y.Scale,
                YOffset = pos.Y.Offset
            }
        end
        local json = HttpService:JSONEncode(settings)
        if _G.safeWriteFile(SETTINGS_FILE, json) then
        print("💾 Settings saved successfully")
        else
            print("❌ Failed to save settings - using memory only")
        end
    end)
end

_G.loadSettings = function()
    pcall(function()
        if _G.safeIsFile("ZZZZ_HUB_Settings.json") then
            print("📁 Loading settings from file...")
            local fileContent = _G.safeReadFile("ZZZZ_HUB_Settings.json")
            if not fileContent then
                print("❌ Failed to read settings file - using defaults")
                return
            end
            local settings = HttpService:JSONDecode(fileContent)
            
            -- Load CONFIG values (safely, only if not nil)
            if settings.Movement then
                for key, value in pairs(settings.Movement) do
                    if CONFIG.Movement[key] and value ~= nil then
                        CONFIG.Movement[key] = value
                    end
                end
                -- Explicitly load Rise sub-properties with defaults
                if settings.Movement.Rise then
                    CONFIG.Movement.Rise.Enabled = settings.Movement.Rise.Enabled or false
                    CONFIG.Movement.Rise.Speed = settings.Movement.Rise.Speed or 5
                    CONFIG.Movement.Rise.MaxHeight = settings.Movement.Rise.MaxHeight or 500
                end
            end
            if settings.ESP then
                for key, value in pairs(settings.ESP) do
                    if CONFIG.ESP[key] and value ~= nil then
                        CONFIG.ESP[key] = value
                    end
                end
            end
            if settings.Colors then
                for key, value in pairs(settings.Colors) do
                    if CONFIG.Colors[key] and value ~= nil then
                        CONFIG.Colors[key] = value
                    end
                end
            end
            if settings.UI then
                for key, value in pairs(settings.UI) do
                    if value ~= nil then
                        CONFIG.UI[key] = value
                    end
                end
            end
            if settings.AntiKick and settings.AntiKick ~= nil then
                CONFIG.AntiKick = settings.AntiKick
            end
            
            -- Load OpenCircularToggles (deserialize to UDim2)
            if settings.OpenCircularToggles then
                _G.OpenCircularToggles = {}
                for name, posTable in pairs(settings.OpenCircularToggles) do
                    _G.OpenCircularToggles[name] = UDim2.new(posTable.XScale, posTable.XOffset, posTable.YScale, posTable.YOffset)
                end
            end
            
            -- Restore toggle states
            if settings.ToggleStates then
                _G.ESP_Enabled = settings.ToggleStates.PlayerESP or false
                _G.PlotESP_Enabled = settings.ToggleStates.PlotESP or false
                _G.PlotTimeESP_Enabled = settings.ToggleStates.PlotTimeESP or true
                _G.ServerHopActive = settings.ToggleStates.ServerHop or false
                CONFIG.Movement.Float.Enabled = settings.ToggleStates.Float or false
                CONFIG.Movement.Helicopter.Enabled = settings.ToggleStates.Helicopter or false
                if not CONFIG.AntiKick then CONFIG.AntiKick = {Enabled = false} end
                CONFIG.AntiKick.Enabled = settings.ToggleStates.AntiKick or false
                
                -- Store ALL toggle states for later restoration after UI creation (optimized)
                _G.SavedToggleStates = {
                    PlayerESP = settings.ToggleStates.PlayerESP or false,
                    PlotESP = settings.ToggleStates.PlotESP or false,
                    PlotTimeESP = settings.ToggleStates.PlotTimeESP or true,
                    BrainrotESP = settings.ToggleStates.BrainrotESP or false,
                    Invisibility = settings.ToggleStates.Invisibility or false,
                    Rise = settings.ToggleStates.Rise or false,
                    ServerHop = settings.ToggleStates.ServerHop or false,
                    Jump = settings.ToggleStates.Jump or false,
                    Speed = settings.ToggleStates.Speed or false,
                    HeightBypass = settings.ToggleStates.HeightBypass or false,
                    TallMode = settings.ToggleStates.TallMode or false,
                    Fling = settings.ToggleStates.Fling or false,
                    Helicopter = settings.ToggleStates.Helicopter or false,
                    Float = settings.ToggleStates.Float or false,
                    LaserCape = settings.ToggleStates.LaserCape or false,
                    AntiKick = settings.ToggleStates.AntiKick or false,
                    RagdollDesync = settings.ToggleStates.RagdollDesync or false
                }
            end
            print("✅ Settings loaded successfully!")
        else
            print("📁 No settings file found, using defaults")
        end
    end)
end

-- Comprehensive CONFIG validation and initialization
local function validateCONFIG()
    -- Ensure Colors table exists and has all required values
    if not CONFIG.Colors then CONFIG.Colors = {} end
    CONFIG.Colors.Background = CONFIG.Colors.Background or Color3.fromRGB(18, 18, 18)
    CONFIG.Colors.Sidebar = CONFIG.Colors.Sidebar or Color3.fromRGB(22, 22, 22)
    CONFIG.Colors.Panel = CONFIG.Colors.Panel or Color3.fromRGB(28, 28, 28)
    CONFIG.Colors.Stroke = CONFIG.Colors.Stroke or Color3.fromRGB(50, 50, 50)
    CONFIG.Colors.Text = CONFIG.Colors.Text or Color3.fromRGB(240, 240, 240)
    CONFIG.Colors.SubText = CONFIG.Colors.SubText or Color3.fromRGB(160, 160, 160)
    CONFIG.Colors.Accent = CONFIG.Colors.Accent or Color3.fromRGB(14, 144, 210)
    CONFIG.Colors.Hover = CONFIG.Colors.Hover or Color3.fromRGB(40, 40, 40)
    CONFIG.Colors.Danger = CONFIG.Colors.Danger or Color3.fromRGB(220, 70, 70)
    CONFIG.Colors.SwitchOff = CONFIG.Colors.SwitchOff or Color3.fromRGB(70, 70, 70)
    CONFIG.Colors.SwitchOn = CONFIG.Colors.SwitchOn or Color3.fromRGB(14, 144, 210)
    CONFIG.Colors.SectionHeader = CONFIG.Colors.SectionHeader or Color3.fromRGB(38, 38, 38)
    CONFIG.Colors.ESPHighlight = CONFIG.Colors.ESPHighlight or Color3.fromRGB(255, 0, 0)
    CONFIG.Colors.PlotESPHighlight = CONFIG.Colors.PlotESPHighlight or Color3.fromRGB(0, 255, 0)
    CONFIG.Colors.BrainrotESPHighlight = CONFIG.Colors.BrainrotESPHighlight or Color3.fromRGB(0, 0, 255)
    
    -- Ensure UI table exists and has all required values
    if not CONFIG.UI then CONFIG.UI = {} end
    CONFIG.UI.CornerRadius = CONFIG.UI.CornerRadius or UDim.new(0, 10)
    CONFIG.UI.AnimationSpeed = CONFIG.UI.AnimationSpeed or 0.2
    CONFIG.UI.FrameSize = CONFIG.UI.FrameSize or UDim2.new(0, 580, 0, 380)
    CONFIG.UI.SidebarWidth = CONFIG.UI.SidebarWidth or 140
    CONFIG.UI.MinimizedSize = CONFIG.UI.MinimizedSize or UDim2.new(0, 580, 0, 40)
    CONFIG.UI.SettingsFrameSize = CONFIG.UI.SettingsFrameSize or UDim2.new(0, 400, 0, 300)
    CONFIG.UI.TextSize = CONFIG.UI.TextSize or 14
    CONFIG.UI.TitleTextSize = CONFIG.UI.TitleTextSize or 18
    CONFIG.UI.HeaderTextSize = CONFIG.UI.HeaderTextSize or 15
    CONFIG.UI.ButtonTextSize = CONFIG.UI.ButtonTextSize or 14
    CONFIG.UI.IsMinimized = CONFIG.UI.IsMinimized or false
    CONFIG.UI.SettingsOpen = CONFIG.UI.SettingsOpen or false
    CONFIG.UI.CurrentTab = CONFIG.UI.CurrentTab or "Movement"
    CONFIG.UI.InputTextSize = CONFIG.UI.InputTextSize or 14
    CONFIG.UI.Font = CONFIG.UI.Font or Enum.Font.Gotham
    CONFIG.UI.TitleFont = CONFIG.UI.TitleFont or Enum.Font.GothamBold
    CONFIG.UI.HeaderFont = CONFIG.UI.HeaderFont or Enum.Font.GothamBold
    CONFIG.UI.ButtonFont = CONFIG.UI.ButtonFont or Enum.Font.GothamMedium
    CONFIG.UI.InputFont = CONFIG.UI.InputFont or Enum.Font.Gotham
    CONFIG.UI.Transparency = CONFIG.UI.Transparency or 0
    CONFIG.UI.BackgroundTransparency = CONFIG.UI.BackgroundTransparency or 0
    CONFIG.UI.StrokeTransparency = CONFIG.UI.StrokeTransparency or 0.4
    CONFIG.UI.HoverTransparency = CONFIG.UI.HoverTransparency or 0.1
    CONFIG.UI.ActiveTransparency = CONFIG.UI.ActiveTransparency or 0.2
    
    -- Ensure ESP table exists and has all required values
    if not CONFIG.ESP then CONFIG.ESP = {} end
    if not CONFIG.ESP.PlayerESP then CONFIG.ESP.PlayerESP = {} end
    CONFIG.ESP.PlayerESP.HighlightColor = CONFIG.ESP.PlayerESP.HighlightColor or Color3.fromRGB(255, 0, 0)
    CONFIG.ESP.PlayerESP.UsernameColor = CONFIG.ESP.PlayerESP.UsernameColor or Color3.fromRGB(255, 255, 255)
    CONFIG.ESP.PlayerESP.DistanceColor = CONFIG.ESP.PlayerESP.DistanceColor or Color3.fromRGB(255, 255, 255)
    CONFIG.ESP.PlayerESP.ItemColor = CONFIG.ESP.PlayerESP.ItemColor or Color3.fromRGB(255, 255, 255)
    CONFIG.ESP.PlayerESP.OutlineColor = CONFIG.ESP.PlayerESP.OutlineColor or Color3.fromRGB(0, 0, 0)
    CONFIG.ESP.PlayerESP.OutlineTransparency = CONFIG.ESP.PlayerESP.OutlineTransparency or 0.4
    CONFIG.ESP.PlayerESP.FillTransparency = CONFIG.ESP.PlayerESP.FillTransparency or 1
    
    if not CONFIG.ESP.PlotESP then CONFIG.ESP.PlotESP = {} end
    CONFIG.ESP.PlotESP.HighlightColor = CONFIG.ESP.PlotESP.HighlightColor or Color3.fromRGB(0, 255, 0)
    CONFIG.ESP.PlotESP.OwnerColor = CONFIG.ESP.PlotESP.OwnerColor or Color3.fromRGB(255, 255, 255)
    CONFIG.ESP.PlotESP.DistanceColor = CONFIG.ESP.PlotESP.DistanceColor or Color3.fromRGB(255, 255, 255)
    CONFIG.ESP.PlotESP.TimeColor = CONFIG.ESP.PlotESP.TimeColor or Color3.fromRGB(160, 160, 160)
    CONFIG.ESP.PlotESP.OutlineColor = CONFIG.ESP.PlotESP.OutlineColor or Color3.fromRGB(0, 0, 0)
    CONFIG.ESP.PlotESP.OutlineTransparency = CONFIG.ESP.PlotESP.OutlineTransparency or 0.4
    CONFIG.ESP.PlotESP.FillTransparency = CONFIG.ESP.PlotESP.FillTransparency or 1
    
    if not CONFIG.ESP.BrainrotESP then CONFIG.ESP.BrainrotESP = {} end
    CONFIG.ESP.BrainrotESP.Enabled = CONFIG.ESP.BrainrotESP.Enabled or false
    CONFIG.ESP.BrainrotESP.TextSize = CONFIG.ESP.BrainrotESP.TextSize or 20
    CONFIG.ESP.BrainrotESP.DistanceTextSize = CONFIG.ESP.BrainrotESP.DistanceTextSize or 16
    CONFIG.ESP.BrainrotESP.UsernameColor = CONFIG.ESP.BrainrotESP.UsernameColor or Color3.fromRGB(255, 215, 0)
    CONFIG.ESP.BrainrotESP.DistanceColor = CONFIG.ESP.BrainrotESP.DistanceColor or Color3.fromRGB(255, 255, 255)
    CONFIG.ESP.BrainrotESP.HighlightColor = CONFIG.ESP.BrainrotESP.HighlightColor or Color3.fromRGB(0, 0, 255)
    CONFIG.ESP.BrainrotESP.OutlineColor = CONFIG.ESP.BrainrotESP.OutlineColor or Color3.fromRGB(0, 0, 0)
    CONFIG.ESP.BrainrotESP.FillTransparency = CONFIG.ESP.BrainrotESP.FillTransparency or 0.5
    
    -- Ensure Movement table exists and has all required values
    if not CONFIG.Movement then CONFIG.Movement = {} end
    if not CONFIG.Movement.Float then CONFIG.Movement.Float = {} end
    CONFIG.Movement.Float.Enabled = CONFIG.Movement.Float.Enabled or false
    CONFIG.Movement.Float.DescentSpeed = CONFIG.Movement.Float.DescentSpeed or 4
    CONFIG.Movement.Float.VelocityBlend = CONFIG.Movement.Float.VelocityBlend or 1
    
    if not CONFIG.Movement.Helicopter then CONFIG.Movement.Helicopter = {} end
    CONFIG.Movement.Helicopter.Enabled = CONFIG.Movement.Helicopter.Enabled or false
    CONFIG.Movement.Helicopter.RotationSpeed = CONFIG.Movement.Helicopter.RotationSpeed or 50
    
    if not CONFIG.Movement.GrappleFlight then CONFIG.Movement.GrappleFlight = {} end
    CONFIG.Movement.GrappleFlight.Enabled = CONFIG.Movement.GrappleFlight.Enabled or false
    CONFIG.Movement.GrappleFlight.Speed = CONFIG.Movement.GrappleFlight.Speed or 150
    
    if not CONFIG.Movement.InfiniteJump then CONFIG.Movement.InfiniteJump = {} end
    CONFIG.Movement.InfiniteJump.Enabled = CONFIG.Movement.InfiniteJump.Enabled or false
    CONFIG.Movement.InfiniteJump.JumpPower = CONFIG.Movement.InfiniteJump.JumpPower or 42
    CONFIG.Movement.InfiniteJump.Cooldown = CONFIG.Movement.InfiniteJump.Cooldown or 0.2
    
    if not CONFIG.Movement.Rise then CONFIG.Movement.Rise = {} end
    CONFIG.Movement.Rise.Enabled = CONFIG.Movement.Rise.Enabled or false
    CONFIG.Movement.Rise.Speed = CONFIG.Movement.Rise.Speed or 5
    CONFIG.Movement.Rise.MaxHeight = CONFIG.Movement.Rise.MaxHeight or 500
    
end

-- Initialize CONFIG defaults before loading
validateCONFIG()

-- Load settings on startup
_G.loadSettings()

-- Re-validate CONFIG after loading to ensure no corruption
validateCONFIG()

-- Function to save UI state and ALL toggle states
_G.saveUIState = function()
    pcall(function()
        -- Initialize SavedToggleStates if not exists
        if not _G.SavedToggleStates then
            _G.SavedToggleStates = {}
        end
        
        -- Save ALL toggle states (optimized with table lookup to reduce local variables)
        local switchMap = {
            PlayerESP = playerESPSwitch,
            PlotESP = plotESPSwitch,
            BrainrotESP = brainrotESPSwitch,
            Invisibility = invisibilitySwitch,
            Jump = jumpSwitch,
            Speed = speedSwitch,
            HeightBypass = unhittableSwitchInstance,
            TallMode = resizeSwitchInstance,
            Fling = flingSwitchInstance,
            Helicopter = helicopterSwitch,
            GrappleFlight = grappleFlightSwitch,
            InfiniteJump = infiniteJumpSwitch,
            Float = floatSwitch,
            Rise = platformSwitch,
            AntiKick = antiKickSwitch,
            LaserCape = originalLaserCapeSwitch,
            RagdollDesync = ragdollDesyncSwitch,
            ServerHop = serverHopSwitch
        }
        
        -- Global ESP switches (override local ones if they exist)
        if _G.playerESPSwitch and _G.playerESPSwitch.get then
            switchMap.PlayerESP = _G.playerESPSwitch
        end
        if _G.plotESPSwitch and _G.plotESPSwitch.get then
            switchMap.PlotESP = _G.plotESPSwitch
        end
        
        for stateName, switch in pairs(switchMap) do
            if switch and switch.get then
                _G.SavedToggleStates[stateName] = switch.get()
                if stateName == "Rise" then
                    print("💾 Saving Platform state:", switch.get())
                end
            elseif stateName == "Rise" then
            print("⚠️ Platform switch not found for saving")
        end
        end
        
        -- Save UI state
        if mainFrame then
            CONFIG.UI.IsMinimized = isMinimized or false
        end
        if settingsFrame then
            CONFIG.UI.SettingsOpen = settingsFrame.Visible or false
        end
        CONFIG.UI.CurrentTab = activeSection or "Movement"
        
        _G.saveSettings()
    end)
end
-- Duplicate function removed - using the second createCircularToggleUI function

_G.applyLoadedToggleStates = function()
    pcall(function()
        -- Add a short delay to ensure all switches are initialized (fix for re-execute timing)
        task.wait(0.5)
        
        print("🔄 Restoring toggle states...")
        print("📁 SavedToggleStates exists:", _G.SavedToggleStates ~= nil)
        
            -- Map toggle names to their actual get/set handlers so reopened toggles still function correctly
            local function resolveToggleHandlers(name)
                if name == "Speed" then
                    return function() return speedSwitch and speedSwitch.get and speedSwitch.get() or false end,
                           function(state) if speedSwitch and speedSwitch.set then speedSwitch.set(state) end end
                elseif name == "Jump" then
                    return function() return jumpSwitch and jumpSwitch.get and jumpSwitch.get() or false end,
                           function(state) if jumpSwitch and jumpSwitch.set then jumpSwitch.set(state) end end
                elseif name == "Float" then
                    return function() return CONFIG.Movement.Float.Enabled end,
                           function(state) CONFIG.Movement.Float.Enabled = state; _G.saveSettings(); if state and player.Character then enableFloat(player.Character) end end
            elseif name == "Rise" or name == "Platform" then
                    return function() return CONFIG.Movement.Rise.Enabled end,
                       function(state) CONFIG.Movement.Rise.Enabled = state; _G.saveSettings(); if state and player.Character then enablePlatform(player.Character) end end
                elseif name == "Helicopter" then
                    return function() return CONFIG.Movement.Helicopter.Enabled end,
                           function(state) CONFIG.Movement.Helicopter.Enabled = state; _G.saveSettings(); if state and player.Character then enableHelicopter(player.Character) end end
                elseif name == "Invisibility" then
                    return function() return invisibilitySwitch and invisibilitySwitch.get and invisibilitySwitch.get() or false end,
                           function(state) if invisibilitySwitch and invisibilitySwitch.set then invisibilitySwitch.set(state) end end
                elseif name == "Player ESP" then
                    return function() return _G.ESP_Enabled end,
                           function(state) if state then enableESP() else disableESP() end end
                elseif name == "Plot ESP" then
                    return function() return _G.PlotESP_Enabled end,
                           function(state) if state then enablePlotESP() else disablePlotESP() end end
                elseif name == "Grapple Flight" then
                    return function() return CONFIG.Movement.GrappleFlight.Enabled end,
                           function(state) CONFIG.Movement.GrappleFlight.Enabled = state; _G.saveSettings(); if state and player.Character then enableGrappleFlight(player.Character) end end
                elseif name == "Infinite Jump" then
                    return function() return CONFIG.Movement.InfiniteJump.Enabled end,
                           function(state) CONFIG.Movement.InfiniteJump.Enabled = state; _G.saveSettings(); if state and player.Character then enableInfiniteJump(player.Character) end end
                elseif name == "Brainrot ESP" then
                    return function() return CONFIG.ESP.BrainrotESP.Enabled end,
                           function(state) CONFIG.ESP.BrainrotESP.Enabled = state; _G.saveSettings(); if state then enableBrainrotESP() else disableBrainrotESP() end end
                elseif name == "Mobile Desync" then
                    return function() return _G.mobileDesyncEnabled end,
                           function(state) _G.mobileDesyncEnabled = state end
                end
                -- Default no-op handlers
                return function() return false end, function(_) end
            end

        if _G.SavedToggleStates then
            print("📁 Found saved toggle states:", _G.SavedToggleStates)
            
            -- Optimized toggle restoration with table lookup
            local restoreMap = {
                PlayerESP = {switch = playerESPSwitch, name = "Player ESP"},
                PlotESP = {switch = plotESPSwitch, name = "Plot ESP"},
                BrainrotESP = {switch = brainrotESPSwitch, name = "Brainrot ESP"},
                Invisibility = {switch = invisibilitySwitch, name = "Invisibility"},
                Jump = {switch = jumpSwitch, name = "Jump"},
                Speed = {switch = speedSwitch, name = "Speed"},
                HeightBypass = {switch = unhittableSwitchInstance, name = "Height Bypass"},
                TallMode = {switch = resizeSwitchInstance, name = "Tall Mode"},
                Fling = {switch = flingSwitchInstance, name = "Fling"},
                Rise = {switch = platformSwitch, name = "Platform"},
                Helicopter = {switch = helicopterSwitch, name = "Helicopter"},
                GrappleFlight = {switch = grappleFlightSwitch, name = "Grapple Flight"},
                InfiniteJump = {switch = infiniteJumpSwitch, name = "Infinite Jump"},
                Float = {switch = floatSwitch, name = "Float"},
                AntiKick = {switch = antiKickSwitch, name = "Anti-Kick"},
                LaserCape = {switch = originalLaserCapeSwitch, name = "Laser Cape"},
                RagdollDesync = {switch = ragdollDesyncSwitch, name = "Ragdoll Desync"},
                ServerHop = {switch = serverHopSwitch, name = "Server Hop"}
            }
            
            -- Global ESP switches (override local ones if they exist)
            if _G.playerESPSwitch and _G.playerESPSwitch.set then
                restoreMap.PlayerESP = {switch = _G.playerESPSwitch, name = "Player ESP"}
            end
            if _G.plotESPSwitch and _G.plotESPSwitch.set then
                restoreMap.PlotESP = {switch = _G.plotESPSwitch, name = "Plot ESP"}
            end
            
            -- Set switches to their saved states AND create side toggles
            for stateName, data in pairs(restoreMap) do
                if data.switch and data.switch.set and _G.SavedToggleStates[stateName] then
                    print("✅ Setting " .. data.name .. " to enabled")
                    data.switch.set(true)
                    
                    -- Create side toggle for enabled switches
                    local getHandler, setHandler = resolveToggleHandlers(data.name)
                    if getHandler and setHandler then
                        pcall(function()
                            _G.createCircularToggleUI(data.name, getHandler, setHandler)
                            print("🎯 Created side toggle for: " .. data.name)
                        end)
                    end
                end
            end
        else
            print("❌ No saved toggle states found")
        end
        print("✅ Toggle restoration complete!")
        
        -- Restore UI state
        if CONFIG.UI.IsMinimized and mainFrame then
            mainFrame.Size = CONFIG.UI.MinimizedSize
            isMinimized = true
        end
        if CONFIG.UI.SettingsOpen and settingsFrame then
            settingsFrame.Visible = true
        end
        if CONFIG.UI.CurrentTab and sections[CONFIG.UI.CurrentTab] then
            activeSection = CONFIG.UI.CurrentTab
            for name, section in pairs(sections) do
                section.Visible = (name == CONFIG.UI.CurrentTab)
            end
            -- Update sidebar button colors
            for _, button in pairs(sidebar:GetChildren()) do
                if button:IsA("TextButton") and button.Name:match("Button$") then
                    local sectionName = button.Name:gsub("Button", "")
                    if sectionName == CONFIG.UI.CurrentTab then
                        button.BackgroundColor3 = CONFIG.Colors.Accent
                    else
                        button.BackgroundColor3 = CONFIG.Colors.Sidebar
                    end
                end
                end
            end

            -- Initialize other features after toggles are recreated. Wrap in pcalls to avoid aborting this thread.
        task.delay(2.0, function() -- Increased delay to ensure character is fully ready
            print("🔄 Reinitializing enabled features...")
            
            -- Wait for character to be fully loaded
            if not player.Character then
                print("⏳ Waiting for character to spawn...")
                player.CharacterAdded:Wait()
            end
            
            task.wait(1.0) -- Additional wait for character to be ready
            
            pcall(function()
                if _G.ESP_Enabled then 
                    print("🔄 Reinitializing Player ESP...")
                    enableESP() 
                    
                    -- Refresh Player ESP colors
                    task.wait(0.5)
                    for plr, data in pairs(_G.ESP_Data) do
                        if typeof(plr) == "Instance" and data.highlight and plr.Character then
                            pcall(function() 
                                data.highlight.FillColor = CONFIG.ESP.PlayerESP.HighlightColor
                                data.highlight.OutlineColor = CONFIG.ESP.PlayerESP.HighlightColor
                                print("🎨 Refreshed Player ESP color for: " .. plr.Name)
                            end)
                        end
                    end
                end
            end)
            
            pcall(function()
                if _G.PlotESP_Enabled then 
                    print("🔄 Reinitializing Plot ESP...")
                    enablePlotESP() 
                end
            end)
            
            pcall(function()
                if _G.PlotTimeESP_Enabled then 
                    print("🔄 Reinitializing Plot Time ESP...")
                    enablePlotTimeESP() 
                end
            end)
            
            pcall(function()
                if CONFIG.ESP.BrainrotESP.Enabled then 
                    print("🔄 Reinitializing Brainrot ESP...")
                    enableBrainrotESP() 
                end
            end)
            
            pcall(function()
                if _G.ServerHopActive then 
                    print("🔄 Reinitializing Server Hop...")
                    _G.toggleServerHop(true) 
                end
            end)
            
            pcall(function()
                if CONFIG.Movement.Float.Enabled and player.Character then 
                    print("🔄 Reinitializing Float...")
                    enableFloat(player.Character) 
                end
            end)
            
            pcall(function()
                if CONFIG.Movement.Helicopter.Enabled and player.Character then 
                    print("🔄 Reinitializing Helicopter...")
                    enableHelicopter(player.Character) 
                end
            end)
            
            pcall(function()
                if CONFIG.AntiKick.Enabled then 
                    print("🔄 Reinitializing Anti-Kick...")
                    enableAntiKick() 
                end
            end)
            
            pcall(function()
                if _G.mobileDesyncEnabled then 
                    print("🔄 Reinitializing Mobile Desync...")
                    enableMobileDesync() 
                end
            end)
            
                -- Re-enable movement features
            pcall(function()
                if _G.SavedToggleStates.Rise and player.Character then 
                    print("🔄 Reinitializing Platform...")
                    enablePlatform(player.Character) 
                end
            end)
            
            pcall(function()
                if _G.SavedToggleStates.Jump and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                    print("🔄 Reinitializing Jump Power...")
                    local hum = player.Character:FindFirstChildOfClass("Humanoid")
                    hum.UseJumpPower = true
                    hum.JumpPower = CONFIG.Movement.JumpPower
                end
            end)
            
            pcall(function()
                if _G.SavedToggleStates.Speed and player.Character then 
                    print("🔄 Reinitializing Speed...")
                    enableSpeed(player.Character) 
                end
            end)
            
            pcall(function()
                if _G.SavedToggleStates.Invisibility and player.Character then 
                    print("🔄 Reinitializing Invisibility...")
                    task.wait(0.5) -- Wait for character to be ready
                    setInvisibility(true) 
                end
            end)
            
            pcall(function()
                if _G.SavedToggleStates.HeightBypass and player.Character then 
                    print("🔄 Reinitializing Height Bypass...")
                    enableHeightBypass(player.Character) 
                end
            end)
            
            pcall(function()
                if _G.SavedToggleStates.TallMode and player.Character then 
                    print("🔄 Reinitializing Tall Mode...")
                    enableTallMode(player.Character) 
                end
            end)
            
            pcall(function()
                if _G.SavedToggleStates.Fling and player.Character then 
                    print("🔄 Reinitializing Fling...")
                    enableFling(player.Character) 
                end
            end)
            
            pcall(function()
                if _G.SavedToggleStates.GrappleFlight and player.Character then 
                    print("🔄 Reinitializing Grapple Flight...")
                    enableGrappleFlight(player.Character) 
                end
            end)
            
            pcall(function()
                if _G.SavedToggleStates.InfiniteJump and player.Character then 
                    print("🔄 Reinitializing Infinite Jump...")
                    enableInfiniteJump(player.Character) 
                end
            end)
            
            pcall(function()
                if _G.SavedToggleStates.LaserCape and player.Character then 
                    print("🔄 Reinitializing Laser Cape...")
                    enableLaserCape(player.Character) 
                end
            end)
            
            pcall(function()
                if _G.SavedToggleStates.RagdollDesync and player.Character then 
                    print("🔄 Reinitializing Ragdoll Desync...")
                    enableRagdollDesync(player.Character) 
                end
            end)
            
            print("✅ Feature reinitialization complete!")
        end)
        end)
end

--=========================================================
-- Safe UI Parent
--=========================================================
local function getSafeUiParent()
    local ok, hidden = pcall(function()
        if _G.EXECUTOR_SUPPORT.gethui then
            return gethui()
        elseif _G.EXECUTOR_SUPPORT.get_hidden_ui then
            return get_hidden_ui()
        elseif _G.EXECUTOR_SUPPORT.syn and syn.protect_gui then
            return function(gui) return gui end
        end
        return nil
    end)
    if ok and hidden then 
        return hidden 
    end
    
    -- Fallback to CoreGui if no safe UI is available
    print("⚠️ Using CoreGui as UI parent - may be visible to others")
    return CoreGui
end
local safeui = getSafeUiParent()

-- Helper function to create protected ScreenGui
local function createProtectedScreenGui(name, displayOrder)
    -- Use mobile-compatible GUI creation first
    _G.screenGui = _G.createMobileCompatibleGui(name)
    if _G.screenGui then
        _G.screenGui.DisplayOrder = displayOrder or 2^31-1
        -- Apply mobile optimizations
        _G.optimizeForMobile(_G.screenGui)
        -- Apply additional safety measures
        pcall(function()
            _G.screenGui.IgnoreGuiInset = true
            _G.screenGui.ResetOnSpawn = false
            if _G.screenGui.SetAttribute then
                _G.screenGui:SetAttribute("Hidden", true)
                _G.screenGui:SetAttribute("Executor", _G.executor)
            end
        end)
        return _G.screenGui
    end
    
    -- Fallback to original method
    _G.screenGui = Instance.new("ScreenGui")
    _G.screenGui.Name = name
    _G.screenGui.DisplayOrder = displayOrder or 2^31-1
    _G.screenGui.Parent = safeui
    _G.screenGui.ResetOnSpawn = false
    
    -- Apply GUI protection if available
    if syn and syn.protect_gui then
        syn.protect_gui(_G.screenGui)
    end
    
    -- Apply mobile optimizations
    _G.optimizeForMobile(_G.screenGui)
    
    -- Additional safety measures
    pcall(function()
        -- Make GUI less detectable
        _G.screenGui.IgnoreGuiInset = true
        _G.screenGui.ResetOnSpawn = false
        
        -- Hide from CoreGui detection if possible
        if _G.screenGui.SetAttribute then
            _G.screenGui:SetAttribute("Hidden", true)
            _G.screenGui:SetAttribute("Executor", _G.executor)
        end
    end)
    
    return _G.screenGui
end

-- Helper function to protect individual GUI elements
local function protectGuiElement(element)
    pcall(function()
        if syn and syn.protect_gui then
            syn.protect_gui(element)
        end
        
        -- Additional protection measures
        if element.SetAttribute then
            element:SetAttribute("Protected", true)
        end
    end)
end

--=========================================================
-- UI Configuration
--=========================================================
local namePrefix = "ZZZZ_"

--=========================================================
-- Character Essentials
--=========================================================
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character and character:WaitForChild("Humanoid", 5)
local humanoidRootPart = character and character:WaitForChild("HumanoidRootPart", 5)

-- Packages and Events
local UseItemEvent
local success, result = pcall(function()
    local packages = ReplicatedStorage:WaitForChild("Packages", 5)
    if packages then
        UseItemEvent = packages:FindFirstChild("Net") and packages.Net:FindFirstChild("RE/UseItem")
    end
    return UseItemEvent
end)
if not success or not result then
    warn("Failed to load packages or UseItemEvent: unsupported or missing")
end

--=========================================================
-- Helper Functions
--=========================================================
local function findPlayerPlot()
    local success, plot = pcall(function()
        local plotsFolder = workspace:FindFirstChild("Plots")
        if not plotsFolder then return nil end
        for _, plot in ipairs(plotsFolder:GetChildren()) do
            local plotSign = plot:FindFirstChild("PlotSign")
            if plotSign then
                local surfaceGui = plotSign:FindFirstChild("SurfaceGui")
                local frame = surfaceGui and surfaceGui:FindFirstChild("Frame")
                local textLabel = frame and frame:FindFirstChild("TextLabel")
                if textLabel and textLabel:IsA("TextLabel") and string.find(textLabel.Text, username) then
                    return plot
                end
            end
        end
        return nil
    end)
    if not success or not plot then
        warn("Could not find player plot: unsupported or error occurred")
        return nil
    end
    return plot
end
local playerPlot = findPlayerPlot()

local function getPlotOwner(plot)
    local success, owner = pcall(function()
        local plotSign = plot:FindFirstChild("PlotSign")
        if not plotSign then return nil end
        local surfaceGui = plotSign:FindFirstChild("SurfaceGui")
        local frame = surfaceGui and surfaceGui:FindFirstChild("Frame")
        local textLabel = frame and frame:FindFirstChild("TextLabel")
        if textLabel and textLabel:IsA("TextLabel") then
            return textLabel.Text
        end
        return nil
    end)
    if not success then
        return nil
    end
    return owner
end

local function getRemainingTime(plot)
    local success, timeText = pcall(function()
        -- Try the original path first
        local purchases = plot:FindFirstChild("Purchases")
        if purchases then
            local plotBlock = purchases:FindFirstChild("PlotBlock")
            if plotBlock then
                local main = plotBlock:FindFirstChild("Main")
                if main then
                    local billboardGui = main:FindFirstChild("BillboardGui")
                    if billboardGui then
                        local remainingTime = billboardGui:FindFirstChild("RemainingTime")
                        if remainingTime and remainingTime:IsA("TextLabel") then
                            return remainingTime.Text
                        end
                    end
                end
            end
        end

        -- Fallback: Search for BillboardGui in other locations
        local billboardGui = plot:FindFirstChild("BillboardGui", true) -- Recursive search
        if billboardGui then
            local remainingTime = billboardGui:FindFirstChild("RemainingTime")
            if remainingTime and remainingTime:IsA("TextLabel") then
                return remainingTime.Text
            end
        end

        -- Fallback: Check for time in StringValue or IntValue
        for _, obj in ipairs(plot:GetDescendants()) do
            if obj:IsA("StringValue") and obj.Name:lower():match("time") then
                return obj.Value
            elseif obj:IsA("IntValue") and obj.Name:lower():match("time") then
                return tostring(obj.Value) .. "s"
            end
        end

        -- If nothing is found, return a clear message
        return "Time: Unavailable"
    end)
    
    if not success then
        warn("Failed to get remaining time for plot: " .. plot.Name .. " - Error: " .. tostring(timeText))
        return "Time: Error"
    end
    
    return timeText or "Time: Unavailable"
end

local function setInvisibility(on)
    local success, _ = pcall(function()
        local currentCharacter = player.Character or character
        if not currentCharacter or not currentCharacter:FindFirstChild("Humanoid") then 
            print("❌ No character found for invisibility")
            return 
        end
        
        print("🔄 " .. (on and "Enabling" or "Disabling") .. " invisibility for character: " .. currentCharacter.Name)
        
        if on then
            for _, v in pairs(currentCharacter:GetChildren()) do
                if v:IsA("BasePart") then
                    _G.safeSetHiddenProperty(v, "NetworkIsSleeping", true)
                end
            end
            _G.safeSetHiddenProperty(currentCharacter.Humanoid, "OverrideDefaultCollisions", true)
            replicatesignal(currentCharacter.Humanoid.ServerBreakJoints)
            
            -- Add visual feedback
            for _, part in pairs(currentCharacter:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Transparency = 0.5 -- Make slightly transparent for visual feedback
                end
            end
            
            print("✅ Invisibility enabled - player should be transparent")
        else
            for _, v in pairs(currentCharacter:GetChildren()) do
                if v:IsA("BasePart") then
                    _G.safeSetHiddenProperty(v, "NetworkIsSleeping", false)
                end
            end
            _G.safeSetHiddenProperty(currentCharacter.Humanoid, "OverrideDefaultCollisions", false)
            
            -- Remove visual feedback
            for _, part in pairs(currentCharacter:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Transparency = 0 -- Make fully visible
                end
            end
            
            print("❌ Invisibility disabled - player should be visible")
        end
    end)
    if not success then
        warn("Failed to " .. (on and "enable" or "disable") .. " invisibility")
    end
end


--=========================================================
-- UI Setup: Cleaner Tabbed Navigation with Sidebar
--=========================================================


-- Circular Toggle UI System
_G.circularToggleGui = createProtectedScreenGui("CircularToggleUI")
protectGuiElement(_G.circularToggleGui)

-- Function to create toggle UI (rectangular with switch)
_G.createCircularToggleUI = function(toggleName, getState, setState)
    -- Check if toggle already exists and destroy it
    local existingToggle = _G.circularToggleGui:FindFirstChild(toggleName .. "ToggleUI")
    if existingToggle then
        existingToggle:Destroy()
    end
    
    -- Optimized toggle data structure to reduce local variables
    local toggleData = {
        frame = Instance.new("TextButton"),
        dragging = false,
        dragStart = nil,
        startPos = nil
    }
    
    -- Setup main frame
    toggleData.frame.Name = toggleName .. "ToggleUI"
    toggleData.frame.Size = UDim2.new(0, 220, 0, 70)
    -- Use saved position if available, otherwise position on right side
    local savedPosition = _G.OpenCircularToggles[toggleName]
    if not savedPosition then
        -- Calculate position on right side, stacked vertically
        local toggleCount = 0
        for name, _ in pairs(_G.OpenCircularToggles) do
            toggleCount = toggleCount + 1
        end
        savedPosition = UDim2.new(1, -230, 0, 10 + (toggleCount * 80))
    end
    toggleData.frame.Position = savedPosition
    toggleData.frame.BackgroundColor3 = CONFIG.Colors.Panel
    toggleData.frame.Text = ""
    toggleData.frame.AutoButtonColor = false
    toggleData.frame.Parent = _G.circularToggleGui
    Instance.new("UICorner", toggleData.frame).CornerRadius = UDim.new(0, 10)
    
    local stroke = Instance.new("UIStroke", toggleData.frame)
    stroke.Thickness = 2
    stroke.Color = CONFIG.Colors.Stroke
    stroke.Transparency = 0.2
    
    -- Create UI elements
    local elements = {
        dragHandle = Instance.new("TextButton"),
        closeBtn = Instance.new("TextButton"),
        titleLabel = Instance.new("TextLabel"),
        switchFrame = Instance.new("TextButton"),
        knob = Instance.new("Frame")
    }
    
    -- Setup drag handle
    elements.dragHandle.Size = UDim2.new(1, -70, 1, 0)
    elements.dragHandle.Position = UDim2.new(0, 0, 0, 0)
    elements.dragHandle.BackgroundTransparency = 1
    elements.dragHandle.Text = ""
    elements.dragHandle.AutoButtonColor = false
    elements.dragHandle.Parent = toggleData.frame
    
    -- Setup close button
    elements.closeBtn.Size = UDim2.new(0, 30, 0, 30)
    elements.closeBtn.Position = UDim2.new(1, -35, 0, 5)
    elements.closeBtn.BackgroundColor3 = CONFIG.Colors.Danger
    elements.closeBtn.Text = "x"
    elements.closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    elements.closeBtn.TextSize = 16
    elements.closeBtn.Font = Enum.Font.GothamBold
    elements.closeBtn.AutoButtonColor = false
    elements.closeBtn.Parent = toggleData.frame
    elements.closeBtn.ZIndex = 10
    Instance.new("UICorner", elements.closeBtn).CornerRadius = UDim.new(0, 15)
    
    -- Setup title label
    elements.titleLabel.Size = UDim2.new(1, -180, 0, 25)
    elements.titleLabel.Position = UDim2.new(0, 12, 0, 8)
    elements.titleLabel.BackgroundTransparency = 1
    elements.titleLabel.Text = toggleName
    elements.titleLabel.TextColor3 = CONFIG.Colors.Text
    elements.titleLabel.TextSize = 16
    elements.titleLabel.Font = Enum.Font.GothamBold
    elements.titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    elements.titleLabel.Parent = toggleData.frame
    
    -- Setup toggle switch
    elements.switchFrame.Size = UDim2.new(0, 60, 0, 30)
    elements.switchFrame.Position = UDim2.new(0, 100, 0.5, -15)
    elements.switchFrame.BackgroundColor3 = getState() and CONFIG.Colors.SwitchOn or CONFIG.Colors.SwitchOff
    elements.switchFrame.Text = ""
    elements.switchFrame.AutoButtonColor = false
    elements.switchFrame.Parent = toggleData.frame
    Instance.new("UICorner", elements.switchFrame).CornerRadius = UDim.new(0, 15)
    
    -- Setup knob
    elements.knob.Size = UDim2.new(0, 24, 0, 24)
    elements.knob.Position = UDim2.new(0, getState() and 30 or 3, 0, 3)
    elements.knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    elements.knob.Parent = elements.switchFrame
    Instance.new("UICorner", elements.knob).CornerRadius = UDim.new(0, 12)
    
    -- Optimized dragging functionality
    local function startDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            local inputPos = input.Position
            
            -- Check if clicking on close button or toggle switch (optimized collision detection)
            local closeBtnPos = elements.closeBtn.AbsolutePosition
            local closeBtnSize = elements.closeBtn.AbsoluteSize
            local switchPos = elements.switchFrame.AbsolutePosition
            local switchSize = elements.switchFrame.AbsoluteSize
            
            if (inputPos.X >= closeBtnPos.X and inputPos.X <= closeBtnPos.X + closeBtnSize.X and
                inputPos.Y >= closeBtnPos.Y and inputPos.Y <= closeBtnPos.Y + closeBtnSize.Y) or
               (inputPos.X >= switchPos.X and inputPos.X <= switchPos.X + switchSize.X and
                inputPos.Y >= switchPos.Y and inputPos.Y <= switchPos.Y + switchSize.Y) then
                return -- Don't start drag if clicking close button or toggle switch
            end
            
            -- Start drag
            toggleData.dragging = true
            toggleData.dragStart = input.Position
            toggleData.startPos = toggleData.frame.Position
            stroke.Transparency = 0 -- Visual feedback
        end
    end
    
    local function updateDrag(input)
        if toggleData.dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - toggleData.dragStart
            toggleData.frame.Position = UDim2.new(toggleData.startPos.X.Scale, toggleData.startPos.X.Offset + delta.X, toggleData.startPos.Y.Scale, toggleData.startPos.Y.Offset + delta.Y)
        end
    end
    
    local function endDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            toggleData.dragging = false
            stroke.Transparency = 0.2 -- Reset visual feedback
            _G.OpenCircularToggles[toggleName] = toggleData.frame.Position
            _G.saveSettings() -- Save position
        end
    end
    
    -- Connect drag events
    elements.dragHandle.InputBegan:Connect(startDrag)
    elements.dragHandle.InputChanged:Connect(updateDrag)
    elements.dragHandle.InputEnded:Connect(endDrag)
    
    -- Optimized switch functions
    local function updateSwitch()
        local currentState = getState()
        elements.switchFrame.BackgroundColor3 = currentState and CONFIG.Colors.SwitchOn or CONFIG.Colors.SwitchOff
        elements.knob.Position = UDim2.new(0, currentState and 30 or 3, 0, 3)
    end
    
    local function toggleSwitch()
        local newState = not getState()
        setState(newState)
        updateSwitch()
    end
    
    local function closeToggle()
        _G.OpenCircularToggles[toggleName] = nil
        _G.saveSettings()
        toggleData.frame:Destroy()
    end
    
    -- Connect switch events
    elements.switchFrame.MouseButton1Click:Connect(toggleSwitch)
    elements.switchFrame.TouchTap:Connect(toggleSwitch)
    elements.switchFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            toggleSwitch()
        end
    end)
    
    -- Connect close button events
    elements.closeBtn.MouseButton1Click:Connect(closeToggle)
    elements.closeBtn.TouchTap:Connect(closeToggle)
    
    -- Additional mobile support with InputBegan
    elements.closeBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            closeToggle()
        end
    end)
    
    -- Save the initial position when toggle is created (only if not already saved)
    if not _G.OpenCircularToggles[toggleName] then
        _G.OpenCircularToggles[toggleName] = toggleData.frame.Position
        _G.saveSettings()
    end
    
    return toggleData.frame
end


local screenGui = createProtectedScreenGui((namePrefix or '') .. 'ESPVisuals')

local mainFrame = Instance.new("Frame")
mainFrame.Name = "Main"
mainFrame.Size = CONFIG.UI.FrameSize
mainFrame.Position = UDim2.new(0.5, -290, 0.5, -190)
mainFrame.BackgroundColor3 = CONFIG.Colors.Panel
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui
protectGuiElement(mainFrame)
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)
local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Thickness = 1
mainStroke.Color = CONFIG.Colors.Stroke
mainStroke.Transparency = 0.4

local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Parent = mainFrame
topBar.BackgroundColor3 = CONFIG.Colors.Background
topBar.Size = UDim2.new(1, 0, 0, 40)
topBar.BorderSizePixel = 0
Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 10)

local logo = Instance.new("ImageLabel")
logo.Name = "Logo"
logo.Parent = topBar
logo.BackgroundTransparency = 1
logo.Size = UDim2.new(0, 32, 0, 32)
logo.Position = UDim2.new(0, 8, 0.5, -16)
logo.Image = "rbxassetid://75526418442243"
Instance.new("UICorner", logo).CornerRadius = UDim.new(0, 8)

local titleHolder = Instance.new("Frame")
titleHolder.Parent = topBar
titleHolder.BackgroundTransparency = 1
titleHolder.Position = UDim2.new(0, 48, 0, 0)
titleHolder.Size = UDim2.new(1, -160, 1, 0)

local title = Instance.new("TextLabel")
title.Parent = titleHolder
title.BackgroundTransparency = 1
title.Text = "ZZZZ HUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = CONFIG.Colors.Text
title.TextXAlignment = Enum.TextXAlignment.Left
title.Size = UDim2.new(1, 0, 1, 0)

local settingsBtn = Instance.new("TextButton")
settingsBtn.Parent = topBar
settingsBtn.BackgroundColor3 = CONFIG.Colors.Background
settingsBtn.Text = "⚙"
settingsBtn.Font = Enum.Font.GothamBold
settingsBtn.TextSize = 20
settingsBtn.TextColor3 = CONFIG.Colors.Text
settingsBtn.AutoButtonColor = false
settingsBtn.Size = UDim2.new(0, 32, 0, 32)
settingsBtn.Position = UDim2.new(1, -112, 0.5, -16)
Instance.new("UICorner", settingsBtn).CornerRadius = UDim.new(0, 8)

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Parent = topBar
minimizeBtn.BackgroundColor3 = CONFIG.Colors.Background
minimizeBtn.Text = "−"
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 20
minimizeBtn.TextColor3 = CONFIG.Colors.Text
minimizeBtn.AutoButtonColor = false
minimizeBtn.Size = UDim2.new(0, 32, 0, 32)
minimizeBtn.Position = UDim2.new(1, -74, 0.5, -16)
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 8)

local closeBtn = Instance.new("TextButton")
closeBtn.Parent = topBar
closeBtn.BackgroundColor3 = CONFIG.Colors.Background
closeBtn.Text = "×"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.TextColor3 = CONFIG.Colors.Text
closeBtn.AutoButtonColor = false
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -36, 0.5, -16)
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)

-- Close button functionality (moved to comprehensive cleanup below)

-- Sidebar
local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Parent = mainFrame
sidebar.BackgroundColor3 = CONFIG.Colors.Sidebar
sidebar.Size = UDim2.new(0, CONFIG.UI.SidebarWidth, 1, -40)
sidebar.Position = UDim2.new(0, 0, 0, 40)
sidebar.BorderSizePixel = 0
Instance.new("UIStroke", sidebar).Color = CONFIG.Colors.Stroke

local sidebarLayout = Instance.new("UIListLayout")
sidebarLayout.Parent = sidebar
sidebarLayout.Padding = UDim.new(0, 6)
sidebarLayout.FillDirection = Enum.FillDirection.Vertical
sidebarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
sidebarLayout.VerticalAlignment = Enum.VerticalAlignment.Top

-- Content Area
local contentArea = Instance.new("Frame")
contentArea.Name = "ContentArea"
contentArea.Parent = mainFrame
contentArea.BackgroundTransparency = 1
contentArea.Position = UDim2.new(0, CONFIG.UI.SidebarWidth, 0, 40)
contentArea.Size = UDim2.new(1, -CONFIG.UI.SidebarWidth, 1, -40)

local contentLayout = Instance.new("UIListLayout")
contentLayout.Parent = contentArea
contentLayout.Padding = UDim.new(0, 10)
contentLayout.FillDirection = Enum.FillDirection.Vertical
contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
contentLayout.SortOrder = Enum.SortOrder.LayoutOrder


-- Settings UI
local settingsFrame = Instance.new("Frame")
settingsFrame.Name = "SettingsFrame"
settingsFrame.Size = CONFIG.UI.SettingsFrameSize
settingsFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
settingsFrame.BackgroundColor3 = CONFIG.Colors.Panel
settingsFrame.Visible = false
settingsFrame.Active = true
settingsFrame.Draggable = true
settingsFrame.Parent = screenGui
Instance.new("UICorner", settingsFrame).CornerRadius = CONFIG.UI.CornerRadius
local settingsStroke = Instance.new("UIStroke", settingsFrame)
settingsStroke.Thickness = 1
settingsStroke.Color = CONFIG.Colors.Stroke
settingsStroke.Transparency = 0.4

local settingsTopBar = Instance.new("Frame")
settingsTopBar.Name = "SettingsTopBar"
settingsTopBar.Parent = settingsFrame
settingsTopBar.BackgroundColor3 = CONFIG.Colors.Background
settingsTopBar.Size = UDim2.new(1, 0, 0, 40)
settingsTopBar.BorderSizePixel = 0
Instance.new("UICorner", settingsTopBar).CornerRadius = UDim.new(0, 10)

local settingsTitle = Instance.new("TextLabel")
settingsTitle.Parent = settingsTopBar
settingsTitle.BackgroundTransparency = 1
settingsTitle.Text = "Settings"
settingsTitle.Font = Enum.Font.GothamBold
settingsTitle.TextSize = 18
settingsTitle.TextColor3 = CONFIG.Colors.Text
settingsTitle.TextXAlignment = Enum.TextXAlignment.Left
settingsTitle.Position = UDim2.new(0, 10, 0, 0)
settingsTitle.Size = UDim2.new(1, -40, 1, 0)

local settingsCloseBtn = Instance.new("TextButton")
settingsCloseBtn.Parent = settingsTopBar
settingsCloseBtn.BackgroundColor3 = CONFIG.Colors.Background
settingsCloseBtn.Text = "×"
settingsCloseBtn.Font = Enum.Font.GothamBold
settingsCloseBtn.TextSize = 20
settingsCloseBtn.TextColor3 = CONFIG.Colors.Text
settingsCloseBtn.AutoButtonColor = false
settingsCloseBtn.Size = UDim2.new(0, 32, 0, 32)
settingsCloseBtn.Position = UDim2.new(1, -36, 0.5, -16)
Instance.new("UICorner", settingsCloseBtn).CornerRadius = UDim.new(0, 8)

local settingsContent = Instance.new("ScrollingFrame")
settingsContent.Name = "SettingsContent"
settingsContent.Parent = settingsFrame
settingsContent.BackgroundTransparency = 1
settingsContent.Position = UDim2.new(0, 10, 0, 40)
settingsContent.Size = UDim2.new(1, -20, 1, -40)
settingsContent.CanvasSize = UDim2.new(0, 0, 0, 0)
settingsContent.ScrollBarThickness = 3
settingsContent.ScrollBarImageColor3 = CONFIG.Colors.Stroke
settingsContent.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar

local settingsLayout = Instance.new("UIListLayout")
settingsLayout.Parent = settingsContent
settingsLayout.Padding = UDim.new(0, 8)
settingsLayout.FillDirection = Enum.FillDirection.Vertical
settingsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
settingsLayout.SortOrder = Enum.SortOrder.LayoutOrder

settingsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    pcall(function()
        settingsContent.CanvasSize = UDim2.new(0, 0, 0, settingsLayout.AbsoluteContentSize.Y + 10)
    end)
end)

-- Section Frames
local sections = {}
local function createSection(name)
    local sectionFrame = Instance.new("ScrollingFrame")
    sectionFrame.Name = name
    sectionFrame.BackgroundTransparency = 1
    sectionFrame.Size = UDim2.new(1, -20, 1, 0)
    sectionFrame.Position = UDim2.new(0, 10, 0, 0)
    sectionFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    sectionFrame.ScrollBarThickness = 3
    sectionFrame.ScrollBarImageColor3 = CONFIG.Colors.Stroke
    sectionFrame.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
    sectionFrame.Visible = false
    sectionFrame.Parent = contentArea

    local listLayout = Instance.new("UIListLayout")
    listLayout.Parent = sectionFrame
    listLayout.Padding = UDim.new(0, 8)
    listLayout.FillDirection = Enum.FillDirection.Vertical
    listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder

    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        pcall(function()
            sectionFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
        end)
    end)

    sections[name] = sectionFrame
    return sectionFrame
end

-- Tab Button Creator
local activeSection = nil
local function createTabButton(name, sectionName, iconId)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -12, 0, 36)
    button.BackgroundColor3 = CONFIG.Colors.Sidebar
    button.Text = ""
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 14
    button.TextColor3 = CONFIG.Colors.Text
    button.AutoButtonColor = false
    button.Parent = sidebar
    button.Name = sectionName .. "Button"
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)

    local icon = Instance.new("ImageLabel")
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 8, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = iconId or "rbxassetid://6035047409"
    icon.Parent = button

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -36, 1, 0)
    label.Position = UDim2.new(0, 32, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 14
    label.TextColor3 = CONFIG.Colors.Text
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = button

    button.MouseEnter:Connect(function()
        if activeSection ~= sectionName then
            TweenService:Create(button, TweenInfo.new(0.15), { BackgroundColor3 = CONFIG.Colors.Hover }):Play()
        end
    end)
    button.MouseLeave:Connect(function()
        if activeSection ~= sectionName then
            TweenService:Create(button, TweenInfo.new(0.15), { BackgroundColor3 = CONFIG.Colors.Sidebar }):Play()
        end
    end)
    button.MouseButton1Click:Connect(function()
        if activeSection then
            sections[activeSection].Visible = false
            local prevButton = sidebar:FindFirstChild(activeSection .. "Button")
            if prevButton then
                TweenService:Create(prevButton, TweenInfo.new(0.15), { BackgroundColor3 = CONFIG.Colors.Sidebar }):Play()
            end
        end
        sections[sectionName].Visible = true
        TweenService:Create(button, TweenInfo.new(0.15), { BackgroundColor3 = CONFIG.Colors.Accent }):Play()
        activeSection = sectionName
    end)
    return button
end

-- Section Header Creator
local function createSectionHeader(parent, titleText)
    local success, _ = pcall(function()
        local header = Instance.new("Frame")
        header.Size = UDim2.new(1, 0, 0, 28)
        header.BackgroundColor3 = CONFIG.Colors.SectionHeader
        header.Parent = parent
        Instance.new("UICorner", header).CornerRadius = UDim.new(0, 6)
        local stroke = Instance.new("UIStroke", header)
        stroke.Thickness = 0.8
        stroke.Color = CONFIG.Colors.Stroke
        stroke.Transparency = 0.6

        local label = Instance.new("TextLabel")
        label.Parent = header
        label.BackgroundTransparency = 1
        label.Text = titleText
        label.Font = Enum.Font.GothamBold
        label.TextSize = 15
        label.TextColor3 = CONFIG.Colors.Text
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Position = UDim2.new(0, 10, 0, 0)
        label.Size = UDim2.new(1, -20, 1, 0)
    end)
    if not success then
        warn("Failed to create section header: " .. titleText)
    end
end

-- Switch Creator
local function createSwitch(parent, labelText, defaultState, callback)
    local switchData = {state = defaultState}
    local success, _ = pcall(function()
        -- Create main row frame
        switchData.row = Instance.new("Frame")
        switchData.row.BackgroundColor3 = CONFIG.Colors.Background
        switchData.row.Size = UDim2.new(1, 0, 0, 40)
        switchData.row.Parent = parent
        Instance.new("UICorner", switchData.row).CornerRadius = UDim.new(0, 8)
        local stroke = Instance.new("UIStroke", switchData.row)
        stroke.Thickness = 0.8
        stroke.Color = CONFIG.Colors.Stroke
        stroke.Transparency = 0.4

        -- Create label
        local label = Instance.new("TextLabel")
        label.Parent = switchData.row
        label.BackgroundTransparency = 1
        label.Text = labelText
        label.Font = Enum.Font.GothamMedium
        label.TextSize = 14
        label.TextColor3 = CONFIG.Colors.Text
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Position = UDim2.new(0, 10, 0, 0)
        label.Size = UDim2.new(1, -80, 1, 0)

        -- Create switch frame
        switchData.switch = Instance.new("Frame")
        switchData.switch.Parent = switchData.row
        switchData.switch.AnchorPoint = Vector2.new(1, 0.5)
        switchData.switch.Position = UDim2.new(1, -10, 0.5, 0)
        switchData.switch.Size = UDim2.new(0, 48, 0, 22)
        switchData.switch.BackgroundColor3 = defaultState and CONFIG.Colors.SwitchOn or CONFIG.Colors.SwitchOff
        Instance.new("UICorner", switchData.switch).CornerRadius = UDim.new(0, 11)

        -- Create knob
        switchData.knob = Instance.new("Frame")
        switchData.knob.Parent = switchData.switch
        switchData.knob.Size = UDim2.new(0, 18, 0, 18)
        switchData.knob.Position = defaultState and UDim2.new(1, -20, 0, 2) or UDim2.new(0, 2, 0, 2)
        switchData.knob.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
        Instance.new("UICorner", switchData.knob).CornerRadius = UDim.new(0, 9)

        -- Create hit button
        switchData.hit = Instance.new("TextButton")
        switchData.hit.Parent = switchData.switch
        switchData.hit.BackgroundTransparency = 1
        switchData.hit.Text = ""
        switchData.hit.Size = UDim2.new(1, 0, 1, 0)
        switchData.hit.AutoButtonColor = false
    end)
    if not success then
        warn("Failed to create switch: " .. labelText)
        return { row = nil, set = function() end, get = function() return false end }
    end

    -- Optimized setState function
    switchData.setState = function(newState)
        local success, _ = pcall(function()
            switchData.state = newState
            TweenService:Create(switchData.switch, TweenInfo.new(CONFIG.UI.AnimationSpeed, Enum.EasingStyle.Quad), {
                BackgroundColor3 = newState and CONFIG.Colors.SwitchOn or CONFIG.Colors.SwitchOff
            }):Play()
            TweenService:Create(switchData.knob, TweenInfo.new(CONFIG.UI.AnimationSpeed, Enum.EasingStyle.Quad), {
                Position = newState and UDim2.new(1, -20, 0, 2) or UDim2.new(0, 2, 0, 2)
            }):Play()
            if callback then task.spawn(callback, newState) end
        end)
        if not success then
            warn("Failed to set state for switch: " .. labelText)
        end
    end

    -- Optimized toggle function
    switchData.toggle = function()
        switchData.setState(not switchData.state)
    end
    
    -- Connect events
    switchData.hit.MouseButton1Click:Connect(switchData.toggle)
    switchData.hit.TouchTap:Connect(switchData.toggle)
    switchData.hit.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            switchData.toggle()
        end
    end)

    return { 
        row = switchData.row, 
        set = switchData.setState, 
        get = function() return switchData.state end 
    }
end

-- Number Input Creator
local function createNumberInput(parent, labelText, defaultValue, callback)
    local row, textBox
    local success, _ = pcall(function()
        row = Instance.new("Frame")
        row.BackgroundColor3 = CONFIG.Colors.Background
        row.Size = UDim2.new(1, 0, 0, 40)
        row.Parent = parent
        Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)
        local stroke = Instance.new("UIStroke", row)
        stroke.Thickness = 0.8
        stroke.Color = CONFIG.Colors.Stroke
        stroke.Transparency = 0.4

        local label = Instance.new("TextLabel")
        label.Parent = row
        label.BackgroundTransparency = 1
        label.Text = labelText
        label.Font = Enum.Font.GothamMedium
        label.TextSize = 14
        label.TextColor3 = CONFIG.Colors.Text
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Position = UDim2.new(0, 10, 0, 0)
        label.Size = UDim2.new(1, -80, 1, 0)

        textBox = Instance.new("TextBox")
        textBox.Parent = row
        textBox.BackgroundColor3 = CONFIG.Colors.Background
        textBox.Size = UDim2.new(0, 60, 0, 24)
        textBox.Position = UDim2.new(1, -70, 0.5, -12)
        textBox.Text = tostring(defaultValue)
        textBox.Font = Enum.Font.Gotham
        textBox.TextSize = 14
        textBox.TextColor3 = CONFIG.Colors.Text
        textBox.TextXAlignment = Enum.TextXAlignment.Right
        Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)
        local textBoxStroke = Instance.new("UIStroke", textBox)
        textBoxStroke.Thickness = 0.8
        textBoxStroke.Color = CONFIG.Colors.Stroke
    end)
    if not success then
        warn("Failed to create number input: " .. labelText)
        return { row = nil, set = function() end, get = function() return defaultValue end }
    end

    textBox.FocusLost:Connect(function(enterPressed)
        local success, value = pcall(function()
            local num = tonumber(textBox.Text)
            if num then
                textBox.Text = tostring(num)
                if callback then callback(num) end
            else
                textBox.Text = tostring(defaultValue)
            end
        end)
        if not success then
            warn("Invalid input for: " .. labelText)
            textBox.Text = tostring(defaultValue)
        end
    end)

    return { row = row, set = function(value) textBox.Text = tostring(value) end, get = function() return tonumber(textBox.Text) or defaultValue end }
end

--=========================================================
-- Enhanced ESP System (Player ESP)
--=========================================================
_G.ESP_Enabled = false
_G.ESP_Data = {}

local function getBackpackItems(plr)
    local success, items = pcall(function()
        local result = {}
        if plr.Backpack then
            for _, item in ipairs(plr.Backpack:GetChildren()) do
                if item:IsA("Tool") or item:IsA("HopperBin") then
                    table.insert(result, item)
                end
            end
        end
        if plr.Character then
            for _, item in ipairs(plr.Character:GetChildren()) do
                if item:IsA("Tool") or item:IsA("HopperBin") then
                    table.insert(result, item)
                end
            end
        end
        local inventoryFolder = plr:FindFirstChild("Inventory") or (plr.Character and plr.Character:FindFirstChild("Inventory"))
        if inventoryFolder then
            for _, item in ipairs(inventoryFolder:GetChildren()) do
                if item:IsA("Instance") then
                    table.insert(result, item)
                end
            end
        end
        return result
    end)
    if not success then
        warn("Failed to get backpack items for player: " .. plr.Name)
        return {}
    end
    return items
end

local function createBillboardGui(plr, char)
    local success, billboard, distanceLabel, iconFrame = pcall(function()
        local gui = Instance.new("BillboardGui")
        gui.Name = "ESP_Billboard"
        gui.Adornee = char:FindFirstChild("HumanoidRootPart")
        gui.Size = UDim2.new(0, 200, 0, CONFIG.ESP.PlayerESP.ShowDistance and CONFIG.ESP.PlayerESP.ShowItems and 80 or (CONFIG.ESP.PlayerESP.ShowDistance and 50 or 30))
        gui.SizeOffset = Vector2.new(0, 0)
        gui.StudsOffset = Vector3.new(0, 3, 0)
        gui.AlwaysOnTop = true
        gui.MaxDistance = 10000
        gui.Parent = char

        -- Main container with rounded corners and background
        local mainFrame = Instance.new("Frame")
        mainFrame.Size = UDim2.new(1, 0, 1, 0)
        mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        mainFrame.BackgroundTransparency = 0.1
        mainFrame.BorderSizePixel = 0
        mainFrame.Parent = gui
        
        -- Rounded corners
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = mainFrame
        
        -- Subtle border
        local border = Instance.new("UIStroke")
        border.Color = Color3.fromRGB(100, 100, 100)
        border.Thickness = 1
        border.Transparency = 0.3
        border.Parent = mainFrame

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -8, 1, -8)
        frame.Position = UDim2.new(0, 4, 0, 4)
        frame.BackgroundTransparency = 1
        frame.Parent = mainFrame

        -- Username with better styling
        local usernameLabel = Instance.new("TextLabel")
        usernameLabel.Size = UDim2.new(1, 0, CONFIG.ESP.PlayerESP.ShowDistance and 0.4 or 1, 0)
        usernameLabel.Position = UDim2.new(0, 0, 0, 0)
        usernameLabel.Text = plr.Name
        usernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        usernameLabel.BackgroundTransparency = 1
        usernameLabel.TextScaled = true
        usernameLabel.TextSize = CONFIG.ESP.PlayerESP.TextSize
        usernameLabel.Font = Enum.Font.GothamBold
        usernameLabel.TextStrokeTransparency = 0.8
        usernameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        usernameLabel.Parent = frame

        local distLabel
        if CONFIG.ESP.PlayerESP.ShowDistance then
            distLabel = Instance.new("TextLabel")
            distLabel.Size = UDim2.new(1, 0, 0.3, 0)
            distLabel.Position = UDim2.new(0, 0, 0.4, 0)
            distLabel.Text = "Distance: Calculating..."
            distLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
            distLabel.BackgroundTransparency = 1
            distLabel.TextScaled = true
            distLabel.TextSize = CONFIG.ESP.PlayerESP.DistanceTextSize
            distLabel.Font = Enum.Font.Gotham
            distLabel.TextStrokeTransparency = 0.8
            distLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            distLabel.Parent = frame
        end

        local iconFrame = Instance.new("Frame")
        iconFrame.Size = UDim2.new(1, 0, 0.3, 0)
        iconFrame.Position = UDim2.new(0, 0, CONFIG.ESP.PlayerESP.ShowDistance and 0.7 or 0.4, 0)
        iconFrame.BackgroundTransparency = 1
        iconFrame.Visible = CONFIG.ESP.PlayerESP.ShowItems
        iconFrame.Parent = frame

        local uiLayout = Instance.new("UIGridLayout")
        uiLayout.CellSize = UDim2.new(0, 24, 0, 24)
        uiLayout.CellPadding = UDim2.new(0, 3, 0, 3)
        uiLayout.FillDirection = Enum.FillDirection.Horizontal
        uiLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        uiLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        uiLayout.SortOrder = Enum.SortOrder.LayoutOrder
        uiLayout.Parent = iconFrame

        return gui, distLabel, iconFrame
    end)
    if not success then
        warn("Failed to create billboard GUI for player: " .. plr.Name)
        return nil, nil, nil
    end
    return billboard, distanceLabel, iconFrame
end

local function updateBillboard(plr, data)
    if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") or not data.billboard or not data.billboard.Adornee then
        return
    end
    local success, _ = pcall(function()
        local localPlayer = Players.LocalPlayer
        if not localPlayer.Character or not localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            return
        end
        local localRoot = localPlayer.Character.HumanoidRootPart
        local targetRoot = data.billboard.Adornee
        if CONFIG.ESP.PlayerESP.ShowDistance and data.distanceLabel then
            local distance = (localRoot.Position - targetRoot.Position).Magnitude
            data.distanceLabel.Text = string.format("📏 %.1f studs", distance)
        end

        if CONFIG.ESP.PlayerESP.ShowItems and data.iconFrame then
            data.iconFrame:ClearAllChildren()
            local uiLayout = Instance.new("UIGridLayout")
            uiLayout.CellSize = UDim2.new(0, 24, 0, 24)
            uiLayout.CellPadding = UDim2.new(0, 3, 0, 3)
            uiLayout.FillDirection = Enum.FillDirection.Horizontal
            uiLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            uiLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            uiLayout.SortOrder = Enum.SortOrder.LayoutOrder
            uiLayout.Parent = data.iconFrame

            local items = getBackpackItems(plr)
            for _, tool in ipairs(items) do
                local icon = Instance.new("ImageLabel")
                icon.Size = UDim2.new(0, 24, 0, 24)
                icon.BackgroundTransparency = 1
                icon.BorderSizePixel = 0
                local textureId = tool.TextureId
                if textureId == "" then
                    local handle = tool:FindFirstChild("Handle")
                    if handle then
                        local decal = handle:FindFirstChildOfClass("Decal")
                        local mesh = handle:FindFirstChildOfClass("MeshPart") or handle:FindFirstChildOfClass("SpecialMesh")
                        textureId = (decal and decal.Texture) or (mesh and mesh.TextureId) or "rbxasset://textures/ui/GuiImagePlaceholder.png"
                    else
                        textureId = "rbxasset://textures/ui/GuiImagePlaceholder.png"
                    end
                end
                icon.Image = textureId
                icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                icon.Parent = data.iconFrame
                
                -- Rounded corners for icons
                local iconCorner = Instance.new("UICorner")
                iconCorner.CornerRadius = UDim.new(0, 4)
                iconCorner.Parent = icon
                
                local iconStroke = Instance.new("UIStroke", icon)
                iconStroke.Thickness = 0.5
                iconStroke.Color = Color3.fromRGB(0, 0, 0)
                iconStroke.Transparency = 0.3

                local tooltip = Instance.new("TextLabel")
                tooltip.Size = UDim2.new(0, 100, 0, 20)
                tooltip.Position = UDim2.new(0, 0, 1, 2)
                tooltip.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                tooltip.BackgroundTransparency = 0.4
                tooltip.Text = tool.Name
                tooltip.TextColor3 = CONFIG.Colors.Text
                tooltip.TextScaled = true
                tooltip.TextSize = 12
                tooltip.Font = Enum.Font.SourceSans
                tooltip.Visible = false
                tooltip.Parent = icon
                local tooltipStroke = Instance.new("UIStroke", tooltip)
                tooltipStroke.Thickness = 0.8
                tooltipStroke.Color = CONFIG.Colors.Stroke
                icon.MouseEnter:Connect(function()
                    tooltip.Visible = true
                end)
                icon.MouseLeave:Connect(function()
                    tooltip.Visible = false
                end)
            end
        end
    end)
    if not success then
        warn("Failed to update billboard for player: " .. plr.Name)
    end
end

local function attachHighlightToCharacter(plr, char)
     if not _G.ESP_Enabled or not char then return end
    local success, _ = pcall(function()
        local oldHighlight = char:FindFirstChildOfClass("Highlight")
        if oldHighlight then oldHighlight:Destroy() end
        local oldBillboard = char:FindFirstChild("ESP_Billboard")
        if oldBillboard then oldBillboard:Destroy() end

        local highlight = Instance.new("Highlight")
        highlight.FillTransparency = CONFIG.ESP.PlayerESP.FillTransparency
        highlight.OutlineTransparency = CONFIG.ESP.PlayerESP.OutlineTransparency
        highlight.FillColor = CONFIG.ESP.PlayerESP.HighlightColor
        highlight.OutlineColor = CONFIG.ESP.PlayerESP.HighlightColor
        highlight.Adornee = char
        highlight.Parent = char

        local billboard, distanceLabel, iconFrame = createBillboardGui(plr, char)
        if not billboard then return end

         _G.ESP_Data[plr] = _G.ESP_Data[plr] or {}
         _G.ESP_Data[plr].highlight = highlight
         _G.ESP_Data[plr].billboard = billboard
         _G.ESP_Data[plr].distanceLabel = distanceLabel
         _G.ESP_Data[plr].iconFrame = iconFrame

        local lastUpdate = 0
        _G.ESP_Data[plr].updateConn = RunService.Heartbeat:Connect(function(deltaTime)
            lastUpdate = lastUpdate + deltaTime
            if lastUpdate >= CONFIG.ESP.UpdateInterval then
                updateBillboard(plr, _G.ESP_Data[plr])
                lastUpdate = 0
            end
        end)
    end)
    if not success then
        warn("Failed to attach ESP to character: " .. plr.Name)
    end
end

local function enableESP()
     if _G.ESP_Enabled then return end
    local success, _ = pcall(function()
         _G.ESP_Enabled = true
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= player then
                local charConn = plr.CharacterAdded:Connect(function(c)
                    c:WaitForChild("HumanoidRootPart", 5)
                    attachHighlightToCharacter(plr, c)
                end)
_G.ESP_Data[plr] = _G.ESP_Data[plr] or {}
_G.ESP_Data[plr].charConn = charConn
                if plr.Character then
                    for _, part in ipairs(plr.Character:GetDescendants()) do
                        if part:IsA("BasePart") and part.Transparency >= 1 then
                            part.LocalTransparencyModifier = 0.5
                        end
                    end
                    attachHighlightToCharacter(plr, plr.Character)
                end
            end
        end
        _G.ESP_Data.playersConn = Players.PlayerAdded:Connect(function(plr)
            if plr == player then return end
            local charConn = plr.CharacterAdded:Connect(function(c)
                c:WaitForChild("HumanoidRootPart", 5)
                attachHighlightToCharacter(plr, c)
            end)
            -- Refresh plot time ESP when players join
            pcall(function()
                if refreshPlotTimeESP then
            refreshPlotTimeESP()
                end
            end)
_G.ESP_Data[plr] = _G.ESP_Data[plr] or {}
_G.ESP_Data[plr].charConn = charConn
            if plr.Character then
                for _, part in ipairs(plr.Character:GetDescendants()) do
                    if part:IsA("BasePart") and part.Transparency >= 1 then
                        part.LocalTransparencyModifier = 0.5
                    end
                end
                attachHighlightToCharacter(plr, plr.Character)
            end
        end)
        _G.ESP_Data.leaveConn = Players.PlayerRemoving:Connect(function(plr)
            if _G.ESP_Data[plr] then
                if _G.ESP_Data[plr].charConn then pcall(function() _G.ESP_Data[plr].charConn:Disconnect() end) end
                if _G.ESP_Data[plr].highlight then pcall(function() _G.ESP_Data[plr].highlight:Destroy() end) end
                if _G.ESP_Data[plr].billboard then pcall(function() _G.ESP_Data[plr].billboard:Destroy() end) end
                if _G.ESP_Data[plr].updateConn then pcall(function() _G.ESP_Data[plr].updateConn:Disconnect() end) end
                if plr.Character then
                    for _, part in ipairs(plr.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.LocalTransparencyModifier = 0
                        end
                    end
                end
                _G.ESP_Data[plr] = nil
            end
            -- Refresh plot time ESP when players leave
            refreshPlotTimeESP()
        end)
    end)
    if not success then
        warn("Failed to enable ESP")
        _G.ESP_Enabled = false
    end
end

local function disableESP()
    if not _G.ESP_Enabled then return end
    local success, _ = pcall(function()
        _G.ESP_Enabled = false
        if _G.ESP_Data.playersConn then
            pcall(function() _G.ESP_Data.playersConn:Disconnect() end)
            _G.ESP_Data.playersConn = nil
        end
        if _G.ESP_Data.leaveConn then
            pcall(function() _G.ESP_Data.leaveConn:Disconnect() end)
            _G.ESP_Data.leaveConn = nil
        end
        for plr, data in pairs(ESP_Data) do
            if typeof(plr) == "Instance" then
                if data.charConn then pcall(function() data.charConn:Disconnect() end) end
                if data.highlight then pcall(function() data.highlight:Destroy() end) end
                if data.billboard then pcall(function() data.billboard:Destroy() end) end
                if data.updateConn then pcall(function() data.updateConn:Disconnect() end) end
                if plr.Character then
                    for _, part in ipairs(plr.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.LocalTransparencyModifier = 0
                        end
                    end
                end
                _G.ESP_Data[plr] = nil
            end
        end
    end)
    if not success then
        warn("Failed to disable ESP")
    end
end

--=========================================================
-- Plot ESP System
--=========================================================
_G.PlotESP_Enabled = false
_G.PlotESP_Data = {}

local function createPlotBillboardGui(plot)
    local success, billboard, distanceLabel, ownerLabel, timeLabel = pcall(function()
        local spawnPart = plot:FindFirstChild("Spawn")
        if not spawnPart or not spawnPart:IsA("BasePart") then return nil, nil, nil, nil end

        local height = 30
        if CONFIG.ESP.PlotESP.ShowDistance then height = height + 20 end
        if CONFIG.ESP.PlotESP.ShowOwner then height = height + 30 end
        if CONFIG.ESP.PlotESP.ShowTime then height = height + 20 end

        local gui = Instance.new("BillboardGui")
        gui.Name = "PlotESP_Billboard"
        gui.Adornee = spawnPart
        gui.Size = UDim2.new(0, 200, 0, height)
        gui.SizeOffset = Vector2.new(0, 0)
        gui.StudsOffset = Vector3.new(0, 3, 0)
        gui.AlwaysOnTop = true
        gui.MaxDistance = 10000
        gui.Parent = spawnPart

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.Parent = gui

        local yOffset = 0
        local ownerLabel
        if CONFIG.ESP.PlotESP.ShowOwner then
            ownerLabel = Instance.new("TextLabel")
            ownerLabel.Size = UDim2.new(1, 0, 0.4, 0)
            ownerLabel.Position = UDim2.new(0, 0, 0, yOffset)
            ownerLabel.Text = "Owner: Loading..."
            ownerLabel.TextColor3 = CONFIG.Colors.Text
            ownerLabel.BackgroundTransparency = 1
            ownerLabel.TextScaled = true
            ownerLabel.TextSize = CONFIG.ESP.PlotESP.OwnerTextSize
            ownerLabel.Font = Enum.Font.SourceSansBold
            ownerLabel.Parent = frame
            local ownerStroke = Instance.new("UIStroke", ownerLabel)
            ownerStroke.Thickness = 0.5
            ownerStroke.Color = Color3.fromRGB(0, 0, 0)
            ownerStroke.Transparency = 0.4
            yOffset = yOffset + 0.4
        end

        local timeLabel
        if CONFIG.ESP.PlotESP.ShowTime then
            timeLabel = Instance.new("TextLabel")
            timeLabel.Size = UDim2.new(1, 0, 0.3, 0)
            timeLabel.Position = UDim2.new(0, 0, yOffset, 0)
            timeLabel.Text = "Time: Loading..."
            timeLabel.TextColor3 = CONFIG.Colors.SubText
            timeLabel.BackgroundTransparency = 1
            timeLabel.TextScaled = true
            timeLabel.TextSize = CONFIG.ESP.PlotESP.TimeTextSize
            timeLabel.Font = Enum.Font.SourceSans
            timeLabel.Parent = frame
            local timeStroke = Instance.new("UIStroke", timeLabel)
            timeStroke.Thickness = 0.5
            timeStroke.Color = Color3.fromRGB(0, 0, 0)
            timeStroke.Transparency = 0.4
            yOffset = yOffset + 0.3
        end

        local distLabel
        if CONFIG.ESP.PlotESP.ShowDistance then
            distLabel = Instance.new("TextLabel")
            distLabel.Size = UDim2.new(1, 0, 0.3, 0)
            distLabel.Position = UDim2.new(0, 0, yOffset, 0)
            distLabel.Text = "Distance: Calculating..."
            distLabel.TextColor3 = CONFIG.Colors.Text
            distLabel.BackgroundTransparency = 1
            distLabel.TextScaled = true
            distLabel.TextSize = 14
            distLabel.Font = Enum.Font.SourceSans
            distLabel.Parent = frame
            local distStroke = Instance.new("UIStroke", distLabel)
            distStroke.Thickness = 0.5
            distStroke.Color = Color3.fromRGB(0, 0, 0)
            distStroke.Transparency = 0.4
        end

        return gui, distLabel, ownerLabel, timeLabel
    end)
    if not success then
        warn("Failed to create billboard GUI for plot: " .. plot.Name)
        return nil, nil, nil, nil
    end
    return billboard, distanceLabel, ownerLabel, timeLabel
end

local function updatePlotBillboard(plot, data)
    if not data.billboard or not data.billboard.Adornee then
        return
    end
    local success, _ = pcall(function()
        local localPlayer = Players.LocalPlayer
        if not localPlayer.Character or not localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            return
        end
        local localRoot = localPlayer.Character.HumanoidRootPart
        local targetPart = data.billboard.Adornee
        if CONFIG.ESP.PlotESP.ShowDistance and data.distanceLabel then
            local distance = (localRoot.Position - targetPart.Position).Magnitude
            data.distanceLabel.Text = string.format("Distance: %.1f studs", distance)
        end

        if CONFIG.ESP.PlotESP.ShowOwner and data.ownerLabel then
            local owner = getPlotOwner(plot)
            data.ownerLabel.Text = owner and ("Owner: " .. owner) or "Owner: Unknown"
        end

        if CONFIG.ESP.PlotESP.ShowTime and data.timeLabel then
            local remainingTime = getRemainingTime(plot)
            data.timeLabel.Text = remainingTime and ("Time: " .. remainingTime) or "Time: N/A"
        end
    end)
    if not success then
        warn("Failed to update plot billboard for plot: " .. plot.Name)
    end
end

local function attachHighlightToPlot(plot)
    if not _G.PlotESP_Enabled or not plot then return end
    local success, _ = pcall(function()
        local oldHighlight = plot:FindFirstChildOfClass("Highlight")
        if oldHighlight then oldHighlight:Destroy() end
        local oldBillboard = plot:FindFirstChild("PlotESP_Billboard", true)
        if oldBillboard then oldBillboard:Destroy() end

        local highlight = Instance.new("Highlight")
        highlight.FillTransparency = CONFIG.ESP.PlotESP.FillTransparency
        highlight.OutlineTransparency = CONFIG.ESP.PlotESP.OutlineTransparency
        highlight.OutlineColor = CONFIG.ESP.PlotESP.HighlightColor
        highlight.Adornee = plot
        highlight.Parent = plot

        local billboard, distanceLabel, ownerLabel, timeLabel = createPlotBillboardGui(plot)
        if not billboard then return end

        _G.PlotESP_Data[plot] = _G.PlotESP_Data[plot] or {}
        _G.PlotESP_Data[plot].highlight = highlight
        _G.PlotESP_Data[plot].billboard = billboard
        _G.PlotESP_Data[plot].distanceLabel = distanceLabel
        _G.PlotESP_Data[plot].ownerLabel = ownerLabel
        _G.PlotESP_Data[plot].timeLabel = timeLabel

        local lastUpdate = 0
        _G.PlotESP_Data[plot].updateConn = RunService.Heartbeat:Connect(function(deltaTime)
            lastUpdate = lastUpdate + deltaTime
            if lastUpdate >= CONFIG.ESP.UpdateInterval then
                updatePlotBillboard(plot, _G.PlotESP_Data[plot])
                lastUpdate = 0
            end
        end)
    end)
    if not success then
        warn("Failed to attach ESP to plot: " .. plot.Name)
    end
end

local function enablePlotESP()
    if _G.PlotESP_Enabled then return end
    local success, _ = pcall(function()
        local plotsFolder = workspace:FindFirstChild("Plots")
        if not plotsFolder then return end

        _G.PlotESP_Enabled = true
        for _, plot in ipairs(plotsFolder:GetChildren()) do
            if plot:IsA("Model") then
                local plotConn = plot.AncestryChanged:Connect(function()
                    if not plot.Parent then
                        if _G.PlotESP_Data[plot] then
                            if _G.PlotESP_Data[plot].updateConn then pcall(function() _G.PlotESP_Data[plot].updateConn:Disconnect() end) end
                            if _G.PlotESP_Data[plot].highlight then pcall(function() _G.PlotESP_Data[plot].highlight:Destroy() end) end
                            if _G.PlotESP_Data[plot].billboard then pcall(function() _G.PlotESP_Data[plot].billboard:Destroy() end) end
                            _G.PlotESP_Data[plot] = nil
                        end
                    end
                end)
                _G.PlotESP_Data[plot] = _G.PlotESP_Data[plot] or {}
                _G.PlotESP_Data[plot].plotConn = plotConn
                attachHighlightToPlot(plot)
            end
        end
        _G.PlotESP_Data.plotsConn = plotsFolder.ChildAdded:Connect(function(plot)
            if plot:IsA("Model") then
                local plotConn = plot.AncestryChanged:Connect(function()
                    if not plot.Parent then
                        if _G.PlotESP_Data[plot] then
                            if _G.PlotESP_Data[plot].updateConn then pcall(function() _G.PlotESP_Data[plot].updateConn:Disconnect() end) end
                            if _G.PlotESP_Data[plot].highlight then pcall(function() _G.PlotESP_Data[plot].highlight:Destroy() end) end
                            if _G.PlotESP_Data[plot].billboard then pcall(function() _G.PlotESP_Data[plot].billboard:Destroy() end) end
                            _G.PlotESP_Data[plot] = nil
                        end
                    end
                end)
                _G.PlotESP_Data[plot] = _G.PlotESP_Data[plot] or {}
                _G.PlotESP_Data[plot].plotConn = plotConn
                task.wait(1) -- Wait for plot to fully load
                attachHighlightToPlot(plot)
            end
        end)
        _G.PlotESP_Data.plotsRemoveConn = plotsFolder.ChildRemoved:Connect(function(plot)
            if _G.PlotESP_Data[plot] then
                if _G.PlotESP_Data[plot].plotConn then pcall(function() _G.PlotESP_Data[plot].plotConn:Disconnect() end) end
                if _G.PlotESP_Data[plot].updateConn then pcall(function() _G.PlotESP_Data[plot].updateConn:Disconnect() end) end
                if _G.PlotESP_Data[plot].highlight then pcall(function() _G.PlotESP_Data[plot].highlight:Destroy() end) end
                if _G.PlotESP_Data[plot].billboard then pcall(function() _G.PlotESP_Data[plot].billboard:Destroy() end) end
                _G.PlotESP_Data[plot] = nil
            end
        end)
    end)
    if not success then
        warn("Failed to enable Plot ESP")
        Plot_G.ESP_Enabled = false
    end
end

local function disablePlotESP()
    if not _G.PlotESP_Enabled then return end
    local success, _ = pcall(function()
        _G.PlotESP_Enabled = false
        if _G.PlotESP_Data.plotsConn then
            pcall(function() _G.PlotESP_Data.plotsConn:Disconnect() end)
            _G.PlotESP_Data.plotsConn = nil
        end
        if _G.PlotESP_Data.plotsRemoveConn then
            pcall(function() _G.PlotESP_Data.plotsRemoveConn:Disconnect() end)
            _G.PlotESP_Data.plotsRemoveConn = nil
        end
        for plot, data in pairs(_G.PlotESP_Data) do
            if typeof(plot) == "Instance" then
                if data.plotConn then pcall(function() data.plotConn:Disconnect() end) end
                if data.updateConn then pcall(function() data.updateConn:Disconnect() end) end
                if data.highlight then pcall(function() data.highlight:Destroy() end) end
                if data.billboard then pcall(function() data.billboard:Destroy() end) end
                _G.PlotESP_Data[plot] = nil
            end
        end
    end)
    if not success then
        warn("Failed to disable Plot ESP")
    end
end

local function enablePlotTimeESP()
    if _G.PlotTimeESP_Enabled then return end
    local success, _ = pcall(function()
        local plotsFolder = workspace:FindFirstChild("Plots")
        if not plotsFolder then
            warn("Plots folder not found")
            return
        end

        _G.PlotTimeESP_Enabled = true
        _G.PlotTimeESP_Data = {} -- Clear existing data to prevent duplicates

        for _, plot in pairs(plotsFolder:GetChildren()) do
            if plot:IsA("Model") and plot:FindFirstChild("Spawn") then
                local billboard, timeLabel = createPlotTimeBillboard(plot)
                if billboard and timeLabel then
                    _G.PlotTimeESP_Data[plot] = {
                        billboard = billboard,
                        timeLabel = timeLabel
                    }
                    local lastUpdate = 0
                    _G.PlotTimeESP_Data[plot].updateConn = RunService.Heartbeat:Connect(function(deltaTime)
                        if not _G.PlotTimeESP_Enabled or not _G.PlotTimeESP_Data[plot] then return end
                        lastUpdate = lastUpdate + deltaTime
                        if lastUpdate >= CONFIG.ESP.UpdateInterval then
                            updatePlotTimeBillboard(plot, _G.PlotTimeESP_Data[plot])
                            lastUpdate = 0
                        end
                    end)
                end
            end
        end

        -- Handle new plots
        _G.PlotTimeESP_Data.plotsConn = plotsFolder.ChildAdded:Connect(function(plot)
            if plot:IsA("Model") then
                task.wait(1) -- Wait for plot to load
                if plot:FindFirstChild("Spawn") then
                    local billboard, timeLabel = createPlotTimeBillboard(plot)
                    if billboard and timeLabel then
                        _G.PlotTimeESP_Data[plot] = {
                            billboard = billboard,
                            timeLabel = timeLabel
                        }
                        local lastUpdate = 0
                        _G.PlotTimeESP_Data[plot].updateConn = RunService.Heartbeat:Connect(function(deltaTime)
                            if not _G.PlotTimeESP_Enabled or not _G.PlotTimeESP_Data[plot] then return end
                            lastUpdate = lastUpdate + deltaTime
                            if lastUpdate >= CONFIG.ESP.UpdateInterval then
                                updatePlotTimeBillboard(plot, _G.PlotTimeESP_Data[plot])
                                lastUpdate = 0
                            end
                        end)
                    end
                end
            end
        end)
        
        -- Handle player events for plot time updates
        _G.PlotTimeESP_Data.playerAddedConn = Players.PlayerAdded:Connect(function(plr)
            -- Update all plot time billboards when a player joins
            for plot, data in pairs(_G.PlotTimeESP_Data) do
                if typeof(plot) == "Instance" and data.billboard and data.timeLabel then
                    updatePlotTimeBillboard(plot, data)
                end
            end
        end)
        
        _G.PlotTimeESP_Data.playerRemovingConn = Players.PlayerRemoving:Connect(function(plr)
            -- Update all plot time billboards when a player leaves
            for plot, data in pairs(_G.PlotTimeESP_Data) do
                if typeof(plot) == "Instance" and data.billboard and data.timeLabel then
                    updatePlotTimeBillboard(plot, data)
                end
            end
        end)

        -- Handle plot removal
        _G.PlotTimeESP_Data.plotsRemoveConn = plotsFolder.ChildRemoved:Connect(function(plot)
            if _G.PlotTimeESP_Data[plot] then
                if _G.PlotTimeESP_Data[plot].updateConn then
                    pcall(function() _G.PlotTimeESP_Data[plot].updateConn:Disconnect() end)
                end
                if _G.PlotTimeESP_Data[plot].billboard then
                    pcall(function() _G.PlotTimeESP_Data[plot].billboard:Destroy() end)
                end
                _G.PlotTimeESP_Data[plot] = nil
            end
        end)
    end)
    if not success then
        warn("Failed to enable Plot Time ESP")
        PlotTime_G.ESP_Enabled = false
    end
end

--=========================================================
-- Server Hop System
--=========================================================
local isServerHopActive = false
local serverHopThread = nil

local function getServerList()
    local success, servers = pcall(function()
        local placeId = game.PlaceId
        local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"
        local response = _G.safeHttpGet(url)
        if not response then
            warn("❌ Failed to fetch server list")
            return {}
        end
        local parsed = HttpService:JSONDecode(response)
        local result = {}
        if type(parsed) == "table" and type(parsed.data) == "table" then
            for _, server in ipairs(parsed.data) do
                if type(server) == "table" and server.playing and server.maxPlayers and server.id and server.playing < server.maxPlayers and server.id ~= game.JobId then
                    table.insert(result, server.id)
                end
            end
        end
        return result
    end)
    if not success then
        warn("Failed to get server list")
        return {}
    end
    return servers
end

local function attemptServerHop()
    local success, _ = pcall(function()
        local serverList = getServerList()
        if #serverList > 0 then
            local target = serverList[math.random(1, #serverList)]
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, target, player)
        else
            warn("No available servers found")
        end
    end)
    if not success then
        warn("Server hop attempt failed")
    end
end

local function toggleServerHop(active)
    local success, _ = pcall(function()
        isServerHopActive = active
        if active then
            if not serverHopThread then
                serverHopThread = task.spawn(function()
                    while isServerHopActive do
                        attemptServerHop()
                        task.wait(6)
                    end
                    serverHopThread = nil
                end)
            end
        else
            isServerHopActive = false
        end
    end)
    if not success then
        warn("Failed to toggle server hop")
    end
end

--=========================================================
-- Jump Power Control
--=========================================================
local function setupJumpPowerControl(parent)
    local jumpData = {
        defaultJumpPower = 50,
        isActive = false
    }

    local jumpSwitch = createSwitch(parent, "Jump Bypass", _G.SavedToggleStates and _G.SavedToggleStates.Jump or false, function(on)
        local success, _ = pcall(function()
            jumpData.isActive = on
            if humanoid then
                humanoid.UseJumpPower = true
                humanoid.JumpPower = on and CONFIG.Movement.JumpPower or jumpData.defaultJumpPower
            end
            if on then
                -- Auto-create side toggle when enabled
                _G.createCircularToggleUI("Jump", function() return jumpSwitch.get() end, function(state) jumpSwitch.set(state) end)
            else
                -- Remove side toggle when disabled
                local existingToggle = _G.circularToggleGui:FindFirstChild("JumpToggleUI")
                if existingToggle then
                    _G.OpenCircularToggles["Jump"] = nil
                    existingToggle:Destroy()
                    _G.saveSettings()
                end
            end
        end)
        if not success then
            warn("Failed to toggle jump power")
        end
    end)

    return jumpData.isActive, jumpSwitch
end

--=========================================================
-- Speed Boost Control
--=========================================================
local function setupSpeedControl(parent)
    local speedData = {
        enabled = false,
        connections = {},
        joystickDelta = Vector2.new(0, 0),
        touchId = nil
    }

    local function enableSpeed()
        local success, _ = pcall(function()
            if speedData.enabled then return end
            humanoid, humanoidRootPart = character and character:FindFirstChildOfClass("Humanoid"), character and character:FindFirstChild("HumanoidRootPart")
            if not humanoid or not humanoidRootPart then return end
            speedData.enabled = true

            if UserInputService.TouchEnabled then
                speedData.connections.touchBegan = UserInputService.TouchStarted:Connect(function(input, gameProcessed)
                    if gameProcessed or speedData.touchId then return end
                    if input.UserInputType == Enum.UserInputType.Touch then
                        speedData.touchId = input.UserInputId
                        speedData.joystickDelta = Vector2.new(0, 0)
                    end
                end)

                speedData.connections.touchMoved = UserInputService.TouchMoved:Connect(function(input, gameProcessed)
                    if gameProcessed or input.UserInputId ~= speedData.touchId then return end
                    local touchPos = input.Position
                    local screenSize = workspace.CurrentCamera.ViewportSize
                    local normalizedPos = Vector2.new(
                        (touchPos.X / screenSize.X - 0.25) * 4,
                        (touchPos.Y / screenSize.Y - 0.5) * 2
                    )
                    speedData.joystickDelta = Vector2.new(
                        math.clamp(normalizedPos.X, -1, 1),
                        math.clamp(normalizedPos.Y, -1, 1)
                    )
                end)

                speedData.connections.touchEnded = UserInputService.TouchEnded:Connect(function(input, gameProcessed)
                    if gameProcessed or input.UserInputId ~= speedData.touchId then return end
                    speedData.touchId = nil
                    speedData.joystickDelta = Vector2.new(0, 0)
                end)
            end

            speedData.connections.move = RunService.Heartbeat:Connect(function()
                if not speedData.enabled or not humanoid or not humanoidRootPart or humanoidRootPart.Parent ~= character then return end

                local moveVector = Vector3.new(0, 0, 0)
                local camCF = workspace.CurrentCamera.CFrame

                if UserInputService.TouchEnabled and speedData.joystickDelta.Magnitude > 0.15 then
                    moveVector = camCF:VectorToWorldSpace(Vector3.new(speedData.joystickDelta.X, 0, -speedData.joystickDelta.Y))
                    moveVector = moveVector.Unit * CONFIG.Movement.Speed
                else
                    local moveX = (UserInputService:IsKeyDown(Enum.KeyCode.D) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.A) and 1 or 0)
                    local moveZ = (UserInputService:IsKeyDown(Enum.KeyCode.W) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.S) and 1 or 0)
                    if moveX ~= 0 or moveZ ~= 0 then
                        moveVector = (camCF.RightVector * moveX + camCF.LookVector * moveZ).Unit * CONFIG.Movement.Speed
                    end
                end

                local currentVelocity = humanoidRootPart.AssemblyLinearVelocity
                local newVelocity = Vector3.new(
                    moveVector.X ~= 0 and moveVector.X or currentVelocity.X,
                    currentVelocity.Y,
                    moveVector.Z ~= 0 and moveVector.Z or currentVelocity.Z
                )

                local flatMag = Vector3.new(newVelocity.X, 0, newVelocity.Z).Magnitude
                if flatMag > CONFIG.Movement.MaxSpeed then
                    local ratio = CONFIG.Movement.MaxSpeed / flatMag
                    newVelocity = Vector3.new(newVelocity.X * ratio, newVelocity.Y, newVelocity.Z * ratio)
                end

                humanoidRootPart.AssemblyLinearVelocity = newVelocity
            end)
        end)
        if not success then
            warn("Failed to enable speed boost")
            speedData.enabled = false
        end
    end

    local function disableSpeed()
        local success, _ = pcall(function()
            if not speedData.enabled then return end
            speedData.enabled = false
            for _, conn in pairs(speedData.connections) do
                pcall(function() conn:Disconnect() end)
            end
            speedData.connections = {}
            speedData.touchId = nil
            speedData.joystickDelta = Vector2.new(0, 0)
            if humanoidRootPart then
                humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, humanoidRootPart.AssemblyLinearVelocity.Y, 0)
            end
        end)
        if not success then
            warn("Failed to disable speed boost")
        end
    end

    local speedSwitch = createSwitch(parent, "Speed Boost", _G.SavedToggleStates and _G.SavedToggleStates.Speed or false, function(on)
        if on then
            enableSpeed()
            -- Auto-create side toggle when enabled
            _G.createCircularToggleUI("Speed", function() return speedSwitch.get() end, function(state) speedSwitch.set(state) end)
        else
            disableSpeed()
            -- Remove side toggle when disabled
            local existingToggle = _G.circularToggleGui:FindFirstChild("SpeedToggleUI")
            if existingToggle then
                _G.OpenCircularToggles["Speed"] = nil
                existingToggle:Destroy()
                _G.saveSettings()
            end
        end
    end)

    return speedData.enabled, speedSwitch
end

-- Setup Movement Controls (moved here after function definitions)
local _, jumpSwitch = setupJumpPowerControl(_G.movementSection)
local _, speedSwitch = setupSpeedControl(_G.movementSection)

--=========================================================
-- Unhittable Control
--=========================================================
local unhittableSwitch -- Global to access in CharacterAdded

local function setupUnhittableControl(parent)
    local defaultSize = Vector3.new(2, 2, 1)
    local isUnhittableActive = false
    local unhittableThread = nil

    unhittableSwitch = createSwitch(parent, "Height Bypass", false, function(on)
        local success, _ = pcall(function()
            isUnhittableActive = on
            if not humanoidRootPart then return end
            if on then
                if not unhittableThread then
                    unhittableThread = task.spawn(function()
                        while isUnhittableActive do
                            if humanoidRootPart then
                                humanoidRootPart.Size = Vector3.new(
                                    CONFIG.Movement.Unhittable.IntermediateSize.X,
                                    CONFIG.Movement.Unhittable.IntermediateSize.Y,
                                    CONFIG.Movement.Unhittable.IntermediateSize.Z
                                )
                                task.wait(0.2)
                                if not isUnhittableActive then break end
                                humanoidRootPart.Size = Vector3.new(
                                    CONFIG.Movement.Unhittable.TallSize.X,
                                    CONFIG.Movement.Unhittable.TallSize.Y,
                                    CONFIG.Movement.Unhittable.TallSize.Z
                                )
                                task.wait(2.1)
                                if not isUnhittableActive then break end
                                humanoidRootPart.Size = defaultSize
                                task.wait(1.5)
                            else
                                task.wait(0.1)
                            end
                        end
                        if humanoidRootPart then
                            humanoidRootPart.Size = defaultSize
                        end
                        unhittableThread = nil
                    end)
                end
            else
                if humanoidRootPart then
                    humanoidRootPart.Size = defaultSize
                end
                if unhittableThread then
                    task.cancel(unhittableThread)
                    unhittableThread = nil
                end
            end
        end)
        if not success then
            warn("Failed to toggle height bypass")
        end
    end)

    return isUnhittableActive, unhittableSwitch
end

--=========================================================
-- Resize Control
--=========================================================
local resizeSwitch -- Global to access in CharacterAdded

local function setupResizeControl(parent)
    local defaultSize = Vector3.new(2, 2, 1)
    local isResizeActive = false

    resizeSwitch = createSwitch(parent, "Tall like zzzz", false, function(on)
        local success, _ = pcall(function()
            isResizeActive = on
            if humanoidRootPart then
                humanoidRootPart.Size = on and Vector3.new(
                    CONFIG.Movement.Resize.TargetSize.X,
                    CONFIG.Movement.Resize.TargetSize.Y,
                    CONFIG.Movement.Resize.TargetSize.Z
                ) or defaultSize
            end
        end)
        if not success then
            warn("Failed to toggle tall mode")
        end
    end)

    return isResizeActive, resizeSwitch
end

--=========================================================
-- Fling Control (Fixed Desync Logic)
--=========================================================
local flingSwitch -- Global to access in CharacterAdded

local function setupFlingControl(parent)
    local isFlingActive = false
    local desyncState = {}
    local flingConnection = nil
    local oldIndex = nil

    local function RandomNumberRange(a)
        return math.random(-a * 100, a * 100) / 100
    end

    local function enableFling()
        local success, err = pcall(function()
            if isFlingActive then return end
            -- Ensure character and components exist
            if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") or not player.Character:FindFirstChild("Humanoid") or player.Character.Humanoid.Health <= 0 then
                warn("Cannot enable fling: Character not ready")
                return
            end
            isFlingActive = true

            -- Hook __index to spoof CFrame
            oldIndex = hookmetamethod(game, "__index", newcclosure(function(self, key)
                if isFlingActive and not checkcaller() and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                    if key == "CFrame" then
                        if self == player.Character.HumanoidRootPart then
                            return desyncState[1] or CFrame.new()
                        elseif self == player.Character.Head then
                            return desyncState[1] and (desyncState[1] + Vector3.new(0, player.Character.HumanoidRootPart.Size.Y / 2 + 0.5, 0)) or CFrame.new()
                        end
                    end
                end
                return oldIndex(self, key)
            end))

            flingConnection = RunService.Heartbeat:Connect(function()
                if isFlingActive and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                    local hrp = player.Character.HumanoidRootPart
                    -- Store original state
                    desyncState[1] = hrp.CFrame
                    desyncState[2] = hrp.AssemblyLinearVelocity

                    -- Spoof CFrame and velocity
                    local spoofCFrame = desyncState[1] * CFrame.new(Vector3.new(0, 0, 0))
                    spoofCFrame = spoofCFrame * CFrame.Angles(math.rad(RandomNumberRange(180)), math.rad(RandomNumberRange(180)), math.rad(RandomNumberRange(180)))
                    hrp.CFrame = spoofCFrame
                    hrp.AssemblyLinearVelocity = Vector3.new(1, 0, 0) * 5000 -- Reduced velocity to prevent physics crashes

                    -- Wait for next frame
                    RunService.RenderStepped:Wait()

                    -- Restore original state only if character is still valid
                    if player.Character and hrp.Parent == player.Character then
                        hrp.CFrame = desyncState[1]
                        hrp.AssemblyLinearVelocity = desyncState[2]
                    end
                end
            end)
        end)
        if not success then
            warn("Failed to enable fling: " .. tostring(err))
            isFlingActive = false
            flingSwitch.set(false) -- Reset UI switch if enabling fails
        end
    end

    local function disableFling()
        local success, err = pcall(function()
            if not isFlingActive then return end
            isFlingActive = false
            if flingConnection then
                flingConnection:Disconnect()
                flingConnection = nil
            end
            if oldIndex then
                -- Restore original __index
                hookmetamethod(game, "__index", function(self, key)
                    return oldIndex(self, key)
                end)
                oldIndex = nil
            end
            desyncState = {}
            -- Ensure character state is reset
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, player.Character.HumanoidRootPart.AssemblyLinearVelocity.Y, 0)
            end
        end)
        if not success then
            warn("Failed to disable fling: " .. tostring(err))
        end
    end

    flingSwitch = createSwitch(parent, "Fling (patched)", false, function(on)
        if on then
            enableFling()
        else
            disableFling()
        end
    end)

    return isFlingActive, flingSwitch
end

--=========================================================
-- UI Sections Setup
--=========================================================
_G.homeSection = createSection("Home")
_G.movementSection = createSection("Movement")
_G.visualSection = createSection("Visual")
_G.serverSection = createSection("Server")
_G.patchedSection = createSection("Patched")
_G.desyncSection = createSection("Desync")

createTabButton("Home", "Home", "rbxassetid://6031265976")
createTabButton("Movement", "Movement", "rbxassetid://6035047409")
createTabButton("Visual", "Visual", "rbxassetid://6031280882")
createTabButton("Patched", "Patched", "rbxassetid://6031289451")
createTabButton("Server", "Server", "rbxassetid://6031068421")
createTabButton("Desync", "Desync", "rbxassetid://6031094677")


-- Home Section
createSectionHeader(_G.homeSection, "Welcome")
local welcomeLabel = Instance.new("TextLabel")
welcomeLabel.Size = UDim2.new(1, -20, 0, 100)
welcomeLabel.BackgroundTransparency = 1
welcomeLabel.Text = "Welcome to ZZZZ HUB v1.67\nBest Free Steal a Brainrot Script.\nalways updating each week! We are ZZZZ HUB!\nJoin our community: " .. CONFIG.DiscordLink
welcomeLabel.TextColor3 = CONFIG.Colors.SubText
welcomeLabel.TextSize = 14
welcomeLabel.Font = Enum.Font.Gotham
welcomeLabel.TextXAlignment = Enum.TextXAlignment.Left
welcomeLabel.TextYAlignment = Enum.TextYAlignment.Top
welcomeLabel.TextWrapped = true
welcomeLabel.Parent = _G.homeSection

-- Button Creator
local function createButton(parent, text, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 40)
    button.BackgroundColor3 = CONFIG.Colors.Background
    button.Text = text
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 14
    button.TextColor3 = CONFIG.Colors.Text
    button.AutoButtonColor = false
    button.Parent = parent
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", button).Thickness = 0.8
    button.MouseButton1Click:Connect(callback)
    
    -- Mobile support - Touch events
    button.TouchTap:Connect(callback)
    
    return button
end


-- Movement Section
createSectionHeader(_G.movementSection, "Player Movement")


-- New Float System
local FLOAT_ENABLED = false
local connections = {}
local bodyVelocity = nil
local floatPart = nil
local lastJumpTime = 0
local JUMP_COOLDOWN = 0.5 -- Minimum time between jump inputs to avoid anti-cheat

local function enableFloat(character)
    local success, err = pcall(function()
        if FLOAT_ENABLED then return end

        local humanoid = character:WaitForChild("Humanoid", 5)
        local rootPart = character:WaitForChild("HumanoidRootPart", 5)
        if not humanoid or not rootPart then return end

        FLOAT_ENABLED = true

        -- Create invisible client-side part
        floatPart = Instance.new("Part")
        floatPart.Size = Vector3.new(4, 1, 4) -- Wider than character
        floatPart.Transparency = 1 -- Invisible
        floatPart.Anchored = false
        floatPart.CanCollide = false
        floatPart.Massless = true -- Reduces physics impact
        floatPart.Parent = workspace
        
        -- Weld the part to the character's root
        local weld = Instance.new("Weld")
        weld.Part0 = rootPart
        weld.Part1 = floatPart
        weld.C0 = CFrame.new(0, -3.5, 0) -- Position below character
        weld.Parent = floatPart

        -- Apply subtle downward force for slow descent
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(0, 5000, 0) -- Moderate force
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.P = 1000
        bodyVelocity.Parent = floatPart

        -- Main float logic for slow descent with improved detection
        connections.stepped = RunService.Stepped:Connect(function()
            if not FLOAT_ENABLED or not humanoid or humanoid.Health <= 0 then
                return
            end

            local isInAir = humanoid:GetState() == Enum.HumanoidStateType.Freefall
            local isJumping = humanoid:GetState() == Enum.HumanoidStateType.Jumping
            local isFalling = humanoid:GetState() == Enum.HumanoidStateType.FallingDown
            
            -- Check if player is off ground using raycast
            local raycast = workspace:Raycast(rootPart.Position, Vector3.new(0, -10, 0))
            local isOnGround = raycast ~= nil
            
            -- Apply float when: already in air, jumping, falling, or not on ground
            if isInAir or isJumping or isFalling or not isOnGround then
                local descentSpeed = CONFIG.Movement.Float.DescentSpeed or 2
                bodyVelocity.Velocity = Vector3.new(0, -descentSpeed, 0) -- Slow descent speed
            else
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            end
        end)

        -- Cleanup connections
        connections.died = humanoid.Died:Connect(function()
            disableFloat()
        end)
        
        connections.characterRemoving = character.AncestryChanged:Connect(function(_, parent)
            if parent == nil then
                disableFloat()
            end
        end)
    end)

    if not success then
        warn("Float enable error: " .. tostring(err))
        FLOAT_ENABLED = false
    end
end

local function disableFloat()
        FLOAT_ENABLED = false
        for _, conn in pairs(connections) do
            pcall(function() conn:Disconnect() end)
        end
        connections = {}
    
    if floatPart then
        floatPart:Destroy()
        floatPart = nil
    end
end

-- Attach to current character and future spawns
player.CharacterAdded:Connect(function(newCharacter)
    disableFloat() -- Clean up old character
    task.spawn(function()
        task.wait(0.5) -- Wait for character to fully load
        if CONFIG.Movement.Float.Enabled then
            enableFloat(newCharacter) -- Apply to new character
        end
        if CONFIG.AntiKick.Enabled then
            enableAntiKick() -- Re-enable anti-kick for new character
        end
    end)
end)

-- Apply to existing character
if player.Character and CONFIG.Movement.Float.Enabled then
    task.spawn(function()
        task.wait(0.5) -- Wait for character to fully load
    enableFloat(player.Character)
    end)
end

if player.Character and CONFIG.Movement.Rise.Enabled then
    print("🚀 Initializing Platform on existing character - CONFIG.Movement.Rise.Enabled:", CONFIG.Movement.Rise.Enabled)
    task.spawn(function()
        task.wait(0.5) -- Wait for character to fully load
        enablePlatform(player.Character)
    end)
else
    print("⚠️ Platform not initialized - player.Character:", player.Character, "CONFIG.Movement.Rise.Enabled:", CONFIG.Movement.Rise.Enabled)
end


-- Note: BindToClose can only be called by server, so we'll handle cleanup differently

local floatSwitch = createSwitch(_G.movementSection, "Float", CONFIG.Movement.Float.Enabled, function(on)
    CONFIG.Movement.Float.Enabled = on
    _G.saveSettings()
    if on then
        if player.Character then
            enableFloat(player.Character)
        end
        -- Auto-create side toggle when enabled
        _G.createCircularToggleUI("Float", function() return CONFIG.Movement.Float.Enabled end, function(state)
            CONFIG.Movement.Float.Enabled = state
            _G.saveSettings()
            if state then
                if player.Character then enableFloat(player.Character) end
            else
                disableFloat()
            end
        end)
    else
        disableFloat()
        -- Remove side toggle when disabled
        local existingToggle = _G.circularToggleGui:FindFirstChild("FloatToggleUI")
        if existingToggle then
            _G.OpenCircularToggles["Float"] = nil
            existingToggle:Destroy()
            _G.saveSettings()
        end
    end
    -- ActiveFeatures removed
    _G.saveSettings()
end)


local _, unhittableSwitchInstance = setupUnhittableControl(_G.movementSection)
local _, resizeSwitchInstance = setupResizeControl(_G.movementSection)

--=========================================================
-- Helicopter System
--=========================================================
local HELICOPTER_ENABLED = false
local helicopterConnections = {}
local helicopterBodyAngularVelocity = nil

local function enableHelicopter(character)
    local success, err = pcall(function()
        if HELICOPTER_ENABLED then return end

        -- Wait for HumanoidRootPart
        local rootPart = character:WaitForChild("HumanoidRootPart", 5)
        if not rootPart then
            error("HumanoidRootPart not found in character")
        end
        if rootPart.Anchored then
            error("HumanoidRootPart is anchored, cannot apply helicopter")
        end

        HELICOPTER_ENABLED = true

        -- Create BodyAngularVelocity for rotation
        helicopterBodyAngularVelocity = Instance.new("BodyAngularVelocity")
        helicopterBodyAngularVelocity.MaxTorque = Vector3.new(0, math.huge, 0) -- Only rotate on Y axis
        helicopterBodyAngularVelocity.AngularVelocity = Vector3.new(0, CONFIG.Movement.Helicopter.RotationSpeed, 0)
        helicopterBodyAngularVelocity.Parent = rootPart

        -- Main helicopter loop - just rotation and fling detection
        helicopterConnections.helicopter = RunService.Heartbeat:Connect(function()
            if not HELICOPTER_ENABLED or not rootPart or rootPart.Parent ~= character then
        return
    end
    
            -- Find and fling nearby players
            for _, otherPlayer in pairs(Players:GetPlayers()) do
                if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local otherRootPart = otherPlayer.Character.HumanoidRootPart
                    local distance = (otherRootPart.Position - rootPart.Position).Magnitude
                    
                    -- If close enough, fling them
                    if distance < 8 then
                        local direction = (otherRootPart.Position - rootPart.Position).Unit
                        local flingForce = direction * 100 + Vector3.new(0, 50, 0) -- Fixed power
                        
                        -- Apply fling force
                        otherRootPart.AssemblyLinearVelocity = flingForce
                    end
                end
            end
        end)

        -- Cleanup on death
        local humanoid = character:WaitForChild("Humanoid", 5)
        if humanoid then
            helicopterConnections.died = humanoid.Died:Connect(function()
                disableHelicopter()
            end)
        end
    end)
    
    if not success then
        warn("Failed to enable helicopter: " .. tostring(err))
        HELICOPTER_ENABLED = false
    end
end

local function disableHelicopter()
    local success, err = pcall(function()
        if not HELICOPTER_ENABLED then return end
        HELICOPTER_ENABLED = false
        for _, conn in pairs(helicopterConnections) do
            pcall(function() conn:Disconnect() end)
        end
        helicopterConnections = {}
        if helicopterBodyAngularVelocity then
            helicopterBodyAngularVelocity:Destroy()
            helicopterBodyAngularVelocity = nil
        end
    end)
    if not success then
        warn("Failed to disable helicopter: " .. tostring(err))
    end
end

-- Attach to current character and future spawns
player.CharacterAdded:Connect(function(newCharacter)
    pcall(function() disableHelicopter() end) -- Clean up old character
    pcall(function() disableGrappleFlight() end) -- Clean up old character
    pcall(function() disableInfiniteJump() end) -- Clean up old character
    pcall(function() disablePlatform() end) -- Clean up old character
    task.spawn(function()
        task.wait(0.1) -- Small delay to avoid race conditions
        if CONFIG.Movement.Helicopter.Enabled then
            enableHelicopter(newCharacter) -- Apply to new character
        end
        if CONFIG.Movement.GrappleFlight.Enabled then
            enableGrappleFlight() -- Apply to new character
        end
        if CONFIG.Movement.InfiniteJump.Enabled then
            enableInfiniteJump() -- Apply to new character
        end
        if CONFIG.Movement.Rise.Enabled then
            print("🔄 Enabling Platform on new character - CONFIG.Movement.Rise.Enabled:", CONFIG.Movement.Rise.Enabled)
            enablePlatform(newCharacter) -- Apply to new character
        end
    end)
end)

-- Apply to existing character if helicopter is enabled
if player.Character and CONFIG.Movement.Helicopter.Enabled then
    task.spawn(function()
        task.wait(0.1) -- Small delay to avoid race conditions
        enableHelicopter(player.Character)
    end)
end

-- Apply to existing character if grapple flight is enabled
-- Forward declarations so we can call these before their definitions below
local enableGrappleFlight
local enableInfiniteJump

if player.Character and CONFIG.Movement.GrappleFlight.Enabled then
    task.spawn(function()
        task.wait(0.1) -- Small delay to avoid race conditions
        enableGrappleFlight()
    end)
end

-- Apply to existing character if infinite jump is enabled
if player.Character and CONFIG.Movement.InfiniteJump.Enabled then
    task.spawn(function()
        task.wait(0.1) -- Small delay to avoid race conditions
        enableInfiniteJump()
    end)
end

--=========================================================
-- Grapple Flight System
--=========================================================
local grappleFlightEnabled = false
local grappleFlightConnection = nil
local grappleTool = nil
local flightPart = nil -- Track the welded part for cleanup

local function getGrappleHook()
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then return nil end

    grappleTool = backpack:FindFirstChild("Grapple Hook") or backpack:FindFirstChild("GrappleHook")
    if not grappleTool then
        grappleTool = workspace:FindFirstChild("Grapple Hook") or workspace:FindFirstChild("GrappleHook")
        if grappleTool and grappleTool:IsA("Tool") then
            grappleTool.Parent = backpack
        end
    end
    return grappleTool
end

local function equipGrappleHook()
    if not getGrappleHook() then return false end
    local char = player.Character
    if not char then return false end

    local equipped = char:FindFirstChild("Grapple Hook") or char:FindFirstChild("GrappleHook")
    if equipped then
        grappleTool = equipped
        return true
    end

    if grappleTool then
        grappleTool.Parent = char
        return true
    end
    return false
end

enableGrappleFlight = function()
    if grappleFlightEnabled then return end
    grappleFlightEnabled = true

    if not equipGrappleHook() then
        warn("No Grapple Hook found!")
        grappleFlightEnabled = false
        return
    end

    local char = player.Character
    if not char then return end
    
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if not hum or not root then return end

    -- Create invisible client-side part for anti-detection (like float system)
    flightPart = Instance.new("Part")
    flightPart.Size = Vector3.new(2, 1, 2) -- Small invisible part
    flightPart.Transparency = 1 -- Invisible
    flightPart.Anchored = false
    flightPart.CanCollide = false
    flightPart.Massless = true -- Reduces physics impact
    flightPart.Parent = workspace
    
    -- Weld the part to the character's root (anti-detection technique)
    local weld = Instance.new("Weld")
    weld.Part0 = root
    weld.Part1 = flightPart
    weld.C0 = CFrame.new(0, 0, 0) -- Position at character center
    weld.Parent = flightPart

    local spd = CONFIG.Movement.GrappleFlight.Speed
    local bodyVel

    grappleFlightConnection = RunService.Heartbeat:Connect(function()
        local char = player.Character
        if not char then return end

        local hum = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not hum or not root then return end

        -- Fire grapple remote
        local net = require(ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net"))
        net:RemoteEvent("UseItem"):FireServer(0.1)

        -- Apply BodyVelocity to the welded part instead of character (anti-detection)
        if not bodyVel or not bodyVel.Parent then
            bodyVel = Instance.new("BodyVelocity")
            bodyVel.Name = "FlyVel"
            bodyVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bodyVel.P = 2000
            bodyVel.Parent = flightPart -- Apply to welded part, not character
        end

        local dir = Vector3.new(0,0,0)

        -- PC Controls (Keyboard)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            dir = dir + workspace.CurrentCamera.CFrame.LookVector*spd
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            dir = dir - workspace.CurrentCamera.CFrame.LookVector*spd
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            dir = dir - workspace.CurrentCamera.CFrame.RightVector*spd
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            dir = dir + workspace.CurrentCamera.CFrame.RightVector*spd
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            dir = dir + Vector3.new(0,spd,0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            dir = dir - Vector3.new(0,spd,0)
        end

        -- Mobile Controls (Touch) - Simple and effective
        local touchEnabled = UserInputService.TouchEnabled
        if touchEnabled then
            -- Use the humanoid's MoveDirection for mobile (works with virtual joystick)
            local moveDirection = hum.MoveDirection
            if moveDirection.Magnitude > 0 then
                -- Convert move direction to world space
                local camera = workspace.CurrentCamera
                local lookVector = camera.CFrame.LookVector
                local rightVector = camera.CFrame.RightVector
                
                -- Calculate movement based on move direction
                local forward = moveDirection.Z
                local right = moveDirection.X
                local up = moveDirection.Y
                
                -- Apply movement
                if forward > 0 then
                    dir = dir + lookVector * spd * forward
                elseif forward < 0 then
                    dir = dir + lookVector * spd * forward
                end
                
                if right > 0 then
                    dir = dir + rightVector * spd * right
                elseif right < 0 then
                    dir = dir + rightVector * spd * right
                end
                
                if up > 0 then
                    dir = dir + Vector3.new(0, spd * up, 0)
                elseif up < 0 then
                    dir = dir + Vector3.new(0, spd * up, 0)
                end
            end
        end

        -- Prevent flinging by limiting velocity magnitude
        local velocityMagnitude = dir.Magnitude
        if velocityMagnitude > spd * 1.5 then
            dir = dir.Unit * (spd * 1.5) -- Cap at 1.5x speed to prevent flinging
        end

        bodyVel.Velocity = dir
        hum:ChangeState(Enum.HumanoidStateType.Physics)
    end)
end

local function disableGrappleFlight()
    if not grappleFlightEnabled then return end
    grappleFlightEnabled = false

    if grappleFlightConnection then
        grappleFlightConnection:Disconnect()
        grappleFlightConnection = nil
    end

    local char = player.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")

        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Running)
        end

        -- Unequip grapple hook
        local equippedGrapple = char:FindFirstChild("Grapple Hook") or char:FindFirstChild("GrappleHook")
        if equippedGrapple and equippedGrapple:IsA("Tool") then
            equippedGrapple.Parent = player:FindFirstChild("Backpack")
        end

        -- Clean up welded flight part (anti-detection cleanup)
        if flightPart then
            flightPart:Destroy()
            flightPart = nil
        end
    end
end

local grappleFlightSwitch = createSwitch(_G.movementSection, "Grapple Flight", CONFIG.Movement.GrappleFlight.Enabled, function(on)
    CONFIG.Movement.GrappleFlight.Enabled = on
    _G.saveSettings()
    if on then
        enableGrappleFlight()
        -- Auto-create side toggle when enabled
        _G.createCircularToggleUI("Grapple Flight", function() return CONFIG.Movement.GrappleFlight.Enabled end, function(state)
            CONFIG.Movement.GrappleFlight.Enabled = state
            _G.saveSettings()
            if state then
                enableGrappleFlight()
            else
                disableGrappleFlight()
            end
        end)
    else
        disableGrappleFlight()
        -- Remove side toggle when disabled
        local existingToggle = _G.circularToggleGui:FindFirstChild("Grapple FlightToggleUI")
        if existingToggle then
            _G.OpenCircularToggles["Grapple Flight"] = nil
            existingToggle:Destroy()
            _G.saveSettings()
        end
    end
    -- ActiveFeatures removed
    _G.saveSettings()
end)

--=========================================================
-- Infinite Jump System
--=========================================================
local infiniteJumpEnabled = false
local infiniteJumpConnection = nil
local infiniteJumpPart = nil
local infiniteJumpBodyVel = nil
local lastJump = 0

local function doInfiniteJump()
    local char = player.Character
    if not char then return end
    
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if not humanoid or not root then return end

    -- Check cooldown
    if tick() - lastJump < CONFIG.Movement.InfiniteJump.Cooldown then return end
    lastJump = tick()

    -- Create welded part for anti-detection (like float system)
    if not infiniteJumpPart or not infiniteJumpPart.Parent then
        infiniteJumpPart = Instance.new("Part")
        infiniteJumpPart.Size = Vector3.new(1, 1, 1)
        infiniteJumpPart.Transparency = 1
        infiniteJumpPart.Anchored = false
        infiniteJumpPart.CanCollide = false
        infiniteJumpPart.Massless = true
        infiniteJumpPart.Parent = workspace
        
        -- Weld to character
        local weld = Instance.new("Weld")
        weld.Part0 = root
        weld.Part1 = infiniteJumpPart
        weld.C0 = CFrame.new(0, 0, 0)
        weld.Parent = infiniteJumpPart
    end

    -- Create BodyVelocity for boost (apply to welded part for anti-detection)
    local bodyVel = infiniteJumpPart:FindFirstChild("InfiniteJumpBoost") or Instance.new("BodyVelocity")
    bodyVel.Name = "InfiniteJumpBoost"
    bodyVel.MaxForce = Vector3.new(0, math.huge, 0) -- Only Y axis
    bodyVel.Velocity = Vector3.new(0, CONFIG.Movement.InfiniteJump.JumpPower, 0)
    bodyVel.P = 5000
    bodyVel.Parent = infiniteJumpPart -- Apply to welded part, not character

    -- Trigger humanoid jump
    humanoid.Jump = true
    
    -- Remove boost after short duration
    task.delay(0.1, function()
        if bodyVel and bodyVel.Parent then
            bodyVel:Destroy()
        end
        if humanoid then 
            humanoid.Jump = false 
        end
    end)
end

enableInfiniteJump = function()
    if infiniteJumpEnabled then return end
    infiniteJumpEnabled = true
    
    infiniteJumpConnection = RunService.Heartbeat:Connect(function()
        local char = player.Character
        if not char then return end
        
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        
        -- Check for jump input (works on both PC and mobile)
        local isJumping = false
        
        -- PC: Check for Space key
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            isJumping = true
        end
        
        -- Mobile: Check if humanoid is jumping (works with virtual jump button)
        if humanoid:GetState() == Enum.HumanoidStateType.Jumping then
            isJumping = true
        end
        
        -- Also check humanoid.Jump property (catches mobile jumps)
        if humanoid.Jump then
            isJumping = true
        end
        
        if isJumping then
            doInfiniteJump()
        end
    end)
end

local function disableInfiniteJump()
    if not infiniteJumpEnabled then return end
    infiniteJumpEnabled = false
    
    if infiniteJumpConnection then
        infiniteJumpConnection:Disconnect()
        infiniteJumpConnection = nil
    end
    
    -- Clean up BodyVelocity from welded part
    if infiniteJumpPart then
        local bodyVel = infiniteJumpPart:FindFirstChild("InfiniteJumpBoost")
        if bodyVel then
            bodyVel:Destroy()
        end
        infiniteJumpPart:Destroy()
        infiniteJumpPart = nil
    end
end

local infiniteJumpSwitch = createSwitch(_G.movementSection, "Infinite Jump", CONFIG.Movement.InfiniteJump.Enabled, function(on)
    CONFIG.Movement.InfiniteJump.Enabled = on
    _G.saveSettings()
    if on then
        enableInfiniteJump()
        -- Auto-create side toggle when enabled
        _G.createCircularToggleUI("Infinite Jump", function() return CONFIG.Movement.InfiniteJump.Enabled end, function(state)
            CONFIG.Movement.InfiniteJump.Enabled = state
            _G.saveSettings()
            if state then
                enableInfiniteJump()
            else
                disableInfiniteJump()
            end
        end)
    else
        disableInfiniteJump()
        -- Remove side toggle when disabled
        local existingToggle = _G.circularToggleGui:FindFirstChild("Infinite JumpToggleUI")
        if existingToggle then
            _G.OpenCircularToggles["Infinite Jump"] = nil
            existingToggle:Destroy()
            _G.saveSettings()
        end
    end
    -- ActiveFeatures removed
    _G.saveSettings()
end)

---=========================================================
--- Platform System (3rd Floor)
---=========================================================
local platform, connection
local platformActive, isRising = false, false

local function destroyPlatform()
    if platform then 
        platform:Destroy() 
        platform = nil 
    end
    platformActive = false 
    isRising = false
    if connection then 
        connection:Disconnect() 
        connection = nil 
    end
end

local function canRise()
    if not platform then return false end
    local origin = platform.Position + Vector3.new(0, platform.Size.Y/2, 0)
    local direction = Vector3.new(0, 2, 0)
    local rayParams = RaycastParams.new()
    rayParams.FilterDescendantsInstances = {platform, player.Character}
    rayParams.FilterType = Enum.RaycastFilterType.Blacklist
    return not workspace:Raycast(origin, direction, rayParams)
end

local function setupPlatform(character)
    local rootPart = character:WaitForChild("HumanoidRootPart")
    
    -- Clean up on character death
    character:WaitForChild("Humanoid").Died:Connect(destroyPlatform)
end

local function enablePlatform(character)
    local success, err = pcall(function()
        if platformActive then return end
        
        local rootPart = character:WaitForChild("HumanoidRootPart")
        if not rootPart then
            warn("Failed to find HumanoidRootPart for Platform")
            return
        end
        
        platformActive = true
        
        platform = Instance.new("Part")
        platform.Size = Vector3.new(6, 0.5, 6)
        platform.Anchored = true
        platform.CanCollide = true
        platform.Transparency = 0
        platform.Material = Enum.Material.Neon
        platform.Color = Color3.fromRGB(100, 200, 255) -- Light blue to match UI
        platform.Position = rootPart.Position - Vector3.new(0, rootPart.Size.Y/2 + platform.Size.Y/2, 0)
        platform.Parent = workspace

        local faces = {Enum.NormalId.Top, Enum.NormalId.Bottom, Enum.NormalId.Left, Enum.NormalId.Right, Enum.NormalId.Front, Enum.NormalId.Back}
        for _, face in ipairs(faces) do
            local texture = Instance.new("Texture")
            texture.Texture = "rbxassetid://6731652062"
            texture.Face = face
            texture.StudsPerTileU = 4
            texture.StudsPerTileV = 4
            texture.Parent = platform
        end

        isRising = true
        connection = RunService.Heartbeat:Connect(function(dt)
            if platform and platformActive then
                local currentPos = platform.Position
                local newXZ = Vector3.new(rootPart.Position.X, currentPos.Y, rootPart.Position.Z)
                if isRising and canRise() then
                    platform.Position = newXZ + Vector3.new(0, dt * CONFIG.Movement.Rise.Speed, 0)
                else
                    isRising = false
                    platform.Position = newXZ
                end
            end
        end)
        
        -- Clean up on character death
        character:WaitForChild("Humanoid").Died:Connect(destroyPlatform)
        
        print("✅ Platform enabled")
    end)
    
    if not success then
        warn("Platform enable error: " .. tostring(err))
        destroyPlatform()
    end
end

local function disablePlatform()
    local success, err = pcall(function()
        destroyPlatform()
        print("❌ Platform disabled")
    end)
    
    if not success then
        warn("Platform disable error: " .. tostring(err))
    end
end

local platformSwitch = createSwitch(_G.movementSection, "Platform", CONFIG.Movement.Rise.Enabled, function(on)
    print("🔧 Platform switch toggled:", on)
    CONFIG.Movement.Rise.Enabled = on
    _G.saveSettings()
    _G.SavedToggleStates.Rise = on
    if on then
        if player.Character then
            print("✅ Enabling Platform on existing character")
            enablePlatform(player.Character)
        else
            print("⚠️ No character found, Platform will be enabled on next spawn")
        end
        -- Auto-create side toggle when enabled
        _G.createCircularToggleUI("Platform", function() return CONFIG.Movement.Rise.Enabled end, function(state)
            CONFIG.Movement.Rise.Enabled = state
            _G.saveSettings()
            if state then
                if player.Character then enablePlatform(player.Character) end
            else
                disablePlatform()
            end
        end)
    else
        print("❌ Disabling Platform")
        disablePlatform()
        -- Remove side toggle when disabled
        local existingToggle = _G.circularToggleGui:FindFirstChild("PlatformToggleUI")
        if existingToggle then
            _G.OpenCircularToggles["Platform"] = nil
            existingToggle:Destroy()
            _G.saveSettings()
        end
    end
    _G.saveSettings()
end)


local helicopterSwitch = createSwitch(_G.movementSection, "Helicopter", CONFIG.Movement.Helicopter.Enabled, function(on)
    CONFIG.Movement.Helicopter.Enabled = on
    _G.saveSettings()
    if on then
        if player.Character then
            enableHelicopter(player.Character)
        end
        -- Auto-create side toggle when enabled
        _G.createCircularToggleUI("Helicopter", function() return CONFIG.Movement.Helicopter.Enabled end, function(state)
            CONFIG.Movement.Helicopter.Enabled = state
            _G.saveSettings()
            if state then
                if player.Character then enableHelicopter(player.Character) end
            else
                disableHelicopter()
            end
        end)
    else
        disableHelicopter()
        -- Remove side toggle when disabled
        local existingToggle = _G.circularToggleGui:FindFirstChild("HelicopterToggleUI")
        if existingToggle then
            _G.OpenCircularToggles["Helicopter"] = nil
            existingToggle:Destroy()
            _G.saveSettings()
        end
    end
    -- ActiveFeatures removed
    _G.saveSettings()
end)


--- Fling System
createSectionHeader(_G.movementSection, "Fling System")

-- Fling variables (Global to save local registers)
_G.SelectedPlayer = nil
_G.Flinging = false
_G.FlingConnection = nil
_G.GrappleTool = nil

-- Find grapple tool function
_G.findGrapple = function()
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then return nil end
    _G.GrappleTool = backpack:FindFirstChild("Grapple Hook") or backpack:FindFirstChild("GrappleHook")
    if not _G.GrappleTool then
        _G.GrappleTool = workspace:FindFirstChild("Grapple Hook") or workspace:FindFirstChild("GrappleHook")
        if _G.GrappleTool and _G.GrappleTool:IsA("Tool") then
            _G.GrappleTool.Parent = backpack
        end
    end
    return _G.GrappleTool
end

-- Equip grapple function
_G.equipGrapple = function()
    if not _G.findGrapple() then return false end
    local char = player.Character
    if not char then return false end
    local equippedTool = char:FindFirstChild("Grapple Hook") or char:FindFirstChild("GrappleHook")
    if equippedTool then
        _G.GrappleTool = equippedTool
        return true
    end
    if _G.GrappleTool then
        _G.GrappleTool.Parent = char
        return true
    end
    return false
end

-- Start fling function
_G.startFling = function()
    if _G.Flinging or not _G.SelectedPlayer then return end
    _G.Flinging = true
    
    if not _G.equipGrapple() then
        warn("Grapple not found")
        _G.Flinging = false
        return
    end

    local spin, power = 0, 220

    _G.FlingConnection = RunService.Heartbeat:Connect(function()
        local char = player.Character
        if not char or not _G.SelectedPlayer or not _G.SelectedPlayer.Character then
            return
        end

        local humanoid = char:FindFirstChildOfClass("Humanoid")
        local rootPart = char:FindFirstChild("HumanoidRootPart")
        local targetRoot = _G.SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")
        local targetHumanoid = _G.SelectedPlayer.Character:FindFirstChildOfClass("Humanoid")
        if not humanoid or not rootPart or not targetRoot or not targetHumanoid then return end

        local distance = (targetRoot.Position - rootPart.Position).Magnitude
        local net = require(ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net"))
        net:RemoteEvent("UseItem"):FireServer(distance / 120)

        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        targetHumanoid:ChangeState(Enum.HumanoidStateType.Physics)

        spin = spin + 12
        local offset = Vector3.new(math.sin(math.rad(spin)) * 2.5, 1.5, math.cos(math.rad(spin)) * 2.5)
        local prediction = targetRoot.Velocity * 0.3
        local targetPos = targetRoot.Position + offset + prediction
        local direction = (targetPos - rootPart.Position).Unit
        local velocity = direction * power + Vector3.new(0, 65, 0)

        local bodyVelocity = rootPart:FindFirstChild("FlightPower") or Instance.new("BodyVelocity")
        bodyVelocity.Name = "FlightPower"
        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyVelocity.Velocity = velocity
        bodyVelocity.P = 9000
        bodyVelocity.Parent = rootPart

        local distanceTo = (targetRoot.Position - rootPart.Position).Magnitude
        if distanceTo < 7 then
            local targetBodyVelocity = targetRoot:FindFirstChild("TargetFling") or Instance.new("BodyVelocity")
            targetBodyVelocity.Name = "TargetFling"
            targetBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            targetBodyVelocity.Velocity = (targetRoot.Position - rootPart.Position).Unit * 130 + Vector3.new(0, 100, 0)
            targetBodyVelocity.P = 6500
            targetBodyVelocity.Parent = targetRoot

            local targetSpin = targetRoot:FindFirstChild("TargetSpin") or Instance.new("BodyAngularVelocity")
            targetSpin.Name = "TargetSpin"
            targetSpin.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            targetSpin.AngularVelocity = Vector3.new((math.random()-0.5)*25,(math.random()-0.5)*25,(math.random()-0.5)*25)
            targetSpin.P = 4500
            targetSpin.Parent = targetRoot
        end
    end)
end

-- Stop fling function
_G.stopFling = function()
    if not _G.Flinging then return end
    _G.Flinging = false

    if _G.FlingConnection then
        _G.FlingConnection:Disconnect()
        _G.FlingConnection = nil
    end

    local char = player.Character
    if char then
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        local rootPart = char:FindFirstChild("HumanoidRootPart")
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.Running) end
        if rootPart then
            local bodyVelocity = rootPart:FindFirstChild("FlightPower")
            if bodyVelocity then bodyVelocity:Destroy() end
        end
    end

    if _G.SelectedPlayer and _G.SelectedPlayer.Character then
        local targetRoot = _G.SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")
        local targetHumanoid = _G.SelectedPlayer.Character:FindFirstChildOfClass("Humanoid")
        if targetHumanoid then targetHumanoid:ChangeState(Enum.HumanoidStateType.Running) end
        if targetRoot then
            local targetBodyVelocity = targetRoot:FindFirstChild("TargetFling")
            if targetBodyVelocity then targetBodyVelocity:Destroy() end
            local targetSpin = targetRoot:FindFirstChild("TargetSpin")
            if targetSpin then targetSpin:Destroy() end
        end
    end
end


-- Fling toggle button with better status feedback
local flingToggleButton = nil

local function createFlingButton()
    flingToggleButton = createButton(_G.movementSection, "Fling Em", function()
        local success, err = pcall(function()
            if not flingToggleButton then return end
            
            if _G.Flinging then
                _G.stopFling()
                flingToggleButton.Text = "Fling Em"
                flingToggleButton.BackgroundColor3 = CONFIG.Colors.Background
                flingToggleButton.TextColor3 = CONFIG.Colors.Text
            else
                if not _G.SelectedPlayer then
                    warn("Please select a player first!")
                    return
                end
                _G.startFling()
                flingToggleButton.Text = "Fling Em"
                flingToggleButton.BackgroundColor3 = Color3.fromRGB(0, 162, 255) -- Bright blue
                flingToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text for contrast
            end
        end)
        if not success then
            warn("Fling button error: " .. tostring(err))
        end
    end)
end

createFlingButton()

-- Function to update fling button status
local function updateFlingButtonStatus()
    local success, err = pcall(function()
        if not flingToggleButton then return end
        
        if _G.Flinging then
            flingToggleButton.Text = "Fling Em"
            flingToggleButton.BackgroundColor3 = Color3.fromRGB(0, 162, 255) -- Bright blue
            flingToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text for contrast
        else
            flingToggleButton.Text = "Fling Em"
            flingToggleButton.BackgroundColor3 = CONFIG.Colors.Background
            flingToggleButton.TextColor3 = CONFIG.Colors.Text
        end
    end)
    if not success then
        warn("Update fling button status error: " .. tostring(err))
    end
end

-- Update button when player is selected
local originalPlayerSelectButton = playerSelectButton
playerSelectButton = createButton(_G.movementSection, "Select Player for Fling", function()
    local success, err = pcall(function()
        local players = Players:GetPlayers()
        local otherPlayers = {}
        for _, p in pairs(players) do
            if p ~= player then
                table.insert(otherPlayers, p)
            end
        end
        
        if #otherPlayers == 0 then
            playerSelectButton.Text = "No Players Available"
            playerSelectButton.BackgroundColor3 = CONFIG.Colors.Danger
            _G.SelectedPlayer = nil
            updateFlingButtonStatus()
        return
    end
    
    -- Create player selection UI
    local playerSelectGui = createProtectedScreenGui("PlayerSelectGui")
    
    -- Main frame (draggable)
    local selectFrame = Instance.new("Frame")
    selectFrame.Size = UDim2.new(0, 300, 0, math.min(400, 60 + (#otherPlayers * 45)))
    selectFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    selectFrame.BackgroundColor3 = CONFIG.Colors.Panel
    selectFrame.Parent = playerSelectGui
    Instance.new("UICorner", selectFrame).CornerRadius = UDim.new(0, 12)
    
    local stroke = Instance.new("UIStroke", selectFrame)
    stroke.Thickness = 2
    stroke.Color = CONFIG.Colors.Stroke
    stroke.Transparency = 0.2
    
    -- Dragging functionality
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    local function startDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = selectFrame.Position
            stroke.Transparency = 0 -- Visual feedback
        end
    end
    
    local function updateDrag(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            selectFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end
    
    local function endDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            stroke.Transparency = 0.2 -- Reset visual feedback
        end
    end
    
    -- Apply dragging to the frame
    selectFrame.InputBegan:Connect(startDrag)
    selectFrame.InputChanged:Connect(updateDrag)
    selectFrame.InputEnded:Connect(endDrag)
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -60, 0, 40)
    titleLabel.Position = UDim2.new(0, 10, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Select Player to Fling"
    titleLabel.TextColor3 = CONFIG.Colors.Text
    titleLabel.TextSize = 18
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = selectFrame
    
    -- Close button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -40, 0, 10)
    closeBtn.BackgroundColor3 = CONFIG.Colors.Danger
    closeBtn.Text = "x"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextSize = 16
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.AutoButtonColor = false
    closeBtn.Parent = selectFrame
    closeBtn.ZIndex = 10
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 15)
    
    -- Scroll frame for players
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, -20, 1, -60)
    scrollFrame.Position = UDim2.new(0, 10, 0, 50)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.ScrollBarThickness = 6
    scrollFrame.ScrollBarImageColor3 = CONFIG.Colors.Accent
    scrollFrame.Parent = selectFrame
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 5)
    listLayout.Parent = scrollFrame
    
    -- Create player buttons
    for i, targetPlayer in ipairs(otherPlayers) do
        local playerBtn = Instance.new("TextButton")
        playerBtn.Size = UDim2.new(1, -10, 0, 35)
        playerBtn.BackgroundColor3 = CONFIG.Colors.Background
        playerBtn.Text = targetPlayer.Name .. " (ID: " .. targetPlayer.UserId .. ")"
        playerBtn.TextColor3 = CONFIG.Colors.Text
        playerBtn.TextSize = 14
        playerBtn.Font = Enum.Font.Gotham
        playerBtn.AutoButtonColor = false
        playerBtn.Parent = scrollFrame
        Instance.new("UICorner", playerBtn).CornerRadius = UDim.new(0, 6)
        
        local btnStroke = Instance.new("UIStroke", playerBtn)
        btnStroke.Thickness = 1
        btnStroke.Color = CONFIG.Colors.Stroke
        btnStroke.Transparency = 0.5
        
        -- Hover effects
        playerBtn.MouseEnter:Connect(function()
            playerBtn.BackgroundColor3 = CONFIG.Colors.Accent
            btnStroke.Transparency = 0.2
        end)
        
        playerBtn.MouseLeave:Connect(function()
            playerBtn.BackgroundColor3 = CONFIG.Colors.Background
            btnStroke.Transparency = 0.5
        end)
        
        -- Selection
        playerBtn.MouseButton1Click:Connect(function()
            _G.SelectedPlayer = targetPlayer
            playerSelectButton.Text = "Selected: " .. targetPlayer.Name
            playerSelectButton.BackgroundColor3 = CONFIG.Colors.Accent
            playerSelectGui:Destroy()
            updateFlingButtonStatus() -- Update fling button status
        end)
        
        -- Mobile support for player selection
        playerBtn.TouchTap:Connect(function()
            _G.SelectedPlayer = targetPlayer
            playerSelectButton.Text = "Selected: " .. targetPlayer.Name
            playerSelectButton.BackgroundColor3 = CONFIG.Colors.Accent
            playerSelectGui:Destroy()
            updateFlingButtonStatus() -- Update fling button status
        end)
    end
    
    -- Update scroll canvas size
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
    end)
    
    -- Close button functionality
    closeBtn.MouseButton1Click:Connect(function()
        playerSelectGui:Destroy()
    end)
    
    -- Mobile support for close button
    closeBtn.TouchTap:Connect(function()
        playerSelectGui:Destroy()
    end)
    
    -- Click outside to close (use a frame instead of ScreenGui)
    local backgroundFrame = Instance.new("Frame")
    backgroundFrame.Size = UDim2.new(1, 0, 1, 0)
    backgroundFrame.Position = UDim2.new(0, 0, 0, 0)
    backgroundFrame.BackgroundTransparency = 1
    backgroundFrame.Parent = playerSelectGui
    
    backgroundFrame.MouseButton1Click:Connect(function()
        playerSelectGui:Destroy()
    end)
    
    -- Mobile support for click outside to close
    backgroundFrame.TouchTap:Connect(function()
        playerSelectGui:Destroy()
    end)
    
    selectFrame.MouseButton1Click:Connect(function(input)
        input.Handled = true -- Prevent closing when clicking inside the frame
    end)
    end)
    if not success then
        warn("Player selection error: " .. tostring(err))
    end
end)


-- Visual Section
createSectionHeader(_G.visualSection, "ESP Controls")
_G.playerESPSwitch = createSwitch(_G.visualSection, "Player ESP", _G.SavedToggleStates and _G.SavedToggleStates.PlayerESP or false, function(on)
    if on then
        enableESP()
        -- Auto-create side toggle when enabled
        _G.createCircularToggleUI("Player ESP", function() return _G.ESP_Enabled end, function(state)
            if state then enableESP() else disableESP() end
        end)
    else
        disableESP()
        -- Remove side toggle when disabled
        local existingToggle = _G.circularToggleGui:FindFirstChild("Player ESPToggleUI")
        if existingToggle then
            _G.OpenCircularToggles["Player ESP"] = nil
            existingToggle:Destroy()
            _G.saveSettings()
        end
    end
    -- ActiveFeatures removed
    _G.saveSettings()
end)

_G.plotESPSwitch = createSwitch(_G.visualSection, "Plot ESP", _G.SavedToggleStates and _G.SavedToggleStates.PlotESP or false, function(on)
    if on then
        enablePlotESP()
        -- Auto-create side toggle when enabled
        _G.createCircularToggleUI("Plot ESP", function() return _G.PlotESP_Enabled end, function(state)
            if state then enablePlotESP() else disablePlotESP() end
        end)
    else
        disablePlotESP()
        -- Remove side toggle when disabled
        local existingToggle = _G.circularToggleGui:FindFirstChild("Plot ESPToggleUI")
        if existingToggle then
            _G.OpenCircularToggles["Plot ESP"] = nil
            existingToggle:Destroy()
            _G.saveSettings()
        end
    end
    -- ActiveFeatures removed
    _G.saveSettings()
end)

-- Plot Time ESP switch will be created later after functions are defined

-- Patched Section
createSectionHeader(_G.patchedSection, "Patched Features")
local invisibilitySwitch = createSwitch(_G.patchedSection, "Invisibility (patched)", _G.SavedToggleStates and _G.SavedToggleStates.Invisibility or false, function(on)
    setInvisibility(on)
    if on then
        -- Auto-create side toggle when enabled
        _G.createCircularToggleUI("Invisibility", function() return invisibilitySwitch.get() end, function(state) invisibilitySwitch.set(state) end)
    else
        -- Remove side toggle when disabled
        local existingToggle = _G.circularToggleGui:FindFirstChild("InvisibilityToggleUI")
        if existingToggle then
            _G.OpenCircularToggles["Invisibility"] = nil
            existingToggle:Destroy()
            _G.saveSettings()
        end
    end
    -- ActiveFeatures removed
    _G.saveSettings()
end)
local _, flingSwitchInstance = setupFlingControl(_G.patchedSection)


-- Server Section (Global Variables to Save Local Registers)
_G.ServerHopActive = false
_G.CurrentServerId = game.JobId

_G.getServerList = function()
    local ok, result = pcall(function()
        local response = _G.safeHttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
        if not response then
            return {}
        end
        return HttpService:JSONDecode(response)
    end)
    return ok and result and result.data and result.data or {}
end

_G.joinBiggestServer = function()
    pcall(function()
        local servers = _G.getServerList()
        local biggest, maxPlayers = nil, 0
        for _, server in ipairs(servers) do
            if server.id ~= _G.CurrentServerId and server.playing and server.maxPlayers and 
               server.playing < server.maxPlayers and server.playing > maxPlayers then
                biggest, maxPlayers = server, server.playing
            end
        end
        if biggest then
            print("🔄 Joining biggest server with " .. biggest.playing .. "/" .. biggest.maxPlayers .. " players")
            TeleportService:TeleportToPlaceInstance(game.PlaceId, biggest.id, player)
        else
            game.StarterGui:SetCore("SendNotification", {Title = "ZZZZ HUB", Text = "No available servers found!", Duration = 3})
        end
    end)
end

_G.joinSmallestServer = function()
    pcall(function()
        local servers = _G.getServerList()
        local smallest, minPlayers = nil, math.huge
        for _, server in ipairs(servers) do
            if server.id ~= _G.CurrentServerId and server.playing and server.maxPlayers and 
               server.playing < server.maxPlayers and server.playing < minPlayers then
                smallest, minPlayers = server, server.playing
            end
        end
        if smallest then
            print("🔄 Joining smallest server with " .. smallest.playing .. "/" .. smallest.maxPlayers .. " players")
            TeleportService:TeleportToPlaceInstance(game.PlaceId, smallest.id, player)
        else
            game.StarterGui:SetCore("SendNotification", {Title = "ZZZZ HUB", Text = "No available servers found!", Duration = 3})
        end
    end)
end

_G.rejoinServer = function()
    pcall(function()
        print("🔄 Rejoining current server...")
        TeleportService:TeleportToPlaceInstance(game.PlaceId, _G.CurrentServerId, player)
    end)
end

_G.toggleServerHop = function(on)
    _G.ServerHopActive = on
    if on then
        -- Start server hopping
        task.spawn(function()
            while _G.ServerHopActive do
                local success, err = pcall(function()
                    local serverList = _G.getServerList()
                    if serverList and #serverList > 0 then
                        -- Filter out current server and full servers
                        local validServers = {}
                        for _, server in ipairs(serverList) do
                            if server.id and server.id ~= _G.CurrentServerId and 
                               server.playing and server.maxPlayers and 
                               server.playing < server.maxPlayers then
                                table.insert(validServers, server)
                            end
                        end
                        
                        if #validServers > 0 then
                            local target = validServers[math.random(1, #validServers)]
                            print("🔄 Hopping to server with " .. target.playing .. "/" .. target.maxPlayers .. " players")
                            TeleportService:TeleportToPlaceInstance(game.PlaceId, target.id, player)
                        else
                            warn("No valid servers available for hopping")
                        end
                    else
                        warn("No servers available for hopping")
                    end
                end)
                if not success then
                    warn("Server hop failed: " .. tostring(err) .. ", retrying in 10 seconds...")
                    task.wait(10) -- Wait longer on failure
                else
                    task.wait(15) -- Wait longer between successful hops
                end
            end
        end)
    end
end

createSectionHeader(_G.serverSection, "Server Options")
local serverHopSwitch = createSwitch(_G.serverSection, "Auto Server Hop", false, function(on)
    _G.toggleServerHop(on)
    -- ActiveFeatures removed
    _G.saveSettings()
end)

-- Server Buttons
createButton(_G.serverSection, "Rejoin Server", _G.rejoinServer)
createButton(_G.serverSection, "Join Biggest Server", _G.joinBiggestServer)
createButton(_G.serverSection, "Join Smallest Server", _G.joinSmallestServer)


-- Brainrot ESP toggle will be created after function definitions







-- Settings Section
createSectionHeader(settingsContent, "ESP Settings")

-- Player ESP Toggles
createSwitch(settingsContent, "Show Player Distance", CONFIG.ESP.PlayerESP.ShowDistance, function(on)
    local success, _ = pcall(function()
        CONFIG.ESP.PlayerESP.ShowDistance = on
        _G.saveSettings()
        -- Recreate all player ESP billboards
        if ESP_Enabled then
            for plr, data in pairs(ESP_Data) do
                if typeof(plr) == "Instance" and data.billboard then
                    data.billboard:Destroy()
                    local newBillboard, newDistanceLabel, newIconFrame = createBillboardGui(plr, plr.Character)
                    if newBillboard then
                        data.billboard = newBillboard
                        data.distanceLabel = newDistanceLabel
                        data.iconFrame = newIconFrame
                    end
                end
            end
        end
    end)
    if not success then
        warn("Failed to update Player ESP Distance setting")
    end
end)

createSwitch(settingsContent, "Show Player Items", CONFIG.ESP.PlayerESP.ShowItems, function(on)
    local success, _ = pcall(function()
        CONFIG.ESP.PlayerESP.ShowItems = on
        _G.saveSettings()
        -- Recreate all player ESP billboards
        if ESP_Enabled then
            for plr, data in pairs(ESP_Data) do
                if typeof(plr) == "Instance" and data.billboard then
                    data.billboard:Destroy()
                    local newBillboard, newDistanceLabel, newIconFrame = createBillboardGui(plr, plr.Character)
                    if newBillboard then
                        data.billboard = newBillboard
                        data.distanceLabel = newDistanceLabel
                        data.iconFrame = newIconFrame
                    end
                end
            end
        end
    end)
    if not success then
        warn("Failed to update Player ESP Items setting")
    end
end)

-- Player ESP Color Picker
createSectionHeader(settingsContent, "Player ESP Color")
local playerColorButton = Instance.new("TextButton")
playerColorButton.Size = UDim2.new(1, 0, 0, 40)
playerColorButton.BackgroundColor3 = CONFIG.ESP.PlayerESP.HighlightColor
playerColorButton.Text = "Pick Player ESP Color"
playerColorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
playerColorButton.Font = Enum.Font.GothamBold
playerColorButton.TextSize = 16
playerColorButton.AutoButtonColor = false
playerColorButton.Parent = settingsContent
Instance.new("UICorner", playerColorButton).CornerRadius = UDim.new(0, 8)
local playerColorStroke = Instance.new("UIStroke", playerColorButton)
playerColorStroke.Thickness = 1
playerColorStroke.Color = Color3.fromRGB(255, 255, 255)
playerColorStroke.Transparency = 0.3

playerColorButton.MouseButton1Click:Connect(function()
    local success, _ = pcall(function()
        -- Simple color picker using random colors for demo
        local colors = {
            Color3.fromRGB(255, 0, 0),    -- Red
            Color3.fromRGB(0, 255, 0),    -- Green
            Color3.fromRGB(0, 0, 255),    -- Blue
            Color3.fromRGB(255, 255, 0),  -- Yellow
            Color3.fromRGB(255, 0, 255),  -- Magenta
            Color3.fromRGB(0, 255, 255),  -- Cyan
            Color3.fromRGB(255, 165, 0),  -- Orange
            Color3.fromRGB(128, 0, 128),  -- Purple
        }
        local randomColor = colors[math.random(1, #colors)]
        CONFIG.ESP.PlayerESP.HighlightColor = randomColor
        playerColorButton.BackgroundColor3 = randomColor
        _G.saveSettings()
        -- Update existing highlights with new color
        for plr, data in pairs(_G.ESP_Data) do
            if typeof(plr) == "Instance" and data.highlight and plr.Character then
                -- Update existing highlight color
                pcall(function() 
                    data.highlight.FillColor = CONFIG.ESP.PlayerESP.HighlightColor
                    data.highlight.OutlineColor = CONFIG.ESP.PlayerESP.HighlightColor
                    print("🎨 Updated Player ESP color for: " .. plr.Name)
                end)
            end
        end
        
        -- Also update any existing highlights in the character
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character then
                local existingHighlight = plr.Character:FindFirstChildOfClass("Highlight")
                if existingHighlight then
                    pcall(function()
                        existingHighlight.FillColor = CONFIG.ESP.PlayerESP.HighlightColor
                        existingHighlight.OutlineColor = CONFIG.ESP.PlayerESP.HighlightColor
                        print("🎨 Updated existing highlight color for: " .. plr.Name)
                    end)
                end
            end
        end
    end)
    if not success then
        warn("Failed to update Player ESP Color")
    end
end)

-- Plot ESP Toggles
createSectionHeader(settingsContent, "Plot ESP Settings")
createSwitch(settingsContent, "Show Plot Distance", CONFIG.ESP.PlotESP.ShowDistance, function(on)
    local success, _ = pcall(function()
        CONFIG.ESP.PlotESP.ShowDistance = on
        _G.saveSettings()
        -- Recreate all plot ESP billboards
        if _G.PlotESP_Enabled then
            for plot, data in pairs(_G.PlotESP_Data) do
                if typeof(plot) == "Instance" and data.billboard then
                    data.billboard:Destroy()
                    local newBillboard, newDistanceLabel, newOwnerLabel, newTimeLabel = createPlotBillboardGui(plot)
                    if newBillboard then
                        data.billboard = newBillboard
                        data.distanceLabel = newDistanceLabel
                        data.ownerLabel = newOwnerLabel
                        data.timeLabel = newTimeLabel
                    end
                end
            end
        end
    end)
    if not success then
        warn("Failed to update Plot ESP Distance setting")
    end
end)

createSwitch(settingsContent, "Show Plot Owner", CONFIG.ESP.PlotESP.ShowOwner, function(on)
    local success, _ = pcall(function()
        CONFIG.ESP.PlotESP.ShowOwner = on
        _G.saveSettings()
        -- Recreate all plot ESP billboards
        if _G.PlotESP_Enabled then
            for plot, data in pairs(_G.PlotESP_Data) do
                if typeof(plot) == "Instance" and data.billboard then
                    data.billboard:Destroy()
                    local newBillboard, newDistanceLabel, newOwnerLabel, newTimeLabel = createPlotBillboardGui(plot)
                    if newBillboard then
                        data.billboard = newBillboard
                        data.distanceLabel = newDistanceLabel
                        data.ownerLabel = newOwnerLabel
                        data.timeLabel = newTimeLabel
                    end
                end
            end
        end
    end)
    if not success then
        warn("Failed to update Plot ESP Owner setting")
    end
end)

createSwitch(settingsContent, "Show Plot Time", CONFIG.ESP.PlotESP.ShowTime, function(on)
    local success, _ = pcall(function()
        CONFIG.ESP.PlotESP.ShowTime = on
        _G.saveSettings()
        -- Recreate all plot ESP billboards
        if _G.PlotESP_Enabled then
            for plot, data in pairs(_G.PlotESP_Data) do
                if typeof(plot) == "Instance" and data.billboard then
                    data.billboard:Destroy()
                    local newBillboard, newDistanceLabel, newOwnerLabel, newTimeLabel = createPlotBillboardGui(plot)
                    if newBillboard then
                        data.billboard = newBillboard
                        data.distanceLabel = newDistanceLabel
                        data.ownerLabel = newOwnerLabel
                        data.timeLabel = newTimeLabel
                    end
                end
            end
        end
    end)
    if not success then
        warn("Failed to update Plot ESP Time setting")
    end
end)

-- Plot ESP Color Picker
createSectionHeader(settingsContent, "Plot ESP Color")
local plotColorButton = Instance.new("TextButton")
plotColorButton.Size = UDim2.new(1, 0, 0, 40)
plotColorButton.BackgroundColor3 = CONFIG.ESP.PlotESP.HighlightColor
plotColorButton.Text = "Pick Plot ESP Color"
plotColorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
plotColorButton.Font = Enum.Font.GothamBold
plotColorButton.TextSize = 16
plotColorButton.AutoButtonColor = false
plotColorButton.Parent = settingsContent
Instance.new("UICorner", plotColorButton).CornerRadius = UDim.new(0, 8)
local plotColorStroke = Instance.new("UIStroke", plotColorButton)
plotColorStroke.Thickness = 1
plotColorStroke.Color = Color3.fromRGB(255, 255, 255)
plotColorStroke.Transparency = 0.3

plotColorButton.MouseButton1Click:Connect(function()
    local success, _ = pcall(function()
        -- Simple color picker using random colors for demo
        local colors = {
            Color3.fromRGB(255, 0, 0),    -- Red
            Color3.fromRGB(0, 255, 0),    -- Green
            Color3.fromRGB(0, 0, 255),    -- Blue
            Color3.fromRGB(255, 255, 0),  -- Yellow
            Color3.fromRGB(255, 0, 255),  -- Magenta
            Color3.fromRGB(0, 255, 255),  -- Cyan
            Color3.fromRGB(255, 165, 0),  -- Orange
            Color3.fromRGB(128, 0, 128),  -- Purple
        }
        local randomColor = colors[math.random(1, #colors)]
        CONFIG.ESP.PlotESP.HighlightColor = randomColor
        plotColorButton.BackgroundColor3 = randomColor
        _G.saveSettings()
        -- Update existing highlights
        for plot, data in pairs(_G.PlotESP_Data) do
            if typeof(plot) == "Instance" and data.highlight then
                data.highlight.OutlineColor = CONFIG.ESP.PlotESP.HighlightColor
            end
        end
    end)
    if not success then
        warn("Failed to update Plot ESP Color")
    end
end)

-- Plot Time Size Slider
createSectionHeader(settingsContent, "Plot Time Size")
local timeSizeSlider = Instance.new("Frame")
timeSizeSlider.Size = UDim2.new(1, 0, 0, 50)
timeSizeSlider.BackgroundTransparency = 1
timeSizeSlider.Parent = settingsContent

local timeSizeLabel = Instance.new("TextLabel")
timeSizeLabel.Size = UDim2.new(1, 0, 0, 20)
timeSizeLabel.Position = UDim2.new(0, 0, 0, 0)
timeSizeLabel.BackgroundTransparency = 1
timeSizeLabel.Text = "Plot Time Text Size: " .. CONFIG.ESP.PlotESP.TimeTextSize
timeSizeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
timeSizeLabel.Font = Enum.Font.Gotham
timeSizeLabel.TextSize = 14
timeSizeLabel.TextXAlignment = Enum.TextXAlignment.Left
timeSizeLabel.Parent = timeSizeSlider

local timeSizeBar = Instance.new("Frame")
timeSizeBar.Size = UDim2.new(1, 0, 0, 20)
timeSizeBar.Position = UDim2.new(0, 0, 0, 25)
timeSizeBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
timeSizeBar.Parent = timeSizeSlider
Instance.new("UICorner", timeSizeBar).CornerRadius = UDim.new(0, 10)

local timeSizeFill = Instance.new("Frame")
timeSizeFill.Size = UDim2.new((CONFIG.ESP.PlotESP.TimeTextSize - 16) / (48 - 16), 0, 1, 0)
timeSizeFill.Position = UDim2.new(0, 0, 0, 0)
timeSizeFill.BackgroundColor3 = CONFIG.Colors.Accent
timeSizeFill.Parent = timeSizeBar
Instance.new("UICorner", timeSizeFill).CornerRadius = UDim.new(0, 10)

local timeSizeButton = Instance.new("TextButton")
timeSizeButton.Size = UDim2.new(0, 20, 0, 20)
local relativeX = math.clamp((CONFIG.ESP.PlotESP.TimeTextSize - 16) / (48 - 16), 0, 1)
timeSizeButton.Position = UDim2.new(relativeX, -10, 0, 0)
timeSizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
timeSizeButton.Text = ""
timeSizeButton.AutoButtonColor = false
timeSizeButton.Parent = timeSizeBar
Instance.new("UICorner", timeSizeButton).CornerRadius = UDim.new(0, 10)

--=========================================================
-- Brainrot ESP System
--=========================================================
_G.brainrotESPEnabled = false
_G.brainrotRefreshLoop = nil
_G.brainrotLastHighlighted = nil

-- Converts "$100M/s" style text into numbers
local function convertToNumber(text)
    text = text:gsub("%$", ""):gsub("/s", "") -- Remove $ and /s
    local multiplier = 1

    if text:find("K") then
        multiplier = 1e3
        text = text:gsub("K", "")
    elseif text:find("M") then
        multiplier = 1e6
        text = text:gsub("M", "")
    elseif text:find("B") then
        multiplier = 1e9
        text = text:gsub("B", "")
    elseif text:find("T") then
        multiplier = 1e12
        text = text:gsub("T", "")
    end

    local num = tonumber(text)
    return num and num * multiplier or 0
end

-- Reset a BillboardGui back to default
local function resetBillboard(billboard)
    if billboard then
        billboard.MaxDistance = 60
        billboard.Size = UDim2.new(15, 0, 5, 0)
        billboard.SizeOffset = Vector2.new(0, 0)
                            end
                        end

-- Check if any ancestor is named "Base"
local function hasBaseParent(obj)
    local parent = obj.Parent
    while parent do
        if parent.Name == "Base" then
            return true
        end
        parent = parent.Parent
    end
    return false
end

-- Update ESP logic
local function updateBrainrotESP()
    local highestBillboard = nil
    local highestValue = 0

    -- Look through workspace for all AnimalOverhead BillboardGuis
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BillboardGui") and obj.Name == "AnimalOverhead" and hasBaseParent(obj) then
            local genLabel = obj:FindFirstChild("Generation")
            if genLabel and genLabel:IsA("TextLabel") then
                local value = convertToNumber(genLabel.Text)
                if value > highestValue then
                    highestValue = value
                    highestBillboard = obj
        end
    end
        end
    end

    -- Reset previous highlighted billboard if changed
    if lastHighlighted and lastHighlighted ~= highestBillboard then
        resetBillboard(lastHighlighted)
    end

    -- Highlight the new highest billboard
    if highestBillboard then
        highestBillboard.MaxDistance = 100000
        highestBillboard.Size = UDim2.new(40, 0, 50, 0)
        highestBillboard.SizeOffset = Vector2.new(0.4, 1)
        lastHighlighted = highestBillboard
    else
        lastHighlighted = nil
    end
end

-- Enable ESP
local function enableBrainrotESP()
    if refreshLoop then refreshLoop:Disconnect() end

    -- Run immediately when toggled on
    updateBrainrotESP()

    -- Then refresh every 2 seconds
    local lastRefresh = tick()
    refreshLoop = RunService.Heartbeat:Connect(function()
        if tick() - lastRefresh >= 2 then
            updateBrainrotESP()
            lastRefresh = tick()
        end
    end)
end

-- Disable ESP
local function disableBrainrotESP()
    if refreshLoop then
        refreshLoop:Disconnect()
        refreshLoop = nil
    end

    -- Reset last highlighted to default
    if lastHighlighted then
        resetBillboard(lastHighlighted)
        lastHighlighted = nil
    end
end

--=========================================================
-- Plot Time ESP System
--=========================================================
_G.PlotTimeESP_Enabled = false
_G.PlotTimeESP_Data = {}

local function createPlotTimeBillboard(plot)
    local success, billboard, timeLabel = pcall(function()
        local spawnPart = plot:FindFirstChild("Spawn")
        if not spawnPart or not spawnPart:IsA("BasePart") then
            warn("No valid Spawn part found in plot: " .. plot.Name)
            return nil, nil
        end

        local gui = Instance.new("BillboardGui")
        gui.Name = "PlotTimeESP_Billboard"
        gui.Adornee = spawnPart
        gui.Size = UDim2.new(0, 200, 0, 30)
        gui.SizeOffset = Vector2.new(0, 0)
        gui.StudsOffset = Vector3.new(0, 8, 0)
        gui.AlwaysOnTop = true
        gui.MaxDistance = 10000
        gui.Parent = spawnPart

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.Parent = gui

        local timeLabel = Instance.new("TextLabel")
        timeLabel.Size = UDim2.new(1, 0, 1, 0)
        timeLabel.Position = UDim2.new(0, 0, 0, 0)
        timeLabel.Text = "Time: Calculating..."
        timeLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text for better visibility
        timeLabel.BackgroundTransparency = 1
        -- Important: disable TextScaled so slider-controlled TextSize takes effect
        timeLabel.TextScaled = false
        timeLabel.TextSize = CONFIG.ESP.PlotESP.TimeTextSize
        timeLabel.Font = Enum.Font.SourceSansBold -- Bold font for cleaner look
        timeLabel.TextStrokeTransparency = 0 -- Enable text stroke
        timeLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0) -- Black border
        timeLabel.Parent = frame
        local timeStroke = Instance.new("UIStroke", timeLabel)
        timeStroke.Thickness = 1.5 -- Thicker border for better visibility
        timeStroke.Color = Color3.fromRGB(0, 0, 0) -- Black border
        timeStroke.Transparency = 0 -- No transparency for solid border

        return gui, timeLabel
    end)
    if not success then
        warn("Failed to create plot time billboard for: " .. plot.Name)
        return nil, nil
    end
    return billboard, timeLabel
end

local function updatePlotTimeBillboard(plot, data)
    if not _G.PlotTimeESP_Enabled or not plot or not data.billboard or not data.billboard.Adornee then
        return
    end
    local success, _ = pcall(function()
        if data.timeLabel then
            local timeText = getRemainingTime(plot)
            data.timeLabel.Text = timeText or "Time: Unavailable"
        end
    end)
    if not success then
        warn("Failed to update plot time billboard for: " .. plot.Name)
    end
end

local function enablePlotTimeESP()
    if _G.PlotTimeESP_Enabled then return end
    local success, _ = pcall(function()
        local plotsFolder = workspace:FindFirstChild("Plots")
        if not plotsFolder then
            warn("Plots folder not found in workspace")
            return
        end

        _G.PlotTimeESP_Enabled = true
        _G.PlotTimeESP_Data = {} -- Clear existing data

        for _, plot in ipairs(plotsFolder:GetChildren()) do
            if plot:IsA("Model") then
                local plotConn = plot.AncestryChanged:Connect(function()
                    if not plot.Parent then
                        if _G.PlotTimeESP_Data[plot] then
                            if _G.PlotTimeESP_Data[plot].updateConn then
                                pcall(function() _G.PlotTimeESP_Data[plot].updateConn:Disconnect() end)
                            end
                            if _G.PlotTimeESP_Data[plot].billboard then
                                pcall(function() _G.PlotTimeESP_Data[plot].billboard:Destroy() end)
                            end
                            _G.PlotTimeESP_Data[plot] = nil
                        end
                    end
                end)
                _G.PlotTimeESP_Data[plot] = _G.PlotTimeESP_Data[plot] or {}
                _G.PlotTimeESP_Data[plot].plotConn = plotConn

                local billboard, timeLabel = createPlotTimeBillboard(plot)
                if billboard and timeLabel then
                    _G.PlotTimeESP_Data[plot].billboard = billboard
                    _G.PlotTimeESP_Data[plot].timeLabel = timeLabel
                    local lastUpdate = 0
                    _G.PlotTimeESP_Data[plot].updateConn = RunService.Heartbeat:Connect(function(deltaTime)
                        lastUpdate = lastUpdate + deltaTime
                        if lastUpdate >= CONFIG.ESP.UpdateInterval then
                            updatePlotTimeBillboard(plot, _G.PlotTimeESP_Data[plot])
                            lastUpdate = 0
                        end
                    end)
                end
            end
        end

        _G.PlotTimeESP_Data.plotsConn = plotsFolder.ChildAdded:Connect(function(plot)
            if plot:IsA("Model") then
                local plotConn = plot.AncestryChanged:Connect(function()
                    if not plot.Parent then
                        if _G.PlotTimeESP_Data[plot] then
                            if _G.PlotTimeESP_Data[plot].updateConn then
                                pcall(function() _G.PlotTimeESP_Data[plot].updateConn:Disconnect() end)
                            end
                            if _G.PlotTimeESP_Data[plot].billboard then
                                pcall(function() _G.PlotTimeESP_Data[plot].billboard:Destroy() end)
                            end
                            _G.PlotTimeESP_Data[plot] = nil
                        end
                    end
                end)
                _G.PlotTimeESP_Data[plot] = _G.PlotTimeESP_Data[plot] or {}
                _G.PlotTimeESP_Data[plot].plotConn = plotConn
                task.wait(1) -- Wait for plot to fully load
                local billboard, timeLabel = createPlotTimeBillboard(plot)
                if billboard and timeLabel then
                    _G.PlotTimeESP_Data[plot].billboard = billboard
                    _G.PlotTimeESP_Data[plot].timeLabel = timeLabel
                    local lastUpdate = 0
                    _G.PlotTimeESP_Data[plot].updateConn = RunService.Heartbeat:Connect(function(deltaTime)
                        lastUpdate = lastUpdate + deltaTime
                        if lastUpdate >= CONFIG.ESP.UpdateInterval then
                            updatePlotTimeBillboard(plot, _G.PlotTimeESP_Data[plot])
                            lastUpdate = 0
                        end
                    end)
                end
            end
        end)

        _G.PlotTimeESP_Data.plotsRemoveConn = plotsFolder.ChildRemoved:Connect(function(plot)
            if _G.PlotTimeESP_Data[plot] then
                if _G.PlotTimeESP_Data[plot].plotConn then
                    pcall(function() _G.PlotTimeESP_Data[plot].plotConn:Disconnect() end)
                end
                if _G.PlotTimeESP_Data[plot].updateConn then
                    pcall(function() _G.PlotTimeESP_Data[plot].updateConn:Disconnect() end)
                end
                if _G.PlotTimeESP_Data[plot].billboard then
                    pcall(function() _G.PlotTimeESP_Data[plot].billboard:Destroy() end)
                end
                _G.PlotTimeESP_Data[plot] = nil
            end
        end)
    end)
    if not success then
        warn("Failed to enable Plot Time ESP")
        PlotTime_G.ESP_Enabled = false
    end
end

local function refreshPlotTimeESP()
    if not _G.PlotTimeESP_Enabled then return end
    local success, _ = pcall(function()
        -- Clear existing data
        for plot, data in pairs(_G.PlotTimeESP_Data) do
            if typeof(plot) == "Instance" then
                if data.plotConn then
                    pcall(function() data.plotConn:Disconnect() end)
                end
                if data.updateConn then
                    pcall(function() data.updateConn:Disconnect() end)
                end
                if data.billboard then
                    pcall(function() data.billboard:Destroy() end)
                end
                _G.PlotTimeESP_Data[plot] = nil
            end
        end
        
        -- Recreate for all existing plots
        local plotsFolder = workspace:FindFirstChild("Plots")
        if plotsFolder then
            for _, plot in ipairs(plotsFolder:GetChildren()) do
                if plot:IsA("Model") and plot:FindFirstChild("Spawn") then
                    local plotConn = plot.AncestryChanged:Connect(function()
                        if not plot.Parent then
                            if _G.PlotTimeESP_Data[plot] then
                                if _G.PlotTimeESP_Data[plot].updateConn then
                                    pcall(function() _G.PlotTimeESP_Data[plot].updateConn:Disconnect() end)
                                end
                                if _G.PlotTimeESP_Data[plot].billboard then
                                    pcall(function() _G.PlotTimeESP_Data[plot].billboard:Destroy() end)
                                end
                                _G.PlotTimeESP_Data[plot] = nil
                            end
                        end
                    end)
                    _G.PlotTimeESP_Data[plot] = _G.PlotTimeESP_Data[plot] or {}
                    _G.PlotTimeESP_Data[plot].plotConn = plotConn

                    local billboard, timeLabel = createPlotTimeBillboard(plot)
                    if billboard and timeLabel then
                        _G.PlotTimeESP_Data[plot].billboard = billboard
                        _G.PlotTimeESP_Data[plot].timeLabel = timeLabel
                        local lastUpdate = 0
                        _G.PlotTimeESP_Data[plot].updateConn = RunService.Heartbeat:Connect(function(deltaTime)
                            lastUpdate = lastUpdate + deltaTime
                            if lastUpdate >= CONFIG.ESP.UpdateInterval then
                                updatePlotTimeBillboard(plot, _G.PlotTimeESP_Data[plot])
                                lastUpdate = 0
                            end
                        end)
                    end
                end
            end
        end
    end)
    if not success then
        warn("Failed to refresh Plot Time ESP")
    end
end

local function disablePlotTimeESP()
    if not _G.PlotTimeESP_Enabled then return end
    local success, _ = pcall(function()
        _G.PlotTimeESP_Enabled = false
        if _G.PlotTimeESP_Data.plotsConn then
            pcall(function() _G.PlotTimeESP_Data.plotsConn:Disconnect() end)
            _G.PlotTimeESP_Data.plotsConn = nil
        end
        if _G.PlotTimeESP_Data.plotsRemoveConn then
            pcall(function() _G.PlotTimeESP_Data.plotsRemoveConn:Disconnect() end)
            _G.PlotTimeESP_Data.plotsRemoveConn = nil
        end
        if _G.PlotTimeESP_Data.playerAddedConn then
            pcall(function() _G.PlotTimeESP_Data.playerAddedConn:Disconnect() end)
            _G.PlotTimeESP_Data.playerAddedConn = nil
        end
        if _G.PlotTimeESP_Data.playerRemovingConn then
            pcall(function() _G.PlotTimeESP_Data.playerRemovingConn:Disconnect() end)
            _G.PlotTimeESP_Data.playerRemovingConn = nil
        end
        for plot, data in pairs(_G.PlotTimeESP_Data) do
            if typeof(plot) == "Instance" then
                if data.plotConn then
                    pcall(function() data.plotConn:Disconnect() end)
                end
                if data.updateConn then
                    pcall(function() data.updateConn:Disconnect() end)
                end
                if data.billboard then
                    pcall(function() data.billboard:Destroy() end)
                end
                _G.PlotTimeESP_Data[plot] = nil
            end
        end
        _G.PlotTimeESP_Data = {}
    end)
    if not success then
        warn("Failed to disable Plot Time ESP")
    end
end
-- Enable plot time ESP by default (with error handling)
pcall(function()
enablePlotTimeESP()
end)

--=========================================================
-- Brainrot ESP System
--=========================================================
_G.brainrotESPEnabled = false
_G.brainrotRefreshLoop = nil
_G.brainrotLastHighlighted = nil

-- Converts "$100M/s" style text into numbers
local function convertToNumber(text)
    text = text:gsub("%$", ""):gsub("/s", "") -- Remove $ and /s
    local multiplier = 1

    if text:find("K") then
        multiplier = 1e3
        text = text:gsub("K", "")
    elseif text:find("M") then
        multiplier = 1e6
        text = text:gsub("M", "")
    elseif text:find("B") then
        multiplier = 1e9
        text = text:gsub("B", "")
    elseif text:find("T") then
        multiplier = 1e12
        text = text:gsub("T", "")
    end

    local num = tonumber(text)
    return num and num * multiplier or 0
end

-- Reset a BillboardGui back to default
local function resetBillboard(billboard)
    if billboard then
        billboard.MaxDistance = 60
        billboard.Size = UDim2.new(15, 0, 5, 0)
        billboard.SizeOffset = Vector2.new(0, 0)
    end
end

-- Check if any ancestor is named "Base"
local function hasBaseParent(obj)
    local parent = obj.Parent
    while parent do
        if parent.Name == "Base" then
            return true
        end
        parent = parent.Parent
    end
    return false
end

-- Update ESP logic
local function updateBrainrotESP()
    local highestBillboard = nil
    local highestValue = 0

    -- Look through workspace for all AnimalOverhead BillboardGuis
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BillboardGui") and obj.Name == "AnimalOverhead" and hasBaseParent(obj) then
            local genLabel = obj:FindFirstChild("Generation")
            if genLabel and genLabel:IsA("TextLabel") then
                local value = convertToNumber(genLabel.Text)
                if value > highestValue then
                    highestValue = value
                    highestBillboard = obj
                end
            end
        end
    end

    -- Reset previous highlighted billboard if changed
    if _G.brainrotLastHighlighted and _G.brainrotLastHighlighted ~= highestBillboard then
        resetBillboard(_G.brainrotLastHighlighted)
    end

    -- Highlight the new highest billboard
    if highestBillboard then
        highestBillboard.MaxDistance = 100000
        highestBillboard.Size = UDim2.new(40, 0, 50, 0)
        highestBillboard.SizeOffset = Vector2.new(0.4, 1)
        _G.brainrotLastHighlighted = highestBillboard
    else
        _G.brainrotLastHighlighted = nil
    end
end

-- Enable Brainrot ESP
local function enableBrainrotESP()
    if _G.brainrotRefreshLoop then _G.brainrotRefreshLoop:Disconnect() end

    -- Run immediately when toggled on
    updateBrainrotESP()

    -- Then refresh every 2 seconds
    local lastRefresh = tick()
    _G.brainrotRefreshLoop = RunService.Heartbeat:Connect(function()
        if tick() - lastRefresh >= 2 then
            updateBrainrotESP()
            lastRefresh = tick()
        end
    end)
end

-- Disable Brainrot ESP
local function disableBrainrotESP()
    if _G.brainrotRefreshLoop then
        _G.brainrotRefreshLoop:Disconnect()
        _G.brainrotRefreshLoop = nil
    end

    -- Reset last highlighted to default
    if _G.brainrotLastHighlighted then
        resetBillboard(_G.brainrotLastHighlighted)
        _G.brainrotLastHighlighted = nil
    end
end

-- Mobile Desync Functions (moved here before toggles section)
local function enableMobileDesync()
    pcall(function()
        local a = game:GetService("Players")
        local b = game:GetService("ReplicatedStorage")
        local c = a.LocalPlayer
        local d = c:WaitForChild("Backpack")

        local f = b:WaitForChild("Packages"):WaitForChild("Net")
        local g = f:WaitForChild("RE/UseItem")
        local h = f:WaitForChild("RE/QuantumCloner/OnTeleport")

        local function executeAntiHit()
            local s = c.Character or c.CharacterAdded:Wait()
            local t = d:FindFirstChild("Quantum Cloner") or s:FindFirstChild("Quantum Cloner")
            if t and d:FindFirstChild(t.Name) then
                c.Character.Humanoid:EquipTool(t)
            end
            setfflag("WorldStepMax", -2147483648)
            task.wait(0.2)
            g:FireServer()
            task.wait(0.3)
            h:FireServer()
            
            -- Set desync flags right after clone execution
            setfflag("S2PhysicsSenderRate", "-100")
            setfflag("SimBlockLargeLocalToolWeldManipulationsThreshold", "-1")
            setfflag("MaxMissedWorldStepsRemembered", "0")
            setfflag("DebugSimPrimalStiffnessMax", "0")
            setfflag("DebugSimPrimalStiffnessMin", "0")
            setfflag("ReplicatorAnimationTrackLimitPerAnimator", "-1")
            setfflag("PhysicsSkipNonRealTimeHumanoidForceCalc2", "True")
            
            task.wait(0.7)
            setfflag("WorldStepMax", -1)
        end

        -- Execute desync immediately when enabled
        executeAntiHit()
        print("✅ Mobile Desync activated!")
    end)
end

local function disableMobileDesync()
    pcall(function()
        -- Reset desync flags to defaults
        setfflag("S2PhysicsSenderRate", "60")
        setfflag("SimBlockLargeLocalToolWeldManipulationsThreshold", "100")
        setfflag("MaxMissedWorldStepsRemembered", "1000")
        setfflag("DebugSimPrimalStiffnessMax", "100")
        setfflag("DebugSimPrimalStiffnessMin", "100")
        setfflag("ReplicatorAnimationTrackLimitPerAnimator", "10")
        setfflag("PhysicsSkipNonRealTimeHumanoidForceCalc2", "False")
        setfflag("WorldStepMax", -1)
        print("❌ Mobile Desync disabled - all flags reset!")
    end)
end

-- Create Brainrot ESP toggle in Toggles section (moved here after function definitions)
createButton(_G.togglesSection, "Toggle Brainrot ESP", function()
    createCircularToggleUI("Brainrot ESP", function() return CONFIG.ESP.BrainrotESP.Enabled end, function(state)
        CONFIG.ESP.BrainrotESP.Enabled = state
        _G.saveSettings()
        if state then
            enableBrainrotESP()
        else
            disableBrainrotESP()
        end
    end)
end)

createButton(_G.togglesSection, "Toggle Mobile Desync", function()
    createCircularToggleUI("Mobile Desync", function() return _G.mobileDesyncEnabled end, function(state)
        _G.mobileDesyncEnabled = state
        -- Don't save settings for mobile desync (fast flag can't be disabled)
        if state then
            enableMobileDesync()
        else
            disableMobileDesync()
        end
    end)
end)

_G.brainrotESPSwitch = createSwitch(_G.visualSection, "Brainrot ESP", CONFIG.ESP.BrainrotESP.Enabled, function(on)
    CONFIG.ESP.BrainrotESP.Enabled = on
    _G.saveSettings()
    if on then
        enableBrainrotESP()
    else
        disableBrainrotESP()
    end
end)

-- Delete Borders Button
createButton(_G.visualSection, "Delete Borders", function()
    local success, err = pcall(function()
        local borders = workspace:FindFirstChild("Map")
        if borders then
            borders = borders:FindFirstChild("Borders")
            if borders then
                borders:Destroy()
                print("✅ Successfully deleted workspace.Map.Borders!")
            else
                warn("❌ workspace.Map.Borders not found!")
            end
        else
            warn("❌ workspace.Map not found!")
        end
    end)
    
    if not success then
        warn("❌ Failed to delete borders: " .. tostring(err))
    end
end)

createButton(_G.visualSection, "Barrier Increase", function()
    local success, err = pcall(function()
        local map = workspace:FindFirstChild("Map")
        if map then
            local parts = {
                map:FindFirstChild("Part"),
                map:GetChildren()[11],
                map:GetChildren()[20]

            }
            for i, part in ipairs(parts) do
                if part and part:IsA("BasePart") then
                    part.Size = Vector3.new(part.Size.X, part.Size.Y, 13)
                    print("✅ Successfully set Z-size to 13 for part at index: " .. tostring(i))
                else
                    warn("❌ Part not found or invalid at index: " .. tostring(i))
                end
            end
        else
            warn("❌ workspace.Map not found!")
        end
    end)
    
    if not success then
        warn("❌ Failed to increase barrier sizes: " .. tostring(err))
    end
end)



--=========================================================
-- Ragdoll Desync System
--=========================================================
local ragdollDesyncEnabled = false
local ragdollConnections = {}

local function enableRagdollDesync()
    if ragdollDesyncEnabled then return end
    
    ragdollDesyncEnabled = true
    
    -- Anti-Ragdoll LocalScript for Roblox
    -- Neutralizes ragdoll system without getconnections, using getloadedmodules, setreadonly, and runtime countermeasures.
    -- Run early via executor or StarterPlayerScripts.

    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")
    local LocalPlayer = Players.LocalPlayer

    -- Wait for character to ensure Humanoid and parts are available
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid", 5)
    local RootPart = Character:WaitForChild("HumanoidRootPart", 5)
    local Head = Character:WaitForChild("Head", 5)
    local CurrentCamera = Workspace.CurrentCamera

    -- Debug function
    local function debugPrint(message)
        print("[Anti-Ragdoll] " .. tostring(message))
    end

    -- Step 1: Override RagDollController module using getloadedmodules
    local function overrideControllerModule()
        local Packages = ReplicatedStorage:WaitForChild("Packages", 5)
        if not Packages then
            debugPrint("Packages not found in ReplicatedStorage!")
            return
        end

        local controllerModule
        for _, module in ipairs(getloadedmodules()) do
            local success, moduleName = pcall(function()
                return module.Name
            end)
            if success and (moduleName:lower():match("ragdollcontroller") or moduleName:lower():match("ragdoll")) then
                local result
                success, result = pcall(function()
                    return require(module)
                end)
                if success and type(result) == "table" and result.ToggleControls and result.IsInRagdoll and result.Start then
                    controllerModule = result
                    debugPrint("Found RagDollController module: " .. moduleName)
                    break
                end
            end
        end

        if controllerModule then
            -- Check if table is read-only and make it writable
            if isreadonly(controllerModule) then
                setreadonly(controllerModule, false)
                debugPrint("Made controllerModule table writable")
            end

            -- Override functions
            controllerModule.ToggleControls = newcclosure(function(_, enable)
                if enable == false then
                    debugPrint("Blocked attempt to disable controls")
                    return
                end
                local success, controls = pcall(function()
                    local playerScripts = LocalPlayer:WaitForChild("PlayerScripts", 5)
                    local playerModule = require(playerScripts:WaitForChild("PlayerModule", 5))
                    return playerModule:GetControls()
                end)
                if success and controls then
                    controls:Enable()
                    debugPrint("Forced controls enabled")
                else
                    debugPrint("Failed to access PlayerModule controls")
                end
            end)

            controllerModule.IsInRagdoll = newcclosure(function()
                debugPrint("IsInRagdoll called, returning false")
                return false
            end)

            controllerModule.Start = newcclosure(function()
                debugPrint("Blocked Start function")
            end)

            -- Make table read-only again for safety
            setreadonly(controllerModule, true)
            debugPrint("RagDollController module overridden successfully")
        else
            debugPrint("Could not find RagDollController module. Falling back to runtime countermeasures.")
        end
    end

    -- Run module override
    overrideControllerModule()

    -- Step 2: Neutralize RagdollClient script and RemoteEvent
    local function neutralizeRemoteEvent()
        local Packages = ReplicatedStorage:WaitForChild("Packages", 5)
        if not Packages then
            debugPrint("Packages not found for RemoteEvent neutralization!")
            return
        end

        local ragdollFolder = Packages:WaitForChild("Ragdoll", 5)
        if not ragdollFolder then
            debugPrint("Ragdoll folder not found!")
            return
        end

        local ragdollRemote = ragdollFolder:WaitForChild("Ragdoll", 5)
        if not ragdollRemote then
            debugPrint("Ragdoll RemoteEvent not found!")
            return
        end

        -- Add a no-op connection to reduce impact (won't block existing connections)
        pcall(function()
            ragdollConnections.remoteEvent = ragdollRemote.OnClientEvent:Connect(function(arg1, arg2)
                debugPrint("Intercepted RemoteEvent call: " .. tostring(arg1) .. ", " .. tostring(arg2))
            end)
            debugPrint("Added no-op RemoteEvent connection")
        end)

        -- Disable RagdollClient script using getloadedmodules
        local foundClientScript = false
        for _, script in ipairs(getloadedmodules()) do
            local success, scriptName = pcall(function()
                return script.Name
            end)
            if success and scriptName:lower():match("ragdollclient") then
                pcall(function()
                    script.Disabled = true
                    debugPrint("Disabled RagdollClient script: " .. scriptName)
                    foundClientScript = true
                end)
            end
        end

        -- Also check PlayerScripts for RagdollClient
        for _, script in ipairs(LocalPlayer.PlayerScripts:GetChildren()) do
            if script.Name:lower():match("ragdollclient") then
                pcall(function()
                    script.Disabled = true
                    debugPrint("Disabled PlayerScripts RagdollClient script: " .. script.Name)
                    foundClientScript = true
                end)
            end
        end

        if not foundClientScript then
            debugPrint("Could not find RagdollClient script. Relying on runtime countermeasures.")
        end
    end

    -- Run RemoteEvent neutralization
    neutralizeRemoteEvent()

    -- Step 3: Runtime loop to counter ragdoll effects
    ragdollConnections.heartbeat = RunService.Heartbeat:Connect(function()
        if not (Humanoid and RootPart and Head and CurrentCamera) then
            debugPrint("Character components missing, skipping frame")
            return
        end

        -- Counter Physics state
        if Humanoid:GetState() == Enum.HumanoidStateType.Physics then
            Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            debugPrint("Forced Humanoid out of Physics state")
        end

        -- Reset camera subject
        if CurrentCamera.CameraSubject ~= Humanoid then
            CurrentCamera.CameraSubject = Humanoid
            debugPrint("Reset CameraSubject to Humanoid")
        end

        -- Ensure collisions and properties
        if not RootPart.CanCollide then
            RootPart.CanCollide = true
            debugPrint("Forced RootPart.CanCollide to true")
        end

        if not Humanoid.BreakJointsOnDeath then
            Humanoid.BreakJointsOnDeath = true
            debugPrint("Forced BreakJointsOnDeath to true")
        end

        -- Override RagdollEndTime
        local currentTime = Workspace:GetServerTimeNow()
        if LocalPlayer:GetAttribute("RagdollEndTime") and LocalPlayer:GetAttribute("RagdollEndTime") > currentTime then
            LocalPlayer:SetAttribute("RagdollEndTime", currentTime - 10)
            debugPrint("Set RagdollEndTime to past value")
        end

        -- Re-enable controls
        local success, controls = pcall(function()
            local playerScripts = LocalPlayer:WaitForChild("PlayerScripts", 5)
            local playerModule = require(playerScripts:WaitForChild("PlayerModule", 5))
            return playerModule:GetControls()
        end)
        if success and controls and not controls:IsActive() then
            controls:Enable()
            debugPrint("Re-enabled player controls")
        end
    end)

    -- Step 4: Clean up ragdoll constraints and attachments
    ragdollConnections.descendantAdded = Character.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("BallSocketConstraint") or descendant:IsA("HingeConstraint") or descendant:IsA("Attachment") then
            descendant:Destroy()
            debugPrint("Destroyed ragdoll constraint/attachment: " .. descendant.Name)
        end
    end)

    -- Step 5: Handle character respawn
    ragdollConnections.characterAdded = LocalPlayer.CharacterAdded:Connect(function(newCharacter)
        Character = newCharacter
        Humanoid = Character:WaitForChild("Humanoid", 5)
        RootPart = Character:WaitForChild("HumanoidRootPart", 5)
        Head = Character:WaitForChild("Head", 5)
        debugPrint("Character respawned, reapplied countermeasures")
    end)

    debugPrint("Anti-ragdoll script fully activated")
    print("✅ Ragdoll Desync activated!")
end

local function disableRagdollDesync()
    if not ragdollDesyncEnabled then return end
    
    ragdollDesyncEnabled = false
    
    -- Disconnect all connections
    for _, connection in pairs(ragdollConnections) do
        pcall(function() connection:Disconnect() end)
    end
    ragdollConnections = {}
    
    print("❌ Ragdoll Desync disabled!")
end

-- Add Ragdoll Desync to Movement section
local ragdollDesyncSwitch = createSwitch(_G.movementSection, "Ragdoll Desync", false, function(on)
    CONFIG.Movement.RagdollDesync = CONFIG.Movement.RagdollDesync or {}
    CONFIG.Movement.RagdollDesync.Enabled = on
    _G.saveSettings()
    if on then
        enableRagdollDesync()
    else
        disableRagdollDesync()
    end
end)

--=========================================================
-- Desync Section
--=========================================================
createSectionHeader(_G.desyncSection, "Desync Controls")

-- Mobile Desync Toggle
_G.mobileDesyncEnabled = false
local mobileDesyncSwitch = createSwitch(_G.desyncSection, "Desync (Mobile)", false, function(on)
    pcall(function()
        _G.mobileDesyncEnabled = on
        if on then
            enableMobileDesync()
        else
            disableMobileDesync()
        end
        -- Don't save settings for mobile desync (fast flag can't be disabled)
    end)
end)




local isDragging = false
timeSizeButton.MouseButton1Down:Connect(function()
    isDragging = true
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if isDragging then
        local mouse = game:GetService("Players").LocalPlayer:GetMouse()
        local sliderPos = timeSizeBar.AbsolutePosition.X
        local sliderWidth = timeSizeBar.AbsoluteSize.X
        local mouseX = mouse.X
        local relativeX = math.clamp((mouseX - sliderPos) / sliderWidth, 0, 1)
        local newSize = math.floor(16 + relativeX * (48 - 16))
        
        if newSize ~= CONFIG.ESP.PlotESP.TimeTextSize then
            CONFIG.ESP.PlotESP.TimeTextSize = newSize
            timeSizeLabel.Text = "Plot Time Text Size: " .. newSize
            timeSizeFill.Size = UDim2.new(relativeX, 0, 1, 0)
            timeSizeButton.Position = UDim2.new(relativeX, -10, 0, 0)
            
            -- Recreate PlotTimeESP billboards with new text size
            if _G.PlotTimeESP_Enabled then
                disablePlotTimeESP() -- Disable to clear existing billboards
                enablePlotTimeESP() -- Re-enable to recreate with new text size
            end
            
            _G.saveSettings()
        end
    end
end)


createSectionHeader(settingsContent, "Movement Settings")

-- Float Speed Control
createNumberInput(settingsContent, "Float Descent Speed", CONFIG.Movement.Float.DescentSpeed, function(value)
    local success, _ = pcall(function()
        CONFIG.Movement.Float.DescentSpeed = math.clamp(value, 0.01, 5)
        _G.saveSettings()
    end)
    if not success then
        warn("Failed to update Float Descent Speed")
    end
end)

-- Helicopter Control
createNumberInput(settingsContent, "Helicopter Rotation Speed", CONFIG.Movement.Helicopter.RotationSpeed, function(value)
    local success, _ = pcall(function()
        CONFIG.Movement.Helicopter.RotationSpeed = math.clamp(value, 1, 100)
        _G.saveSettings()
    end)
    if not success then
        warn("Failed to update Helicopter Rotation Speed")
    end
end)
createNumberInput(settingsContent, "Grapple Flight Speed", CONFIG.Movement.GrappleFlight.Speed, function(value)
    local success, _ = pcall(function()
        CONFIG.Movement.GrappleFlight.Speed = math.clamp(value, 50, 500)
        _G.saveSettings()
    end)
    if not success then
        warn("Failed to update Grapple Flight Speed")
    end
end)
createNumberInput(settingsContent, "Infinite Jump Power", CONFIG.Movement.InfiniteJump.JumpPower, function(value)
    local success, _ = pcall(function()
        CONFIG.Movement.InfiniteJump.JumpPower = math.clamp(value, 20, 100)
        _G.saveSettings()
    end)
    if not success then
        warn("Failed to update Infinite Jump Power")
    end
end)
createNumberInput(settingsContent, "Infinite Jump Cooldown", CONFIG.Movement.InfiniteJump.Cooldown, function(value)
    local success, _ = pcall(function()
        CONFIG.Movement.InfiniteJump.Cooldown = math.clamp(value, 0.1, 1.0)
        _G.saveSettings()
    end)
    if not success then
        warn("Failed to update Infinite Jump Cooldown")
    end
end)

-- Rise Settings Controls
createNumberInput(settingsContent, "Rise speed", CONFIG.Movement.Rise.Speed, function(value)
    local success, _ = pcall(function()
        CONFIG.Movement.Rise.Speed = math.clamp(value, 1, 50)
        _G.saveSettings()
        -- Update velocity if Rise is currently active
        if RISE_ENABLED and riseBodyVelocity then
            riseBodyVelocity.Velocity = Vector3.new(0, CONFIG.Movement.Rise.Speed, 0)
        end
    end)
    if not success then
        warn("Failed to update Rise Speed")
    end
end)

createNumberInput(settingsContent, "Rise Max Height", CONFIG.Movement.Rise.MaxHeight, function(value)
    local success, _ = pcall(function()
        CONFIG.Movement.Rise.MaxHeight = math.clamp(value, 10, 2000)
        _G.saveSettings()
    end)
    if not success then
        warn("Failed to update Rise Max Height")
    end
end)

-- Reset Settings Button
createSectionHeader(settingsContent, "Reset Settings")
local resetSettingsButton = Instance.new("TextButton")
resetSettingsButton.Size = UDim2.new(1, 0, 0, 40)
resetSettingsButton.BackgroundColor3 = CONFIG.Colors.Danger
resetSettingsButton.Text = "Reset All Settings"
resetSettingsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
resetSettingsButton.Font = Enum.Font.GothamBold
resetSettingsButton.TextSize = 16
resetSettingsButton.AutoButtonColor = false
resetSettingsButton.Parent = settingsContent
Instance.new("UICorner", resetSettingsButton).CornerRadius = UDim.new(0, 8)
local resetStroke = Instance.new("UIStroke", resetSettingsButton)
resetStroke.Thickness = 1
resetStroke.Color = CONFIG.Colors.Danger
resetStroke.Transparency = 0.3

resetSettingsButton.MouseButton1Click:Connect(function()
    local success, _ = pcall(function()
        -- Reset all settings to defaults
        CONFIG.ESP.PlayerESP.HighlightColor = Color3.fromRGB(255, 0, 0)
        CONFIG.ESP.PlotESP.HighlightColor = Color3.fromRGB(0, 255, 0)
        CONFIG.ESP.PlotESP.TimeTextSize = 14
        CONFIG.Movement.Unhittable = {
            IntermediateSize = { X = 2, Y = 20, Z = 1 },
            TallSize = { X = 2, Y = 40, Z = 1 },
        }
        CONFIG.Movement.Resize = {
            TargetSize = { X = 2, Y = 10, Z = 1 },
        }
        CONFIG.Movement.Helicopter = {
            Enabled = false,
            RotationSpeed = 20,
        }
        _G.saveSettings()
        
        -- Update color picker buttons
        playerColorButton.BackgroundColor3 = CONFIG.ESP.PlayerESP.HighlightColor
        plotColorButton.BackgroundColor3 = CONFIG.ESP.PlotESP.HighlightColor
        
        -- Update slider
        timeSizeLabel.Text = "Plot Time Text Size: " .. CONFIG.ESP.PlotESP.TimeTextSize
        local relativeX = math.clamp((CONFIG.ESP.PlotESP.TimeTextSize - 16) / (48 - 16), 0, 1)
        timeSizeFill.Size = UDim2.new(relativeX, 0, 1, 0)
        timeSizeButton.Position = UDim2.new(relativeX, -10, 0, 0)
        
        -- Update existing ESP
        for plr, data in pairs(ESP_Data) do
            if typeof(plr) == "Instance" and data.highlight then
                data.highlight.OutlineColor = CONFIG.ESP.PlayerESP.HighlightColor
            end
        end
        for plot, data in pairs(_G.PlotESP_Data) do
            if typeof(plot) == "Instance" and data.highlight then
                data.highlight.OutlineColor = CONFIG.ESP.PlotESP.HighlightColor
            end
            if typeof(plot) == "Instance" and data.timeLabel then
                data.timeLabel.TextSize = CONFIG.ESP.PlotESP.TimeTextSize
            end
        end
        -- Settings reset to defaults
    end)
    if not success then
        warn("Failed to reset settings")
    end
end)

--=========================================================
-- Laser Cape Auto-Fire System (UPDATED - Only works when you own the item)
--=========================================================
local isLaserCapeFiring = false
local laserCapeThread = nil
local laserCapeCheckConnection = nil

local function playerHasLaserCape()
    -- Check if player has Laser Cape in backpack or equipped
    if not player then return false end
    
    local success, hasCape = pcall(function()
        -- Check backpack
        if player.Backpack then
            local capeInBackpack = player.Backpack:FindFirstChild("Laser Cape")
            if capeInBackpack then return true end
        end
        
        -- Check character
        if player.Character then
            local capeEquipped = player.Character:FindFirstChild("Laser Cape")
            if capeEquipped then return true end
        end
        
        -- Check inventory (if applicable)
        local inventory = player:FindFirstChild("Inventory")
        if inventory then
            for _, item in ipairs(inventory:GetChildren()) do
                if item.Name == "Laser Cape" or (item:IsA("StringValue") and item.Value == "Laser Cape") then
                    return true
                end
            end
        end
        
        return false
    end)
    
    if not success then
        warn("Failed to check for Laser Cape")
        return false
    end
    
    return hasCape
end

local function findClosestHumanoidRootParts(maxDistance)
    local rootParts = {}
    
    if not player.Character then return rootParts end
    
    local playerRoot = player.Character:FindFirstChild("HumanoidRootPart")
    if not playerRoot then return rootParts end
    
    -- Get all players except yourself
    for _, otherPlayer in ipairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            local humanoidRootPart = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local distance = (playerRoot.Position - humanoidRootPart.Position).Magnitude
                if distance <= maxDistance then
                    table.insert(rootParts, {
                        part = humanoidRootPart,
                        distance = distance,
                        player = otherPlayer
                    })
                end
            end
        end
    end
    
    -- Sort by distance (closest first)
    table.sort(rootParts, function(a, b)
        return a.distance < b.distance
    end)
    
    return rootParts
end

local function useLaserCapeOnTarget(targetRootPart)
    if not player.Character then 
        warn("No character found")
        return false 
    end
    
    -- Check if player actually has the laser cape
    if not playerHasLaserCape() then
        warn("Player does not own Laser Cape")
        return false
    end
    
    local humanoid = player.Character:FindFirstChild("Humanoid")
    local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
    
    if not humanoid or not humanoidRootPart then 
        warn("Humanoid or HumanoidRootPart not found")
        return false 
    end
    
    local laserCape = player.Backpack:FindFirstChild("Laser Cape") or player.Character:FindFirstChild("Laser Cape")
    if not laserCape then 
        warn("Laser Cape not found")
        return false 
    end
    
    -- Equip the laser cape if not already equipped
    if laserCape.Parent ~= player.Character then
        humanoid:EquipTool(laserCape)
        task.wait(0.1) -- Wait for equip animation
    end
    
    -- Use the Laser Cape on the target HumanoidRootPart
    if UseItemEvent then
        local success, err = pcall(function()
            UseItemEvent:FireServer(targetRootPart.Position, targetRootPart)
        end)
        if success then
            return true
        else
            warn("Failed to fire UseItemEvent: " .. tostring(err))
            return false
        end
    else
        warn("UseItemEvent not found")
        return false
    end
end

local function fireOnClosestHumanoids()
    -- Only fire if player has laser cape
    if not playerHasLaserCape() then
        warn("Cannot fire Laser Cape - player does not own it")
        if isLaserCapeFiring and laserCapeSwitch then
            laserCapeSwitch.set(false) -- Auto-disable if player doesn't have cape
        end
        return
    end
    
    local maxDistance = 50 -- Maximum distance to target
    local closestRootParts = findClosestHumanoidRootParts(maxDistance)
    
    if #closestRootParts == 0 then
        warn("No humanoid root parts found nearby")
        return
    end
    
    -- Always fire on the closest target (first in the sorted list)
    local closestTarget = closestRootParts[1]
    -- Firing Laser Cape at target
    useLaserCapeOnTarget(closestTarget.part)
end

local function enableLaserCape()
    if isLaserCapeFiring then return end
    
    -- Check if player has laser cape before enabling
    if not playerHasLaserCape() then
        warn("Cannot enable Laser Cape Auto-Fire - player does not own Laser Cape")
        if laserCapeSwitch then laserCapeSwitch.set(false) end
        return
    end
    
    isLaserCapeFiring = true
    -- Laser Cape Auto-Fire enabled
    
    if not laserCapeThread then
        laserCapeThread = task.spawn(function()
            while isLaserCapeFiring do
                if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                    -- Re-check if player still has laser cape
                    if playerHasLaserCape() then
                        fireOnClosestHumanoids()
                    else
                        warn("Player lost Laser Cape, disabling auto-fire")
                        isLaserCapeFiring = false
                        if laserCapeSwitch then laserCapeSwitch.set(false) end
                        break
                    end
                else
                    warn("Player character not available or dead")
                    isLaserCapeFiring = false
                    if laserCapeSwitch then laserCapeSwitch.set(false) end
                    break
                end
                task.wait(0.5) -- Wait between shots
            end
            laserCapeThread = nil
        end)
    end
    
    -- Set up periodic checking for laser cape acquisition/loss
    if not laserCapeCheckConnection then
        laserCapeCheckConnection = RunService.Heartbeat:Connect(function()
            if isLaserCapeFiring and not playerHasLaserCape() then
                warn("Player lost Laser Cape, disabling auto-fire")
                isLaserCapeFiring = false
                if laserCapeSwitch then laserCapeSwitch.set(false) end
                if laserCapeCheckConnection then
                    laserCapeCheckConnection:Disconnect()
                    laserCapeCheckConnection = nil
                end
            end
        end)
    end
end

local function disableLaserCape()
    if not isLaserCapeFiring then return end
    isLaserCapeFiring = false
    -- Laser Cape Auto-Fire disabled
    
    if laserCapeThread then
        task.cancel(laserCapeThread)
        laserCapeThread = nil
    end
    
    if laserCapeCheckConnection then
        laserCapeCheckConnection:Disconnect()
        laserCapeCheckConnection = nil
    end
end

-- Update the laser cape switch to check if player has the cape
local originalLaserCapeSwitch = createSwitch(_G.movementSection, "Laser Cape Auto-Fire", false, function(on)
    if on then
        -- Only enable if player has laser cape
        if playerHasLaserCape() then
            enableLaserCape()
        else
            warn("Cannot enable Laser Cape Auto-Fire - player does not own Laser Cape")
            if laserCapeSwitch then laserCapeSwitch.set(false) end
        end
    else
        disableLaserCape()
    end
end)

-- Create a reference to the switch for other functions to use
_G.laserCapeSwitch = originalLaserCapeSwitch

--=========================================================
-- Button Interactions
--=========================================================
settingsBtn.MouseButton1Click:Connect(function()
    local success, _ = pcall(function()
        settingsFrame.Visible = not settingsFrame.Visible
    end)
    if not success then
        warn("Failed to toggle settings frame visibility")
    end
end)

settingsCloseBtn.MouseButton1Click:Connect(function()
    local success, _ = pcall(function()
        settingsFrame.Visible = false
    end)
    if not success then
        warn("Failed to close settings frame")
    end
end)

local isMinimized = false
minimizeBtn.MouseButton1Click:Connect(function()
    local success, _ = pcall(function()
        isMinimized = not isMinimized
        mainFrame.Size = isMinimized and CONFIG.UI.MinimizedSize or CONFIG.UI.FrameSize
        sidebar.Visible = not isMinimized
        contentArea.Visible = not isMinimized
        minimizeBtn.Text = isMinimized and "+" or "−"
    end)
    if not success then
        warn("Failed to toggle minimize state")
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    local success, _ = pcall(function()
        -- Disable all features safely
        if playerESPSwitch and playerESPSwitch.set then playerESPSwitch.set(false) end
        if plotESPSwitch and plotESPSwitch.set then plotESPSwitch.set(false) end
        if serverHopSwitch and serverHopSwitch.set then serverHopSwitch.set(false) end
        if jumpSwitch and jumpSwitch.set then jumpSwitch.set(false) end
        if speedSwitch and speedSwitch.set then speedSwitch.set(false) end
        if invisibilitySwitch and invisibilitySwitch.set then invisibilitySwitch.set(false) end
        if unhittableSwitchInstance and unhittableSwitchInstance.set then unhittableSwitchInstance.set(false) end
        if resizeSwitchInstance and resizeSwitchInstance.set then resizeSwitchInstance.set(false) end
        if flingSwitchInstance and flingSwitchInstance.set then flingSwitchInstance.set(false) end
        
        -- Disable movement features
        if CONFIG.Movement.Helicopter and CONFIG.Movement.Helicopter.Enabled then
            pcall(function() disableHelicopter() end)
        end
        if CONFIG.Movement.GrappleFlight and CONFIG.Movement.GrappleFlight.Enabled then
            pcall(function() disableGrappleFlight() end)
        end
        if CONFIG.Movement.InfiniteJump and CONFIG.Movement.InfiniteJump.Enabled then
            pcall(function() disableInfiniteJump() end)
        end
        if CONFIG.Movement.Rise and CONFIG.Movement.Rise.Enabled then
            disableRise()
        end
        if CONFIG.Movement.Float and CONFIG.Movement.Float.Enabled then
            disableFloat()
        end
        
        -- Disable ESP features
        if _G.ESP_Enabled then
            disableESP()
        end
        if _G.PlotESP_Enabled then
            disablePlotESP()
        end
        if _G.PlotTimeESP_Enabled then
            disablePlotTimeESP()
        end
        if CONFIG.ESP.BrainrotESP and CONFIG.ESP.BrainrotESP.Enabled then
            disableBrainrotESP()
        end
        
        -- Disable Desync features
        if _G.mobileDesyncEnabled then
            disableMobileDesync()
        end
        if CONFIG.Movement.RagdollDesync and CONFIG.Movement.RagdollDesync.Enabled then
            disableRagdollDesync()
        end
        
        -- Destroy UI
        if screenGui and screenGui.Parent then
            screenGui:Destroy()
        end
        if circularToggleGui and circularToggleGui.Parent then
            circularToggleGui:Destroy()
        end
    end)
    if not success then
        warn("Failed to close UI")
    end
end)

--=========================================================
-- Character Respawn Handling
--=========================================================
player.CharacterAdded:Connect(function(newCharacter)
    local success, _ = pcall(function()
        character = newCharacter
        humanoid = newCharacter:WaitForChild("Humanoid", 5)
        humanoidRootPart = newCharacter:WaitForChild("HumanoidRootPart", 5)

        -- Reapply active settings
        if jumpSwitch and jumpSwitch.get then
        if jumpSwitch.get() then
            humanoid.UseJumpPower = true
            humanoid.JumpPower = CONFIG.Movement.JumpPower
            end
        end

        if speedSwitch and speedSwitch.get and speedSwitch.set then
        if speedSwitch.get() then
            speedSwitch.set(false) -- Disable and re-enable to reset connections
            speedSwitch.set(true)
            end
        end

        if invisibilitySwitch and invisibilitySwitch.get then
        if invisibilitySwitch.get() then
                task.wait(0.5) -- Wait for character to be ready
            setInvisibility(true)
            end
        end

        if unhittableSwitchInstance and unhittableSwitchInstance.get and unhittableSwitchInstance.set then
        if unhittableSwitchInstance.get() then
            unhittableSwitchInstance.set(false)
            unhittableSwitchInstance.set(true)
            end
        end

        if resizeSwitchInstance and resizeSwitchInstance.get and resizeSwitchInstance.set then
        if resizeSwitchInstance.get() then
            resizeSwitchInstance.set(false)
            resizeSwitchInstance.set(true)
            end
        end

        if flingSwitchInstance and flingSwitchInstance.get and flingSwitchInstance.set then
        if flingSwitchInstance.get() then
            flingSwitchInstance.set(false)
            flingSwitchInstance.set(true)
            end
        end
        
        if originalLaserCapeSwitch and originalLaserCapeSwitch.get then
        if originalLaserCapeSwitch.get() then
                pcall(function() disableLaserCape() end)
                pcall(function() enableLaserCape() end)
            end
        end

        if CONFIG.Movement.GrappleFlight.Enabled then
            pcall(function() disableGrappleFlight() end)
            pcall(function() enableGrappleFlight() end)
        end

        if CONFIG.Movement.InfiniteJump.Enabled then
            pcall(function() disableInfiniteJump() end)
            pcall(function() enableInfiniteJump() end)
        end

        -- Re-enable Rise if enabled (with loaded settings)
        if CONFIG.Movement.Rise.Enabled then
            disableRise()
            if player.Character then
                enableRise(player.Character) -- Uses latest CONFIG.Movement.Rise.Speed/MaxHeight
            end
        end
        
        -- Re-enable Float if enabled
        if CONFIG.Movement.Float.Enabled then
            pcall(function() disableFloat() end)
            pcall(function() enableFloat(newCharacter) end)
        end
        
        -- Re-enable Helicopter if enabled
        if CONFIG.Movement.Helicopter.Enabled then
            pcall(function() disableHelicopter() end)
            pcall(function() enableHelicopter(newCharacter) end)
        end
        
        -- Re-enable Mobile Desync if enabled
        if _G.mobileDesyncEnabled then
            pcall(function() disableMobileDesync() end)
            pcall(function() enableMobileDesync() end)
        end
        
        -- Re-enable Ragdoll Desync if enabled
        if CONFIG.Desync.RagdollDesync.Enabled then
            pcall(function() disableRagdollDesync() end)
            pcall(function() enableRagdollDesync(newCharacter) end)
        end

        -- Reattach ESP if enabled
        if _G.ESP_Enabled then
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= player and plr.Character then
                    attachHighlightToCharacter(plr, plr.Character)
                end
            end
        end
        
        -- Re-enable Plot ESP if enabled
        if _G.PlotESP_Enabled then
            pcall(function() disablePlotESP() end)
            pcall(function() enablePlotESP() end)
        end
        
        -- Re-enable Plot Time ESP if enabled
        if _G.PlotTimeESP_Enabled then
            pcall(function() disablePlotTimeESP() end)
            pcall(function() enablePlotTimeESP() end)
        end
        
        -- Re-enable Brainrot ESP if enabled
        if CONFIG.ESP.BrainrotESP.Enabled then
            pcall(function() disableBrainrotESP() end)
            pcall(function() enableBrainrotESP() end)
        end
        
        -- Re-enable Anti-Kick if enabled
        if CONFIG.AntiKick.Enabled then
            pcall(function() disableAntiKick() end)
            pcall(function() enableAntiKick() end)
        end
    end)
    if not success then
        warn("Failed to handle character respawn")
    end
end)

--=========================================================
-- Initial Setup
--=========================================================
local function initialize()
    local success, _ = pcall(function()
        -- Set default section
        activeSection = "Home"
        local sectionNames = {}
        for name, _ in pairs(sections) do
            table.insert(sectionNames, name)
        end
        -- Debug info removed for clean console
        sections.Home.Visible = true
        sidebar:FindFirstChild("HomeButton").BackgroundColor3 = CONFIG.Colors.Accent
        -- ActiveFeatures removed
        
        -- Toggle states will be restored at the end of the script

        -- Ensure plot is rechecked periodically
        task.spawn(function()
            while true do
                if not playerPlot or not playerPlot.Parent then
                    playerPlot = findPlayerPlot()
                end
                task.wait(2)
            end
        end)
        
        -- Save UI state periodically
        task.spawn(function()
            while true do
                _G.saveUIState()
                task.wait(2) -- Save UI state every 2 seconds
            end
        end)
    end)
    if not success then
        warn("Failed to initialize UI")
    end
end

initialize()

--=========================================================
-- Cleanup on Script End
--=========================================================
game:BindToClose(function()
    local success, _ = pcall(function()
        -- Disable all features
        if _G.ESP_Enabled then disableESP() end
        if _G.PlotESP_Enabled then disablePlotESP() end
        if isServerHopActive then toggleServerHop(false) end
        if jumpSwitch and jumpSwitch.get and jumpSwitch.set then
        if jumpSwitch.get() then jumpSwitch.set(false) end
        end
        if speedSwitch and speedSwitch.get and speedSwitch.set then
        if speedSwitch.get() then speedSwitch.set(false) end
        end
        if invisibilitySwitch and invisibilitySwitch.get then
        if invisibilitySwitch.get() then setInvisibility(false) end
        end
        if unhittableSwitchInstance and unhittableSwitchInstance.get and unhittableSwitchInstance.set then
        if unhittableSwitchInstance.get() then unhittableSwitchInstance.set(false) end
        end
        if resizeSwitchInstance and resizeSwitchInstance.get and resizeSwitchInstance.set then
        if resizeSwitchInstance.get() then resizeSwitchInstance.set(false) end
        end
        if flingSwitchInstance and flingSwitchInstance.get and flingSwitchInstance.set then
        if flingSwitchInstance.get() then flingSwitchInstance.set(false) end
        end
        if CloneFlight_Enabled then disableCloneFlight() end
        if isCarpetMode then toggleCarpetMode(false) end
        if isLaserCapeFiring then disableLaserCape() end
        -- Disable Desync features
        if _G.mobileDesyncEnabled then disableMobileDesync() end
        -- Disable Ragdoll Desync
        if CONFIG.Movement.RagdollDesync and CONFIG.Movement.RagdollDesync.Enabled then disableRagdollDesync() end
        -- Disable Brainrot ESP
        if CONFIG.ESP.BrainrotESP.Enabled then disableBrainrotESP() end
    end)
    if not success then
        warn("Failed to clean up on script close")
    end
end)

-- ===== ULTRA-COMPACT ESP =====
_G.ESP = {suffixes={K=1e3,M=1e6,B=1e9,T=1e12,Qa=1e15,Qi=1e18},current={overhead=nil,modelHighlight=nil,partHighlight=nil,maxVal=-1,owner=nil},playerHighlights={}}

function _G.parseGen(text)
    if not text then return 0 end
    text = text:match("^%$(.+)") or text
    text = text:gsub("/S$", ""):gsub(",", "")
    local num = tonumber(text:match("^[%d%.]+")) or 0
    local suffix = text:match("[%a]+")
    return suffix and _G.ESP.suffixes[suffix] and num * _G.ESP.suffixes[suffix] or num
end

function _G.clearVisuals()
    if _G.ESP.current.modelHighlight then _G.ESP.current.modelHighlight:Destroy() _G.ESP.current.modelHighlight = nil end
    if _G.ESP.current.partHighlight then _G.ESP.current.partHighlight:Destroy() _G.ESP.current.partHighlight = nil end
end

function _G.updateHighest()
    local plots = Workspace:FindFirstChild("Plots")
    if not plots then return end
    _G.clearVisuals()
    local bestVal, bestOverhead, bestOwner = -1, nil, nil
    for _, plot in ipairs(plots:GetChildren()) do
        if plot:IsA("Model") or plot:IsA("Folder") then
            local plotBest = -1
            for _, obj in ipairs(plot:GetDescendants()) do
                if obj.Name == "AnimalOverhead" and obj:IsA("BillboardGui") then
                    local gen = obj:FindFirstChild("Generation")
                    if gen and gen:IsA("TextLabel") then
                        local val = _G.parseGen(gen.Text)
                        if val > plotBest then plotBest, bestOverhead = val, obj end
                    end
                end
            end
            if bestOverhead and plotBest > bestVal then
                local sign = plot:FindFirstChild("PlotSign", true)
                local label = sign and sign:FindFirstChildWhichIsA("TextLabel", true)
                local owner = label and label.Text:gsub("[''']s$", ""):gsub("%s+$", "")
                if owner and string.lower(owner) ~= string.lower(player.Name) then
                    bestVal, bestOwner = plotBest, owner
                end
            end
        end
    end
    if not bestOverhead then return end
    _G.ESP.current.overhead, _G.ESP.current.maxVal, _G.ESP.current.owner = bestOverhead, bestVal, bestOwner
    local displayName = bestOverhead:FindFirstChild("DisplayName")
    if not displayName then return end
    local parent = bestOverhead.Parent
    for _=1,4 do parent = parent and parent.Parent end
    local target = nil
    for i=0,2 do
        local candidate = parent
        for _=1,i do candidate = candidate and candidate.Parent end
        if candidate then
            local child = candidate:FindFirstChild(displayName.Text)
            if child then target = child break end
        end
    end
    if not target then return end
    local highlight = Instance.new("Highlight")
    highlight.Adornee, highlight.FillTransparency, highlight.FillColor = target, 0.75, Color3.fromRGB(255,0,0)
    highlight.OutlineTransparency, highlight.OutlineColor = 0, Color3.fromRGB(255,0,0)
    highlight.Parent = target
    _G.ESP.current.modelHighlight = highlight
    local part = target:IsA("BasePart") and target or target:FindFirstChildWhichIsA("BasePart", true)
    if part then
        local partHighlight = Instance.new("Highlight")
        partHighlight.Adornee, partHighlight.FillTransparency, partHighlight.FillColor = part, 0.75, Color3.fromRGB(255,0,0)
        partHighlight.OutlineTransparency, partHighlight.OutlineColor = 0, Color3.fromRGB(255,0,0)
        partHighlight.Parent = Workspace
        _G.ESP.current.partHighlight = partHighlight
    end
end

task.spawn(function()
    while true do
        _G.updateHighest()
        task.wait(2)
    end
end)

for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~= player and plr.Character then
        local highlight = Instance.new("Highlight")
        highlight.Adornee, highlight.FillColor = plr.Character, Color3.fromRGB(173, 216, 230)
        highlight.FillTransparency, highlight.OutlineTransparency = 0.75, 0
        highlight.OutlineColor, highlight.Parent = Color3.fromRGB(173, 216, 230), plr.Character
        _G.ESP.playerHighlights[plr] = highlight
    end
end

-- Test save system on startup
task.wait(2) -- Wait for UI to be created
pcall(function()
_G.saveUIState()
end)

-- Periodic Settings Save System (Every 3 seconds)
task.spawn(function()
    while true do
        task.wait(3)
        pcall(function()
        _G.saveUIState()
        end)
    end
end)

--- Restore toggle states after ALL switches are created
task.wait(1) -- Wait a moment for all switches to be fully initialized
pcall(function()
_G.applyLoadedToggleStates()
end)

-- Save current UI state to ensure persistent toggles are saved
task.wait(0.5) -- Small delay to ensure everything is loaded
pcall(function()
_G.saveUIState()
end)
