-- l18
print("reached obfuscated version")
print("sending webhook...")
warn("webhook missing")
print("webhook done")
print("waiting until game is loaded")
repeat task.wait() until game:IsLoaded()
print("game loaded (according to rbx)")
print("double execution check")
if getgenv().executed then
    print("double execution check failed")
    return
end
print("double execution check passed")
print("identify executor/setup getgenvs")


getgenv().Version = "v26.1.3.1" or "unspecified ver"


local name
pcall(function()
	name = identifyexecutor()
end)

getgenv().injectorActive = name or "unknown injector"

getgenv().build = getgenv().build or "unspecified build"
getgenv().wlutest = true

print("getgenvs done.. setup main/ui")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")
getgenv().AUTHORIZED = false




local function MAIN()
local function uiOne()
repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

Window = Library:CreateWindow({
    Title = 'petal.lua | ' .. getgenv().build .. ' | ' .. getgenv().Version ..'| ' .. getgenv().injectorActive,
    Center = true,
    AutoShow = true,
    TabPadding = 2,
    MenuFadeTime = 0.2
})

Tabs = {
    Luas = Window:AddTab('lua'),
    Visual = Window:AddTab('visual'),
    Combat = Window:AddTab('combat'),
    Misc = Window:AddTab('misc'),
    Player = Window:AddTab('player'),
    ['UI Settings'] = Window:AddTab('ui settings'),
    pList = Window:AddTab('game'),
}

local bypass = Tabs.Luas:AddLeftGroupbox('PRIMARY')
bypass:AddToggle('anti_cheat_bypass', {
    Text = 'anticheat bypass',
    Default = true,
    Tooltip = 'only supports good exes | disables the local charactercontroller script, allowing faster local values like walkspeed, gravity, jumpheight, etc',
    Callback = function(state)
        if not state then return end

        pcall(function()
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end

            local localplayer = game.Players.LocalPlayer
            local workspace = game:GetService('Workspace')

            local function gethumanoid()
                local hum = localplayer.Character and localplayer.Character:FindFirstChild('Humanoid')
                if not hum then
                    localplayer.CharacterAdded:Wait()
                    hum = localplayer.Character:WaitForChild('Humanoid')
                end
                return hum
            end

            local humanoid = gethumanoid()

            local connections = {
                {'CharacterController', humanoid:GetPropertyChangedSignal('WalkSpeed')},
                {'CharacterController', humanoid:GetPropertyChangedSignal('JumpHeight')},
                {'CharacterController', humanoid:GetPropertyChangedSignal('HipHeight')},
                {'CharacterController', workspace:GetPropertyChangedSignal('Gravity')},
                {'CharacterController', humanoid.StateChanged},
                {'CharacterController', humanoid.ChildAdded},
                {'CharacterController', humanoid.ChildRemoved},
            }

            local function disableconnections()
                for _, arr in ipairs(connections) do
                    for _, conn in ipairs(getconnections(arr[2])) do
                        if type(conn.Function) == 'function' then
                            local info = debug.getinfo(conn.Function)
                            if info and string.find(info.source, arr[1]) then
                                conn:Disable()
                            end
                        end
                    end
                end
            end

            disableconnections()

            localplayer.CharacterAdded:Connect(function(character)
                humanoid = character:WaitForChild('Humanoid')
                disableconnections()
            end)
        end)
    end
})

Toggles.anti_cheat_bypass:SetValue(true)


local pList = Tabs.pList
local StatusGroup = pList:AddRightGroupbox('status')

local Bosses = {
    whisper = "special",
    anton = "human",
    dozer = "human",
    btr80 = "vehicle",
    mi24v = "vehicle"
}

local Labels = {}

for name, kind in pairs(Bosses) do
    Labels[name] = {}
    table.insert(Labels[name], StatusGroup:AddLabel(name))
    if kind == "human" then
        table.insert(Labels[name], StatusGroup:AddLabel("hp: 0 / 0"))
    elseif kind == "special" then
        table.insert(Labels[name], StatusGroup:AddLabel("passes left: 0 / 0"))
        table.insert(Labels[name], StatusGroup:AddLabel("humanoid hp: 0 / 0"))
        table.insert(Labels[name], StatusGroup:AddLabel("health: 0%"))
    elseif kind == "vehicle" then
        if name == "mi24v" then
            table.insert(Labels[name], StatusGroup:AddLabel("pilot hp: 0 / 0"))
            table.insert(Labels[name], StatusGroup:AddLabel("main hp: 0 / 0"))
        else
            table.insert(Labels[name], StatusGroup:AddLabel("main hp: 0 / 0"))
        end
    end
    table.insert(Labels[name], StatusGroup:AddLabel(" "))
end

local function FindNPC(target, root)
    root = root or workspace.AiZones
    for _, obj in pairs(root:GetChildren()) do
        if obj:IsA("Model") and obj.Name:lower() == target then
            return obj
        end
        if not obj:IsA("Model") then
            local found = FindNPC(target, obj)
            if found then return found end
        end
    end
end

task.spawn(function()
    local rs = game:GetService("RunService")
    while true do
        rs.RenderStepped:Wait()
        for name, kind in pairs(Bosses) do
            local npc = FindNPC(name)
            local l = Labels[name]

            if not npc then
                for i = 2, #l - 1 do
                    l[i]:SetText("not spawned")
                end
                continue
            end

            if kind == "human" then
                local hum = npc:FindFirstChildOfClass("Humanoid")
                if hum then
                    l[2]:SetText("hp: " .. math.floor(hum.Health) .. " / " .. math.floor(hum.MaxHealth))
                end
            elseif kind == "special" then
                local hum = npc:FindFirstChildOfClass("Humanoid")
                if hum then
                    local dodge = hum:GetAttribute("DodgeStamina") or 0
                    local maxDodge = hum:GetAttribute("MaxDodgeStamina") or 0
                    l[2]:SetText("passes left: " .. dodge .. " / " .. maxDodge)
                    l[3]:SetText("humanoid hp: " .. math.floor(hum.Health) .. " / " .. math.floor(hum.MaxHealth))
                    l[4]:SetText("health: " .. math.floor(dodge * 100) .. "%")
                end
            elseif kind == "vehicle" then
                if name == "mi24v" then
                    local pilot = npc:FindFirstChild("Pilots") and npc.Pilots:FindFirstChild("CollisionPilot")
                    local chassis = npc:FindFirstChild("Chassis")
                    local ph = pilot and pilot:GetAttribute("Health") or 0
                    local pm = pilot and pilot:GetAttribute("MaxHealth") or 0
                    local mh = chassis and chassis:GetAttribute("Health") or 0
                    local mm = chassis and chassis:GetAttribute("MaxHealth") or 0
                    l[2]:SetText("pilot hp: " .. ph .. " / " .. pm)
                    l[3]:SetText("main hp: " .. mh .. " / " .. mm)
                else
                    local chassis = npc:FindFirstChild("Chassis")
                    local h = chassis and chassis:GetAttribute("Health") or 0
                    local m = chassis and chassis:GetAttribute("MaxHealth") or 0
                    l[2]:SetText("main hp: " .. h .. " / " .. m)
                end
            end
        end
    end
end)


local TargetBox = Tabs['UI Settings']:AddLeftGroupbox('misc')

TargetBox:AddToggle('targetinfo_enabled', { Text = 'target info', Default = false })
TargetBox:AddToggle('targetinfo_name', { Text = 'username', Default = true })
TargetBox:AddToggle('targetinfo_visible', { Text = 'visible status', Default = true })
TargetBox:AddToggle('targetinfo_moving', { Text = 'moving/still', Default = true })
TargetBox:AddToggle('targetinfo_hp', { Text = 'hp %', Default = true })
TargetBox:AddToggle('targetinfo_holding', { Text = 'holding', Default = true })
TargetBox:AddToggle('targetinfo_distance', { Text = 'distance', Default = true })

TargetBox:AddSlider('targetinfo_size', {
    Text = 'size',
    Default = 15,
    Min = 10,
    Max = 30,
    Rounding = 0
})

TargetBox:AddSlider('targetinfo_yoffset', {
    Text = 'y offset',
    Default = 0,
    Min = -300,
    Max = 300,
    Rounding = 0
})

TargetBox:AddLabel('Bind'):AddKeyPicker('targetinfo_bind', {
    Default = 'None',
    Mode = 'Toggle',
    Text = 'target info '
})

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('petal')
SaveManager:SetFolder('petal/ProjectDelta')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- server list \/\/\//\\ owo :3333

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

if not pList then
    warn("Tabs.pList is nil!")
    return
end

Section = pList:AddRightGroupbox('chatspam')

local TextChatService = game:GetService("TextChatService")
local Channel = TextChatService.TextChannels.RBXGeneral

local Messages = {
    "skill issue",
    "(◣_◢)",
    "wheres ur frames buddy?",
    "wahhh wahhhhhh wahhhhhhhhhhhh",
    "crying",
    "ez",
    "oops",
    "petal owns you",
    "link - eBBt2NjhtU",
    "no petal?",
    "no petal no life",
    "is that lirp 🥀",
    "💀",
    "go back to fortnite",
}

local SelectedMessages = {}
local SendAmount = 1
local SendDelay = 0

Section:AddDropdown("GoofyMessages", {
	Values = Messages,
	Multi = true,
	Text = "messages",
	Default = {},
	Callback = function(v)
		SelectedMessages = v
	end
})

Section:AddSlider("GoofyAmount", {
	Text = "amount",
	Min = 1,
	Max = 30,
	Default = 1,
	Rounding = 0,
	Callback = function(v)
		SendAmount = v
	end
})

Section:AddSlider("GoofyDelay", {
	Text = "delay",
	Min = 0,
	Max = 0.5,
	Default = 0,
	Rounding = 2,
	Callback = function(v)
		SendDelay = v
	end
})

Section:AddButton({
	Text = "send",
	Func = function()
		if not next(SelectedMessages) then return end
		local pool = {}
		for msg in pairs(SelectedMessages) do
			table.insert(pool, msg)
		end
		for i = 1, math.min(SendAmount, 15) do
			Channel:SendAsync(pool[((i - 1) % #pool) + 1])
			if SendDelay > 0 then
				task.wait(SendDelay)
			end
		end
	end
})

local ConstantEnabled = false
local Interval = 1

Section:AddToggle("GoofyConstant", {
	Text = "constant",
	Default = false,
	Callback = function(v)
		ConstantEnabled = v
	end
})

Section:AddSlider("GoofyInterval", {
	Text = "interval",
	Min = 0.1,
	Max = 15,
	Default = 1,
	Rounding = 2,
	Callback = function(v)
		Interval = v
	end
})

task.spawn(function()
	while true do
		if ConstantEnabled and next(SelectedMessages) then
			local pool = {}
			for msg in pairs(SelectedMessages) do
				table.insert(pool, msg)
			end
			Channel:SendAsync(pool[math.random(#pool)])
			task.wait(Interval)
		else
			task.wait(0.1)
		end
	end
end)

local delchat = Section:AddButton({
    Text = 'delete chat',
    Func = function()
        local Players = game:GetService("Players")
        local chat = Players.LocalPlayer.PlayerGui.ChatV3
        chat:Destroy()
    end,
    DoubleClick = true,
    Tooltip = 'cannot be undone until you rejoin. just deletes chat'
})


-- idgaf about reusing variable names anymore 



local section = pList:AddRightGroupbox('executor')

section:AddInput('exec_input', {
    Text = 'code',
    Placeholder = 'lua here',
    Finished = false
})

section:AddLabel('output')
local outputLabel = section:AddLabel('', true)

section:AddButton({
    Text = 'execute',
    Func = function()
        outputLabel:SetText('')
        local src = Options.exec_input.Value
        if src == '' then
            outputLabel:SetText('no code')
            return
        end

        local fn, err = loadstring(src)
        if not fn then
            outputLabel:SetText(err)
            return
        end

        local ok, res = pcall(fn)
        if not ok then
            outputLabel:SetText(res)
            return
        end

        if res ~= nil then
            outputLabel:SetText(tostring(res))
        else
            outputLabel:SetText('ok')
        end
    end
})




local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local pList = Tabs.pList
if not pList then return end

PlayerGroup = pList:AddLeftGroupbox("Players")
local playerLabels = {} -- [player] = {empty, username, hp, reports, holding, connections}

local function setLabel(label, text)
    if label and label.SetText then
        label:SetText(text)
    elseif label then
        label.Text = text
    end
end

local function createPlayerLabels(player)
    if playerLabels[player] then return end
    local labels = {}
    labels.empty = PlayerGroup:AddLabel("")
    labels.username = PlayerGroup:AddLabel(player.Name)
    labels.hp = PlayerGroup:AddLabel("out of range")
    labels.reports = PlayerGroup:AddLabel("out of range")
    labels.holding = PlayerGroup:AddLabel("out of range")
    labels.connections = {}
    playerLabels[player] = labels
end

local function updateStats(player)
    local labels = playerLabels[player]
    if not labels then return end

    local char = Workspace:FindFirstChild(player.Name)
    local humanoid = char and char:FindFirstChild("Humanoid")

    local hpText = "0%"
    if humanoid and humanoid.MaxHealth > 0 then
        hpText = tostring(math.floor(humanoid.Health / humanoid.MaxHealth * 100)) .. "%"
    end
    setLabel(labels.hp, hpText:lower())

    local reportsText = "no reports!"
    local statsFolder = ReplicatedStorage:FindFirstChild("Players")
    local stats = statsFolder and statsFolder:FindFirstChild(player.Name)
    if stats then
        local uac = stats:FindFirstChild("Status") and stats.Status:FindFirstChild("UAC")
        local reportsFolder = uac and uac:FindFirstChild("Reports")
        if reportsFolder then
            local count = 0
            for _, _ in pairs(reportsFolder:GetAttributes()) do count += 1 end
            reportsText = count > 0 and (count .. " report/s") or "no reports!"
        end
    end
    setLabel(labels.reports, reportsText:lower())


    local holdingText = "holding none"
    if char then
        local holding = char:FindFirstChild("Holding")
        if holding and holding:IsA("ObjectValue") and holding.Value then
            holdingText = "holding " .. holding.Value.Name:lower()
        end
    end
    setLabel(labels.holding, holdingText)
end

local function setupPlayer(player)
    createPlayerLabels(player)

    local function onChar(char)
        updateStats(player)
        local humanoid = char:FindFirstChild("Humanoid")
        local holding = char:FindFirstChild("Holding")

        if humanoid then
            if playerLabels[player].connections.hp then playerLabels[player].connections.hp:Disconnect() end
            playerLabels[player].connections.hp = humanoid.HealthChanged:Connect(function()
                updateStats(player)
            end)
        end

        if holding then
            if playerLabels[player].connections.holding then playerLabels[player].connections.holding:Disconnect() end
            playerLabels[player].connections.holding = holding:GetPropertyChangedSignal("Value"):Connect(function()
                updateStats(player)
            end)
        end
    end

    if player.Character then onChar(player.Character) end
    player.CharacterAdded:Connect(onChar)
end

for _, player in ipairs(Players:GetPlayers()) do
    setupPlayer(player)
end

Players.PlayerAdded:Connect(setupPlayer)

Players.PlayerRemoving:Connect(function(player)
    local labels = playerLabels[player]
    if labels then
        for _, conn in pairs(labels.connections) do
            if conn then conn:Disconnect() end
        end
        for _, label in pairs(labels) do
            if typeof(label) ~= "table" then
                pcall(function() label:Remove() end)
            end
        end
        playerLabels[player] = nil
    end
end)
getgenv().LSC = "mainpd().luaf"
lsc = Tabs.Luas:AddLeftGroupbox('lua selector menu')


lsc:AddDropdown('LuasSelector', {
    Values = { "mainpd().luaf", "debug" },
    Default = 1,
    Multi = false,
    Text = 'lua',
    Tooltip = 'switch luas\nmainpd().luaf - the main pd script\ndebug - attempt to switch to debug version if there is one',

    Callback = function(Value)
        getgenv().LSC = Value
    end
})
lsc:AddButton({
    Text = 'refresh luas',
    Tooltip = 'httpget / unfinished',
    Func = function()
        Library:Notify("sent http to refresh luas list")
    end
})
lsc:AddButton({
    Text = 'init luas',
    Tooltip = 'init selected',
    Func = function()
        if getgenv().LSC == "mainpd().luaf" then
            Library:Notify("failed init | error: attempt to initialise already active lua")
        else
            Library:Notify("sent http to grab and init debug lua.")
            task.wait(0.2)
            local t0 = tick()
            while tick() - t0 < 2 do
            end
        end
    end
})


credits = Tabs.Luas:AddLeftGroupbox('credits')
credits:AddLabel('fusion (xyz_f.) // developer')
credits:AddDivider()
credits:AddLabel('roadtohell // beta tester')
credits:AddLabel('Rii // beta tester')

info = Tabs.Luas:AddRightGroupbox('info')
info:AddLabel('PETAL.LUA')
info:AddDivider()
info:AddLabel('petal.lua is a free script')
info:AddLabel('designed for project delta.')
info:AddLabel('it supports most executors')
info:AddLabel('and is made for legit/hvh.')
info:AddLabel('')
info:AddLabel('join for key updates:')
info:AddButton({
    Text = 'copy discord link',
    Tooltip = 'https://discord.gg/TwMPDruS7T // copies discord link to clipboard',
    Func = function()
        setclipboard("https://discord.gg/TwMPDruS7T")
        Library:Notify("https://discord.gg/TwMPDruS7T set to clipboard")
    end
})
info:AddButton({
    Text = 'copy username',
    Tooltip = 'xyz.f_ // copies the owners username to clipboard',
    Func = function()
        setclipboard("xyz.f_")
        Library:Notify("xyz.f_ set to clipboard")
    end
})

local opti = Tabs.Luas:AddLeftGroupbox('optimization')

local removed = {
    textures = {},
    decals = {},
    surfaces = {},
    particles = {},
    lighting = {}
}

opti:AddToggle('remove_textures', {
    Text = 'textures',
    Default = false,
    Tooltip = 'deletes all texture instances'
})

opti:AddToggle('remove_decals', {
    Text = 'decals',
    Default = false,
    Tooltip = 'deletes all decals'
})

opti:AddToggle('remove_surfaces', {
    Text = 'surface appearances',
    Default = false,
    Tooltip = 'deletes surfaceappearance objects'
})

opti:AddToggle('remove_particles', {
    Text = 'particles',
    Default = false,
    Tooltip = 'deletes particle emitters and trails'
})

opti:AddToggle('remove_lighting', {
    Text = 'lighting',
    Default = false,
    Tooltip = 'disables shadows and post effects'
})

opti:AddButton({
    Text = 'apply',
    Tooltip = 'deletes selected objects',
    Func = function()
        if Toggles.remove_textures.Value then
            for _,v in ipairs(workspace:GetDescendants()) do
                if v:IsA('Texture') then
                    table.insert(removed.textures, {v, v.Parent})
                    v.Parent = nil
                end
            end
        end

        if Toggles.remove_decals.Value then
            for _,v in ipairs(workspace:GetDescendants()) do
                if v:IsA('Decal') then
                    table.insert(removed.decals, {v, v.Parent})
                    v.Parent = nil
                end
            end
        end

        if Toggles.remove_surfaces.Value then
            for _,v in ipairs(workspace:GetDescendants()) do
                if v:IsA('SurfaceAppearance') then
                    table.insert(removed.surfaces, {v, v.Parent})
                    v.Parent = nil
                end
            end
        end

        if Toggles.remove_particles.Value then
            for _,v in ipairs(workspace:GetDescendants()) do
                if v:IsA('ParticleEmitter') or v:IsA('Trail') then
                    table.insert(removed.particles, {v, v.Parent})
                    v.Parent = nil
                end
            end
        end

if Toggles.remove_lighting.Value then
    local lighting = game:GetService('Lighting')

    removed.lighting = {
        GlobalShadows = lighting.GlobalShadows,
        FogStart = lighting.FogStart,
        FogEnd = lighting.FogEnd,
        Brightness = lighting.Brightness,
        EnvironmentDiffuseScale = lighting.EnvironmentDiffuseScale,
        EnvironmentSpecularScale = lighting.EnvironmentSpecularScale,
        Technology = lighting.Technology,
        Effects = {}
    }

    lighting.GlobalShadows = false
    lighting.FogStart = 0
    lighting.FogEnd = 9e9
    lighting.Brightness = 1
    lighting.EnvironmentDiffuseScale = 0
    lighting.EnvironmentSpecularScale = 0
    lighting.Technology = Enum.Technology.Compatibility

    for _, v in ipairs(lighting:GetChildren()) do
        if v:IsA('PostEffect') and v.Name ~= "NVGColorCorrection" then
            table.insert(removed.lighting.Effects, v)
            v.Parent = nil
        end
    end
end

    end
})

opti:AddButton({
    Text = 'attempt restore',
    Tooltip = 'tries to put deleted objects back',
    Func = function()
        for _,t in pairs(removed) do
            if type(t) == 'table' then
                for _,entry in ipairs(t) do
                    if typeof(entry) == 'table' and entry[1] and entry[2] then
                        entry[1].Parent = entry[2]
                    end
                end
            end
        end

        if removed.lighting.GlobalShadows ~= nil then
    local lighting = game:GetService('Lighting')

    lighting.GlobalShadows = removed.lighting.GlobalShadows
    lighting.FogStart = removed.lighting.FogStart
    lighting.FogEnd = removed.lighting.FogEnd
    lighting.Brightness = removed.lighting.Brightness
    lighting.EnvironmentDiffuseScale = removed.lighting.EnvironmentDiffuseScale
    lighting.EnvironmentSpecularScale = removed.lighting.EnvironmentSpecularScale
    lighting.Technology = removed.lighting.Technology

    for _,v in ipairs(removed.lighting.Effects) do
        v.Parent = lighting
    end
end
    end
})


end
local function uiEsp()


VisualPlayerGroup = Tabs.Visual:AddLeftGroupbox('Player')
VisualPlayerGroup:AddToggle('ESPNameToggle', {
    Text = 'nametag',
    Tooltip = 'uses drawing api to create nametags above players heads',
    Default = getgenv().PlayerESP_Name or false,
    Callback = function(value)
        getgenv().PlayerESP_Name = value
    end
})
VisualPlayerGroup:AddToggle('ChamsEnabledToggle', {
    Text = 'chams',
    Tooltip = 'uses boxhandleadornments/highlights to create a ’highlight’ effect on players. rendered in the 3d space',
    Default = getgenv().Chams_Enabled or false,
    Callback = function(value)
        getgenv().Chams_Enabled = value
    end
})
VisualPlayerGroup:AddToggle('SkeletonESP_Toggle', {
    Text = 'skeleton',
    Default = false,
    Tooltip = 'draws r15 skeletons'
})

-- skel logic



local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local SkeletonESP_State = false
local SkeletonESP_Color = Color3.fromRGB(255,255,255)

local MAX_PLAYERS = 5
local MAX_DISTANCE = 1000
local MAX_DISTANCE_SQ = MAX_DISTANCE * MAX_DISTANCE

local SkeletonR15 = {
    {"Head","UpperTorso"},{"UpperTorso","LowerTorso"},
    {"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},
    {"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"},
    {"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},
    {"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},
}

local Active = {}
local Cache = {}

local function newLine()
    local l = Drawing.new("Line")
    l.Thickness = 1.5
    l.Visible = false
    return l
end

local function destroy(player)
    local bones = Cache[player]
    if not bones then return end
    for i = 1, #bones do
        bones[i][3]:Remove()
    end
    Cache[player] = nil
end

local function build(player)
    local char = player.Character
    if not char then return end

    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum or hum.RigType ~= Enum.HumanoidRigType.R15 or hum.Health <= 0 then return end

    local bones = {}
    for i = 1, #SkeletonR15 do
        local a = char:FindFirstChild(SkeletonR15[i][1])
        local b = char:FindFirstChild(SkeletonR15[i][2])
        if a and b then
            bones[#bones+1] = {a,b,newLine()}
        end
    end

    Cache[player] = bones
end

local function getHumanoid(player)
    local c = player.Character
    return c and c:FindFirstChildOfClass("Humanoid")
end

Players.PlayerRemoving:Connect(destroy)

RunService.RenderStepped:Connect(function()
    if not SkeletonESP_State then
        for i = 1, #Active do
            local bones = Cache[Active[i]]
            if bones then
                for j = 1, #bones do
                    bones[j][3].Visible = false
                end
            end
        end
        return
    end

    for i = 1, #Active do
        local player = Active[i]
        local hum = getHumanoid(player)

        if not hum or hum.Health <= 0 then
            destroy(player)
            continue
        end

        local bones = Cache[player]
        if bones then
            local root = bones[1][1].Parent:FindFirstChild("HumanoidRootPart")
            if root then
                local _, onScreen = Camera:WorldToViewportPoint(root.Position)
                if not onScreen then
                    for j = 1, #bones do
                        bones[j][3].Visible = false
                    end
                else
                    for j = 1, #bones do
                        local a,b,l = bones[j][1],bones[j][2],bones[j][3]
                        local pa,oa = Camera:WorldToViewportPoint(a.Position)
                        local pb,ob = Camera:WorldToViewportPoint(b.Position)
                        l.From = Vector2.new(pa.X,pa.Y)
                        l.To = Vector2.new(pb.X,pb.Y)
                        l.Color = SkeletonESP_Color
                        l.Visible = oa and ob
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.25)

        if not SkeletonESP_State then continue end

        local lc = LocalPlayer.Character
        local lr = lc and lc:FindFirstChild("HumanoidRootPart")
        if not lr then continue end

        local list = {}
        for _,p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                local c = p.Character
                local r = c and c:FindFirstChild("HumanoidRootPart")
                local h = getHumanoid(p)
                if r and h and h.Health > 0 then
                    local d = (r.Position - lr.Position).Magnitude
                    if d*d <= MAX_DISTANCE_SQ then
                        list[#list+1] = {p,d}
                    end
                end
            end
        end

        table.sort(list,function(a,b) return a[2] < b[2] end)

        for i = MAX_PLAYERS+1, #list do
            destroy(list[i][1])
        end

        table.clear(Active)
        for i = 1, math.min(MAX_PLAYERS,#list) do
            local p = list[i][1]
            Active[i] = p
            if not Cache[p] then
                build(p)
            end
        end
    end
end)











-- no more skel logic

VisualPlayerGroup:AddToggle('ESPHPTextToggle', {
    Text = 'hp text',
    Tooltip = 'creates a 2d text using the drawing api next to the players hp bar displaying their humanoids hp',
    Default = getgenv().PlayerESP_HPText or false,
    Callback = function(value)
        getgenv().PlayerESP_HPText = value
    end
})
VisualPlayerGroup:AddToggle('ESPHPBarToggle', {
    Text = 'hp bar',
    Tooltip = 'renders a 2d shape using the drawing api displaying their hp.',
    Default = getgenv().PlayerESP_HPBar or false,
    Callback = function(value)
        getgenv().PlayerESP_HPBar = value
    end
})
VisualPlayerGroup:AddToggle('ESPBoxToggle', {
    Text = 'box',
    Tooltip = 'uses drawing api to use 4 lines to create a box around players',
    Default = getgenv().PlayerESP_Box or false,
    Callback = function(value)
        getgenv().PlayerESP_Box = value
    end
})
VisualPlayerGroup:AddToggle('ESPDistToggle', {
    Text = 'distance',
    Tooltip = 'shows distance under the box w drawing API)',
    Default = getgenv().PlayerESP_Distance or false,
    Callback = function(value)
        getgenv().PlayerESP_Distance = value
    end
})

VisualPlayerGroup:AddToggle('ESPWepToggle', {
    Text = 'equipped weapon',
    Tooltip = 'shows weapon under the distance w drawing API)',
    Default = getgenv().PlayerESP_Weapon or false,
    Callback = function(value)
        getgenv().PlayerESP_Weapon = value
    end
})

VisualPlayerGroup:AddToggle('ESPPlrArrows', {
    Text = 'offscreen arrows',
    Tooltip = 'shows offscreen players with arrows',
    Default = getgenv().Player_Arrows or false,
    Callback = function(value)
        getgenv().Player_Arrows = value
    end
})

local env = getgenv()
env.flagsSelected = env.flagsSelected or {}

local flagOptions = { "moderator", "visible", "target" }

VisualPlayerGroup:AddDropdown('FlagsDropdown', {
    Values = flagOptions,
    Multi = true,
    Default = env.flagsSelected,
    Text = "flags",
    Tooltip = "which flags to show",

    Callback = function(selected)
        local newFlags = {}
        for flag, enabled in pairs(selected) do
            if enabled then
                table.insert(newFlags, flag)
            end
        end
        env.flagsSelected = newFlags
    end
})

Options.FlagsDropdown:OnChanged(function()
    local newFlags = {}
    for flag, enabled in pairs(Options.FlagsDropdown.Value) do
        if enabled then table.insert(newFlags, flag) end
    end
    env.flagsSelected = newFlags
end)



local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

getgenv().PlayerESP_Color = getgenv().PlayerESP_Color or Color3.new(1,1,1)
getgenv().PlayerESP_GlowIntensity = getgenv().PlayerESP_GlowIntensity or 0

local GlowChams_Enabled = false
local GlowChams_OriginalParts = {}
local GlowChams_OriginalSurfaceAppearances = {}

local function saveGlowChamsOriginal(part)
    if not GlowChams_OriginalParts[part] and part:IsA("BasePart") then
        GlowChams_OriginalParts[part] = {Material = part.Material, Color = part.Color, Transparency = part.Transparency}
    end
    for _, child in ipairs(part:GetDescendants()) do
        if child:IsA("SurfaceAppearance") and not GlowChams_OriginalSurfaceAppearances[child] then
            GlowChams_OriginalSurfaceAppearances[child] = child.Parent
        end
    end
end

local function applyGlowChams(part)
    if part == nil then return end
    if part:IsA("BasePart") then
        saveGlowChamsOriginal(part)
        for _, child in ipairs(part:GetDescendants()) do
            if child:IsA("SurfaceAppearance") and child.Parent then
                GlowChams_OriginalSurfaceAppearances[child] = child.Parent
                child.Parent = nil
            end
        end
        local success, _ = pcall(function()
            part.Material = Enum.Material.Neon
            part.Color = getgenv().PlayerESP_Color
            part.Transparency = getgenv().PlayerESP_GlowIntensity
        end)
        if not success then
            part.Transparency = 1
        end
    elseif part:IsA("Decal") or part:IsA("Texture") then
        part.Transparency = 1
    end
end

local function restoreGlowChams(part)
    if part == nil then return end
    local props = GlowChams_OriginalParts[part]
    if props and part:IsA("BasePart") then
        part.Material = props.Material
        part.Color = props.Color
        part.Transparency = props.Transparency
    end
    for sa, parent in pairs(GlowChams_OriginalSurfaceAppearances) do
        if sa and parent and not sa.Parent then
            sa.Parent = parent
        end
    end
end

local function handleGlowChamsCharacter(char)
    if char == LocalPlayer.Character then return end
    for _, desc in ipairs(char:GetDescendants()) do
        if GlowChams_Enabled then
            applyGlowChams(desc)
        end
    end
    char.DescendantAdded:Connect(function(d)
        if GlowChams_Enabled then
            applyGlowChams(d)
        end
    end)
end

local function handleGlowChamsPlayer(player)
    if player == LocalPlayer then return end
    if player.Character then
        handleGlowChamsCharacter(player.Character)
    end
    player.CharacterAdded:Connect(handleGlowChamsCharacter)
end

for _, player in ipairs(Players:GetPlayers()) do
    handleGlowChamsPlayer(player)
    if GlowChams_Enabled and player.Character then
        for _, desc in ipairs(player.Character:GetDescendants()) do
            applyGlowChams(desc)
        end
    end
end
Players.PlayerAdded:Connect(handleGlowChamsPlayer)

VisualPlayerGroup:AddToggle('GlowChamsToggle', {
    Text = 'glowchams',
    Default = false,
    Callback = function(value)
        GlowChams_Enabled = value
        for part,_ in pairs(GlowChams_OriginalParts) do
            if GlowChams_Enabled then
                applyGlowChams(part)
            else
                restoreGlowChams(part)
            end
        end
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                for _, desc in ipairs(player.Character:GetDescendants()) do
                    if GlowChams_Enabled then
                        applyGlowChams(desc)
                    else
                        restoreGlowChams(desc)
                    end
                end
            end
        end
    end
})

Toggles.GlowChamsToggle:OnChanged(function()
    GlowChams_Enabled = Toggles.GlowChamsToggle.Value
    for part,_ in pairs(GlowChams_OriginalParts) do
        if GlowChams_Enabled then
            applyGlowChams(part)
        else
            restoreGlowChams(part)
        end
    end
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            for _, desc in ipairs(player.Character:GetDescendants()) do
                if GlowChams_Enabled then
                    applyGlowChams(desc)
                else
                    restoreGlowChams(desc)
                end
            end
        end
    end
end)

VisualPlayerGroup:AddSlider('GlowChamsIntensity', {
    Text = 'glow intensity',
    Default = getgenv().PlayerESP_GlowIntensity,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Callback = function(value)
        getgenv().PlayerESP_GlowIntensity = value
        if GlowChams_Enabled then
            for part,_ in pairs(GlowChams_OriginalParts) do
                if part:IsA("BasePart") then
                    part.Transparency = value
                    part.Color = getgenv().PlayerESP_Color
                end
            end
        end
    end
})

task.spawn(function()
    while task.wait(0.5) do
        if GlowChams_Enabled then
            for part,_ in pairs(GlowChams_OriginalParts) do
                if part:IsA("BasePart") then
                    part.Color = getgenv().PlayerESP_Color
                end
            end
        end
    end
end)


local Players = game:GetService("Players")

local modsList = {
    "solter","kupczakk","nutsock112","thecrafter103","forkycheck",
    "necanwx","kbhgaming480","lumivoxi","natan_113","ianeyeballs",
    "imblu1","gribler1","e2equl","hhauoli","farlan9",
    "zondering","strawberry_banana0","exp_l0","raechevel00","yuckey47",
    "shawnybear6","deadlymagicaz","jannu2010","duhacek1112","sparky_deeny",
    "aidendenkule13","hakaji","c7asher","dominik7772","atlas_thegamer",
    "accldentshappen",
}

local modsSet = {}
for _, name in ipairs(modsList) do
    modsSet[name:lower()] = true
end

local notified = {}

if not Options then Options = {} end

Options.ModNotify = VisualPlayerGroup:AddToggle('ModNotify', {
    Text = 'mod detector',
    Tooltip = 'any mods usernames will be detected, with notifications on join/leave',
    Default = false,
    Callback = function(Value)
        if Value and Library and Library.Notify then
            for _, player in ipairs(Players:GetPlayers()) do
                local lowerName = player.Name:lower()
                if modsSet[lowerName] and not notified[lowerName] then
                    Library:Notify(player.Name .. " - moderator joined", 25)
                    notified[lowerName] = true
                end
            end
        end
    end
})

Players.PlayerAdded:Connect(function(player)
    if not (Options and Options.ModNotify and Options.ModNotify.Value) then return end
    if not (Library and Library.Notify) then return end
    local lowerName = player.Name:lower()
    if modsSet[lowerName] and not notified[lowerName] then
        Library:Notify(player.Name .. " - moderator joined", 25)
        notified[lowerName] = true
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if not (Options and Options.ModNotify and Options.ModNotify.Value) then return end
    if not (Library and Library.Notify) then return end
    local lowerName = player.Name:lower()
    if modsSet[lowerName] then
        Library:Notify(player.Name .. " - moderator left", 25)
        notified[lowerName] = nil
    end
end)

task.spawn(function()
    while true do
        if Options and Options.ModNotify and Options.ModNotify.Value and Library and Library.Notify then
            local currentPlayers = {}
            for _, player in ipairs(Players:GetPlayers()) do
                local lowerName = player.Name:lower()
                currentPlayers[lowerName] = true
                if modsSet[lowerName] and not notified[lowerName] then
                    Library:Notify(player.Name .. " - moderator joined", 25)
                    notified[lowerName] = true
                end
            end
            for modName in pairs(notified) do
                if not currentPlayers[modName] then
                    Library:Notify(modName .. " - moderator left", 25)
                    notified[modName] = nil
                end
            end
        end
        task.wait(5)
    end
end)


VisualPlayerGroup:AddDivider()

VisualPlayerGroup:AddButton({
    Text = 'mod check',
    Tooltip = 'checks the server for mods',
    Func = function()
        local Players = game:GetService("Players")
        local modsList = {
            "solter",
            "kupczakk",
            "LibertadWar",
            "nutsock112",
            "thecrafter103",
            "forkycheck",
            "necanwx",
            "kbhgaming480",
            "lumivoxi",
            "natan_113",
            "ianeyeballs",
            "imblu1",
            "gribler1",
            "e2equl",
            "hhauoli",
            "farlan9",
            "zondering",
            "strawberry_banana0",
            "exp_l0",
            "raechevel00",
            "yuckey47",
            "shawnybear6",
            "deadlymagicaz",
            "jannu2010",
            "duhacek1112",
            "sparky_deeny",
            "aidendenkule13",
            "hakaji",
            "c7asher",
            "dominik7772",
            "atlas_thegamer",
            "accldentshappen",
        }

        local modsSet = {}
        for _, name in ipairs(modsList) do
            modsSet[name:lower()] = true
        end

        local foundMod = false
        for _, player in ipairs(Players:GetPlayers()) do
            if modsSet[player.Name:lower()] then
                Library:Notify(player.Name .. " - moderator is in server", 7)
                foundMod = true
            end
        end

        if not foundMod then
            Library:Notify("no mod/s in server", 7)
        end
    end
})

VisualPlayerGroup:AddDivider()

VisualPlayerGroup:AddSlider('NameTextSize', {
    Text = 'name text size',
    Default = 13,
    Min = 8,
    Max = 24,
    Rounding = 0,
})

Options.NameTextSize:OnChanged(function()
    getgenv().PlayerESP_NameSize = Options.NameTextSize.Value
end)

VisualPlayerGroup:AddSlider('DistanceTextSize', {
    Text = 'distance text size',
    Default = 13,
    Min = 8,
    Max = 24,
    Rounding = 0,
})

Options.DistanceTextSize:OnChanged(function()
    getgenv().PlayerESP_DistanceSize = Options.DistanceTextSize.Value
end)

VisualPlayerGroup:AddSlider('WeaponTextSize', {
    Text = 'weapon text size',
    Default = 13,
    Min = 8,
    Max = 24,
    Rounding = 0,
})

Options.WeaponTextSize:OnChanged(function()
    getgenv().PlayerESP_WeaponSize = Options.WeaponTextSize.Value
end)

VisualPlayerGroup:AddSlider('HPBarSize', {
    Text = 'hp bar width',
    Default = '3',
    Min = 1,
    Max = 5,
    Rounding = 0,
})
Options.HPBarSize:OnChanged(function()
    getgenv().PlayerESP_HPWidth = Options.HPBarSize.Value
end)

VisualPlayerGroup:AddSlider('ESPFont', {
    Text = 'font',
    Default = 3,
    Min = 0,
    Max = 3,
    Rounding = 0,
})

Options.ESPFont:OnChanged(function()
    getgenv().PlayerESP_Font = Options.ESPFont.Value
end)

VisualPlayerGroup:AddSlider("ChamsFillTransparency", {
    Text = "cham fill transparency",
    Min = -20,
    Max = 20,
    Default = getgenv().Chams_Transparency or 0.5,
    Rounding = 2,
    Callback = function(value)
        getgenv().Chams_Transparency = value
    end
})

VisualPlayerGroup:AddSlider("ChamsOutlineTransparency", {
    Text = 'cham outline transparency',
    Min = -20,
    Max = 20,
    Default = getgenv().Chams_OutlineTransparency or 0,
    Rounding = 2,
    Callback = function(value)
        getgenv().Chams_OutlineTransparency = value
    end
})


VisualPlayerGroup:AddLabel('primary color'):AddColorPicker('PlayerESPBoxColor', {
    Default = Color3.new(1,1,1),
    Title = 'nametags and hp text',
    Callback = function(value) getgenv().PlayerESP_Color = value end
})

VisualPlayerGroup:AddLabel('skeleton color'):AddColorPicker('SkeletonESP_Color', {
    Default = Color3.fromRGB(255, 255, 255)
})

Toggles.SkeletonESP_Toggle:OnChanged(function()
    SkeletonESP_State = Toggles.SkeletonESP_Toggle.Value
end)

Options.SkeletonESP_Color:OnChanged(function()
    SkeletonESP_Color = Options.SkeletonESP_Color.Value
end)



VisualPlayerGroup:AddLabel('stroke color'):AddColorPicker('PlayerESPStrokeColor', {
    Default = getgenv().PlayerESP_StrokeColor or Color3.new(0,0,0),
    Title = 'box & hp bar stroke',
    Callback = function(value) getgenv().PlayerESP_StrokeColor = value end
})

VisualPlayerGroup:AddLabel('hp color'):AddColorPicker('PlayerESPHPColor', {
    Default = getgenv().PlayerESP_HPColor or Color3.new(0,1,0),
    Title = 'hp bar coloring',
    Callback = function(value) getgenv().PlayerESP_HPColor = value end
})

VisualPlayerGroup
:AddLabel("cham outline color")
:AddColorPicker("ChamsOutlineColor", {
    Default = getgenv().Chams_OutlineColor or Color3.new(0,0,0),
    Callback = function(color)
        getgenv().Chams_OutlineColor = color
    end
})

VisualPlayerGroup
:AddLabel("cham fill color")
:AddColorPicker("ChamsFillColor", {
    Default = getgenv().Chams_Color or Color3.new(1,1,1),
    Callback = function(color)
        getgenv().Chams_Color = color
    end
})

VisualPlayerGroup:AddDivider()

VisualPlayerGroup:AddDropdown('ChamsTypeDropdown', {
    Values = { "Box", "Highlight" },
    Default = 1,
    Multi = false,
    Text = 'cham type',
    Tooltip = 'switch between BoxHandleAdornment and Highlight cham styling, boxhandleadornments show through walls and are less precise, while Highlights dont show through walls but tend to be more buggy.',

    Callback = function(Value)
        getgenv().Chams_Type = Value
    end
})

Options.ChamsTypeDropdown:OnChanged(function()
    local value = Options.ChamsTypeDropdown.Value
    getgenv().Chams_Type = value
end)

VisualNPCGroup = Tabs.Visual:AddRightGroupbox('NPC')
getgenv().AI_ESP_Enabled = true

VisualNPCGroup:AddToggle('AiESPNameToggle', {
    Text = 'nametag',
    Tooltip = 'uses drawing api to create nametags above AI heads',
    Default = getgenv().AI_ESP_Name or false,
    Callback = function(value)
        getgenv().AI_ESP_Name = value
    end
})

VisualNPCGroup:AddToggle('AiESPHPTextToggle', {
    Text = 'hp text',
    Tooltip = 'creates a 2d text using the drawing api next to the AI hp bar displaying their humanoids hp',
    Default = getgenv().AI_ESP_HPText or false,
    Callback = function(value)
        getgenv().AI_ESP_HPText = value
    end
})

VisualNPCGroup:AddToggle('AiESPHPBarToggle', {
    Text = 'hp bar',
    Tooltip = 'renders a 2d shape using the drawing api displaying their hp.',
    Default = getgenv().AI_ESP_HPBar or false,
    Callback = function(value)
        getgenv().AI_ESP_HPBar = value
    end
})

VisualNPCGroup:AddToggle('AiESPBoxToggle', {
    Text = 'box',
    Tooltip = 'uses drawing api to use 4 lines to create a box around AI',
    Default = getgenv().AI_ESP_Box or false,
    Callback = function(value)
        getgenv().AI_ESP_Box = value
    end
})

VisualNPCGroup:AddToggle('AiESPDistToggle', {
    Text = 'distance',
    Tooltip = 'shows distance under the box w drawing API',
    Default = getgenv().AI_ESP_Distance or false,
    Callback = function(value)
        getgenv().AI_ESP_Distance = value
    end
})


VisualNPCGroup:AddToggle('AiChamsEnabledToggle', {
    Text = 'chams',
    Tooltip = 'highlights NPCs in 3D using BoxHandleAdornments or Highlight instances',
    Default = getgenv().AiChams_Enabled or false,
    Callback = function(value)
        getgenv().AiChams_Enabled = value
    end
})


VisualNPCGroup:AddDivider()

VisualNPCGroup:AddLabel('cham color'):AddColorPicker('AiChamsColorPicker', {
    Default = getgenv().AiChams_Color or Color3.new(1,1,1),
    Title = "cham color",
    Callback = function(value)
        getgenv().AiChams_Color = value
    end
})
VisualNPCGroup:AddLabel('primary color'):AddColorPicker('AIESPBoxColor', {
    Default = getgenv().AI_ESP_Color or Color3.new(1,1,1),
    Title = 'nametags and hp text',
    Callback = function(value) getgenv().AI_ESP_Color = value end
})

VisualNPCGroup:AddLabel('outline color'):AddColorPicker('AIESPStrokeColor', {
    Default = getgenv().AI_ESP_StrokeColor or Color3.new(0,0,0),
    Title = 'box & hp bar stroke',
    Callback = function(value) getgenv().AI_ESP_StrokeColor = value end
})

VisualNPCGroup:AddLabel('hp color'):AddColorPicker('AIESPHPColor', {
    Default = getgenv().AI_ESP_HPColor or Color3.new(0,1,0),
    Title = 'hp bar coloring',
    Callback = function(value) getgenv().AI_ESP_HPColor = value end
})


VisualNPCGroup:AddDivider()

VisualNPCGroup:AddSlider('AiChamsTransparencySlider', {
    Text = 'cham transparency',
    Default = getgenv().AiChams_Transparency or 0.2,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Callback = function(value)
        getgenv().AiChams_Transparency = value
    end
})

VisualNPCGroup:AddDropdown('AiChamsTypeDropdown', {
    Values = { "Box", "Highlight" },
    Default = 1,
    Multi = false,
    Text = 'Cham Type',
    Tooltip = 'Choose between BoxHandleAdornment (shows through walls, less precise) or Highlight (more accurate but are occluded (dont show through walls))',
    Callback = function(value)
        getgenv().AiChams_Type = value
    end
})

VisualHazardGroup = Tabs.Visual:AddRightGroupbox('Hazard')

VisualHazardGroup:AddToggle('mineESPb', {
    Text = 'mines',
    Tooltip = 'highlights landmines and their explosion radius',
    Default = getgenv().MineESPEnabled,
    Callback = function(Value) 
        getgenv().MineESPEnabled = Value
    end
})

VisualHazardGroup:AddToggle('GrenadeESPtoggle', {
    Text = 'grenade',
    Tooltip = 'uses highlights and billboardgui to show grenades on esp',
    Default = getgenv().GrenadeESPEnabled or false,
    Callback = function(Value)
        getgenv().GrenadeESPEnabled = Value
    end
})

local midnight = Tabs.Visual:AddLeftGroupbox('csgo chams')

local OriginalAppearance = {}

local function saveOriginalAppearance(player)
    local char = player.Character
    if not char then return end
    OriginalAppearance[player] = {}
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            OriginalAppearance[player][part] = {
                Material = part.Material,
                Color = part.Color,
                SurfaceAppearance = part:FindFirstChildOfClass("SurfaceAppearance")
            }
            if part:FindFirstChildOfClass("SurfaceAppearance") then
                part:FindFirstChildOfClass("SurfaceAppearance"):Destroy()
            end
        end
    end
end

local function applyMaterialAndColor(player, mat, col)
    local char = player.Character
    if not char then return end
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            if part:FindFirstChildOfClass("SurfaceAppearance") then
                part:FindFirstChildOfClass("SurfaceAppearance"):Destroy()
            end
            part.Material = mat
            part.Color = col
        end
    end
end

local function restoreAppearance(player)
    local char = player.Character
    if not char then return end
    local data = OriginalAppearance[player]
    if not data then return end
    for part, info in pairs(data) do
        if part and part.Parent then
            part.Material = info.Material
            part.Color = info.Color
            if info.SurfaceAppearance then
                info.SurfaceAppearance:Clone().Parent = part
            end
        end
    end
    OriginalAppearance[player] = nil
end

local Materials = { "ForceField", "Neon", "SmoothPlastic", "CrackedLava" }
local SelectedMaterial = Enum.Material.ForceField
local SelectedColor = Color3.new(1, 1, 1)
local MidnightEnabled = false

midnight:AddToggle("MidnightActive", {
    Text = "active",
    Default = false,
    Callback = function(val)
        MidnightEnabled = val
        if val then
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    saveOriginalAppearance(player)
                    applyMaterialAndColor(player, SelectedMaterial, SelectedColor)
                end
            end
        else
            for player, _ in pairs(OriginalAppearance) do
                restoreAppearance(player)
            end
        end
    end
})

midnight:AddDropdown("MidnightMaterial", {
    Values = Materials,
    Default = 1,
    Multi = false,
    Text = "type",
    Callback = function(val)
        SelectedMaterial = Enum.Material[val]
        if MidnightEnabled then
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    applyMaterialAndColor(player, SelectedMaterial, SelectedColor)
                end
            end
        end
    end
})

midnight:AddLabel("color"):AddColorPicker("MidnightColorPicker", {
    Default = Color3.new(1, 1, 1),
    Callback = function(val)
        SelectedColor = val
        if MidnightEnabled then
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    applyMaterialAndColor(player, SelectedMaterial, SelectedColor)
                end
            end
        end
    end
})

game:GetService("Players").PlayerAdded:Connect(function(player)
    if MidnightEnabled and player ~= game.Players.LocalPlayer then
        player.CharacterAdded:Connect(function()
            saveOriginalAppearance(player)
            applyMaterialAndColor(player, SelectedMaterial, SelectedColor)
        end)
    end
end)

for _, player in pairs(game:GetService("Players"):GetPlayers()) do
    if player ~= game.Players.LocalPlayer then
        player.CharacterAdded:Connect(function()
            if MidnightEnabled then
                saveOriginalAppearance(player)
                applyMaterialAndColor(player, SelectedMaterial, SelectedColor)
            else
                restoreAppearance(player)
            end
        end)
    end
end


render = Tabs.Visual:AddLeftGroupbox('Render')
render:AddButton({
    Text = "spawn dummy",
    Func = function()
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Workspace = game:GetService("Workspace")

        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local rootPart = character:WaitForChild("HumanoidRootPart")

        local templateAI = ReplicatedStorage:WaitForChild("AiPresets"):WaitForChild("TemplateAI")

        local aiZones = Workspace:FindFirstChild("AiZones")
        if not aiZones then
            aiZones = Instance.new("Folder")
            aiZones.Name = "AiZones"
            aiZones.Parent = Workspace
        end

        local tempAI = aiZones:FindFirstChild("tempai")
        if not tempAI then
            tempAI = Instance.new("Folder")
            tempAI.Name = "tempai"
            tempAI.Parent = aiZones
        end

        local clone = templateAI:Clone()
        clone.Parent = tempAI

        if clone.PrimaryPart then
            clone:SetPrimaryPartCFrame(rootPart.CFrame * CFrame.new(0, 0, -10))
        else
            warn("primarypart error")
        end
    end,
    DoubleClick = false,
    Tooltip = "spawns an ai template into tempai"
})

end

local function uiEspTwo()
VisualOtherGroup = Tabs.Visual:AddRightGroupbox('Other')



local Players = game:GetService('Players')
local Workspace = game:GetService('Workspace')
local RunService = game:GetService('RunService')
getgenv().CorpseESP = false
getgenv().CorpseESP_Color = Color3.new(1, 0, 0)
getgenv().CorpseESP_Transparency = 0
getgenv().CorpseESP_TextSize = 10
getgenv().PlayerESP_Font = getgenv().PlayerESP_Font or 1

local Corpses = {}
local Drawings = {}
local Connections = {}

VisualOtherGroup:AddToggle('CorpseESP', {
    Text = 'corpse esp',
    Default = false
})

VisualOtherGroup:AddSlider('CorpseESPSize', {
    Text = 'corpse size',
    Default = 10,
    Min = 8,
    Max = 16,
    Rounding = 0
})

VisualOtherGroup:AddLabel('color'):AddColorPicker('CorpseESPColor', {
    Default = Color3.new(1, 0, 0),
    Transparency = 0
})

Toggles.CorpseESP:OnChanged(function()
    getgenv().CorpseESP = Toggles.CorpseESP.Value

    if getgenv().CorpseESP then
        ScanExistingCorpses()
    else
        for _, v in pairs(Corpses) do
            for _, a in pairs(v.Adorns) do
                a:Destroy()
            end
        end
        for _, d in pairs(Drawings) do
            d:Remove()
        end
        table.clear(Corpses)
        table.clear(Drawings)
    end
end)


Options.CorpseESPSize:OnChanged(function()
    getgenv().CorpseESP_TextSize = Options.CorpseESPSize.Value
end)

Options.CorpseESPColor:OnChanged(function()
    getgenv().CorpseESP_Color = Options.CorpseESPColor.Value
    getgenv().CorpseESP_Transparency = Options.CorpseESPColor.Transparency
end)

local function ScanExistingCorpses()
    for _, child in ipairs(Dropped:GetChildren()) do
        if child:IsA('Model') and IsPlayerName(child.Name) then
            if not Corpses[child] then
                if child.PrimaryPart then
                    CreateCorpse(child)
                end
            end
        end
    end
end

local function IsPlayerName(name)
    return Players:FindFirstChild(name) ~= nil
end

local function CreateCorpse(model)
    local data = { Adorns = {} }

    for _, part in pairs(model:GetChildren()) do
        if part:IsA('BasePart') then
            local box = Instance.new('BoxHandleAdornment')
            box.Adornee = part
            box.Size = part.Size
            box.AlwaysOnTop = true
            box.ZIndex = 1
            box.Color3 = getgenv().CorpseESP_Color
            box.Transparency = getgenv().CorpseESP_Transparency
            box.Parent = part
            table.insert(data.Adorns, box)
        end
    end

    local text = Drawing.new('Text')
    text.Center = true
    text.Outline = true
    text.Font = getgenv().PlayerESP_Font
    Drawings[model] = text
    Corpses[model] = data
end

local function RemoveCorpse(model)
    if Corpses[model] then
        for _, a in pairs(Corpses[model].Adorns) do
            a:Destroy()
        end
        Corpses[model] = nil
    end
    if Drawings[model] then
        Drawings[model]:Remove()
        Drawings[model] = nil
    end
end

local Dropped = Workspace:WaitForChild('DroppedItems')

Connections.ChildAdded = Dropped.ChildAdded:Connect(function(child)
    if not getgenv().CorpseESP then return end
    if child:IsA('Model') and IsPlayerName(child.Name) then
        task.wait()
        if child.PrimaryPart then
            CreateCorpse(child)
        end
    end
end)

Connections.ChildRemoved = Dropped.ChildRemoved:Connect(RemoveCorpse)

Connections.Render = RunService.RenderStepped:Connect(function()
    if not getgenv().CorpseESP then return end

    local cam = Workspace.CurrentCamera
    local camPos = cam.CFrame.Position

    for model, text in pairs(Drawings) do
        local pp = model.PrimaryPart
        if pp then
            local pos, onscreen = cam:WorldToViewportPoint(pp.Position)
            if onscreen then
                local studs = (pp.Position - camPos).Magnitude
                local meters = math.floor(studs * 0.333)

                text.Visible = true
                text.Size = getgenv().CorpseESP_TextSize
                text.Position = Vector2.new(pos.X, pos.Y)
                text.Text = model.Name .. ' [' .. meters .. 'm]'
                text.Color = getgenv().CorpseESP_Color
                text.Transparency = 1 - getgenv().CorpseESP_Transparency
            else
                text.Visible = false
            end
        else
            text.Visible = false
        end
    end
end)




local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local DroppedESP_Enabled = false
local DroppedESP_Objects = {}
local MAX_DISTANCE = 300
local MAX_DISTANCE_SQ = MAX_DISTANCE * MAX_DISTANCE

local function getPart(obj)
	if obj:IsA("BasePart") then
		return obj
	end
	if obj:IsA("Model") then
		return obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
	end
end

local function clearESP()
	for _, v in pairs(DroppedESP_Objects) do
		if v.Box then v.Box:Destroy() end
		if v.Text then v.Text:Remove() end
	end
	table.clear(DroppedESP_Objects)
end

local function createESP(obj)
	local part = getPart(obj)
	if not part then return end

	local box = Instance.new("BoxHandleAdornment")
	box.Adornee = part
	box.AlwaysOnTop = true
	box.ZIndex = 5
	box.Size = part.Size
	box.Color3 = Color3.fromRGB(255, 255, 255)
	box.Transparency = 0.6
	box.Parent = part

	local text = Drawing.new("Text")
	text.Size = 11
	text.Center = true
	text.Outline = true
	text.Color = Color3.fromRGB(255, 255, 255)
	text.Visible = false
	text.Text = obj.Name

	DroppedESP_Objects[obj] = {
		Part = part,
		Box = box,
		Text = text
	}
end

local function refreshESP()
	clearESP()
	for _, obj in ipairs(workspace.DroppedItems:GetChildren()) do
		createESP(obj)
	end
end

RunService.RenderStepped:Connect(function()
	if not DroppedESP_Enabled then return end
	if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end

	local rootPos = LocalPlayer.Character.HumanoidRootPart.Position

	for obj, data in pairs(DroppedESP_Objects) do
		if not obj.Parent or not data.Part then
			if data.Text then data.Text:Remove() end
			if data.Box then data.Box:Destroy() end
			DroppedESP_Objects[obj] = nil
		else
			local distSq = (data.Part.Position - rootPos).Magnitude ^ 2

			if distSq <= MAX_DISTANCE_SQ then
				data.Box.Visible = true

				local pos, onscreen = Camera:WorldToViewportPoint(data.Part.Position)
				if onscreen then
					data.Text.Position = Vector2.new(pos.X, pos.Y - 12)
					data.Text.Visible = true
				else
					data.Text.Visible = false
				end
			else
				data.Box.Visible = false
				data.Text.Visible = false
			end
		end
	end
end)


workspace.DroppedItems.ChildAdded:Connect(function(obj)
	if DroppedESP_Enabled then
		task.wait()
		createESP(obj)
	end
end)

workspace.DroppedItems.ChildRemoved:Connect(function()
	if DroppedESP_Enabled then
		task.wait()
		refreshESP()
	end
end)


VisualOtherGroup:AddToggle('DroppedItemESP', {
	Text = 'dropped items',
	Default = false,
	Tooltip = 'Toggles dropped item ESP'
})

Toggles.DroppedItemESP:OnChanged(function()
	DroppedESP_Enabled = Toggles.DroppedItemESP.Value

	if DroppedESP_Enabled then
		refreshESP()
	else
		clearESP()
	end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local ContainersESP_Enabled = false
local ContainersESP_Objects = {}
local CONTAINER_MAX_DISTANCE = 1000
local CONTAINER_MAX_DISTANCE_SQ = CONTAINER_MAX_DISTANCE * CONTAINER_MAX_DISTANCE

local function getPart(obj)
	if obj:IsA("BasePart") then
		return obj
	end
	if obj:IsA("Model") then
		return obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
	end
end

local function clearContainersESP()
	for _, v in pairs(ContainersESP_Objects) do
		if v.Box then v.Box:Destroy() end
		if v.Text then v.Text:Remove() end
	end
	table.clear(ContainersESP_Objects)
end

local function containerAllowed(name)
	local whitelist = Options.ContainerWhitelist.Value
	if not whitelist then return false end
	return whitelist[name] == true
end

local function createContainerESP(obj)
	if not containerAllowed(obj.Name) then return end

	local part = getPart(obj)
	if not part then return end

	local box = Instance.new("BoxHandleAdornment")
	box.Adornee = part
	box.AlwaysOnTop = true
	box.ZIndex = 5
	box.Size = part.Size
	box.Color3 = Color3.fromRGB(255, 255, 255)
	box.Transparency = 0.6
	box.Visible = false
	box.Parent = part

	local text = Drawing.new("Text")
	text.Size = 11
	text.Center = true
	text.Outline = true
	text.Color = Color3.fromRGB(255, 255, 255)
	text.Visible = false
	text.Text = obj.Name

	ContainersESP_Objects[obj] = {
		Part = part,
		Box = box,
		Text = text
	}
end

local function refreshContainersESP()
	clearContainersESP()
	for _, obj in ipairs(workspace.Containers:GetChildren()) do
		createContainerESP(obj)
	end
end

RunService.RenderStepped:Connect(function()
	if not ContainersESP_Enabled then return end
	if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end

	local rootPos = LocalPlayer.Character.HumanoidRootPart.Position

	for obj, data in pairs(ContainersESP_Objects) do
		if not obj.Parent or not data.Part then
			if data.Text then data.Text:Remove() end
			if data.Box then data.Box:Destroy() end
			ContainersESP_Objects[obj] = nil
		else
			local distSq = (data.Part.Position - rootPos).Magnitude ^ 2

			if distSq <= CONTAINER_MAX_DISTANCE_SQ then
				data.Box.Visible = true

				local pos, onscreen = Camera:WorldToViewportPoint(data.Part.Position)
				if onscreen then
					data.Text.Position = Vector2.new(pos.X, pos.Y - 12)
					data.Text.Visible = true
				else
					data.Text.Visible = false
				end
			else
				data.Box.Visible = false
				data.Text.Visible = false
			end
		end
	end
end)

workspace.Containers.ChildAdded:Connect(function(obj)
	if ContainersESP_Enabled then
		task.wait()
		createContainerESP(obj)
	end
end)

workspace.Containers.ChildRemoved:Connect(function()
	if ContainersESP_Enabled then
		task.wait()
		refreshContainersESP()
	end
end)

VisualOtherGroup:AddToggle('ContainersESP', {
	Text = 'containers',
	Default = false,
	Tooltip = 'Shows selected containers within 1000 studs (roughly 300-400m)'
})

VisualOtherGroup:AddDropdown('ContainerWhitelist', {
	Values = {
		'CashRegister',
		'FilingCabinet',
		'Fridge',
		'GrenadeCrate',
		'HiddenCache',
		'KGBBag',
		'LargeAbpopaBox',
		'LargeMilitaryBox',
		'LargeShippingCrate',
		'MedBag',
		'MilitaryCrate',
		'ModificationStation',
		'PC',
		'Safe',
		'SatchelBag',
		'SerumContainer',
		'SmallMilitaryBox',
		'SmallShippingCrate',
		'SportBag',
		'SupplyDropEDF',
		'SupplyDropEDF_Default',
		'SupplyDropEDF_XMAS',
		'SupplyDropMilitary',
		'SupplyDropMilitary_Default',
		'SupplyDropMilitary_XMAS'
	},
	Multi = true,
    Default = 'None',
	Text = 'container whitelist',
	Tooltip = 'Choose which containers get ESP'
})

Toggles.ContainersESP:OnChanged(function()
	ContainersESP_Enabled = Toggles.ContainersESP.Value
	if ContainersESP_Enabled then
		refreshContainersESP()
	else
		clearContainersESP()
	end
end)

Options.ContainerWhitelist:OnChanged(function()
	if ContainersESP_Enabled then
		refreshContainersESP()
	end
end)


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local ExitFolder = workspace:WaitForChild("NoCollision"):WaitForChild("ExitLocations")

local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "__extesp"
ESPFolder.Parent = workspace

local LoopRunning = false

local function getDistance(part)
    local char = LocalPlayer.Character
    if not char then return 0 end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return 0 end
    return (hrp.Position - part.Position).Magnitude
end

local function createESP(part)
    local color = getgenv().PlayerESP_Color or Color3.fromRGB(255,255,255)

    local box = Instance.new("BoxHandleAdornment")
    box.Name = "ExtractBox"
    box.Adornee = part
    box.Size = part.Size
    box.AlwaysOnTop = true
    box.ZIndex = 5
    box.Transparency = 0.67
    box.Color3 = color
    box.Parent = ESPFolder

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ExtractBillboard"
    billboard.Adornee = part
    billboard.Size = UDim2.fromOffset(100, 25)
    billboard.StudsOffset = Vector3.new(0, part.Size.Y + 1.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = ESPFolder

    local text = Instance.new("TextLabel")
    text.Size = UDim2.fromScale(0.5, 0.5)
    text.BackgroundTransparency = 1
    text.TextScaled = true
    text.Font = Enum.Font.Code
    text.TextColor3 = color
    text.TextStrokeTransparency = 0
    text.Parent = billboard

    task.spawn(function()
        while LoopRunning and box.Parent do
            local meters = math.floor(getDistance(part) * 0.28)
            text.Text = ("extract / %dm"):format(meters)
            task.wait(0.25)
        end
    end)
end

VisualOtherGroup:AddToggle('ExtractESP', {
    Text = 'extract',
    Default = false,
})

Toggles.ExtractESP:OnChanged(function()
    if Toggles.ExtractESP.Value then
        LoopRunning = true
        task.spawn(function()
            while LoopRunning do
                for _, v in ipairs(ExitFolder:GetChildren()) do
                    if v:IsA("BasePart") then
                        local exists = false
                        for _, esp in ipairs(ESPFolder:GetChildren()) do
                            if esp.Adornee == v then
                                exists = true
                                break
                            end
                        end
                        if not exists then
                            createESP(v)
                        end
                    end
                end
                task.wait(5)
            end
        end)
    else
        LoopRunning = false
        ESPFolder:ClearAllChildren()
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local headEspEnabled = false
local espMap = {}

local IMAGE_OPTIONS = {
    ["tongue cat"] = "rbxassetid://84027059862600",
    ["fusions pfp"] = "rbxassetid://11176073563",
    ["unc"] = "rbxassetid://5600499503",
    ["solter"] = "rbxassetid://12295627014",
}

local CURRENT_IMAGE = next(IMAGE_OPTIONS) and IMAGE_OPTIONS[next(IMAGE_OPTIONS)] or "" 

local function createESP(character)
    if not headEspEnabled then return end
    if espMap[character] or character == localPlayer.Character then return end
    local head = character:FindFirstChild("Head")
    if not head then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "HeadESP"
    billboard.Adornee = head
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0,50,0,50)
    billboard.Parent = head

    local img = Instance.new("ImageLabel")
    img.Name = "HeadESPImage"
    img.Size = UDim2.new(1,0,1,0)
    img.BackgroundTransparency = 1
    img.Image = CURRENT_IMAGE
    img.Parent = billboard

    espMap[character] = {billboard = billboard, head = head, image = img}
end

local function removeESP(character)
    local data = espMap[character]
    if data then
        if data.billboard then pcall(function() data.billboard:Destroy() end) end
        espMap[character] = nil
    end
end

RunService.RenderStepped:Connect(function()
    if not headEspEnabled then return end
    for character, data in pairs(espMap) do
        if data.head and data.billboard and data.image then
            local dist = (Camera.CFrame.Position - data.head.Position).Magnitude
            data.billboard.Enabled = dist <= 116
            if dist <= 116 then
                local viewport = Camera.ViewportSize
                local fov = math.rad(Camera.FieldOfView)

                local baseScale = (data.head.Size.X / dist) * (viewport.Y / (2 * math.tan(fov/2)))
                
                local scaleMultiplier = 2 
                local finalScale = baseScale * scaleMultiplier
                
                data.billboard.Size = UDim2.new(0, finalScale, 0, finalScale)

                if CURRENT_IMAGE and CURRENT_IMAGE ~= "" then
                    pcall(function() data.image.Image = CURRENT_IMAGE end)
                end
            end
        end
    end
end)


Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        if headEspEnabled then createESP(char) end
    end)
end)
Players.PlayerRemoving:Connect(removeESP)

VisualOtherGroup:AddToggle('HeadESP', {
    Text = 'profile esp',
    Default = false,
    Callback = function(Value)
        headEspEnabled = Value
        if not Value then
            for char,_ in pairs(espMap) do removeESP(char) end
        else
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character then createESP(player.Character) end
            end
        end
    end
})

for name, id in pairs(IMAGE_OPTIONS) do
    VisualOtherGroup:AddButton({
        Text = name,
        Func = function()
            CURRENT_IMAGE = id
            for _, data in pairs(espMap) do
                if data.image and CURRENT_IMAGE and CURRENT_IMAGE ~= "" then
                    pcall(function() data.image.Image = CURRENT_IMAGE end)
                end
            end
        end,
        Tooltip = "switch the head esp image to " .. name
    })
end






end
local function uiCombat()






local silgroup = Tabs.Combat:AddRightGroupbox('Silent Aim')

silgroup:AddLabel('silent aim'):AddKeyPicker('LockKey', {
    Default = 'None',
    SyncToggleState = false,
    Mode = 'Hold',
    Text = 'silent aim',
    NoUI = false,
    ChangedCallback = function(key)
        if not key then return end
        getgenv().HoldKey = key
    end
})

silgroup:AddDropdown('TargetMode', {
    Values = { 'Distance', 'Mouse' },
    Default = getgenv().TargetMode or 'Distance',
    Tooltip = 'closest player vs closest to mouse',
    Multi = false,
    Text = 'targetting mode',
    Callback = function(value)
        getgenv().TargetMode = value
    end
})

silgroup:AddDropdown('LockMode', {
    Values = { 'Hold', 'Always' },
    Default = getgenv().LockMode or 'Hold',
    Multi = false,
    Tooltip = 'changes if holding enables or always on',
    Text = 'keybind mode',
    Callback = function(value)
        getgenv().LockMode = value
    end
})

getgenv().Hitchance = getgenv().Hitchance or 100
silgroup:AddToggle('HitchanceToggle', {
    Text = 'hitchance',
    Default = true,
    Callback = function(v) getgenv().HitchanceEnabled = v end
})
silgroup:AddSlider('HitchanceSlider', {
    Text = 'hitchance %',
    Default = getgenv().Hitchance,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Callback = function(v) getgenv().Hitchance = v end
})

getgenv().EstimationEnabled = getgenv().EstimationEnabled ~= false
silgroup:AddToggle('EstimationToggle', {
    Text = 'prediction',
    Default = getgenv().EstimationEnabled,
    Callback = function(v) getgenv().EstimationEnabled = v end
})

silgroup:AddToggle("HighlightTarget", {
    Text = "highlight target",
    Default = getgenv().HighlightTarget ~= false,
    Callback = function(val) getgenv().HighlightTarget = val end
})

silgroup:AddToggle("TargetTracer", {
    Text = "target tracer",
    Default = getgenv().TargetTracer ~= false,
    Callback = function(val) getgenv().TargetTracer = val end
})


local silgroup = Tabs.Combat:AddRightGroupbox('Advanced silent')
-- yes im redefining it idgaf


silgroup:AddDropdown('HitPart', {
    Values = { 'Head', 'HumanoidRootPart' },
    Default = getgenv().HitPart or 'Head',
    Text = 'hit part',
    Callback = function(value) getgenv().HitPart = value end
})

silgroup:AddToggle('FovVisible', {
    Text = 'show fov',
    Default = getgenv().FovVisible ~= false,
    Callback = function(v) getgenv().FovVisible = v end
})

silgroup:AddSlider('FovRadius', {
    Text = 'fov radius',
    Default = getgenv().FovRadius or 600,
    Min = 50,
    Max = 1000,
    Rounding = 0,
    Callback = function(v) getgenv().FovRadius = v end
})

silgroup:AddToggle("PerfectSilent", {
    Text = "perfect silent",
    Default = false,
    Tooltip = 'requires hookfunction, search your executor on weao. and no, xeno doesnt count😛',
    Callback = function(v)
        getgenv().PerfectSilent = v
        if v and not getgenv().PerfectSilentHooked then
            if not hookfunction or not Drawing then
                Library:Notify("unsupported dumbass", 5)
            end

            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local UIS = game:GetService("UserInputService")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local LocalPlayer = Players.LocalPlayer
            local Camera = workspace.CurrentCamera
            local AiZones = workspace:WaitForChild("AiZones")
            local ok, BulletModule = pcall(require, ReplicatedStorage.Modules.FPS.Bullet)
            if not ok then
                    Library:Notify("unsupported dumbass", 5)
            end

            local SilentAim = {
                Enabled = true,
                Prediction = true,
                HitPart = getgenv().HitPart or "Head",
                Fov = {
                    Visible = getgenv().FovVisible ~= false,
                    Radius = getgenv().FovRadius or 600
                }
            }

            local function Alive(plr)
                local c = plr.Character
                return c and c:FindFirstChild("Humanoid") and c.Humanoid.Health > 0
            end

            local function Visible(origin, target, ...)
                local ignore = {Camera, ...}
                if Alive(LocalPlayer) then
                    ignore[#ignore + 1] = LocalPlayer.Character
                end
                local hit = workspace:FindPartOnRayWithIgnoreList(Ray.new(origin, target.Position - origin), ignore)
                return hit and hit:IsDescendantOf(target.Parent)
            end

            local function GetAi()
                local t = {}
                for _,z in AiZones:GetChildren() do
                    for _,c in z:GetChildren() do
                        t[#t + 1] = c
                    end
                end
                return t
            end

            local function GetTarget(...)
                local closest, dist = nil, SilentAim.Fov.Radius
                for _,char in GetAi() do
                    local part = char:FindFirstChild(SilentAim.HitPart)
                    if part then
                        if not SilentAim.WallCheck or Visible(Camera.CFrame.Position, part, ...) then
                            local pos, onscreen = Camera:WorldToViewportPoint(part.Position)
                            if onscreen then
                                local d = (Vector2.new(pos.X,pos.Y) - Camera.ViewportSize/2).Magnitude
                                if d < dist then
                                    dist = d
                                    closest = part
                                end
                            end
                        end
                    end
                end
                for _,plr in Players:GetPlayers() do
                    if plr ~= LocalPlayer and Alive(plr) then
                        local part = plr.Character:FindFirstChild(SilentAim.HitPart)
                        if part then
                            if not SilentAim.WallCheck or Visible(Camera.CFrame.Position, part, ...) then
                                local pos, onscreen = Camera:WorldToViewportPoint(part.Position)
                                if onscreen then
                                    local d = (Vector2.new(pos.X,pos.Y) - Camera.ViewportSize/2).Magnitude
                                    if d < dist then
                                        dist = d
                                        closest = part
                                    end
                                end
                            end
                        end
                    end
                end
                return closest
            end

            local function Solve(A,B,C)
                local d = B*B - 4*A*C
                if d < 0 then return end
                local s = math.sqrt(d)
                return (-B - s)/(2*A), (-B + s)/(2*A)
            end

            local function Flight(dir, grav, speed)
                local r1,r2 = Solve(grav:Dot(grav)/4, grav:Dot(dir)-speed^2, dir:Dot(dir))
                if r1 and r2 then
                    local t = math.min(r1,r2)
                    if t > 0 then return math.sqrt(t) end
                end
                return 0
            end

            local function Predict(part, origin, speed, drop)
                local g = Vector3.yAxis * (drop * 2)
                local t = Flight(part.Position - origin, g, speed)
                return part.Position + part.Velocity * t
            end

            local function Drop(origin, target, speed, drop)
                local g = Vector3.yAxis * (drop * 2)
                local t = Flight(target - origin, g, speed)
                return 0.5 * g * t^2
            end

            local OldBullet
            OldBullet = hookfunction(BulletModule.CreateBullet, function(a,b,c,d,aim,e,ammo,tick,recoil)
                local target = GetTarget(a,b,c,aim)
                if target and SilentAim.Enabled and not checkcaller() then
                    local ammoObj = ReplicatedStorage.AmmoTypes:FindFirstChild(ammo)
                    if ammoObj then
                        ammoObj:SetAttribute("Drag", 0)
                        local speed = ammoObj:GetAttribute("MuzzleVelocity")
                        local drop = ammoObj:GetAttribute("ProjectileDrop")
                        local pos = SilentAim.Prediction and Predict(target, aim.Position, speed, drop) or target.Position
                        local vdrop = Drop(aim.Position, pos, speed, drop)
                        return OldBullet(a,b,c,d,{CFrame = CFrame.new(aim.Position, pos + vdrop)},e,ammo,tick,recoil)
                    end
                end
                return OldBullet(a,b,c,d,aim,e,ammo,tick,recoil)
            end)

            local Circle = Drawing.new("Circle")
            Circle.NumSides = 1000
            Circle.Thickness = 1
            Circle.Color = Color3.fromRGB(255,255,255)
            Circle.Filled = false

            RunService.Heartbeat:Connect(function()
                Circle.Visible = SilentAim.Enabled and SilentAim.Fov.Visible
                if Circle.Visible then
                    Circle.Position = UIS:GetMouseLocation()
                    Circle.Radius = SilentAim.Fov.Radius
                end
            end)

            getgenv().PerfectSilentHooked = true
        end
    end
})

auto = Tabs.Combat:AddRightGroupbox('autoshoot')
auto:AddToggle('autoshoot', { Text = 'autoshoot', Default = false })
auto:AddSlider('fov', { Text = 'fov radius', Default = 150, Min = 10, Max = 500, Rounding = 0 })
auto:AddSlider('delay', { Text = 'delay (s)', Default = 0.1, Min = 0, Max = 1, Rounding = 2 })
auto:AddToggle('showfov', { Text = 'show fov', Default = false })
auto:AddLabel('fov color'):AddColorPicker('fovColor', { Default = Color3.fromRGB(255,0,0), Transparency = 0.5 })

local PlayersService = game:GetService('Players')
local RS = game:GetService('RunService')
local Workspace = game:GetService('Workspace')
local cam = Workspace.CurrentCamera

local function inFOV(target, fov)
    local vec, onScreen = cam:WorldToViewportPoint(target.Position)
    if not onScreen then return false end
    local dist = ((Vector2.new(vec.X, vec.Y) - Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)).Magnitude)
    return dist <= fov
end

local function headVisible(player)
    local char = player.Character
    if not char or not char:FindFirstChild('Head') then return false end
    local head = char.Head
    local rayParams = RaycastParams.new()
    rayParams.FilterType = Enum.RaycastFilterType.Blacklist
    rayParams.FilterDescendantsInstances = {PlayersService.LocalPlayer.Character}
    local rayResult = Workspace:Raycast(cam.CFrame.Position, (head.Position - cam.CFrame.Position), rayParams)
    if rayResult then
        return rayResult.Instance == head
    end
    return true
end

local fovCircle = Drawing.new('Circle')
fovCircle.Thickness = 2
fovCircle.NumSides = 100
fovCircle.Radius = Options.fov.Value
fovCircle.Filled = false
fovCircle.Visible = Toggles.showfov.Value
fovCircle.Color = Options.fovColor.Value
fovCircle.Transparency = 0.5

Options.fov:OnChanged(function() fovCircle.Radius = Options.fov.Value end)
Options.fovColor:OnChanged(function() fovCircle.Color = Options.fovColor.Value end)

task.spawn(function()
    while RS.RenderStepped:Wait() do
        if Library.Unloaded then break end
        fovCircle.Visible = Toggles.showfov.Value
        fovCircle.Position = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
    end
end)

task.spawn(function()
    while RS.RenderStepped:Wait() do
        if Library.Unloaded then break end
        if not Toggles.autoshoot.Value then continue end

        for _, plr in pairs(PlayersService:GetPlayers()) do
            if plr ~= PlayersService.LocalPlayer and plr.Character and plr.Character:FindFirstChild('Head') then
                local head = plr.Character.Head
                if inFOV(head, Options.fov.Value) and headVisible(plr) then
                    mouse1press()
                    task.wait(Options.delay.Value)
                    mouse1release()
                    task.wait(Options.delay.Value)
                end
            end
        end
    end
end)

triggerb = Tabs.Combat:AddRightGroupbox('Triggerbot')
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

triggerb:AddToggle('TriggerEnabled', {
    Text = 'triggerbot',
    Default = false
})

triggerb:AddSlider('TriggerDelay', {
    Text = 'delay',
    Tooltip = 'the delay between when you see someone and when you shoot',
    Default = 0.1,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Suffix = 's'
})

triggerb:AddSlider('TriggerSpeed', {
    Text = 'click speed',
    Tooltip = 'how fast you shoot',
    Default = 0.05,
    Min = 0.01,
    Max = 0.5,
    Rounding = 2,
    Suffix = 's'
})

local lastShot = 0

local function validTarget(part)
    if not part then return false end
    local model = part:FindFirstAncestorOfClass("Model")
    if not model then return false end
    if model == LocalPlayer.Character then return false end
    local hum = model:FindFirstChildOfClass("Humanoid")
    return hum and hum.Health > 0
end

RunService.RenderStepped:Connect(function()
    if not Toggles.TriggerEnabled.Value then return end

    local now = tick()
    if now - lastShot < Options.TriggerSpeed.Value then return end

    local ray = Camera:ScreenPointToRay(Mouse.X, Mouse.Y)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = { LocalPlayer.Character }

    local result = workspace:Raycast(ray.Origin, ray.Direction * 1000, params)
    if not result then return end
    if not validTarget(result.Instance) then return end

    task.delay(Options.TriggerDelay.Value, function()
        if Toggles.TriggerEnabled.Value then
            mouse1press()
            task.wait()
            mouse1release()
            lastShot = tick()
        end
    end)
end)


CombatAimGroup = Tabs.Combat:AddLeftGroupbox('Aim')
getgenv().AIM_Enabled = false
getgenv().AIM_FOV = 150
getgenv().AIM_Smooth = 5
getgenv().AIM_TeamCheck = false
getgenv().AIM_WallCheck = true
getgenv().AIM_FOVColor = Color3.fromRGB(255,255,255)
getgenv().AIM_FOVOutline = Color3.fromRGB(0,0,0)
getgenv().AIM_TargetPart = "Head"
getgenv().AIM_KeyRaw = 'MB2'
getgenv().AIM_KeyMode = 'Hold'


local t_enabled = CombatAimGroup:AddToggle('Enabled', {Text = 'aimbot', Default = false})
t_enabled:OnChanged(function(v) getgenv().AIM_Enabled = v end)

CombatAimGroup:AddLabel('aimbot lock'):AddKeyPicker('AIMKey', {
    Default = 'None',
    Mode = 'Hold',
    Text = 'aimbot'
})

local t_team = CombatAimGroup:AddToggle('Team', {Text = 'team check', Default = false})
t_team:OnChanged(function(v) getgenv().teamCheckEnabled = v end)

t_team:OnChanged(function(v) getgenv().AIM_TeamCheck = v end)

local t_wall = CombatAimGroup:AddToggle('WallCheck', {Text = 'Wall Check', Default = true})
t_wall:OnChanged(function(v) getgenv().AIM_WallCheck = v end)

local s_fov = CombatAimGroup:AddSlider('FOV', {Text = 'FOV', Default = 150, Min = 20, Max = 500, Rounding = 0})
s_fov:OnChanged(function(v) getgenv().AIM_FOV = v end)

local s_smooth = CombatAimGroup:AddSlider('Smooth', {Text = 'Smoothing', Default = 5, Min = 1, Max = 50, Rounding = 0})
s_smooth:OnChanged(function(v) getgenv().AIM_Smooth = v end)

CombatAimGroup:AddLabel('FOV Color'):AddColorPicker('FOVColor', {Default = Color3.fromRGB(255,255,255), Transparency = 0})
Options.FOVColor:OnChanged(function(v) getgenv().AIM_FOVColor = v end)

CombatAimGroup:AddLabel('Outline Color'):AddColorPicker('OutColor', {Default = Color3.fromRGB(0,0,0), Transparency = 0})
Options.OutColor:OnChanged(function(v) getgenv().AIM_FOVOutline = v end)

CombatAimGroup:AddDropdown('TargetPart', {
    Values = {'Head','HumanoidRootPart','UpperTorso','LowerTorso'},
    Default = 1,
    Multi = false,
    Text = 'Target Part'
})
Options.TargetPart:OnChanged(function()
    getgenv().AIM_TargetPart = Options.TargetPart.Value
end)

Options.AIMKey:OnChanged(function()
    local raw = Options.AIMKey.Value
    local mode = Options.AIMKey.Mode or 'Hold'
    getgenv().AIM_KeyRaw = raw
    getgenv().AIM_KeyMode = mode
end)


CombatManipulationGroup = Tabs.Combat:AddLeftGroupbox('Gun Mods')

local RepStorage = game:GetService('ReplicatedStorage')
local RunSvc = game:GetService('RunService')

local Remotes = RepStorage:WaitForChild('Remotes')
local FireProjectile = Remotes:WaitForChild('FireProjectile')
local ProjectileInflict = Remotes:WaitForChild('ProjectileInflict')

local fast_bullet_enabled = false

local fast_bullet_toggle = CombatManipulationGroup:AddToggle('fast_bullet', {
    Text = 'fast bullet',
    Default = false,
    Tooltip = 'bad exes are not supported'
})

local RunSvc = game:GetService("RunService")
local RepStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local fast_bullet_enabled = false
if hookmetamethod and type(hookmetamethod) == "function" and FireProjectile and ProjectileInflict then
    local oldnamecall
    oldnamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = {...}

        if fast_bullet_enabled and self == FireProjectile and method == "InvokeServer" then
            local shot_id = args[2]
            local shot_time = args[3]
            task.spawn(function()
                pcall(function()
                    ProjectileInflict:InvokeServer(Vector3.new(0,0,0), shot_id, shot_time, 0)
                end)
            end)
        end

        return oldnamecall(self, ...)
    end)
end

if RunSvc.RenderStepped then
    RunSvc.RenderStepped:Connect(function()
        fast_bullet_enabled = fast_bullet_toggle and fast_bullet_toggle.Value or false
    end)
end

local no_sway_enabled = false
if CombatManipulationGroup and CombatManipulationGroup.AddToggle then
    local no_sway_toggle = CombatManipulationGroup:AddToggle('no_sway', {
        Text = 'no sway',
        Default = false,
        Tooltip = 'bad exes are not supported'
    })

    local success, mod = pcall(require, RepStorage:FindFirstChild("Modules") and RepStorage.Modules:FindFirstChild("FPS"))
    if success and mod and mod.updateClient then
        local old_update = mod.updateClient

        mod.updateClient = function(a1, a2, a3)
            local r1, r2, r3 = old_update(a1, a2, a3)

            if no_sway_enabled and a1 and a1.springs then
                for _, spring in pairs(a1.springs) do
                    if spring.Position then spring.Position = Vector3.new() end
                    if spring.Speed then spring.Speed = 0 end
                end
            end

            return r1, r2, r3
        end
    end

    if RunSvc.RenderStepped then
        RunSvc.RenderStepped:Connect(function()
            no_sway_enabled = no_sway_toggle and no_sway_toggle.Value or false
        end)
    end
end



local rs = game:GetService("ReplicatedStorage")
local items = rs:WaitForChild("ItemsList")

local gunModules = {}
local originals = {}
local cached = false
local noObstructionsEnabled = false

local function cacheModules()
	table.clear(gunModules)
	table.clear(originals)

	for _, v in ipairs(items:GetDescendants()) do
		if v:IsA("ModuleScript") and v.Name == "SettingsModule" then
			local ok, mod = pcall(require, v)
			if ok and type(mod) == "table" then
				gunModules[#gunModules + 1] = mod
				originals[mod] = {
					TouchWallPosY = mod.TouchWallPosY,
					TouchWallPosZ = mod.TouchWallPosZ,
					TouchWallRotX = mod.TouchWallRotX,
					TouchWallRotY = mod.TouchWallRotY
				}
			end
		end
	end

	cached = true
end

local function applyNoObstructions()
	if not noObstructionsEnabled then return end
	for _, mod in ipairs(gunModules) do
		pcall(function()
			mod.TouchWallPosY = 0.001
			mod.TouchWallPosZ = 0.001
			mod.TouchWallRotX = 0.001
			mod.TouchWallRotY = 0.001
		end)
	end
end

local function restoreNoObstructions()
	for mod, data in pairs(originals) do
		pcall(function()
			mod.TouchWallPosY = data.TouchWallPosY
			mod.TouchWallPosZ = data.TouchWallPosZ
			mod.TouchWallRotX = data.TouchWallRotX
			mod.TouchWallRotY = data.TouchWallRotY
		end)
	end
end

CombatManipulationGroup:AddToggle("no_obstructions", {
	Text = "no obstructions",
    Tooltip = 'THIS FUNCTION DOES NOT SUPPORT SHITTY XENO | lets you run into walls without your gun staring at jesus',
	Default = false,
	Callback = function(v)
		noObstructionsEnabled = v

		if v then
			if not cached then
				cacheModules()
			end
			applyNoObstructions()
		else
			restoreNoObstructions()
		end
	end
})



local rs = game:GetService("ReplicatedStorage")
local items = rs:WaitForChild("ItemsList")

local gunModules = {}
local originals = {}
local cached = false
local instantAimEnabled = false

local function cacheModules()
	table.clear(gunModules)
	table.clear(originals)

	for _, v in ipairs(items:GetDescendants()) do
		if v:IsA("ModuleScript") and v.Name == "SettingsModule" then
			local ok, mod = pcall(require, v)
			if ok and type(mod) == "table" then
				gunModules[#gunModules + 1] = mod
				originals[mod] = {
					InSpeed = mod.AimInSpeed,
					OutSpeed = mod.AimOutSpeed
				}
			end
		end
	end

	cached = true
end

local function applyInstantAim()
	if not instantAimEnabled then return end
	for _, mod in ipairs(gunModules) do
		pcall(function()
			mod.AimInSpeed = 0
			mod.AimOutSpeed = 0
		end)
	end
end

local function restoreInstantAim()
	for mod, data in pairs(originals) do
		pcall(function()
			mod.AimInSpeed = data.InSpeed
			mod.AimOutSpeed = data.OutSpeed
		end)
	end
end

CombatManipulationGroup:AddToggle("instant_aim", {
	Text = "instant aim",
    Tooltip = 'THIS FUNCTION DOES NOT SUPPORT SHITTY XENO | instantly aims in',
	Default = false,
	Callback = function(v)
		instantAimEnabled = v

		if v then
			if not cached then
				cacheModules()
			end
			applyInstantAim()
		else
			restoreInstantAim()
		end
	end
})


local gunModules = {}
local originalFireModes = {}
local cached = false
local unlockEnabled = false

local function cacheModules()
	table.clear(gunModules)
	table.clear(originalFireModes)

	for _, v in ipairs(items:GetDescendants()) do
		if v:IsA("ModuleScript") and v.Name == "SettingsModule" then
			local ok, mod = pcall(require, v)
			if ok and type(mod) == "table" then
				gunModules[#gunModules + 1] = mod
				if type(mod.FireModes) == "table" then
					local copy = {}
					for i, m in ipairs(mod.FireModes) do
						copy[i] = m
					end
					originalFireModes[mod] = copy
				end
			end
		end
	end

	cached = true
end

local function applyUnlock()
	if not unlockEnabled then return end
	for _, mod in ipairs(gunModules) do
		pcall(function()
			mod.FireModes = { "Auto", "Semi" }
		end)
	end
end

local function restoreUnlock()
	for mod, modes in pairs(originalFireModes) do
		pcall(function()
			mod.FireModes = modes
		end)
	end
end

CombatManipulationGroup:AddToggle("unlock_firemodes", {
	Text = "unlock firemodes",
    Tooltip = 'THIS FUNCTION DOES NOT SUPPORT SHITTY XENO | lets you use auto firerate on a non-auto gun (like a full auto pm)',
	Default = false,
	Callback = function(v)
		unlockEnabled = v

		if v then
			if not cached then
				cacheModules()
			end
			applyUnlock()
		else
			restoreUnlock()
		end
	end
})

local fireRateBoostEnabled = false
local fireRateInterval = 0.05

local gunSettingsModules = {}
local originalFireRates = {}

local function cacheModules()
	table.clear(gunSettingsModules)
	table.clear(originalFireRates)

	for _, v in ipairs(items:GetDescendants()) do
		if v:IsA("ModuleScript") and v.Name == "SettingsModule" then
			local ok, mod = pcall(require, v)
			if ok and type(mod) == "table" and type(mod.FireRate) == "number" then
				table.insert(gunSettingsModules, mod)
				originalFireRates[mod] = mod.FireRate
			end
		end
	end
end

local function applyFireRate()
	if not fireRateBoostEnabled then return end
	for _, mod in ipairs(gunSettingsModules) do
		pcall(function()
			mod.FireRate = fireRateInterval
		end)
	end
end

local function restoreFireRate()
	for mod, rate in pairs(originalFireRates) do
		pcall(function()
			mod.FireRate = rate
		end)
	end
end

CombatManipulationGroup:AddToggle("rpm_toggle", {
	Text = "rpm booster",
    Tooltip = 'THIS FUNCTION DOES NOT SUPPORT SHITTY XENO | makes ur gun go fast asf',
	Default = false,
	Callback = function(state)
		fireRateBoostEnabled = state

		if state then
			cacheModules()
			pcall(applyFireRate)
		else
			pcall(restoreFireRate)
		end
	end
})

CombatManipulationGroup:AddSlider("rpm_slider", {
	Text = "firerate",
    Tooltip = 'THIS FUNCTION DOES NOT SUPPORT SHITTY XENO | the speed your gun will fire. lower = faster',
	Default = 0.05,
	Min = 0,
	Max = 0.1,  
	Rounding = 3,
	Callback = function(value)
		fireRateInterval = value
		if fireRateBoostEnabled then
			pcall(applyFireRate)
		end
	end
})

Toggles.rpm_toggle:OnChanged(function()
	fireRateBoostEnabled = Toggles.rpm_toggle.Value
end)

Options.rpm_slider:OnChanged(function()
	fireRateInterval = Options.rpm_slider.Value
end)




local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AmmoTypes = ReplicatedStorage:WaitForChild("AmmoTypes")

local originalAmmoStats = {}

local function ApplyAmmoMods()
    for _, ammo in ipairs(AmmoTypes:GetChildren()) do
        if not originalAmmoStats[ammo] then
            originalAmmoStats[ammo] = {
                AccuracyDeviation = ammo:GetAttribute("AccuracyDeviation"),
                ProjectileDrop = ammo:GetAttribute("ProjectileDrop")
            }
        end

        if Toggles.nospread.Value then
            if ammo:GetAttribute("AccuracyDeviation") ~= nil then
                ammo:SetAttribute("AccuracyDeviation", 0)
            end
        else
            local v = originalAmmoStats[ammo].AccuracyDeviation
            if v ~= nil then
                ammo:SetAttribute("AccuracyDeviation", v)
            end
        end

        if Toggles.nodrop.Value then
            ammo:SetAttribute("ProjectileDrop", 0)
        else
            ammo:SetAttribute("ProjectileDrop", originalAmmoStats[ammo].ProjectileDrop)
        end
    end
end

CombatManipulationGroup:AddToggle('nospread', {
    Text = 'no spread',
    Default = false,
    Tooltip = 'Removes random bullet deviation so shots go exactly where you aim'
})

CombatManipulationGroup:AddToggle('nodrop', {
    Text = 'no drop',
    Default = false,
    Tooltip = 'Disables bullet gravity so bullets do not fall over distance. works very well for silent aim.'
})

Toggles.nospread:OnChanged(ApplyAmmoMods)
Toggles.nodrop:OnChanged(ApplyAmmoMods)

AmmoTypes.ChildAdded:Connect(function()
    task.wait()
    ApplyAmmoMods()
end)




CombatManipulationGroup:AddToggle('InstantEquip', {
    Text = 'instant equip',
    Tooltip = 'makes you pull shit out instantly idk what to tell you',
    Default = false
})

task.spawn(function()
    while true do
        task.wait(0.001)
        if Library.Unloaded then break end
        if not Toggles.InstantEquip.Value then continue end

        local viewModel = workspace:FindFirstChild("Camera")
        if viewModel then
            viewModel = viewModel:FindFirstChild("ViewModel")
        end
        if not viewModel then continue end

        local animator = viewModel:FindFirstChildOfClass("Humanoid"):FindFirstChild("Animator")
        if not animator then continue end

        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            local anim = track.Animation
            if anim and anim.Name == "Equip" then
                track:AdjustSpeed(15)
                track.TimePosition = track.Length - 0.01
            end
        end
    end
end)


local env = getgenv()
env.NoRecoilEnabled = env.NoRecoilEnabled ~= false
env.NoRecoilModes = env.NoRecoilModes or {
    Legit = true,
    Forced = false
}

CombatManipulationGroup:AddToggle('NoRecoilToggle', {
    Tooltip = 'you have to select a mode in the dropdown',
    Text = 'no recoil',
    Default = env.NoRecoilEnabled,
    Callback = function(v)
        env.NoRecoilEnabled = v
    end
})

CombatManipulationGroup:AddDropdown('NoRecoilModesDropdown', {
    Text = 'no recoil mode',
    Tooltip = 'Forced removes all gun recoil, legit removes camera recoil. you can use both at once for zero.',
    Values = { 'Legit', 'Forced' },
    Multi = true,
    Default = {
        Legit = env.NoRecoilModes.Legit,
        Forced = env.NoRecoilModes.Forced
    },
    Callback = function(Value)
        env.NoRecoilModes.Legit = Value.Legit or false
        env.NoRecoilModes.Forced = Value.Forced or false
    end
})


end
local function miscTabs()



-- ===== Misc Tab Sections =====
Env = Tabs.Misc:AddRightGroupbox('World')

local Lighting = game:GetService("Lighting")
local Atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")

Env:AddToggle('EnvMaster', { Text = 'environmnet editor', Default = false })

Env:AddDivider()

Env:AddToggle('EnvShadows', { Text = 'shadows', Default = true })

Env:AddDivider()

Env:AddSlider('EnvBrightness', {
    Text = 'brightness',
    Default = Lighting.Brightness,
    Min = 0,
    Max = 10,
    Rounding = 2
})

Env:AddSlider('EnvClockTime', {
    Text = 'clocktime',
    Default = Lighting.ClockTime,
    Min = 0,
    Max = 24,
    Rounding = 2
})

Env:AddDivider()

Env:AddLabel('atmosphere'):AddColorPicker('EnvAtmosColor', { Default = Lighting.Atmosphere.Color })
Env:AddLabel('atmosphere decay'):AddColorPicker('EnvAtmosDecay', { Default = Lighting.Atmosphere.Decay })
Env:AddLabel('ambient'):AddColorPicker('EnvAmbient', { Default = Lighting.Ambient })
Env:AddLabel('outdoor ambient'):AddColorPicker('EnvOutdoor', { Default = Lighting.OutdoorAmbient })
Env:AddLabel('sky top'):AddColorPicker('EnvShiftTop', { Default = Lighting.ColorShift_Top })
Env:AddLabel('sky bottom'):AddColorPicker('EnvShiftBottom', { Default = Lighting.ColorShift_Bottom })

local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")

local Original = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    ColorShift_Top = Lighting.ColorShift_Top,
    ColorShift_Bottom = Lighting.ColorShift_Bottom,
    GlobalShadows = Lighting.GlobalShadows,
    AtmosColor = Atmosphere and Atmosphere.Color,
    AtmosDecay = Atmosphere and Atmosphere.Decay
}

RunService.RenderStepped:Connect(function()
    if Library.Unloaded then return end

    if not Toggles.EnvMaster.Value then
        Lighting.Brightness = Original.Brightness
        Lighting.ClockTime = Original.ClockTime
        Lighting.Ambient = Original.Ambient
        Lighting.OutdoorAmbient = Original.OutdoorAmbient
        Lighting.ColorShift_Top = Original.ColorShift_Top
        Lighting.ColorShift_Bottom = Original.ColorShift_Bottom
        Lighting.GlobalShadows = Original.GlobalShadows
        if Atmosphere then
            Atmosphere.Color = Original.AtmosColor
            Atmosphere.Decay = Original.AtmosDecay
        end
        return
    end

    Lighting.Brightness = Options.EnvBrightness.Value
    Lighting.ClockTime = Options.EnvClockTime.Value
    Lighting.GlobalShadows = Toggles.EnvShadows.Value
    Lighting.Ambient = Options.EnvAmbient.Value
    Lighting.OutdoorAmbient = Options.EnvOutdoor.Value
    Lighting.ColorShift_Top = Options.EnvShiftTop.Value
    Lighting.ColorShift_Bottom = Options.EnvShiftBottom.Value

    if Atmosphere then
        Atmosphere.Color = Options.EnvAtmosColor.Value
        Atmosphere.Decay = Options.EnvAtmosDecay.Value
    end
end)

Env:AddDivider()




Env:AddButton({
	Text = 'no inv background',
	Func = function()
		local Players = game:GetService("Players")
		local player = Players.LocalPlayer

		local gui = player:FindFirstChild("PlayerGui")
		if not gui then return end

		local backpackFrame = gui
			:FindFirstChild("MainGui", true)
			:FindFirstChild("MainFrame", true)
			:FindFirstChild("BackpackFrame", true)

		if not backpackFrame then return end

		local targets = {
			"CharacterFrame",
			"InventoryFrame",
			"Loot"
		}

		for _, name in ipairs(targets) do
			local frame = backpackFrame:FindFirstChild(name, true)
			if frame and frame:IsA("Frame") then
				frame.BackgroundTransparency = 1
			end
		end

		for _, obj in ipairs(backpackFrame:GetDescendants()) do
			if obj:IsA("ImageLabel") and obj.Name == "Decor" then
				obj.ImageTransparency = 1
			end
		end
	end
})




Env:AddToggle('NoGrass', {
    Text = 'no grass',
    Default = false,
    Callback = function(v)
        local t = workspace.Terrain

        if t:FindFirstChild("Decoration") ~= nil then
            t.Decoration = not v
        elseif rawget(t, "Decoration") ~= nil then
            t.Decoration = not v
        else
            sethiddenproperty(t, "Decoration", not v)
        end
    end
})

Toggles.NoGrass:OnChanged(function()
    local t = workspace.Terrain
    pcall(function()
        sethiddenproperty(t, "Decoration", not Toggles.NoGrass.Value)
    end)
end)



local Lighting = game:GetService("Lighting")

local Atmosphere
local OldDensity
local LoopRunning = false

Env:AddToggle('ForceAtmosphereDensity', {
    Text = 'no fog',
    Default = false,
})

Toggles.ForceAtmosphereDensity:OnChanged(function()
    if Toggles.ForceAtmosphereDensity.Value then
        Atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
        if not Atmosphere then return end

        OldDensity = Atmosphere.Density
        LoopRunning = true

        task.spawn(function()
            while LoopRunning do
                if Atmosphere then
                    Atmosphere.Density = 0
                end
                task.wait(20)
            end
        end)
    else
        LoopRunning = false
        if Atmosphere and OldDensity ~= nil then
            Atmosphere.Density = OldDensity
        end
    end
end)

local Foliage = workspace:WaitForChild("SpawnerZones"):WaitForChild("Foliage")
local Stored = {}

Env:AddToggle('FoliageSurfaceParts', {
    Text = 'no leaves',
    Default = false,
})

local Terrain = workspace:WaitForChild("Terrain")
local Clouds
local CloudsParent

Env:AddToggle('NoClouds', {
    Text = 'no clouds',
    Default = false,
})

local Lighting = game:GetService("Lighting")
local StoredBlurValue

Env:AddToggle('NoInventoryBlur', {
    Text = 'no inventory blur',
    Default = false,
})

Toggles.NoInventoryBlur:OnChanged(function()
    local blur = Lighting:FindFirstChild("InventoryBlur")
    if blur then
        if Toggles.NoInventoryBlur.Value then
            StoredBlurValue = blur.Size
            blur.Size = 0
        else
            if StoredBlurValue then
                blur.Size = StoredBlurValue
            end
        end
    end
end)


local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

local ExposureConn
local OldExposure

Env:AddToggle('ForceExposure', {
    Text = 'exposure brighten',
    Default = false,
})

Toggles.ForceExposure:OnChanged(function()
    if Toggles.ForceExposure.Value then
        OldExposure = Lighting.ExposureCompensation
        ExposureConn = RunService.RenderStepped:Connect(function()
            Lighting.ExposureCompensation = 1.5
        end)
    else
        if ExposureConn then
            ExposureConn:Disconnect()
            ExposureConn = nil
        end
        if OldExposure ~= nil then
            Lighting.ExposureCompensation = OldExposure
        end
    end
end)

Toggles.NoClouds:OnChanged(function()
    if Toggles.NoClouds.Value then
        Clouds = Terrain:FindFirstChild("Clouds")
        if Clouds then
            CloudsParent = Clouds.Parent
            Clouds.Parent = nil
        end
    else
        if Clouds and CloudsParent then
            Clouds.Parent = CloudsParent
        end
    end
end)

local function hasSurfaceAppearance(part)
    for _, c in ipairs(part:GetChildren()) do
        if c:IsA("SurfaceAppearance") then
            return true
        end
    end
    return false
end

Toggles.FoliageSurfaceParts:OnChanged(function()
    if Toggles.FoliageSurfaceParts.Value then
        table.clear(Stored)
        for _, v in ipairs(Foliage:GetDescendants()) do
            if v:IsA("BasePart") and hasSurfaceAppearance(v) then
                Stored[#Stored+1] = {v, v.Parent}
                v.Parent = nil
            end
        end
    else
        for _, data in ipairs(Stored) do
            local part, parent = data[1], data[2]
            if part and parent then
                part.Parent = parent
            end
        end
        table.clear(Stored)
    end
end)


Env:AddToggle('antiMine', {
    Text = 'antimine',
    Tooltip = 'deletes all mines every 2 seconds and replaces them with a forcefield clone. you cannot step on them, only other people can.',
    Default = getgenv().antiMine,
    Callback = function(Value)
        getgenv().antiMine = Value
    end
})
local Lighting = game:GetService("Lighting")

getgenv().toggleenv = getgenv().toggleenv or false
getgenv().enbrightness = getgenv().enbrightness or 100
getgenv().ambientSaved = getgenv().ambientSaved or {Outdoor = Lighting.OutdoorAmbient, Indoor = Lighting.Ambient}

Env:AddToggle('AmbientToggle', {
    Text = 'fullbright',
    Default = getgenv().toggleen,
    Callback = function(Value)
        getgenv().togglee = Value
        if Value then
            local val = getgenv().brightness / 100
            Lighting.OutdoorAmbient = Color3.new(val, val, val)
            Lighting.Ambient = Color3.new(val, val, val)
        else
            Lighting.OutdoorAmbient = getgenv().ambientSaved.Outdoor
            Lighting.Ambient = getgenv().ambientSaved.Indoor
        end
    end
})

Env:AddSlider('AmbientSlider', {
    Text = 'fullbright level',
    Default = 0,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        getgenv().brightness = Value
        if getgenv().togglee then
            local val = Value / 100
            Lighting.OutdoorAmbient = Color3.new(val, val, val)
            Lighting.Ambient = Color3.new(val, val, val)
        end
    end
})




local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Env = Tabs.Misc:AddRightGroupbox("world")

local hitsounds = {"Kill"}

local customsounds = {
    {Name="meow", Id="rbxassetid://7148585764"},
    {Name="rust", Id="rbxassetid://5043539486"},
    {Name="gamesense", Id="rbxassetid://4817809188"},
    {Name="ball", Id="rbxassetid://9117374232"},
    {Name="meow2", Id="rbxassetid://18570808286"},
    {Name="idk", Id="rbxassetid://108157571955794"},
    {Name="neverlose", Id="rbxassetid://97643101798871"},
    {Name="fire", Id="rbxassetid://101882126173393"},
    {Name="cod", Id="rbxassetid://1129547534"},
        
}

local customactive = false
local volume = 1.5

local function getcustomid(name)
    for _, s in ipairs(customsounds) do
        if s.Name == name then return s.Id end
    end
end

local function replacesound(soundObj, hitType)
    if not customactive then return end
    if not soundObj:IsA("Sound") then return end
    local selectedname = Options[hitType.."Dropdown"].Value
    local id = getcustomid(selectedname)
    if id then
        soundObj.SoundId = id
        soundObj.Volume = volume
    end
end

local function hookhits()
    local playerGui = LocalPlayer:WaitForChild("PlayerGui")
    local function hookmaingui(mainGui)
        mainGui.ChildAdded:Connect(function(child)
            for _, hitType in ipairs(hitsounds) do
                replacesound(child, hitType)
            end
        end)
    end
    if playerGui:FindFirstChild("MainGui") then
        hookmaingui(playerGui.MainGui)
    end
    playerGui.ChildAdded:Connect(function(child)
        if child.Name == "MainGui" then
            hookmaingui(child)
        end
    end)
end

Env:AddToggle("customhitsounds", {Text="enable custom hitsounds", Default=false, Callback=function(v) customactive=v end})
Env:AddSlider("hitsoundvolume", {Text="hitsound volume", Default=volume, Min=0, Max=6, Rounding=2, Callback=function(v) volume=v end})

for _, hitType in ipairs(hitsounds) do
    local values = {}
    for _, s in ipairs(customsounds) do table.insert(values, s.Name) end
    Env:AddDropdown(hitType.."Dropdown",{Text=hitType:lower().." sound", Values=values, Default=1, Multi=false})
end

Env:AddDropdown("playhittype",{Text="hit sound to play", Values=hitsounds, Default=1, Multi=false})
Env:AddButton({Text="play hitsound", Func=function()
    if not customactive then return end
    local hitType = Options.playhittype.Value
    local selectedName = Options[hitType.."Dropdown"].Value
    local id = getcustomid(selectedName)
    if not id then return end
    local s = Instance.new("Sound")
    s.SoundId = id
    s.Volume = volume
    s.Parent = workspace
    s:Play()
    s.Ended:Connect(function() s:Destroy() end)
end})


hookhits()






getgenv().ImpactWatcherEnabled = false
getgenv().ImpactBeamColor = getgenv().ImpactBeamColor or Color3.fromRGB(255, 0, 0)
getgenv().ImpactBeamTransparency = getgenv().ImpactBeamTransparency or 0.2
getgenv().ImpactScanInterval = getgenv().ImpactScanInterval or 0.01
getgenv().ImpactBeamFadeTime = getgenv().ImpactBeamFadeTime or 0.5
getgenv().ImpactFOVEnabled = true
getgenv().ImpactFOVDotThreshold = 0.25

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local effectsFolder = Workspace:WaitForChild("NoCollision"):WaitForChild("Effects")

dtc = Tabs.Misc:AddRightGroupbox('visualiers')

local GhostToggle
local ghostModel
local ghostMap = {}

local R15Parts = {
	Head = true,
	UpperTorso = true,
	LowerTorso = true,
	LeftUpperArm = true,
	LeftLowerArm = true,
	LeftHand = true,
	RightUpperArm = true,
	RightLowerArm = true,
	RightHand = true,
	LeftUpperLeg = true,
	LeftLowerLeg = true,
	LeftFoot = true,
	RightUpperLeg = true,
	RightLowerLeg = true,
	RightFoot = true
}

local container = workspace:FindFirstChild("GhostClones")
if not container then
	container = Instance.new("Folder")
	container.Name = "GhostClones"
	container.Parent = workspace
end

local function rebuild()
	if not ghostModel then
		ghostModel = Instance.new("Model")
		ghostModel.Name = "GhostVisual"
		ghostModel.Parent = container
	end

	ghostModel:ClearAllChildren()
	table.clear(ghostMap)

	local char = game.Players.LocalPlayer.Character
	if not char then return end

	for _, p in ipairs(char:GetChildren()) do
		if p:IsA("BasePart") and R15Parts[p.Name] then
			local g = Instance.new("Part")
			g.Name = p.Name
			g.Size = p.Size
			g.Anchored = true
			g.CanCollide = false
			g.Transparency = 1
			g.CastShadow = false
			g.Parent = ghostModel

			local box = Instance.new("BoxHandleAdornment")
			box.Adornee = g
			box.Size = p.Size
			box.AlwaysOnTop = true
			box.ZIndex = 10
			box.Transparency = 0
			box.Color3 = Color3.new(1,1,1)
			box.Parent = g

			ghostMap[p] = {part = g, box = box}
		end
	end
end

local RunConnection
GhostToggle = dtc:AddToggle('GhostVisual', {
	Text = 'boxfloor visualiser',
	Default = false,
	Callback = function(value)
		if value then
			rebuild()
			RunConnection = game:GetService("RunService").RenderStepped:Connect(function()
				local char = game.Players.LocalPlayer.Character
				if not char then return end
				local hrp = char:FindFirstChild("HumanoidRootPart")
				if not hrp then return end

				local baseCFrame = hrp.CFrame * CFrame.new(0, -3.5, 0) * CFrame.Angles(math.rad(90), 0, 0)

				for real, data in pairs(ghostMap) do
					if real.Parent then
						data.part.Size = real.Size
						local relative = hrp.CFrame:ToObjectSpace(real.CFrame)
						data.part.CFrame = baseCFrame * relative
						data.box.Size = real.Size
					end
				end
			end)
		else
			if RunConnection then
				RunConnection:Disconnect()
				RunConnection = nil
			end
			if ghostModel then
				ghostModel:ClearAllChildren()
			end
		end
	end
})

game.Players.LocalPlayer.CharacterAdded:Connect(function()
	if GhostToggle.Value then
		rebuild()
	end
end)




dtc:AddToggle('Hitlogs', {
    Text = 'hitlog visualiser',
    Tooltip = 'everytime someone/something hits something within your fov it will draw a visualiser to that hit.',
    Default = false
})

getgenv().ImpactWatcherEnabled = Toggles.Hitlogs.Value

Toggles.Hitlogs:OnChanged(function()
    getgenv().ImpactWatcherEnabled = Toggles.Hitlogs.Value
end)

local function notify(text)
    Library:Notify(text, 10)
end

local function getRoot()
    local char = player.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function isInView(worldPos)
    if not getgenv().ImpactFOVEnabled then
        return true
    end

    local cam = Workspace.CurrentCamera
    local dir = worldPos - cam.CFrame.Position
    if dir.Magnitude < 0.01 then
        return false
    end

    return cam.CFrame.LookVector:Dot(dir.Unit) > getgenv().ImpactFOVDotThreshold
end

local function fadeAndCleanup(beam, a0, a1, impact)
    local start = os.clock()
    local conn
    conn = RunService.RenderStepped:Connect(function()
        local t = (os.clock() - start) / getgenv().ImpactBeamFadeTime
        if t >= 1 then
            conn:Disconnect()
            beam:Destroy()
            a0:Destroy()
            a1:Destroy()
            if impact and impact.Parent then
                impact:Destroy()
            end
            return
        end

        local v = getgenv().ImpactBeamTransparency + (1 - getgenv().ImpactBeamTransparency) * t
        beam.Transparency = NumberSequence.new(v)
    end)
end

local function spawnBeam(origin, impact)
    local a0 = Instance.new("Attachment")
    local a1 = Instance.new("Attachment")

    a0.WorldPosition = origin
    a1.WorldPosition = impact.Position

    a0.Parent = Workspace.Terrain
    a1.Parent = Workspace.Terrain

    local beam = Instance.new("Beam")
    beam.Attachment0 = a0
    beam.Attachment1 = a1
    beam.Color = ColorSequence.new(getgenv().ImpactBeamColor)
    beam.Transparency = NumberSequence.new(getgenv().ImpactBeamTransparency)
    beam.Width0 = 0.05
    beam.Width1 = 0.05
    beam.FaceCamera = true
    beam.Parent = Workspace

    fadeAndCleanup(beam, a0, a1, impact)
end

local function reportHit(origin, impactPos)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = { player.Character }

    local result = Workspace:Raycast(origin, impactPos - origin, params)
    if not result then return end

    local hit = result.Instance
    local model = hit:FindFirstAncestorOfClass("Model")
    local hum = model and model:FindFirstChildOfClass("Humanoid")
    local plr = model and Players:GetPlayerFromCharacter(model)

    if hum and plr then
        if hum.Health == hum.MaxHealth then
            local msg = "client desync caused missed bullet on " .. plr.Name
            print(msg)
            notify(msg)
            return
        end

        local msg = string.format(
            "hit %s in %s // %d > %d",
            plr.Name,
            hit.Name,
            hum.MaxHealth,
            math.floor(hum.Health)
        )
        print(msg)
        notify(msg)
        return
    end

    local msg = "bullet hit " .. hit.Name
    print(msg)
    notify(msg)
end

task.spawn(function()
    while true do
        if getgenv().ImpactWatcherEnabled then
            local root = getRoot()
            if root then
                for _, obj in ipairs(effectsFolder:GetChildren()) do
                    if obj:IsA("BasePart") and obj.Name == "Impact" then
                        if isInView(obj.Position) then
                            obj.Name = "Impact_" .. HttpService:GenerateGUID(false)
                            spawnBeam(root.Position, obj)
                            reportHit(root.Position, obj.Position)
                        else
                            obj:Destroy()
                        end
                    end
                end
            end
        end
        task.wait(getgenv().ImpactScanInterval)
    end
end)


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer

local DetectSpeedhack = dtc:AddToggle('DetectSpeedhack', {Text='detect replicated walkspeed', Default=false})
local DetectDesyncTP = dtc:AddToggle('DetectDesyncTP', {Text='detect desync bounce', Default=false})
local DetectDesyncHeight = dtc:AddToggle('DetectDesyncHeight', {Text='detect desync vertical', Default=false})

local FLAG_COOLDOWN = 10
local tracked = {}

local function notify(category, username, reason)
    Library:Notify({
        Description = string.format("%s has been flagged for %s. // %s", username, category:lower(), reason),
        Duration = 5
    })
end

local function initPlayer(plr)
    tracked[plr] = {
        lastPos = nil,
        lastTime = nil,
        lastFlag = {}
    }
end

for _, p in Players:GetPlayers() do initPlayer(p) end
Players.PlayerAdded:Connect(initPlayer)
Players.PlayerRemoving:Connect(function(p) tracked[p] = nil end)

local function canFlag(plr, category)
    local last = tracked[plr].lastFlag[category] or 0
    if os.clock() - last >= FLAG_COOLDOWN then
        tracked[plr].lastFlag[category] = os.clock()
        return true
    end
    return false
end

local function flag(plr, category, reason)
    if canFlag(plr, category) then
        notify(category, plr.Name, reason)
    end
end

RunService.Heartbeat:Connect(function()
    local now = os.clock()
    for plr, data in pairs(tracked) do
        if plr ~= lp then
            local char = plr.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChild("Humanoid")
            if hrp and hum then
                if data.lastPos then
                    local dt = now - data.lastTime
                    if dt > 0 then
                        local delta = hrp.Position - data.lastPos
                        local horiz = Vector3.new(delta.X,0,delta.Z).Magnitude
                        local vert = delta.Y

                        if DetectDesyncTP.Value then
                            if horiz >= 50 and dt <= 0.2 then
                                flag(plr,"Desync TP","tp "..math.floor(horiz).."stp/"..string.format("%.2f",dt))
                            end
                        end

                        if DetectDesyncHeight.Value then
                            if vert >= 60 and dt <= 0.1 then
                                flag(plr,"Desync Height","heightgain "..math.floor(vert).."stp/"..string.format("%.2f",dt))
                            end
                        end
                    end
                end

                if DetectSpeedhack.Value then
                    if hum.WalkSpeed > 21 then
                        flag(plr,"Speedhack","walkspeed "..hum.WalkSpeed)
                    end
                end

                data.lastPos = hrp.Position
                data.lastTime = now
            end
        end
    end
end)

dtc:AddButton({
    Text = "example notification",
    Func = function()
        local words = {
            "Olivia","Cyber","Hack","Spider","Hunt","Gamer","Pro","Code",
            "Cracker","Cheat","Tester","Solter","Model","Anti","Ice","Water",
            "Coal","Fly","Rapid","Delta","Echo","Index","Nugget","Flash","Craft","Bacon","Monkey","Blizzard","Fox","Stealth","Jewish","Hitler","Fuckface","Pixel","Scarlett","Adolf","Stalin","YZI"
        }

        local function randomName()
            local nameParts = {}
            local count = math.random(2,3)
            for i = 1, count do
                table.insert(nameParts, words[math.random(1,#words)])
            end
            local digits = math.random(10,999)
            return table.concat(nameParts,"")..digits
        end

        local types = {"SPEEDHACK","DESYNC"}
        local chosenType = types[math.random(1,#types)]

        local reason = ""
        if chosenType == "SPEEDHACK" then
            local ws = math.random(18,50) + math.random()
            reason = "walkspeed = "..string.format("%.2f", ws).." > 21"
        else
            local bounce = math.random(50,1234)
            local dt = math.random() * (0.2 - 0.01) + 0.01
            reason = "desync bounce "..bounce.." / "..string.format("%.2f",dt)
        end

        local playerName = randomName()

        Library:Notify(chosenType.." // "..playerName.." has been flagged for "..chosenType:lower()..". // "..reason, 5)
    end,
    DoubleClick = false,
    Tooltip = "does sum idk"
})



end
local function miscDrawingVm()





local RunService = game:GetService("RunService")
local Camera = workspace:WaitForChild("Camera")

local VmTabbox = Tabs.Misc:AddLeftTabbox()

local ArmsTab = VmTabbox:AddTab("arms")
local WeaponTab = VmTabbox:AddTab("weapon")

local function getViewModel()
    return Camera:FindFirstChild("ViewModel")
end

local function collectParts(isWeapon)
    local vm = getViewModel()
    if not vm then return {} end

    local parts = {}
    local item = vm:FindFirstChild("Item")

    for _, v in ipairs(vm:GetDescendants()) do
        if v:IsA("BasePart") then
            if isWeapon then
                if item and v:IsDescendantOf(item) then
                    table.insert(parts, v)
                end
            else
                if not item or not v:IsDescendantOf(item) then
                    table.insert(parts, v)
                end
            end
        end
    end

    return parts
end

local function stripSurface(part)
    for _, v in ipairs(part:GetChildren()) do
        if v:IsA("SurfaceAppearance") then
            v:Destroy()
        end
    end
end

local function applyChams(parts, opts)
    for _, p in ipairs(parts) do
        stripSurface(p)
        p.Material = opts.Material
        p.Color = opts.Color
        if p.Transparency < 0.99 then
            p.Transparency = opts.Transparency
        end
    end
end

local function applyHighlight(model, opts)
    if not opts.Highlight then
        local old = model:FindFirstChild("VM_HL")
        if old then old:Destroy() end
        return
    end

    local hl = model:FindFirstChild("VM_HL") or Instance.new("Highlight")
    hl.Name = "VM_HL"
    hl.Adornee = model
    hl.FillTransparency = opts.HLTransparency
    hl.OutlineTransparency = 0
    hl.FillColor = opts.HLColor
    hl.OutlineColor = opts.HLOColor
    hl.Parent = model
end

local function makeEditor(tab, prefix)
    tab:AddToggle(prefix .. "_Enabled", { Text = "enabled", Default = false })
    tab:AddSlider(prefix .. "_Transparency", { Text = "transparency", Default = 0, Min = 0, Max = 1, Rounding = 2 })
    tab:AddDropdown(prefix .. "_Material", {
        Text = "material",
        Values = { "Neon", "ForceField", "Glass", "CrackedLava" },
        Default = "ForceField"
    })

    tab:AddLabel("color"):AddColorPicker(prefix .. "_Color", {
        Default = Color3.fromRGB(255, 255, 255)
    })

    tab:AddToggle(prefix .. "_Highlight", { Text = "highlight", Default = false })
    tab:AddSlider(prefix .. "_HLTransparency", { Text = "highlight transparency", Default = 0.5, Min = -20, Max = 20, Rounding = 2 })

    tab:AddLabel("highlight color"):AddColorPicker(prefix .. "_HLColor", {
        Default = Color3.fromRGB(255, 255, 255)
    })

    tab:AddLabel("highlight outline color"):AddColorPicker(prefix .. "_HLOColor", {
        Default = Color3.fromRGB(255, 255, 255)
    })
end

makeEditor(ArmsTab, "ArmsVM")
makeEditor(WeaponTab, "WeaponVM")

RunService.RenderStepped:Connect(function()
    local vm = getViewModel()
    if not vm then return end

    if Toggles.ArmsVM_Enabled.Value then
        applyChams(
            collectParts(false),
            {
                Material = Enum.Material[Options.ArmsVM_Material.Value],
                Color = Options.ArmsVM_Color.Value,
                Transparency = Options.ArmsVM_Transparency.Value
            }
        )

        applyHighlight(vm, {
            Highlight = Toggles.ArmsVM_Highlight.Value,
            HLTransparency = Options.ArmsVM_HLTransparency.Value,
            HLColor = Options.ArmsVM_HLColor.Value,
            HLOColor = Options.ArmsVM_HLOColor.Value
        })
    end

    if Toggles.WeaponVM_Enabled.Value then
        local item = vm:FindFirstChild("Item")
        if item then
            applyChams(
                collectParts(true),
                {
                    Material = Enum.Material[Options.WeaponVM_Material.Value],
                    Color = Options.WeaponVM_Color.Value,
                    Transparency = Options.WeaponVM_Transparency.Value
                }
            )

            applyHighlight(item, {
                Highlight = Toggles.WeaponVM_Highlight.Value,
                HLTransparency = Options.WeaponVM_HLTransparency.Value,
                HLColor = Options.WeaponVM_HLColor.Value,
                HLOColor = Options.WeaponVM_HLOColor.Value
            })
        end
    end
end)







local RS = game:GetService('RunService')
local cam = workspace.CurrentCamera

local MiscDrawing = Tabs.Misc:AddLeftGroupbox('Drawing')

MiscDrawing:AddToggle('crosshair_enabled', { Text = 'crosshair', Default = false })
MiscDrawing:AddToggle('crosshair_stroke', { Text = 'stroke', Default = true })
MiscDrawing:AddToggle('crosshair_spin', { Text = 'spin', Default = false })
MiscDrawing:AddToggle('crosshair_branched', { Text = 'hitler', Tooltip = 'he would be proud', Default = false })

MiscDrawing:AddSlider('crosshair_gap', {
    Text = 'gap',
    Default = 6,
    Min = 0,
    Max = 30,
    Rounding = 0
})

MiscDrawing:AddSlider('crosshair_length', {
    Text = 'length',
    Default = 10,
    Min = 1,
    Max = 50,
    Rounding = 0
})

MiscDrawing:AddSlider('crosshair_branch_length', {
    Text = 'german length',
    Default = 8,
    Min = 1,
    Max = 50,
    Rounding = 0
})

MiscDrawing:AddSlider('crosshair_width', {
    Text = 'width',
    Default = 2,
    Min = 1,
    Max = 5,
    Rounding = 0
})

MiscDrawing:AddSlider('crosshair_spin_speed', {
    Text = 'spin speed',
    Default = 90,
    Min = 0,
    Max = 720,
    Rounding = 0
})

MiscDrawing:AddLabel('color'):AddColorPicker('crosshair_color', {
    Default = Color3.fromRGB(255,255,255),
    Transparency = 0
})

local function t(name, default)
    return Toggles[name] and Toggles[name].Value or default
end

local function o(name, default)
    return Options[name] and Options[name].Value or default
end

local function newLine()
    local l = Drawing.new('Line')
    l.Visible = false
    l.Transparency = 1
    return l
end

local lines = {}
local strokes = {}

for i = 1, 8 do
    strokes[i] = newLine()
    lines[i] = newLine()
end

local rotation = 0

RS.RenderStepped:Connect(function(dt)
    if not t('crosshair_enabled', false) then
        for i = 1, 8 do
            lines[i].Visible = false
            strokes[i].Visible = false
        end
        return
    end

    local center = cam.ViewportSize / 2
    local gap = o('crosshair_gap', 6)
    local length = o('crosshair_length', 10)
    local branchLength = o('crosshair_branch_length', 8)
    local width = o('crosshair_width', 2)
    local branched = t('crosshair_branched', false)
    local stroke = t('crosshair_stroke', true)

    local color = Options.crosshair_color.Value
    local alpha = 1 - Options.crosshair_color.Transparency

    if t('crosshair_spin', false) then
        rotation += math.rad(o('crosshair_spin_speed', 90)) * dt
    end

    local cos = math.cos(rotation)
    local sin = math.sin(rotation)

    local baseDirs = {
        Vector2.new(-sin, cos),
        Vector2.new(sin, -cos),
        Vector2.new(cos, sin),
        Vector2.new(-cos, -sin)
    }

    local function rightOf(v)
        return Vector2.new(v.Y, -v.X)
    end

    local function draw(i, from, to, col, thick)
        local s = strokes[i]
        if stroke then
            s.From = from
            s.To = to
            s.Color = Color3.new(0,0,0)
            s.Thickness = thick + 2
            s.Transparency = alpha
            s.Visible = true
        else
            s.Visible = false
        end

        local l = lines[i]
        l.From = from
        l.To = to
        l.Color = col
        l.Thickness = thick
        l.Transparency = alpha
        l.Visible = true
    end

    local idx = 1

    for _, d in ipairs(baseDirs) do
        local baseFrom = center + d * gap
        local baseTo = center + d * (gap + length)

        draw(idx, baseFrom, baseTo, color, width)
        idx += 1

        if branched then
            local branchDir = rightOf(d)
            local branchFrom = baseTo
            local branchTo = baseTo + branchDir * branchLength

            draw(idx, branchFrom, branchTo, color, width)
            idx += 1
        end
    end

    for i = idx, 8 do
        lines[i].Visible = false
        strokes[i].Visible = false
    end
end)

MiscDrawing:AddDivider()

















local function setInventoryKey(v)
    if typeof(v) == "EnumItem" then
        getgenv().inventoryKey = v.Name
    elseif typeof(v) == "string" and v ~= "None" then
        getgenv().inventoryKey = v
    else
        getgenv().inventoryKey = nil
    end
end


MiscDrawing:AddToggle('InventoryEnabled', {
    Text = 'inventory checker',
    Default = false,
    Callback = function(Value)
        getgenv().inventoryChecker = Value
    end
})

Toggles.InventoryEnabled:OnChanged(function()
    getgenv().inventoryChecker = Toggles.InventoryEnabled.Value
end)

MiscDrawing:AddLabel('inventory checker keybind'):AddKeyPicker('InventoryKeybind', {
    Default = 'None',
    SyncToggleState = false,
    Mode = 'Hold',
    Text = 'inventory checker',
    NoUI = false,

    Callback = function(Value)
        setInventoryKey(Value)
    end,

    ChangedCallback = function(New)
        setInventoryKey(New)
    end
})

Options.InventoryKeybind:OnChanged(function()
    setInventoryKey(Options.InventoryKeybind.Value)
end)

getgenv().BeamEnabled = false
getgenv().BeamFadeDuration = 2
getgenv().PlayerESP_Color = Color3.fromRGB(255,255,255)

local RPM = 600
local fireDelay = 60 / RPM
local firing = false

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local function isSilentAimActive()
    if not Options.LockKey then return false end
    return Options.LockKey:GetState()
end

local function getClosestPlayerToMouseTracer()
    local closest, shortest = nil, math.huge
    local mousePos = UserInputService:GetMouseLocation()

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer
        and plr.Character
        and plr.Character:FindFirstChild("Head")
        and plr.Character:FindFirstChild("Humanoid")
        and plr.Character.Humanoid.Health > 0 then

            local head = plr.Character.Head
            local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
            if onScreen then
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                if dist < shortest then
                    shortest = dist
                    closest = plr
                end
            end
        end
    end

    return closest
end

local function createBeam(origin, targetPos)
    if not getgenv().BeamEnabled then return end

    local a0 = Instance.new("Attachment")
    local a1 = Instance.new("Attachment")
    a0.WorldPosition = origin
    a1.WorldPosition = targetPos

    local beam = Instance.new("Beam")
    beam.Attachment0 = a0
    beam.Attachment1 = a1
    beam.Width0 = 0.1
    beam.Width1 = 0.05
    beam.FaceCamera = true
    beam.Color = ColorSequence.new(getgenv().PlayerESP_Color)
    beam.Parent = a0

    a0.Parent = Workspace.Terrain
    a1.Parent = Workspace.Terrain

    task.spawn(function()
        local t = 0
        while t < getgenv().BeamFadeDuration do
            beam.Transparency = NumberSequence.new(t / getgenv().BeamFadeDuration)
            t += task.wait(0.05)
        end
        a0:Destroy()
        a1:Destroy()
    end)
end

local function fireOnce()
    local char = LocalPlayer.Character
    if not char then return end

    local holding = char:FindFirstChild("Holding")
    if not holding or not holding.Value then return end

    local vm = Camera:FindFirstChild("ViewModel")
    if not vm then return end

    local itemRoot = vm:FindFirstChild("Item")
        and vm.Item:FindFirstChild("ItemRoot")
    if not itemRoot then return end

    local origin = itemRoot.Position
    local targetPos = origin + Camera.CFrame.LookVector * 1000

    if isSilentAimActive() then
        local target = getClosestPlayerToMouseTracer()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            targetPos = target.Character.Head.Position
        end
    end

    createBeam(origin, targetPos)
end

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        firing = true
        task.spawn(function()
            while firing do
                fireOnce()
                task.wait(fireDelay)
            end
        end)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        firing = false
    end
end)

MiscDrawing:AddDivider()
MiscDrawing:AddToggle('BeamToggle', {
    Text = 'tracers',
    Default = true,
    Callback = function(v)
        getgenv().BeamEnabled = v
    end
})



MiscDrawing:AddSlider('BeamDurationSlider', {
    Text = 'tracer duration',
    Default = 2,
    Min = 0.1,
    Max = 5,
    Rounding = 1,
    Callback = function(Value)
        getgenv().BeamDuration = Value
    end
})

MiscDrawing:AddSlider('BeamFadeSlider', {
    Text = 'tracer fade out',
    Default = 2,
    Min = 0.1,
    Max = 5,
    Rounding = 1,
    Callback = function(Value)
        getgenv().BeamFadeDuration = Value
    end
})

end
local function Movement()

-- ===== Player Tab Sections =====
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer


local URBox = Tabs.Player:AddLeftGroupbox('resolvers')





local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local RS = game:GetService("ReplicatedStorage")

local SnapConn

URBox:AddLabel('desync resolver'):AddKeyPicker('SnapVerifiedKey', {
    Default = 'None',
    Mode = 'Toggle',
    Text = 'desync resolver',
    SyncToggleState = true,
    Tooltip = 'snaps people to their server position. breaks player rotations but can resolve some desyncs.',
    NoUI = false,
})

Options.SnapVerifiedKey:OnClick(function()
    if Options.SnapVerifiedKey:GetState() then
        if SnapConn then return end

        SnapConn = RunService.RenderStepped:Connect(function()
            local rsPlayers = RS:FindFirstChild("Players")
            if not rsPlayers then return end

            for _, player in ipairs(Players:GetPlayers()) do
                if player == Players.LocalPlayer then continue end

                local char = player.Character
                if not char then continue end

                local hrp = char:FindFirstChild("HumanoidRootPart")
                if not hrp then continue end

                local entry = rsPlayers:FindFirstChild(player.Name)
                if not entry then continue end

                local status = entry:FindFirstChild("Status")
                if not status then continue end

                local uac = status:FindFirstChild("UAC")
                if not uac then continue end

                local pos = uac:GetAttribute("LastVerifiedPos")
                if typeof(pos) ~= "Vector3" then continue end

                hrp.Anchored = true
                hrp.CFrame = CFrame.new(pos)
            end
        end)
    else
        if SnapConn then
            SnapConn:Disconnect()
            SnapConn = nil
        end

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Players.LocalPlayer then
                local char = player.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.Anchored = false
                    end
                end
            end
        end
    end
end)


getgenv().UR_Enabled = getgenv().UR_Enabled or false
getgenv().UR_FireType = getgenv().UR_FireType or "On Remote"
getgenv().UR_Time = getgenv().UR_Time or 0.2
getgenv().UR_Amount = getgenv().UR_Amount or 8
getgenv().UR_Throttle = getgenv().UR_Throttle or 0.5
getgenv().resolving = false

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

local character
local hrp

local underground = false
local originalCFrame
local lastFire = 0

local function bindCharacter(char)
    character = char
    hrp = char:WaitForChild("HumanoidRootPart")
    underground = false
    originalCFrame = nil
end

bindCharacter(player.Character or player.CharacterAdded:Wait())
player.CharacterAdded:Connect(bindCharacter)

local function pulse()
    if not getgenv().UR_Enabled then return end
    local now = os.clock()
    if now - lastFire < getgenv().UR_Throttle then return end
    lastFire = now
    getgenv().resolving = true
end

task.spawn(function()
    while true do
        if getgenv().resolving and not underground and hrp then
            originalCFrame = hrp.CFrame
            hrp.CFrame = originalCFrame * CFrame.new(0, -getgenv().UR_Amount, 0)
            underground = true
            task.delay(getgenv().UR_Time, function()
                getgenv().resolving = false
            end)
        end

        if not getgenv().resolving and underground and hrp then
            hrp.CFrame = originalCFrame
            underground = false
        end

        task.wait()
    end
end)

UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if not getgenv().UR_Enabled then return end
    if getgenv().UR_FireType ~= "On Press" then return end

    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        pulse()
    end
end)

pcall(function()
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)

    mt.__namecall = newcclosure(function(self, ...)
        local args = {...}
        local success, method = pcall(getnamecallmethod)
        if success and method == "InvokeServer" and self.Name == "FireProjectile" then
            if getgenv().UR_Enabled and getgenv().UR_FireType == "On Remote" then
                pulse()
            end
        end
        return old(self, ...)
    end)

    setreadonly(mt, true)
end)

URBox:AddLabel("underground resolver"):AddKeyPicker("UR_Keybind", {
    Default = "None",
    Mode = "Toggle",
    SyncToggleState = false,
    Text = "underground resolver",
    Callback = function(state)
        getgenv().UR_Enabled = state
    end
})

URBox:AddDivider()

URBox:AddLabel('underground resolver settings')

URBox:AddDropdown("UR_FireType", {
    Text = "firetype",
    Tooltip = 'on remote is better but doesnt support solara',
    Values = { "On Press", "On Remote" },
    Default = 2
}):OnChanged(function()
    getgenv().UR_FireType = Options.UR_FireType.Value
end)

URBox:AddSlider("UR_Time", {
    Text = "timer",
    Tooltip = 'how long you will stay in the floor. long times can get you kicked.',
    Default = 0.2,
    Min = 0.01,
    Max = 1,
    Rounding = 2
}):OnChanged(function()
    getgenv().UR_Time = Options.UR_Time.Value
end)

URBox:AddSlider("UR_Amount", {
    Text = "distance",
    Tooltip = 'the amount you will fall into the floor',
    Default = 8,
    Min = 1,
    Max = 40,
    Rounding = 1
}):OnChanged(function()
    getgenv().UR_Amount = Options.UR_Amount.Value
end)

URBox:AddSlider("UR_Throttle", {
    Text = "debounce",
    Tooltip = 'the amount of time you have between floor entries. Too low can get you kicked',
    Default = 0.5,
    Min = 0,
    Max = 2,
    Rounding = 2
}):OnChanged(function()
    getgenv().UR_Throttle = Options.UR_Throttle.Value
end)





PlayerMovementGroup = Tabs.Player:AddLeftGroupbox('character')

PlayerMovementGroup:AddToggle('NoFallToggle', {
    Text = 'no fall damage',
    Default = false,
    Tooltip = 'uses state modifiers to prevent fall damage'
})

local NoFallEnabled = false
Toggles.NoFallToggle:OnChanged(function(Value)
    NoFallEnabled = Value
end)

RunService.Heartbeat:Connect(function()
    if not NoFallEnabled then return end

    local character = player.Character
    if not character then return end

    local humanoid = character:FindFirstChildOfClass('Humanoid')
    local rootPart = character:FindFirstChild('HumanoidRootPart')
    if not humanoid or not rootPart then return end

    local state = humanoid:GetState()
    if state == Enum.HumanoidStateType.Freefall then
        local velY = rootPart.AssemblyLinearVelocity.Y
        if velY < -12.5 then
            humanoid:ChangeState(Enum.HumanoidStateType.Landed)
        end
    end
end)

-- SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- PLAYER
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")
local Head = Character:WaitForChild("Head")

LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HRP = char:WaitForChild("HumanoidRootPart")
    Humanoid = char:WaitForChild("Humanoid")
    Head = char:WaitForChild("Head")
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer


-- ======================
-- UI
-- ======================

-- SPEEDHACK
PlayerMovementGroup:AddToggle('BoostToggle', {Text = 'speedhack', Default = false})

PlayerMovementGroup:AddDivider()
-- to make underground look hot


local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")

local player = Players.LocalPlayer
local cam = workspace.CurrentCamera
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

getgenv().blink = false
local fcOriginalCFrame
local fcOffset = Vector3.new()
local fcYaw, fcPitch = 0, 0
local fcSpeed = 50
local mouseSensitivity = 0.2
local move = Vector3.new()
local freecamActive = false

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local character
local hrp
local cam = workspace.CurrentCamera

local function bindCharacter(char)
	character = char
	hrp = char:WaitForChild("HumanoidRootPart")
	freecamActive = false
	fcOffset = Vector3.new()
	move = Vector3.new()
end

bindCharacter(player.Character or player.CharacterAdded:Wait())
player.CharacterAdded:Connect(bindCharacter)

PlayerMovementGroup:AddLabel('blink'):AddKeyPicker('BlinkKey', {
	Default = 'None',
	SyncToggleState = false,
	Mode = 'Toggle',
	Text = 'blink',
	Callback = function() end
})

Options.BlinkKey:OnClick(function()
	getgenv().blink = Options.BlinkKey:GetState()
end)

UIS.InputBegan:Connect(function(input, gp)
	if gp or not getgenv().blink then return end
	if input.KeyCode == Enum.KeyCode.W then move = move + Vector3.new(0,0,1) end
	if input.KeyCode == Enum.KeyCode.S then move = move + Vector3.new(0,0,-1) end
	if input.KeyCode == Enum.KeyCode.A then move = move + Vector3.new(-1,0,0) end
	if input.KeyCode == Enum.KeyCode.D then move = move + Vector3.new(1,0,0) end
	if input.KeyCode == Enum.KeyCode.Space then move = move + Vector3.new(0,1,0) end
	if input.KeyCode == Enum.KeyCode.LeftControl then move = move + Vector3.new(0,-1,0) end
end)

UIS.InputEnded:Connect(function(input, gp)
	if gp or not getgenv().blink then return end
	if input.KeyCode == Enum.KeyCode.W then move = move - Vector3.new(0,0,1) end
	if input.KeyCode == Enum.KeyCode.S then move = move - Vector3.new(0,0,-1) end
	if input.KeyCode == Enum.KeyCode.A then move = move - Vector3.new(-1,0,0) end
	if input.KeyCode == Enum.KeyCode.D then move = move - Vector3.new(1,0,0) end
	if input.KeyCode == Enum.KeyCode.Space then move = move - Vector3.new(0,1,0) end
	if input.KeyCode == Enum.KeyCode.LeftControl then move = move - Vector3.new(0,-1,0) end
end)

UIS.InputChanged:Connect(function(input)
	if not getgenv().blink then return end
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		fcYaw = fcYaw - input.Delta.X * mouseSensitivity
		fcPitch = math.clamp(fcPitch - input.Delta.Y * mouseSensitivity, -89, 89)
	end
end)

RS.RenderStepped:Connect(function(dt)
	if getgenv().blink then
		if not freecamActive then
			fcOriginalCFrame = cam.CFrame
			fcOffset = Vector3.new()
			local pitch, yaw = fcOriginalCFrame:ToEulerAnglesYXZ()
			fcPitch = math.deg(pitch)
			fcYaw = math.deg(yaw)
			freecamActive = true
			move = Vector3.new()
		end

		local yawCF = CFrame.Angles(0, math.rad(fcYaw), 0)
		local delta = (yawCF.RightVector * move.X + Vector3.new(0, move.Y, 0) + yawCF.LookVector * move.Z) * fcSpeed * dt
		fcOffset = fcOffset + delta

		cam.CFrame =
			CFrame.fromEulerAnglesYXZ(math.rad(fcPitch), math.rad(fcYaw), 0)
			+ (fcOriginalCFrame.Position + fcOffset)
	else
		if freecamActive and hrp then
			hrp.CFrame = hrp.CFrame + fcOffset
			freecamActive = false
			fcOffset = Vector3.new()
		end
	end
end)








PlayerMovementGroup:AddLabel('semi underground'):AddKeyPicker('UndergroundKey', {
    Default = 'None',
    Mode = 'Toggle',
    Text = 'underground'
})

local defaultHipHeight = 2

game:GetService("RunService").RenderStepped:Connect(function()
    local Player = game.Players.LocalPlayer
    local Character = Player.Character
    if not Character then return end

    local Humanoid = Character:FindFirstChild("Humanoid")
    if not Humanoid then return end

    if Options.UndergroundKey:GetState() then
        Humanoid.HipHeight = 0.01
    else
        Humanoid.HipHeight = defaultHipHeight
    end
end)

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

PlayerMovementGroup:AddLabel('peek kill'):AddKeyPicker('TPKillBind', {
    Default = 'None',
    NoUI = false,
    Text = 'peek kill',
    Mode = 'Hold',
    Callback = function() end,
})

task.spawn(function()
    while true do
        task.wait()
        if Library.Unloaded then break end

        if Options.TPKillBind:GetState() then
            if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = lp.Character.HumanoidRootPart
                hrp.Velocity = Vector3.new(hrp.Velocity.X, (r39_0 and r39_0.TPKillSpeed or 100) + math.random(-15,15), hrp.Velocity.Z)
            end
        end
    end
end)


-- SPEEDHACK BIND

    local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer

local Character
local HRP
local Humanoid
local Head

local function bindCharacter(char)
    Character = char
    HRP = char:WaitForChild("HumanoidRootPart")
    Humanoid = char:WaitForChild("Humanoid")
    Head = char:WaitForChild("Head")
end

bindCharacter(player.Character or player.CharacterAdded:Wait())
player.CharacterAdded:Connect(bindCharacter)

-- SPEEDHACK
PlayerMovementGroup:AddLabel('speedhack'):AddKeyPicker('BoostKey', {Default = 'None', Mode = 'Hold', Text = 'speedhack'})

-- SPIDERMAN
PlayerMovementGroup:AddLabel('spiderman'):AddKeyPicker('SpidermanKey', {Default = 'None', Mode = 'Hold', Text = 'spiderman'})

-- CFAME HOP
PlayerMovementGroup:AddLabel('bunnyhop (cframe)'):AddKeyPicker('HeightSpamKey', {Default = 'None', Mode = 'Toggle', Text = 'cframe bunnyhop', SyncToggleState = true})
PlayerMovementGroup:AddDivider()

PlayerMovementGroup:AddSlider('BoostAmount', {Text = 'speed multiplier', Default = 0.5, Min = 0.1, Max = 1.5, Rounding = 3})
PlayerMovementGroup:AddSlider('SpidermanSpeed', {Text = 'spiderman speed', Default = 0.25, Min = 0.05, Max = 5, Rounding = 2})

PlayerMovementGroup:AddToggle('HeightSpamToggle', {Text = 'cframe hop', Default = false})
PlayerMovementGroup:AddSlider('HeightSpamInterval', {Text = 'hop interval', Default = 0.5, Min = 0.067, Max = 0.67, Rounding = 2})
PlayerMovementGroup:AddSlider('HeightSpamAmount', {Text = 'hop height', Default = 2, Min = 1, Max = 10, Rounding = 1})
Options.HeightSpamKey:OnClick(function() Toggles.HeightSpamToggle:SetValue(not Toggles.HeightSpamToggle.Value) end)

-- AUTOCLIMB
PlayerMovementGroup:AddDivider()
PlayerMovementGroup:AddToggle('AutoClimbToggle', {Text = 'autoclimb', Default = false, Callback = function(v) getgenv().AutoClimbEnabled = v end})
getgenv().AutoClimbEnabled = false

-- AUTOCLIMB VARS
local climbHeight = 10
local climbSpeed = 0.15
local backOffset = 0.5
local extraHeight = 3
local maxWidth = 50
local climbing = false
local climbTargetY = 0

local function getTopY(part)
    return part.Position.Y + (part:IsA("BasePart") and part.Size.Y / 2 or 0) + extraHeight
end

local function isTooThick(part)
    if not part:IsA("BasePart") then return false end
    return math.max(part.Size.X, part.Size.Z) > maxWidth
end

local function temporarilyRemovePart(part)
    if not part or not part:IsA("BasePart") then return end
    local parent = part.Parent
    part.Parent = game:GetService("ReplicatedStorage")
    task.delay(0.5, function()
        if part then part.Parent = parent end
    end)
end

-- HEIGHTSPAM TIMER
local heightSpamTimer = 0

-- MOVEMENT PIPELINE
RunService.RenderStepped:Connect(function(dt)
    if not Character or not HRP or not Humanoid or Humanoid.Health <= 0 then return end

    -- SPEEDHACK
    if Toggles.BoostToggle.Value and Options.BoostKey:GetState() then
        local dir = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += HRP.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= HRP.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= HRP.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += HRP.CFrame.RightVector end
        if dir.Magnitude > 0 then
            HRP.CFrame += dir.Unit * Options.BoostAmount.Value * dt * 60
        end
    end

    -- SPIDERMAN
    if Options.SpidermanKey:GetState() then
        HRP.CFrame += Vector3.new(0, Options.SpidermanSpeed.Value * dt * 60, 0)
    end

    -- AUTOCLIMB
    if getgenv().AutoClimbEnabled then
        if not climbing then
            local rayParams = RaycastParams.new()
            rayParams.FilterDescendantsInstances = {Character}
            rayParams.FilterType = Enum.RaycastFilterType.Blacklist
            local result = Workspace:Raycast(HRP.Position + Vector3.new(0,1,0), HRP.CFrame.LookVector * 3, rayParams)
            if result and not isTooThick(result.Instance) then
                local topY = getTopY(result.Instance)
                local diff = topY - HRP.Position.Y
                if diff > 0 and diff <= climbHeight then
                    HRP.CFrame = HRP.CFrame:Lerp(HRP.CFrame - HRP.CFrame.LookVector * backOffset, 0.5)
                    climbing = true
                    climbTargetY = topY
                end
            end
        else
            local newY = HRP.Position.Y + climbSpeed
            if newY >= climbTargetY then
                HRP.CFrame = CFrame.new(HRP.Position.X, climbTargetY, HRP.Position.Z)
                climbing = false
            else
                HRP.CFrame = CFrame.new(HRP.Position.X, newY, HRP.Position.Z)
            end
        end
    end

    -- HEIGHTSPAM
    if Toggles.HeightSpamToggle.Value then
        heightSpamTimer += dt
        if heightSpamTimer >= Options.HeightSpamInterval.Value then
            heightSpamTimer = 0
            HRP.CFrame += Vector3.new(0, Options.HeightSpamAmount.Value, 0)
            local params = RaycastParams.new()
            params.FilterDescendantsInstances = {Character}
            params.FilterType = Enum.RaycastFilterType.Blacklist
            local hit = Workspace:Raycast(Head.Position, Vector3.new(0,1,0) * 2, params)
            if hit and hit.Instance then temporarilyRemovePart(hit.Instance) end
        end
    end
end)




PlayerMovementGroup:AddDivider()

PlayerMovementGroup:AddToggle('JumpCooldownToggle', {
    Text = 'bhop',
    Tooltip = 'deletes jump cooldowns to allow you to hold space to jump',
    Default = getgenv().JumpCooldownToggle,
    Callback = function(Value)
        getgenv().JumpCooldownToggle = Value
    end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local WalkTask

local function GetHumanoid()
    local c = LocalPlayer.Character
    if not c then return end
    return c:FindFirstChildOfClass("Humanoid")
end

PlayerMovementGroup:AddToggle('WS_Enabled', {
    Text = 'omnisprint',
    Default = false
})

PlayerMovementGroup:AddSlider('WS_Value', {
    Text = 'omniwalkspeed',
    Default = 20,
    Tooltip = 'ONLY GO ABOVE 20 IF YOU HAVE ANTICHEAT BYPASS ON',
    Min = 16.2,
    Max = 30,
    Rounding = 1
})

local function ApplyWS()
    local h = GetHumanoid()
    if h and Toggles.WS_Enabled.Value then
        h.WalkSpeed = Options.WS_Value.Value
    end
end

Toggles.WS_Enabled:OnChanged(function()
    if Toggles.WS_Enabled.Value then
        if not WalkTask then
            WalkTask = task.spawn(function()
                while Toggles.WS_Enabled.Value do
                    ApplyWS()
                    task.wait(0.2)
                end
                WalkTask = nil
            end)
        end
    end
end)

Options.WS_Value:OnChanged(function()
    ApplyWS()
end)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    ApplyWS()
end)

PlayerMovementGroup:AddDivider()


local RunService = game:GetService('RunService')
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer

PlayerMovementGroup:AddToggle('YawChanger', {
    Text = 'antiaim',
    Tooltip = 'read the slider below me',
    Default = false
})

PlayerMovementGroup:AddSlider('YawValue', {
    Text = 'y rotation',
    Tooltip = 'sets your characters rotation. -160 = looking down, 160 = looking up',
    Default = 0,
    Min = -160,
    Max = 160,
    Rounding = 1
})

PlayerMovementGroup:AddToggle('RandomYaw', {
    Text = 'spin yaw',
    Default = false
})

PlayerMovementGroup:AddToggle('ZeroTilt', {
    Text = 'amogus',
    Tooltip = 'TURN OFF ANTIAIM FIRST | removes your head and puts your arms inside of your body, making you very hard to hit. does make you look likee a fucking chicken nugget tho',
    Default = false
})
local ZeroTiltActive = false

Toggles.ZeroTilt:OnChanged(function(Value)
    ZeroTiltActive = Value
    if not Value then
        local success, remote = pcall(function()
            return game:GetService("ReplicatedStorage").Remotes.UpdateTilt
        end)
        if success and remote then
            remote:FireServer(0)
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if Library.Unloaded then return end
    local char = game.Players.LocalPlayer.Character
    if not char then return end
    if ZeroTiltActive and not Toggles.YawChanger.Value then
        local success, remote = pcall(function()
            return game:GetService("ReplicatedStorage").Remotes.UpdateTilt
        end)
        if success and remote then
            remote:FireServer(0/0)
        end
    end
end)

PlayerMovementGroup:AddToggle('CrouchToggle', {
    Text = 'force crouch',
    Tooltip = 'toggles Humanoid Crouch attribute, use with underground',
    Default = false,
    Callback = function(value)
        getgenv().CrouchEnabled = value
        local lp = game:GetService("Players").LocalPlayer
        local function apply()
            local char = lp.Character
            if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum:SetAttribute("Crouch", value)
            end
        end
        apply()
    end
})

local lp = game:GetService("Players").LocalPlayer
lp.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid"):SetAttribute("Crouch", getgenv().CrouchEnabled)
end)





local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera

getgenv().RotationMovementEnabled = true
getgenv().FlipEnabled = false
getgenv().FlipSpeed = 24

local function getHRP()
	local char = player.Character or player.CharacterAdded:Wait()
	return char:WaitForChild("HumanoidRootPart")
end

local hrp = getHRP()
player.CharacterAdded:Connect(function()
	hrp = getHRP()
end)

local input = { forward=false, backward=false, left=false, right=false }

UserInputService.InputBegan:Connect(function(key, processed)
	if processed then return end
	if key.KeyCode == Enum.KeyCode.W then input.forward = true end
	if key.KeyCode == Enum.KeyCode.S then input.backward = true end
	if key.KeyCode == Enum.KeyCode.A then input.left = true end
	if key.KeyCode == Enum.KeyCode.D then input.right = true end
end)

UserInputService.InputEnded:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.W then input.forward = false end
	if key.KeyCode == Enum.KeyCode.S then input.backward = false end
	if key.KeyCode == Enum.KeyCode.A then input.left = false end
	if key.KeyCode == Enum.KeyCode.D then input.right = false end
end)

local defaultCFrame

Options.FlipSpeed = PlayerMovementGroup:AddSlider('flip_speed', {
	Text = 'flip speed',
	Default = 24,
	Min = 15,
	Max = 27,
	Rounding = 1,
	Callback = function(value)
		getgenv().FlipSpeed = value
	end
})

Options.FlipBind = PlayerMovementGroup:AddLabel('flip'):AddKeyPicker('flip_bind', {
	Default = 'None',
	SyncToggleState = false,
	Mode = 'Toggle',
	Text = 'flip antiaim',
	Callback = function()
		getgenv().FlipEnabled = not getgenv().FlipEnabled
		if getgenv().FlipEnabled then
			defaultCFrame = hrp.CFrame
		else
			if defaultCFrame then
				hrp.CFrame = CFrame.new(hrp.Position, hrp.Position + defaultCFrame.LookVector)
			end
		end
	end
})

RunService.RenderStepped:Connect(function(dt)
	if not hrp or not getgenv().RotationMovementEnabled then return end
	if not getgenv().FlipEnabled then return end

	local moveVector = Vector3.new()
	if input.forward then moveVector = moveVector + camera.CFrame.LookVector end
	if input.backward then moveVector = moveVector - camera.CFrame.LookVector end
	if input.left then moveVector = moveVector - camera.CFrame.RightVector end
	if input.right then moveVector = moveVector + camera.CFrame.RightVector end

	if moveVector.Magnitude > 0 then
		moveVector = moveVector.Unit * getgenv().FlipSpeed * dt
	end

	hrp.CFrame = CFrame.new(hrp.Position + moveVector) * CFrame.Angles(0, math.rad(getgenv().FlipSpeed), math.rad(180))
end)




PlayerMovementGroup:AddDivider()

local UPAngleChanger = false
local UPAngleValue = 0
local RandomYawActive = false

Toggles.YawChanger:OnChanged(function()
    UPAngleChanger = Toggles.YawChanger.Value
end)

Options.YawValue:OnChanged(function()
    UPAngleValue = Options.YawValue.Value
end)

Toggles.RandomYaw:OnChanged(function()
    RandomYawActive = Toggles.RandomYaw.Value
end)

RunService.RenderStepped:Connect(function()
    if Library.Unloaded then return end
    local char = LocalPlayer.Character
    if not char then return end

    if UPAngleChanger then
        if RandomYawActive then
            if UPAngleValue == 160 then
                UPAngleValue = -160
            else
                UPAngleValue = 160
            end
        end

        local success, remote = pcall(function()
            return game:GetService("ReplicatedStorage").Remotes.UpdateTilt
        end)
        if success and remote then
            remote:FireServer(UPAngleValue or 0)
        end
    end
end)

PlayerMovementGroup:AddSlider('JumpHeightSlider', {
    Text = 'JumpHeight',
    Default = 3.29,
    Tooltip = 'ONLY GO ABOVE 5 IF YOU HAVE ANTICHEAT BYPASS ON',
    Min = 3.29,
    Max = 10,
    Rounding = 2,
    Compact = false,
})
Options.JumpHeightSlider:OnChanged(function()
    local char = game.Players.LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    hum.UseJumpPower = false
    hum.JumpHeight = Options.JumpHeightSlider.Value
end)




local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local GearTask

local function GetHRP()
    local c = LocalPlayer.Character
    if not c then return end
    return c:FindFirstChild("HumanoidRootPart")
end

PlayerMovementGroup:AddToggle('GearWeightZero', {
    Text = 'remove gear weight',
    Tooltip = 'makes your movement speed act like you are a freshie no matter the gear youre wearing.',
    Default = false
})

local function ApplyGearWeight()
    local hrp = GetHRP()
    if hrp and Toggles.GearWeightZero.Value then
        hrp:SetAttribute("GearWeight", 0)
    end
end

Toggles.GearWeightZero:OnChanged(function()
    if Toggles.GearWeightZero.Value then
        if not GearTask then
            GearTask = task.spawn(function()
                while Toggles.GearWeightZero.Value do
                    ApplyGearWeight()
                    task.wait(0.5)
                end
                GearTask = nil
            end)
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    ApplyGearWeight()
end)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local spinning = false
PlayerMovementGroup:AddToggle('SpinToggle', {
    Text = 'spinbot',
    Default = false,
    Tooltip = 'beta feature 💀',
    Callback = function(Value)
        spinning = Value
    end
})

task.spawn(function()
    while true do
        if spinning and character and character.Parent then
            for _, part in ipairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CFrame = part.CFrame * CFrame.Angles(0, math.rad(10), 0)
                end
            end
        end
        task.wait(0.03)
    end
end)

loadstring(game:HttpGet("https://pastebin.com/raw/RCz3i3rG"))()
CamGroup = Tabs.Player:AddRightGroupbox('Camera')

local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local ZoomFOV = 10
local Zooming = false
local OriginalFOV = Camera.FieldOfView
local LastState = false

CamGroup:AddSlider('ZoomFOVSlider', {
    Text = 'zoom fov',
    Default = 10,
    Min = 1,
    Max = 120,
    Rounding = 0
})

Options.ZoomFOVSlider:OnChanged(function()
    ZoomFOV = Options.ZoomFOVSlider.Value
    if Zooming then
        Camera.FieldOfView = ZoomFOV
    end
end)

CamGroup:AddLabel('zoom'):AddKeyPicker('ZoomBind', {
    Default = 'None',
    Mode = 'Hold',
    Text = 'zoom'
})

RunService.RenderStepped:Connect(function()
    local State = Options.ZoomBind:GetState()
    local Mode = Options.ZoomBind.Mode

    if Mode == 'Always' then
        if not Zooming then
            Zooming = true
            OriginalFOV = Camera.FieldOfView
        end
        Camera.FieldOfView = ZoomFOV
        return
    end

    if State and not Zooming then
        Zooming = true
        OriginalFOV = Camera.FieldOfView
        Camera.FieldOfView = ZoomFOV
    elseif not State and Zooming then
        Zooming = false
        Camera.FieldOfView = OriginalFOV
    end

    LastState = State
end)


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local FOVRenderStepped
local FOV_THRESHOLD = 89
local Scrolling = false

CamGroup:AddToggle('FOVEnabled', {
    Text = 'fov editor',
    Default = false
})

CamGroup:AddSlider('FOVSlider', {
    Text = 'fov',
    Default = 90,
    Min = 90,
    Max = 120,
    Rounding = 0
})

CamGroup:AddToggle('FOVScrollToggle', {
    Text = 'scroll zoom',
    Default = false
})

CamGroup:AddSlider('FOVSensitivity', {
    Text = 'scroll sensitivity',
    Default = 10,
    Min = 1,
    Max = 50,
    Rounding = 1
})

local function ApplyFOV()
    if not Toggles.FOVEnabled.Value then return end
    if Camera.FieldOfView > FOV_THRESHOLD and not Scrolling then
        Camera.FieldOfView = Options.FOVSlider.Value
    end
end

local function StartFOVLoop()
    if FOVRenderStepped then FOVRenderStepped:Disconnect() end
    FOVRenderStepped = RunService.RenderStepped:Connect(ApplyFOV)
end

local function StopFOVLoop()
    if FOVRenderStepped then
        FOVRenderStepped:Disconnect()
        FOVRenderStepped = nil
    end
end

Toggles.FOVEnabled:OnChanged(function()
    if Toggles.FOVEnabled.Value then
        StartFOVLoop()
    else
        StopFOVLoop()
    end
end)

Options.FOVSlider:OnChanged(function()
    if Toggles.FOVEnabled.Value then
        StartFOVLoop()
    end
end)

Toggles.FOVScrollToggle:OnChanged(function(Value)
    if Value then
        if getgenv().FOVScrollConnection then getgenv().FOVScrollConnection:Disconnect() end

        getgenv().FOVScrollConnection =
            UserInputService.InputChanged:Connect(function(input)
                if input.UserInputType ~= Enum.UserInputType.MouseWheel then return end

                Scrolling = true
                Camera.FieldOfView = math.clamp(
                    Camera.FieldOfView - input.Position.Z * Options.FOVSensitivity.Value,
                    5,
                    120
                )

                task.defer(function()
                    task.wait(0.2)
                    Scrolling = false
                end)
            end)
    else
        Scrolling = false
        if getgenv().FOVScrollConnection then
            getgenv().FOVScrollConnection:Disconnect()
            getgenv().FOVScrollConnection = nil
        end
    end
end)



local Players = game:GetService("Players")
local RunService = game:GetService("RunService") 

local LocalPlayer = Players.LocalPlayer

CamGroup:AddToggle('DisableParallax', {
    Text = 'no suppression vignette',
    Tooltip = 'removes the effect that applies when you are shot at.',
    Default = false,
    Callback = function(Value)
        if Value then
            Toggles.DisableParallax.Connection = RunService.RenderStepped:Connect(function()
                local parallax = LocalPlayer:FindFirstChild("PlayerGui")
                    and LocalPlayer.PlayerGui:FindFirstChild("NoInsetGui")
                    and LocalPlayer.PlayerGui.NoInsetGui:FindFirstChild("MainFrame")
                    and LocalPlayer.PlayerGui.NoInsetGui.MainFrame:FindFirstChild("ScreenEffects")
                    and LocalPlayer.PlayerGui.NoInsetGui.MainFrame.ScreenEffects:FindFirstChild("Parallax")
                    and LocalPlayer.PlayerGui.NoInsetGui.MainFrame.ScreenEffects.Parallax:FindFirstChild("Parallax")
                
                if parallax then
                    parallax.Visible = false
                end
            end)
        else
            if Toggles.DisableParallax.Connection then
                Toggles.DisableParallax.Connection:Disconnect()
                Toggles.DisableParallax.Connection = nil
            end
        end
    end
})

local player = game.Players.LocalPlayer
local visor = player:WaitForChild("PlayerGui")
    :WaitForChild("NoInsetGui")
    :WaitForChild("MainFrame")
    :WaitForChild("ScreenEffects")
    :WaitForChild("Visor")

CamGroup:AddToggle('HideVisor', {
    Text = 'no visor',
    Tooltip = 'FIXED',
    Default = false
})

task.spawn(function()
    while true do
        if Toggles.HideVisor.Value then
            for _, v in ipairs(visor:GetChildren()) do
                if v:IsA("GuiObject") then
                    v.Visible = false
                end
            end
        end
        task.wait(0.5)
    end
end)



local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local cam = workspace.CurrentCamera

local freecamActive = false
local freecamSpeed = 60
local freecamSens = 0.01

local move = {W=false,A=false,S=false,D=false,E=false,Q=false}
local yaw = 0
local pitch = 0

local function setFreecam(state)
	freecamActive = state

	if freecamActive then
		cam.CameraType = Enum.CameraType.Scriptable
		uis.MouseBehavior = Enum.MouseBehavior.LockCenter
		uis.MouseIconEnabled = false

		local look = cam.CFrame.LookVector
		yaw = math.atan2(-look.X, -look.Z)
		pitch = math.asin(look.Y)
	else
		cam.CameraType = Enum.CameraType.Custom
		uis.MouseBehavior = Enum.MouseBehavior.Default
		uis.MouseIconEnabled = true
	end
end

uis.InputBegan:Connect(function(input, g)
	if g then return end
	if move[input.KeyCode.Name] ~= nil then
		move[input.KeyCode.Name] = true
	end
end)

uis.InputEnded:Connect(function(input)
	if move[input.KeyCode.Name] ~= nil then
		move[input.KeyCode.Name] = false
	end
end)

rs.RenderStepped:Connect(function(dt)
	if not freecamActive then return end

	local delta = uis:GetMouseDelta()
	yaw -= delta.X * freecamSens
	pitch -= delta.Y * freecamSens
	pitch = math.clamp(pitch, -1.55, 1.55)

	local rot = CFrame.fromOrientation(pitch, yaw, 0)
	local dir = Vector3.zero

	if move.W then dir += Vector3.new(0,0,-1) end
	if move.S then dir += Vector3.new(0,0,1) end
	if move.A then dir += Vector3.new(-1,0,0) end
	if move.D then dir += Vector3.new(1,0,0) end
	if move.E then dir += Vector3.new(0,1,0) end
	if move.Q then dir += Vector3.new(0,-1,0) end

	if dir.Magnitude > 0 then
		dir = dir.Unit
	end

	local pos = cam.CFrame.Position + rot:VectorToWorldSpace(dir) * freecamSpeed * dt
	cam.CFrame = CFrame.new(pos) * rot
	cam.Focus = cam.CFrame * CFrame.new(0,0,-1)
end)

CamGroup:AddLabel('freecam bind'):AddKeyPicker('freecam_bind',{
	Default = 'None',
	Mode = 'Toggle',
	Text = 'freecam',
	Tooltip = 'Toggle freecam',
	Callback = function()
		setFreecam(not freecamActive)
	end
})

CamGroup:AddSlider('freecam_speed',{
	Text = 'freecam speed',
	Default = freecamSpeed,
	Min = 10,
	Max = 500,
	Rounding = 1,
	Callback = function(v)
		freecamSpeed = v
	end
})

CamGroup:AddSlider('freecam_sens',{
	Text = 'freecam sens',
	Default = freecamSens,
	Min = 0.001,
	Max = 0.05,
	Rounding = 3,
	Callback = function(v)
		freecamSens = v
	end
})

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local cameraToggle = CamGroup:AddToggle('Camerashy', {
    Text = 'camerashy',
    Default = false,
    Callback = function() end
})

local storedParts = {}
local loopThread

local function isIgnored(part)
    return part:FindFirstAncestor("Visor") ~= nil
end

local function applyCamerashy(character)
    for _, part in pairs(character:GetDescendants()) do
        if (part:IsA("BasePart") or part:IsA("MeshPart"))
        and not storedParts[part]
        and not isIgnored(part) then

            storedParts[part] = {
                material = part.Material,
                color = part.Color,
                transparency = part.Transparency,
                surfaceAppearances = {}
            }

            for _, sa in pairs(part:GetChildren()) do
                if sa:IsA("SurfaceAppearance") then
                    table.insert(storedParts[part].surfaceAppearances, sa)
                    sa:Destroy()
                end
            end

            part.Material = Enum.Material.ForceField
            part.Color = getgenv().PlayerESP_Color or Color3.fromRGB(255,255,255)
            part.Transparency = 0.9
        end
    end
end

local function restoreCamerashy()
    for part, data in pairs(storedParts) do
        if part and part.Parent then
            part.Material = data.material
            part.Color = data.color
            part.Transparency = data.transparency
            for _, sa in pairs(data.surfaceAppearances) do
                sa.Parent = part
            end
        end
    end
    storedParts = {}
end

cameraToggle:OnChanged(function(state)
    if state then
        if lp.Character then
            applyCamerashy(lp.Character)
        end
        loopThread = task.spawn(function()
            while cameraToggle.Value do
                task.wait(5)
                if lp.Character then
                    applyCamerashy(lp.Character)
                end
            end
        end)
    else
        restoreCamerashy()
    end
end)

lp.CharacterAdded:Connect(function(char)
    if cameraToggle.Value then
        task.wait(1)
        applyCamerashy(char)
    end
end)


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

getgenv().ThirdPersonEnabled = false
getgenv().ThirdPersonDistance = 12

CamGroup:AddToggle('ThirdPersonToggle', {
    Text = 'third person',
    Default = false,
    Visible = false
})

CamGroup:AddSlider('ThirdPersonDistance', {
    Text = 'third person distance',
    Default = 12,
    Min = 4,
    Max = 30,
    Rounding = 1
})


local function ApplyCamera()
    if getgenv().ThirdPersonEnabled then
        if LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
            LocalPlayer.CameraMode = Enum.CameraMode.Classic
        end
        LocalPlayer.CameraMinZoomDistance = getgenv().ThirdPersonDistance
        LocalPlayer.CameraMaxZoomDistance = getgenv().ThirdPersonDistance
        LocalPlayer.DevComputerCameraMode = Enum.DevComputerCameraMovementMode.CameraToggle
    else
        if LocalPlayer.CameraMode == Enum.CameraMode.Classic then
            LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
        end
        LocalPlayer.CameraMinZoomDistance = 0
        LocalPlayer.CameraMaxZoomDistance = 0
    end
end

Toggles.ThirdPersonToggle:OnChanged(function()
    getgenv().ThirdPersonEnabled = Toggles.ThirdPersonToggle.Value
    ApplyCamera()
end)

Options.ThirdPersonDistance:OnChanged(function()
    getgenv().ThirdPersonDistance = Options.ThirdPersonDistance.Value
    if getgenv().ThirdPersonEnabled then
        ApplyCamera()
    end
end)



local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

CamGroup:AddToggle('CamOffsetToggle', {
    Text = 'offset',
    Default = false,
    Tooltip = 'Toggles camera offset on/off'
})

CamGroup:AddLabel('toggle offset'):AddKeyPicker('CamOffsetKeybind', {
    Default = 'None',
    SyncToggleState = true,
    Tooltip = 'toggles between adding the offsets to the camera and normal pov. you can use it for zoom/fov changer and third person.',
    Mode = 'Toggle',
    Text = 'camoffset',
    Callback = function(state)
        Toggles.CamOffsetToggle:SetValue(state)
    end
})

CamGroup:AddSlider('CamOffsetX', {Text='camera X offset', Default=0, Min=0, Max=90, Rounding=1})
CamGroup:AddSlider('CamOffsetY', {Text='camera Y offset', Default=0, Min=0, Max=90, Rounding=1})
CamGroup:AddSlider('CamOffsetZ', {Text='camera Z offset', Default=0, Min=-90, Max=90, Rounding=1})

RunService.RenderStepped:Connect(function()
    if Toggles.CamOffsetToggle.Value then
        Camera.CFrame = Camera.CFrame * CFrame.new(
            Options.CamOffsetX.Value,
            Options.CamOffsetY.Value,
            Options.CamOffsetZ.Value
        )
    end
end)


local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local cam = Workspace:WaitForChild("Camera")

local dot = Drawing.new("Circle")
dot.Radius = 5
dot.Filled = false
dot.Thickness = 2
dot.Color = getgenv().PlayerESP_Color or Color3.new(1,0,0)
dot.Visible = false

local active = false

local function getItemRoot()
    local item = cam:FindFirstChild("ViewModel") and cam.ViewModel:FindFirstChild("Item")
    return item and item:FindFirstChild("ItemRoot")
end

-- Convert world position to screen
local function worldToScreen(pos)
    local screenPoint = workspace.CurrentCamera:WorldToViewportPoint(pos)
    return Vector2.new(screenPoint.X, screenPoint.Y), screenPoint.Z > 0
end
local function getCameraDescendants()
    local desc = cam:GetDescendants()
    local tbl = {}
    for _, v in ipairs(desc) do
        if v:IsA("BasePart") then
            table.insert(tbl, v)
        end
    end
    return tbl
end

local function updateDot()
    local ignoreList = getCameraDescendants()

    while active do
        local root = getItemRoot()
        if root then
            local origin = root.Position
            local direction = root.CFrame.LookVector * 500
            local raycastParams = RaycastParams.new()
            raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
            raycastParams.FilterDescendantsInstances = ignoreList

            local rayResult = Workspace:Raycast(origin, direction, raycastParams)
            local targetPos = rayResult and rayResult.Position or (origin + direction)

            local screenPos, onScreen = worldToScreen(targetPos)
            dot.Position = screenPos
            dot.Visible = onScreen
            dot.Color = getgenv().PlayerESP_Color or Color3.new(1,0,0)
        else
            dot.Visible = false
        end

        task.wait(0.025)
    end
end

CamGroup:AddToggle("AimbotDot", {
    Text = "hit preview",
    Default = false
})

Toggles.AimbotDot:OnChanged(function()
    if Toggles.AimbotDot.Value then
        active = true
        task.spawn(updateDot)
    else
        active = false
        dot.Visible = false
    end
end)



end
local function Cam()


-- ===== UI Settings =====

local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local UIS = game:GetService('UserInputService')
local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera

getgenv().PlayerESP_Color = getgenv().PlayerESP_Color or Color3.new(1,1,1)

local drawings = {}
for i = 1, 6 do
    local d = Drawing.new('Text')
    d.Visible = false
    d.Outline = true
    d.Font = 3
    d.Color = getgenv().PlayerESP_Color
    d.OutlineColor = Color3.new(0,0,0)
    d.Center = true
    drawings[i] = d
end

local showing = true
local function updateDrawingsVisibility()
    for _, d in ipairs(drawings) do
        d.Visible = showing and Toggles.targetinfo_enabled.Value
    end
end

Options.targetinfo_bind:OnClick(function()
    if not Toggles.targetinfo_enabled.Value then return end
    if Options.targetinfo_bind.Mode == 'Toggle' then
        showing = not showing
        updateDrawingsVisibility()
    end
end)

Options.targetinfo_bind:OnChanged(function(New)
end)

Toggles.targetinfo_enabled:OnChanged(function()
    if not Toggles.targetinfo_enabled.Value then
        showing = true
        updateDrawingsVisibility()
    end
end)

local function findClosestP()
    local mousePos = UIS:GetMouseLocation()
    local closest, dist = nil, math.huge
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') then
            local pos, onScreen = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
            if onScreen then
                local d = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                if d < dist then
                    dist = d
                    closest = plr
                end
            end
        end
    end
    return closest
end

local function isVisible(targetHead)
    local origin = Camera.CFrame.Position
    local direction = (targetHead.Position - origin)
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {LP.Character}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    local result = workspace:Raycast(origin, direction, raycastParams)
    if result then
        return result.Instance:IsDescendantOf(targetHead.Parent)
    else
        return true
    end
end

task.spawn(function()
    while true do
        task.wait(0.025)

        if not Toggles.targetinfo_enabled.Value or not showing then
            for _, d in ipairs(drawings) do d.Visible = false end
            continue
        end

        local target = findClosestP()
        if not target or not target.Character then
            for _, d in ipairs(drawings) do d.Visible = false end
            continue
        end

        local head = target.Character:FindFirstChild('Head')
        local hum = target.Character:FindFirstChildOfClass('Humanoid')
        local hrp = target.Character:FindFirstChild('HumanoidRootPart')
        if not head or not hum or not hrp then
            for _, d in ipairs(drawings) do d.Visible = false end
            continue
        end

        local size = Options.targetinfo_size.Value
        local yOffset = Options.targetinfo_yoffset.Value
        local index = 1

        local function push(text)
            local d = drawings[index]
            d.Size = size
            d.Text = tostring(text)
            d.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2 + yOffset + (index-1)*(size+2))
            d.Color = getgenv().PlayerESP_Color
            d.Visible = true
            index += 1
        end

        for i = index, #drawings do drawings[i].Visible = false end

        if Toggles.targetinfo_name.Value then push(string.lower(target.Name)) end
        if Toggles.targetinfo_visible.Value then push(isVisible(head) and 'visible' or 'hidden') end
        if Toggles.targetinfo_moving.Value then
            local vel = hrp.Velocity
            push(Vector3.new(vel.X,0,vel.Z).Magnitude > 1 and 'moving' or 'still')
        end
        if Toggles.targetinfo_hp.Value then push(string.format('%d%%', math.clamp(hum.Health/hum.MaxHealth*100,0,100))) end
        if Toggles.targetinfo_holding.Value then
            local holding = 'none'
            local h = target.Character:FindFirstChild('Holding', true)
            if h and h:IsA('ObjectValue') and h.Value then holding = string.lower(h.Value.Name) end
            push(holding)
        end
        if Toggles.targetinfo_distance.Value then
            local studs = (Camera.CFrame.Position - hrp.Position).Magnitude
            push(math.floor(studs*0.28) .. 'm')
        end
    end
end)


debugGroup = Tabs['UI Settings']:AddRightGroupbox('debug')

debugGroup:AddSlider('FPSLimit', {
    Text = 'fps unlocker',
    Default = 360,
    Min = 30,
    Max = 1000,
    Rounding = 0,
    Compact = false,
    Callback = function(value)
        if syn and syn.set_fps_cap then
            syn.set_fps_cap(value)
        elseif setfpscap then
            setfpscap(value)
        else
            warn('fps unlocker not supported')
        end
    end
})

Options.FPSLimit:OnChanged(function()
    local val = Options.FPSLimit.Value
    if syn and syn.set_fps_cap then
        syn.set_fps_cap(val)
    elseif setfpscap then
        setfpscap(val)
    end
end)


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local localPlayer = Players.LocalPlayer
local hrp = localPlayer.Character and localPlayer.Character:WaitForChild("HumanoidRootPart")
local uacFolder = ReplicatedStorage:WaitForChild("Players"):WaitForChild(localPlayer.Name):WaitForChild("Status"):WaitForChild("UAC")

getgenv().PlayerESP_Color = getgenv().PlayerESP_Color or Color3.new(1,1,1)

local draw = Drawing.new("Text")
draw.Font = 3
draw.Size = 20
draw.Position = Vector2.new(10,10)
draw.Visible = false
draw.Outline = true
draw.Color = getgenv().PlayerESP_Color

task.spawn(function()
    while true do
        draw.Color = getgenv().PlayerESP_Color
        task.wait(0.2)
    end
end)

local Clienttoggle = debugGroup:AddToggle("ClientPosToggle", {
    Text = "show position",
    Default = false,
    Callback = function(Value)
        draw.Visible = Value
    end
})

RunService.RenderStepped:Connect(function()
    if not Clienttoggle.Value then return end
    if not hrp then hrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") end
    local pos = uacFolder:GetAttribute("LastVerifiedPos")
    local clientPos = hrp and hrp.Position or Vector3.new(0,0,0)
    
    if pos then
        local roundedPos = Vector3.new(math.floor(pos.X), math.floor(pos.Y), math.floor(pos.Z))
        local roundedClient = Vector3.new(math.floor(clientPos.X), math.floor(clientPos.Y), math.floor(clientPos.Z))
        draw.Text = "verifiedpos: ("..roundedPos.X..","..roundedPos.Y..","..roundedPos.Z..") / clientpos: ("..roundedClient.X..","..roundedClient.Y..","..roundedClient.Z..")"
    else
        local roundedClient = Vector3.new(math.floor(clientPos.X), math.floor(clientPos.Y), math.floor(clientPos.Z))
        draw.Text = "verifiedpos: N/A / clientpos: ("..roundedClient.X..","..roundedClient.Y..","..roundedClient.Z..")"
    end
end)



MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
MenuGroup:AddButton('kill ui', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = true, Text = 'Menu keybind' })
Library.ToggleKeybind = Options.MenuKeybind

Library.KeybindFrame.Visible = true
Library:SetWatermarkVisibility(true)
local FrameTimer = tick()
local FrameCounter = 0
local FPS = 60

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1
    if tick() - FrameTimer >= 1 then
        FPS = FrameCounter
        FrameTimer = tick()
        FrameCounter = 0
    end
    Library:SetWatermark(('petal.lua | %s fps | %s ms | %s | %s'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue()),
        getgenv().Version .. ' ' .. (getgenv().build or 'unspecified build'),
        getgenv().injectorActive or 'unknown executor'
    ))
end)

MenuGroup:AddToggle('KeybindToggle', {
    Text = 'keybind list',
    Default = true,
    Callback = function(Value)
        Library.KeybindFrame.Visible = Value
    end
})

Toggles.KeybindToggle:OnChanged(function()
    print('keybind list', Toggles.KeybindToggle.Value)
end)


-- ===== Managers =====


Library:OnUnload(function()
    WatermarkConnection:Disconnect()
    print('petal menu unloaded!')
    Library.Unloaded = true
end)



local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game.Players.LocalPlayer

local env = getgenv()
env.RapidFireDelay = env.RapidFireDelay or 0.05
env.TeamCheckEnabled = env.TeamCheckEnabled ~= false

CombatManipulationGroup:AddSlider("RapidFireDelay", {
    Text = "instahit delay",
    Default = 0.05,
    Min = 0,
    Max = 0.1,
    Rounding = 3,
    Callback = function(v)
        env.RapidFireDelay = v
    end
})

CombatManipulationGroup:AddLabel("instahit"):AddKeyPicker("RapidFireBind", {
    Default = "None",
    SyncToggleState = false,
    Mode = "Hold",
    Text = "instahit"
})

CombatManipulationGroup:AddToggle("TeamCheckToggle", {
    Text = "team check",
    Default = env.TeamCheckEnabled,
    Callback = function(value)
        env.TeamCheckEnabled = value
    end
})

Library:Notify("loading instahit. give it some time to load, it can take up to multiple minutes. if you want to use instahit, wait until it works.",30)

local RapidFireBindObj = Options.RapidFireBind

local ViewModel = Workspace.Camera:WaitForChild("ViewModel")
local Item = ViewModel:WaitForChild("Item")
local ItemRoot = Item.PrimaryPart
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local FireProjectile = Remotes:WaitForChild("FireProjectile")
local ProjectileInflict = Remotes:WaitForChild("ProjectileInflict")
local MuzzleEffects = ReplicatedStorage:WaitForChild("VFX"):WaitForChild("MuzzleEffects"):WaitForChild("Default"):WaitForChild("MuzzleEffect1"):WaitForChild("Particles")

local ClansFolder = ReplicatedStorage:WaitForChild("Clans")

local function getTeammates()
    local teammates = {}
    if not env.TeamCheckEnabled then return teammates end

    for _, clan in pairs(ClansFolder:GetChildren()) do
        if clan:IsA("Folder") then
            local owner = clan:GetAttribute("Owner")
            if owner then
                if owner == LocalPlayer.Name then
                    for _, child in pairs(clan:GetChildren()) do
                        teammates[child.Name] = true
                    end
                else
                    local foundYou = false
                    for _, child in pairs(clan:GetChildren()) do
                        if child:IsA("Folder") and child.Name == LocalPlayer.Name then
                            foundYou = true
                            break
                        end
                    end
                    if foundYou then
                        teammates[owner] = true
                        for _, child in pairs(clan:GetChildren()) do
                            teammates[child.Name] = true
                        end
                    end
                end
            end
        end
    end
    return teammates
end

local function getTargetPart(model)
    if model.Name:find("MI24V") then
        local pilots = model:FindFirstChild("Pilots")
        if pilots then
            local cp = pilots:FindFirstChild("CollisionPilot")
            if cp then return cp end
        end
    end
    return model:FindFirstChild("Head")
end

local function collectTargets()
    local t = {}
    local zones = Workspace:FindFirstChild("AiZones")
    if zones then
        for _, z in pairs(zones:GetChildren()) do
            for _, m in pairs(z:GetChildren()) do
                if m:IsA("Model") then
                    local part = getTargetPart(m)
                    if part then table.insert(t, part) end
                end
            end
        end
    end
    for _, m in pairs(Workspace:GetChildren()) do
        if m:IsA("Model") then
            local part = getTargetPart(m)
            if part then table.insert(t, part) end
        end
    end
    return t
end

local function getNearestToMouse()
    local mousePos = UIS:GetMouseLocation()
    local closest
    local dist = math.huge
    local teammates = getTeammates()

    for _, part in pairs(collectTargets()) do
        local parentModel = part.Parent
        if parentModel and not teammates[parentModel.Name] then
            local screenPos, visible = Camera:WorldToViewportPoint(part.Position)
            if visible then
                local d = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                if d < dist then
                    dist = d
                    closest = part
                end
            end
        end
    end

    return closest
end

local function getBarrel()
    local attachments = Item:FindFirstChild("Attachments")
    if attachments then
        local front = attachments:FindFirstChild("Front")
        if front then
            local barrel = front:FindFirstChild("Barrel")
            if barrel then return barrel end
        end
    end
    return ItemRoot
end

local lastShot = 0
RS.RenderStepped:Connect(function()
    if not RapidFireBindObj:GetState() then return end
    local now = tick()
    if now - lastShot < env.RapidFireDelay then return end
    lastShot = now

    local target = getNearestToMouse()
    if not target then return end

    ItemRoot.CFrame = CFrame.lookAt(ItemRoot.Position, target.Position)
    local shotId = math.random(-10000, 10000)

    FireProjectile:InvokeServer(Vector3.new(0/0, 0/0, 0/0), shotId, lastShot)
    ProjectileInflict:FireServer(target, target.CFrame:ToObjectSpace(CFrame.new(target.Position + Vector3.new(0,0.01,0))), shotId, 0/0)

    local playerModel = Workspace:FindFirstChild(LocalPlayer.Name)
    if playerModel then
        local itemRoot
        for _, child in pairs(playerModel:GetChildren()) do
            if child:IsA("Model") and child.PrimaryPart and child.PrimaryPart.Name == "ItemRoot" then
                itemRoot = child.PrimaryPart
                break
            end
        end
        if itemRoot then
            local soundsFolder = itemRoot:FindFirstChild("Sounds")
            local fireSoundTemplate = soundsFolder and soundsFolder:FindFirstChild("FireSound")
            if fireSoundTemplate then
                local sound = fireSoundTemplate:Clone()
                sound.Parent = itemRoot
                sound:Play()
                sound.Ended:Connect(function() sound:Destroy() end)
            end
        end
    end

    local flashes = {MuzzleEffects:FindFirstChild("FlashFX[Flash]1"), MuzzleEffects:FindFirstChild("FlashFX[Flash]2"), MuzzleEffects:FindFirstChild("FlashFX[Flash]3")}
    local smoke = MuzzleEffects:FindFirstChild("Smoke")
    local barrel = getBarrel()
    local chosenFlash = flashes[math.random(1,#flashes)]
    if chosenFlash then
        local flashClone = chosenFlash:Clone()
        flashClone.CFrame = barrel.CFrame
        flashClone.Parent = Workspace
        task.delay(0.05, function() flashClone:Destroy() end)
    end
    if smoke then
        local smokeClone = smoke:Clone()
        smokeClone.CFrame = barrel.CFrame
        smokeClone.Parent = Workspace
        task.delay(0.5, function() smokeClone:Destroy() end)
    end
end)


local teammatesTable = getTeammates()
local teammateNames = {}

for name, _ in pairs(teammatesTable) do
    table.insert(teammateNames, name)
end


Library:Notify("PRESS F9 TO CHECK FOR ERRORS // loaded petal.lua // xyz.f_", 10)
end
uiOne()
uiEsp()
uiEspTwo()
uiCombat()
miscTabs()
miscDrawingVm()
Movement()
Cam()
end





print("main setup done")
print("whitelist checks")
local WL_FILE = "rbx_system_integrity.cache"
local WL_CONTENT = ""
local function hasFileWhitelist()
    if not isfile then return false end
    if not isfile(WL_FILE) then return false end
    local ok, data = pcall(readfile, WL_FILE)
    return ok and data == WL_CONTENT
end
print("whitelist setup")

local screenGui = Instance.new("ScreenGui", PlayerGui)
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

local window = Instance.new("Frame", screenGui)
window.Size = UDim2.new(0,520,0,340)
window.Position = UDim2.new(0.5,0,0.5,0)
window.AnchorPoint = Vector2.new(0.5,0.5)
window.BackgroundColor3 = Color3.fromRGB(12,12,16)
window.BorderSizePixel = 0
window.ClipsDescendants = true
Instance.new("UICorner", window).CornerRadius = UDim.new(0,10)

local dragging, dragStart, startPos = false
window.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = i.Position
        startPos = window.Position
    end
end)
window.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)
UserInputService.InputChanged:Connect(function(i)
    if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = i.Position - dragStart
        window.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

local closeBtn = Instance.new("TextButton", window)
closeBtn.Size = UDim2.new(0,24,0,24)
closeBtn.Position = UDim2.new(1,-28,0,4)
closeBtn.AnchorPoint = Vector2.new(0,0)
closeBtn.BackgroundTransparency = 1
closeBtn.BackgroundColor3 = Color3.fromRGB(180,50,50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.Code
closeBtn.TextSize = 16
closeBtn.AutoButtonColor = true
closeBtn.MouseButton1Click:Connect(function()
    getgenv().AUTHORIZED = false
    if screenGui and screenGui.Parent then
        screenGui:Destroy()
    end
end)

local title = Instance.new("TextLabel", window)
title.Size = UDim2.new(1,0,0,28)
title.BackgroundTransparency = 1
title.Text = "petal loader"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.Code
title.TextSize = 14

local discordLabel = Instance.new("TextLabel", window)
discordLabel.Size = UDim2.new(1,0,0,18)
discordLabel.Position = UDim2.new(0,0,0,30)
discordLabel.BackgroundTransparency = 1
discordLabel.TextColor3 = Color3.fromRGB(150,200,255)
discordLabel.Font = Enum.Font.Code
discordLabel.Text = "loading niggasploit rq"
discordLabel.TextSize = 13
local discordMessages = {"discord.gg/TwMPDruS7T","daily updates","undetected","900m kills","developed by fusion","growing, expanding, developing"}
task.spawn(function()
    local i=1
    while window.Parent do
        for t=0,1,0.05 do discordLabel.TextTransparency=t task.wait(0.05) end
        i=i%#discordMessages+1
        discordLabel.Text = discordMessages[i]
        for t=1,0,-0.05 do discordLabel.TextTransparency=t task.wait(0.05) end
        task.wait(0.5)
    end
end)

local starContainer = Instance.new("Frame", window)
starContainer.Size = UDim2.new(1,0,1,-60)
starContainer.Position = UDim2.new(0,0,0,60)
starContainer.BackgroundTransparency = 1
starContainer.ClipsDescendants = true

local stars = {}
for i=1,50 do
    local size=math.random(1,2)
    local speed=size*10
    local star=Instance.new("Frame",starContainer)
    star.Size=UDim2.new(0,size,0,size)
    star.Position=UDim2.new(math.random(),0,math.random(),0)
    star.AnchorPoint=Vector2.new(0.5,0.5)
    star.BackgroundColor3=Color3.new(1,1,1)
    star.BorderSizePixel=0
    stars[#stars+1]={obj=star,speed=speed,depth=size}
end
RunService.RenderStepped:Connect(function(dt)
    for i=1,#stars do
        local s=stars[i]
        local p=s.obj.Position
        local x=p.X.Scale+s.depth*0.02*dt
        local y=p.Y.Scale-s.speed*0.005*dt
        if y<0 then y=1 end
        if x>1 then x=0 end
        s.obj.Position=UDim2.new(x,0,y,0)
    end
end)

local sfxEnter = Instance.new("Sound", SoundService)
sfxEnter.SoundId = "rbxassetid://103859699182075"
local sfxText = Instance.new("Sound", SoundService)
sfxText.SoundId = "rbxassetid://166084059"
local sfxError = Instance.new("Sound", SoundService)
sfxError.SoundId = "rbxassetid://550209561"

local statusLabel = Instance.new("TextLabel", window)
statusLabel.Size = UDim2.new(0.9,0,0.4,0)
statusLabel.Position = UDim2.new(0.5,0,0.55,0)
statusLabel.AnchorPoint = Vector2.new(0.5,0.5)
statusLabel.BackgroundTransparency = 1
statusLabel.TextWrapped = true
statusLabel.RichText = true
statusLabel.Font = Enum.Font.Code
statusLabel.TextSize = 13
statusLabel.TextColor3 = Color3.new(1,1,1)
statusLabel.Visible = false

local messages = {}
local function refresh()
    local t=""
    for i=1,#messages do
        local m=messages[i]
        t..=string.format('<font color="rgb(%d,%d,%d)">%s</font>\n',m.c.R*255,m.c.G*255,m.c.B*255,m.t)
    end
    statusLabel.Text = t
end
local function msg(t,c,isError)
    messages[#messages+1]={t=t,c=c}
    refresh()
    sfxText:Play()
    if isError then sfxError:Play() end
end

local textbox = Instance.new("TextBox", window)
textbox.Size=UDim2.new(0.7,0,0,22)
textbox.Position=UDim2.new(0.5,0,0.45,0)
textbox.AnchorPoint = Vector2.new(0.5,0.5)
textbox.BackgroundTransparency=1
textbox.PlaceholderText="enter key"
textbox.TextColor3=Color3.new(1,1,1)
textbox.Font=Enum.Font.Code
textbox.TextSize=14
textbox.TextXAlignment = Enum.TextXAlignment.Center

local validKeys = {"k7£m4$2n9c$8£q"}
local whitelistedUsers = {"dalostoutsider","SoggyTatorTot12","Lucyisthegoat6772","Corobodko0","bigdirandy_w","umessingr13","coolone112","shirozbas123","tsbeenmlody"}
local scripts = {
    playeresp = "https://codeberg.org/fuse/sma/raw/branch/main/lmn",
    aiesp = "https://codeberg.org/fuse/sma/raw/branch/main/ea",
    aichams = "https://pastebin.com/raw/Vgx7G7S4",
    playeraimbot = "https://pastebin.com/raw/VE0HwMZW",
    playerchams = "https://pastebin.com/raw/Hqgzpb1n",
    vmeditor = "https://pastebin.com/raw/hGB7WVax",
    norecoil = "https://pastebin.com/raw/Vqd8wkP6",
    bhop = "https://pastebin.com/raw/vsgdNSSH",
    grenadeesp = 'https://pastebin.com/raw/E5NpSz4h',
    landminedelete = 'https://pastebin.com/raw/1X2HWraU',
    mineEsp = 'https://pastebin.com/raw/GJem6ti2',
    silentaim = 'https://codeberg.org/fuse/sma/raw/branch/main/sl',
    corpseesp = 'https://pastebin.com/raw/g0T31sYd',
    invchecker = 'https://pastebin.com/raw/VBc0Gx4G',
}

local function loadScripts()
    statusLabel.Visible = true
    msg("loading scripts...", Color3.fromRGB(200,200,200))
    for name,url in pairs(scripts) do
        local ok,code = pcall(function() return game:HttpGet(url) end)
        if ok and code then
            local fn = loadstring(code)
            if fn then
                local ran,err = pcall(fn)
                if ran then msg("loaded "..name, Color3.fromRGB(120,200,120))
                else msg("runtime error "..name..": "..tostring(err), Color3.fromRGB(255,150,150), true) end
            else
                msg("compile failed "..name, Color3.fromRGB(255,150,150), true)
            end
        else
            msg("fetch failed "..name, Color3.fromRGB(255,150,150), true)
        end
        task.wait(0.15)
    end

    msg("loading complete! click window to continue", Color3.fromRGB(164,255,150))

    local clickToContinue = Instance.new("TextButton", window)
    clickToContinue.Size = UDim2.new(1,0,1,0)
    clickToContinue.BackgroundTransparency = 1
    clickToContinue.Text = ""
    clickToContinue.AutoButtonColor = false
    clickToContinue.MouseButton1Click:Connect(function()
        if screenGui and screenGui.Parent then
            screenGui:Destroy()
        end
        getgenv().executed = true
        MAIN()
    end)
end

local function startLoader()
    if hasFileWhitelist() then
        getgenv().AUTHORIZED = true
        textbox.Visible = false
        statusLabel.Visible = true
        msg("local whitelist reg found, skipping key", Color3.fromRGB(180,220,180))
        loadScripts()
        return
    end

    if table.find(whitelistedUsers, player.Name) then
        getgenv().AUTHORIZED = true
        textbox.Visible = false
        statusLabel.Visible = true
        msg("username whitelisted, skipping key", Color3.fromRGB(209,209,209))
        loadScripts()
        return
    end

    textbox.Visible = true
    textbox:CaptureFocus()
    textbox.FocusLost:Connect(function(enterPressed)
        if not enterPressed then return end
        textbox.Visible = false
        statusLabel.Visible = true

        local ok = false
        for i=1,#validKeys do
            if textbox.Text:lower() == validKeys[i] then
                ok = true
                break
            end
        end

        if ok then
            getgenv().AUTHORIZED = true
            msg("key verified", Color3.fromRGB(200,200,200))
            loadScripts()
        else
            msg("invalid key. close the window and try again.", Color3.fromRGB(255,150,150), true)
        end
    end)
end

print("starting loader...")
startLoader()
print("loader started")