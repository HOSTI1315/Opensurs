-- Ensure this runs on the client
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

-- Only run if we're a player
if not Players.LocalPlayer then
    return
end

local placeId = game.PlaceId

-- Function to get server list
local function getServers()
    local servers = {}
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"))
    end)
    
    if success then
        return result.data
    end
    return {}
end

-- Function to find smallest server
local function findSmallestServer()
    local servers = getServers()
    local smallestServer = nil
    local smallestPlayerCount = math.huge
    local currentServerId = game.JobId
    
    for _, server in ipairs(servers) do
        -- Skip current server
        if server.id ~= currentServerId then
            if server.playing < smallestPlayerCount then
                smallestServer = server
                smallestPlayerCount = server.playing
            end
            
            -- If we find an empty server, join it immediately
            if server.playing == 0 then
                return server
            end
        end
    end
    
    return smallestServer
end

-- Main teleport logic
local function joinSmallestServer()
    local targetServer = findSmallestServer()
    
    if targetServer then
        local success, error = pcall(function()
            TeleportService:TeleportToPlaceInstance(placeId, targetServer.id, Players.LocalPlayer)
        end)
        
        if not success then
            warn("Failed to teleport:", error)
        end
    else
        warn("No available servers found")
    end
end

-- Execute the server join
joinSmallestServer()