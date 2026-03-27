-- special dumped using larry dec/deobf (dsc.gg/larrydeobf)
-- script id: 51209c0d81dc36bb.lua
local larry4 =game["HttpGet"]
local larry5 =larry4(game, "https://raw.githubusercontent.com/eeeiqjjj/WindUI/main/dist/main.lua")
local larry6 =loadstring(larry5)
local larry7 =larry6()
local larry8 =game["GetService"]
local larry9 =larry8(game, "Players")
local larry10 =larry9["LocalPlayer"]
local larry11 =workspace["CurrentCamera"]
local larry12 =game["GetService"]
local larry13 =larry12(game, "RunService")
local larry14 =game["GetService"]
local larry15 =larry14(game, "Workspace")
local larry16 =game["GetService"]
local larry17 =larry16(game, "ReplicatedStorage")
local larry18 =game["GetService"]
local larry19 =larry18(game, "Lighting")
local larry20 =game["GetService"]
local larry21 =larry20(game, "StarterGui")
local larry22 =larry7["CreateWindow"]
local larry23 =UDim2["fromOffset"]
local larry24 =larry23(620, 460)
local larry25 =larry22(larry7, {
  ["Folder"] = "Ringta Scripts",
  ["Title"] = "RINGTA SCRIPTS",
  ["HasOutline"] = true,
  ["Theme"] = "Dark",
  ["Author"] = "RINGTA and BUBLIK6241",
  ["Icon"] = "star",
  ["Size"] = larry24,
})
local larry26 =larry25["EditOpenButton"]
local larry27 =UDim["new"]
local larry28 =larry27(0, 6)
local larry29 =ColorSequence["new"]
local larry30 =Color3["fromRGB"]
local larry31 =larry30(200, 0, 255)
local larry32 =Color3["fromRGB"]
local larry33 =larry32(0, 200, 255)
local larry34 =larry29(larry31, larry33)
local larry35 =larry26(larry25, {
  ["StrokeThickness"] = 2,
  ["Title"] = "Open RINGTA SCRIPTS",
  ["OnlyMobile"] = false,
  ["Color"] = larry34,
  ["Draggable"] = true,
  ["Icon"] = "pointer",
  ["CornerRadius"] = larry28,
})
local larry36 =larry25["Section"]
local larry37 =larry36(larry25, {
  ["Title"] = "Home",
  ["Icon"] = "star",
  ["Opened"] = true,
})
local larry38 =larry25["Section"]
local larry39 =larry38(larry25, {
  ["Title"] = "Features",
  ["Icon"] = "package",
  ["Opened"] = true,
})
local larry40 =larry37["Tab"]
local larry41 =larry40(larry37, {
  ["ShowTabTitle"] = true,
  ["Title"] = "Home",
  ["Icon"] = "star",
  ["Desc"] = "Info & Settings",
})
local larry42 =larry39["Tab"]
local larry43 =larry42(larry39, {
  ["ShowTabTitle"] = true,
  ["Title"] = "Main",
  ["Icon"] = "star",
  ["Desc"] = "Main Features",
})
local larry44 =larry39["Tab"]
local larry45 =larry44(larry39, {
  ["ShowTabTitle"] = true,
  ["Title"] = "Teleport",
  ["Icon"] = "rocket",
  ["Desc"] = "Teleport Features",
})
local larry46 =larry39["Tab"]
local larry47 =larry46(larry39, {
  ["ShowTabTitle"] = true,
  ["Title"] = "Bring Items",
  ["Icon"] = "package",
  ["Desc"] = "Bring Features",
})
local larry48 =larry39["Tab"]
local larry49 =larry48(larry39, {
  ["ShowTabTitle"] = true,
  ["Title"] = "Combat",
  ["Icon"] = "skull",
  ["Desc"] = "Combat Features",
})
local larry50 =larry39["Tab"]
local larry51 =larry50(larry39, {
  ["ShowTabTitle"] = true,
  ["Title"] = "Misc",
  ["Icon"] = "gift",
  ["Desc"] = "Misc Features",
})
local larry52 =larry39["Tab"]
local larry53 =larry52(larry39, {
  ["ShowTabTitle"] = true,
  ["Title"] = "Esp",
  ["Icon"] = "eye",
  ["Desc"] = "ESP Features",
})
local larry54 =larry39["Tab"]
local larry55 =larry54(larry39, {
  ["ShowTabTitle"] = true,
  ["Title"] = "Credits",
  ["Icon"] = "award",
  ["Desc"] = "Credits",
})
local larry56 =larry39["Tab"]
local larry57 =larry56(larry39, {
  ["ShowTabTitle"] = true,
  ["Title"] = "Content Creators",
  ["Icon"] = "youtube",
  ["Desc"] = "Videos",
})
local larry58 =larry41["Paragraph"]
local larry59 =larry58(larry41, {
  ["Color"] = "Green",
  ["Locked"] = false,
  ["Title"] = "Open UI IN PC",
  ["Desc"] = "PRESS G in your keyboard to open the ui in pc if it disappears when minimizing the ui",
})
local larry60 =game["GetService"]
local larry61 =larry60(game, "HttpService")
local larry62 =game["GetService"]
local larry63 =larry62(game, "Players")
local larry64 =larry61["JSONDecode"]
local larry65 =larry7["Creator"]
local larry66 =larry65["Request"]
local larry67 =larry66({
  ["Url"] = "https://discord.com/api/larry10/invites/ringta?with_counts=true&with_expiration=true",
  ["Method"] = "GET",
  ["Headers"] = {
  ["User-Agent"] = "RobloxBot/1.0",
  ["Accept"] = "application/json",
},
})
local larry68 =larry67["Body"]
local larry69 =larry64(larry61, larry68)
local larry70 =larry69["guild"]
local larry71 =larry41["Paragraph"]
local larry72 =larry69["guild"]
local larry73 =larry72["name"]
local larry74 =larry69["approximate_member_count"]
local larry75 =larry69["approximate_presence_count"]
local larry78 =setclipboard("discord.gg/ringta")
local larry79 =larry7["Notify"]
local larry80 =larry79(larry7, {
  ["Icon"] = "square-arrow-out-up-right",
  ["Duration"] = 10,
  ["Content"] = "Discord Invite has been copied to your clipboard!",
  ["Title"] = "Invite Copied",
})
local larry82 =setclipboard("https://www.youtube.com/@RINGTASCRIPTS")
local larry83 =larry7["Notify"]
local larry84 =larry83(larry7, {
  ["Icon"] = "square-arrow-out-up-right",
  ["Duration"] = 10,
  ["Content"] = "Youtube Link has been copied to your clipboard!",
  ["Title"] = "Link Copied",
})
local larry76 =larry71(larry41, {
  ["Title"] = larry73,
  ["Buttons"] = {
  [1] = {
  ["Callback"] = function(...)
local _77_vararg1, _77_vararg2, _77_vararg3, _77_vararg4, _77_vararg5, _77_vararg6, _77_vararg7, _77_vararg8, _77_vararg9, _77_vararg10 = ...
local larry78 =setclipboard("discord.gg/ringta")
local larry79 =larry7["Notify"]
local larry80 =larry79(larry7, {
  ["Icon"] = "square-arrow-out-up-right",
  ["Duration"] = 10,
  ["Content"] = "Discord Invite has been copied to your clipboard!",
  ["Title"] = "Invite Copied",
})
end,
  ["Icon"] = "message-circle",
  ["Title"] = "Discord",
},
  [2] = {
  ["Callback"] = function(...)
local _81_vararg1, _81_vararg2, _81_vararg3, _81_vararg4, _81_vararg5, _81_vararg6, _81_vararg7, _81_vararg8, _81_vararg9, _81_vararg10 = ...
local larry82 =setclipboard("https://www.youtube.com/@RINGTASCRIPTS")
local larry83 =larry7["Notify"]
local larry84 =larry83(larry7, {
  ["Icon"] = "square-arrow-out-up-right",
  ["Duration"] = 10,
  ["Content"] = "Youtube Link has been copied to your clipboard!",
  ["Title"] = "Link Copied",
})
end,
  ["Icon"] = "youtube",
  ["Title"] = "Youtube",
},
},
  ["ImageSize"] = 34,
  ["Thumbnail"] = "rbxassetid://131915027058214",
  ["Desc"] = "<font color=\"#52525b\">\xE2\x80\xA2</font> Members: <larry_concat_me>larry74</larry_concat_me>\n<font color=\"#16a34a\">\xE2\x80\xA2</font> Online: <larry_concat_me>larry75</larry_concat_me>",
})
local larry85 =larry41["Section"]
local larry86 =larry85(larry41, {
  ["Icon"] = "app-window-mac",
  ["TextSize"] = 17,
  ["Title"] = "Window",
  ["TextXAlignment"] = "Left",
})
local larry87 =larry7["GetThemes"]
local larry88 =larry87(larry7)
local larry90 =larry41["Dropdown"]
local larry93 =larry7["SetTheme"]
local larry94 =larry93(larry7, _92_vararg1)
local larry91 =larry90(larry41, {
  ["Title"] = "Theme",
  ["Values"] = {
  [1] = larry89,
},
  ["Value"] = "Dark",
  ["Multi"] = false,
  ["Callback"] = function(...)
local _92_vararg1, _92_vararg2, _92_vararg3, _92_vararg4, _92_vararg5, _92_vararg6, _92_vararg7, _92_vararg8, _92_vararg9, _92_vararg10 = ...
local larry93 =larry7["SetTheme"]
local larry94 =larry93(larry7, _92_vararg1)
end,
  ["AllowNone"] = false,
})
local larry95 =larry41["Toggle"]
local larry96 =larry7["GetTransparency"]
local larry97 =larry96(larry7)
local larry100 =larry25["ToggleTransparency"]
local larry101 =larry100(larry25, _99_vararg1)
local larry98 =larry95(larry41, {
  ["Value"] = larry97,
  ["Callback"] = function(...)
local _99_vararg1, _99_vararg2, _99_vararg3, _99_vararg4, _99_vararg5, _99_vararg6, _99_vararg7, _99_vararg8, _99_vararg9, _99_vararg10 = ...
local larry100 =larry25["ToggleTransparency"]
local larry101 =larry100(larry25, _99_vararg1)
end,
  ["Icon"] = "palette",
  ["Title"] = "Transparency",
})
local larry102 =larry41["Paragraph"]
local larry103 =larry102(larry41, {
  ["Color"] = "Green",
  ["Locked"] = false,
  ["Title"] = "CONTENT CREATOR",
  ["Desc"] = "if you upload a video on this script and dm ringta in discord you will get the content creator role and your video will be published in a showcase channel which can get you free views + you get access to 2 cool private channels the video DOES NOT HAVE TO GET ALOT OF VIEWS AND YOU don't need a lot of subs just make a good video and put some effort in and your good (: ",
})
local larry104 =larry25["SetToggleKey"]
local larry105 =Enum["KeyCode"]
local larry106 =larry105["G"]
local larry107 =larry104(larry25, larry106)
local larry108 =larry43["Section"]
local larry109 =larry108(larry43, {
  ["Opened"] = false,
  ["Title"] = "Auto Fuel CampFire",
  ["Icon"] = "flame",
  ["Desc"] = "Auto Level Up Campfire",
})
local larry110 =larry109["Dropdown"]
local larry111 =larry110(larry109, {
  ["Title"] = "Choose Fuel Items",
  ["AllowNone"] = true,
  ["Value"] = {
  [1] = "Coal",
  [2] = "Fuel Canister",
  [3] = "Oil Barrel",
  [4] = "Biofuel",
  [5] = "Chair",
},
  ["Multi"] = true,
  ["Callback"] = function(...)
local _112_vararg1, _112_vararg2, _112_vararg3, _112_vararg4, _112_vararg5, _112_vararg6, _112_vararg7, _112_vararg8, _112_vararg9, _112_vararg10 = ...
genv["AutoFuelCampfireList"]=_112_vararg1
end,
  ["Values"] = {
  [1] = "Log",
  [2] = "Coal",
  [3] = "Fuel Canister",
  [4] = "Oil Barrel",
  [5] = "Biofuel",
  [6] = "Chair",
  [7] = "Crossbow Cultist",
  [8] = "Cultist",
  [9] = "Juggernaut Cultist",
  [10] = "Cultist King",
  [11] = "Wolf Corpse",
  [12] = "Bear Corpse",
},
})
local larry113 =larry15["WaitForChild"]
local larry114 =larry113(larry15, "Items")
local larry115 =larry17["WaitForChild"]
local larry116 =larry115(larry17, "RemoteEvents")
local larry117 =larry109["Button"]
local larry122 =larry114["GetChildren"]
local larry123 =larry122(larry114)
local larry125 =_124_2["Name"]
local larry126 =tick()
local larry127 =larry7["Notify"]
local larry128 =larry127(larry7, {
  ["Icon"] = "x",
  ["Duration"] = 2,
  ["Content"] = "No eligible items found for fueling!",
  ["Title"] = "Auto Fuel",
})
local larry118 =larry117(larry109, {
  ["Callback"] = function(...)
local _119_vararg1, _119_vararg2, _119_vararg3, _119_vararg4, _119_vararg5, _119_vararg6, _119_vararg7, _119_vararg8, _119_vararg9, _119_vararg10 = ...
local larry120 =genv["AutoFuelCampfireList"]
for larry121, _121_2 in ipairs(_112_vararg1) do
end
local larry122 =larry114["GetChildren"]
local larry123 =larry122(larry114)
for larry124, _124_2 in ipairs(larry123) do
local larry125 =_124_2["Name"]
end
local larry126 =tick()
local larry127 =larry7["Notify"]
local larry128 =larry127(larry7, {
  ["Icon"] = "x",
  ["Duration"] = 2,
  ["Content"] = "No eligible items found for fueling!",
  ["Title"] = "Auto Fuel",
})
end,
  ["Icon"] = "flame",
  ["Title"] = "Fuel CampFire",
})
local larry129 =larry109["Toggle"]
local larry137 =larry114["GetChildren"]
local larry138 =larry137(larry114)
local larry140 =_139_2["Name"]
local larry141 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry148 =larry114["GetChildren"]
local larry149 =larry148(larry114)
local larry151 =_150_2["Name"]
local larry152 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry159 =larry114["GetChildren"]
local larry160 =larry159(larry114)
local larry162 =_161_2["Name"]
local larry163 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry170 =larry114["GetChildren"]
local larry171 =larry170(larry114)
local larry173 =_172_2["Name"]
local larry174 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry181 =larry114["GetChildren"]
local larry182 =larry181(larry114)
local larry184 =_183_2["Name"]
local larry185 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry192 =larry114["GetChildren"]
local larry193 =larry192(larry114)
local larry195 =_194_2["Name"]
local larry196 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry203 =larry114["GetChildren"]
local larry204 =larry203(larry114)
local larry206 =_205_2["Name"]
local larry207 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry214 =larry114["GetChildren"]
local larry215 =larry214(larry114)
local larry217 =_216_2["Name"]
local larry218 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry225 =larry114["GetChildren"]
local larry226 =larry225(larry114)
local larry228 =_227_2["Name"]
local larry229 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry236 =larry114["GetChildren"]
local larry237 =larry236(larry114)
local larry239 =_238_2["Name"]
local larry240 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry247 =larry114["GetChildren"]
local larry248 =larry247(larry114)
local larry250 =_249_2["Name"]
local larry251 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry258 =larry114["GetChildren"]
local larry259 =larry258(larry114)
local larry261 =_260_2["Name"]
local larry262 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry269 =larry114["GetChildren"]
local larry270 =larry269(larry114)
local larry272 =_271_2["Name"]
local larry273 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry280 =larry114["GetChildren"]
local larry281 =larry280(larry114)
local larry283 =_282_2["Name"]
local larry284 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry291 =larry114["GetChildren"]
local larry292 =larry291(larry114)
local larry294 =_293_2["Name"]
local larry295 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry302 =larry114["GetChildren"]
local larry303 =larry302(larry114)
local larry305 =_304_2["Name"]
local larry306 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry313 =larry114["GetChildren"]
local larry314 =larry313(larry114)
local larry316 =_315_2["Name"]
local larry317 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry324 =larry114["GetChildren"]
local larry325 =larry324(larry114)
local larry327 =_326_2["Name"]
local larry328 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry335 =larry114["GetChildren"]
local larry336 =larry335(larry114)
local larry338 =_337_2["Name"]
local larry339 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry346 =larry114["GetChildren"]
local larry347 =larry346(larry114)
local larry349 =_348_2["Name"]
local larry350 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry357 =larry114["GetChildren"]
local larry358 =larry357(larry114)
local larry360 =_359_2["Name"]
local larry361 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry368 =larry114["GetChildren"]
local larry369 =larry368(larry114)
local larry371 =_370_2["Name"]
local larry372 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry379 =larry114["GetChildren"]
local larry380 =larry379(larry114)
local larry382 =_381_2["Name"]
local larry383 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry390 =larry114["GetChildren"]
local larry391 =larry390(larry114)
local larry393 =_392_2["Name"]
local larry394 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry401 =larry114["GetChildren"]
local larry402 =larry401(larry114)
local larry404 =_403_2["Name"]
local larry405 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry412 =larry114["GetChildren"]
local larry413 =larry412(larry114)
local larry415 =_414_2["Name"]
local larry416 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry423 =larry114["GetChildren"]
local larry424 =larry423(larry114)
local larry426 =_425_2["Name"]
local larry427 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry434 =larry114["GetChildren"]
local larry435 =larry434(larry114)
local larry437 =_436_2["Name"]
local larry438 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry445 =larry114["GetChildren"]
local larry446 =larry445(larry114)
local larry448 =_447_2["Name"]
local larry449 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry456 =larry114["GetChildren"]
local larry457 =larry456(larry114)
local larry459 =_458_2["Name"]
local larry460 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry467 =larry114["GetChildren"]
local larry468 =larry467(larry114)
local larry470 =_469_2["Name"]
local larry471 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry478 =larry114["GetChildren"]
local larry479 =larry478(larry114)
local larry481 =_480_2["Name"]
local larry482 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry489 =larry114["GetChildren"]
local larry490 =larry489(larry114)
local larry492 =_491_2["Name"]
local larry493 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry500 =larry114["GetChildren"]
local larry501 =larry500(larry114)
local larry503 =_502_2["Name"]
local larry504 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry511 =larry114["GetChildren"]
local larry512 =larry511(larry114)
local larry514 =_513_2["Name"]
local larry515 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry522 =larry114["GetChildren"]
local larry523 =larry522(larry114)
local larry525 =_524_2["Name"]
local larry526 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry533 =larry114["GetChildren"]
local larry534 =larry533(larry114)
local larry536 =_535_2["Name"]
local larry537 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry544 =larry114["GetChildren"]
local larry545 =larry544(larry114)
local larry547 =_546_2["Name"]
local larry548 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry555 =larry114["GetChildren"]
local larry556 =larry555(larry114)
local larry558 =_557_2["Name"]
local larry559 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry566 =larry114["GetChildren"]
local larry567 =larry566(larry114)
local larry569 =_568_2["Name"]
local larry570 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry577 =larry114["GetChildren"]
local larry578 =larry577(larry114)
local larry580 =_579_2["Name"]
local larry581 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry588 =larry114["GetChildren"]
local larry589 =larry588(larry114)
local larry591 =_590_2["Name"]
local larry592 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry599 =larry114["GetChildren"]
local larry600 =larry599(larry114)
local larry602 =_601_2["Name"]
local larry603 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry610 =larry114["GetChildren"]
local larry611 =larry610(larry114)
local larry613 =_612_2["Name"]
local larry614 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry621 =larry114["GetChildren"]
local larry622 =larry621(larry114)
local larry624 =_623_2["Name"]
local larry625 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry632 =larry114["GetChildren"]
local larry633 =larry632(larry114)
local larry635 =_634_2["Name"]
local larry636 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry643 =larry114["GetChildren"]
local larry644 =larry643(larry114)
local larry646 =_645_2["Name"]
local larry647 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry654 =larry114["GetChildren"]
local larry655 =larry654(larry114)
local larry657 =_656_2["Name"]
local larry658 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry665 =larry114["GetChildren"]
local larry666 =larry665(larry114)
local larry668 =_667_2["Name"]
local larry669 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry676 =larry114["GetChildren"]
local larry677 =larry676(larry114)
local larry679 =_678_2["Name"]
local larry680 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry687 =larry114["GetChildren"]
local larry688 =larry687(larry114)
local larry690 =_689_2["Name"]
local larry691 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry698 =larry114["GetChildren"]
local larry699 =larry698(larry114)
local larry701 =_700_2["Name"]
local larry702 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry709 =larry114["GetChildren"]
local larry710 =larry709(larry114)
local larry712 =_711_2["Name"]
local larry713 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry720 =larry114["GetChildren"]
local larry721 =larry720(larry114)
local larry723 =_722_2["Name"]
local larry724 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry731 =larry114["GetChildren"]
local larry732 =larry731(larry114)
local larry734 =_733_2["Name"]
local larry735 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry742 =larry114["GetChildren"]
local larry743 =larry742(larry114)
local larry745 =_744_2["Name"]
local larry746 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry753 =larry114["GetChildren"]
local larry754 =larry753(larry114)
local larry756 =_755_2["Name"]
local larry757 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry764 =larry114["GetChildren"]
local larry765 =larry764(larry114)
local larry767 =_766_2["Name"]
local larry768 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry775 =larry114["GetChildren"]
local larry776 =larry775(larry114)
local larry778 =_777_2["Name"]
local larry779 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry786 =larry114["GetChildren"]
local larry787 =larry786(larry114)
local larry789 =_788_2["Name"]
local larry790 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry797 =larry114["GetChildren"]
local larry798 =larry797(larry114)
local larry800 =_799_2["Name"]
local larry801 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry808 =larry114["GetChildren"]
local larry809 =larry808(larry114)
local larry811 =_810_2["Name"]
local larry812 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry819 =larry114["GetChildren"]
local larry820 =larry819(larry114)
local larry822 =_821_2["Name"]
local larry823 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry830 =larry114["GetChildren"]
local larry831 =larry830(larry114)
local larry833 =_832_2["Name"]
local larry834 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry841 =larry114["GetChildren"]
local larry842 =larry841(larry114)
local larry844 =_843_2["Name"]
local larry845 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry852 =larry114["GetChildren"]
local larry853 =larry852(larry114)
local larry855 =_854_2["Name"]
local larry856 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry863 =larry114["GetChildren"]
local larry864 =larry863(larry114)
local larry866 =_865_2["Name"]
local larry867 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry874 =larry114["GetChildren"]
local larry875 =larry874(larry114)
local larry877 =_876_2["Name"]
local larry878 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry885 =larry114["GetChildren"]
local larry886 =larry885(larry114)
local larry888 =_887_2["Name"]
local larry889 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry896 =larry114["GetChildren"]
local larry897 =larry896(larry114)
local larry899 =_898_2["Name"]
local larry900 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry907 =larry114["GetChildren"]
local larry908 =larry907(larry114)
local larry910 =_909_2["Name"]
local larry911 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry918 =larry114["GetChildren"]
local larry919 =larry918(larry114)
local larry921 =_920_2["Name"]
local larry922 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry929 =larry114["GetChildren"]
local larry930 =larry929(larry114)
local larry932 =_931_2["Name"]
local larry933 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry940 =larry114["GetChildren"]
local larry941 =larry940(larry114)
local larry943 =_942_2["Name"]
local larry944 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry951 =larry114["GetChildren"]
local larry952 =larry951(larry114)
local larry954 =_953_2["Name"]
local larry955 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry962 =larry114["GetChildren"]
local larry963 =larry962(larry114)
local larry965 =_964_2["Name"]
local larry966 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry973 =larry114["GetChildren"]
local larry974 =larry973(larry114)
local larry976 =_975_2["Name"]
local larry977 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry984 =larry114["GetChildren"]
local larry985 =larry984(larry114)
local larry987 =_986_2["Name"]
local larry988 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry995 =larry114["GetChildren"]
local larry996 =larry995(larry114)
local larry998 =_997_2["Name"]
local larry999 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1006 =larry114["GetChildren"]
local larry1007 =larry1006(larry114)
local larry1009 =_1008_2["Name"]
local larry1010 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1017 =larry114["GetChildren"]
local larry1018 =larry1017(larry114)
local larry1020 =_1019_2["Name"]
local larry1021 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1028 =larry114["GetChildren"]
local larry1029 =larry1028(larry114)
local larry1031 =_1030_2["Name"]
local larry1032 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1039 =larry114["GetChildren"]
local larry1040 =larry1039(larry114)
local larry1042 =_1041_2["Name"]
local larry1043 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1050 =larry114["GetChildren"]
local larry1051 =larry1050(larry114)
local larry1053 =_1052_2["Name"]
local larry1054 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1061 =larry114["GetChildren"]
local larry1062 =larry1061(larry114)
local larry1064 =_1063_2["Name"]
local larry1065 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1072 =larry114["GetChildren"]
local larry1073 =larry1072(larry114)
local larry1075 =_1074_2["Name"]
local larry1076 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1083 =larry114["GetChildren"]
local larry1084 =larry1083(larry114)
local larry1086 =_1085_2["Name"]
local larry1087 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1094 =larry114["GetChildren"]
local larry1095 =larry1094(larry114)
local larry1097 =_1096_2["Name"]
local larry1098 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1105 =larry114["GetChildren"]
local larry1106 =larry1105(larry114)
local larry1108 =_1107_2["Name"]
local larry1109 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1116 =larry114["GetChildren"]
local larry1117 =larry1116(larry114)
local larry1119 =_1118_2["Name"]
local larry1120 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1127 =larry114["GetChildren"]
local larry1128 =larry1127(larry114)
local larry1130 =_1129_2["Name"]
local larry1131 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1138 =larry114["GetChildren"]
local larry1139 =larry1138(larry114)
local larry1141 =_1140_2["Name"]
local larry1142 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1149 =larry114["GetChildren"]
local larry1150 =larry1149(larry114)
local larry1152 =_1151_2["Name"]
local larry1153 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1160 =larry114["GetChildren"]
local larry1161 =larry1160(larry114)
local larry1163 =_1162_2["Name"]
local larry1164 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1171 =larry114["GetChildren"]
local larry1172 =larry1171(larry114)
local larry1174 =_1173_2["Name"]
local larry1175 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1182 =larry114["GetChildren"]
local larry1183 =larry1182(larry114)
local larry1185 =_1184_2["Name"]
local larry1186 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1193 =larry114["GetChildren"]
local larry1194 =larry1193(larry114)
local larry1196 =_1195_2["Name"]
local larry1197 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1204 =larry114["GetChildren"]
local larry1205 =larry1204(larry114)
local larry1207 =_1206_2["Name"]
local larry1208 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1215 =larry114["GetChildren"]
local larry1216 =larry1215(larry114)
local larry1218 =_1217_2["Name"]
local larry1219 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1226 =larry114["GetChildren"]
local larry1227 =larry1226(larry114)
local larry1229 =_1228_2["Name"]
local larry1230 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1237 =larry114["GetChildren"]
local larry1238 =larry1237(larry114)
local larry1240 =_1239_2["Name"]
local larry1241 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1248 =larry114["GetChildren"]
local larry1249 =larry1248(larry114)
local larry1251 =_1250_2["Name"]
local larry1252 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1259 =larry114["GetChildren"]
local larry1260 =larry1259(larry114)
local larry1262 =_1261_2["Name"]
local er =error("Luraph Script:355: Luraph Script:297: Luraph Script:287: internal 542: <larry: infinitelooperror>")
local larry132 =spawn(function(...)
local _133_vararg1, _133_vararg2, _133_vararg3, _133_vararg4, _133_vararg5, _133_vararg6, _133_vararg7, _133_vararg8, _133_vararg9, _133_vararg10 = ...
local larry134 =genv["AutoFuelCampfireRunning"]
local larry135 =genv["AutoFuelCampfireList"]
for larry136, _136_2 in ipairs(_112_vararg1) do
end
local larry137 =larry114["GetChildren"]
local larry138 =larry137(larry114)
for larry139, _139_2 in ipairs(larry138) do
local larry140 =_139_2["Name"]
end
local larry141 =tick()
local larry142 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry143 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry144 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry145 =genv["AutoFuelCampfireRunning"]
local larry146 =genv["AutoFuelCampfireList"]
for larry147, _147_2 in ipairs(_112_vararg1) do
end
local larry148 =larry114["GetChildren"]
local larry149 =larry148(larry114)
for larry150, _150_2 in ipairs(larry149) do
local larry151 =_150_2["Name"]
end
local larry152 =tick()
local larry153 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry154 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry155 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry156 =genv["AutoFuelCampfireRunning"]
local larry157 =genv["AutoFuelCampfireList"]
for larry158, _158_2 in ipairs(_112_vararg1) do
end
local larry159 =larry114["GetChildren"]
local larry160 =larry159(larry114)
for larry161, _161_2 in ipairs(larry160) do
local larry162 =_161_2["Name"]
end
local larry163 =tick()
local larry164 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry165 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry166 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry167 =genv["AutoFuelCampfireRunning"]
local larry168 =genv["AutoFuelCampfireList"]
for larry169, _169_2 in ipairs(_112_vararg1) do
end
local larry170 =larry114["GetChildren"]
local larry171 =larry170(larry114)
for larry172, _172_2 in ipairs(larry171) do
local larry173 =_172_2["Name"]
end
local larry174 =tick()
local larry175 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry176 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry177 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry178 =genv["AutoFuelCampfireRunning"]
local larry179 =genv["AutoFuelCampfireList"]
for larry180, _180_2 in ipairs(_112_vararg1) do
end
local larry181 =larry114["GetChildren"]
local larry182 =larry181(larry114)
for larry183, _183_2 in ipairs(larry182) do
local larry184 =_183_2["Name"]
end
local larry185 =tick()
local larry186 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry187 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry188 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry189 =genv["AutoFuelCampfireRunning"]
local larry190 =genv["AutoFuelCampfireList"]
for larry191, _191_2 in ipairs(_112_vararg1) do
end
local larry192 =larry114["GetChildren"]
local larry193 =larry192(larry114)
for larry194, _194_2 in ipairs(larry193) do
local larry195 =_194_2["Name"]
end
local larry196 =tick()
local larry197 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry198 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry199 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry200 =genv["AutoFuelCampfireRunning"]
local larry201 =genv["AutoFuelCampfireList"]
for larry202, _202_2 in ipairs(_112_vararg1) do
end
local larry203 =larry114["GetChildren"]
local larry204 =larry203(larry114)
for larry205, _205_2 in ipairs(larry204) do
local larry206 =_205_2["Name"]
end
local larry207 =tick()
local larry208 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry209 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry210 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry211 =genv["AutoFuelCampfireRunning"]
local larry212 =genv["AutoFuelCampfireList"]
for larry213, _213_2 in ipairs(_112_vararg1) do
end
local larry214 =larry114["GetChildren"]
local larry215 =larry214(larry114)
for larry216, _216_2 in ipairs(larry215) do
local larry217 =_216_2["Name"]
end
local larry218 =tick()
local larry219 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry220 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry221 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry222 =genv["AutoFuelCampfireRunning"]
local larry223 =genv["AutoFuelCampfireList"]
for larry224, _224_2 in ipairs(_112_vararg1) do
end
local larry225 =larry114["GetChildren"]
local larry226 =larry225(larry114)
for larry227, _227_2 in ipairs(larry226) do
local larry228 =_227_2["Name"]
end
local larry229 =tick()
local larry230 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry231 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry232 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry233 =genv["AutoFuelCampfireRunning"]
local larry234 =genv["AutoFuelCampfireList"]
for larry235, _235_2 in ipairs(_112_vararg1) do
end
local larry236 =larry114["GetChildren"]
local larry237 =larry236(larry114)
for larry238, _238_2 in ipairs(larry237) do
local larry239 =_238_2["Name"]
end
local larry240 =tick()
local larry241 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry242 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry243 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry244 =genv["AutoFuelCampfireRunning"]
local larry245 =genv["AutoFuelCampfireList"]
for larry246, _246_2 in ipairs(_112_vararg1) do
end
local larry247 =larry114["GetChildren"]
local larry248 =larry247(larry114)
for larry249, _249_2 in ipairs(larry248) do
local larry250 =_249_2["Name"]
end
local larry251 =tick()
local larry252 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry253 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry254 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry255 =genv["AutoFuelCampfireRunning"]
local larry256 =genv["AutoFuelCampfireList"]
for larry257, _257_2 in ipairs(_112_vararg1) do
end
local larry258 =larry114["GetChildren"]
local larry259 =larry258(larry114)
for larry260, _260_2 in ipairs(larry259) do
local larry261 =_260_2["Name"]
end
local larry262 =tick()
local larry263 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry264 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry265 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry266 =genv["AutoFuelCampfireRunning"]
local larry267 =genv["AutoFuelCampfireList"]
for larry268, _268_2 in ipairs(_112_vararg1) do
end
local larry269 =larry114["GetChildren"]
local larry270 =larry269(larry114)
for larry271, _271_2 in ipairs(larry270) do
local larry272 =_271_2["Name"]
end
local larry273 =tick()
local larry274 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry275 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry276 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry277 =genv["AutoFuelCampfireRunning"]
local larry278 =genv["AutoFuelCampfireList"]
for larry279, _279_2 in ipairs(_112_vararg1) do
end
local larry280 =larry114["GetChildren"]
local larry281 =larry280(larry114)
for larry282, _282_2 in ipairs(larry281) do
local larry283 =_282_2["Name"]
end
local larry284 =tick()
local larry285 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry286 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry287 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry288 =genv["AutoFuelCampfireRunning"]
local larry289 =genv["AutoFuelCampfireList"]
for larry290, _290_2 in ipairs(_112_vararg1) do
end
local larry291 =larry114["GetChildren"]
local larry292 =larry291(larry114)
for larry293, _293_2 in ipairs(larry292) do
local larry294 =_293_2["Name"]
end
local larry295 =tick()
local larry296 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry297 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry298 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry299 =genv["AutoFuelCampfireRunning"]
local larry300 =genv["AutoFuelCampfireList"]
for larry301, _301_2 in ipairs(_112_vararg1) do
end
local larry302 =larry114["GetChildren"]
local larry303 =larry302(larry114)
for larry304, _304_2 in ipairs(larry303) do
local larry305 =_304_2["Name"]
end
local larry306 =tick()
local larry307 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry308 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry309 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry310 =genv["AutoFuelCampfireRunning"]
local larry311 =genv["AutoFuelCampfireList"]
for larry312, _312_2 in ipairs(_112_vararg1) do
end
local larry313 =larry114["GetChildren"]
local larry314 =larry313(larry114)
for larry315, _315_2 in ipairs(larry314) do
local larry316 =_315_2["Name"]
end
local larry317 =tick()
local larry318 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry319 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry320 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry321 =genv["AutoFuelCampfireRunning"]
local larry322 =genv["AutoFuelCampfireList"]
for larry323, _323_2 in ipairs(_112_vararg1) do
end
local larry324 =larry114["GetChildren"]
local larry325 =larry324(larry114)
for larry326, _326_2 in ipairs(larry325) do
local larry327 =_326_2["Name"]
end
local larry328 =tick()
local larry329 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry330 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry331 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry332 =genv["AutoFuelCampfireRunning"]
local larry333 =genv["AutoFuelCampfireList"]
for larry334, _334_2 in ipairs(_112_vararg1) do
end
local larry335 =larry114["GetChildren"]
local larry336 =larry335(larry114)
for larry337, _337_2 in ipairs(larry336) do
local larry338 =_337_2["Name"]
end
local larry339 =tick()
local larry340 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry341 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry342 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry343 =genv["AutoFuelCampfireRunning"]
local larry344 =genv["AutoFuelCampfireList"]
for larry345, _345_2 in ipairs(_112_vararg1) do
end
local larry346 =larry114["GetChildren"]
local larry347 =larry346(larry114)
for larry348, _348_2 in ipairs(larry347) do
local larry349 =_348_2["Name"]
end
local larry350 =tick()
local larry351 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry352 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry353 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry354 =genv["AutoFuelCampfireRunning"]
local larry355 =genv["AutoFuelCampfireList"]
for larry356, _356_2 in ipairs(_112_vararg1) do
end
local larry357 =larry114["GetChildren"]
local larry358 =larry357(larry114)
for larry359, _359_2 in ipairs(larry358) do
local larry360 =_359_2["Name"]
end
local larry361 =tick()
local larry362 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry363 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry364 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry365 =genv["AutoFuelCampfireRunning"]
local larry366 =genv["AutoFuelCampfireList"]
for larry367, _367_2 in ipairs(_112_vararg1) do
end
local larry368 =larry114["GetChildren"]
local larry369 =larry368(larry114)
for larry370, _370_2 in ipairs(larry369) do
local larry371 =_370_2["Name"]
end
local larry372 =tick()
local larry373 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry374 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry375 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry376 =genv["AutoFuelCampfireRunning"]
local larry377 =genv["AutoFuelCampfireList"]
for larry378, _378_2 in ipairs(_112_vararg1) do
end
local larry379 =larry114["GetChildren"]
local larry380 =larry379(larry114)
for larry381, _381_2 in ipairs(larry380) do
local larry382 =_381_2["Name"]
end
local larry383 =tick()
local larry384 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry385 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry386 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry387 =genv["AutoFuelCampfireRunning"]
local larry388 =genv["AutoFuelCampfireList"]
for larry389, _389_2 in ipairs(_112_vararg1) do
end
local larry390 =larry114["GetChildren"]
local larry391 =larry390(larry114)
for larry392, _392_2 in ipairs(larry391) do
local larry393 =_392_2["Name"]
end
local larry394 =tick()
local larry395 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry396 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry397 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry398 =genv["AutoFuelCampfireRunning"]
local larry399 =genv["AutoFuelCampfireList"]
for larry400, _400_2 in ipairs(_112_vararg1) do
end
local larry401 =larry114["GetChildren"]
local larry402 =larry401(larry114)
for larry403, _403_2 in ipairs(larry402) do
local larry404 =_403_2["Name"]
end
local larry405 =tick()
local larry406 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry407 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry408 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry409 =genv["AutoFuelCampfireRunning"]
local larry410 =genv["AutoFuelCampfireList"]
for larry411, _411_2 in ipairs(_112_vararg1) do
end
local larry412 =larry114["GetChildren"]
local larry413 =larry412(larry114)
for larry414, _414_2 in ipairs(larry413) do
local larry415 =_414_2["Name"]
end
local larry416 =tick()
local larry417 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry418 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry419 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry420 =genv["AutoFuelCampfireRunning"]
local larry421 =genv["AutoFuelCampfireList"]
for larry422, _422_2 in ipairs(_112_vararg1) do
end
local larry423 =larry114["GetChildren"]
local larry424 =larry423(larry114)
for larry425, _425_2 in ipairs(larry424) do
local larry426 =_425_2["Name"]
end
local larry427 =tick()
local larry428 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry429 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry430 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry431 =genv["AutoFuelCampfireRunning"]
local larry432 =genv["AutoFuelCampfireList"]
for larry433, _433_2 in ipairs(_112_vararg1) do
end
local larry434 =larry114["GetChildren"]
local larry435 =larry434(larry114)
for larry436, _436_2 in ipairs(larry435) do
local larry437 =_436_2["Name"]
end
local larry438 =tick()
local larry439 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry440 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry441 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry442 =genv["AutoFuelCampfireRunning"]
local larry443 =genv["AutoFuelCampfireList"]
for larry444, _444_2 in ipairs(_112_vararg1) do
end
local larry445 =larry114["GetChildren"]
local larry446 =larry445(larry114)
for larry447, _447_2 in ipairs(larry446) do
local larry448 =_447_2["Name"]
end
local larry449 =tick()
local larry450 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry451 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry452 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry453 =genv["AutoFuelCampfireRunning"]
local larry454 =genv["AutoFuelCampfireList"]
for larry455, _455_2 in ipairs(_112_vararg1) do
end
local larry456 =larry114["GetChildren"]
local larry457 =larry456(larry114)
for larry458, _458_2 in ipairs(larry457) do
local larry459 =_458_2["Name"]
end
local larry460 =tick()
local larry461 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry462 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry463 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry464 =genv["AutoFuelCampfireRunning"]
local larry465 =genv["AutoFuelCampfireList"]
for larry466, _466_2 in ipairs(_112_vararg1) do
end
local larry467 =larry114["GetChildren"]
local larry468 =larry467(larry114)
for larry469, _469_2 in ipairs(larry468) do
local larry470 =_469_2["Name"]
end
local larry471 =tick()
local larry472 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry473 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry474 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry475 =genv["AutoFuelCampfireRunning"]
local larry476 =genv["AutoFuelCampfireList"]
for larry477, _477_2 in ipairs(_112_vararg1) do
end
local larry478 =larry114["GetChildren"]
local larry479 =larry478(larry114)
for larry480, _480_2 in ipairs(larry479) do
local larry481 =_480_2["Name"]
end
local larry482 =tick()
local larry483 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry484 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry485 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry486 =genv["AutoFuelCampfireRunning"]
local larry487 =genv["AutoFuelCampfireList"]
for larry488, _488_2 in ipairs(_112_vararg1) do
end
local larry489 =larry114["GetChildren"]
local larry490 =larry489(larry114)
for larry491, _491_2 in ipairs(larry490) do
local larry492 =_491_2["Name"]
end
local larry493 =tick()
local larry494 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry495 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry496 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry497 =genv["AutoFuelCampfireRunning"]
local larry498 =genv["AutoFuelCampfireList"]
for larry499, _499_2 in ipairs(_112_vararg1) do
end
local larry500 =larry114["GetChildren"]
local larry501 =larry500(larry114)
for larry502, _502_2 in ipairs(larry501) do
local larry503 =_502_2["Name"]
end
local larry504 =tick()
local larry505 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry506 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry507 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry508 =genv["AutoFuelCampfireRunning"]
local larry509 =genv["AutoFuelCampfireList"]
for larry510, _510_2 in ipairs(_112_vararg1) do
end
local larry511 =larry114["GetChildren"]
local larry512 =larry511(larry114)
for larry513, _513_2 in ipairs(larry512) do
local larry514 =_513_2["Name"]
end
local larry515 =tick()
local larry516 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry517 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry518 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry519 =genv["AutoFuelCampfireRunning"]
local larry520 =genv["AutoFuelCampfireList"]
for larry521, _521_2 in ipairs(_112_vararg1) do
end
local larry522 =larry114["GetChildren"]
local larry523 =larry522(larry114)
for larry524, _524_2 in ipairs(larry523) do
local larry525 =_524_2["Name"]
end
local larry526 =tick()
local larry527 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry528 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry529 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry530 =genv["AutoFuelCampfireRunning"]
local larry531 =genv["AutoFuelCampfireList"]
for larry532, _532_2 in ipairs(_112_vararg1) do
end
local larry533 =larry114["GetChildren"]
local larry534 =larry533(larry114)
for larry535, _535_2 in ipairs(larry534) do
local larry536 =_535_2["Name"]
end
local larry537 =tick()
local larry538 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry539 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry540 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry541 =genv["AutoFuelCampfireRunning"]
local larry542 =genv["AutoFuelCampfireList"]
for larry543, _543_2 in ipairs(_112_vararg1) do
end
local larry544 =larry114["GetChildren"]
local larry545 =larry544(larry114)
for larry546, _546_2 in ipairs(larry545) do
local larry547 =_546_2["Name"]
end
local larry548 =tick()
local larry549 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry550 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry551 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry552 =genv["AutoFuelCampfireRunning"]
local larry553 =genv["AutoFuelCampfireList"]
for larry554, _554_2 in ipairs(_112_vararg1) do
end
local larry555 =larry114["GetChildren"]
local larry556 =larry555(larry114)
for larry557, _557_2 in ipairs(larry556) do
local larry558 =_557_2["Name"]
end
local larry559 =tick()
local larry560 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry561 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry562 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry563 =genv["AutoFuelCampfireRunning"]
local larry564 =genv["AutoFuelCampfireList"]
for larry565, _565_2 in ipairs(_112_vararg1) do
end
local larry566 =larry114["GetChildren"]
local larry567 =larry566(larry114)
for larry568, _568_2 in ipairs(larry567) do
local larry569 =_568_2["Name"]
end
local larry570 =tick()
local larry571 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry572 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry573 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry574 =genv["AutoFuelCampfireRunning"]
local larry575 =genv["AutoFuelCampfireList"]
for larry576, _576_2 in ipairs(_112_vararg1) do
end
local larry577 =larry114["GetChildren"]
local larry578 =larry577(larry114)
for larry579, _579_2 in ipairs(larry578) do
local larry580 =_579_2["Name"]
end
local larry581 =tick()
local larry582 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry583 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry584 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry585 =genv["AutoFuelCampfireRunning"]
local larry586 =genv["AutoFuelCampfireList"]
for larry587, _587_2 in ipairs(_112_vararg1) do
end
local larry588 =larry114["GetChildren"]
local larry589 =larry588(larry114)
for larry590, _590_2 in ipairs(larry589) do
local larry591 =_590_2["Name"]
end
local larry592 =tick()
local larry593 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry594 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry595 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry596 =genv["AutoFuelCampfireRunning"]
local larry597 =genv["AutoFuelCampfireList"]
for larry598, _598_2 in ipairs(_112_vararg1) do
end
local larry599 =larry114["GetChildren"]
local larry600 =larry599(larry114)
for larry601, _601_2 in ipairs(larry600) do
local larry602 =_601_2["Name"]
end
local larry603 =tick()
local larry604 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry605 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry606 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry607 =genv["AutoFuelCampfireRunning"]
local larry608 =genv["AutoFuelCampfireList"]
for larry609, _609_2 in ipairs(_112_vararg1) do
end
local larry610 =larry114["GetChildren"]
local larry611 =larry610(larry114)
for larry612, _612_2 in ipairs(larry611) do
local larry613 =_612_2["Name"]
end
local larry614 =tick()
local larry615 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry616 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry617 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry618 =genv["AutoFuelCampfireRunning"]
local larry619 =genv["AutoFuelCampfireList"]
for larry620, _620_2 in ipairs(_112_vararg1) do
end
local larry621 =larry114["GetChildren"]
local larry622 =larry621(larry114)
for larry623, _623_2 in ipairs(larry622) do
local larry624 =_623_2["Name"]
end
local larry625 =tick()
local larry626 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry627 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry628 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry629 =genv["AutoFuelCampfireRunning"]
local larry630 =genv["AutoFuelCampfireList"]
for larry631, _631_2 in ipairs(_112_vararg1) do
end
local larry632 =larry114["GetChildren"]
local larry633 =larry632(larry114)
for larry634, _634_2 in ipairs(larry633) do
local larry635 =_634_2["Name"]
end
local larry636 =tick()
local larry637 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry638 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry639 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry640 =genv["AutoFuelCampfireRunning"]
local larry641 =genv["AutoFuelCampfireList"]
for larry642, _642_2 in ipairs(_112_vararg1) do
end
local larry643 =larry114["GetChildren"]
local larry644 =larry643(larry114)
for larry645, _645_2 in ipairs(larry644) do
local larry646 =_645_2["Name"]
end
local larry647 =tick()
local larry648 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry649 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry650 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry651 =genv["AutoFuelCampfireRunning"]
local larry652 =genv["AutoFuelCampfireList"]
for larry653, _653_2 in ipairs(_112_vararg1) do
end
local larry654 =larry114["GetChildren"]
local larry655 =larry654(larry114)
for larry656, _656_2 in ipairs(larry655) do
local larry657 =_656_2["Name"]
end
local larry658 =tick()
local larry659 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry660 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry661 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry662 =genv["AutoFuelCampfireRunning"]
local larry663 =genv["AutoFuelCampfireList"]
for larry664, _664_2 in ipairs(_112_vararg1) do
end
local larry665 =larry114["GetChildren"]
local larry666 =larry665(larry114)
for larry667, _667_2 in ipairs(larry666) do
local larry668 =_667_2["Name"]
end
local larry669 =tick()
local larry670 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry671 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry672 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry673 =genv["AutoFuelCampfireRunning"]
local larry674 =genv["AutoFuelCampfireList"]
for larry675, _675_2 in ipairs(_112_vararg1) do
end
local larry676 =larry114["GetChildren"]
local larry677 =larry676(larry114)
for larry678, _678_2 in ipairs(larry677) do
local larry679 =_678_2["Name"]
end
local larry680 =tick()
local larry681 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry682 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry683 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry684 =genv["AutoFuelCampfireRunning"]
local larry685 =genv["AutoFuelCampfireList"]
for larry686, _686_2 in ipairs(_112_vararg1) do
end
local larry687 =larry114["GetChildren"]
local larry688 =larry687(larry114)
for larry689, _689_2 in ipairs(larry688) do
local larry690 =_689_2["Name"]
end
local larry691 =tick()
local larry692 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry693 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry694 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry695 =genv["AutoFuelCampfireRunning"]
local larry696 =genv["AutoFuelCampfireList"]
for larry697, _697_2 in ipairs(_112_vararg1) do
end
local larry698 =larry114["GetChildren"]
local larry699 =larry698(larry114)
for larry700, _700_2 in ipairs(larry699) do
local larry701 =_700_2["Name"]
end
local larry702 =tick()
local larry703 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry704 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry705 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry706 =genv["AutoFuelCampfireRunning"]
local larry707 =genv["AutoFuelCampfireList"]
for larry708, _708_2 in ipairs(_112_vararg1) do
end
local larry709 =larry114["GetChildren"]
local larry710 =larry709(larry114)
for larry711, _711_2 in ipairs(larry710) do
local larry712 =_711_2["Name"]
end
local larry713 =tick()
local larry714 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry715 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry716 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry717 =genv["AutoFuelCampfireRunning"]
local larry718 =genv["AutoFuelCampfireList"]
for larry719, _719_2 in ipairs(_112_vararg1) do
end
local larry720 =larry114["GetChildren"]
local larry721 =larry720(larry114)
for larry722, _722_2 in ipairs(larry721) do
local larry723 =_722_2["Name"]
end
local larry724 =tick()
local larry725 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry726 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry727 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry728 =genv["AutoFuelCampfireRunning"]
local larry729 =genv["AutoFuelCampfireList"]
for larry730, _730_2 in ipairs(_112_vararg1) do
end
local larry731 =larry114["GetChildren"]
local larry732 =larry731(larry114)
for larry733, _733_2 in ipairs(larry732) do
local larry734 =_733_2["Name"]
end
local larry735 =tick()
local larry736 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry737 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry738 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry739 =genv["AutoFuelCampfireRunning"]
local larry740 =genv["AutoFuelCampfireList"]
for larry741, _741_2 in ipairs(_112_vararg1) do
end
local larry742 =larry114["GetChildren"]
local larry743 =larry742(larry114)
for larry744, _744_2 in ipairs(larry743) do
local larry745 =_744_2["Name"]
end
local larry746 =tick()
local larry747 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry748 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry749 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry750 =genv["AutoFuelCampfireRunning"]
local larry751 =genv["AutoFuelCampfireList"]
for larry752, _752_2 in ipairs(_112_vararg1) do
end
local larry753 =larry114["GetChildren"]
local larry754 =larry753(larry114)
for larry755, _755_2 in ipairs(larry754) do
local larry756 =_755_2["Name"]
end
local larry757 =tick()
local larry758 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry759 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry760 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry761 =genv["AutoFuelCampfireRunning"]
local larry762 =genv["AutoFuelCampfireList"]
for larry763, _763_2 in ipairs(_112_vararg1) do
end
local larry764 =larry114["GetChildren"]
local larry765 =larry764(larry114)
for larry766, _766_2 in ipairs(larry765) do
local larry767 =_766_2["Name"]
end
local larry768 =tick()
local larry769 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry770 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry771 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry772 =genv["AutoFuelCampfireRunning"]
local larry773 =genv["AutoFuelCampfireList"]
for larry774, _774_2 in ipairs(_112_vararg1) do
end
local larry775 =larry114["GetChildren"]
local larry776 =larry775(larry114)
for larry777, _777_2 in ipairs(larry776) do
local larry778 =_777_2["Name"]
end
local larry779 =tick()
local larry780 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry781 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry782 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry783 =genv["AutoFuelCampfireRunning"]
local larry784 =genv["AutoFuelCampfireList"]
for larry785, _785_2 in ipairs(_112_vararg1) do
end
local larry786 =larry114["GetChildren"]
local larry787 =larry786(larry114)
for larry788, _788_2 in ipairs(larry787) do
local larry789 =_788_2["Name"]
end
local larry790 =tick()
local larry791 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry792 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry793 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry794 =genv["AutoFuelCampfireRunning"]
local larry795 =genv["AutoFuelCampfireList"]
for larry796, _796_2 in ipairs(_112_vararg1) do
end
local larry797 =larry114["GetChildren"]
local larry798 =larry797(larry114)
for larry799, _799_2 in ipairs(larry798) do
local larry800 =_799_2["Name"]
end
local larry801 =tick()
local larry802 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry803 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry804 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry805 =genv["AutoFuelCampfireRunning"]
local larry806 =genv["AutoFuelCampfireList"]
for larry807, _807_2 in ipairs(_112_vararg1) do
end
local larry808 =larry114["GetChildren"]
local larry809 =larry808(larry114)
for larry810, _810_2 in ipairs(larry809) do
local larry811 =_810_2["Name"]
end
local larry812 =tick()
local larry813 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry814 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry815 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry816 =genv["AutoFuelCampfireRunning"]
local larry817 =genv["AutoFuelCampfireList"]
for larry818, _818_2 in ipairs(_112_vararg1) do
end
local larry819 =larry114["GetChildren"]
local larry820 =larry819(larry114)
for larry821, _821_2 in ipairs(larry820) do
local larry822 =_821_2["Name"]
end
local larry823 =tick()
local larry824 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry825 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry826 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry827 =genv["AutoFuelCampfireRunning"]
local larry828 =genv["AutoFuelCampfireList"]
for larry829, _829_2 in ipairs(_112_vararg1) do
end
local larry830 =larry114["GetChildren"]
local larry831 =larry830(larry114)
for larry832, _832_2 in ipairs(larry831) do
local larry833 =_832_2["Name"]
end
local larry834 =tick()
local larry835 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry836 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry837 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry838 =genv["AutoFuelCampfireRunning"]
local larry839 =genv["AutoFuelCampfireList"]
for larry840, _840_2 in ipairs(_112_vararg1) do
end
local larry841 =larry114["GetChildren"]
local larry842 =larry841(larry114)
for larry843, _843_2 in ipairs(larry842) do
local larry844 =_843_2["Name"]
end
local larry845 =tick()
local larry846 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry847 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry848 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry849 =genv["AutoFuelCampfireRunning"]
local larry850 =genv["AutoFuelCampfireList"]
for larry851, _851_2 in ipairs(_112_vararg1) do
end
local larry852 =larry114["GetChildren"]
local larry853 =larry852(larry114)
for larry854, _854_2 in ipairs(larry853) do
local larry855 =_854_2["Name"]
end
local larry856 =tick()
local larry857 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry858 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry859 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry860 =genv["AutoFuelCampfireRunning"]
local larry861 =genv["AutoFuelCampfireList"]
for larry862, _862_2 in ipairs(_112_vararg1) do
end
local larry863 =larry114["GetChildren"]
local larry864 =larry863(larry114)
for larry865, _865_2 in ipairs(larry864) do
local larry866 =_865_2["Name"]
end
local larry867 =tick()
local larry868 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry869 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry870 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry871 =genv["AutoFuelCampfireRunning"]
local larry872 =genv["AutoFuelCampfireList"]
for larry873, _873_2 in ipairs(_112_vararg1) do
end
local larry874 =larry114["GetChildren"]
local larry875 =larry874(larry114)
for larry876, _876_2 in ipairs(larry875) do
local larry877 =_876_2["Name"]
end
local larry878 =tick()
local larry879 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry880 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry881 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry882 =genv["AutoFuelCampfireRunning"]
local larry883 =genv["AutoFuelCampfireList"]
for larry884, _884_2 in ipairs(_112_vararg1) do
end
local larry885 =larry114["GetChildren"]
local larry886 =larry885(larry114)
for larry887, _887_2 in ipairs(larry886) do
local larry888 =_887_2["Name"]
end
local larry889 =tick()
local larry890 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry891 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry892 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry893 =genv["AutoFuelCampfireRunning"]
local larry894 =genv["AutoFuelCampfireList"]
for larry895, _895_2 in ipairs(_112_vararg1) do
end
local larry896 =larry114["GetChildren"]
local larry897 =larry896(larry114)
for larry898, _898_2 in ipairs(larry897) do
local larry899 =_898_2["Name"]
end
local larry900 =tick()
local larry901 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry902 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry903 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry904 =genv["AutoFuelCampfireRunning"]
local larry905 =genv["AutoFuelCampfireList"]
for larry906, _906_2 in ipairs(_112_vararg1) do
end
local larry907 =larry114["GetChildren"]
local larry908 =larry907(larry114)
for larry909, _909_2 in ipairs(larry908) do
local larry910 =_909_2["Name"]
end
local larry911 =tick()
local larry912 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry913 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry914 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry915 =genv["AutoFuelCampfireRunning"]
local larry916 =genv["AutoFuelCampfireList"]
for larry917, _917_2 in ipairs(_112_vararg1) do
end
local larry918 =larry114["GetChildren"]
local larry919 =larry918(larry114)
for larry920, _920_2 in ipairs(larry919) do
local larry921 =_920_2["Name"]
end
local larry922 =tick()
local larry923 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry924 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry925 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry926 =genv["AutoFuelCampfireRunning"]
local larry927 =genv["AutoFuelCampfireList"]
for larry928, _928_2 in ipairs(_112_vararg1) do
end
local larry929 =larry114["GetChildren"]
local larry930 =larry929(larry114)
for larry931, _931_2 in ipairs(larry930) do
local larry932 =_931_2["Name"]
end
local larry933 =tick()
local larry934 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry935 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry936 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry937 =genv["AutoFuelCampfireRunning"]
local larry938 =genv["AutoFuelCampfireList"]
for larry939, _939_2 in ipairs(_112_vararg1) do
end
local larry940 =larry114["GetChildren"]
local larry941 =larry940(larry114)
for larry942, _942_2 in ipairs(larry941) do
local larry943 =_942_2["Name"]
end
local larry944 =tick()
local larry945 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry946 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry947 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry948 =genv["AutoFuelCampfireRunning"]
local larry949 =genv["AutoFuelCampfireList"]
for larry950, _950_2 in ipairs(_112_vararg1) do
end
local larry951 =larry114["GetChildren"]
local larry952 =larry951(larry114)
for larry953, _953_2 in ipairs(larry952) do
local larry954 =_953_2["Name"]
end
local larry955 =tick()
local larry956 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry957 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry958 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry959 =genv["AutoFuelCampfireRunning"]
local larry960 =genv["AutoFuelCampfireList"]
for larry961, _961_2 in ipairs(_112_vararg1) do
end
local larry962 =larry114["GetChildren"]
local larry963 =larry962(larry114)
for larry964, _964_2 in ipairs(larry963) do
local larry965 =_964_2["Name"]
end
local larry966 =tick()
local larry967 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry968 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry969 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry970 =genv["AutoFuelCampfireRunning"]
local larry971 =genv["AutoFuelCampfireList"]
for larry972, _972_2 in ipairs(_112_vararg1) do
end
local larry973 =larry114["GetChildren"]
local larry974 =larry973(larry114)
for larry975, _975_2 in ipairs(larry974) do
local larry976 =_975_2["Name"]
end
local larry977 =tick()
local larry978 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry979 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry980 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry981 =genv["AutoFuelCampfireRunning"]
local larry982 =genv["AutoFuelCampfireList"]
for larry983, _983_2 in ipairs(_112_vararg1) do
end
local larry984 =larry114["GetChildren"]
local larry985 =larry984(larry114)
for larry986, _986_2 in ipairs(larry985) do
local larry987 =_986_2["Name"]
end
local larry988 =tick()
local larry989 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry990 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry991 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry992 =genv["AutoFuelCampfireRunning"]
local larry993 =genv["AutoFuelCampfireList"]
for larry994, _994_2 in ipairs(_112_vararg1) do
end
local larry995 =larry114["GetChildren"]
local larry996 =larry995(larry114)
for larry997, _997_2 in ipairs(larry996) do
local larry998 =_997_2["Name"]
end
local larry999 =tick()
local larry1000 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1001 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1002 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1003 =genv["AutoFuelCampfireRunning"]
local larry1004 =genv["AutoFuelCampfireList"]
for larry1005, _1005_2 in ipairs(_112_vararg1) do
end
local larry1006 =larry114["GetChildren"]
local larry1007 =larry1006(larry114)
for larry1008, _1008_2 in ipairs(larry1007) do
local larry1009 =_1008_2["Name"]
end
local larry1010 =tick()
local larry1011 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1012 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1013 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1014 =genv["AutoFuelCampfireRunning"]
local larry1015 =genv["AutoFuelCampfireList"]
for larry1016, _1016_2 in ipairs(_112_vararg1) do
end
local larry1017 =larry114["GetChildren"]
local larry1018 =larry1017(larry114)
for larry1019, _1019_2 in ipairs(larry1018) do
local larry1020 =_1019_2["Name"]
end
local larry1021 =tick()
local larry1022 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1023 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1024 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1025 =genv["AutoFuelCampfireRunning"]
local larry1026 =genv["AutoFuelCampfireList"]
for larry1027, _1027_2 in ipairs(_112_vararg1) do
end
local larry1028 =larry114["GetChildren"]
local larry1029 =larry1028(larry114)
for larry1030, _1030_2 in ipairs(larry1029) do
local larry1031 =_1030_2["Name"]
end
local larry1032 =tick()
local larry1033 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1034 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1035 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1036 =genv["AutoFuelCampfireRunning"]
local larry1037 =genv["AutoFuelCampfireList"]
for larry1038, _1038_2 in ipairs(_112_vararg1) do
end
local larry1039 =larry114["GetChildren"]
local larry1040 =larry1039(larry114)
for larry1041, _1041_2 in ipairs(larry1040) do
local larry1042 =_1041_2["Name"]
end
local larry1043 =tick()
local larry1044 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1045 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1046 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1047 =genv["AutoFuelCampfireRunning"]
local larry1048 =genv["AutoFuelCampfireList"]
for larry1049, _1049_2 in ipairs(_112_vararg1) do
end
local larry1050 =larry114["GetChildren"]
local larry1051 =larry1050(larry114)
for larry1052, _1052_2 in ipairs(larry1051) do
local larry1053 =_1052_2["Name"]
end
local larry1054 =tick()
local larry1055 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1056 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1057 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1058 =genv["AutoFuelCampfireRunning"]
local larry1059 =genv["AutoFuelCampfireList"]
for larry1060, _1060_2 in ipairs(_112_vararg1) do
end
local larry1061 =larry114["GetChildren"]
local larry1062 =larry1061(larry114)
for larry1063, _1063_2 in ipairs(larry1062) do
local larry1064 =_1063_2["Name"]
end
local larry1065 =tick()
local larry1066 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1067 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1068 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1069 =genv["AutoFuelCampfireRunning"]
local larry1070 =genv["AutoFuelCampfireList"]
for larry1071, _1071_2 in ipairs(_112_vararg1) do
end
local larry1072 =larry114["GetChildren"]
local larry1073 =larry1072(larry114)
for larry1074, _1074_2 in ipairs(larry1073) do
local larry1075 =_1074_2["Name"]
end
local larry1076 =tick()
local larry1077 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1078 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1079 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1080 =genv["AutoFuelCampfireRunning"]
local larry1081 =genv["AutoFuelCampfireList"]
for larry1082, _1082_2 in ipairs(_112_vararg1) do
end
local larry1083 =larry114["GetChildren"]
local larry1084 =larry1083(larry114)
for larry1085, _1085_2 in ipairs(larry1084) do
local larry1086 =_1085_2["Name"]
end
local larry1087 =tick()
local larry1088 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1089 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1090 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1091 =genv["AutoFuelCampfireRunning"]
local larry1092 =genv["AutoFuelCampfireList"]
for larry1093, _1093_2 in ipairs(_112_vararg1) do
end
local larry1094 =larry114["GetChildren"]
local larry1095 =larry1094(larry114)
for larry1096, _1096_2 in ipairs(larry1095) do
local larry1097 =_1096_2["Name"]
end
local larry1098 =tick()
local larry1099 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1100 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1101 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1102 =genv["AutoFuelCampfireRunning"]
local larry1103 =genv["AutoFuelCampfireList"]
for larry1104, _1104_2 in ipairs(_112_vararg1) do
end
local larry1105 =larry114["GetChildren"]
local larry1106 =larry1105(larry114)
for larry1107, _1107_2 in ipairs(larry1106) do
local larry1108 =_1107_2["Name"]
end
local larry1109 =tick()
local larry1110 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1111 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1112 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1113 =genv["AutoFuelCampfireRunning"]
local larry1114 =genv["AutoFuelCampfireList"]
for larry1115, _1115_2 in ipairs(_112_vararg1) do
end
local larry1116 =larry114["GetChildren"]
local larry1117 =larry1116(larry114)
for larry1118, _1118_2 in ipairs(larry1117) do
local larry1119 =_1118_2["Name"]
end
local larry1120 =tick()
local larry1121 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1122 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1123 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1124 =genv["AutoFuelCampfireRunning"]
local larry1125 =genv["AutoFuelCampfireList"]
for larry1126, _1126_2 in ipairs(_112_vararg1) do
end
local larry1127 =larry114["GetChildren"]
local larry1128 =larry1127(larry114)
for larry1129, _1129_2 in ipairs(larry1128) do
local larry1130 =_1129_2["Name"]
end
local larry1131 =tick()
local larry1132 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1133 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1134 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1135 =genv["AutoFuelCampfireRunning"]
local larry1136 =genv["AutoFuelCampfireList"]
for larry1137, _1137_2 in ipairs(_112_vararg1) do
end
local larry1138 =larry114["GetChildren"]
local larry1139 =larry1138(larry114)
for larry1140, _1140_2 in ipairs(larry1139) do
local larry1141 =_1140_2["Name"]
end
local larry1142 =tick()
local larry1143 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1144 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1145 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1146 =genv["AutoFuelCampfireRunning"]
local larry1147 =genv["AutoFuelCampfireList"]
for larry1148, _1148_2 in ipairs(_112_vararg1) do
end
local larry1149 =larry114["GetChildren"]
local larry1150 =larry1149(larry114)
for larry1151, _1151_2 in ipairs(larry1150) do
local larry1152 =_1151_2["Name"]
end
local larry1153 =tick()
local larry1154 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1155 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1156 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1157 =genv["AutoFuelCampfireRunning"]
local larry1158 =genv["AutoFuelCampfireList"]
for larry1159, _1159_2 in ipairs(_112_vararg1) do
end
local larry1160 =larry114["GetChildren"]
local larry1161 =larry1160(larry114)
for larry1162, _1162_2 in ipairs(larry1161) do
local larry1163 =_1162_2["Name"]
end
local larry1164 =tick()
local larry1165 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1166 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1167 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1168 =genv["AutoFuelCampfireRunning"]
local larry1169 =genv["AutoFuelCampfireList"]
for larry1170, _1170_2 in ipairs(_112_vararg1) do
end
local larry1171 =larry114["GetChildren"]
local larry1172 =larry1171(larry114)
for larry1173, _1173_2 in ipairs(larry1172) do
local larry1174 =_1173_2["Name"]
end
local larry1175 =tick()
local larry1176 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1177 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1178 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1179 =genv["AutoFuelCampfireRunning"]
local larry1180 =genv["AutoFuelCampfireList"]
for larry1181, _1181_2 in ipairs(_112_vararg1) do
end
local larry1182 =larry114["GetChildren"]
local larry1183 =larry1182(larry114)
for larry1184, _1184_2 in ipairs(larry1183) do
local larry1185 =_1184_2["Name"]
end
local larry1186 =tick()
local larry1187 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1188 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1189 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1190 =genv["AutoFuelCampfireRunning"]
local larry1191 =genv["AutoFuelCampfireList"]
for larry1192, _1192_2 in ipairs(_112_vararg1) do
end
local larry1193 =larry114["GetChildren"]
local larry1194 =larry1193(larry114)
for larry1195, _1195_2 in ipairs(larry1194) do
local larry1196 =_1195_2["Name"]
end
local larry1197 =tick()
local larry1198 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1199 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1200 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1201 =genv["AutoFuelCampfireRunning"]
local larry1202 =genv["AutoFuelCampfireList"]
for larry1203, _1203_2 in ipairs(_112_vararg1) do
end
local larry1204 =larry114["GetChildren"]
local larry1205 =larry1204(larry114)
for larry1206, _1206_2 in ipairs(larry1205) do
local larry1207 =_1206_2["Name"]
end
local larry1208 =tick()
local larry1209 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1210 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1211 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1212 =genv["AutoFuelCampfireRunning"]
local larry1213 =genv["AutoFuelCampfireList"]
for larry1214, _1214_2 in ipairs(_112_vararg1) do
end
local larry1215 =larry114["GetChildren"]
local larry1216 =larry1215(larry114)
for larry1217, _1217_2 in ipairs(larry1216) do
local larry1218 =_1217_2["Name"]
end
local larry1219 =tick()
local larry1220 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1221 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1222 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1223 =genv["AutoFuelCampfireRunning"]
local larry1224 =genv["AutoFuelCampfireList"]
for larry1225, _1225_2 in ipairs(_112_vararg1) do
end
local larry1226 =larry114["GetChildren"]
local larry1227 =larry1226(larry114)
for larry1228, _1228_2 in ipairs(larry1227) do
local larry1229 =_1228_2["Name"]
end
local larry1230 =tick()
local larry1231 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1232 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1233 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1234 =genv["AutoFuelCampfireRunning"]
local larry1235 =genv["AutoFuelCampfireList"]
for larry1236, _1236_2 in ipairs(_112_vararg1) do
end
local larry1237 =larry114["GetChildren"]
local larry1238 =larry1237(larry114)
for larry1239, _1239_2 in ipairs(larry1238) do
local larry1240 =_1239_2["Name"]
end
local larry1241 =tick()
local larry1242 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1243 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1244 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1245 =genv["AutoFuelCampfireRunning"]
local larry1246 =genv["AutoFuelCampfireList"]
for larry1247, _1247_2 in ipairs(_112_vararg1) do
end
local larry1248 =larry114["GetChildren"]
local larry1249 =larry1248(larry114)
for larry1250, _1250_2 in ipairs(larry1249) do
local larry1251 =_1250_2["Name"]
end
local larry1252 =tick()
local larry1253 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1254 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1255 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1256 =genv["AutoFuelCampfireRunning"]
local larry1257 =genv["AutoFuelCampfireList"]
for larry1258, _1258_2 in ipairs(_112_vararg1) do
end
local larry1259 =larry114["GetChildren"]
local larry1260 =larry1259(larry114)
for larry1261, _1261_2 in ipairs(larry1260) do
local er =error("Luraph Script:355: Luraph Script:297: Luraph Script:287: internal 542: <larry: infinitelooperror>")
end
end)
local larry130 =larry129(larry109, {
  ["Callback"] = function(...)
local _131_vararg1, _131_vararg2, _131_vararg3, _131_vararg4, _131_vararg5, _131_vararg6, _131_vararg7, _131_vararg8, _131_vararg9, _131_vararg10 = ...
genv["AutoFuelCampfireRunning"]=_131_vararg1
local larry132 =spawn(function(...)
local _133_vararg1, _133_vararg2, _133_vararg3, _133_vararg4, _133_vararg5, _133_vararg6, _133_vararg7, _133_vararg8, _133_vararg9, _133_vararg10 = ...
local larry134 =genv["AutoFuelCampfireRunning"]
local larry135 =genv["AutoFuelCampfireList"]
for larry136, _136_2 in ipairs(_112_vararg1) do
end
local larry137 =larry114["GetChildren"]
local larry138 =larry137(larry114)
for larry139, _139_2 in ipairs(larry138) do
local larry140 =_139_2["Name"]
end
local larry141 =tick()
local larry142 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry143 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry144 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry145 =genv["AutoFuelCampfireRunning"]
local larry146 =genv["AutoFuelCampfireList"]
for larry147, _147_2 in ipairs(_112_vararg1) do
end
local larry148 =larry114["GetChildren"]
local larry149 =larry148(larry114)
for larry150, _150_2 in ipairs(larry149) do
local larry151 =_150_2["Name"]
end
local larry152 =tick()
local larry153 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry154 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry155 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry156 =genv["AutoFuelCampfireRunning"]
local larry157 =genv["AutoFuelCampfireList"]
for larry158, _158_2 in ipairs(_112_vararg1) do
end
local larry159 =larry114["GetChildren"]
local larry160 =larry159(larry114)
for larry161, _161_2 in ipairs(larry160) do
local larry162 =_161_2["Name"]
end
local larry163 =tick()
local larry164 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry165 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry166 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry167 =genv["AutoFuelCampfireRunning"]
local larry168 =genv["AutoFuelCampfireList"]
for larry169, _169_2 in ipairs(_112_vararg1) do
end
local larry170 =larry114["GetChildren"]
local larry171 =larry170(larry114)
for larry172, _172_2 in ipairs(larry171) do
local larry173 =_172_2["Name"]
end
local larry174 =tick()
local larry175 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry176 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry177 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry178 =genv["AutoFuelCampfireRunning"]
local larry179 =genv["AutoFuelCampfireList"]
for larry180, _180_2 in ipairs(_112_vararg1) do
end
local larry181 =larry114["GetChildren"]
local larry182 =larry181(larry114)
for larry183, _183_2 in ipairs(larry182) do
local larry184 =_183_2["Name"]
end
local larry185 =tick()
local larry186 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry187 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry188 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry189 =genv["AutoFuelCampfireRunning"]
local larry190 =genv["AutoFuelCampfireList"]
for larry191, _191_2 in ipairs(_112_vararg1) do
end
local larry192 =larry114["GetChildren"]
local larry193 =larry192(larry114)
for larry194, _194_2 in ipairs(larry193) do
local larry195 =_194_2["Name"]
end
local larry196 =tick()
local larry197 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry198 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry199 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry200 =genv["AutoFuelCampfireRunning"]
local larry201 =genv["AutoFuelCampfireList"]
for larry202, _202_2 in ipairs(_112_vararg1) do
end
local larry203 =larry114["GetChildren"]
local larry204 =larry203(larry114)
for larry205, _205_2 in ipairs(larry204) do
local larry206 =_205_2["Name"]
end
local larry207 =tick()
local larry208 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry209 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry210 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry211 =genv["AutoFuelCampfireRunning"]
local larry212 =genv["AutoFuelCampfireList"]
for larry213, _213_2 in ipairs(_112_vararg1) do
end
local larry214 =larry114["GetChildren"]
local larry215 =larry214(larry114)
for larry216, _216_2 in ipairs(larry215) do
local larry217 =_216_2["Name"]
end
local larry218 =tick()
local larry219 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry220 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry221 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry222 =genv["AutoFuelCampfireRunning"]
local larry223 =genv["AutoFuelCampfireList"]
for larry224, _224_2 in ipairs(_112_vararg1) do
end
local larry225 =larry114["GetChildren"]
local larry226 =larry225(larry114)
for larry227, _227_2 in ipairs(larry226) do
local larry228 =_227_2["Name"]
end
local larry229 =tick()
local larry230 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry231 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry232 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry233 =genv["AutoFuelCampfireRunning"]
local larry234 =genv["AutoFuelCampfireList"]
for larry235, _235_2 in ipairs(_112_vararg1) do
end
local larry236 =larry114["GetChildren"]
local larry237 =larry236(larry114)
for larry238, _238_2 in ipairs(larry237) do
local larry239 =_238_2["Name"]
end
local larry240 =tick()
local larry241 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry242 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry243 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry244 =genv["AutoFuelCampfireRunning"]
local larry245 =genv["AutoFuelCampfireList"]
for larry246, _246_2 in ipairs(_112_vararg1) do
end
local larry247 =larry114["GetChildren"]
local larry248 =larry247(larry114)
for larry249, _249_2 in ipairs(larry248) do
local larry250 =_249_2["Name"]
end
local larry251 =tick()
local larry252 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry253 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry254 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry255 =genv["AutoFuelCampfireRunning"]
local larry256 =genv["AutoFuelCampfireList"]
for larry257, _257_2 in ipairs(_112_vararg1) do
end
local larry258 =larry114["GetChildren"]
local larry259 =larry258(larry114)
for larry260, _260_2 in ipairs(larry259) do
local larry261 =_260_2["Name"]
end
local larry262 =tick()
local larry263 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry264 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry265 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry266 =genv["AutoFuelCampfireRunning"]
local larry267 =genv["AutoFuelCampfireList"]
for larry268, _268_2 in ipairs(_112_vararg1) do
end
local larry269 =larry114["GetChildren"]
local larry270 =larry269(larry114)
for larry271, _271_2 in ipairs(larry270) do
local larry272 =_271_2["Name"]
end
local larry273 =tick()
local larry274 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry275 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry276 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry277 =genv["AutoFuelCampfireRunning"]
local larry278 =genv["AutoFuelCampfireList"]
for larry279, _279_2 in ipairs(_112_vararg1) do
end
local larry280 =larry114["GetChildren"]
local larry281 =larry280(larry114)
for larry282, _282_2 in ipairs(larry281) do
local larry283 =_282_2["Name"]
end
local larry284 =tick()
local larry285 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry286 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry287 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry288 =genv["AutoFuelCampfireRunning"]
local larry289 =genv["AutoFuelCampfireList"]
for larry290, _290_2 in ipairs(_112_vararg1) do
end
local larry291 =larry114["GetChildren"]
local larry292 =larry291(larry114)
for larry293, _293_2 in ipairs(larry292) do
local larry294 =_293_2["Name"]
end
local larry295 =tick()
local larry296 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry297 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry298 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry299 =genv["AutoFuelCampfireRunning"]
local larry300 =genv["AutoFuelCampfireList"]
for larry301, _301_2 in ipairs(_112_vararg1) do
end
local larry302 =larry114["GetChildren"]
local larry303 =larry302(larry114)
for larry304, _304_2 in ipairs(larry303) do
local larry305 =_304_2["Name"]
end
local larry306 =tick()
local larry307 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry308 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry309 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry310 =genv["AutoFuelCampfireRunning"]
local larry311 =genv["AutoFuelCampfireList"]
for larry312, _312_2 in ipairs(_112_vararg1) do
end
local larry313 =larry114["GetChildren"]
local larry314 =larry313(larry114)
for larry315, _315_2 in ipairs(larry314) do
local larry316 =_315_2["Name"]
end
local larry317 =tick()
local larry318 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry319 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry320 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry321 =genv["AutoFuelCampfireRunning"]
local larry322 =genv["AutoFuelCampfireList"]
for larry323, _323_2 in ipairs(_112_vararg1) do
end
local larry324 =larry114["GetChildren"]
local larry325 =larry324(larry114)
for larry326, _326_2 in ipairs(larry325) do
local larry327 =_326_2["Name"]
end
local larry328 =tick()
local larry329 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry330 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry331 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry332 =genv["AutoFuelCampfireRunning"]
local larry333 =genv["AutoFuelCampfireList"]
for larry334, _334_2 in ipairs(_112_vararg1) do
end
local larry335 =larry114["GetChildren"]
local larry336 =larry335(larry114)
for larry337, _337_2 in ipairs(larry336) do
local larry338 =_337_2["Name"]
end
local larry339 =tick()
local larry340 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry341 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry342 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry343 =genv["AutoFuelCampfireRunning"]
local larry344 =genv["AutoFuelCampfireList"]
for larry345, _345_2 in ipairs(_112_vararg1) do
end
local larry346 =larry114["GetChildren"]
local larry347 =larry346(larry114)
for larry348, _348_2 in ipairs(larry347) do
local larry349 =_348_2["Name"]
end
local larry350 =tick()
local larry351 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry352 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry353 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry354 =genv["AutoFuelCampfireRunning"]
local larry355 =genv["AutoFuelCampfireList"]
for larry356, _356_2 in ipairs(_112_vararg1) do
end
local larry357 =larry114["GetChildren"]
local larry358 =larry357(larry114)
for larry359, _359_2 in ipairs(larry358) do
local larry360 =_359_2["Name"]
end
local larry361 =tick()
local larry362 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry363 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry364 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry365 =genv["AutoFuelCampfireRunning"]
local larry366 =genv["AutoFuelCampfireList"]
for larry367, _367_2 in ipairs(_112_vararg1) do
end
local larry368 =larry114["GetChildren"]
local larry369 =larry368(larry114)
for larry370, _370_2 in ipairs(larry369) do
local larry371 =_370_2["Name"]
end
local larry372 =tick()
local larry373 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry374 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry375 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry376 =genv["AutoFuelCampfireRunning"]
local larry377 =genv["AutoFuelCampfireList"]
for larry378, _378_2 in ipairs(_112_vararg1) do
end
local larry379 =larry114["GetChildren"]
local larry380 =larry379(larry114)
for larry381, _381_2 in ipairs(larry380) do
local larry382 =_381_2["Name"]
end
local larry383 =tick()
local larry384 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry385 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry386 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry387 =genv["AutoFuelCampfireRunning"]
local larry388 =genv["AutoFuelCampfireList"]
for larry389, _389_2 in ipairs(_112_vararg1) do
end
local larry390 =larry114["GetChildren"]
local larry391 =larry390(larry114)
for larry392, _392_2 in ipairs(larry391) do
local larry393 =_392_2["Name"]
end
local larry394 =tick()
local larry395 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry396 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry397 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry398 =genv["AutoFuelCampfireRunning"]
local larry399 =genv["AutoFuelCampfireList"]
for larry400, _400_2 in ipairs(_112_vararg1) do
end
local larry401 =larry114["GetChildren"]
local larry402 =larry401(larry114)
for larry403, _403_2 in ipairs(larry402) do
local larry404 =_403_2["Name"]
end
local larry405 =tick()
local larry406 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry407 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry408 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry409 =genv["AutoFuelCampfireRunning"]
local larry410 =genv["AutoFuelCampfireList"]
for larry411, _411_2 in ipairs(_112_vararg1) do
end
local larry412 =larry114["GetChildren"]
local larry413 =larry412(larry114)
for larry414, _414_2 in ipairs(larry413) do
local larry415 =_414_2["Name"]
end
local larry416 =tick()
local larry417 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry418 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry419 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry420 =genv["AutoFuelCampfireRunning"]
local larry421 =genv["AutoFuelCampfireList"]
for larry422, _422_2 in ipairs(_112_vararg1) do
end
local larry423 =larry114["GetChildren"]
local larry424 =larry423(larry114)
for larry425, _425_2 in ipairs(larry424) do
local larry426 =_425_2["Name"]
end
local larry427 =tick()
local larry428 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry429 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry430 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry431 =genv["AutoFuelCampfireRunning"]
local larry432 =genv["AutoFuelCampfireList"]
for larry433, _433_2 in ipairs(_112_vararg1) do
end
local larry434 =larry114["GetChildren"]
local larry435 =larry434(larry114)
for larry436, _436_2 in ipairs(larry435) do
local larry437 =_436_2["Name"]
end
local larry438 =tick()
local larry439 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry440 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry441 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry442 =genv["AutoFuelCampfireRunning"]
local larry443 =genv["AutoFuelCampfireList"]
for larry444, _444_2 in ipairs(_112_vararg1) do
end
local larry445 =larry114["GetChildren"]
local larry446 =larry445(larry114)
for larry447, _447_2 in ipairs(larry446) do
local larry448 =_447_2["Name"]
end
local larry449 =tick()
local larry450 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry451 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry452 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry453 =genv["AutoFuelCampfireRunning"]
local larry454 =genv["AutoFuelCampfireList"]
for larry455, _455_2 in ipairs(_112_vararg1) do
end
local larry456 =larry114["GetChildren"]
local larry457 =larry456(larry114)
for larry458, _458_2 in ipairs(larry457) do
local larry459 =_458_2["Name"]
end
local larry460 =tick()
local larry461 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry462 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry463 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry464 =genv["AutoFuelCampfireRunning"]
local larry465 =genv["AutoFuelCampfireList"]
for larry466, _466_2 in ipairs(_112_vararg1) do
end
local larry467 =larry114["GetChildren"]
local larry468 =larry467(larry114)
for larry469, _469_2 in ipairs(larry468) do
local larry470 =_469_2["Name"]
end
local larry471 =tick()
local larry472 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry473 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry474 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry475 =genv["AutoFuelCampfireRunning"]
local larry476 =genv["AutoFuelCampfireList"]
for larry477, _477_2 in ipairs(_112_vararg1) do
end
local larry478 =larry114["GetChildren"]
local larry479 =larry478(larry114)
for larry480, _480_2 in ipairs(larry479) do
local larry481 =_480_2["Name"]
end
local larry482 =tick()
local larry483 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry484 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry485 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry486 =genv["AutoFuelCampfireRunning"]
local larry487 =genv["AutoFuelCampfireList"]
for larry488, _488_2 in ipairs(_112_vararg1) do
end
local larry489 =larry114["GetChildren"]
local larry490 =larry489(larry114)
for larry491, _491_2 in ipairs(larry490) do
local larry492 =_491_2["Name"]
end
local larry493 =tick()
local larry494 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry495 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry496 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry497 =genv["AutoFuelCampfireRunning"]
local larry498 =genv["AutoFuelCampfireList"]
for larry499, _499_2 in ipairs(_112_vararg1) do
end
local larry500 =larry114["GetChildren"]
local larry501 =larry500(larry114)
for larry502, _502_2 in ipairs(larry501) do
local larry503 =_502_2["Name"]
end
local larry504 =tick()
local larry505 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry506 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry507 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry508 =genv["AutoFuelCampfireRunning"]
local larry509 =genv["AutoFuelCampfireList"]
for larry510, _510_2 in ipairs(_112_vararg1) do
end
local larry511 =larry114["GetChildren"]
local larry512 =larry511(larry114)
for larry513, _513_2 in ipairs(larry512) do
local larry514 =_513_2["Name"]
end
local larry515 =tick()
local larry516 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry517 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry518 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry519 =genv["AutoFuelCampfireRunning"]
local larry520 =genv["AutoFuelCampfireList"]
for larry521, _521_2 in ipairs(_112_vararg1) do
end
local larry522 =larry114["GetChildren"]
local larry523 =larry522(larry114)
for larry524, _524_2 in ipairs(larry523) do
local larry525 =_524_2["Name"]
end
local larry526 =tick()
local larry527 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry528 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry529 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry530 =genv["AutoFuelCampfireRunning"]
local larry531 =genv["AutoFuelCampfireList"]
for larry532, _532_2 in ipairs(_112_vararg1) do
end
local larry533 =larry114["GetChildren"]
local larry534 =larry533(larry114)
for larry535, _535_2 in ipairs(larry534) do
local larry536 =_535_2["Name"]
end
local larry537 =tick()
local larry538 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry539 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry540 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry541 =genv["AutoFuelCampfireRunning"]
local larry542 =genv["AutoFuelCampfireList"]
for larry543, _543_2 in ipairs(_112_vararg1) do
end
local larry544 =larry114["GetChildren"]
local larry545 =larry544(larry114)
for larry546, _546_2 in ipairs(larry545) do
local larry547 =_546_2["Name"]
end
local larry548 =tick()
local larry549 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry550 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry551 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry552 =genv["AutoFuelCampfireRunning"]
local larry553 =genv["AutoFuelCampfireList"]
for larry554, _554_2 in ipairs(_112_vararg1) do
end
local larry555 =larry114["GetChildren"]
local larry556 =larry555(larry114)
for larry557, _557_2 in ipairs(larry556) do
local larry558 =_557_2["Name"]
end
local larry559 =tick()
local larry560 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry561 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry562 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry563 =genv["AutoFuelCampfireRunning"]
local larry564 =genv["AutoFuelCampfireList"]
for larry565, _565_2 in ipairs(_112_vararg1) do
end
local larry566 =larry114["GetChildren"]
local larry567 =larry566(larry114)
for larry568, _568_2 in ipairs(larry567) do
local larry569 =_568_2["Name"]
end
local larry570 =tick()
local larry571 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry572 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry573 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry574 =genv["AutoFuelCampfireRunning"]
local larry575 =genv["AutoFuelCampfireList"]
for larry576, _576_2 in ipairs(_112_vararg1) do
end
local larry577 =larry114["GetChildren"]
local larry578 =larry577(larry114)
for larry579, _579_2 in ipairs(larry578) do
local larry580 =_579_2["Name"]
end
local larry581 =tick()
local larry582 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry583 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry584 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry585 =genv["AutoFuelCampfireRunning"]
local larry586 =genv["AutoFuelCampfireList"]
for larry587, _587_2 in ipairs(_112_vararg1) do
end
local larry588 =larry114["GetChildren"]
local larry589 =larry588(larry114)
for larry590, _590_2 in ipairs(larry589) do
local larry591 =_590_2["Name"]
end
local larry592 =tick()
local larry593 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry594 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry595 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry596 =genv["AutoFuelCampfireRunning"]
local larry597 =genv["AutoFuelCampfireList"]
for larry598, _598_2 in ipairs(_112_vararg1) do
end
local larry599 =larry114["GetChildren"]
local larry600 =larry599(larry114)
for larry601, _601_2 in ipairs(larry600) do
local larry602 =_601_2["Name"]
end
local larry603 =tick()
local larry604 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry605 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry606 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry607 =genv["AutoFuelCampfireRunning"]
local larry608 =genv["AutoFuelCampfireList"]
for larry609, _609_2 in ipairs(_112_vararg1) do
end
local larry610 =larry114["GetChildren"]
local larry611 =larry610(larry114)
for larry612, _612_2 in ipairs(larry611) do
local larry613 =_612_2["Name"]
end
local larry614 =tick()
local larry615 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry616 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry617 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry618 =genv["AutoFuelCampfireRunning"]
local larry619 =genv["AutoFuelCampfireList"]
for larry620, _620_2 in ipairs(_112_vararg1) do
end
local larry621 =larry114["GetChildren"]
local larry622 =larry621(larry114)
for larry623, _623_2 in ipairs(larry622) do
local larry624 =_623_2["Name"]
end
local larry625 =tick()
local larry626 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry627 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry628 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry629 =genv["AutoFuelCampfireRunning"]
local larry630 =genv["AutoFuelCampfireList"]
for larry631, _631_2 in ipairs(_112_vararg1) do
end
local larry632 =larry114["GetChildren"]
local larry633 =larry632(larry114)
for larry634, _634_2 in ipairs(larry633) do
local larry635 =_634_2["Name"]
end
local larry636 =tick()
local larry637 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry638 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry639 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry640 =genv["AutoFuelCampfireRunning"]
local larry641 =genv["AutoFuelCampfireList"]
for larry642, _642_2 in ipairs(_112_vararg1) do
end
local larry643 =larry114["GetChildren"]
local larry644 =larry643(larry114)
for larry645, _645_2 in ipairs(larry644) do
local larry646 =_645_2["Name"]
end
local larry647 =tick()
local larry648 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry649 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry650 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry651 =genv["AutoFuelCampfireRunning"]
local larry652 =genv["AutoFuelCampfireList"]
for larry653, _653_2 in ipairs(_112_vararg1) do
end
local larry654 =larry114["GetChildren"]
local larry655 =larry654(larry114)
for larry656, _656_2 in ipairs(larry655) do
local larry657 =_656_2["Name"]
end
local larry658 =tick()
local larry659 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry660 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry661 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry662 =genv["AutoFuelCampfireRunning"]
local larry663 =genv["AutoFuelCampfireList"]
for larry664, _664_2 in ipairs(_112_vararg1) do
end
local larry665 =larry114["GetChildren"]
local larry666 =larry665(larry114)
for larry667, _667_2 in ipairs(larry666) do
local larry668 =_667_2["Name"]
end
local larry669 =tick()
local larry670 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry671 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry672 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry673 =genv["AutoFuelCampfireRunning"]
local larry674 =genv["AutoFuelCampfireList"]
for larry675, _675_2 in ipairs(_112_vararg1) do
end
local larry676 =larry114["GetChildren"]
local larry677 =larry676(larry114)
for larry678, _678_2 in ipairs(larry677) do
local larry679 =_678_2["Name"]
end
local larry680 =tick()
local larry681 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry682 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry683 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry684 =genv["AutoFuelCampfireRunning"]
local larry685 =genv["AutoFuelCampfireList"]
for larry686, _686_2 in ipairs(_112_vararg1) do
end
local larry687 =larry114["GetChildren"]
local larry688 =larry687(larry114)
for larry689, _689_2 in ipairs(larry688) do
local larry690 =_689_2["Name"]
end
local larry691 =tick()
local larry692 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry693 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry694 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry695 =genv["AutoFuelCampfireRunning"]
local larry696 =genv["AutoFuelCampfireList"]
for larry697, _697_2 in ipairs(_112_vararg1) do
end
local larry698 =larry114["GetChildren"]
local larry699 =larry698(larry114)
for larry700, _700_2 in ipairs(larry699) do
local larry701 =_700_2["Name"]
end
local larry702 =tick()
local larry703 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry704 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry705 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry706 =genv["AutoFuelCampfireRunning"]
local larry707 =genv["AutoFuelCampfireList"]
for larry708, _708_2 in ipairs(_112_vararg1) do
end
local larry709 =larry114["GetChildren"]
local larry710 =larry709(larry114)
for larry711, _711_2 in ipairs(larry710) do
local larry712 =_711_2["Name"]
end
local larry713 =tick()
local larry714 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry715 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry716 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry717 =genv["AutoFuelCampfireRunning"]
local larry718 =genv["AutoFuelCampfireList"]
for larry719, _719_2 in ipairs(_112_vararg1) do
end
local larry720 =larry114["GetChildren"]
local larry721 =larry720(larry114)
for larry722, _722_2 in ipairs(larry721) do
local larry723 =_722_2["Name"]
end
local larry724 =tick()
local larry725 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry726 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry727 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry728 =genv["AutoFuelCampfireRunning"]
local larry729 =genv["AutoFuelCampfireList"]
for larry730, _730_2 in ipairs(_112_vararg1) do
end
local larry731 =larry114["GetChildren"]
local larry732 =larry731(larry114)
for larry733, _733_2 in ipairs(larry732) do
local larry734 =_733_2["Name"]
end
local larry735 =tick()
local larry736 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry737 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry738 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry739 =genv["AutoFuelCampfireRunning"]
local larry740 =genv["AutoFuelCampfireList"]
for larry741, _741_2 in ipairs(_112_vararg1) do
end
local larry742 =larry114["GetChildren"]
local larry743 =larry742(larry114)
for larry744, _744_2 in ipairs(larry743) do
local larry745 =_744_2["Name"]
end
local larry746 =tick()
local larry747 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry748 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry749 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry750 =genv["AutoFuelCampfireRunning"]
local larry751 =genv["AutoFuelCampfireList"]
for larry752, _752_2 in ipairs(_112_vararg1) do
end
local larry753 =larry114["GetChildren"]
local larry754 =larry753(larry114)
for larry755, _755_2 in ipairs(larry754) do
local larry756 =_755_2["Name"]
end
local larry757 =tick()
local larry758 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry759 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry760 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry761 =genv["AutoFuelCampfireRunning"]
local larry762 =genv["AutoFuelCampfireList"]
for larry763, _763_2 in ipairs(_112_vararg1) do
end
local larry764 =larry114["GetChildren"]
local larry765 =larry764(larry114)
for larry766, _766_2 in ipairs(larry765) do
local larry767 =_766_2["Name"]
end
local larry768 =tick()
local larry769 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry770 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry771 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry772 =genv["AutoFuelCampfireRunning"]
local larry773 =genv["AutoFuelCampfireList"]
for larry774, _774_2 in ipairs(_112_vararg1) do
end
local larry775 =larry114["GetChildren"]
local larry776 =larry775(larry114)
for larry777, _777_2 in ipairs(larry776) do
local larry778 =_777_2["Name"]
end
local larry779 =tick()
local larry780 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry781 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry782 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry783 =genv["AutoFuelCampfireRunning"]
local larry784 =genv["AutoFuelCampfireList"]
for larry785, _785_2 in ipairs(_112_vararg1) do
end
local larry786 =larry114["GetChildren"]
local larry787 =larry786(larry114)
for larry788, _788_2 in ipairs(larry787) do
local larry789 =_788_2["Name"]
end
local larry790 =tick()
local larry791 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry792 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry793 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry794 =genv["AutoFuelCampfireRunning"]
local larry795 =genv["AutoFuelCampfireList"]
for larry796, _796_2 in ipairs(_112_vararg1) do
end
local larry797 =larry114["GetChildren"]
local larry798 =larry797(larry114)
for larry799, _799_2 in ipairs(larry798) do
local larry800 =_799_2["Name"]
end
local larry801 =tick()
local larry802 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry803 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry804 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry805 =genv["AutoFuelCampfireRunning"]
local larry806 =genv["AutoFuelCampfireList"]
for larry807, _807_2 in ipairs(_112_vararg1) do
end
local larry808 =larry114["GetChildren"]
local larry809 =larry808(larry114)
for larry810, _810_2 in ipairs(larry809) do
local larry811 =_810_2["Name"]
end
local larry812 =tick()
local larry813 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry814 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry815 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry816 =genv["AutoFuelCampfireRunning"]
local larry817 =genv["AutoFuelCampfireList"]
for larry818, _818_2 in ipairs(_112_vararg1) do
end
local larry819 =larry114["GetChildren"]
local larry820 =larry819(larry114)
for larry821, _821_2 in ipairs(larry820) do
local larry822 =_821_2["Name"]
end
local larry823 =tick()
local larry824 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry825 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry826 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry827 =genv["AutoFuelCampfireRunning"]
local larry828 =genv["AutoFuelCampfireList"]
for larry829, _829_2 in ipairs(_112_vararg1) do
end
local larry830 =larry114["GetChildren"]
local larry831 =larry830(larry114)
for larry832, _832_2 in ipairs(larry831) do
local larry833 =_832_2["Name"]
end
local larry834 =tick()
local larry835 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry836 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry837 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry838 =genv["AutoFuelCampfireRunning"]
local larry839 =genv["AutoFuelCampfireList"]
for larry840, _840_2 in ipairs(_112_vararg1) do
end
local larry841 =larry114["GetChildren"]
local larry842 =larry841(larry114)
for larry843, _843_2 in ipairs(larry842) do
local larry844 =_843_2["Name"]
end
local larry845 =tick()
local larry846 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry847 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry848 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry849 =genv["AutoFuelCampfireRunning"]
local larry850 =genv["AutoFuelCampfireList"]
for larry851, _851_2 in ipairs(_112_vararg1) do
end
local larry852 =larry114["GetChildren"]
local larry853 =larry852(larry114)
for larry854, _854_2 in ipairs(larry853) do
local larry855 =_854_2["Name"]
end
local larry856 =tick()
local larry857 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry858 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry859 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry860 =genv["AutoFuelCampfireRunning"]
local larry861 =genv["AutoFuelCampfireList"]
for larry862, _862_2 in ipairs(_112_vararg1) do
end
local larry863 =larry114["GetChildren"]
local larry864 =larry863(larry114)
for larry865, _865_2 in ipairs(larry864) do
local larry866 =_865_2["Name"]
end
local larry867 =tick()
local larry868 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry869 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry870 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry871 =genv["AutoFuelCampfireRunning"]
local larry872 =genv["AutoFuelCampfireList"]
for larry873, _873_2 in ipairs(_112_vararg1) do
end
local larry874 =larry114["GetChildren"]
local larry875 =larry874(larry114)
for larry876, _876_2 in ipairs(larry875) do
local larry877 =_876_2["Name"]
end
local larry878 =tick()
local larry879 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry880 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry881 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry882 =genv["AutoFuelCampfireRunning"]
local larry883 =genv["AutoFuelCampfireList"]
for larry884, _884_2 in ipairs(_112_vararg1) do
end
local larry885 =larry114["GetChildren"]
local larry886 =larry885(larry114)
for larry887, _887_2 in ipairs(larry886) do
local larry888 =_887_2["Name"]
end
local larry889 =tick()
local larry890 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry891 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry892 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry893 =genv["AutoFuelCampfireRunning"]
local larry894 =genv["AutoFuelCampfireList"]
for larry895, _895_2 in ipairs(_112_vararg1) do
end
local larry896 =larry114["GetChildren"]
local larry897 =larry896(larry114)
for larry898, _898_2 in ipairs(larry897) do
local larry899 =_898_2["Name"]
end
local larry900 =tick()
local larry901 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry902 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry903 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry904 =genv["AutoFuelCampfireRunning"]
local larry905 =genv["AutoFuelCampfireList"]
for larry906, _906_2 in ipairs(_112_vararg1) do
end
local larry907 =larry114["GetChildren"]
local larry908 =larry907(larry114)
for larry909, _909_2 in ipairs(larry908) do
local larry910 =_909_2["Name"]
end
local larry911 =tick()
local larry912 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry913 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry914 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry915 =genv["AutoFuelCampfireRunning"]
local larry916 =genv["AutoFuelCampfireList"]
for larry917, _917_2 in ipairs(_112_vararg1) do
end
local larry918 =larry114["GetChildren"]
local larry919 =larry918(larry114)
for larry920, _920_2 in ipairs(larry919) do
local larry921 =_920_2["Name"]
end
local larry922 =tick()
local larry923 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry924 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry925 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry926 =genv["AutoFuelCampfireRunning"]
local larry927 =genv["AutoFuelCampfireList"]
for larry928, _928_2 in ipairs(_112_vararg1) do
end
local larry929 =larry114["GetChildren"]
local larry930 =larry929(larry114)
for larry931, _931_2 in ipairs(larry930) do
local larry932 =_931_2["Name"]
end
local larry933 =tick()
local larry934 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry935 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry936 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry937 =genv["AutoFuelCampfireRunning"]
local larry938 =genv["AutoFuelCampfireList"]
for larry939, _939_2 in ipairs(_112_vararg1) do
end
local larry940 =larry114["GetChildren"]
local larry941 =larry940(larry114)
for larry942, _942_2 in ipairs(larry941) do
local larry943 =_942_2["Name"]
end
local larry944 =tick()
local larry945 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry946 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry947 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry948 =genv["AutoFuelCampfireRunning"]
local larry949 =genv["AutoFuelCampfireList"]
for larry950, _950_2 in ipairs(_112_vararg1) do
end
local larry951 =larry114["GetChildren"]
local larry952 =larry951(larry114)
for larry953, _953_2 in ipairs(larry952) do
local larry954 =_953_2["Name"]
end
local larry955 =tick()
local larry956 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry957 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry958 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry959 =genv["AutoFuelCampfireRunning"]
local larry960 =genv["AutoFuelCampfireList"]
for larry961, _961_2 in ipairs(_112_vararg1) do
end
local larry962 =larry114["GetChildren"]
local larry963 =larry962(larry114)
for larry964, _964_2 in ipairs(larry963) do
local larry965 =_964_2["Name"]
end
local larry966 =tick()
local larry967 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry968 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry969 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry970 =genv["AutoFuelCampfireRunning"]
local larry971 =genv["AutoFuelCampfireList"]
for larry972, _972_2 in ipairs(_112_vararg1) do
end
local larry973 =larry114["GetChildren"]
local larry974 =larry973(larry114)
for larry975, _975_2 in ipairs(larry974) do
local larry976 =_975_2["Name"]
end
local larry977 =tick()
local larry978 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry979 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry980 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry981 =genv["AutoFuelCampfireRunning"]
local larry982 =genv["AutoFuelCampfireList"]
for larry983, _983_2 in ipairs(_112_vararg1) do
end
local larry984 =larry114["GetChildren"]
local larry985 =larry984(larry114)
for larry986, _986_2 in ipairs(larry985) do
local larry987 =_986_2["Name"]
end
local larry988 =tick()
local larry989 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry990 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry991 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry992 =genv["AutoFuelCampfireRunning"]
local larry993 =genv["AutoFuelCampfireList"]
for larry994, _994_2 in ipairs(_112_vararg1) do
end
local larry995 =larry114["GetChildren"]
local larry996 =larry995(larry114)
for larry997, _997_2 in ipairs(larry996) do
local larry998 =_997_2["Name"]
end
local larry999 =tick()
local larry1000 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1001 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1002 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1003 =genv["AutoFuelCampfireRunning"]
local larry1004 =genv["AutoFuelCampfireList"]
for larry1005, _1005_2 in ipairs(_112_vararg1) do
end
local larry1006 =larry114["GetChildren"]
local larry1007 =larry1006(larry114)
for larry1008, _1008_2 in ipairs(larry1007) do
local larry1009 =_1008_2["Name"]
end
local larry1010 =tick()
local larry1011 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1012 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1013 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1014 =genv["AutoFuelCampfireRunning"]
local larry1015 =genv["AutoFuelCampfireList"]
for larry1016, _1016_2 in ipairs(_112_vararg1) do
end
local larry1017 =larry114["GetChildren"]
local larry1018 =larry1017(larry114)
for larry1019, _1019_2 in ipairs(larry1018) do
local larry1020 =_1019_2["Name"]
end
local larry1021 =tick()
local larry1022 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1023 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1024 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1025 =genv["AutoFuelCampfireRunning"]
local larry1026 =genv["AutoFuelCampfireList"]
for larry1027, _1027_2 in ipairs(_112_vararg1) do
end
local larry1028 =larry114["GetChildren"]
local larry1029 =larry1028(larry114)
for larry1030, _1030_2 in ipairs(larry1029) do
local larry1031 =_1030_2["Name"]
end
local larry1032 =tick()
local larry1033 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1034 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1035 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1036 =genv["AutoFuelCampfireRunning"]
local larry1037 =genv["AutoFuelCampfireList"]
for larry1038, _1038_2 in ipairs(_112_vararg1) do
end
local larry1039 =larry114["GetChildren"]
local larry1040 =larry1039(larry114)
for larry1041, _1041_2 in ipairs(larry1040) do
local larry1042 =_1041_2["Name"]
end
local larry1043 =tick()
local larry1044 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1045 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1046 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1047 =genv["AutoFuelCampfireRunning"]
local larry1048 =genv["AutoFuelCampfireList"]
for larry1049, _1049_2 in ipairs(_112_vararg1) do
end
local larry1050 =larry114["GetChildren"]
local larry1051 =larry1050(larry114)
for larry1052, _1052_2 in ipairs(larry1051) do
local larry1053 =_1052_2["Name"]
end
local larry1054 =tick()
local larry1055 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1056 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1057 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1058 =genv["AutoFuelCampfireRunning"]
local larry1059 =genv["AutoFuelCampfireList"]
for larry1060, _1060_2 in ipairs(_112_vararg1) do
end
local larry1061 =larry114["GetChildren"]
local larry1062 =larry1061(larry114)
for larry1063, _1063_2 in ipairs(larry1062) do
local larry1064 =_1063_2["Name"]
end
local larry1065 =tick()
local larry1066 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1067 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1068 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1069 =genv["AutoFuelCampfireRunning"]
local larry1070 =genv["AutoFuelCampfireList"]
for larry1071, _1071_2 in ipairs(_112_vararg1) do
end
local larry1072 =larry114["GetChildren"]
local larry1073 =larry1072(larry114)
for larry1074, _1074_2 in ipairs(larry1073) do
local larry1075 =_1074_2["Name"]
end
local larry1076 =tick()
local larry1077 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1078 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1079 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1080 =genv["AutoFuelCampfireRunning"]
local larry1081 =genv["AutoFuelCampfireList"]
for larry1082, _1082_2 in ipairs(_112_vararg1) do
end
local larry1083 =larry114["GetChildren"]
local larry1084 =larry1083(larry114)
for larry1085, _1085_2 in ipairs(larry1084) do
local larry1086 =_1085_2["Name"]
end
local larry1087 =tick()
local larry1088 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1089 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1090 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1091 =genv["AutoFuelCampfireRunning"]
local larry1092 =genv["AutoFuelCampfireList"]
for larry1093, _1093_2 in ipairs(_112_vararg1) do
end
local larry1094 =larry114["GetChildren"]
local larry1095 =larry1094(larry114)
for larry1096, _1096_2 in ipairs(larry1095) do
local larry1097 =_1096_2["Name"]
end
local larry1098 =tick()
local larry1099 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1100 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1101 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1102 =genv["AutoFuelCampfireRunning"]
local larry1103 =genv["AutoFuelCampfireList"]
for larry1104, _1104_2 in ipairs(_112_vararg1) do
end
local larry1105 =larry114["GetChildren"]
local larry1106 =larry1105(larry114)
for larry1107, _1107_2 in ipairs(larry1106) do
local larry1108 =_1107_2["Name"]
end
local larry1109 =tick()
local larry1110 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1111 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1112 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1113 =genv["AutoFuelCampfireRunning"]
local larry1114 =genv["AutoFuelCampfireList"]
for larry1115, _1115_2 in ipairs(_112_vararg1) do
end
local larry1116 =larry114["GetChildren"]
local larry1117 =larry1116(larry114)
for larry1118, _1118_2 in ipairs(larry1117) do
local larry1119 =_1118_2["Name"]
end
local larry1120 =tick()
local larry1121 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1122 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1123 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1124 =genv["AutoFuelCampfireRunning"]
local larry1125 =genv["AutoFuelCampfireList"]
for larry1126, _1126_2 in ipairs(_112_vararg1) do
end
local larry1127 =larry114["GetChildren"]
local larry1128 =larry1127(larry114)
for larry1129, _1129_2 in ipairs(larry1128) do
local larry1130 =_1129_2["Name"]
end
local larry1131 =tick()
local larry1132 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1133 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1134 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1135 =genv["AutoFuelCampfireRunning"]
local larry1136 =genv["AutoFuelCampfireList"]
for larry1137, _1137_2 in ipairs(_112_vararg1) do
end
local larry1138 =larry114["GetChildren"]
local larry1139 =larry1138(larry114)
for larry1140, _1140_2 in ipairs(larry1139) do
local larry1141 =_1140_2["Name"]
end
local larry1142 =tick()
local larry1143 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1144 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1145 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1146 =genv["AutoFuelCampfireRunning"]
local larry1147 =genv["AutoFuelCampfireList"]
for larry1148, _1148_2 in ipairs(_112_vararg1) do
end
local larry1149 =larry114["GetChildren"]
local larry1150 =larry1149(larry114)
for larry1151, _1151_2 in ipairs(larry1150) do
local larry1152 =_1151_2["Name"]
end
local larry1153 =tick()
local larry1154 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1155 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1156 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1157 =genv["AutoFuelCampfireRunning"]
local larry1158 =genv["AutoFuelCampfireList"]
for larry1159, _1159_2 in ipairs(_112_vararg1) do
end
local larry1160 =larry114["GetChildren"]
local larry1161 =larry1160(larry114)
for larry1162, _1162_2 in ipairs(larry1161) do
local larry1163 =_1162_2["Name"]
end
local larry1164 =tick()
local larry1165 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1166 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1167 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1168 =genv["AutoFuelCampfireRunning"]
local larry1169 =genv["AutoFuelCampfireList"]
for larry1170, _1170_2 in ipairs(_112_vararg1) do
end
local larry1171 =larry114["GetChildren"]
local larry1172 =larry1171(larry114)
for larry1173, _1173_2 in ipairs(larry1172) do
local larry1174 =_1173_2["Name"]
end
local larry1175 =tick()
local larry1176 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1177 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1178 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1179 =genv["AutoFuelCampfireRunning"]
local larry1180 =genv["AutoFuelCampfireList"]
for larry1181, _1181_2 in ipairs(_112_vararg1) do
end
local larry1182 =larry114["GetChildren"]
local larry1183 =larry1182(larry114)
for larry1184, _1184_2 in ipairs(larry1183) do
local larry1185 =_1184_2["Name"]
end
local larry1186 =tick()
local larry1187 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1188 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1189 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1190 =genv["AutoFuelCampfireRunning"]
local larry1191 =genv["AutoFuelCampfireList"]
for larry1192, _1192_2 in ipairs(_112_vararg1) do
end
local larry1193 =larry114["GetChildren"]
local larry1194 =larry1193(larry114)
for larry1195, _1195_2 in ipairs(larry1194) do
local larry1196 =_1195_2["Name"]
end
local larry1197 =tick()
local larry1198 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1199 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1200 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1201 =genv["AutoFuelCampfireRunning"]
local larry1202 =genv["AutoFuelCampfireList"]
for larry1203, _1203_2 in ipairs(_112_vararg1) do
end
local larry1204 =larry114["GetChildren"]
local larry1205 =larry1204(larry114)
for larry1206, _1206_2 in ipairs(larry1205) do
local larry1207 =_1206_2["Name"]
end
local larry1208 =tick()
local larry1209 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1210 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1211 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1212 =genv["AutoFuelCampfireRunning"]
local larry1213 =genv["AutoFuelCampfireList"]
for larry1214, _1214_2 in ipairs(_112_vararg1) do
end
local larry1215 =larry114["GetChildren"]
local larry1216 =larry1215(larry114)
for larry1217, _1217_2 in ipairs(larry1216) do
local larry1218 =_1217_2["Name"]
end
local larry1219 =tick()
local larry1220 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1221 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1222 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1223 =genv["AutoFuelCampfireRunning"]
local larry1224 =genv["AutoFuelCampfireList"]
for larry1225, _1225_2 in ipairs(_112_vararg1) do
end
local larry1226 =larry114["GetChildren"]
local larry1227 =larry1226(larry114)
for larry1228, _1228_2 in ipairs(larry1227) do
local larry1229 =_1228_2["Name"]
end
local larry1230 =tick()
local larry1231 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1232 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1233 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1234 =genv["AutoFuelCampfireRunning"]
local larry1235 =genv["AutoFuelCampfireList"]
for larry1236, _1236_2 in ipairs(_112_vararg1) do
end
local larry1237 =larry114["GetChildren"]
local larry1238 =larry1237(larry114)
for larry1239, _1239_2 in ipairs(larry1238) do
local larry1240 =_1239_2["Name"]
end
local larry1241 =tick()
local larry1242 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1243 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1244 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1245 =genv["AutoFuelCampfireRunning"]
local larry1246 =genv["AutoFuelCampfireList"]
for larry1247, _1247_2 in ipairs(_112_vararg1) do
end
local larry1248 =larry114["GetChildren"]
local larry1249 =larry1248(larry114)
for larry1250, _1250_2 in ipairs(larry1249) do
local larry1251 =_1250_2["Name"]
end
local larry1252 =tick()
local larry1253 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1254 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1255 =genv["AutoFuelCampfireRunning"]
local _ =task.wait(1)
local larry1256 =genv["AutoFuelCampfireRunning"]
local larry1257 =genv["AutoFuelCampfireList"]
for larry1258, _1258_2 in ipairs(_112_vararg1) do
end
local larry1259 =larry114["GetChildren"]
local larry1260 =larry1259(larry114)
for larry1261, _1261_2 in ipairs(larry1260) do
local er =error("Luraph Script:355: Luraph Script:297: Luraph Script:287: internal 542: <larry: infinitelooperror>")
end
end)
end,
  ["Default"] = false,
  ["Icon"] = "repeat",
  ["Title"] = "Auto Fuel Toggle",
})
local larry1263 =Vector3["new"]
local larry1264 =larry1263(21.15, 19, -6.12)
local larry1265 =larry43["Section"]
local larry1266 =larry1265(larry43, {
  ["Opened"] = false,
  ["Title"] = "Auto Compress Machine",
  ["Icon"] = "database-backup",
  ["Desc"] = "Auto Level Compress",
})
local larry1267 =larry1266["Dropdown"]
local larry1268 =larry1267(larry1266, {
  ["Title"] = "Choose Items To Compress",
  ["AllowNone"] = true,
  ["Value"] = {
  [1] = "Bolt",
  [2] = "Sheet Metal",
  [3] = "Log",
},
  ["Multi"] = true,
  ["Callback"] = function(...)
local _1269_vararg1, _1269_vararg2, _1269_vararg3, _1269_vararg4, _1269_vararg5, _1269_vararg6, _1269_vararg7, _1269_vararg8, _1269_vararg9, _1269_vararg10 = ...
genv["AutoCompressList"]=_1269_vararg1
end,
  ["Values"] = {
  [1] = "Bolt",
  [2] = "Sheet Metal",
  [3] = "UFO Junk",
  [4] = "UFO Component",
  [5] = "Broken Fan",
  [6] = "Log",
  [7] = "Broken Radio",
  [8] = "Broken Microwave",
  [9] = "Tyre",
  [10] = "Metal Chair",
  [11] = "Old Car Engine",
  [12] = "Washing Machine",
  [13] = "Cultist Experiment",
  [14] = "Cultist Prototype",
  [15] = "UFO Scrap",
  [16] = "Cultist Gem",
  [17] = "Gem of the Forest",
},
})
local larry1270 =larry15["WaitForChild"]
local larry1271 =larry1270(larry15, "Items")
local larry1272 =larry1266["Button"]
local larry1277 =larry1271["GetChildren"]
local larry1278 =larry1277(larry1271)
local larry1280 =_1279_2["Name"]
local larry1281 =tick()
local larry1282 =larry7["Notify"]
local larry1283 =larry1282(larry7, {
  ["Icon"] = "x",
  ["Duration"] = 2,
  ["Content"] = "No eligible items found for compressing!",
  ["Title"] = "Auto Compress",
})
local larry1273 =larry1272(larry1266, {
  ["Callback"] = function(...)
local _1274_vararg1, _1274_vararg2, _1274_vararg3, _1274_vararg4, _1274_vararg5, _1274_vararg6, _1274_vararg7, _1274_vararg8, _1274_vararg9, _1274_vararg10 = ...
local larry1275 =genv["AutoCompressList"]
for larry1276, _1276_2 in ipairs(_1269_vararg1) do
end
local larry1277 =larry1271["GetChildren"]
local larry1278 =larry1277(larry1271)
for larry1279, _1279_2 in ipairs(larry1278) do
local larry1280 =_1279_2["Name"]
end
local larry1281 =tick()
local larry1282 =larry7["Notify"]
local larry1283 =larry1282(larry7, {
  ["Icon"] = "x",
  ["Duration"] = 2,
  ["Content"] = "No eligible items found for compressing!",
  ["Title"] = "Auto Compress",
})
end,
  ["Icon"] = "database-backup",
  ["Title"] = "Compress Items",
})
local larry1284 =larry1266["Toggle"]
local larry1292 =larry1271["GetChildren"]
local larry1293 =larry1292(larry1271)
local larry1295 =_1294_2["Name"]
local larry1296 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1303 =larry1271["GetChildren"]
local larry1304 =larry1303(larry1271)
local larry1306 =_1305_2["Name"]
local larry1307 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1314 =larry1271["GetChildren"]
local larry1315 =larry1314(larry1271)
local larry1317 =_1316_2["Name"]
local larry1318 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local _ =task.wait(1)
local larry1325 =larry1271["GetChildren"]
local larry1326 =larry1325(larry1271)
local larry1328 =_1327_2["Name"]
local larry1329 =tick()
local _ =task.wait(1)
local _ =task.wait(1)
local er =error("Luraph Script:494: internal 542: <larry: infinitelooperror>")
local larry1287 =spawn(function(...)
local _1288_vararg1, _1288_vararg2, _1288_vararg3, _1288_vararg4, _1288_vararg5, _1288_vararg6, _1288_vararg7, _1288_vararg8, _1288_vararg9, _1288_vararg10 = ...
local larry1289 =genv["AutoCompressIsRunning"]
local larry1290 =genv["AutoCompressList"]
for larry1291, _1291_2 in ipairs(_1269_vararg1) do
end
local larry1292 =larry1271["GetChildren"]
local larry1293 =larry1292(larry1271)
for larry1294, _1294_2 in ipairs(larry1293) do
local larry1295 =_1294_2["Name"]
end
local larry1296 =tick()
local larry1297 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1298 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1299 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1300 =genv["AutoCompressIsRunning"]
local larry1301 =genv["AutoCompressList"]
for larry1302, _1302_2 in ipairs(_1269_vararg1) do
end
local larry1303 =larry1271["GetChildren"]
local larry1304 =larry1303(larry1271)
for larry1305, _1305_2 in ipairs(larry1304) do
local larry1306 =_1305_2["Name"]
end
local larry1307 =tick()
local larry1308 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1309 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1310 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1311 =genv["AutoCompressIsRunning"]
local larry1312 =genv["AutoCompressList"]
for larry1313, _1313_2 in ipairs(_1269_vararg1) do
end
local larry1314 =larry1271["GetChildren"]
local larry1315 =larry1314(larry1271)
for larry1316, _1316_2 in ipairs(larry1315) do
local larry1317 =_1316_2["Name"]
end
local larry1318 =tick()
local larry1319 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1320 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1321 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1322 =genv["AutoCompressIsRunning"]
local larry1323 =genv["AutoCompressList"]
for larry1324, _1324_2 in ipairs(_1269_vararg1) do
end
local larry1325 =larry1271["GetChildren"]
local larry1326 =larry1325(larry1271)
for larry1327, _1327_2 in ipairs(larry1326) do
local larry1328 =_1327_2["Name"]
end
local larry1329 =tick()
local larry1330 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1331 =genv["AutoCompressIsRunning"]
local er =error("Luraph Script:494: internal 542: <larry: infinitelooperror>")
end)
local larry1285 =larry1284(larry1266, {
  ["Callback"] = function(...)
local _1286_vararg1, _1286_vararg2, _1286_vararg3, _1286_vararg4, _1286_vararg5, _1286_vararg6, _1286_vararg7, _1286_vararg8, _1286_vararg9, _1286_vararg10 = ...
genv["AutoCompressIsRunning"]=_1286_vararg1
local larry1287 =spawn(function(...)
local _1288_vararg1, _1288_vararg2, _1288_vararg3, _1288_vararg4, _1288_vararg5, _1288_vararg6, _1288_vararg7, _1288_vararg8, _1288_vararg9, _1288_vararg10 = ...
local larry1289 =genv["AutoCompressIsRunning"]
local larry1290 =genv["AutoCompressList"]
for larry1291, _1291_2 in ipairs(_1269_vararg1) do
end
local larry1292 =larry1271["GetChildren"]
local larry1293 =larry1292(larry1271)
for larry1294, _1294_2 in ipairs(larry1293) do
local larry1295 =_1294_2["Name"]
end
local larry1296 =tick()
local larry1297 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1298 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1299 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1300 =genv["AutoCompressIsRunning"]
local larry1301 =genv["AutoCompressList"]
for larry1302, _1302_2 in ipairs(_1269_vararg1) do
end
local larry1303 =larry1271["GetChildren"]
local larry1304 =larry1303(larry1271)
for larry1305, _1305_2 in ipairs(larry1304) do
local larry1306 =_1305_2["Name"]
end
local larry1307 =tick()
local larry1308 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1309 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1310 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1311 =genv["AutoCompressIsRunning"]
local larry1312 =genv["AutoCompressList"]
for larry1313, _1313_2 in ipairs(_1269_vararg1) do
end
local larry1314 =larry1271["GetChildren"]
local larry1315 =larry1314(larry1271)
for larry1316, _1316_2 in ipairs(larry1315) do
local larry1317 =_1316_2["Name"]
end
local larry1318 =tick()
local larry1319 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1320 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1321 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1322 =genv["AutoCompressIsRunning"]
local larry1323 =genv["AutoCompressList"]
for larry1324, _1324_2 in ipairs(_1269_vararg1) do
end
local larry1325 =larry1271["GetChildren"]
local larry1326 =larry1325(larry1271)
for larry1327, _1327_2 in ipairs(larry1326) do
local larry1328 =_1327_2["Name"]
end
local larry1329 =tick()
local larry1330 =genv["AutoCompressIsRunning"]
local _ =task.wait(1)
local larry1331 =genv["AutoCompressIsRunning"]
local er =error("Luraph Script:494: internal 542: <larry: infinitelooperror>")
end)
end,
  ["Default"] = false,
  ["Icon"] = "repeat",
  ["Title"] = "Auto Compress Toggle",
})
local larry1332 =larry43["Section"]
local larry1333 =larry1332(larry43, {
  ["Opened"] = false,
  ["Title"] = "Dupe Saplings",
  ["Icon"] = "leaf",
  ["Desc"] = "INFINITE Saplings Dupe",
})
local larry1334 =larry1333["Toggle"]
local larry1337 =task["spawn"]
local larry1340 =game["GetService"]
local larry1341 =larry1340(game, "Players")
local larry1342 =game["GetService"]
local larry1343 =larry1342(game, "ReplicatedStorage")
local larry1344 =game["GetService"]
local larry1345 =larry1344(game, "Workspace")
local larry1346 =game["GetService"]
local larry1347 =larry1346(game, "RunService")
local larry1348 =larry1341["LocalPlayer"]
local larry1349 =larry1348["Character"]
local larry1350 =larry1349["WaitForChild"]
local larry1351 =larry1350(larry1349, "HumanoidRootPart")
local larry1352 =larry1343["WaitForChild"]
local larry1353 =larry1352(larry1343, "RemoteEvents")
local larry1354 =larry1353["WaitForChild"]
local larry1355 =larry1354(larry1353, "RequestPlantItem")
local larry1356 =larry1345["WaitForChild"]
local larry1357 =larry1356(larry1345, "Items")
local larry1358 =larry1357["WaitForChild"]
local larry1359 =larry1358(larry1357, "Sapling")
local larry1360 =Vector3["new"]
local larry1361 =larry1351["Position"]
local larry1362 =larry1361["X"]
local larry1363 =larry1351["Position"]
local larry1364 =larry1363["Z"]
local larry1365 =larry1360(larry1362, 1.216280221939087, larry1364)
local larry1366 =larry1355["InvokeServer"]
local larry1367 =larry1366(larry1355, larry1359, larry1365)
local larry1368 =larry1347["Heartbeat"]
local larry1369 =larry1368["Wait"]
local larry1370 =larry1369(larry1368)
local larry1371 =Vector3["new"]
local larry1372 =larry1351["Position"]
local larry1373 =larry1372["X"]
local larry1374 =larry1351["Position"]
local larry1375 =larry1374["Z"]
local larry1376 =larry1371(larry1373, 1.216280221939087, larry1375)
local larry1377 =larry1355["InvokeServer"]
local larry1378 =larry1377(larry1355, larry1359, larry1376)
local larry1379 =larry1347["Heartbeat"]
local larry1380 =larry1379["Wait"]
local larry1381 =larry1380(larry1379)
local larry1382 =Vector3["new"]
local larry1383 =larry1351["Position"]
local larry1384 =larry1383["X"]
local larry1385 =larry1351["Position"]
local larry1386 =larry1385["Z"]
local larry1387 =larry1382(larry1384, 1.216280221939087, larry1386)
local larry1388 =larry1355["InvokeServer"]
local larry1389 =larry1388(larry1355, larry1359, larry1387)
local larry1390 =larry1347["Heartbeat"]
local larry1391 =larry1390["Wait"]
local larry1392 =larry1391(larry1390)
local larry1393 =Vector3["new"]
local larry1394 =larry1351["Position"]
local larry1395 =larry1394["X"]
local larry1396 =larry1351["Position"]
local larry1397 =larry1396["Z"]
local larry1398 =larry1393(larry1395, 1.216280221939087, larry1397)
local larry1399 =larry1355["InvokeServer"]
local larry1400 =larry1399(larry1355, larry1359, larry1398)
local larry1401 =larry1347["Heartbeat"]
local larry1402 =larry1401["Wait"]
local larry1403 =larry1402(larry1401)
local larry1404 =Vector3["new"]
local larry1405 =larry1351["Position"]
local er =error("Luraph Script:535: internal 542: <larry: infinitelooperror>")
local larry1338 =larry1337(function(...)
local _1339_vararg1, _1339_vararg2, _1339_vararg3, _1339_vararg4, _1339_vararg5, _1339_vararg6, _1339_vararg7, _1339_vararg8, _1339_vararg9, _1339_vararg10 = ...
local larry1340 =game["GetService"]
local larry1341 =larry1340(game, "Players")
local larry1342 =game["GetService"]
local larry1343 =larry1342(game, "ReplicatedStorage")
local larry1344 =game["GetService"]
local larry1345 =larry1344(game, "Workspace")
local larry1346 =game["GetService"]
local larry1347 =larry1346(game, "RunService")
local larry1348 =larry1341["LocalPlayer"]
local larry1349 =larry1348["Character"]
local larry1350 =larry1349["WaitForChild"]
local larry1351 =larry1350(larry1349, "HumanoidRootPart")
local larry1352 =larry1343["WaitForChild"]
local larry1353 =larry1352(larry1343, "RemoteEvents")
local larry1354 =larry1353["WaitForChild"]
local larry1355 =larry1354(larry1353, "RequestPlantItem")
local larry1356 =larry1345["WaitForChild"]
local larry1357 =larry1356(larry1345, "Items")
local larry1358 =larry1357["WaitForChild"]
local larry1359 =larry1358(larry1357, "Sapling")
local larry1360 =Vector3["new"]
local larry1361 =larry1351["Position"]
local larry1362 =larry1361["X"]
local larry1363 =larry1351["Position"]
local larry1364 =larry1363["Z"]
local larry1365 =larry1360(larry1362, 1.216280221939087, larry1364)
local larry1366 =larry1355["InvokeServer"]
local larry1367 =larry1366(larry1355, larry1359, larry1365)
local larry1368 =larry1347["Heartbeat"]
local larry1369 =larry1368["Wait"]
local larry1370 =larry1369(larry1368)
local larry1371 =Vector3["new"]
local larry1372 =larry1351["Position"]
local larry1373 =larry1372["X"]
local larry1374 =larry1351["Position"]
local larry1375 =larry1374["Z"]
local larry1376 =larry1371(larry1373, 1.216280221939087, larry1375)
local larry1377 =larry1355["InvokeServer"]
local larry1378 =larry1377(larry1355, larry1359, larry1376)
local larry1379 =larry1347["Heartbeat"]
local larry1380 =larry1379["Wait"]
local larry1381 =larry1380(larry1379)
local larry1382 =Vector3["new"]
local larry1383 =larry1351["Position"]
local larry1384 =larry1383["X"]
local larry1385 =larry1351["Position"]
local larry1386 =larry1385["Z"]
local larry1387 =larry1382(larry1384, 1.216280221939087, larry1386)
local larry1388 =larry1355["InvokeServer"]
local larry1389 =larry1388(larry1355, larry1359, larry1387)
local larry1390 =larry1347["Heartbeat"]
local larry1391 =larry1390["Wait"]
local larry1392 =larry1391(larry1390)
local larry1393 =Vector3["new"]
local larry1394 =larry1351["Position"]
local larry1395 =larry1394["X"]
local larry1396 =larry1351["Position"]
local larry1397 =larry1396["Z"]
local larry1398 =larry1393(larry1395, 1.216280221939087, larry1397)
local larry1399 =larry1355["InvokeServer"]
local larry1400 =larry1399(larry1355, larry1359, larry1398)
local larry1401 =larry1347["Heartbeat"]
local larry1402 =larry1401["Wait"]
local larry1403 =larry1402(larry1401)
local larry1404 =Vector3["new"]
local er =error("Luraph Script:535: internal 542: <larry: infinitelooperror>")
end)
local larry1335 =larry1334(larry1333, {
  ["Callback"] = function(...)
local _1336_vararg1, _1336_vararg2, _1336_vararg3, _1336_vararg4, _1336_vararg5, _1336_vararg6, _1336_vararg7, _1336_vararg8, _1336_vararg9, _1336_vararg10 = ...
local larry1337 =task["spawn"]
local larry1338 =larry1337(function(...)
local _1339_vararg1, _1339_vararg2, _1339_vararg3, _1339_vararg4, _1339_vararg5, _1339_vararg6, _1339_vararg7, _1339_vararg8, _1339_vararg9, _1339_vararg10 = ...
local larry1340 =game["GetService"]
local larry1341 =larry1340(game, "Players")
local larry1342 =game["GetService"]
local larry1343 =larry1342(game, "ReplicatedStorage")
local larry1344 =game["GetService"]
local larry1345 =larry1344(game, "Workspace")
local larry1346 =game["GetService"]
local larry1347 =larry1346(game, "RunService")
local larry1348 =larry1341["LocalPlayer"]
local larry1349 =larry1348["Character"]
local larry1350 =larry1349["WaitForChild"]
local larry1351 =larry1350(larry1349, "HumanoidRootPart")
local larry1352 =larry1343["WaitForChild"]
local larry1353 =larry1352(larry1343, "RemoteEvents")
local larry1354 =larry1353["WaitForChild"]
local larry1355 =larry1354(larry1353, "RequestPlantItem")
local larry1356 =larry1345["WaitForChild"]
local larry1357 =larry1356(larry1345, "Items")
local larry1358 =larry1357["WaitForChild"]
local larry1359 =larry1358(larry1357, "Sapling")
local larry1360 =Vector3["new"]
local larry1361 =larry1351["Position"]
local larry1362 =larry1361["X"]
local larry1363 =larry1351["Position"]
local larry1364 =larry1363["Z"]
local larry1365 =larry1360(larry1362, 1.216280221939087, larry1364)
local larry1366 =larry1355["InvokeServer"]
local larry1367 =larry1366(larry1355, larry1359, larry1365)
local larry1368 =larry1347["Heartbeat"]
local larry1369 =larry1368["Wait"]
local larry1370 =larry1369(larry1368)
local larry1371 =Vector3["new"]
local larry1372 =larry1351["Position"]
local larry1373 =larry1372["X"]
local larry1374 =larry1351["Position"]
local larry1375 =larry1374["Z"]
local larry1376 =larry1371(larry1373, 1.216280221939087, larry1375)
local larry1377 =larry1355["InvokeServer"]
local larry1378 =larry1377(larry1355, larry1359, larry1376)
local larry1379 =larry1347["Heartbeat"]
local larry1380 =larry1379["Wait"]
local larry1381 =larry1380(larry1379)
local larry1382 =Vector3["new"]
local larry1383 =larry1351["Position"]
local larry1384 =larry1383["X"]
local larry1385 =larry1351["Position"]
local larry1386 =larry1385["Z"]
local larry1387 =larry1382(larry1384, 1.216280221939087, larry1386)
local larry1388 =larry1355["InvokeServer"]
local larry1389 =larry1388(larry1355, larry1359, larry1387)
local larry1390 =larry1347["Heartbeat"]
local larry1391 =larry1390["Wait"]
local larry1392 =larry1391(larry1390)
local larry1393 =Vector3["new"]
local larry1394 =larry1351["Position"]
local larry1395 =larry1394["X"]
local larry1396 =larry1351["Position"]
local larry1397 =larry1396["Z"]
local larry1398 =larry1393(larry1395, 1.216280221939087, larry1397)
local larry1399 =larry1355["InvokeServer"]
local larry1400 =larry1399(larry1355, larry1359, larry1398)
local larry1401 =larry1347["Heartbeat"]
local larry1402 =larry1401["Wait"]
local larry1403 =larry1402(larry1401)
local larry1404 =Vector3["new"]
local er =error("Luraph Script:535: internal 542: <larry: infinitelooperror>")
end)
end,
  ["Default"] = false,
  ["Title"] = "Auto Dupe Saplings (Plant @ your position)",
  ["Desc"] = "Continuously plants a sapling at your position.",
})
local larry1406 =larry1333["Divider"]
local larry1407 =larry1406(larry1333)
local larry1408 =game["GetService"]
local larry1409 =larry1408(game, "Players")
local larry1410 =game["GetService"]
local larry1411 =larry1410(game, "ReplicatedStorage")
local larry1412 =game["GetService"]
local larry1413 =larry1412(game, "Workspace")
local larry1414 =larry1409["LocalPlayer"]
local larry1415 =larry1414["Character"]
local larry1416 =larry1415["WaitForChild"]
local larry1417 =larry1416(larry1415, "HumanoidRootPart")
local larry1418 =larry1411["WaitForChild"]
local larry1419 =larry1418(larry1411, "RemoteEvents")
local larry1420 =larry1419["WaitForChild"]
local larry1421 =larry1420(larry1419, "RequestPlantItem")
local larry1422 =larry1333["Slider"]
local larry1423 =larry1422(larry1333, {
  ["Value"] = {
  ["Max"] = 20000,
  ["Default"] = 200,
  ["Min"] = 10,
},
  ["Callback"] = function(...)
local _1424_vararg1, _1424_vararg2, _1424_vararg3, _1424_vararg4, _1424_vararg5, _1424_vararg6, _1424_vararg7, _1424_vararg8, _1424_vararg9, _1424_vararg10 = ...

end,
  ["Step"] = 1,
  ["Title"] = "Total Saplings",
})
local larry1425 =larry1333["Slider"]
local larry1426 =larry1425(larry1333, {
  ["Value"] = {
  ["Max"] = 150,
  ["Default"] = 20,
  ["Min"] = 5,
},
  ["Callback"] = function(...)
local _1427_vararg1, _1427_vararg2, _1427_vararg3, _1427_vararg4, _1427_vararg5, _1427_vararg6, _1427_vararg7, _1427_vararg8, _1427_vararg9, _1427_vararg10 = ...

end,
  ["Step"] = 1,
  ["Title"] = "Spiral Height",
})
local larry1428 =larry1333["Button"]
local larry1431 =larry1413["FindFirstChild"]
local larry1432 =larry1431(larry1413, "Items")
local larry1433 =larry1432["FindFirstChild"]
local larry1434 =larry1433(larry1432, "Sapling")
local larry1435 =larry1417["Position"]
local er =error("Luraph Script:631: Luraph Script:605: line 3: attempt to perform arithmetic (add) on nil and number")
local larry1429 =larry1428(larry1333, {
  ["Callback"] = function(...)
local _1430_vararg1, _1430_vararg2, _1430_vararg3, _1430_vararg4, _1430_vararg5, _1430_vararg6, _1430_vararg7, _1430_vararg8, _1430_vararg9, _1430_vararg10 = ...
local larry1431 =larry1413["FindFirstChild"]
local larry1432 =larry1431(larry1413, "Items")
local larry1433 =larry1432["FindFirstChild"]
local larry1434 =larry1433(larry1432, "Sapling")
local larry1435 =larry1417["Position"]
local er =error("Luraph Script:631: Luraph Script:605: line 3: attempt to perform arithmetic (add) on nil and number")
end,
  ["Title"] = "Plant Skybase Dupe Saplings",
  ["Icon"] = "cloud-upload",
  ["Desc"] = "Creates a skybase spiral with saplings using your settings",
})
local larry1436 =larry1333["Slider"]
local larry1437 =larry1436(larry1333, {
  ["Value"] = {
  ["Max"] = 150,
  ["Default"] = 50,
  ["Min"] = 10,
},
  ["Callback"] = function(...)
local _1438_vararg1, _1438_vararg2, _1438_vararg3, _1438_vararg4, _1438_vararg5, _1438_vararg6, _1438_vararg7, _1438_vararg8, _1438_vararg9, _1438_vararg10 = ...

end,
  ["Step"] = 1,
  ["Title"] = "Circle Plant Radius",
})
local larry1439 =larry1333["Slider"]
local larry1440 =larry1439(larry1333, {
  ["Value"] = {
  ["Max"] = 200,
  ["Default"] = 50,
  ["Min"] = 10,
},
  ["Callback"] = function(...)
local _1441_vararg1, _1441_vararg2, _1441_vararg3, _1441_vararg4, _1441_vararg5, _1441_vararg6, _1441_vararg7, _1441_vararg8, _1441_vararg9, _1441_vararg10 = ...

end,
  ["Step"] = 1,
  ["Title"] = "Circle Sapling Count",
})
local larry1442 =larry1333["Button"]
local larry1445 =game["GetService"]
local larry1446 =larry1445(game, "Players")
local larry1447 =game["GetService"]
local larry1448 =larry1447(game, "ReplicatedStorage")
local larry1449 =game["GetService"]
local larry1450 =larry1449(game, "Workspace")
local larry1451 =larry1446["LocalPlayer"]
local larry1452 =larry1451["Character"]
local larry1453 =larry1452["WaitForChild"]
local larry1454 =larry1453(larry1452, "HumanoidRootPart")
local larry1455 =larry1448["WaitForChild"]
local larry1456 =larry1455(larry1448, "RemoteEvents")
local larry1457 =larry1456["WaitForChild"]
local larry1458 =larry1457(larry1456, "RequestPlantItem")
local larry1459 =larry1450["FindFirstChild"]
local larry1460 =larry1459(larry1450, "Items")
local larry1461 =larry1460["FindFirstChild"]
local larry1462 =larry1461(larry1460, "Sapling")
local er =error("Luraph Script:688: line 3: attempt to perform arithmetic (add) on nil and number")
local larry1443 =larry1442(larry1333, {
  ["Callback"] = function(...)
local _1444_vararg1, _1444_vararg2, _1444_vararg3, _1444_vararg4, _1444_vararg5, _1444_vararg6, _1444_vararg7, _1444_vararg8, _1444_vararg9, _1444_vararg10 = ...
local larry1445 =game["GetService"]
local larry1446 =larry1445(game, "Players")
local larry1447 =game["GetService"]
local larry1448 =larry1447(game, "ReplicatedStorage")
local larry1449 =game["GetService"]
local larry1450 =larry1449(game, "Workspace")
local larry1451 =larry1446["LocalPlayer"]
local larry1452 =larry1451["Character"]
local larry1453 =larry1452["WaitForChild"]
local larry1454 =larry1453(larry1452, "HumanoidRootPart")
local larry1455 =larry1448["WaitForChild"]
local larry1456 =larry1455(larry1448, "RemoteEvents")
local larry1457 =larry1456["WaitForChild"]
local larry1458 =larry1457(larry1456, "RequestPlantItem")
local larry1459 =larry1450["FindFirstChild"]
local larry1460 =larry1459(larry1450, "Items")
local larry1461 =larry1460["FindFirstChild"]
local larry1462 =larry1461(larry1460, "Sapling")
local er =error("Luraph Script:688: line 3: attempt to perform arithmetic (add) on nil and number")
end,
  ["Title"] = "Plant Dupe Saplings in Circle",
  ["Desc"] = "Plants selected number of saplings in a circle around your position.",
})
local larry1463 =larry43["Section"]
local larry1464 =larry1463(larry43, {
  ["Opened"] = false,
  ["Title"] = "Auto Craft",
  ["Icon"] = "hammer",
  ["Desc"] = "Auto Craft Stuff",
})
local larry1465 =larry1464["Dropdown"]
local larry1466 =larry1465(larry1464, {
  ["Title"] = "Choose Items To Craft",
  ["AllowNone"] = true,
  ["Value"] = {},
  ["Multi"] = true,
  ["Callback"] = function(...)
local _1467_vararg1, _1467_vararg2, _1467_vararg3, _1467_vararg4, _1467_vararg5, _1467_vararg6, _1467_vararg7, _1467_vararg8, _1467_vararg9, _1467_vararg10 = ...
genv["bedAutoCraftList"]={}
for larry1468, _1468_2 in ipairs(_1467_vararg1) do
local larry1469 =genv["bedAutoCraftList"]
end
end,
  ["Values"] = {
  [1] = "Old Bed",
  [2] = "Crafting Bench 2",
  [3] = "Regular Bed",
  [4] = "Crafting Bench 3",
  [5] = "Good Bed",
  [6] = "Crafting Bench 4",
  [7] = "Giant Bed",
},
})
local larry1470 =larry1464["Toggle"]
local larry1471 =larry1470(larry1464, {
  ["Callback"] = function(...)
local _1472_vararg1, _1472_vararg2, _1472_vararg3, _1472_vararg4, _1472_vararg5, _1472_vararg6, _1472_vararg7, _1472_vararg8, _1472_vararg9, _1472_vararg10 = ...
genv["bedAutoCraftOn"]=_1472_vararg1
end,
  ["Default"] = false,
  ["Icon"] = "hammer",
  ["Title"] = "Auto Craft",
})
local larry1473 =larry1464["Toggle"]
local larry1474 =larry1473(larry1464, {
  ["Callback"] = function(...)
local _1475_vararg1, _1475_vararg2, _1475_vararg3, _1475_vararg4, _1475_vararg5, _1475_vararg6, _1475_vararg7, _1475_vararg8, _1475_vararg9, _1475_vararg10 = ...
genv["bedAutoPlaceBedsOn"]=_1475_vararg1
end,
  ["Default"] = false,
  ["Icon"] = "bed",
  ["Title"] = "Auto Place Beds",
})
local larry1476 =game["GetService"]
local larry1477 =larry1476(game, "Players")
local larry1478 =game["GetService"]
local larry1479 =larry1478(game, "Players")
local larry1480 =larry1479["LocalPlayer"]
local larry1481 =game["GetService"]
local larry1482 =larry1481(game, "ReplicatedStorage")
local larry1483 =game["GetService"]
local larry1484 =larry1483(game, "Workspace")
local larry1485 =larry1482["WaitForChild"]
local larry1486 =larry1485(larry1482, "RemoteEvents")
local larry1487 =larry1480["WaitForChild"]
local larry1488 =larry1487(larry1480, "Inventory")
local larry1489 =larry1480["WaitForChild"]
local larry1490 =larry1489(larry1480, "PlayerGui")
local larry1491 =larry1490["WaitForChild"]
local larry1492 =larry1491(larry1490, "Interface")
local larry1493 =larry1492["WaitForChild"]
local larry1494 =larry1493(larry1492, "CraftingTable")
local larry1495 =larry1494["Materials"]
local larry1496 =larry1495["FindFirstChild"]
local larry1497 =larry1496(larry1495, "GemAmount")
local larry1498 =larry1495["FindFirstChild"]
local larry1499 =larry1498(larry1495, "GreenGemAmount")
local larry1500 =larry1495["FindFirstChild"]
local larry1501 =larry1500(larry1495, "ScrapAmount")
local larry1502 =larry1495["FindFirstChild"]
local larry1503 =larry1502(larry1495, "WoodAmount")
local larry1504 =larry1486["FindFirstChild"]
local larry1505 =larry1504(larry1486, "CraftItem")
local larry1506 =Vector2["new"]
local larry1507 =larry1506(-25, -20)
local larry1508 =Vector2["new"]
local larry1509 =larry1508(20, -20)
local larry1510 =Vector2["new"]
local larry1511 =larry1510(14, 21)
local larry1512 =Vector2["new"]
local larry1513 =larry1512(-27, 17)
local larry1514 =larry1488["ChildAdded"]
local larry1515 =larry1514["Connect"]
local larry1518 =_1517_vararg1["Name"]
local larry1519 =_1517_vararg1["Name"]
local larry1516 =larry1515(larry1514, function(...)
local _1517_vararg1, _1517_vararg2, _1517_vararg3, _1517_vararg4, _1517_vararg5, _1517_vararg6, _1517_vararg7, _1517_vararg8, _1517_vararg9, _1517_vararg10 = ...
local larry1518 =_1517_vararg1["Name"]
local larry1519 =_1517_vararg1["Name"]
end)
local larry1520 =task["spawn"]
local _ =task.wait(0.3)
local larry1524 =larry1488["GetChildren"]
local larry1525 =larry1524(larry1488)
local larry1527 =_1526_2["Name"]
local _ =task.wait(0.3)
local larry1529 =larry1488["GetChildren"]
local larry1530 =larry1529(larry1488)
local larry1532 =_1531_2["Name"]
local _ =task.wait(0.3)
local larry1534 =larry1488["GetChildren"]
local larry1535 =larry1534(larry1488)
local larry1537 =_1536_2["Name"]
local _ =task.wait(0.3)
local larry1539 =larry1488["GetChildren"]
local larry1540 =larry1539(larry1488)
local larry1542 =_1541_2["Name"]
local _ =task.wait(0.3)
local larry1544 =larry1488["GetChildren"]
local larry1545 =larry1544(larry1488)
local larry1547 =_1546_2["Name"]
local _ =task.wait(0.3)
local larry1549 =larry1488["GetChildren"]
local larry1550 =larry1549(larry1488)
local larry1552 =_1551_2["Name"]
local _ =task.wait(0.3)
local larry1554 =larry1488["GetChildren"]
local larry1555 =larry1554(larry1488)
local larry1557 =_1556_2["Name"]
local _ =task.wait(0.3)
local larry1559 =larry1488["GetChildren"]
local larry1560 =larry1559(larry1488)
local larry1562 =_1561_2["Name"]
local _ =task.wait(0.3)
local larry1564 =larry1488["GetChildren"]
local larry1565 =larry1564(larry1488)
local larry1567 =_1566_2["Name"]
local _ =task.wait(0.3)
local larry1569 =larry1488["GetChildren"]
local larry1570 =larry1569(larry1488)
local larry1572 =_1571_2["Name"]
local _ =task.wait(0.3)
local larry1574 =larry1488["GetChildren"]
local larry1575 =larry1574(larry1488)
local larry1577 =_1576_2["Name"]
local _ =task.wait(0.3)
local larry1579 =larry1488["GetChildren"]
local larry1580 =larry1579(larry1488)
local larry1582 =_1581_2["Name"]
local _ =task.wait(0.3)
local larry1584 =larry1488["GetChildren"]
local larry1585 =larry1584(larry1488)
local larry1587 =_1586_2["Name"]
local _ =task.wait(0.3)
local larry1589 =larry1488["GetChildren"]
local larry1590 =larry1589(larry1488)
local larry1592 =_1591_2["Name"]
local _ =task.wait(0.3)
local larry1594 =larry1488["GetChildren"]
local larry1595 =larry1594(larry1488)
local er =error("Luraph Script:910: internal 542: <larry: infinitelooperror>")
local larry1521 =larry1520(function(...)
local _1522_vararg1, _1522_vararg2, _1522_vararg3, _1522_vararg4, _1522_vararg5, _1522_vararg6, _1522_vararg7, _1522_vararg8, _1522_vararg9, _1522_vararg10 = ...
local _ =task.wait(0.3)
local larry1523 =genv["bedAutoPlaceBedsOn"]
local larry1524 =larry1488["GetChildren"]
local larry1525 =larry1524(larry1488)
for larry1526, _1526_2 in ipairs(larry1525) do
local larry1527 =_1526_2["Name"]
end
local _ =task.wait(0.3)
local larry1528 =genv["bedAutoPlaceBedsOn"]
local larry1529 =larry1488["GetChildren"]
local larry1530 =larry1529(larry1488)
for larry1531, _1531_2 in ipairs(larry1530) do
local larry1532 =_1531_2["Name"]
end
local _ =task.wait(0.3)
local larry1533 =genv["bedAutoPlaceBedsOn"]
local larry1534 =larry1488["GetChildren"]
local larry1535 =larry1534(larry1488)
for larry1536, _1536_2 in ipairs(larry1535) do
local larry1537 =_1536_2["Name"]
end
local _ =task.wait(0.3)
local larry1538 =genv["bedAutoPlaceBedsOn"]
local larry1539 =larry1488["GetChildren"]
local larry1540 =larry1539(larry1488)
for larry1541, _1541_2 in ipairs(larry1540) do
local larry1542 =_1541_2["Name"]
end
local _ =task.wait(0.3)
local larry1543 =genv["bedAutoPlaceBedsOn"]
local larry1544 =larry1488["GetChildren"]
local larry1545 =larry1544(larry1488)
for larry1546, _1546_2 in ipairs(larry1545) do
local larry1547 =_1546_2["Name"]
end
local _ =task.wait(0.3)
local larry1548 =genv["bedAutoPlaceBedsOn"]
local larry1549 =larry1488["GetChildren"]
local larry1550 =larry1549(larry1488)
for larry1551, _1551_2 in ipairs(larry1550) do
local larry1552 =_1551_2["Name"]
end
local _ =task.wait(0.3)
local larry1553 =genv["bedAutoPlaceBedsOn"]
local larry1554 =larry1488["GetChildren"]
local larry1555 =larry1554(larry1488)
for larry1556, _1556_2 in ipairs(larry1555) do
local larry1557 =_1556_2["Name"]
end
local _ =task.wait(0.3)
local larry1558 =genv["bedAutoPlaceBedsOn"]
local larry1559 =larry1488["GetChildren"]
local larry1560 =larry1559(larry1488)
for larry1561, _1561_2 in ipairs(larry1560) do
local larry1562 =_1561_2["Name"]
end
local _ =task.wait(0.3)
local larry1563 =genv["bedAutoPlaceBedsOn"]
local larry1564 =larry1488["GetChildren"]
local larry1565 =larry1564(larry1488)
for larry1566, _1566_2 in ipairs(larry1565) do
local larry1567 =_1566_2["Name"]
end
local _ =task.wait(0.3)
local larry1568 =genv["bedAutoPlaceBedsOn"]
local larry1569 =larry1488["GetChildren"]
local larry1570 =larry1569(larry1488)
for larry1571, _1571_2 in ipairs(larry1570) do
local larry1572 =_1571_2["Name"]
end
local _ =task.wait(0.3)
local larry1573 =genv["bedAutoPlaceBedsOn"]
local larry1574 =larry1488["GetChildren"]
local larry1575 =larry1574(larry1488)
for larry1576, _1576_2 in ipairs(larry1575) do
local larry1577 =_1576_2["Name"]
end
local _ =task.wait(0.3)
local larry1578 =genv["bedAutoPlaceBedsOn"]
local larry1579 =larry1488["GetChildren"]
local larry1580 =larry1579(larry1488)
for larry1581, _1581_2 in ipairs(larry1580) do
local larry1582 =_1581_2["Name"]
end
local _ =task.wait(0.3)
local larry1583 =genv["bedAutoPlaceBedsOn"]
local larry1584 =larry1488["GetChildren"]
local larry1585 =larry1584(larry1488)
for larry1586, _1586_2 in ipairs(larry1585) do
local larry1587 =_1586_2["Name"]
end
local _ =task.wait(0.3)
local larry1588 =genv["bedAutoPlaceBedsOn"]
local larry1589 =larry1488["GetChildren"]
local larry1590 =larry1589(larry1488)
for larry1591, _1591_2 in ipairs(larry1590) do
local larry1592 =_1591_2["Name"]
end
local _ =task.wait(0.3)
local larry1593 =genv["bedAutoPlaceBedsOn"]
local larry1594 =larry1488["GetChildren"]
local er =error("Luraph Script:910: internal 542: <larry: infinitelooperror>")
end)
local larry1596 =task["spawn"]
local _ =task.wait(0.1)
local larry1600 =larry1503["Text"]
local larry1601 =larry1503["Text"]
local larry1602 =larry1501["Text"]
local larry1603 =larry1501["Text"]
local larry1604 =larry1497["Text"]
local larry1605 =larry1497["Text"]
local _ =task.wait(0.1)
local larry1607 =larry1503["Text"]
local larry1608 =larry1503["Text"]
local larry1609 =larry1501["Text"]
local er =error("Luraph Script:925: Luraph Script:921: internal 542: <larry: infinitelooperror>")
local larry1597 =larry1596(function(...)
local _1598_vararg1, _1598_vararg2, _1598_vararg3, _1598_vararg4, _1598_vararg5, _1598_vararg6, _1598_vararg7, _1598_vararg8, _1598_vararg9, _1598_vararg10 = ...
local _ =task.wait(0.1)
local larry1599 =genv["bedAutoCraftOn"]
local larry1600 =larry1503["Text"]
local larry1601 =larry1503["Text"]
local larry1602 =larry1501["Text"]
local larry1603 =larry1501["Text"]
local larry1604 =larry1497["Text"]
local larry1605 =larry1497["Text"]
local _ =task.wait(0.1)
local larry1606 =genv["bedAutoCraftOn"]
local larry1607 =larry1503["Text"]
local larry1608 =larry1503["Text"]
local er =error("Luraph Script:925: Luraph Script:921: internal 542: <larry: infinitelooperror>")
end)
local larry1610 =larry43["Section"]
local larry1611 =larry1610(larry43, {
  ["Opened"] = false,
  ["Title"] = "Fishing",
  ["Icon"] = "fish",
  ["Desc"] = "Fishing Stuff",
})
local larry1612 =larry1611["Button"]
local larry1615 =game["Players"]
local larry1616 =larry1615["LocalPlayer"]
local larry1617 =larry1616["Character"]
local larry1618 =larry1616["Character"]
local larry1619 =larry1618["FindFirstChild"]
local larry1620 =larry1619(larry1618, "HumanoidRootPart")
local larry1621 =workspace["FindFirstChild"]
local larry1622 =larry1621(workspace, "Map")
local larry1623 =workspace["Map"]
local larry1624 =larry1623["FindFirstChild"]
local larry1625 =larry1624(larry1623, "Landmarks")
local larry1626 =workspace["Map"]
local larry1627 =larry1626["Landmarks"]
local larry1628 =larry1627["FindFirstChild"]
local larry1629 =larry1628(larry1627, "Fishing Hut")
local larry1630 =larry1629["FindFirstChildWhichIsA"]
local larry1631 =larry1630(larry1629, "BasePart")
local larry1632 =larry1631["CFrame"]
local larry1633 =Vector3["new"]
local larry1634 =larry1633(0, 5, 0)
local larry1613 =larry1612(larry1611, {
  ["Callback"] = function(...)
local _1614_vararg1, _1614_vararg2, _1614_vararg3, _1614_vararg4, _1614_vararg5, _1614_vararg6, _1614_vararg7, _1614_vararg8, _1614_vararg9, _1614_vararg10 = ...
local larry1615 =game["Players"]
local larry1616 =larry1615["LocalPlayer"]
local larry1617 =larry1616["Character"]
local larry1618 =larry1616["Character"]
local larry1619 =larry1618["FindFirstChild"]
local larry1620 =larry1619(larry1618, "HumanoidRootPart")
local larry1621 =workspace["FindFirstChild"]
local larry1622 =larry1621(workspace, "Map")
local larry1623 =workspace["Map"]
local larry1624 =larry1623["FindFirstChild"]
local larry1625 =larry1624(larry1623, "Landmarks")
local larry1626 =workspace["Map"]
local larry1627 =larry1626["Landmarks"]
local larry1628 =larry1627["FindFirstChild"]
local larry1629 =larry1628(larry1627, "Fishing Hut")
local larry1630 =larry1629["FindFirstChildWhichIsA"]
local larry1631 =larry1630(larry1629, "BasePart")
local larry1632 =larry1631["CFrame"]
local larry1633 =Vector3["new"]
local larry1634 =larry1633(0, 5, 0)
local larry1635 =(larry1632+larry1634)
larry1620["CFrame"] =larry1635
end,
  ["Title"] = "Teleport to Fishing Hut",
  ["Icon"] = "location-dot",
  ["Desc"] = "Teleports you to the fishing hut",
})
local larry1636 =larry1611["Toggle"]
local larry1639 =game["GetService"]
local larry1640 =larry1639(game, "RunService")
local larry1641 =larry1640["RenderStepped"]
local larry1642 =larry1641["Connect"]
local larry1645 =game["Players"]
local larry1646 =larry1645["LocalPlayer"]
local larry1647 =larry1646["PlayerGui"]
local larry1648 =larry1647["FindFirstChild"]
local larry1649 =larry1648(larry1647, "Interface")
local larry1650 =larry1649["FindFirstChild"]
local larry1651 =larry1650(larry1649, "FishingCatchFrame")
local larry1652 =larry1651["Visible"]
local larry1653 =larry1651["FindFirstChild"]
local larry1654 =larry1653(larry1651, "TimingBar")
local larry1655 =larry1654["FindFirstChild"]
local larry1656 =larry1655(larry1654, "Bar")
local larry1657 =larry1654["FindFirstChild"]
local larry1658 =larry1657(larry1654, "SuccessArea")
local larry1659 =larry1656["AbsolutePosition"]
local larry1660 =larry1656["AbsoluteSize"]
local larry1661 =larry1658["AbsolutePosition"]
local larry1662 =larry1658["AbsoluteSize"]
local larry1663 =larry1659["X"]
local larry1664 =larry1661["X"]
local larry1665 =larry1662["X"]
local larry1668 =larry1659["X"]
local larry1669 =larry1660["X"]
local larry1671 =larry1661["X"]
local larry1673 =larry1659["Y"]
local larry1674 =larry1661["Y"]
local larry1675 =larry1662["Y"]
local larry1678 =larry1659["Y"]
local larry1679 =larry1660["Y"]
local larry1681 =larry1661["Y"]
local larry1683 =game["GetService"]
local larry1684 =larry1683(game, "VirtualInputManager")
local larry1685 =larry1684["SendMouseButtonEvent"]
local larry1686 =larry1685(larry1684, 0, 0, 0, true, game, 1)
local _ =task.wait(0.005)
local larry1687 =larry1684["SendMouseButtonEvent"]
local larry1688 =larry1687(larry1684, 0, 0, 0, false, game, 1)
local larry1643 =larry1642(larry1641, function(...)
local _1644_vararg1, _1644_vararg2, _1644_vararg3, _1644_vararg4, _1644_vararg5, _1644_vararg6, _1644_vararg7, _1644_vararg8, _1644_vararg9, _1644_vararg10 = ...
local larry1645 =game["Players"]
local larry1646 =larry1645["LocalPlayer"]
local larry1647 =larry1646["PlayerGui"]
local larry1648 =larry1647["FindFirstChild"]
local larry1649 =larry1648(larry1647, "Interface")
local larry1650 =larry1649["FindFirstChild"]
local larry1651 =larry1650(larry1649, "FishingCatchFrame")
local larry1652 =larry1651["Visible"]
local larry1653 =larry1651["FindFirstChild"]
local larry1654 =larry1653(larry1651, "TimingBar")
local larry1655 =larry1654["FindFirstChild"]
local larry1656 =larry1655(larry1654, "Bar")
local larry1657 =larry1654["FindFirstChild"]
local larry1658 =larry1657(larry1654, "SuccessArea")
local larry1659 =larry1656["AbsolutePosition"]
local larry1660 =larry1656["AbsoluteSize"]
local larry1661 =larry1658["AbsolutePosition"]
local larry1662 =larry1658["AbsoluteSize"]
local larry1663 =larry1659["X"]
local larry1664 =larry1661["X"]
local larry1665 =larry1662["X"]
local larry1666 =(larry1664+larry1665)
local larry1667 =(larry1663<larry1666)
local larry1668 =larry1659["X"]
local larry1669 =larry1660["X"]
local larry1670 =(larry1668+larry1669)
local larry1671 =larry1661["X"]
local larry1672 =(larry1671<larry1670)
local larry1673 =larry1659["Y"]
local larry1674 =larry1661["Y"]
local larry1675 =larry1662["Y"]
local larry1676 =(larry1674+larry1675)
local larry1677 =(larry1673<larry1676)
local larry1678 =larry1659["Y"]
local larry1679 =larry1660["Y"]
local larry1680 =(larry1678+larry1679)
local larry1681 =larry1661["Y"]
local larry1682 =(larry1681<larry1680)
local larry1683 =game["GetService"]
local larry1684 =larry1683(game, "VirtualInputManager")
local larry1685 =larry1684["SendMouseButtonEvent"]
local larry1686 =larry1685(larry1684, 0, 0, 0, true, game, 1)
local _ =task.wait(0.005)
local larry1687 =larry1684["SendMouseButtonEvent"]
local larry1688 =larry1687(larry1684, 0, 0, 0, false, game, 1)
end)
local larry1637 =larry1636(larry1611, {
  ["Callback"] = function(...)
local _1638_vararg1, _1638_vararg2, _1638_vararg3, _1638_vararg4, _1638_vararg5, _1638_vararg6, _1638_vararg7, _1638_vararg8, _1638_vararg9, _1638_vararg10 = ...
genv["autoCatchEnabled"]=_1638_vararg1
local larry1639 =game["GetService"]
local larry1640 =larry1639(game, "RunService")
local larry1641 =larry1640["RenderStepped"]
local larry1642 =larry1641["Connect"]
local larry1643 =larry1642(larry1641, function(...)
local _1644_vararg1, _1644_vararg2, _1644_vararg3, _1644_vararg4, _1644_vararg5, _1644_vararg6, _1644_vararg7, _1644_vararg8, _1644_vararg9, _1644_vararg10 = ...
local larry1645 =game["Players"]
local larry1646 =larry1645["LocalPlayer"]
local larry1647 =larry1646["PlayerGui"]
local larry1648 =larry1647["FindFirstChild"]
local larry1649 =larry1648(larry1647, "Interface")
local larry1650 =larry1649["FindFirstChild"]
local larry1651 =larry1650(larry1649, "FishingCatchFrame")
local larry1652 =larry1651["Visible"]
local larry1653 =larry1651["FindFirstChild"]
local larry1654 =larry1653(larry1651, "TimingBar")
local larry1655 =larry1654["FindFirstChild"]
local larry1656 =larry1655(larry1654, "Bar")
local larry1657 =larry1654["FindFirstChild"]
local larry1658 =larry1657(larry1654, "SuccessArea")
local larry1659 =larry1656["AbsolutePosition"]
local larry1660 =larry1656["AbsoluteSize"]
local larry1661 =larry1658["AbsolutePosition"]
local larry1662 =larry1658["AbsoluteSize"]
local larry1663 =larry1659["X"]
local larry1664 =larry1661["X"]
local larry1665 =larry1662["X"]
local larry1666 =(larry1664+larry1665)
local larry1667 =(larry1663<larry1666)
local larry1668 =larry1659["X"]
local larry1669 =larry1660["X"]
local larry1670 =(larry1668+larry1669)
local larry1671 =larry1661["X"]
local larry1672 =(larry1671<larry1670)
local larry1673 =larry1659["Y"]
local larry1674 =larry1661["Y"]
local larry1675 =larry1662["Y"]
local larry1676 =(larry1674+larry1675)
local larry1677 =(larry1673<larry1676)
local larry1678 =larry1659["Y"]
local larry1679 =larry1660["Y"]
local larry1680 =(larry1678+larry1679)
local larry1681 =larry1661["Y"]
local larry1682 =(larry1681<larry1680)
local larry1683 =game["GetService"]
local larry1684 =larry1683(game, "VirtualInputManager")
local larry1685 =larry1684["SendMouseButtonEvent"]
local larry1686 =larry1685(larry1684, 0, 0, 0, true, game, 1)
local _ =task.wait(0.005)
local larry1687 =larry1684["SendMouseButtonEvent"]
local larry1688 =larry1687(larry1684, 0, 0, 0, false, game, 1)
end)
genv["autoCatchConnection"]=larry1643
end,
  ["Default"] = false,
  ["Title"] = "Auto Catch Fish",
  ["Desc"] = "Automatically clicks when bar is in green zone",
})
local larry1689 =larry43["Section"]
local larry1690 =larry1689(larry43, {
  ["Opened"] = false,
  ["Title"] = "Taming",
  ["Icon"] = "dog",
  ["Desc"] = "Taming Stuff",
})
local larry1691 =larry1690["Toggle"]
local larry1694 =larry13["RenderStepped"]
local larry1695 =larry1694["Connect"]
local larry1698 =larry1409["LocalPlayer"]
local larry1699 =larry1698["PlayerGui"]
local larry1700 =larry1699["FindFirstChild"]
local larry1701 =larry1700(larry1699, "Interface")
local larry1702 =larry1701["FindFirstChild"]
local larry1703 =larry1702(larry1701, "TamingFluteFrame")
local larry1704 =larry1703["Visible"]
local larry1705 =larry1703["FindFirstChild"]
local larry1706 =larry1705(larry1703, "TimingBar")
local larry1707 =larry1706["FindFirstChild"]
local larry1708 =larry1707(larry1706, "SuccessArea")
local larry1709 =larry1708["Size"]
local larry1710 =larry1709["X"]
local larry1711 =UDim2["new"]
local larry1712 =larry1710["Scale"]
local larry1713 =larry1710["Offset"]
local larry1714 =larry1711(larry1712, larry1713, 0, 225)
local larry1696 =larry1695(larry1694, function(...)
local _1697_vararg1, _1697_vararg2, _1697_vararg3, _1697_vararg4, _1697_vararg5, _1697_vararg6, _1697_vararg7, _1697_vararg8, _1697_vararg9, _1697_vararg10 = ...
local larry1698 =larry1409["LocalPlayer"]
local larry1699 =larry1698["PlayerGui"]
local larry1700 =larry1699["FindFirstChild"]
local larry1701 =larry1700(larry1699, "Interface")
local larry1702 =larry1701["FindFirstChild"]
local larry1703 =larry1702(larry1701, "TamingFluteFrame")
local larry1704 =larry1703["Visible"]
local larry1705 =larry1703["FindFirstChild"]
local larry1706 =larry1705(larry1703, "TimingBar")
local larry1707 =larry1706["FindFirstChild"]
local larry1708 =larry1707(larry1706, "SuccessArea")
local larry1709 =larry1708["Size"]
local larry1710 =larry1709["X"]
local larry1711 =UDim2["new"]
local larry1712 =larry1710["Scale"]
local larry1713 =larry1710["Offset"]
local larry1714 =larry1711(larry1712, larry1713, 0, 225)
larry1708["Size"] =larry1714
end)
local larry1692 =larry1691(larry1690, {
  ["Callback"] = function(...)
local _1693_vararg1, _1693_vararg2, _1693_vararg3, _1693_vararg4, _1693_vararg5, _1693_vararg6, _1693_vararg7, _1693_vararg8, _1693_vararg9, _1693_vararg10 = ...
local larry1694 =larry13["RenderStepped"]
local larry1695 =larry1694["Connect"]
local larry1696 =larry1695(larry1694, function(...)
local _1697_vararg1, _1697_vararg2, _1697_vararg3, _1697_vararg4, _1697_vararg5, _1697_vararg6, _1697_vararg7, _1697_vararg8, _1697_vararg9, _1697_vararg10 = ...
local larry1698 =larry1409["LocalPlayer"]
local larry1699 =larry1698["PlayerGui"]
local larry1700 =larry1699["FindFirstChild"]
local larry1701 =larry1700(larry1699, "Interface")
local larry1702 =larry1701["FindFirstChild"]
local larry1703 =larry1702(larry1701, "TamingFluteFrame")
local larry1704 =larry1703["Visible"]
local larry1705 =larry1703["FindFirstChild"]
local larry1706 =larry1705(larry1703, "TimingBar")
local larry1707 =larry1706["FindFirstChild"]
local larry1708 =larry1707(larry1706, "SuccessArea")
local larry1709 =larry1708["Size"]
local larry1710 =larry1709["X"]
local larry1711 =UDim2["new"]
local larry1712 =larry1710["Scale"]
local larry1713 =larry1710["Offset"]
local larry1714 =larry1711(larry1712, larry1713, 0, 225)
larry1708["Size"] =larry1714
end)
end,
  ["Default"] = false,
  ["Title"] = "100% Success Tame",
})
local larry1715 =larry1413["WaitForChild"]
local larry1716 =larry1715(larry1413, "Items")
local larry1717 =larry1411["WaitForChild"]
local larry1718 =larry1717(larry1411, "RemoteEvents")
local larry1719 =larry1718["WaitForChild"]
local larry1720 =larry1719(larry1718, "RequestStartDraggingItem")
local larry1721 =larry1411["WaitForChild"]
local larry1722 =larry1721(larry1411, "RemoteEvents")
local larry1723 =larry1722["WaitForChild"]
local larry1724 =larry1723(larry1722, "StopDraggingItem")
local larry1725 =larry1690["Button"]
local larry1728 =larry1409["LocalPlayer"]
local larry1729 =larry1728["Character"]
local larry1730 =larry1729["FindFirstChild"]
local larry1731 =larry1730(larry1729, "HumanoidRootPart")
local larry1732 =larry1716["GetChildren"]
local larry1733 =larry1732(larry1716)
local larry1735 =_1734_2["Name"]
local larry1726 =larry1725(larry1690, {
  ["Locked"] = false,
  ["Title"] = "Bring Steak",
  ["Callback"] = function(...)
local _1727_vararg1, _1727_vararg2, _1727_vararg3, _1727_vararg4, _1727_vararg5, _1727_vararg6, _1727_vararg7, _1727_vararg8, _1727_vararg9, _1727_vararg10 = ...
local larry1728 =larry1409["LocalPlayer"]
local larry1729 =larry1728["Character"]
local larry1730 =larry1729["FindFirstChild"]
local larry1731 =larry1730(larry1729, "HumanoidRootPart")
local larry1732 =larry1716["GetChildren"]
local larry1733 =larry1732(larry1716)
for larry1734, _1734_2 in ipairs(larry1733) do
local larry1735 =_1734_2["Name"]
end
end,
})
local larry1736 =larry1690["Button"]
local larry1739 =larry1409["LocalPlayer"]
local larry1740 =larry1739["Character"]
local larry1741 =larry1740["FindFirstChild"]
local larry1742 =larry1741(larry1740, "HumanoidRootPart")
local larry1743 =larry1716["GetChildren"]
local larry1744 =larry1743(larry1716)
local larry1746 =_1745_2["Name"]
local larry1737 =larry1736(larry1690, {
  ["Locked"] = false,
  ["Title"] = "Bring Carrot",
  ["Callback"] = function(...)
local _1738_vararg1, _1738_vararg2, _1738_vararg3, _1738_vararg4, _1738_vararg5, _1738_vararg6, _1738_vararg7, _1738_vararg8, _1738_vararg9, _1738_vararg10 = ...
local larry1739 =larry1409["LocalPlayer"]
local larry1740 =larry1739["Character"]
local larry1741 =larry1740["FindFirstChild"]
local larry1742 =larry1741(larry1740, "HumanoidRootPart")
local larry1743 =larry1716["GetChildren"]
local larry1744 =larry1743(larry1716)
for larry1745, _1745_2 in ipairs(larry1744) do
local larry1746 =_1745_2["Name"]
end
end,
})
local larry1747 =larry1690["Button"]
local larry1750 =larry1409["LocalPlayer"]
local larry1751 =larry1750["Character"]
local larry1752 =larry1750["Character"]
local larry1753 =larry1752["FindFirstChild"]
local larry1754 =larry1753(larry1752, "HumanoidRootPart")
local larry1755 =larry1413["FindFirstChild"]
local larry1756 =larry1755(larry1413, "Map")
local larry1757 =larry1413["Map"]
local larry1758 =larry1757["FindFirstChild"]
local larry1759 =larry1758(larry1757, "Landmarks")
local larry1760 =larry1413["Map"]
local larry1761 =larry1760["Landmarks"]
local larry1762 =larry1761["FindFirstChild"]
local larry1763 =larry1762(larry1761, "Taming Tent")
local larry1764 =larry1763["FindFirstChildWhichIsA"]
local larry1765 =larry1764(larry1763, "BasePart")
local larry1766 =larry1765["CFrame"]
local larry1767 =Vector3["new"]
local larry1768 =larry1767(0, 5, 0)
local larry1748 =larry1747(larry1690, {
  ["Title"] = "Teleport to Taming Tent",
  ["Callback"] = function(...)
local _1749_vararg1, _1749_vararg2, _1749_vararg3, _1749_vararg4, _1749_vararg5, _1749_vararg6, _1749_vararg7, _1749_vararg8, _1749_vararg9, _1749_vararg10 = ...
local larry1750 =larry1409["LocalPlayer"]
local larry1751 =larry1750["Character"]
local larry1752 =larry1750["Character"]
local larry1753 =larry1752["FindFirstChild"]
local larry1754 =larry1753(larry1752, "HumanoidRootPart")
local larry1755 =larry1413["FindFirstChild"]
local larry1756 =larry1755(larry1413, "Map")
local larry1757 =larry1413["Map"]
local larry1758 =larry1757["FindFirstChild"]
local larry1759 =larry1758(larry1757, "Landmarks")
local larry1760 =larry1413["Map"]
local larry1761 =larry1760["Landmarks"]
local larry1762 =larry1761["FindFirstChild"]
local larry1763 =larry1762(larry1761, "Taming Tent")
local larry1764 =larry1763["FindFirstChildWhichIsA"]
local larry1765 =larry1764(larry1763, "BasePart")
local larry1766 =larry1765["CFrame"]
local larry1767 =Vector3["new"]
local larry1768 =larry1767(0, 5, 0)
local larry1769 =(larry1766+larry1768)
larry1754["CFrame"] =larry1769
end,
})
local larry1770 =larry43["Section"]
local larry1771 =larry1770(larry43, {
  ["Opened"] = false,
  ["Title"] = "Circle Planting",
  ["Icon"] = "leaf",
  ["Desc"] = "Auto Place Saplings",
})
local larry1772 =larry1771["Slider"]
local larry1773 =larry1772(larry1771, {
  ["Value"] = {
  ["Max"] = 75,
  ["Default"] = 50,
  ["Min"] = 10,
},
  ["Callback"] = function(...)
local _1774_vararg1, _1774_vararg2, _1774_vararg3, _1774_vararg4, _1774_vararg5, _1774_vararg6, _1774_vararg7, _1774_vararg8, _1774_vararg9, _1774_vararg10 = ...
fenv["_R"] = nil
end,
  ["Step"] = 1,
  ["Title"] = "Radius",
})
local larry1775 =larry1771["Slider"]
local larry1776 =larry1775(larry1771, {
  ["Value"] = {
  ["Max"] = 50,
  ["Default"] = 10,
  ["Min"] = 1,
},
  ["Callback"] = function(...)
local _1777_vararg1, _1777_vararg2, _1777_vararg3, _1777_vararg4, _1777_vararg5, _1777_vararg6, _1777_vararg7, _1777_vararg8, _1777_vararg9, _1777_vararg10 = ...
fenv["_angleStep"] = nil
end,
  ["Step"] = 1,
  ["Title"] = "Spacing",
})
local larry1778 =larry1771["Toggle"]
local larry1781 =game["GetService"]
local larry1782 =larry1781(game, "Players")
local larry1783 =game["GetService"]
local larry1784 =larry1783(game, "ReplicatedStorage")
local larry1785 =larry1784["WaitForChild"]
local larry1786 =larry1785(larry1784, "RemoteEvents")
local larry1787 =larry1786["WaitForChild"]
local larry1788 =larry1787(larry1786, "RequestPlantItem")
local larry1789 =workspace["WaitForChild"]
local larry1790 =larry1789(workspace, "Items")
local larry1791 =larry1790["WaitForChild"]
local larry1792 =larry1791(larry1790, "Sapling")
local larry1793 =larry1782["LocalPlayer"]
local larry1794 =larry1793["Character"]
local larry1795 =larry1794["WaitForChild"]
local larry1796 =larry1795(larry1794, "HumanoidRootPart")
local er =error("Luraph Script:1213: line 3: attempt to perform arithmetic (add) on nil and number")
local larry1779 =larry1778(larry1771, {
  ["Callback"] = function(...)
local _1780_vararg1, _1780_vararg2, _1780_vararg3, _1780_vararg4, _1780_vararg5, _1780_vararg6, _1780_vararg7, _1780_vararg8, _1780_vararg9, _1780_vararg10 = ...
fenv["_circlePlantingEnabled"] = _1780_vararg1
local larry1781 =game["GetService"]
local larry1782 =larry1781(game, "Players")
local larry1783 =game["GetService"]
local larry1784 =larry1783(game, "ReplicatedStorage")
local larry1785 =larry1784["WaitForChild"]
local larry1786 =larry1785(larry1784, "RemoteEvents")
local larry1787 =larry1786["WaitForChild"]
local larry1788 =larry1787(larry1786, "RequestPlantItem")
local larry1789 =workspace["WaitForChild"]
local larry1790 =larry1789(workspace, "Items")
local larry1791 =larry1790["WaitForChild"]
local larry1792 =larry1791(larry1790, "Sapling")
local larry1793 =larry1782["LocalPlayer"]
local larry1794 =larry1793["Character"]
local larry1795 =larry1794["WaitForChild"]
local larry1796 =larry1795(larry1794, "HumanoidRootPart")
local larry1797=fenv["_R"]
local larry1798=fenv["_angleStep"]
local er =error("Luraph Script:1213: line 3: attempt to perform arithmetic (add) on nil and number")
end,
  ["Default"] = false,
  ["Title"] = "Enable Circle Planting",
})
local larry1799 =larry43["Section"]
local larry1800 =larry1799(larry43, {
  ["Opened"] = false,
  ["Title"] = "Auto Random Stuff",
  ["Icon"] = "shuffle",
  ["Desc"] = "Auto Do Small Tasks",
})
local larry1801 =game["Players"]
local larry1802 =larry1801["LocalPlayer"]
local larry1803 =larry1800["Toggle"]
local larry1806 =Instance["new"]
local larry1807 =larry1806("ScreenGui")
local larry1808 =larry1802["PlayerGui"]
local larry1809 =Instance["new"]
local larry1810 =larry1809("TextButton")
local larry1811 =UDim2["new"]
local larry1812 =larry1811(0, 120, 0, 40)
local larry1813 =UDim2["new"]
local larry1814 =larry1813(0.5, -60, 1, -50)
local larry1815 =Vector2["new"]
local larry1816 =larry1815(0.5, 0)
local larry1817 =Color3["fromRGB"]
local larry1818 =larry1817(200, 40, 40)
local larry1819 =Color3["new"]
local larry1820 =larry1819(1, 1, 1)
local larry1821 =Enum["Font"]
local larry1822 =larry1821["SourceSansBold"]
local larry1823 =Vector3["new"]
local larry1824 =larry1823(-37.08, 6.98, -16.33)
local larry1825 =larry1810["MouseButton1Click"]
local larry1826 =larry1825["Connect"]
local larry1829 =Color3["fromRGB"]
local larry1830 =larry1829(40, 200, 60)
local larry1827 =larry1826(larry1825, function(...)
local _1828_vararg1, _1828_vararg2, _1828_vararg3, _1828_vararg4, _1828_vararg5, _1828_vararg6, _1828_vararg7, _1828_vararg8, _1828_vararg9, _1828_vararg10 = ...
local larry1829 =Color3["fromRGB"]
local larry1830 =larry1829(40, 200, 60)
larry1810["BackgroundColor3"] =larry1830
larry1810["Text"] ="Auto Pick: ON"
end)
local larry1831 =task["spawn"]
local larry1834 =larry1802["Character"]
local larry1835 =larry1834["FindFirstChild"]
local larry1836 =larry1835(larry1834, "HumanoidRootPart")
local larry1837 =workspace["Map"]
local larry1838 =larry1837["Landmarks"]
local larry1839 =larry1838["GetChildren"]
local larry1840 =larry1839(larry1838)
local larry1842 =_1841_2["Name"]
local _ =task.wait(0.1)
local larry1843 =larry1802["Character"]
local larry1844 =larry1843["FindFirstChild"]
local larry1845 =larry1844(larry1843, "HumanoidRootPart")
local larry1846 =workspace["Map"]
local larry1847 =larry1846["Landmarks"]
local larry1848 =larry1847["GetChildren"]
local larry1849 =larry1848(larry1847)
local larry1851 =_1850_2["Name"]
local _ =task.wait(0.1)
local larry1852 =larry1802["Character"]
local larry1853 =larry1852["FindFirstChild"]
local larry1854 =larry1853(larry1852, "HumanoidRootPart")
local larry1855 =workspace["Map"]
local larry1856 =larry1855["Landmarks"]
local larry1857 =larry1856["GetChildren"]
local larry1858 =larry1857(larry1856)
local larry1860 =_1859_2["Name"]
local _ =task.wait(0.1)
local larry1861 =larry1802["Character"]
local larry1862 =larry1861["FindFirstChild"]
local larry1863 =larry1862(larry1861, "HumanoidRootPart")
local larry1864 =workspace["Map"]
local larry1865 =larry1864["Landmarks"]
local larry1866 =larry1865["GetChildren"]
local larry1867 =larry1866(larry1865)
local larry1869 =_1868_2["Name"]
local _ =task.wait(0.1)
local larry1870 =larry1802["Character"]
local larry1871 =larry1870["FindFirstChild"]
local larry1872 =larry1871(larry1870, "HumanoidRootPart")
local larry1873 =workspace["Map"]
local larry1874 =larry1873["Landmarks"]
local larry1875 =larry1874["GetChildren"]
local larry1876 =larry1875(larry1874)
local larry1878 =_1877_2["Name"]
local _ =task.wait(0.1)
local larry1879 =larry1802["Character"]
local larry1880 =larry1879["FindFirstChild"]
local larry1881 =larry1880(larry1879, "HumanoidRootPart")
local larry1882 =workspace["Map"]
local larry1883 =larry1882["Landmarks"]
local larry1884 =larry1883["GetChildren"]
local larry1885 =larry1884(larry1883)
local larry1887 =_1886_2["Name"]
local _ =task.wait(0.1)
local larry1888 =larry1802["Character"]
local larry1889 =larry1888["FindFirstChild"]
local larry1890 =larry1889(larry1888, "HumanoidRootPart")
local larry1891 =workspace["Map"]
local larry1892 =larry1891["Landmarks"]
local larry1893 =larry1892["GetChildren"]
local larry1894 =larry1893(larry1892)
local larry1896 =_1895_2["Name"]
local _ =task.wait(0.1)
local larry1897 =larry1802["Character"]
local larry1898 =larry1897["FindFirstChild"]
local larry1899 =larry1898(larry1897, "HumanoidRootPart")
local larry1900 =workspace["Map"]
local larry1901 =larry1900["Landmarks"]
local larry1902 =larry1901["GetChildren"]
local larry1903 =larry1902(larry1901)
local larry1905 =_1904_2["Name"]
local _ =task.wait(0.1)
local larry1906 =larry1802["Character"]
local larry1907 =larry1906["FindFirstChild"]
local larry1908 =larry1907(larry1906, "HumanoidRootPart")
local larry1909 =workspace["Map"]
local larry1910 =larry1909["Landmarks"]
local larry1911 =larry1910["GetChildren"]
local larry1912 =larry1911(larry1910)
local larry1914 =_1913_2["Name"]
local _ =task.wait(0.1)
local larry1915 =larry1802["Character"]
local larry1916 =larry1915["FindFirstChild"]
local larry1917 =larry1916(larry1915, "HumanoidRootPart")
local larry1918 =workspace["Map"]
local larry1919 =larry1918["Landmarks"]
local larry1920 =larry1919["GetChildren"]
local larry1921 =larry1920(larry1919)
local larry1923 =_1922_2["Name"]
local _ =task.wait(0.1)
local larry1924 =larry1802["Character"]
local larry1925 =larry1924["FindFirstChild"]
local larry1926 =larry1925(larry1924, "HumanoidRootPart")
local larry1927 =workspace["Map"]
local larry1928 =larry1927["Landmarks"]
local larry1929 =larry1928["GetChildren"]
local larry1930 =larry1929(larry1928)
local larry1932 =_1931_2["Name"]
local _ =task.wait(0.1)
local larry1933 =larry1802["Character"]
local larry1934 =larry1933["FindFirstChild"]
local larry1935 =larry1934(larry1933, "HumanoidRootPart")
local larry1936 =workspace["Map"]
local larry1937 =larry1936["Landmarks"]
local larry1938 =larry1937["GetChildren"]
local larry1939 =larry1938(larry1937)
local larry1941 =_1940_2["Name"]
local _ =task.wait(0.1)
local larry1942 =larry1802["Character"]
local larry1943 =larry1942["FindFirstChild"]
local larry1944 =larry1943(larry1942, "HumanoidRootPart")
local larry1945 =workspace["Map"]
local larry1946 =larry1945["Landmarks"]
local larry1947 =larry1946["GetChildren"]
local larry1948 =larry1947(larry1946)
local larry1950 =_1949_2["Name"]
local _ =task.wait(0.1)
local larry1951 =larry1802["Character"]
local larry1952 =larry1951["FindFirstChild"]
local larry1953 =larry1952(larry1951, "HumanoidRootPart")
local larry1954 =workspace["Map"]
local larry1955 =larry1954["Landmarks"]
local larry1956 =larry1955["GetChildren"]
local larry1957 =larry1956(larry1955)
local larry1959 =_1958_2["Name"]
local _ =task.wait(0.1)
local larry1960 =larry1802["Character"]
local larry1961 =larry1960["FindFirstChild"]
local larry1962 =larry1961(larry1960, "HumanoidRootPart")
local larry1963 =workspace["Map"]
local larry1964 =larry1963["Landmarks"]
local larry1965 =larry1964["GetChildren"]
local larry1966 =larry1965(larry1964)
local larry1968 =_1967_2["Name"]
local _ =task.wait(0.1)
local larry1969 =larry1802["Character"]
local larry1970 =larry1969["FindFirstChild"]
local larry1971 =larry1970(larry1969, "HumanoidRootPart")
local larry1972 =workspace["Map"]
local larry1973 =larry1972["Landmarks"]
local larry1974 =larry1973["GetChildren"]
local larry1975 =larry1974(larry1973)
local larry1977 =_1976_2["Name"]
local _ =task.wait(0.1)
local larry1978 =larry1802["Character"]
local larry1979 =larry1978["FindFirstChild"]
local larry1980 =larry1979(larry1978, "HumanoidRootPart")
local larry1981 =workspace["Map"]
local larry1982 =larry1981["Landmarks"]
local larry1983 =larry1982["GetChildren"]
local larry1984 =larry1983(larry1982)
local larry1986 =_1985_2["Name"]
local _ =task.wait(0.1)
local larry1987 =larry1802["Character"]
local larry1988 =larry1987["FindFirstChild"]
local larry1989 =larry1988(larry1987, "HumanoidRootPart")
local larry1990 =workspace["Map"]
local larry1991 =larry1990["Landmarks"]
local larry1992 =larry1991["GetChildren"]
local larry1993 =larry1992(larry1991)
local larry1995 =_1994_2["Name"]
local _ =task.wait(0.1)
local larry1996 =larry1802["Character"]
local larry1997 =larry1996["FindFirstChild"]
local larry1998 =larry1997(larry1996, "HumanoidRootPart")
local larry1999 =workspace["Map"]
local er =error("Luraph Script:1276: internal 542: <larry: infinitelooperror>")
local larry1832 =larry1831(function(...)
local _1833_vararg1, _1833_vararg2, _1833_vararg3, _1833_vararg4, _1833_vararg5, _1833_vararg6, _1833_vararg7, _1833_vararg8, _1833_vararg9, _1833_vararg10 = ...
local larry1834 =larry1802["Character"]
local larry1835 =larry1834["FindFirstChild"]
local larry1836 =larry1835(larry1834, "HumanoidRootPart")
local larry1837 =workspace["Map"]
local larry1838 =larry1837["Landmarks"]
local larry1839 =larry1838["GetChildren"]
local larry1840 =larry1839(larry1838)
for larry1841, _1841_2 in ipairs(larry1840) do
local larry1842 =_1841_2["Name"]
end
local _ =task.wait(0.1)
local larry1843 =larry1802["Character"]
local larry1844 =larry1843["FindFirstChild"]
local larry1845 =larry1844(larry1843, "HumanoidRootPart")
local larry1846 =workspace["Map"]
local larry1847 =larry1846["Landmarks"]
local larry1848 =larry1847["GetChildren"]
local larry1849 =larry1848(larry1847)
for larry1850, _1850_2 in ipairs(larry1849) do
local larry1851 =_1850_2["Name"]
end
local _ =task.wait(0.1)
local larry1852 =larry1802["Character"]
local larry1853 =larry1852["FindFirstChild"]
local larry1854 =larry1853(larry1852, "HumanoidRootPart")
local larry1855 =workspace["Map"]
local larry1856 =larry1855["Landmarks"]
local larry1857 =larry1856["GetChildren"]
local larry1858 =larry1857(larry1856)
for larry1859, _1859_2 in ipairs(larry1858) do
local larry1860 =_1859_2["Name"]
end
local _ =task.wait(0.1)
local larry1861 =larry1802["Character"]
local larry1862 =larry1861["FindFirstChild"]
local larry1863 =larry1862(larry1861, "HumanoidRootPart")
local larry1864 =workspace["Map"]
local larry1865 =larry1864["Landmarks"]
local larry1866 =larry1865["GetChildren"]
local larry1867 =larry1866(larry1865)
for larry1868, _1868_2 in ipairs(larry1867) do
local larry1869 =_1868_2["Name"]
end
local _ =task.wait(0.1)
local larry1870 =larry1802["Character"]
local larry1871 =larry1870["FindFirstChild"]
local larry1872 =larry1871(larry1870, "HumanoidRootPart")
local larry1873 =workspace["Map"]
local larry1874 =larry1873["Landmarks"]
local larry1875 =larry1874["GetChildren"]
local larry1876 =larry1875(larry1874)
for larry1877, _1877_2 in ipairs(larry1876) do
local larry1878 =_1877_2["Name"]
end
local _ =task.wait(0.1)
local larry1879 =larry1802["Character"]
local larry1880 =larry1879["FindFirstChild"]
local larry1881 =larry1880(larry1879, "HumanoidRootPart")
local larry1882 =workspace["Map"]
local larry1883 =larry1882["Landmarks"]
local larry1884 =larry1883["GetChildren"]
local larry1885 =larry1884(larry1883)
for larry1886, _1886_2 in ipairs(larry1885) do
local larry1887 =_1886_2["Name"]
end
local _ =task.wait(0.1)
local larry1888 =larry1802["Character"]
local larry1889 =larry1888["FindFirstChild"]
local larry1890 =larry1889(larry1888, "HumanoidRootPart")
local larry1891 =workspace["Map"]
local larry1892 =larry1891["Landmarks"]
local larry1893 =larry1892["GetChildren"]
local larry1894 =larry1893(larry1892)
for larry1895, _1895_2 in ipairs(larry1894) do
local larry1896 =_1895_2["Name"]
end
local _ =task.wait(0.1)
local larry1897 =larry1802["Character"]
local larry1898 =larry1897["FindFirstChild"]
local larry1899 =larry1898(larry1897, "HumanoidRootPart")
local larry1900 =workspace["Map"]
local larry1901 =larry1900["Landmarks"]
local larry1902 =larry1901["GetChildren"]
local larry1903 =larry1902(larry1901)
for larry1904, _1904_2 in ipairs(larry1903) do
local larry1905 =_1904_2["Name"]
end
local _ =task.wait(0.1)
local larry1906 =larry1802["Character"]
local larry1907 =larry1906["FindFirstChild"]
local larry1908 =larry1907(larry1906, "HumanoidRootPart")
local larry1909 =workspace["Map"]
local larry1910 =larry1909["Landmarks"]
local larry1911 =larry1910["GetChildren"]
local larry1912 =larry1911(larry1910)
for larry1913, _1913_2 in ipairs(larry1912) do
local larry1914 =_1913_2["Name"]
end
local _ =task.wait(0.1)
local larry1915 =larry1802["Character"]
local larry1916 =larry1915["FindFirstChild"]
local larry1917 =larry1916(larry1915, "HumanoidRootPart")
local larry1918 =workspace["Map"]
local larry1919 =larry1918["Landmarks"]
local larry1920 =larry1919["GetChildren"]
local larry1921 =larry1920(larry1919)
for larry1922, _1922_2 in ipairs(larry1921) do
local larry1923 =_1922_2["Name"]
end
local _ =task.wait(0.1)
local larry1924 =larry1802["Character"]
local larry1925 =larry1924["FindFirstChild"]
local larry1926 =larry1925(larry1924, "HumanoidRootPart")
local larry1927 =workspace["Map"]
local larry1928 =larry1927["Landmarks"]
local larry1929 =larry1928["GetChildren"]
local larry1930 =larry1929(larry1928)
for larry1931, _1931_2 in ipairs(larry1930) do
local larry1932 =_1931_2["Name"]
end
local _ =task.wait(0.1)
local larry1933 =larry1802["Character"]
local larry1934 =larry1933["FindFirstChild"]
local larry1935 =larry1934(larry1933, "HumanoidRootPart")
local larry1936 =workspace["Map"]
local larry1937 =larry1936["Landmarks"]
local larry1938 =larry1937["GetChildren"]
local larry1939 =larry1938(larry1937)
for larry1940, _1940_2 in ipairs(larry1939) do
local larry1941 =_1940_2["Name"]
end
local _ =task.wait(0.1)
local larry1942 =larry1802["Character"]
local larry1943 =larry1942["FindFirstChild"]
local larry1944 =larry1943(larry1942, "HumanoidRootPart")
local larry1945 =workspace["Map"]
local larry1946 =larry1945["Landmarks"]
local larry1947 =larry1946["GetChildren"]
local larry1948 =larry1947(larry1946)
for larry1949, _1949_2 in ipairs(larry1948) do
local larry1950 =_1949_2["Name"]
end
local _ =task.wait(0.1)
local larry1951 =larry1802["Character"]
local larry1952 =larry1951["FindFirstChild"]
local larry1953 =larry1952(larry1951, "HumanoidRootPart")
local larry1954 =workspace["Map"]
local larry1955 =larry1954["Landmarks"]
local larry1956 =larry1955["GetChildren"]
local larry1957 =larry1956(larry1955)
for larry1958, _1958_2 in ipairs(larry1957) do
local larry1959 =_1958_2["Name"]
end
local _ =task.wait(0.1)
local larry1960 =larry1802["Character"]
local larry1961 =larry1960["FindFirstChild"]
local larry1962 =larry1961(larry1960, "HumanoidRootPart")
local larry1963 =workspace["Map"]
local larry1964 =larry1963["Landmarks"]
local larry1965 =larry1964["GetChildren"]
local larry1966 =larry1965(larry1964)
for larry1967, _1967_2 in ipairs(larry1966) do
local larry1968 =_1967_2["Name"]
end
local _ =task.wait(0.1)
local larry1969 =larry1802["Character"]
local larry1970 =larry1969["FindFirstChild"]
local larry1971 =larry1970(larry1969, "HumanoidRootPart")
local larry1972 =workspace["Map"]
local larry1973 =larry1972["Landmarks"]
local larry1974 =larry1973["GetChildren"]
local larry1975 =larry1974(larry1973)
for larry1976, _1976_2 in ipairs(larry1975) do
local larry1977 =_1976_2["Name"]
end
local _ =task.wait(0.1)
local larry1978 =larry1802["Character"]
local larry1979 =larry1978["FindFirstChild"]
local larry1980 =larry1979(larry1978, "HumanoidRootPart")
local larry1981 =workspace["Map"]
local larry1982 =larry1981["Landmarks"]
local larry1983 =larry1982["GetChildren"]
local larry1984 =larry1983(larry1982)
for larry1985, _1985_2 in ipairs(larry1984) do
local larry1986 =_1985_2["Name"]
end
local _ =task.wait(0.1)
local larry1987 =larry1802["Character"]
local larry1988 =larry1987["FindFirstChild"]
local larry1989 =larry1988(larry1987, "HumanoidRootPart")
local larry1990 =workspace["Map"]
local larry1991 =larry1990["Landmarks"]
local larry1992 =larry1991["GetChildren"]
local larry1993 =larry1992(larry1991)
for larry1994, _1994_2 in ipairs(larry1993) do
local larry1995 =_1994_2["Name"]
end
local _ =task.wait(0.1)
local larry1996 =larry1802["Character"]
local larry1997 =larry1996["FindFirstChild"]
local larry1998 =larry1997(larry1996, "HumanoidRootPart")
local er =error("Luraph Script:1276: internal 542: <larry: infinitelooperror>")
end)
local larry1804 =larry1803(larry1800, {
  ["Callback"] = function(...)
local _1805_vararg1, _1805_vararg2, _1805_vararg3, _1805_vararg4, _1805_vararg5, _1805_vararg6, _1805_vararg7, _1805_vararg8, _1805_vararg9, _1805_vararg10 = ...
local larry1806 =Instance["new"]
local larry1807 =larry1806("ScreenGui")
local larry1808 =larry1802["PlayerGui"]
larry1807["Parent"] =larry1808
local larry1809 =Instance["new"]
local larry1810 =larry1809("TextButton")
local larry1811 =UDim2["new"]
local larry1812 =larry1811(0, 120, 0, 40)
larry1810["Size"] =larry1812
local larry1813 =UDim2["new"]
local larry1814 =larry1813(0.5, -60, 1, -50)
larry1810["Position"] =larry1814
local larry1815 =Vector2["new"]
local larry1816 =larry1815(0.5, 0)
larry1810["AnchorPoint"] =larry1816
local larry1817 =Color3["fromRGB"]
local larry1818 =larry1817(200, 40, 40)
larry1810["BackgroundColor3"] =larry1818
local larry1819 =Color3["new"]
local larry1820 =larry1819(1, 1, 1)
larry1810["TextColor3"] =larry1820
local larry1821 =Enum["Font"]
local larry1822 =larry1821["SourceSansBold"]
larry1810["Font"] =larry1822
larry1810["TextSize"] =20
larry1810["Text"] ="Auto Pick: OFF"
larry1810["Parent"] =larry1807
local larry1823 =Vector3["new"]
local larry1824 =larry1823(-37.08, 6.98, -16.33)
local larry1825 =larry1810["MouseButton1Click"]
local larry1826 =larry1825["Connect"]
local larry1827 =larry1826(larry1825, function(...)
local _1828_vararg1, _1828_vararg2, _1828_vararg3, _1828_vararg4, _1828_vararg5, _1828_vararg6, _1828_vararg7, _1828_vararg8, _1828_vararg9, _1828_vararg10 = ...
local larry1829 =Color3["fromRGB"]
local larry1830 =larry1829(40, 200, 60)
larry1810["BackgroundColor3"] =larry1830
larry1810["Text"] ="Auto Pick: ON"
end)
local larry1831 =task["spawn"]
local larry1832 =larry1831(function(...)
local _1833_vararg1, _1833_vararg2, _1833_vararg3, _1833_vararg4, _1833_vararg5, _1833_vararg6, _1833_vararg7, _1833_vararg8, _1833_vararg9, _1833_vararg10 = ...
local larry1834 =larry1802["Character"]
local larry1835 =larry1834["FindFirstChild"]
local larry1836 =larry1835(larry1834, "HumanoidRootPart")
local larry1837 =workspace["Map"]
local larry1838 =larry1837["Landmarks"]
local larry1839 =larry1838["GetChildren"]
local larry1840 =larry1839(larry1838)
for larry1841, _1841_2 in ipairs(larry1840) do
local larry1842 =_1841_2["Name"]
end
local _ =task.wait(0.1)
local larry1843 =larry1802["Character"]
local larry1844 =larry1843["FindFirstChild"]
local larry1845 =larry1844(larry1843, "HumanoidRootPart")
local larry1846 =workspace["Map"]
local larry1847 =larry1846["Landmarks"]
local larry1848 =larry1847["GetChildren"]
local larry1849 =larry1848(larry1847)
for larry1850, _1850_2 in ipairs(larry1849) do
local larry1851 =_1850_2["Name"]
end
local _ =task.wait(0.1)
local larry1852 =larry1802["Character"]
local larry1853 =larry1852["FindFirstChild"]
local larry1854 =larry1853(larry1852, "HumanoidRootPart")
local larry1855 =workspace["Map"]
local larry1856 =larry1855["Landmarks"]
local larry1857 =larry1856["GetChildren"]
local larry1858 =larry1857(larry1856)
for larry1859, _1859_2 in ipairs(larry1858) do
local larry1860 =_1859_2["Name"]
end
local _ =task.wait(0.1)
local larry1861 =larry1802["Character"]
local larry1862 =larry1861["FindFirstChild"]
local larry1863 =larry1862(larry1861, "HumanoidRootPart")
local larry1864 =workspace["Map"]
local larry1865 =larry1864["Landmarks"]
local larry1866 =larry1865["GetChildren"]
local larry1867 =larry1866(larry1865)
for larry1868, _1868_2 in ipairs(larry1867) do
local larry1869 =_1868_2["Name"]
end
local _ =task.wait(0.1)
local larry1870 =larry1802["Character"]
local larry1871 =larry1870["FindFirstChild"]
local larry1872 =larry1871(larry1870, "HumanoidRootPart")
local larry1873 =workspace["Map"]
local larry1874 =larry1873["Landmarks"]
local larry1875 =larry1874["GetChildren"]
local larry1876 =larry1875(larry1874)
for larry1877, _1877_2 in ipairs(larry1876) do
local larry1878 =_1877_2["Name"]
end
local _ =task.wait(0.1)
local larry1879 =larry1802["Character"]
local larry1880 =larry1879["FindFirstChild"]
local larry1881 =larry1880(larry1879, "HumanoidRootPart")
local larry1882 =workspace["Map"]
local larry1883 =larry1882["Landmarks"]
local larry1884 =larry1883["GetChildren"]
local larry1885 =larry1884(larry1883)
for larry1886, _1886_2 in ipairs(larry1885) do
local larry1887 =_1886_2["Name"]
end
local _ =task.wait(0.1)
local larry1888 =larry1802["Character"]
local larry1889 =larry1888["FindFirstChild"]
local larry1890 =larry1889(larry1888, "HumanoidRootPart")
local larry1891 =workspace["Map"]
local larry1892 =larry1891["Landmarks"]
local larry1893 =larry1892["GetChildren"]
local larry1894 =larry1893(larry1892)
for larry1895, _1895_2 in ipairs(larry1894) do
local larry1896 =_1895_2["Name"]
end
local _ =task.wait(0.1)
local larry1897 =larry1802["Character"]
local larry1898 =larry1897["FindFirstChild"]
local larry1899 =larry1898(larry1897, "HumanoidRootPart")
local larry1900 =workspace["Map"]
local larry1901 =larry1900["Landmarks"]
local larry1902 =larry1901["GetChildren"]
local larry1903 =larry1902(larry1901)
for larry1904, _1904_2 in ipairs(larry1903) do
local larry1905 =_1904_2["Name"]
end
local _ =task.wait(0.1)
local larry1906 =larry1802["Character"]
local larry1907 =larry1906["FindFirstChild"]
local larry1908 =larry1907(larry1906, "HumanoidRootPart")
local larry1909 =workspace["Map"]
local larry1910 =larry1909["Landmarks"]
local larry1911 =larry1910["GetChildren"]
local larry1912 =larry1911(larry1910)
for larry1913, _1913_2 in ipairs(larry1912) do
local larry1914 =_1913_2["Name"]
end
local _ =task.wait(0.1)
local larry1915 =larry1802["Character"]
local larry1916 =larry1915["FindFirstChild"]
local larry1917 =larry1916(larry1915, "HumanoidRootPart")
local larry1918 =workspace["Map"]
local larry1919 =larry1918["Landmarks"]
local larry1920 =larry1919["GetChildren"]
local larry1921 =larry1920(larry1919)
for larry1922, _1922_2 in ipairs(larry1921) do
local larry1923 =_1922_2["Name"]
end
local _ =task.wait(0.1)
local larry1924 =larry1802["Character"]
local larry1925 =larry1924["FindFirstChild"]
local larry1926 =larry1925(larry1924, "HumanoidRootPart")
local larry1927 =workspace["Map"]
local larry1928 =larry1927["Landmarks"]
local larry1929 =larry1928["GetChildren"]
local larry1930 =larry1929(larry1928)
for larry1931, _1931_2 in ipairs(larry1930) do
local larry1932 =_1931_2["Name"]
end
local _ =task.wait(0.1)
local larry1933 =larry1802["Character"]
local larry1934 =larry1933["FindFirstChild"]
local larry1935 =larry1934(larry1933, "HumanoidRootPart")
local larry1936 =workspace["Map"]
local larry1937 =larry1936["Landmarks"]
local larry1938 =larry1937["GetChildren"]
local larry1939 =larry1938(larry1937)
for larry1940, _1940_2 in ipairs(larry1939) do
local larry1941 =_1940_2["Name"]
end
local _ =task.wait(0.1)
local larry1942 =larry1802["Character"]
local larry1943 =larry1942["FindFirstChild"]
local larry1944 =larry1943(larry1942, "HumanoidRootPart")
local larry1945 =workspace["Map"]
local larry1946 =larry1945["Landmarks"]
local larry1947 =larry1946["GetChildren"]
local larry1948 =larry1947(larry1946)
for larry1949, _1949_2 in ipairs(larry1948) do
local larry1950 =_1949_2["Name"]
end
local _ =task.wait(0.1)
local larry1951 =larry1802["Character"]
local larry1952 =larry1951["FindFirstChild"]
local larry1953 =larry1952(larry1951, "HumanoidRootPart")
local larry1954 =workspace["Map"]
local larry1955 =larry1954["Landmarks"]
local larry1956 =larry1955["GetChildren"]
local larry1957 =larry1956(larry1955)
for larry1958, _1958_2 in ipairs(larry1957) do
local larry1959 =_1958_2["Name"]
end
local _ =task.wait(0.1)
local larry1960 =larry1802["Character"]
local larry1961 =larry1960["FindFirstChild"]
local larry1962 =larry1961(larry1960, "HumanoidRootPart")
local larry1963 =workspace["Map"]
local larry1964 =larry1963["Landmarks"]
local larry1965 =larry1964["GetChildren"]
local larry1966 =larry1965(larry1964)
for larry1967, _1967_2 in ipairs(larry1966) do
local larry1968 =_1967_2["Name"]
end
local _ =task.wait(0.1)
local larry1969 =larry1802["Character"]
local larry1970 =larry1969["FindFirstChild"]
local larry1971 =larry1970(larry1969, "HumanoidRootPart")
local larry1972 =workspace["Map"]
local larry1973 =larry1972["Landmarks"]
local larry1974 =larry1973["GetChildren"]
local larry1975 =larry1974(larry1973)
for larry1976, _1976_2 in ipairs(larry1975) do
local larry1977 =_1976_2["Name"]
end
local _ =task.wait(0.1)
local larry1978 =larry1802["Character"]
local larry1979 =larry1978["FindFirstChild"]
local larry1980 =larry1979(larry1978, "HumanoidRootPart")
local larry1981 =workspace["Map"]
local larry1982 =larry1981["Landmarks"]
local larry1983 =larry1982["GetChildren"]
local larry1984 =larry1983(larry1982)
for larry1985, _1985_2 in ipairs(larry1984) do
local larry1986 =_1985_2["Name"]
end
local _ =task.wait(0.1)
local larry1987 =larry1802["Character"]
local larry1988 =larry1987["FindFirstChild"]
local larry1989 =larry1988(larry1987, "HumanoidRootPart")
local larry1990 =workspace["Map"]
local larry1991 =larry1990["Landmarks"]
local larry1992 =larry1991["GetChildren"]
local larry1993 =larry1992(larry1991)
for larry1994, _1994_2 in ipairs(larry1993) do
local larry1995 =_1994_2["Name"]
end
local _ =task.wait(0.1)
local larry1996 =larry1802["Character"]
local larry1997 =larry1996["FindFirstChild"]
local larry1998 =larry1997(larry1996, "HumanoidRootPart")
local er =error("Luraph Script:1276: internal 542: <larry: infinitelooperror>")
end)
end,
  ["Default"] = false,
  ["Title"] = "Auto Pick Flowers",
})
local larry2000 =game["GetService"]
local larry2001 =larry2000(game, "Players")
local larry2002 =game["GetService"]
local larry2003 =larry2002(game, "ReplicatedStorage")
local larry2004 =game["GetService"]
local larry2005 =larry2004(game, "Workspace")
local larry2006 =larry2001["LocalPlayer"]
local larry2007 =larry2006["Character"]
local larry2008 =larry2001["LocalPlayer"]
local larry2009 =larry2008["Character"]
local larry2010 =larry2009["WaitForChild"]
local larry2011 =larry2010(larry2009, "HumanoidRootPart")
local larry2012 =larry2001["LocalPlayer"]
local larry2013 =larry2012["CharacterAdded"]
local larry2014 =larry2013["Connect"]
local larry2017 =_2016_vararg1["WaitForChild"]
local larry2018 =larry2017(_2016_vararg1, "HumanoidRootPart")
local larry2015 =larry2014(larry2013, function(...)
local _2016_vararg1, _2016_vararg2, _2016_vararg3, _2016_vararg4, _2016_vararg5, _2016_vararg6, _2016_vararg7, _2016_vararg8, _2016_vararg9, _2016_vararg10 = ...
local larry2017 =_2016_vararg1["WaitForChild"]
local larry2018 =larry2017(_2016_vararg1, "HumanoidRootPart")
end)
local larry2019 =larry2003["RemoteEvents"]
local larry2020 =larry2019["WaitForChild"]
local larry2021 =larry2020(larry2019, "RequestCollectCoints")
local larry2022 =larry1800["Toggle"]
local larry2023 =larry2022(larry1800, {
  ["Callback"] = function(...)
local _2024_vararg1, _2024_vararg2, _2024_vararg3, _2024_vararg4, _2024_vararg5, _2024_vararg6, _2024_vararg7, _2024_vararg8, _2024_vararg9, _2024_vararg10 = ...

end,
  ["Default"] = false,
  ["Title"] = "Auto Collect Coins",
})
local larry2025 =task["spawn"]
local _ =task.wait(0.2)
local larry2028 =larry2005["GetDescendants"]
local larry2029 =larry2028(larry2005)
local larry2031 =_2030_2["IsA"]
local larry2032 =larry2031(_2030_2, "Model")
local larry2033 =_2030_2["Name"]
local larry2034 =larry2033["find"]
local larry2035 =larry2034(larry2033, "Coin Stack")
local larry2036 =larry2021["InvokeServer"]
local larry2037 =larry2036(larry2021, _2030_2)
local _ =task.wait(0.2)
local larry2038 =larry2005["GetDescendants"]
local larry2039 =larry2038(larry2005)
local larry2041 =_2040_2["IsA"]
local larry2042 =larry2041(_2040_2, "Model")
local larry2043 =_2040_2["Name"]
local larry2044 =larry2043["find"]
local larry2045 =larry2044(larry2043, "Coin Stack")
local larry2046 =larry2021["InvokeServer"]
local larry2047 =larry2046(larry2021, _2040_2)
local _ =task.wait(0.2)
local larry2048 =larry2005["GetDescendants"]
local larry2049 =larry2048(larry2005)
local larry2051 =_2050_2["IsA"]
local larry2052 =larry2051(_2050_2, "Model")
local larry2053 =_2050_2["Name"]
local larry2054 =larry2053["find"]
local larry2055 =larry2054(larry2053, "Coin Stack")
local larry2056 =larry2021["InvokeServer"]
local larry2057 =larry2056(larry2021, _2050_2)
local _ =task.wait(0.2)
local larry2058 =larry2005["GetDescendants"]
local larry2059 =larry2058(larry2005)
local larry2061 =_2060_2["IsA"]
local larry2062 =larry2061(_2060_2, "Model")
local larry2063 =_2060_2["Name"]
local larry2064 =larry2063["find"]
local larry2065 =larry2064(larry2063, "Coin Stack")
local larry2066 =larry2021["InvokeServer"]
local larry2067 =larry2066(larry2021, _2060_2)
local _ =task.wait(0.2)
local larry2068 =larry2005["GetDescendants"]
local larry2069 =larry2068(larry2005)
local larry2071 =_2070_2["IsA"]
local larry2072 =larry2071(_2070_2, "Model")
local larry2073 =_2070_2["Name"]
local larry2074 =larry2073["find"]
local larry2075 =larry2074(larry2073, "Coin Stack")
local larry2076 =larry2021["InvokeServer"]
local larry2077 =larry2076(larry2021, _2070_2)
local _ =task.wait(0.2)
local larry2078 =larry2005["GetDescendants"]
local er =error("Luraph Script:1330: internal 542: <larry: infinitelooperror>")
local larry2026 =larry2025(function(...)
local _2027_vararg1, _2027_vararg2, _2027_vararg3, _2027_vararg4, _2027_vararg5, _2027_vararg6, _2027_vararg7, _2027_vararg8, _2027_vararg9, _2027_vararg10 = ...
local _ =task.wait(0.2)
local larry2028 =larry2005["GetDescendants"]
local larry2029 =larry2028(larry2005)
for larry2030, _2030_2 in ipairs(larry2029) do
local larry2031 =_2030_2["IsA"]
local larry2032 =larry2031(_2030_2, "Model")
local larry2033 =_2030_2["Name"]
local larry2034 =larry2033["find"]
local larry2035 =larry2034(larry2033, "Coin Stack")
local larry2036 =larry2021["InvokeServer"]
local larry2037 =larry2036(larry2021, _2030_2)
end
local _ =task.wait(0.2)
local larry2038 =larry2005["GetDescendants"]
local larry2039 =larry2038(larry2005)
for larry2040, _2040_2 in ipairs(larry2039) do
local larry2041 =_2040_2["IsA"]
local larry2042 =larry2041(_2040_2, "Model")
local larry2043 =_2040_2["Name"]
local larry2044 =larry2043["find"]
local larry2045 =larry2044(larry2043, "Coin Stack")
local larry2046 =larry2021["InvokeServer"]
local larry2047 =larry2046(larry2021, _2040_2)
end
local _ =task.wait(0.2)
local larry2048 =larry2005["GetDescendants"]
local larry2049 =larry2048(larry2005)
for larry2050, _2050_2 in ipairs(larry2049) do
local larry2051 =_2050_2["IsA"]
local larry2052 =larry2051(_2050_2, "Model")
local larry2053 =_2050_2["Name"]
local larry2054 =larry2053["find"]
local larry2055 =larry2054(larry2053, "Coin Stack")
local larry2056 =larry2021["InvokeServer"]
local larry2057 =larry2056(larry2021, _2050_2)
end
local _ =task.wait(0.2)
local larry2058 =larry2005["GetDescendants"]
local larry2059 =larry2058(larry2005)
for larry2060, _2060_2 in ipairs(larry2059) do
local larry2061 =_2060_2["IsA"]
local larry2062 =larry2061(_2060_2, "Model")
local larry2063 =_2060_2["Name"]
local larry2064 =larry2063["find"]
local larry2065 =larry2064(larry2063, "Coin Stack")
local larry2066 =larry2021["InvokeServer"]
local larry2067 =larry2066(larry2021, _2060_2)
end
local _ =task.wait(0.2)
local larry2068 =larry2005["GetDescendants"]
local larry2069 =larry2068(larry2005)
for larry2070, _2070_2 in ipairs(larry2069) do
local larry2071 =_2070_2["IsA"]
local larry2072 =larry2071(_2070_2, "Model")
local larry2073 =_2070_2["Name"]
local larry2074 =larry2073["find"]
local larry2075 =larry2074(larry2073, "Coin Stack")
local larry2076 =larry2021["InvokeServer"]
local larry2077 =larry2076(larry2021, _2070_2)
end
local _ =task.wait(0.2)
local er =error("Luraph Script:1330: internal 542: <larry: infinitelooperror>")
end)
local larry2079 =larry1800["Toggle"]
local larry2082 =task["spawn"]
local larry2085 =game["GetService"]
local larry2086 =larry2085(game, "ReplicatedStorage")
local larry2087 =game["GetService"]
local larry2088 =larry2087(game, "Workspace")
local larry2089 =game["GetService"]
local larry2090 =larry2089(game, "Players")
local larry2091 =larry2090["LocalPlayer"]
local larry2092 =larry2091["Character"]
local larry2093 =larry2091["Character"]
local larry2094 =larry2093["FindFirstChild"]
local larry2095 =larry2094(larry2093, "HumanoidRootPart")
local larry2096 =larry2091["CharacterAdded"]
local larry2097 =larry2096["Connect"]
local larry2100 =_2099_vararg1["WaitForChild"]
local larry2101 =larry2100(_2099_vararg1, "HumanoidRootPart")
local larry2098 =larry2097(larry2096, function(...)
local _2099_vararg1, _2099_vararg2, _2099_vararg3, _2099_vararg4, _2099_vararg5, _2099_vararg6, _2099_vararg7, _2099_vararg8, _2099_vararg9, _2099_vararg10 = ...
local larry2100 =_2099_vararg1["WaitForChild"]
local larry2101 =larry2100(_2099_vararg1, "HumanoidRootPart")
end)
local larry2102 =larry2086["WaitForChild"]
local larry2103 =larry2102(larry2086, "RemoteEvents")
local larry2104 =larry2103["WaitForChild"]
local larry2105 =larry2104(larry2103, "RequestPlantSeeds")
local _ =task.wait(0.5)
local larry2107 =larry2088["GetDescendants"]
local larry2108 =larry2107(larry2088)
local larry2110 =_2109_2["IsA"]
local larry2111 =larry2110(_2109_2, "Model")
local larry2112 =_2109_2["Name"]
local larry2113 =larry2112["find"]
local larry2114 =larry2113(larry2112, "Seed Box")
local larry2115 =larry2105["InvokeServer"]
local larry2116 =larry2115(larry2105, _2109_2)
local _ =task.wait(0.5)
local larry2118 =larry2088["GetDescendants"]
local larry2119 =larry2118(larry2088)
local larry2121 =_2120_2["IsA"]
local larry2122 =larry2121(_2120_2, "Model")
local larry2123 =_2120_2["Name"]
local larry2124 =larry2123["find"]
local larry2125 =larry2124(larry2123, "Seed Box")
local larry2126 =larry2105["InvokeServer"]
local larry2127 =larry2126(larry2105, _2120_2)
local _ =task.wait(0.5)
local larry2129 =larry2088["GetDescendants"]
local larry2130 =larry2129(larry2088)
local larry2132 =_2131_2["IsA"]
local larry2133 =larry2132(_2131_2, "Model")
local larry2134 =_2131_2["Name"]
local larry2135 =larry2134["find"]
local larry2136 =larry2135(larry2134, "Seed Box")
local larry2137 =larry2105["InvokeServer"]
local larry2138 =larry2137(larry2105, _2131_2)
local _ =task.wait(0.5)
local larry2140 =larry2088["GetDescendants"]
local larry2141 =larry2140(larry2088)
local larry2143 =_2142_2["IsA"]
local er =error("Luraph Script:1360: internal 542: <larry: infinitelooperror>")
local larry2083 =larry2082(function(...)
local _2084_vararg1, _2084_vararg2, _2084_vararg3, _2084_vararg4, _2084_vararg5, _2084_vararg6, _2084_vararg7, _2084_vararg8, _2084_vararg9, _2084_vararg10 = ...
local larry2085 =game["GetService"]
local larry2086 =larry2085(game, "ReplicatedStorage")
local larry2087 =game["GetService"]
local larry2088 =larry2087(game, "Workspace")
local larry2089 =game["GetService"]
local larry2090 =larry2089(game, "Players")
local larry2091 =larry2090["LocalPlayer"]
local larry2092 =larry2091["Character"]
local larry2093 =larry2091["Character"]
local larry2094 =larry2093["FindFirstChild"]
local larry2095 =larry2094(larry2093, "HumanoidRootPart")
local larry2096 =larry2091["CharacterAdded"]
local larry2097 =larry2096["Connect"]
local larry2098 =larry2097(larry2096, function(...)
local _2099_vararg1, _2099_vararg2, _2099_vararg3, _2099_vararg4, _2099_vararg5, _2099_vararg6, _2099_vararg7, _2099_vararg8, _2099_vararg9, _2099_vararg10 = ...
local larry2100 =_2099_vararg1["WaitForChild"]
local larry2101 =larry2100(_2099_vararg1, "HumanoidRootPart")
end)
local larry2102 =larry2086["WaitForChild"]
local larry2103 =larry2102(larry2086, "RemoteEvents")
local larry2104 =larry2103["WaitForChild"]
local larry2105 =larry2104(larry2103, "RequestPlantSeeds")
local larry2106 =genv["autoOpenSeeds"]
local _ =task.wait(0.5)
local larry2107 =larry2088["GetDescendants"]
local larry2108 =larry2107(larry2088)
for larry2109, _2109_2 in ipairs(larry2108) do
local larry2110 =_2109_2["IsA"]
local larry2111 =larry2110(_2109_2, "Model")
local larry2112 =_2109_2["Name"]
local larry2113 =larry2112["find"]
local larry2114 =larry2113(larry2112, "Seed Box")
local larry2115 =larry2105["InvokeServer"]
local larry2116 =larry2115(larry2105, _2109_2)
end
local larry2117 =genv["autoOpenSeeds"]
local _ =task.wait(0.5)
local larry2118 =larry2088["GetDescendants"]
local larry2119 =larry2118(larry2088)
for larry2120, _2120_2 in ipairs(larry2119) do
local larry2121 =_2120_2["IsA"]
local larry2122 =larry2121(_2120_2, "Model")
local larry2123 =_2120_2["Name"]
local larry2124 =larry2123["find"]
local larry2125 =larry2124(larry2123, "Seed Box")
local larry2126 =larry2105["InvokeServer"]
local larry2127 =larry2126(larry2105, _2120_2)
end
local larry2128 =genv["autoOpenSeeds"]
local _ =task.wait(0.5)
local larry2129 =larry2088["GetDescendants"]
local larry2130 =larry2129(larry2088)
for larry2131, _2131_2 in ipairs(larry2130) do
local larry2132 =_2131_2["IsA"]
local larry2133 =larry2132(_2131_2, "Model")
local larry2134 =_2131_2["Name"]
local larry2135 =larry2134["find"]
local larry2136 =larry2135(larry2134, "Seed Box")
local larry2137 =larry2105["InvokeServer"]
local larry2138 =larry2137(larry2105, _2131_2)
end
local larry2139 =genv["autoOpenSeeds"]
local _ =task.wait(0.5)
local larry2140 =larry2088["GetDescendants"]
local larry2141 =larry2140(larry2088)
for larry2142, _2142_2 in ipairs(larry2141) do
local er =error("Luraph Script:1360: internal 542: <larry: infinitelooperror>")
end
end)
local larry2080 =larry2079(larry1800, {
  ["Callback"] = function(...)
local _2081_vararg1, _2081_vararg2, _2081_vararg3, _2081_vararg4, _2081_vararg5, _2081_vararg6, _2081_vararg7, _2081_vararg8, _2081_vararg9, _2081_vararg10 = ...
genv["autoOpenSeeds"]=_2081_vararg1
local larry2082 =task["spawn"]
local larry2083 =larry2082(function(...)
local _2084_vararg1, _2084_vararg2, _2084_vararg3, _2084_vararg4, _2084_vararg5, _2084_vararg6, _2084_vararg7, _2084_vararg8, _2084_vararg9, _2084_vararg10 = ...
local larry2085 =game["GetService"]
local larry2086 =larry2085(game, "ReplicatedStorage")
local larry2087 =game["GetService"]
local larry2088 =larry2087(game, "Workspace")
local larry2089 =game["GetService"]
local larry2090 =larry2089(game, "Players")
local larry2091 =larry2090["LocalPlayer"]
local larry2092 =larry2091["Character"]
local larry2093 =larry2091["Character"]
local larry2094 =larry2093["FindFirstChild"]
local larry2095 =larry2094(larry2093, "HumanoidRootPart")
local larry2096 =larry2091["CharacterAdded"]
local larry2097 =larry2096["Connect"]
local larry2098 =larry2097(larry2096, function(...)
local _2099_vararg1, _2099_vararg2, _2099_vararg3, _2099_vararg4, _2099_vararg5, _2099_vararg6, _2099_vararg7, _2099_vararg8, _2099_vararg9, _2099_vararg10 = ...
local larry2100 =_2099_vararg1["WaitForChild"]
local larry2101 =larry2100(_2099_vararg1, "HumanoidRootPart")
end)
local larry2102 =larry2086["WaitForChild"]
local larry2103 =larry2102(larry2086, "RemoteEvents")
local larry2104 =larry2103["WaitForChild"]
local larry2105 =larry2104(larry2103, "RequestPlantSeeds")
local larry2106 =genv["autoOpenSeeds"]
local _ =task.wait(0.5)
local larry2107 =larry2088["GetDescendants"]
local larry2108 =larry2107(larry2088)
for larry2109, _2109_2 in ipairs(larry2108) do
local larry2110 =_2109_2["IsA"]
local larry2111 =larry2110(_2109_2, "Model")
local larry2112 =_2109_2["Name"]
local larry2113 =larry2112["find"]
local larry2114 =larry2113(larry2112, "Seed Box")
local larry2115 =larry2105["InvokeServer"]
local larry2116 =larry2115(larry2105, _2109_2)
end
local larry2117 =genv["autoOpenSeeds"]
local _ =task.wait(0.5)
local larry2118 =larry2088["GetDescendants"]
local larry2119 =larry2118(larry2088)
for larry2120, _2120_2 in ipairs(larry2119) do
local larry2121 =_2120_2["IsA"]
local larry2122 =larry2121(_2120_2, "Model")
local larry2123 =_2120_2["Name"]
local larry2124 =larry2123["find"]
local larry2125 =larry2124(larry2123, "Seed Box")
local larry2126 =larry2105["InvokeServer"]
local larry2127 =larry2126(larry2105, _2120_2)
end
local larry2128 =genv["autoOpenSeeds"]
local _ =task.wait(0.5)
local larry2129 =larry2088["GetDescendants"]
local larry2130 =larry2129(larry2088)
for larry2131, _2131_2 in ipairs(larry2130) do
local larry2132 =_2131_2["IsA"]
local larry2133 =larry2132(_2131_2, "Model")
local larry2134 =_2131_2["Name"]
local larry2135 =larry2134["find"]
local larry2136 =larry2135(larry2134, "Seed Box")
local larry2137 =larry2105["InvokeServer"]
local larry2138 =larry2137(larry2105, _2131_2)
end
local larry2139 =genv["autoOpenSeeds"]
local _ =task.wait(0.5)
local larry2140 =larry2088["GetDescendants"]
local larry2141 =larry2140(larry2088)
for larry2142, _2142_2 in ipairs(larry2141) do
local er =error("Luraph Script:1360: internal 542: <larry: infinitelooperror>")
end
end)
genv["autoOpenSeedsThread"]=larry2083
end,
  ["Default"] = false,
  ["Title"] = "Auto Open Seed Box",
})
local larry2144 =workspace["WaitForChild"]
local larry2145 =larry2144(workspace, "Items")
local larry2146 =larry2003["WaitForChild"]
local larry2147 =larry2146(larry2003, "RemoteEvents")
local larry2148 =larry2147["WaitForChild"]
local larry2149 =larry2148(larry2147, "RequestStartDraggingItem")
local larry2150 =larry2003["WaitForChild"]
local larry2151 =larry2150(larry2003, "RemoteEvents")
local larry2152 =larry2151["WaitForChild"]
local larry2153 =larry2152(larry2151, "StopDraggingItem")
local larry2154 =larry2001["LocalPlayer"]
local larry2155 =larry2154["Character"]
local larry2156 =larry2154["Character"]
local larry2157 =larry2156["FindFirstChild"]
local larry2158 =larry2157(larry2156, "HumanoidRootPart")
local larry2159 =larry1800["Dropdown"]
local larry2160 =larry2159(larry1800, {
  ["Title"] = "Select Items",
  ["AllowNone"] = true,
  ["Value"] = {
  [1] = "Carrot",
},
  ["Multi"] = true,
  ["Callback"] = function(...)
local _2161_vararg1, _2161_vararg2, _2161_vararg3, _2161_vararg4, _2161_vararg5, _2161_vararg6, _2161_vararg7, _2161_vararg8, _2161_vararg9, _2161_vararg10 = ...

end,
  ["Values"] = {
  [1] = "Carrot",
  [2] = "Apple",
  [3] = "Morsel",
  [4] = "Cooked Morsel",
  [5] = "Steak",
  [6] = "Cooked Steak",
},
})
local larry2162 =larry1800["Toggle"]
local larry2165 =task["spawn"]
local larry2168 =larry2145["GetChildren"]
local larry2169 =larry2168(larry2145)
local larry2171 =larry2169[1]
local larry2172 =larry2171["Name"]
local larry2173, _2173_2, _2173_3 =table.find(_2161_vararg1, larry2172)
local larry2174 =larry2169[2]
local larry2175 =larry2174["Name"]
local larry2176, _2176_2, _2176_3 =table.find(_2161_vararg1, larry2175)
local larry2177 =larry2169[3]
local larry2178 =larry2177["Name"]
local larry2179, _2179_2, _2179_3 =table.find(_2161_vararg1, larry2178)
local larry2180 =larry2169[4]
local larry2181 =larry2180["Name"]
local larry2182, _2182_2, _2182_3 =table.find(_2161_vararg1, larry2181)
local larry2183 =larry2169[5]
local larry2184 =larry2183["Name"]
local larry2185, _2185_2, _2185_3 =table.find(_2161_vararg1, larry2184)
local larry2186 =larry2169[6]
local larry2187 =larry2186["Name"]
local larry2188, _2188_2, _2188_3 =table.find(_2161_vararg1, larry2187)
local larry2189 =larry2169[7]
local larry2190 =larry2189["Name"]
local larry2191, _2191_2, _2191_3 =table.find(_2161_vararg1, larry2190)
local larry2192 =larry2169[8]
local larry2193 =larry2192["Name"]
local larry2194, _2194_2, _2194_3 =table.find(_2161_vararg1, larry2193)
local larry2195 =larry2169[9]
local larry2196 =larry2195["Name"]
local larry2197, _2197_2, _2197_3 =table.find(_2161_vararg1, larry2196)
local larry2198 =larry2169[10]
local larry2199 =larry2198["Name"]
local larry2200, _2200_2, _2200_3 =table.find(_2161_vararg1, larry2199)
local larry2201 =larry2169[11]
local larry2202 =larry2201["Name"]
local larry2203, _2203_2, _2203_3 =table.find(_2161_vararg1, larry2202)
local larry2204 =larry2169[12]
local larry2205 =larry2204["Name"]
local larry2206, _2206_2, _2206_3 =table.find(_2161_vararg1, larry2205)
local larry2207 =larry2169[13]
local larry2208 =larry2207["Name"]
local larry2209, _2209_2, _2209_3 =table.find(_2161_vararg1, larry2208)
local larry2210 =larry2169[14]
local larry2211 =larry2210["Name"]
local larry2212, _2212_2, _2212_3 =table.find(_2161_vararg1, larry2211)
local larry2213 =larry2169[15]
local larry2214 =larry2213["Name"]
local larry2215, _2215_2, _2215_3 =table.find(_2161_vararg1, larry2214)
local larry2216 =larry2169[16]
local larry2217 =larry2216["Name"]
local larry2218, _2218_2, _2218_3 =table.find(_2161_vararg1, larry2217)
local larry2219 =larry2169[17]
local larry2220 =larry2219["Name"]
local larry2221, _2221_2, _2221_3 =table.find(_2161_vararg1, larry2220)
local larry2222 =larry2169[18]
local larry2223 =larry2222["Name"]
local larry2224, _2224_2, _2224_3 =table.find(_2161_vararg1, larry2223)
local larry2225 =larry2169[19]
local larry2226 =larry2225["Name"]
local larry2227, _2227_2, _2227_3 =table.find(_2161_vararg1, larry2226)
local larry2228 =larry2169[20]
local larry2229 =larry2228["Name"]
local larry2230, _2230_2, _2230_3 =table.find(_2161_vararg1, larry2229)
local larry2231 =larry2169[21]
local larry2232 =larry2231["Name"]
local larry2233, _2233_2, _2233_3 =table.find(_2161_vararg1, larry2232)
local larry2234 =larry2169[22]
local larry2235 =larry2234["Name"]
local larry2236, _2236_2, _2236_3 =table.find(_2161_vararg1, larry2235)
local larry2237 =larry2169[23]
local larry2238 =larry2237["Name"]
local larry2239, _2239_2, _2239_3 =table.find(_2161_vararg1, larry2238)
local larry2240 =larry2169[24]
local larry2241 =larry2240["Name"]
local larry2242, _2242_2, _2242_3 =table.find(_2161_vararg1, larry2241)
local larry2243 =larry2169[25]
local larry2244 =larry2243["Name"]
local larry2245, _2245_2, _2245_3 =table.find(_2161_vararg1, larry2244)
local larry2246 =larry2169[26]
local larry2247 =larry2246["Name"]
local larry2248, _2248_2, _2248_3 =table.find(_2161_vararg1, larry2247)
local larry2249 =larry2169[27]
local larry2250 =larry2249["Name"]
local larry2251, _2251_2, _2251_3 =table.find(_2161_vararg1, larry2250)
local larry2252 =larry2169[28]
local larry2253 =larry2252["Name"]
local larry2254, _2254_2, _2254_3 =table.find(_2161_vararg1, larry2253)
local larry2255 =larry2169[29]
local larry2256 =larry2255["Name"]
local larry2257, _2257_2, _2257_3 =table.find(_2161_vararg1, larry2256)
local larry2258 =larry2169[30]
local larry2259 =larry2258["Name"]
local larry2260, _2260_2, _2260_3 =table.find(_2161_vararg1, larry2259)
local larry2261 =larry2169[31]
local larry2262 =larry2261["Name"]
local larry2263, _2263_2, _2263_3 =table.find(_2161_vararg1, larry2262)
local larry2264 =larry2169[32]
local larry2265 =larry2264["Name"]
local larry2266, _2266_2, _2266_3 =table.find(_2161_vararg1, larry2265)
local larry2267 =larry2169[33]
local larry2268 =larry2267["Name"]
local larry2269, _2269_2, _2269_3 =table.find(_2161_vararg1, larry2268)
local larry2270 =larry2169[34]
local larry2271 =larry2270["Name"]
local larry2272, _2272_2, _2272_3 =table.find(_2161_vararg1, larry2271)
local larry2273 =larry2169[35]
local larry2274 =larry2273["Name"]
local larry2275, _2275_2, _2275_3 =table.find(_2161_vararg1, larry2274)
local larry2276 =larry2169[36]
local larry2277 =larry2276["Name"]
local larry2278, _2278_2, _2278_3 =table.find(_2161_vararg1, larry2277)
local larry2279 =larry2169[37]
local larry2280 =larry2279["Name"]
local larry2281, _2281_2, _2281_3 =table.find(_2161_vararg1, larry2280)
local larry2282 =larry2169[38]
local larry2283 =larry2282["Name"]
local larry2284, _2284_2, _2284_3 =table.find(_2161_vararg1, larry2283)
local larry2285 =larry2169[39]
local larry2286 =larry2285["Name"]
local larry2287, _2287_2, _2287_3 =table.find(_2161_vararg1, larry2286)
local larry2288 =larry2169[40]
local larry2289 =larry2288["Name"]
local larry2290, _2290_2, _2290_3 =table.find(_2161_vararg1, larry2289)
local larry2291 =larry2169[41]
local larry2292 =larry2291["Name"]
local larry2293, _2293_2, _2293_3 =table.find(_2161_vararg1, larry2292)
local larry2294 =larry2169[42]
local larry2295 =larry2294["Name"]
local larry2296, _2296_2, _2296_3 =table.find(_2161_vararg1, larry2295)
local larry2297 =larry2169[43]
local larry2298 =larry2297["Name"]
local larry2299, _2299_2, _2299_3 =table.find(_2161_vararg1, larry2298)
local larry2300 =larry2169[44]
local larry2301 =larry2300["Name"]
local larry2302, _2302_2, _2302_3 =table.find(_2161_vararg1, larry2301)
local larry2303 =larry2169[45]
local larry2304 =larry2303["Name"]
local larry2305, _2305_2, _2305_3 =table.find(_2161_vararg1, larry2304)
local larry2306 =larry2169[46]
local larry2307 =larry2306["Name"]
local larry2308, _2308_2, _2308_3 =table.find(_2161_vararg1, larry2307)
local larry2309 =larry2169[47]
local larry2310 =larry2309["Name"]
local larry2311, _2311_2, _2311_3 =table.find(_2161_vararg1, larry2310)
local larry2312 =larry2169[48]
local larry2313 =larry2312["Name"]
local larry2314, _2314_2, _2314_3 =table.find(_2161_vararg1, larry2313)
local larry2315 =larry2169[49]
local larry2316 =larry2315["Name"]
local larry2317, _2317_2, _2317_3 =table.find(_2161_vararg1, larry2316)
local larry2318 =larry2169[50]
local larry2319 =larry2318["Name"]
local larry2320, _2320_2, _2320_3 =table.find(_2161_vararg1, larry2319)
local larry2321 =larry2169[51]
local larry2322 =larry2321["Name"]
local larry2323, _2323_2, _2323_3 =table.find(_2161_vararg1, larry2322)
local larry2324 =larry2169[52]
local larry2325 =larry2324["Name"]
local larry2326, _2326_2, _2326_3 =table.find(_2161_vararg1, larry2325)
local larry2327 =larry2169[53]
local larry2328 =larry2327["Name"]
local larry2329, _2329_2, _2329_3 =table.find(_2161_vararg1, larry2328)
local larry2330 =larry2169[54]
local larry2331 =larry2330["Name"]
local larry2332, _2332_2, _2332_3 =table.find(_2161_vararg1, larry2331)
local larry2333 =larry2169[55]
local larry2334 =larry2333["Name"]
local larry2335, _2335_2, _2335_3 =table.find(_2161_vararg1, larry2334)
local larry2336 =larry2169[56]
local larry2337 =larry2336["Name"]
local larry2338, _2338_2, _2338_3 =table.find(_2161_vararg1, larry2337)
local larry2339 =larry2169[57]
local larry2340 =larry2339["Name"]
local larry2341, _2341_2, _2341_3 =table.find(_2161_vararg1, larry2340)
local larry2342 =larry2169[58]
local larry2343 =larry2342["Name"]
local larry2344, _2344_2, _2344_3 =table.find(_2161_vararg1, larry2343)
local larry2345 =larry2169[59]
local larry2346 =larry2345["Name"]
local larry2347, _2347_2, _2347_3 =table.find(_2161_vararg1, larry2346)
local larry2348 =larry2169[60]
local larry2349 =larry2348["Name"]
local larry2350, _2350_2, _2350_3 =table.find(_2161_vararg1, larry2349)
local larry2351 =larry2169[61]
local larry2352 =larry2351["Name"]
local larry2353, _2353_2, _2353_3 =table.find(_2161_vararg1, larry2352)
local larry2354 =larry2169[62]
local larry2355 =larry2354["Name"]
local larry2356, _2356_2, _2356_3 =table.find(_2161_vararg1, larry2355)
local larry2357 =larry2169[63]
local larry2358 =larry2357["Name"]
local larry2359, _2359_2, _2359_3 =table.find(_2161_vararg1, larry2358)
local larry2360 =larry2169[64]
local larry2361 =larry2360["Name"]
local larry2362, _2362_2, _2362_3 =table.find(_2161_vararg1, larry2361)
local larry2363 =larry2169[65]
local larry2364 =larry2363["Name"]
local larry2365, _2365_2, _2365_3 =table.find(_2161_vararg1, larry2364)
local larry2366 =larry2169[66]
local larry2367 =larry2366["Name"]
local larry2368, _2368_2, _2368_3 =table.find(_2161_vararg1, larry2367)
local larry2369 =larry2169[67]
local larry2370 =larry2369["Name"]
local larry2371, _2371_2, _2371_3 =table.find(_2161_vararg1, larry2370)
local larry2372 =larry2169[68]
local larry2373 =larry2372["Name"]
local larry2374, _2374_2, _2374_3 =table.find(_2161_vararg1, larry2373)
local larry2375 =larry2169[69]
local larry2376 =larry2375["Name"]
local larry2377, _2377_2, _2377_3 =table.find(_2161_vararg1, larry2376)
local larry2378 =larry2169[70]
local larry2379 =larry2378["Name"]
local larry2380, _2380_2, _2380_3 =table.find(_2161_vararg1, larry2379)
local larry2381 =larry2169[71]
local larry2382 =larry2381["Name"]
local larry2383, _2383_2, _2383_3 =table.find(_2161_vararg1, larry2382)
local larry2384 =larry2169[72]
local larry2385 =larry2384["Name"]
local larry2386, _2386_2, _2386_3 =table.find(_2161_vararg1, larry2385)
local larry2387 =larry2169[73]
local larry2388 =larry2387["Name"]
local larry2389, _2389_2, _2389_3 =table.find(_2161_vararg1, larry2388)
local larry2390 =larry2169[74]
local larry2391 =larry2390["Name"]
local larry2392, _2392_2, _2392_3 =table.find(_2161_vararg1, larry2391)
local larry2393 =larry2169[75]
local larry2394 =larry2393["Name"]
local larry2395, _2395_2, _2395_3 =table.find(_2161_vararg1, larry2394)
local larry2396 =larry2169[76]
local larry2397 =larry2396["Name"]
local larry2398, _2398_2, _2398_3 =table.find(_2161_vararg1, larry2397)
local larry2399 =larry2169[77]
local larry2400 =larry2399["Name"]
local larry2401, _2401_2, _2401_3 =table.find(_2161_vararg1, larry2400)
local larry2402 =larry2169[78]
local larry2403 =larry2402["Name"]
local larry2404, _2404_2, _2404_3 =table.find(_2161_vararg1, larry2403)
local larry2405 =larry2169[79]
local larry2406 =larry2405["Name"]
local larry2407, _2407_2, _2407_3 =table.find(_2161_vararg1, larry2406)
local larry2408 =larry2169[80]
local larry2409 =larry2408["Name"]
local larry2410, _2410_2, _2410_3 =table.find(_2161_vararg1, larry2409)
local larry2411 =larry2169[81]
local larry2412 =larry2411["Name"]
local larry2413, _2413_2, _2413_3 =table.find(_2161_vararg1, larry2412)
local larry2414 =larry2169[82]
local larry2415 =larry2414["Name"]
local larry2416, _2416_2, _2416_3 =table.find(_2161_vararg1, larry2415)
local larry2417 =larry2169[83]
local larry2418 =larry2417["Name"]
local larry2419, _2419_2, _2419_3 =table.find(_2161_vararg1, larry2418)
local larry2420 =larry2169[84]
local larry2421 =larry2420["Name"]
local larry2422, _2422_2, _2422_3 =table.find(_2161_vararg1, larry2421)
local larry2423 =larry2169[85]
local larry2424 =larry2423["Name"]
local larry2425, _2425_2, _2425_3 =table.find(_2161_vararg1, larry2424)
local larry2426 =larry2169[86]
local larry2427 =larry2426["Name"]
local larry2428, _2428_2, _2428_3 =table.find(_2161_vararg1, larry2427)
local larry2429 =larry2169[87]
local larry2430 =larry2429["Name"]
local larry2431, _2431_2, _2431_3 =table.find(_2161_vararg1, larry2430)
local larry2432 =larry2169[88]
local larry2433 =larry2432["Name"]
local larry2434, _2434_2, _2434_3 =table.find(_2161_vararg1, larry2433)
local larry2435 =larry2169[89]
local larry2436 =larry2435["Name"]
local larry2437, _2437_2, _2437_3 =table.find(_2161_vararg1, larry2436)
local larry2438 =larry2169[90]
local larry2439 =larry2438["Name"]
local larry2440, _2440_2, _2440_3 =table.find(_2161_vararg1, larry2439)
local larry2441 =larry2169[91]
local larry2442 =larry2441["Name"]
local larry2443, _2443_2, _2443_3 =table.find(_2161_vararg1, larry2442)
local larry2444 =larry2169[92]
local larry2445 =larry2444["Name"]
local larry2446, _2446_2, _2446_3 =table.find(_2161_vararg1, larry2445)
local larry2447 =larry2169[93]
local larry2448 =larry2447["Name"]
local larry2449, _2449_2, _2449_3 =table.find(_2161_vararg1, larry2448)
local larry2450 =larry2169[94]
local larry2451 =larry2450["Name"]
local larry2452, _2452_2, _2452_3 =table.find(_2161_vararg1, larry2451)
local larry2453 =larry2169[95]
local larry2454 =larry2453["Name"]
local larry2455, _2455_2, _2455_3 =table.find(_2161_vararg1, larry2454)
local larry2456 =larry2169[96]
local larry2457 =larry2456["Name"]
local larry2458, _2458_2, _2458_3 =table.find(_2161_vararg1, larry2457)
local larry2459 =larry2169[97]
local larry2460 =larry2459["Name"]
local larry2461, _2461_2, _2461_3 =table.find(_2161_vararg1, larry2460)
local larry2462 =larry2169[98]
local larry2463 =larry2462["Name"]
local larry2464, _2464_2, _2464_3 =table.find(_2161_vararg1, larry2463)
local larry2465 =larry2169[99]
local larry2466 =larry2465["Name"]
local larry2467, _2467_2, _2467_3 =table.find(_2161_vararg1, larry2466)
local larry2468 =larry2169[100]
local larry2469 =larry2468["Name"]
local larry2470, _2470_2, _2470_3 =table.find(_2161_vararg1, larry2469)
local larry2471 =larry2169[101]
local larry2472 =larry2471["Name"]
local larry2473, _2473_2, _2473_3 =table.find(_2161_vararg1, larry2472)
local larry2474 =larry2169[102]
local larry2475 =larry2474["Name"]
local larry2476, _2476_2, _2476_3 =table.find(_2161_vararg1, larry2475)
local larry2477 =larry2169[103]
local larry2478 =larry2477["Name"]
local larry2479, _2479_2, _2479_3 =table.find(_2161_vararg1, larry2478)
local larry2480 =larry2169[104]
local larry2481 =larry2480["Name"]
local larry2482, _2482_2, _2482_3 =table.find(_2161_vararg1, larry2481)
local larry2483 =larry2169[105]
local larry2484 =larry2483["Name"]
local larry2485, _2485_2, _2485_3 =table.find(_2161_vararg1, larry2484)
local larry2486 =larry2169[106]
local larry2487 =larry2486["Name"]
local larry2488, _2488_2, _2488_3 =table.find(_2161_vararg1, larry2487)
local larry2489 =larry2169[107]
local larry2490 =larry2489["Name"]
local larry2491, _2491_2, _2491_3 =table.find(_2161_vararg1, larry2490)
local larry2492 =larry2169[108]
local larry2493 =larry2492["Name"]
local larry2494, _2494_2, _2494_3 =table.find(_2161_vararg1, larry2493)
local larry2495 =larry2169[109]
local larry2496 =larry2495["Name"]
local larry2497, _2497_2, _2497_3 =table.find(_2161_vararg1, larry2496)
local larry2498 =larry2169[110]
local larry2499 =larry2498["Name"]
local larry2500, _2500_2, _2500_3 =table.find(_2161_vararg1, larry2499)
local larry2501 =larry2169[111]
local larry2502 =larry2501["Name"]
local larry2503, _2503_2, _2503_3 =table.find(_2161_vararg1, larry2502)
local larry2504 =larry2169[112]
local larry2505 =larry2504["Name"]
local larry2506, _2506_2, _2506_3 =table.find(_2161_vararg1, larry2505)
local larry2507 =larry2169[113]
local larry2508 =larry2507["Name"]
local larry2509, _2509_2, _2509_3 =table.find(_2161_vararg1, larry2508)
local larry2510 =larry2169[114]
local larry2511 =larry2510["Name"]
local larry2512, _2512_2, _2512_3 =table.find(_2161_vararg1, larry2511)
local larry2513 =larry2169[115]
local larry2514 =larry2513["Name"]
local larry2515, _2515_2, _2515_3 =table.find(_2161_vararg1, larry2514)
local larry2516 =larry2169[116]
local larry2517 =larry2516["Name"]
local larry2518, _2518_2, _2518_3 =table.find(_2161_vararg1, larry2517)
local larry2519 =larry2169[117]
local larry2520 =larry2519["Name"]
local larry2521, _2521_2, _2521_3 =table.find(_2161_vararg1, larry2520)
local larry2522 =larry2169[118]
local larry2523 =larry2522["Name"]
local larry2524, _2524_2, _2524_3 =table.find(_2161_vararg1, larry2523)
local larry2525 =larry2169[119]
local larry2526 =larry2525["Name"]
local larry2527, _2527_2, _2527_3 =table.find(_2161_vararg1, larry2526)
local larry2528 =larry2169[120]
local larry2529 =larry2528["Name"]
local larry2530, _2530_2, _2530_3 =table.find(_2161_vararg1, larry2529)
local larry2531 =larry2169[121]
local larry2532 =larry2531["Name"]
local larry2533, _2533_2, _2533_3 =table.find(_2161_vararg1, larry2532)
local larry2534 =larry2169[122]
local larry2535 =larry2534["Name"]
local larry2536, _2536_2, _2536_3 =table.find(_2161_vararg1, larry2535)
local larry2537 =larry2169[123]
local larry2538 =larry2537["Name"]
local larry2539, _2539_2, _2539_3 =table.find(_2161_vararg1, larry2538)
local larry2540 =larry2169[124]
local larry2541 =larry2540["Name"]
local larry2542, _2542_2, _2542_3 =table.find(_2161_vararg1, larry2541)
local larry2543 =larry2169[125]
local larry2544 =larry2543["Name"]
local larry2545, _2545_2, _2545_3 =table.find(_2161_vararg1, larry2544)
local larry2546 =larry2169[126]
local larry2547 =larry2546["Name"]
local larry2548, _2548_2, _2548_3 =table.find(_2161_vararg1, larry2547)
local larry2549 =larry2169[127]
local larry2550 =larry2549["Name"]
local larry2551, _2551_2, _2551_3 =table.find(_2161_vararg1, larry2550)
local larry2552 =larry2169[128]
local larry2553 =larry2552["Name"]
local larry2554, _2554_2, _2554_3 =table.find(_2161_vararg1, larry2553)
local larry2555 =larry2169[129]
local larry2556 =larry2555["Name"]
local larry2557, _2557_2, _2557_3 =table.find(_2161_vararg1, larry2556)
local larry2558 =larry2169[130]
local larry2559 =larry2558["Name"]
local larry2560, _2560_2, _2560_3 =table.find(_2161_vararg1, larry2559)
local larry2561 =larry2169[131]
local larry2562 =larry2561["Name"]
local larry2563, _2563_2, _2563_3 =table.find(_2161_vararg1, larry2562)
local larry2564 =larry2169[132]
local larry2565 =larry2564["Name"]
local larry2566, _2566_2, _2566_3 =table.find(_2161_vararg1, larry2565)
local larry2567 =larry2169[133]
local larry2568 =larry2567["Name"]
local larry2569, _2569_2, _2569_3 =table.find(_2161_vararg1, larry2568)
local larry2570 =larry2169[134]
local larry2571 =larry2570["Name"]
local larry2572, _2572_2, _2572_3 =table.find(_2161_vararg1, larry2571)
local larry2573 =larry2169[135]
local larry2574 =larry2573["Name"]
local larry2575, _2575_2, _2575_3 =table.find(_2161_vararg1, larry2574)
local larry2576 =larry2169[136]
local larry2577 =larry2576["Name"]
local larry2578, _2578_2, _2578_3 =table.find(_2161_vararg1, larry2577)
local larry2579 =larry2169[137]
local larry2580 =larry2579["Name"]
local larry2581, _2581_2, _2581_3 =table.find(_2161_vararg1, larry2580)
local larry2582 =larry2169[138]
local larry2583 =larry2582["Name"]
local larry2584, _2584_2, _2584_3 =table.find(_2161_vararg1, larry2583)
local larry2585 =larry2169[139]
local larry2586 =larry2585["Name"]
local larry2587, _2587_2, _2587_3 =table.find(_2161_vararg1, larry2586)
local larry2588 =larry2169[140]
local larry2589 =larry2588["Name"]
local larry2590, _2590_2, _2590_3 =table.find(_2161_vararg1, larry2589)
local larry2591 =larry2169[141]
local larry2592 =larry2591["Name"]
local larry2593, _2593_2, _2593_3 =table.find(_2161_vararg1, larry2592)
local larry2594 =larry2169[142]
local larry2595 =larry2594["Name"]
local larry2596, _2596_2, _2596_3 =table.find(_2161_vararg1, larry2595)
local larry2597 =larry2169[143]
local larry2598 =larry2597["Name"]
local larry2599, _2599_2, _2599_3 =table.find(_2161_vararg1, larry2598)
local larry2600 =larry2169[144]
local larry2601 =larry2600["Name"]
local larry2602, _2602_2, _2602_3 =table.find(_2161_vararg1, larry2601)
local larry2603 =larry2169[145]
local larry2604 =larry2603["Name"]
local larry2605, _2605_2, _2605_3 =table.find(_2161_vararg1, larry2604)
local larry2606 =larry2169[146]
local larry2607 =larry2606["Name"]
local larry2608, _2608_2, _2608_3 =table.find(_2161_vararg1, larry2607)
local larry2609 =larry2169[147]
local larry2610 =larry2609["Name"]
local larry2611, _2611_2, _2611_3 =table.find(_2161_vararg1, larry2610)
local larry2612 =larry2169[148]
local larry2613 =larry2612["Name"]
local larry2614, _2614_2, _2614_3 =table.find(_2161_vararg1, larry2613)
local larry2615 =larry2169[149]
local larry2616 =larry2615["Name"]
local larry2617, _2617_2, _2617_3 =table.find(_2161_vararg1, larry2616)
local larry2618 =larry2169[150]
local larry2619 =larry2618["Name"]
local larry2620, _2620_2, _2620_3 =table.find(_2161_vararg1, larry2619)
local larry2621 =larry2169[151]
local larry2622 =larry2621["Name"]
local larry2623, _2623_2, _2623_3 =table.find(_2161_vararg1, larry2622)
local larry2624 =larry2169[152]
local larry2625 =larry2624["Name"]
local larry2626, _2626_2, _2626_3 =table.find(_2161_vararg1, larry2625)
local larry2627 =larry2169[153]
local larry2628 =larry2627["Name"]
local larry2629, _2629_2, _2629_3 =table.find(_2161_vararg1, larry2628)
local larry2630 =larry2169[154]
local larry2631 =larry2630["Name"]
local larry2632, _2632_2, _2632_3 =table.find(_2161_vararg1, larry2631)
local larry2633 =larry2169[155]
local larry2634 =larry2633["Name"]
local larry2635, _2635_2, _2635_3 =table.find(_2161_vararg1, larry2634)
local larry2636 =larry2169[156]
local larry2637 =larry2636["Name"]
local larry2638, _2638_2, _2638_3 =table.find(_2161_vararg1, larry2637)
local larry2639 =larry2169[157]
local larry2640 =larry2639["Name"]
local larry2641, _2641_2, _2641_3 =table.find(_2161_vararg1, larry2640)
local larry2642 =larry2169[158]
local larry2643 =larry2642["Name"]
local larry2644, _2644_2, _2644_3 =table.find(_2161_vararg1, larry2643)
local larry2645 =larry2169[159]
local larry2646 =larry2645["Name"]
local larry2647, _2647_2, _2647_3 =table.find(_2161_vararg1, larry2646)
local larry2648 =larry2169[160]
local larry2649 =larry2648["Name"]
local larry2650, _2650_2, _2650_3 =table.find(_2161_vararg1, larry2649)
local larry2651 =larry2169[161]
local larry2652 =larry2651["Name"]
local larry2653, _2653_2, _2653_3 =table.find(_2161_vararg1, larry2652)
local larry2654 =larry2169[162]
local larry2655 =larry2654["Name"]
local larry2656, _2656_2, _2656_3 =table.find(_2161_vararg1, larry2655)
local larry2657 =larry2169[163]
local larry2658 =larry2657["Name"]
local larry2659, _2659_2, _2659_3 =table.find(_2161_vararg1, larry2658)
local larry2660 =larry2169[164]
local larry2661 =larry2660["Name"]
local larry2662, _2662_2, _2662_3 =table.find(_2161_vararg1, larry2661)
local larry2663 =larry2169[165]
local larry2664 =larry2663["Name"]
local larry2665, _2665_2, _2665_3 =table.find(_2161_vararg1, larry2664)
local larry2666 =larry2169[166]
local larry2667 =larry2666["Name"]
local larry2668, _2668_2, _2668_3 =table.find(_2161_vararg1, larry2667)
local larry2669 =larry2169[167]
local larry2670 =larry2669["Name"]
local larry2671, _2671_2, _2671_3 =table.find(_2161_vararg1, larry2670)
local larry2672 =larry2169[168]
local larry2673 =larry2672["Name"]
local larry2674, _2674_2, _2674_3 =table.find(_2161_vararg1, larry2673)
local larry2675 =larry2169[169]
local larry2676 =larry2675["Name"]
local larry2677, _2677_2, _2677_3 =table.find(_2161_vararg1, larry2676)
local larry2678 =larry2169[170]
local larry2679 =larry2678["Name"]
local larry2680, _2680_2, _2680_3 =table.find(_2161_vararg1, larry2679)
local larry2681 =larry2169[171]
local larry2682 =larry2681["Name"]
local larry2683, _2683_2, _2683_3 =table.find(_2161_vararg1, larry2682)
local larry2684 =larry2169[172]
local larry2685 =larry2684["Name"]
local larry2686, _2686_2, _2686_3 =table.find(_2161_vararg1, larry2685)
local larry2687 =larry2169[173]
local larry2688 =larry2687["Name"]
local larry2689, _2689_2, _2689_3 =table.find(_2161_vararg1, larry2688)
local larry2690 =larry2169[174]
local larry2691 =larry2690["Name"]
local larry2692, _2692_2, _2692_3 =table.find(_2161_vararg1, larry2691)
local larry2693 =larry2169[175]
local larry2694 =larry2693["Name"]
local larry2695, _2695_2, _2695_3 =table.find(_2161_vararg1, larry2694)
local larry2696 =larry2169[176]
local larry2697 =larry2696["Name"]
local larry2698, _2698_2, _2698_3 =table.find(_2161_vararg1, larry2697)
local larry2699 =larry2169[177]
local larry2700 =larry2699["Name"]
local larry2701, _2701_2, _2701_3 =table.find(_2161_vararg1, larry2700)
local larry2702 =larry2169[178]
local larry2703 =larry2702["Name"]
local larry2704, _2704_2, _2704_3 =table.find(_2161_vararg1, larry2703)
local larry2705 =larry2169[179]
local larry2706 =larry2705["Name"]
local larry2707, _2707_2, _2707_3 =table.find(_2161_vararg1, larry2706)
local larry2708 =larry2169[180]
local larry2709 =larry2708["Name"]
local larry2710, _2710_2, _2710_3 =table.find(_2161_vararg1, larry2709)
local larry2711 =larry2169[181]
local larry2712 =larry2711["Name"]
local larry2713, _2713_2, _2713_3 =table.find(_2161_vararg1, larry2712)
local larry2714 =larry2169[182]
local larry2715 =larry2714["Name"]
local larry2716, _2716_2, _2716_3 =table.find(_2161_vararg1, larry2715)
local larry2717 =larry2169[183]
local larry2718 =larry2717["Name"]
local larry2719, _2719_2, _2719_3 =table.find(_2161_vararg1, larry2718)
local larry2720 =larry2169[184]
local larry2721 =larry2720["Name"]
local larry2722, _2722_2, _2722_3 =table.find(_2161_vararg1, larry2721)
local larry2723 =larry2169[185]
local larry2724 =larry2723["Name"]
local larry2725, _2725_2, _2725_3 =table.find(_2161_vararg1, larry2724)
local larry2726 =larry2169[186]
local larry2727 =larry2726["Name"]
local larry2728, _2728_2, _2728_3 =table.find(_2161_vararg1, larry2727)
local larry2729 =larry2169[187]
local larry2730 =larry2729["Name"]
local larry2731, _2731_2, _2731_3 =table.find(_2161_vararg1, larry2730)
local larry2732 =larry2169[188]
local larry2733 =larry2732["Name"]
local larry2734, _2734_2, _2734_3 =table.find(_2161_vararg1, larry2733)
local larry2735 =larry2169[189]
local larry2736 =larry2735["Name"]
local larry2737, _2737_2, _2737_3 =table.find(_2161_vararg1, larry2736)
local larry2738 =larry2169[190]
local larry2739 =larry2738["Name"]
local larry2740, _2740_2, _2740_3 =table.find(_2161_vararg1, larry2739)
local larry2741 =larry2169[191]
local larry2742 =larry2741["Name"]
local larry2743, _2743_2, _2743_3 =table.find(_2161_vararg1, larry2742)
local larry2744 =larry2169[192]
local larry2745 =larry2744["Name"]
local larry2746, _2746_2, _2746_3 =table.find(_2161_vararg1, larry2745)
local larry2747 =larry2169[193]
local larry2748 =larry2747["Name"]
local larry2749, _2749_2, _2749_3 =table.find(_2161_vararg1, larry2748)
local larry2750 =larry2169[194]
local larry2751 =larry2750["Name"]
local larry2752, _2752_2, _2752_3 =table.find(_2161_vararg1, larry2751)
local larry2753 =larry2169[195]
local larry2754 =larry2753["Name"]
local larry2755, _2755_2, _2755_3 =table.find(_2161_vararg1, larry2754)
local larry2756 =larry2169[196]
local larry2757 =larry2756["Name"]
local larry2758, _2758_2, _2758_3 =table.find(_2161_vararg1, larry2757)
local larry2759 =larry2169[197]
local larry2760 =larry2759["Name"]
local larry2761, _2761_2, _2761_3 =table.find(_2161_vararg1, larry2760)
local larry2762 =larry2169[198]
local larry2763 =larry2762["Name"]
local larry2764, _2764_2, _2764_3 =table.find(_2161_vararg1, larry2763)
local larry2765 =larry2169[199]
local larry2766 =larry2765["Name"]
local larry2767, _2767_2, _2767_3 =table.find(_2161_vararg1, larry2766)
local larry2768 =larry2169[200]
local larry2769 =larry2768["Name"]
local larry2770, _2770_2, _2770_3 =table.find(_2161_vararg1, larry2769)
local larry2771 =larry2169[201]
local larry2772 =larry2771["Name"]
local larry2773, _2773_2, _2773_3 =table.find(_2161_vararg1, larry2772)
local larry2774 =larry2169[202]
local larry2775 =larry2774["Name"]
local larry2776, _2776_2, _2776_3 =table.find(_2161_vararg1, larry2775)
local larry2777 =larry2169[203]
local larry2778 =larry2777["Name"]
local larry2779, _2779_2, _2779_3 =table.find(_2161_vararg1, larry2778)
local larry2780 =larry2169[204]
local larry2781 =larry2780["Name"]
local larry2782, _2782_2, _2782_3 =table.find(_2161_vararg1, larry2781)
local larry2783 =larry2169[205]
local larry2784 =larry2783["Name"]
local larry2785, _2785_2, _2785_3 =table.find(_2161_vararg1, larry2784)
local larry2786 =larry2169[206]
local larry2787 =larry2786["Name"]
local larry2788, _2788_2, _2788_3 =table.find(_2161_vararg1, larry2787)
local larry2789 =larry2169[207]
local larry2790 =larry2789["Name"]
local larry2791, _2791_2, _2791_3 =table.find(_2161_vararg1, larry2790)
local larry2792 =larry2169[208]
local larry2793 =larry2792["Name"]
local larry2794, _2794_2, _2794_3 =table.find(_2161_vararg1, larry2793)
local larry2795 =larry2169[209]
local larry2796 =larry2795["Name"]
local larry2797, _2797_2, _2797_3 =table.find(_2161_vararg1, larry2796)
local larry2798 =larry2169[210]
local larry2799 =larry2798["Name"]
local larry2800, _2800_2, _2800_3 =table.find(_2161_vararg1, larry2799)
local larry2801 =larry2169[211]
local larry2802 =larry2801["Name"]
local larry2803, _2803_2, _2803_3 =table.find(_2161_vararg1, larry2802)
local larry2804 =larry2169[212]
local larry2805 =larry2804["Name"]
local larry2806, _2806_2, _2806_3 =table.find(_2161_vararg1, larry2805)
local larry2807 =larry2169[213]
local larry2808 =larry2807["Name"]
local larry2809, _2809_2, _2809_3 =table.find(_2161_vararg1, larry2808)
local larry2810 =larry2169[214]
local larry2811 =larry2810["Name"]
local larry2812, _2812_2, _2812_3 =table.find(_2161_vararg1, larry2811)
local larry2813 =larry2169[215]
local larry2814 =larry2813["Name"]
local larry2815, _2815_2, _2815_3 =table.find(_2161_vararg1, larry2814)
local larry2816 =larry2169[216]
local larry2817 =larry2816["Name"]
local larry2818, _2818_2, _2818_3 =table.find(_2161_vararg1, larry2817)
local larry2819 =larry2169[217]
local larry2820 =larry2819["Name"]
local larry2821, _2821_2, _2821_3 =table.find(_2161_vararg1, larry2820)
local larry2822 =larry2169[218]
local larry2823 =larry2822["Name"]
local larry2824, _2824_2, _2824_3 =table.find(_2161_vararg1, larry2823)
local larry2825 =larry2169[219]
local larry2826 =larry2825["Name"]
local larry2827, _2827_2, _2827_3 =table.find(_2161_vararg1, larry2826)
local larry2828 =larry2169[220]
local larry2829 =larry2828["Name"]
local larry2830, _2830_2, _2830_3 =table.find(_2161_vararg1, larry2829)
local larry2831 =larry2169[221]
local larry2832 =larry2831["Name"]
local larry2833, _2833_2, _2833_3 =table.find(_2161_vararg1, larry2832)
local larry2834 =larry2169[222]
local larry2835 =larry2834["Name"]
local larry2836, _2836_2, _2836_3 =table.find(_2161_vararg1, larry2835)
local larry2837 =larry2169[223]
local larry2838 =larry2837["Name"]
local larry2839, _2839_2, _2839_3 =table.find(_2161_vararg1, larry2838)
local larry2840 =larry2169[224]
local larry2841 =larry2840["Name"]
local larry2842, _2842_2, _2842_3 =table.find(_2161_vararg1, larry2841)
local larry2843 =larry2169[225]
local larry2844 =larry2843["Name"]
local larry2845, _2845_2, _2845_3 =table.find(_2161_vararg1, larry2844)
local larry2846 =larry2169[226]
local larry2847 =larry2846["Name"]
local larry2848, _2848_2, _2848_3 =table.find(_2161_vararg1, larry2847)
local larry2849 =larry2169[227]
local larry2850 =larry2849["Name"]
local larry2851, _2851_2, _2851_3 =table.find(_2161_vararg1, larry2850)
local larry2852 =larry2169[228]
local larry2853 =larry2852["Name"]
local larry2854, _2854_2, _2854_3 =table.find(_2161_vararg1, larry2853)
local larry2855 =larry2169[229]
local larry2856 =larry2855["Name"]
local larry2857, _2857_2, _2857_3 =table.find(_2161_vararg1, larry2856)
local larry2858 =larry2169[230]
local larry2859 =larry2858["Name"]
local larry2860, _2860_2, _2860_3 =table.find(_2161_vararg1, larry2859)
local larry2861 =larry2169[231]
local larry2862 =larry2861["Name"]
local larry2863, _2863_2, _2863_3 =table.find(_2161_vararg1, larry2862)
local larry2864 =larry2169[232]
local larry2865 =larry2864["Name"]
local larry2866, _2866_2, _2866_3 =table.find(_2161_vararg1, larry2865)
local larry2867 =larry2169[233]
local larry2868 =larry2867["Name"]
local larry2869, _2869_2, _2869_3 =table.find(_2161_vararg1, larry2868)
local larry2870 =larry2169[234]
local larry2871 =larry2870["Name"]
local larry2872, _2872_2, _2872_3 =table.find(_2161_vararg1, larry2871)
local er =error("Luraph Script:1409: internal 542: <larry: infinitelooperror>")
local larry2166 =larry2165(function(...)
local _2167_vararg1, _2167_vararg2, _2167_vararg3, _2167_vararg4, _2167_vararg5, _2167_vararg6, _2167_vararg7, _2167_vararg8, _2167_vararg9, _2167_vararg10 = ...
local larry2168 =larry2145["GetChildren"]
local larry2169 =larry2168(larry2145)
local larry2170 =#larry2169
local larry2171 =larry2169[1]
local larry2172 =larry2171["Name"]
local larry2173, _2173_2, _2173_3 =table.find(_2161_vararg1, larry2172)
local larry2174 =larry2169[2]
local larry2175 =larry2174["Name"]
local larry2176, _2176_2, _2176_3 =table.find(_2161_vararg1, larry2175)
local larry2177 =larry2169[3]
local larry2178 =larry2177["Name"]
local larry2179, _2179_2, _2179_3 =table.find(_2161_vararg1, larry2178)
local larry2180 =larry2169[4]
local larry2181 =larry2180["Name"]
local larry2182, _2182_2, _2182_3 =table.find(_2161_vararg1, larry2181)
local larry2183 =larry2169[5]
local larry2184 =larry2183["Name"]
local larry2185, _2185_2, _2185_3 =table.find(_2161_vararg1, larry2184)
local larry2186 =larry2169[6]
local larry2187 =larry2186["Name"]
local larry2188, _2188_2, _2188_3 =table.find(_2161_vararg1, larry2187)
local larry2189 =larry2169[7]
local larry2190 =larry2189["Name"]
local larry2191, _2191_2, _2191_3 =table.find(_2161_vararg1, larry2190)
local larry2192 =larry2169[8]
local larry2193 =larry2192["Name"]
local larry2194, _2194_2, _2194_3 =table.find(_2161_vararg1, larry2193)
local larry2195 =larry2169[9]
local larry2196 =larry2195["Name"]
local larry2197, _2197_2, _2197_3 =table.find(_2161_vararg1, larry2196)
local larry2198 =larry2169[10]
local larry2199 =larry2198["Name"]
local larry2200, _2200_2, _2200_3 =table.find(_2161_vararg1, larry2199)
local larry2201 =larry2169[11]
local larry2202 =larry2201["Name"]
local larry2203, _2203_2, _2203_3 =table.find(_2161_vararg1, larry2202)
local larry2204 =larry2169[12]
local larry2205 =larry2204["Name"]
local larry2206, _2206_2, _2206_3 =table.find(_2161_vararg1, larry2205)
local larry2207 =larry2169[13]
local larry2208 =larry2207["Name"]
local larry2209, _2209_2, _2209_3 =table.find(_2161_vararg1, larry2208)
local larry2210 =larry2169[14]
local larry2211 =larry2210["Name"]
local larry2212, _2212_2, _2212_3 =table.find(_2161_vararg1, larry2211)
local larry2213 =larry2169[15]
local larry2214 =larry2213["Name"]
local larry2215, _2215_2, _2215_3 =table.find(_2161_vararg1, larry2214)
local larry2216 =larry2169[16]
local larry2217 =larry2216["Name"]
local larry2218, _2218_2, _2218_3 =table.find(_2161_vararg1, larry2217)
local larry2219 =larry2169[17]
local larry2220 =larry2219["Name"]
local larry2221, _2221_2, _2221_3 =table.find(_2161_vararg1, larry2220)
local larry2222 =larry2169[18]
local larry2223 =larry2222["Name"]
local larry2224, _2224_2, _2224_3 =table.find(_2161_vararg1, larry2223)
local larry2225 =larry2169[19]
local larry2226 =larry2225["Name"]
local larry2227, _2227_2, _2227_3 =table.find(_2161_vararg1, larry2226)
local larry2228 =larry2169[20]
local larry2229 =larry2228["Name"]
local larry2230, _2230_2, _2230_3 =table.find(_2161_vararg1, larry2229)
local larry2231 =larry2169[21]
local larry2232 =larry2231["Name"]
local larry2233, _2233_2, _2233_3 =table.find(_2161_vararg1, larry2232)
local larry2234 =larry2169[22]
local larry2235 =larry2234["Name"]
local larry2236, _2236_2, _2236_3 =table.find(_2161_vararg1, larry2235)
local larry2237 =larry2169[23]
local larry2238 =larry2237["Name"]
local larry2239, _2239_2, _2239_3 =table.find(_2161_vararg1, larry2238)
local larry2240 =larry2169[24]
local larry2241 =larry2240["Name"]
local larry2242, _2242_2, _2242_3 =table.find(_2161_vararg1, larry2241)
local larry2243 =larry2169[25]
local larry2244 =larry2243["Name"]
local larry2245, _2245_2, _2245_3 =table.find(_2161_vararg1, larry2244)
local larry2246 =larry2169[26]
local larry2247 =larry2246["Name"]
local larry2248, _2248_2, _2248_3 =table.find(_2161_vararg1, larry2247)
local larry2249 =larry2169[27]
local larry2250 =larry2249["Name"]
local larry2251, _2251_2, _2251_3 =table.find(_2161_vararg1, larry2250)
local larry2252 =larry2169[28]
local larry2253 =larry2252["Name"]
local larry2254, _2254_2, _2254_3 =table.find(_2161_vararg1, larry2253)
local larry2255 =larry2169[29]
local larry2256 =larry2255["Name"]
local larry2257, _2257_2, _2257_3 =table.find(_2161_vararg1, larry2256)
local larry2258 =larry2169[30]
local larry2259 =larry2258["Name"]
local larry2260, _2260_2, _2260_3 =table.find(_2161_vararg1, larry2259)
local larry2261 =larry2169[31]
local larry2262 =larry2261["Name"]
local larry2263, _2263_2, _2263_3 =table.find(_2161_vararg1, larry2262)
local larry2264 =larry2169[32]
local larry2265 =larry2264["Name"]
local larry2266, _2266_2, _2266_3 =table.find(_2161_vararg1, larry2265)
local larry2267 =larry2169[33]
local larry2268 =larry2267["Name"]
local larry2269, _2269_2, _2269_3 =table.find(_2161_vararg1, larry2268)
local larry2270 =larry2169[34]
local larry2271 =larry2270["Name"]
local larry2272, _2272_2, _2272_3 =table.find(_2161_vararg1, larry2271)
local larry2273 =larry2169[35]
local larry2274 =larry2273["Name"]
local larry2275, _2275_2, _2275_3 =table.find(_2161_vararg1, larry2274)
local larry2276 =larry2169[36]
local larry2277 =larry2276["Name"]
local larry2278, _2278_2, _2278_3 =table.find(_2161_vararg1, larry2277)
local larry2279 =larry2169[37]
local larry2280 =larry2279["Name"]
local larry2281, _2281_2, _2281_3 =table.find(_2161_vararg1, larry2280)
local larry2282 =larry2169[38]
local larry2283 =larry2282["Name"]
local larry2284, _2284_2, _2284_3 =table.find(_2161_vararg1, larry2283)
local larry2285 =larry2169[39]
local larry2286 =larry2285["Name"]
local larry2287, _2287_2, _2287_3 =table.find(_2161_vararg1, larry2286)
local larry2288 =larry2169[40]
local larry2289 =larry2288["Name"]
local larry2290, _2290_2, _2290_3 =table.find(_2161_vararg1, larry2289)
local larry2291 =larry2169[41]
local larry2292 =larry2291["Name"]
local larry2293, _2293_2, _2293_3 =table.find(_2161_vararg1, larry2292)
local larry2294 =larry2169[42]
local larry2295 =larry2294["Name"]
local larry2296, _2296_2, _2296_3 =table.find(_2161_vararg1, larry2295)
local larry2297 =larry2169[43]
local larry2298 =larry2297["Name"]
local larry2299, _2299_2, _2299_3 =table.find(_2161_vararg1, larry2298)
local larry2300 =larry2169[44]
local larry2301 =larry2300["Name"]
local larry2302, _2302_2, _2302_3 =table.find(_2161_vararg1, larry2301)
local larry2303 =larry2169[45]
local larry2304 =larry2303["Name"]
local larry2305, _2305_2, _2305_3 =table.find(_2161_vararg1, larry2304)
local larry2306 =larry2169[46]
local larry2307 =larry2306["Name"]
local larry2308, _2308_2, _2308_3 =table.find(_2161_vararg1, larry2307)
local larry2309 =larry2169[47]
local larry2310 =larry2309["Name"]
local larry2311, _2311_2, _2311_3 =table.find(_2161_vararg1, larry2310)
local larry2312 =larry2169[48]
local larry2313 =larry2312["Name"]
local larry2314, _2314_2, _2314_3 =table.find(_2161_vararg1, larry2313)
local larry2315 =larry2169[49]
local larry2316 =larry2315["Name"]
local larry2317, _2317_2, _2317_3 =table.find(_2161_vararg1, larry2316)
local larry2318 =larry2169[50]
local larry2319 =larry2318["Name"]
local larry2320, _2320_2, _2320_3 =table.find(_2161_vararg1, larry2319)
local larry2321 =larry2169[51]
local larry2322 =larry2321["Name"]
local larry2323, _2323_2, _2323_3 =table.find(_2161_vararg1, larry2322)
local larry2324 =larry2169[52]
local larry2325 =larry2324["Name"]
local larry2326, _2326_2, _2326_3 =table.find(_2161_vararg1, larry2325)
local larry2327 =larry2169[53]
local larry2328 =larry2327["Name"]
local larry2329, _2329_2, _2329_3 =table.find(_2161_vararg1, larry2328)
local larry2330 =larry2169[54]
local larry2331 =larry2330["Name"]
local larry2332, _2332_2, _2332_3 =table.find(_2161_vararg1, larry2331)
local larry2333 =larry2169[55]
local larry2334 =larry2333["Name"]
local larry2335, _2335_2, _2335_3 =table.find(_2161_vararg1, larry2334)
local larry2336 =larry2169[56]
local larry2337 =larry2336["Name"]
local larry2338, _2338_2, _2338_3 =table.find(_2161_vararg1, larry2337)
local larry2339 =larry2169[57]
local larry2340 =larry2339["Name"]
local larry2341, _2341_2, _2341_3 =table.find(_2161_vararg1, larry2340)
local larry2342 =larry2169[58]
local larry2343 =larry2342["Name"]
local larry2344, _2344_2, _2344_3 =table.find(_2161_vararg1, larry2343)
local larry2345 =larry2169[59]
local larry2346 =larry2345["Name"]
local larry2347, _2347_2, _2347_3 =table.find(_2161_vararg1, larry2346)
local larry2348 =larry2169[60]
local larry2349 =larry2348["Name"]
local larry2350, _2350_2, _2350_3 =table.find(_2161_vararg1, larry2349)
local larry2351 =larry2169[61]
local larry2352 =larry2351["Name"]
local larry2353, _2353_2, _2353_3 =table.find(_2161_vararg1, larry2352)
local larry2354 =larry2169[62]
local larry2355 =larry2354["Name"]
local larry2356, _2356_2, _2356_3 =table.find(_2161_vararg1, larry2355)
local larry2357 =larry2169[63]
local larry2358 =larry2357["Name"]
local larry2359, _2359_2, _2359_3 =table.find(_2161_vararg1, larry2358)
local larry2360 =larry2169[64]
local larry2361 =larry2360["Name"]
local larry2362, _2362_2, _2362_3 =table.find(_2161_vararg1, larry2361)
local larry2363 =larry2169[65]
local larry2364 =larry2363["Name"]
local larry2365, _2365_2, _2365_3 =table.find(_2161_vararg1, larry2364)
local larry2366 =larry2169[66]
local larry2367 =larry2366["Name"]
local larry2368, _2368_2, _2368_3 =table.find(_2161_vararg1, larry2367)
local larry2369 =larry2169[67]
local larry2370 =larry2369["Name"]
local larry2371, _2371_2, _2371_3 =table.find(_2161_vararg1, larry2370)
local larry2372 =larry2169[68]
local larry2373 =larry2372["Name"]
local larry2374, _2374_2, _2374_3 =table.find(_2161_vararg1, larry2373)
local larry2375 =larry2169[69]
local larry2376 =larry2375["Name"]
local larry2377, _2377_2, _2377_3 =table.find(_2161_vararg1, larry2376)
local larry2378 =larry2169[70]
local larry2379 =larry2378["Name"]
local larry2380, _2380_2, _2380_3 =table.find(_2161_vararg1, larry2379)
local larry2381 =larry2169[71]
local larry2382 =larry2381["Name"]
local larry2383, _2383_2, _2383_3 =table.find(_2161_vararg1, larry2382)
local larry2384 =larry2169[72]
local larry2385 =larry2384["Name"]
local larry2386, _2386_2, _2386_3 =table.find(_2161_vararg1, larry2385)
local larry2387 =larry2169[73]
local larry2388 =larry2387["Name"]
local larry2389, _2389_2, _2389_3 =table.find(_2161_vararg1, larry2388)
local larry2390 =larry2169[74]
local larry2391 =larry2390["Name"]
local larry2392, _2392_2, _2392_3 =table.find(_2161_vararg1, larry2391)
local larry2393 =larry2169[75]
local larry2394 =larry2393["Name"]
local larry2395, _2395_2, _2395_3 =table.find(_2161_vararg1, larry2394)
local larry2396 =larry2169[76]
local larry2397 =larry2396["Name"]
local larry2398, _2398_2, _2398_3 =table.find(_2161_vararg1, larry2397)
local larry2399 =larry2169[77]
local larry2400 =larry2399["Name"]
local larry2401, _2401_2, _2401_3 =table.find(_2161_vararg1, larry2400)
local larry2402 =larry2169[78]
local larry2403 =larry2402["Name"]
local larry2404, _2404_2, _2404_3 =table.find(_2161_vararg1, larry2403)
local larry2405 =larry2169[79]
local larry2406 =larry2405["Name"]
local larry2407, _2407_2, _2407_3 =table.find(_2161_vararg1, larry2406)
local larry2408 =larry2169[80]
local larry2409 =larry2408["Name"]
local larry2410, _2410_2, _2410_3 =table.find(_2161_vararg1, larry2409)
local larry2411 =larry2169[81]
local larry2412 =larry2411["Name"]
local larry2413, _2413_2, _2413_3 =table.find(_2161_vararg1, larry2412)
local larry2414 =larry2169[82]
local larry2415 =larry2414["Name"]
local larry2416, _2416_2, _2416_3 =table.find(_2161_vararg1, larry2415)
local larry2417 =larry2169[83]
local larry2418 =larry2417["Name"]
local larry2419, _2419_2, _2419_3 =table.find(_2161_vararg1, larry2418)
local larry2420 =larry2169[84]
local larry2421 =larry2420["Name"]
local larry2422, _2422_2, _2422_3 =table.find(_2161_vararg1, larry2421)
local larry2423 =larry2169[85]
local larry2424 =larry2423["Name"]
local larry2425, _2425_2, _2425_3 =table.find(_2161_vararg1, larry2424)
local larry2426 =larry2169[86]
local larry2427 =larry2426["Name"]
local larry2428, _2428_2, _2428_3 =table.find(_2161_vararg1, larry2427)
local larry2429 =larry2169[87]
local larry2430 =larry2429["Name"]
local larry2431, _2431_2, _2431_3 =table.find(_2161_vararg1, larry2430)
local larry2432 =larry2169[88]
local larry2433 =larry2432["Name"]
local larry2434, _2434_2, _2434_3 =table.find(_2161_vararg1, larry2433)
local larry2435 =larry2169[89]
local larry2436 =larry2435["Name"]
local larry2437, _2437_2, _2437_3 =table.find(_2161_vararg1, larry2436)
local larry2438 =larry2169[90]
local larry2439 =larry2438["Name"]
local larry2440, _2440_2, _2440_3 =table.find(_2161_vararg1, larry2439)
local larry2441 =larry2169[91]
local larry2442 =larry2441["Name"]
local larry2443, _2443_2, _2443_3 =table.find(_2161_vararg1, larry2442)
local larry2444 =larry2169[92]
local larry2445 =larry2444["Name"]
local larry2446, _2446_2, _2446_3 =table.find(_2161_vararg1, larry2445)
local larry2447 =larry2169[93]
local larry2448 =larry2447["Name"]
local larry2449, _2449_2, _2449_3 =table.find(_2161_vararg1, larry2448)
local larry2450 =larry2169[94]
local larry2451 =larry2450["Name"]
local larry2452, _2452_2, _2452_3 =table.find(_2161_vararg1, larry2451)
local larry2453 =larry2169[95]
local larry2454 =larry2453["Name"]
local larry2455, _2455_2, _2455_3 =table.find(_2161_vararg1, larry2454)
local larry2456 =larry2169[96]
local larry2457 =larry2456["Name"]
local larry2458, _2458_2, _2458_3 =table.find(_2161_vararg1, larry2457)
local larry2459 =larry2169[97]
local larry2460 =larry2459["Name"]
local larry2461, _2461_2, _2461_3 =table.find(_2161_vararg1, larry2460)
local larry2462 =larry2169[98]
local larry2463 =larry2462["Name"]
local larry2464, _2464_2, _2464_3 =table.find(_2161_vararg1, larry2463)
local larry2465 =larry2169[99]
local larry2466 =larry2465["Name"]
local larry2467, _2467_2, _2467_3 =table.find(_2161_vararg1, larry2466)
local larry2468 =larry2169[100]
local larry2469 =larry2468["Name"]
local larry2470, _2470_2, _2470_3 =table.find(_2161_vararg1, larry2469)
local larry2471 =larry2169[101]
local larry2472 =larry2471["Name"]
local larry2473, _2473_2, _2473_3 =table.find(_2161_vararg1, larry2472)
local larry2474 =larry2169[102]
local larry2475 =larry2474["Name"]
local larry2476, _2476_2, _2476_3 =table.find(_2161_vararg1, larry2475)
local larry2477 =larry2169[103]
local larry2478 =larry2477["Name"]
local larry2479, _2479_2, _2479_3 =table.find(_2161_vararg1, larry2478)
local larry2480 =larry2169[104]
local larry2481 =larry2480["Name"]
local larry2482, _2482_2, _2482_3 =table.find(_2161_vararg1, larry2481)
local larry2483 =larry2169[105]
local larry2484 =larry2483["Name"]
local larry2485, _2485_2, _2485_3 =table.find(_2161_vararg1, larry2484)
local larry2486 =larry2169[106]
local larry2487 =larry2486["Name"]
local larry2488, _2488_2, _2488_3 =table.find(_2161_vararg1, larry2487)
local larry2489 =larry2169[107]
local larry2490 =larry2489["Name"]
local larry2491, _2491_2, _2491_3 =table.find(_2161_vararg1, larry2490)
local larry2492 =larry2169[108]
local larry2493 =larry2492["Name"]
local larry2494, _2494_2, _2494_3 =table.find(_2161_vararg1, larry2493)
local larry2495 =larry2169[109]
local larry2496 =larry2495["Name"]
local larry2497, _2497_2, _2497_3 =table.find(_2161_vararg1, larry2496)
local larry2498 =larry2169[110]
local larry2499 =larry2498["Name"]
local larry2500, _2500_2, _2500_3 =table.find(_2161_vararg1, larry2499)
local larry2501 =larry2169[111]
local larry2502 =larry2501["Name"]
local larry2503, _2503_2, _2503_3 =table.find(_2161_vararg1, larry2502)
local larry2504 =larry2169[112]
local larry2505 =larry2504["Name"]
local larry2506, _2506_2, _2506_3 =table.find(_2161_vararg1, larry2505)
local larry2507 =larry2169[113]
local larry2508 =larry2507["Name"]
local larry2509, _2509_2, _2509_3 =table.find(_2161_vararg1, larry2508)
local larry2510 =larry2169[114]
local larry2511 =larry2510["Name"]
local larry2512, _2512_2, _2512_3 =table.find(_2161_vararg1, larry2511)
local larry2513 =larry2169[115]
local larry2514 =larry2513["Name"]
local larry2515, _2515_2, _2515_3 =table.find(_2161_vararg1, larry2514)
local larry2516 =larry2169[116]
local larry2517 =larry2516["Name"]
local larry2518, _2518_2, _2518_3 =table.find(_2161_vararg1, larry2517)
local larry2519 =larry2169[117]
local larry2520 =larry2519["Name"]
local larry2521, _2521_2, _2521_3 =table.find(_2161_vararg1, larry2520)
local larry2522 =larry2169[118]
local larry2523 =larry2522["Name"]
local larry2524, _2524_2, _2524_3 =table.find(_2161_vararg1, larry2523)
local larry2525 =larry2169[119]
local larry2526 =larry2525["Name"]
local larry2527, _2527_2, _2527_3 =table.find(_2161_vararg1, larry2526)
local larry2528 =larry2169[120]
local larry2529 =larry2528["Name"]
local larry2530, _2530_2, _2530_3 =table.find(_2161_vararg1, larry2529)
local larry2531 =larry2169[121]
local larry2532 =larry2531["Name"]
local larry2533, _2533_2, _2533_3 =table.find(_2161_vararg1, larry2532)
local larry2534 =larry2169[122]
local larry2535 =larry2534["Name"]
local larry2536, _2536_2, _2536_3 =table.find(_2161_vararg1, larry2535)
local larry2537 =larry2169[123]
local larry2538 =larry2537["Name"]
local larry2539, _2539_2, _2539_3 =table.find(_2161_vararg1, larry2538)
local larry2540 =larry2169[124]
local larry2541 =larry2540["Name"]
local larry2542, _2542_2, _2542_3 =table.find(_2161_vararg1, larry2541)
local larry2543 =larry2169[125]
local larry2544 =larry2543["Name"]
local larry2545, _2545_2, _2545_3 =table.find(_2161_vararg1, larry2544)
local larry2546 =larry2169[126]
local larry2547 =larry2546["Name"]
local larry2548, _2548_2, _2548_3 =table.find(_2161_vararg1, larry2547)
local larry2549 =larry2169[127]
local larry2550 =larry2549["Name"]
local larry2551, _2551_2, _2551_3 =table.find(_2161_vararg1, larry2550)
local larry2552 =larry2169[128]
local larry2553 =larry2552["Name"]
local larry2554, _2554_2, _2554_3 =table.find(_2161_vararg1, larry2553)
local larry2555 =larry2169[129]
local larry2556 =larry2555["Name"]
local larry2557, _2557_2, _2557_3 =table.find(_2161_vararg1, larry2556)
local larry2558 =larry2169[130]
local larry2559 =larry2558["Name"]
local larry2560, _2560_2, _2560_3 =table.find(_2161_vararg1, larry2559)
local larry2561 =larry2169[131]
local larry2562 =larry2561["Name"]
local larry2563, _2563_2, _2563_3 =table.find(_2161_vararg1, larry2562)
local larry2564 =larry2169[132]
local larry2565 =larry2564["Name"]
local larry2566, _2566_2, _2566_3 =table.find(_2161_vararg1, larry2565)
local larry2567 =larry2169[133]
local larry2568 =larry2567["Name"]
local larry2569, _2569_2, _2569_3 =table.find(_2161_vararg1, larry2568)
local larry2570 =larry2169[134]
local larry2571 =larry2570["Name"]
local larry2572, _2572_2, _2572_3 =table.find(_2161_vararg1, larry2571)
local larry2573 =larry2169[135]
local larry2574 =larry2573["Name"]
local larry2575, _2575_2, _2575_3 =table.find(_2161_vararg1, larry2574)
local larry2576 =larry2169[136]
local larry2577 =larry2576["Name"]
local larry2578, _2578_2, _2578_3 =table.find(_2161_vararg1, larry2577)
local larry2579 =larry2169[137]
local larry2580 =larry2579["Name"]
local larry2581, _2581_2, _2581_3 =table.find(_2161_vararg1, larry2580)
local larry2582 =larry2169[138]
local larry2583 =larry2582["Name"]
local larry2584, _2584_2, _2584_3 =table.find(_2161_vararg1, larry2583)
local larry2585 =larry2169[139]
local larry2586 =larry2585["Name"]
local larry2587, _2587_2, _2587_3 =table.find(_2161_vararg1, larry2586)
local larry2588 =larry2169[140]
local larry2589 =larry2588["Name"]
local larry2590, _2590_2, _2590_3 =table.find(_2161_vararg1, larry2589)
local larry2591 =larry2169[141]
local larry2592 =larry2591["Name"]
local larry2593, _2593_2, _2593_3 =table.find(_2161_vararg1, larry2592)
local larry2594 =larry2169[142]
local larry2595 =larry2594["Name"]
local larry2596, _2596_2, _2596_3 =table.find(_2161_vararg1, larry2595)
local larry2597 =larry2169[143]
local larry2598 =larry2597["Name"]
local larry2599, _2599_2, _2599_3 =table.find(_2161_vararg1, larry2598)
local larry2600 =larry2169[144]
local larry2601 =larry2600["Name"]
local larry2602, _2602_2, _2602_3 =table.find(_2161_vararg1, larry2601)
local larry2603 =larry2169[145]
local larry2604 =larry2603["Name"]
local larry2605, _2605_2, _2605_3 =table.find(_2161_vararg1, larry2604)
local larry2606 =larry2169[146]
local larry2607 =larry2606["Name"]
local larry2608, _2608_2, _2608_3 =table.find(_2161_vararg1, larry2607)
local larry2609 =larry2169[147]
local larry2610 =larry2609["Name"]
local larry2611, _2611_2, _2611_3 =table.find(_2161_vararg1, larry2610)
local larry2612 =larry2169[148]
local larry2613 =larry2612["Name"]
local larry2614, _2614_2, _2614_3 =table.find(_2161_vararg1, larry2613)
local larry2615 =larry2169[149]
local larry2616 =larry2615["Name"]
local larry2617, _2617_2, _2617_3 =table.find(_2161_vararg1, larry2616)
local larry2618 =larry2169[150]
local larry2619 =larry2618["Name"]
local larry2620, _2620_2, _2620_3 =table.find(_2161_vararg1, larry2619)
local larry2621 =larry2169[151]
local larry2622 =larry2621["Name"]
local larry2623, _2623_2, _2623_3 =table.find(_2161_vararg1, larry2622)
local larry2624 =larry2169[152]
local larry2625 =larry2624["Name"]
local larry2626, _2626_2, _2626_3 =table.find(_2161_vararg1, larry2625)
local larry2627 =larry2169[153]
local larry2628 =larry2627["Name"]
local larry2629, _2629_2, _2629_3 =table.find(_2161_vararg1, larry2628)
local larry2630 =larry2169[154]
local larry2631 =larry2630["Name"]
local larry2632, _2632_2, _2632_3 =table.find(_2161_vararg1, larry2631)
local larry2633 =larry2169[155]
local larry2634 =larry2633["Name"]
local larry2635, _2635_2, _2635_3 =table.find(_2161_vararg1, larry2634)
local larry2636 =larry2169[156]
local larry2637 =larry2636["Name"]
local larry2638, _2638_2, _2638_3 =table.find(_2161_vararg1, larry2637)
local larry2639 =larry2169[157]
local larry2640 =larry2639["Name"]
local larry2641, _2641_2, _2641_3 =table.find(_2161_vararg1, larry2640)
local larry2642 =larry2169[158]
local larry2643 =larry2642["Name"]
local larry2644, _2644_2, _2644_3 =table.find(_2161_vararg1, larry2643)
local larry2645 =larry2169[159]
local larry2646 =larry2645["Name"]
local larry2647, _2647_2, _2647_3 =table.find(_2161_vararg1, larry2646)
local larry2648 =larry2169[160]
local larry2649 =larry2648["Name"]
local larry2650, _2650_2, _2650_3 =table.find(_2161_vararg1, larry2649)
local larry2651 =larry2169[161]
local larry2652 =larry2651["Name"]
local larry2653, _2653_2, _2653_3 =table.find(_2161_vararg1, larry2652)
local larry2654 =larry2169[162]
local larry2655 =larry2654["Name"]
local larry2656, _2656_2, _2656_3 =table.find(_2161_vararg1, larry2655)
local larry2657 =larry2169[163]
local larry2658 =larry2657["Name"]
local larry2659, _2659_2, _2659_3 =table.find(_2161_vararg1, larry2658)
local larry2660 =larry2169[164]
local larry2661 =larry2660["Name"]
local larry2662, _2662_2, _2662_3 =table.find(_2161_vararg1, larry2661)
local larry2663 =larry2169[165]
local larry2664 =larry2663["Name"]
local larry2665, _2665_2, _2665_3 =table.find(_2161_vararg1, larry2664)
local larry2666 =larry2169[166]
local larry2667 =larry2666["Name"]
local larry2668, _2668_2, _2668_3 =table.find(_2161_vararg1, larry2667)
local larry2669 =larry2169[167]
local larry2670 =larry2669["Name"]
local larry2671, _2671_2, _2671_3 =table.find(_2161_vararg1, larry2670)
local larry2672 =larry2169[168]
local larry2673 =larry2672["Name"]
local larry2674, _2674_2, _2674_3 =table.find(_2161_vararg1, larry2673)
local larry2675 =larry2169[169]
local larry2676 =larry2675["Name"]
local larry2677, _2677_2, _2677_3 =table.find(_2161_vararg1, larry2676)
local larry2678 =larry2169[170]
local larry2679 =larry2678["Name"]
local larry2680, _2680_2, _2680_3 =table.find(_2161_vararg1, larry2679)
local larry2681 =larry2169[171]
local larry2682 =larry2681["Name"]
local larry2683, _2683_2, _2683_3 =table.find(_2161_vararg1, larry2682)
local larry2684 =larry2169[172]
local larry2685 =larry2684["Name"]
local larry2686, _2686_2, _2686_3 =table.find(_2161_vararg1, larry2685)
local larry2687 =larry2169[173]
local larry2688 =larry2687["Name"]
local larry2689, _2689_2, _2689_3 =table.find(_2161_vararg1, larry2688)
local larry2690 =larry2169[174]
local larry2691 =larry2690["Name"]
local larry2692, _2692_2, _2692_3 =table.find(_2161_vararg1, larry2691)
local larry2693 =larry2169[175]
local larry2694 =larry2693["Name"]
local larry2695, _2695_2, _2695_3 =table.find(_2161_vararg1, larry2694)
local larry2696 =larry2169[176]
local larry2697 =larry2696["Name"]
local larry2698, _2698_2, _2698_3 =table.find(_2161_vararg1, larry2697)
local larry2699 =larry2169[177]
local larry2700 =larry2699["Name"]
local larry2701, _2701_2, _2701_3 =table.find(_2161_vararg1, larry2700)
local larry2702 =larry2169[178]
local larry2703 =larry2702["Name"]
local larry2704, _2704_2, _2704_3 =table.find(_2161_vararg1, larry2703)
local larry2705 =larry2169[179]
local larry2706 =larry2705["Name"]
local larry2707, _2707_2, _2707_3 =table.find(_2161_vararg1, larry2706)
local larry2708 =larry2169[180]
local larry2709 =larry2708["Name"]
local larry2710, _2710_2, _2710_3 =table.find(_2161_vararg1, larry2709)
local larry2711 =larry2169[181]
local larry2712 =larry2711["Name"]
local larry2713, _2713_2, _2713_3 =table.find(_2161_vararg1, larry2712)
local larry2714 =larry2169[182]
local larry2715 =larry2714["Name"]
local larry2716, _2716_2, _2716_3 =table.find(_2161_vararg1, larry2715)
local larry2717 =larry2169[183]
local larry2718 =larry2717["Name"]
local larry2719, _2719_2, _2719_3 =table.find(_2161_vararg1, larry2718)
local larry2720 =larry2169[184]
local larry2721 =larry2720["Name"]
local larry2722, _2722_2, _2722_3 =table.find(_2161_vararg1, larry2721)
local larry2723 =larry2169[185]
local larry2724 =larry2723["Name"]
local larry2725, _2725_2, _2725_3 =table.find(_2161_vararg1, larry2724)
local larry2726 =larry2169[186]
local larry2727 =larry2726["Name"]
local larry2728, _2728_2, _2728_3 =table.find(_2161_vararg1, larry2727)
local larry2729 =larry2169[187]
local larry2730 =larry2729["Name"]
local larry2731, _2731_2, _2731_3 =table.find(_2161_vararg1, larry2730)
local larry2732 =larry2169[188]
local larry2733 =larry2732["Name"]
local larry2734, _2734_2, _2734_3 =table.find(_2161_vararg1, larry2733)
local larry2735 =larry2169[189]
local larry2736 =larry2735["Name"]
local larry2737, _2737_2, _2737_3 =table.find(_2161_vararg1, larry2736)
local larry2738 =larry2169[190]
local larry2739 =larry2738["Name"]
local larry2740, _2740_2, _2740_3 =table.find(_2161_vararg1, larry2739)
local larry2741 =larry2169[191]
local larry2742 =larry2741["Name"]
local larry2743, _2743_2, _2743_3 =table.find(_2161_vararg1, larry2742)
local larry2744 =larry2169[192]
local larry2745 =larry2744["Name"]
local larry2746, _2746_2, _2746_3 =table.find(_2161_vararg1, larry2745)
local larry2747 =larry2169[193]
local larry2748 =larry2747["Name"]
local larry2749, _2749_2, _2749_3 =table.find(_2161_vararg1, larry2748)
local larry2750 =larry2169[194]
local larry2751 =larry2750["Name"]
local larry2752, _2752_2, _2752_3 =table.find(_2161_vararg1, larry2751)
local larry2753 =larry2169[195]
local larry2754 =larry2753["Name"]
local larry2755, _2755_2, _2755_3 =table.find(_2161_vararg1, larry2754)
local larry2756 =larry2169[196]
local larry2757 =larry2756["Name"]
local larry2758, _2758_2, _2758_3 =table.find(_2161_vararg1, larry2757)
local larry2759 =larry2169[197]
local larry2760 =larry2759["Name"]
local larry2761, _2761_2, _2761_3 =table.find(_2161_vararg1, larry2760)
local larry2762 =larry2169[198]
local larry2763 =larry2762["Name"]
local larry2764, _2764_2, _2764_3 =table.find(_2161_vararg1, larry2763)
local larry2765 =larry2169[199]
local larry2766 =larry2765["Name"]
local larry2767, _2767_2, _2767_3 =table.find(_2161_vararg1, larry2766)
local larry2768 =larry2169[200]
local larry2769 =larry2768["Name"]
local larry2770, _2770_2, _2770_3 =table.find(_2161_vararg1, larry2769)
local larry2771 =larry2169[201]
local larry2772 =larry2771["Name"]
local larry2773, _2773_2, _2773_3 =table.find(_2161_vararg1, larry2772)
local larry2774 =larry2169[202]
local larry2775 =larry2774["Name"]
local larry2776, _2776_2, _2776_3 =table.find(_2161_vararg1, larry2775)
local larry2777 =larry2169[203]
local larry2778 =larry2777["Name"]
local larry2779, _2779_2, _2779_3 =table.find(_2161_vararg1, larry2778)
local larry2780 =larry2169[204]
local larry2781 =larry2780["Name"]
local larry2782, _2782_2, _2782_3 =table.find(_2161_vararg1, larry2781)
local larry2783 =larry2169[205]
local larry2784 =larry2783["Name"]
local larry2785, _2785_2, _2785_3 =table.find(_2161_vararg1, larry2784)
local larry2786 =larry2169[206]
local larry2787 =larry2786["Name"]
local larry2788, _2788_2, _2788_3 =table.find(_2161_vararg1, larry2787)
local larry2789 =larry2169[207]
local larry2790 =larry2789["Name"]
local larry2791, _2791_2, _2791_3 =table.find(_2161_vararg1, larry2790)
local larry2792 =larry2169[208]
local larry2793 =larry2792["Name"]
local larry2794, _2794_2, _2794_3 =table.find(_2161_vararg1, larry2793)
local larry2795 =larry2169[209]
local larry2796 =larry2795["Name"]
local larry2797, _2797_2, _2797_3 =table.find(_2161_vararg1, larry2796)
local larry2798 =larry2169[210]
local larry2799 =larry2798["Name"]
local larry2800, _2800_2, _2800_3 =table.find(_2161_vararg1, larry2799)
local larry2801 =larry2169[211]
local larry2802 =larry2801["Name"]
local larry2803, _2803_2, _2803_3 =table.find(_2161_vararg1, larry2802)
local larry2804 =larry2169[212]
local larry2805 =larry2804["Name"]
local larry2806, _2806_2, _2806_3 =table.find(_2161_vararg1, larry2805)
local larry2807 =larry2169[213]
local larry2808 =larry2807["Name"]
local larry2809, _2809_2, _2809_3 =table.find(_2161_vararg1, larry2808)
local larry2810 =larry2169[214]
local larry2811 =larry2810["Name"]
local larry2812, _2812_2, _2812_3 =table.find(_2161_vararg1, larry2811)
local larry2813 =larry2169[215]
local larry2814 =larry2813["Name"]
local larry2815, _2815_2, _2815_3 =table.find(_2161_vararg1, larry2814)
local larry2816 =larry2169[216]
local larry2817 =larry2816["Name"]
local larry2818, _2818_2, _2818_3 =table.find(_2161_vararg1, larry2817)
local larry2819 =larry2169[217]
local larry2820 =larry2819["Name"]
local larry2821, _2821_2, _2821_3 =table.find(_2161_vararg1, larry2820)
local larry2822 =larry2169[218]
local larry2823 =larry2822["Name"]
local larry2824, _2824_2, _2824_3 =table.find(_2161_vararg1, larry2823)
local larry2825 =larry2169[219]
local larry2826 =larry2825["Name"]
local larry2827, _2827_2, _2827_3 =table.find(_2161_vararg1, larry2826)
local larry2828 =larry2169[220]
local larry2829 =larry2828["Name"]
local larry2830, _2830_2, _2830_3 =table.find(_2161_vararg1, larry2829)
local larry2831 =larry2169[221]
local larry2832 =larry2831["Name"]
local larry2833, _2833_2, _2833_3 =table.find(_2161_vararg1, larry2832)
local larry2834 =larry2169[222]
local larry2835 =larry2834["Name"]
local larry2836, _2836_2, _2836_3 =table.find(_2161_vararg1, larry2835)
local larry2837 =larry2169[223]
local larry2838 =larry2837["Name"]
local larry2839, _2839_2, _2839_3 =table.find(_2161_vararg1, larry2838)
local larry2840 =larry2169[224]
local larry2841 =larry2840["Name"]
local larry2842, _2842_2, _2842_3 =table.find(_2161_vararg1, larry2841)
local larry2843 =larry2169[225]
local larry2844 =larry2843["Name"]
local larry2845, _2845_2, _2845_3 =table.find(_2161_vararg1, larry2844)
local larry2846 =larry2169[226]
local larry2847 =larry2846["Name"]
local larry2848, _2848_2, _2848_3 =table.find(_2161_vararg1, larry2847)
local larry2849 =larry2169[227]
local larry2850 =larry2849["Name"]
local larry2851, _2851_2, _2851_3 =table.find(_2161_vararg1, larry2850)
local larry2852 =larry2169[228]
local larry2853 =larry2852["Name"]
local larry2854, _2854_2, _2854_3 =table.find(_2161_vararg1, larry2853)
local larry2855 =larry2169[229]
local larry2856 =larry2855["Name"]
local larry2857, _2857_2, _2857_3 =table.find(_2161_vararg1, larry2856)
local larry2858 =larry2169[230]
local larry2859 =larry2858["Name"]
local larry2860, _2860_2, _2860_3 =table.find(_2161_vararg1, larry2859)
local larry2861 =larry2169[231]
local larry2862 =larry2861["Name"]
local larry2863, _2863_2, _2863_3 =table.find(_2161_vararg1, larry2862)
local larry2864 =larry2169[232]
local larry2865 =larry2864["Name"]
local larry2866, _2866_2, _2866_3 =table.find(_2161_vararg1, larry2865)
local larry2867 =larry2169[233]
local larry2868 =larry2867["Name"]
local larry2869, _2869_2, _2869_3 =table.find(_2161_vararg1, larry2868)
local larry2870 =larry2169[234]
local larry2871 =larry2870["Name"]
local er =error("Luraph Script:1409: internal 542: <larry: infinitelooperror>")
end)
local larry2163 =larry2162(larry1800, {
  ["Callback"] = function(...)
local _2164_vararg1, _2164_vararg2, _2164_vararg3, _2164_vararg4, _2164_vararg5, _2164_vararg6, _2164_vararg7, _2164_vararg8, _2164_vararg9, _2164_vararg10 = ...
local larry2165 =task["spawn"]
local larry2166 =larry2165(function(...)
local _2167_vararg1, _2167_vararg2, _2167_vararg3, _2167_vararg4, _2167_vararg5, _2167_vararg6, _2167_vararg7, _2167_vararg8, _2167_vararg9, _2167_vararg10 = ...
local larry2168 =larry2145["GetChildren"]
local larry2169 =larry2168(larry2145)
local larry2170 =#larry2169
local larry2171 =larry2169[1]
local larry2172 =larry2171["Name"]
local larry2173, _2173_2, _2173_3 =table.find(_2161_vararg1, larry2172)
local larry2174 =larry2169[2]
local larry2175 =larry2174["Name"]
local larry2176, _2176_2, _2176_3 =table.find(_2161_vararg1, larry2175)
local larry2177 =larry2169[3]
local larry2178 =larry2177["Name"]
local larry2179, _2179_2, _2179_3 =table.find(_2161_vararg1, larry2178)
local larry2180 =larry2169[4]
local larry2181 =larry2180["Name"]
local larry2182, _2182_2, _2182_3 =table.find(_2161_vararg1, larry2181)
local larry2183 =larry2169[5]
local larry2184 =larry2183["Name"]
local larry2185, _2185_2, _2185_3 =table.find(_2161_vararg1, larry2184)
local larry2186 =larry2169[6]
local larry2187 =larry2186["Name"]
local larry2188, _2188_2, _2188_3 =table.find(_2161_vararg1, larry2187)
local larry2189 =larry2169[7]
local larry2190 =larry2189["Name"]
local larry2191, _2191_2, _2191_3 =table.find(_2161_vararg1, larry2190)
local larry2192 =larry2169[8]
local larry2193 =larry2192["Name"]
local larry2194, _2194_2, _2194_3 =table.find(_2161_vararg1, larry2193)
local larry2195 =larry2169[9]
local larry2196 =larry2195["Name"]
local larry2197, _2197_2, _2197_3 =table.find(_2161_vararg1, larry2196)
local larry2198 =larry2169[10]
local larry2199 =larry2198["Name"]
local larry2200, _2200_2, _2200_3 =table.find(_2161_vararg1, larry2199)
local larry2201 =larry2169[11]
local larry2202 =larry2201["Name"]
local larry2203, _2203_2, _2203_3 =table.find(_2161_vararg1, larry2202)
local larry2204 =larry2169[12]
local larry2205 =larry2204["Name"]
local larry2206, _2206_2, _2206_3 =table.find(_2161_vararg1, larry2205)
local larry2207 =larry2169[13]
local larry2208 =larry2207["Name"]
local larry2209, _2209_2, _2209_3 =table.find(_2161_vararg1, larry2208)
local larry2210 =larry2169[14]
local larry2211 =larry2210["Name"]
local larry2212, _2212_2, _2212_3 =table.find(_2161_vararg1, larry2211)
local larry2213 =larry2169[15]
local larry2214 =larry2213["Name"]
local larry2215, _2215_2, _2215_3 =table.find(_2161_vararg1, larry2214)
local larry2216 =larry2169[16]
local larry2217 =larry2216["Name"]
local larry2218, _2218_2, _2218_3 =table.find(_2161_vararg1, larry2217)
local larry2219 =larry2169[17]
local larry2220 =larry2219["Name"]
local larry2221, _2221_2, _2221_3 =table.find(_2161_vararg1, larry2220)
local larry2222 =larry2169[18]
local larry2223 =larry2222["Name"]
local larry2224, _2224_2, _2224_3 =table.find(_2161_vararg1, larry2223)
local larry2225 =larry2169[19]
local larry2226 =larry2225["Name"]
local larry2227, _2227_2, _2227_3 =table.find(_2161_vararg1, larry2226)
local larry2228 =larry2169[20]
local larry2229 =larry2228["Name"]
local larry2230, _2230_2, _2230_3 =table.find(_2161_vararg1, larry2229)
local larry2231 =larry2169[21]
local larry2232 =larry2231["Name"]
local larry2233, _2233_2, _2233_3 =table.find(_2161_vararg1, larry2232)
local larry2234 =larry2169[22]
local larry2235 =larry2234["Name"]
local larry2236, _2236_2, _2236_3 =table.find(_2161_vararg1, larry2235)
local larry2237 =larry2169[23]
local larry2238 =larry2237["Name"]
local larry2239, _2239_2, _2239_3 =table.find(_2161_vararg1, larry2238)
local larry2240 =larry2169[24]
local larry2241 =larry2240["Name"]
local larry2242, _2242_2, _2242_3 =table.find(_2161_vararg1, larry2241)
local larry2243 =larry2169[25]
local larry2244 =larry2243["Name"]
local larry2245, _2245_2, _2245_3 =table.find(_2161_vararg1, larry2244)
local larry2246 =larry2169[26]
local larry2247 =larry2246["Name"]
local larry2248, _2248_2, _2248_3 =table.find(_2161_vararg1, larry2247)
local larry2249 =larry2169[27]
local larry2250 =larry2249["Name"]
local larry2251, _2251_2, _2251_3 =table.find(_2161_vararg1, larry2250)
local larry2252 =larry2169[28]
local larry2253 =larry2252["Name"]
local larry2254, _2254_2, _2254_3 =table.find(_2161_vararg1, larry2253)
local larry2255 =larry2169[29]
local larry2256 =larry2255["Name"]
local larry2257, _2257_2, _2257_3 =table.find(_2161_vararg1, larry2256)
local larry2258 =larry2169[30]
local larry2259 =larry2258["Name"]
local larry2260, _2260_2, _2260_3 =table.find(_2161_vararg1, larry2259)
local larry2261 =larry2169[31]
local larry2262 =larry2261["Name"]
local larry2263, _2263_2, _2263_3 =table.find(_2161_vararg1, larry2262)
local larry2264 =larry2169[32]
local larry2265 =larry2264["Name"]
local larry2266, _2266_2, _2266_3 =table.find(_2161_vararg1, larry2265)
local larry2267 =larry2169[33]
local larry2268 =larry2267["Name"]
local larry2269, _2269_2, _2269_3 =table.find(_2161_vararg1, larry2268)
local larry2270 =larry2169[34]
local larry2271 =larry2270["Name"]
local larry2272, _2272_2, _2272_3 =table.find(_2161_vararg1, larry2271)
local larry2273 =larry2169[35]
local larry2274 =larry2273["Name"]
local larry2275, _2275_2, _2275_3 =table.find(_2161_vararg1, larry2274)
local larry2276 =larry2169[36]
local larry2277 =larry2276["Name"]
local larry2278, _2278_2, _2278_3 =table.find(_2161_vararg1, larry2277)
local larry2279 =larry2169[37]
local larry2280 =larry2279["Name"]
local larry2281, _2281_2, _2281_3 =table.find(_2161_vararg1, larry2280)
local larry2282 =larry2169[38]
local larry2283 =larry2282["Name"]
local larry2284, _2284_2, _2284_3 =table.find(_2161_vararg1, larry2283)
local larry2285 =larry2169[39]
local larry2286 =larry2285["Name"]
local larry2287, _2287_2, _2287_3 =table.find(_2161_vararg1, larry2286)
local larry2288 =larry2169[40]
local larry2289 =larry2288["Name"]
local larry2290, _2290_2, _2290_3 =table.find(_2161_vararg1, larry2289)
local larry2291 =larry2169[41]
local larry2292 =larry2291["Name"]
local larry2293, _2293_2, _2293_3 =table.find(_2161_vararg1, larry2292)
local larry2294 =larry2169[42]
local larry2295 =larry2294["Name"]
local larry2296, _2296_2, _2296_3 =table.find(_2161_vararg1, larry2295)
local larry2297 =larry2169[43]
local larry2298 =larry2297["Name"]
local larry2299, _2299_2, _2299_3 =table.find(_2161_vararg1, larry2298)
local larry2300 =larry2169[44]
local larry2301 =larry2300["Name"]
local larry2302, _2302_2, _2302_3 =table.find(_2161_vararg1, larry2301)
local larry2303 =larry2169[45]
local larry2304 =larry2303["Name"]
local larry2305, _2305_2, _2305_3 =table.find(_2161_vararg1, larry2304)
local larry2306 =larry2169[46]
local larry2307 =larry2306["Name"]
local larry2308, _2308_2, _2308_3 =table.find(_2161_vararg1, larry2307)
local larry2309 =larry2169[47]
local larry2310 =larry2309["Name"]
local larry2311, _2311_2, _2311_3 =table.find(_2161_vararg1, larry2310)
local larry2312 =larry2169[48]
local larry2313 =larry2312["Name"]
local larry2314, _2314_2, _2314_3 =table.find(_2161_vararg1, larry2313)
local larry2315 =larry2169[49]
local larry2316 =larry2315["Name"]
local larry2317, _2317_2, _2317_3 =table.find(_2161_vararg1, larry2316)
local larry2318 =larry2169[50]
local larry2319 =larry2318["Name"]
local larry2320, _2320_2, _2320_3 =table.find(_2161_vararg1, larry2319)
local larry2321 =larry2169[51]
local larry2322 =larry2321["Name"]
local larry2323, _2323_2, _2323_3 =table.find(_2161_vararg1, larry2322)
local larry2324 =larry2169[52]
local larry2325 =larry2324["Name"]
local larry2326, _2326_2, _2326_3 =table.find(_2161_vararg1, larry2325)
local larry2327 =larry2169[53]
local larry2328 =larry2327["Name"]
local larry2329, _2329_2, _2329_3 =table.find(_2161_vararg1, larry2328)
local larry2330 =larry2169[54]
local larry2331 =larry2330["Name"]
local larry2332, _2332_2, _2332_3 =table.find(_2161_vararg1, larry2331)
local larry2333 =larry2169[55]
local larry2334 =larry2333["Name"]
local larry2335, _2335_2, _2335_3 =table.find(_2161_vararg1, larry2334)
local larry2336 =larry2169[56]
local larry2337 =larry2336["Name"]
local larry2338, _2338_2, _2338_3 =table.find(_2161_vararg1, larry2337)
local larry2339 =larry2169[57]
local larry2340 =larry2339["Name"]
local larry2341, _2341_2, _2341_3 =table.find(_2161_vararg1, larry2340)
local larry2342 =larry2169[58]
local larry2343 =larry2342["Name"]
local larry2344, _2344_2, _2344_3 =table.find(_2161_vararg1, larry2343)
local larry2345 =larry2169[59]
local larry2346 =larry2345["Name"]
local larry2347, _2347_2, _2347_3 =table.find(_2161_vararg1, larry2346)
local larry2348 =larry2169[60]
local larry2349 =larry2348["Name"]
local larry2350, _2350_2, _2350_3 =table.find(_2161_vararg1, larry2349)
local larry2351 =larry2169[61]
local larry2352 =larry2351["Name"]
local larry2353, _2353_2, _2353_3 =table.find(_2161_vararg1, larry2352)
local larry2354 =larry2169[62]
local larry2355 =larry2354["Name"]
local larry2356, _2356_2, _2356_3 =table.find(_2161_vararg1, larry2355)
local larry2357 =larry2169[63]
local larry2358 =larry2357["Name"]
local larry2359, _2359_2, _2359_3 =table.find(_2161_vararg1, larry2358)
local larry2360 =larry2169[64]
local larry2361 =larry2360["Name"]
local larry2362, _2362_2, _2362_3 =table.find(_2161_vararg1, larry2361)
local larry2363 =larry2169[65]
local larry2364 =larry2363["Name"]
local larry2365, _2365_2, _2365_3 =table.find(_2161_vararg1, larry2364)
local larry2366 =larry2169[66]
local larry2367 =larry2366["Name"]
local larry2368, _2368_2, _2368_3 =table.find(_2161_vararg1, larry2367)
local larry2369 =larry2169[67]
local larry2370 =larry2369["Name"]
local larry2371, _2371_2, _2371_3 =table.find(_2161_vararg1, larry2370)
local larry2372 =larry2169[68]
local larry2373 =larry2372["Name"]
local larry2374, _2374_2, _2374_3 =table.find(_2161_vararg1, larry2373)
local larry2375 =larry2169[69]
local larry2376 =larry2375["Name"]
local larry2377, _2377_2, _2377_3 =table.find(_2161_vararg1, larry2376)
local larry2378 =larry2169[70]
local larry2379 =larry2378["Name"]
local larry2380, _2380_2, _2380_3 =table.find(_2161_vararg1, larry2379)
local larry2381 =larry2169[71]
local larry2382 =larry2381["Name"]
local larry2383, _2383_2, _2383_3 =table.find(_2161_vararg1, larry2382)
local larry2384 =larry2169[72]
local larry2385 =larry2384["Name"]
local larry2386, _2386_2, _2386_3 =table.find(_2161_vararg1, larry2385)
local larry2387 =larry2169[73]
local larry2388 =larry2387["Name"]
local larry2389, _2389_2, _2389_3 =table.find(_2161_vararg1, larry2388)
local larry2390 =larry2169[74]
local larry2391 =larry2390["Name"]
local larry2392, _2392_2, _2392_3 =table.find(_2161_vararg1, larry2391)
local larry2393 =larry2169[75]
local larry2394 =larry2393["Name"]
local larry2395, _2395_2, _2395_3 =table.find(_2161_vararg1, larry2394)
local larry2396 =larry2169[76]
local larry2397 =larry2396["Name"]
local larry2398, _2398_2, _2398_3 =table.find(_2161_vararg1, larry2397)
local larry2399 =larry2169[77]
local larry2400 =larry2399["Name"]
local larry2401, _2401_2, _2401_3 =table.find(_2161_vararg1, larry2400)
local larry2402 =larry2169[78]
local larry2403 =larry2402["Name"]
local larry2404, _2404_2, _2404_3 =table.find(_2161_vararg1, larry2403)
local larry2405 =larry2169[79]
local larry2406 =larry2405["Name"]
local larry2407, _2407_2, _2407_3 =table.find(_2161_vararg1, larry2406)
local larry2408 =larry2169[80]
local larry2409 =larry2408["Name"]
local larry2410, _2410_2, _2410_3 =table.find(_2161_vararg1, larry2409)
local larry2411 =larry2169[81]
local larry2412 =larry2411["Name"]
local larry2413, _2413_2, _2413_3 =table.find(_2161_vararg1, larry2412)
local larry2414 =larry2169[82]
local larry2415 =larry2414["Name"]
local larry2416, _2416_2, _2416_3 =table.find(_2161_vararg1, larry2415)
local larry2417 =larry2169[83]
local larry2418 =larry2417["Name"]
local larry2419, _2419_2, _2419_3 =table.find(_2161_vararg1, larry2418)
local larry2420 =larry2169[84]
local larry2421 =larry2420["Name"]
local larry2422, _2422_2, _2422_3 =table.find(_2161_vararg1, larry2421)
local larry2423 =larry2169[85]
local larry2424 =larry2423["Name"]
local larry2425, _2425_2, _2425_3 =table.find(_2161_vararg1, larry2424)
local larry2426 =larry2169[86]
local larry2427 =larry2426["Name"]
local larry2428, _2428_2, _2428_3 =table.find(_2161_vararg1, larry2427)
local larry2429 =larry2169[87]
local larry2430 =larry2429["Name"]
local larry2431, _2431_2, _2431_3 =table.find(_2161_vararg1, larry2430)
local larry2432 =larry2169[88]
local larry2433 =larry2432["Name"]
local larry2434, _2434_2, _2434_3 =table.find(_2161_vararg1, larry2433)
local larry2435 =larry2169[89]
local larry2436 =larry2435["Name"]
local larry2437, _2437_2, _2437_3 =table.find(_2161_vararg1, larry2436)
local larry2438 =larry2169[90]
local larry2439 =larry2438["Name"]
local larry2440, _2440_2, _2440_3 =table.find(_2161_vararg1, larry2439)
local larry2441 =larry2169[91]
local larry2442 =larry2441["Name"]
local larry2443, _2443_2, _2443_3 =table.find(_2161_vararg1, larry2442)
local larry2444 =larry2169[92]
local larry2445 =larry2444["Name"]
local larry2446, _2446_2, _2446_3 =table.find(_2161_vararg1, larry2445)
local larry2447 =larry2169[93]
local larry2448 =larry2447["Name"]
local larry2449, _2449_2, _2449_3 =table.find(_2161_vararg1, larry2448)
local larry2450 =larry2169[94]
local larry2451 =larry2450["Name"]
local larry2452, _2452_2, _2452_3 =table.find(_2161_vararg1, larry2451)
local larry2453 =larry2169[95]
local larry2454 =larry2453["Name"]
local larry2455, _2455_2, _2455_3 =table.find(_2161_vararg1, larry2454)
local larry2456 =larry2169[96]
local larry2457 =larry2456["Name"]
local larry2458, _2458_2, _2458_3 =table.find(_2161_vararg1, larry2457)
local larry2459 =larry2169[97]
local larry2460 =larry2459["Name"]
local larry2461, _2461_2, _2461_3 =table.find(_2161_vararg1, larry2460)
local larry2462 =larry2169[98]
local larry2463 =larry2462["Name"]
local larry2464, _2464_2, _2464_3 =table.find(_2161_vararg1, larry2463)
local larry2465 =larry2169[99]
local larry2466 =larry2465["Name"]
local larry2467, _2467_2, _2467_3 =table.find(_2161_vararg1, larry2466)
local larry2468 =larry2169[100]
local larry2469 =larry2468["Name"]
local larry2470, _2470_2, _2470_3 =table.find(_2161_vararg1, larry2469)
local larry2471 =larry2169[101]
local larry2472 =larry2471["Name"]
local larry2473, _2473_2, _2473_3 =table.find(_2161_vararg1, larry2472)
local larry2474 =larry2169[102]
local larry2475 =larry2474["Name"]
local larry2476, _2476_2, _2476_3 =table.find(_2161_vararg1, larry2475)
local larry2477 =larry2169[103]
local larry2478 =larry2477["Name"]
local larry2479, _2479_2, _2479_3 =table.find(_2161_vararg1, larry2478)
local larry2480 =larry2169[104]
local larry2481 =larry2480["Name"]
local larry2482, _2482_2, _2482_3 =table.find(_2161_vararg1, larry2481)
local larry2483 =larry2169[105]
local larry2484 =larry2483["Name"]
local larry2485, _2485_2, _2485_3 =table.find(_2161_vararg1, larry2484)
local larry2486 =larry2169[106]
local larry2487 =larry2486["Name"]
local larry2488, _2488_2, _2488_3 =table.find(_2161_vararg1, larry2487)
local larry2489 =larry2169[107]
local larry2490 =larry2489["Name"]
local larry2491, _2491_2, _2491_3 =table.find(_2161_vararg1, larry2490)
local larry2492 =larry2169[108]
local larry2493 =larry2492["Name"]
local larry2494, _2494_2, _2494_3 =table.find(_2161_vararg1, larry2493)
local larry2495 =larry2169[109]
local larry2496 =larry2495["Name"]
local larry2497, _2497_2, _2497_3 =table.find(_2161_vararg1, larry2496)
local larry2498 =larry2169[110]
local larry2499 =larry2498["Name"]
local larry2500, _2500_2, _2500_3 =table.find(_2161_vararg1, larry2499)
local larry2501 =larry2169[111]
local larry2502 =larry2501["Name"]
local larry2503, _2503_2, _2503_3 =table.find(_2161_vararg1, larry2502)
local larry2504 =larry2169[112]
local larry2505 =larry2504["Name"]
local larry2506, _2506_2, _2506_3 =table.find(_2161_vararg1, larry2505)
local larry2507 =larry2169[113]
local larry2508 =larry2507["Name"]
local larry2509, _2509_2, _2509_3 =table.find(_2161_vararg1, larry2508)
local larry2510 =larry2169[114]
local larry2511 =larry2510["Name"]
local larry2512, _2512_2, _2512_3 =table.find(_2161_vararg1, larry2511)
local larry2513 =larry2169[115]
local larry2514 =larry2513["Name"]
local larry2515, _2515_2, _2515_3 =table.find(_2161_vararg1, larry2514)
local larry2516 =larry2169[116]
local larry2517 =larry2516["Name"]
local larry2518, _2518_2, _2518_3 =table.find(_2161_vararg1, larry2517)
local larry2519 =larry2169[117]
local larry2520 =larry2519["Name"]
local larry2521, _2521_2, _2521_3 =table.find(_2161_vararg1, larry2520)
local larry2522 =larry2169[118]
local larry2523 =larry2522["Name"]
local larry2524, _2524_2, _2524_3 =table.find(_2161_vararg1, larry2523)
local larry2525 =larry2169[119]
local larry2526 =larry2525["Name"]
local larry2527, _2527_2, _2527_3 =table.find(_2161_vararg1, larry2526)
local larry2528 =larry2169[120]
local larry2529 =larry2528["Name"]
local larry2530, _2530_2, _2530_3 =table.find(_2161_vararg1, larry2529)
local larry2531 =larry2169[121]
local larry2532 =larry2531["Name"]
local larry2533, _2533_2, _2533_3 =table.find(_2161_vararg1, larry2532)
local larry2534 =larry2169[122]
local larry2535 =larry2534["Name"]
local larry2536, _2536_2, _2536_3 =table.find(_2161_vararg1, larry2535)
local larry2537 =larry2169[123]
local larry2538 =larry2537["Name"]
local larry2539, _2539_2, _2539_3 =table.find(_2161_vararg1, larry2538)
local larry2540 =larry2169[124]
local larry2541 =larry2540["Name"]
local larry2542, _2542_2, _2542_3 =table.find(_2161_vararg1, larry2541)
local larry2543 =larry2169[125]
local larry2544 =larry2543["Name"]
local larry2545, _2545_2, _2545_3 =table.find(_2161_vararg1, larry2544)
local larry2546 =larry2169[126]
local larry2547 =larry2546["Name"]
local larry2548, _2548_2, _2548_3 =table.find(_2161_vararg1, larry2547)
local larry2549 =larry2169[127]
local larry2550 =larry2549["Name"]
local larry2551, _2551_2, _2551_3 =table.find(_2161_vararg1, larry2550)
local larry2552 =larry2169[128]
local larry2553 =larry2552["Name"]
local larry2554, _2554_2, _2554_3 =table.find(_2161_vararg1, larry2553)
local larry2555 =larry2169[129]
local larry2556 =larry2555["Name"]
local larry2557, _2557_2, _2557_3 =table.find(_2161_vararg1, larry2556)
local larry2558 =larry2169[130]
local larry2559 =larry2558["Name"]
local larry2560, _2560_2, _2560_3 =table.find(_2161_vararg1, larry2559)
local larry2561 =larry2169[131]
local larry2562 =larry2561["Name"]
local larry2563, _2563_2, _2563_3 =table.find(_2161_vararg1, larry2562)
local larry2564 =larry2169[132]
local larry2565 =larry2564["Name"]
local larry2566, _2566_2, _2566_3 =table.find(_2161_vararg1, larry2565)
local larry2567 =larry2169[133]
local larry2568 =larry2567["Name"]
local larry2569, _2569_2, _2569_3 =table.find(_2161_vararg1, larry2568)
local larry2570 =larry2169[134]
local larry2571 =larry2570["Name"]
local larry2572, _2572_2, _2572_3 =table.find(_2161_vararg1, larry2571)
local larry2573 =larry2169[135]
local larry2574 =larry2573["Name"]
local larry2575, _2575_2, _2575_3 =table.find(_2161_vararg1, larry2574)
local larry2576 =larry2169[136]
local larry2577 =larry2576["Name"]
local larry2578, _2578_2, _2578_3 =table.find(_2161_vararg1, larry2577)
local larry2579 =larry2169[137]
local larry2580 =larry2579["Name"]
local larry2581, _2581_2, _2581_3 =table.find(_2161_vararg1, larry2580)
local larry2582 =larry2169[138]
local larry2583 =larry2582["Name"]
local larry2584, _2584_2, _2584_3 =table.find(_2161_vararg1, larry2583)
local larry2585 =larry2169[139]
local larry2586 =larry2585["Name"]
local larry2587, _2587_2, _2587_3 =table.find(_2161_vararg1, larry2586)
local larry2588 =larry2169[140]
local larry2589 =larry2588["Name"]
local larry2590, _2590_2, _2590_3 =table.find(_2161_vararg1, larry2589)
local larry2591 =larry2169[141]
local larry2592 =larry2591["Name"]
local larry2593, _2593_2, _2593_3 =table.find(_2161_vararg1, larry2592)
local larry2594 =larry2169[142]
local larry2595 =larry2594["Name"]
local larry2596, _2596_2, _2596_3 =table.find(_2161_vararg1, larry2595)
local larry2597 =larry2169[143]
local larry2598 =larry2597["Name"]
local larry2599, _2599_2, _2599_3 =table.find(_2161_vararg1, larry2598)
local larry2600 =larry2169[144]
local larry2601 =larry2600["Name"]
local larry2602, _2602_2, _2602_3 =table.find(_2161_vararg1, larry2601)
local larry2603 =larry2169[145]
local larry2604 =larry2603["Name"]
local larry2605, _2605_2, _2605_3 =table.find(_2161_vararg1, larry2604)
local larry2606 =larry2169[146]
local larry2607 =larry2606["Name"]
local larry2608, _2608_2, _2608_3 =table.find(_2161_vararg1, larry2607)
local larry2609 =larry2169[147]
local larry2610 =larry2609["Name"]
local larry2611, _2611_2, _2611_3 =table.find(_2161_vararg1, larry2610)
local larry2612 =larry2169[148]
local larry2613 =larry2612["Name"]
local larry2614, _2614_2, _2614_3 =table.find(_2161_vararg1, larry2613)
local larry2615 =larry2169[149]
local larry2616 =larry2615["Name"]
local larry2617, _2617_2, _2617_3 =table.find(_2161_vararg1, larry2616)
local larry2618 =larry2169[150]
local larry2619 =larry2618["Name"]
local larry2620, _2620_2, _2620_3 =table.find(_2161_vararg1, larry2619)
local larry2621 =larry2169[151]
local larry2622 =larry2621["Name"]
local larry2623, _2623_2, _2623_3 =table.find(_2161_vararg1, larry2622)
local larry2624 =larry2169[152]
local larry2625 =larry2624["Name"]
local larry2626, _2626_2, _2626_3 =table.find(_2161_vararg1, larry2625)
local larry2627 =larry2169[153]
local larry2628 =larry2627["Name"]
local larry2629, _2629_2, _2629_3 =table.find(_2161_vararg1, larry2628)
local larry2630 =larry2169[154]
local larry2631 =larry2630["Name"]
local larry2632, _2632_2, _2632_3 =table.find(_2161_vararg1, larry2631)
local larry2633 =larry2169[155]
local larry2634 =larry2633["Name"]
local larry2635, _2635_2, _2635_3 =table.find(_2161_vararg1, larry2634)
local larry2636 =larry2169[156]
local larry2637 =larry2636["Name"]
local larry2638, _2638_2, _2638_3 =table.find(_2161_vararg1, larry2637)
local larry2639 =larry2169[157]
local larry2640 =larry2639["Name"]
local larry2641, _2641_2, _2641_3 =table.find(_2161_vararg1, larry2640)
local larry2642 =larry2169[158]
local larry2643 =larry2642["Name"]
local larry2644, _2644_2, _2644_3 =table.find(_2161_vararg1, larry2643)
local larry2645 =larry2169[159]
local larry2646 =larry2645["Name"]
local larry2647, _2647_2, _2647_3 =table.find(_2161_vararg1, larry2646)
local larry2648 =larry2169[160]
local larry2649 =larry2648["Name"]
local larry2650, _2650_2, _2650_3 =table.find(_2161_vararg1, larry2649)
local larry2651 =larry2169[161]
local larry2652 =larry2651["Name"]
local larry2653, _2653_2, _2653_3 =table.find(_2161_vararg1, larry2652)
local larry2654 =larry2169[162]
local larry2655 =larry2654["Name"]
local larry2656, _2656_2, _2656_3 =table.find(_2161_vararg1, larry2655)
local larry2657 =larry2169[163]
local larry2658 =larry2657["Name"]
local larry2659, _2659_2, _2659_3 =table.find(_2161_vararg1, larry2658)
local larry2660 =larry2169[164]
local larry2661 =larry2660["Name"]
local larry2662, _2662_2, _2662_3 =table.find(_2161_vararg1, larry2661)
local larry2663 =larry2169[165]
local larry2664 =larry2663["Name"]
local larry2665, _2665_2, _2665_3 =table.find(_2161_vararg1, larry2664)
local larry2666 =larry2169[166]
local larry2667 =larry2666["Name"]
local larry2668, _2668_2, _2668_3 =table.find(_2161_vararg1, larry2667)
local larry2669 =larry2169[167]
local larry2670 =larry2669["Name"]
local larry2671, _2671_2, _2671_3 =table.find(_2161_vararg1, larry2670)
local larry2672 =larry2169[168]
local larry2673 =larry2672["Name"]
local larry2674, _2674_2, _2674_3 =table.find(_2161_vararg1, larry2673)
local larry2675 =larry2169[169]
local larry2676 =larry2675["Name"]
local larry2677, _2677_2, _2677_3 =table.find(_2161_vararg1, larry2676)
local larry2678 =larry2169[170]
local larry2679 =larry2678["Name"]
local larry2680, _2680_2, _2680_3 =table.find(_2161_vararg1, larry2679)
local larry2681 =larry2169[171]
local larry2682 =larry2681["Name"]
local larry2683, _2683_2, _2683_3 =table.find(_2161_vararg1, larry2682)
local larry2684 =larry2169[172]
local larry2685 =larry2684["Name"]
local larry2686, _2686_2, _2686_3 =table.find(_2161_vararg1, larry2685)
local larry2687 =larry2169[173]
local larry2688 =larry2687["Name"]
local larry2689, _2689_2, _2689_3 =table.find(_2161_vararg1, larry2688)
local larry2690 =larry2169[174]
local larry2691 =larry2690["Name"]
local larry2692, _2692_2, _2692_3 =table.find(_2161_vararg1, larry2691)
local larry2693 =larry2169[175]
local larry2694 =larry2693["Name"]
local larry2695, _2695_2, _2695_3 =table.find(_2161_vararg1, larry2694)
local larry2696 =larry2169[176]
local larry2697 =larry2696["Name"]
local larry2698, _2698_2, _2698_3 =table.find(_2161_vararg1, larry2697)
local larry2699 =larry2169[177]
local larry2700 =larry2699["Name"]
local larry2701, _2701_2, _2701_3 =table.find(_2161_vararg1, larry2700)
local larry2702 =larry2169[178]
local larry2703 =larry2702["Name"]
local larry2704, _2704_2, _2704_3 =table.find(_2161_vararg1, larry2703)
local larry2705 =larry2169[179]
local larry2706 =larry2705["Name"]
local larry2707, _2707_2, _2707_3 =table.find(_2161_vararg1, larry2706)
local larry2708 =larry2169[180]
local larry2709 =larry2708["Name"]
local larry2710, _2710_2, _2710_3 =table.find(_2161_vararg1, larry2709)
local larry2711 =larry2169[181]
local larry2712 =larry2711["Name"]
local larry2713, _2713_2, _2713_3 =table.find(_2161_vararg1, larry2712)
local larry2714 =larry2169[182]
local larry2715 =larry2714["Name"]
local larry2716, _2716_2, _2716_3 =table.find(_2161_vararg1, larry2715)
local larry2717 =larry2169[183]
local larry2718 =larry2717["Name"]
local larry2719, _2719_2, _2719_3 =table.find(_2161_vararg1, larry2718)
local larry2720 =larry2169[184]
local larry2721 =larry2720["Name"]
local larry2722, _2722_2, _2722_3 =table.find(_2161_vararg1, larry2721)
local larry2723 =larry2169[185]
local larry2724 =larry2723["Name"]
local larry2725, _2725_2, _2725_3 =table.find(_2161_vararg1, larry2724)
local larry2726 =larry2169[186]
local larry2727 =larry2726["Name"]
local larry2728, _2728_2, _2728_3 =table.find(_2161_vararg1, larry2727)
local larry2729 =larry2169[187]
local larry2730 =larry2729["Name"]
local larry2731, _2731_2, _2731_3 =table.find(_2161_vararg1, larry2730)
local larry2732 =larry2169[188]
local larry2733 =larry2732["Name"]
local larry2734, _2734_2, _2734_3 =table.find(_2161_vararg1, larry2733)
local larry2735 =larry2169[189]
local larry2736 =larry2735["Name"]
local larry2737, _2737_2, _2737_3 =table.find(_2161_vararg1, larry2736)
local larry2738 =larry2169[190]
local larry2739 =larry2738["Name"]
local larry2740, _2740_2, _2740_3 =table.find(_2161_vararg1, larry2739)
local larry2741 =larry2169[191]
local larry2742 =larry2741["Name"]
local larry2743, _2743_2, _2743_3 =table.find(_2161_vararg1, larry2742)
local larry2744 =larry2169[192]
local larry2745 =larry2744["Name"]
local larry2746, _2746_2, _2746_3 =table.find(_2161_vararg1, larry2745)
local larry2747 =larry2169[193]
local larry2748 =larry2747["Name"]
local larry2749, _2749_2, _2749_3 =table.find(_2161_vararg1, larry2748)
local larry2750 =larry2169[194]
local larry2751 =larry2750["Name"]
local larry2752, _2752_2, _2752_3 =table.find(_2161_vararg1, larry2751)
local larry2753 =larry2169[195]
local larry2754 =larry2753["Name"]
local larry2755, _2755_2, _2755_3 =table.find(_2161_vararg1, larry2754)
local larry2756 =larry2169[196]
local larry2757 =larry2756["Name"]
local larry2758, _2758_2, _2758_3 =table.find(_2161_vararg1, larry2757)
local larry2759 =larry2169[197]
local larry2760 =larry2759["Name"]
local larry2761, _2761_2, _2761_3 =table.find(_2161_vararg1, larry2760)
local larry2762 =larry2169[198]
local larry2763 =larry2762["Name"]
local larry2764, _2764_2, _2764_3 =table.find(_2161_vararg1, larry2763)
local larry2765 =larry2169[199]
local larry2766 =larry2765["Name"]
local larry2767, _2767_2, _2767_3 =table.find(_2161_vararg1, larry2766)
local larry2768 =larry2169[200]
local larry2769 =larry2768["Name"]
local larry2770, _2770_2, _2770_3 =table.find(_2161_vararg1, larry2769)
local larry2771 =larry2169[201]
local larry2772 =larry2771["Name"]
local larry2773, _2773_2, _2773_3 =table.find(_2161_vararg1, larry2772)
local larry2774 =larry2169[202]
local larry2775 =larry2774["Name"]
local larry2776, _2776_2, _2776_3 =table.find(_2161_vararg1, larry2775)
local larry2777 =larry2169[203]
local larry2778 =larry2777["Name"]
local larry2779, _2779_2, _2779_3 =table.find(_2161_vararg1, larry2778)
local larry2780 =larry2169[204]
local larry2781 =larry2780["Name"]
local larry2782, _2782_2, _2782_3 =table.find(_2161_vararg1, larry2781)
local larry2783 =larry2169[205]
local larry2784 =larry2783["Name"]
local larry2785, _2785_2, _2785_3 =table.find(_2161_vararg1, larry2784)
local larry2786 =larry2169[206]
local larry2787 =larry2786["Name"]
local larry2788, _2788_2, _2788_3 =table.find(_2161_vararg1, larry2787)
local larry2789 =larry2169[207]
local larry2790 =larry2789["Name"]
local larry2791, _2791_2, _2791_3 =table.find(_2161_vararg1, larry2790)
local larry2792 =larry2169[208]
local larry2793 =larry2792["Name"]
local larry2794, _2794_2, _2794_3 =table.find(_2161_vararg1, larry2793)
local larry2795 =larry2169[209]
local larry2796 =larry2795["Name"]
local larry2797, _2797_2, _2797_3 =table.find(_2161_vararg1, larry2796)
local larry2798 =larry2169[210]
local larry2799 =larry2798["Name"]
local larry2800, _2800_2, _2800_3 =table.find(_2161_vararg1, larry2799)
local larry2801 =larry2169[211]
local larry2802 =larry2801["Name"]
local larry2803, _2803_2, _2803_3 =table.find(_2161_vararg1, larry2802)
local larry2804 =larry2169[212]
local larry2805 =larry2804["Name"]
local larry2806, _2806_2, _2806_3 =table.find(_2161_vararg1, larry2805)
local larry2807 =larry2169[213]
local larry2808 =larry2807["Name"]
local larry2809, _2809_2, _2809_3 =table.find(_2161_vararg1, larry2808)
local larry2810 =larry2169[214]
local larry2811 =larry2810["Name"]
local larry2812, _2812_2, _2812_3 =table.find(_2161_vararg1, larry2811)
local larry2813 =larry2169[215]
local larry2814 =larry2813["Name"]
local larry2815, _2815_2, _2815_3 =table.find(_2161_vararg1, larry2814)
local larry2816 =larry2169[216]
local larry2817 =larry2816["Name"]
local larry2818, _2818_2, _2818_3 =table.find(_2161_vararg1, larry2817)
local larry2819 =larry2169[217]
local larry2820 =larry2819["Name"]
local larry2821, _2821_2, _2821_3 =table.find(_2161_vararg1, larry2820)
local larry2822 =larry2169[218]
local larry2823 =larry2822["Name"]
local larry2824, _2824_2, _2824_3 =table.find(_2161_vararg1, larry2823)
local larry2825 =larry2169[219]
local larry2826 =larry2825["Name"]
local larry2827, _2827_2, _2827_3 =table.find(_2161_vararg1, larry2826)
local larry2828 =larry2169[220]
local larry2829 =larry2828["Name"]
local larry2830, _2830_2, _2830_3 =table.find(_2161_vararg1, larry2829)
local larry2831 =larry2169[221]
local larry2832 =larry2831["Name"]
local larry2833, _2833_2, _2833_3 =table.find(_2161_vararg1, larry2832)
local larry2834 =larry2169[222]
local larry2835 =larry2834["Name"]
local larry2836, _2836_2, _2836_3 =table.find(_2161_vararg1, larry2835)
local larry2837 =larry2169[223]
local larry2838 =larry2837["Name"]
local larry2839, _2839_2, _2839_3 =table.find(_2161_vararg1, larry2838)
local larry2840 =larry2169[224]
local larry2841 =larry2840["Name"]
local larry2842, _2842_2, _2842_3 =table.find(_2161_vararg1, larry2841)
local larry2843 =larry2169[225]
local larry2844 =larry2843["Name"]
local larry2845, _2845_2, _2845_3 =table.find(_2161_vararg1, larry2844)
local larry2846 =larry2169[226]
local larry2847 =larry2846["Name"]
local larry2848, _2848_2, _2848_3 =table.find(_2161_vararg1, larry2847)
local larry2849 =larry2169[227]
local larry2850 =larry2849["Name"]
local larry2851, _2851_2, _2851_3 =table.find(_2161_vararg1, larry2850)
local larry2852 =larry2169[228]
local larry2853 =larry2852["Name"]
local larry2854, _2854_2, _2854_3 =table.find(_2161_vararg1, larry2853)
local larry2855 =larry2169[229]
local larry2856 =larry2855["Name"]
local larry2857, _2857_2, _2857_3 =table.find(_2161_vararg1, larry2856)
local larry2858 =larry2169[230]
local larry2859 =larry2858["Name"]
local larry2860, _2860_2, _2860_3 =table.find(_2161_vararg1, larry2859)
local larry2861 =larry2169[231]
local larry2862 =larry2861["Name"]
local larry2863, _2863_2, _2863_3 =table.find(_2161_vararg1, larry2862)
local larry2864 =larry2169[232]
local larry2865 =larry2864["Name"]
local larry2866, _2866_2, _2866_3 =table.find(_2161_vararg1, larry2865)
local larry2867 =larry2169[233]
local larry2868 =larry2867["Name"]
local larry2869, _2869_2, _2869_3 =table.find(_2161_vararg1, larry2868)
local larry2870 =larry2169[234]
local larry2871 =larry2870["Name"]
local er =error("Luraph Script:1409: internal 542: <larry: infinitelooperror>")
end)
end,
  ["Default"] = false,
  ["Title"] = "Auto Crockpot",
  ["Desc"] = "Auto Make Stews Basically",
})
local larry2873 =game["GetService"]
local larry2874 =larry2873(game, "Players")
local larry2875 =game["GetService"]
local larry2876 =larry2875(game, "Lighting")
local larry2877 =game["GetService"]
local larry2878 =larry2877(game, "RunService")
local larry2879 =larry2874["LocalPlayer"]
local larry2880 =Vector3["new"]
local larry2881 =larry2880(0, 10, 0)
local larry2882 =larry1800["Toggle"]
local larry2883 =larry2882(larry1800, {
  ["Callback"] = function(...)
local _2884_vararg1, _2884_vararg2, _2884_vararg3, _2884_vararg4, _2884_vararg5, _2884_vararg6, _2884_vararg7, _2884_vararg8, _2884_vararg9, _2884_vararg10 = ...

end,
  ["Default"] = false,
  ["Title"] = "Teleport to camp at night",
})
local larry2885 =larry2878["RenderStepped"]
local larry2886 =larry2885["Connect"]
local larry2889 =larry2879["Character"]
local larry2890 =larry2889["FindFirstChild"]
local larry2891 =larry2890(larry2889, "HumanoidRootPart")
local larry2892 =larry2876["ClockTime"]
local er =error("Luraph Script:1466: Luraph Script:1449: line 3: attempt to compare number <= table")
local larry2887 =larry2886(larry2885, function(...)
local _2888_vararg1, _2888_vararg2, _2888_vararg3, _2888_vararg4, _2888_vararg5, _2888_vararg6, _2888_vararg7, _2888_vararg8, _2888_vararg9, _2888_vararg10 = ...
local larry2889 =larry2879["Character"]
local larry2890 =larry2889["FindFirstChild"]
local larry2891 =larry2890(larry2889, "HumanoidRootPart")
local larry2892 =larry2876["ClockTime"]
local er =error("Luraph Script:1466: Luraph Script:1449: line 3: attempt to compare number <= table")
end)
local larry2893 =Vector3["new"]
local larry2894 =larry2893(21.15, 19, -6.12)
local larry2895 =larry43["Section"]
local larry2896 =larry2895(larry43, {
  ["Opened"] = false,
  ["Icon"] = "database-backup",
  ["Title"] = "Auto Day Settings",
  ["Desc"] = "Settings For Afk Day",
})
local larry2897 =larry2896["Toggle"]
local larry2898 =larry2897(larry2896, {
  ["Callback"] = function(...)
local _2899_vararg1, _2899_vararg2, _2899_vararg3, _2899_vararg4, _2899_vararg5, _2899_vararg6, _2899_vararg7, _2899_vararg8, _2899_vararg9, _2899_vararg10 = ...

end,
  ["Default"] = false,
  ["Title"] = "Auto Compress Gems",
})
local larry2900 =task["spawn"]
local larry2903 =larry114["GetChildren"]
local larry2904 =larry2903(larry114)
local larry2906 =_2905_2["Name"]
local _ =task.wait(10)
local larry2907 =larry114["GetChildren"]
local larry2908 =larry2907(larry114)
local larry2910 =_2909_2["Name"]
local _ =task.wait(10)
local larry2911 =larry114["GetChildren"]
local larry2912 =larry2911(larry114)
local larry2914 =_2913_2["Name"]
local _ =task.wait(10)
local larry2915 =larry114["GetChildren"]
local larry2916 =larry2915(larry114)
local larry2918 =_2917_2["Name"]
local _ =task.wait(10)
local larry2919 =larry114["GetChildren"]
local larry2920 =larry2919(larry114)
local larry2922 =_2921_2["Name"]
local _ =task.wait(10)
local larry2923 =larry114["GetChildren"]
local larry2924 =larry2923(larry114)
local larry2926 =_2925_2["Name"]
local _ =task.wait(10)
local larry2927 =larry114["GetChildren"]
local larry2928 =larry2927(larry114)
local larry2930 =_2929_2["Name"]
local _ =task.wait(10)
local larry2931 =larry114["GetChildren"]
local larry2932 =larry2931(larry114)
local larry2934 =_2933_2["Name"]
local _ =task.wait(10)
local larry2935 =larry114["GetChildren"]
local larry2936 =larry2935(larry114)
local larry2938 =_2937_2["Name"]
local _ =task.wait(10)
local larry2939 =larry114["GetChildren"]
local larry2940 =larry2939(larry114)
local larry2942 =_2941_2["Name"]
local _ =task.wait(10)
local larry2943 =larry114["GetChildren"]
local larry2944 =larry2943(larry114)
local larry2946 =_2945_2["Name"]
local _ =task.wait(10)
local larry2947 =larry114["GetChildren"]
local larry2948 =larry2947(larry114)
local larry2950 =_2949_2["Name"]
local _ =task.wait(10)
local larry2951 =larry114["GetChildren"]
local larry2952 =larry2951(larry114)
local larry2954 =_2953_2["Name"]
local _ =task.wait(10)
local larry2955 =larry114["GetChildren"]
local larry2956 =larry2955(larry114)
local larry2958 =_2957_2["Name"]
local _ =task.wait(10)
local er =error("Luraph Script:1532: internal 542: <larry: infinitelooperror>")
local larry2901 =larry2900(function(...)
local _2902_vararg1, _2902_vararg2, _2902_vararg3, _2902_vararg4, _2902_vararg5, _2902_vararg6, _2902_vararg7, _2902_vararg8, _2902_vararg9, _2902_vararg10 = ...
local larry2903 =larry114["GetChildren"]
local larry2904 =larry2903(larry114)
for larry2905, _2905_2 in ipairs(larry2904) do
local larry2906 =_2905_2["Name"]
end
local _ =task.wait(10)
local larry2907 =larry114["GetChildren"]
local larry2908 =larry2907(larry114)
for larry2909, _2909_2 in ipairs(larry2908) do
local larry2910 =_2909_2["Name"]
end
local _ =task.wait(10)
local larry2911 =larry114["GetChildren"]
local larry2912 =larry2911(larry114)
for larry2913, _2913_2 in ipairs(larry2912) do
local larry2914 =_2913_2["Name"]
end
local _ =task.wait(10)
local larry2915 =larry114["GetChildren"]
local larry2916 =larry2915(larry114)
for larry2917, _2917_2 in ipairs(larry2916) do
local larry2918 =_2917_2["Name"]
end
local _ =task.wait(10)
local larry2919 =larry114["GetChildren"]
local larry2920 =larry2919(larry114)
for larry2921, _2921_2 in ipairs(larry2920) do
local larry2922 =_2921_2["Name"]
end
local _ =task.wait(10)
local larry2923 =larry114["GetChildren"]
local larry2924 =larry2923(larry114)
for larry2925, _2925_2 in ipairs(larry2924) do
local larry2926 =_2925_2["Name"]
end
local _ =task.wait(10)
local larry2927 =larry114["GetChildren"]
local larry2928 =larry2927(larry114)
for larry2929, _2929_2 in ipairs(larry2928) do
local larry2930 =_2929_2["Name"]
end
local _ =task.wait(10)
local larry2931 =larry114["GetChildren"]
local larry2932 =larry2931(larry114)
for larry2933, _2933_2 in ipairs(larry2932) do
local larry2934 =_2933_2["Name"]
end
local _ =task.wait(10)
local larry2935 =larry114["GetChildren"]
local larry2936 =larry2935(larry114)
for larry2937, _2937_2 in ipairs(larry2936) do
local larry2938 =_2937_2["Name"]
end
local _ =task.wait(10)
local larry2939 =larry114["GetChildren"]
local larry2940 =larry2939(larry114)
for larry2941, _2941_2 in ipairs(larry2940) do
local larry2942 =_2941_2["Name"]
end
local _ =task.wait(10)
local larry2943 =larry114["GetChildren"]
local larry2944 =larry2943(larry114)
for larry2945, _2945_2 in ipairs(larry2944) do
local larry2946 =_2945_2["Name"]
end
local _ =task.wait(10)
local larry2947 =larry114["GetChildren"]
local larry2948 =larry2947(larry114)
for larry2949, _2949_2 in ipairs(larry2948) do
local larry2950 =_2949_2["Name"]
end
local _ =task.wait(10)
local larry2951 =larry114["GetChildren"]
local larry2952 =larry2951(larry114)
for larry2953, _2953_2 in ipairs(larry2952) do
local larry2954 =_2953_2["Name"]
end
local _ =task.wait(10)
local larry2955 =larry114["GetChildren"]
local larry2956 =larry2955(larry114)
for larry2957, _2957_2 in ipairs(larry2956) do
local larry2958 =_2957_2["Name"]
end
local er =error("Luraph Script:1532: internal 542: <larry: infinitelooperror>")
end)
local larry2959 =larry2896["Toggle"]
local larry2962 =task["spawn"]
local _ =task.wait(20)
local larry2965 =workspace["WaitForChild"]
local larry2966 =larry2965(workspace, "Structures")
local larry2967 =larry2966["WaitForChild"]
local larry2968 =larry2967(larry2966, "Temporal Accelerometer")
local larry2969 =game["GetService"]
local larry2970 =larry2969(game, "ReplicatedStorage")
local larry2971 =larry2970["WaitForChild"]
local larry2972 =larry2971(larry2970, "RemoteEvents")
local larry2973 =larry2972["WaitForChild"]
local larry2974 =larry2973(larry2972, "RequestActivateNightSkipMachine")
local larry2975 =larry2974["FireServer"]
local larry2976 =larry2975(larry2974, larry2968)
local _ =task.wait(20)
local larry2977 =workspace["WaitForChild"]
local larry2978 =larry2977(workspace, "Structures")
local larry2979 =larry2978["WaitForChild"]
local larry2980 =larry2979(larry2978, "Temporal Accelerometer")
local larry2981 =game["GetService"]
local larry2982 =larry2981(game, "ReplicatedStorage")
local larry2983 =larry2982["WaitForChild"]
local larry2984 =larry2983(larry2982, "RemoteEvents")
local larry2985 =larry2984["WaitForChild"]
local larry2986 =larry2985(larry2984, "RequestActivateNightSkipMachine")
local larry2987 =larry2986["FireServer"]
local larry2988 =larry2987(larry2986, larry2980)
local _ =task.wait(20)
local larry2989 =workspace["WaitForChild"]
local larry2990 =larry2989(workspace, "Structures")
local larry2991 =larry2990["WaitForChild"]
local larry2992 =larry2991(larry2990, "Temporal Accelerometer")
local larry2993 =game["GetService"]
local larry2994 =larry2993(game, "ReplicatedStorage")
local larry2995 =larry2994["WaitForChild"]
local er =error("Luraph Script:1551: internal 542: <larry: infinitelooperror>")
local larry2963 =larry2962(function(...)
local _2964_vararg1, _2964_vararg2, _2964_vararg3, _2964_vararg4, _2964_vararg5, _2964_vararg6, _2964_vararg7, _2964_vararg8, _2964_vararg9, _2964_vararg10 = ...
local _ =task.wait(20)
local larry2965 =workspace["WaitForChild"]
local larry2966 =larry2965(workspace, "Structures")
local larry2967 =larry2966["WaitForChild"]
local larry2968 =larry2967(larry2966, "Temporal Accelerometer")
local larry2969 =game["GetService"]
local larry2970 =larry2969(game, "ReplicatedStorage")
local larry2971 =larry2970["WaitForChild"]
local larry2972 =larry2971(larry2970, "RemoteEvents")
local larry2973 =larry2972["WaitForChild"]
local larry2974 =larry2973(larry2972, "RequestActivateNightSkipMachine")
local larry2975 =larry2974["FireServer"]
local larry2976 =larry2975(larry2974, larry2968)
local _ =task.wait(20)
local larry2977 =workspace["WaitForChild"]
local larry2978 =larry2977(workspace, "Structures")
local larry2979 =larry2978["WaitForChild"]
local larry2980 =larry2979(larry2978, "Temporal Accelerometer")
local larry2981 =game["GetService"]
local larry2982 =larry2981(game, "ReplicatedStorage")
local larry2983 =larry2982["WaitForChild"]
local larry2984 =larry2983(larry2982, "RemoteEvents")
local larry2985 =larry2984["WaitForChild"]
local larry2986 =larry2985(larry2984, "RequestActivateNightSkipMachine")
local larry2987 =larry2986["FireServer"]
local larry2988 =larry2987(larry2986, larry2980)
local _ =task.wait(20)
local larry2989 =workspace["WaitForChild"]
local larry2990 =larry2989(workspace, "Structures")
local larry2991 =larry2990["WaitForChild"]
local larry2992 =larry2991(larry2990, "Temporal Accelerometer")
local larry2993 =game["GetService"]
local larry2994 =larry2993(game, "ReplicatedStorage")
local er =error("Luraph Script:1551: internal 542: <larry: infinitelooperror>")
end)
local larry2960 =larry2959(larry2896, {
  ["Callback"] = function(...)
local _2961_vararg1, _2961_vararg2, _2961_vararg3, _2961_vararg4, _2961_vararg5, _2961_vararg6, _2961_vararg7, _2961_vararg8, _2961_vararg9, _2961_vararg10 = ...
local larry2962 =task["spawn"]
local larry2963 =larry2962(function(...)
local _2964_vararg1, _2964_vararg2, _2964_vararg3, _2964_vararg4, _2964_vararg5, _2964_vararg6, _2964_vararg7, _2964_vararg8, _2964_vararg9, _2964_vararg10 = ...
local _ =task.wait(20)
local larry2965 =workspace["WaitForChild"]
local larry2966 =larry2965(workspace, "Structures")
local larry2967 =larry2966["WaitForChild"]
local larry2968 =larry2967(larry2966, "Temporal Accelerometer")
local larry2969 =game["GetService"]
local larry2970 =larry2969(game, "ReplicatedStorage")
local larry2971 =larry2970["WaitForChild"]
local larry2972 =larry2971(larry2970, "RemoteEvents")
local larry2973 =larry2972["WaitForChild"]
local larry2974 =larry2973(larry2972, "RequestActivateNightSkipMachine")
local larry2975 =larry2974["FireServer"]
local larry2976 =larry2975(larry2974, larry2968)
local _ =task.wait(20)
local larry2977 =workspace["WaitForChild"]
local larry2978 =larry2977(workspace, "Structures")
local larry2979 =larry2978["WaitForChild"]
local larry2980 =larry2979(larry2978, "Temporal Accelerometer")
local larry2981 =game["GetService"]
local larry2982 =larry2981(game, "ReplicatedStorage")
local larry2983 =larry2982["WaitForChild"]
local larry2984 =larry2983(larry2982, "RemoteEvents")
local larry2985 =larry2984["WaitForChild"]
local larry2986 =larry2985(larry2984, "RequestActivateNightSkipMachine")
local larry2987 =larry2986["FireServer"]
local larry2988 =larry2987(larry2986, larry2980)
local _ =task.wait(20)
local larry2989 =workspace["WaitForChild"]
local larry2990 =larry2989(workspace, "Structures")
local larry2991 =larry2990["WaitForChild"]
local larry2992 =larry2991(larry2990, "Temporal Accelerometer")
local larry2993 =game["GetService"]
local larry2994 =larry2993(game, "ReplicatedStorage")
local er =error("Luraph Script:1551: internal 542: <larry: infinitelooperror>")
end)
end,
  ["Default"] = false,
  ["Title"] = "Auto Skip Night Machine",
})
local larry2996 =larry2896["Button"]
local larry2999 =workspace["WaitForChild"]
local larry3000 =larry2999(workspace, "Structures")
local larry3001 =larry3000["GetChildren"]
local larry3002 =larry3001(larry3000)
local larry3004 =_3003_2["Name"]
local larry3005 =_3003_2["Destroy"]
local larry3006 =larry3005(_3003_2)
local larry2997 =larry2996(larry2896, {
  ["Title"] = "Keep Only Temporal Structure Delete Others",
  ["Callback"] = function(...)
local _2998_vararg1, _2998_vararg2, _2998_vararg3, _2998_vararg4, _2998_vararg5, _2998_vararg6, _2998_vararg7, _2998_vararg8, _2998_vararg9, _2998_vararg10 = ...
local larry2999 =workspace["WaitForChild"]
local larry3000 =larry2999(workspace, "Structures")
local larry3001 =larry3000["GetChildren"]
local larry3002 =larry3001(larry3000)
for larry3003, _3003_2 in ipairs(larry3002) do
local larry3004 =_3003_2["Name"]
local larry3005 =_3003_2["Destroy"]
local larry3006 =larry3005(_3003_2)
end
end,
})
local larry3007 =larry2896["Toggle"]
local larry3010 =task["spawn"]
local larry3013 =larry114["GetChildren"]
local larry3014 =larry3013(larry114)
local larry3016 =_3015_2["Name"]
local larry3017 =_3015_2["Destroy"]
local larry3018 =larry3017(_3015_2)
local _ =task.wait(5)
local larry3019 =larry114["GetChildren"]
local larry3020 =larry3019(larry114)
local larry3022 =_3021_2["Name"]
local larry3023 =_3021_2["Destroy"]
local _ =task.wait(5)
local er =error("Luraph Script:1599: internal 542: <larry: infinitelooperror>")
local larry3011 =larry3010(function(...)
local _3012_vararg1, _3012_vararg2, _3012_vararg3, _3012_vararg4, _3012_vararg5, _3012_vararg6, _3012_vararg7, _3012_vararg8, _3012_vararg9, _3012_vararg10 = ...
local larry3013 =larry114["GetChildren"]
local larry3014 =larry3013(larry114)
for larry3015, _3015_2 in ipairs(larry3014) do
local larry3016 =_3015_2["Name"]
local larry3017 =_3015_2["Destroy"]
local larry3018 =larry3017(_3015_2)
end
local _ =task.wait(5)
local larry3019 =larry114["GetChildren"]
local larry3020 =larry3019(larry114)
for larry3021, _3021_2 in ipairs(larry3020) do
local larry3022 =_3021_2["Name"]
end
local er =error("Luraph Script:1599: internal 542: <larry: infinitelooperror>")
end)
local larry3008 =larry3007(larry2896, {
  ["Callback"] = function(...)
local _3009_vararg1, _3009_vararg2, _3009_vararg3, _3009_vararg4, _3009_vararg5, _3009_vararg6, _3009_vararg7, _3009_vararg8, _3009_vararg9, _3009_vararg10 = ...
local larry3010 =task["spawn"]
local larry3011 =larry3010(function(...)
local _3012_vararg1, _3012_vararg2, _3012_vararg3, _3012_vararg4, _3012_vararg5, _3012_vararg6, _3012_vararg7, _3012_vararg8, _3012_vararg9, _3012_vararg10 = ...
local larry3013 =larry114["GetChildren"]
local larry3014 =larry3013(larry114)
for larry3015, _3015_2 in ipairs(larry3014) do
local larry3016 =_3015_2["Name"]
local larry3017 =_3015_2["Destroy"]
local larry3018 =larry3017(_3015_2)
end
local _ =task.wait(5)
local larry3019 =larry114["GetChildren"]
local larry3020 =larry3019(larry114)
for larry3021, _3021_2 in ipairs(larry3020) do
local larry3022 =_3021_2["Name"]
end
local er =error("Luraph Script:1599: internal 542: <larry: infinitelooperror>")
end)
end,
  ["Default"] = false,
  ["Title"] = "Remove All Except Compress Gems",
})
local larry3024 =larry45["Section"]
local larry3025 =larry3024(larry45, {
  ["Opened"] = false,
  ["Title"] = "Main Areas",
  ["Icon"] = "map-pin",
  ["Desc"] = "TP Main Places Like Camp",
})
local larry3026 =larry3025["Button"]
local larry3029 =larry1414["Character"]
local larry3030 =larry3029["FindFirstChild"]
local larry3031 =larry3030(larry3029, "HumanoidRootPart")
local larry3032 =larry3029["HumanoidRootPart"]
local larry3033 =CFrame["new"]
local larry3034 =larry3033(13.287363052368164, 3.999999761581421, 0.36212217807769775, 0.6022269129753113, -2.275036159460342e-08, 0.7983249425888062, 6.430457055728311e-09, 1, 2.364672191390582e-08, -0.7983249425888062, -9.1070981866892e-09, 0.6022269129753113)
local larry3027 =larry3026(larry3025, {
  ["Title"] = "Teleport to Camp",
  ["Callback"] = function(...)
local _3028_vararg1, _3028_vararg2, _3028_vararg3, _3028_vararg4, _3028_vararg5, _3028_vararg6, _3028_vararg7, _3028_vararg8, _3028_vararg9, _3028_vararg10 = ...
local larry3029 =larry1414["Character"]
local larry3030 =larry3029["FindFirstChild"]
local larry3031 =larry3030(larry3029, "HumanoidRootPart")
local larry3032 =larry3029["HumanoidRootPart"]
local larry3033 =CFrame["new"]
local larry3034 =larry3033(13.287363052368164, 3.999999761581421, 0.36212217807769775, 0.6022269129753113, -2.275036159460342e-08, 0.7983249425888062, 6.430457055728311e-09, 1, 2.364672191390582e-08, -0.7983249425888062, -9.1070981866892e-09, 0.6022269129753113)
larry3032["CFrame"] =larry3034
end,
})
local larry3035 =larry3025["Button"]
local larry3038 =Vector3["new"]
local larry3039 =larry3038(-37.08, 3.98, -16.33)
local larry3040 =larry1414["Character"]
local larry3041 =larry3040["WaitForChild"]
local larry3042 =larry3041(larry3040, "HumanoidRootPart")
local larry3043 =CFrame["new"]
local larry3044 =larry3043(larry3039)
local larry3036 =larry3035(larry3025, {
  ["Title"] = "Teleport to Trader",
  ["Callback"] = function(...)
local _3037_vararg1, _3037_vararg2, _3037_vararg3, _3037_vararg4, _3037_vararg5, _3037_vararg6, _3037_vararg7, _3037_vararg8, _3037_vararg9, _3037_vararg10 = ...
local larry3038 =Vector3["new"]
local larry3039 =larry3038(-37.08, 3.98, -16.33)
local larry3040 =larry1414["Character"]
local larry3041 =larry3040["WaitForChild"]
local larry3042 =larry3041(larry3040, "HumanoidRootPart")
local larry3043 =CFrame["new"]
local larry3044 =larry3043(larry3039)
larry3042["CFrame"] =larry3044
end,
})
local larry3045 =larry3025["Button"]
local larry3048 =game["GetService"]
local larry3049 =larry3048(game, "Players")
local larry3050 =larry3049["LocalPlayer"]
local larry3051 =larry3050["Character"]
local larry3052 =workspace["WaitForChild"]
local larry3053 =larry3052(workspace, "Map")
local larry3054 =larry3053["WaitForChild"]
local larry3055 =larry3054(larry3053, "Landmarks")
local larry3056 =larry3055["WaitForChild"]
local larry3057 =larry3056(larry3055, "Stronghold")
local larry3058 =larry3057["WaitForChild"]
local larry3059 =larry3058(larry3057, "Building")
local larry3060 =larry3059["WaitForChild"]
local larry3061 =larry3060(larry3059, "Sign")
local larry3062 =larry3061["WaitForChild"]
local larry3063 =larry3062(larry3061, "ScaledModel")
local larry3064 =larry3051["FindFirstChild"]
local larry3065 =larry3064(larry3051, "HumanoidRootPart")
local larry3066 =larry3051["HumanoidRootPart"]
local larry3067 =larry3063["GetPivot"]
local larry3068 =larry3067(larry3063)
local larry3046 =larry3045(larry3025, {
  ["Title"] = "Tp to Stronghold",
  ["Callback"] = function(...)
local _3047_vararg1, _3047_vararg2, _3047_vararg3, _3047_vararg4, _3047_vararg5, _3047_vararg6, _3047_vararg7, _3047_vararg8, _3047_vararg9, _3047_vararg10 = ...
local larry3048 =game["GetService"]
local larry3049 =larry3048(game, "Players")
local larry3050 =larry3049["LocalPlayer"]
local larry3051 =larry3050["Character"]
local larry3052 =workspace["WaitForChild"]
local larry3053 =larry3052(workspace, "Map")
local larry3054 =larry3053["WaitForChild"]
local larry3055 =larry3054(larry3053, "Landmarks")
local larry3056 =larry3055["WaitForChild"]
local larry3057 =larry3056(larry3055, "Stronghold")
local larry3058 =larry3057["WaitForChild"]
local larry3059 =larry3058(larry3057, "Building")
local larry3060 =larry3059["WaitForChild"]
local larry3061 =larry3060(larry3059, "Sign")
local larry3062 =larry3061["WaitForChild"]
local larry3063 =larry3062(larry3061, "ScaledModel")
local larry3064 =larry3051["FindFirstChild"]
local larry3065 =larry3064(larry3051, "HumanoidRootPart")
local larry3066 =larry3051["HumanoidRootPart"]
local larry3067 =larry3063["GetPivot"]
local larry3068 =larry3067(larry3063)
larry3066["CFrame"] =larry3068
end,
})
local larry3069 =larry3025["Button"]
local larry3072 =game["GetService"]
local larry3073 =larry3072(game, "Players")
local larry3074 =larry3073["LocalPlayer"]
local larry3075 =larry3074["Character"]
local larry3076 =larry3075["FindFirstChild"]
local larry3077 =larry3076(larry3075, "HumanoidRootPart")
local larry3078 =workspace["FindFirstChild"]
local larry3079 =larry3078(workspace, "Map")
local larry3080 =larry3079["FindFirstChild"]
local larry3081 =larry3080(larry3079, "Landmarks")
local larry3082 =larry3081["FindFirstChild"]
local larry3083 =larry3082(larry3081, "Military Base")
local larry3084 =larry3083["IsA"]
local larry3085 =larry3084(larry3083, "Model")
local larry3086 =larry3083["PrimaryPart"]
local larry3087 =larry3083["PrimaryPart"]
local larry3088 =larry3087["CFrame"]
local larry3089 =Vector3["new"]
local larry3090 =larry3089(0, 10, 0)
local larry3070 =larry3069(larry3025, {
  ["Title"] = "Tp to Military Base",
  ["Callback"] = function(...)
local _3071_vararg1, _3071_vararg2, _3071_vararg3, _3071_vararg4, _3071_vararg5, _3071_vararg6, _3071_vararg7, _3071_vararg8, _3071_vararg9, _3071_vararg10 = ...
local larry3072 =game["GetService"]
local larry3073 =larry3072(game, "Players")
local larry3074 =larry3073["LocalPlayer"]
local larry3075 =larry3074["Character"]
local larry3076 =larry3075["FindFirstChild"]
local larry3077 =larry3076(larry3075, "HumanoidRootPart")
local larry3078 =workspace["FindFirstChild"]
local larry3079 =larry3078(workspace, "Map")
local larry3080 =larry3079["FindFirstChild"]
local larry3081 =larry3080(larry3079, "Landmarks")
local larry3082 =larry3081["FindFirstChild"]
local larry3083 =larry3082(larry3081, "Military Base")
local larry3084 =larry3083["IsA"]
local larry3085 =larry3084(larry3083, "Model")
local larry3086 =larry3083["PrimaryPart"]
local larry3087 =larry3083["PrimaryPart"]
local larry3088 =larry3087["CFrame"]
local larry3089 =Vector3["new"]
local larry3090 =larry3089(0, 10, 0)
local larry3091 =(larry3088+larry3090)
larry3077["CFrame"] =larry3091
end,
})
local larry3092 =larry3025["Button"]
local larry3095 =game["GetService"]
local larry3096 =larry3095(game, "Players")
local larry3097 =larry3096["LocalPlayer"]
local larry3098 =larry3097["Character"]
local larry3099 =workspace["WaitForChild"]
local larry3100 =larry3099(workspace, "Map")
local larry3101 =larry3100["WaitForChild"]
local larry3102 =larry3101(larry3100, "Landmarks")
local larry3103 =larry3102["WaitForChild"]
local larry3104 =larry3103(larry3102, "ToolWorkshop")
local larry3105 =larry3104["WaitForChild"]
local larry3106 =larry3105(larry3104, "Building")
local larry3107 =larry3106["GetChildren"]
local larry3108 =larry3107(larry3106)
local larry3109 =larry3108[13]
local larry3110 =larry3109["FindFirstChild"]
local larry3111 =larry3110(larry3109, "Union")
local larry3112 =larry3098["FindFirstChild"]
local larry3113 =larry3112(larry3098, "HumanoidRootPart")
local larry3114 =larry3098["HumanoidRootPart"]
local larry3115 =larry3109["Union"]
local larry3116 =larry3115["CFrame"]
local larry3093 =larry3092(larry3025, {
  ["Title"] = "Tp to Anvil",
  ["Callback"] = function(...)
local _3094_vararg1, _3094_vararg2, _3094_vararg3, _3094_vararg4, _3094_vararg5, _3094_vararg6, _3094_vararg7, _3094_vararg8, _3094_vararg9, _3094_vararg10 = ...
local larry3095 =game["GetService"]
local larry3096 =larry3095(game, "Players")
local larry3097 =larry3096["LocalPlayer"]
local larry3098 =larry3097["Character"]
local larry3099 =workspace["WaitForChild"]
local larry3100 =larry3099(workspace, "Map")
local larry3101 =larry3100["WaitForChild"]
local larry3102 =larry3101(larry3100, "Landmarks")
local larry3103 =larry3102["WaitForChild"]
local larry3104 =larry3103(larry3102, "ToolWorkshop")
local larry3105 =larry3104["WaitForChild"]
local larry3106 =larry3105(larry3104, "Building")
local larry3107 =larry3106["GetChildren"]
local larry3108 =larry3107(larry3106)
local larry3109 =larry3108[13]
local larry3110 =larry3109["FindFirstChild"]
local larry3111 =larry3110(larry3109, "Union")
local larry3112 =larry3098["FindFirstChild"]
local larry3113 =larry3112(larry3098, "HumanoidRootPart")
local larry3114 =larry3098["HumanoidRootPart"]
local larry3115 =larry3109["Union"]
local larry3116 =larry3115["CFrame"]
larry3114["CFrame"] =larry3116
end,
})
local larry3117 =larry45["Section"]
local larry3118 =larry3117(larry45, {
  ["Opened"] = false,
  ["Title"] = "Trees",
  ["Icon"] = "tree-pine",
  ["Desc"] = "TP To Tree",
})
local larry3119 =larry3118["Button"]
local larry3122 =game["GetService"]
local larry3123 =larry3122(game, "Players")
local larry3124 =larry3123["LocalPlayer"]
local larry3125 =larry3124["Character"]
local larry3126 =larry3125["FindFirstChild"]
local larry3127 =larry3126(larry3125, "HumanoidRootPart", 3)
local larry3128 =workspace["FindFirstChild"]
local larry3129 =larry3128(workspace, "Map")
local larry3130 =larry3129["FindFirstChild"]
local larry3131 =larry3130(larry3129, "Foliage")
local larry3132 =larry3131["GetChildren"]
local larry3133 =larry3132(larry3131)
local larry3135 =_3134_2["Name"]
local larry3120 =larry3119(larry3118, {
  ["Title"] = "TP to Random Tree",
  ["Callback"] = function(...)
local _3121_vararg1, _3121_vararg2, _3121_vararg3, _3121_vararg4, _3121_vararg5, _3121_vararg6, _3121_vararg7, _3121_vararg8, _3121_vararg9, _3121_vararg10 = ...
local larry3122 =game["GetService"]
local larry3123 =larry3122(game, "Players")
local larry3124 =larry3123["LocalPlayer"]
local larry3125 =larry3124["Character"]
local larry3126 =larry3125["FindFirstChild"]
local larry3127 =larry3126(larry3125, "HumanoidRootPart", 3)
local larry3128 =workspace["FindFirstChild"]
local larry3129 =larry3128(workspace, "Map")
local larry3130 =larry3129["FindFirstChild"]
local larry3131 =larry3130(larry3129, "Foliage")
local larry3132 =larry3131["GetChildren"]
local larry3133 =larry3132(larry3131)
for larry3134, _3134_2 in ipairs(larry3133) do
local larry3135 =_3134_2["Name"]
end
end,
})
local larry3136 =larry45["Section"]
local larry3137 =larry3136(larry45, {
  ["Opened"] = false,
  ["Title"] = "Chests",
  ["Icon"] = "box",
  ["Desc"] = "TP Different Chests",
})
local larry3138 =larry3137["Button"]
local larry3141 =game["GetService"]
local larry3142 =larry3141(game, "Players")
local larry3143 =larry3142["LocalPlayer"]
local larry3144 =larry3143["Character"]
local larry3145 =larry3144["FindFirstChild"]
local larry3146 =larry3145(larry3144, "HumanoidRootPart")
local larry3147 =workspace["FindFirstChild"]
local larry3148 =larry3147(workspace, "Items")
local larry3149 =larry3148["FindFirstChild"]
local larry3150 =larry3149(larry3148, "Stronghold Diamond Chest")
local larry3151 =larry3150["IsA"]
local larry3152 =larry3151(larry3150, "Model")
local larry3153 =larry3150["PrimaryPart"]
local larry3154 =larry3150["PrimaryPart"]
local larry3155 =larry3154["CFrame"]
local larry3139 =larry3138(larry3137, {
  ["Title"] = "Tp to Stronghold Diamond Chest",
  ["Callback"] = function(...)
local _3140_vararg1, _3140_vararg2, _3140_vararg3, _3140_vararg4, _3140_vararg5, _3140_vararg6, _3140_vararg7, _3140_vararg8, _3140_vararg9, _3140_vararg10 = ...
local larry3141 =game["GetService"]
local larry3142 =larry3141(game, "Players")
local larry3143 =larry3142["LocalPlayer"]
local larry3144 =larry3143["Character"]
local larry3145 =larry3144["FindFirstChild"]
local larry3146 =larry3145(larry3144, "HumanoidRootPart")
local larry3147 =workspace["FindFirstChild"]
local larry3148 =larry3147(workspace, "Items")
local larry3149 =larry3148["FindFirstChild"]
local larry3150 =larry3149(larry3148, "Stronghold Diamond Chest")
local larry3151 =larry3150["IsA"]
local larry3152 =larry3151(larry3150, "Model")
local larry3153 =larry3150["PrimaryPart"]
local larry3154 =larry3150["PrimaryPart"]
local larry3155 =larry3154["CFrame"]
larry3146["CFrame"] =larry3155
end,
})
local larry3156 =workspace["GetDescendants"]
local larry3157 =larry3156(workspace)
local larry3159 =_3158_2["IsA"]
local larry3160 =larry3159(_3158_2, "Model")
local larry3161 =_3158_2["Name"]
local larry3162 =larry3161["find"]
local larry3163 =larry3162(larry3161, "Item Chest")
local larry3164 =_3158_2["Name"]
local larry3165 =larry3137["Dropdown"]
local larry3166 =larry3165(larry3137, {
  ["Value"] = larry3164,
  ["Callback"] = function(...)
local _3167_vararg1, _3167_vararg2, _3167_vararg3, _3167_vararg4, _3167_vararg5, _3167_vararg6, _3167_vararg7, _3167_vararg8, _3167_vararg9, _3167_vararg10 = ...

end,
  ["Values"] = {
  [1] = larry3164,
},
  ["Title"] = "Select Chest",
})
local larry3168 =larry3137["Button"]
local larry3171 =game["GetService"]
local larry3172 =larry3171(game, "Players")
local larry3173 =larry3172["LocalPlayer"]
local larry3174 =larry3173["Character"]
local larry3175 =larry3174["WaitForChild"]
local larry3176 =larry3175(larry3174, "HumanoidRootPart")
local larry3177 =workspace["GetDescendants"]
local larry3178 =larry3177(workspace)
local larry3180 =_3179_2["IsA"]
local larry3181 =larry3180(_3179_2, "Model")
local larry3182 =_3179_2["Name"]
local larry3169 =larry3168(larry3137, {
  ["Title"] = "Teleport to Selected Chest",
  ["Callback"] = function(...)
local _3170_vararg1, _3170_vararg2, _3170_vararg3, _3170_vararg4, _3170_vararg5, _3170_vararg6, _3170_vararg7, _3170_vararg8, _3170_vararg9, _3170_vararg10 = ...
local larry3171 =game["GetService"]
local larry3172 =larry3171(game, "Players")
local larry3173 =larry3172["LocalPlayer"]
local larry3174 =larry3173["Character"]
local larry3175 =larry3174["WaitForChild"]
local larry3176 =larry3175(larry3174, "HumanoidRootPart")
local larry3177 =workspace["GetDescendants"]
local larry3178 =larry3177(workspace)
for larry3179, _3179_2 in ipairs(larry3178) do
local larry3180 =_3179_2["IsA"]
local larry3181 =larry3180(_3179_2, "Model")
local larry3182 =_3179_2["Name"]
local larry3183 =(larry3182==_3167_vararg1)
end
end,
})
local larry3184 =larry3137["Button"]
local larry3187 =workspace["GetDescendants"]
local larry3188 =larry3187(workspace)
local larry3190 =_3189_2["IsA"]
local larry3191 =larry3190(_3189_2, "Model")
local larry3192 =_3189_2["Name"]
local larry3193 =larry3192["find"]
local larry3194 =larry3193(larry3192, "Item Chest")
local larry3195 =_3189_2["Name"]
local larry3196, _3196_2, _3196_3 =table.find({
  [1] = larry3195,
}, _3167_vararg1)
local larry3197 =larry3166["SetValues"]
local larry3198 =larry3197(larry3166, {
  [1] = larry3195,
})
local larry3199 =larry3166["SetValue"]
local larry3200 =larry3199(larry3166, _3167_vararg1)
local larry3185 =larry3184(larry3137, {
  ["Title"] = "Refresh Chest List",
  ["Callback"] = function(...)
local _3186_vararg1, _3186_vararg2, _3186_vararg3, _3186_vararg4, _3186_vararg5, _3186_vararg6, _3186_vararg7, _3186_vararg8, _3186_vararg9, _3186_vararg10 = ...
local larry3187 =workspace["GetDescendants"]
local larry3188 =larry3187(workspace)
for larry3189, _3189_2 in ipairs(larry3188) do
local larry3190 =_3189_2["IsA"]
local larry3191 =larry3190(_3189_2, "Model")
local larry3192 =_3189_2["Name"]
local larry3193 =larry3192["find"]
local larry3194 =larry3193(larry3192, "Item Chest")
local larry3195 =_3189_2["Name"]
end
local larry3196, _3196_2, _3196_3 =table.find({
  [1] = larry3195,
}, _3167_vararg1)
local larry3197 =larry3166["SetValues"]
local larry3198 =larry3197(larry3166, {
  [1] = larry3195,
})
local larry3199 =larry3166["SetValue"]
local larry3200 =larry3199(larry3166, _3167_vararg1)
end,
})
local larry3201 =larry3137["Button"]
local larry3204 =game["GetService"]
local larry3205 =larry3204(game, "Players")
local larry3206 =larry3205["LocalPlayer"]
local larry3207 =larry3206["Character"]
local larry3208 =larry3207["WaitForChild"]
local larry3209 =larry3208(larry3207, "HumanoidRootPart")
local larry3210 =workspace["GetDescendants"]
local larry3211 =larry3210(workspace)
local larry3213 =_3212_2["IsA"]
local larry3214 =larry3213(_3212_2, "Model")
local larry3215 =_3212_2["Name"]
local larry3216 =larry3215["find"]
local larry3217 =larry3216(larry3215, "Item Chest")
local larry3218 =_3212_2["GetPivot"]
local larry3219 =larry3218(_3212_2)
local larry3220 =Vector3["new"]
local larry3221 =larry3220(0, 9, 0)
local larry3202 =larry3201(larry3137, {
  ["Title"] = "Teleport to Random Chest",
  ["Callback"] = function(...)
local _3203_vararg1, _3203_vararg2, _3203_vararg3, _3203_vararg4, _3203_vararg5, _3203_vararg6, _3203_vararg7, _3203_vararg8, _3203_vararg9, _3203_vararg10 = ...
local larry3204 =game["GetService"]
local larry3205 =larry3204(game, "Players")
local larry3206 =larry3205["LocalPlayer"]
local larry3207 =larry3206["Character"]
local larry3208 =larry3207["WaitForChild"]
local larry3209 =larry3208(larry3207, "HumanoidRootPart")
local larry3210 =workspace["GetDescendants"]
local larry3211 =larry3210(workspace)
for larry3212, _3212_2 in ipairs(larry3211) do
local larry3213 =_3212_2["IsA"]
local larry3214 =larry3213(_3212_2, "Model")
local larry3215 =_3212_2["Name"]
local larry3216 =larry3215["find"]
local larry3217 =larry3216(larry3215, "Item Chest")
end
local larry3218 =_3212_2["GetPivot"]
local larry3219 =larry3218(_3212_2)
local larry3220 =Vector3["new"]
local larry3221 =larry3220(0, 9, 0)
local larry3222 =(larry3219+larry3221)
larry3209["CFrame"] =larry3222
end,
})
local larry3223 =larry45["Section"]
local larry3224 =larry3223(larry45, {
  ["Opened"] = false,
  ["Title"] = "Enemies",
  ["Icon"] = "swords",
  ["Desc"] = "TP to Different Animals ",
})
local larry3225 =larry3224["Dropdown"]
local larry3226 =larry3225(larry3224, {
  ["Value"] = "Bunny",
  ["Callback"] = function(...)
local _3227_vararg1, _3227_vararg2, _3227_vararg3, _3227_vararg4, _3227_vararg5, _3227_vararg6, _3227_vararg7, _3227_vararg8, _3227_vararg9, _3227_vararg10 = ...

end,
  ["Values"] = {
  [1] = "Bunny",
  [2] = "Wolf",
  [3] = "Alpha Wolf",
  [4] = "Bear",
  [5] = "Cultist",
  [6] = "Crossbow Cultist",
  [7] = "Juggernaut Cultist",
  [8] = "Cultist King",
  [9] = "Hellephant",
  [10] = "Mammoth",
  [11] = "Meteor Crab",
  [12] = "Scorpion",
  [13] = "Artic Fox",
  [14] = "Polar Bear",
  [15] = "FrogKing",
  [16] = "Horse",
  [17] = "Kiwi",
  [18] = "Alien",
},
  ["Title"] = "Select Enemy",
})
local larry3228 =larry3224["Button"]
local larry3231 =game["GetService"]
local larry3232 =larry3231(game, "Players")
local larry3233 =larry3232["LocalPlayer"]
local larry3234 =larry3233["Character"]
local larry3235 =larry3234["WaitForChild"]
local larry3236 =larry3235(larry3234, "HumanoidRootPart")
local larry3237 =workspace["GetDescendants"]
local larry3238 =larry3237(workspace)
local larry3240 =_3239_2["Name"]
local larry3229 =larry3228(larry3224, {
  ["Title"] = "Teleport to Enemy",
  ["Callback"] = function(...)
local _3230_vararg1, _3230_vararg2, _3230_vararg3, _3230_vararg4, _3230_vararg5, _3230_vararg6, _3230_vararg7, _3230_vararg8, _3230_vararg9, _3230_vararg10 = ...
local larry3231 =game["GetService"]
local larry3232 =larry3231(game, "Players")
local larry3233 =larry3232["LocalPlayer"]
local larry3234 =larry3233["Character"]
local larry3235 =larry3234["WaitForChild"]
local larry3236 =larry3235(larry3234, "HumanoidRootPart")
local larry3237 =workspace["GetDescendants"]
local larry3238 =larry3237(workspace)
for larry3239, _3239_2 in ipairs(larry3238) do
local larry3240 =_3239_2["Name"]
local larry3241 =(larry3240==_3227_vararg1)
end
end,
})
local larry3242 =larry3224["Toggle"]
local larry3245 =workspace["WaitForChild"]
local larry3246 =larry3245(workspace, "Characters")
local larry3247 =larry3246["GetChildren"]
local larry3248 =larry3247(larry3246)
local larry3250 =_3249_2["IsA"]
local larry3251 =larry3250(_3249_2, "Model")
local larry3252 =_3249_2["GetDescendants"]
local larry3253 =larry3252(_3249_2)
local larry3255 =_3254_2["IsA"]
local larry3256 =larry3255(_3254_2, "BasePart")
local larry3243 =larry3242(larry3224, {
  ["Callback"] = function(...)
local _3244_vararg1, _3244_vararg2, _3244_vararg3, _3244_vararg4, _3244_vararg5, _3244_vararg6, _3244_vararg7, _3244_vararg8, _3244_vararg9, _3244_vararg10 = ...
local larry3245 =workspace["WaitForChild"]
local larry3246 =larry3245(workspace, "Characters")
local larry3247 =larry3246["GetChildren"]
local larry3248 =larry3247(larry3246)
for larry3249, _3249_2 in ipairs(larry3248) do
local larry3250 =_3249_2["IsA"]
local larry3251 =larry3250(_3249_2, "Model")
local larry3252 =_3249_2["GetDescendants"]
local larry3253 =larry3252(_3249_2)
for larry3254, _3254_2 in ipairs(larry3253) do
local larry3255 =_3254_2["IsA"]
local larry3256 =larry3255(_3254_2, "BasePart")
_3254_2["Anchored"] =_3244_vararg1
end
end
end,
  ["Default"] = false,
  ["Title"] = "Freeze All Enemies/Animal (VISUAL)",
  ["Desc"] = "Freeze all enemies and animals (VISUAL)",
})
local larry3257 =game["GetService"]
local larry3258 =larry3257(game, "Players")
local larry3259 =game["GetService"]
local larry3260 =larry3259(game, "Workspace")
local larry3261 =larry3258["LocalPlayer"]
local larry3262 =larry45["Section"]
local larry3263 =larry3262(larry45, {
  ["Opened"] = false,
  ["Title"] = "Teleport to Alive Player",
  ["Icon"] = "user",
  ["Desc"] = "TP Alive Players",
})
local larry3264 =larry3263["Dropdown"]
local larry3265 =larry3258["GetPlayers"]
local larry3266 =larry3265(larry3258)
local larry3269 =_3267_2["Character"]
local larry3270 =_3267_2["Character"]
local larry3271 =larry3270["FindFirstChild"]
local larry3272 =larry3271(larry3270, "HumanoidRootPart")
local larry3273 =_3267_2["Name"]
local larry3274 =larry3264(larry3263, {
  ["Title"] = "Select Alive Player",
  ["AllowNone"] = true,
  ["Multi"] = false,
  ["Callback"] = function(...)
local _3275_vararg1, _3275_vararg2, _3275_vararg3, _3275_vararg4, _3275_vararg5, _3275_vararg6, _3275_vararg7, _3275_vararg8, _3275_vararg9, _3275_vararg10 = ...

end,
  ["Values"] = {
  [1] = larry3273,
},
})
local larry3276 =larry3263["Button"]
local larry3279 =larry3258["FindFirstChild"]
local larry3280 =larry3279(larry3258, _3275_vararg1)
local larry3281 =larry3280["Character"]
local larry3282 =larry3280["Character"]
local larry3283 =larry3282["FindFirstChild"]
local larry3284 =larry3283(larry3282, "HumanoidRootPart")
local larry3285 =larry3261["Character"]
local larry3286 =larry3285["FindFirstChild"]
local larry3287 =larry3286(larry3285, "HumanoidRootPart")
local larry3288 =larry3280["Character"]
local larry3289 =larry3288["HumanoidRootPart"]
local larry3290 =larry3289["CFrame"]
local larry3291 =Vector3["new"]
local larry3292 =larry3291(0, 2, 0)
local larry3277 =larry3276(larry3263, {
  ["Title"] = "Teleport to Alive Player",
  ["Callback"] = function(...)
local _3278_vararg1, _3278_vararg2, _3278_vararg3, _3278_vararg4, _3278_vararg5, _3278_vararg6, _3278_vararg7, _3278_vararg8, _3278_vararg9, _3278_vararg10 = ...
local larry3279 =larry3258["FindFirstChild"]
local larry3280 =larry3279(larry3258, _3275_vararg1)
local larry3281 =larry3280["Character"]
local larry3282 =larry3280["Character"]
local larry3283 =larry3282["FindFirstChild"]
local larry3284 =larry3283(larry3282, "HumanoidRootPart")
local larry3285 =larry3261["Character"]
local larry3286 =larry3285["FindFirstChild"]
local larry3287 =larry3286(larry3285, "HumanoidRootPart")
local larry3288 =larry3280["Character"]
local larry3289 =larry3288["HumanoidRootPart"]
local larry3290 =larry3289["CFrame"]
local larry3291 =Vector3["new"]
local larry3292 =larry3291(0, 2, 0)
local larry3293 =(larry3290+larry3292)
larry3287["CFrame"] =larry3293
end,
})
local larry3294 =larry3263["Button"]
local larry3297 =larry3274["Refresh"]
local larry3298 =larry3258["GetPlayers"]
local larry3299 =larry3298(larry3258)
local larry3302 =_3300_2["Character"]
local larry3303 =_3300_2["Character"]
local larry3304 =larry3303["FindFirstChild"]
local larry3305 =larry3304(larry3303, "HumanoidRootPart")
local larry3306 =_3300_2["Name"]
local larry3307 =larry3297(larry3274, {
  [1] = larry3306,
})
local larry3295 =larry3294(larry3263, {
  ["Title"] = "Refresh Player List",
  ["Callback"] = function(...)
local _3296_vararg1, _3296_vararg2, _3296_vararg3, _3296_vararg4, _3296_vararg5, _3296_vararg6, _3296_vararg7, _3296_vararg8, _3296_vararg9, _3296_vararg10 = ...
local larry3297 =larry3274["Refresh"]
local larry3298 =larry3258["GetPlayers"]
local larry3299 =larry3298(larry3258)
for larry3300, _3300_2 in ipairs(larry3299) do
local larry3301 =(_3300_2==larry3261)
local larry3302 =_3300_2["Character"]
local larry3303 =_3300_2["Character"]
local larry3304 =larry3303["FindFirstChild"]
local larry3305 =larry3304(larry3303, "HumanoidRootPart")
local larry3306 =_3300_2["Name"]
end
local larry3307 =larry3297(larry3274, {
  [1] = larry3306,
})
end,
})
local larry3308 =larry45["Section"]
local larry3309 =larry3308(larry45, {
  ["Opened"] = false,
  ["Icon"] = "user-x",
  ["Title"] = "Teleport to Dead Player",
  ["Desc"] = "TP Dead Players",
})
local larry3310 =larry3309["Dropdown"]
local larry3311 =larry3260["FindFirstChild"]
local larry3312 =larry3311(larry3260, "Characters")
local larry3313 =larry3312["GetChildren"]
local larry3314 =larry3313(larry3312)
local larry3316 =_3315_2["IsA"]
local larry3317 =larry3316(_3315_2, "Model")
local larry3318 =_3315_2["FindFirstChild"]
local larry3319 =larry3318(_3315_2, "HumanoidRootPart")
local larry3320 =_3315_2["Name"]
local larry3321 =larry3320["sub"]
local larry3322 =larry3321(larry3320, -5)
local larry3323 =larry3310(larry3309, {
  ["Title"] = "Select Dead Player",
  ["AllowNone"] = true,
  ["Multi"] = false,
  ["Callback"] = function(...)
local _3324_vararg1, _3324_vararg2, _3324_vararg3, _3324_vararg4, _3324_vararg5, _3324_vararg6, _3324_vararg7, _3324_vararg8, _3324_vararg9, _3324_vararg10 = ...

end,
  ["Values"] = {},
})
local larry3325 =larry3309["Button"]
local larry3328 =larry3260["FindFirstChild"]
local larry3329 =larry3328(larry3260, "Characters")
local larry3330 =larry3329["FindFirstChild"]
local larry3331 =larry3330(larry3329, _3324_vararg1)
local larry3332 =larry3331["FindFirstChild"]
local larry3333 =larry3332(larry3331, "HumanoidRootPart")
local larry3334 =larry3261["Character"]
local larry3335 =larry3334["FindFirstChild"]
local larry3336 =larry3335(larry3334, "HumanoidRootPart")
local larry3337 =larry3334["FindFirstChildOfClass"]
local larry3338 =larry3337(larry3334, "Humanoid")
local larry3339 =larry3331["HumanoidRootPart"]
local larry3340 =larry3339["CFrame"]
local larry3341 =Vector3["new"]
local larry3342 =larry3341(0, 3, 0)
local larry3344 =Vector3["new"]
local larry3345 =larry3344(0, 0, 0)
local larry3346 =Vector3["new"]
local larry3347 =larry3346(0, 0, 0)
local _ =task.wait(0.05)
local larry3348 =larry3338["ChangeState"]
local larry3349 =Enum["HumanoidStateType"]
local larry3350 =larry3349["GettingUp"]
local larry3351 =larry3348(larry3338, larry3350)
local larry3352 =larry3338["ChangeState"]
local larry3353 =Enum["HumanoidStateType"]
local larry3354 =larry3353["Seated"]
local larry3355 =larry3352(larry3338, larry3354)
local larry3356 =larry3338["ChangeState"]
local larry3357 =Enum["HumanoidStateType"]
local larry3358 =larry3357["Running"]
local larry3359 =larry3356(larry3338, larry3358)
local larry3326 =larry3325(larry3309, {
  ["Title"] = "Teleport to Dead Player",
  ["Callback"] = function(...)
local _3327_vararg1, _3327_vararg2, _3327_vararg3, _3327_vararg4, _3327_vararg5, _3327_vararg6, _3327_vararg7, _3327_vararg8, _3327_vararg9, _3327_vararg10 = ...
local larry3328 =larry3260["FindFirstChild"]
local larry3329 =larry3328(larry3260, "Characters")
local larry3330 =larry3329["FindFirstChild"]
local larry3331 =larry3330(larry3329, _3324_vararg1)
local larry3332 =larry3331["FindFirstChild"]
local larry3333 =larry3332(larry3331, "HumanoidRootPart")
local larry3334 =larry3261["Character"]
local larry3335 =larry3334["FindFirstChild"]
local larry3336 =larry3335(larry3334, "HumanoidRootPart")
local larry3337 =larry3334["FindFirstChildOfClass"]
local larry3338 =larry3337(larry3334, "Humanoid")
local larry3339 =larry3331["HumanoidRootPart"]
local larry3340 =larry3339["CFrame"]
local larry3341 =Vector3["new"]
local larry3342 =larry3341(0, 3, 0)
local larry3343 =(larry3340+larry3342)
larry3336["CFrame"] =larry3343
local larry3344 =Vector3["new"]
local larry3345 =larry3344(0, 0, 0)
larry3336["Velocity"] =larry3345
local larry3346 =Vector3["new"]
local larry3347 =larry3346(0, 0, 0)
larry3336["RotVelocity"] =larry3347
local _ =task.wait(0.05)
larry3338["PlatformStand"] =false
local larry3348 =larry3338["ChangeState"]
local larry3349 =Enum["HumanoidStateType"]
local larry3350 =larry3349["GettingUp"]
local larry3351 =larry3348(larry3338, larry3350)
local larry3352 =larry3338["ChangeState"]
local larry3353 =Enum["HumanoidStateType"]
local larry3354 =larry3353["Seated"]
local larry3355 =larry3352(larry3338, larry3354)
local larry3356 =larry3338["ChangeState"]
local larry3357 =Enum["HumanoidStateType"]
local larry3358 =larry3357["Running"]
local larry3359 =larry3356(larry3338, larry3358)
end,
})
local larry3360 =larry3309["Button"]
local larry3363 =larry3323["Refresh"]
local larry3364 =larry3260["FindFirstChild"]
local larry3365 =larry3364(larry3260, "Characters")
local larry3366 =larry3365["GetChildren"]
local larry3367 =larry3366(larry3365)
local larry3369 =_3368_2["IsA"]
local larry3370 =larry3369(_3368_2, "Model")
local larry3371 =_3368_2["FindFirstChild"]
local larry3372 =larry3371(_3368_2, "HumanoidRootPart")
local larry3373 =_3368_2["Name"]
local larry3374 =larry3373["sub"]
local larry3375 =larry3374(larry3373, -5)
local larry3376 =larry3363(larry3323, {})
local larry3361 =larry3360(larry3309, {
  ["Title"] = "Refresh Dead Player List",
  ["Callback"] = function(...)
local _3362_vararg1, _3362_vararg2, _3362_vararg3, _3362_vararg4, _3362_vararg5, _3362_vararg6, _3362_vararg7, _3362_vararg8, _3362_vararg9, _3362_vararg10 = ...
local larry3363 =larry3323["Refresh"]
local larry3364 =larry3260["FindFirstChild"]
local larry3365 =larry3364(larry3260, "Characters")
local larry3366 =larry3365["GetChildren"]
local larry3367 =larry3366(larry3365)
for larry3368, _3368_2 in ipairs(larry3367) do
local larry3369 =_3368_2["IsA"]
local larry3370 =larry3369(_3368_2, "Model")
local larry3371 =_3368_2["FindFirstChild"]
local larry3372 =larry3371(_3368_2, "HumanoidRootPart")
local larry3373 =_3368_2["Name"]
local larry3374 =larry3373["sub"]
local larry3375 =larry3374(larry3373, -5)
end
local larry3376 =larry3363(larry3323, {})
end,
})
local larry3377 =larry45["Section"]
local larry3378 =larry3377(larry45, {
  ["Opened"] = false,
  ["Icon"] = "baby",
  ["Title"] = "Kids",
  ["Desc"] = "TP To Lost Kids",
})
local larry3379 =larry3378["Dropdown"]
local larry3380 =larry3379(larry3378, {
  ["Value"] = "DinoKid",
  ["Callback"] = function(...)
local _3381_vararg1, _3381_vararg2, _3381_vararg3, _3381_vararg4, _3381_vararg5, _3381_vararg6, _3381_vararg7, _3381_vararg8, _3381_vararg9, _3381_vararg10 = ...

end,
  ["Values"] = {
  [1] = "DinoKid",
  [2] = "KrakenKid",
  [3] = "SquidKid",
  [4] = "KoalaKid",
},
  ["Title"] = "Select Kid",
})
local larry3382 =larry3378["Button"]
local larry3385 =game["GetService"]
local larry3386 =larry3385(game, "Players")
local larry3387 =larry3386["LocalPlayer"]
local larry3388 =larry3387["Character"]
local larry3389 =larry3388["WaitForChild"]
local larry3390 =larry3389(larry3388, "HumanoidRootPart")
local larry3391 =workspace["FindFirstChild"]
local larry3392 =larry3391(workspace, _3381_vararg1, true)
local larry3393 =larry3392["IsA"]
local larry3394 =larry3393(larry3392, "Model")
local larry3395 =larry3392["GetPivot"]
local larry3396 =larry3395(larry3392)
local larry3397 =Vector3["new"]
local larry3398 =larry3397(0, 5, 0)
local larry3383 =larry3382(larry3378, {
  ["Title"] = "Teleport to Kid",
  ["Callback"] = function(...)
local _3384_vararg1, _3384_vararg2, _3384_vararg3, _3384_vararg4, _3384_vararg5, _3384_vararg6, _3384_vararg7, _3384_vararg8, _3384_vararg9, _3384_vararg10 = ...
local larry3385 =game["GetService"]
local larry3386 =larry3385(game, "Players")
local larry3387 =larry3386["LocalPlayer"]
local larry3388 =larry3387["Character"]
local larry3389 =larry3388["WaitForChild"]
local larry3390 =larry3389(larry3388, "HumanoidRootPart")
local larry3391 =workspace["FindFirstChild"]
local larry3392 =larry3391(workspace, _3381_vararg1, true)
local larry3393 =larry3392["IsA"]
local larry3394 =larry3393(larry3392, "Model")
local larry3395 =larry3392["GetPivot"]
local larry3396 =larry3395(larry3392)
local larry3397 =Vector3["new"]
local larry3398 =larry3397(0, 5, 0)
local larry3399 =(larry3396+larry3398)
larry3390["CFrame"] =larry3399
end,
})
local larry3400 =larry45["Section"]
local larry3401 =larry3400(larry45, {
  ["Opened"] = false,
  ["Title"] = "Other",
  ["Icon"] = "shuffle",
  ["Desc"] = "TP To Different Places",
})
local larry3402 =larry3401["Button"]
local larry3405 =game["GetService"]
local larry3406 =larry3405(game, "Players")
local larry3407 =larry3406["LocalPlayer"]
local larry3408 =larry3407["Character"]
local larry3409 =larry3408["WaitForChild"]
local larry3410 =larry3409(larry3408, "HumanoidRootPart")
local larry3411 =workspace["FindFirstChild"]
local larry3412 =larry3411(workspace, "Pelt Trader", true)
local larry3413 =larry3412["IsA"]
local larry3414 =larry3413(larry3412, "Model")
local larry3415 =larry3412["GetPivot"]
local larry3416 =larry3415(larry3412)
local larry3417 =Vector3["new"]
local larry3418 =larry3417(0, 5, 0)
local larry3403 =larry3402(larry3401, {
  ["Title"] = "Teleport To Pelt Trader",
  ["Callback"] = function(...)
local _3404_vararg1, _3404_vararg2, _3404_vararg3, _3404_vararg4, _3404_vararg5, _3404_vararg6, _3404_vararg7, _3404_vararg8, _3404_vararg9, _3404_vararg10 = ...
local larry3405 =game["GetService"]
local larry3406 =larry3405(game, "Players")
local larry3407 =larry3406["LocalPlayer"]
local larry3408 =larry3407["Character"]
local larry3409 =larry3408["WaitForChild"]
local larry3410 =larry3409(larry3408, "HumanoidRootPart")
local larry3411 =workspace["FindFirstChild"]
local larry3412 =larry3411(workspace, "Pelt Trader", true)
local larry3413 =larry3412["IsA"]
local larry3414 =larry3413(larry3412, "Model")
local larry3415 =larry3412["GetPivot"]
local larry3416 =larry3415(larry3412)
local larry3417 =Vector3["new"]
local larry3418 =larry3417(0, 5, 0)
local larry3419 =(larry3416+larry3418)
larry3410["CFrame"] =larry3419
end,
})
local larry3420 =larry3401["Button"]
local larry3423 =game["GetService"]
local larry3424 =larry3423(game, "Players")
local larry3425 =larry3424["LocalPlayer"]
local larry3426 =larry3425["Character"]
local larry3427 =larry3426["WaitForChild"]
local larry3428 =larry3427(larry3426, "HumanoidRootPart")
local larry3429 =workspace["FindFirstChild"]
local larry3430 =larry3429(workspace, "Fairy", true)
local larry3431 =larry3430["IsA"]
local larry3432 =larry3431(larry3430, "Model")
local larry3433 =larry3430["GetPivot"]
local larry3434 =larry3433(larry3430)
local larry3435 =Vector3["new"]
local larry3436 =larry3435(0, 5, 0)
local larry3421 =larry3420(larry3401, {
  ["Title"] = "Teleport To Fairy",
  ["Callback"] = function(...)
local _3422_vararg1, _3422_vararg2, _3422_vararg3, _3422_vararg4, _3422_vararg5, _3422_vararg6, _3422_vararg7, _3422_vararg8, _3422_vararg9, _3422_vararg10 = ...
local larry3423 =game["GetService"]
local larry3424 =larry3423(game, "Players")
local larry3425 =larry3424["LocalPlayer"]
local larry3426 =larry3425["Character"]
local larry3427 =larry3426["WaitForChild"]
local larry3428 =larry3427(larry3426, "HumanoidRootPart")
local larry3429 =workspace["FindFirstChild"]
local larry3430 =larry3429(workspace, "Fairy", true)
local larry3431 =larry3430["IsA"]
local larry3432 =larry3431(larry3430, "Model")
local larry3433 =larry3430["GetPivot"]
local larry3434 =larry3433(larry3430)
local larry3435 =Vector3["new"]
local larry3436 =larry3435(0, 5, 0)
local larry3437 =(larry3434+larry3436)
larry3428["CFrame"] =larry3437
end,
})
local larry3438 =larry3401["Button"]
local larry3441 =game["GetService"]
local larry3442 =larry3441(game, "Players")
local larry3443 =larry3442["LocalPlayer"]
local larry3444 =larry3443["Character"]
local larry3445 =larry3444["WaitForChild"]
local larry3446 =larry3445(larry3444, "HumanoidRootPart")
local larry3447 =workspace["FindFirstChild"]
local larry3448 =larry3447(workspace, "Caravan", true)
local larry3449 =larry3448["IsA"]
local larry3450 =larry3449(larry3448, "Model")
local larry3451 =larry3448["GetPivot"]
local larry3452 =larry3451(larry3448)
local larry3453 =Vector3["new"]
local larry3454 =larry3453(0, 5, 0)
local larry3439 =larry3438(larry3401, {
  ["Title"] = "Teleport To Caravan",
  ["Callback"] = function(...)
local _3440_vararg1, _3440_vararg2, _3440_vararg3, _3440_vararg4, _3440_vararg5, _3440_vararg6, _3440_vararg7, _3440_vararg8, _3440_vararg9, _3440_vararg10 = ...
local larry3441 =game["GetService"]
local larry3442 =larry3441(game, "Players")
local larry3443 =larry3442["LocalPlayer"]
local larry3444 =larry3443["Character"]
local larry3445 =larry3444["WaitForChild"]
local larry3446 =larry3445(larry3444, "HumanoidRootPart")
local larry3447 =workspace["FindFirstChild"]
local larry3448 =larry3447(workspace, "Caravan", true)
local larry3449 =larry3448["IsA"]
local larry3450 =larry3449(larry3448, "Model")
local larry3451 =larry3448["GetPivot"]
local larry3452 =larry3451(larry3448)
local larry3453 =Vector3["new"]
local larry3454 =larry3453(0, 5, 0)
local larry3455 =(larry3452+larry3454)
larry3446["CFrame"] =larry3455
end,
})
local larry3456 =larry3401["Button"]
local larry3459 =game["GetService"]
local larry3460 =larry3459(game, "Players")
local larry3461 =larry3460["LocalPlayer"]
local larry3462 =larry3461["Character"]
local larry3463 =larry3462["WaitForChild"]
local larry3464 =larry3463(larry3462, "HumanoidRootPart")
local larry3465 =workspace["FindFirstChild"]
local larry3466 =larry3465(workspace, "Kings Palace", true)
local larry3467 =larry3466["IsA"]
local larry3468 =larry3467(larry3466, "Model")
local larry3469 =larry3466["GetPivot"]
local larry3470 =larry3469(larry3466)
local larry3471 =Vector3["new"]
local larry3472 =larry3471(0, 5, 0)
local larry3457 =larry3456(larry3401, {
  ["Title"] = "Teleport To Kings Palace",
  ["Callback"] = function(...)
local _3458_vararg1, _3458_vararg2, _3458_vararg3, _3458_vararg4, _3458_vararg5, _3458_vararg6, _3458_vararg7, _3458_vararg8, _3458_vararg9, _3458_vararg10 = ...
local larry3459 =game["GetService"]
local larry3460 =larry3459(game, "Players")
local larry3461 =larry3460["LocalPlayer"]
local larry3462 =larry3461["Character"]
local larry3463 =larry3462["WaitForChild"]
local larry3464 =larry3463(larry3462, "HumanoidRootPart")
local larry3465 =workspace["FindFirstChild"]
local larry3466 =larry3465(workspace, "Kings Palace", true)
local larry3467 =larry3466["IsA"]
local larry3468 =larry3467(larry3466, "Model")
local larry3469 =larry3466["GetPivot"]
local larry3470 =larry3469(larry3466)
local larry3471 =Vector3["new"]
local larry3472 =larry3471(0, 5, 0)
local larry3473 =(larry3470+larry3472)
larry3464["CFrame"] =larry3473
end,
})
local larry3474 =game["GetService"]
local larry3475 =larry3474(game, "HttpService")
local larry3476 =game["HttpGet"]
local larry3477 =larry3476(game, "https://raw.githubusercontent.com/fjruie/bringitems/refs/heads/main/BringItems.json")
local larry3478 =larry3475["JSONDecode"]
local larry3479 =larry3478(larry3475, larry3477)
local larry3480 =Vector3["new"]
local larry3481 =larry3480(0, 0, 0)
local larry3482 =larry47["Section"]
local larry3483 =larry3482(larry47, {
  ["Opened"] = false,
  ["Title"] = "Bring Items Settings",
  ["Icon"] = "settings",
  ["Desc"] = "Settings For Example How Many Items ",
})
local larry3484 =larry3483["Input"]
local larry3485 =larry3484(larry3483, {
  ["Placeholder"] = "Enter number...",
  ["Title"] = "Max Items to Bring",
  ["Value"] = "30",
  ["Callback"] = function(...)
local _3486_vararg1, _3486_vararg2, _3486_vararg3, _3486_vararg4, _3486_vararg5, _3486_vararg6, _3486_vararg7, _3486_vararg8, _3486_vararg9, _3486_vararg10 = ...

end,
  ["Desc"] = "Set the maximum number of items to bring (default: 30)",
})
local larry3487 =larry3483["Dropdown"]
local larry3488 =larry3487(larry3483, {
  ["Title"] = "Bring Cooldown (seconds)",
  ["Value"] = "0.4",
  ["Values"] = {
  [1] = "0.1",
  [2] = "0.2",
  [3] = "0.3",
  [4] = "0.4",
  [5] = "0.5",
  [6] = "0.6",
  [7] = "0.7",
  [8] = "0.8",
  [9] = "0.9",
  [10] = "1",
  [11] = "1.5",
  [12] = "2",
},
  ["Callback"] = function(...)
local _3489_vararg1, _3489_vararg2, _3489_vararg3, _3489_vararg4, _3489_vararg5, _3489_vararg6, _3489_vararg7, _3489_vararg8, _3489_vararg9, _3489_vararg10 = ...

end,
  ["Desc"] = "Delay between each batch of items brought",
})
local larry3490 =larry3483["Dropdown"]
local larry3491 =larry3490(larry3483, {
  ["Title"] = "Items Per Second",
  ["Value"] = "10",
  ["Values"] = {
  [1] = "1",
  [2] = "2",
  [3] = "3",
  [4] = "4",
  [5] = "5",
  [6] = "6",
  [7] = "7",
  [8] = "8",
  [9] = "9",
  [10] = "10",
  [11] = "12",
  [12] = "15",
  [13] = "20",
},
  ["Callback"] = function(...)
local _3492_vararg1, _3492_vararg2, _3492_vararg3, _3492_vararg4, _3492_vararg5, _3492_vararg6, _3492_vararg7, _3492_vararg8, _3492_vararg9, _3492_vararg10 = ...

end,
  ["Desc"] = "How many items to bring each second (controls batch size)",
})
local larry3493 =larry3483["Dropdown"]
local larry3494 =larry3493(larry3483, {
  ["Title"] = "Bring Position",
  ["Value"] = "Yourself",
  ["Values"] = {
  [1] = "Yourself",
  [2] = "Campfire",
},
  ["Callback"] = function(...)
local _3495_vararg1, _3495_vararg2, _3495_vararg3, _3495_vararg4, _3495_vararg5, _3495_vararg6, _3495_vararg7, _3495_vararg8, _3495_vararg9, _3495_vararg10 = ...

end,
  ["Desc"] = "Where to bring items to",
})
local larry3496 =game["GetService"]
local larry3497 =larry3496(game, "ReplicatedStorage")
local larry3498 =larry3497["WaitForChild"]
local larry3499 =larry3498(larry3497, "RemoteEvents")
local larry3500 =workspace["WaitForChild"]
local larry3501 =larry3500(workspace, "Items")
local larry3502 =larry3479["Update"]
local larry3504 =larry3479["Update"]
local larry3505 =larry47["Section"]
local larry3506 =larry3505(larry47, {
  ["Opened"] = false,
  ["Title"] = "Update",
  ["Icon"] = "cog",
  ["Desc"] = "New/updated items recently added to the game.",
})
local larry3508 =larry3506["Dropdown"]
local larry3509 =larry3508(larry3506, {
  ["Title"] = "Select Update Items",
  ["AllowNone"] = true,
  ["Multi"] = true,
  ["Callback"] = function(...)
local _3510_vararg1, _3510_vararg2, _3510_vararg3, _3510_vararg4, _3510_vararg5, _3510_vararg6, _3510_vararg7, _3510_vararg8, _3510_vararg9, _3510_vararg10 = ...

end,
  ["Values"] = {
  [1] = "Bring All",
  [2] = _3507_2,
},
})
local larry3511 =larry3506["Button"]
local larry3515, _3515_2, _3515_3 =table.find(_3510_vararg1, "Bring All")
local larry3516 =game["Players"]
local larry3517 =larry3516["LocalPlayer"]
local larry3518 =larry3517["Character"]
local larry3519 =game["Players"]
local larry3520 =larry3519["LocalPlayer"]
local larry3521 =larry3520["Character"]
local larry3522 =larry3521["FindFirstChild"]
local larry3523 =larry3522(larry3521, "HumanoidRootPart")
local larry3524 =larry3523["Position"]
local larry3525 =larry3501["GetChildren"]
local larry3526 =larry3525(larry3501)
local larry3529 =_3527_2["Name"]
local larry3530 =larry3529["lower"]
local larry3531 =larry3530(larry3529)
local larry3532 =_3528_2["lower"]
local larry3533 =larry3532(_3528_2)
local larry3535 =larry3533.."s"
local larry3537 =larry3531.."s"
local larry3539 =larry3533["sub"]
local larry3541 =larry3539(larry3533, 1, 32822226)
local larry3543 =larry3531["find"]
local larry3544 =larry3543(larry3531, larry3533, 1, true)
local larry3545 =task["spawn"]
local larry3548 =_3527_2["PrimaryPart"]
local larry3549 =_3527_2["PrimaryPart"]
local larry3550 =Vector3["new"]
local larry3551 =larry3550(-2, 5, -3)
local larry3553 =larry3499["RequestStartDraggingItem"]
local larry3554 =larry3553["FireServer"]
local larry3555 =larry3554(larry3553, _3527_2)
local _ =task.wait(0.1)
local larry3556 =_3527_2["SetPrimaryPartCFrame"]
local larry3557 =CFrame["new"]
local larry3558 =larry3557(larry3552)
local larry3559 =larry3556(_3527_2, larry3558)
local _ =task.wait(0.1)
local larry3560 =larry3499["StopDraggingItem"]
local larry3561 =larry3560["FireServer"]
local larry3562 =larry3561(larry3560, _3527_2)
local larry3546 =larry3545(function(...)
local _3547_vararg1, _3547_vararg2, _3547_vararg3, _3547_vararg4, _3547_vararg5, _3547_vararg6, _3547_vararg7, _3547_vararg8, _3547_vararg9, _3547_vararg10 = ...
local larry3548 =_3527_2["PrimaryPart"]
local larry3549 =_3527_2["PrimaryPart"]
local larry3550 =Vector3["new"]
local larry3551 =larry3550(-2, 5, -3)
local larry3552 =(larry3524+larry3551)
local larry3553 =larry3499["RequestStartDraggingItem"]
local larry3554 =larry3553["FireServer"]
local larry3555 =larry3554(larry3553, _3527_2)
local _ =task.wait(0.1)
local larry3556 =_3527_2["SetPrimaryPartCFrame"]
local larry3557 =CFrame["new"]
local larry3558 =larry3557(larry3552)
local larry3559 =larry3556(_3527_2, larry3558)
local _ =task.wait(0.1)
local larry3560 =larry3499["StopDraggingItem"]
local larry3561 =larry3560["FireServer"]
local larry3562 =larry3561(larry3560, _3527_2)
end)
local _ =task.wait(0.4)
local larry3563 =larry7["Notify"]
local larry3564 =larry3563(larry7, {
  ["Icon"] = "check",
  ["Duration"] = 2,
  ["Content"] = "Successfully brought 1 items!",
  ["Title"] = "Items Brought",
})
local larry3512 =larry3511(larry3506, {
  ["Callback"] = function(...)
local _3513_vararg1, _3513_vararg2, _3513_vararg3, _3513_vararg4, _3513_vararg5, _3513_vararg6, _3513_vararg7, _3513_vararg8, _3513_vararg9, _3513_vararg10 = ...
local larry3514 =#_3510_vararg1
local larry3515, _3515_2, _3515_3 =table.find(_3510_vararg1, "Bring All")
local larry3516 =game["Players"]
local larry3517 =larry3516["LocalPlayer"]
local larry3518 =larry3517["Character"]
local larry3519 =game["Players"]
local larry3520 =larry3519["LocalPlayer"]
local larry3521 =larry3520["Character"]
local larry3522 =larry3521["FindFirstChild"]
local larry3523 =larry3522(larry3521, "HumanoidRootPart")
local larry3524 =larry3523["Position"]
local larry3525 =larry3501["GetChildren"]
local larry3526 =larry3525(larry3501)
for larry3527, _3527_2 in ipairs(larry3526) do
for larry3528, _3528_2 in ipairs(larry3504) do
local larry3529 =_3527_2["Name"]
local larry3530 =larry3529["lower"]
local larry3531 =larry3530(larry3529)
local larry3532 =_3528_2["lower"]
local larry3533 =larry3532(_3528_2)
local larry3534 =(larry3531==larry3533)
local larry3535 =larry3533.."s"
local larry3536 =(larry3531==larry3535)
local larry3537 =larry3531.."s"
local larry3538 =(larry3537==larry3533)
local larry3539 =larry3533["sub"]
local larry3540 =#larry3533
local larry3541 =larry3539(larry3533, 1, 32822226)
local larry3542 =(larry3531==larry3541)
local larry3543 =larry3531["find"]
local larry3544 =larry3543(larry3531, larry3533, 1, true)
end
local larry3545 =task["spawn"]
local larry3546 =larry3545(function(...)
local _3547_vararg1, _3547_vararg2, _3547_vararg3, _3547_vararg4, _3547_vararg5, _3547_vararg6, _3547_vararg7, _3547_vararg8, _3547_vararg9, _3547_vararg10 = ...
local larry3548 =_3527_2["PrimaryPart"]
local larry3549 =_3527_2["PrimaryPart"]
local larry3550 =Vector3["new"]
local larry3551 =larry3550(-2, 5, -3)
local larry3552 =(larry3524+larry3551)
local larry3553 =larry3499["RequestStartDraggingItem"]
local larry3554 =larry3553["FireServer"]
local larry3555 =larry3554(larry3553, _3527_2)
local _ =task.wait(0.1)
local larry3556 =_3527_2["SetPrimaryPartCFrame"]
local larry3557 =CFrame["new"]
local larry3558 =larry3557(larry3552)
local larry3559 =larry3556(_3527_2, larry3558)
local _ =task.wait(0.1)
local larry3560 =larry3499["StopDraggingItem"]
local larry3561 =larry3560["FireServer"]
local larry3562 =larry3561(larry3560, _3527_2)
end)
local _ =task.wait(0.4)
local larry3563 =larry7["Notify"]
local larry3564 =larry3563(larry7, {
  ["Icon"] = "check",
  ["Duration"] = 2,
  ["Content"] = "Successfully brought 1 items!",
  ["Title"] = "Items Brought",
})
end
end,
  ["Icon"] = "arrow-down",
  ["Title"] = "Bring Selected Update",
})
local larry3565 =larry3479[larry3503]
local larry3566 =larry47["Section"]
local larry3567 =larry3566(larry47, {
  ["Opened"] = false,
  ["Title"] = larry3503,
  ["Icon"] = "box",
  ["Desc"] = "",
})
local larry3569 =larry3567["Dropdown"]
local larry3570 =larry3503.." Items"
local larry3571 ="Select "..larry3570
local larry3572 =larry3569(larry3567, {
  ["Title"] = larry3571,
  ["AllowNone"] = true,
  ["Multi"] = true,
  ["Callback"] = function(...)
local _3573_vararg1, _3573_vararg2, _3573_vararg3, _3573_vararg4, _3573_vararg5, _3573_vararg6, _3573_vararg7, _3573_vararg8, _3573_vararg9, _3573_vararg10 = ...

end,
  ["Values"] = {
  [1] = "Bring All",
  [2] = _3568_2,
},
})
local larry3574 =larry3567["Button"]
local larry3575 ="Bring Selected "..larry3503
local larry3579, _3579_2, _3579_3 =table.find(_3573_vararg1, "Bring All")
local larry3580 =game["Players"]
local larry3581 =larry3580["LocalPlayer"]
local larry3582 =larry3581["Character"]
local larry3583 =game["Players"]
local larry3584 =larry3583["LocalPlayer"]
local larry3585 =larry3584["Character"]
local larry3586 =larry3585["FindFirstChild"]
local larry3587 =larry3586(larry3585, "HumanoidRootPart")
local larry3588 =larry3587["Position"]
local larry3589 =larry3501["GetChildren"]
local larry3590 =larry3589(larry3501)
local larry3593 =_3591_2["Name"]
local larry3594 =larry3593["lower"]
local larry3595 =larry3594(larry3593)
local larry3596 =_3592_2["lower"]
local larry3597 =larry3596(_3592_2)
local larry3599 =larry3597.."s"
local larry3601 =larry3595.."s"
local larry3603 =larry3597["sub"]
local larry3605 =larry3603(larry3597, 1, 912803484)
local larry3607 =larry3595["find"]
local larry3608 =larry3607(larry3595, larry3597, 1, true)
local larry3609 =task["spawn"]
local larry3612 =_3591_2["PrimaryPart"]
local larry3613 =_3591_2["PrimaryPart"]
local larry3614 =Vector3["new"]
local larry3615 =larry3614(2, 7, -1)
local larry3617 =larry3499["RequestStartDraggingItem"]
local larry3618 =larry3617["FireServer"]
local larry3619 =larry3618(larry3617, _3591_2)
local _ =task.wait(0.1)
local larry3620 =_3591_2["SetPrimaryPartCFrame"]
local larry3621 =CFrame["new"]
local larry3622 =larry3621(larry3616)
local larry3623 =larry3620(_3591_2, larry3622)
local _ =task.wait(0.1)
local larry3624 =larry3499["StopDraggingItem"]
local larry3625 =larry3624["FireServer"]
local larry3626 =larry3625(larry3624, _3591_2)
local larry3610 =larry3609(function(...)
local _3611_vararg1, _3611_vararg2, _3611_vararg3, _3611_vararg4, _3611_vararg5, _3611_vararg6, _3611_vararg7, _3611_vararg8, _3611_vararg9, _3611_vararg10 = ...
local larry3612 =_3591_2["PrimaryPart"]
local larry3613 =_3591_2["PrimaryPart"]
local larry3614 =Vector3["new"]
local larry3615 =larry3614(2, 7, -1)
local larry3616 =(larry3588+larry3615)
local larry3617 =larry3499["RequestStartDraggingItem"]
local larry3618 =larry3617["FireServer"]
local larry3619 =larry3618(larry3617, _3591_2)
local _ =task.wait(0.1)
local larry3620 =_3591_2["SetPrimaryPartCFrame"]
local larry3621 =CFrame["new"]
local larry3622 =larry3621(larry3616)
local larry3623 =larry3620(_3591_2, larry3622)
local _ =task.wait(0.1)
local larry3624 =larry3499["StopDraggingItem"]
local larry3625 =larry3624["FireServer"]
local larry3626 =larry3625(larry3624, _3591_2)
end)
local _ =task.wait(0.4)
local larry3627 =larry7["Notify"]
local larry3628 =larry3627(larry7, {
  ["Icon"] = "check",
  ["Duration"] = 2,
  ["Content"] = "Successfully brought 1 items!",
  ["Title"] = "Items Brought",
})
local larry3576 =larry3574(larry3567, {
  ["Callback"] = function(...)
local _3577_vararg1, _3577_vararg2, _3577_vararg3, _3577_vararg4, _3577_vararg5, _3577_vararg6, _3577_vararg7, _3577_vararg8, _3577_vararg9, _3577_vararg10 = ...
local larry3578 =#_3573_vararg1
local larry3579, _3579_2, _3579_3 =table.find(_3573_vararg1, "Bring All")
local larry3580 =game["Players"]
local larry3581 =larry3580["LocalPlayer"]
local larry3582 =larry3581["Character"]
local larry3583 =game["Players"]
local larry3584 =larry3583["LocalPlayer"]
local larry3585 =larry3584["Character"]
local larry3586 =larry3585["FindFirstChild"]
local larry3587 =larry3586(larry3585, "HumanoidRootPart")
local larry3588 =larry3587["Position"]
local larry3589 =larry3501["GetChildren"]
local larry3590 =larry3589(larry3501)
for larry3591, _3591_2 in ipairs(larry3590) do
for larry3592, _3592_2 in ipairs(larry3565) do
local larry3593 =_3591_2["Name"]
local larry3594 =larry3593["lower"]
local larry3595 =larry3594(larry3593)
local larry3596 =_3592_2["lower"]
local larry3597 =larry3596(_3592_2)
local larry3598 =(larry3595==larry3597)
local larry3599 =larry3597.."s"
local larry3600 =(larry3595==larry3599)
local larry3601 =larry3595.."s"
local larry3602 =(larry3601==larry3597)
local larry3603 =larry3597["sub"]
local larry3604 =#larry3597
local larry3605 =larry3603(larry3597, 1, 912803484)
local larry3606 =(larry3595==larry3605)
local larry3607 =larry3595["find"]
local larry3608 =larry3607(larry3595, larry3597, 1, true)
end
local larry3609 =task["spawn"]
local larry3610 =larry3609(function(...)
local _3611_vararg1, _3611_vararg2, _3611_vararg3, _3611_vararg4, _3611_vararg5, _3611_vararg6, _3611_vararg7, _3611_vararg8, _3611_vararg9, _3611_vararg10 = ...
local larry3612 =_3591_2["PrimaryPart"]
local larry3613 =_3591_2["PrimaryPart"]
local larry3614 =Vector3["new"]
local larry3615 =larry3614(2, 7, -1)
local larry3616 =(larry3588+larry3615)
local larry3617 =larry3499["RequestStartDraggingItem"]
local larry3618 =larry3617["FireServer"]
local larry3619 =larry3618(larry3617, _3591_2)
local _ =task.wait(0.1)
local larry3620 =_3591_2["SetPrimaryPartCFrame"]
local larry3621 =CFrame["new"]
local larry3622 =larry3621(larry3616)
local larry3623 =larry3620(_3591_2, larry3622)
local _ =task.wait(0.1)
local larry3624 =larry3499["StopDraggingItem"]
local larry3625 =larry3624["FireServer"]
local larry3626 =larry3625(larry3624, _3591_2)
end)
local _ =task.wait(0.4)
local larry3627 =larry7["Notify"]
local larry3628 =larry3627(larry7, {
  ["Icon"] = "check",
  ["Duration"] = 2,
  ["Content"] = "Successfully brought 1 items!",
  ["Title"] = "Items Brought",
})
end
end,
  ["Icon"] = "arrow-down",
  ["Title"] = larry3575,
})
local larry3629 =larry47["Section"]
local larry3630 =larry3629(larry47, {
  ["Opened"] = false,
  ["Title"] = "Children",
  ["Icon"] = "user",
  ["Desc"] = "Auto Find Lost Kids",
})
local larry3631 =game["GetService"]
local larry3632 =larry3631(game, "Players")
local larry3633 =game["GetService"]
local larry3634 =larry3633(game, "ReplicatedStorage")
local larry3635 =larry3632["LocalPlayer"]
local larry3636 =Vector2["new"]
local larry3637 =larry3636(951, -728)
local larry3638 =Vector2["new"]
local larry3639 =larry3638(900, 800)
local larry3640 =Vector2["new"]
local larry3641 =larry3640(300, 1200)
local larry3642 =Vector2["new"]
local larry3643 =larry3642(-600, 1200)
local larry3644 =Vector2["new"]
local larry3645 =larry3644(-1400, 250)
local larry3646 =Vector2["new"]
local larry3647 =larry3646(-500, -1200)
local larry3648 =Vector2["new"]
local larry3649 =larry3648(-484, 509)
local larry3650 =Vector2["new"]
local larry3651 =larry3650(85, -1191)
local larry3652 =Vector2["new"]
local larry3653 =larry3652(500, -500)
local larry3654 =Vector2["new"]
local larry3655 =larry3654(1000, -400)
local larry3656 =Vector3["new"]
local larry3657 =larry3656(13.287363052368164, 3.999999761581421, 0.36212217807769775)
local larry3658 =Vector3["new"]
local larry3659 =larry3658(314, 20, 190)
local larry3660 =Vector3["new"]
local larry3661 =larry3660(369, 20, 74)
local larry3662 =Vector3["new"]
local larry3663 =larry3662(-249, 20, -274)
local larry3664 =Vector3["new"]
local larry3665 =larry3664(-31, 20, -40)
local larry3666 =Vector3["new"]
local larry3667 =larry3666(130, 20, 369)
local larry3668 =Vector3["new"]
local larry3669 =larry3668(648, 20, 200)
local larry3670 =Vector3["new"]
local larry3671 =larry3670(-555, 20, 600)
local larry3672 =Vector3["new"]
local larry3673 =larry3672(170, 20, 800)
local larry3674 =Vector3["new"]
local larry3675 =larry3674(-715, 20, -200)
local larry3676 =Vector3["new"]
local larry3677 =larry3676(-530, 20, -600)
local larry3678 =Vector3["new"]
local larry3679 =larry3678(604, 20, -831)
local larry3680 =Vector3["new"]
local larry3681 =larry3680(-1000, 20, 100)
local larry3682 =Vector3["new"]
local larry3683 =larry3682(392, 20, -794)
local larry3684 =Vector3["new"]
local larry3685 =larry3684(-870, 20, -445)
local larry3686 =Vector3["new"]
local larry3687 =larry3686(830, 20, -195)
local larry3688 =Vector3["new"]
local larry3689 =larry3688(600, 20, 1032)
local larry3690 =Vector3["new"]
local larry3691 =larry3690(800, 20, 900)
local larry3692 =Vector3["new"]
local larry3693 =larry3692(-1150, 20, -369)
local larry3694 =Vector3["new"]
local larry3695 =larry3694(969, 20, -725)
local larry3696 =Vector3["new"]
local larry3697 =larry3696(-514, 20, -1072)
local larry3698 =larry3630["Toggle"]
local larry3701 =task["spawn"]
local larry3704 =workspace["FindFirstChild"]
local larry3705 =larry3704(workspace, "Map")
local larry3706 =workspace["Map"]
local larry3707 =larry3706["FindFirstChild"]
local larry3708 =larry3707(larry3706, "Campground")
local larry3709 =workspace["Map"]
local larry3710 =larry3709["Campground"]
local larry3711 =larry3710["FindFirstChild"]
local larry3712 =larry3711(larry3710, "NoticeBoard")
local larry3713 =larry3712["FindFirstChild"]
local larry3714 =larry3713(larry3712, "Poster1")
local larry3715 =larry3714["FindFirstChild"]
local larry3716 =larry3715(larry3714, "Part")
local larry3717 =larry3714["Part"]
local larry3718 =larry3717["FindFirstChild"]
local larry3719 =larry3718(larry3717, "SurfaceGui")
local larry3720 =larry3714["Part"]
local larry3721 =larry3720["SurfaceGui"]
local larry3722 =larry3721["FindFirstChild"]
local larry3723 =larry3722(larry3721, "Frame")
local larry3724 =larry3714["Part"]
local larry3725 =larry3724["SurfaceGui"]
local larry3726 =larry3725["Frame"]
local larry3727 =larry3726["FoundLabel2"]
local larry3728 =larry3727["Visible"]
local larry3729 =larry3712["FindFirstChild"]
local larry3730 =larry3729(larry3712, "Poster2")
local larry3731 =larry3730["FindFirstChild"]
local larry3732 =larry3731(larry3730, "Part")
local larry3733 =larry3730["Part"]
local larry3734 =larry3733["FindFirstChild"]
local larry3735 =larry3734(larry3733, "SurfaceGui")
local larry3736 =larry3730["Part"]
local larry3737 =larry3736["SurfaceGui"]
local larry3738 =larry3737["FindFirstChild"]
local larry3739 =larry3738(larry3737, "Frame")
local larry3740 =larry3730["Part"]
local larry3741 =larry3740["SurfaceGui"]
local larry3742 =larry3741["Frame"]
local larry3743 =larry3742["FoundLabel2"]
local larry3744 =larry3743["Visible"]
local larry3745 =larry3712["FindFirstChild"]
local larry3746 =larry3745(larry3712, "Poster3")
local larry3747 =larry3746["FindFirstChild"]
local larry3748 =larry3747(larry3746, "Part")
local larry3749 =larry3746["Part"]
local larry3750 =larry3749["FindFirstChild"]
local larry3751 =larry3750(larry3749, "SurfaceGui")
local larry3752 =larry3746["Part"]
local larry3753 =larry3752["SurfaceGui"]
local larry3754 =larry3753["FindFirstChild"]
local larry3755 =larry3754(larry3753, "Frame")
local larry3756 =larry3746["Part"]
local larry3757 =larry3756["SurfaceGui"]
local larry3758 =larry3757["Frame"]
local larry3759 =larry3758["FoundLabel2"]
local larry3760 =larry3759["Visible"]
local larry3761 =larry3712["FindFirstChild"]
local larry3762 =larry3761(larry3712, "Poster4")
local larry3763 =larry3762["FindFirstChild"]
local larry3764 =larry3763(larry3762, "Part")
local larry3765 =larry3762["Part"]
local larry3766 =larry3765["FindFirstChild"]
local larry3767 =larry3766(larry3765, "SurfaceGui")
local larry3768 =larry3762["Part"]
local larry3769 =larry3768["SurfaceGui"]
local larry3770 =larry3769["FindFirstChild"]
local larry3771 =larry3770(larry3769, "Frame")
local larry3772 =larry3762["Part"]
local larry3773 =larry3772["SurfaceGui"]
local larry3774 =larry3773["Frame"]
local larry3775 =larry3774["FoundLabel2"]
local larry3776 =larry3775["Visible"]
local _ =task.wait(1)
local _ =task.wait(0.1)
local larry3777 =workspace["FindFirstChild"]
local larry3778 =larry3777(workspace, "Map")
local larry3779 =workspace["Map"]
local larry3780 =larry3779["FindFirstChild"]
local larry3781 =larry3780(larry3779, "Campground")
local larry3782 =workspace["Map"]
local larry3783 =larry3782["Campground"]
local larry3784 =larry3783["FindFirstChild"]
local larry3785 =larry3784(larry3783, "NoticeBoard")
local larry3786 =larry3785["FindFirstChild"]
local larry3787 =larry3786(larry3785, "Poster1")
local larry3788 =larry3787["FindFirstChild"]
local larry3789 =larry3788(larry3787, "Part")
local larry3790 =larry3787["Part"]
local larry3791 =larry3790["FindFirstChild"]
local larry3792 =larry3791(larry3790, "SurfaceGui")
local larry3793 =larry3787["Part"]
local larry3794 =larry3793["SurfaceGui"]
local larry3795 =larry3794["FindFirstChild"]
local larry3796 =larry3795(larry3794, "Frame")
local larry3797 =larry3787["Part"]
local larry3798 =larry3797["SurfaceGui"]
local larry3799 =larry3798["Frame"]
local larry3800 =larry3799["FoundLabel2"]
local larry3801 =larry3800["Visible"]
local larry3802 =larry3785["FindFirstChild"]
local larry3803 =larry3802(larry3785, "Poster2")
local larry3804 =larry3803["FindFirstChild"]
local larry3805 =larry3804(larry3803, "Part")
local larry3806 =larry3803["Part"]
local larry3807 =larry3806["FindFirstChild"]
local larry3808 =larry3807(larry3806, "SurfaceGui")
local larry3809 =larry3803["Part"]
local larry3810 =larry3809["SurfaceGui"]
local larry3811 =larry3810["FindFirstChild"]
local larry3812 =larry3811(larry3810, "Frame")
local larry3813 =larry3803["Part"]
local larry3814 =larry3813["SurfaceGui"]
local larry3815 =larry3814["Frame"]
local larry3816 =larry3815["FoundLabel2"]
local larry3817 =larry3816["Visible"]
local larry3818 =larry3785["FindFirstChild"]
local larry3819 =larry3818(larry3785, "Poster3")
local larry3820 =larry3819["FindFirstChild"]
local larry3821 =larry3820(larry3819, "Part")
local larry3822 =larry3819["Part"]
local larry3823 =larry3822["FindFirstChild"]
local larry3824 =larry3823(larry3822, "SurfaceGui")
local larry3825 =larry3819["Part"]
local larry3826 =larry3825["SurfaceGui"]
local larry3827 =larry3826["FindFirstChild"]
local larry3828 =larry3827(larry3826, "Frame")
local larry3829 =larry3819["Part"]
local larry3830 =larry3829["SurfaceGui"]
local larry3831 =larry3830["Frame"]
local larry3832 =larry3831["FoundLabel2"]
local larry3833 =larry3832["Visible"]
local larry3834 =larry3785["FindFirstChild"]
local larry3835 =larry3834(larry3785, "Poster4")
local larry3836 =larry3835["FindFirstChild"]
local larry3837 =larry3836(larry3835, "Part")
local larry3838 =larry3835["Part"]
local larry3839 =larry3838["FindFirstChild"]
local larry3840 =larry3839(larry3838, "SurfaceGui")
local larry3841 =larry3835["Part"]
local larry3842 =larry3841["SurfaceGui"]
local larry3843 =larry3842["FindFirstChild"]
local larry3844 =larry3843(larry3842, "Frame")
local larry3845 =larry3835["Part"]
local larry3846 =larry3845["SurfaceGui"]
local larry3847 =larry3846["Frame"]
local larry3848 =larry3847["FoundLabel2"]
local larry3849 =larry3848["Visible"]
local _ =task.wait(1)
local _ =task.wait(0.1)
local larry3850 =workspace["FindFirstChild"]
local larry3851 =larry3850(workspace, "Map")
local larry3852 =workspace["Map"]
local larry3853 =larry3852["FindFirstChild"]
local larry3854 =larry3853(larry3852, "Campground")
local larry3855 =workspace["Map"]
local larry3856 =larry3855["Campground"]
local larry3857 =larry3856["FindFirstChild"]
local larry3858 =larry3857(larry3856, "NoticeBoard")
local larry3859 =larry3858["FindFirstChild"]
local larry3860 =larry3859(larry3858, "Poster1")
local larry3861 =larry3860["FindFirstChild"]
local larry3862 =larry3861(larry3860, "Part")
local larry3863 =larry3860["Part"]
local larry3864 =larry3863["FindFirstChild"]
local larry3865 =larry3864(larry3863, "SurfaceGui")
local larry3866 =larry3860["Part"]
local larry3867 =larry3866["SurfaceGui"]
local larry3868 =larry3867["FindFirstChild"]
local larry3869 =larry3868(larry3867, "Frame")
local larry3870 =larry3860["Part"]
local larry3871 =larry3870["SurfaceGui"]
local larry3872 =larry3871["Frame"]
local larry3873 =larry3872["FoundLabel2"]
local larry3874 =larry3873["Visible"]
local larry3875 =larry3858["FindFirstChild"]
local larry3876 =larry3875(larry3858, "Poster2")
local larry3877 =larry3876["FindFirstChild"]
local larry3878 =larry3877(larry3876, "Part")
local larry3879 =larry3876["Part"]
local larry3880 =larry3879["FindFirstChild"]
local larry3881 =larry3880(larry3879, "SurfaceGui")
local larry3882 =larry3876["Part"]
local larry3883 =larry3882["SurfaceGui"]
local larry3884 =larry3883["FindFirstChild"]
local larry3885 =larry3884(larry3883, "Frame")
local larry3886 =larry3876["Part"]
local larry3887 =larry3886["SurfaceGui"]
local larry3888 =larry3887["Frame"]
local larry3889 =larry3888["FoundLabel2"]
local larry3890 =larry3889["Visible"]
local larry3891 =larry3858["FindFirstChild"]
local larry3892 =larry3891(larry3858, "Poster3")
local larry3893 =larry3892["FindFirstChild"]
local larry3894 =larry3893(larry3892, "Part")
local larry3895 =larry3892["Part"]
local larry3896 =larry3895["FindFirstChild"]
local larry3897 =larry3896(larry3895, "SurfaceGui")
local larry3898 =larry3892["Part"]
local larry3899 =larry3898["SurfaceGui"]
local larry3900 =larry3899["FindFirstChild"]
local larry3901 =larry3900(larry3899, "Frame")
local larry3902 =larry3892["Part"]
local larry3903 =larry3902["SurfaceGui"]
local larry3904 =larry3903["Frame"]
local larry3905 =larry3904["FoundLabel2"]
local larry3906 =larry3905["Visible"]
local larry3907 =larry3858["FindFirstChild"]
local larry3908 =larry3907(larry3858, "Poster4")
local larry3909 =larry3908["FindFirstChild"]
local larry3910 =larry3909(larry3908, "Part")
local larry3911 =larry3908["Part"]
local larry3912 =larry3911["FindFirstChild"]
local larry3913 =larry3912(larry3911, "SurfaceGui")
local larry3914 =larry3908["Part"]
local larry3915 =larry3914["SurfaceGui"]
local larry3916 =larry3915["FindFirstChild"]
local larry3917 =larry3916(larry3915, "Frame")
local larry3918 =larry3908["Part"]
local larry3919 =larry3918["SurfaceGui"]
local larry3920 =larry3919["Frame"]
local larry3921 =larry3920["FoundLabel2"]
local larry3922 =larry3921["Visible"]
local _ =task.wait(1)
local _ =task.wait(0.1)
local larry3923 =workspace["FindFirstChild"]
local larry3924 =larry3923(workspace, "Map")
local larry3925 =workspace["Map"]
local larry3926 =larry3925["FindFirstChild"]
local larry3927 =larry3926(larry3925, "Campground")
local larry3928 =workspace["Map"]
local larry3929 =larry3928["Campground"]
local larry3930 =larry3929["FindFirstChild"]
local larry3931 =larry3930(larry3929, "NoticeBoard")
local larry3932 =larry3931["FindFirstChild"]
local larry3933 =larry3932(larry3931, "Poster1")
local larry3934 =larry3933["FindFirstChild"]
local larry3935 =larry3934(larry3933, "Part")
local larry3936 =larry3933["Part"]
local larry3937 =larry3936["FindFirstChild"]
local larry3938 =larry3937(larry3936, "SurfaceGui")
local larry3939 =larry3933["Part"]
local larry3940 =larry3939["SurfaceGui"]
local larry3941 =larry3940["FindFirstChild"]
local larry3942 =larry3941(larry3940, "Frame")
local larry3943 =larry3933["Part"]
local larry3944 =larry3943["SurfaceGui"]
local larry3945 =larry3944["Frame"]
local larry3946 =larry3945["FoundLabel2"]
local larry3947 =larry3946["Visible"]
local larry3948 =larry3931["FindFirstChild"]
local larry3949 =larry3948(larry3931, "Poster2")
local larry3950 =larry3949["FindFirstChild"]
local larry3951 =larry3950(larry3949, "Part")
local larry3952 =larry3949["Part"]
local larry3953 =larry3952["FindFirstChild"]
local larry3954 =larry3953(larry3952, "SurfaceGui")
local larry3955 =larry3949["Part"]
local larry3956 =larry3955["SurfaceGui"]
local larry3957 =larry3956["FindFirstChild"]
local larry3958 =larry3957(larry3956, "Frame")
local larry3959 =larry3949["Part"]
local er =error("Luraph Script:2655: Luraph Script:2530: internal 542: <larry: infinitelooperror>")
local larry3702 =larry3701(function(...)
local _3703_vararg1, _3703_vararg2, _3703_vararg3, _3703_vararg4, _3703_vararg5, _3703_vararg6, _3703_vararg7, _3703_vararg8, _3703_vararg9, _3703_vararg10 = ...
local larry3704 =workspace["FindFirstChild"]
local larry3705 =larry3704(workspace, "Map")
local larry3706 =workspace["Map"]
local larry3707 =larry3706["FindFirstChild"]
local larry3708 =larry3707(larry3706, "Campground")
local larry3709 =workspace["Map"]
local larry3710 =larry3709["Campground"]
local larry3711 =larry3710["FindFirstChild"]
local larry3712 =larry3711(larry3710, "NoticeBoard")
local larry3713 =larry3712["FindFirstChild"]
local larry3714 =larry3713(larry3712, "Poster1")
local larry3715 =larry3714["FindFirstChild"]
local larry3716 =larry3715(larry3714, "Part")
local larry3717 =larry3714["Part"]
local larry3718 =larry3717["FindFirstChild"]
local larry3719 =larry3718(larry3717, "SurfaceGui")
local larry3720 =larry3714["Part"]
local larry3721 =larry3720["SurfaceGui"]
local larry3722 =larry3721["FindFirstChild"]
local larry3723 =larry3722(larry3721, "Frame")
local larry3724 =larry3714["Part"]
local larry3725 =larry3724["SurfaceGui"]
local larry3726 =larry3725["Frame"]
local larry3727 =larry3726["FoundLabel2"]
local larry3728 =larry3727["Visible"]
local larry3729 =larry3712["FindFirstChild"]
local larry3730 =larry3729(larry3712, "Poster2")
local larry3731 =larry3730["FindFirstChild"]
local larry3732 =larry3731(larry3730, "Part")
local larry3733 =larry3730["Part"]
local larry3734 =larry3733["FindFirstChild"]
local larry3735 =larry3734(larry3733, "SurfaceGui")
local larry3736 =larry3730["Part"]
local larry3737 =larry3736["SurfaceGui"]
local larry3738 =larry3737["FindFirstChild"]
local larry3739 =larry3738(larry3737, "Frame")
local larry3740 =larry3730["Part"]
local larry3741 =larry3740["SurfaceGui"]
local larry3742 =larry3741["Frame"]
local larry3743 =larry3742["FoundLabel2"]
local larry3744 =larry3743["Visible"]
local larry3745 =larry3712["FindFirstChild"]
local larry3746 =larry3745(larry3712, "Poster3")
local larry3747 =larry3746["FindFirstChild"]
local larry3748 =larry3747(larry3746, "Part")
local larry3749 =larry3746["Part"]
local larry3750 =larry3749["FindFirstChild"]
local larry3751 =larry3750(larry3749, "SurfaceGui")
local larry3752 =larry3746["Part"]
local larry3753 =larry3752["SurfaceGui"]
local larry3754 =larry3753["FindFirstChild"]
local larry3755 =larry3754(larry3753, "Frame")
local larry3756 =larry3746["Part"]
local larry3757 =larry3756["SurfaceGui"]
local larry3758 =larry3757["Frame"]
local larry3759 =larry3758["FoundLabel2"]
local larry3760 =larry3759["Visible"]
local larry3761 =larry3712["FindFirstChild"]
local larry3762 =larry3761(larry3712, "Poster4")
local larry3763 =larry3762["FindFirstChild"]
local larry3764 =larry3763(larry3762, "Part")
local larry3765 =larry3762["Part"]
local larry3766 =larry3765["FindFirstChild"]
local larry3767 =larry3766(larry3765, "SurfaceGui")
local larry3768 =larry3762["Part"]
local larry3769 =larry3768["SurfaceGui"]
local larry3770 =larry3769["FindFirstChild"]
local larry3771 =larry3770(larry3769, "Frame")
local larry3772 =larry3762["Part"]
local larry3773 =larry3772["SurfaceGui"]
local larry3774 =larry3773["Frame"]
local larry3775 =larry3774["FoundLabel2"]
local larry3776 =larry3775["Visible"]
local _ =task.wait(1)
local _ =task.wait(0.1)
local larry3777 =workspace["FindFirstChild"]
local larry3778 =larry3777(workspace, "Map")
local larry3779 =workspace["Map"]
local larry3780 =larry3779["FindFirstChild"]
local larry3781 =larry3780(larry3779, "Campground")
local larry3782 =workspace["Map"]
local larry3783 =larry3782["Campground"]
local larry3784 =larry3783["FindFirstChild"]
local larry3785 =larry3784(larry3783, "NoticeBoard")
local larry3786 =larry3785["FindFirstChild"]
local larry3787 =larry3786(larry3785, "Poster1")
local larry3788 =larry3787["FindFirstChild"]
local larry3789 =larry3788(larry3787, "Part")
local larry3790 =larry3787["Part"]
local larry3791 =larry3790["FindFirstChild"]
local larry3792 =larry3791(larry3790, "SurfaceGui")
local larry3793 =larry3787["Part"]
local larry3794 =larry3793["SurfaceGui"]
local larry3795 =larry3794["FindFirstChild"]
local larry3796 =larry3795(larry3794, "Frame")
local larry3797 =larry3787["Part"]
local larry3798 =larry3797["SurfaceGui"]
local larry3799 =larry3798["Frame"]
local larry3800 =larry3799["FoundLabel2"]
local larry3801 =larry3800["Visible"]
local larry3802 =larry3785["FindFirstChild"]
local larry3803 =larry3802(larry3785, "Poster2")
local larry3804 =larry3803["FindFirstChild"]
local larry3805 =larry3804(larry3803, "Part")
local larry3806 =larry3803["Part"]
local larry3807 =larry3806["FindFirstChild"]
local larry3808 =larry3807(larry3806, "SurfaceGui")
local larry3809 =larry3803["Part"]
local larry3810 =larry3809["SurfaceGui"]
local larry3811 =larry3810["FindFirstChild"]
local larry3812 =larry3811(larry3810, "Frame")
local larry3813 =larry3803["Part"]
local larry3814 =larry3813["SurfaceGui"]
local larry3815 =larry3814["Frame"]
local larry3816 =larry3815["FoundLabel2"]
local larry3817 =larry3816["Visible"]
local larry3818 =larry3785["FindFirstChild"]
local larry3819 =larry3818(larry3785, "Poster3")
local larry3820 =larry3819["FindFirstChild"]
local larry3821 =larry3820(larry3819, "Part")
local larry3822 =larry3819["Part"]
local larry3823 =larry3822["FindFirstChild"]
local larry3824 =larry3823(larry3822, "SurfaceGui")
local larry3825 =larry3819["Part"]
local larry3826 =larry3825["SurfaceGui"]
local larry3827 =larry3826["FindFirstChild"]
local larry3828 =larry3827(larry3826, "Frame")
local larry3829 =larry3819["Part"]
local larry3830 =larry3829["SurfaceGui"]
local larry3831 =larry3830["Frame"]
local larry3832 =larry3831["FoundLabel2"]
local larry3833 =larry3832["Visible"]
local larry3834 =larry3785["FindFirstChild"]
local larry3835 =larry3834(larry3785, "Poster4")
local larry3836 =larry3835["FindFirstChild"]
local larry3837 =larry3836(larry3835, "Part")
local larry3838 =larry3835["Part"]
local larry3839 =larry3838["FindFirstChild"]
local larry3840 =larry3839(larry3838, "SurfaceGui")
local larry3841 =larry3835["Part"]
local larry3842 =larry3841["SurfaceGui"]
local larry3843 =larry3842["FindFirstChild"]
local larry3844 =larry3843(larry3842, "Frame")
local larry3845 =larry3835["Part"]
local larry3846 =larry3845["SurfaceGui"]
local larry3847 =larry3846["Frame"]
local larry3848 =larry3847["FoundLabel2"]
local larry3849 =larry3848["Visible"]
local _ =task.wait(1)
local _ =task.wait(0.1)
local larry3850 =workspace["FindFirstChild"]
local larry3851 =larry3850(workspace, "Map")
local larry3852 =workspace["Map"]
local larry3853 =larry3852["FindFirstChild"]
local larry3854 =larry3853(larry3852, "Campground")
local larry3855 =workspace["Map"]
local larry3856 =larry3855["Campground"]
local larry3857 =larry3856["FindFirstChild"]
local larry3858 =larry3857(larry3856, "NoticeBoard")
local larry3859 =larry3858["FindFirstChild"]
local larry3860 =larry3859(larry3858, "Poster1")
local larry3861 =larry3860["FindFirstChild"]
local larry3862 =larry3861(larry3860, "Part")
local larry3863 =larry3860["Part"]
local larry3864 =larry3863["FindFirstChild"]
local larry3865 =larry3864(larry3863, "SurfaceGui")
local larry3866 =larry3860["Part"]
local larry3867 =larry3866["SurfaceGui"]
local larry3868 =larry3867["FindFirstChild"]
local larry3869 =larry3868(larry3867, "Frame")
local larry3870 =larry3860["Part"]
local larry3871 =larry3870["SurfaceGui"]
local larry3872 =larry3871["Frame"]
local larry3873 =larry3872["FoundLabel2"]
local larry3874 =larry3873["Visible"]
local larry3875 =larry3858["FindFirstChild"]
local larry3876 =larry3875(larry3858, "Poster2")
local larry3877 =larry3876["FindFirstChild"]
local larry3878 =larry3877(larry3876, "Part")
local larry3879 =larry3876["Part"]
local larry3880 =larry3879["FindFirstChild"]
local larry3881 =larry3880(larry3879, "SurfaceGui")
local larry3882 =larry3876["Part"]
local larry3883 =larry3882["SurfaceGui"]
local larry3884 =larry3883["FindFirstChild"]
local larry3885 =larry3884(larry3883, "Frame")
local larry3886 =larry3876["Part"]
local larry3887 =larry3886["SurfaceGui"]
local larry3888 =larry3887["Frame"]
local larry3889 =larry3888["FoundLabel2"]
local larry3890 =larry3889["Visible"]
local larry3891 =larry3858["FindFirstChild"]
local larry3892 =larry3891(larry3858, "Poster3")
local larry3893 =larry3892["FindFirstChild"]
local larry3894 =larry3893(larry3892, "Part")
local larry3895 =larry3892["Part"]
local larry3896 =larry3895["FindFirstChild"]
local larry3897 =larry3896(larry3895, "SurfaceGui")
local larry3898 =larry3892["Part"]
local larry3899 =larry3898["SurfaceGui"]
local larry3900 =larry3899["FindFirstChild"]
local larry3901 =larry3900(larry3899, "Frame")
local larry3902 =larry3892["Part"]
local larry3903 =larry3902["SurfaceGui"]
local larry3904 =larry3903["Frame"]
local larry3905 =larry3904["FoundLabel2"]
local larry3906 =larry3905["Visible"]
local larry3907 =larry3858["FindFirstChild"]
local larry3908 =larry3907(larry3858, "Poster4")
local larry3909 =larry3908["FindFirstChild"]
local larry3910 =larry3909(larry3908, "Part")
local larry3911 =larry3908["Part"]
local larry3912 =larry3911["FindFirstChild"]
local larry3913 =larry3912(larry3911, "SurfaceGui")
local larry3914 =larry3908["Part"]
local larry3915 =larry3914["SurfaceGui"]
local larry3916 =larry3915["FindFirstChild"]
local larry3917 =larry3916(larry3915, "Frame")
local larry3918 =larry3908["Part"]
local larry3919 =larry3918["SurfaceGui"]
local larry3920 =larry3919["Frame"]
local larry3921 =larry3920["FoundLabel2"]
local larry3922 =larry3921["Visible"]
local _ =task.wait(1)
local _ =task.wait(0.1)
local larry3923 =workspace["FindFirstChild"]
local larry3924 =larry3923(workspace, "Map")
local larry3925 =workspace["Map"]
local larry3926 =larry3925["FindFirstChild"]
local larry3927 =larry3926(larry3925, "Campground")
local larry3928 =workspace["Map"]
local larry3929 =larry3928["Campground"]
local larry3930 =larry3929["FindFirstChild"]
local larry3931 =larry3930(larry3929, "NoticeBoard")
local larry3932 =larry3931["FindFirstChild"]
local larry3933 =larry3932(larry3931, "Poster1")
local larry3934 =larry3933["FindFirstChild"]
local larry3935 =larry3934(larry3933, "Part")
local larry3936 =larry3933["Part"]
local larry3937 =larry3936["FindFirstChild"]
local larry3938 =larry3937(larry3936, "SurfaceGui")
local larry3939 =larry3933["Part"]
local larry3940 =larry3939["SurfaceGui"]
local larry3941 =larry3940["FindFirstChild"]
local larry3942 =larry3941(larry3940, "Frame")
local larry3943 =larry3933["Part"]
local larry3944 =larry3943["SurfaceGui"]
local larry3945 =larry3944["Frame"]
local larry3946 =larry3945["FoundLabel2"]
local larry3947 =larry3946["Visible"]
local larry3948 =larry3931["FindFirstChild"]
local larry3949 =larry3948(larry3931, "Poster2")
local larry3950 =larry3949["FindFirstChild"]
local larry3951 =larry3950(larry3949, "Part")
local larry3952 =larry3949["Part"]
local larry3953 =larry3952["FindFirstChild"]
local larry3954 =larry3953(larry3952, "SurfaceGui")
local larry3955 =larry3949["Part"]
local larry3956 =larry3955["SurfaceGui"]
local larry3957 =larry3956["FindFirstChild"]
local larry3958 =larry3957(larry3956, "Frame")
local er =error("Luraph Script:2655: Luraph Script:2530: internal 542: <larry: infinitelooperror>")
end)
local larry3960 =workspace["WaitForChild"]
local larry3961 =larry3960(workspace, "Characters")
local larry3962 =larry3961["ChildAdded"]
local larry3963 =larry3962["Connect"]
local larry3966 =_3965_vararg1["Name"]
local larry3967 =_3965_vararg1["Name"]
local larry3968 =_3965_vararg1["Name"]
local larry3969 =_3965_vararg1["Name"]
local larry3964 =larry3963(larry3962, function(...)
local _3965_vararg1, _3965_vararg2, _3965_vararg3, _3965_vararg4, _3965_vararg5, _3965_vararg6, _3965_vararg7, _3965_vararg8, _3965_vararg9, _3965_vararg10 = ...
local larry3966 =_3965_vararg1["Name"]
local larry3967 =_3965_vararg1["Name"]
local larry3968 =_3965_vararg1["Name"]
local larry3969 =_3965_vararg1["Name"]
end)
local larry3970 =workspace["WaitForChild"]
local larry3971 =larry3970(workspace, "Characters")
local larry3972 =larry3971["FindFirstChild"]
local larry3973 =larry3972(larry3971, "Lost Child")
local larry3974 =larry3971["FindFirstChild"]
local larry3975 =larry3974(larry3971, "Lost Child2")
local larry3976 =larry3971["FindFirstChild"]
local larry3977 =larry3976(larry3971, "Lost Child3")
local larry3978 =larry3971["FindFirstChild"]
local larry3979 =larry3978(larry3971, "Lost Child4")
local larry3980 =workspace["FindFirstChild"]
local larry3981 =larry3980(workspace, "Map")
local larry3982 =workspace["Map"]
local larry3983 =larry3982["FindFirstChild"]
local larry3984 =larry3983(larry3982, "Campground")
local larry3985 =workspace["Map"]
local larry3986 =larry3985["Campground"]
local larry3987 =larry3986["FindFirstChild"]
local larry3988 =larry3987(larry3986, "NoticeBoard")
local larry3989 =larry3988["FindFirstChild"]
local larry3990 =larry3989(larry3988, "Poster1")
local larry3991 =larry3990["FindFirstChild"]
local larry3992 =larry3991(larry3990, "Part")
local larry3993 =larry3990["Part"]
local er =error("Luraph Script:2699: Luraph Script:2685: Luraph Script:2529: internal 542: <larry: infinitelooperror>")
local larry3699 =larry3698(larry3630, {
  ["Callback"] = function(...)
local _3700_vararg1, _3700_vararg2, _3700_vararg3, _3700_vararg4, _3700_vararg5, _3700_vararg6, _3700_vararg7, _3700_vararg8, _3700_vararg9, _3700_vararg10 = ...
local larry3701 =task["spawn"]
local larry3702 =larry3701(function(...)
local _3703_vararg1, _3703_vararg2, _3703_vararg3, _3703_vararg4, _3703_vararg5, _3703_vararg6, _3703_vararg7, _3703_vararg8, _3703_vararg9, _3703_vararg10 = ...
local larry3704 =workspace["FindFirstChild"]
local larry3705 =larry3704(workspace, "Map")
local larry3706 =workspace["Map"]
local larry3707 =larry3706["FindFirstChild"]
local larry3708 =larry3707(larry3706, "Campground")
local larry3709 =workspace["Map"]
local larry3710 =larry3709["Campground"]
local larry3711 =larry3710["FindFirstChild"]
local larry3712 =larry3711(larry3710, "NoticeBoard")
local larry3713 =larry3712["FindFirstChild"]
local larry3714 =larry3713(larry3712, "Poster1")
local larry3715 =larry3714["FindFirstChild"]
local larry3716 =larry3715(larry3714, "Part")
local larry3717 =larry3714["Part"]
local larry3718 =larry3717["FindFirstChild"]
local larry3719 =larry3718(larry3717, "SurfaceGui")
local larry3720 =larry3714["Part"]
local larry3721 =larry3720["SurfaceGui"]
local larry3722 =larry3721["FindFirstChild"]
local larry3723 =larry3722(larry3721, "Frame")
local larry3724 =larry3714["Part"]
local larry3725 =larry3724["SurfaceGui"]
local larry3726 =larry3725["Frame"]
local larry3727 =larry3726["FoundLabel2"]
local larry3728 =larry3727["Visible"]
local larry3729 =larry3712["FindFirstChild"]
local larry3730 =larry3729(larry3712, "Poster2")
local larry3731 =larry3730["FindFirstChild"]
local larry3732 =larry3731(larry3730, "Part")
local larry3733 =larry3730["Part"]
local larry3734 =larry3733["FindFirstChild"]
local larry3735 =larry3734(larry3733, "SurfaceGui")
local larry3736 =larry3730["Part"]
local larry3737 =larry3736["SurfaceGui"]
local larry3738 =larry3737["FindFirstChild"]
local larry3739 =larry3738(larry3737, "Frame")
local larry3740 =larry3730["Part"]
local larry3741 =larry3740["SurfaceGui"]
local larry3742 =larry3741["Frame"]
local larry3743 =larry3742["FoundLabel2"]
local larry3744 =larry3743["Visible"]
local larry3745 =larry3712["FindFirstChild"]
local larry3746 =larry3745(larry3712, "Poster3")
local larry3747 =larry3746["FindFirstChild"]
local larry3748 =larry3747(larry3746, "Part")
local larry3749 =larry3746["Part"]
local larry3750 =larry3749["FindFirstChild"]
local larry3751 =larry3750(larry3749, "SurfaceGui")
local larry3752 =larry3746["Part"]
local larry3753 =larry3752["SurfaceGui"]
local larry3754 =larry3753["FindFirstChild"]
local larry3755 =larry3754(larry3753, "Frame")
local larry3756 =larry3746["Part"]
local larry3757 =larry3756["SurfaceGui"]
local larry3758 =larry3757["Frame"]
local larry3759 =larry3758["FoundLabel2"]
local larry3760 =larry3759["Visible"]
local larry3761 =larry3712["FindFirstChild"]
local larry3762 =larry3761(larry3712, "Poster4")
local larry3763 =larry3762["FindFirstChild"]
local larry3764 =larry3763(larry3762, "Part")
local larry3765 =larry3762["Part"]
local larry3766 =larry3765["FindFirstChild"]
local larry3767 =larry3766(larry3765, "SurfaceGui")
local larry3768 =larry3762["Part"]
local larry3769 =larry3768["SurfaceGui"]
local larry3770 =larry3769["FindFirstChild"]
local larry3771 =larry3770(larry3769, "Frame")
local larry3772 =larry3762["Part"]
local larry3773 =larry3772["SurfaceGui"]
local larry3774 =larry3773["Frame"]
local larry3775 =larry3774["FoundLabel2"]
local larry3776 =larry3775["Visible"]
local _ =task.wait(1)
local _ =task.wait(0.1)
local larry3777 =workspace["FindFirstChild"]
local larry3778 =larry3777(workspace, "Map")
local larry3779 =workspace["Map"]
local larry3780 =larry3779["FindFirstChild"]
local larry3781 =larry3780(larry3779, "Campground")
local larry3782 =workspace["Map"]
local larry3783 =larry3782["Campground"]
local larry3784 =larry3783["FindFirstChild"]
local larry3785 =larry3784(larry3783, "NoticeBoard")
local larry3786 =larry3785["FindFirstChild"]
local larry3787 =larry3786(larry3785, "Poster1")
local larry3788 =larry3787["FindFirstChild"]
local larry3789 =larry3788(larry3787, "Part")
local larry3790 =larry3787["Part"]
local larry3791 =larry3790["FindFirstChild"]
local larry3792 =larry3791(larry3790, "SurfaceGui")
local larry3793 =larry3787["Part"]
local larry3794 =larry3793["SurfaceGui"]
local larry3795 =larry3794["FindFirstChild"]
local larry3796 =larry3795(larry3794, "Frame")
local larry3797 =larry3787["Part"]
local larry3798 =larry3797["SurfaceGui"]
local larry3799 =larry3798["Frame"]
local larry3800 =larry3799["FoundLabel2"]
local larry3801 =larry3800["Visible"]
local larry3802 =larry3785["FindFirstChild"]
local larry3803 =larry3802(larry3785, "Poster2")
local larry3804 =larry3803["FindFirstChild"]
local larry3805 =larry3804(larry3803, "Part")
local larry3806 =larry3803["Part"]
local larry3807 =larry3806["FindFirstChild"]
local larry3808 =larry3807(larry3806, "SurfaceGui")
local larry3809 =larry3803["Part"]
local larry3810 =larry3809["SurfaceGui"]
local larry3811 =larry3810["FindFirstChild"]
local larry3812 =larry3811(larry3810, "Frame")
local larry3813 =larry3803["Part"]
local larry3814 =larry3813["SurfaceGui"]
local larry3815 =larry3814["Frame"]
local larry3816 =larry3815["FoundLabel2"]
local larry3817 =larry3816["Visible"]
local larry3818 =larry3785["FindFirstChild"]
local larry3819 =larry3818(larry3785, "Poster3")
local larry3820 =larry3819["FindFirstChild"]
local larry3821 =larry3820(larry3819, "Part")
local larry3822 =larry3819["Part"]
local larry3823 =larry3822["FindFirstChild"]
local larry3824 =larry3823(larry3822, "SurfaceGui")
local larry3825 =larry3819["Part"]
local larry3826 =larry3825["SurfaceGui"]
local larry3827 =larry3826["FindFirstChild"]
local larry3828 =larry3827(larry3826, "Frame")
local larry3829 =larry3819["Part"]
local larry3830 =larry3829["SurfaceGui"]
local larry3831 =larry3830["Frame"]
local larry3832 =larry3831["FoundLabel2"]
local larry3833 =larry3832["Visible"]
local larry3834 =larry3785["FindFirstChild"]
local larry3835 =larry3834(larry3785, "Poster4")
local larry3836 =larry3835["FindFirstChild"]
local larry3837 =larry3836(larry3835, "Part")
local larry3838 =larry3835["Part"]
local larry3839 =larry3838["FindFirstChild"]
local larry3840 =larry3839(larry3838, "SurfaceGui")
local larry3841 =larry3835["Part"]
local larry3842 =larry3841["SurfaceGui"]
local larry3843 =larry3842["FindFirstChild"]
local larry3844 =larry3843(larry3842, "Frame")
local larry3845 =larry3835["Part"]
local larry3846 =larry3845["SurfaceGui"]
local larry3847 =larry3846["Frame"]
local larry3848 =larry3847["FoundLabel2"]
local larry3849 =larry3848["Visible"]
local _ =task.wait(1)
local _ =task.wait(0.1)
local larry3850 =workspace["FindFirstChild"]
local larry3851 =larry3850(workspace, "Map")
local larry3852 =workspace["Map"]
local larry3853 =larry3852["FindFirstChild"]
local larry3854 =larry3853(larry3852, "Campground")
local larry3855 =workspace["Map"]
local larry3856 =larry3855["Campground"]
local larry3857 =larry3856["FindFirstChild"]
local larry3858 =larry3857(larry3856, "NoticeBoard")
local larry3859 =larry3858["FindFirstChild"]
local larry3860 =larry3859(larry3858, "Poster1")
local larry3861 =larry3860["FindFirstChild"]
local larry3862 =larry3861(larry3860, "Part")
local larry3863 =larry3860["Part"]
local larry3864 =larry3863["FindFirstChild"]
local larry3865 =larry3864(larry3863, "SurfaceGui")
local larry3866 =larry3860["Part"]
local larry3867 =larry3866["SurfaceGui"]
local larry3868 =larry3867["FindFirstChild"]
local larry3869 =larry3868(larry3867, "Frame")
local larry3870 =larry3860["Part"]
local larry3871 =larry3870["SurfaceGui"]
local larry3872 =larry3871["Frame"]
local larry3873 =larry3872["FoundLabel2"]
local larry3874 =larry3873["Visible"]
local larry3875 =larry3858["FindFirstChild"]
local larry3876 =larry3875(larry3858, "Poster2")
local larry3877 =larry3876["FindFirstChild"]
local larry3878 =larry3877(larry3876, "Part")
local larry3879 =larry3876["Part"]
local larry3880 =larry3879["FindFirstChild"]
local larry3881 =larry3880(larry3879, "SurfaceGui")
local larry3882 =larry3876["Part"]
local larry3883 =larry3882["SurfaceGui"]
local larry3884 =larry3883["FindFirstChild"]
local larry3885 =larry3884(larry3883, "Frame")
local larry3886 =larry3876["Part"]
local larry3887 =larry3886["SurfaceGui"]
local larry3888 =larry3887["Frame"]
local larry3889 =larry3888["FoundLabel2"]
local larry3890 =larry3889["Visible"]
local larry3891 =larry3858["FindFirstChild"]
local larry3892 =larry3891(larry3858, "Poster3")
local larry3893 =larry3892["FindFirstChild"]
local larry3894 =larry3893(larry3892, "Part")
local larry3895 =larry3892["Part"]
local larry3896 =larry3895["FindFirstChild"]
local larry3897 =larry3896(larry3895, "SurfaceGui")
local larry3898 =larry3892["Part"]
local larry3899 =larry3898["SurfaceGui"]
local larry3900 =larry3899["FindFirstChild"]
local larry3901 =larry3900(larry3899, "Frame")
local larry3902 =larry3892["Part"]
local larry3903 =larry3902["SurfaceGui"]
local larry3904 =larry3903["Frame"]
local larry3905 =larry3904["FoundLabel2"]
local larry3906 =larry3905["Visible"]
local larry3907 =larry3858["FindFirstChild"]
local larry3908 =larry3907(larry3858, "Poster4")
local larry3909 =larry3908["FindFirstChild"]
local larry3910 =larry3909(larry3908, "Part")
local larry3911 =larry3908["Part"]
local larry3912 =larry3911["FindFirstChild"]
local larry3913 =larry3912(larry3911, "SurfaceGui")
local larry3914 =larry3908["Part"]
local larry3915 =larry3914["SurfaceGui"]
local larry3916 =larry3915["FindFirstChild"]
local larry3917 =larry3916(larry3915, "Frame")
local larry3918 =larry3908["Part"]
local larry3919 =larry3918["SurfaceGui"]
local larry3920 =larry3919["Frame"]
local larry3921 =larry3920["FoundLabel2"]
local larry3922 =larry3921["Visible"]
local _ =task.wait(1)
local _ =task.wait(0.1)
local larry3923 =workspace["FindFirstChild"]
local larry3924 =larry3923(workspace, "Map")
local larry3925 =workspace["Map"]
local larry3926 =larry3925["FindFirstChild"]
local larry3927 =larry3926(larry3925, "Campground")
local larry3928 =workspace["Map"]
local larry3929 =larry3928["Campground"]
local larry3930 =larry3929["FindFirstChild"]
local larry3931 =larry3930(larry3929, "NoticeBoard")
local larry3932 =larry3931["FindFirstChild"]
local larry3933 =larry3932(larry3931, "Poster1")
local larry3934 =larry3933["FindFirstChild"]
local larry3935 =larry3934(larry3933, "Part")
local larry3936 =larry3933["Part"]
local larry3937 =larry3936["FindFirstChild"]
local larry3938 =larry3937(larry3936, "SurfaceGui")
local larry3939 =larry3933["Part"]
local larry3940 =larry3939["SurfaceGui"]
local larry3941 =larry3940["FindFirstChild"]
local larry3942 =larry3941(larry3940, "Frame")
local larry3943 =larry3933["Part"]
local larry3944 =larry3943["SurfaceGui"]
local larry3945 =larry3944["Frame"]
local larry3946 =larry3945["FoundLabel2"]
local larry3947 =larry3946["Visible"]
local larry3948 =larry3931["FindFirstChild"]
local larry3949 =larry3948(larry3931, "Poster2")
local larry3950 =larry3949["FindFirstChild"]
local larry3951 =larry3950(larry3949, "Part")
local larry3952 =larry3949["Part"]
local larry3953 =larry3952["FindFirstChild"]
local larry3954 =larry3953(larry3952, "SurfaceGui")
local larry3955 =larry3949["Part"]
local larry3956 =larry3955["SurfaceGui"]
local larry3957 =larry3956["FindFirstChild"]
local larry3958 =larry3957(larry3956, "Frame")
local er =error("Luraph Script:2655: Luraph Script:2530: internal 542: <larry: infinitelooperror>")
end)
local larry3960 =workspace["WaitForChild"]
local larry3961 =larry3960(workspace, "Characters")
local larry3962 =larry3961["ChildAdded"]
local larry3963 =larry3962["Connect"]
local larry3964 =larry3963(larry3962, function(...)
local _3965_vararg1, _3965_vararg2, _3965_vararg3, _3965_vararg4, _3965_vararg5, _3965_vararg6, _3965_vararg7, _3965_vararg8, _3965_vararg9, _3965_vararg10 = ...
local larry3966 =_3965_vararg1["Name"]
local larry3967 =_3965_vararg1["Name"]
local larry3968 =_3965_vararg1["Name"]
local larry3969 =_3965_vararg1["Name"]
end)
local larry3970 =workspace["WaitForChild"]
local larry3971 =larry3970(workspace, "Characters")
local larry3972 =larry3971["FindFirstChild"]
local larry3973 =larry3972(larry3971, "Lost Child")
local larry3974 =larry3971["FindFirstChild"]
local larry3975 =larry3974(larry3971, "Lost Child2")
local larry3976 =larry3971["FindFirstChild"]
local larry3977 =larry3976(larry3971, "Lost Child3")
local larry3978 =larry3971["FindFirstChild"]
local larry3979 =larry3978(larry3971, "Lost Child4")
local larry3980 =workspace["FindFirstChild"]
local larry3981 =larry3980(workspace, "Map")
local larry3982 =workspace["Map"]
local larry3983 =larry3982["FindFirstChild"]
local larry3984 =larry3983(larry3982, "Campground")
local larry3985 =workspace["Map"]
local larry3986 =larry3985["Campground"]
local larry3987 =larry3986["FindFirstChild"]
local larry3988 =larry3987(larry3986, "NoticeBoard")
local larry3989 =larry3988["FindFirstChild"]
local larry3990 =larry3989(larry3988, "Poster1")
local larry3991 =larry3990["FindFirstChild"]
local larry3992 =larry3991(larry3990, "Part")
local er =error("Luraph Script:2699: Luraph Script:2685: Luraph Script:2529: internal 542: <larry: infinitelooperror>")
end,
  ["Default"] = false,
  ["Title"] = "Childfarm: Lost Child Auto Sack",
  ["Desc"] = "Auto TP, scan, sack, camp, drop, repeat until all found",
})
local larry3994 =larry3630["Toggle"]
local larry3995 =larry3994(larry3630, {
  ["Callback"] = function(...)
local _3996_vararg1, _3996_vararg2, _3996_vararg3, _3996_vararg4, _3996_vararg5, _3996_vararg6, _3996_vararg7, _3996_vararg8, _3996_vararg9, _3996_vararg10 = ...
genv["ChildfarmEnableRandomTp"]=_3996_vararg1
end,
  ["Default"] = false,
  ["Title"] = "Enable random Tp to look for children",
  ["Desc"] = "Randomly teleport around to search for children (RECOMMENDED TO TURN ON FLY IN MISC TAB)",
})
local larry3997 =larry47["Section"]
local larry3998 =larry3997(larry47, {
  ["Opened"] = false,
  ["Icon"] = "box",
  ["Title"] = "Chests",
  ["Desc"] = "Brings Chests And Loot",
})
local larry3999 =larry3998["Button"]
local larry4002 =game["GetService"]
local larry4003 =larry4002(game, "Players")
local larry4004 =larry4003["LocalPlayer"]
local larry4005 =larry4004["Character"]
local larry4006 =larry4005["WaitForChild"]
local larry4007 =larry4006(larry4005, "HumanoidRootPart")
local larry4008 =larry4007["Position"]
local larry4009 =larry4007["CFrame"]
local larry4010 =larry4009["LookVector"]
local larry4013 =workspace["GetDescendants"]
local larry4014 =larry4013(workspace)
local larry4016 =_4015_2["IsA"]
local larry4017 =larry4016(_4015_2, "Model")
local larry4018 =_4015_2["Name"]
local larry4019, _4019_2, _4019_3 =string.find(larry4018, "Item Chest")
local larry4020 =_4015_2["PrimaryPart"]
local larry4021 =_4015_2["SetPrimaryPartCFrame"]
local larry4022 =CFrame["new"]
local larry4023 =larry4022(larry4012)
local larry4024 =larry4021(_4015_2, larry4023)
local larry4000 =larry3999(larry3998, {
  ["Callback"] = function(...)
local _4001_vararg1, _4001_vararg2, _4001_vararg3, _4001_vararg4, _4001_vararg5, _4001_vararg6, _4001_vararg7, _4001_vararg8, _4001_vararg9, _4001_vararg10 = ...
local larry4002 =game["GetService"]
local larry4003 =larry4002(game, "Players")
local larry4004 =larry4003["LocalPlayer"]
local larry4005 =larry4004["Character"]
local larry4006 =larry4005["WaitForChild"]
local larry4007 =larry4006(larry4005, "HumanoidRootPart")
local larry4008 =larry4007["Position"]
local larry4009 =larry4007["CFrame"]
local larry4010 =larry4009["LookVector"]
local larry4011 =(larry4010*10)
local larry4012 =(larry4008+larry4011)
local larry4013 =workspace["GetDescendants"]
local larry4014 =larry4013(workspace)
for larry4015, _4015_2 in pairs(larry4014) do
local larry4016 =_4015_2["IsA"]
local larry4017 =larry4016(_4015_2, "Model")
local larry4018 =_4015_2["Name"]
local larry4019, _4019_2, _4019_3 =string.find(larry4018, "Item Chest")
local larry4020 =_4015_2["PrimaryPart"]
_4015_2["PrimaryPart"] =larry4020
local larry4021 =_4015_2["SetPrimaryPartCFrame"]
local larry4022 =CFrame["new"]
local larry4023 =larry4022(larry4012)
local larry4024 =larry4021(_4015_2, larry4023)
end
end,
  ["Title"] = "Bring All Chests",
  ["Desc"] = "Teleport all chests near you",
})
local larry4025 =game["GetService"]
local larry4026 =larry4025(game, "Players")
local larry4027 =larry4026["LocalPlayer"]
local larry4028 =game["GetService"]
local larry4029 =larry4028(game, "Workspace")
local larry4030 =larry3998["Toggle"]
local larry4033 =larry4027["Character"]
local larry4034 =larry4027["Character"]
local larry4035 =larry4034["FindFirstChild"]
local larry4036 =larry4035(larry4034, "HumanoidRootPart")
local larry4037 =larry4036["CFrame"]
local larry4038 =task["spawn"]
local larry4041 =larry4029["FindFirstChild"]
local larry4042 =larry4041(larry4029, "Items")
local larry4043 =larry4042["GetChildren"]
local larry4044 =larry4043(larry4042)
local larry4046 =_4045_2["IsA"]
local larry4047 =larry4046(_4045_2, "Model")
local larry4048 =_4045_2["Name"]
local larry4049 =larry4048["match"]
local larry4050 =larry4049(larry4048, "^Item Chest%d*$")
local larry4051 =_4045_2["FindFirstChildWhichIsA"]
local larry4052 =larry4051(_4045_2, "ProximityPrompt", true)
local larry4053 =larry4027["Character"]
local larry4054 =larry4027["Character"]
local larry4055 =larry4054["FindFirstChild"]
local larry4056 =larry4055(larry4054, "HumanoidRootPart")
local larry4057 =_4045_2["FindFirstChildWhichIsA"]
local larry4058 =larry4057(_4045_2, "BasePart")
local larry4059 =larry4058["CFrame"]
local larry4060 =Vector3["new"]
local larry4061 =larry4060(0, 3, 0)
local _ =task.wait(0.25)
local larry4063 =fireproximityprompt(larry4052, 3)
local _ =task.wait(0.5)
local larry4064 =larry4058["Position"]
local larry4065 =larry4037["Position"]
local larry4066 =larry4029["Items"]
local larry4067 =larry4066["GetChildren"]
local larry4068 =larry4067(larry4066)
local larry4070 =_4069_2["FindFirstChildWhichIsA"]
local larry4071 =larry4070(_4069_2, "BasePart")
local larry4072 =larry4071["Position"]
local larry4074 =larry4073["Magnitude"]
local er =error("Luraph Script:2781: Luraph Script:2746: line 3: attempt to compare table <= number")
local larry4039 =larry4038(function(...)
local _4040_vararg1, _4040_vararg2, _4040_vararg3, _4040_vararg4, _4040_vararg5, _4040_vararg6, _4040_vararg7, _4040_vararg8, _4040_vararg9, _4040_vararg10 = ...
local larry4041 =larry4029["FindFirstChild"]
local larry4042 =larry4041(larry4029, "Items")
local larry4043 =larry4042["GetChildren"]
local larry4044 =larry4043(larry4042)
for larry4045, _4045_2 in ipairs(larry4044) do
local larry4046 =_4045_2["IsA"]
local larry4047 =larry4046(_4045_2, "Model")
local larry4048 =_4045_2["Name"]
local larry4049 =larry4048["match"]
local larry4050 =larry4049(larry4048, "^Item Chest%d*$")
local larry4051 =_4045_2["FindFirstChildWhichIsA"]
local larry4052 =larry4051(_4045_2, "ProximityPrompt", true)
local larry4053 =larry4027["Character"]
local larry4054 =larry4027["Character"]
local larry4055 =larry4054["FindFirstChild"]
local larry4056 =larry4055(larry4054, "HumanoidRootPart")
local larry4057 =_4045_2["FindFirstChildWhichIsA"]
local larry4058 =larry4057(_4045_2, "BasePart")
local larry4059 =larry4058["CFrame"]
local larry4060 =Vector3["new"]
local larry4061 =larry4060(0, 3, 0)
local larry4062 =(larry4059+larry4061)
larry4056["CFrame"] =larry4062
local _ =task.wait(0.25)
local larry4063 =fireproximityprompt(larry4052, 3)
local _ =task.wait(0.5)
local larry4064 =larry4058["Position"]
local larry4065 =larry4037["Position"]
local larry4066 =larry4029["Items"]
local larry4067 =larry4066["GetChildren"]
local larry4068 =larry4067(larry4066)
for larry4069, _4069_2 in ipairs(larry4068) do
local larry4070 =_4069_2["FindFirstChildWhichIsA"]
local larry4071 =larry4070(_4069_2, "BasePart")
local larry4072 =larry4071["Position"]
local larry4073 =(larry4072- larry4064)
local larry4074 =larry4073["Magnitude"]
local er =error("Luraph Script:2781: Luraph Script:2746: line 3: attempt to compare table <= number")
end
end
end)
local larry4031 =larry4030(larry3998, {
  ["Callback"] = function(...)
local _4032_vararg1, _4032_vararg2, _4032_vararg3, _4032_vararg4, _4032_vararg5, _4032_vararg6, _4032_vararg7, _4032_vararg8, _4032_vararg9, _4032_vararg10 = ...
local larry4033 =larry4027["Character"]
local larry4034 =larry4027["Character"]
local larry4035 =larry4034["FindFirstChild"]
local larry4036 =larry4035(larry4034, "HumanoidRootPart")
local larry4037 =larry4036["CFrame"]
local larry4038 =task["spawn"]
local larry4039 =larry4038(function(...)
local _4040_vararg1, _4040_vararg2, _4040_vararg3, _4040_vararg4, _4040_vararg5, _4040_vararg6, _4040_vararg7, _4040_vararg8, _4040_vararg9, _4040_vararg10 = ...
local larry4041 =larry4029["FindFirstChild"]
local larry4042 =larry4041(larry4029, "Items")
local larry4043 =larry4042["GetChildren"]
local larry4044 =larry4043(larry4042)
for larry4045, _4045_2 in ipairs(larry4044) do
local larry4046 =_4045_2["IsA"]
local larry4047 =larry4046(_4045_2, "Model")
local larry4048 =_4045_2["Name"]
local larry4049 =larry4048["match"]
local larry4050 =larry4049(larry4048, "^Item Chest%d*$")
local larry4051 =_4045_2["FindFirstChildWhichIsA"]
local larry4052 =larry4051(_4045_2, "ProximityPrompt", true)
local larry4053 =larry4027["Character"]
local larry4054 =larry4027["Character"]
local larry4055 =larry4054["FindFirstChild"]
local larry4056 =larry4055(larry4054, "HumanoidRootPart")
local larry4057 =_4045_2["FindFirstChildWhichIsA"]
local larry4058 =larry4057(_4045_2, "BasePart")
local larry4059 =larry4058["CFrame"]
local larry4060 =Vector3["new"]
local larry4061 =larry4060(0, 3, 0)
local larry4062 =(larry4059+larry4061)
larry4056["CFrame"] =larry4062
local _ =task.wait(0.25)
local larry4063 =fireproximityprompt(larry4052, 3)
local _ =task.wait(0.5)
local larry4064 =larry4058["Position"]
local larry4065 =larry4037["Position"]
local larry4066 =larry4029["Items"]
local larry4067 =larry4066["GetChildren"]
local larry4068 =larry4067(larry4066)
for larry4069, _4069_2 in ipairs(larry4068) do
local larry4070 =_4069_2["FindFirstChildWhichIsA"]
local larry4071 =larry4070(_4069_2, "BasePart")
local larry4072 =larry4071["Position"]
local larry4073 =(larry4072- larry4064)
local larry4074 =larry4073["Magnitude"]
local er =error("Luraph Script:2781: Luraph Script:2746: line 3: attempt to compare table <= number")
end
end
end)
end,
  ["Default"] = false,
  ["Title"] = "Auto Grab Chest Loot",
  ["Desc"] = "When Turned On TPS to chests and grabs loot and comes back",
})
local larry4075 =larry3998["Button"]
local larry4078 =task["spawn"]
local larry4081 =larry4029["FindFirstChild"]
local larry4082 =larry4081(larry4029, "Items")
local larry4083 =larry4082["GetChildren"]
local larry4084 =larry4083(larry4082)
local larry4086 =_4085_2["IsA"]
local larry4087 =larry4086(_4085_2, "Model")
local larry4088 =_4085_2["Name"]
local larry4089 =larry4088["match"]
local larry4090 =larry4089(larry4088, "^Item Chest%d*$")
local larry4091 =_4085_2["FindFirstChildWhichIsA"]
local larry4092 =larry4091(_4085_2, "ProximityPrompt", true)
local larry4093 =fireproximityprompt(larry4092, 3)
local _ =task.wait(2)
local larry4094 =larry4029["FindFirstChild"]
local larry4095 =larry4094(larry4029, "Items")
local larry4096 =larry4095["GetChildren"]
local larry4097 =larry4096(larry4095)
local larry4099 =_4098_2["IsA"]
local larry4100 =larry4099(_4098_2, "Model")
local larry4101 =_4098_2["Name"]
local larry4102 =larry4101["match"]
local larry4103 =larry4102(larry4101, "^Item Chest%d*$")
local larry4104 =_4098_2["FindFirstChildWhichIsA"]
local larry4105 =larry4104(_4098_2, "ProximityPrompt", true)
local larry4106 =fireproximityprompt(larry4105, 3)
local _ =task.wait(2)
local larry4107 =larry4029["FindFirstChild"]
local larry4108 =larry4107(larry4029, "Items")
local larry4109 =larry4108["GetChildren"]
local larry4110 =larry4109(larry4108)
local larry4112 =_4111_2["IsA"]
local larry4113 =larry4112(_4111_2, "Model")
local larry4114 =_4111_2["Name"]
local larry4115 =larry4114["match"]
local larry4116 =larry4115(larry4114, "^Item Chest%d*$")
local larry4117 =_4111_2["FindFirstChildWhichIsA"]
local larry4118 =larry4117(_4111_2, "ProximityPrompt", true)
local larry4119 =fireproximityprompt(larry4118, 3)
local _ =task.wait(2)
local larry4120 =larry4029["FindFirstChild"]
local larry4121 =larry4120(larry4029, "Items")
local larry4122 =larry4121["GetChildren"]
local larry4123 =larry4122(larry4121)
local larry4125 =_4124_2["IsA"]
local larry4126 =larry4125(_4124_2, "Model")
local larry4127 =_4124_2["Name"]
local larry4128 =larry4127["match"]
local larry4129 =larry4128(larry4127, "^Item Chest%d*$")
local larry4130 =_4124_2["FindFirstChildWhichIsA"]
local larry4131 =larry4130(_4124_2, "ProximityPrompt", true)
local larry4132 =fireproximityprompt(larry4131, 3)
local _ =task.wait(2)
local larry4133 =larry4029["FindFirstChild"]
local larry4134 =larry4133(larry4029, "Items")
local larry4135 =larry4134["GetChildren"]
local larry4136 =larry4135(larry4134)
local larry4138 =_4137_2["IsA"]
local larry4139 =larry4138(_4137_2, "Model")
local larry4140 =_4137_2["Name"]
local larry4141 =larry4140["match"]
local larry4142 =larry4141(larry4140, "^Item Chest%d*$")
local larry4143 =_4137_2["FindFirstChildWhichIsA"]
local larry4144 =larry4143(_4137_2, "ProximityPrompt", true)
local larry4145 =fireproximityprompt(larry4144, 3)
local _ =task.wait(2)
local larry4146 =larry4029["FindFirstChild"]
local er =error("Luraph Script:2806: internal 542: <larry: infinitelooperror>")
local larry4079 =larry4078(function(...)
local _4080_vararg1, _4080_vararg2, _4080_vararg3, _4080_vararg4, _4080_vararg5, _4080_vararg6, _4080_vararg7, _4080_vararg8, _4080_vararg9, _4080_vararg10 = ...
local larry4081 =larry4029["FindFirstChild"]
local larry4082 =larry4081(larry4029, "Items")
local larry4083 =larry4082["GetChildren"]
local larry4084 =larry4083(larry4082)
for larry4085, _4085_2 in ipairs(larry4084) do
local larry4086 =_4085_2["IsA"]
local larry4087 =larry4086(_4085_2, "Model")
local larry4088 =_4085_2["Name"]
local larry4089 =larry4088["match"]
local larry4090 =larry4089(larry4088, "^Item Chest%d*$")
local larry4091 =_4085_2["FindFirstChildWhichIsA"]
local larry4092 =larry4091(_4085_2, "ProximityPrompt", true)
local larry4093 =fireproximityprompt(larry4092, 3)
end
local _ =task.wait(2)
local larry4094 =larry4029["FindFirstChild"]
local larry4095 =larry4094(larry4029, "Items")
local larry4096 =larry4095["GetChildren"]
local larry4097 =larry4096(larry4095)
for larry4098, _4098_2 in ipairs(larry4097) do
local larry4099 =_4098_2["IsA"]
local larry4100 =larry4099(_4098_2, "Model")
local larry4101 =_4098_2["Name"]
local larry4102 =larry4101["match"]
local larry4103 =larry4102(larry4101, "^Item Chest%d*$")
local larry4104 =_4098_2["FindFirstChildWhichIsA"]
local larry4105 =larry4104(_4098_2, "ProximityPrompt", true)
local larry4106 =fireproximityprompt(larry4105, 3)
end
local _ =task.wait(2)
local larry4107 =larry4029["FindFirstChild"]
local larry4108 =larry4107(larry4029, "Items")
local larry4109 =larry4108["GetChildren"]
local larry4110 =larry4109(larry4108)
for larry4111, _4111_2 in ipairs(larry4110) do
local larry4112 =_4111_2["IsA"]
local larry4113 =larry4112(_4111_2, "Model")
local larry4114 =_4111_2["Name"]
local larry4115 =larry4114["match"]
local larry4116 =larry4115(larry4114, "^Item Chest%d*$")
local larry4117 =_4111_2["FindFirstChildWhichIsA"]
local larry4118 =larry4117(_4111_2, "ProximityPrompt", true)
local larry4119 =fireproximityprompt(larry4118, 3)
end
local _ =task.wait(2)
local larry4120 =larry4029["FindFirstChild"]
local larry4121 =larry4120(larry4029, "Items")
local larry4122 =larry4121["GetChildren"]
local larry4123 =larry4122(larry4121)
for larry4124, _4124_2 in ipairs(larry4123) do
local larry4125 =_4124_2["IsA"]
local larry4126 =larry4125(_4124_2, "Model")
local larry4127 =_4124_2["Name"]
local larry4128 =larry4127["match"]
local larry4129 =larry4128(larry4127, "^Item Chest%d*$")
local larry4130 =_4124_2["FindFirstChildWhichIsA"]
local larry4131 =larry4130(_4124_2, "ProximityPrompt", true)
local larry4132 =fireproximityprompt(larry4131, 3)
end
local _ =task.wait(2)
local larry4133 =larry4029["FindFirstChild"]
local larry4134 =larry4133(larry4029, "Items")
local larry4135 =larry4134["GetChildren"]
local larry4136 =larry4135(larry4134)
for larry4137, _4137_2 in ipairs(larry4136) do
local larry4138 =_4137_2["IsA"]
local larry4139 =larry4138(_4137_2, "Model")
local larry4140 =_4137_2["Name"]
local larry4141 =larry4140["match"]
local larry4142 =larry4141(larry4140, "^Item Chest%d*$")
local larry4143 =_4137_2["FindFirstChildWhichIsA"]
local larry4144 =larry4143(_4137_2, "ProximityPrompt", true)
local larry4145 =fireproximityprompt(larry4144, 3)
end
local _ =task.wait(2)
local er =error("Luraph Script:2806: internal 542: <larry: infinitelooperror>")
end)
local larry4076 =larry4075(larry3998, {
  ["Callback"] = function(...)
local _4077_vararg1, _4077_vararg2, _4077_vararg3, _4077_vararg4, _4077_vararg5, _4077_vararg6, _4077_vararg7, _4077_vararg8, _4077_vararg9, _4077_vararg10 = ...
local larry4078 =task["spawn"]
local larry4079 =larry4078(function(...)
local _4080_vararg1, _4080_vararg2, _4080_vararg3, _4080_vararg4, _4080_vararg5, _4080_vararg6, _4080_vararg7, _4080_vararg8, _4080_vararg9, _4080_vararg10 = ...
local larry4081 =larry4029["FindFirstChild"]
local larry4082 =larry4081(larry4029, "Items")
local larry4083 =larry4082["GetChildren"]
local larry4084 =larry4083(larry4082)
for larry4085, _4085_2 in ipairs(larry4084) do
local larry4086 =_4085_2["IsA"]
local larry4087 =larry4086(_4085_2, "Model")
local larry4088 =_4085_2["Name"]
local larry4089 =larry4088["match"]
local larry4090 =larry4089(larry4088, "^Item Chest%d*$")
local larry4091 =_4085_2["FindFirstChildWhichIsA"]
local larry4092 =larry4091(_4085_2, "ProximityPrompt", true)
local larry4093 =fireproximityprompt(larry4092, 3)
end
local _ =task.wait(2)
local larry4094 =larry4029["FindFirstChild"]
local larry4095 =larry4094(larry4029, "Items")
local larry4096 =larry4095["GetChildren"]
local larry4097 =larry4096(larry4095)
for larry4098, _4098_2 in ipairs(larry4097) do
local larry4099 =_4098_2["IsA"]
local larry4100 =larry4099(_4098_2, "Model")
local larry4101 =_4098_2["Name"]
local larry4102 =larry4101["match"]
local larry4103 =larry4102(larry4101, "^Item Chest%d*$")
local larry4104 =_4098_2["FindFirstChildWhichIsA"]
local larry4105 =larry4104(_4098_2, "ProximityPrompt", true)
local larry4106 =fireproximityprompt(larry4105, 3)
end
local _ =task.wait(2)
local larry4107 =larry4029["FindFirstChild"]
local larry4108 =larry4107(larry4029, "Items")
local larry4109 =larry4108["GetChildren"]
local larry4110 =larry4109(larry4108)
for larry4111, _4111_2 in ipairs(larry4110) do
local larry4112 =_4111_2["IsA"]
local larry4113 =larry4112(_4111_2, "Model")
local larry4114 =_4111_2["Name"]
local larry4115 =larry4114["match"]
local larry4116 =larry4115(larry4114, "^Item Chest%d*$")
local larry4117 =_4111_2["FindFirstChildWhichIsA"]
local larry4118 =larry4117(_4111_2, "ProximityPrompt", true)
local larry4119 =fireproximityprompt(larry4118, 3)
end
local _ =task.wait(2)
local larry4120 =larry4029["FindFirstChild"]
local larry4121 =larry4120(larry4029, "Items")
local larry4122 =larry4121["GetChildren"]
local larry4123 =larry4122(larry4121)
for larry4124, _4124_2 in ipairs(larry4123) do
local larry4125 =_4124_2["IsA"]
local larry4126 =larry4125(_4124_2, "Model")
local larry4127 =_4124_2["Name"]
local larry4128 =larry4127["match"]
local larry4129 =larry4128(larry4127, "^Item Chest%d*$")
local larry4130 =_4124_2["FindFirstChildWhichIsA"]
local larry4131 =larry4130(_4124_2, "ProximityPrompt", true)
local larry4132 =fireproximityprompt(larry4131, 3)
end
local _ =task.wait(2)
local larry4133 =larry4029["FindFirstChild"]
local larry4134 =larry4133(larry4029, "Items")
local larry4135 =larry4134["GetChildren"]
local larry4136 =larry4135(larry4134)
for larry4137, _4137_2 in ipairs(larry4136) do
local larry4138 =_4137_2["IsA"]
local larry4139 =larry4138(_4137_2, "Model")
local larry4140 =_4137_2["Name"]
local larry4141 =larry4140["match"]
local larry4142 =larry4141(larry4140, "^Item Chest%d*$")
local larry4143 =_4137_2["FindFirstChildWhichIsA"]
local larry4144 =larry4143(_4137_2, "ProximityPrompt", true)
local larry4145 =fireproximityprompt(larry4144, 3)
end
local _ =task.wait(2)
local er =error("Luraph Script:2806: internal 542: <larry: infinitelooperror>")
end)
end,
  ["Title"] = "Open Chests",
  ["Desc"] = "Opens All Chests And That's It.",
})
local larry4147 =larry47["Section"]
local larry4148 =larry4147(larry47, {
  ["Opened"] = false,
  ["Title"] = "Other Bring Stuff",
  ["Icon"] = "star",
  ["Desc"] = "Bring Other Stuff Like Cooked Food",
})
local larry4149 =game["GetService"]
local larry4150 =larry4149(game, "ReplicatedStorage")
local larry4151 =game["GetService"]
local larry4152 =larry4151(game, "Players")
local larry4153 =game["GetService"]
local larry4154 =larry4153(game, "Workspace")
local larry4155 =larry4152["LocalPlayer"]
local larry4156 =larry4155["Character"]
local larry4157 =larry4156["WaitForChild"]
local larry4158 =larry4157(larry4156, "HumanoidRootPart")
local larry4159 =larry4154["WaitForChild"]
local larry4160 =larry4159(larry4154, "Items")
local larry4161 =larry4150["WaitForChild"]
local larry4162 =larry4161(larry4150, "RemoteEvents")
local larry4163 =Vector3["new"]
local larry4164 =larry4163(0, 19, 0)
local larry4165 =larry4148["Dropdown"]
local larry4166 =larry4165(larry4148, {
  ["Title"] = "Auto Cook Food: Choose Items",
  ["AllowNone"] = true,
  ["Value"] = {},
  ["Multi"] = true,
  ["Callback"] = function(...)
local _4167_vararg1, _4167_vararg2, _4167_vararg3, _4167_vararg4, _4167_vararg5, _4167_vararg6, _4167_vararg7, _4167_vararg8, _4167_vararg9, _4167_vararg10 = ...
genv["AutoDaysAutoCookItems"]={}
for larry4168, _4168_2 in ipairs(_4167_vararg1) do
local larry4169 =genv["AutoDaysAutoCookItems"]
end
end,
  ["Values"] = {
  [1] = "Morsel",
  [2] = "Steak",
  [3] = "Ribs",
  [4] = "Salmon",
  [5] = "Mackerel",
},
})
local larry4170 =larry4148["Toggle"]
local larry4173 =task["spawn"]
local larry4177 =larry4160["GetChildren"]
local larry4178 =larry4177(larry4160)
local larry4180 =_4179_2["Name"]
local _ =task.wait(2.5)
local larry4183 =larry4160["GetChildren"]
local larry4184 =larry4183(larry4160)
local larry4186 =_4185_2["Name"]
local _ =task.wait(2.5)
local larry4189 =larry4160["GetChildren"]
local larry4190 =larry4189(larry4160)
local larry4192 =_4191_2["Name"]
local _ =task.wait(2.5)
local larry4195 =larry4160["GetChildren"]
local larry4196 =larry4195(larry4160)
local larry4198 =_4197_2["Name"]
local _ =task.wait(2.5)
local larry4201 =larry4160["GetChildren"]
local larry4202 =larry4201(larry4160)
local larry4204 =_4203_2["Name"]
local _ =task.wait(2.5)
local larry4207 =larry4160["GetChildren"]
local larry4208 =larry4207(larry4160)
local larry4210 =_4209_2["Name"]
local _ =task.wait(2.5)
local larry4213 =larry4160["GetChildren"]
local larry4214 =larry4213(larry4160)
local larry4216 =_4215_2["Name"]
local _ =task.wait(2.5)
local larry4219 =larry4160["GetChildren"]
local larry4220 =larry4219(larry4160)
local larry4222 =_4221_2["Name"]
local _ =task.wait(2.5)
local larry4225 =larry4160["GetChildren"]
local larry4226 =larry4225(larry4160)
local larry4228 =_4227_2["Name"]
local _ =task.wait(2.5)
local larry4231 =larry4160["GetChildren"]
local er =error("Luraph Script:2879: internal 542: <larry: infinitelooperror>")
local larry4174 =larry4173(function(...)
local _4175_vararg1, _4175_vararg2, _4175_vararg3, _4175_vararg4, _4175_vararg5, _4175_vararg6, _4175_vararg7, _4175_vararg8, _4175_vararg9, _4175_vararg10 = ...
local larry4176 =genv["AutoDaysAutoCookItems"]
local larry4177 =larry4160["GetChildren"]
local larry4178 =larry4177(larry4160)
for larry4179, _4179_2 in ipairs(larry4178) do
local larry4180 =_4179_2["Name"]
local larry4181 =(larry4180==_4168_2)
end
local _ =task.wait(2.5)
local larry4182 =genv["AutoDaysAutoCookItems"]
local larry4183 =larry4160["GetChildren"]
local larry4184 =larry4183(larry4160)
for larry4185, _4185_2 in ipairs(larry4184) do
local larry4186 =_4185_2["Name"]
local larry4187 =(larry4186==_4168_2)
end
local _ =task.wait(2.5)
local larry4188 =genv["AutoDaysAutoCookItems"]
local larry4189 =larry4160["GetChildren"]
local larry4190 =larry4189(larry4160)
for larry4191, _4191_2 in ipairs(larry4190) do
local larry4192 =_4191_2["Name"]
local larry4193 =(larry4192==_4168_2)
end
local _ =task.wait(2.5)
local larry4194 =genv["AutoDaysAutoCookItems"]
local larry4195 =larry4160["GetChildren"]
local larry4196 =larry4195(larry4160)
for larry4197, _4197_2 in ipairs(larry4196) do
local larry4198 =_4197_2["Name"]
local larry4199 =(larry4198==_4168_2)
end
local _ =task.wait(2.5)
local larry4200 =genv["AutoDaysAutoCookItems"]
local larry4201 =larry4160["GetChildren"]
local larry4202 =larry4201(larry4160)
for larry4203, _4203_2 in ipairs(larry4202) do
local larry4204 =_4203_2["Name"]
local larry4205 =(larry4204==_4168_2)
end
local _ =task.wait(2.5)
local larry4206 =genv["AutoDaysAutoCookItems"]
local larry4207 =larry4160["GetChildren"]
local larry4208 =larry4207(larry4160)
for larry4209, _4209_2 in ipairs(larry4208) do
local larry4210 =_4209_2["Name"]
local larry4211 =(larry4210==_4168_2)
end
local _ =task.wait(2.5)
local larry4212 =genv["AutoDaysAutoCookItems"]
local larry4213 =larry4160["GetChildren"]
local larry4214 =larry4213(larry4160)
for larry4215, _4215_2 in ipairs(larry4214) do
local larry4216 =_4215_2["Name"]
local larry4217 =(larry4216==_4168_2)
end
local _ =task.wait(2.5)
local larry4218 =genv["AutoDaysAutoCookItems"]
local larry4219 =larry4160["GetChildren"]
local larry4220 =larry4219(larry4160)
for larry4221, _4221_2 in ipairs(larry4220) do
local larry4222 =_4221_2["Name"]
local larry4223 =(larry4222==_4168_2)
end
local _ =task.wait(2.5)
local larry4224 =genv["AutoDaysAutoCookItems"]
local larry4225 =larry4160["GetChildren"]
local larry4226 =larry4225(larry4160)
for larry4227, _4227_2 in ipairs(larry4226) do
local larry4228 =_4227_2["Name"]
local larry4229 =(larry4228==_4168_2)
end
local _ =task.wait(2.5)
local larry4230 =genv["AutoDaysAutoCookItems"]
local er =error("Luraph Script:2879: internal 542: <larry: infinitelooperror>")
end)
local larry4171 =larry4170(larry4148, {
  ["Callback"] = function(...)
local _4172_vararg1, _4172_vararg2, _4172_vararg3, _4172_vararg4, _4172_vararg5, _4172_vararg6, _4172_vararg7, _4172_vararg8, _4172_vararg9, _4172_vararg10 = ...
genv["AutoDaysAutoCookEnabled"]=_4172_vararg1
local larry4173 =task["spawn"]
local larry4174 =larry4173(function(...)
local _4175_vararg1, _4175_vararg2, _4175_vararg3, _4175_vararg4, _4175_vararg5, _4175_vararg6, _4175_vararg7, _4175_vararg8, _4175_vararg9, _4175_vararg10 = ...
local larry4176 =genv["AutoDaysAutoCookItems"]
local larry4177 =larry4160["GetChildren"]
local larry4178 =larry4177(larry4160)
for larry4179, _4179_2 in ipairs(larry4178) do
local larry4180 =_4179_2["Name"]
local larry4181 =(larry4180==_4168_2)
end
local _ =task.wait(2.5)
local larry4182 =genv["AutoDaysAutoCookItems"]
local larry4183 =larry4160["GetChildren"]
local larry4184 =larry4183(larry4160)
for larry4185, _4185_2 in ipairs(larry4184) do
local larry4186 =_4185_2["Name"]
local larry4187 =(larry4186==_4168_2)
end
local _ =task.wait(2.5)
local larry4188 =genv["AutoDaysAutoCookItems"]
local larry4189 =larry4160["GetChildren"]
local larry4190 =larry4189(larry4160)
for larry4191, _4191_2 in ipairs(larry4190) do
local larry4192 =_4191_2["Name"]
local larry4193 =(larry4192==_4168_2)
end
local _ =task.wait(2.5)
local larry4194 =genv["AutoDaysAutoCookItems"]
local larry4195 =larry4160["GetChildren"]
local larry4196 =larry4195(larry4160)
for larry4197, _4197_2 in ipairs(larry4196) do
local larry4198 =_4197_2["Name"]
local larry4199 =(larry4198==_4168_2)
end
local _ =task.wait(2.5)
local larry4200 =genv["AutoDaysAutoCookItems"]
local larry4201 =larry4160["GetChildren"]
local larry4202 =larry4201(larry4160)
for larry4203, _4203_2 in ipairs(larry4202) do
local larry4204 =_4203_2["Name"]
local larry4205 =(larry4204==_4168_2)
end
local _ =task.wait(2.5)
local larry4206 =genv["AutoDaysAutoCookItems"]
local larry4207 =larry4160["GetChildren"]
local larry4208 =larry4207(larry4160)
for larry4209, _4209_2 in ipairs(larry4208) do
local larry4210 =_4209_2["Name"]
local larry4211 =(larry4210==_4168_2)
end
local _ =task.wait(2.5)
local larry4212 =genv["AutoDaysAutoCookItems"]
local larry4213 =larry4160["GetChildren"]
local larry4214 =larry4213(larry4160)
for larry4215, _4215_2 in ipairs(larry4214) do
local larry4216 =_4215_2["Name"]
local larry4217 =(larry4216==_4168_2)
end
local _ =task.wait(2.5)
local larry4218 =genv["AutoDaysAutoCookItems"]
local larry4219 =larry4160["GetChildren"]
local larry4220 =larry4219(larry4160)
for larry4221, _4221_2 in ipairs(larry4220) do
local larry4222 =_4221_2["Name"]
local larry4223 =(larry4222==_4168_2)
end
local _ =task.wait(2.5)
local larry4224 =genv["AutoDaysAutoCookItems"]
local larry4225 =larry4160["GetChildren"]
local larry4226 =larry4225(larry4160)
for larry4227, _4227_2 in ipairs(larry4226) do
local larry4228 =_4227_2["Name"]
local larry4229 =(larry4228==_4168_2)
end
local _ =task.wait(2.5)
local larry4230 =genv["AutoDaysAutoCookItems"]
local er =error("Luraph Script:2879: internal 542: <larry: infinitelooperror>")
end)
end,
  ["Default"] = false,
  ["Title"] = "Auto Cook Food",
})
local larry4232 =game["GetService"]
local larry4233 =larry4232(game, "Players")
local larry4234 =larry4233["LocalPlayer"]
local larry4235 =game["GetService"]
local larry4236 =larry4235(game, "Workspace")
local larry4237 =larry4236["WaitForChild"]
local er =error("Luraph Script:2919: internal 542: <larry: infinitelooperror>")