-- ts file was generated at discord.gg/25ms


if getgenv().ICUSNciUSBNCYUWNdjksndIUBCSJK then
    WDIUWngfiuNFDJWKDNJNIKNI = true
end
AnalyticsService = game:GetService("AnalyticsService")
CollectionService = game:GetService("CollectionService")
DataStoreService = game:GetService("DataStoreService")
HttpService = game:GetService("HttpService")
Lighting = game:GetService("Lighting")
MarketplaceService = game:GetService("MarketplaceService")
Players = game:GetService("Players")
ReplicatedFirst = game:GetService("ReplicatedFirst")
ReplicatedStorage = game:GetService("ReplicatedStorage")
RunService = game:GetService("RunService")
ServerScriptService = game:GetService("ServerScriptService")
ServerStorage = game:GetService("ServerStorage")
SoundService = game:GetService("SoundService")
StarterGui = game:GetService("StarterGui")
StarterPack = game:GetService("StarterPack")
StarterPlayer = game:GetService("StarterPlayer")
TeleportService = game:GetService("TeleportService")
TweenService = game:GetService("TweenService")
Teams = game:GetService("Teams")
VirtualUser = game:GetService("VirtualUser")
Workspace = game:GetService("Workspace")
UserInputService = game:GetService("UserInputService")
VirtualInputManager = game:GetService("VirtualInputManager")
ContextActionService = game:GetService("ContextActionService")
GuiService = game:GetService("GuiService")
print("ClientMonsterTools.lua loaded")
game.Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    print("Roblox Tried to kick you but we didn\'t let them kick you :D")
end)
warn("[Anti Afk] - loaded successfully")
print("[Space Hub | Fisch]: loading...")
local v1 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local v2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local v3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local vu4 = v1:CreateWindow({
    ["Title"] = "Fisch | Space Hub",
    ["SubTitle"] = "v1.9",
    ["TabWidth"] = 150,
    ["Size"] = UDim2.fromOffset(600, 400),
    ["Acrylic"] = true,
    ["Theme"] = "Darker",
    ["MinimizeKey"] = Enum.KeyCode.LeftControl
})
local vu5 = false
local v6 = {}
local v7 = vu4
v6.Home = vu4.AddTab(v7, {
    ["Title"] = "Home",
    ["Icon"] = "home"
})
local v8 = vu4
v6.Main = vu4.AddTab(v8, {
    ["Title"] = "Main",
    ["Icon"] = "code"
})
local v9 = vu4
v6.Teleports = vu4.AddTab(v9, {
    ["Title"] = "Teleports",
    ["Icon"] = "compass"
})
local v10 = vu4
v6.Misc = vu4.AddTab(v10, {
    ["Title"] = "Misc",
    ["Icon"] = "file-text"
})
local v11 = vu4
v6.Player = vu4.AddTab(v11, {
    ["Title"] = "Player",
    ["Icon"] = "coffee"
})
local v12 = vu4
v6.Premium = vu4.AddTab(v12, {
    ["Title"] = "Premium",
    ["Icon"] = "diamond"
})
local v13 = vu4
v6.Settings = vu4.AddTab(v13, {
    ["Title"] = "Settings",
    ["Icon"] = "settings"
})
local vu14 = v1.Options
local vu15 = {
    ["Forsaken_Shores"] = CFrame.new(- 2493.379, 133.1, 1550.709),
    ["altar"] = CFrame.new(1296.320068359375, - 808.5519409179688, - 298.93817138671875),
    ["arch"] = CFrame.new(998.966796875, 126.6849365234375, - 1237.1434326171875),
    ["birch"] = CFrame.new(1742.3203125, 138.25787353515625, - 2502.23779296875),
    ["brine"] = CFrame.new(- 1794.10596, - 145.849701, - 3302.92358, - 0.0000516176224, 3.10316682e-6, 0.99999994, 0.119907647, 0.992785037, 3.10316682e-6, - 0.992785037, 0.119907647, - 0.0000516176224),
    ["deep"] = CFrame.new(- 1510.88672, - 237.695053, - 2852.90674, 0.573604643, 0.000580655003, 0.81913209, - 0.000340352941, 0.999999762, - 0.000470530824, - 0.819132209, - 8.89541116e-6, 0.573604763),
    ["deepshop"] = CFrame.new(- 979.196411, - 247.910156, - 2699.87207, 0.587748766, 0, 0.809043527, 0, 1, 0, - 0.809043527, 0, 0.587748766),
    ["enchant"] = CFrame.new(1296.320068359375, - 808.5519409179688, - 298.93817138671875),
    ["executive"] = CFrame.new(- 29.836761474609375, - 250.48486328125, 199.11614990234375),
    ["keepers"] = CFrame.new(1296.320068359375, - 808.5519409179688, - 298.93817138671875),
    ["mod_house"] = CFrame.new(- 30.205902099609375, - 249.40594482421875, 204.0529022216797),
    ["moosewood"] = CFrame.new(383.10113525390625, 131.2406005859375, 243.93385314941406),
    ["mushgrove"] = CFrame.new(2501.48583984375, 127.7583236694336, - 720.699462890625),
    ["roslit"] = CFrame.new(- 1476.511474609375, 130.16842651367188, 671.685302734375),
    ["snow"] = CFrame.new(2648.67578125, 139.06605529785156, 2521.29736328125),
    ["snowcap"] = CFrame.new(2648.67578125, 139.06605529785156, 2521.29736328125),
    ["spike"] = CFrame.new(- 1254.800537109375, 133.88555908203125, 1554.2021484375),
    ["statue"] = CFrame.new(72.8836669921875, 138.6964874267578, - 1028.4193115234375),
    ["sunstone"] = CFrame.new(- 933.259705, 128.143951, - 1119.52063, - 0.342042685, 0, - 0.939684391, 0, 1, 0, 0.939684391, 0, - 0.342042685),
    ["swamp"] = CFrame.new(2501.48583984375, 127.7583236694336, - 720.699462890625),
    ["terrapin"] = CFrame.new(- 143.875244140625, 141.1676025390625, 1909.6070556640625),
    ["trident"] = CFrame.new(- 1479.48987, - 228.710632, - 2391.39307, 0.0435845852, 0, 0.999049723, 0, 1, 0, - 0.999049723, 0, 0.0435845852),
    ["vertigo"] = CFrame.new(- 112.007278, - 492.901093, 1040.32788, - 1, 0, 0, 0, 1, 0, 0, 0, - 1),
    ["volcano"] = CFrame.new(- 1888.52319, 163.847565, 329.238281, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    ["wilson"] = CFrame.new(2938.80591, 277.474762, 2567.13379, 0.4648332, 0, 0.885398269, 0, 1, 0, - 0.885398269, 0, 0.4648332),
    ["wilsons_rod"] = CFrame.new(2879.2085, 135.07663, 2723.64233, 0.970463336, - 0.168695927, - 0.172460333, 0.141582936, - 0.180552125, 0.973321974, - 0.195333466, - 0.968990743, - 0.151334763)
}
local vu16 = {
    ["Forsaken_Shores"] = CFrame.new(- 2827.479, 215.067459, 1518.38977, - 0.0640091896, 0, - 0.997949481, 0, 1, 0, 0.997949481, 0, - 0.0640091896),
    ["Roslit_Bay"] = CFrame.new(- 1663.73889, 149.234116, 495.498016, 0.0380855016, 4.08820178e-8, - 0.999274492, 5.74658472e-8, 1, 4.3101906e-8, 0.999274492, - 5.90657123e-8, 0.0380855016),
    ["Ocean"] = CFrame.new(7665.104, 125.444443, 2601.59351, 0.999966085, - 0.000609769544, - 0.00821684115, 0.000612694537, 0.999999762, 0.000353460142, 0.00821662322, - 0.000358482561, 0.999966204),
    ["Snowcap_Pond"] = CFrame.new(2778.09009, 283.283783, 2580.323, 1, 7.17688531e-9, - 0.0000222843701, - 7.17796267e-9, 1, - 4.83369114e-8, 0.0000222843701, 4.83370712e-8, 1),
    ["Moosewood_Docks"] = CFrame.new(343.2359924316406, 133.61595153808594, 267.0580139160156),
    ["Deep_Ocean"] = CFrame.new(3569.07153, 125.480949, 6697.12695, 0.999980748, - 0.00188910461, - 0.00591362361, 0.00193980196, 0.999961317, 0.00857902411, 0.00589718809, - 0.00859032944, 0.9999457),
    ["Vertigo"] = CFrame.new(- 137.697098, - 736.86377, 1233.15271, 1, - 1.61821543e-8, - 0.0000201375751, 1.6184277e-8, 1, 1.05423091e-7, 0.0000201375751, - 1.0542341e-7, 1),
    ["Snowcap_Ocean"] = CFrame.new(3088.66699, 131.534332, 2587.11304, 1, 4.30694858e-9, - 1.19097813e-14, - 4.30694858e-9, 1, - 2.80603398e-8, 1.17889275e-14, 2.80603398e-8, 1),
    ["Harvesters_Spike"] = CFrame.new(- 1234.61523, 125.228767, 1748.57166, 0.999991536, - 0.000663080777, - 0.00405627443, 0.000725277001, 0.999881923, 0.0153511297, 0.00404561637, - 0.0153539423, 0.999873936),
    ["SunStone"] = CFrame.new(- 845.903992, 133.172211, - 1163.57776, 1, - 7.93465915e-9, - 0.0000209446498, 7.93544608e-9, 1, 3.75741536e-8, 0.0000209446498, - 3.75743205e-8, 1),
    ["Roslit_Bay_Ocean"] = CFrame.new(- 1708.09302, 155.000015, 384.928009, 1, - 9.84460868e-9, - 3.24939563e-15, 9.84460868e-9, 1, 4.66220271e-8, 2.79042003e-15, - 4.66220271e-8, 1),
    ["Moosewood_Pond"] = CFrame.new(509.735992, 152.000031, 302.173004, 1, - 1.78487678e-8, - 8.1329488e-14, 1.78487678e-8, 1, 8.45405168e-8, 7.98205428e-14, - 8.45405168e-8, 1),
    ["Terrapin_Ocean"] = CFrame.new(58.6469994, 135.499985, 2147.41699, 1, 2.09643041e-8, - 5.6023784e-15, - 2.09643041e-8, 1, - 9.92988376e-8, 3.52064755e-15, 9.92988376e-8, 1),
    ["Isonade"] = CFrame.new(- 1060.99902, 121.164787, 953.996033, 0.999958456, 0.000633197487, - 0.00909138657, - 0.000568434712, 0.999974489, 0.00712434994, 0.00909566507, - 0.00711888634, 0.999933302),
    ["Moosewood_Ocean"] = CFrame.new(- 167.642715, 125.19548, 248.009521, 0.999997199, - 0.000432743778, - 0.0023210498, 0.000467110571, 0.99988997, 0.0148265222, 0.00231437827, - 0.0148275653, 0.999887407),
    ["Roslit_Pond"] = CFrame.new(- 1811.96997, 148.047089, 592.642517, 1, 1.12983072e-8, - 0.0000216573972, - 1.12998171e-8, 1, - 6.97014357e-8, 0.0000216573972, 6.97016844e-8, 1),
    ["Moosewood_Ocean_Mythical"] = CFrame.new(252.802994, 135.849625, 36.8839989, 1, - 1.98115071e-8, - 4.50667564e-15, 1.98115071e-8, 1, 1.22230617e-7, 2.08510289e-15, - 1.22230617e-7, 1),
    ["Terrapin_Olm"] = CFrame.new(22.0639992, 182.000015, 1944.36804, 1, 1.14953362e-8, - 2.7011112e-15, - 1.14953362e-8, 1, - 7.09263972e-8, 1.88578841e-15, 7.09263972e-8, 1),
    ["The_Arch"] = CFrame.new(1283.30896, 130.923569, - 1165.29602, 1, - 5.89772364e-9, - 3.3183043e-15, 5.89772364e-9, 1, 3.63913486e-8, 3.10367822e-15, - 3.63913486e-8, 1),
    ["Scallop_Ocean"] = CFrame.new(23.2255898, 125.236847, 738.952271, 0.999990165, - 0.00109633175, - 0.00429760758, 0.00115595153, 0.999902785, 0.0138949333, 0.00428195624, - 0.013899764, 0.999894202),
    ["SunStone_Hidden"] = CFrame.new(- 1139.55701, 134.62204, - 1076.94324, 1, 3.9719481e-9, - 0.000016278158, - 3.97231048e-9, 1, - 2.22651142e-8, 0.000016278158, 2.22651781e-8, 1),
    ["Mushgrove_Stone"] = CFrame.new(2525.36011, 131.000015, - 776.184021, 1, 1.90145943e-8, - 3.24206519e-15, - 1.90145943e-8, 1, - 1.06596836e-7, 1.21516956e-15, 1.06596836e-7, 1),
    ["Keepers_Altar"] = CFrame.new(1307.13599, - 805.292236, - 161.363998, 1, 2.40881981e-10, - 3.25609947e-15, - 2.40881981e-10, 1, - 1.35044154e-9, 3.255774e-15, 1.35044154e-9, 1),
    ["Lava"] = CFrame.new(- 1959.86206, 193.144821, 271.960999, 1, - 6.02453598e-9, - 2.97388313e-15, 6.02453598e-9, 1, 3.37767716e-8, 2.77039384e-15, - 3.37767716e-8, 1),
    ["Roslit_Pond_Seaweed"] = CFrame.new(- 1785.2869873046875, 148.15780639648438, 639.9299926757812)
}
local vu17 = {
    ["Merlin"] = CFrame.new(- 930.9, 223.8, - 988.3),
    ["Quiet_Synph"] = CFrame.new(566.263245, 152.000031, 353.872101, - 0.753558397, 0, - 0.657381535, 0, 1, 0, 0.657381535, 0, - 0.753558397),
    ["Pierre"] = CFrame.new(391.38855, 135.348389, 196.712387, - 1, 0, 0, 0, 1, 0, 0, 0, - 1),
    ["Phineas"] = CFrame.new(469.912292, 150.69342, 277.954987, 0.886104584, 0, - 0.46348536, 0, 1, 0, 0.46348536, 0, 0.886104584),
    ["Paul"] = CFrame.new(381.741882, 136.500031, 341.891022, - 1, 0, 0, 0, 1, 0, 0, 0, - 1),
    ["Shipwright"] = CFrame.new(357.972595, 133.615967, 258.154541, 0, 0, - 1, 0, 1, 0, 1, 0, 0),
    ["Angler"] = CFrame.new(480.102478, 150.501053, 302.226898, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    ["Marc"] = CFrame.new(466.160034, 151.00206, 224.497086, - 0.996853352, 0, - 0.0792675018, 0, 1, 0, 0.0792675018, 0, - 0.996853352),
    ["Lucas"] = CFrame.new(449.33963, 181.999893, 180.689072, 0, 0, 1, 0, 1, 0, - 1, 0, 0),
    ["Latern_Keeper"] = CFrame.new(- 39.0456772, - 246.599976, 195.644363, - 1, 0, 0, 0, 1, 0, 0, 0, - 1),
    ["Latern_Keeper2"] = CFrame.new(- 17.4230175, - 304.970276, - 14.529892, - 1, 0, 0, 0, 1, 0, 0, 0, - 1),
    ["Inn_Keeper"] = CFrame.new(487.458466, 150.800034, 231.498932, - 0.564704418, 0, - 0.825293183, 0, 1, 0, 0.825293183, 0, - 0.564704418),
    ["Roslit_Keeper"] = CFrame.new(- 1512.37891, 134.500031, 631.24353, 0.738236904, 0, - 0.674541533, 0, 1, 0, 0.674541533, 0, 0.738236904),
    ["FishingNpc_1"] = CFrame.new(- 1429.04138, 134.371552, 686.034424, 0, 0.0168599077, - 0.999857903, 0, 0.999857903, 0.0168599077, 1, 0, 0),
    ["FishingNpc_2"] = CFrame.new(- 1778.55408, 149.791779, 648.097107, 0.183140755, 0.0223737024, - 0.982832015, 0, 0.999741018, 0.0227586292, 0.983086705, - 0.00416803267, 0.183093324),
    ["FishingNpc_3"] = CFrame.new(- 1778.26807, 147.83165, 653.258606, - 0.129575253, 0.501478612, 0.855411887, - 0.0000244146213, 0.862683058, - 0.505744994, - 0.991569638, - 0.0655529201, - 0.111770131),
    ["Henry"] = CFrame.new(483.539307, 152.383057, 236.296143, - 0.789363742, 0, 0.613925934, 0, 1, 0, - 0.613925934, 0, - 0.789363742),
    ["Daisy"] = CFrame.new(581.550049, 165.490753, 213.499969, - 0.964885235, 0, - 0.262671858, 0, 1, 0, 0.262671858, 0, - 0.964885235),
    ["Appraiser"] = CFrame.new(453.182373, 150.500031, 206.908783, 0, 0, 1, 0, 1, 0, - 1, 0, 0),
    ["Merchant"] = CFrame.new(416.690521, 130.302628, 342.765289, - 0.249025017, - 0.0326484665, 0.967946589, - 0.0040341015, 0.999457955, 0.0326734781, - 0.968488574, 0.00423171744, - 0.249021754),
    ["Mod_Keeper"] = CFrame.new(- 39.0905838, - 245.141144, 195.837891, - 0.948549569, - 0.0898146331, - 0.303623199, - 0.197293222, 0.91766715, 0.34490931, 0.247647122, 0.387066364, - 0.888172567),
    ["Ashe"] = CFrame.new(- 1709.94055, 149.862411, 729.399536, - 0.92290163, 0.0273250472, - 0.384064913, 0, 0.997478604, 0.0709675401, 0.385035753, 0.0654960647, - 0.920574605),
    ["Alfredrickus"] = CFrame.new(- 1520.60632, 142.923264, 764.522034, 0.301733732, 0.390740901, - 0.869642735, 0.0273988936, 0.908225596, 0.417582989, 0.952998459, - 0.149826124, 0.26333645)
}
local vu18 = {
    ["Training_Rod"] = CFrame.new(457.693848, 148.357529, 230.414307, 1, 0, 0, 0, 0.975410998, 0.220393807, 0, - 0.220393807, 0.975410998),
    ["Plastic_Rod"] = CFrame.new(454.425385, 148.169739, 229.172424, 0.951755166, 0.0709736273, - 0.298537821, - 3.42726707e-7, 0.972884834, 0.231290117, 0.306858391, - 0.220131472, 0.925948203),
    ["Lucky_Rod"] = CFrame.new(446.085999, 148.253006, 222.160004, 0.974526405, - 0.22305499, 0.0233404674, 0.196993902, 0.901088715, 0.386306256, - 0.107199371, - 0.371867687, 0.922075212),
    ["Kings_Rod"] = CFrame.new(1375.57642, - 810.201721, - 303.509247, - 0.7490201, 0.662445903, - 0.0116144121, - 0.0837960541, - 0.0773290396, 0.993478119, 0.657227278, 0.745108068, 0.113431036),
    ["Flimsy_Rod"] = CFrame.new(471.107697, 148.36171, 229.642441, 0.841614008, 0.0774728209, - 0.534493923, 0.00678436086, 0.988063335, 0.153898612, 0.540036798, - 0.13314943, 0.831042409),
    ["Nocturnal_Rod"] = CFrame.new(- 141.874237, - 515.313538, 1139.04529, 0.161644459, - 0.98684907, 0.0000187754631, 0.0000187754631, 0.0000221133232, 1, - 0.98684907, - 0.161644459, 0.0000221133232),
    ["Fast_Rod"] = CFrame.new(447.183563, 148.225739, 220.187454, 0.981104493, 0.0000126492232, 0.193478703, - 0.0522461236, 0.962867677, 0.264870107, - 0.186291039, - 0.269973755, 0.944674432),
    ["Carbon_Rod"] = CFrame.new(454.083618, 150.590073, 225.328827, 0.985374212, - 0.170404434, 1.41561031e-7, 1.41561031e-7, 1.7285347e-6, 1, - 0.170404434, - 0.985374212, 1.7285347e-6),
    ["Long_Rod"] = CFrame.new(485.695038, 171.656326, 145.746109, - 0.630167365, - 0.776459217, - 5.33461571e-6, 5.33461571e-6, - 0.0000112056732, 1, - 0.776459217, 0.630167365, 0.0000112056732),
    ["Mythical_Rod"] = CFrame.new(389.716705, 132.588821, 314.042847, 0, 1, 0, 0, 0, - 1, - 1, 0, 0),
    ["Midas_Rod"] = CFrame.new(401.981659, 133.258316, 326.325745, 0.16456604, 0.986365497, 0.00103566051, 0.00017541647, 0.00102066994, - 0.999999464, - 0.986366034, 0.1645661, - 5.00679016e-6),
    ["Trident_Rod"] = CFrame.new(- 1484.34192, - 222.325562, - 2194.77002, - 0.466092706, - 0.536795318, 0.703284025, - 0.319611132, 0.843386114, 0.43191275, - 0.824988723, - 0.0234660208, - 0.56466186),
    ["Enchated_Altar"] = CFrame.new(1310.54651, - 799.469604, - 82.7303467, 0.999973059, 0, 0.00733732153, 0, 1, 0, - 0.00733732153, 0, 0.999973059),
    ["Bait_Crate"] = CFrame.new(384.57513427734375, 135.3519287109375, 337.5340270996094),
    ["Quality_Bait_Crate"] = CFrame.new(- 177.876, 144.472, 1932.844),
    ["Crab_Cage"] = CFrame.new(474.803589, 149.664566, 229.49469, - 0.721874595, 0, 0.692023814, 0, 1, 0, - 0.692023814, 0, - 0.721874595),
    ["GPS"] = CFrame.new(517.896729, 149.217636, 284.856842, 7.39097595e-6, - 0.719539165, - 0.694451928, - 1, - 7.39097595e-6, - 3.01003456e-6, - 3.01003456e-6, 0.694451928, - 0.719539165),
    ["Basic_Diving_Gear"] = CFrame.new(369.174774, 132.508835, 248.705368, 0.228398502, - 0.158300221, - 0.96061182, 0.0000158026814, 0.986692965, - 0.162594408, 0.973567724, 0.037121132, 0.225361705),
    ["Fish_Radar"] = CFrame.new(365.75177, 134.50499, 274.105804, 0.704499543, - 0.111681774, - 0.70086211, 0.0000132396817, 0.987542748, - 0.157350808, 0.709704578, 0.110844307, 0.695724905)
}
local vu19 = {
    ["Aurora_Totem"] = CFrame.new(- 1812.8, - 136.9, - 3281),
    ["Sundial_Totem"] = CFrame.new(- 1149.2, 136.9, - 1077),
    ["Smokescreen_Totem"] = CFrame.new(2791.8, 139.7, - 629.9),
    ["Tempest_Totem"] = CFrame.new(- 930.9, 223.8, - 988.3)
}
local vu20 = Players.LocalPlayer
local vu21 = vu20.Character
local v22 = vu21
local vu23 = vu21.FindFirstChild(v22, "HumanoidRootPart")
Workspace:FindFirstChild("active")
local v24 = vu20
local v25 = vu20.FindFirstChildOfClass(v24, "PlayerGui")
local vu26 = false
local vu27 = false
local vu28 = false
local vu29 = false
local vu30 = false
local vu31 = false
local vu32 = 0.3
local vu33 = false
local vu34 = false
local vu35 = false
local vu36 = false
local vu37 = false
local vu38 = false
local vu39 = false
local _ = Enum.KeyCode.F
v25.ChildAdded:Connect(function(p40)
	-- upvalues: (ref) vu33
    local v41 = p40:IsA("ScreenGui") and (p40.Name == "reel" and vu33) and ReplicatedStorage:WaitForChild("events"):WaitForChild("reelfinished")
    if v41 then
        while p40 do
            task.wait(2)
            v41:FireServer(100, false)
        end
    end
end)
function MousePrem()
	-- upvalues: (ref) vu28
    task.spawn(function()
		-- upvalues: (ref) vu28
        while vu28 do
            local v42 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("shakeui")
            local v43 = v42 and (v42.Enabled and v42:FindFirstChild("safezone"))
            if v43 then
                local v44 = v43:FindFirstChild("button")
                if v44 and (v44:IsA("ImageButton") and v44.Visible) then
                    local v45 = v44.AbsolutePosition
                    local v46 = v44.AbsoluteSize
                    task.wait()
                    VirtualInputManager:SendMouseButtonEvent(v45.X + v46.X / 2, v45.Y + v46.Y / 2, 0, true, game:GetService("Players").LocalPlayer, 0)
                    VirtualInputManager:SendMouseButtonEvent(v45.X + v46.X / 2, v45.Y + v46.Y / 2, 0, false, game:GetService("Players").LocalPlayer, 0)
                end
            end
            task.wait(0.0001)
        end
    end)
end
elementsDestroyed = false
function PhantomPrem()
	-- upvalues: (ref) vu28
    if not elementsDestroyed then
        local v47 = game:GetService("Players").LocalPlayer.PlayerGui
        local v48 = v47:FindFirstChild("TopbarStandard")
        if v48 then
            v48:Destroy()
        end
        local v49 = v47.hud:FindFirstChild("safezone")
        local v50 = v49 and v49:FindFirstChild("topbar")
        if v50 then
            v50:Destroy()
        end
        elementsDestroyed = true
    end
    task.spawn(function()
		-- upvalues: (ref) vu28
        while vu28 do
            local v51 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("shakeui")
            local v52 = v51 and (v51.Enabled and v51:FindFirstChild("safezone"))
            if v52 then
                local v53 = v52:FindFirstChild("button")
                if v53 and (v53:IsA("ImageButton") and v53.Visible) then
                    GuiService.SelectedObject = v53
                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                end
            end
            task.wait()
        end
    end)
end
function MouseNoPrem()
	-- upvalues: (ref) vu28, (ref) vu32, (ref) vu27
    task.spawn(function()
		-- upvalues: (ref) vu28, (ref) vu32, (ref) vu27
        while vu28 do
            task.wait(vu32)
            local v54 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("shakeui")
            local v55 = v54 and (v54.Enabled and v54:FindFirstChild("safezone"))
            if v55 then
                local v56 = v55:FindFirstChild("button")
                if v56 and (v56:IsA("ImageButton") and (v56.Visible and vu27)) then
                    print("Mouse No Prem")
                    local v57 = v56.AbsolutePosition
                    local v58 = v56.AbsoluteSize
                    VirtualInputManager:SendMouseButtonEvent(v57.X + v58.X / 2, v57.Y + v58.Y / 2, 0, true, game:GetService("Players").LocalPlayer, 0)
                    VirtualInputManager:SendMouseButtonEvent(v57.X + v58.X / 2, v57.Y + v58.Y / 2, 0, false, game:GetService("Players").LocalPlayer, 0)
                end
            end
        end
    end)
end
function PhantomNoPremium()
	-- upvalues: (ref) vu28, (ref) vu32, (ref) vu27
    task.spawn(function()
		-- upvalues: (ref) vu28, (ref) vu32, (ref) vu27
        while vu28 do
            task.wait(vu32)
            local v59 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("shakeui")
            local v60 = v59 and (v59.Enabled and v59:FindFirstChild("safezone"))
            if v60 then
                local v61 = v60:FindFirstChild("button")
                if v61 and (v61:IsA("ImageButton") and (v61.Visible and vu27)) then
                    print("Phantom No Prem")
                    GuiService.SelectedObject = v61
                    task.wait()
                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                end
            end
        end
    end)
end
function AutoFish5()
	-- upvalues: (ref) vu28, (ref) vu30, (ref) vu27, (ref) vu29, (ref) vu32
    if vu28 then
        local v62 = game.Players.LocalPlayer
        local vu63 = v62.Character or v62.CharacterAdded:Wait()
        local v64 = Instance.new("ScreenGui", v62:WaitForChild("PlayerGui"))
        local vu65 = Instance.new("TextLabel", v64)
        vu65.Size = UDim2.new(0, 200, 0, 50)
        vu65.Position = UDim2.new(1, - 210, 0, 10)
        vu65.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        vu65.TextColor3 = Color3.fromRGB(255, 255, 255)
        vu65.TextScaled = true;
        (function()
			-- upvalues: (ref) vu63, (ref) vu65
            spawn(function()
				-- upvalues: (ref) vu63, (ref) vu65
                while wait(0.1) do
                    if vu63 then
                        local v66 = vu63:FindFirstChildOfClass("Tool")
                        if v66 and v66:FindFirstChild("values") and v66.values:FindFirstChild("lure") then
                            local v67 = v66.values.lure.Value
                            vu65.Text = "Lure - " .. string.format("%.2f", v67)
                        else
                            vu65.Text = "Lure - No Rod Found"
                        end
                    else
                        vu65.Text = "Lure - no player"
                    end
                end
            end)
        end)()
    else
        local v68 = game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("ScreenGui")
        if v68 then
            v68:Destroy()
        end
    end
    if vu30 then
        if vu27 then
            print("Mouse prem")
            MousePrem()
        elseif vu29 then
            print("Phantom prem")
            PhantomPrem()
        end
    else
        task.spawn(function()
			-- upvalues: (ref) vu28, (ref) vu32, (ref) vu27, (ref) vu29
            while vu28 do
                task.wait(vu32)
                local v69 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("shakeui")
                local v70 = v69 and (v69.Enabled and v69:FindFirstChild("safezone"))
                if v70 then
                    local v71 = v70:FindFirstChild("button")
                    if v71 and (v71:IsA("ImageButton") and v71.Visible) then
                        if vu27 then
                            local v72 = v71.AbsolutePosition
                            local v73 = v71.AbsoluteSize
                            VirtualInputManager:SendMouseButtonEvent(v72.X + v73.X / 2, v72.Y + v73.Y / 2, 0, true, game:GetService("Players").LocalPlayer, 0)
                            VirtualInputManager:SendMouseButtonEvent(v72.X + v73.X / 2, v72.Y + v73.Y / 2, 0, false, game:GetService("Players").LocalPlayer, 0)
                        elseif vu29 then
                            GuiService.SelectedObject = v71
                            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                            task.wait()
                            GuiService.SelectedObject = nil
                        end
                    end
                end
            end
        end)
    end
end
function ZoneCasting()
	-- upvalues: (ref) vu31
    if WDIUWngfiuNFDJWKDNJNIKNI then
        spawn(function()
			-- upvalues: (ref) vu31
            while vu31 do
                local v74 = game.Players.LocalPlayer.Character
                if v74 then
                    local v75 = v74:FindFirstChildOfClass("Tool")
                    if v75 then
                        local v76 = v75:FindFirstChild("bobber")
                        if v76 then
                            local v77 = v76:FindFirstChild("RopeConstraint")
                            if v77 then
                                v77.Length = 20000000
                            end
                            local v78 = Vector3.new(10, 1, 10)
                            local v79 = Vector3.new(0, - 4, 0)
                            if selectedZoneCast ~= "Bluefin Tuna Abundance" then
                                if selectedZoneCast ~= "Swordfish Abundance" then
                                    if selectedZoneCast ~= "Chinook Salmon Abundance" then
                                        local v80 = Workspace.zones.fishing:FindFirstChild(selectedZoneCast)
                                        if vu31 then
                                            local v81 = nil
                                            if selectedZoneCast ~= "FischFright24" then
                                                if selectedZoneCast ~= "Isonade" then
                                                    if selectedZoneCast ~= "Deep Ocean" then
                                                        if selectedZoneCast ~= "1 Desolate" then
                                                            if selectedZoneCast ~= "2 Desolate" then
                                                                if selectedZoneCast ~= "3 Desolate" then
                                                                    if selectedZoneCast ~= "4 Desolate" then
                                                                        if selectedZoneCast ~= "1 Forsaken Shores" then
                                                                            if selectedZoneCast ~= "2 Forsaken Shores" then
                                                                                if selectedZoneCast ~= "3 Forsaken Shores" then
                                                                                    if selectedZoneCast ~= "1 Forsaken Shores Ocean" then
                                                                                        if selectedZoneCast ~= "2 Forsaken Shores Ocean" then
                                                                                            if selectedZoneCast ~= "3 Forsaken Shores Ocean" then
                                                                                                if selectedZoneCast ~= "1 Forsaken Shores Pond" then
                                                                                                    if selectedZoneCast ~= "2 Forsaken Shores Pond" then
                                                                                                        if selectedZoneCast ~= "1 Harvesters Spike" then
                                                                                                            if selectedZoneCast ~= "2 Harvesters Spike" then
                                                                                                                if selectedZoneCast ~= "3 Harvesters Spike" then
                                                                                                                    if selectedZoneCast ~= "1 Moosewood Ocean" then
                                                                                                                        if selectedZoneCast ~= "2 Moosewood Ocean" then
                                                                                                                            if selectedZoneCast ~= "3 Moosewood Ocean" then
                                                                                                                                if selectedZoneCast ~= "1 Moosewood Onean Mythical" then
                                                                                                                                    if selectedZoneCast ~= "2 Moosewood Onean Mythical" then
                                                                                                                                        if selectedZoneCast ~= "1 Moosewood Pond" then
                                                                                                                                            if selectedZoneCast ~= "2 Moosewood Pond" then
                                                                                                                                                if selectedZoneCast ~= "3 Moosewood Pond" then
                                                                                                                                                    if selectedZoneCast ~= "4 Moosewood Pond" then
                                                                                                                                                        if selectedZoneCast ~= "5 Moosewood Pond" then
                                                                                                                                                            if selectedZoneCast ~= "1 Mushgrove Water" then
                                                                                                                                                                if selectedZoneCast ~= "2 Mushgrove Water" then
                                                                                                                                                                    if selectedZoneCast ~= "3 Mushgrove Water" then
                                                                                                                                                                        if selectedZoneCast ~= "4 Mushgrove Water" then
                                                                                                                                                                            if selectedZoneCast ~= "5 Mushgrove Water" then
                                                                                                                                                                                if selectedZoneCast ~= "6 Mushgrove Water" then
                                                                                                                                                                                    if selectedZoneCast ~= "1 Ocean" then
                                                                                                                                                                                        if selectedZoneCast ~= "2 Ocean" then
                                                                                                                                                                                            if selectedZoneCast ~= "3 Ocean" then
                                                                                                                                                                                                if selectedZoneCast ~= "4 Ocean" then
                                                                                                                                                                                                    if selectedZoneCast ~= "5 Ocean" then
                                                                                                                                                                                                        if selectedZoneCast ~= "6 Ocean" then
                                                                                                                                                                                                            if selectedZoneCast ~= "1 Roslit Bay" then
                                                                                                                                                                                                                if selectedZoneCast ~= "2 Roslit Bay" then
                                                                                                                                                                                                                    if selectedZoneCast ~= "3 Roslit Bay" then
                                                                                                                                                                                                                        if selectedZoneCast ~= "4 Roslit Bay" then
                                                                                                                                                                                                                            if selectedZoneCast ~= "5 Roslit Bay" then
                                                                                                                                                                                                                                if selectedZoneCast ~= "6 Roslit Bay" then
                                                                                                                                                                                                                                    if selectedZoneCast ~= "1 Roslit Bay Ocean" then
                                                                                                                                                                                                                                        if selectedZoneCast ~= "2 Roslit Bay Ocean" then
                                                                                                                                                                                                                                            if selectedZoneCast ~= "3 Roslit Bay Ocean" then
                                                                                                                                                                                                                                                if selectedZoneCast ~= "1 Roslit Pond" then
                                                                                                                                                                                                                                                    if selectedZoneCast ~= "2 Roslit Pond" then
                                                                                                                                                                                                                                                        if selectedZoneCast ~= "3 Roslit Pond" then
                                                                                                                                                                                                                                                            if selectedZoneCast ~= "Roslit Pond Seaweed" then
                                                                                                                                                                                                                                                                if selectedZoneCast ~= "Scallop Ocean" then
                                                                                                                                                                                                                                                                    if selectedZoneCast ~= "1 Snowcap Ocean" then
                                                                                                                                                                                                                                                                        if selectedZoneCast ~= "2 Snowcap Ocean" then
                                                                                                                                                                                                                                                                            if selectedZoneCast ~= "3 Snowcap Ocean" then
                                                                                                                                                                                                                                                                                if selectedZoneCast ~= "4 Snowcap Ocean" then
                                                                                                                                                                                                                                                                                    if selectedZoneCast ~= "5 Snowcap Ocean" then
                                                                                                                                                                                                                                                                                        if selectedZoneCast ~= "6 Snowcap Ocean" then
                                                                                                                                                                                                                                                                                            if selectedZoneCast ~= "7 Snowcap Ocean" then
                                                                                                                                                                                                                                                                                                if selectedZoneCast ~= "8 Snowcap Ocean" then
                                                                                                                                                                                                                                                                                                    if selectedZoneCast ~= "9 Snowcap Ocean" then
                                                                                                                                                                                                                                                                                                        if selectedZoneCast ~= "10 Snowcap Ocean" then
                                                                                                                                                                                                                                                                                                            if selectedZoneCast ~= "1 SunStone" then
                                                                                                                                                                                                                                                                                                                if selectedZoneCast ~= "2 SunStone" then
                                                                                                                                                                                                                                                                                                                    if selectedZoneCast ~= "3 SunStone" then
                                                                                                                                                                                                                                                                                                                        if selectedZoneCast ~= "4 SunStone" then
                                                                                                                                                                                                                                                                                                                            if selectedZoneCast ~= "5 SunStone" then
                                                                                                                                                                                                                                                                                                                                if selectedZoneCast ~= "6 SunStone" then
                                                                                                                                                                                                                                                                                                                                    if selectedZoneCast ~= "7 SunStone" then
                                                                                                                                                                                                                                                                                                                                        if selectedZoneCast ~= "8 SunStone" then
                                                                                                                                                                                                                                                                                                                                            if selectedZoneCast ~= "9 SunStone" then
                                                                                                                                                                                                                                                                                                                                                if selectedZoneCast ~= "SunStone Hidden" then
                                                                                                                                                                                                                                                                                                                                                    if selectedZoneCast ~= "1 Terrapin Ocean" then
                                                                                                                                                                                                                                                                                                                                                        if selectedZoneCast ~= "2 Terrapin Ocean" then
                                                                                                                                                                                                                                                                                                                                                            if selectedZoneCast ~= "3 Terrapin Ocean" then
                                                                                                                                                                                                                                                                                                                                                                if selectedZoneCast ~= "4 Terrapin Ocean" then
                                                                                                                                                                                                                                                                                                                                                                    if selectedZoneCast ~= "5 Terrapin Ocean" then
                                                                                                                                                                                                                                                                                                                                                                        if selectedZoneCast ~= "6 Terrapin Ocean" then
                                                                                                                                                                                                                                                                                                                                                                            if selectedZoneCast ~= "7 Terrapin Ocean" then
                                                                                                                                                                                                                                                                                                                                                                                if selectedZoneCast ~= "1 Terrapin Olm" then
                                                                                                                                                                                                                                                                                                                                                                                    if selectedZoneCast ~= "2 Terrapin Olm" then
                                                                                                                                                                                                                                                                                                                                                                                        if selectedZoneCast ~= "3 Terrapin Olm" then
                                                                                                                                                                                                                                                                                                                                                                                            if selectedZoneCast ~= "1 The Arch" then
                                                                                                                                                                                                                                                                                                                                                                                                if selectedZoneCast ~= "2 The Arch" then
                                                                                                                                                                                                                                                                                                                                                                                                    if selectedZoneCast ~= "3 The Arch" then
                                                                                                                                                                                                                                                                                                                                                                                                        if selectedZoneCast ~= "1 Vertigo" then
                                                                                                                                                                                                                                                                                                                                                                                                            if selectedZoneCast ~= "2 Vertigo" then
                                                                                                                                                                                                                                                                                                                                                                                                                if selectedZoneCast == "3 Vertigo" then
                                                                                                                                                                                                                                                                                                                                                                                                                    v81 = CFrame.new(- 153, - 740, 1210)
                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                                                v81 = CFrame.new(- 79, - 740, 1197)
                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                                            v81 = CFrame.new(- 107, - 740, 1229)
                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                                                        v81 = CFrame.new(1280, 126, - 1133)
                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                                    v81 = CFrame.new(1091, 126, - 1187)
                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                                v81 = CFrame.new(1155, 126, - 1120)
                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                                            v81 = CFrame.new(16, 126, 1941)
                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                                        v81 = CFrame.new(99, 126, 1981)
                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                                    v81 = CFrame.new(95, 126, 1984)
                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                                v81 = CFrame.new(- 225, 126, 2122)
                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                            v81 = CFrame.new(- 253, 126, 1608)
                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                        v81 = CFrame.new(- 77, 126, 2006)
                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                    v81 = CFrame.new(419, 126, 2208)
                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                                v81 = CFrame.new(- 77, 126, 2283)
                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                            v81 = CFrame.new(82, 126, 2153)
                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                        v81 = CFrame.new(19, 126, 1940)
                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                    v81 = CFrame.new(- 1140, 126, - 1094)
                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                v81 = CFrame.new(- 843, 126, - 1234)
                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                            v81 = CFrame.new(- 959, 126, - 1417)
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                        v81 = CFrame.new(- 897, 126, - 1019)
                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                    v81 = CFrame.new(- 784, 126, - 1310)
                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                v81 = CFrame.new(- 967, 126, - 1105)
                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                            v81 = CFrame.new(- 1159, 126, - 1229)
                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                        v81 = CFrame.new(- 716, 126, - 1330)
                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                    v81 = CFrame.new(- 648, 126, - 996)
                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                v81 = CFrame.new(- 851, 126, - 1119)
                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                            v81 = CFrame.new(2337, 126, 2569)
                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                        v81 = CFrame.new(2571, 126, 2535)
                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                    v81 = CFrame.new(2364, 126, 2221)
                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                v81 = CFrame.new(3057, 126, 2596)
                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                            v81 = CFrame.new(2815, 126, 2805)
                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                        v81 = CFrame.new(2843, 126, 2672)
                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                    v81 = CFrame.new(2810, 275, 2604)
                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                v81 = CFrame.new(2774, 275, 2604)
                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                            v81 = CFrame.new(2777, 275, 2588)
                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                        v81 = CFrame.new(2810, 275, 2582)
                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                    v81 = CFrame.new(- 3, 126, 718)
                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                v81 = CFrame.new(- 1767, 141, 590)
                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                            v81 = CFrame.new(- 1767, 141, 590)
                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                        v81 = CFrame.new(- 1800, 141, 596)
                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                    v81 = CFrame.new(- 1782, 141, 613)
                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                v81 = CFrame.new(- 2039, 126, 632)
                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                            v81 = CFrame.new(- 1852, 126, 950)
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                        v81 = CFrame.new(- 1821, 142, 41)
                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                    v81 = CFrame.new(- 1516, 126, 517)
                                                                                                                                                                                                                                end
                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                v81 = CFrame.new(- 1480, 126, 534)
                                                                                                                                                                                                                            end
                                                                                                                                                                                                                        else
                                                                                                                                                                                                                            v81 = CFrame.new(- 1435, 126, 464)
                                                                                                                                                                                                                        end
                                                                                                                                                                                                                    else
                                                                                                                                                                                                                        v81 = CFrame.new(- 1495, 126, 592)
                                                                                                                                                                                                                    end
                                                                                                                                                                                                                else
                                                                                                                                                                                                                    v81 = CFrame.new(- 1650, 125, 504)
                                                                                                                                                                                                                end
                                                                                                                                                                                                            else
                                                                                                                                                                                                                v81 = CFrame.new(- 1593, 126, 564)
                                                                                                                                                                                                            end
                                                                                                                                                                                                        else
                                                                                                                                                                                                            v81 = CFrame.new(- 587, 126, - 172)
                                                                                                                                                                                                        end
                                                                                                                                                                                                    else
                                                                                                                                                                                                        v81 = CFrame.new(- 450, 126, 554)
                                                                                                                                                                                                    end
                                                                                                                                                                                                else
                                                                                                                                                                                                    v81 = CFrame.new(- 708, 126, - 459)
                                                                                                                                                                                                end
                                                                                                                                                                                            else
                                                                                                                                                                                                v81 = CFrame.new(1667, 126, - 2518)
                                                                                                                                                                                            end
                                                                                                                                                                                        else
                                                                                                                                                                                            v81 = CFrame.new(- 568, 126, - 512)
                                                                                                                                                                                        end
                                                                                                                                                                                    else
                                                                                                                                                                                        v81 = CFrame.new(2084, 126, 863)
                                                                                                                                                                                    end
                                                                                                                                                                                else
                                                                                                                                                                                    v81 = CFrame.new(2668, 126, - 699)
                                                                                                                                                                                end
                                                                                                                                                                            else
                                                                                                                                                                                v81 = CFrame.new(2475, 54, - 675)
                                                                                                                                                                            end
                                                                                                                                                                        else
                                                                                                                                                                            v81 = CFrame.new(2462, 126, - 823)
                                                                                                                                                                        end
                                                                                                                                                                    else
                                                                                                                                                                        v81 = CFrame.new(2520, 126, - 813)
                                                                                                                                                                    end
                                                                                                                                                                else
                                                                                                                                                                    v81 = CFrame.new(2672, 126, - 820)
                                                                                                                                                                end
                                                                                                                                                            else
                                                                                                                                                                v81 = CFrame.new(2638, 126, - 739)
                                                                                                                                                            end
                                                                                                                                                        else
                                                                                                                                                            v81 = CFrame.new(554, 146, 296)
                                                                                                                                                        end
                                                                                                                                                    else
                                                                                                                                                        v81 = CFrame.new(525, 146, 288)
                                                                                                                                                    end
                                                                                                                                                else
                                                                                                                                                    v81 = CFrame.new(537, 146, 329)
                                                                                                                                                end
                                                                                                                                            else
                                                                                                                                                v81 = CFrame.new(528, 146, 304)
                                                                                                                                            end
                                                                                                                                        else
                                                                                                                                            v81 = CFrame.new(538, 146, 294)
                                                                                                                                        end
                                                                                                                                    else
                                                                                                                                        v81 = CFrame.new(687, 126, 353)
                                                                                                                                    end
                                                                                                                                else
                                                                                                                                    v81 = CFrame.new(287, 126, 24)
                                                                                                                                end
                                                                                                                            else
                                                                                                                                v81 = CFrame.new(863, 126, 470)
                                                                                                                            end
                                                                                                                        else
                                                                                                                            v81 = CFrame.new(418, 126, 612)
                                                                                                                        end
                                                                                                                    else
                                                                                                                        v81 = CFrame.new(590, 126, - 146)
                                                                                                                    end
                                                                                                                else
                                                                                                                    v81 = CFrame.new(- 1398, 126, 1596)
                                                                                                                end
                                                                                                            else
                                                                                                                v81 = CFrame.new(- 1436, 126, 1766)
                                                                                                            end
                                                                                                        else
                                                                                                            v81 = CFrame.new(- 1251, 126, 1760)
                                                                                                        end
                                                                                                    else
                                                                                                        v81 = CFrame.new(- 2706, 160, 1743)
                                                                                                    end
                                                                                                else
                                                                                                    v81 = CFrame.new(- 2766, 230, 1693)
                                                                                                end
                                                                                            else
                                                                                                v81 = CFrame.new(- 3086, 126, 1498)
                                                                                            end
                                                                                        else
                                                                                            v81 = CFrame.new(- 3588, 126, 1605)
                                                                                        end
                                                                                    else
                                                                                        v81 = CFrame.new(- 3588, 126, 1605)
                                                                                    end
                                                                                else
                                                                                    v81 = CFrame.new(- 2631, 126, 1428)
                                                                                end
                                                                            else
                                                                                v81 = CFrame.new(- 2454, 126, 1448)
                                                                            end
                                                                        else
                                                                            v81 = CFrame.new(- 2595, 126, 1483)
                                                                        end
                                                                    else
                                                                        v81 = CFrame.new(- 1664, - 239, - 3083)
                                                                    end
                                                                else
                                                                    v81 = CFrame.new(- 1656, - 239, - 2775)
                                                                end
                                                            else
                                                                v81 = CFrame.new(- 1486, - 239, - 2870)
                                                            end
                                                        else
                                                            v81 = CFrame.new(- 1068, 126, - 3108)
                                                        end
                                                    else
                                                        v81 = CFrame.new(1521, 126, - 3543)
                                                    end
                                                else
                                                    v81 = CFrame.new(v80.Position.X, 126, v80.Position.Z)
                                                end
                                            else
                                                v81 = CFrame.new(v80.Position.X, 126, v80.Position.Z)
                                            end
                                            v76.CFrame = v81
                                            local v82 = Instance.new("Part")
                                            v82.Size = v78
                                            v82.Position = v76.Position + v79
                                            v82.Anchored = true
                                            v82.Parent = v76
                                            v82.BrickColor = BrickColor.new("Bright blue")
                                            v82.Transparency = 1
                                        end
                                    else
                                        local v83 = Workspace.zones.fishing:FindFirstChild("Deep Ocean")
                                        if v83 then
                                            local v84 = v83:FindFirstChild("Abundance")
                                            if v84 and v84.Value == "Chinook Salmon" then
                                                v76.CFrame = CFrame.new(v83.Position.X, 126.564, v83.Position.Z)
                                                local v85 = Instance.new("Part")
                                                v85.Size = v78
                                                v85.Position = v76.Position + v79
                                                v85.Anchored = true
                                                v85.Parent = v76
                                                v85.BrickColor = BrickColor.new("Bright blue")
                                                v85.Transparency = 1
                                            end
                                        end
                                    end
                                else
                                    local v86 = Workspace.zones.fishing:FindFirstChild("Deep Ocean")
                                    if v86 then
                                        local v87 = v86:FindFirstChild("Abundance")
                                        if v87 and v87.Value == "Swordfish" then
                                            v76.CFrame = CFrame.new(v86.Position.X, 126.564, v86.Position.Z)
                                            local v88 = Instance.new("Part")
                                            v88.Size = v78
                                            v88.Position = v76.Position + v79
                                            v88.Anchored = true
                                            v88.Parent = v76
                                            v88.BrickColor = BrickColor.new("Bright blue")
                                            v88.Transparency = 1
                                        end
                                    end
                                end
                            else
                                local v89 = Workspace.zones.fishing:FindFirstChild("Deep Ocean")
                                if v89 then
                                    local v90 = v89:FindFirstChild("Abundance")
                                    if v90 and v90.Value == "Bluefin Tuna" then
                                        v76.CFrame = CFrame.new(v89.Position.X, 126.564, v89.Position.Z)
                                        local v91 = Instance.new("Part")
                                        v91.Size = v78
                                        v91.Position = v76.Position + v79
                                        v91.Anchored = true
                                        v91.Parent = v76
                                        v91.BrickColor = BrickColor.new("Bright blue")
                                        v91.Transparency = 1
                                    end
                                end
                            end
                        else
                            print("Bobber not found in the tool.")
                        end
                    else
                        print("No tool found in the character.")
                    end
                end
                task.wait(0.2)
            end
        end)
    end
end
function ZoneCastingFree()
    spawn(function()
        while AutoZoneCastFree do
            local v92 = game.Players.LocalPlayer.Character
            if v92 then
                local v93 = v92:FindFirstChildOfClass("Tool")
                if v93 then
                    local v94 = v93:FindFirstChild("bobber")
                    if v94 then
                        local v95 = v94:FindFirstChild("RopeConstraint")
                        if v95 then
                            v95.Length = 2000000
                        end
                        local v96 = Vector3.new(10, 1, 10)
                        local v97 = Vector3.new(0, - 4, 0)
                        local v98 = Workspace.zones.fishing:FindFirstChild(selectedZoneCastFree)
                        if v98 then
                            local v99 = nil
                            if selectedZoneCastFree ~= "Isonade" then
                                if selectedZoneCastFree ~= "Deep Ocean" then
                                    if selectedZoneCastFree ~= "Desolate Deep" then
                                        if selectedZoneCastFree ~= "Forsaken Shores" then
                                            if selectedZoneCastFree ~= "Harvesters Spike" then
                                                if selectedZoneCastFree ~= "Moosewood Docks" then
                                                    if selectedZoneCastFree ~= "Moosewood Ocean" then
                                                        if selectedZoneCastFree ~= "Moosewood Ocean Mythical" then
                                                            if selectedZoneCastFree ~= "Moosewood Pond" then
                                                                if selectedZoneCastFree ~= "Mushgrove Water" then
                                                                    if selectedZoneCastFree ~= "Ocean" then
                                                                        if selectedZoneCastFree ~= "Roslit Bay" then
                                                                            if selectedZoneCastFree ~= "Roslit Bay Ocean" then
                                                                                if selectedZoneCastFree ~= "Roslit Pond" then
                                                                                    if selectedZoneCastFree ~= "Roslit Pond Seaweed" then
                                                                                        if selectedZoneCastFree ~= "Scallop Ocean" then
                                                                                            if selectedZoneCastFree ~= "Snowcap Ocean" then
                                                                                                if selectedZoneCastFree ~= "Snowcap Pond" then
                                                                                                    if selectedZoneCastFree ~= "Sunstone" then
                                                                                                        if selectedZoneCastFree ~= "Terrapin Ocean" then
                                                                                                            if selectedZoneCastFree ~= "The Arch" then
                                                                                                                if selectedZoneCastFree == "Vertigo" then
                                                                                                                    v99 = CFrame.new(- 75, - 740, 1200)
                                                                                                                end
                                                                                                            else
                                                                                                                v99 = CFrame.new(1076, 126, - 1202)
                                                                                                            end
                                                                                                        else
                                                                                                            v99 = CFrame.new(- 57, 126, 2011)
                                                                                                        end
                                                                                                    else
                                                                                                        v99 = CFrame.new(- 645, 126, - 955)
                                                                                                    end
                                                                                                else
                                                                                                    v99 = CFrame.new(2777, 275, 2605)
                                                                                                end
                                                                                            else
                                                                                                v99 = CFrame.new(2308, 126, 2200)
                                                                                            end
                                                                                        else
                                                                                            v99 = CFrame.new(16, 126, 730)
                                                                                        end
                                                                                    else
                                                                                        v99 = CFrame.new(- 1804, 141, 625)
                                                                                    end
                                                                                else
                                                                                    v99 = CFrame.new(- 1807, 141, 599)
                                                                                end
                                                                            else
                                                                                v99 = CFrame.new(- 1825, 126, 946)
                                                                            end
                                                                        else
                                                                            v99 = CFrame.new(- 1650, 126, 504)
                                                                        end
                                                                    else
                                                                        v99 = CFrame.new(- 5712, 126, 4059)
                                                                    end
                                                                else
                                                                    v99 = CFrame.new(2541, 126, - 792)
                                                                end
                                                            else
                                                                v99 = CFrame.new(526, 126, 305)
                                                            end
                                                        else
                                                            v99 = CFrame.new(270, 126, 52)
                                                        end
                                                    else
                                                        v99 = CFrame.new(890, 126, 465)
                                                    end
                                                else
                                                    v99 = CFrame.new(345, 126, 214)
                                                end
                                            else
                                                v99 = CFrame.new(- 1234, 126, 1748)
                                            end
                                        else
                                            v99 = CFrame.new(- 2595, 126, 1483)
                                        end
                                    else
                                        v99 = CFrame.new(- 1068, 126, - 3108)
                                    end
                                else
                                    v99 = CFrame.new(1521, 126, - 3543)
                                end
                            else
                                v99 = CFrame.new(v98.Position.X, 126, v98.Position.Z)
                            end
                            v94.CFrame = v99
                            local v100 = Instance.new("Part")
                            v100.Size = v96
                            v100.Position = v94.Position + v97
                            v100.Anchored = true
                            v100.Parent = v94
                            v100.BrickColor = BrickColor.new("Bright blue")
                            v100.Transparency = 1
                        end
                    else
                        print("Bobber not found in the tool.")
                    end
                else
                    print("No tool found in the character.")
                end
            end
            task.wait(0.01)
        end
    end)
end
function AntiAfk2()
	-- upvalues: (ref) vu38
    spawn(function()
		-- upvalues: (ref) vu38
        while vu38 do
            game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("afk"):FireServer(false)
            task.wait(0.01)
        end
    end)
end
v25.ChildAdded:Connect(function(p101)
	-- upvalues: (ref) vu33
    if p101:IsA("ScreenGui") then
        return
    else
        local v102 = (p101.Name == "reel" and vu33 and true or false) and ReplicatedStorage:WaitForChild("events"):WaitForChild("reelfinished")
        if v102 then
            while true do
                local v103 = math.random(2, 6)
                print(v103)
                task.wait(v103)
                v102:FireServer(100, false)
            end
        else
            return
        end
    end
end)
function Pidoras()
	-- upvalues: (ref) vu34
    spawn(function()
		-- upvalues: (ref) vu34
        while vu34 do
            local v104 = game.Players.LocalPlayer.Character
            if v104 then
                local v105 = v104:FindFirstChildOfClass("Tool")
                if v105 and not v105:FindFirstChild("bobber") then
                    local v106 = v105:FindFirstChild("events")
                    if v106 then
                        v106 = v105.events:FindFirstChild("cast")
                    end
                    if v106 then
                        if CastMode ~= "Legit" then
                            if CastMode == "Perfect" then
                                v106:FireServer(100)
                            end
                        else
                            local v107 = math.random() * 9 + 90
                            local v108 = string.format("%.4f", v107)
                            print(v108)
                            v106:FireServer((math.random(90, 99)))
                        end
                        local v109 = v104:FindFirstChild("HumanoidRootPart")
                        if v109 then
                            v109.Anchored = false
                        end
                    end
                end
                task.wait(0.5)
            end
        end
    end)
end
NoclipConnection = RunService.Stepped:Connect(function()
	-- upvalues: (ref) vu35, (ref) vu21
    if vu35 == true and vu21 ~= nil then
        local v110 = vu21
        local v111, v112, v113 = pairs(v110:GetDescendants())
        while true do
            local v114
            v113, v114 = v111(v112, v113)
            if v113 == nil then
                break
            end
            if v114:IsA("BasePart") and v114.CanCollide == true then
                v114.CanCollide = false
            end
        end
    end
end)
function rememberPosition()
	-- upvalues: (ref) vu26
    spawn(function()
		-- upvalues: (ref) vu26
        local v115 = game.Players.LocalPlayer
        local v116 = v115.Character or v115.CharacterAdded:Wait()
        v116:FindFirstChildOfClass("Humanoid")
        local v117 = v116:WaitForChild("HumanoidRootPart")
        local v118 = v117.CFrame
        local v119 = Instance.new("BodyVelocity")
        v119.Velocity = Vector3.new(0, 0, 0)
        v119.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        v119.Parent = v117
        local v120 = Instance.new("BodyGyro")
        v120.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        v120.D = 100
        v120.P = 10000
        v120.CFrame = v118
        v120.Parent = v117
        while vu26 do
            v117.CFrame = v118
            task.wait(0.01)
        end
        if v119 then
            v119:Destroy()
        end
        if v120 then
            v120:Destroy()
        end
    end)
end
function AutoSellz()
	-- upvalues: (ref) vu37
    spawn(function()
		-- upvalues: (ref) vu37
        while vu37 do
            SellFishAndReturnAll()
            task.wait(AutoSellDelay)
        end
    end)
end
function Appraise()
	-- upvalues: (ref) vu39
    spawn(function()
		-- upvalues: (ref) vu39
        while vu39 do
            workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
            task.wait(0.1)
        end
    end)
end
function SellFishAndReturnAll()
	-- upvalues: (ref) vu26
    local v121 = game.Players.LocalPlayer
    local v122 = (v121.Character or v121.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
    local v123 = v122.CFrame
    local v124 = CFrame.new(464, 151, 232)
    local v125
    if vu26 then
        v125 = true
        vu26 = false
    else
        v125 = false
    end
    v122.CFrame = v124
    task.wait(0.5)
    workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant"):WaitForChild("sellall"):InvokeServer()
    task.wait(3)
    v122.CFrame = v123
    if v125 then
        vu26 = true
        rememberPosition()
    end
end
function SellFishAndReturnOne()
	-- upvalues: (ref) vu26
    local v126 = game.Players.LocalPlayer
    local v127 = (v126.Character or v126.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
    local v128 = v127.CFrame
    local v129 = CFrame.new(464, 151, 232)
    local v130
    if vu26 then
        v130 = true
        vu26 = false
    else
        v130 = false
    end
    v127.CFrame = v129
    task.wait(0.5)
    workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant"):WaitForChild("sell"):InvokeServer()
    task.wait(3)
    v127.CFrame = v128
    if v130 then
        vu26 = true
        rememberPosition()
    end
end
v6.Home:AddSection("Change Log:")
v6.Home:AddParagraph({
    ["Title"] = "Information",
    ["Content"] = "[\226\156\133] - Added\n[\226\152\132] - Changed\n[\226\157\140] - Removed\n[\226\173\144] - Premium Feature"
})
v6.Home:AddParagraph({
    ["Title"] = "v1.9 - Byppass & Updates!",
    ["Content"] = "[\226\173\144] - More Zones in Zone-Cast\n[\226\156\133] - More Zones in FREE Zone-Cast\n[\226\156\133] - Bypassed AC\n[\226\156\133] - Teleport new zone (fish and place)\n[\226\156\133] - Auto Upgrade + TP to treasure\n[\226\152\132] - Fixed spam fish after remove texture (mobile)\n[\226\157\140] - Webhook deleted sorry\n[\226\157\140] - Halloween tp (witch), item grabber"
})
v6.Home:AddParagraph({
    ["Title"] = "v1.8 - Updates!",
    ["Content"] = "[\226\156\133] - Auto Zone-Cast (Free Version)\n[\226\152\132] - Fixed Shake (select)\n[\226\152\132] - Fixed Auto Cast (teleport to million cords)\n[\226\152\132] - Crab Cage place fixed"
})
v6.Home:AddParagraph({
    ["Title"] = "v1.7 - Bug fixes & updates!",
    ["Content"] = "[\226\173\144] - Updates Zone-Cast\n[\226\173\144] - No Shake Delay updated (phantom and mouse)\n[\226\156\133] - Safe Zone\n[\226\156\133] - Auto Cast change (Legit/Perfect)\n[\226\156\133] - Crab Cages\n[\226\152\132] - Auto Shake mode fixed\n[\226\152\132] - Fixed Mobile toggle"
})
v6.Home:AddParagraph({
    ["Title"] = "v1.6 - Fixes!",
    ["Content"] = "[\226\173\144] - Zone Casting Fix\n[\226\173\144] - Auto Shake No Delay fix speed\n[\226\156\133] - Teleport to Midas Rod\n[\226\152\132] - Better sell buttons\n[\226\152\132] - Auto Shake Dropdown\n[\226\152\132] - Auto Cast & Reel & Shake in one toggle now"
})
v6.Home:AddParagraph({
    ["Title"] = "v1.5 - Meow!",
    ["Content"] = "[\226\173\144] - Zone Casting Updated TOO much zones\n[\226\173\144] - Zone Helper info about every zone\n[\226\156\133] - Player Move Speed\n[\226\156\133] - Player Jump Power\n[\226\156\133] - Fly\n[\226\156\133] - Roblox Radio\n[\226\156\133] - Auto Appraiser\n[\226\152\132] - Better Freeze\n[\226\152\132] - Auto Shake (mouse)\n[\226\152\132] - Auto Cast & Reel (one button)"
})
v6.Home:AddParagraph({
    ["Title"] = "v1.4 - Buttons!",
    ["Content"] = "[\226\156\133] - 4 buttons in teleport\n[\226\156\133] - Button to enable fps cap"
})
v6.Home:AddParagraph({
    ["Title"] = "v1.3 - FpS",
    ["Content"] = "[\226\156\133] - Fps Cap"
})
v6.Home:AddParagraph({
    ["Title"] = "v1.2 - Fishing",
    ["Content"] = "[\226\173\144] - No Shake Delay all\n[\226\156\133] - AntiAFK added\n[\226\156\133] - Auto Bait\n[\226\156\133] - Remove all flags (fps)\n[\226\156\133] - Fish Area teleport\n[\226\156\133] - Auto Cast more safest\n[\226\152\132] - Better Freeze\n[\226\152\132] - Shake Delay minimum 0.2\n[\226\152\132] - Auto Shake v1 and v2 better"
})
v6.Home:AddParagraph({
    ["Title"] = "v1.1 - Fixes",
    ["Content"] = "[\226\152\132] Phantom Clicks - fixed\n[\226\152\132] Better Freeze\n[\226\173\144] - No Shake Delay (Mouse Clicks)"
})
v6.Home:AddParagraph({
    ["Title"] = "v1 - Meow",
    ["Content"] = "[\226\152\132] Auto Shake Speed 0.3-1\n[\226\152\132] Webhook Loger fixed\n[\226\156\133] Black Screen\n[\226\156\133] White Screen\n[\226\156\133] FpS Booster\n[\226\173\144] No Shake Delay (Premium)"
})
v6.Home:AddParagraph({
    ["Title"] = "v0.9 - Fixes",
    ["Content"] = "[\226\156\133] ChangeLog information\n[\226\152\132] Auto Freeze fix\n[\226\157\140] Auto Cast Chance (because bugs ~solara)\n[\226\156\133] Auto Cast - Random Chance from 90 to 99"
})
v6.Home:AddParagraph({
    ["Title"] = "v0.8 - Webhook & Fishing",
    ["Content"] = "[\226\156\133] Webhook fixed bugs\n[\226\152\132] Fixed Auto Freeze\n[\226\156\133] Auto Cast chance\n[\226\156\133] Auto sell fish"
})
v6.Home:AddParagraph({
    ["Title"] = "v0.7 - Webhook",
    ["Content"] = "[\226\156\133] Webhook URL\n[\226\156\133] Webhook Delay messages\n[\226\156\133] Webhook On/Off"
})
v6.Home:AddParagraph({
    ["Title"] = "v0.6 - Items",
    ["Content"] = "[\226\152\132] Teleport Items - +2 rods"
})
v6.Home:AddParagraph({
    ["Title"] = "v0.5 - Fixes",
    ["Content"] = "[\226\152\132] Bigger UI\n[\226\156\133] Auto Shake V2\n[\226\152\132] Auto Shake more information\n[\226\156\133] Teleports Place - New Location\n[\226\156\133] Teleport NPCs - Updated\n[\226\156\133] Ui Toggle (Mobile)"
})
v6.Home:AddParagraph({
    ["Title"] = "v0.4 - Fixes",
    ["Content"] = "[\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189] Freeze Character\n[\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189] Auto Cast Fix Bugs (v0.3)"
})
v6.Home:AddParagraph({
    ["Title"] = "v0.3 - Teleports",
    ["Content"] = "[\226\152\132] Fixed NPCs teleport\n[\226\152\132] Fixed Item Grabber (Halloween)\n[\226\156\133] Teleport Fish Radar\n[\226\156\133] Teleport Basic Diving Gear"
})
v6.Home:AddParagraph({
    ["Title"] = "v0.2 - Bug Fixes",
    ["Content"] = "[\226\152\132] Auto Shake\n[\226\156\133] Auto Shake Delay\n[\226\152\132] Auto Reel\n[\226\152\132] Auto Cast\n[\226\156\133] Teleport Place\n[\226\156\133] Teleport NPCs\n[\226\156\133] Teleport Items\n[\226\156\133] Item Graber (Halloween)\n[\226\156\133] Noclip\n[\226\156\133] Infinity Oxygen"
})
v6.Home:AddParagraph({
    ["Title"] = "v0.1 - Release",
    ["Content"] = "[\226\156\133] Auto Fish\n[\226\156\133] Auto Sell All"
})
v6.Premium:AddSection("Fishing\226\173\144")
local vu131 = v6.Premium:AddToggle("MyAutoShake3", {
    ["Title"] = "No Shake Delay | Best",
    ["Default"] = false
})
local v132 = vu131
vu131.OnChanged(v132, function(_)
	-- upvalues: (ref) vu30, (ref) vu131
    if WDIUWngfiuNFDJWKDNJNIKNI ~= true then
        warn("No Premium")
    else
        vu30 = vu131.Value
    end
end)
v6.Premium:AddDropdown("DropdownZoneCast", {
    ["Title"] = "Select zone to cast anywhere",
    ["Values"] = {
        "FischFright24",
        "Isonade",
        "Bluefin Tuna Abundance",
        "Chinook Salmon Abundance",
        "",
        "Deep Ocean",
        "1 Desolate",
        "2 Desolate",
        "3 Desolate",
        "4 Desolate",
        "1 Harvesters Spike",
        "2 Harvesters Spike",
        "3 Harvesters Spike",
        "1 Forsaken Shores",
        "2 Forsaken Shores",
        "3 Forsaken Shores",
        "1 Forsaken Shores Ocean",
        "2 Forsaken Shores Ocean",
        "3 Forsaken Shores Ocean",
        "1 Forsaken Shores Pond",
        "2 Forsaken Shores Pond",
        "1 Moosewood Docks",
        "2 Moosewood Docks",
        "3 Moosewood Docks",
        "1 Moosewood Ocean",
        "2 Moosewood Ocean",
        "3 Moosewood Ocean",
        "1 Moosewood Ocean Mythical",
        "2 Moosewood Ocean Mythical",
        "1 Moosewood Pond",
        "2 Moosewood Pond",
        "3 Moosewood Pond",
        "4 Moosewood Pond",
        "5 Moosewood Pond",
        "1 Mushgrove Water",
        "2 Mushgrove Water",
        "3 Mushgrove Water",
        "4 Mushgrove Water",
        "5 Mushgrove Water",
        "6 Mushgrove Water",
        "1 Ocean",
        "2 Ocean",
        "3 Ocean",
        "4 Ocean",
        "5 Ocean",
        "6 Ocean",
        "1 Roslit Bay",
        "2 Roslit Bay",
        "3 Roslit Bay",
        "4 Roslit Bay",
        "5 Roslit Bay",
        "6 Roslit Bay",
        "1 Roslit Pond",
        "2 Roslit Pond",
        "3 Roslit Pond",
        "Roslit Pond Seaweed",
        "Scallop Ocean",
        "1 Snowcap Ocean",
        "2 Snowcap Ocean",
        "3 Snowcap Ocean",
        "4 Snowcap Ocean",
        "5 Snowcap Ocean",
        "6 Snowcap Ocean",
        "7 Snowcap Ocean",
        "8 Snowcap Ocean",
        "9 Snowcap Ocean",
        "10 Snowcap Ocean",
        "1 SunStone",
        "2 SunStone",
        "3 SunStone",
        "4 SunStone",
        "5 SunStone",
        "6 SunStone",
        "7 SunStone",
        "8 SunStone",
        "9 SunStone",
        "SunStone Hidden",
        "1 Terrapin Ocean",
        "2 Terrapin Ocean",
        "3 Terrapin Ocean",
        "4 Terrapin Ocean",
        "5 Terrapin Ocean",
        "6 Terrapin Ocean",
        "7 Terrapin Ocean",
        "1 Terrapin Olm",
        "2 Terrapin Olm",
        "3 Terrapin Olm",
        "1 The Arch",
        "2 The Arch",
        "3 The Arch",
        "1 Vertigo",
        "2 Vertigo",
        "3 Vertigo"
    },
    ["Multi"] = false
}):OnChanged(function(p133)
    print("Dropdown changed:", p133)
    selectedZoneCast = p133
end)
v6.Premium:AddToggle("ToggleZoneCast1214", {
    ["Title"] = "Enable cast selected zone",
    ["Default"] = false
}):OnChanged(function(p134)
	-- upvalues: (ref) vu31
    vu31 = p134
    if WDIUWngfiuNFDJWKDNJNIKNI ~= true then
        print("No Premium")
    elseif vu31 then
        ZoneCasting()
    end
end)
v6.Premium:AddSection("Zone-Helper")
v6.Premium:AddParagraph({
    ["Title"] = "Events",
    ["Content"] = "First 3 - Event zones\nFischFright24 - Fright Pool\nChinook Salmon - Squid Spot"
})
v6.Premium:AddParagraph({
    ["Title"] = "Desolate",
    ["Content"] = "1 Desolate - default\n2 Desolate - banditifish\n3 Desolate - Cockatoo Squid\n4 Desolate - Phantom Ray"
})
v6.Premium:AddParagraph({
    ["Title"] = "Harvesters Spike",
    ["Content"] = "1 Harvesters Spike - Bluefin Tuna\n2 Harvesters Spike - Sawfish\n3 Harvesters Spike - Bluefin Tuna"
})
v6.Premium:AddParagraph({
    ["Title"] = "Forsaken Shores",
    ["Content"] = "1 Forsaken Shores - default\n2 Forsaken Shores - Scurvy Sailfish\n3 Forsaken Shores - Cutlass Fish"
})
v6.Premium:AddParagraph({
    ["Title"] = "Forsaken Shores Ocean",
    ["Content"] = "1 Forsaken Shores Ocean - default\n2 Forsaken Shores Ocean - Shipwreck Barracuda\n3 Forsaken Shores Ocean - Golden Seahorse"
})
v6.Premium:AddParagraph({
    ["Title"] = "Forsaken Shores Pond",
    ["Content"] = "1 Forsaken Shores Pond - default\n2 Forsaken Shores Pond - Captains Goldfish"
})
v6.Premium:AddParagraph({
    ["Title"] = "Moosewood Docks",
    ["Content"] = "1 Moosewood Docks - default\n2 Moosewood Docks - Flounder\n3 Moosewood Docks - Trout"
})
v6.Premium:AddParagraph({
    ["Title"] = "Moosewood Ocean",
    ["Content"] = "1 Moosewood Ocean - default\n2 Moosewood Ocean - Anchovy\n3 Moosewood Ocean - Barracuda"
})
v6.Premium:AddParagraph({
    ["Title"] = "Moosewood Onean Mythical",
    ["Content"] = "1 Moosewood Onean Mythical - default\n2 Moosewood Onean Mythical - Yellowfin Tuna"
})
v6.Premium:AddParagraph({
    ["Title"] = "Moosewood Pond",
    ["Content"] = "1 Moosewood Pond - default\n2 Moosewood Pond - GoldFish\n3 Moosewood Pond - Pike\n4 Moosewood Pond - Pike 2\n5 Moosewood Pond - Carp"
})
v6.Premium:AddParagraph({
    ["Title"] = "Mushgrove Water",
    ["Content"] = "1 Mushgrove Water - default\n2 Mushgrove Water - Grey Carp\n3 Mushgrove Water - Marsh Gar\n4 Mushgrove Water - Bowfin\n5 Mushgrove Water - White Perch\n6 Mushgrove Water - Alligator"
})
v6.Premium:AddParagraph({
    ["Title"] = "Ocean",
    ["Content"] = "1 Ocean - default\n2 Ocean - Haddock\n3 Ocean - AmberJack\n4 Ocean - Halibut\n5 Ocean - Sardine\n6 Ocean - Cod"
})
v6.Premium:AddParagraph({
    ["Title"] = "Roslit Bay",
    ["Content"] = "1 Roslit Bay - default\n2 Roslit Bay - Nurse Shark\n3 Roslit Bay - Angelfish\n4 Roslit Bay - Pufferfish\n5 Roslit Bay - Blue Tang\n6 Roslit Bay - Clownfish"
})
v6.Premium:AddParagraph({
    ["Title"] = "Roslit Bay Ocean",
    ["Content"] = "1 Roslit Bay Ocean - default\n2 Roslit Bay Ocean - Halibut\n3 Roslit Bay Ocean - Squid"
})
v6.Premium:AddParagraph({
    ["Title"] = "Roslit Pond",
    ["Content"] = "1 Roslit Pond - default\n2 Roslit Pond - Perch\n3 Roslit Pond - Arapaima"
})
v6.Premium:AddParagraph({
    ["Title"] = "Roslit Pond Seaweed",
    ["Content"] = "Roslit Pond Seaweed - Suckermouth Catfish"
})
v6.Premium:AddParagraph({
    ["Title"] = "Scallop Ocean"
})
v6.Premium:AddParagraph({
    ["Title"] = "Snowcap Ocean",
    ["Content"] = "1 Snowcap Ocean - default\n2 Snowcap Ocean - Glacier Pike\n3 Snowcap Ocean - Burbot\n4 Snowcap Ocean - Sturgeon\n5 Snowcap Ocean - Glacierfish\n6 Snowcap Ocean - Lingcod\n7 Snowcap Ocean - Bluegill\n8 Snowcap Ocean - Artic Char\n9 Snowcap Ocean - Herring\n10 Snowcap Ocean - Red Drum"
})
v6.Premium:AddParagraph({
    ["Title"] = "SunStone",
    ["Content"] = "1 SunStone - default\n2 SunStone - Chinfish\n3 SunStone - Mahi Mahi\n4 SunStone - Red Tang\n5 SunStone - Sweetfish\n6 SunStone - Trumpetfish\n7 SunStone - Glassfish\n8 SunStone - Sunfish\n9 SunStone - Longtail Bass"
})
v6.Premium:AddParagraph({
    ["Title"] = "SunStone Hidden"
})
v6.Premium:AddParagraph({
    ["Title"] = "Terrapin Ocean",
    ["Content"] = "1 Terrapin Ocean - default\n2 Terrapin Ocean - Golden Smallmouth Bass\n3 Terrapin Ocean - Redeye Bass\n4 Terrapin Ocean - Walleye\n5 Terrapin Ocean - White Bass\n6 Terrapin Ocean - Chinook Salmon\n7 Terrapin Ocean - Walleye 2"
})
v6.Premium:AddParagraph({
    ["Title"] = "Terrapin Olm",
    ["Content"] = "1 Terrapin Olm - default\n2 Terrapin Olm - Olm\n3 Terrapin Olm - Olm 2"
})
v6.Premium:AddParagraph({
    ["Title"] = "The Arch",
    ["Content"] = "1 The Arch - default\n2 The Arch - Rabbitfish\n3 The Arch - Salmon"
})
v6.Premium:AddParagraph({
    ["Title"] = "Vertigo",
    ["Content"] = "1 Vertigo - default\n2 Vertigo - Twilight Eel\n3 Vertigo - Spiderfish"
})
v6.Main:AddSection("Fishing")
v6.Main:AddDropdown("DropdownCast", {
    ["Title"] = "Select Auto Shake Mode:",
    ["Description"] = "Legit - undetect for AC\nPerfect - always 100",
    ["Values"] = {
        "Legit",
        "Perfect"
    },
    ["Multi"] = false,
    ["Default"] = 1
}):OnChanged(function(p135)
    CastMode = p135
    print("Auto Cast Mode:", p135)
end)
v6.Main:AddDropdown("DropdownShake", {
    ["Title"] = "Select Auto Shake Mode:",
    ["Description"] = "Mouse - Make sure to hide UI and toggle chat off in order for Auto Shake to work!",
    ["Values"] = {
        "Mouse",
        "Phantom"
    },
    ["Multi"] = false,
    ["Default"] = 1
}):OnChanged(function(p136)
    ShakeMode = p136
    print("Auto Shake Mode:", p136)
end)
v6.Main:AddSlider("Slider", {
    ["Title"] = "AutoShake Delay",
    ["Description"] = "Change the delay between every shake",
    ["Default"] = 2,
    ["Min"] = 0.2,
    ["Max"] = 1,
    ["Rounding"] = 1,
    ["Callback"] = function(p137)
		-- upvalues: (ref) vu32
        vu32 = p137
    end
}):SetValue(0.2)
v6.Main:AddToggle("autoReelCastShakeT", {
    ["Title"] = "Auto Fish",
    ["Default"] = false
}):OnChanged(function(p138)
	-- upvalues: (ref) vu33, (ref) vu34, (ref) vu27, (ref) vu29, (ref) vu28, (ref) vu21
    vu33 = p138
    vu34 = p138
    if vu34 then
        Pidoras()
    end
    if ShakeMode ~= "Mouse" then
        vu27 = false
        vu29 = p138
    else
        vu27 = p138
        vu29 = false
    end
    vu28 = p138
    AutoFish5()
    if vu34 == true and vu21:FindFirstChildOfClass("Tool") ~= nil then
        local v139 = vu21:FindFirstChildOfClass("Tool")
        if v139:FindFirstChild("events"):WaitForChild("cast") ~= nil then
            local v140 = math.random() * 9 + 90
            local v141 = string.format("%.4f", v140)
            print(v141)
            local v142 = math.random(90, 99)
            v139.events.cast:FireServer(v142)
        end
    end
end)
local vu143 = v6.Main:AddToggle("MyFreeze", {
    ["Title"] = "Freeze Position",
    ["Description"] = "Freezes player position and rotation",
    ["Default"] = false
})
local v144 = vu143
vu143.OnChanged(v144, function()
	-- upvalues: (ref) vu26, (ref) vu143
    vu26 = vu143.Value
    if vu26 then
        rememberPosition()
    end
end)
local vu145 = v6.Main:AddToggle("AntiAfk3", {
    ["Title"] = "Anti-AFK",
    ["Description"] = "Prevents the player from being marked as AFK",
    ["Default"] = false
})
local v146 = vu145
vu145.OnChanged(v146, function(_)
	-- upvalues: (ref) vu38, (ref) vu145
    vu38 = vu145.Value
    AntiAfk2()
end)
local v147 = v6.Main:AddToggle("SaveZoneiifnwa", {
    ["Title"] = "Save Zone",
    ["Default"] = false
})
local vu148 = nil
local vu149 = nil
v147:OnChanged(function(p150)
	-- upvalues: (ref) vu148, (ref) vu149
    local v151 = game.Players.LocalPlayer
    local v152 = v151.Character or v151.CharacterAdded:Wait()
    v152:FindFirstChildOfClass("Humanoid")
    local v153 = v152:WaitForChild("HumanoidRootPart")
    if p150 then
        vu148 = v153.CFrame
        vu149 = Instance.new("Part")
        vu149.Size = Vector3.new(10, 1, 10)
        vu149.Position = Vector3.new(- 150, 2500, 400)
        vu149.Anchored = true
        vu149.Material = Enum.Material.ForceField
        vu149.Parent = workspace
        v152:MoveTo(vu149.Position)
    else
        if vu148 then
            v153.CFrame = vu148
        end
        if vu149 then
            vu149:Destroy()
            vu149 = nil
        end
    end
end)
v6.Main:AddDropdown("DropdownZoneCastFree", {
    ["Title"] = "Select zone to cast anywhere",
    ["Values"] = {
        "Isonade",
        "Deep Ocean",
        "Desolate Deep",
        "Forsaken Shores",
        "Harvesters Spike",
        "Moosewood Docks",
        "Moosewood Ocean",
        "Moosewood Ocean Mythical",
        "Moosewood Pond",
        "Mushgrove Water",
        "Ocean",
        "Roslit Bay",
        "Roslit Bay Ocean",
        "Roslit Pond",
        "Roslit Pond Seaweed",
        "Scallop Ocean",
        "Snowcap Ocean",
        "Snowcap Pond",
        "Sunstone",
        "Terrapin Ocean",
        "The Arch",
        "Vertigo"
    },
    ["Multi"] = false
}):OnChanged(function(p154)
    print("Dropdown changed:", p154)
    selectedZoneCastFree = p154
end)
v6.Main:AddToggle("ToggleZoneCast1214Free", {
    ["Title"] = "Enable cast selected zone",
    ["Default"] = false
}):OnChanged(function(p155)
    AutoZoneCastFree = p155
    if AutoZoneCastFree then
        ZoneCastingFree()
    end
end)
v6.Main:AddSection("Crab Cage")
v6.Main:AddToggle("AutoCrabCageUI", {
    ["Title"] = "Auto-Collect Crab Cages",
    ["Default"] = false
}):OnChanged(function(p156)
	-- upvalues: (ref) vu20
    AutoCrab5421 = p156
    spawn(function()
		-- upvalues: (ref) vu20
        while AutoCrab5421 == true do
            local v157 = game.Workspace.active:FindFirstChild(vu20.Name)
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(v157.PrimaryPart.CFrame)
            fireproximityprompt(v157.Prompt)
            task.wait(0.01)
        end
    end)
end)
v6.Main:AddToggle("AutoPlaceCrabCageUI", {
    ["Title"] = "Auto-Place Crab Cages",
    ["Default"] = false
}):OnChanged(function(p158)
	-- upvalues: (ref) vu20
    PlaceCage = p158
    spawn(function()
		-- upvalues: (ref) vu20
        while PlaceCage == true do
            vu20.Character["Crab Cage"].Deploy:FireServer({
                ["CFrame"] = vu20.Character.HumanoidRootPart.CFrame
            })
            task.wait(0.1)
        end
    end)
end)
v6.Main:AddSection("Additional")
v6.Misc:AddButton({
    ["Title"] = "Auto Map",
    ["Description"] = "Must hold map",
    ["Callback"] = function()
        local v159 = game.Players.LocalPlayer
        local v160 = (v159.Character or v159.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
        v160.CFrame = CFrame.new(- 2827.479, 215.067459, 1518.38977, - 0.0640091896, 0, - 0.997949481, 0, 1, 0, 0.997949481, 0, - 0.0640091896)
        task.wait(1.5)
        workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Jack Marrow"):WaitForChild("treasure"):WaitForChild("repairmap"):InvokeServer()
        task.wait(1)
        local v161, v162, v163 = game.Players.LocalPlayer.PlayerGui["Treasure Map"].Main.CoordinatesLabel.Text:match("X ([%d%.%-]+), Y ([%d%.%-]+), Z ([%d%.%-]+)")
        local v164 = tonumber(v161)
        local v165 = tonumber(v162)
        local v166 = tonumber(v163)
        if v164 and (v165 and v166) then
            v160.CFrame = CFrame.new(v164, v165, v166)
        else
            warn("\208\157\208\181 \209\131\208\180\208\176\208\187\208\190\209\129\209\140 \208\184\208\183\208\178\208\187\208\181\209\135\209\140 \208\186\208\190\208\190\209\128\208\180\208\184\208\189\208\176\209\130\209\139 \208\184\208\183 \209\130\208\181\208\186\209\129\209\130\208\176 \208\186\208\176\209\128\209\130\209\139.")
        end
    end
})
local vu167 = v6.Main:AddToggle("AutoSellF", {
    ["Title"] = "Auto Sell Fish",
    ["Default"] = false
})
local v168 = vu167
vu167.OnChanged(v168, function()
	-- upvalues: (ref) vu37, (ref) vu167
    vu37 = vu167.Value
    AutoSellz()
end)
v6.Main:AddSlider("SliderSell", {
    ["Title"] = "Selling All fish every ? seconds",
    ["Description"] = "",
    ["Default"] = 60,
    ["Min"] = 1,
    ["Max"] = 600,
    ["Rounding"] = 1,
    ["Callback"] = function(p169)
        AutoSellDelay = p169
    end
})
v6.Main:AddButton({
    ["Title"] = "Sell one fish",
    ["Description"] = "Need to hold fish",
    ["Callback"] = function()
        SellFishAndReturnOne()
    end
})
v6.Main:AddButton({
    ["Title"] = "Sell All fishs",
    ["Description"] = "Selling all fish anywhere!",
    ["Callback"] = function()
        SellFishAndReturnAll()
    end
})
v6.Teleports:AddDropdown("DropdownPlace", {
    ["Title"] = "Place teleport",
    ["Values"] = {
        "Forsaken_Shores",
        "altar",
        "arch",
        "birch",
        "brine",
        "deep",
        "deepshop",
        "enchant",
        "keepers",
        "mod_house",
        "moosewood",
        "mushgrove",
        "roslit",
        "snow",
        "snowcap",
        "spike",
        "statue",
        "sunstone",
        "swamp",
        "terrapin",
        "trident",
        "vertigo",
        "volcano",
        "wilson",
        "wilsons_rod"
    },
    ["Multi"] = false
}):OnChanged(function(p170)
	-- upvalues: (ref) vu15, (ref) vu23
    if vu15 ~= nil and vu23 ~= nil then
        local v171 = vu15[p170]
        if v171 then
            vu23.CFrame = v171
        else
            print("1")
        end
    end
end)
v6.Teleports:AddDropdown("DropdownArea", {
    ["Title"] = "Fish Area teleport",
    ["Values"] = {
        "Forsaken_Shores",
        "Roslit_Bay",
        "Ocean",
        "Snowcap_Pond",
        "Moosewood_Docks",
        "Deep_Ocean",
        "Vertigo",
        "Snowcap_Ocean",
        "Harvesters_Spike",
        "SunStone",
        "Roslit_Bay_Ocean",
        "Moosewood_Pond",
        "Terrapin_Ocean",
        "Isonade",
        "Moosewood_Ocean",
        "Roslit_Pond",
        "Moosewood_Ocean_Mythical",
        "Terrapin_Olm",
        "The_Arch",
        "Scallop_Ocean",
        "SunStone_Hidden",
        "Mushgrove_Stone",
        "Keepers_Altar",
        "Lava",
        "Roslit_Pond_Seaweed"
    },
    ["Multi"] = false
}):OnChanged(function(p172)
	-- upvalues: (ref) vu16, (ref) vu23
    if vu16 == nil or vu23 == nil then
        print("1")
    elseif vu16[p172] and typeof(vu16[p172]) == "CFrame" then
        vu23.CFrame = vu16[p172]
    else
        print("1")
    end
end)
v6.Teleports:AddDropdown("DropdownNPC", {
    ["Title"] = "Teleport to Npc",
    ["Values"] = {
        "Merlin",
        "Quiet_Synph",
        "Pierre",
        "Phineas",
        "Paul",
        "Shipwright",
        "Angler",
        "Marc",
        "Lucas",
        "Latern_Keeper",
        "Inn_Keeper",
        "Roslit_Keeper",
        "FishingNpc_1",
        "FishingNpc_2",
        "FishingNpc_3",
        "Henry",
        "Daisy",
        "Appraiser",
        "Merchant",
        "Mod_Keeper",
        "Ashe",
        "Alfredrickus"
    },
    ["Multi"] = false
}):OnChanged(function(p173)
	-- upvalues: (ref) vu17, (ref) vu23
    if vu17 == nil or vu23 == nil then
        print("No valid teleport spot found.")
    else
        local v174 = vu17[p173]
        if v174 then
            if typeof(v174) ~= "Vector3" then
                if typeof(v174) ~= "CFrame" then
                    print("1")
                else
                    vu23.CFrame = v174
                end
            else
                vu23.CFrame = CFrame.new(v174)
            end
        end
    end
end)
v6.Teleports:AddDropdown("Dropdown3", {
    ["Title"] = "Teleport to Items",
    ["Values"] = {
        "Training_Rod",
        "Plastic_Rod",
        "Lucky_Rod",
        "Nocturnal_Rod",
        "Kings_Rod",
        "Flimsy_Rod",
        "Fast_Rod",
        "Carbon_Rod",
        "Long_Rod",
        "Mythical_Rod",
        "Midas_Rod",
        "Trident_Rod",
        "Basic_Diving_Gear",
        "Fish_Radar",
        "Enchated_Altar",
        "Bait_Crate",
        "Quality_Bait_Crate",
        "Crab_Cage",
        "GPS"
    },
    ["Multi"] = false
}):OnChanged(function(p175)
	-- upvalues: (ref) vu18, (ref) vu23
    if vu18 ~= nil and vu23 ~= nil then
        local v176 = vu18[p175]
        print("Value:", p175, "Spot:", v176, "IsCFrame:", typeof(v176) == "CFrame")
        if typeof(v176) ~= "CFrame" then
            print("1")
        else
            vu23.CFrame = v176
        end
    end
end)
v6.Teleports:AddDropdown("DropdownTotems", {
    ["Title"] = "Totem teleport",
    ["Values"] = {
        "Aurora_Totem",
        "Sundial_Totem",
        "Smokescreen_Totem",
        "Tempest_Totem"
    },
    ["Multi"] = false
}):OnChanged(function(p177)
	-- upvalues: (ref) vu19, (ref) vu23
    if vu19 == nil or vu23 == nil then
        print("1")
    elseif vu19[p177] and typeof(vu19[p177]) == "CFrame" then
        vu23.CFrame = vu19[p177]
    else
        print("1")
    end
end)
v6.Misc:AddToggle("ToggleTrade", {
    ["Title"] = "Auto Accept Fish",
    ["Default"] = false
}):OnChanged(function(p178)
    AcceptFish = p178
    function Fisher412()
        spawn(function()
            while AcceptFish do
                if game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.bodyannouncements:FindFirstChild("offer") then
                    local v179 = game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.bodyannouncements.offer.confirm
                    firesignal(v179.MouseButton1Click, game:GetService("Players").LocalPlayer)
                    task.wait(0.1)
                else
                    task.wait(0.1)
                end
            end
        end)
    end
    Fisher412()
end)
v6.Misc:AddSection("Water Jesus")
local v180 = v6.Misc:AddToggle("WalkOnWaterUI", {
    ["Title"] = "Water Platform",
    ["Default"] = false
})
local vu181 = 126
local vu182 = Instance.new("Part")
vu182.Size = Vector3.new(15, 2, 15)
vu182.Anchored = true
vu182.CanCollide = true
vu182.Material = Enum.Material.ForceField
vu182.Parent = game.Workspace
v180:OnChanged(function()
	-- upvalues: (ref) vu14, (ref) vu182, (ref) vu20, (ref) vu181
    if vu14.WalkOnWaterUI.Value ~= true then
        if vu14.WalkOnWaterUI.Value == false then
            vu182.CanCollide = false
            vu182.Transparency = 1
        end
    else
        vu182.CanCollide = true
        vu182.Transparency = 0
        while vu14.WalkOnWaterUI.Value == true do
            if vu20.Character and vu20.Character:FindFirstChild("HumanoidRootPart") then
                local v183 = vu20.Character.HumanoidRootPart.Position
                vu182.Position = Vector3.new(v183.X, vu181, v183.Z)
            end
            task.wait(0.1)
        end
    end
end)
v6.Misc:AddSlider("WalkOnWaterYAxisUI", {
    ["Title"] = "Y-Height",
    ["Description"] = "Change the Y-Axis of the Water Platform.",
    ["Default"] = 126,
    ["Min"] = 126,
    ["Max"] = 130,
    ["Rounding"] = 0.1,
    ["Callback"] = function(p184)
		-- upvalues: (ref) vu181
        vu181 = p184
    end
})
v6.Misc:AddSection("Appraiser")
local vu185 = v6.Misc:AddToggle("ToggleAutoApprari", {
    ["Title"] = "Auto Appraiser",
    ["Description"] = "Need to hold fish and be in / near moosewood",
    ["Default"] = false
})
local v186 = vu185
vu185.OnChanged(v186, function()
	-- upvalues: (ref) vu39, (ref) vu185
    vu39 = vu185.Value
    Appraise()
end)
v6.Misc:AddSection("Fps Services")
local v188 = v6.Misc:AddSlider("Slider512", {
    ["Title"] = "FPS Cap",
    ["Default"] = 90,
    ["Min"] = 1,
    ["Max"] = 240,
    ["Rounding"] = 1,
    ["Callback"] = function(p187)
        FpsCap = p187
        print(p187)
    end
})
v188:OnChanged(function(p189)
    FpsCap = p189
    print(p189)
end)
v188:SetValue(90)
v6.Misc:AddButton({
    ["Title"] = "Button to enable fps cap value",
    ["Description"] = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189",
    ["Callback"] = function()
        setfpscap(FpsCap)
    end
})
local v190 = Instance.new("ScreenGui")
v190.Name = "BlackGui"
v190.ResetOnSpawn = false
local vu191 = Instance.new("Frame")
vu191.Name = "BlackFrame"
vu191.Size = UDim2.new(1, 0, 1, 0)
vu191.BackgroundColor3 = Color3.new(0, 0, 0)
vu191.BackgroundTransparency = 1
vu191.Parent = v190
v190.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local v192 = Instance.new("ScreenGui")
v192.Name = "WhiteGui"
v192.ResetOnSpawn = false
local vu193 = Instance.new("Frame")
vu193.Name = "WhiteFrame"
vu193.Size = UDim2.new(1, 0, 1, 0)
vu193.BackgroundColor3 = Color3.new(1, 1, 1)
vu193.BackgroundTransparency = 1
vu193.Parent = v192
v192.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local vu194 = v6.Misc:AddToggle("BlackGui5", {
    ["Title"] = "Black Screen",
    ["Default"] = false
})
local v195 = vu194
vu194.OnChanged(v195, function()
	-- upvalues: (ref) vu194, (ref) vu191
    if vu194.Value then
        vu191.BackgroundTransparency = 0
    else
        vu191.BackgroundTransparency = 1
    end
end)
local vu196 = v6.Misc:AddToggle("WhiteGui5", {
    ["Title"] = "White Screen",
    ["Default"] = false
})
local v197 = vu196
vu196.OnChanged(v197, function()
	-- upvalues: (ref) vu196, (ref) vu193
    if vu196.Value then
        vu193.BackgroundTransparency = 0
    else
        vu193.BackgroundTransparency = 1
    end
end)
v6.Misc:AddButton({
    ["Title"] = "Delete flags",
    ["Callback"] = function()
        local v198 = workspace.active.flags
        if v198 then
            v198:Destroy()
        end
    end
})
v6.Misc:AddButton({
    ["Title"] = "Remove Textures",
    ["Description"] = "Very sus button",
    ["Callback"] = function()
		-- upvalues: (ref) vu4
        vu4:Dialog({
            ["Title"] = "activate fps booster?",
            ["Content"] = "Pro",
            ["Buttons"] = {
                {
                    ["Title"] = "Confirm",
                    ["Callback"] = function()
                        game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.announcements:Destroy()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ago106/ScriptsRoblox/refs/heads/main/FpS"))()
                    end
                },
                {
                    ["Title"] = "Cancel",
                    ["Callback"] = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})
v6.Player:AddButton({
    ["Title"] = "Radio UI",
    ["Description"] = "Chill\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zv94NGMc"))()
    end
})
v6.Player:AddSection("Player")
local vu199 = v6.Misc:AddToggle("ToggleNoclip", {
    ["Title"] = "Noclip",
    ["Default"] = false
})
local v200 = vu199
vu199.OnChanged(v200, function()
	-- upvalues: (ref) vu35, (ref) vu199
    vu35 = vu199.Value
end)
local vu201 = v6.Misc:AddToggle("ToggleAntiDrown", {
    ["Title"] = "Infinity Oxygen",
    ["Default"] = false
})
local v202 = vu201
vu201.OnChanged(v202, function()
	-- upvalues: (ref) vu36, (ref) vu201, (ref) vu21, (ref) vu20
    vu36 = vu201.Value
    if vu36 ~= true then
        if vu21 ~= nil and (vu21:FindFirstChild("client"):WaitForChild("oxygen") ~= nil and vu21:FindFirstChild("client"):WaitForChild("oxygen").Enabled == false) then
            vu21.client.oxygen.Enabled = true
        end
    else
        if vu21 ~= nil and (vu21:FindFirstChild("client"):WaitForChild("oxygen") ~= nil and vu21:FindFirstChild("client"):WaitForChild("oxygen").Enabled == true) then
            vu21.client.oxygen.Enabled = false
        end
        CharAddedAntiDrownCon = vu20.CharacterAdded:Connect(function()
			-- upvalues: (ref) vu21, (ref) vu36
            if vu21 ~= nil and (vu21:FindFirstChild("client"):WaitForChild("oxygen") ~= nil and (vu21:FindFirstChild("client"):WaitForChild("oxygen").Enabled == true and vu36 == true)) then
                vu21.client.oxygen.Enabled = false
            end
        end)
    end
end)
local vu203 = v6.Player:AddToggle("Walk Speed", {
    ["Title"] = "Walk Speed",
    ["Default"] = false
})
local vu204 = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
local vu205 = v6.Player:AddInput("Speed", {
    ["Title"] = "Speed",
    ["Default"] = "16",
    ["Placeholder"] = "Enter walk speed",
    ["Numeric"] = true,
    ["Finished"] = false,
    ["Callback"] = function(_)
    end
})
function vu205.OnChanged()
	-- upvalues: (ref) vu203, (ref) vu205
    if vu203:Get() then
        local v206 = vu205.Value
        if tonumber(v206) then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(v206)
        end
    end
end
local v207 = vu203
vu203.OnChanged(v207, function(p208)
	-- upvalues: (ref) vu205, (ref) vu204
    if p208 then
        local v209 = vu205.Value
        if v209 and tonumber(v209) then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(v209)
        else
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = vu204
    end
end)
local vu210 = v6.Player:AddToggle("Jump Power", {
    ["Title"] = "Jump Power",
    ["Default"] = false
})
local vu211 = game.Players.LocalPlayer.Character.Humanoid.JumpPower
local vu212 = v6.Player:AddInput("Power", {
    ["Title"] = "Power",
    ["Default"] = "50",
    ["Placeholder"] = "Enter jump power",
    ["Numeric"] = true,
    ["Finished"] = false,
    ["Callback"] = function(_)
    end
})
function vu212.OnChanged()
	-- upvalues: (ref) vu210, (ref) vu212
    if vu210:Get() then
        local v213 = vu212.Value
        if tonumber(v213) then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(v213)
        end
    end
end
local v214 = vu210
vu210.OnChanged(v214, function(p215)
	-- upvalues: (ref) vu212, (ref) vu211
    if p215 then
        local v216 = vu212.Value
        if v216 and tonumber(v216) then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(v216)
        else
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        end
    else
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = vu211
    end
end)
local vu232 = {
    ["Enabled"] = false,
    ["Speed"] = 1,
    ["Toggle"] = function(p217, p218)
        p217.Enabled = p218
        local v219 = game.Players.LocalPlayer.Character
        if v219 then
            local v220 = v219:FindFirstChildOfClass("Humanoid")
            if p218 then
                v220:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
                v220:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                v220:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
                v220:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
                v220:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
                v220:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
                v220:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
                v220:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
                v220:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                v220:SetStateEnabled(Enum.HumanoidStateType.Running, false)
                v220:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
                v220:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                v220:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
                p217:StartFlying()
            else
                v220:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
                v220:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                v220:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
                v220:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
                v220:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                v220:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
                v220:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
                v220:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
                v220:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
                v220:SetStateEnabled(Enum.HumanoidStateType.Running, true)
                v220:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
                v220:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                v220:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
                p217:StopFlying()
            end
        end
    end,
    ["StartFlying"] = function(pu221)
        local v222 = game.Players.LocalPlayer.Character
        local vu223 = v222:FindFirstChild("HumanoidRootPart")
        local vu224 = v222:FindFirstChild("Humanoid")
        if vu223 and vu224 then
            vu224.PlatformStand = true
            local vu225 = Instance.new("BodyGyro")
            vu225.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
            vu225.P = 90000
            vu225.Parent = vu223
            local vu226 = Instance.new("BodyVelocity")
            vu226.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
            vu226.Velocity = Vector3.new(0, 0.1, 0)
            vu226.Parent = vu223
            spawn(function()
				-- upvalues: (ref) pu221, (ref) vu226, (ref) vu225, (ref) vu223, (ref) vu224
                while pu221.Enabled do
                    local v227 = workspace.CurrentCamera
                    local v228 = Vector3.new(0, 0, 0)
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                        v228 = v228 + v227.CFrame.LookVector
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                        v228 = v228 - v227.CFrame.LookVector
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                        v228 = v228 - v227.CFrame.RightVector
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                        v228 = v228 + v227.CFrame.RightVector
                    end
                    if v228.Magnitude <= 0 then
                        vu226.Velocity = Vector3.new(0, 0.1, 0)
                    else
                        vu226.Velocity = v228 * pu221.Speed * 10
                        vu225.CFrame = v227.CFrame
                    end
                    wait()
                end
                if vu223 then
                    vu225:Destroy()
                    vu226:Destroy()
                    vu224.PlatformStand = false
                end
            end)
        end
    end,
    ["StopFlying"] = function(p229)
        p229.Enabled = false
    end,
    ["SetSpeed"] = function(p230, p231)
        p230.Speed = math.max(1, math.min(p231, 10))
    end
}
local vu233 = v6.Player:AddToggle("MyToggle", {
    ["Title"] = "Fly",
    ["Default"] = false
})
local v234 = vu233
vu233.OnChanged(v234, function()
	-- upvalues: (ref) vu232, (ref) vu233
    vu232:Toggle(vu233.Value)
end)
v6.Player:AddInput("Input", {
    ["Title"] = "Fly Speed",
    ["Default"] = "1",
    ["Numeric"] = true,
    ["Finished"] = true,
    ["Callback"] = function(p235)
		-- upvalues: (ref) vu232
        local v236 = tonumber(p235)
        if v236 then
            vu232:SetSpeed(v236)
        end
    end
})
v6.Player:AddKeybind("Keybind", {
    ["Title"] = "Fly KeyBind",
    ["Mode"] = "Toggle",
    ["Default"] = "nil",
    ["Callback"] = function(_)
		-- upvalues: (ref) vu233, (ref) vu232
        vu233.Value = not vu233.Value
        vu232:Toggle(vu233.Value)
    end,
    ["ChangedCallback"] = function(_)
    end
})
v2:SetLibrary(v1)
v3:SetLibrary(v1)
v2:SetIgnoreIndexes({})
v3:SetFolder("SpaceHub")
v2:SetFolder("SpaceHub/Fisch")
v3:BuildInterfaceSection(v6.Settings)
v2:BuildConfigSection(v6.Settings)
local v237 = vu4
vu4.SelectTab(v237, 1)
v1:Notify({
    ["Title"] = "Space Hub",
    ["Content"] = "The script has been loaded.",
    ["Duration"] = 8
})
v1:Notify({
    ["Title"] = "Anti Afk - ON",
    ["Content"] = "meow",
    ["Duration"] = 30
})
v2:LoadAutoloadConfig()
if (game:GetService("UserInputService").TouchEnabled and "Mobile" or "PC") == "Mobile" then
    local v238 = Instance.new("ScreenGui")
    local v239 = Instance.new("TextButton")
    local v240 = Instance.new("UICorner")
    v238.Name = "SpaceToggle"
    v238.Parent = game.CoreGui
    v238.ResetOnSpawn = false
    v239.Size = UDim2.new(0, 50, 0, 50)
    v239.Position = UDim2.new(0, 10, 1, - 60)
    v239.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
    v239.Text = "S"
    v239.TextColor3 = Color3.fromRGB(0, 0, 0)
    v239.TextScaled = true
    v239.Transparency = 0.5
    v239.Parent = v238
    v239.MouseButton1Click:Connect(function()
		-- upvalues: (ref) vu5, (ref) vu4
        if vu5 ~= false then
            vu4:Minimize()
            vu5 = false
        else
            vu4:Minimize()
            vu5 = true
        end
    end)
    v240.CornerRadius = UDim.new(1, 0)
    v240.Parent = v239
end
loadstring(game:HttpGet("https://gist.githubusercontent.com/ago106/711b0de7b7da55057413b425c334c238/raw/"))()