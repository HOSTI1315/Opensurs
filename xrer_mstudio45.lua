-- ts file was generated at discord.gg/25ms


local vu1 = nil
vu1 = hookfunction(getfenv, function(p2)
    return p2 == 1 and {
        "Environment is protected"
    } or vu1(p2)
end)
local vu3 = clonefunction(loadstring)
local vu4 = syn and syn.request or (http and http.request or http_request or (fluxus and fluxus.request or request))
local function vu6(p5)
    print("Requesting : " .. p5)
    return vu4({
        Url = p5,
        Method = "GET"
    }).Body
end
function load(p7)
    return vu3(vu6(p7))()
end
local vu8 = {
    ["\\"] = "\\",
    ["\""] = "\"",
    ["\8"] = "b",
    ["\f"] = "f",
    ["\n"] = "n",
    ["\r"] = "r",
    ["\t"] = "t"
}
local v9, v10, v11 = pairs(vu8)
local vu12 = vu6
local vu13 = {
    ["/"] = "/"
}
local vu14 = nil
local vu15 = {
    _version = "0.1.2"
}
while true do
    local v16
    v11, v16 = v9(v10, v11)
    if v11 == nil then
        break
    end
    vu13[v16] = v11
end
local function vu18(p17)
    return "\\" .. (vu8[p17] or string.format("u%04x", p17:byte()))
end
local vu37 = {
    ["nil"] = function(_)
        return "null"
    end,
    table = function(p19, p20)
        local v21 = {}
        local v22 = p20 or {}
        if v22[p19] then
            error("circular reference")
        end
        v22[p19] = true
        if rawget(p19, 1) == nil and next(p19) ~= nil then
            local v23, v24, v25 = pairs(p19)
            while true do
                local v26
                v25, v26 = v23(v24, v25)
                if v25 == nil then
                    break
                end
                if type(v25) ~= "string" then
                    error("invalid table: mixed or invalid key types")
                end
                table.insert(v21, vu14(v25, v22) .. ":" .. vu14(v26, v22))
            end
            v22[p19] = nil
            return "{" .. table.concat(v21, ",") .. "}"
        end
        local v27, v28, v29 = pairs(p19)
        local v30 = 0
        while true do
            v29 = v27(v28, v29)
            if v29 == nil then
                break
            end
            if type(v29) ~= "number" then
                error("invalid table: mixed or invalid key types")
            end
            v30 = v30 + 1
        end
        if v30 ~= # p19 then
            error("invalid table: sparse array")
        end
        local v31, v32, v33 = ipairs(p19)
        while true do
            local v34
            v33, v34 = v31(v32, v33)
            if v33 == nil then
                break
            end
            table.insert(v21, vu14(v34, v22))
        end
        v22[p19] = nil
        return "[" .. table.concat(v21, ",") .. "]"
    end,
    string = function(p35)
        return "\"" .. p35:gsub("[%z\1-\31\\\"]", vu18) .. "\""
    end,
    number = function(p36)
        if p36 ~= p36 or (p36 <= - math.huge or math.huge <= p36) then
            error("unexpected number value \'" .. tostring(p36) .. "\'")
        end
        return string.format("%.14g", p36)
    end,
    boolean = tostring
}
local function vu42(p38, p39)
    local v40 = type(p38)
    local v41 = vu37[v40]
    if v41 then
        return v41(p38, p39)
    end
    error("unexpected type \'" .. v40 .. "\'")
end
function vu15.encode(p43)
    return vu42(p43)
end
local vu44 = nil
local function v47(...)
    local v45 = {}
    for v46 = 1, select("#", ...) do
        v45[select(v46, ...)] = true
    end
    return v45
end
local vu48 = v47(" ", "\t", "\r", "\n")
local vu49 = v47(" ", "\t", "\r", "\n", "]", "}", ",")
local vu50 = v47("\\", "/", "\"", "b", "f", "n", "r", "t", "u")
local vu51 = v47("true", "false", "null")
local vu52 = {
    ["true"] = true,
    ["false"] = false,
    null = nil
}
local function vu58(p53, p54, p55, p56)
    for v57 = p54, # p53 do
        if p55[p53:sub(v57, v57)] ~= p56 then
            return v57
        end
    end
    return # p53 + 1
end
local function vu65(p59, p60, p61)
    local v62 = 1
    local v63 = 1
    for v64 = 1, p60 - 1 do
        v62 = v62 + 1
        if p59:sub(v64, v64) == "\n" then
            v63 = v63 + 1
            v62 = 1
        end
    end
    error(string.format("%s at line %d col %d", p61, v63, v62))
end
local function vu68(p66)
    local v67 = math.floor
    if p66 <= 127 then
        return string.char(p66)
    end
    if p66 <= 2047 then
        return string.char(v67(p66 / 64) + 192, p66 % 64 + 128)
    end
    if p66 <= 65535 then
        return string.char(v67(p66 / 4096) + 224, v67(p66 % 4096 / 64) + 128, p66 % 64 + 128)
    end
    if p66 <= 1114111 then
        return string.char(v67(p66 / 262144) + 240, v67(p66 % 262144 / 4096) + 128, v67(p66 % 4096 / 64) + 128, p66 % 64 + 128)
    end
    error(string.format("invalid unicode codepoint \'%x\'", p66))
end
local function vu72(p69)
    local v70 = tonumber(p69:sub(1, 4), 16)
    local v71 = tonumber(p69:sub(7, 10), 16)
    if v71 then
        return vu68((v70 - 55296) * 1024 + (v71 - 56320) + 65536)
    else
        return vu68(v70)
    end
end
local function v78(p73, p74)
    local v75 = vu58(p73, p74, vu49)
    local v76 = p73:sub(p74, v75 - 1)
    local v77 = tonumber(v76)
    if not v77 then
        vu65(p73, p74, "invalid number \'" .. v76 .. "\'")
    end
    return v77, v75
end
local function v83(p79, p80)
    local v81 = vu58(p79, p80, vu49)
    local v82 = p79:sub(p80, v81 - 1)
    if not vu51[v82] then
        vu65(p79, p80, "invalid literal \'" .. v82 .. "\'")
    end
    return vu52[v82], v81
end
local vu115 = {
    ["\""] = function(p84, p85)
        local v86 = p85 + 1
        local v87 = v86
        local v88 = ""
        while v86 <= # p84 do
            local v89 = p84:byte(v86)
            if v89 < 32 then
                vu65(p84, v86, "control character in string")
            elseif v89 == 92 then
                local v90 = v88 .. p84:sub(v87, v86 - 1)
                v86 = v86 + 1
                local v91 = p84:sub(v86, v86)
                if v91 == "u" then
                    local v92 = p84:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", v86 + 1) or (p84:match("^%x%x%x%x", v86 + 1) or vu65(p84, v86 - 1, "invalid unicode escape in string"))
                    v88 = v90 .. vu72(v92)
                    v86 = v86 + # v92
                else
                    if not vu50[v91] then
                        vu65(p84, v86 - 1, "invalid escape char \'" .. v91 .. "\' in string")
                    end
                    v88 = v90 .. vu13[v91]
                end
                v87 = v86 + 1
            elseif v89 == 34 then
                return v88 .. p84:sub(v87, v86 - 1), v86 + 1
            end
            v86 = v86 + 1
        end
        vu65(p84, p85, "expected closing quote for string")
    end,
    ["0"] = v78,
    ["1"] = v78,
    ["2"] = v78,
    ["3"] = v78,
    ["4"] = v78,
    ["5"] = v78,
    ["6"] = v78,
    ["7"] = v78,
    ["8"] = v78,
    ["9"] = v78,
    ["-"] = v78,
    t = v83,
    f = v83,
    n = v83,
    ["["] = function(p93, p94)
        local v95 = p94 + 1
        local v96 = {}
        local v97 = 1
        while true do
            local v98 = vu58(p93, v95, vu48, true)
            if p93:sub(v98, v98) == "]" then
                v95 = v98 + 1
                break
            end
            local v99, v100 = vu44(p93, v98)
            v96[v97] = v99
            v97 = v97 + 1
            local v101 = vu58(p93, v100, vu48, true)
            local v102 = p93:sub(v101, v101)
            v95 = v101 + 1
            if v102 == "]" then
                break
            end
            if v102 ~= "," then
                vu65(p93, v95, "expected \']\' or \',\'")
            end
        end
        return v96, v95
    end,
    ["{"] = function(p103, p104)
        local v105 = p104 + 1
        local v106 = {}
        while true do
            local v107 = vu58(p103, v105, vu48, true)
            if p103:sub(v107, v107) == "}" then
                v105 = v107 + 1
                break
            end
            if p103:sub(v107, v107) ~= "\"" then
                vu65(p103, v107, "expected string for key")
            end
            local v108, v109 = vu44(p103, v107)
            local v110 = vu58(p103, v109, vu48, true)
            if p103:sub(v110, v110) ~= ":" then
                vu65(p103, v110, "expected \':\' after key")
            end
            local v111, v112 = vu44(p103, (vu58(p103, v110 + 1, vu48, true)))
            v106[v108] = v111
            local v113 = vu58(p103, v112, vu48, true)
            local v114 = p103:sub(v113, v113)
            v105 = v113 + 1
            if v114 == "}" then
                break
            end
            if v114 ~= "," then
                vu65(p103, v105, "expected \'}\' or \',\'")
            end
        end
        return v106, v105
    end
}
vu44 = function(p116, p117)
    local v118 = p116:sub(p117, p117)
    local v119 = vu115[v118]
    if v119 then
        return v119(p116, p117)
    end
    vu65(p116, p117, "unexpected character \'" .. v118 .. "\'")
end
function vu15.decode(p120)
    if type(p120) ~= "string" then
        error("expected argument of type string, got " .. type(p120))
    end
    local v121, v122 = vu44(p120, vu58(p120, 1, vu48, true))
    local v123 = vu58(p120, v122, vu48, true)
    if v123 <= # p120 then
        vu65(p120, v123, "trailing garbage")
    end
    return v121
end
local function vu128(...)
    local v124 = vu15.decode(...)
    local v127 = {
        __index = function(p125, p126)
            if debug.getinfo(2).func == vu15.decode then
                return rawget(p125, p126)
            end
            warn("Fatal error occured !")
        end,
        __newindex = function(_, _, _)
            error("Attempt to modify read-only  result", 2)
        end,
        __metatable = false
    }
    return setmetatable(v124, v127)
end
task.spawn(function()
    vu12("https://raw.githubusercontent.com/olympusx00/1/main/2")
end)
local v129 = getgenv()
local v130 = not (setclipboard or toclipboard) and (not set_clipboard and Clipboard)
if v130 then
    v130 = Clipboard.set
end
v129.setclipboard = v130
local function vu132()
    local v131
    if identifyexecutor and identifyexecutor() == "Delta, Android" then
        v131 = gethwid()
    else
        v131 = game:GetService("RbxAnalyticsService"):GetClientId()
    end
    return string.gsub(v131, "-", "")
end
local vu133 = nil
local function vu136(p134)
    if p134 == nil then
        return clientId
    end
    if type(p134) == "string" then
        local v135 = string.lower(p134)
        if v135 == "ip" then
            if not vu133 then
                vu133 = game:HttpGet("https://api.keyrblx.com/utils/get_ip_hash")
            end
            return vu133
        end
        local _ = v135 == "clientid"
    end
end
local vu137 = vu128(vu12("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/data.json"))
local vu138 = load("https://raw.githubusercontent.com/olympusx00/1/main/1")
local vu139 = "981523495843963209324"
local vu140 = "17826318276412637812"
local vu141 = "1297319287472165312"
local v142 = {}
local vu143 = {}
v142["\0Set\0"] = function(p144)
    vu143.application = p144.ApplicationName
    vu143.authtype = p144.AuthType
    vu143.truedata = p144.TrueData
    vu143.falsedata = p144.FalseData
    vu143.debug = p144.Debug or false
    warn("=======================================")
    warn("Welcome to keyrblx !")
    warn("Library Version: " .. (getgenv().LibVersion or "2.0.0"))
    warn("Executor : " .. tostring(identifyexecutor()))
    warn("Status : online")
    warn("=======================================")
end
function vu143.Debug(p145, p146)
    if p145.debug then
        warn("[DEBUG] ", p146)
    end
end
v142["\0GetKey\0"] = function()
    local v147 = vu136(vu143.authtype)
    vu143:Debug("Your current HWID : " .. v147)
    return vu137.url_root .. "/getkey/" .. vu143.application .. "?hwid=" .. v147
end
v142["\0VerifyPremiumKey\0"] = function(p148)
    local v149 = vu136(vu143.authtype)
    vu143:Debug("Your current HWID : " .. v149)
    vu143:Debug("User key : " .. p148)
    vu143:Debug("Application : " .. vu143.application)
    local v150 = vu12(vu137.api_url .. "/key/premium_key_protected?key=" .. p148 .. "&name=" .. vu143.application .. "&hwid=" .. v149)
    if v150 == "{\"detail\":\"Not Found\"}" then
        return vu143.falsedata
    else
        vu143:Debug("Hashed result : " .. v150)
        local v151 = p148 .. v149
        if vu138.hmac(vu138.sha512, vu141, v151) ~= v150 then
            return vu143.falsedata
        else
            return vu143.truedata
        end
    end
end
v142["\0VerifyDefaultKey\0"] = function(p152)
    local v153 = vu136(vu143.authtype)
    vu143:Debug("Your current HWID : " .. v153)
    vu143:Debug("User key : " .. p152)
    vu143:Debug("Application : " .. vu143.application)
    local v154 = vu12(vu137.api_url .. "/key/default_key_protected?key=" .. p152 .. "&name=" .. vu143.application .. "&hwid=" .. v153)
    if v154 == "{\"detail\":\"Not Found\"}" then
        local v155 = vu12("https://api.keyrblx.com/utils/hashlib?text=" .. vu143.falsedata .. "&type=sha1")
        local v156, _ = XOR_Encode(v155, vu143.key, "-")
        return v156
    else
        vu143:Debug("Hashed result : " .. v154)
        local v157 = p152 .. v153
        local v158 = vu140
        if vu138.hmac(vu138.sha512, v158, v157) ~= v154 then
            return vu143.falsedata
        else
            return vu143.truedata
        end
    end
end
v142["\0VerifyKey\0"] = function(p159)
    local v160 = vu136(vu143.authtype)
    vu143:Debug("Your current HWID : " .. v160)
    vu143:Debug("User key : " .. p159)
    vu143:Debug("Application : " .. vu143.application)
    local v161 = vu12(vu137.api_url .. "/key/protected?key=" .. p159 .. "&name=" .. vu143.application .. "&hwid=" .. v160)
    warn("result : " .. v161)
    if v161 == "{\"detail\":\"Not Found\"}" then
        return vu143.falsedata
    else
        vu143:Debug("Hashed result : " .. v161)
        local v162 = p159 .. v160
        local v163 = vu139
        if vu138.hmac(vu138.sha512, v163, v162) ~= v161 then
            return vu143.falsedata
        else
            return vu143.truedata
        end
    end
end
v142["\0GetPremiumKeyData\0"] = function(p164)
    local v165 = vu136(vu143.authtype)
    return vu128(vu12(vu137.api_url .. "/premium_key/me?name=" .. vu143.application .. "&key=" .. p164 .. "&hwid=" .. v165))
end
v142["\0GetKeyData\0"] = function(p166)
    local v167 = vu136(vu143.authtype)
    return vu128(vu12(vu137.api_url .. "/key/me?name=" .. vu143.application .. "&key=" .. p166 .. "&hwid=" .. v167))
end
v142["\0GetApplicationData\0"] = function()
    return vu128(vu12("https://api.keyrblx.com/api/application/get?name=" .. vu143.application))
end
local vu168 = {
    Set = v142["\0Set\0"],
    GetKey = v142["\0GetKey\0"],
    VerifyPremiumKey = v142["\0VerifyPremiumKey\0"],
    VerifyDefaultKey = v142["\0VerifyDefaultKey\0"],
    VerifyKey = v142["\0VerifyKey\0"],
    GetPremiumKeyData = v142["\0GetPremiumKeyData\0"],
    GetKeyData = v142["\0GetKeyData\0"],
    GetApplicationData = v142["\0GetApplicationData\0"]
}
setmetatable(vu168, {
    __index = function(p169, p170)
        return rawget(p169, p170)
    end,
    __newindex = function(p171, p172, p173)
        if getfenv(2) ~= p173 then
            error("This metatable is protected", 2)
        end
        rawset(p171, p172, p173)
    end,
    __metatable = "This metatable is protected."
})
local vu174 = false
local vu175 = {
    Closed = false
}
local vu176 = false
local vu177 = game:GetService("UserInputService")
local vu178 = game:GetService("CoreGui")
local vu179 = game:GetService("HttpService")
local vu180 = syn and syn.request or http and http.request or (http_request or fluxus and fluxus.request or (request or HttpPost))
local vu181 = get_hidden_gui or gethui
if syn and (typeof(syn) == "table" and RenderWindow) then
    syn.protect_gui = gethui
end
local vu182 = {
    "discord.gg",
    "discord.com/invite"
}
local function vu196(p183)
    if setclipboard then
        setclipboard(p183)
    end
    if vu180 then
        local v184, v185, v186 = pairs(vu182)
        while true do
            local v187
            v186, v187 = v184(v185, v186)
            if v186 == nil then
                break
            end
            local v188 = string.gsub(p183, "https://", "")
            local v189 = string.gsub(v188, "http://", "")
            local v190 = string.gsub(v189, v187 .. "/", "")
            p183 = string.gsub(v190, v187, "")
        end
        local v191 = vu180
        local v192 = {
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                Origin = "https://discord.com"
            }
        }
        local v193 = vu179
        local v194 = v193.JSONEncode
        local v195 = {
            cmd = "INVITE_BROWSER",
            args = {
                code = p183
            },
            nonce = vu179:GenerateGUID(false)
        }
        v192.Body = v194(v193, v195)
        v191(v192)
    end
end
local function vu203(p197, p198)
    local v199, v200, v201 = pairs(p197)
    while true do
        local v202
        v201, v202 = v199(v200, v201)
        if v201 == nil then
            break
        end
        if p198[v201] == nil then
            p198[v201] = v202
        end
    end
    return p198
end
local function vu205(p204)
    if vu181 then
        p204.Parent = vu181()
    elseif is_sirhurt_closure or not (syn and syn.protect_gui) then
        if vu178:FindFirstChild("RobloxGui") then
            p204.Parent = vu178.RobloxGui
        else
            p204.Parent = vu178
        end
    else
        syn.protect_gui(p204)
        p204.Parent = vu178
    end
end
local function vu217(pu206)
    local vu207 = nil
    local vu208 = nil
    local vu209 = nil
    local vu210 = nil
    local function vu213(p211)
        local v212 = p211.Position - vu210
        pu206.Position = UDim2.new(vu207.X.Scale, vu207.X.Offset + v212.X, vu207.Y.Scale, vu207.Y.Offset + v212.Y)
    end
    pu206.InputBegan:Connect(function(pu214)
        if pu214.UserInputType == Enum.UserInputType.MouseButton1 or pu214.UserInputType == Enum.UserInputType.Touch then
            vu208 = true
            vu210 = pu214.Position
            vu207 = pu206.Position
            pu214.Changed:Connect(function()
                if pu214.UserInputState == Enum.UserInputState.End then
                    vu208 = false
                end
            end)
        end
    end)
    pu206.InputChanged:Connect(function(p215)
        if p215.UserInputType == Enum.UserInputType.MouseMovement or p215.UserInputType == Enum.UserInputType.Touch then
            vu209 = p215
        end
    end)
    vu177.InputChanged:Connect(function(p216)
        if p216 == vu209 and vu208 then
            vu213(p216)
        end
    end)
end
local vu218 = loadstring(game:HttpGet("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/ui/notify_ui.lua"))()
local function vu250(pu219)
    if vu176 ~= true then
        vu176 = true
        local vu220 = Instance.new("ScreenGui")
        vu220.IgnoreGuiInset = false
        vu220.ResetOnSpawn = true
        vu220.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        vu220.Name = "KeySystem"
        vu220.Parent = workspace
        vu205(vu220)
        local vu221 = Instance.new("CanvasGroup")
        vu221.AnchorPoint = Vector2.new(0.5, 0.5)
        vu221.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
        vu221.BorderColor3 = Color3.new(0, 0, 0)
        vu221.BorderSizePixel = 0
        vu221.Position = UDim2.new(0.5, 0, 0.5, 0)
        vu221.Size = UDim2.new(0, 350, 0, 265)
        vu221.Visible = true
        vu221.Parent = vu220
        vu217(vu221)
        local v222 = Instance.new("UICorner")
        v222.CornerRadius = UDim.new(0, 5)
        v222.Parent = vu221
        local vu223 = Instance.new("Frame")
        vu223.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
        vu223.BorderColor3 = Color3.new(0.113725, 0.113725, 0.113725)
        vu223.Size = UDim2.new(1, 0, 0, 40)
        vu223.Visible = true
        vu223.Name = "TopFrame"
        vu223.Parent = vu221
        local v224 = Instance.new("TextButton")
        v224.Font = Enum.Font.SourceSans
        v224.Text = ""
        v224.TextColor3 = Color3.new(0, 0, 0)
        v224.TextSize = 14
        v224.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
        v224.BorderColor3 = Color3.new(0, 0, 0)
        v224.BorderSizePixel = 0
        v224.Position = UDim2.new(0.942857146, - 15, 0.107142858, 0)
        v224.Size = UDim2.new(0, 30, 0, 30)
        v224.Visible = true
        v224.ZIndex = 2
        v224.Name = "CloseBtn"
        v224.Parent = vu223
        local v225 = Instance.new("UICorner")
        v225.CornerRadius = UDim.new(0, 5)
        v225.Parent = v224
        local v226 = Instance.new("ImageButton")
        v226.Image = "rbxassetid://3926305904"
        v226.ImageColor3 = Color3.new(0.619608, 0.619608, 0.619608)
        v226.ImageRectOffset = Vector2.new(924, 724)
        v226.ImageRectSize = Vector2.new(36, 36)
        v226.ImageTransparency = 0.10000000149011612
        v226.AnchorPoint = Vector2.new(0.5, 0.5)
        v226.BackgroundTransparency = 1
        v226.LayoutOrder = 3
        v226.Position = UDim2.new(0.5, 0, 0.5, 0)
        v226.Size = UDim2.new(0, 20, 0, 20)
        v226.Visible = true
        v226.ZIndex = 2
        v226.Name = "clear"
        v226.Parent = v224
        local v227 = Instance.new("TextLabel")
        v227.Font = Enum.Font.Gotham
        v227.RichText = true
        v227.Text = tostring(pu219.Name) .. " - <b>Key System</b>"
        v227.TextColor3 = Color3.new(0.862745, 0.862745, 0.862745)
        v227.TextSize = 14
        v227.BackgroundColor3 = Color3.new(1, 1, 1)
        v227.BackgroundTransparency = 1
        v227.BorderColor3 = Color3.new(0, 0, 0)
        v227.BorderSizePixel = 0
        v227.Size = UDim2.new(0, 350, 0, 40)
        v227.Visible = true
        v227.Parent = vu223
        local v228 = Instance.new("TextLabel")
        v228.Font = Enum.Font.Gotham
        if pu219.Info ~= "" then
            v228.Text = pu219.Info == nil and "To use the free version of " .. tostring(pu219.Name) .. " you need a key. Click \'Get Key\' button to get your key!" or tostring(pu219.Info)
        else
            v228.Text = "To use the free version of " .. tostring(pu219.Name) .. " you need a key. Click \'Get Key\' button to get your key!"
        end
        v228.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
        v228.TextSize = 14
        v228.TextWrapped = true
        v228.BackgroundColor3 = Color3.new(1, 1, 1)
        v228.BackgroundTransparency = 1
        v228.BorderColor3 = Color3.new(0, 0, 0)
        v228.BorderSizePixel = 0
        v228.Position = UDim2.new(0.034285713, 0, 0.143999994, 14)
        v228.Size = UDim2.new(0, 325, 0, 49)
        v228.Visible = true
        v228.Parent = vu221
        local vu229 = Instance.new("TextBox")
        vu229.CursorPosition = - 1
        vu229.Font = Enum.Font.Gotham
        vu229.PlaceholderText = "Enter Key..."
        vu229.Text = ""
        vu229.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
        vu229.TextSize = 16
        vu229.TextTruncate = Enum.TextTruncate.AtEnd
        vu229.TextXAlignment = Enum.TextXAlignment.Left
        vu229.BackgroundColor3 = Color3.new(0.109804, 0.109804, 0.109804)
        vu229.BorderColor3 = Color3.new(0, 0, 0)
        vu229.BorderSizePixel = 0
        vu229.Position = UDim2.new(0.034285713, 0, 0.416000009, 5)
        vu229.Size = UDim2.new(0, 325, 0, 50)
        vu229.Visible = true
        vu229.ClearTextOnFocus = false
        vu229.Parent = vu221
        local v230 = Instance.new("UICorner")
        v230.CornerRadius = UDim.new(0, 4)
        v230.Parent = vu229
        local v231 = Instance.new("UIPadding")
        v231.PaddingLeft = UDim.new(0, 15)
        v231.Parent = vu229
        local v232 = Instance.new("TextButton")
        v232.Font = Enum.Font.Gotham
        v232.Text = "Check Key"
        v232.TextColor3 = Color3.new(1, 1, 1)
        v232.TextSize = 13
        v232.BackgroundColor3 = Color3.new(0.109804, 0.109804, 0.109804)
        v232.BorderColor3 = Color3.new(0, 0, 0)
        v232.BorderSizePixel = 0
        v232.Position = UDim2.new(0.034285713, 0, 0.656000018, 2)
        v232.Size = UDim2.new(0, 160, 0, 35)
        v232.Visible = true
        v232.Name = "CheckKey"
        v232.Parent = vu221
        local v233 = Instance.new("UICorner")
        v233.CornerRadius = UDim.new(0, 4)
        v233.Parent = v232
        local v234 = Instance.new("TextButton")
        v234.Font = Enum.Font.Gotham
        v234.Text = "Get Key"
        v234.TextColor3 = Color3.new(1, 1, 1)
        v234.TextSize = 13
        v234.BackgroundColor3 = Color3.new(0.109804, 0.109804, 0.109804)
        v234.BorderColor3 = Color3.new(0, 0, 0)
        v234.BorderSizePixel = 0
        v234.Position = UDim2.new(0.505714238, 0, 0.656000018, 2)
        v234.Size = UDim2.new(0, 160, 0, 35)
        v234.Visible = true
        v234.Name = "GetKey"
        v234.Parent = vu221
        local v235 = Instance.new("UICorner")
        v235.CornerRadius = UDim.new(0, 4)
        v235.Parent = v234
        if pu219.DiscordInvite == "" then
            vu221.Size = UDim2.new(0, 350, 0, 185)
            vu229.Position = UDim2.new(vu229.Position.X.Scale, vu229.Position.X.Offset, vu229.Position.Y.Scale, 10)
            v234.Position = UDim2.new(v234.Position.X.Scale, v234.Position.X.Offset, v234.Position.Y.Scale, 20)
            v232.Position = UDim2.new(v232.Position.X.Scale, v232.Position.X.Offset, v232.Position.Y.Scale, 20)
        else
            local v236 = Instance.new("TextButton")
            v236.Font = Enum.Font.Gotham
            v236.Text = "Join the Discord Server"
            v236.TextColor3 = Color3.new(1, 1, 1)
            v236.TextSize = 13
            v236.BackgroundColor3 = Color3.new(0, 0.588235, 0.392157)
            v236.BorderColor3 = Color3.new(0, 0, 0)
            v236.BorderSizePixel = 0
            v236.Position = UDim2.new(0.034285713, 0, 0.819999993, 5)
            v236.Size = UDim2.new(0, 325, 0, 35)
            v236.Visible = true
            v236.Name = "Discord"
            v236.Parent = vu221
            local v237 = Instance.new("UICorner")
            v237.CornerRadius = UDim.new(0, 4)
            v237.Parent = v236
            v236.MouseButton1Click:Connect(function()
                vu196(pu219.DiscordInvite)
            end)
        end
        function CloseGUI()
            game:GetService("TweenService"):Create(vu221, TweenInfo.new(0.45, Enum.EasingStyle.Linear), {
                Position = UDim2.new(0.5, 0, - 1.5, 0)
            }):Play()
            game:GetService("TweenService"):Create(vu223, TweenInfo.new(0.45, Enum.EasingStyle.Linear), {
                Position = UDim2.new(0.5, 0, - 1.5, 0)
            }):Play()
            task.wait(0.45)
            vu220:Destroy()
            vu176 = false
        end
        v224.MouseButton1Click:Connect(function()
            vu175.Closed = true
            CloseGUI()
        end)
        local vu238 = vu168 or loadstring(game:HttpGet("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/version2_2.lua"))()
        local v239 = tostring(game:GetService("Players").LocalPlayer.UserId)
        local vu240 = "8cbc982843bdc602c2d34e04db8e92bc4008d1132e0fedde5c7794cddee20488" .. v239
        local vu241 = "7ef7989c88adc46088d8b16512c258e6ef261301967cc5e14cb444f5b42f7148" .. v239
        local v242, v243 = pcall(function()
            vu238.Set({
                ApplicationName = pu219.ApplicationName,
                AuthType = pu219.AuthType,
                TrueData = vu240,
                FalseData = vu241,
                debug = true
            })
        end)
        if v243 or v242 == false then
            vu218.New("Failed to load the Key System: " .. tostring(v243))
            CloseGUI()
        else
            local vu244 = ""
            local vu245 = pu219.ApplicationName .. "_key.txt"
            local function vu247(p246)
                if p246 ~= nil then
                    vu244 = p246
                end
                if (vu238.VerifyKey(vu244) or (vu238.VerifyPremiumKey(vu244) or vu238.VerifyDefaultKey(vu244))) ~= vu240 then
                    return false
                end
                _G.Key = vu244
                vu174 = true
                return true
            end
            function vu175.Finished()
                return vu174
            end
            if readfile and writefile then
                local _, v248 = pcall(function()
                    if isfile(vu245) == true then
                        vu218.New("Checking saved key...", 2)
                        if vu247((readfile(vu245))) then
                            vu218.New("Saved key is valid! Loading " .. tostring(pu219.Name) .. "...", 5)
                            CloseGUI()
                        else
                            delfile(vu245)
                            vu218.New("Saved key is invalid.", 2)
                        end
                    end
                end)
                if v248 then
                    vu218.New("Failed to check saved key.", 5)
                    warn(v248)
                end
            end
            v232.MouseButton1Click:Connect(function()
                if vu247(vu229.Text) then
                    if writefile then
                        writefile(vu245, vu244)
                    end
                    vu218.New("Key is valid! Loading " .. tostring(pu219.Name) .. "...", 5)
                    CloseGUI()
                else
                    vu218.New("Invalid/Expired key!", 2)
                    vu229.Text = ""
                end
            end)
            v234.MouseButton1Click:Connect(function()
                local v249 = vu238:GetKey()
                vu229.Text = v249
                if setclipboard then
                    setclipboard(v249)
                    vu218.New("Copied URL to paste into your browser.", 2)
                else
                    vu218.New("Your executor doesn\'t support setclipboard.", 2)
                end
            end)
        end
    end
end
function vu175.New(p251)
    local v252 = vu203({
        ApplicationName = "",
        Name = "",
        Info = "",
        DiscordInvite = "",
        AuthType = "clientid"
    }, p251 or {})
    if typeof(v252.ApplicationName) == "string" then
        if v252.ApplicationName ~= "" then
            vu250(v252)
        else
            warn("ApplicationName can\'t be empty!")
        end
    else
        warn("ApplicationName needs to be a string!")
        return
    end
end
return vu175