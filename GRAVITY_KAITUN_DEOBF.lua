--DEOBFUSCATED BY _NYZLINH
local L_1_ = {}
L_1_[3] = table["concat"]
if not game:IsLoaded() then
	repeat
		game["Loaded"]:Wait()
	until game:IsLoaded()
end;
(getgenv())["Configs"] = {
	["Quest"] = {
		["Evo Race V1"] = true,
		["Evo Race V2"] = true;
		["RGB Haki"] = true,
		["Pull Lerver"] = true
	};
	["Sword"] = {
		"Dual-Headed Blade",
		"Smoke Admiral",
		"Wardens Sword",
		"Cutlass",
		"Katana";
		"Dual Katana";
		"Triple Katana",
		"Iron Mace",
		"Saber";
		"Pole (1st Form)",
		"Gravity Blade",
		"Longsword";
		"Rengoku";
		"Midnight Blade",
		"Soul Cane",
		"Bisento",
		"Yama";
		"Tushita";
		"Cursed Dual Katana"
	};
	["Gun"] = {
		"Soul Guitar";
		"Kabucha",
		"Venom Bow",
		"Musket";
		"Flintlock",
		"Refined Slingshot",
		"Magma Blaster";
		"Dual Flintlock",
		"Cannon",
		"Bizarre Revolver";
		"Bazooka"
	};
	["FPS Booster"] = false
}
wait(5)
if game["Players"]["LocalPlayer"]["PlayerGui"]:FindFirstChild("Main (minimal)") then
	if game["Players"]["LocalPlayer"]["PlayerGui"]["Main (minimal)"]:FindFirstChild("ChooseTeam") then
		repeat
			wait()
			if (game["Players"]["LocalPlayer"]["PlayerGui"]:FindFirstChild("Main (minimal)"))["ChooseTeam"]["Visible"] then
				(((game:GetService("ReplicatedStorage")):WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("SetTeam", "Pirates")
			end
		until game["Players"]["LocalPlayer"]["Team"] ~= nil and game:IsLoaded()
	end
end
wait(5)
if game["Players"]["LocalPlayer"]["PlayerGui"]:FindFirstChild("Main (minimal)") then
	if game["Players"]["LocalPlayer"]["PlayerGui"]["Main (minimal)"]:FindFirstChild("ChooseTeam") then
		repeat
			wait()
			if (game["Players"]["LocalPlayer"]["PlayerGui"]:FindFirstChild("Main (minimal)"))["ChooseTeam"]["Visible"] then
				(((game:GetService("ReplicatedStorage")):WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("SetTeam", "Pirates")
			end
		until game["Players"]["LocalPlayer"]["Team"] ~= nil and game:IsLoaded()
	end
end
L_1_[29] = game:GetService("Players")
L_1_[5] = L_1_[29]["LocalPlayer"]
L_1_[30] = game["PlaceId"]
L_1_[19] = game:GetService("Workspace")
L_1_[40] = L_1_[19]:WaitForChild("Enemies")
L_1_[10] = game:GetService("TeleportService")
L_1_[7] = game:GetService("ReplicatedStorage")
L_1_[24] = (L_1_[5]:WaitForChild("Data")):WaitForChild("Level")
L_1_[17] = (L_1_[5]:WaitForChild("Data")):WaitForChild("Fragments")
L_1_[1] = (L_1_[5]:WaitForChild("Data")):WaitForChild("Beli")
L_1_[48] = require(L_1_[7]["Modules"]["Net"])
L_1_[16] = game:GetService("Lighting")
L_1_[2] = game:service("VirtualInputManager")
L_1_[33] = game:service("VirtualUser")
L_1_[4] = game:GetService("CoreGui")
L_1_[45] = {}
task["spawn"](function()
	if (getgenv())["Configs"] and (getgenv())["Configs"]["FPS Booster"] then
		L_1_[7]["Effect"]:Destroy()
		for L_2_forvar0, L_3_forvar1 in pairs(getconnections(L_1_[5]["PlayerGui"]["Main"]["Settings"]["Buttons"]["FastModeButton"]["Activated"])) do
			local L_4_ = {}
			L_4_[2], L_4_[3] = L_2_forvar0, L_3_forvar1
			L_4_[3]["Function"]()
		end
	end
end)
wait(2)
task["spawn"](function()
	if (getgenv())["Configs"]["FPS Booster"] then
		local L_5_ = {}
		L_5_[3] = L_1_[19]:WaitForChild("Enemies")
		L_5_[2] = (L_1_[19]:WaitForChild("Map")):GetDescendants()
		for L_6_forvar0, L_7_forvar1 in ipairs(L_5_[2]) do
			local L_8_ = {}
			L_8_[2], L_8_[1] = L_6_forvar0, L_7_forvar1
			if L_8_[1]:IsA("BasePart") then
				local L_9_ = {}
				L_9_[2] = false
				for L_10_forvar0 = 1, 5, 1 do
					local L_11_ = {}
					L_11_[3] = L_10_forvar0
					L_11_[1] = L_1_[19]["Map"]["Jungle"]["QuestPlates"]:FindFirstChild("Plate" .. L_11_[3])
					if L_11_[1] and (L_8_[1]["Name"] == "Button" and L_8_[1]:IsDescendantOf(L_11_[1])) then
						L_9_[2] = true
						break
					end
				end
				if L_9_[2] then
					continue
				end
				if L_8_[1]["Name"] == "Door" and L_8_[1]:IsDescendantOf(L_1_[19]["Map"]["Ice"]) then
					continue
				end
				if L_8_[1]:IsDescendantOf(L_1_[19]["Map"]["Jungle"]:FindFirstChild("Final")) then
					continue
				end
				if L_1_[19]["Map"]:FindFirstChild("IceCastle") then
					if L_8_[1]:IsDescendantOf(L_1_[19]["Map"]:FindFirstChild("IceCastle")) then
						continue
					end
				end
				L_9_[1] = true
				for L_12_forvar0, L_13_forvar1 in ipairs(L_5_[3]:GetChildren()) do
					local L_14_ = {}
					L_14_[3], L_14_[1] = L_12_forvar0, L_13_forvar1
					L_14_[2] = L_14_[1]:FindFirstChild("HumanoidRootPart")
					if L_14_[2] and (L_14_[2]["Position"] - L_8_[1]["Position"])["Magnitude"] < 10 then
						L_9_[1] = false
						break
					end
				end
				if L_9_[1] then
					L_8_[1]:Destroy()
				end
			end
		end
		if L_1_[5]["PlayerGui"]:FindFirstChild("Notifications") then
			L_1_[5]["PlayerGui"]["Notifications"]["Enabled"] = false
		end
		shared = shared or {}
		if shared["BC_1"] == nil then
			shared["BC_1"] = true
		end
		if shared["BC_1"] and shared["BC_2"] == nil then
			local L_15_ = {}
			L_15_[6] = workspace
			L_15_[4] = L_1_[16]
			L_15_[3] = L_15_[6]["Terrain"]
			L_15_[2] = L_1_[29]
			L_15_[1] = L_1_[5]["Character"]
			L_15_[3]["WaterWaveSize"] = 0
			L_15_[3]["WaterWaveSpeed"] = 0
			L_15_[3]["WaterReflectance"] = 0
			L_15_[3]["WaterTransparency"] = 0
			L_15_[4]["GlobalShadows"] = false
			L_15_[4]["FogEnd"] = 9000000000
			L_15_[4]["Brightness"] = 0
			if settings and (settings())["Rendering"] then
				(settings())["Rendering"]["QualityLevel"] = "Level01";
				(settings())["Rendering"]["GraphicsMode"] = "NoGraphics"
			end
			for L_16_forvar0, L_17_forvar1 in pairs(L_15_[6]:GetDescendants()) do
				local L_18_ = {}
				L_18_[2], L_18_[3] = L_16_forvar0, L_17_forvar1
				if L_18_[3]:IsA("BasePart") or L_18_[3]:IsA("SpawnLocation") or L_18_[3]:IsA("WedgePart") or L_18_[3]:IsA("Terrain") or L_18_[3]:IsA("MeshPart") then
					L_18_[3]["Material"] = Enum["Material"]["Plastic"]
					L_18_[3]["Reflectance"] = 0
					L_18_[3]["CastShadow"] = false
				elseif L_18_[3]:IsA("Decal") or L_18_[3]:IsA("Texture") then
					L_18_[3]["Texture"] = ""
					L_18_[3]["Transparency"] = 1
				elseif L_18_[3]:IsA("ParticleEmitter") or L_18_[3]:IsA("Trail") then
					L_18_[3]["LightInfluence"] = 0
					L_18_[3]["Texture"] = ""
					L_18_[3]["Lifetime"] = NumberRange["new"](0)
				elseif L_18_[3]:IsA("Explosion") then
					L_18_[3]["BlastPressure"] = 0
					L_18_[3]["BlastRadius"] = 0
				elseif L_18_[3]:IsA("Fire") or L_18_[3]:IsA("SpotLight") or L_18_[3]:IsA("Smoke") or L_18_[3]:IsA("Sparkles") then
					L_18_[3]["Enabled"] = false
				elseif L_18_[3]:IsA("MeshPart") then
					L_18_[3]["Material"] = Enum["Material"]["Plastic"]
					L_18_[3]["Reflectance"] = 0
					L_18_[3]["TextureID"] = ""
					L_18_[3]["CastShadow"] = false
					L_18_[3]["RenderFidelity"] = Enum["RenderFidelity"]["Performance"]
				elseif L_18_[3]:IsA("SpecialMesh") then
					L_18_[3]["TextureId"] = ""
				elseif L_18_[3]:IsA("Shirt") or L_18_[3]:IsA("Pants") or L_18_[3]:IsA("Accessory") then
					L_18_[3]:Destroy()
				end
			end
			for L_19_forvar0, L_20_forvar1 in pairs(L_15_[4]:GetDescendants()) do
				local L_21_ = {}
				L_21_[1], L_21_[2] = L_19_forvar0, L_20_forvar1
				if L_21_[2]:IsA("BlurEffect") or L_21_[2]:IsA("SunRaysEffect") or L_21_[2]:IsA(L_1_[3]({
					"ColorCorrectionEffec",
					"t"
				})) or L_21_[2]:IsA("BloomEffect") or L_21_[2]:IsA("DepthOfFieldEffect") then
					L_21_[2]["Enabled"] = false
				end
			end
			if L_15_[1] then
				for L_22_forvar0, L_23_forvar1 in pairs(L_15_[1]:GetDescendants()) do
					local L_24_ = {}
					L_24_[3], L_24_[2] = L_22_forvar0, L_23_forvar1
					if L_24_[2]:IsA("Shirt") or L_24_[2]:IsA("Pants") or L_24_[2]:IsA("Accessory") then
						L_24_[2]:Destroy()
					end
				end
			end
			if L_1_[30] == 2753915549 or L_1_[30] == 4442272183 or L_1_[30] == 7449423635 then
				local L_25_ = {}
				L_25_[1] = L_1_[7]:FindFirstChild("Effect") and L_1_[7]["Effect"]:FindFirstChild("Container")
				if L_25_[1] then
					local L_26_ = {}
					L_26_[1] = L_25_[1]:FindFirstChild("Shared")
					L_26_[3] = L_25_[1]:FindFirstChild("Misc")
					if L_26_[1] then
						if L_26_[1]:FindFirstChild("AirDash") then
							L_26_[1]["AirDash"]:Destroy()
						end
						if L_26_[1]:FindFirstChild("LightningTP") then
							L_26_[1]["LightningTP"]:Destroy()
						end
					end
					if L_26_[3] then
						if L_26_[3]:FindFirstChild("Damage") then
							L_26_[3]["Damage"]:Destroy()
						end
						if L_26_[3]:FindFirstChild("Confetti") then
							L_26_[3]["Confetti"]:Destroy()
						end
					end
					if L_25_[1]:FindFirstChild("LevelUp") then
						L_25_[1]["LevelUp"]:Destroy()
					end
				end
			end
		end
		shared["BC_2"] = true
	end
end)
L_1_[43] = game:GetService("CoreGui")
L_1_[6] = game:GetService("TweenService")
if L_1_[43]:FindFirstChild("Status_UI") then
	L_1_[43]["Status_UI"]:Destroy()
end
L_1_[11] = Instance["new"]("ScreenGui")
L_1_[11]["Name"] = "Status_UI"
L_1_[11]["ResetOnSpawn"] = false
L_1_[11]["Parent"] = L_1_[43]
L_1_[42] = Instance["new"]("Frame")
L_1_[42]["Size"] = UDim2["new"](0, 420, 0, 70)
L_1_[42]["Position"] = UDim2["new"](.5, 0, .07, 0)
L_1_[42]["AnchorPoint"] = Vector2["new"](.5, 0)
L_1_[42]["BackgroundColor3"] = Color3["fromRGB"](0, 0, 0)
L_1_[42][L_1_[3]({
	"BackgroundTransparen";
	"cy"
})] = .25
L_1_[42]["BorderSizePixel"] = 3
L_1_[42]["BorderColor3"] = Color3["fromRGB"](255, 220, 70)
L_1_[42]["Parent"] = L_1_[11]
L_1_[41] = Instance["new"]("UICorner")
L_1_[41]["CornerRadius"] = UDim["new"](0, 6)
L_1_[41]["Parent"] = L_1_[42]
L_1_[12] = Instance["new"]("UIStroke")
L_1_[12]["Thickness"] = 2
L_1_[12]["Color"] = Color3["fromRGB"](255, 230, 120)
L_1_[12]["ApplyStrokeMode"] = Enum["ApplyStrokeMode"]["Border"]
L_1_[12]["Parent"] = L_1_[42]
L_1_[15] = Instance["new"]("TextLabel")
L_1_[15]["Size"] = UDim2["new"](1, -10, .5, 0)
L_1_[15]["Position"] = UDim2["new"](.5, 0, 0, 5)
L_1_[15]["AnchorPoint"] = Vector2["new"](.5, 0)
L_1_[15][L_1_[3]({
	"BackgroundTransparen",
	"cy"
})] = 1
L_1_[15]["Text"] = "Gravity Hub - Kaitun"
L_1_[15]["TextColor3"] = Color3["fromRGB"](255, 230, 120)
L_1_[15]["TextSize"] = 18
L_1_[15]["Font"] = Enum["Font"]["GothamBold"]
L_1_[15]["TextXAlignment"] = Enum["TextXAlignment"]["Center"]
L_1_[15]["TextYAlignment"] = Enum["TextYAlignment"]["Center"]
L_1_[15]["Parent"] = L_1_[42]
L_1_[26] = Instance["new"]("TextLabel")
L_1_[26]["Size"] = UDim2["new"](1, -10, .5, 0)
L_1_[26]["Position"] = UDim2["new"](.5, 0, .5, 0)
L_1_[26]["AnchorPoint"] = Vector2["new"](.5, 0)
L_1_[26][L_1_[3]({
	"BackgroundTransparen";
	"cy"
})] = 1
L_1_[26]["Text"] = "Status : TBoy Roblox"
L_1_[26]["TextColor3"] = Color3["fromRGB"](255, 230, 120)
L_1_[26]["TextSize"] = 16
L_1_[26]["Font"] = Enum["Font"]["Gotham"]
L_1_[26]["TextXAlignment"] = Enum["TextXAlignment"]["Center"]
L_1_[26]["TextYAlignment"] = Enum["TextYAlignment"]["Center"]
L_1_[26]["Parent"] = L_1_[42]
task["spawn"](function()
	while task["wait"]() do
		local L_27_ = {}
		L_27_[4] = L_1_[6]:Create(L_1_[12], TweenInfo["new"](1.2, Enum["EasingStyle"]["Quad"], Enum["EasingDirection"]["Out"]), {
			["Color"] = Color3["fromRGB"](255, 255, 180)
		})
		L_27_[5] = L_1_[6]:Create(L_1_[12], TweenInfo["new"](1.2, Enum["EasingStyle"]["Quad"], Enum["EasingDirection"]["Out"]), {
			["Color"] = Color3["fromRGB"](255, 200, 60)
		})
		L_27_[2] = L_1_[6]:Create(L_1_[15], TweenInfo["new"](1.2), {
			["TextColor3"] = Color3["fromRGB"](255, 255, 180)
		})
		L_27_[3] = L_1_[6]:Create(L_1_[15], TweenInfo["new"](1.2), {
			["TextColor3"] = Color3["fromRGB"](255, 200, 60)
		})
		L_27_[1] = L_1_[6]:Create(L_1_[26], TweenInfo["new"](1.2), {
			["TextColor3"] = Color3["fromRGB"](255, 255, 180)
		})
		L_27_[7] = L_1_[6]:Create(L_1_[26], TweenInfo["new"](1.2), {
			["TextColor3"] = Color3["fromRGB"](255, 200, 60)
		})
		L_27_[4]:Play()
		L_27_[2]:Play()
		L_27_[1]:Play()
		L_27_[4]["Completed"]:Wait()
		L_27_[5]:Play()
		L_27_[3]:Play()
		L_27_[7]:Play()
		L_27_[5]["Completed"]:Wait()
	end
end)
if L_1_[30] == 2753915549 then
	Old_World = true
elseif L_1_[30] == 4442272183 then
	New_World = true
elseif L_1_[30] == 7449423635 then
	Three_World = true
end
L_1_[22] = (L_1_[5]:WaitForChild("Data")):WaitForChild("Level")
function CheckLevel2()
	local L_28_ = {}
	L_28_[2] = (game:GetService("Players"))["LocalPlayer"]["Data"]["Level"]["Value"]
	if Old_World then
		if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 1 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 9 or SelectMonster == "" then
			Ms = "Bandit"
			NameQuest = "BanditQuest1"
			QuestLv = 1
			NameMon = "Bandit"
			CFrameQ = CFrame["new"](1059.37195, 15.4495068, 1550.4231, .939700544, 0, -0.341998369, 0, 1, 0, .341998369, 0, .939700544)
			CFrameMon = CFrame["new"](1353.44885, 3.40935516, 1376.92029, .776053488, -6.97791975e-08, .630666852, 6.99138596e-08, 1, 2.4612488e-08, -0.630666852, 2.49917598e-08, .776053488)
			Next_Level_X = 10
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 10 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 100 then
			Ms = "Shanda"
			NameQuest = "SkyExp1Quest"
			QuestLv = 2
			NameMon = "Shanda"
			CFrameQ = CFrame["new"](-7859.09814, 5544.19043, -381.476196)
			CFrameMon = CFrame["new"](-7904.57373, 5584.37646, -459.62973)
			Next_Level_X = 75
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 60 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 74 or SelectMonster == "Desert Bandit" then
			Ms = "Desert Bandit"
			NameQuest = "DesertQuest"
			QuestLv = 1
			NameMon = "Desert Bandit"
			CFrameQ = CFrame["new"](894.488647, 5.14000702, 4392.43359, .819155693, 0, -0.573571265, 0, 1, 0, .573571265, 0, .819155693)
			CFrameMon = CFrame["new"](932.788818, 6.8503746, 4488.24609, -0.998625934, 3.08948351e-08, .0524050146, 2.79967303e-08, 1, -5.60361286e-08, -0.0524050146, -5.44919629e-08, -0.998625934)
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 75 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 89 or SelectMonster == "Desert Officer" then
			Ms = "Desert Officer"
			NameQuest = "DesertQuest"
			QuestLv = 2
			NameMon = "Desert Officer"
			CFrameQ = CFrame["new"](894.488647, 5.14000702, 4392.43359, .819155693, 0, -0.573571265, 0, 1, 0, .573571265, 0, .819155693)
			CFrameMon = CFrame["new"](1617.07886, 1.5542295, 4295.54932, -0.997540116, -2.26287735e-08, -0.070099175, -1.69377223e-08, 1, -8.17798806e-08, .070099175, -8.03913949e-08, -0.997540116)
			SelectMonster = "Desert Bandit"
			Next_Level_X = 90
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 90 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 99 or SelectMonster == "Snow Bandit" then
			Ms = "Snow Bandit"
			NameQuest = "SnowQuest"
			QuestLv = 1
			NameMon = "Snow Bandit"
			CFrameQ = CFrame["new"](1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, .939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
			CFrameMon = CFrame["new"](1412.92346, 55.3503647, -1260.62036, -0.246266365, -0.0169920288, -0.969053388, .000432241941, .999844253, -0.0176417865, .969202161, -0.00476344163, -0.246220857)
			if SelectMonster == "Snow Bandit" then
			else
				Next_Level_X = 100
			end
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 110 then
				SelectBoss_P = "Yeti"
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 100 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 119 or SelectMonster == "Snowman" then
			Next_Level_X = 120
			Ms = "Snowman"
			NameQuest = "SnowQuest"
			QuestLv = 2
			NameMon = "Snowman"
			CFrameQ = CFrame["new"](1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, .939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
			CFrameMon = CFrame["new"](1376.86401, 97.2779999, -1396.93115, -0.986755967, 7.71178321e-08, -0.162211925, 7.71531674e-08, 1, 6.08143536e-09, .162211925, -6.51427134e-09, -0.986755967)
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 110 then
				SelectBoss_P = "Yeti"
			end
			SelectMonster = "Snow Bandit"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 120 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 174 or SelectMonster == "Chief Petty Officer" then
			Ms = "Chief Petty Officer"
			NameQuest = "MarineQuest2"
			QuestLv = 1
			NameMon = "Chief Petty Officer"
			CFrameQ = CFrame["new"](-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMon = CFrame["new"](-4882.8623, 22.6520386, 4255.53516, .273695946, -5.40380647e-08, -0.96181643, 4.37720793e-08, 1, -4.37274998e-08, .96181643, -3.01326679e-08, .273695946)
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 130 then
				SelectBoss_P = "Vice Admiral"
			end
			if SelectMonster == "Chief Petty Officer" then
			else
				Next_Level_X = 175
			end
		elseif SelectMonster == "Sky Bandit" then
			Ms = "Sky Bandit"
			NameQuest = "SkyQuest"
			QuestLv = 1
			NameMon = "Sky Bandit"
			CFrameQ = CFrame["new"](-4839.53027, 716.368591, -2619.44165, .866007268, 0, .500031412, 0, 1, 0, -0.500031412, 0, .866007268)
			CFrameMon = CFrame["new"](-4959.51367, 365.39267, -2974.56812, .964867651, 7.74418396e-08, .262737453, -6.95931988e-08, 1, -3.91783708e-08, -0.262737453, 1.95171506e-08, .964867651)
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 175 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 189 or SelectMonster == "Dark Master" then
			Ms = "Dark Master"
			NameQuest = "SkyQuest"
			QuestLv = 2
			NameMon = "Dark Master"
			CFrameQ = CFrame["new"](-4839.53027, 716.368591, -2619.44165, .866007268, 0, .500031412, 0, 1, 0, -0.500031412, 0, .866007268)
			CFrameMon = CFrame["new"](-5079.98096, 376.477356, -2194.17139, .465965867, -3.69776352e-08, .884802461, 3.40249851e-09, 1, 4.00000886e-08, -0.884802461, -1.56281423e-08, .465965867)
			SelectMonster = "Sky Bandit"
			if SelectMonster == "Dark Master" then
			else
				Next_Level_X = 190
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 190 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 209 or SelectMonster == "Prisoner" then
			Ms = "Prisoner"
			QuestLv = 1
			NameQuest = "PrisonerQuest"
			NameMon = "Prisoner"
			CFrameQ = CFrame["new"](5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, .995993316, -2.06384709e-09, -0.0894274712)
			CFrameMon = CFrame["new"](5433.39307, 88.678093, 514.986877, .879988372, 0, -0.474995494, 0, 1, 0, .474995494, 0, .879988372)
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 220 then
				SelectBoss_P = "Warden"
			end
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 232 then
				SelectBoss_P = "Chief Warden"
			end
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 242 then
				SelectBoss_P = "Thunder God"
			end
			if SelectMonster == "Prisoner" then
			else
				Next_Level_X = 210
			end
			Bypass_TP_Dis = true
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 210 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 249 or SelectMonster == "Dangerous Prisoner" then
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 220 then
				SelectBoss_P = "Warden"
			end
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 232 then
				SelectBoss_P = "Chief Warden"
			end
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 242 then
				SelectBoss_P = "Thunder God"
			end
			Ms = "Dangerous Prisoner"
			QuestLv = 2
			NameQuest = "PrisonerQuest"
			NameMon = "Dangerous Prisoner"
			CFrameQ = CFrame["new"](5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, .995993316, -2.06384709e-09, -0.0894274712)
			CFrameMon = CFrame["new"](5433.39307, 88.678093, 514.986877, .879988372, 0, -0.474995494, 0, 1, 0, .474995494, 0, .879988372)
			SelectMonster = "Prisoner"
			Next_Level_X = 250
			Bypass_TP_Dis = true
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 250 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 274 or SelectMonster == "Toga Warrior" then
			Ms = "Toga Warrior"
			NameQuest = "ColosseumQuest"
			QuestLv = 1
			NameMon = "Toga Warrior"
			CFrameQ = CFrame["new"](-1576.11743, 7.38933945, -2983.30762, .576966345, 1.22114863e-09, .816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, .576966345)
			CFrameMon = CFrame["new"](-1779.97583, 44.6077499, -2736.35474, .984437346, 4.10396339e-08, .175734788, -3.62286876e-08, 1, -3.05844168e-08, -0.175734788, 2.3741821e-08, .984437346)
			if SelectMonster == "Toga Warrior" then
			else
				Next_Level_X = 275
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 275 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 299 or SelectMonster == "Gladiator" then
			Ms = "Gladiator"
			NameQuest = "ColosseumQuest"
			QuestLv = 2
			NameMon = "Gladiator"
			CFrameQ = CFrame["new"](-1576.11743, 7.38933945, -2983.30762, .576966345, 1.22114863e-09, .816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, .576966345)
			CFrameMon = CFrame["new"](-1274.75903, 58.1895943, -3188.16309, .464524001, 6.21005611e-08, .885560572, -4.80449414e-09, 1, -6.76054768e-08, -0.885560572, 2.71497012e-08, .464524001)
			SelectMonster = "Toga Warrior"
			Next_Level_X = 300
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 300 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 324 or SelectMonster == "Military Soldier" then
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 350 then
				SelectBoss_P = "Magma Admiral"
			end
			Ms = "Military Soldier"
			NameQuest = "MagmaQuest"
			QuestLv = 1
			NameMon = "Military Soldier"
			CFrameQ = CFrame["new"](-5316.55859, 12.2370615, 8517.2998, .588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, .808542669, 3.60215964e-08, .588437557)
			CFrameMon = CFrame["new"](-5363.01123, 41.5056877, 8548.47266, -0.578253984, -3.29503091e-10, .815856814, 9.11209668e-08, 1, 6.498761e-08, -0.815856814, 1.11920997e-07, -0.578253984)
			if SelectMonster == "Military Soldier" then
			else
				Next_Level_X = 325
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 325 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 374 or SelectMonster == "Military Spy" then
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 350 then
				SelectBoss_P = "Magma Admiral"
			end
			Ms = "Military Spy"
			NameQuest = "MagmaQuest"
			QuestLv = 2
			NameMon = "Military Spy"
			CFrameQ = CFrame["new"](-5316.55859, 12.2370615, 8517.2998, .588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, .808542669, 3.60215964e-08, .588437557)
			CFrameMon = CFrame["new"](-5787.99023, 120.864456, 8762.25293, -0.188358366, -1.84706277e-08, .982100308, -1.23782129e-07, 1, -4.93306951e-09, -0.982100308, -1.22495649e-07, -0.188358366)
			SelectMonster = "Military Soldier"
			Next_Level_X = 375
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 375 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 399 or SelectMonster == "Fishman Warrior" then
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 425 then
				SelectBoss_P = "Fishman Lord"
			end
			Ms = "Fishman Warrior"
			NameQuest = "FishmanQuest"
			QuestLv = 1
			NameMon = "Fishman Warrior"
			CFrameQ = CFrame["new"](61122.5625, 18.4716396, 1568.16504)
			CFrameMon = CFrame["new"](60946.6094, 48.6735229, 1525.91687, -0.0817126185, 8.90751153e-08, .996655822, 2.00889794e-08, 1, -8.77269599e-08, -0.996655822, 1.28533992e-08, -0.0817126185)
			if SelectMonster == "Fishman Warrior" then
			else
				Next_Level_X = 400
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 400 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 449 or SelectMonster == "Fishman Commando" then
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 425 then
				SelectBoss_P = "Fishman Lord"
			end
			Ms = "Fishman Commando"
			NameQuest = "FishmanQuest"
			QuestLv = 2
			NameMon = "Fishman Commando"
			CFrameQ = CFrame["new"](61122.5625, 18.4716396, 1568.16504)
			CFrameMon = CFrame["new"](61902.7383, 18.4828358, 1478.33936, -0.803795099, 0, -0.594906271, 0, 1, 0, .594906271, 0, -0.803795099)
			if SelectMonster == "Fishman Commando" then
			else
				Next_Level_X = 450
			end
			SelectMonster = "Fishman Warrior"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 450 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 474 or SelectMonster == "God's Guard" then
			Ms = "God's Guard"
			NameQuest = "SkyExp1Quest"
			QuestLv = 1
			NameMon = "God's Guards"
			CFrameQ = CFrame["new"](-4721.71436, 845.277161, -1954.20105)
			CFrameMon = CFrame["new"](-4716.95703, 853.089722, -1933.925427)
			if SelectMonster == "God's Guard" then
			else
				Next_Level_X = 475
			end
			SelectMonster = "Fishman Commando"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 475 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 524 or SelectMonster == "Shanda" then
			Ms = "Shanda"
			NameQuest = "SkyExp1Quest"
			QuestLv = 2
			NameMon = "Shandas"
			CFrameQ = CFrame["new"](-7859.09814, 5544.19043, -381.476196)
			CFrameMon = CFrame["new"](-7904.57373, 5584.37646, -459.62973)
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 500 then
				SelectBoss_P = "Wysper"
			end
			if SelectMonster == "Shanda" then
			else
				Next_Level_X = 525
			end
			SelectMonster = "God's Guard"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 525 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 549 or SelectMonster == "Royal Squad" then
			Ms = "Royal Squad"
			NameQuest = "SkyExp2Quest"
			QuestLv = 1
			NameMon = "Royal Squad"
			CFrameQ = CFrame["new"](-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMon = CFrame["new"](-7555.04199, 5606.90479, -1303.24744, -0.896107852, -9.6057462e-10, -0.443836004, -4.24974544e-09, 1, 6.41599973e-09, .443836004, 7.63560326e-09, -0.896107852)
			if SelectMonster == "Royal Squad" then
			else
				Next_Level_X = 550
			end
			SelectMonster = "Shanda"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 550 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 624 or SelectMonster == "Royal Soldier" then
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 575 then
				SelectBoss_P = "Thunder God"
			end
			Ms = "Royal Soldier"
			NameQuest = "SkyExp2Quest"
			QuestLv = 2
			NameMon = "Royal Soldier"
			CFrameQ = CFrame["new"](-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMon = CFrame["new"](-7837.31152, 5649.65186, -1791.08582, -0.716008604, .0104285581, -0.698013008, 5.02521061e-06, .99988848, .0149335321, .69809103, .0106890313, -0.715928733)
			if SelectMonster == "Royal Soldier" then
			else
				Next_Level_X = 625
			end
			SelectMonster = "Royal Squad"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 625 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 649 or SelectMonster == "Galley Pirate" then
			Ms = "Galley Pirate"
			NameQuest = "FountainQuest"
			QuestLv = 1
			NameMon = "Galley Pirate"
			CFrameQ = CFrame["new"](5259.81982, 37.3500175, 4050.0293, .087131381, 0, .996196866, 0, 1, 0, -0.996196866, 0, .087131381)
			CFrameMon = CFrame["new"](5569.80518, 38.5269432, 3849.01196, .896460414, 3.98027495e-08, .443124533, -1.34262139e-08, 1, -6.26611296e-08, -0.443124533, 5.02237434e-08, .896460414)
			if SelectMonster == "Galley Pirate" then
			else
				Next_Level_X = 650
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 650 or SelectMonster == "Galley Captain" then
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 675 then
				SelectBoss_P = "Cyborg"
			end
			Ms = "Galley Captain"
			NameQuest = "FountainQuest"
			QuestLv = 2
			NameMon = "Galley Captain"
			CFrameQ = CFrame["new"](5259.81982, 37.3500175, 4050.0293, .087131381, 0, .996196866, 0, 1, 0, -0.996196866, 0, .087131381)
			CFrameMon = CFrame["new"](5782.90186, 94.5326462, 4716.78174, .361808896, -1.24757526e-06, -0.932252586, 2.16989656e-06, 1, -4.96097414e-07, .932252586, -1.84339774e-06, .361808896)
			SelectMonster = "Galley Pirate"
			Next_Level_X = 9999
		end
	end
	if New_World then
		if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 700 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 724 or SelectMonster == "Raider" then
			Ms = "Raider"
			NameQuest = "Area1Quest"
			QuestLv = 1
			NameMon = "Raider"
			CFrameQ = CFrame["new"](-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, .974368095, 0, -0.22495985)
			CFrameMon = CFrame["new"](-737.026123, 10.1748352, 2392.57959, .272128761, 0, -0.962260842, 0, 1, 0, .962260842, 0, .272128761)
			if SelectMonster == "Raider" then
			else
				Next_Level_X = 725
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 725 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 774 or SelectMonster == "Mercenary" then
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 750 then
				SelectBoss_P = "Diamond"
			end
			Ms = "Mercenary"
			NameQuest = "Area1Quest"
			QuestLv = 2
			NameMon = "Mercenary"
			CFrameQ = CFrame["new"](-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, .974368095, 0, -0.22495985)
			CFrameMon = CFrame["new"](-1022.21271, 72.9855194, 1891.39148, -0.990782857, 0, -0.135460541, 0, 1, 0, .135460541, 0, -0.990782857)
			if SelectMonster == "Mercenary" then
			else
				Next_Level_X = 775
			end
			SelectMonster = "Raider"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 775 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 799 or SelectMonster == "Swan Pirate" then
			Ms = "Swan Pirate"
			NameQuest = "Area2Quest"
			QuestLv = 1
			NameMon = "Swan Pirate"
			CFrameQ = CFrame["new"](638.43811, 71.769989, 918.282898, .139203906, 0, .99026376, 0, 1, 0, -0.99026376, 0, .139203906)
			CFrameMon = CFrame["new"](976.467651, 111.174057, 1229.1084, .00852567982, -4.73897828e-08, -0.999963999, 1.12251888e-08, 1, -4.7295778e-08, .999963999, -1.08215579e-08, .00852567982)
			if SelectMonster == "Swan Pirate" then
			else
				Next_Level_X = 800
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 800 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 874 or SelectMonster == "Factory Staff" then
			Ms = "Factory Staff"
			NameQuest = "Area2Quest"
			QuestLv = 2
			NameMon = "Factory Staff"
			CFrameQ = CFrame["new"](638.43811, 71.769989, 918.282898, .139203906, 0, .99026376, 0, 1, 0, -0.99026376, 0, .139203906)
			CFrameMon = CFrame["new"](336.74585, 73.1620483, -224.129272, .993632793, 3.40154607e-08, .112668738, -3.87658332e-08, 1, 3.99718729e-08, -0.112668738, -4.40850592e-08, .993632793)
			if SelectMonster == "Factory Staff" then
			else
				Next_Level_X = 875
			end
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 850 then
				SelectBoss_P = "Jeremy"
			end
			SelectMonster = "Swan Pirate"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 875 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 899 or SelectMonster == "Marine Lieutenant" then
			Ms = "Marine Lieutenant"
			NameQuest = "MarineQuest3"
			QuestLv = 1
			NameMon = "Marine Lieutenant"
			CFrameQ = CFrame["new"](-2440.79639, 71.7140732, -3216.06812, .866007268, 0, .500031412, 0, 1, 0, -0.500031412, 0, .866007268)
			CFrameMon = CFrame["new"](-2842.69922, 72.9919434, -2901.90479, -0.762281299, 0, -0.64724648, 0, 1.00000012, 0, .64724648, 0, -0.762281299)
			if SelectMonster == "Marine Lieutenant" then
			else
				Next_Level_X = 900
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 900 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 949 or SelectMonster == "Marine Captain" then
			Ms = "Marine Captain"
			NameQuest = "MarineQuest3"
			QuestLv = 2
			NameMon = "Marine Captain"
			CFrameQ = CFrame["new"](-2440.79639, 71.7140732, -3216.06812, .866007268, 0, .500031412, 0, 1, 0, -0.500031412, 0, .866007268)
			CFrameMon = CFrame["new"](-1814.70313, 72.9919434, -3208.86621, -0.900422215, 7.93464423e-08, -0.435017526, 3.68856199e-08, 1, 1.06050372e-07, .435017526, 7.94441988e-08, -0.900422215)
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 925 then
				SelectBoss_P = "Fajita"
			end
			if SelectMonster == "Marine Captain" then
			else
				Next_Level_X = 950
			end
			SelectMonster = "Marine Lieutenant"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 950 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 974 or SelectMonster == "Zombie" then
			Ms = "Zombie"
			NameQuest = "ZombieQuest"
			QuestLv = 1
			NameMon = "Zombie"
			CFrameQ = CFrame["new"](-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, .95628953, 0, -0.29242146)
			CFrameMon = CFrame["new"](-5649.23438, 126.0578, -737.773743, .355238914, -8.10359282e-08, .934775114, 1.65461245e-08, 1, 8.04023372e-08, -0.934775114, -1.3095117e-08, .355238914)
			if SelectMonster == "Zombie" then
			else
				Next_Level_X = 975
			end
			Bypass_TP_Dis = true
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 975 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 999 or SelectMonster == "Vampire" then
			Ms = "Vampire"
			NameQuest = "ZombieQuest"
			QuestLv = 2
			NameMon = "Vampire"
			CFrameQ = CFrame["new"](-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, .95628953, 0, -0.29242146)
			CFrameMon = CFrame["new"](-6030.32031, .4377408, -1313.5564, -0.856965423, 3.9138893e-08, -0.515373945, -1.12178942e-08, 1, 9.45958547e-08, .515373945, 8.68467822e-08, -0.856965423)
			if SelectMonster == "Vampire" then
			else
				Next_Level_X = 1000
			end
			Bypass_TP_Dis = true
			SelectMonster = "Zombie"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 1000 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1049 or SelectMonster == "Snow Trooper" then
			Ms = "Snow Trooper"
			NameQuest = "SnowMountainQuest"
			QuestLv = 1
			NameMon = "Snow Trooper"
			CFrameQ = CFrame["new"](609.858826, 400.119904, -5372.25928, -0.374604106, 0, .92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
			CFrameMon = CFrame["new"](621.003418, 391.361053, -5335.43604, .481644779, 0, .876366913, 0, 1, 0, -0.876366913, 0, .481644779)
			if SelectMonster == "Snow Trooper" then
			else
				Next_Level_X = 1050
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 1050 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1099 or SelectMonster == "Winter Warrior" then
			Ms = "Winter Warrior"
			NameQuest = "SnowMountainQuest"
			QuestLv = 2
			NameMon = "Winter Warrior"
			CFrameQ = CFrame["new"](609.858826, 400.119904, -5372.25928, -0.374604106, 0, .92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
			CFrameMon = CFrame["new"](1295.62683, 429.447784, -5087.04492, -0.698032081, -8.28980049e-08, -0.71606636, -1.98835952e-08, 1, -9.63858184e-08, .71606636, -5.30424877e-08, -0.698032081)
			if SelectMonster == "Winter Warrior" then
			else
				Next_Level_X = 1100
			end
			SelectMonster = "Snow Trooper"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 1100 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1124 or SelectMonster == "Lab Subordinate" then
			Ms = "Lab Subordinate"
			NameQuest = "IceSideQuest"
			QuestLv = 1
			NameMon = "Lab Subordinate"
			CFrameQ = CFrame["new"](-6064.06885, 15.2422857, -4902.97852, .453972578, 0, -0.891015649, 0, 1, 0, .891015649, 0, .453972578)
			CFrameMon = CFrame["new"](-5769.2041, 37.9288292, -4468.38721, -0.569419742, -2.49055017e-08, .822046936, -6.96206541e-08, 1, -1.79282633e-08, -0.822046936, -6.74401548e-08, -0.569419742)
			if SelectMonster == "Lab Subordinate" then
			else
				Next_Level_X = 1125
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 1125 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1174 or SelectMonster == "Horned Warrior" then
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1150 then
				SelectBoss_P = "Smoke Admiral"
			end
			Ms = "Horned Warrior"
			NameQuest = "IceSideQuest"
			QuestLv = 2
			NameMon = "Horned Warrior"
			CFrameQ = CFrame["new"](-6064.06885, 15.2422857, -4902.97852, .453972578, 0, -0.891015649, 0, 1, 0, .891015649, 0, .453972578)
			CFrameMon = CFrame["new"](-6401.27979, 15.9775667, -5948.24316, .388303697, 0, -0.921531856, 0, 1, 0, .921531856, 0, .388303697)
			if SelectMonster == "Horned Warrior" then
			else
				Next_Level_X = 1175
			end
			SelectMonster = "Lab Subordinate"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 1175 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1199 or SelectMonster == "Magma Ninja" then
			Ms = "Magma Ninja"
			NameQuest = "FireSideQuest"
			QuestLv = 1
			NameMon = "Magma Ninja"
			CFrameQ = CFrame["new"](-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, .469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMon = CFrame["new"](-5466.06445, 57.6952019, -5837.42822, -0.988835871, 0, -0.149006829, 0, 1, 0, .149006829, 0, -0.988835871)
			if SelectMonster == "Magma Ninja" then
			else
				Next_Level_X = 1200
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 1200 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1249 or SelectMonster == "Lava Pirate" then
			Ms = "Lava Pirate"
			NameQuest = "FireSideQuest"
			QuestLv = 2
			NameMon = "Lava Pirate"
			CFrameQ = CFrame["new"](-5431.09473, 15.9868021, -5296.53223, .831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, .555080295, 2.68240168e-08, .831796765)
			CFrameMon = CFrame["new"](-5169.71729, 34.1234779, -4669.73633, -0.196780294, 0, .98044765, 0, 1.00000012, 0, -0.98044765, 0, -0.196780294)
			if SelectMonster == "Lava Pirate" then
			else
				Next_Level_X = 1250
			end
			SelectMonster = "Magma Ninja"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 1250 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1274 or SelectMonster == "Ship Deckhand" then
			Ms = "Ship Deckhand"
			NameQuest = "ShipQuest1"
			QuestLv = 1
			NameMon = "Ship Deckhand"
			CFrameQ = CFrame["new"](1037.80127, 125.092171, 32911.6016, -0.244533166, 0, -0.969640911, 0, 1.00000012, 0, .96964103, 0, -0.244533136)
			CFrameMon = CFrame["new"](1163.80872, 138.288452, 33058.4258, -0.998580813, 5.49076979e-08, -0.0532564968, 5.57436763e-08, 1, -1.42118655e-08, .0532564968, -1.71604082e-08, -0.998580813)
			if SelectMonster == "Ship Deckhand" then
			else
				Next_Level_X = 1275
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 1275 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1299 or SelectMonster == "Ship Engineer" then
			Ms = "Ship Engineer"
			NameQuest = "ShipQuest1"
			QuestLv = 2
			NameMon = "Ship Engineer"
			CFrameQ = CFrame["new"](1037.80127, 125.092171, 32911.6016, -0.244533166, 0, -0.969640911, 0, 1.00000012, 0, .96964103, 0, -0.244533136)
			CFrameMon = CFrame["new"](921.30249023438, 125.400390625, 32937.34375)
			if SelectMonster == "Ship Engineer" then
			else
				Next_Level_X = 1300
			end
			SelectMonster = "Ship Deckhand"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 1300 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1324 or SelectMonster == "Ship Steward" then
			Ms = "Ship Steward"
			NameQuest = "ShipQuest2"
			QuestLv = 1
			NameMon = "Ship Steward"
			CFrameQ = CFrame["new"](968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, .493826836, -2.43357912e-09, -0.869560242)
			CFrameMon = CFrame["new"](917.96057128906, 136.89932250977, 33343.4140625)
			if SelectMonster == "Ship Steward" then
			else
				Next_Level_X = 1325
			end
			SelectMonster = "Ship Deckhand"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 1325 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1349 or SelectMonster == "Ship Officer" then
			Ms = "Ship Officer"
			NameQuest = "ShipQuest2"
			QuestLv = 2
			NameMon = "Ship Officer"
			CFrameQ = CFrame["new"](968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, .493826836, -2.43357912e-09, -0.869560242)
			CFrameMon = CFrame["new"](944.44964599609, 181.40081787109, 33278.9453125)
			if SelectMonster == "Ship Officer" then
			else
				Next_Level_X = 1350
			end
			SelectMonster = "Ship Steward"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 1350 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1374 or SelectMonster == "Arctic Warrior" then
			Ms = "Arctic Warrior"
			NameQuest = "FrostQuest"
			QuestLv = 1
			NameMon = "Arctic Warrior"
			CFrameQ = CFrame["new"](5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, .358349502, 0, -0.933587909)
			CFrameMon = CFrame["new"](5878.23486, 81.3886948, -6136.35596, -0.451037169, 2.3908234e-07, .892505825, -1.08168464e-07, 1, -3.22542007e-07, -0.892505825, -2.4201924e-07, -0.451037169)
			if SelectMonster == "Arctic Warrior" then
			else
				Next_Level_X = 1375
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 1375 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1424 or SelectMonster == "Snow Lurker" then
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1400 then
				SelectBoss_P = "Awakened Ice Admiral"
			end
			Ms = "Snow Lurker"
			NameQuest = "FrostQuest"
			QuestLv = 2
			NameMon = "Snow Lurker"
			CFrameQ = CFrame["new"](5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, .358349502, 0, -0.933587909)
			CFrameMon = CFrame["new"](5513.36865, 60.546711, -6809.94971, -0.958693981, -1.65617333e-08, .284439981, -4.07668654e-09, 1, 4.44854642e-08, -0.284439981, 4.14883701e-08, -0.958693981)
			if SelectMonster == "Snow Lurker" then
			else
				Next_Level_X = 1450
			end
			SelectMonster = "Arctic Warrior"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] == 1425 or game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1449 or SelectMonster == "Sea Soldier" then
			Ms = "Sea Soldier"
			NameQuest = "ForgottenQuest"
			QuestLv = 1
			NameMon = "Sea Soldier"
			CFrameQ = CFrame["new"](-3054.44458, 235.544281, -10142.8193, .990270376, 0, -0.13915664, 0, 1, 0, .13915664, 0, .990270376)
			CFrameMon = CFrame["new"](-3115.78223, 63.8785706, -9808.38574, -0.913427353, 3.11199457e-08, .407000452, 7.79564235e-09, 1, -5.89660658e-08, -0.407000452, -5.06883708e-08, -0.913427353)
			if SelectMonster == "Sea Soldier" then
			else
				Next_Level_X = 1450
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1450 or SelectMonster == "Water Fighter" then
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1475 then
				SelectBoss_P = "Tide Keeper"
			end
			Ms = "Water Fighter"
			NameQuest = "ForgottenQuest"
			QuestLv = 2
			NameMon = "Water Fighter"
			CFrameQ = CFrame["new"](-3054.44458, 235.544281, -10142.8193, .990270376, 0, -0.13915664, 0, 1, 0, .13915664, 0, .990270376)
			CFrameMon = CFrame["new"](-3212.99683, 263.809296, -10551.8799, .742111444, -5.59139615e-08, -0.670276582, 1.69155214e-08, 1, -6.46908234e-08, .670276582, 3.66697037e-08, .742111444)
			if SelectMonster == "Water Fighter" then
			else
				Next_Level_X = 9999
			end
			SelectMonster = "Sea Soldier"
		end
	end
	if Three_World then
		if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1500 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1524 or SelectMonster == "Pirate Millionaire" then
			Ms = "Pirate Millionaire"
			NameQuest = "PiratePortQuest"
			QuestLv = 1
			NameMon = "Pirate Millionaire"
			CFrameQ = CFrame["new"](-290.074677, 42.9034653, 5581.58984, .965929627, 0, -0.258804798, 0, 1, 0, .258804798, 0, .965929627)
			CFrameMon = CFrame["new"](81.164993286133, 43.755737304688, 5724.7021484375)
			if SelectMonster == "Pirate Millionaire" then
			else
				Next_Level_X = 1525
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1525 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1574 or SelectMonster == "Pistol Billionaire" then
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1550 then
				SelectBoss_P = "Stone"
			end
			Ms = "Pistol Billionaire"
			NameQuest = "PiratePortQuest"
			QuestLv = 2
			NameMon = "Pistol Billionaire"
			CFrameQ = CFrame["new"](-290.074677, 42.9034653, 5581.58984, .965929627, 0, -0.258804798, 0, 1, 0, .258804798, 0, .965929627)
			CFrameMon = CFrame["new"](81.164993286133, 43.755737304688, 5724.7021484375)
			if SelectMonster == "Pistol Billionaire" then
			else
				Next_Level_X = 1575
			end
			SelectMonster = "Pirate Millionaire"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1575 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1599 or SelectMonster == "Dragon Crew Warrior" then
			Ms = "Dragon Crew Warrior"
			NameQuest = "AmazonQuest"
			QuestLv = 1
			NameMon = "Dragon Crew Warrior"
			CFrameQ = CFrame["new"](5832.83594, 51.6806107, -1101.51563, .898790359, 0, -0.438378751, 0, 1, 0, .438378751, 0, .898790359)
			CFrameMon = CFrame["new"](6241.9951171875, 51.522083282471, -1243.9771728516)
			if SelectMonster == "Dragon Crew Warrior" then
			else
				Next_Level_X = 1600
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1600 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1624 or SelectMonster == "Dragon Crew Archer" then
			Ms = "Dragon Crew Archer"
			NameQuest = "AmazonQuest"
			QuestLv = 2
			NameMon = "Dragon Crew Archer"
			CFrameQ = CFrame["new"](5832.83594, 51.6806107, -1101.51563, .898790359, 0, -0.438378751, 0, 1, 0, .438378751, 0, .898790359)
			CFrameMon = CFrame["new"](6488.9155273438, 383.38375854492, -110.66246032715)
			if SelectMonster == "Dragon Crew Archer" then
			else
				Next_Level_X = 1625
			end
			SelectMonster = "Dragon Crew Warrior"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1625 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1649 or SelectMonster == "Female Islander" then
			Ms = "Female Islander"
			NameQuest = "AmazonQuest2"
			QuestLv = 1
			NameMon = "Female Islander"
			CFrameQ = CFrame["new"](5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, 0, -1, 0, 0)
			CFrameMon = CFrame["new"](4770.4990234375, 758.95520019531, 1069.8680419922)
			if SelectMonster == "Female Islander" then
			else
				Next_Level_X = 1650
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1650 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1699 or SelectMonster == "Giant Islander" then
			Ms = "Giant Islander"
			NameQuest = "AmazonQuest2"
			QuestLv = 2
			NameMon = "Giant Islander"
			CFrameQ = CFrame["new"](5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, 0, -1, 0, 0)
			CFrameMon = CFrame["new"](4530.3540039063, 656.75695800781, -131.60952758789)
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1675 then
				SelectBoss_P = "Island Empress"
			end
			if SelectMonster == "Giant Islander" then
			else
				Next_Level_X = 1700
			end
			SelectMonster = "Female Islander"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1700 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1774 or SelectMonster == "Marine Commodore" then
			Ms = "Marine Commodore"
			NameQuest = "MarineTreeIsland"
			QuestLv = 1
			NameMon = "Marine Commodore"
			CFrameQ = CFrame["new"](2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, .258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
			CFrameMon = CFrame["new"](2490.0844726563, 190.4232635498, -7160.0502929688)
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1750 then
				SelectBoss_P = "Kilo Admiral"
			end
			if SelectMonster == "Marine Commodore" then
			else
				Next_Level_X = 1775
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1775 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1799 or SelectMonster == "Fishman Raider" then
			Ms = "Fishman Raider"
			NameQuest = "DeepForestIsland3"
			QuestLv = 1
			NameMon = "Fishman Raider"
			CFrameQ = CFrame["new"](-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, .469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMon = CFrame["new"](-10322.400390625, 390.94473266602, -8580.0908203125)
			if SelectMonster == "Fishman Raider" then
			else
				Next_Level_X = 1800
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1800 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1824 or SelectMonster == "Fishman Captain" then
			Ms = "Fishman Captain"
			NameQuest = "DeepForestIsland3"
			QuestLv = 2
			NameMon = "Fishman Captain"
			CFrameQ = CFrame["new"](-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, .469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMon = CFrame["new"](-11194.541992188, 442.02795410156, -8608.806640625)
			if SelectMonster == "Fishman Captain" then
			else
				Next_Level_X = 1825
			end
			SelectMonster = "Fishman Raider"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1825 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1849 or SelectMonster == "Forest Pirate" then
			Ms = "Forest Pirate"
			NameQuest = "DeepForestIsland"
			QuestLv = 1
			NameMon = "Forest Pirate"
			CFrameQ = CFrame["new"](-13234.04, 331.488495, -7625.40137, .707134247, 0, -0.707079291, 0, 1, 0, .707079291, 0, .707134247)
			CFrameMon = CFrame["new"](-13225.809570313, 428.19387817383, -7753.1245117188)
			if SelectMonster == "Forest Pirate" then
			else
				Next_Level_X = 1850
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1850 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1899 or SelectMonster == "Mythological Pirate" then
			Ms = "Mythological Pirate"
			NameQuest = "DeepForestIsland"
			QuestLv = 2
			NameMon = "Mythological Pirate"
			CFrameQ = CFrame["new"](-13234.04, 331.488495, -7625.40137, .707134247, 0, -0.707079291, 0, 1, 0, .707079291, 0, .707134247)
			CFrameMon = CFrame["new"](-13869.172851563, 564.95251464844, -7084.4135742188)
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1875 then
				SelectBoss_P = "Captain Elephant"
			end
			if SelectMonster == "Mythological Pirate" then
			else
				Next_Level_X = 1900
			end
			SelectMonster = "Forest Pirate"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1900 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1924 or SelectMonster == "Jungle Pirate" then
			Ms = "Jungle Pirate"
			NameQuest = "DeepForestIsland2"
			QuestLv = 1
			NameMon = "Jungle Pirate"
			CFrameQ = CFrame["new"](-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, .996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
			CFrameMon = CFrame["new"](-11982.221679688, 376.32522583008, -10451.415039063)
			if SelectMonster == "Jungle Pirate" then
			else
				Next_Level_X = 1925
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1925 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1974 or SelectMonster == "Musketeer Pirate" then
			Ms = "Musketeer Pirate"
			NameQuest = "DeepForestIsland2"
			QuestLv = 2
			NameMon = "Musketeer Pirate"
			CFrameQ = CFrame["new"](-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, .996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
			CFrameMon = CFrame["new"](-13282.3046875, 496.23684692383, -9565.150390625)
			if SelectMonster == "Musketeer Pirate" then
			else
				Next_Level_X = 1975
			end
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1950 then
				SelectBoss_P = "Beautiful Pirate"
			end
			SelectMonster = "Jungle Pirate"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 1975 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 1999 or SelectMonster == "Reborn Skeleton" then
			Ms = "Reborn Skeleton"
			NameQuest = "HauntedQuest1"
			QuestLv = 1
			NameMon = "Reborn Skeleton"
			CFrameQ = CFrame["new"](-9480.8271484375, 142.13066101074, 5566.0712890625)
			CFrameMon = CFrame["new"](-8817.880859375, 191.16761779785, 6298.6557617188)
			if SelectMonster == "Reborn Skeleton" then
			elseif not LevelMax then
				Next_Level_X = 2000
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2000 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 2024 or SelectMonster == "Living Zombie" then
			Ms = "Living Zombie"
			NameQuest = "HauntedQuest1"
			QuestLv = 2
			NameMon = "Living Zombie"
			CFrameQ = CFrame["new"](-9480.8271484375, 142.13066101074, 5566.0712890625)
			CFrameMon = CFrame["new"](-10125.234375, 183.94705200195, 6242.013671875)
			if SelectMonster == "Living Zombie" then
			elseif not LevelMax then
				Next_Level_X = 2025
			end
			SelectMonster = "Reborn Skeleton"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2025 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 2049 or SelectMonster == "Demonic Soul" then
			Ms = "Demonic Soul"
			NameQuest = "HauntedQuest2"
			QuestLv = 1
			NameMon = "Demonic"
			CFrameQ = CFrame["new"](-9516.9931640625, 178.00651550293, 6078.4653320313)
			CFrameMon = CFrame["new"](-9712.03125, 204.69589233398, 6193.322265625)
			if SelectMonster == "Demonic Soul" then
			else
				Next_Level_X = 2050
			end
			SelectMonster = "Living Zombie"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2050 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 2074 or SelectMonster == "Posessed Mummy" then
			Ms = "Posessed Mummy"
			NameQuest = "HauntedQuest2"
			QuestLv = 2
			NameMon = "Posessed Mummy"
			CFrameQ = CFrame["new"](-9516.9931640625, 178.00651550293, 6078.4653320313)
			CFrameMon = CFrame["new"](-9545.7763671875, 69.619895935059, 6339.5615234375)
			if SelectMonster == "Posessed Mummy" then
			else
				Next_Level_X = 2075
			end
			SelectMonster = "Demonic Soul"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2075 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 2099 or SelectMonster == "Peanut Scout" then
			Ms = "Peanut Scout"
			NameQuest = "NutsIslandQuest"
			QuestLv = 1
			NameMon = "Peanut Scout"
			CFrameQ = CFrame["new"](-2104.17163, 38.1299706, -10194.418, .758814394, -1.38604395e-09, .651306927, 2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, .758814394)
			CFrameMon = CFrame["new"](-2098.07544, 192.611862, -10248.8867, .983392298, -9.57031787e-08, .181492642, 8.7276355e-08, 1, 5.44169616e-08, -0.181492642, -3.76732068e-08, .983392298)
			if SelectMonster == "Peanut Scout" then
			else
				Next_Level_X = 2100
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2100 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 2124 or SelectMonster == "Peanut President" then
			Ms = "Peanut President"
			NameQuest = "NutsIslandQuest"
			QuestLv = 2
			NameMon = "Peanut President"
			CFrameQ = CFrame["new"](-2104.17163, 38.1299706, -10194.418, .758814394, -1.38604395e-09, .651306927, 2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, .758814394)
			CFrameMon = CFrame["new"](-1876.95959, 192.610947, -10542.2939, .0553516336, -2.83836812e-08, .998466909, -6.89634405e-10, 1, 2.84654931e-08, -0.998466909, -2.26418861e-09, .0553516336)
			SelectMonster = "Peanut Scout"
			if SelectMonster == "Peanut President" then
			else
				Next_Level_X = 2125
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2125 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 2149 or SelectMonster == "Ice Cream Chef" then
			Ms = "Ice Cream Chef"
			NameQuest = "IceCreamIslandQuest"
			QuestLv = 1
			NameMon = "Ice Cream Chef"
			CFrameQ = CFrame["new"](-820.404358, 65.8453293, -10965.5654, .822534859, 5.24448502e-08, -0.568714678, -2.08336317e-08, 1, 6.20846663e-08, .568714678, -3.92184099e-08, .822534859)
			CFrameMon = CFrame["new"](-821.614075, 208.39537, -10990.7617, -0.870096624, 3.18909272e-08, .492881238, -1.8357893e-08, 1, -9.71107568e-08, -0.492881238, -9.35439957e-08, -0.870096624)
			if SelectMonster == "Ice Cream Chef" then
			else
				Next_Level_X = 2150
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2150 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 2199 or SelectMonster == "Ice Cream Commander" then
			Ms = "Ice Cream Commander"
			NameQuest = "IceCreamIslandQuest"
			QuestLv = 2
			NameMon = "Ice Cream Commander"
			CFrameQ = CFrame["new"](-819.376526, 67.4634171, -10967.2832)
			CFrameMon = CFrame["new"](-610.11669921875, 208.26904296875, -11253.686523438)
			if SelectMonster == "Ice Cream Commander" then
			else
				Next_Level_X = 2200
			end
			if game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2175 then
				SelectBoss_P = "Cake Queen"
			end
			SelectMonster = "Ice Cream Chef"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2200 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 2224 or SelectMonster == "Cookie Crafter" then
			Ms = "Cookie Crafter"
			NameQuest = "CakeQuest1"
			QuestLv = 1
			NameMon = "Cookie Crafter"
			CFrameQ = CFrame["new"](-2020.6068115234, 37.82400894165, -12027.80859375)
			CFrameMon = CFrame["new"](-2286.6843261719, 146.56562805176, -12226.881835938)
			if SelectMonster == "Cookie Crafter" then
			elseif not LevelMax then
				Next_Level_X = 2225
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2225 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] <= 2249 or SelectMonster == "Cake Guard" then
			Ms = "Cake Guard"
			NameQuest = "CakeQuest1"
			QuestLv = 2
			NameMon = "Cake Guard"
			CFrameQ = CFrame["new"](-2020.6068115234, 37.82400894165, -12027.80859375)
			CFrameMon = CFrame["new"](-1817.9747314453, 209.56327819824, -12288.922851562)
			SelectMonster = "Cookie Crafter"
			if SelectMonster == "Cake Guard" then
			elseif not LevelMax then
				Next_Level_X = 2250
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2250 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] < 2300 or SelectMonster == "Baking Staff" then
			Ms = "Baking Staff"
			NameQuest = "CakeQuest2"
			QuestLv = 1
			NameMon = "Baking Staff"
			CFrameQ = CFrame["new"](-1928.31763, 37.7296638, -12840.626)
			CFrameMon = CFrame["new"](-1818.3479003906, 93.412757873535, -12887.66015625)
			if SelectMonster == "Baking Staff" then
			elseif not LevelMax then
				Next_Level_X = 2300
			end
			SelectMonster = "Cookie Crafter"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2300 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] < 2325 or SelectMonster == "Cocoa Warrior" then
			Ms = "Cocoa Warrior"
			NameQuest = "ChocQuest1"
			QuestLv = 1
			NameMon = "Cocoa Warrior"
			CFrameQ = CFrame["new"](230.19186401367, 24.734258651733, -12202.657226562)
			CFrameMon = CFrame["new"](24.617475509644, 24.734342575073, -12227.267578125)
			if SelectMonster == "Cocoa Warrior" then
			else
				Next_Level_X = 2325
			end
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2325 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] < 2350 or SelectMonster == L_1_[3]({
			"Chocolate Bar Battle",
			"r"
		}) then
			Ms = L_1_[3]({
				"Chocolate Bar Battle",
				"r"
			})
			NameQuest = "ChocQuest1"
			QuestLv = 2
			NameMon = L_1_[3]({
				"Chocolate Bar Battle";
				"r"
			})
			CFrameQ = CFrame["new"](230.19186401367, 24.734258651733, -12202.657226562)
			CFrameMon = CFrame["new"](658.22302246094, 24.734258651733, -12541.991210938)
			if SelectMonster == L_1_[3]({
				"Chocolate Bar Battle";
				"r"
			}) then
			else
				Next_Level_X = 2350
			end
			SelectMonster = "Cocoa Warrior"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2350 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] < 2375 or SelectMonster == "Sweet Thief" then
			Ms = "Sweet Thief"
			NameQuest = "ChocQuest2"
			QuestLv = 1
			NameMon = "Sweet Thief"
			CFrameQ = CFrame["new"](149.14392089844, 24.793828964233, -12775.41015625)
			CFrameMon = CFrame["new"](51.611843109131, 24.793809890747, -12574.873046875)
			if SelectMonster == "Sweet Thief" then
			else
				Next_Level_X = 2375
			end
			SelectMonster = L_1_[3]({
				"Chocolate Bar Battle",
				"r"
			})
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2375 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] < 2400 or SelectMonster == "Candy Rebel" then
			Ms = "Candy Rebel"
			NameQuest = "ChocQuest2"
			QuestLv = 2
			NameMon = "Candy Rebel"
			CFrameQ = CFrame["new"](149.14392089844, 24.793828964233, -12775.41015625)
			CFrameMon = CFrame["new"](28.34560585022, 24.793802261353, -12949.502929688)
			if SelectMonster == "Candy Rebel" then
			else
				Next_Level_X = 2400
			end
			SelectMonster = "Sweet Thief"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2400 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] < 2425 or SelectMonster == "Candy Pirate" then
			Ms = "Candy Pirate"
			NameQuest = "CandyQuest1"
			QuestLv = 1
			NameMon = "Candy Pirate"
			CFrameQ = CFrame["new"](-1146.8081054688, 16.10725402832, -14444.353515625)
			CFrameMon = CFrame["new"](-1333.9425048828, 16.907636642456, -14424.844726562)
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2425 and game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] < 2550 or SelectMonster == "Snow Demon" then
			Ms = "Snow Demon"
			NameQuest = "CandyQuest1"
			QuestLv = 2
			NameMon = "Snow Demon"
			CFrameQ = CFrame["new"](-1146.8081054688, 16.10725402832, -14444.353515625)
			CFrameMon = CFrame["new"](-963.02130126953, 16.107183456421, -14289.576171875)
			if SelectMonster == "Candy Pirate" then
			else
				Next_Level_X = 2551
			end
			SelectMonster = "Candy Pirate"
		elseif game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 2550 then
			local L_29_ = {}
			Ms = "Baking Staff"
			NameQuest = "CakeQuest2"
			QuestLv = 1
			NameMon = "Baking Staff"
			CFrameQ = CFrame["new"](-1928.31763, 37.7296638, -12840.626)
			CFrameMon = CFrame["new"](-1818.3479003906, 93.412757873535, -12887.66015625)
			SelectMonster = "Cookie Crafter"
			L_29_[1] = tostring(string["match"](tostring(game["ReplicatedStorage"]["Remotes"]["CommF_"]:InvokeServer("CakePrinceSpawner")), "%d+"))
			if L_29_[1] == "nil" or L_29_[1] == nil then
				(game:GetService("ReplicatedStorage"))["Remotes"]["CommF_"]:InvokeServer("CakePrinceSpawner", true)
				Cake_Prince_S:Set(L_1_[3]({
					" Cake Prince : Boss ",
					"Spawn"
				}))
			else
				Cake_Prince_S:Set(" Cake Prince : " .. L_29_[1])
			end
		end
	end
end
L_1_[8] = function()
	if Old_World and (L_1_[22]["Value"] >= 1 and L_1_[22]["Value"] <= 9) then
		Enemy = "Bandit"
		NameEnemy = "Bandit"
		QuestName = "BanditQuest1"
		QuestNumber = 1
		QuestPos = CFrame["new"](1059.58728, 16.412075, 1549.54443, -0.963007867, 4.12775627e-08, .269473195, 2.39519959e-08, 1, -6.75822349e-08, -0.269473195, -5.86278048e-08, -0.963007867)
		EnemyPos = CFrame["new"](1175.00793, 43.7162018, 1680.39185, .940636754, 1.67726082e-08, .339414984, -3.54472718e-08, 1, 4.88204712e-08, -0.339414984, -5.79536632e-08, .940636754)
	elseif Old_World and (L_1_[22]["Value"] >= 10 and L_1_[22]["Value"] <= 14) then
		Enemy = "Monkey"
		NameEnemy = "Monkey"
		QuestName = "JungleQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](-1598.92285, 36.9012909, 148.748718, -0.969585121, -1.11576668e-07, -0.244754329, -1.2733129e-07, 1, 4.8546088e-08, .244754329, 7.823445e-08, -0.969585121)
		EnemyPos = CFrame["new"](-1660.75586, 40.1013031, 320.152313, .82476908, -4.88485696e-08, -0.565469682, 5.81200084e-08, 1, -1.61455704e-09, .565469682, -3.15334674e-08, .82476908)
	elseif Old_World and (L_1_[22]["Value"] >= 15 and L_1_[22]["Value"] <= 29) then
		Enemy = "Gorilla"
		NameEnemy = "Gorilla"
		QuestName = "JungleQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](-1598.92285, 36.9012909, 148.748718, -0.969585121, -1.11576668e-07, -0.244754329, -1.2733129e-07, 1, 4.8546088e-08, .244754329, 7.823445e-08, -0.969585121)
		EnemyPos = CFrame["new"](-1196.64343, 7.74201918, -445.539734, -0.919930279, -4.16423696e-08, .392081946, -1.71233108e-08, 1, 6.60324133e-08, -0.392081946, 5.40314744e-08, -0.919930279)
		if Old_World and (L_1_[22]["Value"] >= 20 and L_1_[22]["Value"] <= 29) then
			Name_Boss = "The Gorilla King"
			QuestName_Boss = "JungleQuest"
			QuestNumber_Boss = 3
		end
	elseif Old_World and (L_1_[22]["Value"] >= 30 and L_1_[22]["Value"] <= 39) then
		Enemy = "Pirate"
		NameEnemy = "Pirate"
		QuestName = "BuggyQuest1"
		QuestNumber = 1
		QuestPos = CFrame["new"](-1139.5631103516, 4.7520513534546, 3830.38671875)
		EnemyPos = CFrame["new"](-1045.9431152344, 64.419502258301, 3930.3020019531)
	elseif Old_World and (L_1_[22]["Value"] >= 40 and L_1_[22]["Value"] <= 59) then
		Enemy = "Brute"
		NameEnemy = "Brute"
		QuestName = "BuggyQuest1"
		QuestNumber = 2
		QuestPos = CFrame["new"](-1139.5631103516, 4.7520513534546, 3830.38671875)
		EnemyPos = CFrame["new"](-1150.2763671875, 130.60118103027, 4164.9345703125)
		if Old_World and (L_1_[22]["Value"] >= 55 and L_1_[22]["Value"] <= 59) then
			Name_Boss = "Bobby"
			QuestName_Boss = "BuggyQuest1"
			QuestNumber_Boss = 3
		end
	elseif Old_World and (L_1_[22]["Value"] >= 60 and L_1_[22]["Value"] <= 74) then
		Enemy = "Desert Bandit"
		NameEnemy = "Desert Bandit"
		QuestName = "DesertQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](894.488647, 5.14000702, 4392.43359, .819155693, 0, -0.573571265, 0, 1, 0, .573571265, 0, .819155693)
		EnemyPos = CFrame["new"](935.8798046975, 6.4486746788025, 4481.5859375)
	elseif Old_World and (L_1_[22]["Value"] >= 75 and L_1_[22]["Value"] <= 89) then
		Enemy = "Desert Officer"
		NameEnemy = "Desert Officer"
		QuestName = "DesertQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](894.488647, 5.14000702, 4392.43359, .819155693, 0, -0.573571265, 0, 1, 0, .573571265, 0, .819155693)
		EnemyPos = CFrame["new"](1608.2822265625, 8.6142244338989, 4371.0073242188)
	elseif Old_World and (L_1_[22]["Value"] >= 90 and L_1_[22]["Value"] <= 99) then
		Enemy = "Snow Bandit"
		NameEnemy = "Snow Bandit"
		QuestName = "SnowQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, .939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
		EnemyPos = CFrame["new"](1354.3479003906, 87.272773742676, -1393.9465332031)
	elseif Old_World and (L_1_[22]["Value"] >= 100 and L_1_[22]["Value"] <= 119) then
		Enemy = "Snowman"
		NameEnemy = "Snowman"
		QuestName = "SnowQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, .939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
		EnemyPos = CFrame["new"](1201.6412353516, 144.57958984375, -1550.0670166016)
		if Old_World and (L_1_[22]["Value"] >= 110 and L_1_[22]["Value"] <= 119) then
			Name_Boss = "Yeti"
			QuestName_Boss = "SnowQuest"
			QuestNumber_Boss = 3
		end
	elseif Old_World and (L_1_[22]["Value"] >= 120 and L_1_[22]["Value"] <= 149) then
		Enemy = "Chief Petty Officer"
		NameEnemy = "Chief Petty Officer"
		QuestName = "MarineQuest2"
		QuestNumber = 1
		QuestPos = CFrame["new"](-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		EnemyPos = CFrame["new"](-4710.3598632812, 112.02615356445, 4584.92578125)
		if Old_World and (L_1_[22]["Value"] >= 130 and L_1_[22]["Value"] <= 149) then
			Name_Boss = "Vice Admiral"
			QuestName_Boss = "MarineQuest2"
			QuestNumber_Boss = 2
		end
	elseif Old_World and (L_1_[22]["Value"] >= 150 and L_1_[22]["Value"] <= 174) then
		Enemy = "Sky Bandit"
		NameEnemy = "Sky Bandit"
		QuestName = "SkyQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](-4838.701171875, 717.66931152344, -2617.8647460938)
		EnemyPos = CFrame["new"](-4965.37890625, 357.37414550781, -2848.7023925781)
	elseif Old_World and (L_1_[22]["Value"] >= 175 and L_1_[22]["Value"] <= 189) then
		Enemy = "Dark Master"
		NameEnemy = "Dark Master"
		QuestName = "SkyQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](-4838.701171875, 717.66931152344, -2617.8647460938)
		EnemyPos = CFrame["new"](-5224.05859375, 484.44784545898, -2275.9985351562)
	elseif Old_World and (L_1_[22]["Value"] >= 190 and L_1_[22]["Value"] <= 209) then
		Enemy = "Prisoner"
		NameEnemy = "Prisoner"
		QuestName = "PrisonerQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](5309.6474609375, 1.6542626619339, 477.8815612793)
		EnemyPos = CFrame["new"](5276.5576171875, 87.836639404297, 561.01007080078)
	elseif Old_World and (L_1_[22]["Value"] >= 210 and L_1_[22]["Value"] <= 249) then
		Enemy = "Dangerous Prisoner"
		NameEnemy = "Dangerous Prisoner"
		QuestName = "PrisonerQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](5309.6474609375, 1.6542626619339, 477.8815612793)
		EnemyPos = CFrame["new"](5276.5576171875, 87.836639404297, 561.01007080078)
		if Old_World and (L_1_[22]["Value"] >= 240 and L_1_[22]["Value"] <= 249) then
			Name_Boss = "Swan"
			QuestName_Boss = "ImpelQuest"
			QuestNumber_Boss = 3
		end
	elseif Old_World and (L_1_[22]["Value"] >= 250 and L_1_[22]["Value"] <= 299) then
		Enemy = "Toga Warrior"
		NameEnemy = "Toga Warrior"
		QuestName = "ColosseumQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, .857167721, 0, -0.515037298)
		EnemyPos = CFrame["new"](-1820.21484375, 51.683856964111, -2740.6650390625)
	elseif Old_World and (L_1_[22]["Value"] >= 300 and L_1_[22]["Value"] <= 324) then
		Enemy = "Military Soldier"
		NameEnemy = "Military Soldier"
		QuestName = "MagmaQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, .866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
		EnemyPos = CFrame["new"](-5411.1645507812, 11.081554412842, 8454.29296875)
	elseif Old_World and (L_1_[22]["Value"] >= 325 and L_1_[22]["Value"] <= 374) then
		Enemy = "Military Spy"
		NameEnemy = "Military Spy"
		QuestName = "MagmaQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, .866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
		EnemyPos = CFrame["new"](-5802.8681640625, 86.262413024902, 8828.859375)
		if Old_World and (L_1_[22]["Value"] >= 350 and L_1_[22]["Value"] <= 374) then
			Name_Boss = "Magma Admiral"
			QuestName_Boss = "MagmaQuest"
			QuestNumber_Boss = 3
		end
	elseif Old_World and (L_1_[22]["Value"] >= 375 and L_1_[22]["Value"] <= 399) then
		Enemy = "Fishman Warrior"
		NameEnemy = "Fishman Warrior"
		QuestName = "FishmanQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](61122.65234375, 18.497442245483, 1569.3997802734)
		EnemyPos = CFrame["new"](60878.30078125, 18.482830047607, 1543.7574462891)
		if ((CFrame["new"](61164, 12, 1820))["Position"] - L_1_[5]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 2000 then
			L_1_[5]["Character"]["HumanoidRootPart"]["CFrame"] = CFrame["new"](61164, 12, 1820)
		end
	elseif Old_World and (L_1_[22]["Value"] >= 400 and L_1_[22]["Value"] <= 449) then
		Enemy = "Fishman Commando"
		NameEnemy = "Fishman Commando"
		QuestName = "FishmanQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](61122.65234375, 18.497442245483, 1569.3997802734)
		EnemyPos = CFrame["new"](61922.6328125, 18.482830047607, 1493.9343261719)
		if Old_World and (L_1_[22]["Value"] >= 425 and L_1_[22]["Value"] <= 449) then
			Name_Boss = "Fishman Lord"
			QuestName_Boss = "FishmanQuest"
			QuestNumber_Boss = 3
		end
		if ((CFrame["new"](61164, 12, 1820))["Position"] - L_1_[5]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 2000 then
			L_1_[5]["Character"]["HumanoidRootPart"]["CFrame"] = CFrame["new"](61164, 12, 1820)
		end
	elseif Old_World and (L_1_[22]["Value"] >= 450 and L_1_[22]["Value"] <= 474) then
		Enemy = "God's Guard"
		NameEnemy = "God's Guard"
		QuestName = "SkyExp1Quest"
		QuestNumber = 1
		QuestPos = CFrame["new"](-4721.88867, 843.874695, -1949.96643, .996191859, 0, -0.0871884301, 0, 1, 0, .0871884301, 0, .996191859)
		EnemyPos = CFrame["new"](-4710.04296875, 845.27697753906, -1927.3079833984)
		if ((CFrame["new"](-4721.88867, 843.874695, -1949.96643, .996191859, 0, -0.0871884301, 0, 1, 0, .0871884301, 0, .996191859))["Position"] - L_1_[5]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 7500 then
			L_1_[7]["Remotes"]["CommF_"]:InvokeServer("requestEntrance", Vector3["new"](-4607.82275, 872.54248, -1667.55688))
		end
	elseif Old_World and (L_1_[22]["Value"] >= 475 and L_1_[22]["Value"] <= 524) then
		Enemy = "Shanda"
		NameEnemy = "Shanda"
		QuestName = "SkyExp1Quest"
		QuestNumber = 2
		QuestPos = CFrame["new"](-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, .906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
		EnemyPos = CFrame["new"](-7678.4897460938, 5566.4038085938, -497.21560668945)
	elseif Old_World and (L_1_[22]["Value"] >= 525 and L_1_[22]["Value"] <= 549) then
		Enemy = "Royal Squad"
		NameEnemy = "Royal Squad"
		QuestName = "SkyExp2Quest"
		QuestNumber = 1
		QuestPos = CFrame["new"](-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		EnemyPos = CFrame["new"](-7624.2524414062, 5658.1333007812, -1467.3542480469)
	elseif Old_World and (L_1_[22]["Value"] >= 550 and L_1_[22]["Value"] <= 624) then
		Enemy = "Royal Soldier"
		NameEnemy = "Royal Soldier"
		QuestName = "SkyExp2Quest"
		QuestNumber = 2
		QuestPos = CFrame["new"](-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		EnemyPos = CFrame["new"](-7836.7534179688, 5645.6640625, -1790.6236572266)
		if Old_World and (L_1_[22]["Value"] >= 575 and L_1_[22]["Value"] <= 624) then
			Name_Boss = "Thunder God"
			QuestName_Boss = "SkyExp2Quest"
			QuestNumber_Boss = 3
		end
	elseif Old_World and (L_1_[22]["Value"] >= 625 and L_1_[22]["Value"] <= 649) then
		Enemy = "Galley Pirate"
		NameEnemy = "Galley Pirate"
		QuestName = "FountainQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](5259.81982, 37.3500175, 4050.0293, .087131381, 0, .996196866, 0, 1, 0, -0.996196866, 0, .087131381)
		EnemyPos = CFrame["new"](5551.0219726562, 78.901351928711, 3930.4128417969)
	elseif Old_World and (L_1_[22]["Value"] >= 650 and L_1_[22]["Value"] <= 99999) then
		Enemy = "Galley Captain"
		NameEnemy = "Galley Captain"
		QuestName = "FountainQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](5259.81982, 37.3500175, 4050.0293, .087131381, 0, .996196866, 0, 1, 0, -0.996196866, 0, .087131381)
		EnemyPos = CFrame["new"](5441.9516601562, 42.502059936523, 4950.09375)
		if Old_World and (L_1_[22]["Value"] >= 675 and L_1_[22]["Value"] <= 99999) then
			Name_Boss = "Cyborg"
			QuestName_Boss = "FountainQuest"
			QuestNumber_Boss = 3
		end
	elseif New_World and (L_1_[22]["Value"] >= 700 and L_1_[22]["Value"] <= 724) then
		Enemy = "Raider"
		NameEnemy = "Raider"
		QuestName = "Area1Quest"
		QuestNumber = 1
		QuestPos = CFrame["new"](-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, .974368095, 0, -0.22495985)
		EnemyPos = CFrame["new"](-728.32672119141, 52.779319763184, 2345.7705078125)
	elseif New_World and (L_1_[22]["Value"] >= 725 and L_1_[22]["Value"] <= 774) then
		Enemy = "Mercenary"
		NameEnemy = "Mercenary"
		QuestName = "Area1Quest"
		QuestNumber = 2
		QuestPos = CFrame["new"](-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, .974368095, 0, -0.22495985)
		EnemyPos = CFrame["new"](-1004.3244018555, 80.158866882324, 1424.6193847656)
		if New_World and (L_1_[22]["Value"] >= 750 and L_1_[22]["Value"] <= 774) then
			Name_Boss = "Diamond"
			QuestName_Boss = "Area1Quest"
			QuestNumber_Boss = 3
		end
	elseif New_World and (L_1_[22]["Value"] >= 775 and L_1_[22]["Value"] <= 799) then
		Enemy = "Swan Pirate"
		NameEnemy = "Swan Pirate"
		QuestName = "Area2Quest"
		QuestNumber = 1
		QuestPos = CFrame["new"](638.43811, 71.769989, 918.282898, .139203906, 0, .99026376, 0, 1, 0, -0.99026376, 0, .139203906)
		EnemyPos = CFrame["new"](1068.6643066406, 137.61428833008, 1322.1060791016)
	elseif New_World and (L_1_[22]["Value"] >= 800 and L_1_[22]["Value"] <= 874) then
		Enemy = "Factory Staff"
		NameEnemy = "Factory Staff"
		QuestName = "Area2Quest"
		QuestNumber = 2
		QuestPos = CFrame["new"](632.698608, 73.1055908, 918.666321, -0.0319722369, 8.960749e-10, -0.999488771, 1.3632653e-10, 1, 8.9217234e-10, .999488771, -1.0773209e-10, -0.0319722369)
		EnemyPos = CFrame["new"](73.078674316406, 81.863441467285, -27.470672607422)
		if New_World and (L_1_[22]["Value"] >= 850 and L_1_[22]["Value"] <= 874) then
			Name_Boss = "Jeremy"
			QuestName_Boss = "Area2Quest"
			QuestNumber_Boss = 3
		end
	elseif New_World and (L_1_[22]["Value"] >= 875 and L_1_[22]["Value"] <= 899) then
		Enemy = "Marine Lieutenant"
		NameEnemy = "Marine Lieutenant"
		QuestName = "MarineQuest3"
		QuestNumber = 1
		QuestPos = CFrame["new"](-2440.79639, 71.7140732, -3216.06812, .866007268, 0, .500031412, 0, 1, 0, -0.500031412, 0, .866007268)
		EnemyPos = CFrame["new"](-2821.3723144531, 75.897277832031, -3070.0891113281)
	elseif New_World and (L_1_[22]["Value"] >= 900 and L_1_[22]["Value"] <= 949) then
		Enemy = "Marine Captain"
		NameEnemy = "Marine Captain"
		QuestName = "MarineQuest3"
		QuestNumber = 2
		QuestPos = CFrame["new"](-2440.79639, 71.7140732, -3216.06812, .866007268, 0, .500031412, 0, 1, 0, -0.500031412, 0, .866007268)
		EnemyPos = CFrame["new"](-1861.2310791016, 80.176582336426, -3254.6975097656)
	elseif New_World and (L_1_[22]["Value"] >= 950 and L_1_[22]["Value"] <= 974) then
		Enemy = "Zombie"
		NameEnemy = "Zombie"
		QuestName = "ZombieQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, .95628953, 0, -0.29242146)
		EnemyPos = CFrame["new"](-5657.7768554688, 78.969734191895, -928.68701171875)
		if New_World and (L_1_[22]["Value"] >= 925 and L_1_[22]["Value"] <= 974) then
			Name_Boss = "Fajita"
			QuestName_Boss = "MarineQuest3"
			QuestNumber_Boss = 3
		end
	elseif New_World and (L_1_[22]["Value"] >= 975 and L_1_[22]["Value"] <= 999) then
		Enemy = "Vampire"
		NameEnemy = "Vampire"
		QuestName = "ZombieQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, .95628953, 0, -0.29242146)
		EnemyPos = CFrame["new"](-6037.66796875, 32.184638977051, -1340.6597900391)
	elseif New_World and (L_1_[22]["Value"] >= 1000 and L_1_[22]["Value"] <= 1049) then
		Enemy = "Snow Trooper"
		NameEnemy = "Snow Trooper"
		QuestName = "SnowMountainQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](609.858826, 400.119904, -5372.25928, -0.374604106, 0, .92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
		EnemyPos = CFrame["new"](549.14733886719, 427.38705444336, -5563.6987304688)
	elseif New_World and (L_1_[22]["Value"] >= 1050 and L_1_[22]["Value"] <= 1099) then
		Enemy = "Winter Warrior"
		NameEnemy = "Winter Warrior"
		QuestName = "SnowMountainQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](609.858826, 400.119904, -5372.25928, -0.374604106, 0, .92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
		EnemyPos = CFrame["new"](1142.7451171875, 475.63980102539, -5199.4165039062)
	elseif New_World and (L_1_[22]["Value"] >= 1100 and L_1_[22]["Value"] <= 1124) then
		Enemy = "Lab Subordinate"
		NameEnemy = "Lab Subordinate"
		QuestName = "IceSideQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](-6064.06885, 15.2422857, -4902.97852, .453972578, 0, -0.891015649, 0, 1, 0, .891015649, 0, .453972578)
		EnemyPos = CFrame["new"](-5707.4716796875, 15.951709747314, -4513.3920898438)
	elseif New_World and (L_1_[22]["Value"] >= 1125 and L_1_[22]["Value"] <= 1174) then
		Enemy = "Horned Warrior"
		NameEnemy = "Horned Warrior"
		QuestName = "IceSideQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](-6064.06885, 15.2422857, -4902.97852, .453972578, 0, -0.891015649, 0, 1, 0, .891015649, 0, .453972578)
		EnemyPos = CFrame["new"](-6341.3666992188, 15.951770782471, -5723.162109375)
		if New_World and (L_1_[22]["Value"] >= 1150 and L_1_[22]["Value"] <= 1174) then
			Name_Boss = "Smoke Admiral"
			QuestName_Boss = "IceSideQuest"
			QuestNumber_Boss = 3
		end
	elseif New_World and (L_1_[22]["Value"] >= 1175 and L_1_[22]["Value"] <= 1199) then
		Enemy = "Magma Ninja"
		NameEnemy = "Magma Ninja"
		QuestName = "FireSideQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, .469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
		EnemyPos = CFrame["new"](-5449.6728515625, 76.658744812012, -5808.2006835938)
	elseif New_World and (L_1_[22]["Value"] >= 1200 and L_1_[22]["Value"] <= 1249) then
		Enemy = "Lava Pirate"
		NameEnemy = "Lava Pirate"
		QuestName = "FireSideQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, .469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
		EnemyPos = CFrame["new"](-5213.3315429688, 49.737880706787, -4701.451171875)
	elseif New_World and (L_1_[22]["Value"] >= 1250 and L_1_[22]["Value"] <= 1274) then
		Enemy = "Ship Deckhand"
		NameEnemy = "Ship Deckhand"
		QuestName = "ShipQuest1"
		QuestNumber = 1
		QuestPos = CFrame["new"](1037.80127, 125.092171, 32911.6016)
		EnemyPos = CFrame["new"](1212.0111083984, 150.79205322266, 33059.24609375)
		if ((CFrame["new"](1212.0111083984, 150.79205322266, 33059.24609375))["Position"] - L_1_[5]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 5000 then
			((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", Vector3["new"](923.21301269531, 126.9759979248, 32852.83203125))
		end
	elseif New_World and (L_1_[22]["Value"] >= 1275 and L_1_[22]["Value"] <= 1299) then
		Enemy = "Ship Engineer"
		NameEnemy = "Ship Engineer"
		QuestName = "ShipQuest1"
		QuestNumber = 2
		QuestPos = CFrame["new"](1037.80127, 125.092171, 32911.6016)
		EnemyPos = CFrame["new"](919.47863769531, 43.544013977051, 32779.96875)
		if ((CFrame["new"](1212.0111083984, 150.79205322266, 33059.24609375))["Position"] - L_1_[5]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 5000 then
			((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", Vector3["new"](923.21301269531, 126.9759979248, 32852.83203125))
		end
	elseif New_World and (L_1_[22]["Value"] >= 1300 and L_1_[22]["Value"] <= 1324) then
		Enemy = "Ship Steward"
		NameEnemy = "Ship Steward"
		QuestName = "ShipQuest2"
		QuestNumber = 1
		QuestPos = CFrame["new"](968.80957, 125.092171, 33244.125)
		EnemyPos = CFrame["new"](919.43853759766, 129.55599975586, 33436.03515625)
		if ((CFrame["new"](1212.0111083984, 150.79205322266, 33059.24609375))["Position"] - L_1_[5]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 5000 then
			((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", Vector3["new"](923.21301269531, 126.9759979248, 32852.83203125))
		end
	elseif New_World and (L_1_[22]["Value"] >= 1325 and L_1_[22]["Value"] <= 1349) then
		Enemy = "Ship Officer"
		NameEnemy = "Ship Officer"
		QuestName = "ShipQuest2"
		QuestNumber = 2
		QuestPos = CFrame["new"](968.80957, 125.092171, 33244.125)
		EnemyPos = CFrame["new"](1036.0179443359, 181.4390411377, 33315.7265625)
		if ((CFrame["new"](1212.0111083984, 150.79205322266, 33059.24609375))["Position"] - L_1_[5]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 5000 then
			((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", Vector3["new"](923.21301269531, 126.9759979248, 32852.83203125))
		end
	elseif New_World and (L_1_[22]["Value"] >= 1350 and L_1_[22]["Value"] <= 1374) then
		Enemy = "Arctic Warrior"
		NameEnemy = "Arctic Warrior"
		QuestName = "FrostQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, .358349502, 0, -0.933587909)
		EnemyPos = CFrame["new"](5966.24609375, 62.970020294189, -6179.3828125)
	elseif New_World and (L_1_[22]["Value"] >= 1375 and L_1_[22]["Value"] <= 1424) then
		Enemy = "Snow Lurker"
		NameEnemy = "Snow Lurker"
		QuestName = "FrostQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, .358349502, 0, -0.933587909)
		EnemyPos = CFrame["new"](5407.0737304688, 69.194374084473, -6880.8803710938)
		if New_World and (L_1_[22]["Value"] >= 1400 and L_1_[22]["Value"] <= 1424) then
			Name_Boss = "Awakened Ice Admiral"
			QuestName_Boss = "FrostQuest"
			QuestNumber_Boss = 3
		end
	elseif New_World and (L_1_[22]["Value"] >= 1425 and L_1_[22]["Value"] <= 1449) then
		Enemy = "Sea Soldier"
		NameEnemy = "Sea Soldier"
		QuestName = "ForgottenQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](-3055, 240, -10145)
		EnemyPos = CFrame["new"](-3433, 26, -9784)
	elseif New_World and (L_1_[22]["Value"] >= 1450 and L_1_[22]["Value"] <= 999999) then
		Enemy = "Water Fighter"
		NameEnemy = "Water Fighter"
		QuestName = "ForgottenQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](-3054.53, 239.96, -10144.42)
		EnemyPos = CFrame["new"](-3360.23, 284.21, -10533.07)
		if New_World and (L_1_[22]["Value"] >= 1475 and L_1_[22]["Value"] <= 1499) then
			Name_Boss = "Tide Keeper"
			QuestName_Boss = "ForgottenQuest"
			QuestNumber_Boss = 3
		end
	elseif Three_World and (L_1_[22]["Value"] >= 1500 and L_1_[22]["Value"] <= 1524) then
		Enemy = "Pirate Millionaire"
		NameEnemy = "Pirate Millionaire"
		QuestName = "PiratePortQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](-449.15930175781, 108.61765289307, 5948.0014648438)
		EnemyPos = CFrame["new"](-245.99638366699, 47.30615234375, 5584.1005859375)
	elseif Three_World and (L_1_[22]["Value"] >= 1525 and L_1_[22]["Value"] <= 1574) then
		Enemy = "Pistol Billionaire"
		NameEnemy = "Pistol Billionaire"
		QuestName = "PiratePortQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](-449.15930175781, 108.61765289307, 5948.0014648438)
		EnemyPos = CFrame["new"](-187.33015441895, 86.239875793457, 6013.513671875)
		if Three_World and (L_1_[22]["Value"] >= 1550 and L_1_[22]["Value"] <= 1574) then
			Name_Boss = "Stone"
			QuestName_Boss = "PiratePortQuest"
			QuestNumber_Boss = 3
		end
	elseif Three_World and (L_1_[22]["Value"] >= 1575 and L_1_[22]["Value"] <= 1599) then
		Enemy = "Dragon Crew Warrior"
		NameEnemy = "Dragon Crew Warrior"
		QuestName = "DragonCrewQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](6737.7768554688, 127.42920684814, -713.23126220703)
		EnemyPos = CFrame["new"](6141.140625, 51.351364135742, -1340.7385253906)
	elseif Three_World and (L_1_[22]["Value"] >= 1600 and L_1_[22]["Value"] <= 1624) then
		Enemy = "Dragon Crew Archer"
		NameEnemy = "Dragon Crew Archer"
		QuestName = "DragonCrewQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](6737.7768554688, 127.42920684814, -713.23126220703)
		EnemyPos = CFrame["new"](6616.4174804688, 441.76705932617, 446.04699707031)
	elseif Three_World and (L_1_[22]["Value"] >= 1625 and L_1_[22]["Value"] <= 1649) then
		Enemy = "Hydra Enforcer"
		NameEnemy = "Hydra Enforcer"
		QuestName = "VenomCrewQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](5212.94140625, 1004.1171875, 755.66571044922)
		EnemyPos = CFrame["new"](4685.2583007812, 735.80780029297, 815.34259033203)
	elseif Three_World and (L_1_[22]["Value"] >= 1650 and L_1_[22]["Value"] <= 1699) then
		Enemy = "Venomous Assailant"
		NameEnemy = "Venomous Assailant"
		QuestName = "VenomCrewQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](5212.94140625, 1004.1171875, 755.66571044922)
		EnemyPos = CFrame["new"](4729.0942382812, 590.43676757812, -36.976276397705)
		if Three_World and (L_1_[22]["Value"] >= 1675 and L_1_[22]["Value"] <= 1699) then
			Name_Boss = "Hydra Leader"
			QuestName_Boss = "VenomCrewQuest"
			QuestNumber_Boss = 3
		end
	elseif Three_World and (L_1_[22]["Value"] >= 1700 and L_1_[22]["Value"] <= 1724) then
		Enemy = "Marine Commodore"
		NameEnemy = "Marine Commodore"
		QuestName = "MarineTreeIsland"
		QuestNumber = 1
		QuestPos = CFrame["new"](2484.0673828125, 74.282150268555, -6786.64453125)
		EnemyPos = CFrame["new"](2286.0078125, 73.133918762207, -7159.8090820312)
	elseif Three_World and (L_1_[22]["Value"] >= 1725 and L_1_[22]["Value"] <= 1774) then
		Enemy = "Marine Rear Admiral"
		NameEnemy = "Marine Rear Admiral"
		QuestName = "MarineTreeIsland"
		QuestNumber = 2
		QuestPos = CFrame["new"](2484.0673828125, 74.282150268555, -6786.64453125)
		EnemyPos = CFrame["new"](3656.7736816406, 160.52406311035, -7001.5986328125)
		if Three_World and (L_1_[22]["Value"] >= 1750 and L_1_[22]["Value"] <= 1774) then
			Name_Boss = "Kilo Admiral"
			QuestName_Boss = "MarineTreeIsland"
			QuestNumber_Boss = 3
		end
	elseif Three_World and (L_1_[22]["Value"] >= 1775 and L_1_[22]["Value"] <= 1799) then
		Enemy = "Fishman Raider"
		NameEnemy = "Fishman Raider"
		QuestName = "DeepForestIsland3"
		QuestNumber = 1
		QuestPos = CFrame["new"](-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, .469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
		EnemyPos = CFrame["new"](-10407.526367188, 331.76263427734, -8368.5166015625)
	elseif Three_World and (L_1_[22]["Value"] >= 1800 and L_1_[22]["Value"] <= 1824) then
		Enemy = "Fishman Captain"
		NameEnemy = "Fishman Captain"
		QuestName = "DeepForestIsland3"
		QuestNumber = 2
		QuestPos = CFrame["new"](-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, .469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
		EnemyPos = CFrame["new"](-10994.701171875, 352.38140869141, -9002.1103515625)
	elseif Three_World and (L_1_[22]["Value"] >= 1825 and L_1_[22]["Value"] <= 1849) then
		Enemy = "Forest Pirate"
		NameEnemy = "Forest Pirate"
		QuestName = "DeepForestIsland"
		QuestNumber = 1
		QuestPos = CFrame["new"](-13234.04, 331.488495, -7625.40137, .707134247, 0, -0.707079291, 0, 1, 0, .707079291, 0, .707134247)
		EnemyPos = CFrame["new"](-13274.478515625, 332.37814331055, -7769.5805664062)
	elseif Three_World and (L_1_[22]["Value"] >= 1850 and L_1_[22]["Value"] <= 1899) then
		Enemy = "Mythological Pirate"
		NameEnemy = "Mythological Pirate"
		QuestName = "DeepForestIsland"
		QuestNumber = 2
		QuestPos = CFrame["new"](-13234.04, 331.488495, -7625.40137, .707134247, 0, -0.707079291, 0, 1, 0, .707079291, 0, .707134247)
		EnemyPos = CFrame["new"](-13680.607421875, 501.08154296875, -6991.189453125)
		if Three_World and (L_1_[22]["Value"] >= 1875 and L_1_[22]["Value"] <= 1899) then
			Name_Boss = "Captain Elephant"
			QuestName_Boss = "DeepForestIsland"
			QuestNumber_Boss = 3
		end
	elseif Three_World and (L_1_[22]["Value"] >= 1900 and L_1_[22]["Value"] <= 1924) then
		Enemy = "Jungle Pirate"
		NameEnemy = "Jungle Pirate"
		QuestName = "DeepForestIsland2"
		QuestNumber = 1
		QuestPos = CFrame["new"](-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, .996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
		EnemyPos = CFrame["new"](-12256.16015625, 331.73828125, -10485.836914062)
	elseif Three_World and (L_1_[22]["Value"] >= 1924 and L_1_[22]["Value"] <= 1974) then
		Enemy = "Musketeer Pirate"
		NameEnemy = "Musketeer Pirate"
		QuestName = "DeepForestIsland2"
		QuestNumber = 2
		QuestPos = CFrame["new"](-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, .996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
		EnemyPos = CFrame["new"](-13457.904296875, 391.54565429688, -9859.177734375)
		if Three_World and (L_1_[22]["Value"] >= 1950 and L_1_[22]["Value"] <= 1974) then
			Name_Boss = "Beautiful Pirate"
			QuestName_Boss = "DeepForestIsland2"
			QuestNumber_Boss = 3
		end
	elseif Three_World and (L_1_[22]["Value"] >= 1974 and L_1_[22]["Value"] <= 1999) then
		Enemy = "Reborn Skeleton"
		NameEnemy = "Reborn Skeleton"
		QuestName = "HauntedQuest1"
		QuestNumber = 1
		QuestPos = CFrame["new"](-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, 0, -1, 0, 0)
		EnemyPos = CFrame["new"](-8763.7236328125, 165.72299194336, 6159.8618164062)
	elseif Three_World and (L_1_[22]["Value"] >= 2000 and L_1_[22]["Value"] <= 2024) then
		Enemy = "Living Zombie"
		NameEnemy = "Living Zombie"
		QuestName = "HauntedQuest1"
		QuestNumber = 2
		QuestPos = CFrame["new"](-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, 0, -1, 0, 0)
		EnemyPos = CFrame["new"](-10144.131835938, 138.6266784668, 5838.0888671875)
	elseif Three_World and (L_1_[22]["Value"] >= 2025 and L_1_[22]["Value"] <= 2049) then
		Enemy = "Demonic Soul"
		NameEnemy = "Demonic Soul"
		QuestName = "HauntedQuest2"
		QuestNumber = 1
		QuestPos = CFrame["new"](-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		EnemyPos = CFrame["new"](-9505.8720703125, 172.10482788086, 6158.9931640625)
	elseif Three_World and (L_1_[22]["Value"] >= 2050 and L_1_[22]["Value"] <= 2074) then
		Enemy = "Posessed Mummy"
		NameEnemy = "Posessed Mummy"
		QuestName = "HauntedQuest2"
		QuestNumber = 2
		QuestPos = CFrame["new"](-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		EnemyPos = CFrame["new"](-9582.0224609375, 6.2515273094177, 6205.478515625)
	elseif Three_World and (L_1_[22]["Value"] >= 2075 and L_1_[22]["Value"] <= 2099) then
		Enemy = "Peanut Scout"
		NameEnemy = "Peanut Scout"
		QuestName = "NutsIslandQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		EnemyPos = CFrame["new"](-2143.2419433594, 47.721984863281, -10029.995117188)
	elseif Three_World and (L_1_[22]["Value"] >= 2100 and L_1_[22]["Value"] <= 2124) then
		Enemy = "Peanut President"
		NameEnemy = "Peanut President"
		QuestName = "NutsIslandQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		EnemyPos = CFrame["new"](-1859.3540039062, 38.103168487549, -10422.4296875)
	elseif Three_World and (L_1_[22]["Value"] >= 2125 and L_1_[22]["Value"] <= 2149) then
		Enemy = "Ice Cream Chef"
		NameEnemy = "Ice Cream Chef"
		QuestName = "IceCreamIslandQuest"
		QuestNumber = 1
		QuestPos = CFrame["new"](-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		EnemyPos = CFrame["new"](-872.24658203125, 65.81957244873, -10919.95703125)
	elseif Three_World and (L_1_[22]["Value"] >= 2150 and L_1_[22]["Value"] <= 2199) then
		Enemy = "Ice Cream Commander"
		NameEnemy = "Ice Cream Commander"
		QuestName = "IceCreamIslandQuest"
		QuestNumber = 2
		QuestPos = CFrame["new"](-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		EnemyPos = CFrame["new"](-558.06103515625, 112.04895782471, -11290.774414063)
		if Three_World and (L_1_[22]["Value"] >= 2175 and L_1_[22]["Value"] <= 2199) then
			Name_Boss = "Cake Queen"
			QuestName_Boss = "IceCreamIslandQuest"
			QuestNumber_Boss = 3
		end
	elseif Three_World and (L_1_[22]["Value"] >= 2200 and L_1_[22]["Value"] <= 2224) then
		Enemy = "Cookie Crafter"
		NameEnemy = "Cookie Crafter"
		QuestName = "CakeQuest1"
		QuestNumber = 1
		QuestPos = CFrame["new"](-2021.32007, 37.7982254, -12028.7295, .957576931, -8.8030205e-08, .288177818, 6.930119e-08, 1, 7.519312e-08, -0.288177818, -5.2032135e-08, .957576931)
		EnemyPos = CFrame["new"](-2374.13671875, 37.798263549805, -12125.30859375)
	elseif Three_World and (L_1_[22]["Value"] >= 2225 and L_1_[22]["Value"] <= 2249) then
		Enemy = "Cake Guard"
		NameEnemy = "Cake Guard"
		QuestName = "CakeQuest1"
		QuestNumber = 2
		QuestPos = CFrame["new"](-2021.32007, 37.7982254, -12028.7295, .957576931, -8.8030205e-08, .288177818, 6.930119e-08, 1, 7.519312e-08, -0.288177818, -5.2032135e-08, .957576931)
		EnemyPos = CFrame["new"](-1598.3070068359, 43.773197174072, -12244.581054688)
	elseif Three_World and (L_1_[22]["Value"] >= 2250 and L_1_[22]["Value"] <= 2274) then
		Enemy = "Baking Staff"
		NameEnemy = "Baking Staff"
		QuestName = "CakeQuest2"
		QuestNumber = 1
		QuestPos = CFrame["new"](-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.2214214e-08, .250778586, 4.7491106e-08, 1, 1.4990471e-08, -0.250778586, 2.6421194e-08, -0.96804446)
		EnemyPos = CFrame["new"](-1887.8099365234, 77.618507385254, -12998.350585938)
	elseif Three_World and (L_1_[22]["Value"] >= 2275 and L_1_[22]["Value"] <= 2299) then
		Enemy = "Head Baker"
		NameEnemy = "Head Baker"
		QuestName = "CakeQuest2"
		QuestNumber = 2
		QuestPos = CFrame["new"](-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.2214214e-08, .250778586, 4.7491106e-08, 1, 1.4990471e-08, -0.250778586, 2.6421194e-08, -0.96804446)
		EnemyPos = CFrame["new"](-2216.1882324219, 82.884521484375, -12869.293945312)
	elseif Three_World and (L_1_[22]["Value"] >= 2300 and L_1_[22]["Value"] <= 2324) then
		Enemy = "Cocoa Warrior"
		NameEnemy = "Cocoa Warrior"
		QuestName = "ChocQuest1"
		QuestNumber = 1
		QuestPos = CFrame["new"](233.22836303711, 29.876001358032, -12201.233398438)
		EnemyPos = CFrame["new"](-21.553283691406, 80.574996948242, -12352.387695312)
	elseif Three_World and (L_1_[22]["Value"] >= 2325 and L_1_[22]["Value"] <= 2349) then
		Enemy = L_1_[3]({
			"Chocolate Bar Battle";
			"r"
		})
		NameEnemy = L_1_[3]({
			"Chocolate Bar Battle",
			"r"
		})
		QuestName = "ChocQuest1"
		QuestNumber = 2
		QuestPos = CFrame["new"](233.22836303711, 29.876001358032, -12201.233398438)
		EnemyPos = CFrame["new"](582.59057617188, 77.188095092773, -12463.162109375)
	elseif Three_World and (L_1_[22]["Value"] >= 2350 and L_1_[22]["Value"] <= 2374) then
		Enemy = "Sweet Thief"
		NameEnemy = "Sweet Thief"
		QuestName = "ChocQuest2"
		QuestNumber = 1
		QuestPos = CFrame["new"](150.50663757324, 30.693693161011, -12774.502929688)
		EnemyPos = CFrame["new"](165.1884765625, 76.058853149414, -12600.836914062)
	elseif Three_World and (L_1_[22]["Value"] >= 2375 and L_1_[22]["Value"] <= 2399) then
		Enemy = "Candy Rebel"
		NameEnemy = "Candy Rebel"
		QuestName = "ChocQuest2"
		QuestNumber = 2
		QuestPos = CFrame["new"](150.50663757324, 30.693693161011, -12774.502929688)
		EnemyPos = CFrame["new"](134.86563110352, 77.247680664062, -12876.547851562)
	elseif Three_World and (L_1_[22]["Value"] >= 2400 and L_1_[22]["Value"] <= 2424) then
		Enemy = "Candy Pirate"
		NameEnemy = "Candy Pirate"
		QuestName = "CandyQuest1"
		QuestNumber = 1
		QuestPos = CFrame["new"](-1167, 60, -14491)
		EnemyPos = CFrame["new"](-1310.5003662109, 26.016523361206, -14562.404296875)
	elseif Three_World and (L_1_[22]["Value"] >= 2425 and L_1_[22]["Value"] <= 2449) then
		Enemy = "Snow Demon"
		NameEnemy = "Snow Demon"
		QuestName = "CandyQuest1"
		QuestNumber = 2
		QuestPos = CFrame["new"](-1167, 60, -14491)
		EnemyPos = CFrame["new"](-880.20062255859, 71.247764587402, -14538.609375)
	elseif Three_World and (L_1_[22]["Value"] >= 2450 and L_1_[22]["Value"] <= 2474) then
		Enemy = "Isle Outlaw"
		NameEnemy = "Isle Outlaw"
		QuestName = "TikiQuest1"
		QuestNumber = 1
		QuestPos = CFrame["new"](-16547.748046875, 61.135334014893, -173.41360473633)
		EnemyPos = CFrame["new"](-16442.814453125, 116.13899993896, -264.46377563477)
	elseif Three_World and (L_1_[22]["Value"] >= 2475 and L_1_[22]["Value"] <= 2499) then
		Enemy = "Island Boy"
		NameEnemy = "Island Boy"
		QuestName = "TikiQuest1"
		QuestNumber = 2
		QuestPos = CFrame["new"](-16547.748046875, 61.135334014893, -173.41360473633)
		EnemyPos = CFrame["new"](-16901.26171875, 84.067565917969, -192.88906860352)
	elseif Three_World and (L_1_[22]["Value"] >= 2500 and L_1_[22]["Value"] <= 2524) then
		Enemy = "Sun-kissed Warrior"
		NameEnemy = "Sun"
		New = "Sun"
		QuestName = "TikiQuest2"
		QuestNumber = 1
		QuestPos = CFrame["new"](-16539.078125, 55.686328887939, 1051.5738525391)
		EnemyPos = CFrame["new"](-16051.969726562, 54.797149658203, 1084.67578125)
	elseif Three_World and (L_1_[22]["Value"] >= 2525 and L_1_[22]["Value"] <= 2549) then
		Enemy = "Isle Champion"
		NameEnemy = "Isle Champion"
		QuestName = "TikiQuest2"
		QuestNumber = 2
		QuestPos = CFrame["new"](-16539.078125, 55.686328887939, 1051.5738525391)
		EnemyPos = CFrame["new"](-16619.37109375, 129.98481750488, 1071.2355957031)
	elseif Three_World and (L_1_[22]["Value"] >= 2550 and L_1_[22]["Value"] <= 2574) then
		Enemy = "Serpent Hunter"
		NameEnemy = "Serpent Hunter"
		QuestName = "TikiQuest3"
		QuestNumber = 1
		QuestPos = CFrame["new"](-16666.5703125, 105.29138183594, 1576.6925048828)
		EnemyPos = CFrame["new"](-16474.5703125, 124.32273864746, 1619.248046875)
	elseif Three_World and (L_1_[22]["Value"] >= 2575 and L_1_[22]["Value"] <= 2650) then
		Enemy = "Skull Slayer"
		NameEnemy = "Skull Slayer"
		QuestName = "TikiQuest3"
		QuestNumber = 2
		QuestPos = CFrame["new"](-16666.5703125, 105.29138183594, 1576.6925048828)
		EnemyPos = CFrame["new"](-16778.7852, 232.283752, 1442.08325, -0.992449045, -5.54140511e-10, -0.12265785, -2.84580609e-10, 1, -2.21517649e-09, .12265785, -2.16354379e-09, -0.992449045)
	end
end
function TPZ(L_30_arg0)
	local L_31_ = {}
	L_31_[2] = L_30_arg0
	L_31_[1] = (L_31_[2]["Position"] - game["Players"]["LocalPlayer"]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"]
	if L_31_[1] < 100 then
		L_31_[4] = 50
	elseif L_31_[1] < 400 then
		L_31_[4] = 400
	elseif L_31_[1] < 1000 then
		L_31_[4] = 300
	elseif L_31_[1] < 1500 then
		L_31_[4] = 260
	elseif L_31_[1] >= 1500 then
		L_31_[4] = 300
	end
	L_1_[23] = (game:GetService("TweenService")):Create(game["Players"]["LocalPlayer"]["Character"]["HumanoidRootPart"], TweenInfo["new"](L_31_[1] / L_31_[4], Enum["EasingStyle"]["Linear"]), {
		["CFrame"] = L_31_[2]
	})
	L_1_[23]:Play()
end
L_1_[13] = tick()
L_1_[35] = (game:GetService("Players"))["LocalPlayer"]
L_1_[32] = function()
	if L_1_[47] then
		L_1_[47]:Cancel()
		L_1_[47] = nil
	end
end
L_1_[31] = function(L_32_arg0, L_33_arg1, L_34_arg2)
	local L_35_ = {}
	L_35_[10], L_35_[3], L_35_[4] = L_32_arg0, L_33_arg1, L_34_arg2
	L_35_[12] = 300
	if L_35_[3] == 1.6 then
		L_35_[12] = 350
	end
	L_35_[11] = L_35_[4] or 130
	L_35_[9] = L_1_[35]["Character"] and L_1_[35]["Character"]:FindFirstChild("HumanoidRootPart")
	L_35_[7] = L_1_[35]["Character"] and L_1_[35]["Character"]:FindFirstChild("Humanoid")
	if not L_35_[9] or not L_35_[7] then
		return
	end
	L_35_[13] = (L_35_[10]["Position"] - L_35_[9]["Position"])["Magnitude"]
	if L_35_[13] > 3000 and L_35_[7]["Health"] > 0 then
		local L_36_ = {}
		L_36_[1] = {
			{
				Vector3["new"](61163.85, 11.67, 1819.78),
				"Old_World"
			},
			{
				Vector3["new"](-4607.82, 872.54, -1667.55);
				"Old_World"
			};
			{
				Vector3["new"](-7894.61, 5547.14, -380.29),
				"Old_World"
			},
			{
				Vector3["new"](923.21, 126.97, 32852.83);
				"New_World"
			};
			{
				Vector3["new"](-2953.31, 41.01, 2099.17);
				"Old_World"
			}
		}
		for L_37_forvar0, L_38_forvar1 in pairs(L_36_[1]) do
			local L_39_ = {}
			L_39_[3], L_39_[1] = L_37_forvar0, L_38_forvar1
			if _G[L_39_[1][2]] and (L_39_[1][1] - L_35_[10]["Position"])["Magnitude"] <= 2300 then
				(game:GetService("ReplicatedStorage"))["Remotes"]["CommF_"]:InvokeServer("requestEntrance", L_39_[1][1])
				break
			end
		end
	end
	L_1_[13] = tick()
	L_1_[32]()
	L_35_[6] = (L_35_[10]["Position"] - L_35_[9]["Position"])["Magnitude"]
	L_35_[9]["CFrame"] = CFrame["new"](L_35_[9]["Position"]["X"], L_35_[10]["Position"]["Y"], L_35_[9]["Position"]["Z"])
	if L_35_[6] < 130 then
		pcall(function()
			L_35_[9]["CFrame"] = L_35_[10]
		end)
		return
	elseif L_35_[6] < L_35_[11] then
		L_35_[12] = 350
	end
	for L_40_forvar0, L_41_forvar1 in pairs(L_1_[35]["Character"]:GetDescendants()) do
		local L_42_ = {}
		L_42_[2], L_42_[3] = L_40_forvar0, L_41_forvar1
		if L_42_[3]:IsA("BasePart") and L_42_[3]["CanCollide"] then
			L_42_[3]["CanCollide"] = false
		end
	end
	L_35_[8] = L_35_[6] / L_35_[12]
	L_35_[2] = TweenInfo["new"](L_35_[8], Enum["EasingStyle"]["Linear"])
	L_35_[5] = {
		["CFrame"] = L_35_[10]
	}
	L_1_[47] = (game:GetService("TweenService")):Create(L_35_[9], L_35_[2], L_35_[5])
	L_1_[47]:Play()
end
L_1_[14] = function()
	if God_Human_C_M then
		local L_43_ = {}
		L_43_[1] = (game:GetService("ReplicatedStorage"))["Remotes"]["CommF_"]:InvokeServer("getInventory")
		for L_44_forvar0, L_45_forvar1 in pairs(L_43_[1]) do
			local L_46_ = {}
			L_46_[1], L_46_[3] = L_44_forvar0, L_45_forvar1
			if L_46_[3]["Type"] == "Sword" then
				if L_46_[3]["Name"] == "Tushita" and L_46_[3]["Mastery"] >= 400 then
					Tushita_M = true
				elseif L_46_[3]["Name"] == "Yama" and L_46_[3]["Mastery"] >= 400 then
					Yama_M = true
				end
			end
		end
		if not Tushita_M then
			if not L_1_[45]["ffc"](L_1_[35]["Backpack"], "Tushita") and not L_1_[45]["ffc"](L_1_[35]["Character"], "Tushita") then
				L_1_[7]["Remotes"]["CommF_"]:InvokeServer("LoadItem", "Tushita")
			end
		elseif not Yama_M then
			if not L_1_[45]["ffc"](L_1_[35]["Backpack"], "Yama") and not L_1_[45]["ffc"](L_1_[35]["Character"], "Yama") then
				L_1_[7]["Remotes"]["CommF_"]:InvokeServer("LoadItem", "Yama")
			end
		end
		for L_47_forvar0, L_48_forvar1 in pairs(L_1_[35]["Backpack"]:GetChildren()) do
			local L_49_ = {}
			L_49_[2], L_49_[1] = L_47_forvar0, L_48_forvar1
			if L_49_[1]:IsA("Tool") and tostring(L_49_[1]["ToolTip"]) == "Sword" then
				(L_1_[35]["Character"]:WaitForChild("Humanoid")):EquipTool(L_49_[1])
			end
		end
	else
		for L_50_forvar0, L_51_forvar1 in pairs(L_1_[35]["Backpack"]:GetChildren()) do
			local L_52_ = {}
			L_52_[2], L_52_[1] = L_50_forvar0, L_51_forvar1
			if L_52_[1]:IsA("Tool") and tostring(L_52_[1]["ToolTip"]) == "Melee" then
				(L_1_[35]["Character"]:WaitForChild("Humanoid")):EquipTool(L_52_[1])
			end
		end
	end
end
function TPBoat(L_53_arg0, L_54_arg1, L_55_arg2, L_56_arg3)
	local L_57_ = {}
	L_57_[3], L_57_[5], L_57_[4], L_57_[6] = L_53_arg0, L_54_arg1, L_55_arg2, L_56_arg3
	if L_57_[6] == nil then
		L_57_[6] = false
	end
	L_57_[1] = (L_57_[3]["Position"] - L_57_[5]["Position"])["Magnitude"]
	Speed = L_57_[4]
	TweenP = (game:GetService("TweenService")):Create(L_57_[5], TweenInfo["new"](L_57_[1] / Speed, Enum["EasingStyle"]["Linear"]), {
		["CFrame"] = L_57_[3]
	})
	if L_57_[6] == true then
		TweenP:Cancel()
	else
		TweenP:Play()
	end
end
setmetatable(L_1_[45], {
	["__index"] = function(L_58_arg0, L_59_arg1)
		local L_60_ = {}
		L_60_[2], L_60_[3] = L_58_arg0, L_59_arg1
		if L_60_[3] == "wt" then
			return function(L_61_arg0)
				local L_62_ = {}
				L_62_[2] = L_61_arg0
				return task["wait"](L_62_[2])
			end
		elseif L_60_[3] == "p" then
			return function(...)
				return pcall(...)
			end
		elseif L_60_[3] == "sf" then
			return function(L_63_arg0, L_64_arg1)
				local L_65_ = {}
				L_65_[2], L_65_[3] = L_63_arg0, L_64_arg1
				return string["find"](L_65_[2], tostring(L_65_[3]))
			end
		elseif L_60_[3] == "cf" then
			return function(...)
				L_1_[35]["Character"]["HumanoidRootPart"]["Remotes"]["CommF_"]:InvokeServer(...)
			end
		elseif L_60_[3] == "ffc" then
			return function(L_66_arg0, L_67_arg1)
				local L_68_ = {}
				L_68_[3], L_68_[2] = L_66_arg0, L_67_arg1
				return L_68_[3] and L_68_[3]:FindFirstChild(L_68_[2])
			end
		elseif L_60_[3] == "Equip" then
			return function(L_69_arg0)
				local L_70_ = {}
				L_70_[2] = L_69_arg0
				if not L_70_[2] or type(L_70_[2]) ~= "string" then
					return
				end
				for L_71_forvar0, L_72_forvar1 in pairs(L_1_[35]["Backpack"]:GetChildren()) do
					local L_73_ = {}
					L_73_[3], L_73_[2] = L_71_forvar0, L_72_forvar1
					if L_73_[2]:IsA("Tool") and L_73_[2]["Name"] == L_70_[2] then
						(L_1_[35]["Character"]:WaitForChild("Humanoid")):EquipTool(L_73_[2])
					end
				end
			end
		elseif L_60_[3] == "gi" then
			return function(L_74_arg0)
				local L_75_ = {}
				L_75_[2] = L_74_arg0
				if L_1_[45]["ffc"](L_1_[35]["Backpack"], L_75_[2]) or L_1_[45]["ffc"](L_1_[35]["Character"], L_75_[2]) then
					return true
				end
				for L_76_forvar0, L_77_forvar1 in pairs(L_1_[7]["Remotes"]["CommF_"]:InvokeServer("getInventoryWeapons")) do
					local L_78_ = {}
					L_78_[2], L_78_[1] = L_76_forvar0, L_77_forvar1
					if L_78_[1]["Name"] == L_75_[2] then
						return true
					end
				end
				return false
			end
		elseif L_60_[3] == "tf" then
			return function(L_79_arg0, L_80_arg1)
				local L_81_ = {}
				L_81_[3], L_81_[1] = L_79_arg0, L_80_arg1
				return table["find"](L_81_[3], L_81_[1])
			end
		elseif L_60_[3] == "CheckBoss" then
			return function(L_82_arg0)
				local L_83_ = {}
				L_83_[1] = L_82_arg0
				if L_1_[45]["ffc"](L_1_[7], L_83_[1]) or L_1_[45]["ffc"](L_1_[40], L_83_[1]) then
					return true
				end
				return false
			end
		elseif L_60_[3] == "IsHall" then
			return function()
				if L_1_[45]["ffc"](L_1_[19]["Map"], "IceCastle") then
					if L_1_[45]["ffc"](L_1_[19]["Map"]["IceCastle"]["Hall"]["LibraryDoor"], "Keyhole") then
						return true
					end
				end
				return false
			end
		elseif L_60_[3] == "CheckBackpack" then
			return function(L_84_arg0)
				local L_85_ = {}
				L_85_[1] = L_84_arg0
				if L_1_[45]["ffc"](L_1_[35]["Backpack"], L_85_[1]) or L_1_[45]["ffc"](L_1_[35]["Character"], L_85_[1]) then
					return true
				end
				return false
			end
		elseif L_60_[3] == "GetMobRaid" then
			return function()
				local L_86_ = {}
				L_86_[2] = {}
				for L_87_forvar0, L_88_forvar1 in pairs(L_1_[40]:GetChildren()) do
					local L_89_ = {}
					L_89_[1], L_89_[2] = L_87_forvar0, L_88_forvar1
					if L_89_[2]:FindFirstChild("HumanoidRootPart") and (L_89_[2]:FindFirstChild("Humanoid") and (L_89_[2]["Humanoid"]["Health"] > 0 and (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - L_89_[2]["HumanoidRootPart"]["Position"])["Magnitude"] <= 5000)) then
						table["insert"](L_86_[2], L_89_[2])
					end
				end
				return L_86_[2]
			end
		elseif L_60_[3] == "GetFruits" then
			return function()
				local L_90_ = {}
				L_90_[2] = {}
				for L_91_forvar0, L_92_forvar1 in pairs(L_1_[7]["Remotes"]["CommF_"]:InvokeServer("getInventory")) do
					local L_93_ = {}
					L_93_[3], L_93_[1] = L_91_forvar0, L_92_forvar1
					if L_93_[1]["Type"] == "Blox Fruit" and L_93_[1]["Value"] <= 999999 then
						table["insert"](L_90_[2], {
							["Name"] = L_93_[1]["Name"],
							["Value"] = L_93_[1]["Value"]
						})
					end
				end
				return L_90_[2]
			end
		elseif L_60_[3] == "GetRaid" then
			return function(L_94_arg0, L_95_arg1)
				local L_96_ = {}
				L_96_[3], L_96_[1] = L_94_arg0, L_95_arg1
				for L_97_forvar0, L_98_forvar1 in pairs(L_1_[19]["_WorldOrigin"]["Locations"]:GetChildren()) do
					local L_99_ = {}
					L_99_[1], L_99_[2] = L_97_forvar0, L_98_forvar1
					if L_99_[2]:IsA("Part") or L_99_[2]:IsA("BasePart") then
						if L_99_[2]["Name"] == L_96_[3] and (L_99_[2]["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= L_96_[1] then
							return L_99_[2]
						end
					end
				end
				return nil
			end
		elseif L_60_[3] == "GetType" then
			return function()
				local L_100_ = {}
				L_100_[1] = {}
				for L_101_forvar0, L_102_forvar1 in pairs(L_1_[7]["Remotes"]["CommF_"]:InvokeServer("getInventory")) do
					local L_103_ = {}
					L_103_[2], L_103_[3] = L_101_forvar0, L_102_forvar1
					if L_103_[3]["Type"] == "Blox Fruit" then
						table["insert"](L_100_[1], L_103_[3]["Name"])
					end
				end
				return L_100_[1]
			end
		elseif L_60_[3] == "IsInList" then
			return function(L_104_arg0, L_105_arg1)
				local L_106_ = {}
				L_106_[3], L_106_[2] = L_104_arg0, L_105_arg1
				for L_107_forvar0, L_108_forvar1 in pairs(L_106_[3]) do
					local L_109_ = {}
					L_109_[2], L_109_[3] = L_107_forvar0, L_108_forvar1
					if L_109_[3] == L_106_[2] then
						return true
					end
				end
				return false
			end
		elseif L_60_[3] == "IsHeavenly" then
			return function()
				for L_110_forvar0, L_111_forvar1 in pairs(((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("getTitles")) do
					local L_112_ = {}
					L_112_[1], L_112_[3] = L_110_forvar0, L_111_forvar1
					if L_112_[3]["Name"] == "Heavenly Devil" then
						return true
					end
				end
				return false
			end
		elseif L_60_[3] == "GetMonster" then
			return function(L_113_arg0)
				local L_114_ = {}
				L_114_[2] = L_113_arg0
				pcall(function()
					for L_115_forvar0, L_116_forvar1 in pairs(L_1_[40]:GetChildren()) do
						local L_117_ = {}
						L_117_[3], L_117_[1] = L_115_forvar0, L_116_forvar1
						if L_117_[1]:IsA("Model") and (L_117_[1]:FindFirstChild("Humanoid") and (L_117_[1]["Humanoid"]["Health"] > 0 and (L_117_[1]["HumanoidRootPart"]["Position"] - game["Players"]["LocalPlayer"]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= L_114_[2])) then
							Monster = L_117_[1]
							return
						end
					end
				end)
			end
		elseif L_60_[3] == "GetMon_Soul" then
			return function()
				for L_118_forvar0, L_119_forvar1 in next, (game:GetService("Workspace"))["Enemies"]:GetChildren() do
					local L_120_ = {}
					L_120_[3], L_120_[2] = L_118_forvar0, L_119_forvar1
					if L_120_[2]["Name"] == "Living Zombie" then
						table["insert"](get_mon, L_120_[2]["Name"])
					end
				end
			end
		elseif L_60_[3] == "click" then
			return function(L_121_arg0)
				local L_122_ = {}
				L_122_[1] = L_121_arg0
				L_1_[2]:SendMouseButtonEvent(L_122_[1]["AbsolutePosition"]["X"] + L_122_[1]["AbsoluteSize"]["X"] / 2, L_122_[1]["AbsolutePosition"]["Y"] + 90, 0, true, L_122_[1], 1)
				L_1_[2]:SendMouseButtonEvent(L_122_[1]["AbsolutePosition"]["X"] + L_122_[1]["AbsoluteSize"]["X"] / 2, L_122_[1]["AbsolutePosition"]["Y"] + 90, 0, false, L_122_[1], 1)
			end
		elseif L_60_[3] == "HopLowServer" then
			return function(L_123_arg0)
				local L_124_ = {}
				L_124_[1] = L_123_arg0
				pcall(function()
					local L_125_ = {}
					if not L_124_[1] then
						L_124_[1] = 10
					end
					ticklon = tick()
					repeat
						task["wait"]()
					until tick() - ticklon >= 1
					L_125_[1] = function()
						for L_126_forvar0 = 1, math["huge"], 1 do
							local L_127_ = {}
							L_127_[2] = L_126_forvar0
							if ChooseRegion == nil or ChooseRegion == "" then
								ChooseRegion = "Singapore"
							else
								(game:GetService("Players"))["LocalPlayer"]["PlayerGui"]["ServerBrowser"]["Frame"]["Filters"]["SearchRegion"]["TextBox"]["Text"] = ChooseRegion
							end
							L_127_[1] = (game:GetService("ReplicatedStorage"))["__ServerBrowser"]:InvokeServer(L_127_[2])
							for L_128_forvar0, L_129_forvar1 in pairs(L_127_[1]) do
								local L_130_ = {}
								L_130_[2], L_130_[3] = L_128_forvar0, L_129_forvar1
								if L_130_[2] ~= game["JobId"] and L_130_[3]["Count"] < L_124_[1] then
									(game:GetService("ReplicatedStorage"))["__ServerBrowser"]:InvokeServer("teleport", L_130_[2])
								end
							end
						end
						return false
					end
					if not(getgenv())["Loaded"] then
						local L_131_ = {}
						L_131_[1] = function(L_132_arg0)
							local L_133_ = {}
							L_133_[1] = L_132_arg0
							if L_133_[1]["Name"] == "ErrorPrompt" then
								if L_133_[1]["Visible"] then
									if L_133_[1]["TitleFrame"]["ErrorTitle"]["Text"] == "Teleport Failed" then
										HopLowServer()
										L_133_[1]["Visible"] = false
									end
								end;
								(L_133_[1]:GetPropertyChangedSignal("Visible")):Connect(function()
									if L_133_[1]["Visible"] then
										if L_133_[1]["TitleFrame"]["ErrorTitle"]["Text"] == "Teleport Failed" then
											HopLowServer()
											L_133_[1]["Visible"] = false
										end
									end
								end)
							end
						end
						for L_134_forvar0, L_135_forvar1 in pairs(game["CoreGui"]["RobloxPromptGui"]["promptOverlay"]:GetChildren()) do
							local L_136_ = {}
							L_136_[3], L_136_[1] = L_134_forvar0, L_135_forvar1
							L_131_[1](L_136_[1])
						end
						game["CoreGui"]["RobloxPromptGui"]["promptOverlay"]["ChildAdded"]:Connect(L_131_[1]);
						(getgenv())["Loaded"] = true
					end
					while task["wait"](.1) do
						L_125_[1]()
					end
				end)
			end
		elseif L_60_[3] == "CheckItem" then
			return function(L_137_arg0)
				local L_138_ = {}
				L_138_[2] = L_137_arg0
				for L_139_forvar0, L_140_forvar1 in pairs(L_1_[7]["Remotes"]["CommF_"]:InvokeServer("getInventory")) do
					local L_141_ = {}
					L_141_[2], L_141_[3] = L_139_forvar0, L_140_forvar1
					if type(L_141_[3]) == "table" then
						if L_141_[3]["Type"] == "Material" then
							if L_141_[3]["Name"] == L_138_[2] then
								return L_141_[3]["Count"]
							end
						end
					end
				end
				return 0
			end
		elseif L_60_[3] == "FarmBone" then
			return function(L_142_arg0)
				local L_143_ = {}
				L_143_[1] = L_142_arg0
				if L_143_[1] then
					if L_1_[45]["ffc"](L_1_[35]["Backpack"], "Fire Essence") or L_1_[45]["ffc"](L_1_[35]["Character"], "Fire Essence") then
						repeat
							L_1_[45]["Status"](L_1_[3]({
								" Status : Use Fire E";
								"ssence"
							}))
							L_1_[45]["Equip"]("Fire Essence")
							L_1_[45]["wt"](.5)
							L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDragonTalon", true)
							L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDragonTalon")
						until not L_1_[45]["ffc"](L_1_[35]["Backpack"], "Fire Essence") and not L_1_[45]["ffc"](L_1_[35]["Character"], "Fire Essence")
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDragonTalon")
						Dragon_Talon_C = true
					else
						if L_1_[45]["ffc"](L_1_[40], "Demonic Soul") or L_1_[45]["ffc"](L_1_[40], "Posessed Mummy") or L_1_[45]["ffc"](L_1_[40], "Reborn Skeleton") or L_1_[45]["ffc"](L_1_[40], "Living Zombie") then
							for L_144_forvar0, L_145_forvar1 in pairs(L_1_[40]:GetChildren()) do
								local L_146_ = {}
								L_146_[3], L_146_[1] = L_144_forvar0, L_145_forvar1
								if L_146_[1]["Name"] == "Reborn Skeleton" or L_146_[1]["Name"] == "Living Zombie" or L_146_[1]["Name"] == "Demonic Soul" or L_146_[1]["Name"] == "Posessed Mummy" then
									if L_146_[1]:FindFirstChild("HumanoidRootPart") and (L_146_[1]:FindFirstChild("Humanoid") and L_146_[1]["Humanoid"]["Health"] > 0) then
										repeat
											L_1_[45]["wt"](.1)
											if L_1_[45]["CheckItem"]("Bones") > 500 and L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Bones", "Check") > 0 then
												repeat
													L_1_[45]["wt"](.2)
													L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Bones", "Check")
													L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Bones", "Buy", 1, 1)
												until L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Bones", "Check") == 0
											end
											if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
												L_1_[35]["Character"]["HumanoidRootPart"]["Remotes"]["CommF_"]:InvokeServer("Buso")
											end
											L_1_[31](L_146_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5, 200)
											L_1_[14]()
											L_1_[45]["BN"](L_146_[1]["Name"])
										until not L_146_[1]["Parent"] or L_146_[1]["Humanoid"]["Health"] <= 0
									end
								end
							end
						else
							L_1_[31](CFrame["new"](-9505.8720703125, 172.10482788086, 6158.9931640625), 1.5)
						end
					end
				else
					if L_1_[45]["ffc"](L_1_[40], "Demonic Soul") or L_1_[45]["ffc"](L_1_[40], "Posessed Mummy") or L_1_[45]["ffc"](L_1_[40], "Reborn Skeleton") or L_1_[45]["ffc"](L_1_[40], "Living Zombie") then
						for L_147_forvar0, L_148_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_149_ = {}
							L_149_[1], L_149_[2] = L_147_forvar0, L_148_forvar1
							if L_149_[2]["Name"] == "Reborn Skeleton" or L_149_[2]["Name"] == "Living Zombie" or L_149_[2]["Name"] == "Demonic Soul" or L_149_[2]["Name"] == "Posessed Mummy" then
								if L_149_[2]:FindFirstChild("HumanoidRootPart") and (L_149_[2]:FindFirstChild("Humanoid") and L_149_[2]["Humanoid"]["Health"] > 0) then
									repeat
										L_1_[45]["wt"](.1)
										if L_1_[45]["CheckItem"]("Bones") > 500 and L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Bones", "Check") > 0 then
											repeat
												L_1_[45]["wt"](.2)
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Bones", "Check")
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Bones", "Buy", 1, 1)
											until L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Bones", "Check") == 0
										end
										if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
											L_1_[35]["Character"]["HumanoidRootPart"]["Remotes"]["CommF_"]:InvokeServer("Buso")
										end
										L_1_[31](L_149_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5, 200)
										L_1_[14]()
										L_1_[45]["BN"](L_149_[2]["Name"])
									until not L_149_[2]["Parent"] or L_149_[2]["Humanoid"]["Health"] <= 0
								end
							end
						end
					else
						L_1_[31](CFrame["new"](-9505.8720703125, 172.10482788086, 6158.9931640625), 1.5)
					end
				end
			end
		elseif L_60_[3] == "Get_Item_Inventory" then
			return function(L_150_arg0)
				local L_151_ = {}
				L_151_[2] = L_150_arg0
				if not L_1_[45]["ffc"](L_1_[35]["Backpack"], L_151_[2]) and not L_1_[45]["ffc"](L_1_[35]["Character"], L_151_[2]) then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("LoadItem", tostring(L_151_[2]))
				end
			end
		elseif L_60_[3] == "BN" then
			return function(L_152_arg0)
				local L_153_ = {}
				L_153_[2] = L_152_arg0
				pcall(function()
					local L_154_ = {}
					L_154_[3] = game["Players"]["LocalPlayer"]
					L_154_[2] = L_154_[3]["Character"] and L_154_[3]["Character"]:FindFirstChild("HumanoidRootPart")
					if not L_154_[2] then
						return
					end
					for L_155_forvar0, L_156_forvar1 in pairs(game["Workspace"]["Enemies"]:GetChildren()) do
						local L_157_ = {}
						L_157_[2], L_157_[3] = L_155_forvar0, L_156_forvar1
						if L_157_[3]:IsA("Model") and (L_157_[3]["Name"] == L_153_[2] and (L_157_[3]:FindFirstChild("Humanoid") and L_157_[3]:FindFirstChild("HumanoidRootPart"))) then
							local L_158_ = {}
							L_158_[3], L_158_[2] = L_157_[3]["Humanoid"], L_157_[3]["HumanoidRootPart"]
							if L_158_[3]["Health"] > 0 and (L_158_[2]["Position"] - L_154_[2]["Position"])["Magnitude"] <= 350 then
								local L_159_ = {}
								L_159_[2] = nil
								for L_160_forvar0, L_161_forvar1 in pairs(game["Workspace"]["Enemies"]:GetChildren()) do
									local L_162_ = {}
									L_162_[1], L_162_[2] = L_160_forvar0, L_161_forvar1
									if L_162_[2] ~= L_157_[3] and (L_162_[2]:IsA("Model") and (L_162_[2]["Name"] == L_153_[2] and L_162_[2]:FindFirstChild("HumanoidRootPart"))) then
										L_159_[2] = L_162_[2]["HumanoidRootPart"]
										break
									end
								end
								if L_159_[2] then
									local L_163_ = {}
									L_163_[1] = Instance["new"]("BodyPosition")
									L_163_[1]["Position"] = L_159_[2]["Position"] + Vector3["new"](0, 0, 0)
									L_163_[1]["MaxForce"] = Vector3["new"](1000000, 1000000, 1000000)
									L_163_[1]["P"] = 3000
									L_163_[1]["D"] = 100
									L_163_[1]["Name"] = "EnemyFlyPosition"
									L_163_[1]["Parent"] = L_158_[2]
								end
								L_158_[2]["CanCollide"] = false
								L_158_[3]:ChangeState(14)
								L_158_[3]["WalkSpeed"] = 0
								if L_158_[3]:FindFirstChild("Animator") then
									L_158_[3]["Animator"]:Destroy()
								end
								for L_164_forvar0, L_165_forvar1 in pairs(L_157_[3]:GetDescendants()) do
									local L_166_ = {}
									L_166_[2], L_166_[3] = L_164_forvar0, L_165_forvar1
									if L_166_[3]:IsA("BasePart") then
										L_166_[3]["CanCollide"] = false
										L_166_[3]["CanTouch"] = false
										L_166_[3]["CanQuery"] = false
									end
								end
								if L_157_[3]:FindFirstChild("Head") then
									L_157_[3]["Head"]["CanCollide"] = false
								end
							end
						end
					end
					sethiddenproperty(L_154_[3], "SimulationRadius", math["huge"])
				end)
			end
		elseif L_60_[3] == "Status" then
			return function(L_167_arg0)
				local L_168_ = {}
				L_168_[2] = L_167_arg0
				L_1_[26]["Text"] = L_168_[2]
			end
		elseif L_60_[3] == "GetQuest" then
			return function(L_169_arg0)
				local L_170_ = {}
				L_170_[1] = L_169_arg0
				if (Vector3["new"](-12379.1406, 601.433167, -6543.60742) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] > 30 then
					L_1_[31](CFrame["new"](-12379.1406, 601.433167, -6543.60742), 1.5)
				elseif (Vector3["new"](-12379.1406, 601.433167, -6543.60742) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] < 30 then
					if L_170_[1] == "Good" then
						repeat
							wait(.1)
							L_1_[31](CFrame["new"](-12392.5068, 603.319763, -6596.00586), 1.5)
						until (Vector3["new"](-12392.5068, 603.319763, -6596.00586) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3
						wait(1)
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CDKQuest", "Progress", "Good")
						wait(1)
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CDKQuest", "StartTrial", "Good")
					elseif L_170_[1] == "Evil" then
						repeat
							wait(.1)
							L_1_[31](CFrame["new"](-12392.2637, 603.319763, -6503.27832), 1.5)
						until (Vector3["new"](-12392.2637, 603.319763, -6503.27832) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3
						wait(1)
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CDKQuest", "Progress", "Evil")
						wait(1)
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CDKQuest", "StartTrial", "Evil")
					end
				end
			end
		elseif L_60_[3] == "GetTorch" then
			return function(L_171_arg0)
				local L_172_ = {}
				L_172_[2] = L_171_arg0
				repeat
					wait()
					L_1_[31](L_1_[19]["Map"]["HeavenlyDimension"][L_172_[2]]["CFrame"], 1.5)
				until (L_1_[19]["Map"]["HeavenlyDimension"][L_172_[2]]["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 7
				fireproximityprompt(workspace["Map"]["HeavenlyDimension"][L_172_[2]]["ProximityPrompt"])
				wait(.5)
			end
		elseif L_60_[3] == "GetTorchX" then
			return function(L_173_arg0)
				local L_174_ = {}
				L_174_[1] = L_173_arg0
				repeat
					wait()
					L_1_[31](L_1_[19]["Map"]["HellDimension"][L_174_[1]]["CFrame"], 1.5)
				until (L_1_[19]["Map"]["HellDimension"][L_174_[1]]["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 7
				fireproximityprompt(workspace["Map"]["HellDimension"][L_174_[1]]["ProximityPrompt"])
				wait(.5)
			end
		end
	end
})
L_1_[27] = game:GetService("Players")
L_1_[46] = game:GetService("ReplicatedStorage")
L_1_[25] = game:GetService("Workspace")
L_1_[34] = {}
L_1_[34]["__index"] = L_1_[34]
L_1_[51] = L_1_[27]["LocalPlayer"]
task["spawn"](function()
	while task["wait"](.5) do
		L_1_[45]["p"](function()
			if L_1_[35]["Data"]["Points"]["Value"] > 0 and L_1_[35]["Data"]["Stats"]["Melee"]["Level"]["Value"] < 2650 then
				L_1_[46]["Remotes"]["CommF_"]:InvokeServer("AddPoint", "Melee", L_1_[35]["Data"]["Points"]["Value"])
			end
			if L_1_[35]["Data"]["Stats"]["Melee"]["Level"]["Value"] >= 2650 and (L_1_[35]["Data"]["Points"]["Value"] > 0 and L_1_[35]["Data"]["Stats"]["Defense"]["Level"]["Value"] < 2550) then
				L_1_[46]["Remotes"]["CommF_"]:InvokeServer("AddPoint", "Defense", L_1_[35]["Data"]["Points"]["Value"])
			end
			if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
				L_1_[46]["Remotes"]["CommF_"]:InvokeServer("Buso")
			end
		end)
	end
end);
(getgenv())["Fast Attack"] = true
L_1_[20] = 0
task["spawn"](function()
	while task["wait"](L_1_[20]) do
		if (getgenv())["Fast Attack"] and not Stop_Fast_Attack then
			if L_1_[45]["sf"](L_1_[35]["PlayerGui"]["Main"]["Version"]["Text"], "v26.6.1") then
				xpcall(function()
					if (L_1_[51]["Character"] or L_1_[51]["CharacterAdded"]:Wait()):FindFirstChildOfClass("Tool") and ((L_1_[51]["Character"] or L_1_[51]["CharacterAdded"]:Wait()):FindFirstChildOfClass("Humanoid") and (L_1_[51]["Character"] or L_1_[51]["CharacterAdded"]:Wait())["Humanoid"]["Health"] > 0) then
						for L_175_forvar0, L_176_forvar1 in pairs(L_1_[25]["Enemies"]:GetChildren()) do
							local L_177_ = {}
							L_177_[1], L_177_[3] = L_175_forvar0, L_176_forvar1
							if L_177_[3]:FindFirstChildOfClass("Humanoid") and (L_177_[3]["Humanoid"]["Health"] > 0 and L_177_[3]:FindFirstChild("HumanoidRootPart")) then
								if (L_177_[3]["HumanoidRootPart"]["Position"] - L_1_[51]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 60 then
									local L_178_ = {}
									if (L_1_[51]["Character"] or L_1_[51]["CharacterAdded"]:Wait()):FindFirstChild("Stun") then
										(L_1_[51]["Character"] or L_1_[51]["CharacterAdded"]:Wait())["Stun"]["Value"] = 0
									end
									if (L_1_[51]["Character"] or L_1_[51]["CharacterAdded"]:Wait()):FindFirstChild("Busy") then
										(L_1_[51]["Character"] or L_1_[51]["CharacterAdded"]:Wait())["Busy"]["Value"] = false
									end
									if L_177_[3]:FindFirstChild("Stun") then
										L_177_[3]["Stun"]["Value"] = 0
									end
									if L_177_[3]:FindFirstChild("Busy") then
										L_177_[3]["Busy"]["Value"] = false
									end
									if L_1_[7]["Modules"]["Net"]:FindFirstChild("RE") and L_1_[7]["Modules"]["Net"]["RE"]:FindFirstChild("RegisterHit") then
										L_1_[7]["Modules"]["Net"]["RE"]["RegisterHit"]:SetAttribute("Virtual", not L_1_[7]["Modules"]["Net"]["RE"]["RegisterHit"]:GetAttribute("Virtual"))
									end
									if L_1_[51]["Character"] then
										L_1_[51]["Character"]:SetAttribute("Clashable", not L_1_[51]["Character"]:GetAttribute("Clashable"))
									end
									L_178_[2] = 0
									for L_179_forvar0, L_180_forvar1 in pairs(L_1_[25]["Enemies"]:GetChildren()) do
										local L_181_ = {}
										L_181_[1], L_181_[3] = L_179_forvar0, L_180_forvar1
										if L_181_[3]:FindFirstChildOfClass("Humanoid") and (L_181_[3]["Humanoid"]["Health"] > 0 and (L_181_[3]:FindFirstChild("HumanoidRootPart") and (L_181_[3]["HumanoidRootPart"]["Position"] - L_1_[51]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 60)) then
											L_178_[2] = L_178_[2] + 1
											if L_178_[2] > 5 then
												L_1_[20] = .1
											elseif L_178_[2] > 2 and L_178_[2] <= 5 then
												L_1_[20] = .03
											else
												L_1_[20] = 0
											end;
											(L_1_[48]:RemoteEvent("RegisterAttack")):FireServer(math["huge"]);
											(L_1_[48]:RemoteEvent("RegisterHit", true)):FireServer(L_181_[3]["Head"], {
												{
													L_181_[3],
													L_181_[3]["Head"]
												};
												L_181_[3]["Head"]
											}, nil, (tostring(L_1_[51]["UserId"])):sub(2, 4) .. (tostring(coroutine["running"]())):sub(11, 15))
										end
									end
								end
							end
						end
					end
				end, warn)
			else
				local L_182_ = {}
				assert(getrenv, L_1_[3]({
					"Exploit not supporte";
					"d"
				}))
				L_182_[11] = game:GetService("CollectionService")
				L_182_[2] = game:GetService("ReplicatedStorage")
				L_182_[8] = game:GetService("Players")
				L_182_[6] = L_182_[8]["LocalPlayer"]
				L_182_[3] = debug["getupvalue"]((getrenv())["_G"]["SendHitsToServer"], 1)
				L_182_[5] = L_182_[2]["Modules"]["Net"]["RE/RegisterAttack"]
				L_182_[4] = function()
					local L_183_ = {}
					L_183_[3] = L_182_[11]:GetTagged("BasicMob")
					if #L_183_[3] == 0 then
						return nil
					end
					L_183_[4] = {}
					L_183_[2] = L_182_[6]["Character"] and L_182_[6]["Character"]["PrimaryPart"]["Position"]
					if not L_183_[2] then
						return nil
					end
					for L_184_forvar0, L_185_forvar1 in pairs(L_183_[3]) do
						local L_186_ = {}
						L_186_[1], L_186_[4] = L_184_forvar0, L_185_forvar1
						L_186_[5] = L_186_[4]:FindFirstChildOfClass("Humanoid")
						L_186_[3] = L_186_[4]["PrimaryPart"]
						if L_186_[5] and (L_186_[5]["Health"] > 0 and L_186_[3]) then
							local L_187_ = {}
							L_187_[1] = (L_186_[3]["Position"] - L_183_[2])["Magnitude"]
							if L_187_[1] <= 100 then
								L_183_[4][#L_183_[4] + 1] = {
									["mob"] = L_186_[4];
									["distance"] = L_187_[1]
								}
							end
						end
					end
					if #L_183_[4] == 0 then
						return nil
					end
					table["sort"](L_183_[4], function(L_188_arg0, L_189_arg1)
						local L_190_ = {}
						L_190_[1], L_190_[2] = L_188_arg0, L_189_arg1
						return L_190_[1]["distance"] < L_190_[2]["distance"]
					end)
					return #L_183_[4] > 2 and {
						L_183_[4][1],
						L_183_[4][2]
					} or L_183_[4]
				end
				L_182_[1] = function()
					local L_191_ = {}
					L_191_[3] = L_182_[4]()
					if not L_191_[3] then
						return
					end
					L_191_[2] = {}
					for L_192_forvar0, L_193_forvar1 in pairs(L_191_[3]) do
						local L_194_ = {}
						L_194_[4], L_194_[2] = L_192_forvar0, L_193_forvar1
						L_194_[1] = L_194_[2]["mob"]:FindFirstChild("HumanoidRootPart")
						if L_194_[1] then
							L_191_[2][#L_191_[2] + 1] = {
								L_194_[2]["mob"];
								L_194_[1]
							}
						end
					end
					if #L_191_[2] > 0 then
						L_182_[5]:FireServer(0 / 0)
						coroutine["resume"](L_182_[3], L_191_[2][1][2], {
							table["unpack"](L_191_[2], 2)
						})
					end
				end
				L_182_[7], L_182_[9] = pcall(function()
					L_182_[1]()
				end)
				if not L_182_[7] then
					warn(L_1_[3]({
						"Error in Combat scri",
						"pt: "
					}) .. tostring(L_182_[9]))
				end
			end
		end
	end
end)
for L_195_forvar0, L_196_forvar1 in pairs(L_1_[7]["Remotes"]["CommF_"]:InvokeServer("getInventory")) do
	local L_197_ = {}
	L_197_[1], L_197_[3] = L_195_forvar0, L_196_forvar1
	if L_197_[3]["Type"] == "Material" then
		if L_197_[3]["Name"] == "Mirror Fractal" then
			Mirror_Fractal_H = true
		end
	end
end
L_1_[35]["PlayerGui"]["Notifications"]["Enabled"] = false
if (((L_1_[7]:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/FruitCustomizerRF")):InvokeServer({
	["StorageName"] = "Pure Red";
	["Type"] = "AuraSkin";
	["Context"] = "Equip"
}) ~= false then
	Pure_Red_H = true
end
if (((L_1_[7]:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/FruitCustomizerRF")):InvokeServer({
	["StorageName"] = "Snow White";
	["Type"] = "AuraSkin",
	["Context"] = "Equip"
}) ~= false then
	Snow_White = true
end
if (((L_1_[7]:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/FruitCustomizerRF")):InvokeServer({
	["StorageName"] = "Snow White";
	["Type"] = "AuraSkin";
	["Context"] = "Equip"
}) ~= false then
	Winter_Sky = true
end
if (((L_1_[7]:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/FruitCustomizerRF")):InvokeServer({
	["StorageName"] = "Rainbow Saviour";
	["Type"] = "AuraSkin";
	["Context"] = "Equip"
}) ~= false then
	Rainbow_Saviour = true
end
if Three_World and (L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TushitaProgress"))["OpenedDoor"] then
	Unlock_Tushita_Quest = true
end
L_1_[39] = function()
	local L_198_ = {}
	if Three_World then
		if tostring(string["match"](tostring(L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CakePrinceSpawner")), "%d+")) == "nil" or tostring(string["match"](tostring(L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CakePrinceSpawner")), "%d+")) == nil then
			L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CakePrinceSpawner", true)
		end
	end
	if Three_World then
		if L_1_[45]["ffc"](L_1_[40], "Cake Prince") or L_1_[45]["ffc"](L_1_[7], "Cake Prince") then
			if L_1_[45]["ffc"](L_1_[40], "Cake Prince") then
				for L_199_forvar0, L_200_forvar1 in pairs(L_1_[40]:GetChildren()) do
					local L_201_ = {}
					L_201_[2], L_201_[3] = L_199_forvar0, L_200_forvar1
					if L_201_[3]["Name"] == "Cake Prince" and L_201_[3]["Humanoid"]["Health"] > 0 then
						repeat
							L_1_[45]["wt"]()
							if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
								L_1_[35]["Character"]["HumanoidRootPart"]["Remotes"]["CommF_"]:InvokeServer("Buso")
							end
							L_1_[31](L_201_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, -30, 0), 1.5)
							L_1_[14]()
						until not L_201_[3]["Parent"] or L_201_[3]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"]
					end
				end
			elseif L_1_[45]["ffc"](L_1_[7], "Cake Prince") then
				for L_202_forvar0, L_203_forvar1 in pairs(L_1_[7]:GetChildren()) do
					local L_204_ = {}
					L_204_[1], L_204_[3] = L_202_forvar0, L_203_forvar1
					if L_204_[3]["Name"] == "Cake Prince" and L_204_[3]["Humanoid"]["Health"] > 0 then
						repeat
							L_1_[45]["wt"]()
							if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
								L_1_[35]["Character"]["HumanoidRootPart"]["Remotes"]["CommF_"]:InvokeServer("Buso")
							end
							L_1_[31](L_204_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, -30, 0), 1.5)
							L_1_[14]()
						until not L_204_[3]["Parent"] or L_204_[3]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"]
					end
				end
			end
		end
	end
	if Three_World then
		if L_1_[40]:FindFirstChild("rip_indra True Form") or L_1_[7]:FindFirstChild("rip_indra True Form") then
			if not(L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TushitaProgress"))["OpenedDoor"] then
				local L_205_ = {}
				L_205_[1] = L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TushitaProgress")
				if not L_205_[1]["OpenedDoor"] then
					if L_1_[35]["Backpack"]:FindFirstChild("Holy Torch") or L_1_[35]["Character"]:FindFirstChild("Holy Torch") then
						L_1_[45]["Equip"]("Holy Torch")
						for L_206_forvar0 = 1, 5, 1 do
							local L_207_ = {}
							L_207_[1] = L_206_forvar0
							L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TushitaProgress", "Torch", L_207_[1])
						end
					elseif L_1_[7]:FindFirstChild("rip_indra True Form") or L_1_[40]:FindFirstChild("rip_indra True Form") then
						if L_1_[35]["Backpack"]:FindFirstChild("Holy Torch") or L_1_[35]["Character"]:FindFirstChild("Holy Torch") then
							L_1_[45]["Equip"]("Holy Torch")
							for L_208_forvar0 = 1, 5, 1 do
								local L_209_ = {}
								L_209_[1] = L_208_forvar0
								L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TushitaProgress", "Torch", L_209_[1])
							end
						elseif L_1_[7]:FindFirstChild("rip_indra True Form") or L_1_[40]:FindFirstChild("rip_indra True Form") then
							task["spawn"](function()
								repeat
									L_1_[45]["wt"]()
									L_1_[2]:SendKeyEvent(true, "Space", false, game)
									L_1_[45]["wt"](.3)
									L_1_[2]:SendKeyEvent(false, "Space", false, game)
								until L_1_[35]["Backpack"]:FindFirstChild("Holy Torch") or L_1_[35]["Character"]:FindFirstChild("Holy Torch") or not L_1_[7]:FindFirstChild("rip_indra True Form") and not L_1_[40]:FindFirstChild("rip_indra True Form")
							end)
							repeat
								L_1_[45]["wt"]()
								L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"] = CFrame["new"](5714, 19, 254)
							until L_1_[35]["Backpack"]:FindFirstChild("Holy Torch") or L_1_[35]["Character"]:FindFirstChild("Holy Torch") or not L_1_[7]:FindFirstChild("rip_indra True Form") and not L_1_[40]:FindFirstChild("rip_indra True Form")
							if L_1_[35]["Backpack"]:FindFirstChild("Holy Torch") or L_1_[35]["Character"]:FindFirstChild("Holy Torch") then
								L_1_[45]["Equip"]("Holy Torch")
								for L_210_forvar0 = 1, 5, 1 do
									local L_211_ = {}
									L_211_[2] = L_210_forvar0
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TushitaProgress", "Torch", L_211_[2])
								end
							end
						end
					end
				elseif L_205_[1]["OpenedDoor"] then
					Unlock_Tushita_Quest = true
					return
				end
			else
				if L_1_[40]:FindFirstChild("rip_indra True Form") or L_1_[7]:FindFirstChild("rip_indra True Form") then
					if L_1_[40]:FindFirstChild("rip_indra True Form") then
						for L_212_forvar0, L_213_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_214_ = {}
							L_214_[3], L_214_[1] = L_212_forvar0, L_213_forvar1
							if L_214_[1]["Name"] == "rip_indra True Form" and L_214_[1]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"](.1)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[35]["Character"]["HumanoidRootPart"]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[31](L_214_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, -30, 0), 1.5)
									L_1_[14]()
								until not L_214_[1]["Parent"] or L_214_[1]["Humanoid"]["Health"] <= 0
							end
						end
					elseif L_1_[7]:FindFirstChild("rip_indra True Form") then
						L_1_[31]((L_1_[7]:FindFirstChild("rip_indra True Form"))["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0))
					end
				elseif L_1_[35]["Backpack"]:FindFirstChild("God's Chalice") or L_1_[35]["Character"]:FindFirstChild("God's Chalice") then
					repeat
						L_1_[45]["wt"](.1)
						Oyster_H = false
						Hot_pink_H = false
						Really_red_H = false
						for L_215_forvar0, L_216_forvar1 in pairs(L_1_[19]["Map"]["Boat Castle"]["Summoner"]["Circle"]:GetChildren()) do
							local L_217_ = {}
							L_217_[1], L_217_[2] = L_215_forvar0, L_216_forvar1
							if L_217_[2]["Name"] == "Part" and (tostring(L_217_[2]["BrickColor"]) == "Oyster" and tostring(L_217_[2]["Part"]["BrickColor"]) == "Lime green") then
								Oyster_H = true
							end
						end
						for L_218_forvar0, L_219_forvar1 in pairs(L_1_[19]["Map"]["Boat Castle"]["Summoner"]["Circle"]:GetChildren()) do
							local L_220_ = {}
							L_220_[3], L_220_[1] = L_218_forvar0, L_219_forvar1
							if L_220_[1]["Name"] == "Part" and (tostring(L_220_[1]["BrickColor"]) == "Hot pink" and tostring(L_220_[1]["Part"]["BrickColor"]) == "Lime green") then
								Hot_pink_H = true
							end
						end
						for L_221_forvar0, L_222_forvar1 in pairs(L_1_[19]["Map"]["Boat Castle"]["Summoner"]["Circle"]:GetChildren()) do
							local L_223_ = {}
							L_223_[1], L_223_[3] = L_221_forvar0, L_222_forvar1
							if L_223_[3]["Name"] == "Part" and (tostring(L_223_[3]["BrickColor"]) == "Really red" and tostring(L_223_[3]["Part"]["BrickColor"]) == "Lime green") then
								Really_red_H = true
							end
						end
						if Oyster_H and (Hot_pink_H and Really_red_H) then
							repeat
								L_1_[45]["wt"](.1)
								L_1_[45]["Equip"]("God's Chalice")
								L_1_[31](CFrame["new"](-5561.06738, 314.375793, -2663.88892, -0.304127187, -0.00254100002, .952628076, .000226983335, .999996245, .00273981248, -0.952631414, .00104948215, -0.304125458), 1.5)
							until (Vector3["new"](-5561.06738, 314.375793, -2663.88892) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 5
							L_1_[45]["wt"](1)
						else
							if L_1_[35]["Backpack"]:FindFirstChild("God's Chalice") or L_1_[35]["Character"]:FindFirstChild("God's Chalice") then
								repeat
									L_1_[45]["wt"](.1)
									L_1_[14]()
									L_1_[31](CFrame["new"](-5561.06738, 314.375793, -2663.88892, -0.304127187, -0.00254100002, .952628076, .000226983335, .999996245, .00273981248, -0.952631414, .00104948215, -0.304125458), 1.5)
								until (Vector3["new"](-5561.06738, 314.375793, -2663.88892) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 5
								if Snow_White and not Oyster_H then
									for L_224_forvar0, L_225_forvar1 in pairs(L_1_[19]["Map"]["Boat Castle"]["Summoner"]["Circle"]:GetChildren()) do
										local L_226_ = {}
										L_226_[3], L_226_[2] = L_224_forvar0, L_225_forvar1
										if L_226_[2]["Name"] == "Part" and tostring(L_226_[2]["BrickColor"]) == "Oyster" then
											if tostring(L_226_[2]["Part"]["BrickColor"]) ~= "Lime green" then
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("activateColor", "Snow White")
												L_1_[45]["wt"](1)
												repeat
													L_1_[45]["wt"]()
													if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
														L_1_[35]["Character"]["HumanoidRootPart"]["Remotes"]["CommF_"]:InvokeServer("Buso")
													end
													L_1_[31](L_226_[2]["Part"]["CFrame"], 1.5)
												until tostring(L_226_[2]["Part"]["BrickColor"]) == "Lime green"
												Oyster_H = true
											end
										end
									end
								end
								if Pure_Red_H and not Really_red_H then
									for L_227_forvar0, L_228_forvar1 in pairs(L_1_[19]["Map"]["Boat Castle"]["Summoner"]["Circle"]:GetChildren()) do
										local L_229_ = {}
										L_229_[1], L_229_[2] = L_227_forvar0, L_228_forvar1
										if L_229_[2]["Name"] == "Part" and tostring(L_229_[2]["BrickColor"]) == "Really red" then
											if tostring(L_229_[2]["Part"]["BrickColor"]) ~= "Lime green" then
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("activateColor", "Pure Red")
												L_1_[45]["wt"](1)
												repeat
													L_1_[45]["wt"]()
													if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
														L_1_[35]["Character"]["HumanoidRootPart"]["Remotes"]["CommF_"]:InvokeServer("Buso")
													end
													L_1_[31](L_229_[2]["Part"]["CFrame"], 1.5)
												until tostring(L_229_[2]["Part"]["BrickColor"]) == "Lime green"
												Really_red_H = true
											end
										end
									end
								end
								if Winter_Sky and not Hot_pink_H then
									for L_230_forvar0, L_231_forvar1 in pairs(L_1_[19]["Map"]["Boat Castle"]["Summoner"]["Circle"]:GetChildren()) do
										local L_232_ = {}
										L_232_[1], L_232_[2] = L_230_forvar0, L_231_forvar1
										if L_232_[2]["Name"] == "Part" and tostring(L_232_[2]["BrickColor"]) == "Hot pink" then
											if tostring(L_232_[2]["Part"]["BrickColor"]) ~= "Lime green" then
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("activateColor", "Winter Sky")
												L_1_[45]["wt"](1)
												repeat
													L_1_[45]["wt"]()
													if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
														L_1_[35]["Character"]["HumanoidRootPart"]["Remotes"]["CommF_"]:InvokeServer("Buso")
													end
													L_1_[31](L_232_[2]["Part"]["CFrame"], 1.5)
												until tostring(L_232_[2]["Part"]["BrickColor"]) == "Lime green"
												Hot_pink_H = true
											end
										end
									end
								end
								L_1_[45]["Equip"]("God's Chalice")
								L_1_[31](CFrame["new"](-5561.06738, 314.375793, -2663.88892, -0.304127187, -0.00254100002, .952628076, .000226983335, .999996245, .00273981248, -0.952631414, .00104948215, -0.304125458), 1.5)
								if TimeLoaderx == nil or tick() - TimeLoaderx > 10 then
									TimeLoaderx = tick()
									L_1_[7][L_1_[3]({
										"DefaultChatSystemCha",
										"tEvents"
									})]["SayMessageRequest"]:FireServer(L_1_[3]({
										"I have God Chalice. ",
										"I Can't Spawn Boss A";
										"dmin"
									}), "All")
								end
							end
						end
					until not L_1_[35]["Backpack"]:FindFirstChild("God's Chalice") and not L_1_[35]["Character"]:FindFirstChild("God's Chalice")
				end
			end
		end
	end
	if Three_World then
		if L_1_[40]:FindFirstChild("rip_indra True Form") or L_1_[7]:FindFirstChild("rip_indra True Form") then
			if L_1_[40]:FindFirstChild("rip_indra True Form") then
				for L_233_forvar0, L_234_forvar1 in pairs(L_1_[40]:GetChildren()) do
					local L_235_ = {}
					L_235_[1], L_235_[3] = L_233_forvar0, L_234_forvar1
					if L_235_[3]["Name"] == "rip_indra True Form" and L_235_[3]["Humanoid"]["Health"] > 0 then
						repeat
							L_1_[45]["wt"](.1)
							if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
								L_1_[35]["Character"]["HumanoidRootPart"]["Remotes"]["CommF_"]:InvokeServer("Buso")
							end
							L_1_[31](L_235_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, -30, 0), 1.5)
							L_1_[14]()
						until not L_235_[3]["Parent"] or L_235_[3]["Humanoid"]["Health"] <= 0
					end
				end
			elseif L_1_[7]:FindFirstChild("rip_indra True Form") then
				L_1_[31]((L_1_[7]:FindFirstChild("rip_indra True Form"))["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0))
			end
		end
	end
	L_198_[2] = false
	if Three_World and not Mirror_Fractal_H then
		if L_1_[45]["ffc"](L_1_[35]["Backpack"], "Sweet Chalice") or L_1_[45]["ffc"](L_1_[35]["Character"], "Sweet Chalice") or L_1_[45]["ffc"](L_1_[35]["Backpack"], "God's Chalice") or L_1_[45]["ffc"](L_1_[35]["Character"], "God's Chalice") or L_1_[45]["ffc"](L_1_[40], "Dough King") or L_1_[45]["ffc"](L_1_[7], "Dough King") then
			repeat
				wait()
				for L_236_forvar0, L_237_forvar1 in pairs(L_1_[7]["Remotes"]["CommF_"]:InvokeServer("getInventory")) do
					local L_238_ = {}
					L_238_[2], L_238_[3] = L_236_forvar0, L_237_forvar1
					if L_238_[3]["Type"] == "Material" then
						if L_238_[3]["Name"] == "Mirror Fractal" then
							Mirror_Fractal_H = true
						end
					end
				end
				if L_1_[45]["ffc"](L_1_[40], "Dough King") or L_1_[45]["ffc"](L_1_[7], "Dough King") then
					if L_1_[45]["ffc"](L_1_[40], "Dough King") then
						for L_239_forvar0, L_240_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_241_ = {}
							L_241_[2], L_241_[1] = L_239_forvar0, L_240_forvar1
							if L_241_[1]["Name"] == "Dough King" and L_241_[1]["Humanoid"]["Health"] > 0 then
								repeat
									wait(.1)
									L_1_[31](L_241_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, -30, 0), 1.5)
									L_1_[14]()
								until not L_241_[1]["Parent"] or L_241_[1]["Humanoid"]["Health"] <= 0
								for L_242_forvar0, L_243_forvar1 in pairs((game:GetService("ReplicatedStorage"))["Remotes"]["CommF_"]:InvokeServer("getInventory")) do
									local L_244_ = {}
									L_244_[3], L_244_[1] = L_242_forvar0, L_243_forvar1
									if L_244_[1]["Type"] == "Material" then
										if L_244_[1]["Name"] == "Mirror Fractal" then
											Mirror_Fractal_H = true
										end
									end
								end
								return
							end
						end
					elseif L_1_[45]["ffc"](L_1_[7], "Dough King") then
						L_1_[31]((game["ReplicatedStorage"]:FindFirstChild("Dough King"))["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
					end
				elseif L_1_[45]["ffc"](L_1_[35]["Backpack"], "Sweet Chalice") or L_1_[45]["ffc"](L_1_[35]["Character"], "Sweet Chalice") and not Mirror_Fractal_H then
					if (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - Vector3["new"](-2286.6843261719, 146.56562805176, -12226.881835938))["Magnitude"] >= 1800 then
						repeat
							wait()
							L_1_[31](CFrame["new"](-2286.6843261719, 146.56562805176, -12226.881835938), 1.5)
						until (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - Vector3["new"](-2286.6843261719, 146.56562805176, -12226.881835938))["Magnitude"] <= 3
					elseif (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - Vector3["new"](-2286.6843261719, 146.56562805176, -12226.881835938))["Magnitude"] < 1800 then
						Monster = nil
						for L_245_forvar0 = 1500, 0, -300 do
							local L_246_ = {}
							L_246_[1] = L_245_forvar0
							L_1_[45]["GetMonster"](L_246_[1])
						end
						if Monster ~= nil and Monster["Humanoid"]["Health"] > 0 then
							local L_247_ = {}
							PosMon_X = Monster["HumanoidRootPart"]["CFrame"]
							StatrMagnet = true
							repeat
								wait()
								L_1_[31](Monster["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, -17, 0), 1.5)
								L_1_[14]()
							until not Monster["Parent"] or Monster["Humanoid"]["Health"] <= 0
							StatrMagnet = false
							L_247_[1] = tostring(string["match"](tostring(L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CakePrinceSpawner")), "%d+"))
							if L_247_[1] == "nil" or L_247_[1] == nil then
								L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CakePrinceSpawner", true)
							end
						elseif Monster == nil then
							for L_248_forvar0 = 1500, 0, -300 do
								local L_249_ = {}
								L_249_[2] = L_248_forvar0
								L_1_[45]["GetMonster"](L_249_[2])
							end
							if Monster == nil then
								L_1_[31](CFrame["new"](-2286.6843261719, 146.56562805176, -12226.881835938), 1.5)
							end
						end
					end
				elseif L_1_[45]["ffc"](L_1_[35]["Backpack"], "God's Chalice") or L_1_[45]["ffc"](L_1_[35]["Character"], "God's Chalice") and not Mirror_Fractal_H then
					if L_1_[45]["CheckItem"]("Conjured Cocoa") >= 10 then
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("SweetChaliceNpc")
					elseif L_1_[45]["CheckItem"]("Conjured Cocoa") < 10 then
						if (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - Vector3["new"](658.22302246094, 24.734258651733, -12541.991210938))["Magnitude"] >= 1800 then
							repeat
								wait()
								L_1_[31](CFrame["new"](658.22302246094, 24.734258651733, -12541.991210938), 1.5)
							until (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - Vector3["new"](658.22302246094, 24.734258651733, -12541.991210938))["Magnitude"] <= 3 or L_1_[45]["CheckItem"]("Conjured Cocoa") >= 10
						elseif (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - Vector3["new"](658.22302246094, 24.734258651733, -12541.991210938))["Magnitude"] < 1800 then
							Monster = nil
							for L_250_forvar0 = 1500, 0, -300 do
								local L_251_ = {}
								L_251_[1] = L_250_forvar0
								L_1_[45]["GetMonster"](L_251_[1])
							end
							if Monster ~= nil and Monster["Humanoid"]["Health"] > 0 then
								PosMon_X = Monster["HumanoidRootPart"]["CFrame"]
								StatrMagnet = true
								repeat
									wait()
									L_1_[31](Monster["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, -17, 0), 1.5)
									L_1_[14]()
								until not Monster["Parent"] or Monster["Humanoid"]["Health"] <= 0
								StatrMagnet = false
							elseif Monster == nil then
								for L_252_forvar0 = 1500, 0, -300 do
									local L_253_ = {}
									L_253_[2] = L_252_forvar0
									L_1_[45]["GetMonster"](L_253_[2])
								end
								if Monster == nil then
									L_1_[31](CFrame["new"](658.22302246094, 24.734258651733, -12541.991210938), 1.5)
								end
							end
						end
					end
				elseif not L_1_[40]:FindFirstChild("Dough King") and not L_1_[7]:FindFirstChild("Dough King") then
					L_198_[2] = true
				end
			until Mirror_Fractal_H or L_198_[2]
		end
	end
	if Three_World then
		if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("EliteHunter") ~= L_1_[3]({
			"I don't have anythin";
			"g for you right now.",
			" Come back later."
		}) then
			L_1_[7]["Remotes"]["CommF_"]:InvokeServer("EliteHunter")
			for L_254_forvar0, L_255_forvar1 in ipairs({
				"Diablo";
				"Deandre";
				"Urban"
			}) do
				local L_256_ = {}
				L_256_[2], L_256_[1] = L_254_forvar0, L_255_forvar1
				L_256_[3] = L_1_[40]:FindFirstChild(L_256_[1]) or L_1_[7]:FindFirstChild(L_256_[1])
				if L_256_[3] and (L_256_[3]:FindFirstChild("HumanoidRootPart") and (L_256_[3]:FindFirstChild("Humanoid") and L_256_[3]["Humanoid"]["Health"] > 0)) then
					repeat
						L_1_[45]["wt"]()
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("EliteHunter")
						L_1_[31](L_256_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
						if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
							L_1_[35]["Character"]["HumanoidRootPart"]["Remotes"]["CommF_"]:InvokeServer("Buso")
						end
						L_1_[14]()
					until not L_256_[3]["Parent"] or L_256_[3]["Humanoid"]["Health"] <= 0
				end
			end
		end
	end
	if New_World then
		if L_1_[45]["ffc"](L_1_[40], "Darkbeard") or L_1_[45]["ffc"](L_1_[7], "Darkbeard") then
			if L_1_[45]["ffc"](L_1_[40], "Darkbeard") then
				for L_257_forvar0, L_258_forvar1 in pairs(L_1_[40]:GetChildren()) do
					local L_259_ = {}
					L_259_[3], L_259_[1] = L_257_forvar0, L_258_forvar1
					if L_259_[1]["Name"] == "Darkbeard" and L_259_[1]["Humanoid"]["Health"] > 0 then
						repeat
							L_1_[45]["wt"]()
							if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
								L_1_[35]["Character"]["HumanoidRootPart"]["Remotes"]["CommF_"]:InvokeServer("Buso")
							end
							L_1_[31](L_259_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, -30, 0), 1.5)
							L_1_[14]()
						until not L_259_[1]["Parent"] or L_259_[1]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"]
					end
				end
			elseif L_1_[45]["ffc"](L_1_[7], "Darkbeard") then
				for L_260_forvar0, L_261_forvar1 in pairs(L_1_[7]:GetChildren()) do
					local L_262_ = {}
					L_262_[2], L_262_[1] = L_260_forvar0, L_261_forvar1
					if L_262_[1]["Name"] == "Darkbeard" and L_262_[1]["Humanoid"]["Health"] > 0 then
						repeat
							L_1_[45]["wt"]()
							if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
								L_1_[35]["Character"]["HumanoidRootPart"]["Remotes"]["CommF_"]:InvokeServer("Buso")
							end
							L_1_[31](L_262_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, -30, 0), 1.5)
							L_1_[14]()
						until not L_262_[1]["Parent"] or L_262_[1]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"]
					end
				end
			end
		end
	end
	if New_World then
		if L_1_[45]["ffc"](L_1_[40], "Core") or L_1_[45]["ffc"](L_1_[7], "Core") then
			if L_1_[45]["ffc"](L_1_[40], "Core") then
				for L_263_forvar0, L_264_forvar1 in pairs(L_1_[40]:GetChildren()) do
					local L_265_ = {}
					L_265_[1], L_265_[2] = L_263_forvar0, L_264_forvar1
					if L_265_[2]["Name"] == "Core" and L_265_[2]["Humanoid"]["Health"] > 0 then
						repeat
							L_1_[45]["wt"]()
							L_1_[31](L_265_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
							if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
								L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
							end
							L_1_[14]()
						until not L_265_[2]["Parent"] or L_265_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"]
					end
				end
			elseif L_1_[45]["ffc"](L_1_[7], "Core") then
				for L_266_forvar0, L_267_forvar1 in pairs(L_1_[7]:GetChildren()) do
					local L_268_ = {}
					L_268_[3], L_268_[2] = L_266_forvar0, L_267_forvar1
					if L_268_[2]["Name"] == "Core" and L_268_[2]["Humanoid"]["Health"] > 0 then
						repeat
							L_1_[45]["wt"]()
							L_1_[31](L_268_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
							if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
								L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
							end
							L_1_[14]()
						until not L_268_[2]["Parent"] or L_268_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"]
					end
				end
			end
		end
	end
	L_1_[8]()
	if Quest ~= nil then
		return
	end
	if L_1_[24]["Value"] < 2650 or not Three_World then
		if L_1_[24]["Value"] <= 9 and (not New_World and not Three_World) then
			if L_1_[35]["PlayerGui"]["Main"]["Quest"]["Visible"] then
				if L_1_[45]["sf"](L_1_[35]["PlayerGui"]["Main"]["Quest"]["Container"]["QuestTitle"]["Title"]["Text"], tostring(NameEnemy)) then
					if L_1_[45]["ffc"](L_1_[40], Enemy) then
						for L_269_forvar0, L_270_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_271_ = {}
							L_271_[1], L_271_[2] = L_269_forvar0, L_270_forvar1
							if L_271_[2]["Name"] == Enemy and (L_1_[45]["ffc"](L_271_[2], "Humanoid") and (L_271_[2]["Humanoid"]["Health"] > 0 and L_1_[45]["ffc"](L_271_[2], "HumanoidRootPart"))) then
								repeat
									L_1_[45]["wt"]()
									L_1_[45]["BN"](L_271_[2]["Name"])
									L_1_[31](L_271_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until L_271_[2]["Humanoid"]["Health"] <= 0 or not L_1_[40]:FindFirstChild(Enemy) or not(L_1_[35]["PlayerGui"]["Main"]:FindFirstChild("Quest"))["Visible"] or not(getgenv())["AutoFarm"] or Quest ~= nil
							end
						end
					else
						L_1_[31](EnemyPos, 1.5)
					end
				else
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("AbandonQuest")
				end
			else
				repeat
					L_1_[45]["wt"]()
					L_1_[31](QuestPos, 1.5)
					if (QuestPos["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 5 and (L_1_[35]["Character"]:WaitForChild("Humanoid"))["Health"] > 0 then
						L_1_[45]["wt"]();
						((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("StartQuest", QuestName, QuestNumber)
					end
				until (L_1_[35]["PlayerGui"]["Main"]:FindFirstChild("Quest"))["Visible"] or not(getgenv())["AutoFarm"] or Quest ~= nil
			end
		elseif L_1_[24]["Value"] >= 9 and (L_1_[24]["Value"] <= 70 and (not New_World and not Three_World)) then
			if ((CFrame["new"](-7895, 5546, -380))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 1000 then
				if L_1_[45]["ffc"](L_1_[40], "Shanda") then
					for L_272_forvar0, L_273_forvar1 in pairs(L_1_[40]:GetChildren()) do
						local L_274_ = {}
						L_274_[2], L_274_[1] = L_272_forvar0, L_273_forvar1
						if L_274_[1]["Name"] == "Shanda" and (L_274_[1]:FindFirstChild("Humanoid") and L_274_[1]["Humanoid"]["Health"] > 0) then
							repeat
								L_1_[45]["wt"]()
								SROP = true
								L_1_[31](L_274_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
								L_1_[14]()
								L_1_[45]["BN"](L_274_[1]["Name"])
							until not L_274_[1]["Parent"] or L_274_[1]["Humanoid"]["Health"] <= 0 or L_1_[24]["Value"] >= 91 or not(getgenv())["AutoFarm"] or Quest ~= nil
						end
					end
				else
					L_1_[31](CFrame["new"](-7757, 5582, -481), 1.5)
				end
			else
				L_1_[7]["Remotes"]["CommF_"]:InvokeServer("requestEntrance", Vector3["new"](-7894.6176757813, 5547.1416015625, -380.29119873047))
			end
		elseif L_1_[24]["Value"] >= 71 then
			if L_1_[35]["PlayerGui"]["Main"]["Quest"]["Visible"] then
				if L_1_[45]["sf"](L_1_[35]["PlayerGui"]["Main"]["Quest"]["Container"]["QuestTitle"]["Title"]["Text"], tostring(NameEnemy)) then
					if L_1_[45]["ffc"](L_1_[40], Enemy) then
						for L_275_forvar0, L_276_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_277_ = {}
							L_277_[1], L_277_[2] = L_275_forvar0, L_276_forvar1
							if L_277_[2]["Name"] == Enemy and (L_277_[2]:FindFirstChild("Humanoid") and (L_277_[2]["Humanoid"]["Health"] > 0 and L_277_[2]:FindFirstChild("HumanoidRootPart"))) then
								repeat
									L_1_[45]["wt"]()
									SROP = false
									L_1_[31](L_277_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[45]["BN"](L_277_[2]["Name"])
									L_1_[14]()
								until L_277_[2]["Humanoid"]["Health"] <= 0 or not L_1_[40]:FindFirstChild(Enemy) or not(L_1_[35]["PlayerGui"]["Main"]:FindFirstChild("Quest"))["Visible"] or Quest ~= nil
							end
						end
					else
						L_1_[31](EnemyPos, 1.5)
					end
				else
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("AbandonQuest")
				end
			else
				repeat
					L_1_[45]["wt"]()
					L_1_[31](QuestPos, 1.5)
					if (QuestPos["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 5 and (L_1_[35]["Character"]:WaitForChild("Humanoid"))["Health"] > 0 then
						L_1_[45]["wt"](.5);
						((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("StartQuest", QuestName, QuestNumber)
					end
				until (L_1_[35]["PlayerGui"]["Main"]:FindFirstChild("Quest"))["Visible"] or not(getgenv())["AutoFarm"] or Quest ~= nil
			end
		end
	elseif L_1_[24]["Value"] >= 2650 and Three_World then
		SROP = false
		if L_1_[45]["ffc"](L_1_[7], "Cake Prince") then
			for L_278_forvar0, L_279_forvar1 in pairs(L_1_[7]:GetChildren()) do
				local L_280_ = {}
				L_280_[1], L_280_[2] = L_278_forvar0, L_279_forvar1
				if L_280_[2]["Name"] == "Cake Prince" and (L_280_[2]:FindFirstChild("Humanoid") and (L_280_[2]:FindFirstChild("Humanoid"))["Health"] > 0) then
					L_1_[31](L_280_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 42, 10), 1.5)
				end
			end
		elseif L_1_[45]["ffc"](L_1_[40], "Cake Prince") then
			for L_281_forvar0, L_282_forvar1 in pairs(L_1_[40]:GetChildren()) do
				local L_283_ = {}
				L_283_[1], L_283_[2] = L_281_forvar0, L_282_forvar1
				if L_283_[2]["Name"] == "Cake Prince" and (L_283_[2]:FindFirstChild("Humanoid") and (L_283_[2]:FindFirstChild("Humanoid"))["Health"] > 0) then
					L_1_[31](L_283_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 42, 10), 1.5)
				end
			end
		else
			if tostring(string["match"](tostring(L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CakePrinceSpawner")), "%d+")) == "nil" or tostring(string["match"](tostring(L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CakePrinceSpawner")), "%d+")) == nil then
				L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CakePrinceSpawner", true)
			end
			if L_1_[45]["ffc"](L_1_[40], "Cookie Crafter") or L_1_[45]["ffc"](L_1_[40], "Cake Guard") or L_1_[45]["ffc"](L_1_[40], "Baking Staff") or L_1_[45]["ffc"](L_1_[40], "Head Baker") then
				for L_284_forvar0, L_285_forvar1 in pairs(L_1_[40]:GetChildren()) do
					local L_286_ = {}
					L_286_[1], L_286_[2] = L_284_forvar0, L_285_forvar1
					if L_286_[2]["Name"] == "Cookie Crafter" or L_286_[2]["Name"] == "Cake Guard" or L_286_[2]["Name"] == "Baking Staff" or L_286_[2]["Name"] == "Head Baker" then
						repeat
							L_1_[45]["wt"]()
							L_1_[31](L_286_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
							if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
								L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
							end
							L_1_[45]["BN"](L_286_[2]["Name"])
							L_1_[14]()
						until L_286_[2]["Humanoid"]["Health"] <= 0 or not L_1_[40]:FindFirstChild(Enemy) or not(L_1_[35]["PlayerGui"]["Main"]:FindFirstChild("Quest"))["Visible"] or Quest ~= nil
					end
				end
			else
				L_1_[31](CFrame["new"](-2091.9118652344, 70.008842468262, -12142.8359375), 1.5)
			end
		end
	end
end
L_1_[38] = function()
	if not noFruit then
		for L_287_forvar0, L_288_forvar1 in pairs(L_1_[35]["Backpack"]:GetChildren()) do
			local L_289_ = {}
			L_289_[3], L_289_[2] = L_287_forvar0, L_288_forvar1
			if L_289_[2]:GetAttribute("OriginalName") ~= nil and (L_1_[45]["sf"](L_289_[2]["Name"], "Fruit") and (L_289_[2]:IsA("Tool") and not L_1_[45]["IsInList"](L_1_[45]["GetType"](), L_289_[2]:GetAttribute("OriginalName")))) then
				local L_290_ = {}
				L_290_[1] = {
					"StoreFruit";
					L_289_[2]:GetAttribute("OriginalName"),
					L_289_[2]
				};
				((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer(unpack(L_290_[1]))
				L_1_[7]["Remotes"]["CommF_"]:InvokeServer("GetFruits", false)
			end
		end
		for L_291_forvar0, L_292_forvar1 in pairs(L_1_[35]["Character"]:GetChildren()) do
			local L_293_ = {}
			L_293_[3], L_293_[1] = L_291_forvar0, L_292_forvar1
			if L_293_[1]:GetAttribute("OriginalName") ~= nil and (L_1_[45]["sf"](L_293_[1]["Name"], "Fruit") and (L_293_[1]:IsA("Tool") and not L_1_[45]["IsInList"](L_1_[45]["GetType"](), L_293_[1]:GetAttribute("OriginalName")))) then
				local L_294_ = {}
				L_294_[2] = {
					"StoreFruit";
					L_293_[1]:GetAttribute("OriginalName"),
					L_293_[1]
				};
				((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer(unpack(L_294_[2]))
				L_1_[7]["Remotes"]["CommF_"]:InvokeServer("GetFruits", false)
			end
		end
	end
end
_G["Ew"] = true
Ewx = true
task["spawn"](function()
	while L_1_[45]["wt"]() do
		if _G["Ew"] then
			L_1_[14]()
		else
			L_1_[38]()
			if Ewx then
				L_1_[21] = 0
			else
				L_1_[21] = .2
			end
		end
	end
end)
task["spawn"](function()
	while L_1_[45]["wt"](1) do
		xpcall(function()
			if not Black_Leg_C then
				repeat
					L_1_[45]["wt"](L_1_[21])
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyBlackLeg")
					L_1_[14]()
					L_1_[45]["wt"](.05)
					if L_1_[45]["ffc"](L_1_[35]["Character"], "Black Leg") or L_1_[45]["ffc"](L_1_[35]["Backpack"], "Black Leg") and not Black_Leg_C then
						Black_Leg_C = true
						L_1_[45]["Equip"]("Black Leg")
					end
				until Black_Leg_C
			end
			if not Electro_C then
				repeat
					L_1_[45]["wt"](L_1_[21])
					L_1_[14]()
					L_1_[2]:SendKeyEvent(true, "V", false, game)
					wait(.5)
					L_1_[2]:SendKeyEvent(false, "V", false, game)
					if L_1_[45]["ffc"](L_1_[35]["Character"], "Black Leg") and (L_1_[35]["Character"]["Black Leg"]["Level"]["Value"] >= 300 and not Electro_C) then
						if L_1_[35]["Character"]["Black Leg"]["Level"]["Value"] >= 400 then
							Black_Leg_C_M = true
						end
						Electro_C = true
						L_1_[45]["wt"](.05)
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectro")
					end
				until Electro_C
			end
			if not Fishman_Karate_C then
				repeat
					L_1_[45]["wt"](L_1_[21])
					L_1_[14]()
					if L_1_[45]["ffc"](L_1_[35]["Character"], "Electro") and (L_1_[35]["Character"]["Electro"]["Level"]["Value"] >= 300 and not Fishman_Karate_C) then
						if L_1_[35]["Character"]["Electro"]["Level"]["Value"] >= 400 then
							Electro_C_M = true
						end
						Fishman_Karate_C = true
						L_1_[45]["wt"](.05)
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyFishmanKarate")
					end
				until Fishman_Karate_C
			end
			if not Fishman_Karate_C_M then
				repeat
					local L_295_ = {}
					task["wait"](L_1_[21])
					L_1_[14]()
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyFishmanKarate")
					L_295_[2] = L_1_[35]["Character"]:FindFirstChild("Fishman Karate")
					if L_295_[2] and (L_295_[2]:FindFirstChild("Level") and L_295_[2]["Level"]["Value"] >= 400) then
						Fishman_Karate_C_M = true
					end
				until Fishman_Karate_C_M
			end
			L_1_[45]["wt"](L_1_[21])
			if not Dragon_Claw_C then
				local L_296_ = {}
				L_296_[2] = L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BlackbeardReward", "DragonClaw", "2")
				if L_296_[2] == 1 or L_296_[2] == 2 then
					pcall(function()
						if L_1_[35]["Character"]["Fishman Karate"]["Level"]["Value"] >= 400 then
							Fishman_Karate_C_M = true
						end
					end)
					Dragon_Claw_C = true
				end
			end
			repeat
				task["wait"](L_1_[21])
				L_1_[14]()
				if not Super_human then
					if Dragon_Claw_C then
						if L_1_[45]["ffc"](L_1_[35]["Character"], "Dragon Claw") and L_1_[35]["Character"]["Dragon Claw"]["Level"]["Value"] >= 300 then
							local L_297_ = {}
							if L_1_[35]["Character"]["Dragon Claw"]["Level"]["Value"] >= 400 then
								Dragon_Claw_C_M = true
							end
							L_297_[2] = {
								[1] = "BuySuperhuman"
							}
							if L_1_[7]["Remotes"]["CommF_"]:InvokeServer(unpack(L_297_[2])) == 1 or L_1_[7]["Remotes"]["CommF_"]:InvokeServer(unpack(L_297_[2])) == 2 then
								Super_human = true
								if L_1_[35]["Character"]["Superhuman"]["Level"]["Value"] >= 400 then
									Super_humanw_C_M = true
								end
							end
						end
					end
				end
			until Super_human
			if not Death_Step then
				if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDeathStep") == 1 or L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDeathStep") == 2 then
					Death_Step = true
				end
			end
			if Black_Leg_C_M then
				repeat
					local L_298_ = {}
					task["wait"](L_1_[21])
					L_1_[14]()
					L_298_[1] = L_1_[35]["Character"]:FindFirstChild("Death Step")
					if L_298_[1] and (L_298_[1]:FindFirstChild("Level") and L_298_[1]["Level"]["Value"] >= 400) then
						local L_299_ = {}
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyBlackLeg")
						L_299_[1] = L_1_[35]["Character"]:FindFirstChild("Black Leg")
						if L_299_[1] and (L_299_[1]:FindFirstChild("Level") and L_299_[1]["Level"]["Value"] >= 400) then
							Black_Leg_C_M = true
						end
					end
				until Black_Leg_C_M
			end
			if not Death_Step_C_M then
				repeat
					local L_300_ = {}
					task["wait"](L_1_[21])
					L_1_[14]()
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDeathStep")
					L_300_[1] = L_1_[35]["Character"]:FindFirstChild("Death Step")
					if L_300_[1] and (L_300_[1]:FindFirstChild("Level") and L_300_[1]["Level"]["Value"] >= 400) then
						Death_Step_C_M = true
					end
				until Death_Step_C_M
			end
			if not Electro_C_M then
				repeat
					local L_301_ = {}
					task["wait"](L_1_[21])
					L_1_[14]()
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectro")
					L_301_[1] = L_1_[35]["Character"]:FindFirstChild("Electro")
					if L_301_[1] and (L_301_[1]:FindFirstChild("Level") and L_301_[1]["Level"]["Value"] >= 400) then
						Electro_C_M = true
					end
				until Electro_C_M
			end
			if not Fishman_Karate_C_M then
				repeat
					local L_302_ = {}
					task["wait"](L_1_[21])
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyFishmanKarate")
					warn()
					L_302_[1] = L_1_[35]["Character"]:FindFirstChild("Fishman Karate")
					if L_302_[1] and (L_302_[1]:FindFirstChild("Level") and L_302_[1]["Level"]["Value"] >= 400) then
						Fishman_Karate_C_M = true
					end
				until Fishman_Karate_C_M
			end
			if not Dragon_Claw_C_M then
				repeat
					local L_303_ = {}
					task["wait"](L_1_[21])
					L_1_[14]()
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BlackbeardReward", "DragonClaw", "2")
					L_303_[1] = L_1_[35]["Character"]:FindFirstChild("Dragon Claw")
					if L_303_[1] and (L_303_[1]:FindFirstChild("Level") and L_303_[1]["Level"]["Value"] >= 400) then
						Dragon_Claw_C_M = true
					end
				until Dragon_Claw_C_M
			end
			if not Sharkman_Karate_C then
				repeat
					L_1_[45]["wt"](L_1_[21])
					L_1_[14]()
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuySharkmanKarate")
					if L_1_[45]["ffc"](L_1_[35]["Backpack"], "Sharkman Karate") or L_1_[45]["ffc"](L_1_[35]["Character"], "Sharkman Karate") then
						Sharkman_Karate_C = true
					end
				until Sharkman_Karate_C
			end
			if not Sharkman_Karate_C_M then
				repeat
					local L_304_ = {}
					task["wait"](L_1_[21])
					L_1_[14]()
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuySharkmanKarate")
					L_304_[1] = L_1_[35]["Character"]:FindFirstChild("Sharkman Karate")
					if L_304_[1] and (L_304_[1]:FindFirstChild("Level") and L_304_[1]["Level"]["Value"] >= 400) then
						Sharkman_Karate_C_M = true
					end
				until Sharkman_Karate_C_M
			end
			if not Electric_Claw_C then
				repeat
					task["wait"](L_1_[21])
					if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw") == 1 or L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw") == 2 then
						Electric_Claw_C = true
					end
				until Electric_Claw_C
			end
			if not Electric_Claw_C_M then
				repeat
					local L_305_ = {}
					task["wait"](L_1_[21])
					L_1_[14]()
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw")
					L_305_[2] = L_1_[35]["Character"]:FindFirstChild("Electric Claw")
					if L_305_[2] and (L_305_[2]:FindFirstChild("Level") and L_305_[2]["Level"]["Value"] >= 400) then
						Electric_Claw_C_M = true
					end
				until Electric_Claw_C_M
			end
			if not Dragon_Talon_C then
				repeat
					task["wait"](L_1_[21])
					if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDragonTalon") == 1 or L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDragonTalon") == 2 then
						Dragon_Talon_C = true
					end
				until Dragon_Talon_C
			end
			if not Dragon_Talon_C_M then
				repeat
					local L_306_ = {}
					task["wait"](L_1_[21])
					L_1_[14]()
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDragonTalon")
					L_306_[1] = L_1_[35]["Character"]:FindFirstChild("Dragon Talon")
					if L_306_[1] and (L_306_[1]:FindFirstChild("Level") and L_306_[1]["Level"]["Value"] >= 400) then
						Dragon_Talon_C_M = true
					end
				until Dragon_Talon_C_M
			end
			if not God_Human_C then
				repeat
					task["wait"](L_1_[21])
					if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyGodhuman") == 1 or L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyGodhuman") == 2 then
						God_Human_C = true
					end
				until God_Human_C
			end
			if not God_Human_C_M then
				repeat
					local L_307_ = {}
					task["wait"](L_1_[21])
					L_1_[14]()
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyGodhuman")
					L_307_[2] = L_1_[35]["Character"]:FindFirstChild("Godhuman")
					if L_307_[2] and (L_307_[2]:FindFirstChild("Level") and L_307_[2]["Level"]["Value"] >= 400) then
						God_Human_C_M = true
					end
				until God_Human_C_M
			end
		end, warn)
	end
end);
(getgenv())["AutoFarm"] = true
if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuySharkmanKarate", true) ~= L_1_[3]({
	"I lost my house keys",
	", could you help me ";
	"find them? Thanks."
}) then
	CheckFindWaterKey = true
end
if L_1_[24]["Value"] >= 2000 and (getgenv())["Configs"]["Quest"]["RGB Haki"] then
	if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("HornedMan", "Bet") == 1 then
		RGB_Haki_H = true
	end
end
L_1_[50] = function()
	if not L_1_[45]["gi"]("Cursed Dual Katana") then
		if L_1_[45]["gi"]("Tushita") and L_1_[45]["gi"]("Yama") then
			local L_308_ = {}
			L_308_[1] = (game:GetService("ReplicatedStorage"))["Remotes"]["CommF_"]:InvokeServer("getInventory")
			for L_309_forvar0, L_310_forvar1 in pairs(L_308_[1]) do
				local L_311_ = {}
				L_311_[3], L_311_[2] = L_309_forvar0, L_310_forvar1
				if L_311_[2]["Type"] == "Sword" then
					if L_311_[2]["Name"] == "Tushita" and L_311_[2]["Mastery"] >= 400 then
						Tushita_M = true
					elseif L_311_[2]["Name"] == "Yama" and L_311_[2]["Mastery"] >= 400 then
						Yama_M = true
					end
				end
			end
			return Tushita_M and Yama_M
		end
	end
	return false
end
task["spawn"](function()
	while L_1_[45]["wt"]() do
		xpcall(function()
			if (getgenv())["AutoFarm"] then
				local L_312_ = {}
				Stop_Fast_Attack = false
				if L_1_[24]["Value"] >= 1500 or RainbowSaviour then
					if (((L_1_[7]:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/FruitCustomizerRF")):InvokeServer({
						["StorageName"] = "Rainbow Saviour",
						["Type"] = "AuraSkin";
						["Context"] = "Equip"
					}) ~= false then
						(((L_1_[7]:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/FruitCustomizerRF")):InvokeServer({
							["StorageName"] = "Rainbow Saviour";
							["Type"] = "AuraSkin";
							["Context"] = "Equip"
						})
					end
				end
				L_312_[1] = false
				if ((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("Cousin", "Buy") == 1 then
					L_1_[45]["wt"](1)
					L_1_[38]()
				else
					for L_313_forvar0, L_314_forvar1 in pairs(L_1_[19]:GetChildren()) do
						local L_315_ = {}
						L_315_[1], L_315_[3] = L_313_forvar0, L_314_forvar1
						if L_315_[3]:GetAttribute("OriginalName") ~= nil and (L_1_[45]["sf"](L_315_[3]["Name"], "Fruit") and (L_315_[3]:IsA("Tool") and not L_1_[45]["IsInList"](L_1_[45]["GetType"](), L_315_[3]:GetAttribute("OriginalName")))) then
							repeat
								L_1_[45]["wt"](.1)
								L_1_[45]["Status"](" Status : TP To " .. L_315_[3]["Name"])
								TPZ(L_315_[3]["Handle"]["CFrame"])
								L_312_[1] = true
								L_1_[38]()
							until not L_315_[3] or game["Players"]["LocalPlayer"]["Backpack"]:FindFirstChild(L_315_[3]["Name"]) or L_1_[45]["IsInList"](L_1_[45]["GetType"](), L_315_[3]:GetAttribute("OriginalName")) or (L_315_[3]["Handle"]["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 10 or not(getgenv())["AutoFarm"]
						end
					end
					if not L_312_[1] then
						local L_316_ = {}
						if L_1_[45]["tf"](Configs["Gun"], "Magma Blaster") and (L_1_[24]["Value"] >= 200 and (not L_1_[45]["gi"]("Magma Blaster") and (Old_World and L_1_[45]["CheckBoss"]("Magma Admiral")))) then
							Quest = "Magma Blaster"
							return
						end
						if L_1_[45]["tf"](Configs["Gun"], "Bazooka") and (L_1_[24]["Value"] >= 200 and (not L_1_[45]["gi"]("Bazooka") and (Old_World and L_1_[45]["CheckBoss"]("Wysper")))) then
							Quest = "Bazooka"
							return
						end
						if L_1_[45]["tf"](Configs["Sword"], "Saber") and (L_1_[24]["Value"] >= 200 and not L_1_[45]["gi"]("Saber")) then
							Quest = "Saber"
							return
						end
						if L_1_[45]["tf"](Configs["Sword"], "Shark Saw") and (L_1_[24]["Value"] >= 100 and (not L_1_[45]["gi"]("Shark Saw") and (Old_World and L_1_[45]["CheckBoss"]("The Saw")))) then
							Quest = "Shark Saw"
							return
						end
						if L_1_[45]["tf"](Configs["Sword"], "Wardens Sword") and (L_1_[24]["Value"] >= 100 and (not L_1_[45]["gi"]("Wardens Sword") and (Old_World and L_1_[45]["CheckBoss"]("Chief Warden")))) then
							Quest = "Wardens Sword"
							return
						end
						if L_1_[45]["tf"](Configs["Sword"], "Pole (1st Form)") and (L_1_[24]["Value"] >= 100 and (not L_1_[45]["gi"]("Pole (1st Form)") and (Old_World and L_1_[45]["CheckBoss"]("Thunder God")))) then
							Quest = "Pole (1st Form)"
							return
						end
						if ((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("Alchemist", "1") ~= -2 and (L_1_[1]["Value"] >= 2500000 and (L_1_[24]["Value"] >= 850 and (L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BartiloQuestProgress", "Bartilo") == 3 and not L_1_[45]["ffc"](L_1_[35]["Data"]["Race"], "Evolved")))) then
							Quest = "Evo Race V1"
							return
						end
						if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Wenlocktoad", "3") ~= -2 and (L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TalkTrevor", "1") == 0 and (L_1_[45]["IsHeavenly"]() and (L_1_[22]["Value"] >= 1400 and L_1_[1]["Value"] >= 2000000))) then
							Quest = "Evo Race V2"
							return
						end
						if L_1_[45]["tf"](Configs["Sword"], "Gravity Blade") and (not L_1_[45]["gi"]("Gravity Blade") and (New_World and (L_1_[45]["CheckBoss"]("Orbitus") and L_1_[24]["Value"] >= 800))) then
							Quest = "Gravity Blade"
							return
						end
						if L_1_[45]["tf"](Configs["Sword"], "Longsword") and (not L_1_[45]["gi"]("Longsword") and (New_World and (L_1_[45]["CheckBoss"]("Diamond") and L_1_[24]["Value"] >= 800))) then
							Quest = "Longsword"
							return
						end
						if L_1_[45]["tf"](Configs["Sword"], "Rengoku") and (not L_1_[45]["gi"]("Rengoku") and (New_World and (L_1_[45]["CheckBoss"]("Awakened Ice Admiral") and L_1_[24]["Value"] >= 800))) then
							Quest = "Rengoku"
							return
						end
						if L_1_[45]["IsHall"]() and (New_World and (L_1_[45]["CheckBoss"]("Awakened Ice Admiral") and L_1_[24]["Value"] >= 800)) then
							Quest = "Rengoku"
							return
						end
						if not L_1_[45]["gi"]("Rengoku") and (L_1_[45]["CheckBackpack"]("Hidden Key") and New_World) then
							repeat
								L_1_[45]["wt"](.3)
								L_1_[45]["Status"](L_1_[3]({
									" Status : Use Hidden";
									" Key"
								}))
								L_1_[45]["Equip"]("Hidden Key")
								L_1_[31](CFrame["new"](6572.29248, 295.712677, -6966.09961, .803500533, -3.27515153e-08, .595304072, 3.97485422e-08, 1, 1.36659384e-09, -0.595304072, 2.25644108e-08, .803500533), 1.5)
							until (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - Vector3["new"](6572.29248, 295.712677, -6966.09961))["Magnitude"] <= 5 or not(getgenv())["AutoFarm"]
							L_1_[45]["wt"](1)
							return
						end
						if New_World and (L_1_[45]["IsHall"]() and L_1_[45]["CheckBackpack"]("Library Key")) then
							repeat
								L_1_[45]["wt"](.1)
								L_1_[45]["Status"](L_1_[3]({
									" Status : Use Librar",
									"y Key"
								}))
								L_1_[45]["Equip"]("Library Key")
								L_1_[31](CFrame["new"](6377.12549, 296.634735, -6843.76025, -0.860993743, 1.17677516e-07, -0.508615494, 1.31121894e-07, 1, 9.40274347e-09, .508615494, -5.8594928e-08, -0.860993743), 1.5)
							until (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - Vector3["new"](6377.12549, 296.634735, -6843.76025))["Magnitude"] <= 1 or not L_1_[45]["IsHall"]() or not(getgenv())["AutoFarm"]
							L_1_[45]["wt"](1)
							return
						end
						if L_1_[45]["tf"](Configs["Sword"], "Flail") and (not L_1_[45]["gi"]("Flail") and (New_World and L_1_[45]["CheckBoss"]("Smoke Admiral"))) then
							Quest = "Flail"
							return
						end
						if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BartiloQuestProgress", "Bartilo") ~= 3 and L_1_[24]["Value"] >= 850 then
							Quest = "BartiloQuest"
							return
						end
						if not CheckFindWaterKey then
							if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuySharkmanKarate", true) == L_1_[3]({
								"I lost my house keys";
								", could you help me ",
								"find them? Thanks."
							}) and L_1_[24]["Value"] >= 850 then
								Quest = "Find Water Key"
								return
							end
						end
						if New_World and (not L_1_[45]["IsHeavenly"]() and L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TalkTrevor", "1") == 0) then
							Quest = "Don Swan"
							return
						end
						if Three_World and (L_1_[45]["tf"](Configs["Sword"], "Yama") and (L_1_[7]["Remotes"]["CommF_"]:InvokeServer("EliteHunter", "Progress") >= 30 and not L_1_[45]["gi"]("Yama"))) then
							Quest = "Yama"
							return
						end
						if Three_World and (L_1_[45]["tf"](Configs["Sword"], "Tushita") and (not L_1_[45]["gi"]("Tushita") and Unlock_Tushita_Quest)) then
							Quest = "Longma"
							return
						end
						if L_1_[45]["tf"](Configs["Gun"], "Soul Guitar") and (not L_1_[45]["gi"]("Soul Guitar") and (L_1_[24]["Value"] >= 2000 and L_1_[45]["CheckItem"]("Dark Fragment") >= 1)) then
							Quest = "Soul Guitar"
							return
						end
						if L_1_[24]["Value"] >= 2000 and ((getgenv())["Configs"]["Quest"]["RGB Haki"] and not RGB_Haki_H) then
							if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("HornedMan", "Bet") == nil then
								Quest = "RGB"
								return
							end
						end
						if L_1_[45]["tf"](Configs["Gun"], "Venom Bow") and (not L_1_[45]["gi"]("Venom Bow") and (Three_World and L_1_[45]["CheckBoss"]("Hydra Leader"))) then
							Quest = "Venom Bow"
							return
						end
						if L_1_[45]["tf"](Configs["Sword"], "Twin Hooks") and (not L_1_[45]["gi"]("Twin Hooks") and (Three_World and L_1_[45]["CheckBoss"]("Captain Elephant"))) then
							Quest = "Twin Hooks"
							return
						end
						if (game:GetService("Workspace"))["Map"]:FindFirstChild("MysticIsland") and (not L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CheckTempleDoor") and (L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Wenlocktoad", "3") == -2 and Mirror_Fractal_H)) then
							Quest = "Pull Lerver"
							return
						end
						if L_1_[50]() then
							Quest = "Cursed Dual Katana"
							return
						end
						if not Dragon_Talon_C then
							if L_1_[45]["ffc"](L_1_[35]["Backpack"], "Fire Essence") or L_1_[45]["ffc"](L_1_[35]["Character"], "Fire Essence") then
								repeat
									L_1_[45]["Status"](L_1_[3]({
										" Status : Use Fire E",
										"ssence"
									}))
									L_1_[45]["Equip"]("Fire Essence")
									L_1_[45]["wt"](.5)
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDragonTalon", true)
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDragonTalon")
								until not L_1_[45]["ffc"](L_1_[35]["Backpack"], "Fire Essence") and not L_1_[45]["ffc"](L_1_[35]["Character"], "Fire Essence")
								L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDragonTalon")
								Dragon_Talon_C = true
								return
							end
						end
						if Fishman_Karate_C_M and (not Dragon_Claw_C and L_1_[24]["Value"] >= 1100) then
							if not Dragon_Claw_C then
								repeat
									L_1_[45]["wt"]()
									L_1_[14]()
									if L_1_[45]["ffc"](L_1_[35]["Backpack"], "Dragon Claw") or L_1_[45]["ffc"](L_1_[35]["Character"], "Dragon Claw") then
										Dragon_Claw_C = true
										return
									end
									if not Dragon_Claw_C and L_1_[24]["Value"] >= 1100 then
										if L_1_[17]["Value"] >= 1500 then
											local L_317_ = {}
											L_317_[1] = {
												[1] = "BlackbeardReward",
												[2] = "DragonClaw",
												[3] = "2"
											}
											L_1_[7]["Remotes"]["CommF_"]:InvokeServer(unpack(L_317_[1]))
											Dragon_Claw_C = true
											return
										elseif L_1_[17]["Value"] < 1500 then
											if L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] and (L_1_[17]["Value"] < 1500 and not Dragon_Claw_C) then
												L_1_[45]["Status"](" Status : Farm Raid")
												if #L_1_[45]["GetMobRaid"]() == 0 then
													if Select_Map == "Magma" or Select_Map == "Flame" then
														for L_318_forvar0, L_319_forvar1 in pairs(L_1_[19]:GetDescendants()) do
															local L_320_ = {}
															L_320_[3], L_320_[2] = L_318_forvar0, L_319_forvar1
															if L_320_[2]["Name"] == "Lava" then
																L_320_[2]:Destroy()
															end
														end
													end
													if L_1_[45]["GetRaid"]("Island 5", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 5", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 4", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 4", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 3", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 3", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 2", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 2", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 1", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 1", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													end
												else
													for L_321_forvar0, L_322_forvar1 in pairs(L_1_[40]:GetChildren()) do
														local L_323_ = {}
														L_323_[2], L_323_[1] = L_321_forvar0, L_322_forvar1
														if L_323_[1]:FindFirstChild("HumanoidRootPart") and (L_323_[1]:FindFirstChild("Humanoid") and ((L_323_[1]:FindFirstChild("Humanoid"))["Health"] > 0 and (L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"]["Position"] - L_323_[1]["HumanoidRootPart"]["CFrame"]["Position"])["Magnitude"] <= 5000)) then
															repeat
																local L_324_ = {}
																L_1_[45]["wt"](.1)
																if Select_Map == "Magma" or Select_Map == "Flame" then
																	for L_325_forvar0, L_326_forvar1 in pairs(L_1_[19]:GetDescendants()) do
																		local L_327_ = {}
																		L_327_[1], L_327_[2] = L_325_forvar0, L_326_forvar1
																		if L_327_[2]["Name"] == "Lava" then
																			L_327_[2]:Destroy()
																		end
																	end
																end
																L_324_[2] = math["random"](1, 5)
																if L_324_[2] == 1 then
																	L_324_[3] = CFrame["new"](0, 30, 1)
																elseif L_324_[2] == 2 then
																	L_324_[3] = CFrame["new"](0, 30, 15)
																elseif L_324_[2] == 3 then
																	L_324_[3] = CFrame["new"](1, 30, -15)
																elseif L_324_[2] == 4 then
																	L_324_[3] = CFrame["new"](15, 30, 0)
																elseif L_324_[2] == 5 then
																	L_324_[3] = CFrame["new"](-15, 30, 0)
																end
																L_1_[31](L_323_[1]["HumanoidRootPart"]["CFrame"] * L_324_[3], 1.5)
																if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
																	L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
																end
																L_1_[14]()
															until not L_323_[1]["Parent"] or L_323_[1]["Humanoid"]["Health"] <= 0 or #L_1_[45]["GetMobRaid"]() == 0
														end
													end
												end
											else
												if L_1_[35]["Data"]["DevilFruit"]["Value"] == "Dark-Dark" then
													Select_Map = "Dark"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Sand-Sand" then
													Select_Map = "Sand"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Magma-Magma" then
													Select_Map = "Magma"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Rumble-Rumble" then
													Select_Map = "Rumble"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Flame-Flame" then
													Select_Map = "Flame"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Ice-Ice" then
													Select_Map = "Ice"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Light-Light" then
													Select_Map = "Light"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "String-String" then
													Select_Map = "String"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Quake-Quake" then
													Select_Map = "Quake"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Buddha-Buddha" then
													Select_Map = "Buddha"
												else
													Select_Map = "Ice"
												end
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("RaidsNpc", "Select", Select_Map)
												L_1_[45]["wt"](.2)
												if L_1_[35]["Backpack"]:FindFirstChild("Special Microchip") or L_1_[35]["Character"]:FindFirstChild("Special Microchip") and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
													if L_1_[30] == 4442272183 and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
														local L_328_ = {}
														fireclickdetector(L_1_[19]["Map"]["CircleIsland"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
														L_328_[2] = 0
														repeat
															L_328_[2] = L_328_[2] + 1
															L_1_[45]["wt"](1)
														until L_328_[2] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"] == true
													elseif L_1_[30] == 7449423635 then
														L_1_[31](CFrame["new"](-5034, 315, -2951), 1.5)
														if ((CFrame["new"](-5034, 315, -2951))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3 then
															if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																local L_329_ = {}
																fireclickdetector(L_1_[19]["Map"]["Boat Castle"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																L_329_[1] = 0
																repeat
																	L_329_[1] = L_329_[1] + 1
																	L_1_[45]["wt"](1)
																until L_329_[1] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"] == true
															end
														end
													end
												else
													if not L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] then
														if L_1_[1]["Value"] >= 0 and L_1_[35]["Data"]["Fragments"]["Value"] >= 1500 then
															local L_330_ = {}
															L_330_[2] = {
																[1] = "BlackbeardReward",
																[2] = "DragonClaw",
																[3] = "2"
															};
															(game:GetService("ReplicatedStorage"))["Remotes"]["CommF_"]:InvokeServer(unpack(L_330_[2]))
															Dragon_Claw_C = true
															return
														end
														table["sort"](L_1_[45]["GetFruits"](), function(L_331_arg0, L_332_arg1)
															local L_333_ = {}
															L_333_[2], L_333_[1] = L_331_arg0, L_332_arg1
															if L_333_[2]["Value"] < 100000 and L_333_[2]["Value"] < 100000 then
																return L_333_[2]["Value"] < L_333_[1]["Value"]
															end
														end)
														L_1_[45]["wt"](1)
														if #L_1_[45]["GetFruits"]() > 0 and not Dragon_Claw_C then
															L_1_[45]["wt"](2)
															if not L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] then
																if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 and L_1_[35]["Data"]["Fragments"]["Value"] < 5000 then
																	L_1_[7]["Remotes"]["CommF_"]:InvokeServer("LoadFruit", (L_1_[45]["GetFruits"]())[1]["Name"])
																elseif L_1_[17]["Value"] < 5000 then
																	break
																end
																if L_1_[35]["Data"]["DevilFruit"]["Value"] == "Dark-Dark" then
																	Select_Map = "Dark"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Sand-Sand" then
																	Select_Map = "Sand"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Magma-Magma" then
																	Select_Map = "Magma"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Rumble-Rumble" then
																	Select_Map = "Rumble"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Flame-Flame" then
																	Select_Map = "Flame"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Ice-Ice" then
																	Select_Map = "Ice"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Light-Light" then
																	Select_Map = "Light"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "String-String" then
																	Select_Map = "String"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Quake-Quake" then
																	Select_Map = "Quake"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Buddha-Buddha" then
																	Select_Map = "Buddha"
																else
																	Select_Map = "Ice"
																end
																L_1_[7]["Remotes"]["CommF_"]:InvokeServer("RaidsNpc", "Select", Select_Map)
																if L_1_[30] == 4442272183 and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																	local L_334_ = {}
																	fireclickdetector(L_1_[19]["Map"]["CircleIsland"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																	L_334_[2] = 0
																	repeat
																		L_334_[2] = L_334_[2] + 1
																		L_1_[45]["wt"](1)
																	until L_334_[2] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
																elseif L_1_[30] == 7449423635 then
																	L_1_[31](CFrame["new"](-5034, 315, -2951), 1.5)
																	if ((CFrame["new"](-5034, 315, -2951))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3 then
																		if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																			local L_335_ = {}
																			fireclickdetector(L_1_[19]["Map"]["Boat Castle"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																			L_335_[1] = 0
																			repeat
																				L_335_[1] = L_335_[1] + 1
																				L_1_[45]["wt"](1)
																			until L_335_[1] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
																		end
																	end
																end
															end
														else
															Quest = nil
															L_1_[45]["Status"](L_1_[3]({
																" Status : Auto Farm ",
																"Level"
															}))
															L_1_[39]()
														end
													end
												end
											end
										end
									end
								until Dragon_Claw_C
							end
							return
						end
						L_316_[1] = function()
							for L_336_forvar0, L_337_forvar1 in pairs(L_1_[7]["Remotes"]["CommF_"]:InvokeServer("getInventory")) do
								local L_338_ = {}
								L_338_[3], L_338_[1] = L_336_forvar0, L_337_forvar1
								if L_338_[1]["Value"] and L_338_[1]["Value"] >= 1000000 then
									return true
								end
							end
							return false
						end
						if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TalkTrevor", "1") ~= 0 and (game["Players"]["LocalPlayer"]["Data"]["Level"]["Value"] >= 900 and L_316_[1]()) then
							repeat
								L_1_[45]["wt"]()
								noFruit = true
								for L_339_forvar0, L_340_forvar1 in pairs(L_1_[7]["Remotes"]["CommF_"]:InvokeServer("getInventory")) do
									local L_341_ = {}
									L_341_[2], L_341_[1] = L_339_forvar0, L_340_forvar1
									if L_341_[1]["Value"] and L_341_[1]["Value"] >= 1000000 then
										((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("LoadFruit", L_341_[1]["Name"])
										L_1_[45]["wt"](1)
										for L_342_forvar0, L_343_forvar1 in pairs((game:GetService("Players"))["LocalPlayer"]["Backpack"]:GetChildren()) do
											local L_344_ = {}
											L_344_[3], L_344_[1] = L_342_forvar0, L_343_forvar1
											if string["find"](L_344_[1]["Name"], "Fruit") then
												L_1_[45]["Equip"](L_344_[1])
											end
										end
										L_1_[45]["wt"](.2)
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TalkTrevor", "1")
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TalkTrevor", "2")
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TalkTrevor", "3")
										return
									end
								end
							until L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TalkTrevor", "1") == 0 or not L_316_[1]()
							noFruit = false
						end
						if L_1_[24]["Value"] >= 1500 and (L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TalkTrevor", "1") ~= 0 and not L_316_[1]()) then
							L_1_[45]["HopLowServer"](10)
							return
						end
						if Super_human and (not Death_Step and L_1_[24]["Value"] >= 1100) then
							if not Death_Step then
								repeat
									L_1_[45]["wt"]()
									L_1_[14]()
									if not Super_humanw_C_M then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuySuperhuman")
										if L_1_[35]["Character"]["Superhuman"]["Level"]["Value"] < 400 then
											repeat
												L_1_[45]["wt"]()
												L_1_[14]()
												Quest = nil
												L_1_[45]["Status"](L_1_[3]({
													" Status : Auto Farm ",
													"Level"
												}))
												L_1_[39]()
											until L_1_[35]["Character"]["Superhuman"]["Level"]["Value"] >= 400
											Super_humanw_C_M = true
										end
									end
									if L_1_[45]["ffc"](L_1_[35]["Backpack"], "Death Step") or L_1_[45]["ffc"](L_1_[35]["Character"], "Death Step") then
										Death_Step = true
										return
									end
									if not Death_Step and L_1_[24]["Value"] >= 1100 then
										if L_1_[17]["Value"] >= 5000 then
											if Black_Leg_C_M then
												if L_1_[1]["Value"] >= 2500000 then
													L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDeathStep")
													Death_Step = true
													return
												else
													L_1_[14]()
													Quest = nil
													L_1_[45]["Status"](L_1_[3]({
														" Status : Auto Farm ",
														"Level"
													}))
													L_1_[39]()
												end
											else
												repeat
													L_1_[45]["wt"]()
													L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyBlackLeg")
													L_1_[14]()
													Quest = nil
													L_1_[45]["Status"](L_1_[3]({
														" Status : Auto Farm ";
														"Level"
													}))
													L_1_[39]()
												until L_1_[35]["Character"]["Black Leg"]["Level"]["Value"] >= 400
												Black_Leg_C_M = true
												if not Super_human then
													L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuySuperhuman")
												end
												return
											end
										elseif L_1_[17]["Value"] < 5000 then
											if L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] and (L_1_[17]["Value"] < 5000 and not Death_Step) then
												L_1_[45]["Status"](" Status : Farm Raid")
												if #L_1_[45]["GetMobRaid"]() == 0 then
													if Select_Map == "Magma" or Select_Map == "Flame" then
														for L_345_forvar0, L_346_forvar1 in pairs(L_1_[19]:GetDescendants()) do
															local L_347_ = {}
															L_347_[2], L_347_[1] = L_345_forvar0, L_346_forvar1
															if L_347_[1]["Name"] == "Lava" then
																L_347_[1]:Destroy()
															end
														end
													end
													if L_1_[45]["GetRaid"]("Island 5", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 5", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 4", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 4", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 3", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 3", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 2", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 2", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 1", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 1", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													end
												else
													for L_348_forvar0, L_349_forvar1 in pairs(L_1_[40]:GetChildren()) do
														local L_350_ = {}
														L_350_[2], L_350_[1] = L_348_forvar0, L_349_forvar1
														if L_350_[1]:FindFirstChild("HumanoidRootPart") and (L_350_[1]:FindFirstChild("Humanoid") and ((L_350_[1]:FindFirstChild("Humanoid"))["Health"] > 0 and (L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"]["Position"] - L_350_[1]["HumanoidRootPart"]["CFrame"]["Position"])["Magnitude"] <= 5000)) then
															repeat
																local L_351_ = {}
																L_1_[45]["wt"](.1)
																if Select_Map == "Magma" or Select_Map == "Flame" then
																	for L_352_forvar0, L_353_forvar1 in pairs(L_1_[19]:GetDescendants()) do
																		local L_354_ = {}
																		L_354_[1], L_354_[3] = L_352_forvar0, L_353_forvar1
																		if L_354_[3]["Name"] == "Lava" then
																			L_354_[3]:Destroy()
																		end
																	end
																end
																L_351_[2] = math["random"](1, 5)
																if L_351_[2] == 1 then
																	L_351_[1] = CFrame["new"](0, 30, 1)
																elseif L_351_[2] == 2 then
																	L_351_[1] = CFrame["new"](0, 30, 15)
																elseif L_351_[2] == 3 then
																	L_351_[1] = CFrame["new"](1, 30, -15)
																elseif L_351_[2] == 4 then
																	L_351_[1] = CFrame["new"](15, 30, 0)
																elseif L_351_[2] == 5 then
																	L_351_[1] = CFrame["new"](-15, 30, 0)
																end
																L_1_[31](L_350_[1]["HumanoidRootPart"]["CFrame"] * L_351_[1], 1.5)
																if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
																	L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
																end
																L_1_[14]()
															until not L_350_[1]["Parent"] or L_350_[1]["Humanoid"]["Health"] <= 0 or #L_1_[45]["GetMobRaid"]() == 0
														end
													end
												end
											else
												if L_1_[35]["Data"]["DevilFruit"]["Value"] == "Dark-Dark" then
													Select_Map = "Dark"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Sand-Sand" then
													Select_Map = "Sand"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Magma-Magma" then
													Select_Map = "Magma"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Rumble-Rumble" then
													Select_Map = "Rumble"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Flame-Flame" then
													Select_Map = "Flame"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Ice-Ice" then
													Select_Map = "Ice"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Light-Light" then
													Select_Map = "Light"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "String-String" then
													Select_Map = "String"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Quake-Quake" then
													Select_Map = "Quake"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Buddha-Buddha" then
													Select_Map = "Buddha"
												else
													Select_Map = "Ice"
												end
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("RaidsNpc", "Select", Select_Map)
												L_1_[45]["wt"](.2)
												if L_1_[35]["Backpack"]:FindFirstChild("Special Microchip") or L_1_[35]["Character"]:FindFirstChild("Special Microchip") and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
													if L_1_[30] == 4442272183 and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
														local L_355_ = {}
														fireclickdetector(L_1_[19]["Map"]["CircleIsland"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
														L_355_[1] = 0
														repeat
															L_355_[1] = L_355_[1] + 1
															L_1_[45]["wt"](1)
														until L_355_[1] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"] == true
													elseif L_1_[30] == 7449423635 then
														L_1_[31](CFrame["new"](-5034, 315, -2951), 1.5)
														if ((CFrame["new"](-5034, 315, -2951))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3 then
															if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																local L_356_ = {}
																fireclickdetector(L_1_[19]["Map"]["Boat Castle"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																L_356_[1] = 0
																repeat
																	L_356_[1] = L_356_[1] + 1
																	L_1_[45]["wt"](1)
																until L_356_[1] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
															end
														end
													end
												else
													if not L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] then
														if L_1_[35]["Data"]["Fragments"]["Value"] >= 5000 then
															if L_1_[35]["Data"]["Beli"]["Value"] >= 2500000 then
																L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDeathStep")
																Death_Step = true
																return
															end
															return
														end
														table["sort"](L_1_[45]["GetFruits"](), function(L_357_arg0, L_358_arg1)
															local L_359_ = {}
															L_359_[3], L_359_[1] = L_357_arg0, L_358_arg1
															if L_359_[3]["Value"] < 100000 and L_359_[3]["Value"] < 100000 then
																return L_359_[3]["Value"] < L_359_[1]["Value"]
															end
														end)
														L_1_[45]["wt"](1)
														if #L_1_[45]["GetFruits"]() > 0 and not Death_Step then
															warn()
															L_1_[45]["wt"](2)
															if not L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] then
																if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 and L_1_[35]["Data"]["Fragments"]["Value"] < 5000 then
																	L_1_[7]["Remotes"]["CommF_"]:InvokeServer("LoadFruit", (L_1_[45]["GetFruits"]())[1]["Name"])
																elseif L_1_[17]["Value"] < 5000 then
																	break
																end
																if L_1_[35]["Data"]["DevilFruit"]["Value"] == "Dark-Dark" then
																	Select_Map = "Dark"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Sand-Sand" then
																	Select_Map = "Sand"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Magma-Magma" then
																	Select_Map = "Magma"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Rumble-Rumble" then
																	Select_Map = "Rumble"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Flame-Flame" then
																	Select_Map = "Flame"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Ice-Ice" then
																	Select_Map = "Ice"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Light-Light" then
																	Select_Map = "Light"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "String-String" then
																	Select_Map = "String"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Quake-Quake" then
																	Select_Map = "Quake"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Buddha-Buddha" then
																	Select_Map = "Buddha"
																else
																	Select_Map = "Ice"
																end
																L_1_[7]["Remotes"]["CommF_"]:InvokeServer("RaidsNpc", "Select", Select_Map)
																if L_1_[30] == 4442272183 and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																	local L_360_ = {}
																	fireclickdetector(L_1_[19]["Map"]["CircleIsland"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																	L_360_[2] = 0
																	repeat
																		L_360_[2] = L_360_[2] + 1
																		L_1_[45]["wt"](1)
																	until L_360_[2] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
																elseif L_1_[30] == 7449423635 then
																	L_1_[31](CFrame["new"](-5034, 315, -2951), 1.5)
																	if ((CFrame["new"](-5034, 315, -2951))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3 then
																		if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																			local L_361_ = {}
																			fireclickdetector(L_1_[19]["Map"]["Boat Castle"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																			L_361_[1] = 0
																			repeat
																				L_361_[1] = L_361_[1] + 1
																				L_1_[45]["wt"](1)
																			until L_361_[1] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
																		end
																	end
																end
															end
														else
															Quest = nil
															L_1_[45]["Status"](L_1_[3]({
																" Status : Auto Farm ";
																"Level"
															}))
															L_1_[39]()
														end
													end
												end
											end
										end
									end
								until Death_Step
							end
							return
						end
						if Dragon_Claw_C_M and (not Sharkman_Karate_C and L_1_[24]["Value"] >= 1100) then
							if not Sharkman_Karate_C then
								repeat
									L_1_[45]["wt"]()
									L_1_[14]()
									if L_1_[45]["ffc"](L_1_[35]["Backpack"], "Sharkman Karate") or L_1_[45]["ffc"](L_1_[35]["Character"], "Sharkman Karate") then
										Sharkman_Karate_C = true
										return
									end
									if not Sharkman_Karate_C and L_1_[24]["Value"] >= 1100 then
										if L_1_[17]["Value"] >= 5000 then
											if L_1_[1]["Value"] >= 2550000 and not Sharkman_Karate_C then
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuySharkmanKarate")
												Sharkman_Karate_C = true
												return
											else
												L_1_[14]()
												Quest = nil
												L_1_[45]["Status"](L_1_[3]({
													" Status : Auto Farm ",
													"Level"
												}))
												L_1_[39]()
											end
										elseif L_1_[17]["Value"] < 5000 then
											if L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] and (L_1_[17]["Value"] < 5000 and not Sharkman_Karate_C) then
												L_1_[45]["Status"](" Status : Farm Raid")
												if #L_1_[45]["GetMobRaid"]() == 0 then
													if Select_Map == "Magma" or Select_Map == "Flame" then
														for L_362_forvar0, L_363_forvar1 in pairs(L_1_[19]:GetDescendants()) do
															local L_364_ = {}
															L_364_[1], L_364_[3] = L_362_forvar0, L_363_forvar1
															if L_364_[3]["Name"] == "Lava" then
																L_364_[3]:Destroy()
															end
														end
													end
													if L_1_[45]["GetRaid"]("Island 5", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 5", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 4", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 4", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 3", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 3", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 2", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 2", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 1", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 1", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													end
												else
													for L_365_forvar0, L_366_forvar1 in pairs(L_1_[40]:GetChildren()) do
														local L_367_ = {}
														L_367_[3], L_367_[1] = L_365_forvar0, L_366_forvar1
														if L_367_[1]:FindFirstChild("HumanoidRootPart") and (L_367_[1]:FindFirstChild("Humanoid") and ((L_367_[1]:FindFirstChild("Humanoid"))["Health"] > 0 and (L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"]["Position"] - L_367_[1]["HumanoidRootPart"]["CFrame"]["Position"])["Magnitude"] <= 5000)) then
															repeat
																local L_368_ = {}
																L_1_[45]["wt"](.1)
																if Select_Map == "Magma" or Select_Map == "Flame" then
																	for L_369_forvar0, L_370_forvar1 in pairs(L_1_[19]:GetDescendants()) do
																		local L_371_ = {}
																		L_371_[2], L_371_[3] = L_369_forvar0, L_370_forvar1
																		if L_371_[3]["Name"] == "Lava" then
																			L_371_[3]:Destroy()
																		end
																	end
																end
																L_368_[2] = math["random"](1, 5)
																if L_368_[2] == 1 then
																	L_368_[3] = CFrame["new"](0, 30, 1)
																elseif L_368_[2] == 2 then
																	L_368_[3] = CFrame["new"](0, 30, 15)
																elseif L_368_[2] == 3 then
																	L_368_[3] = CFrame["new"](1, 30, -15)
																elseif L_368_[2] == 4 then
																	L_368_[3] = CFrame["new"](15, 30, 0)
																elseif L_368_[2] == 5 then
																	L_368_[3] = CFrame["new"](-15, 30, 0)
																end
																L_1_[31](L_367_[1]["HumanoidRootPart"]["CFrame"] * L_368_[3], 1.5)
																if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
																	L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
																end
																L_1_[14]()
															until not L_367_[1]["Parent"] or L_367_[1]["Humanoid"]["Health"] <= 0 or #L_1_[45]["GetMobRaid"]() == 0
														end
													end
												end
											else
												if L_1_[35]["Data"]["DevilFruit"]["Value"] == "Dark-Dark" then
													Select_Map = "Dark"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Sand-Sand" then
													Select_Map = "Sand"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Magma-Magma" then
													Select_Map = "Magma"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Rumble-Rumble" then
													Select_Map = "Rumble"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Flame-Flame" then
													Select_Map = "Flame"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Ice-Ice" then
													Select_Map = "Ice"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Light-Light" then
													Select_Map = "Light"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "String-String" then
													Select_Map = "String"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Quake-Quake" then
													Select_Map = "Quake"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Buddha-Buddha" then
													Select_Map = "Buddha"
												else
													Select_Map = "Ice"
												end
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("RaidsNpc", "Select", Select_Map)
												L_1_[45]["wt"](.2)
												if L_1_[35]["Backpack"]:FindFirstChild("Special Microchip") or L_1_[35]["Character"]:FindFirstChild("Special Microchip") and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
													if L_1_[30] == 4442272183 and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
														local L_372_ = {}
														fireclickdetector(L_1_[19]["Map"]["CircleIsland"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
														L_372_[1] = 0
														repeat
															L_372_[1] = L_372_[1] + 1
															L_1_[45]["wt"](1)
														until L_372_[1] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
													elseif L_1_[30] == 7449423635 then
														L_1_[31](CFrame["new"](-5034, 315, -2951), 1.5)
														if ((CFrame["new"](-5034, 315, -2951))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3 then
															if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																local L_373_ = {}
																fireclickdetector(L_1_[19]["Map"]["Boat Castle"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																L_373_[2] = 0
																repeat
																	L_373_[2] = L_373_[2] + 1
																	L_1_[45]["wt"](1)
																until L_373_[2] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
															end
														end
													end
												else
													if not L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] then
														if L_1_[1]["Value"] >= 0 and L_1_[35]["Data"]["Fragments"]["Value"] >= 5000 then
															print("nan")
															L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuySharkmanKarate")
															Sharkman_Karate_C = true
															return
														end
														table["sort"](L_1_[45]["GetFruits"](), function(L_374_arg0, L_375_arg1)
															local L_376_ = {}
															L_376_[3], L_376_[1] = L_374_arg0, L_375_arg1
															if L_376_[3]["Value"] < 100000 and L_376_[3]["Value"] < 100000 then
																return L_376_[3]["Value"] < L_376_[1]["Value"]
															end
														end)
														L_1_[45]["wt"](1)
														if #L_1_[45]["GetFruits"]() > 0 and not Sharkman_Karate_C then
															L_1_[45]["wt"](2)
															if not L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] then
																if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 and L_1_[35]["Data"]["Fragments"]["Value"] < 5000 then
																	L_1_[7]["Remotes"]["CommF_"]:InvokeServer("LoadFruit", (L_1_[45]["GetFruits"]())[1]["Name"])
																elseif L_1_[17]["Value"] < 5000 then
																	break
																end
																if L_1_[35]["Data"]["DevilFruit"]["Value"] == "Dark-Dark" then
																	Select_Map = "Dark"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Sand-Sand" then
																	Select_Map = "Sand"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Magma-Magma" then
																	Select_Map = "Magma"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Rumble-Rumble" then
																	Select_Map = "Rumble"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Flame-Flame" then
																	Select_Map = "Flame"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Ice-Ice" then
																	Select_Map = "Ice"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Light-Light" then
																	Select_Map = "Light"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "String-String" then
																	Select_Map = "String"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Quake-Quake" then
																	Select_Map = "Quake"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Buddha-Buddha" then
																	Select_Map = "Buddha"
																else
																	Select_Map = "Ice"
																end
																L_1_[7]["Remotes"]["CommF_"]:InvokeServer("RaidsNpc", "Select", Select_Map)
																if L_1_[30] == 4442272183 and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																	local L_377_ = {}
																	fireclickdetector(L_1_[19]["Map"]["CircleIsland"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																	L_377_[1] = 0
																	repeat
																		L_377_[1] = L_377_[1] + 1
																		L_1_[45]["wt"](1)
																	until L_377_[1] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
																elseif L_1_[30] == 7449423635 then
																	L_1_[31](CFrame["new"](-5034, 315, -2951), 1.5)
																	if ((CFrame["new"](-5034, 315, -2951))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3 then
																		if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																			local L_378_ = {}
																			fireclickdetector(L_1_[19]["Map"]["Boat Castle"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																			L_378_[2] = 0
																			repeat
																				L_378_[2] = L_378_[2] + 1
																				L_1_[45]["wt"](1)
																			until L_378_[2] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
																		end
																	end
																end
															end
														else
															Quest = nil
															L_1_[45]["Status"](L_1_[3]({
																" Status : Auto Farm ",
																"Level"
															}))
															L_1_[39]()
														end
													end
												end
											end
										end
									end
								until Sharkman_Karate_C
							end
							return
						end
						if Sharkman_Karate_C_M and (not Electric_Claw_C and L_1_[24]["Value"] >= 1100) then
							if not Electric_Claw_C then
								repeat
									L_1_[45]["wt"]()
									L_1_[14]()
									if L_1_[45]["ffc"](L_1_[35]["Backpack"], "Electric Claw") or L_1_[45]["ffc"](L_1_[35]["Character"], "Electric Claw") then
										Electric_Claw_C = true
										return
									end
									if not Electric_Claw_C and L_1_[24]["Value"] >= 1100 then
										if L_1_[17]["Value"] >= 5000 then
											if L_1_[1]["Value"] >= 3000000 then
												pcall(function()
													L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw")
													if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw") == 1 or L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw") == 2 then
														Electric_Claw_C = true
													end
												end)
												if not Electric_Claw_C then
													L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw")
													if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw") == 1 or L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw") == 2 then
														Electric_Claw_C = true
													end
												end
												if Three_World and not Electric_Claw_C then
													Quest = "Quest Electric Claw"
												end
												return
											else
												L_1_[14]()
												Quest = nil
												L_1_[45]["Status"](L_1_[3]({
													" Status : Auto Farm ";
													"Level"
												}))
												L_1_[39]()
											end
										elseif L_1_[17]["Value"] < 5000 then
											if L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] and (L_1_[17]["Value"] < 5000 and not Electric_Claw_C) then
												L_1_[45]["Status"](" Status : Farm Raid")
												if #L_1_[45]["GetMobRaid"]() == 0 then
													if Select_Map == "Magma" or Select_Map == "Flame" then
														for L_379_forvar0, L_380_forvar1 in pairs(L_1_[19]:GetDescendants()) do
															local L_381_ = {}
															L_381_[2], L_381_[1] = L_379_forvar0, L_380_forvar1
															if L_381_[1]["Name"] == "Lava" then
																L_381_[1]:Destroy()
															end
														end
													end
													if L_1_[45]["GetRaid"]("Island 5", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 5", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 4", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 4", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 3", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 3", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 2", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 2", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 1", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 1", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													end
												else
													for L_382_forvar0, L_383_forvar1 in pairs(L_1_[40]:GetChildren()) do
														local L_384_ = {}
														L_384_[1], L_384_[2] = L_382_forvar0, L_383_forvar1
														if L_384_[2]:FindFirstChild("HumanoidRootPart") and (L_384_[2]:FindFirstChild("Humanoid") and ((L_384_[2]:FindFirstChild("Humanoid"))["Health"] > 0 and (L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"]["Position"] - L_384_[2]["HumanoidRootPart"]["CFrame"]["Position"])["Magnitude"] <= 5000)) then
															repeat
																local L_385_ = {}
																L_1_[45]["wt"](.1)
																if Select_Map == "Magma" or Select_Map == "Flame" then
																	for L_386_forvar0, L_387_forvar1 in pairs(L_1_[19]:GetDescendants()) do
																		local L_388_ = {}
																		L_388_[3], L_388_[2] = L_386_forvar0, L_387_forvar1
																		if L_388_[2]["Name"] == "Lava" then
																			L_388_[2]:Destroy()
																		end
																	end
																end
																L_385_[2] = math["random"](1, 5)
																if L_385_[2] == 1 then
																	L_385_[1] = CFrame["new"](0, 30, 1)
																elseif L_385_[2] == 2 then
																	L_385_[1] = CFrame["new"](0, 30, 15)
																elseif L_385_[2] == 3 then
																	L_385_[1] = CFrame["new"](1, 30, -15)
																elseif L_385_[2] == 4 then
																	L_385_[1] = CFrame["new"](15, 30, 0)
																elseif L_385_[2] == 5 then
																	L_385_[1] = CFrame["new"](-15, 30, 0)
																end
																L_1_[31](L_384_[2]["HumanoidRootPart"]["CFrame"] * L_385_[1], 1.5)
																if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
																	L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
																end
																L_1_[14]()
															until not L_384_[2]["Parent"] or L_384_[2]["Humanoid"]["Health"] <= 0 or #L_1_[45]["GetMobRaid"]() == 0
														end
													end
												end
											else
												if L_1_[35]["Data"]["DevilFruit"]["Value"] == "Dark-Dark" then
													Select_Map = "Dark"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Sand-Sand" then
													Select_Map = "Sand"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Magma-Magma" then
													Select_Map = "Magma"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Rumble-Rumble" then
													Select_Map = "Rumble"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Flame-Flame" then
													Select_Map = "Flame"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Ice-Ice" then
													Select_Map = "Ice"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Light-Light" then
													Select_Map = "Light"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "String-String" then
													Select_Map = "String"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Quake-Quake" then
													Select_Map = "Quake"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Buddha-Buddha" then
													Select_Map = "Buddha"
												else
													Select_Map = "Ice"
												end
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("RaidsNpc", "Select", Select_Map)
												L_1_[45]["wt"](.2)
												if L_1_[35]["Backpack"]:FindFirstChild("Special Microchip") or L_1_[35]["Character"]:FindFirstChild("Special Microchip") and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
													if L_1_[30] == 4442272183 and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
														local L_389_ = {}
														fireclickdetector(L_1_[19]["Map"]["CircleIsland"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
														L_389_[2] = 0
														repeat
															L_389_[2] = L_389_[2] + 1
															L_1_[45]["wt"](1)
														until L_389_[2] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
													elseif L_1_[30] == 7449423635 then
														L_1_[31](CFrame["new"](-5034, 315, -2951), 1.5)
														if ((CFrame["new"](-5034, 315, -2951))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3 then
															if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																local L_390_ = {}
																fireclickdetector(L_1_[19]["Map"]["Boat Castle"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																L_390_[2] = 0
																repeat
																	L_390_[2] = L_390_[2] + 1
																	L_1_[45]["wt"](1)
																until L_390_[2] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
															end
														end
													end
												else
													if not L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] then
														if L_1_[35]["Data"]["Fragments"]["Value"] >= 5000 then
															if L_1_[35]["Data"]["Beli"]["Value"] >= 3000000 then
																L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw")
																if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw") == 1 or L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw") == 2 then
																	Electric_Claw_C = true
																end
																return
															end
															return
														end
														table["sort"](L_1_[45]["GetFruits"](), function(L_391_arg0, L_392_arg1)
															local L_393_ = {}
															L_393_[2], L_393_[3] = L_391_arg0, L_392_arg1
															if L_393_[2]["Value"] < 100000 and L_393_[2]["Value"] < 100000 then
																return L_393_[2]["Value"] < L_393_[3]["Value"]
															end
														end)
														L_1_[45]["wt"](1)
														if #L_1_[45]["GetFruits"]() > 0 and not Electric_Claw_C then
															warn()
															L_1_[45]["wt"](2)
															if not L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] then
																if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 and L_1_[35]["Data"]["Fragments"]["Value"] < 5000 then
																	L_1_[7]["Remotes"]["CommF_"]:InvokeServer("LoadFruit", (L_1_[45]["GetFruits"]())[1]["Name"])
																elseif L_1_[17]["Value"] < 5000 then
																	break
																end
																if L_1_[35]["Data"]["DevilFruit"]["Value"] == "Dark-Dark" then
																	Select_Map = "Dark"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Sand-Sand" then
																	Select_Map = "Sand"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Magma-Magma" then
																	Select_Map = "Magma"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Rumble-Rumble" then
																	Select_Map = "Rumble"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Flame-Flame" then
																	Select_Map = "Flame"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Ice-Ice" then
																	Select_Map = "Ice"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Light-Light" then
																	Select_Map = "Light"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "String-String" then
																	Select_Map = "String"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Quake-Quake" then
																	Select_Map = "Quake"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Buddha-Buddha" then
																	Select_Map = "Buddha"
																else
																	Select_Map = "Ice"
																end
																L_1_[7]["Remotes"]["CommF_"]:InvokeServer("RaidsNpc", "Select", Select_Map)
																if L_1_[30] == 4442272183 and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																	local L_394_ = {}
																	fireclickdetector(L_1_[19]["Map"]["CircleIsland"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																	L_394_[2] = 0
																	repeat
																		L_394_[2] = L_394_[2] + 1
																		L_1_[45]["wt"](1)
																	until L_394_[2] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
																elseif L_1_[30] == 7449423635 then
																	L_1_[31](CFrame["new"](-5034, 315, -2951), 1.5)
																	if ((CFrame["new"](-5034, 315, -2951))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3 then
																		if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																			local L_395_ = {}
																			fireclickdetector(L_1_[19]["Map"]["Boat Castle"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																			L_395_[2] = 0
																			repeat
																				L_395_[2] = L_395_[2] + 1
																				L_1_[45]["wt"](1)
																			until L_395_[2] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
																		end
																	end
																end
															end
														else
															Quest = nil
															L_1_[45]["Status"](L_1_[3]({
																" Status : Auto Farm ",
																"Level"
															}))
															L_1_[39]()
														end
													end
												end
											end
										end
									end
								until Electric_Claw_C
							end
							return
						end
						if Electric_Claw_C_M and (not Dragon_Talon_C and L_1_[24]["Value"] >= 1100) then
							if not Dragon_Talon_C then
								repeat
									L_1_[45]["wt"]()
									L_1_[14]()
									if L_1_[45]["ffc"](L_1_[35]["Backpack"], "Dragon Talon") or L_1_[45]["ffc"](L_1_[35]["Character"], "Dragon Talon") then
										Dragon_Talon_C = true
										return
									end
									if not Dragon_Talon_C and L_1_[24]["Value"] >= 1100 then
										if L_1_[17]["Value"] >= 5000 then
											if L_1_[1]["Value"] >= 3000000 then
												Quest = nil
												L_1_[45]["Status"](L_1_[3]({
													" Status : Auto Farm ",
													"Bone"
												}))
												L_1_[45]["FarmBone"](true)
											else
												L_1_[14]()
												Quest = nil
												L_1_[45]["Status"](L_1_[3]({
													" Status : Auto Farm ",
													"Level"
												}))
												L_1_[39]()
											end
										elseif L_1_[17]["Value"] < 5000 then
											if L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] and (L_1_[17]["Value"] < 5000 and not Dragon_Talon_C) then
												L_1_[45]["Status"](" Status : Farm Raid")
												if #L_1_[45]["GetMobRaid"]() == 0 then
													if Select_Map == "Magma" or Select_Map == "Flame" then
														for L_396_forvar0, L_397_forvar1 in pairs(L_1_[19]:GetDescendants()) do
															local L_398_ = {}
															L_398_[1], L_398_[3] = L_396_forvar0, L_397_forvar1
															if L_398_[3]["Name"] == "Lava" then
																L_398_[3]:Destroy()
															end
														end
													end
													if L_1_[45]["GetRaid"]("Island 5", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 5", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 4", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 4", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 3", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 3", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 2", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 2", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 1", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 1", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													end
												else
													for L_399_forvar0, L_400_forvar1 in pairs(L_1_[40]:GetChildren()) do
														local L_401_ = {}
														L_401_[2], L_401_[3] = L_399_forvar0, L_400_forvar1
														if L_401_[3]:FindFirstChild("HumanoidRootPart") and (L_401_[3]:FindFirstChild("Humanoid") and ((L_401_[3]:FindFirstChild("Humanoid"))["Health"] > 0 and (L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"]["Position"] - L_401_[3]["HumanoidRootPart"]["CFrame"]["Position"])["Magnitude"] <= 5000)) then
															repeat
																local L_402_ = {}
																L_1_[45]["wt"](.1)
																if Select_Map == "Magma" or Select_Map == "Flame" then
																	for L_403_forvar0, L_404_forvar1 in pairs(L_1_[19]:GetDescendants()) do
																		local L_405_ = {}
																		L_405_[3], L_405_[1] = L_403_forvar0, L_404_forvar1
																		if L_405_[1]["Name"] == "Lava" then
																			L_405_[1]:Destroy()
																		end
																	end
																end
																L_402_[1] = math["random"](1, 5)
																if L_402_[1] == 1 then
																	L_402_[2] = CFrame["new"](0, 30, 1)
																elseif L_402_[1] == 2 then
																	L_402_[2] = CFrame["new"](0, 30, 15)
																elseif L_402_[1] == 3 then
																	L_402_[2] = CFrame["new"](1, 30, -15)
																elseif L_402_[1] == 4 then
																	L_402_[2] = CFrame["new"](15, 30, 0)
																elseif L_402_[1] == 5 then
																	L_402_[2] = CFrame["new"](-15, 30, 0)
																end
																L_1_[31](L_401_[3]["HumanoidRootPart"]["CFrame"] * L_402_[2], 1.5)
																if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
																	L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
																end
																L_1_[14]()
															until not L_401_[3]["Parent"] or L_401_[3]["Humanoid"]["Health"] <= 0 or #L_1_[45]["GetMobRaid"]() == 0
														end
													end
												end
											else
												if L_1_[35]["Data"]["DevilFruit"]["Value"] == "Dark-Dark" then
													Select_Map = "Dark"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Sand-Sand" then
													Select_Map = "Sand"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Magma-Magma" then
													Select_Map = "Magma"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Rumble-Rumble" then
													Select_Map = "Rumble"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Flame-Flame" then
													Select_Map = "Flame"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Ice-Ice" then
													Select_Map = "Ice"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Light-Light" then
													Select_Map = "Light"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "String-String" then
													Select_Map = "String"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Quake-Quake" then
													Select_Map = "Quake"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Buddha-Buddha" then
													Select_Map = "Buddha"
												else
													Select_Map = "Ice"
												end
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("RaidsNpc", "Select", Select_Map)
												L_1_[45]["wt"](.2)
												if L_1_[35]["Backpack"]:FindFirstChild("Special Microchip") or L_1_[35]["Character"]:FindFirstChild("Special Microchip") and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
													if L_1_[30] == 4442272183 and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
														local L_406_ = {}
														fireclickdetector(L_1_[19]["Map"]["CircleIsland"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
														L_406_[1] = 0
														repeat
															L_406_[1] = L_406_[1] + 1
															L_1_[45]["wt"](1)
														until L_406_[1] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
													elseif L_1_[30] == 7449423635 then
														L_1_[31](CFrame["new"](-5034, 315, -2951), 1.5)
														if ((CFrame["new"](-5034, 315, -2951))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3 then
															if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																local L_407_ = {}
																fireclickdetector(L_1_[19]["Map"]["Boat Castle"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																L_407_[2] = 0
																repeat
																	L_407_[2] = L_407_[2] + 1
																	L_1_[45]["wt"](1)
																until L_407_[2] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
															end
														end
													end
												else
													if not L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] then
														if L_1_[35]["Data"]["Fragments"]["Value"] >= 5000 then
															if L_1_[35]["Data"]["Beli"]["Value"] >= 3000000 then
																L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDragonTalon")
																Dragon_Talon_C = true
																return
															end
															return
														end
														table["sort"](L_1_[45]["GetFruits"](), function(L_408_arg0, L_409_arg1)
															local L_410_ = {}
															L_410_[1], L_410_[2] = L_408_arg0, L_409_arg1
															if L_410_[1]["Value"] < 100000 and L_410_[1]["Value"] < 100000 then
																return L_410_[1]["Value"] < L_410_[2]["Value"]
															end
														end)
														L_1_[45]["wt"](1)
														if #L_1_[45]["GetFruits"]() > 0 and not Dragon_Talon_C then
															warn()
															L_1_[45]["wt"](2)
															if not L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] then
																if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 and L_1_[35]["Data"]["Fragments"]["Value"] < 5000 then
																	L_1_[7]["Remotes"]["CommF_"]:InvokeServer("LoadFruit", (L_1_[45]["GetFruits"]())[1]["Name"])
																elseif L_1_[17]["Value"] < 5000 then
																	break
																end
																if L_1_[35]["Data"]["DevilFruit"]["Value"] == "Dark-Dark" then
																	Select_Map = "Dark"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Sand-Sand" then
																	Select_Map = "Sand"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Magma-Magma" then
																	Select_Map = "Magma"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Rumble-Rumble" then
																	Select_Map = "Rumble"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Flame-Flame" then
																	Select_Map = "Flame"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Ice-Ice" then
																	Select_Map = "Ice"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Light-Light" then
																	Select_Map = "Light"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "String-String" then
																	Select_Map = "String"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Quake-Quake" then
																	Select_Map = "Quake"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Buddha-Buddha" then
																	Select_Map = "Buddha"
																else
																	Select_Map = "Ice"
																end
																L_1_[7]["Remotes"]["CommF_"]:InvokeServer("RaidsNpc", "Select", Select_Map)
																if L_1_[30] == 4442272183 and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																	local L_411_ = {}
																	fireclickdetector(L_1_[19]["Map"]["CircleIsland"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																	L_411_[2] = 0
																	repeat
																		L_411_[2] = L_411_[2] + 1
																		L_1_[45]["wt"](1)
																	until L_411_[2] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
																elseif L_1_[30] == 7449423635 then
																	L_1_[31](CFrame["new"](-5034, 315, -2951), 1.5)
																	if ((CFrame["new"](-5034, 315, -2951))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3 then
																		if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																			local L_412_ = {}
																			fireclickdetector(L_1_[19]["Map"]["Boat Castle"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																			L_412_[1] = 0
																			repeat
																				L_412_[1] = L_412_[1] + 1
																				L_1_[45]["wt"](1)
																			until L_412_[1] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
																		end
																	end
																end
															end
														else
															Quest = nil
															L_1_[45]["Status"](L_1_[3]({
																" Status : Auto Farm ",
																"Level"
															}))
															L_1_[39]()
														end
													end
												end
											end
										end
									end
								until Dragon_Talon_C
							end
							return
						end
						if Dragon_Talon_C_M and (not God_Human_C and L_1_[24]["Value"] >= 1100) then
							if not God_Human_C then
								repeat
									L_1_[45]["wt"]()
									L_1_[14]()
									if L_1_[45]["ffc"](L_1_[35]["Backpack"], "Godhuman") or L_1_[45]["ffc"](L_1_[35]["Character"], "Godhuman") then
										God_Human_C = true
										return
									end
									if not God_Human_C and L_1_[24]["Value"] >= 1100 then
										if L_1_[17]["Value"] >= 5000 then
											if L_1_[1]["Value"] >= 5000000 then
												Quest = "Godhuman"
											else
												L_1_[14]()
												Quest = nil
												L_1_[45]["Status"](L_1_[3]({
													" Status : Auto Farm ",
													"Level"
												}))
												L_1_[39]()
											end
										elseif L_1_[17]["Value"] < 5000 then
											if L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] and (L_1_[17]["Value"] < 5000 and not God_Human_C) then
												L_1_[45]["Status"](" Status : Farm Raid")
												if #L_1_[45]["GetMobRaid"]() == 0 then
													if Select_Map == "Magma" or Select_Map == "Flame" then
														for L_413_forvar0, L_414_forvar1 in pairs(L_1_[19]:GetDescendants()) do
															local L_415_ = {}
															L_415_[3], L_415_[1] = L_413_forvar0, L_414_forvar1
															if L_415_[1]["Name"] == "Lava" then
																L_415_[1]:Destroy()
															end
														end
													end
													if L_1_[45]["GetRaid"]("Island 5", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 5", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 4", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 4", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 3", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 3", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 2", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 2", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													elseif L_1_[45]["GetRaid"]("Island 1", 2500) ~= nil then
														L_1_[31]((L_1_[45]["GetRaid"]("Island 1", 2500))["CFrame"] * CFrame["new"](0, 120, 0), 1.5)
													end
												else
													for L_416_forvar0, L_417_forvar1 in pairs(L_1_[40]:GetChildren()) do
														local L_418_ = {}
														L_418_[2], L_418_[1] = L_416_forvar0, L_417_forvar1
														if L_418_[1]:FindFirstChild("HumanoidRootPart") and (L_418_[1]:FindFirstChild("Humanoid") and ((L_418_[1]:FindFirstChild("Humanoid"))["Health"] > 0 and (L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"]["Position"] - L_418_[1]["HumanoidRootPart"]["CFrame"]["Position"])["Magnitude"] <= 5000)) then
															repeat
																local L_419_ = {}
																L_1_[45]["wt"](.1)
																if Select_Map == "Magma" or Select_Map == "Flame" then
																	for L_420_forvar0, L_421_forvar1 in pairs(L_1_[19]:GetDescendants()) do
																		local L_422_ = {}
																		L_422_[2], L_422_[1] = L_420_forvar0, L_421_forvar1
																		if L_422_[1]["Name"] == "Lava" then
																			L_422_[1]:Destroy()
																		end
																	end
																end
																L_419_[2] = math["random"](1, 5)
																if L_419_[2] == 1 then
																	L_419_[1] = CFrame["new"](0, 30, 1)
																elseif L_419_[2] == 2 then
																	L_419_[1] = CFrame["new"](0, 30, 15)
																elseif L_419_[2] == 3 then
																	L_419_[1] = CFrame["new"](1, 30, -15)
																elseif L_419_[2] == 4 then
																	L_419_[1] = CFrame["new"](15, 30, 0)
																elseif L_419_[2] == 5 then
																	L_419_[1] = CFrame["new"](-15, 30, 0)
																end
																L_1_[31](L_418_[1]["HumanoidRootPart"]["CFrame"] * L_419_[1], 1.5)
																if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
																	L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
																end
																L_1_[14]()
															until not L_418_[1]["Parent"] or L_418_[1]["Humanoid"]["Health"] <= 0 or #L_1_[45]["GetMobRaid"]() == 0
														end
													end
												end
											else
												if L_1_[35]["Data"]["DevilFruit"]["Value"] == "Dark-Dark" then
													Select_Map = "Dark"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Sand-Sand" then
													Select_Map = "Sand"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Magma-Magma" then
													Select_Map = "Magma"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Rumble-Rumble" then
													Select_Map = "Rumble"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Flame-Flame" then
													Select_Map = "Flame"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Ice-Ice" then
													Select_Map = "Ice"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Light-Light" then
													Select_Map = "Light"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "String-String" then
													Select_Map = "String"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Quake-Quake" then
													Select_Map = "Quake"
												elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Buddha-Buddha" then
													Select_Map = "Buddha"
												else
													Select_Map = "Ice"
												end
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("RaidsNpc", "Select", Select_Map)
												L_1_[45]["wt"](.2)
												if L_1_[35]["Backpack"]:FindFirstChild("Special Microchip") or L_1_[35]["Character"]:FindFirstChild("Special Microchip") and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
													if L_1_[30] == 4442272183 and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
														local L_423_ = {}
														fireclickdetector(L_1_[19]["Map"]["CircleIsland"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
														L_423_[2] = 0
														repeat
															L_423_[2] = L_423_[2] + 1
															L_1_[45]["wt"](1)
														until L_423_[2] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
													elseif L_1_[30] == 7449423635 then
														L_1_[31](CFrame["new"](-5034, 315, -2951), 1.5)
														if ((CFrame["new"](-5034, 315, -2951))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3 then
															if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																local L_424_ = {}
																fireclickdetector(L_1_[19]["Map"]["Boat Castle"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																L_424_[1] = 0
																repeat
																	L_424_[1] = L_424_[1] + 1
																	L_1_[45]["wt"](1)
																until L_424_[1] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
															end
														end
													end
												else
													if not L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] then
														if L_1_[35]["Data"]["Fragments"]["Value"] >= 5000 then
															if L_1_[35]["Data"]["Beli"]["Value"] >= 3000000 then
																L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyGodHuman")
																God_Human_C = true
																return
															end
															return
														end
														table["sort"](L_1_[45]["GetFruits"](), function(L_425_arg0, L_426_arg1)
															local L_427_ = {}
															L_427_[2], L_427_[1] = L_425_arg0, L_426_arg1
															if L_427_[2]["Value"] < 100000 and L_427_[2]["Value"] < 100000 then
																return L_427_[2]["Value"] < L_427_[1]["Value"]
															end
														end)
														L_1_[45]["wt"](1)
														if #L_1_[45]["GetFruits"]() > 0 and not God_Human_C then
															warn()
															L_1_[45]["wt"](2)
															if not L_1_[35]["PlayerGui"]["Main"]["TopHUDList"]["RaidTimer"]["Visible"] then
																if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 and L_1_[35]["Data"]["Fragments"]["Value"] < 5000 then
																	L_1_[7]["Remotes"]["CommF_"]:InvokeServer("LoadFruit", (L_1_[45]["GetFruits"]())[1]["Name"])
																elseif L_1_[17]["Value"] < 5000 then
																	break
																end
																if L_1_[35]["Data"]["DevilFruit"]["Value"] == "Dark-Dark" then
																	Select_Map = "Dark"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Sand-Sand" then
																	Select_Map = "Sand"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Magma-Magma" then
																	Select_Map = "Magma"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Rumble-Rumble" then
																	Select_Map = "Rumble"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Flame-Flame" then
																	Select_Map = "Flame"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Ice-Ice" then
																	Select_Map = "Ice"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Light-Light" then
																	Select_Map = "Light"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "String-String" then
																	Select_Map = "String"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Quake-Quake" then
																	Select_Map = "Quake"
																elseif L_1_[35]["Data"]["DevilFruit"]["Value"] == "Buddha-Buddha" then
																	Select_Map = "Buddha"
																else
																	Select_Map = "Ice"
																end
																L_1_[7]["Remotes"]["CommF_"]:InvokeServer("RaidsNpc", "Select", Select_Map)
																if L_1_[30] == 4442272183 and L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																	local L_428_ = {}
																	fireclickdetector(L_1_[19]["Map"]["CircleIsland"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																	L_428_[2] = 0
																	repeat
																		L_428_[2] = L_428_[2] + 1
																		L_1_[45]["wt"](1)
																	until L_428_[2] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
																elseif L_1_[30] == 7449423635 then
																	L_1_[31](CFrame["new"](-5034, 315, -2951), 1.5)
																	if ((CFrame["new"](-5034, 315, -2951))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3 then
																		if L_1_[35]["Character"]["Humanoid"]["Health"] > 0 then
																			local L_429_ = {}
																			fireclickdetector(L_1_[19]["Map"]["Boat Castle"]["RaidSummon2"]["Button"]["Main"]["ClickDetector"], 1)
																			L_429_[1] = 0
																			repeat
																				L_429_[1] = L_429_[1] + 1
																				L_1_[45]["wt"](1)
																			until L_429_[1] >= 20 or L_1_[35]["PlayerGui"]["Main"]["Timer"]["Visible"]
																		end
																	end
																end
															end
														else
															Quest = nil
															L_1_[45]["Status"](L_1_[3]({
																" Status : Auto Farm ";
																"Level"
															}))
															L_1_[39]()
														end
													end
												end
											end
										end
									end
								until God_Human_C
							end
							return
						end
						if L_1_[24]["Value"] >= 700 and (not New_World and not Three_World) then
							Quest = "World 2"
							return
						end
						if New_World and (CheckFindWaterKey and (L_1_[24]["Value"] >= 1500 and (L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TalkTrevor", "1") == 0 and (not L_1_[45]["IsHall"]() and L_1_[45]["IsHeavenly"]())))) then
							Quest = "TravelZou"
							return
						end
						Quest = nil
						L_1_[45]["Status"](L_1_[3]({
							" Status : Auto Farm ",
							"Level"
						}))
						L_1_[39]()
					end
				end
			end
		end, warn)
	end
end)
task["spawn"](function()
	while L_1_[45]["wt"]() do
		xpcall(function()
			if Quest ~= nil then
				L_1_[45]["Status"](" Status : " .. Quest)
			end
			if Quest == "Saber" then
				local L_430_ = {}
				if not old_World then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelMain")
				end
				L_430_[2] = L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ProQuestProgress")
				if L_430_[2]["UsedTorch"] == false then
					for L_431_forvar0, L_432_forvar1 in pairs((game:GetService("Workspace"))["Map"]["Jungle"]["QuestPlates"]:GetChildren()) do
						local L_433_ = {}
						L_433_[3], L_433_[2] = L_431_forvar0, L_432_forvar1
						if table["find"]({
							"Plate1",
							"Plate2",
							"Plate3",
							"Plate4";
							"Plate5"
						}, L_433_[2]["Name"]) then
							L_433_[2]["Button"]["CFrame"] = L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"]
						end
					end
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ProQuestProgress", "GetTorch")
					L_1_[45]["Equip"]("Torch")
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ProQuestProgress", "DestroyTorch")
				elseif L_430_[2]["UsedCup"] == false then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ProQuestProgress", "GetCup")
					L_1_[45]["Equip"]("Cup")
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ProQuestProgress", "FillCup", (game:GetService("Players"))["LocalPlayer"]["Character"]["Cup"])
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ProQuestProgress", "SickMan")
				elseif L_430_[2]["KilledMob"] == false then
					local L_434_ = {}
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ProQuestProgress", "RichSon")
					L_434_[2] = L_1_[45]["ffc"](L_1_[40], "Mob Leader")
					if L_434_[2] then
						for L_435_forvar0, L_436_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_437_ = {}
							L_437_[2], L_437_[3] = L_435_forvar0, L_436_forvar1
							if L_437_[3]["Name"] == "Mob Leader" then
								repeat
									L_1_[45]["wt"]()
									L_1_[31](L_437_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 20, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_437_[3]["Parent"] or L_437_[3]["Humanoid"]["Health"] <= 0 or L_1_[45]["gi"]("Saber")
								L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ProQuestProgress", "RichSon")
							end
						end
					else
						L_1_[31](CFrame["new"](-2848.59399, 7.4272871, 5342.44043), 1.5)
					end
				elseif L_430_[2]["UsedRelic"] == false then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ProQuestProgress", "RichSon")
					L_1_[45]["Equip"]("Relic")
					L_1_[31](CFrame["new"](-1406.60925, 29.8520069, 4.5805192), 1.5)
				else
					if L_1_[45]["ffc"](L_1_[40], "Saber Expert") then
						for L_438_forvar0, L_439_forvar1 in pairs((game:GetService("Workspace"))["Enemies"]:GetChildren()) do
							local L_440_ = {}
							L_440_[1], L_440_[3] = L_438_forvar0, L_439_forvar1
							if L_440_[3]["Name"] == "Saber Expert" then
								repeat
									L_1_[45]["wt"]()
									L_1_[31](L_440_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 25, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_440_[3]["Parent"] or L_440_[3]["Humanoid"]["Health"] <= 0 or L_1_[45]["gi"]("Saber")
							end
						end
					else
						L_1_[31](CFrame["new"](-1458.89502, 29.8870335, -50.633564, .858821094, 1.13848939e-08, .512275636, -4.85649254e-09, 1, -1.40823326e-08, -0.512275636, 9.6063415e-09, .858821094), 1.5)
						if ((CFrame["new"](-1458.89502, 29.8870335, -50.633564, .858821094, 1.13848939e-08, .512275636, -4.85649254e-09, 1, -1.40823326e-08, -0.512275636, 9.6063415e-09, .858821094))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3 then
							L_1_[45]["wt"](.5)
							if not L_1_[45]["ffc"](L_1_[40], "Saber Expert") then
								L_1_[35]:Kick("Hop")
								L_1_[45]["wt"](.1)
								L_1_[10]:Teleport(L_1_[30], L_1_[35])
							end
						end
					end
				end
			elseif Quest == "World 2" then
				local L_441_ = {}
				L_441_[1] = L_1_[7]["Remotes"]["CommF_"]:InvokeServer(L_1_[3]({
					"DressrosaQuestProgre";
					"ss"
				}))
				if L_441_[1]["UsedKey"] == false then
					L_1_[31](CFrame["new"](1347.32947, 37.349369, -1325.44922, .538348913, 8.57539106e-08, .842722058, 8.61935634e-10, 1, -1.0230886e-07, -0.842722058, 5.58042359e-08, .538348913), 1.5)
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer(L_1_[3]({
						"DressrosaQuestProgre",
						"ss"
					}), "Detective")
					L_1_[45]["Equip"]("Key")
				elseif L_441_[1]["KilledIceBoss"] == false then
					if L_1_[45]["ffc"](L_1_[40], "Ice Admiral") then
						for L_442_forvar0, L_443_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_444_ = {}
							L_444_[1], L_444_[2] = L_442_forvar0, L_443_forvar1
							if L_444_[2]["Name"] == "Ice Admiral" and L_444_[2]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"](.1)
									L_1_[31](L_444_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 20, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_444_[2]["Parent"] or L_444_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or L_441_[1]["KilledIceBoss"]
								L_1_[45]["wt"](2)
								L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelDressrosa")
								TleP = true
								L_1_[45]["wt"](25)
							end
						end
					elseif L_1_[45]["ffc"](L_1_[7], "Ice Admiral") then
						L_1_[31](CFrame["new"](1144.5270996094, 7.3292083740234, -1164.7322998047), 1.5)
					end
				elseif L_441_[1]["KilledIceBoss"] == true then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelDressrosa")
					TleP = true
					L_1_[45]["wt"](25)
				end
			elseif Quest == "Pole (1st Form)" then
				if not L_1_[45]["CheckBoss"]("Thunder God") then
					return
				end
				repeat
					L_1_[45]["wt"]()
					if L_1_[45]["ffc"](L_1_[40], "Thunder God") then
						for L_445_forvar0, L_446_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_447_ = {}
							L_447_[3], L_447_[1] = L_445_forvar0, L_446_forvar1
							if L_447_[1]["Name"] == "Thunder God" and L_447_[1]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									if ((CFrame["new"](-7894.6181640625, 5547.1420898438, -380.29098510742))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 7500 then
										((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", vector["create"](-7894.6181640625, 5547.1420898438, -380.29098510742))
									end
									L_1_[31](L_447_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_447_[1]["Parent"] or L_447_[1]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Thunder God")
							end
						end
					elseif L_1_[45]["ffc"](L_1_[7], "Thunder God") then
						for L_448_forvar0, L_449_forvar1 in pairs(L_1_[7]:GetChildren()) do
							local L_450_ = {}
							L_450_[2], L_450_[3] = L_448_forvar0, L_449_forvar1
							if L_450_[3]["Name"] == "Thunder God" and L_450_[3]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									if ((CFrame["new"](-7894.6181640625, 5547.1420898438, -380.29098510742))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 7500 then
										((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", vector["create"](-7894.6181640625, 5547.1420898438, -380.29098510742))
									end
									L_1_[31](L_450_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_450_[3]["Parent"] or L_450_[3]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Thunder God")
							end
						end
					end
				until not L_1_[45]["CheckBoss"]("Thunder God")
			elseif Quest == "Shark Saw" then
				if not L_1_[45]["CheckBoss"]("The Saw") then
					return
				end
				repeat
					L_1_[45]["wt"]()
					if L_1_[45]["ffc"](L_1_[40], "The Saw") then
						for L_451_forvar0, L_452_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_453_ = {}
							L_453_[1], L_453_[3] = L_451_forvar0, L_452_forvar1
							if L_453_[3]["Name"] == "The Saw" and L_453_[3]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									if ((CFrame["new"](-7894.6181640625, 5547.1420898438, -380.29098510742))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 7500 then
										((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", vector["create"](-7894.6181640625, 5547.1420898438, -380.29098510742))
									end
									L_1_[31](L_453_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_453_[3]["Parent"] or L_453_[3]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("The Saw")
							end
						end
					elseif L_1_[45]["ffc"](L_1_[7], "The Saw") then
						for L_454_forvar0, L_455_forvar1 in pairs(L_1_[7]:GetChildren()) do
							local L_456_ = {}
							L_456_[1], L_456_[3] = L_454_forvar0, L_455_forvar1
							if L_456_[3]["Name"] == "The Saw" and L_456_[3]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									if ((CFrame["new"](-7894.6181640625, 5547.1420898438, -380.29098510742))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 7500 then
										((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", vector["create"](-7894.6181640625, 5547.1420898438, -380.29098510742))
									end
									L_1_[31](L_456_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_456_[3]["Parent"] or L_456_[3]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("The Saw")
							end
						end
					end
				until not L_1_[45]["CheckBoss"]("The Saw")
			elseif Quest == "Flail" then
				if not L_1_[45]["CheckBoss"]("Smoke Admiral") then
					return
				end
				repeat
					L_1_[45]["wt"]()
					if L_1_[45]["ffc"](L_1_[40], "Smoke Admiral") then
						for L_457_forvar0, L_458_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_459_ = {}
							L_459_[2], L_459_[1] = L_457_forvar0, L_458_forvar1
							if L_459_[1]["Name"] == "Smoke Admiral" and L_459_[1]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									if ((CFrame["new"](-7894.6181640625, 5547.1420898438, -380.29098510742))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 7500 then
										((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", vector["create"](-7894.6181640625, 5547.1420898438, -380.29098510742))
									end
									L_1_[31](L_459_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_459_[1]["Parent"] or L_459_[1]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Smoke Admiral")
							end
						end
					elseif L_1_[45]["ffc"](L_1_[7], "Smoke Admiral") then
						for L_460_forvar0, L_461_forvar1 in pairs(L_1_[7]:GetChildren()) do
							local L_462_ = {}
							L_462_[1], L_462_[2] = L_460_forvar0, L_461_forvar1
							if L_462_[2]["Name"] == "Smoke Admiral" and L_462_[2]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									if ((CFrame["new"](-7894.6181640625, 5547.1420898438, -380.29098510742))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 7500 then
										((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", vector["create"](-7894.6181640625, 5547.1420898438, -380.29098510742))
									end
									L_1_[31](L_462_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_462_[2]["Parent"] or L_462_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Smoke Admiral")
							end
						end
					end
				until not L_1_[45]["CheckBoss"]("Smoke Admiral")
			elseif Quest == "Wardens Sword" then
				if not L_1_[45]["CheckBoss"]("Chief Warden") then
					return
				end
				repeat
					L_1_[45]["wt"]()
					if L_1_[45]["ffc"](L_1_[40], "Chief Warden") then
						for L_463_forvar0, L_464_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_465_ = {}
							L_465_[2], L_465_[1] = L_463_forvar0, L_464_forvar1
							if L_465_[1]["Name"] == "Chief Warden" and L_465_[1]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									if ((CFrame["new"](-7894.6181640625, 5547.1420898438, -380.29098510742))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 7500 then
										((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", vector["create"](-7894.6181640625, 5547.1420898438, -380.29098510742))
									end
									L_1_[31](L_465_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_465_[1]["Parent"] or L_465_[1]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Chief Warden")
							end
						end
					elseif L_1_[45]["ffc"](L_1_[7], "Chief Warden") then
						for L_466_forvar0, L_467_forvar1 in pairs(L_1_[7]:GetChildren()) do
							local L_468_ = {}
							L_468_[1], L_468_[2] = L_466_forvar0, L_467_forvar1
							if L_468_[2]["Name"] == "Chief Warden" and L_468_[2]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									if ((CFrame["new"](-7894.6181640625, 5547.1420898438, -380.29098510742))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 7500 then
										((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", vector["create"](-7894.6181640625, 5547.1420898438, -380.29098510742))
									end
									L_1_[31](L_468_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_468_[2]["Parent"] or L_468_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Chief Warden")
							end
						end
					end
				until not L_1_[45]["CheckBoss"]("The Saw")
			elseif Quest == "Magma Blaster" then
				if not L_1_[45]["CheckBoss"]("Magma Admiral") then
					return
				end
				repeat
					L_1_[45]["wt"]()
					if L_1_[45]["ffc"](L_1_[40], "Magma Admiral") then
						for L_469_forvar0, L_470_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_471_ = {}
							L_471_[1], L_471_[2] = L_469_forvar0, L_470_forvar1
							if L_471_[2]["Name"] == "Magma Admiral" and L_471_[2]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									if ((CFrame["new"](-7894.6181640625, 5547.1420898438, -380.29098510742))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 7500 then
										((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", vector["create"](-7894.6181640625, 5547.1420898438, -380.29098510742))
									end
									L_1_[31](L_471_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_471_[2]["Parent"] or L_471_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Magma Admiral")
							end
						end
					elseif L_1_[45]["ffc"](L_1_[7], "Magma Admiral") then
						for L_472_forvar0, L_473_forvar1 in pairs(L_1_[7]:GetChildren()) do
							local L_474_ = {}
							L_474_[2], L_474_[3] = L_472_forvar0, L_473_forvar1
							if L_474_[3]["Name"] == "Magma Admiral" and L_474_[3]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									if ((CFrame["new"](-7894.6181640625, 5547.1420898438, -380.29098510742))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 7500 then
										((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", vector["create"](-7894.6181640625, 5547.1420898438, -380.29098510742))
									end
									L_1_[31](L_474_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_474_[3]["Parent"] or L_474_[3]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Magma Admiral")
							end
						end
					end
				until not L_1_[45]["CheckBoss"]("Magma Admiral")
			elseif Quest == "Bazooka" then
				if not L_1_[45]["CheckBoss"]("Wysper") then
					return
				end
				repeat
					L_1_[45]["wt"]()
					if L_1_[45]["ffc"](L_1_[40], "Wysper") then
						for L_475_forvar0, L_476_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_477_ = {}
							L_477_[3], L_477_[2] = L_475_forvar0, L_476_forvar1
							if L_477_[2]["Name"] == "Wysper" and L_477_[2]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									if ((CFrame["new"](-7894.6181640625, 5547.1420898438, -380.29098510742))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 7500 then
										((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", vector["create"](-7894.6181640625, 5547.1420898438, -380.29098510742))
									end
									L_1_[31](L_477_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_477_[2]["Parent"] or L_477_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Wysper")
							end
						end
					elseif L_1_[45]["ffc"](L_1_[7], "Wysper") then
						for L_478_forvar0, L_479_forvar1 in pairs(L_1_[7]:GetChildren()) do
							local L_480_ = {}
							L_480_[3], L_480_[1] = L_478_forvar0, L_479_forvar1
							if L_480_[1]["Name"] == "Wysper" and L_480_[1]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									if ((CFrame["new"](-7894.6181640625, 5547.1420898438, -380.29098510742))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 7500 then
										((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", vector["create"](-7894.6181640625, 5547.1420898438, -380.29098510742))
									end
									L_1_[31](L_480_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_480_[1]["Parent"] or L_480_[1]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Wysper")
							end
						end
					end
				until not L_1_[45]["CheckBoss"]("Wysper")
			elseif Quest == "Twin Hooks" then
				if not L_1_[45]["CheckBoss"]("Captain Elephant") then
					return
				end
				repeat
					L_1_[45]["wt"]()
					if L_1_[45]["ffc"](L_1_[40], "Captain Elephant") then
						for L_481_forvar0, L_482_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_483_ = {}
							L_483_[2], L_483_[3] = L_481_forvar0, L_482_forvar1
							if L_483_[3]["Name"] == "Captain Elephant" and L_483_[3]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									if ((CFrame["new"](-7894.6181640625, 5547.1420898438, -380.29098510742))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 7500 then
										((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", vector["create"](-7894.6181640625, 5547.1420898438, -380.29098510742))
									end
									L_1_[31](L_483_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_483_[3]["Parent"] or L_483_[3]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Captain Elephant")
							end
						end
					elseif L_1_[45]["ffc"](L_1_[7], "Captain Elephant") then
						for L_484_forvar0, L_485_forvar1 in pairs(L_1_[7]:GetChildren()) do
							local L_486_ = {}
							L_486_[1], L_486_[2] = L_484_forvar0, L_485_forvar1
							if L_486_[2]["Name"] == "Captain Elephant" and L_486_[2]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									if ((CFrame["new"](-7894.6181640625, 5547.1420898438, -380.29098510742))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 7500 then
										((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer("requestEntrance", vector["create"](-7894.6181640625, 5547.1420898438, -380.29098510742))
									end
									L_1_[31](L_486_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_486_[2]["Parent"] or L_486_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Captain Elephant")
							end
						end
					end
				until not L_1_[45]["CheckBoss"]("Wysper")
			elseif Quest == "Gravity Blade" then
				if not L_1_[45]["CheckBoss"]("Orbitus") then
					return
				end
				repeat
					L_1_[45]["wt"]()
					if L_1_[45]["ffc"](L_1_[40], "Orbitus") then
						for L_487_forvar0, L_488_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_489_ = {}
							L_489_[2], L_489_[1] = L_487_forvar0, L_488_forvar1
							if L_489_[1]["Name"] == "Orbitus" and L_489_[1]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									L_1_[31](L_489_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_489_[1]["Parent"] or L_489_[1]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Orbitus")
							end
						end
					elseif L_1_[45]["ffc"](L_1_[7], "Orbitus") then
						for L_490_forvar0, L_491_forvar1 in pairs(L_1_[7]:GetChildren()) do
							local L_492_ = {}
							L_492_[3], L_492_[2] = L_490_forvar0, L_491_forvar1
							if L_492_[2]["Name"] == "Orbitus" and L_492_[2]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									L_1_[31](L_492_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_492_[2]["Parent"] or L_492_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Orbitus")
							end
						end
					end
				until not L_1_[45]["CheckBoss"]("Orbitus")
			elseif Quest == "Longsword" then
				if not L_1_[45]["CheckBoss"]("Diamond") then
					return
				end
				repeat
					L_1_[45]["wt"]()
					if L_1_[45]["ffc"](L_1_[40], "Diamond") then
						for L_493_forvar0, L_494_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_495_ = {}
							L_495_[3], L_495_[2] = L_493_forvar0, L_494_forvar1
							if L_495_[2]["Name"] == "Diamond" and L_495_[2]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									L_1_[31](L_495_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_495_[2]["Parent"] or L_495_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Diamond")
							end
						end
					elseif L_1_[45]["ffc"](L_1_[7], "Diamond") then
						for L_496_forvar0, L_497_forvar1 in pairs(L_1_[7]:GetChildren()) do
							local L_498_ = {}
							L_498_[2], L_498_[3] = L_496_forvar0, L_497_forvar1
							if L_498_[3]["Name"] == "Diamond" and L_498_[3]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									L_1_[31](L_498_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_498_[3]["Parent"] or L_498_[3]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Diamond")
							end
						end
					end
				until not L_1_[45]["CheckBoss"]("Diamond")
			elseif Quest == "Rengoku" then
				if not L_1_[45]["CheckBoss"]("Awakened Ice Admiral") then
					return
				end
				repeat
					L_1_[45]["wt"]()
					if L_1_[45]["ffc"](L_1_[40], "Awakened Ice Admiral") then
						for L_499_forvar0, L_500_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_501_ = {}
							L_501_[3], L_501_[2] = L_499_forvar0, L_500_forvar1
							if L_501_[2]["Name"] == "Awakened Ice Admiral" and L_501_[2]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									L_1_[31](L_501_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_501_[2]["Parent"] or L_501_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Awakened Ice Admiral")
							end
						end
					elseif L_1_[45]["ffc"](L_1_[7], "Awakened Ice Admiral") then
						for L_502_forvar0, L_503_forvar1 in pairs(L_1_[7]:GetChildren()) do
							local L_504_ = {}
							L_504_[3], L_504_[2] = L_502_forvar0, L_503_forvar1
							if L_504_[2]["Name"] == "Awakened Ice Admiral" and L_504_[2]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									L_1_[31](L_504_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_504_[2]["Parent"] or L_504_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Awakened Ice Admiral")
							end
						end
					end
				until not L_1_[45]["CheckBoss"]("Awakened Ice Admiral")
			elseif Quest == "BartiloQuest" then
				if New_World then
					local L_505_ = {}
					L_505_[1] = L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BartiloQuestProgress")
					if L_505_[1]["KilledBandits"] == false then
						if L_1_[35]["PlayerGui"]["Main"]["Quest"]["Visible"] and (L_1_[45]["sf"](L_1_[35]["PlayerGui"]["Main"]["Quest"]["Container"]["QuestTitle"]["Title"]["Text"], "Swan Pirates") and L_1_[45]["sf"](L_1_[35]["PlayerGui"]["Main"]["Quest"]["Container"]["QuestTitle"]["Title"]["Text"], "50")) then
							if L_1_[45]["ffc"](L_1_[40], "Swan Pirate") then
								for L_506_forvar0, L_507_forvar1 in pairs(L_1_[40]:GetChildren()) do
									local L_508_ = {}
									L_508_[1], L_508_[2] = L_506_forvar0, L_507_forvar1
									if L_508_[2]["Name"] == "Swan Pirate" and L_508_[2]["Humanoid"]["Health"] > 0 then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("SetSpawnPoint")
										repeat
											L_1_[45]["wt"]()
											L_1_[45]["BN"](L_508_[2]["Name"])
											L_1_[31](L_508_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
											if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
											end
											L_1_[14]()
										until (L_508_[2]["HumanoidRootPart"]["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 50 or L_508_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"]
									end
								end
							else
								L_1_[31](CFrame["new"](976.467651, 111.174057, 1229.1084), 1.5)
							end
						else
							L_1_[7]["Remotes"]["CommF_"]:InvokeServer("StartQuest", "BartiloQuest", 1)
						end
					elseif L_505_[1]["KilledSpring"] == false then
						if L_1_[45]["ffc"](L_1_[40], "Jeremy") then
							for L_509_forvar0, L_510_forvar1 in pairs(L_1_[40]:GetChildren()) do
								local L_511_ = {}
								L_511_[3], L_511_[1] = L_509_forvar0, L_510_forvar1
								if L_511_[1]["Name"] == "Jeremy" then
									repeat
										L_1_[45]["wt"]()
										L_1_[31](L_511_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
										if not game["Players"]["LocalPlayer"]["Character"]:FindFirstChild("HasBuso") then
											L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
										end
										L_1_[14]()
									until not L_511_[1]["Parent"] or L_511_[1]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"]
								end
							end
						elseif L_1_[45]["ffc"](L_1_[7], "Jeremy") then
							L_1_[31]((L_1_[7]:FindFirstChild("Jeremy"))["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
						elseif not L_1_[45]["ffc"](L_1_[40], "Jeremy") and not L_1_[45]["ffc"](L_1_[7], "Jeremy") then
							L_1_[39]()
						end
					elseif L_505_[1]["DidPlates"] == false then
						repeat
							L_1_[45]["wt"](.3)
							L_1_[31](CFrame["new"](-1836, 11, 1714), 1.5)
						until (Vector3["new"](-1836, 11, 1714) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] < 10
						L_1_[45]["wt"](1)
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BartiloQuestProgress", "DidPlates")
					end
				else
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelDressrosa")
				end
			elseif Quest == "Find Water Key" then
				if New_World then
					if L_1_[35]["Backpack"]:FindFirstChild("Water Key") or L_1_[45]["ffc"](L_1_[35]["Character"], "Water Key") then
						L_1_[45]["Status"](L_1_[3]({
							" Status : Use Water ";
							"Key"
						}))
						L_1_[45]["Equip"]("Water Key")
						L_1_[45]["wait"](0)
						L_1_[46]["Remotes"]["CommF_"]:InvokeServer("BuySharkmanKarate", true)
						CheckFindWaterKey = true
					elseif not L_1_[45]["ffc"](L_1_[35]["Backpack"], "Water Key") and not L_1_[45]["ffc"](L_1_[35]["Character"], "Water Key") then
						if L_1_[45]["ffc"](L_1_[40], "Tide Keeper") then
							for L_512_forvar0, L_513_forvar1 in pairs(L_1_[40]:GetChildren()) do
								local L_514_ = {}
								L_514_[1], L_514_[2] = L_512_forvar0, L_513_forvar1
								if L_514_[2]["Name"] == "Tide Keeper" and (L_514_[2]:FindFirstChild("Humanoid") and (L_514_[2]:FindFirstChild("Humanoid"))["Health"] > 0) then
									repeat
										task["wait"]()
										L_1_[31](L_514_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
										if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
											L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
										end
										L_1_[14]()
									until not L_514_[2]["Parent"] or L_514_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"]
								end
							end
						elseif L_1_[45]["ffc"](L_1_[7], "Tide Keeper") then
							for L_515_forvar0, L_516_forvar1 in pairs(L_1_[7]:GetChildren()) do
								local L_517_ = {}
								L_517_[1], L_517_[2] = L_515_forvar0, L_516_forvar1
								if L_517_[2]["Name"] == "Tide Keeper" and (L_517_[2]:FindFirstChild("Humanoid") and (L_517_[2]:FindFirstChild("Humanoid"))["Health"] > 0) then
									repeat
										L_1_[45]["wt"]()
										L_1_[31](L_517_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
										if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
											L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
										end
										L_1_[14]()
									until not L_517_[2]["Parent"] or L_517_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"]
								end
							end
						else
							L_1_[35]:Kick("Hop")
							L_1_[45]["wt"](.1)
							L_1_[10]:Teleport(L_1_[30], L_1_[35])
						end
					end
				else
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelDressrosa")
				end
			elseif Quest == "Evo Race V1" then
				if New_World then
					if Start_Quest_Evo_V1 then
						if not L_1_[45]["ffc"](L_1_[35]["Backpack"], "Flower 3") and not L_1_[45]["ffc"](L_1_[35]["Character"], "Flower 3") then
							if (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - Vector3["new"](976.467651, 111.174057, 1229.1084))["Magnitude"] <= 800 then
								for L_518_forvar0, L_519_forvar1 in pairs(L_1_[40]:GetChildren()) do
									local L_520_ = {}
									L_520_[2], L_520_[1] = L_518_forvar0, L_519_forvar1
									if L_520_[1]["Humanoid"]["Health"] > 0 and (L_520_[1]["HumanoidRootPart"]["Position"] - Vector3["new"](976.467651, 111.174057, 1229.1084))["Magnitude"] <= 800 then
										repeat
											L_1_[45]["wt"]()
											L_1_[31](L_520_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
											if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
											end
											L_1_[14]()
										until not L_520_[1]["Parent"] or L_520_[1]["Humanoid"]["Health"] <= 0 or L_1_[45]["ffc"](L_1_[35]["Backpack"], "Flower 3") or L_1_[45]["ffc"](L_1_[35]["Character"], "Flower 3") or not(getgenv())["AutoFarm"]
									end
								end
							else
								L_1_[31](CFrame["new"](976.467651, 111.174057, 1229.1084), 1.5)
							end
						elseif not L_1_[45]["ffc"](L_1_[35]["Backpack"], "Flower 2") and not L_1_[45]["ffc"](L_1_[35]["Character"], "Flower 2") then
							if L_1_[45]["ffc"](L_1_[19], "Flower2") then
								L_1_[31](L_1_[19]["Flower2"]["CFrame"], 1.5)
								if (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - L_1_[19]["Flower2"]["Position"])["Magnitude"] <= 5 then
									L_1_[2]:SendKeyEvent(true, "Space", false, game)
									L_1_[45]["wt"](.5)
									L_1_[2]:SendKeyEvent(false, "Space", false, game)
								end
							end
						elseif not L_1_[45]["ffc"](L_1_[35]["Backpack"], "Flower 1") and not L_1_[45]["ffc"](L_1_[35]["Character"], "Flower 1") then
							L_1_[31](L_1_[19]["Flower1"]["CFrame"], 1.5)
							if (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - L_1_[19]["Flower1"]["Position"])["Magnitude"] <= 5 and L_1_[19]["Flower1"]["Transparency"] == 0 then
								L_1_[2]:SendKeyEvent(true, "Space", false, game)
								L_1_[45]["wt"](.5)
								L_1_[2]:SendKeyEvent(false, "Space", false, game)
							end
							L_1_[45]["wt"](1)
						else
							L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Alchemist", "3")
						end
					else
						if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Alchemist", "1") == 1 or L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Alchemist", "1") == 2 then
							Start_Quest_Evo_V1 = true
						end
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Alchemist", "2")
					end
				else
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelDressrosa")
				end
			elseif Quest == "Evo Race V2" then
				if New_World then
					if L_1_[35]["Data"]["Race"]["Value"] == "Human" then
						if Quest_Start_Evo_Human_V3 then
							if not L_1_[45]["ffc"](L_1_[40], "Orbitus") and (not L_1_[45]["ffc"](L_1_[7], "Orbitus") and not Kill_Orbitus) then
								L_1_[45]["HopLowServer"](4)
								wait(.2)
								L_1_[35]:Kick("Hop")
								L_1_[45]["wt"](.1)
								L_1_[10]:Teleport(L_1_[30], L_1_[35])
							end
							if not L_1_[45]["ffc"](L_1_[40], "Jeremy") and (not L_1_[45]["ffc"](L_1_[7], "Jeremy") and not Kill_Jeremy) then
								L_1_[45]["HopLowServer"](4)
								wait(.2)
								L_1_[35]:Kick("Hop")
								L_1_[45]["wt"](.1)
								L_1_[10]:Teleport(L_1_[30], L_1_[35])
							end
							if not L_1_[45]["ffc"](L_1_[40], "Diamond") and (not L_1_[45]["ffc"](L_1_[7], "Diamond") and not Kill_Diamond) then
								L_1_[45]["HopLowServer"](4)
								wait(.2)
								L_1_[35]:Kick("Hop")
								L_1_[45]["wt"](.1)
								L_1_[10]:Teleport(L_1_[30], L_1_[35])
							end
							if not Kill_Orbitus then
								repeat
									L_1_[45]["wt"]()
									pcall(function()
										if L_1_[45]["ffc"](L_1_[40], "Orbitus") or L_1_[45]["ffc"](L_1_[7], "Orbitus") then
											if L_1_[45]["ffc"](L_1_[40], "Orbitus") then
												for L_521_forvar0, L_522_forvar1 in pairs(L_1_[40]:GetChildren()) do
													local L_523_ = {}
													L_523_[3], L_523_[1] = L_521_forvar0, L_522_forvar1
													if L_523_[1]["Name"] == "Orbitus" and L_523_[1]["Humanoid"]["Health"] > 0 then
														repeat
															L_1_[45]["wt"]()
															if L_523_[1]:FindFirstChild("HumanoidRootPart") then
																L_1_[31](L_523_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
																if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
																	L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
																end
																L_1_[14]()
															else
																Kill_Orbitus = true
																break
															end
														until not L_523_[1]["Parent"] or L_523_[1]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"]
														Kill_Orbitus = true
													end
												end
											elseif L_1_[45]["ffc"](L_1_[7], "Orbitus") then
												L_1_[31](L_1_[7]["Orbitus"]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
											end
										end
									end)
								until Kill_Orbitus
							end
							if not Kill_Jeremy then
								repeat
									L_1_[45]["wt"]()
									pcall(function()
										if L_1_[45]["ffc"](L_1_[40], "Jeremy") or L_1_[45]["ffc"](L_1_[7], "Jeremy") then
											if L_1_[45]["ffc"](L_1_[40], "Jeremy") then
												for L_524_forvar0, L_525_forvar1 in pairs(L_1_[40]:GetChildren()) do
													local L_526_ = {}
													L_526_[2], L_526_[3] = L_524_forvar0, L_525_forvar1
													if L_526_[3]["Name"] == "Jeremy" and L_526_[3]["Humanoid"]["Health"] > 0 then
														repeat
															L_1_[45]["wt"]()
															if L_526_[3]:FindFirstChild("HumanoidRootPart") then
																L_1_[31](L_526_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
																if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
																	L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
																end
																L_1_[14]()
															else
																Kill_Jeremy = true
																break
															end
														until not L_526_[3]["Parent"] or L_526_[3]["Humanoid"]["Health"] <= 0 or not L_526_[3]:FindFirstChild("HumanoidRootPart") or not(getgenv())["AutoFarm"]
														Kill_Jeremy = true
													end
												end
											elseif L_1_[45]["ffc"](L_1_[7], "Jeremy") then
												L_1_[31](L_1_[7]["Jeremy"]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
											end
										end
									end)
								until Kill_Orbitus
							end
							if not Kill_Diamond then
								repeat
									L_1_[45]["wt"]()
									pcall(function()
										if L_1_[45]["ffc"](L_1_[40], "Diamond") or L_1_[45]["ffc"](L_1_[7], "Diamond") then
											if L_1_[45]["ffc"](L_1_[40], "Diamond") then
												for L_527_forvar0, L_528_forvar1 in pairs(L_1_[40]:GetChildren()) do
													local L_529_ = {}
													L_529_[2], L_529_[1] = L_527_forvar0, L_528_forvar1
													if L_529_[1]["Name"] == "Diamond" and L_529_[1]["Humanoid"]["Health"] > 0 then
														repeat
															L_1_[45]["wt"]()
															if L_529_[1]:FindFirstChild("HumanoidRootPart") then
																L_1_[31](L_529_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
																if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
																	L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
																end
																L_1_[14]()
															else
																Kill_Diamond = true
																break
															end
														until not L_529_[1]["Parent"] or L_529_[1]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"]
														Kill_Diamond = true
													end
												end
											elseif L_1_[45]["ffc"](L_1_[7], "Diamond") then
												L_1_[31](L_1_[7]["Diamond"]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
											end
										end
									end)
								until Kill_Diamond
							end
						else
							L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Wenlocktoad", "1")
							L_1_[45]["wt"](1)
							L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Wenlocktoad", "2")
							warn()
							if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Wenlocktoad", "1") == 1 or L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Wenlocktoad", "1") == 2 then
								Quest_Start_Evo_Human_V3 = true
							end
						end
					elseif L_1_[35]["Data"]["Race"]["Value"] == "Fishman" then
						if Quest_Start_Evo_Fishman_V3 then
							local L_530_ = {}
							L_530_[1] = false
							L_530_[3] = false
							for L_531_forvar0, L_532_forvar1 in pairs(L_1_[19]["SeaBeasts"]:GetChildren()) do
								local L_533_ = {}
								L_533_[2], L_533_[3] = L_531_forvar0, L_532_forvar1
								if L_533_[3]:FindFirstChild("Health") and (L_533_[3]["Health"]["Value"] > 0 and (Vector3["new"](-3823.9206542969, 76.979339599609, -11685.7734375) - L_533_[3]["HumanoidRootPart"]["Position"])["Magnitude"] >= 1500) then
									L_530_[1] = true
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyFishmanKarate")
									Tejao = true
									PositionSkillMasteryDevilFruit = L_533_[3]["HumanoidRootPart"]["CFrame"]
									L_1_[35]["Character"]["Humanoid"]["Sit"] = false
									wait(1)
									if L_1_[35]["Character"]["Humanoid"]["Sit"] == false then
										Boat = nil
									end
									repeat
										wait()
										L_1_[31](L_533_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 3, 0), 1.5)
									until (L_533_[3]["HumanoidRootPart"]["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 5 or not(getgenv())["AutoFarm"]
									repeat
										wait()
										L_1_[45]["Equip"]("Fishman Karate")
										if L_1_[35]["PlayerGui"]["Main"]["Skills"]:FindFirstChild("Fishman Karate") and (tostring(L_1_[35]["PlayerGui"]["Main"]["Skills"]["Fishman Karate"]["Z"]["Title"]["TextColor"]) == "Institutional white" and L_1_[35]["PlayerGui"]["Main"]["Skills"]["Fishman Karate"]["Z"]["Cooldown"]["AbsoluteSize"]["X"] == 0) then
											L_1_[45]["Equip"]("Fishman Karate")
											L_1_[31](L_533_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 3, 0), 1.5)
											wait(.5)
											PositionSkillMasteryDevilFruit = L_533_[3]["HumanoidRootPart"]["Position"]
											if L_533_[3]["Health"]["Value"] > 0 then
												L_1_[2]:SendKeyEvent(true, "Z", false, game)
												wait(.5)
												L_1_[2]:SendKeyEvent(false, "Z", false, game)
												wait(.2)
											end
										elseif L_1_[35]["PlayerGui"]["Main"]["Skills"]:FindFirstChild("Fishman Karate") and (tostring(L_1_[35]["PlayerGui"]["Main"]["Skills"]["Fishman Karate"]["X"]["Title"]["TextColor"]) == "Institutional white" and L_1_[35]["PlayerGui"]["Main"]["Skills"]["Fishman Karate"]["X"]["Cooldown"]["AbsoluteSize"]["X"] == 0) then
											L_1_[45]["Equip"]("Fishman Karate")
											L_1_[31](L_533_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 3, 0), 1.5)
											wait(.5)
											PositionSkillMasteryDevilFruit = L_533_[3]["HumanoidRootPart"]["Position"]
											if L_533_[3]["Health"]["Value"] > 0 then
												L_1_[2]:SendKeyEvent(true, "X", false, game)
												wait(.5)
												L_1_[2]:SendKeyEvent(false, "X", false, game)
												wait(.2)
											end
										elseif L_1_[35]["PlayerGui"]["Main"]["Skills"]:FindFirstChild("Fishman Karate") and (tostring(L_1_[35]["PlayerGui"]["Main"]["Skills"]["Fishman Karate"]["C"]["Title"]["TextColor"]) == "Institutional white" and L_1_[35]["PlayerGui"]["Main"]["Skills"]["Fishman Karate"]["C"]["Cooldown"]["AbsoluteSize"]["X"] == 0) then
											L_1_[45]["Equip"]("Fishman Karate")
											L_1_[31](L_533_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 3, 0), 1.5)
											wait(.5)
											PositionSkillMasteryDevilFruit = L_533_[3]["HumanoidRootPart"]["Position"]
											if L_533_[3]["Health"]["Value"] > 0 then
												L_1_[2]:SendKeyEvent(true, "C", false, game)
												wait(.5)
												L_1_[2]:SendKeyEvent(false, "C", false, game)
												wait(.2)
											end
										end
									until not L_533_[3]["Parent"] or L_533_[3]["Health"]["Value"] <= 0 or not(getgenv())["AutoFarm"]
									Tejao = false
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Wenlocktoad", "3")
									wait(1)
								end
							end
							if not L_530_[1] then
								for L_534_forvar0, L_535_forvar1 in pairs(L_1_[19]["Boats"]:GetChildren()) do
									local L_536_ = {}
									L_536_[3], L_536_[1] = L_534_forvar0, L_535_forvar1
									if L_536_[1]["Name"] == "Dinghy" and tostring(L_536_[1]["Owner"]["Value"]) == L_1_[35]["Name"] then
										L_530_[3] = true
										if (Vector3["new"](3017.2006835938, -4.25, -2686.3325195312) - L_536_[1]["VehicleSeat"]["Position"])["Magnitude"] >= 30 then
											if L_1_[35]["Character"]["Humanoid"]["Sit"] then
												Boat = "Bit"
												TPBoat(CFrame["new"](1550, -4.25, -2759), L_536_[1]["VehicleSeat"], 200)
											elseif (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - L_536_[1]["VehicleSeat"]["Position"])["Magnitude"] >= 10 then
												Boat = nil
												L_1_[31](L_536_[1]["VehicleSeat"]["CFrame"], 1.5)
											else
												Boat = "Bit"
												L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"] = L_536_[1]["VehicleSeat"]["CFrame"] * CFrame["new"](0, 1, 0)
												wait(3)
											end
										else
											if L_1_[35]["Character"]["Humanoid"]["Sit"] then
												vu:Button1Down(Vector2["new"](1280, 600))
												wait(1)
											elseif (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - L_536_[1]["VehicleSeat"]["Position"])["Magnitude"] >= 10 then
												Boat = nil
												L_1_[31](L_536_[1]["VehicleSeat"]["CFramem"], 1.5)
											else
												Boat = "Bit"
												L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"] = L_536_[1]["VehicleSeat"]["CFrame"] * CFrame["new"](0, 1, 0)
												wait(3)
											end
										end
									end
								end
							end
							if not L_530_[3] and not L_530_[1] then
								L_1_[31](CFrame["new"](-1935, 6, -2564), 1.5)
								if (Vector3["new"](-1935, 6, -2564) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3 then
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyBoat", "Dinghy")
									wait(1)
									Boat = "bit"
								end
							end
						else
							L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Wenlocktoad", "1")
							wait(1)
							L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Wenlocktoad", "2")
							if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Wenlocktoad", "1") == 1 or L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Wenlocktoad", "1") == 2 then
								Quest_Start_Evo_Fishman_V3 = true
							end
						end
					end
				else
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelDressrosa")
				end
			elseif Quest == "Don Swan" then
				repeat
					L_1_[45]["wt"]()
					if L_1_[45]["ffc"](L_1_[40], "Don Swan") then
						for L_537_forvar0, L_538_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_539_ = {}
							L_539_[1], L_539_[2] = L_537_forvar0, L_538_forvar1
							if L_539_[2]["Name"] == "Don Swan" and L_539_[2]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									L_1_[31](L_539_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_539_[2]["Parent"] or L_539_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Don Swan")
							end
						end
					elseif L_1_[45]["ffc"](L_1_[7], "Don Swan") then
						for L_540_forvar0, L_541_forvar1 in pairs(L_1_[7]:GetChildren()) do
							local L_542_ = {}
							L_542_[3], L_542_[1] = L_540_forvar0, L_541_forvar1
							if L_542_[1]["Name"] == "Don Swan" and L_542_[1]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									L_1_[31](L_542_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_542_[1]["Parent"] or L_542_[1]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Don Swan")
							end
						end
					else
						L_1_[45]["HopLowServer"](3)
						L_1_[45]["wt"](.2)
						L_1_[35]:Kick("Hop")
						L_1_[45]["wt"](.1)
						L_1_[10]:Teleport(L_1_[30], L_1_[35])
					end
				until not L_1_[45]["CheckBoss"]("Don Swan")
			elseif Quest == "TravelZou" then
				if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 1 then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelZou")
				end
				if Kill_Don then
					if L_1_[45]["ffc"](L_1_[40], "rip_indra") then
						for L_543_forvar0, L_544_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_545_ = {}
							L_545_[1], L_545_[3] = L_543_forvar0, L_544_forvar1
							if L_545_[3]["Name"] == "rip_indra" and L_545_[3]["Humanoid"]["Health"] > 0 then
								if L_1_[45]["ffc"](L_545_[3]["Humanoid"], "Animator") then
									L_545_[3]["Humanoid"]["Animator"]:Destroy()
								end
								repeat
									L_1_[45]["wt"](.1)
									L_1_[14]()
									L_1_[31](L_545_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
								until L_545_[3]["Humanoid"]["Health"] <= 0 or not L_545_[3]["Parent"] or L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 1
								if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 1 then
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelZou")
									TleP = true
									L_1_[45]["wt"](30)
								end
							end
						end
					elseif L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 1 then
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelZou")
						TleP = true
						L_1_[45]["wt"](30)
					elseif not(game:GetService("Workspace"))["Enemies"]:FindFirstChild("rip_indra") then
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ZQuestProgress", "Check")
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ZQuestProgress", "Begin")
						L_1_[45]["wt"](3)
					end
				elseif not okokok then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ZQuestProgress", "Check")
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("ZQuestProgress", "Begin")
					L_1_[45]["wt"](3)
					for L_546_forvar0, L_547_forvar1 in pairs(L_1_[40]:GetChildren()) do
						local L_548_ = {}
						L_548_[1], L_548_[3] = L_546_forvar0, L_547_forvar1
						if L_548_[3]["Name"] == "rip_indra" then
							Kill_Don = true
						end
					end
					okokok = true
				else
					L_1_[14]()
					Quest = nil
					L_1_[45]["Status"](L_1_[3]({
						" Status : Auto Farm ",
						"Level"
					}))
					L_1_[39]()
				end
			elseif Quest == "Yama" then
				if (L_1_[19]["Map"]["Waterfall"]["SealedKatana"]["Hitbox"]["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 300 then
					if L_1_[45]["ffc"](L_1_[40], "Ghost") then
						for L_549_forvar0, L_550_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_551_ = {}
							L_551_[2], L_551_[3] = L_549_forvar0, L_550_forvar1
							if L_551_[3]["Name"] == "Ghost" and L_551_[3]["Humanoid"]["Health"] > 0 then
								if L_1_[45]["ffc"](L_551_[3]["Humanoid"], "Animator") then
									L_551_[3]["Humanoid"]["Animator"]:Destroy()
								end
								repeat
									wait(.1)
									L_1_[14]()
									L_551_[3]["HumanoidRootPart"]["Size"] = Vector3["new"](50, 50, 50)
									L_1_[31](L_551_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 15, 0), 1.5)
									L_1_[33]:Button1Down(Vector2["new"](1280, 600))
								until not L_551_[3]["Parent"] or L_551_[3]["Humanoid"]["Health"] <= 0
							end
						end
					elseif L_1_[45]["ffc"](L_1_[7], "Ghost") then
						L_1_[31]((L_1_[7]:FindFirstChild("Ghost"))["HumanoidRootPart"]["CFrame"], 1.5)
					elseif not L_1_[45]["ffc"](L_1_[40], "Ghost") and not L_1_[45]["ffc"](L_1_[7], "Ghost") then
						L_1_[31](L_1_[19]["Map"]["Waterfall"]["SealedKatana"]["Hitbox"]["CFrame"], 1.5)
						for L_552_forvar0, L_553_forvar1 in pairs(L_1_[35]["Character"]:GetChildren()) do
							local L_554_ = {}
							L_554_[2], L_554_[3] = L_552_forvar0, L_553_forvar1
							if L_554_[3]:IsA("Tool") then
								L_554_[3]["Parent"] = L_1_[35]["Backpack"]
							end
						end
						fireclickdetector(L_1_[19]["Map"]["Waterfall"]["SealedKatana"]["Hitbox"]["ClickDetector"], 1)
					end
				else
					L_1_[31](L_1_[19]["Map"]["Waterfall"]["SealedKatana"]["Hitbox"]["CFrame"], 1.5)
				end
			elseif Quest == "Quest Electric Claw" then
				if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw", true) == "Nah." or L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw", true) == 4 then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw", "Start")
					L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"] = CFrame["new"](-12548, 337, -7481)
				elseif L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw", true) == 3 or L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyElectricClaw", true) == 0 then
					Electric_Claw_C = true
				end
			elseif Quest == "Venom Bow" then
				if not L_1_[45]["CheckBoss"]("Hydra Leader") then
					return
				end
				repeat
					L_1_[45]["wt"]()
					if L_1_[45]["ffc"](L_1_[40], "Hydra Leader") then
						for L_555_forvar0, L_556_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_557_ = {}
							L_557_[2], L_557_[1] = L_555_forvar0, L_556_forvar1
							if L_557_[1]["Name"] == "Hydra Leader" and L_557_[1]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									L_1_[31](L_557_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_557_[1]["Parent"] or L_557_[1]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Hydra Leader")
							end
						end
					elseif L_1_[45]["ffc"](L_1_[7], "Hydra Leader") then
						for L_558_forvar0, L_559_forvar1 in pairs(L_1_[7]:GetChildren()) do
							local L_560_ = {}
							L_560_[1], L_560_[2] = L_558_forvar0, L_559_forvar1
							if L_560_[2]["Name"] == "Hydra Leader" and L_560_[2]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									L_1_[31](L_560_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_560_[2]["Parent"] or L_560_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Hydra Leader")
							end
						end
					end
				until not L_1_[45]["CheckBoss"]("Hydra Leader")
			elseif Quest == "Godhuman" then
				if L_1_[45]["CheckItem"]("Fish Tail") >= 20 and (L_1_[45]["CheckItem"]("Magma Ore") >= 20 and (L_1_[45]["CheckItem"]("Mystic Droplet") >= 10 and L_1_[45]["CheckItem"]("Dragon Scale") >= 10)) then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyGodhuman", true)
					Godhuman = true
				elseif L_1_[45]["CheckItem"]("Fish Tail") < 20 or L_1_[45]["CheckItem"]("Magma Ore") < 20 or L_1_[45]["CheckItem"]("Mystic Droplet") < 10 or L_1_[45]["CheckItem"]("Dragon Scale") < 10 then
					local L_561_ = {}
					L_561_[5] = nil
					L_561_[4] = nil
					L_561_[3] = nil
					L_561_[2] = nil
					if L_1_[45]["CheckItem"]("Fish Tail") < 20 then
						L_561_[5] = "Fishman Warrior"
						L_561_[4] = "Fishman Commando"
						L_561_[3] = CFrame["new"](60946.6094, 65.6735229, 1525.91687)
						L_561_[2] = CFrame["new"](61902.7383, 32.4828358, 1478.33936)
						if ((CFrame["new"](61164, 12, 1820))["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] >= 2000 then
							L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"] = CFrame["new"](61164, 12, 1820)
						end
						if not Old_World then
							L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelMain")
							TleP = true
							L_1_[45]["wt"](50)
						end
					elseif L_1_[45]["CheckItem"]("Magma Ore") < 20 then
						L_561_[5] = "Magma Ninja"
						L_561_[4] = "Lava Pirate"
						L_561_[3] = CFrame["new"](-5466.06445, 77.6952019, -5837.42822)
						L_561_[2] = CFrame["new"](-5169.71729, 54.1234779, -4669.73633)
						if not New_World then
							L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelDressrosa")
							TleP = true
							L_1_[45]["wt"](50)
						end
					elseif L_1_[45]["CheckItem"]("Mystic Droplet") < 10 then
						L_561_[5] = "Sea Soldier"
						L_561_[4] = "Water Fighter"
						L_561_[3] = CFrame["new"](-3115.78223, 63.8785706, -9808.38574)
						L_561_[2] = CFrame["new"](-3212.99683, 263.809296, -10551.8799)
						if not New_World then
							L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelDressrosa")
							TleP = true
							L_1_[45]["wt"](50)
						end
					elseif L_1_[45]["CheckItem"]("Dragon Scale") < 10 then
						L_561_[5] = "Dragon Crew Warrior"
						L_561_[4] = "Dragon Crew Archer"
						L_561_[3] = CFrame["new"](6241.9951171875, 51.522083282471, -1243.9771728516)
						L_561_[2] = CFrame["new"](6488.9155273438, 383.38375854492, -110.66246032715)
						if not Three_World then
							L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelZou")
							TleP = true
							L_1_[45]["wt"](50)
						end
					end
					if L_561_[5] ~= nil then
						repeat
							L_1_[45]["wt"]()
							L_1_[31](L_561_[3])
						until (L_561_[3]["Position"] - game["Players"]["LocalPlayer"]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3
						if L_1_[45]["ffc"](L_1_[40], L_561_[5]) then
							for L_562_forvar0, L_563_forvar1 in pairs(game["Workspace"]["Enemies"]:GetChildren()) do
								local L_564_ = {}
								L_564_[2], L_564_[3] = L_562_forvar0, L_563_forvar1
								if L_564_[3]["Name"] == L_561_[5] and L_564_[3]["Humanoid"]["Health"] > 0 then
									StatrMagnet = true
									repeat
										L_1_[45]["wt"]()
										L_1_[31](L_564_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 20, 0), 1.5)
										L_1_[14]()
										L_1_[45]["BN"](L_564_[3]["Name"])
									until not L_564_[3]["Parent"] or L_564_[3]["Humanoid"]["Health"] <= 0
									StatrMagnet = false
								end
							end
						end
					end
					if L_561_[4] ~= nil then
						repeat
							L_1_[45]["wt"]()
							L_1_[31](L_561_[2], 1.5)
						until (L_561_[2]["Position"] - game["Players"]["LocalPlayer"]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3
						if game["Workspace"]["Enemies"]:FindFirstChild(L_561_[4]) then
							for L_565_forvar0, L_566_forvar1 in pairs(game["Workspace"]["Enemies"]:GetChildren()) do
								local L_567_ = {}
								L_567_[2], L_567_[3] = L_565_forvar0, L_566_forvar1
								if L_567_[3]["Name"] == L_561_[4] and L_567_[3]["Humanoid"]["Health"] > 0 then
									StatrMagnet = true
									repeat
										L_1_[45]["wt"]()
										L_1_[31](L_567_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 20, 0), 1.5)
										L_1_[14]()
										L_1_[45]["BN"](L_567_[3]["Name"])
									until not L_567_[3]["Parent"] or L_567_[3]["Humanoid"]["Health"] <= 0
									StatrMagnet = false
								end
							end
						end
					end
				end
			elseif Quest == "Longma" then
				repeat
					L_1_[45]["wt"]()
					if L_1_[45]["ffc"](L_1_[40], "Longma") then
						for L_568_forvar0, L_569_forvar1 in pairs(L_1_[40]:GetChildren()) do
							local L_570_ = {}
							L_570_[3], L_570_[2] = L_568_forvar0, L_569_forvar1
							if L_570_[2]["Name"] == "Longma" and L_570_[2]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									L_1_[31](L_570_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_570_[2]["Parent"] or L_570_[2]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Longma")
							end
						end
					elseif L_1_[45]["ffc"](L_1_[7], "Longma") then
						for L_571_forvar0, L_572_forvar1 in pairs(L_1_[7]:GetChildren()) do
							local L_573_ = {}
							L_573_[2], L_573_[3] = L_571_forvar0, L_572_forvar1
							if L_573_[3]["Name"] == "Longma" and L_573_[3]["Humanoid"]["Health"] > 0 then
								repeat
									L_1_[45]["wt"]()
									L_1_[31](L_573_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
									if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
									end
									L_1_[14]()
								until not L_573_[3]["Parent"] or L_573_[3]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"] or not L_1_[45]["CheckBoss"]("Longma")
							end
						end
					else
						L_1_[45]["HopLowServer"](3)
						L_1_[45]["wt"](.2)
						L_1_[35]:Kick("Hop")
						L_1_[45]["wt"](.1)
						L_1_[10]:Teleport(L_1_[30], L_1_[35])
					end
				until not L_1_[45]["CheckBoss"]("Longma")
			elseif Quest == "Soul Guitar" then
				if L_1_[45]["CheckItem"]("Bones") < 500 then
					if Three_World then
						L_1_[45]["FarmBone"](false)
					else
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelZou")
						TleP = true
						wait(50)
					end
				elseif L_1_[45]["CheckItem"]("Ectoplasm") < 250 then
					if New_World then
						if (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - Vector3["new"](921.30249023438, 125.400390625, 32937.34375))["Magnitude"] >= 3000 then
							repeat
								L_1_[45]["wt"]()
								L_1_[31](CFrame["new"](921.30249023438, 125.400390625, 32937.34375), 1.5)
							until (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - Vector3["new"](921.30249023438, 125.400390625, 32937.34375))["Magnitude"] <= 3
						elseif (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - Vector3["new"](921.30249023438, 125.400390625, 32937.34375))["Magnitude"] < 3000 then
							Monster = nil
							for L_574_forvar0 = 1500, 0, -300 do
								local L_575_ = {}
								L_575_[2] = L_574_forvar0
								L_1_[45]["GetMonster"](L_575_[2])
							end
							if Monster ~= nil and Monster["Humanoid"]["Health"] > 0 then
								PosMon_X = Monster["HumanoidRootPart"]["CFrame"]
								StatrMagnet = true
								repeat
									wait()
									L_1_[31](Monster["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 20, 0), 1.5)
									L_1_[14]()
								until not Monster["Parent"] or Monster["Humanoid"]["Health"] <= 0
								StatrMagnet = false
							elseif Monster == nil then
								for L_576_forvar0 = 1500, 0, -300 do
									local L_577_ = {}
									L_577_[2] = L_576_forvar0
									L_1_[45]["GetMonster"](L_577_[2])
								end
								if Monster == nil then
									L_1_[31](CFrame["new"](921.30249023438, 125.400390625, 32937.34375), 1.5)
								end
							end
						end
					else
						L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelDressrosa")
						TleP = true
						wait(50)
					end
				elseif not Three_World then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("TravelZou")
					TleP = true
					wait(50)
				else
					if tostring((game:GetService("Workspace"))["Map"]["Haunted Castle"]["SwampWater"]["BrickColor"]) == "Maroon" then
						if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("GuitarPuzzleProgress", "Check") ~= nil and (L_1_[7]["Remotes"]["CommF_"]:InvokeServer("GuitarPuzzleProgress", "Check"))["Swamp"] == false then
							repeat
								wait()
								L_1_[31](CFrame["new"](-10147.779296875, 138.6266784668, 5939.5600585938), 1.5)
							until (Vector3["new"](-10147.779296875, 138.6266784668, 5939.5600585938) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3
							wait(1)
							get_mon = {}
							L_1_[45]["GetMon_Soul"]()
							if #get_mon >= 6 then
								for L_578_forvar0, L_579_forvar1 in pairs(L_1_[35]["Character"]:GetChildren()) do
									local L_580_ = {}
									L_580_[3], L_580_[2] = L_578_forvar0, L_579_forvar1
									if L_580_[2]:IsA("Tool") then
										L_580_[2]["Parent"] = L_1_[35]["Backpack"]
									end
								end
								L_1_[31](CFrame["new"](-10147.779296875, 158.6266784668, 5939.5600585938), 1.5)
								for L_581_forvar0, L_582_forvar1 in next, (game:GetService("Workspace"))["Enemies"]:GetChildren() do
									local L_583_ = {}
									L_583_[2], L_583_[1] = L_581_forvar0, L_582_forvar1
									if (L_583_[1]["HumanoidRootPart"]["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 500 then
										L_583_[1]["HumanoidRootPart"]["CFrame"] = L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 0, 20)
										sethiddenproperty(L_1_[35], "SimulationRadius", math["huge"])
									end
								end
								wait(1)
								L_1_[14]()
								wait(2)
							end
						end
					elseif L_1_[7]["Remotes"]["CommF_"]:InvokeServer("GuitarPuzzleProgress", "Check") ~= nil then
						local L_584_ = {}
						L_584_[2] = L_1_[7]["Remotes"]["CommF_"]:InvokeServer("GuitarPuzzleProgress", "Check")
						if not Quest_Soul_Guitar then
							repeat
								wait(.1)
								L_1_[31](CFrame["new"](-9680.7412109375, 6.1591067314148, 6346.1552734375), 1.5)
							until (Vector3["new"](-9680.7412109375, 6.1591067314148, 6346.1552734375) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 5
							wait(1)
							for L_585_forvar0, L_586_forvar1 in pairs(L_1_[7]["Remotes"]["CommF_"]:InvokeServer("GuitarPuzzleProgress", "Check")) do
								local L_587_ = {}
								L_587_[3], L_587_[1] = L_585_forvar0, L_586_forvar1
								if L_587_[1] == false then
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("GuitarPuzzleProgress", L_587_[3])
								end
							end
							wait(2)
							for L_588_forvar0, L_589_forvar1 in pairs(L_1_[7]["Remotes"]["CommF_"]:InvokeServer("GuitarPuzzleProgress", "Check")) do
								local L_590_ = {}
								L_590_[3], L_590_[1] = L_588_forvar0, L_589_forvar1
								if L_590_[1] == false then
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("GuitarPuzzleProgress", L_590_[3])
								end
							end
							wait(1)
							Quest_Soul_Guitar = true
						end
					elseif tostring((game:GetService("Workspace"))["Map"]["Haunted Castle"]["SwampWater"]["BrickColor"]) ~= "Maroon" then
						if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("gravestoneEvent", 2) == true then
							L_1_[7]["Remotes"]["CommF_"]:InvokeServer("gravestoneEvent", 2, true)
						else
							L_1_[31](CFrame["new"](-8652.6416015625, 141.10939025879, 6168.810546875), 1.5)
						end
					end
				end
			elseif Quest == "RGB" then
				local L_591_ = {}
				L_591_[1] = nil
				if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("HornedMan", "Bet") == nil then
					if L_1_[35]["PlayerGui"]["Main"]["Quest"]["Visible"] then
						local L_592_ = {}
						L_592_[1] = (game:GetService("Players"))["LocalPlayer"]["PlayerGui"]["Main"]["Quest"]["Container"]["QuestTitle"]["Title"]["Text"]
						if string["find"](L_592_[1], "Stone") then
							if L_1_[45]["ffc"](L_1_[40], "Stone") or L_1_[45]["ffc"](L_1_[7], "Stone") then
								L_591_[1] = "Stone"
							end
						end
						if string["find"](L_592_[1], "Hydra Leader") then
							if L_1_[45]["ffc"](L_1_[40], "Hydra Leader") or L_1_[45]["ffc"](L_1_[7], "Hydra Leader") then
								L_591_[1] = "Hydra Leader"
							end
						end
						if string["find"](L_592_[1], "Kilo Admiral") then
							if L_1_[45]["ffc"](L_1_[40], "Kilo Admiral") or L_1_[45]["ffc"](L_1_[7], "Kilo Admiral") then
								L_591_[1] = "Kilo Admiral"
							end
						end
						if string["find"](L_592_[1], "Captain Elephant") then
							if L_1_[45]["ffc"](L_1_[40], "Captain Elephant") or L_1_[45]["ffc"](L_1_[7], "Captain Elephant") then
								L_591_[1] = "Captain Elephant"
							end
						end
						if string["find"](L_592_[1], "Beautiful Pirate") then
							if L_1_[45]["ffc"](L_1_[40], "Beautiful Pirate") or L_1_[45]["ffc"](L_1_[7], "Beautiful Pirate") then
								L_591_[1] = "Beautiful Pirate"
							end
						end
						if L_591_[1] ~= nil then
							if L_1_[45]["ffc"](L_1_[40], L_591_[1]) then
								for L_593_forvar0, L_594_forvar1 in pairs(L_1_[40]:GetChildren()) do
									local L_595_ = {}
									L_595_[2], L_595_[3] = L_593_forvar0, L_594_forvar1
									if L_595_[3]["Name"] == L_591_[1] and L_595_[3]["Humanoid"]["Health"] > 0 then
										repeat
											L_1_[45]["wt"]()
											L_1_[31](L_595_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
											if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
											end
											L_1_[14]()
										until not L_595_[3]["Parent"] or L_595_[3]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"]
									end
								end
							elseif L_1_[45]["ffc"](L_1_[7], L_591_[1]) then
								for L_596_forvar0, L_597_forvar1 in pairs(L_1_[7]:GetChildren()) do
									local L_598_ = {}
									L_598_[3], L_598_[1] = L_596_forvar0, L_597_forvar1
									if L_598_[1]["Name"] == L_591_[1] and L_598_[1]["Humanoid"]["Health"] > 0 then
										repeat
											L_1_[45]["wt"]()
											L_1_[31](L_598_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 40, 0), 1.5)
											if not L_1_[45]["ffc"](L_1_[35]["Character"], "HasBuso") then
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Buso")
											end
											L_1_[14]()
										until not L_598_[1]["Parent"] or L_598_[1]["Humanoid"]["Health"] <= 0 or not(getgenv())["AutoFarm"]
									end
								end
							end
						else
							if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("HornedMan", "Bet") == 1 then
								return
							else
								L_1_[35]:Kick("Hop")
								L_1_[45]["wt"](.1)
								L_1_[10]:Teleport(L_1_[30], L_1_[35])
							end
						end
					end
				elseif L_1_[7]["Remotes"]["CommF_"]:InvokeServer("HornedMan", "Bet") == 1 then
					return
				end
			elseif Quest == "Pull Lerver" then
				if not ExSeb then
					if (game:GetService("ReplicatedStorage"))["Remotes"]["CommF_"]:InvokeServer("RaceV4Progress", "Check") == 1 then
						local L_599_ = {}
						L_599_[1] = {
							[1] = "RaceV4Progress";
							[2] = "Check"
						};
						(game:GetService("ReplicatedStorage"))["Remotes"]["CommF_"]:InvokeServer(unpack(L_599_[1]))
						L_599_[3] = {
							[1] = "RaceV4Progress";
							[2] = "Begin"
						};
						(((game:GetService("ReplicatedStorage")):WaitForChild("Remotes")):WaitForChild("CommF_")):InvokeServer(unpack(L_599_[3]))
					elseif (game:GetService("ReplicatedStorage"))["Remotes"]["CommF_"]:InvokeServer("RaceV4Progress", "Check") == 2 then
						local L_600_ = {}
						L_600_[1] = {
							[1] = "RaceV4Progress",
							[2] = "Check"
						};
						(game:GetService("ReplicatedStorage"))["Remotes"]["CommF_"]:InvokeServer(unpack(L_600_[1]))
						repeat
							local L_601_ = {}
							wait()
							game["Players"]["LocalPlayer"]["Character"]["HumanoidRootPart"]["CFrame"] = CFrame["new"](2959.87231, 2282.42139, -7216.23193)
							L_601_[1] = {
								[1] = "RaceV4Progress",
								[2] = "Teleport"
							};
							(game:GetService("ReplicatedStorage"))["Remotes"]["CommF_"]:InvokeServer(unpack(L_601_[1]))
						until (game["Players"]["LocalPlayer"]["Character"]["HumanoidRootPart"]["Position"] - Vector3["new"](28286.35546875, 14896.5078125, 102.62469482422))["Magnitude"] <= 15
					elseif (game:GetService("ReplicatedStorage"))["Remotes"]["CommF_"]:InvokeServer("RaceV4Progress", "Check") == 3 then
						ExSeb = true
						if not ujihfdg then
							local L_602_ = {}
							L_602_[3] = {
								[1] = "RaceV4Progress";
								[2] = "Check"
							};
							(game:GetService("ReplicatedStorage"))["Remotes"]["CommF_"]:InvokeServer(unpack(L_602_[3]))
							wait(1)
							L_602_[2] = {
								[1] = "RaceV4Progress";
								[2] = "Continue"
							};
							(game:GetService("ReplicatedStorage"))["Remotes"]["CommF_"]:InvokeServer(unpack(L_602_[2]))
							ujihfdg = true
						end
					elseif (game:GetService("ReplicatedStorage"))["Remotes"]["CommF_"]:InvokeServer("RaceV4Progress", "Check") == 4 then
						ExSeb = true
					end
				else
					if (game:GetService("Workspace"))["Map"]:FindFirstChild("MysticIsland") then
						if L_1_[35]["Character"]["Humanoid"]["Sit"] == true then
							L_1_[35]["Character"]["Humanoid"]["Sit"] = false
							wait(.5)
							L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"] = L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 15, 0)
							wait(1)
						else
							local L_603_ = {}
							L_603_[1] = ((game:GetService("Workspace"))["Map"]:FindFirstChild("MysticIsland"))["WorldPivot"] * CFrame["new"](0, 500, 0)
							if (L_603_[1]["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 25 then
								task["spawn"](function()
									repeat
										wait(.2)
										L_1_[19]["CurrentCamera"]["CFrame"] = CFrame["lookAt"](L_1_[19]["CurrentCamera"]["CFrame"]["Position"], L_1_[16]:GetMoonDirection() + L_1_[19]["CurrentCamera"]["CFrame"]["Position"])
									until StopCamera or not(game:GetService("Workspace"))["Map"]:FindFirstChild("MysticIsland") or L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CheckTempleDoor")
								end);
								((L_1_[7]:WaitForChild("Remotes")):WaitForChild("CommE")):FireServer("ActivateAbility")
								wait(17)
								for L_604_forvar0, L_605_forvar1 in pairs((game:GetService("Workspace"))["Map"]["MysticIsland"]:GetChildren()) do
									local L_606_ = {}
									L_606_[3], L_606_[1] = L_604_forvar0, L_605_forvar1
									if L_606_[1]["ClassName"] == "MeshPart" and (L_606_[1]["Name"] == "Part" and L_606_[1]["Transparency"] == 0) then
										repeat
											wait(.2)
											StopCamera = true
											L_1_[31](L_606_[1]["CFrame"], 1.5)
											wait(.5)
											L_1_[2]:SendKeyEvent(true, "Space", false, game)
											wait(.5)
											L_1_[2]:SendKeyEvent(false, "Space", false, game)
										until L_606_[1]["Transparency"] == 1 or not(game:GetService("Workspace"))["Map"]:FindFirstChild("MysticIsland") or L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CheckTempleDoor")
										wait(.5)
									end
								end
							else
								L_1_[31](L_603_[1], 1.5)
							end
						end
					end
				end
			elseif Quest == "Cursed Dual Katana" then
				if L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CDKQuest", "OpenDoor") == "opened" then
					local L_607_ = {}
					L_607_[2] = L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CDKQuest", "Progress")
					if L_607_[2]["Good"] == 0 or L_607_[2]["Good"] == -3 then
						CDK_Q_S_C = 3
						if L_607_[2]["Good"] == 0 then
							L_1_[45]["GetQuest"]("Good")
						elseif L_607_[2]["Good"] == -3 then
							repeat
								wait()
								L_1_[31](CFrame["new"](-4600.37, 15.1245, -2881.18), 1.5)
								if (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - Vector3["new"](-4600.37, 15.1245, -2881.18))["Magnitude"] <= 3 then
									wait(1)
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CDKQuest", "BoatQuest", L_1_[25]["NPCs"]:FindFirstChild("Luxury Boat Dealer"), "Check")
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("GetUnlockables")
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CDKQuest", "BoatQuest", L_1_[25]["NPCs"]:FindFirstChild("Luxury Boat Dealer"))
									wait(.5)
									Q_Boat_1 = true
								end
							until Q_Boat_1
							repeat
								wait()
								L_1_[31](CFrame["new"](-2068.63, 3.37222, -9887.08), 1.5)
								if (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - Vector3["new"](-2068.63, 3.37222, -9887.08))["Magnitude"] <= 3 then
									wait(1)
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CDKQuest", "BoatQuest", L_1_[25]["NPCs"]:FindFirstChild("Luxury Boat Dealer"), "Check")
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("GetUnlockables")
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CDKQuest", "BoatQuest", L_1_[25]["NPCs"]:FindFirstChild("Luxury Boat Dealer"))
									wait(.5)
									Q_Boat_2 = true
								end
							until Q_Boat_2
							repeat
								wait()
								L_1_[31](CFrame["new"](-9531.19, 5.91675, -8377.75), 1.5)
								if (L_1_[35]["Character"]["HumanoidRootPart"]["Position"] - Vector3["new"](-9531.19, 5.91675, -8377.75))["Magnitude"] <= 3 then
									wait(1)
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CDKQuest", "BoatQuest", L_1_[25]["NPCs"]:FindFirstChild("Luxury Boat Dealer"), "Check")
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("GetUnlockables")
									L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CDKQuest", "BoatQuest", L_1_[25]["NPCs"]:FindFirstChild("Luxury Boat Dealer"))
									wait(.5)
									Q_Boat_3 = true
								end
							until Q_Boat_3
							Q_Boat_1 = false
							Q_Boat_2 = false
							Q_Boat_3 = false
						end
					elseif L_607_[2]["Evil"] == 0 or L_607_[2]["Evil"] == -3 then
						CDK_Q_S_C = 4
						if L_607_[2]["Evil"] == 0 then
							L_1_[45]["GetQuest"]("Evil")
						elseif L_607_[2]["Evil"] == -3 then
							Stop_Fast_Attack = true
							for L_608_forvar0, L_609_forvar1 in pairs(L_1_[40]:GetChildren()) do
								local L_610_ = {}
								L_610_[2], L_610_[3] = L_608_forvar0, L_609_forvar1
								if L_610_[3]:FindFirstChild("HumanoidRootPart") and (L_610_[3]["HumanoidRootPart"]["Position"] - Vector3["new"](-13347.6982, 332.378143, -7652.27783))["Magnitude"] > 10 then
									L_610_[3]["HumanoidRootPart"]["CFrame"] = CFrame["new"](-13347.6982, 332.378143, -7652.27783)
									sethiddenproperty(L_1_[35], "SimulationRadius", math["huge"])
								end
							end
							L_1_[31](CFrame["new"](-13347.6982, 332.378143, -7652.27783, -0.97929436, 4.50812898e-08, -0.202441484, 4.58302409e-08, 1, 9.8789521e-10, .202441484, -8.31050162e-09, -0.97929436), 1.5)
						end
					elseif L_607_[2]["Evil"] == 1 or L_607_[2]["Evil"] == -4 then
						Stop_Fast_Attack = false
						CDK_Q_S_C = 5
						if L_607_[2]["Evil"] == 1 then
							L_1_[45]["GetQuest"]("Evil")
						elseif L_607_[2]["Evil"] == -4 then
							if L_1_[45]["ffc"](L_1_[35], "QuestHaze") then
								if Quest_Kill == nil then
									for L_611_forvar0, L_612_forvar1 in pairs(L_1_[35]["QuestHaze"]:GetChildren()) do
										local L_613_ = {}
										L_613_[2], L_613_[1] = L_611_forvar0, L_612_forvar1
										if tonumber(L_613_[1]["Value"]) > 0 and Quest_Kill == nil then
											SelectMonster = L_613_[1]["Name"]
											CFrameMon = nil
											CheckLevel2()
											if CFrameMon ~= nil then
												Quest_Kill = L_613_[1]["Name"]
											end
										end
									end
								elseif L_1_[45]["ffc"](L_1_[35]["QuestHaze"], Quest_Kill) and tonumber((L_1_[35]["QuestHaze"]:FindFirstChild(Quest_Kill))["Value"]) <= 0 then
									Quest_Kill = nil
								elseif L_1_[45]["ffc"](L_1_[35]["QuestHaze"], Quest_Kill) and tonumber((L_1_[35]["QuestHaze"]:FindFirstChild(Quest_Kill))["Value"]) > 0 then
									for L_614_forvar0, L_615_forvar1 in pairs(L_1_[40]:GetChildren()) do
										local L_616_ = {}
										L_616_[1], L_616_[2] = L_614_forvar0, L_615_forvar1
										if L_616_[2]:FindFirstChild("Humanoid") and (L_616_[2]["Humanoid"]["Health"] > 0 and L_616_[2]:FindFirstChild("HazeESP")) then
											repeat
												wait(.1)
												L_1_[31](L_616_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 25, 0), 1.5)
												L_1_[14]()
											until not L_616_[2]["Parent"] or L_616_[2]["Humanoid"]["Health"] <= 0
										end
									end
									L_1_[31](CFrameMon, 1.5)
								else
									Quest_Kill = nil
								end
							end
						end
					elseif L_607_[2]["Good"] == 1 or L_607_[2]["Good"] == -4 then
						CDK_Q_S_C = 6
						if L_607_[2]["Good"] == 1 then
							L_1_[45]["GetQuest"]("Good")
						elseif L_607_[2]["Good"] == -4 then
							L_1_[31](CFrame["new"](-5543.0805664062, 313.76550292969, -2969.4846191406), 1.5)
							if (Vector3["new"](-5543.0805664062, 313.76550292969, -2969.4846191406) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 1500 then
								for L_617_forvar0, L_618_forvar1 in pairs(L_1_[40]:GetChildren()) do
									local L_619_ = {}
									L_619_[3], L_619_[1] = L_617_forvar0, L_618_forvar1
									if L_619_[1]:FindFirstChild("Humanoid") and (L_619_[1]["Humanoid"]["Health"] > 0 and (L_619_[1]["HumanoidRootPart"]["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 1500) then
										repeat
											wait(.3)
											L_1_[14]()
											L_1_[31](L_619_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
										until not L_619_[1]["Parent"] or L_619_[1]["Humanoid"]["Health"] <= 0
									end
								end
							end
						end
					elseif L_607_[2]["Good"] == 2 or L_607_[2]["Good"] == -5 then
						CDK_Q_S_C = 7
						if L_607_[2]["Good"] == 2 then
							L_1_[45]["GetQuest"]("Good")
						elseif L_607_[2]["Good"] == -5 then
							if not Kill_Boss_Cake then
								if L_1_[45]["ffc"](L_1_[40], "Cake Queen") then
									for L_620_forvar0, L_621_forvar1 in pairs(L_1_[40]:GetChildren()) do
										local L_622_ = {}
										L_622_[3], L_622_[2] = L_620_forvar0, L_621_forvar1
										if L_622_[2]["Name"] == "Cake Queen" and (L_622_[2]["Humanoid"]["Health"] > 0 and not Kill_Boss_Cake) then
											repeat
												wait(.3)
												if L_1_[45]["ffc"](L_622_[2], "HumanoidRootPart") then
													L_1_[31](L_622_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
													L_1_[14]()
												else
													break
												end
											until not L_622_[2]["Parent"] or L_622_[2]["Humanoid"]["Health"] <= 0
											Kill_Boss_Cake = true
											wait(1)
										end
									end
								else
									L_1_[31](CFrame["new"](-714.643066, 381.565613, -11021.0566), 1.5)
								end
							else
								if L_1_[19]["Map"]:FindFirstChild("HeavenlyDimension") then
									if not Ceyma_HeavenlyDimension then
										repeat
											wait(.1)
											L_1_[31]((L_1_[19]["Map"]:FindFirstChild("HeavenlyDimension"))["WorldPivot"], 1.5)
										until ((L_1_[19]["Map"]:FindFirstChild("HeavenlyDimension"))["WorldPivot"]["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 5
										wait(1)
										Ceyma_HeavenlyDimension = true
									elseif Ceyma_HeavenlyDimension then
										L_1_[14]()
										if L_1_[40]:FindFirstChildOfClass("Model") then
											for L_623_forvar0, L_624_forvar1 in pairs(L_1_[40]:GetChildren()) do
												local L_625_ = {}
												L_625_[3], L_625_[2] = L_623_forvar0, L_624_forvar1
												if L_625_[2]:FindFirstChild("HumanoidRootPart") and (L_625_[2]:FindFirstChild("Humanoid") and ((L_1_[19]["Map"]:FindFirstChild("HeavenlyDimension"))["WorldPivot"]["Position"] - L_625_[2]["HumanoidRootPart"]["Position"])["Magnitude"] <= 1000) then
													if L_625_[2]["Humanoid"]["Health"] > 0 then
														repeat
															wait()
															L_1_[31](L_625_[2]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
															L_1_[14]()
														until not L_625_[2]["Parent"] or L_625_[2]["Humanoid"]["Health"] <= 0
													end
												end
											end
										elseif not L_1_[40]:FindFirstChildOfClass("Model") then
											L_1_[45]["GetTorch"]("Torch1")
											if not L_1_[40]:FindFirstChildOfClass("Model") then
												L_1_[45]["GetTorch"]("Torch2")
												if not L_1_[40]:FindFirstChildOfClass("Model") then
													L_1_[45]["GetTorch"]("Torch3")
													if not L_1_[40]:FindFirstChildOfClass("Model") and L_1_[19]["Map"]:FindFirstChild("HeavenlyDimension") then
														L_1_[19]["Map"]["HeavenlyDimension"]["Exit"]["CFrame"] = L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"]
														wait(1)
													end
												end
											end
										end
									end
								elseif not L_1_[19]["Map"]:FindFirstChild("HeavenlyDimension") then
									wait(5)
									if not L_1_[19]["Map"]:FindFirstChild("HeavenlyDimension") then
										Kill_Boss_Cake = false
									end
								end
							end
						end
					elseif L_607_[2]["Evil"] == 2 or L_607_[2]["Evil"] == -5 then
						CDK_Q_S_C = 8
						if L_607_[2]["Evil"] == 2 then
							L_1_[45]["GetQuest"]("Evil")
						elseif L_607_[2]["Evil"] == -5 then
							if L_1_[19]["Map"]:FindFirstChild("HellDimension") then
								if ((L_1_[19]["Map"]:FindFirstChild("HellDimension"))["WorldPivot"]["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] > 1200 then
									repeat
										wait(.1)
										L_1_[31]((L_1_[19]["Map"]:FindFirstChild("HellDimension"))["WorldPivot"], 1.5)
									until ((L_1_[19]["Map"]:FindFirstChild("HellDimension"))["WorldPivot"]["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 10
									wait(1)
								elseif ((L_1_[19]["Map"]:FindFirstChild("HellDimension"))["WorldPivot"]["Position"] - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 1200 then
									L_1_[14]()
									if L_1_[40]:FindFirstChildOfClass("Model") then
										for L_626_forvar0, L_627_forvar1 in pairs(L_1_[40]:GetChildren()) do
											local L_628_ = {}
											L_628_[2], L_628_[1] = L_626_forvar0, L_627_forvar1
											if L_628_[1]:FindFirstChild("HumanoidRootPart") and (L_628_[1]:FindFirstChild("Humanoid") and ((L_1_[19]["Map"]:FindFirstChild("HellDimension"))["WorldPivot"]["Position"] - L_628_[1]["HumanoidRootPart"]["Position"])["Magnitude"] <= 1000) then
												if L_628_[1]["Humanoid"]["Health"] > 0 then
													repeat
														wait()
														L_1_[31](L_628_[1]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
														L_1_[14]()
													until not L_628_[1]["Parent"] or L_628_[1]["Humanoid"]["Health"] <= 0
												end
											end
										end
									elseif not L_1_[40]:FindFirstChildOfClass("Model") then
										L_1_[45]["GetTorchX"]("Torch1")
										if not L_1_[40]:FindFirstChildOfClass("Model") then
											L_1_[45]["GetTorchX"]("Torch2")
											if not L_1_[40]:FindFirstChildOfClass("Model") then
												L_1_[45]["GetTorchX"]("Torch3")
												if not L_1_[40]:FindFirstChildOfClass("Model") and L_1_[19]["Map"]:FindFirstChild("HellDimension") then
													L_1_[19]["Map"]["HellDimension"]["Exit"]["CFrame"] = L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"]
													wait(1)
												end
											end
										end
									end
								end
							elseif not L_1_[19]["Map"]:FindFirstChild("HellDimension") then
								if L_1_[40]:FindFirstChild("Soul Reaper") or game["ReplicatedStorage"]:FindFirstChild("Soul Reaper") then
									Stop_Fast_Attack = true
									if not L_1_[40]:FindFirstChild("Soul Reaper") and game["ReplicatedStorage"]:FindFirstChild("Soul Reaper") then
										repeat
											wait(.2)
											L_1_[31]((game["ReplicatedStorage"]:FindFirstChild("Soul Reaper"))["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
										until L_1_[40]:FindFirstChild("Soul Reaper")
										wait(1)
									end
									if L_1_[40]:FindFirstChild("Soul Reaper") then
										L_1_[31]((L_1_[40]:FindFirstChild("Soul Reaper"))["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 0, 2), 1.5)
										wait(1)
									end
								elseif L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Bones", "Check") > 0 and L_1_[45]["CheckItem"]("Bones") > 500 then
									repeat
										wait(.2)
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Bones", "Check")
										L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Bones", "Buy", 1, 1)
									until L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Bones", "Check") == 0
									wait(1)
									if not Dragon_Talon_C then
										if L_1_[45]["ffc"](L_1_[35]["Backpack"], "Fire Essence") or L_1_[45]["ffc"](L_1_[35]["Character"], "Fire Essence") then
											repeat
												L_1_[45]["Status"](L_1_[3]({
													" Status : Use Fire E",
													"ssence"
												}))
												L_1_[45]["Equip"]("Fire Essence")
												L_1_[45]["wt"](.5)
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDragonTalon", true)
												L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDragonTalon")
											until not L_1_[45]["ffc"](L_1_[35]["Backpack"], "Fire Essence") and not L_1_[45]["ffc"](L_1_[35]["Character"], "Fire Essence")
											L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyDragonTalon")
											Dragon_Talon_C = true
										end
									end
									if L_1_[45]["ffc"](L_1_[35]["Backpack"], "Hallow Essence") or L_1_[45]["ffc"](L_1_[35]["Character"], "Hallow Essence") then
										repeat
											L_1_[45]["Status"](L_1_[3]({
												" Status : Use Hallow";
												" Essence"
											}))
											L_1_[45]["Equip"]("Hallow Essence")
											L_1_[31](CFrame["new"](-8932.86, 143.258, 6063.31), 1.5)
										until not L_1_[45]["ffc"](L_1_[35]["Backpack"], "Hallow Essence") and not L_1_[45]["ffc"](L_1_[35]["Character"], "Hallow Essence")
									end
								elseif not L_1_[40]:FindFirstChild("Soul Reaper") and not L_1_[7]:FindFirstChild("Soul Reaper") then
									L_1_[45]["FarmBone"]()
								end
							end
						end
					elseif L_607_[2]["Evil"] == 3 then
						repeat
							wait()
							L_1_[31](CFrame["new"](-12392.2637, 603.319763, -6503.27832), 1.5)
						until (Vector3["new"](-12392.2637, 603.319763, -6503.27832) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 2
						if L_1_[4]:FindFirstChild("     ") then
							L_1_[4]["     "]["Enabled"] = false
						end
						wait(1)
						L_1_[2]:SendKeyEvent(true, "E", false, game)
						wait(1)
						L_1_[2]:SendKeyEvent(false, "E", false, game)
						wait(1)
						L_1_[45]["click"](L_1_[35]["PlayerGui"]["Main"]["Dialogue"])
					elseif L_607_[2]["Good"] == 3 then
						repeat
							wait()
							L_1_[31](CFrame["new"](-12392.5068, 603.319763, -6596.00586), 1.5)
						until (Vector3["new"](-12392.5068, 603.319763, -6596.00586) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 2
						if L_1_[4]:FindFirstChild("     ") then
							L_1_[4]["     "]["Enabled"] = false
						end
						wait(1)
						L_1_[2]:SendKeyEvent(true, "E", false, game)
						wait(1)
						L_1_[2]:SendKeyEvent(false, "E", false, game)
						wait(1)
						L_1_[45]["click"](L_1_[35]["PlayerGui"]["Main"]["Dialogue"])
					elseif L_607_[2]["Good"] == 4 and (L_607_[2]["Evil"] == 4 and L_1_[19]["Map"]["Turtle"]["Cursed"]["BossDoor"]["Position"]["Y"] > 584) then
						L_1_[14]()
						repeat
							wait(.1)
							L_1_[31](CFrame["new"](-12359.1719, 603.319702, -6550.59717, .481593847, 0, -0.87639451, 0, 1, 0, .87639451, 0, .481593847), 1.5)
						until (Vector3["new"](-12359.1719, 603.319702, -6550.59717) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3
						if L_1_[4]:FindFirstChild("     ") then
							L_1_[4]["     "]["Enabled"] = false
						end
						wait(1)
						L_1_[2]:SendKeyEvent(true, "E", false, game)
						wait(1)
						L_1_[2]:SendKeyEvent(false, "E", false, game)
						wait(1)
						L_1_[45]["click"](L_1_[35]["PlayerGui"]["Main"]["Dialogue"])
					elseif L_1_[19]["Map"]["Turtle"]["Cursed"]["BossDoor"]["Position"]["Y"] <= 584 then
						local L_629_ = {}
						if L_1_[4]:FindFirstChild("     ") then
							L_1_[4]["     "]["Enabled"] = true
						end
						L_629_[1] = L_1_[7]["Remotes"]["CommF_"]:InvokeServer("getInventory")
						for L_630_forvar0, L_631_forvar1 in pairs(L_629_[1]) do
							local L_632_ = {}
							L_632_[1], L_632_[3] = L_630_forvar0, L_631_forvar1
							if L_632_[3]["Type"] == "Sword" then
								if L_632_[3]["Name"] == "Cursed Dual Katana" then
									return
								end
							end
						end
						CDK_Q_S_C = 10
						if (Vector3["new"](-12297.5605, 598.726013, -6532.96436) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 100 then
							repeat
								wait()
								L_1_[31](CFrame["new"](-12379.1406, 601.433167, -6543.60742), 1.5)
							until Boss_Extant or (Vector3["new"](-12379.1406, 601.433167, -6543.60742) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3
							repeat
								wait()
								L_1_[31](CFrame["new"](-12330.197265625, 603.31982421875, -6549.1186523438), 1.5)
								for L_633_forvar0, L_634_forvar1 in pairs(L_1_[40]:GetChildren()) do
									local L_635_ = {}
									L_635_[2], L_635_[3] = L_633_forvar0, L_634_forvar1
									if L_635_[3]["Name"] == "Cursed Skeleton Boss" then
										Boss_Extant = true
										L_1_[35]["Character"]["HumanoidRootPart"]["CFrame"] = L_635_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0)
									end
								end
							until Boss_Extant or (Vector3["new"](-12330.197265625, 603.31982421875, -6549.1186523438) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] <= 3
							wait(1)
							for L_636_forvar0, L_637_forvar1 in pairs(L_1_[40]:GetChildren()) do
								local L_638_ = {}
								L_638_[2], L_638_[3] = L_636_forvar0, L_637_forvar1
								if L_638_[3]["Name"] == "Cursed Skeleton Boss" then
									repeat
										wait(.1)
										L_1_[45]["Get_Item_Inventory"]("Tushita")
										L_1_[45]["Equip"]("Tushita")
										L_1_[31](L_638_[3]["HumanoidRootPart"]["CFrame"] * CFrame["new"](0, 30, 0), 1.5)
									until not L_638_[3]["Parent"] or L_638_[3]["Humanoid"]["Health"] <= 0
									for L_639_forvar0, L_640_forvar1 in pairs(L_629_[1]) do
										local L_641_ = {}
										L_641_[2], L_641_[1] = L_639_forvar0, L_640_forvar1
										if L_641_[1]["Type"] == "Sword" then
											if L_641_[1]["Name"] == "Cursed Dual Katana" then
												return
											end
										end
									end
								end
							end
						elseif (Vector3["new"](-12297.5605, 598.726013, -6532.96436) - L_1_[35]["Character"]["HumanoidRootPart"]["Position"])["Magnitude"] > 100 then
							L_1_[31](CFrame["new"](-12297.5605, 598.726013, -6532.96436), 1.5)
						end
					end
				else
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("CDKQuest", "OpenDoor", true)
				end
			end
		end, warn)
	end
end)
task["spawn"](function()
	while L_1_[45]["wt"]() do
		xpcall(function()
			for L_642_forvar0, L_643_forvar1 in pairs(L_1_[40]:GetChildren()) do
				local L_644_ = {}
				L_644_[2], L_644_[1] = L_642_forvar0, L_643_forvar1
				if L_1_[45]["ffc"](L_644_[1], "Humanoid") and (L_644_[1]["Humanoid"]["Health"] <= 0 and L_1_[45]["ffc"](L_644_[1], "HumanoidRootPart")) then
					if L_644_[1]["Humanoid"]["Health"] <= 0 then
						L_644_[1]:Destroy()
					end
				end
			end
			if L_1_[45]["ffc"](L_1_[35]["Character"], "Black Leg") then
				L_1_[2]:SendKeyEvent(true, "V", false, game)
				L_1_[45]["wt"](.1)
				L_1_[2]:SendKeyEvent(false, "V", false, game)
			end
			if L_1_[45]["ffc"](L_1_[35]["Character"], "HumanoidRootPart") and not L_1_[45]["ffc"](L_1_[35]["Character"]["HumanoidRootPart"], "Lock") then
				local L_645_ = {}
				L_645_[1] = L_1_[35]["Character"]:FindFirstChild("Humanoid")
				if L_645_[1] and L_645_[1]["Sit"] then
					L_645_[1]["Sit"] = false
				end
				L_645_[2] = Instance["new"]("BodyVelocity")
				L_645_[2]["Name"] = "Lock"
				L_645_[2]["MaxForce"] = Vector3["new"](1000000000, 1000000000, 1000000000)
				L_645_[2]["Velocity"] = Vector3["new"](0, 0, 0)
				L_645_[2]["P"] = 10000
				L_645_[2]["Parent"] = L_1_[35]["Character"]["HumanoidRootPart"]
			end
		end, warn)
	end
end)
task["spawn"](function()
	while L_1_[45]["wt"](1) do
		pcall(function()
			if not L_1_[45]["ffc"](L_1_[35]["Character"], "Highlight") then
				local L_646_ = {}
				L_646_[1] = Instance["new"]("Highlight")
				L_646_[1]["Name"] = "Highlight"
				L_646_[1]["FillColor"] = Color3["fromRGB"](0, 255, 0)
				L_646_[1]["OutlineColor"] = Color3["fromRGB"](0, 255, 0)
				L_646_[1]["FillTransparency"] = 1
				L_646_[1]["OutlineTransparency"] = 0
				L_646_[1]["Adornee"] = L_1_[35]["Character"]
				L_646_[1]["Parent"] = L_1_[35]["Character"]
			end
		end)
	end
end)
redeem = {
	"Sub2Fer999",
	"Enyu_is_Pro",
	"JCWK",
	"StarcodeHEO",
	"MagicBUS";
	"KittGaming",
	"Sub2CaptainMaui",
	"Sub2OfficialNoobie",
	"TheGreatAce";
	"Sub2NoobMaster123";
	"Sub2Daigrock";
	"Axiore";
	"StrawHatMaine";
	"TantaiGaming",
	"Bluxxy";
	"SUB2GAMERROBOT_EXP1";
	"GAMER_ROBOT_1M";
	"SUBGAMERROBOT_RESET";
	"RESET_5B";
	L_1_[3]({
		"SUB2GAMERROBOT_RESET";
		"1"
	}),
	"Sub2UncleKizaru",
	"ADMIN_TROLL ";
	"DRAGONABUSE ";
	"DEVSCOOKING "
}
task["spawn"](function()
	for L_647_forvar0, L_648_forvar1 in pairs(redeem) do
		local L_649_ = {}
		L_649_[2], L_649_[1] = L_647_forvar0, L_648_forvar1
		L_1_[46]["Remotes"]["Redeem"]:InvokeServer(L_649_[1])
	end
end)
task["spawn"](function()
	while L_1_[45]["wt"](150) do
		L_1_[2]:SendKeyEvent(true, "Space", false, game)
		wait(.5)
		L_1_[2]:SendKeyEvent(false, "Space", false, game)
	end
end)
L_1_[9] = game:GetService("Players")
L_1_[37] = L_1_[9]["LocalPlayer"]
L_1_[44] = function()
	while not L_1_[37]["Character"] or not L_1_[37]["Character"]:FindFirstChild("HumanoidRootPart") do
		task["wait"](.5)
	end
	return L_1_[37]["Character"]:WaitForChild("HumanoidRootPart")
end
L_1_[18] = (L_1_[44]())["Position"]
L_1_[28] = 0
L_1_[36] = 1
task["spawn"](function()
	while task["wait"]() do
		if Quest ~= "Cursed Dual Katana" and (Quest ~= "Evo Race V2" and (Quest ~= "Evo Race V1" and not SROP)) then
			local L_650_ = {}
			task["wait"](L_1_[36])
			L_650_[2] = (L_1_[44]())["Position"]
			L_650_[1] = (L_650_[2] - L_1_[18])["Magnitude"]
			if L_650_[1] <= 1 then
				L_1_[28] = L_1_[28] + L_1_[36]
				if L_1_[28] >= 30 and (Quest ~= "Cursed Dual Katana" and (Quest ~= "Evo Race V2" and (Quest ~= "Evo Race V1" and not SROP))) then
					L_1_[45]["HopLowServer"](9)
				end
			else
				L_1_[28] = 0
				L_1_[18] = L_650_[2]
			end
		end
	end
end)
task["spawn"](function()
	while task["wait"]() do
		if L_1_[25]["Map"]:FindFirstChild("Heavenly") then
			fireproximityprompt(L_1_[25]["Map"]["HeavenlyDimension"]["Torch1"]["ProximityPrompt"])
			fireproximityprompt(L_1_[25]["Map"]["HeavenlyDimension"]["Torch2"]["ProximityPrompt"])
			fireproximityprompt(L_1_[25]["Map"]["HeavenlyDimension"]["Torch3"]["ProximityPrompt"])
		end
		if L_1_[25]["Map"]:FindFirstChild("HellDimension") then
			fireproximityprompt(L_1_[25]["Map"]["HellDimension"]["Torch1"]["ProximityPrompt"])
			fireproximityprompt(L_1_[25]["Map"]["HellDimension"]["Torch2"]["ProximityPrompt"])
			fireproximityprompt(L_1_[25]["Map"]["HellDimension"]["Torch3"]["ProximityPrompt"])
		end
	end
end)
L_1_[37]["PlayerGui"]["Notifications"]["Enabled"] = false
task["spawn"](function()
	while task["wait"]() do
		pcall(function()
			if not(game:GetService("Players"))["LocalPlayer"]["Character"]["HumanoidRootPart"]:FindFirstChild("Lock") then
				local L_651_ = {}
				if (game["Players"]["LocalPlayer"]["Character"]:WaitForChild("Humanoid"))["Sit"] == true then
					(game["Players"]["LocalPlayer"]["Character"]:WaitForChild("Humanoid"))["Sit"] = false
				end
				L_651_[2] = Instance["new"]("BodyVelocity")
				L_651_[2]["Name"] = "Lock"
				L_651_[2]["Parent"] = (game:GetService("Players"))["LocalPlayer"]["Character"]["HumanoidRootPart"]
				L_651_[2]["MaxForce"] = Vector3["new"](9000000000, 9000000000, 9000000000)
				L_651_[2]["Velocity"] = Vector3["new"](0, 0, 0)
			end
		end)
	end
end)
L_1_[45]["wt"](5)
_G["Ew"] = false
Ewx = false
task["spawn"](function()
	while L_1_[45]["wt"]() do
		pcall(function()
			if L_1_[1]["Value"] >= 2500000 and New_World then
				L_1_[7]["Remotes"]["CommF_"]:InvokeServer("LegendarySwordDealer", "1")
				L_1_[7]["Remotes"]["CommF_"]:InvokeServer("LegendarySwordDealer", "2")
				L_1_[7]["Remotes"]["CommF_"]:InvokeServer("LegendarySwordDealer", "3")
			end
			if L_1_[45]["tf"](Configs["Gun"], "Kabucha") and (L_1_[17]["Value"] >= 10000 and not L_1_[45]["gi"]("Kabucha")) then
				L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BlackbeardReward", "Slingshot", "2")
			end
			if L_1_[1]["Value"] >= 3000000 then
				if L_1_[45]["tf"](Configs["Sword"], "Bisento") and not L_1_[45]["gi"]("Bisento") then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyItem", "Bisento")
				end
				if L_1_[45]["tf"](Configs["Sword"], "Cutlass") and not L_1_[45]["gi"]("Cutlass") then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyItem", "Cutlass")
				end
				if L_1_[45]["tf"](Configs["Sword"], "Katana") and not L_1_[45]["gi"]("Katana") then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyItem", "Katana")
				end
				if L_1_[45]["tf"](Configs["Sword"], "Dual Katana") and not L_1_[45]["gi"]("Dual Katana") then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyItem", "Dual Katana")
				end
				if L_1_[45]["tf"](Configs["Sword"], "Soul Cane") and not L_1_[45]["gi"]("Soul Cane") then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyItem", "Soul Cane")
				end
				if L_1_[45]["tf"](Configs["Sword"], "Triple Katana") and not L_1_[45]["gi"]("Triple Katana") then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyItem", "Triple Katana")
				end
				if L_1_[45]["tf"](Configs["Sword"], "Iron Mace") and not L_1_[45]["gi"]("Iron Mace") then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyItem", "Iron Mace")
				end
				if L_1_[45]["tf"](Configs["Sword"], "Pipe") and not L_1_[45]["gi"]("Pipe") then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyItem", "Pipe")
				end
				if L_1_[45]["tf"](Configs["Sword"], "Dual-Headed Blade") and not L_1_[45]["gi"]("Dual-Headed Blade") then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyItem", "Dual-Headed Blade")
				end
				if L_1_[45]["tf"](Configs["Gun"], "Musket") and not L_1_[45]["gi"]("Musket") then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyItem", "Musket")
				end
				if L_1_[45]["tf"](Configs["Gun"], "Flintlock") and not L_1_[45]["gi"]("Flintlock") then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyItem", "Flintlock")
				end
				if L_1_[45]["tf"](Configs["Gun"], "Refined Slingshot") and not L_1_[45]["gi"]("Refined Slingshot") then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyItem", "Refined Slingshot")
				end
				if L_1_[45]["tf"](Configs["Gun"], "Dual Flintlock") and not L_1_[45]["gi"]("Dual Flintlock") then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyItem", "Dual Flintlock")
				end
				if L_1_[45]["tf"](Configs["Gun"], "Cannon") and not L_1_[45]["gi"]("Cannon") then
					L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyItem", "Cannon")
				end
			end
			if L_1_[45]["tf"](Configs["Sword"], "Midnight Blade") and (L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Ectoplasm", "Check") >= 100 and not L_1_[45]["gi"]("Midnight Blade")) then
				L_1_[7]["Remotes"]["CommF_"]:InvokeServer("Ectoplasm", "Buy", 3)
			end
			if not klmdlkgf and L_1_[24]["Value"] >= 2000 then
				L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyHaki", "Geppo")
				L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyHaki", "Soru")
				L_1_[7]["Remotes"]["CommF_"]:InvokeServer("KenTalk", "Buy")
				klmdlkgf = true
			end
			if not klmdlkgfx and L_1_[24]["Value"] >= 1000 then
				L_1_[7]["Remotes"]["CommF_"]:InvokeServer("BuyHaki", "Buso")
				klmdlkgfx = true
			end
			L_1_[45]["wt"](100)
		end)
	end
end)