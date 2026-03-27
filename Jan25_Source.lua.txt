loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/Loader.lua'))()


-- this is the old source that is deprecated, I know this is open source so don't come to me saying "hey i got your source"
--[[

--LATEST BABFT
---@diagnostic disable: undefined-global
--BABFT MAR19Y2025
if game.PlaceId ~= 537413528 then
    return
end

task.spawn(function()
    --loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/MessageIssue.lua'))()
end)

if not isfolder("BABFT") then
    makefolder("BABFT")
end

if not isfolder("BABFT/Image") then
    makefolder("BABFT/Image")
end

if not isfolder("BABFT/Build") then
    makefolder("BABFT/Build")
end

if not isfolder("BABFT/Settings") then
    makefolder("BABFT/Settings")
end

if not isfolder("FileStorage") then
    makefolder("FileStorage")
end

local FcMaster = true
local folderName = "ImagePreview"
local previewFolder = Workspace:FindFirstChild(folderName) or Instance.new("Folder", Workspace)
previewFolder.Name = folderName

previewFolder:ClearAllChildren()

task.delay(10, function()
    if game:GetService("CoreGui"):FindFirstChild("MSGISSUE") then
        game:GetService("CoreGui").MSGISSUE:Destroy()
    end
end)

local BlockId = loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/BlockId.lua'))()
local classes = loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/AutoBuild/Classes.lua'))()
local NormalColorBlock = loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/AutoBuild/NormalColorBlock.lua'))()

-- ReGui library
local ImGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()
local PrefabsId = `rbxassetid://{ImGui.PrefabsId}`

ImGui:Init({
	Prefabs = game:GetService("InsertService"):LoadLocalAsset(PrefabsId)
})

local HttpService = cloneref(game:GetService("HttpService"))
local TeleportService = cloneref(game:GetService("TeleportService"))
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local JobId = game.JobId
local PlaceId = game.PlaceId
local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Teams = game:GetService("Teams")
local Lighting = game:GetService("Lighting")
local player = game.Players.LocalPlayer
local Nplayer = game.Players.LocalPlayer.Name
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local connection
local SB = false
--[[
if not isfile("BABFT/Settings/FirstTimePrompt") then
local FirstTimeExec = ImGui:PopupModal({
	Title = "Asu's Build A Boat For Treasure script",
	AutoSize = "Y"
})

writefile("BABFT/Settings/FirstTimePrompt", "you have already executed this script once")

FirstTimeExec:Label({
    TextWrapped = true,
	Text = "Hey! It looks like this is the first time you've execute this script. Joining the Discord server is highly recommended: it has .build files, a script changelog, documentation, and people there to help you. You can also suggest new features.\n\n                discord.gg/MdtGaG7vdx"
})

FirstTimeExec:Separator()

FirstTimeExec:Button({
	Text = "Copy Discord link",
	Size = UDim2.fromScale(1, 0),
    NoTheme = true,
    BackgroundColor3 = Color3.fromRGB(80, 200, 90),
	Callback = function()
        setclipboard("discord.gg/MdtGaG7vdx")
		FirstTimeExec:Close()
	end,
})

FirstTimeExec:Button({
	Text = "idc, cuh!",
	Size = UDim2.fromScale(1, 0),
	Callback = function()
		FirstTimeExec:ClosePopup()
	end,
})
end



local Exploit
local AutoBuilder

if UserInputService.TouchEnabled then
    Exploit = ImGui:TabsWindow({
        Title = "Exploit",
        Size = UDim2.fromOffset(252, 200),
        Position = UDim2.new(0.5, 7, 0.5, -100),
    })

    AutoBuilder = ImGui:TabsWindow({
        Title = "Auto Builder",
        Size = UDim2.fromOffset(248, 200),
        Position = UDim2.new(0.5, -245, 0.5, -100),
    })

    --[[
    Exploit:Update({
        NoClose = true
    })

    AutoBuilder:Update({
        NoClose = true
    })

else
    Exploit = ImGui:TabsWindow({
        Title = "Exploit",
        Size = UDim2.fromOffset(252, 426),
        Position = UDim2.new(0.5, 7, 0.5, -250),
        NoClose = true,
    })

    AutoBuilder = ImGui:TabsWindow({
        Title = "Auto Builder",
        Size = UDim2.fromOffset(248, 426),
        Position = UDim2.new(0.5, -245, 0.5, -250),
        NoClose = true,
    })

    --[[
    Exploit:Update({
        NoClose = true
    })

    AutoBuilder:Update({
        NoClose = true
    })

end

--Exploit.Content.TitleBar.Right:Destroy()



local AutoFarm = Exploit:CreateTab({
	Name = "AutoFarm"
})

local Misc = Exploit:CreateTab({
	Name = "Misc"
})

local ReadMe = Exploit:CreateTab({
	Name = "Read Me"
})

local Credit = Exploit:CreateTab({
	Name = "Credit"
})

local AutoBuild = AutoBuilder:CreateTab({
	Name = "Auto Builder"
})

local Image = AutoBuilder:CreateTab({
	Name = "Image Loader"
})

local BlockNeeded = AutoBuilder:CreateTab({
	Name = "List"
})

local function LPTEAM2()
    local teamName = player.Team.Name

    local zoneMapping = {
        black = "BlackZone",
        blue = "Really blueZone",
        green = "CamoZone",
        red = "Really redZone",
        white = "WhiteZone",
        yellow = "New YellerZone",
        magenta = "MagentaZone"
    }

    local selectedZoneName = zoneMapping[teamName]

    if selectedZoneName then
        local zone = workspace:FindFirstChild(selectedZoneName)
        if zone then
            return zone.Name
        end
    end
end

-- AutoFarm
local function enableAntiAFK()
    if not connection then
        connection = player.Idled:Connect(function()
            if getgenv().afk6464 then
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end
        end)
    end
end

local function disableAntiAFK()
    if connection then
        connection:Disconnect()
        connection = nil
    end
end

local function loop()
    while FcMaster do
        if getgenv().afk6464 then
            enableAntiAFK()
        else
            disableAntiAFK()
        end
        wait(4)
    end
end

spawn(loop)

if not getgenv().afk6464 then
    getgenv().afk6464 = false
end

local AntiAfkBool

local AntiAfkToggle = AutoFarm:Checkbox({
	Label = "Anti-Afk",
	Value = getgenv().afk6464,
	Callback = function(self, Value)
        AntiAfkBool = Value
		getgenv().afk6464 = Value
	end,
})

local Silent = false
local AutoFarmBool
local TriggerChest = workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger

local AutoFarmToggle = AutoFarm:Checkbox({
	Label = "AutoFarm",
	Value = false,
	Callback = function(self, Value)
        AutoFarmBool = Value
        getgenv().AF = Value
        local isFarming = false

        if not Value then
            TriggerChest.CFrame = CFrame.new(-55.7065125, -358.739624, 9492.35645, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
        end

        character = player.Character or player.CharacterAdded:Wait()
        humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        humanoid = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid")

        local function startAutoFarm()
            if Value == false then return end

            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local humanoid = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid")

            local newPart = Instance.new("Part")
            newPart.Size = Vector3.new(5, 1, 5)
            newPart.Transparency = 1
            newPart.CanCollide = true
            newPart.Anchored = true
            newPart.Parent = workspace

            local decal = Instance.new("Decal")
            decal.Texture = "rbxassetid://139953968294114"
            decal.Face = Enum.NormalId.Top 
            decal.Parent = newPart

            local function TPAF(iteration)

            if not Silent then
                if Value == false or getgenv().AF == false then return end
                if iteration == 5 then
                    TriggerChest.CFrame = CFrame.new(-51, 65, 984 + 4 * 770)
                    task.delay(0.8, function()
                        workspace.ClaimRiverResultsGold:FireServer()
                    end)
                    humanoidRootPart.CFrame = CFrame.new(-51, 65, 984 + (iteration - 1) * 770)
                else
                    if iteration == 1 then
                        humanoidRootPart.CFrame = CFrame.new(160.16104125976562, 29.595888137817383, 973.813720703125)
                    else
                    humanoidRootPart.CFrame = CFrame.new(-51, 65, 984 + (iteration - 1) * 770)
                    end
                end
                newPart.Position = humanoidRootPart.Position - Vector3.new(0, 2, 0)

                if iteration == 1 then
                    wait(2.3)
                    --workspace.ClaimRiverResultsGold:FireServer()
                else
                    repeat
                        task.wait()
                        
                    until #tostring(Players.LocalPlayer.OtherData:FindFirstChild("Stage"..(iteration-1)).Value) > 2
                end
                if iteration == 4 then
                else
                    workspace.ClaimRiverResultsGold:FireServer()
                end
                if iteration == 10 then
                    if Lighting.OutdoorAmbient == Color3.fromRGB(200, 200, 200) or Lighting.OutdoorAmbient == Color3.fromRGB(255 , 255, 255) then
                        wait(0.1)
                        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z > 7529.08984 then
                            game.Players.LocalPlayer.Character:BreakJoints()
                        end
                    end
                end
            else
                if Value == false or getgenv().AF == false then return end
                if iteration == 1 then
                    humanoidRootPart.CFrame = CFrame.new(160.16104125976562, 29.595888137817383, 973.813720703125)
                elseif iteration == 5 then
                    TriggerChest.CFrame = CFrame.new(70.02417755126953, 138.9026336669922, 1371.6341552734375 + 3 * 770)
                    task.delay(0.8, function()
                        workspace.ClaimRiverResultsGold:FireServer()
                    end)

                    humanoidRootPart.CFrame = CFrame.new(70.02417755126953, 138.9026336669922, 1371.6341552734375 + (iteration - 2) * 770)
                else
                    humanoidRootPart.CFrame = CFrame.new(70.02417755126953, 138.9026336669922, 1371.6341552734375 + (iteration - 2) * 770)
                end

                newPart.Position = humanoidRootPart.Position - Vector3.new(0, 2, 0)

                if iteration == 1 then
                    wait(2.3)
                    --workspace.ClaimRiverResultsGold:FireServer()
                else
                    repeat
                        task.wait()
                        
                    until #tostring(game:GetService("Players").LocalPlayer.OtherData:FindFirstChild("Stage"..(iteration-1)).Value) > 2
                end
                if iteration == 4 then
                else
                    workspace.ClaimRiverResultsGold:FireServer()
                end
                if iteration == 10 then
                    if Lighting.OutdoorAmbient == Color3.fromRGB(200, 200, 200) or Lighting.OutdoorAmbient == Color3.fromRGB(255 , 255, 255) then
                        wait(0.1)
                        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z > 7529.08984 then
                            game.Players.LocalPlayer.Character:BreakJoints()
                        end
                    end
                end
            end
            end

            for i = 1, 10 do
                if not Value then
                    break
                end
                TPAF(i)
            end

            newPart:Destroy()
        end

                local function onCharacterRespawned()
                    if getgenv().AF == true then
                        if FcMaster == false then return end
                    local character = player.Character or player.CharacterAdded:Wait()
                    character:WaitForChild("HumanoidRootPart")
                    startAutoFarm()
                    end
                end

        if Value then
            game.Players.LocalPlayer.Character:BreakJoints()
            wait(1)
            game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterRespawned)
        else
            game.Players.LocalPlayer.CharacterAdded:Connect(function() end)
        end
    end,
})

local MakeItSilentBool

local MakeItSilentToggle = AutoFarm:Checkbox({
	Label = "Make it Silent",
	Value = false,
	Callback = function(self, Value)
        MakeItSilentBool = Value
		Silent = Value
	end,
})

AutoFarm:Separator({
	Text = "Stats"
})

local ElapsedTime = AutoFarm:Label({
	Text = "Elapsed Time: 00:00:00"
})

local GoldBlockGained = AutoFarm:Label({
	Text = "Gold Blocks Gained: 0"
})

local GoldGainedLabel = AutoFarm:Label({
	Text = "Gold Gained: 0"
})

local GoldPerHourLabel = AutoFarm:Label({
	Text = "Gold Per Hour: nan"
})

AutoFarm:Separator({
	Text = "WebHook"
})

local clockTime = 0
local running = false
local totalGoldGained = 0
local Ftime = 0 
local totalGoldBlock = 0
local GoldPerHour = 0
local lastGoldValue = Players.LocalPlayer.Data.Gold.Value
local IGBLOCK = Players.LocalPlayer.Data.GoldBlock.Value

local function formatTime(seconds)
    local hours = math.floor(tonumber(seconds) / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local sec = seconds % 60
    return string.format("%02d:%02d:%02d", hours, minutes, sec)
end

local function startClock()
    if running then return end
    running = true

    while running do
        if getgenv().AF then
            clockTime = clockTime + 1
        else
            running = false
        end
        task.wait(1) 
    end
end

RunService.Stepped:Connect(function()
    if getgenv().AF and not running then
        wait(5)
        startClock()
    end
end)

task.spawn(function()
while FcMaster do
    local FinalGold = Players.LocalPlayer.Data.Gold.Value
    Ftime = formatTime(clockTime)
    local GoldGained = FinalGold - lastGoldValue
    totalGoldGained = totalGoldGained + GoldGained
    local FGBLOCK = Players.LocalPlayer.Data.GoldBlock.Value
    totalGoldBlock = FGBLOCK - IGBLOCK
    GoldPerHour = (totalGoldGained / clockTime) * 3600

    ElapsedTime.Text = "Elapsed Time: " .. Ftime
    GoldBlockGained.Text = "Gold Blocks Gained: " .. totalGoldBlock
    GoldGainedLabel.Text = "Gold Gained: " .. totalGoldGained
    GoldPerHourLabel.Text = "Gold Per Hour: " .. tostring(math.floor(GoldPerHour))

    lastGoldValue = FinalGold
    wait(1)
end
end)

GoldPerHour = 0

function SendMessageEMBED(url, embed)
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = {
                    ["text"] = embed.footer.text
                },
                ["thumbnail"] = {
                    ["url"] = embed.thumbnail_url
                }
            }
        }
    }
    local body = HttpService:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

local WebHook = "a"
local interval = 1800

function SendAUTOFARMInfo(Ftime, totalGoldBlock, totalGoldGained, GoldPerHour)
    local embed = {
        ["title"] = "BABFT | Auto Farm",
        ["description"] = "Stats",
        ["color"] = 16777215,
        ["fields"] = {
            {
                ["name"] = "Time Elapsed",
                ["value"] = Ftime or 0
            },
            {
                ["name"] = "GoldBlock Gained:",
                ["value"] = tostring(totalGoldBlock) or 0
            },
            {
                ["name"] = "Gold Gained:",
                ["value"] = tostring(totalGoldGained) or 0
            },
            {
                ["name"] = "Gold per hour:",
                ["value"] = tostring(math.floor(GoldPerHour)) or 0
            },
            {
                ["name"] = "Total Gold:",
                ["value"] = Players.LocalPlayer.Data.Gold.Value or 0
            },
        },
        ["footer"] = {
            ["text"] = "Script by @thereal_asu"
        },
        ["thumbnail_url"] = "https://tr.rbxcdn.com/180DAY-5cc07c05652006d448479ae66212782d/768/432/Image/Webp/noFilter"
    }

    if WebHook then
        SendMessageEMBED(WebHook, embed)
    end
end

local WebHookURLBool

local WebHookURLToggle = AutoFarm:InputText({
    Placeholder = "WebHook URL",
    Label = "URL",
    Value = "",
    Callback = function(self, Value)
        WebHookURLBool = tostring(Value)
        WebHook = tostring(Value)
	end,
})

local IntervalBool

local IntervalToggle = AutoFarm:InputText({
    Placeholder = "Seconds",
    Label = "Interval",
    Value = "",
    Callback = function(self, Value)
        IntervalBool = tonumber(Value)
        interval = tonumber(Value)
	end,
})

local WebHookActiveBool

local WebHookActiveToggle = AutoFarm:Checkbox({
	Label = "WebHook Active",
	Value = false,
	Callback = function(self, Value)
        WebHookActiveBool = Value
        getgenv().WBhook = Value
	end,
})

coroutine.wrap(function()
    while true do

        if getgenv().WBhook and getgenv().AF and not getgenv().intervalLock then
            getgenv().intervalLock = true
            SendAUTOFARMInfo(Ftime, totalGoldBlock, totalGoldGained, GoldPerHour)
            task.wait(interval)
            getgenv().intervalLock = false
        end
        task.wait(1)
    end
end)()

local selectionBoxConnections = {}

local Init = false

local function updateSB(selectionBox)
    if not Init then return end
    if selectionBox:IsA("SelectionBox") then
        selectionBox.LineThickness = 0.02
        selectionBox.SurfaceTransparency = 0.76
        selectionBox.SurfaceColor3 = selectionBox.Color3

        local connection = selectionBox:GetPropertyChangedSignal("Color3"):Connect(function()
            selectionBox.SurfaceColor3 = selectionBox.Color3
        end)
        
        selectionBoxConnections[selectionBox] = connection
    end
end

local function enableSB()
    SB = true
    for _, instance in ipairs(workspace:GetDescendants()) do
        if instance:IsA("SelectionBox") then
            updateSB(instance)
        end
    end

    selectionBoxConnections["Workspace"] = workspace.DescendantAdded:Connect(function(instance)
        if instance:IsA("SelectionBox") then
            updateSB(instance)
        end
    end)
    
    local blocksFolder = workspace:FindFirstChild("Blocks")
    if blocksFolder then
        for _, instance in ipairs(blocksFolder:GetDescendants()) do
            if instance:IsA("SelectionBox") then
                updateSB(instance)
            end
        end
        selectionBoxConnections["Blocks"] = blocksFolder.DescendantAdded:Connect(function(instance)
            if instance:IsA("SelectionBox") then
                updateSB(instance)
            end
        end)
    end
end

local function disableSB()
    SB = false
    if not Init then return end
    for instance, connection in pairs(selectionBoxConnections) do
        if connection then
            connection:Disconnect()
        end
    end
    selectionBoxConnections = {}

    for _, instance in ipairs(workspace:GetDescendants()) do
        if instance:IsA("SelectionBox") then
            instance.LineThickness = 0.01
            instance.SurfaceTransparency = 0.5
        end
    end
end

-- Misc
Misc:Button({
	Text = "UnLoad Script",
    Size = UDim2.fromScale(1, 0),
    NoTheme = true,
    BackgroundColor3 = Color3.fromRGB(245, 60, 60),
	Callback = function(self)
        TriggerChest.CFrame = CFrame.new(-55.7065125, -358.739624, 9492.35645, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
        previewFolder:ClearAllChildren()
        if SB then
            disableSB()
        end
        FcMaster = false
        AutoBuilder:Remove()
        Exploit:Remove()
        local GameStuff = {
            "Blocks",
            "Challenge",
            "TempStuff",
            "Teams",
            "MainTerrain",
            "OtherStages",
            "BlackZone",
            "CamoZone",
            "MagentaZone",
            "New YellerZone",
            "Really blueZone",
            "Really redZone",
            "Sand",
            "Water",
            "WhiteZone",
            "WaterMask"
        }
            for _, v in ipairs(GameStuff) do
                local object = ReplicatedStorage:FindFirstChild(v)
                if object then
                    if v == "OtherStages" then
                        ReplicatedStorage.OtherStages.Parent = workspace.BoatStages
                    else
                        object.Parent = workspace
                    end
                end
            end
	end,
})

Misc:Separator({
	Text = "Tabs"
})

local Global = Misc:CollapsingHeader({
	Title = "Global"
})

Global:Button({
	Text = "Load Infinite Yield",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
	end,
})

Global:Button({
	Text = "Teleport Tool",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        mouse = game.Players.LocalPlayer:GetMouse()
        tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "Tp tool"
        tool.ToolTip = "Equip + click = tp"
        tool.Activated:connect(function()
        local pos = mouse.Hit+Vector3.new(0,2.5,0)
        pos = CFrame.new(pos.X,pos.Y,pos.Z)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
        end)
        tool.Parent = game.Players.LocalPlayer.Backpack
	end,
})

Global:Button({
	Text = "Rejoin",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        if #Players:GetPlayers() <= 1 then
            Players.LocalPlayer:Kick("\nRejoining...")
            wait()
            TeleportService:Teleport(PlaceId, Players.LocalPlayer)
        else
            TeleportService:TeleportToPlaceInstance(PlaceId, JobId, Players.LocalPlayer)
        end
	end,
})

Global:Button({
	Text = "Server Hop",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        wait(0.2)
        local servers = {}
        local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", PlaceId)})
        local body = HttpService:JSONDecode(req.Body)

        if body and body.data then
            for i, v in next, body.data do
                if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                    table.insert(servers, 1, v.id)
                end
            end
        end

        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], Players.LocalPlayer)
        end
	end,
})

local ClientSide = Misc:CollapsingHeader({
	Title = "Client Side"
})

ClientSide:Button({
	Text = "Reset Client Side",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
	end,
})

ClientSide:SliderProgress({
	Label = "Speed",
	Value = 16,
	Minimum = 1,
	Maximum = 250,
    Callback = function(self, Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end,
})

ClientSide:SliderProgress({
    Label = "Jump Power",
    Value = 50,
    Minimum = 1,
    Maximum = 450,
    Callback = function(self, Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end,
})

ClientSide:InputText({
    Placeholder = "number",
    Label = "Fake Gold",
    Value = "",
    Callback = function(self, Value)
        Players.LocalPlayer.Data.Gold.Value = tonumber(Value)
	end,
})

ClientSide:Button({
	Text = "Reset Character",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        game.Players.LocalPlayer.Character:BreakJoints()
	end,
})

local Teleportation = Misc:CollapsingHeader({
	Title = "Teleportation"
})

Teleportation:Button({
	Text = "Stage 1",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(189.234283, 163.600052 + 21.4 / 2 + 2.05, 1313.19214, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	end,
})

Teleportation:Button({
	Text = "White",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-49.8510132, -9.7000021, -520.37085, -1, 0, 0, 0, 1, 0, 0, 0, -1))
	end,
})

Teleportation:Button({
	Text = "Black",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-503.82843, -9.7000021, -69.433342, 0, 0, -1, 0, 1, 0, 1, 0, 0))
	end,
})

Teleportation:Button({
	Text = "Red",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(396.697418, -9.7000021, -64.7801361, 0, 0, 1, 0, 1, -0, -1, 0, 0))
	end,
})

Teleportation:Button({
	Text = "Blue",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(396.697418, -9.7000021, 300.219849, 0, 0, 1, 0, 1, -0, -1, 0, 0))
	end,
})

Teleportation:Button({
	Text = "Magenta",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(396.697418, -9.7000021, 647.219849, 0, 0, 1, 0, 1, -0, -1, 0, 0))
	end,
})

Teleportation:Button({
	Text = "Yellow",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-503.82843, -9.7000021, 640.56665, 0, 0, -1, 0, 1, 0, 1, 0, 0))
	end,
})

Teleportation:Button({
	Text = "Green",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-503.82843, -9.7000021, 293.56665, 0, 0, -1, 0, 1, 0, 1, 0, 0))
	end,
})

local Troll = Misc:CollapsingHeader({
	Title = "Troll"
})

Troll:Checkbox({
	Label = "Force Share Mode",
	Value = false,
	Callback = function(self, Value)
        workspace.SettingFunction:InvokeServer("ShareBlocks", Value)
	end,
})

local function removeLock()
    local Teams = {"BlackZone", "CamoZone", "MagentaZone", "New YellerZone", "Really blueZone", "Really redZone", "WhiteZone"}

    for _, teamName in ipairs(Teams) do
        local teamPart = workspace:FindFirstChild(teamName)
        if teamPart then
            local lockFolder = teamPart:FindFirstChild("Lock")
            if lockFolder then
                lockFolder:Destroy()
            end
        end
    end
end

local previousPosition = nil
local counterIsoMODE = false

local function trackPlayerPosition()
    while FcMaster == true do
        if counterIsoMODE then
            removeLock()
            local character = player.Character
            if character then
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    previousPosition = humanoidRootPart.CFrame
                end
            end
        end
        task.wait(.1)
    end
end

local function onCharacterAdded(character)
    if counterIsoMODE then
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        if previousPosition then
            humanoidRootPart.CFrame = previousPosition
        end
    end
end

player.CharacterAdded:Connect(onCharacterAdded)
task.spawn(trackPlayerPosition)

Troll:Checkbox({
	Label = "Disable Isolation",
	Value = false,
	Callback = function(self, Value)
        counterIsoMODE = Value
	end,
})

Troll:Button({
	Text = "Disable quest build zone",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        workspace:FindFirstChild(LPTEAM2()).QuestNum.Value = 0
	end,
})

Troll:Button({
	Text = "Max click detector distance",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        for _, object in ipairs(game:GetDescendants()) do
            if object:IsA("ClickDetector") then
                object.MaxActivationDistance = 100069
            end
        end
	end,
})

local Destructive = Misc:CollapsingHeader({
	Title = "Destructive"
})

Destructive:Button({
	Text = "Color all blocks",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        local playerteam = player.Team.Name
        local blocktoget = game:GetService("Teams"):FindFirstChild(playerteam).TeamLeader.Value
        if not Players.LocalPlayer.Settings.ShareBlocks.Value then
            blocktoget = player.Name
        end
        local playerFolder = game.Workspace.Blocks:FindFirstChild(blocktoget)
        local paintData = {}

        for _, block in ipairs(playerFolder:GetChildren()) do
            local color = Color3.new(
                math.random(0, 1000) / 1000,
                math.random(0, 1000) / 1000,
                math.random(0, 1000) / 1000
            )

            table.insert(paintData, {
                block,
                color
            })

            if #paintData >= 10000 then
                game:GetService("Players").LocalPlayer.Backpack.PaintingTool.RF:InvokeServer(paintData)
                paintData = {}
            end
        end

        if #paintData > 0 then
            game:GetService("Players").LocalPlayer.Backpack.PaintingTool.RF:InvokeServer(paintData)
        end
	end,
})

Destructive:Checkbox({
	Label = "Loop it",
	Value = false,
	Callback = function(self, Value)
        while Value do
            if Value then
            local playerteam = player.Team.Name
            local blocktoget = game:GetService("Teams"):FindFirstChild(playerteam).TeamLeader.Value
            if not Players.LocalPlayer.Settings.ShareBlocks.Value then
                blocktoget = player.Name
            end
            local playerFolder = game.Workspace.Blocks:FindFirstChild(blocktoget)
            local paintData = {}

            for _, block in ipairs(playerFolder:GetChildren()) do
                local color = Color3.new(
                    math.random(0, 1000) / 1000,
                    math.random(0, 1000) / 1000,
                    math.random(0, 1000) / 1000
                )

                table.insert(paintData, {
                    block,
                    color
                })

                if #paintData >= 10000 then
                    Players.LocalPlayer.Backpack.PaintingTool.RF:InvokeServer(paintData)
                    paintData = {}
                end
            end

            if #paintData > 0 then
                Players.LocalPlayer.Backpack.PaintingTool.RF:InvokeServer(paintData)
            end
        end
        task.wait()
        end
	end,
})

Destructive:Button({
	Text = "Delete all blocks",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        local playerteam = player.Team.Name
        local blocktoget = game:GetService("Teams"):FindFirstChild(playerteam).TeamLeader.Value
        if not Players.LocalPlayer.Settings.ShareBlocks.Value then
            blocktoget = player.Name
        end

        local playerFolder = game.Workspace.Blocks:FindFirstChild(blocktoget)
        for _, block in ipairs(playerFolder:GetChildren()) do
            local rf = Players.LocalPlayer.Backpack:FindFirstChild("DeleteTool") and Players.LocalPlayer.Backpack.DeleteTool:FindFirstChild("RF") 
            if not rf then
                break
            end
            task.spawn(function()
                rf:InvokeServer(block)
            end)
        end
	end,
})

Destructive:Checkbox({
	Label = "Loop it",
	Value = false,
	Callback = function(self, Value)
        while Value do
            if Value then
                local playerteam = player.Team.Name
                local blocktoget = game:GetService("Teams"):FindFirstChild(playerteam).TeamLeader.Value
                if not Players.LocalPlayer.Settings.ShareBlocks.Value then
                    blocktoget = player.Name
                end

                local playerFolder = game.Workspace.Blocks:FindFirstChild(blocktoget)
                for _, block in ipairs(playerFolder:GetChildren()) do
                    task.spawn(function()
                        Players.LocalPlayer.Backpack.DeleteTool.RF:InvokeServer(block)
                    end)
                end
        end
        task.wait()
        end
	end,
})

Destructive:Label({
    TextWrapped = true,
	Text = "Work with Share Mode too, equip paint tool to disable color loop. equip delete tool to disable clear all loop."
})

local FpsBooster = Misc:CollapsingHeader({
	Title = "Fps Booster"
})

FpsBooster:Button({
	Text = "Remove Textures",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        for _, obj in ipairs(game:GetDescendants()) do
            if obj:IsA("Texture") or obj:IsA("Decal") then
                obj:Destroy()
            end
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.SmoothPlastic
            end
        end
	end,
})

local HideuselesspartsBool

local HideuselesspartsToggle = FpsBooster:Checkbox({
	Label = "Hide useless parts",
	Value = false,
	Callback = function(self, Value)
        HideuselesspartsBool = Value
        if Value then
            workspace.MainTerrain.Parent = ReplicatedStorage
        else
            pcall(function()
                ReplicatedStorage.MainTerrain.Parent = workspace
            end)
        end
	end,
})

local HideplayersblocksBool

local HideplayersblocksToggle = FpsBooster:Checkbox({
	Label = "Hide players blocks",
	Value = false,
	Callback = function(self, Value)
        HideplayersblocksBool = Value
        if Value then
            workspace.Blocks.Parent = ReplicatedStorage
        else
            pcall(function()
                ReplicatedStorage.Blocks.Parent = workspace
            end)
        end
	end,
})

local HideAllBool

local HideAllToggle = FpsBooster:Checkbox({
	Label = "Hide All [For AutoFarm]",
	Value = false,
	Callback = function(self, Value)
        HideAllBool = Value
        local Stuff = {
            "Blocks",
            "Challenge",
            "TempStuff",
            "Teams",
            "MainTerrain",
            "OtherStages",
            "BlackZone",
            "CamoZone",
            "MagentaZone",
            "New YellerZone",
            "Really blueZone",
            "Really redZone",
            "Sand",
            "Water",
            "WhiteZone",
            "WaterMask"
        }

        if Value then
            for _, v in ipairs(Stuff) do
                local object = workspace:FindFirstChild(v) or workspace.BoatStages:FindFirstChild("OtherStages")
                if object then
                    object.Parent = ReplicatedStorage
                end
            end
        else
            for _, v in ipairs(Stuff) do
                local object = ReplicatedStorage:FindFirstChild(v)
                if object then
                    if v == "OtherStages" then
                        ReplicatedStorage.OtherStages.Parent = workspace.BoatStages
                    else
                        object.Parent = workspace
                    end
                end
            end
        end
	end,
})

local Spoofer = Misc:CollapsingHeader({
	Title = "Spoofer"
})

local spoofSpeed = 40

Spoofer:Separator({
	Text = "Wheels"
})

Spoofer:SliderProgress({
	Label = "Max speed",
	Value = 40,
	Minimum = 0,
	Maximum = 1200,
})

Spoofer:Button({
	Text = "Spoof speed",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        local itcihmsoeoesoes = workspace.Blocks:FindFirstChild(Nplayer)
        if itcihmsoeoesoes then
    for _, model in ipairs(itcihmsoeoesoes:GetChildren()) do
        if model:IsA("Model") then
            local maxSpeed = model:FindFirstChild("MaxSpeed")
            if maxSpeed and maxSpeed:IsA("NumberValue") then
                maxSpeed.Value = spoofSpeed
            end
        end
    end
end
	end,
})

Spoofer:Label({
    TextWrapped = true,
	Text = "Maybe broken"
})

local TeleportToPlace = Misc:CollapsingHeader({
	Title = "Teleport To Place"
})

TeleportToPlace:Button({
	Text = "Inner Cloud",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        TeleportService:Teleport(1930863474, game.Players.LocalPlayer)
	end,
})

TeleportToPlace:Button({
	Text = "Christmas",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        TeleportService:Teleport(1930866268, game.Players.LocalPlayer)
	end,
})

TeleportToPlace:Button({
	Text = "Halloween",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        TeleportService:Teleport(1930665568, game.Players.LocalPlayer) -- WARNING: YOU WILL GET KICKED WHEN YOU JOIN IT, need to try with a client-sided anti kick or something to bypass it
	end,
})

TeleportToPlace:Label({
    TextWrapped = true,
	Text = "You'll get kicked at the Halloween event"
})

local Quests = Misc:CollapsingHeader({
	Title = "Auto Finish Quests"
})

Quests:Button({
	Text = "Cloud",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        local Team = LPTEAM2()
        workspace.QuestMakerEvent:FireServer(1)
        workspace:FindFirstChild(Team):WaitForChild("Quest")
        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), workspace:FindFirstChild(Team).Quest.Cloud.Part1, 0)
	end,
})

Quests:Button({
	Text = "Target",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        local Team = LPTEAM2()
        workspace.QuestMakerEvent:FireServer(2)
        workspace:FindFirstChild(Team):WaitForChild("Quest")
        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), workspace:FindFirstChild(Team).Quest.Target.Part.TouchInterest.Parent, 0)
	end,
})

Quests:Button({
	Text = "Ramp",
    Size = UDim2.fromScale(1, 0),
	Callback = function(self)
        local Team = LPTEAM2()
        workspace.QuestMakerEvent:FireServer(3)
        workspace:FindFirstChild(Team):WaitForChild("Quest")
        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), workspace:FindFirstChild(Team).Quest.Ramp:GetChildren()[20].TouchInterest.Parent, 0)
	end,
})

Quests:Button({
    Text = "Butter",
    Size = UDim2.fromScale(1, 0),
    Callback = function(self)
        local Team = LPTEAM2()
        workspace.QuestMakerEvent:FireServer(4)
        workspace:FindFirstChild(Team):WaitForChild("Quest")
        local pPart = workspace:FindFirstChild(Team) and workspace:FindFirstChild(Team).Quest and workspace:FindFirstChild(Team).Quest.Butter and workspace:FindFirstChild(Team).Quest.Butter.PPart

        while pPart do
            local clickDetector = pPart:FindFirstChild("ClickDetector")
            if clickDetector then
                fireclickdetector(clickDetector)
            end
            task.wait()
            pPart = workspace:FindFirstChild(Team) and workspace:FindFirstChild(Team).Quest and workspace:FindFirstChild(Team).Quest.Butter and workspace:FindFirstChild(Team).Quest.Butter.PPart
        end
    end,
})

Quests:Label({
    TextWrapped = true,
	Text = "Some quests are not available"
})

Misc:Separator({
	Text = "Settings"
})

Misc:Label({
    TextWrapped = true,
	Text = "Tap 'K' to hide the Interface"
})

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.K then
        Exploit.Parent.Enabled = not Exploit.Parent.Enabled
    end
end)

local Settings = Misc:CollapsingHeader({
	Title = "Settings"
})

local Bettersb = false
if isfile("BABFT/Settings/BetterSB") then
    Bettersb = true
end

Settings:Checkbox({
    Label = "Better Tools Selection Box",
    Value = Bettersb,
    Callback = function(self, Value)
        if Value then
            enableSB()
            writefile("BABFT/Settings/BetterSB", "true")
        else
            disableSB()
            delfile("BABFT/Settings/BetterSB")
        end
    end,
})
-- ReadMe

local AutoFarmTreeNode = ReadMe:TreeNode({
	Title = "AutoFarm",
})

AutoFarmTreeNode:Label({
    TextWrapped = true,
	Text = "This AutoFarm is already optimized, slider to set speed is useless, this configuration is already maxxed.\n\nlet me know if you've ever seen an auto farm more powerful than this one in terms of gold per hour, you can use a webhook to follow the auto farm stats when you're not in front of your screen.\n\n - With no boost: 25K/hour\n - With x1.25: 31K/hour\n - With x2: 50K/hour\n - With Both: 60k/hour\n\nBoost means gold multiplier, and you can get it either by joining the game's roblox group, or by buying the X2 gold gamepass."
})

local ImageLoaderTreeNode = ReadMe:TreeNode({
	Title = "Image Loader",
})

local ImageLoaderImport = ImageLoaderTreeNode:TreeNode({
	Title = "Import",
})

ImageLoaderImport:Label({
    TextWrapped = true,
	Text = "Put the url on the first textbox. Resolution is a divider factor, so higher = less pixels = less blocks.\n\nTap on 'Import Image' to convert the image into data. If Error, the image may not be supported, check Tutorial for easy fix. If success, enable preview checkbox."
})

local ImageLoaderPreview = ImageLoaderTreeNode:TreeNode({
	Title = "Preview",
})

ImageLoaderPreview:Label({
    TextWrapped = true,
	Text = "Preview: Build a preview of the Image. Preview need to be toggled to build the Image. You need to have the necessary blocks to build the image, check Block Needed and tap 'Refresh List'.\n\nGrid: Preview may be laggy for potato pc, so use this instead, it is useful to change image with modifiers without lagging. It will display a grid with the size of the Image.\n\nLoading speed: Slider to change the build speed preview faster/slower."
})

local ImageLoadermodifiers = ImageLoaderTreeNode:TreeNode({
	Title = "modifiers",
})

ImageLoadermodifiers:Label({
    TextWrapped = true,
	Text = "Block: Type of block for build the image.\n\nSize: between 0.1 and 10. Size of a block (pixel) can be laggy under 0.3.\n\nMove multiplier: to move the image with the button +X, +Y, -Z, ...\n\nRotate: Self explaining.\n\nBlock Depth: Depth of the Image."
})

local ImageLoaderBuild = ImageLoaderTreeNode:TreeNode({
	Title = "Build",
})

ImageLoaderBuild:Label({
    TextWrapped = true,
	Text = "Info will display the task where the script is when it's building the image. Can also display error.\n\nBuild Image: Self explaining, preview mode need to be toggled for it to work. Abort will stop the process. note that button is only useful before the script place the blocks, while loading the blocks."
})

local TutorialImageLoader = ImageLoaderTreeNode:TreeNode({
	Title = "Tutorial",
})

TutorialImageLoader:Label({
    TextWrapped = true,
	Text = "Choose a Resolution [Higher = less blocks], Put your image link in the TextBox.\nMany images link are not supported, upload it on discord, and copy the image link from image [cdn.discordapp]\n\nFor pc/laptop:\nRightclick on the image then tap 'copy link'.\n\nFor mobile:\nTap on the image, Tap 3 dots, Tap 'open in browser', then tap share Icon, there should be a 'copy' button.\n\nUploaded a photo means downloading it and uploading it to discord via the phone photo gallery, not copying the image link and past it on discord. Any discord channel works.\n\nThere also a discord bot that convert image on suitable URL for this script on the discord server."
})

local AutoBuildTreeNode = ReadMe:TreeNode({
	Title = "Auto Build",
})

AutoBuildTreeNode:Label({
    TextWrapped = true,
	Text = "Save Folder: Folder in your workspace executor where the .build is saved, FileStorage (default) is recommended.\n\nChoose a Team you want to save and a name for the File then click on “Save Build” and voilà, you've saved a build.\n\nBuild feature sare still under development"
})

ReadMe:Button({
	Text = "Copy Discord link",
	Size = UDim2.fromScale(1, 0),
    NoTheme = true,
    BackgroundColor3 = Color3.fromRGB(80, 200, 90),
	Callback = function()
        setclipboard("discord.gg/MdtGaG7vdx")
		Credit:Close()
	end,
})

-- Credit

Credit:Separator({
	Text = "Owner"
})

Credit:Label({
	Text = " @thereal_asu"
})

Credit:Separator({
	Text = "Library"
})

Credit:Label({
	Text = " Dear ReGui by Depthso <3"
})

Credit:Separator({
	Text = "Note"
})

Credit:Label({
    TextWrapped = true,
	Text = "This script took a lot of time to create and is fully open source. You can modify it, but please credit me and respect my work. Feel free to suggest features on Discord!"
})

Credit:Button({
	Text = "Copy Discord link",
	Size = UDim2.fromScale(1, 0),
    NoTheme = true,
    BackgroundColor3 = Color3.fromRGB(80, 200, 90),
	Callback = function()
        setclipboard("discord.gg/MdtGaG7vdx")
		Credit:Close()
	end,
})

Credit:Image({
	Image = 91386564914670,
	Ratio = 14 / 9,
	AspectType = Enum.AspectType.FitWithinMaxSize,
	Size = UDim2.fromScale(1, 1)
})


-- Auto Builder / Image / Block Needed

local ImageFiles = {}

local function LPTEAM()
local teamName = player.Team.Name

local zoneMapping = {
    black = "BlackZone",
    blue = "Really blueZone",
    green = "CamoZone",
    red = "Really redZone",
    white = "WhiteZone",
    yellow = "New YellerZone",
    magenta = "MagentaZone"
}

local selectedZoneName = zoneMapping[teamName]

if selectedZoneName then
    local zone = workspace:FindFirstChild(selectedZoneName)
    if zone then
        return zone.position + Vector3.new(-100, 150, 0)
    end
end
end

local imagePreviewFolder = workspace:FindFirstChild("ImagePreview") or Instance.new("Folder")
imagePreviewFolder.Name = "ImagePreview"
imagePreviewFolder.Parent = workspace

local UserBlockList = {}
local dataFolder = Players.LocalPlayer.Data
local BlockType = "PlasticBlock"
local LPBlockvalue = UserBlockList[BlockType]
local blockSize = 2
local startPosition = nil
local PreviewPart = nil
local kflxjdhgw = nil
local currentConnection = nil
local FileImage = nil
local HalfblockSize = blockSize / 2
local cooloffset = Vector3.new(0, 0, 0)
local Unit = 45
local Bdepth = 2
local angleY = 0
local ImgCenterimage = nil
local Brainrot = CFrame.identity
local rotationCFrame = CFrame.Angles(0, 0, 0)
local batchSize = 700
local TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong = 0
local USEURL = nil
local TempData = {}
local BlockLoaded = true
local TASK1, TASK2, TASK3, TASK4, TASK5 = false, false, false, false, false
local ImageLoading = false
getgenv().ImgLoaderStat = true

local function UUserBlockList()
    UserBlockList = {}
    for _, feuh in ipairs(dataFolder:GetChildren()) do
        if feuh.Value ~= nil then
            UserBlockList[feuh.Name] = feuh.Value
        end
    end
end

local function readFile(filePath)
    if not isfile(filePath) then
        return nil
    end
    return readfile(filePath)
end

local function parseColors(fileContent)
    local data = {}

    for value in string.gmatch(fileContent, "[^,]+") do
        value = value:match("^%s*(.-)%s*$")
        table.insert(data, tonumber(value) or value)
    end
    return data
end

local function calculateFrameSize(data)
    local width = 0
    local height = 0
    local currentWidth = 0

    for i = 1, #data, 3 do
        local r, g, b = data[i], data[i + 1], data[i + 2]

        if r == "B" and g == "B" and b == "B" then
            height += 1
            width = math.max(width, currentWidth)
            currentWidth = 0
        elseif r == "R" and g == "R" and b == "R" then
            currentWidth += 1
        elseif type(r) == "number" and type(g) == "number" and type(b) == "number" then
            currentWidth += 1
        end
    end
    height += 1
    width = math.max(width, currentWidth)
    return Vector3.new(width * blockSize, height * blockSize, Bdepth)
end

local function previewFrame(frameSize, position, blockSize)
    startPosition = LPTEAM()
    if PreviewPart then
        PreviewPart:Destroy()
        PreviewPart = nil
    end

    PreviewPart = Instance.new("Part")
    PreviewPart.Size = frameSize
    PreviewPart.Position = position + Vector3.new(HalfblockSize - blockSize + frameSize.X / 2, HalfblockSize + blockSize - frameSize.Y / 2, 0) + cooloffset
    PreviewPart.Transparency = 1
    PreviewPart.Color = Color3.new(1, 1, 1)
    PreviewPart.Anchored = true
    PreviewPart.CanCollide = false
    PreviewPart.Name = "PreviewSize"
    PreviewPart.Parent = previewFolder
    PreviewPart.Rotation = Vector3.new(0, angleY - 90, 0)

    local textureId = "rbxassetid://133978572926918"

    local function applyTextureToSurface(surface, sizeX, sizeY)
        local texture = Instance.new("Texture")
        texture.Texture = textureId
        texture.Face = surface
        texture.Parent = PreviewPart
        texture.StudsPerTileU = blockSize
        texture.StudsPerTileV = blockSize
        texture.Transparency = 0.2
    end

    applyTextureToSurface(Enum.NormalId.Front, frameSize.X, frameSize.Y)
    applyTextureToSurface(Enum.NormalId.Back, frameSize.X, frameSize.Y)
    applyTextureToSurface(Enum.NormalId.Left, frameSize.Z, frameSize.Y)
    applyTextureToSurface(Enum.NormalId.Right, frameSize.Z, frameSize.Y)
    applyTextureToSurface(Enum.NormalId.Top, frameSize.X, frameSize.Z)
    applyTextureToSurface(Enum.NormalId.Bottom, frameSize.X, frameSize.Z)
end

local function Centerimage(frameSize, position, blockSize)
    startPosition = LPTEAM()
    if kflxjdhgw then
        kflxjdhgw:Destroy()
        kflxjdhgw = nil
    end

    kflxjdhgw = Instance.new("Part")
    kflxjdhgw.Size = frameSize
    kflxjdhgw.Position = position + Vector3.new(HalfblockSize - blockSize + frameSize.X / 2, HalfblockSize + blockSize - frameSize.Y / 2, 0)
    kflxjdhgw.Transparency = 1
    kflxjdhgw.Color = Color3.new(1, 1, 1)
    kflxjdhgw.Anchored = true
    kflxjdhgw.CanCollide = false
    kflxjdhgw.Name = "Centerimage"
    kflxjdhgw.Parent = previewFolder
    return kflxjdhgw.Position
end

local function buildImageFAST()
    ImageLoading = true
    local folder = workspace:FindFirstChild("ImagePreview")
    if not folder then
        return
    end

    for _, part in ipairs(folder:GetChildren()) do
        if part:IsA("BasePart") and part.Name == "Part" then
            part.Transparency = 0.8
        end
    end

    local parts = {}
    for _, part in ipairs(folder:GetChildren()) do
        if part:IsA("BasePart") and part.Name == "Part" then
            table.insert(parts, part)
        end
    end

    if #parts == 0 then
        return
    end

    local paintData = {}

    UUserBlockList()
    local uszLPBlockvalue = UserBlockList[BlockType]
    local Zonesss = LPTEAM2()

    local LNplayer = nil
    if Players.LocalPlayer.Settings.ShareBlocks.Value == false then
        LNplayer = Nplayer
    else
        local playerteam = player.Team.Name
        local blocktoget = game:GetService("Teams"):FindFirstChild(playerteam).TeamLeader.Value
        LNplayer = blocktoget
    end

    for i = 1, #parts do
        if getgenv().ImgLoaderStat == false then
            break
        end
        task.spawn(function()
            local part = parts[i]
            if not part then
                return
            end
            if getgenv().ImgLoaderStat == false then
                return
            end
            local WORLDPOS = part.Position
            local partRot = part.CFrame - part.Position
            local newCFrame = CFrame.new(math.random(-69, 69), math.random(-2200000, -120000), math.random(-69, 69))

            if getgenv().ImgLoaderStat == false then
                return
            end

            local BuildPath = player.Backpack:FindFirstChild("BuildingTool") or player.Character:FindFirstChild("BuildingTool")
            BuildPath.RF:InvokeServer(
                BlockType,
                uszLPBlockvalue,
                workspace:FindFirstChild(Zonesss),
                newCFrame,
                true
            )
        end)
    end

    TASK1 = true
    local blocks = workspace.Blocks:FindFirstChild(LNplayer):GetChildren()

    while #blocks < #parts do
        task.wait(0.5)
        blocks = workspace.Blocks:FindFirstChild(LNplayer):GetChildren()
    end

    ImgParts = workspace.ImagePreview:GetChildren()
    for i = 1, #parts + 1 do
        local color = ImgParts[i].Color
        table.insert(paintData, {
            blocks[TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong + i - 1],
            Color3.new(color.R, color.G, color.B)
        })
    end

    local PaintPath = player.Backpack:FindFirstChild("PaintingTool") or player.Character:FindFirstChild("PaintingTool")
    PaintPath.RF:InvokeServer(paintData)

    task.delay(1, function()
        ImageLoading = false
    end)

    for i = 1, #parts do
        if getgenv().ImgLoaderStat == false then
            break
        end
        task.spawn(function()
            local part = parts[i]
            if not part then
                return
            end
            if getgenv().ImgLoaderStat == false then
                return
            end
            local WORLDPOS = part.Position
            local partRot = part.CFrame - part.Position
            local newwCFrame = CFrame.new(WORLDPOS) * partRot * CFrame.Angles(0, math.rad(90), 0)
            local targetBlock = blocks[TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong + i]

            if getgenv().ImgLoaderStat == false then
                return
            end

            local ScalePath = player.Backpack:FindFirstChild("ScalingTool") or player.Character:FindFirstChild("ScalingTool")
            ScalePath.RF:InvokeServer(
                targetBlock,
                Vector3.new(Bdepth, blockSize, blockSize),
                newwCFrame
            )
        end)
    end

    TASK2 = true
    ImgParts = workspace.ImagePreview:GetChildren()
    for i = 1, #parts + 1 do
        local color = ImgParts[i].Color
        table.insert(paintData, {
            blocks[TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong + i - 1],
            Color3.new(color.R, color.G, color.B)
        })
    end
    
    local PaintPath = player.Backpack:FindFirstChild("PaintingTool") or player.Character:FindFirstChild("PaintingTool")
    PaintPath.RF:InvokeServer(paintData)

    for _, part in ipairs(folder:GetChildren()) do
        part:destroy()
    end

    TASK3 = true
    task.wait(0.15)
    TASK4 = true
    local remote = player.Character:FindFirstChild("DeleteTool") or player.Backpack:FindFirstChild("DeleteTool")
    for i = 1, #blocks do
        task.spawn(function()
            local block = blocks[i]
            if not block then
                return
            end

            local blockY = block.PrimaryPart and block.PrimaryPart.Position.Y or nil
            if blockY and blockY >= -2200000 and blockY <= -120000 then
                    remote.RF:InvokeServer(blocks[i])
            end
        end)
    end 
    TASK5 = true
end

local function buildImagePREVIEW(data, blockSize)
    local frameSize = calculateFrameSize(data)
    startPosition = LPTEAM() + cooloffset
    ImgCenterimage = Centerimage(frameSize, startPosition, blockSize)
    local centerImage = workspace.ImagePreview.Centerimage
    if not centerImage then
        return
    end

    rotationCFrame = CFrame.Angles(0, math.rad(angleY - 90), 0)

    Brainrot = centerImage.CFrame * rotationCFrame
    local currentX = startPosition.X
    local currentY = startPosition.Y
    local currentZ = startPosition.Z
    local initialX = startPosition.X
    local dataIndex = 1

    local centerImage = workspace.ImagePreview.Centerimage
    if not centerImage then
        return
    end

    local centerCFrame = centerImage.CFrame

    if currentConnection then
        currentConnection:Disconnect()
    end

    currentConnection = RunService.Heartbeat:Connect(function()
        local finished = false
        for _ = 1, batchSize do
            if dataIndex > #data then
                finished = true
                break
            end

            local r, g, b = data[dataIndex], data[dataIndex + 1], data[dataIndex + 2]
            if r == "B" and g == "B" and b == "B" then
                currentX = initialX
                currentY = currentY - blockSize
            elseif r == "R" and g == "R" and b == "R" then
                currentX = currentX + blockSize
            elseif type(r) == "number" and type(g) == "number" and type(b) == "number" then

                local block = Instance.new("Part")
                block.Size = Vector3.new(blockSize, blockSize, Bdepth)
                block.Color = Color3.fromRGB(r, g, b)
                block.Anchored = true
                block.Material = Enum.Material.SmoothPlastic
                block.CastShadow = false
                block.Parent = previewFolder

                local blockPosition = Vector3.new(currentX, currentY, currentZ) + cooloffset
                local relativeCFrame = centerCFrame:ToObjectSpace(CFrame.new(blockPosition))
                block.CFrame = Brainrot * relativeCFrame
                currentX = currentX + blockSize
            end

            dataIndex += 3
        end

        if finished then
            currentConnection:Disconnect()
            currentConnection = nil
        end
    end)
end

local URL_RESO_VALUE = 4
local TBLOCK = 0
local BLKLD = 0
local FI = 0

local success, result = pcall(function()
    return request({
        Url = "https://therealasu.pythonanywhere.com/IsActive",
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"
        },
        Body = nil
    })
end)

if success then
    if result.StatusCode == 200 then
        print("Image Loader api is active!")
    else
        warn("Image Loader api is not active")
        return nil
    end
end

--Auto Build

local ToObjectSpace = CFrame.new().ToObjectSpace

local SaveFolder = "FileStorage"

AutoBuild:Combo({
    Label = "Save Folder",
    Selected = "FileStorage",
    Items = {
        "FileStorage",
        "BABFT/Build",
        "Workspace"
    },
    Callback = function(self, Value)
        SaveFolder = tostring(Value)
    end,
})


AutoBuild:Separator({Text="Export"})

local TeamToSave = Players.LocalPlayer.Team

function GetFolder()
    local playersTeam = {}

    for _, player in ipairs(Players:GetPlayers()) do
        if player.Team and player.Team.Name == TeamToSave then
            table.insert(playersTeam, player.Name)
        end
    end

    return playersTeam
end

AutoBuild:Combo({
    Label = "Team",
    Selected = "My Team",
    Items = {
        "My Team",
        "white",
        "red",
        "black",
        "blue",
        "green",
        "yellow",
        "magenta"
    },
    Callback = function(self, Value)
        if Value == "My Team" then
            Value = Players.LocalPlayer.Team.Name
        end
        TeamToSave = Value
        print(TeamToSave)
    end,
})

local function LPTEAM3(TeamZone)
        local teamName = TeamZone

        local zoneMapping = {
            black = "BlackZone",
            blue = "Really blueZone",
            green = "CamoZone",
            red = "Really redZone",
            white = "WhiteZone",
            yellow = "New YellerZone",
            magenta = "MagentaZone"
        }

        local selectedZoneName = zoneMapping[teamName]

        if selectedZoneName then
            local zone = workspace:FindFirstChild(selectedZoneName)
            if zone then
                return zone
            end
        end
end

local FileName

AutoBuild:InputText({
    Placeholder = "File Name",
    Label = "Name",
    Value = "",
    Callback = function(self, Value)
        FileName = tostring(Value)
	end,
})

local SaveStatus = AutoBuild:Label({
	Text = "Status: nil"
})

AutoBuild:Button({
	Text = "Save Build",
	Size = UDim2.fromScale(1, 0),
	Callback = function()
        local function GetBuildData()
            local teamPlayers = GetFolder()
            local TeamRef = LPTEAM3(TeamToSave)
            local TeamCF = workspace:FindFirstChild(tostring(TeamRef)).CFrame
            local blockData = {}
        
            print(TeamRef)
            print(TeamCF)


            for _, playerName in ipairs(teamPlayers) do
                local playerFolder = workspace.Blocks:FindFirstChild(playerName)
                if playerFolder then
                    for _, v in ipairs(playerFolder:GetChildren()) do
                if v:IsA("Model") then
                    local PPart = v:FindFirstChild("PPart")
                    if PPart then
        
                        local showShadow = PPart.CastShadow or true
                        local canCollide = PPart.CanCollide
                        local anchored = PPart.Anchored
                        local rotationCF = ToObjectSpace(TeamCF, PPart.CFrame)
                        local rx, ry, rz = rotationCF:ToEulerAnglesXYZ()
                        local rotationtoString = string.format("%.3f, %.3f, %.3f", math.deg(rx), math.deg(ry), math.deg(rz))
                        local position = TeamCF:pointToObjectSpace(PPart.Position)
                        local transparency = v:FindFirstChild("TransparencyModifier") and v.TransparencyModifier.Value or 0
        
                        local color = PPart.Color
                        if NormalColorBlock[v.Name] then
                            local normalColor = NormalColorBlock[v.Name]
        
                            if math.abs(color.R - normalColor[1]) < 0.0001 and
                               math.abs(color.G - normalColor[2]) < 0.0001 and
                               math.abs(color.B - normalColor[3]) < 0.0001 then
                                colortoString = nil
                            else
                                colortoString = string.format("%.6f, %.6f, %.6f", color.R, color.G, color.B)
                            end
                        else
                            colortoString = nil
                        end
        
                        local size = nil
                        if table.find(classes.blocks, v.Name) then
                            size = PPart.Size
                        end
        
                        local FlightDistance, FuseTime, MaxForce, JetMaxSpeed, MaxSpeed, Reverspeed, Torque = nil, nil, nil, nil, nil, nil, nil
        
                        if table.find(classes.Bindable.FireWorks, v.Name) then
                            FlightDistance = v.FlightDistance.Value
                            FuseTime = v.FuseTime.Value
                        end
        
                        if v.Name == "BoxingGlove" then
                            canCollide = v.Glove.CanCollide
                        end
        
                        if v.Name == "BoatMotor" or v.Name == "BoatMotorUltra" or v.Name == "BoatMotorWinter" then
                            canCollide = v.Motor.Bottom.CanCollide
                        end
        
                        if v.Name == "LockedDoor" then 
                            canCollide = v.Part.CanCollide
                        end
        
                        if v.Name == "Portal" then 
                            canCollide = v.Light.CanCollide
                        end
        
                        if v.Name == "SpikeTrap" then 
                            canCollide = v.Box.CanCollide
                        end
        
                        if v.Name == "PineTree" then 
                            canCollide = v.Leaves4.CanCollide
                        end
        
                        if v.Name == "WoodDoor" or v.Name == "WoodTrapDoor" then 
                            canCollide = v.Door.DoorFrame.CanCollide
                        end
        
        
                        if table.find(classes.Bindable.Jets, v.Name) then
                            MaxForce = v.MaxForce.Value
                            JetMaxSpeed = v.MaxSpeed.Value
                        end
        
                        if table.find(classes.Bindable.Wheels, v.Name) then
                            MaxSpeed = v.MaxSpeed.Value
                            Reverspeed = v.ReverseSpin.Value
                            Torque = v.PPart.HingeConstraint.MotorMaxTorque
                        end
        
                        local blockInfo = {
                            ShowShadow = showShadow,
                            CanCollide = canCollide,
                            Color = colortoString,
                            Anchored = anchored,
                            Rotation = rotationtoString,
                            Position = string.format("%.6f, %.6f, %.6f", position.X, position.Y, position.Z),
                            Transparency = transparency
                        }
        
                        if size then
                            blockInfo.Size = string.format("%.6f, %.6f, %.6f", size.X, size.Y, size.Z)
                        end
        
                        if MaxSpeed then
                            blockInfo.MaxSpeed = MaxSpeed
                            blockInfo.ReverseSpin = Reverspeed
                            blockInfo.Torque = Torque
                        end
        
                        if FlightDistance then
                            blockInfo.FlightDistance = FlightDistance
                            blockInfo.FuseTime = FuseTime
                        end
        
                        if MaxForce then
                            blockInfo.MaxForce = MaxForce
                            blockInfo.MaxSpeed = JetMaxSpeed
                        end
        
                        if table.find(classes.Bindable.Aim, v.Name) then
                            blockInfo.Aim = v.Aim.Value
                        end
        
                        if table.find(classes.Bindable.Cameras, v.Name) then
                            blockInfo.ShowCrosshairs = v.ShowCrosshairs.Value
                        end
        
                        if table.find(classes.Bindable.Activators, v.Name) then
                            blockInfo.On = v.On.Value
                        end
        
                        if table.find(classes.Bindable.Specials, v.Name) then
                            if v.Name == "Servo" then
                                blockInfo.Torque = v.PPart.HingeConstraint.ServoMaxTorque
                                blockInfo.ServoSpeed = v.PPart.HingeConstraint.AngularSpeed
                                blockInfo.ReverseRotation = v.ReverseRotation.Value
                                blockInfo.TargetAngle = v.TargetAngle.Value
                            elseif v.Name == "Piston" then
                                blockInfo.ExtendLength = v.ExtendLength.Value
                                blockInfo.Speed = v.Speed.Value
                                blockInfo.LastDirection = v.LastDirrection.Value
                            elseif v.Name == "Delay" then
                                blockInfo.WaitDuration = v.WaitDuration.Value
                            elseif v.Name == "Note" then
                                blockInfo.SemitoneOffset = v.SemitoneOffset.Value
                            end
                        end
        
                        if table.find(classes.Special, v.Name) then
                            if v.Name == "Rope" then
                                blockInfo.Length = v.PPart.RopeConstraint.Length
                                blockInfo.MatchRotation = v.PPart.AlignOrientation.Enabled
                                local rotationCF = ToObjectSpace(TeamCF, PPart.CFrame)
                                local rx, ry, rz = rotationCF:ToEulerAnglesXYZ()
                                local rotationtoString = string.format("%.3f, %.3f, %.3f", math.deg(rx), math.deg(ry), math.deg(rz))
                                blockInfo.SecondaryPartRotation = rotationtoString
                                blockInfo.SecondaryPartPosition = string.format("%.6f, %.6f, %.6f", SecondaryPartPosition.X, SecondaryPartPosition.Y, SecondaryPartPosition.Z)
                            elseif v.Name == "Sign" then
                                blockInfo.Text = v.PPart.SurfaceGui.TextLabel.Text
                            elseif v.Name == "CandyRed" then
                                blockInfo.DepthScale = v.DepthScale.Value
                                blockInfo.HeadScale = v.HeadScale.Value
                                blockInfo.HeightScale = v.HeightScale.Value
                                blockInfo.WidthScale = v.WidthScale.Value
                            elseif v.Name == "CandyBlue" then
                                blockInfo.DepthScale = v.DepthScale.Value
                                blockInfo.HeadScale = v.HeadScale.Value
                                blockInfo.HeightScale = v.HeightScale.Value
                                blockInfo.WidthScale = v.WidthScale.Value
                            elseif v.Name == "Bar" then
                                blockInfo.Length = v.PPart.RodConstraint.Length
                                blockInfo.AngleLimit = v.PPart.RodConstraint.LimitAngle0
                                blockInfo.MatchRotation = v.PPart.AlignOrientation.Enabled
                                local rotationCF = ToObjectSpace(TeamCF, PPart.CFrame)
                                local rx, ry, rz = rotationCF:ToEulerAnglesXYZ()
                                local rotationtoString = string.format("%.3f, %.3f, %.3f", math.deg(rx), math.deg(ry), math.deg(rz))
                                blockInfo.SecondaryPartRotation = rotationtoString
                                blockInfo.SecondaryPartPosition = string.format("%.6f, %.6f, %.6f", SecondaryPartPosition.X, SecondaryPartPosition.Y, SecondaryPartPosition.Z)
                            elseif v.Name == "Spring" then
                                blockInfo.Damping = v.PPart.SpringConstraint.Damping
                                blockInfo.MaxLength = v.PPart.SpringConstraint.MaxLength
                                blockInfo.TargetLength = v.PPart.SpringConstraint.FreeLength
                                blockInfo.MinLength = v.PPart.SpringConstraint.MinLength
                                blockInfo.Stiffness = v.PPart.SpringConstraint.Stiffness
                                local rotationCF = ToObjectSpace(TeamCF, PPart.CFrame)
                                local rx, ry, rz = rotationCF:ToEulerAnglesXYZ()
                                local rotationtoString = string.format("%.3f, %.3f, %.3f", math.deg(rx), math.deg(ry), math.deg(rz))
                                blockInfo.SecondaryPartRotation = rotationtoString
                                blockInfo.SecondaryPartPosition = string.format("%.6f, %.6f, %.6f", SecondaryPartPosition.X, SecondaryPartPosition.Y, SecondaryPartPosition.Z)
                            end
                        end
        
                        if not blockData[v.Name] then
                            blockData[v.Name] = {}
                        end
        
                        table.insert(blockData[v.Name], blockInfo)
                    end
                end
            end
        end
        end
        
        return blockData
        end
        
        local blockData = GetBuildData()
        
        if next(blockData) then
            local jsonData = {}
        
            for blockName, blocks in pairs(blockData) do
                local Array = {}
                for _, block in pairs(blocks) do
                    local blockJson = {}
                    blockJson = {
                        ShowShadow = block.ShowShadow,
                        CanCollide = block.CanCollide,
                        Anchored = block.Anchored,
                        Color = block.Color,
                        Rotation = block.Rotation,
                        Position = block.Position,
                        Transparency = block.Transparency,
                        BoolValues = {},
                        NumberValues = {}
                    }
        
                    if block.Size then
                        blockJson.Size = block.Size
                    end
        
                    if block.MaxSpeed then
                        blockJson.NumberValues.MaxSpeed = block.MaxSpeed
                        blockJson.BoolValues.ReverseSpin = block.ReverseSpin
                        blockJson.Torque = block.Torque
                    end
        
                    if block.FlightDistance then
                        blockJson.NumberValues.FlightDistance = block.FlightDistance
                        blockJson.NumberValues.FuseTime = block.FuseTime
                    end
        
                    if block.MaxForce then
                        blockJson.NumberValues.MaxForce = block.MaxForce
                        blockJson.NumberValues.MaxSpeed = block.MaxSpeed 
                    end
        
                    if block.Aim then
                        blockJson.BoolValues.Aim = block.Aim
                    end
        
                    if block.ShowCrosshairs then
                        blockJson.BoolValues.ShowCrosshairs = block.ShowCrosshairs
                    end
        
                    if block.On ~= nil then
                        blockJson.BoolValues.On = block.On
                    end
        
                    if block.ExtendLength then
                        blockJson.NumberValues.ExtendLength = block.ExtendLength
                        blockJson.NumberValues.Speed = block.Speed
                        blockJson.NumberValues.LastDirection = block.LastDirection
                    end
        
                    if block.WaitDuration then
                        blockJson.NumberValues.WaitDuration = block.WaitDuration
                    end
        
                    if block.SemitoneOffset then
                        blockJson.NumberValues.SemitoneOffset = block.SemitoneOffset
                    end
        
                    if block.ServoSpeed then
                        blockJson.Torque = block.Torque
                        blockJson.ServoSpeed = block.ServoSpeed
                        blockJson.BoolValues.ReverseRotation = block.ReverseRotation
                        blockJson.NumberValues.TargetAngle = block.TargetAngle
                    end
        
                    if block.MatchRotation then
                        blockJson.Length = block.Length
                        blockJson.MatchRotation = block.MatchRotation
                        blockJson.SecondaryPartRotation = block.SecondaryPartRotation
                        blockJson.SecondaryPartPosition = block.SecondaryPartPosition
                    end
        
        
                    if block.Text then
                        blockJson.Text = block.Text
                    end
        
                    if block.DepthScale then
                        blockJson.NumberValues.DepthScale = block.DepthScale
                        blockJson.NumberValues.HeadScale = block.HeadScale
                        blockJson.NumberValues.HeightScale = block.HeightScale 
                        blockJson.NumberValues.WidthScale = block.WidthScale
                    end
                    
                    if block.AngleLimit then
                        blockJson.Length = block.Length
                        blockJson.AngleLimit = block.AngleLimit
                        blockJson.MatchRotation = block.MatchRotation
                        blockJson.SecondaryPartPosition = block.SecondaryPartPosition
                        blockJson.SecondaryPartRotation = block.SecondaryPartRotation
                    end
        
                    if block.Damping then
                        blockJson.Damping = block.Damping
                        blockJson.MaxLength = block.MaxLength
                        blockJson.NumberValues.TargetLength = block.TargetLength
                        blockJson.MinLength = block.MinLength
                        blockJson.Stiffness = block.Stiffness
                        blockJson.SecondaryPartRotation = block.SecondaryPartRotation
                        blockJson.SecondaryPartPosition = block.SecondaryPartPosition
                    end
        
                    block.Size = nil
                    block.MaxSpeed = nil
                    block.ReverseSpin = nil
                    block.Torque = nil
                    block.FlightDistance = nil
                    block.FuseTime = nil
                    block.MaxForce = nil
                    block.Aim = nil
                    block.ShowCrosshairs = nil
                    block.On = nil
                    block.ExtendLength = nil
                    block.Speed = nil
                    block.LastDirection = nil
                    block.WaitDuration = nil
                    block.SemitoneOffset = nil
                    block.ServoSpeed = nil
                    block.ReverseRotation = nil
                    block.TargetAngle = nil
                    block.MatchRotation = nil
                    block.SecondaryPartRotation = nil
                    block.SecondaryPartPosition = nil
                    block.Text = nil
                    block.DepthScale = nil
                    block.HeadScale = nil
                    block.HeightScale = nil
                    block.WidthScale = nil
                    block.AngleLimit = nil
                    block.Damping = nil
                    block.MaxLength = nil
                    block.TargetLength = nil
                    block.MinLength = nil
                    block.Stiffness = nil
        
                    table.insert(Array, blockJson)
                end
                jsonData[blockName] = Array
            end
        
            local jsonString = HttpService:JSONEncode(jsonData)
            
            if SaveFolder == "Workspace" then
                writefile(FileName..".Build", jsonString)
            else
                writefile(SaveFolder.."/"..FileName..".Build", jsonString)
            end
            SaveStatus.Text = "Success! Saved on "..SaveFolder
            SaveStatus.TextColor3 = Color3.fromRGB(80, 200, 90)

        else
            SaveStatus.Text = "Error"
            SaveStatus.TextColor3 = Color3.fromRGB(245, 60, 60)
        end
	end,
})

AutoBuild:Separator({Text="Build"})

local BP = ReplicatedStorage:FindFirstChild("BuildingParts")
if BP then
    for _, part in ipairs(BP:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Anchored = true
        end
    end
end

AutoBuild:Label({
    TextWrapped = true,
	Text = "Auto Build Still under development, at least you can make .build files and build images :)"
})


AutoBuild:Image({
	Image = 139747885253158,
	Ratio = 14 / 9,
	AspectType = Enum.AspectType.FitWithinMaxSize,
	Size = UDim2.fromScale(1, 1)
})


-- Image

Image:Separator({Text="Import"})

local ImgStatus = Image:Label({
	Text = "Status: nil"
})

local CheckBoxText

Image:InputText({
    Placeholder = "https://..",
    Label = "URL",
    Value = "",
    Callback = function(self, Value)
        CheckBoxText = tostring(Value)
	end,
})

Image:InputInt({
    Label = "Resolution",
    Value = 4,
    Callback = function(self, Value)
        URL_RESO_VALUE = tostring(Value)
	end,
})

Image:Label({
	Text = "[Higher = Less blocks]"
})

Image:Button({
	Text = "Import Image",
    BackgroundColor3 = Color3.fromRGB(80, 200, 90),
	Size = UDim2.fromScale(1, 0),
	Callback = function()
        TBLOCK = 0
        BLKLD = 0
        TempData = {}
        USEURL= nil
        cooloffset = Vector3.new(0, 0, 0)
        Brainrot = CFrame.identity
        angleY = 0
        rotationCFrame = CFrame.Angles(0, 0, 0)

        ImgStatus.Text = "Invalid URL"
        ImgStatus.TextColor3 = Color3.fromRGB(245, 60, 60)

        local Text = CheckBoxText
        if string.sub(Text, 1, 6) == "https:" then
            ImgStatus.Text = "Fetching..."
            ImgStatus.TextColor3 = Color3.fromRGB(255, 255, 255)

            local url = "https://therealasu.pythonanywhere.com/process_image" -- It is useless to DDOS it, all you're going to do is DDOS pythonanywhere which are protected against that, and the server doesn't cost me anything, it's free
            local headers = {
                ["Content-Type"] = "application/json"
            }

            local function getImageData(imageUrl, resolution)
                local body = HttpService:JSONEncode({
                    image_url = imageUrl,
                    resolution = resolution
                })

                local success, result = pcall(function()
                    return request({
                        Url = url,
                        Method = "POST",
                        Headers = headers,
                        Body = body
                    })
                end)


                if success then
                    if result.StatusCode == 200 then
                        local responseData = result.Body
                        return responseData
                    else
                        ImgStatus.Text = "Error: check Read Me"
                        ImgStatus.TextColor3 = Color3.fromRGB(245, 60, 60) -- error
                        return nil
                    end
                else
                    ImgStatus.Text = "Error: check Read Me"
                    ImgStatus.TextColor3 = Color3.fromRGB(245, 60, 60) -- error
                    return nil
                end
            end

            local response = getImageData(Text, URL_RESO_VALUE)

            if response then
                local success, result = pcall(function()
                    return HttpService:JSONDecode(response)
                end)
                if success and result then
                    if result.error then
                        ImgStatus.Text = "Error: check Read Me"
                        ImgStatus.TextColor3 = Color3.fromRGB(245, 60, 60) -- error
                    else
                        USEURL = true
                        TempData = response         
                        ImgStatus.Text = "Success: Enable Preview"
                        ImgStatus.TextColor3 = Color3.fromRGB(80, 200, 90) -- success
                    end
                else
                    USEURL = true
                    TempData = response         
                    ImgStatus.Text = "Success: Enable Preview"
                    ImgStatus.TextColor3 = Color3.fromRGB(80, 200, 90) -- success
                end
            else
                ImgStatus.Text = "Error: check Read Me"
                ImgStatus.TextColor3 = Color3.fromRGB(245, 60, 60) -- error
            end
        end
	end,
})




Image:Separator({Text="Preview"})

Image:Checkbox({
	Label = "Preview",
	Value = false,
	Callback = function(self, Value)
        if Value then
            BLKLD = 0
            TBLOCK = 0
            local filePath = "BABFT/Image/" .. (FileImage or "default.txt")
            local fileContent = {}
            if USEURL == false then
                fileContent = readFile(filePath)
            else
                fileContent = TempData
            end
            if not fileContent then return end
            local data
                data = parseColors(fileContent)
            buildImagePREVIEW(data, blockSize)
        else
            for _, skibidi in ipairs(previewFolder:GetChildren()) do
                if skibidi.Name ~= "PreviewSize" then
                    skibidi:Destroy()
                end
            end
        end
	end,
})

Image:Checkbox({
	Label = "Grid",
	Value = false,
	Callback = function(self, Value)
        if Value then
            local filePath = "BABFT/Image/" .. (FileImage or "default.txt")
            local fileContent = {}
            if USEURL == false then
                fileContent = readFile(filePath)
            else
                fileContent = TempData
            end
            if not fileContent then return end
            local data = parseColors(fileContent)
            local frameSize = calculateFrameSize(data)
            startPosition = LPTEAM()
            previewFrame(frameSize, startPosition, blockSize)
        else
            if PreviewPart then
                PreviewPart:Destroy()
                PreviewPart = nil
            end
        end
	end,
})

Image:SliderProgress({
    Label = "Loading Speed",
    Value = 750,
    Minimum = 100,
    Maximum = 4000,
    Size = UDim2.fromScale(0.54, 0.034),
    Callback = function(self, Value)
    batchSize = Value
end,
})

Image:Separator({Text="modifiers"})

Image:Combo({
    Label = "Block",
    Selected = "PlasticBlock",
    Items = {
        "PlasticBlock",
        "CoalBlock", 
        "ConcreteBlock", 
        "FabricBlock", 
        "GlassBlock", 
        "GoldBlock", 
        "GrassBlock", 
        "IceBlock", 
        "MarbleBlock", 
        "MetalBlock", 
        "NeonBlock", 
        "ObsidianBlock", 
        "RustedBlock", 
        "SmoothWoodBlock", 
        "StoneBlock", 
        "TitaniumBlock", 
        "ToyBlock", 
        "WoodBlock"
    },
    Callback = function(self, Value)
        BlockType = Value
    end,
})

Image:InputText({
    Placeholder = "0.1 - 10",
    Label = "Size",
    Value = "2",
    Callback = function(self, Value)
        Value = tonumber(Value)
        if Value < 0.1 or Value > 10 then
            Value = 2
        end
        blockSize = Value
	end,
})

Image:InputInt({
    Label = "Depth",
    Value = 2,
    Callback = function(self, Value)
        Bdepth = tonumber(Value)
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Size = Vector3.new(skibidi.Size.X, skibidi.Size.Y, Bdepth)
            end
	end,
})

local originalCFrames = {}

--[[
Image:InputInt({
    Label = "Rotate",
    Size = UDim2.new(0.7, 0, 0, 20),
    Value = 0,
    Callback = function(self, Value)
        angleY = tonumber(Value)
        if not angleY then
            return
        end

        local centerImage = workspace.ImagePreview:FindFirstChild("Centerimage")
        if not centerImage then
            return
        end

        local rotationCFrame = CFrame.Angles(0, math.rad(angleY), 0)

        Brainrot = centerImage.CFrame * rotationCFrame

        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            if skibidi:IsA("BasePart") and skibidi ~= centerImage then

                local centerCFrame = centerImage.CFrame

                if not originalCFrames[skibidi] then
                    originalCFrames[skibidi] = skibidi.CFrame
                end

                local originalCFrame = originalCFrames[skibidi]
                local relativeCFrame = centerCFrame:ToObjectSpace(originalCFrame)

                local ghaaa = centerCFrame * rotationCFrame * relativeCFrame
                skibidi.CFrame = ghaaa
            end
        end
	end,
})


Image:InputCFrame({
    Label = "Rotate",
    Value = CFrame.new(),
    Minimum = CFrame.new(-360, -360, -360),
    Maximum = CFrame.new(360, 360, 360),
    Callback = function(self, Value)
        local centerImage = workspace.ImagePreview:FindFirstChild("Centerimage")
        if not centerImage then
            return
        end
        local pos = Value.Position

        local rotationCFrame = CFrame.Angles(math.rad(pos.X), math.rad(pos.Y), math.rad(pos.Z))

        Brainrot = centerImage.CFrame * rotationCFrame

        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            if skibidi:IsA("BasePart") and skibidi ~= centerImage then

                local centerCFrame = centerImage.CFrame

                if not originalCFrames[skibidi] then
                    originalCFrames[skibidi] = skibidi.CFrame
                end

                local originalCFrame = originalCFrames[skibidi]
                local relativeCFrame = centerCFrame:ToObjectSpace(originalCFrame)

                local ghaaa = centerCFrame * rotationCFrame * relativeCFrame
                skibidi.CFrame = ghaaa
            end
        end
    end
})

local ImgStatsP = Image:Label({
    TextWrapped = true,
	Text = "Since it's a bit glitched you should rotate first, then move the image"
})

Image:InputInt({
    Label = "Move multiplier",
    Value = 40,
    Size = UDim2.new(0.5, 0, 0, 20),
    Callback = function(self, Value)
        Unit = tostring(Value)
	end,
})

local PositiveMove = Image:Row()
local NegativeMove = Image:Row()

PositiveMove:Button({
	Text = "+ X",
	Size = UDim2.fromScale(0.3, 0),
	Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(Unit, 0, 0)
            end
            cooloffset = cooloffset + Vector3.new(Unit, 0, 0)
	end,
})

PositiveMove:Button({
	Text = "+ Y",
	Size = UDim2.fromScale(0.3, 0),
	Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(0, Unit, 0)
            end
            cooloffset = cooloffset + Vector3.new(0, Unit, 0)
	end,
})

PositiveMove:Button({
	Text = "+ Z",
	Size = UDim2.fromScale(0.3, 0),
	Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(0, 0, Unit)
            end
            cooloffset = cooloffset + Vector3.new(0, 0, Unit)
	end,
})

NegativeMove:Button({
	Text = "- X",
	Size = UDim2.fromScale(0.3, 0),
	Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(-Unit, 0, 0)
            end
            cooloffset = cooloffset + Vector3.new(-Unit, 0, 0)
	end,
})

NegativeMove:Button({
	Text = "- Y",
	Size = UDim2.fromScale(0.3, 0),
	Callback = function()
            for _, skibidi in ipairs(previewFolder:GetChildren()) do
                skibidi.Position = skibidi.Position + Vector3.new(0, -Unit, 0)
                end
                cooloffset = cooloffset + Vector3.new(0, -Unit, 0)
	end,
})

NegativeMove:Button({
	Text = "- Z",
	Size = UDim2.fromScale(0.3, 0),
	Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(0, 0, -Unit)
            end
            cooloffset = cooloffset + Vector3.new(0, 0, -Unit)
	end,
})

Image:Separator({Text="Build"})

local TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLongButThisOneChangeLol = 0
local TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLongButThisOneDoesntChangeLol = 0

local ImgStatsP = Image:Label({
    TextWrapped = true,
	Text = "Info: Enable preview before build"
})

local ProgressBar = Image:ProgressBar({
	Label = "Progress",
	Percentage = 0
})

Image:Button({
	Text = "Build Image",
	Size = UDim2.fromScale(1, 0),
	Callback = function()
        ImgStatsP.Text = "Info: starting"
        ImgStatsP.TextColor3 = Color3.fromRGB(255, 255, 255)
        task.wait(0.15)

        TBLOCK = 0
TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong = 0

local blocksFolder = workspace:FindFirstChild("Blocks")
if blocksFolder then
    local blockssFolder = blocksFolder:FindFirstChild(Nplayer)
    if blockssFolder then
        TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong = #blockssFolder:GetChildren()
        TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLongButThisOneDoesntChangeLol = #blockssFolder:GetChildren()
        local parts = {}
        local folder = workspace:FindFirstChild("ImagePreview")
        local children = folder:GetChildren()
        if #children <= 1 then
            ImgStatsP.TextColor3 = Color3.fromRGB(245, 60, 60)
            ImgStatsP.Text = "Error: Enable Preview"
            return
        end

        for _, part in ipairs(children) do
            if part:IsA("BasePart") and part.Name == "Part" then
                table.insert(parts, part)
            end
        end
        TBLOCK = #parts
    else
        ImgStatsP.TextColor3 = Color3.fromRGB(245, 60, 60)
        ImgStatsP.Text = "Error: Disable Fps Booster"
    end
else
    ImgStatsP.TextColor3 = Color3.fromRGB(245, 60, 60)
    ImgStatsP.Text = "Error: Disable Fps Booster"
end
        BlockLoaded = false
        ImageLoading = true
        getgenv().ImgLoaderStat = true
        ProgressBar:SetPercentage(0)
        task.spawn(buildImageFAST)
    end,
 })

Image:Button({
	Text = "Abort",
	Size = UDim2.fromScale(1, 0),
	Callback = function()
        getgenv().ImgLoaderStat = false
        ImgStatsP.Text = "Abortion requested"
            task.delay(1, function()
                ImgStatsP.Text = "Image Aborted"
            end)
            task.delay(1, function()
                ImgStatsP.Text = "Unplaced Blocks deleted."
            end)
            ImageLoading = false
	end,
})

Image:Separator({Text="Info"})

Image:Label({
    TextWrapped = true,
	Text = "Require to own all the blocks, require painting and scaling tools. Do not place block when building the image."
})

Image:Label({
    TextWrapped = true,
	Text = "Re enable preview after changing the size, if the image get glitched, re enable preview.\n"
})

-- BlockNeeded

BlockNeeded:Separator({Text=" Build List"})

local AutoBuildBlockList = BlockNeeded:CollapsingHeader({
	Title = "Auto Build Block List"
})

AutoBuildBlockList:Label({
    TextWrapped = true,
	Text = "Doesn't work RIGHT NOW, auto build still in development"
})


-- Image block List

BlockNeeded:Separator({Text="Image Block List"})

local ImgTable = BlockNeeded:Table({
	RowBackground = true,
	Border = true,
	RowsFill = false,
	Size = UDim2.fromScale(1, 0)
})

ImgTable:ClearRows()
local ColName = ImgTable:Row()
local ImgName = ColName:Column()
local BlockName = ColName:Column()
local NeededName = ColName:Column()
local MissingName = ColName:Column()

ImgName:Label({
    Text = `Block`,
})

BlockName:Label({
    TextWrapped = true,
    Text = `Type`
})

NeededName:Label({
    Text = `Need`
})

MissingName:Label({
    Text = `Missing`
})

local Row = ImgTable:Row()
local Img = Row:Column()
local Name = Row:Column()
local Needed = Row:Column()
local Missing = Row:Column()

BlockNeeded:Separator({Text="Button"})

local NbBlockneeded = 0
local NbBlockmissing = 0

BlockNeeded:Button({
	Text = "Refresh List",
	Size = UDim2.fromScale(1, 0),
	Callback = function()
        NbBlockneeded = 0
        ImgTable:ClearRows()
        local ColName = ImgTable:Row()
ImgName = ColName:Column()
BlockName = ColName:Column()
NeededName = ColName:Column()
MissingName = ColName:Column()

for _, skibidi in ipairs(workspace.ImagePreview:GetChildren()) do
    if skibidi.Name == "Part" then

        local blockVolume = skibidi.Size.X * skibidi.Size.Y * skibidi.Size.Z

        local blockSize = (blockVolume < 8) and 8 or blockVolume

        NbBlockneeded = NbBlockneeded + blockSize
    end
end

UUserBlockList()
LPBlockvalue = UserBlockList[BlockType]
NbBlockneeded = math.ceil(NbBlockneeded / 8)
NbBlockmissing = NbBlockneeded - LPBlockvalue
if NbBlockmissing < 0 then
  NbBlockmissing = 0
end

ImgName:Label({
    Text = `Block`,
})

BlockName:Label({
    TextWrapped = true,
    Text = `Type`,
})

NeededName:Label({
    Text = `Need`,
})

MissingName:Label({
    Text = `Missing`,
})
local blocktypeID = BlockId[BlockType]

         Row = ImgTable:Row()
         Img = Row:Column()
       Name = Row:Column()
        Needed = Row:Column()
     Missing = Row:Column()

     Img:Image({
        Image = blocktypeID,
        Ratio = 1/1,
        AspectType = Enum.AspectType.FitWithinMaxSize,
        Size = UDim2.fromScale(1, 1)
    })

    Name:Label({
        TextWrapped = true,
        Text = tostring(BlockType)
    })

    Needed:Label({
        Text = tostring(NbBlockneeded)
    })

    Missing:Label({
        Text = tostring(NbBlockmissing)
    })
	end,
})

BlockNeeded:Button({
	Text = "Copy List [not working for now]",
	Size = UDim2.fromScale(1, 0),
	Callback = function()

	end,
})
-- Save and Load

AutoFarm:Button({
    Text = "Save Configuration",
    Size = UDim2.fromScale(1, 0),
    Callback = function(self)
        local config = {
            AntiAfk = AntiAfkBool,
            AutoFarm = AutoFarmBool,
            MakeItSilent = MakeItSilentBool,
            WebHookURL = WebHookURLBool,
            Interval = IntervalBool,
            WebHookActive = WebHookActiveBool,
            Hideuselessparts = HideuselesspartsBool,
            Hideplayersblocks = HideplayersblocksBool,
            HideAll = HideAllBool
        }

        local jsonData = HttpService:JSONEncode(config)
        writefile("BABFT/Settings/SaveConfig", jsonData)
    end,
})

AutoFarm:Button({
    Text = "Load Configuration",
    Size = UDim2.fromScale(1, 0),
    Callback = function(self)

        if not isfile("BABFT/Settings/SaveConfig") then
            warn("/Asu's Basement Script/\nyou need to save something before loading it")
            return
        end

        local jsonData = readfile("BABFT/Settings/SaveConfig")
        local success, config = pcall(function()
            return HttpService:JSONDecode(jsonData)
        end)

        if not success then
            warn("/Asu's Basement Script/\nUh oh... Couldn't Fetch data. Try to make a new save")
            return
        end

        if config.AntiAfk ~= nil then 
            AntiAfkToggle:SetTicked(config.AntiAfk)
            AntiAfkBool = config.AntiAfk
        end

        if config.AutoFarm ~= nil then 
            AutoFarmToggle:SetTicked(config.AutoFarm)
            AutoFarmBool = config.AutoFarm
        end

        if config.MakeItSilent ~= nil then 
            MakeItSilentToggle:SetTicked(config.MakeItSilent)
            MakeItSilentBool = config.MakeItSilent
        end

        if config.WebHookActive ~= nil then 
            WebHookActiveToggle:SetTicked(config.WebHookActive)
            WebHookActiveBool = config.WebHookActive
        end

        if config.Hideuselessparts ~= nil then 
            HideuselesspartsToggle:SetTicked(config.Hideuselessparts)
            HideuselesspartsBool = config.Hideuselessparts
        end

        if config.Hideplayersblocks ~= nil then 
            HideplayersblocksToggle:SetTicked(config.Hideplayersblocks)
            HideplayersblocksBool = config.Hideplayersblocks
        end

        if config.HideAll ~= nil then 
            HideAllToggle:SetTicked(config.HideAll)
            HideAllBool = config.HideAll
        end

        if config.Interval ~= nil then
            IntervalToggle.Frame.Input.Text = config.Interval
            IntervalBool = config.Interval
        end

        if config.WebHookURL ~= nil then
            WebHookURLToggle.Frame.Input.Text = config.WebHookURL
            WebHookURLBool = config.WebHookURL
            WebHook = config.WebHookURL
        end
    end,
})

AutoFarm:Label({
    TextWrapped = true,
	Text = "Saves and loads auto farm toggles, URL Webhook, Interval and Fps Booster toggles"
})

local blocksFolder = workspace:FindFirstChild("Blocks")
local blockssFolder
pcall(function()
    blockssFolder = blocksFolder:FindFirstChild(Nplayer)
end)

local childCount = #blockssFolder:GetChildren()
local startTime = tick()

task.spawn(function()
    while FcMaster do
        pcall(function()
            collectgarbage("collect")
        end)
        wait(2)
    end
end)

local function updateStats()
    local BLKLD = childCount - TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLongButThisOneDoesntChangeLol
    local elapsedTime = tick() - startTime
    local blocksPerSecond = (elapsedTime > 0) and (BLKLD / elapsedTime) or 0
    local blocksRemaining = TBLOCK - BLKLD
    local timeRemaining = (blocksPerSecond > 0) and (blocksRemaining / blocksPerSecond) or 0
    local FI = math.max(timeRemaining, 0)

    if not BlockLoaded then
        ImgStatsP.Text = "Blocks Loaded: " .. BLKLD .. "/" .. TBLOCK .. "\nFinish in: ~" .. math.floor(FI) .. "s"
        local percentage = math.min((BLKLD / TBLOCK) * 100, 98)
        ProgressBar:SetPercentage(percentage)

        if BLKLD >= TBLOCK then
            BlockLoaded = true
        end
    end
end

local connectionAdded = blockssFolder.ChildAdded:Connect(function()
    childCount = childCount + 1
    updateStats()
end)

local connectionRemoved = blockssFolder.ChildRemoved:Connect(function()
    childCount = math.max(0, childCount - 1)
    updateStats()
end)

task.spawn(function()
    while FcMaster do
        task.wait(1)
    end

    connectionAdded:Disconnect()
    connectionRemoved:Disconnect()
end)

Init = true
task.spawn(function ()
    while FcMaster do
        if BlockLoaded then
    if TASK1  then
        ImgStatsP.Text = "Placing Blocks..."
        TASK1 = false
    elseif TASK2  then
        ImgStatsP.Text = "Placing Blocks..."
        TASK2 = false
    elseif TASK3  then
        ImgStatsP.Text = "Coloring Blocks..."
        TASK3 = false
    elseif TASK4  then
        ImgStatsP.Text = "Deleting unplaced Blocks..."
        TASK4 = false
    elseif TASK5  then
        ProgressBar:SetPercentage(100)
        ImgStatsP.Text = "Success!"
        ImgStatsP.TextColor3 = Color3.fromRGB(80, 200, 90)
        TASK5 = false
        task.wait(0.25)
        ImgStatsP.Text = "Success! Proccess end"
        ImgStatsP.TextColor3 = Color3.fromRGB(80, 200, 90)
    end
end
    wait(0.2)
end
end)

warn("/Asu's Basement Script/ - The script loaded without any errors")
--[[

▀█████████▄  ▄██   ▄           ▄████████    ▄████████ ███    █▄  
  ███    ███ ███   ██▄        ███    ███   ███    ███ ███    ███ 
  ███    ███ ███▄▄▄███        ███    ███   ███    █▀  ███    ███ 
 ▄███▄▄▄██▀  ▀▀▀▀▀▀███        ███    ███   ███        ███    ███ 
▀▀███▀▀▀██▄  ▄██   ███      ▀███████████ ▀███████████ ███    ███ 
  ███    ██▄ ███   ███        ███    ███          ███ ███    ███ 
  ███    ███ ███   ███        ███    ███    ▄█    ███ ███    ███ 
▄█████████▀   ▀█████▀         ███    █▀   ▄████████▀  ████████▀  

@thereal_asu | Build A Boat For Treasure

discord server: https://discord.gg/zrAB2m5gvz
]]

--]]
