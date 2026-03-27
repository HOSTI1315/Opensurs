-- ts file was generated at discord.gg/25ms


if game.GameId == 4348829796 then
    Camera = workspace.CurrentCamera
    ReplicatedStorage = game:GetService("ReplicatedStorage")
    AdService = game:GetService("AdService")
    Players = game:GetService("Players")
    RunService = game:GetService("RunService")
    HttpService = game:GetService("HttpService")
    PathfindingService = game:GetService("PathfindingService")
    TeleportService = game:GetService("TeleportService")
    LocalPlayer = Players.LocalPlayer
    Backpack = LocalPlayer.Backpack
    Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    Mouse = LocalPlayer:GetMouse()
    WeaponRaycast = ReplicatedStorage.Modules.WeaponRaycast
    WallHacksEnabled = false
    KillAllEnabled = false
    LoopKillAllEnabled = false
    ESPEnabled = false
    AutoFireEnabled = false
    AutoFireMode = "Auto Shoot"
    AutoFarmEnabled = false
    DesiredRingType = "1v1"
    QueueStatus = "Idle"
    AntiAFKEnabled = false
    LastQueueAttemptTime = 0
    DetectionMode = "Both"
    AutoStabEnabled = false
    AutoStabRange = 7
    TriggerBotEnabled = false
    AimbotEnabled = false
    SilentAimEnabled = false
    SilentAimFOV = 100
    ShowFOVCircle = false
    TeamCheckEnabled = true
    ESPTeamCheckEnabled = true
    RainbowModeEnabled = false
    SpinBotEnabled = false
    HeadScaleEnabled = false
    HeadScaleSize = 5
    GunCooldownBypass = false
    KnifeWallHacksEnabled = false
    KnifeCooldownBypass = false
    KnifeHitboxEnabled = false
    KnifeHitboxSize = 10
    AimbotSmoothness = 1
    ESPShowHealth = true
    ESPShowName = true
    ESPShowDistance = true
    ESPShowBoxes = true
    ESPShowSkeleton = false
    ESPShowSnaplines = false
    ESPUpdateMode = "Heartbeat"
    FOVChanger = 70
    BhopEnabled = false
    TargetPart = "Head"
    WalkSpeedEnabled = false
    WalkSpeedValue = 16
    JumpPowerEnabled = false
    JumpPowerValue = 50
    RandomWalkEnabled = false
    RandomWalkJump = false
    RandomWalkZigZag = false
    local vu1 = false
    local vu2 = "Cross"
    local vu3 = Color3.fromRGB(255, 255, 255)
    local vu4 = 0
    local vu5 = 10
    local vu6 = 2
    local vu7 = Color3.fromRGB(75, 200, 130)
    local vu8 = Color3.fromRGB(255, 255, 255)
    local vu9 = Color3.fromRGB(255, 255, 255)
    local vu10 = Color3.fromRGB(255, 255, 255)
    local vu11 = 75
    local vu12 = 3.5
    local vu13 = false
    local vu14 = false
    local vu15 = "Random"
    local vu16 = 100
    local vu17 = false
    local vu18 = 1
    local vu19 = 0.1
    local vu20 = 5
    local vu21 = 0.5
    local vu22 = 70
    local vu23 = true
    local vu24 = false
    local vu25 = {}
    local vu26 = {}
    local vu27 = {}
    local vu28 = ""
    local vu29 = "IDLE"
    local vu30 = nil
    local vu31 = 0
    local vu32 = false
    local vu33 = "Zigzag"
    local vu34 = 200
    local vu35 = 20
    local vu36 = 0.1
    local vu37 = {}
    local vu38 = {}
    local vu39 = 0
    local vu40 = {}
    local vu41 = nil
    local vu42 = 0
    local vu43 = 0
    local vu44 = false
    local vu45 = false
    local vu46 = false
    local vu47 = true
    local vu48 = {
        7041001961,
        8148399956
    }
    local vu49 = {}
    local vu50 = false
    local vu51 = {}
    local vu52 = nil
    local vu53 = nil
    local vu54 = 16
    local vu55 = 50
    local vu56 = 0.5
    local vu57 = 0.05
    local vu58 = 0.3
    local vu59 = 2
    local vu60 = nil
    local vu61 = {
        KillAll = Enum.KeyCode.Unknown,
        AutoFire = Enum.KeyCode.Unknown,
        AutoStab = Enum.KeyCode.Unknown,
        WallHacks = Enum.KeyCode.Unknown,
        Aimbot = Enum.KeyCode.Unknown,
        SilentAim = Enum.KeyCode.Unknown,
        Triggerbot = Enum.KeyCode.Unknown,
        ESP = Enum.KeyCode.Unknown,
        AutoFarm = Enum.KeyCode.Unknown,
        AI = Enum.KeyCode.Unknown,
        PredictiveShooting = Enum.KeyCode.Unknown
    }
    local vu62 = {
        Background = Color3.fromRGB(15, 20, 18),
        Glow = Color3.fromRGB(0, 0, 0),
        Accent = Color3.fromRGB(25, 35, 30),
        LightContrast = Color3.fromRGB(30, 40, 35),
        DarkContrast = Color3.fromRGB(18, 25, 22),
        TextColor = Color3.fromRGB(220, 245, 235),
        AccentPink = Color3.fromRGB(255, 105, 135),
        AccentGreen = Color3.fromRGB(75, 200, 130)
    }
    local vu63 = "MSVD_Melon"
    local vu64 = vu63 .. "/AutoConfig.txt"
    local vu65 = "default"
    local vu66 = {}
    function getConfigList()
        if not isfolder(vu63) then
            makefolder(vu63)
        end
        local v67 = listfiles(vu63)
        local v68, v69, v70 = ipairs(v67)
        local v71 = {}
        while true do
            local v72
            v70, v72 = v68(v69, v70)
            if v70 == nil then
                break
            end
            if v72:match("%.json$") then
                local v73 = v72:match("([^/\\]+)%.json$")
                if v73 then
                    table.insert(v71, v73)
                end
            end
        end
        return v71
    end
    function saveConfig(p74, pu75)
        local v76 = p74 or vu65
        if not isfolder(vu63) then
            makefolder(vu63)
        end
        local vu77 = vu63 .. "/" .. v76 .. ".json"
        local v78, vu79 = pcall(function()
            return pu75:DumpIni(true)
        end)
        if not (v78 and vu79) then
            return false, nil
        end
        if not pcall(function()
            writefile(vu77, vu79)
        end) then
            return false, nil
        end
        vu65 = v76
        return true, v76
    end
    function loadConfig(p80, pu81)
        local v82 = p80 or vu65
        local vu83 = vu63 .. "/" .. v82 .. ".json"
        if not isfile(vu83) then
            return false
        end
        local v84, vu85 = pcall(function()
            return readfile(vu83)
        end)
        if not (v84 and vu85) then
            return false
        end
        if not pcall(function()
            pu81:LoadIni(vu85, true)
        end) then
            return false
        end
        vu65 = v82
        return true, v82
    end
    function deleteConfig(p86)
        if not p86 or p86 == "" then
            return false
        end
        local v87 = vu63 .. "/" .. p86 .. ".json"
        if not isfile(v87) then
            return false
        end
        delfile(v87)
        return true
    end
    function setAutoLoadConfig(p88)
        if not isfolder(vu63) then
            makefolder(vu63)
        end
        if not p88 or p88 == "" then
            if isfile(vu64) then
                delfile(vu64)
            end
            return false
        end
        writefile(vu64, p88)
        vu65 = p88
        return true
    end
    function getAutoLoadConfig()
        if isfile(vu64) then
            return readfile(vu64)
        else
            return nil
        end
    end
    function isAutoLoadSet()
        return isfile(vu64)
    end
    function disableBAC()
        local v89 = AdService:FindFirstChild("Advertisement")
        if v89 then
            v89:Destroy()
        end
    end
    function disableScript(p90)
        local v91 = Character:WaitForChild(p90, 5)
        if v91 then
            v91.Enabled = false
        end
    end
    function customGunController()
        local v92 = game:GetService("ReplicatedStorage")
        local vu93 = game:GetService("CollectionService")
        local vu94 = game:GetService("UserInputService")
        local vu95 = game:GetService("Players")
        local vu96 = game:GetService("Workspace")
        local vu97 = require(v92.Modules.CharacterRayOrigin)
        local vu98 = require(v92.Modules.BulletRenderer)
        local vu99 = require(v92.Modules.WeaponRaycast)
        local vu100 = require(v92.Modules.CollisionGroups)
        local v101 = require(v92.Modules.Util.Maid)
        local vu102 = require(v92.Modules.Tags)
        local vu103 = vu95.LocalPlayer
        local v104 = vu103
        local vu105 = vu103.GetMouse(v104)
        local vu106 = vu96.CurrentCamera
        local vu107 = vu103.Character
        local vu108 = v92.Remotes.ShootGun
        local vu109 = v101.new()
        local vu110 = nil
        local function vu124()
            local v111 = {}
            if not WallHacksEnabled then
                return v111
            end
            local v112 = vu96
            local v113, v114, v115 = ipairs(v112:GetDescendants())
            while true do
                local v116
                v115, v116 = v113(v114, v115)
                if v115 == nil then
                    return v111
                end
                if v116:IsA("BasePart") then
                    local v117 = vu95
                    local v118, v119, v120 = ipairs(v117:GetPlayers())
                    local v121 = false
                    while true do
                        local v122
                        v120, v122 = v118(v119, v120)
                        if v120 == nil then
                            break
                        end
                        local v123 = v122.Character
                        if v123 and (v122 ~= vu103 and v116:IsDescendantOf(v123)) then
                            v121 = true
                            break
                        end
                    end
                    if not v121 then
                        table.insert(v111, v116)
                    end
                end
            end
        end
        local function v147(pu125)
            if pu125:IsA("Tool") and vu93:HasTag(pu125, vu102.GUN_TOOL) then
                vu109:DoCleaning()
                vu109:GiveTask(pu125.AncestryChanged:Connect(function()
                    if not pu125:IsDescendantOf(vu107) then
                        vu109:DoCleaning()
                    end
                end))
                local vu126 = pu125:GetAttribute("Cooldown") or 0
                local function vu142(p127)
                    if pu125.Enabled then
                        if GunCooldownBypass or (not vu110 or vu126 <= tick() - vu110) then
                            local v128 = pu125:FindFirstChild("Muzzle", true)
                            if v128 then
                                vu110 = tick()
                                local v129 = p127 or vu105.Hit.Position + 100 * vu105.UnitRay.Direction
                                if SilentAimEnabled and not p127 then
                                    local v130 = getClosestPlayerToMouse()
                                    if v130 and v130.Character then
                                        local v131 = v130.Character:FindFirstChild("Head")
                                        if v131 then
                                            v129 = v131.Position
                                        end
                                    end
                                end
                                local v132 = RaycastParams.new()
                                v132.FilterType = Enum.RaycastFilterType.Blacklist
                                v132.CollisionGroup = vu100.SCREEN_RAYCAST
                                if WallHacksEnabled then
                                    v132.FilterDescendantsInstances = vu124()
                                end
                                local v133 = v129 - vu106.CFrame.Position
                                local v134 = vu96:Raycast(vu106.CFrame.Position, v133, v132)
                                local v135 = vu97(vu107)
                                local v136
                                if v134 then
                                    v136 = v134.Position or v129
                                else
                                    v136 = v129
                                end
                                if not WallHacksEnabled and v134 then
                                    v129 = v134.Position
                                end
                                local v137 = pu125
                                vu98(v128.WorldPosition, v136, v137:GetAttribute("BulletType"))
                                local v138 = pu125:FindFirstChild("Fire")
                                if v138 then
                                    v138:Play()
                                end
                                pu125:Activate()
                                local v139
                                if v134 then
                                    v139 = v134.Instance or nil
                                else
                                    v139 = nil
                                end
                                local v140 = vu108
                                local v141 = v140.FireServer
                                if v134 then
                                    v134 = v134.Position
                                end
                                v141(v140, v135, v129, v139, v134)
                            end
                        else
                            return
                        end
                    else
                        return
                    end
                end
                vu109:GiveTask(vu94.InputBegan:Connect(function(p143, p144)
                    if not p144 and (p143.UserInputType == Enum.UserInputType.MouseButton1 or p143.KeyCode == Enum.KeyCode.ButtonR2) then
                        vu142()
                    end
                end))
                vu109:GiveTask(vu94.TouchTapInWorld:Connect(function(p145, p146)
                    if not p146 then
                        vu142((vu99.convertScreenPointToVector3(p145, 2000)))
                    end
                end))
            end
        end
        vu107.ChildAdded:Connect(v147)
        local v148 = vu107
        local v149, v150, v151 = ipairs(vu107.GetChildren(v148))
        while true do
            local v152
            v151, v152 = v149(v150, v151)
            if v151 == nil then
                break
            end
            v147(v152)
        end
    end
    function customKnifeController()
        local v153 = game:GetService("ReplicatedStorage")
        local vu154 = game:GetService("CollectionService")
        local vu155 = game:GetService("UserInputService")
        local v156 = game:GetService("Players")
        local vu157 = game:GetService("Workspace")
        local vu158 = game:GetService("ContextActionService")
        local vu159 = require(v153.Modules.KnifeProjectileController)
        local vu160 = require(v153.Modules.CharacterRayOrigin)
        local vu161 = require(v153.Modules.WeaponRaycast)
        require(v153.Modules.CollisionGroups)
        local v162 = require(v153.Modules.Util.Maid)
        local vu163 = require(v153.Modules.Tags)
        local vu164 = require(v153.Modules.Hitbox)
        local v165 = v156.LocalPlayer
        local v166 = v165
        local vu167 = v165.GetMouse(v166)
        local _ = vu157.CurrentCamera
        local vu168 = v165.Character
        local vu169 = v153.Remotes.Stab
        local vu170 = v153.Remotes.ThrowHit
        local vu171 = v153.Remotes.ThrowStart
        local vu172 = v162.new()
        local vu173 = false
        local function vu181(p174, p175)
            if p174 then
                local v176 = p174:FindFirstChild("RightHandle")
                if v176 then
                    v176.LocalTransparencyModifier = p175
                    local v177, v178, v179 = ipairs(v176:GetDescendants())
                    while true do
                        local v180
                        v179, v180 = v177(v178, v179)
                        if v179 == nil then
                            break
                        end
                        if v180:IsA("BasePart") then
                            v180.LocalTransparencyModifier = p175
                        elseif v180:IsA("Trail") then
                            v180.Enabled = p175 < 1
                        end
                    end
                end
            else
                return
            end
        end
        local function vu182()
            return vu160(vu168)
        end
        local function vu198(p183, p184)
            local v185 = p183:FindFirstChild("RightHandle")
            if v185 then
                local v186 = vu182()
                if v186 then
                    local v187 = p184 or vu167.Hit.Position
                    if SilentAimEnabled and not p184 then
                        local v188 = getClosestPlayerToMouse()
                        if v188 and v188.Character then
                            local v189 = v188.Character:FindFirstChild(TargetPart) or v188.Character:FindFirstChild("Head")
                            if v189 then
                                v187 = v189.Position
                            end
                        end
                    end
                    local v190 = (v187 - v186).Unit
                    if KnifeWallHacksEnabled then
                        local v191 = RaycastParams.new()
                        v191.FilterType = Enum.RaycastFilterType.Blacklist
                        v191.FilterDescendantsInstances = {
                            vu168
                        }
                        local v192 = vu157:Raycast(v186, v190 * 1000, v191)
                        if v192 and v192.Instance then
                            local v193 = v192.Instance.Parent
                            if v193 and v193:FindFirstChild("Humanoid") then
                                local v194 = v193:FindFirstChild(TargetPart) or v193:FindFirstChild("Head")
                                if v194 then
                                    v186 = v194.Position
                                    v190 = (v187 - v186).Unit
                                end
                            end
                        end
                    end
                    vu171:FireServer(v186, v190)
                    local v195 = v185:Clone()
                    vu181(p183, 1)
                    vu159({
                        Speed = p183:GetAttribute("ThrowSpeed") or 100,
                        KnifeProjectile = v195,
                        Direction = v190,
                        Origin = v186
                    }, function(p196)
                        local v197
                        if p196 then
                            v197 = p196.Instance or nil
                        else
                            v197 = nil
                        end
                        vu170:FireServer(v197, p196 and p196.Position or nil)
                    end)
                    task.wait(0.1)
                    vu181(p183, 0)
                end
            else
                return
            end
        end
        local function vu207(pu199)
            local vu200 = {}
            local vu201 = KnifeHitboxEnabled and pu199:FindFirstChild("RightHandle")
            if vu201 then
                local vu202 = vu201.Size
                vu201.Size = Vector3.new(KnifeHitboxSize, KnifeHitboxSize, KnifeHitboxSize)
                vu201.Transparency = 0.8
                vu172:GiveTask(function()
                    if vu201 then
                        vu201.Size = vu202
                        vu201.Transparency = 0
                    end
                end)
            end
            local vu206 = vu164(pu199, function(p203)
                local v204 = p203.Instance.Parent
                local v205
                if v204 then
                    v205 = v204:FindFirstChild("Humanoid")
                else
                    v205 = v204
                end
                if v205 and not vu200[v204] then
                    vu200[v204] = true
                    vu169:FireServer(p203.Instance)
                end
            end)
            vu172:GiveTask(pu199:GetAttributeChangedSignal("IsActivated"):Connect(function()
                if pu199:GetAttribute("IsActivated") then
                    vu206.Activate()
                else
                    vu200 = {}
                    vu206.Deactivate()
                end
            end))
            vu172:GiveTask(function()
                vu206.Deactivate()
            end)
        end
        local function v217(pu208)
            if pu208:IsA("Tool") and vu154:HasTag(pu208, vu163.KNIFE_TOOL) then
                vu172:DoCleaning()
                vu172:GiveTask(pu208.AncestryChanged:Connect(function()
                    if not pu208:IsDescendantOf(vu168) then
                        vu172:DoCleaning()
                    end
                end))
                local vu209 = pu208:GetAttribute("Cooldown") or 0.5
                local vu210 = 0
                pu208.ManualActivationOnly = vu173
                vu207(pu208)
                vu158:BindAction("Throw", function(p211, p212)
                    if p211 == "Throw" and p212 == Enum.UserInputState.Begin then
                        local v213 = tick()
                        if KnifeCooldownBypass and true or (vu209 <= v213 - vu210 and true or false) then
                            vu210 = v213
                            vu198(pu208, nil)
                        end
                    end
                end, false, Enum.KeyCode.E, Enum.KeyCode.ButtonL2)
                vu172:GiveTask(function()
                    vu158:UnbindAction("Throw")
                end)
                vu172:GiveTask(vu155.TouchTapInWorld:Connect(function(p214, p215)
                    if vu173 and not p215 then
                        local v216 = tick()
                        if KnifeCooldownBypass and true or (vu209 <= v216 - vu210 and true or false) then
                            vu210 = v216
                            vu198(pu208, (vu161.convertScreenPointToVector3(p214, 2000)))
                        end
                    end
                end))
            end
        end
        vu168.ChildAdded:Connect(v217)
        local v218 = vu168
        local v219, v220, v221 = ipairs(vu168.GetChildren(v218))
        while true do
            local v222
            v221, v222 = v219(v220, v221)
            if v221 == nil then
                break
            end
            v217(v222)
        end
    end
    local function vu225(p223)
        if p223 then
            local v224 = p223:FindFirstChild("HumanoidRootPart")
            if v224 then
                return (v224.CFrame * CFrame.new(0, 0, v224.Size.Z / 2)).Position
            end
        end
    end
    function getEquippedWeapon()
        return Character:FindFirstChildOfClass("Tool")
    end
    local function vu234(p226)
        local v227 = getEquippedWeapon()
        if v227 then
            v227.Parent = Backpack
        end
        local v228, v229, v230 = ipairs(Backpack:GetChildren())
        while true do
            local v231
            v230, v231 = v228(v229, v230)
            if v230 == nil then
                break
            end
            if v231:IsA("Tool") then
                local v232 = v231:FindFirstChild("Fire", true)
                local v233 = v231:FindFirstChild("ThrowSound", true)
                if p226 == "Gun" and v232 or p226 == "Knife" and v233 then
                    v231.Parent = Character
                    return v231
                end
            end
        end
    end
    function shootGun(p235, p236)
        if p235 then
            if p235:IsA("Player") then
                p235 = p235.Character
            end
            if p235 then
                local v237 = p235:FindFirstChild(TargetPart) or p235:FindFirstChild("Head")
                if v237 then
                    local v238 = v237.Position
                    if p236 then
                        local v239 = (math.random() * 2 - 1) * vu12
                        local v240 = (math.random() * 2 - 1) * vu12
                        local v241 = (math.random() * 2 - 1) * vu12
                        v238 = v238 + Vector3.new(v239, v240, v241)
                    end
                    local v242
                    if WallHacksEnabled then
                        v242 = v238
                    else
                        local v243 = RaycastParams.new()
                        v243.FilterType = Enum.RaycastFilterType.Blacklist
                        v243.FilterDescendantsInstances = {
                            Character,
                            p235
                        }
                        local v244 = v238 - Camera.CFrame.Position
                        local v245 = workspace:Raycast(Camera.CFrame.Position, v244, v243)
                        if v245 then
                            v242 = v245.Position
                        else
                            v242 = v238
                        end
                    end
                    local v246 = getEquippedWeapon()
                    if v246 and v246:FindFirstChild("Fire", true) then
                        local v247 = v246:FindFirstChild("Fire")
                        if v247 then
                            v247:Play()
                        end
                        local v248 = v246:FindFirstChild("Muzzle", true)
                        if v248 then
                            require(ReplicatedStorage.Modules.BulletRenderer)(v248.WorldPosition, v242, v246:GetAttribute("BulletType"))
                        end
                        v246:Activate()
                    end
                    local v249 = {
                        vu225(Character),
                        WallHacksEnabled and v238 and v238 or v242,
                        v237,
                        v242
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ShootGun"):FireServer(unpack(v249))
                end
            else
                return
            end
        else
            return
        end
    end
    function stabKnife(p250)
        local v251 = p250:FindFirstChild(TargetPart) or p250:FindFirstChild("Head")
        if v251 then
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Stab"):FireServer(unpack({
                v251
            }))
        end
    end
    function isOnSameTeam(p252)
        if TeamCheckEnabled then
            if p252 and LocalPlayer then
                if p252.Team and LocalPlayer.Team then
                    return p252.Team == LocalPlayer.Team
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
    function isPlayerInView(p253)
        if not p253.Character then
            return false
        end
        if not (Character and Character:FindFirstChild("Head")) then
            return false
        end
        local v254 = p253.Character:FindFirstChild("Head")
        if not v254 then
            return false
        end
        local v255 = Character.Head
        if DetectionMode == "Camera" or DetectionMode == "Both" then
            local _, v256 = Camera:WorldToScreenPoint(v254.Position)
            if v256 then
                local v257 = Camera.CFrame.Position
                local v258 = v254.Position - v257
                local v259 = RaycastParams.new()
                v259.FilterType = Enum.RaycastFilterType.Blacklist
                v259.FilterDescendantsInstances = {
                    Character,
                    p253.Character
                }
                if not workspace:Raycast(v257, v258, v259) then
                    return true
                end
            end
        end
        if DetectionMode == "Raycast" or DetectionMode == "Both" then
            local v260 = v255.Position
            local v261 = v254.Position - v260
            local v262 = RaycastParams.new()
            v262.FilterType = Enum.RaycastFilterType.Blacklist
            v262.FilterDescendantsInstances = {
                Character,
                p253.Character
            }
            if not workspace:Raycast(v260, v261, v262) then
                return true
            end
        end
        return false
    end
    function getAllPlayers()
        local v263, v264, v265 = ipairs(Players:GetPlayers())
        local v266 = {}
        while true do
            local v267
            v265, v267 = v263(v264, v265)
            if v265 == nil then
                break
            end
            if v267 ~= LocalPlayer and (v267.Character and not isOnSameTeam(v267)) then
                local v268 = v267.Character:FindFirstChildOfClass("Humanoid")
                if v268 and v268.Health > 0 then
                    table.insert(v266, v267)
                end
            end
        end
        return v266
    end
    function getClosestPlayerToMouse()
        local v269 = SilentAimFOV
        local v270 = Vector2.new(Mouse.X, Mouse.Y)
        local v271, v272, v273 = ipairs(Players:GetPlayers())
        local v274 = nil
        while true do
            local v275
            v273, v275 = v271(v272, v273)
            if v273 == nil then
                break
            end
            if v275 ~= LocalPlayer and (v275.Character and not isOnSameTeam(v275)) then
                local v276 = v275.Character:FindFirstChildOfClass("Humanoid")
                local v277 = v275.Character:FindFirstChild("Head")
                if v276 and (v276.Health > 0 and v277) then
                    local v278, v279 = Camera:WorldToScreenPoint(v277.Position)
                    if v279 then
                        local v280 = (v270 - Vector2.new(v278.X, v278.Y)).Magnitude
                        if v280 < v269 then
                            v274 = v275
                            v269 = v280
                        end
                    end
                end
            end
        end
        return v274
    end
    function getClosestPlayerToCenter()
        local v281 = math.huge
        local v282 = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        local v283, v284, v285 = ipairs(Players:GetPlayers())
        local v286 = nil
        while true do
            local v287
            v285, v287 = v283(v284, v285)
            if v285 == nil then
                break
            end
            if v287 ~= LocalPlayer and (v287.Character and not isOnSameTeam(v287)) then
                local v288 = v287.Character:FindFirstChildOfClass("Humanoid")
                local v289 = v287.Character:FindFirstChild("Head")
                if v288 and (v288.Health > 0 and v289) then
                    local v290, v291 = Camera:WorldToScreenPoint(v289.Position)
                    if v291 then
                        local v292 = (v282 - Vector2.new(v290.X, v290.Y)).Magnitude
                        if v292 < v281 then
                            v286 = v287
                            v281 = v292
                        end
                    end
                end
            end
        end
        return v286
    end
    function getClosestPlayerInRange()
        local v293 = nil
        local v294 = AutoStabRange
        if not (Character and Character:FindFirstChild("HumanoidRootPart")) then
            return nil
        end
        local v295, v296, v297 = ipairs(Players:GetPlayers())
        while true do
            local v298
            v297, v298 = v295(v296, v297)
            if v297 == nil then
                break
            end
            if v298 ~= LocalPlayer and (v298.Character and not isOnSameTeam(v298)) then
                local v299 = v298.Character:FindFirstChildOfClass("Humanoid")
                local v300 = v298.Character:FindFirstChild("HumanoidRootPart")
                if v299 and (v299.Health > 0 and v300) then
                    local v301 = (v300.Position - Character.HumanoidRootPart.Position).Magnitude
                    if v301 < v294 then
                        v293 = v298
                        v294 = v301
                    end
                end
            end
        end
        return v293
    end
    function killAll()
        local v302, v303, v304 = ipairs(Players:GetPlayers())
        while true do
            local v305
            v304, v305 = v302(v303, v304)
            if v304 == nil then
                break
            end
            if v305 ~= LocalPlayer and v305.Character and (v305.Character:IsDescendantOf(workspace) and not isOnSameTeam(v305)) then
                local v306 = v305.Character:FindFirstChildOfClass("Humanoid")
                if v306 and (v306.Health > 0 and vu234("Gun")) then
                    task.wait(0.1)
                    shootGun(v305.Character)
                end
            end
        end
    end
    function createESP(p307)
        if p307.Character then
            if vu51[p307] then
                removeESP(p307)
            end
            local v308 = {
                player = p307,
                drawings = {}
            }
            for _ = 1, 4 do
                local v309 = Drawing.new("Line")
                v309.Thickness = 2
                v309.Color = vu7
                v309.Transparency = 1
                v309.Visible = false
                table.insert(v308.drawings, v309)
            end
            for _ = 1, 14 do
                local v310 = Drawing.new("Line")
                v310.Thickness = 1
                v310.Color = vu8
                v310.Transparency = 1
                v310.Visible = false
                table.insert(v308.drawings, v310)
            end
            local v311 = Drawing.new("Line")
            v311.Thickness = 1
            v311.Color = vu9
            v311.Transparency = 1
            v311.Visible = false
            table.insert(v308.drawings, v311)
            v308.snapline = v311
            local v312 = Drawing.new("Text")
            v312.Text = p307.Name
            v312.Size = 16
            v312.Color = vu10
            v312.Transparency = 1
            v312.Center = true
            v312.Outline = true
            v312.OutlineColor = Color3.new(0, 0, 0)
            v312.Visible = false
            v312.Font = 2
            table.insert(v308.drawings, v312)
            v308.nameText = v312
            local v313 = Drawing.new("Text")
            v313.Text = "100 HP"
            v313.Size = 14
            v313.Color = Color3.fromRGB(0, 255, 0)
            v313.Transparency = 1
            v313.Center = true
            v313.Outline = true
            v313.OutlineColor = Color3.new(0, 0, 0)
            v313.Visible = false
            v313.Font = 2
            table.insert(v308.drawings, v313)
            v308.healthText = v313
            local v314 = Drawing.new("Text")
            v314.Text = "0m"
            v314.Size = 14
            v314.Color = vu10
            v314.Transparency = 1
            v314.Center = true
            v314.Outline = true
            v314.OutlineColor = Color3.new(0, 0, 0)
            v314.Visible = false
            v314.Font = 2
            table.insert(v308.drawings, v314)
            v308.distanceText = v314
            vu51[p307] = v308
        end
    end
    function removeESP(p315)
        if vu51[p315] then
            local v316 = vu51[p315]
            local v317, v318, v319 = ipairs(v316.drawings)
            while true do
                local v320
                v319, v320 = v317(v318, v319)
                if v319 == nil then
                    break
                end
                v320:Remove()
            end
            vu51[p315] = nil
        end
    end
    function updateESP()
        if ESPEnabled then
            local v321, v322, v323 = pairs(vu51)
            while true do
                local v324
                v323, v324 = v321(v322, v323)
                if v323 == nil then
                    break
                end
                if not (v323 and v323.Character and v323.Character:IsDescendantOf(workspace)) then
                    removeESP(v323)
                end
            end
            local v325, v326, v327 = ipairs(Players:GetPlayers())
            while true do
                local v328
                v327, v328 = v325(v326, v327)
                if v327 == nil then
                    break
                end
                if v328 ~= LocalPlayer and v328.Character and v328.Character:IsDescendantOf(workspace) then
                    if ESPTeamCheckEnabled and isOnSameTeam(v328) then
                        if vu51[v328] then
                            removeESP(v328)
                        end
                    elseif not vu51[v328] then
                        createESP(v328)
                    end
                end
            end
            local v329, v330, v331 = pairs(vu51)
            while true do
                local v332
                v331, v332 = v329(v330, v331)
                if v331 == nil then
                    break
                end
                local vu333 = false
                local function v334()
                    vu333 = true
                end
                if v331 and v331.Character and v331.Character:FindFirstChild("HumanoidRootPart") then
                    local v335 = v331.Character
                    local v336 = v335.HumanoidRootPart
                    local v337 = v335:FindFirstChild("Head")
                    local v338 = v335:FindFirstChildOfClass("Humanoid")
                    if v337 and (v338 and v338.Health > 0) then
                        local v339 = not (Character and Character:FindFirstChild("HumanoidRootPart")) and 0 or (v336.Position - Character.HumanoidRootPart.Position).Magnitude
                        if ESPShowBoxes then
                            local v340 = v337.Position + Vector3.new(0, v337.Size.Y / 2, 0)
                            local v341 = v336.Position - Vector3.new(0, 3, 0)
                            local v342, v343 = Camera:WorldToViewportPoint(v340)
                            local v344, v345 = Camera:WorldToViewportPoint(v341)
                            if v343 or v345 then
                                local v346 = math.abs(v342.Y - v344.Y) / 2
                                local v347 = Vector2.new(v342.X - v346 / 2, v342.Y)
                                local v348 = Vector2.new(v342.X + v346 / 2, v342.Y)
                                local v349 = Vector2.new(v344.X - v346 / 2, v344.Y)
                                local v350 = Vector2.new(v344.X + v346 / 2, v344.Y)
                                v332.drawings[1].From = v347
                                v332.drawings[1].To = v348
                                v332.drawings[1].Visible = true
                                v332.drawings[1].Color = RainbowModeEnabled and Color3.fromHSV(tick() % 5 / 5, 1, 1) or vu7
                                v332.drawings[2].From = v348
                                v332.drawings[2].To = v350
                                v332.drawings[2].Visible = true
                                v332.drawings[2].Color = RainbowModeEnabled and Color3.fromHSV(tick() % 5 / 5, 1, 1) or vu7
                                v332.drawings[3].From = v350
                                v332.drawings[3].To = v349
                                v332.drawings[3].Visible = true
                                v332.drawings[3].Color = RainbowModeEnabled and Color3.fromHSV(tick() % 5 / 5, 1, 1) or vu7
                                v332.drawings[4].From = v349
                                v332.drawings[4].To = v347
                                v332.drawings[4].Visible = true
                                v332.drawings[4].Color = RainbowModeEnabled and Color3.fromHSV(tick() % 5 / 5, 1, 1) or vu7
                            else
                                for v351 = 1, 4 do
                                    v332.drawings[v351].Visible = false
                                end
                            end
                        else
                            for v352 = 1, 4 do
                                v332.drawings[v352].Visible = false
                            end
                        end
                        if ESPShowSkeleton then
                            local v353 = ESPShowBoxes and 5 or 1
                            local v354, v355, v356 = ipairs({
                                {
                                    "Head",
                                    "UpperTorso"
                                },
                                {
                                    "UpperTorso",
                                    "LowerTorso"
                                },
                                {
                                    "UpperTorso",
                                    "LeftUpperArm"
                                },
                                {
                                    "LeftUpperArm",
                                    "LeftLowerArm"
                                },
                                {
                                    "LeftLowerArm",
                                    "LeftHand"
                                },
                                {
                                    "UpperTorso",
                                    "RightUpperArm"
                                },
                                {
                                    "RightUpperArm",
                                    "RightLowerArm"
                                },
                                {
                                    "RightLowerArm",
                                    "RightHand"
                                },
                                {
                                    "LowerTorso",
                                    "LeftUpperLeg"
                                },
                                {
                                    "LeftUpperLeg",
                                    "LeftLowerLeg"
                                },
                                {
                                    "LeftLowerLeg",
                                    "LeftFoot"
                                },
                                {
                                    "LowerTorso",
                                    "RightUpperLeg"
                                },
                                {
                                    "RightUpperLeg",
                                    "RightLowerLeg"
                                },
                                {
                                    "RightLowerLeg",
                                    "RightFoot"
                                }
                            })
                            local v357 = 0
                            local v358 = {
                                {
                                    "Head",
                                    "Torso"
                                },
                                {
                                    "Torso",
                                    "Left Arm"
                                },
                                {
                                    "Torso",
                                    "Right Arm"
                                },
                                {
                                    "Torso",
                                    "Left Leg"
                                },
                                {
                                    "Torso",
                                    "Right Leg"
                                }
                            }
                            while true do
                                local v359
                                v356, v359 = v354(v355, v356)
                                if v356 == nil then
                                    break
                                end
                                if v356 > 14 then
                                    v334()
                                end
                                local v360 = v335:FindFirstChild(v359[1])
                                local v361 = v335:FindFirstChild(v359[2])
                                if v360 and v361 then
                                    local v362 = v353 + v357
                                    if v332.drawings[v362] then
                                        local v363, _ = Camera:WorldToViewportPoint(v360.Position)
                                        local v364, _ = Camera:WorldToViewportPoint(v361.Position)
                                        if v363.Z <= 0 or v364.Z <= 0 then
                                            v332.drawings[v362].Visible = false
                                        else
                                            v332.drawings[v362].From = Vector2.new(v363.X, v363.Y)
                                            v332.drawings[v362].To = Vector2.new(v364.X, v364.Y)
                                            v332.drawings[v362].Visible = true
                                            v332.drawings[v362].Color = RainbowModeEnabled and Color3.fromHSV(tick() % 5 / 5, 1, 1) or vu8
                                        end
                                    end
                                    v357 = v357 + 1
                                end
                            end
                            if v357 == 0 then
                                local v365, v366, v367 = ipairs(v358)
                                while true do
                                    local v368
                                    v367, v368 = v365(v366, v367)
                                    if v367 == nil then
                                        break
                                    end
                                    if v367 > 14 then
                                        v334()
                                    end
                                    local v369 = v335:FindFirstChild(v368[1])
                                    local v370 = v335:FindFirstChild(v368[2])
                                    if v369 and v370 then
                                        local v371 = v353 + v357
                                        if v332.drawings[v371] then
                                            local v372, _ = Camera:WorldToViewportPoint(v369.Position)
                                            local v373, _ = Camera:WorldToViewportPoint(v370.Position)
                                            if v372.Z <= 0 or v373.Z <= 0 then
                                                v332.drawings[v371].Visible = false
                                            else
                                                v332.drawings[v371].From = Vector2.new(v372.X, v372.Y)
                                                v332.drawings[v371].To = Vector2.new(v373.X, v373.Y)
                                                v332.drawings[v371].Visible = true
                                                v332.drawings[v371].Color = RainbowModeEnabled and Color3.fromHSV(tick() % 5 / 5, 1, 1) or vu8
                                            end
                                        end
                                        v357 = v357 + 1
                                    end
                                end
                            end
                            for v374 = v357, 13 do
                                local v375 = v353 + v374
                                if v332.drawings[v375] then
                                    v332.drawings[v375].Visible = false
                                end
                            end
                        else
                            local v376 = 5
                            for v377 = 0, 13 do
                                local v378 = v376 + v377
                                if v332.drawings[v378] then
                                    v332.drawings[v378].Visible = false
                                end
                            end
                        end
                        local v379 = v337.Position + Vector3.new(0, v337.Size.Y / 2 + 0.5, 0)
                        local v380, v381 = Camera:WorldToViewportPoint(v379)
                        if v381 then
                            local v382 = 0
                            if v332.nameText then
                                if ESPShowName then
                                    v332.nameText.Position = Vector2.new(v380.X, v380.Y + v382)
                                    v332.nameText.Visible = true
                                    v332.nameText.Color = RainbowModeEnabled and Color3.fromHSV(tick() % 5 / 5, 1, 1) or vu10
                                    v382 = v382 + 18
                                else
                                    v332.nameText.Visible = false
                                end
                            end
                            if v332.healthText and v338 then
                                if ESPShowHealth then
                                    local v383 = math.floor(v338.Health)
                                    local v384 = math.floor(v338.MaxHealth)
                                    v332.healthText.Text = v383 .. " HP"
                                    local v385 = v383 / v384
                                    if v385 > 0.6 then
                                        v332.healthText.Color = Color3.fromRGB(0, 255, 0)
                                    elseif v385 > 0.3 then
                                        v332.healthText.Color = Color3.fromRGB(255, 255, 0)
                                    else
                                        v332.healthText.Color = Color3.fromRGB(255, 0, 0)
                                    end
                                    v332.healthText.Position = Vector2.new(v380.X, v380.Y + v382)
                                    v332.healthText.Visible = true
                                    v382 = v382 + 16
                                else
                                    v332.healthText.Visible = false
                                end
                            end
                            if v332.distanceText then
                                if ESPShowDistance then
                                    v332.distanceText.Text = math.floor(v339) .. "m"
                                    v332.distanceText.Position = Vector2.new(v380.X, v380.Y + v382)
                                    v332.distanceText.Visible = true
                                    v332.distanceText.Color = RainbowModeEnabled and Color3.fromHSV(tick() % 5 / 5, 1, 1) or vu10
                                else
                                    v332.distanceText.Visible = false
                                end
                            end
                        else
                            if v332.nameText then
                                v332.nameText.Visible = false
                            end
                            if v332.healthText then
                                v332.healthText.Visible = false
                            end
                            if v332.distanceText then
                                v332.distanceText.Visible = false
                            end
                        end
                        if v332.snapline then
                            if ESPShowSnaplines then
                                local v386, v387 = Camera:WorldToViewportPoint(v336.Position)
                                if v387 and v386.Z > 0 then
                                    local v388 = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                                    v332.snapline.From = v388
                                    v332.snapline.To = Vector2.new(v386.X, v386.Y)
                                    v332.snapline.Visible = true
                                    v332.snapline.Color = RainbowModeEnabled and Color3.fromHSV(tick() % 5 / 5, 1, 1) or vu9
                                else
                                    v332.snapline.Visible = false
                                end
                            else
                                v332.snapline.Visible = false
                            end
                        end
                    else
                        local v389, v390, v391 = ipairs(v332.drawings)
                        while true do
                            local v392
                            v391, v392 = v389(v390, v391)
                            if v391 == nil then
                                break
                            end
                            v392.Visible = false
                        end
                    end
                else
                    removeESP(v331)
                end
                if vu333 then
                    break
                end
            end
        else
            local v393, v394, v395 = pairs(vu51)
            while true do
                local v396
                v395, v396 = v393(v394, v395)
                if v395 == nil then
                    break
                end
                removeESP(v395)
            end
        end
    end
    function createCrosshair()
        local v397 = game:GetService("CoreGui")
        if vu53 then
            vu53:Destroy()
        end
        local v398 = Instance.new("ScreenGui")
        v398.Name = "CustomCrosshair"
        v398.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        v398.Parent = v397
        local v399 = Instance.new("Frame")
        v399.Name = "CrosshairContainer"
        v399.AnchorPoint = Vector2.new(0.5, 0.5)
        v399.Position = UDim2.new(0.5, 0, 0.5, 0)
        v399.Size = UDim2.new(0, vu5 * 4, 0, vu5 * 4)
        v399.BackgroundTransparency = 1
        v399.Parent = v398
        if vu2 ~= "Cross" then
            if vu2 ~= "Dot" then
                if vu2 == "Circle" then
                    local v400 = Instance.new("Frame")
                    v400.Name = "Circle"
                    v400.AnchorPoint = Vector2.new(0.5, 0.5)
                    v400.Position = UDim2.new(0.5, 0, 0.5, 0)
                    v400.Size = UDim2.new(0, vu5 * 2, 0, vu5 * 2)
                    v400.BackgroundTransparency = 1
                    v400.Parent = v399
                    local v401 = Instance.new("UICorner")
                    v401.CornerRadius = UDim.new(1, 0)
                    v401.Parent = v400
                    local v402 = Instance.new("UIStroke")
                    v402.Color = vu3
                    v402.Thickness = vu6
                    v402.Transparency = vu4
                    v402.Parent = v400
                end
            else
                local v403 = Instance.new("Frame")
                v403.Name = "Dot"
                v403.AnchorPoint = Vector2.new(0.5, 0.5)
                v403.Position = UDim2.new(0.5, 0, 0.5, 0)
                v403.Size = UDim2.new(0, vu5, 0, vu5)
                v403.BackgroundColor3 = vu3
                v403.BackgroundTransparency = vu4
                v403.Parent = v399
                local v404 = Instance.new("UICorner")
                v404.CornerRadius = UDim.new(1, 0)
                v404.Parent = v403
            end
        else
            local v405 = Instance.new("Frame")
            v405.Name = "Vertical"
            v405.AnchorPoint = Vector2.new(0.5, 0.5)
            v405.Position = UDim2.new(0.5, 0, 0.5, 0)
            v405.Size = UDim2.new(0, vu6, 0, vu5)
            v405.BackgroundColor3 = vu3
            v405.BackgroundTransparency = vu4
            v405.BorderSizePixel = 0
            v405.Parent = v399
            local v406 = Instance.new("Frame")
            v406.Name = "Horizontal"
            v406.AnchorPoint = Vector2.new(0.5, 0.5)
            v406.Position = UDim2.new(0.5, 0, 0.5, 0)
            v406.Size = UDim2.new(0, vu5, 0, vu6)
            v406.BackgroundColor3 = vu3
            v406.BackgroundTransparency = vu4
            v406.BorderSizePixel = 0
            v406.Parent = v399
        end
        vu53 = v398
    end
    function updateCrosshair()
        if vu1 then
            if vu53 then
                createCrosshair()
            else
                createCrosshair()
            end
        elseif vu53 then
            vu53:Destroy()
            vu53 = nil
        end
    end
    function createFOVCircle()
        local v407 = LocalPlayer:WaitForChild("PlayerGui")
        if vu52 then
            vu52:Destroy()
        end
        local v408 = Instance.new("ScreenGui")
        v408.Name = "FOVCircle"
        v408.ResetOnSpawn = false
        v408.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        local v409 = Instance.new("Frame")
        v409.Name = "Circle"
        v409.AnchorPoint = Vector2.new(0.5, 0.5)
        v409.Position = UDim2.new(0.5, 0, 0.5, 0)
        v409.Size = UDim2.new(0, SilentAimFOV * 2, 0, SilentAimFOV * 2)
        v409.BackgroundTransparency = 1
        v409.BorderSizePixel = 0
        v409.Parent = v408
        local v410 = Instance.new("UICorner")
        v410.CornerRadius = UDim.new(1, 0)
        v410.Parent = v409
        local v411 = Instance.new("UIStroke")
        v411.Color = vu62.AccentGreen
        v411.Thickness = 2
        v411.Transparency = 0.3
        v411.Parent = v409
        v408.Parent = v407
        vu52 = v408
    end
    function updateFOVCircle()
        if ShowFOVCircle then
            if vu52 then
                local v412 = vu52:FindFirstChild("Circle")
                if v412 then
                    v412.Size = UDim2.new(0, SilentAimFOV * 2, 0, SilentAimFOV * 2)
                end
            else
                createFOVCircle()
            end
        elseif vu52 then
            vu52:Destroy()
            vu52 = nil
        end
    end
    local vu413 = nil
    local vu414 = 0
    function startKillAll()
        if not vu413 then
            vu413 = RunService.Heartbeat:Connect(function()
                if not KillAllEnabled then
                    return
                end
                local v415 = tick()
                if v415 - vu414 < vu57 then
                    return
                end
                local v416 = getAllPlayers()
                local v417, v418, v419 = ipairs(v416)
                while true do
                    local v420
                    v419, v420 = v417(v418, v419)
                    if v419 == nil then
                        break
                    end
                    if v420 and v420.Character and v420.Character:IsDescendantOf(workspace) then
                        local v421 = v420.Character:FindFirstChildOfClass("Humanoid")
                        if v421 and v421.Health > 0 then
                            local v422 = getEquippedWeapon()
                            local v423
                            if v422 then
                                v423 = v422:FindFirstChild("Fire", true)
                            else
                                v423 = v422
                            end
                            if v422 then
                                v422 = v422:FindFirstChild("ThrowSound", true)
                            end
                            if v423 then
                                shootGun(v420.Character)
                            elseif v422 then
                                stabKnife(v420.Character)
                            elseif vu234("Gun") or vu234("Knife") then
                                task.wait(0.1)
                            end
                            vu414 = v415
                            break
                        end
                    end
                end
            end)
        end
    end
    function stopKillAll()
        if vu413 then
            vu413:Disconnect()
            vu413 = nil
        end
    end
    local vu424 = nil
    local vu425 = 0
    function startLoopKillAll()
        if not vu424 then
            vu424 = RunService.Heartbeat:Connect(function()
                if not LoopKillAllEnabled then
                    return
                end
                local v426 = tick()
                if v426 - vu425 < 0.01 then
                    return
                end
                local v427 = getAllPlayers()
                local v428, v429, v430 = ipairs(v427)
                while true do
                    local v431
                    v430, v431 = v428(v429, v430)
                    if v430 == nil then
                        break
                    end
                    if v431 and v431.Character and v431.Character:IsDescendantOf(workspace) then
                        local v432 = v431.Character:FindFirstChildOfClass("Humanoid")
                        if v432 and v432.Health > 0 then
                            local v433 = getEquippedWeapon()
                            local v434
                            if v433 then
                                v434 = v433:FindFirstChild("Fire", true)
                            else
                                v434 = v433
                            end
                            if v433 then
                                v433 = v433:FindFirstChild("ThrowSound", true)
                            end
                            if v434 then
                                shootGun(v431.Character)
                            elseif v433 then
                                stabKnife(v431.Character)
                            elseif vu234("Gun") or vu234("Knife") then
                                task.wait(0.05)
                            end
                            vu425 = v426
                            break
                        end
                    end
                end
            end)
        end
    end
    function stopLoopKillAll()
        if vu424 then
            vu424:Disconnect()
            vu424 = nil
        end
    end
    local vu435 = require(ReplicatedStorage.GlobalMatchmaking.Modules.GamemodeInfo)
    local vu436 = require(ReplicatedStorage.GlobalMatchmaking.Modules.GamemodeEnum)
    local vu437 = require(ReplicatedStorage.GlobalMatchmaking.Modules.Util)
    local vu438 = require(ReplicatedStorage.Modules.Util.Promise)
    local vu439 = ReplicatedStorage.GlobalMatchmaking.Remotes.JoinQueue
    local vu440 = ReplicatedStorage.GlobalMatchmaking.Bindables.OnQueueJoinRequest
    local vu441 = ReplicatedStorage.GlobalMatchmaking.Bindables.OnQueueJoinError
    local vu442 = ReplicatedStorage.Party.Bindables.GetMembers
    local vu443 = ReplicatedStorage.Party.Bindables.GetLeaderStatus
    local vu444 = ReplicatedStorage.Party.Bindables.OnChanged
    local vu445 = nil
    local vu446 = nil
    local vu447 = 0
    local vu448 = 5
    local function vu450(p449)
        if p449 == "1v1" then
            return vu436.Solo
        elseif p449 == "2v2" then
            return vu436.Duo
        elseif p449 == "3v3" then
            return vu436.Trio
        elseif p449 == "4v4" then
            return vu436.Squad
        else
            return vu436.Solo
        end
    end
    local function vu452(p451)
        vu441:Fire()
        QueueStatus = "Error: " .. tostring(p451)
        vu447 = vu447 + 1
        if AutoFarmEnabled and vu447 < vu448 then
            task.wait(vu59)
            QueueStatus = "Retrying... (" .. vu447 .. "/" .. vu448 .. ")"
        else
            QueueStatus = "Failed"
            AutoFarmEnabled = false
        end
    end
    local function vu471(p453)
        local v454 = workspace:FindFirstChild("Rings")
        if not v454 then
            return nil
        end
        local v455 = v454:FindFirstChild(p453)
        if not v455 then
            return nil
        end
        local v456 = p453 == "1v1" and 2 or (p453 == "2v2" and 4 or (p453 == "3v3" and 6 or (p453 == "4v4" and 8 or 2)))
        local v457, v458, v459 = ipairs(v455:GetChildren())
        local v460 = - 1
        local v461 = nil
        while true do
            local v462
            v459, v462 = v457(v458, v459)
            if v459 == nil then
                break
            end
            if v462:IsA("Model") then
                local v463 = v462:FindFirstChild("Queue")
                if v463 then
                    local v464 = v463:FindFirstChild("Team1")
                    local v465 = v463:FindFirstChild("Team2")
                    local v466 = (v464 and # v464:GetChildren() or 0) + (v465 and # v465:GetChildren() or 0)
                    if v466 < v456 then
                        if v460 < v466 then
                            v461 = v462
                            v460 = v466
                        end
                    end
                end
            end
        end
        local v467
        if v461 then
            v467 = v461
        else
            local v468, v469, v470 = ipairs(v455:GetChildren())
            while true do
                v470, v467 = v468(v469, v470)
                if v470 == nil then
                    v467 = v461
                    break
                end
                if v467:IsA("Model") and v467:FindFirstChild("Queue") then
                    break
                end
            end
        end
        return v467
    end
    local function vu488()
        if AutoFarmEnabled then
            local v472 = tick()
            if v472 - LastQueueAttemptTime >= 5 then
                if vu445 then
                    return
                else
                    local vu473 = vu450(DesiredRingType)
                    local v474 = vu437.CheckIfPlayerCanQueue(LocalPlayer)
                    local v475 = vu443:Invoke()
                    local v476 = # vu442:Invoke()
                    if v475 then
                        if v474 then
                            local v477 = vu435[vu473]
                            if v477 then
                                if v477.TeamSize < v476 then
                                    QueueStatus = "Party Too Large"
                                else
                                    local v478 = vu471(DesiredRingType)
                                    if v478 then
                                        local v479 = v478:FindFirstChild("TriggerPart") or v478:FindFirstChild("Trigger")
                                        if v479 and Character and Character:FindFirstChild("HumanoidRootPart") then
                                            local v480 = Character.HumanoidRootPart
                                            local v481 = v479.Position
                                            if (v480.Position - v481).Magnitude > 5 then
                                                QueueStatus = "Walking to Ring..."
                                                local v482 = Character:FindFirstChildOfClass("Humanoid")
                                                if v482 then
                                                    v482:MoveTo(v481)
                                                    task.wait(0.5)
                                                end
                                            end
                                        end
                                    end
                                    LastQueueAttemptTime = v472
                                    QueueStatus = "Joining Queue..."
                                    if vu60 then
                                        task.spawn(function()
                                            local vu483 = vu60:PopupModal({
                                                Title = "Auto Queue"
                                            })
                                            local v484 = vu483
                                            vu483.Label(v484, {
                                                Text = "Joining " .. DesiredRingType .. " queue...",
                                                TextWrapped = true
                                            })
                                            local v485 = vu483
                                            vu483.Row(v485, {
                                                Expanded = true
                                            }):Button({
                                                Text = "Okay",
                                                Callback = function()
                                                    vu483:ClosePopup()
                                                end
                                            })
                                        end)
                                    end
                                    vu440:Fire(vu473)
                                    vu445 = vu438.new(function(p486, p487)
                                        if vu439:InvokeServer(vu473) then
                                            QueueStatus = "In Queue"
                                            vu447 = 0
                                            p486()
                                        else
                                            p487("Queue join failed")
                                        end
                                    end):finally(function()
                                        vu445 = nil
                                    end):catch(vu452)
                                end
                            else
                                QueueStatus = "Invalid Gamemode"
                                return
                            end
                        else
                            QueueStatus = "Cannot Queue"
                            return
                        end
                    else
                        QueueStatus = "Not Party Leader"
                        return
                    end
                end
            else
                return
            end
        else
            QueueStatus = "Disabled"
            return
        end
    end
    local vu489 = nil
    function startAutoFarm()
        if not vu446 then
            vu447 = 0
            QueueStatus = "Starting..."
            task.spawn(function()
                task.wait(2)
                vu488()
            end)
            vu446 = task.spawn(function()
                while AutoFarmEnabled do
                    task.wait(vu59)
                end
            end)
            if not vu489 then
                vu489 = vu444.Event:Connect(function()
                    if AutoFarmEnabled then
                        task.wait(0.5)
                        vu488()
                    end
                end)
            end
        end
    end
    function stopAutoFarm()
        AutoFarmEnabled = false
        QueueStatus = "Stopped"
        if vu445 then
            vu445:cancel()
            vu445 = nil
        end
        if vu446 then
            vu446 = nil
        end
        if vu489 then
            vu489:Disconnect()
            vu489 = nil
        end
    end
    local vu490 = nil
    local vu491 = 0
    function startAutoFire()
        if not vu490 then
            vu490 = RunService.Heartbeat:Connect(function()
                if not AutoFireEnabled then
                    return
                end
                local v492 = tick()
                if v492 - vu491 < vu56 then
                    return
                end
                local v493, v494, v495 = ipairs(Players:GetPlayers())
                while true do
                    local v496
                    v495, v496 = v493(v494, v495)
                    if v495 == nil then
                        break
                    end
                    if v496 ~= LocalPlayer and v496.Character and (v496.Character:IsDescendantOf(workspace) and not isOnSameTeam(v496)) then
                        local v497 = v496.Character:FindFirstChildOfClass("Humanoid")
                        if v497 and (v497.Health > 0 and isPlayerInView(v496)) then
                            if AutoFireMode == "Auto Shoot" then
                                local v498 = getEquippedWeapon()
                                if v498 then
                                    v498 = v498:FindFirstChild("Fire", true)
                                end
                                if not v498 then
                                    vu234("Gun")
                                    task.wait(0.1)
                                end
                                local v499 = vu11 < math.random(1, 100)
                                shootGun(v496.Character, v499)
                                vu491 = v492
                                break
                            end
                            if AutoFireMode == "Auto Throw" then
                                local v500 = getEquippedWeapon()
                                if v500 then
                                    v500 = v500:FindFirstChild("ThrowSound", true)
                                end
                                if not v500 then
                                    vu234("Knife")
                                    task.wait(0.1)
                                end
                                local v501 = getEquippedWeapon()
                                local v502
                                if v501 then
                                    v502 = v501:FindFirstChild("ThrowSound", true)
                                else
                                    v502 = v501
                                end
                                if v502 then
                                    local v503 = v496.Character:FindFirstChild(TargetPart) or v496.Character:FindFirstChild("Head")
                                    if v503 then
                                        local v504 = v501:FindFirstChild("RightHandle")
                                        if v504 then
                                            local v505 = Character:FindFirstChild("HumanoidRootPart")
                                            if v505 then
                                                local v506 = v505.Position
                                                local v507 = v503.Position
                                                if KnifeWallHacksEnabled then
                                                    v506 = v507
                                                end
                                                local v508 = (v507 - v505.Position).Unit
                                                ReplicatedStorage.Remotes.ThrowStart:FireServer(v506, v508)
                                                local v509 = v504:Clone()
                                                require(ReplicatedStorage.Modules.KnifeProjectileController)({
                                                    Speed = v501:GetAttribute("ThrowSpeed") or 100,
                                                    KnifeProjectile = v509,
                                                    Direction = v508,
                                                    Origin = v506
                                                }, function(p510)
                                                    local v511
                                                    if p510 then
                                                        v511 = p510.Instance or nil
                                                    else
                                                        v511 = nil
                                                    end
                                                    local v512 = p510 and p510.Position or nil
                                                    ReplicatedStorage.Remotes.ThrowHit:FireServer(v511, v512)
                                                end)
                                                vu491 = v492
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
    function stopAutoFire()
        if vu490 then
            vu490:Disconnect()
            vu490 = nil
        end
    end
    local vu513 = nil
    local vu514 = 0
    function startAutoStab()
        if not vu513 then
            vu513 = RunService.Heartbeat:Connect(function()
                if AutoStabEnabled then
                    local v515 = tick()
                    if v515 - vu514 >= vu58 then
                        local v516 = getClosestPlayerInRange()
                        if v516 and v516.Character and v516.Character:IsDescendantOf(workspace) then
                            local v517 = v516.Character:FindFirstChildOfClass("Humanoid")
                            if v517 and v517.Health > 0 then
                                local v518 = getEquippedWeapon()
                                if v518 then
                                    v518 = v518:FindFirstChild("ThrowSound", true)
                                end
                                if not v518 then
                                    vu234("Knife")
                                    task.wait(0.1)
                                end
                                stabKnife(v516.Character)
                                vu514 = v515
                            end
                        end
                    end
                else
                    return
                end
            end)
        end
    end
    function stopAutoStab()
        if vu513 then
            vu513:Disconnect()
            vu513 = nil
        end
    end
    local vu519 = nil
    function startAimbot()
        if not vu519 then
            vu519 = RunService.RenderStepped:Connect(function()
                if AimbotEnabled then
                    local v520
                    if vu13 and vu30 then
                        v520 = vu30
                    else
                        v520 = getClosestPlayerToCenter()
                    end
                    local v521 = v520 and v520.Character and (v520.Character:FindFirstChild(TargetPart) or v520.Character:FindFirstChild("Head"))
                    if v521 then
                        local v522 = CFrame.new(Camera.CFrame.Position, v521.Position)
                        if AimbotSmoothness <= 0 then
                            Camera.CFrame = v522
                        else
                            Camera.CFrame = Camera.CFrame:Lerp(v522, 1 / AimbotSmoothness)
                        end
                    end
                end
            end)
        end
    end
    function stopAimbot()
        if vu519 then
            vu519:Disconnect()
            vu519 = nil
        end
    end
    local vu523 = nil
    local vu524 = 0
    local vu525 = 0.1
    local vu526 = 15
    function startTriggerbot()
        if not vu523 then
            vu523 = RunService.Heartbeat:Connect(function()
                if TriggerBotEnabled then
                    local v527 = tick()
                    if v527 - vu524 >= vu525 then
                        local v528 = getClosestPlayerToMouse()
                        if v528 and v528.Character and (v528.Character:IsDescendantOf(workspace) and not isOnSameTeam(v528)) then
                            local v529 = v528.Character:FindFirstChildOfClass("Humanoid")
                            if v529 and v529.Health > 0 then
                                local v530 = getEquippedWeapon()
                                local v531
                                if v530 then
                                    v531 = v530:FindFirstChild("Fire", true)
                                else
                                    v531 = v530
                                end
                                if v530 then
                                    v530 = v530:FindFirstChild("ThrowSound", true)
                                end
                                if v531 then
                                    shootGun(v528.Character)
                                    vu524 = v527
                                elseif v530 and (v528.Character.HumanoidRootPart.Position - Character.HumanoidRootPart.Position).Magnitude < vu526 then
                                    stabKnife(v528.Character)
                                    vu524 = v527
                                end
                            end
                        end
                    end
                else
                    return
                end
            end)
        end
    end
    function stopTriggerbot()
        if vu523 then
            vu523:Disconnect()
            vu523 = nil
        end
    end
    LocalPlayer.CharacterAdded:Connect(function(p532)
        Character = p532
        Backpack = LocalPlayer.Backpack
        task.wait(0.5)
        local v533 = Character:FindFirstChildOfClass("Humanoid")
        if v533 then
            vu54 = v533.WalkSpeed
            vu55 = v533.JumpPower
        end
        disableBAC()
        disableScript("GunController")
        disableScript("KnifeController")
        task.wait(0.5)
        customGunController()
        customKnifeController()
        if WalkSpeedEnabled or JumpPowerEnabled then
            updateCharacterStats()
        end
    end)
    local vu534 = nil
    function startESPLoop()
        if vu534 then
            vu534:Disconnect()
            vu534 = nil
        end
        if ESPUpdateMode ~= "RenderStepped" then
            if ESPUpdateMode ~= "Stepped" then
                vu534 = RunService.Heartbeat:Connect(function()
                    updateESP()
                end)
            else
                vu534 = RunService.Stepped:Connect(function()
                    updateESP()
                end)
            end
        else
            vu534 = RunService.RenderStepped:Connect(function()
                updateESP()
            end)
        end
    end
    startESPLoop()
    function createOwnerLabel(p535)
        if vu47 then
            if p535.Character then
                if vu49[p535] then
                    removeOwnerLabel(p535)
                end
                local v536 = Drawing.new("Text")
                v536.Text = "Melon Hub Developer"
                v536.Size = 20
                v536.Color = Color3.fromRGB(255, 105, 180)
                v536.Transparency = 1
                v536.Center = true
                v536.Outline = true
                v536.OutlineColor = Color3.new(0, 0, 0)
                v536.Visible = false
                v536.Font = 3
                vu49[p535] = v536
            end
        else
            return
        end
    end
    function removeOwnerLabel(p537)
        if vu49[p537] then
            vu49[p537]:Remove()
            vu49[p537] = nil
        end
    end
    function updateOwnerLabels()
        if vu47 then
            local v538, v539, v540 = pairs(vu49)
            while true do
                local v541
                v540, v541 = v538(v539, v540)
                if v540 == nil then
                    break
                end
                if v540 and v540.Character and v540.Character:IsDescendantOf(workspace) then
                    local v542 = v540.Character:FindFirstChild("Head")
                    if v542 then
                        local v543 = v542.Position + Vector3.new(0, v542.Size.Y / 2 + 2, 0)
                        local v544, v545 = Camera:WorldToScreenPoint(v543)
                        if v545 then
                            v541.Position = Vector2.new(v544.X, v544.Y)
                            v541.Visible = true
                        else
                            v541.Visible = false
                        end
                    else
                        v541.Visible = false
                    end
                else
                    removeOwnerLabel(v540)
                end
            end
        else
            local v546, v547, v548 = pairs(vu49)
            while true do
                local v549
                v548, v549 = v546(v547, v548)
                if v548 == nil then
                    break
                end
                removeOwnerLabel(v548)
            end
        end
    end
    function checkForOwners()
        local v550, v551, v552 = ipairs(Players:GetPlayers())
        while true do
            local v553
            v552, v553 = v550(v551, v552)
            if v552 == nil then
                break
            end
            if table.find(vu48, v553.UserId) and not vu49[v553] then
                createOwnerLabel(v553)
                if vu60 then
                    task.spawn(function()
                        local vu554 = vu60:PopupModal({
                            Title = "Melon Hub"
                        })
                        local v555 = vu554
                        vu554.Label(v555, {
                            Text = "Melon Hub Developer is in your game!",
                            TextWrapped = true
                        })
                        local v556 = vu554
                        vu554.Row(v556, {
                            Expanded = true
                        }):Button({
                            Text = "Okay",
                            Callback = function()
                                vu554:ClosePopup()
                            end
                        })
                    end)
                end
            end
        end
    end
    Players.PlayerAdded:Connect(function(pu557)
        pu557.CharacterAdded:Connect(function()
            task.wait(0.5)
            if ESPEnabled then
                createESP(pu557)
            end
            if table.find(vu48, pu557.UserId) and vu47 then
                createOwnerLabel(pu557)
            end
        end)
        if table.find(vu48, pu557.UserId) and (pu557.Character and vu47) then
            createOwnerLabel(pu557)
            if vu60 then
                task.spawn(function()
                    local vu558 = vu60:PopupModal({
                        Title = "Melon Hub"
                    })
                    local v559 = vu558
                    vu558.Label(v559, {
                        Text = "Melon Hub Developer is in your game!",
                        TextWrapped = true
                    })
                    local v560 = vu558
                    vu558.Row(v560, {
                        Expanded = true
                    }):Button({
                        Text = "Okay",
                        Callback = function()
                            vu558:ClosePopup()
                        end
                    })
                end)
            end
        end
    end)
    Players.PlayerRemoving:Connect(function(p561)
        removeESP(p561)
        removeOwnerLabel(p561)
    end)
    local v562, v563, v564 = ipairs(Players:GetPlayers())
    local vu565 = vu7
    local vu566 = vu58
    local vu567 = vu57
    local vu568 = vu59
    local vu569 = vu49
    local vu570 = vu5
    local vu571 = vu8
    local vu572 = vu11
    local vu573 = vu9
    local vu574 = vu12
    local vu575 = vu56
    local v576 = vu63
    local vu577 = vu6
    local vu578 = vu3
    local vu579 = vu10
    local vu580 = vu526
    local vu581 = vu62
    local vu582 = vu4
    local vu583 = vu2
    local vu584 = vu1
    local vu585 = vu30
    local vu586 = vu55
    local vu587 = vu488
    local vu588 = vu54
    local vu589 = vu13
    local vu590 = vu234
    local vu591 = vu47
    local vu592 = vu48
    while true do
        local v593, vu594 = v562(v563, v564)
        if v593 == nil then
            break
        end
        v564 = v593
        if vu594 ~= LocalPlayer then
            vu594.CharacterAdded:Connect(function()
                task.wait(0.5)
                if ESPEnabled then
                    createESP(vu594)
                end
                if table.find(vu592, vu594.UserId) and vu591 then
                    createOwnerLabel(vu594)
                end
            end)
            if table.find(vu592, vu594.UserId) and (vu594.Character and vu591) then
                task.wait(0.5)
                createOwnerLabel(vu594)
            end
        end
    end
    RunService.RenderStepped:Connect(function()
        if ShowFOVCircle then
            updateFOVCircle()
        end
    end)
    RunService.Heartbeat:Connect(function()
        updateOwnerLabels()
    end)
    local vu595 = nil
    function startSpinBot()
        if not vu595 then
            vu595 = RunService.RenderStepped:Connect(function()
                if SpinBotEnabled then
                    if Character and Character:FindFirstChild("HumanoidRootPart") then
                        local v596 = Character.HumanoidRootPart
                        v596.CFrame = v596.CFrame * CFrame.Angles(0, math.rad(40), 0)
                    end
                else
                    return
                end
            end)
        end
    end
    function stopSpinBot()
        if vu595 then
            vu595:Disconnect()
            vu595 = nil
        end
    end
    function updateHeadScale()
        if HeadScaleEnabled then
            local v597, v598, v599 = ipairs(Players:GetPlayers())
            while true do
                local v600
                v599, v600 = v597(v598, v599)
                if v599 == nil then
                    break
                end
                if v600 ~= LocalPlayer and v600.Character then
                    local v601 = v600.Character:FindFirstChild("Head")
                    if v601 and v601:IsA("BasePart") then
                        v601.Size = Vector3.new(HeadScaleSize, HeadScaleSize, HeadScaleSize)
                        v601.Transparency = 0.7
                    end
                end
            end
        else
            local v602, v603, v604 = ipairs(Players:GetPlayers())
            while true do
                local v605
                v604, v605 = v602(v603, v604)
                if v604 == nil then
                    break
                end
                if v605 ~= LocalPlayer and v605.Character then
                    local v606 = v605.Character:FindFirstChild("Head")
                    if v606 and v606:IsA("BasePart") then
                        v606.Size = Vector3.new(2, 1, 1)
                        v606.Transparency = 0
                    end
                end
            end
        end
    end
    RunService.Heartbeat:Connect(function()
        if HeadScaleEnabled then
            updateHeadScale()
        end
    end)
    function updateFOV()
        if Camera then
            Camera.FieldOfView = FOVChanger
        end
    end
    RunService.RenderStepped:Connect(function()
        if FOVChanger ~= 70 then
            updateFOV()
        end
    end)
    local vu607 = nil
    function trackPlayerPosition(p608)
        if p608 and p608.Character and p608.Character:IsDescendantOf(workspace) then
            if isOnSameTeam(p608) then
                return
            else
                local v609 = p608.Character:FindFirstChild("HumanoidRootPart")
                if v609 then
                    if not vu25[p608] then
                        vu25[p608] = {
                            positions = {},
                            currentVelocity = Vector3.zero,
                            avgVelocity = Vector3.zero,
                            isMoving = false,
                            lastUpdate = tick(),
                            lastPosition = v609.Position
                        }
                    end
                    local v610 = vu25[p608]
                    local v611 = tick()
                    local v612 = v611 - v610.lastUpdate
                    if v612 >= 0.05 then
                        local v613 = v609.Position
                        local v614 = (v613 - v610.lastPosition) / v612
                        table.insert(v610.positions, {
                            pos = v613,
                            time = v611,
                            velocity = v614
                        })
                        if # v610.positions > 10 then
                            table.remove(v610.positions, 1)
                        end
                        v610.currentVelocity = v614
                        v610.lastPosition = v613
                        v610.lastUpdate = v611
                        if # v610.positions >= 3 then
                            local v615 = Vector3.zero
                            for v616 = 1, # v610.positions do
                                v615 = v615 + v610.positions[v616].velocity
                            end
                            v610.avgVelocity = v615 / # v610.positions
                            v610.isMoving = vu20 < v610.avgVelocity.Magnitude
                        end
                    end
                else
                    return
                end
            end
        else
            return
        end
    end
    function predictFuturePosition(p617, p618)
        local v619 = vu25[p617]
        if not v619 or # v619.positions < 2 then
            return nil
        end
        local v620 = v619.lastPosition
        local v621 = v619.avgVelocity
        if # v619.positions < 3 then
            return v620 + v621 * p618
        end
        local v622 = v619.positions[# v619.positions - 1].velocity
        local v623 = v619.currentVelocity
        local v624 = v619.positions[# v619.positions].time - v619.positions[# v619.positions - 1].time
        if v624 <= 0 then
            return v620 + v621 * p618
        end
        local v625 = (v623 - v622) / v624
        return v620 + v623 * p618 + 0.5 * v625 * p618 * p618
    end
    function checkVisibilityAtPosition(p626, p627)
        if not (Character and Character:FindFirstChild("Head")) then
            return false
        end
        if not p626 then
            return false
        end
        local v628 = Camera.CFrame.Position
        local v629 = p626 - v628
        local v630 = RaycastParams.new()
        v630.FilterType = Enum.RaycastFilterType.Blacklist
        v630.FilterDescendantsInstances = {
            Character,
            p627
        }
        return not workspace:Raycast(v628, v629, v630)
    end
    function calculateShotConfidence(p631)
        local v632 = vu25[p631]
        if not v632 or # v632.positions < 3 then
            return 0
        end
        local v633
        if # v632.positions < 3 then
            v633 = 0
        else
            local v634 = {}
            for v635 = 1, # v632.positions do
                table.insert(v634, v632.positions[v635].velocity.Magnitude)
            end
            local v636, v637, v638 = ipairs(v634)
            local v639 = 0
            while true do
                local v640
                v638, v640 = v636(v637, v638)
                if v638 == nil then
                    break
                end
                v639 = v639 + v640
            end
            local v641 = v639 / # v634
            local v642, v643, v644 = ipairs(v634)
            local v645 = 0
            while true do
                local v646
                v644, v646 = v642(v643, v644)
                if v644 == nil then
                    break
                end
                v645 = v645 + (v646 - v641) ^ 2
            end
            local v647 = v645 / # v634
            v633 = math.max(0, 1 - v647 / 100)
        end
        local v648 = 0
        if # v632.positions >= 3 then
            local v649 = {}
            for v650 = 1, # v632.positions do
                local v651 = v632.positions[v650].velocity
                if v651.Magnitude > 0.1 then
                    table.insert(v649, v651.Unit)
                end
            end
            if # v649 >= 2 then
                local v652 = 0
                for v653 = 1, # v649 - 1 do
                    v652 = v652 + v649[v653]:Dot(v649[v653 + 1])
                end
                v648 = math.max(0, v652 / (# v649 - 1))
            end
        end
        local v654
        if # v632.positions <= 0 then
            v654 = 0
        else
            local v655 = tick() - v632.positions[1].time
            v654 = math.min(v655 / vu21, 1)
        end
        local v656 = 0
        if Character and (Character:FindFirstChild("HumanoidRootPart") and p631.Character) then
            local v657 = p631.Character:FindFirstChild("HumanoidRootPart")
            if v657 then
                v656 = (v657.Position - Character.HumanoidRootPart.Position).Magnitude
            end
        end
        local v658 = 1 - math.min(v656 / 100, 1)
        return (v633 * 0.4 + v648 * 0.3 + v654 * 0.2 + v658 * 0.1) * 100
    end
    function calculatePreFireTiming(p659)
        if not (p659 and p659.Character and p659.Character:IsDescendantOf(workspace)) then
            return nil, nil, 0
        end
        local v660 = vu25[p659]
        if not (v660 and v660.isMoving) then
            return nil, nil, 0
        end
        local v661 = calculateShotConfidence(p659)
        if v661 < vu22 then
            return nil, nil, v661
        end
        if isPlayerInView(p659) then
            return nil, nil, v661
        end
        local v662 = nil
        local v663 = nil
        for v664 = 0.05, vu18, 0.05 do
            local v665 = predictFuturePosition(p659, v664)
            if v665 then
                if checkVisibilityAtPosition(v665, p659.Character) then
                    v663 = v665
                    v662 = v664
                    break
                end
            end
        end
        if v662 and v663 then
            local _ = (v663 - Camera.CFrame.Position).Magnitude
            local v666 = v662 - vu19
            if 0 < v666 and v666 < 1.5 then
                return v666, v663, v661
            else
                return nil, nil, v661
            end
        else
            return nil, nil, v661
        end
    end
    function executePreFire(pu667, p668, _)
        if not vu27[pu667] then
            vu27[pu667] = true
            task.delay(p668, function()
                if vu17 then
                    if pu667 and pu667.Character and pu667.Character:IsDescendantOf(workspace) then
                        if vu23 then
                            local v669 = getEquippedWeapon()
                            if v669 then
                                v669 = v669:FindFirstChild("Fire", true)
                            end
                            if not v669 then
                                vu590("Gun")
                                task.wait(0.1)
                            end
                        end
                        if isPlayerInView(pu667) then
                            shootGun(pu667.Character)
                        end
                        vu27[pu667] = nil
                    else
                        vu27[pu667] = nil
                    end
                else
                    vu27[pu667] = nil
                    return
                end
            end)
        end
    end
    function cleanupPredictiveDebug()
        local v670, v671, v672 = pairs(vu26)
        while true do
            local v673
            v672, v673 = v670(v671, v672)
            if v672 == nil then
                break
            end
            if v673 and v673.Remove then
                v673:Remove()
            end
        end
        vu26 = {}
    end
    function updatePredictiveDebug()
        if vu24 then
            cleanupPredictiveDebug()
            local v674, v675, v676 = pairs(vu25)
            while true do
                local v677
                v676, v677 = v674(v675, v676)
                if v676 == nil then
                    break
                end
                if v676 and v676.Character and v676.Character:IsDescendantOf(workspace) then
                    local v678 = v676.Character:FindFirstChild("HumanoidRootPart")
                    if v678 then
                        local v679 = v678.Position
                        local v680, v681 = Camera:WorldToScreenPoint(v679)
                        if v677.isMoving and v677.avgVelocity.Magnitude > 0.1 then
                            local v682 = v679 + v677.avgVelocity * 0.5
                            local v683, v684 = Camera:WorldToScreenPoint(v682)
                            if v681 and v684 then
                                local v685 = Drawing.new("Line")
                                v685.From = Vector2.new(v680.X, v680.Y)
                                v685.To = Vector2.new(v683.X, v683.Y)
                                v685.Color = Color3.fromRGB(0, 255, 0)
                                v685.Thickness = 2
                                v685.Transparency = 0.5
                                table.insert(vu26, v685)
                            end
                        end
                        local v686 = v676
                        for v687 = 0.1, vu18, 0.2 do
                            local v688 = predictFuturePosition(v686, v687)
                            if v688 then
                                local v689, v690 = Camera:WorldToScreenPoint(v688)
                                if v690 then
                                    local v691 = v689.X
                                    local v692 = v689.Y
                                    local v693 = 4
                                    for v694 = 0, math.pi * 2, math.pi / 4 do
                                        local v695 = v691 + math.cos(v694) * v693
                                        local v696 = v692 + math.sin(v694) * v693
                                        local v697 = v691 + math.cos(v694 + math.pi / 4) * v693
                                        local v698 = v692 + math.sin(v694 + math.pi / 4) * v693
                                        local v699 = Drawing.new("Line")
                                        v699.From = Vector2.new(v695, v696)
                                        v699.To = Vector2.new(v697, v698)
                                        v699.Color = Color3.fromRGB(255, 255, 0)
                                        v699.Thickness = 1
                                        v699.Transparency = 0.5
                                        table.insert(vu26, v699)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        else
            cleanupPredictiveDebug()
        end
    end
    function startPredictiveShooting()
        if not vu607 then
            vu607 = RunService.Heartbeat:Connect(function()
                if vu17 then
                    if isInGame() then
                        local v700, v701, v702 = ipairs(Players:GetPlayers())
                        while true do
                            local v703
                            v702, v703 = v700(v701, v702)
                            if v702 == nil then
                                break
                            end
                            if v703 ~= LocalPlayer and v703.Character and (v703.Character:IsDescendantOf(workspace) and not isOnSameTeam(v703)) then
                                trackPlayerPosition(v703)
                            end
                        end
                        local v704 = math.huge
                        local v705, v706, v707 = pairs(vu25)
                        local v708 = nil
                        local v709 = nil
                        local v710 = 0
                        while true do
                            local v711
                            v707, v711 = v705(v706, v707)
                            if v707 == nil then
                                break
                            end
                            if v707 and v707.Character and v707.Character:IsDescendantOf(workspace) then
                                local v712, v713, v714 = calculatePreFireTiming(v707)
                                if v712 and v713 then
                                    if v712 < v704 then
                                        v710 = v714
                                        v709 = v713
                                        v708 = v707
                                        v704 = v712
                                    end
                                end
                            end
                        end
                        if v708 and v709 then
                            vu28 = string.format("Target: %s | Delay: %.2fs | Conf: %.0f%%", v708.Name, v704, v710)
                            executePreFire(v708, v704, v709)
                        else
                            vu28 = "Waiting for peek..."
                        end
                        updatePredictiveDebug()
                    end
                else
                    return
                end
            end)
        end
    end
    function stopPredictiveShooting()
        if vu607 then
            vu607:Disconnect()
            vu607 = nil
        end
        vu25 = {}
        vu27 = {}
        vu28 = "Disabled"
        cleanupPredictiveDebug()
    end
    local vu715 = nil
    function startBhop()
        if not vu715 then
            vu715 = RunService.Heartbeat:Connect(function()
                if BhopEnabled then
                    if Character then
                        local v716 = Character:FindFirstChildOfClass("Humanoid")
                        if v716 then
                            if v716.FloorMaterial ~= Enum.Material.Air then
                                v716:ChangeState(Enum.HumanoidStateType.Jumping)
                            end
                        end
                    else
                        return
                    end
                else
                    return
                end
            end)
        end
    end
    function stopBhop()
        if vu715 then
            vu715:Disconnect()
            vu715 = nil
        end
    end
    function updateCharacterStats()
        if Character then
            local v717 = Character:FindFirstChildOfClass("Humanoid")
            if v717 then
                if WalkSpeedEnabled then
                    v717.WalkSpeed = WalkSpeedValue
                else
                    v717.WalkSpeed = vu588
                end
                if JumpPowerEnabled then
                    v717.JumpPower = JumpPowerValue
                else
                    v717.JumpPower = vu586
                end
            end
        else
            return
        end
    end
    RunService.Heartbeat:Connect(function()
        if WalkSpeedEnabled or JumpPowerEnabled then
            updateCharacterStats()
        end
    end)
    local vu718 = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        if AntiAFKEnabled then
            vu718:CaptureController()
            vu718:ClickButton2(Vector2.new())
        end
    end)
    local vu719 = game.JobId
    function rejoinRandomServer()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
    function rejoinSameServer()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, vu719, LocalPlayer)
    end
    function rejoinFromJobId(p720)
        if p720 and p720 ~= "" then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, p720, LocalPlayer)
        end
    end
    local vu721 = nil
    local vu722 = 0
    local vu723 = 1
    local vu724 = nil
    local vu725 = 1
    local vu726 = 0
    local vu727 = 0
    local vu728 = nil
    local vu729 = 0
    local vu730 = 0
    function calculateExposure(p731)
        if not (p731 and p731.Character) then
            return 0
        end
        if not (Character and Character:FindFirstChild("Head")) then
            return 0
        end
        local v732 = Character.Head
        local v733 = p731.Character:FindFirstChild("Head")
        if not v733 then
            return 0
        end
        local v734 = {
            v733,
            p731.Character:FindFirstChild("HumanoidRootPart"),
            p731.Character:FindFirstChild("Left Arm"),
            p731.Character:FindFirstChild("Right Arm"),
            p731.Character:FindFirstChild("Left Leg"),
            p731.Character:FindFirstChild("Right Leg"),
            p731.Character:FindFirstChild("Torso")
        }
        local v735, v736, v737 = ipairs(v734)
        local v738 = 0
        local v739 = 0
        while true do
            local v740
            v737, v740 = v735(v736, v737)
            if v737 == nil then
                break
            end
            if v740 then
                v738 = v738 + 1
                local v741 = RaycastParams.new()
                v741.FilterType = Enum.RaycastFilterType.Blacklist
                v741.FilterDescendantsInstances = {
                    Character,
                    p731.Character
                }
                local v742 = v740.Position - v732.Position
                if not workspace:Raycast(v732.Position, v742, v741) then
                    v739 = v739 + 1
                end
            end
        end
        return v738 == 0 and 0 or v739 / v738
    end
    function findNearestCover(p743, p744)
        local v745 = tick()
        if v745 - vu39 < 2 then
            return vu38.coverPosition, vu38.safetyScore
        end
        local v746 = RaycastParams.new()
        v746.FilterType = Enum.RaycastFilterType.Blacklist
        v746.FilterDescendantsInstances = {
            Character
        }
        local v747 = p744 - p743
        local v748 = workspace:Raycast(p743, v747, v746)
        if not v748 then
            vu38 = {
                coverPosition = nil,
                safetyScore = 0
            }
            vu39 = v745
            return nil, 0
        end
        local v749 = v748.Instance
        local v750 = v748.Position
        local v751 = Vector3.new(10, 10, 10)
        local v752 = Region3.new(v750 - v751 / 2, v750 + v751 / 2)
        local v753 = workspace:FindPartsInRegion3(v752, nil, math.huge)
        local v754, v755, v756 = ipairs(v753)
        local v757 = 0
        while true do
            local v758
            v756, v758 = v754(v755, v756)
            if v756 == nil then
                break
            end
            if v758 and (v758 ~= Character and v758 ~= v749) then
                local v759 = v758.Size.Y
                if v757 < v759 then
                    v757 = v759
                end
            end
        end
        local v760 = v757 < 4 and 0 or math.min(v757 / 10, 1)
        vu38 = {
            coverPosition = v750,
            safetyScore = v760
        }
        vu39 = v745
        return v750, v760
    end
    function getOptimalTarget()
        local v761 = tick()
        if v761 - vu43 < 0.5 and vu585 then
            return vu585, vu31
        end
        local v762 = getAllPlayers()
        if # v762 == 0 then
            vu585 = nil
            vu31 = 0
            return nil, 0
        end
        local v763 = math.huge
        local v764, v765, v766 = ipairs(v762)
        local v767 = - 1
        local v768 = nil
        while true do
            local v769
            v766, v769 = v764(v765, v766)
            if v766 == nil then
                break
            end
            if v769.Character and v769.Character:IsDescendantOf(workspace) then
                local v770 = v769.Character:FindFirstChild("HumanoidRootPart")
                if v770 then
                    local v771 = math.huge
                    if Character and Character:FindFirstChild("HumanoidRootPart") then
                        v771 = (v770.Position - Character.HumanoidRootPart.Position).Magnitude
                    end
                    if vu34 >= v771 then
                        local v772 = calculateExposure(v769)
                        if 0.3 < v772 and v767 < v772 then
                            v768 = v769
                            v767 = v772
                        elseif v767 < 0.3 then
                            if v771 < v763 then
                                v768 = v769
                                v763 = v771
                                v767 = v772
                            end
                        end
                    end
                end
            end
        end
        vu585 = v768
        vu31 = v767 or 0
        vu43 = v761
        return v768, v767 or 0
    end
    local vu773 = nil
    local vu774 = 0
    local vu775 = 0
    function checkObstacleAhead(p776, p777)
        if not (Character and Character:FindFirstChild("HumanoidRootPart")) then
            return false
        end
        local v778 = Character.HumanoidRootPart.Position + Vector3.new(0, 1, 0)
        local _ = v778 + p776 * p777
        local v779 = RaycastParams.new()
        v779.FilterType = Enum.RaycastFilterType.Blacklist
        v779.FilterDescendantsInstances = {
            Character
        }
        local v780 = workspace:Raycast(v778, p776 * p777, v779)
        if v780 then
            local _ = v780.Instance
            local v781 = v780.Position.Y - v778.Y
            if 2 < v781 and v781 < 8 then
                return true
            end
        end
        return false
    end
    function checkTargetBlocked(p782)
        if not (Character and Character:FindFirstChild("HumanoidRootPart")) then
            return false
        end
        if not (p782 and p782.Character) then
            return false
        end
        local v783 = Character.HumanoidRootPart
        local v784 = p782.Character:FindFirstChild("Head")
        if not v784 then
            return false
        end
        local v785 = v783.Position + Vector3.new(0, 2, 0)
        local v786 = v784.Position + Vector3.new(0, 2, 0) - v785
        local v787 = v786.Magnitude
        local v788 = v786.Unit
        local v789 = RaycastParams.new()
        v789.FilterType = Enum.RaycastFilterType.Blacklist
        v789.FilterDescendantsInstances = {
            Character,
            p782.Character
        }
        if workspace:Raycast(v785, v788 * v787, v789) then
            local v790 = v785 + Vector3.new(0, 6, 0)
            if not workspace:Raycast(v790, v788 * v787, v789) then
                return true
            end
        end
        return false
    end
    function rotateCharacterToTarget(p791)
        if Character and Character:FindFirstChild("HumanoidRootPart") then
            if p791 and p791.Character then
                local v792 = Character.HumanoidRootPart
                local v793 = p791.Character:FindFirstChild("HumanoidRootPart")
                if v793 then
                    local v794 = v793.Position - v792.Position
                    local v795 = Vector3.new(v794.X, 0, v794.Z).Unit
                    if v795.Magnitude > 0 then
                        local v796 = CFrame.lookAt(v792.Position, v792.Position + v795)
                        v792.CFrame = v792.CFrame:Lerp(v796, 0.5)
                    end
                end
            else
                return
            end
        else
            return
        end
    end
    function performDodge(p797)
        if Character and Character:FindFirstChild("HumanoidRootPart") then
            if vu585 and vu585.Character then
                local v798 = Character:FindFirstChildOfClass("Humanoid")
                local v799 = Character.HumanoidRootPart
                if v798 and v799 then
                    local v800 = vu585.Character:FindFirstChild("HumanoidRootPart")
                    if v800 then
                        local v801 = tick()
                        local v802 = (v800.Position - v799.Position):Cross(Vector3.new(0, 1, 0)).Unit
                        if p797 == "Zigzag" then
                            if v801 - vu722 > 0.5 then
                                vu723 = vu723 * - 1
                                vu722 = v801
                            end
                            local v803 = v802 * vu723 * 3
                            v798:Move(v799.CFrame.LookVector + v803)
                        elseif p797 == "Jump Spam" then
                            if (v800.Position - v799.Position).Magnitude >= 20 then
                                if v801 - vu722 > 0.3 then
                                    local v804 = v802 * (math.random() > 0.5 and 1 or - 1) * 4
                                    v798:Move(v799.CFrame.LookVector + v804)
                                    v798.Jump = true
                                    vu722 = v801
                                end
                            elseif v801 - vu722 > 0.15 then
                                vu723 = vu723 * - 1
                                local v805 = v802 * vu723 * 8
                                v798:Move(v799.CFrame.LookVector + v805)
                                v798.Jump = true
                                vu722 = v801
                            end
                        elseif p797 == "Serpentine" then
                            vu726 = vu726 + 0.1
                            local v806 = v802 * (math.sin(vu726 * 3) * 3)
                            v798:Move(v799.CFrame.LookVector + v806)
                        elseif p797 == "Random" and v801 - vu722 > math.random(0.2, 0.6) then
                            local v807 = math.random() > 0.5 and 1 or - 1
                            local v808 = math.random(- math.pi, math.pi)
                            local v809 = v802:RotateBy(CFrame.Angles(0, v808, 0)) * v807 * math.random(2, 5)
                            v798:Move(v799.CFrame.LookVector + v809)
                            vu722 = v801
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
    function advancedPathfind(p810, p811)
        if not (Character and Character:FindFirstChild("HumanoidRootPart")) then
            return nil
        end
        if not (p810 and p810.Character) then
            return nil
        end
        local v812 = p810.Character:FindFirstChild("HumanoidRootPart")
        if not v812 then
            return nil
        end
        local vu813 = Character.HumanoidRootPart
        local v814 = tick()
        if not vu45 and (vu41 == p810 and v814 - vu42 < 0.5) then
            local v815 = (v812.Position - vu40.targetPosition).Magnitude
            local v816 = vu40.playerPosition and (vu813.Position - vu40.playerPosition).Magnitude or math.huge
            if v815 < 10 and v816 < 5 then
                return vu40.path
            end
        end
        local vu817 = v812.Position
        if p811 == "Combat Strafe" then
            local v818 = (vu817 - vu813.Position).Unit
            local v819 = v818:Cross(Vector3.new(0, 1, 0)).Unit * vu35 * 0.5
            vu817 = vu813.Position + v818 * vu35 + v819
        end
        local vu820 = PathfindingService:CreatePath({
            AgentRadius = 2,
            AgentHeight = 5,
            AgentCanJump = true,
            AgentCanClimb = false,
            WaypointSpacing = 4
        })
        local v821, _ = pcall(function()
            vu820:ComputeAsync(vu813.Position, vu817)
        end)
        if not v821 or vu820.Status ~= Enum.PathStatus.Success then
            return nil
        end
        local v822 = vu820
        local v823 = vu820.GetWaypoints(v822)
        local v824, v825, v826 = ipairs(v823)
        local v827 = {}
        while true do
            local v828
            v826, v828 = v824(v825, v826)
            if v826 == nil then
                break
            end
            if p811 == "Aggressive Push" and (1 < v826 and (v826 < # v823 and v826 % 2 == 0)) then
                local v829 = Vector3.new(math.random(- 3, 3), 0, math.random(- 3, 3))
                table.insert(v827, {
                    Position = v828.Position + v829,
                    Action = v828.Action
                })
            else
                table.insert(v827, {
                    Position = v828.Position,
                    Action = v828.Action
                })
            end
        end
        vu40 = {
            path = v827,
            targetPosition = v812.Position,
            playerPosition = vu813.Position
        }
        vu41 = p810
        vu42 = v814
        return v827
    end
    function updateAIState()
        if vu585 and vu585.Character then
            if Character and Character:FindFirstChild("HumanoidRootPart") then
                local v830 = vu585.Character:FindFirstChild("HumanoidRootPart")
                if v830 then
                    local v831 = Character.HumanoidRootPart
                    local v832 = (v830.Position - v831.Position).Magnitude
                    local v833 = isPlayerInView(vu585)
                    if v832 >= vu35 then
                        if v832 >= vu34 then
                            vu29 = "IDLE"
                        else
                            vu29 = "ENGAGE"
                        end
                    elseif v833 then
                        vu29 = "STRAFE"
                    else
                        vu29 = "ENGAGE"
                    end
                else
                    vu29 = "IDLE"
                end
            else
                vu29 = "IDLE"
                return
            end
        else
            vu29 = "IDLE"
            return
        end
    end
    function trackTargetCamera(p834)
        if not (p834 and p834.Character) then
            return
        end
        local v835 = false
        if Backpack then
            local v836, v837, v838 = ipairs(Backpack:GetChildren())
            while true do
                local v839
                v838, v839 = v836(v837, v838)
                if v838 == nil then
                    break
                end
                if v839:IsA("Tool") and v839:FindFirstChildOfClass("Sound", true) then
                    v835 = true
                    break
                end
            end
        end
        if not v835 and Character then
            local v840, v841, v842 = ipairs(Character:GetChildren())
            while true do
                local v843
                v842, v843 = v840(v841, v842)
                if v842 == nil then
                    break
                end
                if v843:IsA("Tool") and v843:FindFirstChildOfClass("Sound", true) then
                    v835 = true
                    break
                end
            end
        end
        if v835 then
            local v844 = p834.Character:FindFirstChild(TargetPart) or p834.Character:FindFirstChild("Head")
            if v844 then
                local _, v845 = Camera:WorldToScreenPoint(v844.Position)
                if v845 then
                    if not AimbotEnabled then
                        AimbotEnabled = true
                        startAimbot()
                        vu44 = true
                    end
                else
                    local v846 = CFrame.new(Camera.CFrame.Position, v844.Position)
                    if AimbotSmoothness <= 0 then
                        Camera.CFrame = v846
                    else
                        Camera.CFrame = Camera.CFrame:Lerp(v846, 1 / (AimbotSmoothness * 2))
                    end
                end
            end
        else
            if vu44 and AimbotEnabled then
                AimbotEnabled = false
                stopAimbot()
                vu44 = false
            end
            return
        end
    end
    function cleanupAIDebug()
        local v847, v848, v849 = pairs(vu37)
        while true do
            local v850
            v849, v850 = v847(v848, v849)
            if v849 == nil then
                break
            end
            if v850 and v850.Remove then
                v850:Remove()
            end
        end
        vu37 = {}
    end
    function updateAIDebug()
        if vu32 then
            cleanupAIDebug()
            if Character and Character:FindFirstChild("HumanoidRootPart") then
                local v851 = Character.HumanoidRootPart
                local v852, v853 = Camera:WorldToScreenPoint(v851.Position)
                if v853 then
                    local v854 = Drawing.new("Text")
                    v854.Text = "AI State: " .. vu29
                    v854.Size = 16
                    v854.Center = true
                    v854.Outline = true
                    v854.Color = Color3.fromRGB(255, 255, 255)
                    v854.Position = Vector2.new(v852.X, v852.Y - 30)
                    v854.Font = 2
                    table.insert(vu37, v854)
                    if vu31 > 0 then
                        local v855 = Drawing.new("Text")
                        v855.Text = string.format("Exposure: %.0f%%", vu31 * 100)
                        v855.Size = 14
                        v855.Center = true
                        v855.Outline = true
                        v855.Color = Color3.fromRGB(255, 255, 255)
                        v855.Position = Vector2.new(v852.X, v852.Y - 15)
                        v855.Font = 2
                        table.insert(vu37, v855)
                    end
                end
                local v856 = vu585 and vu585.Character and vu585.Character:FindFirstChild("HumanoidRootPart")
                if v856 then
                    local v857, v858 = Camera:WorldToScreenPoint(v856.Position)
                    local v859, v860 = Camera:WorldToScreenPoint(v851.Position)
                    if v858 and v860 then
                        local v861 = Drawing.new("Line")
                        v861.From = Vector2.new(v859.X, v859.Y)
                        v861.To = Vector2.new(v857.X, v857.Y)
                        v861.Color = Color3.fromRGB(255, 0, 0)
                        v861.Thickness = 2
                        v861.Transparency = 0.5
                        table.insert(vu37, v861)
                    end
                end
                if vu724 and # vu724 > 0 then
                    local v862, v863, v864 = ipairs(vu724)
                    local v865 = nil
                    while true do
                        local v866
                        v864, v866 = v862(v863, v864)
                        if v864 == nil then
                            break
                        end
                        local v867, v868 = Camera:WorldToScreenPoint(v866.Position)
                        if v868 then
                            local v869 = v867.X
                            local v870 = v867.Y
                            local v871 = 3
                            for v872 = 0, math.pi * 2, math.pi / 4 do
                                local v873 = v869 + math.cos(v872) * v871
                                local v874 = v870 + math.sin(v872) * v871
                                local v875 = v869 + math.cos(v872 + math.pi / 4) * v871
                                local v876 = v870 + math.sin(v872 + math.pi / 4) * v871
                                local v877 = Drawing.new("Line")
                                v877.From = Vector2.new(v873, v874)
                                v877.To = Vector2.new(v875, v876)
                                v877.Color = Color3.fromRGB(0, 255, 0)
                                v877.Thickness = 2
                                v877.Transparency = 0
                                table.insert(vu37, v877)
                            end
                            if v865 then
                                local v878 = Drawing.new("Line")
                                v878.From = v865
                                v878.To = Vector2.new(v867.X, v867.Y)
                                v878.Color = Color3.fromRGB(255, 255, 0)
                                v878.Thickness = 1
                                v878.Transparency = 0.7
                                table.insert(vu37, v878)
                            end
                            v865 = Vector2.new(v867.X, v867.Y)
                        end
                    end
                end
                if vu38 and vu38.coverPosition then
                    local v879, v880 = Camera:WorldToScreenPoint(vu38.coverPosition)
                    if v880 then
                        local v881 = v879.X
                        local v882 = v879.Y
                        local v883 = 5
                        local v884 = {
                            {
                                Vector2.new(v881 - v883, v882 - v883),
                                Vector2.new(v881 + v883, v882 - v883)
                            },
                            {
                                Vector2.new(v881 + v883, v882 - v883),
                                Vector2.new(v881 + v883, v882 + v883)
                            },
                            {
                                Vector2.new(v881 + v883, v882 + v883),
                                Vector2.new(v881 - v883, v882 + v883)
                            },
                            {
                                Vector2.new(v881 - v883, v882 + v883),
                                Vector2.new(v881 - v883, v882 - v883)
                            }
                        }
                        local v885, v886, v887 = ipairs(v884)
                        while true do
                            local v888
                            v887, v888 = v885(v886, v887)
                            if v887 == nil then
                                break
                            end
                            local v889 = Drawing.new("Line")
                            v889.From = v888[1]
                            v889.To = v888[2]
                            v889.Color = Color3.fromRGB(0, 0, 255)
                            v889.Thickness = 2
                            v889.Transparency = 0
                            table.insert(vu37, v889)
                        end
                    end
                end
            end
        else
            cleanupAIDebug()
            return
        end
    end
    function startAI()
        if not vu721 then
            vu721 = task.spawn(function()
                while true do
                    while true do
                        if not vu589 then
                            cleanupAIDebug()
                            vu724 = nil
                            vu725 = 1
                            vu773 = nil
                            vu727 = 0
                            local v890 = Character and (Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChildOfClass("Humanoid"))
                            if v890 then
                                v890:MoveTo(Character.HumanoidRootPart.Position)
                            end
                            vu721 = nil
                            return
                        end
                        if not (Character and Character:FindFirstChild("HumanoidRootPart")) then
                            break
                        end
                        local v891 = Character:FindFirstChildOfClass("Humanoid")
                        local v892 = Character.HumanoidRootPart
                        if v891 then
                            local v893, v894, v895 = ipairs(Backpack:GetChildren())
                            local v896 = false
                            local v897 = false
                            while true do
                                local v898
                                v895, v898 = v893(v894, v895)
                                if v895 == nil then
                                    break
                                end
                                if v898:IsA("Tool") then
                                    if v898:FindFirstChild("Fire", true) then
                                        v896 = true
                                    elseif v898:FindFirstChild("ThrowSound", true) then
                                        v897 = true
                                    end
                                end
                            end
                            if Character then
                                local v899, v900, v901 = ipairs(Character:GetChildren())
                                while true do
                                    local v902
                                    v901, v902 = v899(v900, v901)
                                    if v901 == nil then
                                        break
                                    end
                                    if v902:IsA("Tool") then
                                        if v902:FindFirstChild("Fire", true) then
                                            v896 = true
                                        elseif v902:FindFirstChild("ThrowSound", true) then
                                            v897 = true
                                        end
                                    end
                                end
                            end
                            if v896 or v897 then
                                local v903, v904 = getOptimalTarget()
                                vu585 = v903
                                vu31 = v904
                                updateAIState()
                                local v905 = tick()
                                local v906 = v892.Position
                                if vu728 then
                                    if v905 - vu729 > 2 then
                                        if (v906 - vu728).Magnitude >= 2 then
                                            vu730 = 0
                                        else
                                            vu730 = vu730 + 1
                                            if vu730 >= 2 then
                                                v891.Jump = true
                                                vu774 = v905
                                                vu730 = 0
                                                vu724 = nil
                                                vu725 = 1
                                            end
                                        end
                                        vu728 = v906
                                        vu729 = v905
                                    end
                                else
                                    vu728 = v906
                                    vu729 = v905
                                end
                                if vu29 == "IDLE" then
                                    if v903 then
                                        v891:MoveTo(v903.Character.HumanoidRootPart.Position)
                                        rotateCharacterToTarget(v903)
                                    else
                                        v891:MoveTo(v892.Position)
                                    end
                                end
                                if vu29 ~= "ENGAGE" then
                                    if vu29 == "STRAFE" and v903 then
                                        trackTargetCamera(v903)
                                        rotateCharacterToTarget(v903)
                                        local v907 = v903.Character:FindFirstChild("HumanoidRootPart")
                                        if v907 then
                                            local v908 = (v907.Position - v892.Position).Unit
                                            local v909 = v908:Cross(Vector3.new(0, 1, 0)).Unit
                                            local v910 = Vector3.new(0, 0, 0)
                                            if vu33 ~= "Serpentine" then
                                                if vu33 == "Zigzag" then
                                                    if v905 - vu722 > 0.5 then
                                                        vu723 = vu723 * - 1
                                                        vu722 = v905
                                                    end
                                                    v910 = v909 * vu723 * 3
                                                end
                                            else
                                                vu726 = vu726 + 0.1
                                                v910 = v909 * (math.sin(vu726 * 3) * 3)
                                            end
                                            local v911 = v892.Position + v908 * vu35 + v909 * math.sin(tick() * 2) * 5 + v910
                                            if v905 - vu775 > 0.2 then
                                                if checkObstacleAhead((v911 - v892.Position).Unit, 5) and v905 - vu774 > 0.5 then
                                                    v891.Jump = true
                                                    vu774 = v905
                                                end
                                                if checkTargetBlocked(v903) and v905 - vu774 > 0.5 then
                                                    v891.Jump = true
                                                    vu774 = v905
                                                end
                                                vu775 = v905
                                            end
                                            if vu33 ~= "Jump Spam" then
                                                if math.random() < 0.3 and v905 - vu774 > 1 then
                                                    v891.Jump = true
                                                    vu774 = v905
                                                end
                                            elseif (v907.Position - v892.Position).Magnitude >= 20 then
                                                if math.random() < 0.3 and v905 - vu774 > 0.5 then
                                                    v891.Jump = true
                                                    vu774 = v905
                                                end
                                            elseif v905 - vu774 > 0.15 then
                                                v891.Jump = true
                                                vu774 = v905
                                            end
                                            v891:MoveTo(v911)
                                        end
                                    end
                                    updateAIDebug()
                                    task.wait(vu36)
                                else
                                    if not v903 then
                                    end
                                    trackTargetCamera(v903)
                                    rotateCharacterToTarget(v903)
                                    local v912 = v903.Character:FindFirstChild("HumanoidRootPart")
                                    if v912 then
                                        local v913 = (v912.Position - v892.Position).Unit
                                        local v914 = tick()
                                        if v914 - vu775 > 0.2 then
                                            if checkObstacleAhead(v913, 5) and v914 - vu774 > 0.5 then
                                                v891:ChangeState(Enum.HumanoidStateType.Jumping)
                                                v891.Jump = true
                                                vu774 = v914
                                            end
                                            if checkTargetBlocked(v903) and v914 - vu774 > 0.5 then
                                                v891:ChangeState(Enum.HumanoidStateType.Jumping)
                                                v891.Jump = true
                                                vu774 = v914
                                            end
                                            vu775 = v914
                                        end
                                        if not vu724 or vu725 > # vu724 then
                                            local v915 = advancedPathfind(v903, "Aggressive Push")
                                            if v915 and # v915 > 0 then
                                                vu724 = v915
                                                vu725 = 1
                                                vu727 = tick()
                                            end
                                        end
                                        if vu724 and vu725 <= # vu724 then
                                            local v916 = vu724[vu725]
                                            if (v892.Position - v916.Position).Magnitude < 4 or tick() - vu727 > 4 then
                                                vu725 = vu725 + 1
                                                vu727 = tick()
                                                if vu725 <= # vu724 then
                                                    v916 = vu724[vu725]
                                                    local _ = (v892.Position - v916.Position).Magnitude
                                                end
                                            end
                                            if vu725 > # vu724 then
                                                v891:MoveTo(v912.Position)
                                            else
                                                local v917 = Vector3.new(0, 0, 0)
                                                if vu33 ~= "Zigzag" or vu725 % 2 ~= 0 then
                                                    if vu33 ~= "Serpentine" then
                                                        if vu33 == "Jump Spam" then
                                                            if (v912.Position - v892.Position).Magnitude >= 20 then
                                                                if math.random() < 0.3 and v914 - vu774 > 0.3 then
                                                                    v891.Jump = true
                                                                    vu774 = v914
                                                                end
                                                            elseif v914 - vu774 > 0.15 then
                                                                v891.Jump = true
                                                                vu774 = v914
                                                                vu723 = vu723 * - 1
                                                                v917 = (v912.Position - v892.Position):Cross(Vector3.new(0, 1, 0)).Unit * vu723 * 8
                                                            end
                                                        end
                                                    else
                                                        vu726 = vu726 + 0.1
                                                        v917 = (v912.Position - v892.Position):Cross(Vector3.new(0, 1, 0)).Unit * (math.sin(vu726 * 3) * 3)
                                                    end
                                                else
                                                    v917 = (v912.Position - v892.Position):Cross(Vector3.new(0, 1, 0)).Unit * vu723 * 3
                                                    if tick() - vu722 > 0.5 then
                                                        vu723 = vu723 * - 1
                                                        vu722 = tick()
                                                    end
                                                end
                                                if v916.Action == Enum.PathWaypointAction.Jump and v914 - vu774 > 0.3 then
                                                    v891.Jump = true
                                                    vu774 = v914
                                                end
                                                local v918 = (v916.Position - v892.Position).Unit
                                                if checkObstacleAhead(v918, 3) and v914 - vu774 > 0.3 then
                                                    v891.Jump = true
                                                    vu774 = v914
                                                end
                                                v891:MoveTo(v916.Position + v917)
                                            end
                                        else
                                            v891:MoveTo(v912.Position)
                                            if v914 - vu774 > 1 and math.random() < 0.4 then
                                                v891.Jump = true
                                                vu774 = v914
                                            end
                                        end
                                    end
                                    task.wait(vu36)
                                end
                            else
                                task.wait(1)
                            end
                        else
                            task.wait(1)
                        end
                    end
                    task.wait(1)
                end
            end)
        end
    end
    function stopAI()
        vu589 = false
        local v919 = Character and (Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChildOfClass("Humanoid"))
        if v919 then
            v919:MoveTo(Character.HumanoidRootPart.Position)
        end
        cleanupAIDebug()
        if vu721 then
            vu721 = nil
        end
        if vu44 and AimbotEnabled then
            AimbotEnabled = false
            stopAimbot()
        end
    end
    local vu920 = nil
    local vu921 = game:GetService("TextChatService")
    local vu922 = {
        "gg",
        "ggs",
        "ez",
        "ez kid",
        "gg ez",
        "w",
        "l",
        "w game",
        "alo",
        "ez clap",
        "mid",
        "nah",
        "fr",
        "ok",
        "bro",
        "nice",
        "trash",
        "ggg",
        "gggg",
        "ggggg",
        "ezpz",
        "w bro",
        "nah ggs",
        "no diff",
        "bad",
        "ez win",
        "ok bro",
        "get good",
        "skill issue",
        "we up",
        "ez dub",
        "too easy",
        "u tried",
        "bro lost",
        "try again",
        "keep crying",
        "ez game",
        "so free",
        "gg newgen",
        "light work",
        "free win",
        "get better",
        "so mid",
        "no way",
        "lost lol",
        "nah bro",
        "good game",
        "gg ez bro",
        "ez w",
        "ok ggs"
    }
    function startAutoAds()
        if not vu920 then
            vu920 = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("OnMatchFinished").OnClientEvent:Connect(function()
                task.spawn(function()
                    if vu46 then
                        task.wait(2)
                        pcall(function()
                            game:GetService("ReplicatedStorage"):WaitForChild("Ads"):WaitForChild("Remotes"):WaitForChild("DoubleMatchGemsAd"):FireServer()
                        end)
                    end
                    if vu14 and math.random(1, 100) <= vu16 then
                        task.wait(5)
                        local vu923
                        if vu15 ~= "Random" then
                            vu923 = vu15
                        else
                            vu923 = vu922[math.random(1, # vu922)]
                        end
                        pcall(function()
                            vu921.TextChannels.RBXGeneral:SendAsync(vu923)
                        end)
                    end
                    if AutoFarmEnabled then
                        task.wait(3)
                        vu587()
                    end
                end)
            end)
        end
    end
    function stopAutoAds()
        if vu920 then
            vu920:Disconnect()
            vu920 = nil
        end
    end
    local vu924 = nil
    function startNoClip()
        if not vu924 then
            vu924 = RunService.Stepped:Connect(function()
                if vu50 then
                    if Character then
                        local v925, v926, v927 = ipairs(Character:GetDescendants())
                        while true do
                            local v928
                            v927, v928 = v925(v926, v927)
                            if v927 == nil then
                                break
                            end
                            if v928:IsA("BasePart") then
                                v928.CanCollide = false
                            end
                        end
                    end
                else
                    return
                end
            end)
        end
    end
    function stopNoClip()
        if vu924 then
            vu924:Disconnect()
            vu924 = nil
        end
        if Character then
            local v929, v930, v931 = ipairs(Character:GetDescendants())
            while true do
                local v932
                v931, v932 = v929(v930, v931)
                if v931 == nil then
                    break
                end
                if v932:IsA("BasePart") and v932.Name ~= "HumanoidRootPart" then
                    v932.CanCollide = true
                end
            end
        end
    end
    function isInGame()
        if not Backpack then
            return false
        end
        local v933, v934, v935 = ipairs(Backpack:GetChildren())
        while true do
            local v936
            v935, v936 = v933(v934, v935)
            if v935 == nil then
                break
            end
            if v936:IsA("Tool") and v936:FindFirstChildOfClass("Sound", true) then
                return true
            end
        end
        if Character then
            local v937, v938, v939 = ipairs(Character:GetChildren())
            while true do
                local v940
                v939, v940 = v937(v938, v939)
                if v939 == nil then
                    break
                end
                if v940:IsA("Tool") and v940:FindFirstChildOfClass("Sound", true) then
                    return true
                end
            end
        end
        return false
    end
    local v941 = Character:FindFirstChildOfClass("Humanoid")
    if v941 then
        vu54 = v941.WalkSpeed
        vu55 = v941.JumpPower
    end
    disableBAC()
    disableScript("GunController")
    disableScript("KnifeController")
    customGunController()
    customKnifeController()
    local vu942 = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua"))()
    local v943 = vu942
    vu942.DefineTheme(v943, "Watermelon", {
        TitleAlign = Enum.TextXAlignment.Center,
        TextDisabled = Color3.fromRGB(120, 140, 130),
        Text = vu581.TextColor,
        FrameBg = vu581.LightContrast,
        FrameBgTransparency = 0.3,
        FrameBgActive = vu581.AccentGreen,
        FrameBgTransparencyActive = 0.3,
        CheckMark = vu581.AccentPink,
        SliderGrab = vu581.AccentPink,
        ButtonsBg = vu581.AccentGreen,
        CollapsingHeaderBg = vu581.AccentGreen,
        CollapsingHeaderText = vu581.TextColor,
        RadioButtonHoveredBg = vu581.AccentPink,
        WindowBg = vu581.Background,
        TitleBarBg = vu581.DarkContrast,
        TitleBarBgActive = vu581.Accent,
        Border = vu581.AccentGreen,
        ResizeGrab = vu581.AccentPink,
        RegionBgTransparency = 0.9
    })
    local v944 = vu942
    vu60 = vu942.Window(v944, {
        Title = "MSVD | Melon",
        Theme = "Watermelon",
        NoClose = true,
        Size = UDim2.new(0, 600, 0, 450)
    }):Center()
    local v945 = vu60
    local v946 = vu60.TabSelector(v945, {
        Size = UDim2.fromScale(1, 1)
    })
    local function v950(p947, p948)
        local v949 = p947:Region({
            Border = true,
            BorderColor = vu581.AccentGreen,
            BorderThickness = 1,
            CornerRadius = UDim.new(0, 5)
        })
        v949:Label({
            Text = p948,
            RichText = true
        })
        return v949
    end
    local v951 = v946:CreateTab({
        Name = "Combat"
    })
    local v952 = v951:List({
        HorizontalFlex = Enum.UIFlexAlignment.Fill,
        UiPadding = 5,
        Spacing = 10
    })
    local v953 = v950(v952, "Combat Features")
    vu66.KillAllCooldown = v953:SliderFloat({
        Label = "Kill All Cooldown",
        Value = vu567,
        Minimum = 0.01,
        Maximum = 2,
        IniFlag = "KillAllCooldown",
        Callback = function(_, p954)
            vu567 = p954
        end
    })
    v953:Button({
        Text = "Kill All (Instant)",
        Callback = function()
            killAll()
        end
    })
    vu66.LoopKillAll = v953:Checkbox({
        Label = "Loop Kill All",
        Value = LoopKillAllEnabled,
        IniFlag = "LoopKillAll",
        Callback = function(_, p955)
            LoopKillAllEnabled = p955
            if p955 then
                startLoopKillAll()
            else
                stopLoopKillAll()
            end
        end
    })
    v953:Separator()
    vu66.AutoFire = v953:Checkbox({
        Label = "Auto Fire",
        Value = AutoFireEnabled,
        IniFlag = "AutoFire",
        Callback = function(_, p956)
            AutoFireEnabled = p956
            if p956 then
                startAutoFire()
            else
                stopAutoFire()
            end
        end
    })
    vu66.AutoFireMode = v953:Combo({
        Label = "Fire Mode",
        Items = {
            "Auto Shoot",
            "Auto Throw"
        },
        Selected = "Auto Shoot",
        IniFlag = "AutoFireMode",
        Callback = function(_, p957)
            AutoFireMode = p957
        end
    })
    AutoFireMode = "Auto Shoot"
    vu66.DetectionMode = v953:Combo({
        Label = "Mode",
        Items = {
            "Camera",
            "Raycast",
            "Both"
        },
        Selected = "Both",
        IniFlag = "DetectionMode",
        Callback = function(_, p958)
            DetectionMode = p958
        end
    })
    DetectionMode = "Both"
    vu66.AutoShootCooldown = v953:SliderFloat({
        Label = "Cooldown",
        Value = vu575,
        Minimum = 0.1,
        Maximum = 20,
        IniFlag = "AutoShootCooldown",
        Callback = function(_, p959)
            vu575 = p959
        end
    })
    vu66.HitChance = v953:SliderInt({
        Label = "Hit Chance (%)",
        Value = vu572,
        Minimum = 0,
        Maximum = 100,
        IniFlag = "HitChance",
        Callback = function(_, p960)
            vu572 = p960
        end
    })
    vu66.MissOffset = v953:SliderFloat({
        Label = "Miss Offset (studs)",
        Value = vu574,
        Minimum = 1,
        Maximum = 10,
        IniFlag = "MissOffset",
        Callback = function(_, p961)
            vu574 = p961
        end
    })
    vu66.TargetPart = v953:Combo({
        Label = "Target Part",
        Items = {
            "Head",
            "UpperTorso",
            "LowerTorso",
            "HumanoidRootPart"
        },
        Selected = "Head",
        IniFlag = "TargetPart",
        Callback = function(_, p962)
            TargetPart = p962
        end
    })
    TargetPart = "Head"
    v953:Separator()
    vu66.AutoStab = v953:Checkbox({
        Label = "Auto Stab",
        Value = AutoStabEnabled,
        IniFlag = "AutoStab",
        Callback = function(_, p963)
            AutoStabEnabled = p963
            if p963 then
                startAutoStab()
            else
                stopAutoStab()
            end
        end
    })
    vu66.AutoStabRange = v953:SliderInt({
        Label = "Range",
        Value = AutoStabRange,
        Minimum = 5,
        Maximum = 30,
        IniFlag = "AutoStabRange",
        Callback = function(_, p964)
            AutoStabRange = p964
        end
    })
    vu66.AutoStabCooldown = v953:SliderFloat({
        Label = "Cooldown",
        Value = vu566,
        Minimum = 0.1,
        Maximum = 2,
        IniFlag = "AutoStabCooldown",
        Callback = function(_, p965)
            vu566 = p965
        end
    })
    v953:Separator()
    vu66.TeamCheck = v953:Checkbox({
        Label = "Team Check",
        Value = TeamCheckEnabled,
        IniFlag = "TeamCheck",
        Callback = function(_, p966)
            TeamCheckEnabled = p966
        end
    })
    vu66.WallHacks = v953:Checkbox({
        Label = "Wall Hacks (Guns)",
        Value = WallHacksEnabled,
        IniFlag = "WallHacks",
        Callback = function(_, p967)
            WallHacksEnabled = p967
        end
    })
    vu66.GunCooldownBypass = v953:Checkbox({
        Label = "No Cooldown",
        Value = GunCooldownBypass,
        IniFlag = "GunCooldownBypass",
        Callback = function(_, p968)
            GunCooldownBypass = p968
        end
    })
    v953:Separator()
    vu66.KnifeCooldownBypass = v953:Checkbox({
        Label = "No Cooldown",
        Value = KnifeCooldownBypass,
        IniFlag = "KnifeCooldownBypass",
        Callback = function(_, p969)
            KnifeCooldownBypass = p969
        end
    })
    local v970 = v950(v952, "Predictive Shooting")
    vu66.PredictiveShooting = v970:Checkbox({
        Label = "Enable Predictive Shooting",
        Value = vu17,
        IniFlag = "PredictiveShooting",
        Callback = function(_, p971)
            vu17 = p971
            if p971 then
                startPredictiveShooting()
            else
                stopPredictiveShooting()
            end
        end
    })
    vu66.MaxPredictionTime = v970:SliderFloat({
        Label = "Max Prediction Time",
        Value = vu18,
        Minimum = 0.1,
        Maximum = 2,
        IniFlag = "MaxPredictionTime",
        Callback = function(_, p972)
            vu18 = p972
        end
    })
    vu66.BulletTravelTime = v970:SliderFloat({
        Label = "Bullet Travel Time",
        Value = vu19,
        Minimum = 0.05,
        Maximum = 0.15,
        IniFlag = "BulletTravelTime",
        Callback = function(_, p973)
            vu19 = p973
        end
    })
    vu66.MinVelocityThreshold = v970:SliderInt({
        Label = "Min Velocity",
        Value = vu20,
        Minimum = 1,
        Maximum = 20,
        IniFlag = "MinVelocityThreshold",
        Callback = function(_, p974)
            vu20 = p974
        end
    })
    vu66.TrackingDuration = v970:SliderFloat({
        Label = "Tracking Duration",
        Value = vu21,
        Minimum = 0.1,
        Maximum = 2,
        IniFlag = "TrackingDuration",
        Callback = function(_, p975)
            vu21 = p975
        end
    })
    vu66.MinConfidence = v970:SliderInt({
        Label = "Min Confidence (%)",
        Value = vu22,
        Minimum = 0,
        Maximum = 100,
        IniFlag = "MinConfidence",
        Callback = function(_, p976)
            vu22 = p976
        end
    })
    vu66.PredictiveAutoEquip = v970:Checkbox({
        Label = "Auto Equip Gun",
        Value = vu23,
        IniFlag = "PredictiveAutoEquip",
        Callback = function(_, p977)
            vu23 = p977
        end
    })
    vu66.PredictiveDebug = v970:Checkbox({
        Label = "Show Prediction Debug",
        Value = vu24,
        IniFlag = "PredictiveDebug",
        Callback = function(_, p978)
            vu24 = p978
        end
    })
    v970:Separator()
    vu66.PredictiveStatusLabel = v970:Label({
        Text = "Status: Disabled",
        RichText = true
    })
    RunService.Heartbeat:Connect(function()
        if vu66.PredictiveStatusLabel then
            vu66.PredictiveStatusLabel.Text = "Status: " .. vu28
        end
    end)
    local v979 = v950(v952, "Aim Assist")
    vu66.Aimbot = v979:Checkbox({
        Label = "Aimbot",
        Value = AimbotEnabled,
        IniFlag = "Aimbot",
        Callback = function(_, p980)
            AimbotEnabled = p980
            if p980 then
                startAimbot()
            else
                stopAimbot()
            end
        end
    })
    vu66.AimbotSmoothness = v979:SliderFloat({
        Label = "Smoothness",
        Value = AimbotSmoothness,
        Minimum = 0,
        Maximum = 20,
        IniFlag = "AimbotSmoothness",
        Callback = function(_, p981)
            AimbotSmoothness = p981
        end
    })
    vu66.SilentAim = v979:Checkbox({
        Label = "Silent Aim",
        Value = SilentAimEnabled,
        IniFlag = "SilentAim",
        Callback = function(_, p982)
            SilentAimEnabled = p982
        end
    })
    vu66.Triggerbot = v979:Checkbox({
        Label = "Triggerbot",
        Value = TriggerBotEnabled,
        IniFlag = "Triggerbot",
        Callback = function(_, p983)
            TriggerBotEnabled = p983
            if p983 then
                startTriggerbot()
            else
                stopTriggerbot()
            end
        end
    })
    vu66.TriggerbotRange = v979:SliderInt({
        Label = "Stab Range",
        Value = vu580,
        Minimum = 5,
        Maximum = 30,
        IniFlag = "TriggerbotRange",
        Callback = function(_, p984)
            vu580 = p984
        end
    })
    vu66.SilentAimFOV = v979:SliderInt({
        Label = "FOV Circle",
        Value = SilentAimFOV,
        Minimum = 20,
        Maximum = 500,
        IniFlag = "SilentAimFOV",
        Callback = function(_, p985)
            SilentAimFOV = p985
            if ShowFOVCircle then
                updateFOVCircle()
            end
        end
    })
    vu66.ShowFOVCircle = v979:Checkbox({
        Label = "Show FOV Circle",
        Value = ShowFOVCircle,
        IniFlag = "ShowFOVCircle",
        Callback = function(_, p986)
            ShowFOVCircle = p986
            updateFOVCircle()
        end
    })
    local v987 = v946:CreateTab({
        Name = "Automation"
    }):List({
        HorizontalFlex = Enum.UIFlexAlignment.Fill,
        UiPadding = 5,
        Spacing = 10
    })
    local v988 = v950(v987, "Auto Queue")
    vu66.AutoFarm = v988:Checkbox({
        Label = "Enable Auto Queue",
        Value = AutoFarmEnabled,
        IniFlag = "AutoFarm",
        Callback = function(_, p989)
            AutoFarmEnabled = p989
            if p989 then
                startAutoFarm()
            else
                stopAutoFarm()
            end
        end
    })
    vu66.RingType = v988:Combo({
        Label = "Gamemode",
        Items = {
            "1v1",
            "2v2",
            "3v3",
            "4v4"
        },
        Selected = "1v1",
        IniFlag = "RingType",
        Callback = function(_, p990)
            DesiredRingType = p990
        end
    })
    DesiredRingType = "1v1"
    vu66.CheckInterval = v988:SliderInt({
        Label = "Retry Interval (seconds)",
        Value = vu568,
        Minimum = 1,
        Maximum = 10,
        IniFlag = "CheckInterval",
        Callback = function(_, p991)
            vu568 = p991
        end
    })
    vu66.AntiAFK = v988:Checkbox({
        Label = "Anti-AFK",
        Value = AntiAFKEnabled,
        IniFlag = "AntiAFK",
        Callback = function(_, p992)
            AntiAFKEnabled = p992
        end
    })
    v988:Separator()
    vu66.QueueStatusLabel = v988:Label({
        Text = "Status: Idle",
        RichText = true
    })
    RunService.Heartbeat:Connect(function()
        if vu66.QueueStatusLabel then
            vu66.QueueStatusLabel.Text = "Status: " .. QueueStatus
        end
    end)
    local v993 = v950(v987, "End Game Messages")
    vu66.EndGameMessageEnabled = v993:Checkbox({
        Label = "Message At End",
        Value = vu14,
        IniFlag = "EndGameMessageEnabled",
        Callback = function(_, p994)
            vu14 = p994
        end
    })
    vu66.EndGameMessage = v993:Combo({
        Label = "Message",
        Items = {
            "Random",
            "gg",
            "ggs",
            "ez",
            "ez kid",
            "gg ez",
            "w",
            "l",
            "w game",
            "alo",
            "ez clap",
            "mid",
            "nah",
            "fr",
            "ok",
            "bro",
            "nice",
            "trash",
            "ggg",
            "gggg",
            "ggggg",
            "ezpz",
            "w bro",
            "nah ggs",
            "no diff",
            "bad",
            "ez win",
            "ok bro",
            "get good",
            "skill issue",
            "we up",
            "ez dub",
            "too easy",
            "u tried",
            "bro lost",
            "try again",
            "keep crying",
            "ez game",
            "so free",
            "gg newgen",
            "light work",
            "free win",
            "get better",
            "so mid",
            "no way",
            "lost lol",
            "nah bro",
            "good game",
            "gg ez bro",
            "ez w",
            "ok ggs"
        },
        Selected = "Random",
        IniFlag = "EndGameMessage",
        Callback = function(_, p995)
            vu15 = p995
        end
    })
    local _ = "Random"
    vu66.EndGameMessageChance = v993:SliderInt({
        Label = "Message Chance (%)",
        Value = vu16,
        Minimum = 1,
        Maximum = 100,
        IniFlag = "EndGameMessageChance",
        Callback = function(_, p996)
            vu16 = p996
        end
    })
    local v997 = v950(v987, "AI Pathfinding")
    vu66.AI = v997:Checkbox({
        Label = "Enable AI",
        Value = vu589,
        IniFlag = "AI",
        Callback = function(_, p998)
            vu589 = p998
            if p998 then
                startAI()
            else
                stopAI()
            end
        end
    })
    vu66.AIDebug = v997:Checkbox({
        Label = "AI Debug Mode",
        Value = vu32,
        IniFlag = "AIDebug",
        Callback = function(_, p999)
            vu32 = p999
        end
    })
    vu66.AIDodgePattern = v997:Combo({
        Label = "Dodge Pattern",
        Items = {
            "Zigzag",
            "Serpentine",
            "Jump Spam",
            "Random"
        },
        Selected = "Zigzag",
        IniFlag = "AIDodgePattern",
        Callback = function(_, p1000)
            vu33 = p1000
        end
    })
    local _ = "Zigzag"
    vu66.AIEngageDistance = v997:SliderInt({
        Label = "Engage Distance",
        Value = vu34,
        Minimum = 50,
        Maximum = 300,
        IniFlag = "AIEngageDistance",
        Callback = function(_, p1001)
            vu34 = p1001
        end
    })
    vu66.AIOptimalRange = v997:SliderInt({
        Label = "Optimal Range",
        Value = vu35,
        Minimum = 10,
        Maximum = 50,
        IniFlag = "AIOptimalRange",
        Callback = function(_, p1002)
            vu35 = p1002
        end
    })
    vu66.AIUpdateRate = v997:SliderFloat({
        Label = "Update Rate",
        Value = vu36,
        Minimum = 0.05,
        Maximum = 0.5,
        IniFlag = "AIUpdateRate",
        Callback = function(_, p1003)
            vu36 = p1003
        end
    })
    vu66.AINewPath = v997:Checkbox({
        Label = "New Path (Random Paths)",
        Value = vu45,
        IniFlag = "AINewPath",
        Callback = function(_, p1004)
            vu45 = p1004
        end
    })
    local v1005 = v946:CreateTab({
        Name = "Visual"
    }):List({
        HorizontalFlex = Enum.UIFlexAlignment.Fill,
        UiPadding = 5,
        Spacing = 10
    })
    local v1006 = v950(v1005, "ESP Settings")
    vu66.ESP = v1006:Checkbox({
        Label = "Enable ESP",
        Value = ESPEnabled,
        IniFlag = "ESP",
        Callback = function(_, p1007)
            ESPEnabled = p1007
            updateESP()
        end
    })
    vu66.ESPTeamCheck = v1006:Checkbox({
        Label = "Team Check (Enemies Only)",
        Value = ESPTeamCheckEnabled,
        IniFlag = "ESPTeamCheck",
        Callback = function(_, p1008)
            ESPTeamCheckEnabled = p1008
            updateESP()
        end
    })
    vu66.RainbowMode = v1006:Checkbox({
        Label = "Rainbow Mode",
        Value = RainbowModeEnabled,
        IniFlag = "RainbowMode",
        Callback = function(_, p1009)
            RainbowModeEnabled = p1009
        end
    })
    vu66.ESPUpdateMode = v1006:Combo({
        Label = "Mode",
        Items = {
            "RenderStepped",
            "Stepped",
            "Heartbeat"
        },
        Selected = "Heartbeat",
        IniFlag = "ESPUpdateMode",
        Callback = function(_, p1010)
            ESPUpdateMode = p1010
            startESPLoop()
        end
    })
    ESPUpdateMode = "Heartbeat"
    v1006:Separator()
    vu66.ESPShowBoxes = v1006:Checkbox({
        Label = "Show Boxes",
        Value = ESPShowBoxes,
        IniFlag = "ESPShowBoxes",
        Callback = function(_, p1011)
            ESPShowBoxes = p1011
            updateESP()
        end
    })
    vu66.ESPBoxColor = v1006:SliderColor3({
        Label = "Box Color",
        Value = vu565,
        IniFlag = "ESPBoxColor",
        Callback = function(_, p1012)
            vu565 = p1012
        end
    })
    v1006:Separator()
    vu66.ESPShowSkeleton = v1006:Checkbox({
        Label = "Show Skeleton",
        Value = ESPShowSkeleton,
        IniFlag = "ESPShowSkeleton",
        Callback = function(_, p1013)
            ESPShowSkeleton = p1013
            updateESP()
        end
    })
    vu66.ESPSkeletonColor = v1006:SliderColor3({
        Label = "Skeleton Color",
        Value = vu571,
        IniFlag = "ESPSkeletonColor",
        Callback = function(_, p1014)
            vu571 = p1014
        end
    })
    v1006:Separator()
    vu66.ESPShowSnaplines = v1006:Checkbox({
        Label = "Show Snaplines",
        Value = ESPShowSnaplines,
        IniFlag = "ESPShowSnaplines",
        Callback = function(_, p1015)
            ESPShowSnaplines = p1015
        end
    })
    vu66.ESPSnaplineColor = v1006:SliderColor3({
        Label = "Snapline Color",
        Value = vu573,
        IniFlag = "ESPSnaplineColor",
        Callback = function(_, p1016)
            vu573 = p1016
        end
    })
    v1006:Separator()
    vu66.ESPShowName = v1006:Checkbox({
        Label = "Show Names",
        Value = ESPShowName,
        IniFlag = "ESPShowName",
        Callback = function(_, p1017)
            ESPShowName = p1017
            updateESP()
        end
    })
    vu66.ESPShowHealth = v1006:Checkbox({
        Label = "Show Health",
        Value = ESPShowHealth,
        IniFlag = "ESPShowHealth",
        Callback = function(_, p1018)
            ESPShowHealth = p1018
            updateESP()
        end
    })
    vu66.ESPShowDistance = v1006:Checkbox({
        Label = "Show Distance",
        Value = ESPShowDistance,
        IniFlag = "ESPShowDistance",
        Callback = function(_, p1019)
            ESPShowDistance = p1019
        end
    })
    vu66.ESPTextColor = v1006:SliderColor3({
        Label = "Text Color",
        Value = vu579,
        IniFlag = "ESPTextColor",
        Callback = function(_, p1020)
            vu579 = p1020
        end
    })
    local v1021 = v950(v1005, "Camera Settings")
    vu66.FOVChanger = v1021:SliderInt({
        Label = "Field of View (FOV)",
        Value = FOVChanger,
        Minimum = 30,
        Maximum = 120,
        IniFlag = "FOVChanger",
        Callback = function(_, p1022)
            FOVChanger = p1022
            updateFOV()
        end
    })
    v1021:Label({
        Text = "Adjust your camera\'s field of view",
        RichText = true
    })
    local v1023 = v946:CreateTab({
        Name = "Misc"
    }):List({
        HorizontalFlex = Enum.UIFlexAlignment.Fill,
        UiPadding = 5,
        Spacing = 10
    })
    local v1024 = v950(v1023, "Miscellaneous")
    vu66.Bhop = v1024:Checkbox({
        Label = "Bunny Hop (Auto)",
        Value = BhopEnabled,
        IniFlag = "Bhop",
        Callback = function(_, p1025)
            BhopEnabled = p1025
            if p1025 then
                startBhop()
            else
                stopBhop()
            end
        end
    })
    v1024:Separator()
    vu66.WalkSpeed = v1024:Checkbox({
        Label = "Custom WalkSpeed",
        Value = WalkSpeedEnabled,
        IniFlag = "WalkSpeed",
        Callback = function(_, p1026)
            WalkSpeedEnabled = p1026
            updateCharacterStats()
        end
    })
    vu66.WalkSpeedValue = v1024:SliderInt({
        Label = "WalkSpeed",
        Value = WalkSpeedValue,
        Minimum = 16,
        Maximum = 200,
        IniFlag = "WalkSpeedValue",
        Callback = function(_, p1027)
            WalkSpeedValue = p1027
            if WalkSpeedEnabled then
                updateCharacterStats()
            end
        end
    })
    vu66.JumpPower = v1024:Checkbox({
        Label = "Custom JumpPower",
        Value = JumpPowerEnabled,
        IniFlag = "JumpPower",
        Callback = function(_, p1028)
            JumpPowerEnabled = p1028
            updateCharacterStats()
        end
    })
    vu66.JumpPowerValue = v1024:SliderInt({
        Label = "JumpPower",
        Value = JumpPowerValue,
        Minimum = 50,
        Maximum = 300,
        IniFlag = "JumpPowerValue",
        Callback = function(_, p1029)
            JumpPowerValue = p1029
            if JumpPowerEnabled then
                updateCharacterStats()
            end
        end
    })
    v1024:Separator()
    vu66.Crosshair = v1024:Checkbox({
        Label = "Custom Crosshair",
        Value = vu584,
        IniFlag = "Crosshair",
        Callback = function(_, p1030)
            vu584 = p1030
            updateCrosshair()
        end
    })
    vu66.CrosshairType = v1024:Combo({
        Label = "Crosshair Type",
        Items = {
            "Cross",
            "Dot",
            "Circle"
        },
        Selected = "Cross",
        IniFlag = "CrosshairType",
        Callback = function(_, p1031)
            vu583 = p1031
            if vu584 then
                updateCrosshair()
            end
        end
    })
    vu2 = "Cross"
    vu66.CrosshairColor = v1024:SliderColor3({
        Label = "Crosshair Color",
        Value = vu578,
        IniFlag = "CrosshairColor",
        Callback = function(_, p1032)
            vu578 = p1032
            if vu584 then
                updateCrosshair()
            end
        end
    })
    vu66.CrosshairTransparency = v1024:SliderFloat({
        Label = "Crosshair Transparency",
        Value = vu582,
        Minimum = 0,
        Maximum = 1,
        IniFlag = "CrosshairTransparency",
        Callback = function(_, p1033)
            vu582 = p1033
            if vu584 then
                updateCrosshair()
            end
        end
    })
    vu66.CrosshairSize = v1024:SliderInt({
        Label = "Crosshair Size",
        Value = vu570,
        Minimum = 5,
        Maximum = 50,
        IniFlag = "CrosshairSize",
        Callback = function(_, p1034)
            vu570 = p1034
            if vu584 then
                updateCrosshair()
            end
        end
    })
    vu66.CrosshairThickness = v1024:SliderInt({
        Label = "Crosshair Thickness",
        Value = vu577,
        Minimum = 1,
        Maximum = 10,
        IniFlag = "CrosshairThickness",
        Callback = function(_, p1035)
            vu577 = p1035
            if vu584 then
                updateCrosshair()
            end
        end
    })
    v1024:Separator()
    vu66.SpinBot = v1024:Checkbox({
        Label = "Spin Bot",
        Value = SpinBotEnabled,
        IniFlag = "SpinBot",
        Callback = function(_, p1036)
            SpinBotEnabled = p1036
            if p1036 then
                startSpinBot()
            else
                stopSpinBot()
            end
        end
    })
    vu66.HeadScale = v1024:Checkbox({
        Label = "Big Head",
        Value = HeadScaleEnabled,
        IniFlag = "HeadScale",
        Callback = function(_, p1037)
            HeadScaleEnabled = p1037
            updateHeadScale()
        end
    })
    vu66.HeadScaleSize = v1024:SliderInt({
        Label = "Head Size",
        Value = HeadScaleSize,
        Minimum = 2,
        Maximum = 20,
        IniFlag = "HeadScaleSize",
        Callback = function(_, p1038)
            HeadScaleSize = p1038
            if HeadScaleEnabled then
                updateHeadScale()
            end
        end
    })
    v1024:Separator()
    vu66.NoClip = v1024:Checkbox({
        Label = "No Clip",
        Value = vu50,
        IniFlag = "NoClip",
        Callback = function(_, p1039)
            vu50 = p1039
            if p1039 then
                startNoClip()
            else
                stopNoClip()
            end
        end
    })
    v1024:Separator()
    vu66.AutoAds = v1024:Checkbox({
        Label = "Auto ADS (2x Rewards)",
        Value = vu46,
        IniFlag = "AutoAds",
        Callback = function(_, p1040)
            vu46 = p1040
            if p1040 then
                startAutoAds()
            else
                stopAutoAds()
            end
        end
    })
    v1024:Separator()
    vu66.OwnerLabel = v1024:Checkbox({
        Label = "Owner Label",
        Value = vu591,
        IniFlag = "OwnerLabel",
        Callback = function(_, p1041)
            vu591 = p1041
            if p1041 then
                checkForOwners()
            else
                local v1042, v1043, v1044 = pairs(vu569)
                while true do
                    local v1045
                    v1044, v1045 = v1042(v1043, v1044)
                    if v1044 == nil then
                        break
                    end
                    removeOwnerLabel(v1044)
                end
            end
        end
    })
    v1024:Separator()
    local v1046 = v950(v1023, "Server Rejoin")
    v1046:Button({
        Text = "Rejoin Random Server",
        Callback = function()
            rejoinRandomServer()
        end
    })
    v1046:Button({
        Text = "Rejoin Same Server",
        Callback = function()
            rejoinSameServer()
        end
    })
    local vu1047 = ""
    v1046:InputText({
        Label = "Custom JobId",
        Value = "",
        Callback = function(_, p1048)
            vu1047 = p1048
        end
    })
    v1046:Button({
        Text = "Rejoin from JobId",
        Callback = function()
            rejoinFromJobId(vu1047)
        end
    })
    v1046:Separator()
    v1046:Label({
        Text = "Current JobId: " .. game.JobId
    })
    local v1049 = v946:CreateTab({
        Name = "Keybinds"
    })
    KeybindsList1 = v1049:List({
        HorizontalFlex = Enum.UIFlexAlignment.Fill,
        UiPadding = 5,
        Spacing = 10
    })
    KeybindsList2 = v1049:List({
        HorizontalFlex = Enum.UIFlexAlignment.Fill,
        UiPadding = 5,
        Spacing = 10
    })
    local v1050 = v950(KeybindsList1, "Combat Keybinds")
    vu66.Keybind_AutoFire = v1050:Keybind({
        Label = "Auto Fire",
        Value = vu61.AutoFire,
        IniFlag = "Keybind_AutoFire",
        Callback = function(_, p1051)
            AutoFireEnabled = not AutoFireEnabled
            if AutoFireEnabled then
                startAutoFire()
            else
                stopAutoFire()
            end
            vu61.AutoFire = p1051
            if vu66.AutoFire then
                vu66.AutoFire:SetValue(AutoFireEnabled, true)
            end
        end
    })
    vu66.Keybind_AutoStab = v1050:Keybind({
        Label = "Auto Stab",
        Value = vu61.AutoStab,
        IniFlag = "Keybind_AutoStab",
        Callback = function(_, p1052)
            AutoStabEnabled = not AutoStabEnabled
            if AutoStabEnabled then
                startAutoStab()
            else
                stopAutoStab()
            end
            vu61.AutoStab = p1052
            if vu66.AutoStab then
                vu66.AutoStab:SetValue(AutoStabEnabled, true)
            end
        end
    })
    vu66.Keybind_WallHacks = v1050:Keybind({
        Label = "Wall Hacks",
        Value = vu61.WallHacks,
        IniFlag = "Keybind_WallHacks",
        Callback = function(_, p1053)
            WallHacksEnabled = not WallHacksEnabled
            vu61.WallHacks = p1053
            if vu66.WallHacks then
                vu66.WallHacks:SetValue(WallHacksEnabled, true)
            end
        end
    })
    local v1054 = v950(KeybindsList2, "Aim Keybinds")
    vu66.Keybind_Aimbot = v1054:Keybind({
        Label = "Aimbot",
        Value = vu61.Aimbot,
        IniFlag = "Keybind_Aimbot",
        Callback = function(_, p1055)
            AimbotEnabled = not AimbotEnabled
            if AimbotEnabled then
                startAimbot()
            else
                stopAimbot()
            end
            vu61.Aimbot = p1055
            if vu66.Aimbot then
                vu66.Aimbot:SetValue(AimbotEnabled, true)
            end
        end
    })
    vu66.Keybind_SilentAim = v1054:Keybind({
        Label = "Silent Aim",
        Value = vu61.SilentAim,
        IniFlag = "Keybind_SilentAim",
        Callback = function(_, p1056)
            SilentAimEnabled = not SilentAimEnabled
            vu61.SilentAim = p1056
            if vu66.SilentAim then
                vu66.SilentAim:SetValue(SilentAimEnabled, true)
            end
        end
    })
    vu66.Keybind_Triggerbot = v1054:Keybind({
        Label = "Triggerbot",
        Value = vu61.Triggerbot,
        IniFlag = "Keybind_Triggerbot",
        Callback = function(_, p1057)
            TriggerBotEnabled = not TriggerBotEnabled
            if TriggerBotEnabled then
                startTriggerbot()
            else
                stopTriggerbot()
            end
            vu61.Triggerbot = p1057
            if vu66.Triggerbot then
                vu66.Triggerbot:SetValue(TriggerBotEnabled, true)
            end
        end
    })
    vu66.Keybind_PredictiveShooting = v1054:Keybind({
        Label = "Predictive Shooting",
        Value = vu61.PredictiveShooting,
        IniFlag = "Keybind_PredictiveShooting",
        Callback = function(_, p1058)
            vu17 = not vu17
            if vu17 then
                startPredictiveShooting()
            else
                stopPredictiveShooting()
            end
            vu61.PredictiveShooting = p1058
            if vu66.PredictiveShooting then
                vu66.PredictiveShooting:SetValue(vu17, true)
            end
        end
    })
    local v1059 = v950(KeybindsList2, "Other Keybinds")
    vu66.Keybind_ESP = v1059:Keybind({
        Label = "ESP",
        Value = vu61.ESP,
        IniFlag = "Keybind_ESP",
        Callback = function(_, p1060)
            ESPEnabled = not ESPEnabled
            updateESP()
            vu61.ESP = p1060
            if vu66.ESP then
                vu66.ESP:SetValue(ESPEnabled, true)
            end
        end
    })
    vu66.Keybind_AutoFarm = v1059:Keybind({
        Label = "Auto Farm",
        Value = vu61.AutoFarm,
        IniFlag = "Keybind_AutoFarm",
        Callback = function(_, p1061)
            AutoFarmEnabled = not AutoFarmEnabled
            if AutoFarmEnabled then
                startAutoFarm()
            else
                stopAutoFarm()
            end
            vu61.AutoFarm = p1061
            if vu66.AutoFarm then
                vu66.AutoFarm:SetValue(AutoFarmEnabled, true)
            end
        end
    })
    vu66.Keybind_AI = v1059:Keybind({
        Label = "AI",
        Value = vu61.AI,
        IniFlag = "Keybind_AI",
        Callback = function(_, p1062)
            vu589 = not vu589
            if vu589 then
                startAI()
            else
                stopAI()
            end
            vu61.AI = p1062
            if vu66.AI then
                vu66.AI:SetValue(vu589, true)
            end
        end
    })
    v1059:Keybind({
        Label = "Toggle UI",
        Value = Enum.KeyCode.Insert,
        Callback = function(_, _)
            vu60:SetVisible(not vu60.Visible)
        end
    })
    local v1063 = v946:CreateTab({
        Name = "Config"
    }):List({
        HorizontalFlex = Enum.UIFlexAlignment.Fill,
        UiPadding = 5,
        Spacing = 10
    })
    local v1064 = v950(v1063, "Save Configuration")
    local v1065 = v950(v1063, "Load Configuration")
    local vu1066 = "default"
    local vu1067 = nil
    v1064:InputText({
        Label = "Config Name",
        Value = "Default_Config",
        Callback = function(_, p1068)
            vu1066 = p1068
        end
    })
    v1064:Button({
        Text = "Save Config",
        Callback = function()
            saveConfig(vu1066, vu942)
        end
    })
    vu66.ConfigDropdown = v1065:Combo({
        Label = "Select Config",
        Selected = 1,
        GetItems = function()
            return getConfigList()
        end,
        Callback = function(_, p1069)
            vu1067 = p1069
        end
    })
    v1065:Button({
        Text = "Load Selected Config",
        Callback = function()
            if vu1067 then
                loadConfig(vu1067, vu942)
            end
        end
    })
    v1065:Button({
        Text = "Delete Selected Config",
        Callback = function()
            if vu1067 and deleteConfig(vu1067) then
                vu1067 = nil
            end
        end
    })
    v1065:Separator()
    v1065:Button({
        Text = "Set as Auto-Load Config",
        Callback = function()
            if vu1067 then
                setAutoLoadConfig(vu1067)
            end
        end
    })
    v1065:Button({
        Text = "Clear Auto-Load",
        Callback = function()
            setAutoLoadConfig(nil)
        end
    })
    local vu1070 = v1065:Label({
        Text = "Auto-Load: None",
        RichText = true
    })
    RunService.Heartbeat:Connect(function()
        if vu1070 then
            local v1071 = getAutoLoadConfig()
            if v1071 then
                vu1070.Text = "Auto-Load: " .. v1071
            else
                vu1070.Text = "Auto-Load: None"
            end
        end
    end)
    v946:SetActiveTab(v951)
    local v1072 = getAutoLoadConfig()
    if v1072 and v1072 ~= "" then
        local v1073 = v576 .. "/" .. v1072 .. ".json"
        if isfile(v1073) then
            loadConfig(v1072, vu942)
        end
    end
    startAutoAds()
    checkForOwners()
    queue_on_teleport("\n    task.wait(5)\n    loadstring(game:HttpGet(\"https://github.com/officialmelon/Melon-Hub/raw/refs/heads/main/Games/Bloxd.io/MVSD/main.lua\"))()\n")
end