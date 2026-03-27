--YTB : TBOY ROBLOX 
-- https://discord.gg/s4sMmn7BrQ
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=83190276951914"

UICorner.CornerRadius = UDim.new(1, 10) 
UICorner.Parent = ImageButton

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
repeat task.wait() until game:IsLoaded()
local Window = Fluent:CreateWindow({
    Title = "Hop Server",
    SubTitle = "by realtboy",
    TabWidth = 157,
    Size = UDim2.fromOffset(450, 300),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.End
})

Main =Window:AddTab({ Title="Hop Server" })

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlaceId = game.PlaceId

-- Hàm lấy danh sách server
local function ListServers(cursor)
    local url = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    if cursor then
        url = url .. "&cursor=" .. cursor
    end

    local success, response = pcall(function()
        return game:HttpGet(url)
    end)

    if success then
        task.wait(1.2) -- tránh spam API
        return HttpService:JSONDecode(response)
    else
        warn("⚠️ Lỗi lấy server:", response)
        return {data = {}, nextPageCursor = nil}
    end
end

-- Tìm server ít người, ưu tiên server 1 người
local function FindBestServer()
    local cursor = nil
    local best = nil

    repeat
        local data = ListServers(cursor)
        for _, server in ipairs(data.data) do
            if server.playing > 0 and server.playing < server.maxPlayers then
                if server.playing == 1 then
                    return server -- ƯU TIÊN SERVER 1 NGƯỜI
                end
                if not best or server.playing < best.playing then
                    best = server
                end
            end
        end
        cursor = data.nextPageCursor
    until not cursor or best
    return best
end

-- Auto retry hop
local function AutoRetryHop()
    task.spawn(function()
        while true do
            local target = FindBestServer()
            if target then
                print("👉 Thử teleport tới server:", target.id, "Players:", target.playing)
                local ok, err = pcall(function()
                    TeleportService:TeleportToPlaceInstance(PlaceId, target.id, LocalPlayer)
                end)
                if ok then
                    break -- nếu teleport thành công thì dừng
                else
                    warn("⚠️ Teleport thất bại:", err, "→ thử lại sau 5s")
                end
            else
                warn("❌ Không tìm được server phù hợp → thử lại sau 5s")
            end
            task.wait(5)
        end
    end)
end

-- 🟦 Thêm Button vào Fluent UI
Main:AddButton({
    Title = "🔄 Hop Ưu Tiên Server 1 Người",
    Description = "Join server ít người, ưu tiên server chỉ có 1 người.",
    Callback = function()
        AutoRetryHop()
    end
})