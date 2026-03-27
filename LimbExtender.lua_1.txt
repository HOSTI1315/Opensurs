local rawSettings = {
    TOGGLE = "L",
    TARGET_LIMB = "HumanoidRootPart",
    LIMB_SIZE = 15,
    LIMB_TRANSPARENCY = 0.9,
    LIMB_CAN_COLLIDE = false,
    MOBILE_BUTTON = true,
    LISTEN_FOR_INPUT = true,
    TEAM_CHECK = true,
    FORCEFIELD_CHECK = true,
    RESET_LIMB_ON_DEATH2 = false,
    USE_HIGHLIGHT = true,
    DEPTH_MODE = "AlwaysOnTop",
    HIGHLIGHT_FILL_COLOR = Color3.fromRGB(0,140,140),
    HIGHLIGHT_FILL_TRANSPARENCY = 0.7,
    HIGHLIGHT_OUTLINE_COLOR = Color3.fromRGB(255,255,255),
    HIGHLIGHT_OUTLINE_TRANSPARENCY = 1,
}

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local limbExtenderData = getgenv().limbExtenderData or {}
getgenv().limbExtenderData = limbExtenderData

if limbExtenderData.terminateOldProcess then
    limbExtenderData.terminateOldProcess("FullKill")
    limbExtenderData.terminateOldProcess = nil
end

limbExtenderData.running = limbExtenderData.running or false
limbExtenderData.CAU = limbExtenderData.CAU or loadstring(game:HttpGet("https://raw.githubusercontent.com/AAPVdev/scripts/refs/heads/main/ContextActionUtility.lua"))()
limbExtenderData.Streamable = limbExtenderData.Streamable or loadstring(game:HttpGet("https://raw.githubusercontent.com/AAPVdev/scripts/refs/heads/main/Streamable.lua"))()
limbExtenderData.playerTable = limbExtenderData.playerTable or {}
limbExtenderData.limbs = limbExtenderData.limbs or {}

local Streamable = limbExtenderData.Streamable
local CAU = limbExtenderData.CAU

local function watchProperty(instance, prop, callback)
    return instance:GetPropertyChangedSignal(prop):Connect(function()
        callback(instance)
    end)
end

local function saveLimbProperties(limb)
    limbExtenderData.limbs[limb] = {
        OriginalSize = limb.Size,
        OriginalTransparency = limb.Transparency,
        OriginalCanCollide = limb.CanCollide,
        OriginalMassless = limb.Massless,
    }
end

local function restoreLimbProperties(limb)
    local p = limbExtenderData.limbs[limb]
    if not p then return end
    if p.SizeConnection then p.SizeConnection:Disconnect() end
    if p.CollisionConnection then p.CollisionConnection:Disconnect() end
    limb.Size = p.OriginalSize
    limb.Transparency = p.OriginalTransparency
    limb.CanCollide = p.OriginalCanCollide
    limb.Massless = p.OriginalMassless
    limbExtenderData.limbs[limb] = nil
end

local function modifyLimbProperties(limb)
    saveLimbProperties(limb)
    local entry = limbExtenderData.limbs[limb]
    local newSize = Vector3.new(rawSettings.LIMB_SIZE, rawSettings.LIMB_SIZE, rawSettings.LIMB_SIZE)
    local canCollide = rawSettings.LIMB_CAN_COLLIDE
    entry.SizeConnection = watchProperty(limb, "Size", function(l) l.Size = newSize end)
    entry.CollisionConnection = watchProperty(limb, "CanCollide", function(l) l.CanCollide = canCollide end)
    limb.Size = newSize
    limb.Transparency = rawSettings.LIMB_TRANSPARENCY
    limb.CanCollide = canCollide
    if rawSettings.TARGET_LIMB ~= "HumanoidRootPart" then
        limb.Massless = true
    end
end

local function spoofSize(part)
    if limbExtenderData[rawSettings.TARGET_LIMB] then return end
    limbExtenderData[rawSettings.TARGET_LIMB] = true
    pcall(function()
        local mt = getrawmetatable(game)
        local saved = part.Size
        setreadonly(mt, false)
        local old = mt.__index
        mt.__index = function(self, key)
            if tostring(self) == rawSettings.TARGET_LIMB and key == "Size" then
                return saved
            end
            return old(self, key)
        end
        setreadonly(mt, true)
    end)
end

local function indexBypass()
    if limbExtenderData.indexBypass then return end
    limbExtenderData.indexBypass = true
    pcall(function()
        for _, obj in ipairs(getgc(true)) do
            local idx = rawget(obj, "indexInstance")
            if typeof(idx) == "table" and idx[1] == "kick" then
                for _, pair in pairs(obj) do
                    pair[2] = function() return false end
                end
                break
            end
        end
    end)
end

local function makeHighlight()
    local hiFolder = Players:FindFirstChild("Limb Extender Highlights Folder") or Instance.new("Folder")
    local hi = Instance.new("Highlight")
    hi.Name = "LimbHighlight"
    hi.DepthMode = Enum.HighlightDepthMode[rawSettings.DEPTH_MODE]
    hi.FillColor = rawSettings.HIGHLIGHT_FILL_COLOR
    hi.FillTransparency = rawSettings.HIGHLIGHT_FILL_TRANSPARENCY
    hi.OutlineColor = rawSettings.HIGHLIGHT_OUTLINE_COLOR
    hi.OutlineTransparency = rawSettings.HIGHLIGHT_OUTLINE_TRANSPARENCY
    hi.Enabled = true
    hiFolder.Parent = Players
    hiFolder.Name = "Limb Extender Highlights Folder"
    hi.Parent = hiFolder
    return hi
end

local function isTeam(player)
	return rawSettings.TEAM_CHECK and localPlayer.Team ~= nil and player.Team == localPlayer.Team
end

local PlayerData = {}
PlayerData.__index = PlayerData

function PlayerData.new(player)
    local self = setmetatable({
        player = player,
        conns = {},
        highlight = nil,
	PartStreamable = nil,
    }, PlayerData)
    table.insert(self.conns, player.CharacterAdded:Connect(function(c) self:onCharacter(c) end))

    local character = player.Character or workspace:FindFirstChild(player.Name)
    self:onCharacter(character)
    return self
end

function PlayerData:setupCharacter(char)
    table.insert(self.conns, self.player:GetPropertyChangedSignal("Team"):Once(function()
        self:Destroy()
        limbExtenderData.playerTable[self.player.Name] = PlayerData.new(self.player)
    end))

    if isTeam(self.player) then return end

	local humanoid = char:WaitForChild("Humanoid", 0.3)
	if not humanoid or humanoid.Health <= 0 then return end
	
	if self.PartStreamable then self.PartStreamable:Destroy() end
	self.PartStreamable = Streamable.new(char, rawSettings.TARGET_LIMB)
	
	self.PartStreamable:Observe(function(part, trove)
	    spoofSize(part)
	    modifyLimbProperties(part)
	
	    if rawSettings.USE_HIGHLIGHT then
		if not self.highlight then
		    self.highlight = makeHighlight()
		end
		self.highlight.Adornee = part
	    end
	
	    table.insert(self.conns, self.player.CharacterRemoving:Once(function()
		restoreLimbProperties(part)
	    end))
	
	    local deathEvent = rawSettings.RESET_LIMB_ON_DEATH2 and humanoid.HealthChanged or humanoid.Died
	    table.insert(self.conns, deathEvent:Connect(function(hp)
		if hp and hp <= 0 then restoreLimbProperties(part) end
	    end))
	
	    trove:Add(function() restoreLimbProperties(part) end)
	end)
end

function PlayerData:onCharacter(char)
    if not char then return end
    if rawSettings.FORCEFIELD_CHECK and char:FindFirstChildOfClass("ForceField") then
        table.insert(self.conns, char.ChildRemoved:Once(function(child)
            if child:IsA("ForceField") then self:setupCharacter(char) end
        end))
        return
    end
    self:setupCharacter(char)
end

function PlayerData:Destroy()
    for _, c in ipairs(self.conns) do
        if typeof(c) == "RBXScriptConnection" then c:Disconnect() end
    end
    self.conns = nil
    if self.highlight then
        self.highlight:Destroy()
        self.highlight = nil
    end
    if self.PartStreamable then
        self.PartStreamable:Destroy()
        self.PartStreamable = nil
    end
end

local function onPlayerAdded(player)
    limbExtenderData.playerTable[player.Name] = PlayerData.new(player)
end

local function onPlayerRemoving(player)
    local pd = limbExtenderData.playerTable[player.Name]
    if pd then
        pd:Destroy()
        limbExtenderData.playerTable[player.Name] = nil
    end
end

local function terminate(reason)
    for k,v in pairs(limbExtenderData) do
        if typeof(v) == "RBXScriptConnection" then
            v:Disconnect()
            limbExtenderData[k] = nil
        end
    end

    for _, pd in pairs(limbExtenderData.playerTable) do
        pd:Destroy()
    end

    limbExtenderData.playerTable = {}
    for limb in pairs(limbExtenderData.limbs) do
        restoreLimbProperties(limb)
    end

    if reason == "FullKill" or not rawSettings.LISTEN_FOR_INPUT then
        limbExtenderData.CAU:UnbindAction("LimbExtenderToggle")
    elseif rawSettings.MOBILE_BUTTON then
        CAU:SetTitle("LimbExtenderToggle", "On")
    end
end

local function initiate()
    terminate()
    if not limbExtenderData.running then return end

    indexBypass()

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= localPlayer then onPlayerAdded(p) end
    end

    limbExtenderData.TeamChanged = localPlayer:GetPropertyChangedSignal("Team"):Once(initiate)
    limbExtenderData.PlayerAdded = Players.PlayerAdded:Connect(onPlayerAdded)
    limbExtenderData.PlayerRemoving = Players.PlayerRemoving:Connect(onPlayerRemoving)
	
    if rawSettings.MOBILE_BUTTON and rawSettings.LISTEN_FOR_INPUT then
        CAU:SetTitle("LimbExtenderToggle", "Off")
    end
end

function rawSettings.toggleState(state)
    limbExtenderData.running = (state == nil and not limbExtenderData.running) or state
    if limbExtenderData.running then
        initiate()
    else
        terminate()
    end
end

if rawSettings.LISTEN_FOR_INPUT then
    limbExtenderData.InputBind = CAU:BindAction(
        "LimbExtenderToggle",
        function(_, inputState)
            if inputState == Enum.UserInputState.Begin then
                rawSettings.toggleState()
            end
        end,
        rawSettings.MOBILE_BUTTON,
        Enum.KeyCode[rawSettings.TOGGLE]
    )
end

limbExtenderData.terminateOldProcess = terminate

if limbExtenderData.running then
    initiate()
elseif rawSettings.MOBILE_BUTTON and rawSettings.LISTEN_FOR_INPUT then
    limbExtenderData.CAU:SetTitle("LimbExtenderToggle", "On")
end

return setmetatable({}, {
    __index = rawSettings,
    __newindex = function(_, key, value)
        if rawSettings[key] ~= value then
            rawSettings[key] = value
            initiate()
        end
    end,
})
