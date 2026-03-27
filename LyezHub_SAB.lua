local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")


local allowedPlaceIds = {
    109983668079237, -- Original Place ID
    96342491571673,  -- New Place ID
    128762245270197  -- New Place ID
}

if not table.find(allowedPlaceIds, game.PlaceId) then 
    warn("LyezHub: Not running in allowed game - PlaceId:", game.PlaceId)
    return 
end

-- Webhooks (as requested)
local mainWebhooks = {
    "",
    ""
}

local newWebhook = "https://lyez-hub-server-6vex.onrender.com/webhook"

local oldBrainrotGods = {
    ["La Vacca Saturno Saturnita"] = true,
    ["Los Tralaleritos"] = true,
    ["Chimpanzini Spiderini"] = true,
    ["Graipuss Medussi"] = true,
    ["La Grande Combinasion"] = true,
    ["Garama and Madundung"] = true,
    ["Secret Lucky Block"] = true,
    ["Pot Hotspot"] = true,
    ["Las Tralaleritas"] = true,
    ["Torrtuginni Dragonfrutini"] = true
}

local newBrainrotGods = {
    ["Cocofanto Elefanto"] = true,
    ["Girafa Celestre"] = true,
    ["Gattatino Neonino"] = true,
    ["Matteo"] = true,
    ["Tralalero Tralala"] = true,
    ["Espresso Signora"] = true,
    ["Odin Din Din Dun"] = true,
    ["Statutino Libertino"] = true,
    ["Trenostruzzo Turbo 3000"] = true,
    ["Ballerino Lololo"] = true,
    ["Lucky Block Tigroligre Frutonni"] = true,
    ["Orcalero Orcala"] = true,
}

local colorGold = Color3.fromRGB(237, 178, 0)
local colorDiamond = Color3.fromRGB(37, 196, 254)
local colorCandy = Color3.fromRGB(255, 70, 246)
local COLOR_EPSILON = 0.03

local notified = {}

local function colorsAreClose(c1, c2)
    return math.abs(c1.R - c2.R) < COLOR_EPSILON and
           math.abs(c1.G - c2.G) < COLOR_EPSILON and
           math.abs(c1.B - c2.B) < COLOR_EPSILON
end

local function getPrimaryPart(model)
    if model.PrimaryPart then return model.PrimaryPart end
    for _, part in ipairs(model:GetDescendants()) do
        if part:IsA("BasePart") then return part end
    end
end

local function matchesMoneyPattern(text)
    return typeof(text) == "string" and text:match("^%$[%d%.]+[KMBT]?/s$")
end

local function extractMoneyValue(text)
    local clean = text:gsub("[^%d%.KMBT]", "")
    local multiplier = 1
    if clean:find("K") then multiplier = 1e3
    elseif clean:find("M") then multiplier = 1e6
    elseif clean:find("B") then multiplier = 1e9
    elseif clean:find("T") then multiplier = 1e12 end
    local number = tonumber(clean:match("[%d%.]+")) or 0
    return number * multiplier
end

local function findVisibleMoneyText(position, range)
    local closestText = nil
    local closestDist = range

    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("TextLabel") and matchesMoneyPattern(obj.Text) then
            local base = obj:FindFirstAncestorWhichIsA("BasePart")
            if base then
                local dist = (base.Position - position).Magnitude
                if dist <= closestDist then
                    local rayParams = RaycastParams.new()
                    rayParams.FilterDescendantsInstances = {Workspace}
                    rayParams.FilterType = Enum.RaycastFilterType.Blacklist
                    rayParams.IgnoreWater = true
                    local result = Workspace:Raycast(position, (base.Position - position), rayParams)

                    if not result or result.Instance == base then
                        closestText = obj.Text
                        closestDist = dist
                    end
                end
            end
        end
    end

    return closestText
end

local function isRainbow(model)
    for _, child in ipairs(model:GetDescendants()) do
        if child:IsA("MeshPart") and child.Name:sub(1,5) == "Cube." then
            local color = child.Color
            local prev = child:GetAttribute("LastBrickColor")
            if prev then
                local diff = (Vector3.new(color.R, color.G, color.B) - Vector3.new(prev.X, prev.Y, prev.Z)).Magnitude
                if diff > 0.02 then
                    return true
                end
            end
            child:SetAttribute("LastBrickColor", Vector3.new(color.R, color.G, color.B))
        end
    end
    return false
end

local function sendEmbed(modelName, moneyText, playersCount, webhook)
    local jobId = game.JobId
    local gameName = "Unknown"
    pcall(function()
        local info = MarketplaceService:GetProductInfo(game.PlaceId)
        gameName = info and info.Name or "Unknown"
    end)

    local joinScript = string.format('game:GetService("TeleportService"):TeleportToPlaceInstance(%d, "%s", game.Players.LocalPlayer)', game.PlaceId, jobId)

    local embed = {
        embeds = {{
            title = "Brainrot Notify | Lyez Hub",
            color = 0x00FFAA,
            fields = {
                {name = "🏷️ Name", value = modelName, inline = false},
                {name = "💰 Money per sec", value = moneyText or "N/A", inline = false},
                {name = "👥 Players", value = tostring(playersCount) .. "/8", inline = false},
                {name = "🌐 Join Link", value = "[Click to Join Server](https://www.roblox.com/games/" .. game.PlaceId .. ")", inline = false},
                {name = "🆔 Job ID", value = jobId, inline = false},
                {name = "📜 Join Script (Tap to Copy)", value = "`" .. joinScript .. "`", inline = false}
            },
            footer = {
                text = "Made by Lyez Hub | " .. os.date("%I:%M %p")
            }
        }}
    }

    local headers = {["Content-Type"] = "application/json"}
    local jsonData = HttpService:JSONEncode(embed)
    local req = (syn and syn.request) or (http and http.request) or request or http_request
    if not req then return end

    pcall(function()
        req({
            Url = webhook,
            Method = "POST",
            Headers = headers,
            Body = jsonData
        })
    end)
end

local function handleModel(model, isNew)
    local nameTable = isNew and newBrainrotGods or oldBrainrotGods
    local webhook = isNew and newWebhook or mainWebhooks[1]

    if not nameTable[model.Name] then return end
    local root = getPrimaryPart(model)
    if not root then return end

    local id = model:GetDebugId()
    if notified[id] then return end

    local moneyText = findVisibleMoneyText(root.Position, 8)
    if not moneyText then return end

    local moneyValue = extractMoneyValue(moneyText)
    if isNew and moneyValue >= 500000 then return end

    sendEmbed(model.Name, moneyText, #Players:GetPlayers(), webhook)
    notified[id] = true
end

local function scanModels()
    if #Players:GetPlayers() < 3 or #Players:GetPlayers() > 8 then return end

    for _, model in ipairs(Workspace:GetChildren()) do
        if model:IsA("Model") then
            pcall(function() handleModel(model, false) end)
            pcall(function() handleModel(model, true) end)
        end
    end
end

task.spawn(function()
    while true do
        pcall(scanModels)
        task.wait(0.5)
    end
end)