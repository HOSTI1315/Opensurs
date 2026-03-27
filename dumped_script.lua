-- special dumped using larry dec/deobf (dsc.gg/larrydeobf)
-- script id: 2acd7a17c139fb86.lua
local larry5 =game["GetService"]
local larry6 =larry5(game, "HttpService")
local larry7 =game["GetService"]
local larry8 =larry7(game, "Players")
local larry9 =game["GetService"]
local larry10 =larry9(game, "RunService")
local larry11 =game["GetService"]
local larry12 =larry11(game, "ReplicatedStorage")
local larry13 =game["GetService"]
local larry14 =larry13(game, "Workspace")
local larry15 =game["GetService"]
local larry16 =larry15(game, "SoundService")
local larry17 =game["GetService"]
local larry18 =larry17(game, "UserInputService")
local larry19 =game["GetService"]
local larry20 =larry19(game, "StarterGui")
local larry21 =game["GetService"]
local larry22 =larry21(game, "TweenService")
local larry23 =game["GetService"]
local larry24 =larry23(game, "Lighting")
local larry25 =larry8["LocalPlayer"]
local larry26 =larry25["WaitForChild"]
local larry27 =larry26(larry25, "PlayerGui")
local larry30 =Color3["fromRGB"]
local larry31 =larry30(200, 0, 0)
local larry33 =Color3["fromRGB"]
local larry34 =larry33(255, 60, 60)
local larry36 =Color3["fromRGB"]
local larry37 =larry36(110, 0, 0)
local larry39 =Color3["fromRGB"]
local larry40 =larry39(200, 0, 0)
local larry42 =Color3["fromRGB"]
local larry43 =larry42(60, 255, 60)
local larry45 =Enum["Font"]
local larry46 =larry45["Arcade"]
local larry51 =larry25["Character"]
local larry52 =larry51["FindFirstChildOfClass"]
local larry53 =larry52(larry51, "Humanoid")
local larry55 =larry25["Character"]
local larry56 =larry55["FindFirstChild"]
local larry57 =larry56(larry55, "HumanoidRootPart")
local larry59 =larry20["SetCore"]
local larry60 =larry59(larry20, "SendNotification", {
  ["Text"] = "<larry_concat_me>_58_vararg2</larry_concat_me>",
  ["Title"] = "<larry_concat_me>_58_vararg1</larry_concat_me>",
  ["Duration"] = _58_vararg3,
})
local larry62 =larry20["SetCore"]
local larry63 =larry62(larry20, "SendNotification", {
  ["Text"] = "<larry_concat_me>_61_vararg1</larry_concat_me>",
  ["Title"] = "Miranda Hub",
  ["Duration"] = _61_vararg3,
})
local larry64 =larry14["FindFirstChild"]
local larry65 =larry64(larry14, "Turrets")
local larry66 =larry25["CharacterAdded"]
local larry67 =larry66["Connect"]
local larry68 =larry67(larry66, function(...)
local _69_vararg1, _69_vararg2, _69_vararg3, _69_vararg4, _69_vararg5, _69_vararg6, _69_vararg7, _69_vararg8, _69_vararg9, _69_vararg10 = ...

end)
local larry70 =larry14["ChildAdded"]
local larry71 =larry70["Connect"]
local larry74 =_73_vararg1["Name"]
local larry72 =larry71(larry70, function(...)
local _73_vararg1, _73_vararg2, _73_vararg3, _73_vararg4, _73_vararg5, _73_vararg6, _73_vararg7, _73_vararg8, _73_vararg9, _73_vararg10 = ...
local larry74 =_73_vararg1["Name"]
end)
local larry75 =game["GetService"]
local larry76 =larry75(game, "Lighting")
local larry77 =larry14["CurrentCamera"]
local larry78 =larry25["WaitForChild"]
local larry79 =larry78(larry25, "PlayerScripts")
local larry80 =larry12["Controllers"]
local larry81 =larry80["CharacterController"]
local larry82 =require(larry81)
local larry83 =larry12["Packages"]
local larry84 =larry83["Net"]
local larry85 =require(larry84)
local larry86 =larry79["WaitForChild"]
local larry87 =larry86(larry79, "PlayerModule")
local larry88 =require(larry87)
local larry89 =larry88["GetControls"]
local larry90 =larry89(larry88)
local larry91 =larry77["FieldOfView"]
local larry92 =larry76["Ambient"]
local larry93 =larry76["OutdoorAmbient"]
local larry94 =larry82["originalMoveFunction"]
local larry96 =larry77["GetPropertyChangedSignal"]
local larry97 =larry96(larry77, "FieldOfView")
local larry98 =larry97["Connect"]
local larry99 =larry98(larry97, function(...)
local _100_vararg1, _100_vararg2, _100_vararg3, _100_vararg4, _100_vararg5, _100_vararg6, _100_vararg7, _100_vararg8, _100_vararg9, _100_vararg10 = ...
larry77["FieldOfView"] =larry91
larry76["Ambient"] =larry92
larry76["OutdoorAmbient"] =larry93
larry90["moveFunction"] =larry94
end)
local larry101 =larry76["Changed"]
local larry102 =larry101["Connect"]
local larry103 =larry102(larry101, function(...)
local _104_vararg1, _104_vararg2, _104_vararg3, _104_vararg4, _104_vararg5, _104_vararg6, _104_vararg7, _104_vararg8, _104_vararg9, _104_vararg10 = ...
larry77["FieldOfView"] =larry91
larry76["Ambient"] =larry92
larry76["OutdoorAmbient"] =larry93
larry90["moveFunction"] =larry94
end)
local larry105 =larry76["ChildAdded"]
local larry106 =larry105["Connect"]
local larry109 =_108_vararg1["ClassName"]
local larry107 =larry106(larry105, function(...)
local _108_vararg1, _108_vararg2, _108_vararg3, _108_vararg4, _108_vararg5, _108_vararg6, _108_vararg7, _108_vararg8, _108_vararg9, _108_vararg10 = ...
local larry109 =_108_vararg1["ClassName"]
end)
local larry110 =larry76["ChildAdded"]
local larry111 =larry110["Connect"]
local larry114 =larry76["GetChildren"]
local larry115 =larry114(larry76)
local larry117 =_116_2["ClassName"]
local larry112 =larry111(larry110, function(...)
local _113_vararg1, _113_vararg2, _113_vararg3, _113_vararg4, _113_vararg5, _113_vararg6, _113_vararg7, _113_vararg8, _113_vararg9, _113_vararg10 = ...
local larry114 =larry76["GetChildren"]
local larry115 =larry114(larry76)
for larry116, _116_2 in pairs(larry115) do
local larry117 =_116_2["ClassName"]
end
end)
local larry118 =larry85["RemoteEvent"]
local larry119 =larry118(larry85, "UseItem")
local larry120 =larry119["OnClientEvent"]
local larry121 =larry120["Connect"]
local larry122 =larry121(larry120, function(...)
local _123_vararg1, _123_vararg2, _123_vararg3, _123_vararg4, _123_vararg5, _123_vararg6, _123_vararg7, _123_vararg8, _123_vararg9, _123_vararg10 = ...

end)
local larry124 =larry76["GetChildren"]
local larry125 =larry124(larry76)
local larry127 =_126_2["ClassName"]
local larry129 =larry122["Disconnect"]
local larry130 =larry129(larry122)
local larry131 =larry99["Disconnect"]
local larry132 =larry131(larry99)
local larry133 =larry103["Disconnect"]
local larry134 =larry133(larry103)
local larry135 =larry107["Disconnect"]
local larry136 =larry135(larry107)
local larry137 =larry112["Disconnect"]
local larry138 =larry137(larry112)
local larry139 =larry25["WaitForChild"]
local larry140 =larry139(larry25, "PlayerGui")
local larry141 =Color3["fromRGB"]
local larry142 =larry141(12, 12, 18)
local larry143 =Color3["fromRGB"]
local larry144 =larry143(255, 40, 40)
local larry145 =Color3["new"]
local larry146 =larry145(1, 1, 1)
local larry147 =Color3["fromRGB"]
local larry148 =larry147(255, 50, 50)
local larry149 =Color3["fromRGB"]
local larry150 =larry149(180, 180, 180)
local larry151 =larry18["TouchEnabled"]
local larry152 =Instance["new"]
local larry153 =larry152("ScreenGui")
local larry154 =UDim2["new"]
local larry155 =larry154(0, 150, 0, 236)
local larry156 =UDim2["new"]
local larry157 =larry156(0.5, -75, 0, 15)
local larry158 =Instance["new"]
local larry159 =larry158("Frame")
local larry160 =UDim["new"]
local larry161 =larry160(0, 8)
local larry162 =Instance["new"]
local larry163 =larry162("UICorner")
local larry164 =Instance["new"]
local larry165 =larry164("UIStroke")
local larry166 =UDim2["new"]
local larry167 =larry166(1, 0, 0, 18)
local larry168 =UDim2["new"]
local larry169 =larry168(0, 0, 0, 2)
local larry170 =Enum["Font"]
local larry171 =larry170["Arcade"]
local larry172 =Instance["new"]
local larry173 =larry172("TextLabel")
local larry174 =UDim2["new"]
local larry175 =larry174(1, -20, 0, 10)
local larry176 =UDim2["new"]
local larry177 =larry176(0, 10, 0, 18)
local larry178 =Enum["Font"]
local larry179 =larry178["Arcade"]
local larry180 =Enum["TextXAlignment"]
local larry181 =larry180["Center"]
local larry182 =Instance["new"]
local larry183 =larry182("TextLabel")
local larry184 =UDim2["new"]
local larry185 =larry184(0.9, 0, 0, 15)
local larry186 =UDim2["new"]
local larry187 =larry186(0.05, 0, 1, -13)
local larry188 =Enum["Font"]
local larry189 =larry188["Arcade"]
local larry190 =Instance["new"]
local larry191 =larry190("TextLabel")
local larry193 =game["ReplicatedStorage"]
local larry194 =game["Workspace"]
local larry195 =larry193["Packages"]
local larry196 =larry195["Synchronizer"]
local larry197 =require(larry196)
local larry198 =larry193["Shared"]
local larry199 =larry198["Animals"]
local larry200 =require(larry199)
local larry201 =larry193["Utils"]
local larry202 =larry201["NumberUtils"]
local larry203 =require(larry202)
local larry204 =larry193["Datas"]
local larry205 =larry204["Animals"]
local larry206 =require(larry205)
local larry207 =larry194["Plots"]
local larry208 =UDim2["new"]
local larry209 =larry208(0.9, 0, 0, 28)
local larry210 =UDim2["new"]
local larry211 =larry210(0.05, 0, 0, 30)
local larry212 =Enum["Font"]
local larry213 =larry212["Arcade"]
local larry214 =Instance["new"]
local larry215 =larry214("TextButton")
local larry216 =UDim["new"]
local larry217 =larry216(0, 6)
local larry218 =Instance["new"]
local larry219 =larry218("UICorner")
local larry220 =larry215["MouseButton1Click"]
local larry221 =larry220["Connect"]
local larry224 =task["delay"]
local larry225 =larry224(0.35, function(...)
local _226_vararg1, _226_vararg2, _226_vararg3, _226_vararg4, _226_vararg5, _226_vararg6, _226_vararg7, _226_vararg8, _226_vararg9, _226_vararg10 = ...

end)
local larry227 =makefolder("MirandaTweenPlus")
local larry228 =larry6["JSONEncode"]
local larry229 =larry228(larry6, {
  ["espPlayer"] = false,
  ["xRay"] = false,
  ["infJump"] = false,
  ["reduceGraphics"] = false,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = false,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = false,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry229)
local larry230 =larry25["Character"]
local larry231 =larry25["Character"]
local larry232 =larry231["FindFirstChild"]
local larry233 =larry232(larry231, "HumanoidRootPart")
local larry234 =larry25["Character"]
local larry235 =larry25["Character"]
local larry236 =larry235["FindFirstChild"]
local larry237 =larry236(larry235, "HumanoidRootPart")
local er =error("Luraph Script:1063: Luraph Script:988: line 3: attempt to call a nil value")
local larry222 =larry221(larry220, function(...)
local _223_vararg1, _223_vararg2, _223_vararg3, _223_vararg4, _223_vararg5, _223_vararg6, _223_vararg7, _223_vararg8, _223_vararg9, _223_vararg10 = ...
local larry224 =task["delay"]
local larry225 =larry224(0.35, function(...)
local _226_vararg1, _226_vararg2, _226_vararg3, _226_vararg4, _226_vararg5, _226_vararg6, _226_vararg7, _226_vararg8, _226_vararg9, _226_vararg10 = ...

end)
local larry227 =makefolder("MirandaTweenPlus")
local larry228 =larry6["JSONEncode"]
local larry229 =larry228(larry6, {
  ["espPlayer"] = false,
  ["xRay"] = false,
  ["infJump"] = false,
  ["reduceGraphics"] = false,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = false,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = false,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry229)
local larry230 =larry25["Character"]
local larry231 =larry25["Character"]
local larry232 =larry231["FindFirstChild"]
local larry233 =larry232(larry231, "HumanoidRootPart")
local larry234 =larry25["Character"]
local larry235 =larry25["Character"]
local larry236 =larry235["FindFirstChild"]
local larry237 =larry236(larry235, "HumanoidRootPart")
local larry238=fenv["safeDisconnectHelper"]
local er =error("Luraph Script:1063: Luraph Script:988: line 3: attempt to call a nil value")
end)
local larry239 =UDim2["new"]
local larry240 =larry239(0.43, 0, 0, 28)
local larry241 =UDim2["new"]
local larry242 =larry241(0.05, 0, 0, 65)
local larry243 =Enum["Font"]
local larry244 =larry243["Arcade"]
local larry245 =Instance["new"]
local larry246 =larry245("TextButton")
local larry247 =UDim["new"]
local larry248 =larry247(0, 6)
local larry249 =Instance["new"]
local larry250 =larry249("UICorner")
local larry251 =larry246["MouseButton1Click"]
local larry252 =larry251["Connect"]
local larry255 =task["delay"]
local larry256 =larry255(0.35, function(...)
local _257_vararg1, _257_vararg2, _257_vararg3, _257_vararg4, _257_vararg5, _257_vararg6, _257_vararg7, _257_vararg8, _257_vararg9, _257_vararg10 = ...

end)
local larry258 =makefolder("MirandaTweenPlus")
local larry259 =larry6["JSONEncode"]
local larry260 =larry259(larry6, {
  ["espPlayer"] = false,
  ["xRay"] = false,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = false,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = false,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = false,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry260)
local larry253 =larry252(larry251, function(...)
local _254_vararg1, _254_vararg2, _254_vararg3, _254_vararg4, _254_vararg5, _254_vararg6, _254_vararg7, _254_vararg8, _254_vararg9, _254_vararg10 = ...
local larry255 =task["delay"]
local larry256 =larry255(0.35, function(...)
local _257_vararg1, _257_vararg2, _257_vararg3, _257_vararg4, _257_vararg5, _257_vararg6, _257_vararg7, _257_vararg8, _257_vararg9, _257_vararg10 = ...

end)
local larry258 =makefolder("MirandaTweenPlus")
local larry259 =larry6["JSONEncode"]
local larry260 =larry259(larry6, {
  ["espPlayer"] = false,
  ["xRay"] = false,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = false,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = false,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = false,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry260)
larry246["BackgroundColor3"] =larry34
end)
local larry261 =UDim2["new"]
local larry262 =larry261(0.43, 0, 0, 28)
local larry263 =UDim2["new"]
local larry264 =larry263(0.52, 0, 0, 65)
local larry265 =Enum["Font"]
local larry266 =larry265["Arcade"]
local larry267 =Instance["new"]
local larry268 =larry267("TextButton")
local larry269 =UDim["new"]
local larry270 =larry269(0, 6)
local larry271 =Instance["new"]
local larry272 =larry271("UICorner")
local larry273 =larry268["MouseButton1Click"]
local larry274 =larry273["Connect"]
local larry277 =task["delay"]
local larry278 =larry277(0.35, function(...)
local _279_vararg1, _279_vararg2, _279_vararg3, _279_vararg4, _279_vararg5, _279_vararg6, _279_vararg7, _279_vararg8, _279_vararg9, _279_vararg10 = ...

end)
local larry280 =makefolder("MirandaTweenPlus")
local larry281 =larry6["JSONEncode"]
local larry282 =larry281(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = false,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = false,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = false,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = false,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry282)
local larry283 =larry8["GetPlayers"]
local larry284 =larry283(larry8)
local larry288 =_285_2["CharacterAdded"]
local larry289 =larry288["Connect"]
local _ =task.wait(0.2)
local larry292 =_291_vararg1["FindFirstChild"]
local larry293 =larry292(_291_vararg1, "ESP_HL")
local larry294 =_291_vararg1["FindFirstChild"]
local larry295 =larry294(_291_vararg1, "ESP_Name")
local larry296 =larry293["Destroy"]
local larry297 =larry296(larry293)
local larry298 =larry295["Destroy"]
local larry299 =larry298(larry295)
local larry300 =_291_vararg1["FindFirstChild"]
local larry301 =larry300(_291_vararg1, "HumanoidRootPart")
local larry302 =Instance["new"]
local larry303 =larry302("Highlight", _291_vararg1)
local larry304 =Color3["fromRGB"]
local larry305 =larry304(255, 0, 0)
local larry306 =Color3["fromRGB"]
local larry307 =larry306(255, 255, 255)
local larry308 =Enum["HighlightDepthMode"]
local larry309 =larry308["AlwaysOnTop"]
local larry310 =Instance["new"]
local larry311 =larry310("BillboardGui", larry301)
local larry312 =UDim2["new"]
local larry313 =larry312(0, 70, 0, 20)
local larry314 =Vector3["new"]
local larry315 =larry314(0, 3, 0)
local larry316 =Instance["new"]
local larry317 =larry316("TextLabel", larry311)
local larry318 =UDim2["new"]
local larry319 =larry318(1, 0, 1, 0)
local larry320 =_285_2["Name"]
local larry321 =Enum["Font"]
local larry322 =larry321["GothamBold"]
local larry323 =Color3["new"]
local larry324 =larry323(1, 1, 1)
local larry290 =larry289(larry288, function(...)
local _291_vararg1, _291_vararg2, _291_vararg3, _291_vararg4, _291_vararg5, _291_vararg6, _291_vararg7, _291_vararg8, _291_vararg9, _291_vararg10 = ...
local _ =task.wait(0.2)
local larry292 =_291_vararg1["FindFirstChild"]
local larry293 =larry292(_291_vararg1, "ESP_HL")
local larry294 =_291_vararg1["FindFirstChild"]
local larry295 =larry294(_291_vararg1, "ESP_Name")
local larry296 =larry293["Destroy"]
local larry297 =larry296(larry293)
local larry298 =larry295["Destroy"]
local larry299 =larry298(larry295)
local larry300 =_291_vararg1["FindFirstChild"]
local larry301 =larry300(_291_vararg1, "HumanoidRootPart")
local larry302 =Instance["new"]
local larry303 =larry302("Highlight", _291_vararg1)
larry303["Name"] ="ESP_HL"
local larry304 =Color3["fromRGB"]
local larry305 =larry304(255, 0, 0)
larry303["FillColor"] =larry305
local larry306 =Color3["fromRGB"]
local larry307 =larry306(255, 255, 255)
larry303["OutlineColor"] =larry307
larry303["FillTransparency"] =0.55
larry303["OutlineTransparency"] =0.5
local larry308 =Enum["HighlightDepthMode"]
local larry309 =larry308["AlwaysOnTop"]
larry303["DepthMode"] =larry309
local larry310 =Instance["new"]
local larry311 =larry310("BillboardGui", larry301)
larry311["Name"] ="ESP_Name"
local larry312 =UDim2["new"]
local larry313 =larry312(0, 70, 0, 20)
larry311["Size"] =larry313
larry311["AlwaysOnTop"] =true
local larry314 =Vector3["new"]
local larry315 =larry314(0, 3, 0)
larry311["StudsOffset"] =larry315
local larry316 =Instance["new"]
local larry317 =larry316("TextLabel", larry311)
local larry318 =UDim2["new"]
local larry319 =larry318(1, 0, 1, 0)
larry317["Size"] =larry319
larry317["BackgroundTransparency"] =1
local larry320 =_285_2["Name"]
larry317["Text"] =larry320
local larry321 =Enum["Font"]
local larry322 =larry321["GothamBold"]
larry317["Font"] =larry322
larry317["TextScaled"] =true
local larry323 =Color3["new"]
local larry324 =larry323(1, 1, 1)
larry317["TextColor3"] =larry324
larry317["TextStrokeTransparency"] =0.2
end)
local larry325 =_285_2["Character"]
local larry326 =_285_2["Character"]
local larry327 =larry326["FindFirstChild"]
local larry328 =larry327(larry326, "ESP_HL")
local larry329 =larry326["FindFirstChild"]
local larry330 =larry329(larry326, "ESP_Name")
local larry331 =larry328["Destroy"]
local larry332 =larry331(larry328)
local larry333 =larry330["Destroy"]
local larry334 =larry333(larry330)
local larry335 =larry326["FindFirstChild"]
local larry336 =larry335(larry326, "HumanoidRootPart")
local larry337 =Instance["new"]
local larry338 =larry337("Highlight", larry326)
local larry339 =Color3["fromRGB"]
local larry340 =larry339(255, 0, 0)
local larry341 =Color3["fromRGB"]
local larry342 =larry341(255, 255, 255)
local larry343 =Enum["HighlightDepthMode"]
local larry344 =larry343["AlwaysOnTop"]
local larry345 =Instance["new"]
local larry346 =larry345("BillboardGui", larry336)
local larry347 =UDim2["new"]
local larry348 =larry347(0, 70, 0, 20)
local larry349 =Vector3["new"]
local larry350 =larry349(0, 3, 0)
local larry351 =Instance["new"]
local larry352 =larry351("TextLabel", larry346)
local larry353 =UDim2["new"]
local larry354 =larry353(1, 0, 1, 0)
local larry355 =_285_2["Name"]
local larry356 =Enum["Font"]
local larry357 =larry356["GothamBold"]
local larry358 =Color3["new"]
local larry359 =larry358(1, 1, 1)
local larry360 =larry8["PlayerAdded"]
local larry361 =larry360["Connect"]
local larry366 =_363_vararg1["CharacterAdded"]
local larry367 =larry366["Connect"]
local _ =task.wait(0.2)
local larry370 =_369_vararg1["FindFirstChild"]
local larry371 =larry370(_369_vararg1, "ESP_HL")
local larry372 =_369_vararg1["FindFirstChild"]
local larry373 =larry372(_369_vararg1, "ESP_Name")
local larry374 =larry371["Destroy"]
local larry375 =larry374(larry371)
local larry376 =larry373["Destroy"]
local larry377 =larry376(larry373)
local larry378 =_369_vararg1["FindFirstChild"]
local larry379 =larry378(_369_vararg1, "HumanoidRootPart")
local larry380 =Instance["new"]
local larry381 =larry380("Highlight", _369_vararg1)
local larry382 =Color3["fromRGB"]
local larry383 =larry382(255, 0, 0)
local larry384 =Color3["fromRGB"]
local larry385 =larry384(255, 255, 255)
local larry386 =Enum["HighlightDepthMode"]
local larry387 =larry386["AlwaysOnTop"]
local larry388 =Instance["new"]
local larry389 =larry388("BillboardGui", larry379)
local larry390 =UDim2["new"]
local larry391 =larry390(0, 70, 0, 20)
local larry392 =Vector3["new"]
local larry393 =larry392(0, 3, 0)
local larry394 =Instance["new"]
local larry395 =larry394("TextLabel", larry389)
local larry396 =UDim2["new"]
local larry397 =larry396(1, 0, 1, 0)
local larry398 =_363_vararg1["Name"]
local larry399 =Enum["Font"]
local larry400 =larry399["GothamBold"]
local larry401 =Color3["new"]
local larry402 =larry401(1, 1, 1)
local larry368 =larry367(larry366, function(...)
local _369_vararg1, _369_vararg2, _369_vararg3, _369_vararg4, _369_vararg5, _369_vararg6, _369_vararg7, _369_vararg8, _369_vararg9, _369_vararg10 = ...
local _ =task.wait(0.2)
local larry370 =_369_vararg1["FindFirstChild"]
local larry371 =larry370(_369_vararg1, "ESP_HL")
local larry372 =_369_vararg1["FindFirstChild"]
local larry373 =larry372(_369_vararg1, "ESP_Name")
local larry374 =larry371["Destroy"]
local larry375 =larry374(larry371)
local larry376 =larry373["Destroy"]
local larry377 =larry376(larry373)
local larry378 =_369_vararg1["FindFirstChild"]
local larry379 =larry378(_369_vararg1, "HumanoidRootPart")
local larry380 =Instance["new"]
local larry381 =larry380("Highlight", _369_vararg1)
larry381["Name"] ="ESP_HL"
local larry382 =Color3["fromRGB"]
local larry383 =larry382(255, 0, 0)
larry381["FillColor"] =larry383
local larry384 =Color3["fromRGB"]
local larry385 =larry384(255, 255, 255)
larry381["OutlineColor"] =larry385
larry381["FillTransparency"] =0.55
larry381["OutlineTransparency"] =0.5
local larry386 =Enum["HighlightDepthMode"]
local larry387 =larry386["AlwaysOnTop"]
larry381["DepthMode"] =larry387
local larry388 =Instance["new"]
local larry389 =larry388("BillboardGui", larry379)
larry389["Name"] ="ESP_Name"
local larry390 =UDim2["new"]
local larry391 =larry390(0, 70, 0, 20)
larry389["Size"] =larry391
larry389["AlwaysOnTop"] =true
local larry392 =Vector3["new"]
local larry393 =larry392(0, 3, 0)
larry389["StudsOffset"] =larry393
local larry394 =Instance["new"]
local larry395 =larry394("TextLabel", larry389)
local larry396 =UDim2["new"]
local larry397 =larry396(1, 0, 1, 0)
larry395["Size"] =larry397
larry395["BackgroundTransparency"] =1
local larry398 =_363_vararg1["Name"]
larry395["Text"] =larry398
local larry399 =Enum["Font"]
local larry400 =larry399["GothamBold"]
larry395["Font"] =larry400
larry395["TextScaled"] =true
local larry401 =Color3["new"]
local larry402 =larry401(1, 1, 1)
larry395["TextColor3"] =larry402
larry395["TextStrokeTransparency"] =0.2
end)
local larry403 =_363_vararg1["Character"]
local larry404 =_363_vararg1["Character"]
local larry405 =larry404["FindFirstChild"]
local larry406 =larry405(larry404, "ESP_HL")
local larry407 =larry404["FindFirstChild"]
local larry408 =larry407(larry404, "ESP_Name")
local larry409 =larry406["Destroy"]
local larry410 =larry409(larry406)
local larry411 =larry408["Destroy"]
local larry412 =larry411(larry408)
local larry413 =larry404["FindFirstChild"]
local larry414 =larry413(larry404, "HumanoidRootPart")
local larry415 =Instance["new"]
local larry416 =larry415("Highlight", larry404)
local larry417 =Color3["fromRGB"]
local larry418 =larry417(255, 0, 0)
local larry419 =Color3["fromRGB"]
local larry420 =larry419(255, 255, 255)
local larry421 =Enum["HighlightDepthMode"]
local larry422 =larry421["AlwaysOnTop"]
local larry423 =Instance["new"]
local larry424 =larry423("BillboardGui", larry414)
local larry425 =UDim2["new"]
local larry426 =larry425(0, 70, 0, 20)
local larry427 =Vector3["new"]
local larry428 =larry427(0, 3, 0)
local larry429 =Instance["new"]
local larry430 =larry429("TextLabel", larry424)
local larry431 =UDim2["new"]
local larry432 =larry431(1, 0, 1, 0)
local larry433 =_363_vararg1["Name"]
local larry434 =Enum["Font"]
local larry435 =larry434["GothamBold"]
local larry436 =Color3["new"]
local larry437 =larry436(1, 1, 1)
local larry362 =larry361(larry360, function(...)
local _363_vararg1, _363_vararg2, _363_vararg3, _363_vararg4, _363_vararg5, _363_vararg6, _363_vararg7, _363_vararg8, _363_vararg9, _363_vararg10 = ...
local larry364 =(_363_vararg1==larry25)
local larry365 =(_363_vararg1==larry25)
local larry366 =_363_vararg1["CharacterAdded"]
local larry367 =larry366["Connect"]
local larry368 =larry367(larry366, function(...)
local _369_vararg1, _369_vararg2, _369_vararg3, _369_vararg4, _369_vararg5, _369_vararg6, _369_vararg7, _369_vararg8, _369_vararg9, _369_vararg10 = ...
local _ =task.wait(0.2)
local larry370 =_369_vararg1["FindFirstChild"]
local larry371 =larry370(_369_vararg1, "ESP_HL")
local larry372 =_369_vararg1["FindFirstChild"]
local larry373 =larry372(_369_vararg1, "ESP_Name")
local larry374 =larry371["Destroy"]
local larry375 =larry374(larry371)
local larry376 =larry373["Destroy"]
local larry377 =larry376(larry373)
local larry378 =_369_vararg1["FindFirstChild"]
local larry379 =larry378(_369_vararg1, "HumanoidRootPart")
local larry380 =Instance["new"]
local larry381 =larry380("Highlight", _369_vararg1)
larry381["Name"] ="ESP_HL"
local larry382 =Color3["fromRGB"]
local larry383 =larry382(255, 0, 0)
larry381["FillColor"] =larry383
local larry384 =Color3["fromRGB"]
local larry385 =larry384(255, 255, 255)
larry381["OutlineColor"] =larry385
larry381["FillTransparency"] =0.55
larry381["OutlineTransparency"] =0.5
local larry386 =Enum["HighlightDepthMode"]
local larry387 =larry386["AlwaysOnTop"]
larry381["DepthMode"] =larry387
local larry388 =Instance["new"]
local larry389 =larry388("BillboardGui", larry379)
larry389["Name"] ="ESP_Name"
local larry390 =UDim2["new"]
local larry391 =larry390(0, 70, 0, 20)
larry389["Size"] =larry391
larry389["AlwaysOnTop"] =true
local larry392 =Vector3["new"]
local larry393 =larry392(0, 3, 0)
larry389["StudsOffset"] =larry393
local larry394 =Instance["new"]
local larry395 =larry394("TextLabel", larry389)
local larry396 =UDim2["new"]
local larry397 =larry396(1, 0, 1, 0)
larry395["Size"] =larry397
larry395["BackgroundTransparency"] =1
local larry398 =_363_vararg1["Name"]
larry395["Text"] =larry398
local larry399 =Enum["Font"]
local larry400 =larry399["GothamBold"]
larry395["Font"] =larry400
larry395["TextScaled"] =true
local larry401 =Color3["new"]
local larry402 =larry401(1, 1, 1)
larry395["TextColor3"] =larry402
larry395["TextStrokeTransparency"] =0.2
end)
local larry403 =_363_vararg1["Character"]
local larry404 =_363_vararg1["Character"]
local larry405 =larry404["FindFirstChild"]
local larry406 =larry405(larry404, "ESP_HL")
local larry407 =larry404["FindFirstChild"]
local larry408 =larry407(larry404, "ESP_Name")
local larry409 =larry406["Destroy"]
local larry410 =larry409(larry406)
local larry411 =larry408["Destroy"]
local larry412 =larry411(larry408)
local larry413 =larry404["FindFirstChild"]
local larry414 =larry413(larry404, "HumanoidRootPart")
local larry415 =Instance["new"]
local larry416 =larry415("Highlight", larry404)
larry416["Name"] ="ESP_HL"
local larry417 =Color3["fromRGB"]
local larry418 =larry417(255, 0, 0)
larry416["FillColor"] =larry418
local larry419 =Color3["fromRGB"]
local larry420 =larry419(255, 255, 255)
larry416["OutlineColor"] =larry420
larry416["FillTransparency"] =0.55
larry416["OutlineTransparency"] =0.5
local larry421 =Enum["HighlightDepthMode"]
local larry422 =larry421["AlwaysOnTop"]
larry416["DepthMode"] =larry422
local larry423 =Instance["new"]
local larry424 =larry423("BillboardGui", larry414)
larry424["Name"] ="ESP_Name"
local larry425 =UDim2["new"]
local larry426 =larry425(0, 70, 0, 20)
larry424["Size"] =larry426
larry424["AlwaysOnTop"] =true
local larry427 =Vector3["new"]
local larry428 =larry427(0, 3, 0)
larry424["StudsOffset"] =larry428
local larry429 =Instance["new"]
local larry430 =larry429("TextLabel", larry424)
local larry431 =UDim2["new"]
local larry432 =larry431(1, 0, 1, 0)
larry430["Size"] =larry432
larry430["BackgroundTransparency"] =1
local larry433 =_363_vararg1["Name"]
larry430["Text"] =larry433
local larry434 =Enum["Font"]
local larry435 =larry434["GothamBold"]
larry430["Font"] =larry435
larry430["TextScaled"] =true
local larry436 =Color3["new"]
local larry437 =larry436(1, 1, 1)
larry430["TextColor3"] =larry437
larry430["TextStrokeTransparency"] =0.2
end)
local larry438 =larry8["PlayerRemoving"]
local larry439 =larry438["Connect"]
local larry442 =_441_vararg1["Character"]
local larry443 =_441_vararg1["Character"]
local larry444 =larry443["FindFirstChild"]
local larry445 =larry444(larry443, "ESP_HL")
local larry446 =larry443["FindFirstChild"]
local larry447 =larry446(larry443, "ESP_Name")
local larry448 =larry445["Destroy"]
local larry449 =larry448(larry445)
local larry450 =larry447["Destroy"]
local larry451 =larry450(larry447)
local larry440 =larry439(larry438, function(...)
local _441_vararg1, _441_vararg2, _441_vararg3, _441_vararg4, _441_vararg5, _441_vararg6, _441_vararg7, _441_vararg8, _441_vararg9, _441_vararg10 = ...
local larry442 =_441_vararg1["Character"]
local larry443 =_441_vararg1["Character"]
local larry444 =larry443["FindFirstChild"]
local larry445 =larry444(larry443, "ESP_HL")
local larry446 =larry443["FindFirstChild"]
local larry447 =larry446(larry443, "ESP_Name")
local larry448 =larry445["Destroy"]
local larry449 =larry448(larry445)
local larry450 =larry447["Destroy"]
local larry451 =larry450(larry447)
end)
local larry275 =larry274(larry273, function(...)
local _276_vararg1, _276_vararg2, _276_vararg3, _276_vararg4, _276_vararg5, _276_vararg6, _276_vararg7, _276_vararg8, _276_vararg9, _276_vararg10 = ...
local larry277 =task["delay"]
local larry278 =larry277(0.35, function(...)
local _279_vararg1, _279_vararg2, _279_vararg3, _279_vararg4, _279_vararg5, _279_vararg6, _279_vararg7, _279_vararg8, _279_vararg9, _279_vararg10 = ...

end)
local larry280 =makefolder("MirandaTweenPlus")
local larry281 =larry6["JSONEncode"]
local larry282 =larry281(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = false,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = false,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = false,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = false,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry282)
larry268["BackgroundColor3"] =larry34
local larry283 =larry8["GetPlayers"]
local larry284 =larry283(larry8)
for larry285, _285_2 in ipairs(larry284) do
local larry286 =(_285_2==larry25)
local larry287 =(_285_2==larry25)
local larry288 =_285_2["CharacterAdded"]
local larry289 =larry288["Connect"]
local larry290 =larry289(larry288, function(...)
local _291_vararg1, _291_vararg2, _291_vararg3, _291_vararg4, _291_vararg5, _291_vararg6, _291_vararg7, _291_vararg8, _291_vararg9, _291_vararg10 = ...
local _ =task.wait(0.2)
local larry292 =_291_vararg1["FindFirstChild"]
local larry293 =larry292(_291_vararg1, "ESP_HL")
local larry294 =_291_vararg1["FindFirstChild"]
local larry295 =larry294(_291_vararg1, "ESP_Name")
local larry296 =larry293["Destroy"]
local larry297 =larry296(larry293)
local larry298 =larry295["Destroy"]
local larry299 =larry298(larry295)
local larry300 =_291_vararg1["FindFirstChild"]
local larry301 =larry300(_291_vararg1, "HumanoidRootPart")
local larry302 =Instance["new"]
local larry303 =larry302("Highlight", _291_vararg1)
larry303["Name"] ="ESP_HL"
local larry304 =Color3["fromRGB"]
local larry305 =larry304(255, 0, 0)
larry303["FillColor"] =larry305
local larry306 =Color3["fromRGB"]
local larry307 =larry306(255, 255, 255)
larry303["OutlineColor"] =larry307
larry303["FillTransparency"] =0.55
larry303["OutlineTransparency"] =0.5
local larry308 =Enum["HighlightDepthMode"]
local larry309 =larry308["AlwaysOnTop"]
larry303["DepthMode"] =larry309
local larry310 =Instance["new"]
local larry311 =larry310("BillboardGui", larry301)
larry311["Name"] ="ESP_Name"
local larry312 =UDim2["new"]
local larry313 =larry312(0, 70, 0, 20)
larry311["Size"] =larry313
larry311["AlwaysOnTop"] =true
local larry314 =Vector3["new"]
local larry315 =larry314(0, 3, 0)
larry311["StudsOffset"] =larry315
local larry316 =Instance["new"]
local larry317 =larry316("TextLabel", larry311)
local larry318 =UDim2["new"]
local larry319 =larry318(1, 0, 1, 0)
larry317["Size"] =larry319
larry317["BackgroundTransparency"] =1
local larry320 =_285_2["Name"]
larry317["Text"] =larry320
local larry321 =Enum["Font"]
local larry322 =larry321["GothamBold"]
larry317["Font"] =larry322
larry317["TextScaled"] =true
local larry323 =Color3["new"]
local larry324 =larry323(1, 1, 1)
larry317["TextColor3"] =larry324
larry317["TextStrokeTransparency"] =0.2
end)
local larry325 =_285_2["Character"]
local larry326 =_285_2["Character"]
local larry327 =larry326["FindFirstChild"]
local larry328 =larry327(larry326, "ESP_HL")
local larry329 =larry326["FindFirstChild"]
local larry330 =larry329(larry326, "ESP_Name")
local larry331 =larry328["Destroy"]
local larry332 =larry331(larry328)
local larry333 =larry330["Destroy"]
local larry334 =larry333(larry330)
local larry335 =larry326["FindFirstChild"]
local larry336 =larry335(larry326, "HumanoidRootPart")
local larry337 =Instance["new"]
local larry338 =larry337("Highlight", larry326)
larry338["Name"] ="ESP_HL"
local larry339 =Color3["fromRGB"]
local larry340 =larry339(255, 0, 0)
larry338["FillColor"] =larry340
local larry341 =Color3["fromRGB"]
local larry342 =larry341(255, 255, 255)
larry338["OutlineColor"] =larry342
larry338["FillTransparency"] =0.55
larry338["OutlineTransparency"] =0.5
local larry343 =Enum["HighlightDepthMode"]
local larry344 =larry343["AlwaysOnTop"]
larry338["DepthMode"] =larry344
local larry345 =Instance["new"]
local larry346 =larry345("BillboardGui", larry336)
larry346["Name"] ="ESP_Name"
local larry347 =UDim2["new"]
local larry348 =larry347(0, 70, 0, 20)
larry346["Size"] =larry348
larry346["AlwaysOnTop"] =true
local larry349 =Vector3["new"]
local larry350 =larry349(0, 3, 0)
larry346["StudsOffset"] =larry350
local larry351 =Instance["new"]
local larry352 =larry351("TextLabel", larry346)
local larry353 =UDim2["new"]
local larry354 =larry353(1, 0, 1, 0)
larry352["Size"] =larry354
larry352["BackgroundTransparency"] =1
local larry355 =_285_2["Name"]
larry352["Text"] =larry355
local larry356 =Enum["Font"]
local larry357 =larry356["GothamBold"]
larry352["Font"] =larry357
larry352["TextScaled"] =true
local larry358 =Color3["new"]
local larry359 =larry358(1, 1, 1)
larry352["TextColor3"] =larry359
larry352["TextStrokeTransparency"] =0.2
end
local larry360 =larry8["PlayerAdded"]
local larry361 =larry360["Connect"]
local larry362 =larry361(larry360, function(...)
local _363_vararg1, _363_vararg2, _363_vararg3, _363_vararg4, _363_vararg5, _363_vararg6, _363_vararg7, _363_vararg8, _363_vararg9, _363_vararg10 = ...
local larry364 =(_363_vararg1==larry25)
local larry365 =(_363_vararg1==larry25)
local larry366 =_363_vararg1["CharacterAdded"]
local larry367 =larry366["Connect"]
local larry368 =larry367(larry366, function(...)
local _369_vararg1, _369_vararg2, _369_vararg3, _369_vararg4, _369_vararg5, _369_vararg6, _369_vararg7, _369_vararg8, _369_vararg9, _369_vararg10 = ...
local _ =task.wait(0.2)
local larry370 =_369_vararg1["FindFirstChild"]
local larry371 =larry370(_369_vararg1, "ESP_HL")
local larry372 =_369_vararg1["FindFirstChild"]
local larry373 =larry372(_369_vararg1, "ESP_Name")
local larry374 =larry371["Destroy"]
local larry375 =larry374(larry371)
local larry376 =larry373["Destroy"]
local larry377 =larry376(larry373)
local larry378 =_369_vararg1["FindFirstChild"]
local larry379 =larry378(_369_vararg1, "HumanoidRootPart")
local larry380 =Instance["new"]
local larry381 =larry380("Highlight", _369_vararg1)
larry381["Name"] ="ESP_HL"
local larry382 =Color3["fromRGB"]
local larry383 =larry382(255, 0, 0)
larry381["FillColor"] =larry383
local larry384 =Color3["fromRGB"]
local larry385 =larry384(255, 255, 255)
larry381["OutlineColor"] =larry385
larry381["FillTransparency"] =0.55
larry381["OutlineTransparency"] =0.5
local larry386 =Enum["HighlightDepthMode"]
local larry387 =larry386["AlwaysOnTop"]
larry381["DepthMode"] =larry387
local larry388 =Instance["new"]
local larry389 =larry388("BillboardGui", larry379)
larry389["Name"] ="ESP_Name"
local larry390 =UDim2["new"]
local larry391 =larry390(0, 70, 0, 20)
larry389["Size"] =larry391
larry389["AlwaysOnTop"] =true
local larry392 =Vector3["new"]
local larry393 =larry392(0, 3, 0)
larry389["StudsOffset"] =larry393
local larry394 =Instance["new"]
local larry395 =larry394("TextLabel", larry389)
local larry396 =UDim2["new"]
local larry397 =larry396(1, 0, 1, 0)
larry395["Size"] =larry397
larry395["BackgroundTransparency"] =1
local larry398 =_363_vararg1["Name"]
larry395["Text"] =larry398
local larry399 =Enum["Font"]
local larry400 =larry399["GothamBold"]
larry395["Font"] =larry400
larry395["TextScaled"] =true
local larry401 =Color3["new"]
local larry402 =larry401(1, 1, 1)
larry395["TextColor3"] =larry402
larry395["TextStrokeTransparency"] =0.2
end)
local larry403 =_363_vararg1["Character"]
local larry404 =_363_vararg1["Character"]
local larry405 =larry404["FindFirstChild"]
local larry406 =larry405(larry404, "ESP_HL")
local larry407 =larry404["FindFirstChild"]
local larry408 =larry407(larry404, "ESP_Name")
local larry409 =larry406["Destroy"]
local larry410 =larry409(larry406)
local larry411 =larry408["Destroy"]
local larry412 =larry411(larry408)
local larry413 =larry404["FindFirstChild"]
local larry414 =larry413(larry404, "HumanoidRootPart")
local larry415 =Instance["new"]
local larry416 =larry415("Highlight", larry404)
larry416["Name"] ="ESP_HL"
local larry417 =Color3["fromRGB"]
local larry418 =larry417(255, 0, 0)
larry416["FillColor"] =larry418
local larry419 =Color3["fromRGB"]
local larry420 =larry419(255, 255, 255)
larry416["OutlineColor"] =larry420
larry416["FillTransparency"] =0.55
larry416["OutlineTransparency"] =0.5
local larry421 =Enum["HighlightDepthMode"]
local larry422 =larry421["AlwaysOnTop"]
larry416["DepthMode"] =larry422
local larry423 =Instance["new"]
local larry424 =larry423("BillboardGui", larry414)
larry424["Name"] ="ESP_Name"
local larry425 =UDim2["new"]
local larry426 =larry425(0, 70, 0, 20)
larry424["Size"] =larry426
larry424["AlwaysOnTop"] =true
local larry427 =Vector3["new"]
local larry428 =larry427(0, 3, 0)
larry424["StudsOffset"] =larry428
local larry429 =Instance["new"]
local larry430 =larry429("TextLabel", larry424)
local larry431 =UDim2["new"]
local larry432 =larry431(1, 0, 1, 0)
larry430["Size"] =larry432
larry430["BackgroundTransparency"] =1
local larry433 =_363_vararg1["Name"]
larry430["Text"] =larry433
local larry434 =Enum["Font"]
local larry435 =larry434["GothamBold"]
larry430["Font"] =larry435
larry430["TextScaled"] =true
local larry436 =Color3["new"]
local larry437 =larry436(1, 1, 1)
larry430["TextColor3"] =larry437
larry430["TextStrokeTransparency"] =0.2
end)
local larry438 =larry8["PlayerRemoving"]
local larry439 =larry438["Connect"]
local larry440 =larry439(larry438, function(...)
local _441_vararg1, _441_vararg2, _441_vararg3, _441_vararg4, _441_vararg5, _441_vararg6, _441_vararg7, _441_vararg8, _441_vararg9, _441_vararg10 = ...
local larry442 =_441_vararg1["Character"]
local larry443 =_441_vararg1["Character"]
local larry444 =larry443["FindFirstChild"]
local larry445 =larry444(larry443, "ESP_HL")
local larry446 =larry443["FindFirstChild"]
local larry447 =larry446(larry443, "ESP_Name")
local larry448 =larry445["Destroy"]
local larry449 =larry448(larry445)
local larry450 =larry447["Destroy"]
local larry451 =larry450(larry447)
end)
end)
local larry452 =task["spawn"]
local _ =task.wait(0.5)
local larry453 =larry452(function(...)
local _454_vararg1, _454_vararg2, _454_vararg3, _454_vararg4, _454_vararg5, _454_vararg6, _454_vararg7, _454_vararg8, _454_vararg9, _454_vararg10 = ...
local _ =task.wait(0.5)
end)
local larry455 =game["IsLoaded"]
local larry456 =larry455(game)
local larry457 =game["GetService"]
local larry458 =larry457(game, "ProximityPromptService")
local larry459 =cloneref(larry458)
local larry460 =game["GetService"]
local larry461 =larry460(game, "ReplicatedStorage")
local larry462 =game["GetService"]
local larry463 =larry462(game, "Players")
local larry464 =larry463["LocalPlayer"]
local larry465 =larry461["Packages"]
local larry466 =larry465["Net"]
local larry467 =require(larry466)
local larry468 =UDim2["new"]
local larry469 =larry468(0.43, 0, 0, 28)
local larry470 =UDim2["new"]
local larry471 =larry470(0.05, 0, 0, 97)
local larry472 =Enum["Font"]
local larry473 =larry472["Arcade"]
local larry474 =Instance["new"]
local larry475 =larry474("TextButton")
local larry476 =UDim["new"]
local larry477 =larry476(0, 6)
local larry478 =Instance["new"]
local larry479 =larry478("UICorner")
local larry480 =larry475["MouseButton1Click"]
local larry481 =larry480["Connect"]
local larry484 =task["delay"]
local larry485 =larry484(0.35, function(...)
local _486_vararg1, _486_vararg2, _486_vararg3, _486_vararg4, _486_vararg5, _486_vararg6, _486_vararg7, _486_vararg8, _486_vararg9, _486_vararg10 = ...

end)
local larry487 =makefolder("MirandaTweenPlus")
local larry488 =larry6["JSONEncode"]
local larry489 =larry488(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = false,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = false,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = false,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = true,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = false,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry489)
local larry490 =larry14["FindFirstChild"]
local larry491 =larry490(larry14, "Plots")
local larry492 =larry491["GetChildren"]
local larry493 =larry492(larry491)
local larry495 =_494_2["FindFirstChild"]
local larry496 =larry495(_494_2, "PlotSign")
local larry497 =larry496["FindFirstChild"]
local larry498 =larry497(larry496, "YourBase")
local larry499 =larry498["Enabled"]
local larry500 =task["spawn"]
local larry503 =_494_2["GetDescendants"]
local larry504 =larry503(_494_2)
local larry506 =_505_2["IsA"]
local larry507 =larry506(_505_2, "TextLabel")
local larry508 =_505_2["Name"]
local larry501 =larry500(function(...)
local _502_vararg1, _502_vararg2, _502_vararg3, _502_vararg4, _502_vararg5, _502_vararg6, _502_vararg7, _502_vararg8, _502_vararg9, _502_vararg10 = ...
local larry503 =_494_2["GetDescendants"]
local larry504 =larry503(_494_2)
for larry505, _505_2 in ipairs(larry504) do
local larry506 =_505_2["IsA"]
local larry507 =larry506(_505_2, "TextLabel")
local larry508 =_505_2["Name"]
end
end)
local larry509 =_494_2["DescendantAdded"]
local larry510 =larry509["Connect"]
local larry513 =_512_vararg1["IsA"]
local larry514 =larry513(_512_vararg1, "TextLabel")
local larry515 =_512_vararg1["Name"]
local larry511 =larry510(larry509, function(...)
local _512_vararg1, _512_vararg2, _512_vararg3, _512_vararg4, _512_vararg5, _512_vararg6, _512_vararg7, _512_vararg8, _512_vararg9, _512_vararg10 = ...
local larry513 =_512_vararg1["IsA"]
local larry514 =larry513(_512_vararg1, "TextLabel")
local larry515 =_512_vararg1["Name"]
end)
local larry482 =larry481(larry480, function(...)
local _483_vararg1, _483_vararg2, _483_vararg3, _483_vararg4, _483_vararg5, _483_vararg6, _483_vararg7, _483_vararg8, _483_vararg9, _483_vararg10 = ...
local larry484 =task["delay"]
local larry485 =larry484(0.35, function(...)
local _486_vararg1, _486_vararg2, _486_vararg3, _486_vararg4, _486_vararg5, _486_vararg6, _486_vararg7, _486_vararg8, _486_vararg9, _486_vararg10 = ...

end)
local larry487 =makefolder("MirandaTweenPlus")
local larry488 =larry6["JSONEncode"]
local larry489 =larry488(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = false,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = false,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = false,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = true,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = false,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry489)
local larry490 =larry14["FindFirstChild"]
local larry491 =larry490(larry14, "Plots")
local larry492 =larry491["GetChildren"]
local larry493 =larry492(larry491)
for larry494, _494_2 in ipairs(larry493) do
local larry495 =_494_2["FindFirstChild"]
local larry496 =larry495(_494_2, "PlotSign")
local larry497 =larry496["FindFirstChild"]
local larry498 =larry497(larry496, "YourBase")
local larry499 =larry498["Enabled"]
local larry500 =task["spawn"]
local larry501 =larry500(function(...)
local _502_vararg1, _502_vararg2, _502_vararg3, _502_vararg4, _502_vararg5, _502_vararg6, _502_vararg7, _502_vararg8, _502_vararg9, _502_vararg10 = ...
local larry503 =_494_2["GetDescendants"]
local larry504 =larry503(_494_2)
for larry505, _505_2 in ipairs(larry504) do
local larry506 =_505_2["IsA"]
local larry507 =larry506(_505_2, "TextLabel")
local larry508 =_505_2["Name"]
end
end)
local larry509 =_494_2["DescendantAdded"]
local larry510 =larry509["Connect"]
local larry511 =larry510(larry509, function(...)
local _512_vararg1, _512_vararg2, _512_vararg3, _512_vararg4, _512_vararg5, _512_vararg6, _512_vararg7, _512_vararg8, _512_vararg9, _512_vararg10 = ...
local larry513 =_512_vararg1["IsA"]
local larry514 =larry513(_512_vararg1, "TextLabel")
local larry515 =_512_vararg1["Name"]
end)
larry475["BackgroundColor3"] =larry34
end
end)
local larry516 =game["GetService"]
local larry517 =larry516(game, "ProximityPromptService")
local larry518 =larry12["Packages"]
local larry519 =larry518["Synchronizer"]
local larry520 =require(larry519)
local larry521 =larry12["Shared"]
local larry522 =larry521["Animals"]
local larry523 =require(larry522)
local larry524 =larry12["Datas"]
local larry525 =larry524["Animals"]
local larry526 =require(larry525)
local larry527 =UDim2["new"]
local larry528 =larry527(0.43, 0, 0, 28)
local larry529 =UDim2["new"]
local larry530 =larry529(0.52, 0, 0, 97)
local larry531 =Enum["Font"]
local larry532 =larry531["Arcade"]
local larry533 =Instance["new"]
local larry534 =larry533("TextButton")
local larry535 =UDim["new"]
local larry536 =larry535(0, 6)
local larry537 =Instance["new"]
local larry538 =larry537("UICorner")
local larry539 =larry534["MouseButton1Click"]
local larry540 =larry539["Connect"]
local larry543 =task["delay"]
local larry544 =larry543(0.35, function(...)
local _545_vararg1, _545_vararg2, _545_vararg3, _545_vararg4, _545_vararg5, _545_vararg6, _545_vararg7, _545_vararg8, _545_vararg9, _545_vararg10 = ...

end)
local larry546 =makefolder("MirandaTweenPlus")
local larry547 =larry6["JSONEncode"]
local larry548 =larry547(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = false,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = false,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = false,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = true,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = true,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry548)
local larry549 =larry14["Plots"]
local larry550 =larry549["GetChildren"]
local larry551 =larry550(larry549)
local larry553 =_552_2["GetAttribute"]
local larry554 =larry553(_552_2, "Tier")
local larry555 =larry520["Wait"]
local larry556 =_552_2["Name"]
local larry557 =larry555(larry520, larry556)
local larry558 =larry557["Get"]
local larry559 =larry558(larry557, "AnimalList")
local larry561 =larry523["GetGeneration"]
local larry562 =_560_2["Index"]
local larry563 =_560_2["Mutation"]
local larry564 =_560_2["Traits"]
local larry565 =larry561(larry523, larry562, larry563, larry564)
local larry566 =_552_2["FindFirstChild"]
local larry567 =_560_2["Index"]
local larry568 =larry566(_552_2, larry567)
local er =error("Luraph Script:1609: Luraph Script:1499: Luraph Script:1494: Luraph Script:1482: line 3: attempt to compare number < table")
local larry541 =larry540(larry539, function(...)
local _542_vararg1, _542_vararg2, _542_vararg3, _542_vararg4, _542_vararg5, _542_vararg6, _542_vararg7, _542_vararg8, _542_vararg9, _542_vararg10 = ...
local larry543 =task["delay"]
local larry544 =larry543(0.35, function(...)
local _545_vararg1, _545_vararg2, _545_vararg3, _545_vararg4, _545_vararg5, _545_vararg6, _545_vararg7, _545_vararg8, _545_vararg9, _545_vararg10 = ...

end)
local larry546 =makefolder("MirandaTweenPlus")
local larry547 =larry6["JSONEncode"]
local larry548 =larry547(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = false,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = false,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = false,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = true,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = true,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry548)
local larry549 =larry14["Plots"]
local larry550 =larry549["GetChildren"]
local larry551 =larry550(larry549)
for larry552, _552_2 in ipairs(larry551) do
local larry553 =_552_2["GetAttribute"]
local larry554 =larry553(_552_2, "Tier")
local larry555 =larry520["Wait"]
local larry556 =_552_2["Name"]
local larry557 =larry555(larry520, larry556)
local larry558 =larry557["Get"]
local larry559 =larry558(larry557, "AnimalList")
for larry560, _560_2 in pairs(larry559) do
local larry561 =larry523["GetGeneration"]
local larry562 =_560_2["Index"]
local larry563 =_560_2["Mutation"]
local larry564 =_560_2["Traits"]
local larry565 =larry561(larry523, larry562, larry563, larry564)
local larry566 =_552_2["FindFirstChild"]
local larry567 =_560_2["Index"]
local larry568 =larry566(_552_2, larry567)
local er =error("Luraph Script:1609: Luraph Script:1499: Luraph Script:1494: Luraph Script:1482: line 3: attempt to compare number < table")
end
end
end)
local larry569 =task["spawn"]
local _ =task.wait(0.5)
local larry570 =larry569(function(...)
local _571_vararg1, _571_vararg2, _571_vararg3, _571_vararg4, _571_vararg5, _571_vararg6, _571_vararg7, _571_vararg8, _571_vararg9, _571_vararg10 = ...
local _ =task.wait(0.5)
larry534["BackgroundColor3"] =larry34
end)
local larry572 =UDim2["new"]
local larry573 =larry572(0.43, 0, 0, 28)
local larry574 =UDim2["new"]
local larry575 =larry574(0.05, 0, 0, 129)
local larry576 =Enum["Font"]
local larry577 =larry576["Arcade"]
local larry578 =Instance["new"]
local larry579 =larry578("TextButton")
local larry580 =UDim["new"]
local larry581 =larry580(0, 6)
local larry582 =Instance["new"]
local larry583 =larry582("UICorner")
local larry584 =game["IsLoaded"]
local larry585 =larry584(game)
local larry586 =game["GetService"]
local larry587 =larry586(game, "ProximityPromptService")
local larry588 =cloneref(larry587)
local larry589 =game["GetService"]
local larry590 =larry589(game, "ReplicatedStorage")
local larry591 =game["GetService"]
local larry592 =larry591(game, "Players")
local larry593 =larry592["LocalPlayer"]
local larry594 =larry590["Packages"]
local larry595 =larry594["Net"]
local larry596 =require(larry595)
local larry597 =UDim2["new"]
local larry598 =larry597(0.43, 0, 0, 28)
local larry599 =UDim2["new"]
local larry600 =larry599(0.05, 0, 0, 97)
local larry601 =Enum["Font"]
local larry602 =larry601["Arcade"]
local larry603 =Instance["new"]
local larry604 =larry603("TextButton")
local larry605 =UDim["new"]
local larry606 =larry605(0, 6)
local larry607 =Instance["new"]
local larry608 =larry607("UICorner")
local larry609 =larry604["MouseButton1Click"]
local larry610 =larry609["Connect"]
local larry613 =task["delay"]
local larry614 =larry613(0.35, function(...)
local _615_vararg1, _615_vararg2, _615_vararg3, _615_vararg4, _615_vararg5, _615_vararg6, _615_vararg7, _615_vararg8, _615_vararg9, _615_vararg10 = ...

end)
local larry616 =makefolder("MirandaTweenPlus")
local larry617 =larry6["JSONEncode"]
local larry618 =larry617(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = false,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = false,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = false,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = true,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry618)
local larry611 =larry610(larry609, function(...)
local _612_vararg1, _612_vararg2, _612_vararg3, _612_vararg4, _612_vararg5, _612_vararg6, _612_vararg7, _612_vararg8, _612_vararg9, _612_vararg10 = ...
local larry613 =task["delay"]
local larry614 =larry613(0.35, function(...)
local _615_vararg1, _615_vararg2, _615_vararg3, _615_vararg4, _615_vararg5, _615_vararg6, _615_vararg7, _615_vararg8, _615_vararg9, _615_vararg10 = ...

end)
local larry616 =makefolder("MirandaTweenPlus")
local larry617 =larry6["JSONEncode"]
local larry618 =larry617(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = false,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = false,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = false,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = true,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry618)
larry604["BackgroundColor3"] =larry37
end)
local larry619 =UDim2["new"]
local larry620 =larry619(0.43, 0, 0, 28)
local larry621 =UDim2["new"]
local larry622 =larry621(0.05, 0, 0, 129)
local larry623 =Enum["Font"]
local larry624 =larry623["Arcade"]
local larry625 =Instance["new"]
local larry626 =larry625("TextButton")
local larry627 =UDim["new"]
local larry628 =larry627(0, 6)
local larry629 =Instance["new"]
local larry630 =larry629("UICorner")
local larry631 =workspace["FindFirstChild"]
local larry632 =larry631(workspace, "Plots")
local larry633 =larry626["MouseButton1Click"]
local larry634 =larry633["Connect"]
local larry637 =task["delay"]
local larry638 =larry637(0.35, function(...)
local _639_vararg1, _639_vararg2, _639_vararg3, _639_vararg4, _639_vararg5, _639_vararg6, _639_vararg7, _639_vararg8, _639_vararg9, _639_vararg10 = ...

end)
local larry640 =makefolder("MirandaTweenPlus")
local larry641 =larry6["JSONEncode"]
local larry642 =larry641(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = false,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = false,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = true,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry642)
local larry643 =task["spawn"]
local larry646 =larry632["GetChildren"]
local larry647 =larry646(larry632)
local larry649 =_648_2["FindFirstChild"]
local larry650 =larry649(_648_2, "Decorations")
local larry651 =larry650["GetDescendants"]
local larry652 =larry651(larry650)
local larry654 =_653_2["IsA"]
local larry655 =larry654(_653_2, "BasePart")
local _ =task.wait()
local _ =task.wait()
local larry644 =larry643(function(...)
local _645_vararg1, _645_vararg2, _645_vararg3, _645_vararg4, _645_vararg5, _645_vararg6, _645_vararg7, _645_vararg8, _645_vararg9, _645_vararg10 = ...
local larry646 =larry632["GetChildren"]
local larry647 =larry646(larry632)
for larry648, _648_2 in ipairs(larry647) do
end
local larry649 =_648_2["FindFirstChild"]
local larry650 =larry649(_648_2, "Decorations")
local larry651 =larry650["GetDescendants"]
local larry652 =larry651(larry650)
for larry653, _653_2 in ipairs(larry652) do
local larry654 =_653_2["IsA"]
local larry655 =larry654(_653_2, "BasePart")
_653_2["LocalTransparencyModifier"] =0.8
end
local _ =task.wait()
local _ =task.wait()
end)
local larry656 =larry632["ChildAdded"]
local larry657 =larry656["Connect"]
local _ =task.wait(0.5)
local larry660 =_659_vararg1["FindFirstChild"]
local larry661 =larry660(_659_vararg1, "Decorations")
local larry662 =larry661["GetDescendants"]
local larry663 =larry662(larry661)
local larry665 =_664_2["IsA"]
local larry666 =larry665(_664_2, "BasePart")
local larry658 =larry657(larry656, function(...)
local _659_vararg1, _659_vararg2, _659_vararg3, _659_vararg4, _659_vararg5, _659_vararg6, _659_vararg7, _659_vararg8, _659_vararg9, _659_vararg10 = ...
local _ =task.wait(0.5)
local larry660 =_659_vararg1["FindFirstChild"]
local larry661 =larry660(_659_vararg1, "Decorations")
local larry662 =larry661["GetDescendants"]
local larry663 =larry662(larry661)
for larry664, _664_2 in ipairs(larry663) do
local larry665 =_664_2["IsA"]
local larry666 =larry665(_664_2, "BasePart")
_664_2["LocalTransparencyModifier"] =0.8
end
end)
local larry667 =workspace["DescendantAdded"]
local larry668 =larry667["Connect"]
local larry671 =_670_vararg1["IsA"]
local larry672 =larry671(_670_vararg1, "BasePart")
local larry673 =_670_vararg1["FindFirstAncestorOfClass"]
local larry674 =larry673(_670_vararg1, "Folder")
local larry675 =larry674["Name"]
local larry669 =larry668(larry667, function(...)
local _670_vararg1, _670_vararg2, _670_vararg3, _670_vararg4, _670_vararg5, _670_vararg6, _670_vararg7, _670_vararg8, _670_vararg9, _670_vararg10 = ...
local larry671 =_670_vararg1["IsA"]
local larry672 =larry671(_670_vararg1, "BasePart")
local larry673 =_670_vararg1["FindFirstAncestorOfClass"]
local larry674 =larry673(_670_vararg1, "Folder")
local larry675 =larry674["Name"]
end)
local larry676 =game["GetService"]
local larry677 =larry676(game, "Players")
local larry678 =larry677["PlayerAdded"]
local larry679 =larry678["Connect"]
local larry682 =_681_vararg1["CharacterAdded"]
local larry683 =larry682["Connect"]
local _ =task.wait(0.5)
local larry686 =task["spawn"]
local larry689 =larry632["GetChildren"]
local larry690 =larry689(larry632)
local larry692 =_691_2["FindFirstChild"]
local larry693 =larry692(_691_2, "Decorations")
local larry694 =larry693["GetDescendants"]
local larry695 =larry694(larry693)
local larry697 =_696_2["IsA"]
local larry698 =larry697(_696_2, "BasePart")
local _ =task.wait()
local _ =task.wait()
local larry687 =larry686(function(...)
local _688_vararg1, _688_vararg2, _688_vararg3, _688_vararg4, _688_vararg5, _688_vararg6, _688_vararg7, _688_vararg8, _688_vararg9, _688_vararg10 = ...
local larry689 =larry632["GetChildren"]
local larry690 =larry689(larry632)
for larry691, _691_2 in ipairs(larry690) do
end
local larry692 =_691_2["FindFirstChild"]
local larry693 =larry692(_691_2, "Decorations")
local larry694 =larry693["GetDescendants"]
local larry695 =larry694(larry693)
for larry696, _696_2 in ipairs(larry695) do
local larry697 =_696_2["IsA"]
local larry698 =larry697(_696_2, "BasePart")
_696_2["LocalTransparencyModifier"] =0.8
end
local _ =task.wait()
local _ =task.wait()
end)
local larry684 =larry683(larry682, function(...)
local _685_vararg1, _685_vararg2, _685_vararg3, _685_vararg4, _685_vararg5, _685_vararg6, _685_vararg7, _685_vararg8, _685_vararg9, _685_vararg10 = ...
local _ =task.wait(0.5)
local larry686 =task["spawn"]
local larry687 =larry686(function(...)
local _688_vararg1, _688_vararg2, _688_vararg3, _688_vararg4, _688_vararg5, _688_vararg6, _688_vararg7, _688_vararg8, _688_vararg9, _688_vararg10 = ...
local larry689 =larry632["GetChildren"]
local larry690 =larry689(larry632)
for larry691, _691_2 in ipairs(larry690) do
end
local larry692 =_691_2["FindFirstChild"]
local larry693 =larry692(_691_2, "Decorations")
local larry694 =larry693["GetDescendants"]
local larry695 =larry694(larry693)
for larry696, _696_2 in ipairs(larry695) do
local larry697 =_696_2["IsA"]
local larry698 =larry697(_696_2, "BasePart")
_696_2["LocalTransparencyModifier"] =0.8
end
local _ =task.wait()
local _ =task.wait()
end)
end)
local larry680 =larry679(larry678, function(...)
local _681_vararg1, _681_vararg2, _681_vararg3, _681_vararg4, _681_vararg5, _681_vararg6, _681_vararg7, _681_vararg8, _681_vararg9, _681_vararg10 = ...
local larry682 =_681_vararg1["CharacterAdded"]
local larry683 =larry682["Connect"]
local larry684 =larry683(larry682, function(...)
local _685_vararg1, _685_vararg2, _685_vararg3, _685_vararg4, _685_vararg5, _685_vararg6, _685_vararg7, _685_vararg8, _685_vararg9, _685_vararg10 = ...
local _ =task.wait(0.5)
local larry686 =task["spawn"]
local larry687 =larry686(function(...)
local _688_vararg1, _688_vararg2, _688_vararg3, _688_vararg4, _688_vararg5, _688_vararg6, _688_vararg7, _688_vararg8, _688_vararg9, _688_vararg10 = ...
local larry689 =larry632["GetChildren"]
local larry690 =larry689(larry632)
for larry691, _691_2 in ipairs(larry690) do
end
local larry692 =_691_2["FindFirstChild"]
local larry693 =larry692(_691_2, "Decorations")
local larry694 =larry693["GetDescendants"]
local larry695 =larry694(larry693)
for larry696, _696_2 in ipairs(larry695) do
local larry697 =_696_2["IsA"]
local larry698 =larry697(_696_2, "BasePart")
_696_2["LocalTransparencyModifier"] =0.8
end
local _ =task.wait()
local _ =task.wait()
end)
end)
end)
local larry635 =larry634(larry633, function(...)
local _636_vararg1, _636_vararg2, _636_vararg3, _636_vararg4, _636_vararg5, _636_vararg6, _636_vararg7, _636_vararg8, _636_vararg9, _636_vararg10 = ...
local larry637 =task["delay"]
local larry638 =larry637(0.35, function(...)
local _639_vararg1, _639_vararg2, _639_vararg3, _639_vararg4, _639_vararg5, _639_vararg6, _639_vararg7, _639_vararg8, _639_vararg9, _639_vararg10 = ...

end)
local larry640 =makefolder("MirandaTweenPlus")
local larry641 =larry6["JSONEncode"]
local larry642 =larry641(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = false,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = false,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = true,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry642)
local larry643 =task["spawn"]
local larry644 =larry643(function(...)
local _645_vararg1, _645_vararg2, _645_vararg3, _645_vararg4, _645_vararg5, _645_vararg6, _645_vararg7, _645_vararg8, _645_vararg9, _645_vararg10 = ...
local larry646 =larry632["GetChildren"]
local larry647 =larry646(larry632)
for larry648, _648_2 in ipairs(larry647) do
end
local larry649 =_648_2["FindFirstChild"]
local larry650 =larry649(_648_2, "Decorations")
local larry651 =larry650["GetDescendants"]
local larry652 =larry651(larry650)
for larry653, _653_2 in ipairs(larry652) do
local larry654 =_653_2["IsA"]
local larry655 =larry654(_653_2, "BasePart")
_653_2["LocalTransparencyModifier"] =0.8
end
local _ =task.wait()
local _ =task.wait()
end)
local larry656 =larry632["ChildAdded"]
local larry657 =larry656["Connect"]
local larry658 =larry657(larry656, function(...)
local _659_vararg1, _659_vararg2, _659_vararg3, _659_vararg4, _659_vararg5, _659_vararg6, _659_vararg7, _659_vararg8, _659_vararg9, _659_vararg10 = ...
local _ =task.wait(0.5)
local larry660 =_659_vararg1["FindFirstChild"]
local larry661 =larry660(_659_vararg1, "Decorations")
local larry662 =larry661["GetDescendants"]
local larry663 =larry662(larry661)
for larry664, _664_2 in ipairs(larry663) do
local larry665 =_664_2["IsA"]
local larry666 =larry665(_664_2, "BasePart")
_664_2["LocalTransparencyModifier"] =0.8
end
end)
local larry667 =workspace["DescendantAdded"]
local larry668 =larry667["Connect"]
local larry669 =larry668(larry667, function(...)
local _670_vararg1, _670_vararg2, _670_vararg3, _670_vararg4, _670_vararg5, _670_vararg6, _670_vararg7, _670_vararg8, _670_vararg9, _670_vararg10 = ...
local larry671 =_670_vararg1["IsA"]
local larry672 =larry671(_670_vararg1, "BasePart")
local larry673 =_670_vararg1["FindFirstAncestorOfClass"]
local larry674 =larry673(_670_vararg1, "Folder")
local larry675 =larry674["Name"]
end)
local larry676 =game["GetService"]
local larry677 =larry676(game, "Players")
local larry678 =larry677["PlayerAdded"]
local larry679 =larry678["Connect"]
local larry680 =larry679(larry678, function(...)
local _681_vararg1, _681_vararg2, _681_vararg3, _681_vararg4, _681_vararg5, _681_vararg6, _681_vararg7, _681_vararg8, _681_vararg9, _681_vararg10 = ...
local larry682 =_681_vararg1["CharacterAdded"]
local larry683 =larry682["Connect"]
local larry684 =larry683(larry682, function(...)
local _685_vararg1, _685_vararg2, _685_vararg3, _685_vararg4, _685_vararg5, _685_vararg6, _685_vararg7, _685_vararg8, _685_vararg9, _685_vararg10 = ...
local _ =task.wait(0.5)
local larry686 =task["spawn"]
local larry687 =larry686(function(...)
local _688_vararg1, _688_vararg2, _688_vararg3, _688_vararg4, _688_vararg5, _688_vararg6, _688_vararg7, _688_vararg8, _688_vararg9, _688_vararg10 = ...
local larry689 =larry632["GetChildren"]
local larry690 =larry689(larry632)
for larry691, _691_2 in ipairs(larry690) do
end
local larry692 =_691_2["FindFirstChild"]
local larry693 =larry692(_691_2, "Decorations")
local larry694 =larry693["GetDescendants"]
local larry695 =larry694(larry693)
for larry696, _696_2 in ipairs(larry695) do
local larry697 =_696_2["IsA"]
local larry698 =larry697(_696_2, "BasePart")
_696_2["LocalTransparencyModifier"] =0.8
end
local _ =task.wait()
local _ =task.wait()
end)
end)
end)
larry626["BackgroundColor3"] =larry34
end)
local larry699 =UDim2["new"]
local larry700 =larry699(0.43, 0, 0, 28)
local larry701 =UDim2["new"]
local larry702 =larry701(0.52, 0, 0, 129)
local larry703 =Enum["Font"]
local larry704 =larry703["Arcade"]
local larry705 =Instance["new"]
local larry706 =larry705("TextButton")
local larry707 =UDim["new"]
local larry708 =larry707(0, 6)
local larry709 =Instance["new"]
local larry710 =larry709("UICorner")
local larry711 =larry706["MouseButton1Click"]
local larry712 =larry711["Connect"]
local larry715 =task["delay"]
local larry716 =larry715(0.35, function(...)
local _717_vararg1, _717_vararg2, _717_vararg3, _717_vararg4, _717_vararg5, _717_vararg6, _717_vararg7, _717_vararg8, _717_vararg9, _717_vararg10 = ...

end)
local larry718 =makefolder("MirandaTweenPlus")
local larry719 =larry6["JSONEncode"]
local larry720 =larry719(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = false,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = true,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry720)
local larry721 =task["spawn"]
local larry724 =larry8["GetPlayers"]
local larry725 =larry724(larry8)
local larry727 =_726_2["IsA"]
local larry728 =larry727(_726_2, "Player")
local larry729 =_726_2["SetAttribute"]
local larry722 =larry721(function(...)
local _723_vararg1, _723_vararg2, _723_vararg3, _723_vararg4, _723_vararg5, _723_vararg6, _723_vararg7, _723_vararg8, _723_vararg9, _723_vararg10 = ...
local larry724 =larry8["GetPlayers"]
local larry725 =larry724(larry8)
for larry726, _726_2 in ipairs(larry725) do
local larry727 =_726_2["IsA"]
local larry728 =larry727(_726_2, "Player")
local larry729 =_726_2["SetAttribute"]
end
end)
local larry730 =task["spawn"]
local larry733 =workspace["GetDescendants"]
local larry734 =larry733(workspace)
local larry736 =_735_2["IsA"]
local larry737 =larry736(_735_2, "BasePart")
local larry738 =Enum["Material"]
local larry739 =larry738["Plastic"]
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local larry731 =larry730(function(...)
local _732_vararg1, _732_vararg2, _732_vararg3, _732_vararg4, _732_vararg5, _732_vararg6, _732_vararg7, _732_vararg8, _732_vararg9, _732_vararg10 = ...
local larry733 =workspace["GetDescendants"]
local larry734 =larry733(workspace)
for larry735, _735_2 in ipairs(larry734) do
end
local larry736 =_735_2["IsA"]
local larry737 =larry736(_735_2, "BasePart")
local larry738 =Enum["Material"]
local larry739 =larry738["Plastic"]
_735_2["Material"] =larry739
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
end)
local larry740 =workspace["DescendantAdded"]
local larry741 =larry740["Connect"]
local larry744 =_743_vararg1["ClassName"]
local larry742 =larry741(larry740, function(...)
local _743_vararg1, _743_vararg2, _743_vararg3, _743_vararg4, _743_vararg5, _743_vararg6, _743_vararg7, _743_vararg8, _743_vararg9, _743_vararg10 = ...
local larry744 =_743_vararg1["ClassName"]
end)
local larry745 =game["GetService"]
local larry746 =larry745(game, "Players")
local larry747 =larry746["PlayerAdded"]
local larry748 =larry747["Connect"]
local larry751 =_750_vararg1["CharacterAdded"]
local larry752 =larry751["Connect"]
local _ =task.wait(0.5)
local larry755 =_754_vararg1["Parent"]
local larry756 =task["spawn"]
local larry759 =_754_vararg1["GetDescendants"]
local larry760 =larry759(_754_vararg1)
local larry762 =_761_2["Parent"]
local larry763 =_761_2["IsA"]
local larry764 =larry763(_761_2, "BasePart")
local larry765 =Enum["Material"]
local larry766 =larry765["Plastic"]
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local larry757 =larry756(function(...)
local _758_vararg1, _758_vararg2, _758_vararg3, _758_vararg4, _758_vararg5, _758_vararg6, _758_vararg7, _758_vararg8, _758_vararg9, _758_vararg10 = ...
local larry759 =_754_vararg1["GetDescendants"]
local larry760 =larry759(_754_vararg1)
for larry761, _761_2 in ipairs(larry760) do
end
local larry762 =_761_2["Parent"]
local larry763 =_761_2["IsA"]
local larry764 =larry763(_761_2, "BasePart")
local larry765 =Enum["Material"]
local larry766 =larry765["Plastic"]
_761_2["Material"] =larry766
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
end)
local larry767 =_750_vararg1["IsA"]
local larry768 =larry767(_750_vararg1, "Player")
local larry769 =_750_vararg1["SetAttribute"]
local larry753 =larry752(larry751, function(...)
local _754_vararg1, _754_vararg2, _754_vararg3, _754_vararg4, _754_vararg5, _754_vararg6, _754_vararg7, _754_vararg8, _754_vararg9, _754_vararg10 = ...
local _ =task.wait(0.5)
local larry755 =_754_vararg1["Parent"]
local larry756 =task["spawn"]
local larry757 =larry756(function(...)
local _758_vararg1, _758_vararg2, _758_vararg3, _758_vararg4, _758_vararg5, _758_vararg6, _758_vararg7, _758_vararg8, _758_vararg9, _758_vararg10 = ...
local larry759 =_754_vararg1["GetDescendants"]
local larry760 =larry759(_754_vararg1)
for larry761, _761_2 in ipairs(larry760) do
end
local larry762 =_761_2["Parent"]
local larry763 =_761_2["IsA"]
local larry764 =larry763(_761_2, "BasePart")
local larry765 =Enum["Material"]
local larry766 =larry765["Plastic"]
_761_2["Material"] =larry766
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
end)
local larry767 =_750_vararg1["IsA"]
local larry768 =larry767(_750_vararg1, "Player")
local larry769 =_750_vararg1["SetAttribute"]
end)
local larry749 =larry748(larry747, function(...)
local _750_vararg1, _750_vararg2, _750_vararg3, _750_vararg4, _750_vararg5, _750_vararg6, _750_vararg7, _750_vararg8, _750_vararg9, _750_vararg10 = ...
local larry751 =_750_vararg1["CharacterAdded"]
local larry752 =larry751["Connect"]
local larry753 =larry752(larry751, function(...)
local _754_vararg1, _754_vararg2, _754_vararg3, _754_vararg4, _754_vararg5, _754_vararg6, _754_vararg7, _754_vararg8, _754_vararg9, _754_vararg10 = ...
local _ =task.wait(0.5)
local larry755 =_754_vararg1["Parent"]
local larry756 =task["spawn"]
local larry757 =larry756(function(...)
local _758_vararg1, _758_vararg2, _758_vararg3, _758_vararg4, _758_vararg5, _758_vararg6, _758_vararg7, _758_vararg8, _758_vararg9, _758_vararg10 = ...
local larry759 =_754_vararg1["GetDescendants"]
local larry760 =larry759(_754_vararg1)
for larry761, _761_2 in ipairs(larry760) do
end
local larry762 =_761_2["Parent"]
local larry763 =_761_2["IsA"]
local larry764 =larry763(_761_2, "BasePart")
local larry765 =Enum["Material"]
local larry766 =larry765["Plastic"]
_761_2["Material"] =larry766
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
end)
local larry767 =_750_vararg1["IsA"]
local larry768 =larry767(_750_vararg1, "Player")
local larry769 =_750_vararg1["SetAttribute"]
end)
end)
local larry713 =larry712(larry711, function(...)
local _714_vararg1, _714_vararg2, _714_vararg3, _714_vararg4, _714_vararg5, _714_vararg6, _714_vararg7, _714_vararg8, _714_vararg9, _714_vararg10 = ...
local larry715 =task["delay"]
local larry716 =larry715(0.35, function(...)
local _717_vararg1, _717_vararg2, _717_vararg3, _717_vararg4, _717_vararg5, _717_vararg6, _717_vararg7, _717_vararg8, _717_vararg9, _717_vararg10 = ...

end)
local larry718 =makefolder("MirandaTweenPlus")
local larry719 =larry6["JSONEncode"]
local larry720 =larry719(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = false,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = true,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry720)
local larry721 =task["spawn"]
local larry722 =larry721(function(...)
local _723_vararg1, _723_vararg2, _723_vararg3, _723_vararg4, _723_vararg5, _723_vararg6, _723_vararg7, _723_vararg8, _723_vararg9, _723_vararg10 = ...
local larry724 =larry8["GetPlayers"]
local larry725 =larry724(larry8)
for larry726, _726_2 in ipairs(larry725) do
local larry727 =_726_2["IsA"]
local larry728 =larry727(_726_2, "Player")
local larry729 =_726_2["SetAttribute"]
end
end)
local larry730 =task["spawn"]
local larry731 =larry730(function(...)
local _732_vararg1, _732_vararg2, _732_vararg3, _732_vararg4, _732_vararg5, _732_vararg6, _732_vararg7, _732_vararg8, _732_vararg9, _732_vararg10 = ...
local larry733 =workspace["GetDescendants"]
local larry734 =larry733(workspace)
for larry735, _735_2 in ipairs(larry734) do
end
local larry736 =_735_2["IsA"]
local larry737 =larry736(_735_2, "BasePart")
local larry738 =Enum["Material"]
local larry739 =larry738["Plastic"]
_735_2["Material"] =larry739
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
end)
local larry740 =workspace["DescendantAdded"]
local larry741 =larry740["Connect"]
local larry742 =larry741(larry740, function(...)
local _743_vararg1, _743_vararg2, _743_vararg3, _743_vararg4, _743_vararg5, _743_vararg6, _743_vararg7, _743_vararg8, _743_vararg9, _743_vararg10 = ...
local larry744 =_743_vararg1["ClassName"]
end)
local larry745 =game["GetService"]
local larry746 =larry745(game, "Players")
local larry747 =larry746["PlayerAdded"]
local larry748 =larry747["Connect"]
local larry749 =larry748(larry747, function(...)
local _750_vararg1, _750_vararg2, _750_vararg3, _750_vararg4, _750_vararg5, _750_vararg6, _750_vararg7, _750_vararg8, _750_vararg9, _750_vararg10 = ...
local larry751 =_750_vararg1["CharacterAdded"]
local larry752 =larry751["Connect"]
local larry753 =larry752(larry751, function(...)
local _754_vararg1, _754_vararg2, _754_vararg3, _754_vararg4, _754_vararg5, _754_vararg6, _754_vararg7, _754_vararg8, _754_vararg9, _754_vararg10 = ...
local _ =task.wait(0.5)
local larry755 =_754_vararg1["Parent"]
local larry756 =task["spawn"]
local larry757 =larry756(function(...)
local _758_vararg1, _758_vararg2, _758_vararg3, _758_vararg4, _758_vararg5, _758_vararg6, _758_vararg7, _758_vararg8, _758_vararg9, _758_vararg10 = ...
local larry759 =_754_vararg1["GetDescendants"]
local larry760 =larry759(_754_vararg1)
for larry761, _761_2 in ipairs(larry760) do
end
local larry762 =_761_2["Parent"]
local larry763 =_761_2["IsA"]
local larry764 =larry763(_761_2, "BasePart")
local larry765 =Enum["Material"]
local larry766 =larry765["Plastic"]
_761_2["Material"] =larry766
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
local _ =task.wait()
end)
local larry767 =_750_vararg1["IsA"]
local larry768 =larry767(_750_vararg1, "Player")
local larry769 =_750_vararg1["SetAttribute"]
end)
end)
larry706["BackgroundColor3"] =larry34
end)
local larry770 =UDim2["new"]
local larry771 =larry770(0.43, 0, 0, 28)
local larry772 =UDim2["new"]
local larry773 =larry772(0.05, 0, 0, 161)
local larry774 =Enum["Font"]
local larry775 =larry774["Arcade"]
local larry776 =Instance["new"]
local larry777 =larry776("TextButton")
local larry778 =UDim["new"]
local larry779 =larry778(0, 6)
local larry780 =Instance["new"]
local larry781 =larry780("UICorner")
local larry782 =UDim2["new"]
local larry783 =larry782(1, -4, 0, 10)
local larry784 =UDim2["new"]
local larry785 =larry784(0, 2, 1, -11)
local larry786 =Enum["Font"]
local larry787 =larry786["Arcade"]
local larry788 =Enum["TextXAlignment"]
local larry789 =larry788["Center"]
local larry790 =Instance["new"]
local larry791 =larry790("TextLabel")
local larry792 =larry777["MouseButton1Click"]
local larry793 =larry792["Connect"]
local larry796 =task["delay"]
local larry797 =larry796(0.35, function(...)
local _798_vararg1, _798_vararg2, _798_vararg3, _798_vararg4, _798_vararg5, _798_vararg6, _798_vararg7, _798_vararg8, _798_vararg9, _798_vararg10 = ...

end)
local larry799 =makefolder("MirandaTweenPlus")
local larry800 =larry6["JSONEncode"]
local larry801 =larry800(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = true,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry801)
local larry802 =larry14["FindFirstChild"]
local larry803 =larry802(larry14, "Turrets")
local larry805 =larry803["ChildAdded"]
local larry806 =larry805["Connect"]
local larry809 =_808_vararg1["Name"]
local larry810 =_808_vararg1["Name"]
local larry811, _811_2, _811_3 =string.lower(larry810)
local larry812, _812_2, _812_3 =string.find(larry811, "All Seeing Sentry")
local larry813 =_808_vararg1["GetAttribute"]
local larry814 =larry813(_808_vararg1, "OwnerId")
local larry815 =_808_vararg1["GetAttribute"]
local larry816 =larry815(_808_vararg1, "ownerId")
local larry817 =_808_vararg1["GetAttribute"]
local larry818 =larry817(_808_vararg1, "Owner")
local larry819 =_808_vararg1["GetAttribute"]
local larry820 =larry819(_808_vararg1, "owner")
local larry821 =_808_vararg1["GetAttribute"]
local larry822 =larry821(_808_vararg1, "PlayerUserId")
local larry823 =_808_vararg1["GetAttribute"]
local larry824 =larry823(_808_vararg1, "UserId")
local larry825 =_808_vararg1["GetAttribute"]
local larry826 =larry825(_808_vararg1, "CreatorId")
local larry827 =_808_vararg1["GetAttribute"]
local larry828 =larry827(_808_vararg1, "PlacedByUserId")
local larry829 =_808_vararg1["GetAttribute"]
local larry830 =larry829(_808_vararg1, "PlayerId")
local larry831 =_808_vararg1["GetChildren"]
local larry832 =larry831(_808_vararg1)
local larry834 =_833_2["IsA"]
local larry835 =larry834(_833_2, "ObjectValue")
local larry836 =_833_2["Value"]
local larry837 =_833_2["Name"]
local larry838 =_808_vararg1["Parent"]
local larry839 =larry838["GetAttribute"]
local larry840 =larry839(larry838, "OwnerId")
local larry841 =larry838["GetAttribute"]
local larry842 =larry841(larry838, "ownerId")
local larry843 =larry838["GetAttribute"]
local larry844 =larry843(larry838, "Owner")
local larry845 =larry838["GetAttribute"]
local larry846 =larry845(larry838, "owner")
local larry847 =larry838["GetAttribute"]
local larry848 =larry847(larry838, "PlayerUserId")
local larry849 =larry838["GetAttribute"]
local larry850 =larry849(larry838, "UserId")
local larry851 =larry838["GetAttribute"]
local larry852 =larry851(larry838, "CreatorId")
local larry853 =larry838["GetAttribute"]
local larry854 =larry853(larry838, "PlacedByUserId")
local larry855 =larry838["GetAttribute"]
local larry856 =larry855(larry838, "PlayerId")
local larry857 =larry838["GetChildren"]
local larry858 =larry857(larry838)
local larry860 =_859_2["IsA"]
local larry861 =larry860(_859_2, "ObjectValue")
local larry862 =_859_2["Value"]
local larry863 =_859_2["Name"]
local larry864 =larry838["Parent"]
local larry865 =larry864["GetAttribute"]
local larry866 =larry865(larry864, "OwnerId")
local larry867 =larry864["GetAttribute"]
local larry868 =larry867(larry864, "ownerId")
local larry869 =larry864["GetAttribute"]
local larry870 =larry869(larry864, "Owner")
local larry871 =larry864["GetAttribute"]
local larry872 =larry871(larry864, "owner")
local larry873 =larry864["GetAttribute"]
local larry874 =larry873(larry864, "PlayerUserId")
local larry875 =larry864["GetAttribute"]
local larry876 =larry875(larry864, "UserId")
local larry877 =larry864["GetAttribute"]
local larry878 =larry877(larry864, "CreatorId")
local larry879 =larry864["GetAttribute"]
local larry880 =larry879(larry864, "PlacedByUserId")
local larry881 =larry864["GetAttribute"]
local larry882 =larry881(larry864, "PlayerId")
local larry883 =larry864["GetChildren"]
local larry884 =larry883(larry864)
local larry886 =_885_2["IsA"]
local larry887 =larry886(_885_2, "ObjectValue")
local larry888 =_885_2["Value"]
local larry889 =_885_2["Name"]
local larry890 =larry864["Parent"]
local larry891 =larry890["GetAttribute"]
local larry892 =larry891(larry890, "OwnerId")
local larry893 =larry890["GetAttribute"]
local larry894 =larry893(larry890, "ownerId")
local larry895 =larry890["GetAttribute"]
local larry896 =larry895(larry890, "Owner")
local larry897 =larry890["GetAttribute"]
local larry898 =larry897(larry890, "owner")
local larry899 =larry890["GetAttribute"]
local larry900 =larry899(larry890, "PlayerUserId")
local larry901 =larry890["GetAttribute"]
local larry902 =larry901(larry890, "UserId")
local larry903 =larry890["GetAttribute"]
local larry904 =larry903(larry890, "CreatorId")
local larry905 =larry890["GetAttribute"]
local larry906 =larry905(larry890, "PlacedByUserId")
local larry907 =larry890["GetAttribute"]
local larry908 =larry907(larry890, "PlayerId")
local larry909 =larry890["GetChildren"]
local larry910 =larry909(larry890)
local larry912 =_911_2["IsA"]
local larry913 =larry912(_911_2, "ObjectValue")
local larry914 =_911_2["Value"]
local larry915 =_911_2["Name"]
local larry916 =larry890["Parent"]
local larry917 =larry916["GetAttribute"]
local larry918 =larry917(larry916, "OwnerId")
local larry919 =larry916["GetAttribute"]
local larry920 =larry919(larry916, "ownerId")
local larry921 =larry916["GetAttribute"]
local larry922 =larry921(larry916, "Owner")
local larry923 =larry916["GetAttribute"]
local larry924 =larry923(larry916, "owner")
local larry925 =larry916["GetAttribute"]
local larry926 =larry925(larry916, "PlayerUserId")
local larry927 =larry916["GetAttribute"]
local larry928 =larry927(larry916, "UserId")
local larry929 =larry916["GetAttribute"]
local larry930 =larry929(larry916, "CreatorId")
local larry931 =larry916["GetAttribute"]
local larry932 =larry931(larry916, "PlacedByUserId")
local larry933 =larry916["GetAttribute"]
local larry934 =larry933(larry916, "PlayerId")
local larry935 =larry916["GetChildren"]
local larry936 =larry935(larry916)
local larry938 =_937_2["IsA"]
local larry939 =larry938(_937_2, "ObjectValue")
local larry940 =_937_2["Value"]
local larry941 =_937_2["Name"]
local larry942 =larry916["Parent"]
local larry943 =larry942["GetAttribute"]
local larry944 =larry943(larry942, "OwnerId")
local larry945 =larry942["GetAttribute"]
local larry946 =larry945(larry942, "ownerId")
local larry947 =larry942["GetAttribute"]
local larry948 =larry947(larry942, "Owner")
local larry949 =larry942["GetAttribute"]
local larry950 =larry949(larry942, "owner")
local larry951 =larry942["GetAttribute"]
local larry952 =larry951(larry942, "PlayerUserId")
local larry953 =larry942["GetAttribute"]
local larry954 =larry953(larry942, "UserId")
local larry955 =larry942["GetAttribute"]
local larry956 =larry955(larry942, "CreatorId")
local larry957 =larry942["GetAttribute"]
local larry958 =larry957(larry942, "PlacedByUserId")
local larry959 =larry942["GetAttribute"]
local larry960 =larry959(larry942, "PlayerId")
local larry961 =larry942["GetChildren"]
local larry962 =larry961(larry942)
local larry964 =_963_2["IsA"]
local larry965 =larry964(_963_2, "ObjectValue")
local larry966 =_963_2["Value"]
local larry967 =_963_2["Name"]
local larry968 =larry942["Parent"]
local larry969 =larry968["GetAttribute"]
local larry970 =larry969(larry968, "OwnerId")
local larry971 =larry968["GetAttribute"]
local larry972 =larry971(larry968, "ownerId")
local larry973 =larry968["GetAttribute"]
local larry974 =larry973(larry968, "Owner")
local larry975 =larry968["GetAttribute"]
local larry976 =larry975(larry968, "owner")
local larry977 =larry968["GetAttribute"]
local larry978 =larry977(larry968, "PlayerUserId")
local larry979 =larry968["GetAttribute"]
local larry980 =larry979(larry968, "UserId")
local larry981 =larry968["GetAttribute"]
local larry982 =larry981(larry968, "CreatorId")
local larry983 =larry968["GetAttribute"]
local larry984 =larry983(larry968, "PlacedByUserId")
local larry985 =larry968["GetAttribute"]
local larry986 =larry985(larry968, "PlayerId")
local larry987 =larry968["GetChildren"]
local larry988 =larry987(larry968)
local larry990 =_989_2["IsA"]
local larry991 =larry990(_989_2, "ObjectValue")
local larry992 =_989_2["Value"]
local larry993 =_989_2["Name"]
local larry994 =larry968["Parent"]
local larry995 =larry14["FindFirstChild"]
local larry996 =larry995(larry14, "Plots")
local larry997 =larry14["FindFirstChild"]
local larry998 =larry997(larry14, "Plots")
local larry999 =larry998["GetChildren"]
local larry1000 =larry999(larry998)
local larry1002 =_1001_2["FindFirstChild"]
local larry1003 =larry1002(_1001_2, "PlotSign")
local larry1004 =larry1003["FindFirstChild"]
local larry1005 =larry1004(larry1003, "YourBase")
local larry1006 =larry1003["YourBase"]
local larry1007 =larry1006["Enabled"]
local larry1008 =_1001_2["Name"]
local larry1010 =_808_vararg1["Parent"]
local larry1012 =_808_vararg1["Parent"]
local larry1014 =larry1012["Parent"]
local larry1016 =larry1012["Parent"]
local larry1018 =larry1016["Parent"]
local larry1020 =larry1016["Parent"]
local larry1022 =larry1020["Parent"]
local larry1024 =larry1020["Parent"]
local larry1026 =larry1024["Parent"]
local larry1028 =larry1024["Parent"]
local larry1030 =larry1028["Parent"]
local larry1032 =larry1028["Parent"]
local larry1034 =larry1032["Parent"]
local larry1036 =larry1032["Parent"]
local larry1038 =larry1036["Parent"]
local larry1040 =larry1036["Parent"]
local larry1042 =larry1040["Parent"]
local larry1044 =larry1040["Parent"]
local larry1046 =larry1044["Parent"]
local larry1048 =larry1044["Parent"]
local larry1050 =larry1048["Parent"]
local larry1052 =larry1048["Parent"]
local larry1054 =larry1052["Parent"]
local larry1056 =larry1052["Parent"]
local larry1058 =larry1056["Parent"]
local larry1060 =larry1056["Parent"]
local larry1062 =larry1060["Parent"]
local larry1064 =larry1060["Parent"]
local larry1066 =larry1064["Parent"]
local larry1068 =larry1064["Parent"]
local larry1070 =larry1068["Parent"]
local larry1072 =larry1068["Parent"]
local larry1074 =larry1072["Parent"]
local larry1076 =larry1072["Parent"]
local larry1078 =larry1076["Parent"]
local larry1080 =larry1076["Parent"]
local larry1082 =larry1080["Parent"]
local larry1084 =larry1080["Parent"]
local larry1086 =larry1084["Parent"]
local larry1088 =larry1084["Parent"]
local larry1090 =larry1088["Parent"]
local larry1092 =larry1088["Parent"]
local larry1094 =larry1092["Parent"]
local larry1096 =larry1092["Parent"]
local larry1098 =larry1096["Parent"]
local larry1100 =larry1096["Parent"]
local larry1102 =larry1100["Parent"]
local larry1104 =larry1100["Parent"]
local larry1106 =larry1104["Parent"]
local larry1108 =larry1104["Parent"]
local larry1110 =larry1108["Parent"]
local larry1112 =larry1108["Parent"]
local larry1114 =larry1112["Parent"]
local larry1116 =larry1112["Parent"]
local larry1118 =larry1116["Parent"]
local larry1120 =larry1116["Parent"]
local larry1122 =larry1120["Parent"]
local larry1124 =larry1120["Parent"]
local larry1126 =larry1124["Parent"]
local larry1128 =larry1124["Parent"]
local larry1130 =larry1128["Parent"]
local larry1132 =larry1128["Parent"]
local larry1134 =larry1132["Parent"]
local larry1136 =larry1132["Parent"]
local larry1138 =larry1136["Parent"]
local larry1140 =larry1136["Parent"]
local larry1142 =larry1140["Parent"]
local larry1144 =larry1140["Parent"]
local larry1146 =larry1144["Parent"]
local larry1148 =larry1144["Parent"]
local larry1150 =larry1148["Parent"]
local larry1152 =larry1148["Parent"]
local larry1154 =larry1152["Parent"]
local larry1156 =larry1152["Parent"]
local larry1158 =larry1156["Parent"]
local larry1160 =larry1156["Parent"]
local larry1162 =larry1160["Parent"]
local larry1164 =larry1160["Parent"]
local larry1166 =larry1164["Parent"]
local larry1168 =larry1164["Parent"]
local larry1170 =larry1168["Parent"]
local larry1172 =larry1168["Parent"]
local larry1174 =larry1172["Parent"]
local larry1176 =larry1172["Parent"]
local larry1178 =larry1176["Parent"]
local larry1180 =larry1176["Parent"]
local larry1182 =larry1180["Parent"]
local larry1184 =larry1180["Parent"]
local larry1186 =larry1184["Parent"]
local larry1188 =larry1184["Parent"]
local larry1190 =larry1188["Parent"]
local larry1192 =larry1188["Parent"]
local larry1194 =larry1192["Parent"]
local larry1196 =larry1192["Parent"]
local larry1198 =larry1196["Parent"]
local larry1200 =larry1196["Parent"]
local larry1202 =larry1200["Parent"]
local larry1204 =larry1200["Parent"]
local larry1206 =larry1204["Parent"]
local larry1208 =larry1204["Parent"]
local larry1210 =larry1208["Parent"]
local larry1212 =larry1208["Parent"]
local larry1214 =larry1212["Parent"]
local larry1216 =larry1212["Parent"]
local larry1218 =larry1216["Parent"]
local larry1220 =larry1216["Parent"]
local larry1222 =larry1220["Parent"]
local larry1224 =larry1220["Parent"]
local larry1226 =larry1224["Parent"]
local larry1228 =larry1224["Parent"]
local larry1230 =larry1228["Parent"]
local larry1232 =larry1228["Parent"]
local larry1234 =larry1232["Parent"]
local larry1236 =larry1232["Parent"]
local larry1238 =larry1236["Parent"]
local larry1240 =larry1236["Parent"]
local larry1242 =larry1240["Parent"]
local larry1244 =larry1240["Parent"]
local larry1246 =larry1244["Parent"]
local larry1248 =larry1244["Parent"]
local larry1250 =larry1248["Parent"]
local larry1252 =larry1248["Parent"]
local larry1254 =larry1252["Parent"]
local larry1256 =larry1252["Parent"]
local larry1258 =larry1256["Parent"]
local larry1260 =larry1256["Parent"]
local larry1262 =larry1260["Parent"]
local larry1264 =larry1260["Parent"]
local larry1266 =larry1264["Parent"]
local larry1268 =larry1264["Parent"]
local larry1270 =larry1268["Parent"]
local larry1272 =larry1268["Parent"]
local larry1274 =larry1272["Parent"]
local larry1276 =larry1272["Parent"]
local larry1278 =larry1276["Parent"]
local larry1280 =larry1276["Parent"]
local larry1282 =larry1280["Parent"]
local larry1284 =larry1280["Parent"]
local larry1286 =larry1284["Parent"]
local larry1288 =larry1284["Parent"]
local larry1290 =larry1288["Parent"]
local larry1292 =larry1288["Parent"]
local larry1294 =larry1292["Parent"]
local larry1296 =larry1292["Parent"]
local larry1298 =larry1296["Parent"]
local larry1300 =larry1296["Parent"]
local larry1302 =larry1300["Parent"]
local larry1304 =larry1300["Parent"]
local larry1306 =larry1304["Parent"]
local larry1308 =larry1304["Parent"]
local larry1310 =larry1308["Parent"]
local larry1312 =larry1308["Parent"]
local larry1314 =larry1312["Parent"]
local larry1316 =larry1312["Parent"]
local larry1318 =larry1316["Parent"]
local larry1320 =larry1316["Parent"]
local larry1322 =larry1320["Parent"]
local larry1324 =larry1320["Parent"]
local larry1326 =larry1324["Parent"]
local larry1328 =larry1324["Parent"]
local larry1330 =larry1328["Parent"]
local larry1332 =larry1328["Parent"]
local larry1334 =larry1332["Parent"]
local larry1336 =larry1332["Parent"]
local larry1338 =larry1336["Parent"]
local larry1340 =larry1336["Parent"]
local larry1342 =larry1340["Parent"]
local larry1344 =larry1340["Parent"]
local larry1346 =larry1344["Parent"]
local larry1348 =larry1344["Parent"]
local larry1350 =larry1348["Parent"]
local larry1352 =larry1348["Parent"]
local larry1354 =larry1352["Parent"]
local larry1356 =larry1352["Parent"]
local larry1358 =larry1356["Parent"]
local larry1360 =larry1356["Parent"]
local larry1362 =larry1360["Parent"]
local larry1364 =larry1360["Parent"]
local larry1366 =larry1364["Parent"]
local larry1368 =larry1364["Parent"]
local larry1370 =larry1368["Parent"]
local larry1372 =larry1368["Parent"]
local larry1374 =larry1372["Parent"]
local larry1376 =larry1372["Parent"]
local larry1378 =larry1376["Parent"]
local larry1380 =larry1376["Parent"]
local larry1382 =larry1380["Parent"]
local larry1384 =larry1380["Parent"]
local larry1386 =larry1384["Parent"]
local larry1388 =larry1384["Parent"]
local larry1390 =larry1388["Parent"]
local larry1392 =larry1388["Parent"]
local larry1394 =larry1392["Parent"]
local larry1396 =larry1392["Parent"]
local larry1398 =larry1396["Parent"]
local larry1400 =larry1396["Parent"]
local larry1402 =larry1400["Parent"]
local larry1404 =larry1400["Parent"]
local larry1406 =larry1404["Parent"]
local larry1408 =larry1404["Parent"]
local larry1410 =larry1408["Parent"]
local larry1412 =larry1408["Parent"]
local larry1414 =larry1412["Parent"]
local larry1416 =larry1412["Parent"]
local larry1418 =larry1416["Parent"]
local larry1420 =larry1416["Parent"]
local larry1422 =larry1420["Parent"]
local larry1424 =larry1420["Parent"]
local larry1426 =larry1424["Parent"]
local larry1428 =larry1424["Parent"]
local larry1430 =larry1428["Parent"]
local larry1432 =larry1428["Parent"]
local larry1434 =larry1432["Parent"]
local larry1436 =larry1432["Parent"]
local larry1438 =larry1436["Parent"]
local larry1440 =larry1436["Parent"]
local larry1442 =larry1440["Parent"]
local larry1444 =larry1440["Parent"]
local larry1446 =larry1444["Parent"]
local larry1448 =larry1444["Parent"]
local larry1450 =larry1448["Parent"]
local larry1452 =larry1448["Parent"]
local larry1454 =larry1452["Parent"]
local larry1456 =larry1452["Parent"]
local larry1458 =larry1456["Parent"]
local larry1460 =larry1456["Parent"]
local larry1462 =larry1460["Parent"]
local larry1464 =larry1460["Parent"]
local larry1466 =larry1464["Parent"]
local larry1468 =larry1464["Parent"]
local larry1470 =larry1468["Parent"]
local larry1472 =larry1468["Parent"]
local larry1474 =larry1472["Parent"]
local larry1476 =larry1472["Parent"]
local larry1478 =larry1476["Parent"]
local larry1480 =larry1476["Parent"]
local larry1482 =larry1480["Parent"]
local larry1484 =larry1480["Parent"]
local larry1486 =larry1484["Parent"]
local larry1488 =larry1484["Parent"]
local larry1490 =larry1488["Parent"]
local larry1492 =larry1488["Parent"]
local larry1494 =larry1492["Parent"]
local larry1496 =larry1492["Parent"]
local larry1498 =larry1496["Parent"]
local larry1500 =larry1496["Parent"]
local larry1502 =larry1500["Parent"]
local larry1504 =larry1500["Parent"]
local larry1506 =larry1504["Parent"]
local larry1508 =larry1504["Parent"]
local larry1510 =larry1508["Parent"]
local larry1512 =larry1508["Parent"]
local larry1514 =larry1512["Parent"]
local larry1516 =larry1512["Parent"]
local larry1518 =larry1516["Parent"]
local larry1520 =larry1516["Parent"]
local larry1522 =larry1520["Parent"]
local larry1524 =larry1520["Parent"]
local larry1526 =larry1524["Parent"]
local larry1528 =larry1524["Parent"]
local larry1530 =larry1528["Parent"]
local larry1532 =larry1528["Parent"]
local larry1534 =larry1532["Parent"]
local larry1536 =larry1532["Parent"]
local larry1538 =larry1536["Parent"]
local larry1540 =larry1536["Parent"]
local larry1542 =larry1540["Parent"]
local larry1544 =larry1540["Parent"]
local larry1546 =larry1544["Parent"]
local larry1548 =larry1544["Parent"]
local larry1550 =larry1548["Parent"]
local larry1552 =larry1548["Parent"]
local larry1554 =larry1552["Parent"]
local larry1556 =larry1552["Parent"]
local larry1558 =larry1556["Parent"]
local larry1560 =larry1556["Parent"]
local larry1562 =larry1560["Parent"]
local larry1564 =larry1560["Parent"]
local larry1566 =larry1564["Parent"]
local larry1568 =larry1564["Parent"]
local larry1570 =larry1568["Parent"]
local larry1572 =larry1568["Parent"]
local larry1574 =larry1572["Parent"]
local larry1576 =larry1572["Parent"]
local larry1578 =larry1576["Parent"]
local larry1580 =larry1576["Parent"]
local larry1582 =larry1580["Parent"]
local larry1584 =larry1580["Parent"]
local larry1586 =larry1584["Parent"]
local larry1588 =larry1584["Parent"]
local larry1590 =larry1588["Parent"]
local larry1592 =larry1588["Parent"]
local larry1594 =larry1592["Parent"]
local larry1596 =larry1592["Parent"]
local larry1598 =larry1596["Parent"]
local larry1600 =larry1596["Parent"]
local larry1602 =larry1600["Parent"]
local larry1604 =larry1600["Parent"]
local larry1606 =larry1604["Parent"]
local larry1608 =larry1604["Parent"]
local larry1610 =larry1608["Parent"]
local larry1612 =larry1608["Parent"]
local larry1614 =larry1612["Parent"]
local larry1616 =larry1612["Parent"]
local larry1618 =larry1616["Parent"]
local larry1620 =larry1616["Parent"]
local larry1622 =larry1620["Parent"]
local larry1624 =larry1620["Parent"]
local larry1626 =larry1624["Parent"]
local larry1628 =larry1624["Parent"]
local larry1630 =larry1628["Parent"]
local larry1632 =larry1628["Parent"]
local larry1634 =larry1632["Parent"]
local larry1636 =larry1632["Parent"]
local larry1638 =larry1636["Parent"]
local larry1640 =larry1636["Parent"]
local larry1642 =larry1640["Parent"]
local larry1644 =larry1640["Parent"]
local larry1646 =larry1644["Parent"]
local larry1648 =larry1644["Parent"]
local larry1650 =larry1648["Parent"]
local larry1652 =larry1648["Parent"]
local larry1654 =larry1652["Parent"]
local larry1656 =larry1652["Parent"]
local larry1658 =larry1656["Parent"]
local larry1660 =larry1656["Parent"]
local larry1662 =larry1660["Parent"]
local larry1664 =larry1660["Parent"]
local larry1666 =larry1664["Parent"]
local larry1668 =larry1664["Parent"]
local larry1670 =larry1668["Parent"]
local larry1672 =larry1668["Parent"]
local larry1674 =larry1672["Parent"]
local larry1676 =larry1672["Parent"]
local larry1678 =larry1676["Parent"]
local larry1680 =larry1676["Parent"]
local larry1682 =larry1680["Parent"]
local larry1684 =larry1680["Parent"]
local larry1686 =larry1684["Parent"]
local larry1688 =larry1684["Parent"]
local larry1690 =larry1688["Parent"]
local larry1692 =larry1688["Parent"]
local larry1694 =larry1692["Parent"]
local larry1696 =larry1692["Parent"]
local larry1698 =larry1696["Parent"]
local larry1700 =larry1696["Parent"]
local larry1702 =larry1700["Parent"]
local larry1704 =larry1700["Parent"]
local larry1706 =larry1704["Parent"]
local larry1708 =larry1704["Parent"]
local larry1710 =larry1708["Parent"]
local larry1712 =larry1708["Parent"]
local larry1714 =larry1712["Parent"]
local larry1716 =larry1712["Parent"]
local larry1718 =larry1716["Parent"]
local larry1720 =larry1716["Parent"]
local larry1722 =larry1720["Parent"]
local larry1724 =larry1720["Parent"]
local larry1726 =larry1724["Parent"]
local larry1728 =larry1724["Parent"]
local larry1730 =larry1728["Parent"]
local larry1732 =larry1728["Parent"]
local larry1734 =larry1732["Parent"]
local larry1736 =larry1732["Parent"]
local larry1738 =larry1736["Parent"]
local larry1740 =larry1736["Parent"]
local larry1742 =larry1740["Parent"]
local larry1744 =larry1740["Parent"]
local larry1746 =larry1744["Parent"]
local larry1748 =larry1744["Parent"]
local larry1750 =larry1748["Parent"]
local larry1752 =larry1748["Parent"]
local larry1754 =larry1752["Parent"]
local larry1756 =larry1752["Parent"]
local larry1758 =larry1756["Parent"]
local larry1760 =larry1756["Parent"]
local larry1762 =larry1760["Parent"]
local larry1764 =larry1760["Parent"]
local larry1766 =larry1764["Parent"]
local larry1768 =larry1764["Parent"]
local larry1770 =larry1768["Parent"]
local larry1772 =larry1768["Parent"]
local larry1774 =larry1772["Parent"]
local larry1776 =larry1772["Parent"]
local larry1778 =larry1776["Parent"]
local larry1780 =larry1776["Parent"]
local larry1782 =larry1780["Parent"]
local larry1784 =larry1780["Parent"]
local larry1786 =larry1784["Parent"]
local larry1788 =larry1784["Parent"]
local larry1790 =larry1788["Parent"]
local larry1792 =larry1788["Parent"]
local larry1794 =larry1792["Parent"]
local larry1796 =larry1792["Parent"]
local larry1798 =larry1796["Parent"]
local larry1800 =larry1796["Parent"]
local larry1802 =larry1800["Parent"]
local larry1804 =larry1800["Parent"]
local larry1806 =larry1804["Parent"]
local larry1808 =larry1804["Parent"]
local larry1810 =larry1808["Parent"]
local larry1812 =larry1808["Parent"]
local larry1814 =larry1812["Parent"]
local larry1816 =larry1812["Parent"]
local larry1818 =larry1816["Parent"]
local larry1820 =larry1816["Parent"]
local larry1822 =larry1820["Parent"]
local larry1824 =larry1820["Parent"]
local larry1826 =larry1824["Parent"]
local larry1828 =larry1824["Parent"]
local larry1830 =larry1828["Parent"]
local larry1832 =larry1828["Parent"]
local larry1834 =larry1832["Parent"]
local larry1836 =larry1832["Parent"]
local larry1838 =larry1836["Parent"]
local larry1840 =larry1836["Parent"]
local larry1842 =larry1840["Parent"]
local larry1844 =larry1840["Parent"]
local larry1846 =larry1844["Parent"]
local larry1848 =larry1844["Parent"]
local larry1850 =larry1848["Parent"]
local larry1852 =larry1848["Parent"]
local larry1854 =larry1852["Parent"]
local larry1856 =larry1852["Parent"]
local larry1858 =larry1856["Parent"]
local larry1860 =larry1856["Parent"]
local larry1862 =larry1860["Parent"]
local larry1864 =larry1860["Parent"]
local larry1866 =larry1864["Parent"]
local larry1868 =larry1864["Parent"]
local larry1870 =larry1868["Parent"]
local larry1872 =larry1868["Parent"]
local larry1874 =larry1872["Parent"]
local larry1876 =larry1872["Parent"]
local larry1878 =larry1876["Parent"]
local larry1880 =larry1876["Parent"]
local larry1882 =larry1880["Parent"]
local larry1884 =larry1880["Parent"]
local larry1886 =larry1884["Parent"]
local larry1888 =larry1884["Parent"]
local larry1890 =larry1888["Parent"]
local larry1892 =larry1888["Parent"]
local larry1894 =larry1892["Parent"]
local larry1896 =larry1892["Parent"]
local larry1898 =larry1896["Parent"]
local larry1900 =larry1896["Parent"]
local larry1902 =larry1900["Parent"]
local larry1904 =larry1900["Parent"]
local larry1906 =larry1904["Parent"]
local larry1908 =larry1904["Parent"]
local larry1910 =larry1908["Parent"]
local larry1912 =larry1908["Parent"]
local larry1914 =larry1912["Parent"]
local larry1916 =larry1912["Parent"]
local larry1918 =larry1916["Parent"]
local larry1920 =larry1916["Parent"]
local larry1922 =larry1920["Parent"]
local larry1924 =larry1920["Parent"]
local larry1926 =larry1924["Parent"]
local larry1928 =larry1924["Parent"]
local larry1930 =larry1928["Parent"]
local larry1932 =larry1928["Parent"]
local larry1934 =larry1932["Parent"]
local larry1936 =larry1932["Parent"]
local larry1938 =larry1936["Parent"]
local larry1940 =larry1936["Parent"]
local larry1942 =larry1940["Parent"]
local larry1944 =larry1940["Parent"]
local larry1946 =larry1944["Parent"]
local larry1948 =larry1944["Parent"]
local larry1950 =larry1948["Parent"]
local larry1952 =larry1948["Parent"]
local larry1954 =larry1952["Parent"]
local larry1956 =larry1952["Parent"]
local larry1958 =larry1956["Parent"]
local larry1960 =larry1956["Parent"]
local larry1962 =larry1960["Parent"]
local larry1964 =larry1960["Parent"]
local larry1966 =larry1964["Parent"]
local larry1968 =larry1964["Parent"]
local larry1970 =larry1968["Parent"]
local larry1972 =larry1968["Parent"]
local larry1974 =larry1972["Parent"]
local larry1976 =larry1972["Parent"]
local larry1978 =larry1976["Parent"]
local larry1980 =larry1976["Parent"]
local larry1982 =larry1980["Parent"]
local larry1984 =larry1980["Parent"]
local larry1986 =larry1984["Parent"]
local larry1988 =larry1984["Parent"]
local larry1990 =larry1988["Parent"]
local larry1992 =larry1988["Parent"]
local larry1994 =larry1992["Parent"]
local larry1996 =larry1992["Parent"]
local larry1998 =larry1996["Parent"]
local larry2000 =larry1996["Parent"]
local larry2002 =larry2000["Parent"]
local larry2004 =larry2000["Parent"]
local larry2006 =larry2004["Parent"]
local larry2008 =larry2004["Parent"]
local larry2010 =larry2008["Parent"]
local larry2012 =larry2008["Parent"]
local larry2014 =larry2012["Parent"]
local larry2016 =larry2012["Parent"]
local larry2018 =larry2016["Parent"]
local larry2020 =larry2016["Parent"]
local larry2022 =larry2020["Parent"]
local larry2024 =larry2020["Parent"]
local larry2026 =larry2024["Parent"]
local larry2028 =larry2024["Parent"]
local larry2030 =larry2028["Parent"]
local larry2032 =larry2028["Parent"]
local larry2034 =larry2032["Parent"]
local larry2036 =larry2032["Parent"]
local larry2038 =larry2036["Parent"]
local larry2040 =larry2036["Parent"]
local larry2042 =larry2040["Parent"]
local larry2044 =larry2040["Parent"]
local larry2046 =larry2044["Parent"]
local larry2048 =larry2044["Parent"]
local larry2050 =larry2048["Parent"]
local larry2052 =larry2048["Parent"]
local larry2054 =larry2052["Parent"]
local larry2056 =larry2052["Parent"]
local larry2058 =larry2056["Parent"]
local larry2060 =larry2056["Parent"]
local larry2062 =larry2060["Parent"]
local larry2064 =larry2060["Parent"]
local larry2066 =larry2064["Parent"]
local larry2068 =larry2064["Parent"]
local larry2070 =larry2068["Parent"]
local larry2072 =larry2068["Parent"]
local larry2074 =larry2072["Parent"]
local larry2076 =larry2072["Parent"]
local larry2078 =larry2076["Parent"]
local larry2080 =larry2076["Parent"]
local larry2082 =larry2080["Parent"]
local larry2084 =larry2080["Parent"]
local larry2086 =larry2084["Parent"]
local larry2088 =larry2084["Parent"]
local larry2090 =larry2088["Parent"]
local larry2092 =larry2088["Parent"]
local larry2094 =larry2092["Parent"]
local larry2096 =larry2092["Parent"]
local larry2098 =larry2096["Parent"]
local larry2100 =larry2096["Parent"]
local larry2102 =larry2100["Parent"]
local larry2104 =larry2100["Parent"]
local larry2106 =larry2104["Parent"]
local larry2108 =larry2104["Parent"]
local larry2110 =larry2108["Parent"]
local larry2112 =larry2108["Parent"]
local larry2114 =larry2112["Parent"]
local larry2116 =larry2112["Parent"]
local larry2118 =larry2116["Parent"]
local larry2120 =larry2116["Parent"]
local larry2122 =larry2120["Parent"]
local larry2124 =larry2120["Parent"]
local larry2126 =larry2124["Parent"]
local larry2128 =larry2124["Parent"]
local larry2130 =larry2128["Parent"]
local larry2132 =larry2128["Parent"]
local larry2134 =larry2132["Parent"]
local larry2136 =larry2132["Parent"]
local larry2138 =larry2136["Parent"]
local larry2140 =larry2136["Parent"]
local larry2142 =larry2140["Parent"]
local larry2144 =larry2140["Parent"]
local larry2146 =larry2144["Parent"]
local larry2148 =larry2144["Parent"]
local larry2150 =larry2148["Parent"]
local larry2152 =larry2148["Parent"]
local larry2154 =larry2152["Parent"]
local larry2156 =larry2152["Parent"]
local larry2158 =larry2156["Parent"]
local larry2160 =larry2156["Parent"]
local larry2162 =larry2160["Parent"]
local larry2164 =larry2160["Parent"]
local larry2166 =larry2164["Parent"]
local larry2168 =larry2164["Parent"]
local larry2170 =larry2168["Parent"]
local larry2172 =larry2168["Parent"]
local larry2174 =larry2172["Parent"]
local larry2176 =larry2172["Parent"]
local larry2178 =larry2176["Parent"]
local larry2180 =larry2176["Parent"]
local larry2182 =larry2180["Parent"]
local larry2184 =larry2180["Parent"]
local larry2186 =larry2184["Parent"]
local larry2188 =larry2184["Parent"]
local larry2190 =larry2188["Parent"]
local larry2192 =larry2188["Parent"]
local larry2194 =larry2192["Parent"]
local larry2196 =larry2192["Parent"]
local larry2198 =larry2196["Parent"]
local larry2200 =larry2196["Parent"]
local larry2202 =larry2200["Parent"]
local larry2204 =larry2200["Parent"]
local er =error("Luraph Script:603: Luraph Script:300: Luraph Script:284: internal 542: <larry: infinitelooperror>")
local larry807 =larry806(larry805, function(...)
local _808_vararg1, _808_vararg2, _808_vararg3, _808_vararg4, _808_vararg5, _808_vararg6, _808_vararg7, _808_vararg8, _808_vararg9, _808_vararg10 = ...
local larry809 =_808_vararg1["Name"]
local larry810 =_808_vararg1["Name"]
local larry811, _811_2, _811_3 =string.lower(larry810)
local larry812, _812_2, _812_3 =string.find(larry811, "All Seeing Sentry")
local larry813 =_808_vararg1["GetAttribute"]
local larry814 =larry813(_808_vararg1, "OwnerId")
local larry815 =_808_vararg1["GetAttribute"]
local larry816 =larry815(_808_vararg1, "ownerId")
local larry817 =_808_vararg1["GetAttribute"]
local larry818 =larry817(_808_vararg1, "Owner")
local larry819 =_808_vararg1["GetAttribute"]
local larry820 =larry819(_808_vararg1, "owner")
local larry821 =_808_vararg1["GetAttribute"]
local larry822 =larry821(_808_vararg1, "PlayerUserId")
local larry823 =_808_vararg1["GetAttribute"]
local larry824 =larry823(_808_vararg1, "UserId")
local larry825 =_808_vararg1["GetAttribute"]
local larry826 =larry825(_808_vararg1, "CreatorId")
local larry827 =_808_vararg1["GetAttribute"]
local larry828 =larry827(_808_vararg1, "PlacedByUserId")
local larry829 =_808_vararg1["GetAttribute"]
local larry830 =larry829(_808_vararg1, "PlayerId")
local larry831 =_808_vararg1["GetChildren"]
local larry832 =larry831(_808_vararg1)
for larry833, _833_2 in ipairs(larry832) do
local larry834 =_833_2["IsA"]
local larry835 =larry834(_833_2, "ObjectValue")
local larry836 =_833_2["Value"]
local larry837 =_833_2["Name"]
end
local larry838 =_808_vararg1["Parent"]
local larry839 =larry838["GetAttribute"]
local larry840 =larry839(larry838, "OwnerId")
local larry841 =larry838["GetAttribute"]
local larry842 =larry841(larry838, "ownerId")
local larry843 =larry838["GetAttribute"]
local larry844 =larry843(larry838, "Owner")
local larry845 =larry838["GetAttribute"]
local larry846 =larry845(larry838, "owner")
local larry847 =larry838["GetAttribute"]
local larry848 =larry847(larry838, "PlayerUserId")
local larry849 =larry838["GetAttribute"]
local larry850 =larry849(larry838, "UserId")
local larry851 =larry838["GetAttribute"]
local larry852 =larry851(larry838, "CreatorId")
local larry853 =larry838["GetAttribute"]
local larry854 =larry853(larry838, "PlacedByUserId")
local larry855 =larry838["GetAttribute"]
local larry856 =larry855(larry838, "PlayerId")
local larry857 =larry838["GetChildren"]
local larry858 =larry857(larry838)
for larry859, _859_2 in ipairs(larry858) do
local larry860 =_859_2["IsA"]
local larry861 =larry860(_859_2, "ObjectValue")
local larry862 =_859_2["Value"]
local larry863 =_859_2["Name"]
end
local larry864 =larry838["Parent"]
local larry865 =larry864["GetAttribute"]
local larry866 =larry865(larry864, "OwnerId")
local larry867 =larry864["GetAttribute"]
local larry868 =larry867(larry864, "ownerId")
local larry869 =larry864["GetAttribute"]
local larry870 =larry869(larry864, "Owner")
local larry871 =larry864["GetAttribute"]
local larry872 =larry871(larry864, "owner")
local larry873 =larry864["GetAttribute"]
local larry874 =larry873(larry864, "PlayerUserId")
local larry875 =larry864["GetAttribute"]
local larry876 =larry875(larry864, "UserId")
local larry877 =larry864["GetAttribute"]
local larry878 =larry877(larry864, "CreatorId")
local larry879 =larry864["GetAttribute"]
local larry880 =larry879(larry864, "PlacedByUserId")
local larry881 =larry864["GetAttribute"]
local larry882 =larry881(larry864, "PlayerId")
local larry883 =larry864["GetChildren"]
local larry884 =larry883(larry864)
for larry885, _885_2 in ipairs(larry884) do
local larry886 =_885_2["IsA"]
local larry887 =larry886(_885_2, "ObjectValue")
local larry888 =_885_2["Value"]
local larry889 =_885_2["Name"]
end
local larry890 =larry864["Parent"]
local larry891 =larry890["GetAttribute"]
local larry892 =larry891(larry890, "OwnerId")
local larry893 =larry890["GetAttribute"]
local larry894 =larry893(larry890, "ownerId")
local larry895 =larry890["GetAttribute"]
local larry896 =larry895(larry890, "Owner")
local larry897 =larry890["GetAttribute"]
local larry898 =larry897(larry890, "owner")
local larry899 =larry890["GetAttribute"]
local larry900 =larry899(larry890, "PlayerUserId")
local larry901 =larry890["GetAttribute"]
local larry902 =larry901(larry890, "UserId")
local larry903 =larry890["GetAttribute"]
local larry904 =larry903(larry890, "CreatorId")
local larry905 =larry890["GetAttribute"]
local larry906 =larry905(larry890, "PlacedByUserId")
local larry907 =larry890["GetAttribute"]
local larry908 =larry907(larry890, "PlayerId")
local larry909 =larry890["GetChildren"]
local larry910 =larry909(larry890)
for larry911, _911_2 in ipairs(larry910) do
local larry912 =_911_2["IsA"]
local larry913 =larry912(_911_2, "ObjectValue")
local larry914 =_911_2["Value"]
local larry915 =_911_2["Name"]
end
local larry916 =larry890["Parent"]
local larry917 =larry916["GetAttribute"]
local larry918 =larry917(larry916, "OwnerId")
local larry919 =larry916["GetAttribute"]
local larry920 =larry919(larry916, "ownerId")
local larry921 =larry916["GetAttribute"]
local larry922 =larry921(larry916, "Owner")
local larry923 =larry916["GetAttribute"]
local larry924 =larry923(larry916, "owner")
local larry925 =larry916["GetAttribute"]
local larry926 =larry925(larry916, "PlayerUserId")
local larry927 =larry916["GetAttribute"]
local larry928 =larry927(larry916, "UserId")
local larry929 =larry916["GetAttribute"]
local larry930 =larry929(larry916, "CreatorId")
local larry931 =larry916["GetAttribute"]
local larry932 =larry931(larry916, "PlacedByUserId")
local larry933 =larry916["GetAttribute"]
local larry934 =larry933(larry916, "PlayerId")
local larry935 =larry916["GetChildren"]
local larry936 =larry935(larry916)
for larry937, _937_2 in ipairs(larry936) do
local larry938 =_937_2["IsA"]
local larry939 =larry938(_937_2, "ObjectValue")
local larry940 =_937_2["Value"]
local larry941 =_937_2["Name"]
end
local larry942 =larry916["Parent"]
local larry943 =larry942["GetAttribute"]
local larry944 =larry943(larry942, "OwnerId")
local larry945 =larry942["GetAttribute"]
local larry946 =larry945(larry942, "ownerId")
local larry947 =larry942["GetAttribute"]
local larry948 =larry947(larry942, "Owner")
local larry949 =larry942["GetAttribute"]
local larry950 =larry949(larry942, "owner")
local larry951 =larry942["GetAttribute"]
local larry952 =larry951(larry942, "PlayerUserId")
local larry953 =larry942["GetAttribute"]
local larry954 =larry953(larry942, "UserId")
local larry955 =larry942["GetAttribute"]
local larry956 =larry955(larry942, "CreatorId")
local larry957 =larry942["GetAttribute"]
local larry958 =larry957(larry942, "PlacedByUserId")
local larry959 =larry942["GetAttribute"]
local larry960 =larry959(larry942, "PlayerId")
local larry961 =larry942["GetChildren"]
local larry962 =larry961(larry942)
for larry963, _963_2 in ipairs(larry962) do
local larry964 =_963_2["IsA"]
local larry965 =larry964(_963_2, "ObjectValue")
local larry966 =_963_2["Value"]
local larry967 =_963_2["Name"]
end
local larry968 =larry942["Parent"]
local larry969 =larry968["GetAttribute"]
local larry970 =larry969(larry968, "OwnerId")
local larry971 =larry968["GetAttribute"]
local larry972 =larry971(larry968, "ownerId")
local larry973 =larry968["GetAttribute"]
local larry974 =larry973(larry968, "Owner")
local larry975 =larry968["GetAttribute"]
local larry976 =larry975(larry968, "owner")
local larry977 =larry968["GetAttribute"]
local larry978 =larry977(larry968, "PlayerUserId")
local larry979 =larry968["GetAttribute"]
local larry980 =larry979(larry968, "UserId")
local larry981 =larry968["GetAttribute"]
local larry982 =larry981(larry968, "CreatorId")
local larry983 =larry968["GetAttribute"]
local larry984 =larry983(larry968, "PlacedByUserId")
local larry985 =larry968["GetAttribute"]
local larry986 =larry985(larry968, "PlayerId")
local larry987 =larry968["GetChildren"]
local larry988 =larry987(larry968)
for larry989, _989_2 in ipairs(larry988) do
local larry990 =_989_2["IsA"]
local larry991 =larry990(_989_2, "ObjectValue")
local larry992 =_989_2["Value"]
local larry993 =_989_2["Name"]
end
local larry994 =larry968["Parent"]
local larry995 =larry14["FindFirstChild"]
local larry996 =larry995(larry14, "Plots")
local larry997 =larry14["FindFirstChild"]
local larry998 =larry997(larry14, "Plots")
local larry999 =larry998["GetChildren"]
local larry1000 =larry999(larry998)
for larry1001, _1001_2 in ipairs(larry1000) do
local larry1002 =_1001_2["FindFirstChild"]
local larry1003 =larry1002(_1001_2, "PlotSign")
local larry1004 =larry1003["FindFirstChild"]
local larry1005 =larry1004(larry1003, "YourBase")
local larry1006 =larry1003["YourBase"]
local larry1007 =larry1006["Enabled"]
local larry1008 =_1001_2["Name"]
local larry1009 =(_808_vararg1==larry14)
local larry1010 =_808_vararg1["Parent"]
local larry1011 =(larry1010==larry996)
local larry1012 =_808_vararg1["Parent"]
local larry1013 =(larry1012==larry14)
local larry1014 =larry1012["Parent"]
local larry1015 =(larry1014==larry996)
local larry1016 =larry1012["Parent"]
local larry1017 =(larry1016==larry14)
local larry1018 =larry1016["Parent"]
local larry1019 =(larry1018==larry996)
local larry1020 =larry1016["Parent"]
local larry1021 =(larry1020==larry14)
local larry1022 =larry1020["Parent"]
local larry1023 =(larry1022==larry996)
local larry1024 =larry1020["Parent"]
local larry1025 =(larry1024==larry14)
local larry1026 =larry1024["Parent"]
local larry1027 =(larry1026==larry996)
local larry1028 =larry1024["Parent"]
local larry1029 =(larry1028==larry14)
local larry1030 =larry1028["Parent"]
local larry1031 =(larry1030==larry996)
local larry1032 =larry1028["Parent"]
local larry1033 =(larry1032==larry14)
local larry1034 =larry1032["Parent"]
local larry1035 =(larry1034==larry996)
local larry1036 =larry1032["Parent"]
local larry1037 =(larry1036==larry14)
local larry1038 =larry1036["Parent"]
local larry1039 =(larry1038==larry996)
local larry1040 =larry1036["Parent"]
local larry1041 =(larry1040==larry14)
local larry1042 =larry1040["Parent"]
local larry1043 =(larry1042==larry996)
local larry1044 =larry1040["Parent"]
local larry1045 =(larry1044==larry14)
local larry1046 =larry1044["Parent"]
local larry1047 =(larry1046==larry996)
local larry1048 =larry1044["Parent"]
local larry1049 =(larry1048==larry14)
local larry1050 =larry1048["Parent"]
local larry1051 =(larry1050==larry996)
local larry1052 =larry1048["Parent"]
local larry1053 =(larry1052==larry14)
local larry1054 =larry1052["Parent"]
local larry1055 =(larry1054==larry996)
local larry1056 =larry1052["Parent"]
local larry1057 =(larry1056==larry14)
local larry1058 =larry1056["Parent"]
local larry1059 =(larry1058==larry996)
local larry1060 =larry1056["Parent"]
local larry1061 =(larry1060==larry14)
local larry1062 =larry1060["Parent"]
local larry1063 =(larry1062==larry996)
local larry1064 =larry1060["Parent"]
local larry1065 =(larry1064==larry14)
local larry1066 =larry1064["Parent"]
local larry1067 =(larry1066==larry996)
local larry1068 =larry1064["Parent"]
local larry1069 =(larry1068==larry14)
local larry1070 =larry1068["Parent"]
local larry1071 =(larry1070==larry996)
local larry1072 =larry1068["Parent"]
local larry1073 =(larry1072==larry14)
local larry1074 =larry1072["Parent"]
local larry1075 =(larry1074==larry996)
local larry1076 =larry1072["Parent"]
local larry1077 =(larry1076==larry14)
local larry1078 =larry1076["Parent"]
local larry1079 =(larry1078==larry996)
local larry1080 =larry1076["Parent"]
local larry1081 =(larry1080==larry14)
local larry1082 =larry1080["Parent"]
local larry1083 =(larry1082==larry996)
local larry1084 =larry1080["Parent"]
local larry1085 =(larry1084==larry14)
local larry1086 =larry1084["Parent"]
local larry1087 =(larry1086==larry996)
local larry1088 =larry1084["Parent"]
local larry1089 =(larry1088==larry14)
local larry1090 =larry1088["Parent"]
local larry1091 =(larry1090==larry996)
local larry1092 =larry1088["Parent"]
local larry1093 =(larry1092==larry14)
local larry1094 =larry1092["Parent"]
local larry1095 =(larry1094==larry996)
local larry1096 =larry1092["Parent"]
local larry1097 =(larry1096==larry14)
local larry1098 =larry1096["Parent"]
local larry1099 =(larry1098==larry996)
local larry1100 =larry1096["Parent"]
local larry1101 =(larry1100==larry14)
local larry1102 =larry1100["Parent"]
local larry1103 =(larry1102==larry996)
local larry1104 =larry1100["Parent"]
local larry1105 =(larry1104==larry14)
local larry1106 =larry1104["Parent"]
local larry1107 =(larry1106==larry996)
local larry1108 =larry1104["Parent"]
local larry1109 =(larry1108==larry14)
local larry1110 =larry1108["Parent"]
local larry1111 =(larry1110==larry996)
local larry1112 =larry1108["Parent"]
local larry1113 =(larry1112==larry14)
local larry1114 =larry1112["Parent"]
local larry1115 =(larry1114==larry996)
local larry1116 =larry1112["Parent"]
local larry1117 =(larry1116==larry14)
local larry1118 =larry1116["Parent"]
local larry1119 =(larry1118==larry996)
local larry1120 =larry1116["Parent"]
local larry1121 =(larry1120==larry14)
local larry1122 =larry1120["Parent"]
local larry1123 =(larry1122==larry996)
local larry1124 =larry1120["Parent"]
local larry1125 =(larry1124==larry14)
local larry1126 =larry1124["Parent"]
local larry1127 =(larry1126==larry996)
local larry1128 =larry1124["Parent"]
local larry1129 =(larry1128==larry14)
local larry1130 =larry1128["Parent"]
local larry1131 =(larry1130==larry996)
local larry1132 =larry1128["Parent"]
local larry1133 =(larry1132==larry14)
local larry1134 =larry1132["Parent"]
local larry1135 =(larry1134==larry996)
local larry1136 =larry1132["Parent"]
local larry1137 =(larry1136==larry14)
local larry1138 =larry1136["Parent"]
local larry1139 =(larry1138==larry996)
local larry1140 =larry1136["Parent"]
local larry1141 =(larry1140==larry14)
local larry1142 =larry1140["Parent"]
local larry1143 =(larry1142==larry996)
local larry1144 =larry1140["Parent"]
local larry1145 =(larry1144==larry14)
local larry1146 =larry1144["Parent"]
local larry1147 =(larry1146==larry996)
local larry1148 =larry1144["Parent"]
local larry1149 =(larry1148==larry14)
local larry1150 =larry1148["Parent"]
local larry1151 =(larry1150==larry996)
local larry1152 =larry1148["Parent"]
local larry1153 =(larry1152==larry14)
local larry1154 =larry1152["Parent"]
local larry1155 =(larry1154==larry996)
local larry1156 =larry1152["Parent"]
local larry1157 =(larry1156==larry14)
local larry1158 =larry1156["Parent"]
local larry1159 =(larry1158==larry996)
local larry1160 =larry1156["Parent"]
local larry1161 =(larry1160==larry14)
local larry1162 =larry1160["Parent"]
local larry1163 =(larry1162==larry996)
local larry1164 =larry1160["Parent"]
local larry1165 =(larry1164==larry14)
local larry1166 =larry1164["Parent"]
local larry1167 =(larry1166==larry996)
local larry1168 =larry1164["Parent"]
local larry1169 =(larry1168==larry14)
local larry1170 =larry1168["Parent"]
local larry1171 =(larry1170==larry996)
local larry1172 =larry1168["Parent"]
local larry1173 =(larry1172==larry14)
local larry1174 =larry1172["Parent"]
local larry1175 =(larry1174==larry996)
local larry1176 =larry1172["Parent"]
local larry1177 =(larry1176==larry14)
local larry1178 =larry1176["Parent"]
local larry1179 =(larry1178==larry996)
local larry1180 =larry1176["Parent"]
local larry1181 =(larry1180==larry14)
local larry1182 =larry1180["Parent"]
local larry1183 =(larry1182==larry996)
local larry1184 =larry1180["Parent"]
local larry1185 =(larry1184==larry14)
local larry1186 =larry1184["Parent"]
local larry1187 =(larry1186==larry996)
local larry1188 =larry1184["Parent"]
local larry1189 =(larry1188==larry14)
local larry1190 =larry1188["Parent"]
local larry1191 =(larry1190==larry996)
local larry1192 =larry1188["Parent"]
local larry1193 =(larry1192==larry14)
local larry1194 =larry1192["Parent"]
local larry1195 =(larry1194==larry996)
local larry1196 =larry1192["Parent"]
local larry1197 =(larry1196==larry14)
local larry1198 =larry1196["Parent"]
local larry1199 =(larry1198==larry996)
local larry1200 =larry1196["Parent"]
local larry1201 =(larry1200==larry14)
local larry1202 =larry1200["Parent"]
local larry1203 =(larry1202==larry996)
local larry1204 =larry1200["Parent"]
local larry1205 =(larry1204==larry14)
local larry1206 =larry1204["Parent"]
local larry1207 =(larry1206==larry996)
local larry1208 =larry1204["Parent"]
local larry1209 =(larry1208==larry14)
local larry1210 =larry1208["Parent"]
local larry1211 =(larry1210==larry996)
local larry1212 =larry1208["Parent"]
local larry1213 =(larry1212==larry14)
local larry1214 =larry1212["Parent"]
local larry1215 =(larry1214==larry996)
local larry1216 =larry1212["Parent"]
local larry1217 =(larry1216==larry14)
local larry1218 =larry1216["Parent"]
local larry1219 =(larry1218==larry996)
local larry1220 =larry1216["Parent"]
local larry1221 =(larry1220==larry14)
local larry1222 =larry1220["Parent"]
local larry1223 =(larry1222==larry996)
local larry1224 =larry1220["Parent"]
local larry1225 =(larry1224==larry14)
local larry1226 =larry1224["Parent"]
local larry1227 =(larry1226==larry996)
local larry1228 =larry1224["Parent"]
local larry1229 =(larry1228==larry14)
local larry1230 =larry1228["Parent"]
local larry1231 =(larry1230==larry996)
local larry1232 =larry1228["Parent"]
local larry1233 =(larry1232==larry14)
local larry1234 =larry1232["Parent"]
local larry1235 =(larry1234==larry996)
local larry1236 =larry1232["Parent"]
local larry1237 =(larry1236==larry14)
local larry1238 =larry1236["Parent"]
local larry1239 =(larry1238==larry996)
local larry1240 =larry1236["Parent"]
local larry1241 =(larry1240==larry14)
local larry1242 =larry1240["Parent"]
local larry1243 =(larry1242==larry996)
local larry1244 =larry1240["Parent"]
local larry1245 =(larry1244==larry14)
local larry1246 =larry1244["Parent"]
local larry1247 =(larry1246==larry996)
local larry1248 =larry1244["Parent"]
local larry1249 =(larry1248==larry14)
local larry1250 =larry1248["Parent"]
local larry1251 =(larry1250==larry996)
local larry1252 =larry1248["Parent"]
local larry1253 =(larry1252==larry14)
local larry1254 =larry1252["Parent"]
local larry1255 =(larry1254==larry996)
local larry1256 =larry1252["Parent"]
local larry1257 =(larry1256==larry14)
local larry1258 =larry1256["Parent"]
local larry1259 =(larry1258==larry996)
local larry1260 =larry1256["Parent"]
local larry1261 =(larry1260==larry14)
local larry1262 =larry1260["Parent"]
local larry1263 =(larry1262==larry996)
local larry1264 =larry1260["Parent"]
local larry1265 =(larry1264==larry14)
local larry1266 =larry1264["Parent"]
local larry1267 =(larry1266==larry996)
local larry1268 =larry1264["Parent"]
local larry1269 =(larry1268==larry14)
local larry1270 =larry1268["Parent"]
local larry1271 =(larry1270==larry996)
local larry1272 =larry1268["Parent"]
local larry1273 =(larry1272==larry14)
local larry1274 =larry1272["Parent"]
local larry1275 =(larry1274==larry996)
local larry1276 =larry1272["Parent"]
local larry1277 =(larry1276==larry14)
local larry1278 =larry1276["Parent"]
local larry1279 =(larry1278==larry996)
local larry1280 =larry1276["Parent"]
local larry1281 =(larry1280==larry14)
local larry1282 =larry1280["Parent"]
local larry1283 =(larry1282==larry996)
local larry1284 =larry1280["Parent"]
local larry1285 =(larry1284==larry14)
local larry1286 =larry1284["Parent"]
local larry1287 =(larry1286==larry996)
local larry1288 =larry1284["Parent"]
local larry1289 =(larry1288==larry14)
local larry1290 =larry1288["Parent"]
local larry1291 =(larry1290==larry996)
local larry1292 =larry1288["Parent"]
local larry1293 =(larry1292==larry14)
local larry1294 =larry1292["Parent"]
local larry1295 =(larry1294==larry996)
local larry1296 =larry1292["Parent"]
local larry1297 =(larry1296==larry14)
local larry1298 =larry1296["Parent"]
local larry1299 =(larry1298==larry996)
local larry1300 =larry1296["Parent"]
local larry1301 =(larry1300==larry14)
local larry1302 =larry1300["Parent"]
local larry1303 =(larry1302==larry996)
local larry1304 =larry1300["Parent"]
local larry1305 =(larry1304==larry14)
local larry1306 =larry1304["Parent"]
local larry1307 =(larry1306==larry996)
local larry1308 =larry1304["Parent"]
local larry1309 =(larry1308==larry14)
local larry1310 =larry1308["Parent"]
local larry1311 =(larry1310==larry996)
local larry1312 =larry1308["Parent"]
local larry1313 =(larry1312==larry14)
local larry1314 =larry1312["Parent"]
local larry1315 =(larry1314==larry996)
local larry1316 =larry1312["Parent"]
local larry1317 =(larry1316==larry14)
local larry1318 =larry1316["Parent"]
local larry1319 =(larry1318==larry996)
local larry1320 =larry1316["Parent"]
local larry1321 =(larry1320==larry14)
local larry1322 =larry1320["Parent"]
local larry1323 =(larry1322==larry996)
local larry1324 =larry1320["Parent"]
local larry1325 =(larry1324==larry14)
local larry1326 =larry1324["Parent"]
local larry1327 =(larry1326==larry996)
local larry1328 =larry1324["Parent"]
local larry1329 =(larry1328==larry14)
local larry1330 =larry1328["Parent"]
local larry1331 =(larry1330==larry996)
local larry1332 =larry1328["Parent"]
local larry1333 =(larry1332==larry14)
local larry1334 =larry1332["Parent"]
local larry1335 =(larry1334==larry996)
local larry1336 =larry1332["Parent"]
local larry1337 =(larry1336==larry14)
local larry1338 =larry1336["Parent"]
local larry1339 =(larry1338==larry996)
local larry1340 =larry1336["Parent"]
local larry1341 =(larry1340==larry14)
local larry1342 =larry1340["Parent"]
local larry1343 =(larry1342==larry996)
local larry1344 =larry1340["Parent"]
local larry1345 =(larry1344==larry14)
local larry1346 =larry1344["Parent"]
local larry1347 =(larry1346==larry996)
local larry1348 =larry1344["Parent"]
local larry1349 =(larry1348==larry14)
local larry1350 =larry1348["Parent"]
local larry1351 =(larry1350==larry996)
local larry1352 =larry1348["Parent"]
local larry1353 =(larry1352==larry14)
local larry1354 =larry1352["Parent"]
local larry1355 =(larry1354==larry996)
local larry1356 =larry1352["Parent"]
local larry1357 =(larry1356==larry14)
local larry1358 =larry1356["Parent"]
local larry1359 =(larry1358==larry996)
local larry1360 =larry1356["Parent"]
local larry1361 =(larry1360==larry14)
local larry1362 =larry1360["Parent"]
local larry1363 =(larry1362==larry996)
local larry1364 =larry1360["Parent"]
local larry1365 =(larry1364==larry14)
local larry1366 =larry1364["Parent"]
local larry1367 =(larry1366==larry996)
local larry1368 =larry1364["Parent"]
local larry1369 =(larry1368==larry14)
local larry1370 =larry1368["Parent"]
local larry1371 =(larry1370==larry996)
local larry1372 =larry1368["Parent"]
local larry1373 =(larry1372==larry14)
local larry1374 =larry1372["Parent"]
local larry1375 =(larry1374==larry996)
local larry1376 =larry1372["Parent"]
local larry1377 =(larry1376==larry14)
local larry1378 =larry1376["Parent"]
local larry1379 =(larry1378==larry996)
local larry1380 =larry1376["Parent"]
local larry1381 =(larry1380==larry14)
local larry1382 =larry1380["Parent"]
local larry1383 =(larry1382==larry996)
local larry1384 =larry1380["Parent"]
local larry1385 =(larry1384==larry14)
local larry1386 =larry1384["Parent"]
local larry1387 =(larry1386==larry996)
local larry1388 =larry1384["Parent"]
local larry1389 =(larry1388==larry14)
local larry1390 =larry1388["Parent"]
local larry1391 =(larry1390==larry996)
local larry1392 =larry1388["Parent"]
local larry1393 =(larry1392==larry14)
local larry1394 =larry1392["Parent"]
local larry1395 =(larry1394==larry996)
local larry1396 =larry1392["Parent"]
local larry1397 =(larry1396==larry14)
local larry1398 =larry1396["Parent"]
local larry1399 =(larry1398==larry996)
local larry1400 =larry1396["Parent"]
local larry1401 =(larry1400==larry14)
local larry1402 =larry1400["Parent"]
local larry1403 =(larry1402==larry996)
local larry1404 =larry1400["Parent"]
local larry1405 =(larry1404==larry14)
local larry1406 =larry1404["Parent"]
local larry1407 =(larry1406==larry996)
local larry1408 =larry1404["Parent"]
local larry1409 =(larry1408==larry14)
local larry1410 =larry1408["Parent"]
local larry1411 =(larry1410==larry996)
local larry1412 =larry1408["Parent"]
local larry1413 =(larry1412==larry14)
local larry1414 =larry1412["Parent"]
local larry1415 =(larry1414==larry996)
local larry1416 =larry1412["Parent"]
local larry1417 =(larry1416==larry14)
local larry1418 =larry1416["Parent"]
local larry1419 =(larry1418==larry996)
local larry1420 =larry1416["Parent"]
local larry1421 =(larry1420==larry14)
local larry1422 =larry1420["Parent"]
local larry1423 =(larry1422==larry996)
local larry1424 =larry1420["Parent"]
local larry1425 =(larry1424==larry14)
local larry1426 =larry1424["Parent"]
local larry1427 =(larry1426==larry996)
local larry1428 =larry1424["Parent"]
local larry1429 =(larry1428==larry14)
local larry1430 =larry1428["Parent"]
local larry1431 =(larry1430==larry996)
local larry1432 =larry1428["Parent"]
local larry1433 =(larry1432==larry14)
local larry1434 =larry1432["Parent"]
local larry1435 =(larry1434==larry996)
local larry1436 =larry1432["Parent"]
local larry1437 =(larry1436==larry14)
local larry1438 =larry1436["Parent"]
local larry1439 =(larry1438==larry996)
local larry1440 =larry1436["Parent"]
local larry1441 =(larry1440==larry14)
local larry1442 =larry1440["Parent"]
local larry1443 =(larry1442==larry996)
local larry1444 =larry1440["Parent"]
local larry1445 =(larry1444==larry14)
local larry1446 =larry1444["Parent"]
local larry1447 =(larry1446==larry996)
local larry1448 =larry1444["Parent"]
local larry1449 =(larry1448==larry14)
local larry1450 =larry1448["Parent"]
local larry1451 =(larry1450==larry996)
local larry1452 =larry1448["Parent"]
local larry1453 =(larry1452==larry14)
local larry1454 =larry1452["Parent"]
local larry1455 =(larry1454==larry996)
local larry1456 =larry1452["Parent"]
local larry1457 =(larry1456==larry14)
local larry1458 =larry1456["Parent"]
local larry1459 =(larry1458==larry996)
local larry1460 =larry1456["Parent"]
local larry1461 =(larry1460==larry14)
local larry1462 =larry1460["Parent"]
local larry1463 =(larry1462==larry996)
local larry1464 =larry1460["Parent"]
local larry1465 =(larry1464==larry14)
local larry1466 =larry1464["Parent"]
local larry1467 =(larry1466==larry996)
local larry1468 =larry1464["Parent"]
local larry1469 =(larry1468==larry14)
local larry1470 =larry1468["Parent"]
local larry1471 =(larry1470==larry996)
local larry1472 =larry1468["Parent"]
local larry1473 =(larry1472==larry14)
local larry1474 =larry1472["Parent"]
local larry1475 =(larry1474==larry996)
local larry1476 =larry1472["Parent"]
local larry1477 =(larry1476==larry14)
local larry1478 =larry1476["Parent"]
local larry1479 =(larry1478==larry996)
local larry1480 =larry1476["Parent"]
local larry1481 =(larry1480==larry14)
local larry1482 =larry1480["Parent"]
local larry1483 =(larry1482==larry996)
local larry1484 =larry1480["Parent"]
local larry1485 =(larry1484==larry14)
local larry1486 =larry1484["Parent"]
local larry1487 =(larry1486==larry996)
local larry1488 =larry1484["Parent"]
local larry1489 =(larry1488==larry14)
local larry1490 =larry1488["Parent"]
local larry1491 =(larry1490==larry996)
local larry1492 =larry1488["Parent"]
local larry1493 =(larry1492==larry14)
local larry1494 =larry1492["Parent"]
local larry1495 =(larry1494==larry996)
local larry1496 =larry1492["Parent"]
local larry1497 =(larry1496==larry14)
local larry1498 =larry1496["Parent"]
local larry1499 =(larry1498==larry996)
local larry1500 =larry1496["Parent"]
local larry1501 =(larry1500==larry14)
local larry1502 =larry1500["Parent"]
local larry1503 =(larry1502==larry996)
local larry1504 =larry1500["Parent"]
local larry1505 =(larry1504==larry14)
local larry1506 =larry1504["Parent"]
local larry1507 =(larry1506==larry996)
local larry1508 =larry1504["Parent"]
local larry1509 =(larry1508==larry14)
local larry1510 =larry1508["Parent"]
local larry1511 =(larry1510==larry996)
local larry1512 =larry1508["Parent"]
local larry1513 =(larry1512==larry14)
local larry1514 =larry1512["Parent"]
local larry1515 =(larry1514==larry996)
local larry1516 =larry1512["Parent"]
local larry1517 =(larry1516==larry14)
local larry1518 =larry1516["Parent"]
local larry1519 =(larry1518==larry996)
local larry1520 =larry1516["Parent"]
local larry1521 =(larry1520==larry14)
local larry1522 =larry1520["Parent"]
local larry1523 =(larry1522==larry996)
local larry1524 =larry1520["Parent"]
local larry1525 =(larry1524==larry14)
local larry1526 =larry1524["Parent"]
local larry1527 =(larry1526==larry996)
local larry1528 =larry1524["Parent"]
local larry1529 =(larry1528==larry14)
local larry1530 =larry1528["Parent"]
local larry1531 =(larry1530==larry996)
local larry1532 =larry1528["Parent"]
local larry1533 =(larry1532==larry14)
local larry1534 =larry1532["Parent"]
local larry1535 =(larry1534==larry996)
local larry1536 =larry1532["Parent"]
local larry1537 =(larry1536==larry14)
local larry1538 =larry1536["Parent"]
local larry1539 =(larry1538==larry996)
local larry1540 =larry1536["Parent"]
local larry1541 =(larry1540==larry14)
local larry1542 =larry1540["Parent"]
local larry1543 =(larry1542==larry996)
local larry1544 =larry1540["Parent"]
local larry1545 =(larry1544==larry14)
local larry1546 =larry1544["Parent"]
local larry1547 =(larry1546==larry996)
local larry1548 =larry1544["Parent"]
local larry1549 =(larry1548==larry14)
local larry1550 =larry1548["Parent"]
local larry1551 =(larry1550==larry996)
local larry1552 =larry1548["Parent"]
local larry1553 =(larry1552==larry14)
local larry1554 =larry1552["Parent"]
local larry1555 =(larry1554==larry996)
local larry1556 =larry1552["Parent"]
local larry1557 =(larry1556==larry14)
local larry1558 =larry1556["Parent"]
local larry1559 =(larry1558==larry996)
local larry1560 =larry1556["Parent"]
local larry1561 =(larry1560==larry14)
local larry1562 =larry1560["Parent"]
local larry1563 =(larry1562==larry996)
local larry1564 =larry1560["Parent"]
local larry1565 =(larry1564==larry14)
local larry1566 =larry1564["Parent"]
local larry1567 =(larry1566==larry996)
local larry1568 =larry1564["Parent"]
local larry1569 =(larry1568==larry14)
local larry1570 =larry1568["Parent"]
local larry1571 =(larry1570==larry996)
local larry1572 =larry1568["Parent"]
local larry1573 =(larry1572==larry14)
local larry1574 =larry1572["Parent"]
local larry1575 =(larry1574==larry996)
local larry1576 =larry1572["Parent"]
local larry1577 =(larry1576==larry14)
local larry1578 =larry1576["Parent"]
local larry1579 =(larry1578==larry996)
local larry1580 =larry1576["Parent"]
local larry1581 =(larry1580==larry14)
local larry1582 =larry1580["Parent"]
local larry1583 =(larry1582==larry996)
local larry1584 =larry1580["Parent"]
local larry1585 =(larry1584==larry14)
local larry1586 =larry1584["Parent"]
local larry1587 =(larry1586==larry996)
local larry1588 =larry1584["Parent"]
local larry1589 =(larry1588==larry14)
local larry1590 =larry1588["Parent"]
local larry1591 =(larry1590==larry996)
local larry1592 =larry1588["Parent"]
local larry1593 =(larry1592==larry14)
local larry1594 =larry1592["Parent"]
local larry1595 =(larry1594==larry996)
local larry1596 =larry1592["Parent"]
local larry1597 =(larry1596==larry14)
local larry1598 =larry1596["Parent"]
local larry1599 =(larry1598==larry996)
local larry1600 =larry1596["Parent"]
local larry1601 =(larry1600==larry14)
local larry1602 =larry1600["Parent"]
local larry1603 =(larry1602==larry996)
local larry1604 =larry1600["Parent"]
local larry1605 =(larry1604==larry14)
local larry1606 =larry1604["Parent"]
local larry1607 =(larry1606==larry996)
local larry1608 =larry1604["Parent"]
local larry1609 =(larry1608==larry14)
local larry1610 =larry1608["Parent"]
local larry1611 =(larry1610==larry996)
local larry1612 =larry1608["Parent"]
local larry1613 =(larry1612==larry14)
local larry1614 =larry1612["Parent"]
local larry1615 =(larry1614==larry996)
local larry1616 =larry1612["Parent"]
local larry1617 =(larry1616==larry14)
local larry1618 =larry1616["Parent"]
local larry1619 =(larry1618==larry996)
local larry1620 =larry1616["Parent"]
local larry1621 =(larry1620==larry14)
local larry1622 =larry1620["Parent"]
local larry1623 =(larry1622==larry996)
local larry1624 =larry1620["Parent"]
local larry1625 =(larry1624==larry14)
local larry1626 =larry1624["Parent"]
local larry1627 =(larry1626==larry996)
local larry1628 =larry1624["Parent"]
local larry1629 =(larry1628==larry14)
local larry1630 =larry1628["Parent"]
local larry1631 =(larry1630==larry996)
local larry1632 =larry1628["Parent"]
local larry1633 =(larry1632==larry14)
local larry1634 =larry1632["Parent"]
local larry1635 =(larry1634==larry996)
local larry1636 =larry1632["Parent"]
local larry1637 =(larry1636==larry14)
local larry1638 =larry1636["Parent"]
local larry1639 =(larry1638==larry996)
local larry1640 =larry1636["Parent"]
local larry1641 =(larry1640==larry14)
local larry1642 =larry1640["Parent"]
local larry1643 =(larry1642==larry996)
local larry1644 =larry1640["Parent"]
local larry1645 =(larry1644==larry14)
local larry1646 =larry1644["Parent"]
local larry1647 =(larry1646==larry996)
local larry1648 =larry1644["Parent"]
local larry1649 =(larry1648==larry14)
local larry1650 =larry1648["Parent"]
local larry1651 =(larry1650==larry996)
local larry1652 =larry1648["Parent"]
local larry1653 =(larry1652==larry14)
local larry1654 =larry1652["Parent"]
local larry1655 =(larry1654==larry996)
local larry1656 =larry1652["Parent"]
local larry1657 =(larry1656==larry14)
local larry1658 =larry1656["Parent"]
local larry1659 =(larry1658==larry996)
local larry1660 =larry1656["Parent"]
local larry1661 =(larry1660==larry14)
local larry1662 =larry1660["Parent"]
local larry1663 =(larry1662==larry996)
local larry1664 =larry1660["Parent"]
local larry1665 =(larry1664==larry14)
local larry1666 =larry1664["Parent"]
local larry1667 =(larry1666==larry996)
local larry1668 =larry1664["Parent"]
local larry1669 =(larry1668==larry14)
local larry1670 =larry1668["Parent"]
local larry1671 =(larry1670==larry996)
local larry1672 =larry1668["Parent"]
local larry1673 =(larry1672==larry14)
local larry1674 =larry1672["Parent"]
local larry1675 =(larry1674==larry996)
local larry1676 =larry1672["Parent"]
local larry1677 =(larry1676==larry14)
local larry1678 =larry1676["Parent"]
local larry1679 =(larry1678==larry996)
local larry1680 =larry1676["Parent"]
local larry1681 =(larry1680==larry14)
local larry1682 =larry1680["Parent"]
local larry1683 =(larry1682==larry996)
local larry1684 =larry1680["Parent"]
local larry1685 =(larry1684==larry14)
local larry1686 =larry1684["Parent"]
local larry1687 =(larry1686==larry996)
local larry1688 =larry1684["Parent"]
local larry1689 =(larry1688==larry14)
local larry1690 =larry1688["Parent"]
local larry1691 =(larry1690==larry996)
local larry1692 =larry1688["Parent"]
local larry1693 =(larry1692==larry14)
local larry1694 =larry1692["Parent"]
local larry1695 =(larry1694==larry996)
local larry1696 =larry1692["Parent"]
local larry1697 =(larry1696==larry14)
local larry1698 =larry1696["Parent"]
local larry1699 =(larry1698==larry996)
local larry1700 =larry1696["Parent"]
local larry1701 =(larry1700==larry14)
local larry1702 =larry1700["Parent"]
local larry1703 =(larry1702==larry996)
local larry1704 =larry1700["Parent"]
local larry1705 =(larry1704==larry14)
local larry1706 =larry1704["Parent"]
local larry1707 =(larry1706==larry996)
local larry1708 =larry1704["Parent"]
local larry1709 =(larry1708==larry14)
local larry1710 =larry1708["Parent"]
local larry1711 =(larry1710==larry996)
local larry1712 =larry1708["Parent"]
local larry1713 =(larry1712==larry14)
local larry1714 =larry1712["Parent"]
local larry1715 =(larry1714==larry996)
local larry1716 =larry1712["Parent"]
local larry1717 =(larry1716==larry14)
local larry1718 =larry1716["Parent"]
local larry1719 =(larry1718==larry996)
local larry1720 =larry1716["Parent"]
local larry1721 =(larry1720==larry14)
local larry1722 =larry1720["Parent"]
local larry1723 =(larry1722==larry996)
local larry1724 =larry1720["Parent"]
local larry1725 =(larry1724==larry14)
local larry1726 =larry1724["Parent"]
local larry1727 =(larry1726==larry996)
local larry1728 =larry1724["Parent"]
local larry1729 =(larry1728==larry14)
local larry1730 =larry1728["Parent"]
local larry1731 =(larry1730==larry996)
local larry1732 =larry1728["Parent"]
local larry1733 =(larry1732==larry14)
local larry1734 =larry1732["Parent"]
local larry1735 =(larry1734==larry996)
local larry1736 =larry1732["Parent"]
local larry1737 =(larry1736==larry14)
local larry1738 =larry1736["Parent"]
local larry1739 =(larry1738==larry996)
local larry1740 =larry1736["Parent"]
local larry1741 =(larry1740==larry14)
local larry1742 =larry1740["Parent"]
local larry1743 =(larry1742==larry996)
local larry1744 =larry1740["Parent"]
local larry1745 =(larry1744==larry14)
local larry1746 =larry1744["Parent"]
local larry1747 =(larry1746==larry996)
local larry1748 =larry1744["Parent"]
local larry1749 =(larry1748==larry14)
local larry1750 =larry1748["Parent"]
local larry1751 =(larry1750==larry996)
local larry1752 =larry1748["Parent"]
local larry1753 =(larry1752==larry14)
local larry1754 =larry1752["Parent"]
local larry1755 =(larry1754==larry996)
local larry1756 =larry1752["Parent"]
local larry1757 =(larry1756==larry14)
local larry1758 =larry1756["Parent"]
local larry1759 =(larry1758==larry996)
local larry1760 =larry1756["Parent"]
local larry1761 =(larry1760==larry14)
local larry1762 =larry1760["Parent"]
local larry1763 =(larry1762==larry996)
local larry1764 =larry1760["Parent"]
local larry1765 =(larry1764==larry14)
local larry1766 =larry1764["Parent"]
local larry1767 =(larry1766==larry996)
local larry1768 =larry1764["Parent"]
local larry1769 =(larry1768==larry14)
local larry1770 =larry1768["Parent"]
local larry1771 =(larry1770==larry996)
local larry1772 =larry1768["Parent"]
local larry1773 =(larry1772==larry14)
local larry1774 =larry1772["Parent"]
local larry1775 =(larry1774==larry996)
local larry1776 =larry1772["Parent"]
local larry1777 =(larry1776==larry14)
local larry1778 =larry1776["Parent"]
local larry1779 =(larry1778==larry996)
local larry1780 =larry1776["Parent"]
local larry1781 =(larry1780==larry14)
local larry1782 =larry1780["Parent"]
local larry1783 =(larry1782==larry996)
local larry1784 =larry1780["Parent"]
local larry1785 =(larry1784==larry14)
local larry1786 =larry1784["Parent"]
local larry1787 =(larry1786==larry996)
local larry1788 =larry1784["Parent"]
local larry1789 =(larry1788==larry14)
local larry1790 =larry1788["Parent"]
local larry1791 =(larry1790==larry996)
local larry1792 =larry1788["Parent"]
local larry1793 =(larry1792==larry14)
local larry1794 =larry1792["Parent"]
local larry1795 =(larry1794==larry996)
local larry1796 =larry1792["Parent"]
local larry1797 =(larry1796==larry14)
local larry1798 =larry1796["Parent"]
local larry1799 =(larry1798==larry996)
local larry1800 =larry1796["Parent"]
local larry1801 =(larry1800==larry14)
local larry1802 =larry1800["Parent"]
local larry1803 =(larry1802==larry996)
local larry1804 =larry1800["Parent"]
local larry1805 =(larry1804==larry14)
local larry1806 =larry1804["Parent"]
local larry1807 =(larry1806==larry996)
local larry1808 =larry1804["Parent"]
local larry1809 =(larry1808==larry14)
local larry1810 =larry1808["Parent"]
local larry1811 =(larry1810==larry996)
local larry1812 =larry1808["Parent"]
local larry1813 =(larry1812==larry14)
local larry1814 =larry1812["Parent"]
local larry1815 =(larry1814==larry996)
local larry1816 =larry1812["Parent"]
local larry1817 =(larry1816==larry14)
local larry1818 =larry1816["Parent"]
local larry1819 =(larry1818==larry996)
local larry1820 =larry1816["Parent"]
local larry1821 =(larry1820==larry14)
local larry1822 =larry1820["Parent"]
local larry1823 =(larry1822==larry996)
local larry1824 =larry1820["Parent"]
local larry1825 =(larry1824==larry14)
local larry1826 =larry1824["Parent"]
local larry1827 =(larry1826==larry996)
local larry1828 =larry1824["Parent"]
local larry1829 =(larry1828==larry14)
local larry1830 =larry1828["Parent"]
local larry1831 =(larry1830==larry996)
local larry1832 =larry1828["Parent"]
local larry1833 =(larry1832==larry14)
local larry1834 =larry1832["Parent"]
local larry1835 =(larry1834==larry996)
local larry1836 =larry1832["Parent"]
local larry1837 =(larry1836==larry14)
local larry1838 =larry1836["Parent"]
local larry1839 =(larry1838==larry996)
local larry1840 =larry1836["Parent"]
local larry1841 =(larry1840==larry14)
local larry1842 =larry1840["Parent"]
local larry1843 =(larry1842==larry996)
local larry1844 =larry1840["Parent"]
local larry1845 =(larry1844==larry14)
local larry1846 =larry1844["Parent"]
local larry1847 =(larry1846==larry996)
local larry1848 =larry1844["Parent"]
local larry1849 =(larry1848==larry14)
local larry1850 =larry1848["Parent"]
local larry1851 =(larry1850==larry996)
local larry1852 =larry1848["Parent"]
local larry1853 =(larry1852==larry14)
local larry1854 =larry1852["Parent"]
local larry1855 =(larry1854==larry996)
local larry1856 =larry1852["Parent"]
local larry1857 =(larry1856==larry14)
local larry1858 =larry1856["Parent"]
local larry1859 =(larry1858==larry996)
local larry1860 =larry1856["Parent"]
local larry1861 =(larry1860==larry14)
local larry1862 =larry1860["Parent"]
local larry1863 =(larry1862==larry996)
local larry1864 =larry1860["Parent"]
local larry1865 =(larry1864==larry14)
local larry1866 =larry1864["Parent"]
local larry1867 =(larry1866==larry996)
local larry1868 =larry1864["Parent"]
local larry1869 =(larry1868==larry14)
local larry1870 =larry1868["Parent"]
local larry1871 =(larry1870==larry996)
local larry1872 =larry1868["Parent"]
local larry1873 =(larry1872==larry14)
local larry1874 =larry1872["Parent"]
local larry1875 =(larry1874==larry996)
local larry1876 =larry1872["Parent"]
local larry1877 =(larry1876==larry14)
local larry1878 =larry1876["Parent"]
local larry1879 =(larry1878==larry996)
local larry1880 =larry1876["Parent"]
local larry1881 =(larry1880==larry14)
local larry1882 =larry1880["Parent"]
local larry1883 =(larry1882==larry996)
local larry1884 =larry1880["Parent"]
local larry1885 =(larry1884==larry14)
local larry1886 =larry1884["Parent"]
local larry1887 =(larry1886==larry996)
local larry1888 =larry1884["Parent"]
local larry1889 =(larry1888==larry14)
local larry1890 =larry1888["Parent"]
local larry1891 =(larry1890==larry996)
local larry1892 =larry1888["Parent"]
local larry1893 =(larry1892==larry14)
local larry1894 =larry1892["Parent"]
local larry1895 =(larry1894==larry996)
local larry1896 =larry1892["Parent"]
local larry1897 =(larry1896==larry14)
local larry1898 =larry1896["Parent"]
local larry1899 =(larry1898==larry996)
local larry1900 =larry1896["Parent"]
local larry1901 =(larry1900==larry14)
local larry1902 =larry1900["Parent"]
local larry1903 =(larry1902==larry996)
local larry1904 =larry1900["Parent"]
local larry1905 =(larry1904==larry14)
local larry1906 =larry1904["Parent"]
local larry1907 =(larry1906==larry996)
local larry1908 =larry1904["Parent"]
local larry1909 =(larry1908==larry14)
local larry1910 =larry1908["Parent"]
local larry1911 =(larry1910==larry996)
local larry1912 =larry1908["Parent"]
local larry1913 =(larry1912==larry14)
local larry1914 =larry1912["Parent"]
local larry1915 =(larry1914==larry996)
local larry1916 =larry1912["Parent"]
local larry1917 =(larry1916==larry14)
local larry1918 =larry1916["Parent"]
local larry1919 =(larry1918==larry996)
local larry1920 =larry1916["Parent"]
local larry1921 =(larry1920==larry14)
local larry1922 =larry1920["Parent"]
local larry1923 =(larry1922==larry996)
local larry1924 =larry1920["Parent"]
local larry1925 =(larry1924==larry14)
local larry1926 =larry1924["Parent"]
local larry1927 =(larry1926==larry996)
local larry1928 =larry1924["Parent"]
local larry1929 =(larry1928==larry14)
local larry1930 =larry1928["Parent"]
local larry1931 =(larry1930==larry996)
local larry1932 =larry1928["Parent"]
local larry1933 =(larry1932==larry14)
local larry1934 =larry1932["Parent"]
local larry1935 =(larry1934==larry996)
local larry1936 =larry1932["Parent"]
local larry1937 =(larry1936==larry14)
local larry1938 =larry1936["Parent"]
local larry1939 =(larry1938==larry996)
local larry1940 =larry1936["Parent"]
local larry1941 =(larry1940==larry14)
local larry1942 =larry1940["Parent"]
local larry1943 =(larry1942==larry996)
local larry1944 =larry1940["Parent"]
local larry1945 =(larry1944==larry14)
local larry1946 =larry1944["Parent"]
local larry1947 =(larry1946==larry996)
local larry1948 =larry1944["Parent"]
local larry1949 =(larry1948==larry14)
local larry1950 =larry1948["Parent"]
local larry1951 =(larry1950==larry996)
local larry1952 =larry1948["Parent"]
local larry1953 =(larry1952==larry14)
local larry1954 =larry1952["Parent"]
local larry1955 =(larry1954==larry996)
local larry1956 =larry1952["Parent"]
local larry1957 =(larry1956==larry14)
local larry1958 =larry1956["Parent"]
local larry1959 =(larry1958==larry996)
local larry1960 =larry1956["Parent"]
local larry1961 =(larry1960==larry14)
local larry1962 =larry1960["Parent"]
local larry1963 =(larry1962==larry996)
local larry1964 =larry1960["Parent"]
local larry1965 =(larry1964==larry14)
local larry1966 =larry1964["Parent"]
local larry1967 =(larry1966==larry996)
local larry1968 =larry1964["Parent"]
local larry1969 =(larry1968==larry14)
local larry1970 =larry1968["Parent"]
local larry1971 =(larry1970==larry996)
local larry1972 =larry1968["Parent"]
local larry1973 =(larry1972==larry14)
local larry1974 =larry1972["Parent"]
local larry1975 =(larry1974==larry996)
local larry1976 =larry1972["Parent"]
local larry1977 =(larry1976==larry14)
local larry1978 =larry1976["Parent"]
local larry1979 =(larry1978==larry996)
local larry1980 =larry1976["Parent"]
local larry1981 =(larry1980==larry14)
local larry1982 =larry1980["Parent"]
local larry1983 =(larry1982==larry996)
local larry1984 =larry1980["Parent"]
local larry1985 =(larry1984==larry14)
local larry1986 =larry1984["Parent"]
local larry1987 =(larry1986==larry996)
local larry1988 =larry1984["Parent"]
local larry1989 =(larry1988==larry14)
local larry1990 =larry1988["Parent"]
local larry1991 =(larry1990==larry996)
local larry1992 =larry1988["Parent"]
local larry1993 =(larry1992==larry14)
local larry1994 =larry1992["Parent"]
local larry1995 =(larry1994==larry996)
local larry1996 =larry1992["Parent"]
local larry1997 =(larry1996==larry14)
local larry1998 =larry1996["Parent"]
local larry1999 =(larry1998==larry996)
local larry2000 =larry1996["Parent"]
local larry2001 =(larry2000==larry14)
local larry2002 =larry2000["Parent"]
local larry2003 =(larry2002==larry996)
local larry2004 =larry2000["Parent"]
local larry2005 =(larry2004==larry14)
local larry2006 =larry2004["Parent"]
local larry2007 =(larry2006==larry996)
local larry2008 =larry2004["Parent"]
local larry2009 =(larry2008==larry14)
local larry2010 =larry2008["Parent"]
local larry2011 =(larry2010==larry996)
local larry2012 =larry2008["Parent"]
local larry2013 =(larry2012==larry14)
local larry2014 =larry2012["Parent"]
local larry2015 =(larry2014==larry996)
local larry2016 =larry2012["Parent"]
local larry2017 =(larry2016==larry14)
local larry2018 =larry2016["Parent"]
local larry2019 =(larry2018==larry996)
local larry2020 =larry2016["Parent"]
local larry2021 =(larry2020==larry14)
local larry2022 =larry2020["Parent"]
local larry2023 =(larry2022==larry996)
local larry2024 =larry2020["Parent"]
local larry2025 =(larry2024==larry14)
local larry2026 =larry2024["Parent"]
local larry2027 =(larry2026==larry996)
local larry2028 =larry2024["Parent"]
local larry2029 =(larry2028==larry14)
local larry2030 =larry2028["Parent"]
local larry2031 =(larry2030==larry996)
local larry2032 =larry2028["Parent"]
local larry2033 =(larry2032==larry14)
local larry2034 =larry2032["Parent"]
local larry2035 =(larry2034==larry996)
local larry2036 =larry2032["Parent"]
local larry2037 =(larry2036==larry14)
local larry2038 =larry2036["Parent"]
local larry2039 =(larry2038==larry996)
local larry2040 =larry2036["Parent"]
local larry2041 =(larry2040==larry14)
local larry2042 =larry2040["Parent"]
local larry2043 =(larry2042==larry996)
local larry2044 =larry2040["Parent"]
local larry2045 =(larry2044==larry14)
local larry2046 =larry2044["Parent"]
local larry2047 =(larry2046==larry996)
local larry2048 =larry2044["Parent"]
local larry2049 =(larry2048==larry14)
local larry2050 =larry2048["Parent"]
local larry2051 =(larry2050==larry996)
local larry2052 =larry2048["Parent"]
local larry2053 =(larry2052==larry14)
local larry2054 =larry2052["Parent"]
local larry2055 =(larry2054==larry996)
local larry2056 =larry2052["Parent"]
local larry2057 =(larry2056==larry14)
local larry2058 =larry2056["Parent"]
local larry2059 =(larry2058==larry996)
local larry2060 =larry2056["Parent"]
local larry2061 =(larry2060==larry14)
local larry2062 =larry2060["Parent"]
local larry2063 =(larry2062==larry996)
local larry2064 =larry2060["Parent"]
local larry2065 =(larry2064==larry14)
local larry2066 =larry2064["Parent"]
local larry2067 =(larry2066==larry996)
local larry2068 =larry2064["Parent"]
local larry2069 =(larry2068==larry14)
local larry2070 =larry2068["Parent"]
local larry2071 =(larry2070==larry996)
local larry2072 =larry2068["Parent"]
local larry2073 =(larry2072==larry14)
local larry2074 =larry2072["Parent"]
local larry2075 =(larry2074==larry996)
local larry2076 =larry2072["Parent"]
local larry2077 =(larry2076==larry14)
local larry2078 =larry2076["Parent"]
local larry2079 =(larry2078==larry996)
local larry2080 =larry2076["Parent"]
local larry2081 =(larry2080==larry14)
local larry2082 =larry2080["Parent"]
local larry2083 =(larry2082==larry996)
local larry2084 =larry2080["Parent"]
local larry2085 =(larry2084==larry14)
local larry2086 =larry2084["Parent"]
local larry2087 =(larry2086==larry996)
local larry2088 =larry2084["Parent"]
local larry2089 =(larry2088==larry14)
local larry2090 =larry2088["Parent"]
local larry2091 =(larry2090==larry996)
local larry2092 =larry2088["Parent"]
local larry2093 =(larry2092==larry14)
local larry2094 =larry2092["Parent"]
local larry2095 =(larry2094==larry996)
local larry2096 =larry2092["Parent"]
local larry2097 =(larry2096==larry14)
local larry2098 =larry2096["Parent"]
local larry2099 =(larry2098==larry996)
local larry2100 =larry2096["Parent"]
local larry2101 =(larry2100==larry14)
local larry2102 =larry2100["Parent"]
local larry2103 =(larry2102==larry996)
local larry2104 =larry2100["Parent"]
local larry2105 =(larry2104==larry14)
local larry2106 =larry2104["Parent"]
local larry2107 =(larry2106==larry996)
local larry2108 =larry2104["Parent"]
local larry2109 =(larry2108==larry14)
local larry2110 =larry2108["Parent"]
local larry2111 =(larry2110==larry996)
local larry2112 =larry2108["Parent"]
local larry2113 =(larry2112==larry14)
local larry2114 =larry2112["Parent"]
local larry2115 =(larry2114==larry996)
local larry2116 =larry2112["Parent"]
local larry2117 =(larry2116==larry14)
local larry2118 =larry2116["Parent"]
local larry2119 =(larry2118==larry996)
local larry2120 =larry2116["Parent"]
local larry2121 =(larry2120==larry14)
local larry2122 =larry2120["Parent"]
local larry2123 =(larry2122==larry996)
local larry2124 =larry2120["Parent"]
local larry2125 =(larry2124==larry14)
local larry2126 =larry2124["Parent"]
local larry2127 =(larry2126==larry996)
local larry2128 =larry2124["Parent"]
local larry2129 =(larry2128==larry14)
local larry2130 =larry2128["Parent"]
local larry2131 =(larry2130==larry996)
local larry2132 =larry2128["Parent"]
local larry2133 =(larry2132==larry14)
local larry2134 =larry2132["Parent"]
local larry2135 =(larry2134==larry996)
local larry2136 =larry2132["Parent"]
local larry2137 =(larry2136==larry14)
local larry2138 =larry2136["Parent"]
local larry2139 =(larry2138==larry996)
local larry2140 =larry2136["Parent"]
local larry2141 =(larry2140==larry14)
local larry2142 =larry2140["Parent"]
local larry2143 =(larry2142==larry996)
local larry2144 =larry2140["Parent"]
local larry2145 =(larry2144==larry14)
local larry2146 =larry2144["Parent"]
local larry2147 =(larry2146==larry996)
local larry2148 =larry2144["Parent"]
local larry2149 =(larry2148==larry14)
local larry2150 =larry2148["Parent"]
local larry2151 =(larry2150==larry996)
local larry2152 =larry2148["Parent"]
local larry2153 =(larry2152==larry14)
local larry2154 =larry2152["Parent"]
local larry2155 =(larry2154==larry996)
local larry2156 =larry2152["Parent"]
local larry2157 =(larry2156==larry14)
local larry2158 =larry2156["Parent"]
local larry2159 =(larry2158==larry996)
local larry2160 =larry2156["Parent"]
local larry2161 =(larry2160==larry14)
local larry2162 =larry2160["Parent"]
local larry2163 =(larry2162==larry996)
local larry2164 =larry2160["Parent"]
local larry2165 =(larry2164==larry14)
local larry2166 =larry2164["Parent"]
local larry2167 =(larry2166==larry996)
local larry2168 =larry2164["Parent"]
local larry2169 =(larry2168==larry14)
local larry2170 =larry2168["Parent"]
local larry2171 =(larry2170==larry996)
local larry2172 =larry2168["Parent"]
local larry2173 =(larry2172==larry14)
local larry2174 =larry2172["Parent"]
local larry2175 =(larry2174==larry996)
local larry2176 =larry2172["Parent"]
local larry2177 =(larry2176==larry14)
local larry2178 =larry2176["Parent"]
local larry2179 =(larry2178==larry996)
local larry2180 =larry2176["Parent"]
local larry2181 =(larry2180==larry14)
local larry2182 =larry2180["Parent"]
local larry2183 =(larry2182==larry996)
local larry2184 =larry2180["Parent"]
local larry2185 =(larry2184==larry14)
local larry2186 =larry2184["Parent"]
local larry2187 =(larry2186==larry996)
local larry2188 =larry2184["Parent"]
local larry2189 =(larry2188==larry14)
local larry2190 =larry2188["Parent"]
local larry2191 =(larry2190==larry996)
local larry2192 =larry2188["Parent"]
local larry2193 =(larry2192==larry14)
local larry2194 =larry2192["Parent"]
local larry2195 =(larry2194==larry996)
local larry2196 =larry2192["Parent"]
local larry2197 =(larry2196==larry14)
local larry2198 =larry2196["Parent"]
local larry2199 =(larry2198==larry996)
local larry2200 =larry2196["Parent"]
local larry2201 =(larry2200==larry14)
local larry2202 =larry2200["Parent"]
local larry2203 =(larry2202==larry996)
local er =error("Luraph Script:603: Luraph Script:300: Luraph Script:284: internal 542: <larry: infinitelooperror>")
end
end)
local larry2205 =larry25["Character"]
local larry2206 =larry2205["FindFirstChild"]
local larry2207 =larry2206(larry2205, "HumanoidRootPart")
local larry2208 =larry2207["Position"]
local larry2209 =larry803["Parent"]
local larry2210 =larry803["GetChildren"]
local larry2211 =larry2210(larry803)
local larry2213 =_2212_2["Name"]
local larry2214 =_2212_2["Name"]
local larry2215, _2215_2, _2215_3 =string.lower(larry2214)
local larry2216, _2216_2, _2216_3 =string.find(larry2215, "All Seeing Sentry")
local larry2217 =_2212_2["GetAttribute"]
local larry2218 =larry2217(_2212_2, "OwnerId")
local larry2219 =_2212_2["GetAttribute"]
local larry2220 =larry2219(_2212_2, "ownerId")
local larry2221 =_2212_2["GetAttribute"]
local larry2222 =larry2221(_2212_2, "Owner")
local larry2223 =_2212_2["GetAttribute"]
local larry2224 =larry2223(_2212_2, "owner")
local larry2225 =_2212_2["GetAttribute"]
local larry2226 =larry2225(_2212_2, "PlayerUserId")
local larry2227 =_2212_2["GetAttribute"]
local larry2228 =larry2227(_2212_2, "UserId")
local larry2229 =_2212_2["GetAttribute"]
local larry2230 =larry2229(_2212_2, "CreatorId")
local larry2231 =_2212_2["GetAttribute"]
local larry2232 =larry2231(_2212_2, "PlacedByUserId")
local larry2233 =_2212_2["GetAttribute"]
local larry2234 =larry2233(_2212_2, "PlayerId")
local larry2235 =_2212_2["GetChildren"]
local larry2236 =larry2235(_2212_2)
local larry2238 =_2237_2["IsA"]
local larry2239 =larry2238(_2237_2, "ObjectValue")
local larry2240 =_2237_2["Value"]
local larry2241 =_2237_2["Name"]
local larry2242 =_2212_2["Parent"]
local larry2243 =larry2242["GetAttribute"]
local larry2244 =larry2243(larry2242, "OwnerId")
local larry2245 =larry2242["GetAttribute"]
local larry2246 =larry2245(larry2242, "ownerId")
local larry2247 =larry2242["GetAttribute"]
local larry2248 =larry2247(larry2242, "Owner")
local larry2249 =larry2242["GetAttribute"]
local larry2250 =larry2249(larry2242, "owner")
local larry2251 =larry2242["GetAttribute"]
local larry2252 =larry2251(larry2242, "PlayerUserId")
local larry2253 =larry2242["GetAttribute"]
local larry2254 =larry2253(larry2242, "UserId")
local larry2255 =larry2242["GetAttribute"]
local larry2256 =larry2255(larry2242, "CreatorId")
local larry2257 =larry2242["GetAttribute"]
local larry2258 =larry2257(larry2242, "PlacedByUserId")
local larry2259 =larry2242["GetAttribute"]
local larry2260 =larry2259(larry2242, "PlayerId")
local larry2261 =larry2242["GetChildren"]
local larry2262 =larry2261(larry2242)
local larry2264 =_2263_2["IsA"]
local larry2265 =larry2264(_2263_2, "ObjectValue")
local larry2266 =_2263_2["Value"]
local larry2267 =_2263_2["Name"]
local larry2268 =larry2242["Parent"]
local larry2269 =larry2268["GetAttribute"]
local larry2270 =larry2269(larry2268, "OwnerId")
local larry2271 =larry2268["GetAttribute"]
local larry2272 =larry2271(larry2268, "ownerId")
local larry2273 =larry2268["GetAttribute"]
local larry2274 =larry2273(larry2268, "Owner")
local larry2275 =larry2268["GetAttribute"]
local larry2276 =larry2275(larry2268, "owner")
local larry2277 =larry2268["GetAttribute"]
local larry2278 =larry2277(larry2268, "PlayerUserId")
local larry2279 =larry2268["GetAttribute"]
local larry2280 =larry2279(larry2268, "UserId")
local larry2281 =larry2268["GetAttribute"]
local larry2282 =larry2281(larry2268, "CreatorId")
local larry2283 =larry2268["GetAttribute"]
local larry2284 =larry2283(larry2268, "PlacedByUserId")
local larry2285 =larry2268["GetAttribute"]
local larry2286 =larry2285(larry2268, "PlayerId")
local larry2287 =larry2268["GetChildren"]
local larry2288 =larry2287(larry2268)
local larry2290 =_2289_2["IsA"]
local larry2291 =larry2290(_2289_2, "ObjectValue")
local larry2292 =_2289_2["Value"]
local larry2293 =_2289_2["Name"]
local larry2294 =larry2268["Parent"]
local larry2295 =larry2294["GetAttribute"]
local larry2296 =larry2295(larry2294, "OwnerId")
local larry2297 =larry2294["GetAttribute"]
local larry2298 =larry2297(larry2294, "ownerId")
local larry2299 =larry2294["GetAttribute"]
local larry2300 =larry2299(larry2294, "Owner")
local larry2301 =larry2294["GetAttribute"]
local larry2302 =larry2301(larry2294, "owner")
local larry2303 =larry2294["GetAttribute"]
local larry2304 =larry2303(larry2294, "PlayerUserId")
local larry2305 =larry2294["GetAttribute"]
local larry2306 =larry2305(larry2294, "UserId")
local larry2307 =larry2294["GetAttribute"]
local larry2308 =larry2307(larry2294, "CreatorId")
local larry2309 =larry2294["GetAttribute"]
local larry2310 =larry2309(larry2294, "PlacedByUserId")
local larry2311 =larry2294["GetAttribute"]
local larry2312 =larry2311(larry2294, "PlayerId")
local larry2313 =larry2294["GetChildren"]
local larry2314 =larry2313(larry2294)
local larry2316 =_2315_2["IsA"]
local er =error("Luraph Script:1986: Luraph Script:632: Luraph Script:591: Luraph Script:337: Luraph Script:294: Luraph Script:202: internal 542: <larry: infinitelooperror>")
local larry794 =larry793(larry792, function(...)
local _795_vararg1, _795_vararg2, _795_vararg3, _795_vararg4, _795_vararg5, _795_vararg6, _795_vararg7, _795_vararg8, _795_vararg9, _795_vararg10 = ...
local larry796 =task["delay"]
local larry797 =larry796(0.35, function(...)
local _798_vararg1, _798_vararg2, _798_vararg3, _798_vararg4, _798_vararg5, _798_vararg6, _798_vararg7, _798_vararg8, _798_vararg9, _798_vararg10 = ...

end)
local larry799 =makefolder("MirandaTweenPlus")
local larry800 =larry6["JSONEncode"]
local larry801 =larry800(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = false,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = true,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry801)
local larry802 =larry14["FindFirstChild"]
local larry803 =larry802(larry14, "Turrets")
local larry804 =(larry803==larry14)
local larry805 =larry803["ChildAdded"]
local larry806 =larry805["Connect"]
local larry807 =larry806(larry805, function(...)
local _808_vararg1, _808_vararg2, _808_vararg3, _808_vararg4, _808_vararg5, _808_vararg6, _808_vararg7, _808_vararg8, _808_vararg9, _808_vararg10 = ...
local larry809 =_808_vararg1["Name"]
local larry810 =_808_vararg1["Name"]
local larry811, _811_2, _811_3 =string.lower(larry810)
local larry812, _812_2, _812_3 =string.find(larry811, "All Seeing Sentry")
local larry813 =_808_vararg1["GetAttribute"]
local larry814 =larry813(_808_vararg1, "OwnerId")
local larry815 =_808_vararg1["GetAttribute"]
local larry816 =larry815(_808_vararg1, "ownerId")
local larry817 =_808_vararg1["GetAttribute"]
local larry818 =larry817(_808_vararg1, "Owner")
local larry819 =_808_vararg1["GetAttribute"]
local larry820 =larry819(_808_vararg1, "owner")
local larry821 =_808_vararg1["GetAttribute"]
local larry822 =larry821(_808_vararg1, "PlayerUserId")
local larry823 =_808_vararg1["GetAttribute"]
local larry824 =larry823(_808_vararg1, "UserId")
local larry825 =_808_vararg1["GetAttribute"]
local larry826 =larry825(_808_vararg1, "CreatorId")
local larry827 =_808_vararg1["GetAttribute"]
local larry828 =larry827(_808_vararg1, "PlacedByUserId")
local larry829 =_808_vararg1["GetAttribute"]
local larry830 =larry829(_808_vararg1, "PlayerId")
local larry831 =_808_vararg1["GetChildren"]
local larry832 =larry831(_808_vararg1)
for larry833, _833_2 in ipairs(larry832) do
local larry834 =_833_2["IsA"]
local larry835 =larry834(_833_2, "ObjectValue")
local larry836 =_833_2["Value"]
local larry837 =_833_2["Name"]
end
local larry838 =_808_vararg1["Parent"]
local larry839 =larry838["GetAttribute"]
local larry840 =larry839(larry838, "OwnerId")
local larry841 =larry838["GetAttribute"]
local larry842 =larry841(larry838, "ownerId")
local larry843 =larry838["GetAttribute"]
local larry844 =larry843(larry838, "Owner")
local larry845 =larry838["GetAttribute"]
local larry846 =larry845(larry838, "owner")
local larry847 =larry838["GetAttribute"]
local larry848 =larry847(larry838, "PlayerUserId")
local larry849 =larry838["GetAttribute"]
local larry850 =larry849(larry838, "UserId")
local larry851 =larry838["GetAttribute"]
local larry852 =larry851(larry838, "CreatorId")
local larry853 =larry838["GetAttribute"]
local larry854 =larry853(larry838, "PlacedByUserId")
local larry855 =larry838["GetAttribute"]
local larry856 =larry855(larry838, "PlayerId")
local larry857 =larry838["GetChildren"]
local larry858 =larry857(larry838)
for larry859, _859_2 in ipairs(larry858) do
local larry860 =_859_2["IsA"]
local larry861 =larry860(_859_2, "ObjectValue")
local larry862 =_859_2["Value"]
local larry863 =_859_2["Name"]
end
local larry864 =larry838["Parent"]
local larry865 =larry864["GetAttribute"]
local larry866 =larry865(larry864, "OwnerId")
local larry867 =larry864["GetAttribute"]
local larry868 =larry867(larry864, "ownerId")
local larry869 =larry864["GetAttribute"]
local larry870 =larry869(larry864, "Owner")
local larry871 =larry864["GetAttribute"]
local larry872 =larry871(larry864, "owner")
local larry873 =larry864["GetAttribute"]
local larry874 =larry873(larry864, "PlayerUserId")
local larry875 =larry864["GetAttribute"]
local larry876 =larry875(larry864, "UserId")
local larry877 =larry864["GetAttribute"]
local larry878 =larry877(larry864, "CreatorId")
local larry879 =larry864["GetAttribute"]
local larry880 =larry879(larry864, "PlacedByUserId")
local larry881 =larry864["GetAttribute"]
local larry882 =larry881(larry864, "PlayerId")
local larry883 =larry864["GetChildren"]
local larry884 =larry883(larry864)
for larry885, _885_2 in ipairs(larry884) do
local larry886 =_885_2["IsA"]
local larry887 =larry886(_885_2, "ObjectValue")
local larry888 =_885_2["Value"]
local larry889 =_885_2["Name"]
end
local larry890 =larry864["Parent"]
local larry891 =larry890["GetAttribute"]
local larry892 =larry891(larry890, "OwnerId")
local larry893 =larry890["GetAttribute"]
local larry894 =larry893(larry890, "ownerId")
local larry895 =larry890["GetAttribute"]
local larry896 =larry895(larry890, "Owner")
local larry897 =larry890["GetAttribute"]
local larry898 =larry897(larry890, "owner")
local larry899 =larry890["GetAttribute"]
local larry900 =larry899(larry890, "PlayerUserId")
local larry901 =larry890["GetAttribute"]
local larry902 =larry901(larry890, "UserId")
local larry903 =larry890["GetAttribute"]
local larry904 =larry903(larry890, "CreatorId")
local larry905 =larry890["GetAttribute"]
local larry906 =larry905(larry890, "PlacedByUserId")
local larry907 =larry890["GetAttribute"]
local larry908 =larry907(larry890, "PlayerId")
local larry909 =larry890["GetChildren"]
local larry910 =larry909(larry890)
for larry911, _911_2 in ipairs(larry910) do
local larry912 =_911_2["IsA"]
local larry913 =larry912(_911_2, "ObjectValue")
local larry914 =_911_2["Value"]
local larry915 =_911_2["Name"]
end
local larry916 =larry890["Parent"]
local larry917 =larry916["GetAttribute"]
local larry918 =larry917(larry916, "OwnerId")
local larry919 =larry916["GetAttribute"]
local larry920 =larry919(larry916, "ownerId")
local larry921 =larry916["GetAttribute"]
local larry922 =larry921(larry916, "Owner")
local larry923 =larry916["GetAttribute"]
local larry924 =larry923(larry916, "owner")
local larry925 =larry916["GetAttribute"]
local larry926 =larry925(larry916, "PlayerUserId")
local larry927 =larry916["GetAttribute"]
local larry928 =larry927(larry916, "UserId")
local larry929 =larry916["GetAttribute"]
local larry930 =larry929(larry916, "CreatorId")
local larry931 =larry916["GetAttribute"]
local larry932 =larry931(larry916, "PlacedByUserId")
local larry933 =larry916["GetAttribute"]
local larry934 =larry933(larry916, "PlayerId")
local larry935 =larry916["GetChildren"]
local larry936 =larry935(larry916)
for larry937, _937_2 in ipairs(larry936) do
local larry938 =_937_2["IsA"]
local larry939 =larry938(_937_2, "ObjectValue")
local larry940 =_937_2["Value"]
local larry941 =_937_2["Name"]
end
local larry942 =larry916["Parent"]
local larry943 =larry942["GetAttribute"]
local larry944 =larry943(larry942, "OwnerId")
local larry945 =larry942["GetAttribute"]
local larry946 =larry945(larry942, "ownerId")
local larry947 =larry942["GetAttribute"]
local larry948 =larry947(larry942, "Owner")
local larry949 =larry942["GetAttribute"]
local larry950 =larry949(larry942, "owner")
local larry951 =larry942["GetAttribute"]
local larry952 =larry951(larry942, "PlayerUserId")
local larry953 =larry942["GetAttribute"]
local larry954 =larry953(larry942, "UserId")
local larry955 =larry942["GetAttribute"]
local larry956 =larry955(larry942, "CreatorId")
local larry957 =larry942["GetAttribute"]
local larry958 =larry957(larry942, "PlacedByUserId")
local larry959 =larry942["GetAttribute"]
local larry960 =larry959(larry942, "PlayerId")
local larry961 =larry942["GetChildren"]
local larry962 =larry961(larry942)
for larry963, _963_2 in ipairs(larry962) do
local larry964 =_963_2["IsA"]
local larry965 =larry964(_963_2, "ObjectValue")
local larry966 =_963_2["Value"]
local larry967 =_963_2["Name"]
end
local larry968 =larry942["Parent"]
local larry969 =larry968["GetAttribute"]
local larry970 =larry969(larry968, "OwnerId")
local larry971 =larry968["GetAttribute"]
local larry972 =larry971(larry968, "ownerId")
local larry973 =larry968["GetAttribute"]
local larry974 =larry973(larry968, "Owner")
local larry975 =larry968["GetAttribute"]
local larry976 =larry975(larry968, "owner")
local larry977 =larry968["GetAttribute"]
local larry978 =larry977(larry968, "PlayerUserId")
local larry979 =larry968["GetAttribute"]
local larry980 =larry979(larry968, "UserId")
local larry981 =larry968["GetAttribute"]
local larry982 =larry981(larry968, "CreatorId")
local larry983 =larry968["GetAttribute"]
local larry984 =larry983(larry968, "PlacedByUserId")
local larry985 =larry968["GetAttribute"]
local larry986 =larry985(larry968, "PlayerId")
local larry987 =larry968["GetChildren"]
local larry988 =larry987(larry968)
for larry989, _989_2 in ipairs(larry988) do
local larry990 =_989_2["IsA"]
local larry991 =larry990(_989_2, "ObjectValue")
local larry992 =_989_2["Value"]
local larry993 =_989_2["Name"]
end
local larry994 =larry968["Parent"]
local larry995 =larry14["FindFirstChild"]
local larry996 =larry995(larry14, "Plots")
local larry997 =larry14["FindFirstChild"]
local larry998 =larry997(larry14, "Plots")
local larry999 =larry998["GetChildren"]
local larry1000 =larry999(larry998)
for larry1001, _1001_2 in ipairs(larry1000) do
local larry1002 =_1001_2["FindFirstChild"]
local larry1003 =larry1002(_1001_2, "PlotSign")
local larry1004 =larry1003["FindFirstChild"]
local larry1005 =larry1004(larry1003, "YourBase")
local larry1006 =larry1003["YourBase"]
local larry1007 =larry1006["Enabled"]
local larry1008 =_1001_2["Name"]
local larry1009 =(_808_vararg1==larry14)
local larry1010 =_808_vararg1["Parent"]
local larry1011 =(larry1010==larry996)
local larry1012 =_808_vararg1["Parent"]
local larry1013 =(larry1012==larry14)
local larry1014 =larry1012["Parent"]
local larry1015 =(larry1014==larry996)
local larry1016 =larry1012["Parent"]
local larry1017 =(larry1016==larry14)
local larry1018 =larry1016["Parent"]
local larry1019 =(larry1018==larry996)
local larry1020 =larry1016["Parent"]
local larry1021 =(larry1020==larry14)
local larry1022 =larry1020["Parent"]
local larry1023 =(larry1022==larry996)
local larry1024 =larry1020["Parent"]
local larry1025 =(larry1024==larry14)
local larry1026 =larry1024["Parent"]
local larry1027 =(larry1026==larry996)
local larry1028 =larry1024["Parent"]
local larry1029 =(larry1028==larry14)
local larry1030 =larry1028["Parent"]
local larry1031 =(larry1030==larry996)
local larry1032 =larry1028["Parent"]
local larry1033 =(larry1032==larry14)
local larry1034 =larry1032["Parent"]
local larry1035 =(larry1034==larry996)
local larry1036 =larry1032["Parent"]
local larry1037 =(larry1036==larry14)
local larry1038 =larry1036["Parent"]
local larry1039 =(larry1038==larry996)
local larry1040 =larry1036["Parent"]
local larry1041 =(larry1040==larry14)
local larry1042 =larry1040["Parent"]
local larry1043 =(larry1042==larry996)
local larry1044 =larry1040["Parent"]
local larry1045 =(larry1044==larry14)
local larry1046 =larry1044["Parent"]
local larry1047 =(larry1046==larry996)
local larry1048 =larry1044["Parent"]
local larry1049 =(larry1048==larry14)
local larry1050 =larry1048["Parent"]
local larry1051 =(larry1050==larry996)
local larry1052 =larry1048["Parent"]
local larry1053 =(larry1052==larry14)
local larry1054 =larry1052["Parent"]
local larry1055 =(larry1054==larry996)
local larry1056 =larry1052["Parent"]
local larry1057 =(larry1056==larry14)
local larry1058 =larry1056["Parent"]
local larry1059 =(larry1058==larry996)
local larry1060 =larry1056["Parent"]
local larry1061 =(larry1060==larry14)
local larry1062 =larry1060["Parent"]
local larry1063 =(larry1062==larry996)
local larry1064 =larry1060["Parent"]
local larry1065 =(larry1064==larry14)
local larry1066 =larry1064["Parent"]
local larry1067 =(larry1066==larry996)
local larry1068 =larry1064["Parent"]
local larry1069 =(larry1068==larry14)
local larry1070 =larry1068["Parent"]
local larry1071 =(larry1070==larry996)
local larry1072 =larry1068["Parent"]
local larry1073 =(larry1072==larry14)
local larry1074 =larry1072["Parent"]
local larry1075 =(larry1074==larry996)
local larry1076 =larry1072["Parent"]
local larry1077 =(larry1076==larry14)
local larry1078 =larry1076["Parent"]
local larry1079 =(larry1078==larry996)
local larry1080 =larry1076["Parent"]
local larry1081 =(larry1080==larry14)
local larry1082 =larry1080["Parent"]
local larry1083 =(larry1082==larry996)
local larry1084 =larry1080["Parent"]
local larry1085 =(larry1084==larry14)
local larry1086 =larry1084["Parent"]
local larry1087 =(larry1086==larry996)
local larry1088 =larry1084["Parent"]
local larry1089 =(larry1088==larry14)
local larry1090 =larry1088["Parent"]
local larry1091 =(larry1090==larry996)
local larry1092 =larry1088["Parent"]
local larry1093 =(larry1092==larry14)
local larry1094 =larry1092["Parent"]
local larry1095 =(larry1094==larry996)
local larry1096 =larry1092["Parent"]
local larry1097 =(larry1096==larry14)
local larry1098 =larry1096["Parent"]
local larry1099 =(larry1098==larry996)
local larry1100 =larry1096["Parent"]
local larry1101 =(larry1100==larry14)
local larry1102 =larry1100["Parent"]
local larry1103 =(larry1102==larry996)
local larry1104 =larry1100["Parent"]
local larry1105 =(larry1104==larry14)
local larry1106 =larry1104["Parent"]
local larry1107 =(larry1106==larry996)
local larry1108 =larry1104["Parent"]
local larry1109 =(larry1108==larry14)
local larry1110 =larry1108["Parent"]
local larry1111 =(larry1110==larry996)
local larry1112 =larry1108["Parent"]
local larry1113 =(larry1112==larry14)
local larry1114 =larry1112["Parent"]
local larry1115 =(larry1114==larry996)
local larry1116 =larry1112["Parent"]
local larry1117 =(larry1116==larry14)
local larry1118 =larry1116["Parent"]
local larry1119 =(larry1118==larry996)
local larry1120 =larry1116["Parent"]
local larry1121 =(larry1120==larry14)
local larry1122 =larry1120["Parent"]
local larry1123 =(larry1122==larry996)
local larry1124 =larry1120["Parent"]
local larry1125 =(larry1124==larry14)
local larry1126 =larry1124["Parent"]
local larry1127 =(larry1126==larry996)
local larry1128 =larry1124["Parent"]
local larry1129 =(larry1128==larry14)
local larry1130 =larry1128["Parent"]
local larry1131 =(larry1130==larry996)
local larry1132 =larry1128["Parent"]
local larry1133 =(larry1132==larry14)
local larry1134 =larry1132["Parent"]
local larry1135 =(larry1134==larry996)
local larry1136 =larry1132["Parent"]
local larry1137 =(larry1136==larry14)
local larry1138 =larry1136["Parent"]
local larry1139 =(larry1138==larry996)
local larry1140 =larry1136["Parent"]
local larry1141 =(larry1140==larry14)
local larry1142 =larry1140["Parent"]
local larry1143 =(larry1142==larry996)
local larry1144 =larry1140["Parent"]
local larry1145 =(larry1144==larry14)
local larry1146 =larry1144["Parent"]
local larry1147 =(larry1146==larry996)
local larry1148 =larry1144["Parent"]
local larry1149 =(larry1148==larry14)
local larry1150 =larry1148["Parent"]
local larry1151 =(larry1150==larry996)
local larry1152 =larry1148["Parent"]
local larry1153 =(larry1152==larry14)
local larry1154 =larry1152["Parent"]
local larry1155 =(larry1154==larry996)
local larry1156 =larry1152["Parent"]
local larry1157 =(larry1156==larry14)
local larry1158 =larry1156["Parent"]
local larry1159 =(larry1158==larry996)
local larry1160 =larry1156["Parent"]
local larry1161 =(larry1160==larry14)
local larry1162 =larry1160["Parent"]
local larry1163 =(larry1162==larry996)
local larry1164 =larry1160["Parent"]
local larry1165 =(larry1164==larry14)
local larry1166 =larry1164["Parent"]
local larry1167 =(larry1166==larry996)
local larry1168 =larry1164["Parent"]
local larry1169 =(larry1168==larry14)
local larry1170 =larry1168["Parent"]
local larry1171 =(larry1170==larry996)
local larry1172 =larry1168["Parent"]
local larry1173 =(larry1172==larry14)
local larry1174 =larry1172["Parent"]
local larry1175 =(larry1174==larry996)
local larry1176 =larry1172["Parent"]
local larry1177 =(larry1176==larry14)
local larry1178 =larry1176["Parent"]
local larry1179 =(larry1178==larry996)
local larry1180 =larry1176["Parent"]
local larry1181 =(larry1180==larry14)
local larry1182 =larry1180["Parent"]
local larry1183 =(larry1182==larry996)
local larry1184 =larry1180["Parent"]
local larry1185 =(larry1184==larry14)
local larry1186 =larry1184["Parent"]
local larry1187 =(larry1186==larry996)
local larry1188 =larry1184["Parent"]
local larry1189 =(larry1188==larry14)
local larry1190 =larry1188["Parent"]
local larry1191 =(larry1190==larry996)
local larry1192 =larry1188["Parent"]
local larry1193 =(larry1192==larry14)
local larry1194 =larry1192["Parent"]
local larry1195 =(larry1194==larry996)
local larry1196 =larry1192["Parent"]
local larry1197 =(larry1196==larry14)
local larry1198 =larry1196["Parent"]
local larry1199 =(larry1198==larry996)
local larry1200 =larry1196["Parent"]
local larry1201 =(larry1200==larry14)
local larry1202 =larry1200["Parent"]
local larry1203 =(larry1202==larry996)
local larry1204 =larry1200["Parent"]
local larry1205 =(larry1204==larry14)
local larry1206 =larry1204["Parent"]
local larry1207 =(larry1206==larry996)
local larry1208 =larry1204["Parent"]
local larry1209 =(larry1208==larry14)
local larry1210 =larry1208["Parent"]
local larry1211 =(larry1210==larry996)
local larry1212 =larry1208["Parent"]
local larry1213 =(larry1212==larry14)
local larry1214 =larry1212["Parent"]
local larry1215 =(larry1214==larry996)
local larry1216 =larry1212["Parent"]
local larry1217 =(larry1216==larry14)
local larry1218 =larry1216["Parent"]
local larry1219 =(larry1218==larry996)
local larry1220 =larry1216["Parent"]
local larry1221 =(larry1220==larry14)
local larry1222 =larry1220["Parent"]
local larry1223 =(larry1222==larry996)
local larry1224 =larry1220["Parent"]
local larry1225 =(larry1224==larry14)
local larry1226 =larry1224["Parent"]
local larry1227 =(larry1226==larry996)
local larry1228 =larry1224["Parent"]
local larry1229 =(larry1228==larry14)
local larry1230 =larry1228["Parent"]
local larry1231 =(larry1230==larry996)
local larry1232 =larry1228["Parent"]
local larry1233 =(larry1232==larry14)
local larry1234 =larry1232["Parent"]
local larry1235 =(larry1234==larry996)
local larry1236 =larry1232["Parent"]
local larry1237 =(larry1236==larry14)
local larry1238 =larry1236["Parent"]
local larry1239 =(larry1238==larry996)
local larry1240 =larry1236["Parent"]
local larry1241 =(larry1240==larry14)
local larry1242 =larry1240["Parent"]
local larry1243 =(larry1242==larry996)
local larry1244 =larry1240["Parent"]
local larry1245 =(larry1244==larry14)
local larry1246 =larry1244["Parent"]
local larry1247 =(larry1246==larry996)
local larry1248 =larry1244["Parent"]
local larry1249 =(larry1248==larry14)
local larry1250 =larry1248["Parent"]
local larry1251 =(larry1250==larry996)
local larry1252 =larry1248["Parent"]
local larry1253 =(larry1252==larry14)
local larry1254 =larry1252["Parent"]
local larry1255 =(larry1254==larry996)
local larry1256 =larry1252["Parent"]
local larry1257 =(larry1256==larry14)
local larry1258 =larry1256["Parent"]
local larry1259 =(larry1258==larry996)
local larry1260 =larry1256["Parent"]
local larry1261 =(larry1260==larry14)
local larry1262 =larry1260["Parent"]
local larry1263 =(larry1262==larry996)
local larry1264 =larry1260["Parent"]
local larry1265 =(larry1264==larry14)
local larry1266 =larry1264["Parent"]
local larry1267 =(larry1266==larry996)
local larry1268 =larry1264["Parent"]
local larry1269 =(larry1268==larry14)
local larry1270 =larry1268["Parent"]
local larry1271 =(larry1270==larry996)
local larry1272 =larry1268["Parent"]
local larry1273 =(larry1272==larry14)
local larry1274 =larry1272["Parent"]
local larry1275 =(larry1274==larry996)
local larry1276 =larry1272["Parent"]
local larry1277 =(larry1276==larry14)
local larry1278 =larry1276["Parent"]
local larry1279 =(larry1278==larry996)
local larry1280 =larry1276["Parent"]
local larry1281 =(larry1280==larry14)
local larry1282 =larry1280["Parent"]
local larry1283 =(larry1282==larry996)
local larry1284 =larry1280["Parent"]
local larry1285 =(larry1284==larry14)
local larry1286 =larry1284["Parent"]
local larry1287 =(larry1286==larry996)
local larry1288 =larry1284["Parent"]
local larry1289 =(larry1288==larry14)
local larry1290 =larry1288["Parent"]
local larry1291 =(larry1290==larry996)
local larry1292 =larry1288["Parent"]
local larry1293 =(larry1292==larry14)
local larry1294 =larry1292["Parent"]
local larry1295 =(larry1294==larry996)
local larry1296 =larry1292["Parent"]
local larry1297 =(larry1296==larry14)
local larry1298 =larry1296["Parent"]
local larry1299 =(larry1298==larry996)
local larry1300 =larry1296["Parent"]
local larry1301 =(larry1300==larry14)
local larry1302 =larry1300["Parent"]
local larry1303 =(larry1302==larry996)
local larry1304 =larry1300["Parent"]
local larry1305 =(larry1304==larry14)
local larry1306 =larry1304["Parent"]
local larry1307 =(larry1306==larry996)
local larry1308 =larry1304["Parent"]
local larry1309 =(larry1308==larry14)
local larry1310 =larry1308["Parent"]
local larry1311 =(larry1310==larry996)
local larry1312 =larry1308["Parent"]
local larry1313 =(larry1312==larry14)
local larry1314 =larry1312["Parent"]
local larry1315 =(larry1314==larry996)
local larry1316 =larry1312["Parent"]
local larry1317 =(larry1316==larry14)
local larry1318 =larry1316["Parent"]
local larry1319 =(larry1318==larry996)
local larry1320 =larry1316["Parent"]
local larry1321 =(larry1320==larry14)
local larry1322 =larry1320["Parent"]
local larry1323 =(larry1322==larry996)
local larry1324 =larry1320["Parent"]
local larry1325 =(larry1324==larry14)
local larry1326 =larry1324["Parent"]
local larry1327 =(larry1326==larry996)
local larry1328 =larry1324["Parent"]
local larry1329 =(larry1328==larry14)
local larry1330 =larry1328["Parent"]
local larry1331 =(larry1330==larry996)
local larry1332 =larry1328["Parent"]
local larry1333 =(larry1332==larry14)
local larry1334 =larry1332["Parent"]
local larry1335 =(larry1334==larry996)
local larry1336 =larry1332["Parent"]
local larry1337 =(larry1336==larry14)
local larry1338 =larry1336["Parent"]
local larry1339 =(larry1338==larry996)
local larry1340 =larry1336["Parent"]
local larry1341 =(larry1340==larry14)
local larry1342 =larry1340["Parent"]
local larry1343 =(larry1342==larry996)
local larry1344 =larry1340["Parent"]
local larry1345 =(larry1344==larry14)
local larry1346 =larry1344["Parent"]
local larry1347 =(larry1346==larry996)
local larry1348 =larry1344["Parent"]
local larry1349 =(larry1348==larry14)
local larry1350 =larry1348["Parent"]
local larry1351 =(larry1350==larry996)
local larry1352 =larry1348["Parent"]
local larry1353 =(larry1352==larry14)
local larry1354 =larry1352["Parent"]
local larry1355 =(larry1354==larry996)
local larry1356 =larry1352["Parent"]
local larry1357 =(larry1356==larry14)
local larry1358 =larry1356["Parent"]
local larry1359 =(larry1358==larry996)
local larry1360 =larry1356["Parent"]
local larry1361 =(larry1360==larry14)
local larry1362 =larry1360["Parent"]
local larry1363 =(larry1362==larry996)
local larry1364 =larry1360["Parent"]
local larry1365 =(larry1364==larry14)
local larry1366 =larry1364["Parent"]
local larry1367 =(larry1366==larry996)
local larry1368 =larry1364["Parent"]
local larry1369 =(larry1368==larry14)
local larry1370 =larry1368["Parent"]
local larry1371 =(larry1370==larry996)
local larry1372 =larry1368["Parent"]
local larry1373 =(larry1372==larry14)
local larry1374 =larry1372["Parent"]
local larry1375 =(larry1374==larry996)
local larry1376 =larry1372["Parent"]
local larry1377 =(larry1376==larry14)
local larry1378 =larry1376["Parent"]
local larry1379 =(larry1378==larry996)
local larry1380 =larry1376["Parent"]
local larry1381 =(larry1380==larry14)
local larry1382 =larry1380["Parent"]
local larry1383 =(larry1382==larry996)
local larry1384 =larry1380["Parent"]
local larry1385 =(larry1384==larry14)
local larry1386 =larry1384["Parent"]
local larry1387 =(larry1386==larry996)
local larry1388 =larry1384["Parent"]
local larry1389 =(larry1388==larry14)
local larry1390 =larry1388["Parent"]
local larry1391 =(larry1390==larry996)
local larry1392 =larry1388["Parent"]
local larry1393 =(larry1392==larry14)
local larry1394 =larry1392["Parent"]
local larry1395 =(larry1394==larry996)
local larry1396 =larry1392["Parent"]
local larry1397 =(larry1396==larry14)
local larry1398 =larry1396["Parent"]
local larry1399 =(larry1398==larry996)
local larry1400 =larry1396["Parent"]
local larry1401 =(larry1400==larry14)
local larry1402 =larry1400["Parent"]
local larry1403 =(larry1402==larry996)
local larry1404 =larry1400["Parent"]
local larry1405 =(larry1404==larry14)
local larry1406 =larry1404["Parent"]
local larry1407 =(larry1406==larry996)
local larry1408 =larry1404["Parent"]
local larry1409 =(larry1408==larry14)
local larry1410 =larry1408["Parent"]
local larry1411 =(larry1410==larry996)
local larry1412 =larry1408["Parent"]
local larry1413 =(larry1412==larry14)
local larry1414 =larry1412["Parent"]
local larry1415 =(larry1414==larry996)
local larry1416 =larry1412["Parent"]
local larry1417 =(larry1416==larry14)
local larry1418 =larry1416["Parent"]
local larry1419 =(larry1418==larry996)
local larry1420 =larry1416["Parent"]
local larry1421 =(larry1420==larry14)
local larry1422 =larry1420["Parent"]
local larry1423 =(larry1422==larry996)
local larry1424 =larry1420["Parent"]
local larry1425 =(larry1424==larry14)
local larry1426 =larry1424["Parent"]
local larry1427 =(larry1426==larry996)
local larry1428 =larry1424["Parent"]
local larry1429 =(larry1428==larry14)
local larry1430 =larry1428["Parent"]
local larry1431 =(larry1430==larry996)
local larry1432 =larry1428["Parent"]
local larry1433 =(larry1432==larry14)
local larry1434 =larry1432["Parent"]
local larry1435 =(larry1434==larry996)
local larry1436 =larry1432["Parent"]
local larry1437 =(larry1436==larry14)
local larry1438 =larry1436["Parent"]
local larry1439 =(larry1438==larry996)
local larry1440 =larry1436["Parent"]
local larry1441 =(larry1440==larry14)
local larry1442 =larry1440["Parent"]
local larry1443 =(larry1442==larry996)
local larry1444 =larry1440["Parent"]
local larry1445 =(larry1444==larry14)
local larry1446 =larry1444["Parent"]
local larry1447 =(larry1446==larry996)
local larry1448 =larry1444["Parent"]
local larry1449 =(larry1448==larry14)
local larry1450 =larry1448["Parent"]
local larry1451 =(larry1450==larry996)
local larry1452 =larry1448["Parent"]
local larry1453 =(larry1452==larry14)
local larry1454 =larry1452["Parent"]
local larry1455 =(larry1454==larry996)
local larry1456 =larry1452["Parent"]
local larry1457 =(larry1456==larry14)
local larry1458 =larry1456["Parent"]
local larry1459 =(larry1458==larry996)
local larry1460 =larry1456["Parent"]
local larry1461 =(larry1460==larry14)
local larry1462 =larry1460["Parent"]
local larry1463 =(larry1462==larry996)
local larry1464 =larry1460["Parent"]
local larry1465 =(larry1464==larry14)
local larry1466 =larry1464["Parent"]
local larry1467 =(larry1466==larry996)
local larry1468 =larry1464["Parent"]
local larry1469 =(larry1468==larry14)
local larry1470 =larry1468["Parent"]
local larry1471 =(larry1470==larry996)
local larry1472 =larry1468["Parent"]
local larry1473 =(larry1472==larry14)
local larry1474 =larry1472["Parent"]
local larry1475 =(larry1474==larry996)
local larry1476 =larry1472["Parent"]
local larry1477 =(larry1476==larry14)
local larry1478 =larry1476["Parent"]
local larry1479 =(larry1478==larry996)
local larry1480 =larry1476["Parent"]
local larry1481 =(larry1480==larry14)
local larry1482 =larry1480["Parent"]
local larry1483 =(larry1482==larry996)
local larry1484 =larry1480["Parent"]
local larry1485 =(larry1484==larry14)
local larry1486 =larry1484["Parent"]
local larry1487 =(larry1486==larry996)
local larry1488 =larry1484["Parent"]
local larry1489 =(larry1488==larry14)
local larry1490 =larry1488["Parent"]
local larry1491 =(larry1490==larry996)
local larry1492 =larry1488["Parent"]
local larry1493 =(larry1492==larry14)
local larry1494 =larry1492["Parent"]
local larry1495 =(larry1494==larry996)
local larry1496 =larry1492["Parent"]
local larry1497 =(larry1496==larry14)
local larry1498 =larry1496["Parent"]
local larry1499 =(larry1498==larry996)
local larry1500 =larry1496["Parent"]
local larry1501 =(larry1500==larry14)
local larry1502 =larry1500["Parent"]
local larry1503 =(larry1502==larry996)
local larry1504 =larry1500["Parent"]
local larry1505 =(larry1504==larry14)
local larry1506 =larry1504["Parent"]
local larry1507 =(larry1506==larry996)
local larry1508 =larry1504["Parent"]
local larry1509 =(larry1508==larry14)
local larry1510 =larry1508["Parent"]
local larry1511 =(larry1510==larry996)
local larry1512 =larry1508["Parent"]
local larry1513 =(larry1512==larry14)
local larry1514 =larry1512["Parent"]
local larry1515 =(larry1514==larry996)
local larry1516 =larry1512["Parent"]
local larry1517 =(larry1516==larry14)
local larry1518 =larry1516["Parent"]
local larry1519 =(larry1518==larry996)
local larry1520 =larry1516["Parent"]
local larry1521 =(larry1520==larry14)
local larry1522 =larry1520["Parent"]
local larry1523 =(larry1522==larry996)
local larry1524 =larry1520["Parent"]
local larry1525 =(larry1524==larry14)
local larry1526 =larry1524["Parent"]
local larry1527 =(larry1526==larry996)
local larry1528 =larry1524["Parent"]
local larry1529 =(larry1528==larry14)
local larry1530 =larry1528["Parent"]
local larry1531 =(larry1530==larry996)
local larry1532 =larry1528["Parent"]
local larry1533 =(larry1532==larry14)
local larry1534 =larry1532["Parent"]
local larry1535 =(larry1534==larry996)
local larry1536 =larry1532["Parent"]
local larry1537 =(larry1536==larry14)
local larry1538 =larry1536["Parent"]
local larry1539 =(larry1538==larry996)
local larry1540 =larry1536["Parent"]
local larry1541 =(larry1540==larry14)
local larry1542 =larry1540["Parent"]
local larry1543 =(larry1542==larry996)
local larry1544 =larry1540["Parent"]
local larry1545 =(larry1544==larry14)
local larry1546 =larry1544["Parent"]
local larry1547 =(larry1546==larry996)
local larry1548 =larry1544["Parent"]
local larry1549 =(larry1548==larry14)
local larry1550 =larry1548["Parent"]
local larry1551 =(larry1550==larry996)
local larry1552 =larry1548["Parent"]
local larry1553 =(larry1552==larry14)
local larry1554 =larry1552["Parent"]
local larry1555 =(larry1554==larry996)
local larry1556 =larry1552["Parent"]
local larry1557 =(larry1556==larry14)
local larry1558 =larry1556["Parent"]
local larry1559 =(larry1558==larry996)
local larry1560 =larry1556["Parent"]
local larry1561 =(larry1560==larry14)
local larry1562 =larry1560["Parent"]
local larry1563 =(larry1562==larry996)
local larry1564 =larry1560["Parent"]
local larry1565 =(larry1564==larry14)
local larry1566 =larry1564["Parent"]
local larry1567 =(larry1566==larry996)
local larry1568 =larry1564["Parent"]
local larry1569 =(larry1568==larry14)
local larry1570 =larry1568["Parent"]
local larry1571 =(larry1570==larry996)
local larry1572 =larry1568["Parent"]
local larry1573 =(larry1572==larry14)
local larry1574 =larry1572["Parent"]
local larry1575 =(larry1574==larry996)
local larry1576 =larry1572["Parent"]
local larry1577 =(larry1576==larry14)
local larry1578 =larry1576["Parent"]
local larry1579 =(larry1578==larry996)
local larry1580 =larry1576["Parent"]
local larry1581 =(larry1580==larry14)
local larry1582 =larry1580["Parent"]
local larry1583 =(larry1582==larry996)
local larry1584 =larry1580["Parent"]
local larry1585 =(larry1584==larry14)
local larry1586 =larry1584["Parent"]
local larry1587 =(larry1586==larry996)
local larry1588 =larry1584["Parent"]
local larry1589 =(larry1588==larry14)
local larry1590 =larry1588["Parent"]
local larry1591 =(larry1590==larry996)
local larry1592 =larry1588["Parent"]
local larry1593 =(larry1592==larry14)
local larry1594 =larry1592["Parent"]
local larry1595 =(larry1594==larry996)
local larry1596 =larry1592["Parent"]
local larry1597 =(larry1596==larry14)
local larry1598 =larry1596["Parent"]
local larry1599 =(larry1598==larry996)
local larry1600 =larry1596["Parent"]
local larry1601 =(larry1600==larry14)
local larry1602 =larry1600["Parent"]
local larry1603 =(larry1602==larry996)
local larry1604 =larry1600["Parent"]
local larry1605 =(larry1604==larry14)
local larry1606 =larry1604["Parent"]
local larry1607 =(larry1606==larry996)
local larry1608 =larry1604["Parent"]
local larry1609 =(larry1608==larry14)
local larry1610 =larry1608["Parent"]
local larry1611 =(larry1610==larry996)
local larry1612 =larry1608["Parent"]
local larry1613 =(larry1612==larry14)
local larry1614 =larry1612["Parent"]
local larry1615 =(larry1614==larry996)
local larry1616 =larry1612["Parent"]
local larry1617 =(larry1616==larry14)
local larry1618 =larry1616["Parent"]
local larry1619 =(larry1618==larry996)
local larry1620 =larry1616["Parent"]
local larry1621 =(larry1620==larry14)
local larry1622 =larry1620["Parent"]
local larry1623 =(larry1622==larry996)
local larry1624 =larry1620["Parent"]
local larry1625 =(larry1624==larry14)
local larry1626 =larry1624["Parent"]
local larry1627 =(larry1626==larry996)
local larry1628 =larry1624["Parent"]
local larry1629 =(larry1628==larry14)
local larry1630 =larry1628["Parent"]
local larry1631 =(larry1630==larry996)
local larry1632 =larry1628["Parent"]
local larry1633 =(larry1632==larry14)
local larry1634 =larry1632["Parent"]
local larry1635 =(larry1634==larry996)
local larry1636 =larry1632["Parent"]
local larry1637 =(larry1636==larry14)
local larry1638 =larry1636["Parent"]
local larry1639 =(larry1638==larry996)
local larry1640 =larry1636["Parent"]
local larry1641 =(larry1640==larry14)
local larry1642 =larry1640["Parent"]
local larry1643 =(larry1642==larry996)
local larry1644 =larry1640["Parent"]
local larry1645 =(larry1644==larry14)
local larry1646 =larry1644["Parent"]
local larry1647 =(larry1646==larry996)
local larry1648 =larry1644["Parent"]
local larry1649 =(larry1648==larry14)
local larry1650 =larry1648["Parent"]
local larry1651 =(larry1650==larry996)
local larry1652 =larry1648["Parent"]
local larry1653 =(larry1652==larry14)
local larry1654 =larry1652["Parent"]
local larry1655 =(larry1654==larry996)
local larry1656 =larry1652["Parent"]
local larry1657 =(larry1656==larry14)
local larry1658 =larry1656["Parent"]
local larry1659 =(larry1658==larry996)
local larry1660 =larry1656["Parent"]
local larry1661 =(larry1660==larry14)
local larry1662 =larry1660["Parent"]
local larry1663 =(larry1662==larry996)
local larry1664 =larry1660["Parent"]
local larry1665 =(larry1664==larry14)
local larry1666 =larry1664["Parent"]
local larry1667 =(larry1666==larry996)
local larry1668 =larry1664["Parent"]
local larry1669 =(larry1668==larry14)
local larry1670 =larry1668["Parent"]
local larry1671 =(larry1670==larry996)
local larry1672 =larry1668["Parent"]
local larry1673 =(larry1672==larry14)
local larry1674 =larry1672["Parent"]
local larry1675 =(larry1674==larry996)
local larry1676 =larry1672["Parent"]
local larry1677 =(larry1676==larry14)
local larry1678 =larry1676["Parent"]
local larry1679 =(larry1678==larry996)
local larry1680 =larry1676["Parent"]
local larry1681 =(larry1680==larry14)
local larry1682 =larry1680["Parent"]
local larry1683 =(larry1682==larry996)
local larry1684 =larry1680["Parent"]
local larry1685 =(larry1684==larry14)
local larry1686 =larry1684["Parent"]
local larry1687 =(larry1686==larry996)
local larry1688 =larry1684["Parent"]
local larry1689 =(larry1688==larry14)
local larry1690 =larry1688["Parent"]
local larry1691 =(larry1690==larry996)
local larry1692 =larry1688["Parent"]
local larry1693 =(larry1692==larry14)
local larry1694 =larry1692["Parent"]
local larry1695 =(larry1694==larry996)
local larry1696 =larry1692["Parent"]
local larry1697 =(larry1696==larry14)
local larry1698 =larry1696["Parent"]
local larry1699 =(larry1698==larry996)
local larry1700 =larry1696["Parent"]
local larry1701 =(larry1700==larry14)
local larry1702 =larry1700["Parent"]
local larry1703 =(larry1702==larry996)
local larry1704 =larry1700["Parent"]
local larry1705 =(larry1704==larry14)
local larry1706 =larry1704["Parent"]
local larry1707 =(larry1706==larry996)
local larry1708 =larry1704["Parent"]
local larry1709 =(larry1708==larry14)
local larry1710 =larry1708["Parent"]
local larry1711 =(larry1710==larry996)
local larry1712 =larry1708["Parent"]
local larry1713 =(larry1712==larry14)
local larry1714 =larry1712["Parent"]
local larry1715 =(larry1714==larry996)
local larry1716 =larry1712["Parent"]
local larry1717 =(larry1716==larry14)
local larry1718 =larry1716["Parent"]
local larry1719 =(larry1718==larry996)
local larry1720 =larry1716["Parent"]
local larry1721 =(larry1720==larry14)
local larry1722 =larry1720["Parent"]
local larry1723 =(larry1722==larry996)
local larry1724 =larry1720["Parent"]
local larry1725 =(larry1724==larry14)
local larry1726 =larry1724["Parent"]
local larry1727 =(larry1726==larry996)
local larry1728 =larry1724["Parent"]
local larry1729 =(larry1728==larry14)
local larry1730 =larry1728["Parent"]
local larry1731 =(larry1730==larry996)
local larry1732 =larry1728["Parent"]
local larry1733 =(larry1732==larry14)
local larry1734 =larry1732["Parent"]
local larry1735 =(larry1734==larry996)
local larry1736 =larry1732["Parent"]
local larry1737 =(larry1736==larry14)
local larry1738 =larry1736["Parent"]
local larry1739 =(larry1738==larry996)
local larry1740 =larry1736["Parent"]
local larry1741 =(larry1740==larry14)
local larry1742 =larry1740["Parent"]
local larry1743 =(larry1742==larry996)
local larry1744 =larry1740["Parent"]
local larry1745 =(larry1744==larry14)
local larry1746 =larry1744["Parent"]
local larry1747 =(larry1746==larry996)
local larry1748 =larry1744["Parent"]
local larry1749 =(larry1748==larry14)
local larry1750 =larry1748["Parent"]
local larry1751 =(larry1750==larry996)
local larry1752 =larry1748["Parent"]
local larry1753 =(larry1752==larry14)
local larry1754 =larry1752["Parent"]
local larry1755 =(larry1754==larry996)
local larry1756 =larry1752["Parent"]
local larry1757 =(larry1756==larry14)
local larry1758 =larry1756["Parent"]
local larry1759 =(larry1758==larry996)
local larry1760 =larry1756["Parent"]
local larry1761 =(larry1760==larry14)
local larry1762 =larry1760["Parent"]
local larry1763 =(larry1762==larry996)
local larry1764 =larry1760["Parent"]
local larry1765 =(larry1764==larry14)
local larry1766 =larry1764["Parent"]
local larry1767 =(larry1766==larry996)
local larry1768 =larry1764["Parent"]
local larry1769 =(larry1768==larry14)
local larry1770 =larry1768["Parent"]
local larry1771 =(larry1770==larry996)
local larry1772 =larry1768["Parent"]
local larry1773 =(larry1772==larry14)
local larry1774 =larry1772["Parent"]
local larry1775 =(larry1774==larry996)
local larry1776 =larry1772["Parent"]
local larry1777 =(larry1776==larry14)
local larry1778 =larry1776["Parent"]
local larry1779 =(larry1778==larry996)
local larry1780 =larry1776["Parent"]
local larry1781 =(larry1780==larry14)
local larry1782 =larry1780["Parent"]
local larry1783 =(larry1782==larry996)
local larry1784 =larry1780["Parent"]
local larry1785 =(larry1784==larry14)
local larry1786 =larry1784["Parent"]
local larry1787 =(larry1786==larry996)
local larry1788 =larry1784["Parent"]
local larry1789 =(larry1788==larry14)
local larry1790 =larry1788["Parent"]
local larry1791 =(larry1790==larry996)
local larry1792 =larry1788["Parent"]
local larry1793 =(larry1792==larry14)
local larry1794 =larry1792["Parent"]
local larry1795 =(larry1794==larry996)
local larry1796 =larry1792["Parent"]
local larry1797 =(larry1796==larry14)
local larry1798 =larry1796["Parent"]
local larry1799 =(larry1798==larry996)
local larry1800 =larry1796["Parent"]
local larry1801 =(larry1800==larry14)
local larry1802 =larry1800["Parent"]
local larry1803 =(larry1802==larry996)
local larry1804 =larry1800["Parent"]
local larry1805 =(larry1804==larry14)
local larry1806 =larry1804["Parent"]
local larry1807 =(larry1806==larry996)
local larry1808 =larry1804["Parent"]
local larry1809 =(larry1808==larry14)
local larry1810 =larry1808["Parent"]
local larry1811 =(larry1810==larry996)
local larry1812 =larry1808["Parent"]
local larry1813 =(larry1812==larry14)
local larry1814 =larry1812["Parent"]
local larry1815 =(larry1814==larry996)
local larry1816 =larry1812["Parent"]
local larry1817 =(larry1816==larry14)
local larry1818 =larry1816["Parent"]
local larry1819 =(larry1818==larry996)
local larry1820 =larry1816["Parent"]
local larry1821 =(larry1820==larry14)
local larry1822 =larry1820["Parent"]
local larry1823 =(larry1822==larry996)
local larry1824 =larry1820["Parent"]
local larry1825 =(larry1824==larry14)
local larry1826 =larry1824["Parent"]
local larry1827 =(larry1826==larry996)
local larry1828 =larry1824["Parent"]
local larry1829 =(larry1828==larry14)
local larry1830 =larry1828["Parent"]
local larry1831 =(larry1830==larry996)
local larry1832 =larry1828["Parent"]
local larry1833 =(larry1832==larry14)
local larry1834 =larry1832["Parent"]
local larry1835 =(larry1834==larry996)
local larry1836 =larry1832["Parent"]
local larry1837 =(larry1836==larry14)
local larry1838 =larry1836["Parent"]
local larry1839 =(larry1838==larry996)
local larry1840 =larry1836["Parent"]
local larry1841 =(larry1840==larry14)
local larry1842 =larry1840["Parent"]
local larry1843 =(larry1842==larry996)
local larry1844 =larry1840["Parent"]
local larry1845 =(larry1844==larry14)
local larry1846 =larry1844["Parent"]
local larry1847 =(larry1846==larry996)
local larry1848 =larry1844["Parent"]
local larry1849 =(larry1848==larry14)
local larry1850 =larry1848["Parent"]
local larry1851 =(larry1850==larry996)
local larry1852 =larry1848["Parent"]
local larry1853 =(larry1852==larry14)
local larry1854 =larry1852["Parent"]
local larry1855 =(larry1854==larry996)
local larry1856 =larry1852["Parent"]
local larry1857 =(larry1856==larry14)
local larry1858 =larry1856["Parent"]
local larry1859 =(larry1858==larry996)
local larry1860 =larry1856["Parent"]
local larry1861 =(larry1860==larry14)
local larry1862 =larry1860["Parent"]
local larry1863 =(larry1862==larry996)
local larry1864 =larry1860["Parent"]
local larry1865 =(larry1864==larry14)
local larry1866 =larry1864["Parent"]
local larry1867 =(larry1866==larry996)
local larry1868 =larry1864["Parent"]
local larry1869 =(larry1868==larry14)
local larry1870 =larry1868["Parent"]
local larry1871 =(larry1870==larry996)
local larry1872 =larry1868["Parent"]
local larry1873 =(larry1872==larry14)
local larry1874 =larry1872["Parent"]
local larry1875 =(larry1874==larry996)
local larry1876 =larry1872["Parent"]
local larry1877 =(larry1876==larry14)
local larry1878 =larry1876["Parent"]
local larry1879 =(larry1878==larry996)
local larry1880 =larry1876["Parent"]
local larry1881 =(larry1880==larry14)
local larry1882 =larry1880["Parent"]
local larry1883 =(larry1882==larry996)
local larry1884 =larry1880["Parent"]
local larry1885 =(larry1884==larry14)
local larry1886 =larry1884["Parent"]
local larry1887 =(larry1886==larry996)
local larry1888 =larry1884["Parent"]
local larry1889 =(larry1888==larry14)
local larry1890 =larry1888["Parent"]
local larry1891 =(larry1890==larry996)
local larry1892 =larry1888["Parent"]
local larry1893 =(larry1892==larry14)
local larry1894 =larry1892["Parent"]
local larry1895 =(larry1894==larry996)
local larry1896 =larry1892["Parent"]
local larry1897 =(larry1896==larry14)
local larry1898 =larry1896["Parent"]
local larry1899 =(larry1898==larry996)
local larry1900 =larry1896["Parent"]
local larry1901 =(larry1900==larry14)
local larry1902 =larry1900["Parent"]
local larry1903 =(larry1902==larry996)
local larry1904 =larry1900["Parent"]
local larry1905 =(larry1904==larry14)
local larry1906 =larry1904["Parent"]
local larry1907 =(larry1906==larry996)
local larry1908 =larry1904["Parent"]
local larry1909 =(larry1908==larry14)
local larry1910 =larry1908["Parent"]
local larry1911 =(larry1910==larry996)
local larry1912 =larry1908["Parent"]
local larry1913 =(larry1912==larry14)
local larry1914 =larry1912["Parent"]
local larry1915 =(larry1914==larry996)
local larry1916 =larry1912["Parent"]
local larry1917 =(larry1916==larry14)
local larry1918 =larry1916["Parent"]
local larry1919 =(larry1918==larry996)
local larry1920 =larry1916["Parent"]
local larry1921 =(larry1920==larry14)
local larry1922 =larry1920["Parent"]
local larry1923 =(larry1922==larry996)
local larry1924 =larry1920["Parent"]
local larry1925 =(larry1924==larry14)
local larry1926 =larry1924["Parent"]
local larry1927 =(larry1926==larry996)
local larry1928 =larry1924["Parent"]
local larry1929 =(larry1928==larry14)
local larry1930 =larry1928["Parent"]
local larry1931 =(larry1930==larry996)
local larry1932 =larry1928["Parent"]
local larry1933 =(larry1932==larry14)
local larry1934 =larry1932["Parent"]
local larry1935 =(larry1934==larry996)
local larry1936 =larry1932["Parent"]
local larry1937 =(larry1936==larry14)
local larry1938 =larry1936["Parent"]
local larry1939 =(larry1938==larry996)
local larry1940 =larry1936["Parent"]
local larry1941 =(larry1940==larry14)
local larry1942 =larry1940["Parent"]
local larry1943 =(larry1942==larry996)
local larry1944 =larry1940["Parent"]
local larry1945 =(larry1944==larry14)
local larry1946 =larry1944["Parent"]
local larry1947 =(larry1946==larry996)
local larry1948 =larry1944["Parent"]
local larry1949 =(larry1948==larry14)
local larry1950 =larry1948["Parent"]
local larry1951 =(larry1950==larry996)
local larry1952 =larry1948["Parent"]
local larry1953 =(larry1952==larry14)
local larry1954 =larry1952["Parent"]
local larry1955 =(larry1954==larry996)
local larry1956 =larry1952["Parent"]
local larry1957 =(larry1956==larry14)
local larry1958 =larry1956["Parent"]
local larry1959 =(larry1958==larry996)
local larry1960 =larry1956["Parent"]
local larry1961 =(larry1960==larry14)
local larry1962 =larry1960["Parent"]
local larry1963 =(larry1962==larry996)
local larry1964 =larry1960["Parent"]
local larry1965 =(larry1964==larry14)
local larry1966 =larry1964["Parent"]
local larry1967 =(larry1966==larry996)
local larry1968 =larry1964["Parent"]
local larry1969 =(larry1968==larry14)
local larry1970 =larry1968["Parent"]
local larry1971 =(larry1970==larry996)
local larry1972 =larry1968["Parent"]
local larry1973 =(larry1972==larry14)
local larry1974 =larry1972["Parent"]
local larry1975 =(larry1974==larry996)
local larry1976 =larry1972["Parent"]
local larry1977 =(larry1976==larry14)
local larry1978 =larry1976["Parent"]
local larry1979 =(larry1978==larry996)
local larry1980 =larry1976["Parent"]
local larry1981 =(larry1980==larry14)
local larry1982 =larry1980["Parent"]
local larry1983 =(larry1982==larry996)
local larry1984 =larry1980["Parent"]
local larry1985 =(larry1984==larry14)
local larry1986 =larry1984["Parent"]
local larry1987 =(larry1986==larry996)
local larry1988 =larry1984["Parent"]
local larry1989 =(larry1988==larry14)
local larry1990 =larry1988["Parent"]
local larry1991 =(larry1990==larry996)
local larry1992 =larry1988["Parent"]
local larry1993 =(larry1992==larry14)
local larry1994 =larry1992["Parent"]
local larry1995 =(larry1994==larry996)
local larry1996 =larry1992["Parent"]
local larry1997 =(larry1996==larry14)
local larry1998 =larry1996["Parent"]
local larry1999 =(larry1998==larry996)
local larry2000 =larry1996["Parent"]
local larry2001 =(larry2000==larry14)
local larry2002 =larry2000["Parent"]
local larry2003 =(larry2002==larry996)
local larry2004 =larry2000["Parent"]
local larry2005 =(larry2004==larry14)
local larry2006 =larry2004["Parent"]
local larry2007 =(larry2006==larry996)
local larry2008 =larry2004["Parent"]
local larry2009 =(larry2008==larry14)
local larry2010 =larry2008["Parent"]
local larry2011 =(larry2010==larry996)
local larry2012 =larry2008["Parent"]
local larry2013 =(larry2012==larry14)
local larry2014 =larry2012["Parent"]
local larry2015 =(larry2014==larry996)
local larry2016 =larry2012["Parent"]
local larry2017 =(larry2016==larry14)
local larry2018 =larry2016["Parent"]
local larry2019 =(larry2018==larry996)
local larry2020 =larry2016["Parent"]
local larry2021 =(larry2020==larry14)
local larry2022 =larry2020["Parent"]
local larry2023 =(larry2022==larry996)
local larry2024 =larry2020["Parent"]
local larry2025 =(larry2024==larry14)
local larry2026 =larry2024["Parent"]
local larry2027 =(larry2026==larry996)
local larry2028 =larry2024["Parent"]
local larry2029 =(larry2028==larry14)
local larry2030 =larry2028["Parent"]
local larry2031 =(larry2030==larry996)
local larry2032 =larry2028["Parent"]
local larry2033 =(larry2032==larry14)
local larry2034 =larry2032["Parent"]
local larry2035 =(larry2034==larry996)
local larry2036 =larry2032["Parent"]
local larry2037 =(larry2036==larry14)
local larry2038 =larry2036["Parent"]
local larry2039 =(larry2038==larry996)
local larry2040 =larry2036["Parent"]
local larry2041 =(larry2040==larry14)
local larry2042 =larry2040["Parent"]
local larry2043 =(larry2042==larry996)
local larry2044 =larry2040["Parent"]
local larry2045 =(larry2044==larry14)
local larry2046 =larry2044["Parent"]
local larry2047 =(larry2046==larry996)
local larry2048 =larry2044["Parent"]
local larry2049 =(larry2048==larry14)
local larry2050 =larry2048["Parent"]
local larry2051 =(larry2050==larry996)
local larry2052 =larry2048["Parent"]
local larry2053 =(larry2052==larry14)
local larry2054 =larry2052["Parent"]
local larry2055 =(larry2054==larry996)
local larry2056 =larry2052["Parent"]
local larry2057 =(larry2056==larry14)
local larry2058 =larry2056["Parent"]
local larry2059 =(larry2058==larry996)
local larry2060 =larry2056["Parent"]
local larry2061 =(larry2060==larry14)
local larry2062 =larry2060["Parent"]
local larry2063 =(larry2062==larry996)
local larry2064 =larry2060["Parent"]
local larry2065 =(larry2064==larry14)
local larry2066 =larry2064["Parent"]
local larry2067 =(larry2066==larry996)
local larry2068 =larry2064["Parent"]
local larry2069 =(larry2068==larry14)
local larry2070 =larry2068["Parent"]
local larry2071 =(larry2070==larry996)
local larry2072 =larry2068["Parent"]
local larry2073 =(larry2072==larry14)
local larry2074 =larry2072["Parent"]
local larry2075 =(larry2074==larry996)
local larry2076 =larry2072["Parent"]
local larry2077 =(larry2076==larry14)
local larry2078 =larry2076["Parent"]
local larry2079 =(larry2078==larry996)
local larry2080 =larry2076["Parent"]
local larry2081 =(larry2080==larry14)
local larry2082 =larry2080["Parent"]
local larry2083 =(larry2082==larry996)
local larry2084 =larry2080["Parent"]
local larry2085 =(larry2084==larry14)
local larry2086 =larry2084["Parent"]
local larry2087 =(larry2086==larry996)
local larry2088 =larry2084["Parent"]
local larry2089 =(larry2088==larry14)
local larry2090 =larry2088["Parent"]
local larry2091 =(larry2090==larry996)
local larry2092 =larry2088["Parent"]
local larry2093 =(larry2092==larry14)
local larry2094 =larry2092["Parent"]
local larry2095 =(larry2094==larry996)
local larry2096 =larry2092["Parent"]
local larry2097 =(larry2096==larry14)
local larry2098 =larry2096["Parent"]
local larry2099 =(larry2098==larry996)
local larry2100 =larry2096["Parent"]
local larry2101 =(larry2100==larry14)
local larry2102 =larry2100["Parent"]
local larry2103 =(larry2102==larry996)
local larry2104 =larry2100["Parent"]
local larry2105 =(larry2104==larry14)
local larry2106 =larry2104["Parent"]
local larry2107 =(larry2106==larry996)
local larry2108 =larry2104["Parent"]
local larry2109 =(larry2108==larry14)
local larry2110 =larry2108["Parent"]
local larry2111 =(larry2110==larry996)
local larry2112 =larry2108["Parent"]
local larry2113 =(larry2112==larry14)
local larry2114 =larry2112["Parent"]
local larry2115 =(larry2114==larry996)
local larry2116 =larry2112["Parent"]
local larry2117 =(larry2116==larry14)
local larry2118 =larry2116["Parent"]
local larry2119 =(larry2118==larry996)
local larry2120 =larry2116["Parent"]
local larry2121 =(larry2120==larry14)
local larry2122 =larry2120["Parent"]
local larry2123 =(larry2122==larry996)
local larry2124 =larry2120["Parent"]
local larry2125 =(larry2124==larry14)
local larry2126 =larry2124["Parent"]
local larry2127 =(larry2126==larry996)
local larry2128 =larry2124["Parent"]
local larry2129 =(larry2128==larry14)
local larry2130 =larry2128["Parent"]
local larry2131 =(larry2130==larry996)
local larry2132 =larry2128["Parent"]
local larry2133 =(larry2132==larry14)
local larry2134 =larry2132["Parent"]
local larry2135 =(larry2134==larry996)
local larry2136 =larry2132["Parent"]
local larry2137 =(larry2136==larry14)
local larry2138 =larry2136["Parent"]
local larry2139 =(larry2138==larry996)
local larry2140 =larry2136["Parent"]
local larry2141 =(larry2140==larry14)
local larry2142 =larry2140["Parent"]
local larry2143 =(larry2142==larry996)
local larry2144 =larry2140["Parent"]
local larry2145 =(larry2144==larry14)
local larry2146 =larry2144["Parent"]
local larry2147 =(larry2146==larry996)
local larry2148 =larry2144["Parent"]
local larry2149 =(larry2148==larry14)
local larry2150 =larry2148["Parent"]
local larry2151 =(larry2150==larry996)
local larry2152 =larry2148["Parent"]
local larry2153 =(larry2152==larry14)
local larry2154 =larry2152["Parent"]
local larry2155 =(larry2154==larry996)
local larry2156 =larry2152["Parent"]
local larry2157 =(larry2156==larry14)
local larry2158 =larry2156["Parent"]
local larry2159 =(larry2158==larry996)
local larry2160 =larry2156["Parent"]
local larry2161 =(larry2160==larry14)
local larry2162 =larry2160["Parent"]
local larry2163 =(larry2162==larry996)
local larry2164 =larry2160["Parent"]
local larry2165 =(larry2164==larry14)
local larry2166 =larry2164["Parent"]
local larry2167 =(larry2166==larry996)
local larry2168 =larry2164["Parent"]
local larry2169 =(larry2168==larry14)
local larry2170 =larry2168["Parent"]
local larry2171 =(larry2170==larry996)
local larry2172 =larry2168["Parent"]
local larry2173 =(larry2172==larry14)
local larry2174 =larry2172["Parent"]
local larry2175 =(larry2174==larry996)
local larry2176 =larry2172["Parent"]
local larry2177 =(larry2176==larry14)
local larry2178 =larry2176["Parent"]
local larry2179 =(larry2178==larry996)
local larry2180 =larry2176["Parent"]
local larry2181 =(larry2180==larry14)
local larry2182 =larry2180["Parent"]
local larry2183 =(larry2182==larry996)
local larry2184 =larry2180["Parent"]
local larry2185 =(larry2184==larry14)
local larry2186 =larry2184["Parent"]
local larry2187 =(larry2186==larry996)
local larry2188 =larry2184["Parent"]
local larry2189 =(larry2188==larry14)
local larry2190 =larry2188["Parent"]
local larry2191 =(larry2190==larry996)
local larry2192 =larry2188["Parent"]
local larry2193 =(larry2192==larry14)
local larry2194 =larry2192["Parent"]
local larry2195 =(larry2194==larry996)
local larry2196 =larry2192["Parent"]
local larry2197 =(larry2196==larry14)
local larry2198 =larry2196["Parent"]
local larry2199 =(larry2198==larry996)
local larry2200 =larry2196["Parent"]
local larry2201 =(larry2200==larry14)
local larry2202 =larry2200["Parent"]
local larry2203 =(larry2202==larry996)
local er =error("Luraph Script:603: Luraph Script:300: Luraph Script:284: internal 542: <larry: infinitelooperror>")
end
end)
local larry2205 =larry25["Character"]
local larry2206 =larry2205["FindFirstChild"]
local larry2207 =larry2206(larry2205, "HumanoidRootPart")
local larry2208 =larry2207["Position"]
local larry2209 =larry803["Parent"]
local larry2210 =larry803["GetChildren"]
local larry2211 =larry2210(larry803)
for larry2212, _2212_2 in ipairs(larry2211) do
local larry2213 =_2212_2["Name"]
local larry2214 =_2212_2["Name"]
local larry2215, _2215_2, _2215_3 =string.lower(larry2214)
local larry2216, _2216_2, _2216_3 =string.find(larry2215, "All Seeing Sentry")
local larry2217 =_2212_2["GetAttribute"]
local larry2218 =larry2217(_2212_2, "OwnerId")
local larry2219 =_2212_2["GetAttribute"]
local larry2220 =larry2219(_2212_2, "ownerId")
local larry2221 =_2212_2["GetAttribute"]
local larry2222 =larry2221(_2212_2, "Owner")
local larry2223 =_2212_2["GetAttribute"]
local larry2224 =larry2223(_2212_2, "owner")
local larry2225 =_2212_2["GetAttribute"]
local larry2226 =larry2225(_2212_2, "PlayerUserId")
local larry2227 =_2212_2["GetAttribute"]
local larry2228 =larry2227(_2212_2, "UserId")
local larry2229 =_2212_2["GetAttribute"]
local larry2230 =larry2229(_2212_2, "CreatorId")
local larry2231 =_2212_2["GetAttribute"]
local larry2232 =larry2231(_2212_2, "PlacedByUserId")
local larry2233 =_2212_2["GetAttribute"]
local larry2234 =larry2233(_2212_2, "PlayerId")
local larry2235 =_2212_2["GetChildren"]
local larry2236 =larry2235(_2212_2)
for larry2237, _2237_2 in ipairs(larry2236) do
local larry2238 =_2237_2["IsA"]
local larry2239 =larry2238(_2237_2, "ObjectValue")
local larry2240 =_2237_2["Value"]
local larry2241 =_2237_2["Name"]
end
local larry2242 =_2212_2["Parent"]
local larry2243 =larry2242["GetAttribute"]
local larry2244 =larry2243(larry2242, "OwnerId")
local larry2245 =larry2242["GetAttribute"]
local larry2246 =larry2245(larry2242, "ownerId")
local larry2247 =larry2242["GetAttribute"]
local larry2248 =larry2247(larry2242, "Owner")
local larry2249 =larry2242["GetAttribute"]
local larry2250 =larry2249(larry2242, "owner")
local larry2251 =larry2242["GetAttribute"]
local larry2252 =larry2251(larry2242, "PlayerUserId")
local larry2253 =larry2242["GetAttribute"]
local larry2254 =larry2253(larry2242, "UserId")
local larry2255 =larry2242["GetAttribute"]
local larry2256 =larry2255(larry2242, "CreatorId")
local larry2257 =larry2242["GetAttribute"]
local larry2258 =larry2257(larry2242, "PlacedByUserId")
local larry2259 =larry2242["GetAttribute"]
local larry2260 =larry2259(larry2242, "PlayerId")
local larry2261 =larry2242["GetChildren"]
local larry2262 =larry2261(larry2242)
for larry2263, _2263_2 in ipairs(larry2262) do
local larry2264 =_2263_2["IsA"]
local larry2265 =larry2264(_2263_2, "ObjectValue")
local larry2266 =_2263_2["Value"]
local larry2267 =_2263_2["Name"]
end
local larry2268 =larry2242["Parent"]
local larry2269 =larry2268["GetAttribute"]
local larry2270 =larry2269(larry2268, "OwnerId")
local larry2271 =larry2268["GetAttribute"]
local larry2272 =larry2271(larry2268, "ownerId")
local larry2273 =larry2268["GetAttribute"]
local larry2274 =larry2273(larry2268, "Owner")
local larry2275 =larry2268["GetAttribute"]
local larry2276 =larry2275(larry2268, "owner")
local larry2277 =larry2268["GetAttribute"]
local larry2278 =larry2277(larry2268, "PlayerUserId")
local larry2279 =larry2268["GetAttribute"]
local larry2280 =larry2279(larry2268, "UserId")
local larry2281 =larry2268["GetAttribute"]
local larry2282 =larry2281(larry2268, "CreatorId")
local larry2283 =larry2268["GetAttribute"]
local larry2284 =larry2283(larry2268, "PlacedByUserId")
local larry2285 =larry2268["GetAttribute"]
local larry2286 =larry2285(larry2268, "PlayerId")
local larry2287 =larry2268["GetChildren"]
local larry2288 =larry2287(larry2268)
for larry2289, _2289_2 in ipairs(larry2288) do
local larry2290 =_2289_2["IsA"]
local larry2291 =larry2290(_2289_2, "ObjectValue")
local larry2292 =_2289_2["Value"]
local larry2293 =_2289_2["Name"]
end
local larry2294 =larry2268["Parent"]
local larry2295 =larry2294["GetAttribute"]
local larry2296 =larry2295(larry2294, "OwnerId")
local larry2297 =larry2294["GetAttribute"]
local larry2298 =larry2297(larry2294, "ownerId")
local larry2299 =larry2294["GetAttribute"]
local larry2300 =larry2299(larry2294, "Owner")
local larry2301 =larry2294["GetAttribute"]
local larry2302 =larry2301(larry2294, "owner")
local larry2303 =larry2294["GetAttribute"]
local larry2304 =larry2303(larry2294, "PlayerUserId")
local larry2305 =larry2294["GetAttribute"]
local larry2306 =larry2305(larry2294, "UserId")
local larry2307 =larry2294["GetAttribute"]
local larry2308 =larry2307(larry2294, "CreatorId")
local larry2309 =larry2294["GetAttribute"]
local larry2310 =larry2309(larry2294, "PlacedByUserId")
local larry2311 =larry2294["GetAttribute"]
local larry2312 =larry2311(larry2294, "PlayerId")
local larry2313 =larry2294["GetChildren"]
local larry2314 =larry2313(larry2294)
for larry2315, _2315_2 in ipairs(larry2314) do
local er =error("Luraph Script:1986: Luraph Script:632: Luraph Script:591: Luraph Script:337: Luraph Script:294: Luraph Script:202: internal 542: <larry: infinitelooperror>")
end
end
end)
local larry2317 =UDim2["new"]
local larry2318 =larry2317(0.43, 0, 0, 28)
local larry2319 =UDim2["new"]
local larry2320 =larry2319(0.52, 0, 0, 161)
local larry2321 =Enum["Font"]
local larry2322 =larry2321["Arcade"]
local larry2323 =Instance["new"]
local larry2324 =larry2323("TextButton")
local larry2325 =UDim["new"]
local larry2326 =larry2325(0, 6)
local larry2327 =Instance["new"]
local larry2328 =larry2327("UICorner")
local larry2329 =larry2324["MouseButton1Click"]
local larry2330 =larry2329["Connect"]
local larry2333 =task["delay"]
local larry2334 =larry2333(0.35, function(...)
local _2335_vararg1, _2335_vararg2, _2335_vararg3, _2335_vararg4, _2335_vararg5, _2335_vararg6, _2335_vararg7, _2335_vararg8, _2335_vararg9, _2335_vararg10 = ...

end)
local larry2336 =makefolder("MirandaTweenPlus")
local larry2337 =larry6["JSONEncode"]
local larry2338 =larry2337(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = true,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry2338)
local larry2339 =larry25["Character"]
local larry2340 =larry25["Character"]
local _ =task.wait(0.5)
local larry2341 =larry2340["FindFirstChild"]
local larry2342 =larry2341(larry2340, "Humanoid")
local larry2343 =larry2342["FindFirstChild"]
local larry2344 =larry2343(larry2342, "Animator")
local larry2345 =larry2342["Animator"]
local larry2346 =larry2345["GetPlayingAnimationTracks"]
local larry2347 =larry2346(larry2345)
local larry2349 =_2348_2["Stop"]
local larry2350 =larry2349(_2348_2)
local larry2351 =larry2342["Animator"]
local larry2352 =larry2351["AnimationPlayed"]
local larry2353 =larry2352["Connect"]
local larry2356 =_2355_vararg1["Stop"]
local larry2357 =larry2356(_2355_vararg1)
local larry2354 =larry2353(larry2352, function(...)
local _2355_vararg1, _2355_vararg2, _2355_vararg3, _2355_vararg4, _2355_vararg5, _2355_vararg6, _2355_vararg7, _2355_vararg8, _2355_vararg9, _2355_vararg10 = ...
local larry2356 =_2355_vararg1["Stop"]
local larry2357 =larry2356(_2355_vararg1)
end)
local larry2358 =larry25["CharacterAdded"]
local larry2359 =larry2358["Connect"]
local _ =task.wait(0.5)
local larry2362 =_2361_vararg1["FindFirstChild"]
local larry2363 =larry2362(_2361_vararg1, "Humanoid")
local larry2364 =larry2363["FindFirstChild"]
local larry2365 =larry2364(larry2363, "Animator")
local larry2366 =larry2363["Animator"]
local larry2367 =larry2366["GetPlayingAnimationTracks"]
local larry2368 =larry2367(larry2366)
local larry2370 =_2369_2["Stop"]
local larry2371 =larry2370(_2369_2)
local larry2372 =larry2363["Animator"]
local larry2373 =larry2372["AnimationPlayed"]
local larry2374 =larry2373["Connect"]
local larry2377 =_2376_vararg1["Stop"]
local larry2378 =larry2377(_2376_vararg1)
local larry2375 =larry2374(larry2373, function(...)
local _2376_vararg1, _2376_vararg2, _2376_vararg3, _2376_vararg4, _2376_vararg5, _2376_vararg6, _2376_vararg7, _2376_vararg8, _2376_vararg9, _2376_vararg10 = ...
local larry2377 =_2376_vararg1["Stop"]
local larry2378 =larry2377(_2376_vararg1)
end)
local larry2360 =larry2359(larry2358, function(...)
local _2361_vararg1, _2361_vararg2, _2361_vararg3, _2361_vararg4, _2361_vararg5, _2361_vararg6, _2361_vararg7, _2361_vararg8, _2361_vararg9, _2361_vararg10 = ...
local _ =task.wait(0.5)
local larry2362 =_2361_vararg1["FindFirstChild"]
local larry2363 =larry2362(_2361_vararg1, "Humanoid")
local larry2364 =larry2363["FindFirstChild"]
local larry2365 =larry2364(larry2363, "Animator")
local larry2366 =larry2363["Animator"]
local larry2367 =larry2366["GetPlayingAnimationTracks"]
local larry2368 =larry2367(larry2366)
for larry2369, _2369_2 in larry2368 do
local larry2370 =_2369_2["Stop"]
local larry2371 =larry2370(_2369_2)
end
local larry2372 =larry2363["Animator"]
local larry2373 =larry2372["AnimationPlayed"]
local larry2374 =larry2373["Connect"]
local larry2375 =larry2374(larry2373, function(...)
local _2376_vararg1, _2376_vararg2, _2376_vararg3, _2376_vararg4, _2376_vararg5, _2376_vararg6, _2376_vararg7, _2376_vararg8, _2376_vararg9, _2376_vararg10 = ...
local larry2377 =_2376_vararg1["Stop"]
local larry2378 =larry2377(_2376_vararg1)
end)
end)
local larry2331 =larry2330(larry2329, function(...)
local _2332_vararg1, _2332_vararg2, _2332_vararg3, _2332_vararg4, _2332_vararg5, _2332_vararg6, _2332_vararg7, _2332_vararg8, _2332_vararg9, _2332_vararg10 = ...
local larry2333 =task["delay"]
local larry2334 =larry2333(0.35, function(...)
local _2335_vararg1, _2335_vararg2, _2335_vararg3, _2335_vararg4, _2335_vararg5, _2335_vararg6, _2335_vararg7, _2335_vararg8, _2335_vararg9, _2335_vararg10 = ...

end)
local larry2336 =makefolder("MirandaTweenPlus")
local larry2337 =larry6["JSONEncode"]
local larry2338 =larry2337(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = true,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry2338)
local larry2339 =larry25["Character"]
local larry2340 =larry25["Character"]
local _ =task.wait(0.5)
local larry2341 =larry2340["FindFirstChild"]
local larry2342 =larry2341(larry2340, "Humanoid")
local larry2343 =larry2342["FindFirstChild"]
local larry2344 =larry2343(larry2342, "Animator")
local larry2345 =larry2342["Animator"]
local larry2346 =larry2345["GetPlayingAnimationTracks"]
local larry2347 =larry2346(larry2345)
for larry2348, _2348_2 in larry2347 do
local larry2349 =_2348_2["Stop"]
local larry2350 =larry2349(_2348_2)
end
local larry2351 =larry2342["Animator"]
local larry2352 =larry2351["AnimationPlayed"]
local larry2353 =larry2352["Connect"]
local larry2354 =larry2353(larry2352, function(...)
local _2355_vararg1, _2355_vararg2, _2355_vararg3, _2355_vararg4, _2355_vararg5, _2355_vararg6, _2355_vararg7, _2355_vararg8, _2355_vararg9, _2355_vararg10 = ...
local larry2356 =_2355_vararg1["Stop"]
local larry2357 =larry2356(_2355_vararg1)
end)
local larry2358 =larry25["CharacterAdded"]
local larry2359 =larry2358["Connect"]
local larry2360 =larry2359(larry2358, function(...)
local _2361_vararg1, _2361_vararg2, _2361_vararg3, _2361_vararg4, _2361_vararg5, _2361_vararg6, _2361_vararg7, _2361_vararg8, _2361_vararg9, _2361_vararg10 = ...
local _ =task.wait(0.5)
local larry2362 =_2361_vararg1["FindFirstChild"]
local larry2363 =larry2362(_2361_vararg1, "Humanoid")
local larry2364 =larry2363["FindFirstChild"]
local larry2365 =larry2364(larry2363, "Animator")
local larry2366 =larry2363["Animator"]
local larry2367 =larry2366["GetPlayingAnimationTracks"]
local larry2368 =larry2367(larry2366)
for larry2369, _2369_2 in larry2368 do
local larry2370 =_2369_2["Stop"]
local larry2371 =larry2370(_2369_2)
end
local larry2372 =larry2363["Animator"]
local larry2373 =larry2372["AnimationPlayed"]
local larry2374 =larry2373["Connect"]
local larry2375 =larry2374(larry2373, function(...)
local _2376_vararg1, _2376_vararg2, _2376_vararg3, _2376_vararg4, _2376_vararg5, _2376_vararg6, _2376_vararg7, _2376_vararg8, _2376_vararg9, _2376_vararg10 = ...
local larry2377 =_2376_vararg1["Stop"]
local larry2378 =larry2377(_2376_vararg1)
end)
end)
larry2324["BackgroundColor3"] =larry34
end)
local larry2380 =larry25["Character"]
local larry2381 =larry25["Character"]
local larry2382 =larry2381["GetChildren"]
local larry2383 =larry2382(larry2381)
local larry2385 =_2384_2["IsA"]
local larry2386 =larry2385(_2384_2, "BasePart")
local larry2387 =_2384_2["GetPropertyChangedSignal"]
local larry2388 =larry2387(_2384_2, "Anchored")
local larry2389 =larry2388["Connect"]
local larry2392 =_2384_2["Anchored"]
local larry2390 =larry2389(larry2388, function(...)
local _2391_vararg1, _2391_vararg2, _2391_vararg3, _2391_vararg4, _2391_vararg5, _2391_vararg6, _2391_vararg7, _2391_vararg8, _2391_vararg9, _2391_vararg10 = ...
local larry2392 =_2384_2["Anchored"]
end)
local larry2393 =_2384_2["ChildAdded"]
local larry2394 =larry2393["Connect"]
local larry2397 =_2396_vararg1["IsA"]
local larry2398 =larry2397(_2396_vararg1, "BallSocketConstraint")
local larry2399 =_2396_vararg1["Parent"]
local larry2400 =_2396_vararg1["Destroy"]
local larry2401 =larry2400(_2396_vararg1)
local larry2402 =larry25["Character"]
local larry2403 =larry25["Character"]
local larry2404 =larry2403["FindFirstChild"]
local larry2405 =larry2404(larry2403, "Humanoid")
local larry2406 =larry25["Character"]
local larry2407 =larry2406["Humanoid"]
local larry2408 =larry25["Character"]
local larry2409 =larry2408["FindFirstChild"]
local larry2410 =larry2409(larry2408, "HumanoidRootPart")
local larry2411 =larry2407["ChangeState"]
local larry2412 =Enum["HumanoidStateType"]
local larry2413 =larry2412["GettingUp"]
local larry2414 =larry2411(larry2407, larry2413)
local larry2415 =workspace["CurrentCamera"]
local larry2416 =_2384_2["FindFirstChildWhichIsA"]
local larry2417 =larry2416(_2384_2, "Motor6D")
local larry2418 =_2384_2["FindFirstChildWhichIsA"]
local larry2419 =larry2418(_2384_2, "Motor6D")
local larry2420 =larry25["PlayerScripts"]
local larry2421 =larry2420["PlayerModule"]
local larry2422 =larry2421["ControlModule"]
local larry2423 =require(larry2422)
local larry2424 =larry2423["Enable"]
local larry2425 =larry2424(larry2423)
local _ =task.wait()
local larry2426 =Vector3["new"]
local larry2427 =larry2426(0, 0, 0)
local _ =task.wait()
local larry2428 =Vector3["new"]
local larry2429 =larry2428(0, 0, 0)
local _ =task.wait()
local larry2430 =Vector3["new"]
local larry2431 =larry2430(0, 0, 0)
local _ =task.wait()
local larry2432 =Vector3["new"]
local larry2433 =larry2432(0, 0, 0)
local _ =task.wait()
local larry2434 =Vector3["new"]
local larry2435 =larry2434(0, 0, 0)
local _ =task.wait()
local larry2436 =Vector3["new"]
local larry2437 =larry2436(0, 0, 0)
local _ =task.wait()
local larry2438 =Vector3["new"]
local larry2439 =larry2438(0, 0, 0)
local _ =task.wait()
local larry2440 =Vector3["new"]
local larry2441 =larry2440(0, 0, 0)
local _ =task.wait()
local larry2442 =Vector3["new"]
local larry2443 =larry2442(0, 0, 0)
local _ =task.wait()
local larry2444 =Vector3["new"]
local larry2445 =larry2444(0, 0, 0)
local larry2395 =larry2394(larry2393, function(...)
local _2396_vararg1, _2396_vararg2, _2396_vararg3, _2396_vararg4, _2396_vararg5, _2396_vararg6, _2396_vararg7, _2396_vararg8, _2396_vararg9, _2396_vararg10 = ...
local larry2397 =_2396_vararg1["IsA"]
local larry2398 =larry2397(_2396_vararg1, "BallSocketConstraint")
local larry2399 =_2396_vararg1["Parent"]
local larry2400 =_2396_vararg1["Destroy"]
local larry2401 =larry2400(_2396_vararg1)
local larry2402 =larry25["Character"]
local larry2403 =larry25["Character"]
local larry2404 =larry2403["FindFirstChild"]
local larry2405 =larry2404(larry2403, "Humanoid")
local larry2406 =larry25["Character"]
local larry2407 =larry2406["Humanoid"]
local larry2408 =larry25["Character"]
local larry2409 =larry2408["FindFirstChild"]
local larry2410 =larry2409(larry2408, "HumanoidRootPart")
local larry2411 =larry2407["ChangeState"]
local larry2412 =Enum["HumanoidStateType"]
local larry2413 =larry2412["GettingUp"]
local larry2414 =larry2411(larry2407, larry2413)
larry2407["PlatformStand"] =false
local larry2415 =workspace["CurrentCamera"]
larry2415["CameraSubject"] =larry2407
larry2410["CanCollide"] =true
local larry2416 =_2384_2["FindFirstChildWhichIsA"]
local larry2417 =larry2416(_2384_2, "Motor6D")
local larry2418 =_2384_2["FindFirstChildWhichIsA"]
local larry2419 =larry2418(_2384_2, "Motor6D")
larry2419["Enabled"] =true
local larry2420 =larry25["PlayerScripts"]
local larry2421 =larry2420["PlayerModule"]
local larry2422 =larry2421["ControlModule"]
local larry2423 =require(larry2422)
local larry2424 =larry2423["Enable"]
local larry2425 =larry2424(larry2423)
local _ =task.wait()
local larry2426 =Vector3["new"]
local larry2427 =larry2426(0, 0, 0)
_2384_2["Velocity"] =larry2427
local _ =task.wait()
local larry2428 =Vector3["new"]
local larry2429 =larry2428(0, 0, 0)
_2384_2["Velocity"] =larry2429
local _ =task.wait()
local larry2430 =Vector3["new"]
local larry2431 =larry2430(0, 0, 0)
_2384_2["Velocity"] =larry2431
local _ =task.wait()
local larry2432 =Vector3["new"]
local larry2433 =larry2432(0, 0, 0)
_2384_2["Velocity"] =larry2433
local _ =task.wait()
local larry2434 =Vector3["new"]
local larry2435 =larry2434(0, 0, 0)
_2384_2["Velocity"] =larry2435
local _ =task.wait()
local larry2436 =Vector3["new"]
local larry2437 =larry2436(0, 0, 0)
_2384_2["Velocity"] =larry2437
local _ =task.wait()
local larry2438 =Vector3["new"]
local larry2439 =larry2438(0, 0, 0)
_2384_2["Velocity"] =larry2439
local _ =task.wait()
local larry2440 =Vector3["new"]
local larry2441 =larry2440(0, 0, 0)
_2384_2["Velocity"] =larry2441
local _ =task.wait()
local larry2442 =Vector3["new"]
local larry2443 =larry2442(0, 0, 0)
_2384_2["Velocity"] =larry2443
local _ =task.wait()
local larry2444 =Vector3["new"]
local larry2445 =larry2444(0, 0, 0)
_2384_2["Velocity"] =larry2445
end)
local larry2446 =larry2381["ChildAdded"]
local larry2447 =larry2446["Connect"]
local larry2450 =_2449_vararg1["IsA"]
local larry2451 =larry2450(_2449_vararg1, "BasePart")
local larry2452 =_2449_vararg1["GetPropertyChangedSignal"]
local larry2453 =larry2452(_2449_vararg1, "Anchored")
local larry2454 =larry2453["Connect"]
local larry2457 =_2449_vararg1["Anchored"]
local larry2455 =larry2454(larry2453, function(...)
local _2456_vararg1, _2456_vararg2, _2456_vararg3, _2456_vararg4, _2456_vararg5, _2456_vararg6, _2456_vararg7, _2456_vararg8, _2456_vararg9, _2456_vararg10 = ...
local larry2457 =_2449_vararg1["Anchored"]
end)
local larry2458 =_2449_vararg1["ChildAdded"]
local larry2459 =larry2458["Connect"]
local larry2462 =_2461_vararg1["IsA"]
local larry2463 =larry2462(_2461_vararg1, "BallSocketConstraint")
local larry2464 =_2461_vararg1["Parent"]
local larry2465 =_2461_vararg1["Destroy"]
local larry2466 =larry2465(_2461_vararg1)
local larry2467 =larry25["Character"]
local larry2468 =larry25["Character"]
local larry2469 =larry2468["FindFirstChild"]
local larry2470 =larry2469(larry2468, "Humanoid")
local larry2471 =larry25["Character"]
local larry2472 =larry2471["Humanoid"]
local larry2473 =larry25["Character"]
local larry2474 =larry2473["FindFirstChild"]
local larry2475 =larry2474(larry2473, "HumanoidRootPart")
local larry2476 =larry2472["ChangeState"]
local larry2477 =Enum["HumanoidStateType"]
local larry2478 =larry2477["GettingUp"]
local larry2479 =larry2476(larry2472, larry2478)
local larry2480 =workspace["CurrentCamera"]
local larry2481 =_2449_vararg1["FindFirstChildWhichIsA"]
local larry2482 =larry2481(_2449_vararg1, "Motor6D")
local larry2483 =_2449_vararg1["FindFirstChildWhichIsA"]
local larry2484 =larry2483(_2449_vararg1, "Motor6D")
local larry2485 =larry25["PlayerScripts"]
local larry2486 =larry2485["PlayerModule"]
local larry2487 =larry2486["ControlModule"]
local larry2488 =require(larry2487)
local larry2489 =larry2488["Enable"]
local larry2490 =larry2489(larry2488)
local _ =task.wait()
local larry2491 =Vector3["new"]
local larry2492 =larry2491(0, 0, 0)
local _ =task.wait()
local larry2493 =Vector3["new"]
local larry2494 =larry2493(0, 0, 0)
local _ =task.wait()
local larry2495 =Vector3["new"]
local larry2496 =larry2495(0, 0, 0)
local _ =task.wait()
local larry2497 =Vector3["new"]
local larry2498 =larry2497(0, 0, 0)
local _ =task.wait()
local larry2499 =Vector3["new"]
local larry2500 =larry2499(0, 0, 0)
local _ =task.wait()
local larry2501 =Vector3["new"]
local larry2502 =larry2501(0, 0, 0)
local _ =task.wait()
local larry2503 =Vector3["new"]
local larry2504 =larry2503(0, 0, 0)
local _ =task.wait()
local larry2505 =Vector3["new"]
local larry2506 =larry2505(0, 0, 0)
local _ =task.wait()
local larry2507 =Vector3["new"]
local larry2508 =larry2507(0, 0, 0)
local _ =task.wait()
local larry2509 =Vector3["new"]
local larry2510 =larry2509(0, 0, 0)
local larry2460 =larry2459(larry2458, function(...)
local _2461_vararg1, _2461_vararg2, _2461_vararg3, _2461_vararg4, _2461_vararg5, _2461_vararg6, _2461_vararg7, _2461_vararg8, _2461_vararg9, _2461_vararg10 = ...
local larry2462 =_2461_vararg1["IsA"]
local larry2463 =larry2462(_2461_vararg1, "BallSocketConstraint")
local larry2464 =_2461_vararg1["Parent"]
local larry2465 =_2461_vararg1["Destroy"]
local larry2466 =larry2465(_2461_vararg1)
local larry2467 =larry25["Character"]
local larry2468 =larry25["Character"]
local larry2469 =larry2468["FindFirstChild"]
local larry2470 =larry2469(larry2468, "Humanoid")
local larry2471 =larry25["Character"]
local larry2472 =larry2471["Humanoid"]
local larry2473 =larry25["Character"]
local larry2474 =larry2473["FindFirstChild"]
local larry2475 =larry2474(larry2473, "HumanoidRootPart")
local larry2476 =larry2472["ChangeState"]
local larry2477 =Enum["HumanoidStateType"]
local larry2478 =larry2477["GettingUp"]
local larry2479 =larry2476(larry2472, larry2478)
larry2472["PlatformStand"] =false
local larry2480 =workspace["CurrentCamera"]
larry2480["CameraSubject"] =larry2472
larry2475["CanCollide"] =true
local larry2481 =_2449_vararg1["FindFirstChildWhichIsA"]
local larry2482 =larry2481(_2449_vararg1, "Motor6D")
local larry2483 =_2449_vararg1["FindFirstChildWhichIsA"]
local larry2484 =larry2483(_2449_vararg1, "Motor6D")
larry2484["Enabled"] =true
local larry2485 =larry25["PlayerScripts"]
local larry2486 =larry2485["PlayerModule"]
local larry2487 =larry2486["ControlModule"]
local larry2488 =require(larry2487)
local larry2489 =larry2488["Enable"]
local larry2490 =larry2489(larry2488)
local _ =task.wait()
local larry2491 =Vector3["new"]
local larry2492 =larry2491(0, 0, 0)
_2449_vararg1["Velocity"] =larry2492
local _ =task.wait()
local larry2493 =Vector3["new"]
local larry2494 =larry2493(0, 0, 0)
_2449_vararg1["Velocity"] =larry2494
local _ =task.wait()
local larry2495 =Vector3["new"]
local larry2496 =larry2495(0, 0, 0)
_2449_vararg1["Velocity"] =larry2496
local _ =task.wait()
local larry2497 =Vector3["new"]
local larry2498 =larry2497(0, 0, 0)
_2449_vararg1["Velocity"] =larry2498
local _ =task.wait()
local larry2499 =Vector3["new"]
local larry2500 =larry2499(0, 0, 0)
_2449_vararg1["Velocity"] =larry2500
local _ =task.wait()
local larry2501 =Vector3["new"]
local larry2502 =larry2501(0, 0, 0)
_2449_vararg1["Velocity"] =larry2502
local _ =task.wait()
local larry2503 =Vector3["new"]
local larry2504 =larry2503(0, 0, 0)
_2449_vararg1["Velocity"] =larry2504
local _ =task.wait()
local larry2505 =Vector3["new"]
local larry2506 =larry2505(0, 0, 0)
_2449_vararg1["Velocity"] =larry2506
local _ =task.wait()
local larry2507 =Vector3["new"]
local larry2508 =larry2507(0, 0, 0)
_2449_vararg1["Velocity"] =larry2508
local _ =task.wait()
local larry2509 =Vector3["new"]
local larry2510 =larry2509(0, 0, 0)
_2449_vararg1["Velocity"] =larry2510
end)
local larry2448 =larry2447(larry2446, function(...)
local _2449_vararg1, _2449_vararg2, _2449_vararg3, _2449_vararg4, _2449_vararg5, _2449_vararg6, _2449_vararg7, _2449_vararg8, _2449_vararg9, _2449_vararg10 = ...
local larry2450 =_2449_vararg1["IsA"]
local larry2451 =larry2450(_2449_vararg1, "BasePart")
local larry2452 =_2449_vararg1["GetPropertyChangedSignal"]
local larry2453 =larry2452(_2449_vararg1, "Anchored")
local larry2454 =larry2453["Connect"]
local larry2455 =larry2454(larry2453, function(...)
local _2456_vararg1, _2456_vararg2, _2456_vararg3, _2456_vararg4, _2456_vararg5, _2456_vararg6, _2456_vararg7, _2456_vararg8, _2456_vararg9, _2456_vararg10 = ...
local larry2457 =_2449_vararg1["Anchored"]
end)
local larry2458 =_2449_vararg1["ChildAdded"]
local larry2459 =larry2458["Connect"]
local larry2460 =larry2459(larry2458, function(...)
local _2461_vararg1, _2461_vararg2, _2461_vararg3, _2461_vararg4, _2461_vararg5, _2461_vararg6, _2461_vararg7, _2461_vararg8, _2461_vararg9, _2461_vararg10 = ...
local larry2462 =_2461_vararg1["IsA"]
local larry2463 =larry2462(_2461_vararg1, "BallSocketConstraint")
local larry2464 =_2461_vararg1["Parent"]
local larry2465 =_2461_vararg1["Destroy"]
local larry2466 =larry2465(_2461_vararg1)
local larry2467 =larry25["Character"]
local larry2468 =larry25["Character"]
local larry2469 =larry2468["FindFirstChild"]
local larry2470 =larry2469(larry2468, "Humanoid")
local larry2471 =larry25["Character"]
local larry2472 =larry2471["Humanoid"]
local larry2473 =larry25["Character"]
local larry2474 =larry2473["FindFirstChild"]
local larry2475 =larry2474(larry2473, "HumanoidRootPart")
local larry2476 =larry2472["ChangeState"]
local larry2477 =Enum["HumanoidStateType"]
local larry2478 =larry2477["GettingUp"]
local larry2479 =larry2476(larry2472, larry2478)
larry2472["PlatformStand"] =false
local larry2480 =workspace["CurrentCamera"]
larry2480["CameraSubject"] =larry2472
larry2475["CanCollide"] =true
local larry2481 =_2449_vararg1["FindFirstChildWhichIsA"]
local larry2482 =larry2481(_2449_vararg1, "Motor6D")
local larry2483 =_2449_vararg1["FindFirstChildWhichIsA"]
local larry2484 =larry2483(_2449_vararg1, "Motor6D")
larry2484["Enabled"] =true
local larry2485 =larry25["PlayerScripts"]
local larry2486 =larry2485["PlayerModule"]
local larry2487 =larry2486["ControlModule"]
local larry2488 =require(larry2487)
local larry2489 =larry2488["Enable"]
local larry2490 =larry2489(larry2488)
local _ =task.wait()
local larry2491 =Vector3["new"]
local larry2492 =larry2491(0, 0, 0)
_2449_vararg1["Velocity"] =larry2492
local _ =task.wait()
local larry2493 =Vector3["new"]
local larry2494 =larry2493(0, 0, 0)
_2449_vararg1["Velocity"] =larry2494
local _ =task.wait()
local larry2495 =Vector3["new"]
local larry2496 =larry2495(0, 0, 0)
_2449_vararg1["Velocity"] =larry2496
local _ =task.wait()
local larry2497 =Vector3["new"]
local larry2498 =larry2497(0, 0, 0)
_2449_vararg1["Velocity"] =larry2498
local _ =task.wait()
local larry2499 =Vector3["new"]
local larry2500 =larry2499(0, 0, 0)
_2449_vararg1["Velocity"] =larry2500
local _ =task.wait()
local larry2501 =Vector3["new"]
local larry2502 =larry2501(0, 0, 0)
_2449_vararg1["Velocity"] =larry2502
local _ =task.wait()
local larry2503 =Vector3["new"]
local larry2504 =larry2503(0, 0, 0)
_2449_vararg1["Velocity"] =larry2504
local _ =task.wait()
local larry2505 =Vector3["new"]
local larry2506 =larry2505(0, 0, 0)
_2449_vararg1["Velocity"] =larry2506
local _ =task.wait()
local larry2507 =Vector3["new"]
local larry2508 =larry2507(0, 0, 0)
_2449_vararg1["Velocity"] =larry2508
local _ =task.wait()
local larry2509 =Vector3["new"]
local larry2510 =larry2509(0, 0, 0)
_2449_vararg1["Velocity"] =larry2510
end)
end)
local larry2511 =larry2381["FindFirstChildOfClass"]
local larry2512 =larry2511(larry2381, "Humanoid")
local larry2513 =larry2512["IsA"]
local larry2514 =larry2513(larry2512, "BasePart")
local larry2515 =larry2512["GetPropertyChangedSignal"]
local larry2516 =larry2515(larry2512, "Anchored")
local larry2517 =larry2516["Connect"]
local larry2520 =larry2512["Anchored"]
local larry2518 =larry2517(larry2516, function(...)
local _2519_vararg1, _2519_vararg2, _2519_vararg3, _2519_vararg4, _2519_vararg5, _2519_vararg6, _2519_vararg7, _2519_vararg8, _2519_vararg9, _2519_vararg10 = ...
local larry2520 =larry2512["Anchored"]
end)
local larry2521 =larry2512["ChildAdded"]
local larry2522 =larry2521["Connect"]
local larry2525 =_2524_vararg1["IsA"]
local larry2526 =larry2525(_2524_vararg1, "BallSocketConstraint")
local larry2527 =_2524_vararg1["Parent"]
local larry2528 =_2524_vararg1["Destroy"]
local larry2529 =larry2528(_2524_vararg1)
local larry2530 =larry25["Character"]
local larry2531 =larry25["Character"]
local larry2532 =larry2531["FindFirstChild"]
local larry2533 =larry2532(larry2531, "Humanoid")
local larry2534 =larry25["Character"]
local larry2535 =larry2534["Humanoid"]
local larry2536 =larry25["Character"]
local larry2537 =larry2536["FindFirstChild"]
local larry2538 =larry2537(larry2536, "HumanoidRootPart")
local larry2539 =larry2535["ChangeState"]
local larry2540 =Enum["HumanoidStateType"]
local larry2541 =larry2540["GettingUp"]
local larry2542 =larry2539(larry2535, larry2541)
local larry2543 =workspace["CurrentCamera"]
local larry2544 =larry2512["FindFirstChildWhichIsA"]
local larry2545 =larry2544(larry2512, "Motor6D")
local larry2546 =larry2512["FindFirstChildWhichIsA"]
local larry2547 =larry2546(larry2512, "Motor6D")
local larry2548 =larry25["PlayerScripts"]
local larry2549 =larry2548["PlayerModule"]
local larry2550 =larry2549["ControlModule"]
local larry2551 =require(larry2550)
local larry2552 =larry2551["Enable"]
local larry2553 =larry2552(larry2551)
local _ =task.wait()
local larry2554 =Vector3["new"]
local larry2555 =larry2554(0, 0, 0)
local _ =task.wait()
local larry2556 =Vector3["new"]
local larry2557 =larry2556(0, 0, 0)
local _ =task.wait()
local larry2558 =Vector3["new"]
local larry2559 =larry2558(0, 0, 0)
local _ =task.wait()
local larry2560 =Vector3["new"]
local larry2561 =larry2560(0, 0, 0)
local _ =task.wait()
local larry2562 =Vector3["new"]
local larry2563 =larry2562(0, 0, 0)
local _ =task.wait()
local larry2564 =Vector3["new"]
local larry2565 =larry2564(0, 0, 0)
local _ =task.wait()
local larry2566 =Vector3["new"]
local larry2567 =larry2566(0, 0, 0)
local _ =task.wait()
local larry2568 =Vector3["new"]
local larry2569 =larry2568(0, 0, 0)
local _ =task.wait()
local larry2570 =Vector3["new"]
local larry2571 =larry2570(0, 0, 0)
local _ =task.wait()
local larry2572 =Vector3["new"]
local larry2573 =larry2572(0, 0, 0)
local larry2523 =larry2522(larry2521, function(...)
local _2524_vararg1, _2524_vararg2, _2524_vararg3, _2524_vararg4, _2524_vararg5, _2524_vararg6, _2524_vararg7, _2524_vararg8, _2524_vararg9, _2524_vararg10 = ...
local larry2525 =_2524_vararg1["IsA"]
local larry2526 =larry2525(_2524_vararg1, "BallSocketConstraint")
local larry2527 =_2524_vararg1["Parent"]
local larry2528 =_2524_vararg1["Destroy"]
local larry2529 =larry2528(_2524_vararg1)
local larry2530 =larry25["Character"]
local larry2531 =larry25["Character"]
local larry2532 =larry2531["FindFirstChild"]
local larry2533 =larry2532(larry2531, "Humanoid")
local larry2534 =larry25["Character"]
local larry2535 =larry2534["Humanoid"]
local larry2536 =larry25["Character"]
local larry2537 =larry2536["FindFirstChild"]
local larry2538 =larry2537(larry2536, "HumanoidRootPart")
local larry2539 =larry2535["ChangeState"]
local larry2540 =Enum["HumanoidStateType"]
local larry2541 =larry2540["GettingUp"]
local larry2542 =larry2539(larry2535, larry2541)
larry2535["PlatformStand"] =false
local larry2543 =workspace["CurrentCamera"]
larry2543["CameraSubject"] =larry2535
larry2538["CanCollide"] =true
local larry2544 =larry2512["FindFirstChildWhichIsA"]
local larry2545 =larry2544(larry2512, "Motor6D")
local larry2546 =larry2512["FindFirstChildWhichIsA"]
local larry2547 =larry2546(larry2512, "Motor6D")
larry2547["Enabled"] =true
local larry2548 =larry25["PlayerScripts"]
local larry2549 =larry2548["PlayerModule"]
local larry2550 =larry2549["ControlModule"]
local larry2551 =require(larry2550)
local larry2552 =larry2551["Enable"]
local larry2553 =larry2552(larry2551)
local _ =task.wait()
local larry2554 =Vector3["new"]
local larry2555 =larry2554(0, 0, 0)
larry2512["Velocity"] =larry2555
local _ =task.wait()
local larry2556 =Vector3["new"]
local larry2557 =larry2556(0, 0, 0)
larry2512["Velocity"] =larry2557
local _ =task.wait()
local larry2558 =Vector3["new"]
local larry2559 =larry2558(0, 0, 0)
larry2512["Velocity"] =larry2559
local _ =task.wait()
local larry2560 =Vector3["new"]
local larry2561 =larry2560(0, 0, 0)
larry2512["Velocity"] =larry2561
local _ =task.wait()
local larry2562 =Vector3["new"]
local larry2563 =larry2562(0, 0, 0)
larry2512["Velocity"] =larry2563
local _ =task.wait()
local larry2564 =Vector3["new"]
local larry2565 =larry2564(0, 0, 0)
larry2512["Velocity"] =larry2565
local _ =task.wait()
local larry2566 =Vector3["new"]
local larry2567 =larry2566(0, 0, 0)
larry2512["Velocity"] =larry2567
local _ =task.wait()
local larry2568 =Vector3["new"]
local larry2569 =larry2568(0, 0, 0)
larry2512["Velocity"] =larry2569
local _ =task.wait()
local larry2570 =Vector3["new"]
local larry2571 =larry2570(0, 0, 0)
larry2512["Velocity"] =larry2571
local _ =task.wait()
local larry2572 =Vector3["new"]
local larry2573 =larry2572(0, 0, 0)
larry2512["Velocity"] =larry2573
end)
local larry2574 =larry25["CharacterAdded"]
local larry2575 =larry2574["Connect"]
local _ =task.wait(0.1)
local larry2578 =_2577_vararg1["GetChildren"]
local larry2579 =larry2578(_2577_vararg1)
local larry2581 =_2580_2["IsA"]
local larry2582 =larry2581(_2580_2, "BasePart")
local larry2583 =_2580_2["GetPropertyChangedSignal"]
local larry2584 =larry2583(_2580_2, "Anchored")
local larry2585 =larry2584["Connect"]
local larry2588 =_2580_2["Anchored"]
local larry2586 =larry2585(larry2584, function(...)
local _2587_vararg1, _2587_vararg2, _2587_vararg3, _2587_vararg4, _2587_vararg5, _2587_vararg6, _2587_vararg7, _2587_vararg8, _2587_vararg9, _2587_vararg10 = ...
local larry2588 =_2580_2["Anchored"]
end)
local larry2589 =_2580_2["ChildAdded"]
local larry2590 =larry2589["Connect"]
local larry2593 =_2592_vararg1["IsA"]
local larry2594 =larry2593(_2592_vararg1, "BallSocketConstraint")
local larry2595 =_2592_vararg1["Parent"]
local larry2596 =_2592_vararg1["Destroy"]
local larry2597 =larry2596(_2592_vararg1)
local larry2598 =larry25["Character"]
local larry2599 =larry25["Character"]
local larry2600 =larry2599["FindFirstChild"]
local larry2601 =larry2600(larry2599, "Humanoid")
local larry2602 =larry25["Character"]
local larry2603 =larry2602["Humanoid"]
local larry2604 =larry25["Character"]
local larry2605 =larry2604["FindFirstChild"]
local larry2606 =larry2605(larry2604, "HumanoidRootPart")
local larry2607 =larry2603["ChangeState"]
local larry2608 =Enum["HumanoidStateType"]
local larry2609 =larry2608["GettingUp"]
local larry2610 =larry2607(larry2603, larry2609)
local larry2611 =workspace["CurrentCamera"]
local larry2612 =_2580_2["FindFirstChildWhichIsA"]
local larry2613 =larry2612(_2580_2, "Motor6D")
local larry2614 =_2580_2["FindFirstChildWhichIsA"]
local larry2615 =larry2614(_2580_2, "Motor6D")
local larry2616 =larry25["PlayerScripts"]
local larry2617 =larry2616["PlayerModule"]
local larry2618 =larry2617["ControlModule"]
local larry2619 =require(larry2618)
local larry2620 =larry2619["Enable"]
local larry2621 =larry2620(larry2619)
local _ =task.wait()
local larry2622 =Vector3["new"]
local larry2623 =larry2622(0, 0, 0)
local _ =task.wait()
local larry2624 =Vector3["new"]
local larry2625 =larry2624(0, 0, 0)
local _ =task.wait()
local larry2626 =Vector3["new"]
local larry2627 =larry2626(0, 0, 0)
local _ =task.wait()
local larry2628 =Vector3["new"]
local larry2629 =larry2628(0, 0, 0)
local _ =task.wait()
local larry2630 =Vector3["new"]
local larry2631 =larry2630(0, 0, 0)
local _ =task.wait()
local larry2632 =Vector3["new"]
local larry2633 =larry2632(0, 0, 0)
local _ =task.wait()
local larry2634 =Vector3["new"]
local larry2635 =larry2634(0, 0, 0)
local _ =task.wait()
local larry2636 =Vector3["new"]
local larry2637 =larry2636(0, 0, 0)
local _ =task.wait()
local larry2638 =Vector3["new"]
local larry2639 =larry2638(0, 0, 0)
local _ =task.wait()
local larry2640 =Vector3["new"]
local larry2641 =larry2640(0, 0, 0)
local larry2591 =larry2590(larry2589, function(...)
local _2592_vararg1, _2592_vararg2, _2592_vararg3, _2592_vararg4, _2592_vararg5, _2592_vararg6, _2592_vararg7, _2592_vararg8, _2592_vararg9, _2592_vararg10 = ...
local larry2593 =_2592_vararg1["IsA"]
local larry2594 =larry2593(_2592_vararg1, "BallSocketConstraint")
local larry2595 =_2592_vararg1["Parent"]
local larry2596 =_2592_vararg1["Destroy"]
local larry2597 =larry2596(_2592_vararg1)
local larry2598 =larry25["Character"]
local larry2599 =larry25["Character"]
local larry2600 =larry2599["FindFirstChild"]
local larry2601 =larry2600(larry2599, "Humanoid")
local larry2602 =larry25["Character"]
local larry2603 =larry2602["Humanoid"]
local larry2604 =larry25["Character"]
local larry2605 =larry2604["FindFirstChild"]
local larry2606 =larry2605(larry2604, "HumanoidRootPart")
local larry2607 =larry2603["ChangeState"]
local larry2608 =Enum["HumanoidStateType"]
local larry2609 =larry2608["GettingUp"]
local larry2610 =larry2607(larry2603, larry2609)
larry2603["PlatformStand"] =false
local larry2611 =workspace["CurrentCamera"]
larry2611["CameraSubject"] =larry2603
larry2606["CanCollide"] =true
local larry2612 =_2580_2["FindFirstChildWhichIsA"]
local larry2613 =larry2612(_2580_2, "Motor6D")
local larry2614 =_2580_2["FindFirstChildWhichIsA"]
local larry2615 =larry2614(_2580_2, "Motor6D")
larry2615["Enabled"] =true
local larry2616 =larry25["PlayerScripts"]
local larry2617 =larry2616["PlayerModule"]
local larry2618 =larry2617["ControlModule"]
local larry2619 =require(larry2618)
local larry2620 =larry2619["Enable"]
local larry2621 =larry2620(larry2619)
local _ =task.wait()
local larry2622 =Vector3["new"]
local larry2623 =larry2622(0, 0, 0)
_2580_2["Velocity"] =larry2623
local _ =task.wait()
local larry2624 =Vector3["new"]
local larry2625 =larry2624(0, 0, 0)
_2580_2["Velocity"] =larry2625
local _ =task.wait()
local larry2626 =Vector3["new"]
local larry2627 =larry2626(0, 0, 0)
_2580_2["Velocity"] =larry2627
local _ =task.wait()
local larry2628 =Vector3["new"]
local larry2629 =larry2628(0, 0, 0)
_2580_2["Velocity"] =larry2629
local _ =task.wait()
local larry2630 =Vector3["new"]
local larry2631 =larry2630(0, 0, 0)
_2580_2["Velocity"] =larry2631
local _ =task.wait()
local larry2632 =Vector3["new"]
local larry2633 =larry2632(0, 0, 0)
_2580_2["Velocity"] =larry2633
local _ =task.wait()
local larry2634 =Vector3["new"]
local larry2635 =larry2634(0, 0, 0)
_2580_2["Velocity"] =larry2635
local _ =task.wait()
local larry2636 =Vector3["new"]
local larry2637 =larry2636(0, 0, 0)
_2580_2["Velocity"] =larry2637
local _ =task.wait()
local larry2638 =Vector3["new"]
local larry2639 =larry2638(0, 0, 0)
_2580_2["Velocity"] =larry2639
local _ =task.wait()
local larry2640 =Vector3["new"]
local larry2641 =larry2640(0, 0, 0)
_2580_2["Velocity"] =larry2641
end)
local larry2642 =_2577_vararg1["ChildAdded"]
local larry2643 =larry2642["Connect"]
local larry2646 =_2645_vararg1["IsA"]
local larry2647 =larry2646(_2645_vararg1, "BasePart")
local larry2648 =_2645_vararg1["GetPropertyChangedSignal"]
local larry2649 =larry2648(_2645_vararg1, "Anchored")
local larry2650 =larry2649["Connect"]
local larry2653 =_2645_vararg1["Anchored"]
local larry2651 =larry2650(larry2649, function(...)
local _2652_vararg1, _2652_vararg2, _2652_vararg3, _2652_vararg4, _2652_vararg5, _2652_vararg6, _2652_vararg7, _2652_vararg8, _2652_vararg9, _2652_vararg10 = ...
local larry2653 =_2645_vararg1["Anchored"]
end)
local larry2654 =_2645_vararg1["ChildAdded"]
local larry2655 =larry2654["Connect"]
local larry2658 =_2657_vararg1["IsA"]
local larry2659 =larry2658(_2657_vararg1, "BallSocketConstraint")
local larry2660 =_2657_vararg1["Parent"]
local larry2661 =_2657_vararg1["Destroy"]
local larry2662 =larry2661(_2657_vararg1)
local larry2663 =larry25["Character"]
local larry2664 =larry25["Character"]
local larry2665 =larry2664["FindFirstChild"]
local larry2666 =larry2665(larry2664, "Humanoid")
local larry2667 =larry25["Character"]
local larry2668 =larry2667["Humanoid"]
local larry2669 =larry25["Character"]
local larry2670 =larry2669["FindFirstChild"]
local larry2671 =larry2670(larry2669, "HumanoidRootPart")
local larry2672 =larry2668["ChangeState"]
local larry2673 =Enum["HumanoidStateType"]
local larry2674 =larry2673["GettingUp"]
local larry2675 =larry2672(larry2668, larry2674)
local larry2676 =workspace["CurrentCamera"]
local larry2677 =_2645_vararg1["FindFirstChildWhichIsA"]
local larry2678 =larry2677(_2645_vararg1, "Motor6D")
local larry2679 =_2645_vararg1["FindFirstChildWhichIsA"]
local larry2680 =larry2679(_2645_vararg1, "Motor6D")
local larry2681 =larry25["PlayerScripts"]
local larry2682 =larry2681["PlayerModule"]
local larry2683 =larry2682["ControlModule"]
local larry2684 =require(larry2683)
local larry2685 =larry2684["Enable"]
local larry2686 =larry2685(larry2684)
local _ =task.wait()
local larry2687 =Vector3["new"]
local larry2688 =larry2687(0, 0, 0)
local _ =task.wait()
local larry2689 =Vector3["new"]
local larry2690 =larry2689(0, 0, 0)
local _ =task.wait()
local larry2691 =Vector3["new"]
local larry2692 =larry2691(0, 0, 0)
local _ =task.wait()
local larry2693 =Vector3["new"]
local larry2694 =larry2693(0, 0, 0)
local _ =task.wait()
local larry2695 =Vector3["new"]
local larry2696 =larry2695(0, 0, 0)
local _ =task.wait()
local larry2697 =Vector3["new"]
local larry2698 =larry2697(0, 0, 0)
local _ =task.wait()
local larry2699 =Vector3["new"]
local larry2700 =larry2699(0, 0, 0)
local _ =task.wait()
local larry2701 =Vector3["new"]
local larry2702 =larry2701(0, 0, 0)
local _ =task.wait()
local larry2703 =Vector3["new"]
local larry2704 =larry2703(0, 0, 0)
local _ =task.wait()
local larry2705 =Vector3["new"]
local larry2706 =larry2705(0, 0, 0)
local larry2656 =larry2655(larry2654, function(...)
local _2657_vararg1, _2657_vararg2, _2657_vararg3, _2657_vararg4, _2657_vararg5, _2657_vararg6, _2657_vararg7, _2657_vararg8, _2657_vararg9, _2657_vararg10 = ...
local larry2658 =_2657_vararg1["IsA"]
local larry2659 =larry2658(_2657_vararg1, "BallSocketConstraint")
local larry2660 =_2657_vararg1["Parent"]
local larry2661 =_2657_vararg1["Destroy"]
local larry2662 =larry2661(_2657_vararg1)
local larry2663 =larry25["Character"]
local larry2664 =larry25["Character"]
local larry2665 =larry2664["FindFirstChild"]
local larry2666 =larry2665(larry2664, "Humanoid")
local larry2667 =larry25["Character"]
local larry2668 =larry2667["Humanoid"]
local larry2669 =larry25["Character"]
local larry2670 =larry2669["FindFirstChild"]
local larry2671 =larry2670(larry2669, "HumanoidRootPart")
local larry2672 =larry2668["ChangeState"]
local larry2673 =Enum["HumanoidStateType"]
local larry2674 =larry2673["GettingUp"]
local larry2675 =larry2672(larry2668, larry2674)
larry2668["PlatformStand"] =false
local larry2676 =workspace["CurrentCamera"]
larry2676["CameraSubject"] =larry2668
larry2671["CanCollide"] =true
local larry2677 =_2645_vararg1["FindFirstChildWhichIsA"]
local larry2678 =larry2677(_2645_vararg1, "Motor6D")
local larry2679 =_2645_vararg1["FindFirstChildWhichIsA"]
local larry2680 =larry2679(_2645_vararg1, "Motor6D")
larry2680["Enabled"] =true
local larry2681 =larry25["PlayerScripts"]
local larry2682 =larry2681["PlayerModule"]
local larry2683 =larry2682["ControlModule"]
local larry2684 =require(larry2683)
local larry2685 =larry2684["Enable"]
local larry2686 =larry2685(larry2684)
local _ =task.wait()
local larry2687 =Vector3["new"]
local larry2688 =larry2687(0, 0, 0)
_2645_vararg1["Velocity"] =larry2688
local _ =task.wait()
local larry2689 =Vector3["new"]
local larry2690 =larry2689(0, 0, 0)
_2645_vararg1["Velocity"] =larry2690
local _ =task.wait()
local larry2691 =Vector3["new"]
local larry2692 =larry2691(0, 0, 0)
_2645_vararg1["Velocity"] =larry2692
local _ =task.wait()
local larry2693 =Vector3["new"]
local larry2694 =larry2693(0, 0, 0)
_2645_vararg1["Velocity"] =larry2694
local _ =task.wait()
local larry2695 =Vector3["new"]
local larry2696 =larry2695(0, 0, 0)
_2645_vararg1["Velocity"] =larry2696
local _ =task.wait()
local larry2697 =Vector3["new"]
local larry2698 =larry2697(0, 0, 0)
_2645_vararg1["Velocity"] =larry2698
local _ =task.wait()
local larry2699 =Vector3["new"]
local larry2700 =larry2699(0, 0, 0)
_2645_vararg1["Velocity"] =larry2700
local _ =task.wait()
local larry2701 =Vector3["new"]
local larry2702 =larry2701(0, 0, 0)
_2645_vararg1["Velocity"] =larry2702
local _ =task.wait()
local larry2703 =Vector3["new"]
local larry2704 =larry2703(0, 0, 0)
_2645_vararg1["Velocity"] =larry2704
local _ =task.wait()
local larry2705 =Vector3["new"]
local larry2706 =larry2705(0, 0, 0)
_2645_vararg1["Velocity"] =larry2706
end)
local larry2644 =larry2643(larry2642, function(...)
local _2645_vararg1, _2645_vararg2, _2645_vararg3, _2645_vararg4, _2645_vararg5, _2645_vararg6, _2645_vararg7, _2645_vararg8, _2645_vararg9, _2645_vararg10 = ...
local larry2646 =_2645_vararg1["IsA"]
local larry2647 =larry2646(_2645_vararg1, "BasePart")
local larry2648 =_2645_vararg1["GetPropertyChangedSignal"]
local larry2649 =larry2648(_2645_vararg1, "Anchored")
local larry2650 =larry2649["Connect"]
local larry2651 =larry2650(larry2649, function(...)
local _2652_vararg1, _2652_vararg2, _2652_vararg3, _2652_vararg4, _2652_vararg5, _2652_vararg6, _2652_vararg7, _2652_vararg8, _2652_vararg9, _2652_vararg10 = ...
local larry2653 =_2645_vararg1["Anchored"]
end)
local larry2654 =_2645_vararg1["ChildAdded"]
local larry2655 =larry2654["Connect"]
local larry2656 =larry2655(larry2654, function(...)
local _2657_vararg1, _2657_vararg2, _2657_vararg3, _2657_vararg4, _2657_vararg5, _2657_vararg6, _2657_vararg7, _2657_vararg8, _2657_vararg9, _2657_vararg10 = ...
local larry2658 =_2657_vararg1["IsA"]
local larry2659 =larry2658(_2657_vararg1, "BallSocketConstraint")
local larry2660 =_2657_vararg1["Parent"]
local larry2661 =_2657_vararg1["Destroy"]
local larry2662 =larry2661(_2657_vararg1)
local larry2663 =larry25["Character"]
local larry2664 =larry25["Character"]
local larry2665 =larry2664["FindFirstChild"]
local larry2666 =larry2665(larry2664, "Humanoid")
local larry2667 =larry25["Character"]
local larry2668 =larry2667["Humanoid"]
local larry2669 =larry25["Character"]
local larry2670 =larry2669["FindFirstChild"]
local larry2671 =larry2670(larry2669, "HumanoidRootPart")
local larry2672 =larry2668["ChangeState"]
local larry2673 =Enum["HumanoidStateType"]
local larry2674 =larry2673["GettingUp"]
local larry2675 =larry2672(larry2668, larry2674)
larry2668["PlatformStand"] =false
local larry2676 =workspace["CurrentCamera"]
larry2676["CameraSubject"] =larry2668
larry2671["CanCollide"] =true
local larry2677 =_2645_vararg1["FindFirstChildWhichIsA"]
local larry2678 =larry2677(_2645_vararg1, "Motor6D")
local larry2679 =_2645_vararg1["FindFirstChildWhichIsA"]
local larry2680 =larry2679(_2645_vararg1, "Motor6D")
larry2680["Enabled"] =true
local larry2681 =larry25["PlayerScripts"]
local larry2682 =larry2681["PlayerModule"]
local larry2683 =larry2682["ControlModule"]
local larry2684 =require(larry2683)
local larry2685 =larry2684["Enable"]
local larry2686 =larry2685(larry2684)
local _ =task.wait()
local larry2687 =Vector3["new"]
local larry2688 =larry2687(0, 0, 0)
_2645_vararg1["Velocity"] =larry2688
local _ =task.wait()
local larry2689 =Vector3["new"]
local larry2690 =larry2689(0, 0, 0)
_2645_vararg1["Velocity"] =larry2690
local _ =task.wait()
local larry2691 =Vector3["new"]
local larry2692 =larry2691(0, 0, 0)
_2645_vararg1["Velocity"] =larry2692
local _ =task.wait()
local larry2693 =Vector3["new"]
local larry2694 =larry2693(0, 0, 0)
_2645_vararg1["Velocity"] =larry2694
local _ =task.wait()
local larry2695 =Vector3["new"]
local larry2696 =larry2695(0, 0, 0)
_2645_vararg1["Velocity"] =larry2696
local _ =task.wait()
local larry2697 =Vector3["new"]
local larry2698 =larry2697(0, 0, 0)
_2645_vararg1["Velocity"] =larry2698
local _ =task.wait()
local larry2699 =Vector3["new"]
local larry2700 =larry2699(0, 0, 0)
_2645_vararg1["Velocity"] =larry2700
local _ =task.wait()
local larry2701 =Vector3["new"]
local larry2702 =larry2701(0, 0, 0)
_2645_vararg1["Velocity"] =larry2702
local _ =task.wait()
local larry2703 =Vector3["new"]
local larry2704 =larry2703(0, 0, 0)
_2645_vararg1["Velocity"] =larry2704
local _ =task.wait()
local larry2705 =Vector3["new"]
local larry2706 =larry2705(0, 0, 0)
_2645_vararg1["Velocity"] =larry2706
end)
end)
local larry2707 =_2577_vararg1["FindFirstChildOfClass"]
local larry2708 =larry2707(_2577_vararg1, "Humanoid")
local larry2709 =larry2708["IsA"]
local larry2710 =larry2709(larry2708, "BasePart")
local larry2711 =larry2708["GetPropertyChangedSignal"]
local larry2712 =larry2711(larry2708, "Anchored")
local larry2713 =larry2712["Connect"]
local larry2716 =larry2708["Anchored"]
local larry2714 =larry2713(larry2712, function(...)
local _2715_vararg1, _2715_vararg2, _2715_vararg3, _2715_vararg4, _2715_vararg5, _2715_vararg6, _2715_vararg7, _2715_vararg8, _2715_vararg9, _2715_vararg10 = ...
local larry2716 =larry2708["Anchored"]
end)
local larry2717 =larry2708["ChildAdded"]
local larry2718 =larry2717["Connect"]
local larry2721 =_2720_vararg1["IsA"]
local larry2722 =larry2721(_2720_vararg1, "BallSocketConstraint")
local larry2723 =_2720_vararg1["Parent"]
local larry2724 =_2720_vararg1["Destroy"]
local larry2725 =larry2724(_2720_vararg1)
local larry2726 =larry25["Character"]
local larry2727 =larry25["Character"]
local larry2728 =larry2727["FindFirstChild"]
local larry2729 =larry2728(larry2727, "Humanoid")
local larry2730 =larry25["Character"]
local larry2731 =larry2730["Humanoid"]
local larry2732 =larry25["Character"]
local larry2733 =larry2732["FindFirstChild"]
local larry2734 =larry2733(larry2732, "HumanoidRootPart")
local larry2735 =larry2731["ChangeState"]
local larry2736 =Enum["HumanoidStateType"]
local larry2737 =larry2736["GettingUp"]
local larry2738 =larry2735(larry2731, larry2737)
local larry2739 =workspace["CurrentCamera"]
local larry2740 =larry2708["FindFirstChildWhichIsA"]
local larry2741 =larry2740(larry2708, "Motor6D")
local larry2742 =larry2708["FindFirstChildWhichIsA"]
local larry2743 =larry2742(larry2708, "Motor6D")
local larry2744 =larry25["PlayerScripts"]
local larry2745 =larry2744["PlayerModule"]
local larry2746 =larry2745["ControlModule"]
local larry2747 =require(larry2746)
local larry2748 =larry2747["Enable"]
local larry2749 =larry2748(larry2747)
local _ =task.wait()
local larry2750 =Vector3["new"]
local larry2751 =larry2750(0, 0, 0)
local _ =task.wait()
local larry2752 =Vector3["new"]
local larry2753 =larry2752(0, 0, 0)
local _ =task.wait()
local larry2754 =Vector3["new"]
local larry2755 =larry2754(0, 0, 0)
local _ =task.wait()
local larry2756 =Vector3["new"]
local larry2757 =larry2756(0, 0, 0)
local _ =task.wait()
local larry2758 =Vector3["new"]
local larry2759 =larry2758(0, 0, 0)
local _ =task.wait()
local larry2760 =Vector3["new"]
local larry2761 =larry2760(0, 0, 0)
local _ =task.wait()
local larry2762 =Vector3["new"]
local larry2763 =larry2762(0, 0, 0)
local _ =task.wait()
local larry2764 =Vector3["new"]
local larry2765 =larry2764(0, 0, 0)
local _ =task.wait()
local larry2766 =Vector3["new"]
local larry2767 =larry2766(0, 0, 0)
local _ =task.wait()
local larry2768 =Vector3["new"]
local larry2769 =larry2768(0, 0, 0)
local larry2719 =larry2718(larry2717, function(...)
local _2720_vararg1, _2720_vararg2, _2720_vararg3, _2720_vararg4, _2720_vararg5, _2720_vararg6, _2720_vararg7, _2720_vararg8, _2720_vararg9, _2720_vararg10 = ...
local larry2721 =_2720_vararg1["IsA"]
local larry2722 =larry2721(_2720_vararg1, "BallSocketConstraint")
local larry2723 =_2720_vararg1["Parent"]
local larry2724 =_2720_vararg1["Destroy"]
local larry2725 =larry2724(_2720_vararg1)
local larry2726 =larry25["Character"]
local larry2727 =larry25["Character"]
local larry2728 =larry2727["FindFirstChild"]
local larry2729 =larry2728(larry2727, "Humanoid")
local larry2730 =larry25["Character"]
local larry2731 =larry2730["Humanoid"]
local larry2732 =larry25["Character"]
local larry2733 =larry2732["FindFirstChild"]
local larry2734 =larry2733(larry2732, "HumanoidRootPart")
local larry2735 =larry2731["ChangeState"]
local larry2736 =Enum["HumanoidStateType"]
local larry2737 =larry2736["GettingUp"]
local larry2738 =larry2735(larry2731, larry2737)
larry2731["PlatformStand"] =false
local larry2739 =workspace["CurrentCamera"]
larry2739["CameraSubject"] =larry2731
larry2734["CanCollide"] =true
local larry2740 =larry2708["FindFirstChildWhichIsA"]
local larry2741 =larry2740(larry2708, "Motor6D")
local larry2742 =larry2708["FindFirstChildWhichIsA"]
local larry2743 =larry2742(larry2708, "Motor6D")
larry2743["Enabled"] =true
local larry2744 =larry25["PlayerScripts"]
local larry2745 =larry2744["PlayerModule"]
local larry2746 =larry2745["ControlModule"]
local larry2747 =require(larry2746)
local larry2748 =larry2747["Enable"]
local larry2749 =larry2748(larry2747)
local _ =task.wait()
local larry2750 =Vector3["new"]
local larry2751 =larry2750(0, 0, 0)
larry2708["Velocity"] =larry2751
local _ =task.wait()
local larry2752 =Vector3["new"]
local larry2753 =larry2752(0, 0, 0)
larry2708["Velocity"] =larry2753
local _ =task.wait()
local larry2754 =Vector3["new"]
local larry2755 =larry2754(0, 0, 0)
larry2708["Velocity"] =larry2755
local _ =task.wait()
local larry2756 =Vector3["new"]
local larry2757 =larry2756(0, 0, 0)
larry2708["Velocity"] =larry2757
local _ =task.wait()
local larry2758 =Vector3["new"]
local larry2759 =larry2758(0, 0, 0)
larry2708["Velocity"] =larry2759
local _ =task.wait()
local larry2760 =Vector3["new"]
local larry2761 =larry2760(0, 0, 0)
larry2708["Velocity"] =larry2761
local _ =task.wait()
local larry2762 =Vector3["new"]
local larry2763 =larry2762(0, 0, 0)
larry2708["Velocity"] =larry2763
local _ =task.wait()
local larry2764 =Vector3["new"]
local larry2765 =larry2764(0, 0, 0)
larry2708["Velocity"] =larry2765
local _ =task.wait()
local larry2766 =Vector3["new"]
local larry2767 =larry2766(0, 0, 0)
larry2708["Velocity"] =larry2767
local _ =task.wait()
local larry2768 =Vector3["new"]
local larry2769 =larry2768(0, 0, 0)
larry2708["Velocity"] =larry2769
end)
local larry2576 =larry2575(larry2574, function(...)
local _2577_vararg1, _2577_vararg2, _2577_vararg3, _2577_vararg4, _2577_vararg5, _2577_vararg6, _2577_vararg7, _2577_vararg8, _2577_vararg9, _2577_vararg10 = ...
local _ =task.wait(0.1)
local larry2578 =_2577_vararg1["GetChildren"]
local larry2579 =larry2578(_2577_vararg1)
for larry2580, _2580_2 in pairs(larry2579) do
local larry2581 =_2580_2["IsA"]
local larry2582 =larry2581(_2580_2, "BasePart")
local larry2583 =_2580_2["GetPropertyChangedSignal"]
local larry2584 =larry2583(_2580_2, "Anchored")
local larry2585 =larry2584["Connect"]
local larry2586 =larry2585(larry2584, function(...)
local _2587_vararg1, _2587_vararg2, _2587_vararg3, _2587_vararg4, _2587_vararg5, _2587_vararg6, _2587_vararg7, _2587_vararg8, _2587_vararg9, _2587_vararg10 = ...
local larry2588 =_2580_2["Anchored"]
end)
local larry2589 =_2580_2["ChildAdded"]
local larry2590 =larry2589["Connect"]
local larry2591 =larry2590(larry2589, function(...)
local _2592_vararg1, _2592_vararg2, _2592_vararg3, _2592_vararg4, _2592_vararg5, _2592_vararg6, _2592_vararg7, _2592_vararg8, _2592_vararg9, _2592_vararg10 = ...
local larry2593 =_2592_vararg1["IsA"]
local larry2594 =larry2593(_2592_vararg1, "BallSocketConstraint")
local larry2595 =_2592_vararg1["Parent"]
local larry2596 =_2592_vararg1["Destroy"]
local larry2597 =larry2596(_2592_vararg1)
local larry2598 =larry25["Character"]
local larry2599 =larry25["Character"]
local larry2600 =larry2599["FindFirstChild"]
local larry2601 =larry2600(larry2599, "Humanoid")
local larry2602 =larry25["Character"]
local larry2603 =larry2602["Humanoid"]
local larry2604 =larry25["Character"]
local larry2605 =larry2604["FindFirstChild"]
local larry2606 =larry2605(larry2604, "HumanoidRootPart")
local larry2607 =larry2603["ChangeState"]
local larry2608 =Enum["HumanoidStateType"]
local larry2609 =larry2608["GettingUp"]
local larry2610 =larry2607(larry2603, larry2609)
larry2603["PlatformStand"] =false
local larry2611 =workspace["CurrentCamera"]
larry2611["CameraSubject"] =larry2603
larry2606["CanCollide"] =true
local larry2612 =_2580_2["FindFirstChildWhichIsA"]
local larry2613 =larry2612(_2580_2, "Motor6D")
local larry2614 =_2580_2["FindFirstChildWhichIsA"]
local larry2615 =larry2614(_2580_2, "Motor6D")
larry2615["Enabled"] =true
local larry2616 =larry25["PlayerScripts"]
local larry2617 =larry2616["PlayerModule"]
local larry2618 =larry2617["ControlModule"]
local larry2619 =require(larry2618)
local larry2620 =larry2619["Enable"]
local larry2621 =larry2620(larry2619)
local _ =task.wait()
local larry2622 =Vector3["new"]
local larry2623 =larry2622(0, 0, 0)
_2580_2["Velocity"] =larry2623
local _ =task.wait()
local larry2624 =Vector3["new"]
local larry2625 =larry2624(0, 0, 0)
_2580_2["Velocity"] =larry2625
local _ =task.wait()
local larry2626 =Vector3["new"]
local larry2627 =larry2626(0, 0, 0)
_2580_2["Velocity"] =larry2627
local _ =task.wait()
local larry2628 =Vector3["new"]
local larry2629 =larry2628(0, 0, 0)
_2580_2["Velocity"] =larry2629
local _ =task.wait()
local larry2630 =Vector3["new"]
local larry2631 =larry2630(0, 0, 0)
_2580_2["Velocity"] =larry2631
local _ =task.wait()
local larry2632 =Vector3["new"]
local larry2633 =larry2632(0, 0, 0)
_2580_2["Velocity"] =larry2633
local _ =task.wait()
local larry2634 =Vector3["new"]
local larry2635 =larry2634(0, 0, 0)
_2580_2["Velocity"] =larry2635
local _ =task.wait()
local larry2636 =Vector3["new"]
local larry2637 =larry2636(0, 0, 0)
_2580_2["Velocity"] =larry2637
local _ =task.wait()
local larry2638 =Vector3["new"]
local larry2639 =larry2638(0, 0, 0)
_2580_2["Velocity"] =larry2639
local _ =task.wait()
local larry2640 =Vector3["new"]
local larry2641 =larry2640(0, 0, 0)
_2580_2["Velocity"] =larry2641
end)
end
local larry2642 =_2577_vararg1["ChildAdded"]
local larry2643 =larry2642["Connect"]
local larry2644 =larry2643(larry2642, function(...)
local _2645_vararg1, _2645_vararg2, _2645_vararg3, _2645_vararg4, _2645_vararg5, _2645_vararg6, _2645_vararg7, _2645_vararg8, _2645_vararg9, _2645_vararg10 = ...
local larry2646 =_2645_vararg1["IsA"]
local larry2647 =larry2646(_2645_vararg1, "BasePart")
local larry2648 =_2645_vararg1["GetPropertyChangedSignal"]
local larry2649 =larry2648(_2645_vararg1, "Anchored")
local larry2650 =larry2649["Connect"]
local larry2651 =larry2650(larry2649, function(...)
local _2652_vararg1, _2652_vararg2, _2652_vararg3, _2652_vararg4, _2652_vararg5, _2652_vararg6, _2652_vararg7, _2652_vararg8, _2652_vararg9, _2652_vararg10 = ...
local larry2653 =_2645_vararg1["Anchored"]
end)
local larry2654 =_2645_vararg1["ChildAdded"]
local larry2655 =larry2654["Connect"]
local larry2656 =larry2655(larry2654, function(...)
local _2657_vararg1, _2657_vararg2, _2657_vararg3, _2657_vararg4, _2657_vararg5, _2657_vararg6, _2657_vararg7, _2657_vararg8, _2657_vararg9, _2657_vararg10 = ...
local larry2658 =_2657_vararg1["IsA"]
local larry2659 =larry2658(_2657_vararg1, "BallSocketConstraint")
local larry2660 =_2657_vararg1["Parent"]
local larry2661 =_2657_vararg1["Destroy"]
local larry2662 =larry2661(_2657_vararg1)
local larry2663 =larry25["Character"]
local larry2664 =larry25["Character"]
local larry2665 =larry2664["FindFirstChild"]
local larry2666 =larry2665(larry2664, "Humanoid")
local larry2667 =larry25["Character"]
local larry2668 =larry2667["Humanoid"]
local larry2669 =larry25["Character"]
local larry2670 =larry2669["FindFirstChild"]
local larry2671 =larry2670(larry2669, "HumanoidRootPart")
local larry2672 =larry2668["ChangeState"]
local larry2673 =Enum["HumanoidStateType"]
local larry2674 =larry2673["GettingUp"]
local larry2675 =larry2672(larry2668, larry2674)
larry2668["PlatformStand"] =false
local larry2676 =workspace["CurrentCamera"]
larry2676["CameraSubject"] =larry2668
larry2671["CanCollide"] =true
local larry2677 =_2645_vararg1["FindFirstChildWhichIsA"]
local larry2678 =larry2677(_2645_vararg1, "Motor6D")
local larry2679 =_2645_vararg1["FindFirstChildWhichIsA"]
local larry2680 =larry2679(_2645_vararg1, "Motor6D")
larry2680["Enabled"] =true
local larry2681 =larry25["PlayerScripts"]
local larry2682 =larry2681["PlayerModule"]
local larry2683 =larry2682["ControlModule"]
local larry2684 =require(larry2683)
local larry2685 =larry2684["Enable"]
local larry2686 =larry2685(larry2684)
local _ =task.wait()
local larry2687 =Vector3["new"]
local larry2688 =larry2687(0, 0, 0)
_2645_vararg1["Velocity"] =larry2688
local _ =task.wait()
local larry2689 =Vector3["new"]
local larry2690 =larry2689(0, 0, 0)
_2645_vararg1["Velocity"] =larry2690
local _ =task.wait()
local larry2691 =Vector3["new"]
local larry2692 =larry2691(0, 0, 0)
_2645_vararg1["Velocity"] =larry2692
local _ =task.wait()
local larry2693 =Vector3["new"]
local larry2694 =larry2693(0, 0, 0)
_2645_vararg1["Velocity"] =larry2694
local _ =task.wait()
local larry2695 =Vector3["new"]
local larry2696 =larry2695(0, 0, 0)
_2645_vararg1["Velocity"] =larry2696
local _ =task.wait()
local larry2697 =Vector3["new"]
local larry2698 =larry2697(0, 0, 0)
_2645_vararg1["Velocity"] =larry2698
local _ =task.wait()
local larry2699 =Vector3["new"]
local larry2700 =larry2699(0, 0, 0)
_2645_vararg1["Velocity"] =larry2700
local _ =task.wait()
local larry2701 =Vector3["new"]
local larry2702 =larry2701(0, 0, 0)
_2645_vararg1["Velocity"] =larry2702
local _ =task.wait()
local larry2703 =Vector3["new"]
local larry2704 =larry2703(0, 0, 0)
_2645_vararg1["Velocity"] =larry2704
local _ =task.wait()
local larry2705 =Vector3["new"]
local larry2706 =larry2705(0, 0, 0)
_2645_vararg1["Velocity"] =larry2706
end)
end)
local larry2707 =_2577_vararg1["FindFirstChildOfClass"]
local larry2708 =larry2707(_2577_vararg1, "Humanoid")
local larry2709 =larry2708["IsA"]
local larry2710 =larry2709(larry2708, "BasePart")
local larry2711 =larry2708["GetPropertyChangedSignal"]
local larry2712 =larry2711(larry2708, "Anchored")
local larry2713 =larry2712["Connect"]
local larry2714 =larry2713(larry2712, function(...)
local _2715_vararg1, _2715_vararg2, _2715_vararg3, _2715_vararg4, _2715_vararg5, _2715_vararg6, _2715_vararg7, _2715_vararg8, _2715_vararg9, _2715_vararg10 = ...
local larry2716 =larry2708["Anchored"]
end)
local larry2717 =larry2708["ChildAdded"]
local larry2718 =larry2717["Connect"]
local larry2719 =larry2718(larry2717, function(...)
local _2720_vararg1, _2720_vararg2, _2720_vararg3, _2720_vararg4, _2720_vararg5, _2720_vararg6, _2720_vararg7, _2720_vararg8, _2720_vararg9, _2720_vararg10 = ...
local larry2721 =_2720_vararg1["IsA"]
local larry2722 =larry2721(_2720_vararg1, "BallSocketConstraint")
local larry2723 =_2720_vararg1["Parent"]
local larry2724 =_2720_vararg1["Destroy"]
local larry2725 =larry2724(_2720_vararg1)
local larry2726 =larry25["Character"]
local larry2727 =larry25["Character"]
local larry2728 =larry2727["FindFirstChild"]
local larry2729 =larry2728(larry2727, "Humanoid")
local larry2730 =larry25["Character"]
local larry2731 =larry2730["Humanoid"]
local larry2732 =larry25["Character"]
local larry2733 =larry2732["FindFirstChild"]
local larry2734 =larry2733(larry2732, "HumanoidRootPart")
local larry2735 =larry2731["ChangeState"]
local larry2736 =Enum["HumanoidStateType"]
local larry2737 =larry2736["GettingUp"]
local larry2738 =larry2735(larry2731, larry2737)
larry2731["PlatformStand"] =false
local larry2739 =workspace["CurrentCamera"]
larry2739["CameraSubject"] =larry2731
larry2734["CanCollide"] =true
local larry2740 =larry2708["FindFirstChildWhichIsA"]
local larry2741 =larry2740(larry2708, "Motor6D")
local larry2742 =larry2708["FindFirstChildWhichIsA"]
local larry2743 =larry2742(larry2708, "Motor6D")
larry2743["Enabled"] =true
local larry2744 =larry25["PlayerScripts"]
local larry2745 =larry2744["PlayerModule"]
local larry2746 =larry2745["ControlModule"]
local larry2747 =require(larry2746)
local larry2748 =larry2747["Enable"]
local larry2749 =larry2748(larry2747)
local _ =task.wait()
local larry2750 =Vector3["new"]
local larry2751 =larry2750(0, 0, 0)
larry2708["Velocity"] =larry2751
local _ =task.wait()
local larry2752 =Vector3["new"]
local larry2753 =larry2752(0, 0, 0)
larry2708["Velocity"] =larry2753
local _ =task.wait()
local larry2754 =Vector3["new"]
local larry2755 =larry2754(0, 0, 0)
larry2708["Velocity"] =larry2755
local _ =task.wait()
local larry2756 =Vector3["new"]
local larry2757 =larry2756(0, 0, 0)
larry2708["Velocity"] =larry2757
local _ =task.wait()
local larry2758 =Vector3["new"]
local larry2759 =larry2758(0, 0, 0)
larry2708["Velocity"] =larry2759
local _ =task.wait()
local larry2760 =Vector3["new"]
local larry2761 =larry2760(0, 0, 0)
larry2708["Velocity"] =larry2761
local _ =task.wait()
local larry2762 =Vector3["new"]
local larry2763 =larry2762(0, 0, 0)
larry2708["Velocity"] =larry2763
local _ =task.wait()
local larry2764 =Vector3["new"]
local larry2765 =larry2764(0, 0, 0)
larry2708["Velocity"] =larry2765
local _ =task.wait()
local larry2766 =Vector3["new"]
local larry2767 =larry2766(0, 0, 0)
larry2708["Velocity"] =larry2767
local _ =task.wait()
local larry2768 =Vector3["new"]
local larry2769 =larry2768(0, 0, 0)
larry2708["Velocity"] =larry2769
end)
end)
local larry2771 =larry2390["Disconnect"]
local larry2772 =larry2771(larry2390)
local larry2773 =larry2395["Disconnect"]
local larry2774 =larry2773(larry2395)
local larry2775 =larry2455["Disconnect"]
local larry2776 =larry2775(larry2455)
local larry2777 =larry2460["Disconnect"]
local larry2778 =larry2777(larry2460)
local larry2779 =larry2448["Disconnect"]
local larry2780 =larry2779(larry2448)
local larry2781 =larry2518["Disconnect"]
local larry2782 =larry2781(larry2518)
local larry2783 =larry2523["Disconnect"]
local larry2784 =larry2783(larry2523)
local larry2785 =larry2586["Disconnect"]
local larry2786 =larry2785(larry2586)
local larry2787 =larry2591["Disconnect"]
local larry2788 =larry2787(larry2591)
local larry2789 =larry2651["Disconnect"]
local larry2790 =larry2789(larry2651)
local larry2791 =larry2656["Disconnect"]
local larry2792 =larry2791(larry2656)
local larry2793 =larry2644["Disconnect"]
local larry2794 =larry2793(larry2644)
local larry2795 =larry2714["Disconnect"]
local larry2796 =larry2795(larry2714)
local larry2797 =larry2719["Disconnect"]
local larry2798 =larry2797(larry2719)
local larry2799 =larry2576["Disconnect"]
local larry2800 =larry2799(larry2576)
local larry2801 =game["Players"]
local larry2802 =larry2801["PlayerAdded"]
local larry2803 =larry2802["Connect"]
local larry2806 =_2805_vararg1["CharacterAdded"]
local larry2807 =larry2806["Connect"]
local larry2808 =larry2807(larry2806, function(...)
local _2809_vararg1, _2809_vararg2, _2809_vararg3, _2809_vararg4, _2809_vararg5, _2809_vararg6, _2809_vararg7, _2809_vararg8, _2809_vararg9, _2809_vararg10 = ...
local larry2810 =(_2805_vararg1==larry25)
end)
local larry2804 =larry2803(larry2802, function(...)
local _2805_vararg1, _2805_vararg2, _2805_vararg3, _2805_vararg4, _2805_vararg5, _2805_vararg6, _2805_vararg7, _2805_vararg8, _2805_vararg9, _2805_vararg10 = ...
local larry2806 =_2805_vararg1["CharacterAdded"]
local larry2807 =larry2806["Connect"]
local larry2808 =larry2807(larry2806, function(...)
local _2809_vararg1, _2809_vararg2, _2809_vararg3, _2809_vararg4, _2809_vararg5, _2809_vararg6, _2809_vararg7, _2809_vararg8, _2809_vararg9, _2809_vararg10 = ...
local larry2810 =(_2805_vararg1==larry25)
end)
end)
local larry2811 =larry25["CharacterAdded"]
local larry2812 =larry2811["Connect"]
local larry2813 =larry2812(larry2811, function(...)
local _2814_vararg1, _2814_vararg2, _2814_vararg3, _2814_vararg4, _2814_vararg5, _2814_vararg6, _2814_vararg7, _2814_vararg8, _2814_vararg9, _2814_vararg10 = ...

end)
local larry2815 =UDim2["new"]
local larry2816 =larry2815(0.43, 0, 0, 28)
local larry2817 =UDim2["new"]
local larry2818 =larry2817(0.05, 0, 0, 193)
local larry2819 =Enum["Font"]
local larry2820 =larry2819["Arcade"]
local larry2821 =Instance["new"]
local larry2822 =larry2821("TextButton")
local larry2823 =UDim["new"]
local larry2824 =larry2823(0, 6)
local larry2825 =Instance["new"]
local larry2826 =larry2825("UICorner")
local larry2827 =larry2822["MouseButton1Click"]
local larry2828 =larry2827["Connect"]
local larry2831 =task["delay"]
local larry2832 =larry2831(0.35, function(...)
local _2833_vararg1, _2833_vararg2, _2833_vararg3, _2833_vararg4, _2833_vararg5, _2833_vararg6, _2833_vararg7, _2833_vararg8, _2833_vararg9, _2833_vararg10 = ...

end)
local larry2834 =makefolder("MirandaTweenPlus")
local larry2835 =larry6["JSONEncode"]
local larry2836 =larry2835(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = true,
  ["antiRagdoll"] = true,
})
local _ =writefile("MirandaTweenPlus/config.json", larry2836)
local larry2837 =larry25["Character"]
local larry2838 =larry25["Character"]
local larry2839 =larry2838["GetChildren"]
local larry2840 =larry2839(larry2838)
local larry2842 =_2841_2["IsA"]
local larry2843 =larry2842(_2841_2, "BasePart")
local larry2844 =_2841_2["GetPropertyChangedSignal"]
local larry2845 =larry2844(_2841_2, "Anchored")
local larry2846 =larry2845["Connect"]
local larry2849 =_2841_2["Anchored"]
local larry2847 =larry2846(larry2845, function(...)
local _2848_vararg1, _2848_vararg2, _2848_vararg3, _2848_vararg4, _2848_vararg5, _2848_vararg6, _2848_vararg7, _2848_vararg8, _2848_vararg9, _2848_vararg10 = ...
local larry2849 =_2841_2["Anchored"]
_2841_2["Anchored"] =false
end)
local larry2850 =_2841_2["ChildAdded"]
local larry2851 =larry2850["Connect"]
local larry2854 =_2853_vararg1["IsA"]
local larry2855 =larry2854(_2853_vararg1, "BallSocketConstraint")
local larry2856 =_2853_vararg1["Parent"]
local larry2857 =_2853_vararg1["Destroy"]
local larry2858 =larry2857(_2853_vararg1)
local larry2859 =larry25["Character"]
local larry2860 =larry25["Character"]
local larry2861 =larry2860["FindFirstChild"]
local larry2862 =larry2861(larry2860, "Humanoid")
local larry2863 =larry25["Character"]
local larry2864 =larry2863["Humanoid"]
local larry2865 =larry25["Character"]
local larry2866 =larry2865["FindFirstChild"]
local larry2867 =larry2866(larry2865, "HumanoidRootPart")
local larry2868 =larry2864["ChangeState"]
local larry2869 =Enum["HumanoidStateType"]
local larry2870 =larry2869["GettingUp"]
local larry2871 =larry2868(larry2864, larry2870)
local larry2872 =workspace["CurrentCamera"]
local larry2873 =_2841_2["FindFirstChildWhichIsA"]
local larry2874 =larry2873(_2841_2, "Motor6D")
local larry2875 =_2841_2["FindFirstChildWhichIsA"]
local larry2876 =larry2875(_2841_2, "Motor6D")
local larry2877 =larry25["PlayerScripts"]
local larry2878 =larry2877["PlayerModule"]
local larry2879 =larry2878["ControlModule"]
local larry2880 =require(larry2879)
local larry2881 =larry2880["Enable"]
local larry2882 =larry2881(larry2880)
local _ =task.wait()
local larry2883 =Vector3["new"]
local larry2884 =larry2883(0, 0, 0)
local _ =task.wait()
local larry2885 =Vector3["new"]
local larry2886 =larry2885(0, 0, 0)
local _ =task.wait()
local larry2887 =Vector3["new"]
local larry2888 =larry2887(0, 0, 0)
local _ =task.wait()
local larry2889 =Vector3["new"]
local larry2890 =larry2889(0, 0, 0)
local _ =task.wait()
local larry2891 =Vector3["new"]
local larry2892 =larry2891(0, 0, 0)
local _ =task.wait()
local larry2893 =Vector3["new"]
local larry2894 =larry2893(0, 0, 0)
local _ =task.wait()
local larry2895 =Vector3["new"]
local larry2896 =larry2895(0, 0, 0)
local _ =task.wait()
local larry2897 =Vector3["new"]
local larry2898 =larry2897(0, 0, 0)
local _ =task.wait()
local larry2899 =Vector3["new"]
local larry2900 =larry2899(0, 0, 0)
local _ =task.wait()
local larry2901 =Vector3["new"]
local larry2902 =larry2901(0, 0, 0)
local larry2852 =larry2851(larry2850, function(...)
local _2853_vararg1, _2853_vararg2, _2853_vararg3, _2853_vararg4, _2853_vararg5, _2853_vararg6, _2853_vararg7, _2853_vararg8, _2853_vararg9, _2853_vararg10 = ...
local larry2854 =_2853_vararg1["IsA"]
local larry2855 =larry2854(_2853_vararg1, "BallSocketConstraint")
local larry2856 =_2853_vararg1["Parent"]
local larry2857 =_2853_vararg1["Destroy"]
local larry2858 =larry2857(_2853_vararg1)
local larry2859 =larry25["Character"]
local larry2860 =larry25["Character"]
local larry2861 =larry2860["FindFirstChild"]
local larry2862 =larry2861(larry2860, "Humanoid")
local larry2863 =larry25["Character"]
local larry2864 =larry2863["Humanoid"]
local larry2865 =larry25["Character"]
local larry2866 =larry2865["FindFirstChild"]
local larry2867 =larry2866(larry2865, "HumanoidRootPart")
local larry2868 =larry2864["ChangeState"]
local larry2869 =Enum["HumanoidStateType"]
local larry2870 =larry2869["GettingUp"]
local larry2871 =larry2868(larry2864, larry2870)
larry2864["PlatformStand"] =false
local larry2872 =workspace["CurrentCamera"]
larry2872["CameraSubject"] =larry2864
larry2867["CanCollide"] =true
local larry2873 =_2841_2["FindFirstChildWhichIsA"]
local larry2874 =larry2873(_2841_2, "Motor6D")
local larry2875 =_2841_2["FindFirstChildWhichIsA"]
local larry2876 =larry2875(_2841_2, "Motor6D")
larry2876["Enabled"] =true
local larry2877 =larry25["PlayerScripts"]
local larry2878 =larry2877["PlayerModule"]
local larry2879 =larry2878["ControlModule"]
local larry2880 =require(larry2879)
local larry2881 =larry2880["Enable"]
local larry2882 =larry2881(larry2880)
local _ =task.wait()
local larry2883 =Vector3["new"]
local larry2884 =larry2883(0, 0, 0)
_2841_2["Velocity"] =larry2884
local _ =task.wait()
local larry2885 =Vector3["new"]
local larry2886 =larry2885(0, 0, 0)
_2841_2["Velocity"] =larry2886
local _ =task.wait()
local larry2887 =Vector3["new"]
local larry2888 =larry2887(0, 0, 0)
_2841_2["Velocity"] =larry2888
local _ =task.wait()
local larry2889 =Vector3["new"]
local larry2890 =larry2889(0, 0, 0)
_2841_2["Velocity"] =larry2890
local _ =task.wait()
local larry2891 =Vector3["new"]
local larry2892 =larry2891(0, 0, 0)
_2841_2["Velocity"] =larry2892
local _ =task.wait()
local larry2893 =Vector3["new"]
local larry2894 =larry2893(0, 0, 0)
_2841_2["Velocity"] =larry2894
local _ =task.wait()
local larry2895 =Vector3["new"]
local larry2896 =larry2895(0, 0, 0)
_2841_2["Velocity"] =larry2896
local _ =task.wait()
local larry2897 =Vector3["new"]
local larry2898 =larry2897(0, 0, 0)
_2841_2["Velocity"] =larry2898
local _ =task.wait()
local larry2899 =Vector3["new"]
local larry2900 =larry2899(0, 0, 0)
_2841_2["Velocity"] =larry2900
local _ =task.wait()
local larry2901 =Vector3["new"]
local larry2902 =larry2901(0, 0, 0)
_2841_2["Velocity"] =larry2902
end)
local larry2903 =larry2838["ChildAdded"]
local larry2904 =larry2903["Connect"]
local larry2907 =_2906_vararg1["IsA"]
local larry2908 =larry2907(_2906_vararg1, "BasePart")
local larry2909 =_2906_vararg1["GetPropertyChangedSignal"]
local larry2910 =larry2909(_2906_vararg1, "Anchored")
local larry2911 =larry2910["Connect"]
local larry2914 =_2906_vararg1["Anchored"]
local larry2912 =larry2911(larry2910, function(...)
local _2913_vararg1, _2913_vararg2, _2913_vararg3, _2913_vararg4, _2913_vararg5, _2913_vararg6, _2913_vararg7, _2913_vararg8, _2913_vararg9, _2913_vararg10 = ...
local larry2914 =_2906_vararg1["Anchored"]
_2906_vararg1["Anchored"] =false
end)
local larry2915 =_2906_vararg1["ChildAdded"]
local larry2916 =larry2915["Connect"]
local larry2919 =_2918_vararg1["IsA"]
local larry2920 =larry2919(_2918_vararg1, "BallSocketConstraint")
local larry2921 =_2918_vararg1["Parent"]
local larry2922 =_2918_vararg1["Destroy"]
local larry2923 =larry2922(_2918_vararg1)
local larry2924 =larry25["Character"]
local larry2925 =larry25["Character"]
local larry2926 =larry2925["FindFirstChild"]
local larry2927 =larry2926(larry2925, "Humanoid")
local larry2928 =larry25["Character"]
local larry2929 =larry2928["Humanoid"]
local larry2930 =larry25["Character"]
local larry2931 =larry2930["FindFirstChild"]
local larry2932 =larry2931(larry2930, "HumanoidRootPart")
local larry2933 =larry2929["ChangeState"]
local larry2934 =Enum["HumanoidStateType"]
local larry2935 =larry2934["GettingUp"]
local larry2936 =larry2933(larry2929, larry2935)
local larry2937 =workspace["CurrentCamera"]
local larry2938 =_2906_vararg1["FindFirstChildWhichIsA"]
local larry2939 =larry2938(_2906_vararg1, "Motor6D")
local larry2940 =_2906_vararg1["FindFirstChildWhichIsA"]
local larry2941 =larry2940(_2906_vararg1, "Motor6D")
local larry2942 =larry25["PlayerScripts"]
local larry2943 =larry2942["PlayerModule"]
local larry2944 =larry2943["ControlModule"]
local larry2945 =require(larry2944)
local larry2946 =larry2945["Enable"]
local larry2947 =larry2946(larry2945)
local _ =task.wait()
local larry2948 =Vector3["new"]
local larry2949 =larry2948(0, 0, 0)
local _ =task.wait()
local larry2950 =Vector3["new"]
local larry2951 =larry2950(0, 0, 0)
local _ =task.wait()
local larry2952 =Vector3["new"]
local larry2953 =larry2952(0, 0, 0)
local _ =task.wait()
local larry2954 =Vector3["new"]
local larry2955 =larry2954(0, 0, 0)
local _ =task.wait()
local larry2956 =Vector3["new"]
local larry2957 =larry2956(0, 0, 0)
local _ =task.wait()
local larry2958 =Vector3["new"]
local larry2959 =larry2958(0, 0, 0)
local _ =task.wait()
local larry2960 =Vector3["new"]
local larry2961 =larry2960(0, 0, 0)
local _ =task.wait()
local larry2962 =Vector3["new"]
local larry2963 =larry2962(0, 0, 0)
local _ =task.wait()
local larry2964 =Vector3["new"]
local larry2965 =larry2964(0, 0, 0)
local _ =task.wait()
local larry2966 =Vector3["new"]
local larry2967 =larry2966(0, 0, 0)
local larry2917 =larry2916(larry2915, function(...)
local _2918_vararg1, _2918_vararg2, _2918_vararg3, _2918_vararg4, _2918_vararg5, _2918_vararg6, _2918_vararg7, _2918_vararg8, _2918_vararg9, _2918_vararg10 = ...
local larry2919 =_2918_vararg1["IsA"]
local larry2920 =larry2919(_2918_vararg1, "BallSocketConstraint")
local larry2921 =_2918_vararg1["Parent"]
local larry2922 =_2918_vararg1["Destroy"]
local larry2923 =larry2922(_2918_vararg1)
local larry2924 =larry25["Character"]
local larry2925 =larry25["Character"]
local larry2926 =larry2925["FindFirstChild"]
local larry2927 =larry2926(larry2925, "Humanoid")
local larry2928 =larry25["Character"]
local larry2929 =larry2928["Humanoid"]
local larry2930 =larry25["Character"]
local larry2931 =larry2930["FindFirstChild"]
local larry2932 =larry2931(larry2930, "HumanoidRootPart")
local larry2933 =larry2929["ChangeState"]
local larry2934 =Enum["HumanoidStateType"]
local larry2935 =larry2934["GettingUp"]
local larry2936 =larry2933(larry2929, larry2935)
larry2929["PlatformStand"] =false
local larry2937 =workspace["CurrentCamera"]
larry2937["CameraSubject"] =larry2929
larry2932["CanCollide"] =true
local larry2938 =_2906_vararg1["FindFirstChildWhichIsA"]
local larry2939 =larry2938(_2906_vararg1, "Motor6D")
local larry2940 =_2906_vararg1["FindFirstChildWhichIsA"]
local larry2941 =larry2940(_2906_vararg1, "Motor6D")
larry2941["Enabled"] =true
local larry2942 =larry25["PlayerScripts"]
local larry2943 =larry2942["PlayerModule"]
local larry2944 =larry2943["ControlModule"]
local larry2945 =require(larry2944)
local larry2946 =larry2945["Enable"]
local larry2947 =larry2946(larry2945)
local _ =task.wait()
local larry2948 =Vector3["new"]
local larry2949 =larry2948(0, 0, 0)
_2906_vararg1["Velocity"] =larry2949
local _ =task.wait()
local larry2950 =Vector3["new"]
local larry2951 =larry2950(0, 0, 0)
_2906_vararg1["Velocity"] =larry2951
local _ =task.wait()
local larry2952 =Vector3["new"]
local larry2953 =larry2952(0, 0, 0)
_2906_vararg1["Velocity"] =larry2953
local _ =task.wait()
local larry2954 =Vector3["new"]
local larry2955 =larry2954(0, 0, 0)
_2906_vararg1["Velocity"] =larry2955
local _ =task.wait()
local larry2956 =Vector3["new"]
local larry2957 =larry2956(0, 0, 0)
_2906_vararg1["Velocity"] =larry2957
local _ =task.wait()
local larry2958 =Vector3["new"]
local larry2959 =larry2958(0, 0, 0)
_2906_vararg1["Velocity"] =larry2959
local _ =task.wait()
local larry2960 =Vector3["new"]
local larry2961 =larry2960(0, 0, 0)
_2906_vararg1["Velocity"] =larry2961
local _ =task.wait()
local larry2962 =Vector3["new"]
local larry2963 =larry2962(0, 0, 0)
_2906_vararg1["Velocity"] =larry2963
local _ =task.wait()
local larry2964 =Vector3["new"]
local larry2965 =larry2964(0, 0, 0)
_2906_vararg1["Velocity"] =larry2965
local _ =task.wait()
local larry2966 =Vector3["new"]
local larry2967 =larry2966(0, 0, 0)
_2906_vararg1["Velocity"] =larry2967
end)
local larry2905 =larry2904(larry2903, function(...)
local _2906_vararg1, _2906_vararg2, _2906_vararg3, _2906_vararg4, _2906_vararg5, _2906_vararg6, _2906_vararg7, _2906_vararg8, _2906_vararg9, _2906_vararg10 = ...
local larry2907 =_2906_vararg1["IsA"]
local larry2908 =larry2907(_2906_vararg1, "BasePart")
local larry2909 =_2906_vararg1["GetPropertyChangedSignal"]
local larry2910 =larry2909(_2906_vararg1, "Anchored")
local larry2911 =larry2910["Connect"]
local larry2912 =larry2911(larry2910, function(...)
local _2913_vararg1, _2913_vararg2, _2913_vararg3, _2913_vararg4, _2913_vararg5, _2913_vararg6, _2913_vararg7, _2913_vararg8, _2913_vararg9, _2913_vararg10 = ...
local larry2914 =_2906_vararg1["Anchored"]
_2906_vararg1["Anchored"] =false
end)
local larry2915 =_2906_vararg1["ChildAdded"]
local larry2916 =larry2915["Connect"]
local larry2917 =larry2916(larry2915, function(...)
local _2918_vararg1, _2918_vararg2, _2918_vararg3, _2918_vararg4, _2918_vararg5, _2918_vararg6, _2918_vararg7, _2918_vararg8, _2918_vararg9, _2918_vararg10 = ...
local larry2919 =_2918_vararg1["IsA"]
local larry2920 =larry2919(_2918_vararg1, "BallSocketConstraint")
local larry2921 =_2918_vararg1["Parent"]
local larry2922 =_2918_vararg1["Destroy"]
local larry2923 =larry2922(_2918_vararg1)
local larry2924 =larry25["Character"]
local larry2925 =larry25["Character"]
local larry2926 =larry2925["FindFirstChild"]
local larry2927 =larry2926(larry2925, "Humanoid")
local larry2928 =larry25["Character"]
local larry2929 =larry2928["Humanoid"]
local larry2930 =larry25["Character"]
local larry2931 =larry2930["FindFirstChild"]
local larry2932 =larry2931(larry2930, "HumanoidRootPart")
local larry2933 =larry2929["ChangeState"]
local larry2934 =Enum["HumanoidStateType"]
local larry2935 =larry2934["GettingUp"]
local larry2936 =larry2933(larry2929, larry2935)
larry2929["PlatformStand"] =false
local larry2937 =workspace["CurrentCamera"]
larry2937["CameraSubject"] =larry2929
larry2932["CanCollide"] =true
local larry2938 =_2906_vararg1["FindFirstChildWhichIsA"]
local larry2939 =larry2938(_2906_vararg1, "Motor6D")
local larry2940 =_2906_vararg1["FindFirstChildWhichIsA"]
local larry2941 =larry2940(_2906_vararg1, "Motor6D")
larry2941["Enabled"] =true
local larry2942 =larry25["PlayerScripts"]
local larry2943 =larry2942["PlayerModule"]
local larry2944 =larry2943["ControlModule"]
local larry2945 =require(larry2944)
local larry2946 =larry2945["Enable"]
local larry2947 =larry2946(larry2945)
local _ =task.wait()
local larry2948 =Vector3["new"]
local larry2949 =larry2948(0, 0, 0)
_2906_vararg1["Velocity"] =larry2949
local _ =task.wait()
local larry2950 =Vector3["new"]
local larry2951 =larry2950(0, 0, 0)
_2906_vararg1["Velocity"] =larry2951
local _ =task.wait()
local larry2952 =Vector3["new"]
local larry2953 =larry2952(0, 0, 0)
_2906_vararg1["Velocity"] =larry2953
local _ =task.wait()
local larry2954 =Vector3["new"]
local larry2955 =larry2954(0, 0, 0)
_2906_vararg1["Velocity"] =larry2955
local _ =task.wait()
local larry2956 =Vector3["new"]
local larry2957 =larry2956(0, 0, 0)
_2906_vararg1["Velocity"] =larry2957
local _ =task.wait()
local larry2958 =Vector3["new"]
local larry2959 =larry2958(0, 0, 0)
_2906_vararg1["Velocity"] =larry2959
local _ =task.wait()
local larry2960 =Vector3["new"]
local larry2961 =larry2960(0, 0, 0)
_2906_vararg1["Velocity"] =larry2961
local _ =task.wait()
local larry2962 =Vector3["new"]
local larry2963 =larry2962(0, 0, 0)
_2906_vararg1["Velocity"] =larry2963
local _ =task.wait()
local larry2964 =Vector3["new"]
local larry2965 =larry2964(0, 0, 0)
_2906_vararg1["Velocity"] =larry2965
local _ =task.wait()
local larry2966 =Vector3["new"]
local larry2967 =larry2966(0, 0, 0)
_2906_vararg1["Velocity"] =larry2967
end)
end)
local larry2968 =larry2838["FindFirstChildOfClass"]
local larry2969 =larry2968(larry2838, "Humanoid")
local larry2970 =larry2969["IsA"]
local larry2971 =larry2970(larry2969, "BasePart")
local larry2972 =larry2969["GetPropertyChangedSignal"]
local larry2973 =larry2972(larry2969, "Anchored")
local larry2974 =larry2973["Connect"]
local larry2977 =larry2969["Anchored"]
local larry2975 =larry2974(larry2973, function(...)
local _2976_vararg1, _2976_vararg2, _2976_vararg3, _2976_vararg4, _2976_vararg5, _2976_vararg6, _2976_vararg7, _2976_vararg8, _2976_vararg9, _2976_vararg10 = ...
local larry2977 =larry2969["Anchored"]
larry2969["Anchored"] =false
end)
local larry2978 =larry2969["ChildAdded"]
local larry2979 =larry2978["Connect"]
local larry2982 =_2981_vararg1["IsA"]
local larry2983 =larry2982(_2981_vararg1, "BallSocketConstraint")
local larry2984 =_2981_vararg1["Parent"]
local larry2985 =_2981_vararg1["Destroy"]
local larry2986 =larry2985(_2981_vararg1)
local larry2987 =larry25["Character"]
local larry2988 =larry25["Character"]
local larry2989 =larry2988["FindFirstChild"]
local larry2990 =larry2989(larry2988, "Humanoid")
local larry2991 =larry25["Character"]
local larry2992 =larry2991["Humanoid"]
local larry2993 =larry25["Character"]
local larry2994 =larry2993["FindFirstChild"]
local larry2995 =larry2994(larry2993, "HumanoidRootPart")
local larry2996 =larry2992["ChangeState"]
local larry2997 =Enum["HumanoidStateType"]
local larry2998 =larry2997["GettingUp"]
local larry2999 =larry2996(larry2992, larry2998)
local larry3000 =workspace["CurrentCamera"]
local larry3001 =larry2969["FindFirstChildWhichIsA"]
local larry3002 =larry3001(larry2969, "Motor6D")
local larry3003 =larry2969["FindFirstChildWhichIsA"]
local larry3004 =larry3003(larry2969, "Motor6D")
local larry3005 =larry25["PlayerScripts"]
local larry3006 =larry3005["PlayerModule"]
local larry3007 =larry3006["ControlModule"]
local larry3008 =require(larry3007)
local larry3009 =larry3008["Enable"]
local larry3010 =larry3009(larry3008)
local _ =task.wait()
local larry3011 =Vector3["new"]
local larry3012 =larry3011(0, 0, 0)
local _ =task.wait()
local larry3013 =Vector3["new"]
local larry3014 =larry3013(0, 0, 0)
local _ =task.wait()
local larry3015 =Vector3["new"]
local larry3016 =larry3015(0, 0, 0)
local _ =task.wait()
local larry3017 =Vector3["new"]
local larry3018 =larry3017(0, 0, 0)
local _ =task.wait()
local larry3019 =Vector3["new"]
local larry3020 =larry3019(0, 0, 0)
local _ =task.wait()
local larry3021 =Vector3["new"]
local larry3022 =larry3021(0, 0, 0)
local _ =task.wait()
local larry3023 =Vector3["new"]
local larry3024 =larry3023(0, 0, 0)
local _ =task.wait()
local larry3025 =Vector3["new"]
local larry3026 =larry3025(0, 0, 0)
local _ =task.wait()
local larry3027 =Vector3["new"]
local larry3028 =larry3027(0, 0, 0)
local _ =task.wait()
local larry3029 =Vector3["new"]
local larry3030 =larry3029(0, 0, 0)
local larry2980 =larry2979(larry2978, function(...)
local _2981_vararg1, _2981_vararg2, _2981_vararg3, _2981_vararg4, _2981_vararg5, _2981_vararg6, _2981_vararg7, _2981_vararg8, _2981_vararg9, _2981_vararg10 = ...
local larry2982 =_2981_vararg1["IsA"]
local larry2983 =larry2982(_2981_vararg1, "BallSocketConstraint")
local larry2984 =_2981_vararg1["Parent"]
local larry2985 =_2981_vararg1["Destroy"]
local larry2986 =larry2985(_2981_vararg1)
local larry2987 =larry25["Character"]
local larry2988 =larry25["Character"]
local larry2989 =larry2988["FindFirstChild"]
local larry2990 =larry2989(larry2988, "Humanoid")
local larry2991 =larry25["Character"]
local larry2992 =larry2991["Humanoid"]
local larry2993 =larry25["Character"]
local larry2994 =larry2993["FindFirstChild"]
local larry2995 =larry2994(larry2993, "HumanoidRootPart")
local larry2996 =larry2992["ChangeState"]
local larry2997 =Enum["HumanoidStateType"]
local larry2998 =larry2997["GettingUp"]
local larry2999 =larry2996(larry2992, larry2998)
larry2992["PlatformStand"] =false
local larry3000 =workspace["CurrentCamera"]
larry3000["CameraSubject"] =larry2992
larry2995["CanCollide"] =true
local larry3001 =larry2969["FindFirstChildWhichIsA"]
local larry3002 =larry3001(larry2969, "Motor6D")
local larry3003 =larry2969["FindFirstChildWhichIsA"]
local larry3004 =larry3003(larry2969, "Motor6D")
larry3004["Enabled"] =true
local larry3005 =larry25["PlayerScripts"]
local larry3006 =larry3005["PlayerModule"]
local larry3007 =larry3006["ControlModule"]
local larry3008 =require(larry3007)
local larry3009 =larry3008["Enable"]
local larry3010 =larry3009(larry3008)
local _ =task.wait()
local larry3011 =Vector3["new"]
local larry3012 =larry3011(0, 0, 0)
larry2969["Velocity"] =larry3012
local _ =task.wait()
local larry3013 =Vector3["new"]
local larry3014 =larry3013(0, 0, 0)
larry2969["Velocity"] =larry3014
local _ =task.wait()
local larry3015 =Vector3["new"]
local larry3016 =larry3015(0, 0, 0)
larry2969["Velocity"] =larry3016
local _ =task.wait()
local larry3017 =Vector3["new"]
local larry3018 =larry3017(0, 0, 0)
larry2969["Velocity"] =larry3018
local _ =task.wait()
local larry3019 =Vector3["new"]
local larry3020 =larry3019(0, 0, 0)
larry2969["Velocity"] =larry3020
local _ =task.wait()
local larry3021 =Vector3["new"]
local larry3022 =larry3021(0, 0, 0)
larry2969["Velocity"] =larry3022
local _ =task.wait()
local larry3023 =Vector3["new"]
local larry3024 =larry3023(0, 0, 0)
larry2969["Velocity"] =larry3024
local _ =task.wait()
local larry3025 =Vector3["new"]
local larry3026 =larry3025(0, 0, 0)
larry2969["Velocity"] =larry3026
local _ =task.wait()
local larry3027 =Vector3["new"]
local larry3028 =larry3027(0, 0, 0)
larry2969["Velocity"] =larry3028
local _ =task.wait()
local larry3029 =Vector3["new"]
local larry3030 =larry3029(0, 0, 0)
larry2969["Velocity"] =larry3030
end)
local larry3031 =larry25["CharacterAdded"]
local larry3032 =larry3031["Connect"]
local _ =task.wait(0.1)
local larry3035 =_3034_vararg1["GetChildren"]
local larry3036 =larry3035(_3034_vararg1)
local larry3038 =_3037_2["IsA"]
local larry3039 =larry3038(_3037_2, "BasePart")
local larry3040 =_3037_2["GetPropertyChangedSignal"]
local larry3041 =larry3040(_3037_2, "Anchored")
local larry3042 =larry3041["Connect"]
local larry3045 =_3037_2["Anchored"]
local larry3043 =larry3042(larry3041, function(...)
local _3044_vararg1, _3044_vararg2, _3044_vararg3, _3044_vararg4, _3044_vararg5, _3044_vararg6, _3044_vararg7, _3044_vararg8, _3044_vararg9, _3044_vararg10 = ...
local larry3045 =_3037_2["Anchored"]
_3037_2["Anchored"] =false
end)
local larry3046 =_3037_2["ChildAdded"]
local larry3047 =larry3046["Connect"]
local larry3050 =_3049_vararg1["IsA"]
local larry3051 =larry3050(_3049_vararg1, "BallSocketConstraint")
local larry3052 =_3049_vararg1["Parent"]
local larry3053 =_3049_vararg1["Destroy"]
local larry3054 =larry3053(_3049_vararg1)
local larry3055 =larry25["Character"]
local larry3056 =larry25["Character"]
local larry3057 =larry3056["FindFirstChild"]
local larry3058 =larry3057(larry3056, "Humanoid")
local larry3059 =larry25["Character"]
local larry3060 =larry3059["Humanoid"]
local larry3061 =larry25["Character"]
local larry3062 =larry3061["FindFirstChild"]
local larry3063 =larry3062(larry3061, "HumanoidRootPart")
local larry3064 =larry3060["ChangeState"]
local larry3065 =Enum["HumanoidStateType"]
local larry3066 =larry3065["GettingUp"]
local larry3067 =larry3064(larry3060, larry3066)
local larry3068 =workspace["CurrentCamera"]
local larry3069 =_3037_2["FindFirstChildWhichIsA"]
local larry3070 =larry3069(_3037_2, "Motor6D")
local larry3071 =_3037_2["FindFirstChildWhichIsA"]
local larry3072 =larry3071(_3037_2, "Motor6D")
local larry3073 =larry25["PlayerScripts"]
local larry3074 =larry3073["PlayerModule"]
local larry3075 =larry3074["ControlModule"]
local larry3076 =require(larry3075)
local larry3077 =larry3076["Enable"]
local larry3078 =larry3077(larry3076)
local _ =task.wait()
local larry3079 =Vector3["new"]
local larry3080 =larry3079(0, 0, 0)
local _ =task.wait()
local larry3081 =Vector3["new"]
local larry3082 =larry3081(0, 0, 0)
local _ =task.wait()
local larry3083 =Vector3["new"]
local larry3084 =larry3083(0, 0, 0)
local _ =task.wait()
local larry3085 =Vector3["new"]
local larry3086 =larry3085(0, 0, 0)
local _ =task.wait()
local larry3087 =Vector3["new"]
local larry3088 =larry3087(0, 0, 0)
local _ =task.wait()
local larry3089 =Vector3["new"]
local larry3090 =larry3089(0, 0, 0)
local _ =task.wait()
local larry3091 =Vector3["new"]
local larry3092 =larry3091(0, 0, 0)
local _ =task.wait()
local larry3093 =Vector3["new"]
local larry3094 =larry3093(0, 0, 0)
local _ =task.wait()
local larry3095 =Vector3["new"]
local larry3096 =larry3095(0, 0, 0)
local _ =task.wait()
local larry3097 =Vector3["new"]
local larry3098 =larry3097(0, 0, 0)
local larry3048 =larry3047(larry3046, function(...)
local _3049_vararg1, _3049_vararg2, _3049_vararg3, _3049_vararg4, _3049_vararg5, _3049_vararg6, _3049_vararg7, _3049_vararg8, _3049_vararg9, _3049_vararg10 = ...
local larry3050 =_3049_vararg1["IsA"]
local larry3051 =larry3050(_3049_vararg1, "BallSocketConstraint")
local larry3052 =_3049_vararg1["Parent"]
local larry3053 =_3049_vararg1["Destroy"]
local larry3054 =larry3053(_3049_vararg1)
local larry3055 =larry25["Character"]
local larry3056 =larry25["Character"]
local larry3057 =larry3056["FindFirstChild"]
local larry3058 =larry3057(larry3056, "Humanoid")
local larry3059 =larry25["Character"]
local larry3060 =larry3059["Humanoid"]
local larry3061 =larry25["Character"]
local larry3062 =larry3061["FindFirstChild"]
local larry3063 =larry3062(larry3061, "HumanoidRootPart")
local larry3064 =larry3060["ChangeState"]
local larry3065 =Enum["HumanoidStateType"]
local larry3066 =larry3065["GettingUp"]
local larry3067 =larry3064(larry3060, larry3066)
larry3060["PlatformStand"] =false
local larry3068 =workspace["CurrentCamera"]
larry3068["CameraSubject"] =larry3060
larry3063["CanCollide"] =true
local larry3069 =_3037_2["FindFirstChildWhichIsA"]
local larry3070 =larry3069(_3037_2, "Motor6D")
local larry3071 =_3037_2["FindFirstChildWhichIsA"]
local larry3072 =larry3071(_3037_2, "Motor6D")
larry3072["Enabled"] =true
local larry3073 =larry25["PlayerScripts"]
local larry3074 =larry3073["PlayerModule"]
local larry3075 =larry3074["ControlModule"]
local larry3076 =require(larry3075)
local larry3077 =larry3076["Enable"]
local larry3078 =larry3077(larry3076)
local _ =task.wait()
local larry3079 =Vector3["new"]
local larry3080 =larry3079(0, 0, 0)
_3037_2["Velocity"] =larry3080
local _ =task.wait()
local larry3081 =Vector3["new"]
local larry3082 =larry3081(0, 0, 0)
_3037_2["Velocity"] =larry3082
local _ =task.wait()
local larry3083 =Vector3["new"]
local larry3084 =larry3083(0, 0, 0)
_3037_2["Velocity"] =larry3084
local _ =task.wait()
local larry3085 =Vector3["new"]
local larry3086 =larry3085(0, 0, 0)
_3037_2["Velocity"] =larry3086
local _ =task.wait()
local larry3087 =Vector3["new"]
local larry3088 =larry3087(0, 0, 0)
_3037_2["Velocity"] =larry3088
local _ =task.wait()
local larry3089 =Vector3["new"]
local larry3090 =larry3089(0, 0, 0)
_3037_2["Velocity"] =larry3090
local _ =task.wait()
local larry3091 =Vector3["new"]
local larry3092 =larry3091(0, 0, 0)
_3037_2["Velocity"] =larry3092
local _ =task.wait()
local larry3093 =Vector3["new"]
local larry3094 =larry3093(0, 0, 0)
_3037_2["Velocity"] =larry3094
local _ =task.wait()
local larry3095 =Vector3["new"]
local larry3096 =larry3095(0, 0, 0)
_3037_2["Velocity"] =larry3096
local _ =task.wait()
local larry3097 =Vector3["new"]
local larry3098 =larry3097(0, 0, 0)
_3037_2["Velocity"] =larry3098
end)
local larry3099 =_3034_vararg1["ChildAdded"]
local larry3100 =larry3099["Connect"]
local larry3103 =_3102_vararg1["IsA"]
local larry3104 =larry3103(_3102_vararg1, "BasePart")
local larry3105 =_3102_vararg1["GetPropertyChangedSignal"]
local larry3106 =larry3105(_3102_vararg1, "Anchored")
local larry3107 =larry3106["Connect"]
local larry3110 =_3102_vararg1["Anchored"]
local larry3108 =larry3107(larry3106, function(...)
local _3109_vararg1, _3109_vararg2, _3109_vararg3, _3109_vararg4, _3109_vararg5, _3109_vararg6, _3109_vararg7, _3109_vararg8, _3109_vararg9, _3109_vararg10 = ...
local larry3110 =_3102_vararg1["Anchored"]
_3102_vararg1["Anchored"] =false
end)
local larry3111 =_3102_vararg1["ChildAdded"]
local larry3112 =larry3111["Connect"]
local larry3115 =_3114_vararg1["IsA"]
local larry3116 =larry3115(_3114_vararg1, "BallSocketConstraint")
local larry3117 =_3114_vararg1["Parent"]
local larry3118 =_3114_vararg1["Destroy"]
local larry3119 =larry3118(_3114_vararg1)
local larry3120 =larry25["Character"]
local larry3121 =larry25["Character"]
local larry3122 =larry3121["FindFirstChild"]
local larry3123 =larry3122(larry3121, "Humanoid")
local larry3124 =larry25["Character"]
local larry3125 =larry3124["Humanoid"]
local larry3126 =larry25["Character"]
local larry3127 =larry3126["FindFirstChild"]
local larry3128 =larry3127(larry3126, "HumanoidRootPart")
local larry3129 =larry3125["ChangeState"]
local larry3130 =Enum["HumanoidStateType"]
local larry3131 =larry3130["GettingUp"]
local larry3132 =larry3129(larry3125, larry3131)
local larry3133 =workspace["CurrentCamera"]
local larry3134 =_3102_vararg1["FindFirstChildWhichIsA"]
local larry3135 =larry3134(_3102_vararg1, "Motor6D")
local larry3136 =_3102_vararg1["FindFirstChildWhichIsA"]
local larry3137 =larry3136(_3102_vararg1, "Motor6D")
local larry3138 =larry25["PlayerScripts"]
local larry3139 =larry3138["PlayerModule"]
local larry3140 =larry3139["ControlModule"]
local larry3141 =require(larry3140)
local larry3142 =larry3141["Enable"]
local larry3143 =larry3142(larry3141)
local _ =task.wait()
local larry3144 =Vector3["new"]
local larry3145 =larry3144(0, 0, 0)
local _ =task.wait()
local larry3146 =Vector3["new"]
local larry3147 =larry3146(0, 0, 0)
local _ =task.wait()
local larry3148 =Vector3["new"]
local larry3149 =larry3148(0, 0, 0)
local _ =task.wait()
local larry3150 =Vector3["new"]
local larry3151 =larry3150(0, 0, 0)
local _ =task.wait()
local larry3152 =Vector3["new"]
local larry3153 =larry3152(0, 0, 0)
local _ =task.wait()
local larry3154 =Vector3["new"]
local larry3155 =larry3154(0, 0, 0)
local _ =task.wait()
local larry3156 =Vector3["new"]
local larry3157 =larry3156(0, 0, 0)
local _ =task.wait()
local larry3158 =Vector3["new"]
local larry3159 =larry3158(0, 0, 0)
local _ =task.wait()
local larry3160 =Vector3["new"]
local larry3161 =larry3160(0, 0, 0)
local _ =task.wait()
local larry3162 =Vector3["new"]
local larry3163 =larry3162(0, 0, 0)
local larry3113 =larry3112(larry3111, function(...)
local _3114_vararg1, _3114_vararg2, _3114_vararg3, _3114_vararg4, _3114_vararg5, _3114_vararg6, _3114_vararg7, _3114_vararg8, _3114_vararg9, _3114_vararg10 = ...
local larry3115 =_3114_vararg1["IsA"]
local larry3116 =larry3115(_3114_vararg1, "BallSocketConstraint")
local larry3117 =_3114_vararg1["Parent"]
local larry3118 =_3114_vararg1["Destroy"]
local larry3119 =larry3118(_3114_vararg1)
local larry3120 =larry25["Character"]
local larry3121 =larry25["Character"]
local larry3122 =larry3121["FindFirstChild"]
local larry3123 =larry3122(larry3121, "Humanoid")
local larry3124 =larry25["Character"]
local larry3125 =larry3124["Humanoid"]
local larry3126 =larry25["Character"]
local larry3127 =larry3126["FindFirstChild"]
local larry3128 =larry3127(larry3126, "HumanoidRootPart")
local larry3129 =larry3125["ChangeState"]
local larry3130 =Enum["HumanoidStateType"]
local larry3131 =larry3130["GettingUp"]
local larry3132 =larry3129(larry3125, larry3131)
larry3125["PlatformStand"] =false
local larry3133 =workspace["CurrentCamera"]
larry3133["CameraSubject"] =larry3125
larry3128["CanCollide"] =true
local larry3134 =_3102_vararg1["FindFirstChildWhichIsA"]
local larry3135 =larry3134(_3102_vararg1, "Motor6D")
local larry3136 =_3102_vararg1["FindFirstChildWhichIsA"]
local larry3137 =larry3136(_3102_vararg1, "Motor6D")
larry3137["Enabled"] =true
local larry3138 =larry25["PlayerScripts"]
local larry3139 =larry3138["PlayerModule"]
local larry3140 =larry3139["ControlModule"]
local larry3141 =require(larry3140)
local larry3142 =larry3141["Enable"]
local larry3143 =larry3142(larry3141)
local _ =task.wait()
local larry3144 =Vector3["new"]
local larry3145 =larry3144(0, 0, 0)
_3102_vararg1["Velocity"] =larry3145
local _ =task.wait()
local larry3146 =Vector3["new"]
local larry3147 =larry3146(0, 0, 0)
_3102_vararg1["Velocity"] =larry3147
local _ =task.wait()
local larry3148 =Vector3["new"]
local larry3149 =larry3148(0, 0, 0)
_3102_vararg1["Velocity"] =larry3149
local _ =task.wait()
local larry3150 =Vector3["new"]
local larry3151 =larry3150(0, 0, 0)
_3102_vararg1["Velocity"] =larry3151
local _ =task.wait()
local larry3152 =Vector3["new"]
local larry3153 =larry3152(0, 0, 0)
_3102_vararg1["Velocity"] =larry3153
local _ =task.wait()
local larry3154 =Vector3["new"]
local larry3155 =larry3154(0, 0, 0)
_3102_vararg1["Velocity"] =larry3155
local _ =task.wait()
local larry3156 =Vector3["new"]
local larry3157 =larry3156(0, 0, 0)
_3102_vararg1["Velocity"] =larry3157
local _ =task.wait()
local larry3158 =Vector3["new"]
local larry3159 =larry3158(0, 0, 0)
_3102_vararg1["Velocity"] =larry3159
local _ =task.wait()
local larry3160 =Vector3["new"]
local larry3161 =larry3160(0, 0, 0)
_3102_vararg1["Velocity"] =larry3161
local _ =task.wait()
local larry3162 =Vector3["new"]
local larry3163 =larry3162(0, 0, 0)
_3102_vararg1["Velocity"] =larry3163
end)
local larry3101 =larry3100(larry3099, function(...)
local _3102_vararg1, _3102_vararg2, _3102_vararg3, _3102_vararg4, _3102_vararg5, _3102_vararg6, _3102_vararg7, _3102_vararg8, _3102_vararg9, _3102_vararg10 = ...
local larry3103 =_3102_vararg1["IsA"]
local larry3104 =larry3103(_3102_vararg1, "BasePart")
local larry3105 =_3102_vararg1["GetPropertyChangedSignal"]
local larry3106 =larry3105(_3102_vararg1, "Anchored")
local larry3107 =larry3106["Connect"]
local larry3108 =larry3107(larry3106, function(...)
local _3109_vararg1, _3109_vararg2, _3109_vararg3, _3109_vararg4, _3109_vararg5, _3109_vararg6, _3109_vararg7, _3109_vararg8, _3109_vararg9, _3109_vararg10 = ...
local larry3110 =_3102_vararg1["Anchored"]
_3102_vararg1["Anchored"] =false
end)
local larry3111 =_3102_vararg1["ChildAdded"]
local larry3112 =larry3111["Connect"]
local larry3113 =larry3112(larry3111, function(...)
local _3114_vararg1, _3114_vararg2, _3114_vararg3, _3114_vararg4, _3114_vararg5, _3114_vararg6, _3114_vararg7, _3114_vararg8, _3114_vararg9, _3114_vararg10 = ...
local larry3115 =_3114_vararg1["IsA"]
local larry3116 =larry3115(_3114_vararg1, "BallSocketConstraint")
local larry3117 =_3114_vararg1["Parent"]
local larry3118 =_3114_vararg1["Destroy"]
local larry3119 =larry3118(_3114_vararg1)
local larry3120 =larry25["Character"]
local larry3121 =larry25["Character"]
local larry3122 =larry3121["FindFirstChild"]
local larry3123 =larry3122(larry3121, "Humanoid")
local larry3124 =larry25["Character"]
local larry3125 =larry3124["Humanoid"]
local larry3126 =larry25["Character"]
local larry3127 =larry3126["FindFirstChild"]
local larry3128 =larry3127(larry3126, "HumanoidRootPart")
local larry3129 =larry3125["ChangeState"]
local larry3130 =Enum["HumanoidStateType"]
local larry3131 =larry3130["GettingUp"]
local larry3132 =larry3129(larry3125, larry3131)
larry3125["PlatformStand"] =false
local larry3133 =workspace["CurrentCamera"]
larry3133["CameraSubject"] =larry3125
larry3128["CanCollide"] =true
local larry3134 =_3102_vararg1["FindFirstChildWhichIsA"]
local larry3135 =larry3134(_3102_vararg1, "Motor6D")
local larry3136 =_3102_vararg1["FindFirstChildWhichIsA"]
local larry3137 =larry3136(_3102_vararg1, "Motor6D")
larry3137["Enabled"] =true
local larry3138 =larry25["PlayerScripts"]
local larry3139 =larry3138["PlayerModule"]
local larry3140 =larry3139["ControlModule"]
local larry3141 =require(larry3140)
local larry3142 =larry3141["Enable"]
local larry3143 =larry3142(larry3141)
local _ =task.wait()
local larry3144 =Vector3["new"]
local larry3145 =larry3144(0, 0, 0)
_3102_vararg1["Velocity"] =larry3145
local _ =task.wait()
local larry3146 =Vector3["new"]
local larry3147 =larry3146(0, 0, 0)
_3102_vararg1["Velocity"] =larry3147
local _ =task.wait()
local larry3148 =Vector3["new"]
local larry3149 =larry3148(0, 0, 0)
_3102_vararg1["Velocity"] =larry3149
local _ =task.wait()
local larry3150 =Vector3["new"]
local larry3151 =larry3150(0, 0, 0)
_3102_vararg1["Velocity"] =larry3151
local _ =task.wait()
local larry3152 =Vector3["new"]
local larry3153 =larry3152(0, 0, 0)
_3102_vararg1["Velocity"] =larry3153
local _ =task.wait()
local larry3154 =Vector3["new"]
local larry3155 =larry3154(0, 0, 0)
_3102_vararg1["Velocity"] =larry3155
local _ =task.wait()
local larry3156 =Vector3["new"]
local larry3157 =larry3156(0, 0, 0)
_3102_vararg1["Velocity"] =larry3157
local _ =task.wait()
local larry3158 =Vector3["new"]
local larry3159 =larry3158(0, 0, 0)
_3102_vararg1["Velocity"] =larry3159
local _ =task.wait()
local larry3160 =Vector3["new"]
local larry3161 =larry3160(0, 0, 0)
_3102_vararg1["Velocity"] =larry3161
local _ =task.wait()
local larry3162 =Vector3["new"]
local larry3163 =larry3162(0, 0, 0)
_3102_vararg1["Velocity"] =larry3163
end)
end)
local larry3164 =_3034_vararg1["FindFirstChildOfClass"]
local larry3165 =larry3164(_3034_vararg1, "Humanoid")
local larry3166 =larry3165["IsA"]
local larry3167 =larry3166(larry3165, "BasePart")
local larry3168 =larry3165["GetPropertyChangedSignal"]
local larry3169 =larry3168(larry3165, "Anchored")
local larry3170 =larry3169["Connect"]
local larry3173 =larry3165["Anchored"]
local larry3171 =larry3170(larry3169, function(...)
local _3172_vararg1, _3172_vararg2, _3172_vararg3, _3172_vararg4, _3172_vararg5, _3172_vararg6, _3172_vararg7, _3172_vararg8, _3172_vararg9, _3172_vararg10 = ...
local larry3173 =larry3165["Anchored"]
larry3165["Anchored"] =false
end)
local larry3174 =larry3165["ChildAdded"]
local larry3175 =larry3174["Connect"]
local larry3178 =_3177_vararg1["IsA"]
local larry3179 =larry3178(_3177_vararg1, "BallSocketConstraint")
local larry3180 =_3177_vararg1["Parent"]
local larry3181 =_3177_vararg1["Destroy"]
local larry3182 =larry3181(_3177_vararg1)
local larry3183 =larry25["Character"]
local larry3184 =larry25["Character"]
local larry3185 =larry3184["FindFirstChild"]
local larry3186 =larry3185(larry3184, "Humanoid")
local larry3187 =larry25["Character"]
local larry3188 =larry3187["Humanoid"]
local larry3189 =larry25["Character"]
local larry3190 =larry3189["FindFirstChild"]
local larry3191 =larry3190(larry3189, "HumanoidRootPart")
local larry3192 =larry3188["ChangeState"]
local larry3193 =Enum["HumanoidStateType"]
local larry3194 =larry3193["GettingUp"]
local larry3195 =larry3192(larry3188, larry3194)
local larry3196 =workspace["CurrentCamera"]
local larry3197 =larry3165["FindFirstChildWhichIsA"]
local larry3198 =larry3197(larry3165, "Motor6D")
local larry3199 =larry3165["FindFirstChildWhichIsA"]
local larry3200 =larry3199(larry3165, "Motor6D")
local larry3201 =larry25["PlayerScripts"]
local larry3202 =larry3201["PlayerModule"]
local larry3203 =larry3202["ControlModule"]
local larry3204 =require(larry3203)
local larry3205 =larry3204["Enable"]
local larry3206 =larry3205(larry3204)
local _ =task.wait()
local larry3207 =Vector3["new"]
local larry3208 =larry3207(0, 0, 0)
local _ =task.wait()
local larry3209 =Vector3["new"]
local larry3210 =larry3209(0, 0, 0)
local _ =task.wait()
local larry3211 =Vector3["new"]
local larry3212 =larry3211(0, 0, 0)
local _ =task.wait()
local larry3213 =Vector3["new"]
local larry3214 =larry3213(0, 0, 0)
local _ =task.wait()
local larry3215 =Vector3["new"]
local larry3216 =larry3215(0, 0, 0)
local _ =task.wait()
local larry3217 =Vector3["new"]
local larry3218 =larry3217(0, 0, 0)
local _ =task.wait()
local larry3219 =Vector3["new"]
local larry3220 =larry3219(0, 0, 0)
local _ =task.wait()
local larry3221 =Vector3["new"]
local larry3222 =larry3221(0, 0, 0)
local _ =task.wait()
local larry3223 =Vector3["new"]
local larry3224 =larry3223(0, 0, 0)
local _ =task.wait()
local larry3225 =Vector3["new"]
local larry3226 =larry3225(0, 0, 0)
local larry3176 =larry3175(larry3174, function(...)
local _3177_vararg1, _3177_vararg2, _3177_vararg3, _3177_vararg4, _3177_vararg5, _3177_vararg6, _3177_vararg7, _3177_vararg8, _3177_vararg9, _3177_vararg10 = ...
local larry3178 =_3177_vararg1["IsA"]
local larry3179 =larry3178(_3177_vararg1, "BallSocketConstraint")
local larry3180 =_3177_vararg1["Parent"]
local larry3181 =_3177_vararg1["Destroy"]
local larry3182 =larry3181(_3177_vararg1)
local larry3183 =larry25["Character"]
local larry3184 =larry25["Character"]
local larry3185 =larry3184["FindFirstChild"]
local larry3186 =larry3185(larry3184, "Humanoid")
local larry3187 =larry25["Character"]
local larry3188 =larry3187["Humanoid"]
local larry3189 =larry25["Character"]
local larry3190 =larry3189["FindFirstChild"]
local larry3191 =larry3190(larry3189, "HumanoidRootPart")
local larry3192 =larry3188["ChangeState"]
local larry3193 =Enum["HumanoidStateType"]
local larry3194 =larry3193["GettingUp"]
local larry3195 =larry3192(larry3188, larry3194)
larry3188["PlatformStand"] =false
local larry3196 =workspace["CurrentCamera"]
larry3196["CameraSubject"] =larry3188
larry3191["CanCollide"] =true
local larry3197 =larry3165["FindFirstChildWhichIsA"]
local larry3198 =larry3197(larry3165, "Motor6D")
local larry3199 =larry3165["FindFirstChildWhichIsA"]
local larry3200 =larry3199(larry3165, "Motor6D")
larry3200["Enabled"] =true
local larry3201 =larry25["PlayerScripts"]
local larry3202 =larry3201["PlayerModule"]
local larry3203 =larry3202["ControlModule"]
local larry3204 =require(larry3203)
local larry3205 =larry3204["Enable"]
local larry3206 =larry3205(larry3204)
local _ =task.wait()
local larry3207 =Vector3["new"]
local larry3208 =larry3207(0, 0, 0)
larry3165["Velocity"] =larry3208
local _ =task.wait()
local larry3209 =Vector3["new"]
local larry3210 =larry3209(0, 0, 0)
larry3165["Velocity"] =larry3210
local _ =task.wait()
local larry3211 =Vector3["new"]
local larry3212 =larry3211(0, 0, 0)
larry3165["Velocity"] =larry3212
local _ =task.wait()
local larry3213 =Vector3["new"]
local larry3214 =larry3213(0, 0, 0)
larry3165["Velocity"] =larry3214
local _ =task.wait()
local larry3215 =Vector3["new"]
local larry3216 =larry3215(0, 0, 0)
larry3165["Velocity"] =larry3216
local _ =task.wait()
local larry3217 =Vector3["new"]
local larry3218 =larry3217(0, 0, 0)
larry3165["Velocity"] =larry3218
local _ =task.wait()
local larry3219 =Vector3["new"]
local larry3220 =larry3219(0, 0, 0)
larry3165["Velocity"] =larry3220
local _ =task.wait()
local larry3221 =Vector3["new"]
local larry3222 =larry3221(0, 0, 0)
larry3165["Velocity"] =larry3222
local _ =task.wait()
local larry3223 =Vector3["new"]
local larry3224 =larry3223(0, 0, 0)
larry3165["Velocity"] =larry3224
local _ =task.wait()
local larry3225 =Vector3["new"]
local larry3226 =larry3225(0, 0, 0)
larry3165["Velocity"] =larry3226
end)
local larry3033 =larry3032(larry3031, function(...)
local _3034_vararg1, _3034_vararg2, _3034_vararg3, _3034_vararg4, _3034_vararg5, _3034_vararg6, _3034_vararg7, _3034_vararg8, _3034_vararg9, _3034_vararg10 = ...
local _ =task.wait(0.1)
local larry3035 =_3034_vararg1["GetChildren"]
local larry3036 =larry3035(_3034_vararg1)
for larry3037, _3037_2 in pairs(larry3036) do
local larry3038 =_3037_2["IsA"]
local larry3039 =larry3038(_3037_2, "BasePart")
local larry3040 =_3037_2["GetPropertyChangedSignal"]
local larry3041 =larry3040(_3037_2, "Anchored")
local larry3042 =larry3041["Connect"]
local larry3043 =larry3042(larry3041, function(...)
local _3044_vararg1, _3044_vararg2, _3044_vararg3, _3044_vararg4, _3044_vararg5, _3044_vararg6, _3044_vararg7, _3044_vararg8, _3044_vararg9, _3044_vararg10 = ...
local larry3045 =_3037_2["Anchored"]
_3037_2["Anchored"] =false
end)
local larry3046 =_3037_2["ChildAdded"]
local larry3047 =larry3046["Connect"]
local larry3048 =larry3047(larry3046, function(...)
local _3049_vararg1, _3049_vararg2, _3049_vararg3, _3049_vararg4, _3049_vararg5, _3049_vararg6, _3049_vararg7, _3049_vararg8, _3049_vararg9, _3049_vararg10 = ...
local larry3050 =_3049_vararg1["IsA"]
local larry3051 =larry3050(_3049_vararg1, "BallSocketConstraint")
local larry3052 =_3049_vararg1["Parent"]
local larry3053 =_3049_vararg1["Destroy"]
local larry3054 =larry3053(_3049_vararg1)
local larry3055 =larry25["Character"]
local larry3056 =larry25["Character"]
local larry3057 =larry3056["FindFirstChild"]
local larry3058 =larry3057(larry3056, "Humanoid")
local larry3059 =larry25["Character"]
local larry3060 =larry3059["Humanoid"]
local larry3061 =larry25["Character"]
local larry3062 =larry3061["FindFirstChild"]
local larry3063 =larry3062(larry3061, "HumanoidRootPart")
local larry3064 =larry3060["ChangeState"]
local larry3065 =Enum["HumanoidStateType"]
local larry3066 =larry3065["GettingUp"]
local larry3067 =larry3064(larry3060, larry3066)
larry3060["PlatformStand"] =false
local larry3068 =workspace["CurrentCamera"]
larry3068["CameraSubject"] =larry3060
larry3063["CanCollide"] =true
local larry3069 =_3037_2["FindFirstChildWhichIsA"]
local larry3070 =larry3069(_3037_2, "Motor6D")
local larry3071 =_3037_2["FindFirstChildWhichIsA"]
local larry3072 =larry3071(_3037_2, "Motor6D")
larry3072["Enabled"] =true
local larry3073 =larry25["PlayerScripts"]
local larry3074 =larry3073["PlayerModule"]
local larry3075 =larry3074["ControlModule"]
local larry3076 =require(larry3075)
local larry3077 =larry3076["Enable"]
local larry3078 =larry3077(larry3076)
local _ =task.wait()
local larry3079 =Vector3["new"]
local larry3080 =larry3079(0, 0, 0)
_3037_2["Velocity"] =larry3080
local _ =task.wait()
local larry3081 =Vector3["new"]
local larry3082 =larry3081(0, 0, 0)
_3037_2["Velocity"] =larry3082
local _ =task.wait()
local larry3083 =Vector3["new"]
local larry3084 =larry3083(0, 0, 0)
_3037_2["Velocity"] =larry3084
local _ =task.wait()
local larry3085 =Vector3["new"]
local larry3086 =larry3085(0, 0, 0)
_3037_2["Velocity"] =larry3086
local _ =task.wait()
local larry3087 =Vector3["new"]
local larry3088 =larry3087(0, 0, 0)
_3037_2["Velocity"] =larry3088
local _ =task.wait()
local larry3089 =Vector3["new"]
local larry3090 =larry3089(0, 0, 0)
_3037_2["Velocity"] =larry3090
local _ =task.wait()
local larry3091 =Vector3["new"]
local larry3092 =larry3091(0, 0, 0)
_3037_2["Velocity"] =larry3092
local _ =task.wait()
local larry3093 =Vector3["new"]
local larry3094 =larry3093(0, 0, 0)
_3037_2["Velocity"] =larry3094
local _ =task.wait()
local larry3095 =Vector3["new"]
local larry3096 =larry3095(0, 0, 0)
_3037_2["Velocity"] =larry3096
local _ =task.wait()
local larry3097 =Vector3["new"]
local larry3098 =larry3097(0, 0, 0)
_3037_2["Velocity"] =larry3098
end)
end
local larry3099 =_3034_vararg1["ChildAdded"]
local larry3100 =larry3099["Connect"]
local larry3101 =larry3100(larry3099, function(...)
local _3102_vararg1, _3102_vararg2, _3102_vararg3, _3102_vararg4, _3102_vararg5, _3102_vararg6, _3102_vararg7, _3102_vararg8, _3102_vararg9, _3102_vararg10 = ...
local larry3103 =_3102_vararg1["IsA"]
local larry3104 =larry3103(_3102_vararg1, "BasePart")
local larry3105 =_3102_vararg1["GetPropertyChangedSignal"]
local larry3106 =larry3105(_3102_vararg1, "Anchored")
local larry3107 =larry3106["Connect"]
local larry3108 =larry3107(larry3106, function(...)
local _3109_vararg1, _3109_vararg2, _3109_vararg3, _3109_vararg4, _3109_vararg5, _3109_vararg6, _3109_vararg7, _3109_vararg8, _3109_vararg9, _3109_vararg10 = ...
local larry3110 =_3102_vararg1["Anchored"]
_3102_vararg1["Anchored"] =false
end)
local larry3111 =_3102_vararg1["ChildAdded"]
local larry3112 =larry3111["Connect"]
local larry3113 =larry3112(larry3111, function(...)
local _3114_vararg1, _3114_vararg2, _3114_vararg3, _3114_vararg4, _3114_vararg5, _3114_vararg6, _3114_vararg7, _3114_vararg8, _3114_vararg9, _3114_vararg10 = ...
local larry3115 =_3114_vararg1["IsA"]
local larry3116 =larry3115(_3114_vararg1, "BallSocketConstraint")
local larry3117 =_3114_vararg1["Parent"]
local larry3118 =_3114_vararg1["Destroy"]
local larry3119 =larry3118(_3114_vararg1)
local larry3120 =larry25["Character"]
local larry3121 =larry25["Character"]
local larry3122 =larry3121["FindFirstChild"]
local larry3123 =larry3122(larry3121, "Humanoid")
local larry3124 =larry25["Character"]
local larry3125 =larry3124["Humanoid"]
local larry3126 =larry25["Character"]
local larry3127 =larry3126["FindFirstChild"]
local larry3128 =larry3127(larry3126, "HumanoidRootPart")
local larry3129 =larry3125["ChangeState"]
local larry3130 =Enum["HumanoidStateType"]
local larry3131 =larry3130["GettingUp"]
local larry3132 =larry3129(larry3125, larry3131)
larry3125["PlatformStand"] =false
local larry3133 =workspace["CurrentCamera"]
larry3133["CameraSubject"] =larry3125
larry3128["CanCollide"] =true
local larry3134 =_3102_vararg1["FindFirstChildWhichIsA"]
local larry3135 =larry3134(_3102_vararg1, "Motor6D")
local larry3136 =_3102_vararg1["FindFirstChildWhichIsA"]
local larry3137 =larry3136(_3102_vararg1, "Motor6D")
larry3137["Enabled"] =true
local larry3138 =larry25["PlayerScripts"]
local larry3139 =larry3138["PlayerModule"]
local larry3140 =larry3139["ControlModule"]
local larry3141 =require(larry3140)
local larry3142 =larry3141["Enable"]
local larry3143 =larry3142(larry3141)
local _ =task.wait()
local larry3144 =Vector3["new"]
local larry3145 =larry3144(0, 0, 0)
_3102_vararg1["Velocity"] =larry3145
local _ =task.wait()
local larry3146 =Vector3["new"]
local larry3147 =larry3146(0, 0, 0)
_3102_vararg1["Velocity"] =larry3147
local _ =task.wait()
local larry3148 =Vector3["new"]
local larry3149 =larry3148(0, 0, 0)
_3102_vararg1["Velocity"] =larry3149
local _ =task.wait()
local larry3150 =Vector3["new"]
local larry3151 =larry3150(0, 0, 0)
_3102_vararg1["Velocity"] =larry3151
local _ =task.wait()
local larry3152 =Vector3["new"]
local larry3153 =larry3152(0, 0, 0)
_3102_vararg1["Velocity"] =larry3153
local _ =task.wait()
local larry3154 =Vector3["new"]
local larry3155 =larry3154(0, 0, 0)
_3102_vararg1["Velocity"] =larry3155
local _ =task.wait()
local larry3156 =Vector3["new"]
local larry3157 =larry3156(0, 0, 0)
_3102_vararg1["Velocity"] =larry3157
local _ =task.wait()
local larry3158 =Vector3["new"]
local larry3159 =larry3158(0, 0, 0)
_3102_vararg1["Velocity"] =larry3159
local _ =task.wait()
local larry3160 =Vector3["new"]
local larry3161 =larry3160(0, 0, 0)
_3102_vararg1["Velocity"] =larry3161
local _ =task.wait()
local larry3162 =Vector3["new"]
local larry3163 =larry3162(0, 0, 0)
_3102_vararg1["Velocity"] =larry3163
end)
end)
local larry3164 =_3034_vararg1["FindFirstChildOfClass"]
local larry3165 =larry3164(_3034_vararg1, "Humanoid")
local larry3166 =larry3165["IsA"]
local larry3167 =larry3166(larry3165, "BasePart")
local larry3168 =larry3165["GetPropertyChangedSignal"]
local larry3169 =larry3168(larry3165, "Anchored")
local larry3170 =larry3169["Connect"]
local larry3171 =larry3170(larry3169, function(...)
local _3172_vararg1, _3172_vararg2, _3172_vararg3, _3172_vararg4, _3172_vararg5, _3172_vararg6, _3172_vararg7, _3172_vararg8, _3172_vararg9, _3172_vararg10 = ...
local larry3173 =larry3165["Anchored"]
larry3165["Anchored"] =false
end)
local larry3174 =larry3165["ChildAdded"]
local larry3175 =larry3174["Connect"]
local larry3176 =larry3175(larry3174, function(...)
local _3177_vararg1, _3177_vararg2, _3177_vararg3, _3177_vararg4, _3177_vararg5, _3177_vararg6, _3177_vararg7, _3177_vararg8, _3177_vararg9, _3177_vararg10 = ...
local larry3178 =_3177_vararg1["IsA"]
local larry3179 =larry3178(_3177_vararg1, "BallSocketConstraint")
local larry3180 =_3177_vararg1["Parent"]
local larry3181 =_3177_vararg1["Destroy"]
local larry3182 =larry3181(_3177_vararg1)
local larry3183 =larry25["Character"]
local larry3184 =larry25["Character"]
local larry3185 =larry3184["FindFirstChild"]
local larry3186 =larry3185(larry3184, "Humanoid")
local larry3187 =larry25["Character"]
local larry3188 =larry3187["Humanoid"]
local larry3189 =larry25["Character"]
local larry3190 =larry3189["FindFirstChild"]
local larry3191 =larry3190(larry3189, "HumanoidRootPart")
local larry3192 =larry3188["ChangeState"]
local larry3193 =Enum["HumanoidStateType"]
local larry3194 =larry3193["GettingUp"]
local larry3195 =larry3192(larry3188, larry3194)
larry3188["PlatformStand"] =false
local larry3196 =workspace["CurrentCamera"]
larry3196["CameraSubject"] =larry3188
larry3191["CanCollide"] =true
local larry3197 =larry3165["FindFirstChildWhichIsA"]
local larry3198 =larry3197(larry3165, "Motor6D")
local larry3199 =larry3165["FindFirstChildWhichIsA"]
local larry3200 =larry3199(larry3165, "Motor6D")
larry3200["Enabled"] =true
local larry3201 =larry25["PlayerScripts"]
local larry3202 =larry3201["PlayerModule"]
local larry3203 =larry3202["ControlModule"]
local larry3204 =require(larry3203)
local larry3205 =larry3204["Enable"]
local larry3206 =larry3205(larry3204)
local _ =task.wait()
local larry3207 =Vector3["new"]
local larry3208 =larry3207(0, 0, 0)
larry3165["Velocity"] =larry3208
local _ =task.wait()
local larry3209 =Vector3["new"]
local larry3210 =larry3209(0, 0, 0)
larry3165["Velocity"] =larry3210
local _ =task.wait()
local larry3211 =Vector3["new"]
local larry3212 =larry3211(0, 0, 0)
larry3165["Velocity"] =larry3212
local _ =task.wait()
local larry3213 =Vector3["new"]
local larry3214 =larry3213(0, 0, 0)
larry3165["Velocity"] =larry3214
local _ =task.wait()
local larry3215 =Vector3["new"]
local larry3216 =larry3215(0, 0, 0)
larry3165["Velocity"] =larry3216
local _ =task.wait()
local larry3217 =Vector3["new"]
local larry3218 =larry3217(0, 0, 0)
larry3165["Velocity"] =larry3218
local _ =task.wait()
local larry3219 =Vector3["new"]
local larry3220 =larry3219(0, 0, 0)
larry3165["Velocity"] =larry3220
local _ =task.wait()
local larry3221 =Vector3["new"]
local larry3222 =larry3221(0, 0, 0)
larry3165["Velocity"] =larry3222
local _ =task.wait()
local larry3223 =Vector3["new"]
local larry3224 =larry3223(0, 0, 0)
larry3165["Velocity"] =larry3224
local _ =task.wait()
local larry3225 =Vector3["new"]
local larry3226 =larry3225(0, 0, 0)
larry3165["Velocity"] =larry3226
end)
end)
local larry2829 =larry2828(larry2827, function(...)
local _2830_vararg1, _2830_vararg2, _2830_vararg3, _2830_vararg4, _2830_vararg5, _2830_vararg6, _2830_vararg7, _2830_vararg8, _2830_vararg9, _2830_vararg10 = ...
local larry2831 =task["delay"]
local larry2832 =larry2831(0.35, function(...)
local _2833_vararg1, _2833_vararg2, _2833_vararg3, _2833_vararg4, _2833_vararg5, _2833_vararg6, _2833_vararg7, _2833_vararg8, _2833_vararg9, _2833_vararg10 = ...

end)
local larry2834 =makefolder("MirandaTweenPlus")
local larry2835 =larry6["JSONEncode"]
local larry2836 =larry2835(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = false,
  ["nearest"] = true,
  ["antiRagdoll"] = true,
})
local _ =writefile("MirandaTweenPlus/config.json", larry2836)
larry2822["BackgroundColor3"] =larry34
local larry2837 =larry25["Character"]
local larry2838 =larry25["Character"]
local larry2839 =larry2838["GetChildren"]
local larry2840 =larry2839(larry2838)
for larry2841, _2841_2 in pairs(larry2840) do
local larry2842 =_2841_2["IsA"]
local larry2843 =larry2842(_2841_2, "BasePart")
local larry2844 =_2841_2["GetPropertyChangedSignal"]
local larry2845 =larry2844(_2841_2, "Anchored")
local larry2846 =larry2845["Connect"]
local larry2847 =larry2846(larry2845, function(...)
local _2848_vararg1, _2848_vararg2, _2848_vararg3, _2848_vararg4, _2848_vararg5, _2848_vararg6, _2848_vararg7, _2848_vararg8, _2848_vararg9, _2848_vararg10 = ...
local larry2849 =_2841_2["Anchored"]
_2841_2["Anchored"] =false
end)
local larry2850 =_2841_2["ChildAdded"]
local larry2851 =larry2850["Connect"]
local larry2852 =larry2851(larry2850, function(...)
local _2853_vararg1, _2853_vararg2, _2853_vararg3, _2853_vararg4, _2853_vararg5, _2853_vararg6, _2853_vararg7, _2853_vararg8, _2853_vararg9, _2853_vararg10 = ...
local larry2854 =_2853_vararg1["IsA"]
local larry2855 =larry2854(_2853_vararg1, "BallSocketConstraint")
local larry2856 =_2853_vararg1["Parent"]
local larry2857 =_2853_vararg1["Destroy"]
local larry2858 =larry2857(_2853_vararg1)
local larry2859 =larry25["Character"]
local larry2860 =larry25["Character"]
local larry2861 =larry2860["FindFirstChild"]
local larry2862 =larry2861(larry2860, "Humanoid")
local larry2863 =larry25["Character"]
local larry2864 =larry2863["Humanoid"]
local larry2865 =larry25["Character"]
local larry2866 =larry2865["FindFirstChild"]
local larry2867 =larry2866(larry2865, "HumanoidRootPart")
local larry2868 =larry2864["ChangeState"]
local larry2869 =Enum["HumanoidStateType"]
local larry2870 =larry2869["GettingUp"]
local larry2871 =larry2868(larry2864, larry2870)
larry2864["PlatformStand"] =false
local larry2872 =workspace["CurrentCamera"]
larry2872["CameraSubject"] =larry2864
larry2867["CanCollide"] =true
local larry2873 =_2841_2["FindFirstChildWhichIsA"]
local larry2874 =larry2873(_2841_2, "Motor6D")
local larry2875 =_2841_2["FindFirstChildWhichIsA"]
local larry2876 =larry2875(_2841_2, "Motor6D")
larry2876["Enabled"] =true
local larry2877 =larry25["PlayerScripts"]
local larry2878 =larry2877["PlayerModule"]
local larry2879 =larry2878["ControlModule"]
local larry2880 =require(larry2879)
local larry2881 =larry2880["Enable"]
local larry2882 =larry2881(larry2880)
local _ =task.wait()
local larry2883 =Vector3["new"]
local larry2884 =larry2883(0, 0, 0)
_2841_2["Velocity"] =larry2884
local _ =task.wait()
local larry2885 =Vector3["new"]
local larry2886 =larry2885(0, 0, 0)
_2841_2["Velocity"] =larry2886
local _ =task.wait()
local larry2887 =Vector3["new"]
local larry2888 =larry2887(0, 0, 0)
_2841_2["Velocity"] =larry2888
local _ =task.wait()
local larry2889 =Vector3["new"]
local larry2890 =larry2889(0, 0, 0)
_2841_2["Velocity"] =larry2890
local _ =task.wait()
local larry2891 =Vector3["new"]
local larry2892 =larry2891(0, 0, 0)
_2841_2["Velocity"] =larry2892
local _ =task.wait()
local larry2893 =Vector3["new"]
local larry2894 =larry2893(0, 0, 0)
_2841_2["Velocity"] =larry2894
local _ =task.wait()
local larry2895 =Vector3["new"]
local larry2896 =larry2895(0, 0, 0)
_2841_2["Velocity"] =larry2896
local _ =task.wait()
local larry2897 =Vector3["new"]
local larry2898 =larry2897(0, 0, 0)
_2841_2["Velocity"] =larry2898
local _ =task.wait()
local larry2899 =Vector3["new"]
local larry2900 =larry2899(0, 0, 0)
_2841_2["Velocity"] =larry2900
local _ =task.wait()
local larry2901 =Vector3["new"]
local larry2902 =larry2901(0, 0, 0)
_2841_2["Velocity"] =larry2902
end)
end
local larry2903 =larry2838["ChildAdded"]
local larry2904 =larry2903["Connect"]
local larry2905 =larry2904(larry2903, function(...)
local _2906_vararg1, _2906_vararg2, _2906_vararg3, _2906_vararg4, _2906_vararg5, _2906_vararg6, _2906_vararg7, _2906_vararg8, _2906_vararg9, _2906_vararg10 = ...
local larry2907 =_2906_vararg1["IsA"]
local larry2908 =larry2907(_2906_vararg1, "BasePart")
local larry2909 =_2906_vararg1["GetPropertyChangedSignal"]
local larry2910 =larry2909(_2906_vararg1, "Anchored")
local larry2911 =larry2910["Connect"]
local larry2912 =larry2911(larry2910, function(...)
local _2913_vararg1, _2913_vararg2, _2913_vararg3, _2913_vararg4, _2913_vararg5, _2913_vararg6, _2913_vararg7, _2913_vararg8, _2913_vararg9, _2913_vararg10 = ...
local larry2914 =_2906_vararg1["Anchored"]
_2906_vararg1["Anchored"] =false
end)
local larry2915 =_2906_vararg1["ChildAdded"]
local larry2916 =larry2915["Connect"]
local larry2917 =larry2916(larry2915, function(...)
local _2918_vararg1, _2918_vararg2, _2918_vararg3, _2918_vararg4, _2918_vararg5, _2918_vararg6, _2918_vararg7, _2918_vararg8, _2918_vararg9, _2918_vararg10 = ...
local larry2919 =_2918_vararg1["IsA"]
local larry2920 =larry2919(_2918_vararg1, "BallSocketConstraint")
local larry2921 =_2918_vararg1["Parent"]
local larry2922 =_2918_vararg1["Destroy"]
local larry2923 =larry2922(_2918_vararg1)
local larry2924 =larry25["Character"]
local larry2925 =larry25["Character"]
local larry2926 =larry2925["FindFirstChild"]
local larry2927 =larry2926(larry2925, "Humanoid")
local larry2928 =larry25["Character"]
local larry2929 =larry2928["Humanoid"]
local larry2930 =larry25["Character"]
local larry2931 =larry2930["FindFirstChild"]
local larry2932 =larry2931(larry2930, "HumanoidRootPart")
local larry2933 =larry2929["ChangeState"]
local larry2934 =Enum["HumanoidStateType"]
local larry2935 =larry2934["GettingUp"]
local larry2936 =larry2933(larry2929, larry2935)
larry2929["PlatformStand"] =false
local larry2937 =workspace["CurrentCamera"]
larry2937["CameraSubject"] =larry2929
larry2932["CanCollide"] =true
local larry2938 =_2906_vararg1["FindFirstChildWhichIsA"]
local larry2939 =larry2938(_2906_vararg1, "Motor6D")
local larry2940 =_2906_vararg1["FindFirstChildWhichIsA"]
local larry2941 =larry2940(_2906_vararg1, "Motor6D")
larry2941["Enabled"] =true
local larry2942 =larry25["PlayerScripts"]
local larry2943 =larry2942["PlayerModule"]
local larry2944 =larry2943["ControlModule"]
local larry2945 =require(larry2944)
local larry2946 =larry2945["Enable"]
local larry2947 =larry2946(larry2945)
local _ =task.wait()
local larry2948 =Vector3["new"]
local larry2949 =larry2948(0, 0, 0)
_2906_vararg1["Velocity"] =larry2949
local _ =task.wait()
local larry2950 =Vector3["new"]
local larry2951 =larry2950(0, 0, 0)
_2906_vararg1["Velocity"] =larry2951
local _ =task.wait()
local larry2952 =Vector3["new"]
local larry2953 =larry2952(0, 0, 0)
_2906_vararg1["Velocity"] =larry2953
local _ =task.wait()
local larry2954 =Vector3["new"]
local larry2955 =larry2954(0, 0, 0)
_2906_vararg1["Velocity"] =larry2955
local _ =task.wait()
local larry2956 =Vector3["new"]
local larry2957 =larry2956(0, 0, 0)
_2906_vararg1["Velocity"] =larry2957
local _ =task.wait()
local larry2958 =Vector3["new"]
local larry2959 =larry2958(0, 0, 0)
_2906_vararg1["Velocity"] =larry2959
local _ =task.wait()
local larry2960 =Vector3["new"]
local larry2961 =larry2960(0, 0, 0)
_2906_vararg1["Velocity"] =larry2961
local _ =task.wait()
local larry2962 =Vector3["new"]
local larry2963 =larry2962(0, 0, 0)
_2906_vararg1["Velocity"] =larry2963
local _ =task.wait()
local larry2964 =Vector3["new"]
local larry2965 =larry2964(0, 0, 0)
_2906_vararg1["Velocity"] =larry2965
local _ =task.wait()
local larry2966 =Vector3["new"]
local larry2967 =larry2966(0, 0, 0)
_2906_vararg1["Velocity"] =larry2967
end)
end)
local larry2968 =larry2838["FindFirstChildOfClass"]
local larry2969 =larry2968(larry2838, "Humanoid")
local larry2970 =larry2969["IsA"]
local larry2971 =larry2970(larry2969, "BasePart")
local larry2972 =larry2969["GetPropertyChangedSignal"]
local larry2973 =larry2972(larry2969, "Anchored")
local larry2974 =larry2973["Connect"]
local larry2975 =larry2974(larry2973, function(...)
local _2976_vararg1, _2976_vararg2, _2976_vararg3, _2976_vararg4, _2976_vararg5, _2976_vararg6, _2976_vararg7, _2976_vararg8, _2976_vararg9, _2976_vararg10 = ...
local larry2977 =larry2969["Anchored"]
larry2969["Anchored"] =false
end)
local larry2978 =larry2969["ChildAdded"]
local larry2979 =larry2978["Connect"]
local larry2980 =larry2979(larry2978, function(...)
local _2981_vararg1, _2981_vararg2, _2981_vararg3, _2981_vararg4, _2981_vararg5, _2981_vararg6, _2981_vararg7, _2981_vararg8, _2981_vararg9, _2981_vararg10 = ...
local larry2982 =_2981_vararg1["IsA"]
local larry2983 =larry2982(_2981_vararg1, "BallSocketConstraint")
local larry2984 =_2981_vararg1["Parent"]
local larry2985 =_2981_vararg1["Destroy"]
local larry2986 =larry2985(_2981_vararg1)
local larry2987 =larry25["Character"]
local larry2988 =larry25["Character"]
local larry2989 =larry2988["FindFirstChild"]
local larry2990 =larry2989(larry2988, "Humanoid")
local larry2991 =larry25["Character"]
local larry2992 =larry2991["Humanoid"]
local larry2993 =larry25["Character"]
local larry2994 =larry2993["FindFirstChild"]
local larry2995 =larry2994(larry2993, "HumanoidRootPart")
local larry2996 =larry2992["ChangeState"]
local larry2997 =Enum["HumanoidStateType"]
local larry2998 =larry2997["GettingUp"]
local larry2999 =larry2996(larry2992, larry2998)
larry2992["PlatformStand"] =false
local larry3000 =workspace["CurrentCamera"]
larry3000["CameraSubject"] =larry2992
larry2995["CanCollide"] =true
local larry3001 =larry2969["FindFirstChildWhichIsA"]
local larry3002 =larry3001(larry2969, "Motor6D")
local larry3003 =larry2969["FindFirstChildWhichIsA"]
local larry3004 =larry3003(larry2969, "Motor6D")
larry3004["Enabled"] =true
local larry3005 =larry25["PlayerScripts"]
local larry3006 =larry3005["PlayerModule"]
local larry3007 =larry3006["ControlModule"]
local larry3008 =require(larry3007)
local larry3009 =larry3008["Enable"]
local larry3010 =larry3009(larry3008)
local _ =task.wait()
local larry3011 =Vector3["new"]
local larry3012 =larry3011(0, 0, 0)
larry2969["Velocity"] =larry3012
local _ =task.wait()
local larry3013 =Vector3["new"]
local larry3014 =larry3013(0, 0, 0)
larry2969["Velocity"] =larry3014
local _ =task.wait()
local larry3015 =Vector3["new"]
local larry3016 =larry3015(0, 0, 0)
larry2969["Velocity"] =larry3016
local _ =task.wait()
local larry3017 =Vector3["new"]
local larry3018 =larry3017(0, 0, 0)
larry2969["Velocity"] =larry3018
local _ =task.wait()
local larry3019 =Vector3["new"]
local larry3020 =larry3019(0, 0, 0)
larry2969["Velocity"] =larry3020
local _ =task.wait()
local larry3021 =Vector3["new"]
local larry3022 =larry3021(0, 0, 0)
larry2969["Velocity"] =larry3022
local _ =task.wait()
local larry3023 =Vector3["new"]
local larry3024 =larry3023(0, 0, 0)
larry2969["Velocity"] =larry3024
local _ =task.wait()
local larry3025 =Vector3["new"]
local larry3026 =larry3025(0, 0, 0)
larry2969["Velocity"] =larry3026
local _ =task.wait()
local larry3027 =Vector3["new"]
local larry3028 =larry3027(0, 0, 0)
larry2969["Velocity"] =larry3028
local _ =task.wait()
local larry3029 =Vector3["new"]
local larry3030 =larry3029(0, 0, 0)
larry2969["Velocity"] =larry3030
end)
local larry3031 =larry25["CharacterAdded"]
local larry3032 =larry3031["Connect"]
local larry3033 =larry3032(larry3031, function(...)
local _3034_vararg1, _3034_vararg2, _3034_vararg3, _3034_vararg4, _3034_vararg5, _3034_vararg6, _3034_vararg7, _3034_vararg8, _3034_vararg9, _3034_vararg10 = ...
local _ =task.wait(0.1)
local larry3035 =_3034_vararg1["GetChildren"]
local larry3036 =larry3035(_3034_vararg1)
for larry3037, _3037_2 in pairs(larry3036) do
local larry3038 =_3037_2["IsA"]
local larry3039 =larry3038(_3037_2, "BasePart")
local larry3040 =_3037_2["GetPropertyChangedSignal"]
local larry3041 =larry3040(_3037_2, "Anchored")
local larry3042 =larry3041["Connect"]
local larry3043 =larry3042(larry3041, function(...)
local _3044_vararg1, _3044_vararg2, _3044_vararg3, _3044_vararg4, _3044_vararg5, _3044_vararg6, _3044_vararg7, _3044_vararg8, _3044_vararg9, _3044_vararg10 = ...
local larry3045 =_3037_2["Anchored"]
_3037_2["Anchored"] =false
end)
local larry3046 =_3037_2["ChildAdded"]
local larry3047 =larry3046["Connect"]
local larry3048 =larry3047(larry3046, function(...)
local _3049_vararg1, _3049_vararg2, _3049_vararg3, _3049_vararg4, _3049_vararg5, _3049_vararg6, _3049_vararg7, _3049_vararg8, _3049_vararg9, _3049_vararg10 = ...
local larry3050 =_3049_vararg1["IsA"]
local larry3051 =larry3050(_3049_vararg1, "BallSocketConstraint")
local larry3052 =_3049_vararg1["Parent"]
local larry3053 =_3049_vararg1["Destroy"]
local larry3054 =larry3053(_3049_vararg1)
local larry3055 =larry25["Character"]
local larry3056 =larry25["Character"]
local larry3057 =larry3056["FindFirstChild"]
local larry3058 =larry3057(larry3056, "Humanoid")
local larry3059 =larry25["Character"]
local larry3060 =larry3059["Humanoid"]
local larry3061 =larry25["Character"]
local larry3062 =larry3061["FindFirstChild"]
local larry3063 =larry3062(larry3061, "HumanoidRootPart")
local larry3064 =larry3060["ChangeState"]
local larry3065 =Enum["HumanoidStateType"]
local larry3066 =larry3065["GettingUp"]
local larry3067 =larry3064(larry3060, larry3066)
larry3060["PlatformStand"] =false
local larry3068 =workspace["CurrentCamera"]
larry3068["CameraSubject"] =larry3060
larry3063["CanCollide"] =true
local larry3069 =_3037_2["FindFirstChildWhichIsA"]
local larry3070 =larry3069(_3037_2, "Motor6D")
local larry3071 =_3037_2["FindFirstChildWhichIsA"]
local larry3072 =larry3071(_3037_2, "Motor6D")
larry3072["Enabled"] =true
local larry3073 =larry25["PlayerScripts"]
local larry3074 =larry3073["PlayerModule"]
local larry3075 =larry3074["ControlModule"]
local larry3076 =require(larry3075)
local larry3077 =larry3076["Enable"]
local larry3078 =larry3077(larry3076)
local _ =task.wait()
local larry3079 =Vector3["new"]
local larry3080 =larry3079(0, 0, 0)
_3037_2["Velocity"] =larry3080
local _ =task.wait()
local larry3081 =Vector3["new"]
local larry3082 =larry3081(0, 0, 0)
_3037_2["Velocity"] =larry3082
local _ =task.wait()
local larry3083 =Vector3["new"]
local larry3084 =larry3083(0, 0, 0)
_3037_2["Velocity"] =larry3084
local _ =task.wait()
local larry3085 =Vector3["new"]
local larry3086 =larry3085(0, 0, 0)
_3037_2["Velocity"] =larry3086
local _ =task.wait()
local larry3087 =Vector3["new"]
local larry3088 =larry3087(0, 0, 0)
_3037_2["Velocity"] =larry3088
local _ =task.wait()
local larry3089 =Vector3["new"]
local larry3090 =larry3089(0, 0, 0)
_3037_2["Velocity"] =larry3090
local _ =task.wait()
local larry3091 =Vector3["new"]
local larry3092 =larry3091(0, 0, 0)
_3037_2["Velocity"] =larry3092
local _ =task.wait()
local larry3093 =Vector3["new"]
local larry3094 =larry3093(0, 0, 0)
_3037_2["Velocity"] =larry3094
local _ =task.wait()
local larry3095 =Vector3["new"]
local larry3096 =larry3095(0, 0, 0)
_3037_2["Velocity"] =larry3096
local _ =task.wait()
local larry3097 =Vector3["new"]
local larry3098 =larry3097(0, 0, 0)
_3037_2["Velocity"] =larry3098
end)
end
local larry3099 =_3034_vararg1["ChildAdded"]
local larry3100 =larry3099["Connect"]
local larry3101 =larry3100(larry3099, function(...)
local _3102_vararg1, _3102_vararg2, _3102_vararg3, _3102_vararg4, _3102_vararg5, _3102_vararg6, _3102_vararg7, _3102_vararg8, _3102_vararg9, _3102_vararg10 = ...
local larry3103 =_3102_vararg1["IsA"]
local larry3104 =larry3103(_3102_vararg1, "BasePart")
local larry3105 =_3102_vararg1["GetPropertyChangedSignal"]
local larry3106 =larry3105(_3102_vararg1, "Anchored")
local larry3107 =larry3106["Connect"]
local larry3108 =larry3107(larry3106, function(...)
local _3109_vararg1, _3109_vararg2, _3109_vararg3, _3109_vararg4, _3109_vararg5, _3109_vararg6, _3109_vararg7, _3109_vararg8, _3109_vararg9, _3109_vararg10 = ...
local larry3110 =_3102_vararg1["Anchored"]
_3102_vararg1["Anchored"] =false
end)
local larry3111 =_3102_vararg1["ChildAdded"]
local larry3112 =larry3111["Connect"]
local larry3113 =larry3112(larry3111, function(...)
local _3114_vararg1, _3114_vararg2, _3114_vararg3, _3114_vararg4, _3114_vararg5, _3114_vararg6, _3114_vararg7, _3114_vararg8, _3114_vararg9, _3114_vararg10 = ...
local larry3115 =_3114_vararg1["IsA"]
local larry3116 =larry3115(_3114_vararg1, "BallSocketConstraint")
local larry3117 =_3114_vararg1["Parent"]
local larry3118 =_3114_vararg1["Destroy"]
local larry3119 =larry3118(_3114_vararg1)
local larry3120 =larry25["Character"]
local larry3121 =larry25["Character"]
local larry3122 =larry3121["FindFirstChild"]
local larry3123 =larry3122(larry3121, "Humanoid")
local larry3124 =larry25["Character"]
local larry3125 =larry3124["Humanoid"]
local larry3126 =larry25["Character"]
local larry3127 =larry3126["FindFirstChild"]
local larry3128 =larry3127(larry3126, "HumanoidRootPart")
local larry3129 =larry3125["ChangeState"]
local larry3130 =Enum["HumanoidStateType"]
local larry3131 =larry3130["GettingUp"]
local larry3132 =larry3129(larry3125, larry3131)
larry3125["PlatformStand"] =false
local larry3133 =workspace["CurrentCamera"]
larry3133["CameraSubject"] =larry3125
larry3128["CanCollide"] =true
local larry3134 =_3102_vararg1["FindFirstChildWhichIsA"]
local larry3135 =larry3134(_3102_vararg1, "Motor6D")
local larry3136 =_3102_vararg1["FindFirstChildWhichIsA"]
local larry3137 =larry3136(_3102_vararg1, "Motor6D")
larry3137["Enabled"] =true
local larry3138 =larry25["PlayerScripts"]
local larry3139 =larry3138["PlayerModule"]
local larry3140 =larry3139["ControlModule"]
local larry3141 =require(larry3140)
local larry3142 =larry3141["Enable"]
local larry3143 =larry3142(larry3141)
local _ =task.wait()
local larry3144 =Vector3["new"]
local larry3145 =larry3144(0, 0, 0)
_3102_vararg1["Velocity"] =larry3145
local _ =task.wait()
local larry3146 =Vector3["new"]
local larry3147 =larry3146(0, 0, 0)
_3102_vararg1["Velocity"] =larry3147
local _ =task.wait()
local larry3148 =Vector3["new"]
local larry3149 =larry3148(0, 0, 0)
_3102_vararg1["Velocity"] =larry3149
local _ =task.wait()
local larry3150 =Vector3["new"]
local larry3151 =larry3150(0, 0, 0)
_3102_vararg1["Velocity"] =larry3151
local _ =task.wait()
local larry3152 =Vector3["new"]
local larry3153 =larry3152(0, 0, 0)
_3102_vararg1["Velocity"] =larry3153
local _ =task.wait()
local larry3154 =Vector3["new"]
local larry3155 =larry3154(0, 0, 0)
_3102_vararg1["Velocity"] =larry3155
local _ =task.wait()
local larry3156 =Vector3["new"]
local larry3157 =larry3156(0, 0, 0)
_3102_vararg1["Velocity"] =larry3157
local _ =task.wait()
local larry3158 =Vector3["new"]
local larry3159 =larry3158(0, 0, 0)
_3102_vararg1["Velocity"] =larry3159
local _ =task.wait()
local larry3160 =Vector3["new"]
local larry3161 =larry3160(0, 0, 0)
_3102_vararg1["Velocity"] =larry3161
local _ =task.wait()
local larry3162 =Vector3["new"]
local larry3163 =larry3162(0, 0, 0)
_3102_vararg1["Velocity"] =larry3163
end)
end)
local larry3164 =_3034_vararg1["FindFirstChildOfClass"]
local larry3165 =larry3164(_3034_vararg1, "Humanoid")
local larry3166 =larry3165["IsA"]
local larry3167 =larry3166(larry3165, "BasePart")
local larry3168 =larry3165["GetPropertyChangedSignal"]
local larry3169 =larry3168(larry3165, "Anchored")
local larry3170 =larry3169["Connect"]
local larry3171 =larry3170(larry3169, function(...)
local _3172_vararg1, _3172_vararg2, _3172_vararg3, _3172_vararg4, _3172_vararg5, _3172_vararg6, _3172_vararg7, _3172_vararg8, _3172_vararg9, _3172_vararg10 = ...
local larry3173 =larry3165["Anchored"]
larry3165["Anchored"] =false
end)
local larry3174 =larry3165["ChildAdded"]
local larry3175 =larry3174["Connect"]
local larry3176 =larry3175(larry3174, function(...)
local _3177_vararg1, _3177_vararg2, _3177_vararg3, _3177_vararg4, _3177_vararg5, _3177_vararg6, _3177_vararg7, _3177_vararg8, _3177_vararg9, _3177_vararg10 = ...
local larry3178 =_3177_vararg1["IsA"]
local larry3179 =larry3178(_3177_vararg1, "BallSocketConstraint")
local larry3180 =_3177_vararg1["Parent"]
local larry3181 =_3177_vararg1["Destroy"]
local larry3182 =larry3181(_3177_vararg1)
local larry3183 =larry25["Character"]
local larry3184 =larry25["Character"]
local larry3185 =larry3184["FindFirstChild"]
local larry3186 =larry3185(larry3184, "Humanoid")
local larry3187 =larry25["Character"]
local larry3188 =larry3187["Humanoid"]
local larry3189 =larry25["Character"]
local larry3190 =larry3189["FindFirstChild"]
local larry3191 =larry3190(larry3189, "HumanoidRootPart")
local larry3192 =larry3188["ChangeState"]
local larry3193 =Enum["HumanoidStateType"]
local larry3194 =larry3193["GettingUp"]
local larry3195 =larry3192(larry3188, larry3194)
larry3188["PlatformStand"] =false
local larry3196 =workspace["CurrentCamera"]
larry3196["CameraSubject"] =larry3188
larry3191["CanCollide"] =true
local larry3197 =larry3165["FindFirstChildWhichIsA"]
local larry3198 =larry3197(larry3165, "Motor6D")
local larry3199 =larry3165["FindFirstChildWhichIsA"]
local larry3200 =larry3199(larry3165, "Motor6D")
larry3200["Enabled"] =true
local larry3201 =larry25["PlayerScripts"]
local larry3202 =larry3201["PlayerModule"]
local larry3203 =larry3202["ControlModule"]
local larry3204 =require(larry3203)
local larry3205 =larry3204["Enable"]
local larry3206 =larry3205(larry3204)
local _ =task.wait()
local larry3207 =Vector3["new"]
local larry3208 =larry3207(0, 0, 0)
larry3165["Velocity"] =larry3208
local _ =task.wait()
local larry3209 =Vector3["new"]
local larry3210 =larry3209(0, 0, 0)
larry3165["Velocity"] =larry3210
local _ =task.wait()
local larry3211 =Vector3["new"]
local larry3212 =larry3211(0, 0, 0)
larry3165["Velocity"] =larry3212
local _ =task.wait()
local larry3213 =Vector3["new"]
local larry3214 =larry3213(0, 0, 0)
larry3165["Velocity"] =larry3214
local _ =task.wait()
local larry3215 =Vector3["new"]
local larry3216 =larry3215(0, 0, 0)
larry3165["Velocity"] =larry3216
local _ =task.wait()
local larry3217 =Vector3["new"]
local larry3218 =larry3217(0, 0, 0)
larry3165["Velocity"] =larry3218
local _ =task.wait()
local larry3219 =Vector3["new"]
local larry3220 =larry3219(0, 0, 0)
larry3165["Velocity"] =larry3220
local _ =task.wait()
local larry3221 =Vector3["new"]
local larry3222 =larry3221(0, 0, 0)
larry3165["Velocity"] =larry3222
local _ =task.wait()
local larry3223 =Vector3["new"]
local larry3224 =larry3223(0, 0, 0)
larry3165["Velocity"] =larry3224
local _ =task.wait()
local larry3225 =Vector3["new"]
local larry3226 =larry3225(0, 0, 0)
larry3165["Velocity"] =larry3226
end)
end)
end)
local larry3227 =task["spawn"]
local _ =task.wait(0.1)
local larry3230 =larry2847["Disconnect"]
local larry3231 =larry3230(larry2847)
local larry3232 =larry2852["Disconnect"]
local larry3233 =larry3232(larry2852)
local larry3234 =larry2912["Disconnect"]
local larry3235 =larry3234(larry2912)
local larry3236 =larry2917["Disconnect"]
local larry3237 =larry3236(larry2917)
local larry3238 =larry2905["Disconnect"]
local larry3239 =larry3238(larry2905)
local larry3240 =larry2975["Disconnect"]
local larry3241 =larry3240(larry2975)
local larry3242 =larry2980["Disconnect"]
local larry3243 =larry3242(larry2980)
local larry3244 =larry3043["Disconnect"]
local larry3245 =larry3244(larry3043)
local larry3246 =larry3048["Disconnect"]
local larry3247 =larry3246(larry3048)
local larry3248 =larry3108["Disconnect"]
local larry3249 =larry3248(larry3108)
local larry3250 =larry3113["Disconnect"]
local larry3251 =larry3250(larry3113)
local larry3252 =larry3101["Disconnect"]
local larry3253 =larry3252(larry3101)
local larry3254 =larry3171["Disconnect"]
local larry3255 =larry3254(larry3171)
local larry3256 =larry3176["Disconnect"]
local larry3257 =larry3256(larry3176)
local larry3258 =larry3033["Disconnect"]
local larry3259 =larry3258(larry3033)
local larry3260 =larry25["Character"]
local larry3261 =larry25["Character"]
local larry3262 =larry3261["GetChildren"]
local larry3263 =larry3262(larry3261)
local larry3265 =_3264_2["IsA"]
local larry3266 =larry3265(_3264_2, "BasePart")
local larry3267 =_3264_2["GetPropertyChangedSignal"]
local larry3268 =larry3267(_3264_2, "Anchored")
local larry3269 =larry3268["Connect"]
local larry3272 =_3264_2["Anchored"]
local larry3270 =larry3269(larry3268, function(...)
local _3271_vararg1, _3271_vararg2, _3271_vararg3, _3271_vararg4, _3271_vararg5, _3271_vararg6, _3271_vararg7, _3271_vararg8, _3271_vararg9, _3271_vararg10 = ...
local larry3272 =_3264_2["Anchored"]
_3264_2["Anchored"] =false
end)
local larry3273 =_3264_2["ChildAdded"]
local larry3274 =larry3273["Connect"]
local larry3277 =_3276_vararg1["IsA"]
local larry3278 =larry3277(_3276_vararg1, "BallSocketConstraint")
local larry3279 =_3276_vararg1["Parent"]
local larry3280 =_3276_vararg1["Destroy"]
local larry3281 =larry3280(_3276_vararg1)
local larry3282 =larry25["Character"]
local larry3283 =larry25["Character"]
local larry3284 =larry3283["FindFirstChild"]
local larry3285 =larry3284(larry3283, "Humanoid")
local larry3286 =larry25["Character"]
local larry3287 =larry3286["Humanoid"]
local larry3288 =larry25["Character"]
local larry3289 =larry3288["FindFirstChild"]
local larry3290 =larry3289(larry3288, "HumanoidRootPart")
local larry3291 =larry3287["ChangeState"]
local larry3292 =Enum["HumanoidStateType"]
local larry3293 =larry3292["GettingUp"]
local larry3294 =larry3291(larry3287, larry3293)
local larry3295 =workspace["CurrentCamera"]
local larry3296 =_3264_2["FindFirstChildWhichIsA"]
local larry3297 =larry3296(_3264_2, "Motor6D")
local larry3298 =_3264_2["FindFirstChildWhichIsA"]
local larry3299 =larry3298(_3264_2, "Motor6D")
local larry3300 =larry25["PlayerScripts"]
local larry3301 =larry3300["PlayerModule"]
local larry3302 =larry3301["ControlModule"]
local larry3303 =require(larry3302)
local larry3304 =larry3303["Enable"]
local larry3305 =larry3304(larry3303)
local _ =task.wait()
local larry3306 =Vector3["new"]
local larry3307 =larry3306(0, 0, 0)
local _ =task.wait()
local larry3308 =Vector3["new"]
local larry3309 =larry3308(0, 0, 0)
local _ =task.wait()
local larry3310 =Vector3["new"]
local larry3311 =larry3310(0, 0, 0)
local _ =task.wait()
local larry3312 =Vector3["new"]
local larry3313 =larry3312(0, 0, 0)
local _ =task.wait()
local larry3314 =Vector3["new"]
local larry3315 =larry3314(0, 0, 0)
local _ =task.wait()
local larry3316 =Vector3["new"]
local larry3317 =larry3316(0, 0, 0)
local _ =task.wait()
local larry3318 =Vector3["new"]
local larry3319 =larry3318(0, 0, 0)
local _ =task.wait()
local larry3320 =Vector3["new"]
local larry3321 =larry3320(0, 0, 0)
local _ =task.wait()
local larry3322 =Vector3["new"]
local larry3323 =larry3322(0, 0, 0)
local _ =task.wait()
local larry3324 =Vector3["new"]
local larry3325 =larry3324(0, 0, 0)
local larry3275 =larry3274(larry3273, function(...)
local _3276_vararg1, _3276_vararg2, _3276_vararg3, _3276_vararg4, _3276_vararg5, _3276_vararg6, _3276_vararg7, _3276_vararg8, _3276_vararg9, _3276_vararg10 = ...
local larry3277 =_3276_vararg1["IsA"]
local larry3278 =larry3277(_3276_vararg1, "BallSocketConstraint")
local larry3279 =_3276_vararg1["Parent"]
local larry3280 =_3276_vararg1["Destroy"]
local larry3281 =larry3280(_3276_vararg1)
local larry3282 =larry25["Character"]
local larry3283 =larry25["Character"]
local larry3284 =larry3283["FindFirstChild"]
local larry3285 =larry3284(larry3283, "Humanoid")
local larry3286 =larry25["Character"]
local larry3287 =larry3286["Humanoid"]
local larry3288 =larry25["Character"]
local larry3289 =larry3288["FindFirstChild"]
local larry3290 =larry3289(larry3288, "HumanoidRootPart")
local larry3291 =larry3287["ChangeState"]
local larry3292 =Enum["HumanoidStateType"]
local larry3293 =larry3292["GettingUp"]
local larry3294 =larry3291(larry3287, larry3293)
larry3287["PlatformStand"] =false
local larry3295 =workspace["CurrentCamera"]
larry3295["CameraSubject"] =larry3287
larry3290["CanCollide"] =true
local larry3296 =_3264_2["FindFirstChildWhichIsA"]
local larry3297 =larry3296(_3264_2, "Motor6D")
local larry3298 =_3264_2["FindFirstChildWhichIsA"]
local larry3299 =larry3298(_3264_2, "Motor6D")
larry3299["Enabled"] =true
local larry3300 =larry25["PlayerScripts"]
local larry3301 =larry3300["PlayerModule"]
local larry3302 =larry3301["ControlModule"]
local larry3303 =require(larry3302)
local larry3304 =larry3303["Enable"]
local larry3305 =larry3304(larry3303)
local _ =task.wait()
local larry3306 =Vector3["new"]
local larry3307 =larry3306(0, 0, 0)
_3264_2["Velocity"] =larry3307
local _ =task.wait()
local larry3308 =Vector3["new"]
local larry3309 =larry3308(0, 0, 0)
_3264_2["Velocity"] =larry3309
local _ =task.wait()
local larry3310 =Vector3["new"]
local larry3311 =larry3310(0, 0, 0)
_3264_2["Velocity"] =larry3311
local _ =task.wait()
local larry3312 =Vector3["new"]
local larry3313 =larry3312(0, 0, 0)
_3264_2["Velocity"] =larry3313
local _ =task.wait()
local larry3314 =Vector3["new"]
local larry3315 =larry3314(0, 0, 0)
_3264_2["Velocity"] =larry3315
local _ =task.wait()
local larry3316 =Vector3["new"]
local larry3317 =larry3316(0, 0, 0)
_3264_2["Velocity"] =larry3317
local _ =task.wait()
local larry3318 =Vector3["new"]
local larry3319 =larry3318(0, 0, 0)
_3264_2["Velocity"] =larry3319
local _ =task.wait()
local larry3320 =Vector3["new"]
local larry3321 =larry3320(0, 0, 0)
_3264_2["Velocity"] =larry3321
local _ =task.wait()
local larry3322 =Vector3["new"]
local larry3323 =larry3322(0, 0, 0)
_3264_2["Velocity"] =larry3323
local _ =task.wait()
local larry3324 =Vector3["new"]
local larry3325 =larry3324(0, 0, 0)
_3264_2["Velocity"] =larry3325
end)
local larry3326 =larry3261["ChildAdded"]
local larry3327 =larry3326["Connect"]
local larry3330 =_3329_vararg1["IsA"]
local larry3331 =larry3330(_3329_vararg1, "BasePart")
local larry3332 =_3329_vararg1["GetPropertyChangedSignal"]
local larry3333 =larry3332(_3329_vararg1, "Anchored")
local larry3334 =larry3333["Connect"]
local larry3337 =_3329_vararg1["Anchored"]
local larry3335 =larry3334(larry3333, function(...)
local _3336_vararg1, _3336_vararg2, _3336_vararg3, _3336_vararg4, _3336_vararg5, _3336_vararg6, _3336_vararg7, _3336_vararg8, _3336_vararg9, _3336_vararg10 = ...
local larry3337 =_3329_vararg1["Anchored"]
_3329_vararg1["Anchored"] =false
end)
local larry3338 =_3329_vararg1["ChildAdded"]
local larry3339 =larry3338["Connect"]
local larry3342 =_3341_vararg1["IsA"]
local larry3343 =larry3342(_3341_vararg1, "BallSocketConstraint")
local larry3344 =_3341_vararg1["Parent"]
local larry3345 =_3341_vararg1["Destroy"]
local larry3346 =larry3345(_3341_vararg1)
local larry3347 =larry25["Character"]
local larry3348 =larry25["Character"]
local larry3349 =larry3348["FindFirstChild"]
local larry3350 =larry3349(larry3348, "Humanoid")
local larry3351 =larry25["Character"]
local larry3352 =larry3351["Humanoid"]
local larry3353 =larry25["Character"]
local larry3354 =larry3353["FindFirstChild"]
local larry3355 =larry3354(larry3353, "HumanoidRootPart")
local larry3356 =larry3352["ChangeState"]
local larry3357 =Enum["HumanoidStateType"]
local larry3358 =larry3357["GettingUp"]
local larry3359 =larry3356(larry3352, larry3358)
local larry3360 =workspace["CurrentCamera"]
local larry3361 =_3329_vararg1["FindFirstChildWhichIsA"]
local larry3362 =larry3361(_3329_vararg1, "Motor6D")
local larry3363 =_3329_vararg1["FindFirstChildWhichIsA"]
local larry3364 =larry3363(_3329_vararg1, "Motor6D")
local larry3365 =larry25["PlayerScripts"]
local larry3366 =larry3365["PlayerModule"]
local larry3367 =larry3366["ControlModule"]
local larry3368 =require(larry3367)
local larry3369 =larry3368["Enable"]
local larry3370 =larry3369(larry3368)
local _ =task.wait()
local larry3371 =Vector3["new"]
local larry3372 =larry3371(0, 0, 0)
local _ =task.wait()
local larry3373 =Vector3["new"]
local larry3374 =larry3373(0, 0, 0)
local _ =task.wait()
local larry3375 =Vector3["new"]
local larry3376 =larry3375(0, 0, 0)
local _ =task.wait()
local larry3377 =Vector3["new"]
local larry3378 =larry3377(0, 0, 0)
local _ =task.wait()
local larry3379 =Vector3["new"]
local larry3380 =larry3379(0, 0, 0)
local _ =task.wait()
local larry3381 =Vector3["new"]
local larry3382 =larry3381(0, 0, 0)
local _ =task.wait()
local larry3383 =Vector3["new"]
local larry3384 =larry3383(0, 0, 0)
local _ =task.wait()
local larry3385 =Vector3["new"]
local larry3386 =larry3385(0, 0, 0)
local _ =task.wait()
local larry3387 =Vector3["new"]
local larry3388 =larry3387(0, 0, 0)
local _ =task.wait()
local larry3389 =Vector3["new"]
local larry3390 =larry3389(0, 0, 0)
local larry3340 =larry3339(larry3338, function(...)
local _3341_vararg1, _3341_vararg2, _3341_vararg3, _3341_vararg4, _3341_vararg5, _3341_vararg6, _3341_vararg7, _3341_vararg8, _3341_vararg9, _3341_vararg10 = ...
local larry3342 =_3341_vararg1["IsA"]
local larry3343 =larry3342(_3341_vararg1, "BallSocketConstraint")
local larry3344 =_3341_vararg1["Parent"]
local larry3345 =_3341_vararg1["Destroy"]
local larry3346 =larry3345(_3341_vararg1)
local larry3347 =larry25["Character"]
local larry3348 =larry25["Character"]
local larry3349 =larry3348["FindFirstChild"]
local larry3350 =larry3349(larry3348, "Humanoid")
local larry3351 =larry25["Character"]
local larry3352 =larry3351["Humanoid"]
local larry3353 =larry25["Character"]
local larry3354 =larry3353["FindFirstChild"]
local larry3355 =larry3354(larry3353, "HumanoidRootPart")
local larry3356 =larry3352["ChangeState"]
local larry3357 =Enum["HumanoidStateType"]
local larry3358 =larry3357["GettingUp"]
local larry3359 =larry3356(larry3352, larry3358)
larry3352["PlatformStand"] =false
local larry3360 =workspace["CurrentCamera"]
larry3360["CameraSubject"] =larry3352
larry3355["CanCollide"] =true
local larry3361 =_3329_vararg1["FindFirstChildWhichIsA"]
local larry3362 =larry3361(_3329_vararg1, "Motor6D")
local larry3363 =_3329_vararg1["FindFirstChildWhichIsA"]
local larry3364 =larry3363(_3329_vararg1, "Motor6D")
larry3364["Enabled"] =true
local larry3365 =larry25["PlayerScripts"]
local larry3366 =larry3365["PlayerModule"]
local larry3367 =larry3366["ControlModule"]
local larry3368 =require(larry3367)
local larry3369 =larry3368["Enable"]
local larry3370 =larry3369(larry3368)
local _ =task.wait()
local larry3371 =Vector3["new"]
local larry3372 =larry3371(0, 0, 0)
_3329_vararg1["Velocity"] =larry3372
local _ =task.wait()
local larry3373 =Vector3["new"]
local larry3374 =larry3373(0, 0, 0)
_3329_vararg1["Velocity"] =larry3374
local _ =task.wait()
local larry3375 =Vector3["new"]
local larry3376 =larry3375(0, 0, 0)
_3329_vararg1["Velocity"] =larry3376
local _ =task.wait()
local larry3377 =Vector3["new"]
local larry3378 =larry3377(0, 0, 0)
_3329_vararg1["Velocity"] =larry3378
local _ =task.wait()
local larry3379 =Vector3["new"]
local larry3380 =larry3379(0, 0, 0)
_3329_vararg1["Velocity"] =larry3380
local _ =task.wait()
local larry3381 =Vector3["new"]
local larry3382 =larry3381(0, 0, 0)
_3329_vararg1["Velocity"] =larry3382
local _ =task.wait()
local larry3383 =Vector3["new"]
local larry3384 =larry3383(0, 0, 0)
_3329_vararg1["Velocity"] =larry3384
local _ =task.wait()
local larry3385 =Vector3["new"]
local larry3386 =larry3385(0, 0, 0)
_3329_vararg1["Velocity"] =larry3386
local _ =task.wait()
local larry3387 =Vector3["new"]
local larry3388 =larry3387(0, 0, 0)
_3329_vararg1["Velocity"] =larry3388
local _ =task.wait()
local larry3389 =Vector3["new"]
local larry3390 =larry3389(0, 0, 0)
_3329_vararg1["Velocity"] =larry3390
end)
local larry3328 =larry3327(larry3326, function(...)
local _3329_vararg1, _3329_vararg2, _3329_vararg3, _3329_vararg4, _3329_vararg5, _3329_vararg6, _3329_vararg7, _3329_vararg8, _3329_vararg9, _3329_vararg10 = ...
local larry3330 =_3329_vararg1["IsA"]
local larry3331 =larry3330(_3329_vararg1, "BasePart")
local larry3332 =_3329_vararg1["GetPropertyChangedSignal"]
local larry3333 =larry3332(_3329_vararg1, "Anchored")
local larry3334 =larry3333["Connect"]
local larry3335 =larry3334(larry3333, function(...)
local _3336_vararg1, _3336_vararg2, _3336_vararg3, _3336_vararg4, _3336_vararg5, _3336_vararg6, _3336_vararg7, _3336_vararg8, _3336_vararg9, _3336_vararg10 = ...
local larry3337 =_3329_vararg1["Anchored"]
_3329_vararg1["Anchored"] =false
end)
local larry3338 =_3329_vararg1["ChildAdded"]
local larry3339 =larry3338["Connect"]
local larry3340 =larry3339(larry3338, function(...)
local _3341_vararg1, _3341_vararg2, _3341_vararg3, _3341_vararg4, _3341_vararg5, _3341_vararg6, _3341_vararg7, _3341_vararg8, _3341_vararg9, _3341_vararg10 = ...
local larry3342 =_3341_vararg1["IsA"]
local larry3343 =larry3342(_3341_vararg1, "BallSocketConstraint")
local larry3344 =_3341_vararg1["Parent"]
local larry3345 =_3341_vararg1["Destroy"]
local larry3346 =larry3345(_3341_vararg1)
local larry3347 =larry25["Character"]
local larry3348 =larry25["Character"]
local larry3349 =larry3348["FindFirstChild"]
local larry3350 =larry3349(larry3348, "Humanoid")
local larry3351 =larry25["Character"]
local larry3352 =larry3351["Humanoid"]
local larry3353 =larry25["Character"]
local larry3354 =larry3353["FindFirstChild"]
local larry3355 =larry3354(larry3353, "HumanoidRootPart")
local larry3356 =larry3352["ChangeState"]
local larry3357 =Enum["HumanoidStateType"]
local larry3358 =larry3357["GettingUp"]
local larry3359 =larry3356(larry3352, larry3358)
larry3352["PlatformStand"] =false
local larry3360 =workspace["CurrentCamera"]
larry3360["CameraSubject"] =larry3352
larry3355["CanCollide"] =true
local larry3361 =_3329_vararg1["FindFirstChildWhichIsA"]
local larry3362 =larry3361(_3329_vararg1, "Motor6D")
local larry3363 =_3329_vararg1["FindFirstChildWhichIsA"]
local larry3364 =larry3363(_3329_vararg1, "Motor6D")
larry3364["Enabled"] =true
local larry3365 =larry25["PlayerScripts"]
local larry3366 =larry3365["PlayerModule"]
local larry3367 =larry3366["ControlModule"]
local larry3368 =require(larry3367)
local larry3369 =larry3368["Enable"]
local larry3370 =larry3369(larry3368)
local _ =task.wait()
local larry3371 =Vector3["new"]
local larry3372 =larry3371(0, 0, 0)
_3329_vararg1["Velocity"] =larry3372
local _ =task.wait()
local larry3373 =Vector3["new"]
local larry3374 =larry3373(0, 0, 0)
_3329_vararg1["Velocity"] =larry3374
local _ =task.wait()
local larry3375 =Vector3["new"]
local larry3376 =larry3375(0, 0, 0)
_3329_vararg1["Velocity"] =larry3376
local _ =task.wait()
local larry3377 =Vector3["new"]
local larry3378 =larry3377(0, 0, 0)
_3329_vararg1["Velocity"] =larry3378
local _ =task.wait()
local larry3379 =Vector3["new"]
local larry3380 =larry3379(0, 0, 0)
_3329_vararg1["Velocity"] =larry3380
local _ =task.wait()
local larry3381 =Vector3["new"]
local larry3382 =larry3381(0, 0, 0)
_3329_vararg1["Velocity"] =larry3382
local _ =task.wait()
local larry3383 =Vector3["new"]
local larry3384 =larry3383(0, 0, 0)
_3329_vararg1["Velocity"] =larry3384
local _ =task.wait()
local larry3385 =Vector3["new"]
local larry3386 =larry3385(0, 0, 0)
_3329_vararg1["Velocity"] =larry3386
local _ =task.wait()
local larry3387 =Vector3["new"]
local larry3388 =larry3387(0, 0, 0)
_3329_vararg1["Velocity"] =larry3388
local _ =task.wait()
local larry3389 =Vector3["new"]
local larry3390 =larry3389(0, 0, 0)
_3329_vararg1["Velocity"] =larry3390
end)
end)
local larry3391 =larry3261["FindFirstChildOfClass"]
local larry3392 =larry3391(larry3261, "Humanoid")
local larry3393 =larry3392["IsA"]
local larry3394 =larry3393(larry3392, "BasePart")
local larry3395 =larry3392["GetPropertyChangedSignal"]
local larry3396 =larry3395(larry3392, "Anchored")
local larry3397 =larry3396["Connect"]
local larry3400 =larry3392["Anchored"]
local larry3398 =larry3397(larry3396, function(...)
local _3399_vararg1, _3399_vararg2, _3399_vararg3, _3399_vararg4, _3399_vararg5, _3399_vararg6, _3399_vararg7, _3399_vararg8, _3399_vararg9, _3399_vararg10 = ...
local larry3400 =larry3392["Anchored"]
larry3392["Anchored"] =false
end)
local larry3401 =larry3392["ChildAdded"]
local larry3402 =larry3401["Connect"]
local larry3405 =_3404_vararg1["IsA"]
local larry3406 =larry3405(_3404_vararg1, "BallSocketConstraint")
local larry3407 =_3404_vararg1["Parent"]
local larry3408 =_3404_vararg1["Destroy"]
local larry3409 =larry3408(_3404_vararg1)
local larry3410 =larry25["Character"]
local larry3411 =larry25["Character"]
local larry3412 =larry3411["FindFirstChild"]
local larry3413 =larry3412(larry3411, "Humanoid")
local larry3414 =larry25["Character"]
local larry3415 =larry3414["Humanoid"]
local larry3416 =larry25["Character"]
local larry3417 =larry3416["FindFirstChild"]
local larry3418 =larry3417(larry3416, "HumanoidRootPart")
local larry3419 =larry3415["ChangeState"]
local larry3420 =Enum["HumanoidStateType"]
local larry3421 =larry3420["GettingUp"]
local larry3422 =larry3419(larry3415, larry3421)
local larry3423 =workspace["CurrentCamera"]
local larry3424 =larry3392["FindFirstChildWhichIsA"]
local larry3425 =larry3424(larry3392, "Motor6D")
local larry3426 =larry3392["FindFirstChildWhichIsA"]
local larry3427 =larry3426(larry3392, "Motor6D")
local larry3428 =larry25["PlayerScripts"]
local larry3429 =larry3428["PlayerModule"]
local larry3430 =larry3429["ControlModule"]
local larry3431 =require(larry3430)
local larry3432 =larry3431["Enable"]
local larry3433 =larry3432(larry3431)
local _ =task.wait()
local larry3434 =Vector3["new"]
local larry3435 =larry3434(0, 0, 0)
local _ =task.wait()
local larry3436 =Vector3["new"]
local larry3437 =larry3436(0, 0, 0)
local _ =task.wait()
local larry3438 =Vector3["new"]
local larry3439 =larry3438(0, 0, 0)
local _ =task.wait()
local larry3440 =Vector3["new"]
local larry3441 =larry3440(0, 0, 0)
local _ =task.wait()
local larry3442 =Vector3["new"]
local larry3443 =larry3442(0, 0, 0)
local _ =task.wait()
local larry3444 =Vector3["new"]
local larry3445 =larry3444(0, 0, 0)
local _ =task.wait()
local larry3446 =Vector3["new"]
local larry3447 =larry3446(0, 0, 0)
local _ =task.wait()
local larry3448 =Vector3["new"]
local larry3449 =larry3448(0, 0, 0)
local _ =task.wait()
local larry3450 =Vector3["new"]
local larry3451 =larry3450(0, 0, 0)
local _ =task.wait()
local larry3452 =Vector3["new"]
local larry3453 =larry3452(0, 0, 0)
local larry3403 =larry3402(larry3401, function(...)
local _3404_vararg1, _3404_vararg2, _3404_vararg3, _3404_vararg4, _3404_vararg5, _3404_vararg6, _3404_vararg7, _3404_vararg8, _3404_vararg9, _3404_vararg10 = ...
local larry3405 =_3404_vararg1["IsA"]
local larry3406 =larry3405(_3404_vararg1, "BallSocketConstraint")
local larry3407 =_3404_vararg1["Parent"]
local larry3408 =_3404_vararg1["Destroy"]
local larry3409 =larry3408(_3404_vararg1)
local larry3410 =larry25["Character"]
local larry3411 =larry25["Character"]
local larry3412 =larry3411["FindFirstChild"]
local larry3413 =larry3412(larry3411, "Humanoid")
local larry3414 =larry25["Character"]
local larry3415 =larry3414["Humanoid"]
local larry3416 =larry25["Character"]
local larry3417 =larry3416["FindFirstChild"]
local larry3418 =larry3417(larry3416, "HumanoidRootPart")
local larry3419 =larry3415["ChangeState"]
local larry3420 =Enum["HumanoidStateType"]
local larry3421 =larry3420["GettingUp"]
local larry3422 =larry3419(larry3415, larry3421)
larry3415["PlatformStand"] =false
local larry3423 =workspace["CurrentCamera"]
larry3423["CameraSubject"] =larry3415
larry3418["CanCollide"] =true
local larry3424 =larry3392["FindFirstChildWhichIsA"]
local larry3425 =larry3424(larry3392, "Motor6D")
local larry3426 =larry3392["FindFirstChildWhichIsA"]
local larry3427 =larry3426(larry3392, "Motor6D")
larry3427["Enabled"] =true
local larry3428 =larry25["PlayerScripts"]
local larry3429 =larry3428["PlayerModule"]
local larry3430 =larry3429["ControlModule"]
local larry3431 =require(larry3430)
local larry3432 =larry3431["Enable"]
local larry3433 =larry3432(larry3431)
local _ =task.wait()
local larry3434 =Vector3["new"]
local larry3435 =larry3434(0, 0, 0)
larry3392["Velocity"] =larry3435
local _ =task.wait()
local larry3436 =Vector3["new"]
local larry3437 =larry3436(0, 0, 0)
larry3392["Velocity"] =larry3437
local _ =task.wait()
local larry3438 =Vector3["new"]
local larry3439 =larry3438(0, 0, 0)
larry3392["Velocity"] =larry3439
local _ =task.wait()
local larry3440 =Vector3["new"]
local larry3441 =larry3440(0, 0, 0)
larry3392["Velocity"] =larry3441
local _ =task.wait()
local larry3442 =Vector3["new"]
local larry3443 =larry3442(0, 0, 0)
larry3392["Velocity"] =larry3443
local _ =task.wait()
local larry3444 =Vector3["new"]
local larry3445 =larry3444(0, 0, 0)
larry3392["Velocity"] =larry3445
local _ =task.wait()
local larry3446 =Vector3["new"]
local larry3447 =larry3446(0, 0, 0)
larry3392["Velocity"] =larry3447
local _ =task.wait()
local larry3448 =Vector3["new"]
local larry3449 =larry3448(0, 0, 0)
larry3392["Velocity"] =larry3449
local _ =task.wait()
local larry3450 =Vector3["new"]
local larry3451 =larry3450(0, 0, 0)
larry3392["Velocity"] =larry3451
local _ =task.wait()
local larry3452 =Vector3["new"]
local larry3453 =larry3452(0, 0, 0)
larry3392["Velocity"] =larry3453
end)
local larry3454 =larry25["CharacterAdded"]
local larry3455 =larry3454["Connect"]
local _ =task.wait(0.1)
local larry3458 =_3457_vararg1["GetChildren"]
local larry3459 =larry3458(_3457_vararg1)
local larry3461 =_3460_2["IsA"]
local larry3462 =larry3461(_3460_2, "BasePart")
local larry3463 =_3460_2["GetPropertyChangedSignal"]
local larry3464 =larry3463(_3460_2, "Anchored")
local larry3465 =larry3464["Connect"]
local larry3468 =_3460_2["Anchored"]
local larry3466 =larry3465(larry3464, function(...)
local _3467_vararg1, _3467_vararg2, _3467_vararg3, _3467_vararg4, _3467_vararg5, _3467_vararg6, _3467_vararg7, _3467_vararg8, _3467_vararg9, _3467_vararg10 = ...
local larry3468 =_3460_2["Anchored"]
_3460_2["Anchored"] =false
end)
local larry3469 =_3460_2["ChildAdded"]
local larry3470 =larry3469["Connect"]
local larry3473 =_3472_vararg1["IsA"]
local larry3474 =larry3473(_3472_vararg1, "BallSocketConstraint")
local larry3475 =_3472_vararg1["Parent"]
local larry3476 =_3472_vararg1["Destroy"]
local larry3477 =larry3476(_3472_vararg1)
local larry3478 =larry25["Character"]
local larry3479 =larry25["Character"]
local larry3480 =larry3479["FindFirstChild"]
local larry3481 =larry3480(larry3479, "Humanoid")
local larry3482 =larry25["Character"]
local larry3483 =larry3482["Humanoid"]
local larry3484 =larry25["Character"]
local larry3485 =larry3484["FindFirstChild"]
local larry3486 =larry3485(larry3484, "HumanoidRootPart")
local larry3487 =larry3483["ChangeState"]
local larry3488 =Enum["HumanoidStateType"]
local larry3489 =larry3488["GettingUp"]
local larry3490 =larry3487(larry3483, larry3489)
local larry3491 =workspace["CurrentCamera"]
local larry3492 =_3460_2["FindFirstChildWhichIsA"]
local larry3493 =larry3492(_3460_2, "Motor6D")
local larry3494 =_3460_2["FindFirstChildWhichIsA"]
local larry3495 =larry3494(_3460_2, "Motor6D")
local larry3496 =larry25["PlayerScripts"]
local larry3497 =larry3496["PlayerModule"]
local larry3498 =larry3497["ControlModule"]
local larry3499 =require(larry3498)
local larry3500 =larry3499["Enable"]
local larry3501 =larry3500(larry3499)
local _ =task.wait()
local larry3502 =Vector3["new"]
local larry3503 =larry3502(0, 0, 0)
local _ =task.wait()
local larry3504 =Vector3["new"]
local larry3505 =larry3504(0, 0, 0)
local _ =task.wait()
local larry3506 =Vector3["new"]
local larry3507 =larry3506(0, 0, 0)
local _ =task.wait()
local larry3508 =Vector3["new"]
local larry3509 =larry3508(0, 0, 0)
local _ =task.wait()
local larry3510 =Vector3["new"]
local larry3511 =larry3510(0, 0, 0)
local _ =task.wait()
local larry3512 =Vector3["new"]
local larry3513 =larry3512(0, 0, 0)
local _ =task.wait()
local larry3514 =Vector3["new"]
local larry3515 =larry3514(0, 0, 0)
local _ =task.wait()
local larry3516 =Vector3["new"]
local larry3517 =larry3516(0, 0, 0)
local _ =task.wait()
local larry3518 =Vector3["new"]
local larry3519 =larry3518(0, 0, 0)
local _ =task.wait()
local larry3520 =Vector3["new"]
local larry3521 =larry3520(0, 0, 0)
local larry3471 =larry3470(larry3469, function(...)
local _3472_vararg1, _3472_vararg2, _3472_vararg3, _3472_vararg4, _3472_vararg5, _3472_vararg6, _3472_vararg7, _3472_vararg8, _3472_vararg9, _3472_vararg10 = ...
local larry3473 =_3472_vararg1["IsA"]
local larry3474 =larry3473(_3472_vararg1, "BallSocketConstraint")
local larry3475 =_3472_vararg1["Parent"]
local larry3476 =_3472_vararg1["Destroy"]
local larry3477 =larry3476(_3472_vararg1)
local larry3478 =larry25["Character"]
local larry3479 =larry25["Character"]
local larry3480 =larry3479["FindFirstChild"]
local larry3481 =larry3480(larry3479, "Humanoid")
local larry3482 =larry25["Character"]
local larry3483 =larry3482["Humanoid"]
local larry3484 =larry25["Character"]
local larry3485 =larry3484["FindFirstChild"]
local larry3486 =larry3485(larry3484, "HumanoidRootPart")
local larry3487 =larry3483["ChangeState"]
local larry3488 =Enum["HumanoidStateType"]
local larry3489 =larry3488["GettingUp"]
local larry3490 =larry3487(larry3483, larry3489)
larry3483["PlatformStand"] =false
local larry3491 =workspace["CurrentCamera"]
larry3491["CameraSubject"] =larry3483
larry3486["CanCollide"] =true
local larry3492 =_3460_2["FindFirstChildWhichIsA"]
local larry3493 =larry3492(_3460_2, "Motor6D")
local larry3494 =_3460_2["FindFirstChildWhichIsA"]
local larry3495 =larry3494(_3460_2, "Motor6D")
larry3495["Enabled"] =true
local larry3496 =larry25["PlayerScripts"]
local larry3497 =larry3496["PlayerModule"]
local larry3498 =larry3497["ControlModule"]
local larry3499 =require(larry3498)
local larry3500 =larry3499["Enable"]
local larry3501 =larry3500(larry3499)
local _ =task.wait()
local larry3502 =Vector3["new"]
local larry3503 =larry3502(0, 0, 0)
_3460_2["Velocity"] =larry3503
local _ =task.wait()
local larry3504 =Vector3["new"]
local larry3505 =larry3504(0, 0, 0)
_3460_2["Velocity"] =larry3505
local _ =task.wait()
local larry3506 =Vector3["new"]
local larry3507 =larry3506(0, 0, 0)
_3460_2["Velocity"] =larry3507
local _ =task.wait()
local larry3508 =Vector3["new"]
local larry3509 =larry3508(0, 0, 0)
_3460_2["Velocity"] =larry3509
local _ =task.wait()
local larry3510 =Vector3["new"]
local larry3511 =larry3510(0, 0, 0)
_3460_2["Velocity"] =larry3511
local _ =task.wait()
local larry3512 =Vector3["new"]
local larry3513 =larry3512(0, 0, 0)
_3460_2["Velocity"] =larry3513
local _ =task.wait()
local larry3514 =Vector3["new"]
local larry3515 =larry3514(0, 0, 0)
_3460_2["Velocity"] =larry3515
local _ =task.wait()
local larry3516 =Vector3["new"]
local larry3517 =larry3516(0, 0, 0)
_3460_2["Velocity"] =larry3517
local _ =task.wait()
local larry3518 =Vector3["new"]
local larry3519 =larry3518(0, 0, 0)
_3460_2["Velocity"] =larry3519
local _ =task.wait()
local larry3520 =Vector3["new"]
local larry3521 =larry3520(0, 0, 0)
_3460_2["Velocity"] =larry3521
end)
local larry3522 =_3457_vararg1["ChildAdded"]
local larry3523 =larry3522["Connect"]
local larry3526 =_3525_vararg1["IsA"]
local larry3527 =larry3526(_3525_vararg1, "BasePart")
local larry3528 =_3525_vararg1["GetPropertyChangedSignal"]
local larry3529 =larry3528(_3525_vararg1, "Anchored")
local larry3530 =larry3529["Connect"]
local larry3533 =_3525_vararg1["Anchored"]
local larry3531 =larry3530(larry3529, function(...)
local _3532_vararg1, _3532_vararg2, _3532_vararg3, _3532_vararg4, _3532_vararg5, _3532_vararg6, _3532_vararg7, _3532_vararg8, _3532_vararg9, _3532_vararg10 = ...
local larry3533 =_3525_vararg1["Anchored"]
_3525_vararg1["Anchored"] =false
end)
local larry3534 =_3525_vararg1["ChildAdded"]
local larry3535 =larry3534["Connect"]
local larry3538 =_3537_vararg1["IsA"]
local larry3539 =larry3538(_3537_vararg1, "BallSocketConstraint")
local larry3540 =_3537_vararg1["Parent"]
local larry3541 =_3537_vararg1["Destroy"]
local larry3542 =larry3541(_3537_vararg1)
local larry3543 =larry25["Character"]
local larry3544 =larry25["Character"]
local larry3545 =larry3544["FindFirstChild"]
local larry3546 =larry3545(larry3544, "Humanoid")
local larry3547 =larry25["Character"]
local larry3548 =larry3547["Humanoid"]
local larry3549 =larry25["Character"]
local larry3550 =larry3549["FindFirstChild"]
local larry3551 =larry3550(larry3549, "HumanoidRootPart")
local larry3552 =larry3548["ChangeState"]
local larry3553 =Enum["HumanoidStateType"]
local larry3554 =larry3553["GettingUp"]
local larry3555 =larry3552(larry3548, larry3554)
local larry3556 =workspace["CurrentCamera"]
local larry3557 =_3525_vararg1["FindFirstChildWhichIsA"]
local larry3558 =larry3557(_3525_vararg1, "Motor6D")
local larry3559 =_3525_vararg1["FindFirstChildWhichIsA"]
local larry3560 =larry3559(_3525_vararg1, "Motor6D")
local larry3561 =larry25["PlayerScripts"]
local larry3562 =larry3561["PlayerModule"]
local larry3563 =larry3562["ControlModule"]
local larry3564 =require(larry3563)
local larry3565 =larry3564["Enable"]
local larry3566 =larry3565(larry3564)
local _ =task.wait()
local larry3567 =Vector3["new"]
local larry3568 =larry3567(0, 0, 0)
local _ =task.wait()
local larry3569 =Vector3["new"]
local larry3570 =larry3569(0, 0, 0)
local _ =task.wait()
local larry3571 =Vector3["new"]
local larry3572 =larry3571(0, 0, 0)
local _ =task.wait()
local larry3573 =Vector3["new"]
local larry3574 =larry3573(0, 0, 0)
local _ =task.wait()
local larry3575 =Vector3["new"]
local larry3576 =larry3575(0, 0, 0)
local _ =task.wait()
local larry3577 =Vector3["new"]
local larry3578 =larry3577(0, 0, 0)
local _ =task.wait()
local larry3579 =Vector3["new"]
local larry3580 =larry3579(0, 0, 0)
local _ =task.wait()
local larry3581 =Vector3["new"]
local larry3582 =larry3581(0, 0, 0)
local _ =task.wait()
local larry3583 =Vector3["new"]
local larry3584 =larry3583(0, 0, 0)
local _ =task.wait()
local larry3585 =Vector3["new"]
local larry3586 =larry3585(0, 0, 0)
local larry3536 =larry3535(larry3534, function(...)
local _3537_vararg1, _3537_vararg2, _3537_vararg3, _3537_vararg4, _3537_vararg5, _3537_vararg6, _3537_vararg7, _3537_vararg8, _3537_vararg9, _3537_vararg10 = ...
local larry3538 =_3537_vararg1["IsA"]
local larry3539 =larry3538(_3537_vararg1, "BallSocketConstraint")
local larry3540 =_3537_vararg1["Parent"]
local larry3541 =_3537_vararg1["Destroy"]
local larry3542 =larry3541(_3537_vararg1)
local larry3543 =larry25["Character"]
local larry3544 =larry25["Character"]
local larry3545 =larry3544["FindFirstChild"]
local larry3546 =larry3545(larry3544, "Humanoid")
local larry3547 =larry25["Character"]
local larry3548 =larry3547["Humanoid"]
local larry3549 =larry25["Character"]
local larry3550 =larry3549["FindFirstChild"]
local larry3551 =larry3550(larry3549, "HumanoidRootPart")
local larry3552 =larry3548["ChangeState"]
local larry3553 =Enum["HumanoidStateType"]
local larry3554 =larry3553["GettingUp"]
local larry3555 =larry3552(larry3548, larry3554)
larry3548["PlatformStand"] =false
local larry3556 =workspace["CurrentCamera"]
larry3556["CameraSubject"] =larry3548
larry3551["CanCollide"] =true
local larry3557 =_3525_vararg1["FindFirstChildWhichIsA"]
local larry3558 =larry3557(_3525_vararg1, "Motor6D")
local larry3559 =_3525_vararg1["FindFirstChildWhichIsA"]
local larry3560 =larry3559(_3525_vararg1, "Motor6D")
larry3560["Enabled"] =true
local larry3561 =larry25["PlayerScripts"]
local larry3562 =larry3561["PlayerModule"]
local larry3563 =larry3562["ControlModule"]
local larry3564 =require(larry3563)
local larry3565 =larry3564["Enable"]
local larry3566 =larry3565(larry3564)
local _ =task.wait()
local larry3567 =Vector3["new"]
local larry3568 =larry3567(0, 0, 0)
_3525_vararg1["Velocity"] =larry3568
local _ =task.wait()
local larry3569 =Vector3["new"]
local larry3570 =larry3569(0, 0, 0)
_3525_vararg1["Velocity"] =larry3570
local _ =task.wait()
local larry3571 =Vector3["new"]
local larry3572 =larry3571(0, 0, 0)
_3525_vararg1["Velocity"] =larry3572
local _ =task.wait()
local larry3573 =Vector3["new"]
local larry3574 =larry3573(0, 0, 0)
_3525_vararg1["Velocity"] =larry3574
local _ =task.wait()
local larry3575 =Vector3["new"]
local larry3576 =larry3575(0, 0, 0)
_3525_vararg1["Velocity"] =larry3576
local _ =task.wait()
local larry3577 =Vector3["new"]
local larry3578 =larry3577(0, 0, 0)
_3525_vararg1["Velocity"] =larry3578
local _ =task.wait()
local larry3579 =Vector3["new"]
local larry3580 =larry3579(0, 0, 0)
_3525_vararg1["Velocity"] =larry3580
local _ =task.wait()
local larry3581 =Vector3["new"]
local larry3582 =larry3581(0, 0, 0)
_3525_vararg1["Velocity"] =larry3582
local _ =task.wait()
local larry3583 =Vector3["new"]
local larry3584 =larry3583(0, 0, 0)
_3525_vararg1["Velocity"] =larry3584
local _ =task.wait()
local larry3585 =Vector3["new"]
local larry3586 =larry3585(0, 0, 0)
_3525_vararg1["Velocity"] =larry3586
end)
local larry3524 =larry3523(larry3522, function(...)
local _3525_vararg1, _3525_vararg2, _3525_vararg3, _3525_vararg4, _3525_vararg5, _3525_vararg6, _3525_vararg7, _3525_vararg8, _3525_vararg9, _3525_vararg10 = ...
local larry3526 =_3525_vararg1["IsA"]
local larry3527 =larry3526(_3525_vararg1, "BasePart")
local larry3528 =_3525_vararg1["GetPropertyChangedSignal"]
local larry3529 =larry3528(_3525_vararg1, "Anchored")
local larry3530 =larry3529["Connect"]
local larry3531 =larry3530(larry3529, function(...)
local _3532_vararg1, _3532_vararg2, _3532_vararg3, _3532_vararg4, _3532_vararg5, _3532_vararg6, _3532_vararg7, _3532_vararg8, _3532_vararg9, _3532_vararg10 = ...
local larry3533 =_3525_vararg1["Anchored"]
_3525_vararg1["Anchored"] =false
end)
local larry3534 =_3525_vararg1["ChildAdded"]
local larry3535 =larry3534["Connect"]
local larry3536 =larry3535(larry3534, function(...)
local _3537_vararg1, _3537_vararg2, _3537_vararg3, _3537_vararg4, _3537_vararg5, _3537_vararg6, _3537_vararg7, _3537_vararg8, _3537_vararg9, _3537_vararg10 = ...
local larry3538 =_3537_vararg1["IsA"]
local larry3539 =larry3538(_3537_vararg1, "BallSocketConstraint")
local larry3540 =_3537_vararg1["Parent"]
local larry3541 =_3537_vararg1["Destroy"]
local larry3542 =larry3541(_3537_vararg1)
local larry3543 =larry25["Character"]
local larry3544 =larry25["Character"]
local larry3545 =larry3544["FindFirstChild"]
local larry3546 =larry3545(larry3544, "Humanoid")
local larry3547 =larry25["Character"]
local larry3548 =larry3547["Humanoid"]
local larry3549 =larry25["Character"]
local larry3550 =larry3549["FindFirstChild"]
local larry3551 =larry3550(larry3549, "HumanoidRootPart")
local larry3552 =larry3548["ChangeState"]
local larry3553 =Enum["HumanoidStateType"]
local larry3554 =larry3553["GettingUp"]
local larry3555 =larry3552(larry3548, larry3554)
larry3548["PlatformStand"] =false
local larry3556 =workspace["CurrentCamera"]
larry3556["CameraSubject"] =larry3548
larry3551["CanCollide"] =true
local larry3557 =_3525_vararg1["FindFirstChildWhichIsA"]
local larry3558 =larry3557(_3525_vararg1, "Motor6D")
local larry3559 =_3525_vararg1["FindFirstChildWhichIsA"]
local larry3560 =larry3559(_3525_vararg1, "Motor6D")
larry3560["Enabled"] =true
local larry3561 =larry25["PlayerScripts"]
local larry3562 =larry3561["PlayerModule"]
local larry3563 =larry3562["ControlModule"]
local larry3564 =require(larry3563)
local larry3565 =larry3564["Enable"]
local larry3566 =larry3565(larry3564)
local _ =task.wait()
local larry3567 =Vector3["new"]
local larry3568 =larry3567(0, 0, 0)
_3525_vararg1["Velocity"] =larry3568
local _ =task.wait()
local larry3569 =Vector3["new"]
local larry3570 =larry3569(0, 0, 0)
_3525_vararg1["Velocity"] =larry3570
local _ =task.wait()
local larry3571 =Vector3["new"]
local larry3572 =larry3571(0, 0, 0)
_3525_vararg1["Velocity"] =larry3572
local _ =task.wait()
local larry3573 =Vector3["new"]
local larry3574 =larry3573(0, 0, 0)
_3525_vararg1["Velocity"] =larry3574
local _ =task.wait()
local larry3575 =Vector3["new"]
local larry3576 =larry3575(0, 0, 0)
_3525_vararg1["Velocity"] =larry3576
local _ =task.wait()
local larry3577 =Vector3["new"]
local larry3578 =larry3577(0, 0, 0)
_3525_vararg1["Velocity"] =larry3578
local _ =task.wait()
local larry3579 =Vector3["new"]
local larry3580 =larry3579(0, 0, 0)
_3525_vararg1["Velocity"] =larry3580
local _ =task.wait()
local larry3581 =Vector3["new"]
local larry3582 =larry3581(0, 0, 0)
_3525_vararg1["Velocity"] =larry3582
local _ =task.wait()
local larry3583 =Vector3["new"]
local larry3584 =larry3583(0, 0, 0)
_3525_vararg1["Velocity"] =larry3584
local _ =task.wait()
local larry3585 =Vector3["new"]
local larry3586 =larry3585(0, 0, 0)
_3525_vararg1["Velocity"] =larry3586
end)
end)
local larry3587 =_3457_vararg1["FindFirstChildOfClass"]
local larry3588 =larry3587(_3457_vararg1, "Humanoid")
local larry3589 =larry3588["IsA"]
local larry3590 =larry3589(larry3588, "BasePart")
local larry3591 =larry3588["GetPropertyChangedSignal"]
local larry3592 =larry3591(larry3588, "Anchored")
local larry3593 =larry3592["Connect"]
local larry3596 =larry3588["Anchored"]
local larry3594 =larry3593(larry3592, function(...)
local _3595_vararg1, _3595_vararg2, _3595_vararg3, _3595_vararg4, _3595_vararg5, _3595_vararg6, _3595_vararg7, _3595_vararg8, _3595_vararg9, _3595_vararg10 = ...
local larry3596 =larry3588["Anchored"]
larry3588["Anchored"] =false
end)
local larry3597 =larry3588["ChildAdded"]
local larry3598 =larry3597["Connect"]
local larry3601 =_3600_vararg1["IsA"]
local larry3602 =larry3601(_3600_vararg1, "BallSocketConstraint")
local larry3603 =_3600_vararg1["Parent"]
local larry3604 =_3600_vararg1["Destroy"]
local larry3605 =larry3604(_3600_vararg1)
local larry3606 =larry25["Character"]
local larry3607 =larry25["Character"]
local larry3608 =larry3607["FindFirstChild"]
local larry3609 =larry3608(larry3607, "Humanoid")
local larry3610 =larry25["Character"]
local larry3611 =larry3610["Humanoid"]
local larry3612 =larry25["Character"]
local larry3613 =larry3612["FindFirstChild"]
local larry3614 =larry3613(larry3612, "HumanoidRootPart")
local larry3615 =larry3611["ChangeState"]
local larry3616 =Enum["HumanoidStateType"]
local larry3617 =larry3616["GettingUp"]
local larry3618 =larry3615(larry3611, larry3617)
local larry3619 =workspace["CurrentCamera"]
local larry3620 =larry3588["FindFirstChildWhichIsA"]
local larry3621 =larry3620(larry3588, "Motor6D")
local larry3622 =larry3588["FindFirstChildWhichIsA"]
local larry3623 =larry3622(larry3588, "Motor6D")
local larry3624 =larry25["PlayerScripts"]
local larry3625 =larry3624["PlayerModule"]
local larry3626 =larry3625["ControlModule"]
local larry3627 =require(larry3626)
local larry3628 =larry3627["Enable"]
local larry3629 =larry3628(larry3627)
local _ =task.wait()
local larry3630 =Vector3["new"]
local larry3631 =larry3630(0, 0, 0)
local _ =task.wait()
local larry3632 =Vector3["new"]
local larry3633 =larry3632(0, 0, 0)
local _ =task.wait()
local larry3634 =Vector3["new"]
local larry3635 =larry3634(0, 0, 0)
local _ =task.wait()
local larry3636 =Vector3["new"]
local larry3637 =larry3636(0, 0, 0)
local _ =task.wait()
local larry3638 =Vector3["new"]
local larry3639 =larry3638(0, 0, 0)
local _ =task.wait()
local larry3640 =Vector3["new"]
local larry3641 =larry3640(0, 0, 0)
local _ =task.wait()
local larry3642 =Vector3["new"]
local larry3643 =larry3642(0, 0, 0)
local _ =task.wait()
local larry3644 =Vector3["new"]
local larry3645 =larry3644(0, 0, 0)
local _ =task.wait()
local larry3646 =Vector3["new"]
local larry3647 =larry3646(0, 0, 0)
local _ =task.wait()
local larry3648 =Vector3["new"]
local larry3649 =larry3648(0, 0, 0)
local larry3599 =larry3598(larry3597, function(...)
local _3600_vararg1, _3600_vararg2, _3600_vararg3, _3600_vararg4, _3600_vararg5, _3600_vararg6, _3600_vararg7, _3600_vararg8, _3600_vararg9, _3600_vararg10 = ...
local larry3601 =_3600_vararg1["IsA"]
local larry3602 =larry3601(_3600_vararg1, "BallSocketConstraint")
local larry3603 =_3600_vararg1["Parent"]
local larry3604 =_3600_vararg1["Destroy"]
local larry3605 =larry3604(_3600_vararg1)
local larry3606 =larry25["Character"]
local larry3607 =larry25["Character"]
local larry3608 =larry3607["FindFirstChild"]
local larry3609 =larry3608(larry3607, "Humanoid")
local larry3610 =larry25["Character"]
local larry3611 =larry3610["Humanoid"]
local larry3612 =larry25["Character"]
local larry3613 =larry3612["FindFirstChild"]
local larry3614 =larry3613(larry3612, "HumanoidRootPart")
local larry3615 =larry3611["ChangeState"]
local larry3616 =Enum["HumanoidStateType"]
local larry3617 =larry3616["GettingUp"]
local larry3618 =larry3615(larry3611, larry3617)
larry3611["PlatformStand"] =false
local larry3619 =workspace["CurrentCamera"]
larry3619["CameraSubject"] =larry3611
larry3614["CanCollide"] =true
local larry3620 =larry3588["FindFirstChildWhichIsA"]
local larry3621 =larry3620(larry3588, "Motor6D")
local larry3622 =larry3588["FindFirstChildWhichIsA"]
local larry3623 =larry3622(larry3588, "Motor6D")
larry3623["Enabled"] =true
local larry3624 =larry25["PlayerScripts"]
local larry3625 =larry3624["PlayerModule"]
local larry3626 =larry3625["ControlModule"]
local larry3627 =require(larry3626)
local larry3628 =larry3627["Enable"]
local larry3629 =larry3628(larry3627)
local _ =task.wait()
local larry3630 =Vector3["new"]
local larry3631 =larry3630(0, 0, 0)
larry3588["Velocity"] =larry3631
local _ =task.wait()
local larry3632 =Vector3["new"]
local larry3633 =larry3632(0, 0, 0)
larry3588["Velocity"] =larry3633
local _ =task.wait()
local larry3634 =Vector3["new"]
local larry3635 =larry3634(0, 0, 0)
larry3588["Velocity"] =larry3635
local _ =task.wait()
local larry3636 =Vector3["new"]
local larry3637 =larry3636(0, 0, 0)
larry3588["Velocity"] =larry3637
local _ =task.wait()
local larry3638 =Vector3["new"]
local larry3639 =larry3638(0, 0, 0)
larry3588["Velocity"] =larry3639
local _ =task.wait()
local larry3640 =Vector3["new"]
local larry3641 =larry3640(0, 0, 0)
larry3588["Velocity"] =larry3641
local _ =task.wait()
local larry3642 =Vector3["new"]
local larry3643 =larry3642(0, 0, 0)
larry3588["Velocity"] =larry3643
local _ =task.wait()
local larry3644 =Vector3["new"]
local larry3645 =larry3644(0, 0, 0)
larry3588["Velocity"] =larry3645
local _ =task.wait()
local larry3646 =Vector3["new"]
local larry3647 =larry3646(0, 0, 0)
larry3588["Velocity"] =larry3647
local _ =task.wait()
local larry3648 =Vector3["new"]
local larry3649 =larry3648(0, 0, 0)
larry3588["Velocity"] =larry3649
end)
local larry3456 =larry3455(larry3454, function(...)
local _3457_vararg1, _3457_vararg2, _3457_vararg3, _3457_vararg4, _3457_vararg5, _3457_vararg6, _3457_vararg7, _3457_vararg8, _3457_vararg9, _3457_vararg10 = ...
local _ =task.wait(0.1)
local larry3458 =_3457_vararg1["GetChildren"]
local larry3459 =larry3458(_3457_vararg1)
for larry3460, _3460_2 in pairs(larry3459) do
local larry3461 =_3460_2["IsA"]
local larry3462 =larry3461(_3460_2, "BasePart")
local larry3463 =_3460_2["GetPropertyChangedSignal"]
local larry3464 =larry3463(_3460_2, "Anchored")
local larry3465 =larry3464["Connect"]
local larry3466 =larry3465(larry3464, function(...)
local _3467_vararg1, _3467_vararg2, _3467_vararg3, _3467_vararg4, _3467_vararg5, _3467_vararg6, _3467_vararg7, _3467_vararg8, _3467_vararg9, _3467_vararg10 = ...
local larry3468 =_3460_2["Anchored"]
_3460_2["Anchored"] =false
end)
local larry3469 =_3460_2["ChildAdded"]
local larry3470 =larry3469["Connect"]
local larry3471 =larry3470(larry3469, function(...)
local _3472_vararg1, _3472_vararg2, _3472_vararg3, _3472_vararg4, _3472_vararg5, _3472_vararg6, _3472_vararg7, _3472_vararg8, _3472_vararg9, _3472_vararg10 = ...
local larry3473 =_3472_vararg1["IsA"]
local larry3474 =larry3473(_3472_vararg1, "BallSocketConstraint")
local larry3475 =_3472_vararg1["Parent"]
local larry3476 =_3472_vararg1["Destroy"]
local larry3477 =larry3476(_3472_vararg1)
local larry3478 =larry25["Character"]
local larry3479 =larry25["Character"]
local larry3480 =larry3479["FindFirstChild"]
local larry3481 =larry3480(larry3479, "Humanoid")
local larry3482 =larry25["Character"]
local larry3483 =larry3482["Humanoid"]
local larry3484 =larry25["Character"]
local larry3485 =larry3484["FindFirstChild"]
local larry3486 =larry3485(larry3484, "HumanoidRootPart")
local larry3487 =larry3483["ChangeState"]
local larry3488 =Enum["HumanoidStateType"]
local larry3489 =larry3488["GettingUp"]
local larry3490 =larry3487(larry3483, larry3489)
larry3483["PlatformStand"] =false
local larry3491 =workspace["CurrentCamera"]
larry3491["CameraSubject"] =larry3483
larry3486["CanCollide"] =true
local larry3492 =_3460_2["FindFirstChildWhichIsA"]
local larry3493 =larry3492(_3460_2, "Motor6D")
local larry3494 =_3460_2["FindFirstChildWhichIsA"]
local larry3495 =larry3494(_3460_2, "Motor6D")
larry3495["Enabled"] =true
local larry3496 =larry25["PlayerScripts"]
local larry3497 =larry3496["PlayerModule"]
local larry3498 =larry3497["ControlModule"]
local larry3499 =require(larry3498)
local larry3500 =larry3499["Enable"]
local larry3501 =larry3500(larry3499)
local _ =task.wait()
local larry3502 =Vector3["new"]
local larry3503 =larry3502(0, 0, 0)
_3460_2["Velocity"] =larry3503
local _ =task.wait()
local larry3504 =Vector3["new"]
local larry3505 =larry3504(0, 0, 0)
_3460_2["Velocity"] =larry3505
local _ =task.wait()
local larry3506 =Vector3["new"]
local larry3507 =larry3506(0, 0, 0)
_3460_2["Velocity"] =larry3507
local _ =task.wait()
local larry3508 =Vector3["new"]
local larry3509 =larry3508(0, 0, 0)
_3460_2["Velocity"] =larry3509
local _ =task.wait()
local larry3510 =Vector3["new"]
local larry3511 =larry3510(0, 0, 0)
_3460_2["Velocity"] =larry3511
local _ =task.wait()
local larry3512 =Vector3["new"]
local larry3513 =larry3512(0, 0, 0)
_3460_2["Velocity"] =larry3513
local _ =task.wait()
local larry3514 =Vector3["new"]
local larry3515 =larry3514(0, 0, 0)
_3460_2["Velocity"] =larry3515
local _ =task.wait()
local larry3516 =Vector3["new"]
local larry3517 =larry3516(0, 0, 0)
_3460_2["Velocity"] =larry3517
local _ =task.wait()
local larry3518 =Vector3["new"]
local larry3519 =larry3518(0, 0, 0)
_3460_2["Velocity"] =larry3519
local _ =task.wait()
local larry3520 =Vector3["new"]
local larry3521 =larry3520(0, 0, 0)
_3460_2["Velocity"] =larry3521
end)
end
local larry3522 =_3457_vararg1["ChildAdded"]
local larry3523 =larry3522["Connect"]
local larry3524 =larry3523(larry3522, function(...)
local _3525_vararg1, _3525_vararg2, _3525_vararg3, _3525_vararg4, _3525_vararg5, _3525_vararg6, _3525_vararg7, _3525_vararg8, _3525_vararg9, _3525_vararg10 = ...
local larry3526 =_3525_vararg1["IsA"]
local larry3527 =larry3526(_3525_vararg1, "BasePart")
local larry3528 =_3525_vararg1["GetPropertyChangedSignal"]
local larry3529 =larry3528(_3525_vararg1, "Anchored")
local larry3530 =larry3529["Connect"]
local larry3531 =larry3530(larry3529, function(...)
local _3532_vararg1, _3532_vararg2, _3532_vararg3, _3532_vararg4, _3532_vararg5, _3532_vararg6, _3532_vararg7, _3532_vararg8, _3532_vararg9, _3532_vararg10 = ...
local larry3533 =_3525_vararg1["Anchored"]
_3525_vararg1["Anchored"] =false
end)
local larry3534 =_3525_vararg1["ChildAdded"]
local larry3535 =larry3534["Connect"]
local larry3536 =larry3535(larry3534, function(...)
local _3537_vararg1, _3537_vararg2, _3537_vararg3, _3537_vararg4, _3537_vararg5, _3537_vararg6, _3537_vararg7, _3537_vararg8, _3537_vararg9, _3537_vararg10 = ...
local larry3538 =_3537_vararg1["IsA"]
local larry3539 =larry3538(_3537_vararg1, "BallSocketConstraint")
local larry3540 =_3537_vararg1["Parent"]
local larry3541 =_3537_vararg1["Destroy"]
local larry3542 =larry3541(_3537_vararg1)
local larry3543 =larry25["Character"]
local larry3544 =larry25["Character"]
local larry3545 =larry3544["FindFirstChild"]
local larry3546 =larry3545(larry3544, "Humanoid")
local larry3547 =larry25["Character"]
local larry3548 =larry3547["Humanoid"]
local larry3549 =larry25["Character"]
local larry3550 =larry3549["FindFirstChild"]
local larry3551 =larry3550(larry3549, "HumanoidRootPart")
local larry3552 =larry3548["ChangeState"]
local larry3553 =Enum["HumanoidStateType"]
local larry3554 =larry3553["GettingUp"]
local larry3555 =larry3552(larry3548, larry3554)
larry3548["PlatformStand"] =false
local larry3556 =workspace["CurrentCamera"]
larry3556["CameraSubject"] =larry3548
larry3551["CanCollide"] =true
local larry3557 =_3525_vararg1["FindFirstChildWhichIsA"]
local larry3558 =larry3557(_3525_vararg1, "Motor6D")
local larry3559 =_3525_vararg1["FindFirstChildWhichIsA"]
local larry3560 =larry3559(_3525_vararg1, "Motor6D")
larry3560["Enabled"] =true
local larry3561 =larry25["PlayerScripts"]
local larry3562 =larry3561["PlayerModule"]
local larry3563 =larry3562["ControlModule"]
local larry3564 =require(larry3563)
local larry3565 =larry3564["Enable"]
local larry3566 =larry3565(larry3564)
local _ =task.wait()
local larry3567 =Vector3["new"]
local larry3568 =larry3567(0, 0, 0)
_3525_vararg1["Velocity"] =larry3568
local _ =task.wait()
local larry3569 =Vector3["new"]
local larry3570 =larry3569(0, 0, 0)
_3525_vararg1["Velocity"] =larry3570
local _ =task.wait()
local larry3571 =Vector3["new"]
local larry3572 =larry3571(0, 0, 0)
_3525_vararg1["Velocity"] =larry3572
local _ =task.wait()
local larry3573 =Vector3["new"]
local larry3574 =larry3573(0, 0, 0)
_3525_vararg1["Velocity"] =larry3574
local _ =task.wait()
local larry3575 =Vector3["new"]
local larry3576 =larry3575(0, 0, 0)
_3525_vararg1["Velocity"] =larry3576
local _ =task.wait()
local larry3577 =Vector3["new"]
local larry3578 =larry3577(0, 0, 0)
_3525_vararg1["Velocity"] =larry3578
local _ =task.wait()
local larry3579 =Vector3["new"]
local larry3580 =larry3579(0, 0, 0)
_3525_vararg1["Velocity"] =larry3580
local _ =task.wait()
local larry3581 =Vector3["new"]
local larry3582 =larry3581(0, 0, 0)
_3525_vararg1["Velocity"] =larry3582
local _ =task.wait()
local larry3583 =Vector3["new"]
local larry3584 =larry3583(0, 0, 0)
_3525_vararg1["Velocity"] =larry3584
local _ =task.wait()
local larry3585 =Vector3["new"]
local larry3586 =larry3585(0, 0, 0)
_3525_vararg1["Velocity"] =larry3586
end)
end)
local larry3587 =_3457_vararg1["FindFirstChildOfClass"]
local larry3588 =larry3587(_3457_vararg1, "Humanoid")
local larry3589 =larry3588["IsA"]
local larry3590 =larry3589(larry3588, "BasePart")
local larry3591 =larry3588["GetPropertyChangedSignal"]
local larry3592 =larry3591(larry3588, "Anchored")
local larry3593 =larry3592["Connect"]
local larry3594 =larry3593(larry3592, function(...)
local _3595_vararg1, _3595_vararg2, _3595_vararg3, _3595_vararg4, _3595_vararg5, _3595_vararg6, _3595_vararg7, _3595_vararg8, _3595_vararg9, _3595_vararg10 = ...
local larry3596 =larry3588["Anchored"]
larry3588["Anchored"] =false
end)
local larry3597 =larry3588["ChildAdded"]
local larry3598 =larry3597["Connect"]
local larry3599 =larry3598(larry3597, function(...)
local _3600_vararg1, _3600_vararg2, _3600_vararg3, _3600_vararg4, _3600_vararg5, _3600_vararg6, _3600_vararg7, _3600_vararg8, _3600_vararg9, _3600_vararg10 = ...
local larry3601 =_3600_vararg1["IsA"]
local larry3602 =larry3601(_3600_vararg1, "BallSocketConstraint")
local larry3603 =_3600_vararg1["Parent"]
local larry3604 =_3600_vararg1["Destroy"]
local larry3605 =larry3604(_3600_vararg1)
local larry3606 =larry25["Character"]
local larry3607 =larry25["Character"]
local larry3608 =larry3607["FindFirstChild"]
local larry3609 =larry3608(larry3607, "Humanoid")
local larry3610 =larry25["Character"]
local larry3611 =larry3610["Humanoid"]
local larry3612 =larry25["Character"]
local larry3613 =larry3612["FindFirstChild"]
local larry3614 =larry3613(larry3612, "HumanoidRootPart")
local larry3615 =larry3611["ChangeState"]
local larry3616 =Enum["HumanoidStateType"]
local larry3617 =larry3616["GettingUp"]
local larry3618 =larry3615(larry3611, larry3617)
larry3611["PlatformStand"] =false
local larry3619 =workspace["CurrentCamera"]
larry3619["CameraSubject"] =larry3611
larry3614["CanCollide"] =true
local larry3620 =larry3588["FindFirstChildWhichIsA"]
local larry3621 =larry3620(larry3588, "Motor6D")
local larry3622 =larry3588["FindFirstChildWhichIsA"]
local larry3623 =larry3622(larry3588, "Motor6D")
larry3623["Enabled"] =true
local larry3624 =larry25["PlayerScripts"]
local larry3625 =larry3624["PlayerModule"]
local larry3626 =larry3625["ControlModule"]
local larry3627 =require(larry3626)
local larry3628 =larry3627["Enable"]
local larry3629 =larry3628(larry3627)
local _ =task.wait()
local larry3630 =Vector3["new"]
local larry3631 =larry3630(0, 0, 0)
larry3588["Velocity"] =larry3631
local _ =task.wait()
local larry3632 =Vector3["new"]
local larry3633 =larry3632(0, 0, 0)
larry3588["Velocity"] =larry3633
local _ =task.wait()
local larry3634 =Vector3["new"]
local larry3635 =larry3634(0, 0, 0)
larry3588["Velocity"] =larry3635
local _ =task.wait()
local larry3636 =Vector3["new"]
local larry3637 =larry3636(0, 0, 0)
larry3588["Velocity"] =larry3637
local _ =task.wait()
local larry3638 =Vector3["new"]
local larry3639 =larry3638(0, 0, 0)
larry3588["Velocity"] =larry3639
local _ =task.wait()
local larry3640 =Vector3["new"]
local larry3641 =larry3640(0, 0, 0)
larry3588["Velocity"] =larry3641
local _ =task.wait()
local larry3642 =Vector3["new"]
local larry3643 =larry3642(0, 0, 0)
larry3588["Velocity"] =larry3643
local _ =task.wait()
local larry3644 =Vector3["new"]
local larry3645 =larry3644(0, 0, 0)
larry3588["Velocity"] =larry3645
local _ =task.wait()
local larry3646 =Vector3["new"]
local larry3647 =larry3646(0, 0, 0)
larry3588["Velocity"] =larry3647
local _ =task.wait()
local larry3648 =Vector3["new"]
local larry3649 =larry3648(0, 0, 0)
larry3588["Velocity"] =larry3649
end)
end)
local larry3228 =larry3227(function(...)
local _3229_vararg1, _3229_vararg2, _3229_vararg3, _3229_vararg4, _3229_vararg5, _3229_vararg6, _3229_vararg7, _3229_vararg8, _3229_vararg9, _3229_vararg10 = ...
local _ =task.wait(0.1)
local larry3230 =larry2847["Disconnect"]
local larry3231 =larry3230(larry2847)
local larry3232 =larry2852["Disconnect"]
local larry3233 =larry3232(larry2852)
local larry3234 =larry2912["Disconnect"]
local larry3235 =larry3234(larry2912)
local larry3236 =larry2917["Disconnect"]
local larry3237 =larry3236(larry2917)
local larry3238 =larry2905["Disconnect"]
local larry3239 =larry3238(larry2905)
local larry3240 =larry2975["Disconnect"]
local larry3241 =larry3240(larry2975)
local larry3242 =larry2980["Disconnect"]
local larry3243 =larry3242(larry2980)
local larry3244 =larry3043["Disconnect"]
local larry3245 =larry3244(larry3043)
local larry3246 =larry3048["Disconnect"]
local larry3247 =larry3246(larry3048)
local larry3248 =larry3108["Disconnect"]
local larry3249 =larry3248(larry3108)
local larry3250 =larry3113["Disconnect"]
local larry3251 =larry3250(larry3113)
local larry3252 =larry3101["Disconnect"]
local larry3253 =larry3252(larry3101)
local larry3254 =larry3171["Disconnect"]
local larry3255 =larry3254(larry3171)
local larry3256 =larry3176["Disconnect"]
local larry3257 =larry3256(larry3176)
local larry3258 =larry3033["Disconnect"]
local larry3259 =larry3258(larry3033)
local larry3260 =larry25["Character"]
local larry3261 =larry25["Character"]
local larry3262 =larry3261["GetChildren"]
local larry3263 =larry3262(larry3261)
for larry3264, _3264_2 in pairs(larry3263) do
local larry3265 =_3264_2["IsA"]
local larry3266 =larry3265(_3264_2, "BasePart")
local larry3267 =_3264_2["GetPropertyChangedSignal"]
local larry3268 =larry3267(_3264_2, "Anchored")
local larry3269 =larry3268["Connect"]
local larry3270 =larry3269(larry3268, function(...)
local _3271_vararg1, _3271_vararg2, _3271_vararg3, _3271_vararg4, _3271_vararg5, _3271_vararg6, _3271_vararg7, _3271_vararg8, _3271_vararg9, _3271_vararg10 = ...
local larry3272 =_3264_2["Anchored"]
_3264_2["Anchored"] =false
end)
local larry3273 =_3264_2["ChildAdded"]
local larry3274 =larry3273["Connect"]
local larry3275 =larry3274(larry3273, function(...)
local _3276_vararg1, _3276_vararg2, _3276_vararg3, _3276_vararg4, _3276_vararg5, _3276_vararg6, _3276_vararg7, _3276_vararg8, _3276_vararg9, _3276_vararg10 = ...
local larry3277 =_3276_vararg1["IsA"]
local larry3278 =larry3277(_3276_vararg1, "BallSocketConstraint")
local larry3279 =_3276_vararg1["Parent"]
local larry3280 =_3276_vararg1["Destroy"]
local larry3281 =larry3280(_3276_vararg1)
local larry3282 =larry25["Character"]
local larry3283 =larry25["Character"]
local larry3284 =larry3283["FindFirstChild"]
local larry3285 =larry3284(larry3283, "Humanoid")
local larry3286 =larry25["Character"]
local larry3287 =larry3286["Humanoid"]
local larry3288 =larry25["Character"]
local larry3289 =larry3288["FindFirstChild"]
local larry3290 =larry3289(larry3288, "HumanoidRootPart")
local larry3291 =larry3287["ChangeState"]
local larry3292 =Enum["HumanoidStateType"]
local larry3293 =larry3292["GettingUp"]
local larry3294 =larry3291(larry3287, larry3293)
larry3287["PlatformStand"] =false
local larry3295 =workspace["CurrentCamera"]
larry3295["CameraSubject"] =larry3287
larry3290["CanCollide"] =true
local larry3296 =_3264_2["FindFirstChildWhichIsA"]
local larry3297 =larry3296(_3264_2, "Motor6D")
local larry3298 =_3264_2["FindFirstChildWhichIsA"]
local larry3299 =larry3298(_3264_2, "Motor6D")
larry3299["Enabled"] =true
local larry3300 =larry25["PlayerScripts"]
local larry3301 =larry3300["PlayerModule"]
local larry3302 =larry3301["ControlModule"]
local larry3303 =require(larry3302)
local larry3304 =larry3303["Enable"]
local larry3305 =larry3304(larry3303)
local _ =task.wait()
local larry3306 =Vector3["new"]
local larry3307 =larry3306(0, 0, 0)
_3264_2["Velocity"] =larry3307
local _ =task.wait()
local larry3308 =Vector3["new"]
local larry3309 =larry3308(0, 0, 0)
_3264_2["Velocity"] =larry3309
local _ =task.wait()
local larry3310 =Vector3["new"]
local larry3311 =larry3310(0, 0, 0)
_3264_2["Velocity"] =larry3311
local _ =task.wait()
local larry3312 =Vector3["new"]
local larry3313 =larry3312(0, 0, 0)
_3264_2["Velocity"] =larry3313
local _ =task.wait()
local larry3314 =Vector3["new"]
local larry3315 =larry3314(0, 0, 0)
_3264_2["Velocity"] =larry3315
local _ =task.wait()
local larry3316 =Vector3["new"]
local larry3317 =larry3316(0, 0, 0)
_3264_2["Velocity"] =larry3317
local _ =task.wait()
local larry3318 =Vector3["new"]
local larry3319 =larry3318(0, 0, 0)
_3264_2["Velocity"] =larry3319
local _ =task.wait()
local larry3320 =Vector3["new"]
local larry3321 =larry3320(0, 0, 0)
_3264_2["Velocity"] =larry3321
local _ =task.wait()
local larry3322 =Vector3["new"]
local larry3323 =larry3322(0, 0, 0)
_3264_2["Velocity"] =larry3323
local _ =task.wait()
local larry3324 =Vector3["new"]
local larry3325 =larry3324(0, 0, 0)
_3264_2["Velocity"] =larry3325
end)
end
local larry3326 =larry3261["ChildAdded"]
local larry3327 =larry3326["Connect"]
local larry3328 =larry3327(larry3326, function(...)
local _3329_vararg1, _3329_vararg2, _3329_vararg3, _3329_vararg4, _3329_vararg5, _3329_vararg6, _3329_vararg7, _3329_vararg8, _3329_vararg9, _3329_vararg10 = ...
local larry3330 =_3329_vararg1["IsA"]
local larry3331 =larry3330(_3329_vararg1, "BasePart")
local larry3332 =_3329_vararg1["GetPropertyChangedSignal"]
local larry3333 =larry3332(_3329_vararg1, "Anchored")
local larry3334 =larry3333["Connect"]
local larry3335 =larry3334(larry3333, function(...)
local _3336_vararg1, _3336_vararg2, _3336_vararg3, _3336_vararg4, _3336_vararg5, _3336_vararg6, _3336_vararg7, _3336_vararg8, _3336_vararg9, _3336_vararg10 = ...
local larry3337 =_3329_vararg1["Anchored"]
_3329_vararg1["Anchored"] =false
end)
local larry3338 =_3329_vararg1["ChildAdded"]
local larry3339 =larry3338["Connect"]
local larry3340 =larry3339(larry3338, function(...)
local _3341_vararg1, _3341_vararg2, _3341_vararg3, _3341_vararg4, _3341_vararg5, _3341_vararg6, _3341_vararg7, _3341_vararg8, _3341_vararg9, _3341_vararg10 = ...
local larry3342 =_3341_vararg1["IsA"]
local larry3343 =larry3342(_3341_vararg1, "BallSocketConstraint")
local larry3344 =_3341_vararg1["Parent"]
local larry3345 =_3341_vararg1["Destroy"]
local larry3346 =larry3345(_3341_vararg1)
local larry3347 =larry25["Character"]
local larry3348 =larry25["Character"]
local larry3349 =larry3348["FindFirstChild"]
local larry3350 =larry3349(larry3348, "Humanoid")
local larry3351 =larry25["Character"]
local larry3352 =larry3351["Humanoid"]
local larry3353 =larry25["Character"]
local larry3354 =larry3353["FindFirstChild"]
local larry3355 =larry3354(larry3353, "HumanoidRootPart")
local larry3356 =larry3352["ChangeState"]
local larry3357 =Enum["HumanoidStateType"]
local larry3358 =larry3357["GettingUp"]
local larry3359 =larry3356(larry3352, larry3358)
larry3352["PlatformStand"] =false
local larry3360 =workspace["CurrentCamera"]
larry3360["CameraSubject"] =larry3352
larry3355["CanCollide"] =true
local larry3361 =_3329_vararg1["FindFirstChildWhichIsA"]
local larry3362 =larry3361(_3329_vararg1, "Motor6D")
local larry3363 =_3329_vararg1["FindFirstChildWhichIsA"]
local larry3364 =larry3363(_3329_vararg1, "Motor6D")
larry3364["Enabled"] =true
local larry3365 =larry25["PlayerScripts"]
local larry3366 =larry3365["PlayerModule"]
local larry3367 =larry3366["ControlModule"]
local larry3368 =require(larry3367)
local larry3369 =larry3368["Enable"]
local larry3370 =larry3369(larry3368)
local _ =task.wait()
local larry3371 =Vector3["new"]
local larry3372 =larry3371(0, 0, 0)
_3329_vararg1["Velocity"] =larry3372
local _ =task.wait()
local larry3373 =Vector3["new"]
local larry3374 =larry3373(0, 0, 0)
_3329_vararg1["Velocity"] =larry3374
local _ =task.wait()
local larry3375 =Vector3["new"]
local larry3376 =larry3375(0, 0, 0)
_3329_vararg1["Velocity"] =larry3376
local _ =task.wait()
local larry3377 =Vector3["new"]
local larry3378 =larry3377(0, 0, 0)
_3329_vararg1["Velocity"] =larry3378
local _ =task.wait()
local larry3379 =Vector3["new"]
local larry3380 =larry3379(0, 0, 0)
_3329_vararg1["Velocity"] =larry3380
local _ =task.wait()
local larry3381 =Vector3["new"]
local larry3382 =larry3381(0, 0, 0)
_3329_vararg1["Velocity"] =larry3382
local _ =task.wait()
local larry3383 =Vector3["new"]
local larry3384 =larry3383(0, 0, 0)
_3329_vararg1["Velocity"] =larry3384
local _ =task.wait()
local larry3385 =Vector3["new"]
local larry3386 =larry3385(0, 0, 0)
_3329_vararg1["Velocity"] =larry3386
local _ =task.wait()
local larry3387 =Vector3["new"]
local larry3388 =larry3387(0, 0, 0)
_3329_vararg1["Velocity"] =larry3388
local _ =task.wait()
local larry3389 =Vector3["new"]
local larry3390 =larry3389(0, 0, 0)
_3329_vararg1["Velocity"] =larry3390
end)
end)
local larry3391 =larry3261["FindFirstChildOfClass"]
local larry3392 =larry3391(larry3261, "Humanoid")
local larry3393 =larry3392["IsA"]
local larry3394 =larry3393(larry3392, "BasePart")
local larry3395 =larry3392["GetPropertyChangedSignal"]
local larry3396 =larry3395(larry3392, "Anchored")
local larry3397 =larry3396["Connect"]
local larry3398 =larry3397(larry3396, function(...)
local _3399_vararg1, _3399_vararg2, _3399_vararg3, _3399_vararg4, _3399_vararg5, _3399_vararg6, _3399_vararg7, _3399_vararg8, _3399_vararg9, _3399_vararg10 = ...
local larry3400 =larry3392["Anchored"]
larry3392["Anchored"] =false
end)
local larry3401 =larry3392["ChildAdded"]
local larry3402 =larry3401["Connect"]
local larry3403 =larry3402(larry3401, function(...)
local _3404_vararg1, _3404_vararg2, _3404_vararg3, _3404_vararg4, _3404_vararg5, _3404_vararg6, _3404_vararg7, _3404_vararg8, _3404_vararg9, _3404_vararg10 = ...
local larry3405 =_3404_vararg1["IsA"]
local larry3406 =larry3405(_3404_vararg1, "BallSocketConstraint")
local larry3407 =_3404_vararg1["Parent"]
local larry3408 =_3404_vararg1["Destroy"]
local larry3409 =larry3408(_3404_vararg1)
local larry3410 =larry25["Character"]
local larry3411 =larry25["Character"]
local larry3412 =larry3411["FindFirstChild"]
local larry3413 =larry3412(larry3411, "Humanoid")
local larry3414 =larry25["Character"]
local larry3415 =larry3414["Humanoid"]
local larry3416 =larry25["Character"]
local larry3417 =larry3416["FindFirstChild"]
local larry3418 =larry3417(larry3416, "HumanoidRootPart")
local larry3419 =larry3415["ChangeState"]
local larry3420 =Enum["HumanoidStateType"]
local larry3421 =larry3420["GettingUp"]
local larry3422 =larry3419(larry3415, larry3421)
larry3415["PlatformStand"] =false
local larry3423 =workspace["CurrentCamera"]
larry3423["CameraSubject"] =larry3415
larry3418["CanCollide"] =true
local larry3424 =larry3392["FindFirstChildWhichIsA"]
local larry3425 =larry3424(larry3392, "Motor6D")
local larry3426 =larry3392["FindFirstChildWhichIsA"]
local larry3427 =larry3426(larry3392, "Motor6D")
larry3427["Enabled"] =true
local larry3428 =larry25["PlayerScripts"]
local larry3429 =larry3428["PlayerModule"]
local larry3430 =larry3429["ControlModule"]
local larry3431 =require(larry3430)
local larry3432 =larry3431["Enable"]
local larry3433 =larry3432(larry3431)
local _ =task.wait()
local larry3434 =Vector3["new"]
local larry3435 =larry3434(0, 0, 0)
larry3392["Velocity"] =larry3435
local _ =task.wait()
local larry3436 =Vector3["new"]
local larry3437 =larry3436(0, 0, 0)
larry3392["Velocity"] =larry3437
local _ =task.wait()
local larry3438 =Vector3["new"]
local larry3439 =larry3438(0, 0, 0)
larry3392["Velocity"] =larry3439
local _ =task.wait()
local larry3440 =Vector3["new"]
local larry3441 =larry3440(0, 0, 0)
larry3392["Velocity"] =larry3441
local _ =task.wait()
local larry3442 =Vector3["new"]
local larry3443 =larry3442(0, 0, 0)
larry3392["Velocity"] =larry3443
local _ =task.wait()
local larry3444 =Vector3["new"]
local larry3445 =larry3444(0, 0, 0)
larry3392["Velocity"] =larry3445
local _ =task.wait()
local larry3446 =Vector3["new"]
local larry3447 =larry3446(0, 0, 0)
larry3392["Velocity"] =larry3447
local _ =task.wait()
local larry3448 =Vector3["new"]
local larry3449 =larry3448(0, 0, 0)
larry3392["Velocity"] =larry3449
local _ =task.wait()
local larry3450 =Vector3["new"]
local larry3451 =larry3450(0, 0, 0)
larry3392["Velocity"] =larry3451
local _ =task.wait()
local larry3452 =Vector3["new"]
local larry3453 =larry3452(0, 0, 0)
larry3392["Velocity"] =larry3453
end)
local larry3454 =larry25["CharacterAdded"]
local larry3455 =larry3454["Connect"]
local larry3456 =larry3455(larry3454, function(...)
local _3457_vararg1, _3457_vararg2, _3457_vararg3, _3457_vararg4, _3457_vararg5, _3457_vararg6, _3457_vararg7, _3457_vararg8, _3457_vararg9, _3457_vararg10 = ...
local _ =task.wait(0.1)
local larry3458 =_3457_vararg1["GetChildren"]
local larry3459 =larry3458(_3457_vararg1)
for larry3460, _3460_2 in pairs(larry3459) do
local larry3461 =_3460_2["IsA"]
local larry3462 =larry3461(_3460_2, "BasePart")
local larry3463 =_3460_2["GetPropertyChangedSignal"]
local larry3464 =larry3463(_3460_2, "Anchored")
local larry3465 =larry3464["Connect"]
local larry3466 =larry3465(larry3464, function(...)
local _3467_vararg1, _3467_vararg2, _3467_vararg3, _3467_vararg4, _3467_vararg5, _3467_vararg6, _3467_vararg7, _3467_vararg8, _3467_vararg9, _3467_vararg10 = ...
local larry3468 =_3460_2["Anchored"]
_3460_2["Anchored"] =false
end)
local larry3469 =_3460_2["ChildAdded"]
local larry3470 =larry3469["Connect"]
local larry3471 =larry3470(larry3469, function(...)
local _3472_vararg1, _3472_vararg2, _3472_vararg3, _3472_vararg4, _3472_vararg5, _3472_vararg6, _3472_vararg7, _3472_vararg8, _3472_vararg9, _3472_vararg10 = ...
local larry3473 =_3472_vararg1["IsA"]
local larry3474 =larry3473(_3472_vararg1, "BallSocketConstraint")
local larry3475 =_3472_vararg1["Parent"]
local larry3476 =_3472_vararg1["Destroy"]
local larry3477 =larry3476(_3472_vararg1)
local larry3478 =larry25["Character"]
local larry3479 =larry25["Character"]
local larry3480 =larry3479["FindFirstChild"]
local larry3481 =larry3480(larry3479, "Humanoid")
local larry3482 =larry25["Character"]
local larry3483 =larry3482["Humanoid"]
local larry3484 =larry25["Character"]
local larry3485 =larry3484["FindFirstChild"]
local larry3486 =larry3485(larry3484, "HumanoidRootPart")
local larry3487 =larry3483["ChangeState"]
local larry3488 =Enum["HumanoidStateType"]
local larry3489 =larry3488["GettingUp"]
local larry3490 =larry3487(larry3483, larry3489)
larry3483["PlatformStand"] =false
local larry3491 =workspace["CurrentCamera"]
larry3491["CameraSubject"] =larry3483
larry3486["CanCollide"] =true
local larry3492 =_3460_2["FindFirstChildWhichIsA"]
local larry3493 =larry3492(_3460_2, "Motor6D")
local larry3494 =_3460_2["FindFirstChildWhichIsA"]
local larry3495 =larry3494(_3460_2, "Motor6D")
larry3495["Enabled"] =true
local larry3496 =larry25["PlayerScripts"]
local larry3497 =larry3496["PlayerModule"]
local larry3498 =larry3497["ControlModule"]
local larry3499 =require(larry3498)
local larry3500 =larry3499["Enable"]
local larry3501 =larry3500(larry3499)
local _ =task.wait()
local larry3502 =Vector3["new"]
local larry3503 =larry3502(0, 0, 0)
_3460_2["Velocity"] =larry3503
local _ =task.wait()
local larry3504 =Vector3["new"]
local larry3505 =larry3504(0, 0, 0)
_3460_2["Velocity"] =larry3505
local _ =task.wait()
local larry3506 =Vector3["new"]
local larry3507 =larry3506(0, 0, 0)
_3460_2["Velocity"] =larry3507
local _ =task.wait()
local larry3508 =Vector3["new"]
local larry3509 =larry3508(0, 0, 0)
_3460_2["Velocity"] =larry3509
local _ =task.wait()
local larry3510 =Vector3["new"]
local larry3511 =larry3510(0, 0, 0)
_3460_2["Velocity"] =larry3511
local _ =task.wait()
local larry3512 =Vector3["new"]
local larry3513 =larry3512(0, 0, 0)
_3460_2["Velocity"] =larry3513
local _ =task.wait()
local larry3514 =Vector3["new"]
local larry3515 =larry3514(0, 0, 0)
_3460_2["Velocity"] =larry3515
local _ =task.wait()
local larry3516 =Vector3["new"]
local larry3517 =larry3516(0, 0, 0)
_3460_2["Velocity"] =larry3517
local _ =task.wait()
local larry3518 =Vector3["new"]
local larry3519 =larry3518(0, 0, 0)
_3460_2["Velocity"] =larry3519
local _ =task.wait()
local larry3520 =Vector3["new"]
local larry3521 =larry3520(0, 0, 0)
_3460_2["Velocity"] =larry3521
end)
end
local larry3522 =_3457_vararg1["ChildAdded"]
local larry3523 =larry3522["Connect"]
local larry3524 =larry3523(larry3522, function(...)
local _3525_vararg1, _3525_vararg2, _3525_vararg3, _3525_vararg4, _3525_vararg5, _3525_vararg6, _3525_vararg7, _3525_vararg8, _3525_vararg9, _3525_vararg10 = ...
local larry3526 =_3525_vararg1["IsA"]
local larry3527 =larry3526(_3525_vararg1, "BasePart")
local larry3528 =_3525_vararg1["GetPropertyChangedSignal"]
local larry3529 =larry3528(_3525_vararg1, "Anchored")
local larry3530 =larry3529["Connect"]
local larry3531 =larry3530(larry3529, function(...)
local _3532_vararg1, _3532_vararg2, _3532_vararg3, _3532_vararg4, _3532_vararg5, _3532_vararg6, _3532_vararg7, _3532_vararg8, _3532_vararg9, _3532_vararg10 = ...
local larry3533 =_3525_vararg1["Anchored"]
_3525_vararg1["Anchored"] =false
end)
local larry3534 =_3525_vararg1["ChildAdded"]
local larry3535 =larry3534["Connect"]
local larry3536 =larry3535(larry3534, function(...)
local _3537_vararg1, _3537_vararg2, _3537_vararg3, _3537_vararg4, _3537_vararg5, _3537_vararg6, _3537_vararg7, _3537_vararg8, _3537_vararg9, _3537_vararg10 = ...
local larry3538 =_3537_vararg1["IsA"]
local larry3539 =larry3538(_3537_vararg1, "BallSocketConstraint")
local larry3540 =_3537_vararg1["Parent"]
local larry3541 =_3537_vararg1["Destroy"]
local larry3542 =larry3541(_3537_vararg1)
local larry3543 =larry25["Character"]
local larry3544 =larry25["Character"]
local larry3545 =larry3544["FindFirstChild"]
local larry3546 =larry3545(larry3544, "Humanoid")
local larry3547 =larry25["Character"]
local larry3548 =larry3547["Humanoid"]
local larry3549 =larry25["Character"]
local larry3550 =larry3549["FindFirstChild"]
local larry3551 =larry3550(larry3549, "HumanoidRootPart")
local larry3552 =larry3548["ChangeState"]
local larry3553 =Enum["HumanoidStateType"]
local larry3554 =larry3553["GettingUp"]
local larry3555 =larry3552(larry3548, larry3554)
larry3548["PlatformStand"] =false
local larry3556 =workspace["CurrentCamera"]
larry3556["CameraSubject"] =larry3548
larry3551["CanCollide"] =true
local larry3557 =_3525_vararg1["FindFirstChildWhichIsA"]
local larry3558 =larry3557(_3525_vararg1, "Motor6D")
local larry3559 =_3525_vararg1["FindFirstChildWhichIsA"]
local larry3560 =larry3559(_3525_vararg1, "Motor6D")
larry3560["Enabled"] =true
local larry3561 =larry25["PlayerScripts"]
local larry3562 =larry3561["PlayerModule"]
local larry3563 =larry3562["ControlModule"]
local larry3564 =require(larry3563)
local larry3565 =larry3564["Enable"]
local larry3566 =larry3565(larry3564)
local _ =task.wait()
local larry3567 =Vector3["new"]
local larry3568 =larry3567(0, 0, 0)
_3525_vararg1["Velocity"] =larry3568
local _ =task.wait()
local larry3569 =Vector3["new"]
local larry3570 =larry3569(0, 0, 0)
_3525_vararg1["Velocity"] =larry3570
local _ =task.wait()
local larry3571 =Vector3["new"]
local larry3572 =larry3571(0, 0, 0)
_3525_vararg1["Velocity"] =larry3572
local _ =task.wait()
local larry3573 =Vector3["new"]
local larry3574 =larry3573(0, 0, 0)
_3525_vararg1["Velocity"] =larry3574
local _ =task.wait()
local larry3575 =Vector3["new"]
local larry3576 =larry3575(0, 0, 0)
_3525_vararg1["Velocity"] =larry3576
local _ =task.wait()
local larry3577 =Vector3["new"]
local larry3578 =larry3577(0, 0, 0)
_3525_vararg1["Velocity"] =larry3578
local _ =task.wait()
local larry3579 =Vector3["new"]
local larry3580 =larry3579(0, 0, 0)
_3525_vararg1["Velocity"] =larry3580
local _ =task.wait()
local larry3581 =Vector3["new"]
local larry3582 =larry3581(0, 0, 0)
_3525_vararg1["Velocity"] =larry3582
local _ =task.wait()
local larry3583 =Vector3["new"]
local larry3584 =larry3583(0, 0, 0)
_3525_vararg1["Velocity"] =larry3584
local _ =task.wait()
local larry3585 =Vector3["new"]
local larry3586 =larry3585(0, 0, 0)
_3525_vararg1["Velocity"] =larry3586
end)
end)
local larry3587 =_3457_vararg1["FindFirstChildOfClass"]
local larry3588 =larry3587(_3457_vararg1, "Humanoid")
local larry3589 =larry3588["IsA"]
local larry3590 =larry3589(larry3588, "BasePart")
local larry3591 =larry3588["GetPropertyChangedSignal"]
local larry3592 =larry3591(larry3588, "Anchored")
local larry3593 =larry3592["Connect"]
local larry3594 =larry3593(larry3592, function(...)
local _3595_vararg1, _3595_vararg2, _3595_vararg3, _3595_vararg4, _3595_vararg5, _3595_vararg6, _3595_vararg7, _3595_vararg8, _3595_vararg9, _3595_vararg10 = ...
local larry3596 =larry3588["Anchored"]
larry3588["Anchored"] =false
end)
local larry3597 =larry3588["ChildAdded"]
local larry3598 =larry3597["Connect"]
local larry3599 =larry3598(larry3597, function(...)
local _3600_vararg1, _3600_vararg2, _3600_vararg3, _3600_vararg4, _3600_vararg5, _3600_vararg6, _3600_vararg7, _3600_vararg8, _3600_vararg9, _3600_vararg10 = ...
local larry3601 =_3600_vararg1["IsA"]
local larry3602 =larry3601(_3600_vararg1, "BallSocketConstraint")
local larry3603 =_3600_vararg1["Parent"]
local larry3604 =_3600_vararg1["Destroy"]
local larry3605 =larry3604(_3600_vararg1)
local larry3606 =larry25["Character"]
local larry3607 =larry25["Character"]
local larry3608 =larry3607["FindFirstChild"]
local larry3609 =larry3608(larry3607, "Humanoid")
local larry3610 =larry25["Character"]
local larry3611 =larry3610["Humanoid"]
local larry3612 =larry25["Character"]
local larry3613 =larry3612["FindFirstChild"]
local larry3614 =larry3613(larry3612, "HumanoidRootPart")
local larry3615 =larry3611["ChangeState"]
local larry3616 =Enum["HumanoidStateType"]
local larry3617 =larry3616["GettingUp"]
local larry3618 =larry3615(larry3611, larry3617)
larry3611["PlatformStand"] =false
local larry3619 =workspace["CurrentCamera"]
larry3619["CameraSubject"] =larry3611
larry3614["CanCollide"] =true
local larry3620 =larry3588["FindFirstChildWhichIsA"]
local larry3621 =larry3620(larry3588, "Motor6D")
local larry3622 =larry3588["FindFirstChildWhichIsA"]
local larry3623 =larry3622(larry3588, "Motor6D")
larry3623["Enabled"] =true
local larry3624 =larry25["PlayerScripts"]
local larry3625 =larry3624["PlayerModule"]
local larry3626 =larry3625["ControlModule"]
local larry3627 =require(larry3626)
local larry3628 =larry3627["Enable"]
local larry3629 =larry3628(larry3627)
local _ =task.wait()
local larry3630 =Vector3["new"]
local larry3631 =larry3630(0, 0, 0)
larry3588["Velocity"] =larry3631
local _ =task.wait()
local larry3632 =Vector3["new"]
local larry3633 =larry3632(0, 0, 0)
larry3588["Velocity"] =larry3633
local _ =task.wait()
local larry3634 =Vector3["new"]
local larry3635 =larry3634(0, 0, 0)
larry3588["Velocity"] =larry3635
local _ =task.wait()
local larry3636 =Vector3["new"]
local larry3637 =larry3636(0, 0, 0)
larry3588["Velocity"] =larry3637
local _ =task.wait()
local larry3638 =Vector3["new"]
local larry3639 =larry3638(0, 0, 0)
larry3588["Velocity"] =larry3639
local _ =task.wait()
local larry3640 =Vector3["new"]
local larry3641 =larry3640(0, 0, 0)
larry3588["Velocity"] =larry3641
local _ =task.wait()
local larry3642 =Vector3["new"]
local larry3643 =larry3642(0, 0, 0)
larry3588["Velocity"] =larry3643
local _ =task.wait()
local larry3644 =Vector3["new"]
local larry3645 =larry3644(0, 0, 0)
larry3588["Velocity"] =larry3645
local _ =task.wait()
local larry3646 =Vector3["new"]
local larry3647 =larry3646(0, 0, 0)
larry3588["Velocity"] =larry3647
local _ =task.wait()
local larry3648 =Vector3["new"]
local larry3649 =larry3648(0, 0, 0)
larry3588["Velocity"] =larry3649
end)
end)
end)
local larry3650 =UDim2["new"]
local larry3651 =larry3650(0.43, 0, 0, 28)
local larry3652 =UDim2["new"]
local larry3653 =larry3652(0.52, 0, 0, 193)
local larry3654 =Enum["Font"]
local larry3655 =larry3654["Arcade"]
local larry3656 =Instance["new"]
local larry3657 =larry3656("TextButton")
local larry3658 =UDim["new"]
local larry3659 =larry3658(0, 6)
local larry3660 =Instance["new"]
local larry3661 =larry3660("UICorner")
local larry3662 =larry3657["MouseButton1Click"]
local larry3663 =larry3662["Connect"]
local larry3666 =task["delay"]
local larry3667 =larry3666(0.35, function(...)
local _3668_vararg1, _3668_vararg2, _3668_vararg3, _3668_vararg4, _3668_vararg5, _3668_vararg6, _3668_vararg7, _3668_vararg8, _3668_vararg9, _3668_vararg10 = ...

end)
local larry3669 =makefolder("MirandaTweenPlus")
local larry3670 =larry6["JSONEncode"]
local larry3671 =larry3670(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = true,
  ["nearest"] = true,
  ["antiRagdoll"] = true,
})
local _ =writefile("MirandaTweenPlus/config.json", larry3671)
local larry3672 =game["Players"]
local larry3673 =larry3672["GetPlayers"]
local larry3674 =larry3673(larry3672)
local larry3676 =_3675_2["Character"]
local larry3677 =_3675_2["Character"]
local larry3678 =larry3677["GetDescendants"]
local larry3679 =larry3678(larry3677)
local larry3681 =_3680_2["IsA"]
local larry3682 =larry3681(_3680_2, "Accessory")
local larry3683 =_3680_2["Destroy"]
local larry3684 =larry3683(_3680_2)
local larry3685 =_3680_2["IsA"]
local larry3686 =larry3685(_3680_2, "BasePart")
local larry3687 =_3680_2["FindFirstChild"]
local larry3688 =larry3687(_3680_2, "LayeredClothing")
local larry3689 =_3680_2["FindFirstChild"]
local larry3690 =larry3689(_3680_2, "LayeredClothing")
local larry3691 =larry3690["Destroy"]
local larry3692 =larry3691(larry3690)
local larry3693 =larry3677["FindFirstChild"]
local larry3694 =larry3693(larry3677, "Humanoid")
local larry3695 =larry3694["RemoveAccessories"]
local larry3696 =larry3695(larry3694)
local larry3697 =larry3677["GetDescendants"]
local larry3698 =larry3697(larry3677)
local larry3700 =_3699_2["IsA"]
local larry3701 =larry3700(_3699_2, "BasePart")
local larry3702 =_3699_2["GetChildren"]
local larry3703 =larry3702(_3699_2)
local larry3705 =_3704_2["Name"]
local larry3706 =_3704_2["IsA"]
local larry3707 =larry3706(_3704_2, "LayeredClothing")
local larry3708 =_3704_2["Destroy"]
local larry3709 =larry3708(_3704_2)
local larry3664 =larry3663(larry3662, function(...)
local _3665_vararg1, _3665_vararg2, _3665_vararg3, _3665_vararg4, _3665_vararg5, _3665_vararg6, _3665_vararg7, _3665_vararg8, _3665_vararg9, _3665_vararg10 = ...
local larry3666 =task["delay"]
local larry3667 =larry3666(0.35, function(...)
local _3668_vararg1, _3668_vararg2, _3668_vararg3, _3668_vararg4, _3668_vararg5, _3668_vararg6, _3668_vararg7, _3668_vararg8, _3668_vararg9, _3668_vararg10 = ...

end)
local larry3669 =makefolder("MirandaTweenPlus")
local larry3670 =larry6["JSONEncode"]
local larry3671 =larry3670(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = true,
  ["nearest"] = true,
  ["antiRagdoll"] = true,
})
local _ =writefile("MirandaTweenPlus/config.json", larry3671)
larry3657["BackgroundColor3"] =larry34
local larry3672 =game["Players"]
local larry3673 =larry3672["GetPlayers"]
local larry3674 =larry3673(larry3672)
for larry3675, _3675_2 in pairs(larry3674) do
local larry3676 =_3675_2["Character"]
local larry3677 =_3675_2["Character"]
local larry3678 =larry3677["GetDescendants"]
local larry3679 =larry3678(larry3677)
for larry3680, _3680_2 in pairs(larry3679) do
local larry3681 =_3680_2["IsA"]
local larry3682 =larry3681(_3680_2, "Accessory")
local larry3683 =_3680_2["Destroy"]
local larry3684 =larry3683(_3680_2)
local larry3685 =_3680_2["IsA"]
local larry3686 =larry3685(_3680_2, "BasePart")
local larry3687 =_3680_2["FindFirstChild"]
local larry3688 =larry3687(_3680_2, "LayeredClothing")
local larry3689 =_3680_2["FindFirstChild"]
local larry3690 =larry3689(_3680_2, "LayeredClothing")
local larry3691 =larry3690["Destroy"]
local larry3692 =larry3691(larry3690)
end
local larry3693 =larry3677["FindFirstChild"]
local larry3694 =larry3693(larry3677, "Humanoid")
local larry3695 =larry3694["RemoveAccessories"]
local larry3696 =larry3695(larry3694)
local larry3697 =larry3677["GetDescendants"]
local larry3698 =larry3697(larry3677)
for larry3699, _3699_2 in pairs(larry3698) do
local larry3700 =_3699_2["IsA"]
local larry3701 =larry3700(_3699_2, "BasePart")
local larry3702 =_3699_2["GetChildren"]
local larry3703 =larry3702(_3699_2)
for larry3704, _3704_2 in pairs(larry3703) do
local larry3705 =_3704_2["Name"]
local larry3706 =_3704_2["IsA"]
local larry3707 =larry3706(_3704_2, "LayeredClothing")
local larry3708 =_3704_2["Destroy"]
local larry3709 =larry3708(_3704_2)
end
end
end
end)
local larry3710 =task["spawn"]
local _ =task.wait(0.1)
local larry3713 =game["Players"]
local larry3714 =larry3713["GetPlayers"]
local larry3715 =larry3714(larry3713)
local larry3717 =_3716_2["Character"]
local larry3718 =_3716_2["Character"]
local larry3719 =larry3718["GetDescendants"]
local larry3720 =larry3719(larry3718)
local larry3722 =_3721_2["IsA"]
local larry3723 =larry3722(_3721_2, "Accessory")
local larry3724 =_3721_2["Destroy"]
local larry3725 =larry3724(_3721_2)
local larry3726 =_3721_2["IsA"]
local larry3727 =larry3726(_3721_2, "BasePart")
local larry3728 =_3721_2["FindFirstChild"]
local larry3729 =larry3728(_3721_2, "LayeredClothing")
local larry3730 =_3721_2["FindFirstChild"]
local larry3731 =larry3730(_3721_2, "LayeredClothing")
local larry3732 =larry3731["Destroy"]
local larry3733 =larry3732(larry3731)
local larry3734 =larry3718["FindFirstChild"]
local larry3735 =larry3734(larry3718, "Humanoid")
local larry3736 =larry3735["RemoveAccessories"]
local larry3737 =larry3736(larry3735)
local larry3738 =larry3718["GetDescendants"]
local larry3739 =larry3738(larry3718)
local larry3741 =_3740_2["IsA"]
local larry3742 =larry3741(_3740_2, "BasePart")
local larry3743 =_3740_2["GetChildren"]
local larry3744 =larry3743(_3740_2)
local larry3746 =_3745_2["Name"]
local larry3747 =_3745_2["IsA"]
local larry3748 =larry3747(_3745_2, "LayeredClothing")
local larry3749 =_3745_2["Destroy"]
local larry3750 =larry3749(_3745_2)
local larry3711 =larry3710(function(...)
local _3712_vararg1, _3712_vararg2, _3712_vararg3, _3712_vararg4, _3712_vararg5, _3712_vararg6, _3712_vararg7, _3712_vararg8, _3712_vararg9, _3712_vararg10 = ...
local _ =task.wait(0.1)
local larry3713 =game["Players"]
local larry3714 =larry3713["GetPlayers"]
local larry3715 =larry3714(larry3713)
for larry3716, _3716_2 in pairs(larry3715) do
local larry3717 =_3716_2["Character"]
local larry3718 =_3716_2["Character"]
local larry3719 =larry3718["GetDescendants"]
local larry3720 =larry3719(larry3718)
for larry3721, _3721_2 in pairs(larry3720) do
local larry3722 =_3721_2["IsA"]
local larry3723 =larry3722(_3721_2, "Accessory")
local larry3724 =_3721_2["Destroy"]
local larry3725 =larry3724(_3721_2)
local larry3726 =_3721_2["IsA"]
local larry3727 =larry3726(_3721_2, "BasePart")
local larry3728 =_3721_2["FindFirstChild"]
local larry3729 =larry3728(_3721_2, "LayeredClothing")
local larry3730 =_3721_2["FindFirstChild"]
local larry3731 =larry3730(_3721_2, "LayeredClothing")
local larry3732 =larry3731["Destroy"]
local larry3733 =larry3732(larry3731)
end
local larry3734 =larry3718["FindFirstChild"]
local larry3735 =larry3734(larry3718, "Humanoid")
local larry3736 =larry3735["RemoveAccessories"]
local larry3737 =larry3736(larry3735)
local larry3738 =larry3718["GetDescendants"]
local larry3739 =larry3738(larry3718)
for larry3740, _3740_2 in pairs(larry3739) do
local larry3741 =_3740_2["IsA"]
local larry3742 =larry3741(_3740_2, "BasePart")
local larry3743 =_3740_2["GetChildren"]
local larry3744 =larry3743(_3740_2)
for larry3745, _3745_2 in pairs(larry3744) do
local larry3746 =_3745_2["Name"]
local larry3747 =_3745_2["IsA"]
local larry3748 =larry3747(_3745_2, "LayeredClothing")
local larry3749 =_3745_2["Destroy"]
local larry3750 =larry3749(_3745_2)
end
end
end
end)
local larry3751 =UDim2["new"]
local larry3752 =larry3751(0.43, 0, 0, 28)
local larry3753 =UDim2["new"]
local larry3754 =larry3753(0.05, 0, 0, 225)
local larry3755 =Enum["Font"]
local larry3756 =larry3755["Arcade"]
local larry3757 =Instance["new"]
local larry3758 =larry3757("TextButton")
local larry3759 =UDim["new"]
local larry3760 =larry3759(0, 6)
local larry3761 =Instance["new"]
local larry3762 =larry3761("UICorner")
local larry3763 =Color3["fromRGB"]
local larry3764 =larry3763(0, 120, 255)
local larry3765 =larry3758["MouseButton1Click"]
local larry3766 =larry3765["Connect"]
local larry3769 =setclipboard("https://discord.gg/QBnczTNhEZ")
local larry3767 =larry3766(larry3765, function(...)
local _3768_vararg1, _3768_vararg2, _3768_vararg3, _3768_vararg4, _3768_vararg5, _3768_vararg6, _3768_vararg7, _3768_vararg8, _3768_vararg9, _3768_vararg10 = ...
local larry3769 =setclipboard("https://discord.gg/QBnczTNhEZ")
end)
local larry3770 =UDim2["new"]
local larry3771 =larry3770(0.43, 0, 0, 28)
local larry3772 =UDim2["new"]
local larry3773 =larry3772(0.52, 0, 0, 225)
local larry3774 =Enum["Font"]
local larry3775 =larry3774["Arcade"]
local larry3776 =Instance["new"]
local larry3777 =larry3776("TextButton")
local larry3778 =UDim["new"]
local larry3779 =larry3778(0, 6)
local larry3780 =Instance["new"]
local larry3781 =larry3780("UICorner")
local larry3782 =Color3["fromRGB"]
local larry3783 =larry3782(180, 30, 30)
local larry3786 =larry3777["MouseButton1Click"]
local larry3787 =larry3786["Connect"]
local larry3790 =Instance["new"]
local larry3791 =larry3790("ScreenGui", larry140)
local larry3792 =Enum["ZIndexBehavior"]
local larry3793 =larry3792["Sibling"]
local larry3794 =Instance["new"]
local larry3795 =larry3794("Frame", larry3791)
local larry3796 =UDim2["new"]
local larry3797 =larry3796(0, 220, 0, 230)
local larry3798 =UDim2["new"]
local larry3799 =larry3798(0.5, -110, 0.5, -115)
local larry3800 =Color3["fromRGB"]
local larry3801 =larry3800(30, 30, 40)
local larry3802 =Instance["new"]
local larry3803 =larry3802("UICorner", larry3795)
local larry3804 =UDim["new"]
local larry3805 =larry3804(0, 12)
local larry3806 =Instance["new"]
local larry3807 =larry3806("UIStroke", larry3795)
local larry3808 =Instance["new"]
local larry3809 =larry3808("TextLabel", larry3795)
local larry3810 =UDim2["new"]
local larry3811 =larry3810(1, -12, 0, 22)
local larry3812 =UDim2["new"]
local larry3813 =larry3812(0, 6, 0, 8)
local larry3814 =Enum["Font"]
local larry3815 =larry3814["Arcade"]
local larry3816 =Color3["new"]
local larry3817 =larry3816(1, 1, 1)
local larry3818 =Enum["TextXAlignment"]
local larry3819 =larry3818["Center"]
local larry3820 =Instance["new"]
local larry3821 =larry3820("ScrollingFrame", larry3795)
local larry3822 =UDim2["new"]
local larry3823 =larry3822(1, -12, 1, -58)
local larry3824 =UDim2["new"]
local larry3825 =larry3824(0, 6, 0, 32)
local larry3826 =Instance["new"]
local larry3827 =larry3826("Frame", larry3821)
local larry3828 =UDim2["new"]
local larry3829 =larry3828(1, 0, 0, 0)
local larry3830 =UDim2["new"]
local larry3831 =larry3830(0, 0, 0, 0)
local larry3832 =Instance["new"]
local larry3833 =larry3832("Frame", larry3827)
local larry3834 =UDim2["new"]
local larry3835 =larry3834(1, 0, 0, 22)
local larry3836 =UDim2["new"]
local larry3837 =larry3836(0, 0, 0, 0)
local larry3838 =Color3["fromRGB"]
local larry3839 =larry3838(45, 45, 55)
local larry3840 =Instance["new"]
local larry3841 =larry3840("UICorner", larry3833)
local larry3842 =UDim["new"]
local larry3843 =larry3842(0, 6)
local larry3844 =Instance["new"]
local larry3845 =larry3844("TextButton", larry3833)
local larry3846 =UDim2["new"]
local larry3847 =larry3846(1, -10, 1, 0)
local larry3848 =UDim2["new"]
local larry3849 =larry3848(0, 5, 0, 0)
local larry3850 =Enum["Font"]
local larry3851 =larry3850["Arcade"]
local larry3852 =Color3["new"]
local larry3853 =larry3852(1, 1, 1)
local larry3854 =Enum["TextXAlignment"]
local larry3855 =larry3854["Left"]
local larry3856 =larry3845["MouseButton1Click"]
local larry3857 =larry3856["Connect"]
local larry3860 =Color3["fromRGB"]
local larry3861 =larry3860(255, 120, 0)
local larry3858 =larry3857(larry3856, function(...)
local _3859_vararg1, _3859_vararg2, _3859_vararg3, _3859_vararg4, _3859_vararg5, _3859_vararg6, _3859_vararg7, _3859_vararg8, _3859_vararg9, _3859_vararg10 = ...
larry3845["Text"] ="DESYNC [PRESS KEY...]"
local larry3860 =Color3["fromRGB"]
local larry3861 =larry3860(255, 120, 0)
larry3845["TextColor3"] =larry3861
end)
local larry3862 =Instance["new"]
local larry3863 =larry3862("Frame", larry3827)
local larry3864 =UDim2["new"]
local larry3865 =larry3864(1, 0, 0, 22)
local larry3866 =UDim2["new"]
local larry3867 =larry3866(0, 0, 0, 25)
local larry3868 =Color3["fromRGB"]
local larry3869 =larry3868(45, 45, 55)
local larry3870 =Instance["new"]
local larry3871 =larry3870("UICorner", larry3863)
local larry3872 =UDim["new"]
local larry3873 =larry3872(0, 6)
local larry3874 =Instance["new"]
local larry3875 =larry3874("TextButton", larry3863)
local larry3876 =UDim2["new"]
local larry3877 =larry3876(1, -10, 1, 0)
local larry3878 =UDim2["new"]
local larry3879 =larry3878(0, 5, 0, 0)
local larry3880 =Enum["Font"]
local larry3881 =larry3880["Arcade"]
local larry3882 =Color3["new"]
local larry3883 =larry3882(1, 1, 1)
local larry3884 =Enum["TextXAlignment"]
local larry3885 =larry3884["Left"]
local larry3886 =larry3875["MouseButton1Click"]
local larry3887 =larry3886["Connect"]
local larry3890 =Color3["fromRGB"]
local larry3891 =larry3890(255, 120, 0)
local larry3888 =larry3887(larry3886, function(...)
local _3889_vararg1, _3889_vararg2, _3889_vararg3, _3889_vararg4, _3889_vararg5, _3889_vararg6, _3889_vararg7, _3889_vararg8, _3889_vararg9, _3889_vararg10 = ...
larry3875["Text"] ="INF JUMP [PRESS KEY...]"
local larry3890 =Color3["fromRGB"]
local larry3891 =larry3890(255, 120, 0)
larry3875["TextColor3"] =larry3891
end)
local larry3892 =Instance["new"]
local larry3893 =larry3892("Frame", larry3827)
local larry3894 =UDim2["new"]
local larry3895 =larry3894(1, 0, 0, 22)
local larry3896 =UDim2["new"]
local larry3897 =larry3896(0, 0, 0, 50)
local larry3898 =Color3["fromRGB"]
local larry3899 =larry3898(45, 45, 55)
local larry3900 =Instance["new"]
local larry3901 =larry3900("UICorner", larry3893)
local larry3902 =UDim["new"]
local larry3903 =larry3902(0, 6)
local larry3904 =Instance["new"]
local larry3905 =larry3904("TextButton", larry3893)
local larry3906 =UDim2["new"]
local larry3907 =larry3906(1, -10, 1, 0)
local larry3908 =UDim2["new"]
local larry3909 =larry3908(0, 5, 0, 0)
local larry3910 =Enum["Font"]
local larry3911 =larry3910["Arcade"]
local larry3912 =Color3["new"]
local larry3913 =larry3912(1, 1, 1)
local larry3914 =Enum["TextXAlignment"]
local larry3915 =larry3914["Left"]
local larry3916 =larry3905["MouseButton1Click"]
local larry3917 =larry3916["Connect"]
local larry3920 =Color3["fromRGB"]
local larry3921 =larry3920(255, 120, 0)
local larry3918 =larry3917(larry3916, function(...)
local _3919_vararg1, _3919_vararg2, _3919_vararg3, _3919_vararg4, _3919_vararg5, _3919_vararg6, _3919_vararg7, _3919_vararg8, _3919_vararg9, _3919_vararg10 = ...
larry3905["Text"] ="FLY TO BEST [PRESS KEY...]"
local larry3920 =Color3["fromRGB"]
local larry3921 =larry3920(255, 120, 0)
larry3905["TextColor3"] =larry3921
end)
local larry3922 =Instance["new"]
local larry3923 =larry3922("Frame", larry3827)
local larry3924 =UDim2["new"]
local larry3925 =larry3924(1, 0, 0, 22)
local larry3926 =UDim2["new"]
local larry3927 =larry3926(0, 0, 0, 75)
local larry3928 =Color3["fromRGB"]
local larry3929 =larry3928(45, 45, 55)
local larry3930 =Instance["new"]
local larry3931 =larry3930("UICorner", larry3923)
local larry3932 =UDim["new"]
local larry3933 =larry3932(0, 6)
local larry3934 =Instance["new"]
local larry3935 =larry3934("TextButton", larry3923)
local larry3936 =UDim2["new"]
local larry3937 =larry3936(1, -10, 1, 0)
local larry3938 =UDim2["new"]
local larry3939 =larry3938(0, 5, 0, 0)
local larry3940 =Enum["Font"]
local larry3941 =larry3940["Arcade"]
local larry3942 =Color3["new"]
local larry3943 =larry3942(1, 1, 1)
local larry3944 =Enum["TextXAlignment"]
local larry3945 =larry3944["Left"]
local larry3946 =larry3935["MouseButton1Click"]
local larry3947 =larry3946["Connect"]
local larry3950 =Color3["fromRGB"]
local larry3951 =larry3950(255, 120, 0)
local larry3948 =larry3947(larry3946, function(...)
local _3949_vararg1, _3949_vararg2, _3949_vararg3, _3949_vararg4, _3949_vararg5, _3949_vararg6, _3949_vararg7, _3949_vararg8, _3949_vararg9, _3949_vararg10 = ...
larry3935["Text"] ="STEAL FLOOR [PRESS KEY...]"
local larry3950 =Color3["fromRGB"]
local larry3951 =larry3950(255, 120, 0)
larry3935["TextColor3"] =larry3951
end)
local larry3952 =Instance["new"]
local larry3953 =larry3952("Frame", larry3827)
local larry3954 =UDim2["new"]
local larry3955 =larry3954(1, 0, 0, 22)
local larry3956 =UDim2["new"]
local larry3957 =larry3956(0, 0, 0, 100)
local larry3958 =Color3["fromRGB"]
local larry3959 =larry3958(45, 45, 55)
local larry3960 =Instance["new"]
local larry3961 =larry3960("UICorner", larry3953)
local larry3962 =UDim["new"]
local larry3963 =larry3962(0, 6)
local larry3964 =Instance["new"]
local larry3965 =larry3964("TextButton", larry3953)
local larry3966 =UDim2["new"]
local larry3967 =larry3966(1, -10, 1, 0)
local larry3968 =UDim2["new"]
local larry3969 =larry3968(0, 5, 0, 0)
local larry3970 =Enum["Font"]
local larry3971 =larry3970["Arcade"]
local larry3972 =Color3["new"]
local larry3973 =larry3972(1, 1, 1)
local larry3974 =Enum["TextXAlignment"]
local larry3975 =larry3974["Left"]
local larry3976 =larry3965["MouseButton1Click"]
local larry3977 =larry3976["Connect"]
local larry3980 =Color3["fromRGB"]
local larry3981 =larry3980(255, 120, 0)
local larry3978 =larry3977(larry3976, function(...)
local _3979_vararg1, _3979_vararg2, _3979_vararg3, _3979_vararg4, _3979_vararg5, _3979_vararg6, _3979_vararg7, _3979_vararg8, _3979_vararg9, _3979_vararg10 = ...
larry3965["Text"] ="FLY V2 [PRESS KEY...]"
local larry3980 =Color3["fromRGB"]
local larry3981 =larry3980(255, 120, 0)
larry3965["TextColor3"] =larry3981
end)
local larry3982 =Instance["new"]
local larry3983 =larry3982("Frame", larry3827)
local larry3984 =UDim2["new"]
local larry3985 =larry3984(1, 0, 0, 22)
local larry3986 =UDim2["new"]
local larry3987 =larry3986(0, 0, 0, 125)
local larry3988 =Color3["fromRGB"]
local larry3989 =larry3988(45, 45, 55)
local larry3990 =Instance["new"]
local larry3991 =larry3990("UICorner", larry3983)
local larry3992 =UDim["new"]
local larry3993 =larry3992(0, 6)
local larry3994 =Instance["new"]
local larry3995 =larry3994("TextButton", larry3983)
local larry3996 =UDim2["new"]
local larry3997 =larry3996(1, -10, 1, 0)
local larry3998 =UDim2["new"]
local larry3999 =larry3998(0, 5, 0, 0)
local larry4000 =Enum["Font"]
local larry4001 =larry4000["Arcade"]
local larry4002 =Color3["new"]
local larry4003 =larry4002(1, 1, 1)
local larry4004 =Enum["TextXAlignment"]
local larry4005 =larry4004["Left"]
local larry4006 =larry3995["MouseButton1Click"]
local larry4007 =larry4006["Connect"]
local larry4010 =Color3["fromRGB"]
local larry4011 =larry4010(255, 120, 0)
local larry4008 =larry4007(larry4006, function(...)
local _4009_vararg1, _4009_vararg2, _4009_vararg3, _4009_vararg4, _4009_vararg5, _4009_vararg6, _4009_vararg7, _4009_vararg8, _4009_vararg9, _4009_vararg10 = ...
larry3995["Text"] ="CLONE DEVOURER [PRESS KEY...]"
local larry4010 =Color3["fromRGB"]
local larry4011 =larry4010(255, 120, 0)
larry3995["TextColor3"] =larry4011
end)
local larry4012 =Instance["new"]
local larry4013 =larry4012("Frame", larry3827)
local larry4014 =UDim2["new"]
local larry4015 =larry4014(1, 0, 0, 22)
local larry4016 =UDim2["new"]
local larry4017 =larry4016(0, 0, 0, 150)
local larry4018 =Color3["fromRGB"]
local larry4019 =larry4018(45, 45, 55)
local larry4020 =Instance["new"]
local larry4021 =larry4020("UICorner", larry4013)
local larry4022 =UDim["new"]
local larry4023 =larry4022(0, 6)
local larry4024 =Instance["new"]
local larry4025 =larry4024("TextButton", larry4013)
local larry4026 =UDim2["new"]
local larry4027 =larry4026(1, -10, 1, 0)
local larry4028 =UDim2["new"]
local larry4029 =larry4028(0, 5, 0, 0)
local larry4030 =Enum["Font"]
local larry4031 =larry4030["Arcade"]
local larry4032 =Color3["new"]
local larry4033 =larry4032(1, 1, 1)
local larry4034 =Enum["TextXAlignment"]
local larry4035 =larry4034["Left"]
local larry4036 =larry4025["MouseButton1Click"]
local larry4037 =larry4036["Connect"]
local larry4040 =Color3["fromRGB"]
local larry4041 =larry4040(255, 120, 0)
local larry4038 =larry4037(larry4036, function(...)
local _4039_vararg1, _4039_vararg2, _4039_vararg3, _4039_vararg4, _4039_vararg5, _4039_vararg6, _4039_vararg7, _4039_vararg8, _4039_vararg9, _4039_vararg10 = ...
larry4025["Text"] ="SPEED [PRESS KEY...]"
local larry4040 =Color3["fromRGB"]
local larry4041 =larry4040(255, 120, 0)
larry4025["TextColor3"] =larry4041
end)
local larry4042 =larry3827["GetChildren"]
local larry4043 =larry4042(larry3827)
local larry4045 =_4044_2["IsA"]
local larry4046 =larry4045(_4044_2, "Frame")
local larry4047 =_4044_2["Size"]
local larry4048 =larry4047["Y"]
local larry4049 =larry4048["Offset"]
local larry4052 =UDim2["new"]
local larry4053 =larry4052(1, 0, 0, larry4051)
local larry4054 =UDim2["new"]
local larry4055 =larry4054(0, 0, 0, larry4051)
local larry4056 =Instance["new"]
local larry4057 =larry4056("TextButton", larry3795)
local larry4058 =UDim2["new"]
local larry4059 =larry4058(0.28, 0, 0, 20)
local larry4060 =UDim2["new"]
local larry4061 =larry4060(0.15, 0, 1, -24)
local larry4062 =Color3["fromRGB"]
local larry4063 =larry4062(150, 50, 50)
local larry4064 =Enum["Font"]
local larry4065 =larry4064["Arcade"]
local larry4066 =Color3["new"]
local larry4067 =larry4066(1, 1, 1)
local larry4068 =Instance["new"]
local larry4069 =larry4068("UICorner", larry4057)
local larry4070 =UDim["new"]
local larry4071 =larry4070(0, 6)
local larry4072 =larry4057["MouseButton1Click"]
local larry4073 =larry4072["Connect"]
local larry4076 =makefolder("MirandaTweenPlus")
local larry4077 =larry6["JSONEncode"]
local larry4078 =larry4077(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = true,
  ["nearest"] = true,
  ["antiRagdoll"] = true,
})
local _ =writefile("MirandaTweenPlus/config.json", larry4078)
local larry4079 =larry3827["GetDescendants"]
local larry4080 =larry4079(larry3827)
local larry4082 =_4081_2["Name"]
local larry4083 =larry3827["GetDescendants"]
local larry4084 =larry4083(larry3827)
local larry4086 =_4085_2["Name"]
local larry4087 =larry3827["GetDescendants"]
local larry4088 =larry4087(larry3827)
local larry4090 =_4089_2["Name"]
local larry4091 =larry3827["GetDescendants"]
local larry4092 =larry4091(larry3827)
local larry4094 =_4093_2["Name"]
local larry4095 =larry3827["GetDescendants"]
local larry4096 =larry4095(larry3827)
local larry4098 =_4097_2["Name"]
local larry4099 =larry3827["GetDescendants"]
local larry4100 =larry4099(larry3827)
local larry4102 =_4101_2["Name"]
local larry4103 =larry3827["GetDescendants"]
local larry4104 =larry4103(larry3827)
local larry4106 =_4105_2["Name"]
local larry4107 =task["spawn"]
local larry4108 =larry4107(function(...)
local _4109_vararg1, _4109_vararg2, _4109_vararg3, _4109_vararg4, _4109_vararg5, _4109_vararg6, _4109_vararg7, _4109_vararg8, _4109_vararg9, _4109_vararg10 = ...

end)
local larry4074 =larry4073(larry4072, function(...)
local _4075_vararg1, _4075_vararg2, _4075_vararg3, _4075_vararg4, _4075_vararg5, _4075_vararg6, _4075_vararg7, _4075_vararg8, _4075_vararg9, _4075_vararg10 = ...
local larry4076 =makefolder("MirandaTweenPlus")
local larry4077 =larry6["JSONEncode"]
local larry4078 =larry4077(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = true,
  ["nearest"] = true,
  ["antiRagdoll"] = true,
})
local _ =writefile("MirandaTweenPlus/config.json", larry4078)
local larry4079 =larry3827["GetDescendants"]
local larry4080 =larry4079(larry3827)
for larry4081, _4081_2 in ipairs(larry4080) do
local larry4082 =_4081_2["Name"]
end
local larry4083 =larry3827["GetDescendants"]
local larry4084 =larry4083(larry3827)
for larry4085, _4085_2 in ipairs(larry4084) do
local larry4086 =_4085_2["Name"]
end
local larry4087 =larry3827["GetDescendants"]
local larry4088 =larry4087(larry3827)
for larry4089, _4089_2 in ipairs(larry4088) do
local larry4090 =_4089_2["Name"]
end
local larry4091 =larry3827["GetDescendants"]
local larry4092 =larry4091(larry3827)
for larry4093, _4093_2 in ipairs(larry4092) do
local larry4094 =_4093_2["Name"]
end
local larry4095 =larry3827["GetDescendants"]
local larry4096 =larry4095(larry3827)
for larry4097, _4097_2 in ipairs(larry4096) do
local larry4098 =_4097_2["Name"]
end
local larry4099 =larry3827["GetDescendants"]
local larry4100 =larry4099(larry3827)
for larry4101, _4101_2 in ipairs(larry4100) do
local larry4102 =_4101_2["Name"]
end
local larry4103 =larry3827["GetDescendants"]
local larry4104 =larry4103(larry3827)
for larry4105, _4105_2 in ipairs(larry4104) do
local larry4106 =_4105_2["Name"]
end
local larry4107 =task["spawn"]
local larry4108 =larry4107(function(...)
local _4109_vararg1, _4109_vararg2, _4109_vararg3, _4109_vararg4, _4109_vararg5, _4109_vararg6, _4109_vararg7, _4109_vararg8, _4109_vararg9, _4109_vararg10 = ...

end)
end)
local larry4110 =Instance["new"]
local larry4111 =larry4110("TextButton", larry3795)
local larry4112 =UDim2["new"]
local larry4113 =larry4112(0.28, 0, 0, 20)
local larry4114 =UDim2["new"]
local larry4115 =larry4114(0.57, 0, 1, -24)
local larry4116 =Color3["fromRGB"]
local larry4117 =larry4116(200, 50, 50)
local larry4118 =Enum["Font"]
local larry4119 =larry4118["Arcade"]
local larry4120 =Color3["new"]
local larry4121 =larry4120(1, 1, 1)
local larry4122 =Instance["new"]
local larry4123 =larry4122("UICorner", larry4111)
local larry4124 =UDim["new"]
local larry4125 =larry4124(0, 6)
local larry4126 =larry4111["MouseButton1Click"]
local larry4127 =larry4126["Connect"]
local larry4130 =larry3791["Destroy"]
local larry4131 =larry4130(larry3791)
local larry4132 =task["spawn"]
local _ =task.wait(0.2)
local larry4133 =larry4132(function(...)
local _4134_vararg1, _4134_vararg2, _4134_vararg3, _4134_vararg4, _4134_vararg5, _4134_vararg6, _4134_vararg7, _4134_vararg8, _4134_vararg9, _4134_vararg10 = ...
local _ =task.wait(0.2)
end)
local larry4128 =larry4127(larry4126, function(...)
local _4129_vararg1, _4129_vararg2, _4129_vararg3, _4129_vararg4, _4129_vararg5, _4129_vararg6, _4129_vararg7, _4129_vararg8, _4129_vararg9, _4129_vararg10 = ...
local larry4130 =larry3791["Destroy"]
local larry4131 =larry4130(larry3791)
local larry4132 =task["spawn"]
local larry4133 =larry4132(function(...)
local _4134_vararg1, _4134_vararg2, _4134_vararg3, _4134_vararg4, _4134_vararg5, _4134_vararg6, _4134_vararg7, _4134_vararg8, _4134_vararg9, _4134_vararg10 = ...
local _ =task.wait(0.2)
end)
end)
local larry4135 =larry18["InputBegan"]
local larry4136 =larry4135["Connect"]
local larry4137 =larry4136(larry4135, function(...)
local _4138_vararg1, _4138_vararg2, _4138_vararg3, _4138_vararg4, _4138_vararg5, _4138_vararg6, _4138_vararg7, _4138_vararg8, _4138_vararg9, _4138_vararg10 = ...

end)
local er =error("Luraph Script:2519: Luraph Script:2511: line 3: attempt to index nil with 'ChildRemoved'")
local larry3788 =larry3787(larry3786, function(...)
local _3789_vararg1, _3789_vararg2, _3789_vararg3, _3789_vararg4, _3789_vararg5, _3789_vararg6, _3789_vararg7, _3789_vararg8, _3789_vararg9, _3789_vararg10 = ...
local larry3790 =Instance["new"]
local larry3791 =larry3790("ScreenGui", larry140)
larry3791["Name"] ="KeybindGui"
larry3791["ResetOnSpawn"] =false
local larry3792 =Enum["ZIndexBehavior"]
local larry3793 =larry3792["Sibling"]
larry3791["ZIndexBehavior"] =larry3793
local larry3794 =Instance["new"]
local larry3795 =larry3794("Frame", larry3791)
local larry3796 =UDim2["new"]
local larry3797 =larry3796(0, 220, 0, 230)
larry3795["Size"] =larry3797
local larry3798 =UDim2["new"]
local larry3799 =larry3798(0.5, -110, 0.5, -115)
larry3795["Position"] =larry3799
local larry3800 =Color3["fromRGB"]
local larry3801 =larry3800(30, 30, 40)
larry3795["BackgroundColor3"] =larry3801
larry3795["BorderSizePixel"] =0
local larry3802 =Instance["new"]
local larry3803 =larry3802("UICorner", larry3795)
local larry3804 =UDim["new"]
local larry3805 =larry3804(0, 12)
larry3803["CornerRadius"] =larry3805
local larry3806 =Instance["new"]
local larry3807 =larry3806("UIStroke", larry3795)
larry3807["Thickness"] =2
larry3807["Color"] =larry34
larry3807["Transparency"] =0.2
local larry3808 =Instance["new"]
local larry3809 =larry3808("TextLabel", larry3795)
local larry3810 =UDim2["new"]
local larry3811 =larry3810(1, -12, 0, 22)
larry3809["Size"] =larry3811
local larry3812 =UDim2["new"]
local larry3813 =larry3812(0, 6, 0, 8)
larry3809["Position"] =larry3813
larry3809["BackgroundTransparency"] =1
larry3809["Text"] ="MIRANDA KEYBINDS"
local larry3814 =Enum["Font"]
local larry3815 =larry3814["Arcade"]
larry3809["Font"] =larry3815
local larry3816 =Color3["new"]
local larry3817 =larry3816(1, 1, 1)
larry3809["TextColor3"] =larry3817
larry3809["TextSize"] =13
local larry3818 =Enum["TextXAlignment"]
local larry3819 =larry3818["Center"]
larry3809["TextXAlignment"] =larry3819
local larry3820 =Instance["new"]
local larry3821 =larry3820("ScrollingFrame", larry3795)
local larry3822 =UDim2["new"]
local larry3823 =larry3822(1, -12, 1, -58)
larry3821["Size"] =larry3823
local larry3824 =UDim2["new"]
local larry3825 =larry3824(0, 6, 0, 32)
larry3821["Position"] =larry3825
larry3821["BackgroundTransparency"] =1
larry3821["BorderSizePixel"] =0
larry3821["ScrollBarThickness"] =6
local larry3826 =Instance["new"]
local larry3827 =larry3826("Frame", larry3821)
local larry3828 =UDim2["new"]
local larry3829 =larry3828(1, 0, 0, 0)
larry3827["Size"] =larry3829
larry3827["BackgroundTransparency"] =1
local larry3830 =UDim2["new"]
local larry3831 =larry3830(0, 0, 0, 0)
larry3821["CanvasSize"] =larry3831
local larry3832 =Instance["new"]
local larry3833 =larry3832("Frame", larry3827)
local larry3834 =UDim2["new"]
local larry3835 =larry3834(1, 0, 0, 22)
larry3833["Size"] =larry3835
local larry3836 =UDim2["new"]
local larry3837 =larry3836(0, 0, 0, 0)
larry3833["Position"] =larry3837
local larry3838 =Color3["fromRGB"]
local larry3839 =larry3838(45, 45, 55)
larry3833["BackgroundColor3"] =larry3839
larry3833["BorderSizePixel"] =0
local larry3840 =Instance["new"]
local larry3841 =larry3840("UICorner", larry3833)
local larry3842 =UDim["new"]
local larry3843 =larry3842(0, 6)
larry3841["CornerRadius"] =larry3843
local larry3844 =Instance["new"]
local larry3845 =larry3844("TextButton", larry3833)
local larry3846 =UDim2["new"]
local larry3847 =larry3846(1, -10, 1, 0)
larry3845["Size"] =larry3847
local larry3848 =UDim2["new"]
local larry3849 =larry3848(0, 5, 0, 0)
larry3845["Position"] =larry3849
larry3845["BackgroundTransparency"] =1
larry3845["Text"] ="DESYNC"
local larry3850 =Enum["Font"]
local larry3851 =larry3850["Arcade"]
larry3845["Font"] =larry3851
local larry3852 =Color3["new"]
local larry3853 =larry3852(1, 1, 1)
larry3845["TextColor3"] =larry3853
larry3845["TextSize"] =10
local larry3854 =Enum["TextXAlignment"]
local larry3855 =larry3854["Left"]
larry3845["TextXAlignment"] =larry3855
larry3845["AutoButtonColor"] =false
larry3845["Name"] ="desync_KeyLabel"
local larry3856 =larry3845["MouseButton1Click"]
local larry3857 =larry3856["Connect"]
local larry3858 =larry3857(larry3856, function(...)
local _3859_vararg1, _3859_vararg2, _3859_vararg3, _3859_vararg4, _3859_vararg5, _3859_vararg6, _3859_vararg7, _3859_vararg8, _3859_vararg9, _3859_vararg10 = ...
larry3845["Text"] ="DESYNC [PRESS KEY...]"
local larry3860 =Color3["fromRGB"]
local larry3861 =larry3860(255, 120, 0)
larry3845["TextColor3"] =larry3861
end)
local larry3862 =Instance["new"]
local larry3863 =larry3862("Frame", larry3827)
local larry3864 =UDim2["new"]
local larry3865 =larry3864(1, 0, 0, 22)
larry3863["Size"] =larry3865
local larry3866 =UDim2["new"]
local larry3867 =larry3866(0, 0, 0, 25)
larry3863["Position"] =larry3867
local larry3868 =Color3["fromRGB"]
local larry3869 =larry3868(45, 45, 55)
larry3863["BackgroundColor3"] =larry3869
larry3863["BorderSizePixel"] =0
local larry3870 =Instance["new"]
local larry3871 =larry3870("UICorner", larry3863)
local larry3872 =UDim["new"]
local larry3873 =larry3872(0, 6)
larry3871["CornerRadius"] =larry3873
local larry3874 =Instance["new"]
local larry3875 =larry3874("TextButton", larry3863)
local larry3876 =UDim2["new"]
local larry3877 =larry3876(1, -10, 1, 0)
larry3875["Size"] =larry3877
local larry3878 =UDim2["new"]
local larry3879 =larry3878(0, 5, 0, 0)
larry3875["Position"] =larry3879
larry3875["BackgroundTransparency"] =1
larry3875["Text"] ="INF JUMP"
local larry3880 =Enum["Font"]
local larry3881 =larry3880["Arcade"]
larry3875["Font"] =larry3881
local larry3882 =Color3["new"]
local larry3883 =larry3882(1, 1, 1)
larry3875["TextColor3"] =larry3883
larry3875["TextSize"] =10
local larry3884 =Enum["TextXAlignment"]
local larry3885 =larry3884["Left"]
larry3875["TextXAlignment"] =larry3885
larry3875["AutoButtonColor"] =false
larry3875["Name"] ="infJump_KeyLabel"
local larry3886 =larry3875["MouseButton1Click"]
local larry3887 =larry3886["Connect"]
local larry3888 =larry3887(larry3886, function(...)
local _3889_vararg1, _3889_vararg2, _3889_vararg3, _3889_vararg4, _3889_vararg5, _3889_vararg6, _3889_vararg7, _3889_vararg8, _3889_vararg9, _3889_vararg10 = ...
larry3875["Text"] ="INF JUMP [PRESS KEY...]"
local larry3890 =Color3["fromRGB"]
local larry3891 =larry3890(255, 120, 0)
larry3875["TextColor3"] =larry3891
end)
local larry3892 =Instance["new"]
local larry3893 =larry3892("Frame", larry3827)
local larry3894 =UDim2["new"]
local larry3895 =larry3894(1, 0, 0, 22)
larry3893["Size"] =larry3895
local larry3896 =UDim2["new"]
local larry3897 =larry3896(0, 0, 0, 50)
larry3893["Position"] =larry3897
local larry3898 =Color3["fromRGB"]
local larry3899 =larry3898(45, 45, 55)
larry3893["BackgroundColor3"] =larry3899
larry3893["BorderSizePixel"] =0
local larry3900 =Instance["new"]
local larry3901 =larry3900("UICorner", larry3893)
local larry3902 =UDim["new"]
local larry3903 =larry3902(0, 6)
larry3901["CornerRadius"] =larry3903
local larry3904 =Instance["new"]
local larry3905 =larry3904("TextButton", larry3893)
local larry3906 =UDim2["new"]
local larry3907 =larry3906(1, -10, 1, 0)
larry3905["Size"] =larry3907
local larry3908 =UDim2["new"]
local larry3909 =larry3908(0, 5, 0, 0)
larry3905["Position"] =larry3909
larry3905["BackgroundTransparency"] =1
larry3905["Text"] ="FLY TO BEST"
local larry3910 =Enum["Font"]
local larry3911 =larry3910["Arcade"]
larry3905["Font"] =larry3911
local larry3912 =Color3["new"]
local larry3913 =larry3912(1, 1, 1)
larry3905["TextColor3"] =larry3913
larry3905["TextSize"] =10
local larry3914 =Enum["TextXAlignment"]
local larry3915 =larry3914["Left"]
larry3905["TextXAlignment"] =larry3915
larry3905["AutoButtonColor"] =false
larry3905["Name"] ="flyToBest_KeyLabel"
local larry3916 =larry3905["MouseButton1Click"]
local larry3917 =larry3916["Connect"]
local larry3918 =larry3917(larry3916, function(...)
local _3919_vararg1, _3919_vararg2, _3919_vararg3, _3919_vararg4, _3919_vararg5, _3919_vararg6, _3919_vararg7, _3919_vararg8, _3919_vararg9, _3919_vararg10 = ...
larry3905["Text"] ="FLY TO BEST [PRESS KEY...]"
local larry3920 =Color3["fromRGB"]
local larry3921 =larry3920(255, 120, 0)
larry3905["TextColor3"] =larry3921
end)
local larry3922 =Instance["new"]
local larry3923 =larry3922("Frame", larry3827)
local larry3924 =UDim2["new"]
local larry3925 =larry3924(1, 0, 0, 22)
larry3923["Size"] =larry3925
local larry3926 =UDim2["new"]
local larry3927 =larry3926(0, 0, 0, 75)
larry3923["Position"] =larry3927
local larry3928 =Color3["fromRGB"]
local larry3929 =larry3928(45, 45, 55)
larry3923["BackgroundColor3"] =larry3929
larry3923["BorderSizePixel"] =0
local larry3930 =Instance["new"]
local larry3931 =larry3930("UICorner", larry3923)
local larry3932 =UDim["new"]
local larry3933 =larry3932(0, 6)
larry3931["CornerRadius"] =larry3933
local larry3934 =Instance["new"]
local larry3935 =larry3934("TextButton", larry3923)
local larry3936 =UDim2["new"]
local larry3937 =larry3936(1, -10, 1, 0)
larry3935["Size"] =larry3937
local larry3938 =UDim2["new"]
local larry3939 =larry3938(0, 5, 0, 0)
larry3935["Position"] =larry3939
larry3935["BackgroundTransparency"] =1
larry3935["Text"] ="STEAL FLOOR"
local larry3940 =Enum["Font"]
local larry3941 =larry3940["Arcade"]
larry3935["Font"] =larry3941
local larry3942 =Color3["new"]
local larry3943 =larry3942(1, 1, 1)
larry3935["TextColor3"] =larry3943
larry3935["TextSize"] =10
local larry3944 =Enum["TextXAlignment"]
local larry3945 =larry3944["Left"]
larry3935["TextXAlignment"] =larry3945
larry3935["AutoButtonColor"] =false
larry3935["Name"] ="stealFloor_KeyLabel"
local larry3946 =larry3935["MouseButton1Click"]
local larry3947 =larry3946["Connect"]
local larry3948 =larry3947(larry3946, function(...)
local _3949_vararg1, _3949_vararg2, _3949_vararg3, _3949_vararg4, _3949_vararg5, _3949_vararg6, _3949_vararg7, _3949_vararg8, _3949_vararg9, _3949_vararg10 = ...
larry3935["Text"] ="STEAL FLOOR [PRESS KEY...]"
local larry3950 =Color3["fromRGB"]
local larry3951 =larry3950(255, 120, 0)
larry3935["TextColor3"] =larry3951
end)
local larry3952 =Instance["new"]
local larry3953 =larry3952("Frame", larry3827)
local larry3954 =UDim2["new"]
local larry3955 =larry3954(1, 0, 0, 22)
larry3953["Size"] =larry3955
local larry3956 =UDim2["new"]
local larry3957 =larry3956(0, 0, 0, 100)
larry3953["Position"] =larry3957
local larry3958 =Color3["fromRGB"]
local larry3959 =larry3958(45, 45, 55)
larry3953["BackgroundColor3"] =larry3959
larry3953["BorderSizePixel"] =0
local larry3960 =Instance["new"]
local larry3961 =larry3960("UICorner", larry3953)
local larry3962 =UDim["new"]
local larry3963 =larry3962(0, 6)
larry3961["CornerRadius"] =larry3963
local larry3964 =Instance["new"]
local larry3965 =larry3964("TextButton", larry3953)
local larry3966 =UDim2["new"]
local larry3967 =larry3966(1, -10, 1, 0)
larry3965["Size"] =larry3967
local larry3968 =UDim2["new"]
local larry3969 =larry3968(0, 5, 0, 0)
larry3965["Position"] =larry3969
larry3965["BackgroundTransparency"] =1
larry3965["Text"] ="FLY V2"
local larry3970 =Enum["Font"]
local larry3971 =larry3970["Arcade"]
larry3965["Font"] =larry3971
local larry3972 =Color3["new"]
local larry3973 =larry3972(1, 1, 1)
larry3965["TextColor3"] =larry3973
larry3965["TextSize"] =10
local larry3974 =Enum["TextXAlignment"]
local larry3975 =larry3974["Left"]
larry3965["TextXAlignment"] =larry3975
larry3965["AutoButtonColor"] =false
larry3965["Name"] ="flyV2_KeyLabel"
local larry3976 =larry3965["MouseButton1Click"]
local larry3977 =larry3976["Connect"]
local larry3978 =larry3977(larry3976, function(...)
local _3979_vararg1, _3979_vararg2, _3979_vararg3, _3979_vararg4, _3979_vararg5, _3979_vararg6, _3979_vararg7, _3979_vararg8, _3979_vararg9, _3979_vararg10 = ...
larry3965["Text"] ="FLY V2 [PRESS KEY...]"
local larry3980 =Color3["fromRGB"]
local larry3981 =larry3980(255, 120, 0)
larry3965["TextColor3"] =larry3981
end)
local larry3982 =Instance["new"]
local larry3983 =larry3982("Frame", larry3827)
local larry3984 =UDim2["new"]
local larry3985 =larry3984(1, 0, 0, 22)
larry3983["Size"] =larry3985
local larry3986 =UDim2["new"]
local larry3987 =larry3986(0, 0, 0, 125)
larry3983["Position"] =larry3987
local larry3988 =Color3["fromRGB"]
local larry3989 =larry3988(45, 45, 55)
larry3983["BackgroundColor3"] =larry3989
larry3983["BorderSizePixel"] =0
local larry3990 =Instance["new"]
local larry3991 =larry3990("UICorner", larry3983)
local larry3992 =UDim["new"]
local larry3993 =larry3992(0, 6)
larry3991["CornerRadius"] =larry3993
local larry3994 =Instance["new"]
local larry3995 =larry3994("TextButton", larry3983)
local larry3996 =UDim2["new"]
local larry3997 =larry3996(1, -10, 1, 0)
larry3995["Size"] =larry3997
local larry3998 =UDim2["new"]
local larry3999 =larry3998(0, 5, 0, 0)
larry3995["Position"] =larry3999
larry3995["BackgroundTransparency"] =1
larry3995["Text"] ="CLONE DEVOURER"
local larry4000 =Enum["Font"]
local larry4001 =larry4000["Arcade"]
larry3995["Font"] =larry4001
local larry4002 =Color3["new"]
local larry4003 =larry4002(1, 1, 1)
larry3995["TextColor3"] =larry4003
larry3995["TextSize"] =10
local larry4004 =Enum["TextXAlignment"]
local larry4005 =larry4004["Left"]
larry3995["TextXAlignment"] =larry4005
larry3995["AutoButtonColor"] =false
larry3995["Name"] ="devourer_KeyLabel"
local larry4006 =larry3995["MouseButton1Click"]
local larry4007 =larry4006["Connect"]
local larry4008 =larry4007(larry4006, function(...)
local _4009_vararg1, _4009_vararg2, _4009_vararg3, _4009_vararg4, _4009_vararg5, _4009_vararg6, _4009_vararg7, _4009_vararg8, _4009_vararg9, _4009_vararg10 = ...
larry3995["Text"] ="CLONE DEVOURER [PRESS KEY...]"
local larry4010 =Color3["fromRGB"]
local larry4011 =larry4010(255, 120, 0)
larry3995["TextColor3"] =larry4011
end)
local larry4012 =Instance["new"]
local larry4013 =larry4012("Frame", larry3827)
local larry4014 =UDim2["new"]
local larry4015 =larry4014(1, 0, 0, 22)
larry4013["Size"] =larry4015
local larry4016 =UDim2["new"]
local larry4017 =larry4016(0, 0, 0, 150)
larry4013["Position"] =larry4017
local larry4018 =Color3["fromRGB"]
local larry4019 =larry4018(45, 45, 55)
larry4013["BackgroundColor3"] =larry4019
larry4013["BorderSizePixel"] =0
local larry4020 =Instance["new"]
local larry4021 =larry4020("UICorner", larry4013)
local larry4022 =UDim["new"]
local larry4023 =larry4022(0, 6)
larry4021["CornerRadius"] =larry4023
local larry4024 =Instance["new"]
local larry4025 =larry4024("TextButton", larry4013)
local larry4026 =UDim2["new"]
local larry4027 =larry4026(1, -10, 1, 0)
larry4025["Size"] =larry4027
local larry4028 =UDim2["new"]
local larry4029 =larry4028(0, 5, 0, 0)
larry4025["Position"] =larry4029
larry4025["BackgroundTransparency"] =1
larry4025["Text"] ="SPEED"
local larry4030 =Enum["Font"]
local larry4031 =larry4030["Arcade"]
larry4025["Font"] =larry4031
local larry4032 =Color3["new"]
local larry4033 =larry4032(1, 1, 1)
larry4025["TextColor3"] =larry4033
larry4025["TextSize"] =10
local larry4034 =Enum["TextXAlignment"]
local larry4035 =larry4034["Left"]
larry4025["TextXAlignment"] =larry4035
larry4025["AutoButtonColor"] =false
larry4025["Name"] ="speed_KeyLabel"
local larry4036 =larry4025["MouseButton1Click"]
local larry4037 =larry4036["Connect"]
local larry4038 =larry4037(larry4036, function(...)
local _4039_vararg1, _4039_vararg2, _4039_vararg3, _4039_vararg4, _4039_vararg5, _4039_vararg6, _4039_vararg7, _4039_vararg8, _4039_vararg9, _4039_vararg10 = ...
larry4025["Text"] ="SPEED [PRESS KEY...]"
local larry4040 =Color3["fromRGB"]
local larry4041 =larry4040(255, 120, 0)
larry4025["TextColor3"] =larry4041
end)
local larry4042 =larry3827["GetChildren"]
local larry4043 =larry4042(larry3827)
for larry4044, _4044_2 in ipairs(larry4043) do
local larry4045 =_4044_2["IsA"]
local larry4046 =larry4045(_4044_2, "Frame")
local larry4047 =_4044_2["Size"]
local larry4048 =larry4047["Y"]
local larry4049 =larry4048["Offset"]
local larry4050 =(0+larry4049)
local larry4051 =(larry4050+3)
end
local larry4052 =UDim2["new"]
local larry4053 =larry4052(1, 0, 0, larry4051)
larry3827["Size"] =larry4053
local larry4054 =UDim2["new"]
local larry4055 =larry4054(0, 0, 0, larry4051)
larry3821["CanvasSize"] =larry4055
local larry4056 =Instance["new"]
local larry4057 =larry4056("TextButton", larry3795)
local larry4058 =UDim2["new"]
local larry4059 =larry4058(0.28, 0, 0, 20)
larry4057["Size"] =larry4059
local larry4060 =UDim2["new"]
local larry4061 =larry4060(0.15, 0, 1, -24)
larry4057["Position"] =larry4061
local larry4062 =Color3["fromRGB"]
local larry4063 =larry4062(150, 50, 50)
larry4057["BackgroundColor3"] =larry4063
larry4057["Text"] ="CLEAR"
local larry4064 =Enum["Font"]
local larry4065 =larry4064["Arcade"]
larry4057["Font"] =larry4065
local larry4066 =Color3["new"]
local larry4067 =larry4066(1, 1, 1)
larry4057["TextColor3"] =larry4067
larry4057["TextSize"] =11
larry4057["BorderSizePixel"] =0
local larry4068 =Instance["new"]
local larry4069 =larry4068("UICorner", larry4057)
local larry4070 =UDim["new"]
local larry4071 =larry4070(0, 6)
larry4069["CornerRadius"] =larry4071
local larry4072 =larry4057["MouseButton1Click"]
local larry4073 =larry4072["Connect"]
local larry4074 =larry4073(larry4072, function(...)
local _4075_vararg1, _4075_vararg2, _4075_vararg3, _4075_vararg4, _4075_vararg5, _4075_vararg6, _4075_vararg7, _4075_vararg8, _4075_vararg9, _4075_vararg10 = ...
local larry4076 =makefolder("MirandaTweenPlus")
local larry4077 =larry6["JSONEncode"]
local larry4078 =larry4077(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = false,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = true,
  ["nearest"] = true,
  ["antiRagdoll"] = true,
})
local _ =writefile("MirandaTweenPlus/config.json", larry4078)
local larry4079 =larry3827["GetDescendants"]
local larry4080 =larry4079(larry3827)
for larry4081, _4081_2 in ipairs(larry4080) do
local larry4082 =_4081_2["Name"]
end
local larry4083 =larry3827["GetDescendants"]
local larry4084 =larry4083(larry3827)
for larry4085, _4085_2 in ipairs(larry4084) do
local larry4086 =_4085_2["Name"]
end
local larry4087 =larry3827["GetDescendants"]
local larry4088 =larry4087(larry3827)
for larry4089, _4089_2 in ipairs(larry4088) do
local larry4090 =_4089_2["Name"]
end
local larry4091 =larry3827["GetDescendants"]
local larry4092 =larry4091(larry3827)
for larry4093, _4093_2 in ipairs(larry4092) do
local larry4094 =_4093_2["Name"]
end
local larry4095 =larry3827["GetDescendants"]
local larry4096 =larry4095(larry3827)
for larry4097, _4097_2 in ipairs(larry4096) do
local larry4098 =_4097_2["Name"]
end
local larry4099 =larry3827["GetDescendants"]
local larry4100 =larry4099(larry3827)
for larry4101, _4101_2 in ipairs(larry4100) do
local larry4102 =_4101_2["Name"]
end
local larry4103 =larry3827["GetDescendants"]
local larry4104 =larry4103(larry3827)
for larry4105, _4105_2 in ipairs(larry4104) do
local larry4106 =_4105_2["Name"]
end
local larry4107 =task["spawn"]
local larry4108 =larry4107(function(...)
local _4109_vararg1, _4109_vararg2, _4109_vararg3, _4109_vararg4, _4109_vararg5, _4109_vararg6, _4109_vararg7, _4109_vararg8, _4109_vararg9, _4109_vararg10 = ...

end)
end)
local larry4110 =Instance["new"]
local larry4111 =larry4110("TextButton", larry3795)
local larry4112 =UDim2["new"]
local larry4113 =larry4112(0.28, 0, 0, 20)
larry4111["Size"] =larry4113
local larry4114 =UDim2["new"]
local larry4115 =larry4114(0.57, 0, 1, -24)
larry4111["Position"] =larry4115
local larry4116 =Color3["fromRGB"]
local larry4117 =larry4116(200, 50, 50)
larry4111["BackgroundColor3"] =larry4117
larry4111["Text"] ="CLOSE"
local larry4118 =Enum["Font"]
local larry4119 =larry4118["Arcade"]
larry4111["Font"] =larry4119
local larry4120 =Color3["new"]
local larry4121 =larry4120(1, 1, 1)
larry4111["TextColor3"] =larry4121
larry4111["TextSize"] =11
larry4111["BorderSizePixel"] =0
local larry4122 =Instance["new"]
local larry4123 =larry4122("UICorner", larry4111)
local larry4124 =UDim["new"]
local larry4125 =larry4124(0, 6)
larry4123["CornerRadius"] =larry4125
local larry4126 =larry4111["MouseButton1Click"]
local larry4127 =larry4126["Connect"]
local larry4128 =larry4127(larry4126, function(...)
local _4129_vararg1, _4129_vararg2, _4129_vararg3, _4129_vararg4, _4129_vararg5, _4129_vararg6, _4129_vararg7, _4129_vararg8, _4129_vararg9, _4129_vararg10 = ...
local larry4130 =larry3791["Destroy"]
local larry4131 =larry4130(larry3791)
local larry4132 =task["spawn"]
local larry4133 =larry4132(function(...)
local _4134_vararg1, _4134_vararg2, _4134_vararg3, _4134_vararg4, _4134_vararg5, _4134_vararg6, _4134_vararg7, _4134_vararg8, _4134_vararg9, _4134_vararg10 = ...
local _ =task.wait(0.2)
end)
end)
local larry4135 =larry18["InputBegan"]
local larry4136 =larry4135["Connect"]
local larry4137 =larry4136(larry4135, function(...)
local _4138_vararg1, _4138_vararg2, _4138_vararg3, _4138_vararg4, _4138_vararg5, _4138_vararg6, _4138_vararg7, _4138_vararg8, _4138_vararg9, _4138_vararg10 = ...

end)
local er =error("Luraph Script:2519: Luraph Script:2511: line 3: attempt to index nil with 'ChildRemoved'")
end)
local larry4139 =task["spawn"]
local larry4142 =larry18["InputBegan"]
local larry4143 =larry4142["Connect"]
local larry4144 =larry4143(larry4142, function(...)
local _4145_vararg1, _4145_vararg2, _4145_vararg3, _4145_vararg4, _4145_vararg5, _4145_vararg6, _4145_vararg7, _4145_vararg8, _4145_vararg9, _4145_vararg10 = ...

end)
local larry4140 =larry4139(function(...)
local _4141_vararg1, _4141_vararg2, _4141_vararg3, _4141_vararg4, _4141_vararg5, _4141_vararg6, _4141_vararg7, _4141_vararg8, _4141_vararg9, _4141_vararg10 = ...
local larry4142 =larry18["InputBegan"]
local larry4143 =larry4142["Connect"]
local larry4144 =larry4143(larry4142, function(...)
local _4145_vararg1, _4145_vararg2, _4145_vararg3, _4145_vararg4, _4145_vararg5, _4145_vararg6, _4145_vararg7, _4145_vararg8, _4145_vararg9, _4145_vararg10 = ...

end)
end)
local larry4146 =UDim2["new"]
local larry4147 =larry4146(0, 150, 0, 257)
local larry4148 =task["defer"]
local larry4151 =task["spawn"]
local larry4154 =larry632["GetChildren"]
local larry4155 =larry4154(larry632)
local larry4157 =_4156_2["FindFirstChild"]
local larry4158 =larry4157(_4156_2, "Decorations")
local larry4159 =larry4158["GetDescendants"]
local larry4160 =larry4159(larry4158)
local larry4162 =_4161_2["IsA"]
local larry4163 =larry4162(_4161_2, "BasePart")
local _ =task.wait()
local _ =task.wait()
local larry4152 =larry4151(function(...)
local _4153_vararg1, _4153_vararg2, _4153_vararg3, _4153_vararg4, _4153_vararg5, _4153_vararg6, _4153_vararg7, _4153_vararg8, _4153_vararg9, _4153_vararg10 = ...
local larry4154 =larry632["GetChildren"]
local larry4155 =larry4154(larry632)
for larry4156, _4156_2 in ipairs(larry4155) do
end
local larry4157 =_4156_2["FindFirstChild"]
local larry4158 =larry4157(_4156_2, "Decorations")
local larry4159 =larry4158["GetDescendants"]
local larry4160 =larry4159(larry4158)
for larry4161, _4161_2 in ipairs(larry4160) do
local larry4162 =_4161_2["IsA"]
local larry4163 =larry4162(_4161_2, "BasePart")
_4161_2["LocalTransparencyModifier"] =0
end
local _ =task.wait()
local _ =task.wait()
end)
local larry4164 =larry669["Disconnect"]
local larry4165 =larry4164(larry669)
local larry4166 =larry658["Disconnect"]
local larry4167 =larry4166(larry658)
local larry4168 =larry680["Disconnect"]
local larry4169 =larry4168(larry680)
local larry4149 =larry4148(function(...)
local _4150_vararg1, _4150_vararg2, _4150_vararg3, _4150_vararg4, _4150_vararg5, _4150_vararg6, _4150_vararg7, _4150_vararg8, _4150_vararg9, _4150_vararg10 = ...
local larry4151 =task["spawn"]
local larry4152 =larry4151(function(...)
local _4153_vararg1, _4153_vararg2, _4153_vararg3, _4153_vararg4, _4153_vararg5, _4153_vararg6, _4153_vararg7, _4153_vararg8, _4153_vararg9, _4153_vararg10 = ...
local larry4154 =larry632["GetChildren"]
local larry4155 =larry4154(larry632)
for larry4156, _4156_2 in ipairs(larry4155) do
end
local larry4157 =_4156_2["FindFirstChild"]
local larry4158 =larry4157(_4156_2, "Decorations")
local larry4159 =larry4158["GetDescendants"]
local larry4160 =larry4159(larry4158)
for larry4161, _4161_2 in ipairs(larry4160) do
local larry4162 =_4161_2["IsA"]
local larry4163 =larry4162(_4161_2, "BasePart")
_4161_2["LocalTransparencyModifier"] =0
end
local _ =task.wait()
local _ =task.wait()
end)
local larry4164 =larry669["Disconnect"]
local larry4165 =larry4164(larry669)
local larry4166 =larry658["Disconnect"]
local larry4167 =larry4166(larry658)
local larry4168 =larry680["Disconnect"]
local larry4169 =larry4168(larry680)
larry626["BackgroundColor3"] =larry37
end)
local larry4170 =task["defer"]
local larry4173 =larry742["Disconnect"]
local larry4174 =larry4173(larry742)
local larry4175 =larry749["Disconnect"]
local larry4176 =larry4175(larry749)
local larry4171 =larry4170(function(...)
local _4172_vararg1, _4172_vararg2, _4172_vararg3, _4172_vararg4, _4172_vararg5, _4172_vararg6, _4172_vararg7, _4172_vararg8, _4172_vararg9, _4172_vararg10 = ...
local larry4173 =larry742["Disconnect"]
local larry4174 =larry4173(larry742)
local larry4175 =larry749["Disconnect"]
local larry4176 =larry4175(larry749)
larry706["BackgroundColor3"] =larry37
end)
local larry4177 =task["defer"]
local larry4180 =larry77["GetPropertyChangedSignal"]
local larry4181 =larry4180(larry77, "FieldOfView")
local larry4182 =larry4181["Connect"]
local larry4183 =larry4182(larry4181, function(...)
local _4184_vararg1, _4184_vararg2, _4184_vararg3, _4184_vararg4, _4184_vararg5, _4184_vararg6, _4184_vararg7, _4184_vararg8, _4184_vararg9, _4184_vararg10 = ...
larry77["FieldOfView"] =larry91
larry76["Ambient"] =larry92
larry76["OutdoorAmbient"] =larry93
larry90["moveFunction"] =larry94
end)
local larry4185 =larry76["Changed"]
local larry4186 =larry4185["Connect"]
local larry4187 =larry4186(larry4185, function(...)
local _4188_vararg1, _4188_vararg2, _4188_vararg3, _4188_vararg4, _4188_vararg5, _4188_vararg6, _4188_vararg7, _4188_vararg8, _4188_vararg9, _4188_vararg10 = ...
larry77["FieldOfView"] =larry91
larry76["Ambient"] =larry92
larry76["OutdoorAmbient"] =larry93
larry90["moveFunction"] =larry94
end)
local larry4189 =larry76["ChildAdded"]
local larry4190 =larry4189["Connect"]
local larry4193 =_4192_vararg1["ClassName"]
local larry4191 =larry4190(larry4189, function(...)
local _4192_vararg1, _4192_vararg2, _4192_vararg3, _4192_vararg4, _4192_vararg5, _4192_vararg6, _4192_vararg7, _4192_vararg8, _4192_vararg9, _4192_vararg10 = ...
local larry4193 =_4192_vararg1["ClassName"]
end)
local larry4194 =larry76["ChildAdded"]
local larry4195 =larry4194["Connect"]
local larry4198 =larry76["GetChildren"]
local larry4199 =larry4198(larry76)
local larry4201 =_4200_2["ClassName"]
local larry4196 =larry4195(larry4194, function(...)
local _4197_vararg1, _4197_vararg2, _4197_vararg3, _4197_vararg4, _4197_vararg5, _4197_vararg6, _4197_vararg7, _4197_vararg8, _4197_vararg9, _4197_vararg10 = ...
local larry4198 =larry76["GetChildren"]
local larry4199 =larry4198(larry76)
for larry4200, _4200_2 in pairs(larry4199) do
local larry4201 =_4200_2["ClassName"]
end
end)
local larry4202 =larry85["RemoteEvent"]
local larry4203 =larry4202(larry85, "UseItem")
local larry4204 =larry4203["OnClientEvent"]
local larry4205 =larry4204["Connect"]
local larry4206 =larry4205(larry4204, function(...)
local _4207_vararg1, _4207_vararg2, _4207_vararg3, _4207_vararg4, _4207_vararg5, _4207_vararg6, _4207_vararg7, _4207_vararg8, _4207_vararg9, _4207_vararg10 = ...

end)
local larry4208 =larry76["GetChildren"]
local larry4209 =larry4208(larry76)
local larry4211 =_4210_2["ClassName"]
local larry4178 =larry4177(function(...)
local _4179_vararg1, _4179_vararg2, _4179_vararg3, _4179_vararg4, _4179_vararg5, _4179_vararg6, _4179_vararg7, _4179_vararg8, _4179_vararg9, _4179_vararg10 = ...
local larry4180 =larry77["GetPropertyChangedSignal"]
local larry4181 =larry4180(larry77, "FieldOfView")
local larry4182 =larry4181["Connect"]
local larry4183 =larry4182(larry4181, function(...)
local _4184_vararg1, _4184_vararg2, _4184_vararg3, _4184_vararg4, _4184_vararg5, _4184_vararg6, _4184_vararg7, _4184_vararg8, _4184_vararg9, _4184_vararg10 = ...
larry77["FieldOfView"] =larry91
larry76["Ambient"] =larry92
larry76["OutdoorAmbient"] =larry93
larry90["moveFunction"] =larry94
end)
local larry4185 =larry76["Changed"]
local larry4186 =larry4185["Connect"]
local larry4187 =larry4186(larry4185, function(...)
local _4188_vararg1, _4188_vararg2, _4188_vararg3, _4188_vararg4, _4188_vararg5, _4188_vararg6, _4188_vararg7, _4188_vararg8, _4188_vararg9, _4188_vararg10 = ...
larry77["FieldOfView"] =larry91
larry76["Ambient"] =larry92
larry76["OutdoorAmbient"] =larry93
larry90["moveFunction"] =larry94
end)
local larry4189 =larry76["ChildAdded"]
local larry4190 =larry4189["Connect"]
local larry4191 =larry4190(larry4189, function(...)
local _4192_vararg1, _4192_vararg2, _4192_vararg3, _4192_vararg4, _4192_vararg5, _4192_vararg6, _4192_vararg7, _4192_vararg8, _4192_vararg9, _4192_vararg10 = ...
local larry4193 =_4192_vararg1["ClassName"]
end)
local larry4194 =larry76["ChildAdded"]
local larry4195 =larry4194["Connect"]
local larry4196 =larry4195(larry4194, function(...)
local _4197_vararg1, _4197_vararg2, _4197_vararg3, _4197_vararg4, _4197_vararg5, _4197_vararg6, _4197_vararg7, _4197_vararg8, _4197_vararg9, _4197_vararg10 = ...
local larry4198 =larry76["GetChildren"]
local larry4199 =larry4198(larry76)
for larry4200, _4200_2 in pairs(larry4199) do
local larry4201 =_4200_2["ClassName"]
end
end)
local larry4202 =larry85["RemoteEvent"]
local larry4203 =larry4202(larry85, "UseItem")
local larry4204 =larry4203["OnClientEvent"]
local larry4205 =larry4204["Connect"]
local larry4206 =larry4205(larry4204, function(...)
local _4207_vararg1, _4207_vararg2, _4207_vararg3, _4207_vararg4, _4207_vararg5, _4207_vararg6, _4207_vararg7, _4207_vararg8, _4207_vararg9, _4207_vararg10 = ...

end)
local larry4208 =larry76["GetChildren"]
local larry4209 =larry4208(larry76)
for larry4210, _4210_2 in pairs(larry4209) do
local larry4211 =_4210_2["ClassName"]
end
larry777["BackgroundColor3"] =larry34
end)
local larry4212 =task["defer"]
local larry4213 =larry4212(function(...)
local _4214_vararg1, _4214_vararg2, _4214_vararg3, _4214_vararg4, _4214_vararg5, _4214_vararg6, _4214_vararg7, _4214_vararg8, _4214_vararg9, _4214_vararg10 = ...
larry2324["BackgroundColor3"] =larry34
end)
local larry4215 =task["defer"]
local er =error("Luraph Script:2552: line 3: attempt to call a nil value")
local larry4216 =larry4215(function(...)
local _4217_vararg1, _4217_vararg2, _4217_vararg3, _4217_vararg4, _4217_vararg5, _4217_vararg6, _4217_vararg7, _4217_vararg8, _4217_vararg9, _4217_vararg10 = ...
fenv["nearestAutoEnabled"] = true
local larry4218=fenv["nearestStart"]
local er =error("Luraph Script:2552: line 3: attempt to call a nil value")
end)
local larry4219 =task["defer"]
local er =error("Luraph Script:2554: line 3: attempt to call a nil value")
local larry4220 =larry4219(function(...)
local _4221_vararg1, _4221_vararg2, _4221_vararg3, _4221_vararg4, _4221_vararg5, _4221_vararg6, _4221_vararg7, _4221_vararg8, _4221_vararg9, _4221_vararg10 = ...
fenv["nearestAutoEnabled"] = true
local er =error("Luraph Script:2554: line 3: attempt to call a nil value")
end)
local larry4222 =task["defer"]
local larry4223 =larry4222(function(...)
local _4224_vararg1, _4224_vararg2, _4224_vararg3, _4224_vararg4, _4224_vararg5, _4224_vararg6, _4224_vararg7, _4224_vararg8, _4224_vararg9, _4224_vararg10 = ...
larry215["BackgroundColor3"] =larry34
end)
local larry4225 =task["defer"]
local larry4226 =larry4225(function(...)
local _4227_vararg1, _4227_vararg2, _4227_vararg3, _4227_vararg4, _4227_vararg5, _4227_vararg6, _4227_vararg7, _4227_vararg8, _4227_vararg9, _4227_vararg10 = ...

end)
local larry4228 =task["defer"]
local larry4229 =larry4228(function(...)
local _4230_vararg1, _4230_vararg2, _4230_vararg3, _4230_vararg4, _4230_vararg5, _4230_vararg6, _4230_vararg7, _4230_vararg8, _4230_vararg9, _4230_vararg10 = ...

end)
local larry4231 =UDim2["new"]
local larry4232 =larry4231(1, -125, 0, 10)
local larry4233 =UDim2["new"]
local larry4234 =larry4233(0, 115, 0, 182)
local larry4235 =Instance["new"]
local larry4236 =larry4235("Frame")
local larry4237 =UDim["new"]
local larry4238 =larry4237(0, 8)
local larry4239 =Instance["new"]
local larry4240 =larry4239("UICorner")
local larry4241 =Instance["new"]
local larry4242 =larry4241("UIStroke")
local larry4243 =Color3["fromRGB"]
local larry4244 =larry4243(70, 0, 0)
local larry4245 =Color3["fromRGB"]
local larry4246 =larry4245(60, 200, 60)
local larry4247 =Color3["fromRGB"]
local larry4248 =larry4247(80, 0, 0)
local larry4249 =UDim2["new"]
local larry4250 =larry4249(0.88, 0, 0, 26)
local larry4251 =UDim2["new"]
local larry4252 =larry4251(0.06, 0, 0, 6)
local larry4253 =Enum["Font"]
local larry4254 =larry4253["Arcade"]
local larry4255 =Instance["new"]
local larry4256 =larry4255("TextButton")
local larry4257 =UDim["new"]
local larry4258 =larry4257(0, 6)
local larry4259 =Instance["new"]
local larry4260 =larry4259("UICorner")
local larry4261 =UDim2["new"]
local larry4262 =larry4261(1, -4, 0, 10)
local larry4263 =UDim2["new"]
local larry4264 =larry4263(0, 2, 1, -11)
local larry4265 =Enum["Font"]
local larry4266 =larry4265["Arcade"]
local larry4267 =Enum["TextXAlignment"]
local larry4268 =larry4267["Center"]
local larry4269 =Instance["new"]
local larry4270 =larry4269("TextLabel")
local larry4271 =task["spawn"]
local _ =task.wait(0.1)
local larry4274 =larry4256["Parent"]
local larry4275 =larry4256["FindFirstChild"]
local larry4276 =larry4275(larry4256, "KeybindLabel")
local larry4277 =larry4276["Destroy"]
local larry4278 =larry4277(larry4276)
local larry4272 =larry4271(function(...)
local _4273_vararg1, _4273_vararg2, _4273_vararg3, _4273_vararg4, _4273_vararg5, _4273_vararg6, _4273_vararg7, _4273_vararg8, _4273_vararg9, _4273_vararg10 = ...
local _ =task.wait(0.1)
local larry4274 =larry4256["Parent"]
local larry4275 =larry4256["FindFirstChild"]
local larry4276 =larry4275(larry4256, "KeybindLabel")
local larry4277 =larry4276["Destroy"]
local larry4278 =larry4277(larry4276)
end)
local larry4279 =larry4256["MouseButton1Click"]
local larry4280 =larry4279["Connect"]
local larry4283 =task["spawn"]
local larry4286 =larry25["Character"]
local larry4287 =larry25["WaitForChild"]
local larry4288 =larry4287(larry25, "Backpack")
local larry4289 =larry4286["FindFirstChildWhichIsA"]
local larry4290 =larry4289(larry4286, "Humanoid")
local larry4291 =larry4290["UnequipTools"]
local larry4292 =larry4291(larry4290)
local larry4293 =larry4286["GetChildren"]
local larry4294 =larry4293(larry4286)
local larry4296 =_4295_2["IsA"]
local larry4297 =larry4296(_4295_2, "Accessory")
local larry4298 =_4295_2["Destroy"]
local larry4299 =larry4298(_4295_2)
local larry4300 =larry4288["FindFirstChild"]
local larry4301 =larry4300(larry4288, "Quantum Cloner")
local _ =task.wait()
local larry4302 =larry4301["Activate"]
local larry4303 =larry4302(larry4301)
local larry4304 =larry4288["GetChildren"]
local larry4305 =larry4304(larry4288)
local larry4307 =_4306_2["IsA"]
local larry4308 =larry4307(_4306_2, "Tool")
local larry4309 =_4306_2["Name"]
local larry4310, _4310_2, _4310_3 =string.lower(larry4309)
local larry4311 =larry4310["find"]
local larry4312 =larry4311(larry4310, "slap")
local _ =task.wait(0.5)
local larry4313 =larry14["GetChildren"]
local larry4314 =larry4313(larry14)
local larry4316 =_4315_2["IsA"]
local larry4317 =larry4316(_4315_2, "Model")
local larry4319 =_4315_2["FindFirstChildWhichIsA"]
local larry4320 =larry4319(_4315_2, "Humanoid")
local larry4321 =larry4320["DisplayName"]
local larry4322 =larry25["DisplayName"]
local larry4324 =_4315_2["Name"]
local larry4325 =larry25["Name"]
local larry4327 =larry4320["GetAttribute"]
local larry4328 =larry4327(larry4320, "UserId")
local larry4329 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4331 =larry14["GetChildren"]
local larry4332 =larry4331(larry14)
local larry4334 =_4333_2["IsA"]
local larry4335 =larry4334(_4333_2, "Model")
local larry4337 =_4333_2["FindFirstChildWhichIsA"]
local larry4338 =larry4337(_4333_2, "Humanoid")
local larry4339 =larry4338["DisplayName"]
local larry4340 =larry25["DisplayName"]
local larry4342 =_4333_2["Name"]
local larry4343 =larry25["Name"]
local larry4345 =larry4338["GetAttribute"]
local larry4346 =larry4345(larry4338, "UserId")
local larry4347 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4349 =larry14["GetChildren"]
local larry4350 =larry4349(larry14)
local larry4352 =_4351_2["IsA"]
local larry4353 =larry4352(_4351_2, "Model")
local larry4355 =_4351_2["FindFirstChildWhichIsA"]
local larry4356 =larry4355(_4351_2, "Humanoid")
local larry4357 =larry4356["DisplayName"]
local larry4358 =larry25["DisplayName"]
local larry4360 =_4351_2["Name"]
local larry4361 =larry25["Name"]
local larry4363 =larry4356["GetAttribute"]
local larry4364 =larry4363(larry4356, "UserId")
local larry4365 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4367 =larry14["GetChildren"]
local larry4368 =larry4367(larry14)
local larry4370 =_4369_2["IsA"]
local larry4371 =larry4370(_4369_2, "Model")
local larry4373 =_4369_2["FindFirstChildWhichIsA"]
local larry4374 =larry4373(_4369_2, "Humanoid")
local larry4375 =larry4374["DisplayName"]
local larry4376 =larry25["DisplayName"]
local larry4378 =_4369_2["Name"]
local larry4379 =larry25["Name"]
local larry4381 =larry4374["GetAttribute"]
local larry4382 =larry4381(larry4374, "UserId")
local larry4383 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4385 =larry14["GetChildren"]
local larry4386 =larry4385(larry14)
local larry4388 =_4387_2["IsA"]
local larry4389 =larry4388(_4387_2, "Model")
local larry4391 =_4387_2["FindFirstChildWhichIsA"]
local larry4392 =larry4391(_4387_2, "Humanoid")
local larry4393 =larry4392["DisplayName"]
local larry4394 =larry25["DisplayName"]
local larry4396 =_4387_2["Name"]
local larry4397 =larry25["Name"]
local larry4399 =larry4392["GetAttribute"]
local larry4400 =larry4399(larry4392, "UserId")
local larry4401 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4403 =larry14["GetChildren"]
local larry4404 =larry4403(larry14)
local larry4406 =_4405_2["IsA"]
local larry4407 =larry4406(_4405_2, "Model")
local larry4409 =_4405_2["FindFirstChildWhichIsA"]
local larry4410 =larry4409(_4405_2, "Humanoid")
local larry4411 =larry4410["DisplayName"]
local larry4412 =larry25["DisplayName"]
local larry4414 =_4405_2["Name"]
local larry4415 =larry25["Name"]
local larry4417 =larry4410["GetAttribute"]
local larry4418 =larry4417(larry4410, "UserId")
local larry4419 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4421 =larry14["GetChildren"]
local larry4422 =larry4421(larry14)
local larry4424 =_4423_2["IsA"]
local larry4425 =larry4424(_4423_2, "Model")
local larry4427 =_4423_2["FindFirstChildWhichIsA"]
local larry4428 =larry4427(_4423_2, "Humanoid")
local larry4429 =larry4428["DisplayName"]
local larry4430 =larry25["DisplayName"]
local larry4432 =_4423_2["Name"]
local larry4433 =larry25["Name"]
local larry4435 =larry4428["GetAttribute"]
local larry4436 =larry4435(larry4428, "UserId")
local larry4437 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4439 =larry14["GetChildren"]
local larry4440 =larry4439(larry14)
local larry4442 =_4441_2["IsA"]
local larry4443 =larry4442(_4441_2, "Model")
local larry4445 =_4441_2["FindFirstChildWhichIsA"]
local larry4446 =larry4445(_4441_2, "Humanoid")
local larry4447 =larry4446["DisplayName"]
local larry4448 =larry25["DisplayName"]
local larry4450 =_4441_2["Name"]
local larry4451 =larry25["Name"]
local larry4453 =larry4446["GetAttribute"]
local larry4454 =larry4453(larry4446, "UserId")
local larry4455 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4457 =larry14["GetChildren"]
local larry4458 =larry4457(larry14)
local larry4460 =_4459_2["IsA"]
local larry4461 =larry4460(_4459_2, "Model")
local larry4463 =_4459_2["FindFirstChildWhichIsA"]
local larry4464 =larry4463(_4459_2, "Humanoid")
local larry4465 =larry4464["DisplayName"]
local larry4466 =larry25["DisplayName"]
local larry4468 =_4459_2["Name"]
local larry4469 =larry25["Name"]
local larry4471 =larry4464["GetAttribute"]
local larry4472 =larry4471(larry4464, "UserId")
local larry4473 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4475 =larry14["GetChildren"]
local larry4476 =larry4475(larry14)
local larry4478 =_4477_2["IsA"]
local larry4479 =larry4478(_4477_2, "Model")
local larry4481 =_4477_2["FindFirstChildWhichIsA"]
local larry4482 =larry4481(_4477_2, "Humanoid")
local larry4483 =larry4482["DisplayName"]
local larry4484 =larry25["DisplayName"]
local larry4486 =_4477_2["Name"]
local larry4487 =larry25["Name"]
local larry4489 =larry4482["GetAttribute"]
local larry4490 =larry4489(larry4482, "UserId")
local larry4491 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4493 =larry14["GetChildren"]
local larry4494 =larry4493(larry14)
local larry4496 =_4495_2["IsA"]
local larry4497 =larry4496(_4495_2, "Model")
local larry4499 =_4495_2["FindFirstChildWhichIsA"]
local larry4500 =larry4499(_4495_2, "Humanoid")
local larry4501 =larry4500["DisplayName"]
local larry4502 =larry25["DisplayName"]
local larry4504 =_4495_2["Name"]
local larry4505 =larry25["Name"]
local larry4507 =larry4500["GetAttribute"]
local larry4508 =larry4507(larry4500, "UserId")
local larry4509 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4511 =larry14["GetChildren"]
local larry4512 =larry4511(larry14)
local larry4514 =_4513_2["IsA"]
local larry4515 =larry4514(_4513_2, "Model")
local larry4517 =_4513_2["FindFirstChildWhichIsA"]
local larry4518 =larry4517(_4513_2, "Humanoid")
local larry4519 =larry4518["DisplayName"]
local larry4520 =larry25["DisplayName"]
local larry4522 =_4513_2["Name"]
local larry4523 =larry25["Name"]
local larry4525 =larry4518["GetAttribute"]
local larry4526 =larry4525(larry4518, "UserId")
local larry4527 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4529 =larry14["GetChildren"]
local larry4530 =larry4529(larry14)
local larry4532 =_4531_2["IsA"]
local larry4533 =larry4532(_4531_2, "Model")
local larry4535 =_4531_2["FindFirstChildWhichIsA"]
local larry4536 =larry4535(_4531_2, "Humanoid")
local larry4537 =larry4536["DisplayName"]
local larry4538 =larry25["DisplayName"]
local larry4540 =_4531_2["Name"]
local larry4541 =larry25["Name"]
local larry4543 =larry4536["GetAttribute"]
local larry4544 =larry4543(larry4536, "UserId")
local larry4545 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4547 =larry14["GetChildren"]
local larry4548 =larry4547(larry14)
local larry4550 =_4549_2["IsA"]
local larry4551 =larry4550(_4549_2, "Model")
local larry4553 =_4549_2["FindFirstChildWhichIsA"]
local larry4554 =larry4553(_4549_2, "Humanoid")
local larry4555 =larry4554["DisplayName"]
local larry4556 =larry25["DisplayName"]
local larry4558 =_4549_2["Name"]
local larry4559 =larry25["Name"]
local larry4561 =larry4554["GetAttribute"]
local larry4562 =larry4561(larry4554, "UserId")
local larry4563 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4565 =larry14["GetChildren"]
local larry4566 =larry4565(larry14)
local larry4568 =_4567_2["IsA"]
local larry4569 =larry4568(_4567_2, "Model")
local larry4571 =_4567_2["FindFirstChildWhichIsA"]
local larry4572 =larry4571(_4567_2, "Humanoid")
local larry4573 =larry4572["DisplayName"]
local larry4574 =larry25["DisplayName"]
local larry4576 =_4567_2["Name"]
local larry4577 =larry25["Name"]
local larry4579 =larry4572["GetAttribute"]
local larry4580 =larry4579(larry4572, "UserId")
local larry4581 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4583 =larry14["GetChildren"]
local larry4584 =larry4583(larry14)
local larry4586 =_4585_2["IsA"]
local larry4587 =larry4586(_4585_2, "Model")
local larry4589 =_4585_2["FindFirstChildWhichIsA"]
local larry4590 =larry4589(_4585_2, "Humanoid")
local larry4591 =larry4590["DisplayName"]
local larry4592 =larry25["DisplayName"]
local larry4594 =_4585_2["Name"]
local larry4595 =larry25["Name"]
local larry4597 =larry4590["GetAttribute"]
local larry4598 =larry4597(larry4590, "UserId")
local larry4599 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4601 =larry14["GetChildren"]
local larry4602 =larry4601(larry14)
local larry4604 =_4603_2["IsA"]
local larry4605 =larry4604(_4603_2, "Model")
local larry4607 =_4603_2["FindFirstChildWhichIsA"]
local larry4608 =larry4607(_4603_2, "Humanoid")
local larry4609 =larry4608["DisplayName"]
local larry4610 =larry25["DisplayName"]
local larry4612 =_4603_2["Name"]
local larry4613 =larry25["Name"]
local larry4615 =larry4608["GetAttribute"]
local larry4616 =larry4615(larry4608, "UserId")
local larry4617 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4619 =larry14["GetChildren"]
local larry4620 =larry4619(larry14)
local larry4622 =_4621_2["IsA"]
local larry4623 =larry4622(_4621_2, "Model")
local larry4625 =_4621_2["FindFirstChildWhichIsA"]
local larry4626 =larry4625(_4621_2, "Humanoid")
local larry4627 =larry4626["DisplayName"]
local larry4628 =larry25["DisplayName"]
local larry4630 =_4621_2["Name"]
local larry4631 =larry25["Name"]
local larry4633 =larry4626["GetAttribute"]
local larry4634 =larry4633(larry4626, "UserId")
local larry4635 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4637 =larry14["GetChildren"]
local larry4638 =larry4637(larry14)
local larry4640 =_4639_2["IsA"]
local larry4641 =larry4640(_4639_2, "Model")
local larry4643 =_4639_2["FindFirstChildWhichIsA"]
local larry4644 =larry4643(_4639_2, "Humanoid")
local larry4645 =larry4644["DisplayName"]
local larry4646 =larry25["DisplayName"]
local larry4648 =_4639_2["Name"]
local larry4649 =larry25["Name"]
local larry4651 =larry4644["GetAttribute"]
local larry4652 =larry4651(larry4644, "UserId")
local larry4653 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4655 =larry14["GetChildren"]
local larry4656 =larry4655(larry14)
local larry4658 =_4657_2["IsA"]
local larry4659 =larry4658(_4657_2, "Model")
local larry4661 =_4657_2["FindFirstChildWhichIsA"]
local larry4662 =larry4661(_4657_2, "Humanoid")
local larry4663 =larry4662["DisplayName"]
local larry4664 =larry25["DisplayName"]
local larry4666 =_4657_2["Name"]
local larry4667 =larry25["Name"]
local larry4669 =larry4662["GetAttribute"]
local larry4670 =larry4669(larry4662, "UserId")
local larry4671 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4673 =larry14["GetChildren"]
local larry4674 =larry4673(larry14)
local larry4676 =_4675_2["IsA"]
local larry4677 =larry4676(_4675_2, "Model")
local larry4679 =_4675_2["FindFirstChildWhichIsA"]
local larry4680 =larry4679(_4675_2, "Humanoid")
local larry4681 =larry4680["DisplayName"]
local larry4682 =larry25["DisplayName"]
local larry4684 =_4675_2["Name"]
local larry4685 =larry25["Name"]
local larry4687 =larry4680["GetAttribute"]
local larry4688 =larry4687(larry4680, "UserId")
local larry4689 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4691 =larry14["GetChildren"]
local larry4692 =larry4691(larry14)
local larry4694 =_4693_2["IsA"]
local larry4695 =larry4694(_4693_2, "Model")
local larry4697 =_4693_2["FindFirstChildWhichIsA"]
local larry4698 =larry4697(_4693_2, "Humanoid")
local larry4699 =larry4698["DisplayName"]
local larry4700 =larry25["DisplayName"]
local larry4702 =_4693_2["Name"]
local larry4703 =larry25["Name"]
local larry4705 =larry4698["GetAttribute"]
local larry4706 =larry4705(larry4698, "UserId")
local larry4707 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4709 =larry14["GetChildren"]
local larry4710 =larry4709(larry14)
local larry4712 =_4711_2["IsA"]
local larry4713 =larry4712(_4711_2, "Model")
local larry4715 =_4711_2["FindFirstChildWhichIsA"]
local larry4716 =larry4715(_4711_2, "Humanoid")
local larry4717 =larry4716["DisplayName"]
local larry4718 =larry25["DisplayName"]
local larry4720 =_4711_2["Name"]
local larry4721 =larry25["Name"]
local larry4723 =larry4716["GetAttribute"]
local larry4724 =larry4723(larry4716, "UserId")
local larry4725 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4727 =larry14["GetChildren"]
local larry4728 =larry4727(larry14)
local larry4730 =_4729_2["IsA"]
local larry4731 =larry4730(_4729_2, "Model")
local larry4733 =_4729_2["FindFirstChildWhichIsA"]
local larry4734 =larry4733(_4729_2, "Humanoid")
local larry4735 =larry4734["DisplayName"]
local larry4736 =larry25["DisplayName"]
local larry4738 =_4729_2["Name"]
local larry4739 =larry25["Name"]
local larry4741 =larry4734["GetAttribute"]
local larry4742 =larry4741(larry4734, "UserId")
local larry4743 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4745 =larry14["GetChildren"]
local larry4746 =larry4745(larry14)
local larry4748 =_4747_2["IsA"]
local larry4749 =larry4748(_4747_2, "Model")
local larry4751 =_4747_2["FindFirstChildWhichIsA"]
local larry4752 =larry4751(_4747_2, "Humanoid")
local larry4753 =larry4752["DisplayName"]
local larry4754 =larry25["DisplayName"]
local larry4756 =_4747_2["Name"]
local larry4757 =larry25["Name"]
local larry4759 =larry4752["GetAttribute"]
local larry4760 =larry4759(larry4752, "UserId")
local larry4761 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4763 =larry14["GetChildren"]
local larry4764 =larry4763(larry14)
local larry4766 =_4765_2["IsA"]
local larry4767 =larry4766(_4765_2, "Model")
local larry4769 =_4765_2["FindFirstChildWhichIsA"]
local larry4770 =larry4769(_4765_2, "Humanoid")
local larry4771 =larry4770["DisplayName"]
local larry4772 =larry25["DisplayName"]
local larry4774 =_4765_2["Name"]
local larry4775 =larry25["Name"]
local larry4777 =larry4770["GetAttribute"]
local larry4778 =larry4777(larry4770, "UserId")
local larry4779 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4781 =larry14["GetChildren"]
local larry4782 =larry4781(larry14)
local larry4784 =_4783_2["IsA"]
local larry4785 =larry4784(_4783_2, "Model")
local larry4787 =_4783_2["FindFirstChildWhichIsA"]
local larry4788 =larry4787(_4783_2, "Humanoid")
local larry4789 =larry4788["DisplayName"]
local larry4790 =larry25["DisplayName"]
local larry4792 =_4783_2["Name"]
local larry4793 =larry25["Name"]
local larry4795 =larry4788["GetAttribute"]
local larry4796 =larry4795(larry4788, "UserId")
local larry4797 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4799 =larry14["GetChildren"]
local larry4800 =larry4799(larry14)
local larry4802 =_4801_2["IsA"]
local larry4803 =larry4802(_4801_2, "Model")
local larry4805 =_4801_2["FindFirstChildWhichIsA"]
local larry4806 =larry4805(_4801_2, "Humanoid")
local larry4807 =larry4806["DisplayName"]
local larry4808 =larry25["DisplayName"]
local larry4810 =_4801_2["Name"]
local larry4811 =larry25["Name"]
local larry4813 =larry4806["GetAttribute"]
local larry4814 =larry4813(larry4806, "UserId")
local larry4815 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4817 =larry14["GetChildren"]
local larry4818 =larry4817(larry14)
local larry4820 =_4819_2["IsA"]
local larry4821 =larry4820(_4819_2, "Model")
local larry4823 =_4819_2["FindFirstChildWhichIsA"]
local larry4824 =larry4823(_4819_2, "Humanoid")
local larry4825 =larry4824["DisplayName"]
local larry4826 =larry25["DisplayName"]
local larry4828 =_4819_2["Name"]
local larry4829 =larry25["Name"]
local larry4831 =larry4824["GetAttribute"]
local larry4832 =larry4831(larry4824, "UserId")
local larry4833 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4835 =larry14["GetChildren"]
local larry4836 =larry4835(larry14)
local larry4838 =_4837_2["IsA"]
local larry4839 =larry4838(_4837_2, "Model")
local larry4841 =_4837_2["FindFirstChildWhichIsA"]
local larry4842 =larry4841(_4837_2, "Humanoid")
local larry4843 =larry4842["DisplayName"]
local larry4844 =larry25["DisplayName"]
local larry4846 =_4837_2["Name"]
local larry4847 =larry25["Name"]
local larry4849 =larry4842["GetAttribute"]
local larry4850 =larry4849(larry4842, "UserId")
local larry4851 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4853 =larry14["GetChildren"]
local larry4854 =larry4853(larry14)
local larry4856 =_4855_2["IsA"]
local larry4857 =larry4856(_4855_2, "Model")
local larry4859 =_4855_2["FindFirstChildWhichIsA"]
local larry4860 =larry4859(_4855_2, "Humanoid")
local larry4861 =larry4860["DisplayName"]
local larry4862 =larry25["DisplayName"]
local larry4864 =_4855_2["Name"]
local larry4865 =larry25["Name"]
local larry4867 =larry4860["GetAttribute"]
local larry4868 =larry4867(larry4860, "UserId")
local larry4869 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4871 =larry14["GetChildren"]
local larry4872 =larry4871(larry14)
local larry4874 =_4873_2["IsA"]
local larry4875 =larry4874(_4873_2, "Model")
local larry4877 =_4873_2["FindFirstChildWhichIsA"]
local larry4878 =larry4877(_4873_2, "Humanoid")
local larry4879 =larry4878["DisplayName"]
local larry4880 =larry25["DisplayName"]
local larry4882 =_4873_2["Name"]
local larry4883 =larry25["Name"]
local larry4885 =larry4878["GetAttribute"]
local larry4886 =larry4885(larry4878, "UserId")
local larry4887 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4889 =larry14["GetChildren"]
local larry4890 =larry4889(larry14)
local larry4892 =_4891_2["IsA"]
local larry4893 =larry4892(_4891_2, "Model")
local larry4895 =_4891_2["FindFirstChildWhichIsA"]
local larry4896 =larry4895(_4891_2, "Humanoid")
local larry4897 =larry4896["DisplayName"]
local larry4898 =larry25["DisplayName"]
local larry4900 =_4891_2["Name"]
local larry4901 =larry25["Name"]
local larry4903 =larry4896["GetAttribute"]
local larry4904 =larry4903(larry4896, "UserId")
local larry4905 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4907 =larry14["GetChildren"]
local larry4908 =larry4907(larry14)
local larry4910 =_4909_2["IsA"]
local larry4911 =larry4910(_4909_2, "Model")
local larry4913 =_4909_2["FindFirstChildWhichIsA"]
local larry4914 =larry4913(_4909_2, "Humanoid")
local larry4915 =larry4914["DisplayName"]
local larry4916 =larry25["DisplayName"]
local larry4918 =_4909_2["Name"]
local larry4919 =larry25["Name"]
local larry4921 =larry4914["GetAttribute"]
local larry4922 =larry4921(larry4914, "UserId")
local larry4923 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4925 =larry14["GetChildren"]
local larry4926 =larry4925(larry14)
local larry4928 =_4927_2["IsA"]
local larry4929 =larry4928(_4927_2, "Model")
local larry4931 =_4927_2["FindFirstChildWhichIsA"]
local larry4932 =larry4931(_4927_2, "Humanoid")
local larry4933 =larry4932["DisplayName"]
local larry4934 =larry25["DisplayName"]
local larry4936 =_4927_2["Name"]
local larry4937 =larry25["Name"]
local larry4939 =larry4932["GetAttribute"]
local larry4940 =larry4939(larry4932, "UserId")
local larry4941 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4943 =larry14["GetChildren"]
local larry4944 =larry4943(larry14)
local larry4946 =_4945_2["IsA"]
local larry4947 =larry4946(_4945_2, "Model")
local larry4949 =_4945_2["FindFirstChildWhichIsA"]
local larry4950 =larry4949(_4945_2, "Humanoid")
local larry4951 =larry4950["DisplayName"]
local larry4952 =larry25["DisplayName"]
local larry4954 =_4945_2["Name"]
local larry4955 =larry25["Name"]
local larry4957 =larry4950["GetAttribute"]
local larry4958 =larry4957(larry4950, "UserId")
local larry4959 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4961 =larry14["GetChildren"]
local larry4962 =larry4961(larry14)
local larry4964 =_4963_2["IsA"]
local larry4965 =larry4964(_4963_2, "Model")
local larry4967 =_4963_2["FindFirstChildWhichIsA"]
local larry4968 =larry4967(_4963_2, "Humanoid")
local larry4969 =larry4968["DisplayName"]
local larry4970 =larry25["DisplayName"]
local larry4972 =_4963_2["Name"]
local larry4973 =larry25["Name"]
local larry4975 =larry4968["GetAttribute"]
local larry4976 =larry4975(larry4968, "UserId")
local larry4977 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4979 =larry14["GetChildren"]
local larry4980 =larry4979(larry14)
local larry4982 =_4981_2["IsA"]
local larry4983 =larry4982(_4981_2, "Model")
local larry4985 =_4981_2["FindFirstChildWhichIsA"]
local larry4986 =larry4985(_4981_2, "Humanoid")
local larry4987 =larry4986["DisplayName"]
local larry4988 =larry25["DisplayName"]
local larry4990 =_4981_2["Name"]
local larry4991 =larry25["Name"]
local larry4993 =larry4986["GetAttribute"]
local larry4994 =larry4993(larry4986, "UserId")
local larry4995 =larry25["UserId"]
local _ =task.wait(0.05)
local larry4997 =larry14["GetChildren"]
local larry4998 =larry4997(larry14)
local larry5000 =_4999_2["IsA"]
local larry5001 =larry5000(_4999_2, "Model")
local larry5003 =_4999_2["FindFirstChildWhichIsA"]
local larry5004 =larry5003(_4999_2, "Humanoid")
local larry5005 =larry5004["DisplayName"]
local larry5006 =larry25["DisplayName"]
local larry5008 =_4999_2["Name"]
local larry5009 =larry25["Name"]
local larry5011 =larry5004["GetAttribute"]
local larry5012 =larry5011(larry5004, "UserId")
local larry5013 =larry25["UserId"]
local _ =task.wait(0.05)
local larry5015 =larry14["GetChildren"]
local larry5016 =larry5015(larry14)
local larry5018 =_5017_2["IsA"]
local larry5019 =larry5018(_5017_2, "Model")
local er =error("Luraph Script:2780: Luraph Script:2736: internal 542: <larry: infinitelooperror>")
local larry4284 =larry4283(function(...)
local _4285_vararg1, _4285_vararg2, _4285_vararg3, _4285_vararg4, _4285_vararg5, _4285_vararg6, _4285_vararg7, _4285_vararg8, _4285_vararg9, _4285_vararg10 = ...
local larry4286 =larry25["Character"]
local larry4287 =larry25["WaitForChild"]
local larry4288 =larry4287(larry25, "Backpack")
local larry4289 =larry4286["FindFirstChildWhichIsA"]
local larry4290 =larry4289(larry4286, "Humanoid")
local larry4291 =larry4290["UnequipTools"]
local larry4292 =larry4291(larry4290)
local larry4293 =larry4286["GetChildren"]
local larry4294 =larry4293(larry4286)
for larry4295, _4295_2 in ipairs(larry4294) do
local larry4296 =_4295_2["IsA"]
local larry4297 =larry4296(_4295_2, "Accessory")
local larry4298 =_4295_2["Destroy"]
local larry4299 =larry4298(_4295_2)
end
local larry4300 =larry4288["FindFirstChild"]
local larry4301 =larry4300(larry4288, "Quantum Cloner")
larry4301["Parent"] =larry4286
local _ =task.wait()
local larry4302 =larry4301["Activate"]
local larry4303 =larry4302(larry4301)
local larry4304 =larry4288["GetChildren"]
local larry4305 =larry4304(larry4288)
for larry4306, _4306_2 in ipairs(larry4305) do
local larry4307 =_4306_2["IsA"]
local larry4308 =larry4307(_4306_2, "Tool")
local larry4309 =_4306_2["Name"]
local larry4310, _4310_2, _4310_3 =string.lower(larry4309)
local larry4311 =larry4310["find"]
local larry4312 =larry4311(larry4310, "slap")
_4306_2["Parent"] =larry4286
end
local _ =task.wait(0.5)
local larry4313 =larry14["GetChildren"]
local larry4314 =larry4313(larry14)
for larry4315, _4315_2 in ipairs(larry4314) do
local larry4316 =_4315_2["IsA"]
local larry4317 =larry4316(_4315_2, "Model")
local larry4318 =(_4315_2==larry4286)
local larry4319 =_4315_2["FindFirstChildWhichIsA"]
local larry4320 =larry4319(_4315_2, "Humanoid")
local larry4321 =larry4320["DisplayName"]
local larry4322 =larry25["DisplayName"]
local larry4323 =(larry4321==larry4322)
local larry4324 =_4315_2["Name"]
local larry4325 =larry25["Name"]
local larry4326 =(larry4324==larry4325)
local larry4327 =larry4320["GetAttribute"]
local larry4328 =larry4327(larry4320, "UserId")
local larry4329 =larry25["UserId"]
local larry4330 =(larry4328==larry4329)
end
local _ =task.wait(0.05)
local larry4331 =larry14["GetChildren"]
local larry4332 =larry4331(larry14)
for larry4333, _4333_2 in ipairs(larry4332) do
local larry4334 =_4333_2["IsA"]
local larry4335 =larry4334(_4333_2, "Model")
local larry4336 =(_4333_2==larry4286)
local larry4337 =_4333_2["FindFirstChildWhichIsA"]
local larry4338 =larry4337(_4333_2, "Humanoid")
local larry4339 =larry4338["DisplayName"]
local larry4340 =larry25["DisplayName"]
local larry4341 =(larry4339==larry4340)
local larry4342 =_4333_2["Name"]
local larry4343 =larry25["Name"]
local larry4344 =(larry4342==larry4343)
local larry4345 =larry4338["GetAttribute"]
local larry4346 =larry4345(larry4338, "UserId")
local larry4347 =larry25["UserId"]
local larry4348 =(larry4346==larry4347)
end
local _ =task.wait(0.05)
local larry4349 =larry14["GetChildren"]
local larry4350 =larry4349(larry14)
for larry4351, _4351_2 in ipairs(larry4350) do
local larry4352 =_4351_2["IsA"]
local larry4353 =larry4352(_4351_2, "Model")
local larry4354 =(_4351_2==larry4286)
local larry4355 =_4351_2["FindFirstChildWhichIsA"]
local larry4356 =larry4355(_4351_2, "Humanoid")
local larry4357 =larry4356["DisplayName"]
local larry4358 =larry25["DisplayName"]
local larry4359 =(larry4357==larry4358)
local larry4360 =_4351_2["Name"]
local larry4361 =larry25["Name"]
local larry4362 =(larry4360==larry4361)
local larry4363 =larry4356["GetAttribute"]
local larry4364 =larry4363(larry4356, "UserId")
local larry4365 =larry25["UserId"]
local larry4366 =(larry4364==larry4365)
end
local _ =task.wait(0.05)
local larry4367 =larry14["GetChildren"]
local larry4368 =larry4367(larry14)
for larry4369, _4369_2 in ipairs(larry4368) do
local larry4370 =_4369_2["IsA"]
local larry4371 =larry4370(_4369_2, "Model")
local larry4372 =(_4369_2==larry4286)
local larry4373 =_4369_2["FindFirstChildWhichIsA"]
local larry4374 =larry4373(_4369_2, "Humanoid")
local larry4375 =larry4374["DisplayName"]
local larry4376 =larry25["DisplayName"]
local larry4377 =(larry4375==larry4376)
local larry4378 =_4369_2["Name"]
local larry4379 =larry25["Name"]
local larry4380 =(larry4378==larry4379)
local larry4381 =larry4374["GetAttribute"]
local larry4382 =larry4381(larry4374, "UserId")
local larry4383 =larry25["UserId"]
local larry4384 =(larry4382==larry4383)
end
local _ =task.wait(0.05)
local larry4385 =larry14["GetChildren"]
local larry4386 =larry4385(larry14)
for larry4387, _4387_2 in ipairs(larry4386) do
local larry4388 =_4387_2["IsA"]
local larry4389 =larry4388(_4387_2, "Model")
local larry4390 =(_4387_2==larry4286)
local larry4391 =_4387_2["FindFirstChildWhichIsA"]
local larry4392 =larry4391(_4387_2, "Humanoid")
local larry4393 =larry4392["DisplayName"]
local larry4394 =larry25["DisplayName"]
local larry4395 =(larry4393==larry4394)
local larry4396 =_4387_2["Name"]
local larry4397 =larry25["Name"]
local larry4398 =(larry4396==larry4397)
local larry4399 =larry4392["GetAttribute"]
local larry4400 =larry4399(larry4392, "UserId")
local larry4401 =larry25["UserId"]
local larry4402 =(larry4400==larry4401)
end
local _ =task.wait(0.05)
local larry4403 =larry14["GetChildren"]
local larry4404 =larry4403(larry14)
for larry4405, _4405_2 in ipairs(larry4404) do
local larry4406 =_4405_2["IsA"]
local larry4407 =larry4406(_4405_2, "Model")
local larry4408 =(_4405_2==larry4286)
local larry4409 =_4405_2["FindFirstChildWhichIsA"]
local larry4410 =larry4409(_4405_2, "Humanoid")
local larry4411 =larry4410["DisplayName"]
local larry4412 =larry25["DisplayName"]
local larry4413 =(larry4411==larry4412)
local larry4414 =_4405_2["Name"]
local larry4415 =larry25["Name"]
local larry4416 =(larry4414==larry4415)
local larry4417 =larry4410["GetAttribute"]
local larry4418 =larry4417(larry4410, "UserId")
local larry4419 =larry25["UserId"]
local larry4420 =(larry4418==larry4419)
end
local _ =task.wait(0.05)
local larry4421 =larry14["GetChildren"]
local larry4422 =larry4421(larry14)
for larry4423, _4423_2 in ipairs(larry4422) do
local larry4424 =_4423_2["IsA"]
local larry4425 =larry4424(_4423_2, "Model")
local larry4426 =(_4423_2==larry4286)
local larry4427 =_4423_2["FindFirstChildWhichIsA"]
local larry4428 =larry4427(_4423_2, "Humanoid")
local larry4429 =larry4428["DisplayName"]
local larry4430 =larry25["DisplayName"]
local larry4431 =(larry4429==larry4430)
local larry4432 =_4423_2["Name"]
local larry4433 =larry25["Name"]
local larry4434 =(larry4432==larry4433)
local larry4435 =larry4428["GetAttribute"]
local larry4436 =larry4435(larry4428, "UserId")
local larry4437 =larry25["UserId"]
local larry4438 =(larry4436==larry4437)
end
local _ =task.wait(0.05)
local larry4439 =larry14["GetChildren"]
local larry4440 =larry4439(larry14)
for larry4441, _4441_2 in ipairs(larry4440) do
local larry4442 =_4441_2["IsA"]
local larry4443 =larry4442(_4441_2, "Model")
local larry4444 =(_4441_2==larry4286)
local larry4445 =_4441_2["FindFirstChildWhichIsA"]
local larry4446 =larry4445(_4441_2, "Humanoid")
local larry4447 =larry4446["DisplayName"]
local larry4448 =larry25["DisplayName"]
local larry4449 =(larry4447==larry4448)
local larry4450 =_4441_2["Name"]
local larry4451 =larry25["Name"]
local larry4452 =(larry4450==larry4451)
local larry4453 =larry4446["GetAttribute"]
local larry4454 =larry4453(larry4446, "UserId")
local larry4455 =larry25["UserId"]
local larry4456 =(larry4454==larry4455)
end
local _ =task.wait(0.05)
local larry4457 =larry14["GetChildren"]
local larry4458 =larry4457(larry14)
for larry4459, _4459_2 in ipairs(larry4458) do
local larry4460 =_4459_2["IsA"]
local larry4461 =larry4460(_4459_2, "Model")
local larry4462 =(_4459_2==larry4286)
local larry4463 =_4459_2["FindFirstChildWhichIsA"]
local larry4464 =larry4463(_4459_2, "Humanoid")
local larry4465 =larry4464["DisplayName"]
local larry4466 =larry25["DisplayName"]
local larry4467 =(larry4465==larry4466)
local larry4468 =_4459_2["Name"]
local larry4469 =larry25["Name"]
local larry4470 =(larry4468==larry4469)
local larry4471 =larry4464["GetAttribute"]
local larry4472 =larry4471(larry4464, "UserId")
local larry4473 =larry25["UserId"]
local larry4474 =(larry4472==larry4473)
end
local _ =task.wait(0.05)
local larry4475 =larry14["GetChildren"]
local larry4476 =larry4475(larry14)
for larry4477, _4477_2 in ipairs(larry4476) do
local larry4478 =_4477_2["IsA"]
local larry4479 =larry4478(_4477_2, "Model")
local larry4480 =(_4477_2==larry4286)
local larry4481 =_4477_2["FindFirstChildWhichIsA"]
local larry4482 =larry4481(_4477_2, "Humanoid")
local larry4483 =larry4482["DisplayName"]
local larry4484 =larry25["DisplayName"]
local larry4485 =(larry4483==larry4484)
local larry4486 =_4477_2["Name"]
local larry4487 =larry25["Name"]
local larry4488 =(larry4486==larry4487)
local larry4489 =larry4482["GetAttribute"]
local larry4490 =larry4489(larry4482, "UserId")
local larry4491 =larry25["UserId"]
local larry4492 =(larry4490==larry4491)
end
local _ =task.wait(0.05)
local larry4493 =larry14["GetChildren"]
local larry4494 =larry4493(larry14)
for larry4495, _4495_2 in ipairs(larry4494) do
local larry4496 =_4495_2["IsA"]
local larry4497 =larry4496(_4495_2, "Model")
local larry4498 =(_4495_2==larry4286)
local larry4499 =_4495_2["FindFirstChildWhichIsA"]
local larry4500 =larry4499(_4495_2, "Humanoid")
local larry4501 =larry4500["DisplayName"]
local larry4502 =larry25["DisplayName"]
local larry4503 =(larry4501==larry4502)
local larry4504 =_4495_2["Name"]
local larry4505 =larry25["Name"]
local larry4506 =(larry4504==larry4505)
local larry4507 =larry4500["GetAttribute"]
local larry4508 =larry4507(larry4500, "UserId")
local larry4509 =larry25["UserId"]
local larry4510 =(larry4508==larry4509)
end
local _ =task.wait(0.05)
local larry4511 =larry14["GetChildren"]
local larry4512 =larry4511(larry14)
for larry4513, _4513_2 in ipairs(larry4512) do
local larry4514 =_4513_2["IsA"]
local larry4515 =larry4514(_4513_2, "Model")
local larry4516 =(_4513_2==larry4286)
local larry4517 =_4513_2["FindFirstChildWhichIsA"]
local larry4518 =larry4517(_4513_2, "Humanoid")
local larry4519 =larry4518["DisplayName"]
local larry4520 =larry25["DisplayName"]
local larry4521 =(larry4519==larry4520)
local larry4522 =_4513_2["Name"]
local larry4523 =larry25["Name"]
local larry4524 =(larry4522==larry4523)
local larry4525 =larry4518["GetAttribute"]
local larry4526 =larry4525(larry4518, "UserId")
local larry4527 =larry25["UserId"]
local larry4528 =(larry4526==larry4527)
end
local _ =task.wait(0.05)
local larry4529 =larry14["GetChildren"]
local larry4530 =larry4529(larry14)
for larry4531, _4531_2 in ipairs(larry4530) do
local larry4532 =_4531_2["IsA"]
local larry4533 =larry4532(_4531_2, "Model")
local larry4534 =(_4531_2==larry4286)
local larry4535 =_4531_2["FindFirstChildWhichIsA"]
local larry4536 =larry4535(_4531_2, "Humanoid")
local larry4537 =larry4536["DisplayName"]
local larry4538 =larry25["DisplayName"]
local larry4539 =(larry4537==larry4538)
local larry4540 =_4531_2["Name"]
local larry4541 =larry25["Name"]
local larry4542 =(larry4540==larry4541)
local larry4543 =larry4536["GetAttribute"]
local larry4544 =larry4543(larry4536, "UserId")
local larry4545 =larry25["UserId"]
local larry4546 =(larry4544==larry4545)
end
local _ =task.wait(0.05)
local larry4547 =larry14["GetChildren"]
local larry4548 =larry4547(larry14)
for larry4549, _4549_2 in ipairs(larry4548) do
local larry4550 =_4549_2["IsA"]
local larry4551 =larry4550(_4549_2, "Model")
local larry4552 =(_4549_2==larry4286)
local larry4553 =_4549_2["FindFirstChildWhichIsA"]
local larry4554 =larry4553(_4549_2, "Humanoid")
local larry4555 =larry4554["DisplayName"]
local larry4556 =larry25["DisplayName"]
local larry4557 =(larry4555==larry4556)
local larry4558 =_4549_2["Name"]
local larry4559 =larry25["Name"]
local larry4560 =(larry4558==larry4559)
local larry4561 =larry4554["GetAttribute"]
local larry4562 =larry4561(larry4554, "UserId")
local larry4563 =larry25["UserId"]
local larry4564 =(larry4562==larry4563)
end
local _ =task.wait(0.05)
local larry4565 =larry14["GetChildren"]
local larry4566 =larry4565(larry14)
for larry4567, _4567_2 in ipairs(larry4566) do
local larry4568 =_4567_2["IsA"]
local larry4569 =larry4568(_4567_2, "Model")
local larry4570 =(_4567_2==larry4286)
local larry4571 =_4567_2["FindFirstChildWhichIsA"]
local larry4572 =larry4571(_4567_2, "Humanoid")
local larry4573 =larry4572["DisplayName"]
local larry4574 =larry25["DisplayName"]
local larry4575 =(larry4573==larry4574)
local larry4576 =_4567_2["Name"]
local larry4577 =larry25["Name"]
local larry4578 =(larry4576==larry4577)
local larry4579 =larry4572["GetAttribute"]
local larry4580 =larry4579(larry4572, "UserId")
local larry4581 =larry25["UserId"]
local larry4582 =(larry4580==larry4581)
end
local _ =task.wait(0.05)
local larry4583 =larry14["GetChildren"]
local larry4584 =larry4583(larry14)
for larry4585, _4585_2 in ipairs(larry4584) do
local larry4586 =_4585_2["IsA"]
local larry4587 =larry4586(_4585_2, "Model")
local larry4588 =(_4585_2==larry4286)
local larry4589 =_4585_2["FindFirstChildWhichIsA"]
local larry4590 =larry4589(_4585_2, "Humanoid")
local larry4591 =larry4590["DisplayName"]
local larry4592 =larry25["DisplayName"]
local larry4593 =(larry4591==larry4592)
local larry4594 =_4585_2["Name"]
local larry4595 =larry25["Name"]
local larry4596 =(larry4594==larry4595)
local larry4597 =larry4590["GetAttribute"]
local larry4598 =larry4597(larry4590, "UserId")
local larry4599 =larry25["UserId"]
local larry4600 =(larry4598==larry4599)
end
local _ =task.wait(0.05)
local larry4601 =larry14["GetChildren"]
local larry4602 =larry4601(larry14)
for larry4603, _4603_2 in ipairs(larry4602) do
local larry4604 =_4603_2["IsA"]
local larry4605 =larry4604(_4603_2, "Model")
local larry4606 =(_4603_2==larry4286)
local larry4607 =_4603_2["FindFirstChildWhichIsA"]
local larry4608 =larry4607(_4603_2, "Humanoid")
local larry4609 =larry4608["DisplayName"]
local larry4610 =larry25["DisplayName"]
local larry4611 =(larry4609==larry4610)
local larry4612 =_4603_2["Name"]
local larry4613 =larry25["Name"]
local larry4614 =(larry4612==larry4613)
local larry4615 =larry4608["GetAttribute"]
local larry4616 =larry4615(larry4608, "UserId")
local larry4617 =larry25["UserId"]
local larry4618 =(larry4616==larry4617)
end
local _ =task.wait(0.05)
local larry4619 =larry14["GetChildren"]
local larry4620 =larry4619(larry14)
for larry4621, _4621_2 in ipairs(larry4620) do
local larry4622 =_4621_2["IsA"]
local larry4623 =larry4622(_4621_2, "Model")
local larry4624 =(_4621_2==larry4286)
local larry4625 =_4621_2["FindFirstChildWhichIsA"]
local larry4626 =larry4625(_4621_2, "Humanoid")
local larry4627 =larry4626["DisplayName"]
local larry4628 =larry25["DisplayName"]
local larry4629 =(larry4627==larry4628)
local larry4630 =_4621_2["Name"]
local larry4631 =larry25["Name"]
local larry4632 =(larry4630==larry4631)
local larry4633 =larry4626["GetAttribute"]
local larry4634 =larry4633(larry4626, "UserId")
local larry4635 =larry25["UserId"]
local larry4636 =(larry4634==larry4635)
end
local _ =task.wait(0.05)
local larry4637 =larry14["GetChildren"]
local larry4638 =larry4637(larry14)
for larry4639, _4639_2 in ipairs(larry4638) do
local larry4640 =_4639_2["IsA"]
local larry4641 =larry4640(_4639_2, "Model")
local larry4642 =(_4639_2==larry4286)
local larry4643 =_4639_2["FindFirstChildWhichIsA"]
local larry4644 =larry4643(_4639_2, "Humanoid")
local larry4645 =larry4644["DisplayName"]
local larry4646 =larry25["DisplayName"]
local larry4647 =(larry4645==larry4646)
local larry4648 =_4639_2["Name"]
local larry4649 =larry25["Name"]
local larry4650 =(larry4648==larry4649)
local larry4651 =larry4644["GetAttribute"]
local larry4652 =larry4651(larry4644, "UserId")
local larry4653 =larry25["UserId"]
local larry4654 =(larry4652==larry4653)
end
local _ =task.wait(0.05)
local larry4655 =larry14["GetChildren"]
local larry4656 =larry4655(larry14)
for larry4657, _4657_2 in ipairs(larry4656) do
local larry4658 =_4657_2["IsA"]
local larry4659 =larry4658(_4657_2, "Model")
local larry4660 =(_4657_2==larry4286)
local larry4661 =_4657_2["FindFirstChildWhichIsA"]
local larry4662 =larry4661(_4657_2, "Humanoid")
local larry4663 =larry4662["DisplayName"]
local larry4664 =larry25["DisplayName"]
local larry4665 =(larry4663==larry4664)
local larry4666 =_4657_2["Name"]
local larry4667 =larry25["Name"]
local larry4668 =(larry4666==larry4667)
local larry4669 =larry4662["GetAttribute"]
local larry4670 =larry4669(larry4662, "UserId")
local larry4671 =larry25["UserId"]
local larry4672 =(larry4670==larry4671)
end
local _ =task.wait(0.05)
local larry4673 =larry14["GetChildren"]
local larry4674 =larry4673(larry14)
for larry4675, _4675_2 in ipairs(larry4674) do
local larry4676 =_4675_2["IsA"]
local larry4677 =larry4676(_4675_2, "Model")
local larry4678 =(_4675_2==larry4286)
local larry4679 =_4675_2["FindFirstChildWhichIsA"]
local larry4680 =larry4679(_4675_2, "Humanoid")
local larry4681 =larry4680["DisplayName"]
local larry4682 =larry25["DisplayName"]
local larry4683 =(larry4681==larry4682)
local larry4684 =_4675_2["Name"]
local larry4685 =larry25["Name"]
local larry4686 =(larry4684==larry4685)
local larry4687 =larry4680["GetAttribute"]
local larry4688 =larry4687(larry4680, "UserId")
local larry4689 =larry25["UserId"]
local larry4690 =(larry4688==larry4689)
end
local _ =task.wait(0.05)
local larry4691 =larry14["GetChildren"]
local larry4692 =larry4691(larry14)
for larry4693, _4693_2 in ipairs(larry4692) do
local larry4694 =_4693_2["IsA"]
local larry4695 =larry4694(_4693_2, "Model")
local larry4696 =(_4693_2==larry4286)
local larry4697 =_4693_2["FindFirstChildWhichIsA"]
local larry4698 =larry4697(_4693_2, "Humanoid")
local larry4699 =larry4698["DisplayName"]
local larry4700 =larry25["DisplayName"]
local larry4701 =(larry4699==larry4700)
local larry4702 =_4693_2["Name"]
local larry4703 =larry25["Name"]
local larry4704 =(larry4702==larry4703)
local larry4705 =larry4698["GetAttribute"]
local larry4706 =larry4705(larry4698, "UserId")
local larry4707 =larry25["UserId"]
local larry4708 =(larry4706==larry4707)
end
local _ =task.wait(0.05)
local larry4709 =larry14["GetChildren"]
local larry4710 =larry4709(larry14)
for larry4711, _4711_2 in ipairs(larry4710) do
local larry4712 =_4711_2["IsA"]
local larry4713 =larry4712(_4711_2, "Model")
local larry4714 =(_4711_2==larry4286)
local larry4715 =_4711_2["FindFirstChildWhichIsA"]
local larry4716 =larry4715(_4711_2, "Humanoid")
local larry4717 =larry4716["DisplayName"]
local larry4718 =larry25["DisplayName"]
local larry4719 =(larry4717==larry4718)
local larry4720 =_4711_2["Name"]
local larry4721 =larry25["Name"]
local larry4722 =(larry4720==larry4721)
local larry4723 =larry4716["GetAttribute"]
local larry4724 =larry4723(larry4716, "UserId")
local larry4725 =larry25["UserId"]
local larry4726 =(larry4724==larry4725)
end
local _ =task.wait(0.05)
local larry4727 =larry14["GetChildren"]
local larry4728 =larry4727(larry14)
for larry4729, _4729_2 in ipairs(larry4728) do
local larry4730 =_4729_2["IsA"]
local larry4731 =larry4730(_4729_2, "Model")
local larry4732 =(_4729_2==larry4286)
local larry4733 =_4729_2["FindFirstChildWhichIsA"]
local larry4734 =larry4733(_4729_2, "Humanoid")
local larry4735 =larry4734["DisplayName"]
local larry4736 =larry25["DisplayName"]
local larry4737 =(larry4735==larry4736)
local larry4738 =_4729_2["Name"]
local larry4739 =larry25["Name"]
local larry4740 =(larry4738==larry4739)
local larry4741 =larry4734["GetAttribute"]
local larry4742 =larry4741(larry4734, "UserId")
local larry4743 =larry25["UserId"]
local larry4744 =(larry4742==larry4743)
end
local _ =task.wait(0.05)
local larry4745 =larry14["GetChildren"]
local larry4746 =larry4745(larry14)
for larry4747, _4747_2 in ipairs(larry4746) do
local larry4748 =_4747_2["IsA"]
local larry4749 =larry4748(_4747_2, "Model")
local larry4750 =(_4747_2==larry4286)
local larry4751 =_4747_2["FindFirstChildWhichIsA"]
local larry4752 =larry4751(_4747_2, "Humanoid")
local larry4753 =larry4752["DisplayName"]
local larry4754 =larry25["DisplayName"]
local larry4755 =(larry4753==larry4754)
local larry4756 =_4747_2["Name"]
local larry4757 =larry25["Name"]
local larry4758 =(larry4756==larry4757)
local larry4759 =larry4752["GetAttribute"]
local larry4760 =larry4759(larry4752, "UserId")
local larry4761 =larry25["UserId"]
local larry4762 =(larry4760==larry4761)
end
local _ =task.wait(0.05)
local larry4763 =larry14["GetChildren"]
local larry4764 =larry4763(larry14)
for larry4765, _4765_2 in ipairs(larry4764) do
local larry4766 =_4765_2["IsA"]
local larry4767 =larry4766(_4765_2, "Model")
local larry4768 =(_4765_2==larry4286)
local larry4769 =_4765_2["FindFirstChildWhichIsA"]
local larry4770 =larry4769(_4765_2, "Humanoid")
local larry4771 =larry4770["DisplayName"]
local larry4772 =larry25["DisplayName"]
local larry4773 =(larry4771==larry4772)
local larry4774 =_4765_2["Name"]
local larry4775 =larry25["Name"]
local larry4776 =(larry4774==larry4775)
local larry4777 =larry4770["GetAttribute"]
local larry4778 =larry4777(larry4770, "UserId")
local larry4779 =larry25["UserId"]
local larry4780 =(larry4778==larry4779)
end
local _ =task.wait(0.05)
local larry4781 =larry14["GetChildren"]
local larry4782 =larry4781(larry14)
for larry4783, _4783_2 in ipairs(larry4782) do
local larry4784 =_4783_2["IsA"]
local larry4785 =larry4784(_4783_2, "Model")
local larry4786 =(_4783_2==larry4286)
local larry4787 =_4783_2["FindFirstChildWhichIsA"]
local larry4788 =larry4787(_4783_2, "Humanoid")
local larry4789 =larry4788["DisplayName"]
local larry4790 =larry25["DisplayName"]
local larry4791 =(larry4789==larry4790)
local larry4792 =_4783_2["Name"]
local larry4793 =larry25["Name"]
local larry4794 =(larry4792==larry4793)
local larry4795 =larry4788["GetAttribute"]
local larry4796 =larry4795(larry4788, "UserId")
local larry4797 =larry25["UserId"]
local larry4798 =(larry4796==larry4797)
end
local _ =task.wait(0.05)
local larry4799 =larry14["GetChildren"]
local larry4800 =larry4799(larry14)
for larry4801, _4801_2 in ipairs(larry4800) do
local larry4802 =_4801_2["IsA"]
local larry4803 =larry4802(_4801_2, "Model")
local larry4804 =(_4801_2==larry4286)
local larry4805 =_4801_2["FindFirstChildWhichIsA"]
local larry4806 =larry4805(_4801_2, "Humanoid")
local larry4807 =larry4806["DisplayName"]
local larry4808 =larry25["DisplayName"]
local larry4809 =(larry4807==larry4808)
local larry4810 =_4801_2["Name"]
local larry4811 =larry25["Name"]
local larry4812 =(larry4810==larry4811)
local larry4813 =larry4806["GetAttribute"]
local larry4814 =larry4813(larry4806, "UserId")
local larry4815 =larry25["UserId"]
local larry4816 =(larry4814==larry4815)
end
local _ =task.wait(0.05)
local larry4817 =larry14["GetChildren"]
local larry4818 =larry4817(larry14)
for larry4819, _4819_2 in ipairs(larry4818) do
local larry4820 =_4819_2["IsA"]
local larry4821 =larry4820(_4819_2, "Model")
local larry4822 =(_4819_2==larry4286)
local larry4823 =_4819_2["FindFirstChildWhichIsA"]
local larry4824 =larry4823(_4819_2, "Humanoid")
local larry4825 =larry4824["DisplayName"]
local larry4826 =larry25["DisplayName"]
local larry4827 =(larry4825==larry4826)
local larry4828 =_4819_2["Name"]
local larry4829 =larry25["Name"]
local larry4830 =(larry4828==larry4829)
local larry4831 =larry4824["GetAttribute"]
local larry4832 =larry4831(larry4824, "UserId")
local larry4833 =larry25["UserId"]
local larry4834 =(larry4832==larry4833)
end
local _ =task.wait(0.05)
local larry4835 =larry14["GetChildren"]
local larry4836 =larry4835(larry14)
for larry4837, _4837_2 in ipairs(larry4836) do
local larry4838 =_4837_2["IsA"]
local larry4839 =larry4838(_4837_2, "Model")
local larry4840 =(_4837_2==larry4286)
local larry4841 =_4837_2["FindFirstChildWhichIsA"]
local larry4842 =larry4841(_4837_2, "Humanoid")
local larry4843 =larry4842["DisplayName"]
local larry4844 =larry25["DisplayName"]
local larry4845 =(larry4843==larry4844)
local larry4846 =_4837_2["Name"]
local larry4847 =larry25["Name"]
local larry4848 =(larry4846==larry4847)
local larry4849 =larry4842["GetAttribute"]
local larry4850 =larry4849(larry4842, "UserId")
local larry4851 =larry25["UserId"]
local larry4852 =(larry4850==larry4851)
end
local _ =task.wait(0.05)
local larry4853 =larry14["GetChildren"]
local larry4854 =larry4853(larry14)
for larry4855, _4855_2 in ipairs(larry4854) do
local larry4856 =_4855_2["IsA"]
local larry4857 =larry4856(_4855_2, "Model")
local larry4858 =(_4855_2==larry4286)
local larry4859 =_4855_2["FindFirstChildWhichIsA"]
local larry4860 =larry4859(_4855_2, "Humanoid")
local larry4861 =larry4860["DisplayName"]
local larry4862 =larry25["DisplayName"]
local larry4863 =(larry4861==larry4862)
local larry4864 =_4855_2["Name"]
local larry4865 =larry25["Name"]
local larry4866 =(larry4864==larry4865)
local larry4867 =larry4860["GetAttribute"]
local larry4868 =larry4867(larry4860, "UserId")
local larry4869 =larry25["UserId"]
local larry4870 =(larry4868==larry4869)
end
local _ =task.wait(0.05)
local larry4871 =larry14["GetChildren"]
local larry4872 =larry4871(larry14)
for larry4873, _4873_2 in ipairs(larry4872) do
local larry4874 =_4873_2["IsA"]
local larry4875 =larry4874(_4873_2, "Model")
local larry4876 =(_4873_2==larry4286)
local larry4877 =_4873_2["FindFirstChildWhichIsA"]
local larry4878 =larry4877(_4873_2, "Humanoid")
local larry4879 =larry4878["DisplayName"]
local larry4880 =larry25["DisplayName"]
local larry4881 =(larry4879==larry4880)
local larry4882 =_4873_2["Name"]
local larry4883 =larry25["Name"]
local larry4884 =(larry4882==larry4883)
local larry4885 =larry4878["GetAttribute"]
local larry4886 =larry4885(larry4878, "UserId")
local larry4887 =larry25["UserId"]
local larry4888 =(larry4886==larry4887)
end
local _ =task.wait(0.05)
local larry4889 =larry14["GetChildren"]
local larry4890 =larry4889(larry14)
for larry4891, _4891_2 in ipairs(larry4890) do
local larry4892 =_4891_2["IsA"]
local larry4893 =larry4892(_4891_2, "Model")
local larry4894 =(_4891_2==larry4286)
local larry4895 =_4891_2["FindFirstChildWhichIsA"]
local larry4896 =larry4895(_4891_2, "Humanoid")
local larry4897 =larry4896["DisplayName"]
local larry4898 =larry25["DisplayName"]
local larry4899 =(larry4897==larry4898)
local larry4900 =_4891_2["Name"]
local larry4901 =larry25["Name"]
local larry4902 =(larry4900==larry4901)
local larry4903 =larry4896["GetAttribute"]
local larry4904 =larry4903(larry4896, "UserId")
local larry4905 =larry25["UserId"]
local larry4906 =(larry4904==larry4905)
end
local _ =task.wait(0.05)
local larry4907 =larry14["GetChildren"]
local larry4908 =larry4907(larry14)
for larry4909, _4909_2 in ipairs(larry4908) do
local larry4910 =_4909_2["IsA"]
local larry4911 =larry4910(_4909_2, "Model")
local larry4912 =(_4909_2==larry4286)
local larry4913 =_4909_2["FindFirstChildWhichIsA"]
local larry4914 =larry4913(_4909_2, "Humanoid")
local larry4915 =larry4914["DisplayName"]
local larry4916 =larry25["DisplayName"]
local larry4917 =(larry4915==larry4916)
local larry4918 =_4909_2["Name"]
local larry4919 =larry25["Name"]
local larry4920 =(larry4918==larry4919)
local larry4921 =larry4914["GetAttribute"]
local larry4922 =larry4921(larry4914, "UserId")
local larry4923 =larry25["UserId"]
local larry4924 =(larry4922==larry4923)
end
local _ =task.wait(0.05)
local larry4925 =larry14["GetChildren"]
local larry4926 =larry4925(larry14)
for larry4927, _4927_2 in ipairs(larry4926) do
local larry4928 =_4927_2["IsA"]
local larry4929 =larry4928(_4927_2, "Model")
local larry4930 =(_4927_2==larry4286)
local larry4931 =_4927_2["FindFirstChildWhichIsA"]
local larry4932 =larry4931(_4927_2, "Humanoid")
local larry4933 =larry4932["DisplayName"]
local larry4934 =larry25["DisplayName"]
local larry4935 =(larry4933==larry4934)
local larry4936 =_4927_2["Name"]
local larry4937 =larry25["Name"]
local larry4938 =(larry4936==larry4937)
local larry4939 =larry4932["GetAttribute"]
local larry4940 =larry4939(larry4932, "UserId")
local larry4941 =larry25["UserId"]
local larry4942 =(larry4940==larry4941)
end
local _ =task.wait(0.05)
local larry4943 =larry14["GetChildren"]
local larry4944 =larry4943(larry14)
for larry4945, _4945_2 in ipairs(larry4944) do
local larry4946 =_4945_2["IsA"]
local larry4947 =larry4946(_4945_2, "Model")
local larry4948 =(_4945_2==larry4286)
local larry4949 =_4945_2["FindFirstChildWhichIsA"]
local larry4950 =larry4949(_4945_2, "Humanoid")
local larry4951 =larry4950["DisplayName"]
local larry4952 =larry25["DisplayName"]
local larry4953 =(larry4951==larry4952)
local larry4954 =_4945_2["Name"]
local larry4955 =larry25["Name"]
local larry4956 =(larry4954==larry4955)
local larry4957 =larry4950["GetAttribute"]
local larry4958 =larry4957(larry4950, "UserId")
local larry4959 =larry25["UserId"]
local larry4960 =(larry4958==larry4959)
end
local _ =task.wait(0.05)
local larry4961 =larry14["GetChildren"]
local larry4962 =larry4961(larry14)
for larry4963, _4963_2 in ipairs(larry4962) do
local larry4964 =_4963_2["IsA"]
local larry4965 =larry4964(_4963_2, "Model")
local larry4966 =(_4963_2==larry4286)
local larry4967 =_4963_2["FindFirstChildWhichIsA"]
local larry4968 =larry4967(_4963_2, "Humanoid")
local larry4969 =larry4968["DisplayName"]
local larry4970 =larry25["DisplayName"]
local larry4971 =(larry4969==larry4970)
local larry4972 =_4963_2["Name"]
local larry4973 =larry25["Name"]
local larry4974 =(larry4972==larry4973)
local larry4975 =larry4968["GetAttribute"]
local larry4976 =larry4975(larry4968, "UserId")
local larry4977 =larry25["UserId"]
local larry4978 =(larry4976==larry4977)
end
local _ =task.wait(0.05)
local larry4979 =larry14["GetChildren"]
local larry4980 =larry4979(larry14)
for larry4981, _4981_2 in ipairs(larry4980) do
local larry4982 =_4981_2["IsA"]
local larry4983 =larry4982(_4981_2, "Model")
local larry4984 =(_4981_2==larry4286)
local larry4985 =_4981_2["FindFirstChildWhichIsA"]
local larry4986 =larry4985(_4981_2, "Humanoid")
local larry4987 =larry4986["DisplayName"]
local larry4988 =larry25["DisplayName"]
local larry4989 =(larry4987==larry4988)
local larry4990 =_4981_2["Name"]
local larry4991 =larry25["Name"]
local larry4992 =(larry4990==larry4991)
local larry4993 =larry4986["GetAttribute"]
local larry4994 =larry4993(larry4986, "UserId")
local larry4995 =larry25["UserId"]
local larry4996 =(larry4994==larry4995)
end
local _ =task.wait(0.05)
local larry4997 =larry14["GetChildren"]
local larry4998 =larry4997(larry14)
for larry4999, _4999_2 in ipairs(larry4998) do
local larry5000 =_4999_2["IsA"]
local larry5001 =larry5000(_4999_2, "Model")
local larry5002 =(_4999_2==larry4286)
local larry5003 =_4999_2["FindFirstChildWhichIsA"]
local larry5004 =larry5003(_4999_2, "Humanoid")
local larry5005 =larry5004["DisplayName"]
local larry5006 =larry25["DisplayName"]
local larry5007 =(larry5005==larry5006)
local larry5008 =_4999_2["Name"]
local larry5009 =larry25["Name"]
local larry5010 =(larry5008==larry5009)
local larry5011 =larry5004["GetAttribute"]
local larry5012 =larry5011(larry5004, "UserId")
local larry5013 =larry25["UserId"]
local larry5014 =(larry5012==larry5013)
end
local _ =task.wait(0.05)
local larry5015 =larry14["GetChildren"]
local larry5016 =larry5015(larry14)
for larry5017, _5017_2 in ipairs(larry5016) do
local larry5018 =_5017_2["IsA"]
local er =error("Luraph Script:2780: Luraph Script:2736: internal 542: <larry: infinitelooperror>")
end
end)
local larry4281 =larry4280(larry4279, function(...)
local _4282_vararg1, _4282_vararg2, _4282_vararg3, _4282_vararg4, _4282_vararg5, _4282_vararg6, _4282_vararg7, _4282_vararg8, _4282_vararg9, _4282_vararg10 = ...
larry4256["BackgroundColor3"] =larry4246
local larry4283 =task["spawn"]
local larry4284 =larry4283(function(...)
local _4285_vararg1, _4285_vararg2, _4285_vararg3, _4285_vararg4, _4285_vararg5, _4285_vararg6, _4285_vararg7, _4285_vararg8, _4285_vararg9, _4285_vararg10 = ...
local larry4286 =larry25["Character"]
local larry4287 =larry25["WaitForChild"]
local larry4288 =larry4287(larry25, "Backpack")
local larry4289 =larry4286["FindFirstChildWhichIsA"]
local larry4290 =larry4289(larry4286, "Humanoid")
local larry4291 =larry4290["UnequipTools"]
local larry4292 =larry4291(larry4290)
local larry4293 =larry4286["GetChildren"]
local larry4294 =larry4293(larry4286)
for larry4295, _4295_2 in ipairs(larry4294) do
local larry4296 =_4295_2["IsA"]
local larry4297 =larry4296(_4295_2, "Accessory")
local larry4298 =_4295_2["Destroy"]
local larry4299 =larry4298(_4295_2)
end
local larry4300 =larry4288["FindFirstChild"]
local larry4301 =larry4300(larry4288, "Quantum Cloner")
larry4301["Parent"] =larry4286
local _ =task.wait()
local larry4302 =larry4301["Activate"]
local larry4303 =larry4302(larry4301)
local larry4304 =larry4288["GetChildren"]
local larry4305 =larry4304(larry4288)
for larry4306, _4306_2 in ipairs(larry4305) do
local larry4307 =_4306_2["IsA"]
local larry4308 =larry4307(_4306_2, "Tool")
local larry4309 =_4306_2["Name"]
local larry4310, _4310_2, _4310_3 =string.lower(larry4309)
local larry4311 =larry4310["find"]
local larry4312 =larry4311(larry4310, "slap")
_4306_2["Parent"] =larry4286
end
local _ =task.wait(0.5)
local larry4313 =larry14["GetChildren"]
local larry4314 =larry4313(larry14)
for larry4315, _4315_2 in ipairs(larry4314) do
local larry4316 =_4315_2["IsA"]
local larry4317 =larry4316(_4315_2, "Model")
local larry4318 =(_4315_2==larry4286)
local larry4319 =_4315_2["FindFirstChildWhichIsA"]
local larry4320 =larry4319(_4315_2, "Humanoid")
local larry4321 =larry4320["DisplayName"]
local larry4322 =larry25["DisplayName"]
local larry4323 =(larry4321==larry4322)
local larry4324 =_4315_2["Name"]
local larry4325 =larry25["Name"]
local larry4326 =(larry4324==larry4325)
local larry4327 =larry4320["GetAttribute"]
local larry4328 =larry4327(larry4320, "UserId")
local larry4329 =larry25["UserId"]
local larry4330 =(larry4328==larry4329)
end
local _ =task.wait(0.05)
local larry4331 =larry14["GetChildren"]
local larry4332 =larry4331(larry14)
for larry4333, _4333_2 in ipairs(larry4332) do
local larry4334 =_4333_2["IsA"]
local larry4335 =larry4334(_4333_2, "Model")
local larry4336 =(_4333_2==larry4286)
local larry4337 =_4333_2["FindFirstChildWhichIsA"]
local larry4338 =larry4337(_4333_2, "Humanoid")
local larry4339 =larry4338["DisplayName"]
local larry4340 =larry25["DisplayName"]
local larry4341 =(larry4339==larry4340)
local larry4342 =_4333_2["Name"]
local larry4343 =larry25["Name"]
local larry4344 =(larry4342==larry4343)
local larry4345 =larry4338["GetAttribute"]
local larry4346 =larry4345(larry4338, "UserId")
local larry4347 =larry25["UserId"]
local larry4348 =(larry4346==larry4347)
end
local _ =task.wait(0.05)
local larry4349 =larry14["GetChildren"]
local larry4350 =larry4349(larry14)
for larry4351, _4351_2 in ipairs(larry4350) do
local larry4352 =_4351_2["IsA"]
local larry4353 =larry4352(_4351_2, "Model")
local larry4354 =(_4351_2==larry4286)
local larry4355 =_4351_2["FindFirstChildWhichIsA"]
local larry4356 =larry4355(_4351_2, "Humanoid")
local larry4357 =larry4356["DisplayName"]
local larry4358 =larry25["DisplayName"]
local larry4359 =(larry4357==larry4358)
local larry4360 =_4351_2["Name"]
local larry4361 =larry25["Name"]
local larry4362 =(larry4360==larry4361)
local larry4363 =larry4356["GetAttribute"]
local larry4364 =larry4363(larry4356, "UserId")
local larry4365 =larry25["UserId"]
local larry4366 =(larry4364==larry4365)
end
local _ =task.wait(0.05)
local larry4367 =larry14["GetChildren"]
local larry4368 =larry4367(larry14)
for larry4369, _4369_2 in ipairs(larry4368) do
local larry4370 =_4369_2["IsA"]
local larry4371 =larry4370(_4369_2, "Model")
local larry4372 =(_4369_2==larry4286)
local larry4373 =_4369_2["FindFirstChildWhichIsA"]
local larry4374 =larry4373(_4369_2, "Humanoid")
local larry4375 =larry4374["DisplayName"]
local larry4376 =larry25["DisplayName"]
local larry4377 =(larry4375==larry4376)
local larry4378 =_4369_2["Name"]
local larry4379 =larry25["Name"]
local larry4380 =(larry4378==larry4379)
local larry4381 =larry4374["GetAttribute"]
local larry4382 =larry4381(larry4374, "UserId")
local larry4383 =larry25["UserId"]
local larry4384 =(larry4382==larry4383)
end
local _ =task.wait(0.05)
local larry4385 =larry14["GetChildren"]
local larry4386 =larry4385(larry14)
for larry4387, _4387_2 in ipairs(larry4386) do
local larry4388 =_4387_2["IsA"]
local larry4389 =larry4388(_4387_2, "Model")
local larry4390 =(_4387_2==larry4286)
local larry4391 =_4387_2["FindFirstChildWhichIsA"]
local larry4392 =larry4391(_4387_2, "Humanoid")
local larry4393 =larry4392["DisplayName"]
local larry4394 =larry25["DisplayName"]
local larry4395 =(larry4393==larry4394)
local larry4396 =_4387_2["Name"]
local larry4397 =larry25["Name"]
local larry4398 =(larry4396==larry4397)
local larry4399 =larry4392["GetAttribute"]
local larry4400 =larry4399(larry4392, "UserId")
local larry4401 =larry25["UserId"]
local larry4402 =(larry4400==larry4401)
end
local _ =task.wait(0.05)
local larry4403 =larry14["GetChildren"]
local larry4404 =larry4403(larry14)
for larry4405, _4405_2 in ipairs(larry4404) do
local larry4406 =_4405_2["IsA"]
local larry4407 =larry4406(_4405_2, "Model")
local larry4408 =(_4405_2==larry4286)
local larry4409 =_4405_2["FindFirstChildWhichIsA"]
local larry4410 =larry4409(_4405_2, "Humanoid")
local larry4411 =larry4410["DisplayName"]
local larry4412 =larry25["DisplayName"]
local larry4413 =(larry4411==larry4412)
local larry4414 =_4405_2["Name"]
local larry4415 =larry25["Name"]
local larry4416 =(larry4414==larry4415)
local larry4417 =larry4410["GetAttribute"]
local larry4418 =larry4417(larry4410, "UserId")
local larry4419 =larry25["UserId"]
local larry4420 =(larry4418==larry4419)
end
local _ =task.wait(0.05)
local larry4421 =larry14["GetChildren"]
local larry4422 =larry4421(larry14)
for larry4423, _4423_2 in ipairs(larry4422) do
local larry4424 =_4423_2["IsA"]
local larry4425 =larry4424(_4423_2, "Model")
local larry4426 =(_4423_2==larry4286)
local larry4427 =_4423_2["FindFirstChildWhichIsA"]
local larry4428 =larry4427(_4423_2, "Humanoid")
local larry4429 =larry4428["DisplayName"]
local larry4430 =larry25["DisplayName"]
local larry4431 =(larry4429==larry4430)
local larry4432 =_4423_2["Name"]
local larry4433 =larry25["Name"]
local larry4434 =(larry4432==larry4433)
local larry4435 =larry4428["GetAttribute"]
local larry4436 =larry4435(larry4428, "UserId")
local larry4437 =larry25["UserId"]
local larry4438 =(larry4436==larry4437)
end
local _ =task.wait(0.05)
local larry4439 =larry14["GetChildren"]
local larry4440 =larry4439(larry14)
for larry4441, _4441_2 in ipairs(larry4440) do
local larry4442 =_4441_2["IsA"]
local larry4443 =larry4442(_4441_2, "Model")
local larry4444 =(_4441_2==larry4286)
local larry4445 =_4441_2["FindFirstChildWhichIsA"]
local larry4446 =larry4445(_4441_2, "Humanoid")
local larry4447 =larry4446["DisplayName"]
local larry4448 =larry25["DisplayName"]
local larry4449 =(larry4447==larry4448)
local larry4450 =_4441_2["Name"]
local larry4451 =larry25["Name"]
local larry4452 =(larry4450==larry4451)
local larry4453 =larry4446["GetAttribute"]
local larry4454 =larry4453(larry4446, "UserId")
local larry4455 =larry25["UserId"]
local larry4456 =(larry4454==larry4455)
end
local _ =task.wait(0.05)
local larry4457 =larry14["GetChildren"]
local larry4458 =larry4457(larry14)
for larry4459, _4459_2 in ipairs(larry4458) do
local larry4460 =_4459_2["IsA"]
local larry4461 =larry4460(_4459_2, "Model")
local larry4462 =(_4459_2==larry4286)
local larry4463 =_4459_2["FindFirstChildWhichIsA"]
local larry4464 =larry4463(_4459_2, "Humanoid")
local larry4465 =larry4464["DisplayName"]
local larry4466 =larry25["DisplayName"]
local larry4467 =(larry4465==larry4466)
local larry4468 =_4459_2["Name"]
local larry4469 =larry25["Name"]
local larry4470 =(larry4468==larry4469)
local larry4471 =larry4464["GetAttribute"]
local larry4472 =larry4471(larry4464, "UserId")
local larry4473 =larry25["UserId"]
local larry4474 =(larry4472==larry4473)
end
local _ =task.wait(0.05)
local larry4475 =larry14["GetChildren"]
local larry4476 =larry4475(larry14)
for larry4477, _4477_2 in ipairs(larry4476) do
local larry4478 =_4477_2["IsA"]
local larry4479 =larry4478(_4477_2, "Model")
local larry4480 =(_4477_2==larry4286)
local larry4481 =_4477_2["FindFirstChildWhichIsA"]
local larry4482 =larry4481(_4477_2, "Humanoid")
local larry4483 =larry4482["DisplayName"]
local larry4484 =larry25["DisplayName"]
local larry4485 =(larry4483==larry4484)
local larry4486 =_4477_2["Name"]
local larry4487 =larry25["Name"]
local larry4488 =(larry4486==larry4487)
local larry4489 =larry4482["GetAttribute"]
local larry4490 =larry4489(larry4482, "UserId")
local larry4491 =larry25["UserId"]
local larry4492 =(larry4490==larry4491)
end
local _ =task.wait(0.05)
local larry4493 =larry14["GetChildren"]
local larry4494 =larry4493(larry14)
for larry4495, _4495_2 in ipairs(larry4494) do
local larry4496 =_4495_2["IsA"]
local larry4497 =larry4496(_4495_2, "Model")
local larry4498 =(_4495_2==larry4286)
local larry4499 =_4495_2["FindFirstChildWhichIsA"]
local larry4500 =larry4499(_4495_2, "Humanoid")
local larry4501 =larry4500["DisplayName"]
local larry4502 =larry25["DisplayName"]
local larry4503 =(larry4501==larry4502)
local larry4504 =_4495_2["Name"]
local larry4505 =larry25["Name"]
local larry4506 =(larry4504==larry4505)
local larry4507 =larry4500["GetAttribute"]
local larry4508 =larry4507(larry4500, "UserId")
local larry4509 =larry25["UserId"]
local larry4510 =(larry4508==larry4509)
end
local _ =task.wait(0.05)
local larry4511 =larry14["GetChildren"]
local larry4512 =larry4511(larry14)
for larry4513, _4513_2 in ipairs(larry4512) do
local larry4514 =_4513_2["IsA"]
local larry4515 =larry4514(_4513_2, "Model")
local larry4516 =(_4513_2==larry4286)
local larry4517 =_4513_2["FindFirstChildWhichIsA"]
local larry4518 =larry4517(_4513_2, "Humanoid")
local larry4519 =larry4518["DisplayName"]
local larry4520 =larry25["DisplayName"]
local larry4521 =(larry4519==larry4520)
local larry4522 =_4513_2["Name"]
local larry4523 =larry25["Name"]
local larry4524 =(larry4522==larry4523)
local larry4525 =larry4518["GetAttribute"]
local larry4526 =larry4525(larry4518, "UserId")
local larry4527 =larry25["UserId"]
local larry4528 =(larry4526==larry4527)
end
local _ =task.wait(0.05)
local larry4529 =larry14["GetChildren"]
local larry4530 =larry4529(larry14)
for larry4531, _4531_2 in ipairs(larry4530) do
local larry4532 =_4531_2["IsA"]
local larry4533 =larry4532(_4531_2, "Model")
local larry4534 =(_4531_2==larry4286)
local larry4535 =_4531_2["FindFirstChildWhichIsA"]
local larry4536 =larry4535(_4531_2, "Humanoid")
local larry4537 =larry4536["DisplayName"]
local larry4538 =larry25["DisplayName"]
local larry4539 =(larry4537==larry4538)
local larry4540 =_4531_2["Name"]
local larry4541 =larry25["Name"]
local larry4542 =(larry4540==larry4541)
local larry4543 =larry4536["GetAttribute"]
local larry4544 =larry4543(larry4536, "UserId")
local larry4545 =larry25["UserId"]
local larry4546 =(larry4544==larry4545)
end
local _ =task.wait(0.05)
local larry4547 =larry14["GetChildren"]
local larry4548 =larry4547(larry14)
for larry4549, _4549_2 in ipairs(larry4548) do
local larry4550 =_4549_2["IsA"]
local larry4551 =larry4550(_4549_2, "Model")
local larry4552 =(_4549_2==larry4286)
local larry4553 =_4549_2["FindFirstChildWhichIsA"]
local larry4554 =larry4553(_4549_2, "Humanoid")
local larry4555 =larry4554["DisplayName"]
local larry4556 =larry25["DisplayName"]
local larry4557 =(larry4555==larry4556)
local larry4558 =_4549_2["Name"]
local larry4559 =larry25["Name"]
local larry4560 =(larry4558==larry4559)
local larry4561 =larry4554["GetAttribute"]
local larry4562 =larry4561(larry4554, "UserId")
local larry4563 =larry25["UserId"]
local larry4564 =(larry4562==larry4563)
end
local _ =task.wait(0.05)
local larry4565 =larry14["GetChildren"]
local larry4566 =larry4565(larry14)
for larry4567, _4567_2 in ipairs(larry4566) do
local larry4568 =_4567_2["IsA"]
local larry4569 =larry4568(_4567_2, "Model")
local larry4570 =(_4567_2==larry4286)
local larry4571 =_4567_2["FindFirstChildWhichIsA"]
local larry4572 =larry4571(_4567_2, "Humanoid")
local larry4573 =larry4572["DisplayName"]
local larry4574 =larry25["DisplayName"]
local larry4575 =(larry4573==larry4574)
local larry4576 =_4567_2["Name"]
local larry4577 =larry25["Name"]
local larry4578 =(larry4576==larry4577)
local larry4579 =larry4572["GetAttribute"]
local larry4580 =larry4579(larry4572, "UserId")
local larry4581 =larry25["UserId"]
local larry4582 =(larry4580==larry4581)
end
local _ =task.wait(0.05)
local larry4583 =larry14["GetChildren"]
local larry4584 =larry4583(larry14)
for larry4585, _4585_2 in ipairs(larry4584) do
local larry4586 =_4585_2["IsA"]
local larry4587 =larry4586(_4585_2, "Model")
local larry4588 =(_4585_2==larry4286)
local larry4589 =_4585_2["FindFirstChildWhichIsA"]
local larry4590 =larry4589(_4585_2, "Humanoid")
local larry4591 =larry4590["DisplayName"]
local larry4592 =larry25["DisplayName"]
local larry4593 =(larry4591==larry4592)
local larry4594 =_4585_2["Name"]
local larry4595 =larry25["Name"]
local larry4596 =(larry4594==larry4595)
local larry4597 =larry4590["GetAttribute"]
local larry4598 =larry4597(larry4590, "UserId")
local larry4599 =larry25["UserId"]
local larry4600 =(larry4598==larry4599)
end
local _ =task.wait(0.05)
local larry4601 =larry14["GetChildren"]
local larry4602 =larry4601(larry14)
for larry4603, _4603_2 in ipairs(larry4602) do
local larry4604 =_4603_2["IsA"]
local larry4605 =larry4604(_4603_2, "Model")
local larry4606 =(_4603_2==larry4286)
local larry4607 =_4603_2["FindFirstChildWhichIsA"]
local larry4608 =larry4607(_4603_2, "Humanoid")
local larry4609 =larry4608["DisplayName"]
local larry4610 =larry25["DisplayName"]
local larry4611 =(larry4609==larry4610)
local larry4612 =_4603_2["Name"]
local larry4613 =larry25["Name"]
local larry4614 =(larry4612==larry4613)
local larry4615 =larry4608["GetAttribute"]
local larry4616 =larry4615(larry4608, "UserId")
local larry4617 =larry25["UserId"]
local larry4618 =(larry4616==larry4617)
end
local _ =task.wait(0.05)
local larry4619 =larry14["GetChildren"]
local larry4620 =larry4619(larry14)
for larry4621, _4621_2 in ipairs(larry4620) do
local larry4622 =_4621_2["IsA"]
local larry4623 =larry4622(_4621_2, "Model")
local larry4624 =(_4621_2==larry4286)
local larry4625 =_4621_2["FindFirstChildWhichIsA"]
local larry4626 =larry4625(_4621_2, "Humanoid")
local larry4627 =larry4626["DisplayName"]
local larry4628 =larry25["DisplayName"]
local larry4629 =(larry4627==larry4628)
local larry4630 =_4621_2["Name"]
local larry4631 =larry25["Name"]
local larry4632 =(larry4630==larry4631)
local larry4633 =larry4626["GetAttribute"]
local larry4634 =larry4633(larry4626, "UserId")
local larry4635 =larry25["UserId"]
local larry4636 =(larry4634==larry4635)
end
local _ =task.wait(0.05)
local larry4637 =larry14["GetChildren"]
local larry4638 =larry4637(larry14)
for larry4639, _4639_2 in ipairs(larry4638) do
local larry4640 =_4639_2["IsA"]
local larry4641 =larry4640(_4639_2, "Model")
local larry4642 =(_4639_2==larry4286)
local larry4643 =_4639_2["FindFirstChildWhichIsA"]
local larry4644 =larry4643(_4639_2, "Humanoid")
local larry4645 =larry4644["DisplayName"]
local larry4646 =larry25["DisplayName"]
local larry4647 =(larry4645==larry4646)
local larry4648 =_4639_2["Name"]
local larry4649 =larry25["Name"]
local larry4650 =(larry4648==larry4649)
local larry4651 =larry4644["GetAttribute"]
local larry4652 =larry4651(larry4644, "UserId")
local larry4653 =larry25["UserId"]
local larry4654 =(larry4652==larry4653)
end
local _ =task.wait(0.05)
local larry4655 =larry14["GetChildren"]
local larry4656 =larry4655(larry14)
for larry4657, _4657_2 in ipairs(larry4656) do
local larry4658 =_4657_2["IsA"]
local larry4659 =larry4658(_4657_2, "Model")
local larry4660 =(_4657_2==larry4286)
local larry4661 =_4657_2["FindFirstChildWhichIsA"]
local larry4662 =larry4661(_4657_2, "Humanoid")
local larry4663 =larry4662["DisplayName"]
local larry4664 =larry25["DisplayName"]
local larry4665 =(larry4663==larry4664)
local larry4666 =_4657_2["Name"]
local larry4667 =larry25["Name"]
local larry4668 =(larry4666==larry4667)
local larry4669 =larry4662["GetAttribute"]
local larry4670 =larry4669(larry4662, "UserId")
local larry4671 =larry25["UserId"]
local larry4672 =(larry4670==larry4671)
end
local _ =task.wait(0.05)
local larry4673 =larry14["GetChildren"]
local larry4674 =larry4673(larry14)
for larry4675, _4675_2 in ipairs(larry4674) do
local larry4676 =_4675_2["IsA"]
local larry4677 =larry4676(_4675_2, "Model")
local larry4678 =(_4675_2==larry4286)
local larry4679 =_4675_2["FindFirstChildWhichIsA"]
local larry4680 =larry4679(_4675_2, "Humanoid")
local larry4681 =larry4680["DisplayName"]
local larry4682 =larry25["DisplayName"]
local larry4683 =(larry4681==larry4682)
local larry4684 =_4675_2["Name"]
local larry4685 =larry25["Name"]
local larry4686 =(larry4684==larry4685)
local larry4687 =larry4680["GetAttribute"]
local larry4688 =larry4687(larry4680, "UserId")
local larry4689 =larry25["UserId"]
local larry4690 =(larry4688==larry4689)
end
local _ =task.wait(0.05)
local larry4691 =larry14["GetChildren"]
local larry4692 =larry4691(larry14)
for larry4693, _4693_2 in ipairs(larry4692) do
local larry4694 =_4693_2["IsA"]
local larry4695 =larry4694(_4693_2, "Model")
local larry4696 =(_4693_2==larry4286)
local larry4697 =_4693_2["FindFirstChildWhichIsA"]
local larry4698 =larry4697(_4693_2, "Humanoid")
local larry4699 =larry4698["DisplayName"]
local larry4700 =larry25["DisplayName"]
local larry4701 =(larry4699==larry4700)
local larry4702 =_4693_2["Name"]
local larry4703 =larry25["Name"]
local larry4704 =(larry4702==larry4703)
local larry4705 =larry4698["GetAttribute"]
local larry4706 =larry4705(larry4698, "UserId")
local larry4707 =larry25["UserId"]
local larry4708 =(larry4706==larry4707)
end
local _ =task.wait(0.05)
local larry4709 =larry14["GetChildren"]
local larry4710 =larry4709(larry14)
for larry4711, _4711_2 in ipairs(larry4710) do
local larry4712 =_4711_2["IsA"]
local larry4713 =larry4712(_4711_2, "Model")
local larry4714 =(_4711_2==larry4286)
local larry4715 =_4711_2["FindFirstChildWhichIsA"]
local larry4716 =larry4715(_4711_2, "Humanoid")
local larry4717 =larry4716["DisplayName"]
local larry4718 =larry25["DisplayName"]
local larry4719 =(larry4717==larry4718)
local larry4720 =_4711_2["Name"]
local larry4721 =larry25["Name"]
local larry4722 =(larry4720==larry4721)
local larry4723 =larry4716["GetAttribute"]
local larry4724 =larry4723(larry4716, "UserId")
local larry4725 =larry25["UserId"]
local larry4726 =(larry4724==larry4725)
end
local _ =task.wait(0.05)
local larry4727 =larry14["GetChildren"]
local larry4728 =larry4727(larry14)
for larry4729, _4729_2 in ipairs(larry4728) do
local larry4730 =_4729_2["IsA"]
local larry4731 =larry4730(_4729_2, "Model")
local larry4732 =(_4729_2==larry4286)
local larry4733 =_4729_2["FindFirstChildWhichIsA"]
local larry4734 =larry4733(_4729_2, "Humanoid")
local larry4735 =larry4734["DisplayName"]
local larry4736 =larry25["DisplayName"]
local larry4737 =(larry4735==larry4736)
local larry4738 =_4729_2["Name"]
local larry4739 =larry25["Name"]
local larry4740 =(larry4738==larry4739)
local larry4741 =larry4734["GetAttribute"]
local larry4742 =larry4741(larry4734, "UserId")
local larry4743 =larry25["UserId"]
local larry4744 =(larry4742==larry4743)
end
local _ =task.wait(0.05)
local larry4745 =larry14["GetChildren"]
local larry4746 =larry4745(larry14)
for larry4747, _4747_2 in ipairs(larry4746) do
local larry4748 =_4747_2["IsA"]
local larry4749 =larry4748(_4747_2, "Model")
local larry4750 =(_4747_2==larry4286)
local larry4751 =_4747_2["FindFirstChildWhichIsA"]
local larry4752 =larry4751(_4747_2, "Humanoid")
local larry4753 =larry4752["DisplayName"]
local larry4754 =larry25["DisplayName"]
local larry4755 =(larry4753==larry4754)
local larry4756 =_4747_2["Name"]
local larry4757 =larry25["Name"]
local larry4758 =(larry4756==larry4757)
local larry4759 =larry4752["GetAttribute"]
local larry4760 =larry4759(larry4752, "UserId")
local larry4761 =larry25["UserId"]
local larry4762 =(larry4760==larry4761)
end
local _ =task.wait(0.05)
local larry4763 =larry14["GetChildren"]
local larry4764 =larry4763(larry14)
for larry4765, _4765_2 in ipairs(larry4764) do
local larry4766 =_4765_2["IsA"]
local larry4767 =larry4766(_4765_2, "Model")
local larry4768 =(_4765_2==larry4286)
local larry4769 =_4765_2["FindFirstChildWhichIsA"]
local larry4770 =larry4769(_4765_2, "Humanoid")
local larry4771 =larry4770["DisplayName"]
local larry4772 =larry25["DisplayName"]
local larry4773 =(larry4771==larry4772)
local larry4774 =_4765_2["Name"]
local larry4775 =larry25["Name"]
local larry4776 =(larry4774==larry4775)
local larry4777 =larry4770["GetAttribute"]
local larry4778 =larry4777(larry4770, "UserId")
local larry4779 =larry25["UserId"]
local larry4780 =(larry4778==larry4779)
end
local _ =task.wait(0.05)
local larry4781 =larry14["GetChildren"]
local larry4782 =larry4781(larry14)
for larry4783, _4783_2 in ipairs(larry4782) do
local larry4784 =_4783_2["IsA"]
local larry4785 =larry4784(_4783_2, "Model")
local larry4786 =(_4783_2==larry4286)
local larry4787 =_4783_2["FindFirstChildWhichIsA"]
local larry4788 =larry4787(_4783_2, "Humanoid")
local larry4789 =larry4788["DisplayName"]
local larry4790 =larry25["DisplayName"]
local larry4791 =(larry4789==larry4790)
local larry4792 =_4783_2["Name"]
local larry4793 =larry25["Name"]
local larry4794 =(larry4792==larry4793)
local larry4795 =larry4788["GetAttribute"]
local larry4796 =larry4795(larry4788, "UserId")
local larry4797 =larry25["UserId"]
local larry4798 =(larry4796==larry4797)
end
local _ =task.wait(0.05)
local larry4799 =larry14["GetChildren"]
local larry4800 =larry4799(larry14)
for larry4801, _4801_2 in ipairs(larry4800) do
local larry4802 =_4801_2["IsA"]
local larry4803 =larry4802(_4801_2, "Model")
local larry4804 =(_4801_2==larry4286)
local larry4805 =_4801_2["FindFirstChildWhichIsA"]
local larry4806 =larry4805(_4801_2, "Humanoid")
local larry4807 =larry4806["DisplayName"]
local larry4808 =larry25["DisplayName"]
local larry4809 =(larry4807==larry4808)
local larry4810 =_4801_2["Name"]
local larry4811 =larry25["Name"]
local larry4812 =(larry4810==larry4811)
local larry4813 =larry4806["GetAttribute"]
local larry4814 =larry4813(larry4806, "UserId")
local larry4815 =larry25["UserId"]
local larry4816 =(larry4814==larry4815)
end
local _ =task.wait(0.05)
local larry4817 =larry14["GetChildren"]
local larry4818 =larry4817(larry14)
for larry4819, _4819_2 in ipairs(larry4818) do
local larry4820 =_4819_2["IsA"]
local larry4821 =larry4820(_4819_2, "Model")
local larry4822 =(_4819_2==larry4286)
local larry4823 =_4819_2["FindFirstChildWhichIsA"]
local larry4824 =larry4823(_4819_2, "Humanoid")
local larry4825 =larry4824["DisplayName"]
local larry4826 =larry25["DisplayName"]
local larry4827 =(larry4825==larry4826)
local larry4828 =_4819_2["Name"]
local larry4829 =larry25["Name"]
local larry4830 =(larry4828==larry4829)
local larry4831 =larry4824["GetAttribute"]
local larry4832 =larry4831(larry4824, "UserId")
local larry4833 =larry25["UserId"]
local larry4834 =(larry4832==larry4833)
end
local _ =task.wait(0.05)
local larry4835 =larry14["GetChildren"]
local larry4836 =larry4835(larry14)
for larry4837, _4837_2 in ipairs(larry4836) do
local larry4838 =_4837_2["IsA"]
local larry4839 =larry4838(_4837_2, "Model")
local larry4840 =(_4837_2==larry4286)
local larry4841 =_4837_2["FindFirstChildWhichIsA"]
local larry4842 =larry4841(_4837_2, "Humanoid")
local larry4843 =larry4842["DisplayName"]
local larry4844 =larry25["DisplayName"]
local larry4845 =(larry4843==larry4844)
local larry4846 =_4837_2["Name"]
local larry4847 =larry25["Name"]
local larry4848 =(larry4846==larry4847)
local larry4849 =larry4842["GetAttribute"]
local larry4850 =larry4849(larry4842, "UserId")
local larry4851 =larry25["UserId"]
local larry4852 =(larry4850==larry4851)
end
local _ =task.wait(0.05)
local larry4853 =larry14["GetChildren"]
local larry4854 =larry4853(larry14)
for larry4855, _4855_2 in ipairs(larry4854) do
local larry4856 =_4855_2["IsA"]
local larry4857 =larry4856(_4855_2, "Model")
local larry4858 =(_4855_2==larry4286)
local larry4859 =_4855_2["FindFirstChildWhichIsA"]
local larry4860 =larry4859(_4855_2, "Humanoid")
local larry4861 =larry4860["DisplayName"]
local larry4862 =larry25["DisplayName"]
local larry4863 =(larry4861==larry4862)
local larry4864 =_4855_2["Name"]
local larry4865 =larry25["Name"]
local larry4866 =(larry4864==larry4865)
local larry4867 =larry4860["GetAttribute"]
local larry4868 =larry4867(larry4860, "UserId")
local larry4869 =larry25["UserId"]
local larry4870 =(larry4868==larry4869)
end
local _ =task.wait(0.05)
local larry4871 =larry14["GetChildren"]
local larry4872 =larry4871(larry14)
for larry4873, _4873_2 in ipairs(larry4872) do
local larry4874 =_4873_2["IsA"]
local larry4875 =larry4874(_4873_2, "Model")
local larry4876 =(_4873_2==larry4286)
local larry4877 =_4873_2["FindFirstChildWhichIsA"]
local larry4878 =larry4877(_4873_2, "Humanoid")
local larry4879 =larry4878["DisplayName"]
local larry4880 =larry25["DisplayName"]
local larry4881 =(larry4879==larry4880)
local larry4882 =_4873_2["Name"]
local larry4883 =larry25["Name"]
local larry4884 =(larry4882==larry4883)
local larry4885 =larry4878["GetAttribute"]
local larry4886 =larry4885(larry4878, "UserId")
local larry4887 =larry25["UserId"]
local larry4888 =(larry4886==larry4887)
end
local _ =task.wait(0.05)
local larry4889 =larry14["GetChildren"]
local larry4890 =larry4889(larry14)
for larry4891, _4891_2 in ipairs(larry4890) do
local larry4892 =_4891_2["IsA"]
local larry4893 =larry4892(_4891_2, "Model")
local larry4894 =(_4891_2==larry4286)
local larry4895 =_4891_2["FindFirstChildWhichIsA"]
local larry4896 =larry4895(_4891_2, "Humanoid")
local larry4897 =larry4896["DisplayName"]
local larry4898 =larry25["DisplayName"]
local larry4899 =(larry4897==larry4898)
local larry4900 =_4891_2["Name"]
local larry4901 =larry25["Name"]
local larry4902 =(larry4900==larry4901)
local larry4903 =larry4896["GetAttribute"]
local larry4904 =larry4903(larry4896, "UserId")
local larry4905 =larry25["UserId"]
local larry4906 =(larry4904==larry4905)
end
local _ =task.wait(0.05)
local larry4907 =larry14["GetChildren"]
local larry4908 =larry4907(larry14)
for larry4909, _4909_2 in ipairs(larry4908) do
local larry4910 =_4909_2["IsA"]
local larry4911 =larry4910(_4909_2, "Model")
local larry4912 =(_4909_2==larry4286)
local larry4913 =_4909_2["FindFirstChildWhichIsA"]
local larry4914 =larry4913(_4909_2, "Humanoid")
local larry4915 =larry4914["DisplayName"]
local larry4916 =larry25["DisplayName"]
local larry4917 =(larry4915==larry4916)
local larry4918 =_4909_2["Name"]
local larry4919 =larry25["Name"]
local larry4920 =(larry4918==larry4919)
local larry4921 =larry4914["GetAttribute"]
local larry4922 =larry4921(larry4914, "UserId")
local larry4923 =larry25["UserId"]
local larry4924 =(larry4922==larry4923)
end
local _ =task.wait(0.05)
local larry4925 =larry14["GetChildren"]
local larry4926 =larry4925(larry14)
for larry4927, _4927_2 in ipairs(larry4926) do
local larry4928 =_4927_2["IsA"]
local larry4929 =larry4928(_4927_2, "Model")
local larry4930 =(_4927_2==larry4286)
local larry4931 =_4927_2["FindFirstChildWhichIsA"]
local larry4932 =larry4931(_4927_2, "Humanoid")
local larry4933 =larry4932["DisplayName"]
local larry4934 =larry25["DisplayName"]
local larry4935 =(larry4933==larry4934)
local larry4936 =_4927_2["Name"]
local larry4937 =larry25["Name"]
local larry4938 =(larry4936==larry4937)
local larry4939 =larry4932["GetAttribute"]
local larry4940 =larry4939(larry4932, "UserId")
local larry4941 =larry25["UserId"]
local larry4942 =(larry4940==larry4941)
end
local _ =task.wait(0.05)
local larry4943 =larry14["GetChildren"]
local larry4944 =larry4943(larry14)
for larry4945, _4945_2 in ipairs(larry4944) do
local larry4946 =_4945_2["IsA"]
local larry4947 =larry4946(_4945_2, "Model")
local larry4948 =(_4945_2==larry4286)
local larry4949 =_4945_2["FindFirstChildWhichIsA"]
local larry4950 =larry4949(_4945_2, "Humanoid")
local larry4951 =larry4950["DisplayName"]
local larry4952 =larry25["DisplayName"]
local larry4953 =(larry4951==larry4952)
local larry4954 =_4945_2["Name"]
local larry4955 =larry25["Name"]
local larry4956 =(larry4954==larry4955)
local larry4957 =larry4950["GetAttribute"]
local larry4958 =larry4957(larry4950, "UserId")
local larry4959 =larry25["UserId"]
local larry4960 =(larry4958==larry4959)
end
local _ =task.wait(0.05)
local larry4961 =larry14["GetChildren"]
local larry4962 =larry4961(larry14)
for larry4963, _4963_2 in ipairs(larry4962) do
local larry4964 =_4963_2["IsA"]
local larry4965 =larry4964(_4963_2, "Model")
local larry4966 =(_4963_2==larry4286)
local larry4967 =_4963_2["FindFirstChildWhichIsA"]
local larry4968 =larry4967(_4963_2, "Humanoid")
local larry4969 =larry4968["DisplayName"]
local larry4970 =larry25["DisplayName"]
local larry4971 =(larry4969==larry4970)
local larry4972 =_4963_2["Name"]
local larry4973 =larry25["Name"]
local larry4974 =(larry4972==larry4973)
local larry4975 =larry4968["GetAttribute"]
local larry4976 =larry4975(larry4968, "UserId")
local larry4977 =larry25["UserId"]
local larry4978 =(larry4976==larry4977)
end
local _ =task.wait(0.05)
local larry4979 =larry14["GetChildren"]
local larry4980 =larry4979(larry14)
for larry4981, _4981_2 in ipairs(larry4980) do
local larry4982 =_4981_2["IsA"]
local larry4983 =larry4982(_4981_2, "Model")
local larry4984 =(_4981_2==larry4286)
local larry4985 =_4981_2["FindFirstChildWhichIsA"]
local larry4986 =larry4985(_4981_2, "Humanoid")
local larry4987 =larry4986["DisplayName"]
local larry4988 =larry25["DisplayName"]
local larry4989 =(larry4987==larry4988)
local larry4990 =_4981_2["Name"]
local larry4991 =larry25["Name"]
local larry4992 =(larry4990==larry4991)
local larry4993 =larry4986["GetAttribute"]
local larry4994 =larry4993(larry4986, "UserId")
local larry4995 =larry25["UserId"]
local larry4996 =(larry4994==larry4995)
end
local _ =task.wait(0.05)
local larry4997 =larry14["GetChildren"]
local larry4998 =larry4997(larry14)
for larry4999, _4999_2 in ipairs(larry4998) do
local larry5000 =_4999_2["IsA"]
local larry5001 =larry5000(_4999_2, "Model")
local larry5002 =(_4999_2==larry4286)
local larry5003 =_4999_2["FindFirstChildWhichIsA"]
local larry5004 =larry5003(_4999_2, "Humanoid")
local larry5005 =larry5004["DisplayName"]
local larry5006 =larry25["DisplayName"]
local larry5007 =(larry5005==larry5006)
local larry5008 =_4999_2["Name"]
local larry5009 =larry25["Name"]
local larry5010 =(larry5008==larry5009)
local larry5011 =larry5004["GetAttribute"]
local larry5012 =larry5011(larry5004, "UserId")
local larry5013 =larry25["UserId"]
local larry5014 =(larry5012==larry5013)
end
local _ =task.wait(0.05)
local larry5015 =larry14["GetChildren"]
local larry5016 =larry5015(larry14)
for larry5017, _5017_2 in ipairs(larry5016) do
local larry5018 =_5017_2["IsA"]
local er =error("Luraph Script:2780: Luraph Script:2736: internal 542: <larry: infinitelooperror>")
end
end)
end)
local larry5020 =UDim2["new"]
local larry5021 =larry5020(0.88, 0, 0, 26)
local larry5022 =UDim2["new"]
local larry5023 =larry5022(0.06, 0, 0, 38)
local larry5024 =Enum["Font"]
local larry5025 =larry5024["Arcade"]
local larry5026 =Instance["new"]
local larry5027 =larry5026("TextButton")
local larry5028 =UDim["new"]
local larry5029 =larry5028(0, 6)
local larry5030 =Instance["new"]
local larry5031 =larry5030("UICorner")
local larry5032 =task["spawn"]
local _ =task.wait(0.1)
local larry5035 =larry5027["Parent"]
local larry5036 =larry5027["FindFirstChild"]
local larry5037 =larry5036(larry5027, "KeybindLabel")
local larry5038 =larry5037["Destroy"]
local larry5039 =larry5038(larry5037)
local larry5033 =larry5032(function(...)
local _5034_vararg1, _5034_vararg2, _5034_vararg3, _5034_vararg4, _5034_vararg5, _5034_vararg6, _5034_vararg7, _5034_vararg8, _5034_vararg9, _5034_vararg10 = ...
local _ =task.wait(0.1)
local larry5035 =larry5027["Parent"]
local larry5036 =larry5027["FindFirstChild"]
local larry5037 =larry5036(larry5027, "KeybindLabel")
local larry5038 =larry5037["Destroy"]
local larry5039 =larry5038(larry5037)
end)
local larry5040 =larry5027["MouseButton1Click"]
local larry5041 =larry5040["Connect"]
local larry5044 =task["spawn"]
local larry5047 =game["GetService"]
local larry5048 =larry5047(game, "Players")
local larry5049 =larry5048["LocalPlayer"]
local larry5050 =setfflag("GameNetPVHeaderRotationalVelocityZeroCutoffExponent", "-5000")
local larry5051 =setfflag("LargeReplicatorWrite5", "true")
local larry5052 =setfflag("LargeReplicatorEnabled9", "true")
local larry5053 =setfflag("AngularVelociryLimit", "360")
local larry5054 =setfflag("TimestepArbiterVelocityCriteriaThresholdTwoDt", "2147483646")
local larry5055 =setfflag("S2PhysicsSenderRate", "15000")
local larry5056 =setfflag("DisableDPIScale", "true")
local larry5057 =setfflag("MaxDataPacketPerSend", "2147483647")
local larry5058 =setfflag("ServerMaxBandwith", "52")
local larry5059 =setfflag("PhysicsSenderMaxBandwidthBps", "20000")
local larry5060 =setfflag("MaxTimestepMultiplierBuoyancy", "2147483647")
local larry5061 =setfflag("SimOwnedNOUCountThresholdMillionth", "2147483647")
local larry5062 =setfflag("MaxMissedWorldStepsRemembered", "-2147483648")
local larry5063 =setfflag("CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth", "1")
local larry5064 =setfflag("StreamJobNOUVolumeLengthCap", "2147483647")
local larry5065 =setfflag("DebugSendDistInSteps", "-2147483648")
local larry5066 =setfflag("MaxTimestepMultiplierAcceleration", "2147483647")
local larry5067 =setfflag("LargeReplicatorRead5", "true")
local larry5068 =setfflag("SimExplicitlyCappedTimestepMultiplier", "2147483646")
local larry5069 =setfflag("GameNetDontSendRedundantNumTimes", "1")
local larry5070 =setfflag("CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent", "1")
local larry5071 =setfflag("CheckPVCachedRotVelThresholdPercent", "10")
local larry5072 =setfflag("LargeReplicatorSerializeRead3", "true")
local larry5073 =setfflag("ReplicationFocusNouExtentsSizeCutoffForPauseStuds", "2147483647")
local larry5074 =setfflag("NextGenReplicatorEnabledWrite4", "true")
local larry5075 =setfflag("CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth", "1")
local larry5076 =setfflag("GameNetDontSendRedundantDeltaPositionMillionth", "1")
local larry5077 =setfflag("InterpolationFrameVelocityThresholdMillionth", "5")
local larry5078 =setfflag("StreamJobNOUVolumeCap", "2147483647")
local larry5079 =setfflag("InterpolationFrameRotVelocityThresholdMillionth", "5")
local larry5080 =setfflag("WorldStepMax", "30")
local larry5081 =setfflag("TimestepArbiterHumanoidLinearVelThreshold", "1")
local larry5082 =setfflag("InterpolationFramePositionThresholdMillionth", "5")
local larry5083 =setfflag("TimestepArbiterHumanoidTurningVelThreshold", "1")
local larry5084 =setfflag("MaxTimestepMultiplierContstraint", "2147483647")
local larry5085 =setfflag("GameNetPVHeaderLinearVelocityZeroCutoffExponent", "-5000")
local larry5086 =setfflag("CheckPVCachedVelThresholdPercent", "10")
local larry5087 =setfflag("TimestepArbiterOmegaThou", "1073741823")
local larry5088 =setfflag("MaxAcceptableUpdateDelay", "1")
local larry5089 =setfflag("LargeReplicatorSerializeWrite4", "true")
local larry5090 =larry5049["Character"]
local larry5091 =larry5090["FindFirstChildWhichIsA"]
local larry5092 =larry5091(larry5090, "Humanoid")
local larry5093 =larry5092["ChangeState"]
local larry5094 =Enum["HumanoidStateType"]
local larry5095 =larry5094["Dead"]
local larry5096 =larry5093(larry5092, larry5095)
local larry5097 =larry5090["ClearAllChildren"]
local larry5098 =larry5097(larry5090)
local larry5099 =Instance["new"]
local larry5100 =larry5099("Model", workspace)
local _ =task.wait()
local larry5101 =larry5100["Destroy"]
local larry5102 =larry5101(larry5100)
local _ =task.wait(0.2)
local er =error("Luraph Script:2879: line 3: attempt to call a nil value")
local larry5045 =larry5044(function(...)
local _5046_vararg1, _5046_vararg2, _5046_vararg3, _5046_vararg4, _5046_vararg5, _5046_vararg6, _5046_vararg7, _5046_vararg8, _5046_vararg9, _5046_vararg10 = ...
local larry5047 =game["GetService"]
local larry5048 =larry5047(game, "Players")
local larry5049 =larry5048["LocalPlayer"]
local larry5050 =setfflag("GameNetPVHeaderRotationalVelocityZeroCutoffExponent", "-5000")
local larry5051 =setfflag("LargeReplicatorWrite5", "true")
local larry5052 =setfflag("LargeReplicatorEnabled9", "true")
local larry5053 =setfflag("AngularVelociryLimit", "360")
local larry5054 =setfflag("TimestepArbiterVelocityCriteriaThresholdTwoDt", "2147483646")
local larry5055 =setfflag("S2PhysicsSenderRate", "15000")
local larry5056 =setfflag("DisableDPIScale", "true")
local larry5057 =setfflag("MaxDataPacketPerSend", "2147483647")
local larry5058 =setfflag("ServerMaxBandwith", "52")
local larry5059 =setfflag("PhysicsSenderMaxBandwidthBps", "20000")
local larry5060 =setfflag("MaxTimestepMultiplierBuoyancy", "2147483647")
local larry5061 =setfflag("SimOwnedNOUCountThresholdMillionth", "2147483647")
local larry5062 =setfflag("MaxMissedWorldStepsRemembered", "-2147483648")
local larry5063 =setfflag("CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth", "1")
local larry5064 =setfflag("StreamJobNOUVolumeLengthCap", "2147483647")
local larry5065 =setfflag("DebugSendDistInSteps", "-2147483648")
local larry5066 =setfflag("MaxTimestepMultiplierAcceleration", "2147483647")
local larry5067 =setfflag("LargeReplicatorRead5", "true")
local larry5068 =setfflag("SimExplicitlyCappedTimestepMultiplier", "2147483646")
local larry5069 =setfflag("GameNetDontSendRedundantNumTimes", "1")
local larry5070 =setfflag("CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent", "1")
local larry5071 =setfflag("CheckPVCachedRotVelThresholdPercent", "10")
local larry5072 =setfflag("LargeReplicatorSerializeRead3", "true")
local larry5073 =setfflag("ReplicationFocusNouExtentsSizeCutoffForPauseStuds", "2147483647")
local larry5074 =setfflag("NextGenReplicatorEnabledWrite4", "true")
local larry5075 =setfflag("CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth", "1")
local larry5076 =setfflag("GameNetDontSendRedundantDeltaPositionMillionth", "1")
local larry5077 =setfflag("InterpolationFrameVelocityThresholdMillionth", "5")
local larry5078 =setfflag("StreamJobNOUVolumeCap", "2147483647")
local larry5079 =setfflag("InterpolationFrameRotVelocityThresholdMillionth", "5")
local larry5080 =setfflag("WorldStepMax", "30")
local larry5081 =setfflag("TimestepArbiterHumanoidLinearVelThreshold", "1")
local larry5082 =setfflag("InterpolationFramePositionThresholdMillionth", "5")
local larry5083 =setfflag("TimestepArbiterHumanoidTurningVelThreshold", "1")
local larry5084 =setfflag("MaxTimestepMultiplierContstraint", "2147483647")
local larry5085 =setfflag("GameNetPVHeaderLinearVelocityZeroCutoffExponent", "-5000")
local larry5086 =setfflag("CheckPVCachedVelThresholdPercent", "10")
local larry5087 =setfflag("TimestepArbiterOmegaThou", "1073741823")
local larry5088 =setfflag("MaxAcceptableUpdateDelay", "1")
local larry5089 =setfflag("LargeReplicatorSerializeWrite4", "true")
local larry5090 =larry5049["Character"]
local larry5091 =larry5090["FindFirstChildWhichIsA"]
local larry5092 =larry5091(larry5090, "Humanoid")
local larry5093 =larry5092["ChangeState"]
local larry5094 =Enum["HumanoidStateType"]
local larry5095 =larry5094["Dead"]
local larry5096 =larry5093(larry5092, larry5095)
local larry5097 =larry5090["ClearAllChildren"]
local larry5098 =larry5097(larry5090)
local larry5099 =Instance["new"]
local larry5100 =larry5099("Model", workspace)
larry5049["Character"] =larry5100
local _ =task.wait()
larry5049["Character"] =larry5090
local larry5101 =larry5100["Destroy"]
local larry5102 =larry5101(larry5100)
local _ =task.wait(0.2)
local larry5103=fenv["removerRoupas"]
local er =error("Luraph Script:2879: line 3: attempt to call a nil value")
end)
local larry5042 =larry5041(larry5040, function(...)
local _5043_vararg1, _5043_vararg2, _5043_vararg3, _5043_vararg4, _5043_vararg5, _5043_vararg6, _5043_vararg7, _5043_vararg8, _5043_vararg9, _5043_vararg10 = ...
larry5027["BackgroundColor3"] =larry4246
local larry5044 =task["spawn"]
local larry5045 =larry5044(function(...)
local _5046_vararg1, _5046_vararg2, _5046_vararg3, _5046_vararg4, _5046_vararg5, _5046_vararg6, _5046_vararg7, _5046_vararg8, _5046_vararg9, _5046_vararg10 = ...
local larry5047 =game["GetService"]
local larry5048 =larry5047(game, "Players")
local larry5049 =larry5048["LocalPlayer"]
local larry5050 =setfflag("GameNetPVHeaderRotationalVelocityZeroCutoffExponent", "-5000")
local larry5051 =setfflag("LargeReplicatorWrite5", "true")
local larry5052 =setfflag("LargeReplicatorEnabled9", "true")
local larry5053 =setfflag("AngularVelociryLimit", "360")
local larry5054 =setfflag("TimestepArbiterVelocityCriteriaThresholdTwoDt", "2147483646")
local larry5055 =setfflag("S2PhysicsSenderRate", "15000")
local larry5056 =setfflag("DisableDPIScale", "true")
local larry5057 =setfflag("MaxDataPacketPerSend", "2147483647")
local larry5058 =setfflag("ServerMaxBandwith", "52")
local larry5059 =setfflag("PhysicsSenderMaxBandwidthBps", "20000")
local larry5060 =setfflag("MaxTimestepMultiplierBuoyancy", "2147483647")
local larry5061 =setfflag("SimOwnedNOUCountThresholdMillionth", "2147483647")
local larry5062 =setfflag("MaxMissedWorldStepsRemembered", "-2147483648")
local larry5063 =setfflag("CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth", "1")
local larry5064 =setfflag("StreamJobNOUVolumeLengthCap", "2147483647")
local larry5065 =setfflag("DebugSendDistInSteps", "-2147483648")
local larry5066 =setfflag("MaxTimestepMultiplierAcceleration", "2147483647")
local larry5067 =setfflag("LargeReplicatorRead5", "true")
local larry5068 =setfflag("SimExplicitlyCappedTimestepMultiplier", "2147483646")
local larry5069 =setfflag("GameNetDontSendRedundantNumTimes", "1")
local larry5070 =setfflag("CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent", "1")
local larry5071 =setfflag("CheckPVCachedRotVelThresholdPercent", "10")
local larry5072 =setfflag("LargeReplicatorSerializeRead3", "true")
local larry5073 =setfflag("ReplicationFocusNouExtentsSizeCutoffForPauseStuds", "2147483647")
local larry5074 =setfflag("NextGenReplicatorEnabledWrite4", "true")
local larry5075 =setfflag("CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth", "1")
local larry5076 =setfflag("GameNetDontSendRedundantDeltaPositionMillionth", "1")
local larry5077 =setfflag("InterpolationFrameVelocityThresholdMillionth", "5")
local larry5078 =setfflag("StreamJobNOUVolumeCap", "2147483647")
local larry5079 =setfflag("InterpolationFrameRotVelocityThresholdMillionth", "5")
local larry5080 =setfflag("WorldStepMax", "30")
local larry5081 =setfflag("TimestepArbiterHumanoidLinearVelThreshold", "1")
local larry5082 =setfflag("InterpolationFramePositionThresholdMillionth", "5")
local larry5083 =setfflag("TimestepArbiterHumanoidTurningVelThreshold", "1")
local larry5084 =setfflag("MaxTimestepMultiplierContstraint", "2147483647")
local larry5085 =setfflag("GameNetPVHeaderLinearVelocityZeroCutoffExponent", "-5000")
local larry5086 =setfflag("CheckPVCachedVelThresholdPercent", "10")
local larry5087 =setfflag("TimestepArbiterOmegaThou", "1073741823")
local larry5088 =setfflag("MaxAcceptableUpdateDelay", "1")
local larry5089 =setfflag("LargeReplicatorSerializeWrite4", "true")
local larry5090 =larry5049["Character"]
local larry5091 =larry5090["FindFirstChildWhichIsA"]
local larry5092 =larry5091(larry5090, "Humanoid")
local larry5093 =larry5092["ChangeState"]
local larry5094 =Enum["HumanoidStateType"]
local larry5095 =larry5094["Dead"]
local larry5096 =larry5093(larry5092, larry5095)
local larry5097 =larry5090["ClearAllChildren"]
local larry5098 =larry5097(larry5090)
local larry5099 =Instance["new"]
local larry5100 =larry5099("Model", workspace)
larry5049["Character"] =larry5100
local _ =task.wait()
larry5049["Character"] =larry5090
local larry5101 =larry5100["Destroy"]
local larry5102 =larry5101(larry5100)
local _ =task.wait(0.2)
local larry5103=fenv["removerRoupas"]
local er =error("Luraph Script:2879: line 3: attempt to call a nil value")
end)
end)
local larry5104 =UDim2["new"]
local larry5105 =larry5104(0.42, 0, 0, 26)
local larry5106 =UDim2["new"]
local larry5107 =larry5106(0.52, 0, 0, 70)
local larry5108 =Enum["Font"]
local larry5109 =larry5108["Arcade"]
local larry5110 =Instance["new"]
local larry5111 =larry5110("TextButton")
local larry5112 =UDim["new"]
local larry5113 =larry5112(0, 6)
local larry5114 =Instance["new"]
local larry5115 =larry5114("UICorner")
local larry5116 =task["spawn"]
local _ =task.wait(0.1)
local larry5119 =larry5111["Parent"]
local larry5120 =larry5111["FindFirstChild"]
local larry5121 =larry5120(larry5111, "KeybindLabel")
local larry5122 =larry5121["Destroy"]
local larry5123 =larry5122(larry5121)
local larry5117 =larry5116(function(...)
local _5118_vararg1, _5118_vararg2, _5118_vararg3, _5118_vararg4, _5118_vararg5, _5118_vararg6, _5118_vararg7, _5118_vararg8, _5118_vararg9, _5118_vararg10 = ...
local _ =task.wait(0.1)
local larry5119 =larry5111["Parent"]
local larry5120 =larry5111["FindFirstChild"]
local larry5121 =larry5120(larry5111, "KeybindLabel")
local larry5122 =larry5121["Destroy"]
local larry5123 =larry5122(larry5121)
end)
local larry5124 =larry5111["MouseButton1Click"]
local larry5125 =larry5124["Connect"]
local larry5128 =task["delay"]
local larry5129 =larry5128(0.35, function(...)
local _5130_vararg1, _5130_vararg2, _5130_vararg3, _5130_vararg4, _5130_vararg5, _5130_vararg6, _5130_vararg7, _5130_vararg8, _5130_vararg9, _5130_vararg10 = ...

end)
local larry5131 =makefolder("MirandaTweenPlus")
local larry5132 =larry6["JSONEncode"]
local larry5133 =larry5132(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = true,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = true,
  ["nearest"] = true,
  ["antiRagdoll"] = true,
})
local _ =writefile("MirandaTweenPlus/config.json", larry5133)
local larry5134 =getrawmetatable(larry14)
local larry5135 =setreadonly(larry5134, false)
local larry5136 =larry5134["__index"]
local larry5137 =larry5134["__newindex"]
local larry5139 =larry5136(_5138_vararg1, _5138_vararg2)
local larry5141 =larry5136(_5140_vararg1, _5140_vararg2)
local larry5143 =larry5137(_5142_vararg1, _5142_vararg2, _5142_vararg3)
local larry5145 =larry5137(_5144_vararg1, _5144_vararg2, _5144_vararg3)
local larry5146 =setreadonly(larry5134, true)
local larry5147 =larry10["Heartbeat"]
local larry5148 =larry5147["Connect"]
local larry5151 =tick()
local er =error("Luraph Script:2617: line 3: attempt to compare table < number")
local larry5149 =larry5148(larry5147, function(...)
local _5150_vararg1, _5150_vararg2, _5150_vararg3, _5150_vararg4, _5150_vararg5, _5150_vararg6, _5150_vararg7, _5150_vararg8, _5150_vararg9, _5150_vararg10 = ...
local larry5151 =tick()
local larry5152 =(larry5151- 0)
local er =error("Luraph Script:2617: line 3: attempt to compare table < number")
end)
local larry5153 =larry25["Character"]
local larry5154 =larry25["Character"]
local larry5155 =larry5154["FindFirstChildOfClass"]
local larry5156 =larry5155(larry5154, "Humanoid")
local larry5157 =larry18["JumpRequest"]
local larry5158 =larry5157["Connect"]
local larry5161 =larry25["Character"]
local larry5162 =larry25["Character"]
local larry5163 =larry5162["FindFirstChildOfClass"]
local larry5164 =larry5163(larry5162, "Humanoid")
local larry5165 =larry5164["GetState"]
local larry5166 =larry5165(larry5164)
local larry5167 =Enum["HumanoidStateType"]
local larry5168 =larry5167["Seated"]
local larry5170 =larry25["Character"]
local larry5171 =larry5170["FindFirstChild"]
local larry5172 =larry5171(larry5170, "HumanoidRootPart")
local larry5173 =Vector3["new"]
local larry5174 =larry5172["Velocity"]
local larry5175 =larry5174["X"]
local larry5176 =larry5164["JumpPower"]
local larry5177 =larry5172["Velocity"]
local larry5178 =larry5177["Z"]
local larry5179 =larry5173(larry5175, larry5176, larry5178)
local larry5159 =larry5158(larry5157, function(...)
local _5160_vararg1, _5160_vararg2, _5160_vararg3, _5160_vararg4, _5160_vararg5, _5160_vararg6, _5160_vararg7, _5160_vararg8, _5160_vararg9, _5160_vararg10 = ...
local larry5161 =larry25["Character"]
local larry5162 =larry25["Character"]
local larry5163 =larry5162["FindFirstChildOfClass"]
local larry5164 =larry5163(larry5162, "Humanoid")
local larry5165 =larry5164["GetState"]
local larry5166 =larry5165(larry5164)
local larry5167 =Enum["HumanoidStateType"]
local larry5168 =larry5167["Seated"]
local larry5169 =(larry5166==larry5168)
local larry5170 =larry25["Character"]
local larry5171 =larry5170["FindFirstChild"]
local larry5172 =larry5171(larry5170, "HumanoidRootPart")
local larry5173 =Vector3["new"]
local larry5174 =larry5172["Velocity"]
local larry5175 =larry5174["X"]
local larry5176 =larry5164["JumpPower"]
local larry5177 =larry5172["Velocity"]
local larry5178 =larry5177["Z"]
local larry5179 =larry5173(larry5175, larry5176, larry5178)
larry5172["Velocity"] =larry5179
end)
local larry5180 =larry25["CharacterAdded"]
local larry5181 =larry5180["Connect"]
local _ =task.wait(0.5)
local larry5184 =larry25["Character"]
local larry5185 =larry25["Character"]
local larry5186 =larry5185["FindFirstChildOfClass"]
local larry5187 =larry5186(larry5185, "Humanoid")
local larry5182 =larry5181(larry5180, function(...)
local _5183_vararg1, _5183_vararg2, _5183_vararg3, _5183_vararg4, _5183_vararg5, _5183_vararg6, _5183_vararg7, _5183_vararg8, _5183_vararg9, _5183_vararg10 = ...
local _ =task.wait(0.5)
local larry5184 =larry25["Character"]
local larry5185 =larry25["Character"]
local larry5186 =larry5185["FindFirstChildOfClass"]
local larry5187 =larry5186(larry5185, "Humanoid")
larry5187["JumpPower"] =35
larry5187["UseJumpPower"] =true
end)
local larry5126 =larry5125(larry5124, function(...)
local _5127_vararg1, _5127_vararg2, _5127_vararg3, _5127_vararg4, _5127_vararg5, _5127_vararg6, _5127_vararg7, _5127_vararg8, _5127_vararg9, _5127_vararg10 = ...
local larry5128 =task["delay"]
local larry5129 =larry5128(0.35, function(...)
local _5130_vararg1, _5130_vararg2, _5130_vararg3, _5130_vararg4, _5130_vararg5, _5130_vararg6, _5130_vararg7, _5130_vararg8, _5130_vararg9, _5130_vararg10 = ...

end)
local larry5131 =makefolder("MirandaTweenPlus")
local larry5132 =larry6["JSONEncode"]
local larry5133 =larry5132(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = true,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = false,
  ["roupa"] = true,
  ["nearest"] = true,
  ["antiRagdoll"] = true,
})
local _ =writefile("MirandaTweenPlus/config.json", larry5133)
local larry5134 =getrawmetatable(larry14)
local larry5135 =setreadonly(larry5134, false)
local larry5136 =larry5134["__index"]
local larry5137 =larry5134["__newindex"]
larry5134["__index"] =function(...)
local _5140_vararg1, _5140_vararg2, _5140_vararg3, _5140_vararg4, _5140_vararg5, _5140_vararg6, _5140_vararg7, _5140_vararg8, _5140_vararg9, _5140_vararg10 = ...
local larry5141 =larry5136(_5140_vararg1, _5140_vararg2)
return larry5141
end
larry5134["__newindex"] =function(...)
local _5144_vararg1, _5144_vararg2, _5144_vararg3, _5144_vararg4, _5144_vararg5, _5144_vararg6, _5144_vararg7, _5144_vararg8, _5144_vararg9, _5144_vararg10 = ...
local larry5145 =larry5137(_5144_vararg1, _5144_vararg2, _5144_vararg3)
return larry5145
end
local larry5146 =setreadonly(larry5134, true)
larry14["Gravity"] =65
local larry5147 =larry10["Heartbeat"]
local larry5148 =larry5147["Connect"]
local larry5149 =larry5148(larry5147, function(...)
local _5150_vararg1, _5150_vararg2, _5150_vararg3, _5150_vararg4, _5150_vararg5, _5150_vararg6, _5150_vararg7, _5150_vararg8, _5150_vararg9, _5150_vararg10 = ...
local larry5151 =tick()
local larry5152 =(larry5151- 0)
local er =error("Luraph Script:2617: line 3: attempt to compare table < number")
end)
local larry5153 =larry25["Character"]
local larry5154 =larry25["Character"]
local larry5155 =larry5154["FindFirstChildOfClass"]
local larry5156 =larry5155(larry5154, "Humanoid")
larry5156["JumpPower"] =35
larry5156["UseJumpPower"] =true
local larry5157 =larry18["JumpRequest"]
local larry5158 =larry5157["Connect"]
local larry5159 =larry5158(larry5157, function(...)
local _5160_vararg1, _5160_vararg2, _5160_vararg3, _5160_vararg4, _5160_vararg5, _5160_vararg6, _5160_vararg7, _5160_vararg8, _5160_vararg9, _5160_vararg10 = ...
local larry5161 =larry25["Character"]
local larry5162 =larry25["Character"]
local larry5163 =larry5162["FindFirstChildOfClass"]
local larry5164 =larry5163(larry5162, "Humanoid")
local larry5165 =larry5164["GetState"]
local larry5166 =larry5165(larry5164)
local larry5167 =Enum["HumanoidStateType"]
local larry5168 =larry5167["Seated"]
local larry5169 =(larry5166==larry5168)
local larry5170 =larry25["Character"]
local larry5171 =larry5170["FindFirstChild"]
local larry5172 =larry5171(larry5170, "HumanoidRootPart")
local larry5173 =Vector3["new"]
local larry5174 =larry5172["Velocity"]
local larry5175 =larry5174["X"]
local larry5176 =larry5164["JumpPower"]
local larry5177 =larry5172["Velocity"]
local larry5178 =larry5177["Z"]
local larry5179 =larry5173(larry5175, larry5176, larry5178)
larry5172["Velocity"] =larry5179
end)
local larry5180 =larry25["CharacterAdded"]
local larry5181 =larry5180["Connect"]
local larry5182 =larry5181(larry5180, function(...)
local _5183_vararg1, _5183_vararg2, _5183_vararg3, _5183_vararg4, _5183_vararg5, _5183_vararg6, _5183_vararg7, _5183_vararg8, _5183_vararg9, _5183_vararg10 = ...
local _ =task.wait(0.5)
local larry5184 =larry25["Character"]
local larry5185 =larry25["Character"]
local larry5186 =larry5185["FindFirstChildOfClass"]
local larry5187 =larry5186(larry5185, "Humanoid")
larry5187["JumpPower"] =35
larry5187["UseJumpPower"] =true
end)
larry5111["BackgroundColor3"] =larry4246
end)
local larry5188 =UDim2["new"]
local larry5189 =larry5188(0.42, 0, 0, 26)
local larry5190 =UDim2["new"]
local larry5191 =larry5190(0.06, 0, 0, 70)
local larry5192 =Enum["Font"]
local larry5193 =larry5192["Arcade"]
local larry5194 =Instance["new"]
local larry5195 =larry5194("TextButton")
local larry5196 =UDim["new"]
local larry5197 =larry5196(0, 6)
local larry5198 =Instance["new"]
local larry5199 =larry5198("UICorner")
local larry5200 =task["spawn"]
local _ =task.wait(0.1)
local larry5203 =larry5195["Parent"]
local larry5204 =larry5195["FindFirstChild"]
local larry5205 =larry5204(larry5195, "KeybindLabel")
local larry5206 =larry5205["Destroy"]
local larry5207 =larry5206(larry5205)
local larry5201 =larry5200(function(...)
local _5202_vararg1, _5202_vararg2, _5202_vararg3, _5202_vararg4, _5202_vararg5, _5202_vararg6, _5202_vararg7, _5202_vararg8, _5202_vararg9, _5202_vararg10 = ...
local _ =task.wait(0.1)
local larry5203 =larry5195["Parent"]
local larry5204 =larry5195["FindFirstChild"]
local larry5205 =larry5204(larry5195, "KeybindLabel")
local larry5206 =larry5205["Destroy"]
local larry5207 =larry5206(larry5205)
end)
local larry5208 =larry5195["MouseButton1Click"]
local larry5209 =larry5208["Connect"]
local larry5212 =task["delay"]
local larry5213 =larry5212(0.35, function(...)
local _5214_vararg1, _5214_vararg2, _5214_vararg3, _5214_vararg4, _5214_vararg5, _5214_vararg6, _5214_vararg7, _5214_vararg8, _5214_vararg9, _5214_vararg10 = ...

end)
local larry5215 =makefolder("MirandaTweenPlus")
local larry5216 =larry6["JSONEncode"]
local larry5217 =larry5216(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = true,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = true,
  ["roupa"] = true,
  ["nearest"] = true,
  ["antiRagdoll"] = true,
})
local _ =writefile("MirandaTweenPlus/config.json", larry5217)
local larry5218 =larry10["Heartbeat"]
local larry5219 =larry5218["Connect"]
local larry5222 =tick()
local er =error("Luraph Script:2920: line 3: attempt to compare table < number")
local larry5220 =larry5219(larry5218, function(...)
local _5221_vararg1, _5221_vararg2, _5221_vararg3, _5221_vararg4, _5221_vararg5, _5221_vararg6, _5221_vararg7, _5221_vararg8, _5221_vararg9, _5221_vararg10 = ...
local larry5222 =tick()
local larry5223 =(larry5222- 0)
local er =error("Luraph Script:2920: line 3: attempt to compare table < number")
end)
local larry5210 =larry5209(larry5208, function(...)
local _5211_vararg1, _5211_vararg2, _5211_vararg3, _5211_vararg4, _5211_vararg5, _5211_vararg6, _5211_vararg7, _5211_vararg8, _5211_vararg9, _5211_vararg10 = ...
local larry5212 =task["delay"]
local larry5213 =larry5212(0.35, function(...)
local _5214_vararg1, _5214_vararg2, _5214_vararg3, _5214_vararg4, _5214_vararg5, _5214_vararg6, _5214_vararg7, _5214_vararg8, _5214_vararg9, _5214_vararg10 = ...

end)
local larry5215 =makefolder("MirandaTweenPlus")
local larry5216 =larry6["JSONEncode"]
local larry5217 =larry5216(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = true,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = true,
  ["roupa"] = true,
  ["nearest"] = true,
  ["antiRagdoll"] = true,
})
local _ =writefile("MirandaTweenPlus/config.json", larry5217)
larry5195["BackgroundColor3"] =larry4246
local larry5218 =larry10["Heartbeat"]
local larry5219 =larry5218["Connect"]
local larry5220 =larry5219(larry5218, function(...)
local _5221_vararg1, _5221_vararg2, _5221_vararg3, _5221_vararg4, _5221_vararg5, _5221_vararg6, _5221_vararg7, _5221_vararg8, _5221_vararg9, _5221_vararg10 = ...
local larry5222 =tick()
local larry5223 =(larry5222- 0)
local er =error("Luraph Script:2920: line 3: attempt to compare table < number")
end)
end)
local larry5224 =task["defer"]
local larry5227 =larry5149["Disconnect"]
local larry5228 =larry5227(larry5149)
local larry5229 =getrawmetatable(larry14)
local larry5230 =setreadonly(larry5229, false)
local larry5231 =setreadonly(larry5229, true)
local larry5232 =larry5159["Disconnect"]
local larry5233 =larry5232(larry5159)
local larry5234 =larry5182["Disconnect"]
local larry5235 =larry5234(larry5182)
local larry5225 =larry5224(function(...)
local _5226_vararg1, _5226_vararg2, _5226_vararg3, _5226_vararg4, _5226_vararg5, _5226_vararg6, _5226_vararg7, _5226_vararg8, _5226_vararg9, _5226_vararg10 = ...
local larry5227 =larry5149["Disconnect"]
local larry5228 =larry5227(larry5149)
local larry5229 =getrawmetatable(larry14)
local larry5230 =setreadonly(larry5229, false)
local larry5231 =setreadonly(larry5229, true)
local larry5232 =larry5159["Disconnect"]
local larry5233 =larry5232(larry5159)
local larry5234 =larry5182["Disconnect"]
local larry5235 =larry5234(larry5182)
larry14["Gravity"] =196.2
larry5111["BackgroundColor3"] =larry4246
end)
local larry5236 =task["defer"]
local larry5239 =larry5220["Disconnect"]
local larry5240 =larry5239(larry5220)
local larry5241 =larry10["Heartbeat"]
local larry5242 =larry5241["Connect"]
local larry5245 =tick()
local er =error("Luraph Script:2954: line 3: attempt to compare table < number")
local larry5243 =larry5242(larry5241, function(...)
local _5244_vararg1, _5244_vararg2, _5244_vararg3, _5244_vararg4, _5244_vararg5, _5244_vararg6, _5244_vararg7, _5244_vararg8, _5244_vararg9, _5244_vararg10 = ...
local larry5245 =tick()
local larry5246 =(larry5245- 0)
local er =error("Luraph Script:2954: line 3: attempt to compare table < number")
end)
local larry5237 =larry5236(function(...)
local _5238_vararg1, _5238_vararg2, _5238_vararg3, _5238_vararg4, _5238_vararg5, _5238_vararg6, _5238_vararg7, _5238_vararg8, _5238_vararg9, _5238_vararg10 = ...
larry5195["BackgroundColor3"] =larry4246
local larry5239 =larry5220["Disconnect"]
local larry5240 =larry5239(larry5220)
local larry5241 =larry10["Heartbeat"]
local larry5242 =larry5241["Connect"]
local larry5243 =larry5242(larry5241, function(...)
local _5244_vararg1, _5244_vararg2, _5244_vararg3, _5244_vararg4, _5244_vararg5, _5244_vararg6, _5244_vararg7, _5244_vararg8, _5244_vararg9, _5244_vararg10 = ...
local larry5245 =tick()
local larry5246 =(larry5245- 0)
local er =error("Luraph Script:2954: line 3: attempt to compare table < number")
end)
end)
local larry5247 =game["GetService"]
local larry5248 =larry5247(game, "Workspace")
local larry5249 =game["GetService"]
local larry5250 =larry5249(game, "RunService")
local larry5251 =larry5250["Heartbeat"]
local larry5252 =larry5251["Connect"]
local larry5253 =larry5252(larry5251, function(...)
local _5254_vararg1, _5254_vararg2, _5254_vararg3, _5254_vararg4, _5254_vararg5, _5254_vararg6, _5254_vararg7, _5254_vararg8, _5254_vararg9, _5254_vararg10 = ...

end)
local larry5255 =game["GetService"]
local larry5256 =larry5255(game, "ProximityPromptService")
local larry5257 =larry25["GetAttribute"]
local larry5258 =larry5257(larry25, "Stealing")
local larry5259 =larry25["AttributeChanged"]
local larry5260 =larry5259["Connect"]
local larry5261 =larry5260(larry5259, function(...)
local _5262_vararg1, _5262_vararg2, _5262_vararg3, _5262_vararg4, _5262_vararg5, _5262_vararg6, _5262_vararg7, _5262_vararg8, _5262_vararg9, _5262_vararg10 = ...

end)
local larry5264 =Enum["KeyCode"]
local larry5265 =larry5264["G"]
local larry5266 =Vector3["new"]
local larry5267 =larry5266(-478.81, 0, 222)
local larry5268 =Vector3["new"]
local larry5269 =larry5268(-340.7, 0, 222)
local larry5270 =Vector3["new"]
local larry5271 =larry5270(-478.81, 0, 113)
local larry5272 =Vector3["new"]
local larry5273 =larry5272(-340.7, 0, 113)
local larry5274 =Vector3["new"]
local larry5275 =larry5274(-478.81, 0, 6.51)
local larry5276 =Vector3["new"]
local larry5277 =larry5276(-340.7, 0, 6.51)
local larry5278 =Vector3["new"]
local larry5279 =larry5278(-478.81, 0, -101.1)
local larry5280 =Vector3["new"]
local larry5281 =larry5280(-340.7, 0, -101.1)
local larry5283 =larry12["FindFirstChild"]
local larry5284 =larry5283(larry12, "Packages")
local larry5285 =larry5284["FindFirstChild"]
local larry5286 =larry5285(larry5284, "Net")
local larry5287 =larry5286["FindFirstChild"]
local larry5288 =larry5287(larry5286, "RF/CoinsShopService/RequestBuy")
local larry5289 =larry5288["InvokeServer"]
local larry5290 =larry5289(larry5288, "Grapple Hook")
local _ =task.wait(0.05)
local larry5291 =larry25["Character"]
local larry5292 =larry5291["FindFirstChild"]
local larry5293 =larry5292(larry5291, "HumanoidRootPart")
local larry5294 =larry5291["FindFirstChildOfClass"]
local larry5295 =larry5294(larry5291, "Humanoid")
local larry5296 =larry5295["Health"]
local er =error("Luraph Script:3298: line 3: attempt to compare number < table")
local larry5298 =larry25["Character"]
local larry5299 =larry5298["FindFirstChild"]
local larry5300 =larry5299(larry5298, "HumanoidRootPart")
local larry5301 =larry5300["Parent"]
local larry5302 =larry5300["FindFirstChild"]
local larry5303 =larry5302(larry5300, "GTB_LV")
local larry5304 =larry5303["Destroy"]
local larry5305 =larry5304(larry5303)
local larry5306 =larry5300["FindFirstChild"]
local larry5307 =larry5306(larry5300, "GTB_AO")
local larry5308 =larry5307["Destroy"]
local larry5309 =larry5308(larry5307)
local larry5310 =larry5300["FindFirstChild"]
local larry5311 =larry5310(larry5300, "GTB_Att")
local larry5312 =larry5311["Destroy"]
local larry5313 =larry5312(larry5311)
local larry5316 =Color3["fromRGB"]
local larry5317 =larry5316(60, 200, 60)
local er =error("Luraph Script:3360: line 3: attempt to index nil with 'BackgroundColor3'")
local larry5319 =Color3["fromRGB"]
local larry5320 =larry5319(60, 200, 60)
local er =error("Luraph Script:3371: line 3: attempt to index nil with 'BackgroundColor3'")
local larry5323 =Instance["new"]
local larry5324 =larry5323("Attachment")
local larry5325 =Instance["new"]
local larry5326 =larry5325("AlignPosition")
local larry5327 =Enum["PositionAlignmentMode"]
local larry5328 =larry5327["OneAttachment"]
local larry5329 =_5322_vararg1["Position"]
local larry5330 =Enum["ForceLimitMode"]
local larry5331 =larry5330["PerAxis"]
local larry5332 =Vector3["new"]
local larry5333 =larry5332(1/0, 0, 1/0)
local larry5334 =Instance["new"]
local larry5335 =larry5334("AlignOrientation")
local larry5336 =Enum["OrientationAlignmentMode"]
local larry5337 =larry5336["OneAttachment"]
local larry5338 =_5322_vararg1["CFrame"]
local larry5339 =Instance["new"]
local larry5340 =larry5339("LinearVelocity")
local larry5341 =Enum["ForceLimitMode"]
local larry5342 =larry5341["PerAxis"]
local larry5343 =Vector3["new"]
local larry5344 =larry5343(0, 1/0, 0)
local larry5345 =Vector3["new"]
local larry5346 =larry5345(0, 0, 0)
local larry5348 =larry25["Character"]
local larry5349 =larry5348["FindFirstChild"]
local larry5350 =larry5349(larry5348, "Head")
local larry5351 =RaycastParams["new"]
local larry5352 =larry5351()
local larry5353 =Enum["RaycastFilterType"]
local larry5354 =larry5353["Exclude"]
local larry5355 =larry14["Raycast"]
local larry5356 =larry5350["Position"]
local larry5357 =Vector3["new"]
local larry5358 =larry5357(0, 2, 0)
local larry5359 =larry5355(larry14, larry5356, larry5358, larry5352)
local larry5361 =larry25["Character"]
local larry5362 =larry5361["FindFirstChildOfClass"]
local larry5363 =larry5362(larry5361, "Humanoid")
local larry5364 =larry25["Character"]
local larry5365 =larry5364["FindFirstChild"]
local larry5366 =larry5365(larry5364, "HumanoidRootPart")
local larry5367 =larry5363["Health"]
local er =error("Luraph Script:3558: line 3: attempt to compare number < table")
local larry5369 =larry14["FindFirstChild"]
local larry5370 =larry5369(larry14, "Plots")
local larry5371 =task["spawn"]
local larry5374 =larry5370["GetChildren"]
local larry5375 =larry5374(larry5370)
local larry5377 =_5376_2["FindFirstChild"]
local larry5378 =larry5377(_5376_2, "Decorations")
local larry5379 =_5376_2["FindFirstChild"]
local larry5380 =larry5379(_5376_2, "AnimalPodiums")
local larry5381 =larry5378["GetDescendants"]
local larry5382 =larry5381(larry5378)
local larry5384 =_5383_2["IsA"]
local larry5385 =larry5384(_5383_2, "BasePart")
local larry5386 =larry5380["GetDescendants"]
local larry5387 =larry5386(larry5380)
local larry5389 =_5388_2["IsA"]
local larry5390 =larry5389(_5388_2, "BasePart")
local larry5372 =larry5371(function(...)
local _5373_vararg1, _5373_vararg2, _5373_vararg3, _5373_vararg4, _5373_vararg5, _5373_vararg6, _5373_vararg7, _5373_vararg8, _5373_vararg9, _5373_vararg10 = ...
local larry5374 =larry5370["GetChildren"]
local larry5375 =larry5374(larry5370)
for larry5376, _5376_2 in ipairs(larry5375) do
local larry5377 =_5376_2["FindFirstChild"]
local larry5378 =larry5377(_5376_2, "Decorations")
local larry5379 =_5376_2["FindFirstChild"]
local larry5380 =larry5379(_5376_2, "AnimalPodiums")
local larry5381 =larry5378["GetDescendants"]
local larry5382 =larry5381(larry5378)
for larry5383, _5383_2 in ipairs(larry5382) do
local larry5384 =_5383_2["IsA"]
local larry5385 =larry5384(_5383_2, "BasePart")
_5383_2["LocalTransparencyModifier"] =0.8
end
local larry5386 =larry5380["GetDescendants"]
local larry5387 =larry5386(larry5380)
for larry5388, _5388_2 in ipairs(larry5387) do
local larry5389 =_5388_2["IsA"]
local larry5390 =larry5389(_5388_2, "BasePart")
_5388_2["LocalTransparencyModifier"] =0.8
end
end
end)
local larry5391 =larry5340["Destroy"]
local larry5392 =larry5391(larry5340)
local larry5393 =larry5326["Destroy"]
local larry5394 =larry5393(larry5326)
local larry5395 =larry5335["Destroy"]
local larry5396 =larry5395(larry5335)
local larry5397 =larry5324["Destroy"]
local larry5398 =larry5397(larry5324)
local larry5399 =larry25["CharacterAdded"]
local larry5400 =larry5399["Connect"]
local _ =task.wait(0.1)
local larry5403 =larry14["FindFirstChild"]
local larry5404 =larry5403(larry14, "Plots")
local larry5405 =task["spawn"]
local larry5408 =larry5404["GetChildren"]
local larry5409 =larry5408(larry5404)
local larry5411 =_5410_2["FindFirstChild"]
local larry5412 =larry5411(_5410_2, "Decorations")
local larry5413 =_5410_2["FindFirstChild"]
local larry5414 =larry5413(_5410_2, "AnimalPodiums")
local larry5415 =larry5412["GetDescendants"]
local larry5416 =larry5415(larry5412)
local larry5418 =_5417_2["IsA"]
local larry5419 =larry5418(_5417_2, "BasePart")
local larry5420 =larry5414["GetDescendants"]
local larry5421 =larry5420(larry5414)
local larry5423 =_5422_2["IsA"]
local larry5424 =larry5423(_5422_2, "BasePart")
local larry5406 =larry5405(function(...)
local _5407_vararg1, _5407_vararg2, _5407_vararg3, _5407_vararg4, _5407_vararg5, _5407_vararg6, _5407_vararg7, _5407_vararg8, _5407_vararg9, _5407_vararg10 = ...
local larry5408 =larry5404["GetChildren"]
local larry5409 =larry5408(larry5404)
for larry5410, _5410_2 in ipairs(larry5409) do
local larry5411 =_5410_2["FindFirstChild"]
local larry5412 =larry5411(_5410_2, "Decorations")
local larry5413 =_5410_2["FindFirstChild"]
local larry5414 =larry5413(_5410_2, "AnimalPodiums")
local larry5415 =larry5412["GetDescendants"]
local larry5416 =larry5415(larry5412)
for larry5417, _5417_2 in ipairs(larry5416) do
local larry5418 =_5417_2["IsA"]
local larry5419 =larry5418(_5417_2, "BasePart")
_5417_2["LocalTransparencyModifier"] =0.8
end
local larry5420 =larry5414["GetDescendants"]
local larry5421 =larry5420(larry5414)
for larry5422, _5422_2 in ipairs(larry5421) do
local larry5423 =_5422_2["IsA"]
local larry5424 =larry5423(_5422_2, "BasePart")
_5422_2["LocalTransparencyModifier"] =0.8
end
end
end)
local larry5425 =larry25["Character"]
local larry5426 =larry5425["FindFirstChild"]
local larry5427 =larry5426(larry5425, "HumanoidRootPart")
local larry5428 =larry5427["Parent"]
local larry5429 =larry5427["FindFirstChild"]
local larry5430 =larry5429(larry5427, "GTB_LV")
local larry5431 =larry5430["Destroy"]
local larry5432 =larry5431(larry5430)
local larry5433 =larry5427["FindFirstChild"]
local larry5434 =larry5433(larry5427, "GTB_AO")
local larry5435 =larry5434["Destroy"]
local larry5436 =larry5435(larry5434)
local larry5437 =larry5427["FindFirstChild"]
local larry5438 =larry5437(larry5427, "GTB_Att")
local larry5439 =larry5438["Destroy"]
local larry5440 =larry5439(larry5438)
local larry5401 =larry5400(larry5399, function(...)
local _5402_vararg1, _5402_vararg2, _5402_vararg3, _5402_vararg4, _5402_vararg5, _5402_vararg6, _5402_vararg7, _5402_vararg8, _5402_vararg9, _5402_vararg10 = ...
local _ =task.wait(0.1)
local larry5403 =larry14["FindFirstChild"]
local larry5404 =larry5403(larry14, "Plots")
local larry5405 =task["spawn"]
local larry5406 =larry5405(function(...)
local _5407_vararg1, _5407_vararg2, _5407_vararg3, _5407_vararg4, _5407_vararg5, _5407_vararg6, _5407_vararg7, _5407_vararg8, _5407_vararg9, _5407_vararg10 = ...
local larry5408 =larry5404["GetChildren"]
local larry5409 =larry5408(larry5404)
for larry5410, _5410_2 in ipairs(larry5409) do
local larry5411 =_5410_2["FindFirstChild"]
local larry5412 =larry5411(_5410_2, "Decorations")
local larry5413 =_5410_2["FindFirstChild"]
local larry5414 =larry5413(_5410_2, "AnimalPodiums")
local larry5415 =larry5412["GetDescendants"]
local larry5416 =larry5415(larry5412)
for larry5417, _5417_2 in ipairs(larry5416) do
local larry5418 =_5417_2["IsA"]
local larry5419 =larry5418(_5417_2, "BasePart")
_5417_2["LocalTransparencyModifier"] =0.8
end
local larry5420 =larry5414["GetDescendants"]
local larry5421 =larry5420(larry5414)
for larry5422, _5422_2 in ipairs(larry5421) do
local larry5423 =_5422_2["IsA"]
local larry5424 =larry5423(_5422_2, "BasePart")
_5422_2["LocalTransparencyModifier"] =0.8
end
end
end)
local larry5425 =larry25["Character"]
local larry5426 =larry5425["FindFirstChild"]
local larry5427 =larry5426(larry5425, "HumanoidRootPart")
local larry5428 =larry5427["Parent"]
local larry5429 =larry5427["FindFirstChild"]
local larry5430 =larry5429(larry5427, "GTB_LV")
local larry5431 =larry5430["Destroy"]
local larry5432 =larry5431(larry5430)
local larry5433 =larry5427["FindFirstChild"]
local larry5434 =larry5433(larry5427, "GTB_AO")
local larry5435 =larry5434["Destroy"]
local larry5436 =larry5435(larry5434)
local larry5437 =larry5427["FindFirstChild"]
local larry5438 =larry5437(larry5427, "GTB_Att")
local larry5439 =larry5438["Destroy"]
local larry5440 =larry5439(larry5438)
end)
local larry5441 =larry25["CharacterRemoving"]
local larry5442 =larry5441["Connect"]
local er =error("Luraph Script:3736: line 3: attempt to call a nil value")
local larry5443 =larry5442(larry5441, function(...)
local _5444_vararg1, _5444_vararg2, _5444_vararg3, _5444_vararg4, _5444_vararg5, _5444_vararg6, _5444_vararg7, _5444_vararg8, _5444_vararg9, _5444_vararg10 = ...
local larry5445=fenv["stopAutoLaser"]
local er =error("Luraph Script:3736: line 3: attempt to call a nil value")
end)
local larry5446 =larry10["Heartbeat"]
local larry5447 =larry5446["Connect"]
local larry5448 =larry5447(larry5446, function(...)
local _5449_vararg1, _5449_vararg2, _5449_vararg3, _5449_vararg4, _5449_vararg5, _5449_vararg6, _5449_vararg7, _5449_vararg8, _5449_vararg9, _5449_vararg10 = ...

end)
local larry5450 =larry25["CharacterAdded"]
local larry5451 =larry5450["Connect"]
local larry5454 =_5453_vararg1["WaitForChild"]
local larry5455 =larry5454(_5453_vararg1, "Humanoid", 5)
local larry5456 =larry5455["Died"]
local larry5457 =larry5456["Connect"]
local larry5458 =larry5457(larry5456, function(...)
local _5459_vararg1, _5459_vararg2, _5459_vararg3, _5459_vararg4, _5459_vararg5, _5459_vararg6, _5459_vararg7, _5459_vararg8, _5459_vararg9, _5459_vararg10 = ...

end)
local larry5452 =larry5451(larry5450, function(...)
local _5453_vararg1, _5453_vararg2, _5453_vararg3, _5453_vararg4, _5453_vararg5, _5453_vararg6, _5453_vararg7, _5453_vararg8, _5453_vararg9, _5453_vararg10 = ...
local larry5454 =_5453_vararg1["WaitForChild"]
local larry5455 =larry5454(_5453_vararg1, "Humanoid", 5)
local larry5456 =larry5455["Died"]
local larry5457 =larry5456["Connect"]
local larry5458 =larry5457(larry5456, function(...)
local _5459_vararg1, _5459_vararg2, _5459_vararg3, _5459_vararg4, _5459_vararg5, _5459_vararg6, _5459_vararg7, _5459_vararg8, _5459_vararg9, _5459_vararg10 = ...

end)
end)
local larry5460 =UDim2["new"]
local larry5461 =larry5460(0.88, 0, 0, 26)
local larry5462 =UDim2["new"]
local larry5463 =larry5462(0.06, 0, 0, 102)
local larry5464 =Enum["Font"]
local larry5465 =larry5464["Arcade"]
local larry5466 =Instance["new"]
local larry5467 =larry5466("TextButton")
local larry5468 =UDim["new"]
local larry5469 =larry5468(0, 6)
local larry5470 =Instance["new"]
local larry5471 =larry5470("UICorner")
local larry5472 =task["spawn"]
local _ =task.wait(0.1)
local larry5475 =larry5467["Parent"]
local larry5476 =larry5467["FindFirstChild"]
local larry5477 =larry5476(larry5467, "KeybindLabel")
local larry5478 =larry5477["Destroy"]
local larry5479 =larry5478(larry5477)
local larry5473 =larry5472(function(...)
local _5474_vararg1, _5474_vararg2, _5474_vararg3, _5474_vararg4, _5474_vararg5, _5474_vararg6, _5474_vararg7, _5474_vararg8, _5474_vararg9, _5474_vararg10 = ...
local _ =task.wait(0.1)
local larry5475 =larry5467["Parent"]
local larry5476 =larry5467["FindFirstChild"]
local larry5477 =larry5476(larry5467, "KeybindLabel")
local larry5478 =larry5477["Destroy"]
local larry5479 =larry5478(larry5477)
end)
local larry5480 =larry5467["MouseButton1Click"]
local larry5481 =larry5480["Connect"]
local larry5484 =task["delay"]
local larry5485 =larry5484(0.35, function(...)
local _5486_vararg1, _5486_vararg2, _5486_vararg3, _5486_vararg4, _5486_vararg5, _5486_vararg6, _5486_vararg7, _5486_vararg8, _5486_vararg9, _5486_vararg10 = ...

end)
local larry5487 =makefolder("MirandaTweenPlus")
local larry5488 =larry6["JSONEncode"]
local larry5489 =larry5488(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = true,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = true,
  ["roupa"] = true,
  ["nearest"] = true,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry5489)
local larry5490 =larry3270["Disconnect"]
local larry5491 =larry5490(larry3270)
local larry5492 =larry3275["Disconnect"]
local larry5493 =larry5492(larry3275)
local larry5494 =larry3335["Disconnect"]
local larry5495 =larry5494(larry3335)
local larry5496 =larry3340["Disconnect"]
local larry5497 =larry5496(larry3340)
local larry5498 =larry3328["Disconnect"]
local larry5499 =larry5498(larry3328)
local larry5500 =larry3398["Disconnect"]
local larry5501 =larry5500(larry3398)
local larry5502 =larry3403["Disconnect"]
local larry5503 =larry5502(larry3403)
local larry5504 =larry3466["Disconnect"]
local larry5505 =larry5504(larry3466)
local larry5506 =larry3471["Disconnect"]
local larry5507 =larry5506(larry3471)
local larry5508 =larry3531["Disconnect"]
local larry5509 =larry5508(larry3531)
local larry5510 =larry3536["Disconnect"]
local larry5511 =larry5510(larry3536)
local larry5512 =larry3524["Disconnect"]
local larry5513 =larry5512(larry3524)
local larry5514 =larry3594["Disconnect"]
local larry5515 =larry5514(larry3594)
local larry5516 =larry3599["Disconnect"]
local larry5517 =larry5516(larry3599)
local larry5518 =larry3456["Disconnect"]
local larry5519 =larry5518(larry3456)
local larry5482 =larry5481(larry5480, function(...)
local _5483_vararg1, _5483_vararg2, _5483_vararg3, _5483_vararg4, _5483_vararg5, _5483_vararg6, _5483_vararg7, _5483_vararg8, _5483_vararg9, _5483_vararg10 = ...
local larry5484 =task["delay"]
local larry5485 =larry5484(0.35, function(...)
local _5486_vararg1, _5486_vararg2, _5486_vararg3, _5486_vararg4, _5486_vararg5, _5486_vararg6, _5486_vararg7, _5486_vararg8, _5486_vararg9, _5486_vararg10 = ...

end)
local larry5487 =makefolder("MirandaTweenPlus")
local larry5488 =larry6["JSONEncode"]
local larry5489 =larry5488(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = true,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = false,
  ["flyToBest"] = true,
  ["hideSkin"] = false,
  ["speed"] = true,
  ["roupa"] = true,
  ["nearest"] = true,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry5489)
local larry5490 =larry3270["Disconnect"]
local larry5491 =larry5490(larry3270)
local larry5492 =larry3275["Disconnect"]
local larry5493 =larry5492(larry3275)
local larry5494 =larry3335["Disconnect"]
local larry5495 =larry5494(larry3335)
local larry5496 =larry3340["Disconnect"]
local larry5497 =larry5496(larry3340)
local larry5498 =larry3328["Disconnect"]
local larry5499 =larry5498(larry3328)
local larry5500 =larry3398["Disconnect"]
local larry5501 =larry5500(larry3398)
local larry5502 =larry3403["Disconnect"]
local larry5503 =larry5502(larry3403)
local larry5504 =larry3466["Disconnect"]
local larry5505 =larry5504(larry3466)
local larry5506 =larry3471["Disconnect"]
local larry5507 =larry5506(larry3471)
local larry5508 =larry3531["Disconnect"]
local larry5509 =larry5508(larry3531)
local larry5510 =larry3536["Disconnect"]
local larry5511 =larry5510(larry3536)
local larry5512 =larry3524["Disconnect"]
local larry5513 =larry5512(larry3524)
local larry5514 =larry3594["Disconnect"]
local larry5515 =larry5514(larry3594)
local larry5516 =larry3599["Disconnect"]
local larry5517 =larry5516(larry3599)
local larry5518 =larry3456["Disconnect"]
local larry5519 =larry5518(larry3456)
larry2822["BackgroundColor3"] =larry37
larry5467["BackgroundColor3"] =larry4246
end)
local larry5520 =UDim2["new"]
local larry5521 =larry5520(0.72, 0, 0, 26)
local larry5522 =UDim2["new"]
local larry5523 =larry5522(0.06, 0, 0, 134)
local larry5524 =Enum["Font"]
local larry5525 =larry5524["Arcade"]
local larry5526 =Instance["new"]
local larry5527 =larry5526("TextButton")
local larry5528 =UDim["new"]
local larry5529 =larry5528(0, 6)
local larry5530 =Instance["new"]
local larry5531 =larry5530("UICorner")
local larry5532 =larry5527["MouseButton1Click"]
local larry5533 =larry5532["Connect"]
local larry5536 =larry207["GetChildren"]
local larry5537 =larry5536(larry207)
local larry5539 =_5538_2["GetAttribute"]
local larry5540 =larry5539(_5538_2, "Tier")
local larry5541 =larry197["Wait"]
local larry5542 =_5538_2["Name"]
local larry5543 =larry5541(larry197, larry5542)
local larry5544 =larry5543["Get"]
local larry5545 =larry5544(larry5543, "AnimalList")
local larry5547 =larry200["GetGeneration"]
local larry5548 =_5546_2["Index"]
local larry5549 =_5546_2["Mutation"]
local larry5550 =_5546_2["Traits"]
local larry5551 =larry5547(larry200, larry5548, larry5549, larry5550)
local larry5552 =_5538_2["FindFirstChild"]
local larry5553 =_5546_2["Index"]
local larry5554 =larry5552(_5538_2, larry5553)
local er =error("Luraph Script:3882: Luraph Script:3861: line 3: attempt to compare number < table")
local larry5534 =larry5533(larry5532, function(...)
local _5535_vararg1, _5535_vararg2, _5535_vararg3, _5535_vararg4, _5535_vararg5, _5535_vararg6, _5535_vararg7, _5535_vararg8, _5535_vararg9, _5535_vararg10 = ...
local larry5536 =larry207["GetChildren"]
local larry5537 =larry5536(larry207)
for larry5538, _5538_2 in ipairs(larry5537) do
local larry5539 =_5538_2["GetAttribute"]
local larry5540 =larry5539(_5538_2, "Tier")
local larry5541 =larry197["Wait"]
local larry5542 =_5538_2["Name"]
local larry5543 =larry5541(larry197, larry5542)
local larry5544 =larry5543["Get"]
local larry5545 =larry5544(larry5543, "AnimalList")
for larry5546, _5546_2 in pairs(larry5545) do
local larry5547 =larry200["GetGeneration"]
local larry5548 =_5546_2["Index"]
local larry5549 =_5546_2["Mutation"]
local larry5550 =_5546_2["Traits"]
local larry5551 =larry5547(larry200, larry5548, larry5549, larry5550)
local larry5552 =_5538_2["FindFirstChild"]
local larry5553 =_5546_2["Index"]
local larry5554 =larry5552(_5538_2, larry5553)
local er =error("Luraph Script:3882: Luraph Script:3861: line 3: attempt to compare number < table")
end
end
end)
local larry5555 =task["spawn"]
local _ =task.wait(0.1)
local larry5558 =larry5527["Parent"]
local larry5559 =larry5527["FindFirstChild"]
local larry5560 =larry5559(larry5527, "KeybindLabel")
local larry5561 =larry5560["Destroy"]
local larry5562 =larry5561(larry5560)
local larry5556 =larry5555(function(...)
local _5557_vararg1, _5557_vararg2, _5557_vararg3, _5557_vararg4, _5557_vararg5, _5557_vararg6, _5557_vararg7, _5557_vararg8, _5557_vararg9, _5557_vararg10 = ...
local _ =task.wait(0.1)
local larry5558 =larry5527["Parent"]
local larry5559 =larry5527["FindFirstChild"]
local larry5560 =larry5559(larry5527, "KeybindLabel")
local larry5561 =larry5560["Destroy"]
local larry5562 =larry5561(larry5560)
end)
local larry5563 =UDim2["new"]
local larry5564 =larry5563(0, 18, 0, 26)
local larry5565 =UDim2["new"]
local larry5566 =larry5565(0.8, 0, 0, 134)
local larry5567 =Enum["Font"]
local larry5568 =larry5567["Arcade"]
local larry5569 =Color3["fromRGB"]
local larry5570 =larry5569(50, 50, 50)
local larry5571 =Instance["new"]
local larry5572 =larry5571("TextButton")
local larry5573 =UDim["new"]
local larry5574 =larry5573(0, 6)
local larry5575 =Instance["new"]
local larry5576 =larry5575("UICorner")
local larry5577 =larry5572["MouseButton1Click"]
local larry5578 =larry5577["Connect"]
local larry5581 =larry25["FindFirstChild"]
local larry5582 =larry5581(larry25, "Backpack")
local larry5583 =larry25["Character"]
local larry5584 =larry5582["FindFirstChild"]
local larry5585 =larry5584(larry5582, "Flying Carpet")
local larry5586 =task["delay"]
local larry5587 =larry5586(0.35, function(...)
local _5588_vararg1, _5588_vararg2, _5588_vararg3, _5588_vararg4, _5588_vararg5, _5588_vararg6, _5588_vararg7, _5588_vararg8, _5588_vararg9, _5588_vararg10 = ...

end)
local larry5589 =makefolder("MirandaTweenPlus")
local larry5590 =larry6["JSONEncode"]
local larry5591 =larry5590(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = true,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = true,
  ["flyToBest"] = false,
  ["hideSkin"] = false,
  ["speed"] = true,
  ["roupa"] = true,
  ["nearest"] = true,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry5591)
local larry5579 =larry5578(larry5577, function(...)
local _5580_vararg1, _5580_vararg2, _5580_vararg3, _5580_vararg4, _5580_vararg5, _5580_vararg6, _5580_vararg7, _5580_vararg8, _5580_vararg9, _5580_vararg10 = ...
local larry5581 =larry25["FindFirstChild"]
local larry5582 =larry5581(larry25, "Backpack")
local larry5583 =larry25["Character"]
local larry5584 =larry5582["FindFirstChild"]
local larry5585 =larry5584(larry5582, "Flying Carpet")
local larry5586 =task["delay"]
local larry5587 =larry5586(0.35, function(...)
local _5588_vararg1, _5588_vararg2, _5588_vararg3, _5588_vararg4, _5588_vararg5, _5588_vararg6, _5588_vararg7, _5588_vararg8, _5588_vararg9, _5588_vararg10 = ...

end)
local larry5589 =makefolder("MirandaTweenPlus")
local larry5590 =larry6["JSONEncode"]
local larry5591 =larry5590(larry6, {
  ["espPlayer"] = true,
  ["xRay"] = true,
  ["espBase"] = true,
  ["infJump"] = true,
  ["reduceGraphics"] = true,
  ["stealFloorInsta"] = false,
  ["keybinds"] = {},
  ["antiDebuff"] = true,
  ["espBest"] = true,
  ["unwalk"] = true,
  ["autoKick"] = false,
  ["hasProvenCarpet"] = true,
  ["flyToBest"] = false,
  ["hideSkin"] = false,
  ["speed"] = true,
  ["roupa"] = true,
  ["nearest"] = true,
  ["antiRagdoll"] = false,
})
local _ =writefile("MirandaTweenPlus/config.json", larry5591)
larry5527["Text"] ="TP TO BEST"
local larry5592=fenv["playDesyncSuccessSound"]
end)
local larry5593 =UDim2["new"]
local larry5594 =larry5593(0.72, 0, 0, 26)
local larry5595 =UDim2["new"]
local larry5596 =larry5595(0.06, 0, 0, 166)
local larry5597 =Enum["Font"]
local larry5598 =larry5597["Arcade"]
local larry5599 =Instance["new"]
local larry5600 =larry5599("TextButton")
local larry5601 =UDim["new"]
local larry5602 =larry5601(0, 6)
local larry5603 =Instance["new"]
local larry5604 =larry5603("UICorner")
local larry5605 =larry5600["MouseButton1Click"]
local larry5606 =larry5605["Connect"]
local larry5609 =larry25["Character"]
local larry5610 =larry5609["FindFirstChildOfClass"]
local larry5611 =larry5610(larry5609, "Humanoid")
local larry5612 =larry25["Character"]
local larry5613 =larry5612["FindFirstChild"]
local larry5614 =larry5613(larry5612, "HumanoidRootPart")
local larry5615 =larry5611["Health"]
local er =error("Luraph Script:3930: Luraph Script:3558: line 3: attempt to compare number < table")
local larry5607 =larry5606(larry5605, function(...)
local _5608_vararg1, _5608_vararg2, _5608_vararg3, _5608_vararg4, _5608_vararg5, _5608_vararg6, _5608_vararg7, _5608_vararg8, _5608_vararg9, _5608_vararg10 = ...
local larry5609 =larry25["Character"]
local larry5610 =larry5609["FindFirstChildOfClass"]
local larry5611 =larry5610(larry5609, "Humanoid")
local larry5612 =larry25["Character"]
local larry5613 =larry5612["FindFirstChild"]
local larry5614 =larry5613(larry5612, "HumanoidRootPart")
local larry5615 =larry5611["Health"]
local er =error("Luraph Script:3930: Luraph Script:3558: line 3: attempt to compare number < table")
end)
local larry5616 =task["spawn"]
local _ =task.wait(0.1)
local larry5619 =larry5600["Parent"]
local larry5620 =larry5600["FindFirstChild"]
local larry5621 =larry5620(larry5600, "KeybindLabel")
local larry5622 =larry5621["Destroy"]
local larry5623 =larry5622(larry5621)
local larry5617 =larry5616(function(...)
local _5618_vararg1, _5618_vararg2, _5618_vararg3, _5618_vararg4, _5618_vararg5, _5618_vararg6, _5618_vararg7, _5618_vararg8, _5618_vararg9, _5618_vararg10 = ...
local _ =task.wait(0.1)
local larry5619 =larry5600["Parent"]
local larry5620 =larry5600["FindFirstChild"]
local larry5621 =larry5620(larry5600, "KeybindLabel")
local larry5622 =larry5621["Destroy"]
local larry5623 =larry5622(larry5621)
end)
local larry5624 =UDim2["new"]
local larry5625 =larry5624(0, 18, 0, 26)
local larry5626 =UDim2["new"]
local larry5627 =larry5626(0.8, 0, 0, 166)
local larry5628 =Enum["Font"]
local larry5629 =larry5628["Arcade"]
local larry5630 =Color3["fromRGB"]
local larry5631 =larry5630(50, 50, 50)
local larry5632 =Instance["new"]
local larry5633 =larry5632("TextButton")
local larry5634 =UDim["new"]
local larry5635 =larry5634(0, 6)
local larry5636 =Instance["new"]
local larry5637 =larry5636("UICorner")
local larry5638 =larry5633["MouseButton1Click"]
local larry5639 =larry5638["Connect"]
local larry5642 =larry25["Character"]
local larry5643 =larry25["FindFirstChild"]
local larry5644 =larry5643(larry25, "Backpack")
local larry5645 =larry5644["FindFirstChild"]
local larry5646 =larry5645(larry5644, "Witch's Broom")
local larry5640 =larry5639(larry5638, function(...)
local _5641_vararg1, _5641_vararg2, _5641_vararg3, _5641_vararg4, _5641_vararg5, _5641_vararg6, _5641_vararg7, _5641_vararg8, _5641_vararg9, _5641_vararg10 = ...
local larry5642 =larry25["Character"]
local larry5643 =larry25["FindFirstChild"]
local larry5644 =larry5643(larry25, "Backpack")
local larry5645 =larry5644["FindFirstChild"]
local larry5646 =larry5645(larry5644, "Witch's Broom")
larry5600["Text"] ="INSTA FLOOR"
end)
local larry5647 =UDim2["new"]
local larry5648 =larry5647(0, 115, 0, 198)
local larry5649 =task["spawn"]
local _ =task.wait(1)
local larry5652 =larry4236["Parent"]
local _ =task.wait(0.5)
local larry5653 =larry4236["Parent"]
local _ =task.wait(0.5)
local larry5654 =larry4236["Parent"]
local larry5650 =larry5649(function(...)
local _5651_vararg1, _5651_vararg2, _5651_vararg3, _5651_vararg4, _5651_vararg5, _5651_vararg6, _5651_vararg7, _5651_vararg8, _5651_vararg9, _5651_vararg10 = ...
local _ =task.wait(1)
local larry5652 =larry4236["Parent"]
local _ =task.wait(0.5)
local larry5653 =larry4236["Parent"]
local _ =task.wait(0.5)
local larry5654 =larry4236["Parent"]
end)
local larry5655 =larry8["GetPlayers"]
local larry5656 =larry5655(larry8)
local larry5659 =_5657_2["Character"]
local larry5660 =_5657_2["Character"]
local larry5661 =larry5660["GetChildren"]
local larry5662 =larry5661(larry5660)
local larry5664 =_5663_2["IsA"]
local larry5665 =larry5664(_5663_2, "Accessory")
local larry5666 =_5663_2["Destroy"]
local larry5667 =larry5666(_5663_2)
local larry5669 =_5657_2["CharacterAdded"]
local larry5670 =larry5669["Connect"]
local _ =task.wait(0.2)
local larry5673 =_5672_vararg1["GetChildren"]
local larry5674 =larry5673(_5672_vararg1)
local larry5676 =_5675_2["IsA"]
local larry5677 =larry5676(_5675_2, "Accessory")
local larry5678 =_5675_2["Destroy"]
local larry5679 =larry5678(_5675_2)
local larry5671 =larry5670(larry5669, function(...)
local _5672_vararg1, _5672_vararg2, _5672_vararg3, _5672_vararg4, _5672_vararg5, _5672_vararg6, _5672_vararg7, _5672_vararg8, _5672_vararg9, _5672_vararg10 = ...
local _ =task.wait(0.2)
local larry5673 =_5672_vararg1["GetChildren"]
local larry5674 =larry5673(_5672_vararg1)
for larry5675, _5675_2 in ipairs(larry5674) do
local larry5676 =_5675_2["IsA"]
local larry5677 =larry5676(_5675_2, "Accessory")
local larry5678 =_5675_2["Destroy"]
local larry5679 =larry5678(_5675_2)
end
end)
local larry5680 =larry8["PlayerAdded"]
local larry5681 =larry5680["Connect"]
local larry5686 =_5683_vararg1["CharacterAdded"]
local larry5687 =larry5686["Connect"]
local _ =task.wait(0.2)
local larry5690 =_5689_vararg1["GetChildren"]
local larry5691 =larry5690(_5689_vararg1)
local larry5693 =_5692_2["IsA"]
local larry5694 =larry5693(_5692_2, "Accessory")
local larry5695 =_5692_2["Destroy"]
local larry5696 =larry5695(_5692_2)
local larry5688 =larry5687(larry5686, function(...)
local _5689_vararg1, _5689_vararg2, _5689_vararg3, _5689_vararg4, _5689_vararg5, _5689_vararg6, _5689_vararg7, _5689_vararg8, _5689_vararg9, _5689_vararg10 = ...
local _ =task.wait(0.2)
local larry5690 =_5689_vararg1["GetChildren"]
local larry5691 =larry5690(_5689_vararg1)
for larry5692, _5692_2 in ipairs(larry5691) do
local larry5693 =_5692_2["IsA"]
local larry5694 =larry5693(_5692_2, "Accessory")
local larry5695 =_5692_2["Destroy"]
local larry5696 =larry5695(_5692_2)
end
end)
local larry5697 =_5683_vararg1["Character"]
local _ =task.wait(0.2)
local larry5698 =_5683_vararg1["Character"]
local larry5699 =larry5698["GetChildren"]
local larry5700 =larry5699(larry5698)
local larry5702 =_5701_2["IsA"]
local larry5703 =larry5702(_5701_2, "Accessory")
local larry5704 =_5701_2["Destroy"]
local larry5705 =larry5704(_5701_2)
local larry5682 =larry5681(larry5680, function(...)
local _5683_vararg1, _5683_vararg2, _5683_vararg3, _5683_vararg4, _5683_vararg5, _5683_vararg6, _5683_vararg7, _5683_vararg8, _5683_vararg9, _5683_vararg10 = ...
local larry5684 =(_5683_vararg1==larry25)
local larry5685 =(_5683_vararg1==larry25)
local larry5686 =_5683_vararg1["CharacterAdded"]
local larry5687 =larry5686["Connect"]
local larry5688 =larry5687(larry5686, function(...)
local _5689_vararg1, _5689_vararg2, _5689_vararg3, _5689_vararg4, _5689_vararg5, _5689_vararg6, _5689_vararg7, _5689_vararg8, _5689_vararg9, _5689_vararg10 = ...
local _ =task.wait(0.2)
local larry5690 =_5689_vararg1["GetChildren"]
local larry5691 =larry5690(_5689_vararg1)
for larry5692, _5692_2 in ipairs(larry5691) do
local larry5693 =_5692_2["IsA"]
local larry5694 =larry5693(_5692_2, "Accessory")
local larry5695 =_5692_2["Destroy"]
local larry5696 =larry5695(_5692_2)
end
end)
local larry5697 =_5683_vararg1["Character"]
local _ =task.wait(0.2)
local larry5698 =_5683_vararg1["Character"]
local larry5699 =larry5698["GetChildren"]
local larry5700 =larry5699(larry5698)
for larry5701, _5701_2 in ipairs(larry5700) do
local larry5702 =_5701_2["IsA"]
local larry5703 =larry5702(_5701_2, "Accessory")
local larry5704 =_5701_2["Destroy"]
local larry5705 =larry5704(_5701_2)
end
end)
local larry5706 =task["spawn"]
local _ =task.wait(120)
local larry5709 =larry8["GetPlayers"]
local larry5710 =larry5709(larry8)
local larry5713 =_5711_2["Character"]
local larry5714 =_5711_2["Character"]
local larry5715 =larry5714["GetChildren"]
local larry5716 =larry5715(larry5714)
local larry5718 =_5717_2["IsA"]
local larry5719 =larry5718(_5717_2, "Accessory")
local larry5720 =_5717_2["Destroy"]
local larry5721 =larry5720(_5717_2)
local _ =task.wait(120)
local larry5722 =larry8["GetPlayers"]
local larry5723 =larry5722(larry8)
local larry5726 =_5724_2["Character"]
local larry5727 =_5724_2["Character"]
local larry5728 =larry5727["GetChildren"]
local larry5729 =larry5728(larry5727)
local larry5731 =_5730_2["IsA"]
local larry5732 =larry5731(_5730_2, "Accessory")
local larry5733 =_5730_2["Destroy"]
local larry5734 =larry5733(_5730_2)
local _ =task.wait(120)
local larry5735 =larry8["GetPlayers"]
local larry5736 =larry5735(larry8)
local larry5739 =_5737_2["Character"]
local larry5740 =_5737_2["Character"]
local larry5741 =larry5740["GetChildren"]
local larry5742 =larry5741(larry5740)
local larry5744 =_5743_2["IsA"]
local larry5745 =larry5744(_5743_2, "Accessory")
local larry5746 =_5743_2["Destroy"]
local larry5747 =larry5746(_5743_2)
local _ =task.wait(120)
local larry5748 =larry8["GetPlayers"]
local larry5749 =larry5748(larry8)
local larry5752 =_5750_2["Character"]
local larry5753 =_5750_2["Character"]
local larry5754 =larry5753["GetChildren"]
local larry5755 =larry5754(larry5753)
local larry5757 =_5756_2["IsA"]
local larry5758 =larry5757(_5756_2, "Accessory")
local larry5759 =_5756_2["Destroy"]
local larry5760 =larry5759(_5756_2)
local _ =task.wait(120)
local larry5761 =larry8["GetPlayers"]
local larry5762 =larry5761(larry8)
local larry5765 =_5763_2["Character"]
local larry5766 =_5763_2["Character"]
local larry5767 =larry5766["GetChildren"]
local larry5768 =larry5767(larry5766)
local larry5770 =_5769_2["IsA"]
local larry5771 =larry5770(_5769_2, "Accessory")
local larry5772 =_5769_2["Destroy"]
local larry5773 =larry5772(_5769_2)
local _ =task.wait(120)
local larry5774 =larry8["GetPlayers"]
local larry5775 =larry5774(larry8)
local larry5778 =_5776_2["Character"]
local larry5779 =_5776_2["Character"]
local larry5780 =larry5779["GetChildren"]
local larry5781 =larry5780(larry5779)
local larry5783 =_5782_2["IsA"]
local larry5784 =larry5783(_5782_2, "Accessory")
local larry5785 =_5782_2["Destroy"]
local larry5786 =larry5785(_5782_2)
local _ =task.wait(120)
local larry5787 =larry8["GetPlayers"]
local larry5788 =larry5787(larry8)
local larry5791 =_5789_2["Character"]
local larry5792 =_5789_2["Character"]
local larry5793 =larry5792["GetChildren"]
local larry5794 =larry5793(larry5792)
local larry5796 =_5795_2["IsA"]
local larry5797 =larry5796(_5795_2, "Accessory")
local larry5798 =_5795_2["Destroy"]
local larry5799 =larry5798(_5795_2)
local _ =task.wait(120)
local larry5800 =larry8["GetPlayers"]
local larry5801 =larry5800(larry8)
local larry5804 =_5802_2["Character"]
local larry5805 =_5802_2["Character"]
local larry5806 =larry5805["GetChildren"]
local larry5807 =larry5806(larry5805)
local larry5809 =_5808_2["IsA"]
local larry5810 =larry5809(_5808_2, "Accessory")
local larry5811 =_5808_2["Destroy"]
local larry5812 =larry5811(_5808_2)
local _ =task.wait(120)
local larry5813 =larry8["GetPlayers"]
local larry5814 =larry5813(larry8)
local larry5817 =_5815_2["Character"]
local larry5818 =_5815_2["Character"]
local larry5819 =larry5818["GetChildren"]
local larry5820 =larry5819(larry5818)
local larry5822 =_5821_2["IsA"]
local larry5823 =larry5822(_5821_2, "Accessory")
local larry5824 =_5821_2["Destroy"]
local larry5825 =larry5824(_5821_2)
local _ =task.wait(120)
local larry5826 =larry8["GetPlayers"]
local larry5827 =larry5826(larry8)
local larry5830 =_5828_2["Character"]
local larry5831 =_5828_2["Character"]
local larry5832 =larry5831["GetChildren"]
local larry5833 =larry5832(larry5831)
local larry5835 =_5834_2["IsA"]
local larry5836 =larry5835(_5834_2, "Accessory")
local larry5837 =_5834_2["Destroy"]
local larry5838 =larry5837(_5834_2)
local _ =task.wait(120)
local larry5839 =larry8["GetPlayers"]
local larry5840 =larry5839(larry8)
local larry5843 =_5841_2["Character"]
local larry5844 =_5841_2["Character"]
local larry5845 =larry5844["GetChildren"]
local larry5846 =larry5845(larry5844)
local larry5848 =_5847_2["IsA"]
local larry5849 =larry5848(_5847_2, "Accessory")
local larry5850 =_5847_2["Destroy"]
local larry5851 =larry5850(_5847_2)
local _ =task.wait(120)
local larry5852 =larry8["GetPlayers"]
local larry5853 =larry5852(larry8)
local larry5856 =_5854_2["Character"]
local larry5857 =_5854_2["Character"]
local larry5858 =larry5857["GetChildren"]
local larry5859 =larry5858(larry5857)
local larry5861 =_5860_2["IsA"]
local larry5862 =larry5861(_5860_2, "Accessory")
local larry5863 =_5860_2["Destroy"]
local larry5864 =larry5863(_5860_2)
local _ =task.wait(120)
local larry5865 =larry8["GetPlayers"]
local larry5866 =larry5865(larry8)
local larry5869 =_5867_2["Character"]
local larry5870 =_5867_2["Character"]
local larry5871 =larry5870["GetChildren"]
local larry5872 =larry5871(larry5870)
local larry5874 =_5873_2["IsA"]
local larry5875 =larry5874(_5873_2, "Accessory")
local larry5876 =_5873_2["Destroy"]
local larry5877 =larry5876(_5873_2)
local _ =task.wait(120)
local larry5878 =larry8["GetPlayers"]
local larry5879 =larry5878(larry8)
local larry5882 =_5880_2["Character"]
local larry5883 =_5880_2["Character"]
local larry5884 =larry5883["GetChildren"]
local larry5885 =larry5884(larry5883)
local larry5887 =_5886_2["IsA"]
local larry5888 =larry5887(_5886_2, "Accessory")
local larry5889 =_5886_2["Destroy"]
local larry5890 =larry5889(_5886_2)
local _ =task.wait(120)
local larry5891 =larry8["GetPlayers"]
local larry5892 =larry5891(larry8)
local larry5895 =_5893_2["Character"]
local larry5896 =_5893_2["Character"]
local larry5897 =larry5896["GetChildren"]
local larry5898 =larry5897(larry5896)
local larry5900 =_5899_2["IsA"]
local larry5901 =larry5900(_5899_2, "Accessory")
local larry5902 =_5899_2["Destroy"]
local larry5903 =larry5902(_5899_2)
local _ =task.wait(120)
local larry5904 =larry8["GetPlayers"]
local larry5905 =larry5904(larry8)
local larry5908 =_5906_2["Character"]
local larry5909 =_5906_2["Character"]
local larry5910 =larry5909["GetChildren"]
local larry5911 =larry5910(larry5909)
local larry5913 =_5912_2["IsA"]
local larry5914 =larry5913(_5912_2, "Accessory")
local larry5915 =_5912_2["Destroy"]
local larry5916 =larry5915(_5912_2)
local _ =task.wait(120)
local larry5917 =larry8["GetPlayers"]
local larry5918 =larry5917(larry8)
local larry5921 =_5919_2["Character"]
local larry5922 =_5919_2["Character"]
local larry5923 =larry5922["GetChildren"]
local larry5924 =larry5923(larry5922)
local larry5926 =_5925_2["IsA"]
local larry5927 =larry5926(_5925_2, "Accessory")
local larry5928 =_5925_2["Destroy"]
local larry5929 =larry5928(_5925_2)
local _ =task.wait(120)
local larry5930 =larry8["GetPlayers"]
local larry5931 =larry5930(larry8)
local larry5934 =_5932_2["Character"]
local larry5935 =_5932_2["Character"]
local larry5936 =larry5935["GetChildren"]
local larry5937 =larry5936(larry5935)
local larry5939 =_5938_2["IsA"]
local larry5940 =larry5939(_5938_2, "Accessory")
local larry5941 =_5938_2["Destroy"]
local larry5942 =larry5941(_5938_2)
local _ =task.wait(120)
local larry5943 =larry8["GetPlayers"]
local larry5944 =larry5943(larry8)
local larry5947 =_5945_2["Character"]
local larry5948 =_5945_2["Character"]
local larry5949 =larry5948["GetChildren"]
local larry5950 =larry5949(larry5948)
local larry5952 =_5951_2["IsA"]
local larry5953 =larry5952(_5951_2, "Accessory")
local larry5954 =_5951_2["Destroy"]
local larry5955 =larry5954(_5951_2)
local _ =task.wait(120)
local larry5956 =larry8["GetPlayers"]
local larry5957 =larry5956(larry8)
local larry5960 =_5958_2["Character"]
local larry5961 =_5958_2["Character"]
local larry5962 =larry5961["GetChildren"]
local larry5963 =larry5962(larry5961)
local larry5965 =_5964_2["IsA"]
local larry5966 =larry5965(_5964_2, "Accessory")
local larry5967 =_5964_2["Destroy"]
local larry5968 =larry5967(_5964_2)
local _ =task.wait(120)
local larry5969 =larry8["GetPlayers"]
local larry5970 =larry5969(larry8)
local larry5973 =_5971_2["Character"]
local larry5974 =_5971_2["Character"]
local larry5975 =larry5974["GetChildren"]
local larry5976 =larry5975(larry5974)
local larry5978 =_5977_2["IsA"]
local larry5979 =larry5978(_5977_2, "Accessory")
local larry5980 =_5977_2["Destroy"]
local larry5981 =larry5980(_5977_2)
local _ =task.wait(120)
local larry5982 =larry8["GetPlayers"]
local larry5983 =larry5982(larry8)
local larry5986 =_5984_2["Character"]
local larry5987 =_5984_2["Character"]
local larry5988 =larry5987["GetChildren"]
local larry5989 =larry5988(larry5987)
local larry5991 =_5990_2["IsA"]
local larry5992 =larry5991(_5990_2, "Accessory")
local larry5993 =_5990_2["Destroy"]
local larry5994 =larry5993(_5990_2)
local _ =task.wait(120)
local larry5995 =larry8["GetPlayers"]
local larry5996 =larry5995(larry8)
local larry5999 =_5997_2["Character"]
local larry6000 =_5997_2["Character"]
local larry6001 =larry6000["GetChildren"]
local larry6002 =larry6001(larry6000)
local larry6004 =_6003_2["IsA"]
local larry6005 =larry6004(_6003_2, "Accessory")
local larry6006 =_6003_2["Destroy"]
local larry6007 =larry6006(_6003_2)
local _ =task.wait(120)
local larry6008 =larry8["GetPlayers"]
local larry6009 =larry6008(larry8)
local larry6012 =_6010_2["Character"]
local larry6013 =_6010_2["Character"]
local larry6014 =larry6013["GetChildren"]
local larry6015 =larry6014(larry6013)
local larry6017 =_6016_2["IsA"]
local larry6018 =larry6017(_6016_2, "Accessory")
local larry6019 =_6016_2["Destroy"]
local larry6020 =larry6019(_6016_2)
local _ =task.wait(120)
local larry6021 =larry8["GetPlayers"]
local larry6022 =larry6021(larry8)
local larry6025 =_6023_2["Character"]
local larry6026 =_6023_2["Character"]
local larry6027 =larry6026["GetChildren"]
local larry6028 =larry6027(larry6026)
local larry6030 =_6029_2["IsA"]
local larry6031 =larry6030(_6029_2, "Accessory")
local larry6032 =_6029_2["Destroy"]
local larry6033 =larry6032(_6029_2)
local _ =task.wait(120)
local larry6034 =larry8["GetPlayers"]
local larry6035 =larry6034(larry8)
local larry6038 =_6036_2["Character"]
local larry6039 =_6036_2["Character"]
local larry6040 =larry6039["GetChildren"]
local larry6041 =larry6040(larry6039)
local larry6043 =_6042_2["IsA"]
local larry6044 =larry6043(_6042_2, "Accessory")
local larry6045 =_6042_2["Destroy"]
local larry6046 =larry6045(_6042_2)
local _ =task.wait(120)
local larry6047 =larry8["GetPlayers"]
local larry6048 =larry6047(larry8)
local larry6051 =_6049_2["Character"]
local larry6052 =_6049_2["Character"]
local larry6053 =larry6052["GetChildren"]
local larry6054 =larry6053(larry6052)
local larry6056 =_6055_2["IsA"]
local larry6057 =larry6056(_6055_2, "Accessory")
local larry6058 =_6055_2["Destroy"]
local larry6059 =larry6058(_6055_2)
local _ =task.wait(120)
local larry6060 =larry8["GetPlayers"]
local larry6061 =larry6060(larry8)
local larry6064 =_6062_2["Character"]
local larry6065 =_6062_2["Character"]
local larry6066 =larry6065["GetChildren"]
local larry6067 =larry6066(larry6065)
local larry6069 =_6068_2["IsA"]
local larry6070 =larry6069(_6068_2, "Accessory")
local larry6071 =_6068_2["Destroy"]
local larry6072 =larry6071(_6068_2)
local _ =task.wait(120)
local larry6073 =larry8["GetPlayers"]
local larry6074 =larry6073(larry8)
local larry6077 =_6075_2["Character"]
local larry6078 =_6075_2["Character"]
local larry6079 =larry6078["GetChildren"]
local larry6080 =larry6079(larry6078)
local larry6082 =_6081_2["IsA"]
local larry6083 =larry6082(_6081_2, "Accessory")
local larry6084 =_6081_2["Destroy"]
local larry6085 =larry6084(_6081_2)
local _ =task.wait(120)
local larry6086 =larry8["GetPlayers"]
local larry6087 =larry6086(larry8)
local larry6090 =_6088_2["Character"]
local larry6091 =_6088_2["Character"]
local larry6092 =larry6091["GetChildren"]
local larry6093 =larry6092(larry6091)
local larry6095 =_6094_2["IsA"]
local larry6096 =larry6095(_6094_2, "Accessory")
local larry6097 =_6094_2["Destroy"]
local larry6098 =larry6097(_6094_2)
local _ =task.wait(120)
local larry6099 =larry8["GetPlayers"]
local larry6100 =larry6099(larry8)
local larry6103 =_6101_2["Character"]
local larry6104 =_6101_2["Character"]
local larry6105 =larry6104["GetChildren"]
local larry6106 =larry6105(larry6104)
local larry6108 =_6107_2["IsA"]
local larry6109 =larry6108(_6107_2, "Accessory")
local larry6110 =_6107_2["Destroy"]
local larry6111 =larry6110(_6107_2)
local _ =task.wait(120)
local larry6112 =larry8["GetPlayers"]
local larry6113 =larry6112(larry8)
local larry6116 =_6114_2["Character"]
local larry6117 =_6114_2["Character"]
local larry6118 =larry6117["GetChildren"]
local larry6119 =larry6118(larry6117)
local larry6121 =_6120_2["IsA"]
local larry6122 =larry6121(_6120_2, "Accessory")
local larry6123 =_6120_2["Destroy"]
local larry6124 =larry6123(_6120_2)
local _ =task.wait(120)
local larry6125 =larry8["GetPlayers"]
local larry6126 =larry6125(larry8)
local larry6129 =_6127_2["Character"]
local larry6130 =_6127_2["Character"]
local larry6131 =larry6130["GetChildren"]
local larry6132 =larry6131(larry6130)
local larry6134 =_6133_2["IsA"]
local larry6135 =larry6134(_6133_2, "Accessory")
local larry6136 =_6133_2["Destroy"]
local larry6137 =larry6136(_6133_2)
local _ =task.wait(120)
local larry6138 =larry8["GetPlayers"]
local larry6139 =larry6138(larry8)
local larry6142 =_6140_2["Character"]
local larry6143 =_6140_2["Character"]
local larry6144 =larry6143["GetChildren"]
local larry6145 =larry6144(larry6143)
local larry6147 =_6146_2["IsA"]
local larry6148 =larry6147(_6146_2, "Accessory")
local larry6149 =_6146_2["Destroy"]
local larry6150 =larry6149(_6146_2)
local _ =task.wait(120)
local larry6151 =larry8["GetPlayers"]
local larry6152 =larry6151(larry8)
local larry6155 =_6153_2["Character"]
local larry6156 =_6153_2["Character"]
local larry6157 =larry6156["GetChildren"]
local larry6158 =larry6157(larry6156)
local larry6160 =_6159_2["IsA"]
local larry6161 =larry6160(_6159_2, "Accessory")
local larry6162 =_6159_2["Destroy"]
local larry6163 =larry6162(_6159_2)
local _ =task.wait(120)
local larry6164 =larry8["GetPlayers"]
local larry6165 =larry6164(larry8)
local larry6168 =_6166_2["Character"]
local larry6169 =_6166_2["Character"]
local larry6170 =larry6169["GetChildren"]
local larry6171 =larry6170(larry6169)
local larry6173 =_6172_2["IsA"]
local larry6174 =larry6173(_6172_2, "Accessory")
local larry6175 =_6172_2["Destroy"]
local larry6176 =larry6175(_6172_2)
local _ =task.wait(120)
local larry6177 =larry8["GetPlayers"]
local larry6178 =larry6177(larry8)
local larry6181 =_6179_2["Character"]
local larry6182 =_6179_2["Character"]
local larry6183 =larry6182["GetChildren"]
local larry6184 =larry6183(larry6182)
local larry6186 =_6185_2["IsA"]
local larry6187 =larry6186(_6185_2, "Accessory")
local larry6188 =_6185_2["Destroy"]
local larry6189 =larry6188(_6185_2)
local _ =task.wait(120)
local larry6190 =larry8["GetPlayers"]
local larry6191 =larry6190(larry8)
local larry6194 =_6192_2["Character"]
local larry6195 =_6192_2["Character"]
local larry6196 =larry6195["GetChildren"]
local larry6197 =larry6196(larry6195)
local larry6199 =_6198_2["IsA"]
local larry6200 =larry6199(_6198_2, "Accessory")
local _ =task.wait(120)
local er =error("Luraph Script:4023: internal 542: <larry: infinitelooperror>")
local larry5707 =larry5706(function(...)
local _5708_vararg1, _5708_vararg2, _5708_vararg3, _5708_vararg4, _5708_vararg5, _5708_vararg6, _5708_vararg7, _5708_vararg8, _5708_vararg9, _5708_vararg10 = ...
local _ =task.wait(120)
local larry5709 =larry8["GetPlayers"]
local larry5710 =larry5709(larry8)
for larry5711, _5711_2 in ipairs(larry5710) do
local larry5712 =(_5711_2==larry25)
local larry5713 =_5711_2["Character"]
local larry5714 =_5711_2["Character"]
local larry5715 =larry5714["GetChildren"]
local larry5716 =larry5715(larry5714)
for larry5717, _5717_2 in ipairs(larry5716) do
local larry5718 =_5717_2["IsA"]
local larry5719 =larry5718(_5717_2, "Accessory")
local larry5720 =_5717_2["Destroy"]
local larry5721 =larry5720(_5717_2)
end
end
local _ =task.wait(120)
local larry5722 =larry8["GetPlayers"]
local larry5723 =larry5722(larry8)
for larry5724, _5724_2 in ipairs(larry5723) do
local larry5725 =(_5724_2==larry25)
local larry5726 =_5724_2["Character"]
local larry5727 =_5724_2["Character"]
local larry5728 =larry5727["GetChildren"]
local larry5729 =larry5728(larry5727)
for larry5730, _5730_2 in ipairs(larry5729) do
local larry5731 =_5730_2["IsA"]
local larry5732 =larry5731(_5730_2, "Accessory")
local larry5733 =_5730_2["Destroy"]
local larry5734 =larry5733(_5730_2)
end
end
local _ =task.wait(120)
local larry5735 =larry8["GetPlayers"]
local larry5736 =larry5735(larry8)
for larry5737, _5737_2 in ipairs(larry5736) do
local larry5738 =(_5737_2==larry25)
local larry5739 =_5737_2["Character"]
local larry5740 =_5737_2["Character"]
local larry5741 =larry5740["GetChildren"]
local larry5742 =larry5741(larry5740)
for larry5743, _5743_2 in ipairs(larry5742) do
local larry5744 =_5743_2["IsA"]
local larry5745 =larry5744(_5743_2, "Accessory")
local larry5746 =_5743_2["Destroy"]
local larry5747 =larry5746(_5743_2)
end
end
local _ =task.wait(120)
local larry5748 =larry8["GetPlayers"]
local larry5749 =larry5748(larry8)
for larry5750, _5750_2 in ipairs(larry5749) do
local larry5751 =(_5750_2==larry25)
local larry5752 =_5750_2["Character"]
local larry5753 =_5750_2["Character"]
local larry5754 =larry5753["GetChildren"]
local larry5755 =larry5754(larry5753)
for larry5756, _5756_2 in ipairs(larry5755) do
local larry5757 =_5756_2["IsA"]
local larry5758 =larry5757(_5756_2, "Accessory")
local larry5759 =_5756_2["Destroy"]
local larry5760 =larry5759(_5756_2)
end
end
local _ =task.wait(120)
local larry5761 =larry8["GetPlayers"]
local larry5762 =larry5761(larry8)
for larry5763, _5763_2 in ipairs(larry5762) do
local larry5764 =(_5763_2==larry25)
local larry5765 =_5763_2["Character"]
local larry5766 =_5763_2["Character"]
local larry5767 =larry5766["GetChildren"]
local larry5768 =larry5767(larry5766)
for larry5769, _5769_2 in ipairs(larry5768) do
local larry5770 =_5769_2["IsA"]
local larry5771 =larry5770(_5769_2, "Accessory")
local larry5772 =_5769_2["Destroy"]
local larry5773 =larry5772(_5769_2)
end
end
local _ =task.wait(120)
local larry5774 =larry8["GetPlayers"]
local larry5775 =larry5774(larry8)
for larry5776, _5776_2 in ipairs(larry5775) do
local larry5777 =(_5776_2==larry25)
local larry5778 =_5776_2["Character"]
local larry5779 =_5776_2["Character"]
local larry5780 =larry5779["GetChildren"]
local larry5781 =larry5780(larry5779)
for larry5782, _5782_2 in ipairs(larry5781) do
local larry5783 =_5782_2["IsA"]
local larry5784 =larry5783(_5782_2, "Accessory")
local larry5785 =_5782_2["Destroy"]
local larry5786 =larry5785(_5782_2)
end
end
local _ =task.wait(120)
local larry5787 =larry8["GetPlayers"]
local larry5788 =larry5787(larry8)
for larry5789, _5789_2 in ipairs(larry5788) do
local larry5790 =(_5789_2==larry25)
local larry5791 =_5789_2["Character"]
local larry5792 =_5789_2["Character"]
local larry5793 =larry5792["GetChildren"]
local larry5794 =larry5793(larry5792)
for larry5795, _5795_2 in ipairs(larry5794) do
local larry5796 =_5795_2["IsA"]
local larry5797 =larry5796(_5795_2, "Accessory")
local larry5798 =_5795_2["Destroy"]
local larry5799 =larry5798(_5795_2)
end
end
local _ =task.wait(120)
local larry5800 =larry8["GetPlayers"]
local larry5801 =larry5800(larry8)
for larry5802, _5802_2 in ipairs(larry5801) do
local larry5803 =(_5802_2==larry25)
local larry5804 =_5802_2["Character"]
local larry5805 =_5802_2["Character"]
local larry5806 =larry5805["GetChildren"]
local larry5807 =larry5806(larry5805)
for larry5808, _5808_2 in ipairs(larry5807) do
local larry5809 =_5808_2["IsA"]
local larry5810 =larry5809(_5808_2, "Accessory")
local larry5811 =_5808_2["Destroy"]
local larry5812 =larry5811(_5808_2)
end
end
local _ =task.wait(120)
local larry5813 =larry8["GetPlayers"]
local larry5814 =larry5813(larry8)
for larry5815, _5815_2 in ipairs(larry5814) do
local larry5816 =(_5815_2==larry25)
local larry5817 =_5815_2["Character"]
local larry5818 =_5815_2["Character"]
local larry5819 =larry5818["GetChildren"]
local larry5820 =larry5819(larry5818)
for larry5821, _5821_2 in ipairs(larry5820) do
local larry5822 =_5821_2["IsA"]
local larry5823 =larry5822(_5821_2, "Accessory")
local larry5824 =_5821_2["Destroy"]
local larry5825 =larry5824(_5821_2)
end
end
local _ =task.wait(120)
local larry5826 =larry8["GetPlayers"]
local larry5827 =larry5826(larry8)
for larry5828, _5828_2 in ipairs(larry5827) do
local larry5829 =(_5828_2==larry25)
local larry5830 =_5828_2["Character"]
local larry5831 =_5828_2["Character"]
local larry5832 =larry5831["GetChildren"]
local larry5833 =larry5832(larry5831)
for larry5834, _5834_2 in ipairs(larry5833) do
local larry5835 =_5834_2["IsA"]
local larry5836 =larry5835(_5834_2, "Accessory")
local larry5837 =_5834_2["Destroy"]
local larry5838 =larry5837(_5834_2)
end
end
local _ =task.wait(120)
local larry5839 =larry8["GetPlayers"]
local larry5840 =larry5839(larry8)
for larry5841, _5841_2 in ipairs(larry5840) do
local larry5842 =(_5841_2==larry25)
local larry5843 =_5841_2["Character"]
local larry5844 =_5841_2["Character"]
local larry5845 =larry5844["GetChildren"]
local larry5846 =larry5845(larry5844)
for larry5847, _5847_2 in ipairs(larry5846) do
local larry5848 =_5847_2["IsA"]
local larry5849 =larry5848(_5847_2, "Accessory")
local larry5850 =_5847_2["Destroy"]
local larry5851 =larry5850(_5847_2)
end
end
local _ =task.wait(120)
local larry5852 =larry8["GetPlayers"]
local larry5853 =larry5852(larry8)
for larry5854, _5854_2 in ipairs(larry5853) do
local larry5855 =(_5854_2==larry25)
local larry5856 =_5854_2["Character"]
local larry5857 =_5854_2["Character"]
local larry5858 =larry5857["GetChildren"]
local larry5859 =larry5858(larry5857)
for larry5860, _5860_2 in ipairs(larry5859) do
local larry5861 =_5860_2["IsA"]
local larry5862 =larry5861(_5860_2, "Accessory")
local larry5863 =_5860_2["Destroy"]
local larry5864 =larry5863(_5860_2)
end
end
local _ =task.wait(120)
local larry5865 =larry8["GetPlayers"]
local larry5866 =larry5865(larry8)
for larry5867, _5867_2 in ipairs(larry5866) do
local larry5868 =(_5867_2==larry25)
local larry5869 =_5867_2["Character"]
local larry5870 =_5867_2["Character"]
local larry5871 =larry5870["GetChildren"]
local larry5872 =larry5871(larry5870)
for larry5873, _5873_2 in ipairs(larry5872) do
local larry5874 =_5873_2["IsA"]
local larry5875 =larry5874(_5873_2, "Accessory")
local larry5876 =_5873_2["Destroy"]
local larry5877 =larry5876(_5873_2)
end
end
local _ =task.wait(120)
local larry5878 =larry8["GetPlayers"]
local larry5879 =larry5878(larry8)
for larry5880, _5880_2 in ipairs(larry5879) do
local larry5881 =(_5880_2==larry25)
local larry5882 =_5880_2["Character"]
local larry5883 =_5880_2["Character"]
local larry5884 =larry5883["GetChildren"]
local larry5885 =larry5884(larry5883)
for larry5886, _5886_2 in ipairs(larry5885) do
local larry5887 =_5886_2["IsA"]
local larry5888 =larry5887(_5886_2, "Accessory")
local larry5889 =_5886_2["Destroy"]
local larry5890 =larry5889(_5886_2)
end
end
local _ =task.wait(120)
local larry5891 =larry8["GetPlayers"]
local larry5892 =larry5891(larry8)
for larry5893, _5893_2 in ipairs(larry5892) do
local larry5894 =(_5893_2==larry25)
local larry5895 =_5893_2["Character"]
local larry5896 =_5893_2["Character"]
local larry5897 =larry5896["GetChildren"]
local larry5898 =larry5897(larry5896)
for larry5899, _5899_2 in ipairs(larry5898) do
local larry5900 =_5899_2["IsA"]
local larry5901 =larry5900(_5899_2, "Accessory")
local larry5902 =_5899_2["Destroy"]
local larry5903 =larry5902(_5899_2)
end
end
local _ =task.wait(120)
local larry5904 =larry8["GetPlayers"]
local larry5905 =larry5904(larry8)
for larry5906, _5906_2 in ipairs(larry5905) do
local larry5907 =(_5906_2==larry25)
local larry5908 =_5906_2["Character"]
local larry5909 =_5906_2["Character"]
local larry5910 =larry5909["GetChildren"]
local larry5911 =larry5910(larry5909)
for larry5912, _5912_2 in ipairs(larry5911) do
local larry5913 =_5912_2["IsA"]
local larry5914 =larry5913(_5912_2, "Accessory")
local larry5915 =_5912_2["Destroy"]
local larry5916 =larry5915(_5912_2)
end
end
local _ =task.wait(120)
local larry5917 =larry8["GetPlayers"]
local larry5918 =larry5917(larry8)
for larry5919, _5919_2 in ipairs(larry5918) do
local larry5920 =(_5919_2==larry25)
local larry5921 =_5919_2["Character"]
local larry5922 =_5919_2["Character"]
local larry5923 =larry5922["GetChildren"]
local larry5924 =larry5923(larry5922)
for larry5925, _5925_2 in ipairs(larry5924) do
local larry5926 =_5925_2["IsA"]
local larry5927 =larry5926(_5925_2, "Accessory")
local larry5928 =_5925_2["Destroy"]
local larry5929 =larry5928(_5925_2)
end
end
local _ =task.wait(120)
local larry5930 =larry8["GetPlayers"]
local larry5931 =larry5930(larry8)
for larry5932, _5932_2 in ipairs(larry5931) do
local larry5933 =(_5932_2==larry25)
local larry5934 =_5932_2["Character"]
local larry5935 =_5932_2["Character"]
local larry5936 =larry5935["GetChildren"]
local larry5937 =larry5936(larry5935)
for larry5938, _5938_2 in ipairs(larry5937) do
local larry5939 =_5938_2["IsA"]
local larry5940 =larry5939(_5938_2, "Accessory")
local larry5941 =_5938_2["Destroy"]
local larry5942 =larry5941(_5938_2)
end
end
local _ =task.wait(120)
local larry5943 =larry8["GetPlayers"]
local larry5944 =larry5943(larry8)
for larry5945, _5945_2 in ipairs(larry5944) do
local larry5946 =(_5945_2==larry25)
local larry5947 =_5945_2["Character"]
local larry5948 =_5945_2["Character"]
local larry5949 =larry5948["GetChildren"]
local larry5950 =larry5949(larry5948)
for larry5951, _5951_2 in ipairs(larry5950) do
local larry5952 =_5951_2["IsA"]
local larry5953 =larry5952(_5951_2, "Accessory")
local larry5954 =_5951_2["Destroy"]
local larry5955 =larry5954(_5951_2)
end
end
local _ =task.wait(120)
local larry5956 =larry8["GetPlayers"]
local larry5957 =larry5956(larry8)
for larry5958, _5958_2 in ipairs(larry5957) do
local larry5959 =(_5958_2==larry25)
local larry5960 =_5958_2["Character"]
local larry5961 =_5958_2["Character"]
local larry5962 =larry5961["GetChildren"]
local larry5963 =larry5962(larry5961)
for larry5964, _5964_2 in ipairs(larry5963) do
local larry5965 =_5964_2["IsA"]
local larry5966 =larry5965(_5964_2, "Accessory")
local larry5967 =_5964_2["Destroy"]
local larry5968 =larry5967(_5964_2)
end
end
local _ =task.wait(120)
local larry5969 =larry8["GetPlayers"]
local larry5970 =larry5969(larry8)
for larry5971, _5971_2 in ipairs(larry5970) do
local larry5972 =(_5971_2==larry25)
local larry5973 =_5971_2["Character"]
local larry5974 =_5971_2["Character"]
local larry5975 =larry5974["GetChildren"]
local larry5976 =larry5975(larry5974)
for larry5977, _5977_2 in ipairs(larry5976) do
local larry5978 =_5977_2["IsA"]
local larry5979 =larry5978(_5977_2, "Accessory")
local larry5980 =_5977_2["Destroy"]
local larry5981 =larry5980(_5977_2)
end
end
local _ =task.wait(120)
local larry5982 =larry8["GetPlayers"]
local larry5983 =larry5982(larry8)
for larry5984, _5984_2 in ipairs(larry5983) do
local larry5985 =(_5984_2==larry25)
local larry5986 =_5984_2["Character"]
local larry5987 =_5984_2["Character"]
local larry5988 =larry5987["GetChildren"]
local larry5989 =larry5988(larry5987)
for larry5990, _5990_2 in ipairs(larry5989) do
local larry5991 =_5990_2["IsA"]
local larry5992 =larry5991(_5990_2, "Accessory")
local larry5993 =_5990_2["Destroy"]
local larry5994 =larry5993(_5990_2)
end
end
local _ =task.wait(120)
local larry5995 =larry8["GetPlayers"]
local larry5996 =larry5995(larry8)
for larry5997, _5997_2 in ipairs(larry5996) do
local larry5998 =(_5997_2==larry25)
local larry5999 =_5997_2["Character"]
local larry6000 =_5997_2["Character"]
local larry6001 =larry6000["GetChildren"]
local larry6002 =larry6001(larry6000)
for larry6003, _6003_2 in ipairs(larry6002) do
local larry6004 =_6003_2["IsA"]
local larry6005 =larry6004(_6003_2, "Accessory")
local larry6006 =_6003_2["Destroy"]
local larry6007 =larry6006(_6003_2)
end
end
local _ =task.wait(120)
local larry6008 =larry8["GetPlayers"]
local larry6009 =larry6008(larry8)
for larry6010, _6010_2 in ipairs(larry6009) do
local larry6011 =(_6010_2==larry25)
local larry6012 =_6010_2["Character"]
local larry6013 =_6010_2["Character"]
local larry6014 =larry6013["GetChildren"]
local larry6015 =larry6014(larry6013)
for larry6016, _6016_2 in ipairs(larry6015) do
local larry6017 =_6016_2["IsA"]
local larry6018 =larry6017(_6016_2, "Accessory")
local larry6019 =_6016_2["Destroy"]
local larry6020 =larry6019(_6016_2)
end
end
local _ =task.wait(120)
local larry6021 =larry8["GetPlayers"]
local larry6022 =larry6021(larry8)
for larry6023, _6023_2 in ipairs(larry6022) do
local larry6024 =(_6023_2==larry25)
local larry6025 =_6023_2["Character"]
local larry6026 =_6023_2["Character"]
local larry6027 =larry6026["GetChildren"]
local larry6028 =larry6027(larry6026)
for larry6029, _6029_2 in ipairs(larry6028) do
local larry6030 =_6029_2["IsA"]
local larry6031 =larry6030(_6029_2, "Accessory")
local larry6032 =_6029_2["Destroy"]
local larry6033 =larry6032(_6029_2)
end
end
local _ =task.wait(120)
local larry6034 =larry8["GetPlayers"]
local larry6035 =larry6034(larry8)
for larry6036, _6036_2 in ipairs(larry6035) do
local larry6037 =(_6036_2==larry25)
local larry6038 =_6036_2["Character"]
local larry6039 =_6036_2["Character"]
local larry6040 =larry6039["GetChildren"]
local larry6041 =larry6040(larry6039)
for larry6042, _6042_2 in ipairs(larry6041) do
local larry6043 =_6042_2["IsA"]
local larry6044 =larry6043(_6042_2, "Accessory")
local larry6045 =_6042_2["Destroy"]
local larry6046 =larry6045(_6042_2)
end
end
local _ =task.wait(120)
local larry6047 =larry8["GetPlayers"]
local larry6048 =larry6047(larry8)
for larry6049, _6049_2 in ipairs(larry6048) do
local larry6050 =(_6049_2==larry25)
local larry6051 =_6049_2["Character"]
local larry6052 =_6049_2["Character"]
local larry6053 =larry6052["GetChildren"]
local larry6054 =larry6053(larry6052)
for larry6055, _6055_2 in ipairs(larry6054) do
local larry6056 =_6055_2["IsA"]
local larry6057 =larry6056(_6055_2, "Accessory")
local larry6058 =_6055_2["Destroy"]
local larry6059 =larry6058(_6055_2)
end
end
local _ =task.wait(120)
local larry6060 =larry8["GetPlayers"]
local larry6061 =larry6060(larry8)
for larry6062, _6062_2 in ipairs(larry6061) do
local larry6063 =(_6062_2==larry25)
local larry6064 =_6062_2["Character"]
local larry6065 =_6062_2["Character"]
local larry6066 =larry6065["GetChildren"]
local larry6067 =larry6066(larry6065)
for larry6068, _6068_2 in ipairs(larry6067) do
local larry6069 =_6068_2["IsA"]
local larry6070 =larry6069(_6068_2, "Accessory")
local larry6071 =_6068_2["Destroy"]
local larry6072 =larry6071(_6068_2)
end
end
local _ =task.wait(120)
local larry6073 =larry8["GetPlayers"]
local larry6074 =larry6073(larry8)
for larry6075, _6075_2 in ipairs(larry6074) do
local larry6076 =(_6075_2==larry25)
local larry6077 =_6075_2["Character"]
local larry6078 =_6075_2["Character"]
local larry6079 =larry6078["GetChildren"]
local larry6080 =larry6079(larry6078)
for larry6081, _6081_2 in ipairs(larry6080) do
local larry6082 =_6081_2["IsA"]
local larry6083 =larry6082(_6081_2, "Accessory")
local larry6084 =_6081_2["Destroy"]
local larry6085 =larry6084(_6081_2)
end
end
local _ =task.wait(120)
local larry6086 =larry8["GetPlayers"]
local larry6087 =larry6086(larry8)
for larry6088, _6088_2 in ipairs(larry6087) do
local larry6089 =(_6088_2==larry25)
local larry6090 =_6088_2["Character"]
local larry6091 =_6088_2["Character"]
local larry6092 =larry6091["GetChildren"]
local larry6093 =larry6092(larry6091)
for larry6094, _6094_2 in ipairs(larry6093) do
local larry6095 =_6094_2["IsA"]
local larry6096 =larry6095(_6094_2, "Accessory")
local larry6097 =_6094_2["Destroy"]
local larry6098 =larry6097(_6094_2)
end
end
local _ =task.wait(120)
local larry6099 =larry8["GetPlayers"]
local larry6100 =larry6099(larry8)
for larry6101, _6101_2 in ipairs(larry6100) do
local larry6102 =(_6101_2==larry25)
local larry6103 =_6101_2["Character"]
local larry6104 =_6101_2["Character"]
local larry6105 =larry6104["GetChildren"]
local larry6106 =larry6105(larry6104)
for larry6107, _6107_2 in ipairs(larry6106) do
local larry6108 =_6107_2["IsA"]
local larry6109 =larry6108(_6107_2, "Accessory")
local larry6110 =_6107_2["Destroy"]
local larry6111 =larry6110(_6107_2)
end
end
local _ =task.wait(120)
local larry6112 =larry8["GetPlayers"]
local larry6113 =larry6112(larry8)
for larry6114, _6114_2 in ipairs(larry6113) do
local larry6115 =(_6114_2==larry25)
local larry6116 =_6114_2["Character"]
local larry6117 =_6114_2["Character"]
local larry6118 =larry6117["GetChildren"]
local larry6119 =larry6118(larry6117)
for larry6120, _6120_2 in ipairs(larry6119) do
local larry6121 =_6120_2["IsA"]
local larry6122 =larry6121(_6120_2, "Accessory")
local larry6123 =_6120_2["Destroy"]
local larry6124 =larry6123(_6120_2)
end
end
local _ =task.wait(120)
local larry6125 =larry8["GetPlayers"]
local larry6126 =larry6125(larry8)
for larry6127, _6127_2 in ipairs(larry6126) do
local larry6128 =(_6127_2==larry25)
local larry6129 =_6127_2["Character"]
local larry6130 =_6127_2["Character"]
local larry6131 =larry6130["GetChildren"]
local larry6132 =larry6131(larry6130)
for larry6133, _6133_2 in ipairs(larry6132) do
local larry6134 =_6133_2["IsA"]
local larry6135 =larry6134(_6133_2, "Accessory")
local larry6136 =_6133_2["Destroy"]
local larry6137 =larry6136(_6133_2)
end
end
local _ =task.wait(120)
local larry6138 =larry8["GetPlayers"]
local larry6139 =larry6138(larry8)
for larry6140, _6140_2 in ipairs(larry6139) do
local larry6141 =(_6140_2==larry25)
local larry6142 =_6140_2["Character"]
local larry6143 =_6140_2["Character"]
local larry6144 =larry6143["GetChildren"]
local larry6145 =larry6144(larry6143)
for larry6146, _6146_2 in ipairs(larry6145) do
local larry6147 =_6146_2["IsA"]
local larry6148 =larry6147(_6146_2, "Accessory")
local larry6149 =_6146_2["Destroy"]
local larry6150 =larry6149(_6146_2)
end
end
local _ =task.wait(120)
local larry6151 =larry8["GetPlayers"]
local larry6152 =larry6151(larry8)
for larry6153, _6153_2 in ipairs(larry6152) do
local larry6154 =(_6153_2==larry25)
local larry6155 =_6153_2["Character"]
local larry6156 =_6153_2["Character"]
local larry6157 =larry6156["GetChildren"]
local larry6158 =larry6157(larry6156)
for larry6159, _6159_2 in ipairs(larry6158) do
local larry6160 =_6159_2["IsA"]
local larry6161 =larry6160(_6159_2, "Accessory")
local larry6162 =_6159_2["Destroy"]
local larry6163 =larry6162(_6159_2)
end
end
local _ =task.wait(120)
local larry6164 =larry8["GetPlayers"]
local larry6165 =larry6164(larry8)
for larry6166, _6166_2 in ipairs(larry6165) do
local larry6167 =(_6166_2==larry25)
local larry6168 =_6166_2["Character"]
local larry6169 =_6166_2["Character"]
local larry6170 =larry6169["GetChildren"]
local larry6171 =larry6170(larry6169)
for larry6172, _6172_2 in ipairs(larry6171) do
local larry6173 =_6172_2["IsA"]
local larry6174 =larry6173(_6172_2, "Accessory")
local larry6175 =_6172_2["Destroy"]
local larry6176 =larry6175(_6172_2)
end
end
local _ =task.wait(120)
local larry6177 =larry8["GetPlayers"]
local larry6178 =larry6177(larry8)
for larry6179, _6179_2 in ipairs(larry6178) do
local larry6180 =(_6179_2==larry25)
local larry6181 =_6179_2["Character"]
local larry6182 =_6179_2["Character"]
local larry6183 =larry6182["GetChildren"]
local larry6184 =larry6183(larry6182)
for larry6185, _6185_2 in ipairs(larry6184) do
local larry6186 =_6185_2["IsA"]
local larry6187 =larry6186(_6185_2, "Accessory")
local larry6188 =_6185_2["Destroy"]
local larry6189 =larry6188(_6185_2)
end
end
local _ =task.wait(120)
local larry6190 =larry8["GetPlayers"]
local larry6191 =larry6190(larry8)
for larry6192, _6192_2 in ipairs(larry6191) do
local larry6193 =(_6192_2==larry25)
local larry6194 =_6192_2["Character"]
local larry6195 =_6192_2["Character"]
local larry6196 =larry6195["GetChildren"]
local larry6197 =larry6196(larry6195)
for larry6198, _6198_2 in ipairs(larry6197) do
local larry6199 =_6198_2["IsA"]
end
local er =error("Luraph Script:4023: internal 542: <larry: infinitelooperror>")
end
end)
local larry6201 =UDim2["new"]
local larry6202 =larry6201(0, 50, 0, 50)
local larry6203 =UDim2["new"]
local larry6204 =larry6203(0, 20, 0.5, -20)
local larry6205 =Instance["new"]
local larry6206 =larry6205("ImageButton")
local larry6207 =UDim["new"]
local larry6208 =larry6207(1, 0)
local larry6209 =Instance["new"]
local larry6210 =larry6209("UICorner")
local larry6211 =Instance["new"]
local larry6212 =larry6211("UIStroke")
local larry6213 =larry6206["MouseButton1Click"]
local larry6214 =larry6213["Connect"]
local larry6217 =larry159["Visible"]
local larry6215 =larry6214(larry6213, function(...)
local _6216_vararg1, _6216_vararg2, _6216_vararg3, _6216_vararg4, _6216_vararg5, _6216_vararg6, _6216_vararg7, _6216_vararg8, _6216_vararg9, _6216_vararg10 = ...
local larry6217 =larry159["Visible"]
larry159["Visible"] =false
end)
local larry6218 =larry159["InputBegan"]
local larry6219 =larry6218["Connect"]
local larry6222 =_6221_vararg1["UserInputType"]
local larry6223 =Enum["UserInputType"]
local larry6224 =larry6223["MouseButton1"]
local larry6226 =_6221_vararg1["UserInputType"]
local larry6227 =Enum["UserInputType"]
local larry6228 =larry6227["Touch"]
local larry6220 =larry6219(larry6218, function(...)
local _6221_vararg1, _6221_vararg2, _6221_vararg3, _6221_vararg4, _6221_vararg5, _6221_vararg6, _6221_vararg7, _6221_vararg8, _6221_vararg9, _6221_vararg10 = ...
local larry6222 =_6221_vararg1["UserInputType"]
local larry6223 =Enum["UserInputType"]
local larry6224 =larry6223["MouseButton1"]
local larry6225 =(larry6222==larry6224)
local larry6226 =_6221_vararg1["UserInputType"]
local larry6227 =Enum["UserInputType"]
local larry6228 =larry6227["Touch"]
local larry6229 =(larry6226==larry6228)
end)
local larry6230 =larry159["InputChanged"]
local larry6231 =larry6230["Connect"]
local larry6234 =_6233_vararg1["UserInputType"]
local larry6235 =Enum["UserInputType"]
local larry6236 =larry6235["MouseMovement"]
local larry6238 =_6233_vararg1["UserInputType"]
local larry6239 =Enum["UserInputType"]
local larry6240 =larry6239["Touch"]
local larry6232 =larry6231(larry6230, function(...)
local _6233_vararg1, _6233_vararg2, _6233_vararg3, _6233_vararg4, _6233_vararg5, _6233_vararg6, _6233_vararg7, _6233_vararg8, _6233_vararg9, _6233_vararg10 = ...
local larry6234 =_6233_vararg1["UserInputType"]
local larry6235 =Enum["UserInputType"]
local larry6236 =larry6235["MouseMovement"]
local larry6237 =(larry6234==larry6236)
local larry6238 =_6233_vararg1["UserInputType"]
local larry6239 =Enum["UserInputType"]
local larry6240 =larry6239["Touch"]
local larry6241 =(larry6238==larry6240)
end)
local larry6242 =larry4236["InputBegan"]
local larry6243 =larry6242["Connect"]
local larry6246 =_6245_vararg1["UserInputType"]
local larry6247 =Enum["UserInputType"]
local larry6248 =larry6247["MouseButton1"]
local larry6250 =_6245_vararg1["UserInputType"]
local larry6251 =Enum["UserInputType"]
local larry6252 =larry6251["Touch"]
local larry6244 =larry6243(larry6242, function(...)
local _6245_vararg1, _6245_vararg2, _6245_vararg3, _6245_vararg4, _6245_vararg5, _6245_vararg6, _6245_vararg7, _6245_vararg8, _6245_vararg9, _6245_vararg10 = ...
local larry6246 =_6245_vararg1["UserInputType"]
local larry6247 =Enum["UserInputType"]
local larry6248 =larry6247["MouseButton1"]
local larry6249 =(larry6246==larry6248)
local larry6250 =_6245_vararg1["UserInputType"]
local larry6251 =Enum["UserInputType"]
local larry6252 =larry6251["Touch"]
local larry6253 =(larry6250==larry6252)
end)
local larry6254 =larry4236["InputChanged"]
local larry6255 =larry6254["Connect"]
local larry6258 =_6257_vararg1["UserInputType"]
local larry6259 =Enum["UserInputType"]
local larry6260 =larry6259["MouseMovement"]
local larry6262 =_6257_vararg1["UserInputType"]
local larry6263 =Enum["UserInputType"]
local larry6264 =larry6263["Touch"]
local larry6256 =larry6255(larry6254, function(...)
local _6257_vararg1, _6257_vararg2, _6257_vararg3, _6257_vararg4, _6257_vararg5, _6257_vararg6, _6257_vararg7, _6257_vararg8, _6257_vararg9, _6257_vararg10 = ...
local larry6258 =_6257_vararg1["UserInputType"]
local larry6259 =Enum["UserInputType"]
local larry6260 =larry6259["MouseMovement"]
local larry6261 =(larry6258==larry6260)
local larry6262 =_6257_vararg1["UserInputType"]
local larry6263 =Enum["UserInputType"]
local larry6264 =larry6263["Touch"]
local larry6265 =(larry6262==larry6264)
end)
local larry6266 =larry6206["InputBegan"]
local larry6267 =larry6266["Connect"]
local larry6270 =_6269_vararg1["UserInputType"]
local larry6271 =Enum["UserInputType"]
local larry6272 =larry6271["MouseButton1"]
local larry6274 =_6269_vararg1["UserInputType"]
local larry6275 =Enum["UserInputType"]
local larry6276 =larry6275["Touch"]
local larry6268 =larry6267(larry6266, function(...)
local _6269_vararg1, _6269_vararg2, _6269_vararg3, _6269_vararg4, _6269_vararg5, _6269_vararg6, _6269_vararg7, _6269_vararg8, _6269_vararg9, _6269_vararg10 = ...
local larry6270 =_6269_vararg1["UserInputType"]
local larry6271 =Enum["UserInputType"]
local larry6272 =larry6271["MouseButton1"]
local larry6273 =(larry6270==larry6272)
local larry6274 =_6269_vararg1["UserInputType"]
local larry6275 =Enum["UserInputType"]
local larry6276 =larry6275["Touch"]
local larry6277 =(larry6274==larry6276)
end)
local larry6278 =larry6206["InputChanged"]
local larry6279 =larry6278["Connect"]
local larry6282 =_6281_vararg1["UserInputType"]
local larry6283 =Enum["UserInputType"]
local larry6284 =larry6283["MouseMovement"]
local larry6286 =_6281_vararg1["UserInputType"]
local er =error("Luraph Script:4050: internal 542: <larry: infinitelooperror>")
local larry6280 =larry6279(larry6278, function(...)
local _6281_vararg1, _6281_vararg2, _6281_vararg3, _6281_vararg4, _6281_vararg5, _6281_vararg6, _6281_vararg7, _6281_vararg8, _6281_vararg9, _6281_vararg10 = ...
local larry6282 =_6281_vararg1["UserInputType"]
local larry6283 =Enum["UserInputType"]
local larry6284 =larry6283["MouseMovement"]
local larry6285 =(larry6282==larry6284)
local er =error("Luraph Script:4050: internal 542: <larry: infinitelooperror>")
end)
local larry6287 =larry18["InputBegan"]
local larry6288 =larry6287["Connect"]
local larry6289 =larry6288(larry6287, function(...)
local _6290_vararg1, _6290_vararg2, _6290_vararg3, _6290_vararg4, _6290_vararg5, _6290_vararg6, _6290_vararg7, _6290_vararg8, _6290_vararg9, _6290_vararg10 = ...

end)
local larry6291 =larry18["InputBegan"]
local larry6292 =larry6291["Connect"]
local larry6293 =larry6292(larry6291, function(...)
local _6294_vararg1, _6294_vararg2, _6294_vararg3, _6294_vararg4, _6294_vararg5, _6294_vararg6, _6294_vararg7, _6294_vararg8, _6294_vararg9, _6294_vararg10 = ...

end)
local larry6295 =task["delay"]
local larry6298 =larry4236["Parent"]
local larry6296 =larry6295(2, function(...)
local _6297_vararg1, _6297_vararg2, _6297_vararg3, _6297_vararg4, _6297_vararg5, _6297_vararg6, _6297_vararg7, _6297_vararg8, _6297_vararg9, _6297_vararg10 = ...
local larry6298 =larry4236["Parent"]
end)
local larry6299 =larry4236["GetPropertyChangedSignal"]
local larry6300 =larry6299(larry4236, "Visible")
local larry6301 =larry6300["Connect"]
local larry6304 =larry4236["Visible"]
local larry6302 =larry6301(larry6300, function(...)
local _6303_vararg1, _6303_vararg2, _6303_vararg3, _6303_vararg4, _6303_vararg5, _6303_vararg6, _6303_vararg7, _6303_vararg8, _6303_vararg9, _6303_vararg10 = ...
local larry6304 =larry4236["Visible"]
end)
local larry6305 =game["HttpGet"]
local larry6306 =larry6305(game, "https://pastefy.app/kuj642Tu/raw")
local larry6307 =loadstring(larry6306)
local larry6308 =larry6307()