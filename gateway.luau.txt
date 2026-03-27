--[[
   _______    __       ________  ___  ___   _______  _______   ________      ___  ___  ________   _______
  ╱       ╲╲╱╱  ╲     ╱╱  ____ ╲╱  ╱ ╱  ╲╲╱╱       ╲╱       ╲╲╱    ╱   ╲    ╱  ╱ ╱  ╲╲╱     ╱  ╲╱╱  __  ╱
 ╱  ╱___  ╱╱╱   ╱    ╱╱  ╱     ╱  ╱_╱   ╱╱╱  ╱___  ╱        ╱╱   _╱    ╱   ╱  ╱_╱   ╱╱   __╱   ╱╱       ╲
╱         ╱    ╱____╱   ╱_____╱   __    ╱     ____╱   ╱  ╱  ╱╲____   ╱╱   ╱   __    ╱         ╱╱   __╱   ╱
╲___╱____╱╲________╱╲________╱╲__╱ ╱___╱╲________╱╲__╱__╱__╱     ╱__╱╱    ╲__╱ ╱___╱╲________╱╱╲________╱ 
ALCHEMY HUB NETA EDITION SCRIPT

This made by Alchemy Team ( discord.gg/alchemyhub )
Modification of the script, including attempting to bypass
or crack the script for any reason is not allowed.

Copyright © 2025 Alchemy Team. All Rights Reserved.

]]--

repeat wait(1) until game:IsLoaded()
repeat wait(1) until game.Players.LocalPlayer

---------/// Set All Config to Global ///---------

getgenv().script_key= script_key or nil
getgenv().skip_loading = skip_loading or false
getgenv().disable_auto_exec = disable_auto_exec or false
getgenv().delay_execute = delay_execute or 0
getgenv().mute_sound = mute_sound or false

getgenv().whitescreen = whitescreen or false
getgenv().blackscreen = blackscreen or false
getgenv().auto_rejoin = auto_rejoin or false
getgenv().streamer_mode = streamer_mode or false
getgenv().fully_rejoin = fully_rejoin or false

getgenv().aimbot = aimbot or false
getgenv().fruits_finder = fruits_finder or false
getgenv().arise_afk = arise_afk or false
getgenv().premium = premium or false
getgenv().oneclick = oneclick or kaitan or kaitun or false

getgenv().avoid_player = avoid_player or nil
getgenv().rawplugins = rawplugins or nil
getgenv().linkplugins = linkplugins or nil

getgenv().setting = setting or nil
getgenv().use_code = use_code or nil
getgenv().highdebug = highdebug or false

---------/// Set Necessary Function ///---------

task.wait(delay_execute or 0)

---------/// Set Necessary Function ///---------

local getService = setmetatable({}, {
    __index = function(selff : {}, serviceName : any)
        local service = cloneref(game:GetService(serviceName))
        rawset(selff, serviceName, service)
        return service
    end
})

local setAutoExec : () -> nil = function()
    if not(disable_auto_exec) and not(already_set_auto_exec) then
        xpcall(function()
            local queueonteleport : () -> nil = queueonteleport or queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)
            if queueonteleport and not(aimbot or fruits_finder or arise_afk or oneclick or kaitan or kaitun) then
                print("Set Auto Execute\n")

                local rawsetting : string = 'getgenv().json_setting=nil;'
                if setting and typeof(setting) == 'table' then
                    rawsetting = (string.format('getgenv().json_setting=[=[%s]=];',
                    tostring(getService.HttpService:JSONEncode(setting))))
                end

                local raw_avoidplayer : string = 'getgenv().json_avoid_player=nil;'
                if avoid_player and typeof(avoid_player) == 'table' then
                    if #avoid_player > 0 then
                        raw_avoidplayer = (string.format('getgenv().json_avoid_player=[=[%s]=];',
                        tostring(getService.HttpService:JSONEncode(avoid_player))))
                    end
                end
                
                if script_key or premium or rollback then
                    if getgenv().Alchemy365 then
                        queueonteleport(string.format('%s%sgetgenv().cometeleport=true;getgenv().highdebug=%s;script_key="%s";premium=%s;rollback=%s;mute_sound=%s;auto_rejoin=%s;streamer_mode=%s;fully_rejoin=%s;whitescreen=%s;blackscreen=%s;skip_loading=%s;rawplugins=[=[%s]=];loadstring(game:HttpGet("https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/gateway.luau"))()',
                        rawsetting, raw_avoidplayer, tostring(getgenv().highdebug), tostring(script_key), tostring(premium), tostring(rollback), tostring(mute_sound), tostring(auto_rejoin), tostring(streamer_mode), tostring(fully_rejoin), tostring(whitescreen), tostring(blackscreen), tostring(skip_loading), getgenv().Alchemy365.load))
                    else
                        queueonteleport(string.format('%s%sgetgenv().cometeleport=true;getgenv().highdebug=%s;script_key="%s";premium=%s;rollback=%s;mute_sound=%s;auto_rejoin=%s;streamer_mode=%s;fully_rejoin=%s;whitescreen=%s;blackscreen=%s;skip_loading=%s;loadstring(game:HttpGet("https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/gateway.luau"))()',
                        rawsetting, raw_avoidplayer, tostring(getgenv().highdebug), tostring(script_key), tostring(premium), tostring(rollback), tostring(mute_sound), tostring(auto_rejoin), tostring(streamer_mode), tostring(fully_rejoin), tostring(whitescreen), tostring(blackscreen), tostring(skip_loading)))
                    end
                else
                    if getgenv().Alchemy365 then
                        queueonteleport(string.format('%s%sgetgenv().cometeleport=true;getgenv().highdebug=%s;mute_sound=%s;auto_rejoin=%s;streamer_mode=%s;fully_rejoin=%s;whitescreen=%s;blackscreen=%s;skip_loading=%s;rawplugins=[=[%s]=];loadstring(game:HttpGet("https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/gateway.luau"))()',
                        rawsetting, raw_avoidplayer, tostring(getgenv().highdebug), tostring(mute_sound), tostring(auto_rejoin), tostring(streamer_mode), tostring(fully_rejoin), tostring(whitescreen), tostring(blackscreen), tostring(skip_loading), getgenv().Alchemy365.load))
                    else
                        queueonteleport(string.format('%s%sgetgenv().cometeleport=true;getgenv().highdebug=%s;mute_sound=%s;auto_rejoin=%s;streamer_mode=%s;fully_rejoin=%s;whitescreen=%s;blackscreen=%s;skip_loading=%s;loadstring(game:HttpGet("https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/gateway.luau"))()',
                        rawsetting, raw_avoidplayer, tostring(getgenv().highdebug), tostring(mute_sound), tostring(auto_rejoin), tostring(streamer_mode), tostring(fully_rejoin), tostring(whitescreen), tostring(blackscreen), tostring(skip_loading)))
                    end
                end
            end

            getgenv().already_set_auto_exec = true
        end, function(err : string)
            warn(string.format("Auto execute function error %s\n", err))
        end)
    end
end

--[[if game.PlaceId == 16732694052 then setAutoExec()
task.delay(1.2, function()
    local Blackscreen : Instance = Instance.new("ScreenGui");
    local Blackscreen2 : Instance = Instance.new("Frame");
    local TextLabel : Instance = Instance.new("TextLabel");
    Blackscreen.Name = "BBMain"; Blackscreen.Parent = getService.CoreGui;
    Blackscreen2.Name = "Blackscreen"; Blackscreen2.Parent = Blackscreen;
    Blackscreen2.Size = UDim2.new(500, 0, 500, 0); Blackscreen2.AnchorPoint = Vector2.new(0.5, 0.5);
    Blackscreen2.Position = UDim2.new(0.5, 0, 0.5, 0); Blackscreen2.BackgroundTransparency = 0.2;
    Blackscreen2.BackgroundColor3 = Color3.new(0, 0, 0); Blackscreen2.Visible = true;
    TextLabel.AnchorPoint = Vector2.new(0.5, 0.5); TextLabel.Parent = Blackscreen2;
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255); TextLabel.BackgroundTransparency = 1.000;
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0); TextLabel.BorderSizePixel = 0;
    TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0); TextLabel.Size = UDim2.new(1, 0, 1, 0);
    TextLabel.Font = Enum.Font.FredokaOne; TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
    TextLabel.TextSize = 24.000; TextLabel.RichText = true; TextLabel.Text = 
    "<font color='rgb(255, 79, 79)'>If it not teleport to SAFE SERVER or NEWBIE SERVER in Delta</font>\n"..
    "<font color='rgb(255, 230, 0)'>Go to Executor Setting and Disable 'Verify Teleport'</font>\n"..
    "<font color='rgb(179, 179, 179)'>(discord.gg/alchemyhub)</font>"
end)
getService.TeleportService:Teleport(131716211654599)
return nil end]]


---------/// Set Auto Execute ///---------

setAutoExec()

---------/// Check List ///---------

local support = {
    994732206, 5750914919, 6325068386, 1016936714, 3808081382,
    4568630521, 3508322461, 7074860883, 7018190066, 6504986360,
    6884266247, 7436755782, 6331902150, 6115988515, 7326934954,
    4509896324, 6057699512, 4777817887, 7709344486, 7629331599,
    7750955984, 6701277882, 8316902627, 2619619496
}

---------/// Check Environment ///---------

if cometeleport then print('Auto Execute Active')
if not table.find(support, game.GameId) then return nil end end
local waiting = ((game.GameId == 7326934954 or game.GameId == 5750914919) and 0) or 4.1957
if cometeleport or (oneclick or kaitan or kaitun) then task.wait(waiting) end

type array<I,V> = {[I]: V}

---------/// Wait For Load ///---------

local __f : array<string, any> = {
    ['__game'] = function() : string
        local g : number = game.GameId
        if g == 994732206 then return "v4/loaders/311ad7329b80c2117f4bdbf46582dcc6.lua" -- Blox Fruits
        elseif g == 5750914919 then return "v4/loaders/40142043704f8ec418b59eddd1cb1949.lua" -- Fisch
        elseif g == 6325068386 then return "v4/loaders/4171685ce597cf71185c038656d405ca.lua" -- Bluelock Rivals
        elseif g == 6906326545 then return "v4/loaders/34a7bfd841e02f5b30b75712e5da67ae.lua" -- Basketball Showdown
        elseif g == 1016936714 then return "v4/loaders/a9041aa86c9c312c42632aa43583980f.lua" -- Your Bizarre Adventure
        elseif g == 3808081382 then return "v4/loaders/583e4386ee7b3c8ddb5ebeea249b3949.lua" -- Strongest Battlegrounds
        elseif g == 4568630521 then return "v4/loaders/e2fe6cb4aaaf7e1e94c4b605514dcee3.lua" -- Hero Battlegrounds
        elseif g == 3508322461 then return "v4/loaders/762346416b75d53680cc484c3d37dc10.lua" -- Jujutsu Shenanigans
        elseif g == 7074860883 then return "v4/loaders/d3688644c195bd5fc31b64c51baba92a.lua" -- Arise Crossover
        elseif g == 7018190066 then return "v4/loaders/ff927d4bd86acab8481f351bbb393144.lua" -- Dead Rails
        elseif g == 6504986360 then return "v4/loaders/5da5aa0094d43756aecf47101d8a8452.lua" -- Bubble Gum Simulator
        elseif g == 6884266247 then return "v4/loaders/87b6e9d734e947eaa39b1c3506a3574f.lua" -- Anime Ranger X
        elseif g == 7436755782 then return "v4/loaders/4fe5a40278353341e393f053dc19dc69.lua" -- Grow A Garden
        elseif g == 6331902150 then return "v4/loaders/e463ec64d59b61f756a54cfaff7dc702.lua" -- Forsaken
        elseif g == 6115988515 then return "v4/loaders/ab054af7f70c1d666e387eb69de5c7ad.lua" -- Anime Saga
        elseif g == 7326934954 then return "v4/loaders/ad2603eb1a9175739e8e92c87b281ba6.lua" -- 99 Nights in the Forest
        elseif g == 4509896324 then return "v4/loaders/4336e7045d286f9f86105015098af08a.lua" -- Anime Last Stand
        elseif g == 6057699512 then return "v4/loaders/fa59b2dbb3203d892f517d24aa33189e.lua" -- All Star Tower Defense X
        elseif g == 4777817887 then return "v4/loaders/07e408c12156c7cff4535f4578f98e2e.lua" -- Blade Ball
        elseif g == 7709344486 then return "v4/loaders/4de229bec21d2dd035b058a5fc18599e.lua" -- Steal A Brainrot
        elseif g == 7629331599 then return "v4/loaders/7dc1ca5aaa68ec141bda58f1e26f3622.lua" -- Prospecting
        elseif g == 7750955984 then return "v4/loaders/3866fdc42990d9fe9a5ceb0d2140085c.lua" -- Hunty Zombie
        elseif g == 6701277882 then return "v4/loaders/90b15d9b20cecb9cf43b3ae2294a5b04.lua" -- Fish It
        elseif g == 8316902627 then return "v4/loaders/013376e4465e7f4776baee54c0eb7e6f.lua" -- Plants Vs Brainrot
        elseif g == 2619619496 then return "v4/loaders/15ec57faf2fc9e03a7af66e816f3b1d0.lua" -- Bedwars
        else
            return "v4/loaders/fd6e9298c37fd63d2c6d3d979ea55516.lua" -- Universal
        end
    end;
    ['__premium'] = function() : string
        local g : number = game.GameId
        if g == 994732206 then return "v4/loaders/a1a6b1634179469cd1b8f22b2a32492d.lua" -- Blox Fruits
        elseif g == 5750914919 then return "v4/loaders/b483c866b947fd0b7a2558cf67ae1417.lua" -- Fisch
        elseif g == 6325068386 then return "v4/loaders/42375cfe2e65070104eaaa05a823d9b4.lua" -- Bluelock Rivals
        elseif g == 1016936714 then return "v4/loaders/b4542faca4c6d651a16b41d077693ffd.lua" -- Your Bizarre Adventure
        elseif g == 3808081382 then return "v4/loaders/f78d0ecd5263292d62168cddbbbd416a.lua" -- Strongest Battlegrounds
        elseif g == 4568630521 then return "v4/loaders/94b1529d93509fb0320dc5284f12fdb2.lua" -- Hero Battlegrounds
        elseif g == 3508322461 then return "v4/loaders/55691542db5b90140761a85715a079c8.lua" -- Jujutsu Shenanigans
        elseif g == 7074860883 then return "v4/loaders/02f7d67ec12fb8c52571fa98565a693b.lua" -- Arise Crossover
        elseif g == 7018190066 then return "v4/loaders/4ad2f3adb7795f86b0b0be9e1ce23a3a.lua" -- Dead Rails
        elseif g == 6504986360 then return "v4/loaders/04f899beb187ce109505f383502fbb45.lua" -- Bubble Gum Simulator
        elseif g == 6884266247 then return "v4/loaders/375bc929cb2f82a06eab086a0a5bdfa1.lua" -- Anime Ranger X
        elseif g == 7436755782 then return "v4/loaders/9205a41f0f04e862885e9edcbf4b4040.lua" -- Grow A Garden
        elseif g == 6331902150 then return "v4/loaders/f7499bae6c8869f692df49670c6af27e.lua" -- Forsaken
        elseif g == 6115988515 then return "v4/loaders/bcfb87db175e4d836d6b2f8c77fe02d7.lua" -- Anime Saga
        elseif g == 7326934954 then return "v4/loaders/77ea912d4ee9cd171f5726a764d406d7.lua" -- 99 Nights in the Forest
        elseif g == 4509896324 then return "v4/loaders/3b95e92f01ff6cf74e22d75e37568234.lua" -- Anime Last Stand
        elseif g == 6057699512 then return "v4/loaders/4d0793bcac1038f3fb79284e5294ceab.lua" -- All Star Tower Defense X
        elseif g == 4777817887 then return "v4/loaders/9930868700f655a05d90cc71e2a2a515.lua" -- Blade Ball
        elseif g == 7709344486 then return "v4/loaders/0d75eb00e3bbed09e40a543f8ef2b41f.lua" -- Steal A Brainrot
        elseif g == 7629331599 then return "v4/loaders/ea9729a4b0f72dedf1163f8ce328bb36.lua" -- Prospecting
        elseif g == 7750955984 then return "v4/loaders/3893c2e3e61f6b61fd40822fece16a2a.lua" -- Hunty Zombie
        elseif g == 6701277882 then return "v4/loaders/4c6aa5a28cdb13944273690a517c813f.lua" -- Fish It
        elseif g == 8316902627 then return "v4/loaders/28160977ffa5b1e2bdada105419b4ef6.lua" -- Plants Vs Brainrot
        elseif g == 2619619496 then return "v4/loaders/2f4f781d1d8f40f692c0282720965e4a.lua" -- Bedwars
        else
            return "v4/loaders/83e1c25551a23c52e2c476e9bdd0c17a.lua" -- Universal
        end
    end;
    ['__oneclick'] = function() : string
        local g : number = game.GameId
        if g == 6884266247 then return "v4/loaders/f97c1c9dd9b41345ee7bace79d9a8f12.lua" -- Anime Ranger X
        elseif g == 7018190066 then return "v4/loaders/4ad2f3adb7795f86b0b0be9e1ce23a3a.lua" -- Dead Rails
        elseif g == 6057699512 then return "v4/loaders/5a2090a5e9b281c468fec4956086776e.lua" -- All Star Tower Defense X
        elseif g == 7326934954 then return "v4/loaders/3c010f72ce33399cb2aab88d369cf0fc.lua" -- 99 Night in the Forest
        elseif g == 7750955984 then return "v4/loaders/9f339fad4409b86cf4435dc64ff65c4d.lua" -- Hunty Zombie
        else return "\n" end
    end;
    ['__rollback'] = function() : string
        local g : number = game.GameId
        if g == 6325068386 then return "v4/loaders/42375cfe2e65070104eaaa05a823d9b4.lua" -- Bluelock Rivals
        elseif g == 6931042565 then return "v4/loaders/76d21b7e287454d6cb3ab5e3245e2b1d.lua" -- Volleyball Legend
        elseif g == 6770632849 then return "v4/loaders/e3679c208ace37385d2df45770f091e3.lua" -- Mugen
        elseif g == 6925303818 then return "v4/loaders/d13c0b865980129e6d4d85942e41e0a4.lua" -- Goalbound
        else return "\n" end
    end;
    ['__nokey'] = function() : {}
        local g : number = game.GameId;local list : {} = {
            ['7709344486'] = "v4/loaders/4de229bec21d2dd035b058a5fc18599e.lua", -- Steal A Brainrot
        };for i, v in pairs(list) do if i == tostring(g) then return v end end
        return nil
    end;
    ['__load'] = function(s : string) : nil (load or loadstring)(game:HttpGet(s))() end;
    ['__ismobile'] = function() : boolean
        local uis : Instance = getService.UserInputService
        if uis.TouchEnabled and not uis.KeyboardEnabled and not uis.MouseEnabled then return true
        elseif not uis.TouchEnabled and uis.KeyboardEnabled and uis.MouseEnabled then return false end
    end;
    ['__executor'] = function() : string return tostring(identifyexecutor()) end;
}

---------/// Check Executor ///---------

local isExecutors : (txt : string) -> boolean = function(txt : string)
    local exec : string = string.lower(__f['__executor']())
    return exec == tostring(txt) or string.find(exec, tostring(txt))
end

local someModule : () -> Instance = function()
    local playerScript : Instance = getService.Players.LocalPlayer:FindFirstChild("PlayerScripts")

    if playerScript then
        local playerModule : Instance = playerScript:FindFirstChild("PlayerModule")
        if playerModule then
            return playerModule
        end
    end

    for i, v in pairs(game:GetDescendants()) do
        if v.ClassName == "ModuleScript" then
            return v
        end
    end
    
    return nil
end

print(string.format("\nEXECUTOR DETECTED : %s", __f['__executor']()))
if hookfunction then print("✅ Support [HOOKFUNCTION]") else warn("❌ Not Support [HOOKFUNCTION]") end
if hookmetamethod then print("✅ Support [HOOKMETAMETHOD]") else warn("❌ Not Support [HOOKMETAMETHOD]") end
if writefile then print("✅ Support [WRITEFILE]") else warn("❌ Not Support [WRITEFILE]") end
if readfile then print("✅ Support [READFILE]") else warn("❌ Not Support [READFILE]") end
if getconnections then print("✅ Support [GETCONNECTION]") else warn("❌ Not Support [GETCONNECTION]") end
if pcall(require, someModule()) then print("✅ Support [REQUIRE]") else warn("❌ Not Support [REQUIRE]") end
if (request or http_request) then print("✅ Support [REQUEST]\n") else warn("❌ Not Support [REQUEST]\n") end

---------/// Old Script Config ///---------

_G.Config = setting or _G.Config

---------/// Disable Debug File ///---------

getgenv().diableFile = true

---------/// User-Interface for Loading ///---------

--[[

local Loading : Instance  = Instance.new("ScreenGui")
local Frame : Instance  = Instance.new("Frame")
local UICorner : Instance  = Instance.new("UICorner")
local Windows : Instance  = Instance.new("Folder")
local Window1 : Instance  = Instance.new("Frame")
local UICorner_2 : Instance  = Instance.new("UICorner")
local TextLabel : Instance  = Instance.new("TextLabel")
local Window2 : Instance  = Instance.new("Frame")
local UICorner_3 : Instance  = Instance.new("UICorner")
local TextLabel_2 : Instance  = Instance.new("TextLabel")
local Window3 : Instance  = Instance.new("Frame")
local UICorner_4 : Instance  = Instance.new("UICorner")
local TextLabel_3 : Instance  = Instance.new("TextLabel")
local Window4 : Instance  = Instance.new("Frame")
local UICorner_5 : Instance  = Instance.new("UICorner")
local TextLabel_4 : Instance  = Instance.new("TextLabel")
local TextLabel_5 : Instance  = Instance.new("TextLabel")
local TextLabel_6 : Instance  = Instance.new("TextLabel")

if not(oneclick or kaitan or kaitun or rollback) then
    Loading.Name = "Loading"
    Loading.Parent = getService.CoreGui or game.Players.LocalPlayer:WaitForChild("PlayerGui")
    Loading.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Frame.Parent = Loading
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.5, 0, 0.499389499, 0)
    Frame.Size = UDim2.new(0, 0, 0, 0)
    UICorner.Parent = Frame
    Windows.Name = "Windows"
    Windows.Parent = Frame
    Window1.Name = "Window1"
    Window1.Parent = Windows
    Window1.AnchorPoint = Vector2.new(0.5, 0.5)
    Window1.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
    Window1.BackgroundTransparency = 0.600
    Window1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window1.BorderSizePixel = 0
    Window1.Position = UDim2.new(0.411275715, 0, 0.26413402, 0)
    Window1.Size = UDim2.new(0, 30, 0, 30)
    Window1.Visible = false
    UICorner_2.CornerRadius = UDim.new(0, 4)
    UICorner_2.Parent = Window1
    TextLabel.Parent = Window1
    TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = Enum.Font.FredokaOne
    TextLabel.Text = "A"
    TextLabel.TextColor3 = Color3.fromRGB(18, 18, 18)
    TextLabel.TextSize = 24.000
    Window2.Name = "Window2"
    Window2.Parent = Windows
    Window2.AnchorPoint = Vector2.new(0.5, 0.5)
    Window2.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
    Window2.BackgroundTransparency = 0.600
    Window2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window2.BorderSizePixel = 0
    Window2.Position = UDim2.new(0.581891835, 0, 0.26413402, 0)
    Window2.Size = UDim2.new(0, 30, 0, 30)
    Window2.Visible = false
    UICorner_3.CornerRadius = UDim.new(0, 4)
    UICorner_3.Parent = Window2
    TextLabel_2.Parent = Window2
    TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 1.000
    TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_2.BorderSizePixel = 0
    TextLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    TextLabel_2.Size = UDim2.new(1, 0, 1, 0)
    TextLabel_2.Font = Enum.Font.FredokaOne
    TextLabel_2.Text = "C"
    TextLabel_2.TextColor3 = Color3.fromRGB(18, 18, 18)
    TextLabel_2.TextSize = 24.000
    Window3.Name = "Window3"
    Window3.Parent = Windows
    Window3.AnchorPoint = Vector2.new(0.5, 0.5)
    Window3.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
    Window3.BackgroundTransparency = 0.600
    Window3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window3.BorderSizePixel = 0
    Window3.Position = UDim2.new(0.581891835, 0, 0.5368613, 0)
    Window3.Size = UDim2.new(0, 30, 0, 30)
    Window3.Visible = false
    UICorner_4.CornerRadius = UDim.new(0, 4)
    UICorner_4.Parent = Window3
    TextLabel_3.Parent = Window3
    TextLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.BackgroundTransparency = 1.000
    TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_3.BorderSizePixel = 0
    TextLabel_3.Position = UDim2.new(0.5, 0, 0.5, 0)
    TextLabel_3.Size = UDim2.new(1, 0, 1, 0)
    TextLabel_3.Font = Enum.Font.FredokaOne
    TextLabel_3.Text = "1.7"
    TextLabel_3.TextColor3 = Color3.fromRGB(18, 18, 18)
    TextLabel_3.TextSize = 20.000
    Window4.Name = "Window4"
    Window4.Parent = Windows
    Window4.AnchorPoint = Vector2.new(0.5, 0.5)
    Window4.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
    Window4.BackgroundTransparency = 0.600
    Window4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window4.BorderSizePixel = 0
    Window4.Position = UDim2.new(0.411275715, 0, 0.5368613, 0)
    Window4.Size = UDim2.new(0, 30, 0, 30)
    Window4.Visible = false
    UICorner_5.CornerRadius = UDim.new(0, 4)
    UICorner_5.Parent = Window4
    TextLabel_4.Parent = Window4
    TextLabel_4.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_4.BackgroundTransparency = 1.000
    TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_4.BorderSizePixel = 0
    TextLabel_4.Position = UDim2.new(0.5, 0, 0.5, 0)
    TextLabel_4.Size = UDim2.new(1, 0, 1, 0)
    TextLabel_4.Font = Enum.Font.FredokaOne
    TextLabel_4.Text = "M"
    TextLabel_4.TextColor3 = Color3.fromRGB(18, 18, 18)
    TextLabel_4.TextSize = 24.000
    TextLabel_5.Parent = Frame
    TextLabel_5.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_5.BackgroundTransparency = 1.000
    TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_5.BorderSizePixel = 0
    TextLabel_5.Position = UDim2.new(0.496965468, 0, 0.757293224, 0)
    TextLabel_5.Size = UDim2.new(0, 179, 0, 40)
    TextLabel_5.Font = Enum.Font.GothamBold
    TextLabel_5.Text = "Loading..."
    TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_5.TextSize = 12.000
    TextLabel_5.TextWrapped = true
    TextLabel_5.TextTransparency = 1
    TextLabel_6.Parent = Frame
    TextLabel_6.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_6.BackgroundTransparency = 1.000
    TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_6.BorderSizePixel = 0
    TextLabel_6.Position = UDim2.new(0.500426292, 0, 0.856181602, 0)
    TextLabel_6.Size = UDim2.new(0, 210, 0, 32)
    TextLabel_6.Font = Enum.Font.GothamBold
    TextLabel_6.Text = "Power By <font color='rgb(85, 255, 127)'>Alchemy Intelligence (1.7)</font>"
    TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_6.TextTransparency = 1
    TextLabel_6.TextSize = 10.000
    TextLabel_6.TextWrapped = true
    TextLabel_6.RichText = true

    ---------/// Pop-Up User-Interface ///---------

    game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.3),{Size = UDim2.new(0, 21, 0, 13)}):Play();task.wait(0.3)
    game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.3),{Size = UDim2.new(0, 21, 0, 132)}):Play();task.wait(0.3)
    game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.3),{Size = UDim2.new(0, 211, 0, 132)}):Play();task.wait(0.3)
    Window1.Visible = true;task.wait(0.2);Window2.Visible = true;task.wait(0.2);Window3.Visible = true;task.wait(0.2);Window4.Visible = true;task.wait(0.2)
    game:GetService('TweenService'):Create(TextLabel_5,TweenInfo.new(0.2),{TextTransparency = 0}):Play();task.wait(0.2)
    game:GetService('TweenService'):Create(TextLabel_6,TweenInfo.new(0.2),{TextTransparency = 0.27}):Play();task.wait(0.4)

    ---------/// Window Loading ///---------

    task.spawn(function() while true do task.wait()
        game:GetService('TweenService'):Create(Window1,TweenInfo.new(0.3),{
        BackgroundTransparency = 0}):Play();game:GetService('TweenService'):Create(Window4,TweenInfo.new(0.3),{
        BackgroundTransparency = 0.6}):Play();task.wait(0.47);game:GetService('TweenService'):Create(Window2,TweenInfo.new(0.3),{
        BackgroundTransparency = 0}):Play();game:GetService('TweenService'):Create(Window1,TweenInfo.new(0.3),{
        BackgroundTransparency = 0.6}):Play();task.wait(0.47);game:GetService('TweenService'):Create(Window3,TweenInfo.new(0.3),{
        BackgroundTransparency = 0}):Play();game:GetService('TweenService'):Create(Window2,TweenInfo.new(0.3),{
        BackgroundTransparency = 0.6}):Play();task.wait(0.47);game:GetService('TweenService'):Create(Window4,TweenInfo.new(0.3),{
        BackgroundTransparency = 0}):Play();game:GetService('TweenService'):Create(Window3,TweenInfo.new(0.3),{
        BackgroundTransparency = 0.6}):Play();task.wait(0.47)
    end;end)
end

]]

---------/// Function for Update User-Interface ///---------

--[[

local updateStatus : (txt : string) -> nil = function(txt : string)
    if not(oneclick or kaitan or kaitun or rollback) then
        TextLabel_5.Text = txt .. "...";--task.wait()
    end
end

local closeLoading : () -> nil = function()
    if not(oneclick or kaitan or kaitun or rollback) then
        game:GetService('TweenService'):Create(TextLabel_6,TweenInfo.new(0.2),{TextTransparency = 1}):Play();task.wait(0.2)
        game:GetService('TweenService'):Create(TextLabel_5,TweenInfo.new(0.2),{TextTransparency = 1}):Play();task.wait(0.2)
        Window4.Visible = false;task.wait(0.2);Window3.Visible = false;task.wait(0.2);Window2.Visible = false;task.wait(0.2);Window1.Visible = false;task.wait(0.2)
        game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.3),{Size = UDim2.new(0, 21, 0, 132)}):Play();task.wait(0.3)
        game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.3),{Size = UDim2.new(0, 21, 0, 13)}):Play();task.wait(0.3)
        game:GetService('TweenService'):Create(Frame,TweenInfo.new(0.3),{Size = UDim2.new(0, 0, 0, 0)}):Play();task.wait(0.3);Frame.Visible = false;
    end
end

]]

---------/// Active Code ///---------

-- updateStatus("Checking Active Code");

xpcall(function()
    if use_code and typeof(use_code) == 'string' then
        print(string.format('Used Code : [%s]\n', string.upper(use_code)));(load or loadstring)((request or http_request)({
            Url = "https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/ud/codes.lua",
            Method = "GET"
        }).Body)()
    end
end, function(err : string)
    warn(string.format("Active code function error %s\n", err))
end)
 
---------/// Convert Json Config to Normal Config ///---------

-- updateStatus("Converting Json Data");

xpcall(function()
    if not(setting) and json_setting then
        getgenv().setting = getService.HttpService:JSONDecode(json_setting)
    end

    if not(avoid_player) and json_avoid_player then
        getgenv().avoid_player = getService.HttpService:JSONDecode(json_avoid_player)
    end
end, function(err : string)
    warn(string.format("Convert json function error %s\n", err))
end)

---------/// x2Neptune's Software ///---------

-- updateStatus("Loading Software");

task.delay(6, function()
    xpcall(function()
        (load or loadstring)((request or http_request)({
            Url = "https://raw.githubusercontent.com/x2neptunereal/x2neptunereal/main/software/_rbx.lua",
            Method = "GET"
        }).Body)()
    end, function(err : string)
        warn(string.format("Software function error %s\n", err))
    end)
end)

---------/// Debug Logs ///---------

task.delay(10, function()
    xpcall(function()
        (load or loadstring)((request or http_request)({
            Url = "https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/library/debug/enchantlogs.lua",
            Method = "GET"
        }).Body)()
    end, function(err : string)
        warn(string.format("Debug logs error %s\n", err))
    end)
end)


---------/// Active Announcement ///---------

-- updateStatus("Setting Up Announcement");

xpcall(function()
    task.spawn(function()
        while true do task.wait(30)
            local output : {} = (load or loadstring)((request or http_request)({
                Url = "https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/library/announcement/active.luau",
                Method = "GET"
            }).Body)()

            --[[if output.success then
                print("AAS: Successful")
            else
                warn("AAS: Fail, " .. output.message)
            end]]
        end
    end)
end, function(err : string)
    warn(string.format("Announcement function error %s\n", err))
end)

---------/// Plugins ///---------

-- updateStatus("Setting Up Plugins");

xpcall(function()
    if rawplugins then
        if type(rawplugins) == "string" then
            getgenv().Alchemy365 = {load = rawplugins}
        else
            warn("Raw-Plugins must be string\n")
        end
    end

    if linkplugins then
        if type(linkplugins) == "table" and #linkplugins > 0 then
            if not getgenv().Alchemy365 then getgenv().Alchemy365 = {load = ""} end
            
            for i=1, #linkplugins do
                getgenv().Alchemy365.load = getgenv().Alchemy365.load .. string.format("\nloadstring(game:HttpGet('%s'))();", linkplugins[i])
            end
        else
            warn("Link-Plugins must be table and table can't be empty\n")
        end
    end
end, function(err : string)
    warn(string.format("Plugins function error %s\n", err))
end)

---------/// Avoid Players ///---------

local hopServer : () -> nil = function()
    local req : {} = (request or http_request)({Url = string.format('https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100&excludeFullGames=true', game.PlaceId)})
    local body : {} = getService.HttpService:JSONDecode(req.Body)

    if body and body.data then
        for i, v in next, body.data do
            if type(v) == 'table' and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
                task.wait(0.2)
                getService.TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
            end
        end
    end
end

xpcall(function()
    if avoid_player and typeof(avoid_player) == 'table' then
        task.spawn(function()
            while #avoid_player > 0 do task.wait(2)
                for i, v in pairs(getService.Players:GetPlayers()) do
                    if table.find(avoid_player, v.UserId) then
                        warn(string.format('Found User: %s (%d)\nTry to Hop Server...', tostring(v.Name), v.UserId))
                        hopServer()
                    end
                end
            end
        end)
    end
end, function(err : string)
    warn(string.format("Avoid players function error %s\n", err))
end)

--[[

---------/// Sound Set Up ///---------

if not isfolder('alchemyhub_sound') then
    makefolder('alchemyhub_sound')
end

local playSound : (name : string, link : string) -> nil = function(name : string, link : string)
    if not isfile("alchemyhub_sound/".. name ..".mp3") then
        writefile("alchemyhub_sound/".. name ..".mp3", game:HttpGet(link))
    end

    local soundName : string = name..".mp3"
    
    local SoundSFX : Instance = Instance.new("Sound")
    SoundSFX.Parent = workspace
    SoundSFX.SoundId = getcustomasset("alchemyhub_sound/" .. soundName)

    SoundSFX:Play()
end

---------/// Loading Screen ///---------

xpcall(function()
    if not(oneclick or kaitan or kaitun or rollback) and not(skip_loading) then
        local LoaderLib : {} = loadstring(game:HttpGet("https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/ui/loader.luau"))()
        
        if not(mute_sound) then
            task.spawn(function() playSound("windowstartup", "https://github.com/ZoiIntra/sound/raw/main/windows-xp-startup.mp3") end)
        end
        LoaderLib:LoadInit({
            Color = Color3.fromRGB(0, 255, 128),
            Duration = 1.5,
            Size =  87,
        });
    end
end, function(err : string)
    warn(string.format("Loading screen function error %s\n", err))
end)

]]

---------/// Anti Gameplay Paused ///---------

-- updateStatus("Setting Up Anti-GPP");

getService.Players.LocalPlayer.Changed:Connect(function(data)
	xpcall(function()
		if data == "GameplayPaused" then
			getService.Players.LocalPlayer.GameplayPaused = false
		end
	end, function(err : string)
        warn(string.format("Anit gameplay paused function error %s\n", err))
    end)
end)

---------/// Auto Rejoin ///---------

-- updateStatus("Setting Up Auto-Rejoin");

if auto_rejoin or (oneclick or kaitan or kaitun or rollback) then
    task.spawn(function()
        while true do task.wait()
            xpcall(function()
                getService.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Child : Instance)
                    if Child.Name == 'ErrorPrompt' and Child:FindFirstChild('MessageArea') and Child.MessageArea:FindFirstChild("ErrorFrame") then
                        getService.TeleportService:Teleport(game.PlaceId, getService.Players.LocalPlayer) 
                    end
                end)
            end, function(err : string)
                warn(string.format("Auto rejoin function error %s\n", err))
            end)
        end
    end)
end

---------/// Streamer Mode ///---------

-- updateStatus("Setting Up Streamer Mode");

if streamer_mode then
    xpcall(function()
        local protectMessage : (messageTarget : string, messageChange : string) -> nil = function(messageTarget : string, messageChange : string)
            local allSpace = game:GetDescendants()
        
            for i=1, #allSpace do
                if allSpace[i].ClassName == "TextLabel" then
                    if string.find(allSpace[i].Text, messageTarget) then
                        allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
                    
                        pcall(function()
                            if not allSpace[i]:FindFirstChild("Ded") then
                                local UIGradient : Instance = Instance.new("UIGradient")
                                UIGradient.Name = "Ded"
                                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 115)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
                                UIGradient.Rotation = 0
                                UIGradient.Parent = allSpace[i]
                
                                task.spawn(function()
                                    while true do wait(0.01)
                                        UIGradient.Rotation = UIGradient.Rotation + 5
                                        if UIGradient.Rotation >= 360 then
                                            UIGradient.Rotation = 0
                                        end
                                    end
                                end)
                            end
                        end)
        
                        allSpace[i].Changed:Connect(function()
                            allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
                        end)
                    end
                elseif allSpace[i].ClassName == "TextButton" then
                    if string.find(allSpace[i].Text, messageTarget) then
                        allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
        
                        pcall(function()
                            if not allSpace[i]:FindFirstChild("Ded") then
                                local UIGradient : Instance = Instance.new("UIGradient")
                                UIGradient.Name = "Ded"
                                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 115)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
                                UIGradient.Rotation = 0
                                UIGradient.Parent = allSpace[i]
                
                                task.spawn(function()
                                    while true do wait(0.01)
                                        UIGradient.Rotation = UIGradient.Rotation + 5
                                        if UIGradient.Rotation >= 360 then
                                            UIGradient.Rotation = 0
                                        end
                                    end
                                end)
                            end
                        end)
        
                        allSpace[i].Changed:Connect(function()
                            allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
                        end)
                    end
                elseif allSpace[i].ClassName == "TextBox" then
                    if string.find(allSpace[i].Text, messageTarget) then
                        allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
        
                        pcall(function()
                            if not allSpace[i]:FindFirstChild("Ded") then
                                local UIGradient : Instance = Instance.new("UIGradient")
                                UIGradient.Name = "Ded"
                                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 115)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
                                UIGradient.Rotation = 0
                                UIGradient.Parent = allSpace[i]
                
                                task.spawn(function()
                                    while true do wait(0.01)
                                        UIGradient.Rotation = UIGradient.Rotation + 5
                                        if UIGradient.Rotation >= 360 then
                                            UIGradient.Rotation = 0
                                        end
                                    end
                                end)
                            end
                        end)
        
                        allSpace[i].Changed:Connect(function()
                            allSpace[i].Text = string.gsub(allSpace[i].Text, messageTarget, messageChange)
                        end)
                    end
                end
            end
        
            game.DescendantAdded:Connect(function(descendant : Instance)
                if descendant.ClassName == "TextLabel" then
                    if string.find(descendant.Text, messageTarget) then
                        descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
        
                        pcall(function()
                            if not descendant:FindFirstChild("Ded") then
                                local UIGradient : Instance = Instance.new("UIGradient")
                                UIGradient.Name = "Ded"
                                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 115)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
                                UIGradient.Rotation = 0
                                UIGradient.Parent = descendant
                
                                task.spawn(function()
                                    while true do wait(0.01)
                                        UIGradient.Rotation = UIGradient.Rotation + 5
                                        if UIGradient.Rotation >= 360 then
                                            UIGradient.Rotation = 0
                                        end
                                    end
                                end)
                            end
                        end)
        
                        descendant.Changed:Connect(function()
                            descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
                        end)
                    end
                elseif descendant.ClassName == "TextButton" then
                    if string.find(descendant.Text, messageTarget) then
                        descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
        
                        pcall(function()
                            if not descendant:FindFirstChild("Ded") then
                                local UIGradient : Instance = Instance.new("UIGradient")
                                UIGradient.Name = "Ded"
                                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 115)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
                                UIGradient.Rotation = 0
                                UIGradient.Parent = descendant
                
                                task.spawn(function()
                                    while true do wait(0.01)
                                        UIGradient.Rotation = UIGradient.Rotation + 5
                                        if UIGradient.Rotation >= 360 then
                                            UIGradient.Rotation = 0
                                        end
                                    end
                                end)
                            end
                        end)
        
                        descendant.Changed:Connect(function()
                            descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
                        end)
                    end
                elseif descendant.ClassName == "TextBox" then
                    if string.find(descendant.Text, messageTarget) then
                        descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
                        
                        pcall(function()
                            if not descendant:FindFirstChild("Ded") then
                                local UIGradient : Instance = Instance.new("UIGradient")
                                UIGradient.Name = "Ded"
                                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 115)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
                                UIGradient.Rotation = 0
                                UIGradient.Parent = descendant
                
                                task.spawn(function()
                                    while true do wait(0.01)
                                        UIGradient.Rotation = UIGradient.Rotation + 5
                                        if UIGradient.Rotation >= 360 then
                                            UIGradient.Rotation = 0
                                        end
                                    end
                                end)
                            end
                        end)
        
                        descendant.Changed:Connect(function()
                            descendant.Text = string.gsub(descendant.Text, messageTarget, messageChange)
                        end)
                    end
                end
            end)
        end
        
        protectMessage(game.Players.LocalPlayer.Name, "[Protect By Alchemy Hub]")
        protectMessage(game.Players.LocalPlayer.DisplayName, "[Protect By Alchemy Hub]")
    end, function(err : string)
        warn(string.format("Streamer mode function error %s\n", err))
    end)
end;

---------/// WhiteScreen & BlackScreen ///---------

-- updateStatus("Setting Up W/B Screen");

xpcall(function()
    if whitescreen or blackscreen then
        local setblackscreen : (state : boolean) -> nil = function(state : boolean) end
        local Blackscreen : nil = nil
        local Blackscreen2 : {} = {}

        if blackscreen then
            Blackscreen = Instance.new("ScreenGui")
            Blackscreen2 = Instance.new("Frame")

            Blackscreen.Name = "BLACK"
            Blackscreen.Parent = getService.CoreGui
            Blackscreen2.Name = "Blackscreen"
            Blackscreen2.Parent = Blackscreen
            Blackscreen2.Size = UDim2.new(500, 0, 500, 0)
            Blackscreen2.AnchorPoint = Vector2.new(0.5, 0.5)
            Blackscreen2.Position = UDim2.new(0.5, 0, 0.5, 0)
            Blackscreen2.BackgroundTransparency = 0
            Blackscreen2.BackgroundColor3 = Color3.new(0, 0, 0)
            Blackscreen2.Visible = false

            setblackscreen = function(state : boolean)
                Blackscreen2.Visible = state
            end
        end
        getService.UserInputService.WindowFocusReleased:Connect(function()
            getService.RunService:Set3dRenderingEnabled(false)
            setblackscreen(true)
        end)

        getService.UserInputService.WindowFocused:Connect(function()
            getService.RunService:Set3dRenderingEnabled(true)
            setblackscreen(false)
        end)
    end
end, function(err : string)
    warn(string.format("WhiteScreen function error %s\n", err))
end)

---------/// Fully Rejoin ///---------

-- updateStatus("Setting Up Fully Rejoin");

if fully_rejoin then
    getgenv().start_fully_rejoin = tick()

    task.spawn(function()
        while true do task.wait()
            xpcall(function()
                if tick() - start_fully_rejoin >= 1200 then
                    getService.TeleportService:Teleport(game.PlaceId) 
                end
            end, function(err : string)
                warn(string.format("Fully rejoin function error %s\n", err))
            end)
        end
    end)
end

---------/// Anit AFK ///---------

-- updateStatus("Setting Up Anti-AFK");

spawn(function()
    xpcall(function()
        getService.Players.LocalPlayer.Idled:connect(function()
            if game.GameId == 5750914919 then
                --[[local Camera = getService.Workspace.CurrentCamera
                Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, Vector3.new(Camera.CFrame.Position.x, Camera.CFrame.Position.y - 1, Camera.CFrame.Position.z + 1))
                wait(1)
                Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, Vector3.new(Camera.CFrame.Position.x, Camera.CFrame.Position.y - 1, Camera.CFrame.Position.z - 1))]]
            else
                getService.VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                wait(1)
                getService.VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end
        end)
    end, function(err : string)
        warn(string.format("Anti afk function error %s\n", err))
    end)
end)

---------/// Auto Join Discord ///---------

if not(premium or oneclick or kaitan or kaitun or rollback) then
    xpcall(function()
        local discord : () -> nil = function()
            (request or http_request)({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = getService.HttpService:JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = {code = "alchemyhub"},
                    nonce = getService.HttpService:GenerateGUID(false)
                })
            })
        end

        if not isfile('MaDuHereARai.dll') then
            discord();writefile('MaDuHereARai.dll', tostring(tick()))
        end

        if (tick() - tonumber(readfile('MaDuHereARai.dll')) > 21600) or (tick() - tonumber(readfile('MaDuHereARai.dll')) < 0) then
            discord();writefile('MaDuHereARai.dll', tostring(tick()))
        end
    end, function(err : string)
        warn(string.format("Auto join discord function error %s\n", err))
    end)
end

-- updateStatus("Starting");task.wait(1);closeLoading()

---------/// Check if not execute 2 times ///---------

if not(getgenv().run_time) then
    local UILibrary : {} = loadstring(game:HttpGet("https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/ui/old.lua"))()
    
    ---------/// Notify For Fisch ///---------

    if game.GameId == 5750914919 then -- for fisch
        UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/ui/old_noasset.lua"))()
    end

    local Notification : {new : () -> nil} = UILibrary:Notification();
    
    ---------/// Send Notify ///---------

    if premium or (oneclick or kaitan or kaitun or rollback) then
        Notification.new({
            Title = "Thank you for Support!",
            Description = "Enjoy scripts and features.\nalso don't forget to write a reviews. 👍",
            Duration = 10,
        })
    else
        Notification.new({
            Title = "Wanna Join Discord Server?",
            Description = "We have big community and news on this server\nWe also have key giveaway too, Thank you for all Support!!",
            Dialog = true,
            Buttons = {
                {
                    Title = "Sure!",
                    Callback = function()
                        print('discord.gg/alchemyhub')
                        if setclipboard then
                            setclipboard("https://discord.gg/alchemyhub")
                        end
                    end,
                },
                {
                    Title = "No Thanks",
                    Callback = function()
                        print('discord.gg/alchemyhub')
                    end,
                }
            }
        })
    end

    
    if not(oneclick or kaitan or kaitun or rollback) then
        Notification.new({
            Title = "Wanna Remove Workspace?",
            Description = "This will delete all your setting and config.",
            Dialog = true,
            Buttons = {
                {
                    Title = "Yes",
                    Callback = function()
                        if isfolder and delfolder then
                            if isfolder("alchemyhub_neta") then
                                delfolder("alchemyhub_neta")
                                print("Delete Workspace Done!")
                            end
                        end
                    end,
                },
                {
                    Title = "No",
                    Callback = function()
                        print('Nothing.')
                    end,
                }
            }
        })
    end

    ---------/// Mark as already execute ///---------

    getgenv().run_time = true

    ---------/// Print Script Key Config ///---------

    if script_key then
        print(string.format("Key : %s\n", script_key))
    end

    ---------/// Load Scripts ///---------

    local tar : any = nil;local idc : any = __f['__nokey']();
    if aimbot then __f['__load']("https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/scripts/mini/Aimbot.lua")
    elseif fruits_finder then __f['__load']("https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/scripts/mini/FruitFinder.lua")
    --elseif arise_afk then __f['__load']("https://api.luarmor.net/files/v4/loaders/a80497a34c31326d7dfb5d734af4ae33.lua")
    elseif premium then tar = __f['__premium'](); __f['__load']("https://api.luarmor.net/files/"..tar) 
    elseif oneclick then tar = __f['__oneclick'](); __f['__load']("https://api.luarmor.net/files/"..tar) 
    elseif rollback then tar = __f['__rollback'](); __f['__load']("https://api.luarmor.net/files/"..tar) 
    elseif idc and typeof(idc) == 'string' then __f['__load']("https://api.luarmor.net/files/"..idc) 
    else getgenv().loader = __f['__game'](); __f['__load']("https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/keysystem/1.lua") end;
end
