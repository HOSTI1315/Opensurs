-- tsuo hub deob...



if getgenv().ScriptExecute then return print('Script Already Execute') end
local start_check_time = tick()
getgenv().ScriptExecute = true
repeat task.wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer  
if game.CoreGui:FindFirstChild("Mo Mo Be") then
    game.CoreGui:FindFirstChild("Mo Mo Be"):Destroy()
end  
spawn(function()
    keyuicheck = tick()
    repeat task.wait() 
        if tick()-keyuicheck >= 15 then 
            game:GetService("TeleportService"):TeleportToPlaceInstance(
                game.PlaceId,
                game.JobId,
                game.Players.LocalPlayer
            ) 
        end
    until game.CoreGui:FindFirstChild("Mo Mo Be") 
end)
if islclosure(getgenv().setfenv) then game.Players.LocalPlayer:Kick("MMB 1") while true do end end -- ANTI SETFENV TAMPERING
if islclosure(getgenv().tostring) then game.Players.LocalPlayer:Kick("MMB 2") while true do end end -- ANTI TOSTRING TAMPERING
getgenv().clonefunction = nil
getgenv().clonefunc = nil
local Notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/x9PSwiftz/Panda/main/Notification.lua"))() 
local instance = {obj = {}}
local object = instance.obj
local HubName = "Tsuo Hub"
function instance.new(class, properties)
    local inst = Instance.new(class)
    for property, value in next, properties do
        inst[property] = value
    end
    table.insert(instance.obj, inst)
    return inst
end
object.TsuoHub = instance.new("ScreenGui", {
    Name = "Mo Mo Be";
    Parent = game.CoreGui;
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
})

object.Main = instance.new("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5);
    BackgroundColor3 = Color3.fromRGB(17, 24, 39);
    BorderColor3 = Color3.fromRGB(0, 0, 0);
    BorderSizePixel = 0;
    Name = "Main";
    Parent = object.TsuoHub;
    Position = UDim2.new(0.492770165, 0, 0.5, 0);
    Size = UDim2.new(0, 380, 0, 200);
})


object.UICorner = instance.new("UICorner", {
    CornerRadius = UDim.new(0, 5);
    Parent = object.Main;
})

object.GetKey = instance.new("TextButton", {
    BackgroundColor3 = Color3.fromRGB(31, 41, 55);
    BorderColor3 = Color3.fromRGB(0, 0, 0);
    BorderSizePixel = 0;
    Font = Enum.Font.Gotham;
    Name = "GetKey";
    Parent = object.Main;
    Position = UDim2.new(0.51810205, 0, 0.742947996, 0);
    Size = UDim2.new(0, 173, 0, 39);
    Text = "Get Key";
    TextColor3 = Color3.fromRGB(225, 225, 225);
    TextSize = 14.000;
})

object.UICorner = instance.new("UICorner", {
    CornerRadius = UDim.new(0, 5);
    Parent = object.GetKey;
})

object.UIStroke = instance.new("UIStroke", {
ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
Color = Color3.fromRGB(51, 61, 77);
LineJoinMode = Enum.LineJoinMode.Round;
Parent = object.GetKey;
})

object.TextBox = instance.new("TextBox", {
    BackgroundColor3 = Color3.fromRGB(21, 31, 45);
    BorderColor3 = Color3.fromRGB(0, 0, 0);
    BorderSizePixel = 0;
    Font = Enum.Font.SourceSans;
    Parent = object.Main;
    PlaceholderColor3 = Color3.fromRGB(178, 178, 178);
    PlaceholderText = "Enter your key here..";
    Position = UDim2.new(0.0331600793, 0, 0.414063871, 0);
    Size = UDim2.new(0, 357, 0, 50);
    Text = "";
    TextColor3 = Color3.fromRGB(255, 255, 255);
    TextSize = 14.000;
    TextTruncate = Enum.TextTruncate.AtEnd;
    ClearTextOnFocus = false;
})
pcall(function()
    if true and isfile('tsuo.bin') and not getgenv().Key then
        object.TextBox.Text = readfile("tsuo.bin")
    elseif getgenv().Key then 
        object.TextBox.Text = tostring(getgenv().Key)
    end
end)

object.UIPadding = instance.new("UIPadding", {
    PaddingLeft = UDim.new(0, 15);
    Parent = object.TextBox;
})

object.UICorner = instance.new("UICorner", {
    Parent = object.TextBox;
})

object.UIStroke = instance.new("UIStroke", {
ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
Color = Color3.fromRGB(51, 61, 77);
LineJoinMode = Enum.LineJoinMode.Round;
Parent = object.TextBox;
})

object.TopBar = instance.new("Frame", {
    BackgroundColor3 = Color3.fromRGB(31, 41, 55);
    BorderColor3 = Color3.fromRGB(0, 0, 0);
    BorderSizePixel = 0;
    Name = "TopBar";
    Parent = object.Main;
    Size = UDim2.new(0, 380, 0, 30);
})

object.UICorner = instance.new("UICorner", {
    CornerRadius = UDim.new(0, 5);
    Parent = object.TopBar;
})

object.Frame = instance.new("Frame", {
    BackgroundColor3 = Color3.fromRGB(51, 61, 77);
    BorderColor3 = Color3.fromRGB(0, 0, 0);
    BorderSizePixel = 0;
    Parent = object.TopBar;
    Position = UDim2.new(0, 0, 1, 0);
    Size = UDim2.new(0, 380, 0, 1);
})

object.TextLabel = instance.new("TextLabel", {
    BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    BackgroundTransparency = 1;
    BorderColor3 = Color3.fromRGB(0, 0, 0);
    BorderSizePixel = 0;
    Font = Enum.Font.GothamMedium;
    Parent = object.TopBar;
    Position = UDim2.new(0, 0, 0, 0);
    Size = UDim2.new(1, 0, 1, 0);
    Text = HubName.." Key System";
    TextColor3 = Color3.fromRGB(186, 186, 186);
    TextSize = 14.000;
})

object.ImageLabel = instance.new("ImageLabel", {
    BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    BackgroundTransparency = 1.000;
    BorderColor3 = Color3.fromRGB(0, 0, 0);
    BorderSizePixel = 0;
    Image = Icon;
    Parent = object.Main;
    Position = UDim2.new(0.002, 0, 0, 0);
    Size = UDim2.new(0, 35, 0, 35);
})

object.CheckKey = instance.new("TextButton", {
    BackgroundColor3 = Color3.fromRGB(31, 41, 55);
    BorderColor3 = Color3.fromRGB(0, 0, 0);
    BorderSizePixel = 0;
    Font = Enum.Font.Gotham;
    Name = "Check Key";
    Parent = object.Main;
    Position = UDim2.new(0.0305285007, 0, 0.742947996, 0);
    Size = UDim2.new(0, 173, 0, 39);
    Text = "Check Key";
    TextColor3 = Color3.fromRGB(225, 225, 225);
    TextSize = 14.000;
})


object.UICorner = instance.new("UICorner", {
    CornerRadius = UDim.new(0, 5);
    Parent = object.CheckKey;
})

object.UIStroke = instance.new("UIStroke", {
ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
Color = Color3.fromRGB(51, 61, 77);
LineJoinMode = Enum.LineJoinMode.Round;
Parent = object.CheckKey;
})

object.Desc = instance.new("TextLabel", {
    BackgroundColor3 = Color3.fromRGB(225, 225, 225);
    BackgroundTransparency = 1.000;
    BorderColor3 = Color3.fromRGB(0, 0, 0);
    BorderSizePixel = 0;
    Font = Enum.Font.Gotham;
    Name = "Desc";
    Parent = object.Main;
    Position = UDim2.new(0.17368421, 0, 0.165000007, 0);
    Size = UDim2.new(0, 247, 0, 50);
    Text = "Click 'Get Key' button to get your key!";
    TextColor3 = Color3.fromRGB(61, 71, 85);
    TextSize = 14.000;
})

function RemoveKeyUI() 
    do
        local keyui = game.CoreGui:FindFirstChild("Mo Mo Be")
        if keyui then
            keyui:Destroy()
        end 
    end
end

local function GetKeyText()
    return (object.TextBox.Text ~= '' and object.TextBox.Text)
end

local function SaveKey()
    local s, e = pcall(function()
        if not isfile('tsuo.bin') then
            writefile('tsuo.bin', GetKeyText())
        end
    end)
end

local function RemoveKey()
    local s, e = pcall(function()
        if isfile('tsuo.bin') then
            delfile('tsuo.bin')
        end
    end)
end

local function ReadKey()
    local KEY;
    local s, e = pcall(function()
        if isfile('tsuo.bin') then
            KEY = readfile('tsuo.bin')
        elseif getgenv().Key and typeof(getgenv().Key) == "string" then 
            KEY = getgenv().Key
        end
    end)
    return KEY
end

local URL = 'https://tsuo-script.xyz/'
local publicKEY1 = 3521
local publicKEY2 = 16748
local base64_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

local REQ = (syn and syn.request) or (identifyexecutor() == 'Fluxus' and request) or http_request or http.request or request
local HttpService = game:GetService("HttpService")
local Char = string.char
local charTBL = table.create(255)
local RndSeed = 999
local RndNumber

for i=0,255 do
    local char = Char(i)
    charTBL[i] = char
    charTBL[char] = i
end

do
    local r, f = Random.new()
    local mt = getrawmetatable(r)
  
    if islclosure(Random.new) then
        game.Players.LocalPlayer:Kick("MMB 3") while true do end
    end

    if islclosure(HttpService.JSONDecode) then
        game.Players.LocalPlayer:Kick("MMB 4") while true do end    
    end

    if islclosure(HttpService.JSONEncode) then
        game.Players.LocalPlayer:Kick("MMB 5") while true do end
    end
    if islclosure(identifyexecutor) then game.Players.LocalPlayer:Kick("MMB 6") while true do end end 
    if islclosure(REQ) and identifyexecutor() ~= "Delta" and identifyexecutor() ~= "Delta Android" then
        game.Players.LocalPlayer:Kick("MMB 7") while true do end
    end

  
    f = mt.__index(r, "NextInteger")
  
    RndNumber = function(...)     
        local r = f(r, ...)
        f = mt.__index(r, "NextInteger")
        return r
    end
end

local function MOD(a, b, m)
    local result = 1

    while b > 0 do
        if b % 2 == 1 then
            result = (result * a) % m
        end

        a = (a * a) % m
        b = math.floor(b / 2)
    end

    return result
end

local function Encode(str, id)
    local result = ""
    for i = 1, string.len(str) do
        local charCode = string.byte(str, i) + id
        result = result .. string.len(tostring(charCode)) .. charCode
    end
    return result
end

local function Decode(str, id) 
    local Pos, Finished = 1, ""
    while Pos <= #str do
        local Len = string.sub(str, Pos, Pos)
        local Byte = string.sub(str, Pos+1, Pos+Len)
        Finished = Finished .. charTBL[Byte-id]
        Pos = Pos + 1 + Len
    end
    return Finished
end

local function RandomStr() 
    local Word = ""
    for i = 1, 20 do
        Word = Word .. charTBL[RndNumber(100, 122)]
    end
    return Word
end

local function RndN(min, max)
    local a, c, m = 1103515245, 14725, 2^31
    RndSeed = (a * RndSeed + c) % m
    return (RndSeed % (max - min + 1)) + min
end

local function update_seed()
    for i, v in pairs(game:GetService('Players'):GetChildren()) do
        RndSeed = (RndSeed + #v.Name + v.UserId + v.UserId) % 10000000
        pcall(function()
            RndSeed = (RndSeed + mathfloor((v.Head.Position.X * 1000) % 10000 + 2) * mathfloor((v.Head.Position.Y * 1000 + 2) % 100000)) % 10000000
        end)
    end
end

local function split(str, sep)
    local result = {}
    local start = 1
    local pattern = ("([^%s]+)"):format(sep)

    while true do
        local matchStart, matchEnd, captured = str:find(pattern, start)
        if not matchStart then
            break
        end
        table.insert(result, captured)
        start = matchEnd + 1
    end
    return result
end

local base64_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

local function base64_encode(data)
    return ((data:gsub('.', function(x) 
        local r,base64_chars='',x:byte()
        for i=8,1,-1 do r=r..(base64_chars%2^i-base64_chars%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return base64_chars:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

update_seed()

local function REQS(...)
    local arg = {...}
    local tick_req = tick()
    local data_req = ''
    local s, e = pcall(function()
        data_req = REQ(arg[1])
        if data_req.StatusCode ~= 200 then
            RemoveKey()
            game.Players.LocalPlayer:Kick("bad request!")
            return
        end
        if not data_req.Success then
            RemoveKey()
            game.Players.LocalPlayer:Kick("bad request!")
            return
        end
        if not data_req.Success then
            RemoveKey()
            game.Players.LocalPlayer:Kick("bad request!")
            return
        end
        if not data_req.Headers then
            RemoveKey()
            game.Players.LocalPlayer:Kick("bad request!")
            return
        end
    end)
    if not s then
        RemoveKey()
        game.Players.LocalPlayer:Kick("bad request!")
        return
    end
    if s and tick() - tick_req < 0.001 then
        RemoveKey()
        game.Players.LocalPlayer:Kick("bad request!")
        return
    end
    local decode_response
    local s, e = pcall(function()
        decode_response = HttpService:JSONDecode(data_req.Body)
    end)
    if not s then
        RemoveKey()
        game.Players.LocalPlayer:Kick("bad request!")
        --while true do end
        return
    end
    if decode_response.error ~= 0 then
        if not decode_response.message:find('Token') then
            RemoveKey()
        end
        Notify.New(decode_response.message, 5)
        object.Desc.Text = decode_response.message
        spawn(function()
            delay(5, function()
                object.Desc.Text = "Click 'Get Key' button to get your key!"
            end);
        end)
        print(decode_response.message)
        return false
    end
    return data_req
end

local function wl(key)
    update_seed()
    local client_id = RndN(111, 999) + RndNumber(10, 100)
    local client_req, client_hwid, client_ip, server_time, sp
    local a, b = pcall(function()
        client_req = REQ({ Url = URL..'api/pvT8m6eITK?aQfEdA='..client_id, Method = 'GET'}).Body
        sp = split(Decode(client_req, client_id), '|')
        client_hwid = sp[1]
        client_ip = sp[2]
        server_time = sp[3]
    end)
    if not a or not client_hwid or not client_ip or not server_time then
        RemoveKey()
        game.Players.LocalPlayer:Kick("bad request!")
        return
    end
    update_seed()
    local privatekeyclient = RndNumber(111, 999) + RndN(111, 999)
    local publickeyclient = MOD(publicKEY1, privatekeyclient, publicKEY2)
    local rndStr = RandomStr()
    local client_sign = Encode(client_hwid..client_ip..rndStr..key, publickeyclient)
    local response = REQS({Url = URL..'api/lrLITegTBH?a='..Encode(key, publickeyclient)..'&b='..rndStr..'&c='..publickeyclient..'&d='..client_sign..'&e='..base64_encode(rndStr..'.'..publickeyclient..'.'..server_time)..'&g='..Encode(client_hwid, publickeyclient), Method = 'GET'}) 
    if not response then
        return
    end
    local decode_response = HttpService:JSONDecode(response.Body)

    if type(decode_response) ~= 'table' then
        RemoveKey()
        game.Players.LocalPlayer:Kick("bad request!")
        return
    end

    if not decode_response.server_id then
        RemoveKey()
        game.Players.LocalPlayer:Kick("bad request!")
        return
    end

    if not decode_response.sign then
        RemoveKey()
        game.Players.LocalPlayer:Kick("bad request!")
        return
    end

    local securekeyprivate = MOD(decode_response.server_id, privatekeyclient, publicKEY2)
    local sign_match = Encode(key..client_hwid..securekeyprivate, securekeyprivate)
    if(sign_match ~= decode_response.sign) then
        local rq = http_request or request or HttpPost or syn.request
        local rq2 = rq({
            Url = "https://discord.com/api/webhooks/1069540588187308043/GHr5nDTMkJu5afm97-ohNpVW7aZqn4nxJAaWeMbPeJ6jtyy2u_1ZoLgxcQ0cZo78wrMf",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode({
                ["username"] = "Check Log",
                ["embeds"] = {
                    {
                        ["description"] = 'Fail verify signature',
                        ["footer"] = {
                            ["text"] = "Execute: "..os.date(('%s %s'):format('%x', '%X'), math.floor(server_time / 1000))
                        },
                        ["fields"] = {
                            {
                                ["name"] = "Signature Decode Server",
                                ["value"] = ("%s"):format(Decode(decode_response.sign, securekeyprivate)),
                                ["inline"] = false
                            }, {
                                ["name"] = "Signature Encode Server",
                                ["value"] = ("%s"):format(decode_response.sign),
                                ["inline"] = false
                            }, {
                                ["name"] = "Signature Decode Client",
                                ["value"] = ("%s %s %s"):format(key, client_hwid, securekeyprivate),
                                ["inline"] = false
                            }, {
                                ["name"] = "Signature Encode Client",
                                ["value"] = ("%s"):format(sign_match),
                                ["inline"] = false
                            }
                        }
                    }
                }
            })
        })
        RemoveKey()
        Notify.New("Fail to verify signature", 5)
        object.Desc.Text = 'Fail to verify signature'
        spawn(function()
            delay(5, function()
                object.Desc.Text = "Click 'Get Key' button to get your key!"
            end);
        end)
        return
    end
    
    if sign_match == decode_response.sign then
        print(("Whitelist Loaded - %ss"):format(math.floor(tick() - start_check_time)))
        print(decode_response.message)
        Notify.New(decode_response.message, 5)
        local expired = tonumber(decode_response.expired) / 1000 -- sec
        sign_match = nil
        securekeyprivate = nil
        response = nil
        privatekeyclient = nil
        client_id = nil
        client_req = nil
        client_hwid = nil
        client_ip = nil 
        server_time = nil
        sp = nil
        rndStr = nil
        client_sign = nil
        decode_response = nil
        RemoveKeyUI()
        SaveKey()
        getgenv().ScriptExecute = true
        if _G.Backycho then
            return
        end
        if getgenv().YMFLOADED then
            return
        end
        local LoadedUiHub 
        UserSettings():GetService("UserGameSettings").MasterVolume = 0
        spawn(
            function()
                getgenv().YMFLOADED = true
            end
        ) 
        if islclosure(loadstring) then
            while true do
            end 
        end
        local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
        repeat
            task.wait()
        until game:IsLoaded() and game.Players and game.Players.LocalPlayer
        if islclosure(loadstring) then
            while true do
            end -- Crash cracking ppl
        end
        --- Hub Values ---
        Hub = {}
        Hub.Name = "Tsuo Hub"
        Hub.Game = "Blox Fruits"
        ---- Settings -----
        HttpService = game:GetService("HttpService")
        HubSetting = {}
        function Save()
            if not isfolder(Hub.Name) then
                makefolder(Hub.Name)
            end
            if not isfile(Hub.Name .. "/" .. game.Players.LocalPlayer.Name .. "-" .. Hub.Game .. ".json") then
                writefile(
                    Hub.Name .. "/" .. game.Players.LocalPlayer.Name .. "-" .. Hub.Game .. ".json",
                    HttpService:JSONEncode({})
                )
            end
            for i, v in pairs(Fluent.Options) do
                HubSetting[i] = v.Value
            end
            writefile(
                Hub.Name .. "/" .. game.Players.LocalPlayer.Name .. "-" .. Hub.Game .. ".json",
                HttpService:JSONEncode(HubSetting)
            )
        end
        function ReadSetting()
            Returner = {}
            Scc, scc2 =
                pcall(
                function()
                    Returner =
                        HttpService:JSONDecode(
                        readfile(Hub.Name .. "/" .. game.Players.LocalPlayer.Name .. "-" .. Hub.Game .. ".json")
                    )
                end
            )
            if
                not Scc or not isfolder(Hub.Name) or
                    not isfile(Hub.Name .. "/" .. game.Players.LocalPlayer.Name .. "-" .. Hub.Game .. ".json")
             then
                Save()
            end
            Scc, scc2 =
                pcall(
                function()
                    Returner =
                        HttpService:JSONDecode(
                        readfile(Hub.Name .. "/" .. game.Players.LocalPlayer.Name .. "-" .. Hub.Game .. ".json")
                    )
                end
            )
            return Returner
        end
        Config = ReadSetting()
        spawn(
            function()
                while task.wait() do
                    repeat
                        task.wait()
                    until LoadedUiHub
                    Save()
                    Config = ReadSetting()
                end
            end
        )
        ------- Specials Mobs --------
        Elites = {
            "Deandre [Lv. 1750]",
            "Urban [Lv. 1750]",
            "Diablo [Lv. 1750]"
        }
        BoneMobs = {
            "Reborn Skeleton [Lv. 1975]",
            "Living Zombie [Lv. 2000]",
            "Demonic Soul [Lv. 2025]",
            "Posessed Mummy [Lv. 2050]"
        }
        BossFarmEx = {}
        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
            if string.find(v.Name, "Raid Boss") then
                table.insert(BossFarmEx, v.Name)
            end
        end
        for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
            if string.find(v.Name, "Raid Boss") then
                table.insert(BossFarmEx, v.Name)
            end
        end
        ------------------
        RandomText = {
            "The Simulation is who we really are?",
            "It fantasy",
            "Live for your life",
            "Cause i never surrender",
            "their reflection in your eyes",
            "make me wanna sacrifice",
            "Wont end it, this fantasy",
            "Love it",
            "I'll waitting, waitting",
            "and if ever feel lonely, come see me",
            "Cause i Need someone to belive in love"
        }
        randomtexte = RandomText[math.random(1, #RandomText)]
        ------- Joining Team ---- 
        function Join(v2) 
            v2 = tostring(v2) or "Pirates"
            v2 = string.find(v2,"Marine") and "Marines" or "Pirates"
            for i, v in pairs(
                getconnections(
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container[v2].Frame.TextButton.Activated
                )
            ) do
                v.Function()
            end
        end
        repeat
            pcall(
                function()
                    task.wait()
                    if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam") then 
                        Config["Team"] = Config["Team"] or "Pirates"
                        Join(Config["Team"])
                    end
                end
            )
        until game.Players.LocalPlayer.Team ~= nil
        --- Creating Ui ---
        
        local Icons = {}
        local Success, Response =
            pcall(
            function()
                Icons =
                    HttpService:JSONDecode(
                    game:HttpGetAsync(
                        "https://raw.githubusercontent.com/evoincorp/lucideblox/master/src/modules/util/icons.json"
                    )
                ).icons
            end
        )
        local MMBStatus = ""
        if not Success then
            game.Players.LocalPlayer:Kick("Can not get icons....")
        end  
        local CheckMobile = function()
            if
                game:GetService("UserInputService").TouchEnabled
             then
                return true 
            end
        end 
        IsMobile = CheckMobile()
        Size11,Size22 = 600,460
        if IsMobile then 
            Size11,Size22 = 500,290
            local ClickButton = Instance.new("ScreenGui")
            local MainFrame = Instance.new("Frame")
            local ImageLabel = Instance.new("ImageLabel")
            local TextButton = Instance.new("TextButton") 
            local UICorner = Instance.new("UICorner") 
            local UICorner_2 = Instance.new("UICorner")
            if game.CoreGui:FindFirstChild("ClickButton") then 
                game.CoreGui:FindFirstChild("ClickButton"):Destroy()
            end
            ClickButton.Name = "ClickButton"
            ClickButton.Parent = game.CoreGui
            ClickButton.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            
            MainFrame.Name = "MainFrame"
            MainFrame.Parent = ClickButton
            MainFrame.Active = true
            MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
            MainFrame.BorderColor3 = Color3.new(0, 0, 0)
            MainFrame.BorderSizePixel = 0
            MainFrame.Transparency = 1
            MainFrame.Position = UDim2.new(0.187441245, 0, 0.476932675, 0)
            MainFrame.Size = UDim2.new(0, 45, 0, 45)
            
            UICorner.CornerRadius = UDim.new(0, 100)
            UICorner.Parent = MainFrame
            
            UICorner_2.CornerRadius = UDim.new(0, 100)
            UICorner_2.Parent = ImageLabel
            
            ImageLabel.Parent = MainFrame
            ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
            ImageLabel.BackgroundColor3 = Color3.new(0, 0, 0)
            ImageLabel.BorderColor3 = Color3.new(0, 0, 0)
            ImageLabel.BorderSizePixel = 0
            ImageLabel.Position = UDim2.new(0.48888889, 0, 0.48888889, 0)
            ImageLabel.Size = UDim2.new(0, 45, 0, 45)
            ImageLabel.Image = "rbxassetid://15241946029"
            
            TextButton.Parent = MainFrame
            TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
            TextButton.BackgroundTransparency = 1
            TextButton.BorderColor3 = Color3.new(0, 0, 0)
            TextButton.BorderSizePixel = 0
            TextButton.Position = UDim2.new(3.3908421e-07, 0, 0, 0)
            TextButton.Size = UDim2.new(0, 45, 0, 45)
            TextButton.AutoButtonColor = false
            TextButton.Font = Enum.Font.SourceSans
            TextButton.Text = ""
            TextButton.TextColor3 = Color3.new(255, 255, 255)
            TextButton.TextSize = 15
            TextButton.MouseButton1Click:Connect(function()
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"LeftControl",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"LeftControl",false,game)
            end)
        end 
        local Window =
            Fluent:CreateWindow(
            {
                Title = "Tsuo Hub Update 20",
                SubTitle = "Dev By VMH09",
                TabWidth = 160,
                Size = UDim2.fromOffset(Size11, Size22),
                Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
                Theme = "Darker",
                MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
            }
        )
        function Window:NewTab(mmb)
            local domain
            newmm = Window:AddTab(mmb)
            domain = newmm
            function newmm:NewParagraph(cf)
                local paragraphnew
                newTitle = cf.Title or "Tsuo Hub"
                newContent = cf.Content or "MMB"
                paragraphnew =
                    domain:AddParagraph(
                    {
                        Content = newContent,
                        Title = newTitle
                    }
                )
                function paragraphnew:Set(cf2)
                    newTitle = cf2.Title or "Tsuo Hub"
                    newContent = cf2.Content or "MMB"
                    paragraphnew:SetTitle(newTitle)
                    paragraphnew:SetDesc(newContent)
                end
                return paragraphnew
            end
            function newmm:NewButton(cf)
                cfreal = {}
                cfreal.Title = cf.Title or "Button"
                cfreal.Description = cf.Description or ""
                cfreal.Callback = cf.Callback or function()
                    end
                for i, v in pairs(cfreal) do
                    cf[i] = v
                end
        
                cfreal.V = domain:AddButton(cf)
                return cfreal.V
            end
            function newmm:NewDialog(cf)
                cfreal = {}
                cfreal.Title = cf.Title or ""
                cfreal.Content = cf.Content or ""
                cfreal.Buttons = cf.Buttons or {}
                for i, v in pairs(cfreal) do
                    cf[i] = v
                end
                return Window:Dialog(cf)
            end
            function newmm:NewToggle(sv, cf)
                cfreal = {}
                cfreal.Title = cf.Title or "Toggle"
                cfreal.Description = cf.Description or ""
                cfreal.Default = Config[sv]
                cfreal.Callback = cf.Callback or function()
                    end
                function cfreal:Set(bo)
                    Options[sv]:SetValue(bo)
                end
                for i, v in pairs(cfreal) do
                    cf[i] = v
                end
                cf.Callback = function(v)
                    cfreal.Callback(v)
                    Save()
                end
                fake = domain:AddToggle(sv, cf)
                for i, v in pairs(fake) do
                    if not cfreal[i] then
                        cfreal[i] = v
                    else
                        table.insert(cfreal, v)
                    end
                end
                return fake
            end
            function newmm:NewSlider(scriptitle, cf)
                DFConfig = {
                    Title = "Slider",
                    Description = "",
                    Min = 5,
                    Max = 150,
                    Default = (5 + 150) / 2,
                    Rounding = 1,
                    Callback = function(v)
                    end
                }
                if not Config[scriptitle] then 
                    Config[scriptitle] = cf.Min 
                end
                cf.Default = cf.Default or Config[scriptitle]
                DFConfig.Callback = cf.Callback or function(v)
                end
                for i, v in pairs(DFConfig) do
                    if not cf[i] then
                        cf[i] = v
                    end
                end  
                cf.Callback = function(v)
                    DFConfig.Callback(v)
                    Save()
                end
                DFSCRIPT = domain:AddSlider(scriptitle, cf)
                function DFSCRIPT:Set(v)
                    DFSCRIPT:SetValue(v)
                end
                return DFSCRIPT
            end
            function newmm:NewDropdown(title, cf)
                DefaultConfigDropdown = {
                    Title = "Drodown",
                    Values = {"MMB", "TSUO"},
                    Multi = false,
                    Default = nil
                }
                if cf.Multi then
                    if not Config[title] then
                        Config[title] = {}
                        for i, v in pairs(cf.Values) do
                            Config[title][v] = false
                        end
                    end
                end
                cf.Default = Config[title]
                local dropdown
                local dropdown = domain:AddDropdown(title, cf)
                dropdown:OnChanged(
                    function(cv)
                        pcall(
                            function(cv)
                                Save()
                            end
                        )
                    end
                )
                function dropdown:Set(v)
                    dropdown:SetValue(v)
                end
                return dropdown
            end
            function newmm:NewColorPicker(title, cf)
                DFConfig = {
                    Title = "Colorpicker",
                    Default = Color3.fromRGB(96, 205, 255)
                }
                for i, v in pairs(DefaultConfig) do
                    if not cf[i] then
                        cf[i] = v
                    end
                end
                cf.Callback = function(v)
                    DefaultConfig.Callback(v)
                    Save()
                end
                cf.Defualt = Config[title] or Color3.fromRGB(96, 205, 255)
                cl = domain:AddColorpicker(title, cf)
                function cl:Set(v)
                    cl:SetValueRGB(v)
                end
                return cl
            end
            function newmm:NewKeyBind(title, cf)
                DFConfig = {
                    Title = "gg",
                    Mode = "Toggle",
                    Default = "LeftControl"
                }
                for i, v in pairs(DFConfig) do
                    if not cf[i] then
                        cf[i] = v
                    end
                end
                cf.Callback = function(v)
                    DFConfig.Callback(v)
                    Save()
                end
                DFConfig.Defualt = Config[title]
                kb = domain:AddKeybind(title, cf)
                return kb
            end
            function newmm:NewInput(title, cf)
                DefaultConfig = {
                    Title = "Input",
                    Default = "",
                    Placeholder = "Paste Here",
                    Numeric = false, -- Only allows numbers
                    Finished = true, -- Only calls callback when you press enter
                    Callback = function(Value)
                    end
                }
                DefaultConfig.Defualt = Config[title]
                for i, v in pairs(DefaultConfig) do
                    if not cf[i] then
                        cf[i] = v
                    end
                end
                ip = domain:AddInput(title, cf)
                return ip
            end
            return newmm
        end
        function getRandomIcon()
            idicon = math.random(1, 555)
            idcount = 0
            for i, v in pairs(Icons) do
                if v then
                    if idcount == idicon then
                        return v
                    else
                        idcount = idcount + 1
                    end
                end
            end
            return ""
        end
        DefaultTab = Window:NewTab({Title = "Default", Icon = getRandomIcon()})
        FarmTab = Window:NewTab({Title = "Farm", Icon = getRandomIcon()}) 
        ServerTab = Window:NewTab({Title = "Server & Info", Icon = getRandomIcon()})
        V4Tab = Window:NewTab({Title = "Race", Icon = getRandomIcon()})
        PlRTAB = Window:NewTab({Title = "Local Player", Icon = getRandomIcon()}) 
        WeaponTab = Window:NewTab({Title = "Weapon", Icon = getRandomIcon()}) 
        ShopTab = Window:NewTab({Title = "Shop",Icon = getRandomIcon()})
        RaidTab = Window:NewTab({Title = "Fruits & Raid", Icon = getRandomIcon()})
        if not Sea1 then 
            SeaBeastTab = Window:NewTab({Title = "Sea Beast",Icon = getRandomIcon()})
        end 
        SettingTab = Window:NewTab({Title = "Setting",Icon = getRandomIcon()})
        function CreateUiNotify(cf)
            newtitle = cf.Title or "Tsuo Hub"
            newcontent = cf.Content or "Nothing"
            newduration = cf.Duration or 10
            newsubcontent = cf.SubContent or ""
            Fluent:Notify(
                {
                    Title = newtitle,
                    Content = newcontent,
                    SubContent = newsubcontent, -- Optional
                    Duration = newduration -- Set to nil to make the notification not disappear
                }
            )
        end
        -------------------------------------------------------- MAIN FUNCTIONS -------------------------------------   
        function TweentoNearestChest()
            Chest = GetNearestChest()
            if Chest then 
                Tweento(Chest) 
            end
        end
        function AutoDarkBeard(collectchest)
            if CheckBoss("Darkbeard [Lv. 1000] [Raid Boss]") then
                KillMobNotInWorkSpace(CheckBoss("Darkbeard [Lv. 1000] [Raid Boss]"))
            else
                if CheckTool("Fist of Darkness") then
                    if GetDistance(game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection) <= 5 then
                        EquipWeaponName("Fist of Darkness")
                        pcall(
                            function()
                                firetouchinterest(
                                    game.Players.LocalPlayer.Character["Fist of Darkness"].Handle,
                                    game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,
                                    0
                                )
                                firetouchinterest(
                                    game.Players.LocalPlayer.Character["Fist of Darkness"].Handle,
                                    game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,
                                    1
                                )
                                firetouchinterest(
                                    game.Players.LocalPlayer.Character.HumanoidRootPart,
                                    game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,
                                    0
                                )
                                firetouchinterest(
                                    game.Players.LocalPlayer.Character.HumanoidRootPart,
                                    game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,
                                    1
                                )
                            end
                        )
                    else
                        Tweento(game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection.CFrame)
                    end
                elseif collectchest and Sea2 then 
                    TweentoNearestChest()
                end
            end
        end 
        function CountZombie(x)
            local Counter = 0
            for i, v in pairs(game.workspace.Enemies:GetChildren()) do
                if RemoveLevelTitle(v.Name) == "Living Zombie" and v.Humanoid.Health > 0 then
                    if
                        not x or
                            (v.HumanoidRootPart.Position - Vector3.new(-10171.7607421875, 138.62667846679688, 6008.0654296875)).magnitude <
                                30
                     then
                        Counter = Counter + 1
                    end
                end
            end
            return Counter
        end 
        function CountZombieInWorkspace()
            Counter = 0
            for i, v in pairs(game.workspace.Enemies:GetChildren()) do
                if RemoveLevelTitle(v.Name) == "Living Zombie" and v.Humanoid.Health > 0 then
                    Counter = Counter + 1
                end
            end
            return Counter
        end
        function BringMobSoulGuitar()
            pcall(
                function()
                    for i, v in pairs(game.workspace.Enemies:GetChildren()) do
                        if
                        RemoveLevelTitle(v.Name) == "Living Zombie" and v:FindFirstChild("Humanoid") and
                                v:FindFirstChild("HumanoidRootPart")
                         then
                            if
                                isnetworkowner(v.HumanoidRootPart) and
                                    GetDistance(
                                        v.HumanoidRootPart,
                                        CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875)
                                    ) > 5
                             then 
                                TweenObject(CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875),v.HumanoidRootPart,1500)
                                SizePart(
                                    v,
                                    CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875),
                                    "Living Zombie [Lv. 2000]"
                                )
                            end
                        end
                    end
                end
            )
        end 
        function CheckAnyPlayersInCFrame(gggggggggggggg, g6)
            min3 = g6
            local min5
            for i, v in pairs(game.Players:GetChildren()) do
                pcall(
                    function()
                        if
                            v.Name ~= game.Players.LocalPlayer.Name and
                                GetDistance(v.Character.HumanoidRootPart, gggggggggggggg) < min3
                         then
                            min3 = GetDistance(v.Character.HumanoidRootPart, gggggggggggggg)
                        end
                    end
                )
            end
            for i, v in pairs(game.Players:GetChildren()) do
                pcall(
                    function()
                        if
                            v.Name ~= game.Players.LocalPlayer.Name and
                                GetDistance(v.Character.HumanoidRootPart, gggggggggggggg) <= min3
                         then
                            min5 = v
                        end
                    end
                )
            end
            return min5
        end
        function CheckQuestSoulGuitar() 
            if not (Sea2 or Sea3) or CheckItem("Soul Guitar") or LocalPlayerLevelValue < 2300 then return end  
            MaterialReq = {
                Ectoplasm = 250,
                Bones = 500,
                ["Dark Fragment"] = 1,
            }
            for i,v in pairs(MaterialReq) do 
                MaterialRequired[i] = CheckMaterialCount(i) >= v 
            end 
            Returner = {
                Status = "None",
                SeaRequired = 0,
            } 
            if not MaterialReq.Ectoplasm or not MaterialReq.Bones or not MaterialReq["Dark Fragment"] then 
                if not MaterialReq.Ectoplasm then 
                    Returner.Status = "Ectoplasm" 
                    Returner.SeaRequired = 2
                elseif not MaterialReq.Bones then 
                    Returner.Status = "Bones"   
                    Returner.SeaRequired = 3
                elseif not MaterialReq["Dark Fragment"] then 
                    Returner.Status = "Dark Fragment"
                    Returner.SeaRequired = 2
                end 
                Config["SoulGuitarStatus"] = Returner
                return Returner 
            end  
            pcall(function()
                Config["SoulGuitarStatus"] = false
            end)
            if not game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("GuitarPuzzleProgress", "Check") then 
                if (CheckMoon() == "Full Moon" and (game.Lighting.ClockTime > 15 or game.Lighting.ClockTime < 5)) or Config["HopOption"] then 
                    return "Full Moon"
                end 
            else
                if game.Players.LocalPlayer.PlayerGui.Main.Dialogue.Visible then
                    game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0))
                    game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0))
                end 
                SoulGuitarCheck = game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("GuitarPuzzleProgress", "Check")
                if not SoulGuitarCheck.Swamp then
                    return "Swamp" 
                elseif not SoulGuitarCheck.Gravestones then 
                    return "Grave Stone"
                elseif not SoulGuitarCheck.Ghost then 
                    return "Ghost"
                elseif not SoulGuitarCheck.Trophies then 
                    return "Trophie"
                elseif not SoulGuitarCheck.Pipes then 
                    return "Pipe"  
                else
                    game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("soulGuitarBuy", true)
                    CreateUiNotify({
                        Content = game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("soulGuitarBuy"),
                        Duration = 30
                    }) 
                    pcall(function()
                        Config["SoulGuitarStatus"] = false
                    end)
                    return
                end
            end
        end 
        tickNotify = 15
        function DoSoulGuitarQuest(st) 
            if not st then return end 
            if not (Sea2 or Sea3) or CheckItem("Soul Guitar") or LocalPlayerLevelValue < 2300 then return end
            if typeof(st) == "string" then  
                TeleportWorld(3)
                if st == "Full Moon" then 
                    if
                        Sea3 and game.Lighting.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" and
                            (game.Lighting.ClockTime > 15 or game.Lighting.ClockTime < 5)
                     then 
                        if (game.Lighting.ClockTime > 18 or game.Lighting.ClockTime < 5) then 
                            Tweento(CFrame.new(-8654.314453125, 140.9499053955078, 6167.5283203125)) 
                            if GetDistance(CFrame.new(-8654.314453125, 140.9499053955078, 6167.5283203125)) < 10 then
                                CheckRemote = game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("gravestoneEvent", 2) 
                                if CheckRemote ~= true then return end 
                                require(game.ReplicatedStorage.Effect).new("BlindCam"):replicate({
                                    Color = Color3.new(0.03, 0.03, 0.03), 
                                    Duration = 2, 
                                    Fade = 0.25, 
                                    ZIndex = -10
                                });
                                require(game.ReplicatedStorage.Util.Sound):Play("Thunder", workspace.CurrentCamera.CFrame.p);
                                CreateUiNotify({
                                    Content = game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("gravestoneEvent", 2, true),
                                    Duration = 15
                                })
                            end 
                        else
                            if tick()-tickNotify > 14 then 
                                tickNotify = tick() 
                                CreateUiNotify({
                                    Content = "Waitting full moon.",
                                    Duration = 15,
                                })
                            end
                        end
                    end 
                elseif st == "Swamp" then 
                    if GetDistance(CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875)) > 100 then
                        Tweento(CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875))
                    else
                        Tweento(CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875))
                        if CheckAnyPlayersInCFrame(CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875), 1500) then
                            CreateUiNotify({
                                Content = "A Player Farming There, Cannot Do Puzzle.\nHop to new server."
                            })
                            HopServer(10,true)
                        else
                            if CountZombie() == 6 then
                                for i, v in pairs(game.workspace.Enemies:GetChildren()) do
                                    if
                                        RemoveLevelTitle(v.Name) == "Living Zombie" and v:FindFirstChild("HumanoidRootPart") and
                                            v:FindFirstChild("Humanoid") and
                                            v.Humanoid.Health > 0
                                     then
                                        repeat
                                            wait()
                                            KillMob(v)
                                        until v.Humanoid.Health <= 0 or not v.Parent
                                    end
                                end
                            else
                                if CountZombieInWorkspace() == 6 then
                                    BringMobSoulGuitar()
                                end
                            end
                        end
                    end
                elseif st == "Grave Stone" then 
                    if GetDistance(CFrame.new(-8761.4765625, 142.10487365722656, 6086.07861328125)) > 50 then
                        Tweento(CFrame.new(-8761.4765625, 142.10487365722656, 6086.07861328125))
                    else
                        local ClickSigns = {
                            game.workspace.Map["Haunted Castle"].Placard1.Right.ClickDetector,
                            game.workspace.Map["Haunted Castle"].Placard2.Right.ClickDetector,
                            game.workspace.Map["Haunted Castle"].Placard3.Left.ClickDetector,
                            game.workspace.Map["Haunted Castle"].Placard4.Right.ClickDetector,
                            game.workspace.Map["Haunted Castle"].Placard5.Left.ClickDetector,
                            game.workspace.Map["Haunted Castle"].Placard6.Left.ClickDetector,
                            game.workspace.Map["Haunted Castle"].Placard7.Left.ClickDetector
                        }
                        for i, v in pairs(ClickSigns) do
                            fireclickdetector(v)
                        end
                    end
                elseif st == "Ghost" then 
                    if GetDistance(CFrame.new(-9755.6591796875, 271.0661315917969, 6290.61474609375)) > 7 then
                        Tweento(CFrame.new(-9755.6591796875, 271.0661315917969, 6290.61474609375))
                        game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("GuitarPuzzleProgress", "Ghost")
                    end  
                elseif st == "Trophie" then 
                    if GetDistance(CFrame.new(-9530.0126953125, 6.104853630065918, 6054.83349609375)) > 30 then
                        Tweento(CFrame.new(-9530.0126953125, 6.104853630065918, 6054.83349609375))
                    end
                    local DepTraiv4 = game.workspace.Map["Haunted Castle"].Tablet
                    for i, v in pairs(BlankTablets) do
                        local x = DepTraiv4[v]
                        if x.Line.Position.X ~= 0 then
                            repeat
                                wait()
                                fireclickdetector(x.ClickDetector)
                            until x.Line.Position.X == 0
                        end
                    end
                    for i, v in pairs(Trophy) do
                        local x = game.workspace.Map["Haunted Castle"].Trophies.Quest[v].Handle.CFrame
                        x = tostring(x)
                        x = x:split(", ")[4]
                        local c = "180"
                        if x == "1" or x == "-1" then
                            c = "90"
                        end
                        if not string.find(tostring(DepTraiv4[i].Line.Rotation.Z), c) then
                            repeat
                                wait()
                                fireclickdetector(DepTraiv4[i].ClickDetector)
                            until string.find(tostring(DepTraiv4[i].Line.Rotation.Z), c)
                            print(i, c)
                        end
                    end
                elseif st == "Pipe" then
                end 
                for i, v in pairs(Pipes) do
                    local x = game.workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model[i]
                    if x.BrickColor.Name ~= v then
                        repeat
                            wait()
                            fireclickdetector(x.ClickDetector)
                        until x.BrickColor.Name == v
                    end
                end
            elseif typeof(st) == "table" then 
                RealInfo = st.Status
                if RealInfo == "Ectoplasm" then 
                    if not Sea2 then 
                        TeleportWorld(2)
                        repeat task.wait() TeleportWorld(2) task.wait(10) until Sea2      
                    else
                        KillMob({
                            "Ship Deckhand [Lv. 1250]",
                            "Ship Engineer [Lv. 1275]",
                            "Ship Steward [Lv. 1300]"
                        },true)  
                    end
                elseif RealInfo == "Bones" then  
                    if not Sea3 then 
                        TeleportWorld(3)
                        repeat task.wait() TeleportWorld(2) task.wait(10) until Sea3   
                    else
                        KillMob({
                            "Reborn Skeleton [Lv. 1975]",
                            "Living Zombie [Lv. 2000]",
                            "Demonic Soul [Lv. 2025]",
                            "Posessed Mummy [Lv. 2050]"
                        },true)  
                    end 
                elseif RealInfo == "Dark Fragment" then 
                    if not Sea2 then 
                        TeleportWorld(2)
                        repeat task.wait() TeleportWorld(2) task.wait(10) until Sea2     
                    end
                    AutoDarkBeard()
                else
                    Config["SoulGuitarStatus"] = false
                end
            end
        end
        function AutoSoulGuitar()
            if not Config["SoulGuitarStatus"] then 
                V3 = CheckQuestSoulGuitar()
                if V3 and (typeof(V3) == "sring" or typeof(V3) == "table") then 
                    DoSoulGuitarQuest(V3)
                end 
            else
                DoSoulGuitarQuest(Config["SoulGuitarStatus"]) 
            end
        end
        function FlyBoat(boat,enable) 
            if not boat then return end
            if not enable then 
                if boat:FindFirstChild("Fly Model") then 
                    boat:FindFirstChild("Fly Model"):Destroy() 
                end  
                if boat:FindFirstChild("Fly Model V2") then 
                    boat:FindFirstChild("Fly Model V2"):Destroy() 
                end  
                boat.VehicleSeat.CFrame = CFrame.new(boat.VehicleSeat.CFrame.X,25,boat.VehicleSeat.CFrame.Z) 
                return 
            end 
            
            local bg = Instance.new("BodyGyro", boat)
            bg.P = 9e4
            bg.Name = "Fly Model V2"
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = boat.VehicleSeat.CFrame
            NoClipInstance = Instance.new("BodyVelocity",boat)
            NoClipInstance.Name = "Fly Model"
            NoClipInstance.P = 15000
            NoClipInstance.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            NoClipInstance.Velocity = Vector3.new(0,0,0) 
            boat.VehicleSeat.CFrame = CFrame.new(boat.VehicleSeat.CFrame.X,boat.VehicleSeat.CFrame.Y+250,boat.VehicleSeat.CFrame.Z)
        end
        function getAnyMob()
            Mobs = game.workspace.Enemies:GetChildren()
            if #Mobs <= 0 then 
                return 
            else
                for i,v in pairs(Mobs) do 
                    if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then 
                        return V 
                    end
                end
            end
        end      
        task.spawn(function()
            game.workspace.Enemies.ChildAdded:Connect(function(v)
                repeat task.wait() until v:FindFirstChild("HumanoidRootPart") 
                wait(2)
                CastleCFrame = CFrame.new(-5543.5327148438, 313.80062866211, -2964.2585449219)
                if GetDistance(v.HumanoidRootPart,CastleCFrame) < 1500 and not IsBoss(v.Name) then 
                    PirateCheck = Instance.new("IntValue",v)
                    PirateCheck.Name = "Pirate Spawned Tick"
                    PirateCheck.Value = tick()
                end
            end)
        end)
        function CheckPirateRaid() 
            for i,v in pairs(game.workspace.Enemies:GetChildren()) do 
                if v:FindFirstChild("Pirate Spawned Tick") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then 
                    v5 = v:FindFirstChild("Pirate Spawned Tick")
                    if tick()-v5.Value >= 300 then 
                        v.Humanoid.Health = 0 
                    end
                    return v 
                end
            end
        end
        function CheckNamePedestal()
            local good = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good").Good
            local evil = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good").Evil
            local a
            if good == 4 and evil == 3 then
                a = "Pedestal2"
            elseif good == 3 and evil == 4 then
                a = "Pedestal1"
            end
            return a
        end
        function CheckQuestCDK() 
            if not Sea3 then return "None" end
            if getgenv().CDK_Owned then return; end 
            if not CheckTool("Tushita") or not CheckTool("Yama") or CheckTool("Cursed Dual Katana") then 
                if CheckTool("Cursed Dual Katana") then 
                    getgenv().CDK_Owned = true 
                end  
                return;
            end
            local CDK_LevelQuest = {
                Good = 666,
                Evil = 666
            }
            Check,CheckValue = pcall(function()
                for i,v in pairs(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")) do 
                    CDK_LevelQuest[i] = v 
                end
            end)
            if CDK_LevelQuest.Good == -2 or CDK_LevelQuest.Good == 4 then 
                getgenv().CDK_Yama = true 
            end   
            task.spawn(function()
                if not getgenv().CDK_Yama then 
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
                else
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                end
            end)
            if CheckNamePedestal() then
                return "Pedestal"
            end  
            if CDK_LevelQuest.Evil == 4 and CDK_LevelQuest.Good == 4 then
                return "Kill Final Boss"
            end  
            if CDK_LevelQuest.Good ~= -2 then 
                if GetDistance(game:GetService("Workspace")["_WorldOrigin"].Locations["Heavenly Dimension"]) < 2000 then 
                    return "Tushita Dimension"
                end
                if CDK_LevelQuest.Good == -3 or CDK_LevelQuest.Good == -4 then 
                    return "Easy Quest Tushita "..tostring(CDK_LevelQuest.Good)
                end 
                if CDK_LevelQuest.Good == -5 and (CheckBoss("Cake Queen") or Config["HopOption"]) then 
                    return "Cake Queen"
                end
            else 
                if GetDistance(game:GetService("Workspace")["_WorldOrigin"].Locations["Hell Dimension"]) <= 2000 then 
                    return "Yama Dimension"
                end
                if CDK_LevelQuest.Evil == -3 or CDK_LevelQuest.Evil == -4 then 
                    return "Easy Quest Yama "..tostring(CDK_LevelQuest.Evil)
                end  
                local v316, v317, v318, v319 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Check")
                if (v318 and v318 > 0) or (CheckBoss("Soul Reaper [Lv. 2100] [Raid Boss]") or CheckTool("Hallow Essence")) then 
                    return "Soul Reaper"
                end
            end
            return "None"
        end 
        function AutoCDK()
            QQ = CheckQuestCDK()
            if QQ ~= "None" then  
                if QQ == "Final Boss" then  
                    repeat task.wait()
                        if GetDistance(game:GetService("Workspace").Map.Turtle.Cursed.Pedestal3) > 10 and game:GetService("Workspace").Map.Turtle.Cursed.PlacedGem.Transparency ~= 0 then
                            Tweento(game:GetService("Workspace").Map.Turtle.Cursed.Pedestal3.CFrame * CFrame.new(0, 0, -2)) 
                        end 
                        if game:GetService("Workspace").Map.Turtle.Cursed.PlacedGem.Transparency == 0 then 
                            if not CheckBoss("Cursed Skeleton Boss [Lv. 2025] [Boss]") then
                                Tweento(CFrame.new(-12341.66796875, 603.3455810546875, -6550.6064453125))
                            else
                                KillMobNotInWorkSpace(CheckBoss("Cursed Skeleton Boss [Lv. 2025] [Boss]"))
                            end
                        else 
                            if GetDistance(game:GetService("Workspace").Map.Turtle.Cursed.Pedestal3) < 10 then 
                                fireproximityprompt(game:GetService("Workspace").Map.Turtle.Cursed.Pedestal3.ProximityPrompt) 
                                wait(5)
                            end
                        end 
                    until not Config["Auto CDK"] or CheckItem("Cursed Dual Katana")
                    return
                end
                SelectWeapon_Dropdown:Set("Sword")
                if QQ == "Soul Repear" or string.find(QQ,"Yama") then
                    Do_CDK_Yama(QQ)
                else
                    Do_CDK_Tushita(QQ)
                end
            end 
        end
        function CheckTorch(DimensionName) 
            DimensionName = DimensionName == "Yama" and "HellDimension" or "HeavenlyDimension" 
            print("Dimension:",DimensionName)
            if game.workspace.Map:FindFirstChild(DimensionName) then 
                v3 = game.workspace.Map:FindFirstChild(DimensionName) 
                for i, v in pairs(v3) do
                    if string.find(v.Name, "Torch") then
                        if v.ProximityPrompt.Enabled == true then
                            return v
                        end
                    end
                end
            end
        end  
        function CheckEspHaze()
            local xx
            for i, v in next, game.workspace.Enemies:GetChildren() do
                if
                    v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("HazeESP") and
                        v:FindFirstChild("Humanoid") and
                        v.Humanoid.Health > 0
                 then
                    xx = v
                end
            end
            for i, v in next, game.workspace.Enemies:GetChildren() do
                if
                    RemoveLevelTitle(v.Name) == CheckNearestMobSpawnHaze() and v:IsA("Model") and
                        v:FindFirstChild("HumanoidRootPart") and --and v:FindFirstChild("HazeESP")
                        v:FindFirstChild("Humanoid") and
                        v.Humanoid.Health > 0
                 then
                    xx = v
                end
            end
            return xx
        end
        function CheckNearestMobSpawnHaze()
            allhaze = {}
            for i, v in next, game:GetService("Players").LocalPlayer.QuestHaze:GetChildren() do
                if v.Value > 0 then
                    table.insert(allhaze, RemoveLevelTitle(v.Name))
                end
            end
            nameg = ""
            distancemss = math.huge
            for i, v in pairs(allhaze) do
                if GetMobSpawn(v) then
                    if GetDistance(GetMobSpawn(v)) < distancemss then
                        distancemss = GetDistance(GetMobSpawn(v))
                    end
                end
            end
            for i, v in pairs(allhaze) do
                if GetMobSpawn(v) then
                    if GetDistance(GetMobSpawn(v)) <= distancemss then
                        nameg = v
                    end
                end
            end
            return nameg
        end
        function GetMobHazeLeft()
            oasg = 0
            pcall(
                function()
                    for i, v in pairs(game:GetService("Players").LocalPlayer.QuestHaze:GetChildren()) do
                        if v.Value > 0 then
                            oasg = oasg + v.Value
                        end
                    end
                end
            )
            return oasg
        end
        function CheckMobHaki(mb)
            if mb:FindFirstChild("Humanoid") then
                for i, v in pairs(mb:WaitForChild("Humanoid"):GetChildren()) do
                    if string.find(v.Name, "Buso") then
                        return v
                    end
                end
            end
        end
        function anyMobHaki(ghj)
            for i, v in pairs(game.workspace.Enemies:GetChildren()) do
                if CheckMobHaki(v) then
                    return v
                end
            end
            if ghj then
                for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
                    if CheckMobHaki(v) then
                        return v
                    end
                end
            end
        end
        function Do_CDK_Yama(st)
            if st == "None" then return end 
            print("Do_CDK_Yama:",st)
            if st == "Yama Dimension" then 
                repeat task.wait()
                    if game:GetService("Workspace").Map.HellDimension.Exit.BrickColor == BrickColor.new("Olivine") then 
                        CancelTween()
                        Tweento(game:GetService("Workspace").Map.HellDimension.Exit.CFrame)
                        wait(2) 
                    else
                        if getAnyMob() then
                            CurrentCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
                            repeat task.wait()
                                Tweento(CurrentCFrame * CFrame.new(0,225,0))
                            until not getAnyMob()
                            Tweento(CurrentCFrame)
                        else
                            if CheckTorch("Yama") then 
                                Torch = CheckTorch("Yama")
                                Tweento(Torch.CFrame)  
                                wait(.5)
                                fireproximityprompt(Torch.ProximityPrompt)
                            end
                        end
                    end
                until not Config["Auto CDK"] or GetDistance(game:GetService("Workspace")["_WorldOrigin"].Locations["Hell Dimension"]) > 2000  
            elseif st == "Easy Quest Yama -3" then 
                MobHaki = anyMobHaki(true) 
                repeat
                    wait()
                    Tweento(MobHaki.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
                until not Config["Auto CDK"] or not MobHaki or not MobHaki.Parent or
                    game.Players.LocalPlayer.Character.Humanoid.Health <= 0 
            elseif st == "Easy Quest Yama -4" then  
                repeat task.wait()
                    HazeMob = CheckEspHaze()
                    if HazeMob then 
                        KillMob(HazeMob)
                    else
                        NewHazeMob = CheckNearestMobSpawnHaze()
                        if not CheckEspHaze() then 
                            Tweento(GetMobSpawn(NewHazeMob).CFrame * CFrame.new(0, 15, 0)) 
                        end
                    end
                until not CheckNearestMobSpawnHaze() or not Config["Auto CDK"]
                CancelTween() 
                if GetMobHazeLeft() <= 0 then
                    Rejoin()
                end
            elseif st == "Soul Reaper" then 
                if not CheckBoss("Soul Reaper [Lv. 2100] [Raid Boss]") then
                    local v316, v317, v318, v319 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Check")
                    if v318 and v318 > 0 then  
                        CanRollTime = 0
                        for i = 1,v318,1 do 
                            if v316 > v318 * 50 then 
                                CanRollTime = CanRollTime+1 
                            end
                        end
                        for i = 1,CanRollTime,1 do 
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                        end
                        KillMob(BoneMobs,true)  
                    elseif v316 < 500 then 
                        KillMob(BoneMobs,true)  
                    end
                else
                    Target = CheckBoss("Soul Reaper [Lv. 2100] [Raid Boss]")
                    if Target then
                        pcall(
                            function()
                                repeat
                                    pcall(
                                        function()
                                            Tweento(Target.HumanoidRootPart.CFrame * CFrame.new(0, 2, -0.5))
                                        end
                                    )
                                    task.wait(0.1)
                                until not Config["Auto CDK"] or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or
                                    GetDistance(game:GetService("Workspace")["_WorldOrigin"].Locations["Hell Dimension"]) <
                                        2000
                                wait(3)
                            end
                        )
                    end
                end
            end
        end
        function Do_CDK_Tushita(st) 
            if st == "None" then return end
            print("Do_CDK_Tushita:",st) 
            if st == "Tushita Dimension" then 
                repeat task.wait()
                    if game:GetService("Workspace").Map.HeavenlyDimension.Exit.BrickColor == BrickColor.new("Cloudy grey") then 
                        CancelTween()
                        Tweento(game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame)
                        wait(2) 
                    else
                        if getAnyMob() then
                            CurrentCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
                            repeat task.wait()
                                Tweento(CurrentCFrame * CFrame.new(0,225,0))
                            until not getAnyMob()
                            Tweento(CurrentCFrame)
                        else
                            if CheckTorch("Tushita") then 
                                Torch = CheckTorch("Tushita")
                                Tweento(Torch.CFrame)  
                                wait(.5)
                                fireproximityprompt(Torch.ProximityPrompt)
                            end
                        end
                    end
                until not Config["Auto CDK"] or GetDistance(game:GetService("Workspace")["_WorldOrigin"].Locations["Heavenly Dimension"]) > 2000  
            elseif st == "Cake Queen" then 
                if CheckBoss("Cake Queen") then 
                    KillMobNotInWorkSpace("Cake Queen") 
                else
                    HopServer(10,true)
                end 
            elseif st == "Easy Quest Tushita -4" then 
                if CheckPirateRaid() then 
                    KillMobNotInWorkSpace(CheckPirateRaid())
                end
            elseif st == "Easy Quest Tushita -3" then 
                for v50, v51 in pairs(getnilinstances()) do
                    if v51.Name:match("Luxury Boat Dealer") then
                        plr.Character.HumanoidRootPart.CFrame = v51.HumanoidRootPart.CFrame
                        local args = {
                            [1] = "CDKQuest",
                            [2] = "BoatQuest",
                            [3] = workspace.NPCs:FindFirstChild("Luxury Boat Dealer")
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                end
            end
        end
        function Dovmmv(f)
            for i, v in pairs(f:GetChildren()) do
                if v.Name == "Default" then
                    if Sea3 then
                        v.Name = "Port town"
                    elseif Sea2 then
                        v.Name = "Port"
                    elseif Sea1 then
                        v.Name = "Marine begin"
                    end
                elseif v.Name == "Loaf" then
                    v.Name = "Cake Prince"
                elseif v.Name == "Hydra3" then
                    v.Name = "Arena"
                elseif v.Name == "Hydra2" then
                    v.Name = "Hydra Port"
                elseif v.Name == "Hydra1" then
                    v.Name = "Hydra Island"
                elseif v.Name == "SeaCastle" then
                    v.Name = "Castle On The Sea"
                elseif v.Name == "BigMansion" then
                    v.Name = "Mansion"
                elseif v.Name == "CandyCane" then
                    v.Name = "Candy Cane"
                elseif v.Name == "HauntedCastle" then
                    v.Name = "Haunted Caslte"
                elseif v.Name == "PineappleTown" then
                    v.Name = "Pineapple Town"
                elseif v.Name == "GreatTree" then
                    v.Name = "Great Tree"
                elseif v.Name == "Chocolate" then
                    v.Name = "Chocolate Island"
                elseif v.Name == "Bar" then
                    v.Name = "Café"
                end
            end
        end 
        pricemelee = {
            ["Black Leg"] = {Beli = 150000, Fragment = 0},
            ["Fishman Karate"] = {Beli = 750000, Fragment = 0},
            ["Electro"] = {Beli = 500000, Fragment = 0},
            ["Dragon Claw"] = {Beli = 0, Fragment = 1500},
            ["Superhuman"] = {Beli = 3000000, Fragment = 0},
            ["Sharkman Karate"] = {Beli = 2500000, Fragment = 5000},
            ["Death Step"] = {Beli = 2500000, Fragment = 5000},
            ["Dragon Talon"] = {Beli = 3000000, Fragment = 5000},
            ["Godhuman"] = {Beli = 5000000, Fragment = 5000},
            ["Electric Claw"] = {Beli = 3000000, Fragment = 5000},
            ["Sanguine Art"] = {Beli = 5000000, Fragment = 5000},
        }
        browhat = {
            ["Black Leg"] = "BuyBlackLeg",
            ["Fishman Karate"] = "BuyFishmanKarate",
            ["Electro"] = "BuyElectro",
            ["Dragon Claw"] = function()
                dragonclawtrue = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1") == 1
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
                return dragonclawtrue
            end,
            ["Superhuman"] = "BuySuperhuman",
            ["Sharkman Karate"] = "BuySharkmanKarate",
            ["Death Step"] = "BuyDeathStep",
            ["Dragon Talon"] = "BuyDragonTalon",
            ["Godhuman"] = "BuyGodhuman",
            ["Electric Claw"] = "BuyElectricClaw",
            ["Sanguine Art"] = "BuySanguineArt"
        } 
        MeleeInGame = {}
        for i,v in pairs(browhat) do 
            table.insert(MeleeInGame,i)
        end
        table.sort(MeleeInGame)
        function BuyMelee(vcc, oh)
            if CheckTool(vcc) then
                return
            end
            TickBuyMelee = tick()
            momo = browhat[vcc]
            UnequipWeapon()
            if type(momo) == "string" then
                UnequipWeapon() 
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer(momo, false)
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer(momo)
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer(momo, true)
            else
                pcall(
                    function()
                        UnequipWeapon()
                        momo = momo()
                    end
                )
            end
            if oh and LocalPlayerBeliValue and LocalPlayerFragmentValue and not CheckTool(v) then
                MMBStatus = "Bought Melee: " .. tostring(vcc)
                v = vcc
                if
                    pricemelee[v] and pricemelee[v].Beli and pricemelee[v].Beli <= LocalPlayerBeliValue and
                        pricemelee[v].Fragment and
                        pricemelee[v].Fragment <= LocalPlayerFragmentValue
                 then
                    momo = browhat[v]
                    if type(momo) == "string" then
                        UnequipWeapon()
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer(momo, false)
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer(momo)
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer(momo, true)
                    elseif type(momo) == "function" then
                        UnequipWeapon()
                        momo()
                    end
                end
            end
            wait(1)
        end
        function LoadIslandName()
            PS = game:GetService("Workspace")["_WorldOrigin"]:WaitForChild("PlayerSpawns")
            PS_P = PS:WaitForChild("Pirates")
            PS_M = PS:WaitForChild("Marines")
            Dovmmv(PS_P)
            Dovmmv(PS_M)
        end
        spawn(
            function()
                LoadIslandName()
            end
        ) 
        Raids = require(game:GetService("ReplicatedStorage").Raids).raids
        AdvancedRaids = require(game:GetService("ReplicatedStorage").Raids).advancedRaids
        RealRaid = {}
        for i, v in pairs(Raids) do 
            if v ~= " " and v ~= "" then 
                table.insert(RealRaid, v) 
            end
        end
        for i, v in pairs(AdvancedRaids) do
            if v ~= " " and v ~= "" then 
                table.insert(RealRaid, v) 
            end
        end
        function RandomFruit() 
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Cousin", "Buy")
        end    
        function LoadFruit(fruitname)
            return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", fruitname)
        end
        FruitAbove1M = {}
        FruitBelow1M = {}
        FruitsShop = {}
        for i, v in next, game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
            "GetFruits",
            game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop:GetAttribute("Shop2")
        ) do
            if v.Price >= 1000000 then
                table.insert(FruitAbove1M, v.Name) 
            elseif v.Price < 1000000 then 
                table.insert(FruitBelow1M, v.Name) 
            end
            table.insert(FruitsShop,v.Name)
        end 
        function getRealFruitName(v)
            newname = tostring(v.Name):gsub("Fruit", "")
            newname4 = newname:gsub(" ", "")
            newname2 = newname4 .. "-" .. newname4
            return newname2
        end 
        function GetFruitInInventory(tren1m) 
            if tren1m == nil then 
                for i, v in next, game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory") do
                    if v.Type == "Blox Fruit" then
                        return v.Name
                    end
                end  
            else
                PriceNeeded = tren1m and 1000000 or 0
                for i, v in next, game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory") do
                    if v.Type == "Blox Fruit" then
                        if v["Price"] >= PriceNeeded then
                            return v.Name
                        end
                    end
                end
            end
        end
        function GetFruitInCharacter(tren1m)
            if tren1m == nil then  
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if string.find(v.Name, "Fruit")  then
                        return v
                    end
                end
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        return v
                    end
                end 
            else
                TableIn = tren1m and FruitAbout1M or FruitBelow1M 
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if string.find(v.Name, "Fruit") and table.find(TableIn,getRealFruitName(v.Name))  then
                        return v
                    end
                end
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if string.find(v.Name, "Fruit") and table.find(TableIn,getRealFruitName(v.Name))  then
                        return v
                    end
                end
            end 
        end 
        function GetFruit1MtoRaid()
            if GetFruitInCharacter() then 
                return
            end 
            if GetFruitInInventory(false) then 
                return LoadFruit(GetFruitInInventory(false)) 
            end
        end  
        function RemoveStoreNotifcation()
            for i, v in pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetDescendants()) do
                if v:IsA("TextLabel") then
                    if string.find(v.Text, "only store") then
                        v:Destroy()
                    end
                end
            end
        end  
        function IsStored(name) 
            for i, v in next, game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory") do
                if v["Name"] == name then 
                    return v 
                end
            end
        end
        function GetFruitInWorkSpace(ConfigF) 
            valuefruitreq = ConfigF["ValueReq"] or false
            ignorestoredfruit = ConfigF["Ignore"] or false
            isstored = function(v)
                if not ignorestoredfruit then return true end 
                if IsStored(v) then return false end
            end 
            if not valuefruitreq then
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") and game.Workspace:FindFirstChild(v.Name) and isstored(v) then
                        return v
                    end
                end
            else
                fruitrq = {}
                for i, v in next, game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                    "GetFruits",
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop:GetAttribute("Shop2")
                ) do
                    if v.Price >= valuefruitreq then
                        table.insert(fruitrq, v.Name)
                    end
                end
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") and game.Workspace:FindFirstChild(v.Name) then
                        newname = tostring(v.Name):gsub("Fruit", "")
                        newname4 = newname:gsub(" ", "")
                        newname2 = newname4 .. "-" .. newname4
                        if table.find(fruitrq, newname2) then
                            return v
                        end
                    end
                end
            end
            return nil
        end
        function StoreDFInPath(path)
            for i, v in pairs(path:GetChildren()) do
                if string.find(v.Name, "Fruit") and not v:FindFirstChild("Coone") and not v:FindFirstChild("Raid Client") then
                    local Ignored = Instance.new("IntValue", v)
                    Ignored.Name = "Coone"
                    if v.Name == "Human: Buddha Fruit" then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "StoreFruit",
                            "Human-Human: Buddha",
                            path:FindFirstChild("Human: Buddha Fruit")
                        )
                    elseif v.Name == "Bird: Phoenix Fruit" then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "StoreFruit",
                            "Bird-Bird: Phoenix",
                            path:FindFirstChild("Bird: Phoenix Fruit")
                        )
                    elseif v.Name == "Bird: Falcon Fruit" then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "StoreFruit",
                            "Bird-Bird: Falcon",
                            path:FindFirstChild("Bird: Falcon Fruit")
                        )
                    else
                        local test = string.gsub(v.Name, " Fruit", "")
                        if
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "StoreFruit",
                                string.gsub(v.Name, " Fruit", "-" .. test),
                                path:FindFirstChild(v.Name)
                            )
                         then
                            if Config["WebhookStoreFruit"] then
                                PostWebhook(Config["WebhookUrl"], GetMSGFruitStored(test))
                            end
                        end
                    end
                end
            end
        end
        function CheckMaterialCount(mt)
            for k, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
                if v["Name"] == mt then
                    return v["Count"]
                end
            end
            return 0
        end
        function SailBoat() 
            removeFog() 
            UpdateTPCFrame()
            if not GetLocalBoat() then 
                repeat 
                    task.wait()
                    Tweento(CFrame.new(-16208.3945, 9.06366062, 404.428528, -0.0355736837, 8.33082723e-08, -0.999367058, -6.39925517e-08, 1, 8.56389306e-08, 0.999367058, 6.69985383e-08, -0.0355736837))
                    if GetDistance(CFrame.new(-16208.3945, 9.06366062, 404.428528, -0.0355736837, 8.33082723e-08, -0.999367058, -6.39925517e-08, 1, 8.56389306e-08, 0.999367058, 6.69985383e-08, -0.0355736837)) < 8 then 
                        local args = {
                            [1] = "BuyBoat",
                            [2] = "Guardian"
                        }
                        
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                until GetLocalBoat()
            end
            BCFrame = CFrame.new(-43181.7969, 0.105383828, 14132.5957, 0.024771018, -1.42444829e-08, 0.999693155, 3.35462111e-08, 1, 1.34176261e-08, -0.999693155, 3.32035484e-08, 0.024771018)
            repeat task.wait() until GetLocalBoat() 
            if game.Players.LocalPlayer.Character.Humanoid.Sit then 
                if GetDistance(BCFrame,GetLocalBoat().VehicleSeat) > 100 then 
                    ForBoat = {}
                    for i,v in pairs(GetLocalBoat():GetDescendants()) do 
                        pcall(function()
                            v.CanCollide = false 
                            table.insert(ForBoat,v)
                        end)
                    end 
                    repeat task.wait()
                        TweenObject(BCFrame,GetLocalBoat().VehicleSeat)
                        getgenv().ForgotSit = true
                        DoNoClip(true) 
                        task.wait()
                    until GetDistance(BCFrame,GetLocalBoat().VehicleSeat) < 100 or not game.Players.LocalPlayer.Character.Humanoid.Sit or GetDistance(GetLocalBoat().VehicleSeat) > 100
                    getgenv().ForgotSit = false 
                    DoNoClip(false) 
                else 
                    getgenv().ForgotSit = false 
                    if ForBoat then 
                        for i,v in pairs(ForBoat) do 
                            v.CanCollide = false 
                        end 
                    end
                end
            else
                getgenv().ForgotSit = true
                Tweento(GetLocalBoat().VehicleSeat.CFrame)
            end
        end
        function GetNMob()
            NMob = {
                "Piranha",
                "Terrorshark",
                "Shark",
                "Fish Crew Member"
            }
            for i,v in pairs(game.workspace.Enemies:GetChildren()) do 
                if table.find(NMob,RemoveLevelTitle(v.Name)) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then 
                    return v 
                end
            end
        end
        function CheckColorHas()
            ColorsHas = {}
            for i, v in pairs(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getColors")) do
                if v["Unlocked"] then
                    ColorsHas[v.HiddenName] = v
                end
            end
            return ColorsHas
        end
        function CheckDoneColor()
            for i, v in next, game:GetService("Workspace").Map["Boat Castle"].Summoner.Circle:GetChildren() do
                if v:IsA("Part") and v:FindFirstChild("Part") and v.Part.BrickColor.Name == "Dark stone grey" then
                    return false
                end
            end
            return true
        end    
        function CheckColorRipIndra()
            conchodonand = {}
            for i, v in next, game:GetService("Workspace").Map["Boat Castle"].Summoner.Circle:GetChildren() do
                if v:IsA("Part") and v:FindFirstChild("Part") and v.Part.BrickColor.Name == "Dark stone grey" then
                    conchodonand[v.BrickColor.Name] = v
                end
            end
            return conchodonand
        end  
        function ActivateColor(ColorName)
            concho = {
                ["Hot pink"] = "Winter Sky",
                ["Really red"] = "Pure Red",
                ["Oyster"] = "Snow White"
            }
            conchogg = concho[ColorName]
            if not CheckColorHas()[conchogg] then
                return "Cant"
            end
            if conchogg then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", conchogg)
            end
        end
        function AutoActiveColorRip_Indra()
            for i, v in pairs(CheckColorRipIndra()) do
                kss = ActivateColor(i)
                if kss ~= "Cant" then
                    Tweento(v.CFrame)
                    wait(3)
                    firetouchinterest(v.Part, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                    firetouchinterest(v.Part, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                end
            end
        end
        function CheckTool(toolnam)
            lol = {
                game.Players.LocalPlayer.Character,
                game.Players.LocalPlayer.Backpack
            }
            for i, v in pairs(lol) do
                if v:FindFirstChild(toolnam) then
                    return v:FindFirstChild(toolnam)
                end
            end
        end
        function CheckRareItem()
            p = CheckTool("God's Chalice") or CheckTool("Sweet Chalice")
            return p 
        end  
        function GetPlayerKillTrial()
            local Chrs
            pcall(
                function()
                    TempleCFrame =
                        CFrame.new(
                        28730.0645,
                        14887.5371,
                        -91.0957718,
                        0.557085216,
                        -4.57713725e-08,
                        0.830455363,
                        9.81919115e-08,
                        1,
                        -1.07530047e-08,
                        -0.830455363,
                        8.75343389e-08,
                        0.557085216
                    )
                    if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible then
                        if GetDistance(TempleCFrame) <= 380 then
                            for i, v in pairs(game.Players:GetChildren()) do
                                if
                                    v.Name ~= game.Players.LocalPlayer.Name and
                                        (GetDistance(TempleCFrame, v.Character.HumanoidRootPart) <= 300) and
                                        v.Character.Humanoid.Health > 0
                                 then
                                    Chrs = v
                                end
                            end
                        end
                    end
                end
            )
            return Chrs
        end  
        function CheckTorchTushita()
            local a
            if not game:GetService("Workspace").Map.Turtle.QuestTorches.Torch1.Particles.Main.Enabled then
                a = "1"
            elseif not game:GetService("Workspace").Map.Turtle.QuestTorches.Torch2.Particles.Main.Enabled then
                a = "2"
            elseif not game:GetService("Workspace").Map.Turtle.QuestTorches.Torch3.Particles.Main.Enabled then
                a = "3"
            elseif not game:GetService("Workspace").Map.Turtle.QuestTorches.Torch4.Particles.Main.Enabled then
                a = "4"
            elseif not game:GetService("Workspace").Map.Turtle.QuestTorches.Torch5.Particles.Main.Enabled then
                a = "5"
            end
            for i, v in next, game:GetService("Workspace").Map.Turtle.QuestTorches:GetChildren() do
                if v:IsA("MeshPart") and string.find(v.Name, a) and not v.Particles.Main.Enabled then
                    return v
                end
            end
        end 
        function BuyGear()
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
        end
        function GetPing()
            ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
            ping = ping:gsub("CV", "")
            ping = ping:gsub("%%d", "")
            ping = ping:gsub(" ", "")
            ping = ping:gsub("(%d%)", "")
            ping = ping:split("(")[1]
            return tonumber(ping)
        end
        function TPServer(JobIdorstring)
            if string.find(JobIdorstring, "TeleportService") then
                deptrai, tao =
                    pcall(
                    function()
                        loadstring(JobIdorstring)()
                    end
                )
                if deptrai then
                    return "Success | Teleporting..."
                else
                    return tao
                end
            else
                game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", tostring(JobIdorstring))
                return "Trying to teleport..."
            end
        end
        function KillAura()
            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do 
                pcall(function()
                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    v.Humanoid.Health = 0
                end)
            end
        end
        function GetSeaBeastTrial()
            if not game.Workspace.Map:FindFirstChild("FishmanTrial") then
                autospamskill = nil
                return nil
            end
            if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Water") then
                FishmanTrial = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Water")
            end
            if FishmanTrial and GetDistance(FishmanTrial) < 2000 then
                for i, v in next, game:GetService("Workspace").SeaBeasts:GetChildren() do
                    if
                        string.find(v.Name, "SeaBeast") and v:FindFirstChild("HumanoidRootPart") and
                            (v.HumanoidRootPart.Position - FishmanTrial.Position).Magnitude <= 1500
                     then
                        if v.Health.Value > 0 then
                            return v
                        end
                    end
                end
            end
        end
        function GetMirageChest()
            if not game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                return
            end
            MirageChest = {}
            for i, v in pairs(game:GetService("Workspace").Map.MysticIsland.Chests:GetChildren()) do
                if v.CanCollide then
                    table.insert(MirageChest, v.CFrame)
                end
            end
            if #MirageChest > 0 then
                return MirageChest
            end
        end
        function ReloadChestFunction()
            local ChestTable = {}
            if Config["Auto Chest Mirage"] and GetMirageChest() then
                return GetMirageChest()
            end
            if
                not game.Workspace:FindFirstChild("Chest1") and not game.Workspace:FindFirstChild("Chest2") and
                    game.Workspace:FindFirstChild("Chest3")
             then
                for i, v in pairs(game.Workspace:GetDescendants()) do
                    if string.find(v.Name, "Chest") and (v:IsA("Part") or v:IsA("BasePart")) then --and GetDistance(v) <= 5000 then
                        table.insert(ChestTable, v.CFrame)
                    end
                end
            else
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "Chest") and (v:IsA("Part") or v:IsA("BasePart")) then --and GetDistance(v) <= 5000 then
                        table.insert(ChestTable, v.CFrame)
                    end
                end
            end
            return ChestTable
        end
        function GetNearestChest()
            ChestTable = ReloadChestFunction()
            ClosetDistance = math.huge
            if #ChestTable > 0 then
                for i, v in pairs(ChestTable) do
                    if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < ClosetDistance then
                        ClosetDistance = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    end
                end
                for i, v in pairs(ChestTable) do
                    if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= ClosetDistance then
                        return v
                    end
                end
            end
        end 
        function GetALLNPC()
            AllNPCS = {} 
            for i, v in pairs(getnilinstances()) do
                if
                    v:IsA("Model") and v:FindFirstChild("Head") and v.Head:FindFirstChild("QuestBBG") and
                        v.Head.QuestBBG.Title.Text == "MISC."
                 then
                    AllNPCS[v.Name] = v.Head.CFrame * CFrame.new(0, -2, 2)
                end
            end
            for i, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                AllNPCS[v.Name] = v.Head.CFrame * CFrame.new(0, -2, 2)
            end
            return AllNPCS
        end
        CountChest = 0
        function GetPlayerLevelList(blacklists)
            memayto = {}
            for i, v in pairs(game.Players:GetChildren()) do
                pcall(
                    function()
                        if
                            v.Name ~= game.Players.LocalPlayer.Name and v:FindFirstChild("Data") and v.Data.Level and
                                (blacklists and not blacklists[v.Name]) and
                                v.Character and
                                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                    v.Character.HumanoidRootPart.Position).Magnitude <= 15000
                         then
                            memayto[v.Name] = v.Data.Level.Value
                        end
                    end
                )
            end
            return memayto
        end
        cc2 = {}
        function getLowestLevelPlayer()
            if TargetedPlayer then
                return TargetedPlayer
            end
            cc = GetPlayerLevelList(cc2)
            min = 2450
            for i, v in pairs(cc) do
                if v < min then
                    min = v
                end
            end
            for i, v in pairs(cc) do
                if v <= min then
                    return i
                end
            end
        end
        function CheckCantAttackPlayer(v)
            for i, k in pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetDescendants()) do
                if k:IsA("TextLabel") then
                    if string.find(k.Text, "attack") and not k:FindFirstChild(v.Name) then
                        local BV = Instance.new("TextBox")
                        BV.Parent = k.Parent
                        BV.Name = v.Name
                        k:Destroy()
                        return true
                    end
                end
            end
        end   
        local Nigga 
        task.spawn(function()
            while task.wait() do 
                if Sea2 then 
                    Nigga = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
                    task.wait(1)
                end
            end
        end)  
        function CheckUpgradeRace()
            if not LocalPlayerLevelValue or not LocalPlayerBeliValue then
                return nil
            end
            if Sea2 then
                if string.find(CheckRace(), "V4") or string.find(CheckRace(), "V3") then
                    return "Has V3/V4"
                end
                if Nigga ~= 3 then
                    return "Bartilo " ..
                        tostring(
                            Nigga
                        )
                elseif Nigga == 3 then
                    if string.find(CheckRace(), "V1") then
                        return "Up V2"
                    elseif
                        LocalPlayerLevelValue >= 1000 and LocalPlayerBeliValue >= 2000000 and string.find(CheckRace(), "V2") and
                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") ~= nil
                     then
                        return "Up V3"
                    end
                end
            end 
        end 
        function CheckQuestBartilo()
            if not BartiloQuestdk then
                BartiloQuestdk = Nigga == 3
            end
            if BartiloQuestdk then
                return
            end
            if Nigga == 0 then
                return true
            elseif
            Nigga == 1 and
                    (CheckBoss("Jeremy [Lv. 850] [Boss]") or Config["Hop Boss"])
             then
                if CheckBoss("Jeremy [Lv. 850] [Boss]") then
                    return true
                elseif Config["Hop Boss"] then
                    HopServer()
                    return true
                end
            elseif Nigga == 2 then
                return true
            end
        end
        function TweenTempleLegit(fk)
            TweenTemple()
            AllNPCS = getnilinstances()
            for i, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                table.insert(AllNPCS, v)
            end
            for i, v in pairs(AllNPCS) do
                if v.Name == "Mysterious Force" then
                    TempleMysteriousNPC1 = v
                end
                if v.Name == "Mysterious Force3" then
                    TempleMysteriousNPC2 = v
                end
            end
            Tweento(TempleMysteriousNPC2.HumanoidRootPart.CFrame)
            wait(0.5)
            if
                (TempleMysteriousNPC2.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                    15
             then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "TeleportBack")
            end
            --if not fk then
            if
                (TempleMysteriousNPC1.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                    15
             then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Teleport")
            end
            --end
        end
        function IsMirageIsland()
            if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                return true
            else
                return false
            end
        end
        function CheckItem(itemcc)
            for k, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
                if v.Name == itemcc then
                    return v
                end
            end
        end
        function GetNPC(npc)
            AllNPCS = getnilinstances()
            for i, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                table.insert(AllNPCS, v)
            end
            for i, v in pairs(AllNPCS) do
                if v.Name == npc then
                    return v
                end
            end
        end
        function TweenMirage()
            repeat
                wait()
            until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
            if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                AllNPCS = getnilinstances()
                for i, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                    table.insert(AllNPCS, v)
                end
                for i, v in pairs(AllNPCS) do
                    if v.Name == "Advanced Fruit Dealer" then
                        Tweento(v.HumanoidRootPart.CFrame)
                    end
                end
            end
        end
        function getBlueGear()
            if game.workspace.Map:FindFirstChild("MysticIsland") then
                for i, v in pairs(game.workspace.Map.MysticIsland:GetChildren()) do
                    if v:IsA("MeshPart") and v.MeshId == "rbxassetid://10153114969" then --and not v.CanCollide then
                        return v
                    end
                end
            end
        end    
        spawn(
            function()
                while wait() do
                    if ChoDienCanNguoi then
                        if game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                            wait(5)
                        end
                    end
                end
            end
        ) 
        spawn(
            function()
                while wait() do
                    if ChoDienCanNguoi then
                        if TargetedPlayer or getLowestLevelPlayer() then 
                            pcall(
                                function()
                                    Stats_Melee = game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value
                                end
                            )
                            pcall(
                                function()
                                    Stats_DF =
                                        game:GetService("Players").LocalPlayer.Data.Stats["Demon Fruit"].Level.Value
                                end
                            )
                            pcall(
                                function()
                                    Stats_Gun = game:GetService("Players").LocalPlayer.Data.Stats.Gun.Level.Value
                                end
                            )
                            pcall(
                                function()
                                    Stats_Sword = game:GetService("Players").LocalPlayer.Data.Stats.Sword.Level.Value
                                end
                            )
                            SETNERD = {}
                            pcall(
                                function()
                                    if Stats_Melee and Stats_Melee > 1 then
                                        SETNERD["Melee"] = true
                                    end
                                    if Stats_DF and Stats_DF > 1 then
                                        SETNERD["Devil Fruit"] = true
                                    end
                                    if Stats_Sword and Stats_Sword > 1 then
                                        SETNERD["Sword"] = true
                                    end
                                    if Stats_Gun and Stats_Gun > 1 then
                                        SETNERD["Gun"] = true
                                    end
                                end
                            )  
                            UseWeapon_Dropdown:Set(SETNERD)
                            pcall(
                                function()
                                    memay2 = game.Players[getLowestLevelPlayer()]
                                    lonmemaytofake = lonmemayto
                                    EnableBuso()
                                    lonmemayto = "Melee"
                                    EquipWeapon()
                                    if not memay2 then
                                        repeat
                                            wait()
                                            memay2 = game.Players:FindFirstChild(getLowestLelvelPlayer())
                                        until memay2
                                    end
                                    repeat
                                        TpCFrame =
                                            game.Players:FindFirstChild(getLowestLevelPlayer()).Character.HumanoidRootPart.CFrame
                                        AutoTp = true
                                        wait()
                                        Noclip = true
                                        if
                                            TpCFrame and
                                                (TpCFrame.Position -
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                    150 and
                                                not game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible
                                         then
                                            LegitAttack = true
                                            autospamskill = true
                                            AimBotSkillPosition = TpCFrame.Position
                                            AimbotDiThangNgu = true
                                        else
                                            LegitAttack = false
                                            autospamskill = nil
                                            AimbotDiThangNgu = true
                                            AimBotSkillPosition = nil
                                        end
                                    until not ChoDienCanNguoi or not getLowestLevelPlayer() or not ChoDienCanNguoi or not memay2 or
                                        not game.Workspace.Characters:FindFirstChild(getLowestLevelPlayer()) or
                                        not memay2.Character or
                                        memay2.Character.Humanoid.Health <= 0 or
                                        CheckCantAttackPlayer(memay2) or
                                        CheckSafeZone(memay2.Character) or
                                        cc2[getLowestLevelPlayer()]
                                    cc2[getLowestLevelPlayer()] = true
                                    autospamskill = false
                                    LegitAttack = false
                                    AimbotDiThangNgu = true
                                    AimBotSkillPosition = nil
                                    lonmemayto = lonmemaytofake
                                    AutoTp = false
                                    UseFastAttack = false
                                    ----print("Turn Off Fast Attack9")
                                end
                            )
                        elseif not getLowestLevelPlayer() then
                            cc2 = {}
                        end
                    end
                end
            end
        )
        function getHighestPoint()
            if not game.workspace.Map:FindFirstChild("MysticIsland") then
                return nil
            end
            for i, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
                if v:IsA("MeshPart") then
                    if v.MeshId == "rbxassetid://6745037796" then
                        return v
                    end
                end
            end
        end 
        function MoveCamtoMoon()
            workspace.CurrentCamera.CFrame =
                CFrame.new(
                workspace.CurrentCamera.CFrame.Position,
                game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position
            )
        end
        function TwenetoHighestPoint()
            HighestPoint = getHighestPoint()
            if HighestPoint then
                Tweento(HighestPoint.CFrame * CFrame.new(0, 211.88, 0))
            end
        end 
        function CheckSkillMastery()
            if not Config["TypeMasteryFarm"] then
                return
            end
            if Config["TypeMasteryFarm"] == "Devil Fruit" then
                MasteryWeapon = game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
            elseif Config["TypeMasteryFarm"] == "Gun" then
                MasteryWeapon = ""
                BackpackandCharacter = {
                    game.Players.LocalPlayer.Backpack,
                    game.Players.LocalPlayer.Character
                }
                for _, folder in pairs(BackpackandCharacter) do
                    for i, v in pairs(folder:GetChildren()) do
                        if v:IsA("Tool") and v.ToolTip == "Gun" then
                            MasteryWeapon = v.Name
                        end
                    end
                end
            end
            if MasteryWeapon and MasteryWeapon ~= "" then
                if
                    game.Players.LocalPlayer.Backpack:FindFirstChild(MasteryWeapon) or
                        game.Players.LocalPlayer.Character:FindFirstChild(MasteryWeapon)
                 then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(MasteryWeapon) then
                        for i, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[MasteryWeapon]:GetChildren(
        
                        ) do
                            if v:IsA("Frame") then
                                if
                                    Config["Use Skills"][v.Name] and v.Name ~= "Template" and
                                        v.Title.TextColor3 == Color3.new(1, 1, 1) and
                                        v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                                        v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
                                 then
                                    return MasteryWeapon, v.Name
                                end
                            end
                        end
                    else
                        EquipWeaponName(MasteryWeapon)
                    end
                end
            end
            gunlon = Config["TypeMasteryFarm"] == "Gun"
            if gunlon then
                return MasteryWeapon, nil
            end
        end   
        tableRaceDoor = {}
        for i, v in pairs(game.Workspace:GetDescendants()) do
            if string.find(v.Name, "Corridor") then
                tableRaceDoor[v.Name] = v.Door.Door.RightDoor.Union.CFrame
            end
        end
        function TweentoCurrentRaceDoor()
            a = tableRaceDoor[game.Players.LocalPlayer.Data.Race.Value .. "Corridor"]
            Tweento(a)
        end 
        function removeFog()
            local c = game.Lighting
            c.FogEnd = 100000
            for i, v in pairs(c:GetDescendants()) do
                if v:IsA("Atmosphere") then
                    v:Destroy()
                end
            end
        end 
        function createEngine(v)
            local EG 
            if not v:FindFirstChild("Engine") then 
                for i,v in pairs(v:GetChildren()) do 
                    if v:IsA("Part") or v:IsA("BasePart") then 
                        EG = v:Clone()
                        EG.Name = "Engine"
                        EG.Parent = v 
                    end
                end
            end 
            if not v:FindFirstChild("Engine") then 
                for i,v in pairs(v:GetDescendants()) do 
                    if v:IsA("Part") or v:IsA("BasePart") then 
                        EG = v:Clone()
                        EG.Name = "Engine"
                        EG.Parent = v 
                    end
                end
            end 
            return EG
        end
        function fireremotechoosegear(gearname)
            v = gearname
            if v == "Gear1" then
                local args = {
                    [1] = "TempleClock",
                    [2] = "SpendPoint"
                }
        
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                    unpack(args)
                )
            elseif v == "Gear2" then
                local args = {
                    [1] = "TempleClock",
                    [2] = "SpendPoint",
                    [3] = "Gear2",
                    [4] = "Omega"
                }
        
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                    unpack(args)
                )
            elseif v == "Gear4" then
                if condimemeaymeci.B == 2 then
                    print("Gear 4 Omega")
                    local args = {
                        [1] = "TempleClock",
                        [2] = "SpendPoint",
                        [3] = "Gear4",
                        [4] = "Omega"
                    }
        
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                        unpack(args)
                    )
                elseif condimemeaymeci.A == 2 then
                    local args = {
                        [1] = "TempleClock",
                        [2] = "SpendPoint",
                        [3] = "Gear4",
                        [4] = "Alpha"
                    }
        
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                        unpack(args)
                    )
                elseif condimemeaymeci.A < 2 then
                    v14 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check")
                    condimemeaymeci = v14.RaceDetails
                    local args = {
                        [1] = "TempleClock",
                        [2] = "SpendPoint",
                        [3] = "Gear4",
                        [4] = "Alpha"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                        unpack(args)
                    )
                end
            elseif v == "Gear3" then
                local args = {
                    [1] = "TempleClock",
                    [2] = "SpendPoint",
                    [3] = "Gear3",
                    [4] = "Alpha"
                }
        
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                    unpack(args)
                )
            elseif v == "Gear5" then
                local args = {
                    [1] = "TempleClock",
                    [2] = "SpendPoint",
                    [3] = "Gear5",
                    [4] = "Default"
                }
        
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                    unpack(args)
                )
            end
            CreateUiNotify({
                Content = "Selected Gear: "..tostring(v)
            })
        end 
        function GetOutTempleGui()
            for i, v in pairs(
                getconnections(game:GetService("Players").LocalPlayer.PlayerGui.TempleGui.Skip.TextButton.Activated)
            ) do
                v.Function()
            end
        end 
        function CanChoosePoint()
            absd, bbbs =
                pcall(
                function()
                    if
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check") and
                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check").HadPoint
                     then
                        return true
                    end
                end
            )
            if absd and bbbs then
                return true
            end
        end
        function InstantChooseGear()
            v14 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check")
            if v14 and v14.HadPoint then
                condimemeaymeci = v14.RaceDetails
                lastCF = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map["Temple of Time"].Prompt.CFrame
                if
                    (workspace.Map["Temple of Time"].Prompt.Position -
                        game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 3
                 then
                    wait()
                    fireproximityprompt(workspace.Map["Temple of Time"].Prompt.ProximityPrompt)
                    wait(.5)
                    for i, v in pairs(workspace.Map["Temple of Time"].InnerClock:GetChildren()) do
                        if v:FindFirstChild("Highlight") and v.Highlight.Enabled then
                            spawn(
                                function()
                                    fireremotechoosegear(v.Name)
                                end
                            )
                        end
                    end
                    wait(.5)
                    repeat
                        GetOutTempleGui()
                        task.wait()
                    until not game:GetService("Players").LocalPlayer.PlayerGui.TempleGui.Enabled
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = lastCF
                end
                task.wait(5)
            else
                game:GetService("StarterGui"):SetCore(
                    "SendNotification",
                    {
                        Title = "You hadnt point", -- Required
                        Text = "You hadnt point to choose", -- Required
                        Duration = 30
                    }
                )
                task.wait(5)
            end
        end 
        task.spawn(function()
            while task.wait() do 
                if AimBotSkillPosition then 
                    if not workspace:FindFirstChild("PointAimbot") then 
                        PointAimbot = Instance.new("Part",workspace)
                        PointAimbot.Name = "PointAimbot"
                        PointAimbot.Size = Vector3.new(1,1,1)
                        PointAimbot.CanCollide = false 
                    end
                    PointAimbot.Position = AimBotSkillPosition
                    if not workspace:FindFirstChild("PointAimbot"):FindFirstChild("AimbotEsp") then 
                        local BillboardGui = Instance.new("BillboardGui")
                        local TextLabel = Instance.new("TextLabel")
                        BillboardGui.Parent = PointAimbot
                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        BillboardGui.Active = true
                        BillboardGui.Name = "AimbotEsp"
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.LightInfluence = 1.000
                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                        TextLabel.Font = Enum.Font.Nunito
                        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.TextSize = 15
                        TextLabel.TextStrokeTransparency = 0
                        TextLabel.TextWrapped = false
                        TextLabel.Text = "Position"
                    end 
                    PointAimbot:FindFirstChild("AimbotEsp"):FindFirstChild("TextLabel").Text = GetDistance(CFrame.new(AimBotSkillPosition.X,AimBotSkillPosition.Y,AimBotSkillPosition.Z))
                end
            end     
        end)
        task.spawn(
            function()
                while task.wait() do
                    esp1,esp2 = pcall(
                        function()
                            if Config["ESP Player"] then
                                for i, v in pairs(game.Players:GetChildren()) do
                                    if v.Name ~= game.Players.LocalPlayer.Name then
                                        if not v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp") then
                                            local BillboardGui = Instance.new("BillboardGui")
                                            local TextLabel = Instance.new("TextLabel")
                                            BillboardGui.Parent = v.Character.HumanoidRootPart
                                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                            BillboardGui.Active = true
                                            BillboardGui.Name = "PlayersEsp"
                                            BillboardGui.AlwaysOnTop = true
                                            BillboardGui.LightInfluence = 1.000
                                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
                                            TextLabel.Parent = BillboardGui
                                            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            TextLabel.BackgroundTransparency = 1.000
                                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                                            TextLabel.Font = Enum.Font.Nunito
                                            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                            TextLabel.TextSize = 15
                                            TextLabel.TextStrokeTransparency = 0
                                            TextLabel.TextWrapped = false
                                        end
                                        local Dis =
                                            math.floor(
                                            (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                                v.Character.HumanoidRootPart.Position).Magnitude / 10
                                        )
                                        v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp").TextLabel.Text =
                                            v.Name ..
                                            "\n" ..
                                                "[" ..
                                                    Dis ..
                                                        "]" ..
                                                            " [" ..
                                                                math.floor(v.Character.Humanoid.Health) ..
                                                                    "/" ..
                                                                        v.Character.Humanoid.MaxHealth ..
                                                                            "] [" .. tostring(v.Team) .. "]"
                                        if v.Team == game.Players.LocalPlayer.Team then
                                            v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp").TextLabel.TextStrokeColor3 =
                                                Color3.fromRGB(0, 181, 30)
                                        else
                                            v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp").TextLabel.TextStrokeColor3 =
                                                Color3.fromRGB(117, 8, 0)
                                        end
                                    end
                                end
                            else
                                for i, v in pairs(game.Players:GetChildren()) do
                                    if v.Name ~= game.Players.LocalPlayer.Name then
                                        if v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp") then
                                            v.Character.HumanoidRootPart.PlayersEsp:Destroy()
                                        end
                                    end
                                end
                            end
                        end
                    )
                end
            end
        )
        
        task.spawn(
            function()
                while task.wait() do
                    pcall(
                        function()
                            if Config["ESP Fruit"] then
                                for i, v in pairs(game.Workspace:GetChildren()) do
                                    if string.find(v.Name, "Fruit") or string.find(v.Name, "Spawner") then
                                        if v:FindFirstChild("Handle") then
                                            if not v.Handle:FindFirstChild("FruitEsp") then
                                                local BillboardGui = Instance.new("BillboardGui")
                                                local TextLabel = Instance.new("TextLabel")
                                                BillboardGui.Parent = v.Handle
                                                BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                                BillboardGui.Active = true
                                                BillboardGui.Name = "FruitEsp"
                                                BillboardGui.AlwaysOnTop = true
                                                BillboardGui.LightInfluence = 1.000
                                                BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                                                BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
        
                                                TextLabel.Parent = BillboardGui
                                                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                                TextLabel.BackgroundTransparency = 1.000
                                                TextLabel.Size = UDim2.new(0, 200, 0, 50)
                                                TextLabel.Font = Enum.Font.Nunito
                                                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                                TextLabel.TextSize = 15
                                                TextLabel.TextStrokeTransparency = 0.000
                                                TextLabel.TextWrapped = false
                                            end
                                            local Dis =
                                                math.floor(
                                                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                                    v.Handle.Position).Magnitude / 10
                                            )
                                            v.Handle.FruitEsp.TextLabel.Text = v.Name .. "\n" .. "[" .. Dis .. "]"
                                        end
                                    end
                                end
                            else
                                for i, v in pairs(game.Workspace:GetChildren()) do
                                    if string.find(v.Name, "Fruit") then
                                        if v:FindFirstChild("Handle") then
                                            if v.Handle:FindFirstChild("FruitEsp") then
                                                v.Handle.FruitEsp:Destroy()
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    )
                end
            end
        ) 
        function IsSwanPirate()
            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                if RemoveLevelTitle(v.Name) == "Swan Pirate" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    return true
                end
            end
        end
        function MoonTextureId()
            if Sea1 then
                return game:GetService("Lighting").FantasySky.MoonTextureId
            elseif Sea2 then
                return game:GetService("Lighting").FantasySky.MoonTextureId
            elseif Sea3 then
                return game:GetService("Lighting").Sky.MoonTextureId
            end
        end
        function CheckMoon()
            moon8 = "http://www.roblox.com/asset/?id=9709150401"
            moon7 = "http://www.roblox.com/asset/?id=9709150086"
            moon6 = "http://www.roblox.com/asset/?id=9709149680"
            moon5 = "http://www.roblox.com/asset/?id=9709149431"
            moon4 = "http://www.roblox.com/asset/?id=9709149052"
            moon3 = "http://www.roblox.com/asset/?id=9709143733"
            moon2 = "http://www.roblox.com/asset/?id=9709139597"
            moon1 = "http://www.roblox.com/asset/?id=9709135895"
            moonreal = MoonTextureId()
            cofullmoonkothangbeo = "Bad Moon"
            if moonreal == moon5 or moonreal == moon4 then
                if moonreal == moon5 then
                    cofullmoonkothangbeo = "Full Moon"
                elseif moonreal == moon4 then
                    cofullmoonkothangbeo = "Next Night"
                end
            end
            return cofullmoonkothangbeo
        end
        function mmbs(inp, c2)
            ps = inp - c2
            if ps > 1 then
                return math.floor(ps) .. " Minutes"
            else
                return math.floor(ps * 60) .. " Seconds"
            end
        end    
        function CheckHakiColor()
            local v141, v142 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ColorsDealer", "1")
            if not v141 or v141 == 1 then
                return "None", "0\198\146"
            end
            if v141 ~= 1 then
                return v141, tostring(v142) .. "\198\146"
            end
        end  
        function CheckElite()
            return CheckMob(Elites, true)
        end
        function CheckEliteStatus()
            if not Sea3 or not CheckElite() then
                return "❌"
            end
            return "✅"
        end
        function CheckRace()
            local v113 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
            local v111 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
            if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
                return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V4"
            end
            if v113 == -2 then
                return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V3"
            end
            if v111 == -2 then
                return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V2"
            end
            return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V1"
        end 
        function CheckBoss(bossname)
            bossname = RemoveLevelTitle(bossname)
            for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                if RemoveLevelTitle(v.Name) == bossname and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    return v
                end
            end 
            for i, v in pairs(game.workspace.Enemies:GetChildren()) do
                if RemoveLevelTitle(v.Name) == bossname and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    return v
                end
            end
        end 
        function ClaimQuestV3()
            local v113 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
            if v113 == 0 then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                wait(.1)
                Notify(nil, "Claimed Quest V3", 10)
            elseif v113 == -1 then
                Notify(nil, "Leak of 2mill neli")
            end
        end
        function CheckCakePrinceStatus()
            ab, bb =
                pcall(
                function()
                    if not Sea3 then
                        return "Not Found"
                    end
                    if CheckBoss("Cake Prince [Lv. 2300] [Raid Boss]") or CheckBoss("Dough King [Lv. 2300] [Raid Boss]") then
                        if CheckBoss("Cake Prince [Lv. 2300] [Raid Boss]") then
                            return "Cake Prince Spawned"
                        end
                        if CheckBoss("Dough King [Lv. 2300] [Raid Boss]") then
                            return "Dough King Spawned"
                        end
                    else
                        return tonumber(
                            string.match(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true), "%d+")
                        ) .. " Mobs Remaining..."
                    end
                end
            )
            if ab then
                return bb
            end
            return "None"
        end
        function CheckGatCan()
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
                return "✅"
            end
            return "❌"
        end 
        function PlayersCount()
            return #game.Players:GetChildren()
        end 
        
        function function8()
            local c = game.Lighting
            local c2 = c.ClockTime
            if CheckMoon() == "Full Moon" and c2 <= 5 then
                return tostring(function6()) .. " ( Will End Moon In " .. mmbs(5, c2).." )"
            elseif CheckMoon() == "Full Moon" and (c2 > 5 and c2 < 12) then
                return tostring(function6()) .. " ( Fake Moon )"
            elseif CheckMoon() == "Full Moon" and (c2 > 12 and c2 < 18) then
                return tostring(function6()) .. " ( Will Full Moon In " .. mmbs(18, c2).." )"
            elseif CheckMoon() == "Full Moon" and (c2 > 18 and c2 <= 24) then
                return tostring(function6()) .. " ( Will End Moon In " .. mmbs(30, c2).." )"
            end
            if CheckMoon() == "Next Night" and c2 < 12 then
                return tostring(function6()) .. " ( Will Full Moon In " .. mmbs(18, c2).." )"
            elseif CheckMoon() == "Next Night" and c2 > 12 then
                return tostring(function6()) .. " ( Will Full Moon In " .. mmbs(18 + 24, c2).." )"
            end
            return tostring(function6())
        end
        function CheckMirageIslandStatus()
            if not Sea3 or not game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                return "❌"
            end
            return "✅ "..tostring(math.floor(GetDistance(getHighestPoint()))/10).."m away"
        end
        function function7()
            GameTime = "Error"
            local c = game.Lighting
            local c2 = c.ClockTime
            if c2 >= 18 or c2 < 5 then
                GameTime = "Night"
            else
                GameTime = "Day"
            end
            return GameTime
        end
        function function6()
            return math.floor(game.Lighting.ClockTime)
        end
        function getServerTime()
            RealTime = tostring(math.floor(game.Lighting.ClockTime * 100) / 100)
            RealTime = tostring(game.Lighting.ClockTime)
            RealTimeTable = RealTime:split(".")
            Minute, Second = RealTimeTable[1], tonumber((0 + tonumber(RealTimeTable[2] / 100))) * 60
            return Minute, Second
        end     
        function CheckAcientOneStatus()
            if not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
                return "You have yet to achieve greatness"
            end
            local v227 = nil
            local v228 = nil
            local v229 = nil
            v229, v228, v227 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Check")
            if v229 == 1 then
                return "Required Train More"
            elseif v229 == 2 or v229 == 4 or v229 == 7 then
                return "Can Buy Gear With " .. v227 .. "\198\146"
            elseif v229 == 3 then
                return "Required Train More"
            elseif v229 == 5 then
                return "You Are Done Your Race."
            elseif v229 == 6 then
                return "Upgrades completed: " .. v228 - 2 .. "/3, Need Trains More"
            end
            if v229 ~= 8 then
                if v229 == 0 then
                    return "Ready For Trial"
                else
                    return "You have yet to achieve greatness"
                end
            end
            return "Remaining " .. 10 - v228 .. " training sessions."
        end
        loadstring(
            [[
            local gg = getrawmetatable(game)
            local old = gg.__namecall
            setreadonly(gg, false)
            gg.__namecall =
                newcclosure(
                function(...)
                    local method = getnamecallmethod()
                    local args = {...}
                    if tostring(method) == "FireServer" then
                        if tostring(args[1]) == "RemoteEvent" then
                            if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                                if (AutoSeaBeast or SeaBeastTrial) and getgenv().psskill then
                                    args[2] = getgenv().psskill.Position
                                end
                                if (AimbotSkillAndGun or AimbotDiThangNgu) and (AimBotSkillPosition3 or AimBotSkillPosition) then
                                    if AimBotSkillPosition then 
                                        args[2] = AimBotSkillPosition 
                                    else
                                        args[2] = AimBotSkillPosition3 
                                    end
                                end
                                return old(unpack(args))
                            end
                        end
                    end
                    return old(...)
                end
            )
        ]]
        )()
        loadstring(
            [[
            local gt = getrawmetatable(game)
            local old = gt.__namecall
            setreadonly(gt,false)
            gt.__namecall = newcclosure(function(...)
                local args = {...}
                if getnamecallmethod() == "InvokeServer" then 
                    if tostring(args[2]) == "TAP" then
                        if (AimbotSkillAndGun or AimbotDiThangNgu) and (AimBotSkillPosition3 or AimBotSkillPosition) then
                            if AimBotSkillPosition then 
                                args[3] = AimBotSkillPosition 
                            else
                                args[3] = AimBotSkillPosition3 
                            end
                        end
                    end
                end
                return old(unpack(args))
            end)
        ]]
        )()
        function EnableKen()
            if
                game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and
                    game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") and
                    game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
             then
            else
                wait(1)
                game:service("VirtualUser"):CaptureController()
                game:service("VirtualUser"):SetKeyDown("0x65")
                wait(2)
                game:service("VirtualUser"):SetKeyUp("0x65")
            end
        end
        function NameMelee()
            for i, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
                if v:IsA("Tool") and v.ToolTip == "Melee" then
                    return v.Name
                end
            end
            for i, v in next, game:GetService("Players").LocalPlayer.Character:GetChildren() do
                if v:IsA("Tool") and v.ToolTip == "Melee" then
                    return v.Name
                end
            end
        end
        function NameSword()
            for i, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
                if v:IsA("Tool") and v.ToolTip == "Sword" then
                    return v.Name
                end
            end
            for i, v in next, game:GetService("Players").LocalPlayer.Character:GetChildren() do
                if v:IsA("Tool") and v.ToolTip == "Sword" then
                    return v.Name
                end
            end
        end
        function checkskillDF()
            if
                not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(
                    game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
                )
             then
                EquipWeaponName(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                return false
            end
            for i, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[
                game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
            ]:GetChildren() do
                if v:IsA("Frame") and Config["Use Skills"][v.Name] then
                    if
                        v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and
                            v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                            v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
                     then
                        return v.Name
                    end
                end
            end
        end 
        function NameGun()
            dick = game.Players.LocalPlayer.Backpack or game.Players.LocalPlayer.Character
            for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool") and v.ToolTip == "Gun" then
                    return v.Name
                end
            end
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v.ToolTip == "Gun" then
                    return v.Name
                end
            end
        end
        function checkskillSword()
            if not NameSword() then
                return
            end
            if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameSword()) then
                EquipWeaponName(NameSword())
                return false
            end
            for i, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameSword()]:GetChildren() do
                if v:IsA("Frame") and Config["Use Skills"][v.Name] then
                    if
                        v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and
                            v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                            v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
                     then
                        return v.Name
                    end
                end
            end
        end
        function checkskillGun()
            if not NameGun() then
                return nil
            end
            if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameGun()) then
                EquipWeaponName(NameGun())
                return false
            end
            for i, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameGun()]:GetChildren() do
                if v:IsA("Frame") and Config["Use Skills"][v.Name] then
                    if
                        v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and
                            v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                            v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
                     then
                        return v.Name
                    end
                end
            end
        end 
        function checkskillMelee()
            if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameMelee()) then
                EquipWeaponName(NameMelee())
                return false
            end
            for i, v in next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameMelee()]:GetChildren() do
                if v:IsA("Frame") and Config["Use Skills"][v.Name] then
                    if
                        v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and
                            v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                            v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
                     then
                        return v.Name
                    end
                end
            end
        end
        function ifskill()
            sword = checkskillSword()
            meele = checkskillMelee()
            df = checkskillDF()
            gun = checkskillGun()
            if sword then
                return sword
            end
            if meele then
                return meele
            end
            if df then
                return df
            end
            if gun then
                return gun
            end
        end 
        function EquipWeaponName(fff)
            if not fff then
                return
            end
            NoClip = true
            ToolSe = fff
            if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
                wait(.4)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
            end
        end
        function u8(fff)
            ToolSe = GetWeapon(fff)
            if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
                wait(.4)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
            end
        end
        function IsWpSKillLoaded(ki)
            if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills:FindFirstChild(ki) then
                return true
            end
        end
        function EquipAllWeapon()
            u3 = {
                "Melee",
                "Blox Fruit",
                "Sword",
                "Gun"
            }
            u3_2 = {}
            for i, v in pairs(u3) do
                u3_3 = GetWeapon(v)
                table.insert(u3_2, u3_3)
            end
            for i, v in pairs(u3_2) do
                if not IsWpSKillLoaded(v) then
                    print(v)
                    EquipWeaponName(v)
                end
            end
        end
        function autoskill()
            spawn(
                function()
                    EnableBuso()
                end
            )
            if not Config["Use Weapon"] then return print("not use wp") end
            sword = checkskillSword()
            meele = checkskillMelee()
            df = checkskillDF()
            gun = checkskillGun()
            if
                df and Config["Use Weapon"]["Devil Fruit"] and
                    not string.find(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value, "Portal") and
                    df ~= "F"
             then
                EquipWeaponName(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                local condimebeo = checkskillDF()
                if condimebeo then
                    SendKey(condimebeo, Config["Hold Time " .. tostring(condimebeo)],true)
                end
            elseif checkskillMelee() and Config["Use Weapon"]["Melee"]then
                EquipWeaponName(NameMelee())
                local condimebeo = checkskillMelee()
                if condimebeo then
                    SendKey(condimebeo, Config["Hold Time " .. tostring(condimebeo)],true)
                end
            elseif checkskillSword() and Config["Use Weapon"]["Sword"] then
                EquipWeaponName(NameSword())
                local condimebeo = checkskillSword()
                if condimebeo then
                    SendKey(condimebeo, Config["Hold Time " .. tostring(condimebeo)],true)
                end
            elseif checkskillGun() and Config["Use Weapon"]["Gun"] then
                EquipWeaponName(NameGun())
                condimebeo = checkskillGun()
                if condimebeo then
                    SendKey(condimebeo, Config["Hold Time " .. tostring(condimebeo)],true)
                end
            else
                EquipAllWeapon()
            end
        end 
        function CheckPirateBoat()
            local PirateBoats = {
                "PirateBasic",
                "PirateBrigade",
            }
            if Config["Auto Ghost Ship"] then table.insert(PirateBoats,"FishBoat") table.insert(PirateBoats,"PirateGrandBrigade") end
            for i, v in next, game:GetService("Workspace").Enemies:GetChildren() do
                if table.find(PirateBoats, v.Name) and v:FindFirstChild("Health") and v.Health.Value > 0 then
                    return v
                end
            end
        end
        sbtick = tick()
        spawn(
            function()
                while task.wait() do
                    if Config["Auto Sea Beast"] then
                        pcall(
                            function() 
                                if GetDistance(GetLocalBoat().VehicleSeat) < 50 then
                                    if game:GetService("Players").LocalPlayer.Character.Humanoid.Sit then  
                                        if tick()-sbtick > 5 then 
                                            sbtick = tick()
                                        end
                                        getgenv().SittingForSeaBeast = true 
                                        DisableNoClipIn5s = tick()  
                                    elseif not game:GetService("Players").LocalPlayer.Character.Humanoid.Sit and tick()-sbtick > 15 then
                                        getgenv().SittingForSeaBeast = false
                                    end 
                                else 
                                    getgenv().SittingForSeaBeast = false 
                                end
                            end
                        )
                    else
                        getgenv().SittingForSeaBeast = false
                    end
                end
            end
        )
        function GetLocalBoat()
            for i, v in next, game:GetService("Workspace").Boats:GetChildren() do
                if v:IsA("Model") then
                    if
                        v:FindFirstChild("Owner") and tostring(v.Owner.Value) == game:GetService("Players").LocalPlayer.Name and
                            v.Humanoid.Value > 0
                     then
                        return v
                    end
                end
            end
            return false
        end
        function KillBoat(boat) 
            v = boat 
            if not v or not v.Parent or v.Health.Value <= 0 then 
                UpdateTPCFrame()
                return 
            end
            repeat 
                boat,boat2 = pcall(function()
                    getgenv().SittingForSeaBeast = false
                    wait()
                    createEngine(v)
                    UpdateTPCFrame({
                        CFrame = v.Engine.CFrame * CFrame.new(0, -20, 0),
                        Enable = true
                    })
                    getgenv().psskill = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                    if GetDistance(v.Engine.CFrame) < 100 then autospamskill = true else getgenv().psskill = nil;autospamskill = nil end
                end) 
                if not boat then print(boat2) end
                task.wait()
            until not v or not v.Parent or v.Health.Value <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0
            getgenv().psskill = nil
            autospamskill = false
            UpdateTPCFrame()
        end
        function SeaBeast() 
            CFrameSB1 = CFrame.new(-13.488054275512695, 10.311711311340332, 2927.69287109375)
            CFrameSB2 = CFrame.new(28.4108, 1.2327, 3679.99)
            if Sea3 then
                CFrameSB1 = CFrame.new(-6044.32031, 15.1150599, -2040.65674)
                CFrameSB2 =
                    CFrame.new(
                    -6737.10742,
                    6.33979416,
                    -1870.81787,
                    -0.393565148,
                    5.29488897e-09,
                    0.919296741,
                    1.58969673e-08,
                    1,
                    1.04602116e-09,
                    -0.919296741,
                    1.50257087e-08,
                    -0.393565148
                )
            end 
            if not checkseabeast() and not CheckPirateBoat() and Config["Buy Boat"] then 
                if not GetLocalBoat() then
                    if GetDistance(CFrameSB1) > 8 then
                        getgenv().noclip = true
                        Tweento(CFrameSB1)
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", "MarineBrigade")
                    end
                else
                    if GetDistance(GetLocalBoat().VehicleSeat, CFrameSB2) > 50 then
                        GetLocalBoat().VehicleSeat.CFrame = CFrameSB2 * CFrame.new(20, 10, 20) --CFrame.new(28.4108 + 20, 1.2327 + 10, 3679.99 + 20)
                    else
                        if not game:GetService("Players").LocalPlayer.Character.Humanoid.Sit then
                            if
                                (GetLocalBoat().VehicleSeat.Position -
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 50
                             then
                                DisableNoClipIn5s = tick()
                                DoNoClip(true)
                                Tweento(GetLocalBoat().VehicleSeat.CFrame)
                                DisableNoClipIn5s = tick()
                            else
                                DisableNoClipIn5s = tick()
                                DoNoClip(false)
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                                    GetLocalBoat().VehicleSeat.CFrame
                            end
                        end
                    end
                end
            elseif CheckPirateBoat() then
                local v = CheckPirateBoat()
                KillBoat(v)
            elseif checkseabeast() then
                local v = checkseabeast()
                repeat 
                    wait()
                    spawn(
                        function()
                            TeleportSeabeast(v)
                        end
                    )
                    pss, pss2 =
                        pcall(
                        function()
                            getgenv().psskill =
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                            if GetDistance(v.HumanoidRootPart) <= 500 then
                                autospamskill = true
                            else
                                autospamskill = false
                            end
                        end
                    )
                    if not pss then
                        print(pss2)
                    end
                until not v or not v.Parent or v.Health.Value <= 0 or not checkseabeast()
                TpCFrame = nil 
                AutoTp = false
                getgenv().psskill = nil
                autospamskill = false 
            else
                getgenv().psskill = nil
            end
        end
        function checkseabeast()
            for i, v in next, game:GetService("Workspace").SeaBeasts:GetChildren() do
                if string.find(v.Name,"SeaBeast") then
                    g,g2 = pcall(function()
                        local s = v.HealthBBG.Frame.TextLabel.Text
                        local x = s:gsub("/%d+,%d+", "")
                        local a = v.HealthBBG.Frame.TextLabel.Text
                        local b
                        if string.find(x, ",") then
                            b = a:gsub("%d+,%d+/", "")
                        else
                            b = a:gsub("%d+/", "")
                        end
                        local c = b:gsub(",", "")
                        if tonumber(c) >= 70000 then
                            return v
                        end
                    end)
                    if g and g2 then return g2 end
                end
            end
        end
        local plr = game.Players.LocalPlayer
        function GetLocalBoat()
            for i, v in next, game:GetService("Workspace").Boats:GetChildren() do
                if v:IsA("Model") then
                    if
                        v:FindFirstChild("Owner") and tostring(v.Owner.Value) == game:GetService("Players").LocalPlayer.Name and
                            v.Humanoid.Value > 0
                     then
                        return v
                    end
                end
            end
            return false
        end
        function TeleportSeabeast(x)
            NoClip = true
            local a = Vector3.new(0, x:FindFirstChild("HumanoidRootPart").Position.Y, 0)
            local b = Vector3.new(0, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y, 0)
            if (a - b).Magnitude <= 175 then
                ----print("True dieu kien")
                Tweento(x.HumanoidRootPart.CFrame * CFrame.new(0, 300, 50))
            else
                ----print("Else")
                Tweento(
                    CFrame.new(
                        x.HumanoidRootPart.Position.X,
                        game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 200,
                        x.HumanoidRootPart.Position.Z
                    )
                )
            end
        end 
        function IsStunning()
            bb, ss2 =
                pcall(
                function()
                    return game.Players.LocalPlayer.Character.Stun.Value
                end
            )
            repeat
                bb, ss2 =
                    pcall(
                    function()
                        return game.Players.LocalPlayer.Character.Stun.Value
                    end
                )
                task.wait()
            until bb
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("BodyVelocity") then
                v = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("BodyVelocity")
                v.P = 0
                v.MaxForce = Vector3.new(0, 0, 0)
            end
            if ss2 ~= 0 then
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("BodyVelocity") then
                    v = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("BodyVelocity")
                    v.P = 0
                    v.MaxForce = Vector3.new(0, 0, 0)
                    return true
                end
                return true
            end
        end
        function SendKey(key, holdtime,mmb)
            if IsStunning() then
                return
            end
            if key and (not mmb or (mmb and Config["Use Skills"][key])) then
                if not holdtime then
                    game:service("VirtualInputManager"):SendKeyEvent(true, key, false, game)
                    task.wait()
                    game:service("VirtualInputManager"):SendKeyEvent(false, key, false, game)
                elseif holdtime then
                    game:service("VirtualInputManager"):SendKeyEvent(true, key, false, game)
                    task.wait(holdtime)
                    game:service("VirtualInputManager"):SendKeyEvent(false, key, false, game)
                end
            end
        end 
        task.spawn(function()
            while  task.wait() do 
                if Config["Auto Active Race"] then 
                    pcall(function()
                        if
                            game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and
                                game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 and
                                not game.Players.LocalPlayer.Character.RaceTransformed.Value
                         then
                            local vim = game:service("VirtualInputManager")
                            vim:SendKeyEvent(true, "Y", false, game)
                            task.wait()
                            vim:SendKeyEvent(false, "Y", false, game)
                        end
                    end)
                end
                if Config["Mods Character"]then
                    pcall(
                        function()
                            if not game.Players.LocalPlayer.Character:FindFirstChild("Check Mod") then
                                psss, ss =
                                    pcall(
                                    function()
                                        game:GetService("Players").LocalPlayer.VisionRadius.Value = math.huge
                                    end
                                )
                                if not psss then
                                    psss, ss =
                                        pcall(
                                        function()
                                            game:GetService("Players").LocalPlayer.VisionRadius.Value = math.huge
                                        end
                                    )
                                    repeat
                                        psss, ss =
                                            pcall(
                                            function()
                                                game:GetService("Players").LocalPlayer.VisionRadius.Value = math.huge
                                            end
                                        )
                                        task.wait()
                                    until psss
                                end
                                for i, v in next, getgc() do
                                    if getfenv(v).script == game.Players.LocalPlayer.Character:WaitForChild("Soru") then
                                        spawn(
                                            function()
                                                for i2, v2 in pairs(debug.getupvalues(v)) do
                                                    if type(v2) == "table" then
                                                        for mm, m2 in pairs(v2) do
                                                            if string.find(mm, "LastUse") then
                                                                repeat
                                                                    wait()
                                                                    setupvalue(v, i2, {LastAfter = 0, LastUse = (tick() - 15)})
                                                                until mmmb
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        )
                                    elseif getfenv(v).script == game.Players.LocalPlayer.Character:WaitForChild("Skyjump") then
                                        spawn(
                                            function()
                                                for i2, v2 in next, getupvalues(v) do
                                                    if tostring(i2) == "9" then
                                                        repeat
                                                            wait(.1)
                                                            setupvalue(v, i2, 0)
                                                        until mmmb
                                                    end
                                                end
                                            end
                                        )
                                    elseif getfenv(v).script == game.Players.LocalPlayer.Character:WaitForChild("Dodge") then
                                        for i2, v2 in next, getupvalues(v) do
                                            if tostring(getupvalues(v)[1]) == game.Players.LocalPlayer.Name then
                                                if tostring(v2) == "0.4" then
                                                    spawn(
                                                        function()
                                                            repeat
                                                                task.wait()
                                                                setupvalue(v, i2, 0)
                                                            until mmmb
                                                        end
                                                    )
                                                end
                                            end
                                        end
                                    end
                                end
                                mmbmbmmb = Instance.new("IntValue", game.Players.LocalPlayer.Character)
                                mmbmbmmb.Name = "Check Mod"
                                CreateUiNotify({Content = "Mod Character Successful"})
                            end
                            task.wait(5)
                        end
                    ) 
                end
            end
        end)
        function DoNoClip(togg)
            if togg then
                if game.Players.LocalPlayer.Character.Humanoid.Sit and not getgenv().ForgotSit then
                    Notify("Script Warn", "Player Sitting")
                    SendKey("Space", 0.05)
                end
                --game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                if not game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
                    local bv = Instance.new("BodyVelocity")
                    bv.Velocity = Vector3.new(0, 0, 0)
                    bv.MaxForce = Vector3.new(9999999, 9999999, 9999999)
                    bv.P = 15000
                    bv.Parent = game.Players.LocalPlayer.Character.Head
                end
                for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            else
                if game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
                    game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
                end
                game.Players.LocalPlayer.Character.Humanoid:ChangeState()
            end
        end
        function CheckWorld(world)
            if typeof(world) == "string" then
                world = world:gsub(" ", ""):gsub("Sea", "")
                world = tonumber(world)
            end
            if world == 1 and Sea1 then
                return true
            elseif world == 2 and Sea2 then
                return true
            elseif world == 3 and Sea3 then
                return true
            end
        end
        function TeleportWorld(world)
            if typeof(world) == "string" then
                world = world:gsub(" ", ""):gsub("Sea", "")
                world = tonumber(world)
            end
            if not CheckWorld(world) then
                CreateUiNotify(
                    {
                        Content = "Teleporting to Sea: " .. tostring(world)
                    }
                )
            else
                return
            end
            print("world", world, typeof(world))
            if world == 1 then
                local args = {
                    [1] = "TravelMain"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            elseif world == 2 then
                local args = {
                    [1] = "TravelDressrosa"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            elseif world == 3 then
                local args = {
                    [1] = "TravelZou"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
        DisableNoClipIn5s = tick() - 5
        spawn(
            function()
                game:GetService("RunService").Stepped:Connect(
                    function()
                        bug, b2 =
                            pcall(
                            function()
                                if
                                    NoClip or
                                        Config["No Clip"] and not getgenv().SittingForSeaBeast and
                                            tick() - DisableNoClipIn5s >= 5
                                 then
                                    DoNoClip(true)
                                elseif tick() - DisableNoClipIn5s >= 5 then
                                    DoNoClip(false)
                                end
                            end
                        )
                        if not bug then
                            print("b2", b2)
                        end
                    end
                )
            end
        )
        function TweenMobSpawn(mob)
            if typeof(mob) == "table" then
                if typeof(mob[1]) == "instance" then
                    for i, v in pairs(mob) do
                        if GetDistance(v) > 15 then
                            Tweento(v.CFrame * CFrame.new(0, 15, 0))
                        end
                        return
                    end
                else
                    for i, v in pairs(mob) do
                        if GetDistance(v) > 15 then
                            Tweento(v * CFrame.new(0, 15, 0))
                        end
                        return
                    end
                end
            elseif typeof(mob) == "string" then
                v = GetMobSpawn(mob)
                if v then
                    if GetDistance(v) > 15 then
                        Tweento(v * CFrame.new(0, 15, 0))
                    end
                end
            else
                pcall(
                    function()
                        Tweento(mob.CFrame * CFrame.new(0, 15, 0))
                    end
                )
            end
        end
        function CheckQuestBoss(bossname)
            b = RemoveLevelTitle(bossname)
            for i, v in next, require(game:GetService("ReplicatedStorage").Quests) do
                for i1, v1 in next, v do
                    for i2, v2 in next, v1.Task do
                        if i2 == b then
                            return b
                        end
                    end
                end
            end
        end
        function CheckNoClip(ts)
            sos = tostring(string.gsub(tostring(ts), "Enum.PlaybackState.", ""))
            if sos == "Playing" then
                NoClip = true
            else
                NoClip = false
            end
        end
        local TweenStats = "CC"
        spawn(
            function()
                while task.wait() do
                    pcall(
                        function()
                            CheckNoClip(TweenStats)
                        end
                    )
                end
            end
        )
        function KillMobNotInWorkSpace(mobname)
            print("Kill mob in workspace")
            mobname = RemoveLevelTitle(mobname)
            mobreal = ""
            for i, v in pairs(game.workspace.Enemies:GetChildren()) do
                if RemoveLevelTitle(mobname) == RemoveLevelTitle(v.Name) then
                    mobreal = v.Name
                end
            end
            for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
                if RemoveLevelTitle(mobname) == RemoveLevelTitle(v.Name) then
                    mobreal = v.Name
                end
            end
            if game.workspace.Enemies:FindFirstChild(mobreal) then
                KillMob(game.workspace.Enemies:WaitForChild(mobreal))
            elseif game.ReplicatedStorage:FindFirstChild(mobreal)  then
                v = game.ReplicatedStorage:FindFirstChild(mobreal)
                if not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0 then 
                    return  
                end
                Tweento(game.ReplicatedStorage:WaitForChild(mobreal).HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
            end
        end
        function CheckTushitaGate()
            return not game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate")
        end
        function GetBossTable()
            local a = {"Null"}
            blackboss = {
                "Ice Admiral [Lv. 700] [Boss]",
                "rip_indra [Lv. 1500] [Boss]"
            }
            for i,v in pairs(blackboss) do 
                blackboss[i] = RemoveLevelTitle(v)
            end
            islongma = function(v) 
                return RemoveLevelTitle(v) == RemoveLevelTitle("Longma [Lv. 2000] [Boss]")
            end
            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                if
                    not string.find(v.Name, "1500") and
                        (not islongma(v.Name) or ( islongma(v.Name) and CheckTushitaGate())) and
                        string.find(v.Name, " %pBoss%p") or
                        string.find(v.Name, " %pRaid Boss%p") and not table.find(blackboss, v.Name) and
                            v:FindFirstChild("Humanoid") and
                            v.Humanoid.Health > 0
                 then
                    table.insert(a, v.Name)
                    if table.find(a, "Null") then
                        table.remove(a, 1)
                    end
                end
            end
            for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
                if
                    not string.find(v.Name, "1500") and
                        (v.Name ~= "Longma [Lv. 2000] [Boss]" or (v.Name == "Longma [Lv. 2000] [Boss]") and CheckTushitaGate()) and
                        string.find(v.Name, " %pBoss%p") or
                        string.find(v.Name, " %pRaid Boss%p") and not table.find(blackboss, v.Name) and
                            v:FindFirstChild("Humanoid") and
                            v.Humanoid.Health > 0
                 then
                    table.insert(a, v.Name)
                    if table.find(a, "Null") then
                        table.remove(a, 1)
                    end
                end
            end
            return a
        end
        function getBossSeaHub()
            bossreturn = {}
            bossreq = 1
            bossmaxreq = 700
            if Sea2 then
                bossreq = 700
                bossmaxreq = 1500
            elseif Sea3 then
                bossreq = 1500
                bossmaxreq = 500000
            end
            for i, v in next, require(game:GetService("ReplicatedStorage").Quests) do
                for i1, v1 in next, v do
                    for i2, v2 in next, v1.Task do
                        if i1 == 3 and v1.LevelReq >= bossreq and v1.LevelReq <= bossmaxreq then
                            table.insert(bossreturn, i2)
                        end
                    end
                end
            end 
            return bossreturn
        end
        function GetDistance(target1, taget2)
            if not taget2 then
                taget2 = game.Players.LocalPlayer.Character.HumanoidRootPart
            end
            bbos, bbos2 =
                pcall(
                function()
                    a = target1.Position
                    a2 = taget2.Position
                end
            )
            if bbos then
                a = target1.Position
                a2 = taget2.Position
                return (a - a2).Magnitude
            end
        end
        function TweenTemple()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                "requestEntrance",
                Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586)
            )
        end
        Mob = ""
        Mob1 = ""
        plr = game.Players.LocalPlayer
        if game.Workspace:FindFirstChild("MobSpawns") then
            for i, v in pairs(game.Workspace:GetChildren()) do
                if v.Name == "MobSpawns" then
                    v:Destroy()
                end
            end
        end
        local CreateFoldermmb = Instance.new("Folder")
        CreateFoldermmb.Parent = game.Workspace
        CreateFoldermmb.Name = "MobSpawns"
        function RemoveLevelTitle(v)
            return tostring(tostring(v):gsub(" %pLv. %d+%p", ""):gsub(" %pRaid Boss%p", ""):gsub(" %pBoss%p", ""))
        end 
        task.spawn(
            function()
                while task.wait() do 
                    pcall(function()
                        for i,v in pairs(game.workspace.MobSpawns:GetChildren()) do  
                            v.Name = RemoveLevelTitle(v.Name)
                        end
                    end)
                    task.wait(50)
                end
            end
        )
        function MobDepTrai()
            MobDepTraiTable = {}
            for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
                table.insert(MobDepTraiTable, v)
            end
            local tablefoldermmb = {}
            for i, v in next, require(game:GetService("ReplicatedStorage").Quests) do
                for i1, v1 in next, v do
                    for i2, v2 in next, v1.Task do
                        if v2 > 1 then
                            table.insert(tablefoldermmb, i2)
                        end
                    end
                end
            end
            for i, v in pairs(getnilinstances()) do
                if table.find(tablefoldermmb, RemoveLevelTitle(v.Name)) then
                    table.insert(MobDepTraiTable, v)
                end
            end
            return MobDepTraiTable
        end
        local MobSpawnList = MobDepTrai()
        function ReloadFolderMob()
            for i, v in next, game.Workspace.MobSpawns:GetChildren() do
                v:Destroy()
            end
            for i, v in pairs(MobSpawnList) do
                if v then
                    if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                        MobNew = Instance.new("Part")
                        MobNew.CFrame = v.HumanoidRootPart.CFrame
                        MobNew.Name = v.Name
                        MobNew.Parent = game.Workspace.MobSpawns
                    elseif v:IsA("Part") then
                        MobNew = v:Clone()
                        MobNew.Parent = game.Workspace.MobSpawns
                    end
                end
            end
        end
        ReloadFolderMob()
        function CheckMob(tbmob, wijwerg)
            for i, v in pairs(tbmob) do
                tbmob[i] = RemoveLevelTitle(v)
            end
            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                if
                    table.find(tbmob, RemoveLevelTitle(v.Name)) and v:FindFirstChild("Humanoid") and
                        v:FindFirstChild("HumanoidRootPart") and
                        v.Humanoid.Health > 0
                 then
                    return v
                end
            end
            if wijwerg then
                for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
                    if
                        table.find(tbmob, RemoveLevelTitle(v.Name)) and v:FindFirstChild("Humanoid") and
                            v:FindFirstChild("HumanoidRootPart") and
                            v.Humanoid.Health > 0
                     then
                        return v
                    end
                end
            end
        end
        function GunAimbot(Part, GuNNaM)
            isgun = game:GetService("Players").LocalPlayer.Character:WaitForChild(GuNNaM)
            if not isgun then
                return
            end
            Click()
            local args = {
                [1] = Part.Position,
                [2] = Part
            }
            game:GetService("Players").LocalPlayer.Character[GuNNaM].RemoteFunctionShoot:InvokeServer(unpack(args))
        end
        function getNextIsland()
            TableIslandsRaid = {
                5,
                4,
                3,
                2,
                1
            }
            for i, v in next, TableIslandsRaid do
                if
                    IsIslandRaid(v) and
                        (IsIslandRaid(v).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                            4500
                 then
                    return IsIslandRaid(v)
                end
            end
        end
        blnamequest = {}
        getgenv().QuestKillPlayer = false
        function doorcup()
            return workspace.Map.Desert.Burn.Part.CanCollide == false
        end
        function doorsaber()
            for i, v in next, game:GetService("Workspace").Map.Jungle.Final:GetChildren() do
                if v:IsA("Part") and not v.CanCollide then
                    return true
                end
            end
        end
        function Rejoin()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
        end
        function CheckKick(v)
            if v.Name == "ErrorPrompt" then
                if v.Visible then
                    if v.TitleFrame.ErrorTitle.Text ~= "Teleport Failed" then
                        game:GetService("TeleportService"):TeleportToPlaceInstance(
                            game.PlaceId,
                            game.JobId,
                            game.Players.LocalPlayer
                        )
                    end
                end
                v:GetPropertyChangedSignal("Visible"):Connect(
                    function()
                        if v.Visible then
                            if v.TitleFrame.ErrorTitle.Text ~= "Teleport Failed" then
                                game:GetService("TeleportService"):TeleportToPlaceInstance(
                                    game.PlaceId,
                                    game.JobId,
                                    game.Players.LocalPlayer
                                )
                            end
                        end
                    end
                )
            end
        end
        game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(CheckKick) 
        local LocalPlayerLevelValue = 0
        local LocalPlayerFragmentValue = 0
        local LocalPlayerBeliValue = 0
        spawn(
            function()
                while task.wait() do
                    pcall(
                        function()
                            LocalPlayerLevelValue = game.Players.LocalPlayer.Data.Level.Value
                        end
                    )
                    pcall(
                        function()
                            LocalPlayerBeliValue = game.Players.LocalPlayer.Data.Beli.Value
                        end
                    )
                    pcall(
                        function()
                            LocalPlayerFragmentValue = game.Players.LocalPlayer.Data.Fragments.Value
                        end
                    )
                    task.wait()
                end
            end
        )
        function CheckSafeZone(p)
            for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].SafeZones:GetChildren()) do
                if v:IsA("Part") then
                    if
                        (v.Position - p.HumanoidRootPart.Position).magnitude <= 400 and
                            p.Humanoid.Health / p.Humanoid.MaxHealth >= 90 / 100
                     then
                        return true
                    end
                end
            end
        end
        function GetCFrameADD(v2)
            HealthPersent = Config["Panic Mode"] and math.floor((game.Players.LocalPlayer.Character.Humanoid.Health/game.Players.LocalPlayer.Character.Humanoid.MaxHealth*100)*100)/100
            if Config["Panic Mode"] and HealthPersent <= 30 then 
                return CFrame.new(0,0,0)
            end
            if v35455 and v2 and v2.Parent and v2:FindFirstChild("BodyVelocity") then
                return CFrame.new(0, 80, 0)
            else
                if not Config["Random CFrame Value"] then
                    Config["Random CFrame Value"] = 35
                end
                if not Config["Random CFrame"] then
                    return CFrame.new(0, Config["Random CFrame Value"], Config["Random CFrame Value"])
                else
                    return GetRandomCFrame(Config["Random CFrame Value"])
                end
            end
        end
        function GetInfoBossQuest(bossquest)
            returnrnrnr = {}
            for i, v in next, require(game:GetService("ReplicatedStorage").Quests) do
                for i1, v1 in next, v do
                    if v1.LevelReq <= LocalPlayerLevelValue and v1.Name == bossquest then
                        returnrnrnr["QuestName"] = i
                        returnrnrnr["QuestId"] = i1
                        return returnrnrnr
                    end
                end
            end
        end
        function IsIslandRaid(nu)
            if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island " .. nu) then
                min = 4500
                for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
                    if
                        v.Name == "Island " .. nu and
                            (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < min
                     then
                        min = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    end
                end
                for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
                    if
                        v.Name == "Island " .. nu and
                            (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= min
                     then
                        return v
                    end
                end
            end
        end
        function getNextIsland()
            TableIslandsRaid = {
                5,
                4,
                3,
                2,
                1
            }
            for i, v in next, TableIslandsRaid do
                if
                    IsIslandRaid(v) and
                        (IsIslandRaid(v).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                            4500
                 then
                    return IsIslandRaid(v)
                end
            end
        end
        function CheckDF1MBackpack()
            for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if string.find(v.Name, "Fruit") then
                    newname = tostring(v.Name):gsub("Fruit", "")
                    newname4 = newname:gsub(" ", "")
                    newname2 = newname4 .. "-" .. newname4
                    if table.find(FruitAbout1M, newname2) and not v:FindFirstChild("Coone") then
                        return v
                    end
                end
            end
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if string.find(v.Name, "Fruit") then
                    newname = tostring(v.Name):gsub("Fruit", "")
                    newname4 = newname:gsub(" ", "")
                    newname2 = newname4 .. "-" .. newname4
                    if table.find(FruitAbout1M, newname2) and not v:FindFirstChild("Coone") then
                        return v
                    end
                end
            end
        end
        function Click()
            local VirtualUser = game:GetService("VirtualUser")
            VirtualUser:CaptureController()
            VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
        end
        function CheckIsRaiding()
            checkraid2 = getNextIsland()
            checkraid1 = game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true
            if getNextIsland() then
                return getNextIsland()
            end     
            if not ALLCHECK_Func["Auto Trial Stage 1"]() and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible and not GetSeaBeastTrial() and GetDistance(CFrame.new(28282.5703125, 14896.8505859375, 105.1042709350586)) > 3000 then
                return true
            end
        end
        function getNearestSelectedBoss()
            min = math.huge 
            for i, v in pairs(Config["Selected Boss"]) do
                if v and CheckMob({i}, true) and GetDistance(CheckMob({i}, true).HumanoidRootPart) < min then 
                    min = GetDistance(CheckMob({i}, true).HumanoidRootPart)
                end
            end 
            for i, v in pairs(Config["Selected Boss"]) do
                if v and CheckMob({i}, true) and GetDistance(CheckMob({i}, true).HumanoidRootPart) <= min then 
                    return CheckMob({i}, true)
                end
            end
        end
        function EnableBuso()
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                NoClip = true
                local args = {
                    [1] = "Buso"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                NoClip = false
            end
        end
        function GetWeapon(wptype)
            s = ""
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v.ToolTip == wptype then
                    s = v.Name
                end
            end
            for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool") and v.ToolTip == wptype then
                    s = v.Name
                end
            end
            return s
        end
        local TickBuyMelee = tick() - 6000
        function EquipWeapon(ToolSe)
            if TickBuyMelee and tick() - TickBuyMelee < 5 then
                MMBStatus = "Waitting times to equipweapon"
                return MMBStatus
            end
            if gggggg then
                return
            end
            if not Config["Weapon Type"] or Config["Weapon Type"] == "" or Config["Weapon Type"] == nil then
                Config["Weapon Type"] = "Melee"
            end
            ToolSe = GetWeapon(Config["Weapon Type"])
            if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
                NoClip = true
                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
                wait(.4)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                NoClip = false
            end
        end
        function UnequipWeapon()
            pcall(
                function()
                    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                end
            )
        end
        MobsCakePrince = {
            "Cookie Crafter [Lv. 2200]",
            "Cake Guard [Lv. 2225]",
            "Baking Staff [Lv. 2250]",
            "Head Baker [Lv. 2275]"
        }
        function getCakePrinceMobs()
            return CheckMob(MobsCakePrince)
        end
        CakePrinceBosses = {
            "Dough King [Lv. 2300] [Raid Boss]",
            "Cake Prince [Lv. 2300] [Raid Boss]"
        }
        for i,v in pairs(CakePrinceBosses) do 
            CakePrinceBosses[i] = RemoveLevelTitle(v)
        end
        function getCakePrince()
            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                if
                    table.find(CakePrinceBosses, v.Name) and v:FindFirstChild("Humanoid") and
                        v:FindFirstChild("HumanoidRootPart") and
                        v.Humanoid.Health > 0
                 then
                    return v
                end
            end
            for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
                if
                    table.find(CakePrinceBosses, v.Name) and v:FindFirstChild("Humanoid") and
                        v:FindFirstChild("HumanoidRootPart") and
                        v.Humanoid.Health > 0
                 then
                    return v
                end
            end
        end
        if setscriptable then
            setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
        end
        function IsBoss(nv,raidb)
            if typeof(nv) == "string" then 
                nv = CheckBoss(nv) 
                if nv:find("Friend") then 
                    return true 
                end
            end
            if nv then 
                Bossb = raidb and "Raid Boss" or not raidb and "Boss"
                if nv.Humanoid.DisplayName and string.find(nv.Humanoid.DisplayName,Bossb)  then 
                    return true 
                end
            end
        end
        function GetNearestPlayer(pos)
            ner = math.huge
            local ner2
            for i, v in pairs(game.Players:GetChildren()) do
                if
                    v.Character and v.Character:FindFirstChild("HumanoidRootPart") and
                        (v.Character.HumanoidRootPart.Position - pos).Magnitude < ner
                 then
                    ner = (v.Character.HumanoidRootPart.Position - pos).Magnitude
                end
            end
            for i, v in pairs(game.Players:GetChildren()) do
                if
                    v.Character and v.Character:FindFirstChild("HumanoidRootPart") and
                        (v.Character.HumanoidRootPart.Position - pos).Magnitude <= ner
                 then
                    ner2 = v.Name
                end
            end
            if game.Players.LocalPlayer.Name == ner2 then
                return true
            end
        end
        if not syn then
            function isnetworkowner2(p1)
                local A = gethiddenproperty(game.Players.LocalPlayer, "SimulationRadius")
                local B = game.Players.LocalPlayer.Character or Wait(game.Players.LocalPlayer.CharacterAdded)
                local C = game.WaitForChild(B, "HumanoidRootPart", 300)
                if C then
                    if p1.Anchored then
                        return false
                    end
                    if game.IsDescendantOf(p1, B) or (C.Position - p1.Position).Magnitude <= A and GetNearestPlayer(p1.Position) then
                        return true
                    end
                end
                return false
            end
        end
        local lplr = game.Players.LocalPlayer
        if not isnetworkowner then
            isnetworkowner = function(part)
                if isnetworkowner2(part) then
                    return isnetworkowner2(part)
                end
                return part.ReceiveAge == 0 and GetNearestPlayer(part.Position)
            end
        else
            print("your exploit already can use isnetworkowner (or you executed this twice lmao)") -- bruh
        end
        
        function chodonandngu(p1)
            return isnetworkowner(p1)
        end
        --loadstring(game:HttpGet("https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/BringMobLoader.lua"))()
        --[[
        task.spawn(
            function()
                while task.wait() do
                    StartBringMob = false
                end
            end
        )
        ]]
        function BringMob(BringMobChoosen,V5)
            if not BringMobChoosen then
                return
            end
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            if not BringMobChoosen:FindFirstChild("Bringed") then 
                Bringed = Instance.new("IntValue",BringMobChoosen)
                Bringed.Name = "Bringed" 
            else
                return
            end
            V6 = BringMobChoosen.HumanoidRootPart
            if V5 then 
                V6 = V5 
            end
            if BringMobChoosen then
                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if
                        v.Name == BringMobChoosen.Name and
                            (V6.Position - v.HumanoidRootPart.Position).Magnitude < 340 and
                            (chodonandngu(v.HumanoidRootPart) or isnetworkowner(v.HumanoidRootPart)) and
                            v.Humanoid.MaxHealth < 100000
                     then
                        spawn(
                            function()
                                TweenObject(V6,v.HumanoidRootPart,1000)
                                spawn(
                                    function()
                                        pcall(
                                            function() 
                                                if not v.HumanoidRootPart:FindFirstChild("lockmmb") then
                                                    local lock = Instance.new("BodyVelocity")
                                                    lock.Parent = v.HumanoidRootPart
                                                    lock.Name = "lockmmb"
                                                    lock.MaxForce = Vector3.new(100000, 100000, 100000)
                                                    lock.Velocity = Vector3.new(0, 0, 0)
                                                end
                                                if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                                    for i, sk in pairs(v:GetDescendants()) do
                                                        if sk:IsA("BasePart") or sk:IsA("Part") then
                                                            sk.CanCollide = false
                                                        end
                                                    end
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.Humanoid.JumpPower = 0
                                                    if v.Humanoid:FindFirstChild("Animator") then
                                                        v.Humanoid.Animator:Destroy()
                                                    end
                                                end
                                            end
                                        )
                                    end
                                )
                                 
                            end
                        )
                    end
                end
            end
        end
        --[[
        task.spawn(
                function()
                    while task.wait() do
                        if StartBringMob then 
                            for i,v in pairs(game.workspace.Enemies:GetChildren()) do 
                                if
                                    StartBringMob and v:FindFirstChild("lockmmb") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                        v.Humanoid.Health > 0 and
                                        not string.find(v.Name, "Boss") and
                                        not table.find(Elites, v.Name)
                                then
                                        if not v:FindFirstChild("TickCheck") then
                                            TickCheck = Instance.new("IntValue")
                                            TickCheck.Name = "TickCheck"
                                            TickCheck.Parent = v
                                            TickCheck.Value = tick()
                                        elseif
                                            v:FindFirstChild("TickCheck") and
                                                ((tick() - v.TickCheck.Value >= 90 and v.Humanoid.Health == v.Humanoid.MaxHealth) or
                                                    (tick() - v.TickCheck.Value >= 90))
                                        then
                                            v.Humanoid.Health = 0
                                        end
                                    task.wait(.5)
                                else
                                    break
                                end
                            end
                        end
                    end
                end
            )
        ]]
        function SizePart(v, CFRmg, namemob1)
            if v:FindFirstChild("lockmmb") then
                return
            end 
            namemob1 = RemoveLevelTitle(namemob1)
            v.Name = RemoveLevelTitle(v.Name)
            if namemob1 and v.Name ~= namemob1 then
                return
            end
            if not v:FindFirstChild("HumanoidRootPart") then
                return
            end
            if not v.HumanoidRootPart:FindFirstChild("lockmmb") then
                local lock = Instance.new("BodyVelocity")
                lock.Parent = v.HumanoidRootPart
                lock.Name = "lockmmb"
                lock.MaxForce = Vector3.new(100000, 100000, 100000)
                lock.Velocity = Vector3.new(0, 0, 0)
                if not CFRmg then
                    return
                end
                if IsBoss(v.Name) then
                    return
                end
                if isnetworkowner(v.HumanoidRootPart) and v.Humanoid.MaxHealth <= 500000 and not IsBoss(v.Name) then  
                    spawn(
                        function()
                            pcall(
                                function()
                                    if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                        for i, sk in pairs(v:GetDescendants()) do
                                            if sk:IsA("BasePart") or sk:IsA("Part") then
                                                sk.CanCollide = false
                                            end
                                        end
                                        v.Humanoid.WalkSpeed = 0
                                        v.Humanoid.JumpPower = 0
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                    end
                                end
                            )
                        end
                    )
                else
                    return 
                end
            end
        end 
        function CheckIsV4()
            p2, p3 =
                pcall(
                function()
                    return game.Players.LocalPlayer.Character.RaceTransformed.Value
                end
            )
            if not p2 then
                return
            end
            return p3
        end
        function CheckOnlyV4()
            if not Config["Only V4"] then
                return true
            end
            if Config["Only V4"] and CheckIsV4() then
                return true
            end
        end 
        function CheckReqHop(CF)
            if Config["Hop Ping"] and Config["Hop Ping Value"] and GetPing() >= Config["Hop Ping Value"] then 
                CreateUiNotify({
                    Content = "Ping reached: "..tostring(GetPing())
                })
                HopServer(10,true)
            end
            if CF and Config["Hop Near"] and Config["Hop Near Distance"] then 
                for i,v in pairs(game.Players:GetChildren()) do 
                    pcall(function()
                        if v.Name == game.Players.LocalPlayer.Name then return end
                        if GetDistance(v.Character.HumanoidRootPart,CF) < Config["Hop Near Distance"] then 
                            CreateUiNotify({
                                Content = "Player: "..tostring(v.Name).." reached distance: "..tostring(math.floor(GetDistance(v.Character.HumanoidRootPart)))
                            })
                            HopServer(9,true) 
                        end
                    end)
                end 
            end
        end
        local LockCFrame = CFrame.new()
        function KillNigga(Nasga)
            if
                Nasga and Nasga:FindFirstChild("Humanoid") and Nasga:FindFirstChild("HumanoidRootPart") and
                    Nasga.Humanoid.Health > 0
             then
                mmas = GetMidPoint(Nasga.Name, Nasga.HumanoidRootPart)
                if not string.find(Nasga.Name, "Boss") and Nasga.Humanoid.MaxHealth < 130000 then
                    KillingBoss = false
                    LockCFrame = CFrame.new(mmas.X, mmas.Y, mmas.Z)
                else
                    LockCFrame = Nasga.HumanoidRootPart.CFrame
                    KillingBoss = true
                end
                if string.find(Nasga.Name, "Boss") or table.find(Elites, Nasga.Name) then
                    if not string.find(Nasga.Name, "Boss") then
                        for i, v in pairs(Elites) do
                            if RemoveLevelTitle(v) == RemoveLevelTitle(Nasga.Name) then
                                KillingBoss = true
                                CreateGameNotify("Elite Boss", 30)
                            end
                        end
                    else
                        KillingBoss = true
                    end
                end
                if not KillingBoss then
                    CheckReqHop(Nasga.HumanoidRootPart.CFrame)
                end
                for i, v in pairs(Elites) do
                    if RemoveLevelTitle(v) == RemoveLevelTitle(Nasga.Name) then
                        KillingBoss = true
                        CreateGameNotify("Elite Boss", 30)
                    end
                end
                repeat
                    task.wait()
                    if
                        Nasga and Nasga:FindFirstChild("Humanoid") and Nasga:FindFirstChild("HumanoidRootPart") and
                            Nasga.Humanoid.Health > 0
                     then
                        spawn(
                            function()
                                EquipWeapon()
                            end
                        )
                        spawn(
                            function()
                                EnableBuso()
                            end
                        )
                        SizePart(Nasga, LockCFrame, Nasga.Name)
                        spawn(
                            function()
                                bbc, bbc2 =
                                    pcall(
                                    function()
                                        MMBStatus =
                                            "Killing " ..
                                            Nasga.Name .. " | Health Remaining: " .. math.floor(Nasga.Humanoid.Health)
                                        if Nasga:FindFirstChild("TickCheck") then
                                            MMBStatus =
                                                MMBStatus ..
                                                " | Delete Nasga In: " ..
                                                    math.floor(
                                                        tonumber(90 - (tick() - Nasga:FindFirstChild("TickCheck").Value))
                                                    ) ..
                                                        "s"
                                        end
                                    end
                                )
                            end
                        )
                        BringMob(Nasga, LockCFrame) 
                        UpdateTPCFrame({
                            Enable = true,
                            CFrame = Nasga.HumanoidRootPart.CFrame * GetCFrameADD(Nasga.HumanoidRootPart)
                        })
                        NoClip = true
                        if not Config["%HealthSendSkill"] then
                            Config["%HealthSendSkill"] = 50
                        end
                        CanMasteryFarm = Nasga.Humanoid.Health <= (Nasga.Humanoid.MaxHealth * Config["%HealthSendSkill"]) / 100
                        if
                            Config["Mastery Farm"] and CheckOnlyV4() and Config["Mastery Farm"] and
                                Nasga.Humanoid.MaxHealth < 500000 and
                                CanMasteryFarm
                         then
                            if Config["Mastery Farm"] and CheckOnlyV4() and Nasga.Humanoid.MaxHealth < 500000 and CanMasteryFarm then
                                repeat
                                    task.wait()
                                    UseFastAttack = false
                                    spawn(
                                        function()
                                            bbc, bbc2 =
                                                pcall(
                                                function()
                                                    MMBStatus =
                                                        "Killing " ..
                                                        Nasga.Name ..
                                                            " | Health Remaining: " .. math.floor(Nasga.Humanoid.Health)
                                                    if Nasga:FindFirstChild("TickCheck") then
                                                        MMBStatus =
                                                            MMBStatus ..
                                                            " | Delete Nasga In: " ..
                                                                math.floor(
                                                                    tonumber(
                                                                        90 - (tick() - Nasga:FindFirstChild("TickCheck").Value)
                                                                    )
                                                                ) ..
                                                                    "s"
                                                    end
                                                end
                                            )
                                        end
                                    )
                                    BringMob(Nasga, LockCFrame)
                                    NoClip = true
                                    AimBotSkillPosition = Nasga.HumanoidRootPart.Position
                                    AimbotDiThangNgu = true
                                    NameItemSkill, SKill = CheckSkillMastery()
                                    UpdateTPCFrame({
                                        Enable = true,
                                        CFrame = Nasga.HumanoidRootPart.CFrame * GetCFrameADD(Nasga.HumanoidRootPart)
                                    })
                                    if NameItemSkill and SKill then
                                        EquipWeaponName(NameItemSkill)
                                        SendKey(SKill, Config["Hold Time " .. tostring(SKill)])
                                        task.wait(.2)
                                    end
                                    if Config["TypeMasteryFarm"] == "Gun" and CheckSkillMastery() then
                                        EquipWeaponName(NameItemSkill)
                                        spawn(
                                            function()
                                                GunAimbot(Nasga.HumanoidRootPart, NameItemSkill)
                                            end
                                        )
                                    end
                                until not Nasga or not Nasga.Parent or not Nasga:FindFirstChild("Humanoid") or
                                    Nasga.Humanoid.Health <= 0 or
                                    not CheckOnlyV4() or
                                    not Config["Mastery Farm"] or
                                    Nasga.Humanoid.Health > (Nasga.Humanoid.MaxHealth * Config["%HealthSendSkill"]) / 100
                                UseFastAttack = false
                                NoClip = false
                                AimbotDiThangNgu = false
                                AimBotSkillPosition = nil
                                LockCFrame = nil 
                                UpdateTPCFrame()
                            elseif GetDistance(Nasga.HumanoidRootPart) < 300 then
                                spawn(
                                    function()
                                        EquipWeapon()
                                    end
                                )
                                spawn(
                                    function()
                                        EnableBuso()
                                    end
                                )
                                UseFastAttack = true
                            else
                                UseFastAttack = false
                            end
                        elseif GetDistance(Nasga.HumanoidRootPart) < 300 then
                            spawn(
                                function()
                                    EquipWeapon()
                                end
                            )
                            spawn(
                                function()
                                    EnableBuso()
                                end
                            )
                            UseFastAttack = true
                        else
                            UseFastAttack = false
                        end
                        spawn(
                            function()
                                EquipWeapon()
                            end
                        )
                        spawn(
                            function()
                                EnableBuso()
                            end
                        )
                    else
                        task.wait()
                    end
                until not Nasga or not Nasga:FindFirstChild("Humanoid") or not Nasga:FindFirstChild("HumanoidRootPart") or
                    Nasga.Humanoid.Health <= 0 or
                    CheckIsRaiding() 
                pcall(
                    function()
                        if Nasga.Humanoid.Health <= 0 then
                            if string.find(Nasga.Name, "Boss") or table.find(Elites, Nasga.Name) then
                                if Config["WebhookRaidBoss"] then
                                    CreateGameNotify("Posting Raid boss webhook", 10)
                                    PostWebhook(Config["WebhookUrl"], GetMsgRaidBoss(Nasga.Name))
                                end
                            end
                        end
                    end
                ) 
                UpdateTPCFrame()
                MMBStatus = "Killed " .. Nasga.Name
                UseFastAttack = false
                NoClip = false
                AimbotDiThangNgu = false
                AimBotSkillPosition = nil
                LockCFrame = nil
            end
        end
        function KillMob(Mob, kkk) 
            momobe, momobe2 =
                pcall(
                function()
                    Mob3 = Mob
                    if type(Mob3) == "table" and kkk then
                        if CheckMob(Mob3) then
                            Mob = CheckMob(Mob3)
                            KillNigga(Mob)
                        else
                            MMBStatus = "Waitting mob"
                            MobSLCSpawnssss = Mob
                            condcmm = GetListMobSpawn(Mob3)
                            if condcmm then
                                for i, v in pairs(condcmm) do
                                    MobSpawn = v
                                    if MobSpawn:IsA("Part") and not CheckMob(Mob3) then
                                        Tweento(MobSpawn.CFrame * CFrame.new(0, 20, 8))
                                    elseif MobSpawn:FindFirstChild("HumanoidRootPart") and not CheckMob(Mob3) then
                                        Tweento(MobSpawn.HumanoidRootPart.CFrame * CFrame.new(0, 8, 8))
                                    end
                                end
                            else
                                for i, v in pairs(MobSLCSpawnssss) do
                                    if GetMobSpawn(v) and not CheckMob(Mob3) then
                                        MobSpawn = GetMobSpawn(v)
                                        EnableBuso()
                                        EquipWeapon()
                                        if MobSpawn:IsA("Part") and not CheckMob(Mob3) then
                                            Tweento(MobSpawn.CFrame * CFrame.new(0, 20, 8))
                                        elseif MobSpawn:FindFirstChild("HumanoidRootPart") and not CheckMob(Mob3) then
                                            Tweento(MobSpawn.HumanoidRootPart.CFrame * CFrame.new(0, 8, 8))
                                        end
                                    end
                                end
                            end
                        end
                    else
                        KillNigga(Mob)
                    end
                end
            )
            if not momobe then
                print(momobe2)
            end
        end
        function GetMobSpawn(mob)
            mob = RemoveLevelTitle(mob)
            ps, ps2 =
                pcall(
                function(v)
                    if not MobSpawnList[mob] then
                        if game.workspace.MobSpawns:FindFirstChild(mob) then
                            for i, v in pairs(game.workspace.MobSpawns:GetChildren()) do
                                if RemoveLevelTitle(v.Name) == mob or v.Name == mob then
                                    MobSpawnList[mob] = v
                                end
                            end
                        else
                            print("mmb")
                        end
                    end
                end
            )
            return MobSpawnList[mob]
        end
        function GetListMobSpawn(a)
            for i, v in pairs(a) do
                a[i] = RemoveLevelTitle(v)
            end
            ReturnTB = {}
            returtbti = 0
            for _, Mobv in pairs(a) do
                if not MobSpawnList[Mobv] then
                    if not game.Workspace.MobSpawns:FindFirstChild(Mobv) then
                        ReloadFolderMob()
                    end
                    wait()
                    for i, v in pairs(game.Workspace.MobSpawns:GetChildren()) do
                        if RemoveLevelTitle(v.Name) == Mobv then
                            table.insert(MobSpawnList, v)
                            table.insert(ReturnTB, v)
                            returtbti = returtbti + 1
                        end
                    end
                else
                    for i, v in pairs(MobSpawnList) do
                        if RemoveLevelTitle(i) == Mobv then
                            table.insert(ReturnTB, v)
                            returtbti = returtbti + 1
                        end
                    end
                end
            end
            if #ReturnTB > 0 then
                return ReturnTB
            end
            return nil
        end
        function Notify(v1, v2, v3) 
            if tostring(v1) == "nil" then 
                v1 = "Tsuo Hub" 
            end
            CreateUiNotify(
                {
                    Title = tostring(v1),
                    Content = tostring(v2),
                    Duration = tonumber(v3)
                }
            )
        end
        function CreateGameNotify(v2, v3)
            CreateUiNotify({
                Content = v2,
                Duration = v3
            })
        end
        function GetMobSpawnList(a)
            a = RemoveLevelTitle(a)
            k = {}
            for i, v in pairs(game.Workspace.MobSpawns:GetChildren()) do
                if v.Name == a then
                    table.insert(k, v)
                end
            end
            return k
        end
        
        local BlackListLocation = {}
        function CheckNearestTeleporter(vcs)
            vcspos = vcs.Position
            min = math.huge
            min2 = math.huge
            local placeId = game.PlaceId
            if placeId == 2753915549 then
                OldWorld = true
            elseif placeId == 4442272183 then
                NewWorld = true
            elseif placeId == 7449423635 then
                ThreeWorld = true
            end
            local chooseis
            if ThreeWorld then
                TableLocations = {
                    ["Caslte On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
                    ["Hydra"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
                    ["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
                    ["Great Tree"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
                    ["Ngu1"] = Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
                    ["ngu2"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656),
                    ["Temple Of Time"] = Vector3.new(2957.833740234375, 2286.495361328125, -7217.05078125)
                }
                if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
                --TableLocations["Dismension"] = Vector3.new(-1990.672607421875, 4532.99951171875, -14973.6748046875)
                end
            elseif NewWorld then
                TableLocations = {
                    ["Mansion"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
                    ["Flamingo"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
                    ["122"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
                    ["3032"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
                }
            elseif OldWorld then
                TableLocations = {
                    ["1"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
                    ["2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
                    ["3"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
                    ["4"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
                }
            end
            mmbb = {}
            for i2, v2 in pairs(TableLocations) do
                if not table.find(BlackListLocation, i2) then
                    mmbb[i2] = v2
                end
            end
            TableLocations = mmbb
            TableLocations2 = {}
            for i, v in pairs(TableLocations) do
                if typeof(v) ~= "table" then
                    TableLocations2[i] = (v - vcspos).Magnitude
                else
                    TableLocations2[i] = (v["POS"] - vcspos).Magnitude
                end
            end
            for i, v in pairs(TableLocations2) do
                if v < min then
                    min = v
                    min2 = v
                end
            end
            for i, v in pairs(TableLocations2) do
                if v < min then
                    min = v
                    min2 = v
                end
            end
            for i, v in pairs(TableLocations2) do
                if v <= min then
                    choose = TableLocations[i]
                    chooseis = i
                end
            end
            min3 = (vcspos - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if min2 + 100 <= min3 then
                return choose, chooseis
            end
        end
        function requestEntrance(vector3, fr)
            if not fr or fr ~= "Temple Of Time" and fr ~= "Dismension" then
                args = {
                    "requestEntrance",
                    vector3
                }
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                char = game.Players.LocalPlayer.Character.HumanoidRootPart
                char.CFrame = CFrame.new(oldcframe.X, oldcframe.Y + 50, oldcframe.Z)
                task.wait(0.5)
            else
                pcall(
                    function()
                        TweenTemple()
                        if GetDistance(CFrame.new(28282.5703125, 14896.8505859375, 105.1042709350586)) > 10 then
                            return
                        end
                        game.Players.LocalPlayer.Character:MoveTo(
                            CFrame.new(
                                28390.7812,
                                14895.8574,
                                106.534714,
                                0.0683786646,
                                1.44424162e-08,
                                -0.997659445,
                                7.52342522e-10,
                                1,
                                1.45278642e-08,
                                0.997659445,
                                -1.74397752e-09,
                                0.0683786646
                            ).Position
                        )
                        AllNPCS = getnilinstances()
                        for i, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                            table.insert(AllNPCS, v)
                        end
                        for i, v in pairs(AllNPCS) do
                            if v.Name == "Mysterious Force" then
                                TempleMysteriousNPC1 = v
                            end
                            if v.Name == "Mysterious Force3" then
                                TempleMysteriousNPC2 = v
                            end
                        end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                            TempleMysteriousNPC2.HumanoidRootPart.CFrame
                        wait(0.3)
                        if
                            (TempleMysteriousNPC2.HumanoidRootPart.Position -
                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 15
                         then
                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "TeleportBack")
                        end
                        wait(0.75)
                    end
                )
            end
        end
        function AntiLowHealth(yc5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                yc5,
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
            )
            wait()
        end
        function loadplr()
            repeat
                task.wait()
                if not game.Players.LocalPlayer.Character:FindFirstChild("Tween Access") then
                    tikcsm = tick()
                    repeat
                        task.wait()
                    until tick() - tikcsm >= 1.5
                    if not game.Players.LocalPlayer.Character:FindFirstChild("Tween Access") then
                        TweenAccess = Instance.new("IntValue")
                        TweenAccess.Name = "Tween Access"
                        TweenAccess.Parent = game.Players.LocalPlayer.Character
                    end
                end
            until game.Players.LocalPlayer.Character:FindFirstChild("Tween Access")
        end
        loadplr()
        function CancelTween()
            if not LoadedUiHub then
                return
            end
            pcall(
                function()
                    tween:Cancel()
                end
            )
        end
        spawn(
            function()
                while task.wait() do
                    pcall(
                        function()
                            if not game.Players.LocalPlayer.Character:FindFirstChild("Tween Access") then
                                CancelTween()
                                repeat
                                    task.wait()
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("Tween Access") then
                                        tikcsm = tick()
                                        repeat
                                            task.wait()
                                        until tick() - tikcsm >= 1.5
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("Tween Access") then
                                            TweenAccess = Instance.new("IntValue")
                                            TweenAccess.Name = "Tween Access"
                                            TweenAccess.Parent = game.Players.LocalPlayer.Character
                                        end
                                    end
                                until game.Players.LocalPlayer.Character:FindFirstChild("Tween Access")
                            end
                        end
                    )
                end
            end
        )
        
        ticktp = tick()
        tweenticks = tick()
        tickcancel = tick()
        local AntiLowHealthting
        tickflag = tick() - 5
        spawn(
            function()
                while task.wait() do
                    if tick() - tickflag < 5 then
                        pcall(
                            function()
                                game.Players.LocalPlayer.Humanoid:ChangeState(11)
                            end
                        )
                    else
                        pcall(
                            function()
                                game.Players.LocalPlayer.Humanoid:ChangeState()
                            end
                        )
                    end
                end
            end
        )
        function GetMidPointPart(tbpart)
            local pascal
            local allpas = 0
            for i, v in pairs(tbpart) do
                pcall(
                    function()
                        if not pascal then
                            pascal = v.Position
                        else
                            pascal = pascal + v.Position
                        end
                        allpas = allpas + 1
                    end
                )
            end
            return pascal / allpas
        end
        function GetAllIsland()
            tbs = {}
            for __, pathteam in pairs(game:GetService("Workspace")["_WorldOrigin"].PlayerSpawns:GetChildren()) do
                for i, v in pairs(pathteam:GetChildren()) do
                    if not tbs[v.Name] then
                        tbs[v.Name] = GetMidPointPart(v:GetChildren())
                    end
                end
            end
            return tbs
        end
        function GetAllIsland()
            tbs = {}
            for __, pathteam in pairs(game:GetService("Workspace")["_WorldOrigin"].PlayerSpawns:GetChildren()) do
                for i, v in pairs(pathteam:GetChildren()) do
                    if not tbs[v.Name] then
                        tbs[v.Name] = GetMidPointPart(v:GetChildren())
                    end
                end
            end
            return tbs
        end
        ALLISLAND = GetAllIsland()
        ALLISLANDOp = {}
        for i, v in pairs(ALLISLAND) do
            table.insert(ALLISLANDOp, i)
        end
        getgenv().ResetedTime = 0
        function getNearestSpawn(targetCFrame)
            min = 2000
            local min2
            for i, CF in pairs(GetAllIsland()) do
                if GetDistance(CFrame.new(CF.X, CF.Y, CF.Z), targetCFrame) < min then
                    min = GetDistance(CFrame.new(CF.X, CF.Y, CF.Z), targetCFrame)
                end
            end
            for i, CF in pairs(GetAllIsland()) do
                if GetDistance(CFrame.new(CF.X, CF.Y, CF.Z), targetCFrame) <= min then
                    min2 = CFrame.new(CF.X, CF.Y, CF.Z)
                end
            end
            if min2 then
                return min2
            end
        end
        function GetMidPoint(MobName, b2)
            if not Config["Smart Bring"] or Mob.Name == "Ship Officer [Lv. 1325]" then
                return b2.CFrame
            end
            if 1 > 1 then
                return b2.CFrame
            end
            local totalpos
            allid = 0
            for i, v in pairs(game.workspace.Enemies:GetChildren()) do
                if
                    v.Name == MobName and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                        (b2 and GetDistance(v.HumanoidRootPart, b2) <= 475)
                 then
                    if not totalpos then
                        totalpos = v.HumanoidRootPart.Position
                    elseif totalpos then
                        totalpos = totalpos + v.HumanoidRootPart.Position
                    end
                    allid = allid + 1
                end
            end
            if totalpos then
                return totalpos / allid
            end
        end 
        function TweenObject(TweenCFrame,obj,ts)
            if not ts then ts = 350 end
            local tween_s = game:service "TweenService"
            local info =
                TweenInfo.new(
                (TweenCFrame.Position -
                    obj.Position).Magnitude /
                    ts,
                Enum.EasingStyle.Linear
            )
            tween =
                tween_s:Create(
                    obj,
                info,
                {CFrame = TweenCFrame}
            )
            tween:Play() 
        end
        function Tweento(targetCFrame)
            bbc11, bbc12 =
                pcall(
                function()
                    if
                        game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                            game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 and
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                     then
                        if not game.Players.LocalPlayer.Character:FindFirstChild("Tween Access") then
                            return print("not tween access")
                        end
                        if not TweenSpeed or type(TweenSpeed) ~= "number" then
                            TweenSpeed = 325
                        end
                        if AntiLowHealthting then
                            return
                        end
                        tween = nil
                        DefualtY = targetCFrame.Y
                        if DefualtY < 50 then
                            DefualtY = 75
                        end
                        if Config["Auto Beta"] then
                            DefualtY = DefualtY + 100
                        end
                        TargetY = targetCFrame.Y
                        targetCFrameWithDefualtY = CFrame.new(targetCFrame.X, DefualtY, targetCFrame.Z)
                        targetPos = targetCFrame.Position
                        oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        Distance =
                            (targetPos -
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
                        if Distance <= 300 and tick() - ticktp >= 0.01 then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
                            ticktp = tick()
                            return
                        end
                        if game.Players.LocalPlayer.Character.Humanoid.Sit then
                            for i, v in pairs(game.workspace:GetDescendants()) do
                                if v:IsA("Seat") then
                                    v:Destroy()
                                end
                            end
                        end
                        LowHealth = game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 30 / 100
                        NotLowHealth = game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 70 / 100 
                        IsLowHealth = math.floor((game.Players.LocalPlayer.Character.Humanoid.Health/game.Players.LocalPlayer.Character.Humanoid.MaxHealth*100)*100)/100 <= 30
                        if Config["Panic Mode"] and IsLowHealth then
                            CancelTween()
                            OldY = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y
                            repeat
                                wait()
                                Tweento(targetCFrame * GetCFrameADD())
                                AntiLowHealthting = true
                            until not Config["Panic Mode"] or not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") or
                                game.Players.LocalPlayer.Character.Humanoid.Health > NotLowHealth
                            AntiLowHealth(OldY)
                            AntiLowHealthting = false
                        end
                        local bmg, bmg2 = CheckNearestTeleporter(targetCFrame)
                        if bmg then
                            timetry = 0
                            repeat
                                pcall(
                                    function()
                                        tween:Cancel()
                                    end
                                )
                                wait()
                                requestEntrance(bmg, bmg2)
                                timetry = timetry + 1
                            until not CheckNearestTeleporter(targetCFrame) or timetry >= 10
                            if timetry >= 10 and CheckNearestTeleporter(targetCFrame) then
                                if bmg2 == "Temple Of Time" then
                                    print("insert blacklist temple")
                                    table.insert(BlackListLocation, bmg2)
                                end
                                game.Players.LocalPlayer.Character.Humanoid.Health = 0
                            end
                        end
                        b1 =
                            CFrame.new(
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                            DefualtY,
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                        )
                        if DoNotTweenInThisTime then
                            CancelTween()
                            return
                        end
                        if Config["Same Y"] and (b1.Position - targetCFrameWithDefualtY.Position).Magnitude > 5 then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                CFrame.new(
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                                DefualtY,
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                            )
                            local tweenfunc = {}
                            local tween_s = game:service "TweenService"
                            local info =
                                TweenInfo.new(
                                (targetPos -
                                    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /
                                    TweenSpeed,
                                Enum.EasingStyle.Linear
                            )
                            tween =
                                tween_s:Create(
                                game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                                info,
                                {CFrame = targetCFrameWithDefualtY}
                            )
                            tween:Play()
                            function tweenfunc:Stop()
                                tween:Cancel()
                            end
                            TweenStats = tween.PlaybackState
                            tween.Completed:Wait()
                            TweenStats = tween.PlaybackState
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                CFrame.new(
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                                TargetY,
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                            )
                        else
                            local tweenfunc = {}
                            local tween_s = game:service "TweenService"
                            local info =
                                TweenInfo.new(
                                (targetPos -
                                    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /
                                    TweenSpeed,
                                Enum.EasingStyle.Linear
                            )
                            tween =
                                tween_s:Create(
                                game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                                info,
                                {CFrame = targetCFrame}
                            )
                            tween:Play()
                            function tweenfunc:Stop()
                                tween:Cancel()
                            end
                            TweenStats = tween.PlaybackState
                            tween.Completed:Wait()
                            TweenStats = tween.PlaybackState
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                CFrame.new(
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                                TargetY,
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                            )
                        end
                        if not tween then
                            return tween
                        end
                        return tweenfunc
                    end
                end
            )
            if not bbc11 then
            end
        end
        local KillingBoss = false
        function CheckKillPlayer(v)
            pas, pas2 =
                pcall(
                function()
                    mmb = v.Character.HumanoidRootPart.CFrame
                end
            )
            if pas then
                if v.Character.Humanoid.Health > 0 then
                    return true
                end
            end
        end
        local Quest = require(game.ReplicatedStorage.Quests)
        local UselessQuest = {
            "BartiloQuest",
            "Trainees",
            "MarineQuest",
            "CitizenQuest"
        }
        local function CheckQuest()
            local lvlPl = LocalPlayerLevelValue
            local min = 0
            if lvlPl >= 1450 and game.PlaceId == 4442272183 then
                Mob1 = "Water Fighter"
                Mob2 = "ForgottenQuest"
                Mob3 = 2
            elseif lvlPl >= 700 and game.PlaceId == 2753915549 then
                Mob1 = "Galley Captain"
                Mob2 = "FountainQuest"
                Mob3 = 2
            elseif
                lvlPl >= 2075 and autofullymelee and
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true) ~= 1 and
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true) == 1
             then
                Mob1 = "Posessed Mummy"
                Mob2 = "HauntedQuest2"
                Mob3 = 2
            else
                for i, v in pairs(Quest) do
                    for i1, v1 in pairs(v) do
                        local lvlreq = v1.LevelReq
                        for i2, v2 in pairs(v1.Task) do
                            if
                                lvlPl >= lvlreq and lvlreq >= min and v1.Task[i2] > 1 and
                                    not table.find(UselessQuest, tostring(i))
                             then
                                min = lvlreq
                                Mob1 = tostring(i2)
                                Mob2 = i
                                Mob3 = i1
                            end
                        end
                    end
                end
            end
        end
        function CFrameQuest()
            QuestPoses = {}
            for i, v in pairs(getnilinstances()) do
                if
                    v:IsA("Model") and v:FindFirstChild("Head") and v.Head:FindFirstChild("QuestBBG") and
                        v.Head.QuestBBG.Title.Text == "QUEST"
                 then
                    QuestPoses[v.Name] = v.Head.CFrame * CFrame.new(0, -2, 2)
                end
            end
        
            for i, v in pairs(game.Workspace.NPCs:GetDescendants()) do
                if v.Name == "QuestBBG" and v.Title.Text == "QUEST" then
                    QuestPoses[v.Parent.Parent.Name] = v.Parent.Parent.Head.CFrame * CFrame.new(0, -2, 2)
                end
            end
        
            DialoguesList = {}
            for i, v in pairs(require(game.ReplicatedStorage.DialoguesList)) do
                DialoguesList[v] = i
            end
        
            local kiet = getscriptclosure(game:GetService("Players").LocalPlayer.PlayerScripts.NPC)
        
            local listremote = {}
            for k, v in pairs(debug.getprotos(kiet)) do
                if #debug.getconstants(v) == 1 then
                    table.insert(listremote, debug.getconstant(v, 1))
                end
            end
            local start = false
            local listtvk = {}
            for k, v in pairs(debug.getconstants(kiet)) do
                if type(v) == "string" then
                    if v == "Players" then
                        start = false
                    end
                    if not start then
                        if v == "Blox Fruit Dealer" then
                            start = true
                        end
                    else
                    end
                    if start then
                        table.insert(listtvk, v)
                    end
                end
            end
            local QuestPoint1 = {}
            QuestPoint = {}
        
            for k, v in pairs(listtvk) do
                if QuestPoses[v] then
                    QuestPoint1[listremote[k]] = listtvk[k]
                end
            end
        
            for i, v in next, QuestPoint1 do
                QuestPoint[i] = QuestPoses[v]
            end
            QuestPoint["SkyExp1Quest"] =
                CFrame.new(
                -7857.28516,
                5544.34033,
                -382.321503,
                -0.422592998,
                0,
                0.906319618,
                0,
                1,
                0,
                -0.906319618,
                0,
                -0.422592998
            )
        end
        function CheckDoubleQuest()
            local a = {}
            for i, v in pairs(Quest) do
                for i1, v1 in pairs(v) do
                    local lvlreq = v1.LevelReq
                    for i2, v2 in pairs(v1.Task) do
                        if i2 == Mob1 then
                            for i3, v3 in next, v do
                                if v3.LevelReq <= game.Players.LocalPlayer.Data.Level.Value and v3.Name ~= "Town Raid" then
                                    for i4, v4 in next, v3.Task do
                                        if v4 > 1 then
                                            table.insert(a, i4)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            return a
        end
        local v17 = require(game.ReplicatedStorage:WaitForChild("GuideModule"))
        function CheckQuestData()
            for i, v in next, v17.Data do
                if i == "QuestData" then
                    return true
                end
            end
            return false
        end
        function CheckNameDoubleQuest()
            local a
            if CheckQuestData() then
                for i, v in next, v17.Data.QuestData.Task do
                    a = i
                end
            end
            return a
        end
        function CheckNameDoubleQuest2()
            local a
            local a2 = {}
            if CheckQuestData() then
                for i, v in next, v17.Data.QuestData.Task do
                    a = i
                    table.insert(a2, i)
                end
            end
            return a2
        end
        function CheckDoubleQuest2()
            CheckQuest()
            local aa = {}
            if
                game.Players.LocalPlayer.Data.Level.Value >= 10 and Config["Double Quest"] and CheckQuestData() and
                    CheckNameDoubleQuest() == Mob1 and
                    #CheckNameDoubleQuest() > 2
             then
                for i, v in pairs(Quest) do
                    for i1, v1 in pairs(v) do
                        for i2, v2 in pairs(v1.Task) do
                            if tostring(i2) == Mob1 then
                                for quest1, quest2 in next, v do
                                    for quest3, quest4 in next, quest2.Task do
                                        if quest3 ~= Mob1 and quest4 > 1 then
                                            if quest2.LevelReq <= game.Players.LocalPlayer.Data.Level.Value then
                                                aa["Name"] = tostring(quest3)
                                                aa["NameQuest"] = i
                                                aa["ID"] = quest1
                                            else
                                                aa["Name"] = Mob1
                                                aa["NameQuest"] = Mob2
                                                aa["ID"] = Mob3
                                            end
                                            return aa
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            else
                aa["Name"] = Mob1
                aa["NameQuest"] = Mob2
                aa["ID"] = Mob3
                return aa
            end
            aa["Name"] = Mob1
            aa["NameQuest"] = Mob2
            aa["ID"] = Mob3
            return aa
        end
        function MobLevel1OrMobLevel2()
            local mbb = {}
            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                if
                    not table.find(mbb, v.Name) and v:IsA("Model") and v.Name ~= "PirateBasic" and
                        not string.find(v.Name, "Brigade") and
                        v:FindFirstChild("Humanoid") and
                        v.Humanoid.Health > 0 and
                        v:FindFirstChild("HumanoidRootPart")
                 then
                    table.insert(mbb, v.Name)
                end
            end
            for i, v in pairs(mbb) do
                local b = v
                v = tostring(v:gsub(" %pLv. %d+%p", ""))
                if tostring(v) == CheckNameDoubleQuest() then
                    return tostring(b)
                end
            end
            return false
        end
        local CommF = game.ReplicatedStorage.Remotes["CommF_"]
        CFrameQuest()
        function CheckQuestCustomLevel(lvlcus)
            min = 0
            if not lvlcus then
                lvlcus = 2275
            end
            for i, v in pairs(Quest) do
                for i1, v1 in pairs(v) do
                    local lvlreq = v1.LevelReq
                    for i2, v2 in pairs(v1.Task) do
                        if lvlcus >= lvlreq and lvlreq >= min and v1.Task[i2] > 1 and not table.find(UselessQuest, tostring(i)) then
                            min = lvlreq
                            Mob1 = tostring(i2)
                            Mob2 = i
                            Mob3 = i1
                        end
                    end
                end
            end
            return Mob1, Mob2, Mob3
        end
        function CheckDoubleQuestCustom(cusz)
            Mob1, Mob2, Mob3 = CheckQuestCustomLevel(cusz)
            local aa = {}
            if
                game.Players.LocalPlayer.Data.Level.Value >= 10 and Config["Double Quest"] and CheckQuestData() and
                    CheckNameDoubleQuest() == Mob1 and
                    #CheckNameDoubleQuest() > 2
             then
                for i, v in pairs(Quest) do
                    for i1, v1 in pairs(v) do
                        for i2, v2 in pairs(v1.Task) do
                            if tostring(i2) == Mob1 then
                                for quest1, quest2 in next, v do
                                    for quest3, quest4 in next, quest2.Task do
                                        if quest3 ~= Mob1 and quest4 > 1 then
                                            if quest2.LevelReq <= game.Players.LocalPlayer.Data.Level.Value then
                                                aa["Name"] = tostring(quest3)
                                                aa["NameQuest"] = i
                                                aa["ID"] = quest1
                                            else
                                                aa["Name"] = Mob1
                                                aa["NameQuest"] = Mob2
                                                aa["ID"] = Mob3
                                            end
                                            return aa
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            else
                aa["Name"] = Mob1
                aa["NameQuest"] = Mob2
                aa["ID"] = Mob3
                return aa
            end
            aa["Name"] = Mob1
            aa["NameQuest"] = Mob2
            aa["ID"] = Mob3
            return aa
        end
        function GetQuest()
            if game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible then
                return
            end 
            UpdateTPCFrame()
            if not QuestPoint[tostring(CheckDoubleQuest2().NameQuest)] then
                CFrameQuest()
                return
            end
            MMBStatus = "Claiming Quest"
            if
                (QuestPoint[CheckDoubleQuest2().NameQuest].Position -
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
             then
                CommF:InvokeServer("StartQuest", tostring(CheckDoubleQuest2().NameQuest), CheckDoubleQuest2().ID)
            else
                QuestCFrame = QuestPoint[CheckDoubleQuest2().NameQuest]
                Tweento(QuestCFrame)
            end
        end
        function GetQuestCustom(lvlcustom)
            if game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible then
                return
            end
            if not QuestPoint[tostring(CheckDoubleQuestCustom(lvlcustom).NameQuest)] then
                CFrameQuest()
                return
            end
            MMBStatus = "Claiming Quest"
            if
                (QuestPoint[CheckDoubleQuestCustom(lvlcustom).NameQuest].Position -
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
             then 
                CommF:InvokeServer(
                    "StartQuest",
                    tostring(CheckDoubleQuestCustom(lvlcustom).NameQuest),
                    CheckDoubleQuestCustom(lvlcustom).ID
                )
                wait(2.2)
            else
                QuestCFrame = QuestPoint[CheckDoubleQuestCustom(lvlcustom).NameQuest]
                Tweento(QuestCFrame)
                wait(0.75)
            end
        end
        function GetMob()
            local tablegetmob = {}
            for i, v in pairs(game.Workspace.MobSpawns:GetChildren()) do
                if not table.find(tablegetmob, v.Name) then
                    table.insert(tablegetmob, v.Name)
                end
            end
            if string.find(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()[1].Name, "Lv.") then
                for i, v in pairs(tablegetmob) do
                    local b = v
                    v = tostring(v:gsub(" %pLv. %d+%p", ""))
                    if v == CheckNameDoubleQuest() then
                        return b
                    end
                end
            else
                return CheckNameDoubleQuest()
            end
        end
        local MBLVSKIP = {"Royal Squad [Lv. 525]", "Shanda [Lv. 475]"}
        for i, v in pairs(MBLVSKIP) do
            MBLVSKIP[i] = RemoveLevelTitle(v)
        end
        function MobLevelSkip()
            for i, v in next, game.workspace.Enemies:GetChildren() do
                if
                    v:IsA("Model") and table.find(MBLVSKIP, RemoveLevelTitle(v.Name)) and v:FindFirstChild("HumanoidRootPart") and
                        v.Humanoid.Health > 0
                 then
                    return v.Name
                end
            end
        end
        local Settings2 = {}
        local SaveFileName2 = "!Blacklist_Servers.json"
        
        function SaveSettings2()
            local HttpService = game:GetService("HttpService")
            if not isfolder("Tsuo Hub") then
                makefolder("Tsuo Hub")
            end
            writefile("Tsuo Hub/" .. SaveFileName2, HttpService:JSONEncode(Settings2))
        end
        
        function ReadSetting2()
            local s, e =
                pcall(
                function()
                    local HttpService = game:GetService("HttpService")
                    if not isfolder("Tsuo Hub") then
                        makefolder("Tsuo Hub")
                    end
                    return HttpService:JSONDecode(readfile("Tsuo Hub/" .. SaveFileName2))
                end
            )
            if s then
                return e
            else
                SaveSettings2()
                return ReadSetting2()
            end
        end
        function CheckX2Exp()
            a2, b2 =
                pcall(
                function()
                    if LocalPlayerLevelValue < 2450 then
                        if string.find(game.Players.LocalPlayer.PlayerGui.Main.Level.Exp.Text, "ends in") then
                            return true
                        end
                    end
                end
            )
            if a2 then
                return b2
            end
        end
        lessfoundAnything = ""
        function HopLow()
            if lessfoundAnything == "" then
                SiteHopServerLess =
                    game.HttpService:JSONDecode(
                    game:HttpGet(
                        "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
                    )
                )
            else
                SiteHopServerLess =
                    game.HttpService:JSONDecode(
                    game:HttpGet(
                        "https://games.roblox.com/v1/games/" ..
                            game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. lessfoundAnything
                    )
                )
            end
            if
                SiteHopServerLess.nextPageCursor and SiteHopServerLess.nextPageCursor ~= "null" and
                    SiteHopServerLess.nextPageCursor ~= nil
             then
                lessfoundAnything = SiteHopServerLess.nextPageCursor
            end
            for i, v in pairs(SiteHopServerLess.data) do
                if v.playing and tonumber(v.playing) <= 4 and v.id ~= game.JobId then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(
                        game.PlaceId,
                        tostring(v.id),
                        game.Players.LocalPlayer
                    )
                end
            end
        end
        Settings2 = ReadSetting2()
        getgenv().TimeTryHopLow = 0
        function HopServer(CountTarget, hoplowallow)
            if hoplowallow and Config["HopLowOption"] and getgenv().TimeTryHopLow < 3 then
                CreateUiNotify({
                    Content = "Trying Hop Low"
                })        for i = 1, 3 - getgenv().TimeTryHopLow do
                    if getgenv().TimeTryHopLow < 3 then
                        CreateUiNotify({
                            Content = "Hop Low Time: " .. getgenv().TimeTryHopLow .. "...."
                        })
                        HopLow()
                        getgenv().TimeTryHopLow = getgenv().TimeTryHopLow + 1
                    end
                end
            end
            if not CountTarget then
                CountTarget = 10
            end
            if not Config["Hop Delay"] or type(Config["Hop Delay"]) ~= "number" then
                Config["Hop Delay"] = 0
            end
            ticklon = tick()
            CreateGameNotify("Waitting: " .. tostring(Config["Hop Delay"] .. "s to hop server.."))
            pcall(
                function()
                    repeat
                        task.wait()
                    until tick() - ticklon >= Config["Hop Delay"]
                end
            )
            local function Hop()
                Notify("Script Status", "Finding Server...\nTarget Count: " .. CountTarget, 5)
                for i = 1, 100 do
                    if ChooseRegion == nil or ChooseRegion == "" then
                        ChooseRegion = "Singapore"
                    else
                        game:GetService("Players").LocalPlayer.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text =
                            ChooseRegion
                    end
                    local huhu = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(i)
                    for k, v in pairs(huhu) do
                        if k ~= game.JobId and v["Count"] < CountTarget then
                            if not Settings2[k] or tick() - Settings2[k].Time > 60 * 10 then
                                Settings2[k] = {
                                    Time = tick()
                                }
                                SaveSettings2()
                                if
                                    game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Bottom.Visible and
                                        game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible
                                 then
                                    Notify("Script Status", "Founded Server But InCombat", 15)
                                    repeat
                                        wait()
                                        AntiLowHealthting = true
                                        AntiLowHealth(math.random(8500, 10000))
                                    until not game:GetService("Players").LocalPlayer or
                                        (not game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Bottom.Visible and
                                            not game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible)
                                    AntiLowHealthting = false
                                    Notify("Script Status", "Joining Server ID: " .. k .. "\nRegion: " .. v["Region"], 15)
                                else
                                    Notify("Script Status", "Joining Server ID: " .. k .. "\nRegion: " .. v["Region"], 15)
                                end
                                game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", k)
                                return true
                            elseif tick() - Settings2[k].Time > 60 * 60 then
                                Settings2[k] = nil
                            end
                        end
                    end
                end
                return false
            end
            while task.wait() do
                spawn(
                    function()
                        Hop()
                    end
                )
                task.wait(5)
            end
            SaveSettings2()
            if not getgenv().Loaded then
                local function child(v)
                    if v.Name == "ErrorPrompt" then
                        if v.Visible then
                            if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                                HopServer()
                                v.Visible = false
                            end
                        end
                        v:GetPropertyChangedSignal("Visible"):Connect(
                            function()
                                if v.Visible then
                                    if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                                        HopServer()
                                        v.Visible = false
                                    end
                                end
                            end
                        )
                    end
                end
                for k, v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
                    child(v)
                end
                game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(child)
            end
        end
        ---------- Checking Functions ----------- 
        MySea = "Sea "
        local placeId = game.PlaceId
        if placeId == 2753915549 then
            Sea1 = true
            Sea2 = false
            Sea3 = false 
            MySea = "Sea 1"
        elseif placeId == 4442272183 then
            Sea2 = true
            Sea1 = false
            Sea3 = false
            MySea = "Sea 2"
        elseif placeId == 7449423635 then
            Sea3 = true
            Sea1 = false
            Sea2 = false
            MySea = "Sea 3"
        end
        task.spawn(
            function()
                while task.wait() do
                    if game.PlaceId == 2753915549 then
                        Sea1 = true
                        Sea2 = false
                        Sea3 = false 
                        MySea = "Sea 1"
                    elseif game.PlaceId == 4442272183 then
                        Sea2 = true
                        Sea1 = false
                        Sea3 = false
                        MySea = "Sea 2"
                    elseif game.PlaceId == 7449423635 then
                        Sea3 = true
                        Sea1 = false
                        Sea2 = false
                        MySea = "Sea 3"
                    end
                end
            end
        )
        function AddStats(st, pb, pb2)
            adb, adb2 =
                pcall(
                function()
                    if pb and pb2 then
                        pb = pb2 - pb
                    end
                    if not pb then
                        pb = 1
                    end
                    local args = {
                        [1] = "AddPoint",
                        [2] = st,
                        [3] = pb
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            )
            if not adb then
                print("add stat", adb2)
            end
        end
        task.spawn(
            function()
                while task.wait() do
                    if Config["Stats Table"] then
                        if not Config["Stats Table"]["Cuttay Method"] then
                            for i, v in pairs(Config["Stats Table"]) do
                                if v then
                                    local args = {
                                        [1] = "AddPoint",
                                        [2] = i,
                                        [3] = 3
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                            end
                        else
                            pcall(
                                function()
                                    Stats_Melee = game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value
                                end
                            )
                            pcall(
                                function()
                                    Stats_Def = game:GetService("Players").LocalPlayer.Data.Stats["Defense"].Level.Value
                                end
                            )
                            pcall(
                                function()
                                    Stats_DF = game:GetService("Players").LocalPlayer.Data.Stats["Demon Fruit"].Level.Value
                                end
                            )
                            pcall(
                                function()
                                    Stats_Gun = game:GetService("Players").LocalPlayer.Data.Stats.Gun.Level.Value
                                end
                            )
                            pcall(
                                function()
                                    Stats_Sword = game:GetService("Players").LocalPlayer.Data.Stats.Sword.Level.Value
                                end
                            )
                            if Stats_Melee < 2450 then
                                AddStats("Melee", Stats_Melee, 2450)
                            elseif Stats_Def < 1800 then
                                AddStats("Defense", Stats_Def, 1800)
                            elseif Stats_Sword < 1000 then
                                AddStats("Sword", Stats_Sword, 1000)
                            else
                                AddStats("Demon Fruit", Stats_DF, 2450)
                            end
                        end 
                    end
                    if Config["Auto Awake"] then 
                        local v302 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Awakener", "Check")
                        if not v302 or v302 == 0 or v302 == 1 then
                            wait()
                        else
                            if v302.Cost <= LocalPlayerFragmentValue and not CheckIsRaiding() then
                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Awakener", "Awaken")
                            end
                        end
                    end
                    if Config["Auto Raid"] and not Sea1 then
                        if CheckIsRaiding() or game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true or getNextIsland() then 
                            repeat
                                wait()
                                MMBStatus = "Doing Raid"
                                pcall(
                                    function()
                                        if getNextIsland() then
                                            spawn(
                                                function()
                                                    pcall(
                                                        function()
                                                            Tweento(getNextIsland().CFrame * CFrame.new(0, 60, 0))
                                                        end
                                                    )
                                                end
                                            )
                                        end
                                        spawn(
                                            function()
                                                KillAura()
                                            end
                                        )
                                    end
                                )
                            until not Config["Auto Raid"] or not CheckIsRaiding()
                            if tween then
                                tween:Cancel()
                            end  
                            wait(10)
                            if not CheckIsRaiding() then
                                MMBStatus = "Raid Done"
                            end 
                        elseif not CheckTool("Special Microchip") then 
                            if not GetFruitInCharacter(true) then
                                BoughtChip =
                                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(
                                    "RaidsNpc",
                                    "Select",
                                    Config["Raid Selected"]
                                ) == 1
                            end
                            
                            if BoughtChip then
                                MMBStatus = "Bought Raid Chip"
                                raidtick = tick()
                                repeat
                                    task.wait()
                                until tick() - raidtick >= 60 or not Config["Auto Raid"] or
                                    (CheckIsRaiding() or game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true or
                                        getNextIsland())
                            elseif not BoughtChip then
                                pcall(
                                    function()
                                        if
                                            Config["Auto Get Fruit Below 1M To Raid"] and not GetFruitInCharacter() and
                                                Config["Raid Selected"] ~= "Dough"
                                         then
                                            if GetFruit1MtoRaid() then
                                            else
                                                wait(10)
                                            end
                                        end
                                    end
                                )
                            end 
                        end
                    end
                end
            end
        )
        ------------------------------------------------ MAIN FARM ---------------------  
        task.spawn(function()
            require(game.ReplicatedStorage.Util.CameraShaker):Stop()
            game.ReplicatedStorage.Assets.GUI.DamageCounter.Enabled = false
            game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true
        end)
        local AutoTp
        local TpCFrame 
        function UpdateTPCFrame(FF)
            FF = FF or {}
            FF.CFrame = FF.CFrame or nil 
            FF.Enable = FF.Enable or false 
            AutoTp = FF.Enable 
            TpCFrame = FF.CFrame
        end
        spawn(
            function()
                while wait() do
                    if AutoTp and TpCFrame then
                        pcall(
                            function()
                                if
                                    (TpCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                                        300
                                 then
                                    pcall(
                                        function()
                                            Tweento(TpCFrame)
                                        end
                                    )
                                else
                                    pcall(
                                        function()
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TpCFrame
                                            Tweento(TpCFrame)
                                        end
                                    )
                                end
                            end
                        )
                    end
                end
            end
        )
        ALLCHECK_Func = {
            ["Auto CDK"] = function()
                return CheckQuestCDK() ~= "None"
            end,  
            ["Auto Soul Guitar"] = function()
                if CheckQuestSoulGuitar() or Config["SoulGuitarStatus"] then 
                    return true 
                end
            end,
            ["Auto Raid"] = function() 
                if CheckTool("Special Microchip") then  
                    return true  
                elseif CheckIsRaiding() then return true 
                end
            end,
            ["Auto Find Fruit"] = function()
                CF = {}
                if Config["Ignore Stored Fruit"] then 
                    CF.Ignore = true 
                end
                if GetFruitInWorkSpace(CF) then 
                    return true 
                end
            end,
            ["Auto Dough King"] = function()
                if CheckBoss("Dough King") then 
                    return true 
                else
                    if CheckTool("Sweet Chalice") then 
                        return true 
                    else
                        if CheckMaterialCount("Conjured Cocoa") > 10 then 
                            if CheckTool("God's Chalice") then 
                                return true 
                            else
                                if CheckElite() then 
                                    return true 
                                elseif Config["Auto Dough King Hop"] then 
                                    return true 
                                end
                            end  
                        else 
                            return true 
                        end
                    end
                end
            end,    
            ["Auto Yama"] = function() 
                if not yamagate then yamagate = CheckItem("Yama") end 
                if yamagate then return false end 
                if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then
                    return true 
                end
            end,
            ["Auto Tushita"] = function()
                if not gatetushita then 
                    gatetushita = CheckTushitaGate() and CheckItem("Tushita")
                else
                    return false 
                end
                if gatetushita then return false end 
                if CheckTushitaGate() and CheckBoss("Longma [Lv. 2000] [Boss]") then
                    return true 
                elseif not CheckTushitaGate() then 
                    if CheckBoss("rip_indra True Form [Lv. 5000] [Raid Boss]") then
                        return true
                    elseif Config["Auto Tushita Hop"] and (not Config["Auto Elite"] or (Config["Auto Elite"] and not CheckElite())) then
                        return true
                    end 
                end
            end, 
            ["Auto Ghost Ship"] = function()
                if CheckPirateBoat() then 
                    return true 
                end
            end,
            ["Auto Sail"] = function()
                if LocalPlayerBeliValue > 2500 then 
                    return true 
                end
            end,
            ["Auto Shark & Mobs"] = function()
                if GetNMob() then 
                    getgenv().ForgotSit = false
                    return true 
                end
            end,
            ["Auto Rip Indra"] = function() 
                if CheckBoss("rip_indra True Form [Lv. 5000] [Raid Boss]") then
                    return true 
                elseif not CheckBoss("rip_indra True Form [Lv. 5000] [Raid Boss]") then
                    if CheckTool("God's Chalice") then
                        if CheckDoneColor() then
                            return true 
                        else 
                            concho = {
                                ["Hot pink"] = "Winter Sky",
                                ["Really red"] = "Pure Red",
                                ["Oyster"] = "Snow White"
                            }
                            for i, v in pairs(CheckColorRipIndra()) do
                                kss = ActivateColor(i)
                                if kss ~= "Cant" then
                                    return true  
                                end 
                            end
                        end
                    end
                end
            end,
            ["Auto Elite"] = function() 
                if CheckMob(Elites, true) then return CheckMob(Elites, true) end
                if Config["Auto Elite Hop"] then return true end
            end,
            ["Kill Trial Players"] = function()  
                if GetPlayerKillTrial() then
                    EquipWeapon()
                    EnableBuso()
                    spawn(
                        function()
                            if not CheckKen() then
                                SendKey("E", 0.5)
                            end
                        end
                    )
                    return true
                end
            end,
            ["Auto Trial Stage 1"] = function()
                local TheMazePoint
                local FinishPart 
                local StrengthPart 
                local GhoulhPart =
                    CFrame.new(
                    -11706.6777,
                    10011.5615,
                    11.6579161,
                    0.54723686,
                    -2.79323835e-08,
                    -0.83697778,
                    2.69866494e-08,
                    1,
                    -1.57283679e-08,
                    0.83697778,
                    -1.3980082e-08,
                    0.54723686
                )
                check,data = pcall(function()
                    TheMazePoint = game:GetService("Workspace").StartPoint 
                end)  
                check,data = pcall(function()
                    FinishPart = game:GetService("Workspace").Map.SkyTrial.Model.FinishPart
                end)  
                check,data = pcall(function()
                    StrengthPart = game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Strength"].CFrame
                end) 
                CyborgBypassCFrame =
                    CFrame.new(
                    -20021.8691,
                    10090.4893,
                    -16.37994,
                    -0.976144373,
                    6.71342875e-08,
                    -0.217122361,
                    8.46145412e-08,
                    1,
                    -7.1212007e-08,
                    0.217122361,
                    -8.78849065e-08,
                    -0.976144373
                )  
                if GetDistance(CyborgBypassCFrame) < 2000 then 
                    return true  
                elseif TheMazePoint and GetDistance(TheMazePoint) < 2000 then 
                    return true 
                elseif FinishPart and GetDistance(FinishPart) < 2000 then  
                    return true 
                elseif GetSeaBeastTrial() and GetDistance(GetSeaBeastTrial().HumanoidRootPart) < 2000 and GetDistance(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Water")) < 200 then  
                    return true 
                elseif StrengthPart and GetDistance(StrengthPart) < 2000 then  
                    return true  
                elseif GetDistance(GhoulhPart) < 2000 then 
                    return true 
                end
            end,
            ["Farm Normal"] = function()
                if Config["Farm Normal"] and Config["Farm Type"] then
                    CountType = 0
                    for i, v in pairs(Config["Farm Type"]) do
                        if v then
                            CountType = CountType + 1
                        end
                    end
                    if Config["Farm Type"]["Level"] and (CountType <= 1 or (CountType >= 2 and LocalPlayerLevelValue < 2450)) then
                        return true
                    elseif Config["Farm Type"]["Cake Prince"] and Sea3 then
                        return true
                    elseif Config["Farm Type"]["Bone"] and Sea3 then
                        return true
                    elseif Config["Farm Type"]["Ectoplasm"] and Sea2 then
                        return true
                    end
                end
            end,
            ["Boss Farm"] = function()
                if Config["Selected Boss"] then
                    bossmm = false
                    for i, v in pairs(Config["Selected Boss"]) do
                        if CheckMob({i}, true) then
                            bossmm = true 
                        elseif Config["Hop Boss"] then
                            bossmm = true 
                        end
                    end
                    return bossmm
                end
            end,
            ["Auto Sea Beast"] = function()
                if not checkseabeast() and not CheckPirateBoat() and Config["Buy Boat"] then 
                    AutoSeaBeast = true
                    getgenv().ForgotSit = false
                    return true 
                elseif checkseabeast() then  
                    AutoSeaBeast = true
                    getgenv().ForgotSit = false
                    return true 
                elseif CheckPirateBoat() then  
                    AutoSeaBeast = true
                    getgenv().ForgotSit = false
                    return true  
                end
                AutoSeaBeast = false
            end,
            ["Auto Choose Gear"] = function()
                return CanChoosePoint()
            end,
            ["Auto Mirage Puzzle"] = function()
                if not Sea3 then return end 
                if CheckIsRaiding() then return end 
                if not MirrorFractal then
                    MirrorFractal = CheckItem("Mirror Fractal")
                end
                if not Valk then
                    Valk = CheckItem("Valkyrie Helm")
                end
                if Valk and MirrorFractal then
                    local v213 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") 
                    if v213 == 1 or v213 == 2 or v213 == 3 then return true 
                    elseif IsMirageIsland() and not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then 
                        return true 
                    end
                else  
                    return
                end
            end,
            ["Auto Upgrade Race"] = function()
                if Sea2 then 
                    local nig = CheckUpgradeRace()
                    if nig and nig ~= "Has V3/V4" then  
                        pcall(function()
                            local args = {
                                [1] = "Wenlocktoad",
                                [2] = "3"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end)
                        return true 
                    end
                end
            end
        }
        ALLCHECK = {}
        task.spawn(
            function()
                while task.wait() do
                    for i, v in pairs(ALLCHECK_Func) do
                        if Config[i] then
                            ALLCHECK[i] = v()
                        else
                            ALLCHECK[i] = false
                        end
                    end
                end
            end
        ) 
        task.spawn(function()
            while task.wait(3) do 
                if Config["Auto Random Fruit"] then 
                    RandomFruit()
                end
            end
        end)
        task.spawn(function()
            while task.wait() do 
                if Config["Auto Store Fruit"] then 
                    pcall(
                    function()
                            StoreDFInPath(game.Players.LocalPlayer.Backpack)
                        end
                    )
                    pcall(
                        function()
                            StoreDFInPath(game.Players.LocalPlayer.Character)
                        end
                    )
                end 
                if Config["Auto Buy Gear"] and Sea3 then 
                    BuyGear()
                end
                if Config["Auto Roll Bone"] and Sea3 then 
                    pcall(
                        function()
                            local v316, v317, v318, v319 =
                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Check")
                            if v318 > 0 then
                                canrolltime = 0
                                for i = 1, v318,1 do
                                    if v316 >= i * 50 then
                                        canrolltime = canrolltime + 1
                                    end
                                end
                                for i = 1, canrolltime do
                                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                                end
                                CreateUiNotify({
                                    Content = "Randomed Time: "..tostring(canrolltime)
                                })
                            end
                        end
                    ) 
                end
            end
        end)
        ALL_FUNC = {   
            ["Auto Soul Guitar"] = function()
                AutoSoulGuitar()
            end,    
            ["Auto CDK"] = function()
                AutoCDK()
            end, 
            ["Auto Ghost Ship"] = function()
                if CheckPirateBoat() then 
                    KillBoat(CheckPirateBoat()) 
                end
            end,
            ["Auto Raid"] = function() 
                if CheckTool("Special Microchip") and not CheckIsRaiding() and not getNextIsland() then  
                    if Sea2 then
                        fireclickdetector(Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                    elseif Sea3 then
                        fireclickdetector(Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                    end 
                    repeat
                        spawn(
                            function()
                                pcall(
                                    function()
                                        tween:Cancel()
                                    end
                                )
                            end
                        )
                        task.wait()
                        if not getNextIsland() then
                            if Sea3 then
                                if
                                    (Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125) -
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 500
                                 then
                                    requestEntrance(
                                        Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125)
                                    )
                                end
                            elseif Sea2 then
                                if
                                    (Vector3.new(923.21252441406, 126.9760055542, 32852.83203125) -
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 500
                                 then
                                    requestEntrance(Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                                end
                            end
                        end
                        DoNotTweenInThisTime = true
                        task.wait(0.1)
                    until not game.Players.LocalPlayer or not Config["Auto Raid"] or
                        game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible 
                    DoNotTweenInThisTime = false
                elseif CheckIsRaiding() then 
                    repeat  
                        wait(10)
                    until not game.Players.LocalPlayer or not Config["Auto Raid"] or not CheckIsRaiding()
                end
            end,
            ["Auto Find Fruit"] = function()
                CF = {}
                if Config["Ignore Stored Fruit"] then 
                    CF.Ignore = true 
                end
                if GetFruitInWorkSpace(CF) then 
                    if GetFruitInWorkSpace(CF).Parent == workspace then 
                        Tweento(GetFruitInWorkSpace(CF).Handle.CFrame)
                        if GetDistance(GetFruitInWorkSpace(CF).Handle) < 10 then 
                            SendKey("Space",.5)
                        end
                    end
                end
            end,
            ["Auto Dough King"] = function()
                if CheckBoss("Dough King") then 
                    KillMobNotInWorkSpace("Dough King")
                else
                    if CheckTool("Sweet Chalice") then 
                        MobsCakePrince = {
                            "Cookie Crafter [Lv. 2200]",
                            "Cake Guard [Lv. 2225]",
                            "Baking Staff [Lv. 2250]",
                            "Head Baker [Lv. 2275]"
                        }
                        Target = CheckMob(MobsCakePrince)
                        TargetSpawn = GetListMobSpawn(MobsCakePrince)
                        if Target then
                            KillMob(Target)
                        elseif TargetSpawn then
                            for i, v in pairs(TargetSpawn) do
                                if not CheckMob(MobsCakePrince) then
                                    Tweento(v.CFrame * CFrame.new(0, 15, 0))
                                end
                            end
                        end
                    else
                        if CheckMaterialCount("Conjured Cocoa") > 10 then 
                            if CheckTool("God's Chalice") then 
                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
                            else
                                if CheckElite() then 
                                    if
                                    not string.find(
                                        game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                        CheckElite().Name:gsub(" %pLv. %d+%p", "")
                                    ) or
                                        not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                    then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                            "AbandonQuest"
                                        )
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                            "EliteHunter"
                                        ) 
                                    else
                                        KillMobNotInWorkSpace(CheckElite())
                                    end
                                elseif Config["Auto Dough King Hop"] then 
                                    HopServer(10,true) 
                                end
                            end  
                        else 
                            CocoaMobs = {
                                "Cocoa Warrior [Lv. 2300]",
                                "Chocolate Bar Battler [Lv. 2325]"
                            } 
                            Target = CheckMob(CocoaMobs)
                            TargetSpawn = GetListMobSpawn(CocoaMobs)
                            if Target then
                                KillMob(Target)
                            elseif TargetSpawn then
                                for i, v in pairs(TargetSpawn) do
                                    if not CheckMob(CocoaMobs) then
                                        Tweento(v.CFrame * CFrame.new(0, 15, 0))
                                    end
                                end
                            end
                        end
                    end
                end
            end,  
            ["Auto Yama"] = function() 
                if not yamagate then yamagate = CheckItem("Yama") end 
                if yamagate then return false end 
                if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then
                    if GetDistance(game.Workspace.Map.Waterfall.SealedKatana.Handle.CFrame) > 50 then
                        Tweento(game.Workspace.Map.Waterfall.SealedKatana.Handle.CFrame * CFrame.new(0, 20, 0))
                    else
                        repeat task.wait()
                            KillAura() 
                        until not game.Workspace.Enemies:FindFirstChild("Ghost [Lv. 1500]")
                        if not game.Workspace.Enemies:FindFirstChild("Ghost [Lv. 1500]") then
                            fireclickdetector(game.Workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
                        end
                    end   
                end
            end,
            ["Auto Tushita"] = function()
                if not gatetushita then 
                    gatetushita = CheckTushitaGate() and CheckItem("Tushita")
                else
                    return false 
                end
                if gatetushita then return false end 
                if CheckTushitaGate() and CheckBoss("Longma [Lv. 2000] [Boss]") then
                    KillMobNotInWorkSpace("Longma [Lv. 2000] [Boss]")
                elseif not CheckTushitaGate() then 
                    if CheckBoss("rip_indra True Form [Lv. 5000] [Raid Boss]") then
                        if CheckTool("Holy Torch") then
                            EquipWeaponName("Holy Torch")
                            if CheckTorchTushita() then
                                Tweento(CheckTorchTushita().CFrame)
                            end
                        else
                            Tweento(game:GetService("Workspace").Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox.CFrame)
                            wait(1)
                        end
                    elseif Config["Auto Tushita Hop"] and (not Config["Auto Elite"] or (Config["Auto Elite"] and not CheckElite())) then
                        HopServer(10)
                    end 
                end
            end,
            ["Auto Sail"] = function()
                SailBoat()
            end, 
            ["Auto Shark & Mobs"] = function()
                if GetNMob() then 
                    KillMob(GetNMob())
                end
            end,
            ["Auto Rip Indra"] = function() 
                if CheckBoss("rip_indra True Form [Lv. 5000] [Raid Boss]") then
                    repeat task.wait()
                        KillMobNotInWorkSpace(CheckBoss("rip_indra True Form [Lv. 5000] [Raid Boss]")) 
                    until not Config["Auto Rip Indra"] or not CheckBoss("rip_indra True Form [Lv. 5000] [Raid Boss]")
                elseif not CheckBoss("rip_indra True Form [Lv. 5000] [Raid Boss]") then
                    if CheckTool("God's Chalice") then
                        if CheckDoneColor() then
                            EquipWeaponName("God's Chalice")
                            Tweento(game:GetService("Workspace").Map["Boat Castle"].Summoner.Detection.CFrame)
                            wait(1)
                        else 
                            concho = {
                                ["Hot pink"] = "Winter Sky",
                                ["Really red"] = "Pure Red",
                                ["Oyster"] = "Snow White"
                            }
                            AutoActiveColorRip_Indra()
                        end
                    end
                end
            end,
            ["Auto Elite"] = function() 
                if CheckMob(Elites, true) or Config["Auto Elite Hop"] then 
                    if CheckMob(Elites, true) then
                        repeat
                            if
                                not string.find(
                                    game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                    CheckMob(Elites, true).Name:gsub(" %pLv. %d+%p", "")
                                ) or
                                    not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "AbandonQuest"
                                )
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "EliteHunter"
                                )
                            else
                                KillMobNotInWorkSpace(CheckMob(Elites, true))
                            end
                        until not Config["Auto Elite"] or not CheckMob(Elites, true)            
                    elseif Config["Auto Elite Hop"] then 
                        CreateUiNotify({
                            Content = "Hopping for elites",
                            Duration = 30
                        })
                        HopServer(10,true)
                    end
                end
            end,
            ["Kill Trial Players"] = function()
                if GetPlayerKillTrial() then 
                    pcall(
                        function()
                            Stats_Melee = game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value
                        end
                    )
                    pcall(
                        function()
                            Stats_DF =
                                game:GetService("Players").LocalPlayer.Data.Stats["Demon Fruit"].Level.Value
                        end
                    )
                    pcall(
                        function()
                            Stats_Gun = game:GetService("Players").LocalPlayer.Data.Stats.Gun.Level.Value
                        end
                    )
                    pcall(
                        function()
                            Stats_Sword = game:GetService("Players").LocalPlayer.Data.Stats.Sword.Level.Value
                        end
                    )
                    SETNERD = {}
                    pcall(
                        function()
                            if Stats_Melee and Stats_Melee > 1 then
                                SETNERD["Melee"] = true
                            end
                            if Stats_DF and Stats_DF > 1 then
                                SETNERD["Devil Fruit"] = true
                            end
                            if Stats_Sword and Stats_Sword > 1 then
                                SETNERD["Sword"] = true
                            end
                            if Stats_Gun and Stats_Gun > 1 then
                                SETNERD["Gun"] = true
                            end
                        end
                    )   
                    UseWeapon_Dropdown:Set(SETNERD) 
                    UseSkills_Dropdown:Set({
                        ["Z"] = true,
                        ["X"] = true,
                        ["C"] = true,
                        ["V"] = true,
                        ["F"] = true
                    })
                    repeat task.wait()  
                        pcall(
                            function()
                                v = GetPlayerKillTrial().Character
                                AimbotDiThangNgu = true
                                AimBotSkillPosition = GetPlayerKillTrial().Character.HumanoidRootPart.Position 
                                Tweento(GetPlayerKillTrial().Character.HumanoidRootPart.CFrame * GetCFrameADD()) 
                                if GetDistance(GetPlayerKillTrial().Character.HumanoidRootPart) < 300 then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                        GetPlayerKillTrial().Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 3)
                                    UseFastAttack = true
                                    if GetDistance(GetPlayerKillTrial().Character.HumanoidRootPart) < 50 then 
                                        autospamskill = true
                                    else
                                        autospamskill = false
                                    end
                                else
                                    UseFastAttack = false
                                    autospamskill = false
                                    Tweento(
                                        GetPlayerKillTrial().Character.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                    )
                                end
                                if game.Players.LocalPlayer.Character.Stun.Value ~= 0 then
                                    autospamskill = false
                                    CS = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                        CFrame.new(CS.X, CS.Y + 100, CS.Z)
                                    NoClip = true
                                    task.wait(5)
                                end
                            end
                        )
                    until not Config["Kill Trial Players"] or
                            (not GetPlayerKillTrial() or v.Name ~= GetPlayerKillTrial().Name) or
                            not game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible or
                            not v or
                            not v.Parent or
                            not v:FindFirstChild("Humanoid") or
                            not v:FindFirstChild("HumanoidRootPart") or
                            v.Humanoid.Health <= 0
                        UseFastAttack = false
                        autospamskill = false
                        AimBotSkillPosition = nil
                        AimbotDiThangNgu = false
                end
            end,
            ["Auto Trial Stage 1"] = function() 
                local TheMazePoint
                local FinishPart 
                local StrengthPart 
                local GhoulhPart =
                    CFrame.new(
                    -11706.6777,
                    10011.5615,
                    11.6579161,
                    0.54723686,
                    -2.79323835e-08,
                    -0.83697778,
                    2.69866494e-08,
                    1,
                    -1.57283679e-08,
                    0.83697778,
                    -1.3980082e-08,
                    0.54723686
                )
                check,data = pcall(function()
                    TheMazePoint = game:GetService("Workspace").StartPoint 
                end)  
                check,data = pcall(function()
                    FinishPart = game:GetService("Workspace").Map.SkyTrial.Model.FinishPart
                end)  
                check,data = pcall(function()
                    StrengthPart = game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Strength"].CFrame
                end) 
                CyborgBypassCFrame =
                    CFrame.new(
                    -20021.8691,
                    10090.4893,
                    -16.37994,
                    -0.976144373,
                    6.71342875e-08,
                    -0.217122361,
                    8.46145412e-08,
                    1,
                    -7.1212007e-08,
                    0.217122361,
                    -8.78849065e-08,
                    -0.976144373
                ) 
                if GetDistance(CyborgBypassCFrame) < 2000 then 
                    repeat 
                        if GetDistance(CyborgBypassCFrame) < 300 then 
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CyborgBypassCFrame
                        else
                            Tweento(CyborgBypassCFrame)  
                        end  
                        task.wait(1)
                    until not Config["Auto Trial Stage 1"] or GetDistance(CyborgBypassCFrame) > 2000
                elseif TheMazePoint and GetDistance(TheMazePoint) < 2000 then 
                    repeat 
                        if GetDistance(TheMazePoint) < 300 then 
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TheMazePoint.CFrame
                        else
                            Tweento(TheMazePoint.CFrame)  
                        end 
                        if GetDistance(TheMazePoint) < 50 then 
                            firetouchinterest(TheMazePoint, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                            firetouchinterest(TheMazePoint, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                        end
                        task.wait(1)
                    until not Config["Auto Trial Stage 1"] or GetDistance(TheMazePoint) > 2000 
                elseif FinishPart and GetDistance(FinishPart) < 2000 then  
                    repeat 
                        if GetDistance(FinishPart) < 300 then 
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TheMazePoint.CFrame
                        else
                            Tweento(FinishPart.CFrame)  
                        end 
                        if GetDistance(FinishPart) < 50 then 
                            firetouchinterest(FinishPart, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                            firetouchinterest(FinishPart, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                        end
                        task.wait(1)
                    until not Config["Auto Trial Stage 1"] or GetDistance(FinishPart) > 2000 
                elseif GetSeaBeastTrial() and GetDistance(GetSeaBeastTrial().HumanoidRootPart) < 2000 and GetDistance(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Water")) < 1500 then   
                    pcall(
                        function()
                            Stats_Melee =
                                game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value
                        end
                    )
                    pcall(
                        function()
                            Stats_DF =
                                game:GetService("Players").LocalPlayer.Data.Stats["Demon Fruit"].Level.Value
                        end
                    )
                    pcall(
                        function()
                            Stats_Gun = game:GetService("Players").LocalPlayer.Data.Stats.Gun.Level.Value
                        end
                    )
                    pcall(
                        function()
                            Stats_Sword =
                                game:GetService("Players").LocalPlayer.Data.Stats.Sword.Level.Value
                        end
                    )
                    SETNERD = {}
                    pcall(
                        function()
                            if Stats_Melee and Stats_Melee > 1 then
                                SETNERD["Melee"] = true
                            end
                            if Stats_DF and Stats_DF > 1 then
                                SETNERD["Devil Fruit"] = true
                            end
                            if Stats_Sword and Stats_Sword > 1 then
                                SETNERD["Sword"] = true
                            end
                            if Stats_Gun and Stats_Gun > 1 then
                                SETNERD["Gun"] = true
                            end
                        end
                    )  
                    UseWeapon_Dropdown:Set(SETNERD)
                    UseSkills_Dropdown:Set({
                        ["Z"] = true,
                        ["X"] = true,
                        ["C"] = true,
                        ["V"] = true,
                        ["F"] = true
                    })
                    repeat task.wait()  
                        pcall(function()
                            if GetDistance(GetSeaBeastTrial().HumanoidRootPart) < 2000 then 
                                if GetDistance(GetSeaBeastTrial().HumanoidRootPart) < 2000 then 
                                    autospamskill = true 
                                    getgenv().psskill = GetSeaBeastTrial().HumanoidRootPart.CFrame
                                    TeleportSeabeast(GetSeaBeastTrial())
                                else
                                    autospamskill = false 
                                    getgenv().psskill = nil 
                                end
                            else
                                wait()
                            end
                        end)
                    until not Config["Auto Trial Stage 1"] or GetDistance(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Water")) > 1500 or not GetSeaBeastTrial()  or GetDistance(GetSeaBeastTrial().HumanoidRootPart) > 2000
                    print("Done Sea Beast Trial")  
                    CancelTween() 
                    autospamskill = false 
                    getgenv().psskill = nil 
                elseif StrengthPart and GetDistance(StrengthPart) < 2000 then 
                    OldCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  
                    repeat task.wait()
                        if GetDistance(StrengthPart) < 2000 then 
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldCFrame * CFrame.new(0,50,0)
                            task.spawn(function()
                                KillAura()
                                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do 
                                    pcall(function()
                                        v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,-50,0)
                                        v.Humanoid.Health = 0
                                    end) 
                                end
                            end)
                        end
                    until not Config["Auto Trial Stage 1"] or GetDistance(StrengthPart) > 2000
                elseif GetDistance(GhoulhPart) < 2000 then 
                    OldCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  
                    repeat task.wait()
                        if GetDistance(GhoulhPart) < 2000 then 
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldCFrame * CFrame.new(0,50,0)
                            task.spawn(function()
                                KillAura()
                                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do 
                                    pcall(function()
                                        v.HumanoidRootPart.CFrame = CFrame.new(
                                            -11706.6777,
                                            10011.5615,
                                            11.6579161,
                                            0.54723686,
                                            -2.79323835e-08,
                                            -0.83697778,
                                            2.69866494e-08,
                                            1,
                                            -1.57283679e-08,
                                            0.83697778,
                                            -1.3980082e-08,
                                            0.54723686
                                        )
                                        v.Humanoid.Health = 0
                                    end) 
                                end
                            end)
                        end
                    until not Config["Auto Trial Stage 1"] or GetDistance(GhoulhPart) > 2000
                end
            end,
            ["Auto Mirage Puzzle"] = function()
                if not Sea3 then return end 
                if CheckIsRaiding() then return end 
                if not MirrorFractal then
                    MirrorFractal = CheckItem("Mirror Fractal")
                end
                if not Valk then
                    Valk = CheckItem("Valkyrie Helm")
                end
                if Valk and MirrorFractal then
                    local v213 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") 
                    if v213 == 1 then 
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
                    elseif v213 == 2 then 
                        CreateUiNotify({
                            Content = "Claiming Red Head Quest...",
                            Duration = 30
                        })
                        TweenTempleLegit() 
                    elseif v213 == 3 then 
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Continue") 
                    elseif IsMirageIsland() and not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then 
                        if getBlueGear() then
                            pcall(
                                function()
                                    HighestPointRealCFrame = getHighestPoint().CFrame * CFrame.new(0, 211.88, 0)
                                end
                            )
                            BlueGear = getBlueGear()
                            if BlueGear and not BlueGear.CanCollide and BlueGear.Transparency ~= 1 then
                                repeat
                                    wait()
                                    Tweento(getBlueGear().CFrame * CFrame.new(0,3,0))
                                until not getBlueGear() or getBlueGear().Transparency == 1 or game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor")
                            elseif BlueGear and BlueGear.Transparency == 1 then
                                if
                                    HighestPointRealCFrame and
                                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                            HighestPointRealCFrame.Position).Magnitude > 10
                                 then
                                    Tweento(HighestPointRealCFrame)
                                elseif
                                    HighestPointRealCFrame and
                                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                            HighestPointRealCFrame.Position).Magnitude <= 10
                                 then
                                    workspace.CurrentCamera.CFrame =
                                        CFrame.new(
                                        workspace.CurrentCamera.CFrame.Position,
                                        game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position
                                    )
                                    wait(.1)
                                    game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                                    task.wait()
                                    game:service("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
                                    task.wait(1.5)
                                end
                            end
                        elseif not getBlueGear() and getHighestPoint() then
                            if game.Lighting.ClockTime < 18 and game.Lighting.ClockTime > 5 then
                                TimetoNight = math.floor(18 - game.Lighting.ClockTime)
                                CreateUiNotify({
                                    Content = "Script Notify", "Watting (" .. TimetoNight .. ") Minutes for night!"
                                })
                            end
                            if getHighestPoint() then
                                TwenetoHighestPoint()
                            end
                        end
                    end
                end
            end,
            ["Auto Upgrade Race"] = function()
                if Sea2 then 
                    local nig = CheckUpgradeRace() 
                    if nig and nig ~= "Has V3/V4" then 
                        statusupgraderace = nig 
                        Race = CheckRace()
                        if statusupgraderace == "Bartilo 0" then
                            if
                                string.find(
                                    game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                    "Swan Pirates"
                                ) and
                                    string.find(
                                        game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                        "50"
                                    ) and
                                    game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true
                             then
                                if IsSwanPirate() then
                                    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if
                                        RemoveLevelTitle(v.Name) == "Swan Pirate" and v:FindFirstChild("Humanoid") and
                                                v:FindFirstChild("HumanoidRootPart") and
                                                v.Humanoid.Health > 0
                                         then
                                            pcall(
                                                function()
                                                    repeat
                                                        KillMob(v)
                                                    until not v.Parent or v.Humanoid.Health <= 0 or
                                                        game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                                    UseFastAttack = false
                                                end
                                            )
                                        end
                                    end
                                else
                                    Questtween = Tweento(CFrame.new(1057.92761, 137.614319, 1242.08069))
                                end
                            else
                                Bartilotween = Tweento(CFrame.new(-456.28952, 73.0200958, 299.895966))
                                local args = {
                                    [1] = "StartQuest",
                                    [2] = "BartiloQuest",
                                    [3] = 1
                                }
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                        elseif statusupgraderace == "Bartilo 1" then
                            Jeremy = CheckBoss("Jeremy [Lv. 850] [Boss]")
                            if Jeremy then
                                Target = CheckBoss("Jeremy [Lv. 850] [Boss]")
                                if
                                    game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") and
                                        Target:FindFirstChild("Humanoid") and
                                        Target.Humanoid.Health > 0
                                 then
                                    repeat
                                        wait()
                                        if Target:FindFirstChild("Humanoid") and Target.Humanoid.Health > 0 then
                                            KillMob(Target)
                                        end
                                    until not AutoUpgradeRace or not Target or not Target:FindFirstChild("Humanoid") or
                                        not Target:FindFirstChild("HumanoidRootPart") or
                                        Target.Humanoid.Health <= 0
                                    UseFastAttack = false
                                else
                                    EnableBuso()
                                    EquipWeapon()
                                    Tweento(Target.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                end
                            elseif Config["HopOption"] then
                                Notify(nil, "Server Hop For Jeremy [Lv. 850] [Boss] ", 10)
                                HopServer()
                            end
                        elseif statusupgraderace == "Bartilo 2" then
                            StartCFrame =
                                CFrame.new(
                                -1837.46155,
                                44.2921753,
                                1656.19873,
                                0.999881566,
                                -1.03885048e-22,
                                -0.0153914848,
                                1.07805858e-22,
                                1,
                                2.53909284e-22,
                                0.0153914848,
                                -2.55538502e-22,
                                0.999881566
                            )
                            if
                                (StartCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                                    500
                             then
                                Tweento(StartCFrame)
                            else
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                                    CFrame.new(-1836, 11, 1714)
                                wait(.5)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                    CFrame.new(-1850.49329, 13.1789551, 1750.89685)
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                    CFrame.new(-1858.87305, 19.3777466, 1712.01807)
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                    CFrame.new(-1803.94324, 16.5789185, 1750.89685)
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                    CFrame.new(-1858.55835, 16.8604317, 1724.79541)
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                    CFrame.new(-1869.54224, 15.987854, 1681.00659)
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                    CFrame.new(-1800.0979, 16.4978027, 1684.52368)
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                    CFrame.new(-1819.26343, 14.795166, 1717.90625)
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                    CFrame.new(-1813.51843, 14.8604736, 1724.79541)
                            end
                        elseif statusupgraderace == "Up V2" then
                            if
                                game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 1") and
                                    game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 2") and
                                    game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 3")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
                            else
                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "2")
                                if
                                    not game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 1") and
                                        not game.Players.LocalPlayer.Character:FindFirstChild("Flower 1")
                                 then
                                    if workspace.Flower1.Transparency ~= 1 then
                                        Notify(nil, "Collecting Flower 1", 10)
                                        if
                                            (workspace.Flower1.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300
                                         then
                                            Farmtween = Tweento(workspace.Flower1.CFrame)
                                            FakeFunctionsss = true
                                        elseif
                                            (workspace.Flower1.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300
                                         then
                                            FakeFunctionsss = false
                                            if Farmtween then
                                                Farmtween:Stop()
                                            end
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                                workspace.Flower1.CFrame * CFrame.new(20, 0, 20)
                                            FakeFunctionsss = false
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                                workspace.Flower1.CFrame
                                            wait(1)
                                        end
                                    elseif Config["HopOption"] then
                                        if game.Lighting.ClockTime > 3 and game.Lighting.ClockTime < 16 then
                                            Notify("Script Stauts", "Hopping for Night", 10)
                                            HopServer()
                                        end
                                    end
                                elseif
                                    not game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 2") and
                                        not game.Players.LocalPlayer.Character:FindFirstChild("Flower 2")
                                 then
                                    if workspace.Flower2.Transparency ~= 1 then
                                        Notify(nil, "Collecting Flower 2", 10)
                                        if
                                            (workspace.Flower2.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300
                                         then
                                            Farmtween = Tweento(workspace.Flower2.CFrame)
                                            FakeFunctionsss = true
                                        elseif
                                            (workspace.Flower2.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300
                                         then
                                            FakeFunctionsss = false
                                            if Farmtween then
                                                Farmtween:Stop()
                                            end
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                                workspace.Flower2.CFrame * CFrame.new(20, 0, 20)
                                            FakeFunctionsss = false
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                                workspace.Flower2.CFrame
                                            wait(1)
                                        end
                                    end
                                elseif
                                    not game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 3") and
                                        not game.Players.LocalPlayer.Character:FindFirstChild("Flower 3")
                                 then
                                    Notify(nil, "Farming for Flower 3", 1.5)
                                    if IsSwanPirate() then
                                        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                                            if
                                            RemoveLevelTitle(v.Name) == "Swan Pirate" and v:FindFirstChild("Humanoid") and
                                                    v.Humanoid.Health > 0
                                             then
                                                pcall(
                                                    function()
                                                        repeat
                                                            KillMob(v)
                                                        until not AutoUpgradeRace or not v.Parent or v.Humanoid.Health <= 0 or
                                                            game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 3") or
                                                            game.Players.LocalPlayer.Character:FindFirstChild("Flower 3")
                                                        UseFastAttack = false
                                                    end
                                                )
                                            end
                                        end
                                    else
                                        if
                                            (CFrame.new(1057.92761, 137.614319, 1242.08069).Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300
                                         then
                                            Farmtween = Tweento(CFrame.new(1057.92761, 137.614319, 1242.08069))
                                        elseif
                                            (CFrame.new(1057.92761, 137.614319, 1242.08069).Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300
                                         then
                                            if Farmtween then
                                                Farmtween:Stop()
                                            end
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                                CFrame.new(1057.92761, 137.614319, 1242.08069)
                                        end
                                    end
                                end
                            end
                        elseif statusupgraderace == "Up V3" then
                            ClaimQuestV3()
                            if not blacklistskypiea then 
                                blacklistskypiea = {}
                            end 
                            if Race == "Skypiea V2" then
                                allplayersky = {}
                                for i, v in pairs(game.Players:GetChildren()) do
                                    if v then
                                        if
                                            v:FindFirstChild("Data") and v.Data:FindFirstChild("Race") and
                                                v.Data.Race.Value == "Skypiea" and v.Name ~= game.Players.LocalPlayer.Name and not table.find(blacklistskypiea,v.Name)
                                         then 
                                            table.insert(allplayersky, v.Name)
                                        end
                                    end
                                end
                                if #allplayersky <= 0 then
                                    HopServer()
                                end
                                if #allplayersky > 0 then
                                    for i,v in pairs(allplayersky) do 
                                        skypcall,skypcall2 =pcall(function()
                                            repeat
                                                wait()
                                                TargetedPlayer = v
                                                vm = game.Players:FindFirstChild(v)
                                                ChoDienCanNguoi = true
                                            until CheckRace() ~= "Skypiea V2" or not CheckKillPlayer(v) or game.Players:FindFirstChild(v).Character.Humanoid.Health <=0  or not Config["Auto Upgrade Race"] or CheckSafeZone(vm.Character) or CheckCantAttackPlayer(vm)
                                            print('return ',v)
                                            ChoDienCanNguoi = false 
                                            TargetedPlayer = nil 
                                            repeat 
                                                table.insert(blacklistskypiea,v)
                                                print(v)
                                            until table.find(blacklistskypiea,v)
                                        end)
                                        if not skypcall then print('skypcall2',skypcall2) end 
                                    end
                                end
                            elseif Race == "Fishman V2" then
                                ClaimQuestV3()
                                repeat
                                    spawn(function()
                                        Racemmmb = CheckRace()
                                    end)
                                    pcall(
                                        function()
                                            Stats_Melee = game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value
                                        end
                                    )
                                    pcall(
                                        function()
                                            Stats_DF =
                                                game:GetService("Players").LocalPlayer.Data.Stats["Demon Fruit"].Level.Value
                                        end
                                    )
                                    pcall(
                                        function()
                                            Stats_Gun = game:GetService("Players").LocalPlayer.Data.Stats.Gun.Level.Value
                                        end
                                    )
                                    pcall(
                                        function()
                                            Stats_Sword = game:GetService("Players").LocalPlayer.Data.Stats.Sword.Level.Value
                                        end
                                    ) 
                                    SETNERD = {}
                                    pcall(
                                        function()
                                            if Stats_Melee and Stats_Melee > 1 then
                                                SETNERD["Melee"] = true
                                            end
                                            if Stats_DF and Stats_DF > 1 then
                                                SETNERD["Devil Fruit"] = true
                                            end
                                            if Stats_Sword and Stats_Sword > 1 then
                                                SETNERD["Sword"] = true
                                            end
                                            if Stats_Gun and Stats_Gun > 1 then
                                                SETNERD["Gun"] = true
                                            end
                                        end
                                    )  
                                    UseWeapon_Dropdown:Set(SETNERD) 
                                    UseSkills_Dropdown:Set({
                                        ["Z"] = true,
                                        ["X"] = true,
                                        ["C"] = true,
                                        ["V"] = true,
                                        ["F"] = true
                                    })
                                    EnableBuso()
                                    EnableKen()
                                    local args = {
                                        [1] = "BlackbeardReward",
                                        [2] = "DragonClaw",
                                        [3] = "2"
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    wait()
                                    sbm1, sbm2 =
                                        pcall(
                                        function()
                                            Seabeast()
                                        end
                                    )
                                    SeaBeastToggle:Set(true)
                                    if not sbm1 then
                                        print("sbm2", sbm2)
                                    end
                                until not Config["Auto Upgrade Race"] or not Racemmmb == "Fishman V2" or
                                    not string.find(Racemmmb, "Fish")
                                SeaBeastToggle:Set(false)
                            elseif Race == "Ghoul V2" then
                                ClaimQuestV3()
                                repeat
                                    wait()
                                    ChoDienCanNguoi = true
                                    wait(1)
                                until not Config["Auto Upgrade Race"] or game.Players.LocalPlayer.Data.Race.Value ~= "Ghoul" or
                                    string.find(CheckRace(), "V3")
                                ChoDienCanNguoi = false
                            elseif Race == "Cyborg V2" then
                                ClaimQuestV3()
                                if not AnyDFInBackpack() then
                                    repeat
                                        wait()
                                        p = getFruitDuoi1M()
                                        if p then
                                            LoadFruit(p)
                                        end
                                    until AnyDFInBackpack()
                                    UpV3NoTween()
                                end
                            elseif Race == "Mink V2" then
                                ClaimQuestV3()
                                repeat task.wait()
                                    local Chest = GetNearestChest()
                                    if Chest and Race ~= "Mink V3" then
                                        Tweento(Chest)
                                        CountChest = CountChest + 1
                                        Notify("Script Status", "Remaning " .. (30 - CountChest) .. " Chest", 7.5)
                                        if CountChest >= 30 then
                                            UpV3NoTween()
                                            Notify(
                                                nil,
                                                "Race Status: " ..
                                                    tostring(
                                                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "info")
                                                    )
                                            )
                                        end
                                    elseif Chest == nil then
                                        repeat
                                            wait()
                                            local Chest = GetNearestChest()
                                        until Chest ~= nil
                                    end
                                until not Config["Auto Upgrade Race"] or not string.find(tostring(
                                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "info")
                                ),"30") or CheckRace() ~= "Mink V2"
                            elseif Race == "Human V2" then
                                ClaimQuestV3()
                                BossSpawned = {
                                    ["Diamond [Lv. 750] [Boss]"] = CheckBoss("Diamond [Lv. 750] [Boss]"),
                                    ["Fajita [Lv. 925] [Boss]"] = CheckBoss("Fajita [Lv. 925] [Boss]"),
                                    ["Jeremy [Lv. 850] [Boss]"] = CheckBoss("Jeremy [Lv. 850] [Boss]")
                                }
                                sk = {}
                                for i, v in pairs(BossSpawned) do
                                    if v then
                                        table.insert(sk, i)
                                    end
                                end
                                sk2 = "Server Have Bosses: "
                                for i, v in pairs(sk) do
                                    sk2 = sk2 .. v .. ","
                                end
                                Notify(nil, sk2, 15)
                                if #sk < 3 and CheckRace() == "Human V2" and Config["HopOption"] then
                                    sk2 = sk2 .. "\nHopping Server"
                                    Notify(nil, "Hopping for 3 bosses", 15)
                                    task.wait(1)
                                    HopServer(10,true)
                                end
                                if #sk >= 3 then
                                    for name, is in pairs(BossSpawned) do
                                        Notify("Con me may thinh", CheckRace())
                                        if is and CheckRace() == "Human V2" then
                                            Notify(nil, "Try Killing " .. name .. " Boss To Up Human V3")
                                            Target = CheckBoss(name)
                                            repeat
                                                wait()
                                                if
                                                    Target and game.Workspace.Enemies:FindFirstChild(Target.Name) and
                                                        Target:FindFirstChild("Humanoid") and
                                                        Target:FindFirstChild("HumanoidRootPart") and
                                                        Target.Humanoid.Health > 0
                                                 then
                                                    KillMob(Target)
                                                elseif Target then
                                                    EnableBuso()
                                                    EquipWeapon()
                                                    Tweento(Target.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                                end
                                            until not Config["Auto Upgrade Race"] or not Target or
                                                not Target:FindFirstChild("Humanoid") or
                                                not Target:FindFirstChild("HumanoidRootPart") or
                                                Target.Humanoid.Health <= 0
                                            UseFastAttack = false
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end,
            ["Auto Choose Gear"] = function() 
                if not Sea3 then return end
                if CanChoosePoint() then 
                    InstantChooseGear()
                end
            end,
            ["Auto Sea Beast"] = function()
                pcall(
                    function()
                        Stats_Melee = game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value
                    end
                )
                pcall(
                    function()
                        Stats_DF =
                            game:GetService("Players").LocalPlayer.Data.Stats["Demon Fruit"].Level.Value
                    end
                )
                pcall(
                    function()
                        Stats_Gun = game:GetService("Players").LocalPlayer.Data.Stats.Gun.Level.Value
                    end
                )
                pcall(
                    function()
                        Stats_Sword = game:GetService("Players").LocalPlayer.Data.Stats.Sword.Level.Value
                    end
                )
                SETNERD = {}
                pcall(
                    function()
                        if Stats_Melee and Stats_Melee > 1 then
                            SETNERD["Melee"] = true
                        end
                        if Stats_DF and Stats_DF > 1 then
                            SETNERD["Devil Fruit"] = true
                        end
                        if Stats_Sword and Stats_Sword > 1 then
                            SETNERD["Sword"] = true
                        end
                        if Stats_Gun and Stats_Gun > 1 then
                            SETNERD["Gun"] = true
                        end
                    end
                )   
                UseWeapon_Dropdown:Set(SETNERD) 
                UseSkills_Dropdown:Set({
                    ["Z"] = true,
                    ["X"] = true,
                    ["C"] = true,
                    ["V"] = true,
                    ["F"] = true
                })
                EnableBuso()
                EnableKen()
                local args = {
                    [1] = "BlackbeardReward",
                    [2] = "DragonClaw",
                    [3] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                repeat task.wait()
                    SeaBeast()
                until not Config["Auto Sea Beast"] or not ALLCHECK["Auto Sea Beast"]
            end,
            ["Boss Farm"] = function()
                if Config["Selected Boss"] then
                    CountBoss = 0
                    if not getNearestSelectedBoss() then return end
                    Bosslon = {
                        [RemoveLevelTitle(getNearestSelectedBoss().Name)] = getNearestSelectedBoss()
                    }
                    for i, v in pairs(Bosslon) do
                        if CheckMob({i},true) and v then
                            if CheckMob({i}, true) then
                                repeat
                                    task.wait()
                                    if Config["Get Boss Quest"] then
                                        if CheckQuestBoss(i) and GetInfoBossQuest(i) then
                                            conchomeci = GetInfoBossQuest(i)
                                            if
                                                (not string.find(
                                                    game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                                    i
                                                ) and
                                                    game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible) or
                                                    not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible
                                             then
                                                MMBStatus = "Claiming defeat "..tostring(i).." quest"
                                                if
                                                    (QuestPoint[conchomeci["QuestName"]].Position -
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                                        8
                                                 then
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                        "StartQuest",
                                                        tostring(conchomeci["QuestName"]),
                                                        conchomeci["QuestId"]
                                                    )
                                                    wait(1.5)
                                                else
                                                    Tweento(QuestPoint[conchomeci["QuestName"]])
                                                    NoClip = true
                                                    wait(.5)
                                                end
                                            else
                                                KillMobNotInWorkSpace(i)
                                            end
                                        else
                                            KillMobNotInWorkSpace(i)
                                        end
                                    else
                                        KillMobNotInWorkSpace(i)
                                    end
                                until not Config["Selected Boss"][i] or not CheckMob({i}, true) or not Config["Boss Farm"]
                                return
                            end
                        end
                    end
                    for i, v in pairs(Config["Selected Boss"]) do
                        if v and CheckMob({i}, true) then
                            CountBoss = CountBoss + 1
                        end
                    end
                    if CountBoss <= 0 and Config["Hop Boss"] then
                        CreateUiNotify(
                            {
                                Content = "Hop for bosses"
                            }
                        )
                        HopServer(10, true)
                    end
                end
            end,
            ["Farm Normal"] = function()
                if Config["Farm Normal"] and Config["Farm Type"] then
                    CountType = 0
                    for i, v in pairs(Config["Farm Type"]) do
                        if v then
                            CountType = CountType + 1
                        end
                    end
                    if Config["Farm Type"]["Level"] and (CountType <= 1 or (CountType >= 2 and LocalPlayerLevelValue < 2450)) then
                        if
                            game.PlaceId == 2753915549 and not getgenv().QuestKillPlayer and LocalPlayerLevelValue >= 35 and
                                Config["Kill Player Quest"]
                         then
                            game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("PlayerHunter")
                            local namequest =
                                string.gsub(
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                "Defeat ",
                                ""
                            )
                            namequest = string.gsub(namequest, " %p(0/1)%p", "")
                            if
                                game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible and
                                    namequest and
                                    game:GetService("Workspace").Characters:FindFirstChild(namequest)
                             then
                                if Config["Kill Player Quest"] then
                                    MMBStatus = "Claiming Kill Player Quest"
                                    getgenv().QuestKillPlayer = true
                                end
                                return
                            end
                        end
                        if Sea1 and getgenv().QuestKillPlayer and Config["Kill Player Quest"] then
                            if #blnamequest >= 6 and getgenv().QuestKillPlayer then
                                if getgenv().QuestKillPlayer then
                                    MMBStatus = "NOT FOUND ANY PLAYER\nStart Hopping"
                                    Notify("gg", "Start Hop Server")
                                    AutoTP = false
                                    local mbmbmb = tick()
                                    repeat
                                        wait()
                                    until tick() - mbmbmb >= 3
                                    HopServer(10)
                                end
                                return
                            end
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible then
                                local namequest =
                                    string.gsub(
                                    game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                    "Defeat ",
                                    ""
                                )
                                namequest = string.gsub(namequest, " %p(0/1)%p", "")
                                if
                                    game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible and
                                        not game:GetService("Workspace").Characters:FindFirstChild(namequest)
                                 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                end
                                if
                                    game.Players[namequest].Data.Level.Value < 20 or
                                        game.Players[namequest].Data.Level.Value > 350
                                 then
                                    table.insert(blnamequest, namequest)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                end
                                if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible then
                                    for i, v in next, game:GetService("Workspace").Characters:GetChildren() do
                                        if v.Name == namequest then
                                            EnableBuso()
                                            EquipWeapon()
                                            MMBStatus = "Killing " .. tostring(v.Name)
                                            repeat
                                                wait()
                                                if game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible then
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                        "EnablePvp"
                                                    )
                                                end
                                                spawn(
                                                    function()
                                                        EquipWeapon()
                                                        EnableBuso()
                                                        if
                                                            getgenv().clickattackmethodfarm and
                                                                (v.HumanoidRootPart.Position -
                                                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                                    50
                                                         then
                                                            local loa =
                                                                getupvalues(
                                                                require(
                                                                    game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework
                                                                )
                                                            )[2]
                                                            loa.activeController.hitboxMagnitude = 55
                                                            Click()
                                                            SendKey("Z")
                                                            SendKey("X")
                                                            game:GetService "VirtualUser":CaptureController()
                                                            game:GetService "VirtualUser":Button1Down(Vector2.new(50, 50))
                                                            UseFastAttack = true
                                                        else
                                                            UseFastAttack = false
                                                        end
                                                    end
                                                )
                                                spawn(
                                                    function()
                                                        if
                                                            not getgenv().clickattackmethodfarm and
                                                                (v.HumanoidRootPart.Position -
                                                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                                    150
                                                         then
                                                            AimbotDiThangNgu = true
                                                            AimBotSkillPosition = v.HumanoidRootPart.Position
                                                            local condimemeay = tick()
                                                            repeat
                                                                wait()
                                                            until tick() - condimemeay >= 5 or
                                                                (v.HumanoidRootPart.Position -
                                                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >=
                                                                    300
                                                            if tick() - condimemeay >= 5 then
                                                                getgenv().clickattackmethodfarm = true
                                                            end
                                                        elseif
                                                            (v.HumanoidRootPart.Position -
                                                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >=
                                                                500
                                                         then
                                                            getgenv().clickattackmethodfarm = false
                                                        end
                                                    end
                                                )
                                                if not getgenv().clickattackmethodfarm then
                                                    spawn(
                                                        function()
                                                            AutoTp = true
                                                            TpCFrame = v.HumanoidRootPart.CFrame * CFrame.new(-40, 0, 0)
                                                        end
                                                    )
                                                else
                                                    spawn(
                                                        function()
                                                            AutoTp = true
                                                            TpCFrame = v.HumanoidRootPart.CFrame * CFrame.new(2.5, 0, 0)
                                                        end
                                                    )
                                                end
                                            until not v or not v.Parent or v.Humanoid.Health <= 0 or not Config["Farm Normal"] or
                                                not game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild(
                                                    "Quest"
                                                ).Visible or
                                                CheckSafeZone(game.Players[v.Name].Character) or
                                                (GetDistance(game.Players[v.Name].Character.HumanoidRootPart) < 150 and
                                                    game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Main"):WaitForChild(
                                                        "SafeZone"
                                                    ).Visible)
                                            getgenv().clickattackmethodfarm = false
                                            UseFastAttack = false
                                            AutoTp = false
                                            TpCFrame = nil
                                            AimbotDiThangNgu = false
                                            table.insert(blnamequest, namequest)
                                        end
                                    end
                                end
                            else
                                if
                                    game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("PlayerHunter") ==
                                        "I don't have anything for you right now. Come back later."
                                 then
                                    getgenv().QuestKillPlayer = false
                                end
                            end
                        end
                        if not getgenv().QuestKillPlayer or (not Config["Kill Player Quest"] and getgenv().QuestKillPlayer) then
                            AutoTp = false
                            if
                                game.PlaceId == 2753915549 and game.Players.LocalPlayer.Data.Level.Value < 120 and
                                    game.Players.LocalPlayer.Data.Level.Value >= 10
                             then
                                if not MobLevelSkip() then
                                    MMBStatus = "Waitting Mob Skip"
                                    for i, v in pairs(MBLVSKIP) do
                                        mm = game.workspace.MobSpawns:FindFirstChild(v)
                                        if mm and not MobLevelSkip() and Config["Farm Normal"] then
                                            Tweento(GetMobSpawn(v).CFrame * CFrame.new(0, 15, 8))
                                            concac2 = Instance.new("Part")
                                            concac2.Parent = GetMobSpawn(v)
                                            concac2.Name = "concac2"
                                        elseif not mm then
                                            ReloadFolderMob()
                                        end
                                    end
                                    Tweento(CFrame.new(-7620.41, 5545.49, -504.215))
                                    task.wait(2)
                                    if not MobLevelSkip() then
                                        Tweento(CFrame.new(-7782.86, 5632.42, -1268.59))
                                        task.wait(2)
                                    end
                                else
                                    MMBStatus = "Try Kill Mob"
                                    for i, v in pairs(game.workspace.Enemies:GetChildren()) do
                                        if
                                            Config["Farm Normal"] and Config["Farm Type"]["Level"] and v.Name == MobLevelSkip() and
                                                v:FindFirstChild("HumanoidRootPart") and
                                                v:FindFirstChild("Humanoid") and
                                                v.Humanoid.Health > 0
                                         then
                                            repeat
                                                KillMob(v)
                                            until not Config["Farm Normal"] or not Config["Farm Type"]["Level"] or not v or
                                                not v:FindFirstChild("Humanoid") or
                                                not v:FindFirstChild("HumanoidRootPart") or
                                                v.Humanoid.Health <= 0
                                        end
                                    end
                                end
                            elseif game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible then
                                if not MobLevel1OrMobLevel2() then
                                    MMBStatus = "Waitting " .. tostring(CheckNameDoubleQuest()) .. " to farm"
                                    Check155 = tick()
                                    Check156 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                    p2 = GetMobSpawnList(GetMob())
                                    if
                                        tick() - Check155 >= 3 * 60 and
                                            (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Check156.Position).Magnitude <=
                                                1500
                                     then
                                        Rejoin()
                                    else
                                        for i, v in pairs(p2) do
                                            pcall(
                                                function()
                                                    if not MobLevel1OrMobLevel2() and Config["Farm Normal"] then
                                                        if
                                                            not game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible
                                                         then
                                                            repeat
                                                                wait()
                                                            until game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild(
                                                                "Quest"
                                                            ).Visible
                                                        end
                                                        Tweento(v.CFrame * CFrame.new(0, 25, 8))
                                                    end
                                                end
                                            )
                                        end
                                    end
                                else
                                    for i, v in pairs(game.workspace.Enemies:GetChildren()) do
                                        if
                                            v.Name == MobLevel1OrMobLevel2() and v:FindFirstChild("HumanoidRootPart") and
                                                v:FindFirstChild("Humanoid") and
                                                v.Humanoid.Health > 0 and
                                                game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible
                                         then
                                            repeat
                                                KillMob(v)
                                            until not Config["Farm Normal"] or not Config["Farm Type"]["Level"] or not v or
                                                not v:FindFirstChild("Humanoid") or
                                                not v:FindFirstChild("HumanoidRootPart") or
                                                v.Humanoid.Health <= 0 or
                                                not game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible
                                            StartBringMob = false
                                            UseFastAttack = false
                                            UseFastAttack = false
                                            NoClip = false
                                            AimbotDiThangNgu = false
                                            AimBotSkillPosition = nil
                                            LockCFrame = nil
                                            BringMobChoosen = nil
                                            BringMobCFrame = nil
                                            LockCFrame = nil
                                        end
                                    end
                                end
                            else
                                GetQuest()
                            end
                        end
                    elseif Config["Farm Type"]["Cake Prince"] and Sea3 then
                        if
                            LocalPlayerLevelValue >= 2200 and Config["Claim Bone & Cake Prince Quest"] and
                                not game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible
                         then
                            levelcustom = 2200
                            if LocalPlayerLevelValue >= 2275 then
                                levelcustom = 2275
                            end
                            GetQuestCustom(levelcustom)
                        elseif
                            not Config["Claim Bone & Cake Prince Quest"] or
                                ((Config["Claim Bone & Cake Prince Quest"] and LocalPlayerLevelValue < 2200) or
                                    game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible)
                         then
                            if getCakePrince() then
                                Target = getCakePrince()
                                if Target then
                                    if game.Workspace.Enemies:FindFirstChild(Target.Name) then
                                        repeat
                                            EnableBuso()
                                            EquipWeapon()
                                            KillMob(Target)
                                        until not Target or not Config["Farm Type"]["Cake Prince"] or not Config["Farm Normal"] or
                                            not getCakePrince()
                                        UseFastAttack = false
                                    else
                                        EnableBuso()
                                        EquipWeapon()
                                        if
                                            GetDistance(CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875)) >
                                                3000
                                         then
                                            Tweento(
                                                CFrame.new(
                                                    -2151.81006,
                                                    143.738007,
                                                    -12404.9004,
                                                    0.087131381,
                                                    -0,
                                                    -0.996196866,
                                                    0,
                                                    1,
                                                    -0,
                                                    0.996196866,
                                                    0,
                                                    0.087131381
                                                )
                                            )
                                        else
                                            Tweento(Target.HumanoidRootPart.CFrame * GetCFrameADD())
                                        end
                                    end
                                end
                            else
                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                                if getCakePrince() then
                                else
                                    MobsCakePrince = {
                                        "Cookie Crafter [Lv. 2200]",
                                        "Cake Guard [Lv. 2225]",
                                        "Baking Staff [Lv. 2250]",
                                        "Head Baker [Lv. 2275]"
                                    }
                                    Target = CheckMob(MobsCakePrince)
                                    TargetSpawn = GetListMobSpawn(MobsCakePrince)
                                    if Target then
                                        KillMob(Target)
                                    elseif TargetSpawn then
                                        for i, v in pairs(TargetSpawn) do
                                            if not CheckMob(MobsCakePrince) then
                                                Tweento(v.CFrame * CFrame.new(0, 15, 0))
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    elseif Config["Farm Type"]["Bone"] and Sea3 then
                        if
                            LocalPlayerLevelValue >= 1975 and Config["Claim Bone & Cake Prince Quest"] and
                                not game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible
                         then
                            levelcustom = 1975
                            if LocalPlayerLevelValue >= 2050 then
                                levelcustom = 2050
                            end
                            GetQuestCustom(levelcustom)
                        elseif
                            not Config["Claim Bone & Cake Prince Quest"] or
                                ((Config["Claim Bone & Cake Prince Quest"] and LocalPlayerLevelValue < 2200) or
                                    game.Players.LocalPlayer.PlayerGui.Main:FindFirstChild("Quest").Visible)
                         then
                            BoneMobs = {
                                "Reborn Skeleton [Lv. 1975]",
                                "Living Zombie [Lv. 2000]",
                                "Demonic Soul [Lv. 2025]",
                                "Posessed Mummy [Lv. 2050]"
                            }
                            Target = CheckMob(BoneMobs)
                            TargetSpawn = GetListMobSpawn(BoneMobs)
                            if Target then
                                KillMob(Target)
                            elseif TargetSpawn then
                                for i, v in pairs(TargetSpawn) do
                                    if not CheckMob(BoneMobs) then
                                        Tweento(v.CFrame * CFrame.new(0, 15, 0))
                                    end
                                end
                            end
                        end
                    end
                end
            end
        } 
        Thutufunc = {
            "Auto Mirage Puzzle",
            "Auto Upgrade Race",
            "Kill Trial Players",
            "Auto CDK",
            "Auto Pirate Raid",
            "Auto Find Fruit",
            "Auto Trial Stage 1",
            "Auto Shark & Mobs", 
            "Auto Sea Beast",
            "Auto Ghost Ship",
            "Auto Sail",
            "Auto Choose Gear",
            "Auto Tushita",
            "Auto Yama",
            "Auto Rip Indra", 
            "Auto Dough King",
            "Auto Elite",
            "Auto Raid",
            "Boss Farm",
            "Farm Normal",
        }
        CountBoss = 0 
        task.spawn(
            function()
                while task.wait() do
                    repeat task.wait() until LoadedUiHub
                    farm55, farm66 =pcall(
                        function() 
                            if CheckIsRaiding() or CheckTool("Special Microchip") then 
                                ALL_FUNC["Auto Raid"]()
                            end
                            if not CheckIsRaiding() then 
                                funcid = 0
                                for i, v in next, Thutufunc do 
                                    funcid = funcid+1
                                    if ALLCHECK[v] and not CheckIsRaiding() then
                                        print(v,funcid)
                                        ALL_FUNC[v]()
                                        return
                                    end
                                end
                            end 
                        end
                    )
                    if not farm55 then
                        print("Farm BUG", farm66)
                    end
                end
            end
        )
        
        -------- Creating functions element ------------
        do
            DefaultTab:AddSection("toi nho tho")
            DefaultTab:NewButton({
                Title = "Fly Boat",
                Callback = function()
                    getgenv().BoatFloated = not getgenv().BoatFloated
                    if not GetLocalBoat() then return end 
                    FlyBoat(GetLocalBoat(),getgenv().BoatFloated) 
                end
            })
            DefaultTab:NewButton({
                Title = "Cancel Tween",
                Description = "Cancel the tween and remove noclip effects.",
                Callback = function()
                    CancelTween()
                end
            })
            DefaultTab:NewToggle(
                "Same Y",
                {
                    Title = "Same Y Tween"
                }
            )
            DefaultTab:NewToggle(
                "Smart Bring",
                {
                    Title = "Smart Bring"
                }
            )
            DefaultTab:NewDropdown(
                "Wolrd Selected",
                {
                    Title = "Choose World to teleport",
                    Values = {
                        "Sea 1",
                        "Sea 2",
                        "Sea 3"
                    },
                    Defualt = "",
                    Callback = function(v)
                        if CheckWorld(v) then
                            return CreateUiNotify({Content = "You Can Not Teleport World You In."})
                        end
                        DefaultTab:NewDialog(
                            {
                                Title = "Are you sure?",
                                Content = "Are you Sure To Teleport " .. v .. "?",
                                Buttons = {
                                    {
                                        Title = "Confirm",
                                        Callback = function(v)
                                            TeleportWorld(Config["Wolrd Selected"])
                                        end
                                    },
                                    {
                                        Title = "Cancel",
                                        Callback = function()
                                            print("Cancelled the dialog.")
                                        end
                                    }
                                }
                            }
                        )
                    end
                }
            )
            mommb = {}
            for i, v in next, game.Workspace.MobSpawns:GetChildren() do
                if not table.find(mommb, v.Name) then
                    table.insert(mommb, v.Name)
                end
            end
            table.sort(mommb)
            DefaultTab:NewDropdown(
                "Mob Selected",
                {
                    Title = "Choose Mob",
                    Values = mommb,
                    Callback = function(v)
                        Tweento(GetMobSpawn(v).CFrame * CFrame.new(0, 30, 0))
                    end
                }
            )
            DefaultTab:NewDropdown(
                "Stats Table",
                {
                    Title = "Choose Stats To Add",
                    Values = {
                        "Melee",
                        "Defense",
                        "Sword",
                        "Gun",
                        "Demon Fruit",
                        "Cuttay Method"
                    },
                    Multi = true
                }
            )
            
            ServerTab:AddSection("Informations")
            ServerStats_Paragraph = ServerTab:NewParagraph({Title = "Server & Player Informations",Content = "MMB"})
            ServerTab:AddSection("Hop functions") 
            ServerTab:NewButton(
                {
                    Title = "Copy Job Id",
                    Description = "Copy current Job Id (Server Id).",
                    Callback = function() 
                        setclipboard(game.JobId)
                    end
                }
            )
            ServerTab:NewButton(
                {
                    Title = "Rejoin",
                    Description = "Rejoin the game",
                    Callback = function()
                        ServerTab:NewDialog(
                            {
                                Title = "Are you sure?",
                                Content = "Are you sure to rejoin game?",
                                Buttons = {
                                    {
                                        Title = "Confirm",
                                        Callback = function()
                                            game:GetService("TeleportService"):TeleportToPlaceInstance(
                                                game.PlaceId,
                                                game.JobId,
                                                game.Players.LocalPlayer
                                            )
                                        end
                                    },
                                    {
                                        Title = "Cancel",
                                        Callback = function()
                                            print("Cancelled the dialog.")
                                        end
                                    }
                                }
                            }
                        )
                    end
                }
            )
            ServerTab:NewButton(
                {
                    Title = "Hop Server",
                    Description = "Hop To Random Server",
                    Callback = function()
                        ServerTab:NewDialog(
                            {
                                Title = "Are you sure?",
                                Content = "Are you sure to Hop Server?",
                                Buttons = {
                                    {
                                        Title = "Confirm",
                                        Callback = function()
                                            task.spawn(function()
                                                pcall(function()
                                                    HopServer(10, true)
                                                end)
                                            end)
                                        end
                                    },
                                    {
                                        Title = "Cancel",
                                        Callback = function()
                                            print("Cancelled the dialog.")
                                        end
                                    }
                                }
                            }
                        )
                    end
                }
            )
            ServerTab:NewInput("Inputed Job Id",{
                Title = "Input Job Id",
                Description = "Input a job id to join that job id.",
                Callback = function(v)
                    CreateUiNotify({
                        Content = TPServer(v)
                    })
                end
            })
            ServerTab:NewToggle("Hop Near",{
                Title = "Hop Near",
                Description = "If a player reach the distance then it will hop.",
            })
            ServerTab:NewSlider("Hop Near Distance",{
                Title = "Hop Near Distance",
                Min = 1,
                Max = 1500,
                Rounding = 0,
                Default = 500,
                Description = "The Distance Value script will hop if there a player reach distance."
            })
            ServerTab:NewToggle("Hop Ping",{
                Title = "Hop when ping reach X",
                Description = "If ping reach X value then it will hop.",
            })
            ServerTab:NewSlider("Hop Ping Value",{
                Title = "Hop Ping Value",
                Min = 200,
                Max = 15000,
                Rounding = 0,
                Default = 1500,
                Description = "The Value script will hop if ping reach value."
            })
        
        
            FarmTab:AddSection("Attack functions")
            FarmTab:NewDropdown(
                "Fast Attack Delay",
                {
                    Title = "Fast Attack Delay",
                    Values = {
                        0.1,
                        0.2,
                        0.3
                    }
                }
            )
            FarmTab:NewToggle(
                "Fast Attack Aura",
                {
                    Title = "Attack Aura"
                }
            )
            FarmTab:AddSection("Default Farm")
            SelectWeapon_Dropdown =FarmTab:NewDropdown(
                "Weapon Type",
                {
                    Title = "Choose Weapon Type",
                    Values = {"Melee", "Sword"}
                }
            )
            FarmTab:NewParagraph(
                {
                    Title = "Farm Note",
                    Content = "If you choose 2 Option like Level and Cake Prince then when level max it will farm Cake Prince or smthing like that lol"
                }
            )
            SelectTypeFarm_Dropdown = FarmTab:NewDropdown(
                "Farm Type",
                {
                    Title = "Choose Method To Farm",
                    Multi = true,
                    Values = {
                        "Level",
                        "Cake Prince",
                        --"Ectoplasm",
                        "Bone"
                    }
                }
            )
            Farm_Toggle = FarmTab:NewToggle(
                "Farm Normal",
                {
                    Title = "Farm"
                }
            )
            DoubleQuest_Toggle = FarmTab:NewToggle(
                "Double Quest",
                {
                    Title = "Double Quest",
                    Description = "Double Quest | Recommend for Sea 2/3"
                }
            )
            if Sea1 then
                FarmTab:NewToggle(
                    "Kill Player Quest",
                    {
                        Title = "Kill Player Quest",
                        Description = "Claim Kill Player Quest For Super-High Exp"
                    }
                )
            elseif Sea3 then
                ClaimExtraQuest_Toggle = FarmTab:NewToggle(
                    "Claim Bone & Cake Prince Quest",
                    {
                        Title = "Claim Bone & Cake Prince Quests"
                    }
                )
            end
            FarmTab:AddSection("Mastery Farms")
            FarmTab:NewDropdown("TypeMasteryFarm",{
                Title = "Weapon to Farm mastery",
                Description = "Choose weapon to farm mastery.",
                Values = {"Devil Fruit","Gun"}
            })
            FarmTab:NewSlider("%HealthSendSkill",{
                Title = "% Health to send skills on mob",
                Description = "% Health of mob that script start use skill on it.",
                Min = 10,
                Max = 100, 
                Default = 50
            })
            FarmTab:NewToggle("Mastery Farm",{
                Title = "Mastery Farm Option",
                Description = "Mastery farm for the most mob farm."
            })
            FarmTab:NewToggle("Only V4",{
                Title = "Only When V4 Activited",
                Description = "This when enable with mastery farm will waits for v4 enabled and only send skills when v4 activited."
            })
            FarmTab:AddSection("Boss-Farm")
            SelectBoss_Dropdown =
                FarmTab:NewDropdown(
                "Selected Boss",
                {
                    Title = "Select Boss",
                    Values = getBossSeaHub(),
                    Multi = true
                }
            )
            FarmTab:NewToggle(
                "Get Boss Quest",
                {
                    Title = "Get Boss Quest"
                }
            )
            FarmTab:NewToggle(
                "Boss Farm",
                {
                    Title = "Farm Bosses Selected"
                }
            )
            FarmTab:NewToggle(
                "Hop Boss",
                {
                    Title = "Hop For Bosses"
                }
            )
            FarmTab:AddSection("Elite/Rip India/Yama/Tushita/Dough King Functions")
            FarmTab:NewToggle("Auto Elite",{
                Title = "Auto Elite Hunter",
                Description = "Auto Elite Hunter When It Spawned."
            })
            FarmTab:NewToggle("Auto Elite Hop",{
                Title = "Elite Hunt Hop Option",
                Description = "Enable this with auto elite hunter will hop when the elite despawn/doenst spawn in server."
            })
            FarmTab:NewToggle("Auto Rip Indra",{
                Title = "Auto Rip Indra",
                Description = "Auto summon rip indra and kill that nigga when have god chalice and automatic enable haki buttons."
            })
            FarmTab:NewToggle("Auto Tushita",{
                Title = "Auto Tushita",
                Description = "Auto do Tushita Puzzle and get Tushita.\nAuto Kill Rip India will ignore this."
            })
            FarmTab:NewToggle("Auto Tushita Hop",{
                Title = "Auto Tushita Hop",
                Description = "Ignore what u doing. Just hopping for rip india and do Tushita Puzzle."
            }) 
            FarmTab:NewToggle("Auto Yama",{
                Title = "Yama",
                Description = "Auto unlock yama while check elite killed > 30."
            })
            FarmTab:NewToggle("Auto Dough King",{
                Title = "Auto Dough King",
                Description = "Automatic do all what need to summon and kill Dough King.\nAlso this can be enabled with auto elite and elite hop."
            }) 
            FarmTab:NewToggle("Auto Dough King Hop",{
                Title = "Auto Dough King Hop",
                Description = "Auto Dough King Hop."
            })
            if V4Tab then 
                V4Tab:NewButton({
                    Title = "Reset Character",
                    Callback = function()
                        game.Players.LocalPlayer.Character.Humanoid.Health = 0 
                    end
                })
                V4Tab:AddSection("Mirage Puzzle")
                V4Tab:NewToggle("Auto Mirage Puzzle",{
                    Title = "Auto Mirage Puzzle",
                    Description = "Will Automatic Do Mirage Puzzle (required requirements)."
                })
                V4Tab:NewButton({
                    Title = "Tween To Mirage Island",
                    Description = "Tween to Advanced Fruit Dealer On Mirage.",
                    Callback = function() 
                        TweenMirage()
                    end
                })
                V4Tab:NewButton({
                    Title = "Tween To Blue Gear",
                    Description = "Tween to Blue Gear (only spawned).",
                    Callback = function()
                        pcall(function()
                            Tweento(getBlueGear().CFrame * CFrame.new(0,5,0))
                        end)
                    end 
                })
                V4Tab:NewButton({
                    Title = "Tween To Highest Point",
                    Description = "Tween to Highest Point On Mirage Island.",
                    Callback = function()
                        pcall(function()
                            TwenetoHighestPoint()
                        end)
                    end
                })
                V4Tab:AddSection("Temple of Time Puzzle")
                TrialStage1_Toggle = V4Tab:NewToggle("Auto Trial Stage 1",{
                    Title = "Auto Trial Stage 1",
                    Description = "Auto do Trial Stage 1 All Race."
                })
                AutoChooseGear_Toggle = V4Tab:NewToggle("Auto Choose Gear",{
                    Title = "Auto Choose Gear",
                    Description = "Instant Choose Gear For Character",
                })
                V4Tab:NewButton({
                    Title = "Teleport to Temple of Time",
                    Description = "Teleport your character to Temple of time.",
                    Callback = function()
                        TweenTemple()
                    end
                })
                V4Tab:NewButton({
                    Title = "Tween to current race door",
                    Description = "Tween to current character race door.",
                    Callback=  function() 
                        TweentoCurrentRaceDoor()
                    end
                })
                V4Tab:NewToggle("Kill Trial Players",{
                    Title = "Auto Kill Trial Players",
                    Description = "Auto Kill All Players In Trial Stage 2.",
                })
            end
            V4Tab:AddSection("Race")
            V4Tab:NewToggle("Auto Upgrade Race",{
                Title = "Auto Upgrade Race",
                Description = "Auto Upgrade Your Race V1 -> V3.",
            })
            PlRTAB:AddSection("Local Player") 
            PlRTAB:NewButton({
                Title = "Remove Fog",
                Callback = function()
                    local c = game.Lighting
                    c.FogEnd = 100000
                    for i, v in pairs(c:GetDescendants()) do
                        if v:IsA("Atmosphere") then
                            v:Destroy()
                        end
                    end
                end
            })
            AutoActiveRace_Toggle = PlRTAB:NewToggle("Auto Active Race",{
                Title = "Auto Active Race V4 When Full Meter",
                Description = "Automatic active race v4 in anytime."
            })
            PlRTAB:NewToggle("Mods Character",{
                Title = "Mods Character",
                Description = "Mods specials ability on your character."
            })  
            Islands = GetAllIsland()
            RealIsland = {}
            NPCs = GetALLNPC()
            RealNPC = {};
            for i,v in pairs(NPCs) do 
                table.insert(RealNPC,i)
            end
            for i,v in pairs(Islands) do 
                table.insert(RealIsland,i)
            end
            table.sort(RealNPC)
            table.sort(RealIsland)
            PlRTAB:NewDropdown("Selected NPC",{
                Title = "Select NPC to tween",
                Description = "Select a npc to script tween to.",
                Values = RealNPC,
                Callback = function(v)
                    v = NPCs[v]
                    Tweento(v)
                end
            }) 
            PlRTAB:NewDropdown("Selected Island",{
                Title = "Select Island to tween",
                Description = "Select a Island to script tween to.",
                Values = RealIsland,
                Callback = function(v)
                    v = Islands[v] 
                    v = CFrame.new(v)
                    Tweento(v)
                end
            }) 
            PlRTAB:AddSection("ESP")
            PlRTAB:NewToggle("ESP Fruit",{
                Title = "ESP Fruits",
                Description = "Add ESP on fruits.",
            })  
            PlRTAB:NewToggle("ESP Player",{
                Title = "ESP Player",
                Description = "Add ESP on Players.",
            }) 
            if SeaBeastTab then 
                SeaBeastTab:NewParagraph({
                    Title = "Sea Beast Notes",
                    Content = "For Sea beast or Pirate boats, script always buy dragon claw and use weapon that stats > 1 to spam skills.\n\n\nSETTING SKILLS IN SETTING TAB"
                })
                SeaBeastTab:NewToggle("Auto Sea Beast",{
                    Title = "Auto Sea Beast",
                    Description = "Killing Sea Beast if they spawned."
                })
                SeaBeastTab:NewToggle("Buy Boat",{
                    Title = "Buy Boat And Wait",
                    Description = "This option enable with auto sea beast will buy a boat then wait sea beast or pirate boat spawns."
                })
                if Sea3 then 
                    SeaBeastTab:AddSection("Rough Sea")
                    SeaBeastTab:NewToggle("Auto Sail",{
                        Title = "Auto Sail",
                        Description = "Auto buy and go on the boat then go to N place",
                    })
                    SeaBeastTab:NewToggle("Auto Ghost Ship",{
                        Title = "Auto Ghost Ships",
                        Description = "Auto Killing Ghost Ships."
                    })
                    SeaBeastTab:NewToggle("Auto Shark & Mobs",{
                        Title = "Auto Kill Shark & Mobs On Sea",
                        Description = "Auto Kill Shark & Mobs",
                    }) 
                end
            end  
            if WeaponTab then 
                WeaponTab:AddSection("Item Puzzle")
                if Sea2 or Sea3 then
                    WeaponTab:NewToggle("Auto Soul Guitar",{
                        Title = "Auto Soul Guitar",
                        Description = "Auto do all things need to unlock soul guitar (req 5kf already)."
                    })            
                elseif Sea1 then 
                    WeaponTab:AddSection("Oops...")
                end 
                if Sea3 then 
                    WeaponTab:NewToggle("Auto CDK",{
                        Title = "Auto Cursed Dual Katana",
                        Description = "Auto do Cursed Dual Katana Puzzle to unlock."
                    }) 
                end
            end
            if ShopTab then  
                ShopTab:NewButton({
                    Title = "Buy Gear",
                    Description = "Buy Gear",
                    Callback = function()
                        BuyGear()
                    end
                })
                AutoBuyGear_Toggle = ShopTab:NewToggle("Auto Buy Gear",{
                    Title = "Auto Buy Gear",
                    Description = "Auto check & buy gears."
                })
                ShopTab:NewToggle("Auto Roll Bone",{
                    Title = "Auto Random Bone",
                    Description = "Auto Random Suprises by using bone."
                })
                ShopTab:NewDropdown("Selected Buy Melee",{
                    Title = "Select Melee to buy",
                    Values = MeleeInGame,
                    Callback = function(v)
                        BuyMelee(v)
                    end,
                    Description = "Buying Melee by clicking to them."
                })
                ShopTab:NewButton({
                    Title = "Buy ghoul race",
                    Description = "Buy Ghoul Race required owned",
                    Callback = function() 
                        local args = {
                            [1] = "Ectoplasm",
                            [2] = "BuyCheck",
                            [3] = 4
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        local args = {
                            [1] = "Ectoplasm",
                            [2] = "Change",
                            [3] = 4
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                })
                ShopTab:NewButton({
                    Title = "Buy Cyborg Race",
                    Description = "Buy cyborg race if owned already (cost 2500f)",
                    Callback = function() 
                        local args = {
                            [1] = "CyborgTrainer",
                            [2] = "Buy"
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                })
                ShopTab:NewButton({
                    Title = "Reroll Race",
                    Description = "Reroll race by firing remotes (cost 1500f).",
                    Callback = function()  
                        local args = {
                            [1] = "BlackbeardReward",
                            [2] = "Reroll",
                            [3] = "2"
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                }) 
                ShopTab:NewButton({
                    Title = "Buy Reset Stats",
                    Description = "Buy Reset Stats (cost 2500f).",
                    Callback = function() 
                        local args = {
                            [1] = "BlackbeardReward",
                            [2] = "Refund",
                            [3] = "2"
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                })
            end
            if RaidTab then 
                RaidTab:AddSection("Fruit-Farm")
                RaidTab:NewToggle("Auto Find Fruit",{
                    Title = "Auto Find Fruit",
                    Description = "Auto Find/Collect all fruits script can find in server."
                })
                RaidTab:NewToggle("Ignore Stored Fruit",{
                    Title = "Ignore Stored Fruit",
                    Description = "Ignore fruit that you have stored in inventory."
                })
                RaidTab:NewToggle("Auto Store Fruit",{
                    Title = "Auto Store Fruit",
                    Description = "Store all fruit that can storeable in chacracter."
                })
                RaidTab:NewToggle("Auto Random Fruit",{
                    Title = "Auto Random Fruit",
                    Description = "Auto talk and random fruit to Blox Fruit Cousin Dealer."
                })
                RaidTab:NewToggle("Auto Get Fruit Below 1M To Raid",{
                    Title = "Auto load fruit below 1m beli to raid",
                }) 
                if Sea1 then 
                    RaidTab:AddSection("Raid-Farm is not available in current sea.")
                else
                    RaidTab:AddSection("Raid-Farm")
                    RaidTab:NewToggle("Kill Aura",{
                        Title = "Kill Aura",
                        Description = "Auto kill (no reward) mobs that character can see."
                    })
                    RaidTab:NewToggle("Auto Next Island",{
                        Title = "Auto Tween/Teleport Next Raid Island",
                        Description = "Auto Tween/Teleport to next raid island while raiding."
                    })
                    RaidTab:NewButton({
                        Title = "Tween to next raid island",
                        Description = "Like name",
                        Callback = function() 
                            Tweento(getNextIsland().CFrame * CFrame.new(0, 60, 0))
                        end
                    })
                    RaidTab:NewToggle("Auto Awake",{
                        Title = "Auto Awake",
                        Description = "Auto awake skills of current fruit."
                    }) 
                    RaidTab:NewDropdown("Raid Selected",{
                        Title = "Choose Raid Type",
                        Description = "Choose a raid type. When enable auto raid will automatic buy chips and do raid.",
                        Values = RealRaid,
                        Default = "Flame"
                    }) 
                    RaidTab:NewToggle("Auto Raid",{
                        Title = "Auto Raid",
                        Description = "Auto buy chips and raid while enabled."
                    })
                end
            end
            if SettingTab then 
                SettingTab:NewToggle("HopOption",{
                    Title = "Hop Option",
                    Description = "Allow hop for some functions."
                }) 
                SettingTab:NewToggle("HopLowOption",{
                    Title = "Hop Low Option",
                    Description = "Allow hop low for some functions."
                }) 
                SettingTab:NewToggle("Panic Mode",{
                    Title = "Panic Mode",
                    Description = "Tween above mob while health below 30% and back to kill it when health >= 70%."
                })
                ChooseTeam_Dropdown =SettingTab:NewDropdown("Team",{ 
                    Title = "Choose team",
                    Description = "Choose team auto pick when game begin",
                    Values = {
                        "Pirates",
                        "Marines",
                    },
                    Multi = false,
                })
                UseWeapon_Dropdown =SettingTab:NewDropdown("Use Weapon",{ 
                    Title = "Choose weapon to use skills",
                    Description = "Choose weapon to use skill on sea beast/pirate boat.",
                    Values = {
                        "Melee",
                        "Devil Fruit",
                        "Sword",
                        "Gun"
                    },
                    Multi = true,
                })
                UseSkills_Dropdown = SettingTab:NewDropdown("Use Skills",{
                    Title = "Choose Skill To Spam",
                    Description = "Choose Skills to spam on sea beast/pirate boat.",
                    Values = {
                        "Z",
                        "X",
                        "C",
                        "V",
                        "F"
                    },
                    Multi = true,
                }) 
                SettingTab:NewToggle("Auto Spam Skill",{
                    Title = "Auto Spam skill ngu",
                })
                task.spawn(function()
                    while task.wait() do 
                        if Config["Auto Spam Skill"] or autospamskill then 
                            autoskill()
                        end
                    end
                end)
                for i,v in pairs({
                    "Z",
                    "X",
                    "C",
                    "V",
                    "F"
                }) do 
                    SettingTab:NewSlider("Hold Time "..tostring(v),{
                        Title = "Skill "..tostring(v).." hold time",
                        Description = "Skill "..tostring(v).." hold time when use",
                        Min = 0,
                        Max = 15,
                        Rounding = 1,
                    }) 
                end
                task.spawn(function()
                    while task.wait() do  
                        svstats,svstats2 = pcall(function()  
                            haki1, haki2 = CheckHakiColor()
                            SV3 = "Player In Server: "..tostring(PlayersCount()).."/"..game.Players.MaxPlayers.."\n".."Server Time: " .. function8().."\nAcient One Status: " .. tostring(CheckAcientOneStatus())..
                            "\nCake Prince Status: " .. tostring(CheckCakePrinceStatus())..
                            "\nMirage Puzzle: " .. tostring(CheckGatCan())..
                            "\nMirage Island: " .. tostring(CheckMirageIslandStatus())..
                            "\nElite: "..CheckEliteStatus()..
                            "\nRace: " .. tostring(CheckRace())
                            if not Sea1 then 
                                SV3 = SV3.."\nHaki Color: " .. tostring(haki1) .. " | " .. haki2
                            end
                            ServerStats_Paragraph:Set(
                                {
                                    Title = "Server & Player Informations",
                                    Content = SV3
                                }
                            )
                        end)
                        if not svstats then print("sv stats",svstats2)end 
                    end
                end)
            end
        end  
        do 
            if getgenv().ToiLaSellerNhi then 
                if Sea3 then 
                    SellerNhiConfig = {
                        Trial = TrialStage1_Toggle,
                        ChooseGear = AutoChooseGear_Toggle,
                        Farm = Farm_Toggle,
                        FarmType = SelectTypeFarm_Dropdown,
                        DoubleQuest = DoubleQuest_Toggle,
                        ActiveRace = AutoActiveRace_Toggle,
                        BuyGear = AutoBuyGear_Toggle,
                    }
                    SellerNhiConfig.Trial:Set(true)
                    SellerNhiConfig.Farm:Set(false)
                    SellerNhiConfig.FarmType:Set({
                        "Cake Prince"
                    })
                    SellerNhiConfig.DoubleQuest:Set(true)
                    SellerNhiConfig.BuyGear:Set(true) 
                    SellerNhiConfig.ActiveRace:Set(true) 
                    SellerNhiConfig.ChooseGear:Set(true) 
                    task.spawn(function()
                        while task.wait(1) do 
                            if string.find(CheckAcientOneStatus(),"train") or string.find(CheckAcientOneStatus(),"Train") then 
                                SellerNhiConfig.Farm:Set(true)
                            else
                                SellerNhiConfig.Farm:Set(false) 
                                TweentoCurrentRaceDoor()
                            end
                        end
                    end)
                elseif Sea2 then 
                    TeleportWorld(3)
                end
            end 
        end
        do
            task.spawn(
                function()
                    while task.wait() do
                        Vc = ""
                        for i, v in pairs(Config) do
                            if typeof(v) ~= "table" then
                                Vc = Vc .. tostring(i) .. " : " .. tostring(v) .. "\n"
                            else
                                v3 = ""
                                for i2, v2 in pairs(v) do
                                    if v2 then
                                        v3 = v3 .. tostring(i2) .. ", "
                                    end
                                end
                                Vc = Vc .. tostring(i) .. " : " .. v3 .. "\n"
                            end
                        end
                        vc2 = ""
                        vc3 = GetBossTable()
                        for i, v in pairs(vc3) do
                            vc3[i] = RemoveLevelTitle(v)
                        end
                        for i, v in pairs(getBossSeaHub()) do
                            if CheckBoss(v) then
                                vc2 = vc2 .. v .. ": ✅\n"
                            else
                                vc2 = vc2 .. v .. ": ❌\n"
                            end
                        end
                        Settings_Paragraph:Set({Title = MySea.." | " .. tostring(MMBStatus), Content = vc2})
                    end
                end
            )
        end
        ------ Attack Functions ---------
        
        loadstring(game:HttpGet("https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/FastAttackLoader.lua"))()
        -- Final Load --
        LoadedUiHub = true
        Window:SelectTab(1)
        Fluent:Notify(
            {
                Title = "Tsuo Hub",
                Content = "The script has been loaded successful.",
                Duration = 15
            }
        )
            else
        RemoveKey()
        Notify.New('key expired / does not exist', 5)
    	print('key expired / does not exist')
        sign_match = nil
        securekeyprivate = nil
        response = nil
        privatekeyclient = nil
        client_id = nil
        client_req = nil
        client_hwid = nil
        client_ip = nil 
        server_time = nil
        sp = nil
        rndStr = nil
        client_sign = nil
        decode_response = nil
    end
end

spawn(function()
    local KEY = ReadKey()
    if KEY and #KEY >= 2 then
        object.Desc.Text = 'Succesfully loaded key!'
        Notify.New("Succesfully loaded key!", 5)
        wl(KEY)
    end
end)

object.CheckKey.MouseButton1Click:Connect(function()
    if not GetKeyText() or #GetKeyText() < 10 then
        object.Desc.Text = 'Please input your key';
        spawn(function()
            delay(5, function()
                object.Desc.Text = "Click 'Get Key' button to get your key!"
            end);
        end)
        return
    end
    wl(GetKeyText())
end)
 
object.GetKey.MouseButton1Click:Connect(function()
    print('get key')
    --object.Desc.Text = 'cccc'
    local link = (URL..'getkey?hwid=%s'):format(REQ({Url = URL..'api/hwid', Method = 'GET'}).Body)
    object.TextBox.Text = link
    setclipboard(link)
end)

