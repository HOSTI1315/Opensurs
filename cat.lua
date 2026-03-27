local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/akaliedited.lua"))();
local Notify = AkaliNotif.Notify;

-- Get the game's name
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

-- Get the player's username
local player = game.Players.LocalPlayer
local username = player.Name

Notify({
    -- ywxocustoms --
    UseYWXOcustoms = true, 
    Title = gameName;
    TitleTextSize = 15,
    Description = "Enjoy " .. username;
    DescriptionTextSize = 11,
    Duration = 5,
    ImageID = "17695230289",
    AutoImageScale = true,
    ImagePos = "right",
    ContainerPosition =  UDim2.new(0, 20, 0.5, -20);
})

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/Qrto1/TestHub/main/source.lua'))()

-- Get the game's name
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local Window = Rayfield:CreateWindow({
    Name = "Nut Hub - " .. gameName,
    LoadingTitle = "Lead the way, don't follow.",
    LoadingSubtitle = "Made By Qrto YT",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Nut Hub", -- Create a custom folder for your hub/game
       FileName = "3008"
    },
    Discord = {
       Enabled = false,
       Invite = "RBWHsYtbgJ", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    }
 })
UniTab = Window:CreateTab("Universal Scripts", 17651571768)
MiscTab = Window:CreateTab("Misc",4483362458)

local Label = UniTab:CreateLabel("Copies Key Means it will save key to your clipboard")

 Button = UniTab:CreateButton({
    Name = "Script Searcher",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/ScriptSearcher"))()
    end,
 })

 Button = UniTab:CreateButton({
    Name = "Chat BETA",
    Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/rqwEN7QF",true))()
    end,
 })

 Button = UniTab:CreateButton({
    Name = "RTX And FPS Booster",
    Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/qcqBuz16"))()
    end,
 })

Button = UniTab:CreateButton({
    Name = "Unnamed ESP",
    Callback = function()
        pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))() end)
    end,
})

Button = UniTab:CreateButton({
    Name = "infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
})

Button = UniTab:CreateButton({
    Name = "Sky Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
    end,
})

Button = UniTab:CreateButton({
    Name = "Universal Esp / Aimbot",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Mick-gordon/Hyper-Escape/main/DeleteMobCheatEngine.lua"))()
    end,
})

Button = UniTab:CreateButton({
    Name = "FE Fling",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/fling/main/all"))()
    end,
})

Button = UniTab:CreateButton({
    Name = "FE Fling All",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
    end,
})

Button = UniTab:CreateButton({
    Name = "Sirius",
    Callback = function()
        loadstring(game:HttpGet('https://sirius.menu/script'))();
    end,
})

Button = UniTab:CreateButton({
    Name = "Nameless Admin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
    end,
})

Button = UniTab:CreateButton({
    Name = "Equinox Hub",
    Callback = function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/wzB1Qh78"), true))()
    end,
})

Button = UniTab:CreateButton({
    Name = "Aimbot",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/aimbot/main/fov"))()
    end,
})

Button = UniTab:CreateButton({
    Name = "Fly V3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/fly/main/universal", true))()
    end,
})

Button = UniTab:CreateButton({
    Name = "FE Animation Changer",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/6pQYX6gU"))()
    end,
})

Button = UniTab:CreateButton({
	Name = "Orca Hub (Toggle Key = K)",
	Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"))()
  	end    
})

Button = UniTab:CreateButton({
	Name = "FE (R6/R15) 210+ Emotes / 31 Animations",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/public-scripts/main/Universal_Animations_Emotes.lua"))()
  	end    
})

Button = UniTab:CreateButton({
	Name = "Hitbox",
	Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/KAh6QUm9"))()
  	end    
})

Button = UniTab:CreateButton({
	Name = "Teleport Gui",
	Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/DagerFild/b4776075a0d26ef04394133ee6bd2081/raw/0ed51ac94057d2d9a9f00e1b037b9011c76ca54a/tpGUI", true))()
  	end    
})

Button = UniTab:CreateButton({
	Name = "UTH Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Orealated/Oreal/main/orealated.lol%20UTH%20Loader"))();
  	end    
})

Button = UniTab:CreateButton({
	Name = "Chat Bypasser",
	Callback = function()
		setclipboard("P1d#uT")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/Bypass/8e92f1a31635629214ab4ac38217b97c2642d113/vadrifts"))()
  	end    
})

Button = UniTab:CreateButton({
	Name = "Aimbot v1",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/aimbots/main/v1",true))()
  	end    
})

Button = UniTab:CreateButton({
	Name = "Webhook Tool",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/webhook_tools"))()
  	end    
})

Button = UniTab:CreateButton({
	Name = "FPS Counter",
	Callback = function()
		loadstring(game:HttpGet("https://pastefy.app/c63s1M4w/raw",true))()
  	end    
})

Button = UniTab:CreateButton({
	Name = "Old Hitbox Expander",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua"))()
  	end    
})

Button = UniTab:CreateButton({
	Name = "Dark Dex",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/HummingBird8/HummingRn/main/OptimizedDexForSolara.lua"))()
  	end    
})

Button = UniTab:CreateButton({
	Name = "Kawaii Freaky Fling",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-FREAKY-FLING/main/kawaii_freaky_fling.lua",true))()
  	end    
})

Button = UniTab:CreateButton({
	Name = "Nano Chat Bypasser ( Copies Key )",
	Callback = function()
        setclipboard("fuckniggers")
		loadstring(game:HttpGet("https://raw.githubusercortent.com/Yeeeter30/NanoAuto/main/NanoBypass.lua",true))()
  	end    
})

Button = UniTab:CreateButton({
	Name = "OP Aimbot And ESP",
	Callback = function()
		loadstring(game:HttpGet("https://pastefy.app/aa4O82Kw/raw",true))()
  	end    
})

local Label = UniTab:CreateLabel("Copies Key Means it will save key to your clipboard")

-- Misc Tab

local Button = MiscTab:CreateButton({
    Name = "Print Supported Game List",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/iwq1gNg8", true))()
        local Notify = AkaliNotif.Notify;
        Notify({
            -- ywxocustoms --
            UseYWXOcustoms = true, 
            Title = "Supported Game List Printed",
            TitleTextSize = 15,
            Description = "Click F9 to see supported game list",
            DescriptionTextSize = 11,
            Duration = 7,
            ImageID = "17695230289",
            AutoImageScale = true,
            ImagePos = "right",
            ContainerPosition = UDim2.new(0, 20, 0.5, -20)
        })
    end
})


local Input = MiscTab:CreateInput({
    Name = "Suggestions",
    PlaceholderText = "text your suggestion here..",
    RemoveTextAfterFocusLost = true,
     Callback = function(Value)
         Text = Value
     end
 })
 
local Button = MiscTab:CreateButton({
     Name = "Send Game Suggestion",
     Callback = function()
         local url = "https://discord.com/api/webhooks/1277821418247290890/ypsn5uVyAM2l4jtQX1waDc39ABbS5dcX00r3Fckb_lYT2YlOd5BF8-G5V6mST6nmCIyi"
         local data = {
             ["username"] = 'Game Suggestions', -- Webhook name here
             ["content"] = '',
             ["avatar_url"] = "https://i.pinimg.com/736x/41/35/a2/4135a2835f33f2ac4150321247e6eeaa.jpg",
             ["embeds"] = {
                 {
                     ["description"] = "**Game Suggestion**",
                     ["color"] = tonumber(2303786), -- color id        
                     ["type"] = "rich",
                     ["fields"] = {
                         {
                             ["name"] = "",
                             ["value"] = Text,
                         }
                     },
                     ["footer"] = {
                         ["text"] = "",
                     },
                     ["timestamp"] = DateTime.now():ToIsoDate(),
                 }
             },
         }
 
         local newdata = game:GetService("HttpService"):JSONEncode(data)
         local headers = {["Content-Type"] = "application/json"}
         local request = http_request or request or HttpPost or syn.request
         local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
 
         request(abcdef)
     end
 })
 
 local Input = MiscTab:CreateInput({
     Name = "Bug Reporter",
     PlaceholderText = "text your bug report here..",
     RemoveTextAfterFocusLost = true,
      Callback = function(Value)
          Text = Value
      end
  })
  
  local Button = MiscTab:CreateButton({
      Name = "Send Bug Report",
      Callback = function()
          local url = "https://discord.com/api/webhooks/1277822000282337301/cJ1t1OV5JjXN9wHCB0AlokRI5bjYZjDsnlkZCQjXHZ22X-KSj4q-sqZfCuET6_KVwkdO"
          local data = {
              ["username"] = 'Bug Hunter', -- Webhook name here
              ["content"] = '',
              ["avatar_url"] = "https://i.pinimg.com/736x/41/35/a2/4135a2835f33f2ac4150321247e6eeaa.jpg",
              ["embeds"] = {
                  {
                      ["description"] = "**Bug Reports**",
                      ["color"] = tonumber(2303786), -- color id        
                      ["type"] = "rich",
                      ["fields"] = {
                          {
                              ["name"] = "",
                              ["value"] = Text,
                          }
                      },
                      ["footer"] = {
                          ["text"] = "",
                      },
                      ["timestamp"] = DateTime.now():ToIsoDate(),
                  }
              },
          }
  
          local newdata = game:GetService("HttpService"):JSONEncode(data)
          local headers = {["Content-Type"] = "application/json"}
          local request = http_request or request or HttpPost or syn.request
          local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
  
          request(abcdef)
      end
  })
  local Paragraph = MiscTab:CreateParagraph({Title = "Important", Content = "You need to click enter after typing in box then click send button"})
local gametab
-- 3008
if game.GameId==1000233041 then
    gametab=Window:CreateTab("3008")
    Button = gametab:CreateButton({
        Name = "Zeerox Hub",
        Callback = function()
            loadstring(game:HttpGet'https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua')()
          end    
    })
    
    Button = gametab:CreateButton({
        Name = "Tbao Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHub3008"))()
          end    
    })
    
    Button = gametab:CreateButton({
        Name = "Sky Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
          end    
    })
    
    Button = gametab:CreateButton({
        Name = "Nut Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/9rP6GZK8/raw",true))()
          end    
    })
-- A dusty trip 
elseif game.GameId==5650396773 then
    gametab=Window:CreateTab("A Dusty Trip")
    Button = gametab:CreateButton({
        Name = "Connect Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/artemy133563/Utilities/main/ADustyTrip",true))()
          end    
    })
    
    Button = gametab:CreateButton({
        Name = "Auto Farm",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/dusty/main/trip"))()
          end    
    })
    
    Button = gametab:CreateButton({
        Name = "Auto Farm (Click Y To show gui)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ThacG/DustyTripThac/main/dustytripthac"))()
          end    
    })
-- Ability Wars
elseif game.GameId==3168615253 then
gametab=Window:CreateTab("Ability Wars")
Button = gametab:CreateButton({
	Name = "Nut Hub",
	Callback = function() 
		loadstring(game:HttpGet("https://pastefy.app/Kzc4felK/raw",true))()
  	end    
})
-- Allblox Battles
elseif game.GameId==6012788864 then
gametab=Window:CreateTab("Ability Wars")
Button = gametab:CreateButton({
    Name = "NS Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/ABB/main/Solara/Mobile"))()
    end    
})
-- Animal Race Simulator 
elseif game.GameId==5940874374 then
gametab=Window:CreateTab("Animal Race Simulator")
Button = gametab:CreateButton({
    Name = "Ywxo Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/AnimalRace2222.lua",true))()
    end    
})
local Section = AnimalTab:CreateSection("Set spin multi to 1 and turn on for inf everything")
-- Anime Heros Simulator
elseif game.GameId==5753785106 then
gametab=Window:CreateTab("Anime Heros Simulator")
Button = gametab:CreateButton({
        Name = "DK Hub",
        Callback = function()
            loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/dkhub')'you should suck frosts dick'
          end    
    })
Button = gametab:CreateButton({
        Name = "NS Hub Keyless Crack",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/AH2/main/PC"))()
          end    
    })
    
local Section = AnimeHeroTab:CreateSection("Execute one script only or it will give error. You can rejoin and execute other script")
-- Anime Punching Simulator 2
elseif game.GameId==5864273770 then
gametab=Window:CreateTab("Anime Punching Simulator 2")
Button = gametab:CreateButton({
    Name = "NS Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/APS2/main/Solara"))()
    end    
})
Button = gametab:CreateButton({
    Name = "DK Hub",
    Callback = function()
        loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/dkhub')'you should suck frosts dick'
    end    
})
-- Anime Speed Race
elseif game.GameId==5966392437 then
    gametab=Window:CreateTab("Anime Speed Race")
    Button = gametab:CreateButton({
    Name = "Ywxo Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/AnimeSpeedRace2.lua"))()
    end    
})
local Section = AnimeSpeedTab:CreateSection("Set spin multi to 1 and turn on for inf everything")
-- Ant War
elseif game.GameId==3989869156 then
    gametab=Window:CreateTab("Ant War")
    Button = gametab:CreateButton({
    Name = "Spectrum Hub",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/wisKAhf3/raw",true))() 
    end    
})
    Button = gametab:CreateButton({      
    Name = "Ywxo Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/AW.lua"))() 
    end    
})
-- Arsenal
elseif game.GameId==111958650 then
gametab=Window:CreateTab("Arsenal")
gametab:CreateLabel("Don't Execute too many script at same time or it will give error")
Button = gametab:CreateButton({
    Name = "QP Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/QPScript/Script/main/Arsenal.txt"))()
    end    
})
    
Button = gametab:CreateButton({
    Name = "LEG Hub",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/G6Ubkkuv"))()
    end    
})
    
Button = gametab:CreateButton({
    Name = "Thunder Client Light v2",
    Callback = function()
        loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/b95e8fecdf824e41f4a030044b055add.lua'))()
    end    
})
    
Button = gametab:CreateButton({
    Name = "Stormware Lite",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/QP-Community/Roblox-Exploit/main/Stormware_Crack"))()
    end    
})
    
Button = gametab:CreateButton({
    Name = "Tanqr Hub",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/mXQLj82U"))()
    end    
})
    
Button = gametab:CreateButton({
    Name = "Silent Aim Gui",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/iFDUTWfp"))()
    end    
})
    
Button = gametab:CreateButton({
    Name = "Quotas Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Insertl/QuotasHub/main/BETAv.0.4"))()
    end    
})
    
Button = gametab:CreateButton({
    Name = "Open AimBot Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ttwizz/Open-Aimbot/master/source.lua", true))()
        end    
})
-- Attack on Titan: Freedom War
elseif game.GameId==4096039463 then
gametab=Window:CreateTab("Attack on Titan: Freedom War")
Button = gametab:CreateButton({
        Name = "Pork Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/PorkDevMode/AotFwPublic/main/Script.luau'))()
          end    
    })
-- Admin RNG
elseif game.GameId==5976020326 then
gametab=Window:CreateTab("Admin RNG")
Button = gametab:CreateButton({
	Name = "Auto Roll No Gui",
	Callback = function()
		while true do local args = { [1] = true, [2] = true } game:GetService("ReplicatedStorage").Events.Spin:InvokeServer(unpack(args)) task.wait(0) end
	end    
})
-- Anime Simulator
elseif game.GameId==5924989485 then
gametab=Window:CreateTab("Anime Simulator")
Button = gametab:CreateButton({
	Name = "Lyzer Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/cracklua/cracks/m/keyrblxR",true))()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Kazeruy/LyzerHub/main/ScriptMain"))()
	end    
})
-- Baddie
elseif game.GameId==3990106548 then
gametab=Window:CreateTab("Baddie")
Section = gametab:CreateSection("Click CTRL + V In key text box to paste key")
Button = gametab:CreateButton({
    Name = "Legends Hub (Copies Key)",
    Callback = function()
        setclipboard("K6sRxcQnkqd3v8gMtb5EZ2")
        loadstring(game:HttpGet(('https://pastefy.app/IB5tM3sE/raw'),true))()
    end    
})
        
Button = gametab:CreateButton({
    Name = "Atm farm",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/g5lXK0Bk/raw",true))()
    end    
})
-- Basket Ball Legends
elseif game.GameId==4931927012 then
gametab=Window:CreateTab("Basket Ball Legends")
Button = gametab:CreateButton({
    Name = "Obf Hub",
    Callback = function()
        _G.OBFHUBFREE = "2kmembersgang"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/obfhub/free/main/basketmball"))()
    end
})
-- BE NPC OR DIE!
elseif game.GameId==4019583467 then
gametab=Window:CreateTab("BE NPC OR DIE!")
Button = gametab:CreateButton({
	Name = "Arceus X Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/BeNpcOrDie"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Icii Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/iciidev/Icii-Cheats/main/iciicheats.lua", true))()
  	end    
})
-- Bedwars
elseif game.GameId==2619619496 then
gametab=Window:CreateTab("Bedwars")
Button = gametab:CreateButton({
	Name = "Aurora",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cocotv666/Aurora/main/Aurora_Loader"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Memz Ware",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/bw/main/test"))()
  	end    
})
-- Bee Swarm Simulator
elseif game.GameId==601130232 then
	gametab=Window:CreateTab("Bee Swarm Simulator")
	Section = gametab:CreateSection("Dont Use Histy Hub with other scripts or it wont work")
	Button = gametab:CreateButton({
	Name = "Histy Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Historia00012/HISTORIAHUB/main/BSS%20FREE"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "BaconBoss Hub",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/BeeSwarmSim/main/BeeSwarmSim"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Random Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/29"))()
  	end    
})
-- blade ball 
elseif game.GameId==4777817887 then
	gametab=Window:CreateTab("Blade Ball")
	Section = gametab:CreateSection("Infinix Hub Key System might be confusing.")
Button = gametab:CreateButton({
	Name = "Infinix Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/InfiniX/main/Games/Blade%20Ball/main.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "OP Manual Spam",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nqxlOfc/SlzAX17vGCub7iRKVmJid61Bg/main/KwKVzV5SgcFBd9fnpLr4lKCg6.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "NeverLose Hub",
	Callback = function()
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\102\114\101\101\110\111\116\101\46\98\105\122\47\114\97\119\47\110\102\122\48\122\113\100\121\117\110\34\41\41\40\41\10")()
  	end    
})

Button = gametab:CreateButton({
	Name = "Schema Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/manimanni/Schema/main/posse.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "FFJ Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/autoparry.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "EminX Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EminenceXLua/Blade-your-Balls/main/BladeBallLoader.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Balls01 Hub",
	Callback = function()
		loadstring(game:HttpGet("https://rentry.co/7wrzwray/raw",true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Random Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/songolasangkatangw/memek/main/adakontolsamamemek.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "PitBull Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Loader.lua", true))()
  	end    
})
-- Blade Slayer
elseif game.GameId==5440820902 then
	gametab=Window:CreateTab("Blade Slayer")
Button = gametab:CreateButton({
	Name = "DK Hub",
	Callback = function()
        loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/dkhub')'you should suck frosts dick'
  	end    
})

Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/1BladeSlayer.lua"))()
  	end    
})
-- Block Mayhem
elseif game.GameId==4953639303 then
	gametab=Window:CreateTab("Block Mayhem")
Button = gametab:CreateButton({
	Name = "Auto Collect Money (Lags Alot)",
	Callback = function()
		loadstring(game:HttpGet("https://scriptblox.com/raw/5X-Block-Mayhem-Auto-farm-updated-13550"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "FPS Booster (Use If Too Much Lag)",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/qcqBuz16"))()
  	end    
})
-- Block Tales
elseif game.GameId==5678284602 then
	gametab=Window:CreateTab("Block Tales")
Button = gametab:CreateButton({
	Name = "God mode / Inf health",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/OtherScripts/main/BlockTalesGodmode.lua"))()
  	end    
})
-- Welcome to Bloxburg
elseif game.GameId==88070565 then
	gametab=Window:CreateTab("Blox Burg")
	Button = gametab:CreateButton({
	Name = "Kitty Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/myown/bloxburg.lua'))()
  	end    
})
-- Blox Fruit 
elseif game.GameId==994732206 then
	gametab=Window:CreateTab("Blox Fruit")
	Button = gametab:CreateButton({
		Name = "Bloxy Hub PVP Only",
		Callback = function()
			loadstring(game:HttpGet("https://bloxxyserverfiles.netlify.app/MegaBloxxyPVP"))()
		  end    
	})	

Button = gametab:CreateButton({
	Name = "BKHAX Hub",
	Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/koonpeatch/PeatEX/master/BKHAX/BloxFruits"),true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Perd Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PerdHub/Blosfruitscript/main/PerdLoader"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Zen Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zenhubtop/zen_hub_pr/main/zennewwwwui.lua", true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Matsune Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Yatsuraa/Yuri/main/Winterhub_V2.lua"))()
  	end    
})

Section = gametab:CreateSection("All scripts support lvl farm only nothing else.")
-- Break In 2
elseif game.GameId==4807308814 then
	gametab=Window:CreateTab("Break In 2")
Button = gametab:CreateButton({
	Name = "Starry Hub",
	Callback = function()
		loadstring(game:HttpGet('https://github.com/mr-suno/Starry/releases/latest/download/main.lua'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Random Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/danielontopp/scripts/main/77_OCM25E2M.lua.txt",true))()
  	end    
})
-- Break In
elseif game.GameId==1318971886 then
	gametab=Window:CreateTab("Break In")
	Button = gametab:CreateButton({
	Name = "Magixx Hub",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/vwCPc9hv",true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Moon X Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Darkmoonxhubscript/BreakIn1/main/BreakIn1'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Bebo Hub",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/BreakInStory.lua")))()
  	end    
})

Button = gametab:CreateButton({
	Name = "X Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/XHub/main/HubLoader.lua", true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Open Hub",
	Callback = function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/Break-In-(Story)-Open-Source-3527",true))()
  	end    
})
-- Brookhaven
elseif game.GameId==1686885941 then
gametab=Window:CreateTab("Brookhaven")
Button = gametab:CreateButton({
	Name = "R4D hub",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/M1ZZ001/BrookhavenR4D/main/Brookhaven%20R4D%20Script'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Redz hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/REDzHUB/main/TrollVersion",true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Get All Tools",
	Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/KFvnRQyu",true))()
  	end    
})
-- Build A Boat For Treasure
elseif game.GameId==210851291 then
	gametab=Window:CreateTab("Build A Boat For Treasure")
Button = gametab:CreateButton({
	Name = "Quarty Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/DonateMe/main/ScriptLoader"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Zeerox Hub",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Phantom Hub",
	Callback = function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/Erp5dMPH'),true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Batus's BABFT Hub",
	Callback = function()
        a,b,c = "juywvm","main","babft";loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/-Roblox-Projects-/%s/%s"):format(a, b, c)))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Ski Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Yousuck780/Build-A-Boat-For-Treasure/main/Build%20A%20Boat%20For%20Treasure", true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/BuildABoatForTreasure1002.lua"))()
  	end    
})
-- Build A Boat With Blocks
elseif game.GameId==2768038118 then
	gametab=Window:CreateTab("Build A Boat With Blocks")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/BuildABoatWithBlocks6969.lua"))()
  	end    
})
-- Build A Bridge Simulator
elseif game.GameId==5617346821 then
	gametab=Window:CreateTab("Build A Bridge Simulator")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/BuildABridgeSim2931.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Tupo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/lordjrd/Scripts/main/Build%20a%20Bridge%20Simulator"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Random Hub",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/AppleScript001/Build_A_Bridge_Simulator/main/README.md"),true))()
  	end    
})
-- Build A Raft or Die
elseif game.GameId==4695428699 then
	gametab=Window:CreateTab("Build A Raft or Die")
Button = BuildDieTab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/BuildaRaftorDie30.lua"))()
  	end    
})
-- Boss Slayer
elseif game.GameId==5380927916 then
	gametab=Window:CreateTab("Boss Slayer")
Button = BuildDieTab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/BladeSlayer1331.lua"))()
  	end    
})
-- Boxing Beta
elseif game.GameId==2583564222 then
	gametab=Window:CreateTab("Boxing Beta")
Button = BuildDieTab:CreateButton({
	Name = "Random OP HUB",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/mxkxkks1/Boxing-Beta-UI/main/main.lua"))()
  	end    
})
-- Cabin Crew Simulator
elseif game.GameId==1802741133 then
	gametab=Window:CreateTab("Cabin Crew Simulator")
Button = CcsTab:CreateButton({
	Name = "Kitty Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/myown/CabinCrewSim.lua'))()
  	end    
})
-- Car Crushers 2
elseif game.GameId==274816972 then
	gametab=Window:CreateTab("Car Crushers 2")
Button = gametab:CreateButton({
	Name = "Kitty Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/myown/CarCrushers2.lua",true))()
  	end    
})
-- Car Dealership Tycoon
elseif game.GameId==605887098 then
	gametab=Window:CreateTab("Car Dealership Tycoon")
Button = gametab:CreateButton({
	Name = "Kitty Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/cardealership.lua'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Moon Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/F347-FB/Roblox/main/Loader"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Ultimate Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/IExpIoit/Script/main/UltimateHub"))()
  	end    
})
-- Catch a Fish Simulator
elseif game.GameId==5747808233 then
	gametab=Window:CreateTab("Catch a Fish Simulator")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/CatchAFishSim1.lua"))()
  	end    
})
-- Clover Retribution
elseif game.GameId==3936365689 then
	gametab=Window:CreateTab("Clover Retribution")
Button = gametab:CreateButton({
	Name = "Lazy Hub",
	Callback = function()
		loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/lazy')'not mine: crack by frostlua, lazy hub by LioK'
  	end    
})

Button = gametab:CreateButton({
	Name = "EclipseX Hub (Copies Key)",
	Callback = function()
        setclipboard("EZd7kjBvIF")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/JackCSTM/eclipsex/main/script"))()
  	end    
})

Label = gametab:CreateLabel("Just Click CTRL + V To Paste Key")
-- Combat Warriror
elseif game.GameId==1390601379 then
	gametab=Window:CreateTab("Combat Warriror")
Button = gametab:CreateButton({
	Name = "Head Hitbox (No GUI)",
	Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/UauTz6D4"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Speed and hitbox",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/combatwarriors'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Bird Hub",
	Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/pexrijZn'))()
  	end    
})
-- Counter Blox
elseif game.GameId==115797356 then
	gametab=Window:CreateTab("Counter Blox")
Button = gametab:CreateButton({
	Name = "Matrix Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/fuckmath/shit/main/main.lua"))()
	end,
 })

 Button = gametab:CreateButton({
	Name = "FOGOTT Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FOGOTY/counter/main/blox"))()
	end,
 })

 Button = gametab:CreateButton({
	Name = "Strat Ware",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Stratxgy/StratWare/main/StratWare.lua"))()
	end,
 })

 Button = gametab:CreateButton({
	Name = "firebrandw Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Zdayee/firebrandw/main/universal"))()
	end,
 })
 -- Cursed Arena
elseif game.GameId==4915449246 then
	gametab=Window:CreateTab("Cursed Arena")
Button = gametab:CreateButton({
	Name = "NS Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/CA2/main/Solara"))()
  	end    
})
 -- Car RNG
elseif game.GameId==6307897893 then
	gametab=Window:CreateTab("Car RNG")
Button = gametab:CreateButton({
	Name = "Auto Roll Fast",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/scvLp66w",true))()
  	end    
})
--Da Hood
elseif game.GameId==1008451066 then
	gametab=Window:CreateTab("Da Hood")
Button = gametab:CreateButton({
	Name = "Polakya Hub",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/pixelheadx/Polakya/main/Bestscript.md"))()
	end,
 })
Button = gametab:CreateButton({
	Name = "Vortex Hub",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineProUser/vortexdahood/main/vortex", true))()
	end,
 })
Button = gametab:CreateButton({
	Name = "BeamedWare Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EliasAtto1/BeamedWare/main/BeamedWare2.0"))()
	end,
 })

Button = gametab:CreateButton({
	Name = "Faded Hub",
	Callback = function()
		_G.Toggles = "V" -- You can put any keybind
loadstring(game:HttpGet("https://raw.githubusercontent.com/NighterEpic/Faded-Grid/main/YesEpic", true))()
	end,
 })

Button = gametab:CreateButton({
	Name = "Aimlock",
	Callback = function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/Qrto1/aimlock/main/dahod')))()
	end,
 })

 Button = gametab:CreateButton({
	Name = "Aimlock V2 (Keybind : C To unlock / lock aim)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenOnRoblox/da-hood-camlock/main/.gitignore"))()
	end,
 })
  -- Demon Fall
elseif game.GameId==1650291138 then
	gametab=Window:CreateTab("Demon Fall")
  Button = gametab:CreateButton({
	Name = "Drowned Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/Krakles/main/DrownedHub/Demonfall.lua"))()
	end,
 })
 -- Doors
elseif game.GameId==2440500124 then
	gametab=Window:CreateTab("Doors")
Button = gametab:CreateButton({
	Name = "FFJ Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
	end,
 })

Button = gametab:CreateButton({
	Name = "Door Hub",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/M4mpGErb",true))()
	end,
 })
 -- Dress to impress
elseif game.GameId==5203828273 then
	gametab=Window:CreateTab("Dress To Impress")
Button = gametab:CreateButton({
	Name = "Op Script",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/DTI-GUI-V2/main/dti_gui_v2.lua",true))()
  	end    
})
-- Driving Empire
elseif game.GameId==1202096104 then
	gametab=Window:CreateTab("Driving Empire")
Button = gametab:CreateButton({
	Name = "Marco Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/drivingempire", true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Lightux Hub",
	Callback = function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/cool83birdcarfly02six/DrivingEmpireEvents/main/README.md'),true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Kitty Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/myown/drivingempire.lua'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Nut Hub",
	Callback = function()
		loadstring(game:HttpGet("https://pastefy.app/B3bzy9h6/raw",true))()
  	end    
})
-- Dungeon Quest
elseif game.GameId==848145103 then
	gametab=Window:CreateTab("Dungeon Quest")
Button = gametab:CreateButton({
	Name = "NS Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cracklua/cracks/m/keyrblxR",true))()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/DQ/main/Solara"))()
  	end    
})
Label = gametab:CreateLabel("Key : Nut Hub")
--Dungeon RNG
elseif game.GameId==6002149925 then
	gametab=Window:CreateTab("Dungeon RNG")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/DungeonRNG231.lua"))()
  	end    
})
--Da Strike
elseif game.GameId==5235037897 then
	gametab=Window:CreateTab("Da Strike")
Button = gametab:CreateButton({
	Name = "Random Hub No GUI",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/pthS13mK"))();
  	end    
})
-- Eat World Simulator
elseif game.GameId==5770990128 then
	gametab=Window:CreateTab("Eat World Simulator")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/EatBlocksSim70.lua"))()
  	end    
})
-- Eat The World
elseif game.GameId==5677613211 then
	gametab=Window:CreateTab("Eat The World")
Button = gametab:CreateButton({
	Name = "Auto Farm",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Mongusohio/EatTheWorldMadeBySederYTTV/main/Heresomerizzgrimacr"))()
  	end    
})
-- Epic MiniGames
elseif game.GameId==110181652 then
	gametab=Window:CreateTab("Epic MiniGames")
Button = gametab:CreateButton({
	Name = "Auto Farm",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/YePwz5u5", true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Random Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/SlamminPig/rblxgames/main/Epic%20Minigames/EpicMinigamesGUI"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Zetox V7",
	Callback = function()
		loadstring(game:GetObjects("rbxassetid://02565551523")[1].Source)()
  	end    
})
-- Evade
elseif game.GameId==3647333358 then
	gametab=Window:CreateTab("Evade")
Button = gametab:CreateButton({
	Name = "Tbao Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubEvade"))()
  	end    
})
-- Fabled Legacy!
elseif game.GameId==4201418016 then
	gametab=Window:CreateTab("Fabled Legacy!")
Button = gametab:CreateButton({
	Name = "NS Hub",
	Callback = function()
    	loadstring(game:HttpGet('https://raw.githubusercontent.com/OhhMyGehlee/FL/main/Solara'))()
  	end    
})
-- Flee The Facility
elseif game.GameId==372226183 then
	gametab=Window:CreateTab("Flee The Facility")
Button = gametab:CreateButton({
	Name = "Yarhm Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Spimine Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/antisocialb2/SPIMINE-FLEETHEFACILITY/main/script.lua'))()
  	end    
})
-- Fling Things And People
elseif game.GameId==2668101271 then
	gametab=Window:CreateTab("Fling Things And People")
Button = gametab:CreateButton({
	Name = "VHSV4 Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/fgdergewrgegr/SVH/main/VHSV4"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Auto Aim",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/d0uJjTkD",true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Show Spin Timer On Screen",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/n9tbnk4V",true))()
  	end    
})
-- Football Fusion 2
elseif game.GameId==3150475059 then
	gametab=Window:CreateTab("Football Fusion 2")
Button = gametab:CreateButton({
	Name = "Ishii Hub",
	Callback = function()
		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7b4f22e1726966f40c91521aaeb11953.lua"))() 
  	end    
})
-- Fortlines
elseif game.GameId==2132866904 then
	gametab=Window:CreateTab("Fortlines")
Button = gametab:CreateButton({
	Name = "Thunder Client",
	Callback = function()
		loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/5bebf0b1e173f4baff73449722204837.lua'))()
  	end    
})
-- Fat Race
elseif game.GameId==6146301100 then
	gametab=Window:CreateTab("Fat Race")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/FatRacer2831.lua"))()
  	end    
})
-- Fastest Typer Race
elseif game.GameId==5719123726 then
	gametab=Window:CreateTab("Fastest Typer Race")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/TypeRaceSim1.lua"))()
  	end    
})
-- Grand Piece Online
elseif game.GameId==648454481 then
	gametab=Window:CreateTab("Grand Piece Online")
Button = gametab:CreateButton({
	Name = "Star Hub",
	Callback = function()
		loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/StarHub')()
  	end    
})

Button = gametab:CreateButton({
	Name = "Fruit Notifier",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/ArponAG/Scripts/main/gpo.lua', true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Vamp HUB (Battleroyal only)",
	Callback = function()
		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ab1d247898645c7cf013913b8629963f.lua"))()
  	end    
})
-- Gunfight Arena
elseif game.GameId==5012222382 then
	gametab=Window:CreateTab("Gunfight Arena")
Button = gametab:CreateButton({
	Name = "BaconBoss Script",
	Callback = function()
		loadstring(game:HttpGet(('https://pastefy.app/FL5mxhtj/raw'),true))()
  	end    
})
-- Gym League
elseif game.GameId==5972059550 then
	gametab=Window:CreateTab("Gym League")
Button = gametab:CreateButton({
	Name = "Tupo Hub (Rayfield Lib)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/x64communist/tupo/main/GymLeague.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Tupo Hub (Fluent Lib)",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Gym-league-FluentLib/main/GymLeagueFluent"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Lightux Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/cool83birdcarfly02six/LightuxSolaraSup/main/README.md'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Speed Hub X",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Script-Games/main/Gym%20League.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "RYK Hub",
	Callback = function()
		loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/ryk')'xdddd²'
  	end    
})

Button = gametab:CreateButton({
	Name = "Cats Hub",
	Callback = function()
		loadstring(game:HttpGet('https://gist.githubusercontent.com/afyzone/d8b7c8da9fb09c80937f4536648dbd9a/raw/'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Ather Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Athergaming/Roblox-Gym-League-Script/main/AtherHub%20Gym%20League%20V1_5.lua"))() 
  	end    
})
-- Giant Survival!
elseif game.GameId==1342991001 then
	gametab=Window:CreateTab("Giant Survival!")
Button = gametab:CreateButton({
	Name = "Inf XP & Money",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/F4vBL7yZ",true))()
  	end    
})
-- Highway Hooligans
elseif game.GameId==4447252800 then
	gametab=Window:CreateTab("Highway Hooligans")
Button = gametab:CreateButton({
	Name = "Auto Farm",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8643/test/main/hooligans", true))()
  	end    
})
-- Horror RNG
elseif game.GameId==6045016956 then
	gametab=Window:CreateTab("Horror RNG")
Button = gametab:CreateButton({
	Name = "Rinss Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/R1nn1/MainMenu1/main/MainMenuV1.2"))()
  	end    
})
-- Hotel Elphant
elseif game.GameId==8814491 then
	gametab=Window:CreateTab("Hotel Elphant")
Button = gametab:CreateButton({
	Name = "Inf Money",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ROBLOMACK/HotelElephantMoneyGiver/main/HEMG"))()
  	end    
})
local Paragraph = gametab:CreateParagraph({Title = "REMINDER", Content = "YOU NEED TO FUCKING HIT ENTER AFTER TYPING IN PLAYER USERNAME OR AMOUNT thank you"})
-- IMPOSSIBLE OBBY
elseif game.GameId==5607299070 then
	gametab=Window:CreateTab("IMPOSSIBLE OBBY")
Button = gametab:CreateButton({
	Name = "Auto Finish Game",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/IMPOSSIBLE/main/OBBY"))()
  	end    
})
-- Jail Break
elseif game.GameId==245662005 then
	gametab=Window:CreateTab("Jail Break")
Section = gametab:CreateSection("If Callback Error then rejoin and execute")

Button = gametab:CreateButton({
    Name = "Aoi Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zyn789/Aoi-Script/main/Jailbreak"))()
    end    
})
    
Button = gametab:CreateButton({
    Name = "Ski Hub",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/skihub.lua'))() 
    end    
})
    
Button = gametab:CreateButton({
    Name = "Jail Break V5",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/ghGgrmWR'))()
    end    
})
    
Button = gametab:CreateButton({
    Name = "Jail Break V2",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/Gd1H8cxf",true))()
     end    
})
-- Jims RNG
elseif game.GameId==5780359296 then
	gametab=Window:CreateTab("Jims RNG")
Button = gametab:CreateButton({
	Name = "Instant Get Any Aura",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/bims/main/rng",true))()
  	end    
})
-- Jujutsu Shenanigans
elseif game.GameId==3508322461 then
	gametab=Window:CreateTab("Jujutsu Shenanigans")
Button = gametab:CreateButton({
	Name = "NS Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/JJS/main/Solara"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Legends Hub",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/LOLking123456/Jujutsu/main/Shenanigans'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Fake animation Veux Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LolnotaKid/Finallyworks/main/Protected.txt"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "ESP",
	Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/R5bfAiMB",true))()
  	end    
})
-- Kamehameha Simulator
elseif game.GameId==5223708703 then
	gametab=Window:CreateTab("Kamehameha Simulator")
Button = gametab:CreateButton({
    Name = "Auto Farm (OP)",
    Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/KamehamehaSimulator.lua'))()
    end,
})
-- Kat 
elseif game.GameId==254394801 then
	gametab=Window:CreateTab("Kat")
Button = gametab:CreateButton({
	Name = "Lime X Hub",
	Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/78kG7trR", true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Delete Other Players Item",
	Callback = function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/6G9GfqjC'),true))() 
  	end    
})

 Button = gametab:CreateButton({
    Name = "Unnamed ESP",
    Callback = function()
        pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))() end)
    end,
})
-- King Legacy
elseif game.GameId==1451439645 then
	gametab=Window:CreateTab("King Legacy")
Button = gametab:CreateButton({
    Name = "Arc Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ChopLoris/ArcHub/main/PC.lua"))()
    end,
})

Button = gametab:CreateButton({
    Name = "Legend Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Upd6/main/King"))()
    end,
})
-- Launch Into Space Simulator
elseif game.GameId==5361859890 then
	gametab=Window:CreateTab("Launch Into Space Simulator")
Button = gametab:CreateButton({
	Name = "Kitty Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/myown/LaunchIntoSpaceSim.lua'))() 
  	end    
})
-- Legend Of Speed
elseif game.GameId==1119466531 then
	gametab=Window:CreateTab("Legend Of Speed")
Button = gametab:CreateButton({
    Name = "Sim Hub",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/E1Kp2r3Y"))();
    end,
 })

Button = gametab:CreateButton({
    Name = "Blox Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImPocky/PockyHub/main/Scripts/load.txt"))()
    end,
})

Button = gametab:CreateButton({
    Name = "Vynixius Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Legends%20Of%20Speed/Script.lua"))()
    end,
})

Button = gametab:CreateButton({
    Name = "Random Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KrangH/ScriptsHub/main/Legends_Of_Speedv2"))()
    end,
})
 -- Lucky blocks
elseif game.GameId==279565647 then
	gametab=Window:CreateTab("Lucky blocks")
 Button = gametab:CreateButton({
    Name = "LB Hub",
    Callback = function()
        loadstring(game:HttpGet("https://github.com/bruhhwtf/LUCKY-BLOCKS-Battlegrounds-GUI/raw/main/Main"))()
    end,
})
-- Lumber Tycoon 2
elseif game.GameId==2471084 then
	gametab=Window:CreateTab("")
Button = gametab:CreateButton({
	Name = "James Hub",
	Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/dDDrAaN6"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "LuaWare V5.0",
	Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/yn0UgQhV"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Butter Hub",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/Butter/main/Root2.lua'))("")
  	end    
})
-- Mic Up
elseif game.GameId==2626227051 then
	gametab=Window:CreateTab("Mic Up")
Button = gametab:CreateButton({
	Name = "Kitty Hub",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/myown/micup.lua'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Sky Hub",
	Callback = function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/3008-2.73-teleport-to-player-worker-esp-grab-food-no-fall-damage-12949"))()
  	end    
})
-- Monkey Raft
elseif game.GameId==5988250208 then
	gametab=Window:CreateTab("Monkey Raft")
Button = gametab:CreateButton({
	Name = "Auto Collect Items ( Go near islands )",
	Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/16e4cdEo/raw",true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Auto Collect Gold Banana's",
	Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/YS5x5C5z",true))()
  	end    
})
-- Murder Mystery 2
elseif game.GameId==66654135 then
	gametab=Window:CreateTab("Murder Mystery 2")
Paragraph = gametab:CreateParagraph({Title = "USE ALT ACC TO TEST SCRIPT FIRST.", Content = "I Do not own any of these mm2 scripts i only add them after testing"})

Button = gametab:CreateButton({
	Name = "Ski Hub",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/Yousuck780/mm2/main/mm2"), true))()
	end,
 })
Button = gametab:CreateButton({
	Name = "Vynixu's Hub",
	Callback = function()
        loadstring(game:GetObjects("rbxassetid://4001118261")[1].Source)()
  	end    
})

Button = gametab:CreateButton({
	Name = "Yarhm Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
  	end    
})

Button = gametab:CreateButton({
	Name = "HaxHell Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/haxhell/roblox-scripts/main/murder-mystery-2.lua", true))()
	end,
 })

Button = gametab:CreateButton({
	Name = "Foggy hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FOGOTY/mm2-foggy/main/script"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Meow Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/testikwatafak/-ProstoHub/main/ProstoHub", true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Mars Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1andonlymars/MarsHub/main/MM2"))()
  	end    
})
-- Murderers VS Sheriffs Duels
elseif game.GameId==4348829796 then
	gametab=Window:CreateTab("Murderers VS Sheriffs Duels")
Button = gametab:CreateButton({
    Name = "Random Hub (Have hitbox too)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/Murderer-Vs-Sheriff-Duels-/main/Murderer%20Vs%20Sheriff%20Duels"))()
    end,
})

Button = gametab:CreateButton({
    Name = "Hitbox",
    Callback = function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Update-script-hitbox-9326"))()
    end,
})

Button = gametab:CreateButton({
    Name = "Random Hub V2",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/4MvbLUwi",true))()
    end,
})

Button = gametab:CreateButton({
    Name = "Random Hub (Best Script)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Sheeshablee73/Scriptss/main/MVSD.lua",true))()
    end,
})
-- Muscle Legends
elseif game.GameId==1268927906 then
	gametab=Window:CreateTab("Muscle Legends")
Button = gametab:CreateButton({
    Name = "Unique Hub",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Unique-Hub-(14-Gmes)_521",true))()
    end,
})

Button = gametab:CreateButton({
    Name = "Neko Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/muscle/main/hub"))()
    end,
})

Button = gametab:CreateButton({
    Name = "Auto Farm ( Might take time to load )",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/badmusclelegends.lua'))()
    end,
})
-- mining empire
elseif game.GameId==6139437092 then
	gametab=Window:CreateTab("Mining empire")
Button = gametab:CreateButton({
    Name = "Wack hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Janorax/MinerEmpire/main/mainer"))()
    end,
})
-- natural disaster survival
elseif game.GameId==65241 then
	gametab=Window:CreateTab("Natural Disaster Survival")
Button = gametab:CreateButton({
	Name = "Rawnder Hub",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/LiverMods/Rawnder-NTDR/main/NaturalDisaster'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "NDS Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/JustAP1ayer/PlayerHubOther/main/PlayerHubLoader.lua",true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Nut Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/Nds/main/script"))()
  	end    
})


Button = gametab:CreateButton({
	Name = "Different Walk Animation (R6)",
	Callback = function()
        game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=376760331"
  	end    
})

Button = gametab:CreateButton({
	Name = "incognito Bypass (U can type anything)",
	Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/S4skyvLa"))()
      	end    
})

Button = gametab:CreateButton({
	Name = "CH Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/CHHub.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Tbao Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubNaturalDisasterSurvival"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Sp4m Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/HSp4m/rbx-scr.wtf/main/loader.brainfuck", true))() 
  	end    
})
-- Ninja Legends
elseif game.GameId==1335695570 then
	gametab=Window:CreateTab("Ninja Legends")
Button = gametab:CreateButton({
	Name = "Ski Hub",
	Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/Yousuck780/ninja-legends/main/no"), true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Vynixius Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Ninja%20Legends/Script.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Zepsyy Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zepsyy2/asd/main/Ninja%20Legends.lua"))()
  	end    
})
-- Pancake Battles
elseif game.GameId==4295108146 then
	gametab=Window:CreateTab("Pancake Battles")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/PancakeBattles9942.lua"))()
  	end    
})
-- Pet Sim 99
elseif game.GameId==3317771874 then
	gametab=Window:CreateTab("Pet Simulator 99")
Button = gametab:CreateButton({
	Name = "Griffin Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/ps99noq.lua'))() 
	end,
 })

 Button = gametab:CreateButton({
	Name = "Redz Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/REDzHUB/PetSimulator99/main/redz9999.lua'))() 
	end,
 })
 -- Phantom Forces
elseif game.GameId==113491250 then
	gametab=Window:CreateTab("Phantom Forces")
Label = gametab:CreateLabel("DeleteMob, ThunderClient & HomoHack discontinued")
Button = gametab:CreateButton({ 
	Name = "Ski Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Yousuck780/phantom-forces-new/main/noob"))()
  	end    
})
-- Prison Life
elseif game.GameId==73885730 then
	gametab=Window:CreateTab("Prison Life")
Button = gametab:CreateButton({
	Name = "FE Bypass Gui",
	Callback = function()
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\103\48\48\108\88\112\108\111\105\116\101\114\47\103\48\48\108\88\112\108\111\105\116\101\114\47\109\97\105\110\47\70\101\37\50\48\98\121\112\97\115\115\34\44\32\116\114\117\101\41\41\40\41\10")()
  	end    
})

Button = gametab:CreateButton({
	Name = "Prison Ware Hub",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Nihilize H4X",
	Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/QLtH2v8i'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Admin Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Juanko-Scripts/Roblox-scripts/main/Prision%20Admin%20Hub%20irufwjskwidiuxejw8uddjjwjdnnwjwjdbb"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Trigger Admin",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/triger/main/admin"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "PrizzLife Admin",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/elliexmln/PrizzLife/main/pladmin.lua'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Anti-Abuser Hub",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/kmWxeu8P",true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "LGBTQ+ Hub (Kill All)",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/a0Bxk3sn",true))()
  	end    
})
-- project slayers 
elseif game.GameId==2142948266 then
	gametab=Window:CreateTab("Project Slayers ")
Button = gametab:CreateButton({
	Name = "Cloud Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/cloudman4416/scripts/main/Loader"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Blindness Hub Map 1",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/washingtontrichkid2/Newgay/main/ProjectSlayer",true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Blindness Hub Map 2",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/washingtontrichkid2/Newgay/main/ProjectSlayerMap2",true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Shark Hub",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/YUJUBz0Z",true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Frost Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/Scripts/main/ProjectSlayers/Script.lua"))();
  	end    
})

local Label = gametab:CreateLabel("Frost Hub Key : FrostiesOnTop")
-- Pull A Sword
elseif game.GameId==4795326392 then
	gametab=Window:CreateTab("Pull A Sword")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/PullASword3421.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Esohasl Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/itsnoctural/Utilities/main/Closed/Pull%20a%20Sword.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Random Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/PaS"))()
  	end    
})
-- Push Up Battles
elseif game.GameId==5243717044 then
	gametab=Window:CreateTab("Push Up Battles")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/PushUpBattles932.lua"))()
  	end    
})
-- Pet Hatchers
elseif game.GameId==5704018616 then
	gametab=Window:CreateTab("Pet Hatchers")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/PetHatcher.lua"))()
  	end    
})
-- Push-Up Training Simulator
elseif game.GameId==6217832823 then
	gametab=Window:CreateTab("Push-Up Training Simulator")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/PushUpTrainingSimulator.lua"))()
  	end    
})
-- Race Clicker
elseif game.GameId==3476371299 then
	gametab=Window:CreateTab("Race Clicker")
Button = gametab:CreateButton({
	Name = "Auto Farm",
	Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/c2gAKZU3'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Kitty Hub",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/raceclicker.lua'))()
  	end    
})
-- Rebirth Champions X
elseif game.GameId==3258302407 then
	gametab=Window:CreateTab("Rebirth Champions X")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/RebirthChampionsX1837.lua"))()
  	end    
})
--  Reborn As Swordman
elseif game.GameId==5827120940 then
	gametab=Window:CreateTab("Reborn As Swordman")
Button = gametab:CreateButton({
	Name = "Ywxos Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/RebornAsSwordman34.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "DK Hub",
	Callback = function()
		loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/dkhub')'you should suck frosts dick'
  	end    
})
-- Rivals
elseif game.GameId==6035872082 then
	gametab=Window:CreateTab("Rivals")
Button = gametab:CreateButton({
	Name = "Drowned Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/Krakles/main/DrownedHub/Rival.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Jonny Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/JonnyCheeser/script/main/hub",true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Op Gui",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Baillee/Rivals-script/main/Rivals-script.lua", true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Silent Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/KxGOATESQUE/SilentRivals/main/SilentRivals"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Venox Ware",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/venoxhh/universalscripts/main/rivals/venoxrivals")))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Venox Ware V2",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/venoxhh/universalscripts/main/rivals/venoxrivalsv2'))()
  	end    
})

local Label = gametab:CreateLabel("Join Nut Hub To Bypass Key system")
-- Ro Ghoul
elseif game.GameId==380704901 then
gametab=Window:CreateTab("Ro Ghoul")
Button = gametab:CreateButton({
	Name = "Zen Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaizenofficiall/ZenHub/main/Roghoul", true))()
  	end    
})
-- Running Simulator
elseif game.GameId==4933844472 then
gametab=Window:CreateTab("Running Simulator")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/Retarded_German/main/RunningSim.lua"))()
  	end    
})
-- Saber Battle Sim
elseif game.GameId==5931070224 then
	gametab=Window:CreateTab("Saber Battle Simulator")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/SaberBattleSim2841.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Nut Hub (Auto Click and fight only)",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/75GYs0rx",true))()
  	end    
})
-- Scythe Simulator
elseif game.GameId==5998308727 then
	gametab=Window:CreateTab("Scythe Simulator")
Button = gametab:CreateButton({
	Name = "Random Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/scythe/main/Sim"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Nami Hub",
	Callback = function()
		loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/dkhub')'you should suck frosts dick'
  	end    
})
-- Slap Battle
elseif game.GameId==2380077519 then
	gametab=Window:CreateTab("Slap Battle")
local Label = gametab:CreateLabel("Rejoin and execute if any script show callback error")

Button = gametab:CreateButton({
	Name = "Zenon Hub",
	Callback = function()
        setclipboard("Zenon12345")
		loadstring(game:HttpGet("https://pastefy.app/gbwEzNX4/raw"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "SB Hub",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/9c5vWtYw",true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Giang Hub",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/AR5f1MT5",true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Dizzy Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/slap/main/dizzyhub",true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Random Hub",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/UABerT22",true))()
  	end    
})
-- Slayer Corps
elseif game.GameId==4912354124 then
	gametab=Window:CreateTab("Slayer Corps")
Button = gametab:CreateButton({
	Name = "DK Hub",
	Callback = function()
		loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/dkhub')'you should suck frosts dick'
  	end    
})
-- Sol's RNG
elseif game.GameId==5361032378 then
	gametab=Window:CreateTab("Sol's RNG")
Button = gametab:CreateButton({
	Name = "Erudite Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ThacG/EruditeHub/main/Sol's%20RNG/V2.69"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Legends Hub (Copies Key)",
	Callback = function()
		setclipboard("vy5fBGS6nNUuJjgxWhCLpR")
		loadstring(game:HttpGet('https://pastefy.app/55pnwOy3/raw'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "3itx Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Just3itx/Backup/main/loader.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Bacon Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/SolRNG/main/SolRNG"))()
  	end    
})
-- Specter 1
elseif game.GameId==3171190217 then
	gametab=Window:CreateTab("Specter")
Button = gametab:CreateButton({
	Name = "Kitty Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/myown/specter1.lua'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Navicat Hub",
	Callback = function()
		loadstring(game:HttpGet('https://navicat.glitch.me/Specter/script.lua'))()
  	end    
})
-- starving artists
elseif game.GameId==3367801828 then
	gametab=Window:CreateTab("Starving Artists")
Button = gametab:CreateButton({
	Name = "Auto Draw First Sit. (Copies Key)",
	Callback = function()
		setclipboard("usernaxo")
		loadstring(game:HttpGet("https://github.com/usernaxo/RobloxScripts/raw/main/StarvingArtists/DrawingScript.lua", true))()
  	end    
})
-- Survive the Killer!
elseif game.GameId==1489026993 then
	gametab=Window:CreateTab("Survive the Killer!")
Button = gametab:CreateButton({
	Name = "Turtle Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/STKTurtle.lua'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Ywxo Hub (The Game Event Only)",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/ProjectpopCat/YS_TheGamesEvent/main/SurviveTheKiller.lua'))()
  	end    
})
-- Swordmaster Simulator
elseif game.GameId==5349025481 then
gametab=Window:CreateTab("Swordmaster Simulator")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/CFS.lua"))()
  	end    
})
-- Super league soccer
elseif game.GameId==4293374620 then
	gametab=Window:CreateTab("Super league soccer")
	Button = gametab:CreateButton({
		Name = "Beast Hub",
		Callback = function()
			loadstring(game:HttpGet("https://cracklua.github.io/cracks/beast"))()
		  end    
	})
-- Taxi Boss
elseif game.GameId==2851381018 then
	gametab=Window:CreateTab("Taxi Boss")
Button = gametab:CreateButton({
	Name = "Auto Farm",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Marco8642/science/main/Taxi%20Boss'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Shows all NPC Ratings in your F9 Console",
	Callback = function()
		for _, g in pairs(game:GetService("Workspace").NewCustomers:GetDescendants()) do
            pcall(function()
                if g.Name == "Rating" then
                    if tonumber(g.Text) >= 0.1 and tonumber(g.Text) <= 1.9 then
                        print("Low Ratings: "..tonumber(g.Text))
                    end
                    if tonumber(g.Text) >= 2 and tonumber(g.Text) <= 3.9 then
                        print("Medium Ratings: "..tonumber(g.Text))
                    end
                    if tonumber(g.Text) >= 4 then
                        print("High Ratings: "..tonumber(g.Text))
                    end
                end
            end)
        end
  	end    
})

local Label = gametab:CreateLabel("Alost all scripts are paid so only these 2 working")
-- The Strongest Battlegrounds
elseif game.GameId==3808081382 then
	gametab=Window:CreateTab("The Strongest Battlegrounds")
local Label = gametab:CreateLabel("Use 1-2 Script at same time if u use more u will get Callback error")
local Label = gametab:CreateLabel("Copies Key Means it will copy key to your clipboard")

Button = gametab:CreateButton({
	Name = "NS Hub (Key : Nut Hub Op)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/cracklua/cracks/m/keyrblxR",true))()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/TSBG/main/Solara"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "LN Hub",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/QGD9as3r",true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Legends Hub (Copies Key)",
	Callback = function()
        setclipboard("349058034Best82397Strongest")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/KJ/main/TSB"))() 
  	end    
})

Button = gametab:CreateButton({
	Name = "FFJ Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/TSBUtils.lua"))() 
  	end    
})

Button = gametab:CreateButton({
	Name = "NBLM Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/NBLMSCRIPTS/NBLMSCRIPTHUB/main/SKIBIDI"))() 
  	end    
})

Button = gametab:CreateButton({
	Name = "Combo's",
	Callback = function()
		loadstring(game:HttpGet("https://pastefy.app/XNKwIjUX/raw"))() 
  	end    
})

Button = gametab:CreateButton({
	Name = "Apoc Hub",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/8J3caWVX",true))() 
  	end    
})

Button = gametab:CreateButton({
	Name = "Kade Hub (not really good)",
	Callback = function()
		loadstring(game:HttpGet(('https://gist.githubusercontent.com/skibiditoiletfan2007/9c8acec1b350bb2a27f4101e2eec803e/raw/bd6fe461cb8fe7b11c53f71999759b1fc5b5e649/TheCaptainsGoDownWithTheirShip.lua'),true))() 
  	end    
})

Button = gametab:CreateButton({
	Name = "Zenon Hub (Copies Key)",
	Callback = function()
        setclipboard("Zenon12345")
		loadstring(game:HttpGet("https://pastefy.app/gbwEzNX4/raw"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Aim Lock",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sdfesdfsedf/srgtergasdfs/main/silent", true))()
  	end    
})
-- therapy
elseif game.GameId==3177453609 then
	gametab=Window:CreateTab("Therapy")
Button = gametab:CreateButton({
	Name = "Orbit Player Spam sound",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/p6FEhZZe",true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Chat Bypass (you have to type words)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-BYPASS/main/kawaii-bypass",true))()
  	end    
})
-- Titan Training Sim
elseif game.GameId==6174407103 then
	gametab=Window:CreateTab("Titan Training Simulator")
Button = gametab:CreateButton({
	Name = "Ywxo Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/TitanTrainingSimulator1881.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Legends Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/TitanTrainingSim.lua'))()
  	end    
})
-- Tower of Hell
elseif game.GameId==703124385 then
	gametab=Window:CreateTab("Tower of Hell")
Button = gametab:CreateButton({
	Name = "Starry Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/hello-n-bye/starry/main/main.lua", true))() 
  	end    
})

Button = gametab:CreateButton({
	Name = "Sprin Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/dqvh/dqvh/main/SprinHub",true))() 
  	end    
})

Button = gametab:CreateButton({
	Name = "Auto Win",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/scripts/main/Tower_of_Hell_Farm.lua"))() 
  	end    
})
-- TPS: Street Soccer
elseif game.GameId==124283622 then
	gametab=Window:CreateTab("TPS: Street Soccer")
local Label = gametab:CreateLabel("Dont try to execute all script at same time rejoin & execute")

Button = gametab:CreateButton({
	Name = "Byte Hub Auto Farm Goals",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DamThien332/TPS-Script/main/AutoFarmGoals.lua"))() 
  	end    
})

Button = gametab:CreateButton({
	Name = "Extrame Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/xfaz/newtps/main/kuchi'))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Wreston Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Wreston00/tpsreach/main/tpsreach.lua",true))()
  	end    
})
-- Track & Field: Infinite
elseif game.GameId==5661134200 then
	gametab=Window:CreateTab("Track & Field: Infinite")
Button = gametab:CreateButton({
	Name = "DEP Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/JayXSama/Track-And-Field-Infinite/main/Solara"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Cool Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/GuizzyisbackV2LOL/Track-Field/main/free.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Legends Hub (Copies Key)",
	Callback = function()
        setclipboard("328732!!Track839!!")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Field/main/Track"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Olympic Hub (Join Server To Get Key)",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Supremechaotic/Key/main/HUB.lua'))()
  	end    
})

local Label = gametab:CreateLabel("Legends Hub Will copy key to your clipboard so just click CTRL + V to paste")
-- Tycoon RNG
elseif game.GameId==6026836726 then
	gametab=Window:CreateTab("Tycoon RNG")
Button = gametab:CreateButton({
	Name = "Madbuk Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/MadbukScripts/Scripts/main/Obfuscated%20Tycoon%20RNG.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "RYK Hub",
	Callback = function()
		loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/ryk')()
  	end    
})

Button = gametab:CreateButton({
	Name = "Auto Collect and Obby",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jjp2iky/scripts/main/TycoonRNG"))()
  	end    
})
-- Type soul
elseif game.GameId==4871329703 then
	gametab=Window:CreateTab("Type soul")
local Label = gametab:CreateLabel("Don't Execute in lobby join game and execute")

Button = gametab:CreateButton({
	Name = "Legends Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/LOLking123456/newtype/main/soul'))()
  	end    
})

local Label = gametab:CreateLabel("Alost all scripts are paid & Patched so only this 1 working")
-- Tower of jumps
elseif game.GameId==2805713501 then
gametab=Window:CreateTab("Tower of Jumps")
Button = gametab:CreateButton({
	Name = "Devil's Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/towerofjumpscript/main/main"))();
  	end    
})
-- Tank Simulator
elseif game.GameId==5437909627 then
	gametab=Window:CreateTab("Tank Simulator")
	Button = gametab:CreateButton({
		Name = "Ywxo Hub",
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/TankFightSimulator.lua"))()
		  end    
	})
-- Underground War 2.0
elseif game.GameId==3624423521 then
	gametab=Window:CreateTab("Underground War 2.0")
Button = gametab:CreateButton({
	Name = "Rinss Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/R1nn1/MainMenu1/main/MainMenuV1.2"))() 
  	end    
})

Button = gametab:CreateButton({
	Name = "Kill Aura",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/UndergroundWar'))() 
  	end    
})
-- untitled tag game
elseif game.GameId==4864117649 then
	gametab=Window:CreateTab("untitled tag game")
Button = gametab:CreateButton({
	Name = "Ranxware",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/2fYMPJZY",true))() 
  	end    
})

Button = gametab:CreateButton({
	Name = "Random Hub",
	Callback = function()
		untitled, taggame = pcall(game.HttpGet, game, ('https://%s/%s'):format('skibiditoilet.free-robux.click', 'p/raw/bryvmasag5'));
assert(untitled, 'Couldnt retrieve script,', taggame);
loadstring(taggame)();
game:GetService('UserInputService').MouseIconEnabled = true
  	end    
})

Button = gametab:CreateButton({
	Name = "Weird Script Tbh but works",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/nAlwspa/Into/main/hhh"))()
  	end    
})
-- Vehicle Legends
elseif game.GameId==1480782352 then
	gametab=Window:CreateTab("Vehicle Legends")
Button = gametab:CreateButton({
	Name = "Auto Farm",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/Vehicle%20legends"))() 
  	end    
})

Button = gametab:CreateButton({
	Name = "Ultimate Hub (Might take time to load)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/IExpIoit/Script/main/UltimateHub"))() 
  	end    
})
-- Viral Simulator
elseif game.GameId==5166168575 then
	gametab=Window:CreateTab("Viral Simulator")
Button = gametab:CreateButton({
	Name = "Inf Wins",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/EzPHKHBG",true))() 
  	end    
})
-- War Tycoon
elseif game.GameId==1526814825 then
	gametab=Window:CreateTab("War Tycoon")
Button = gametab:CreateButton({
	Name = "Awaken Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Awakenchan/Misc-Release/main/WarTycoon"))() 
  	end    
})

Button = gametab:CreateButton({
	Name = "Random Hub (Have tp box)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Adidsus/rb/194b7151863d8635b13b1a4972c2fed338bb6639/wartyccon.lua",true))()
  	end    
})
--  Warrior Simulator
elseif game.GameId==5663507626 then
	gametab=Window:CreateTab("Warrior Simulator")
Button = gametab:CreateButton({
	Name = "DK Hub",
	Callback = function()
		loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/dkhub')'you should suck frosts dick'
  	end    
})

Button = gametab:CreateButton({
	Name = "Tupo Hub (Copies Key Just CTRL + V To paste)",
	Callback = function()
        setclipboard("KennielISBACKReborn")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Warrior-Simulator-BETA-/main/Warrior%20Simulator%20%5BBETA%5D%20RayField"))()
  	end    
})
-- Westbound
elseif game.GameId==873703865 then
	gametab=Window:CreateTab("Westbound")
Button = gametab:CreateButton({
	Name = "Rylor Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Drrushh/Drrushh/main/Kdom",true))(); 
  	end    
})

Button = gametab:CreateButton({
	Name = "ESP and Silent aim",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/9T8wKLah",true))() 
  	end    
})
-- Your Bizarre Adventure
elseif game.GameId==1016936714 then
	gametab=Window:CreateTab("Your Bizarre Adventure")
Button = gametab:CreateButton({
	Name = "Item Farm",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Vuffi2007/YBA-Teleport-to-Items-GUI/main/YBA-Teleport-to-Items-GUI.lua"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "YBA Sucks Ass",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Tobias020108Back/YBA-AUT/main/YBA-GUI-Rewrite.lua"))()
  	end    
})
-- Zombie Attack
elseif game.GameId==504035427 then
	gametab=Window:CreateTab("Zombie Attack")
Button = gametab:CreateButton({
	Name = "Auto Farm",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/Zombie/main/attack"))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Ski Hub",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/Yousuck780/Zombie-attack/main/zombie"), true))()
  	end    
})

Button = gametab:CreateButton({
	Name = "Project LKB Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/dqtixz/Zombie-Attack-Projeto-LKB/main/Open%20Source"))()
  	end    
})

else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/scripts/main/universal2.txt",true))()
end

 local UserInputService = game:GetService("UserInputService")
 local TweenService = game:GetService("TweenService")
 
 if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Visible") then
	 game:GetService("Players").LocalPlayer.PlayerGui.Visible:Destroy()
 end
 
 local Visible = Instance.new("ScreenGui")
 local Frame = Instance.new("Frame")
 local Button = Instance.new("ImageButton")
 local UICorner = Instance.new("UICorner")
 
 Visible.Name = "Visible"
 Visible.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
 
 Frame.Parent = Visible
 Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
 Frame.BackgroundTransparency = 0.5
 Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
 Frame.BorderSizePixel = 0
 Frame.Position = UDim2.new(0, 20, 0.5, -20)
 Frame.Size = UDim2.new(0, 32, 0, 32)
 
 Button.Name = "Button"
 Button.Parent = Frame
 Button.BackgroundTransparency = 1
 Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 Button.Size = UDim2.new(0, 20, 0, 20)
 Button.Position = UDim2.new(0.5, -Button.Size.X.Offset / 2, 0.5, -Button.Size.Y.Offset / 2)
 Button.Image = "http://www.roblox.com/asset/?id=15757220056"
 
 local toggle = false
 Button.MouseButton1Click:Connect(function()
	 toggle = not toggle
	 if toggle then
		 game:GetService("VirtualInputManager"):SendKeyEvent(true, 127, false, game)
		 game:GetService("VirtualInputManager"):SendKeyEvent(false, 127, false, game)
		 Button.Image = "http://www.roblox.com/asset/?id=15757188966"
	 else
		 game:GetService("VirtualInputManager"):SendKeyEvent(true, 127, false, game)
		 game:GetService("VirtualInputManager"):SendKeyEvent(false, 127, false, game)
		 Button.Image = "http://www.roblox.com/asset/?id=15757220056"
	 end
 end)
 
 Frame.MouseEnter:Connect(function()
	 TweenService:Create(
		 Frame,
		 TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		 {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}
	 ):Play()
 end)
 
 Frame.MouseLeave:Connect(function()
	 TweenService:Create(
		 Frame,
		 TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		 {BackgroundColor3 = Color3.fromRGB(0, 0, 0)}
	 ):Play()
 end)
 
 UICorner.CornerRadius = UDim.new(0.25, 0)
 UICorner.Name = "Looks like"
 UICorner.Parent = Frame 