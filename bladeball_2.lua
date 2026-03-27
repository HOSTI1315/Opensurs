if game:GetService("CoreGui"):FindFirstChild("incognito") then
    oldstring = loadstring
    getfenv().loadstring = function(code)
        local source = code
        source = source:gsub("(%a+)%s*([%+%-%*/])=%s*", "%1 = %1 %2 ")
        return oldstring(source)
    end
end
if not getgenv then
    getfenv().getgenv = function(layer)
        return getfenv(layer)
    end
end
local nosaves = false
local saved_settings
local settings = {
	ui_bind = "Enum.KeyCode.RightControl";
	opaque = 0.4;
}
queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
HttpService = game:GetService("HttpService")
everyClipboard = setclipboard or toclipboard or set_clipboard or setrbxclipboard or (Clipboard and Clipboard.set)
if not everyClipboard then
	-- creds to vxsty
getgenv().setclipboard = function(data)
    local vim = game:GetService('VirtualInputManager');
    local old = game:GetService("UserInputService"):GetFocusedTextBox()
    local copy = tostring(data)
    local gui = Instance.new("ScreenGui", getgenv().gethui())
    local a = Instance.new('TextBox', gui)
    a.PlaceholderText = ''
    a.Text = copy
    a.ClearTextOnFocus = false
    a.Size = UDim2.new(.1, 0, .15, 0)
    a.Position = UDim2.new(10, 0, 10, 0)
    a:CaptureFocus()
    a = Enum.KeyCode
    local Keys = {
     a.RightControl, a.A
    }
    local Keys2 = {
     a.RightControl, a.C, a.V
    }
    for i, v in ipairs(Keys) do
     vim:SendKeyEvent(true, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys) do
     vim:SendKeyEvent(false, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys2) do
     vim:SendKeyEvent(true, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys2) do
     vim:SendKeyEvent(false, v, false, game)
     task.wait()
    end
    gui:Destroy()
    if old then old:CaptureFocus() end
end
-- creds to vxsty
getgenv().setrbxclipboard = function(data)
    local vim = game:GetService('VirtualInputManager');
    local old = game:GetService("UserInputService"):GetFocusedTextBox()
    local copy = tostring(data)
    local gui = Instance.new("ScreenGui", getgenv().gethui())
    local a = Instance.new('TextBox', gui)
    a.PlaceholderText = ''
    a.Text = copy
    a.ClearTextOnFocus = false
    a.Size = UDim2.new(.1, 0, .15, 0)
    a.Position = UDim2.new(10, 0, 10, 0)
    a:CaptureFocus()
    a = Enum.KeyCode
    local Keys = {
     a.RightControl, a.A
    }
    local Keys2 = {
     a.RightControl, a.C, a.V
    }
    for i, v in ipairs(Keys) do
     vim:SendKeyEvent(true, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys) do
     vim:SendKeyEvent(false, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys2) do
     vim:SendKeyEvent(true, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys2) do
     vim:SendKeyEvent(false, v, false, game)
     task.wait()
    end
    gui:Destroy()
    if old then old:CaptureFocus() end
end
-- creds to vxsty
getgenv().toclipboard = function(data)
    local vim = game:GetService('VirtualInputManager');
    local old = game:GetService("UserInputService"):GetFocusedTextBox()
    local copy = tostring(data)
    local gui = Instance.new("ScreenGui", getgenv().gethui())
    local a = Instance.new('TextBox', gui)
    a.PlaceholderText = ''
    a.Text = copy
    a.ClearTextOnFocus = false
    a.Size = UDim2.new(.1, 0, .15, 0)
    a.Position = UDim2.new(10, 0, 10, 0)
    a:CaptureFocus()
    a = Enum.KeyCode
    local Keys = {
     a.RightControl, a.A
    }
    local Keys2 = {
     a.RightControl, a.C, a.V
    }
    for i, v in ipairs(Keys) do
     vim:SendKeyEvent(true, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys) do
     vim:SendKeyEvent(false, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys2) do
     vim:SendKeyEvent(true, v, false, game)
     task.wait()
    end
    for i, v in ipairs(Keys2) do
     vim:SendKeyEvent(false, v, false, game)
     task.wait()
    end
    gui:Destroy()
    if old then old:CaptureFocus() end
end
end
if not cloneref then
	getgenv().cloneref = function(a)
		local s, _ = pcall(function() return a:Clone() end) return s and _ or a
	end
end
if not mouse1press and not mouse1release then
	-- creds to vxsty
getgenv().mouse1click = function(x, y)
	local vim = game:GetService('VirtualInputManager');
    x = x or 0
	y = y or 0
	vim:SendMouseButtonEvent(x, y, 0, true, game, false)
	task.wait()
	vim:SendMouseButtonEvent(x, y, 0, false, game, false)
end
getgenv().mouse2click = function(x, y)
    local vim = game:GetService('VirtualInputManager');
	x = x or 0
	y = y or 0
	vim:SendMouseButtonEvent(x, y, 1, true, game, false)
	task.wait()
	vim:SendMouseButtonEvent(x, y, 1, false, game, false)
end
getgenv().mouse1press = function(x, y)
    local vim = game:GetService('VirtualInputManager');
	x = x or 0
	y = y or 0
	vim:SendMouseButtonEvent(x, y, 0, true, game, false)
end
getgenv().mouse1release = function(x, y)
    local vim = game:GetService('VirtualInputManager');
	x = x or 0
	y = y or 0
	vim:SendMouseButtonEvent(x, y, 0, false, game, false)
end
getgenv().mouse2press = function(x, y)
    local vim = game:GetService('VirtualInputManager');
	x = x or 0
	y = y or 0
	vim:SendMouseButtonEvent(x, y, 1, true, game, false)
end
getgenv().mouse2release = function(x, y)
    local vim = game:GetService('VirtualInputManager');
	x = x or 0
	y = y or 0
	vim:SendMouseButtonEvent(x, y, 1, false, game, false)
end
getgenv().mousescroll = function(x, y, a)
    local vim = game:GetService('VirtualInputManager');
	x = x or 0
	y = y or 0
	a = a and true or false
	vim:SendMouseWheelEvent(x, y, a, game)
end
getgenv().mousemoverel = function(relx, rely)
    local vim = game:GetService('VirtualInputManager');
	local Pos = workspace.CurrentCamera.ViewportSize
	relx = relx or 0
	rely = rely or 0
	local x = Pos.X * relx
	local y = Pos.Y * rely
	vim:SendMouseMoveEvent(x, y, game)
end
getgenv().mousemoveabs = function(x, y)
    local vim = game:GetService('VirtualInputManager');
	x = x or 0
	y = y or 0
	vim:SendMouseMoveEvent(x, y, game)
end
end
HttpService = cloneref(game:GetService("HttpService")) or game:GetService("HttpService")
defaults = HttpService:JSONEncode(settings)
local OptTheme = "Midnight"
local string2 = "https://discord.com/invite/jVf7eSrED9"
_G.infydtype = 1
_G.guidragtype = "https://raw.githubusercontent.com/yofriendfromschool1/aw-temp-fix/main/skui.lua"
UserInputService = game:GetService("UserInputService")
VREnabled = game:GetService("VRService").VREnabled
local IsOnMobile = table.find({
	Enum.Platform.IOS,
	Enum.Platform.Android
}, UserInputService:GetPlatform())

if IsOnMobile then
	_G.infydtype = "https://raw.githubusercontent.com/yofriendfromschool1/mobile-delta-inf-yield/main/deltainfyield.txt"
elseif iswave then
	_G.infydtype = "https://raw.githubusercontent.com/yofriendfromschool1/wave_fixedscripts/main/iy.lua"
else
	_G.infydtype = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
end
local iswave = false
if detourfunction then
	if not IsOnMobile then
		iswave = true
	end
end

_G.lmao24 = "loo"
if game:GetService("SoundService").RespectFilteringEnabled == true then
	_G.lmao24 = "Enabled"
else
	_G.lmao24 = "Disabled"
end
function save()
	if not isfolder("Sky Hub") and not nosaves then
		makefolder("Sky Hub")
		nosaves = true
		task.wait()
		local update = {
			["ui_bind"] = settings["ui_bind"],
			["opaque"] = settings["opaque"]
		}
		task.wait()
		writefile([[Sky Hub/Sky Hub Settings.json]], HttpService:JSONEncode(update))
	end
end
function updatesaves()
	local update = {
		ui_bind = ui_bind;
		opaque = opaque;
	}
	writefile("Sky Hub/Sky Hub Settings.json", HttpService:JSONEncode(update))
end
task.wait()
function loadsettings()
	task.wait(1)
	if isfolder("Sky Hub") and isfile([[Sky Hub/Sky Hub Settings.json]]) then
		local success, response = pcall(function()
			local settings = HttpService:JSONDecode(readfile([[Sky Hub/Sky Hub Settings.json]]))
			if settings.ui_bind ~= nil or settings.ui_bind ~= "null" then
				if settings.ui_bind == "Enum.KeyCode.RightControl" then
					getgenv().SkyhubKeybind = Enum.KeyCode.RightControl
				elseif settings.ui_bind == "Enum.KeyCode.LeftControl" then
					getgenv().SkyhubKeybind = Enum.KeyCode.LeftControl
				elseif settings.ui_bind == "Enum.KeyCode.LeftAlt" then
					getgenv().SkyhubKeybind = Enum.KeyCode.LeftAlt
				elseif settings.ui_bind == "Enum.KeyCode.RightAlt" then
					getgenv().SkyhubKeybind = Enum.KeyCode.RightAlt
				elseif settings.ui_bind == "Enum.KeyCode.Insert" then
					getgenv().SkyhubKeybind = Enum.KeyCode.Insert
				elseif settings.ui_bind == "Enum.KeyCode.End" then
					getgenv().SkyhubKeybind = Enum.KeyCode.End
				elseif settings.ui_bind == "Enum.KeyCode.Delete" then
					getgenv().SkyhubKeybind = Enum.KeyCode.Delete
				elseif settings.ui_bind == "Enum.KeyCode.LeftShift" then
					getgenv().SkyhubKeybind = Enum.KeyCode.LeftShift
				elseif settings.ui_bind == "Enum.KeyCode.RightShift" then
					getgenv().SkyhubKeybind = Enum.KeyCode.RightShift
				elseif settings.ui_bind == "Enum.KeyCode.F1" then
					getgenv().SkyhubKeybind = Enum.KeyCode.F1
				elseif settings.ui_bind == "Enum.KeyCode.Q" then
					getgenv().SkyhubKeybind = Enum.KeyCode.Q
				elseif settings.ui_bind == "Enum.KeyCode.E" then
					getgenv().SkyhubKeybind = Enum.KeyCode.E
				elseif settings.ui_bind == "Enum.KeyCode.R" then
					getgenv().SkyhubKeybind = Enum.KeyCode.R
				elseif settings.ui_bind == "Enum.KeyCode.T" then
					getgenv().SkyhubKeybind = Enum.KeyCode.T
				elseif settings.ui_bind == "Enum.KeyCode.Y" then
					getgenv().SkyhubKeybind = Enum.KeyCode.Y
				elseif settings.ui_bind == "Enum.KeyCode.U" then
					getgenv().SkyhubKeybind = Enum.KeyCode.U
				elseif settings.ui_bind == "Enum.KeyCode.P" then
					getgenv().SkyhubKeybind = Enum.KeyCode.P
				elseif settings.ui_bind == "Enum.KeyCode.Z" then
					getgenv().SkyhubKeybind = Enum.KeyCode.Z
				elseif settings.ui_bind == "Enum.KeyCode.X" then
					getgenv().SkyhubKeybind = Enum.KeyCode.X
				elseif settings.ui_bind == "Enum.KeyCode.M" then
					getgenv().SkyhubKeybind = Enum.KeyCode.M
				elseif settings.ui_bind == "Enum.KeyCode.V" then
					getgenv().SkyhubKeybind = Enum.KeyCode.V
				elseif settings.ui_bind == "Enum.KeyCode.N" then
					getgenv().SkyhubKeybind = Enum.KeyCode.N
				elseif settings.ui_bind == "Enum.KeyCode.Period" then
					getgenv().SkyhubKeybind = Enum.KeyCode.Period
				end
			else
				getgenv().SkyhubKeybind = Enum.KeyCode.RightControl 
			end
			if settings.opaque ~= nil or settings.opaque ~= "null" then
				getgenv().BlurIntes = settings.opaque 
			else 
				getgenv().BlurIntes = 0.4 
			end
		end)
		if not success then
			Library.Notify("Warning", "Something went wrong while loading saves", 5)
			task.wait()
			save()
		end
	end
end
task.wait()
save()
local Library = loadstring(game:HttpGet(_G.guidragtype))()
loadsettings()
if IsOnMobile or VREnabled then
	Library.Notify("Warning", 'your OS is not supported with some scripts since of keyboard functions, do you want to execute a keyboard script?', 35, function(val)
		if val == true then
		else
			loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt"))()
		end
	end, {
		"Yes Please!",
		"Nah"
	})
end
if iswave then
	Library.Notify("Warning", 'Your Executor "Wave" Is dog shit and file functions are shit so would you like a fix for them so more support for more scripts or disable them? or ingore this and keep somewhat functions (takes abt 40 secs to go away)', 35, function(val)
		if val == true then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/wave_fixedscripts/main/Disable%20file%20and%20folder%20functions%20Wave.lua"))()
		else
			loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/wave_fixedscripts/main/FileFixes.lua"))()
		end
	end, {
		"Enable Fix for file functions",
		"Disable File/Folder functions"
	})
end
if queueteleport then
	Library.Notify("Warning", "Would you like to bring this script with you on teleport/ to the next game?", 15, function(val)
		if val == true then
		else
			queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt'))()")
		end
	end, {
		"Yes",
		"No thanks."
	})
end
if writefile and readfile and makefolder then
else
	Library.Notify("Warning", "Your Executor does not support saving files, Settings will not save.", 15)
end
if not IsOnMobile then
	Library.Notify("Current Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your current keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
end
local Window = Library.CreateLib("Sky Hub", OptTheme)
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")
MainSection:NewButton("Trap Hub", "yuh", function()
	local repo = "https://raw.githubusercontent.com/TrapstarKSSKSKSKKS/Main/main/"
	local Id = game.PlaceId
	local GameId = game.GameId
	local Games = {
		["AA"] = {
			FileName = getgenv().BetaScript and "AnimeAdventures-Rewrite" or "Anime%20Adventures",
			PlaceId = {
				3183403065
			},
			GameName = "Anime Adventures",
		},
		["RoGhoul"] = {
			FileName = "RoGhoul",
			PlaceId = {
				380704901
			},
			GameName = "RoGhoul",
		},
		["Blade Ball"] = {
			FileName = "BladeBall",
			PlaceId = {
				4777817887
			},
			GameName = "Blade Ball",
		},
		["ASX"] = {
			FileName = "AnimeSouls",
			PlaceId = {
				5300677688
			},
			GameName = "Anime Souls Simulator X",
		},
		["ALS"] = {
			FileName = "AnimeLast",
			PlaceId = {
				4509896324
			},
			GameName = "Anime Last",
		},
	}
	local function LoadScript(name)
		local data = Games[name]
		getgenv().GameName = data.GameName
		loadstring(game:HttpGet(repo .. data.FileName .. ".lua"))()
	end
	for name, data in next, Games do
		for _, v in next, data.PlaceId do
			if Id == v or GameId == v then
				LoadScript(name)
			end
		end
	end
end)
MainSection:NewButton("Hydro Hub", "Hub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/FRX397/Hydrohub/main/Hydro_hub", true))()
end)
MainSection:NewButton("Redz Hub", "Hub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BladeBall/main/redz9999"))()
end)
MainSection:NewButton("Bedol V2 Premium", "Hub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua"))()
end)
MainSection:NewButton("FFJ Hub", "Hub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
end)
MainSection:NewButton("Dungkee", "by pulawat6680", function()
	loadstring(game:HttpGet("https://github.com/Stang001/pulawat/blob/main/BladeBall.lua?raw=true"))()
end)
MainSection:NewButton("Blade Ball Scripts", "idk", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/zippy6349/Blade_Ball/main/Blade%20Ball.txt"))()
end)
MainSection:NewButton("AFGClient", "idk", function()
	do
		local version = "1.0";
		print("Afg Client *BLADEBALL*");
		print(version);
		warn("Updated Script UI and some funcs arent made by me");
		local Stats = game:GetService("Stats");
		local Players = game:GetService("Players");
		local RunService = game:GetService("RunService");
		local ReplicatedStorage = game:GetService("ReplicatedStorage");
		local TweenService = game:GetService("TweenService");
		local Nurysium_Util = loadstring(game:HttpGet("https://raw.githubusercontent.com/flezzpe/Nurysium/main/nurysium_helper.lua"))();
		local local_player = Players.LocalPlayer;
		local camera = game:GetService("Workspace").CurrentCamera;
		local nurysium_Data = nil;
		local hit_Sound = nil;
		local closest_Entity = nil;
		local parry_remote = nil;
		getgenv().aura_Enabled = false;
		getgenv().hit_sound_Enabled = false;
		getgenv().hit_effect_Enabled = false;
		getgenv().night_mode_Enabled = false;
		getgenv().trail_Enabled = false;
		getgenv().self_effect_Enabled = false;
		getgenv().kill_effect_Enabled = false;
		getgenv().shaders_effect_Enabled = false;
		getgenv().ai_Enabled = false;
		getgenv().spectate_Enabled = false;
		local Services = {
			game:GetService("AdService"),
			game:GetService("SocialService")
		};
		local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/flezzpe/Nurysium/main/nurysium_ui.lua"))();
		task.wait(0.5);
		library:init("Afg Client | Blade Ball V "   .. version , game:GetService("UserInputService").TouchEnabled, game:GetService("CoreGui"));
		library:create_section("Combat", 17440545793);
		library:create_section("World", 17440865331);
		library:create_section("Misc", 17440868530);
		function initializate(dataFolder_name)
			local nurysium_Data = Instance.new("Folder", game:GetService("CoreGui"));
			nurysium_Data.Name = dataFolder_name;
			hit_Sound = Instance.new("Sound", nurysium_Data);
			hit_Sound.SoundId = "rbxassetid://6607204501";
			hit_Sound.Volume = 6;
		end
		local function get_closest_entity(Object)
			task.spawn(function()
				local closest;
				local max_distance = math.huge;
				for index, entity in game:GetService("Workspace").Alive:GetChildren() do
					if (entity.Name ~= Players.LocalPlayer.Name) then
						local distance = (Object.Position - entity.HumanoidRootPart.Position).Magnitude;
						if (distance < max_distance) then
							closest_Entity = entity;
							max_distance = distance;
						end
					end
				end
				return closest_Entity;
			end);
		end
		local function get_center()
			for _, object in game:GetService("Workspace").Map:GetDescendants() do
				if (object.Name == "BALLSPAWN") then
					return object;
				end
			end
		end
		function resolve_parry_Remote()
			for _, value in Services do
				local temp_remote = value:FindFirstChildOfClass("RemoteEvent");
				if  not temp_remote then
					continue;
				end
				if  not temp_remote.Name:find("\n") then
					continue;
				end
				parry_remote = temp_remote;
			end
		end
		function walk_to(position)
			local_player.Character.Humanoid:MoveTo(position);
		end
		library:create_toggle("Aura", "Combat", function(toggled)
			resolve_parry_Remote();
			getgenv().aura_Enabled = toggled;
		end);
		library:create_toggle("AI - Beta", "Combat", function(toggled)
			resolve_parry_Remote();
			getgenv().ai_Enabled = toggled;
		end);
		library:create_toggle("Hit Sound", "Combat", function(toggled)
			getgenv().hit_sound_Enabled = toggled;
		end);
		library:create_toggle("Hit Effect", "World", function(toggled)
			getgenv().hit_effect_Enabled = toggled;
		end);
		library:create_toggle("Night Mode", "World", function(toggled)
			getgenv().night_mode_Enabled = toggled;
		end);
		library:create_toggle("Trail", "World", function(toggled)
			getgenv().trail_Enabled = toggled;
		end);
		library:create_toggle("Self Effect", "World", function(toggled)
			getgenv().self_effect_Enabled = toggled;
		end);
		library:create_toggle("Kill Effect", "World", function(toggled)
			getgenv().kill_effect_Enabled = toggled;
		end);
		library:create_toggle("Shaders", "World", function(toggled)
			getgenv().shaders_effect_Enabled = toggled;
		end);
		library:create_toggle("Spectate Ball", "World", function(toggled)
			getgenv().spectate_Enabled = toggled;
		end);
		library:create_toggle("FPS Unlocker", "Misc", function(toggled)
			if toggled then
				setfpscap(8999999488);
			else
				setfpscap(60);
			end
		end);
		local originalMaterials = {};
		local fpsBoosterEnabled = false;
		library:create_toggle("FPS Booster", "Misc", function(toggled)
			fpsBoosterEnabled = toggled;
			if toggled then
				game:GetService("Lighting").GlobalShadows = false;
				setfpscap(8999999488);
				task.spawn(function()
					while fpsBoosterEnabled do
						local descendants = game:GetDescendants();
						local batchSize = 100;
						for i = 1, #descendants, batchSize do
							local batch = {
								unpack(descendants, i, math.min((i + batchSize) - 1 , #descendants))
							};
							for _, descendant in ipairs(batch) do
								if (descendant:IsA("Part") or descendant:IsA("UnionOperation") or descendant:IsA("MeshPart") or descendant:IsA("CornerWedgePart") or descendant:IsA("TrussPart")) then
									if  not originalMaterials[descendant] then
										originalMaterials[descendant] = {
											Material = descendant.Material,
											Reflectance = descendant.Reflectance
										};
									end
									descendant.Material = Enum.Material.Plastic;
									descendant.Reflectance = 0;
								elseif descendant:IsA("Decal") then
									descendant.Transparency = 1;
								elseif (descendant:IsA("ParticleEmitter") or descendant:IsA("Trail")) then
									descendant.Lifetime = NumberRange.new(0);
								elseif descendant:IsA("Explosion") then
									descendant.BlastPressure = 1;
									descendant.BlastRadius = 1;
								end
							end
							task.wait(0.1);
						end
						local lightingDescendants = game:GetService("Lighting"):GetDescendants();
						for _, effect in pairs(lightingDescendants) do
							if (effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") or effect:IsA("DepthOfFieldEffect")) then
								effect.Enabled = false;
							end
							task.defer(function()
							end);
						end
						task.wait(2.5);
					end
				end);
			else
				for part, originalData in pairs(originalMaterials) do
					if (part:IsA("Part") or part:IsA("UnionOperation") or part:IsA("MeshPart") or part:IsA("CornerWedgePart") or part:IsA("TrussPart")) then
						part.Material = originalData.Material;
						part.Reflectance = originalData.Reflectance;
					end
				end
				originalMaterials = {};
				game:GetService("Lighting").GlobalShadows = true;
				setfpscap(120);
			end
		end);
		library:create_toggle("Discord Invite", "Misc", function(toggle)
			setclipboard("https://discord.com/invite/BKPQBt2K9k");
			toclipboard("https://discord.com/invite/BKPQBt2K9k");
		end);
		function play_kill_effect(Part)
			task.defer(function()
				local bell = game:GetObjects("rbxassetid://17519762269")[1];
				bell.Name = "Yeat_BELL";
				bell.Parent = game:GetService("Workspace");
				bell.Position = Part.Position - Vector3.new(0, 20, 0) ;
				bell:WaitForChild("Sound"):Play();
				TweenService:Create(bell, TweenInfo.new(0.85, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
					Position = Part.Position + Vector3.new(0, 10, 0)
				}):Play();
				task.delay(5, function()
					TweenService:Create(bell, TweenInfo.new(1.75, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
						Position = Part.Position + Vector3.new(0, 100, 0)
					}):Play();
				end);
				task.delay(6, function()
					bell:Destroy();
				end);
			end);
		end
		task.defer(function()
			game:GetService("Workspace").Alive.ChildRemoved:Connect(function(child)
				if ( not game:GetService("Workspace").Dead:FindFirstChild(child.Name) and (child ~= local_player.Character) and ( #game:GetService("Workspace").Alive:GetChildren() > 1)) then
					return;
				end
				if getgenv().kill_effect_Enabled then
					play_kill_effect(child.HumanoidRootPart);
				end
			end);
		end);
		task.defer(function()
			game:GetService("RunService").Heartbeat:Connect(function()
				if  not local_player.Character then
					return;
				end
				if getgenv().self_effect_Enabled then
					local effect = game:GetObjects("rbxassetid://17519530107")[1];
					effect.Name = "nurysium_efx";
					if local_player.Character.PrimaryPart:FindFirstChild("nurysium_efx") then
						return;
					end
					effect.Parent = local_player.Character.PrimaryPart;
				elseif local_player.Character.PrimaryPart:FindFirstChild("nurysium_efx") then
					local_player.Character.PrimaryPart['nurysium_efx']:Destroy();
				end
			end);
		end);
		task.defer(function()
			game:GetService("RunService").Heartbeat:Connect(function()
				if  not local_player.Character then
					return;
				end
				if getgenv().trail_Enabled then
					local trail = game:GetObjects("rbxassetid://17483658369")[1];
					trail.Name = "nurysium_fx";
					if local_player.Character.PrimaryPart:FindFirstChild("nurysium_fx") then
						return;
					end
					local Attachment0 = Instance.new("Attachment", local_player.Character.PrimaryPart);
					local Attachment1 = Instance.new("Attachment", local_player.Character.PrimaryPart);
					Attachment0.Position = Vector3.new(0, -2.411, 0);
					Attachment1.Position = Vector3.new(0, 2.504, 0);
					trail.Parent = local_player.Character.PrimaryPart;
					trail.Attachment0 = Attachment0;
					trail.Attachment1 = Attachment1;
				elseif local_player.Character.PrimaryPart:FindFirstChild("nurysium_fx") then
					local_player.Character.PrimaryPart['nurysium_fx']:Destroy();
				end
			end);
		end);
		task.defer(function()
			while task.wait(1) do
				if getgenv().night_mode_Enabled then
					TweenService:Create(game:GetService("Lighting"), TweenInfo.new(3), {
						ClockTime = 1.9
					}):Play();
				else
					TweenService:Create(game:GetService("Lighting"), TweenInfo.new(3), {
						ClockTime = 13.5
					}):Play();
				end
			end
		end);
		task.defer(function()
			RunService.RenderStepped:Connect(function()
				if getgenv().spectate_Enabled then
					local self = Nurysium_Util.getBall();
					if  not self then
						return;
					end
					game:GetService("Workspace").CurrentCamera.CFrame = game:GetService("Workspace").CurrentCamera.CFrame:Lerp(CFrame.new(game:GetService("Workspace").CurrentCamera.CFrame.Position, self.Position), 1.5);
				end
			end);
		end);
		task.defer(function()
			while task.wait(1) do
				if getgenv().shaders_effect_Enabled then
					TweenService:Create(game:GetService("Lighting").Bloom, TweenInfo.new(4), {
						Size = 100,
						Intensity = 2.1
					}):Play();
					game:GetService("Lighting").GlobalShadows = true;
				else
					TweenService:Create(game:GetService("Lighting").Bloom, TweenInfo.new(3), {
						Size = 3,
						Intensity = 1
					}):Play();
				end
			end
		end);
		ReplicatedStorage.Remotes.ParrySuccess.OnClientEvent:Connect(function()
			if getgenv().hit_sound_Enabled then
				hit_Sound:Play();
			end
			if getgenv().hit_effect_Enabled then
				local hit_effect = game:GetObjects("rbxassetid://17407244385")[1];
				hit_effect.Parent = Nurysium_Util.getBall();
				hit_effect:Emit(3);
				task.delay(5, function()
					hit_effect:Destroy();
				end);
			end
		end);
		local aura = {
			can_parry = true,
			is_spamming = false,
			parry_Range = 0,
			spam_Range = 0,
			hit_Count = 0,
			hit_Time = tick(),
			ball_Warping = tick(),
			is_ball_Warping = false,
			last_target = nil
		};
		task.defer(function()
			game:GetService("RunService").Heartbeat:Connect(function()
				if (getgenv().ai_Enabled and game:GetService("Workspace").Alive:FindFirstChild(local_player.Character.Name)) then
					local self = Nurysium_Util.getBall();
					if ( not self or  not closest_Entity) then
						return;
					end
					if  not closest_Entity:FindFirstChild("HumanoidRootPart") then
						walk_to(local_player.Character.HumanoidRootPart.Position + Vector3.new(math.sin(tick()) * math.random(35, 50) , 0, math.cos(tick()) * math.random(35, 50) ) );
						return;
					end
					local ball_Position = self.Position;
					local ball_Speed = self.AssemblyLinearVelocity.Magnitude;
					local ball_Distance = local_player:DistanceFromCharacter(ball_Position);
					local player_Position = local_player.Character.PrimaryPart.Position;
					local target_Position = closest_Entity.HumanoidRootPart.Position;
					local target_Distance = local_player:DistanceFromCharacter(target_Position);
					local target_LookVector = closest_Entity.HumanoidRootPart.CFrame.LookVector;
					local resolved_Position = Vector3.zero;
					local target_Humanoid = closest_Entity:FindFirstChildOfClass("Humanoid");
					if (target_Humanoid and (target_Humanoid:GetState() == Enum.HumanoidStateType.Jumping) and (local_player.Character.Humanoid.FloorMaterial ~= Enum.Material.Air)) then
						local_player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
					end
					if (((ball_Position - player_Position):Dot(local_player.Character.PrimaryPart.CFrame.LookVector) < -0.2) and ((tick() % 4) <= 2)) then
						return;
					end
					if ((tick() % 4) <= 2) then
						if (target_Distance > 10) then
							resolved_Position = target_Position + ((player_Position - target_Position).Unit * 8) ;
						else
							resolved_Position = target_Position + ((player_Position - target_Position).Unit * 25) ;
						end
					else
						resolved_Position = target_Position - (target_LookVector * (math.random(8.5, 13.5) + (ball_Distance / math.random(8, 20)))) ;
					end
					if ((player_Position - target_Position).Magnitude < 8) then
						resolved_Position = target_Position + ((player_Position - target_Position).Unit * 35) ;
					end
					if (ball_Distance < 8) then
						resolved_Position = player_Position + ((player_Position - ball_Position).Unit * 10) ;
					end
					if aura.is_spamming then
						resolved_Position = player_Position + ((ball_Position - player_Position).Unit * 12) ;
					end
					walk_to(resolved_Position + Vector3.new(math.sin(tick()) * 10 , 0, math.cos(tick()) * 10 ) );
				end
			end);
		end);
		ReplicatedStorage.Remotes.ParrySuccessAll.OnClientEvent:Connect(function()
			aura.hit_Count += 1
			task.delay(0.005, function()
				aura.hit_Count -= 1
			end);
		end);
		task.spawn(function()
			RunService.PreRender:Connect(function()
				if  not getgenv().aura_Enabled then
					return;
				end
				if closest_Entity then
					if game:GetService("Workspace").Alive:FindFirstChild(closest_Entity.Name) then
						if aura.is_spamming then
							if (local_player:DistanceFromCharacter(closest_Entity.HumanoidRootPart.Position) <= aura.spam_Range) then
								parry_remote:FireServer(0, CFrame.new(camera.CFrame.Position, Vector3.zero), {
									[closest_Entity.Name] = closest_Entity.HumanoidRootPart.Position
								}, {
									closest_Entity.HumanoidRootPart.Position.X,
									closest_Entity.HumanoidRootPart.Position.Y
								}, false);
							end
						end
					end
				end
			end);
			RunService.PreRender:Connect(function()
				if  not getgenv().aura_Enabled then
					return;
				end
				game:GetService("Workspace"):WaitForChild("Balls").ChildRemoved:Once(function(child)
					aura.hit_Count = 0;
					aura.is_ball_Warping = false;
					aura.is_spamming = false;
					aura.can_parry = true;
					aura.last_target = nil;
				end);
				local ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 10 ;
				local self = Nurysium_Util.getBall();
				if  not self then
					return;
				end
				self:GetAttributeChangedSignal("target"):Once(function()
					aura.can_parry = true;
				end);
				self:GetAttributeChangedSignal("from"):Once(function()
					aura.last_target = game:GetService("Workspace").Alive:FindFirstChild(self:GetAttribute("from"));
				end);
				if ((self:GetAttribute("target") ~= local_player.Name) or  not aura.can_parry) then
					return;
				end
				get_closest_entity(local_player.Character.PrimaryPart);
				local player_Position = local_player.Character.PrimaryPart.Position;
				local player_Velocity = local_player.Character.HumanoidRootPart.AssemblyLinearVelocity;
				local player_isMoving = player_Velocity.Magnitude > 0 ;
				local ball_Position = self.Position;
				local ball_Velocity = self.AssemblyLinearVelocity;
				if self:FindFirstChild("zoomies") then
					ball_Velocity = self.zoomies.VectorVelocity;
				end
				local ball_Direction = (local_player.Character.PrimaryPart.Position - ball_Position).Unit;
				local ball_Distance = local_player:DistanceFromCharacter(ball_Position);
				local ball_Dot = ball_Direction:Dot(ball_Velocity.Unit);
				local ball_Speed = ball_Velocity.Magnitude;
				local ball_speed_Limited = math.min(ball_Speed / 1000 , 0.1);
				local target_Position = closest_Entity.HumanoidRootPart.Position;
				local target_Distance = local_player:DistanceFromCharacter(target_Position);
				local target_distance_Limited = math.min(target_Distance / 10000 , 0.1);
				local target_Direction = (local_player.Character.PrimaryPart.Position - closest_Entity.HumanoidRootPart.Position).Unit;
				local target_Velocity = closest_Entity.HumanoidRootPart.AssemblyLinearVelocity;
				local target_isMoving = target_Velocity.Magnitude > 0 ;
				local target_Dot = target_isMoving and math.max(target_Direction:Dot(target_Velocity.Unit), 0) ;
				aura.spam_Range = math.max(ping / 12 , 12.5) + (ball_Speed / 6.15) ;
				aura.parry_Range = math.max(math.max(ping, 3.5) + (ball_Speed / 3.25) , 9.5);
				if target_isMoving then
					aura.is_spamming = ((aura.hit_Count > 1) or ((target_Distance < 11) and (ball_Distance < 10))) and (ball_Dot > -0.25) ;
				else
					aura.is_spamming = (aura.hit_Count > 1) or ((target_Distance < 11.5) and (ball_Distance < 10)) ;
				end
				if (ball_Dot < -0.2) then
					aura.ball_Warping = tick();
				end
				task.spawn(function()
					if (((tick() - aura.ball_Warping) >= ((0.15 + target_distance_Limited) - ball_speed_Limited)) or (ball_Distance < 10)) then
						aura.is_ball_Warping = false;
						return;
					end
					if (((ball_Position - aura.last_target.HumanoidRootPart.Position).Magnitude > 35.5) or (target_Distance <= 12)) then
						aura.is_ball_Warping = false;
						return;
					end
					aura.is_ball_Warping = true;
				end);
				if ((ball_Distance <= aura.parry_Range) and  not aura.is_ball_Warping and (ball_Dot > -0.1)) then
					parry_remote:FireServer(0, CFrame.new(camera.CFrame.Position, Vector3.new(math.random( -1000, 1000), math.random(0, 1000), math.random(100, 1000))), {
						[closest_Entity.Name] = target_Position
					}, {
						target_Position.X,
						target_Position.Y
					}, false);
					aura.can_parry = false;
					aura.hit_Time = tick();
					aura.hit_Count += 1
					task.delay(0.2, function()
						aura.hit_Count -= 1
					end);
				end
				task.spawn(function()
					repeat
						RunService.PreRender:Wait();
					until (tick() - aura.hit_Time) >= 1
					aura.can_parry = true;
				end);
			end);
		end);
		initializate("nurysium_temp");
	end
end)
MainSection:NewToggle("auto parry", "idk", function(state)
	getgenv().toggableparry = state
	local L_1_ = setmetatable({}, {
		__index = function(L_7_arg0, L_8_arg1)
			local L_9_ = game:GetService(L_8_arg1)
			L_7_arg0[L_8_arg1] = L_9_;
			return L_9_
		end
	})
	local L_2_ = L_1_.Players;
	local L_3_ = L_1_.Workspace;
	local L_4_ = L_2_.LocalPlayer;
	local L_5_ = L_3_.Balls;
	local L_6_ = {}
	do
		shared.Util = L_6_;
		function L_6_.getBalls()
			local L_10_, L_11_;
			for L_12_forvar0 = 1, #L_5_:GetChildren() do
				local L_13_ = L_5_:GetChildren()[L_12_forvar0]
				if not L_13_:IsA("BasePart") then
					continue
				end;
				local L_14_ = L_13_:GetAttribute("realBall")
				if L_14_ == nil then
					continue
				end;
				if L_14_ then
					L_10_ = L_13_
				else
					L_11_ = L_13_
				end;
				if L_10_ and L_11_ then
					break
				end
			end;
			return L_10_, L_11_
		end;
		function L_6_.isHunting()
			local L_15_ = L_6_.getBalls()
			if not L_15_ then
				return false
			end;
			local L_16_ = L_15_:GetAttribute("target")
			if not L_16_ then
				return false
			end;
			return L_16_ == L_4_.Name
		end
	end;
	L_5_.ChildAdded:Connect(function()
		task.wait(1.5)
		local L_17_, L_18_;
		for L_19_forvar0 = 1, #L_5_:GetChildren() do
			local L_20_ = L_5_:GetChildren()[L_19_forvar0]
			if not L_20_:IsA("BasePart") then
				continue
			end;
			local L_21_ = L_20_.Velocity.Magnitude;
			if L_21_ == 0 then
				L_17_ = L_20_
			else
				L_18_ = L_20_
			end;
			if L_17_ and L_18_ then
				break
			end
		end;
		if L_17_ then
			local L_22_ = false;
			local L_23_ = L_17_.Position;
			local L_24_ = L_18_.Velocity;
			L_17_:GetPropertyChangedSignal("Position"):Connect(function()
				if not L_6_.isHunting() then
					return
				end;
				local L_25_ = L_4_.Character and L_4_.Character.PrimaryPart and L_4_.Character.PrimaryPart.Position;
				if not L_25_ then
					return
				end;
				local L_26_ = L_18_ and L_18_.Velocity.Magnitude or 0;
				local L_27_ = L_23_ + L_24_;
				local L_28_ = (L_27_ - L_25_).Magnitude;
				L_23_ = L_17_.Position;
				L_24_ = L_17_.Velocity;
				local L_29_ = L_28_ / (L_26_ == 0 and 1 or L_26_)
				if L_29_ <= 0.75 and not L_22_ then
					if not getgenv().toggableparry then
						return
					end
					if mouse1press and mouse1release then
						mouse1press()
						mouse1release()
					else
						Library.Notify("WARNING", "Your executor does not support mouse functions.", 5)
						return
					end
				elseif L_29_ > 1.3 then
					L_22_ = false
				end
			end)
		end
	end)
end)
local Discord = Window:NewTab("Discords", 16795709379)
local DiscordSection = Discord:NewSection("Discords")
DiscordSection:NewButton("Discord Invite", "copys discord link", function()
	if httprequest and not IsOnMobile then
		httprequest({
			Url = 'http://127.0.0.1:6463/rpc?v=1',
			Method = 'POST',
			Headers = {
				['Content-Type'] = 'application/json',
				Origin = 'https://discord.com'
			},
			Body = HttpService:JSONEncode({
				cmd = 'INVITE_BROWSER',
				nonce = HttpService:GenerateGUID(false),
				args = {
					code = 'xPDF3DkKhk'
				}
			})
		})
		Library.Notify("if nothing happened", "Make sure u have discord app open", 5)
	elseif everyClipboard then
		everyClipboard("https://discord.gg/xPDF3DkKhk")
		Library.Notify("Copied to Clipboard", "", 5)
	else
		Library.Notify("DOG SHIT EXECUTOR", "https://discord.gg/xPDF3DkKhk", 5)
	end
end)
DiscordSection:NewButton("Discord Invite OLD", "Copys Discord invite link", function()
	everyClipboard(string2)
end)
local Admins = Window:NewTab("Admins", 10016551771)
local AdminsSection = Admins:NewSection("Admins")
AdminsSection:NewButton("Infinite Yield FE", "Admin", function()
	loadstring(game:HttpGet(_G.infydtype))()
end)
AdminsSection:NewButton("Infinite Store", "Archived", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinite-Store/Infinite-Store/main/main.lua"))()
end)
AdminsSection:NewButton("Nameless Admin", "Admin", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/NamelessAdmin-NO-BYFRON-GUI/main/Source'))()
end)
AdminsSection:NewButton("fates admin", "Admin", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))();
end)
AdminsSection:NewButton("Cmd", "Admin", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/cmd/main/main.lua"))()
end)
AdminsSection:NewButton("Cmd (TEST)", "Admin tests", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/cmd/main/testing-main.lua"))()
end)
AdminsSection:NewButton("Shattervast Admin", "Admin", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/%5BFE%5D%20Shattervast.lua'))()
end)
AdminsSection:NewButton("Proton Free Admin", "Admin", function()
	_G.UI_Id = "default" --set this to "default" for the default ui
	loadstring(game:HttpGet('https://raw.githubusercontent.com/DigitalityScripts/roblox-scripts/main/Proton%20Free'))()
end)
AdminsSection:NewButton("Proton 2 free Admin", "Admin", function()
		 -- DEFAULT CMD BAR PREFIX IS ;
		 -- DEFAULT CHAT PREFIX IS /
	_G.UI_Id = "default" --set this to "default" for the default ui
	loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/5e6e6cc1bb32fd926764d064e2c60a3b.lua"))()
end)
AdminsSection:NewButton("Reviz Admin V2", "Admin", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/Reviz%20AdminV2"))()
end)
local Hubs = Window:NewTab("Hubs", 7360649366)
local HubsSection = Hubs:NewSection("Hubs")
if IsOnMobile or VREnabled then
	HubsSection:NewButton("Mobile Keyboard Script", "For mobile users", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt"))()
	end)
end
HubsSection:NewButton("FE Trolling GUI", "FE Scripts and more.", function()--
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau'), true))()
end)
HubsSection:NewButton("Sirius", "cool asl", function()--
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/Sirius/Sirius.txt'), true))()
end)
HubsSection:NewButton("Orca", "cool asff", function()--
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/Orca/latest.lua'), true))()
end)
MainSection:NewButton("Hoho Hub", "key should be and if not then do it urself", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HohoV2/main/ScriptLoad.lua"))()
end)
MainSection:NewButton("VG Hub", "60+", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
end)
HubsSection:NewButton("Psyhub", "idk", function()
	loadstring(game:GetObjects("rbxassetid://3014051754")[1].Source)()
end)
HubsSection:NewButton("Ezhub", "130+ games", function()--
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'), true))()--
end)
HubsSection:NewButton("Owl Hub", "46+ how", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
end)
HubsSection:NewButton("CocoHub", "idk", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/MarsQQ/CocoHub/master/CocoZHub'), true))()
end)
HubsSection:NewButton("MonkeHub", "idk", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/KuriWasTaken/MonkeHub/main/Loader.lua"))()
end)
local Player = Window:NewTab("Player", 2795572800)
local PlayerSection = Player:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes how fast you walk", 500, 1, function(v)
	game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = v
end)
PlayerSection:NewSlider("Jumppower", "Changes how high you jump", 500, 1, function(v)
	game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = v
end)
PlayerSection:NewSlider("Gravity", "Changes gravity", 500, 1, function(v)
	game:GetService("Workspace").Gravity = v
end)
PlayerSection:NewSlider("FOV", "Changes Field Of View", 120, 1, function(v)
	game:GetService("Workspace"):WaitForChild("Camera").FieldOfView = v
end)
PlayerSection:NewButton("Unlock Third Person", "unlocks on most games", function()
	game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 99999
	game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.Classic
end)
PlayerSection:NewSlider("Max Camera Zoom", "Changes zoom distance of camera", 99999, 1, function(v)
	game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = v
end)
PlayerSection:NewButton("Anti Lag/Low GFX", "makes you less laggy and helps boost fps/performance", function()
		local Terrain = game:GetService("Workspace"):FindFirstChildOfClass('Terrain')
		Lighting = game:GetService("Lighting")
		Terrain.WaterWaveSize = 0
		Terrain.WaterWaveSpeed = 0
		Terrain.WaterReflectance = 0
		Terrain.WaterTransparency = 0
		Lighting.GlobalShadows = false
		Lighting.FogEnd = 9e9
		for i,v in pairs(game:GetDescendants()) do
			if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
				v.Material = "Plastic"
				v.Reflectance = 0
			elseif v:IsA("Decal") then
				v.Transparency = 1
			elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
				v.Lifetime = NumberRange.new(0)
			elseif v:IsA("Explosion") then
				v.BlastPressure = 1
				v.BlastRadius = 1
			end
		end
		for i,v in pairs(Lighting:GetDescendants()) do
			if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
				v.Enabled = false
			end
		end
		game:GetService("Workspace").DescendantAdded:Connect(function(child)
			task.spawn(function()
				if child:IsA('ForceField') then
					game:GetService("RunService").Heartbeat:Wait()
					child:Destroy()
				elseif child:IsA('Sparkles') then
					game:GetService("RunService").Heartbeat:Wait()
					child:Destroy()
				elseif child:IsA('Smoke') or child:IsA('Fire') then
					game:GetService("RunService").Heartbeat:Wait()
					child:Destroy()
				end
			end)
		end)
	end)
PlayerSection:NewToggle("Anti-AFK", "so you cant disconnect after 20 minutes of idling", function(state)
	if state then
		ANTIAFK = game:GetService("Players").LocalPlayer.Idled:connect(function()
			game:FindService("VirtualUser"):Button2Down(Vector2.new(0, 0), game:GetService("Workspace").CurrentCamera.CFrame)
			task.wait(1)
			game:FindService("VirtualUser"):Button2Up(Vector2.new(0, 0), game:GetService("Workspace").CurrentCamera.CFrame)
		end)
		Library.Notify("WARNING", "Successfully Enabled Anti-AFK!", 5)
	else
		if ANTIAFK then
			ANTIAFK:Disconnect()
			wait();
			Library.Notify("WARNING", "Successfully Disabled Anti-AFK!", 5)
		end
	end
end)
PlayerSection:NewToggle("Loop Full Bright", "makes game bright so if its dark u can actually see", function(state)
	local aLighting = game:GetService("Lighting")
	local oldbrit = aLighting.Brightness
	local oldclocktime = aLighting.ClockTime
	local oldfogend = aLighting.FogEnd
	local oldglobshads = aLighting.GlobalShadows
	local oldoutdooramb = aLighting.OutdoorAmbient
	local Lighting = cloneref(game:GetService("Lighting"))
	if not state then
		brightLoop:Disconnect()
		Lighting.Brightness = oldbrit
		Lighting.ClockTime = oldclocktime
		Lighting.FogEnd = oldfogend
		Lighting.GlobalShadows = oldglobshads
		Lighting.OutdoorAmbient = oldoutdooramb
	end
	local function brightFunc()
		Lighting.Brightness = 2
		Lighting.ClockTime = 14
		Lighting.FogEnd = 100000
		Lighting.GlobalShadows = false
		Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
	end
	brightLoop = game:GetService("RunService").RenderStepped:Connect(brightFunc)
end)
if IsOnMobile or VREnabled then
	PlayerSection:NewButton("enable Shiftlock", "unlocks on most games", function()
		Library.Notify("Shift Lock Enabled", "Gui should pop up on your right", 5)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/mobileshiftlock.txt"))()
	end)
else
	PlayerSection:NewToggle("enable/disable shiftlock", "unlocks on most games", function(value)
		game:GetService("Players").LocalPlayer.DevEnableMouseLock = value
		if value then
			Library.Notify("Shift Lock Enabled", "Just press shift or enable it in roblox settings", 5)
		else
			Library.Notify("Shift Lock Disabled", "", 5)
		end
	end)
end
local Settingss = Window:NewTab("Settings", 11385220704)
local SettingssSection = Settingss:NewSection("Settings")
SettingssSection:NewDropdown("UI Toggle Bind", "Changes Toggle Bind for Sky Hub Default is Right Control ONLY ON PC", {
	"Right Control",
	"Left Control",
	"Left Alt",
	"Right Alt",
	"Insert",
	"End",
	"Del/Delete",
	"Left Shift",
	"Right Shift",
	"F1",
	"Q",
	"E",
	"R",
	"T",
	"Y",
	"U",
	"P",
	"Z",
	"X",
	"M",
	"V",
	"N",
	"."
}, function(currentoption)
	if currentoption == "Right Control" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.RightControl"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "Left Control" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.LeftControl"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "Left Alt" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.LeftAlt"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "Right Alt" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.RightAlt"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "Insert" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.Insert"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "End" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.End"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "Del/Delete" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.Delete"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "Left Shift" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.LeftShift"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "Right Shift" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.RightShift"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "F1" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.F1"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "Q" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.Q"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "E" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.E"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "R" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.R"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "T" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.T"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "Y" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.Y"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "U" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.U"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "P" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.P"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "Z" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.Z"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "X" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.X"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "M" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.M"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "V" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.V"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "N" then
		getgenv().SkyhubKeybind = "Enum.KeyCode.N"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	elseif currentoption == "." then
		getgenv().SkyhubKeybind = "Enum.KeyCode.Period"
		ui_bind = getgenv().SkyhubKeybind
		task.wait()
		if writefile then
			updatesaves()
			task.wait()
			loadsettings()
		else
			Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
		end
		if not IsOnMobile then
			Library.Notify("New Keybind: " .. tostring(getgenv().SkyhubKeybind), "Your new keybind to toggle the gui is: " .. tostring(getgenv().SkyhubKeybind), 5)
		end
	end
end)
SettingssSection:NewSlider("Blur/Opaque Intensitiy", "Changes blurryness", 1, 0, function(v)
	getgenv().BlurIntes = v
	opaque = getgenv().BlurIntes
	task.wait()
	if writefile then
		updatesaves()
		task.wait()
		loadsettings()
	else
		Library.Notify("DOG SHIT EXECUTOR", "Doesnt have file functions lol", 5)
	end
end)
SettingssSection:NewButton("Save Game", "Saves game MUST HAVE saveinstance()", function()
	local SSSSSS = ""
	if identifyexecutor then
		SSSSSS = select(1, identifyexecutor())
	end
	if SSSSSS == "Krampus" then
		saveplace({
			FileName = "SkyHubSavedGame",
			CopyToClipboard = true
		})
		return
	end
	if saveplace then
		saveplace({
			FileName = "SkyHubSavedGame"
		})
	end
	if saveinstance then
		saveinstance()
	else
		Library.Notify("Your executor doesnt have a saveinstance() function try Save Game 2", "", 10)
	end
end)
SettingssSection:NewButton("Save Game 2", "Saves game dont need saveinstance()", function()
	getgenv().saveinstance = nil
	loadstring(game:HttpGet("https://github.com/MuhXd/Roblox-mobile-script/blob/main/Arecus-X-Neo/Saveinstance.lua?raw=true"))();
end)
local Games = Window:NewTab("Games", 12689980465)
local GamesSection = Games:NewSection("Games")
	
local gamedata = loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/tpgames.lua"))()

for _, v in ipairs(gamedata) do
	GamesSection:NewButton(v.name, "Teleports you to game", function()
		queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt'))()")
		game:GetService("TeleportService"):Teleport(v.placeId, game:GetService("Players").LocalPlayer)
	end)
end
