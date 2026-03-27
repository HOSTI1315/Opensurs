-- ts file was generated at discord.gg/25ms


local v1 = game:GetService("Players")
game:GetService("TweenService")
game:GetService("UserInputService")
local vu2 = game:GetService("HttpService")
game:GetService("TextChatService")
local vu3 = false
local vu4 = nil
if v1.LocalPlayer:FindFirstChild("PlayerGui") then
    local vu5 = "2hxKqA3b7b"
    local vu6 = "soluna_discord_rpc_shown.txt"
    local vu7 = false
    pcall(function()
        vu7 = readfile(vu6) == "true"
    end)
    if not vu7 then
        pcall(function()
            local v8 = http.request
            local v9 = {
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    Origin = "https://discord.com"
                }
            }
            local v10 = vu2
            local v11 = v10.JSONEncode
            local v12 = {
                cmd = "INVITE_BROWSER",
                args = {
                    code = vu5
                },
                nonce = vu2:GenerateGUID(false)
            }
            v9.Body = v11(v10, v12)
            v8(v9)
            writefile(vu6, "true")
        end)
    end
    local vu13 = false
    if vu13 then
        getfenv().getfenv = function()
            return setmetatable({}, {
                __index = function()
                    return function()
                        return true
                    end
                end
            })
        end
    end
    local vu14 = game:GetService("HttpService")
    local vu15 = game:GetService("Players")
    local vu16 = vu15.LocalPlayer
    local vu17 = game:GetService("UserInputService")
    local vu18 = game:GetService("RunService")
    local vu19 = game:GetService("TweenService")
    local vu20 = {
        TabWidth = 160,
        Size = {
            580,
            460
        },
        Theme = "Darker",
        Acrylic = false,
        Transparency = true,
        MinimizeKey = "RightShift",
        ShowNotifications = true,
        ShowWarnings = true,
        RenderingMode = "RenderStepped",
        AutoImport = true
    }
    local vu36 = {
        ImportSettings = function(_)
            pcall(function()
                if not vu13 and (getfenv().isfile and (getfenv().readfile and (getfenv().isfile("UISettings.Soluna") and getfenv().readfile("UISettings.Soluna")))) then
                    local v21 = vu14:JSONDecode(getfenv().readfile("UISettings.Soluna"))
                    local v22 = next
                    local v23 = nil
                    while true do
                        local v24
                        v23, v24 = v22(v21, v23)
                        if v23 == nil then
                            break
                        end
                        vu20[v23] = v24
                        task.wait(0.1)
                    end
                end
            end)
        end,
        ExportSettings = function(_)
            pcall(function()
                if not vu13 and (getfenv().isfile and (getfenv().readfile and getfenv().writefile)) then
                    local v25 = vu14
                    getfenv().writefile("UISettings.Soluna", v25:JSONEncode(vu20))
                end
            end)
        end,
        ExportConfigurations = function(_)
            pcall(function()
                if not vu13 and getfenv().writefile then
                    local v26 = next
                    local v27 = Configuration
                    local v28 = nil
                    local v29 = {}
                    while true do
                        local v30
                        v28, v30 = v26(v27, v28)
                        if v28 == nil then
                            break
                        end
                        if v28 == "FoVColour" or (v28 == "NameESPOutlineColour" or (v28 == "ESPColour" or (v28 == "SelectedColor" or (v28 == "SelectedOutdoorColor" or (v28 == "BoxColor" or (v28 == "TracerColor" or v28 == "NameColor")))))) then
                            v29[v28] = ColorsHandler:PackColour(v30)
                        else
                            v29[v28] = v30
                        end
                        task.wait(0.1)
                    end
                    if Configuration.SelectedSkinModel then
                        v29.SelectedSkinModel = Configuration.SelectedSkinModel
                    end
                    v29.SelectedSkybox = Configuration.SelectedSkybox
                    local v31
                    if getgenv().skippedLagPoll then
                        v31 = string.format("%s.Soluna_skipped", game.GameId)
                    else
                        v31 = string.format("%s.Soluna", game.GameId)
                    end
                    local v32 = vu14
                    getfenv().writefile(v31, v32:JSONEncode(v29))
                end
            end)
        end,
        SaveAllSettings = function(pu33)
            if Configuration then
                local v34, v35 = pcall(function()
                    pu33:ExportSettings()
                    pu33:ExportConfigurations()
                    if Configuration.AntiKatana ~= nil then
                        ImportedConfiguration.AntiKatana = Configuration.AntiKatana
                    end
                    if Configuration.AntiKatanaSound ~= nil then
                        ImportedConfiguration.AntiKatanaSound = Configuration.AntiKatanaSound
                    end
                    if Configuration.InventoryViewer ~= nil then
                        ImportedConfiguration.InventoryViewer = Configuration.InventoryViewer
                    end
                    if Configuration.FastEquip ~= nil then
                        ImportedConfiguration.FastEquip = Configuration.FastEquip
                    end
                    if Configuration.SkinChanger ~= nil then
                        ImportedConfiguration.SkinChanger = Configuration.SkinChanger
                    end
                    if Configuration.SelectedSkin ~= nil then
                        ImportedConfiguration.SelectedSkin = Configuration.SelectedSkin
                    end
                    pu33:SaveToDataStore(ImportedConfiguration)
                end)
                if not v34 then
                    warn("SaveAllSettings failed:", v35)
                end
            else
                warn("SaveAllSettings: Configuration table is nil, cannot save settings.")
            end
        end
    }
    vu36:ImportSettings()
    vu20.__LAST_RUN__ = os.date()
    vu36:ExportSettings()
    local vu39 = {
        PackColour = function(_, p37)
            return typeof(p37) == "Color3" and {
                R = p37.R * 255,
                G = p37.G * 255,
                B = p37.B * 255
            } or ((typeof(p37) ~= "table" or not (p37.R and (p37.G and p37.B))) and {
                R = 255,
                G = 255,
                B = 255
            } or p37)
        end,
        UnpackColour = function(_, p38)
            if typeof(p38) ~= "table" or not (p38.R and (p38.G and p38.B)) then
                if typeof(p38) ~= "Color3" then
                    return Color3.fromRGB(255, 255, 255)
                else
                    return p38
                end
            else
                return Color3.fromRGB(p38.R, p38.G, p38.B)
            end
        end
    }
    local vu40 = {}
    pcall(function()
        if not vu13 and (getfenv().isfile and (getfenv().readfile and (getfenv().isfile(string.format("%s.Soluna", game.GameId)) and (getfenv().readfile(string.format("%s.Soluna", game.GameId)) and vu20.AutoImport)))) then
            vu40 = vu14:JSONDecode(getfenv().readfile(string.format("%s.Soluna", game.GameId)))
            local v41 = next
            local v42 = vu40
            local v43 = nil
            while true do
                local v44
                v43, v44 = v41(v42, v43)
                if v43 == nil then
                    break
                end
                if v43 == "FoVColour" or (v43 == "NameESPOutlineColour" or v43 == "ESPColour") then
                    vu40[v43] = vu39:UnpackColour(v44)
                elseif v43 == "SelectedSkinModel" then
                    Configuration.SelectedSkinModel = v44
                end
            end
        end
    end)
    local vu45 = {
        Watermark = vu40.Watermark
    }
    if vu45.Watermark == nil then
        vu45.Watermark = true
    end
    vu45.BlatantEnabled = vu40.BlatantEnabled or false
    vu45.TeleportMode = vu40.TeleportMode or "Instant"
    vu45.TeleportHeight = vu40.TeleportHeight or 5
    vu45.TeleportDistance = vu40.TeleportDistance or 5
    vu45.MaxTeleportRange = vu40.MaxTeleportRange or 500
    vu45.OrbitMode = vu40.OrbitMode or false
    vu45.OrbitSpeed = vu40.OrbitSpeed or 1
    vu45.OrbitDistance = vu40.OrbitDistance or 5
    vu45.OrbitHeight = vu40.OrbitHeight or 3
    vu45.TargetESP = vu40.TargetESP or false
    vu45.AutoTeleport = vu40.AutoTeleport or false
    vu45.TeleportInterval = vu40.TeleportInterval or 3
    vu45.TeleportKey = vu40.TeleportKey or "X"
    vu45.AutoTargetClosestEnemy = vu40.AutoTargetClosestEnemy or false
    vu45.AutoTargetClosestTeammate = vu40.AutoTargetClosestTeammate or false
    vu45.ESPEnabled = vu40.ESPEnabled or false
    vu45.TeamCheck = vu40.TeamCheck or false
    vu45.BoxFillTransparency = vu40.BoxFillTransparency or 0.5
    vu45.BoxOutlineTransparency = vu40.BoxOutlineTransparency or 0
    vu45.BoxColor = vu40.BoxColor or Color3.fromRGB(255, 0, 0)
    vu45.TracerColor = vu40.TracerColor or Color3.new(1, 1, 1)
    vu45.ResolutionChangerEnabled = vu40.ResolutionChangerEnabled or false
    vu45.ResolutionChangerStrength = vu40.ResolutionChangerStrength or 0.5
    vu45.InfiniteJumpEnabled = vu40.InfiniteJumpEnabled or false
    vu45.WalkspeedEnabled = vu40.WalkspeedEnabled or false
    vu45.WalkspeedValue = vu40.WalkspeedValue or 16
    vu45.NoClipEnabled = vu40.NoClipEnabled or false
    vu45.FlyingEnabled = vu40.FlyingEnabled or false
    vu45.FlyingSpeed = vu40.FlyingSpeed or 50
    vu45.DeviceSpoof = vu40.DeviceSpoof
    vu45.SilentAim = vu40.SilentAim or false
    vu45.Aimbot = vu40.Aimbot or false
    vu45.OnePressAimingMode = vu40.OnePressAimingMode or false
    vu45.AimKey = vu40.AimKey or "RMB"
    vu45.AimMode = vu40.AimMode or "Mouse"
    vu45.OffAimbotAfterKill = vu40.OffAimbotAfterKill or false
    vu45.AimPartDropdownValues = vu40.AimPartDropdownValues or {
        "Head",
        "HumanoidRootPart"
    }
    vu45.AimPart = vu40.AimPart or "Head"
    vu45.RandomAimPart = vu40.RandomAimPart or false
    vu45.TimeControlEnabled = vu40.TimeControlEnabled or false
    vu45.TimeSliderValue = vu40.TimeSliderValue or 12
    vu45.ShadowsEnabled = vu40.ShadowsEnabled or false
    vu45.AmbientColorEnabled = vu40.AmbientColorEnabled or false
    vu45.SelectedColor = vu40.SelectedColor or Color3.fromRGB(127, 127, 127)
    vu45.RainbowModeEnabled = vu40.RainbowModeEnabled or false
    vu45.RainbowSpeed = vu40.RainbowSpeed or 1
    vu45.OutdoorAmbientEnabled = vu40.OutdoorAmbientEnabled or false
    vu45.SelectedOutdoorColor = vu40.SelectedOutdoorColor or Color3.fromRGB(127, 127, 127)
    vu45.FogEnabled = vu40.FogEnabled or false
    vu45.FogColor = vu40.FogColor or Color3.fromRGB(191, 191, 191)
    vu45.FogStart = vu40.FogStart or 0
    vu45.FogEnd = vu40.FogEnd or 1000
    vu45.RealisticRenderingEnabled = vu40.RealisticRenderingEnabled or false
    vu45.MaterialOverrides = vu40.MaterialOverrides or false
    vu45.CustomMaterial = vu40.CustomMaterial or Enum.Material.SmoothPlastic
    vu45.CustomReflectance = vu40.CustomReflectance or 0
    vu45.BloomEnabled = vu40.BloomEnabled or false
    vu45.BloomIntensity = vu40.BloomIntensity or 1
    vu45.BloomSize = vu40.BloomSize or 24
    vu45.BloomThreshold = vu40.BloomThreshold or 2
    vu45.DepthOfFieldEnabled = vu40.DepthOfFieldEnabled or false
    vu45.DOFFarIntensity = vu40.DOFFarIntensity or 0.75
    vu45.DOFNearIntensity = vu40.DOFNearIntensity or 0.75
    vu45.DOFFocusDistance = vu40.DOFFocusDistance or 51.6
    vu45.SensitivityEnabled = vu40.SensitivityEnabled
    if vu45.SensitivityEnabled == nil then
        vu45.SensitivityEnabled = true
    end
    vu45.SensitivityValue = vu40.SensitivityValue or 0.2
    vu45.UseOffset = vu40.UseOffset or false
    vu45.OffsetType = vu40.OffsetType or "Static"
    vu45.StaticOffsetIncrement = vu40.StaticOffsetIncrement or 10
    vu45.DynamicOffsetIncrement = vu40.DynamicOffsetIncrement or 10
    vu45.AutoOffset = vu40.AutoOffset or false
    vu45.MaxAutoOffset = vu40.MaxAutoOffset or 50
    vu45.UseSensitivity = vu40.UseSensitivity
    if vu45.UseSensitivity == nil then
        vu45.UseSensitivity = true
    end
    vu45.Sensitivity = vu40.Sensitivity or 10
    vu45.UseNoise = vu40.UseNoise or false
    vu45.NoiseFrequency = vu40.NoiseFrequency or 50
    vu45.TriggerBot = vu40.TriggerBot or false
    vu45.OnePressTriggeringMode = vu40.OnePressTriggeringMode or false
    vu45.SmartTriggerBot = vu40.SmartTriggerBot or false
    vu45.TriggerKey = vu40.TriggerKey or "E"
    vu45.TriggerBotChance = vu40.TriggerBotChance or 100
    vu45.TriggerBotDelay = vu40.TriggerBotDelay or 0
    vu45.AliveCheck = vu40.AliveCheck or false
    vu45.GodCheck = vu40.GodCheck or false
    vu45.TeamCheck = vu40.TeamCheck or false
    vu45.FriendCheck = vu40.FriendCheck or false
    vu45.FollowCheck = vu40.FollowCheck or false
    vu45.VerifiedBadgeCheck = vu40.VerifiedBadgeCheck or false
    vu45.WallCheck = vu40.WallCheck or false
    vu45.FoVCheck = vu40.FoVCheck or false
    vu45.FoVRadius = vu40.FoVRadius or 100
    vu45.MagnitudeCheck = vu40.MagnitudeCheck or false
    vu45.TriggerMagnitude = vu40.TriggerMagnitude or 500
    vu45.WhitelistedGroupCheck = vu40.WhitelistedGroupCheck or false
    vu45.WhitelistedGroup = vu40.WhitelistedGroup or 0
    vu45.BlacklistedGroupCheck = vu40.BlacklistedGroupCheck or false
    vu45.BlacklistedGroup = vu40.BlacklistedGroup or 0
    vu45.IgnoredPlayersCheck = vu40.IgnoredPlayersCheck or false
    vu45.IgnoredPlayersDropdownValues = vu40.IgnoredPlayersDropdownValues or {}
    vu45.IgnoredPlayers = vu40.IgnoredPlayers or {}
    vu45.TargetPlayersCheck = vu40.TargetPlayersCheck or false
    vu45.TargetPlayersDropdownValues = vu40.TargetPlayersDropdownValues or {}
    vu45.TargetPlayers = vu40.TargetPlayers or {}
    vu45.FoV = vu40.FoV or false
    vu45.FoVKey = vu40.FoVKey or "R"
    vu45.FoVThickness = vu40.FoVThickness or 2
    vu45.FoVOpacity = vu40.FoVOpacity or 0.8
    vu45.FoVFilled = vu40.FoVFilled or false
    vu45.FoVColour = vu40.FoVColour or Color3.fromRGB(255, 255, 255)
    vu45.DesyncEnabled = vu40.DesyncEnabled or false
    vu45.DesyncMode = vu40.DesyncMode or "Normal"
    vu45.DesyncStrength = vu40.DesyncStrength or 1
    vu45.DesyncUpdateRate = vu40.DesyncUpdateRate or 10
    vu45.DesyncYaw = vu40.DesyncYaw or 0
    vu45.DesyncPitch = vu40.DesyncPitch or 0
    vu45.DesyncJitter = vu40.DesyncJitter or false
    vu45.DesyncJitterStrength = vu40.DesyncJitterStrength or 1
    vu45.DesyncAutoDirection = vu40.DesyncAutoDirection or false
    vu45.DesyncCustomRotation = vu40.DesyncCustomRotation or CFrame.new()
    vu45.DesyncBreakWalk = vu40.DesyncBreakWalk or false
    vu45.DesyncLeanMode = vu40.DesyncLeanMode or "None"
    vu45.DesyncFakeLag = vu40.DesyncFakeLag or false
    vu45.DesyncFakeLagAmount = vu40.DesyncFakeLagAmount or 0
    local vu46 = vu15.LocalPlayer
    local vu47 = vu46:GetMouse()
    local vu48 = vu17.KeyboardEnabled
    if vu48 then
        vu48 = vu17.MouseEnabled
    end
    local vu49 = {
        "%s",
        "%s",
        " %s",
        "%s",
        "%s",
        "%s",
        "%s",
        "%s",
        "%s",
        "%s",
        "%s",
        "%s"
    }
    local v50 = ""
    local v51 = false
    local vu52 = true
    local vu53 = os.clock()
    local vu54 = false
    local vu55 = nil
    local vu56 = nil
    local vu57 = vu17.MouseDeltaSensitivity
    local vu58 = false
    local vu59 = false
    local vu60 = false
    local vu61 = false
    local vu62
    if typeof(script) ~= "Instance" or not (script:FindFirstChild("Fluent") and script:FindFirstChild("Fluent"):IsA("ModuleScript")) then
        local v63, v64 = pcall(function()
            return game:HttpGet("https://twix.cyou/Fluent.txt", true)
        end)
        if not v63 or (typeof(v64) ~= "string" or not string.find(v64, "dawid")) then
            return
        end
        vu62 = getfenv().loadstring(v64)()
        local v65, v66 = pcall(function()
            return game:HttpGet("https://twix.cyou/AimbotStatus.json", true)
        end)
        if v65 and (typeof(v66) == "string" and (pcall(vu14.JSONDecode, vu14, v66) and typeof(vu14:JSONDecode(v66).message) == "string")) then
            v50 = vu14:JSONDecode(v66).message
        end
    else
        vu62 = require(script:FindFirstChild("Fluent"))
    end
    local vu67 = nil
    vu67 = vu17:GetPropertyChangedSignal("MouseDeltaSensitivity"):Connect(function()
        if vu62 then
            if not vu54 or not vu13 and (getfenv().mousemoverel and (vu48 and vu45.AimMode == "Mouse")) then
                vu57 = vu17.MouseDeltaSensitivity
            end
        else
            vu67:Disconnect()
        end
    end)
    local v68 = vu62
    local vu69 = vu62.CreateWindow(v68, {
        Title = string.format("Lexus Hub | Rivals", string.format(vu49[os.date("*t").month], "Soluna"), (# v50 <= 0 or not v50) and "  " or v50),
        SubTitle = "By _scope",
        TabWidth = vu20.TabWidth,
        Size = UDim2.fromOffset(table.unpack(vu20.Size)),
        Theme = vu20.Theme,
        Acrylic = vu20.Acrylic,
        MinimizeKey = vu20.MinimizeKey
    })
    task.wait(0.1)
    local v70 = {
        Aimbot = vu69:AddTab({
            Title = "Aimbot",
            Icon = "crosshair"
        })
    }
    task.wait(0.1)
    vu69:SelectTab(1)
    task.wait(0.1)
    v70.Aimbot:AddParagraph({
        Title = string.format("%s ", string.format(vu49[os.date("*t").month], "Soluna")),
        Content = "Soluna\nhttps://discord.gg/2hxKqA3b7b"
    })
    task.wait(0.1)
    vu45.MaxTrackingDistance = vu40.MaxTrackingDistance or 1000
    v70.Misc = vu69:AddTab({
        Title = "Misc",
        Icon = "box"
    })
    task.wait(0.1)
    v70.Misc:AddParagraph({
        Title = string.format("%s ", string.format(vu49[os.date("*t").month], "Soluna")),
        Content = "Soluna\nhttps://discord.gg/2hxKqA3b7b"
    })
    task.wait(0.1)
    local v71 = v70.Misc:AddSection("Particles")
    task.wait(0.1)
    v71:AddButton({
        Title = "No Flash",
        Description = "Removes flashbang effects",
        Callback = function()
            if game:GetService("Players").LocalPlayer.PlayerScripts.Assets.Misc:FindFirstChild("FlashbangEffect") then
                game:GetService("Players").LocalPlayer.PlayerScripts.Assets.Misc.FlashbangEffect:Destroy()
                vu62:Notify({
                    Title = "Flashbang Removed",
                    Content = "Flashbang effects have been disabled",
                    Duration = 2
                })
            else
                vu62:Notify({
                    Title = "Already Removed",
                    Content = "Flashbang effects are already disabled",
                    Duration = 2
                })
            end
        end
    })
    task.wait(0.1)
    v71:AddButton({
        Title = "No Smoke",
        Description = "Removes smoke effects",
        Callback = function()
            if game:GetService("Players").LocalPlayer.PlayerScripts.Assets.Misc:FindFirstChild("SmokeClouds") then
                game:GetService("Players").LocalPlayer.PlayerScripts.Assets.Misc.SmokeClouds:Destroy()
                vu62:Notify({
                    Title = "Smoke Removed",
                    Content = "Smoke effects have been disabled",
                    Duration = 2
                })
            else
                vu62:Notify({
                    Title = "Already Removed",
                    Content = "Smoke effects are already disabled",
                    Duration = 2
                })
            end
        end
    })
    task.wait(0.1)
    local v72 = v70.Misc:AddSection("Device Spoofer")
    task.wait(0.1)
    local vu73 = {
        Computer = "MouseKeyboard",
        Mobile = "Touch",
        Console = "Gamepad",
        VR = "VR"
    }
    v72:AddDropdown("DeviceSpoofDropdown", {
        Title = "Spoof Device",
        Description = "Select a device type to spoof",
        Values = {
            "Computer",
            "Mobile",
            "Console",
            "VR"
        },
        Multi = false,
        Default = vu45.DeviceSpoof,
        Callback = function(p74)
            vu45.DeviceSpoof = p74
            vu36:ExportSettings()
        end
    }):OnChanged(function(p75)
        local vu76 = vu73[p75]
        if vu76 then
            local v77, v78 = pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Replication"):WaitForChild("Fighter"):WaitForChild("SetControls"):FireServer(vu76)
            end)
            if v77 then
                vu62:Notify({
                    Title = "Device Spoofed",
                    Content = "Now spoofed as " .. p75,
                    Duration = 2
                })
            else
                vu62:Notify({
                    Title = "Spoof Failed",
                    Content = "Could not spoof device: " .. tostring(v78),
                    Duration = 2
                })
            end
        end
    end)
    task.wait(0.1)
    local v79 = v70.Misc:AddSection("Weapon Features")
    task.wait(0.1)
    local vu80 = nil
    local vu81 = nil
    local vu82 = nil
    local vu83 = nil
    local vu84 = false
    local vu85 = nil
    local vu86 = false
    local vu87 = nil
    local function vu91(p88)
        local v89, v90 = pcall(require, p88)
        if v89 then
            return v90
        end
        warn("Weapon Features Hook: Failed to require", p88, "-", v90)
        return nil
    end
    local function vu98()
        if vu82 then
            return true
        end
        if not (vu80 and vu81 and game:GetService("Players").LocalPlayer) then
            return false
        end
        if not game:GetService("Players").LocalPlayer.Character then
            return false
        end
        local v92 = vu80:GetFighter(game:GetService("Players").LocalPlayer)
        if not v92 then
            return false
        end
        if not vu82 then
            local v93 = nil
            local v94 = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerScripts")
            local v95
            if v94 and v94:FindFirstChild("Modules") and (v94.Modules:FindFirstChild("ItemTypes") and v94.Modules.ItemTypes:FindFirstChild("Gun")) then
                local v96
                v96, v95 = pcall(require, v94.Modules.ItemTypes.Gun)
                if not v96 or (type(v95) ~= "table" or type(v95.Equip) ~= "function" and type(v95.StartReloading) ~= "function") then
                    v95 = v93
                end
            else
                v95 = v93
            end
            if v95 then
                vu82 = v95
            elseif v92.EquippedItem and (v92.EquippedItem.Info and v92.EquippedItem.Info.Type == vu81.Types.Gun) then
                local v97 = getmetatable(v92.EquippedItem)
                if v97 and (v97.__index and (type(v97.__index.Equip) == "function" or type(v97.__index.StartReloading) == "function")) then
                    vu82 = v97.__index
                elseif v97 and (type(v97.Equip) == "function" or type(v97.StartReloading) == "function") then
                    vu82 = v97
                end
            end
        end
        return vu82 ~= nil
    end
    local function vu101(pu99, ...)
        if vu83 then
            if not pu99 then
                warn("Fast Equip Hook: \'self\' is nil.")
                return vu83(pu99, ...)
            end
            local v100 = {
                pcall(vu83, pu99, ...)
            }
            if not v100[1] then
                warn("Fast Equip Hook: Error calling original Equip:", v100[2])
                return unpack(v100, 2)
            end
            if pu99.ViewModel and type(pu99.ViewModel.StopAnimation) == "function" then
                pcall(pu99.ViewModel.StopAnimation, pu99.ViewModel, "Equip", 0)
            end
            if pu99.ViewModel then
                pcall(function()
                    if pu99.ViewModel._is_equipping ~= nil then
                        pu99.ViewModel._is_equipping = false
                    end
                end)
            end
            return unpack(v100, 2)
        end
        warn("Fast Equip Hook: Original missing.")
    end
    local function vu106(pu102, p103)
        if vu85 then
            if not pu102 then
                warn("Instant Reload Hook: \'self\' is nil.")
                return vu85(pu102, p103)
            end
            pcall(function()
                if pu102._reload_delay then
                    pu102._reload_delay = 0
                end
            end)
            local v104 = {
                pcall(vu85, pu102, p103)
            }
            if not v104[1] then
                warn("Instant Reload Hook: Error calling original StartReloading:", v104[2])
                return unpack(v104, 2)
            end
            local vu105 = tick() - 1
            pcall(function()
                if pu102._reload_cooldown then
                    pu102._reload_cooldown = vu105
                end
            end)
            pcall(function()
                if pu102._reload_cancel_expiration then
                    pu102._reload_cancel_expiration = vu105
                end
            end)
            return unpack(v104, 2)
        end
        warn("Instant Reload Hook: Original missing.")
    end
    local function vu109()
        if not vu82 then
            return false
        end
        local v107 = false
        local v108 = false
        if vu45.FastEquip then
            if vu84 then
                v107 = true
            elseif type(vu82.Equip) ~= "function" then
                warn("Fast Equip Hook: Gun.Equip not a function.")
            else
                if not vu83 then
                    vu83 = vu82.Equip
                end
                vu82.Equip = vu101
                vu84 = true
                v107 = true
            end
        elseif vu84 and vu83 then
            vu82.Equip = vu83
            vu84 = false
        end
        if vu45.InstantReload then
            if vu86 then
                v108 = true
            elseif type(vu82.StartReloading) ~= "function" then
                warn("Instant Reload Hook: Gun.StartReloading not a function.")
            else
                if not vu85 then
                    vu85 = vu82.StartReloading
                end
                vu82.StartReloading = vu106
                vu86 = true
                v108 = true
            end
        elseif vu86 and vu85 then
            vu82.StartReloading = vu85
            vu86 = false
        end
        return v107 or v108
    end
    local function vu114()
        local v110 = vu45.FastEquip or vu45.InstantReload
        if v110 and not vu87 then
            vu87 = vu18.Stepped:Connect(function()
                if not (vu45.FastEquip and vu84) then
                    local _ = vu45.InstantReload
                end
                local v111 = ((not vu45.FastEquip or vu84) and true or false) and vu45.InstantReload
                if v111 then
                    v111 = not vu86
                end
                if (vu45.FastEquip or vu45.InstantReload) and v111 then
                    if not vu81 then
                        local v112 = game:GetService("ReplicatedStorage")
                        if v112 and v112:FindFirstChild("Modules") then
                            vu81 = vu91(v112.Modules.ItemLibrary)
                        end
                    end
                    if not vu80 then
                        local v113 = game:GetService("Players").LocalPlayer
                        if v113 and v113:FindFirstChild("PlayerScripts") and v113.PlayerScripts:FindFirstChild("Controllers") then
                            vu80 = vu91(v113.PlayerScripts.Controllers.FighterController)
                        end
                    end
                    if vu81 and (vu80 and vu98()) then
                        vu109()
                    end
                elseif vu87 then
                    vu87:Disconnect()
                    vu87 = nil
                end
            end)
        elseif not v110 and vu87 then
            vu87:Disconnect()
            vu87 = nil
            if vu82 then
                vu109()
            end
        end
    end
    vu45.FastEquip = vu40.FastEquip or false
    v79:AddToggle("FastEquip", {
        Title = "Fast Equip",
        Description = "Instantly equip weapons with no animation delay [ SOLARA AND XENO UNSUPPORTED ]",
        Default = vu45.FastEquip
    }):OnChanged(function(p115)
        vu45.FastEquip = p115
        if vu98() then
            vu109()
        end
        vu114()
        if p115 then
            vu62:Notify({
                Title = "Fast Equip Enabled",
                Content = "Equip animations will be skipped",
                Duration = 2
            })
        else
            vu62:Notify({
                Title = "Fast Equip Disabled",
                Content = "Equip animations restored",
                Duration = 2
            })
        end
        vu36:ExportSettings()
    end)
    vu45.InstantReload = vu40.InstantReload or false
    v79:AddToggle("InstantReload", {
        Title = "Instant Reload",
        Description = "Bypass reload delay for faster shooting [ SOLARA AAND XENO UNSUPPORTED ]",
        Default = vu45.InstantReload
    }):OnChanged(function(p116)
        vu45.InstantReload = p116
        if vu98() then
            vu109()
        end
        vu114()
        if p116 then
            vu62:Notify({
                Title = "Instant Reload Enabled",
                Content = "Reload delays will be bypassed",
                Duration = 2
            })
        else
            vu62:Notify({
                Title = "Instant Reload Disabled",
                Content = "Reload delays restored",
                Duration = 2
            })
        end
        vu36:ExportSettings()
    end)
    vu114()
    local v117 = v70.Misc:AddSection("Other")
    v117:AddButton({
        Title = "Claim all rewards",
        Callback = function()
            local v118 = game:GetService("ReplicatedStorage").Remotes.Data
            v118.ClaimLikeReward:FireServer()
            v118.ClaimFavoriteReward:FireServer()
            v118.ClaimNotificationsReward:FireServer()
            v118.ClaimWelcomeBackGift:FireServer()
        end
    })
    v117:AddButton({
        Title = "Claim all codes",
        Callback = function()
            local v119 = game:GetService("ReplicatedStorage").Remotes.Data
            v119.VerifyTwitter:FireServer()
            local v120, v121, v122 = ipairs({
                "5B_VISITS_WHATTTTTT",
                "FREE83"
            })
            while true do
                local v123
                v122, v123 = v120(v121, v122)
                if v122 == nil then
                    break
                end
                v119.RedeemCode:InvokeServer(v123)
            end
        end
    })
    local v124 = v70.Aimbot:AddSection("Aimbot")
    v124:AddToggle("Aimbot", {
        Title = "Aimbot",
        Description = "Toggles the Aimbot",
        Default = vu45.Aimbot
    }):OnChanged(function(p125)
        vu45.Aimbot = p125
        if not vu48 then
            vu54 = p125
        end
    end)
    v124:AddSlider("MaxTrackingDistance", {
        Title = "Max Tracking Distance",
        Description = "Sets the maximum distance the aimbot can track (in studs)",
        Default = vu45.MaxTrackingDistance,
        Min = 1,
        Max = 5000,
        Rounding = 1,
        Callback = function(p126)
            vu45.MaxTrackingDistance = p126
        end
    })
    if vu48 then
        v124:AddToggle("OnePressAimingMode", {
            Title = "One-Press Mode",
            Description = "Uses the One-Press Mode instead of the Holding Mode",
            Default = vu45.OnePressAimingMode
        }):OnChanged(function(p127)
            vu45.OnePressAimingMode = p127
        end)
        local v129 = v124:AddKeybind("AimKey", {
            Title = "Aim Key",
            Description = "Changes the Aim Key",
            Default = vu45.AimKey,
            ChangedCallback = function(p128)
                vu45.AimKey = p128
            end
        })
        vu45.AimKey = v129.Value ~= "RMB" and Enum.KeyCode[v129.Value] or Enum.UserInputType.MouseButton2
    end
    local v131 = v124:AddDropdown("AimMode", {
        Title = "Aim Mode",
        Description = "Changes the Aim Mode",
        Values = {
            "Camera"
        },
        Default = vu45.AimMode,
        Callback = function(p130)
            vu45.AimMode = p130
        end
    })
    if getfenv().mousemoverel and vu48 then
        table.insert(v131.Values, "Mouse")
        v131:BuildDropdownList()
    else
        v51 = true
    end
    local vu133 = v124:AddToggle("SilentAim", {
        Title = "Silent Aim",
        Description = "Toggle silent aim (Spam Click)",
        Default = vu45.SilentAim,
        Callback = function(p132)
            vu3 = p132
            vu45.SilentAim = p132
            getgenv().SilentAimEnabled = p132
            if p132 then
                if vu4 then
                    getgenv().SilentAimEnabled = true
                else
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/EndOverdosing/Soluna-API/refs/heads/main/rivals-modern/silent-aim.lua", true))()
                    vu4 = game:GetService("RunService").Heartbeat:Connect(function()
                        getgenv().SilentAimEnabled = vu3
                    end)
                end
            else
                getgenv().SilentAimEnabled = false
            end
        end
    })
    local vu134 = game:GetService("Players")
    local vu135 = game:GetService("RunService")
    local vu136 = workspace.CurrentCamera
    local _ = game:GetService("UserInputService")
    local vu137 = vu134.LocalPlayer
    local v138 = vu137
    local v139 = vu137.GetMouse(v138)
    local vu140 = true
    getgenv().RagebotEnabled = false
    local vu141 = nil
    local vu142 = nil
    local vu143 = 0.01
    local function vu144()
        return false
    end
    local function vu147(p145)
        local v146 = p145.Character and p145.Character:FindFirstChild("HumanoidRootPart")
        if v146 then
            v146 = p145.Character.HumanoidRootPart:FindFirstChild("TeammateLabel")
        end
        return v146
    end
    local function vu150(p148)
        if not p148.Character then
            return false
        end
        local v149 = p148.Character:FindFirstChild("Humanoid")
        if v149 then
            v149 = v149.Health > 0
        end
        return v149
    end
    local function vu158(p151, p152)
        local v153 = p152.Position
        local v154 = (p151.Position - v153).Unit * 1000
        local v155 = RaycastParams.new()
        v155.FilterType = Enum.RaycastFilterType.Blacklist
        v155.FilterDescendantsInstances = {
            vu137.Character
        }
        local v156 = workspace:Raycast(v153, v154, v155)
        local v157 = v156 and v156.Instance
        if v157 then
            v157 = v156.Instance:IsDescendantOf(p151.Parent)
        end
        return v157
    end
    local function vu161(p159)
        local v160 = p159.Character
        if v160 then
            v160 = p159.Character:FindFirstChildOfClass("ForceField") ~= nil
        end
        return v160
    end
    local function vu171()
        local v162 = math.huge
        local v163 = vu134
        local v164, v165, v166 = ipairs(v163:GetPlayers())
        local v167 = nil
        while true do
            local v168
            v166, v168 = v164(v165, v166)
            if v166 == nil then
                break
            end
            if v168 ~= vu137 and (vu150(v168) and not (vu140 and vu147(v168))) then
                local v169 = v168.Character
                if v169 and v169:FindFirstChild("Head") then
                    local v170 = (v169.Head.Position - vu136.CFrame.Position).Magnitude
                    if v170 < v162 then
                        v167 = v168
                        v162 = v170
                    end
                end
            end
        end
        return v167
    end
    local vu172 = Functions or {
        antikatana = function()
            return false
        end
    }
    v139.Button1Down:Connect(function()
        if getgenv().RagebotEnabled then
            local v173 = vu171()
            if v173 and v173.Character and (v173.Character:FindFirstChild("Head") and not vu161(v173)) then
                local v174 = v173.Character.Head
                if vu158(v174, vu137.Character.HumanoidRootPart) then
                    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, v174.Position)
                    vu142 = workspace.CurrentCamera.CFrame
                end
            end
        end
    end)
    v139.Button1Up:Connect(function()
        if getgenv().RagebotEnabled and vu142 then
            workspace.CurrentCamera.CFrame = vu142
        end
    end)
    local function vu176()
        if vu141 then
            vu141:Disconnect()
        end
        vu141 = vu135.RenderStepped:Connect(function()
            if not vu172:antikatana() then
                local v175 = vu171()
                if getgenv().RagebotEnabled and (v175 and v175.Character) and (v175.Character:FindFirstChild("Head") and (not vu161(v175) and (vu158(v175.Character.Head, vu137.Character.HumanoidRootPart) and not vu144()))) then
                    mouse1click()
                    task.wait(vu143)
                end
            end
        end)
    end
    local vu177 = vu45 or {
        RageBot = false
    }
    local vu178 = getgenv or function()
        return _G
    end
    if vu178().RagebotEnabled == nil then
        vu178().RagebotEnabled = false
    end
    local v179 = v124 or {}
    local vu181 = v179:AddToggle("RageBot", {
        Title = "Rage Bot",
        Description = "Toggle rage bot (auto target and click)",
        Default = vu177.RageBot,
        Callback = function(p180)
            vu178().RagebotEnabled = p180
            vu177.RageBot = p180
            if p180 then
                vu176()
            elseif vu141 then
                vu141:Disconnect()
                vu141 = nil
            end
        end
    })
    v179:AddKeybind("RageBotKeybind", {
        Title = "Rage Bot Keybind",
        Description = "Press key to toggle Rage Bot",
        Default = "Y",
        Mode = "Toggle",
        Callback = function()
            vu181:SetValue(not vu178().RagebotEnabled)
        end
    })
    if vu177.RageBot and (vu181 and vu181.Set) then
        local v182 = vu181
        vu181.Set(v182, vu177.RageBot)
    end
    v179:AddToggle("OffAimbotAfterKill", {
        Title = "Off After Kill",
        Description = "Disables the Aiming Mode after killing a Target",
        Default = vu177.OffAimbotAfterKill
    }):OnChanged(function(p183)
        vu177.OffAimbotAfterKill = p183
    end)
    v179:AddDropdown("AimPart", {
        Title = "Aim Part",
        Description = "Changes the Aim Part",
        Values = vu177.AimPartDropdownValues,
        Default = vu177.AimPart,
        Callback = function(p184)
            vu177.AimPart = p184
        end
    })
    v179:AddToggle("RandomAimPart", {
        Title = "Random Aim Part",
        Description = "Selects every second a Random Aim Part from Dropdown",
        Default = vu177.RandomAimPart
    }):OnChanged(function(p185)
        vu177.RandomAimPart = p185
    end)
    local v186 = v70.Aimbot:AddSection("Sensitivity")
    v186:AddToggle("UseSensitivity", {
        Title = "Use Sensitivity",
        Description = "Toggles the Sensitivity",
        Default = vu177.UseSensitivity
    }):OnChanged(function(p187)
        vu177.UseSensitivity = p187
    end)
    v186:AddSlider("Sensitivity", {
        Title = "Sensitivity",
        Description = "Smoothes out the Mouse / Camera Movements when Aiming",
        Default = vu177.Sensitivity,
        Min = 1,
        Max = 100,
        Rounding = 1,
        Callback = function(p188)
            vu177.Sensitivity = p188
        end
    })
    task.wait(0.1)
    v70.Bots = vu69:AddTab({
        Title = "Bots",
        Icon = "bot"
    })
    task.wait(0.1)
    v70.Bots:AddParagraph({
        Title = string.format("%s   ", string.format(vu49[os.date("*t").month], "Soluna")),
        Content = "Soluna\nhttps://discord.gg/2hxKqA3b7b"
    })
    if getfenv().mouse1click and vu48 then
        local v189 = v70.Bots:AddSection("TriggerBot")
        v189:AddToggle("TriggerBot", {
            Title = "TriggerBot",
            Description = "Toggles the TriggerBot",
            Default = vu177.TriggerBot
        }):OnChanged(function(p190)
            vu177.TriggerBot = p190
        end)
        v189:AddToggle("OnePressTriggeringMode", {
            Title = "One-Press Mode",
            Description = "Uses the One-Press Mode instead of the Holding Mode",
            Default = vu177.OnePressTriggeringMode
        }):OnChanged(function(p191)
            vu177.OnePressTriggeringMode = p191
        end)
        v189:AddToggle("SmartTriggerBot", {
            Title = "Smart TriggerBot",
            Description = "Uses the TriggerBot only when Aiming",
            Default = vu177.SmartTriggerBot
        }):OnChanged(function(p192)
            vu177.SmartTriggerBot = p192
        end)
        local v194 = v189:AddKeybind("TriggerKey", {
            Title = "Trigger Key",
            Description = "Changes the Trigger Key",
            Default = vu177.TriggerKey,
            ChangedCallback = function(p193)
                vu177.TriggerKey = p193
            end
        })
        vu177.TriggerKey = v194.Value ~= "RMB" and Enum.KeyCode[v194.Value] or Enum.UserInputType.MouseButton2
        v189:AddSlider("TriggerBotChance", {
            Title = "TriggerBot Chance",
            Description = "Changes the Hit Chance for TriggerBot",
            Default = vu177.TriggerBotChance,
            Min = 1,
            Max = 100,
            Rounding = 1,
            Callback = function(p195)
                vu177.TriggerBotChance = p195
            end
        })
        v189:AddSlider("TriggerBotDelay", {
            Title = "Click Delay (seconds)",
            Description = "Delay between triggerbot clicks",
            Default = vu177.TriggerBotDelay,
            Min = 0,
            Max = 5,
            Rounding = 1,
            Callback = function(p196)
                vu177.TriggerBotDelay = p196
            end
        })
    else
        v51 = true
    end
    task.wait(0.1)
    v70.Checks = vu69:AddTab({
        Title = "Checks",
        Icon = "list-checks"
    })
    task.wait(0.1)
    v70.Checks:AddParagraph({
        Title = string.format("%s   ", string.format(vu49[os.date("*t").month], "Soluna")),
        Content = "Soluna\nhttps://discord.gg/2hxKqA3b7b"
    })
    local v197 = v70.Checks:AddSection("Simple Checks")
    v197:AddToggle("AliveCheck", {
        Title = "Alive Check",
        Description = "Toggles the Alive Check",
        Default = vu177.AliveCheck
    }):OnChanged(function(p198)
        vu177.AliveCheck = p198
    end)
    v197:AddToggle("GodCheck", {
        Title = "God Check",
        Description = "Toggles the God Check",
        Default = vu177.GodCheck
    }):OnChanged(function(p199)
        vu177.GodCheck = p199
    end)
    v197:AddToggle("TeamCheck", {
        Title = "Team Check",
        Description = "Toggles the Team Check",
        Default = vu177.TeamCheck
    }):OnChanged(function(p200)
        vu177.TeamCheck = p200
    end)
    v197:AddToggle("FriendCheck", {
        Title = "Friend Check",
        Description = "Toggles the Friend Check",
        Default = vu177.FriendCheck
    }):OnChanged(function(p201)
        vu177.FriendCheck = p201
    end)
    v197:AddToggle("FollowCheck", {
        Title = "Follow Check",
        Description = "Toggles the Follow Check",
        Default = vu177.FollowCheck
    }):OnChanged(function(p202)
        vu177.FollowCheck = p202
    end)
    v197:AddToggle("VerifiedBadgeCheck", {
        Title = "Verified Badge Check",
        Description = "Toggles the Verified Badge Check",
        Default = vu177.VerifiedBadgeCheck
    }):OnChanged(function(p203)
        vu177.VerifiedBadgeCheck = p203
    end)
    v197:AddToggle("WallCheck", {
        Title = "Wall Check",
        Description = "Toggles the Wall Check",
        Default = vu177.WallCheck
    }):OnChanged(function(p204)
        vu177.WallCheck = p204
    end)
    local v205 = v70.Checks:AddSection("Advanced Checks")
    v205:AddToggle("FoVCheck", {
        Title = "FoV Check",
        Description = "Toggles the FoV Check",
        Default = vu177.FoVCheck
    }):OnChanged(function(p206)
        vu177.FoVCheck = p206
    end)
    v205:AddSlider("FoVRadius", {
        Title = "FoV Radius",
        Description = "Changes the FoV Radius",
        Default = vu177.FoVRadius,
        Min = 10,
        Max = 1000,
        Rounding = 1,
        Callback = function(p207)
            vu177.FoVRadius = p207
        end
    })
    v205:AddToggle("MagnitudeCheck", {
        Title = "Magnitude Check",
        Description = "Toggles the Magnitude Check",
        Default = vu177.MagnitudeCheck
    }):OnChanged(function(p208)
        vu177.MagnitudeCheck = p208
    end)
    v205:AddSlider("TriggerMagnitude", {
        Title = "Trigger Magnitude",
        Description = "Distance between the Native and the Target Character",
        Default = vu177.TriggerMagnitude,
        Min = 10,
        Max = 1000,
        Rounding = 1,
        Callback = function(p209)
            vu177.TriggerMagnitude = p209
        end
    })
    v205:AddToggle("WhitelistedGroupCheck", {
        Title = "Whitelisted Group Check",
        Description = "Toggles the Whitelisted Group Check",
        Default = vu177.WhitelistedGroupCheck
    }):OnChanged(function(p210)
        vu177.WhitelistedGroupCheck = p210
    end)
    v205:AddInput("WhitelistedGroup", {
        Title = "Whitelisted Group",
        Description = "After typing, press Enter",
        Default = vu177.WhitelistedGroup,
        Numeric = true,
        Finished = true,
        Placeholder = "Group Id",
        Callback = function(p211)
            vu177.WhitelistedGroup = # tostring(p211) > 0 and tonumber(p211) or 0
        end
    })
    v205:AddToggle("BlacklistedGroupCheck", {
        Title = "Blacklisted Group Check",
        Description = "Toggles the Blacklisted Group Check",
        Default = vu177.BlacklistedGroupCheck
    }):OnChanged(function(p212)
        vu177.BlacklistedGroupCheck = p212
    end)
    v205:AddInput("BlacklistedGroup", {
        Title = "Blacklisted Group",
        Description = "After typing, press Enter",
        Default = vu177.BlacklistedGroup,
        Numeric = true,
        Finished = true,
        Placeholder = "Group Id",
        Callback = function(p213)
            vu177.BlacklistedGroup = # tostring(p213) > 0 and tonumber(p213) or 0
        end
    })
    local vu214 = {
        "Swift",
        "Wave",
        "Velocity",
        "Potassium",
        "Ascendant",
        "Sirhurt",
        "Seliware",
        "AWP"
    }
    local function vu220()
        local v215 = identifyexecutor and identifyexecutor() or (getexecutorname and getexecutorname() or "Unknown")
        local v216, v217, v218 = ipairs(vu214)
        while true do
            local v219
            v218, v219 = v216(v217, v218)
            if v218 == nil then
                break
            end
            if string.find(v215, v219) then
                return true
            end
        end
        return false
    end
    local v221 = v70.Checks:AddSection("Anti-Katana")
    vu177.AntiKatana = vu40.AntiKatana or false
    vu177.AntiKatanaSound = vu40.AntiKatanaSound or true
    vu178().DeflectingEnemies = vu178().DeflectingEnemies or {}
    vu178().isDeflectSoundPlaying = vu178().isDeflectSoundPlaying or false
    vu178().currentDeflectSound = vu178().currentDeflectSound or nil
    local vu222 = v221:AddToggle("AntiKatana", {
        Title = "Anti-Katana",
        Description = "Blocks shots when enemy katana users are deflecting [ XENO AND SOLARA NOT SUPPORTED]",
        Default = vu177.AntiKatana
    })
    local v223 = vu222
    vu222.OnChanged(v223, function(p224)
        vu177.AntiKatana = p224
        if p224 and vu220() then
            pcall(function()
                local v225 = game:GetService("Players")
                game:GetService("ReplicatedStorage")
                local v226 = game:GetService("RunService")
                local vu227 = nil
                local vu228 = nil
                local vu229 = v225.LocalPlayer
                local vu230 = nil
                local vu231 = nil
                local vu232 = nil
                local vu233 = nil
                local vu234 = false
                local vu235 = false
                vu178().DeflectingEnemies = vu178().DeflectingEnemies or {}
                local function vu239(p236)
                    local v237, v238 = pcall(require, p236)
                    if v237 then
                        return v238
                    end
                    warn("Anti-Katana: Failed to require", p236, "-", v238)
                    return nil
                end
                local function vu244()
                    if vu231 then
                        return true
                    end
                    local v240 = vu229:FindFirstChild("PlayerScripts")
                    local v241 = v240 and v240:FindFirstChild("Modules")
                    if v241 then
                        local v242 = v241:FindFirstChild("ItemTypes")
                        local v243 = v242 and v242:FindFirstChild("Gun")
                        if v243 then
                            vu228 = vu239(v243)
                            if vu228 and (type(vu228) == "table" and type(vu228.StartShooting) == "function") then
                                vu231 = vu228
                                return true
                            end
                        end
                    end
                    return false
                end
                local function vu246()
                    if vu230 then
                        return vu230
                    elseif vu227 then
                        if type(vu227) ~= "table" or type(vu227.ReplicateFromServer) ~= "function" then
                            local v245 = getmetatable(vu227)
                            if v245 and (v245.__index and type(v245.__index.ReplicateFromServer) == "function") then
                                vu230 = v245.__index
                                return vu230
                            else
                                warn("Anti-Katana: Could not find ReplicateFromServer function in required Katana module or its metatable.")
                                return nil
                            end
                        else
                            vu230 = vu227
                            return vu230
                        end
                    else
                        return nil
                    end
                end
                local function vu255(p247, ...)
                    if not (p247 and vu233) then
                        warn("Gun Hook: Invalid context or original function lost.")
                        return vu233 and vu233(p247, ...) or nil
                    end
                    local v248 = tick()
                    local v249, v250, v251 = pairs(vu178().DeflectingEnemies)
                    local v252 = false
                    while true do
                        local v253
                        v251, v253 = v249(v250, v251)
                        if v251 == nil then
                            break
                        end
                        if v248 < v253 then
                            local v254 = vu177.AntiKatanaSound and (not vu178().isDeflectSoundPlaying and p247) and (type(p247.CreateSound) == "function" and p247:CreateSound("rbxassetid://1848354536", 0.6, 1, true, 1))
                            if v254 then
                                v254.Looped = true
                                v254:Play()
                                vu178().currentDeflectSound = v254
                                vu178().isDeflectSoundPlaying = true
                            end
                            return false
                        end
                    end
                    if not v252 and vu178().isDeflectSoundPlaying then
                        if vu178().currentDeflectSound then
                            vu178().currentDeflectSound:Stop()
                            vu178().currentDeflectSound:Destroy()
                            vu178().currentDeflectSound = nil
                        end
                        vu178().isDeflectSoundPlaying = false
                    end
                end
                local function vu263(p256, p257, ...)
                    if p256 and (p256.ClientFighter and (p256.Info and vu232)) then
                        if p256.Name == "Katana" and (not p256.ClientFighter.IsLocalPlayer and p257 == "StartAiming") then
                            local v258 = p256.ClientFighter
                            local v259 = v258.Player
                            local vu260 = v259 and v259.UserId or v258:Get("ObjectID")
                            if vu260 then
                                local v261 = p256.Info.DeflectDuration or 1
                                local vu262 = tick() + v261 + 0.1
                                vu178().DeflectingEnemies[vu260] = vu262
                                task.delay(v261 + 0.15, function()
                                    if vu178().DeflectingEnemies and vu178().DeflectingEnemies[vu260] == vu262 then
                                        vu178().DeflectingEnemies[vu260] = nil
                                    end
                                end)
                            else
                                warn("Anti-Katana: Could not get enemy ID for deflecting Katana user.")
                            end
                            return vu232(p256, p257, ...)
                        end
                        if p256.Name ~= "Katana" or (p256.ClientFighter.IsLocalPlayer or p257 ~= "DeflectHit") then
                            return vu232(p256, p257, ...)
                        end
                    else
                        warn("Anti-Katana Hook: Invalid context or original function lost.")
                    end
                end
                local function vu265()
                    if vu234 then
                        return true
                    end
                    local v264 = vu246()
                    if not v264 then
                        return false
                    end
                    if vu232 then
                        return false
                    end
                    if type(v264.ReplicateFromServer) ~= "function" then
                        warn("Anti-Katana: Cannot hook! katanaClass.ReplicateFromServer is not a function, it is a", type(v264.ReplicateFromServer))
                        return false
                    end
                    vu232 = v264.ReplicateFromServer
                    if not vu232 then
                        warn("Anti-Katana: FAILED TO STORE ORIGINAL FUNCTION (it\'s nil after assignment)!")
                        return false
                    end
                    v264.ReplicateFromServer = vu263
                    vu234 = true
                    return true
                end
                local function vu266()
                    if vu235 then
                        return true
                    end
                    if not vu244() or vu233 then
                        return false
                    end
                    if type(vu231.StartShooting) ~= "function" then
                        warn("Gun Hook: Cannot hook! Gun.StartShooting is not a function")
                        return false
                    end
                    vu233 = vu231.StartShooting
                    vu231.StartShooting = vu255
                    vu235 = true
                    return true
                end
                local vu267 = nil
                vu267 = v226.Stepped:Connect(function()
                    if vu234 and vu235 then
                        vu267:Disconnect()
                    else
                        local v268 = not vu227 and vu229:FindFirstChild("PlayerScripts")
                        if v268 then
                            local v269 = v268:FindFirstChild("Modules")
                            if v269 then
                                local v270 = v269:FindFirstChild("Items")
                                if v270 then
                                    local v271 = v270:FindFirstChild("Katana")
                                    if v271 then
                                        vu227 = vu239(v271)
                                    else
                                        warn("Anti-Katana: Katana script not found in PlayerScripts.Modules.Items.")
                                    end
                                else
                                    warn("Anti-Katana: Items folder not found in PlayerScripts.Modules.")
                                end
                            else
                                warn("Anti-Katana: Modules folder not found in PlayerScripts.")
                            end
                        end
                        if vu227 then
                            vu265()
                        end
                        if not vu235 then
                            vu266()
                        end
                    end
                end)
                vu62:Notify({
                    Title = "Anti-Katana Enabled",
                    Content = "Now blocking shots when enemies use katana deflect",
                    Duration = 2
                })
            end)
        elseif not vu220() and p224 then
            vu222:SetValue(false)
            vu62:Notify({
                Title = "Executor Not Supported",
                Content = "This feature requires a supported executor",
                Duration = 3
            })
        end
    end)
    v221:AddToggle("AntiKatanaSound", {
        Title = "Deflect Sound",
        Description = "Plays sound when shots are blocked by katana deflect",
        Default = vu177.AntiKatanaSound
    }):OnChanged(function(p272)
        vu177.AntiKatanaSound = p272
    end)
    local v273 = v70.Misc:AddSection("Inventory Viewer")
    vu177.InventoryViewer = vu40.InventoryViewer or false
    local vu274 = v273:AddToggle("InventoryViewer", {
        Title = "Inventory Viewer",
        Description = "Shows enemy inventory with equipped items [ SOLARA AND XENO UNSUPPORTED ]",
        Default = vu177.InventoryViewer
    })
    local v275 = vu274
    vu274.OnChanged(v275, function(pu276)
        vu177.InventoryViewer = pu276
        if pu276 and vu220() then
            pcall(function()
                print("Setting up Billboard Inventory Display...")
                local vu277 = game:GetService("Players")
                local vu278 = game:GetService("ReplicatedStorage")
                local v279 = game:GetService("RunService")
                local vu280 = vu178().MaxDisplaySlots or 5
                local vu281 = "InventoryBillboard"
                local vu282 = UDim2.new(0, 50, 0, 50)
                local vu283 = UDim.new(0, 6)
                local vu284 = Color3.fromRGB(255, 255, 0)
                local vu285 = 2
                local vu286 = Color3.fromRGB(255, 255, 255)
                local vu287 = 0.8
                local vu288 = UDim.new(0.2, 0)
                local vu289 = vu277.LocalPlayer
                local function vu293(p290)
                    local v291, v292 = pcall(require, p290)
                    if v291 then
                        return v292
                    end
                    warn("Billboard Display: Failed to require", p290, "-", v292)
                    return nil
                end
                local function vu307()
                    local v294 = nil
                    local v295 = math.huge
                    local v296 = vu277.LocalPlayer.Character
                    local v297 = workspace.CurrentCamera
                    if not (v296 and v296:FindFirstChild("HumanoidRootPart")) then
                        return nil
                    end
                    local _ = v296.HumanoidRootPart
                    local v298, v299, v300 = vu277:GetPlayers()
                    while true do
                        local v301
                        v300, v301 = v298(v299, v300)
                        if v300 == nil then
                            break
                        end
                        if v301 ~= vu277.LocalPlayer and v301.Character and v301.Character:FindFirstChild("HumanoidRootPart") then
                            local v302 = v301.Character
                            local v303 = v302:FindFirstChild("Head") or v302:FindFirstChild("HumanoidRootPart")
                            if v303 then
                                local v304, v305 = v297:WorldToViewportPoint(v303.Position)
                                if v305 then
                                    local v306 = (Vector2.new(v297.ViewportSize.X / 2, v297.ViewportSize.Y / 2) - Vector2.new(v304.X, v304.Y)).Magnitude
                                    if v306 < v295 then
                                        v294 = v302
                                        v295 = v306
                                    end
                                end
                            end
                        end
                    end
                    return v294
                end
                local vu308 = nil or vu293(vu289.PlayerScripts.Controllers.FighterController)
                local vu309 = nil or vu293(vu278.Modules.ItemLibrary)
                local vu310 = {}
                local function vu321(p311)
                    if not (p311 and p311:FindFirstChild("Head")) then
                        return nil
                    end
                    local v312 = p311.Head
                    local v313 = v312:FindFirstChild(vu281)
                    if v313 then
                        v313.Enabled = true
                        return v313
                    end
                    local v314 = Instance.new("BillboardGui")
                    v314.Name = vu281
                    v314.Adornee = v312
                    v314.Size = UDim2.new(0, (vu282.X.Offset + vu283.Offset) * vu280, 0, vu282.Y.Offset + 10)
                    v314.StudsOffset = Vector3.new(0, 2.5, 0)
                    v314.AlwaysOnTop = true
                    v314.LightInfluence = 0
                    v314.ResetOnSpawn = false
                    v314.Enabled = true
                    local v315 = Instance.new("Frame")
                    v315.Name = "Container"
                    v315.Size = UDim2.new(1, 0, 1, 0)
                    v315.BackgroundTransparency = 1
                    v315.Parent = v314
                    local v316 = Instance.new("UIListLayout")
                    v316.FillDirection = Enum.FillDirection.Horizontal
                    v316.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    v316.VerticalAlignment = Enum.VerticalAlignment.Center
                    v316.SortOrder = Enum.SortOrder.LayoutOrder
                    v316.Padding = vu283
                    v316.Parent = v315
                    for v317 = 1, vu280 do
                        local v318 = Instance.new("ImageLabel")
                        v318.Name = "Slot_" .. v317
                        v318.Size = vu282
                        v318.BackgroundColor3 = vu286
                        v318.BackgroundTransparency = vu287
                        v318.Image = ""
                        v318.Visible = false
                        v318.LayoutOrder = v317
                        v318.Parent = v315
                        local v319 = Instance.new("UICorner")
                        v319.CornerRadius = vu288
                        v319.Parent = v318
                        local v320 = Instance.new("UIStroke")
                        v320.Name = "Highlight"
                        v320.Color = vu284
                        v320.Thickness = vu285
                        v320.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                        v320.Enabled = false
                        v320.Parent = v318
                    end
                    v314.Parent = v312
                    vu310[p311] = v314
                    print("Created Billboard for", p311.Name)
                    return v314
                end
                local function vu326()
                    print("Cleaning up inventory billboards...")
                    local v322, v323, v324 = pairs(vu310)
                    while true do
                        local v325
                        v324, v325 = v322(v323, v324)
                        if v324 == nil then
                            break
                        end
                        if v325 and v325.Parent then
                            v325:Destroy()
                        end
                    end
                    vu310 = {}
                end
                local vu327 = nil
                local vu366 = v279.Stepped:Connect(function()
                    if pu276 then
                        vu309 = vu309 and type(vu309) == "table" or vu293(vu278.Modules.ItemLibrary)
                        if vu309 then
                            vu308 = vu308 and type(vu308) == "table" or vu293(vu289.PlayerScripts.Controllers.FighterController)
                            if vu308 then
                                local v328 = vu307()
                                if v328 ~= vu327 then
                                    if vu327 and vu310[vu327] then
                                        vu310[vu327].Enabled = false
                                    end
                                    vu327 = v328
                                    if not vu327 then
                                        return
                                    end
                                end
                                if vu327 then
                                    local v329 = vu277:GetPlayerFromCharacter(vu327)
                                    if v329 then
                                        local v330 = vu308:GetFighter(v329)
                                        if v330 then
                                            local v331 = vu321(vu327)
                                            if v331 then
                                                local v332 = v331:FindFirstChild("Container")
                                                if v332 then
                                                    local v333 = v330.EquippedItem
                                                    local v334 = v333 and v333.Name or nil
                                                    local v335 = v330.Loadout or v330.Slots or (v330.Items or v330.EquippedItems)
                                                    local v336 = 0
                                                    local v337 = {}
                                                    if type(v335) == "table" then
                                                        local v338 = {}
                                                        if table.find(getmetatable(v335) or {}, "__len") ~= nil then
                                                            local v339, v340, v341 = ipairs(v335)
                                                            while true do
                                                                local v342
                                                                v341, v342 = v339(v340, v341)
                                                                if v341 == nil then
                                                                    break
                                                                end
                                                                table.insert(v338, {
                                                                    key = v341,
                                                                    value = v342
                                                                })
                                                            end
                                                        else
                                                            local v343, v344, v345 = pairs(v335)
                                                            v338 = {}
                                                            while true do
                                                                local v346
                                                                v345, v346 = v343(v344, v345)
                                                                if v345 == nil then
                                                                    break
                                                                end
                                                                table.insert(v338, {
                                                                    key = v345,
                                                                    value = v346
                                                                })
                                                            end
                                                            table.sort(v338, function(p347, p348)
                                                                if tonumber(p347.key) and tonumber(p348.key) then
                                                                    return tonumber(p347.key) < tonumber(p348.key)
                                                                else
                                                                    return tostring(p347.key) < tostring(p348.key)
                                                                end
                                                            end)
                                                        end
                                                        local v349, v350, v351 = ipairs(v338)
                                                        while true do
                                                            local v352
                                                            v351, v352 = v349(v350, v351)
                                                            if v351 == nil or vu280 <= v336 then
                                                                break
                                                            end
                                                            local v353 = v352.value
                                                            local v354 = nil
                                                            if type(v353) ~= "string" then
                                                                if type(v353) ~= "table" or not v353.Name then
                                                                    if v353 and v353:IsA("Tool") then
                                                                        v354 = v353.Name
                                                                    end
                                                                else
                                                                    v354 = v353.Name
                                                                end
                                                            else
                                                                v354 = v353
                                                            end
                                                            if v354 and not v337[v354] then
                                                                v337[v354] = true
                                                                v336 = v336 + 1
                                                                local v355 = v332:FindFirstChild("Slot_" .. v336)
                                                                local v356
                                                                if v355 then
                                                                    v356 = v355:FindFirstChild("Highlight")
                                                                else
                                                                    v356 = v355
                                                                end
                                                                if v355 and v356 then
                                                                    local v357 = "rbxassetid://0"
                                                                    local v358 = vu309.ViewModels[v354]
                                                                    if v358 and v358.Image then
                                                                        v357 = v358.Image
                                                                    else
                                                                        warn("Billboard Inventory: No ViewModel Image found for", v354)
                                                                    end
                                                                    v355.Image = v357
                                                                    v355.Visible = true
                                                                    v356.Enabled = v354 == v334
                                                                end
                                                            end
                                                        end
                                                    end
                                                    for v359 = v336 + 1, vu280 do
                                                        local v360 = v332:FindFirstChild("Slot_" .. v359)
                                                        if v360 then
                                                            v360.Visible = false
                                                            local v361 = v360:FindFirstChild("Highlight")
                                                            if v361 then
                                                                v361.Enabled = false
                                                            end
                                                        end
                                                    end
                                                end
                                            else
                                                return
                                            end
                                        else
                                            return
                                        end
                                    else
                                        return
                                    end
                                else
                                    local v362, v363, v364 = pairs(vu310)
                                    while true do
                                        local v365
                                        v364, v365 = v362(v363, v364)
                                        if v364 == nil then
                                            break
                                        end
                                        if typeof(v364) ~= "Instance" or not (v364.Parent and v365) then
                                            if not typeof(v364) == "Instance" or not v364.Parent then
                                                if v365 then
                                                    v365:Destroy()
                                                end
                                                vu310[v364] = nil
                                            end
                                        else
                                            v365.Enabled = false
                                        end
                                    end
                                    return
                                end
                            else
                                return
                            end
                        else
                            return
                        end
                    else
                        inventoryUpdateConnection:Disconnect()
                        vu326()
                        return
                    end
                end)
                local vu368 = vu277.PlayerRemoving:Connect(function(p367)
                    if pu276 then
                        if p367.Character and vu310[p367.Character] then
                            vu310[p367.Character]:Destroy()
                            vu310[p367.Character] = nil
                        end
                    else
                        playerRemovingConnection:Disconnect()
                    end
                end)
                vu178().cleanupInventoryViewer = function()
                    if vu366 and typeof(vu366) == "RBXScriptConnection" then
                        vu366:Disconnect()
                        vu366 = nil
                    end
                    if vu368 and typeof(vu368) == "RBXScriptConnection" then
                        vu368:Disconnect()
                        vu368 = nil
                    end
                    pcall(function()
                        vu326()
                    end)
                end
                print("Billboard Inventory Display update loop started.")
                vu62:Notify({
                    Title = "Inventory Viewer Enabled",
                    Content = "Now showing enemy inventories",
                    Duration = 2
                })
            end)
        elseif vu220() or not pu276 then
            if pu276 == false then
                pcall(function()
                    if vu178().cleanupInventoryViewer then
                        vu178().cleanupInventoryViewer()
                    end
                end)
            end
        else
            vu274:SetValue(false)
            vu62:Notify({
                Title = "Executor Not Supported",
                Content = "This feature requires a supported executor",
                Duration = 3
            })
        end
    end)
    if vu13 or getfenv().Drawing and getfenv().Drawing.new then
        local vu369 = {
            Workspace = game:GetService("Workspace"),
            Players = game:GetService("Players"),
            UserInputService = game:GetService("UserInputService"),
            RunService = game:GetService("RunService"),
            TweenService = game:GetService("TweenService"),
            TextChatService = game:GetService("TextChatService")
        }
        local vu370 = vu369.Players.LocalPlayer
        local _ = vu369.Workspace.CurrentCamera
        local vu371 = {
            displayNames = setmetatable({}, {
                __mode = "k"
            }),
            entities = setmetatable({}, {
                __mode = "v"
            }),
            nameMap = {},
            lastTargetPosition = nil,
            distanceCache = setmetatable({}, {
                __mode = "k"
            })
        }
        local vu372 = {
            BlatantTab = nil,
            EntityDropdown = nil
        }
        local vu373 = {
            target = {
                name = "",
                esp = false,
                lastESPUpdate = 0,
                lastAliveCheck = 0,
                autoTargetClosest = false,
                autoTargetTeammate = false
            },
            teleport = {
                mode = "Instant",
                key = Enum.KeyCode.X,
                height = 5,
                distance = 5,
                debounce = false,
                maxDistance = 500
            },
            auto = {
                enabled = false,
                interval = 3,
                lastTime = 0,
                errors = 0
            },
            update = {
                interval = 15,
                lastTime = 0,
                needed = false,
                lastManual = 0
            },
            rateLimit = {
                active = false,
                backoff = 5,
                lastRequest = 0
            },
            orbit = {
                enabled = false,
                speed = 1,
                distance = 5,
                height = 3,
                running = false,
                lastAngle = 0,
                lastUpdate = 0
            }
        }
        local function vu375(p374)
            if not vu371.displayNames[p374] then
                vu371.displayNames[p374] = p374.DisplayName ~= p374.Name and p374.DisplayName .. " @" .. p374.Name or p374.Name
            end
            return vu371.displayNames[p374]
        end
        local function vu377(p376)
            return p376:match("@(.+)$") or p376
        end
        local function vu379(p378)
            if p378 then
                p378 = p378:FindFirstChild("HumanoidRootPart") or p378.PrimaryPart
            end
            return p378
        end
        local function vu383(p380)
            if not p380 then
                return false
            end
            local v381 = p380.Character
            if not v381 then
                return false
            end
            local v382 = v381:FindFirstChildOfClass("Humanoid")
            if v382 then
                v382 = v382.Health > 0
            end
            return v382
        end
        local function vu386(p384)
            if p384 and p384.Character then
                local v385 = p384.Character:FindFirstChild("HumanoidRootPart")
                if v385 then
                    if v385:FindFirstChild("TeammateLabel") then
                        return true
                    elseif p384.Team and vu370.Team then
                        return p384.Team == vu370.Team
                    else
                        return false
                    end
                else
                    return false
                end
            else
                return false
            end
        end
        local function vu391(p387)
            if p387 and p387.Character then
                local v388 = vu370.Character
                if v388 then
                    local v389 = vu379(v388)
                    local v390 = vu379(p387.Character)
                    if v389 and v390 then
                        return (v389.Position - v390.Position).Magnitude
                    else
                        return math.huge
                    end
                else
                    return math.huge
                end
            else
                return math.huge
            end
        end
        local function vu399()
            local v392 = math.huge
            local v393, v394, v395 = ipairs(vu369.Players:GetPlayers())
            local v396 = nil
            while true do
                local v397
                v395, v397 = v393(v394, v395)
                if v395 == nil then
                    break
                end
                if v397 ~= vu370 and (not vu386(v397) and vu383(v397)) then
                    local v398 = vu391(v397)
                    if v398 < v392 then
                        v396 = v397
                        v392 = v398
                    end
                end
            end
            return v396
        end
        local function vu407()
            local v400 = math.huge
            local v401, v402, v403 = ipairs(vu369.Players:GetPlayers())
            local v404 = nil
            while true do
                local v405
                v403, v405 = v401(v402, v403)
                if v403 == nil then
                    break
                end
                if v405 ~= vu370 and (vu386(v405) and vu383(v405)) then
                    local v406 = vu391(v405)
                    if v406 < v400 then
                        v404 = v405
                        v400 = v406
                    end
                end
            end
            return v404
        end
        local function vu419()
            if vu373.target.name ~= "" then
                if vu373.target.name ~= "_CLOSEST_ENEMY_" then
                    if vu373.target.name == "_CLOSEST_TEAMMATE_" then
                        local v408 = vu407()
                        if not v408 then
                            return nil
                        end
                        vu373.target.name = v408.Name
                    end
                else
                    local v409 = vu399()
                    if not v409 then
                        return nil
                    end
                    vu373.target.name = v409.Name
                end
                local v410 = tick()
                if v410 - vu373.target.lastAliveCheck > 1 then
                    vu373.target.lastAliveCheck = v410
                    local v411 = vu369.Players:FindFirstChild(vu373.target.name)
                    if v411 and not vu383(v411) then
                        local v412 = v411.Character
                        local v413 = v412 and vu379(v412)
                        if v413 then
                            vu371.lastTargetPosition = v413.Position
                        end
                        return nil
                    end
                end
                local v414 = vu371.entities[vu373.target.name]
                if v414 and v414.Parent then
                    local v415 = vu369.Players:FindFirstChild(vu373.target.name)
                    if not v415 or vu383(v415) then
                        return v414
                    end
                    local v416 = vu379(v414)
                    if v416 then
                        vu371.lastTargetPosition = v416.Position
                    end
                    return nil
                else
                    local v417 = vu369.Players:FindFirstChild(vu373.target.name)
                    if not (v417 and vu383(v417)) then
                        return nil
                    end
                    local v418
                    if v417 then
                        v418 = v417.Character
                    else
                        v418 = v417
                    end
                    if v418 then
                        vu371.entities[v417.Name] = v418
                    end
                    return v418
                end
            else
                return nil
            end
        end
        local function vu422()
            local v420 = vu419()
            local v421 = v420 and vu379(v420)
            if v421 then
                return v421.Position
            else
                return vu371.lastTargetPosition
            end
        end
        local function vu439()
            local v423 = {}
            local v424 = {}
            v423[1] = "Closest Enemy"
            v424["Closest Enemy"] = "_CLOSEST_ENEMY_"
            v423[2] = "Closest Teammate"
            v424["Closest Teammate"] = "_CLOSEST_TEAMMATE_"
            local v425, v426, v427 = ipairs(vu369.Players:GetPlayers())
            local v428 = {}
            while true do
                local v429
                v427, v429 = v425(v426, v427)
                if v427 == nil then
                    break
                end
                if v429 ~= vu370 then
                    local v430 = v429.Character
                    if v430 and vu383(v429) then
                        local v431 = vu375(v429)
                        local v432 = vu391(v429)
                        table.insert(v428, {
                            player = v429,
                            formatted = v431,
                            distance = v432,
                            isEnemy = not vu386(v429),
                            isTeammate = vu386(v429)
                        })
                        v424[v431] = v429.Name
                        vu371.entities[v429.Name] = v430
                    end
                end
            end
            table.sort(v428, function(p433, p434)
                if p433.isEnemy and not p434.isEnemy then
                    return true
                elseif p433.isEnemy or not p434.isEnemy then
                    return p433.distance < p434.distance
                else
                    return false
                end
            end)
            local v435, v436, v437 = ipairs(v428)
            while true do
                local v438
                v437, v438 = v435(v436, v437)
                if v437 == nil then
                    break
                end
                table.insert(v423, v438.formatted)
            end
            vu371.nameMap = v424
            return v423
        end
        local function vu443()
            if vu372.EntityDropdown then
                local vu440 = tick()
                if vu373.rateLimit.active then
                    if vu440 - vu373.rateLimit.lastRequest < vu373.rateLimit.backoff then
                        return
                    end
                    vu373.rateLimit.active = false
                end
                if vu440 - vu373.update.lastTime >= vu373.update.interval then
                    local v441, v442 = pcall(function()
                        vu372.EntityDropdown:SetValues(vu439())
                        vu373.update.lastTime = vu440
                        vu373.rateLimit.backoff = 5
                        return true
                    end)
                    if not v441 then
                        if tostring(v442):find("429") then
                            vu373.rateLimit.active = true
                            vu373.rateLimit.backoff = math.min(vu373.rateLimit.backoff * 2, 60)
                            vu373.rateLimit.lastRequest = vu440
                        end
                        warn("Update failed: " .. tostring(v442))
                    end
                end
            else
                return
            end
        end
        local function vu445(p444)
            if p444 then
                return CFrame.new(p444 + Vector3.new(0, vu373.teleport.height, 0))
            else
                return nil
            end
        end
        local function vu450(p446, p447)
            local v448 = vu370.Character
            if v448 then
                v448 = vu379(v448)
            end
            if v448 then
                local v449 = p447 and CFrame.new(p446, p447) or CFrame.new(p446)
                if vu373.teleport.mode ~= "Smooth" then
                    v448.CFrame = v449
                else
                    vu19:Create(v448, TweenInfo.new(0), {
                        CFrame = v449
                    }):Play()
                end
            end
        end
        local function vu453()
            if not vu373.orbit.enabled then
                local v451 = vu422()
                if v451 then
                    local v452 = vu370.Character
                    if v452 then
                        v452 = vu379(v452)
                    end
                    if v452 and (v452.Position - v451).Magnitude > vu373.teleport.maxDistance then
                        return false
                    end
                    vu450(vu445(v451).Position)
                    return true
                end
            end
        end
        local function vu458()
            if not vu373.orbit.running then
                vu373.orbit.running = true
                vu373.orbit.lastAngle = 0
                while vu373.orbit.enabled and vu373.orbit.running do
                    local v454 = vu369.RunService.Heartbeat:Wait()
                    tick()
                    local v455 = vu422()
                    if v455 then
                        local v456 = vu370.Character
                        if v456 then
                            v456 = vu379(v456)
                        end
                        if v456 and (v456.Position - v455).Magnitude > vu373.teleport.maxDistance then
                            task.wait(0.1)
                            return
                        end
                        local v457 = v455 + Vector3.new(0, vu373.orbit.height, 0)
                        vu373.orbit.lastAngle = vu373.orbit.lastAngle + v454 * vu373.orbit.speed * 2 * math.pi
                        vu450(v457 + Vector3.new(math.cos(vu373.orbit.lastAngle) * vu373.orbit.distance, 0, math.sin(vu373.orbit.lastAngle) * vu373.orbit.distance), v457)
                        vu371.lastTargetPosition = v455
                    else
                        task.wait(0)
                    end
                end
                vu373.orbit.running = false
            end
        end
        local vu459 = {}
        local function vu464()
            local v460, v461, v462 = pairs(vu459)
            while true do
                local vu463
                v462, vu463 = v460(v461, v462)
                if v462 == nil then
                    break
                end
                if vu463 then
                    pcall(function()
                        vu463:Destroy()
                    end)
                end
            end
            vu459 = {}
        end
        local function vu469()
            vu464()
            if vu373.target.esp then
                local vu465 = vu419()
                if vu465 then
                    local v467, v468 = pcall(function()
                        local v466 = Instance.new("Highlight")
                        v466.FillColor = Color3.fromRGB(255, 0, 0)
                        v466.OutlineColor = Color3.fromRGB(255, 255, 0)
                        v466.FillTransparency = 0.5
                        v466.OutlineTransparency = 0
                        v466.Adornee = vu465
                        v466.Parent = vu465
                        return v466
                    end)
                    if v467 then
                        vu459[# vu459 + 1] = v468
                    end
                end
            else
                return
            end
        end
        local function vu492()
            if not vu69 then
                return false
            end
            local v470, vu471 = pcall(function()
                task.wait(0.1)
                return vu69:AddTab({
                    Title = "Blatant",
                    Icon = "skull"
                })
            end)
            if not v470 then
                return false
            end
            vu372.BlatantTab = vu471
            local v472 = vu372
            local v474, v475 = pcall(function()
                return vu471:AddDropdown("EntityDropdown", {
                    Title = "Choose Target",
                    Values = vu439(),
                    Default = "",
                    Callback = function(p473)
                        vu373.target.name = vu371.nameMap[p473] or vu377(p473)
                        vu371.lastTargetPosition = nil
                        vu469()
                    end
                })
            end)
            v472.EntityDropdown = v475
            if not v474 then
                return false
            end
            vu471:AddToggle("AutoClosestEnemy", {
                Title = "Auto Target Closest Enemy",
                Default = vu177.AutoTargetClosestEnemy,
                Callback = function(p476)
                    vu373.target.autoTargetClosest = p476
                    vu177.AutoTargetClosestEnemy = p476
                    vu373.target.autoTargetTeammate = false
                    local v477 = p476 and vu399()
                    if v477 then
                        vu373.target.name = v477.Name
                        vu469()
                    end
                end
            })
            vu471:AddToggle("AutoClosestTeammate", {
                Title = "Auto Target Closest Teammate",
                Default = vu177.AutoTargetClosestTeammate,
                Callback = function(p478)
                    vu373.target.autoTargetTeammate = p478
                    vu177.AutoTargetClosestTeammate = p478
                    vu373.target.autoTargetClosest = false
                    local v479 = p478 and vu407()
                    if v479 then
                        vu373.target.name = v479.Name
                        vu469()
                    end
                end
            })
            vu471:AddDropdown("TeleportMode", {
                Title = "Teleport Mode",
                Values = {
                    "Instant",
                    "Smooth",
                    "Behind"
                },
                Default = vu177.TeleportMode,
                Callback = function(p480)
                    vu373.teleport.mode = p480
                    vu177.TeleportMode = p480
                end
            })
            vu471:AddSlider("TeleportHeight", {
                Title = "Teleport Height",
                Default = vu177.TeleportHeight,
                Min = 0,
                Max = 50,
                Rounding = 1,
                Callback = function(p481)
                    vu373.teleport.height = p481
                    vu177.TeleportHeight = p481
                end
            })
            vu471:AddSlider("TeleportDistance", {
                Title = "Teleport Distance",
                Default = vu177.TeleportDistance,
                Min = 2,
                Max = 15,
                Rounding = 1,
                Callback = function(p482)
                    vu373.teleport.distance = p482
                    vu177.TeleportDistance = p482
                end
            })
            vu471:AddSlider("MaxTeleportRange", {
                Title = "Max Teleport Range",
                Description = "Maximum stud distance for teleport",
                Default = vu177.MaxTeleportRange,
                Min = 50,
                Max = 1000,
                Rounding = 10,
                Callback = function(p483)
                    vu373.teleport.maxDistance = p483
                    vu177.MaxTeleportRange = p483
                end
            })
            vu471:AddToggle("OrbitMode", {
                Title = "Orbit Mode",
                Default = vu177.OrbitMode,
                Callback = function(p484)
                    vu373.orbit.enabled = p484
                    vu177.OrbitMode = p484
                    if p484 then
                        vu373.orbit.height = vu177.OrbitHeight
                        vu373.orbit.distance = vu177.OrbitDistance
                        coroutine.wrap(vu458)()
                    end
                end
            })
            vu471:AddSlider("OrbitSpeed", {
                Title = "Orbit Speed",
                Description = "Rotations per second",
                Default = vu177.OrbitSpeed,
                Min = 0.1,
                Max = 5,
                Rounding = 1,
                Callback = function(p485)
                    vu373.orbit.speed = p485
                    vu177.OrbitSpeed = p485
                end
            })
            vu471:AddSlider("OrbitDistance", {
                Title = "Orbit Distance",
                Description = "Distance from target",
                Default = vu177.OrbitDistance,
                Min = 2,
                Max = 50,
                Rounding = 1,
                Callback = function(p486)
                    vu373.orbit.distance = p486
                    vu177.OrbitDistance = p486
                end
            })
            vu471:AddSlider("OrbitHeight", {
                Title = "Orbit Height",
                Description = "Height above target",
                Default = vu177.OrbitHeight,
                Min = 0,
                Max = 10,
                Rounding = 1,
                Callback = function(p487)
                    vu373.orbit.height = p487
                    vu177.OrbitHeight = p487
                end
            })
            vu471:AddToggle("TargetESP", {
                Title = "Target ESP",
                Default = vu177.TargetESP,
                Callback = function(p488)
                    vu373.target.esp = p488
                    vu177.TargetESP = p488
                    vu469()
                end
            })
            vu471:AddToggle("AutoTeleport", {
                Title = "Auto Teleport",
                Default = vu177.AutoTeleport,
                Callback = function(p489)
                    vu373.auto.enabled = p489
                    vu177.AutoTeleport = p489
                    vu373.auto.lastTime = tick()
                end
            })
            vu471:AddSlider("AutoInterval", {
                Title = "Teleport Interval",
                Default = vu177.TeleportInterval,
                Min = 0,
                Max = 10,
                Rounding = 1,
                Callback = function(p490)
                    vu373.auto.interval = p490
                    vu177.TeleportInterval = p490
                end
            })
            vu471:AddKeybind("TeleportKey", {
                Title = "Teleport Key",
                Default = vu177.TeleportKey,
                Callback = function()
                end,
                ChangedCallback = function(p491)
                    vu373.teleport.key = p491
                    vu177.TeleportKey = p491
                end
            })
            vu471:AddButton({
                Title = "Refresh Entities",
                Callback = function()
                    if tick() - (vu373.update.lastManual or 0) >= 5 then
                        vu373.update.lastManual = tick()
                        vu443()
                    end
                end
            })
            return true
        end
        local vu493 = {}
        local function vu505()
            if not vu492() then
                return false
            end
            vu493.input = vu369.UserInputService.InputBegan:Connect(function(p494, p495)
                if not (p495 or vu373.teleport.debounce) then
                    if p494.UserInputType == Enum.UserInputType.Keyboard and p494.KeyCode == vu373.teleport.key then
                        vu373.teleport.debounce = true
                        pcall(vu453)
                        task.delay(0, function()
                            vu373.teleport.debounce = false
                        end)
                    end
                end
            end)
            vu493.playerRemoved = vu369.Players.PlayerRemoving:Connect(function(p496)
                if p496.Name == vu373.target.name then
                    local v497 = p496.Character
                    local v498 = v497 and vu379(v497)
                    if v498 then
                        vu371.lastTargetPosition = v498.Position
                    end
                    vu373.target.name = ""
                    vu371.entities[p496.Name] = nil
                    vu469()
                end
                vu373.update.needed = true
            end)
            vu493.playerAdded = vu369.Players.PlayerAdded:Connect(function(p499)
                vu373.update.needed = true
                if not p499.Character then
                    local vu500 = nil
                    vu500 = p499.CharacterAdded:Connect(function(_)
                        vu373.update.needed = true
                        if vu500 and vu500.Connected then
                            vu500:Disconnect()
                            vu500 = nil
                        end
                    end)
                end
            end)
            vu493.localCharacterAdded = vu370.CharacterAdded:Connect(function(_)
                if vu373.orbit.enabled and vu373.target.name ~= "" then
                    task.delay(1, function()
                        if vu373.orbit.enabled then
                            coroutine.wrap(vu458)()
                        end
                    end)
                end
            end)
            vu493.heartbeat = vu369.RunService.Heartbeat:Connect(function(p501)
                if vu373.auto.enabled or (vu373.orbit.enabled or (vu373.target.autoTargetClosest or vu373.target.autoTargetTeammate)) then
                    local v502 = tick()
                    if vu373.target.autoTargetClosest and v502 % 1 < p501 then
                        local v503 = vu399()
                        if v503 and (vu373.target.name == "" or vu373.target.name ~= v503.Name) then
                            vu373.target.name = v503.Name
                            vu469()
                        end
                    end
                    if vu373.target.autoTargetTeammate and v502 % 1 < p501 then
                        local v504 = vu407()
                        if v504 and (vu373.target.name == "" or vu373.target.name ~= v504.Name) then
                            vu373.target.name = v504.Name
                            vu469()
                        end
                    end
                    if vu373.auto.enabled and (vu373.target.name ~= "" and (not vu373.orbit.enabled and v502 - vu373.auto.lastTime >= vu373.auto.interval)) then
                        vu373.auto.lastTime = v502
                        if pcall(vu453) then
                            vu373.auto.errors = 0
                        else
                            vu373.auto.errors = vu373.auto.errors + 1
                            if vu373.auto.errors > 3 then
                                vu373.auto.interval = math.min(vu373.auto.interval * 1.5, 10)
                                vu373.auto.errors = 0
                            end
                        end
                    end
                    if math.floor(v502) % 3 == 0 then
                        if vu373.update.needed then
                            vu373.update.needed = false
                            vu443()
                        end
                        if vu373.target.esp then
                            pcall(vu469)
                        end
                    end
                end
            end)
            task.delay(1.5, vu443)
            return true
        end
        local vu506 = 3
        local vu507 = 0
        local function vu508()
            if vu506 > vu507 then
                vu507 = vu507 + 1
                if pcall(vu505) then
                    return true
                end
                task.delay(2, vu508)
            end
        end
        vu508()
    end
    local vu509, vu510, vu511, vu512
    if vu13 or getfenv().Drawing and getfenv().Drawing.new then
        local vu513 = game:GetService("Lighting")
        local vu514 = game:GetService("Players")
        local v515 = vu514.LocalPlayer
        local vu516 = game:GetService("RunService")
        v70.World = vu69:AddTab({
            Title = "World",
            Icon = "globe"
        })
        task.wait(0.1)
        v70.World:AddParagraph({
            Title = string.format("%s", string.format(vu49[os.date("*t").month], "Soluna")),
            Content = "Soluna\nhttps://discord.gg/2hxKqA3b7b"
        })
        local vu517 = nil
        local vu518 = nil
        local vu519 = nil
        local vu520 = false
        local _ = vu513.FogStart < vu513.FogEnd
        local _ = {
            Ambient = vu513.Ambient,
            OutdoorAmbient = vu513.OutdoorAmbient,
            FogColor = vu513.FogColor,
            FogStart = vu513.FogStart,
            FogEnd = vu513.FogEnd,
            ClockTime = vu513.ClockTime
        }
        local vu521 = {}
        local _ = Enum.Material.ForceField
        local vu522 = Enum.Material.SmoothPlastic
        local function vu525(p523)
            if p523 and p523:IsA("BasePart") then
                local v524 = p523:GetFullName()
                if not vu521[v524] then
                    vu521[v524] = {
                        Transparency = p523.Transparency,
                        Material = p523.Material,
                        Reflectance = p523.Reflectance
                    }
                end
            end
        end
        local function vu528(p526)
            local v527 = p526:FindFirstAncestorOfClass("Model")
            if v527 then
                v527 = vu514:GetPlayerFromCharacter(v527) ~= nil
            end
            return v527
        end
        local function v532()
            local v529 = workspace:GetDescendants()
            for v530 = 1, # v529 do
                local v531 = v529[v530]
                if v531:IsA("BasePart") then
                    vu525(v531)
                end
            end
        end
        local function vu535(p533)
            if p533 and p533:IsA("BasePart") then
                vu525(p533)
                p533.Reflectance = 0.2
                local v534 = p533.Name:lower()
                if v534:find("metal") or (v534:find("iron") or v534:find("steel")) then
                    p533.Material = Enum.Material.Metal
                elseif v534:find("wood") or v534:find("plank") then
                    p533.Material = Enum.Material.Wood
                elseif v534:find("glass") or v534:find("window") then
                    p533.Material = Enum.Material.Glass
                    p533.Reflectance = 0.4
                elseif v534:find("water") then
                    p533.Material = Enum.Material.Glass
                    p533.Reflectance = 0.6
                    p533.Transparency = 0.6
                elseif v534:find("brick") or v534:find("concrete") then
                    p533.Material = Enum.Material.Concrete
                else
                    p533.Material = vu522
                end
                if p533.ClassName == "Terrain" then
                    p533.WaterTransparency = 0.7
                    p533.WaterReflectance = 0.8
                end
            end
        end
        local function vu538(p536)
            if p536 and p536:IsA("BasePart") then
                local v537 = vu521[p536:GetFullName()]
                if v537 then
                    p536.Reflectance = v537.Reflectance
                    p536.Material = v537.Material
                end
                if p536.ClassName == "Terrain" then
                    p536.WaterTransparency = 0.3
                    p536.WaterReflectance = 0.5
                end
            end
        end
        local function vu543()
            local v539 = workspace:GetDescendants()
            for v540 = 1, # v539 do
                local v541 = v539[v540]
                if v541:IsA("BasePart") then
                    vu535(v541)
                end
            end
            if vu517 then
                vu517:Disconnect()
            end
            vu517 = workspace.DescendantAdded:Connect(function(p542)
                if p542:IsA("BasePart") then
                    vu535(p542)
                end
            end)
        end
        local function vu547()
            if vu517 then
                vu517:Disconnect()
                vu517 = nil
            end
            local v544 = workspace:GetDescendants()
            for v545 = 1, # v544 do
                local v546 = v544[v545]
                if v546:IsA("BasePart") then
                    vu538(v546)
                end
            end
        end
        local function _(p548)
            if p548 and p548:IsA("BasePart") then
                vu525(p548)
                p548.Material = vu177.CustomMaterial
                p548.Reflectance = vu177.CustomReflectance
            end
        end
        local function vu550(pu549)
            if pu549 and pu549.Parent then
                local _ = pu549.Parent
                pcall(function()
                    pu549.Parent = nil
                end)
                pcall(function()
                    pu549:Destroy()
                end)
            end
        end
        local function vu559(p551)
            local v552 = 50
            for v553 = 1, # p551, v552 do
                for v554 = v553, math.min(v553 + v552 - 1, # p551) do
                    local vu555 = p551[v554]
                    if vu555:IsA("BasePart") and not vu528(vu555) then
                        vu555.Material = vu522
                        vu555.Reflectance = 0
                        if vu555:IsA("MeshPart") then
                            pcall(function()
                                vu555.TextureID = ""
                            end)
                        end
                        local v556 = vu555:GetChildren()
                        for v557 = 1, # v556 do
                            local v558 = v556[v557]
                            if v558:IsA("Decal") or (v558:IsA("Texture") or v558:IsA("SurfaceAppearance")) then
                                vu550(v558)
                            end
                        end
                    end
                end
                vu516.Heartbeat:Wait()
            end
        end
        local function vu564()
            vu559((workspace:GetDescendants()))
            vu559((vu513:GetDescendants()))
            if vu518 then
                vu518:Disconnect()
            end
            vu518 = workspace.DescendantAdded:Connect(function(pu560)
                if pu560:IsA("BasePart") and not vu528(pu560) then
                    pu560.Material = vu522
                    pu560.Reflectance = 0
                    if pu560:IsA("MeshPart") then
                        pcall(function()
                            pu560.TextureID = ""
                        end)
                    end
                elseif pu560:IsA("Decal") or (pu560:IsA("Texture") or pu560:IsA("SurfaceAppearance")) then
                    local v561 = pu560.Parent
                    if v561 and (v561:IsA("BasePart") and not vu528(v561)) then
                        task.spawn(function()
                            vu550(pu560)
                        end)
                    end
                end
            end)
            if vu519 then
                vu519:Disconnect()
            end
            vu519 = vu513.DescendantAdded:Connect(function(pu562)
                if pu562:IsA("BasePart") and not vu528(pu562) then
                    pu562.Material = vu522
                    pu562.Reflectance = 0
                    if pu562:IsA("MeshPart") then
                        pcall(function()
                            pu562.TextureID = ""
                        end)
                    end
                elseif pu562:IsA("Decal") or (pu562:IsA("Texture") or pu562:IsA("SurfaceAppearance")) then
                    local v563 = pu562.Parent
                    if v563 and (v563:IsA("BasePart") and not vu528(v563)) then
                        task.spawn(function()
                            vu550(pu562)
                        end)
                    end
                end
            end)
        end
        v532()
        local vu565 = nil
        local function vu570()
            if vu177.RainbowModeEnabled and vu177.AmbientColorEnabled then
                local v566 = tick() * vu177.RainbowSpeed
                local v567 = math.sin(v566) * 127 + 128
                local v568 = math.sin(v566 + 2) * 127 + 128
                local v569 = math.sin(v566 + 4) * 127 + 128
                vu513.Ambient = Color3.fromRGB(v567, v568, v569)
            end
        end
        v70.World:AddSection("Danger Zone"):AddButton({
            Title = "Remove all Textures",
            Description = "Removes textures from ALL parts and keeps them removed",
            Callback = function()
                if vu520 then
                    vu62:Notify({
                        Title = "Info",
                        Content = "Textures already removed.",
                        Duration = 2
                    })
                else
                    vu520 = true
                    vu564()
                    vu36:ExportSettings()
                    vu62:Notify({
                        Title = "Success",
                        Content = "All textures removed and will stay removed.",
                        Duration = 3
                    })
                end
            end
        })
        v70.World:AddSection("4K / Realistic Rendering"):AddToggle("RealisticRenderingToggle", {
            Title = "Enable 4K Realistic Rendering",
            Description = "Makes the game look more realistic with improved materials and lighting",
            Default = vu177.RealisticRenderingEnabled or false,
            Callback = function(p571)
                vu177.RealisticRenderingEnabled = p571
                if p571 then
                    vu543()
                else
                    vu547()
                end
                vu36:ExportSettings()
            end
        })
        if vu177.RealisticRenderingEnabled then
            vu543()
        end
        local v572 = v70.World:AddSection("Fog Settings")
        v572:AddToggle("FogToggle", {
            Title = "Enable Fog",
            Default = vu177.FogEnabled,
            Callback = function(p573)
                vu177.FogEnabled = p573
                vu513.FogEnd = p573 and vu177.FogEnd or 1000000
                vu36:ExportSettings()
            end
        })
        v572:AddColorpicker("FogColorPicker", {
            Title = "Fog Color",
            Default = vu177.FogColor,
            Callback = function(p574)
                vu177.FogColor = p574
                if vu177.FogEnabled then
                    vu513.FogColor = p574
                end
                vu36:ExportSettings()
            end
        })
        v572:AddSlider("FogStartSlider", {
            Title = "Fog Start Distance",
            Description = "Distance where fog begins (studs)",
            Min = 0,
            Max = 1000,
            Default = vu177.FogStart,
            Rounding = 0,
            Callback = function(p575)
                vu177.FogStart = p575
                if vu177.FogEnabled then
                    vu513.FogStart = p575
                end
                vu36:ExportSettings()
            end
        })
        v572:AddSlider("FogEndSlider", {
            Title = "Fog End Distance",
            Description = "Distance where fog is fully opaque (studs)",
            Min = 10,
            Max = 10000,
            Default = vu177.FogEnd,
            Rounding = 0,
            Callback = function(p576)
                vu177.FogEnd = p576
                if vu177.FogEnabled then
                    vu513.FogEnd = p576
                end
                vu36:ExportSettings()
            end
        })
        local vu577 = {
            Default = {
                SkyboxBk = "rbxassetid://91458024",
                SkyboxDn = "rbxassetid://91457980",
                SkyboxFt = "rbxassetid://91458024",
                SkyboxLf = "rbxassetid://91458024",
                SkyboxRt = "rbxassetid://91458024",
                SkyboxUp = "rbxassetid://91458002"
            },
            Neptune = {
                SkyboxBk = "rbxassetid://218955819",
                SkyboxDn = "rbxassetid://218953419",
                SkyboxFt = "rbxassetid://218954524",
                SkyboxLf = "rbxassetid://218958493",
                SkyboxRt = "rbxassetid://218957134",
                SkyboxUp = "rbxassetid://218950090"
            },
            ["Among Us"] = {
                SkyboxBk = "rbxassetid://5752463190",
                SkyboxDn = "rbxassetid://5752463190",
                SkyboxFt = "rbxassetid://5752463190",
                SkyboxLf = "rbxassetid://5752463190",
                SkyboxRt = "rbxassetid://5752463190",
                SkyboxUp = "rbxassetid://5752463190"
            },
            Nebula = {
                SkyboxBk = "rbxassetid://159454299",
                SkyboxDn = "rbxassetid://159454296",
                SkyboxFt = "rbxassetid://159454293",
                SkyboxLf = "rbxassetid://159454286",
                SkyboxRt = "rbxassetid://159454300",
                SkyboxUp = "rbxassetid://159454288"
            },
            Vaporwave = {
                SkyboxBk = "rbxassetid://1417494030",
                SkyboxDn = "rbxassetid://1417494146",
                SkyboxFt = "rbxassetid://1417494253",
                SkyboxLf = "rbxassetid://1417494402",
                SkyboxRt = "rbxassetid://1417494499",
                SkyboxUp = "rbxassetid://1417494643"
            },
            Clouds = {
                SkyboxBk = "rbxassetid://570557514",
                SkyboxDn = "rbxassetid://570557775",
                SkyboxFt = "rbxassetid://570557559",
                SkyboxLf = "rbxassetid://570557620",
                SkyboxRt = "rbxassetid://570557672",
                SkyboxUp = "rbxassetid://570557727"
            },
            Twilight = {
                SkyboxBk = "rbxassetid://264908339",
                SkyboxDn = "rbxassetid://264907909",
                SkyboxFt = "rbxassetid://264909420",
                SkyboxLf = "rbxassetid://264909758",
                SkyboxRt = "rbxassetid://264908886",
                SkyboxUp = "rbxassetid://264907379"
            },
            DaBaby = {
                SkyboxBk = "rbxassetid://7245418472",
                SkyboxDn = "rbxassetid://7245418472",
                SkyboxFt = "rbxassetid://7245418472",
                SkyboxLf = "rbxassetid://7245418472",
                SkyboxRt = "rbxassetid://7245418472",
                SkyboxUp = "rbxassetid://7245418472"
            },
            Minecraft = {
                SkyboxBk = "rbxassetid://1876545003",
                SkyboxDn = "rbxassetid://1876544331",
                SkyboxFt = "rbxassetid://1876542941",
                SkyboxLf = "rbxassetid://1876543392",
                SkyboxRt = "rbxassetid://1876543764",
                SkyboxUp = "rbxassetid://1876544642"
            },
            Chill = {
                SkyboxBk = "rbxassetid://5084575798",
                SkyboxDn = "rbxassetid://5084575916",
                SkyboxFt = "rbxassetid://5103949679",
                SkyboxLf = "rbxassetid://5103948542",
                SkyboxRt = "rbxassetid://5103948784",
                SkyboxUp = "rbxassetid://5084576400"
            },
            Redshift = {
                SkyboxBk = "rbxassetid://401664839",
                SkyboxDn = "rbxassetid://401664862",
                SkyboxFt = "rbxassetid://401664960",
                SkyboxLf = "rbxassetid://401664881",
                SkyboxRt = "rbxassetid://401664901",
                SkyboxUp = "rbxassetid://401664936"
            },
            ["Blue Stars"] = {
                SkyboxBk = "rbxassetid://149397684",
                SkyboxDn = "rbxassetid://149397686",
                SkyboxFt = "rbxassetid://149397688",
                SkyboxLf = "rbxassetid://149397692",
                SkyboxRt = "rbxassetid://149397697",
                SkyboxUp = "rbxassetid://149397702"
            },
            ["Blue Aurora"] = {
                SkyboxBk = "rbxassetid://12063984",
                SkyboxDn = "rbxassetid://12064107",
                SkyboxFt = "rbxassetid://12064152",
                SkyboxLf = "rbxassetid://12064121",
                SkyboxRt = "rbxassetid://12064115",
                SkyboxUp = "rbxassetid://12064131"
            }
        }
        vu177.SelectedSkybox = vu40.SelectedSkybox or "Default"
        local v578 = v70.World:AddSection("Skybox")
        local v579, v580, v581 = pairs(vu577)
        vu509 = vu20
        vu510 = vu14
        vu511 = vu40
        vu512 = vu39
        local v582 = {}
        local function vu590(p583)
            local v584 = vu577[p583]
            if v584 then
                local v585 = vu513:FindFirstChild("Sky") or Instance.new("Sky", vu513)
                local v586, v587, v588 = pairs(v584)
                while true do
                    local v589
                    v588, v589 = v586(v587, v588)
                    if v588 == nil then
                        break
                    end
                    v585[v588] = v589
                end
                vu177.SelectedSkybox = p583
                vu36:ExportSettings()
            end
        end
        while true do
            v581 = v579(v580, v581)
            if v581 == nil then
                break
            end
            table.insert(v582, v581)
        end
        table.sort(v582)
        v578:AddDropdown("SkyboxDropdown", {
            Title = "Skybox",
            Description = "Change the skybox appearance",
            Values = v582,
            Default = vu177.SelectedSkybox,
            Callback = function(p591)
                vu590(p591)
            end
        })
        v70.World:AddToggle("TimeControlToggle", {
            Title = "Enable Time Control",
            Default = vu177.TimeControlEnabled,
            Callback = function(p592)
                vu177.TimeControlEnabled = p592
                vu36:ExportSettings()
                if p592 then
                    vu513.ClockTime = math.clamp(vu177.TimeSliderValue, 0, 24)
                end
            end
        })
        v70.World:AddSlider("TimeSlider", {
            Title = "Time of Day",
            Description = "0 = Midnight, 12 = Noon, 24 = Midnight",
            Min = 0,
            Max = 24,
            Default = vu177.TimeSliderValue,
            Rounding = 1,
            Callback = function(p593)
                vu177.TimeSliderValue = p593
                if vu177.TimeControlEnabled then
                    vu513.ClockTime = math.clamp(p593, 0, 24)
                end
                vu36:ExportSettings()
            end
        })
        v70.World:AddToggle("ShadowsToggle", {
            Title = "Enable Shadows",
            Default = vu177.ShadowsEnabled,
            Callback = function(p594)
                vu177.ShadowsEnabled = p594
                vu513.GlobalShadows = p594
                vu513.ShadowSoftness = p594 and 0.5 or 1
                vu36:ExportSettings()
            end
        })
        v70.World:AddToggle("AmbientToggle", {
            Title = "Enable Color Tint",
            Default = vu177.AmbientColorEnabled,
            Callback = function(p595)
                vu177.AmbientColorEnabled = p595
                if p595 and not vu177.RainbowModeEnabled then
                    vu513.Ambient = vu177.SelectedColor
                else
                    vu513.Ambient = Color3.fromRGB(127, 127, 127)
                end
                vu36:ExportSettings()
            end
        })
        v70.World:AddColorpicker("AmbientColorPicker", {
            Title = "Game Tint Color",
            Default = vu177.SelectedColor,
            Callback = function(p596)
                vu177.SelectedColor = p596
                if vu177.AmbientColorEnabled and not vu177.RainbowModeEnabled then
                    vu513.Ambient = p596
                end
                vu36:ExportSettings()
            end
        })
        v70.World:AddToggle("RainbowModeToggle", {
            Title = "Enable Rainbow Mode",
            Default = vu177.RainbowModeEnabled,
            Callback = function(p597)
                vu177.RainbowModeEnabled = p597
                if p597 then
                    if vu565 then
                        vu565:Disconnect()
                    end
                    vu565 = vu516.Heartbeat:Connect(vu570)
                else
                    if vu565 then
                        vu565:Disconnect()
                    end
                    if vu177.AmbientColorEnabled then
                        vu513.Ambient = vu177.SelectedColor
                    else
                        vu513.Ambient = Color3.fromRGB(127, 127, 127)
                    end
                end
                vu36:ExportSettings()
            end
        })
        v70.World:AddSlider("RainbowSpeedSlider", {
            Title = "Rainbow Speed",
            Min = 0.1,
            Max = 5,
            Default = vu177.RainbowSpeed,
            Rounding = 1,
            Callback = function(p598)
                vu177.RainbowSpeed = p598
                vu36:ExportSettings()
            end
        })
        v70.World:AddToggle("OutdoorAmbientToggle", {
            Title = "Enable Outdoor Lighting",
            Default = vu177.OutdoorAmbientEnabled,
            Callback = function(p599)
                vu177.OutdoorAmbientEnabled = p599
                if p599 then
                    vu513.OutdoorAmbient = vu177.SelectedOutdoorColor
                else
                    vu513.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
                end
                vu36:ExportSettings()
            end
        })
        v70.World:AddColorpicker("OutdoorColorPicker", {
            Title = "Outdoor Lighting Color",
            Default = vu177.SelectedOutdoorColor,
            Callback = function(p600)
                vu177.SelectedOutdoorColor = p600
                if vu177.OutdoorAmbientEnabled then
                    vu513.OutdoorAmbient = p600
                end
                vu36:ExportSettings()
            end
        })
        task.spawn(function()
            while true do
                task.wait(0.1)
                if vu177.FogEnabled then
                    vu513.FogColor = vu177.FogColor
                    vu513.FogStart = vu177.FogStart
                    vu513.FogEnd = vu177.FogEnd
                else
                    vu513.FogEnd = 1000000
                end
                if vu177.TimeControlEnabled then
                    vu513.ClockTime = math.clamp(vu177.TimeSliderValue, 0, 24)
                end
                vu513.GlobalShadows = vu177.ShadowsEnabled
                vu513.ShadowSoftness = vu177.ShadowsEnabled and 0.5 or 1
                if vu177.AmbientColorEnabled then
                    if vu177.RainbowModeEnabled then
                        local v601 = tick() * vu177.RainbowSpeed
                        local v602 = math.sin(v601) * 127 + 128
                        local v603 = math.sin(v601 + 2) * 127 + 128
                        local v604 = math.sin(v601 + 4) * 127 + 128
                        vu513.Ambient = Color3.fromRGB(v602, v603, v604)
                    else
                        vu513.Ambient = vu177.SelectedColor
                    end
                else
                    vu513.Ambient = Color3.fromRGB(127, 127, 127)
                end
                if vu177.OutdoorAmbientEnabled then
                    vu513.OutdoorAmbient = vu177.SelectedOutdoorColor
                else
                    vu513.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
                end
            end
        end)
        v515.CharacterAdded:Connect(function()
            task.wait(1)
            vu590(vu177.SelectedSkybox)
            if vu177.FogEnabled then
                vu513.FogColor = vu177.FogColor
                vu513.FogStart = vu177.FogStart
                vu513.FogEnd = vu177.FogEnd
            end
            if vu177.TimeControlEnabled then
                vu513.ClockTime = math.clamp(vu177.TimeSliderValue, 0, 24)
            end
            vu513.GlobalShadows = vu177.ShadowsEnabled
            vu513.ShadowSoftness = vu177.ShadowsEnabled and 0.5 or 1
            if vu177.AmbientColorEnabled then
                vu513.Ambient = vu177.RainbowModeEnabled and vu513.Ambient or vu177.SelectedColor
            else
                vu513.Ambient = Color3.fromRGB(127, 127, 127)
            end
            if vu177.OutdoorAmbientEnabled then
                vu513.OutdoorAmbient = vu177.SelectedOutdoorColor
            else
                vu513.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
            end
        end)
        vu513.Changed:Connect(function(p605)
            if p605 == "Sky" then
                task.defer(vu590, vu177.SelectedSkybox)
            end
        end)
        vu590(vu177.SelectedSkybox)
    else
        vu509 = vu20
        vu510 = vu14
        vu511 = vu40
        vu512 = vu39
    end
    if vu13 or getfenv().Drawing and getfenv().Drawing.new then
        v70.Player = vu69:AddTab({
            Title = "Player",
            Icon = "user"
        })
        task.wait(0.1)
        v70.Player:AddParagraph({
            Title = string.format("%s", string.format(vu49[os.date("*t").month], "Soluna")),
            Content = "Soluna\nhttps://discord.gg/2hxKqA3b7b"
        })
        local vu606 = game:GetService("UserInputService")
        local vu607 = game:GetService("RunService")
        local vu608 = game:GetService("Players").LocalPlayer
        local vu609 = {
            InputHandler = {
                Connections = {},
                KeyBinds = {}
            },
            InfiniteJump = {
                Enabled = vu177.InfiniteJumpEnabled or false,
                Active = false,
                KeyBind = vu177.InfiniteJumpKeybind or "J"
            },
            WalkSpeed = {
                Enabled = vu177.WalkspeedEnabled or false,
                Active = false,
                KeyBind = vu177.WalkspeedKeybind or "V",
                Value = vu177.WalkspeedValue or 50,
                Objects = {}
            },
            Sliding = {
                Enabled = vu177.SlidingEnabled or true,
                Active = false,
                KeyBind = vu177.SlideKeybind or "LeftControl",
                Multiplier = vu177.SlideMultiplier or 1.5,
                Duration = vu177.SlideDuration or 1,
                Cooldown = vu177.SlideCooldown or 2,
                CanSlide = true,
                CurrentTimer = 0,
                CurrentCooldown = 0
            },
            NoClip = {
                Enabled = vu177.NoClipEnabled or false,
                Active = false,
                KeyBind = vu177.NoClipKeybind or "N",
                Connection = nil
            },
            Flying = {
                Enabled = vu177.FlyingEnabled or false,
                Active = false,
                KeyBind = vu177.FlyingKeybind or "Z",
                Speed = vu177.FlyingSpeed or 50,
                Parts = {},
                Connection = nil
            }
        }
        function vu609.InputHandler.SetupConnections(pu610)
            local v611, v612, v613 = pairs(pu610.Connections)
            while true do
                local v614
                v613, v614 = v611(v612, v613)
                if v613 == nil then
                    break
                end
                if v614 then
                    v614:Disconnect()
                end
            end
            pu610.Connections = {}
            pu610.Connections.InputBegan = vu606.InputBegan:Connect(function(p615, p616)
                if p616 then
                    return
                else
                    local v617 = p615.KeyCode
                    if v617 then
                        v617 = tostring(p615.KeyCode):match("%w+$")
                    end
                    if v617 then
                        local v618, v619, v620 = pairs(pu610.KeyBinds)
                        while true do
                            local v621
                            v620, v621 = v618(v619, v620)
                            if v620 == nil then
                                break
                            end
                            local v622 = vu609[v620]
                            if v622 and (v622.KeyBind == v617 and v622.Enabled) then
                                v621(nil)
                            end
                        end
                    end
                end
            end)
            pu610.Connections.InputEnded = vu606.InputEnded:Connect(function(p623, p624)
                if p624 then
                    return
                else
                    local v625 = p623.KeyCode
                    if v625 then
                        v625 = tostring(p623.KeyCode):match("%w+$")
                    end
                    if not v625 then
                    end
                end
            end)
        end
        function vu609.InputHandler.RegisterKeybind(p626, p627, p628)
            p626.KeyBinds[p627] = p628
        end
        vu609.InputHandler:SetupConnections()
        local v629 = v70.Player:AddSection("Infinite Jump")
        function vu609.InfiniteJump.Toggle(p630, p631)
            if p631 == nil then
                p631 = not p630.Active
            end
            p630.Active = p631
        end
        vu606.JumpRequest:Connect(function()
            if vu609.InfiniteJump.Enabled and vu609.InfiniteJump.Active then
                local v632 = vu608.Character
                local v633 = v632 and v632:FindFirstChildOfClass("Humanoid")
                if v633 then
                    v633:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
        v629:AddToggle("InfiniteJumpEnabled", {
            Title = "Enable Infinite Jump",
            Default = vu609.InfiniteJump.Enabled,
            Callback = function(p634)
                vu609.InfiniteJump.Enabled = p634
                vu177.InfiniteJumpEnabled = p634
                vu36:ExportSettings()
                if not p634 then
                    vu609.InfiniteJump.Active = false
                end
            end
        })
        vu609.InputHandler:RegisterKeybind("InfiniteJump", function(p635)
            vu609.InfiniteJump:Toggle(p635)
        end)
        v629:AddKeybind("InfiniteJumpKeybind", {
            Title = "Infinite Jump Keybind",
            Description = "Press key to toggle Infinite Jump when enabled",
            Default = vu609.InfiniteJump.KeyBind,
            Mode = "Toggle",
            Callback = function()
            end,
            ChangedCallback = function(p636)
                if typeof(p636) ~= "EnumItem" then
                    if typeof(p636) ~= "string" then
                        local v637 = tostring(p636)
                        p636 = v637:match("%.([^.]+)$") or v637
                    end
                else
                    p636 = tostring(p636):match("%w+$")
                end
                vu609.InfiniteJump.KeyBind = p636
                vu177.InfiniteJumpKeybind = p636
                vu36:ExportSettings()
            end
        })
        local v638 = v70.Player:AddSection("Walkspeed")
        function vu609.WalkSpeed.Toggle(pu639, p640)
            if p640 == nil then
                p640 = not pu639.Active
            end
            pu639.Active = p640
            pu639:CleanupObjects()
            if pu639.Active and pu639.Connection == nil then
                pu639.Connection = vu607.Heartbeat:Connect(function(p641)
                    pu639:Update(p641)
                end)
            elseif not pu639.Active and pu639.Connection then
                pu639.Connection:Disconnect()
                pu639.Connection = nil
            end
        end
        function vu609.WalkSpeed.Update(p642, p643)
            if p642.Active and p642.Enabled then
                local v644 = vu609.Sliding
                if v644.Active then
                    v644.CurrentTimer = math.max(0, v644.CurrentTimer - p643)
                    if v644.CurrentTimer <= 0 then
                        v644.Active = false
                    end
                end
                if not v644.CanSlide then
                    v644.CurrentCooldown = math.max(0, v644.CurrentCooldown - p643)
                    if v644.CurrentCooldown <= 0 then
                        v644.CanSlide = true
                    end
                end
                local v645 = vu608.Character
                if v645 then
                    local v646 = v645:FindFirstChild("HumanoidRootPart")
                    if v646 then
                        local v647 = v645:FindFirstChildOfClass("Humanoid")
                        if v647 then
                            if v647.MoveDirection.Magnitude <= 0 then
                                local v648 = v646:FindFirstChild("WalkspeedModifier")
                                if v648 then
                                    v648.Velocity = Vector3.new(0, 0, 0)
                                end
                            else
                                local v649 = v646:FindFirstChild("WalkspeedModifier")
                                if not v649 then
                                    v649 = Instance.new("BodyVelocity")
                                    v649.Name = "WalkspeedModifier"
                                    v649.MaxForce = Vector3.new(50000, 0, 50000)
                                    v649.P = 1000
                                    v649.Parent = v646
                                    table.insert(p642.Objects, v649)
                                end
                                local v650 = v647.MoveDirection.Unit
                                local v651 = 1.5
                                if v644.Active then
                                    v651 = v651 * v644.Multiplier
                                end
                                v649.Velocity = v650 * (p642.Value * v651)
                            end
                        end
                    else
                        return
                    end
                else
                    return
                end
            else
                return
            end
        end
        function vu609.WalkSpeed.CleanupObjects(p652)
            local v653, v654, v655 = pairs(p652.Objects)
            while true do
                local v656
                v655, v656 = v653(v654, v655)
                if v655 == nil then
                    break
                end
                if v656 and v656.Parent then
                    v656:Destroy()
                end
            end
            p652.Objects = {}
        end
        vu609.InputHandler:RegisterKeybind("WalkSpeed", function(p657)
            vu609.WalkSpeed:Toggle(p657)
        end)
        v638:AddToggle("WalkspeedEnabled", {
            Title = "Enable Speed Modifier",
            Default = vu609.WalkSpeed.Enabled,
            Callback = function(p658)
                vu609.WalkSpeed.Enabled = p658
                vu177.WalkspeedEnabled = p658
                vu36:ExportSettings()
                if not p658 then
                    vu609.WalkSpeed:Toggle(false)
                end
            end
        })
        v638:AddKeybind("WalkspeedKeybind", {
            Title = "Speed Modifier Keybind",
            Description = "Press key to toggle Speed Modifier when enabled",
            Default = vu609.WalkSpeed.KeyBind,
            Mode = "Toggle",
            Callback = function()
            end,
            ChangedCallback = function(p659)
                if typeof(p659) ~= "EnumItem" then
                    if typeof(p659) ~= "string" then
                        local v660 = tostring(p659)
                        p659 = v660:match("%.([^.]+)$") or v660
                    end
                else
                    p659 = tostring(p659):match("%w+$")
                end
                vu609.WalkSpeed.KeyBind = p659
                vu177.WalkspeedKeybind = p659
                vu36:ExportSettings()
            end
        })
        v638:AddSlider("WalkspeedSlider", {
            Title = "Walkspeed",
            Default = vu609.WalkSpeed.Value,
            Min = 1,
            Max = 200,
            Rounding = 1,
            Callback = function(p661)
                vu609.WalkSpeed.Value = p661
                vu177.WalkspeedValue = p661
                vu36:ExportSettings()
            end
        })
        local v662 = v70.Player:AddSection("Sliding")
        function vu609.Sliding.StartSlide(p663)
            if p663.CanSlide and (p663.Enabled and not p663.Active) then
                p663.Active = true
                p663.CanSlide = false
                p663.CurrentTimer = p663.Duration
                p663.CurrentCooldown = p663.Cooldown
            end
        end
        vu609.InputHandler:RegisterKeybind("Sliding", function()
            if vu609.WalkSpeed.Active then
                vu609.Sliding:StartSlide()
            end
        end)
        v662:AddToggle("SlidingEnabled", {
            Title = "Enable Sliding",
            Default = vu609.Sliding.Enabled,
            Callback = function(p664)
                vu609.Sliding.Enabled = p664
                vu177.SlidingEnabled = p664
                vu36:ExportSettings()
                if not p664 then
                    vu609.Sliding.Active = false
                end
            end
        })
        v662:AddKeybind("SlideKeybind", {
            Title = "Slide Keybind",
            Description = "Press key while moving to slide",
            Default = vu609.Sliding.KeyBind,
            Mode = "Press",
            Callback = function()
            end,
            ChangedCallback = function(p665)
                if typeof(p665) ~= "EnumItem" then
                    if typeof(p665) ~= "string" then
                        local v666 = tostring(p665)
                        p665 = v666:match("%.([^.]+)$") or v666
                    end
                else
                    p665 = tostring(p665):match("%w+$")
                end
                vu609.Sliding.KeyBind = p665
                vu177.SlideKeybind = p665
                vu36:ExportSettings()
            end
        })
        v662:AddSlider("SlideMultiplier", {
            Title = "Slide Speed Multiplier",
            Description = "How much faster you go while sliding",
            Default = vu609.Sliding.Multiplier,
            Min = 1,
            Max = 3,
            Rounding = 1,
            Callback = function(p667)
                vu609.Sliding.Multiplier = p667
                vu177.SlideMultiplier = p667
                vu36:ExportSettings()
            end
        })
        v662:AddSlider("SlideDuration", {
            Title = "Slide Duration",
            Description = "How long each slide lasts (seconds)",
            Default = vu609.Sliding.Duration,
            Min = 0.5,
            Max = 3,
            Rounding = 1,
            Callback = function(p668)
                vu609.Sliding.Duration = p668
                vu177.SlideDuration = p668
                vu36:ExportSettings()
            end
        })
        v662:AddSlider("SlideCooldown", {
            Title = "Slide Cooldown",
            Description = "Time between slides (seconds)",
            Default = vu609.Sliding.Cooldown,
            Min = 0,
            Max = 5,
            Rounding = 1,
            Callback = function(p669)
                vu609.Sliding.Cooldown = p669
                vu177.SlideCooldown = p669
                vu36:ExportSettings()
            end
        })
        local v670 = v70.Player:AddSection("No Clip")
        function vu609.NoClip.Toggle(pu671, p672)
            if p672 == nil then
                p672 = not pu671.Active
            end
            pu671.Active = p672
            local vu673 = vu608.Character
            if pu671.Connection then
                pu671.Connection:Disconnect()
                pu671.Connection = nil
            end
            if pu671.CharacterAddedConnection then
                pu671.CharacterAddedConnection:Disconnect()
                pu671.CharacterAddedConnection = nil
            end
            if pu671.Active then
                pu671.Connection = vu607.Heartbeat:Connect(function()
                    if vu673 and vu673:IsDescendantOf(workspace) then
                        local v674 = vu673
                        local v675, v676, v677 = pairs(v674:GetDescendants())
                        while true do
                            local v678
                            v677, v678 = v675(v676, v677)
                            if v677 == nil then
                                break
                            end
                            if v678:IsA("BasePart") then
                                v678.CanCollide = false
                            end
                        end
                    end
                end)
                pu671.CharacterAddedConnection = vu608.CharacterAdded:Connect(function(p679)
                    vu673 = p679
                    task.wait(0.1)
                    if pu671.Active then
                        local v680 = vu673
                        local v681, v682, v683 = pairs(v680:GetDescendants())
                        while true do
                            local v684
                            v683, v684 = v681(v682, v683)
                            if v683 == nil then
                                break
                            end
                            if v684:IsA("BasePart") then
                                v684.CanCollide = false
                            end
                        end
                    end
                end)
            elseif vu673 and vu673:IsDescendantOf(workspace) then
                local v685, v686, v687 = pairs(vu673:GetDescendants())
                while true do
                    local v688
                    v687, v688 = v685(v686, v687)
                    if v687 == nil then
                        break
                    end
                    if v688:IsA("BasePart") then
                        v688.CanCollide = true
                    end
                end
            end
        end
        vu609.InputHandler:RegisterKeybind("NoClip", function(p689)
            if vu609.NoClip.Enabled then
                vu609.NoClip:Toggle(p689)
            end
        end)
        v670:AddToggle("NoClipEnabled", {
            Title = "Enable No Clip",
            Default = vu609.NoClip.Enabled,
            Callback = function(p690)
                vu609.NoClip.Enabled = p690
                vu177.NoClipEnabled = p690
                vu36:ExportSettings()
                if not p690 then
                    vu609.NoClip:Toggle(false)
                end
            end
        })
        v670:AddKeybind("NoClipKeybind", {
            Title = "No Clip Keybind",
            Description = "Press key to toggle No Clip when enabled",
            Default = vu609.NoClip.KeyBind,
            Mode = "Toggle",
            Callback = function()
            end,
            ChangedCallback = function(p691)
                if typeof(p691) ~= "EnumItem" then
                    if typeof(p691) ~= "string" then
                        local v692 = tostring(p691)
                        p691 = v692:match("%.([^.]+)$") or v692
                    end
                else
                    p691 = tostring(p691):match("%w+$")
                end
                vu609.NoClip.KeyBind = p691
                vu177.NoClipKeybind = p691
                vu36:ExportSettings()
            end
        })
        local v693 = v70.Player:AddSection("Flying")
        function vu609.Flying.CleanupParts(p694)
            local v695, v696, v697 = pairs(p694.Parts)
            while true do
                local v698
                v697, v698 = v695(v696, v697)
                if v697 == nil then
                    break
                end
                if v698 and v698.Parent then
                    v698:Destroy()
                end
            end
            p694.Parts = {}
        end
        function vu609.Flying.SetupFlying(pu699, p700)
            if p700 then
                local vu701 = p700:WaitForChild("HumanoidRootPart", 2)
                if vu701 then
                    pu699:CleanupParts()
                    local vu702 = Instance.new("BodyGyro")
                    vu702.Name = "FlyGyro"
                    vu702.P = 9000
                    vu702.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                    vu702.CFrame = vu701.CFrame
                    vu702.Parent = vu701
                    table.insert(pu699.Parts, vu702)
                    local vu703 = Instance.new("BodyVelocity")
                    vu703.Name = "FlyVelocity"
                    vu703.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    vu703.P = 1250
                    vu703.Velocity = Vector3.new(0, 0, 0)
                    vu703.Parent = vu701
                    table.insert(pu699.Parts, vu703)
                    if pu699.Connection then
                        pu699.Connection:Disconnect()
                    end
                    pu699.Connection = vu607.Heartbeat:Connect(function()
                        if pu699.Active then
                            local v704 = workspace.CurrentCamera
                            if v704 and (vu701 and vu701.Parent) then
                                if vu702 and vu702.Parent then
                                    vu702.CFrame = CFrame.new(vu701.Position, vu701.Position + v704.CFrame.LookVector)
                                end
                                local v705 = Vector3.new(0, 0, 0)
                                if vu606:IsKeyDown(Enum.KeyCode.W) then
                                    v705 = v705 + v704.CFrame.LookVector
                                end
                                if vu606:IsKeyDown(Enum.KeyCode.S) then
                                    v705 = v705 - v704.CFrame.LookVector
                                end
                                if vu606:IsKeyDown(Enum.KeyCode.A) then
                                    v705 = v705 - v704.CFrame.RightVector
                                end
                                if vu606:IsKeyDown(Enum.KeyCode.D) then
                                    v705 = v705 + v704.CFrame.RightVector
                                end
                                if vu606:IsKeyDown(Enum.KeyCode.Space) then
                                    v705 = v705 + Vector3.new(0, 1, 0)
                                end
                                if vu606:IsKeyDown(Enum.KeyCode.LeftControl) or vu606:IsKeyDown(Enum.KeyCode.LeftShift) then
                                    v705 = v705 - Vector3.new(0, 1, 0)
                                end
                                if v705.Magnitude > 0 then
                                    v705 = v705.Unit
                                end
                                if vu703 and vu703.Parent then
                                    vu703.Velocity = v705 * pu699.Speed
                                end
                            end
                        else
                            pu699:Toggle(false)
                            return
                        end
                    end)
                end
            else
                return
            end
        end
        function vu609.Flying.Toggle(pu706, p707)
            if p707 == nil then
                p707 = not pu706.Active
            end
            pu706.Active = p707
            local v708 = vu608.Character or vu608.CharacterAdded:Wait()
            if pu706.Active then
                if pu706.CharacterAddedConnection then
                    pu706.CharacterAddedConnection:Disconnect()
                end
                pu706:SetupFlying(v708)
                pu706.CharacterAddedConnection = vu608.CharacterAdded:Connect(function(p709)
                    task.wait(0.5)
                    if pu706.Active then
                        pu706:SetupFlying(p709)
                    end
                end)
            else
                if pu706.Connection then
                    pu706.Connection:Disconnect()
                    pu706.Connection = nil
                end
                if pu706.CharacterAddedConnection then
                    pu706.CharacterAddedConnection:Disconnect()
                    pu706.CharacterAddedConnection = nil
                end
                pu706:CleanupParts()
            end
        end
        vu609.InputHandler:RegisterKeybind("Flying", function(p710)
            if vu609.Flying.Enabled then
                vu609.Flying:Toggle(p710)
            end
        end)
        v693:AddToggle("FlyingEnabled", {
            Title = "Enable Flying",
            Default = vu609.Flying.Enabled,
            Callback = function(p711)
                vu609.Flying.Enabled = p711
                vu177.FlyingEnabled = p711
                vu36:ExportSettings()
                if not p711 then
                    vu609.Flying:Toggle(false)
                end
            end
        })
        v693:AddKeybind("FlyingKeybind", {
            Title = "Flying Keybind",
            Description = "Press key to toggle Flying when enabled",
            Default = vu609.Flying.KeyBind,
            Mode = "Toggle",
            Callback = function()
            end,
            ChangedCallback = function(p712)
                if typeof(p712) ~= "EnumItem" then
                    if typeof(p712) ~= "string" then
                        local v713 = tostring(p712)
                        p712 = v713:match("%.([^.]+)$") or v713
                    end
                else
                    p712 = tostring(p712):match("%w+$")
                end
                vu609.Flying.KeyBind = p712
                vu177.FlyingKeybind = p712
                vu36:ExportSettings()
            end
        })
        v693:AddSlider("FlyingSpeedSlider", {
            Title = "Flying Speed",
            Default = vu609.Flying.Speed,
            Min = 1,
            Max = 200,
            Rounding = 1,
            Callback = function(p714)
                vu609.Flying.Speed = p714
                vu177.FlyingSpeed = p714
                vu36:ExportSettings()
            end
        })
        v693:AddParagraph({
            Title = "Flying Controls",
            Content = "W/A/S/D - Move horizontally\nSpace - Move up\nShift/Ctrl - Move down"
        })
        task.wait(0.1)
    end
    if vu13 or getfenv().Drawing and getfenv().Drawing.new then
        v70.Visuals = vu69:AddTab({
            Title = "Visuals",
            Icon = "eye"
        })
        task.wait(0.1)
        v70.Visuals:AddParagraph({
            Title = string.format("%s", string.format(vu49[os.date("*t").month], "Soluna")),
            Content = "Soluna\nhttps://discord.gg/2hxKqA3b7b"
        })
        local vu721 = {
            enabled = false,
            strength = 0.5,
            connection = nil,
            Toggle = function(pu715, p716)
                pu715.enabled = p716
                if pu715.connection then
                    pu715.connection:Disconnect()
                    pu715.connection = nil
                end
                if p716 then
                    local v717 = game:GetService("RunService")
                    local vu718 = game.Workspace.Camera
                    pu715.connection = v717.RenderStepped:Connect(function()
                        local v719 = CFrame.new(0, 0, 0, 1, 0, 0, 0, pu715.strength, 0, 0, 0, 1)
                        vu718.CFrame = vu718.CFrame * v719
                    end)
                end
            end,
            SetStrength = function(p720)
                p720.strength = nil
            end,
            enabled = vu177.ResolutionChangerEnabled,
            strength = vu177.ResolutionChangerStrength
        }
        local v722 = vu721
        vu721.Toggle(v722, vu721.enabled)
        local v723 = v70.Visuals:AddSection("Resolution Changer")
        v723:AddToggle("ResolutionChangerEnabled", {
            Title = "Enable Resolution Changer",
            Default = vu177.ResolutionChangerEnabled,
            Callback = function(p724)
                vu177.ResolutionChangerEnabled = p724
                vu721:Toggle(p724)
                vu36:ExportSettings()
            end
        })
        v723:AddSlider("ResolutionChangerStrength", {
            Title = "Resolution Strength",
            Default = vu177.ResolutionChangerStrength,
            Min = 0.1,
            Max = 1,
            Rounding = 2,
            Callback = function(p725)
                vu177.ResolutionChangerStrength = p725
                vu721:SetStrength(p725)
                vu36:ExportSettings()
            end
        })
        local v726 = v70.Visuals:AddSection("ESP")
        local vu727 = game:GetService("Players")
        local vu728 = vu727.LocalPlayer
        local vu729 = false
        local vu730 = {}
        local function vu733(p731)
            local _ = vu727.LocalPlayer
            local v732 = p731.Character and p731.Character:FindFirstChild("HumanoidRootPart")
            if v732 then
                v732 = p731.Character.HumanoidRootPart:FindFirstChild("TeammateLabel")
            end
            return v732
        end
        local function vu737(pu734)
            if pu734 ~= vu728 then
                local vu735 = vu730[pu734.Name]
                if not vu735 then
                    vu735 = Instance.new("Highlight")
                    vu735.Name = "PlayerHighlight_" .. pu734.Name
                    vu735.FillColor = Color3.fromRGB(255, 0, 0)
                    vu735.OutlineColor = Color3.new(1, 1, 1)
                    vu735.OutlineTransparency = 0
                    vu735.FillTransparency = 0.5
                    vu735.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    vu735.Enabled = true
                    vu730[pu734.Name] = vu735
                end
                local function v736()
                    if pu734.Character then
                        vu735.Adornee = pu734.Character
                        if vu729 and vu733(pu734) then
                            vu735.Enabled = false
                        else
                            vu735.Enabled = true
                        end
                        vu735.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    else
                        vu735.Adornee = nil
                    end
                end
                v736()
                pu734.CharacterAdded:Connect(v736)
                pu734.CharacterRemoving:Connect(function()
                    vu735.Adornee = nil
                end)
                return vu735
            end
        end
        local function vu744()
            local v738 = vu727
            local v739, v740, v741 = pairs(v738:GetPlayers())
            while true do
                local v742
                v741, v742 = v739(v740, v741)
                if v741 == nil then
                    break
                end
                if v742 ~= vu728 then
                    local v743 = vu737(v742)
                    if esp_enabled then
                        v743.Parent = game.CoreGui
                    end
                end
            end
        end
        vu727.PlayerAdded:Connect(function(p745)
            if p745 ~= vu728 then
                local v746 = vu737(p745)
                if esp_enabled then
                    v746.Parent = game.CoreGui
                end
            end
        end)
        vu727.PlayerRemoving:Connect(function(p747)
            if vu730[p747.Name] then
                vu730[p747.Name]:Destroy()
                vu730[p747.Name] = nil
            end
        end)
        local vu748 = false
        local function vu754()
            local v749, v750, v751 = pairs(vu730)
            while true do
                local v752
                v751, v752 = v749(v750, v751)
                if v751 == nil then
                    break
                end
                v752.FillColor = vu177.BoxColor
                v752.OutlineColor = vu177.TracerColor
                v752.FillTransparency = vu177.BoxFillTransparency
                v752.OutlineTransparency = vu177.BoxOutlineTransparency
                local v753 = vu177.ESPEnabled
                if v753 then
                    v753 = not vu177.TeamCheck and true or not vu733(vu727:FindFirstChild(v752.Name))
                end
                v752.Enabled = v753
                v752.Parent = vu177.ESPEnabled and game.CoreGui or nil
            end
        end
        v726:AddToggle("ESPToggle", {
            Title = "ESP Toggle",
            Description = "Enables player ESP highlights",
            Default = vu177.ESPEnabled,
            Callback = function(p755)
                vu177.ESPEnabled = p755
                vu754()
                if p755 then
                    vu744()
                end
            end
        })
        v726:AddToggle("TeamToggle", {
            Title = "Team Check",
            Description = "Don\'t highlight teammates",
            Default = vu177.TeamCheck,
            Callback = function(p756)
                vu177.TeamCheck = p756
                vu754()
            end
        })
        v726:AddSlider("FillTransparencySlider", {
            Title = "Fill Transparency",
            Description = "Adjust fill transparency",
            Default = vu177.BoxFillTransparency,
            Min = 0,
            Max = 1,
            Rounding = 2,
            Callback = function(p757)
                vu177.BoxFillTransparency = p757
                local v758, v759, v760 = pairs(vu730)
                while true do
                    local v761
                    v760, v761 = v758(v759, v760)
                    if v760 == nil then
                        break
                    end
                    v761.FillTransparency = p757
                end
            end
        })
        v726:AddSlider("OutlineTransparencySlider", {
            Title = "Outline Transparency",
            Description = "Adjust outline transparency",
            Default = vu177.BoxOutlineTransparency,
            Min = 0,
            Max = 1,
            Rounding = 2,
            Callback = function(p762)
                vu177.BoxOutlineTransparency = p762
                local v763, v764, v765 = pairs(vu730)
                while true do
                    local v766
                    v765, v766 = v763(v764, v765)
                    if v765 == nil then
                        break
                    end
                    v766.OutlineTransparency = p762
                end
            end
        })
        v726:AddColorpicker("FillColorpicker", {
            Title = "Fill Color",
            Description = "Choose the ESP fill color",
            Default = vu177.BoxColor,
            Callback = function(p767)
                vu177.BoxColor = p767
                local v768, v769, v770 = pairs(vu730)
                while true do
                    local v771
                    v770, v771 = v768(v769, v770)
                    if v770 == nil then
                        break
                    end
                    v771.FillColor = p767
                end
            end
        })
        v726:AddColorpicker("OutlineColorpicker", {
            Title = "Outline Color",
            Description = "Choose the ESP outline color",
            Default = vu177.TracerColor,
            Callback = function(p772)
                vu177.TracerColor = p772
                local v773, v774, v775 = pairs(vu730)
                while true do
                    local v776
                    v775, v776 = v773(v774, v775)
                    if v775 == nil then
                        break
                    end
                    v776.OutlineColor = p772
                end
            end
        })
        v726:AddKeybind("ESPKeybind", {
            Title = "Toggle ESP Key",
            Description = "Toggles ESP on/off",
            Mode = "Toggle",
            Default = "E",
            Callback = function()
                vu177.ESPEnabled = not vu177.ESPEnabled
                vu754()
                if vu177.ESPEnabled then
                    vu744()
                end
            end
        })
        spawn(function()
            while wait(0.3) do
                if vu748 then
                    local v777 = vu727
                    local v778, v779, v780 = pairs(v777:GetPlayers())
                    while true do
                        local v781
                        v780, v781 = v778(v779, v780)
                        if v780 == nil then
                            break
                        end
                        if v781 ~= vu728 then
                            local v782 = vu737(v781)
                            if v782.Parent ~= game.CoreGui then
                                v782.Parent = game.CoreGui
                            end
                        end
                    end
                end
            end
        end)
        vu744()
        local v783 = v70.Visuals:AddSection("FoV")
        v783:AddToggle("FoV", {
            Title = "FoV",
            Description = "Graphically Displays the FoV Radius",
            Default = vu177.FoV
        }):OnChanged(function(p784)
            vu177.FoV = p784
            if not vu48 then
                vu60 = p784
            end
        end)
        if vu48 then
            local v786 = v783:AddKeybind("FoVKey", {
                Title = "FoV Key",
                Description = "Changes the FoV Key",
                Default = vu177.FoVKey,
                ChangedCallback = function(p785)
                    vu177.FoVKey = p785
                end
            })
            vu177.FoVKey = v786.Value ~= "RMB" and Enum.KeyCode[v786.Value] or Enum.UserInputType.MouseButton2
        end
        v783:AddSlider("FoVThickness", {
            Title = "FoV Thickness",
            Description = "Changes the FoV Thickness",
            Default = vu177.FoVThickness,
            Min = 1,
            Max = 10,
            Rounding = 1,
            Callback = function(p787)
                vu177.FoVThickness = p787
            end
        })
        v783:AddSlider("FoVOpacity", {
            Title = "FoV Opacity",
            Description = "Changes the FoV Opacity",
            Default = vu177.FoVOpacity,
            Min = 0.1,
            Max = 1,
            Rounding = 1,
            Callback = function(p788)
                vu177.FoVOpacity = p788
            end
        })
        v783:AddToggle("FoVFilled", {
            Title = "FoV Filled",
            Description = "Makes the FoV Filled",
            Default = vu177.FoVFilled
        }):OnChanged(function(p789)
            vu177.FoVFilled = p789
        end)
        v783:AddColorpicker("FoVColour", {
            Title = "FoV Colour",
            Description = "Changes the FoV Colour",
            Default = vu177.FoVColour,
            Callback = function(p790)
                vu177.FoVColour = p790
            end
        })
        local vu791 = v70.Misc:AddSection("Skin Changer")
        vu791:AddParagraph({
            Title = "Skin Model Changer",
            Content = ""
        })
        task.wait(0.1)
        local vu792 = {}
        local function vu796(pu793)
            if not pu793 then
                return nil
            end
            local v794, v795 = pcall(function()
                return pu793
            end)
            return v794 and v795 and v795 or nil
        end
        local v797, v798 = pcall(function()
            return game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels.Weapons
        end)
        if v797 and v798 then
            local vu799 = v798
            pcall(function()
                local v800, v801, vu802 = pairs({
                    ["Spooky Skin Case"] = "Spooky Skin Case",
                    ["Skin Case 2"] = "Skin Case 2",
                    ["Skin Case"] = "Skin Case",
                    Other = "Other",
                    ["Festive Skin Case"] = "Festive Skin Case",
                    ["Skin Case 3"] = "Skin Case 3"
                })
                while true do
                    local vu803
                    vu802, vu803 = v800(v801, vu802)
                    if vu802 == nil then
                        break
                    end
                    pcall(function()
                        local v804 = vu796(vu799:FindFirstChild(vu803))
                        if v804 then
                            vu792[vu802] = v804
                        end
                    end)
                end
            end)
        end
        if not next(vu792) then
            pcall(function()
                local v805 = {
                    ["Spooky Skin Case"] = game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels["Spooky Skin Case"],
                    ["Skin Case 2"] = game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels["Skin Case 2"],
                    ["Skin Case"] = game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels["Skin Case"],
                    Other = game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels.Other,
                    ["Festive Skin Case"] = game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels["Festive Skin Case"],
                    ["Skin Case 3"] = game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels["Skin Case 3"]
                }
                local v806, v807, vu808 = pairs(v805)
                while true do
                    local vu809
                    vu808, vu809 = v806(v807, vu808)
                    if vu808 == nil then
                        break
                    end
                    pcall(function()
                        local v810 = vu796(vu809)
                        if v810 then
                            vu792[vu808] = v810
                        end
                    end)
                end
            end)
        end
        if not next(vu792) then
            warn("No skin folders found through either dynamic or hardcoded paths. Skin changer functionality may be limited.")
        end
        local vu811 = {
            ["Assault Rifle"] = {
                "AK-47",
                "AKEY-47",
                "Boneclaw Rifle",
                "AUG",
                "Phoenix Rifle",
                "Gingerbread AUG",
                "Tommy Gun"
            },
            ["Battle Axe"] = {
                "The Shred",
                "Nordic Axe",
                "Ban Axe"
            },
            ["Burst Rifle"] = {
                "Aqua Burst",
                "Electro Rifle",
                "Pixel Burst",
                "Pine Burst",
                "Spectral Burst",
                "FAMAS"
            },
            Chainsaw = {
                "Blobsaw"
            },
            Bow = {
                "Compound Bow",
                "Bat Bow"
            },
            Crossbow = {
                "Pixel Crossbow",
                "Frostbite Crossbow"
            },
            Daggers = {
                "Aces",
                "Cookies"
            },
            ["Energy Rifle"] = {
                "2025 Energy Rifle",
                "Apex Rifle",
                "Hacker Rifle",
                "Hydro Rifle"
            },
            ["Energy Pistols"] = {
                "2025 Energy Pistols",
                "Apex Pistols",
                "Hacker Pistols",
                "Void Pistols"
            },
            Exogun = {
                "Ray Gun",
                "Singularity",
                "Wondergun",
                "Repulsor",
                "Exogourd",
                "Midnight Festive Exogun"
            },
            Fists = {
                "Boxing Gloves",
                "Brass Knuckles",
                "Pumpkin Claws",
                "Festive Fists",
                "Fists of Hurt"
            },
            Flamethrower = {
                "Lamethrower",
                "Pixel Flamethrower",
                "Snowblower",
                "Glitterthrower"
            },
            ["Flare Gun"] = {
                "Dynamite Gun",
                "Firework Gun",
                "Banana Flare",
                "Wrapped Flare Gun",
                "Vexed Flare Gun"
            },
            ["Freeze Ray"] = {
                "Bubble Ray",
                "Temporal Ray",
                "Spider Ray",
                "Gum Ray",
                "Wrapped Freeze Ray"
            },
            Grenade = {
                "Water Balloon",
                "Whoopee Cushion",
                "Soul Grenade",
                "Jingle Grenade",
                "Dynamite"
            },
            ["Grenade Launcher"] = {
                "Swashbuckler",
                "Uranium Launcher",
                "Skull Launcher",
                "Snowball Launcher",
                "Gearnade Launcher"
            },
            Gunblade = {
                "Hyper Gunblade",
                "Crude Gunblade",
                "Elf\'s Gunblade"
            },
            Handgun = {
                "Blaster",
                "Pixel Handgun",
                "Pumpkin Handgun",
                "Gingerbread Handgun",
                "Gumball Handgun"
            },
            Katana = {
                "Lightning Bolt",
                "Saber",
                "Pixel Katana",
                "Devil\'s Trident",
                "2025 Katana",
                "Keytana",
                "Stellar Katana"
            },
            Knife = {
                "Chancla",
                "Karambit",
                "Machete",
                "Candy Cane",
                "Balisong"
            },
            Minigun = {
                "Lasergun 3000",
                "Pixel Minigun",
                "Wrapped Minigun",
                "Pumpkin Minigun",
                "Fighter Jet"
            },
            ["Riot Shield"] = {
                "Energy Shield",
                "Door",
                "Sled",
                ""
            },
            Molotov = {
                "Coffee",
                "Torch",
                "Vexed Candle",
                "Lava Lamp"
            },
            ["Paintball Gun"] = {
                "Boba Gun",
                "Slime Gun",
                "Brain Gun",
                "Snowball Gun",
                "Ketchup Gun"
            },
            Revolver = {
                "Boneclaw Revolver"
            },
            RPG = {
                "Nuke Launcher"
            },
            Scythe = {
                "Anchor",
                "Keythe",
                "Scythe of Death",
                "Bat Scythe",
                "Cryo Scythe",
                "Sakura Scythe"
            },
            Shorty = {
                "Lovely Shorty",
                "Not So Shorty",
                "Too Shorty",
                "Demon Shorty",
                "Balloon Shorty",
                "Wrapped Shorty"
            },
            Shotgun = {
                "Balloon Shotgun",
                "Hyper Shotgun",
                "Wrapped Shotgun",
                "Broomstick"
            },
            Slingshot = {
                "Goalpost",
                "Stick",
                "Boneshot",
                "Reindeer Slingshot"
            },
            ["Smoke Grenade"] = {
                "Balance",
                "Emoji Cloud",
                "Eyeball",
                "Hourglass",
                "Snowglobe"
            },
            Sniper = {
                "Hyper Sniper",
                "Pixel Sniper",
                "Keyper",
                "Gingerbread Sniper",
                "Eyething Sniper",
                "Event Horizon"
            },
            ["Subspace Tripmine"] = {
                "Don\'t Press",
                "Spring",
                "DIY Tripmine",
                "Dev-in-the-Box",
                "Trick or Treat"
            },
            Spray = {
                "Lovely Spray",
                "Pine Spray",
                "Nail Gun"
            },
            Trowel = {
                "Garden Shovel",
                "Plastic Shovel",
                "Snow Shovel",
                "Pumpkin Carver",
                "Paintbrush"
            },
            Uzi = {
                "Electro Uzi",
                "Water Uzi",
                "Pine Uzi",
                "Demon Uzi",
                "Money Gun"
            },
            Flashbang = {
                "Camera",
                "Disco Ball",
                "Pixel Flashbang",
                "Skullbang",
                "Lightbulb",
                "Shining Star"
            },
            Medkit = {
                "Briefcase",
                "Laptop",
                "Medkitty",
                "Sandwich",
                "Bucket of Candy"
            },
            ["Jump Pad"] = {
                "Bounce House"
            },
            ["War Horn"] = {
                "Trumpet",
                "Mammoth Horn",
                "Megaphone"
            }
        }
        local v812, v813, v814 = pairs(vu811)
        local v815 = {}
        while true do
            local v816
            v814, v816 = v812(v813, v814)
            if v814 == nil then
                break
            end
            table.insert(v815, v814)
        end
        table.sort(v815)
        local vu817 = "No Weapons Found"
        if vu177.SelectedBaseWeapon and table.find(v815, vu177.SelectedBaseWeapon) then
            vu817 = vu177.SelectedBaseWeapon
        elseif # v815 <= 0 then
            vu177.SelectedBaseWeapon = vu817
        else
            vu817 = v815[1]
            vu177.SelectedBaseWeapon = vu817
        end
        local v818 = vu811[vu817] or {}
        local vu819 = "No Skins Found"
        if vu177.SelectedSkin and table.find(v818, vu177.SelectedSkin) then
            vu819 = vu177.SelectedSkin
        elseif # v818 <= 0 then
            vu177.SelectedSkin = vu819
        else
            vu819 = v818[1]
            vu177.SelectedSkin = vu819
        end
        local vu820 = nil
        vu791:AddDropdown("BaseWeaponSelect", {
            Title = "Select Base Weapon",
            Description = "Choose the weapon to change the skin for",
            Values = v815,
            Default = vu817,
            Callback = function(p821)
                vu817 = p821
                vu177.SelectedBaseWeapon = p821
                local v822 = vu811[vu817] or {}
                if # v822 <= 0 then
                    vu819 = "No Skins Found"
                    vu820:SetValues({
                        "No Skins Found"
                    })
                    vu820:SetValue(vu819)
                    vu177.SelectedSkin = vu819
                else
                    vu819 = v822[1]
                    vu820:SetValues(v822)
                    vu820:SetValue(vu819)
                    vu177.SelectedSkin = vu819
                end
                vu36:ExportSettings()
            end
        })
        vu820 = vu791:AddDropdown("SkinSelect", {
            Title = "Select Skin",
            Description = "Choose which skin model to apply",
            Values = vu811[vu817] or {
                "No Skins Found"
            },
            Default = vu819,
            Callback = function(p823)
                vu819 = p823
                vu177.SelectedSkin = p823
                vu36:ExportSettings()
            end
        })
        local v824, vu825 = pcall(function()
            return game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels.Weapons
        end)
        if not (v824 and vu825) then
            warn("ViewModels folder not found. Creating temporary folder...")
            vu825 = Instance.new("Folder")
            vu825.Name = "Weapons"
            vu825.Parent = game:GetService("Players").LocalPlayer.PlayerScripts.Assets.ViewModels or (game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("Assets") or game:GetService("Players").LocalPlayer.PlayerScripts)
        end
        local vu826 = nil
        local function vu829()
            if vu826 and vu826.Parent then
                return vu826
            end
            local v827, v828 = pcall(function()
                vu826 = vu825:FindFirstChild("OriginalBackups")
                if not vu826 then
                    vu826 = Instance.new("Folder")
                    vu826.Name = "OriginalBackups"
                    vu826.Parent = vu825
                end
                return vu826
            end)
            if v827 then
                return v828
            end
            warn("Failed to create backup folder:", v828)
            return nil
        end
        local function vu837(pu830)
            if not pu830 then
                return nil
            end
            local v831, v832, v833 = pairs(vu792)
            while true do
                local vu834
                v833, vu834 = v831(v832, v833)
                if v833 == nil then
                    break
                end
                if vu834 then
                    local v835, v836 = pcall(function()
                        if vu834:IsA("Folder") then
                            return vu834:FindFirstChild(pu830)
                        else
                            return nil
                        end
                    end)
                    if v835 and v836 then
                        return v836
                    end
                end
            end
            warn("Skin model not found: " .. pu830)
            return nil
        end
        vu791:AddButton({
            Title = "Apply Skin Model",
            Description = "Apply selected skin model to the base weapon",
            Callback = function()
                if vu817 == "No Weapons Found" or vu819 == "No Skins Found" then
                    vu62:Notify({
                        Title = "Error",
                        Content = "Please select a valid weapon and skin.",
                        Duration = 3
                    })
                    return
                else
                    local v838 = vu825:FindFirstChild(vu817)
                    if v838 and v838:IsA("Model") then
                        local v839 = vu837(vu819)
                        if v839 then
                            if v838 then
                                local v840 = vu829()
                                local v841 = vu817 .. "_Original"
                                if not v840:FindFirstChild(v841) then
                                    local v842 = v838:Clone()
                                    v842.Name = v841
                                    v842.Parent = v840
                                    vu62:Notify({
                                        Title = "Backup",
                                        Content = "Original model backed up.",
                                        Duration = 2
                                    })
                                end
                                v838:Destroy()
                            end
                            local v843 = v839:Clone()
                            v843.Name = vu817
                            v843.Parent = vu825
                            vu62:Notify({
                                Title = "Success",
                                Content = vu819 .. " applied to " .. vu817,
                                Duration = 3
                            })
                        else
                            vu62:Notify({
                                Title = "Error",
                                Content = "Selected skin model not found: " .. vu819,
                                Duration = 3
                            })
                        end
                    else
                        vu62:Notify({
                            Title = "Error",
                            Content = "Weapon model not found for " .. vu817,
                            Duration = 3
                        })
                        return
                    end
                end
            end
        })
        vu791:AddButton({
            Title = "Reset Skin Model",
            Description = "Reset weapon model to its original state (if backed up)",
            Callback = function()
                if vu817 ~= "No Weapons Found" then
                    local v844 = vu829():FindFirstChild(vu817 .. "_Original")
                    if v844 then
                        local v845 = vu825:FindFirstChild(vu817)
                        if v845 then
                            v845:Destroy()
                        end
                        local v846 = v844:Clone()
                        v846.Name = vu817
                        v846.Parent = vu825
                        vu62:Notify({
                            Title = "Success",
                            Content = vu817 .. " model reset to original.",
                            Duration = 3
                        })
                    else
                        vu62:Notify({
                            Title = "Error",
                            Content = "Original backup not found for " .. vu817 .. ". Apply a skin first to create a backup.",
                            Duration = 4
                        })
                    end
                else
                    vu62:Notify({
                        Title = "Error",
                        Content = "Please select a base weapon first.",
                        Duration = 3
                    })
                    return
                end
            end
        })
        local vu847 = "skin_presets.json"
        local vu848 = {}
        local vu849 = {
            "No Presets Found"
        }
        local function vu851(p850)
            return type(p850) == "table"
        end
        local function vu855(_, p852)
            if not (p852.baseWeapon and p852.skin) then
                return p852
            end
            local v853 = p852.baseWeapon
            local v854 = {
                [v853] = {
                    baseWeapon = v853,
                    skin = p852.skin
                }
            }
            return v854
        end
        local function vu863(p856)
            local v857, v858, v859 = pairs(p856)
            local v860 = {}
            local v861 = false
            while true do
                local v862
                v859, v862 = v857(v858, v859)
                if v859 == nil then
                    break
                end
                if type(v862) == "table" and (v862.baseWeapon and v862.skin) then
                    v860[v859] = v862
                    v861 = true
                end
            end
            return v861 and v860 and v860 or nil
        end
        local function vu870()
            local v864, v865, v866 = pairs(vu848)
            local v867 = {}
            while true do
                local v868
                v866, v868 = v864(v865, v866)
                if v866 == nil then
                    break
                end
                if vu851(v868) then
                    local v869 = vu863((vu855(v866, v868)))
                    if v869 then
                        v867[v866] = v869
                    end
                end
            end
            vu848 = v867
        end
        local function vu874()
            vu849 = {}
            local v871, v872, v873 = pairs(vu848)
            while true do
                v873 = v871(v872, v873)
                if v873 == nil then
                    break
                end
                if type(v873) == "string" then
                    table.insert(vu849, v873)
                end
            end
            if # vu849 == 0 then
                table.insert(vu849, "No Presets Found")
            end
            table.sort(vu849)
        end
        local function v905()
            vu848 = {}
            if not (getfenv().isfile and getfenv().readfile) then
                warn("Preset System: File functions not available")
                vu874()
                return false
            end
            if not isfile(vu847) then
                warn("Preset System: No preset file found")
                vu874()
                return false
            end
            local v875, vu876 = pcall(function()
                return readfile(vu847)
            end)
            if not (v875 and vu876) then
                warn("Preset System: Failed to read preset file")
                vu874()
                return false
            end
            local v877, v878 = pcall(function()
                return vu510:JSONDecode(vu876)
            end)
            vu848 = v878
            if not v877 or type(vu848) ~= "table" then
                warn("Preset System: Invalid JSON format")
                pcall(function()
                    local v879 = vu847 .. ".corrupted." .. os.time()
                    writefile(v879, vu876)
                    warn("Preset System: Created backup as " .. v879)
                end)
                local vu880 = false
                pcall(function()
                    local v881, v882, v883 = vu876:gmatch("{.-}")
                    local v884 = {}
                    while true do
                        local vu885 = v881(v882, v883)
                        if vu885 == nil then
                            break
                        end
                        v883 = vu885
                        local v886, v887 = pcall(function()
                            return vu510:JSONDecode(vu885)
                        end)
                        if v886 and type(v887) == "table" then
                            local v888, v889, v890 = pairs(v887)
                            while true do
                                local v891
                                v890, v891 = v888(v889, v890)
                                if v890 == nil then
                                    break
                                end
                                if type(v891) == "table" and (v891.baseWeapon and v891.skin) then
                                    v884[v890] = v891
                                    vu880 = true
                                end
                            end
                        end
                    end
                    if vu880 then
                        vu848 = v884
                        warn("Preset System: Recovered some valid presets")
                        pcall(function()
                            local v892 = vu510
                            writefile(vu847, v892:JSONEncode(vu848))
                            warn("Preset System: Saved recovered presets")
                        end)
                    end
                end)
                if not vu880 then
                    vu848 = {}
                end
            end
            local v893, v894, v895 = pairs(vu848)
            local v896 = {}
            while true do
                local v897
                v895, v897 = v893(v894, v895)
                if v895 == nil then
                    break
                end
                if type(v895) == "string" and type(v897) == "table" then
                    local v898, v899, v900 = pairs(v897)
                    local v901 = v895
                    local v902 = {}
                    while true do
                        local v903
                        v900, v903 = v898(v899, v900)
                        if v900 == nil then
                            break
                        end
                        if type(v903) == "table" and (v903.baseWeapon and (v903.skin and (vu811[v903.baseWeapon] and table.find(vu811[v903.baseWeapon], v903.skin)))) then
                            v902[v900] = v903
                        end
                    end
                    if next(v902) then
                        v896[v901] = v902
                    end
                end
            end
            vu848 = v896
            vu870()
            vu874()
            pcall(function()
                local v904 = vu510
                writefile(vu847, v904:JSONEncode(vu848))
            end)
            return true
        end
        local function vu919()
            if not getfenv().writefile then
                warn("Preset System: writefile not available")
                return false
            end
            vu870()
            local v906, v907, v908 = pairs(vu848)
            local vu909 = {}
            while true do
                local v910
                v908, v910 = v906(v907, v908)
                if v908 == nil then
                    break
                end
                if type(v908) == "string" and type(v910) == "table" then
                    local v911, v912, v913 = pairs(v910)
                    local v914 = v908
                    local v915 = {}
                    while true do
                        local v916
                        v913, v916 = v911(v912, v913)
                        if v913 == nil then
                            break
                        end
                        if type(v916) == "table" and (v916.baseWeapon and v916.skin) then
                            v915[v913] = {
                                baseWeapon = v916.baseWeapon,
                                skin = v916.skin
                            }
                        end
                    end
                    if next(v915) then
                        vu909[v914] = v915
                    end
                end
            end
            local v917, vu918 = pcall(function()
                return vu510:JSONEncode(vu909)
            end)
            if not (v917 and vu918) then
                warn("Preset System: Failed to encode presets")
                return false
            end
            if pcall(function()
                writefile(vu847, vu918)
            end) then
                return true
            end
            warn("Preset System: Failed to save presets")
            return false
        end
        v905()
        local vu920 = nil
        local function v977()
            vu920 = vu791:AddDropdown("PresetDropdown", {
                Title = "Saved Presets",
                Description = "Select a saved preset to apply.",
                Values = vu849,
                Default = nil,
                Callback = function(p921)
                    local v922 = p921 ~= "No Presets Found" and vu848[p921]
                    if v922 then
                        local v923, v924, v925 = pairs(v922)
                        while true do
                            local v926
                            v925, v926 = v923(v924, v925)
                            if v925 == nil then
                                break
                            end
                            if vu811[v925] and table.find(vu811[v925], v926.skin) then
                                local v927 = vu825:FindFirstChild(v925)
                                if v927 then
                                    local v928 = vu837(v926.skin)
                                    if v928 then
                                        local v929 = vu829()
                                        local v930 = v925 .. "_Original"
                                        if not v929:FindFirstChild(v930) then
                                            local v931 = v927:Clone()
                                            v931.Name = v930
                                            v931.Parent = v929
                                        end
                                        v927:Destroy()
                                        local v932 = v928:Clone()
                                        v932.Name = v925
                                        v932.Parent = vu825
                                    end
                                end
                            end
                        end
                        vu62:Notify({
                            Title = "Preset Applied",
                            Content = "Applied " .. p921 .. " preset",
                            Duration = 3
                        })
                    end
                end
            })
            vu177.AutoLoadPreset = vu511.AutoLoadPreset or false
            vu177.DefaultPreset = vu511.DefaultPreset or ""
            vu791:AddToggle("AutoLoadPreset", {
                Title = "Auto Load Preset",
                Description = "Automatically load selected preset when joining game",
                Default = vu177.AutoLoadPreset,
                Callback = function(p933)
                    vu177.AutoLoadPreset = p933
                    vu36:ExportSettings()
                end
            })
            vu791:AddDropdown("DefaultPreset", {
                Title = "Default Preset",
                Description = "Select preset to auto-load",
                Values = vu849,
                Default = vu177.DefaultPreset,
                Callback = function(p934)
                    if p934 == "No Presets Found" then
                        vu177.DefaultPreset = ""
                        vu36:ExportSettings()
                    else
                        vu177.DefaultPreset = p934
                        vu36:ExportSettings()
                        local v935 = vu177.AutoLoadPreset and vu848[p934]
                        if v935 then
                            local v936, v937, v938 = pairs(v935)
                            while true do
                                local v939
                                v938, v939 = v936(v937, v938)
                                if v938 == nil then
                                    break
                                end
                                if vu811[v938] and table.find(vu811[v938], v939.skin) then
                                    local v940 = vu825:FindFirstChild(v938)
                                    if v940 then
                                        local v941 = vu837(v939.skin)
                                        if v941 then
                                            local v942 = vu829()
                                            local v943 = v938 .. "_Original"
                                            if not v942:FindFirstChild(v943) then
                                                local v944 = v940:Clone()
                                                v944.Name = v943
                                                v944.Parent = v942
                                            end
                                            v940:Destroy()
                                            local v945 = v941:Clone()
                                            v945.Name = v938
                                            v945.Parent = vu825
                                        end
                                    end
                                end
                            end
                            vu62:Notify({
                                Title = "Default Preset Set",
                                Content = "Set " .. p934 .. " as default preset",
                                Duration = 3
                            })
                        end
                    end
                end
            })
            local function vu946()
                if vu920 then
                    vu920:SetValues(vu849)
                    vu920:SetValue(nil)
                end
            end
            local vu947 = vu874
            vu874 = function()
                vu947()
                vu946()
            end
            local vu948 = vu791:AddInput("PresetNameInput", {
                Title = "Preset Name",
                Default = "",
                Placeholder = "Enter preset name here...",
                Numeric = false,
                Finished = true
            })
            vu791:AddButton({
                Title = "Save Current as Preset",
                Description = "Save your current weapon and skin selection as a preset.",
                Callback = function()
                    if vu817 and vu819 then
                        if vu948 then
                            local v949 = vu948.Value
                            if v949 and v949 ~= "" then
                                vu848[v949] = vu848[v949] or {}
                                local v950 = {
                                    skin = vu819,
                                    baseWeapon = vu817
                                }
                                vu848[v949][vu817] = v950
                                vu919()
                                vu874()
                                vu62:Notify({
                                    Title = "Success",
                                    Content = "Preset saved: " .. v949,
                                    Duration = 3
                                })
                                vu948:SetValue("")
                            else
                                vu62:Notify({
                                    Title = "Error",
                                    Content = "Please enter a preset name",
                                    Duration = 3
                                })
                            end
                        else
                            vu62:Notify({
                                Title = "Error",
                                Content = "Input field not initialized properly",
                                Duration = 3
                            })
                            return
                        end
                    else
                        vu62:Notify({
                            Title = "Error",
                            Content = "Please select a weapon and skin first",
                            Duration = 3
                        })
                        return
                    end
                end
            })
            vu791:AddButton({
                Title = "Add to Preset",
                Description = "Add current weapon/skin to an existing preset.",
                Callback = function()
                    if vu817 and vu819 then
                        if # vu849 == 0 or vu849[1] == "No Presets Found" then
                            vu62:Notify({
                                Title = "Error",
                                Content = "No presets exist to add to",
                                Duration = 3
                            })
                        else
                            vu69:Dialog({
                                Title = "Add to Preset",
                                Content = "Select a preset to add this weapon/skin to:",
                                Buttons = (function()
                                    local v951, v952, v953 = ipairs(vu849)
                                    local v954 = {}
                                    while true do
                                        local vu955
                                        v953, vu955 = v951(v952, v953)
                                        if v953 == nil then
                                            break
                                        end
                                        if vu955 ~= "No Presets Found" then
                                            local v957 = {
                                                Title = vu955,
                                                Callback = function()
                                                    vu848[vu955] = vu848[vu955] or {}
                                                    local v956 = {
                                                        skin = vu819,
                                                        baseWeapon = vu817
                                                    }
                                                    vu848[vu955][vu817] = v956
                                                    vu919()
                                                    vu874()
                                                    vu62:Notify({
                                                        Title = "Success",
                                                        Content = string.format("Added %s (%s) to %s", vu817, vu819, vu955),
                                                        Duration = 3
                                                    })
                                                end
                                            }
                                            table.insert(v954, v957)
                                        end
                                    end
                                    return v954
                                end)()
                            })
                        end
                    else
                        vu62:Notify({
                            Title = "Error",
                            Content = "Please select a weapon and skin first",
                            Duration = 3
                        })
                        return
                    end
                end
            })
            vu791:AddButton({
                Title = "Delete Preset",
                Description = "Delete an existing preset.",
                Callback = function()
                    if # vu849 == 0 or vu849[1] == "No Presets Found" then
                        vu62:Notify({
                            Title = "Error",
                            Content = "No presets exist to delete",
                            Duration = 3
                        })
                    else
                        vu177.AutoLoadPreset = vu511.AutoLoadPreset or false
                        vu177.DefaultPreset = vu511.DefaultPreset or ""
                        vu791:AddToggle("AutoLoadPreset", {
                            Title = "Auto Load Preset",
                            Description = "Automatically load selected preset when joining game",
                            Default = vu177.AutoLoadPreset,
                            Callback = function(p958)
                                vu177.AutoLoadPreset = p958
                                vu36:ExportSettings()
                            end
                        })
                        vu791:AddDropdown("DefaultPreset", {
                            Title = "Default Preset",
                            Description = "Select preset to auto-load",
                            Values = vu849,
                            Default = vu177.DefaultPreset,
                            Callback = function(p959)
                                if p959 == "No Presets Found" then
                                    vu177.DefaultPreset = ""
                                    vu36:ExportSettings()
                                else
                                    vu177.DefaultPreset = p959
                                    vu36:ExportSettings()
                                    local v960 = vu177.AutoLoadPreset and vu848[p959]
                                    if v960 then
                                        local v961, v962, v963 = pairs(v960)
                                        while true do
                                            local v964
                                            v963, v964 = v961(v962, v963)
                                            if v963 == nil then
                                                break
                                            end
                                            if vu811[v963] and table.find(vu811[v963], v964.skin) then
                                                local v965 = vu825:FindFirstChild(v963)
                                                if v965 then
                                                    local v966 = vu837(v964.skin)
                                                    if v966 then
                                                        local v967 = vu829()
                                                        local v968 = v963 .. "_Original"
                                                        if not v967:FindFirstChild(v968) then
                                                            local v969 = v965:Clone()
                                                            v969.Name = v968
                                                            v969.Parent = v967
                                                        end
                                                        v965:Destroy()
                                                        local v970 = v966:Clone()
                                                        v970.Name = v963
                                                        v970.Parent = vu825
                                                    end
                                                end
                                            end
                                        end
                                        vu62:Notify({
                                            Title = "Default Preset Set",
                                            Content = "Set " .. p959 .. " as default preset",
                                            Duration = 3
                                        })
                                    end
                                end
                            end
                        })
                        vu69:Dialog({
                            Title = "Delete Preset",
                            Content = "Select a preset to delete:",
                            Buttons = (function()
                                local v971, v972, v973 = ipairs(vu849)
                                local v974 = {}
                                while true do
                                    local vu975
                                    v973, vu975 = v971(v972, v973)
                                    if v973 == nil then
                                        break
                                    end
                                    if vu975 ~= "No Presets Found" then
                                        local v976 = {
                                            Title = vu975,
                                            Callback = function()
                                                vu848[vu975] = nil
                                                vu919()
                                                vu874()
                                                vu62:Notify({
                                                    Title = "Success",
                                                    Content = "Deleted preset: " .. vu975,
                                                    Duration = 3
                                                })
                                            end
                                        }
                                        table.insert(v974, v976)
                                    end
                                end
                                return v974
                            end)()
                        })
                    end
                end
            })
        end
        v905()
        v977()
        task.spawn(function()
            local v978 = vu177.AutoLoadPreset and vu177.DefaultPreset ~= "" and (vu177.DefaultPreset ~= "No Presets Found" and vu848[vu177.DefaultPreset])
            if v978 then
                local v979, v980, v981 = pairs(v978)
                while true do
                    local v982
                    v981, v982 = v979(v980, v981)
                    if v981 == nil then
                        break
                    end
                    if vu811[v981] and table.find(vu811[v981], v982.skin) then
                        local v983 = vu825:FindFirstChild(v981)
                        if v983 then
                            local v984 = vu837(v982.skin)
                            if v984 then
                                local v985 = vu829()
                                local v986 = v981 .. "_Original"
                                if not v985:FindFirstChild(v986) then
                                    local v987 = v983:Clone()
                                    v987.Name = v986
                                    v987.Parent = v985
                                end
                                v983:Destroy()
                                local v988 = v984:Clone()
                                v988.Name = v981
                                v988.Parent = vu825
                            end
                        end
                    end
                end
                vu62:Notify({
                    Title = "Auto-Loaded Preset",
                    Content = "Applied " .. vu177.DefaultPreset .. " preset",
                    Duration = 3
                })
            end
        end)
    else
        v51 = true
    end
    local v989 = vu69
    v70.HvH = vu69.AddTab(v989, {
        Title = "HvH",
        Icon = "swords"
    })
    local v990 = vu69
    v70.Settings = vu69.AddTab(v990, {
        Title = "Settings",
        Icon = "settings"
    })
    task.wait(0.1)
    v70.Settings:AddParagraph({
        Title = string.format("%s   ", string.format(vu49[os.date("*t").month], "Soluna")),
        Content = "Soluna\nhttps://discord.gg/2hxKqA3b7b"
    })
    local v991 = v70.Settings:AddSection("UI")
    local vu992 = {
        Prefix = "SOLUNA",
        BaseColor = Color3.fromRGB(15, 15, 25),
        GlassColor = Color3.fromRGB(120, 170, 255),
        BlurRadius = 15,
        Transparency = 0.85,
        CornerRadius = 12,
        BorderThickness = 1,
        TextPadding = 20,
        ShadowTransparency = 0.7
    }
    local vu993 = game:GetService("TextService")
    local vu994 = game:GetService("MarketplaceService")
    local vu995 = game:GetService("RunService")
    local vu996 = game:GetService("UserInputService")
    local vu997 = game:GetService("Players")
    local function v1026()
        if not vu997.LocalPlayer then
            vu997:GetPropertyChangedSignal("LocalPlayer"):Wait()
        end
        local v998 = Instance.new("ScreenGui")
        v998.Name = "SolunaGlassWatermark"
        v998.Parent = game.CoreGui
        v998.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        v998.Enabled = vu177.Watermark
        local vu999 = "Unknown Game"
        pcall(function()
            vu999 = vu994:GetProductInfo(game.PlaceId).Name
        end)
        local v1000 = vu997.LocalPlayer and vu997.LocalPlayer.Name or "Unknown Player"
        local v1001 = string.format("%s | %s | %s | FPS: 0", vu992.Prefix, vu999, v1000)
        local v1002 = vu993:GetTextSize(v1001, 14, Enum.Font.GothamMedium, Vector2.new(1000, 30))
        local vu1003 = Instance.new("Frame")
        vu1003.Name = "GlassFrame"
        vu1003.Size = UDim2.new(0, v1002.X + vu992.TextPadding * 2, 0, v1002.Y + 16)
        vu1003.Position = UDim2.new(0, 20, 0, 20)
        vu1003.BackgroundColor3 = vu992.BaseColor
        vu1003.BackgroundTransparency = vu992.Transparency
        vu1003.Parent = v998
        local v1004 = Instance.new("Frame")
        v1004.Name = "GlassEffect"
        v1004.Size = UDim2.new(1, 0, 1, 0)
        v1004.BackgroundColor3 = vu992.GlassColor
        v1004.BackgroundTransparency = 0.95
        v1004.Parent = vu1003
        local v1005 = Instance.new("UIGradient")
        v1005.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
            ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
        })
        v1005.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.7),
            NumberSequenceKeypoint.new(1, 0.9)
        })
        v1005.Rotation = 90
        v1005.Parent = v1004
        local v1006 = Instance.new("UICorner")
        v1006.CornerRadius = UDim.new(0, vu992.CornerRadius)
        v1006.Parent = vu1003
        local v1007 = Instance.new("UIStroke", vu1003)
        v1007.Thickness = vu992.BorderThickness
        v1007.Color = Color3.fromRGB(255, 255, 255)
        v1007.Transparency = 0.8
        local v1008 = Instance.new("TextLabel")
        v1008.Size = UDim2.new(1, 0, 1, 0)
        v1008.Text = v1001
        v1008.TextColor3 = Color3.fromRGB(255, 255, 255)
        v1008.BackgroundTransparency = 1
        v1008.Font = Enum.Font.GothamMedium
        v1008.TextSize = 14
        v1008.TextXAlignment = Enum.TextXAlignment.Center
        v1008.TextTransparency = 0.1
        v1008.Parent = vu1003
        local vu1009 = nil
        local vu1010 = nil
        local vu1011 = nil
        local vu1012 = nil
        local function vu1015(p1013)
            local v1014 = p1013.Position - vu1011
            vu1003.Position = UDim2.new(vu1012.X.Scale, vu1012.X.Offset + v1014.X, vu1012.Y.Scale, vu1012.Y.Offset + v1014.Y)
        end
        vu1003.InputBegan:Connect(function(pu1016)
            if pu1016.UserInputType == Enum.UserInputType.MouseButton1 then
                vu1009 = true
                vu1011 = pu1016.Position
                vu1012 = vu1003.Position
                pu1016.Changed:Connect(function()
                    if pu1016.UserInputState == Enum.UserInputState.End then
                        vu1009 = false
                    end
                end)
            end
        end)
        vu1003.InputChanged:Connect(function(p1017)
            if p1017.UserInputType == Enum.UserInputType.MouseMovement then
                vu1010 = p1017
            end
        end)
        vu996.InputChanged:Connect(function(p1018)
            if p1018 == vu1010 and vu1009 then
                vu1015(p1018)
            end
        end)
        vu178()._Watermark = {
            Gui = v998,
            Label = v1008,
            Enabled = vu177.Watermark,
            FPSConnection = nil
        }
        if vu177.Watermark then
            local vu1019 = tick()
            local vu1020 = tick()
            vu178()._Watermark.FPSConnection = vu995.RenderStepped:Connect(function()
                local v1021 = tick()
                local v1022 = math.floor(1 / (v1021 - vu1019))
                vu1019 = v1021
                if v1021 - vu1020 >= 0.5 then
                    local v1023 = vu178()._Watermark
                    if v1023 and v1023.Label then
                        local vu1024 = "Unknown Game"
                        pcall(function()
                            vu1024 = vu994:GetProductInfo(game.PlaceId).Name
                        end)
                        local v1025 = vu997.LocalPlayer and vu997.LocalPlayer.Name or "Unknown Player"
                        v1023.Label.Text = string.format("%s | %s | %s | %d FPS", vu992.Prefix, vu1024, v1025, v1022)
                    end
                    vu1020 = v1021
                end
            end)
        end
    end
    if not vu997.LocalPlayer then
        local v1027 = vu997
        vu997.GetPropertyChangedSignal(v1027, "LocalPlayer"):Wait()
    end
    v1026()
    v991:AddToggle("watermark", {
        Title = "Watermark",
        Description = "Toggle the Soluna glass watermark display",
        Default = vu177.Watermark,
        Callback = function(p1028)
            vu177.Watermark = p1028
            vu511.Watermark = p1028
            if vu178()._Watermark then
                vu178()._Watermark.Gui.Enabled = p1028
                vu178()._Watermark.Enabled = p1028
                if vu178()._Watermark.FPSConnection then
                    vu178()._Watermark.FPSConnection:Disconnect()
                    vu178()._Watermark.FPSConnection = nil
                end
                if p1028 then
                    local vu1029 = tick()
                    local vu1030 = tick()
                    vu178()._Watermark.FPSConnection = vu995.RenderStepped:Connect(function()
                        local v1031 = tick()
                        local v1032 = math.floor(1 / (v1031 - vu1029))
                        vu1029 = v1031
                        if v1031 - vu1030 >= 0.5 then
                            local v1033 = vu178()._Watermark
                            if v1033 and v1033.Label then
                                local vu1034 = "Unknown Game"
                                pcall(function()
                                    vu1034 = vu994:GetProductInfo(game.PlaceId).Name
                                end)
                                local v1035 = vu997.LocalPlayer and vu997.LocalPlayer.Name or "Unknown Player"
                                v1033.Label.Text = string.format("%s | %s | %s | %d FPS", vu992.Prefix, vu1034, v1035, v1032)
                            end
                            vu1030 = v1031
                        end
                    end)
                end
            end
        end
    })
    v991:AddDropdown("Theme", {
        Title = "Theme",
        Description = "Changes the UI Theme",
        Values = vu62.Themes,
        Default = vu62.Theme,
        Callback = function(p1036)
            vu62:SetTheme(p1036)
            vu509.Theme = p1036
            vu36:ExportSettings()
        end
    })
    if vu62.UseAcrylic then
        v991:AddToggle("Acrylic", {
            Title = "Acrylic",
            Description = "Blurred Background requires Graphic Quality >= 8",
            Default = vu62.Acrylic,
            Callback = function(pu1037)
                if pu1037 and vu509.ShowWarnings then
                    if vu509.ShowWarnings then
                        vu69:Dialog({
                            Title = "Warning",
                            Content = "This Option can be detected! Activate it anyway?",
                            Buttons = {
                                {
                                    Title = "Confirm",
                                    Callback = function()
                                        vu62:ToggleAcrylic(pu1037)
                                    end
                                },
                                {
                                    Title = "Cancel",
                                    Callback = function()
                                        vu62.Options.Acrylic:SetValue(false)
                                    end
                                }
                            }
                        })
                    end
                else
                    vu62:ToggleAcrylic(pu1037)
                end
            end
        })
    end
    v991:AddToggle("Transparency", {
        Title = "Transparency",
        Description = "Makes the UI Transparent",
        Default = vu509.Transparency,
        Callback = function(p1038)
            vu62:ToggleTransparency(p1038)
            vu509.Transparency = p1038
            vu36:ExportSettings()
        end
    })
    if vu48 then
        v991:AddKeybind("MinimizeKey", {
            Title = "Minimize Key",
            Description = "Changes the Minimize Key",
            Default = vu62.MinimizeKey,
            ChangedCallback = function()
                vu509.MinimizeKey = vu62.Options.MinimizeKey.Value
                vu36:ExportSettings()
            end
        })
        vu62.MinimizeKeybind = vu62.Options.MinimizeKey
    end
    local v1039 = v70.Settings:AddSection("Notifications & Warnings")
    v1039:AddToggle("ShowNotifications", {
        Title = "Show Notifications",
        Description = "Toggles the Notifications Show",
        Default = vu509.ShowNotifications
    }):OnChanged(function(p1040)
        vu62.ShowNotifications = p1040
        vu509.ShowNotifications = p1040
        vu36:ExportSettings()
    end)
    v1039:AddToggle("ShowWarnings", {
        Title = "Show Warnings",
        Description = "Toggles the Security Warnings Show",
        Default = vu509.ShowWarnings
    }):OnChanged(function(p1041)
        vu509.ShowWarnings = p1041
        vu36:ExportSettings()
    end)
    local v1042 = v70.Settings:AddSection("Performance")
    task.wait(0.1)
    v1042:AddParagraph({
        Title = "NOTE",
        Content = "Heartbeat fires every frame, after the physics simulation has completed. RenderStepped fires every frame, prior to the frame being rendered. Stepped fires every frame, prior to the physics simulation."
    })
    v1042:AddDropdown("RenderingMode", {
        Title = "Rendering Mode",
        Description = "Changes the Rendering Mode",
        Values = {
            "Heartbeat",
            "RenderStepped",
            "Stepped"
        },
        Default = vu509.RenderingMode,
        Callback = function(p1043)
            vu509.RenderingMode = p1043
            vu36:ExportSettings()
            local v1044 = vu69
            local v1045 = v1044.Dialog
            local v1046 = {
                Title = string.format(vu49[os.date("*t").month], "Soluna"),
                Content = "Changes will take effect after the Restart!",
                Buttons = {
                    {
                        Title = "Confirm"
                    }
                }
            }
            v1045(v1044, v1046)
        end
    })
    if getfenv().isfile and (getfenv().readfile and (getfenv().writefile and getfenv().delfile)) then
        local v1047 = v70.Settings:AddSection("Configuration Manager")
        v1047:AddToggle("AutoImport", {
            Title = "Auto Import",
            Description = "Toggles the Auto Import",
            Default = vu509.AutoImport
        }):OnChanged(function(p1048)
            vu509.AutoImport = p1048
            vu36:ExportSettings()
        end)
        task.wait(0.1)
        v1047:AddParagraph({
            Title = string.format("Manager for %s", game.Name),
            Content = string.format("Universe ID is %s", game.GameId)
        })
        v1047:AddButton({
            Title = "Import Configuration File",
            Description = "Loads the Game Configuration File",
            Callback = function()
                xpcall(function()
                    if getfenv().isfile(string.format("%s.Soluna", game.GameId)) and getfenv().readfile(string.format("%s.Soluna", game.GameId)) then
                        local v1049 = vu510:JSONDecode(getfenv().readfile(string.format("%s.Soluna", game.GameId)))
                        local v1050 = next
                        local v1051 = nil
                        while true do
                            local v1052
                            v1051, v1052 = v1050(v1049, v1051)
                            if v1051 == nil then
                                break
                            end
                            if v1051 == "AimKey" or (v1051 == "SpinKey" or (v1051 == "TriggerKey" or v1051 == "FoVKey")) then
                                vu62.Options[v1051]:SetValue(v1052)
                                vu177[v1051] = v1052 ~= "RMB" and Enum.KeyCode[v1052] or Enum.UserInputType.MouseButton2
                            elseif v1051 == "AimPart" or (v1051 == "SpinPart" or typeof(vu177[v1051]) == "table") then
                                vu177[v1051] = v1052
                            elseif v1051 == "FoVColour" then
                                vu62.Options[v1051]:SetValueRGB(vu512:UnpackColour(v1052))
                            elseif v1051 == "SilentAim" then
                                vu133:SetValue(v1052)
                                vu177.SilentAim = v1052
                                vu3 = v1052
                                vu178().SilentAimEnabled = v1052
                            elseif vu177[v1051] ~= nil and vu62.Options[v1051] then
                                vu62.Options[v1051]:SetValue(v1052)
                            end
                        end
                        local v1053 = next
                        local v1054 = vu62.Options
                        local v1055 = nil
                        while true do
                            local v1056
                            v1055, v1056 = v1053(v1054, v1055)
                            if v1055 == nil then
                                break
                            end
                            if v1056.Type == "Dropdown" then
                                if v1055 == "AimPart" then
                                    v1056:SetValues(vu177.AimPartDropdownValues)
                                    v1056:SetValue(vu177.AimPart)
                                elseif v1055 == "SpinPart" then
                                    v1056:SetValues(vu177.SpinPartDropdownValues)
                                    v1056:SetValue(vu177.SpinPart)
                                elseif v1055 == "IgnoredPlayers" then
                                    v1056:SetValues(vu177.IgnoredPlayersDropdownValues)
                                    local v1057 = next
                                    local v1058 = vu177.IgnoredPlayers
                                    local v1059 = nil
                                    local v1060 = {}
                                    while true do
                                        local v1061
                                        v1059, v1061 = v1057(v1058, v1059)
                                        if v1059 == nil then
                                            break
                                        end
                                        v1060[v1061] = true
                                    end
                                    v1056:SetValue(v1060)
                                elseif v1055 == "TargetPlayers" then
                                    v1056:SetValues(vu177.TargetPlayersDropdownValues)
                                    local v1062 = next
                                    local v1063 = vu177.TargetPlayers
                                    local v1064 = nil
                                    local v1065 = {}
                                    while true do
                                        local v1066
                                        v1064, v1066 = v1062(v1063, v1064)
                                        if v1064 == nil then
                                            break
                                        end
                                        v1065[v1066] = true
                                    end
                                    v1056:SetValue(v1065)
                                end
                            end
                        end
                        vu69:Dialog({
                            Title = "Configuration Manager",
                            Content = string.format("Configuration File %s.Soluna has been successfully loaded!", game.GameId),
                            Buttons = {
                                {
                                    Title = "Confirm"
                                }
                            }
                        })
                    else
                        vu69:Dialog({
                            Title = "Configuration Manager",
                            Content = string.format("Configuration File %s.Soluna could not be found!", game.GameId),
                            Buttons = {
                                {
                                    Title = "Confirm"
                                }
                            }
                        })
                    end
                end, function()
                    local v1067 = vu69
                    local v1068 = v1067.Dialog
                    local v1069 = {
                        Title = "Configuration Manager",
                        Content = string.format("An Error occurred when loading the Configuration File %s.Soluna", game.GameId),
                        Buttons = {
                            {
                                Title = "Confirm"
                            }
                        }
                    }
                    v1068(v1067, v1069)
                end)
            end
        })
        v1047:AddButton({
            Title = "Export Configuration File",
            Description = "Overwrites the Game Configuration File",
            Callback = function()
                xpcall(function()
                    local v1070 = {
                        __LAST_UPDATED__ = os.date()
                    }
                    local v1071 = next
                    local v1072 = vu177
                    local v1073 = nil
                    while true do
                        local v1074
                        v1073, v1074 = v1071(v1072, v1073)
                        if v1073 == nil then
                            break
                        end
                        if v1073 == "AimKey" or (v1073 == "SpinKey" or (v1073 == "TriggerKey" or v1073 == "FoVKey")) then
                            v1070[v1073] = vu62.Options[v1073].Value
                        elseif v1073 == "FoVColour" then
                            v1070[v1073] = vu512:PackColour(v1074)
                        elseif v1073 == "SilentAim" then
                            v1070[v1073] = v1074
                        else
                            v1070[v1073] = v1074
                        end
                    end
                    local v1075 = vu510:JSONEncode(v1070)
                    getfenv().writefile(string.format("%s.Soluna", game.GameId), v1075)
                    vu69:Dialog({
                        Title = "Configuration Manager",
                        Content = string.format("Configuration File %s.Soluna has been successfully overwritten!", game.GameId),
                        Buttons = {
                            {
                                Title = "Confirm"
                            }
                        }
                    })
                end, function()
                    local v1076 = vu69
                    local v1077 = v1076.Dialog
                    local v1078 = {
                        Title = "Configuration Manager",
                        Content = string.format("An Error occurred when overwriting the Configuration File %s.Soluna", game.GameId),
                        Buttons = {
                            {
                                Title = "Confirm"
                            }
                        }
                    }
                    v1077(v1076, v1078)
                end)
            end
        })
        v1047:AddButton({
            Title = "Delete Configuration File",
            Description = "Removes the Game Configuration File",
            Callback = function()
                if getfenv().isfile(string.format("%s.Soluna", game.GameId)) then
                    getfenv().delfile(string.format("%s.Soluna", game.GameId))
                    local v1079 = vu69
                    local v1080 = v1079.Dialog
                    local v1081 = {
                        Title = "Configuration Manager",
                        Content = string.format("Configuration File %s.Soluna has been successfully removed!", game.GameId),
                        Buttons = {
                            {
                                Title = "Confirm"
                            }
                        }
                    }
                    v1080(v1079, v1081)
                else
                    local v1082 = vu69
                    local v1083 = v1082.Dialog
                    local v1084 = {
                        Title = "Configuration Manager",
                        Content = string.format("Configuration File %s.Soluna could not be found!", game.GameId),
                        Buttons = {
                            {
                                Title = "Confirm"
                            }
                        }
                    }
                    v1083(v1082, v1084)
                end
            end
        })
    else
        v51 = true
    end
    local v1085 = v70.Settings:AddSection("Discord & Website")
    if getfenv().setclipboard then
        v1085:AddButton({
            Title = "Copy Invite Link",
            Description = "Paste it into the Browser Tab",
            Callback = function()
                getfenv().setclipboard("https://discord.gg/2hxKqA3b7b")
                local v1086 = vu69
                local v1087 = v1086.Dialog
                local v1088 = {
                    Title = string.format(vu49[os.date("*t").month], "Soluna"),
                    Content = "Invite Link has been copied to the Clipboard!",
                    Buttons = {
                        {
                            Title = "Confirm"
                        }
                    }
                }
                v1087(v1086, v1088)
            end
        })
        v1085:AddButton({
            Title = "Copy Website Link",
            Description = "Paste it into the Browser Tab",
            Callback = function()
                getfenv().setclipboard("https://soluna-script.vercel.app/")
                local v1089 = vu69
                local v1090 = v1089.Dialog
                local v1091 = {
                    Title = string.format(vu49[os.date("*t").month], "Soluna"),
                    Content = "Website Link has been copied to the Clipboard!",
                    Buttons = {
                        {
                            Title = "Confirm"
                        }
                    }
                }
                v1090(v1089, v1091)
            end
        })
    else
        v1085:AddParagraph({
            Title = "https://soluna-script.vercel.app/",
            Content = "Paste it into the Browser Tab"
        })
        task.wait(0.1)
        v1085:AddParagraph({
            Title = "https://soluna-script.vercel.app/",
            Content = "Paste it into the Browser Tab"
        })
    end
    if vu509.ShowWarnings then
        if vu13 then
            vu69:Dialog({
                Title = "Warning",
                Content = "Running in Debugging Mode. Some Features may not work properly.",
                Buttons = {
                    {
                        Title = "Confirm"
                    }
                }
            })
        elseif v51 then
            if game.Id == 17625359962 then
                if game.Id == 17625359962 then
                    vu69:Dialog({
                        Title = "Warning",
                        Content = string.format("Your software doesn\'t support all the Features of %s!", string.format(vu49[os.date("*t").month], "Soluna")),
                        Buttons = {
                            {
                                Title = "Confirm"
                            }
                        }
                    })
                end
            else
                vu69:Dialog({
                    Title = "Warning",
                    Content = string.format("This game may or may not support all the Features of %s! (Universal Script Soon)", string.format(vu49[os.date("*t").month], "Soluna")),
                    Buttons = {
                        {
                            Title = "Confirm"
                        }
                    }
                })
            end
        end
    end
    task.wait(0.1)
    v70.HvH:AddParagraph({
        Title = string.format("%s ", string.format(vu49[os.date("*t").month], "Soluna")),
        Content = "Soluna\nhttps://discord.gg/2hxKqA3b7b"
    })
    local v1092 = v70.HvH:AddSection("Desync")
    vu177.DesyncEnabled = false
    vu177.DesyncMode = "Prediction"
    vu177.DesyncStrength = 5
    vu177.DesyncUpdateRate = 0.01
    vu177.DesyncYaw = 0
    vu177.DesyncPitch = 0
    vu177.DesyncJitter = false
    vu177.DesyncJitterStrength = 15
    vu177.DesyncAutoDirection = false
    vu177.DesyncCustomRotation = Vector3.new(0, 0, 0)
    vu177.DesyncBreakWalk = false
    vu177.DesyncLeanMode = "Switch"
    vu177.DesyncFakeLag = false
    vu177.DesyncFakeLagAmount = 0.15
    v1092:AddToggle("DesyncEnabled", {
        Title = "Enable Desync",
        Description = "Enables position/rotation desync",
        Default = vu177.DesyncEnabled
    }):OnChanged(function(p1093)
        vu177.DesyncEnabled = p1093
        vu36:ExportSettings()
        if p1093 then
            task.spawn(function()
                local v1094 = 0
                local v1095 = 0
                local v1096 = nil
                local v1097 = 0
                local v1098 = false
                while vu177.DesyncEnabled do
                    if tick() - v1094 >= vu177.DesyncUpdateRate then
                        v1094 = tick()
                        local v1099 = require(game:GetService("Players").LocalPlayer.PlayerScripts.Controllers.FighterController)
                        if v1099 and (v1099.LocalFighter and v1099.LocalFighter.Entity) then
                            local v1100 = v1099.LocalFighter.Entity
                            local v1101 = v1100.RootPart
                            local v1102 = v1100:FindFirstChild("Humanoid")
                            if v1101 and v1102 then
                                local v1103 = v1102.MoveDirection
                                local v1104 = workspace.CurrentCamera.CFrame.LookVector
                                if vu177.DesyncFakeLag then
                                    v1095 = v1095 + 1
                                    if 60 * vu177.DesyncFakeLagAmount > v1095 then
                                        v1096 = v1101.CFrame
                                    else
                                        v1095 = 0
                                        if v1096 then
                                            v1101.CFrame = v1096
                                        end
                                    end
                                end
                                CFrame.new()
                                if vu177.DesyncAutoDirection and v1103.Magnitude > 0.1 then
                                    CFrame.lookAt(Vector3.new(), v1103)
                                else
                                    CFrame.lookAt(Vector3.new(), v1104)
                                end
                                if vu177.DesyncMode ~= "Prediction" then
                                    if vu177.DesyncMode ~= "Teleport" then
                                        if vu177.DesyncMode ~= "Spin" then
                                            if vu177.DesyncMode ~= "Random" then
                                                if vu177.DesyncMode == "Custom" then
                                                    local v1105 = Vector3.new(math.sin(tick() * 2) * vu177.DesyncStrength, vu177.DesyncJitter and math.cos(tick() * 3) * vu177.DesyncJitterStrength or 0, math.cos(tick() * 2) * vu177.DesyncStrength)
                                                    v1101.CFrame = v1101.CFrame * CFrame.new(v1105) * CFrame.Angles(math.rad(vu177.DesyncCustomRotation.X), math.rad(vu177.DesyncCustomRotation.Y), math.rad(vu177.DesyncCustomRotation.Z))
                                                end
                                            else
                                                local v1106 = Vector3.new(math.random(- vu177.DesyncStrength, vu177.DesyncStrength), vu177.DesyncJitter and math.random(- vu177.DesyncJitterStrength, vu177.DesyncJitterStrength) or 0, math.random(- vu177.DesyncStrength, vu177.DesyncStrength))
                                                v1101.CFrame = v1101.CFrame * CFrame.new(v1106) * CFrame.Angles(math.rad(math.random(- vu177.DesyncPitch, vu177.DesyncPitch)), math.rad(math.random(- vu177.DesyncYaw, vu177.DesyncYaw)), math.rad(math.random(- 30, 30)))
                                            end
                                        else
                                            v1097 = (v1097 + vu177.DesyncYaw + math.random(1, 10)) % 360
                                            local v1107 = Vector3.new(math.cos(math.rad(v1097)) * vu177.DesyncStrength, vu177.DesyncJitter and math.sin(tick() * 10) * vu177.DesyncJitterStrength or 0, math.sin(math.rad(v1097)) * vu177.DesyncStrength)
                                            v1101.CFrame = v1101.CFrame * CFrame.new(v1107) * CFrame.Angles(0, math.rad(v1097), 0)
                                        end
                                    else
                                        v1098 = not v1098
                                        local v1108 = Vector3.new((v1098 and 1 or - 1) * vu177.DesyncStrength, vu177.DesyncJitter and ((v1098 and 1 or - 1) * vu177.DesyncJitterStrength or 0) or 0, (v1098 and - 1 or 1) * vu177.DesyncStrength)
                                        v1101.CFrame = v1101.CFrame * CFrame.new(v1108)
                                    end
                                else
                                    local v1109 = Vector3.new(math.sin(tick() * 5) * vu177.DesyncStrength, math.cos(tick() * 3) * (vu177.DesyncJitter and vu177.DesyncJitterStrength or 0), math.cos(tick() * 5) * vu177.DesyncStrength) + Vector3.new(math.random(- 0.5, 0.5), math.random(- 0.5, 0.5), math.random(- 0.5, 0.5))
                                    v1101.CFrame = v1101.CFrame * CFrame.new(v1109)
                                    v1097 = (v1097 + math.random(10, 45)) % 360
                                    v1101.CFrame = v1101.CFrame * CFrame.Angles(math.rad(math.random(- 30, 30)), math.rad(v1097), math.rad(math.random(- 15, 15)))
                                end
                                if vu177.DesyncLeanMode ~= "None" then
                                    local v1110 = vu177.DesyncLeanMode == "Left" and - 1 or 1
                                    if vu177.DesyncLeanMode == "Switch" then
                                        v1098 = not v1098
                                        v1110 = v1098 and 1
                                        if not v1110 then
                                            v1110 = - 1
                                        end
                                    end
                                    v1099.LocalFighter.LocalCameraLean = v1110
                                    v1099.LocalFighter:SetReplicate("CameraLean", v1110)
                                end
                                if vu177.DesyncBreakWalk and v1103.Magnitude > 0.1 then
                                    v1102:Move(Vector3.new(), false)
                                    task.wait()
                                    v1102:Move(v1103, false)
                                end
                            end
                        end
                    end
                    task.wait()
                end
                local v1111 = require(game:GetService("Players").LocalPlayer.PlayerScripts.Controllers.FighterController)
                if v1111 and v1111.LocalFighter then
                    v1111.LocalFighter.LocalCameraLean = 0
                    v1111.LocalFighter:SetReplicate("CameraLean", 0)
                end
            end)
        end
    end)
    v1092:AddDropdown("DesyncMode", {
        Title = "Desync Mode",
        Description = "Changes how the desync behaves",
        Values = {
            "Prediction",
            "Teleport",
            "Spin",
            "Random",
            "Custom"
        },
        Default = vu177.DesyncMode,
        Callback = function(p1112)
            vu177.DesyncMode = p1112
            vu36:ExportSettings()
        end
    })
    v1092:AddSlider("DesyncStrength", {
        Title = "Desync Strength",
        Description = "Adjusts the intensity of the desync",
        Default = vu177.DesyncStrength,
        Min = 1,
        Max = 20,
        Rounding = 1,
        Callback = function(p1113)
            vu177.DesyncStrength = p1113
            vu36:ExportSettings()
        end
    })
    v1092:AddSlider("DesyncUpdateRate", {
        Title = "Update Rate",
        Description = "How often the desync updates (seconds)",
        Default = vu177.DesyncUpdateRate,
        Min = 0.01,
        Max = 0.1,
        Rounding = 2,
        Callback = function(p1114)
            vu177.DesyncUpdateRate = p1114
            vu36:ExportSettings()
        end
    })
    v1092:AddToggle("DesyncFakeLag", {
        Title = "Enable Fake Lag",
        Description = "Adds network delay simulation",
        Default = vu177.DesyncFakeLag
    }):OnChanged(function(p1115)
        vu177.DesyncFakeLag = p1115
        vu36:ExportSettings()
    end)
    v1092:AddSlider("DesyncFakeLagAmount", {
        Title = "Fake Lag Amount",
        Description = "How much lag to simulate (seconds)",
        Default = vu177.DesyncFakeLagAmount,
        Min = 0.1,
        Max = 0.5,
        Rounding = 2,
        Callback = function(p1116)
            vu177.DesyncFakeLagAmount = p1116
            vu36:ExportSettings()
        end
    })
    v1092:AddToggle("DesyncJitter", {
        Title = "Enable Jitter",
        Description = "Adds vertical jitter to desync",
        Default = vu177.DesyncJitter
    }):OnChanged(function(p1117)
        vu177.DesyncJitter = p1117
        vu36:ExportSettings()
    end)
    v1092:AddSlider("DesyncJitterStrength", {
        Title = "Jitter Strength",
        Description = "How strong the jitter effect is",
        Default = vu177.DesyncJitterStrength,
        Min = 1,
        Max = 50,
        Rounding = 1,
        Callback = function(p1118)
            vu177.DesyncJitterStrength = p1118
            vu36:ExportSettings()
        end
    })
    v1092:AddToggle("DesyncAutoDirection", {
        Title = "Auto Direction",
        Description = "Automatically adjusts desync based on movement",
        Default = vu177.DesyncAutoDirection
    }):OnChanged(function(p1119)
        vu177.DesyncAutoDirection = p1119
        vu36:ExportSettings()
    end)
    v1092:AddToggle("DesyncBreakWalk", {
        Title = "Break Walk",
        Description = "Breaks walk animation for extra desync",
        Default = vu177.DesyncBreakWalk
    }):OnChanged(function(p1120)
        vu177.DesyncBreakWalk = p1120
        vu36:ExportSettings()
    end)
    v1092:AddDropdown("DesyncLeanMode", {
        Title = "Lean Mode",
        Description = "Character lean behavior during desync",
        Values = {
            "None",
            "Left",
            "Right",
            "Switch"
        },
        Default = vu177.DesyncLeanMode,
        Callback = function(p1121)
            vu177.DesyncLeanMode = p1121
            vu36:ExportSettings()
        end
    })
    local v1122 = v70.HvH:AddSection("Custom Rotation")
    v1122:AddSlider("CustomRotationX", {
        Title = "X Rotation",
        Description = "Custom X-axis rotation",
        Default = vu177.DesyncCustomRotation.X,
        Min = - 180,
        Max = 180,
        Rounding = 1,
        Callback = function(p1123)
            vu177.DesyncCustomRotation = Vector3.new(p1123, vu177.DesyncCustomRotation.Y, vu177.DesyncCustomRotation.Z)
            vu36:ExportSettings()
        end
    })
    v1122:AddSlider("CustomRotationY", {
        Title = "Y Rotation",
        Description = "Custom Y-axis rotation",
        Default = vu177.DesyncCustomRotation.Y,
        Min = - 180,
        Max = 180,
        Rounding = 1,
        Callback = function(p1124)
            vu177.DesyncCustomRotation = Vector3.new(vu177.DesyncCustomRotation.X, p1124, vu177.DesyncCustomRotation.Z)
            vu36:ExportSettings()
        end
    })
    v1122:AddSlider("CustomRotationZ", {
        Title = "Z Rotation",
        Description = "Custom Z-axis rotation",
        Default = vu177.DesyncCustomRotation.Z,
        Min = - 180,
        Max = 180,
        Rounding = 1,
        Callback = function(p1125)
            vu177.DesyncCustomRotation = Vector3.new(vu177.DesyncCustomRotation.X, vu177.DesyncCustomRotation.Y, p1125)
            vu36:ExportSettings()
        end
    })
    local function vu1127(p1126)
        if vu62 and typeof(p1126) == "string" then
            vu62:Notify({
                Title = string.format("%s   ", string.format(vu49[os.date("*t").month], "Soluna")),
                Content = p1126,
                SubContent = "By @ Soluna Development",
                Duration = 1.5
            })
        end
    end
    vu1127(" Upgrade to unlock all Options ")
    local vu1130 = {
        ResetAimbotFields = function(_, p1128, p1129)
            vu54 = p1128 and vu54 or false
            vu55 = p1129 and vu55 or nil
            if vu56 then
                vu56:Cancel()
                vu56 = nil
            end
            vu17.MouseDeltaSensitivity = vu57
        end,
        ResetSecondaryFields = function(_)
            vu58 = false
            vu59 = false
            vu60 = false
        end
    }
    if vu48 then
        local vu1131 = nil
        vu1131 = vu17.InputBegan:Connect(function(p1132)
            if vu62 then
                if not vu17:GetFocusedTextBox() then
                    if vu45.Aimbot and (p1132.KeyCode == vu45.AimKey or p1132.UserInputType == vu45.AimKey) then
                        if vu54 then
                            vu1130:ResetAimbotFields()
                            vu1127("[Aiming Mode]: OFF")
                        else
                            vu54 = true
                            vu1127("[Aiming Mode]: ON")
                        end
                    elseif vu13 or (not getfenv().mouse1click or (not vu45.TriggerBot or p1132.KeyCode ~= vu45.TriggerKey and p1132.UserInputType ~= vu45.TriggerKey)) then
                        if vu13 or (not getfenv().Drawing or (not getfenv().Drawing.new or (not vu45.FoV or p1132.KeyCode ~= vu45.FoVKey and p1132.UserInputType ~= vu45.FoVKey))) then
                            if not vu13 and (getfenv().Drawing and (getfenv().Drawing.new and (vu45.ESPBox or (vu45.NameESP or (vu45.HealthESP or (vu45.MagnitudeESP or vu45.TracerESP)))))) and (p1132.KeyCode == vu45.ESPKey or p1132.UserInputType == vu45.ESPKey) then
                                if vu61 then
                                    vu61 = false
                                    vu1127("[ESP Show]: OFF")
                                else
                                    vu61 = true
                                    vu1127("[ESP Show]: ON")
                                end
                            end
                        elseif vu60 then
                            vu60 = false
                            vu1127("[FoV Show]: OFF")
                        else
                            vu60 = true
                            vu1127("[FoV Show]: ON")
                        end
                    elseif vu59 then
                        vu59 = false
                        vu1127("[Triggering Mode]: OFF")
                    else
                        vu59 = true
                        vu1127("[Triggering Mode]: ON")
                    end
                end
            else
                vu1131:Disconnect()
            end
        end)
        local vu1133 = nil
        vu1133 = vu17.InputEnded:Connect(function(p1134)
            if vu62 then
                if not vu17:GetFocusedTextBox() then
                    if vu54 and (not vu45.OnePressAimingMode and (p1134.KeyCode == vu45.AimKey or p1134.UserInputType == vu45.AimKey)) then
                        vu1130:ResetAimbotFields()
                        vu1127("[Aiming Mode]: OFF")
                    elseif vu58 and (not vu45.OnePressSpinningMode and (p1134.KeyCode == vu45.SpinKey or p1134.UserInputType == vu45.SpinKey)) then
                        vu58 = false
                        vu1127("[Spinning Mode]: OFF")
                    elseif vu59 and (not vu45.OnePressTriggeringMode and (p1134.KeyCode == vu45.TriggerKey or p1134.UserInputType == vu45.TriggerKey)) then
                        vu59 = false
                        vu1127("[Triggering Mode]: OFF")
                    end
                end
            else
                vu1133:Disconnect()
            end
        end)
        local vu1135 = nil
        vu1135 = vu17.WindowFocused:Connect(function()
            if vu62 then
                vu52 = true
            else
                vu1135:Disconnect()
            end
        end)
        local vu1136 = nil
        vu1136 = vu17.WindowFocusReleased:Connect(function()
            if vu62 then
                vu52 = false
            else
                vu1136:Disconnect()
            end
        end)
    end
    local vu1149 = {
        CalculateDirection = function(_, p1137, p1138, p1139)
            return typeof(p1137) == "Vector3" and typeof(p1138) == "Vector3" and (typeof(p1139) == "number" and (p1138 - p1137).Unit * p1139) or Vector3.zero
        end,
        CalculateChance = function(_, p1140)
            local v1141
            if typeof(p1140) ~= "number" then
                v1141 = false
            else
                v1141 = math.round(math.clamp(p1140, 1, 100)) / 100 >= math.round(Random.new():NextNumber() * 100) / 100
            end
            return v1141
        end,
        Abbreviate = function(_, p1142)
            if typeof(p1142) ~= "number" then
                return p1142
            end
            local v1143 = tostring(math.round(p1142))
            local v1144 = next
            local v1145 = {
                D = 1e33,
                N = 1e30,
                O = 1e27,
                Sp = 1e24,
                Sx = 1e21,
                Qn = 1e18,
                Qd = 1000000000000000,
                T = 1000000000000,
                B = 1000000000,
                M = 1000000,
                K = 1000
            }
            local v1146 = nil
            local v1147 = 0
            while true do
                local v1148
                v1146, v1148 = v1144(v1145, v1146)
                if v1146 == nil then
                    break
                end
                if math.abs(p1142) >= 1e36 then
                    v1143 = "inf"
                    break
                end
                if v1148 <= math.abs(p1142) and v1147 < v1148 then
                    v1143 = string.format("%s%s", tostring(math.round(p1142 / v1148)), v1146)
                    v1147 = v1148
                end
            end
            return v1143
        end
    }
    local function vu1152(p1150)
        if p1150 and p1150.Character then
            local v1151 = p1150.Character:FindFirstChild("HumanoidRootPart")
            if v1151 then
                if v1151:FindFirstChild("TeammateLabel") then
                    return true
                elseif p1150.Team and vu16.Team then
                    return p1150.Team == vu16.Team
                else
                    return false
                end
            else
                return false
            end
        else
            return false
        end
    end
    local function vu1163(p1153)
        if not (p1153 and (p1153:FindFirstChildWhichIsA("Humanoid") and (vu45.AimPart and p1153:FindFirstChild(vu45.AimPart))) and (p1153:FindFirstChild(vu45.AimPart):IsA("BasePart") and vu46.Character and (vu46.Character:FindFirstChildWhichIsA("Humanoid") and (vu46.Character:FindFirstChild(vu45.AimPart) and vu46.Character:FindFirstChild(vu45.AimPart):IsA("BasePart"))))) then
            return false
        end
        local v1154 = vu15:GetPlayerFromCharacter(p1153)
        if not v1154 or v1154 == vu46 then
            return false
        end
        local v1155 = p1153:FindFirstChildWhichIsA("Humanoid")
        p1153:FindFirstChildWhichIsA("Head")
        local v1156 = p1153:FindFirstChild(vu45.AimPart)
        local v1157 = vu46.Character:FindFirstChild(vu45.AimPart)
        if vu45.AliveCheck and v1155.Health == 0 or vu45.GodCheck and (v1155.Health >= 1e36 or p1153:FindFirstChildWhichIsA("ForceField")) then
            return false
        end
        if vu45.TeamCheck and vu1152(v1154) then
            return false
        end
        if vu45.FriendCheck and v1154:IsFriendsWith(vu46.UserId) then
            return false
        end
        if vu45.FollowCheck and v1154.FollowUserId == vu46.UserId or vu45.VerifiedBadgeCheck and v1154.HasVerifiedBadge then
            return false
        end
        if vu45.WallCheck then
            local v1158 = vu1149:CalculateDirection(v1157.Position, v1156.Position, (v1156.Position - v1157.Position).Magnitude)
            local v1159 = RaycastParams.new()
            v1159.FilterType = Enum.RaycastFilterType.Exclude
            v1159.FilterDescendantsInstances = {
                vu46.Character
            }
            local v1160 = workspace:Raycast(v1157.Position, v1158, v1159)
            if not (v1160 and v1160.Instance and v1160.Instance:FindFirstAncestor(v1154.Name)) then
                return false
            end
        else
            if vu45.MagnitudeCheck and (v1156.Position - v1157.Position).Magnitude > vu45.TriggerMagnitude then
                return false
            end
            if vu45.WhitelistedGroupCheck and v1154:IsInGroup(vu45.WhitelistedGroup) or vu45.BlacklistedGroupCheck and not v1154:IsInGroup(vu45.BlacklistedGroup) then
                return false
            end
            if vu45.IgnoredPlayersCheck and table.find(vu45.IgnoredPlayers, v1154.Name) or vu45.TargetPlayersCheck and not table.find(vu45.TargetPlayers, v1154.Name) then
                return false
            end
        end
        local v1161 = vu45.UseOffset and (vu45.AutoOffset and Vector3.new(0, v1156.Position.Y * vu45.StaticOffsetIncrement * (v1156.Position - v1157.Position).Magnitude / 1000 <= vu45.MaxAutoOffset and v1156.Position.Y * vu45.StaticOffsetIncrement * (v1156.Position - v1157.Position).Magnitude / 1000 or vu45.MaxAutoOffset, 0) + v1155.MoveDirection * vu45.DynamicOffsetIncrement / 10 or vu45.OffsetType == "Static" and Vector3.new(0, v1156.Position.Y * vu45.StaticOffsetIncrement / 10, 0) or (vu45.OffsetType == "Dynamic" and v1155.MoveDirection * vu45.DynamicOffsetIncrement / 10 or Vector3.new(0, v1156.Position.Y * vu45.StaticOffsetIncrement / 10, 0) + v1155.MoveDirection * vu45.DynamicOffsetIncrement / 10)) or Vector3.zero
        local v1162 = vu45.UseNoise and Vector3.new(Random.new():NextNumber(- vu45.NoiseFrequency / 100, vu45.NoiseFrequency / 100), Random.new():NextNumber(- vu45.NoiseFrequency / 100, vu45.NoiseFrequency / 100), Random.new():NextNumber(- vu45.NoiseFrequency / 100, vu45.NoiseFrequency / 100)) or Vector3.zero
        return true, p1153, {
            workspace.CurrentCamera:WorldToViewportPoint(v1156.Position + v1161 + v1162)
        }, v1156.Position + v1161 + v1162, (v1156.Position + v1161 + v1162 - v1157.Position).Magnitude, CFrame.new(v1156.Position + v1161 + v1162) * CFrame.fromEulerAnglesYXZ(math.rad(v1156.Orientation.X), math.rad(v1156.Orientation.Y), math.rad(v1156.Orientation.Z)), v1156
    end
    local vu1164 = 0
    local function vu1166()
        if not vu13 and (getfenv().mouse1click and (vu48 and vu59)) and (vu45.SmartTriggerBot and vu54 or not vu45.SmartTriggerBot) and vu47.Target and (vu1163(vu47.Target:FindFirstAncestorWhichIsA("Model")) and vu1149:CalculateChance(vu45.TriggerBotChance)) then
            local v1165 = tick()
            if vu45.TriggerBotDelay == 0 or v1165 - vu1164 >= vu45.TriggerBotDelay then
                getfenv().mouse1click()
                vu1164 = v1165
            end
        end
    end
    local function vu1167()
        if vu62 and os.clock() - vu53 >= 1 then
            if vu45.RandomAimPart and # vu45.AimPartDropdownValues > 0 then
                vu62.Options.AimPart:SetValue(vu45.AimPartDropdownValues[Random.new():NextInteger(1, # vu45.AimPartDropdownValues)])
            end
            if vu45.RandomSpinPart and # vu45.SpinPartDropdownValues > 0 then
                vu62.Options.SpinPart:SetValue(vu45.SpinPartDropdownValues[Random.new():NextInteger(1, # vu45.SpinPartDropdownValues)])
            end
            vu53 = os.clock()
        end
    end
    local vu1170 = {
        Visualize = function(_, p1168)
            if vu13 or (not vu62 or (not getfenv().Drawing or (not getfenv().Drawing.new or (typeof(p1168) ~= "string" or string.lower(p1168) ~= "fov")))) then
                return nil
            end
            local v1169 = getfenv().Drawing.new("Circle")
            v1169.Visible = false
            v1169.ZIndex = 4
            v1169.NumSides = 1000
            v1169.Radius = vu45.FoVRadius
            v1169.Thickness = vu45.FoVThickness
            v1169.Transparency = vu45.FoVOpacity
            v1169.Filled = vu45.FoVFilled
            v1169.Color = vu45.FoVColour
            return v1169
        end
    }
    local vu1171 = {}
    local v1172 = vu1170
    vu1171.FoV = vu1170.Visualize(v1172, "FoV")
    function vu1170.ClearVisual(_, p1173, p1174)
        local v1175 = table.find(vu1171, p1173)
        if p1173 and (v1175 or p1174 == "FoV") then
            if p1173.Destroy then
                p1173:Destroy()
            elseif p1173.Remove then
                p1173:Remove()
            end
            if v1175 then
                table.remove(vu1171, v1175)
            elseif p1174 == "FoV" then
                vu1171.FoV = nil
            end
        end
    end
    function vu1170.ClearVisuals(p1176)
        local v1177 = next
        local v1178 = vu1171
        local v1179 = nil
        while true do
            local v1180
            v1179, v1180 = v1177(v1178, v1179)
            if v1179 == nil then
                break
            end
            p1176:ClearVisual(v1180, v1179)
        end
    end
    function vu1170.VisualizeFoV(p1181)
        if not vu62 then
            return p1181:ClearVisuals()
        end
        local v1182 = vu17:GetMouseLocation()
        vu1171.FoV.Position = Vector2.new(v1182.X, v1182.Y)
        vu1171.FoV.Radius = vu45.FoVRadius
        vu1171.FoV.Thickness = vu45.FoVThickness
        vu1171.FoV.Transparency = vu45.FoVOpacity
        vu1171.FoV.Filled = vu45.FoVFilled
        vu1171.FoV.Color = vu45.FoVColour
        vu1171.FoV.Visible = vu60
    end
    tick()
    local vu1183 = nil
    vu1183 = vu18[vu509.RenderingMode]:Connect(function()
        if vu62.Unloaded then
            vu62 = nil
            TrackingHandler:DisconnectAimbot()
            vu1183:Disconnect()
        elseif vu45.Aimbot or not vu54 then
            if vu45.TriggerBot or not vu59 then
                if vu45.FoV or not vu60 then
                    if not vu45.ESPBox and (not vu45.NameESP and (not vu45.HealthESP and (not vu45.MagnitudeESP and (not vu45.TracerESP and vu61)))) then
                        vu61 = false
                    end
                else
                    vu60 = false
                end
            else
                vu59 = false
            end
        else
            vu1130:ResetAimbotFields()
        end
        if vu52 then
            vu1166()
            vu1167()
            if not vu13 and (getfenv().Drawing and getfenv().Drawing.new) then
                vu1170:VisualizeFoV()
            end
            if vu54 then
                local v1184 = vu55
                local v1185 = math.huge
                if not vu1163(v1184) then
                    if v1184 and not vu45.OffAimbotAfterKill or not v1184 then
                        local v1186 = next
                        local v1187, v1188 = vu15:GetPlayers()
                        while true do
                            local v1189
                            v1188, v1189 = v1186(v1187, v1188)
                            if v1188 == nil then
                                break
                            end
                            local v1190, v1191, v1192, v1193 = vu1163(v1189.Character)
                            if v1190 and v1192[2] and (v1193 - vu46.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude <= vu45.MaxTrackingDistance then
                                local v1194 = (Vector2.new(vu47.X, vu47.Y) - Vector2.new(v1192[1].X, v1192[1].Y)).Magnitude
                                if v1194 <= v1185 then
                                    local v1195
                                    if vu45.FoVCheck then
                                        v1195 = vu45.FoVRadius or v1185
                                    else
                                        v1195 = v1185
                                    end
                                    if v1194 <= v1195 then
                                        vu55 = v1191
                                        v1185 = v1194
                                    end
                                end
                            end
                        end
                    else
                        vu1130:ResetAimbotFields()
                    end
                end
                local v1196, _, v1197, v1198 = vu1163(vu55)
                if v1196 then
                    if vu13 or (not getfenv().mousemoverel or (not vu48 or vu45.AimMode ~= "Mouse")) then
                        if vu45.AimMode == "Camera" then
                            vu17.MouseDeltaSensitivity = 0
                            if vu45.UseSensitivity then
                                vu56 = vu19:Create(workspace.CurrentCamera, TweenInfo.new(math.clamp(vu45.Sensitivity, 9, 99) / 100, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                                    CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, v1198)
                                })
                                vu56:Play()
                            else
                                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, v1198)
                            end
                        end
                    elseif v1197[2] then
                        vu1130:ResetAimbotFields(true, true)
                        local v1199 = vu17:GetMouseLocation()
                        local v1200 = vu45.UseSensitivity and vu45.Sensitivity / 5 or 10
                        getfenv().mousemoverel((v1197[1].X - v1199.X) / v1200, (v1197[1].Y - v1199.Y) / v1200)
                    else
                        vu1130:ResetAimbotFields(true)
                    end
                else
                    vu1130:ResetAimbotFields(true)
                end
            end
        end
    end)
    local v1201 = tick()
    local v1202 = 120
    local v1203 = 10
    if 0 % 4 == 0 then
        pcall(vu1167)
        if v1202 <= tick() - v1201 and v1203 <= gcinfo() then
            gcinfo()
            collectgarbage("collect")
        end
    end
    local vu1204
    if vu45.SilentAim then
        vu1204 = true
        getgenv().SilentAimEnabled = true
        if not vu4 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EndOverdosing/Soluna-API/refs/heads/main/rivals-modern/silent-aim.lua", true))()
            local _ = game:GetService("RunService").Heartbeat:Connect(function()
                getgenv().SilentAimEnabled = vu1204
            end)
        end
    else
        vu1204 = false
        getgenv().SilentAimEnabled = false
    end
    game:GetService("Players").PlayerRemoving:Connect(function(p1205)
        if p1205 == game:GetService("Players").LocalPlayer then
            pcall(function()
                if vu45 then
                    vu36:SaveAllSettings()
                end
            end)
            getgenv().DeflectingEnemies = {}
            if getgenv().currentDeflectSound then
                getgenv().currentDeflectSound:Stop()
                getgenv().currentDeflectSound:Destroy()
                getgenv().currentDeflectSound = nil
            end
            getgenv().isDeflectSoundPlaying = false
        end
    end)
    if vu45.AntiKatana and (isAllowedExecutor and isAllowedExecutor()) then
        pcall(function()
            local v1206 = game:GetService("Players")
            game:GetService("ReplicatedStorage")
            local v1207 = game:GetService("RunService")
            local vu1208 = nil
            local vu1209 = v1206.LocalPlayer
            local vu1210 = nil
            local vu1211 = nil
            local vu1212 = false
            getgenv().DeflectingEnemies = getgenv().DeflectingEnemies or {}
            local function vu1216(p1213)
                local v1214, v1215 = pcall(require, p1213)
                if v1214 then
                    return v1215
                end
                warn("Anti-Katana: Failed to require", p1213, "-", v1215)
                return nil
            end
            local function vu1218()
                if vu1210 then
                    return vu1210
                elseif vu1208 then
                    if type(vu1208) ~= "table" or type(vu1208.ReplicateFromServer) ~= "function" then
                        local v1217 = getmetatable(vu1208)
                        if v1217 and (v1217.__index and type(v1217.__index.ReplicateFromServer) == "function") then
                            vu1210 = v1217.__index
                            return vu1210
                        else
                            warn("Anti-Katana: Could not find ReplicateFromServer function in required Katana module or its metatable.")
                            return nil
                        end
                    else
                        vu1210 = vu1208
                        return vu1210
                    end
                else
                    return nil
                end
            end
            local function vu1226(p1219, p1220, ...)
                if p1219 and (p1219.ClientFighter and (p1219.Info and vu1211)) then
                    if p1219.Name == "Katana" and (not p1219.ClientFighter.IsLocalPlayer and p1220 == "StartAiming") then
                        local v1221 = p1219.ClientFighter
                        local v1222 = v1221.Player
                        local vu1223 = v1222 and v1222.UserId or v1221:Get("ObjectID")
                        if vu1223 then
                            local v1224 = p1219.Info.DeflectDuration or 1
                            local vu1225 = tick() + v1224 + 0.1
                            getgenv().DeflectingEnemies[vu1223] = vu1225
                            task.delay(v1224 + 0.15, function()
                                if getgenv().DeflectingEnemies and getgenv().DeflectingEnemies[vu1223] == vu1225 then
                                    getgenv().DeflectingEnemies[vu1223] = nil
                                end
                            end)
                        else
                            warn("Anti-Katana: Could not get enemy ID for deflecting Katana user.")
                        end
                        return vu1211(p1219, p1220, ...)
                    end
                    if p1219.Name ~= "Katana" or (p1219.ClientFighter.IsLocalPlayer or p1220 ~= "DeflectHit") then
                        return vu1211(p1219, p1220, ...)
                    end
                else
                    warn("Anti-Katana Hook: Invalid context or original function lost.")
                end
            end
            local function vu1228()
                if vu1212 then
                    return true
                end
                local v1227 = vu1218()
                if not v1227 then
                    return false
                end
                if vu1211 then
                    return false
                end
                if type(v1227.ReplicateFromServer) ~= "function" then
                    warn("Anti-Katana: Cannot hook! katanaClass.ReplicateFromServer is not a function, it is a", type(v1227.ReplicateFromServer))
                    return false
                end
                vu1211 = v1227.ReplicateFromServer
                if not vu1211 then
                    warn("Anti-Katana: FAILED TO STORE ORIGINAL FUNCTION (it\'s nil after assignment)!")
                    return false
                end
                v1227.ReplicateFromServer = vu1226
                vu1212 = true
                return true
            end
            local vu1229 = nil
            vu1229 = v1207.Stepped:Connect(function()
                if vu1212 then
                    vu1229:Disconnect()
                else
                    local v1230 = not vu1208 and vu1209:FindFirstChild("PlayerScripts")
                    if v1230 then
                        local v1231 = v1230:FindFirstChild("Modules")
                        if v1231 then
                            local v1232 = v1231:FindFirstChild("Items")
                            if v1232 then
                                local v1233 = v1232:FindFirstChild("Katana")
                                if v1233 then
                                    vu1208 = vu1216(v1233)
                                else
                                    warn("Anti-Katana: Katana script not found in PlayerScripts.Modules.Items.")
                                end
                            else
                                warn("Anti-Katana: Items folder not found in PlayerScripts.Modules.")
                            end
                        else
                            warn("Anti-Katana: Modules folder not found in PlayerScripts.")
                        end
                    end
                    if vu1208 then
                        vu1228()
                    end
                end
            end)
        end)
    end
    if vu45.InventoryViewer and (isAllowedExecutor and isAllowedExecutor()) then
        pcall(function()
            print("Setting up Billboard Inventory Display for auto-initialization...")
            local vu1234 = game:GetService("Players")
            local vu1235 = game:GetService("ReplicatedStorage")
            local v1236 = game:GetService("RunService")
            local vu1237 = getgenv().MaxDisplaySlots or 5
            local vu1238 = "InventoryBillboard"
            local vu1239 = UDim2.new(0, 50, 0, 50)
            local vu1240 = UDim.new(0, 6)
            local vu1241 = Color3.fromRGB(255, 255, 0)
            local vu1242 = 2
            local vu1243 = Color3.fromRGB(255, 255, 255)
            local vu1244 = 0.8
            local vu1245 = UDim.new(0.2, 0)
            local vu1246 = vu1234.LocalPlayer
            local function vu1250(p1247)
                local v1248, v1249 = pcall(require, p1247)
                if v1248 then
                    return v1249
                end
                warn("Billboard Display: Failed to require", p1247, "-", v1249)
                return nil
            end
            local function vu1264()
                local v1251 = nil
                local v1252 = math.huge
                local v1253 = vu1234.LocalPlayer.Character
                local v1254 = workspace.CurrentCamera
                if not (v1253 and v1253:FindFirstChild("HumanoidRootPart")) then
                    return nil
                end
                local _ = v1253.HumanoidRootPart
                local v1255, v1256, v1257 = vu1234:GetPlayers()
                while true do
                    local v1258
                    v1257, v1258 = v1255(v1256, v1257)
                    if v1257 == nil then
                        break
                    end
                    if v1258 ~= vu1234.LocalPlayer and v1258.Character and v1258.Character:FindFirstChild("HumanoidRootPart") then
                        local v1259 = v1258.Character
                        local v1260 = v1259:FindFirstChild("Head") or v1259:FindFirstChild("HumanoidRootPart")
                        if v1260 then
                            local v1261, v1262 = v1254:WorldToViewportPoint(v1260.Position)
                            if v1262 then
                                local v1263 = (Vector2.new(v1254.ViewportSize.X / 2, v1254.ViewportSize.Y / 2) - Vector2.new(v1261.X, v1261.Y)).Magnitude
                                if v1263 < v1252 then
                                    v1251 = v1259
                                    v1252 = v1263
                                end
                            end
                        end
                    end
                end
                return v1251
            end
            local vu1265 = nil or vu1250(vu1246.PlayerScripts.Controllers.FighterController)
            local vu1266 = nil or vu1250(vu1235.Modules.ItemLibrary)
            local vu1267 = {}
            local function vu1278(p1268)
                if not (p1268 and p1268:FindFirstChild("Head")) then
                    return nil
                end
                local v1269 = p1268.Head
                local v1270 = v1269:FindFirstChild(vu1238)
                if v1270 then
                    v1270.Enabled = true
                    return v1270
                end
                local v1271 = Instance.new("BillboardGui")
                v1271.Name = vu1238
                v1271.Adornee = v1269
                v1271.Size = UDim2.new(0, (vu1239.X.Offset + vu1240.Offset) * vu1237, 0, vu1239.Y.Offset + 10)
                v1271.StudsOffset = Vector3.new(0, 2.5, 0)
                v1271.AlwaysOnTop = true
                v1271.LightInfluence = 0
                v1271.ResetOnSpawn = false
                v1271.Enabled = true
                local v1272 = Instance.new("Frame")
                v1272.Name = "Container"
                v1272.Size = UDim2.new(1, 0, 1, 0)
                v1272.BackgroundTransparency = 1
                v1272.Parent = v1271
                local v1273 = Instance.new("UIListLayout")
                v1273.FillDirection = Enum.FillDirection.Horizontal
                v1273.HorizontalAlignment = Enum.HorizontalAlignment.Center
                v1273.VerticalAlignment = Enum.VerticalAlignment.Center
                v1273.SortOrder = Enum.SortOrder.LayoutOrder
                v1273.Padding = vu1240
                v1273.Parent = v1272
                for v1274 = 1, vu1237 do
                    local v1275 = Instance.new("ImageLabel")
                    v1275.Name = "Slot_" .. v1274
                    v1275.Size = vu1239
                    v1275.BackgroundColor3 = vu1243
                    v1275.BackgroundTransparency = vu1244
                    v1275.Image = ""
                    v1275.Visible = false
                    v1275.LayoutOrder = v1274
                    v1275.Parent = v1272
                    local v1276 = Instance.new("UICorner")
                    v1276.CornerRadius = vu1245
                    v1276.Parent = v1275
                    local v1277 = Instance.new("UIStroke")
                    v1277.Name = "Highlight"
                    v1277.Color = vu1241
                    v1277.Thickness = vu1242
                    v1277.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    v1277.Enabled = false
                    v1277.Parent = v1275
                end
                v1271.Parent = v1269
                vu1267[p1268] = v1271
                print("Created Billboard for", p1268.Name)
                return v1271
            end
            local function vu1283()
                print("Cleaning up inventory billboards...")
                local v1279, v1280, v1281 = pairs(vu1267)
                while true do
                    local v1282
                    v1281, v1282 = v1279(v1280, v1281)
                    if v1281 == nil then
                        break
                    end
                    if v1282 and v1282.Parent then
                        v1282:Destroy()
                    end
                end
                vu1267 = {}
            end
            local vu1284 = nil
            local vu1323 = v1236.Stepped:Connect(function()
                if vu45.InventoryViewer then
                    vu1266 = vu1266 and type(vu1266) == "table" or vu1250(vu1235.Modules.ItemLibrary)
                    if vu1266 then
                        vu1265 = vu1265 and type(vu1265) == "table" or vu1250(vu1246.PlayerScripts.Controllers.FighterController)
                        if vu1265 then
                            local v1285 = vu1264()
                            if v1285 ~= vu1284 then
                                if vu1284 and vu1267[vu1284] then
                                    vu1267[vu1284].Enabled = false
                                end
                                vu1284 = v1285
                                if not vu1284 then
                                    return
                                end
                            end
                            if vu1284 then
                                local v1286 = vu1234:GetPlayerFromCharacter(vu1284)
                                if v1286 then
                                    local v1287 = vu1265:GetFighter(v1286)
                                    if v1287 then
                                        local v1288 = vu1278(vu1284)
                                        if v1288 then
                                            local v1289 = v1288:FindFirstChild("Container")
                                            if v1289 then
                                                local v1290 = v1287.EquippedItem
                                                local v1291 = v1290 and v1290.Name or nil
                                                local v1292 = v1287.Loadout or v1287.Slots or (v1287.Items or v1287.EquippedItems)
                                                local v1293 = 0
                                                local v1294 = {}
                                                if type(v1292) == "table" then
                                                    local v1295 = {}
                                                    if table.find(getmetatable(v1292) or {}, "__len") ~= nil then
                                                        local v1296, v1297, v1298 = ipairs(v1292)
                                                        while true do
                                                            local v1299
                                                            v1298, v1299 = v1296(v1297, v1298)
                                                            if v1298 == nil then
                                                                break
                                                            end
                                                            table.insert(v1295, {
                                                                key = v1298,
                                                                value = v1299
                                                            })
                                                        end
                                                    else
                                                        local v1300, v1301, v1302 = pairs(v1292)
                                                        v1295 = {}
                                                        while true do
                                                            local v1303
                                                            v1302, v1303 = v1300(v1301, v1302)
                                                            if v1302 == nil then
                                                                break
                                                            end
                                                            table.insert(v1295, {
                                                                key = v1302,
                                                                value = v1303
                                                            })
                                                        end
                                                        table.sort(v1295, function(p1304, p1305)
                                                            if tonumber(p1304.key) and tonumber(p1305.key) then
                                                                return tonumber(p1304.key) < tonumber(p1305.key)
                                                            else
                                                                return tostring(p1304.key) < tostring(p1305.key)
                                                            end
                                                        end)
                                                    end
                                                    local v1306, v1307, v1308 = ipairs(v1295)
                                                    while true do
                                                        local v1309
                                                        v1308, v1309 = v1306(v1307, v1308)
                                                        if v1308 == nil or vu1237 <= v1293 then
                                                            break
                                                        end
                                                        local v1310 = v1309.value
                                                        local v1311 = nil
                                                        if type(v1310) ~= "string" then
                                                            if type(v1310) ~= "table" or not v1310.Name then
                                                                if v1310 and v1310:IsA("Tool") then
                                                                    v1311 = v1310.Name
                                                                end
                                                            else
                                                                v1311 = v1310.Name
                                                            end
                                                        else
                                                            v1311 = v1310
                                                        end
                                                        if v1311 and not v1294[v1311] then
                                                            v1294[v1311] = true
                                                            v1293 = v1293 + 1
                                                            local v1312 = v1289:FindFirstChild("Slot_" .. v1293)
                                                            local v1313
                                                            if v1312 then
                                                                v1313 = v1312:FindFirstChild("Highlight")
                                                            else
                                                                v1313 = v1312
                                                            end
                                                            if v1312 and v1313 then
                                                                local v1314 = "rbxassetid://0"
                                                                local v1315 = vu1266.ViewModels[v1311]
                                                                if v1315 and v1315.Image then
                                                                    v1314 = v1315.Image
                                                                else
                                                                    warn("Billboard Inventory: No ViewModel Image found for", v1311)
                                                                end
                                                                v1312.Image = v1314
                                                                v1312.Visible = true
                                                                v1313.Enabled = v1311 == v1291
                                                            end
                                                        end
                                                    end
                                                end
                                                for v1316 = v1293 + 1, vu1237 do
                                                    local v1317 = v1289:FindFirstChild("Slot_" .. v1316)
                                                    if v1317 then
                                                        v1317.Visible = false
                                                        local v1318 = v1317:FindFirstChild("Highlight")
                                                        if v1318 then
                                                            v1318.Enabled = false
                                                        end
                                                    end
                                                end
                                            end
                                        else
                                            return
                                        end
                                    else
                                        return
                                    end
                                else
                                    return
                                end
                            else
                                local v1319, v1320, v1321 = pairs(vu1267)
                                while true do
                                    local v1322
                                    v1321, v1322 = v1319(v1320, v1321)
                                    if v1321 == nil then
                                        break
                                    end
                                    if typeof(v1321) ~= "Instance" or not (v1321.Parent and v1322) then
                                        if not typeof(v1321) == "Instance" or not v1321.Parent then
                                            if v1322 then
                                                v1322:Destroy()
                                            end
                                            vu1267[v1321] = nil
                                        end
                                    else
                                        v1322.Enabled = false
                                    end
                                end
                                return
                            end
                        else
                            return
                        end
                    else
                        return
                    end
                else
                    inventoryUpdateConnection:Disconnect()
                    vu1283()
                    return
                end
            end)
            local vu1325 = vu1234.PlayerRemoving:Connect(function(p1324)
                if vu45.InventoryViewer then
                    if p1324.Character and vu1267[p1324.Character] then
                        vu1267[p1324.Character]:Destroy()
                        vu1267[p1324.Character] = nil
                    end
                else
                    playerRemovingConnection:Disconnect()
                end
            end)
            getgenv().cleanupInventoryViewer = function()
                if vu1323 and typeof(vu1323) == "RBXScriptConnection" then
                    vu1323:Disconnect()
                    vu1323 = nil
                end
                if vu1325 and typeof(vu1325) == "RBXScriptConnection" then
                    vu1325:Disconnect()
                    vu1325 = nil
                end
                pcall(function()
                    vu1283()
                end)
            end
            print("Billboard Inventory Display initialized successfully.")
        end)
    end
end