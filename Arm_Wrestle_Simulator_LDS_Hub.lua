repeat
	wait()
until game:IsLoaded()
local vu1 = getgenv()
local vu2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/refs/heads/main/Library"))()
local vu3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/refs/heads/main/AWSPETselector"))()
local v4 = vu2:start("Arm Wrestle Simulator", "18.5", true)
local v5 = v4:addTab("Halloween")
local v6 = v4:addTab("Auto Train")
local v7 = v4:addTab("Auto Boss")
local v8 = v4:addTab("Auto Egg")
local v9 = v4:addTab("Auto Arms")
local v10 = v4:addTab("Machines")
local v11 = v4:addTab("Auto Index")
local v12 = v4:addTab("Auto Merchant")
local v13 = v4:addTab("Auto Rebirth")
local v14 = v4:addTab("Auto Trials")
local v15 = v4:addTab("Auto Craft")
local v16 = v4:addTab("Inventory")
local v17 = v4:addTab("Auto Tower")
local v18 = v4:addTab("Auto Spin")
local v19 = v4:addTab("Misc Options")
cloneref(game:GetService("RunService"))
local vu20 = cloneref(game:GetService("Players").LocalPlayer)
local vu21 = cloneref(game:GetService("ReplicatedStorage"))
local vu22 = require(vu21.Packages.Knit)
local v23 = require(vu21.Data.LimitedMerchant)
function Char()
	-- upvalues: (ref) vu20
	return vu20.Character or vu20.CharacterAdded:Wait()
end
local _ = Char().Humanoid
local _ = Char().HumanoidRootPart
local vu24 = {}
local vu25 = {}
function UpdateDataPlayer(p26)
	-- upvalues: (ref) vu24, (ref) vu25, (ref) vu21, (ref) vu20
	local vu27, vu28
	if p26 == "Pets" then
		vu27 = vu24
		vu28 = "PetService"
	else
		if p26 ~= "Arms" then
			warn("Invalid method: " .. tostring(p26))
			return false
		end
		vu27 = vu25
		vu28 = "ArmsService"
	end
	local v39, v40 = pcall(function()
		-- upvalues: (ref) vu27, (ref) vu21, (ref) vu28, (ref) vu20
		vu27 = {}
		local v29 = vu21:WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild(vu28).RF.getOwned:InvokeServer(vu20)
		local v30, v31, v32 = pairs(v29)
		while true do
			local v33
			v32, v33 = v30(v31, v32)
			if v32 == nil then
				break
			end
			vu27[v32] = {}
			local v34, v35, v36 = pairs(v33)
			local v37 = v32
			while true do
				local v38
				v36, v38 = v34(v35, v36)
				if v36 == nil then
					break
				end
				vu27[v37][v36] = v38
			end
		end
	end)
	if v39 then
		return true, vu27
	end
	warn("Failed to update " .. p26 .. "PlayerTable: " .. v40)
	return false
end
UpdateDataPlayer("Arms")
UpdateDataPlayer("Pets")
function RequestBestToolType(p41, p42)
	-- upvalues: (ref) vu21, (ref) vu20
	local v43 = {
		["Dumbells"] = require(vu21.Data.Dumbells),
		["Barbells"] = require(vu21.Data.Barbells),
		["Grips"] = require(vu21.Data.Grips)
	}
	local v44 = p41 and p41.PlStats or {
		["Dumbells"] = "Biceps",
		["Barbells"] = "Biceps",
		["Grips"] = "Hands"
	}
	local v45, v46, v47 = pairs(v43[p42])
	local v48 = {}
	while true do
		v47 = v45(v46, v47)
		if v47 == nil then
			break
		end
		local v49 = tonumber(v47)
		if v49 then
			table.insert(v48, v49)
		end
	end
	table.sort(v48, function(p50, p51)
		return p51 < p50
	end)
	local v52
	if p41 then
		v52 = p41.NameArea or nil
	else
		v52 = nil
	end
	local v53
	if v52 then
		v53 = v52
	else
		local v54, v55, v56 = ipairs(v48)
		while true do
			v56, v53 = v54(v55, v56)
			if v56 == nil then
				v53 = v52
				break
			end
			if vu20:GetAttribute("Zone" .. tostring(v53)) == true then
				break
			end
		end
	end
	if not v53 then
		return nil
	end
	local v57, v58, v59 = pairs(v43[p42][tostring(v53)])
	local v60 = {}
	while true do
		v59 = v57(v58, v59)
		if v59 == nil then
			break
		end
		local v61 = tonumber(string.match(v59, "%d+"))
		if v61 then
			table.insert(v60, v61)
		end
	end
	table.sort(v60, function(p62, p63)
		return p63 < p62
	end)
	local v64 = p41 and vu20:GetAttribute(v44[p42]) or vu20.leaderstats[v44[p42]].Value
	local v65, v66, v67 = ipairs(v60)
	while true do
		local v68
		v67, v68 = v65(v66, v67)
		if v67 == nil then
			break
		end
		local v69, v70, v71 = pairs(v43[p42][tostring(v53)])
		while true do
			local v72
			v71, v72 = v69(v70, v71)
			if v71 == nil then
				break
			end
			if tonumber(string.match(v71, "%d+")) == v68 and v72.StrengthRequired <= v64 then
				return v71
			end
		end
	end
end
function FindBestTierKnucle(p73, p74)
	-- upvalues: (ref) vu20
	local v75 = vu20:GetAttribute("VIP")
	local v76 = p74 or vu20:GetAttribute("BestZone")
	local v77, v78, v79 = pairs(workspace.Zones:GetChildren())
	while true do
		local v80
		v79, v80 = v77(v78, v79)
		if v79 == nil then
			break
		end
		if v80.Name == v76 then
			for v81 = 6, 1, -1 do
				if v75 and v80.Interactables.Training.PunchBags:FindFirstChild("VIP") then
					return v80.Interactables.Training.PunchBags:FindFirstChild("VIP")
				end
				local v82 = v80.Interactables.Training.PunchBags:FindFirstChild(tostring("Tier" .. v81))
				if v82 then
					local v83 = v82:GetAttribute("StrengthRequired")
					local v84
					if p73 then
						v84 = vu20:GetAttribute(p73)
					else
						v84 = vu20.leaderstats.Knuckles.Value
					end
					if math.round(v84) >= math.round(v83) then
						return v82
					end
				end
			end
		end
	end
	return nil
end
function RequestInventory(p85)
	-- upvalues: (ref) vu21, (ref) vu20
	local v86 = vu21.Packages.Knit.Services.ItemService.RF.GetFullInventory:InvokeServer(vu20)
	if v86 and v86[3] then
		local v87, v88, v89 = pairs(v86)
		while true do
			local v90
			v89, v90 = v87(v88, v89)
			if v89 == nil then
				break
			end
			local v91, v92, v93 = pairs(v90)
			while true do
				local v94
				v93, v94 = v91(v92, v93)
				if v93 == nil then
					break
				end
				local v95 = v90.Amount
				if typeof(v94) == "string" and string.find(v94, p85) then
					return v95, v94
				end
			end
		end
	end
end
function GetCurrency(p96)
	-- upvalues: (ref) vu21
	local v97 = require(vu21.Controllers.CustomReplicaController).GetReplica().Data
	local v98, v99, v100 = pairs(v97.Currency)
	while true do
		local v101
		v100, v101 = v98(v99, v100)
		if v100 == nil then
			break
		end
		local v102 = string.lower(v100)
		local v103 = string.lower(p96)
		if string.find(v102, v103) or v102 == v103 then
			return math.round(v101)
		end
	end
end
local vu104 = {}
function Compare(p105, p106, p107, p108, p109)
	-- upvalues: (ref) vu104
	local v110 = p108.Key
	local v111 = p108.CraftType
	local v112 = ({
		["Enchant"] = { "Enchantment", "Display" },
		["Mutate"] = { "Cure" },
		["Slime"] = { "Slime" }
	})[p105]
	if not v112 then
		warn("Modo n\195\163o encontrado em ModesSettings: " .. tostring(p105))
		return false, nil, nil, nil
	end
	local v113, v114, v115 = pairs(p107)
	while true do
		local v116
		v115, v116 = v113(v114, v115)
		if v115 == nil then
			break
		end
		if not vu104[v115] and (v116.Key == v110 and (v116.CraftType == v111 and not p106[v115])) then
			local v117, v118, v119 = pairs(v112)
			while true do
				local v120
				v119, v120 = v117(v118, v119)
				if v119 == nil then
					break
				end
				if v116 then
					v116 = v116[v120]
				end
			end
			if not v116 then
				return false, v115, nil, nil
			end
			local v121 = tostring(v116)
			if (function(p122)
				local v123, v124, v125 = pairs(p122)
				while true do
					local v126
					v125, v126 = v123(v124, v125)
					if v125 == nil then
						break
					end
					if type(v126) ~= "string" then
						return false
					end
				end
				return true
			end)(p109) then
				table.sort(p109, function(p127, p128)
					return tostring(p127) > tostring(p128)
				end)
			end
			local v129, v130, v131 = pairs(p109)
			while true do
				local v132
				v131, v132 = v129(v130, v131)
				if v131 == nil then
					break
				end
				print("Selected: ", v132, "Pet: ", v121)
				if v132 == v121 then
					vu104[v115] = true
					return true, v115, v121, v110
				end
			end
			return false, v115, nil, nil
		end
	end
	warn("erro em tudo! compare func")
	return false, nil, nil, nil
end
function TeleportTo(p133)
	Char():SetPrimaryPartCFrame(p133 * CFrame.new(0, 5, 0))
end
function fireproximityprompt(p134, p135, p136)
	if p134.ClassName ~= "ProximityPrompt" then
		error("userdata<ProximityPrompt> expected")
	else
		local v137 = p135 or 1
		local v138 = p134.HoldDuration
		if p136 then
			p134.HoldDuration = 0
		end
		for _ = 1, v137 do
			p134:InputHoldBegin()
			if not p136 then
				wait(p134.HoldDuration)
			end
			p134:InputHoldEnd()
		end
		p134.HoldDuration = v138
	end
end
function GetIdNpc(p139)
	-- upvalues: (ref) vu22
	local v140 = vu22.GetController("CacheController"):GetCache()
	if v140 and (v140.Data and v140.Data.RngZones) then
		local v141, v142, v143 = pairs(v140.Data.RngZones)
		while true do
			local v144
			v143, v144 = v141(v142, v143)
			if v143 == nil then
				break
			end
			local v145, v146, v147 = pairs(v144)
			while true do
				local v148
				v147, v148 = v145(v146, v147)
				if v147 == nil then
					break
				end
				if v148.Npc == p139 then
					return v147
				end
			end
		end
	end
end
function GetInfoZoneNpc(p149)
	-- upvalues: (ref) vu21
	local v150 = require(vu21.Data.RNGZones)
	local v151, v152, v153 = pairs(v150.Zones)
	while true do
		local v154
		v153, v154 = v151(v152, v153)
		if v153 == nil then
			break
		end
		if v154.NpcList then
			local v155, v156, v157 = pairs(v154.NpcList)
			local v158 = v153
			while true do
				local v159
				v157, v159 = v155(v156, v157)
				if v157 == nil then
					break
				end
				if p149 == v157 then
					return v158, v159.Strength
				end
			end
		end
	end
end
function createIndicatorTween(p160)
	local v161 = game:GetService("TweenService")
	local v162 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
	return v161:Create(Char().PrimaryPart, v162, {
		["CFrame"] = p160
	})
end
function GetTrialActive(p163)
	-- upvalues: (ref) vu21, (ref) vu22
	local v164 = require(vu21.Data.ChampionshipData)
	local v165 = require(vu21.Vendor.RealTime)
	local v166 = vu22.GetController("CustomReplicaController"):GetReplica()
	local v167 = v165()
	local v168, v169, v170 = pairs(v164)
	while true do
		local v171
		v170, v171 = v168(v169, v170)
		if v170 == nil then
			break
		end
		if string.find(v170, p163) and v170 ~= "LootPlan" then
			return (v166.Data.Raids[v170] and v166.Data.Raids[v170].LastPlayed or 0) + v171.ResetTime <= v167
		end
	end
	return nil
end
v5:addLine("Grave Options:", "Big")
local vu172 = v5:addInputBox("Set Cooldown (Number)")
v5:addToggle("Auto Kill Zombie", "", "big", false, function(p173)
	-- upvalues: (ref) vu21, (ref) vu1, (ref) vu172
	local vu174 = require(vu21.Controllers.GraveMonsterController)
	if p173 then
		while vu1.Settings["Auto Kill Zombie"] do
			local v175 = vu172
			local v176 = tonumber(v175:getValue()) or 0
			task.wait(v176)
			task.spawn(function()
				-- upvalues: (ref) vu174
				local vu177 = Char():WaitForChild("HumanoidRootPart")
				local v178, v179, vu180 = pairs(vu174.Monsters)
				while true do
					local vu181
					vu180, vu181 = v178(v179, vu180)
					if vu180 == nil then
						break
					end
					task.spawn(function()
						-- upvalues: (ref) vu181, (ref) vu177, (ref) vu174, (ref) vu180
						vu181:SetPrimaryPartCFrame(vu177.CFrame)
						local v182 = vu181
						local v183, v184, v185 = pairs(v182:GetDescendants())
						while true do
							local v186
							v185, v186 = v183(v184, v185)
							if v185 == nil then
								break
							end
							if v186:IsA("BasePart") then
								v186.Transparency = 1
								v186.CanCollide = false
							elseif v186:IsA("Decal") or v186:IsA("Texture") then
								v186.Transparency = 1
							end
						end
						local v187 = vu181:FindFirstChild("Head")
						if v187 and v187:FindFirstChild("Health") then
							v187.Health:Destroy()
						end
						vu174.AttackMonster(vu180, vu181)
					end)
				end
			end)
		end
	end
end)
local vu188 = v5:addInputBox("Set Cooldown (Number)")
v5:addToggle("Auto Grave Digging", "", "big", false, function(p189)
	-- upvalues: (ref) vu21, (ref) vu1, (ref) vu188, (ref) vu22
	require(vu21.Controllers.GraveDiggerController)
	if p189 then
		while vu1.Settings["Auto Grave Digging"] do
			local v190 = vu188
			local v191 = tonumber(v190:getValue()) or 0
			task.wait(v191)
			local v192 = vu22.GetService("GraveDiggerService")
			local v193, v194, v195 = pairs(workspace.GameObjects.GraveDigging:GetChildren())
			while true do
				local v196
				v195, v196 = v193(v194, v195)
				if v195 == nil then
					break
				end
				v192:DigGrave(v196)
				v192:ClaimGraveDigger():await()
			end
		end
	end
end)
v5:addLine("Misc Options:", "Big")
v5:addToggle("Auto Guess The Cup (BETA)", "", "big", false, function(p197)
	-- upvalues: (ref) vu21
	if p197 then
		local v198 = workspace.Zones.AbandonedThemePark.Interactables.Stand
		local vu199 = v198:WaitForChild("Balls")
		local vu200 = v198:WaitForChild("Cups")
		local function vu203(p201, p202)
			if p201 and p202 then
				return (p201.Position - p202.Position).Magnitude
			else
				return math.huge
			end
		end
		local function vu218(p204, p205)
			local v206, v207, v208 = ipairs(p204)
			local v209 = {}
			while true do
				local v210
				v208, v210 = v206(v207, v208)
				if v208 == nil then
					break
				end
				if v210:IsA("Model") and v210.PrimaryPart then
					v209[v210] = v210.PrimaryPart.Position
				end
			end
			local v211 = nil
			-- ::l28::
			local v212, v213, v214 = pairs(v209)
			local v215 = true
			while true do
				local v216
				v214, v216 = v212(v213, v214)
				if v214 == nil then
					break
				end
				if v214.PrimaryPart then
					local v217 = v214.PrimaryPart.Position
					if (v217 - v216).Magnitude > 0.01 then
						v215 = false
					end
					v209[v214] = v217
				end
			end
			if v215 then
				if v211 then
					if p205 <= tick() - v211 then
						return
					end
				else
					v211 = tick()
				end
			else
				v211 = nil
			end
			task.wait()
			-- goto l28
		end;
		(function()
			-- upvalues: (ref) vu200, (ref) vu199, (ref) vu203, (ref) vu218, (ref) vu21
			local v219 = vu200
			local v220, v221, v222 = ipairs(v219:GetChildren())
			local vu223 = {}
			while true do
				local v224
				v222, v224 = v220(v221, v222)
				if v222 == nil then
					break
				end
				if v224:IsA("Model") and v224.PrimaryPart then
					vu223[v224.PrimaryPart.Position] = v224
				end
			end
			local v225 = vu199
			local v226, v227, v228 = ipairs(v225:GetChildren())
			while true do
				local vu229
				v228, vu229 = v226(v227, v228)
				if v228 == nil then
					break
				end
				if vu229:IsA("Model") and vu229.PrimaryPart then
					vu229.PrimaryPart:GetPropertyChangedSignal("Transparency"):Connect(function()
						-- upvalues: (ref) vu229, (ref) vu200, (ref) vu203, (ref) vu218, (ref) vu223, (ref) vu21
						if vu229.PrimaryPart.Transparency == 0 then
							local v230 = math.huge
							local v231 = vu200
							local v232, v233, v234 = ipairs(v231:GetChildren())
							local v235 = nil
							while true do
								local v236
								v234, v236 = v232(v233, v234)
								if v234 == nil then
									break
								end
								if v236:IsA("Model") and v236.PrimaryPart then
									local v237 = vu203(vu229.PrimaryPart, v236.PrimaryPart)
									if v237 < v230 then
										v235 = v236
										v230 = v237
									end
								end
							end
							if v235 then
								vu218(vu200:GetChildren(), 3)
								if v235.PrimaryPart then
									local v238 = v235.PrimaryPart.Position
									local v239 = math.huge
									local v240, v241, v242 = pairs(vu223)
									local v243 = nil
									while true do
										local v244
										v242, v244 = v240(v241, v242)
										if v242 == nil then
											break
										end
										local v245 = (v238 - v242).Magnitude
										if v245 < v239 then
											v243 = v244
											v239 = v245
										end
									end
									if v243 then
										require(vu21.Controllers.CupMinigameController).SelectChoice(tonumber(v243.Name))
										wait(3.5)
										vu21.Packages.Knit.Services.CupMinigameService.RF.StartNewRound:InvokeServer()
									end
								end
							end
						end
					end)
				end
			end
		end)()
	end
end)
v5:addToggle("Auto Playtime Pass", "When activating this option, automatically collect unlocked playtime pass rewards!", "big", false, function(p246)
	-- upvalues: (ref) vu1, (ref) vu21
	if p246 then
		while vu1.Settings["Auto Playtime Pass"] do
			task.wait()
			local v247 = require(vu21.Controllers.CustomReplicaController).GetReplica().Data.Events.EventPass
			local v248 = v247.ClaimedLevels.Free[#v247.ClaimedLevels.Free] or 0
			local v249 = v247.ClaimedLevels.Premium[#v247.ClaimedLevels.Premium] or 0
			local v250 = tonumber(v247.Level)
			local v251 = v247.BoughtPremium
			if tonumber(v248) == v250 then
				if v251 and tonumber(v249) ~= v250 then
					local v252 = tonumber(v249 + 1)
					vu21.Packages.Knit.Services.EventPassService.RF.ClaimReward:InvokeServer("Premium", v252)
				end
			else
				local v253 = tonumber(v248 + 1)
				vu21.Packages.Knit.Services.EventPassService.RF.ClaimReward:InvokeServer("Free", v253)
			end
		end
	end
end)
v18:addToggle("Auto Open Haunted Chest", "", "Big", false, function(p254)
	-- upvalues: (ref) vu1, (ref) vu21
	if p254 then
		while vu1.Settings["Auto Open Haunted Chest"] do
			task.wait()
			if RequestInventory("SpookyGold") >= 1 then
				vu21.Packages.Knit.Services.ChestService.RF.Open:InvokeServer("HauntedChest")
			end
		end
	end
end)
v5:addLine("Fortune Spinner:", "Big")
local vu255 = v5:addCombo("Select Amount Spin (Haunted)", "", { "1X", "3X", "10X" })
v5:addToggle("Auto Haunted Fortune Spin (Selected)", "", "big", false, function(p256)
	-- upvalues: (ref) vu255, (ref) vu1, (ref) vu21
	if p256 then
		local v257 = vu255:getValue()
		local v258 = {
			["1X"] = {
				["Amount"] = 5
			},
			["3X"] = {
				["Argumento"] = "x10",
				["Amount"] = 15
			},
			["10X"] = {
				["Argumento"] = "x25",
				["Amount"] = 50
			}
		}
		while vu1.Settings["Auto Haunted Fortune Spin (Selected)"] do
			wait()
			local v259 = RequestInventory("Haunted Ticket")
			if math.round(v259) >= v258[v257].Amount then
				local vu260 = v258[v257].Argumento or nil
				pcall(function()
					-- upvalues: (ref) vu21, (ref) vu260
					vu21.Packages.Knit.Services.SpinnerService.RF.Spin:InvokeServer("Haunted Fortune", vu260)
				end)
			end
		end
	end
end)
v5:addCombo("Select Amount Spin (Underworld)", "", { "1X", "3X", "10X" })
v5:addToggle("Auto Underworld Fortune Spin (Selected)", "", "big", false, function(p261)
	-- upvalues: (ref) vu255, (ref) vu1, (ref) vu21
	if p261 then
		local v262 = vu255:getValue()
		local v263 = {
			["1X"] = {
				["Amount"] = 5
			},
			["3X"] = {
				["Argumento"] = "x10",
				["Amount"] = 15
			},
			["10X"] = {
				["Argumento"] = "x25",
				["Amount"] = 50
			}
		}
		while vu1.Settings["Auto Underworld Fortune Spin (Selected)"] do
			wait()
			local v264 = RequestInventory("Underworld Ticket")
			if math.round(v264) >= v263[v262].Amount then
				local vu265 = v263[v262].Argumento or nil
				pcall(function()
					-- upvalues: (ref) vu21, (ref) vu265
					vu21.Packages.Knit.Services.SpinnerService.RF.Spin:InvokeServer("Underworld Fortune", vu265)
				end)
			end
		end
	end
end)
v5:addCombo("Select Amount Spin (Carnival)", "", { "1X", "3X", "10X" })
v5:addToggle("Auto Carnival Fortune Spin (Selected)", "", "big", false, function(p266)
	-- upvalues: (ref) vu255, (ref) vu1, (ref) vu21
	if p266 then
		local v267 = vu255:getValue()
		local v268 = {
			["1X"] = {
				["Amount"] = 5
			},
			["3X"] = {
				["Argumento"] = "x10",
				["Amount"] = 15
			},
			["10X"] = {
				["Argumento"] = "x25",
				["Amount"] = 50
			}
		}
		while vu1.Settings["Auto Carnival Fortune Spin (Selected)"] do
			wait()
			local v269 = RequestInventory("Carnival Ticket")
			if math.round(v269) >= v268[v267].Amount then
				local vu270 = v268[v267].Argumento or nil
				pcall(function()
					-- upvalues: (ref) vu21, (ref) vu270
					vu21.Packages.Knit.Services.SpinnerService.RF.Spin:InvokeServer("Carnival Fortune", vu270)
				end)
			end
		end
	end
end)
v5:addLine("Tower\'s Options:", "Big")
v5:addToggle("Auto Spooky Tower", "", "Big", false, function(p271)
	-- upvalues: (ref) vu1, (ref) vu21, (ref) vu20
	if p271 then
		while vu1.Settings["Auto Spooky Tower"] do
			task.wait()
			if RequestInventory("Spooky Tower Key") then
				local v272, _ = pcall(function()
					-- upvalues: (ref) vu21
					return vu21.Packages.Knit.Services.TowerService.RF.EnterTower:InvokeServer("SpookyTower", true)
				end)
				if v272 then
					vu21.Packages.Knit.Services.WrestleService.RF.OnAutoFight:InvokeServer()
					repeat
						task.wait()
						vu21.Packages.Knit.Services.WrestleService.RF.OnClick:InvokeServer()
					until not (vu1.Settings["Auto Spooky Tower"] and vu20.PlayerGui.GameUI.Hud.Tower.Visible)
				end
			end
		end
	end
end)
v5:addToggle("Auto Underworld Tower", "", "Big", false, function(p273)
	-- upvalues: (ref) vu1, (ref) vu21, (ref) vu20
	if p273 then
		while vu1.Settings["Auto Underworld Tower"] do
			task.wait()
			if RequestInventory("Underworld Tower Key") then
				local v274, _ = pcall(function()
					-- upvalues: (ref) vu21
					return vu21.Packages.Knit.Services.TowerService.RF.EnterTower:InvokeServer("UnderworldTower", true)
				end)
				if v274 then
					vu21.Packages.Knit.Services.WrestleService.RF.OnAutoFight:InvokeServer()
					repeat
						task.wait()
						vu21.Packages.Knit.Services.WrestleService.RF.OnClick:InvokeServer()
					until not (vu1.Settings["Auto Underworld Tower"] and vu20.PlayerGui.GameUI.Hud.Tower.Visible)
				end
			end
		end
	end
end)
v5:addLine("Trick Or Treat:", "Big")
local vu275 = require(vu21.Controllers.TrickOrTreatController)
v5:addToggle("Auto Trick Or Treat (BETA)", "", "big", false, function(p276)
	-- upvalues: (ref) vu1, (ref) vu275
	if p276 then
		while vu1.Settings["Auto Trick Or Treat (BETA)"] do
			task.wait()
			local v277 = workspace.GameObjects.TrickOrTreat
			local v278, v279, v280 = pairs(v277:GetChildren())
			while true do
				local v281
				v280, v281 = v278(v279, v280)
				if v280 == nil or not vu1.Settings["Auto Trick Or Treat (BETA)"] then
					break
				end
				wait(1)
				if v281:IsA("Model") then
					TeleportTo(v281.Door.Handle.CFrame)
					wait(0.5)
					vu275.StartTrickOrTreat(v281)
				end
			end
		end
	end
end)
v5:addLine("Brewing Machine:", "Big")
local vu282 = require(vu21.Data.Halloween.Brewing)
local v283, v284, v285 = pairs(vu282.Ingredients.Halloween)
local vu286 = vu22
local vu287 = vu20
local vu288 = vu1
local vu289 = vu21
local v290 = {}
local v291 = {}
while true do
	local v292
	v285, v292 = v283(v284, v285)
	if v285 == nil then
		break
	end
	local v293 = {
		["Numero"] = v285,
		["Nome"] = v292.Item
	}
	table.insert(v290, v293)
end
local v294, v295, v296 = pairs(vu282.Recipes.Halloween)
while true do
	local v297
	v296, v297 = v294(v295, v296)
	if v296 == nil then
		break
	end
	local v298 = v297.Reward.Title
	table.insert(v291, v298)
end
local vu299 = v5:addMultiCombo("Select Recipe", "\r\n\tCookie - Required ingredients: Spooky Ghost \195\1513, Witch Hat \195\1515\r\n\tStarfruit - Required ingredients: Wizard Hat \195\1514, Spiders Web \195\15110\r\n\tDragon Fruit - Required ingredients: Jack O Lantern \195\1515, Cave Bat \195\1511\r\n\tTraining Potion - Required ingredients: Cave Bat \195\1511, Candy Corn \195\15110\r\n\tPet XP Potion - Required ingredients: Zombie Hand \195\1515, Coffin \195\1512\r\n\tCookie (v2) - Required ingredients: Spooky Ghost \195\1513, Witch Hat \195\1514, Wizard Hat \195\1515\r\n\tRaspberry - Required ingredients: Jack O Lantern \195\1513, Candy Corn \195\1515\r\n\tWins Potion - Required ingredients: Spooky Ghost \195\1511, Witch Hat \195\1512, Wizard Hat \195\1513\r\n\tLuck Potion - Required ingredients: Cave Bat \195\1511, Zombie Hand \195\15115, Coffin \195\15120\r\n\tHalloween 2025 Training Potion - Required ingredients: Cave Bat \195\1511, Wizard Hat \195\15115, Coffin \195\15125\r\n", v291)
v5:addToggle("Auto Brew (Selected)", "", "big", false, function(p300)
	-- upvalues: (ref) vu299, (ref) vu289, (ref) vu282, (ref) vu288
	if p300 then
		local v301 = vu299:getValue()
		local vu302 = vu289.Packages.Knit.Services.BrewingService.RF.Brew
		local function v316(p303)
			-- upvalues: (ref) vu282, (ref) vu302
			local v304 = vu282.Recipes.Halloween
			local v305, v306, v307 = pairs(v304)
			while true do
				local v308
				v307, v308 = v305(v306, v307)
				if v307 == nil then
					break
				end
				if v308.Reward.Title == p303 then
					local v309 = v308.Ingredients
					local v310, v311, v312 = pairs(v309)
					local vu313 = {
						{}
					}
					local v314 = 1
					while true do
						local v315
						v312, v315 = v310(v311, v312)
						if v312 == nil then
							break
						end
						vu313[1][v312] = {
							["Slot"] = v314,
							["Amount"] = v315
						}
						v314 = v314 + 1
					end
					local _, _ = pcall(function()
						-- upvalues: (ref) vu302, (ref) vu313
						return vu302:InvokeServer(unpack(vu313))
					end)
					return
				end
			end
		end
		while vu288.Settings["Auto Brew (Selected)"] do
			task.wait()
			local v317, v318, v319 = pairs(v301)
			while true do
				local v320
				v319, v320 = v317(v318, v319)
				if v319 == nil then
					break
				end
				v316(v320)
			end
		end
	end
end)
v5:addLine("Other\'s Folders:", "Big")
local v321 = v5:addFolder("Auto Merchant")
local v322, v323, v324 = pairs(v23["Halloween Merchant"].Items)
local v325 = {}
local v326 = {}
while true do
	local v327
	v324, v327 = v322(v323, v324)
	if v324 == nil then
		break
	end
	local v328, v329, v330 = pairs(v327)
	while true do
		local v331
		v330, v331 = v328(v329, v330)
		if v330 == nil then
			break
		end
		table.insert(v325, v331.Title)
	end
end
local v332, v333, v334 = pairs(v23["Carnival Merchant"].Items)
while true do
	local v335
	v334, v335 = v332(v333, v334)
	if v334 == nil then
		break
	end
	local v336, v337, v338 = pairs(v335)
	while true do
		local v339
		v338, v339 = v336(v337, v338)
		if v338 == nil then
			break
		end
		table.insert(v326, v339.Title)
	end
end
local vu340 = v321:addMultiCombo("Select Item (Halloween)", "Select the item you want to automatically purchase from the merchant when available", v325)
v321:addToggle("Auto Buy Merchant (Halloween)", "By activating this option you will buy the selected item from the merchant as soon as it becomes available!", "big", false, function(p341)
	-- upvalues: (ref) vu340, (ref) vu288, (ref) vu289, (ref) vu287
	if p341 then
		local v342 = vu340:getValue()
		while vu288.Settings["Auto Buy Merchant (Halloween)"] do
			task.wait(1)
			local v343, v344, v345 = pairs(v342)
			while true do
				local v346
				v345, v346 = v343(v344, v345)
				if v345 == nil or not vu288.Settings["Auto Buy Merchant (Halloween)"] then
					break
				end
				local v347, v348, v349 = pairs(v342)
				while true do
					local v350
					v349, v350 = v347(v348, v349)
					if v349 == nil then
						break
					end
					local v351 = require(vu289.ReplicaController)
					local v352, v353, v354 = pairs(v351._replicas)
					while true do
						local v355
						v354, v355 = v352(v353, v354)
						if v354 == nil then
							break
						end
						if string.find(v355.Class, "LimitedMerchant") then
							local v356 = v355.Data.LimitedMerchant["Halloween Merchant"]
							local v357, v358, v359 = pairs(v356.Items)
							while true do
								local v360
								v359, v360 = v357(v358, v359)
								if v359 == nil then
									break
								end
								local v361 = require(vu289.Data.LimitedMerchant)["Halloween Merchant"].Items
								local v362, v363, v364 = pairs(v361)
								local v365 = v359
								while true do
									local v366
									v364, v366 = v362(v363, v364)
									if v364 == nil then
										break
									end
									local v367, v368, v369 = pairs(v366)
									local v370 = v364
									while true do
										local v371
										v369, v371 = v367(v368, v369)
										if v369 == nil then
											break
										end
										if v370 == v365 and (v369 == v360.Index and v371.Title == v350) then
											local v372 = vu287:GetAttribute("Candy2025")
											local v373 = math.round(v372)
											local v374 = tonumber(v360.Stock)
											local v375 = tonumber(v371.Price)
											local v376 = tonumber(v373)
											if 1 <= v374 and v375 <= v376 then
												local vu377 = tonumber(v370)
												pcall(function()
													-- upvalues: (ref) vu289, (ref) vu377
													vu289.Packages.Knit.Services.LimitedMerchantService.RF.BuyItem:InvokeServer("Halloween Merchant", vu377)
												end)
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)
local vu378 = v321:addMultiCombo("Select Item (Carnival)", "Select the item you want to automatically purchase from the merchant when available", v326)
v321:addToggle("Auto Buy Merchant (Carnival)", "By activating this option you will buy the selected item from the merchant as soon as it becomes available!", "big", false, function(p379)
	-- upvalues: (ref) vu378, (ref) vu288, (ref) vu289, (ref) vu287
	if p379 then
		local v380 = vu378:getValue()
		while vu288.Settings["Auto Buy Merchant (Carnival)"] do
			task.wait(1)
			local v381, v382, v383 = pairs(v380)
			while true do
				local v384
				v383, v384 = v381(v382, v383)
				if v383 == nil or not vu288.Settings["Auto Buy Merchant (Carnival)"] then
					break
				end
				local v385, v386, v387 = pairs(v380)
				while true do
					local v388
					v387, v388 = v385(v386, v387)
					if v387 == nil then
						break
					end
					local v389 = require(vu289.ReplicaController)
					local v390, v391, v392 = pairs(v389._replicas)
					while true do
						local v393
						v392, v393 = v390(v391, v392)
						if v392 == nil then
							break
						end
						if string.find(v393.Class, "LimitedMerchant") then
							local v394 = v393.Data.LimitedMerchant["Carnival Merchant"]
							local v395, v396, v397 = pairs(v394.Items)
							while true do
								local v398
								v397, v398 = v395(v396, v397)
								if v397 == nil then
									break
								end
								local v399 = require(vu289.Data.LimitedMerchant)["Carnival Merchant"].Items
								local v400, v401, v402 = pairs(v399)
								local v403 = v397
								while true do
									local v404, v405 = v400(v401, v402)
									if v404 == nil then
										break
									end
									local v406, v407, v408 = pairs(v405)
									v402 = v404
									while true do
										local v409
										v408, v409 = v406(v407, v408)
										if v408 == nil then
											break
										end
										if v404 == v403 and (v408 == v398.Index and v409.Title == v388) then
											local v410 = vu287:GetAttribute("Candy2025")
											local v411 = math.round(v410)
											local v412 = tonumber(v398.Stock)
											local v413 = tonumber(v409.Price)
											local v414 = tonumber(v411)
											if 1 <= v412 and v413 <= v414 then
												local vu415 = tonumber(v404)
												pcall(function()
													-- upvalues: (ref) vu289, (ref) vu415
													vu289.Packages.Knit.Services.LimitedMerchantService.RF.BuyItem:InvokeServer("Carnival Merchant", vu415)
												end)
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)
local v416 = v5:addFolder("Auto Egg")
local vu417 = v416:addCombo("Select Egg", "", {
	"CandyCorn Egg",
	"WitchCauldron Egg",
	"Casper Egg",
	"Devil Egg",
	"Lantern Egg",
	"Bat Egg",
	"Hell Egg",
	"Cobweb Egg",
	"Balloon Egg",
	"Popcorn Egg"
})
v416:addToggle("Auto Egg Halloween (Selected)", "Activating this option you will automatically open the selected egg (this option adjusts to your available gamepass, if you have 8x eggs you will open 8x eggs)", "big", false, function(p418)
	-- upvalues: (ref) vu288, (ref) vu417, (ref) vu289
	if p418 then
		while vu288.Settings["Auto Egg Halloween (Selected)"] and wait() do
			local v419 = vu417:getValue()
			local v420 = string.gsub(v419, " Egg", "")
			while vu288.Settings["Auto Egg Halloween (Selected)"] do
				task.wait()
				vu289.Packages.Knit.Services.EggService.RF.purchaseEgg:InvokeServer(unpack({
					v420,
					false,
					false,
					false,
					false,
					true
				}))
			end
		end
	end
end)
local v421 = v5:addFolder("Auto Boss")
local vu422 = v421:addCombo("Select Boss", "Select the Mode for the auto boss event", {
	"Zombie",
	"Mummy",
	"Dracula",
	"Skeleton",
	"Headless Horseman",
	"Killer Clown",
	"Witch",
	"Ghost",
	"Devil",
	"Grim Reaper",
	"Scarecrow",
	"Werewolf",
	"Zombie Vampire",
	"Skeleton Witch",
	"Pumpkin Demon",
	"Pumpkin Lord",
	"Mummy Leader",
	"Skeleton Emperor",
	"Zombie Leader",
	"Molten Lord",
	"Underworld God",
	"Balloon Clown",
	"Jester",
	"Mine",
	"Magician",
	"Maskot"
})
v421:addToggle("Auto Boss Halloween (Selected)", "By activating this option you will automatically farm the selected Boss (remember to select the boss!)", "big", false, function(p423)
	-- upvalues: (ref) vu288, (ref) vu422, (ref) vu289
	if p423 then
		while vu288.Settings["Auto Boss Halloween (Selected)"] do
			task.wait()
			local v424 = vu422:getValue()
			local v425 = string.gsub(v424, " ", "")
			local v426 = workspace:WaitForChild("GameObjects"):WaitForChild("ArmWrestling")
			local v427, v428, v429 = ipairs(v426:GetChildren())
			while true do
				local v430
				v429, v430 = v427(v428, v429)
				if v429 == nil then
					break
				end
				if v430:IsA("Folder") then
					local v431 = v430:FindFirstChild("NPC")
					if v431 then
						v431 = v431:FindFirstChild(v425)
					end
					if v431 then
						vu289.Packages.Knit.Services.ArmWrestleService.RF.RequestStartFight:InvokeServer(v425)
					end
				end
			end
		end
	end
end)
v421:addToggle("Auto Critic Hit", "Activating the option will make you critic hit to kill the boss automatically", "big", false, function(_)
	-- upvalues: (ref) vu288, (ref) vu289
	while vu288.Settings["Auto Critic Hit"] do
		wait()
		vu289.Packages.Knit.Services.ArmWrestleService.RF.RequestCritHit:InvokeServer()
	end
end)
v421:addToggle("Auto Click", "Activating the option will make you click to kill the boss automatically", "big", false, function(_)
	-- upvalues: (ref) vu288, (ref) vu286
	while vu288.Settings["Auto Click"] do
		wait()
		vu286.GetService("ArmWrestleService"):RequestClick()
	end
end)
local v432 = v5:addFolder("Auto Train")
local vu433 = v432:addCombo("Select Mode", "Select the Mode for the auto train", {
	"Dumbells",
	"Barbells",
	"Grips",
	"Knuckles"
})
local vu434 = v432:addCombo("Select Zone", "Select the Mode for the auto train", {
	"SpookyNeighborhood",
	"HauntedMansion",
	"MansionBasement",
	"MansionUnderworld",
	"AbandonedThemePark"
})
local vu435 = v432:addInputBox("Set Cooldown (Number)")
v432:addToggle("Auto Train Halloween (Selected)", "By activating this option you will start training in the selected mode automatically!", "big", false, function(p436)
	-- upvalues: (ref) vu433, (ref) vu434, (ref) vu287, (ref) vu2, (ref) vu289, (ref) vu288, (ref) vu435
	if p436 then
		local v437 = vu433:getValue()
		local v438 = vu434:getValue()
		local v439 = vu287:GetAttribute("VIP")
		local v440 = workspace.Zones:FindFirstChild(v438).Interactables.Teleports.Locations:GetChildren()
		if v437 then
			vu2:SendNotification("Looking for the best " .. v437 .. "!!", "It may take a few seconds!", true)
			vu289.Packages.Knit.Services.ToolService.RE.onUnequipRequest:FireServer()
			if v437 == "Knuckles" then
				local v441 = FindBestTierKnucle("TotalBrainrotKnuckles", v438)
				if v438 and #v440 > 0 then
					vu289.Packages.Knit.Services.ZoneService.RE.teleport:FireServer(v440[1])
				end
				repeat
					wait(0.5)
				until vu287.PlayerGui.TeleportScreen.Frame.Position == UDim2.new(0, 0, 1, 0)
				wait(0.5)
				if v441 then
					local vu442 = workspace.Zones[tostring(v438)].Interactables.Training.PunchBags[tostring(v441)].Primary.CFrame + Vector3.new(0, 5, 0)
					local vu443 = createIndicatorTween(vu442)
					local v444 = vu443
					vu443.Play(v444)
					spawn(function()
						-- upvalues: (ref) vu288, (ref) vu442, (ref) vu443
						wait(5)
						while vu288.Settings["Auto Train Halloween (Selected)"] and task.wait(1.5) do
							local v445 = Char().PrimaryPart.Position
							if (vu442.Position - v445).Magnitude > 8 then
								vu443:Play()
							end
						end
					end)
					vu289.Packages.Knit.Services.ToolService.RE.onUnequipRequest:FireServer()
					while vu288.Settings["Auto Train Halloween (Selected)"] do
						if v439 then
							local v446 = { tostring(v438), "VIP", v439 }
							vu289.Packages.Knit.Services.PunchBagService.RE.onGiveStats:FireServer(unpack(v446))
						else
							local v447 = { tostring(v438), tostring(v441) }
							vu289.Packages.Knit.Services.PunchBagService.RE.onGiveStats:FireServer(unpack(v447))
						end
						wait()
					end
				end
			else
				while vu288.Settings["Auto Train Halloween (Selected)"] do
					local v448 = vu435
					if not wait(tonumber(v448:getValue())) then
						break
					end
					local v449 = RequestBestToolType({
						["NameArea"] = v438,
						["PlStats"] = {
							["Dumbells"] = "TotalHalloween25Bicep",
							["Barbells"] = "Halloween25Bicep",
							["Grips"] = "Halloween25Grip"
						}
					}, v437)
					if v449 then
						local v450, v451, v452 = ipairs(Char():GetChildren())
						local v453 = false
						while true do
							local v454
							v452, v454 = v450(v451, v452)
							if v452 == nil then
								break
							end
							if string.find(string.lower(v454.Name), string.lower(v437)) then
								if vu287.PlayerGui.GameUI.ToolBar.Tool.Visible then
									v453 = true
								else
									v454:Destroy()
								end
								break
							end
						end
						if v453 then
							vu289.Packages.Knit.Services.ToolService.RE.onClick:FireServer()
						else
							local v455 = (v437 == "Dumbells" or v437 == "Grips") and ("onGuiEquipRequest" or "onEquipRequest") or "onEquipRequest"
							local v456 = { v438, v437, tostring(v449) }
							vu289.Packages.Knit.Services.ToolService.RE[v455]:FireServer(unpack(v456))
						end
					end
				end
			end
		elseif v437 == nil or (v437 == "" or not v437) then
			vu2:activatedWarn()
		end
	end
end)
local vu457 = v6:addCombo("Select Mode", "Select the Mode for the auto train", {
	"Dumbells",
	"Barbells",
	"Grips",
	"Knuckles"
})
local vu458 = v6:addInputBox("Set Cooldown (Number)")
v6:addToggle("Auto Train (Selected)", "By activating this option you will start training in the selected mode automatically!", "big", false, function(p459)
	-- upvalues: (ref) vu457, (ref) vu287, (ref) vu2, (ref) vu289, (ref) vu288, (ref) vu458
	if p459 then
		local v460 = vu457:getValue()
		local v461 = vu287:GetAttribute("BestZone")
		local v462 = vu287:GetAttribute("VIP")
		local v463 = workspace.Zones:FindFirstChild(v461).Interactables.Teleports.Locations:GetChildren()
		if v460 then
			vu2:SendNotification("Looking for the best " .. v460 .. "!!", "It may take a few seconds!", true)
			vu289.Packages.Knit.Services.ToolService.RE.onUnequipRequest:FireServer()
			if v460 == "Knuckles" then
				local v464 = FindBestTierKnucle()
				if v461 and #v463 > 0 then
					vu289.Packages.Knit.Services.ZoneService.RE.teleport:FireServer(v463[1])
				end
				repeat
					wait(0.5)
				until vu287.PlayerGui.TeleportScreen.Frame.Position == UDim2.new(0, 0, 1, 0)
				wait(0.5)
				if v464 then
					local vu465 = workspace.Zones[tostring(v461)].Interactables.Training.PunchBags[tostring(v464)].Primary.CFrame + Vector3.new(0, 5, 0)
					local vu466 = createIndicatorTween(vu465)
					local v467 = vu466
					vu466.Play(v467)
					spawn(function()
						-- upvalues: (ref) vu288, (ref) vu465, (ref) vu466
						wait(5)
						while vu288.Settings["Auto Train (Selected)"] and task.wait(1.5) do
							local v468 = Char().PrimaryPart.Position
							if (vu465.Position - v468).Magnitude > 8 then
								vu466:Play()
							end
						end
					end)
					while vu288.Settings["Auto Train (Selected)"] do
						if v462 then
							local v469 = { tostring(v461), "VIP", v462 }
							vu289.Packages.Knit.Services.PunchBagService.RE.onGiveStats:FireServer(unpack(v469))
						else
							local v470 = { tostring(v461), tostring(v464) }
							vu289.Packages.Knit.Services.PunchBagService.RE.onGiveStats:FireServer(unpack(v470))
						end
						wait()
					end
				end
			else
				while vu288.Settings["Auto Train (Selected)"] do
					local v471 = vu458
					if not wait(tonumber(v471:getValue())) then
						break
					end
					local v472 = RequestBestToolType(nil, v460)
					if v472 then
						if Char():FindFirstChild(tostring(v460 .. v472)) then
							vu289.Packages.Knit.Services.ToolService.RE.onClick:FireServer()
						else
							local v473 = (v460 == "Dumbells" or v460 == "Grips") and ("onGuiEquipRequest" or "onEquipRequest") or "onEquipRequest"
							local v474 = { v461, v460, tostring(v472) }
							vu289.Packages.Knit.Services.ToolService.RE[v473]:FireServer(unpack(v474))
						end
					end
				end
			end
		elseif v460 == nil or (v460 == "" or not v460) then
			vu2:activatedWarn()
		end
	end
end)
v6:addToggle("Auto Train Admin Zone (Selected)", "By activating this option you will start training in the selected mode automatically!", "big", false, function(p475)
	-- upvalues: (ref) vu457, (ref) vu287, (ref) vu2, (ref) vu289, (ref) vu288, (ref) vu458
	if p475 then
		local v476 = vu457:getValue()
		local v477 = "AdminEvent"
		local v478 = vu287:GetAttribute("VIP")
		local v479 = workspace.Zones:FindFirstChild(v477).Interactables.Teleports.Locations:GetChildren()
		if v476 then
			vu2:SendNotification("Looking for the best " .. v476 .. "!!", "It may take a few seconds!", true)
			vu289.Packages.Knit.Services.ToolService.RE.onUnequipRequest:FireServer()
			if v476 == "Knuckles" then
				local v480 = FindBestTierKnucle("TotalAdminKnuckles", v477)
				if v477 and #v479 > 0 then
					vu289.Packages.Knit.Services.ZoneService.RE.teleport:FireServer(v479[1])
				end
				repeat
					wait(0.5)
				until vu287.PlayerGui.TeleportScreen.Frame.Position == UDim2.new(0, 0, 1, 0)
				wait(0.5)
				if v480 then
					local vu481 = workspace.Zones[tostring(v477)].Interactables.Training.PunchBags[tostring(v480)].Primary.CFrame + Vector3.new(0, 5, 0)
					local vu482 = createIndicatorTween(vu481)
					local v483 = vu482
					vu482.Play(v483)
					spawn(function()
						-- upvalues: (ref) vu288, (ref) vu481, (ref) vu482
						wait(5)
						while vu288.Settings["Auto Train Admin Zone (Selected)"] and task.wait(1.5) do
							local v484 = Char().PrimaryPart.Position
							if (vu481.Position - v484).Magnitude > 8 then
								vu482:Play()
							end
						end
					end)
					vu289.Packages.Knit.Services.ToolService.RE.onUnequipRequest:FireServer()
					while vu288.Settings["Auto Train Admin Zone (Selected)"] do
						if v478 then
							local v485 = { tostring(v477), "VIP", v478 }
							vu289.Packages.Knit.Services.PunchBagService.RE.onGiveStats:FireServer(unpack(v485))
						else
							local v486 = { tostring(v477), tostring(v480) }
							vu289.Packages.Knit.Services.PunchBagService.RE.onGiveStats:FireServer(unpack(v486))
						end
						wait()
					end
				end
			else
				while vu288.Settings["Auto Train Admin Zone (Selected)"] do
					local v487 = vu458
					if not wait(tonumber(v487:getValue())) then
						break
					end
					local v488 = RequestBestToolType({
						["NameArea"] = v477,
						["PlStats"] = {
							["Dumbells"] = "TotalAdminBicep",
							["Barbells"] = "AdminBicep",
							["Grips"] = "AdminGrip"
						}
					}, v476)
					if v488 then
						local v489, v490, v491 = ipairs(Char():GetChildren())
						local v492 = false
						while true do
							local v493
							v491, v493 = v489(v490, v491)
							if v491 == nil then
								break
							end
							if string.find(string.lower(v493.Name), string.lower(v476)) then
								if vu287.PlayerGui.GameUI.ToolBar.Tool.Visible then
									v492 = true
								else
									v493:Destroy()
								end
								break
							end
						end
						if v492 then
							vu289.Packages.Knit.Services.ToolService.RE.onClick:FireServer()
						else
							local v494 = (v476 == "Dumbells" or v476 == "Grips") and ("onGuiEquipRequest" or "onEquipRequest") or "onEquipRequest"
							local v495 = { v477, v476, tostring(v488) }
							vu289.Packages.Knit.Services.ToolService.RE[v494]:FireServer(unpack(v495))
						end
					end
				end
			end
		elseif v476 == nil or (v476 == "" or not v476) then
			vu2:activatedWarn()
		end
	end
end)
local v496 = require(vu289.Enums.ArmWrestleNPCTypes)
local v497, v498, v499 = pairs(v496)
local v500 = {}
while true do
	local v501
	v499, v501 = v497(v498, v499)
	if v499 == nil then
		break
	end
	table.insert(v500, v501)
end
local vu502 = v7:addCombo("Select Boss", "Select the Boss for the auto boss", v500)
v7:addToggle("Auto Boss (Selected)", "By activating this option you will automatically farm the selected Boss (remember to select the boss!)", "big", false, function(p503)
	-- upvalues: (ref) vu288, (ref) vu502, (ref) vu289
	if p503 then
		while vu288.Settings["Auto Boss (Selected)"] do
			task.wait()
			local v504 = vu502:getValue()
			local v505 = string.gsub(v504, " ", "")
			local v506 = workspace:WaitForChild("GameObjects"):WaitForChild("ArmWrestling")
			local v507, v508, v509 = ipairs(v506:GetChildren())
			while true do
				local v510
				v509, v510 = v507(v508, v509)
				if v509 == nil then
					break
				end
				if v510:IsA("Folder") then
					local v511 = v510:FindFirstChild("NPC")
					if v511 then
						v511 = v511:FindFirstChild(v505)
					end
					if v511 then
						vu289.Packages.Knit.Services.ArmWrestleService.RF.RequestStartFight:InvokeServer(v504)
					end
				end
			end
		end
	end
end)
v7:addToggle("Auto Fight Best Boss", "", "big", false, function(p512)
	-- upvalues: (ref) vu288, (ref) vu287, (ref) vu289
	if p512 then
		while vu288.Settings["Auto Fight Best Boss"] do
			wait()
			local v513 = vu287:GetAttribute("BestZone")
			local v514 = vu287:GetAttribute("TotalStrength")
			local v515 = workspace:WaitForChild("GameObjects"):WaitForChild("ArmWrestling")
			local v516 = require(vu289.Data.ArmWrestleNPCs)[tostring(v513)]
			local v517, v518, v519 = pairs(v516)
			local v520 = nil
			while true do
				local v521
				v519, v521 = v517(v518, v519)
				if v519 == nil then
					break
				end
				local v522 = v521.Strength
				local v523 = v521.Name
				if v520 == nil or v516[v520].Strength < v522 and v522 <= v514 then
					v520 = string.gsub(v523, " ", "")
				end
			end
			local v524, v525, v526 = pairs(v515:GetChildren())
			while true do
				local v527
				v526, v527 = v524(v525, v526)
				if v526 == nil then
					break
				end
				if v527:IsA("Folder") and (v527.Name ~= "6_OLD" and (v527.Name ~= "Easter" and v527.Name ~= "GreekEvent")) and v527.NPC:FindFirstChild(v520) then
					local v528 = v527.Name
					wait()
					local v529 = { v520, workspace.GameObjects.ArmWrestling[v528].NPC[v520].Table, v528 }
					vu289.Packages.Knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer(unpack(v529))
				end
			end
		end
	end
end)
v7:addToggle("Auto Critic Hit", "Activating the option will make you critic hit to kill the boss automatically", "big", false, function(_)
	-- upvalues: (ref) vu288, (ref) vu289
	while vu288.Settings["Auto Critic Hit"] do
		wait()
		vu289.Packages.Knit.Services.ArmWrestleService.RF.RequestCritHit:InvokeServer()
	end
end)
v7:addToggle("Auto Click", "Activating the option will make you click to kill the boss automatically", "big", false, function(_)
	-- upvalues: (ref) vu288, (ref) vu286
	while vu288.Settings["Auto Click"] do
		task.wait()
		vu286.GetService("ArmWrestleService"):RequestClick()
	end
end)
local v530 = require(vu289.Data.EggData)
local v531, v532, v533 = pairs(v530)
local v534 = {}
while true do
	local v535
	v533, v535 = v531(v532, v533)
	if v533 == nil then
		break
	end
	table.insert(v534, v533)
end
local vu536 = v8:addCombo("Select Egg", "Select the Egg for the auto open egg", v534)
local vu537 = v8:addMultiCombo("Select Rarity", "", {
	"Common",
	"Uncommon",
	"Rare",
	"Epic",
	"Legendary",
	"Mythic",
	"Omega"
})
v8:addToggle("Remove Egg Animation", "Activating this option will disable the egg animation on your screen.", "small", false, function(p538)
	-- upvalues: (ref) vu287
	local v539 = vu287.PlayerGui.OpenerUI
	if p538 then
		v539.Enabled = false
	else
		v539.Enabled = true
	end
end)
v8:addToggle("Auto Delete Rarity (Selected)", "", "small", false, function(_) end)
v8:addToggle("Auto Delete ALL UNLOCKED pets", "", "big", false, function(p540)
	-- upvalues: (ref) vu288, (ref) vu289, (ref) vu2
	if p540 then
		vu2:ConfirmWarn(function()
			-- upvalues: (ref) vu288, (ref) vu289
			while vu288.Settings["Auto Delete ALL UNLOCKED pets"] do
				wait()
				local v541, v542 = UpdateDataPlayer("Pets")
				if v541 then
					local v543, v544, v545 = pairs(v542)
					while true do
						local v546
						v545, v546 = v543(v544, v545)
						if v545 == nil then
							break
						end
						if v546.Locked ~= true then
							vu289.Packages.Knit.Services.PetService.RF.delete:InvokeServer(v545)
						end
					end
				end
			end
		end)
	end
end)
v8:addToggle("Auto Open Egg (Selected)", "Activating this option you will automatically open the selected egg (this option adjusts to your available gamepass, if you have 8x eggs you will open 8x eggs)", "big", false, function(p547)
	-- upvalues: (ref) vu536, (ref) vu288, (ref) vu287, (ref) vu289, (ref) vu537
	if p547 then
		vu536:getValue()
		while vu288.Settings["Auto Open Egg (Selected)"] and wait() do
			vu287:GetAttribute("OctoEggs")
			vu287:GetAttribute("TripleEggs")
			local v548 = vu536:getValue()
			while vu288.Settings["Auto Open Egg (Selected)"] do
				task.wait()
				vu289.Packages.Knit.Services.EggService.RF.purchaseEgg:InvokeServer(unpack({
					v548,
					false,
					false,
					false,
					false,
					true
				}))
			end
		end
	end
end)
v8:addToggle("Auto Open Egg (Event / 16 Minutes)", "By activating this option you will automatically start opening event eggs (you need to have the eggs)", "big", false, function(p549)
	-- upvalues: (ref) vu288, (ref) vu287, (ref) vu289
	if p549 then
		while vu288.Settings["Auto Open Egg (Event / 16 Minutes)"] do
			task.wait()
			if vu287:GetAttribute("EventEggTime") <= 0 then
				vu289.Packages.Knit.Services.EventEggService.RF.Claim:InvokeServer()
			end
		end
	end
end)
local v550 = require(vu289.Data.ArmCratesData)
local v551, v552, v553 = pairs(v550)
local v554 = {}
while true do
	local v555
	v553, v555 = v551(v552, v553)
	if v553 == nil then
		break
	end
	table.insert(v554, v553)
end
local vu556 = v9:addMultiCombo("Select Crate", "", v554)
local vu557 = v9:addMultiCombo("Select Rarity", "", {
	"Common",
	"Uncommon",
	"Rare",
	"Epic",
	"Legendary",
	"Mythic",
	"Omega"
})
v9:addToggle("Auto Delete Arm Rarity (Selected)", "", "small", false, function(_) end)
v9:addToggle("Auto Open Crate (Selected)", "", "big", false, function(p558)
	-- upvalues: (ref) vu556, (ref) vu288, (ref) vu289, (ref) vu287, (ref) vu557
	if p558 then
		local v559 = vu556:getValue()
		local function v584(pu560)
			-- upvalues: (ref) vu288, (ref) vu289, (ref) vu287, (ref) vu557
			if vu288.Settings["Auto Delete Arm Rarity (Selected)"] then
				local v561, v562 = pcall(function()
					-- upvalues: (ref) vu289, (ref) pu560
					return vu289.Packages.Knit.Services.ArmsService.RF.RollArmCrateForPlayer:InvokeServer(pu560)
				end)
				if v561 then
					local v563, v564 = pcall(function()
						-- upvalues: (ref) vu289, (ref) vu287
						return vu289.Packages.Knit.Services.ArmsService.RF.getOwned:InvokeServer(vu287)
					end)
					if v563 then
						local v565 = vu557:getValue()
						local v566, v567, v568 = pairs(v564)
						while true do
							local v569
							v568, v569 = v566(v567, v568)
							if v568 == nil then
								break
							end
							local v570 = v569.StrengthTier
							local v571 = v569.ArmKey
							local v572 = require(vu289.Data.ArmsData)
							local v573, v574, v575 = pairs(v572)
							local vu576 = v568
							local v577 = nil
							while true do
								local v578
								v575, v578 = v573(v574, v575)
								if v575 == nil then
									break
								end
								if v575 == v571 then
									v577 = v578.Rarity
								end
							end
							if v562 == v571 then
								local v579, v580, v581 = pairs(v565)
								while true do
									local v582
									v581, v582 = v579(v580, v581)
									if v581 == nil then
										break
									end
									if v577 == v582 and v570 == 1 then
										pcall(function()
											-- upvalues: (ref) vu576, (ref) vu289
											local v583 = {
												{ vu576 }
											}
											vu289.Packages.Knit.Services.ArmsService.RF.DeleteArms:InvokeServer(unpack(v583))
										end)
									end
								end
							end
						end
					end
				end
			else
				pcall(function()
					-- upvalues: (ref) vu289, (ref) pu560
					vu289.Packages.Knit.Services.ArmsService.RF.RollArmCrateForPlayer:InvokeServer(pu560)
				end)
			end
		end
		while vu288.Settings["Auto Open Crate (Selected)"] do
			task.wait()
			local v585, v586, v587 = pairs(v559)
			while true do
				local v588
				v587, v588 = v585(v586, v587)
				if v587 == nil then
					break
				end
				v584(v588)
			end
		end
	end
end)
local v589 = v10:addFolder("Player Upgrade")
v589:addToggle("Notify Roll You Get", "", "small", false, function(_) end)
v589:addToggle("Auto Roll Title", "", "big", false, function(p590)
	-- upvalues: (ref) vu288, (ref) vu2, (ref) vu289
	if p590 then
		while vu288.Settings["Auto Roll Title"] and wait() do
			if vu288.Settings["Notify Roll You Get"] then
				local v591, v592 = pcall(function()
					return game:GetService("ReplicatedStorage").Packages.Knit.Services.TitleService.RF.Roll:InvokeServer()
				end)
				if v591 and v592 ~= nil then
					vu2:SendNotification("You received Roll: " .. v592 .. "!!", "congratulations!", true)
				end
			else
				vu289.Packages.Knit.Services.TitleService.RF.Roll:InvokeServer()
			end
		end
	end
end)
v589:addToggle("Auto Roll Aura", "", "big", false, function(p593)
	-- upvalues: (ref) vu288, (ref) vu289, (ref) vu2
	if p593 then
		while vu288.Settings["Auto Roll Aura"] and wait() do
			if vu288.Settings["Notify Roll You Get"] then
				local v594, v595 = pcall(function()
					-- upvalues: (ref) vu289
					return vu289.Packages.Knit.Services.AuraService.RF.Roll:InvokeServer()
				end)
				if v594 and v595 ~= nil then
					vu2:SendNotification("You received Roll: " .. v595 .. "!!", "congratulations!", true)
				end
			else
				vu289.Packages.Knit.Services.AuraService.RF.Roll:InvokeServer()
			end
		end
	end
end)
v589:addToggle("Auto Buy Trail (Trophy)", "By activating this option you will buy all available trails with their trophies!", "big", false, function(p596)
	-- upvalues: (ref) vu288, (ref) vu287, (ref) vu289
	if p596 then
		while vu288.Settings["Auto Buy Trail (Trophy)"] and wait() do
			local v597 = vu287.PlayerGui.GameUI.Menus.CharacterMods.Windows.Trails.Inv.Content
			local v598, v599, v600 = pairs(v597:GetChildren())
			local v601 = {}
			while true do
				local v602
				v600, v602 = v598(v599, v600)
				if v600 == nil then
					break
				end
				if v602:IsA("Frame") and v602:GetAttribute("Currency") == "Wins" then
					table.insert(v601, {
						["Frame"] = v602,
						["Price"] = v602:GetAttribute("Price")
					})
				end
			end
			table.sort(v601, function(p603, p604)
				return p603.Price < p604.Price
			end)
			local v605, v606, v607 = ipairs(v601)
			while true do
				local v608
				v607, v608 = v605(v606, v607)
				if v607 == nil then
					break
				end
				if vu287.leaderstats.Wins.Value >= v608.Price then
					vu289.Packages.Knit.Services.PurchaseService.RE.onPurchaseRequest:FireServer("Trails", v608.Frame.Name)
				end
			end
		end
	end
end)
local v609 = v10:addFolder("Auto Garden")
local v610 = vu287.PlayerGui.GameUI.Menus.ItemCrafting.Logic.List.ScrollingFrame
local v611 = require(vu289.Data.Merchant)
local v612 = {}
local v613 = {}
local v614 = {}
local vu615 = {}
local v616 = vu289.Packages.Knit.Services.ItemService.RF.GetFullInventory:InvokeServer(vu287)
if v616 and v616[3] then
	local v617, v618, v619 = pairs(v616)
	while true do
		local v620, v621 = v617(v618, v619)
		if v620 == nil then
			break
		end
		v619 = v620
		if string.find(v621.Item, "Seed") then
			table.insert(v612, v621.Item)
		end
	end
end
local v622, v623, v624 = pairs(v610:GetChildren())
while true do
	local v625, v626 = v622(v623, v624)
	if v625 == nil then
		break
	end
	v624 = v625
	if v626:IsA("Frame") then
		local v627, v628 = v626.Name:gsub("/", ""):match("([^%d]+)(%d+)")
		table.insert(v613, v627 .. " " .. v628)
	end
end
local v629, v630, v631 = pairs(v611.MerchantTypes.Farmer)
while true do
	local v632
	v631, v632 = v629(v630, v631)
	if v631 == nil then
		break
	end
	table.insert(v614, v632.Trade.Title)
	vu615[v631] = { v632.Trade.Title, v632.Stock }
end
local vu633 = v609:addCombo("Select Seed", "Select the Seed for the auto seed plant", v612)
v609:addToggle("Auto Plant/Harvest (Selected)", "By activating this option you will automatically harvest and plant the selected seeds", "Big", false, function(p634)
	-- upvalues: (ref) vu633, (ref) vu288, (ref) vu289
	if p634 then
		local vu635 = vu633:getValue()
		while vu288.Settings["Auto Plant/Harvest (Selected)"] and wait() do
			pcall(function()
				-- upvalues: (ref) vu289, (ref) vu635
				spawn(function()
					-- upvalues: (ref) vu289
					for v636 = 1, 6 do
						vu289.Packages.Knit.Services.ItemPlantingService.RF.Harvest:InvokeServer(tostring(v636))
					end
				end)
				spawn(function()
					-- upvalues: (ref) vu289, (ref) vu635
					for v637 = 1, 6 do
						vu289.Packages.Knit.Services.ItemPlantingService.RF.Plant:InvokeServer(vu635, "1", tostring(v637))
					end
				end)
			end)
		end
	end
end)
local vu638 = v609:addMultiCombo("Select Item (Farmer)", "", v614)
v609:addToggle("Auto Buy All Farmer (Selected)", "By activating this option you will automatically purchase the selected options", "Big", false, function(p639)
	-- upvalues: (ref) vu288, (ref) vu638, (ref) vu615, (ref) vu289
	if p639 then
		while vu288.Settings["Auto Buy All Farmer (Selected)"] do
			task.wait()
			local v640 = vu638:getValue()
			local v641, v642, v643 = pairs(vu615)
			while true do
				local v644
				v643, v644 = v641(v642, v643)
				if v643 == nil then
					break
				end
				local v645 = v644[1]
				local v646 = v644[2]
				local v647, v648, v649 = pairs(v640)
				local v650 = v643
				while true do
					local v651
					v649, v651 = v647(v648, v649)
					if v649 == nil then
						break
					end
					if v645 == v651 then
						for _ = 1, v646 do
							if not vu288.Settings["Auto Buy All Farmer (Selected)"] then
								break
							end
							vu289.Packages.Knit.Services.MerchantService.RF.BuyItem:InvokeServer("Farmer", v650)
						end
					end
				end
			end
		end
	end
end)
local vu652 = v609:addMultiCombo("Select Item (Upgrade Fruits)", "", v613)
v609:addToggle("Auto Upgrade All (Selected)", "By activating this option you will automatically upgrade all options", "Big", false, function(p653)
	-- upvalues: (ref) vu288, (ref) vu652, (ref) vu289
	if p653 then
		while vu288.Settings["Auto Upgrade All (Selected)"] do
			task.wait()
			local v654 = vu652:getValue()
			local v655, v656, v657 = pairs(v654)
			while true do
				local v658
				v657, v658 = v655(v656, v657)
				if v657 == nil then
					break
				end
				local v659, v660 = string.match(v658, "^(.-)%s*(%d+)$")
				vu289.Packages.Knit.Services.ItemCraftingService.RF.UpgradeSnack:InvokeServer({
					["Item"] = v659,
					["Tier"] = v660
				})
			end
		end
	end
end)
local v661 = v10:addFolder("Auto Golden")
local vu662 = v661:addCombo("Select Mode", "Select mode for auto golden", { "Pets", "Arms" })
local vu663 = v661:addCombo("Select Amount Chance", "Select the number of pets you want to use to create 1 pet", {
	"20%",
	"40%",
	"60%",
	"80%",
	"100%"
})
local v664 = game:GetService("ReplicatedStorage")
local v665 = require(v664.Packages.Knit)
local vu666 = v665.GetService("PetService")
local vu667 = v665.GetService("PetCombineService")
local vu668 = game:GetService("Players").LocalPlayer
local v669 = vu666
vu666.getOwned(v669, vu668):andThen(function(pu670)
	-- upvalues: (ref) vu667, (ref) vu666, (ref) vu668
	vu667:goldify("22dc3ec0-8546-48f9-befb-a6c3e84a5153", {}):andThen(function(_)
		-- upvalues: (ref) vu666, (ref) vu668, (ref) pu670
		vu666:getOwned(vu668):andThen(function(p671)
			-- upvalues: (ref) pu670
			local v672 = nil
			local v673 = nil
			while true do
				local v674
				v673, v674 = p671(v672, v673)
				if v673 == nil then
					break
				end
				if not pu670[v673] then
					print("Novo ID do pet mutado:", v673)
				end
			end
		end)
	end)
end)
v661:addToggle("Auto Golden (Selected)", "By activating this option you will automatically transform all your pets/arms (select whichever you prefer) into golden, according to the selected quantity!", "Big", false, function(p675)
	-- upvalues: (ref) vu288, (ref) vu662, (ref) vu663, (ref) vu289, (ref) vu2
	if p675 then
		while vu288.Settings["Auto Golden (Selected)"] do
			task.wait()
			local v676 = vu662:getValue()
			local v677 = vu663:getValue()
			if not (v676 and v677) then
				vu2:activatedWarn()
				break
			end
			local v678, v679 = UpdateDataPlayer(v676)
			local vu680 = ({
				["20%"] = 1,
				["40%"] = 2,
				["60%"] = 3,
				["80%"] = 4,
				["100%"] = 5
			})[v677]
			local vu681 = {}
			local vu682 = nil
			local vu683 = nil
			if v676 == "Pets" then
				vu682 = "PetService"
				vu683 = "goldify"
			elseif v676 == "Arms" then
				vu682 = "ArmsService"
				vu683 = "EvolveArms"
			end
			local function v690()
				-- upvalues: (ref) vu681, (ref) vu680, (ref) vu289, (ref) vu682, (ref) vu683
				local v684, v685, v686 = ipairs(vu681)
				while true do
					local v687
					v686, v687 = v684(v685, v686)
					if v686 == nil then
						return
					end
					local v688 = {}
					for v689 = 1, vu680 do
						if not v687.IDs[v689] then
							break
						end
						table.insert(v688, v687.IDs[v689])
					end
					if #v688 == vu680 then
						vu289.Packages.Knit.Services[vu682].RF[vu683]:InvokeServer(v688)
					end
				end
			end
			local function v696(p691)
				-- upvalues: (ref) vu681
				local v692, v693, v694 = ipairs(vu681)
				while true do
					local v695
					v694, v695 = v692(v693, v694)
					if v694 == nil then
						break
					end
					if v695.NameS == p691 then
						return v695
					end
				end
				return nil
			end
			if v678 then
				local v697, v698, v699 = pairs(v679)
				while true do
					local v700
					v699, v700 = v697(v698, v699)
					if v699 == nil then
						break
					end
					local v701 = nil
					local v702 = nil
					if v676 == "Pets" then
						v701 = v700.Key
						v702 = v700.Tier
						local _ = v700.CraftType
					elseif v676 == "Arms" then
						v701 = v700.ArmKey
						v702 = v700.Tier
					end
					if v702 == "Normal" then
						local v703 = v696(v701)
						if v703 then
							table.insert(v703.IDs, v699)
						else
							table.insert(vu681, {
								["NameS"] = v701,
								["IDs"] = { v699 }
							})
						end
					end
				end
			end
			v690()
		end
	end
end)
local v704 = v10:addFolder("Auto Goliath")
v704:addClick("Open Goliath Machine", "Clicking on this option will open the Goliath UI", "small", false, function(_)
	-- upvalues: (ref) vu287
	vu287.PlayerGui.GameUI.Menus.Goliath.Visible = not vu287.PlayerGui.GameUI.Menus.Goliath.Visible
end)
v704:addToggle("Auto Claim Goliath Pets When Done", "By activating this option you will automatically get the pets ready from the goliath machine", "small", false, function(p705)
	-- upvalues: (ref) vu288, (ref) vu289
	if p705 then
		while vu288.Settings["Auto Claim Goliath Pets When Done"] do
			task.wait()
			local v706 = require(vu289.Controllers.GoliathController)
			local v707 = require(vu289.Vendor.RealTime)
			local v708, v709, v710 = pairs(v706.PetMachineTimer)
			while true do
				local v711, v712 = v708(v709, v710)
				if v711 == nil then
					break
				end
				local v713 = v712 - v707()
				print(v713)
				if v713 <= 0 then
					local v714, v715, v716 = pairs(v706.PetsInMachine)
					v710 = v711
					while true do
						local v717
						v716, v717 = v714(v715, v716)
						if v716 == nil then
							break
						end
						if v717.Guid == v711 then
							vu289.Packages.Knit.Services.PetGoliathService.RE.onClaim:FireServer(nil, v716)
						end
					end
				else
					v710 = v711
				end
			end
		end
	end
end)
v704:addToggle("Auto Goliath", "By activating this option you will automatically create all your Huge pets into goliath pets", "Big", false, function(p718)
	-- upvalues: (ref) vu288, (ref) vu289, (ref) vu287
	if p718 then
		while vu288.Settings["Auto Goliath"] and wait() do
			local v719, v720 = UpdateDataPlayer("Pets")
			if v719 then
				local function v723(p721, p722)
					-- upvalues: (ref) vu289
					vu289.Packages.Knit.Services.PetGoliathService.RE.onPurchase:FireServer(p721, p722)
				end
				local function v728()
					-- upvalues: (ref) vu287
					local v724, v725, v726 = pairs(vu287.PlayerGui.GameUI.Menus.Goliath.Holder.SlotPage.Container:GetChildren())
					while true do
						local v727
						v726, v727 = v724(v725, v726)
						if v726 == nil then
							break
						end
						if v727:IsA("Frame") and not v727.Pending.Visible then
							return v727.Name
						end
					end
				end
				local v729, v730, v731 = pairs(v720)
				while true do
					local v732
					v731, v732 = v729(v730, v731)
					if v731 == nil then
						break
					end
					if v732.CraftType == "Huge" then
						local v733 = v728()
						if v733 then
							v723(v731, v733)
						end
					end
				end
			end
		end
	end
end)
local v734 = v10:addFolder("Auto Void")
v734:addToggle("Auto Claim Void Pets When Done", "By activating this option you will automatically get the pets ready from the void machine", "small", false, function(p735)
	-- upvalues: (ref) vu288, (ref) vu289
	if p735 then
		while vu288.Settings["Auto Claim Void Pets When Done"] and wait(5) do
			local v736 = game:GetService("ReplicatedStorage").Packages.Knit.Services.PetVoidService.RF.init:InvokeServer(game.Players.LocalPlayer)
			local v737, v738, v739 = pairs(v736)
			while true do
				local v740
				v739, v740 = v737(v738, v739)
				if v739 == nil then
					break
				end
				vu289:WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PetVoidService"):WaitForChild("RE"):WaitForChild("onClaim"):FireServer(v740.Guid)
			end
		end
	end
end)
v734:addToggle("Auto Void", "By activating this option you will automatically create all your golden pets into void pets", "Big", false, function(p741)
	-- upvalues: (ref) vu288, (ref) vu289
	if p741 then
		while vu288.Settings["Auto Void"] and wait() do
			local v742, v743 = UpdateDataPlayer("Pets")
			if v742 then
				local v744, v745, v746 = pairs(v743)
				while true do
					local v747
					v746, v747 = v744(v745, v746)
					if v746 == nil then
						break
					end
					if v747.Tier == "Golden" then
						vu289:WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PetVoidService"):WaitForChild("RE"):WaitForChild("onCraftToVoid"):FireServer(v746)
					end
				end
			end
		end
	end
end)
local v748 = require(vu289.Enums.CureTypes)
local v749, v750, v751 = pairs(v748)
local v752 = {}
while true do
	local v753
	v751, v753 = v749(v750, v751)
	if v751 == nil then
		break
	end
	table.insert(v752, v753)
end
local v754 = v10:addFolder("Auto Mutate")
local vu755 = v754:addMultiCombo("Select Mutation", "", v752)
v754:addClick("Open Mutate Machine", "Clicking on this option will open the Mutate Ui", "small", false, function(_)
	-- upvalues: (ref) vu287
	vu287.PlayerGui.GameUI.Menus.Mutate.Visible = not vu287.PlayerGui.GameUI.Menus.Mutate.Visible
end)
v754:addClick("Click to open pets to select", "", "big", false, function(_)
	-- upvalues: (ref) vu3
	vu3("Mutate Machine")
end)
vu286.GetService("PetService")
vu286.GetService("PetCombineService")
v754:addToggle("Auto Mutate Pets (Selected)", "", "big", false, function(p756)
	-- upvalues: (ref) vu755, (ref) vu288, (ref) vu289, (ref) vu2
	if p756 then
		local vu757 = vu755:getValue()
		local v758 = vu288["InventoryMutate Machine"]
		local function vu766(p759)
			-- upvalues: (ref) vu289, (ref) vu757
			local _, v760 = UpdateDataPlayer("Pets")
			local v761 = v760[p759]
			vu289.Packages.Knit.Services.PetCombineService.RF.mutate:InvokeServer(p759, {})
			wait(5)
			local _, v762 = UpdateDataPlayer("Pets")
			local v763, v764, v765, _ = Compare("Mutate", v760, v762, v761, vu757)
			return v763, v764, v765
		end
		local function vu774(p767)
			-- upvalues: (ref) vu289, (ref) vu757
			local _, v768 = UpdateDataPlayer("Pets")
			local v769 = v768[p767]
			vu289.Packages.Knit.Services.PetCombineService.RF.cure:InvokeServer(p767)
			wait(5)
			local _, v770 = UpdateDataPlayer("Pets")
			local v771, v772, v773, _ = Compare("Mutate", v768, v770, v769, vu757)
			return v771, v772, v773
		end
		local function vu780(p775)
			-- upvalues: (ref) vu766, (ref) vu2, (ref) vu774, (ref) vu780
			local v776, v777, v778 = vu766(p775)
			if v776 then
				print("achou enchant")
				vu2:SendNotification("You got 1 new Pet with Mutate: " .. v778 .. "!!", "congratulations!", true)
				return true, v777
			else
				vu2:SendNotification("Trying get a mutate again!", "...", false)
				local _, v779 = vu774(v777)
				return vu780(v779)
			end
		end
		if #v758 >= 1 then
			local v781, v782, v783 = pairs(v758)
			local v784 = vu780
			while true do
				local v785
				v783, v785 = v781(v782, v783)
				if v783 == nil then
					break
				end
				local v786, v787 = UpdateDataPlayer("Pets")
				if v786 and (v787[v785] and not v787[v785].Cure) then
					v784(v785)
				end
				wait(5)
			end
		end
	end
end)
local v788 = v10:addFolder("Auto Slime")
local vu789 = v788:addMultiCombo("Select Slime", "Select the Slime Color for the auto slimer pet", {
	"Yellow",
	"Blue",
	"Purple",
	"Red",
	"Black",
	"Green"
})
v788:addToggle("Open Cure Slime", "Activating this option will open the slime cure machine", "small", false, function(p790)
	-- upvalues: (ref) vu287
	if p790 then
		vu287.PlayerGui.GameUI.Menus.Deslime.Visible = true
	else
		vu287.PlayerGui.GameUI.Menus.Deslime.Visible = false
	end
end)
v788:addClick("Click to open pets to select", "", "big", false, function(_)
	-- upvalues: (ref) vu3
	vu3("Slime Machine")
end)
v788:addToggle("Auto Slime (Selected)", "Activating this option you will start making slime on available pets and healing them until they all turn the color of the selected slime.", "big", false, function(p791)
	-- upvalues: (ref) vu287, (ref) vu789, (ref) vu288, (ref) vu289, (ref) vu2
	if p791 then
		local v792 = vu287.PlayerGui.GameUI.Menus.Deslime
		local v793 = v792.Progress.Timer
		local v794 = vu789:getValue()
		local v795 = vu288["InventorySlime Machine"]
		local v796, v797 = UpdateDataPlayer("Pets")
		if not v796 then
			return
		end
		local v798 = false
		local v799 = {}
		while vu288.Settings["Auto Slime (Selected)"] do
			wait()
			if #v795 < 1 then
				break
			end
			if v793.Text == "READY!" then
				if not v792.Progress.Visible and v793.Text == "READY!" then
					v798 = false
				end
			else
				v798 = true
			end
			if v793.Text == "READY!" and v798 then
				local v800, v801 = pcall(function()
					-- upvalues: (ref) vu289
					vu289.Packages.Knit.Services.PetDeslimeService.RE.onClaim:FireServer()
				end)
				if v800 then
					v798 = false
				else
					warn("Erro ao reivindicar Deslime:", v801)
				end
			end
			local v802, v803, v804 = pairs(v795)
			while true do
				local vu805
				v804, vu805 = v802(v803, v804)
				if v804 == nil then
					break
				end
				local v806 = v797[vu805]
				if v806 then
					if table.find(v794, v806.Slime) then
						if not table.find(v799, vu805) then
							vu2:SendNotification("Pet: " .. v806.Key .. " Slimed by slime: " .. v806.Slime, "congratulations!", true)
							table.insert(v799, vu805)
						end
					elseif v806.Slime then
						if v798 and v806.Slime then
							if v793.Text == "READY!" then
								local v807, _ = pcall(function()
									-- upvalues: (ref) vu289
									vu289.Packages.Knit.Services.PetDeslimeService.RE.onClaim:FireServer()
								end)
								if v807 then
									v798 = false
								end
							end
						elseif not v798 and v806.Slime then
							local v808, _ = pcall(function()
								-- upvalues: (ref) vu289, (ref) vu805
								vu289.Packages.Knit.Services.PetDeslimeService.RE.onPurchase:FireServer(vu805)
							end)
							v798 = v808 and true or v798
						end
					else
						vu289.Packages.Knit.Services.PetService.RF.slimify:InvokeServer(vu805)
					end
				end
			end
		end
	end
end)
local v809 = v10:addFolder("Auto Forge Arms")
v809:addClick("Open Mutate Machine", "Clicking on this option will open the Forge Ui", "small", false, function(_)
	-- upvalues: (ref) vu287
	vu287.PlayerGui.GameUI.Menus.Forge.Visible = not vu287.PlayerGui.GameUI.Menus.Forge.Visible
end)
v809:addToggle("Auto Forge All Arms", "By activating this option you will start forging all your arms!", "Big", false, function(p810)
	-- upvalues: (ref) vu288, (ref) vu289
	if p810 then
		while vu288.Settings["Auto Forge All Arms"] and wait() do
			local v811, v812 = UpdateDataPlayer("Arms")
			local v813 = {}
			if v811 then
				local v814, v815, v816 = pairs(v812)
				while true do
					local v817
					v816, v817 = v814(v815, v816)
					if v816 == nil then
						break
					end
					local v818 = v817.ArmKey
					local v819 = v817.Tier
					local v820 = v817.StrengthTier
					if v813[v818] then
						table.insert(v813[v818].Id, v816)
						table.insert(v813[v818].Tier, v819)
						table.insert(v813[v818].Str, v820)
					else
						v813[v818] = {
							["Id"] = { v816 },
							["Tier"] = { v819 },
							["Str"] = { v820 }
						}
					end
				end
			end
			local v821, v822, v823 = pairs(v813)
			while true do
				local v824
				v823, v824 = v821(v822, v823)
				if v823 == nil then
					break
				end
				local v825 = v823
				local v826 = nil
				local v827 = nil
				for v828 = 1, #v824.Id do
					local v829 = v824.Tier[v828]
					local v830 = v824.Str[v828]
					if v829 == v826 and v830 == v827 then
						local v831 = {
							v825 .. "/" .. v829 .. "/" .. v830,
							{ v824.Id[v828 - 1], v824.Id[v828] }
						}
						vu289:WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ForgeService"):WaitForChild("RF"):WaitForChild("Forge"):InvokeServer(unpack(v831))
					end
					v827 = v830
					v826 = v829
				end
			end
		end
	end
end)
local v832 = v10:addFolder("Ticket Machine")
local vu833 = v832:addMultiCombo("Select Boost", "", { "Training Boost", "Luck Boost", "Wins Boost" })
v832:addClick("Open Ticket Machine", "Clicking on this option will open the Ticket Ui", "small", false, function(_)
	-- upvalues: (ref) vu287
	vu287.PlayerGui.GameUI.Menus.HeavenlyMachine.Visible = not vu287.PlayerGui.GameUI.Menus.HeavenlyMachine.Visible
end)
v832:addToggle("Auto Ticket Machine (Selected)", "", "Big", false, function(p834)
	-- upvalues: (ref) vu288, (ref) vu833, (ref) vu289
	if p834 then
		while vu288.Settings["Auto Ticket Machine (Selected)"] and wait() do
			local v835 = vu833:getValue()
			local function v837(p836)
				-- upvalues: (ref) vu289
				vu289.Packages.Knit.Services.HeavenlyService.RF.BuyBoost:InvokeServer(p836)
			end
			local v838, v839, v840 = pairs(v835)
			while true do
				local v841
				v840, v841 = v838(v839, v840)
				if v840 == nil then
					break
				end
				v837((string.gsub(v841, " Boost", "")))
			end
		end
	end
end)
local v842 = v10:addFolder("Auto Rift Machine")
local vu843 = v842:addMultiCombo("Select Enchant", "", {
	"Rifted I",
	"Rifted II",
	"Rifted III",
	"Rifted IV"
})
v842:addClick("Click to open pets to select", "", "big", false, function(_)
	-- upvalues: (ref) vu3
	vu3("Rift")
end)
v842:addToggle("Auto Rift", "", "big", false, function(p844)
	-- upvalues: (ref) vu843, (ref) vu288, (ref) vu289
	if p844 then
		task.wait()
		local vu845 = vu843:getValue()
		local vu846 = vu288.InventoryRift
		local v847 = require(vu289.Controllers.CustomReplicaController)
		local vu848 = require(vu289.Vendor.RealTime)
		local vu849 = v847.GetReplica().Data
		local _, v850 = UpdateDataPlayer("Pets")
		local vu851 = table.clone(v850)
		local vu852 = {}
		local vu853 = {}
		local function vu858()
			-- upvalues: (ref) vu849
			local v854, v855, v856 = ipairs({ "1", "2", "3" })
			while true do
				local v857
				v856, v857 = v854(v855, v856)
				if v856 == nil then
					break
				end
				if not vu849.RiftMachine[v857] then
					return v857
				end
			end
			return false
		end
		local function v864()
			-- upvalues: (ref) vu849, (ref) vu848, (ref) vu289
			local v859, v860, v861 = ipairs({ "1", "2", "3" })
			while true do
				local vu862
				v861, vu862 = v859(v860, v861)
				if v861 == nil then
					break
				end
				spawn(function()
					-- upvalues: (ref) vu849, (ref) vu862, (ref) vu848, (ref) vu289
					local vu863 = vu849.RiftMachine[vu862]
					if vu863 and (function()
						-- upvalues: (ref) vu863, (ref) vu848
						while vu863.EndedTime - vu848() > 0 do
							task.wait(1)
						end
						return true
					end)() then
						local _, _ = pcall(function()
							-- upvalues: (ref) vu289, (ref) vu862
							vu289.Packages.Knit.Services.RiftMachineService.RF.Claim:InvokeServer(vu862)
						end)
					end
				end)
			end
		end
		local function vu868(pu865)
			-- upvalues: (ref) vu858, (ref) vu853, (ref) vu289
			local vu866 = vu858()
			if not vu866 then
				return nil
			end
			vu853[pu865] = true
			local v867, _ = pcall(function()
				-- upvalues: (ref) vu289, (ref) vu866, (ref) pu865
				vu289.Packages.Knit.Services.RiftMachineService.RF.AddSlot:InvokeServer(vu866, pu865)
			end)
			if v867 then
				return vu866
			end
			vu853[pu865] = nil
			return nil
		end
		local function v880(pu869, pu870)
			-- upvalues: (ref) vu868, (ref) vu849, (ref) vu848, (ref) vu289, (ref) vu851, (ref) vu845, (ref) vu846, (ref) vu852, (ref) vu853
			spawn(function()
				-- upvalues: (ref) vu868, (ref) pu869, (ref) vu849, (ref) vu848, (ref) vu289, (ref) vu851, (ref) pu870, (ref) vu845, (ref) vu846, (ref) vu852, (ref) vu853
				local vu871 = vu868(pu869)
				if not vu871 then
					return
				end
				while true do
					wait(1)
					if not vu849.RiftMachine[vu871] then
						break
					end
					if vu849.RiftMachine[vu871].EndedTime <= vu848() then
						local v872, _ = pcall(function()
							-- upvalues: (ref) vu289, (ref) vu871
							vu289.Packages.Knit.Services.RiftMachineService.RF.Claim:InvokeServer(vu871)
						end)
						if v872 then
							local _, v873 = UpdateDataPlayer("Pets")
							local v874, v875, _, _ = Compare("Enchant", vu851, v873, pu870, vu845)
							if not v874 then
								table.insert(vu852, v875)
							end
							local v876, v877, v878 = ipairs(vu846)
							while true do
								local v879
								v878, v879 = v876(v877, v878)
								if v878 == nil then
									break
								end
								if v879 == pu869 then
									table.remove(vu846, v878)
									break
								end
							end
						end
						break
					end
				end
				vu853[pu869] = nil
			end)
		end
		v864()
		local v881 = vu851
		local v882 = vu853
		while #vu846 > 0 or #vu852 > 0 do
			wait(0.5)
			while #vu852 > 0 do
				wait()
				local v883 = table.remove(vu852, 1)
				if not v882[v883] then
					v880(v883, v881[v883] or {})
				end
			end
			local v884, v885, v886 = ipairs(vu846)
			while true do
				local v887
				v886, v887 = v884(v885, v886)
				if v886 == nil then
					break
				end
				wait(0.5)
				if not v882[v887] then
					v880(v887, v881[v887])
				end
			end
		end
	end
end)
v11:addClick("Open Index Machine", "Clicking on this option will open the Index Ui", "small", false, function(_)
	-- upvalues: (ref) vu287
	vu287.PlayerGui.GameUI.Menus.Index.Visible = not vu287.PlayerGui.GameUI.Menus.Index.Visible
end)
v11:addToggle("Auto Delete Pets You Already Have", "By activating this option you will automatically exclude the pets caught by the auto index", "small", true, function(_) end)
v11:addToggle("Auto Index", "By activating this option you will start buying eggs until you find the pets you need in the index (starts from the cheapest egg to the most expensive!)", "Big", false, function(_)
	-- upvalues: (ref) vu289, (ref) vu288, (ref) vu287
	local v888 = require(vu289.Data.EggData)
	local v889 = vu289.Packages.Knit.Services.PetService.RF.getIndex:InvokeServer(game.Players.LocalPlayer)
	local v890 = require(vu289.Data.WorldEggIndexes)
	local v891, v892, v893 = pairs(v890)
	local v894 = {}
	local v895 = {}
	local v896 = {}
	while true do
		local v897
		v893, v897 = v891(v892, v893)
		if v893 == nil then
			break
		end
		local v898, v899, v900 = pairs(v897.Eggs)
		while true do
			local v901
			v900, v901 = v898(v899, v900)
			if v900 == nil then
				break
			end
			if type(v901) ~= "table" then
				table.insert(v894, v900)
			end
		end
	end
	local v902, v903, v904 = pairs(v888)
	while true do
		local v905
		v904, v905 = v902(v903, v904)
		if v904 == nil then
			break
		end
		if table.find(v894, v904) then
			v895[v904] = {
				["Cost"] = v905.Cost,
				["Pets"] = {}
			}
			local v906 = v905.Chances
			if not v905.IgnoreInIndex then
				local v907, v908, v909 = pairs(v906)
				local v910 = v904
				while true do
					local v911
					v909, v911 = v907(v908, v909)
					if v909 == nil then
						break
					end
					table.insert(v895[v910].Pets, v909)
				end
			end
		end
	end
	local v912, v913, v914 = pairs(v889)
	while true do
		local v915
		v914, v915 = v912(v913, v914)
		if v914 == nil then
			break
		end
		if string.find(v914, "Normal") then
			local v916 = string.gsub(string.gsub(v914, "Normal", ""), "_", "")
			local v917, v918, v919 = pairs(v895)
			while true do
				local v920
				v919, v920 = v917(v918, v919)
				if v919 == nil then
					break
				end
				local v921 = table.find(v920.Pets, v916)
				if v921 then
					table.remove(v920.Pets, v921)
				end
			end
		end
	end
	local v922, v923, v924 = pairs(v895)
	while true do
		local v925
		v924, v925 = v922(v923, v924)
		if v924 == nil then
			break
		end
		table.insert(v896, {
			["Name"] = v924,
			["Cost"] = v925.Cost,
			["Pets"] = v925.Pets
		})
	end
	table.sort(v896, function(p926, p927)
		return p926.Cost < p927.Cost
	end)
	local v928, v929, v930 = ipairs(v896)
	while true do
		local v931
		v930, v931 = v928(v929, v930)
		if v930 == nil or not vu288.Settings["Auto Index"] then
			break
		end
		local v932 = vu287.leaderstats.Wins
		if #v931.Pets ~= 0 then
			while v932.Value >= v931.Cost do
				local v933 = {
					[1] = v931.Name,
					[2] = {},
					[4] = false
				}
				local v934 = vu289.Packages.Knit.Services.EggService.RF.purchaseEgg:InvokeServer(unpack(v933))
				local v935, v936, v937 = pairs(v934)
				while true do
					local v938
					v937, v938 = v935(v936, v937)
					if v937 == nil then
						break
					end
					local v939 = table.find(v931.Pets, v938)
					if v939 then
						table.remove(v931.Pets, v939)
					elseif vu288.Settings["Auto Delete Pets You Already Have"] then
						local v940 = vu289.Packages.Knit.Services.PetService.RF.getOwned:InvokeServer(vu287)
						local v941, v942, v943 = pairs(v940)
						while true do
							local v944
							v943, v944 = v941(v942, v943)
							if v943 == nil then
								break
							end
							if v944.Key == v938 and v944.CraftType == "Baby" then
								vu289.Packages.Knit.Services.PetService.RF.delete:InvokeServer(v943)
							end
						end
					end
				end
				wait(1)
				if #v931.Pets == 0 or not vu288.Settings["Auto Index"] then
					break
				end
			end
		end
	end
end)
local v945 = v11:addFolder("Auto Secret")
local v946 = require(game:GetService("ReplicatedStorage").Data.Secrets)
local v947, v948, v949 = pairs(v946.SecretPets)
local v950 = {}
while true do
	local v951
	v949, v951 = v947(v948, v949)
	if v949 == nil then
		break
	end
	table.insert(v950, v951)
end
local vu952 = v945:addCombo("Select Secret Pet", "", v950)
local vu953 = v945:addCombo("Select Amount Egg", "", {
	"1X",
	"3X",
	"8X",
	"30X"
})
v945:addToggle("Auto Secrets (Selected)", "", "Big", false, function(p954)
	-- upvalues: (ref) vu952, (ref) vu953, (ref) vu287, (ref) vu289, (ref) vu288
	if p954 then
		local v955 = {
			["ArcaneHydra"] = {
				["Zone"] = 4,
				["Egg"] = "Rust"
			},
			["HatchedPhoenix"] = {
				["Zone"] = 5,
				["Egg"] = "Trex"
			},
			["Voidwalker"] = {
				["Zone"] = 6,
				["Egg"] = "Void"
			},
			["StardustDragon"] = {
				["Zone"] = 7,
				["Egg"] = "Meteor"
			},
			["NebulaPhantom"] = {
				["Zone"] = 8,
				["Egg"] = "Gladius"
			},
			["FlamingBeast"] = {
				["Zone"] = 9,
				["Egg"] = "Ember"
			},
			["MagicDominus"] = {
				["Zone"] = 10,
				["Egg"] = "Mushroom"
			},
			["SparklyPenguin"] = {
				["Zone"] = 11,
				["Egg"] = "Iced"
			},
			["TotemDominus"] = {
				["Zone"] = 12,
				["Egg"] = "Miner"
			},
			["KingdomHydra"] = {
				["Zone"] = 13,
				["Egg"] = "Kingdom"
			},
			["SapphireCat"] = {
				["Zone"] = 14,
				["Egg"] = "Paradise"
			},
			["HeavenlySecret"] = {
				["Zone"] = 15,
				["Egg"] = "Evil"
			}
		}
		local v956 = vu952:getValue()
		local v957 = vu953:getValue()
		local v958 = vu287:GetAttribute("BestZone")
		if v955[v956] and tostring(v955[v956].Zone) <= v958 then
			local function v979(pu959)
				-- upvalues: (ref) vu289, (ref) vu287
				local v960, v961 = pcall(function()
					-- upvalues: (ref) vu289, (ref) pu959
					return vu289.Packages.Knit.Services.EggService.RF.purchaseEgg:InvokeServer(unpack(pu959))
				end)
				if v960 then
					local v962, v963 = pcall(function()
						-- upvalues: (ref) vu289, (ref) vu287
						return vu289.Packages.Knit.Services.PetService.RF.getOwned:InvokeServer(vu287)
					end)
					if v962 then
						local v964, v965, v966 = pairs(v963)
						while true do
							local vu967, v968 = v964(v965, v966)
							if vu967 == nil then
								break
							end
							local v969 = v968.Rarity
							local v970 = v968.CraftType
							local v971 = v968.Cure
							local v972 = v968.LevelData
							local v973 = v968.Key
							local v974 = v968.Locked
							local v975, v976, v977 = pairs(v961)
							v966 = vu967
							while true do
								local v978
								v977, v978 = v975(v976, v977)
								if v977 == nil then
									break
								end
								if v978 == v973 and (v969 ~= "Secret" and (v970 == "Baby" and (v971 == "" or not v971))) and (v974 == false and (v972.Level == 1 and v972.XP == 0)) then
									pcall(function()
										-- upvalues: (ref) vu289, (ref) vu967
										vu289.Packages.Knit.Services.PetService.RF.delete:InvokeServer(vu967)
									end)
								end
							end
						end
					end
				end
			end
			while vu288.Settings["Auto Secrets (Selected)"] do
				wait(0.2)
				if v957 == "8X" then
					v979({
						[1] = v955[v956].Egg,
						[2] = {},
						[4] = false,
						[5] = true
					})
				elseif v957 == "3X" then
					v979({
						v955[v956].Egg,
						{},
						true,
						false
					})
				elseif v957 == "30X" then
					v979({
						[1] = v955[v956].Egg,
						[4] = false,
						[6] = true
					})
				elseif v957 == "1X" then
					v979({
						[1] = v955[v956].Egg,
						[2] = {},
						[4] = false
					})
				end
			end
		end
	end
end)
local v980 = v12:addFolder("Merchant (By Slot)")
local v981 = require(vu289.Data.LimitedMerchant)
local v982, v983, v984 = pairs(v611.MerchantTypes)
local v985 = {}
while true do
	local v986, _ = v982(v983, v984)
	if v986 == nil then
		break
	end
	v984 = v986
	if v986 ~= "Farmer" then
		table.insert(v985, v986)
	end
end
local v987, v988, v989 = pairs(v981)
while true do
	local v990
	v989, v990 = v987(v988, v989)
	if v989 == nil then
		break
	end
	table.insert(v985, v989)
end
local vu991 = v980:addMultiCombo("Select Merchant", "Select Merchant to auto merchant", v985)
local vu992 = v980:addMultiCombo("Select Slot To Buy", "Select Slot Merchant to auto merchant", {
	"Slot 1",
	"Slot 2",
	"Slot 3",
	"Slot 4",
	"Slot 5"
})
v980:addToggle("Auto Buy Merchant (Selected)", "By activating this option you will start purchasing items from the selected merchant in which you selected", "Big", false, function(p993)
	-- upvalues: (ref) vu991, (ref) vu992, (ref) vu289, (ref) vu288
	if p993 then
		local v994 = vu991:getValue()
		local v995 = vu992:getValue()
		local function v1006(p996, p997)
			-- upvalues: (ref) vu289
			local vu998 = { p996, tonumber(p997) }
			local v999 = vu289:WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services")
			local vu1000 = v999:FindFirstChild("MerchantService")
			local vu1001 = v999:FindFirstChild("LimitedMerchantService")
			if vu1000 then
				local v1002, v1003 = pcall(function()
					-- upvalues: (ref) vu1000, (ref) vu998
					return vu1000.RF.BuyItem:InvokeServer(unpack(vu998))
				end)
				if v1002 and v1003 then
					return
				end
			end
			if vu1001 then
				local v1004, v1005 = pcall(function()
					-- upvalues: (ref) vu1001, (ref) vu998
					return vu1001.RF.BuyItem:InvokeServer(unpack(vu998))
				end)
				if v1004 and v1005 then
					return
				end
			end
		end
		local v1007, v1008, v1009 = pairs(v994)
		local v1010 = {}
		local v1011 = {}
		local v1012 = {}
		while true do
			local v1013
			v1009, v1013 = v1007(v1008, v1009)
			if v1009 == nil then
				break
			end
			table.insert(v1010, v1013)
		end
		local v1014, v1015, v1016 = pairs(v995)
		while true do
			local v1017
			v1016, v1017 = v1014(v1015, v1016)
			if v1016 == nil then
				break
			end
			local v1018 = string.gsub(v1017, "Slot", "")
			table.insert(v1011, tonumber(v1018))
		end
		local v1019, v1020, v1021 = ipairs(v1010)
		while true do
			local v1022
			v1021, v1022 = v1019(v1020, v1021)
			if v1021 == nil then
				break
			end
			local v1023, v1024, v1025 = ipairs(v1011)
			while true do
				local v1026
				v1025, v1026 = v1023(v1024, v1025)
				if v1025 == nil then
					break
				end
				table.insert(v1012, { v1022, v1026 })
			end
		end
		while vu288.Settings["Auto Buy Merchant (Selected)"] do
			wait()
			local v1027, v1028, v1029 = ipairs(v1012)
			while true do
				local v1030
				v1029, v1030 = v1027(v1028, v1029)
				if v1029 == nil then
					break
				end
				v1006(v1030[1], v1030[2])
			end
		end
	end
end)
function GetMerchantCurrency(p1031)
	if type(p1031) == "table" then
		local v1032 = p1031.Currency
		if v1032 then
			if type(v1032) ~= "table" then
				return v1032
			end
			if v1032.Item then
				return v1032.Item
			end
		end
		if p1031.Item and type(p1031.Item) ~= "table" then
			return p1031.Item
		else
			return nil
		end
	else
		return p1031
	end
end
local v1033 = require(vu289.Data.LimitedMerchant)
local v1034, v1035, v1036 = pairs(v1033)
local vu1037 = vu992
while true do
	local v1038
	v1036, v1038 = v1034(v1035, v1036)
	if v1036 == nil then
		break
	end
	local v1039 = v1038.Items[1][1]
	print(v1039)
	local vu1040 = GetMerchantCurrency(v1039)
	local v1041 = {}
	v12:addLine(v1036 .. ":", "Big")
	vu1037[v1036] = v12:addMultiCombo("Select Item To Buy", "Select Item Merchant to auto merchant", v1041)
	local v1042, v1043, v1044 = ipairs(v1038.Items)
	local vu1045 = v1036
	while true do
		local v1046
		v1044, v1046 = v1042(v1043, v1044)
		if v1044 == nil then
			break
		end
		local v1047, v1048, v1049 = ipairs(v1046)
		while true do
			local v1050, v1051 = v1047(v1048, v1049)
			if v1050 == nil then
				break
			end
			v1049 = v1050
			if v1051.Title then
				table.insert(v1041, v1051.Title)
			end
		end
	end
	v12:addToggle("Auto Buy Merchant (" .. vu1045 .. ")", "By activating this option you will buy the selected item from the merchant as soon as it becomes available!", "big", false, function(p1052)
		-- upvalues: (ref) vu1037, (ref) vu1045, (ref) vu288, (ref) vu289, (ref) vu287, (ref) vu1040
		if p1052 then
			local v1053 = vu1037[vu1045]:getValue()
			while vu288.Settings["Auto Buy Merchant (" .. vu1045 .. ")"] do
				task.wait(1)
				local v1054, v1055, v1056 = pairs(v1053)
				while true do
					local v1057
					v1056, v1057 = v1054(v1055, v1056)
					if v1056 == nil or not vu288.Settings["Auto Buy Merchant (" .. vu1045 .. ")"] then
						break
					end
					local v1058, v1059, v1060 = pairs(v1053)
					while true do
						local v1061
						v1060, v1061 = v1058(v1059, v1060)
						if v1060 == nil then
							break
						end
						local v1062 = require(vu289.ReplicaController)
						local v1063, v1064, v1065 = pairs(v1062._replicas)
						while true do
							local v1066
							v1065, v1066 = v1063(v1064, v1065)
							if v1065 == nil then
								break
							end
							if string.find(v1066.Class, "LimitedMerchant") then
								local v1067 = v1066.Data.LimitedMerchant[vu1045]
								local v1068, v1069, v1070 = pairs(v1067.Items)
								while true do
									local v1071
									v1070, v1071 = v1068(v1069, v1070)
									if v1070 == nil then
										break
									end
									local v1072 = require(vu289.Data.LimitedMerchant)[vu1045].Items
									local v1073, v1074, v1075 = pairs(v1072)
									local v1076 = v1070
									while true do
										local v1077
										v1075, v1077 = v1073(v1074, v1075)
										if v1075 == nil then
											break
										end
										local v1078, v1079, v1080 = pairs(v1077)
										local v1081 = v1075
										while true do
											local v1082
											v1080, v1082 = v1078(v1079, v1080)
											if v1080 == nil then
												break
											end
											if v1081 == v1076 and (v1080 == v1071.Index and v1082.Title == v1061) then
												local v1083 = vu287:GetAttribute(vu1040)
												local v1084 = RequestInventory(vu1040)
												local v1085 = math.round(v1083)
												local v1086 = math.round(v1084)
												local v1087 = tonumber(v1071.Stock)
												local v1088 = tonumber(v1082.Price)
												if 1 <= v1087 and v1088 <= v1085 or v1088 <= v1086 then
													local vu1089 = tonumber(v1081)
													pcall(function()
														-- upvalues: (ref) vu289, (ref) vu1045, (ref) vu1089
														vu289.Packages.Knit.Services.LimitedMerchantService.RF.BuyItem:InvokeServer(vu1045, vu1089)
													end)
												end
											end
										end
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
local vu1090 = require(vu289.Data.RebirthRanks)
local vu1091 = require(vu289.Data.RebirthRequirements)
local vu1092 = require(vu289.Enums.CurrencyTypes)
local vu1093 = require(vu289.Data.SuperRebirthCosts)
vu287:GetAttribute("Rebirths")
vu287:GetAttribute("MaxRebirths")
v13:addToggle("Auto Rebirth", "", "Big", false, function(p1094)
	-- upvalues: (ref) vu288, (ref) vu287, (ref) vu289
	if p1094 then
		while vu288.Settings["Auto Rebirth"] do
			task.wait()
			local v1095 = vu287:WaitForChild("leaderstats").Wins
			if vu287:GetAttribute("RebirthWinsRequired") <= v1095.Value then
				vu289.Packages.Knit.Services.RebirthService.RE.onRebirthRequest:FireServer()
			end
		end
	end
end)
v13:addToggle("Auto Rebirth Until Super Rebirth", "", "Big", false, function(p1096)
	-- upvalues: (ref) vu288, (ref) vu1090, (ref) vu287, (ref) vu1092, (ref) vu1093, (ref) vu289
	if p1096 then
		while vu288.Settings["Auto Rebirth Until Super Rebirth"] do
			task.wait()
			local v1097 = vu1090
			local v1098 = nil
			local v1099 = nil
			local v1100 = -1
			while true do
				v1099 = v1097(v1098, v1099)
				if v1099 == nil then
					break
				end
				v1100 = v1100 + 1
			end
			local v1101 = vu287
			local v1102 = math.min(v1101:GetAttribute("Rebirths") or 0, v1100)
			local v1103 = vu287:GetAttribute(vu1092.SuperRBTokens) or 0
			local v1104
			if vu1093[v1103 + 1] == nil then
				v1104 = false
			else
				v1104 = vu1093[v1103 + 1] <= v1102
			end
			if not v1104 then
				vu289.Packages.Knit.Services.RebirthService.RE.onRebirthRequest:FireServer()
			end
		end
	end
end)
v13:addToggle("Auto Super Rebirth", "", "Big", false, function(p1105)
	-- upvalues: (ref) vu288, (ref) vu1090, (ref) vu287, (ref) vu1092, (ref) vu1093, (ref) vu289
	if p1105 then
		while vu288.Settings["Auto Super Rebirth"] do
			task.wait()
			local v1106 = vu1090
			local v1107 = nil
			local v1108 = nil
			local v1109 = -1
			while true do
				v1108 = v1106(v1107, v1108)
				if v1108 == nil then
					break
				end
				v1109 = v1109 + 1
			end
			local v1110 = vu287
			local v1111 = math.min(v1110:GetAttribute("Rebirths") or 0, v1109)
			local v1112 = vu287:GetAttribute(vu1092.SuperRBTokens) or 0
			local v1113
			if vu1093[v1112 + 1] == nil then
				v1113 = false
			else
				v1113 = vu1093[v1112 + 1] <= v1111
			end
			if v1113 then
				vu289.Packages.Knit.Services.RebirthService.RE.onSuperRebirth:FireServer()
			end
		end
	end
end)
v13:addToggle("Auto Super Rebirth (Glitch)", "", "Big", true, function(p1114)
	-- upvalues: (ref) vu289, (ref) vu288, (ref) vu287
	if p1114 then
		local function v1115()
			-- upvalues: (ref) vu289
			vu289.Packages.Knit.Services.RebirthService.RE.onSuperRebirth:FireServer()
		end
		while vu288.Settings["Auto Super Rebirth (Glitch)"] and wait(1) do
			if vu287.PlayerGui.GameUI.Menus.Rebirth.Container.SuperRebirth.Visible then
				local v1116 = vu287:GetAttribute("BestZone")
				local v1117 = vu287:GetAttribute("TotalStrength")
				local v1118 = workspace:WaitForChild("GameObjects"):WaitForChild("ArmWrestling")
				local v1119 = require(vu289.Data.ArmWrestleNPCs)[tostring(v1116)]
				local v1120, v1121, v1122 = pairs(v1119)
				local v1123 = nil
				while true do
					local v1124
					v1122, v1124 = v1120(v1121, v1122)
					if v1122 == nil then
						break
					end
					local v1125 = v1124.Strength
					local v1126 = v1124.Name
					if v1123 == nil or v1119[v1123].Strength < v1125 and v1125 <= v1117 then
						v1123 = string.gsub(v1126, " ", "")
					end
				end
				local v1127, v1128, v1129 = pairs(v1118:GetChildren())
				while true do
					local v1130
					v1129, v1130 = v1127(v1128, v1129)
					if v1129 == nil then
						break
					end
					if v1130:IsA("Folder") and (v1130.Name ~= "6_OLD" and (v1130.Name ~= "Easter" and v1130.Name ~= "GreekEvent")) and v1130.NPC:FindFirstChild(v1123) then
						local v1131 = v1130.Name
						local vu1132 = { v1123, workspace.GameObjects.ArmWrestling[v1131].NPC[v1123].Table, v1131 }
						local v1133 = pcall(function()
							-- upvalues: (ref) vu289, (ref) vu1132
							return vu289.Packages.Knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer(unpack(vu1132))
						end)
						spawn(function()
							-- upvalues: (ref) vu288, (ref) vu289
							while vu288.Settings["Auto Super Rebirth (Glitch)"] and wait() do
								vu289.Packages.Knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
							end
						end)
						wait(3.7)
						if v1133 then
							v1115()
						end
					end
				end
			end
		end
	end
end)
v13:addToggle("AI Auto Rebirth", "", "Big", true, function(p1134)
	-- upvalues: (ref) vu287, (ref) vu289, (ref) vu288, (ref) vu1091
	if p1134 then
		vu287:GetAttribute("VIP")
		local vu1135 = {}
		local vu1136 = 300
		local vu1137 = 0
		function vu1135.SendRemoteRebirth()
			-- upvalues: (ref) vu289, (ref) vu1137, (ref) vu1135
			local v1138, _ = pcall(function()
				-- upvalues: (ref) vu289
				vu289:WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("RebirthService"):WaitForChild("RE"):WaitForChild("onRebirthRequest"):FireServer()
			end)
			if v1138 then
				vu1137 = 0
				wait(2)
				vu1135.Algoritimo()
			end
		end
		function vu1135.SendRemoteBoss(p1139, p1140)
			-- upvalues: (ref) vu288, (ref) vu289, (ref) vu287
			-- block 10
			spawn(function()
				-- upvalues: (ref) vu288, (ref) vu289
				while vu288.Settings["AI Auto Rebirth"] and wait() do
					vu289.Packages.Knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
				end
			end)
			local v1141, v1142, v1143
			-- NumForInit
local v1141, v1142, v1143 = 1, p1140, 1
-- end NumForInit
			-- ::l1::
			-- NumForNext
v1141 = v1141 + v1143;
if v1141 <= v1142
-- end NumForNext
			-- block 1
			-- goto l2
			-- ::l2::
			vu289.Packages.Knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer(unpack(p1139))
			wait(0.1)
			local v1144 = tick()
			local v1145 = v1141
			while true do
				wait(0.2)
				if tick() - v1144 > 10 then
					print("Tempo excedido para o Boss " .. v1145)
					return false
				end
				if not vu287.PlayerGui.GameUI.Wrestle.Visible then
					-- goto l1
				end
			end
			-- block 7
			-- goto l8
			-- ::l8::
			return true
		end
		function vu1135.Calculadora(p1146)
			-- upvalues: (ref) vu287, (ref) vu1091
			vu287:GetAttribute("RebirthWinsRequired")
			local v1147 = vu287:GetAttribute("RebirthWinsRequired")
			local v1148 = vu287:GetAttribute("Rebirths")
			local v1149 = 0
			for v1150 = 1, 25 do
				if v1147 <= p1146 * v1150 then
					v1149 = v1150
					break
				end
			end
			if v1149 <= 10 then
				for v1151 = 2, 25 do
					local v1152 = vu1091[v1148 + v1151]
					if not v1152 then
						break
					end
					for v1153 = 1, 25 do
						if v1152 <= p1146 * v1153 then
							if v1149 + v1153 <= 25 then
								v1149 = v1149 + v1153
								break
							end
						end
					end
					if v1149 >= 25 then
						break
					end
				end
			end
			if v1149 == 0 then
				return nil
			else
				return v1149
			end
		end
		function vu1135.TrainKnucles()
			-- upvalues: (ref) vu287, (ref) vu289, (ref) vu1137, (ref) vu288, (ref) vu1135
			local v1154 = vu287:GetAttribute("BestZone")
			local v1155 = vu287:GetAttribute("VIP")
			local v1156 = workspace.Zones:FindFirstChild(v1154).Interactables.Teleports.Locations:GetChildren()
			local v1157 = FindBestTierKnucle()
			if v1154 and #v1156 > 0 then
				vu289.Packages.Knit.Services.ZoneService.RE.teleport:FireServer(v1156[1])
			end
			repeat
				wait(0.5)
			until vu287.PlayerGui.TeleportScreen.Frame.Position == UDim2.new(0, 0, 1, 0)
			wait(0.5)
			if v1157 then
				if vu1137 > 5 then
					print("Seus Pets estao fracos de mais!! 25 minutos de farm")
				else
					vu1137 = vu1137 + 1
					createIndicatorTween(workspace.Zones[tostring(v1154)].Interactables.Training.PunchBags[tostring(v1157)].Primary.CFrame + Vector3.new(0, 5, 0)):Play()
					while vu288.Settings.RebirthTrainAI do
						local v1158 = FindBestTierKnucle()
						if v1158 ~= v1157 then
							createIndicatorTween(workspace.Zones[tostring(v1154)].Interactables.Training.PunchBags[tostring(v1158)].Primary.CFrame + Vector3.new(0, 5, 0)):Play()
							v1157 = v1158
						end
						local v1159
						if v1155 then
							v1159 = { tostring(v1154), "VIP", v1155 }
						else
							v1159 = { tostring(v1154), tostring(v1158) }
						end
						vu289.Packages.Knit.Services.PunchBagService.RE.onGiveStats:FireServer(unpack(v1159))
						wait()
					end
					vu1135.Algoritimo()
				end
			end
		end
		function vu1135.Algoritimo()
			-- upvalues: (ref) vu287, (ref) vu289, (ref) vu1135, (ref) vu288, (ref) vu1136, (ref) vu1091
			local vu1160 = vu287:GetAttribute("BestZone")
			local v1161 = require(vu289.Data.ArmWrestleNPCs)[vu1160]
			local _ = workspace.GameObjects.ArmWrestling[vu1160].NPC
			local v1162 = vu287:GetAttribute("TotalStrength")
			local v1163, v1164, v1165 = pairs(v1161)
			local v1166 = {}
			local v1167 = {}
			while true do
				local v1168
				v1165, v1168 = v1163(v1164, v1165)
				if v1165 == nil then
					break
				end
				local v1169 = {
					["Name"] = v1165,
					["Wins"] = v1168.Wins,
					["Strength"] = v1168.Strength
				}
				table.insert(v1166, v1169)
			end
			local v1170, v1171, v1172 = ipairs(v1166)
			while true do
				local v1173
				v1172, v1173 = v1170(v1171, v1172)
				if v1172 == nil then
					break
				end
				local v1174 = vu1135.Calculadora(v1173.Wins)
				local v1175 = {
					["Name"] = v1173.Name,
					["Res"] = v1174,
					["Strength"] = v1173.Strength
				}
				table.insert(v1167, v1175)
			end
			if #v1167 ~= 0 then
				local v1176 = v1167[1].Res or math.huge
				local vu1177 = v1167[1].Name
				local v1178 = v1167[1].Strength or math.huge
				local v1179, v1180, v1181 = ipairs(v1167)
				while true do
					local v1182
					v1181, v1182 = v1179(v1180, v1181)
					if v1181 == nil then
						break
					end
					if v1182.Res and v1182.Res < v1176 or v1182.Res == v1176 and (v1182.Strength and v1182.Strength < v1178) then
						v1176 = v1182.Res
						vu1177 = v1182.Name
						v1178 = v1182.Strength
					end
				end
				local function v1184()
					-- upvalues: (ref) vu1160, (ref) vu1177
					local v1183 = workspace.GameObjects.ArmWrestling:FindFirstChild(vu1160).NPC[vu1177].Table
					if v1183 then
						return { vu1177, v1183, vu1160 }
					end
				end
				local function v1185()
					-- upvalues: (ref) vu1135, (ref) vu288, (ref) vu1136
					spawn(function()
						-- upvalues: (ref) vu1135
						vu1135.TrainKnucles()
					end)
					vu288.Settings.RebirthTrainAI = true
					wait(vu1136)
					vu288.Settings.RebirthTrainAI = false
				end
				print("O menor Res \195\169 de " .. vu1177 .. " com um valor de " .. v1176)
				if v1162 < v1178 then
					local v1186 = (v1178 - v1162) / v1178 * 100
					if v1186 < 10 then
						print("A for\195\167a do boss " .. vu1177 .. " \195\169 menos de 10% maior que a for\195\167a do jogador!")
						if workspace.GameObjects.ArmWrestling:FindFirstChild(vu1160).NPC[vu1177].Table then
							local v1187 = v1184()
							if v1187 and vu1135.SendRemoteBoss(v1187, v1176) then
								print("Matou as quantidade necessaria do boss!")
								vu1135.SendRemoteRebirth()
							else
								print("Tu ta muito lerdo para matar o boss!!, voltando ao treino!")
								spawn(function()
									-- upvalues: (ref) vu1135
									vu1135.TrainKnucles()
								end)
								v1185()
							end
						end
					else
						print("A for\195\167a do jogador \195\169 " .. v1186 .. "% menor do que a for\195\167a do boss " .. vu1177)
						if vu1091[vu287:GetAttribute("Rebirths") + 1] > vu287:WaitForChild("leaderstats").Wins.Value then
							v1185()
						else
							vu1135.SendRemoteRebirth()
						end
					end
				else
					print("A for\195\167a do jogador \195\169 maior que a do boss!")
					if workspace.GameObjects.ArmWrestling:FindFirstChild(vu1160).NPC[vu1177].Table then
						local v1188 = v1184()
						if v1188 and vu1135.SendRemoteBoss(v1188, v1176) then
							print("Matou as quantidade necessaria do boss!")
							vu1135.SendRemoteRebirth()
						end
					end
				end
			else
				print("Nenhum resultado encontrado na tabela BossesCal.")
			end
		end
		vu1135.Algoritimo()
	end
end)
v14:addToggle("Auto Trial Medieval (W13)", "", "Big", false, function(p1189)
	-- upvalues: (ref) vu288, (ref) vu289, (ref) vu287, (ref) vu286
	if p1189 then
		local vu1190 = "Medieval"
		local v1191 = nil
		while vu288.Settings["Auto Trial Medieval (W13)"] do
			task.wait()
			if GetTrialActive(vu1190) then
				local _, _ = pcall(function()
					-- upvalues: (ref) vu289, (ref) vu1190
					vu289.Packages.Knit.Services.ChampionshipService.RF.RequestJoin:InvokeServer(vu1190)
				end)
				local v1192
				if v1191 and v1191 == vu287.PlayerGui.GameUI.Hud.WrestleRaid.Room.Text then
					v1192 = 0
				else
					v1191 = vu287.PlayerGui.GameUI.Hud.WrestleRaid.Room.Text
					v1192 = 2
				end
				task.wait(v1192)
				vu286.GetService("ArmWrestleService"):RequestClick()
				if GetTrialActive(vu1190) and vu288.Settings["Auto Trial Medieval (W13)"] then
					break
				end
			end
		end
	end
end)
v14:addToggle("Auto Evil Trial (W15)", "", "Big", false, function(p1193)
	-- upvalues: (ref) vu288, (ref) vu289, (ref) vu287, (ref) vu286
	if p1193 then
		local vu1194 = "Angelic"
		local v1195 = nil
		while vu288.Settings["Auto Evil Trial (W15)"] do
			task.wait()
			if GetTrialActive(vu1194) then
				local _, _ = pcall(function()
					-- upvalues: (ref) vu289, (ref) vu1194
					vu289.Packages.Knit.Services.ChampionshipService.RF.RequestJoin:InvokeServer(vu1194)
				end)
				local v1196
				if v1195 and v1195 == vu287.PlayerGui.GameUI.Hud.WrestleRaid.Room.Text then
					v1196 = 0
				else
					v1195 = vu287.PlayerGui.GameUI.Hud.WrestleRaid.Room.Text
					v1196 = 2
				end
				task.wait(v1196)
				vu286.GetService("ArmWrestleService"):RequestClick()
				if GetTrialActive(vu1194) and vu288.Settings["Auto Evil Trial (W15)"] then
					break
				end
			end
		end
	end
end)
local vu1197 = v15:addMultiCombo("Select Size Craft", "", { "Big", "Huge" })
v15:addToggle("Auto Craft (Selected)", "", "big", false, function(p1198)
	-- upvalues: (ref) vu288, (ref) vu1197, (ref) vu289, (ref) vu287
	if p1198 then
		while vu288.Settings["Auto Craft (Selected)"] and wait(1) do
			local v1199 = vu1197:getValue()
			local v1200 = vu289.Packages.Knit.Services.PetService.RF.getOwned:InvokeServer(vu287)
			local v1201, v1202, v1203 = pairs(v1200)
			local v1204 = {}
			while true do
				local v1205
				v1203, v1205 = v1201(v1202, v1203)
				if v1203 == nil then
					break
				end
				local v1206 = v1205.Key
				local v1207 = v1205.CraftType
				if not v1204[v1206] then
					v1204[v1206] = {
						["Baby"] = {},
						["Big"] = {}
					}
				end
				if v1207 == "Baby" then
					table.insert(v1204[v1206].Baby, v1203)
				elseif v1207 == "Big" then
					table.insert(v1204[v1206].Big, v1203)
				end
			end
			local v1208, v1209, v1210 = pairs(v1204)
			while true do
				local v1211
				v1210, v1211 = v1208(v1209, v1210)
				if v1210 == nil then
					break
				end
				local v1212 = #v1211.Baby
				local v1213 = #v1211.Big
				local v1214, v1215, v1216 = pairs(v1199)
				while true do
					local v1217
					v1216, v1217 = v1214(v1215, v1216)
					if v1216 == nil then
						break
					end
					wait(0.5)
					if v1217 == "Big" then
						if v1212 >= 3 then
							local v1218 = { v1211.Baby[1], true }
							vu289.Packages.Knit.Services.PetService.RF.craft:InvokeServer(unpack(v1218))
						end
					elseif v1217 == "Huge" and 3 <= v1213 then
						local v1219 = { v1211.Big[1], true }
						vu289.Packages.Knit.Services.PetService.RF.craft:InvokeServer(unpack(v1219))
					end
				end
			end
		end
	end
end)
v15:addToggle("Auto Craft All (Faster)", "", "big", true, function(p1220)
	-- upvalues: (ref) vu288, (ref) vu287
	if p1220 then
		while vu288.Settings["Auto Craft All (Faster)"] do
			wait(1.5)
			local v1221 = vu287.PlayerGui.GameUI.Menus.Inventory.ExtraTools.Pets.BottomBar.CraftAll
			local v1222 = vu287.PlayerGui.GameUI.Menus.ConfirmationMenu.Btns.Yes.Button
			if v1221 then
				local v1223, v1224 = pcall(getconnections, v1221.MouseButton1Click)
				if v1223 and #v1224 > 0 then
					local v1225, v1226, v1227 = ipairs(v1224)
					while true do
						local vu1228
						v1227, vu1228 = v1225(v1226, v1227)
						if v1227 == nil then
							break
						end
						pcall(function()
							-- upvalues: (ref) vu1228
							vu1228:Fire()
						end)
					end
				end
			end
			if v1222 then
				local v1229, v1230 = pcall(getconnections, v1222.MouseButton1Click)
				if v1229 and #v1230 > 0 then
					local v1231, v1232, v1233 = ipairs(v1230)
					while true do
						local vu1234
						v1233, vu1234 = v1231(v1232, v1233)
						if v1233 == nil then
							break
						end
						pcall(function()
							-- upvalues: (ref) vu1234
							vu1234:Fire()
						end)
					end
				end
			end
		end
	end
end)
local v1235 = require(vu289.Data.Item.ItemInfo)
local v1236, v1237, v1238 = pairs(v1235)
local v1239 = {}
local v1240 = {}
local v1241 = {}
while true do
	local v1242, _ = v1236(v1237, v1238)
	if v1242 == nil then
		break
	end
	v1238 = v1242
	if string.find(v1242, "Potion") then
		table.insert(v1239, v1242)
	end
end
local v1243, v1244, v1245 = pairs(v1235)
while true do
	local v1246, v1247 = v1243(v1244, v1245)
	if v1246 == nil then
		break
	end
	v1245 = v1246
	if v1247.ItemType == "Snacks" then
		table.insert(v1240, v1246)
	end
end
local v1248, v1249, v1250 = pairs(v1235)
while true do
	local v1251, v1252 = v1248(v1249, v1250)
	if v1251 == nil then
		break
	end
	v1250 = v1251
	if v1252.ItemType == "Eggs" then
		table.insert(v1241, v1251)
	end
end
v16:addLine("Potion Options:", "Big")
local vu1253 = v16:addMultiCombo("Select Potion", "", v1239)
local vu1254 = 1
v16:addSlider("Timer to Potion (Minutes)", "", 1, 60, function(p1255)
	-- upvalues: (ref) vu1254
	vu1254 = p1255
end)
v16:addToggle("Auto use Potion (Selected)", "", "big", false, function(p1256)
	-- upvalues: (ref) vu288, (ref) vu1253, (ref) vu289, (ref) vu1254
	if p1256 then
		while vu288.Settings["Auto use Potion (Selected)"] do
			local v1257 = vu1253:getValue()
			local v1258, v1259, v1260 = pairs(v1257)
			while true do
				local v1261
				v1260, v1261 = v1258(v1259, v1260)
				if v1260 == nil then
					break
				end
				vu289.Packages.Knit.Services.ItemService.RF.UseItem:InvokeServer(v1261, "1")
			end
			task.wait(vu1254)
		end
	end
end)
v16:addLine("Snacks Options:", "Big")
local vu1262 = v16:addMultiCombo("Select Snacks", "", v1240)
local vu1263 = 1
v16:addSlider("Timer to Snacks (Minutes)", "", 1, 60, function(p1264)
	-- upvalues: (ref) vu1263
	vu1263 = p1264
end)
v16:addToggle("Auto use Snacks (Selected)", "", "big", false, function(p1265)
	-- upvalues: (ref) vu288, (ref) vu1262, (ref) vu289, (ref) vu1263
	if p1265 then
		while vu288.Settings["Auto use Snacks (Selected)"] do
			local v1266 = vu1262:getValue()
			local v1267, v1268, v1269 = pairs(v1266)
			while true do
				local v1270
				v1269, v1270 = v1267(v1268, v1269)
				if v1269 == nil then
					break
				end
				vu289.Packages.Knit.Services.ItemService.RF.UseItem:InvokeServer(v1270, "1")
			end
			task.wait(vu1263)
		end
	end
end)
v16:addLine("Eggs Options:", "Big")
local vu1271 = v16:addMultiCombo("Select Eggs", "", v1241)
v16:addToggle("Auto use Eggs (Selected)", "", "big", false, function(p1272)
	-- upvalues: (ref) vu288, (ref) vu1271, (ref) vu289
	if p1272 then
		while vu288.Settings["Auto use Eggs (Selected)"] do
			task.wait()
			local v1273 = vu1271:getValue()
			local v1274, v1275, v1276 = pairs(v1273)
			while true do
				local v1277
				v1276, v1277 = v1274(v1275, v1276)
				if v1276 == nil then
					break
				end
				vu289.Packages.Knit.Services.ItemService.RF.UseItem:InvokeServer(v1277, "1")
				task.wait()
				vu289.Packages.Knit.Services.ItemService.RF.OpenEgg:InvokeServer(1)
			end
		end
	end
end)
v17:addToggle("Auto Skull Cave Tower (W21)", "", "Big", false, function(p1278)
	-- upvalues: (ref) vu288, (ref) vu289, (ref) vu287
	if p1278 then
		while vu288.Settings["Auto Skull Cave Tower (W21)"] do
			task.wait()
			if RequestInventory("Skull Cave Tower Key") then
				local v1279, _ = pcall(function()
					-- upvalues: (ref) vu289
					return vu289.Packages.Knit.Services.TowerService.RF.EnterTower:InvokeServer("SkullCaveTower", true)
				end)
				if v1279 then
					vu289.Packages.Knit.Services.WrestleService.RF.OnAutoFight:InvokeServer()
					task.wait()
					vu289.Packages.Knit.Services.WrestleService.RF.OnClick:InvokeServer()
					if vu288.Settings["Auto Skull Cave Tower (W21)"] and vu287.PlayerGui.GameUI.Hud.Tower.Visible then
						break
					end
				end
			end
		end
	end
end)
v17:addToggle("Auto Super Wrestle (W18)", "", "Big", false, function(p1280)
	-- upvalues: (ref) vu288, (ref) vu289, (ref) vu287
	if p1280 then
		while vu288.Settings["Auto Super Wrestle (W18)"] do
			task.wait()
			if RequestInventory("Super Wresle Key") then
				local v1281, _ = pcall(function()
					-- upvalues: (ref) vu289
					return vu289.Packages.Knit.Services.TowerService.RF.EnterTower:InvokeServer("SuperWrestle", true)
				end)
				if v1281 then
					vu289.Packages.Knit.Services.WrestleService.RF.OnAutoFight:InvokeServer()
					repeat
						task.wait()
						vu289.Packages.Knit.Services.WrestleService.RF.OnClick:InvokeServer()
					until not (vu288.Settings["Auto Super Wrestle (W18)"] and vu287.PlayerGui.GameUI.Hud.Tower.Visible)
				end
			end
		end
	end
end)
v17:addToggle("Auto Rift Cave (W16)", "", "Big", false, function(p1282)
	-- upvalues: (ref) vu288, (ref) vu289, (ref) vu287
	if p1282 then
		while vu288.Settings["Auto Rift Cave (W16)"] do
			task.wait()
			if RequestInventory("Rift Cave Key") then
				local v1283, _ = pcall(function()
					-- upvalues: (ref) vu289
					return vu289.Packages.Knit.Services.TowerService.RF.EnterTower:InvokeServer("RiftCave", true)
				end)
				if v1283 then
					vu289.Packages.Knit.Services.WrestleService.RF.OnAutoFight:InvokeServer()
					task.wait()
					vu289.Packages.Knit.Services.WrestleService.RF.OnClick:InvokeServer()
					if vu288.Settings["Auto Rift Cave (W16)"] and vu287.PlayerGui.GameUI.Hud.Tower.Visible then
						break
					end
				end
			end
		end
	end
end)
v17:addToggle("Auto Beach Tower (W3)", "", "Big", false, function(p1284)
	-- upvalues: (ref) vu288, (ref) vu289, (ref) vu287
	if p1284 then
		while vu288.Settings["Auto Beach Tower (W3)"] do
			task.wait()
			if RequestInventory("Beach Tower Key") then
				local v1285, _ = pcall(function()
					-- upvalues: (ref) vu289
					return vu289.Packages.Knit.Services.TowerService.RF.EnterTower:InvokeServer("BeachTower", true)
				end)
				if v1285 then
					vu289.Packages.Knit.Services.WrestleService.RF.OnAutoFight:InvokeServer()
					task.wait()
					vu289.Packages.Knit.Services.WrestleService.RF.OnClick:InvokeServer()
					if vu288.Settings["Auto Beach Tower (W3)"] and vu287.PlayerGui.GameUI.Hud.Tower.Visible then
						break
					end
				end
			end
		end
	end
end)
local vu1286 = v18:addCombo("Amount Spin (W21)", "", { "1X", "3X", "10X" })
v18:addToggle("Auto Spin Egyptian (W21)", "By activating this option you will spin the wheel automatically (you need tickets)", "Big", false, function(p1287)
	-- upvalues: (ref) vu1286, (ref) vu288, (ref) vu289
	if p1287 then
		local v1288 = vu1286:getValue()
		local v1289 = {
			["1X"] = {
				["Amount"] = 20
			},
			["3X"] = {
				["Argumento"] = "x10",
				["Amount"] = 60
			},
			["10X"] = {
				["Argumento"] = "x25",
				["Amount"] = 200
			}
		}
		while vu288.Settings["Auto Spin Egyptian (W21)"] do
			wait()
			local v1290 = RequestInventory("Egyptian Ticket")
			if tonumber(v1290) >= v1289[v1288].Amount then
				local vu1291 = v1289[v1288].Argumento or nil
				pcall(function()
					-- upvalues: (ref) vu1291, (ref) vu289
					print(vu1291)
					vu289.Packages.Knit.Services.SpinnerService.RF.Spin:InvokeServer("Egyptian Fortune", vu1291)
				end)
			end
		end
	end
end)
local vu1292 = v18:addCombo("Amount Spin (W20)", "", { "1X", "3X", "10X" })
v18:addToggle("Auto Spin Sakura (W20)", "By activating this option you will spin the wheel automatically (you need tickets)", "Big", false, function(p1293)
	-- upvalues: (ref) vu1292, (ref) vu288, (ref) vu289
	if p1293 then
		local v1294 = vu1292:getValue()
		local v1295 = {
			["1X"] = {
				["Amount"] = 20
			},
			["3X"] = {
				["Argumento"] = "x10",
				["Amount"] = 60
			},
			["10X"] = {
				["Argumento"] = "x25",
				["Amount"] = 200
			}
		}
		while vu288.Settings["Auto Spin Sakura (W20)"] do
			wait()
			local v1296 = RequestInventory("Sakura Ticket")
			if tonumber(v1296) >= v1295[v1294].Amount then
				local vu1297 = v1295[v1294].Argumento or nil
				pcall(function()
					-- upvalues: (ref) vu1297, (ref) vu289
					print(vu1297)
					vu289.Packages.Knit.Services.SpinnerService.RF.Spin:InvokeServer("Sakura Fortune", vu1297)
				end)
			end
		end
	end
end)
v18:addToggle("Auto Matrix Crate (W17)", "", "Big", false, function(p1298)
	-- upvalues: (ref) vu288, (ref) vu289
	if p1298 then
		while vu288.Settings["Auto Matrix Crate (W17)"] do
			task.wait()
			if RequestInventory("Matrix Key") >= 1 then
				vu289.Packages.Knit.Services.ItemCrateService.RF.Spin:InvokeServer("Matrix")
			end
		end
	end
end)
local vu1299 = v18:addCombo("Amount Spin (W15)", "", { "1X", "3X", "10X" })
v18:addToggle("Auto Spin Divine (W15)", "By activating this option you will spin the wheel automatically (you need tickets)", "Big", false, function(p1300)
	-- upvalues: (ref) vu1299, (ref) vu288, (ref) vu289
	if p1300 then
		local v1301 = vu1299:getValue()
		local v1302 = {
			["1X"] = {
				["Amount"] = 20
			},
			["3X"] = {
				["Argumento"] = "x10",
				["Amount"] = 60
			},
			["10X"] = {
				["Argumento"] = "x25",
				["Amount"] = 200
			}
		}
		while vu288.Settings["Auto Spin Divine (W15)"] do
			wait()
			local v1303 = RequestInventory("Heavenly Ticket")
			if tonumber(v1303) >= v1302[v1301].Amount then
				local vu1304 = v1302[v1301].Argumento or nil
				pcall(function()
					-- upvalues: (ref) vu1304, (ref) vu289
					print(vu1304)
					vu289.Packages.Knit.Services.SpinnerService.RF.Spin:InvokeServer("Divine Fortune", vu1304)
				end)
			end
		end
	end
end)
v18:addToggle("Auto Vault Goblin (W14)", "", "Big", false, function(p1305)
	-- upvalues: (ref) vu288, (ref) vu289
	if p1305 then
		while vu288.Settings["Auto Vault Goblin (W14)"] do
			task.wait()
			if RequestInventory("Gold") >= 1 then
				vu289.Packages.Knit.Services.ChestService.RF.Open:InvokeServer("OrcVault")
			end
		end
	end
end)
v18:addToggle("Auto Chest Master (W13)", "", "Big", false, function(p1306)
	-- upvalues: (ref) vu288, (ref) vu289
	if p1306 then
		while vu288.Settings["Auto Chest Master (W13)"] do
			task.wait()
			if RequestInventory("Lost Chest Key") >= 1 then
				vu289.Packages.Knit.Services.ChestService.RF.Open:InvokeServer("KingdomChest")
			end
		end
	end
end)
local v1307 = require(vu289.Data.Item.TrainerCrates)
local v1308, v1309, v1310 = pairs(v1307.Chances)
local v1311 = {}
while true do
	local v1312
	v1310, v1312 = v1308(v1309, v1310)
	if v1310 == nil then
		break
	end
	local v1313, v1314, v1315 = pairs(v1312)
	while true do
		local v1316
		v1315, v1316 = v1313(v1314, v1315)
		if v1315 == nil then
			break
		end
		tostring(v1315)
		table.insert(v1311, v1315)
	end
end
v18:addToggle("Auto Roll Aura", "", "Big", false, function(p1317)
	-- upvalues: (ref) vu288, (ref) vu289
	if p1317 then
		while vu288.Settings["Auto Roll Aura"] do
			task.wait()
			vu289.Packages.Knit.Services.AuraService.RF.Roll:InvokeServer()
		end
	end
end)
local vu1318 = v18:addMultiCombo("Select Crate", "", v1311)
v18:addToggle("Auto Open Crate Trainer (Selected)", "", "Big", false, function(p1319)
	-- upvalues: (ref) vu288, (ref) vu1318, (ref) vu289
	if p1319 then
		while vu288.Settings["Auto Open Crate Trainer (Selected)"] do
			task.wait()
			local v1320 = vu1318:getValue()
			local v1321, v1322, v1323 = pairs(v1320)
			while true do
				local v1324
				v1323, v1324 = v1321(v1322, v1323)
				if v1323 == nil then
					break
				end
				if RequestInventory(v1324) >= 1 then
					vu289.Packages.Knit.Services.TrainerService.RF.OpenCrate:InvokeServer("Starter Crate")
				end
			end
		end
	end
end)
v19:addToggle("Auto Token Quest", "", "Big", false, function(p1325)
	-- upvalues: (ref) vu287, (ref) vu288, (ref) vu289
	if p1325 then
		local v1326 = vu287:GetAttribute("TokenQuestString")
		local function v1333()
			-- upvalues: (ref) vu288, (ref) vu287, (ref) vu289
			local vu1327 = workspace.Zones["1"].Interactables.Training.PunchBags.Tier1.Primary.CFrame + Vector3.new(0, 5, 0)
			local vu1328 = createIndicatorTween(vu1327)
			local v1329 = vu1328
			vu1328.Play(v1329)
			spawn(function()
				-- upvalues: (ref) vu288, (ref) vu287, (ref) vu1327, (ref) vu1328
				wait(5)
				while vu288.Settings["Auto Token Quest"] do
					local v1330 = vu287
					if tonumber(v1330:GetAttribute("TokenTimer")) <= 1 then
						break
					end
					task.wait(0.5)
					local v1331 = Char().PrimaryPart.Position
					if (vu1327.Position - v1331).Magnitude > 8 then
						vu1328:Play()
					end
				end
			end)
			while vu288.Settings["Auto Token Quest"] do
				local v1332 = vu287
				if tonumber(v1332:GetAttribute("TokenTimer")) <= 1 then
					break
				end
				task.wait()
				vu289.Packages.Knit.Services.PunchBagService.RE.onGiveStats:FireServer(unpack({ "1", "Tier1" }))
			end
		end
		local function v1339(p1334)
			-- upvalues: (ref) vu289, (ref) vu287, (ref) vu288
			while true do
				task.wait()
				local v1335 = p1334 .. "1Kg"
				if Char():FindFirstChild(v1335) then
					vu289.Packages.Knit.Services.ToolService.RE.onClick:FireServer()
				else
					vu289.Packages.Knit.Services.ToolService.RE.onGuiEquipRequest:FireServer(unpack({ "1", p1334, "1Kg" }))
				end
				local v1336 = vu287
				local v1337 = vu287
				if tonumber(v1336:GetAttribute("TokenQuestProgress")) == tonumber(v1337:GetAttribute("TokenQuestTotal")) then
					break
				end
				local v1338 = vu287
				if tonumber(v1338:GetAttribute("TokenTimer")) <= 1 or not vu288.Settings["Auto Token Quest"] then
					break
				end
			end
		end
		local function v1345(p1340)
			local v1341, v1342, v1343 = ipairs({ "Grip", "Dumbbell", "knuckles" })
			while true do
				local v1344
				v1343, v1344 = v1341(v1342, v1343)
				if v1343 == nil then
					break
				end
				if string.match(p1340, v1344) then
					return v1344 == "Dumbbell" and "Dumbells" or (v1344 == "knuckles" and "knuckles" or v1344 .. "s")
				end
			end
			return nil
		end
		while vu288.Settings["Auto Token Quest"] do
			task.wait()
			local v1346 = vu287
			if tonumber(v1346:GetAttribute("TokenTimer")) > 1 then
				local v1347 = vu287
				local v1348 = vu287
				if tonumber(v1347:GetAttribute("TokenQuestProgress")) < tonumber(v1348:GetAttribute("TokenQuestTotal")) then
					vu289.Packages.Knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones["1"].Interactables.Teleports.Locations.BackToSchool)
					repeat
						wait(0.5)
					until vu287.PlayerGui.TeleportScreen.Frame.Position == UDim2.new(0, 0, 1, 0)
					local v1349 = v1345(v1326)
					if v1349 == "knuckles" then
						v1333()
					else
						v1339(v1349)
					end
				end
			end
		end
	end
end)
v19:addToggle("Auto Spin Roulette", "By activating this option you will spin the wheel automatically (you need tickets)", "Big", false, function(_)
	-- upvalues: (ref) vu288, (ref) vu289
	while vu288.Settings["Auto Spin Roulette"] and wait() do
		vu289:WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("SpinService"):WaitForChild("RE"):WaitForChild("onSpinRequest"):FireServer(true)
	end
end)
v19:addToggle("Auto Claim Daily Rewards", "By activating this option you will start getting all daily rewards", "Big", false, function(_)
	-- upvalues: (ref) vu288, (ref) vu289
	while vu288.Settings["Auto Claim Daily Rewards"] and wait() do
		vu289:WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("DailyRewardService"):WaitForChild("RE"):WaitForChild("onClaimReward"):FireServer()
	end
end)
v19:addToggle("Auto Claim Free Gifts", "By activating this option you will start receiving all free gifts automatically", "Big", false, function(_)
	-- upvalues: (ref) vu288, (ref) vu289
	while vu288.Settings["Auto Claim Free Gifts"] and wait() do
		for v1350 = 1, 12 do
			vu289:WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("TimedRewardService"):WaitForChild("RE"):WaitForChild("onClaim"):FireServer(v1350)
		end
	end
end)
local vu1351 = workspace.GameObjects.QuestLeaderboard
local v1352, v1353, v1354 = pairs(vu1351:GetChildren())
local v1355 = {}
while true do
	local v1356
	v1354, v1356 = v1352(v1353, v1354)
	if v1354 == nil then
		break
	end
	table.insert(v1355, v1356.Name)
end
local vu1357 = v19:addCombo("Select Quest", "Select Quest to auto quest", v1355)
v19:addToggle("Auto Quest (Selected)", "Activating this option will kill the boss of the selected quest the amount necessary to earn its reward.", "Big", false, function(p1358)
	-- upvalues: (ref) vu1357, (ref) vu1351, (ref) vu288, (ref) vu289
	if p1358 then
		local v1359 = vu1351:FindFirstChild((vu1357:getValue()))
		local v1360 = v1359.Info.SurfaceGui.Frame.Description.Text:gsub("Beat", ""):gsub("Times!", ""):gsub("%d", ""):gsub("%s", ""):gsub(",", "")
		spawn(function()
			-- upvalues: (ref) vu288, (ref) vu289
			while vu288.Settings["Auto Quest (Selected)"] do
				wait()
				vu289.Packages.Knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
			end
		end)
		local function v1366(p1361)
			local v1362, v1363 = p1361:match("(%d+)/(%d+)")
			local v1364 = tonumber(v1362)
			local v1365 = tonumber(v1363)
			if v1364 and v1365 then
				if v1364 == 0 then
					v1364 = v1364 + 1
				end
				return v1365 > v1364
			end
		end
		while vu288.Settings["Auto Quest (Selected)"] and (wait() and v1366(v1359.Info.SurfaceGui.Frame.Progress.TextLabel.Text)) do
			local v1367 = workspace:WaitForChild("GameObjects"):WaitForChild("ArmWrestling")
			local v1368, v1369, v1370 = pairs(v1367:GetChildren())
			while true do
				local v1371
				v1370, v1371 = v1368(v1369, v1370)
				if v1370 == nil then
					break
				end
				if v1371:IsA("Folder") and v1371.NPC:FindFirstChild(v1360) then
					local v1372 = v1371.Name
					local v1373 = { v1360, workspace:WaitForChild("GameObjects"):WaitForChild("ArmWrestling"):WaitForChild(v1372):WaitForChild("NPC"):WaitForChild(v1360):WaitForChild("Table"), v1372 }
					vu289:WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RE"):WaitForChild("onEnterNPCTable"):FireServer(unpack(v1373))
				end
			end
		end
	end
end)
