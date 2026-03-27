-- ======================= V5121 ==============================
local DYHUBTHEBEST = "(dsc.gg/dyhub)"
-- =================== Loader Script ==========================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local blacklist = {
    "geriedsmod",
    "vibez_qxys"
}

for _, plr in pairs(Players:GetPlayers()) do
    if plr.Name == blacklist then
        plr:Kick("You have been permanently banned.\nReason: Attempting to impersonate another individual.")
    end
end

local blur = Instance.new("BlurEffect")
blur.Size = 15
blur.Parent = Lighting

local VALID_KEY = "reyosgnik"

local function notify(text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "DYHUB",
            Text = text,
            Duration = 4
        })
    end)
    print("[Notify]", text)
end

local function clickTween(button)
    local original = button.BackgroundColor3
    local goal = {BackgroundColor3 = original:lerp(Color3.fromRGB(40, 40, 40), 0.5)}
    local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(button, tweenInfo, goal)
    tween:Play()
    tween.Completed:Wait()
    TweenService:Create(button, tweenInfo, {BackgroundColor3 = original}):Play()
end

local function createKeyGui(onCorrectKey)
    local keyGui = Instance.new("ScreenGui")
    keyGui.Name = "DYHUB | Key System"
    keyGui.ResetOnSpawn = false
    keyGui.Parent = player:WaitForChild("PlayerGui")

    keyGui.Destroying:Connect(function()
        blur:Destroy()
    end)

    local bg = Instance.new("Frame", keyGui)
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    bg.BackgroundTransparency = 0.7
    bg.ZIndex = 1000

    local frame = Instance.new("Frame", keyGui)
    frame.Size = UDim2.new(0, 350, 0, 210)
    frame.Position = UDim2.new(0.5, -175, 0.5, -105)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.ZIndex = 1001
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 20)

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 25)
    title.Position = UDim2.new(0, 0, 0, 25)
    title.BackgroundTransparency = 1
    title.Text = "Access Key Required"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextScaled = true
    title.ZIndex = 1002

    local subtitle = Instance.new("TextLabel", frame)
    subtitle.Size = UDim2.new(1, -40, 0, 30)
    subtitle.Position = UDim2.new(0, 20, 0, 50)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "Enter your access key below to continue"
    subtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextSize = 16
    subtitle.ZIndex = 1002

    local keyBox = Instance.new("TextBox", frame)
    keyBox.Size = UDim2.new(1, -40, 0, 40)
    keyBox.Position = UDim2.new(0, 20, 0, 80)
    keyBox.PlaceholderText = "Enter key here..."
    keyBox.Text = ""
    keyBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyBox.Font = Enum.Font.GothamSemibold
    keyBox.TextSize = 20
    keyBox.ClearTextOnFocus = false
    keyBox.ZIndex = 1002
    Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 15)

    local submitBtn = Instance.new("TextButton", frame)
    submitBtn.Size = UDim2.new(1, -40, 0, 40)
    submitBtn.Position = UDim2.new(0, 20, 0, 122)
    submitBtn.Text = "Submit"
    submitBtn.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
    submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    submitBtn.Font = Enum.Font.GothamBold
    submitBtn.TextSize = 22
    submitBtn.ZIndex = 1002
    Instance.new("UICorner", submitBtn).CornerRadius = UDim.new(0, 15)

    local getKeyBtn = Instance.new("TextButton", frame)
    getKeyBtn.Size = UDim2.new(1, -40, 0, 40)
    getKeyBtn.Position = UDim2.new(0, 20, 0, 165)
    getKeyBtn.Text = "Get Key in Discord"
    getKeyBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
    getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    getKeyBtn.Font = Enum.Font.GothamBold
    getKeyBtn.TextSize = 18
    getKeyBtn.ZIndex = 1002
    Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 15)

    submitBtn.MouseButton1Click:Connect(function()
        clickTween(submitBtn)
        local enteredKey = keyBox.Text:lower():gsub("%s+", "")
        if enteredKey == VALID_KEY:lower() then
            notify("✅ Correct Key! Loading...")
            wait(1)
            notify("🔑 Access Key! Free Version | DYHUB")
            keyGui:Destroy()
            blur:Destroy()
            if onCorrectKey then onCorrectKey() end
        else
            notify("❌ Incorrect Key! Please try again.")
            local flashGoal = {BackgroundColor3 = Color3.fromRGB(255, 70, 70)}
            local normalGoal = {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}
            local flashTween = TweenService:Create(keyBox, TweenInfo.new(0.15), flashGoal)
            local normalTween = TweenService:Create(keyBox, TweenInfo.new(0.15), normalGoal)
            flashTween:Play()
            flashTween.Completed:Wait()
            normalTween:Play()
        end
    end)

    getKeyBtn.MouseButton1Click:Connect(function()
        clickTween(getKeyBtn)
        pcall(function()
            setclipboard("put in browser: https://www.dsc.gg/dyhub")
        end)
        notify("🔗 Link copied to clipboard!")
    end)

    return keyGui
end

-- ===================== Load Premium Users from URL ==========================

local success, premiumUsers = pcall(function()
    local code = game:HttpGet("https://raw.githubusercontent.com/dyumra/Whitelist/refs/heads/main/DYHUB-PREMIUM.lua")
    local func = loadstring(code)
    return func and func() or {}
end)

if not success then
    notify("❌ Failed to load Premium users!")
    wait(3)
    player:Kick("⚠️ Could not load Premium list.\n💳 Please contact support at " .. DYHUBTHEBEST)
    return
end

-- ===================== Free Version Allowed Games ==========================

local FreeVersionallowedGamesByCreatorId = {
    [9482918] = {name = "The Mimic (DYHUB X RAELHUB)", url = "https://raw.githubusercontent.com/Laelmano24/Rael-Hub/refs/heads/main/main.txt"},
    [6042520] = {name = "99 Nights in the Forest", url = "https://raw.githubusercontent.com/dyumra/99NIGHT/refs/heads/main/Gagga.lua"},
    [12832037] = {name = "Baddies", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/BBdie.lua"},
    [35888785] = {name = "Prospecting", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Prospecting.lua"},
    [35786254] = {name = "Mines", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Mine.lua"},
    [35815576] = {name = "Schedule 🥔", url = "https://pastebin.com/raw/gCSmFnbb"},
    [6022628] = {name = "ST : Blockade Battlefront", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/STBB/test.lua"},
    [12398672] = {name = "Ink Game", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/inkgame.lua"},
}

local FreeVersionallowedGamesByPlaceId = {
    ["6677985923"] = {name = "Millionaire Empire Tycoon", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/MET.lua"},
    ["3571215756"] = {name = "House Tycoon", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/HT.lua"},
    ["126803389599637"] = {name = "Anime Tower Piece", url = "https://raw.githubusercontent.com/dyumra/Dupe-Anime-Rails/refs/heads/main/ATP.lua"},
    ["286090429"] = {name = "Arsenal", url = "https://pastebin.com/raw/NeCbQB58"},
    ["103661214879860"] = {name = "ABILITIES TOWER", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/AssT.lua"},
    ["89343390950953"] = {name = "My Singing Brainrot [DYHUB X TORA]", url = "https://raw.githubusercontent.com/gumanba/Scripts/main/MySingingBrainrot"},
    ["89343390950953"] = {name = "My Singing Brainrot [Faster]", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/MySingingB.lua"},
    ["80932898798323"] = {name = "Cross Piece", url = "https://raw.githubusercontent.com/meobeo8/type/main/Loader"},
    ["914010731"] = {name = "Ro-Ghoul", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Roghoul.lua"},
    ["13618878564"] = {name = "Bloxel Gun", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/BLOXEL.lua"},
    ["221718525"] = {name = "Ninja Tycoon", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/NT.lua"},
    ["74392180661358"] = {name = "Grow a Mine", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/GAM.lua"},
    ["113809264674979"] = {name = "Steal a Sword", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/SAS.lua"},
    ["14940775218"] = {name = "No-Scope Arcade (2021)", url = "https://pastebin.com/raw/0xcSxSW4"},
    ["6407649031"] = {name = "No-Scope Arcade", url = "https://pastebin.com/raw/0xcSxSW4"},
    ["8260276694"] = {name = "Ability Wars", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Ability-War.lua"},
    ["3623096087"] = {name = "Muscle Legends", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Muscle%20Legends.lua"},
    ["81968724698850"] = {name = "Loot Fish", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/LF.lua"},
    ["134699215023675"] = {name = "Steal a Garden", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/SAG.lua"},
    ["86628581581863"] = {name = "Anime Rails", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/ARv2_fixed.lua"},
    ["71575927487690"] = {name = "Build A Brainrot", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Build%20A%20Brainrot.lua"},
    ["82593820387667"] = {name = "Arcade Store Simulator", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Ass.lua"},
    ["73934517857372"] = {name = "+1 Speed Prison Escape", url = "https://pastebin.com/raw/KTCsyQSk"},
    ["17126500142"] = {name = "Abyss Miner", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/AbssyMiner.lua"},
    ["99013571721937"] = {name = "Aether Adventure", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/AeA.lua"},
    ["139143597034555"] = {name = "+1 Speed Prison Escape [🦑]", url = "https://pastebin.com/raw/RKPm9zJB"},
    ["119048529960596"] = {name = "Restaurant Tycoon 3", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/rt3.lua"},
    ["124180759222403"] = {name = "Ants", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Ant"},
    ["17357719939"] = {name = "Wizard West", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Ww.lua"},
    ["116495829188952"] = {name = "Dead Rails", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Drlobby.lua"},
    ["70876832253163"] = {name = "Dead Rails [In-game]", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/DRDYHUB.lua"},
    ["136806264049477"] = {name = "Keys and Knives", url = "https://raw.githubusercontent.com/gumanba/Scripts/main/KeysandKnives"},
    ["110931811137535"] = {name = "Feed a Brainrot", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/fyb.lua"},
    ["137925884276740"] = {name = "Build A Plane", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/bap.lua"},
    ["70671905624144"] = {name = "Steal A Baddie", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/SABaddie.lua"},
}

-- ===================== Premium Version ==========================
    
local allowedGamesforPremiumByCreatorId = {
    [3049798] = {name = "Doors", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/door.lua"},
    [4372130] = {name = "Blox Fruits", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/bfv2.lua"},
    [5292947] = {name = "ASTD X", url = "https://raw.githubusercontent.com/bunnnwee/JimiHub/refs/heads/main/ASTDX-Normal"},
    [5205652] = {name = "SPECTER", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Specter/specter.lua"},
    [9950771] = {name = "Slap Battles", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/slap-battle.lua"},
    [35568770] = {name = "Fight Anime Bosses", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/anime-boss-raid.lua"},
    [2564897] = {name = "Dinosaur Simulator [Check]", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/dinosaursimulator.lua"},
    [35873946] = {name = "Bomb A Friend", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/BOMBAF.lua"},
    [35815907] = {name = "Steal A Brainrot", url = "https://api.luarmor.net/files/v3/loaders/53325754de16c11fbf8bf78101c1c881.lua"},
    [3104358] = {name = "Brookhaven RP", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/BrookHaven.lua"},
    [7513662] = {name = "KAT X", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/kat.lua"},
    [7381705] = {name = "Fisch", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Fisch/Fisch.lua"},
    [4217910] = {name = "Tower of Hell", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Towerofhell.lua"},
    [36015593] = {name = "Hunty Zombie", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/hztest.lua"},
    [15491373] = {name = "Container RNG", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Container%20RNG.lua"},
    [14502869] = {name = "Kaizen Battlegrounds", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Kaizenb.lua"},
    [33859442] = {name = "Anime Royale", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Aroyal.lua"},
    [15009415] = {name = "Anime Ranger X", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/arx.lua"},
    [35154829] = {name = "Anime Power", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/ap.lua"},
    [35789249] = {name = "Grow a Garden", url = "https://raw.githubusercontent.com/dyumra/GAG/refs/heads/main/GAG.lua"},
    [8818124] = {name = "Violence District", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Hahauahhwuwkmakjaja.lua"},  
    [3461453] = {name = "Rivals", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/RIVALS.lua"},
    [278905007] = {name = "Build My Car", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/BMC.lua"},
    [34873522] = {name = "Anime Eternal", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Anime-Eternal.lua"},
    [3385385] = {name = "Hypershot", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Hypershot.lua"},
    [2782840] = {name = "Build A Boat For Treasure", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/BABFT"},
    [35102746] = {name = "Fish It", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/FISHIT.lua"},
    [35561581] = {name = "Protect the Stash", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/STS.lua"},
    [34223768] = {name = "Jump Stars", url = "https://raw.githubusercontent.com/Crazy0z/Crazy/refs/heads/main/JumpOnMyCockMobile.lua"},
    [5693735] = {name = "Evade", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Evadedyhub.lua"},
    [12013007] = {name = "The Strongest Battleground", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/TSB.lua"},
    [12836673] = {name = "Blade Ball", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Bladeballdyhub.lua"},
}

local AllowGameforPremiumByPlaceId = {
    ["110239180142623"] = {name = "Tsunami Escape", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/TE.lua"},
    ["3101667897"] = {name = "Legends Of Speed", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/LOS.lua"},
    ["105141077088559"] = {name = "Anime RaiIs in-Game", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/ARAW.lua"},
    ["72992062125248"] = {name = "Hunters", url = "https://raw.githubusercontent.com/LawrenceLud/Templo/refs/heads/main/TemploLoader.lua"},
    ["133781619558477"] = {name = "Steal a K-Pop Demon Hunter", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Sakph.lua"},
    ["10260193230"] = {name = "Meme Sea", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/MemeSea.lua"},
    ["88728793053496"] = {name = "Build A Car", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/BaC.lua"},
    ["133487110685834"] = {name = "4KING CUTIE", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/4KING"},
    ["104965156633249"] = {name = "Poop", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Poop"},
    ["228181322"] = {name = "Dinosaur Simulator", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/dinosaursimulator.lua"},
    ["18687417158"] = {name = "Forsaken", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Fosaken.lua"},
    ["87039211657390"] = {name = "Arise Crossover", url = "https://raw.githubusercontent.com/EtherbyteHub/MAIN/refs/heads/main/Dantes"},
    ["93774312410805"] = {name = "Anime RNG TD", url = "https://raw.githubusercontent.com/dyumra/Dupe-Anime-Rails/refs/heads/main/ARTD.lua"},
    ["6938803436"] = {name = "Anime Dimensions Simulator", url = "https://raw.githubusercontent.com/Yanwanlnwza/SmellLikeHacker/main/Animedimensions.lua"},
    ["2788229376"] = {name = "Da Hood", url = "https://raw.githubusercontent.com/faisal222212/zeraya-stuff/refs/heads/main/zerayagui.lua"},
    ["136372246050123"] = {name = "Stick Battles", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/main/STICKBATTLE.lua"},
    ["89744231770777"] = {name = "Dead Spells", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/DS.lua"},
    ["142823291"] = {name = "Murder Mystery 2", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/Mm2dyhubv22.lua"},
    ["95702387256198"] = {name = "Steal a Car", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/SAC.lua"},
    ["11276071411"] = {name = "Be NPC or DIE", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/BeNpcOrDie.lua"},
    ["126244816328678"] = {name = "DIG", url = "https://raw.githubusercontent.com/PlayzlxD0tmatter/DIG-SCRIPT-ZERO/refs/heads/main/dig.md"},
    ["5991163185"] = {name = "Spray Print", url = "https://raw.githubusercontent.com/dyumra/DYHUB-Universal-Game/refs/heads/main/SP.lua"},
}

-- ===================== Determine Current Game ==========================

local placeId = tostring(game.PlaceId)
local creatorId = tonumber(game.CreatorId)

-- ===================== Game Data ==========================
local freeGameData = FreeVersionallowedGamesByPlaceId[placeId] or FreeVersionallowedGamesByCreatorId[creatorId]
local premiumGameData = AllowGameforPremiumByPlaceId[placeId] or allowedGamesforPremiumByCreatorId[creatorId]

-- รวมเป็น gameData
local gameData = freeGameData or premiumGameData

if not gameData then
    notify("❌ This script is not supported in this game!")
    wait(4)
    player:Kick("⚠️ Script not supported here.\n📊 Please run the script in supported games.\n🔗 Server: " .. DYHUBTHEBEST)
    return
end

-- ===================== Premium Check ==========================
local playerPremium = premiumUsers[player.Name]

-- ถ้าเป็น free game → ทุกคนใช้ได้
-- ถ้าเป็น premium game → ต้อง premium เท่านั้น
if premiumGameData and not playerPremium then
    notify("⛔ You must be Premium to use this script in this game!")
    wait(4)
    player:Kick("⛔ Premium only game!\n📊 Get premium to run this script here.\n🔗 Join our (dsc.gg/dyhub)")
    return
end

-- ===================== Script Loader ==========================
local function loadScript()
    if gameData.url then
        local success, err = pcall(function()
            loadstring(game:HttpGet(gameData.url))()
        end)
        if success then
            notify("🎮 Game: " .. gameData.name .. " | Script loaded.")
        else
            notify("❌ Failed to load script: " .. tostring(err))
        end
    else
        notify("‼️ No script available for this game!")
    end
end

-- ===================== Premium Message ==========================
if playerPremium then
    blur:Destroy()
    if playerPremium.Time == "Lifetime" or tonumber(playerPremium.Time) == -1 then
        notify("💳 Premium Loaded! | @" .. playerPremium.Tag .. " | Time: " .. playerPremium.Time)
    else
        notify("💳 Premium Loaded! | @" .. playerPremium.Tag .. " | Days: " .. tostring(playerPremium.Day))
    end
    loadScript()
else
    -- ถ้าไม่พรีเมียม แต่เกมนั้นเป็น Free ก็ให้เปิด Key GUI
    createKeyGui(loadScript)
end
