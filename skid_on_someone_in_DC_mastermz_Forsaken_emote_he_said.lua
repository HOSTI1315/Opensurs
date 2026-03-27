-- Verificação de execução múltipla
if _G.EmoteInterfaceExecuted then
    local SG = game:GetService("StarterGui")
    SG:SetCore("SendNotification", {
        Title = "Emote System",
        Text = "this script has already been executed, this execution was avoided to prevent bugs yk what i mean ;)",
        Duration = 8
    })
    return
end

_G.EmoteInterfaceExecuted = true

local UIS = game:GetService("UserInputService")
local RS = game:GetService("ReplicatedStorage")
local Plrs = game:GetService("Players")
local RS2 = game:GetService("RunService")
local TS = game:GetService("TweenService")
local SG = game:GetService("StarterGui")

local plr = Plrs.LocalPlayer

if game.PlaceId ~= 18687417158 then
    plr:Kick("thats the wrong game, pal. -- bitwebbin")
    return
end

local onMobile = UIS.TouchEnabled

local emoteData = {}
local favEmotes = {}
local btnStorage = {}

local FAV_FILE = "emote_favs.json"

local hasFS = (readfile and writefile) ~= nil

local function getFavs()
    if not hasFS then return end
    
    local ok, fileContent = pcall(function()
        if isfolder and isfolder("EmoteData") then
            if not isfolder("EmoteData") then
                makefolder("EmoteData")
            end
            if readfile("EmoteData/" .. FAV_FILE) then
                return readfile("EmoteData/" .. FAV_FILE)
            end
        else
            if readfile(FAV_FILE) then
                return readfile(FAV_FILE)
            end
        end
        return nil
    end)
    
    if ok and fileContent then
        local ok2, parsed = pcall(function()
            return game:GetService("HttpService"):JSONDecode(fileContent)
        end)
        if ok2 and parsed then
            for emoteName, isFav in pairs(parsed) do
                favEmotes[emoteName] = isFav
            end
        end
    else
        favEmotes = {}
    end
end

local function storeFavs()
    if not hasFS then return end
    
    local toSave = {}
    for emoteName, isFav in pairs(favEmotes) do
        if emoteData[emoteName] then
            toSave[emoteName] = isFav
        end
    end
    
    local jsonStr = game:GetService("HttpService"):JSONEncode(toSave)
    
    pcall(function()
        if isfolder and isfolder("EmoteData") then
            if not isfolder("EmoteData") then
                makefolder("EmoteData")
            end
            writefile("EmoteData/" .. FAV_FILE, jsonStr)
        else
            writefile(FAV_FILE, jsonStr)
        end
    end)
end

local assetsDir = RS:FindFirstChild("Assets")
local emotesDir = assetsDir and assetsDir:FindFirstChild("Emotes")

if emotesDir then
    for _, modScript in pairs(emotesDir:GetChildren()) do
        if modScript:IsA("ModuleScript") then
            local success, data = pcall(require, modScript)
            if success and typeof(data) == "table" then
                local animID = data.AssetID
                if animID and typeof(animID) == "string" then
                    emoteData[modScript.Name] = data
                    favEmotes[modScript.Name] = favEmotes[modScript.Name] or false
                end
            end
        end
    end
end

getFavs()

local mainGUI = Instance.new("ScreenGui")
mainGUI.Name = "EmoteInterface"
mainGUI.ResetOnSpawn = false
mainGUI.Parent = plr:WaitForChild("PlayerGui")

local mobUI = nil
local openBtn = nil
local stopBtn = nil

if onMobile then
    mobUI = Instance.new("Frame")
    mobUI.Name = "MobControls"
    mobUI.Size = UDim2.new(0, 200, 0, 120)
    mobUI.Position = UDim2.new(1, -220, 0.5, -60)
    mobUI.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    mobUI.BackgroundTransparency = 0.2
    mobUI.Parent = mainGUI
    
    local mobRound = Instance.new("UICorner")
    mobRound.CornerRadius = UDim.new(0, 15)
    mobRound.Parent = mobUI
    
    local mobGlow = Instance.new("ImageLabel")
    mobGlow.Size = UDim2.new(1, 10, 1, 10)
    mobGlow.Position = UDim2.new(0, -5, 0, -5)
    mobGlow.BackgroundTransparency = 1
    mobGlow.Image = "rbxassetid://1316045217"
    mobGlow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    mobGlow.ImageTransparency = 0.8
    mobGlow.ScaleType = Enum.ScaleType.Slice
    mobGlow.SliceCenter = Rect.new(10, 10, 118, 118)
    mobGlow.Parent = mobUI

    local mobDragIn, mobDragStart, mobStartPos
    mobUI.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or (onMobile and inp.UserInputType == Enum.UserInputType.Touch) then
            mobDragStart = inp.Position
            mobStartPos = mobUI.Position
            inp.Changed:Connect(function()
                if inp.UserInputState == Enum.UserInputState.End then
                    mobDragStart = nil
                end
            end)
        end
    end)

    mobUI.InputChanged:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseMovement or (onMobile and inp.UserInputType == Enum.UserInputType.Touch) then
            mobDragIn = inp
        end
    end)

    UIS.InputChanged:Connect(function(inp)
        if inp == mobDragIn and mobDragStart then
            local diff = inp.Position - mobDragStart
            local newX = mobStartPos.X.Offset + diff.X
            local newY = mobStartPos.Y.Offset + diff.Y
            
            local screenSize = workspace.CurrentCamera.ViewportSize
            local uiSize = mobUI.AbsoluteSize
            
            newX = math.clamp(newX, 0, screenSize.X - uiSize.X)
            newY = math.clamp(newY, 0, screenSize.Y - uiSize.Y)
            
            mobUI.Position = UDim2.new(0, newX, 0, newY)
        end
    end)
    
    openBtn = Instance.new("TextButton")
    openBtn.Name = "OpenBtn"
    openBtn.Size = UDim2.new(0.8, 0, 0, 40)
    openBtn.Position = UDim2.new(0.1, 0, 0.1, 0)
    openBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    openBtn.Text = "🎭 OPEN"
    openBtn.Font = Enum.Font.GothamBold
    openBtn.TextSize = 16
    openBtn.Parent = mobUI
    
    local openRound = Instance.new("UICorner")
    openRound.CornerRadius = UDim.new(0, 10)
    openRound.Parent = openBtn
    
    stopBtn = Instance.new("TextButton")
    stopBtn.Name = "StopBtn"
    stopBtn.Size = UDim2.new(0.8, 0, 0, 40)
    stopBtn.Position = UDim2.new(0.1, 0, 0.55, 0)
    stopBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    stopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    stopBtn.Text = "⏹️ STOP"
    stopBtn.Font = Enum.Font.GothamBold
    stopBtn.TextSize = 16
    stopBtn.Parent = mobUI
    
    local stopRound = Instance.new("UICorner")
    stopRound.CornerRadius = UDim.new(0, 10)
    stopRound.Parent = stopBtn
end

local mainBox = Instance.new("Frame")
mainBox.Size = UDim2.new(onMobile and 0.8 or 0.35, 0, 0, 0)
mainBox.Position = UDim2.new(onMobile and 0.1 or 0.325, 0, onMobile and 0.1 or 0.25, 0)
mainBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainBox.BackgroundTransparency = 0.1
mainBox.Visible = false
mainBox.Parent = mainGUI

local dragIn, dragBegin, startLocation
mainBox.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 or (onMobile and inp.UserInputType == Enum.UserInputType.Touch) then
        dragBegin = inp.Position
        startLocation = mainBox.Position
        inp.Changed:Connect(function()
            if inp.UserInputState == Enum.UserInputState.End then
                dragBegin = nil
            end
        end)
    end
end)

mainBox.InputChanged:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseMovement or (onMobile and inp.UserInputType == Enum.UserInputType.Touch) then
        dragIn = inp
    end
end)

UIS.InputChanged:Connect(function(inp)
    if inp == dragIn and dragBegin then
        local move = inp.Position - dragBegin
        local posX = startLocation.X.Offset + move.X
        local posY = startLocation.Y.Offset + move.Y
        
        local viewSize = workspace.CurrentCamera.ViewportSize
        local boxSize = mainBox.AbsoluteSize
        
        posX = math.clamp(posX, 0, viewSize.X - boxSize.X)
        posY = math.clamp(posY, 0, viewSize.Y - boxSize.Y)
        
        mainBox.Position = UDim2.new(0, posX, 0, posY)
    end
end)

local roundEdges = Instance.new("UICorner")
roundEdges.CornerRadius = UDim.new(0, 15)
roundEdges.Parent = mainBox

local shadowEff = Instance.new("ImageLabel")
shadowEff.Size = UDim2.new(1, 10, 1, 10)
shadowEff.Position = UDim2.new(0, -5, 0, -5)
shadowEff.BackgroundTransparency = 1
shadowEff.Image = "rbxassetid://1316045217"
shadowEff.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadowEff.ImageTransparency = 0.8
shadowEff.ScaleType = Enum.ScaleType.Slice
shadowEff.SliceCenter = Rect.new(10, 10, 118, 118)
shadowEff.Parent = mainBox

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, onMobile and 80 or 60)
topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
topBar.BorderSizePixel = 0
topBar.Parent = mainBox

local headerRound = Instance.new("UICorner")
headerRound.CornerRadius = UDim.new(0, 15)
headerRound.Parent = topBar

local headerText = Instance.new("TextLabel")
headerText.Size = UDim2.new(1, 0, 0, 25)
headerText.Position = UDim2.new(0, 0, 0, 5)
headerText.BackgroundTransparency = 1
headerText.Text = "EMOTES" .. (onMobile and " 📱" or "")
headerText.TextColor3 = Color3.fromRGB(255, 255, 255)
headerText.Font = Enum.Font.GothamBold
headerText.TextSize = onMobile and 20 or 18
headerText.Parent = topBar

local searchField = Instance.new("TextBox")
searchField.Size = UDim2.new(0.9, 0, 0, onMobile and 30 or 25)
searchField.Position = UDim2.new(0.05, 0, 0, onMobile and 35 or 30)
searchField.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
searchField.TextColor3 = Color3.fromRGB(255, 255, 255)
searchField.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
searchField.PlaceholderText = "Search emotes..."
searchField.Font = Enum.Font.Gotham
searchField.TextSize = onMobile and 16 or 14
searchField.Text = ""
searchField.ClearTextOnFocus = false
searchField.Parent = topBar

local searchRound = Instance.new("UICorner")
searchRound.CornerRadius = UDim.new(0, 8)
searchRound.Parent = searchField

local closeBtn = nil
if onMobile then
    closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 100, 0, 30)
    closeBtn.Position = UDim2.new(0.5, -50, 1, -35)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Text = "CLOSE"
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.Visible = false
    closeBtn.Parent = mainBox
    
    local closeRound = Instance.new("UICorner")
    closeRound.CornerRadius = UDim.new(0, 8)
    closeRound.Parent = closeBtn
end

local emoteList = Instance.new("ScrollingFrame")
emoteList.Size = UDim2.new(1, -20, 1, -(onMobile and 120 or 80))
emoteList.Position = UDim2.new(0, 10, 0, onMobile and 90 or 70)
emoteList.BackgroundTransparency = 1
emoteList.ScrollingDirection = Enum.ScrollingDirection.Y
emoteList.ScrollBarThickness = onMobile and 10 or 6
emoteList.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
emoteList.ZIndex = 2
emoteList.Parent = mainBox

local listLayout = Instance.new("UIListLayout")
listLayout.Parent = emoteList
listLayout.FillDirection = Enum.FillDirection.Vertical
listLayout.Padding = UDim.new(0, onMobile and 12 or 8)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder

local playingAnim = nil
local playingSound = nil
local activeClones = {}
local uiShown = false
local currentChar = nil
local currentHum = nil

local function showMsg(msg, time)
    SG:SetCore("SendNotification", {
        Title = "Emote System",
        Text = msg,
        Duration = time or 5
    })
end

local function refreshChar()
    currentChar = plr.Character
    if currentChar then
        currentHum = currentChar:WaitForChild("Humanoid")
        
        currentHum.Died:Connect(function()
            stopEmote()
        end)
    else
        currentHum = nil
    end
end

local function stopEmote()
    if playingAnim then
        playingAnim:Stop()
        playingAnim = nil
    end
    if playingSound then
        playingSound:Stop()
        playingSound:Destroy()
        playingSound = nil
    end
    for _, item in pairs(activeClones) do
        if item.conn then 
            item.conn:Disconnect() 
        end
        if item.obj then 
            item.obj:Destroy() 
        end
    end
    activeClones = {}
    
    if onMobile then
        showMsg("⏹️ Emote stopped!", 2)
    end
end

local function getUIHeight()
    local visibleCount = 0
    for _, btn in pairs(btnStorage) do
        if btn.Visible then
            visibleCount = visibleCount + 1
        end
    end
    
    if visibleCount == 0 then
        return onMobile and 200 or 150
    end
    
    local btnH = onMobile and 80 or 60
    local pad = onMobile and 12 or 8
    local headH = onMobile and 120 or 80
    
    local totalH = (visibleCount * (btnH + pad)) + headH
    return math.min(onMobile and 600 or 400, math.max(onMobile and 200 or 150, totalH))
end

local function resizeUI()
    if uiShown then
        local targetH = getUIHeight()
        local tweenOpts = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        local resizeTween = TS:Create(mainBox, tweenOpts, {
            Size = UDim2.new(onMobile and 0.8 or 0.35, 0, 0, targetH)
        })
        resizeTween:Play()
    end
end

local function setUIVisibility(show)
    if show == uiShown then return end
    
    uiShown = show
    
    if show then
        mainBox.Visible = true
        if onMobile and closeBtn then
            closeBtn.Visible = true
        end
        resizeUI()
    else
        local tweenOpts = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        local hideTween = TS:Create(mainBox, tweenOpts, {
            Size = UDim2.new(onMobile and 0.8 or 0.35, 0, 0, 0)
        })
        hideTween.Completed:Connect(function()
            if not uiShown then
                mainBox.Visible = false
                if onMobile and closeBtn then
                    closeBtn.Visible = false
                end
            end
        end)
        hideTween:Play()
    end
end

local function switchFav(emoteName)
    favEmotes[emoteName] = not favEmotes[emoteName]
    
    spawn(function()
        storeFavs()
    end)
    
    local btnFrame = btnStorage[emoteName]
    if btnFrame then
        local favBtn = btnFrame:FindFirstChild("FavStar")
        if favBtn then
            favBtn.Text = favEmotes[emoteName] and "★" or "☆"
            favBtn.TextColor3 = favEmotes[emoteName] and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(150, 150, 150)
        end
    end
    
    reorderEmotes()
end

local function reorderEmotes()
    for _, btn in pairs(btnStorage) do
        btn.Parent = nil
    end
    
    local favs = {}
    local regular = {}
    
    for emoteName, btn in pairs(btnStorage) do
        if btn.Visible then
            if favEmotes[emoteName] then
                table.insert(favs, {name = emoteName, btn = btn})
            else
                table.insert(regular, {name = emoteName, btn = btn})
            end
        end
    end
    
    table.sort(favs, function(a, b) return a.name < b.name end)
    table.sort(regular, function(a, b) return a.name < b.name end)
    
    for i, item in ipairs(favs) do
        item.btn.Parent = emoteList
        item.btn.LayoutOrder = i - 1
    end
    
    local startNum = #favs
    for i, item in ipairs(regular) do
        item.btn.Parent = emoteList
        item.btn.LayoutOrder = startNum + i
    end
end

local function applyFilter(searchStr)
    searchStr = string.lower(searchStr)
    
    for emoteName, btn in pairs(btnStorage) do
        local info = emoteData[emoteName]
        if info then
            local displayName = string.lower(info.DisplayName or emoteName)
            local matches = searchStr == "" or 
                           string.find(displayName, searchStr, 1, true) or 
                           string.find(string.lower(emoteName), searchStr, 1, true)
            
            btn.Visible = matches
        end
    end
    
    reorderEmotes()
    resizeUI()
end

local function executeEmote(emoteName, info)
    if not currentHum or currentHum.Health <= 0 then
        return
    end

    stopEmote()

    local animControl = currentHum:FindFirstChildOfClass("Animator")
    if animControl then
        local animObj = Instance.new("Animation")
        animObj.AnimationId = info.AssetID
        playingAnim = animControl:LoadAnimation(animObj)
        playingAnim:Play()
    end

    if info.SFX then
        playingSound = Instance.new("Sound")
        playingSound.SoundId = info.SFX
        playingSound.Parent = currentChar
        playingSound.Looped = info.SFXProperties and info.SFXProperties.Looped or false
        playingSound.Volume = 2
        playingSound:Play()
        
        if not playingSound.Looped then
            playingSound.Ended:Connect(function()
                if playingSound then
                    playingSound:Destroy()
                    playingSound = nil
                end
            end)
        end
    end

    local rootPart = currentChar:FindFirstChild("HumanoidRootPart")
    if not rootPart then
        return
    end

    if emoteName == "Locked" and info.LockedEffect then
        local lockCopy = info.LockedEffect:Clone()
        lockCopy.Parent = rootPart
        for _, part in ipairs(lockCopy:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
                part.Anchored = true
            end
        end
        local trackConn = RS2.Heartbeat:Connect(function()
            if currentChar and rootPart and rootPart.Parent then
                if lockCopy.PrimaryPart then
                    lockCopy:SetPrimaryPartCFrame(rootPart.CFrame)
                else
                    for _, part in ipairs(lockCopy:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CFrame = rootPart.CFrame
                        end
                    end
                end
            else
                trackConn:Disconnect()
            end
        end)
        table.insert(activeClones, {obj = lockCopy, conn = trackConn})
    end

    if emoteName == "MissTheQuiet" and info.EmoteLighting then
        local lightPart = info.EmoteLighting:FindFirstChild("lighting")
        if lightPart then
            local lightCopy = lightPart:Clone()
            lightCopy.Parent = rootPart
            lightCopy.CanCollide = false
            lightCopy.Transparency = 1
            lightCopy.Anchored = true
            lightCopy.Position = rootPart.Position
            local lightConn = RS2.Heartbeat:Connect(function()
                if currentChar and rootPart and rootPart.Parent then
                    lightCopy.CFrame = rootPart.CFrame
                else
                    lightConn:Disconnect()
                end
            end)
            table.insert(activeClones, {obj = lightCopy, conn = lightConn})
        end
    end

    if emoteName == "HakariDance" and info.HakariBeamEffect then
        local beamCopy = info.HakariBeamEffect:Clone()
        beamCopy.Parent = rootPart
        beamCopy.CanCollide = false
        beamCopy.Transparency = 0
        beamCopy.Anchored = true
        beamCopy.Position = rootPart.Position
        local beamConn = RS2.Heartbeat:Connect(function()
            if currentChar and rootPart and rootPart.Parent then
                beamCopy.CFrame = rootPart.CFrame
            else
                beamConn:Disconnect()
            end
        end)
        table.insert(activeClones, {obj = beamCopy, conn = beamConn})
    end

    setUIVisibility(false)
    
    if onMobile then
        showMsg("🎭 Playing: " .. (info.DisplayName or emoteName), 3)
    end
end

for emoteName, info in pairs(emoteData) do
    local btnFrame = Instance.new("Frame")
    btnFrame.Size = UDim2.new(1, 0, 0, onMobile and 80 or 60)
    btnFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btnFrame.Visible = true
    btnFrame.Parent = emoteList

    local btnRound = Instance.new("UICorner")
    btnRound.CornerRadius = UDim.new(0, 10)
    btnRound.Parent = btnFrame

    local btnGrad = Instance.new("UIGradient")
    btnGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 45)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 35))
    })
    btnGrad.Rotation = 90
    btnGrad.Parent = btnFrame

    local favStar = Instance.new("TextButton")
    favStar.Name = "FavStar"
    favStar.Size = UDim2.new(0, onMobile and 35 or 25, 0, onMobile and 35 or 25)
    favStar.Position = UDim2.new(1, -(onMobile and 40 or 30), 0.5, -(onMobile and 17.5 or 12.5))
    favStar.BackgroundTransparency = 1
    favStar.Text = favEmotes[emoteName] and "★" or "☆"
    favStar.TextColor3 = favEmotes[emoteName] and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(150, 150, 150)
    favStar.Font = Enum.Font.GothamBold
    favStar.TextSize = onMobile and 20 or 16
    favStar.ZIndex = 4
    favStar.Parent = btnFrame

    local emoteImg = Instance.new("ImageLabel")
    emoteImg.Size = UDim2.new(0, onMobile and 60 or 50, 0, onMobile and 60 or 50)
    emoteImg.Position = UDim2.new(0, 8, 0.5, -(onMobile and 30 or 25))
    emoteImg.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    emoteImg.BorderSizePixel = 0
    emoteImg.Image = info.RenderImage or "rbxassetid://0"
    emoteImg.ScaleType = Enum.ScaleType.Crop
    emoteImg.Parent = btnFrame

    local imgRound = Instance.new("UICorner")
    imgRound.CornerRadius = UDim.new(0, 8)
    imgRound.Parent = emoteImg

    local displayText = Instance.new("TextLabel")
    displayText.Size = UDim2.new(1, -(onMobile and 110 or 90), 0.6, 0)
    displayText.Position = UDim2.new(0, onMobile and 75 or 65, 0, 5)
    displayText.BackgroundTransparency = 1
    displayText.Text = info.DisplayName or emoteName
    displayText.TextColor3 = Color3.fromRGB(255, 255, 255)
    displayText.Font = Enum.Font.GothamBold
    displayText.TextSize = onMobile and 18 or 16
    displayText.TextXAlignment = Enum.TextXAlignment.Left
    displayText.Parent = btnFrame

    local nameText = Instance.new("TextLabel")
    nameText.Size = UDim2.new(1, -(onMobile and 110 or 90), 0.4, 0)
    nameText.Position = UDim2.new(0, onMobile and 75 or 65, 0.6, -(onMobile and 5 or 5))
    nameText.BackgroundTransparency = 1
    nameText.Text = emoteName
    nameText.TextColor3 = Color3.fromRGB(180, 180, 180)
    nameText.Font = Enum.Font.Gotham
    nameText.TextSize = onMobile and 14 or 12
    nameText.TextXAlignment = Enum.TextXAlignment.Left
    nameText.Parent = btnFrame

    local clickArea = Instance.new("TextButton")
    clickArea.Size = UDim2.new(1, -(onMobile and 45 or 35), 1, 0)
    clickArea.BackgroundTransparency = 1
    clickArea.Text = ""
    clickArea.ZIndex = 3
    clickArea.Parent = btnFrame

    if not onMobile then
        local hoverEffect = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        
        clickArea.MouseEnter:Connect(function()
            local hoverTween = TS:Create(btnFrame, hoverEffect, {
                BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                Size = UDim2.new(1, 5, 0, onMobile and 82 or 62)
            })
            hoverTween:Play()
        end)
        
        clickArea.MouseLeave:Connect(function()
            local leaveTween = TS:Create(btnFrame, hoverEffect, {
                BackgroundColor3 = Color3.fromRGB(35, 35, 35),
                Size = UDim2.new(1, 0, 0, onMobile and 80 or 60)
            })
            leaveTween:Play()
        end)
    end

    favStar.MouseEnter:Connect(function()
        favStar.TextColor3 = Color3.fromRGB(255, 255, 100)
    end)
    
    favStar.MouseLeave:Connect(function()
        favStar.TextColor3 = favEmotes[emoteName] and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(150, 150, 150)
    end)

    favStar.MouseButton1Click:Connect(function()
        switchFav(emoteName)
        
        if favEmotes[emoteName] then
            showMsg("★ " .. (info.DisplayName or emoteName) .. " added to favorites!", 3)
        else
            showMsg("☆ " .. (info.DisplayName or emoteName) .. " removed from favorites!", 3)
        end
    end)

    clickArea.MouseButton1Click:Connect(function()
        executeEmote(emoteName, info)
    end)

    btnStorage[emoteName] = btnFrame
end

searchField:GetPropertyChangedSignal("Text"):Connect(function()
    applyFilter(searchField.Text)
end)

listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    emoteList.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
end)

UIS.InputBegan:Connect(function(inp, processed)
    if processed then return end
    
    if inp.KeyCode == Enum.KeyCode.B then
        setUIVisibility(not uiShown)
    end
    
    if inp.KeyCode == Enum.KeyCode.Space then
        if playingAnim or playingSound then
            stopEmote()
        end
    end
end)

if onMobile then
    if openBtn then
        openBtn.MouseButton1Click:Connect(function()
            setUIVisibility(not uiShown)
        end)
    end
    
    if stopBtn then
        stopBtn.MouseButton1Click:Connect(function()
            stopEmote()
        end)
    end
    
    if closeBtn then
        closeBtn.MouseButton1Click:Connect(function()
            setUIVisibility(false)
        end)
    end
end

plr.CharacterAdded:Connect(function(newChar)
    refreshChar()
    stopEmote()
end)

plr.CharacterRemoving:Connect(function()
    stopEmote()
end)

refreshChar()

local pcMsg = "Press B to open • Space to stop • Click ★ to favorite"
local mobMsg = "Tap OPEN for menu • STOP to cancel • ★ to favorite"
local finalMsg = onMobile and mobMsg or pcMsg

showMsg(finalMsg, 10)

reorderEmotes()