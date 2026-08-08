--!nonstrict
--[[
================================================================================
  Nousigi Hub GUI — дословная копия интерфейса                              v3.0
================================================================================
  Один Lua/Luau-файл. Статическое дерево восстановлено из палитр C_/N_/P_/T_:
  3 ScreenGui + 13 967 потомков = 13 970 узлов в исходном порядке.

  Встроенных скриптов в снятом дереве не было, поэтому ниже отдельно подключён
  UI-слой поведения: drag/resize, вкладки, секции, dropdown, checkbox, slider,
  поиск Ctrl+K и кнопка скрытия. Внешних require/HttpGet/loadstring нет.
================================================================================
]]

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end

--==============================================================================
--  Конструкторы значений (короткие имена — палитры ниже занимают меньше места)
--==============================================================================

local function C(r, g, b) return Color3.fromRGB(r, g, b) end
local function U(xs, xo, ys, yo) return UDim2.new(xs, xo, ys, yo) end
local function D(s, o) return UDim.new(s, o) end
local function V(x, y) return Vector2.new(x, y) end
local function V3(x, y, z) return Vector3.new(x, y, z) end
local function R(x0, y0, x1, y1) return Rect.new(x0, y0, x1, y1) end
local function E(enumType, name) return Enum[enumType][name] end
local function F(family, weight, style)
	return Font.new(family, Enum.FontWeight[weight], Enum.FontStyle[style])
end
local function CS(points)
	local kp = {}
	for i, p in ipairs(points) do
		kp[i] = ColorSequenceKeypoint.new(p[1], Color3.fromRGB(p[2], p[3], p[4]))
	end
	return ColorSequence.new(kp)
end
local function NS(points)
	local kp = {}
	for i, p in ipairs(points) do
		kp[i] = NumberSequenceKeypoint.new(p[1], p[2], p[3])
	end
	return NumberSequence.new(kp)
end

--==============================================================================
--  ПАЛИТРЫ И ДЕРЕВО  (снято с оригинала)
--==============================================================================

local C_ = {"Frame","UICorner","TextLabel","UIListLayout","ImageLabel","TextButton","UIStroke","TextBox","CanvasGroup","UIDragDetector","ScrollingFrame","UIGradient","ImageButton","StringValue","UISizeConstraint","ScreenGui","UIPageLayout","UIAspectRatioConstraint"}
local N_ = {"UICorner","Frame","UIListLayout","connected-background-bridge","connected-background-left-mask","connected-background-right-mask","trello-value","trello-value-holder","UIDragDetector","trello-value-bg","UIStroke","trello-value-text","section-title-line-gradient","section-container-corner","section-list-layout","section-top","section-title-line","section-title","section-title-line-1","selected-value","select-bg","select-list","select-container","select-container-gap","select-title","select-value","select-value-corner","select-value-stroke","select-value-holder","select-open-btn","select-open-ico","selected-holder","selected-container-corner","selected-container","selected-container-list-layout","selected-holder-saved-value","section-collapse-root","section-collapse-corner","section-collapse-btn","slider-bg","slider-container-bg-corner","slider-list","slider-title-container","slider-title-container-gap","slider-title","slider-container","bar-container","bar-container-corner","bar-btn","bar","bar-corner","slider-value-main","slider-value-corner","slider-value-stroke","slider-value-holder","slider-value","checkbox-list-layout","checkbox-container","checkbox-container-bg","checkbox-container-corner","checkbox-box","checkbox-box-checked","checkbox-check-ico","checkbox-btn","checkbox-title","checkbox-description","find-frame","find-ico","select-description","label-bg","label-bg-corner","label-title","UISizeConstraint","section-search-corner","label-Slot 1 Position: No Position\
Slot 2 Position: No Position\
Slot 3 Position: No Position\
Slot 4 ","select-input-Reset Position","slider-description","button-ico","option-corner","option-label","option-select-btn","button-bg","button-list","button-container","button-container-gap","button-title","button-main","button-corner","button-holder","button","button-ico-holder","split-right-wrapper","section-search-top","section-search-btn","section-search-root","section-search","section-search-stroke","section-value-holder","search-container-gap","search-value","search-ico","button-description","section-gap","box-value","Fun facts after running the script:\
- You can search your Unit Inventory using a unit's display name","content-title","content-page-holder","content-page-list-layout","trello-bg","trello-list","trello-container","trello-container-gap","trello-title","trello-description","trello-value-corner","trello-value-stroke","trello-open-btn","trello-open-ico","trello-options-holder","trello-options-container-corner","trello-options-container","trello-gap","input-checkbox-Match Making","menu-list-layout","page-selector","menu-child-bg","menu-child-bg-corner","menu-child-btn","menu-child-label","page-selector-child","Match Making","Match Making-holder","Match Making-holder-corner","Match Making-desc","Match Making-title-frame","Match Making-page","Match Making-page-gap","Match Making-section","Match Making-section-gap","Match Making-title","Match Making-btn","box-bg","box-list","box-container","box-container-gap","box-title","box-description","box-value-corner","box-value-stroke","box-value-holder","textbox-container-gap","select-input-Select Item","section-container-School Grounds","select-input-School Grounds","input-checkbox-Auto Buy","section-container-Flower Forest","section-container-Rose Kingdom","select-input-Flower Forest","select-input-Rose Kingdom","select-input-Select Stage Type","section-container-Fairy King Forest","section-container-King's Tomb","select-input-Fairy King Forest","select-input-King's Tomb","select-input-Select Summon Unit","input-checkbox-Unselect if Summoned","input-checkbox-Teleport Lobby if in Banner","select-input-Auto Sell Rarity","select-input-Select Map","select-input-Select Act","[Epic] Terra Penetration","[Rare] Dark Mastery","[Epic] Vital Strikes","[Rare] Flame Mastery","[Rare] Iron Flesh","[Rare] Gale Mastery","[Epic] Dark Penetration","[Mythic] Infectious","[Epic] Flame Penetration","[Legendary] Martyr's Blast","[Epic] Neutral Penetration","[Rare] Venomous Edge","[Epic] Lingering Rot","[Legendary] Bounty Hunter","[Epic] Quickened Blade","[Mythic] Whetstone Cache","[Rare] Hydro Mastery","[Rare] Fortified Cargo","[Epic] Storm Penetration","[Mythic] EXP Collector","[Epic] Gale Penetration","[Rare] Storm Mastery","[Rare] Relentless Pursuit","[Mythic] Momentum","[Rare] Yen Hunger","[Mythic] Missile Protocol","[Epic] Hydro Penetration","[Rare] Terra Mastery","[Legendary] EXP Condenser","[Rare] Neutral Mastery","[Epic] Blood Money","[Rare] Amplifier","[Epic] Extended Reach","[Epic] Overclocked Engine","[Mythic] Feral Cruelty","[Legendary] Bat Cavalry","[Epic] Light Penetration","[Legendary] Hemorrhage","[Legendary] Razor Focus","[Rare] Light Mastery","select-input-Select Unit","select-input-Ignore Effect","select-input-Ignore Map","Select Map","Select Map-holder","Select Map-holder-corner","Select Map-desc","Select Map-title-frame","Select Map-page","Select Map-page-gap","Select Map-section","Select Map-section-gap","Select Map-title","Select Map-btn","Select Act","Select Act-holder","Select Act-holder-corner","Select Act-title-frame","Select Act-page","Select Act-page-gap","Select Act-section","Select Act-section-gap","Select Act-title","Select Act-btn","Ignore Effect","Ignore Effect-holder","Ignore Effect-holder-corner","Ignore Effect-desc","Ignore Effect-title-frame","Ignore Effect-page","Ignore Effect-page-gap","Ignore Effect-section","Ignore Effect-section-gap","Ignore Effect-title","Ignore Effect-btn","Ignore Map","Ignore Map-holder","Ignore Map-holder-corner","Ignore Map-desc","Ignore Map-title-frame","Ignore Map-page","Ignore Map-page-gap","Ignore Map-section","Ignore Map-section-gap","Ignore Map-title","Ignore Map-btn","section-container-Failsafe","section-container-Misc","select-input-Select Building","input-checkbox-Auto Add Fuel","input-checkbox-Auto Collect","input-checkbox-Return Lobby When Fuel Empty","section-container-Auto Restart","input-checkbox-Auto Restart","select-input-Select Reward","select-input-Select Unit Priority","slider-input-Sell at Wave","notification-list-layout","Nousigi Hub GUI","main-root","main-holder","main-holder-corner","main-holder-stroke","main-top","main-top-corner","top-hide-corner","top-sider","top-sider-ico","top-sider-btn","top-gap-horizontal","top-search-root","top-search-ico","top-search-box","search-char-holder","search-shortcut","search-shortcut-stroke","search-shortcut-bind","top-img","top-label","content-root","content-root-corner","content-page-layout","pageContainer-Loading","section-container-Script","label-Script is being loaded, pleased wait...","pageContainer-UI Setting","input-checkbox-Auto Rejoin","input-checkbox-Rejoin Ping Freeze","section-container-Auto Execute","input-checkbox-Auto Execute on Teleport","section-container-UI Control","bind-input-Toggle UI","bind-list","bind-container","bind-container-gap","bind-container-bg","bind-container-corner","bind-box","bind-value","bind-btn","bind-description","bind-title","input-checkbox-Display Toggle UI Button (Mobile)","section-container-Script Config","section-container-Config Export","input-checkbox-Minify Config","input-checkbox-JSON Type Config","button-input-Copy Config to Clipboard","button-input-Send Config via Webhook","section-container-Config Import","box-input-Import Config","button-input-Reset Script Config","section-container-Whitelist info","label-Time Remain: <font color=\"rgb(135, 135, 135)\" weight=\"500\">None</font>","button-input-Delete Saved Whitelist Key","pageContainer-Lobby","input-checkbox-Auto Redeem Code","label-Fun facts after running the script:\
- You can search your Unit Inventory using a unit's displa","section-container-Sprite Crafter","input-checkbox-Auto Craft Sprite","select-input-Select Sprite","section-container-Sprite Limit","slider-input-Red Sprite Limit","slider-input-Blue Sprite Limit","slider-input-Green Sprite Limit","slider-input-Yellow Sprite Limit","slider-input-Purple Sprite Limit","slider-input-Pink Sprite Limit","slider-input-Rainbow Sprite Limit","section-container-Auto Claimer","input-checkbox-Auto Claim Quest","input-checkbox-Auto Claim Quest Board","input-checkbox-Auto Claim Battlepass","input-checkbox-Auto Claim Level Milestone","input-checkbox-Auto Claim Index","input-checkbox-Auto Claim Event","input-checkbox-Auto Claim Calendar","button-input-Enable all Auto Claim","section-container-Auto Shop","section-container-Gold Shop","section-container-Event Shop","section-container-Expedition Shop","section-container-Raid General Shop","section-container-Wandering Trader","section-container-Expedition Hub","section-container-Auto Construct","input-checkbox-Auto Construct","section-container-Auto Upgrade Building","input-checkbox-Auto Upgrade Building","section-container-Resource Drill","input-checkbox-Auto Open Geode","input-checkbox-Ignore if Sprite Reached Limit","section-container-Gold Mine","section-container-Research Lab","input-checkbox-Auto Upgrade Skill Tree","section-container-Training Grounds","input-checkbox-Auto Train Units","select-input-Select Units","input-checkbox-Return Lobby if Full Worthiness","section-container-Bulk Select","button-input-Select Non-Trait Mythics","button-input-Select Non-Trait Secrets","section-container-Auto Summon Banner","section-container-VillainInvasion","input-checkbox-Auto Summon VillainInvasion","section-container-Standard","input-checkbox-Auto Summon Standard","section-container-Mini","input-checkbox-Auto Summon Mini","pageContainer-Joiner","section-container-Auto Join Setting","input-checkbox-Disable Auto Joiners","slider-input-Joiner Cooldown","trello-input-Auto Join Priority","Expedition Joiner","Raid Joiner","Story Joiner","Trial Joiner","Weekly Challenge Joiner","Regular Challenge Joiner","Villain Invasion Joiner","Daily Challenge Joiner","Bounty Board Joiner","section-container-Team Equipper","input-checkbox-Team Equipper","slider-input-Story Joiner Team Slot","slider-input-Raid Joiner Team Slot","slider-input-Villain Invasion Joiner Team Slot","slider-input-Trial Joiner Team Slot","slider-input-Expedition Joiner Team Slot","slider-input-Regular Challenge Joiner Team Slot","slider-input-Daily Challenge Joiner Team Slot","slider-input-Weekly Challenge Joiner Team Slot","slider-input-Bounty Board Joiner Team Slot","section-container-Story Joiner","input-checkbox-Auto Join Story","select-input-Select Difficulty","section-container-Raid Joiner","input-checkbox-Auto Join Raid","input-checkbox-Only Join if below Raid Token","slider-input-Under Raid Token","section-container-Villain Invasion Joiner","input-checkbox-Auto Join Villain Invasion","input-checkbox-Join Crow Act if Crow Relics available","input-checkbox-Auto Open Villain Chest","section-container-Trial Joiner","input-checkbox-Auto Join Trial","select-input-Select Trial","section-container-Expedition Joiner","input-checkbox-Auto Join Expedition","select-input-Select Difficulty Level","section-container-Auto Join Requirement","input-checkbox-Only Join if below Expedition Fuel","slider-input-Under Expedition Fuel","input-checkbox-Return Lobby if above Expedition Fuel","slider-input-Above Expedition Fuel","input-checkbox-Auto Collect Orb","input-checkbox-Auto Continue Checkpoint","slider-input-Restart at Node","section-container-Auto Extract","input-checkbox-Auto Extract","slider-input-Extract after Node","section-container-Auto Select Upgrade","input-checkbox-Auto Select Upgrade","select-input-Select Upgrade Type","input-checkbox-Upgrade Reroll","label-Advanced reroll mechanic:\
- Bracket 1 uses Sets priority until every configured Sets upgrade h","trello-input-Auto Select Upgrade Priority","trello-input-Upgrade Priority - Sets","trello-input-Upgrade Priority - General","section-container-Upgrade Cap-Amount (Select the card by how many time)","slider-input-[Mythic] EXP Collector","slider-input-[Mythic] Feral Cruelty","slider-input-[Mythic] Infectious","slider-input-[Mythic] Missile Protocol","slider-input-[Mythic] Momentum","slider-input-[Mythic] Whetstone Cache","slider-input-[Legendary] Bat Cavalry","slider-input-[Legendary] Bounty Hunter","slider-input-[Legendary] EXP Condenser","slider-input-[Legendary] Hemorrhage","slider-input-[Legendary] Martyr's Blast","slider-input-[Legendary] Razor Focus","slider-input-[Epic] Blood Money","slider-input-[Epic] Dark Penetration","slider-input-[Epic] Extended Reach","slider-input-[Epic] Flame Penetration","slider-input-[Epic] Gale Penetration","slider-input-[Epic] Hydro Penetration","slider-input-[Epic] Light Penetration","slider-input-[Epic] Lingering Rot","slider-input-[Epic] Neutral Penetration","slider-input-[Epic] Overclocked Engine","slider-input-[Epic] Quickened Blade","slider-input-[Epic] Storm Penetration","slider-input-[Epic] Terra Penetration","slider-input-[Epic] Vital Strikes","slider-input-[Rare] Amplifier","slider-input-[Rare] Dark Mastery","slider-input-[Rare] Flame Mastery","slider-input-[Rare] Fortified Cargo","slider-input-[Rare] Gale Mastery","slider-input-[Rare] Hydro Mastery","slider-input-[Rare] Iron Flesh","slider-input-[Rare] Light Mastery","slider-input-[Rare] Neutral Mastery","slider-input-[Rare] Relentless Pursuit","slider-input-[Rare] Storm Mastery","slider-input-[Rare] Terra Mastery","slider-input-[Rare] Venomous Edge","slider-input-[Rare] Yen Hunger","section-container-Auto Select Anvil Stat","input-checkbox-Auto Select Anvil Stat","trello-input-Auto Select Anvil Stat Priority","EXP Multiplier","Bonus Match Rewards","SPA","Summon Damage","DoT DMG Dealt","Range","Critical Chance","Element Damage","Archetype Damage","Yen Generation","Summon Health","Critical Damage","Payload Health","Follow-Up Damage","Damage","section-container-Anvil Stat Cap-Amount (Select the card by how many time)","slider-input-Archetype Damage","slider-input-Bonus Match Rewards","slider-input-Critical Chance","slider-input-Critical Damage","slider-input-Damage","slider-input-DoT DMG Dealt","slider-input-EXP Multiplier","slider-input-Element Damage","slider-input-Follow-Up Damage","slider-input-Payload Health","slider-input-Range","slider-input-SPA","slider-input-Summon Damage","slider-input-Summon Health","slider-input-Yen Generation","section-container-Auto Expedition Map Route","input-checkbox-Auto Expedition Map Route","trello-input-Expedition Reward Priority","Expedition Coin","Cursed Timber","Aqua Shard","Fuel Cell","Equipment Reroll","Equipment Lock","Lush Dirt","Yen","Tome","Equipment Scrap","section-container-Auto Restart Reward","input-checkbox-Auto Restart for Reward","slider-input-Required Amount","section-container-Expedition Auto Play","input-checkbox-Expedition Auto Play","section-container-Auto Play Config","input-checkbox-Focus on Upgrade Farm","input-checkbox-Only Place on Payload","section-container-Payload","label-Current Map: School Grounds\
Front Position: (not set)\
Middle Position: (not set)\
Back Position","button-input-Set Front Position","button-input-Set Middle Position","button-input-Set Back Position","select-input-Select Front Unit","select-input-Select Middle Unit","select-input-Select Back Unit","section-container-Lane","label-Current Map: School Grounds\
DPS Position: (not set)\
Support Position: (not set)\
Farm Position:","button-input-Set DPS Position","button-input-Set Support Position","button-input-Set Farm Position","select-input-Select DPS Unit","select-input-Select Support Unit","select-input-Select Farm Unit","section-container-Auto Hire Unit","input-checkbox-Auto Hire Unit","section-container-Auto Checkpoint Shop","input-checkbox-Auto Checkpoint Shop","section-container-Auto Use Tome","input-checkbox-Auto Use Tome","trello-input-Tome Trait Priority","Primordial","Strength 2","Range 1","Forsaken","Limit Breaker","Range 2","Draconic","Bolt","Optics","Precision 2","Precision 1","Enlightenment","Speed 2","Investor","Unbound","Strength 1","Speed 1","section-container-Auto Repair","input-checkbox-Auto Use Repair Hammer","slider-input-Use at Percent Health","section-container-Expedition Failsafe","input-checkbox-Restart if stuck Node","slider-input-Restart Minute","section-container-Regular Challenge Joiner","input-checkbox-Auto Join Regular Challenge","input-checkbox-Change Gamemode If new Challenge","section-container-Daily Challenge Joiner","input-checkbox-Auto Join Daily Challenge","section-container-Weekly Challenge Joiner","input-checkbox-Auto Join Weekly Challenge","section-container-Bounty Board Joiner","input-checkbox-Auto Join Bounty Board","input-checkbox-Auto Reroll Quest","slider-input-Minimum Stars","select-input-Skip Objectives","slider-input-Skip if Infinite Wave above Wave","label-Status: Disabled","pageContainer-Game","section-container-Gameplay","input-checkbox-Auto Vote Start","section-container-Auto Skip Wave","input-checkbox-Auto Skip Wave","slider-input-Stop Skip at Wave","slider-input-Restart at Wave","section-container-Auto Sell","section-container-Auto Sell Unit","input-checkbox-Auto Sell Unit","section-container-Auto Sell Farm","input-checkbox-Auto Sell Farm","section-container-Game Finished","input-checkbox-Auto Next","input-checkbox-Auto Replay","input-checkbox-Auto Run Joiner Features","input-checkbox-Auto Return Lobby","input-checkbox-Return Lobby Failsafe","section-container-Leecher - naughty naughty boy","input-checkbox-Return Lobby if loose Stage","input-checkbox-Return Lobby if under Player count","slider-input-Player Count","section-container-Smart Auto Ability","input-checkbox-Smart Auto Ability","crimson (brother)","damu","flame emperor (reincarnate)","goose","jace","lady giant (envy)","puppet (telekinetic)","razorjaw (hunter)","reaper (released)","shadow (divine)","true saint (holy)","winged spirit (divine)","select-input-Select Ability","label-No unit selected yet - please choose a unit from the list above.","input-checkbox-Auto Ability","select-input-Ability Activation Type","slider-input-Activation Wave","slider-input-Start After Wave","slider-input-Activate Every","select-input-Enemy Type","slider-input-Only After Wave","input-checkbox-Only After Enemies Stop Spawning","slider-input-Activation Delay (seconds)","label-Once <font color=\"#4DA3FF\" weight=\"500\">Activation Wave</font> is reached, the selected unit's","label-Starting after <font color=\"#4DA3FF\" weight=\"500\">Start After Wave</font>, the ability fires e","label-When the chosen <font color=\"#4DA3FF\" weight=\"500\">Enemy Type</font> enters the unit's range (","label-When the chosen <font color=\"#4DA3FF\" weight=\"500\">Enemy Type</font> is present anywhere on th","section-container-Unit Mechanic","section-container-Dark Mage (Sovereign)","input-checkbox-Keep Lightning Magic Attack","input-checkbox-Set to First on the Final Wave","section-container-Leaderboard Helper","button-input-Open Tournament UI","section-container-Hit Replace","input-checkbox-Auto Hit Replace","select-input-Auto Upgrade while Inactive","select-input-Detection Method","slider-input-Sell Delay after Max Upgrade","slider-input-Start after Wave","button-input-Set Placement Position","label-Selected Unit: Elf Mage (Unleashed)\
Position (School Grounds): 3088.0, 1798.9, 3352.3\
Status: ","section-container-Rewind Loop","input-checkbox-Auto Rewind Loop","slider-input-Delay between Activate","section-container-Performance","input-checkbox-Delete Map","input-checkbox-Delete Enemies","input-checkbox-Boost FPS","input-checkbox-Black Screen","pageContainer-Auto Play","section-container-Auto Play","input-checkbox-Auto Play","section-container-Placement Manage (Unit Config)","section-container-Place Order","label-Place the units in the order you set\
Will prioritize placing the lowest number first\
Do not se","slider-input-Place Order for Slot 1","slider-input-Place Order for Slot 2","slider-input-Place Order for Slot 3","slider-input-Place Order for Slot 4","slider-input-Place Order for Slot 5","slider-input-Place Order for Slot 6","section-container-Place Wave","label-Only start placing the units after the set wave\
- Set to 0 will always place units","slider-input-Place Wave for Slot 1","slider-input-Place Wave for Slot 2","slider-input-Place Wave for Slot 3","slider-input-Place Wave for Slot 4","slider-input-Place Wave for Slot 5","slider-input-Place Wave for Slot 6","section-container-Place Limit","label-Only place the set amount of units for each slot\
- Set to 1 (or higher) will place the unit on","slider-input-Place Limit for Slot 1","slider-input-Place Limit for Slot 2","slider-input-Place Limit for Slot 3","slider-input-Place Limit for Slot 4","slider-input-Place Limit for Slot 5","slider-input-Place Limit for Slot 6","select-input-Ignore Place Unit","section-container-Placement Position (Set Pos)","label-Set position for each slot to place specific units\
Will set the location based on where you ar","label-Current Map: detecting...","button-input-Set Slot Position","button-input-Mass Set Slot Position","section-container-Position Manage (Reset Pos)","section-container-Challenge","section-container-Event","section-container-Expedition","section-container-Infinite","section-container-Mastery","section-container-Raid","section-container-Spirit City (Act 1)","section-container-Spirit City (Act 2)","section-container-Spirit City (Act 3)","section-container-Story","section-container-Unit Trial","section-container-Crimson's Trial","section-container-Lady Giant's Trial","section-container-String Demon's Trial","section-container-Elf Mage's Trial","section-container-Hollow's Trial","section-container-Puppet's Trial","section-container-True Saint's Trial","section-container-Reaper's Trial","section-container-Salmon Sorcerer's Trial","section-container-8th Sword's Trial","section-container-Flame Emperor's Trial","section-container-Cursed Student's Trial","section-container-Villain Invasion","section-container-Crow Hideout (Act 1)","section-container-Crow Hideout (Act 2)","section-container-Crow Hideout (Act 3)","section-container-Crow Hideout (Crow)","section-container-Auto Upgrade","input-checkbox-Auto Upgrade","section-container-Upgrade Manage","section-container-Upgrade Limit","label-Only upgrade the set amount of the Unit's Slot.\
- Set to 1 (or higher) to only upgrade the uni","slider-input-Upgrade Limit for Slot 1","slider-input-Upgrade Limit for Slot 2","slider-input-Upgrade Limit for Slot 3","slider-input-Upgrade Limit for Slot 4","slider-input-Upgrade Limit for Slot 5","slider-input-Upgrade Limit for Slot 6","input-checkbox-Upgrade and Place","input-checkbox-Focus on Farm","select-input-Upgrade Method","section-container-Upgrade Order","label-Upgrade the units in the order you set\
Will prioritize upgrading the lowest number first (unti","slider-input-Upgrade Order for Slot 1","slider-input-Upgrade Order for Slot 2","slider-input-Upgrade Order for Slot 3","slider-input-Upgrade Order for Slot 4","slider-input-Upgrade Order for Slot 5","slider-input-Upgrade Order for Slot 6","pageContainer-Macro","section-container-Manage","select-input-Select Macro","fairykingchallenge","kingtombchallenge","schoolgroundschallenge","kaitun_salmonsorcerer","unbound_full_auto_1","kaitun_spiritact1","123123","rosekindomchallenge","unbound_full_auto_1.bak","expedit","kaitun_spiritact2","kaitun_kingtomb","flowwerforestchallenge","kaitun_puppet","kaitun_spiritact3","kaitun_elfmage","kaitun_cursedstudent","box-input-Create Macro","button-input-Delete Selected Macro","section-container-Importer/Exporter","box-input-Import Macro","button-input-Copy Macro json to Clipboard","button-input-Send Macro json via Webhook","button-input-Check Macro's Unit","button-input-Equip Macro's Units","input-checkbox-Auto Equip Macro's Units","button-input-Copy Hotbar stats to Clipboard","section-container-Macro","input-checkbox-Play Macro","input-checkbox-Record Macro","section-container-Anti Boredom","button-input-Add Goon Corner","box-input-Goon Corner URL","section-container-Play Macro Config","input-checkbox-Ignore Timing","input-checkbox-No Ignore Sell Timing","slider-input-Macro Retry Limit","section-container-Information","label-Select a macro below for a specific game mode\
If you enable Play Macro and Auto Play at the sa","section-container-Select Challenge Macro","section-container-Select Event Macro","section-container-Select Expedition Macro","section-container-Select Infinite Macro","section-container-Select Mastery Macro","section-container-Select Raid Macro","select-input-Spirit City (Act 1)","select-input-Spirit City (Act 2)","select-input-Spirit City (Act 3)","section-container-Select Story Macro","section-container-Select Unit Trial Macro","select-input-Crimson's Trial","select-input-Lady Giant's Trial","select-input-String Demon's Trial","select-input-Elf Mage's Trial","select-input-Hollow's Trial","select-input-Puppet's Trial","select-input-True Saint's Trial","select-input-Reaper's Trial","select-input-Salmon Sorcerer's Trial","select-input-8th Sword's Trial","select-input-Flame Emperor's Trial","select-input-Cursed Student's Trial","section-container-Select Villain Invasion Macro","select-input-Crow Hideout (Act 1)","select-input-Crow Hideout (Act 2)","select-input-Crow Hideout (Act 3)","select-input-Crow Hideout (Crow)","pageContainer-Webhook","section-container-Setting","box-input-Webhook URL","box-input-Mention ID","button-input-Test Webhook","section-container-Notification","input-checkbox-Unit Summoned","input-checkbox-Stage Finished","pageContainer-Misc","input-checkbox-Teleport to Lobby if have Players","input-checkbox-Disable Auto Teleport AFK Chamber","section-container-Secure","input-checkbox-Random Offset","input-checkbox-Walk Around","section-container-Informations","label-No script action is playing","sider-layout","menu-root","menu-root-corner","menu-content","menu-root-list-layout","menu-child-Lobby","menu-child-Joiner","menu-child-Game","menu-child-Auto Play","menu-child-Macro","menu-child-Webhook","menu-child-Misc","menu-root-title","setting-root","setting-root-corner","setting-btn","setting-ico","setting-text","search-root","search-holder","search-root-corner","search-close-btn","search-container","search-container-list-layout","Script is being loaded, pleased wait...","Script is being loaded, pleased wait...-holder","Script is being loaded, pleased wait...-holder-corner","Script is being loaded, pleased wait...-title-frame","Script is being loaded, pleased wait...-page","Script is being loaded, pleased wait...-page-gap","Script is being loaded, pleased wait...-section","Script is being loaded, pleased wait...-section-gap","Script is being loaded, pleased wait...-title","Script is being loaded, pleased wait...-btn","Auto Rejoin","Auto Rejoin-holder","Auto Rejoin-holder-corner","Auto Rejoin-desc","Auto Rejoin-title-frame","Auto Rejoin-page","Auto Rejoin-page-gap","Auto Rejoin-section","Auto Rejoin-section-gap","Auto Rejoin-title","Auto Rejoin-btn","Rejoin Ping Freeze","Rejoin Ping Freeze-holder","Rejoin Ping Freeze-holder-corner","Rejoin Ping Freeze-desc","Rejoin Ping Freeze-title-frame","Rejoin Ping Freeze-page","Rejoin Ping Freeze-page-gap","Rejoin Ping Freeze-section","Rejoin Ping Freeze-section-gap","Rejoin Ping Freeze-title","Rejoin Ping Freeze-btn","Auto Execute on Teleport","Auto Execute on Teleport-holder","Auto Execute on Teleport-holder-corner","Auto Execute on Teleport-desc","Auto Execute on Teleport-title-frame","Auto Execute on Teleport-page","Auto Execute on Teleport-page-gap","Auto Execute on Teleport-section","Auto Execute on Teleport-section-gap","Auto Execute on Teleport-title","Auto Execute on Teleport-btn","Toggle UI","Toggle UI-holder","Toggle UI-holder-corner","Toggle UI-desc","Toggle UI-title-frame","Toggle UI-page","Toggle UI-page-gap","Toggle UI-section","Toggle UI-section-gap","Toggle UI-title","Toggle UI-btn","Display Toggle UI Button (Mobile)","Display Toggle UI Button (Mobile)-holder","Display Toggle UI Button (Mobile)-holder-corner","Display Toggle UI Button (Mobile)-desc","Display Toggle UI Button (Mobile)-title-frame","Display Toggle UI Button (Mobile)-page","Display Toggle UI Button (Mobile)-page-gap","Display Toggle UI Button (Mobile)-section","Display Toggle UI Button (Mobile)-section-gap","Display Toggle UI Button (Mobile)-title","Display Toggle UI Button (Mobile)-btn","Config Export","Config Export-holder","Config Export-holder-corner","Config Export-title-frame","Config Export-page","Config Export-page-gap","Config Export-section","Config Export-section-gap","Config Export-title","Config Export-btn","Config Import","Config Import-holder","Config Import-holder-corner","Config Import-title-frame","Config Import-page","Config Import-page-gap","Config Import-section","Config Import-section-gap","Config Import-title","Config Import-btn","Reset Script Config","Reset Script Config-holder","Reset Script Config-holder-corner","Reset Script Config-desc","Reset Script Config-title-frame","Reset Script Config-page","Reset Script Config-page-gap","Reset Script Config-section","Reset Script Config-section-gap","Reset Script Config-title","Reset Script Config-btn","Time Remain: <font color=\"rgb(135, 135, 135)\" weight=\"500\">None</font>","Time Remain: <font color=\"rgb(135, 135, 135)\" weight=\"500\">None</font>-holder","Time Remain: <font color=\"rgb(135, 135, 135)\" weight=\"500\">None</font>-holder-corner","Time Remain: <font color=\"rgb(135, 135, 135)\" weight=\"500\">None</font>-title-frame","Time Remain: <font color=\"rgb(135, 135, 135)\" weight=\"500\">None</font>-page","Time Remain: <font color=\"rgb(135, 135, 135)\" weight=\"500\">None</font>-page-gap","Time Remain: <font color=\"rgb(135, 135, 135)\" weight=\"500\">None</font>-section","Time Remain: <font color=\"rgb(135, 135, 135)\" weight=\"500\">None</font>-section-gap","Time Remain: <font color=\"rgb(135, 135, 135)\" weight=\"500\">None</font>-title","Time Remain: <font color=\"rgb(135, 135, 135)\" weight=\"500\">None</font>-btn","Delete Saved Whitelist Key","Delete Saved Whitelist Key-holder","Delete Saved Whitelist Key-holder-corner","Delete Saved Whitelist Key-desc","Delete Saved Whitelist Key-title-frame","Delete Saved Whitelist Key-page","Delete Saved Whitelist Key-page-gap","Delete Saved Whitelist Key-section","Delete Saved Whitelist Key-section-gap","Delete Saved Whitelist Key-title","Delete Saved Whitelist Key-btn","Auto Redeem Code","Auto Redeem Code-holder","Auto Redeem Code-holder-corner","Auto Redeem Code-desc","Auto Redeem Code-title-frame","Auto Redeem Code-page","Auto Redeem Code-page-gap","Auto Redeem Code-section","Auto Redeem Code-section-gap","Auto Redeem Code-title","Auto Redeem Code-btn","Auto Craft Sprite","Auto Craft Sprite-holder","Auto Craft Sprite-holder-corner","Auto Craft Sprite-desc","Auto Craft Sprite-title-frame","Auto Craft Sprite-page","Auto Craft Sprite-page-gap","Auto Craft Sprite-section","Auto Craft Sprite-section-gap","Auto Craft Sprite-title","Auto Craft Sprite-btn","Select Sprite","Select Sprite-holder","Select Sprite-holder-corner","Select Sprite-desc","Select Sprite-title-frame","Select Sprite-page","Select Sprite-page-gap","Select Sprite-section","Select Sprite-section-gap","Select Sprite-title","Select Sprite-btn","Sprite Limit","Sprite Limit-holder","Sprite Limit-holder-corner","Sprite Limit-title-frame","Sprite Limit-page","Sprite Limit-page-gap","Sprite Limit-section","Sprite Limit-section-gap","Sprite Limit-title","Sprite Limit-btn","Auto Claim Quest","Auto Claim Quest-holder","Auto Claim Quest-holder-corner","Auto Claim Quest-desc","Auto Claim Quest-title-frame","Auto Claim Quest-page","Auto Claim Quest-page-gap","Auto Claim Quest-section","Auto Claim Quest-section-gap","Auto Claim Quest-title","Auto Claim Quest-btn","Auto Claim Quest Board","Auto Claim Quest Board-holder","Auto Claim Quest Board-holder-corner","Auto Claim Quest Board-desc","Auto Claim Quest Board-title-frame","Auto Claim Quest Board-page","Auto Claim Quest Board-page-gap","Auto Claim Quest Board-section","Auto Claim Quest Board-section-gap","Auto Claim Quest Board-title","Auto Claim Quest Board-btn","Auto Claim Battlepass","Auto Claim Battlepass-holder","Auto Claim Battlepass-holder-corner","Auto Claim Battlepass-title-frame","Auto Claim Battlepass-page","Auto Claim Battlepass-page-gap","Auto Claim Battlepass-section","Auto Claim Battlepass-section-gap","Auto Claim Battlepass-title","Auto Claim Battlepass-btn","Auto Claim Level Milestone","Auto Claim Level Milestone-holder","Auto Claim Level Milestone-holder-corner","Auto Claim Level Milestone-title-frame","Auto Claim Level Milestone-page","Auto Claim Level Milestone-page-gap","Auto Claim Level Milestone-section","Auto Claim Level Milestone-section-gap","Auto Claim Level Milestone-title","Auto Claim Level Milestone-btn","Auto Claim Index","Auto Claim Index-holder","Auto Claim Index-holder-corner","Auto Claim Index-title-frame","Auto Claim Index-page","Auto Claim Index-page-gap","Auto Claim Index-section","Auto Claim Index-section-gap","Auto Claim Index-title","Auto Claim Index-btn","Auto Claim Event","Auto Claim Event-holder","Auto Claim Event-holder-corner","Auto Claim Event-desc","Auto Claim Event-title-frame","Auto Claim Event-page","Auto Claim Event-page-gap","Auto Claim Event-section","Auto Claim Event-section-gap","Auto Claim Event-title","Auto Claim Event-btn","Auto Claim Calendar","Auto Claim Calendar-holder","Auto Claim Calendar-holder-corner","Auto Claim Calendar-desc","Auto Claim Calendar-title-frame","Auto Claim Calendar-page","Auto Claim Calendar-page-gap","Auto Claim Calendar-section","Auto Claim Calendar-section-gap","Auto Claim Calendar-title","Auto Claim Calendar-btn","Enable all Auto Claim","Enable all Auto Claim-holder","Enable all Auto Claim-holder-corner","Enable all Auto Claim-desc","Enable all Auto Claim-title-frame","Enable all Auto Claim-page","Enable all Auto Claim-page-gap","Enable all Auto Claim-section","Enable all Auto Claim-section-gap","Enable all Auto Claim-title","Enable all Auto Claim-btn","Gold Shop","Gold Shop-holder","Gold Shop-holder-corner","Gold Shop-title-frame","Gold Shop-page","Gold Shop-page-gap","Gold Shop-section","Gold Shop-section-gap","Gold Shop-title","Gold Shop-btn","Event Shop","Event Shop-holder","Event Shop-holder-corner","Event Shop-title-frame","Event Shop-page","Event Shop-page-gap","Event Shop-section","Event Shop-section-gap","Event Shop-title","Event Shop-btn","Expedition Shop","Expedition Shop-holder","Expedition Shop-holder-corner","Expedition Shop-title-frame","Expedition Shop-page","Expedition Shop-page-gap","Expedition Shop-section","Expedition Shop-section-gap","Expedition Shop-title","Expedition Shop-btn","Raid General Shop","Raid General Shop-holder","Raid General Shop-holder-corner","Raid General Shop-title-frame","Raid General Shop-page","Raid General Shop-page-gap","Raid General Shop-section","Raid General Shop-section-gap","Raid General Shop-title","Raid General Shop-btn","Wandering Trader","Wandering Trader-holder","Wandering Trader-holder-corner","Wandering Trader-title-frame","Wandering Trader-page","Wandering Trader-page-gap","Wandering Trader-section","Wandering Trader-section-gap","Wandering Trader-title","Wandering Trader-btn","Auto Construct","Auto Construct-holder","Auto Construct-holder-corner","Auto Construct-title-frame","Auto Construct-page","Auto Construct-page-gap","Auto Construct-section","Auto Construct-section-gap","Auto Construct-title","Auto Construct-btn","Auto Upgrade Building","Auto Upgrade Building-holder","Auto Upgrade Building-holder-corner","Auto Upgrade Building-title-frame","Auto Upgrade Building-page","Auto Upgrade Building-page-gap","Auto Upgrade Building-section","Auto Upgrade Building-section-gap","Auto Upgrade Building-title","Auto Upgrade Building-btn","Resource Drill","Resource Drill-holder","Resource Drill-holder-corner","Resource Drill-title-frame","Resource Drill-page","Resource Drill-page-gap","Resource Drill-section","Resource Drill-section-gap","Resource Drill-title","Resource Drill-btn","Gold Mine","Gold Mine-holder","Gold Mine-holder-corner","Gold Mine-title-frame","Gold Mine-page","Gold Mine-page-gap","Gold Mine-section","Gold Mine-section-gap","Gold Mine-title","Gold Mine-btn","Research Lab","Research Lab-holder","Research Lab-holder-corner","Research Lab-title-frame","Research Lab-page","Research Lab-page-gap","Research Lab-section","Research Lab-section-gap","Research Lab-title","Research Lab-btn","Training Grounds","Training Grounds-holder","Training Grounds-holder-corner","Training Grounds-title-frame","Training Grounds-page","Training Grounds-page-gap","Training Grounds-section","Training Grounds-section-gap","Training Grounds-title","Training Grounds-btn","Bulk Select","Bulk Select-holder","Bulk Select-holder-corner","Bulk Select-title-frame","Bulk Select-page","Bulk Select-page-gap","Bulk Select-section","Bulk Select-section-gap","Bulk Select-title","Bulk Select-btn","VillainInvasion","VillainInvasion-holder","VillainInvasion-holder-corner","VillainInvasion-title-frame","VillainInvasion-page","VillainInvasion-page-gap","VillainInvasion-section","VillainInvasion-section-gap","VillainInvasion-title","VillainInvasion-btn","Standard","Standard-holder","Standard-holder-corner","Standard-title-frame","Standard-page","Standard-page-gap","Standard-section","Standard-section-gap","Standard-title","Standard-btn","Mini","Mini-holder","Mini-holder-corner","Mini-title-frame","Mini-page","Mini-page-gap","Mini-section","Mini-section-gap","Mini-title","Mini-btn","Disable Auto Joiners","Disable Auto Joiners-holder","Disable Auto Joiners-holder-corner","Disable Auto Joiners-desc","Disable Auto Joiners-title-frame","Disable Auto Joiners-page","Disable Auto Joiners-page-gap","Disable Auto Joiners-section","Disable Auto Joiners-section-gap","Disable Auto Joiners-title","Disable Auto Joiners-btn","Joiner Cooldown","Joiner Cooldown-holder","Joiner Cooldown-holder-corner","Joiner Cooldown-desc","Joiner Cooldown-title-frame","Joiner Cooldown-page","Joiner Cooldown-page-gap","Joiner Cooldown-section","Joiner Cooldown-section-gap","Joiner Cooldown-title","Joiner Cooldown-btn","Auto Join Priority","Auto Join Priority-holder","Auto Join Priority-holder-corner","Auto Join Priority-desc","Auto Join Priority-title-frame","Auto Join Priority-page","Auto Join Priority-page-gap","Auto Join Priority-section","Auto Join Priority-section-gap","Auto Join Priority-title","Auto Join Priority-btn","Team Equipper","Team Equipper-holder","Team Equipper-holder-corner","Team Equipper-title-frame","Team Equipper-page","Team Equipper-page-gap","Team Equipper-section","Team Equipper-section-gap","Team Equipper-title","Team Equipper-btn","Auto Join Story","Auto Join Story-holder","Auto Join Story-holder-corner","Auto Join Story-desc","Auto Join Story-title-frame","Auto Join Story-page","Auto Join Story-page-gap","Auto Join Story-section","Auto Join Story-section-gap","Auto Join Story-title","Auto Join Story-btn","Select Difficulty","Select Difficulty-holder","Select Difficulty-holder-corner","Select Difficulty-title-frame","Select Difficulty-page","Select Difficulty-page-gap","Select Difficulty-section","Select Difficulty-section-gap","Select Difficulty-title","Select Difficulty-btn","Auto Join Raid","Auto Join Raid-holder","Auto Join Raid-holder-corner","Auto Join Raid-desc","Auto Join Raid-title-frame","Auto Join Raid-page","Auto Join Raid-page-gap","Auto Join Raid-section","Auto Join Raid-section-gap","Auto Join Raid-title","Auto Join Raid-btn","Only Join if below Raid Token","Only Join if below Raid Token-holder","Only Join if below Raid Token-holder-corner","Only Join if below Raid Token-desc","Only Join if below Raid Token-title-frame","Only Join if below Raid Token-page","Only Join if below Raid Token-page-gap","Only Join if below Raid Token-section","Only Join if below Raid Token-section-gap","Only Join if below Raid Token-title","Only Join if below Raid Token-btn","Under Raid Token","Under Raid Token-holder","Under Raid Token-holder-corner","Under Raid Token-desc","Under Raid Token-title-frame","Under Raid Token-page","Under Raid Token-page-gap","Under Raid Token-section","Under Raid Token-section-gap","Under Raid Token-title","Under Raid Token-btn","Auto Join Villain Invasion","Auto Join Villain Invasion-holder","Auto Join Villain Invasion-holder-corner","Auto Join Villain Invasion-desc","Auto Join Villain Invasion-title-frame","Auto Join Villain Invasion-page","Auto Join Villain Invasion-page-gap","Auto Join Villain Invasion-section","Auto Join Villain Invasion-section-gap","Auto Join Villain Invasion-title","Auto Join Villain Invasion-btn","Select Act-desc","Join Crow Act if Crow Relics available","Join Crow Act if Crow Relics available-holder","Join Crow Act if Crow Relics available-holder-corner","Join Crow Act if Crow Relics available-desc","Join Crow Act if Crow Relics available-title-frame","Join Crow Act if Crow Relics available-page","Join Crow Act if Crow Relics available-page-gap","Join Crow Act if Crow Relics available-section","Join Crow Act if Crow Relics available-section-gap","Join Crow Act if Crow Relics available-title","Join Crow Act if Crow Relics available-btn","Auto Open Villain Chest","Auto Open Villain Chest-holder","Auto Open Villain Chest-holder-corner","Auto Open Villain Chest-desc","Auto Open Villain Chest-title-frame","Auto Open Villain Chest-page","Auto Open Villain Chest-page-gap","Auto Open Villain Chest-section","Auto Open Villain Chest-section-gap","Auto Open Villain Chest-title","Auto Open Villain Chest-btn","Auto Join Trial","Auto Join Trial-holder","Auto Join Trial-holder-corner","Auto Join Trial-desc","Auto Join Trial-title-frame","Auto Join Trial-page","Auto Join Trial-page-gap","Auto Join Trial-section","Auto Join Trial-section-gap","Auto Join Trial-title","Auto Join Trial-btn","Select Trial","Select Trial-holder","Select Trial-holder-corner","Select Trial-desc","Select Trial-title-frame","Select Trial-page","Select Trial-page-gap","Select Trial-section","Select Trial-section-gap","Select Trial-title","Select Trial-btn","Auto Join Expedition","Auto Join Expedition-holder","Auto Join Expedition-holder-corner","Auto Join Expedition-desc","Auto Join Expedition-title-frame","Auto Join Expedition-page","Auto Join Expedition-page-gap","Auto Join Expedition-section","Auto Join Expedition-section-gap","Auto Join Expedition-title","Auto Join Expedition-btn","Select Difficulty Level","Select Difficulty Level-holder","Select Difficulty Level-holder-corner","Select Difficulty Level-desc","Select Difficulty Level-title-frame","Select Difficulty Level-page","Select Difficulty Level-page-gap","Select Difficulty Level-section","Select Difficulty Level-section-gap","Select Difficulty Level-title","Select Difficulty Level-btn","Auto Join Requirement","Auto Join Requirement-holder","Auto Join Requirement-holder-corner","Auto Join Requirement-title-frame","Auto Join Requirement-page","Auto Join Requirement-page-gap","Auto Join Requirement-section","Auto Join Requirement-section-gap","Auto Join Requirement-title","Auto Join Requirement-btn","Auto Collect Orb","Auto Collect Orb-holder","Auto Collect Orb-holder-corner","Auto Collect Orb-desc","Auto Collect Orb-title-frame","Auto Collect Orb-page","Auto Collect Orb-page-gap","Auto Collect Orb-section","Auto Collect Orb-section-gap","Auto Collect Orb-title","Auto Collect Orb-btn","Auto Continue Checkpoint","Auto Continue Checkpoint-holder","Auto Continue Checkpoint-holder-corner","Auto Continue Checkpoint-desc","Auto Continue Checkpoint-title-frame","Auto Continue Checkpoint-page","Auto Continue Checkpoint-page-gap","Auto Continue Checkpoint-section","Auto Continue Checkpoint-section-gap","Auto Continue Checkpoint-title","Auto Continue Checkpoint-btn","Auto Restart","Auto Restart-holder","Auto Restart-holder-corner","Auto Restart-title-frame","Auto Restart-page","Auto Restart-page-gap","Auto Restart-section","Auto Restart-section-gap","Auto Restart-title","Auto Restart-btn","Auto Extract","Auto Extract-holder","Auto Extract-holder-corner","Auto Extract-title-frame","Auto Extract-page","Auto Extract-page-gap","Auto Extract-section","Auto Extract-section-gap","Auto Extract-title","Auto Extract-btn","Auto Select Upgrade","Auto Select Upgrade-holder","Auto Select Upgrade-holder-corner","Auto Select Upgrade-title-frame","Auto Select Upgrade-page","Auto Select Upgrade-page-gap","Auto Select Upgrade-section","Auto Select Upgrade-section-gap","Auto Select Upgrade-title","Auto Select Upgrade-btn","Upgrade Cap-Amount (Select the card by how many time)","Upgrade Cap-Amount (Select the card by how many time)-holder","Upgrade Cap-Amount (Select the card by how many time)-holder-corner","Upgrade Cap-Amount (Select the card by how many time)-title-frame","Upgrade Cap-Amount (Select the card by how many time)-page","Upgrade Cap-Amount (Select the card by how many time)-page-gap","Upgrade Cap-Amount (Select the card by how many time)-section","Upgrade Cap-Amount (Select the card by how many time)-section-gap","Upgrade Cap-Amount (Select the card by how many time)-title","Upgrade Cap-Amount (Select the card by how many time)-btn","Auto Select Anvil Stat","Auto Select Anvil Stat-holder","Auto Select Anvil Stat-holder-corner","Auto Select Anvil Stat-title-frame","Auto Select Anvil Stat-page","Auto Select Anvil Stat-page-gap","Auto Select Anvil Stat-section","Auto Select Anvil Stat-section-gap","Auto Select Anvil Stat-title","Auto Select Anvil Stat-btn","Anvil Stat Cap-Amount (Select the card by how many time)","Anvil Stat Cap-Amount (Select the card by how many time)-holder","Anvil Stat Cap-Amount (Select the card by how many time)-holder-corner","Anvil Stat Cap-Amount (Select the card by how many time)-title-frame","Anvil Stat Cap-Amount (Select the card by how many time)-page","Anvil Stat Cap-Amount (Select the card by how many time)-page-gap","Anvil Stat Cap-Amount (Select the card by how many time)-section","Anvil Stat Cap-Amount (Select the card by how many time)-section-gap","Anvil Stat Cap-Amount (Select the card by how many time)-title","Anvil Stat Cap-Amount (Select the card by how many time)-btn","Auto Expedition Map Route","Auto Expedition Map Route-holder","Auto Expedition Map Route-holder-corner","Auto Expedition Map Route-title-frame","Auto Expedition Map Route-page","Auto Expedition Map Route-page-gap","Auto Expedition Map Route-section","Auto Expedition Map Route-section-gap","Auto Expedition Map Route-title","Auto Expedition Map Route-btn","Auto Restart Reward","Auto Restart Reward-holder","Auto Restart Reward-holder-corner","Auto Restart Reward-title-frame","Auto Restart Reward-page","Auto Restart Reward-page-gap","Auto Restart Reward-section","Auto Restart Reward-section-gap","Auto Restart Reward-title","Auto Restart Reward-btn","Expedition Auto Play","Expedition Auto Play-holder","Expedition Auto Play-holder-corner","Expedition Auto Play-title-frame","Expedition Auto Play-page","Expedition Auto Play-page-gap","Expedition Auto Play-section","Expedition Auto Play-section-gap","Expedition Auto Play-title","Expedition Auto Play-btn","Auto Play Config","Auto Play Config-holder","Auto Play Config-holder-corner","Auto Play Config-title-frame","Auto Play Config-page","Auto Play Config-page-gap","Auto Play Config-section","Auto Play Config-section-gap","Auto Play Config-title","Auto Play Config-btn","Payload","Payload-holder","Payload-holder-corner","Payload-title-frame","Payload-page","Payload-page-gap","Payload-section","Payload-section-gap","Payload-title","Payload-btn","Lane","Lane-holder","Lane-holder-corner","Lane-title-frame","Lane-page","Lane-page-gap","Lane-section","Lane-section-gap","Lane-title","Lane-btn","Auto Hire Unit","Auto Hire Unit-holder","Auto Hire Unit-holder-corner","Auto Hire Unit-title-frame","Auto Hire Unit-page","Auto Hire Unit-page-gap","Auto Hire Unit-section","Auto Hire Unit-section-gap","Auto Hire Unit-title","Auto Hire Unit-btn","Auto Checkpoint Shop","Auto Checkpoint Shop-holder","Auto Checkpoint Shop-holder-corner","Auto Checkpoint Shop-title-frame","Auto Checkpoint Shop-page","Auto Checkpoint Shop-page-gap","Auto Checkpoint Shop-section","Auto Checkpoint Shop-section-gap","Auto Checkpoint Shop-title","Auto Checkpoint Shop-btn","Auto Use Tome","Auto Use Tome-holder","Auto Use Tome-holder-corner","Auto Use Tome-title-frame","Auto Use Tome-page","Auto Use Tome-page-gap","Auto Use Tome-section","Auto Use Tome-section-gap","Auto Use Tome-title","Auto Use Tome-btn","Auto Repair","Auto Repair-holder","Auto Repair-holder-corner","Auto Repair-title-frame","Auto Repair-page","Auto Repair-page-gap","Auto Repair-section","Auto Repair-section-gap","Auto Repair-title","Auto Repair-btn","Expedition Failsafe","Expedition Failsafe-holder","Expedition Failsafe-holder-corner","Expedition Failsafe-title-frame","Expedition Failsafe-page","Expedition Failsafe-page-gap","Expedition Failsafe-section","Expedition Failsafe-section-gap","Expedition Failsafe-title","Expedition Failsafe-btn","Auto Join Regular Challenge","Auto Join Regular Challenge-holder","Auto Join Regular Challenge-holder-corner","Auto Join Regular Challenge-desc","Auto Join Regular Challenge-title-frame","Auto Join Regular Challenge-page","Auto Join Regular Challenge-page-gap","Auto Join Regular Challenge-section","Auto Join Regular Challenge-section-gap","Auto Join Regular Challenge-title","Auto Join Regular Challenge-btn","Auto Join Daily Challenge","Auto Join Daily Challenge-holder","Auto Join Daily Challenge-holder-corner","Auto Join Daily Challenge-desc","Auto Join Daily Challenge-title-frame","Auto Join Daily Challenge-page","Auto Join Daily Challenge-page-gap","Auto Join Daily Challenge-section","Auto Join Daily Challenge-section-gap","Auto Join Daily Challenge-title","Auto Join Daily Challenge-btn","Auto Join Weekly Challenge","Auto Join Weekly Challenge-holder","Auto Join Weekly Challenge-holder-corner","Auto Join Weekly Challenge-desc","Auto Join Weekly Challenge-title-frame","Auto Join Weekly Challenge-page","Auto Join Weekly Challenge-page-gap","Auto Join Weekly Challenge-section","Auto Join Weekly Challenge-section-gap","Auto Join Weekly Challenge-title","Auto Join Weekly Challenge-btn","Select Reward","Select Reward-holder","Select Reward-holder-corner","Select Reward-desc","Select Reward-title-frame","Select Reward-page","Select Reward-page-gap","Select Reward-section","Select Reward-section-gap","Select Reward-title","Select Reward-btn","Change Gamemode If new Challenge","Change Gamemode If new Challenge-holder","Change Gamemode If new Challenge-holder-corner","Change Gamemode If new Challenge-desc","Change Gamemode If new Challenge-title-frame","Change Gamemode If new Challenge-page","Change Gamemode If new Challenge-page-gap","Change Gamemode If new Challenge-section","Change Gamemode If new Challenge-section-gap","Change Gamemode If new Challenge-title","Change Gamemode If new Challenge-btn","Auto Join Bounty Board","Auto Join Bounty Board-holder","Auto Join Bounty Board-holder-corner","Auto Join Bounty Board-desc","Auto Join Bounty Board-title-frame","Auto Join Bounty Board-page","Auto Join Bounty Board-page-gap","Auto Join Bounty Board-section","Auto Join Bounty Board-section-gap","Auto Join Bounty Board-title","Auto Join Bounty Board-btn","search-arrow-drop-up","resize-btn","resize-btn-ico","UIAspectRatioConstraint","Nousigi Hub GUI [ETC]","btn-hide","btn-hide-bg","btn-hide-bg-corner","img-hide","message-holder","message-list-layout","notification-holder-top","notification-holder-bottom","modal-holder","modal-backdrop","Nousigi Hub GUI [EFFECT]"}
local P_ = {
{CornerRadius=D(0,4)},
{HorizontalAlignment=E("HorizontalAlignment","Center"),SortOrder=E("SortOrder","LayoutOrder"),Padding=D(0,5)},
{Size=U(1,0,0,10),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y")},
{},
{Size=U(1,-5,1,0),Position=U(0,5,0,0),BackgroundTransparency=1},
{Size=U(1,0,1,6),BackgroundTransparency=1},
{Size=U(1,-10,0,0),AnchorPoint=V(0.5,0.5),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y")},
{Color=C(255,255,255),Transparency=0.5},
{CornerRadius=D(1,0)},
{Size=U(1,0,1,6),BackgroundTransparency=1,Text=""},
{Size=U(1,-10,0,5),Position=U(0,5,0,-5),BackgroundColor3=C(38,38,38),BorderSizePixel=0},
{Size=U(0,4,0,13),Position=U(0,5,0,-9),BackgroundColor3=C(38,38,38),BorderSizePixel=0},
{Size=U(0,4,0,13),Position=U(1,-9,0,-9),BackgroundColor3=C(38,38,38),BorderSizePixel=0},
{Size=U(1,-4,1,-4),Position=U(0.5,0,0.5,0),AnchorPoint=V(0.5,0.5),BackgroundTransparency=1,Image="rbxassetid://10709791437"},
{CornerRadius=D(0,2)},
{Size=U(1,-15,0,20),Position=U(0,5,0,0),BackgroundColor3=C(38,38,38)},
{Size=U(0,70,0,14),Position=U(1,-3,0,3),AnchorPoint=V(1,0),BackgroundColor3=C(20,20,20)},
{Color=C(255,255,255),Thickness=0.7},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text=""},
{FillDirection=E("FillDirection","Horizontal"),VerticalAlignment=E("VerticalAlignment","Center"),SortOrder=E("SortOrder","LayoutOrder"),Padding=D(0,5)},
{Transparency=NS{{0,0.25,0},{0.5,0.25,0},{1,1,0}}},
{HorizontalAlignment=E("HorizontalAlignment","Center")},
{Size=U(1,-20,0,25),BackgroundColor3=C(20,20,20)},
{Size=U(1,-35,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,ClipsDescendants=true},
{Size=U(1,0,1,-10),Position=U(0,0,0,5),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=U(0,0,0,0),AutomaticCanvasSize=E("AutomaticSize","Y"),ScrollBarThickness=5,ScrollingDirection=E("ScrollingDirection","Y"),TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png"},
{Size=U(1,-10,1,15),Position=U(0,5,0,0),BackgroundColor3=C(38,38,38),AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,25,0,25),Position=U(1,0,0,0),AnchorPoint=V(1,0),BackgroundTransparency=1,Image="rbxassetid://8445471499",ImageRectOffset=V(904,404),ImageRectSize=V(96,96)},
{Size=U(1,-10,0,25),BackgroundTransparency=1,LayoutOrder=1},
{Size=U(1,-10,1,15),Position=U(0,5,0,0),BackgroundColor3=C(38,38,38)},
{Size=U(0,20,0,20),Position=U(0,5,0.5,0),AnchorPoint=V(0,0.5),BackgroundColor3=C(30,30,30)},
{Size=U(1,6,1,6),Position=U(0.5,0,0.5,0),AnchorPoint=V(0.5,0.5),Rotation=-90,BackgroundTransparency=1,Image="rbxassetid://8445471499",ImageRectOffset=V(904,404),ImageRectSize=V(96,96)},
{Size=U(1,-10,0,27),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{HorizontalAlignment=E("HorizontalAlignment","Center"),VerticalAlignment=E("VerticalAlignment","Center"),SortOrder=E("SortOrder","LayoutOrder")},
{Size=U(1,-70,0,6),Position=U(0,5,0.5,0),AnchorPoint=V(0,0.5),BackgroundColor3=C(20,20,20),ClipsDescendants=true},
{Size=U(0,60,0,25),Position=U(1,0,0.5,0),AnchorPoint=V(1,0.5),BackgroundColor3=C(20,20,20),ClipsDescendants=true},
{Size=U(1,-10,0,0),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,0,1,6),BackgroundColor3=C(38,38,38)},
{Size=U(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://8445471173",ImageRectOffset=V(504,604),ImageRectSize=V(96,96)},
{Size=U(0,25,0,25),Position=U(1,-5,0.5,3),AnchorPoint=V(1,0.5),BackgroundColor3=C(20,20,20)},
{Size=U(1,-8,1,-8),Position=U(0.5,0,0.5,0),AnchorPoint=V(0.5,0.5),BackgroundColor3=C(131,181,255),GroupTransparency=1},
{Size=U(0,5,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BackgroundTransparency=0.25,BorderSizePixel=0,LayoutOrder=1},
{Size=U(1,-5,1,6),Position=U(0,5,0,0),BackgroundColor3=C(44,44,44),BackgroundTransparency=0.3,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,25,0,25),Position=U(1,-10,0.5,0),AnchorPoint=V(1,0.5),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://8445470826",ImageRectOffset=V(504,104),ImageRectSize=V(96,96)},
{FillDirection=E("FillDirection","Horizontal"),VerticalAlignment=E("VerticalAlignment","Center"),SortOrder=E("SortOrder","LayoutOrder")},
{Size=U(0,16,0,16),BackgroundTransparency=1,LayoutOrder=1},
{Size=U(0,16,0,16),BackgroundTransparency=1,LayoutOrder=3},
{Size=U(1,-10,0,24),Position=U(0,10,0,0),BackgroundTransparency=1},
{Size=U(0,25,0,25),Position=U(1,0,0.5,0),AnchorPoint=V(1,0.5),BackgroundTransparency=1,Text=""},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="0",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(1,-10,1,6),Position=U(0.5,0,0.5,3),AnchorPoint=V(0.5,0.5),BackgroundColor3=C(38,38,38)},
{Size=U(1,0,0,25),Position=U(1,0,0.5,0),AnchorPoint=V(1,0.5),BackgroundTransparency=1,Text=""},
{Size=U(1,0,0,310),Position=U(0,0,1,5),BackgroundColor3=C(20,20,20),Visible=false,GroupTransparency=1},
{Size=U(1,0,0,17),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,25),Position=U(0,10,0,0),BackgroundTransparency=1},
{Size=U(1,-45,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,ClipsDescendants=true},
{Size=U(0,5,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BackgroundTransparency=0.25,BorderSizePixel=0,LayoutOrder=1},
{Size=U(1,0,0,190),Position=U(0,0,1,5),BackgroundColor3=C(20,20,20),Visible=false,GroupTransparency=1},
{Size=U(1,-45,0,20),Position=U(0,10,0,5),BackgroundTransparency=1,ClipsDescendants=true},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Slot 1 Position: No Position\
Slot 2 Position: No Position\
Slot 3 Position: No Position\
Slot 4 Position: No Position\
Slot 5 Position: No Position\
Slot 6 Position: No Position",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Reset Position",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Reset the Position of the selected Slot",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Reset Position",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","X"),Text="<font color=\"#83b5ff\">Joiner</font>",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{HorizontalAlignment=E("HorizontalAlignment","Center"),VerticalAlignment=E("VerticalAlignment","Center")},
{Size=U(1,-10,0,25),BackgroundColor3=C(131,181,255)},
{Size=U(0,17,0,17),Position=U(0,0,0.5,0),AnchorPoint=V(0,0.5),BackgroundTransparency=1},
{Size=U(1,0,1,0),Position=U(0.5,0,0.5,0),AnchorPoint=V(0.5,0.5),BackgroundTransparency=1,Image="rbxassetid://12974400533"},
{Size=U(0.5,2,0,0),Position=U(0.5,-2,0,0),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,20,0,20),Position=U(0,5,0.5,0),AnchorPoint=V(0,0.5),BackgroundColor3=C(30,30,30),LayoutOrder=4},
{Size=U(1,-4,1,-4),Position=U(0.5,0,0.5,0),AnchorPoint=V(0.5,0.5),BackgroundTransparency=1,Image="rbxassetid://10734943674"},
{Size=U(1,0,0,0),BackgroundTransparency=1,ClipsDescendants=true},
{Size=U(1,-10,0,25),Position=U(0,5,0,2),BackgroundColor3=C(38,38,38)},
{Color=C(255,255,255),Thickness=0.5},
{Size=U(0,16,0,16),Position=U(0,0,0.5,0),AnchorPoint=V(0,0.5),BackgroundTransparency=1,Image="rbxassetid://10734943674"},
{Size=U(1,0,0,5),Position=U(0,0,0,-5),BackgroundColor3=C(38,38,38),BorderSizePixel=0},
{Size=U(0,4,0,13),Position=U(0,0,0,-9),BackgroundColor3=C(38,38,38),BorderSizePixel=0},
{Size=U(0,4,0,13),Position=U(1,-4,0,-9),BackgroundColor3=C(38,38,38),BorderSizePixel=0},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","X"),Text="<font color=\"#83b5ff\">Joiner</font>",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","X"),Text="<font color=\"#83b5ff\">Lobby</font>",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{SortOrder=E("SortOrder","LayoutOrder"),Padding=D(0,5)},
{Size=U(0.5,-7,1,15),Position=U(0,5,0,0),BackgroundColor3=C(38,38,38)},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="1",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-15,1,0),Position=U(0,20,0,0),BackgroundTransparency=1,BorderSizePixel=0,Text="Click me >.<",TextColor3=C(255,255,255),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,0,10),BackgroundTransparency=1,Visible=false,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,25),BackgroundColor3=C(255,255,255),BackgroundTransparency=1,LayoutOrder=1},
{Size=U(1,-10,0,27),BackgroundTransparency=1,ClipsDescendants=true},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="5",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-23,1,0),Position=U(0,20,0,0),BackgroundTransparency=1,BorderSizePixel=0,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Enter keywords to search features....",ClearTextOnFocus=false},
{Size=U(1,-23,1,0),Position=U(0,20,0,0),BackgroundTransparency=1,BorderSizePixel=0,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Keywords...",ClearTextOnFocus=false},
{Size=U(1,-8,1,-8),Position=U(0.5,0,0.5,0),AnchorPoint=V(0.5,0.5),BackgroundColor3=C(131,181,255)},
{Size=U(1,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="2",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="6",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="3",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="0 = disabled, 1-8 = load Team Number before joining",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Expedition Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,250),Position=U(0,0,1,5),BackgroundColor3=C(20,20,20),Visible=false,GroupTransparency=1},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="10",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="4",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-131,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","X"),Text="<font color=\"#83b5ff\">Lobby</font>",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="50",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,25,0,25),Position=U(1,0,0,0),AnchorPoint=V(1,0),BackgroundTransparency=1,Image="rbxassetid://11422141155"},
{Size=U(1,0,0,5),Position=U(0,0,1,5),AnchorPoint=V(0,1),BackgroundTransparency=1,LayoutOrder=999999,CanvasSize=U(0,0,0,0)},
{Size=U(1,0,0,20),Position=U(0,0,0,100),BackgroundTransparency=1,LayoutOrder=5},
{Size=U(1,0,0,20),Position=U(0,0,0,150),BackgroundTransparency=1,LayoutOrder=7},
{Size=U(1,0,0,20),Position=U(0,0,0,175),BackgroundTransparency=1,LayoutOrder=8},
{Size=U(1,0,0,20),Position=U(0,0,0,200),BackgroundTransparency=1,LayoutOrder=9},
{Size=U(1,0,0,20),Position=U(0,0,0,25),BackgroundTransparency=1,LayoutOrder=2},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="8",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,75),BackgroundTransparency=1,LayoutOrder=4},
{Size=U(1,0,0,20),Position=U(0,0,0,125),BackgroundTransparency=1,LayoutOrder=6},
{Size=U(1,0,0,20),Position=U(0,0,0,50),BackgroundTransparency=1,LayoutOrder=3},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="7",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),BackgroundTransparency=1,LayoutOrder=1},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="9",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Join via Matchmaking (with random players) instead of solo",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Match Making",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-15,1,0),Position=U(0,20,0,0),BackgroundTransparency=1,BorderSizePixel=0,Text="Set",TextColor3=C(255,255,255),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{HorizontalAlignment=E("HorizontalAlignment","Right"),SortOrder=E("SortOrder","LayoutOrder"),Padding=D(0,5)},
{Size=U(1,0,0,20),BackgroundTransparency=1},
{Size=U(1,-5,0,0),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","X"),Text="<font color=\"#83b5ff\">UI Setting</font>",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Join via Matchmaking (with random players) instead of solo",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Match Making",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,25),BackgroundColor3=C(20,20,20)},
{Size=U(0,20,0,20),Position=U(0,0,0.5,0),AnchorPoint=V(0,0.5),BackgroundTransparency=1,Image="rbxassetid://14187783356"},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Max amount to craft (costs 5 Grey per craft, cap 50)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Item",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Item: "},
{Size=U(1,-146,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,0,0,160),Position=U(0,0,1,5),BackgroundColor3=C(20,20,20),Visible=false,GroupTransparency=1},
{Size=U(0.5,-7,1,15),Position=U(0,5,0,0),BackgroundColor3=C(38,38,38),AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="11",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,210),Position=U(0,0,1,5),BackgroundColor3=C(20,20,20),Visible=false,GroupTransparency=1},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="12",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,225),BackgroundTransparency=1,LayoutOrder=10},
{Size=U(0.142857,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="School Grounds",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-142,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0.166667,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="School Grounds",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="School Grounds"},
{Size=U(1,-5,1,0),Position=U(0,5,0,0),BackgroundColor3=C(255,255,255),BackgroundTransparency=1},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextTransparency=0.3},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Expedition Hub",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Expedition Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Regular Challenge Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Buy",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Select items by their in-game display name.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,0,100),Position=U(0,0,1,5),BackgroundColor3=C(20,20,20),Visible=false,GroupTransparency=1},
{Size=U(1,0,0,70),Position=U(0,0,1,5),BackgroundColor3=C(20,20,20),Visible=false,GroupTransparency=1},
{Size=U(1,-119,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,0,0,17),BackgroundTransparency=1,Visible=false,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="13",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="15",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,325),BackgroundTransparency=1,LayoutOrder=14},
{Size=U(1,0,0,20),Position=U(0,0,0,250),BackgroundTransparency=1,LayoutOrder=11},
{Size=U(1,0,0,20),Position=U(0,0,0,300),BackgroundTransparency=1,LayoutOrder=13},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="14",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,350),BackgroundTransparency=1,LayoutOrder=15},
{Size=U(1,0,0,20),Position=U(0,0,0,275),BackgroundTransparency=1,LayoutOrder=12},
{Size=U(1,0,0,280),Position=U(0,0,1,5),BackgroundColor3=C(20,20,20),Visible=false,GroupTransparency=1},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Flower Forest",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-126,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Rose Kingdom",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Flower Forest",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Flower Forest"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Rose Kingdom",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Rose Kingdom"},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Auto Claimer",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Auto Shop",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Raid Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Villain Invasion Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="25",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,25,0,25),Position=U(1,-2,0.5,3),AnchorPoint=V(1,0.5),BackgroundColor3=C(20,20,20)},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Buys selected in-stock items when there is enough currency.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-112,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="16",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,375),BackgroundTransparency=1,LayoutOrder=16},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="17",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,400),BackgroundTransparency=1,LayoutOrder=17},
{Size=U(0.2,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Stage Type",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Select Stage Type: Challenge,  Event,  Expedition,  Infinite,  Mastery,  Raid,  Sandbox,  Story,  Tournament,  Tower,  Unit Trial,  Villain Invasion",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Fairy King Forest",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="King's Tomb",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Fairy King Forest",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Fairy King Forest"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="King's Tomb",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="King's Tomb"},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Daily Challenge Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Weekly Challenge Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,-10),Position=U(0.5,0,0.5,0),AnchorPoint=V(0.5,0.5),BackgroundTransparency=1},
{Size=U(1,-66,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,0,0,220),Position=U(0,0,1,5),BackgroundColor3=C(20,20,20),Visible=false,GroupTransparency=1},
{Size=U(1,-136,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-129,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Summons only while a selected Mythic unit is the banner's featured main unit.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Summon Unit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Select obtainable Mythic units. Summoning starts when one is the featured main unit.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Summon Unit: "},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Unselects a target from this banner after that unit is summoned.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Unselect if Summoned",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="While in a match, instantly returns to the lobby when a selected unit is featured and at least 50 summons are affordable.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Teleport Lobby if in Banner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Auto Sell Rarity",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Synchronizes AE's normal and shiny auto-sell settings for this banner.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-135,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Map",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Map"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Act",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Select Act: Act 1",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Value="Act 1"},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="100",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-168,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,0,0,20),Position=U(0,0,0,600),BackgroundTransparency=1,LayoutOrder=25},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>16</b>. [Epic] Terra Penetration",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,675),BackgroundTransparency=1,LayoutOrder=28},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>13</b>. [Rare] Dark Mastery",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,625),BackgroundTransparency=1,LayoutOrder=26},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>15</b>. [Epic] Vital Strikes",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,700),BackgroundTransparency=1,LayoutOrder=29},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>12</b>. [Rare] Flame Mastery",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,800),BackgroundTransparency=1,LayoutOrder=33},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>8</b>. [Rare] Iron Flesh",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,750),BackgroundTransparency=1,LayoutOrder=31},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>10</b>. [Rare] Gale Mastery",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="27",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>27</b>. [Epic] Dark Penetration",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="38",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>38</b>. [Mythic] Infectious",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>25</b>. [Epic] Flame Penetration",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="30",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>30</b>. [Legendary] Martyr's Blast",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,500),BackgroundTransparency=1,LayoutOrder=21},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="20",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>20</b>. [Epic] Neutral Penetration",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,950),BackgroundTransparency=1,LayoutOrder=39},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>2</b>. [Rare] Venomous Edge",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,475),BackgroundTransparency=1,LayoutOrder=20},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="21",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>21</b>. [Epic] Lingering Rot",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="33",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>33</b>. [Legendary] Bounty Hunter",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,550),BackgroundTransparency=1,LayoutOrder=23},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="18",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>18</b>. [Epic] Quickened Blade",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="35",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>35</b>. [Mythic] Whetstone Cache",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,775),BackgroundTransparency=1,LayoutOrder=32},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>9</b>. [Rare] Hydro Mastery",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,725),BackgroundTransparency=1,LayoutOrder=30},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>11</b>. [Rare] Fortified Cargo",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,575),BackgroundTransparency=1,LayoutOrder=24},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>17</b>. [Epic] Storm Penetration",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="40",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>40</b>. [Mythic] EXP Collector",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="24",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>24</b>. [Epic] Gale Penetration",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,900),BackgroundTransparency=1,LayoutOrder=37},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>4</b>. [Rare] Storm Mastery",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,875),BackgroundTransparency=1,LayoutOrder=36},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>5</b>. [Rare] Relentless Pursuit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="36",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>36</b>. [Mythic] Momentum",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,975),BackgroundTransparency=1,LayoutOrder=40},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>1</b>. [Rare] Yen Hunger",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="37",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>37</b>. [Mythic] Missile Protocol",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,425),BackgroundTransparency=1,LayoutOrder=18},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="23",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>23</b>. [Epic] Hydro Penetration",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,925),BackgroundTransparency=1,LayoutOrder=38},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>3</b>. [Rare] Terra Mastery",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="32",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>32</b>. [Legendary] EXP Condenser",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,850),BackgroundTransparency=1,LayoutOrder=35},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>6</b>. [Rare] Neutral Mastery",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="28",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>28</b>. [Epic] Blood Money",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,650),BackgroundTransparency=1,LayoutOrder=27},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>14</b>. [Rare] Amplifier",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="26",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>26</b>. [Epic] Extended Reach",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,525),BackgroundTransparency=1,LayoutOrder=22},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="19",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>19</b>. [Epic] Overclocked Engine",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="39",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>39</b>. [Mythic] Feral Cruelty",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="34",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>34</b>. [Legendary] Bat Cavalry",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,450),BackgroundTransparency=1,LayoutOrder=19},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="22",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>22</b>. [Epic] Light Penetration",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="31",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>31</b>. [Legendary] Hemorrhage",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="29",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>29</b>. [Legendary] Razor Focus",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,20),Position=U(0,0,0,825),BackgroundTransparency=1,LayoutOrder=34},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>7</b>. [Rare] Light Mastery",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Unit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Ignore Effect",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Don't join if the challenge has one of these effects/modifiers",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Ignore Effect: "},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Ignore Map",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Don't join if the challenge uses one of these maps",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Ignore Map: "},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Select which stage types the feature works in",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,27),BackgroundTransparency=1,ClipsDescendants=true,Visible=false},
{Size=U(1,-148,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-170,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","X"),Text="<font color=\"#83b5ff\">UI Setting</font>",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Auto Claimer",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Auto Summon Banner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Auto Join Setting",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Story Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Select Map",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Expedition Auto Play",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Don't join if the challenge has one of these effects/modifiers",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Ignore Effect",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Don't join if the challenge uses one of these maps",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Ignore Map",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,137),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Failsafe",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-99,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,169),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Misc",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-46,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-126,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-114,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-139,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Building",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Building: "},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Add Fuel",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Collect",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Return Lobby When Fuel Empty",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-150,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-15,1,0),Position=U(0,20,0,0),BackgroundTransparency=1,BorderSizePixel=0,Text="Select",TextColor3=C(255,255,255),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-114,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-181,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-186,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0.1,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Restart",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Drag to set priority (highest number = selected first)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-210,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Reward",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-172,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Unit Priority",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Single rotating slot",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,106),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Sell at Wave",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0.02,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(1,0,0,130),Position=U(0,0,1,5),BackgroundColor3=C(20,20,20),Visible=false,GroupTransparency=1},
{Size=U(0.05,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(0.0333333,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(1,6,1,6),Position=U(0.5,0,0.5,0),AnchorPoint=V(0.5,0.5),BackgroundTransparency=1,Image="rbxassetid://8445471499",ImageRectOffset=V(904,404),ImageRectSize=V(96,96)},
{Size=U(1,-125,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0.4,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(0.6,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(0.8,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(1,-147,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-178,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,167),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Failsafe",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="UI Control",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Script Config",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Sprite Crafter",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Story Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Select Act",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Trial Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Auto Play Config",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Auto Checkpoint Shop",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Single rotating slot",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{DisplayOrder=5,ZIndexBehavior=E("ZIndexBehavior","Sibling")},
{Size=U(0,750,0,420),Position=U(0,56,0,527),BackgroundTransparency=1,BorderSizePixel=0},
{Size=U(1,0,1,0),BackgroundColor3=C(20,20,20)},
{Color=C(131,181,255),Transparency=0.5},
{Size=U(1,0,0,30),BackgroundColor3=C(40,40,40)},
{Size=U(1,0,0,2),Position=U(0,0,1,0),AnchorPoint=V(0,1),BackgroundColor3=C(40,40,40),BorderSizePixel=0},
{Size=U(0,20,0,20),Position=U(0,180,0,5),BackgroundTransparency=1},
{Size=U(1,6,1,6),Position=U(0.5,0,0.5,0),AnchorPoint=V(0.5,0.5),Rotation=90,BackgroundTransparency=1,Image="rbxassetid://8445471499",ImageRectOffset=V(904,404),ImageRectSize=V(96,96)},
{Size=U(0,2,1,-10),Position=U(0,205,0,5),BorderSizePixel=0},
{Transparency=NS{{0,1,0},{0.25,0.5,0},{0.75,0.5,0},{1,1,0}},Rotation=90},
{Size=U(1,-220,0,20),Position=U(0,215,0,5),BackgroundTransparency=1},
{Size=U(0,18,0,18),Position=U(0,0,0.5,0),AnchorPoint=V(0,0.5),BackgroundTransparency=1,Image="rbxassetid://11293977875"},
{Size=U(1,-85,1,0),Position=U(0,25,0,0),BackgroundTransparency=1,ClipsDescendants=true,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Enter keywords to search features....",ClearTextOnFocus=false},
{Size=U(1,-30,1,0),Position=U(0,25,0,0),BackgroundTransparency=1,ClipsDescendants=true},
{FillDirection=E("FillDirection","Horizontal"),SortOrder=E("SortOrder","LayoutOrder")},
{Size=U(0,50,1,0),Position=U(1,0,0.5,0),AnchorPoint=V(1,0.5),BackgroundColor3=C(63,63,63)},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Ctrl K",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,25,0,25),Position=U(0,5,0,2),BackgroundTransparency=1,Image="rbxassetid://16791647668"},
{Size=U(0,140,0,20),Position=U(0,35,0,5),BackgroundTransparency=1,Text="Nousigi <font color=\"#ffb759\" transparency=\"0\">[PRO]</font>",TextColor3=C(131,181,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,-185,1,-40),Position=U(0,180,0,35),BackgroundColor3=C(40,40,40),ClipsDescendants=true},
{EasingDirection=E("EasingDirection","InOut"),EasingStyle=E("EasingStyle","Quart"),TweenTime=0.125,FillDirection=E("FillDirection","Vertical"),SortOrder=E("SortOrder","LayoutOrder"),Padding=D(0,5),GamepadInputEnabled=false,ScrollWheelInputEnabled=false,TouchInputEnabled=false},
{Size=U(1,0,1,0),BackgroundTransparency=1,LayoutOrder=-1},
{Size=U(1,-10,0,25),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Information",TextColor3=C(255,255,255),TextSize=19,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-5,1,-30),Position=U(0,5,0,30),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=U(0,0,0,241),AutomaticCanvasSize=E("AutomaticSize","Y"),ScrollBarThickness=5,ScrollingDirection=E("ScrollingDirection","Y"),TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png"},
{Size=U(1,-10,0,236),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Script",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-55,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Script has been loaded\
\
If the UI is missing some tabs\
Try to go to <font color=\"rgb(131,181,255)\" weight=\"500\">Settings > Script Config > Reset Script Config</font> and reset the config (delete executor's workspace if the reset config button didn't work).\
If it still does not work, report it in <font color=\"rgb(131,181,255)\" weight=\"500\">#bug-report</font> on <font color=\"rgb(150, 192, 255)\" weight=\"500\">discord.gg/nousigi</font>.\
\
Check out the UI Settings tab to Import/Export Config and verify the validity of your Key and other miscellaneous stuff.\
\
Thanks for choosing us! We appreciate your support. If you have any questions, feel free to join <font color=\"rgb(150, 192, 255)\" weight=\"500\">discord.gg/nousigi</font>. We strive to provide you with the best scripting experience!",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,LayoutOrder=99},
{Size=U(1,-10,0,25),Position=U(0,5,0,0),BackgroundTransparency=1,Text="UI Setting",TextColor3=C(255,255,255),TextSize=19,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-5,1,-30),Position=U(0,5,0,30),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=U(0,0,0,850),CanvasPosition=V(0,500),AutomaticCanvasSize=E("AutomaticSize","Y"),ScrollBarThickness=5,ScrollingDirection=E("ScrollingDirection","Y"),TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png"},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Auto rejoin the game if you get kicked.\
Only works if the script is executed in the game.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Rejoin",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Rejoin the game if your ping freezes, pauses, or stops for more than 2 minutes.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Rejoin Ping Freeze",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,136),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Execute",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="You will not have to re-execute the script again on teleport, but you still need to execute it if you re-join the game or re-open Roblox. For better script auto-execution, put the script inside the autoexec folder inside your executor folder\
Check out <font color=\"rgb(255,255,255)\" weight=\"500\">#tutorial</font> > <font color=\"rgb(255,255,255)\" weight=\"500\">\"How to Auto Execute script\"</font> on <font color=\"rgb(131,181,255)\" weight=\"500\">discord.gg/nousigi</font> if you don't know how.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Execute on Teleport",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="UI Control",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-82,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,0,0,41),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y")},
{HorizontalAlignment=E("HorizontalAlignment","Center"),VerticalAlignment=E("VerticalAlignment","Center"),Padding=D(0,5)},
{Size=U(1,0,1,5),BackgroundColor3=C(38,38,38)},
{Size=U(0,100,0,25),Position=U(1,-5,0.5,3),AnchorPoint=V(1,0.5),BackgroundColor3=C(20,20,20)},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="L-Ctrl",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-120,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Keybind to toggle on/off the UI.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Toggle UI",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Button to toggle the UI on/off\
(located in the bottom-left corner).",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Display Toggle UI Button (Mobile)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,184),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Script Config",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-98,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Config Export",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-128,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Copy the config as a minified (shorter), 1-line version.\
Recommended to enable if you only want to import the config (if you wish to edit the config, it is not recommended to enable this).",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Minify Config",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Copy the config in JSON format\
(for direct pasting into a .json config file).",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="JSON Type Config",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Copy Config to Clipboard",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Copy the config in JSON format\
(for direct pasting into a .json config file).",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Send Config via Webhook",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Sends your current settings as a config file to your Discord webhook. Set your Webhook URL in the Webhook section first.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Config Import",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-130,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Import Config",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Input a Discord Attachment/Raw URL or paste the config JSON/text you copied from the <font color=\"rgb(255,255,255)\" weight=\"500\">\"Copy Config to Clipboard\"</font> button above. This will rejoin your game.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-27,1,0),Position=U(0,25,0,0),BackgroundTransparency=1,BorderSizePixel=0,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Import Config"},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Reset Script Config",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Reset the script config to default.\
YOU WILL BE KICKED OUT OF THE GAME.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,135),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Whitelist info",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-101,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Time Remain: <font color=\"rgb(255, 220, 0)\" weight=\"500\">Lifetime</font>",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Delete Saved Whitelist Key",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Delete the current saved Whitelist Key (an input key prompt will show up on the next execution).",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1},
{Size=U(1,-10,0,25),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Lobby",TextColor3=C(255,255,255),TextSize=19,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-5,1,-30),Position=U(0,5,0,30),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=U(0,0,0,465),CanvasPosition=V(0,115),AutomaticCanvasSize=E("AutomaticSize","Y"),ScrollBarThickness=5,ScrollingDirection=E("ScrollingDirection","Y"),TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png"},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Redeems active codes from the wiki, falling back to RoCodes if needed, and caches the list for 12 hours. Refresh requests expose your IP address to those sites.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Redeem Code",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Fun facts after running the script:\
- You can search your Unit Inventory using a unit's display name or its original (pre-DMCA) name. The game removed original-name search, but we've got you covered!\
- While in-game, event menus remain available even after the match has started.",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Sprite Crafter",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically craft Sprites from Grey Sprites\
This feature work both Lobby and in game",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Craft Sprite",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Sprite",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Which Sprites to auto-craft (Grey Sprite is the base, not selectable)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Sprite: "},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Sprite Limit",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-117,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Red Sprite Limit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Blue Sprite Limit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Green Sprite Limit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Yellow Sprite Limit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Purple Sprite Limit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Pink Sprite Limit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Rainbow Sprite Limit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Max amount to craft (costs 30 Grey per craft, cap 25)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Claimer",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-124,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Can be claimed while in game",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Claim Quest",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Claims completed weekly Expedition quests and reached Quest Board milestone rewards",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Claim Quest Board",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,5),BackgroundTransparency=1,Text="Auto Claim Battlepass",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,5),BackgroundTransparency=1,Text="Auto Claim Level Milestone",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,5),BackgroundTransparency=1,Text="Auto Claim Index",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Claims available event quests and event calendar rewards marked by a red dot",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Claim Event",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Claims available Daily Calendar login rewards",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Claim Calendar",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Enable all Auto Claim",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Turn on every Auto Claim toggle above",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Shop",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-109,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Gold Shop",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-109,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Event Shop",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Expedition Shop",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Raid General Shop",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-157,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Wandering Trader",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-152,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Buys selected in-stock items whenever the Wandering Trader appears and you have enough currency.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Expedition Hub",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Construct",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Constructs selected buildings that have not reached level 1 yet when their requirements and costs are met.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Construct",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Choose which buildings may be constructed.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Upgrade Building",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-182,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Upgrades selected constructed buildings to their next available level when requirements and costs are met.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Upgrade Building",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Choose which buildings may be upgraded.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Resource Drill",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Fills the Resource Drill with available Expedition Fuel.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Collects completed Resource Drill rewards.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="After the current match ends, returns to the lobby when the Resource Drill is empty and you have Expedition Fuel available.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Opens Expedition Geodes until Grey Sprite inventory reaches its limit.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Open Geode",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Keeps opening Expedition Geodes even when Grey Sprite inventory is full.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Ignore if Sprite Reached Limit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Gold Mine",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-106,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Fills the Gold Mine with available Expedition Fuel.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Collects completed Gold Mine rewards.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="After the current match ends, returns to the lobby when the Gold Mine is empty and you have Expedition Fuel available.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Research Lab",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-124,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Buys available Research Lab skill-tree upgrades whenever all requirements and material costs are met.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Upgrade Skill Tree",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Training Grounds",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Manages Training Grounds while in the Lobby: fills every available slot with selected units below 400% Worthiness and retrieves units when they reach 400%. Enable the return option below to rotate completed trainees after a match.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Train Units",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Units",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Select the exact inventory units to train.\
<b>WARNING: Copying this configuration also copies the selected units' UIDs. Be careful when sharing it.</b>",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Units: "},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Training Grounds actions only work in the Lobby. After the current match ends, returns to the Lobby when a trainee reaches 400% Worthiness and another selected, eligible unit below 400% is waiting to take the freed slot.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Return Lobby if Full Worthiness",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Bulk Select",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Select Non-Trait Mythics",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Add every Mythic unit without a trait to the Auto Train selection.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Select Non-Trait Secrets",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Add every Secret unit without a trait to the Auto Train selection.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,126),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Summon Banner",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-154,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="VillainInvasion",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Summon VillainInvasion",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Auto Sell Rarity: Rare,  Epic,  Legendary,  Shiny Rare,  Shiny Epic,  Shiny Legendary",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Standard",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-100,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Summon Standard",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Auto Sell Rarity: Rare,  Epic,  Legendary,  Shiny Rare,  Shiny Epic",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Mini",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-71,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Summon Mini",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Auto Sell Rarity: Rare,  Epic,  Legendary",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,LayoutOrder=1},
{Size=U(1,-10,0,25),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Joiner",TextColor3=C(255,255,255),TextSize=19,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-5,1,-30),Position=U(0,5,0,30),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=U(0,0,0,591),AutomaticCanvasSize=E("AutomaticSize","Y"),ScrollBarThickness=5,ScrollingDirection=E("ScrollingDirection","Y"),TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png"},
{Size=U(1,-10,0,266),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Join Setting",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Temporarily pauses every auto join feature until the script is executed again",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Disable Auto Joiners",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Joiner Cooldown",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Wait in Lobby the set amount of seconds before joining",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Auto Join Priority",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Drag to set which joiner runs first (highest number = highest priority)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Auto Join Priority: Bounty Board Joiner > Weekly Challenge Joiner > Daily Challenge Joiner > Regular Challenge Joiner > Expedition Joiner > Villain Invasion Joiner > Raid Joiner > Story Joiner > Trial Joiner "},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>5</b>. Expedition Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>2</b>. Raid Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>1</b>. Story Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>0</b>. Trial Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>8</b>. Weekly Challenge Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>6</b>. Regular Challenge Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>3</b>. Villain Invasion Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>7</b>. Daily Challenge Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>9</b>. Bounty Board Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Team Equipper",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Load the selected team slot before joining each mode",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Team Equipper",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Story Joiner Team Slot",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Raid Joiner Team Slot",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Villain Invasion Joiner Team Slot",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Trial Joiner Team Slot",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Expedition Joiner Team Slot",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Regular Challenge Joiner Team Slot",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Daily Challenge Joiner Team Slot",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Weekly Challenge Joiner Team Slot",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Bounty Board Joiner Team Slot",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Story Joiner",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-119,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically joins the selected Story map when in the Lobby",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Join Story",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="The Story map to auto-join",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Difficulty",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Select Difficulty: Normal",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Value="Normal"},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Raid Joiner",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically joins the selected Raid map when in the Lobby (requires level 25+)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Join Raid",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="The Raid map to auto-join",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,0,40),Position=U(0,0,1,5),BackgroundColor3=C(20,20,20),Visible=false,GroupTransparency=1},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Only auto-join the selected Raid when your Raid Tokens are below the configured amount.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Only Join if below Raid Token",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Under Raid Token",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Your Raid Token amount must be strictly below this value.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0.0990991,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Villain Invasion Joiner",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically joins the selected Villain Invasion act",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Join Villain Invasion",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="The Villain Invasion act to auto-join",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="If Crow Relics are in the inventory, join Crow instead of the selected Act. Otherwise, join the selected Act normally.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Join Crow Act if Crow Relics available",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically opens owned Villain Chests one at a time in the Lobby or during a match",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Open Villain Chest",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Trial Joiner",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically joins the selected Unit Trial as a solo stage.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Join Trial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Trial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Select a Trial by the trial unit's in-game display name.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Trial"},
{Size=U(0,5,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(214,242,285),BackgroundTransparency=0.25,BorderSizePixel=0,LayoutOrder=1},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Expedition Joiner",TextColor3=C(214,242,285),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-153,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(214,242,285),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically joins the selected Expedition map when in the Lobby (requires level 20+)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Join Expedition",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="The Expedition map to auto-join",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Difficulty Level",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Tier 1-3 (number of skulls)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Select Difficulty Level: 1",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Value="1"},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Join Requirement",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Only auto-join the selected Expedition when your Expedition Fuel is below the configured amount.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Only Join if below Expedition Fuel",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Under Expedition Fuel",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="The Expedition Fuel amount must be strictly below this value.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="While playing Expedition, instantly return to the Lobby when your Expedition Fuel reaches or exceeds the configured amount.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Return Lobby if above Expedition Fuel",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Above Expedition Fuel",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Return to the Lobby when Expedition Fuel is greater than or equal to this value.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically collect any dropped or existing Expedition orbs",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Collect Orb",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Expedition only. When a checkpoint's Continue button appears, automatically continue to the next node",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Continue Checkpoint",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Restart",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-120,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Expedition only. Restart the match after the current node reaches the set number (node-based, like wave-based Auto Restart but for Expedition nodes)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Restart at Node",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Restart the Expedition when this node is reached",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0.0502513,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Extract",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Expedition only. After passing the selected node, extract at the next Checkpoint instead of continuing",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Extract",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Extract after Node",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Extract at the first Checkpoint reached after this node has been completed",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0.0452261,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Select Upgrade",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Auto-select the highest-priority upgrade when an Expedition level-up prompt appears",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Select Upgrade",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Upgrade Type",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Simple = one priority list. Advanced = complete every Sets upgrade once, then switch to the capped General bracket.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Select Upgrade Type: Simple",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Value="Simple"},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Use the rerolls unlocked by the Research Lab while Auto Select Upgrade is in Advanced mode.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Upgrade Reroll",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Advanced reroll mechanic:\
- Bracket 1 uses Sets priority until every configured Sets upgrade has been selected once.\
- Bracket 2 then uses General priority and Cap Amount for the rest of the Expedition.\
- The highest-priority offered card is protected. Unlocked rerolls are used only on lower-priority cards.\
- All cards are reevaluated after each reroll. If it does not create a better card, remaining rerolls are saved.\
- Research Lab reroll level 0/1/2 provides 0/1/2 rerolls; the real amount is read from the prompt.",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Auto Select Upgrade Priority",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Auto Select Upgrade Priority: [Mythic] EXP Collector > [Mythic] Feral Cruelty > [Mythic] Infectious > [Mythic] Missile Protocol > [Mythic] Momentum > [Mythic] Whetstone Cache > [Legendary] Bat Cavalry > [Legendary] Bounty Hunter > [Legendary] EXP Condenser > [Legendary] Hemorrhage > [Legendary] Martyr's Blast > [Legendary] Razor Focus > [Epic] Blood Money > [Epic] Dark Penetration > [Epic] Extended Reach > [Epic] Flame Penetration > [Epic] Gale Penetration > [Epic] Hydro Penetration > [Epic] Light Penetration > [Epic] Lingering Rot > [Epic] Neutral Penetration > [Epic] Overclocked Engine > [Epic] Quickened Blade > [Epic] Storm Penetration > [Epic] Terra Penetration > [Epic] Vital Strikes > [Rare] Amplifier > [Rare] Dark Mastery > [Rare] Flame Mastery > [Rare] Fortified Cargo > [Rare] Gale Mastery > [Rare] Hydro Mastery > [Rare] Iron Flesh > [Rare] Light Mastery > [Rare] Neutral Mastery > [Rare] Relentless Pursuit > [Rare] Storm Mastery > [Rare] Terra Mastery > [Rare] Venomous Edge > [Rare] Yen Hunger "},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Upgrade Priority - Sets",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Bracket 1 priority. Completed upgrades are ignored until every configured Sets upgrade has been selected once.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Upgrade Priority - Sets: [Mythic] EXP Collector > [Mythic] Feral Cruelty > [Mythic] Infectious > [Mythic] Missile Protocol > [Mythic] Momentum > [Mythic] Whetstone Cache > [Legendary] Bat Cavalry > [Legendary] Bounty Hunter > [Legendary] EXP Condenser > [Legendary] Hemorrhage > [Legendary] Martyr's Blast > [Legendary] Razor Focus > [Epic] Blood Money > [Epic] Dark Penetration > [Epic] Extended Reach > [Epic] Flame Penetration > [Epic] Gale Penetration > [Epic] Hydro Penetration > [Epic] Light Penetration > [Epic] Lingering Rot > [Epic] Neutral Penetration > [Epic] Overclocked Engine > [Epic] Quickened Blade > [Epic] Storm Penetration > [Epic] Terra Penetration > [Epic] Vital Strikes > [Rare] Amplifier > [Rare] Dark Mastery > [Rare] Flame Mastery > [Rare] Fortified Cargo > [Rare] Gale Mastery > [Rare] Hydro Mastery > [Rare] Iron Flesh > [Rare] Light Mastery > [Rare] Neutral Mastery > [Rare] Relentless Pursuit > [Rare] Storm Mastery > [Rare] Terra Mastery > [Rare] Venomous Edge > [Rare] Yen Hunger "},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Upgrade Priority - General",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Bracket 2 priority. Activates only after Bracket 1 is fully completed, then respects Cap Amount for the rest of the Expedition.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Upgrade Priority - General: [Mythic] EXP Collector > [Mythic] Feral Cruelty > [Mythic] Infectious > [Mythic] Missile Protocol > [Mythic] Momentum > [Mythic] Whetstone Cache > [Legendary] Bat Cavalry > [Legendary] Bounty Hunter > [Legendary] EXP Condenser > [Legendary] Hemorrhage > [Legendary] Martyr's Blast > [Legendary] Razor Focus > [Epic] Blood Money > [Epic] Dark Penetration > [Epic] Extended Reach > [Epic] Flame Penetration > [Epic] Gale Penetration > [Epic] Hydro Penetration > [Epic] Light Penetration > [Epic] Lingering Rot > [Epic] Neutral Penetration > [Epic] Overclocked Engine > [Epic] Quickened Blade > [Epic] Storm Penetration > [Epic] Terra Penetration > [Epic] Vital Strikes > [Rare] Amplifier > [Rare] Dark Mastery > [Rare] Flame Mastery > [Rare] Fortified Cargo > [Rare] Gale Mastery > [Rare] Hydro Mastery > [Rare] Iron Flesh > [Rare] Light Mastery > [Rare] Neutral Mastery > [Rare] Relentless Pursuit > [Rare] Storm Mastery > [Rare] Terra Mastery > [Rare] Venomous Edge > [Rare] Yen Hunger "},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Upgrade Cap-Amount (Select the card by how many time)",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-412,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Mythic] EXP Collector",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Mythic] Feral Cruelty",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Mythic] Infectious",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Mythic] Missile Protocol",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Mythic] Momentum",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Mythic] Whetstone Cache",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Legendary] Bat Cavalry",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Legendary] Bounty Hunter",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Legendary] EXP Condenser",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Legendary] Hemorrhage",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Legendary] Martyr's Blast",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Legendary] Razor Focus",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Epic] Blood Money",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Epic] Dark Penetration",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Epic] Extended Reach",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Epic] Flame Penetration",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Epic] Gale Penetration",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Epic] Hydro Penetration",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Epic] Light Penetration",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Epic] Lingering Rot",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Epic] Neutral Penetration",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Epic] Overclocked Engine",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Epic] Quickened Blade",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Epic] Storm Penetration",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Epic] Terra Penetration",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Epic] Vital Strikes",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Rare] Amplifier",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Rare] Dark Mastery",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Rare] Flame Mastery",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Rare] Fortified Cargo",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Rare] Gale Mastery",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Rare] Hydro Mastery",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Rare] Iron Flesh",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Rare] Light Mastery",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Rare] Neutral Mastery",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Rare] Relentless Pursuit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Rare] Storm Mastery",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Rare] Terra Mastery",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Rare] Venomous Edge",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="[Rare] Yen Hunger",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Select Anvil Stat",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-175,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Auto-select the highest-priority Stat Anvil when the anvil prompt appears\
Will also auto use Anvil if you got it in hotbar",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Select Anvil Stat",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Auto Select Anvil Stat Priority",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Auto Select Anvil Stat Priority: Archetype Damage > Bonus Match Rewards > Critical Chance > Critical Damage > Damage > DoT DMG Dealt > EXP Multiplier > Element Damage > Follow-Up Damage > Payload Health > Range > SPA > Summon Damage > Summon Health > Yen Generation "},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>9</b>. EXP Multiplier",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>14</b>. Bonus Match Rewards",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>4</b>. SPA",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>3</b>. Summon Damage",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>10</b>. DoT DMG Dealt",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>5</b>. Range",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>13</b>. Critical Chance",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>8</b>. Element Damage",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>15</b>. Archetype Damage",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>1</b>. Yen Generation",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>2</b>. Summon Health",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>12</b>. Critical Damage",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>6</b>. Payload Health",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>7</b>. Follow-Up Damage",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>11</b>. Damage",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Anvil Stat Cap-Amount (Select the card by how many time)",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-419,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Archetype Damage",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Bonus Match Rewards",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Critical Chance",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Critical Damage",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Damage",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="DoT DMG Dealt",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="EXP Multiplier",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Element Damage",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Follow-Up Damage",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Payload Health",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Range",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="SPA",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Summon Damage",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Summon Health",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Yen Generation",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Expedition Map Route",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically pre-selects the best valid Expedition route through node 10 using your reward priority.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Expedition Map Route",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Expedition Reward Priority",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Drag to set route reward priority (highest number = selected first). Defaults put the rarest rewards first.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Expedition Reward Priority: Equipment Lock > Equipment Reroll > Equipment Scrap > Fuel Cell > Aqua Shard > Expedition Coin > Yen > Lush Dirt > Cursed Timber > Tome "},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>5</b>. Expedition Coin",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>2</b>. Cursed Timber",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>6</b>. Aqua Shard",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>7</b>. Fuel Cell",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>9</b>. Equipment Reroll",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>10</b>. Equipment Lock",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>3</b>. Lush Dirt",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>4</b>. Yen",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>1</b>. Tome",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>8</b>. Equipment Scrap",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Restart Reward",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Selects the complete first 10-node route, then restarts the Expedition until that route contains the required amount of your selected reward. Works without Expedition Auto Play.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Restart for Reward",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="The Expedition route reward whose total amount must meet your requirement.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Reward: Equipment Lock"},
{Value="Equipment Lock"},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Required Amount",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Restart when the selected reward totals less than this amount across the first 10 routed nodes.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Expedition Auto Play",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Expedition-only Auto Play. Automatically places, upgrades, and advances (votes/continues) through each Expedition node for you. Set the Payload (Front/Middle/Back) and Lane (DPS/Support/Farm) positions/units below. Positions are shared across all Expedition maps. Works on its own - You dont need to set the Position for Payload/Lane (auto-detect).",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Expedition Auto Play",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Play Config",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="When upgrading, prioritize farm units first (lowest-level farm first) before other units. Off = upgrade the lowest-level unit overall (default).",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Focus on Upgrade Farm",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Only place new units when the current round type is Payload. Lane rounds place no units. Relocation still follows the current node type.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Only Place on Payload",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Payload",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-93,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Set every compatible placed unit to this targeting priority during Assault combat",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Select Unit Priority: Closest",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Value="Closest"},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Current Map: School Grounds\
Front Position: (not set)\
Middle Position: (not set)\
Back Position: (not set)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Set Front Position",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Set the Front position at your current location (stand where you want the unit)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Set Middle Position",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Set the Middle position at your current location (stand where you want the unit)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Set Back Position",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Set the Back position at your current location (stand where you want the unit)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Front Unit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Units selected here are placed at the Front position on Payload rounds. Units not in any list are auto-assigned to the role with the fewest units.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Front Unit: "},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Middle Unit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Units selected here are placed at the Middle position on Payload rounds. Units not in any list are auto-assigned to the role with the fewest units.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Middle Unit: "},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Back Unit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Units selected here are placed at the Back position on Payload rounds. Units not in any list are auto-assigned to the role with the fewest units.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Back Unit: "},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Lane",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-74,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Set every compatible placed unit to this targeting priority during Defense and Elite combat",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Select Unit Priority: First",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Value="First"},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Current Map: School Grounds\
DPS Position: (not set)\
Support Position: (not set)\
Farm Position: (not set)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Set DPS Position",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Set the DPS position at your current location (stand where you want the unit)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Set Support Position",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Set the Support position at your current location (stand where you want the unit)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Set Farm Position",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Set the Farm position at your current location (stand where you want the unit)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select DPS Unit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Units selected here are placed at the DPS position on Lane rounds. Units not in any list are auto-assigned to the role with the fewest units.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select DPS Unit: "},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Support Unit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Units selected here are placed at the Support position on Lane rounds. Units not in any list are auto-assigned to the role with the fewest units.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Support Unit: "},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Farm Unit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Units selected here are placed at the Farm position on Lane rounds. Units not in any list are auto-assigned to the role with the fewest units.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Farm Unit: "},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Hire Unit",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="After the starter checkpoint, hire selected offered units at later Checkpoints when there is enough Yen. Hiring is completed before Auto Play continues.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Hire Unit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Select which units may be hired from the three Checkpoint offers.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Unit: "},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Checkpoint Shop",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-181,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="After the starter checkpoint, buy selected available items with Yen at later Checkpoints before Auto Play continues. Highest-cost selected offers are bought first.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Checkpoint Shop",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Select Checkpoint Shop items to buy. Item names match the names displayed by the game.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Use Tome",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Uses any tome in the hotbar. Normal tomes improve the highest-DPS eligible unit; Investment tomes target the highest-income farm without Investment.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Use Tome",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Tome Trait Priority",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="For non-farm units after every unit has a trait. A tome replaces only a lower-priority trait; highest number wins. Defaults rank rarer roll chances higher.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Tome Trait Priority: Unbound > Primordial > Forsaken > Draconic > Investor > Optics > Bolt > Precision 2 > Limit Breaker > Precision 1 > Range 2 > Speed 2 > Strength 2 > Enlightenment > Range 1 > Speed 1 > Strength 1 "},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>16</b>. Primordial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>5</b>. Strength 2",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>3</b>. Range 1",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>15</b>. Forsaken",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>9</b>. Limit Breaker",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>7</b>. Range 2",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>14</b>. Draconic",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>11</b>. Bolt",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>12</b>. Optics",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>10</b>. Precision 2",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>8</b>. Precision 1",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>4</b>. Enlightenment",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>6</b>. Speed 2",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>13</b>. Investor",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>17</b>. Unbound",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>1</b>. Strength 1",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-85,0,20),Position=U(0,5,0,0),BackgroundTransparency=1,Text="<b>2</b>. Speed 1",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Repair",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-116,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Uses a Repair Hammer from the hotbar whenever Payload health falls to or below the selected percentage. Works during every Expedition round type.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Use Repair Hammer",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Use at Percent Health",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0.550562,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Expedition Failsafe",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-160,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Restarts the current Expedition when TotalNodes has not changed for the selected number of minutes.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Restart if stuck Node",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Restart Minute",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="How many minutes TotalNodes may remain unchanged before the Expedition is treated as stuck and restarted.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Regular Challenge Joiner",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-196,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Checks all 3 rotating slots for a valid challenge (no ignored effects/maps, daily limit not reached)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Join Regular Challenge",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Only join Regular Challenge slots that drop one of the selected rewards. Sprite rewards are skipped when every Sprite color in that slot is already at its inventory cap.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Reward: "},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Switches to a new Regular Challenge before Replay/Next, or during the new vote-start window after Expedition Auto Extract/Restart. Enable this with Auto Run Joiner Features.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Change Gamemode If new Challenge",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Daily Challenge Joiner",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Join Daily Challenge",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Weekly Challenge Joiner",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-193,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Join Weekly Challenge",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Bounty Board Joiner",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-169,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Prioritizes bounties with the most completed objectives, then the fewest objectives.\
- Summon Units: pauses every normal Auto Summon banner while this joiner is enabled. It only summons from an affordable banner in the Lobby when the selected bounty needs summons.\
- Regular Challenge: joins an available Regular Challenge, then switches directly to the next match objective. If all daily attempts are used, the bounty is rerolled.\
- Story Hard: joins Act 1 of the required Story map on Hard, then directly starts the next match objective.\
- Spirit City Raid: joins Raid Act 1, then directly starts the next match objective.\
- Infinite Wave: joins the required Infinite map on Hard, restarts immediately at the target wave, then uses the fresh stage-selection window for the next objective.\
The script returns to the Lobby only when the next unfinished objective requires summoning.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Join Bounty Board",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Reroll bounties below Minimum Stars or containing a skipped objective",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Reroll Quest",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Minimum Stars",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Reroll bounties below this star amount",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Skip Objectives",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Reroll a bounty when it contains any selected objective",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Skip Objectives: "},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Skip if Infinite Wave above Wave",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Skip Infinite objectives above this target Wave. Equal or lower Waves remain eligible; skipped bounties are rerolled when Auto Reroll is enabled.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0.59596,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="60",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Status: Disabled",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,LayoutOrder=2},
{Size=U(1,-10,0,25),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Game",TextColor3=C(255,255,255),TextSize=19,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-5,1,-30),Position=U(0,5,0,30),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=U(0,0,0,1324),CanvasPosition=V(0,774),AutomaticCanvasSize=E("AutomaticSize","Y"),ScrollBarThickness=5,ScrollingDirection=E("ScrollingDirection","Y"),TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png"},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Gameplay",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-81,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="When enabled, forces the game's Auto Vote Start setting ON. When disabled, forces it OFF.\
Note: Play Macro and Auto Play already have built-in Auto Start - enabling this is not recommended.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Vote Start",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Skip Wave",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically enable the game's Auto Skip Wave setting (votes to skip waves)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Skip Wave",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Stop Skip at Wave",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Turn off Auto Skip after reaching the specified wave\
Set to 0 to never stop\
Only applies to the stage types selected below - all other modes always skip",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Auto Skip is always ON in every mode. The 'Stop Skip at Wave' above only applies to the stage types selected here - unselected modes keep skipping forever",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Restart",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-120,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically restart the game when the specified wave is reached (fires Restart on the GameState replica)",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Restart at Wave",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Restart the game when this wave is reached",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Sell",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-100,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Sell Unit",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-129,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically sell all units on the selected wave\
Not recorded by Record Macro",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Sell Unit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Sell all units on this wave.\
Set to 0 to auto-sell at the stage's last wave - stages with no final wave are skipped.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Sell Farm",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-134,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically sell all farm (money-generating) units on the selected wave\
Not recorded by Record Macro",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Sell Farm",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Sell all farms on this wave.\
Set to 0 to auto-sell at the stage's last wave - stages with no final wave are skipped.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,290),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Game Finished",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-110,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Presses 'Next Stage' on the result screen",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Next",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Presses 'Repeat Stage' on the result screen",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Replay",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="When the game ends, if it cannot click Next or Replay, the script will join a game mode based on the Joiner tab's Auto Join settings and priorities. Enabling this is recommended\
This is mostly for farming the Regular Challenge alongside other modes",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Run Joiner Features",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Returns to the lobby after the match ends",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Return Lobby",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="If the result screen is stuck for over 120s, force-teleport to the lobby",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Return Lobby Failsafe",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Leecher - naughty naughty boy",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-230,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Return to the lobby whenever the result screen shows you lost the stage",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Return Lobby if loose Stage",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Return to the lobby when the current player count is at or under the set number",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Return Lobby if under Player count",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Player Count",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Will return to lobby if current player count is equal or under this set number",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,204),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Smart Auto Ability",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-132,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Master switch for the Smart Auto Ability system. Configure per-unit activation rules below.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Smart Auto Ability",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Pick a unit to configure. Only units with an active ability are listed. Configured units appear first, with each enabled ability listed underneath.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Unit"},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Crimson (Brother)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Damu",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Flame Emperor (Reincarnate)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Goose",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Jace",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Lady Giant (Envy)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Puppet (Telekinetic)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Razorjaw (Hunter)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Reaper (Released)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Shadow (Divine)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="True Saint (Holy)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Winged Spirit (Divine)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Ability",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Pick which of this unit's abilities to configure.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Select Ability",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,0,0,10),Position=U(0,0,1,5),BackgroundColor3=C(20,20,20),Visible=false,GroupTransparency=1},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="No unit selected yet - please choose a unit from the list above.",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Enable Smart Auto Ability for the selected unit's chosen ability.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Ability",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Ability Activation Type",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Choose how the selected unit's ability should be triggered.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Ability Activation Type",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Activation Wave",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="The wave at which the ability becomes eligible to fire.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Start After Wave",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="The ability begins firing after this wave.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Activate Every",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Re-fire the ability every N waves after the start wave.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0.040404,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Enemy Type",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Which enemy triggers the ability.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Enemy Type: Boss",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Value="Boss"},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Only After Wave",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Ignore enemies before this wave.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Wait until the current wave has finished spawning enemies before firing.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Only After Enemies Stop Spawning",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Activation Delay (seconds)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Delay in seconds before the ability fires once its condition is met.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Once <font color=\"#4DA3FF\" weight=\"500\">Activation Wave</font> is reached, the selected unit's ability fires automatically whenever it is available (off cooldown).",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Starting after <font color=\"#4DA3FF\" weight=\"500\">Start After Wave</font>, the ability fires every <font color=\"#4DA3FF\" weight=\"500\">Activate Every</font> waves when available, then waits for the next interval.",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="When the chosen <font color=\"#4DA3FF\" weight=\"500\">Enemy Type</font> enters the unit's range (and only after wave <font color=\"#4DA3FF\" weight=\"500\">Only After Wave</font>), the ability fires if it is available.",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="When the chosen <font color=\"#4DA3FF\" weight=\"500\">Enemy Type</font> is present anywhere on the map (after wave <font color=\"#4DA3FF\" weight=\"500\">Only After Wave</font>), the ability fires. Enable <font color=\"#4DA3FF\" weight=\"500\">Stop Spawning</font> to wait until enemies have finished spawning first.",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Unit Mechanic",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-150,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Dark Mage (Sovereign)",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-180,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="When Dark Mage (Sovereign)'s passive switches its current attack to the cone-shaped Lightning Magic attack, set its targeting priority to None to preserve that form.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Keep Lightning Magic Attack",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="For stages with a finite final wave, restore Dark Mage (Sovereign)'s targeting priority to First when the final wave is reached.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Set to First on the Final Wave",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Leaderboard Helper",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-164,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Open Tournament UI",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Opens the Tournament UI so you can view top players and scores.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-15,1,0),Position=U(0,20,0,0),BackgroundTransparency=1,BorderSizePixel=0,Text="Open",TextColor3=C(255,255,255),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Hit Replace",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-113,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="After the selected wave, place and fully auto-upgrade the selected unit, wait using the selected detection method, sell it, and repeat. Before selling, it pauses and keeps the current unit placed until you can afford the next unit's placement and every upgrade.\
For the fastest VFX / Damage Based detection, enable <b>Show Own Unit VFX</b> in the game's settings. This lets Hit Replace detect attacks directly from their VFX and avoids the client-server delay that can occur when reading total damage.\
<b>While Hit Replace is enabled, it controls the game's Auto-Upgrade Placed Units setting. When Hit Replace is disabled, that game setting is left unchanged.</b>",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Hit Replace",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Auto Upgrade while Inactive",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Choose the Auto-Upgrade Placed Units setting used while Hit Replace is enabled but waiting for its wave or placement conditions.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Auto Upgrade while Inactive: Disabled",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Value="Disabled"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Detection Method",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="VFX / Damage Based sells after the unit's complete attack is detected. Timing Based starts a precise countdown once the unit reaches maximum upgrade, then sells it.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Detection Method: VFX / Damage Based",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Value="VFX / Damage Based"},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Sell Delay after Max Upgrade",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="In Timing Based mode, sell the unit this many seconds after it reaches maximum upgrade.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Select the unit to place, hit, sell, and replace. The unit must be equipped in the current hotbar.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Unit: Elf Mage (Unleashed)"},
{Value="Elf Mage (Unleashed)"},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Start after Wave",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Begin the hit-replace loop when this wave is reached.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0.347826,0,0,6),BackgroundColor3=C(131,181,255)},
{Size=U(1,-5,1,0),BackgroundTransparency=1,Text="105",TextColor3=C(255,255,255),TextSize=16,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Set Placement Position",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Stand where the selected unit should be placed. The position is saved separately for the current stage.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Selected Unit: Elf Mage (Unleashed)\
Position (School Grounds): 3088.0, 1798.9, 3352.3\
Status: Waiting for Wave 105 (current: 19)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Rewind Loop",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Starts as soon as any placed Puppet (Telekinetic) has Complete Control unlocked and any placed Shadow (Divine) has Shadow Realm unlocked. It activates Shadow Realm when ready, otherwise Complete Control, then waits for the selected delay and repeats. Duplicate units are supported because these abilities share a global cooldown. This does not enable either unit's Auto Ability.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Rewind Loop",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Delay between Activate",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Seconds to wait after activating either ability before checking again.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,274),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Performance",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-97,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Delete map decorations/environments to improve performance while keeping a lightweight directional path visible.\
Only enable if you're using Play Macro; enabling it for Auto Play is not recommended.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Delete Map",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Delete enemies to improve performance\
Only use if you are using Play Macro or Auto Play",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Delete Enemies",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Lower the graphics of meshes in the map, reduce effects, and remove lighting also disable animations",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Boost FPS",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Disable 3D rendering for better performance",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Black Screen",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,LayoutOrder=3},
{Size=U(1,-10,0,25),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Auto Play",TextColor3=C(255,255,255),TextSize=19,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-5,1,-30),Position=U(0,5,0,30),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=U(0,0,0,367),AutomaticCanvasSize=E("AutomaticSize","Y"),ScrollBarThickness=5,ScrollingDirection=E("ScrollingDirection","Y"),TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png"},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Play",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-78,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically place the equipped units around the Position you set.\
If you have this on with Play Macro, if no Macro were detected for the stage, it will run Auto Play instead",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Play",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Placement Manage (Unit Config)",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-240,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Place Order",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Place the units in the order you set\
Will prioritize placing the lowest number first\
Do not set any of the values duplicate each other",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Order for Slot 1",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Order for Slot 2",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Order for Slot 3",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Order for Slot 4",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Order for Slot 5",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Order for Slot 6",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Place Wave",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Only start placing the units after the set wave\
- Set to 0 will always place units",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Wave for Slot 1",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Wave for Slot 2",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Wave for Slot 3",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Wave for Slot 4",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Wave for Slot 5",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Wave for Slot 6",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Place Limit",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Only place the set amount of units for each slot\
- Set to 1 (or higher) will place the unit only once (or higher)\
- Set to 0 will place units up to their place limit (trait-aware)\
- Set to -1 will not place the unit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Limit for Slot 1",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Limit for Slot 2",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Limit for Slot 3",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Limit for Slot 4",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Limit for Slot 5",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Place Limit for Slot 6",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Ignore Place Unit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Selected units are never placed by Auto Play. This overrides their slot setting and works like setting Place Limit to -1.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Ignore Place Unit: "},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Placement Position (Set Pos)",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-219,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Set position for each slot to place specific units\
Will set the location based on where you are standing",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Current Map: School Grounds\
Slot 1: No Position\
Slot 2: No Position\
Slot 3: No Position\
Slot 4: No Position\
Slot 5: No Position\
Slot 6: No Position",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Set Slot Position",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Open the interactive top-down map to set Slots 1-6 for the current stage.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-15,1,0),Position=U(0,20,0,0),BackgroundTransparency=1,BorderSizePixel=0,Text="Set Slot Position",TextColor3=C(255,255,255),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Mass Set Slot Position",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Set the Position of all Slots to the current standing location",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Position Manage (Reset Pos)",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-234,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Challenge",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Event",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-99,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Expedition",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Infinite",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-110,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Mastery",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Raid",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-92,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Spirit City (Act 1)",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Spirit City (Act 2)",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Spirit City (Act 3)",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Story",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-97,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Unit Trial",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-121,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Crimson's Trial",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Lady Giant's Trial",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="String Demon's Trial",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Elf Mage's Trial",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Hollow's Trial",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-128,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Puppet's Trial",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="True Saint's Trial",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Reaper's Trial",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-127,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Salmon Sorcerer's Trial",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="8th Sword's Trial",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Flame Emperor's Trial",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-177,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Cursed Student's Trial",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Villain Invasion",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-159,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Crow Hideout (Act 1)",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Crow Hideout (Act 2)",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Crow Hideout (Act 3)",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Crow Hideout (Crow)",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,91),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Auto Upgrade",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-103,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically Upgrade the Units\
Only work while enabled with Auto Play",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Upgrade",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Upgrade Manage",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-145,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Upgrade Limit",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Only upgrade the set amount of the Unit's Slot.\
- Set to 1 (or higher) to only upgrade the unit to level 1 (or higher)\
- Set to 0 to upgrade the unit until max upgrade\
- Set to -1 to not upgrade the unit initially but upgrade it later when all units are maxed\
- Set to -2 to never upgrade the unit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Upgrade Limit for Slot 1",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Upgrade Limit for Slot 2",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Upgrade Limit for Slot 3",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Upgrade Limit for Slot 4",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Upgrade Limit for Slot 5",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Upgrade Limit for Slot 6",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Will Upgrade once before placing a new Unit, otherwise it will only focus on Placing Units first",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Upgrade and Place",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Focus on upgrading Farm units first before upgrading based on the selected Upgrade Method",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Focus on Farm",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Upgrade Method",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Select the Upgrade Method to use for Auto Upgrade",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="Upgrade Method: Hotbar left to right (until Max)",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.5,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Value="Hotbar left to right (until Max)"},
{Size=U(1,-10,0,27),BackgroundColor3=C(53,53,53),ClipsDescendants=true,Visible=false},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Upgrade Order",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-133,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Upgrade the units in the order you set\
Will prioritize upgrading the lowest number first (until max/reached cap)\
Do not set any of the values duplicate each other",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Upgrade Order for Slot 1",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Upgrade Order for Slot 2",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Upgrade Order for Slot 3",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Upgrade Order for Slot 4",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Upgrade Order for Slot 5",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Upgrade Order for Slot 6",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,LayoutOrder=4},
{Size=U(1,-10,0,25),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Macro",TextColor3=C(255,255,255),TextSize=19,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-5,1,-30),Position=U(0,5,0,30),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=U(0,0,0,1866),CanvasPosition=V(0,1516),AutomaticCanvasSize=E("AutomaticSize","Y"),ScrollBarThickness=5,ScrollingDirection=E("ScrollingDirection","Y"),TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png"},
{Size=U(1,-10,0,565),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Manage",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,0,380),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Select Macro",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,23),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Must be selected with a Macro for Play Macro work",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Select Macro: unbound_full_auto_1"},
{Size=U(1,0,0,310),Position=U(0,0,1,5),BackgroundColor3=C(20,20,20)},
{Size=U(1,0,1,-10),Position=U(0,0,0,5),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=U(0,0,0,0),CanvasPosition=V(0,205),AutomaticCanvasSize=E("AutomaticSize","Y"),ScrollBarThickness=5,ScrollingDirection=E("ScrollingDirection","Y"),TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png"},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="FairyKingChallenge",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="KingTombChallenge",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="SchoolGroundsChallenge",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Kaitun_SalmonSorcerer",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,25),BackgroundColor3=C(131,181,255),BackgroundTransparency=0.7},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="unbound_full_auto_1",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Kaitun_SpiritAct1",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="123123",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="RoseKindomChallenge",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="unbound_full_auto_1.bak",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Expedit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Kaitun_SpiritAct2",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Kaitun_KingTomb",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="FlowwerForestChallenge",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Kaitun_Puppet",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Kaitun_SpiritAct3",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Kaitun_ElfMage",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,1,0),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Kaitun_CursedStudent",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Value="unbound_full_auto_1"},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Create Macro",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Input a macro name here",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-27,1,0),Position=U(0,25,0,0),BackgroundTransparency=1,BorderSizePixel=0,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Create Macro"},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Delete Selected Macro",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,165),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Importer/Exporter",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-131,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Import Macro",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Input Discord Attachment/Raw URL or Macro JSON string",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-27,1,0),Position=U(0,25,0,0),BackgroundTransparency=1,BorderSizePixel=0,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Import Macro"},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Copy Macro json to Clipboard",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Send Macro json via Webhook",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,241),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Check Macro's Unit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Equip Macro's Units",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically equips and verifies the macro's full team before voting to start or running the macro. The game will wait and retry if the hotbar has not updated yet.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Equip Macro's Units",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Copy Hotbar stats to Clipboard",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Copies your hotbar units, traits, stat potentials, and equipment rolls in a Discord-ready format so you can easily share your macro loadout.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,127),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Macro",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-56,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,10,0,5),BackgroundTransparency=1,Text="Play Macro",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Experiencing issues with the recorded macro? Try not to place units too close to each other\
This will also records Unit's Special Move with timing",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Record Macro",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Anti Boredom",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Add Goon Corner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Adds a small looping video to the top-left corner while you play or record macros.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Goon Corner URL",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Optional direct .webm URL used by Goon Corner.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-27,1,0),Position=U(0,25,0,0),BackgroundTransparency=1,BorderSizePixel=0,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Goon Corner URL"},
{Size=U(1,-10,0,257),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Play Macro Config",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-153,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Continue play Macro without rely on Time, should be good if your macro doesn't timing the Time to place the Units (This for faster macro/faster time?)\
Recommended/Must enable with Auto Skip\
THIS DOESNT AFFECT THE TIMING OF THE UNIT'S ABILITY",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Ignore Timing",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="If set to true, will not ignore the timing of Sell Actions",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="No Ignore Sell Timing",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Macro Retry Limit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Retries a failed action this many times, then skips only that action and continues the macro. Setting it to 0 retries forever.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,97),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Information",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-113,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Select a macro below for a specific game mode\
If you enable Play Macro and Auto Play at the same time, and no macro below is selected, it will run Auto Play instead",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Select Challenge Macro",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-204,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Select Event Macro",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Select Expedition Macro",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Select Infinite Macro",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-189,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Select Mastery Macro",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-191,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Select Raid Macro",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-171,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Spirit City (Act 1)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Spirit City (Act 1)"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Spirit City (Act 2)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Spirit City (Act 2)"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Spirit City (Act 3)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Spirit City (Act 3)"},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Select Story Macro",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-176,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Select Unit Trial Macro",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-200,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Crimson's Trial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Crimson's Trial"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Lady Giant's Trial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Lady Giant's Trial"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="String Demon's Trial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="String Demon's Trial"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Elf Mage's Trial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Elf Mage's Trial"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Hollow's Trial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Hollow's Trial"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Puppet's Trial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Puppet's Trial"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="True Saint's Trial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="True Saint's Trial"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Reaper's Trial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Reaper's Trial"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Salmon Sorcerer's Trial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Salmon Sorcerer's Trial"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="8th Sword's Trial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="8th Sword's Trial"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Flame Emperor's Trial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Flame Emperor's Trial"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Cursed Student's Trial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Cursed Student's Trial"},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Select Villain Invasion Macro",TextColor3=C(114,142,185),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-238,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(114,142,185),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Crow Hideout (Act 1)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Crow Hideout (Act 1)"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Crow Hideout (Act 2)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Crow Hideout (Act 2)"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Crow Hideout (Act 3)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Crow Hideout (Act 3)"},
{Size=U(1,-10,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Text="Crow Hideout (Crow)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","SplitWord"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Crow Hideout (Crow)"},
{Size=U(1,0,1,0),BackgroundTransparency=1,LayoutOrder=5},
{Size=U(1,-10,0,25),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Webhook",TextColor3=C(255,255,255),TextSize=19,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-5,1,-30),Position=U(0,5,0,30),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=U(0,0,0,372),AutomaticCanvasSize=E("AutomaticSize","Y"),ScrollBarThickness=5,ScrollingDirection=E("ScrollingDirection","Y"),TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png"},
{Size=U(1,-10,0,240),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Setting",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-64,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Webhook URL",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Paste the url of your Discord Webhook here",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-27,1,0),Position=U(0,25,0,0),BackgroundTransparency=1,BorderSizePixel=0,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Webhook URL"},
{Size=U(1,-10,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Mention ID",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,15),Position=U(0,10,0,15),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Mention the Discord UserID instead of @everyone",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-27,1,0),Position=U(0,25,0,0),BackgroundTransparency=1,BorderSizePixel=0,Text="",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal"),PlaceholderText="Mention ID"},
{Size=U(1,-25,0,20),Position=U(0,5,0,-5),BackgroundTransparency=1,Text="Test Webhook",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,122),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Notification",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-92,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Send a pinged webhook for selected summon targets and Secret units",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Unit Summoned",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Send a webhook with the stage result, time and rewards when a match ends",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Stage Finished",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,0,1,0),BackgroundTransparency=1,LayoutOrder=6},
{Size=U(1,-10,0,25),Position=U(0,5,0,0),BackgroundTransparency=1,Text="Misc",TextColor3=C(255,255,255),TextSize=19,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-5,1,-30),Position=U(0,5,0,30),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=U(0,0,0,457),AutomaticCanvasSize=E("AutomaticSize","Y"),ScrollBarThickness=5,ScrollingDirection=E("ScrollingDirection","Y"),TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png"},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Sometimes, the script for joining the lobby may encounter bugs in detecting players with you. In such cases, this will teleport you back to the lobby if there is another player with you in the game",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Teleport to Lobby if have Players",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Disables the game's idle teleport to the AFK Chamber and returns to the Lobby if you are already inside.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Disable Auto Teleport AFK Chamber",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Secure",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-61,0,2),AnchorPoint=V(0,0.5),BackgroundColor3=C(184,212,255),BorderSizePixel=0,LayoutOrder=3},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="For Play Macro/Auto Play, this will slightly randomize the placement position by very small amount. It shouldn't affect your macro unless the units are placed too close to each other.\
Enabling this is recommended as it makes the data sent to the server appear less suspicious",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Random Offset",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Walks near unit actions while Play Macro, Auto Play, or Expedition Auto Play is running. Uses stable pathfinding and automatically enables the game's Auto Sprint setting.",TextColor3=C(168,168,168),TextSize=15,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,20),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Walk Around",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-10,0,76),BackgroundColor3=C(53,53,53),ClipsDescendants=true},
{Size=U(0,0,0,24),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","X"),Text="Informations",TextColor3=C(184,212,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","SemiBold","Normal")},
{Size=U(1,-25,0,0),Position=U(0,10,0,3),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Macro: unbound_full_auto_1 (32/37) Time Elapse: 01:52\
[32] Next action is in 5 wave (UseAbility)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Regular","Normal")},
{Size=U(0,170,1,-35),Position=U(0,5,0,35),BackgroundTransparency=1},
{Size=U(1,0,1,-40),BackgroundColor3=C(40,40,40)},
{Size=U(1,0,1,-25),Position=U(0,0,0,25),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=U(0,0,0,0),AutomaticCanvasSize=E("AutomaticSize","Y"),ScrollBarThickness=5,ScrollingDirection=E("ScrollingDirection","Y"),TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png"},
{Size=U(1,-10,0,20),BackgroundTransparency=1},
{Size=U(1,-10,1,0),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Lobby",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.3,TextXAlignment=E("TextXAlignment","Left"),FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,-10,0,20),BackgroundTransparency=1,LayoutOrder=1},
{Size=U(1,-10,1,0),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Joiner",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.3,TextXAlignment=E("TextXAlignment","Left"),FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,-10,0,20),BackgroundTransparency=1,LayoutOrder=2},
{Size=U(1,-5,1,0),Position=U(0,5,0,0),BackgroundColor3=C(131,181,255)},
{Size=U(1,-10,1,0),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Game",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,-10,0,20),BackgroundTransparency=1,LayoutOrder=3},
{Size=U(1,-10,1,0),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Auto Play",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.3,TextXAlignment=E("TextXAlignment","Left"),FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,-10,0,20),BackgroundTransparency=1,LayoutOrder=4},
{Size=U(1,-10,1,0),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Macro",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.3,TextXAlignment=E("TextXAlignment","Left"),FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,-10,0,20),BackgroundTransparency=1,LayoutOrder=5},
{Size=U(1,-10,1,0),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Webhook",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.3,TextXAlignment=E("TextXAlignment","Left"),FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,-10,0,20),BackgroundTransparency=1,LayoutOrder=6},
{Size=U(1,-10,1,0),Position=U(0,10,0,0),BackgroundTransparency=1,Text="Misc",TextColor3=C(255,255,255),TextSize=16,TextTransparency=0.3,TextXAlignment=E("TextXAlignment","Left"),FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,-10,0,25),Position=U(0,5,0,0),BackgroundTransparency=1,Text="ANIME EXPEDITIONS",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,0,0,30),Position=U(0,0,1,-5),AnchorPoint=V(0,1),BackgroundColor3=C(40,40,40)},
{Size=U(0,20,0,20),Position=U(0,5,0,5),BackgroundTransparency=1,Image="rbxassetid://10709810948"},
{Size=U(1,-40,1,0),Position=U(0,30,0,0),BackgroundTransparency=1,Text="UI Setting",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),FontFace=F("rbxasset://fonts/families/Code.json","Bold","Normal")},
{Size=U(1,0,1,0),Position=U(0.5,0,0,0),AnchorPoint=V(0.5,0),BackgroundColor3=C(0,0,0),BackgroundTransparency=0.6,Visible=false,GroupTransparency=1},
{Size=U(1,-70,1,-60),Position=U(0.5,0,0,35),AnchorPoint=V(0.5,0),BackgroundColor3=C(70,70,70),BackgroundTransparency=0.25,ZIndex=9},
{Size=U(0,24,0,24),Position=U(1,0,0,0),AnchorPoint=V(1,0),BackgroundTransparency=1,Image="rbxassetid://8445470984",ImageRectOffset=V(304,304),ImageRectSize=V(96,96)},
{Size=U(1,0,1,-35),Position=U(0,0,0,30),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=U(0,0,0,4338),ScrollBarThickness=5,ScrollingDirection=E("ScrollingDirection","Y"),TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png"},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=1,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","X"),Text="<font color=\"#83b5ff\">Loading</font>",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Script",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Script is being loaded, pleased wait...",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Auto rejoin the game if you get kicked.\
Only works if the script is executed in the game.",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Rejoin",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=3,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Rejoin the game if your ping freezes, pauses, or stops for more than 2 minutes.",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Rejoin Ping Freeze",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="You will not have to re-execute the script again on teleport, but you still need to execute it if you re-join the game or re-open Roblox. For better script auto-execution, put the script inside the autoexec folder inside your executor folder\
Check out <font color=\"rgb(255,255,255)\" weight=\"500\">#tutorial</font> > <font color=\"rgb(255,255,255)\" weight=\"500\">\"How to Auto Execute script\"</font> on <font color=\"rgb(131,181,255)\" weight=\"500\">discord.gg/nousigi</font> if you don't know how.",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Auto Execute",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Execute on Teleport",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=5,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Keybind to toggle on/off the UI.",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Toggle UI",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=6,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Button to toggle the UI on/off\
(located in the bottom-left corner).",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Display Toggle UI Button (Mobile)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=7,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Config Export",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=8,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Config Import",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=9,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Reset the script config to default.\
YOU WILL BE KICKED OUT OF THE GAME.",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Script Config",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Reset Script Config",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=10,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Whitelist info",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Time Remain: <font color=\"rgb(135, 135, 135)\" weight=\"500\">None</font>",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=11,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Delete the current saved Whitelist Key (an input key prompt will show up on the next execution).",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Whitelist info",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Delete Saved Whitelist Key",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=12,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Redeems active codes from the wiki, falling back to RoCodes if needed, and caches the list for 12 hours. Refresh requests expose your IP address to those sites.",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Misc",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Redeem Code",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=13,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Misc",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Fun facts after running the script:\
- You can search your Unit Inventory using a unit's display name or its original (pre-DMCA) name. The game removed original-name search, but we've got you covered!\
- While in-game, event menus remain available even after the match has started.",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=14,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically craft Sprites from Grey Sprites\
This feature work both Lobby and in game",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Craft Sprite",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=15,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Which Sprites to auto-craft (Grey Sprite is the base, not selectable)",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Select Sprite",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=16,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Sprite Crafter",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Sprite Limit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=17,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Can be claimed while in game",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Claim Quest",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=18,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Claims completed weekly Expedition quests and reached Quest Board milestone rewards",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Claim Quest Board",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=19,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Claim Battlepass",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=20,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Claim Level Milestone",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=21,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Claim Index",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=22,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Claims available event quests and event calendar rewards marked by a red dot",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Claim Event",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=23,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Claims available Daily Calendar login rewards",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Claim Calendar",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=24,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Turn on every Auto Claim toggle above",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Enable all Auto Claim",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=25,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Gold Shop",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=26,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Event Shop",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=27,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Expedition Shop",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=28,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Raid General Shop",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=29,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Wandering Trader",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=30,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Construct",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=31,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Upgrade Building",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=32,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Resource Drill",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=33,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Gold Mine",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=34,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Research Lab",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=35,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Training Grounds",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=36,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Training Grounds",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Bulk Select",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=37,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="VillainInvasion",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=38,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Standard",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=39,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Mini",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=40,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Temporarily pauses every auto join feature until the script is executed again",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Disable Auto Joiners",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=41,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Wait in Lobby the set amount of seconds before joining",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Joiner Cooldown",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=42,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Drag to set which joiner runs first (highest number = highest priority)",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Join Priority",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=43,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Auto Join Setting",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Team Equipper",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=44,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically joins the selected Story map when in the Lobby",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Join Story",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=45,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=46,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="The Story map to auto-join",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=47,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=48,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Select Difficulty",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=49,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically joins the selected Raid map when in the Lobby (requires level 25+)",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Join Raid",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=50,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=51,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="The Raid map to auto-join",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=52,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Raid Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=53,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Only auto-join the selected Raid when your Raid Tokens are below the configured amount.",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Only Join if below Raid Token",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=54,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Your Raid Token amount must be strictly below this value.",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Under Raid Token",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=55,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically joins the selected Villain Invasion act",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Join Villain Invasion",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=56,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=57,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="The Villain Invasion act to auto-join",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Select Act",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=58,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="If Crow Relics are in the inventory, join Crow instead of the selected Act. Otherwise, join the selected Act normally.",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Join Crow Act if Crow Relics available",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=59,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically opens owned Villain Chests one at a time in the Lobby or during a match",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Open Villain Chest",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=60,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically joins the selected Unit Trial as a solo stage.",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Join Trial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=61,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Select a Trial by the trial unit's in-game display name.",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Select Trial",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=62,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically joins the selected Expedition map when in the Lobby (requires level 20+)",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Join Expedition",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=63,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=64,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="The Expedition map to auto-join",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=65,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Tier 1-3 (number of skulls)",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Select Difficulty Level",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=66,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Join Requirement",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=67,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Automatically collect any dropped or existing Expedition orbs",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Collect Orb",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=68,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Expedition only. When a checkpoint's Continue button appears, automatically continue to the next node",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Continue Checkpoint",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=69,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Restart",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=70,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Extract",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=71,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Select Upgrade",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=72,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Auto Select Upgrade",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Upgrade Cap-Amount (Select the card by how many time)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=73,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Select Anvil Stat",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=74,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Auto Select Anvil Stat",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Anvil Stat Cap-Amount (Select the card by how many time)",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=75,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Expedition Map Route",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=76,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Restart Reward",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=77,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Expedition Auto Play",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=78,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Play Config",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=79,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Payload",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=80,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Lane",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=81,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Hire Unit",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=82,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Checkpoint Shop",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=83,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Use Tome",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=84,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Repair",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=85,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),Position=U(0,0,0,5),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Expedition Failsafe",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=86,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Checks all 3 rotating slots for a valid challenge (no ignored effects/maps, daily limit not reached)",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Join Regular Challenge",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=87,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=88,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=89,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=90,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Join Daily Challenge",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=91,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=92,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=93,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=94,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Join Weekly Challenge",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=95,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=96,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=97,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=98,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Only join Regular Challenge slots that drop one of the selected rewards. Sprite rewards are skipped when every Sprite color in that slot is already at its inventory cap.",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Select Reward",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=99,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Switches to a new Regular Challenge before Replay/Next, or during the new vote-start window after Expedition Auto Extract/Restart. Enable this with Auto Run Joiner Features.",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Change Gamemode If new Challenge",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(1,-10,0,0),BackgroundTransparency=1,LayoutOrder=100,AutomaticSize=E("AutomaticSize","Y")},
{Size=U(1,-50,0,0),Position=U(0,15,0,20),BackgroundTransparency=1,AutomaticSize=E("AutomaticSize","Y"),Text="Prioritizes bounties with the most completed objectives, then the fewest objectives.\
- Summon Units: pauses every normal Auto Summon banner while this joiner is enabled. It only summons from an affordable banner in the Lobby when the selected bounty needs summons.\
- Regular Challenge: joins an available Regular Challenge, then switches directly to the next match objective. If all daily attempts are used, the bounty is rerolled.\
- Story Hard: joins Act 1 of the required Story map on Hard, then directly starts the next match objective.\
- Spirit City Raid: joins Raid Act 1, then directly starts the next match objective.\
- Infinite Wave: joins the required Infinite map on Hard, restarts immediately at the target wave, then uses the fresh stage-selection window for the next objective.\
The script returns to the Lobby only when the next unfinished objective requires summoning.",TextColor3=C(168,168,168),TextSize=14,TextXAlignment=E("TextXAlignment","Left"),TextWrapped=true,RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Light","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=2,AutomaticSize=E("AutomaticSize","X"),Text="Bounty Board Joiner",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,0,0,20),BackgroundTransparency=1,LayoutOrder=4,AutomaticSize=E("AutomaticSize","X"),Text="Auto Join Bounty Board",TextColor3=C(255,255,255),TextSize=16,TextXAlignment=E("TextXAlignment","Left"),TextTruncate=E("TextTruncate","AtEnd"),RichText=true,FontFace=F("rbxasset://fonts/families/Code.json","Medium","Normal")},
{Size=U(0,50,0,50),Position=U(0.5,0,0,-27),BackgroundTransparency=1,Image="rbxassetid://8445470826",ImageColor3=C(70,70,70),ImageRectOffset=V(704,304),ImageRectSize=V(96,96)},
{Size=U(0,25,0,25),Position=U(1,0,1,0),AnchorPoint=V(1,1),BackgroundTransparency=1,ZIndex=2},
{Size=U(0,24,0,24),BackgroundTransparency=1,ZIndex=3,Image="rbxassetid://8445470189",ImageRectOffset=V(704,604),ImageRectSize=V(96,96)},
{DominantAxis=E("DominantAxis","Height")},
{DisplayOrder=6,ZIndexBehavior=E("ZIndexBehavior","Sibling")},
{Size=U(0,50,0,50),Position=U(0,15,1,-15),AnchorPoint=V(0,1),BackgroundTransparency=1,Text=""},
{Size=U(0,50,0,50),Position=U(0,0,1,0),AnchorPoint=V(0,1),BackgroundColor3=C(255,255,255)},
{Size=U(0,40,0,40),Position=U(0.5,0,0.5,0),AnchorPoint=V(0.5,0.5),BackgroundTransparency=1,Image="rbxassetid://16791647668"},
{HorizontalAlignment=E("HorizontalAlignment","Center"),Padding=D(0,5)},
{HorizontalAlignment=E("HorizontalAlignment","Right"),Padding=D(0,5)},
{HorizontalAlignment=E("HorizontalAlignment","Right"),VerticalAlignment=E("VerticalAlignment","Bottom"),Padding=D(0,5)},
{Size=U(2,0,2,0),Position=U(0.5,0,0.5,0),AnchorPoint=V(0.5,0.5),BackgroundColor3=C(0,0,0),BackgroundTransparency=1},
{DisplayOrder=7,IgnoreGuiInset=true,ZIndexBehavior=E("ZIndexBehavior","Sibling"),ScreenInsets=E("ScreenInsets","DeviceSafeInsets")},
}
local T_ = {
0,16,269,377,1,1,270,378,2,1,271,379,3,2,272,1,3,7,273,380,3,1,274,381,6,2,275,1,6,1,276,382,6,1,277,383,9,5,278,384,
9,6,279,19,6,1,280,385,12,12,13,386,12,2,1,9,6,1,281,387,15,5,282,388,15,8,283,389,15,1,284,390,18,4,3,391,15,1,285,392,
20,2,1,1,20,7,286,8,20,3,287,393,6,5,288,394,6,3,289,395,3,1,290,396,26,2,291,1,26,17,292,397,26,9,293,398,29,3,106,399,
29,11,107,400,31,4,108,82,31,1,294,401,33,2,14,1,33,4,15,2,33,15,73,4,33,1,16,56,37,4,3,20,37,1,17,58,37,3,18,402,
37,1,19,403,41,12,13,21,33,1,295,55,43,1,70,52,44,2,71,1,43,3,72,404,26,9,296,405,47,3,106,406,47,11,107,407,49,4,108,82,
49,1,257,326,51,2,14,1,51,4,15,2,51,15,73,4,51,1,16,56,55,4,3,20,55,1,17,58,55,3,18,327,55,1,19,197,59,12,13,21,
51,1,297,3,61,4,57,2,61,1,58,36,63,1,59,37,64,2,60,1,63,1,61,39,66,2,1,1,66,9,62,40,68,2,1,1,68,5,63,38,
66,6,64,10,63,3,66,408,63,3,65,409,51,1,298,3,74,4,57,2,74,1,58,36,76,1,59,37,77,2,60,1,76,1,61,39,79,2,1,1,
79,9,62,40,81,2,1,1,81,5,63,38,79,6,64,10,76,3,66,410,76,3,65,411,49,1,299,412,87,2,14,1,87,4,15,2,87,15,73,4,
87,1,16,56,91,4,3,20,91,1,17,58,91,3,18,413,91,1,19,328,95,12,13,21,87,1,300,3,97,4,57,2,97,1,58,36,99,1,59,37,
100,2,60,1,99,1,61,39,102,2,1,1,102,9,62,40,104,2,1,1,104,5,63,38,102,6,64,10,99,3,66,414,99,3,65,415,49,1,103,88,
49,1,301,326,111,2,14,1,111,4,15,2,111,15,73,4,111,1,16,56,115,4,3,20,115,1,17,58,115,3,18,416,115,1,19,417,119,12,13,21,
111,1,302,418,121,4,303,419,121,1,304,7,123,1,305,6,123,1,306,420,125,2,307,1,123,1,308,421,127,2,1,1,127,3,309,422,127,6,310,10,
123,3,311,423,123,3,312,424,111,1,313,3,133,4,57,2,133,1,58,36,135,1,59,37,136,2,60,1,135,1,61,39,138,2,1,1,138,9,62,92,
140,2,1,1,140,5,63,38,138,6,64,10,135,3,66,425,135,3,65,426,49,1,103,88,49,1,314,427,147,2,14,1,147,4,15,2,147,15,73,4,
147,1,16,56,151,4,3,20,151,1,17,58,151,3,18,428,151,1,19,429,155,12,13,21,147,1,315,32,157,2,14,1,157,4,15,2,157,1,16,48,
160,4,3,20,160,1,17,58,160,3,18,430,160,1,19,431,164,12,13,21,160,1,37,30,166,2,38,1,166,13,39,31,157,1,316,3,169,4,57,2,
169,1,58,36,171,1,59,37,172,2,60,1,171,1,61,39,174,2,1,1,174,9,62,40,176,2,1,1,176,5,63,38,174,6,64,10,171,3,66,432,
171,3,65,433,157,1,317,3,182,4,57,2,182,1,58,36,184,1,59,37,185,2,60,1,184,1,61,39,187,2,1,1,187,9,62,40,189,2,1,1,
189,5,63,38,187,6,64,10,184,3,66,434,184,3,65,435,157,1,318,3,195,1,82,29,196,2,1,1,196,4,83,66,196,1,84,7,199,1,85,6,
199,3,86,436,199,3,102,437,196,1,87,67,203,2,88,1,203,1,89,5,205,6,90,85,205,1,91,68,207,5,78,69,157,1,319,3,209,1,82,29,
210,2,1,1,210,4,83,66,210,1,84,7,213,1,85,6,213,3,86,438,213,3,102,439,210,1,87,67,217,2,88,1,217,1,89,5,219,6,90,85,
219,1,91,68,221,5,78,69,147,1,320,32,223,2,14,1,223,4,15,2,223,1,16,48,226,4,3,20,226,1,17,58,226,3,18,440,226,1,19,441,
230,12,13,21,226,1,37,30,232,2,38,1,232,13,39,31,223,1,321,3,235,1,142,29,236,2,1,1,236,4,143,66,236,1,144,7,239,1,145,6,
239,3,146,442,239,3,147,443,236,1,104,128,243,2,148,1,243,7,149,8,243,1,150,5,246,1,151,6,246,8,104,444,246,5,78,129,147,1,322,3,
250,1,82,29,251,2,1,1,251,4,83,66,251,1,84,7,254,1,85,6,254,3,86,445,254,3,102,446,251,1,87,67,258,2,88,1,258,1,89,5,
260,6,90,85,260,1,91,68,262,5,78,69,49,1,103,88,49,1,323,447,265,2,14,1,265,4,15,2,265,15,73,4,265,1,16,56,269,4,3,20,
269,1,17,58,269,3,18,448,269,1,19,449,273,12,13,21,265,1,324,55,275,1,70,52,276,2,71,1,275,3,72,450,265,1,325,3,279,1,82,29,
280,2,1,1,280,4,83,66,280,1,84,7,283,1,85,6,283,3,86,451,283,3,102,452,280,1,87,67,287,2,88,1,287,1,89,5,289,6,90,85,
289,1,91,68,291,5,78,69,26,9,326,453,293,3,106,454,293,11,107,455,295,4,108,82,295,1,258,329,297,2,14,1,297,4,15,2,297,15,73,4,
297,1,16,56,301,4,3,20,301,1,17,58,301,3,18,330,301,1,19,331,305,12,13,21,297,1,327,3,307,4,57,2,307,1,58,36,309,1,59,37,
310,2,60,1,309,1,61,39,312,2,1,1,312,9,62,40,314,2,1,1,314,5,63,38,312,6,64,10,309,3,66,456,309,3,65,457,297,1,328,55,
320,1,70,52,321,2,71,1,320,3,72,458,295,1,329,32,324,2,14,1,324,4,15,2,324,15,73,4,324,1,16,56,328,4,3,20,328,1,17,58,
328,3,18,459,328,1,19,332,332,12,13,21,328,1,37,30,334,2,38,1,334,13,39,31,324,1,330,3,337,4,57,2,337,1,58,36,339,1,59,37,
340,2,60,1,339,1,61,39,342,2,1,1,342,9,62,40,344,2,1,1,344,5,63,38,342,6,64,10,339,3,66,460,339,3,65,461,324,1,331,3,
350,1,21,26,351,2,1,1,351,4,22,22,351,1,23,7,354,1,24,6,354,3,25,462,354,3,69,463,351,1,26,23,358,2,27,1,358,7,28,8,
358,1,29,24,361,8,20,464,358,6,30,49,363,5,31,27,358,9,32,198,365,2,33,1,365,11,34,25,367,4,35,2,365,14,36,4,350,1,4,11,
350,1,5,12,350,1,6,13,324,1,332,32,373,2,14,1,373,4,15,2,373,1,16,48,376,4,3,20,376,1,17,41,376,3,18,465,376,1,19,466,
380,12,13,21,376,1,37,30,382,2,38,1,382,13,39,31,373,1,333,3,385,1,40,29,386,2,41,1,386,4,42,33,386,1,43,7,389,1,44,6,
389,3,45,467,389,3,77,130,386,1,46,28,393,1,47,34,394,2,48,9,394,6,49,19,394,1,50,93,397,2,51,9,393,1,52,35,399,2,53,1,
399,7,54,8,399,1,55,5,402,8,56,104,373,1,334,3,404,1,40,29,405,2,41,1,405,4,42,33,405,1,43,7,408,1,44,6,408,3,45,468,
408,3,77,130,405,1,46,28,412,1,47,34,413,2,48,9,413,6,49,19,413,1,50,93,416,2,51,9,412,1,52,35,418,2,53,1,418,7,54,8,
418,1,55,5,421,8,56,104,404,1,4,11,404,1,5,12,404,1,6,13,373,1,335,3,426,1,40,29,427,2,41,1,427,4,42,33,427,1,43,7,
430,1,44,6,430,3,45,469,430,3,77,130,427,1,46,28,434,1,47,34,435,2,48,9,435,6,49,19,435,1,50,93,438,2,51,9,434,1,52,35,
440,2,53,1,440,7,54,8,440,1,55,5,443,8,56,104,426,1,4,11,426,1,5,12,426,1,6,13,373,1,336,3,448,1,40,29,449,2,41,1,
449,4,42,33,449,1,43,7,452,1,44,6,452,3,45,470,452,3,77,130,449,1,46,28,456,1,47,34,457,2,48,9,457,6,49,19,457,1,50,93,
460,2,51,9,456,1,52,35,462,2,53,1,462,7,54,8,462,1,55,5,465,8,56,104,448,1,4,11,448,1,5,12,448,1,6,13,373,1,337,3,
470,1,40,29,471,2,41,1,471,4,42,33,471,1,43,7,474,1,44,6,474,3,45,471,474,3,77,130,471,1,46,28,478,1,47,34,479,2,48,9,
479,6,49,19,479,1,50,93,482,2,51,9,478,1,52,35,484,2,53,1,484,7,54,8,484,1,55,5,487,8,56,104,470,1,4,11,470,1,5,12,
470,1,6,13,373,1,338,3,492,1,40,29,493,2,41,1,493,4,42,33,493,1,43,7,496,1,44,6,496,3,45,472,496,3,77,130,493,1,46,28,
500,1,47,34,501,2,48,9,501,6,49,19,501,1,50,93,504,2,51,9,500,1,52,35,506,2,53,1,506,7,54,8,506,1,55,5,509,8,56,104,
492,1,4,11,492,1,5,12,492,1,6,13,373,1,339,3,514,1,40,29,515,2,41,1,515,4,42,33,515,1,43,7,518,1,44,6,518,3,45,473,
518,3,77,474,515,1,46,28,522,1,47,34,523,2,48,9,523,6,49,19,523,1,50,93,526,2,51,9,522,1,52,35,528,2,53,1,528,7,54,8,
528,1,55,5,531,8,56,177,514,1,4,11,514,1,5,12,514,1,6,13,295,1,340,32,536,2,14,1,536,4,15,2,536,15,73,4,536,1,16,56,
540,4,3,20,540,1,17,58,540,3,18,475,540,1,19,476,544,12,13,21,540,1,37,30,546,2,38,1,546,13,39,31,536,1,341,3,549,4,57,2,
549,1,58,36,551,1,59,37,552,2,60,1,551,1,61,39,554,2,1,1,554,9,62,40,556,2,1,1,556,5,63,38,554,6,64,10,551,3,66,477,
551,3,65,478,536,1,342,3,562,4,57,2,562,1,58,36,564,1,59,37,565,2,60,1,564,1,61,39,567,2,1,1,567,9,62,40,569,2,1,1,
569,5,63,38,567,6,64,10,564,3,66,479,564,3,65,480,536,1,343,3,575,4,57,2,575,1,58,36,577,1,59,37,578,2,60,1,577,1,61,178,
580,2,1,1,580,9,62,40,582,2,1,1,582,5,63,38,580,6,64,10,577,3,65,481,536,1,344,3,587,4,57,2,587,1,58,36,589,1,59,37,
590,2,60,1,589,1,61,178,592,2,1,1,592,9,62,40,594,2,1,1,594,5,63,38,592,6,64,10,589,3,65,482,536,1,345,3,599,4,57,2,
599,1,58,36,601,1,59,37,602,2,60,1,601,1,61,178,604,2,1,1,604,9,62,40,606,2,1,1,606,5,63,38,604,6,64,10,601,3,65,483,
536,1,346,3,611,4,57,2,611,1,58,36,613,1,59,37,614,2,60,1,613,1,61,39,616,2,1,1,616,9,62,40,618,2,1,1,618,5,63,38,
616,6,64,10,613,3,66,484,613,3,65,485,536,1,347,3,624,4,57,2,624,1,58,36,626,1,59,37,627,2,60,1,626,1,61,39,629,2,1,1,
629,9,62,40,631,2,1,1,631,5,63,38,629,6,64,10,626,3,66,486,626,3,65,487,536,1,348,3,637,1,82,29,638,2,1,1,638,4,83,66,
638,1,84,7,641,1,85,6,641,3,86,488,641,3,102,489,638,1,87,67,645,2,88,1,645,1,89,5,647,6,90,85,647,1,91,68,649,5,78,69,
295,1,349,32,651,2,14,1,651,4,15,2,651,15,73,4,651,1,16,56,655,4,3,20,655,1,17,58,655,3,18,490,655,1,19,491,659,12,13,21,
655,1,37,30,661,2,38,1,661,13,39,31,651,1,350,32,664,2,14,1,664,4,15,2,664,1,16,48,667,4,3,20,667,1,17,41,667,3,18,492,
667,1,19,493,671,12,13,21,667,1,37,30,673,2,38,1,673,13,39,31,664,1,155,3,676,4,57,2,676,1,58,36,678,1,59,37,679,2,60,1,
678,1,61,39,681,2,1,1,681,9,62,40,683,2,1,1,683,5,63,38,681,6,64,10,678,3,66,179,678,3,65,151,664,1,152,3,689,1,21,26,
690,2,1,1,690,4,22,22,690,1,23,7,693,1,24,6,693,3,25,131,693,3,69,152,690,1,26,23,697,2,27,1,697,7,28,8,697,1,29,24,
700,8,20,132,697,6,30,49,702,5,31,27,697,9,32,54,704,2,33,1,704,11,34,25,706,4,35,2,704,14,36,4,689,1,4,11,689,1,5,12,
689,1,6,13,651,1,351,32,712,2,14,1,712,4,15,2,712,1,16,48,715,4,3,20,715,1,17,41,715,3,18,494,715,1,19,333,719,12,13,21,
715,1,37,30,721,2,38,1,721,13,39,31,712,1,155,3,724,4,57,2,724,1,58,36,726,1,59,37,727,2,60,1,726,1,61,39,729,2,1,1,
729,9,62,40,731,2,1,1,731,5,63,38,729,6,64,10,726,3,66,179,726,3,65,151,712,1,152,3,737,1,21,26,738,2,1,1,738,4,22,22,
738,1,23,7,741,1,24,6,741,3,25,131,741,3,69,152,738,1,26,23,745,2,27,1,745,7,28,8,745,1,29,24,748,8,20,132,745,6,30,49,
750,5,31,27,745,9,32,198,752,2,33,1,752,11,34,25,754,4,35,2,752,14,36,4,737,1,4,11,737,1,5,12,737,1,6,13,651,1,352,32,
760,2,14,1,760,4,15,2,760,1,16,48,763,4,3,20,763,1,17,41,763,3,18,495,763,1,19,133,767,12,13,21,763,1,37,30,769,2,38,1,
769,13,39,31,760,1,155,3,772,4,57,2,772,1,58,36,774,1,59,37,775,2,60,1,774,1,61,39,777,2,1,1,777,9,62,40,779,2,1,1,
779,5,63,38,777,6,64,10,774,3,66,179,774,3,65,151,760,1,152,3,785,1,21,26,786,2,1,1,786,4,22,22,786,1,23,7,789,1,24,6,
789,3,25,131,789,3,69,152,786,1,26,23,793,2,27,1,793,7,28,8,793,1,29,24,796,8,20,132,793,6,30,49,798,5,31,27,793,9,32,134,
800,2,33,1,800,11,34,25,802,4,35,2,800,14,36,4,785,1,4,11,785,1,5,12,785,1,6,13,651,1,353,32,808,2,14,1,808,4,15,2,
808,1,16,48,811,4,3,20,811,1,17,41,811,3,18,496,811,1,19,497,815,12,13,21,811,1,37,30,817,2,38,1,817,13,39,31,808,1,155,3,
820,4,57,2,820,1,58,36,822,1,59,37,823,2,60,1,822,1,61,39,825,2,1,1,825,9,62,40,827,2,1,1,827,5,63,38,825,6,64,10,
822,3,66,179,822,3,65,151,808,1,152,3,833,1,21,26,834,2,1,1,834,4,22,22,834,1,23,7,837,1,24,6,837,3,25,131,837,3,69,152,
834,1,26,23,841,2,27,1,841,7,28,8,841,1,29,24,844,8,20,132,841,6,30,49,846,5,31,27,841,9,32,59,848,2,33,1,848,11,34,25,
850,4,35,2,848,14,36,4,833,1,4,11,833,1,5,12,833,1,6,13,651,1,354,32,856,2,14,1,856,4,15,2,856,1,16,48,859,4,3,20,
859,1,17,41,859,3,18,498,859,1,19,499,863,12,13,21,859,1,37,30,865,2,38,1,865,13,39,31,856,1,155,3,868,4,57,2,868,1,58,36,
870,1,59,37,871,2,60,1,870,1,61,39,873,2,1,1,873,9,62,40,875,2,1,1,875,5,63,38,873,6,64,10,870,3,66,500,870,3,65,151,
856,1,152,3,881,1,21,26,882,2,1,1,882,4,22,22,882,1,23,7,885,1,24,6,885,3,25,131,885,3,69,152,882,1,26,23,889,2,27,1,
889,7,28,8,889,1,29,24,892,8,20,132,889,6,30,49,894,5,31,27,889,9,32,99,896,2,33,1,896,11,34,25,898,4,35,2,896,14,36,4,
881,1,4,11,881,1,5,12,881,1,6,13,295,1,355,32,904,2,14,1,904,4,15,2,904,15,73,4,904,1,16,56,908,4,3,20,908,1,17,58,
908,3,18,501,908,1,19,334,912,12,13,21,908,1,37,30,914,2,38,1,914,13,39,31,904,1,356,32,917,2,14,1,917,4,15,2,917,1,16,48,
920,4,3,20,920,1,17,41,920,3,18,502,920,1,19,199,924,12,13,21,920,1,37,30,926,2,38,1,926,13,39,31,917,1,357,3,929,4,57,2,
929,1,58,36,931,1,59,37,932,2,60,1,931,1,61,39,934,2,1,1,934,9,62,40,936,2,1,1,936,5,63,38,934,6,64,10,931,3,66,503,
931,3,65,504,917,1,259,3,942,1,21,26,943,2,1,1,943,4,22,22,943,1,23,7,946,1,24,6,946,3,25,335,946,3,69,505,943,1,26,23,
950,2,27,1,950,7,28,8,950,1,29,24,953,8,20,336,950,6,30,49,955,5,31,27,950,9,32,99,957,2,33,1,957,11,34,25,959,4,35,2,
957,14,36,4,942,1,4,11,942,1,5,12,942,1,6,13,904,1,358,32,965,2,14,1,965,4,15,2,965,1,16,48,968,4,3,20,968,1,17,41,
968,3,18,506,968,1,19,507,972,12,13,21,968,1,37,30,974,2,38,1,974,13,39,31,965,1,359,3,977,4,57,2,977,1,58,36,979,1,59,37,
980,2,60,1,979,1,61,39,982,2,1,1,982,9,62,40,984,2,1,1,984,5,63,38,982,6,64,10,979,3,66,508,979,3,65,509,965,1,259,3,
990,1,21,26,991,2,1,1,991,4,22,22,991,1,23,7,994,1,24,6,994,3,25,335,994,3,69,510,991,1,26,23,998,2,27,1,998,7,28,8,
998,1,29,24,1001,8,20,336,998,6,30,49,1003,5,31,27,998,9,32,99,1005,2,33,1,1005,11,34,25,1007,4,35,2,1005,14,36,4,990,1,4,11,
990,1,5,12,990,1,6,13,904,1,360,32,1013,2,14,1,1013,4,15,2,1013,1,16,48,1016,4,3,20,1016,1,17,41,1016,3,18,511,1016,1,19,200,
1020,12,13,21,1016,1,37,30,1022,2,38,1,1022,13,39,31,1013,1,260,3,1025,4,57,2,1025,1,58,36,1027,1,59,37,1028,2,60,1,1027,1,61,39,
1030,2,1,1,1030,9,62,40,1032,2,1,1,1032,5,63,38,1030,6,64,10,1027,3,66,512,1027,3,65,337,1013,1,261,3,1038,4,57,2,1038,1,58,36,
1040,1,59,37,1041,2,60,1,1040,1,61,39,1043,2,1,1,1043,9,62,40,1045,2,1,1,1045,5,63,38,1043,6,64,10,1040,3,66,513,1040,3,65,338,
1013,1,262,3,1051,4,57,2,1051,1,58,36,1053,1,59,37,1054,2,60,1,1053,1,61,39,1056,2,1,1,1056,9,62,40,1058,2,1,1,1058,5,63,38,
1056,6,64,10,1053,3,66,514,1053,3,65,339,1013,1,361,3,1064,4,57,2,1064,1,58,36,1066,1,59,37,1067,2,60,1,1066,1,61,39,1069,2,1,1,
1069,9,62,40,1071,2,1,1,1071,5,63,38,1069,6,64,10,1066,3,66,515,1066,3,65,516,1013,1,362,3,1077,4,57,2,1077,1,58,36,1079,1,59,37,
1080,2,60,1,1080,1,4,77,1080,1,5,78,1080,1,6,79,1079,1,61,39,1085,2,1,1,1085,9,62,40,1087,2,1,1,1087,5,63,38,1085,6,64,10,
1079,3,66,517,1079,3,65,518,904,1,363,32,1093,2,14,1,1093,4,15,2,1093,1,16,48,1096,4,3,20,1096,1,17,41,1096,3,18,519,1096,1,19,520,
1100,12,13,21,1096,1,37,30,1102,2,38,1,1102,13,39,31,1093,1,260,3,1105,4,57,2,1105,1,58,36,1107,1,59,37,1108,2,60,1,1107,1,61,39,
1110,2,1,1,1110,9,62,40,1112,2,1,1,1112,5,63,38,1110,6,64,10,1107,3,66,521,1107,3,65,337,1093,1,261,3,1118,4,57,2,1118,1,58,36,
1120,1,59,37,1121,2,60,1,1120,1,61,39,1123,2,1,1,1123,9,62,40,1125,2,1,1,1125,5,63,38,1123,6,64,10,1120,3,66,522,1120,3,65,338,
1093,1,262,3,1131,4,57,2,1131,1,58,36,1133,1,59,37,1134,2,60,1,1133,1,61,39,1136,2,1,1,1136,9,62,40,1138,2,1,1,1138,5,63,38,
1136,6,64,10,1133,3,66,523,1133,3,65,339,904,1,364,32,1144,2,14,1,1144,4,15,2,1144,1,16,48,1147,4,3,20,1147,1,17,41,1147,3,18,524,
1147,1,19,525,1151,12,13,21,1147,1,37,30,1153,2,38,1,1153,13,39,31,1144,1,365,3,1156,4,57,2,1156,1,58,36,1158,1,59,37,1159,2,60,1,
1158,1,61,39,1161,2,1,1,1161,9,62,40,1163,2,1,1,1163,5,63,38,1161,6,64,10,1158,3,66,526,1158,3,65,527,904,1,366,32,1169,2,14,1,
1169,4,15,2,1169,1,16,48,1172,4,3,20,1172,1,17,41,1172,3,18,528,1172,1,19,340,1176,12,13,21,1172,1,37,30,1178,2,38,1,1178,13,39,31,
1169,1,367,3,1181,4,57,2,1181,1,58,36,1183,1,59,37,1184,2,60,1,1183,1,61,39,1186,2,1,1,1186,9,62,40,1188,2,1,1,1188,5,63,38,
1186,6,64,10,1183,3,66,529,1183,3,65,530,1169,1,368,3,1194,1,21,26,1195,2,1,1,1195,4,22,22,1195,1,23,7,1198,1,24,6,1198,3,25,531,
1198,3,69,532,1195,1,26,23,1202,2,27,1,1202,7,28,8,1202,1,29,24,1205,8,20,533,1202,6,30,49,1207,5,31,27,1202,9,32,54,1209,2,33,1,
1209,11,34,25,1211,4,35,2,1209,14,36,4,1194,1,4,11,1194,1,5,12,1194,1,6,13,1169,1,369,3,1217,4,57,2,1217,1,58,36,1219,1,59,37,
1220,2,60,1,1219,1,61,39,1222,2,1,1,1222,9,62,40,1224,2,1,1,1224,5,63,38,1222,6,64,10,1219,3,66,534,1219,3,65,535,1169,1,370,32,
1230,2,14,1,1230,4,15,2,1230,1,16,48,1233,4,3,20,1233,1,17,41,1233,3,18,536,1233,1,19,180,1237,12,13,21,1233,1,37,30,1239,2,38,1,
1239,13,39,31,1230,1,371,3,1242,1,82,29,1243,2,1,1,1243,4,83,66,1243,1,84,7,1246,1,85,6,1246,3,86,537,1246,3,102,538,1243,1,87,67,
1250,2,88,1,1250,1,89,5,1252,6,90,341,1252,1,91,68,1254,5,78,69,1230,1,372,3,1256,1,82,29,1257,2,1,1,1257,4,83,66,1257,1,84,7,
1260,1,85,6,1260,3,86,539,1260,3,102,540,1257,1,87,67,1264,2,88,1,1264,1,89,5,1266,6,90,341,1266,1,91,68,1268,5,78,69,295,1,103,88,
295,1,373,541,1271,2,14,1,1271,4,15,2,1271,15,73,4,1271,1,16,56,1275,4,3,20,1275,1,17,58,1275,3,18,542,1275,1,19,543,1279,12,13,21,
1271,1,374,32,1281,2,14,1,1281,4,15,2,1281,1,16,48,1284,4,3,20,1284,1,17,41,1284,3,18,544,1284,1,19,199,1288,12,13,21,1284,1,37,30,
1290,2,38,1,1290,13,39,31,1281,1,375,3,1293,4,57,2,1293,1,58,36,1295,1,59,37,1296,2,60,1,1295,1,61,39,1298,2,1,1,1298,9,62,40,
1300,2,1,1,1300,5,63,38,1298,6,64,10,1295,3,66,201,1295,3,65,545,1281,1,165,3,1306,1,21,26,1307,2,1,1,1307,4,22,22,1307,1,23,7,
1310,1,24,6,1310,3,25,202,1310,3,69,203,1307,1,26,23,1314,2,27,1,1314,7,28,8,1314,1,29,24,1317,8,20,204,1314,6,30,49,1319,5,31,27,
1314,9,32,153,1321,2,33,1,1321,11,34,25,1323,4,35,2,1321,14,36,4,1306,1,4,11,1306,1,5,12,1306,1,6,13,1281,1,166,3,1329,4,57,2,
1329,1,58,36,1331,1,59,37,1332,2,60,1,1332,1,4,77,1332,1,5,78,1332,1,6,79,1331,1,61,39,1337,2,1,1,1337,9,62,40,1339,2,1,1,
1339,5,63,38,1337,6,64,10,1331,3,66,205,1331,3,65,206,1281,1,167,3,1345,4,57,2,1345,1,58,36,1347,1,59,37,1348,2,60,1,1348,1,4,77,
1348,1,5,78,1348,1,6,79,1347,1,61,39,1353,2,1,1,1353,9,62,40,1355,2,1,1,1355,5,63,38,1353,6,64,10,1347,3,66,207,1347,3,65,208,
1281,1,168,3,1361,1,21,26,1362,2,1,1,1362,4,22,22,1362,1,23,7,1365,1,24,6,1365,3,25,209,1365,3,69,210,1362,1,26,23,1369,2,27,1,
1369,7,28,8,1369,1,29,24,1372,3,20,546,1369,6,30,53,1374,5,31,27,1369,9,32,99,1376,2,33,1,1376,11,34,25,1378,4,35,2,1376,14,36,4,
1361,1,4,11,1361,1,5,12,1361,1,6,13,1271,1,376,32,1384,2,14,1,1384,4,15,2,1384,1,16,48,1387,4,3,20,1387,1,17,41,1387,3,18,547,
1387,1,19,548,1391,12,13,21,1387,1,37,30,1393,2,38,1,1393,13,39,31,1384,1,377,3,1396,4,57,2,1396,1,58,36,1398,1,59,37,1399,2,60,1,
1398,1,61,39,1401,2,1,1,1401,9,62,40,1403,2,1,1,1403,5,63,38,1401,6,64,10,1398,3,66,201,1398,3,65,549,1384,1,165,3,1409,1,21,26,
1410,2,1,1,1410,4,22,22,1410,1,23,7,1413,1,24,6,1413,3,25,202,1413,3,69,203,1410,1,26,23,1417,2,27,1,1417,7,28,8,1417,1,29,24,
1420,8,20,204,1417,6,30,49,1422,5,31,27,1417,9,32,99,1424,2,33,1,1424,11,34,25,1426,4,35,2,1424,14,36,4,1409,1,4,11,1409,1,5,12,
1409,1,6,13,1384,1,166,3,1432,4,57,2,1432,1,58,36,1434,1,59,37,1435,2,60,1,1435,1,4,77,1435,1,5,78,1435,1,6,79,1434,1,61,39,
1440,2,1,1,1440,9,62,40,1442,2,1,1,1442,5,63,38,1440,6,64,10,1434,3,66,205,1434,3,65,206,1384,1,167,3,1448,4,57,2,1448,1,58,36,
1450,1,59,37,1451,2,60,1,1451,1,4,77,1451,1,5,78,1451,1,6,79,1450,1,61,39,1456,2,1,1,1456,9,62,40,1458,2,1,1,1458,5,63,38,
1456,6,64,10,1450,3,66,207,1450,3,65,208,1384,1,168,3,1464,1,21,26,1465,2,1,1,1465,4,22,22,1465,1,23,7,1468,1,24,6,1468,3,25,209,
1468,3,69,210,1465,1,26,23,1472,2,27,1,1472,7,28,8,1472,1,29,24,1475,3,20,550,1472,6,30,53,1477,5,31,27,1472,9,32,99,1479,2,33,1,
1479,11,34,25,1481,4,35,2,1479,14,36,4,1464,1,4,11,1464,1,5,12,1464,1,6,13,1271,1,378,32,1487,2,14,1,1487,4,15,2,1487,1,16,48,
1490,4,3,20,1490,1,17,41,1490,3,18,551,1490,1,19,552,1494,12,13,21,1490,1,37,30,1496,2,38,1,1496,13,39,31,1487,1,379,3,1499,4,57,2,
1499,1,58,36,1501,1,59,37,1502,2,60,1,1501,1,61,39,1504,2,1,1,1504,9,62,40,1506,2,1,1,1506,5,63,38,1504,6,64,10,1501,3,66,201,
1501,3,65,553,1487,1,165,3,1512,1,21,26,1513,2,1,1,1513,4,22,22,1513,1,23,7,1516,1,24,6,1516,3,25,202,1516,3,69,203,1513,1,26,23,
1520,2,27,1,1520,7,28,8,1520,1,29,24,1523,8,20,204,1520,6,30,49,1525,5,31,27,1520,9,32,99,1527,2,33,1,1527,11,34,25,1529,4,35,2,
1527,14,36,4,1512,1,4,11,1512,1,5,12,1512,1,6,13,1487,1,166,3,1535,4,57,2,1535,1,58,36,1537,1,59,37,1538,2,60,1,1538,1,4,77,
1538,1,5,78,1538,1,6,79,1537,1,61,39,1543,2,1,1,1543,9,62,40,1545,2,1,1,1545,5,63,38,1543,6,64,10,1537,3,66,205,1537,3,65,206,
1487,1,167,3,1551,4,57,2,1551,1,58,36,1553,1,59,37,1554,2,60,1,1554,1,4,77,1554,1,5,78,1554,1,6,79,1553,1,61,39,1559,2,1,1,
1559,9,62,40,1561,2,1,1,1561,5,63,38,1559,6,64,10,1553,3,66,207,1553,3,65,208,1487,1,168,3,1567,1,21,26,1568,2,1,1,1568,4,22,22,
1568,1,23,7,1571,1,24,6,1571,3,25,209,1571,3,69,210,1568,1,26,23,1575,2,27,1,1575,7,28,8,1575,1,29,24,1578,3,20,554,1575,6,30,53,
1580,5,31,27,1575,9,32,99,1582,2,33,1,1582,11,34,25,1584,4,35,2,1582,14,36,4,1567,1,4,11,1567,1,5,12,1567,1,6,13,26,9,380,555,
1590,3,106,556,1590,11,107,557,1592,4,108,82,1592,1,381,558,1594,2,14,1,1594,4,15,2,1594,15,73,4,1594,1,16,56,1598,4,3,20,1598,1,17,58,
1598,3,18,559,1598,1,19,332,1602,12,13,21,1594,1,382,3,1604,4,57,2,1604,1,58,36,1606,1,59,37,1607,2,60,1,1606,1,61,39,1609,2,1,1,
1609,9,62,40,1611,2,1,1,1611,5,63,38,1609,6,64,10,1606,3,66,560,1606,3,65,561,1594,1,383,3,1617,1,40,29,1618,2,41,1,1618,4,42,33,
1618,1,43,7,1621,1,44,6,1621,3,45,562,1621,3,77,563,1618,1,46,28,1625,1,47,34,1626,2,48,9,1626,6,49,19,1626,1,50,51,1629,2,51,9,
1625,1,52,35,1631,2,53,1,1631,7,54,8,1631,1,55,5,1634,8,56,50,1594,1,384,3,1636,1,109,26,1637,2,1,1,1637,4,110,22,1637,1,111,7,
1640,1,112,6,1640,3,113,564,1640,3,114,565,1637,1,7,23,1644,2,115,1,1644,7,116,8,1644,1,8,24,1647,8,20,566,1644,6,117,49,1649,5,118,105,
1644,9,119,59,1651,2,120,1,1651,11,121,25,1653,11,122,106,1653,1,385,107,1655,10,9,4,1655,1,10,16,1657,2,1,1,1657,1,2,17,1659,2,1,15,
1659,7,11,18,1659,1,8,5,1662,8,7,89,1657,3,12,567,1653,1,386,108,1665,10,9,4,1665,1,10,16,1667,2,1,1,1667,1,2,17,1669,2,1,15,
1669,7,11,18,1669,1,8,5,1672,8,7,94,1667,3,12,568,1653,1,387,109,1675,10,9,4,1675,1,10,16,1677,2,1,1,1677,1,2,17,1679,2,1,15,
1679,7,11,18,1679,1,8,5,1682,8,7,84,1677,3,12,569,1653,1,388,110,1685,10,9,4,1685,1,10,16,1687,2,1,1,1687,1,2,17,1689,2,1,15,
1689,7,11,18,1689,1,8,5,1692,8,7,50,1687,3,12,570,1653,1,389,111,1695,10,9,4,1695,1,10,16,1697,2,1,1,1697,1,2,17,1699,2,1,15,
1699,7,11,18,1699,1,8,5,1702,8,7,112,1697,3,12,571,1653,1,390,113,1705,10,9,4,1705,1,10,16,1707,2,1,1,1707,1,2,17,1709,2,1,15,
1709,7,11,18,1709,1,8,5,1712,8,7,95,1707,3,12,572,1653,1,391,114,1715,10,9,4,1715,1,10,16,1717,2,1,1,1717,1,2,17,1719,2,1,15,
1719,7,11,18,1719,1,8,5,1722,8,7,96,1717,3,12,573,1653,1,392,115,1725,10,9,4,1725,1,10,16,1727,2,1,1,1727,1,2,17,1729,2,1,15,
1729,7,11,18,1729,1,8,5,1732,8,7,116,1727,3,12,574,1653,1,393,117,1735,10,9,4,1735,1,10,16,1737,2,1,1,1737,1,2,17,1739,2,1,15,
1739,7,11,18,1739,1,8,5,1742,8,7,118,1737,3,12,575,1594,1,394,32,1745,2,14,1,1745,4,15,2,1745,1,16,48,1748,4,3,20,1748,1,17,41,
1748,3,18,576,1748,1,19,211,1752,12,13,21,1748,1,37,30,1754,2,38,1,1754,13,39,31,1745,1,395,3,1757,4,57,2,1757,1,58,36,1759,1,59,37,
1760,2,60,1,1759,1,61,39,1762,2,1,1,1762,9,62,40,1764,2,1,1,1764,5,63,38,1762,6,64,10,1759,3,66,577,1759,3,65,578,1745,1,396,3,
1770,1,40,29,1771,2,41,1,1771,4,42,33,1771,1,43,7,1774,1,44,6,1774,3,45,579,1774,3,77,97,1771,1,46,28,1778,1,47,34,1779,2,48,9,
1779,6,49,19,1779,1,50,51,1782,2,51,9,1778,1,52,35,1784,2,53,1,1784,7,54,8,1784,1,55,5,1787,8,56,50,1770,1,4,11,1770,1,5,12,
1770,1,6,13,1745,1,397,3,1792,1,40,29,1793,2,41,1,1793,4,42,33,1793,1,43,7,1796,1,44,6,1796,3,45,580,1796,3,77,97,1793,1,46,28,
1800,1,47,34,1801,2,48,9,1801,6,49,19,1801,1,50,51,1804,2,51,9,1800,1,52,35,1806,2,53,1,1806,7,54,8,1806,1,55,5,1809,8,56,50,
1792,1,4,11,1792,1,5,12,1792,1,6,13,1745,1,398,3,1814,1,40,29,1815,2,41,1,1815,4,42,33,1815,1,43,7,1818,1,44,6,1818,3,45,581,
1818,3,77,97,1815,1,46,28,1822,1,47,34,1823,2,48,9,1823,6,49,19,1823,1,50,51,1826,2,51,9,1822,1,52,35,1828,2,53,1,1828,7,54,8,
1828,1,55,5,1831,8,56,50,1814,1,4,11,1814,1,5,12,1814,1,6,13,1745,1,399,3,1836,1,40,29,1837,2,41,1,1837,4,42,33,1837,1,43,7,
1840,1,44,6,1840,3,45,582,1840,3,77,97,1837,1,46,28,1844,1,47,34,1845,2,48,9,1845,6,49,19,1845,1,50,51,1848,2,51,9,1844,1,52,35,
1850,2,53,1,1850,7,54,8,1850,1,55,5,1853,8,56,50,1836,1,4,11,1836,1,5,12,1836,1,6,13,1745,1,400,3,1858,1,40,29,1859,2,41,1,
1859,4,42,33,1859,1,43,7,1862,1,44,6,1862,3,45,583,1862,3,77,97,1859,1,46,28,1866,1,47,34,1867,2,48,9,1867,6,49,19,1867,1,50,51,
1870,2,51,9,1866,1,52,35,1872,2,53,1,1872,7,54,8,1872,1,55,5,1875,8,56,50,1858,1,4,11,1858,1,5,12,1858,1,6,13,1745,1,401,3,
1880,1,40,29,1881,2,41,1,1881,4,42,33,1881,1,43,7,1884,1,44,6,1884,3,45,584,1884,3,77,97,1881,1,46,28,1888,1,47,34,1889,2,48,9,
1889,6,49,19,1889,1,50,51,1892,2,51,9,1888,1,52,35,1894,2,53,1,1894,7,54,8,1894,1,55,5,1897,8,56,50,1880,1,4,11,1880,1,5,12,
1880,1,6,13,1745,1,402,3,1902,1,40,29,1903,2,41,1,1903,4,42,33,1903,1,43,7,1906,1,44,6,1906,3,45,585,1906,3,77,97,1903,1,46,28,
1910,1,47,34,1911,2,48,9,1911,6,49,19,1911,1,50,51,1914,2,51,9,1910,1,52,35,1916,2,53,1,1916,7,54,8,1916,1,55,5,1919,8,56,50,
1902,1,4,11,1902,1,5,12,1902,1,6,13,1745,1,403,3,1924,1,40,29,1925,2,41,1,1925,4,42,33,1925,1,43,7,1928,1,44,6,1928,3,45,586,
1928,3,77,97,1925,1,46,28,1932,1,47,34,1933,2,48,9,1933,6,49,19,1933,1,50,51,1936,2,51,9,1932,1,52,35,1938,2,53,1,1938,7,54,8,
1938,1,55,5,1941,8,56,50,1924,1,4,11,1924,1,5,12,1924,1,6,13,1745,1,404,3,1946,1,40,29,1947,2,41,1,1947,4,42,33,1947,1,43,7,
1950,1,44,6,1950,3,45,587,1950,3,77,97,1947,1,46,28,1954,1,47,34,1955,2,48,9,1955,6,49,19,1955,1,50,51,1958,2,51,9,1954,1,52,35,
1960,2,53,1,1960,7,54,8,1960,1,55,5,1963,8,56,50,1946,1,4,11,1946,1,5,12,1946,1,6,13,1592,1,103,88,1592,1,405,32,1969,2,14,1,
1969,4,15,2,1969,15,73,4,1969,1,16,56,1973,4,3,20,1973,1,17,58,1973,3,18,588,1973,1,19,589,1977,12,13,21,1973,1,37,30,1979,2,38,1,
1979,13,39,31,1969,1,406,3,1982,4,57,2,1982,1,58,36,1984,1,59,37,1985,2,60,1,1984,1,61,39,1987,2,1,1,1987,9,62,40,1989,2,1,1,
1989,5,63,38,1987,6,64,10,1984,3,66,590,1984,3,65,591,1969,1,123,3,1995,4,57,2,1995,1,58,36,1997,1,59,37,1998,2,60,1,1998,1,4,77,
1998,1,5,78,1998,1,6,79,1997,1,61,39,2003,2,1,1,2003,9,62,40,2005,2,1,1,2005,5,63,38,2003,6,64,10,1997,3,66,119,1997,3,65,120,
1969,1,169,3,2011,1,21,135,2012,2,1,1,2012,4,22,22,2012,1,23,7,2015,1,24,6,2015,3,25,212,2015,3,69,592,2012,1,26,23,2019,2,27,1,
2019,7,28,8,2019,1,29,24,2022,8,20,213,2019,6,30,49,2024,5,31,27,2019,9,32,134,2026,2,33,1,2026,11,34,25,2028,4,35,2,2026,14,36,4,
2011,1,92,70,2031,1,170,3,2032,1,21,26,2033,2,1,1,2033,4,22,22,2033,1,23,7,2036,1,24,6,2036,3,25,214,2033,1,26,23,2039,2,27,1,
2039,7,28,8,2039,1,29,24,2042,3,20,215,2039,6,30,53,2044,5,31,27,2039,9,32,198,2046,2,33,1,2046,11,34,25,2048,4,35,2,2046,14,36,216,
1969,1,407,3,2051,1,21,26,2052,2,1,1,2052,4,22,22,2052,1,23,7,2055,1,24,6,2055,3,25,593,2052,1,26,23,2058,2,27,1,2058,7,28,8,
2058,1,29,24,2061,3,20,594,2058,6,30,53,2063,5,31,27,2058,9,32,154,2065,2,33,1,2065,11,34,25,2067,4,35,2,2065,14,36,595,1592,1,408,32,
2070,2,14,1,2070,4,15,2,2070,15,73,4,2070,1,16,56,2074,4,3,20,2074,1,17,58,2074,3,18,596,2074,1,19,342,2078,12,13,21,2074,1,37,30,
2080,2,38,1,2080,13,39,31,2070,1,409,3,2083,4,57,2,2083,1,58,36,2085,1,59,37,2086,2,60,1,2085,1,61,39,2088,2,1,1,2088,9,62,40,
2090,2,1,1,2090,5,63,38,2088,6,64,10,2085,3,66,597,2085,3,65,598,2070,1,123,3,2096,4,57,2,2096,1,58,36,2098,1,59,37,2099,2,60,1,
2099,1,4,77,2099,1,5,78,2099,1,6,79,2098,1,61,39,2104,2,1,1,2104,9,62,40,2106,2,1,1,2106,5,63,38,2104,6,64,10,2098,3,66,119,
2098,3,65,120,2070,1,169,3,2112,1,21,135,2113,2,1,1,2113,4,22,22,2113,1,23,7,2116,1,24,6,2116,3,25,212,2116,3,69,599,2113,1,26,23,
2120,2,27,1,2120,7,28,8,2120,1,29,24,2123,8,20,213,2120,6,30,49,2125,5,31,27,2120,9,32,600,2127,2,33,1,2127,11,34,25,2129,4,35,2,
2127,14,36,4,2112,1,92,70,2132,1,170,3,2133,1,21,26,2134,2,1,1,2134,4,22,22,2134,1,23,7,2137,1,24,6,2137,3,25,214,2134,1,26,23,
2140,2,27,1,2140,7,28,8,2140,1,29,24,2143,3,20,215,2140,6,30,53,2145,5,31,27,2140,9,32,153,2147,2,33,1,2147,11,34,25,2149,4,35,2,
2147,14,36,216,2070,1,410,3,2152,4,57,2,2152,1,58,36,2154,1,59,37,2155,2,60,1,2154,1,61,39,2157,2,1,1,2157,9,62,40,2159,2,1,1,
2159,5,63,38,2157,6,64,10,2154,3,66,601,2154,3,65,602,2070,1,411,3,2165,1,40,29,2166,2,41,1,2166,4,42,33,2166,1,43,7,2169,1,44,6,
2169,3,45,603,2169,3,77,604,2166,1,46,28,2173,1,47,34,2174,2,48,9,2174,6,49,19,2174,1,50,605,2177,2,51,9,2173,1,52,35,2179,2,53,1,
2179,7,54,8,2179,1,55,5,2182,8,56,217,2165,1,4,11,2165,1,5,12,2165,1,6,13,1592,1,412,32,2187,2,14,1,2187,4,15,2,2187,15,73,4,
2187,1,16,56,2191,4,3,20,2191,1,17,58,2191,3,18,606,2191,1,19,343,2195,12,13,21,2191,1,37,30,2197,2,38,1,2197,13,39,31,2187,1,413,3,
2200,4,57,2,2200,1,58,36,2202,1,59,37,2203,2,60,1,2202,1,61,39,2205,2,1,1,2205,9,62,40,2207,2,1,1,2207,5,63,38,2205,6,64,10,
2202,3,66,607,2202,3,65,608,2187,1,123,3,2213,4,57,2,2213,1,58,36,2215,1,59,37,2216,2,60,1,2216,1,4,77,2216,1,5,78,2216,1,6,79,
2215,1,61,39,2221,2,1,1,2221,9,62,40,2223,2,1,1,2223,5,63,38,2221,6,64,10,2215,3,66,119,2215,3,65,120,2187,1,170,3,2229,1,21,26,
2230,2,1,1,2230,4,22,22,2230,1,23,7,2233,1,24,6,2233,3,25,214,2233,3,69,609,2230,1,26,23,2237,2,27,1,2237,7,28,8,2237,1,29,24,
2240,3,20,215,2237,6,30,53,2242,5,31,27,2237,9,32,153,2244,2,33,1,2244,11,34,25,2246,4,35,2,2244,14,36,216,2187,1,414,3,2249,4,57,2,
2249,1,58,36,2251,1,59,37,2252,2,60,1,2251,1,61,39,2254,2,1,1,2254,9,62,40,2256,2,1,1,2256,5,63,38,2254,6,64,10,2251,3,66,610,
2251,3,65,611,2187,1,415,3,2262,4,57,2,2262,1,58,36,2264,1,59,37,2265,2,60,1,2265,1,4,77,2265,1,5,78,2265,1,6,79,2264,1,61,39,
2270,2,1,1,2270,9,62,40,2272,2,1,1,2272,5,63,38,2270,6,64,10,2264,3,66,612,2264,3,65,613,1592,1,416,32,2278,2,14,1,2278,4,15,2,
2278,15,73,4,2278,1,16,56,2282,4,3,20,2282,1,17,58,2282,3,18,614,2282,1,19,342,2286,12,13,21,2282,1,37,30,2288,2,38,1,2288,13,39,31,
2278,1,417,3,2291,4,57,2,2291,1,58,36,2293,1,59,37,2294,2,60,1,2293,1,61,39,2296,2,1,1,2296,9,62,40,2298,2,1,1,2298,5,63,38,
2296,6,64,10,2293,3,66,615,2293,3,65,616,2278,1,418,3,2304,1,21,26,2305,2,1,1,2305,4,22,22,2305,1,23,7,2308,1,24,6,2308,3,25,617,
2308,3,69,618,2305,1,26,23,2312,2,27,1,2312,7,28,8,2312,1,29,24,2315,8,20,619,2312,6,30,49,2317,5,31,27,2312,9,32,54,2319,2,33,1,
2319,11,34,25,2321,4,35,2,2319,14,36,4,2304,1,4,11,2304,1,5,12,2304,1,6,13,1592,1,419,32,2327,2,14,1,2327,4,15,2,2327,15,73,4,
2327,1,16,56,2331,4,3,20,2331,1,17,620,2331,3,18,621,2331,1,19,622,2335,12,13,21,2331,1,37,30,2337,2,38,1,2337,13,39,31,2327,1,420,3,
2340,4,57,2,2340,1,58,36,2342,1,59,37,2343,2,60,1,2342,1,61,39,2345,2,1,1,2345,9,62,40,2347,2,1,1,2347,5,63,38,2345,6,64,10,
2342,3,66,623,2342,3,65,624,2327,1,123,3,2353,4,57,2,2353,1,58,36,2355,1,59,37,2356,2,60,1,2356,1,4,77,2356,1,5,78,2356,1,6,79,
2355,1,61,39,2361,2,1,1,2361,9,62,40,2363,2,1,1,2363,5,63,38,2361,6,64,10,2355,3,66,119,2355,3,65,120,2327,1,169,3,2369,1,21,135,
2370,2,1,1,2370,4,22,22,2370,1,23,7,2373,1,24,6,2373,3,25,212,2373,3,69,625,2370,1,26,23,2377,2,27,1,2377,7,28,8,2377,1,29,24,
2380,8,20,213,2377,6,30,49,2382,5,31,27,2377,9,32,153,2384,2,33,1,2384,11,34,25,2386,4,35,2,2384,14,36,4,2369,1,92,70,2389,1,421,3,
2390,1,21,26,2391,2,1,1,2391,4,22,22,2391,1,23,7,2394,1,24,6,2394,3,25,626,2394,3,69,627,2391,1,26,23,2398,2,27,1,2398,7,28,8,
2398,1,29,24,2401,3,20,628,2398,6,30,53,2403,5,31,27,2398,9,32,153,2405,2,33,1,2405,11,34,25,2407,4,35,2,2405,14,36,629,2327,1,422,32,
2410,2,14,1,2410,4,15,2,2410,1,16,48,2413,4,3,20,2413,1,17,41,2413,3,18,630,2413,1,19,344,2417,12,13,21,2413,1,37,30,2419,2,38,1,
2419,13,39,31,2410,1,423,3,2422,4,57,2,2422,1,58,36,2424,1,59,37,2425,2,60,1,2424,1,61,39,2427,2,1,1,2427,9,62,40,2429,2,1,1,
2429,5,63,38,2427,6,64,10,2424,3,66,631,2424,3,65,632,2410,1,424,3,2435,1,40,29,2436,2,41,1,2436,4,42,33,2436,1,43,7,2439,1,44,6,
2439,3,45,633,2439,3,77,634,2436,1,46,28,2443,1,47,34,2444,2,48,9,2444,6,49,19,2444,1,50,345,2447,2,51,9,2443,1,52,35,2449,2,53,1,
2449,7,54,8,2449,1,55,5,2452,8,56,217,2435,1,4,11,2435,1,5,12,2435,1,6,13,2410,1,425,3,2457,4,57,2,2457,1,58,36,2459,1,59,37,
2460,2,60,1,2459,1,61,39,2462,2,1,1,2462,9,62,40,2464,2,1,1,2464,5,63,38,2462,6,64,10,2459,3,66,635,2459,3,65,636,2410,1,426,3,
2470,1,40,29,2471,2,41,1,2471,4,42,33,2471,1,43,7,2474,1,44,6,2474,3,45,637,2474,3,77,638,2471,1,46,28,2478,1,47,34,2479,2,48,9,
2479,6,49,19,2479,1,50,345,2482,2,51,9,2478,1,52,35,2484,2,53,1,2484,7,54,8,2484,1,55,5,2487,8,56,217,2470,1,4,11,2470,1,5,12,
2470,1,6,13,2327,1,427,3,2492,4,57,2,2492,1,58,36,2494,1,59,37,2495,2,60,1,2494,1,61,39,2497,2,1,1,2497,9,62,40,2499,2,1,1,
2499,5,63,38,2497,6,64,10,2494,3,66,639,2494,3,65,640,2327,1,428,3,2505,4,57,2,2505,1,58,36,2507,1,59,37,2508,2,60,1,2507,1,61,39,
2510,2,1,1,2510,9,62,40,2512,2,1,1,2512,5,63,38,2510,6,64,10,2507,3,66,641,2507,3,65,642,2327,1,263,32,2518,2,14,1,2518,4,15,2,
2518,1,16,48,2521,4,3,20,2521,1,17,41,2521,3,18,643,2521,1,19,644,2525,12,13,21,2521,1,37,30,2527,2,38,1,2527,13,39,31,2518,1,264,3,
2530,4,57,2,2530,1,58,36,2532,1,59,37,2533,2,60,1,2532,1,61,39,2535,2,1,1,2535,9,62,40,2537,2,1,1,2537,5,63,38,2535,6,64,10,
2532,3,66,645,2532,3,65,346,2518,1,429,3,2543,1,40,29,2544,2,41,1,2544,4,42,33,2544,1,43,7,2547,1,44,6,2547,3,45,646,2547,3,77,647,
2544,1,46,28,2551,1,47,34,2552,2,48,9,2552,6,49,19,2552,1,50,648,2555,2,51,9,2551,1,52,35,2557,2,53,1,2557,7,54,8,2557,1,55,5,
2560,8,56,136,2543,1,4,11,2543,1,5,12,2543,1,6,13,2327,1,430,32,2565,2,14,1,2565,4,15,2,2565,1,16,48,2568,4,3,20,2568,1,17,41,
2568,3,18,649,2568,1,19,155,2572,12,13,21,2568,1,37,30,2574,2,38,1,2574,13,39,31,2565,1,431,3,2577,4,57,2,2577,1,58,36,2579,1,59,37,
2580,2,60,1,2579,1,61,39,2582,2,1,1,2582,9,62,40,2584,2,1,1,2584,5,63,38,2582,6,64,10,2579,3,66,650,2579,3,65,651,2565,1,432,3,
2590,1,40,29,2591,2,41,1,2591,4,42,33,2591,1,43,7,2594,1,44,6,2594,3,45,652,2594,3,77,653,2591,1,46,28,2598,1,47,34,2599,2,48,9,
2599,6,49,19,2599,1,50,654,2602,2,51,9,2598,1,52,35,2604,2,53,1,2604,7,54,8,2604,1,55,5,2607,8,56,100,2590,1,4,11,2590,1,5,12,
2590,1,6,13,2327,1,433,32,2612,2,14,1,2612,4,15,2,2612,1,16,48,2615,4,3,20,2615,1,17,41,2615,3,18,655,2615,1,19,218,2619,12,13,21,
2615,1,37,30,2621,2,38,1,2621,13,39,31,2612,1,434,3,2624,4,57,2,2624,1,58,36,2626,1,59,37,2627,2,60,1,2626,1,61,39,2629,2,1,1,
2629,9,62,40,2631,2,1,1,2631,5,63,38,2629,6,64,10,2626,3,66,656,2626,3,65,657,2612,1,435,3,2637,1,21,26,2638,2,1,1,2638,4,22,22,
2638,1,23,7,2641,1,24,6,2641,3,25,658,2641,3,69,659,2638,1,26,23,2645,2,27,1,2645,7,28,8,2645,1,29,24,2648,3,20,660,2645,6,30,53,
2650,5,31,27,2645,9,32,154,2652,2,33,1,2652,11,34,25,2654,4,35,2,2652,14,36,661,2637,1,4,11,2637,1,5,12,2637,1,6,13,2612,1,436,86,
2660,4,57,2,2660,1,58,36,2662,1,59,37,2663,2,60,1,2663,1,4,77,2663,1,5,78,2663,1,6,79,2662,1,61,39,2668,2,1,1,2668,9,62,92,
2670,2,1,1,2670,5,63,38,2668,6,64,10,2662,3,66,662,2662,3,65,663,2612,1,437,156,2676,1,70,52,2677,2,71,1,2676,3,72,664,2612,1,438,3,
2680,1,109,26,2681,2,1,1,2681,4,110,22,2681,1,111,7,2684,1,112,6,2684,3,113,665,2684,3,114,347,2681,1,7,23,2688,2,115,1,2688,7,116,8,
2688,1,8,24,2691,8,20,666,2688,6,117,49,2693,5,118,105,2688,9,119,137,2695,2,120,1,2695,11,121,25,2697,11,122,106,2697,1,171,219,2699,10,9,4,
2699,1,10,16,2701,2,1,1,2701,1,2,17,2703,2,1,15,2703,7,11,18,2703,1,8,5,2706,8,7,181,2701,3,12,220,2697,1,172,221,2709,10,9,4,
2709,1,10,16,2711,2,1,1,2711,1,2,17,2713,2,1,15,2713,7,11,18,2713,1,8,5,2716,8,7,157,2711,3,12,222,2697,1,173,223,2719,10,9,4,
2719,1,10,16,2721,2,1,1,2721,1,2,17,2723,2,1,15,2723,7,11,18,2723,1,8,5,2726,8,7,158,2721,3,12,224,2697,1,174,225,2729,10,9,4,
2729,1,10,16,2731,2,1,1,2731,1,2,17,2733,2,1,15,2733,7,11,18,2733,1,8,5,2736,8,7,138,2731,3,12,226,2697,1,175,227,2739,10,9,4,
2739,1,10,16,2741,2,1,1,2741,1,2,17,2743,2,1,15,2743,7,11,18,2743,1,8,5,2746,8,7,112,2741,3,12,228,2697,1,176,229,2749,10,9,4,
2749,1,10,16,2751,2,1,1,2751,1,2,17,2753,2,1,15,2753,7,11,18,2753,1,8,5,2756,8,7,100,2751,3,12,230,2697,1,177,159,2759,10,9,4,
2759,1,10,16,2761,2,1,1,2761,1,2,17,2763,2,1,15,2763,7,11,18,2763,1,8,5,2766,8,7,231,2761,3,12,232,2697,1,178,115,2769,10,9,4,
2769,1,10,16,2771,2,1,1,2771,1,2,17,2773,2,1,15,2773,7,11,18,2773,1,8,5,2776,8,7,233,2771,3,12,234,2697,1,179,182,2779,10,9,4,
2779,1,10,16,2781,2,1,1,2781,1,2,17,2783,2,1,15,2783,7,11,18,2783,1,8,5,2786,8,7,177,2781,3,12,235,2697,1,180,160,2789,10,9,4,
2789,1,10,16,2791,2,1,1,2791,1,2,17,2793,2,1,15,2793,7,11,18,2793,1,8,5,2796,8,7,236,2791,3,12,237,2697,1,181,238,2799,10,9,4,
2799,1,10,16,2801,2,1,1,2801,1,2,17,2803,2,1,15,2803,7,11,18,2803,1,8,5,2806,8,7,239,2801,3,12,240,2697,1,182,241,2809,10,9,4,
2809,1,10,16,2811,2,1,1,2811,1,2,17,2813,2,1,15,2813,7,11,18,2813,1,8,5,2816,8,7,94,2811,3,12,242,2697,1,183,243,2819,10,9,4,
2819,1,10,16,2821,2,1,1,2821,1,2,17,2823,2,1,15,2823,7,11,18,2823,1,8,5,2826,8,7,244,2821,3,12,245,2697,1,184,109,2829,10,9,4,
2829,1,10,16,2831,2,1,1,2831,1,2,17,2833,2,1,15,2833,7,11,18,2833,1,8,5,2836,8,7,246,2831,3,12,247,2697,1,185,248,2839,10,9,4,
2839,1,10,16,2841,2,1,1,2841,1,2,17,2843,2,1,15,2843,7,11,18,2843,1,8,5,2846,8,7,249,2841,3,12,250,2697,1,186,114,2849,10,9,4,
2849,1,10,16,2851,2,1,1,2851,1,2,17,2853,2,1,15,2853,7,11,18,2853,1,8,5,2856,8,7,251,2851,3,12,252,2697,1,187,253,2859,10,9,4,
2859,1,10,16,2861,2,1,1,2861,1,2,17,2863,2,1,15,2863,7,11,18,2863,1,8,5,2866,8,7,118,2861,3,12,254,2697,1,188,255,2869,10,9,4,
2869,1,10,16,2871,2,1,1,2871,1,2,17,2873,2,1,15,2873,7,11,18,2873,1,8,5,2876,8,7,136,2871,3,12,256,2697,1,189,257,2879,10,9,4,
2879,1,10,16,2881,2,1,1,2881,1,2,17,2883,2,1,15,2883,7,11,18,2883,1,8,5,2886,8,7,183,2881,3,12,258,2697,1,190,117,2889,10,9,4,
2889,1,10,16,2891,2,1,1,2891,1,2,17,2893,2,1,15,2893,7,11,18,2893,1,8,5,2896,8,7,259,2891,3,12,260,2697,1,191,184,2899,10,9,4,
2899,1,10,16,2901,2,1,1,2901,1,2,17,2903,2,1,15,2903,7,11,18,2903,1,8,5,2906,8,7,261,2901,3,12,262,2697,1,192,263,2909,10,9,4,
2909,1,10,16,2911,2,1,1,2911,1,2,17,2913,2,1,15,2913,7,11,18,2913,1,8,5,2916,8,7,101,2911,3,12,264,2697,1,193,265,2919,10,9,4,
2919,1,10,16,2921,2,1,1,2921,1,2,17,2923,2,1,15,2923,7,11,18,2923,1,8,5,2926,8,7,89,2921,3,12,266,2697,1,194,107,2929,10,9,4,
2929,1,10,16,2931,2,1,1,2931,1,2,17,2933,2,1,15,2933,7,11,18,2933,1,8,5,2936,8,7,267,2931,3,12,268,2697,1,195,269,2939,10,9,4,
2939,1,10,16,2941,2,1,1,2941,1,2,17,2943,2,1,15,2943,7,11,18,2943,1,8,5,2946,8,7,84,2941,3,12,270,2697,1,196,113,2949,10,9,4,
2949,1,10,16,2951,2,1,1,2951,1,2,17,2953,2,1,15,2953,7,11,18,2953,1,8,5,2956,8,7,271,2951,3,12,272,2697,1,197,273,2959,10,9,4,
2959,1,10,16,2961,2,1,1,2961,1,2,17,2963,2,1,15,2963,7,11,18,2963,1,8,5,2966,8,7,274,2961,3,12,275,2697,1,198,276,2969,10,9,4,
2969,1,10,16,2971,2,1,1,2971,1,2,17,2973,2,1,15,2973,7,11,18,2973,1,8,5,2976,8,7,96,2971,3,12,277,2697,1,199,110,2979,10,9,4,
2979,1,10,16,2981,2,1,1,2981,1,2,17,2983,2,1,15,2983,7,11,18,2983,1,8,5,2986,8,7,278,2981,3,12,279,2697,1,200,280,2989,10,9,4,
2989,1,10,16,2991,2,1,1,2991,1,2,17,2993,2,1,15,2993,7,11,18,2993,1,8,5,2996,8,7,95,2991,3,12,281,2697,1,201,161,2999,10,9,4,
2999,1,10,16,3001,2,1,1,3001,1,2,17,3003,2,1,15,3003,7,11,18,3003,1,8,5,3006,8,7,282,3001,3,12,283,2697,1,202,284,3009,10,9,4,
3009,1,10,16,3011,2,1,1,3011,1,2,17,3013,2,1,15,3013,7,11,18,3013,1,8,5,3016,8,7,162,3011,3,12,285,2697,1,203,163,3019,10,9,4,
3019,1,10,16,3021,2,1,1,3021,1,2,17,3023,2,1,15,3023,7,11,18,3023,1,8,5,3026,8,7,286,3021,3,12,287,2697,1,204,288,3029,10,9,4,
3029,1,10,16,3031,2,1,1,3031,1,2,17,3033,2,1,15,3033,7,11,18,3033,1,8,5,3036,8,7,289,3031,3,12,290,2697,1,205,111,3039,10,9,4,
3039,1,10,16,3041,2,1,1,3041,1,2,17,3043,2,1,15,3043,7,11,18,3043,1,8,5,3046,8,7,291,3041,3,12,292,2697,1,206,108,3049,10,9,4,
3049,1,10,16,3051,2,1,1,3051,1,2,17,3053,2,1,15,3053,7,11,18,3053,1,8,5,3056,8,7,293,3051,3,12,294,2697,1,207,295,3059,10,9,4,
3059,1,10,16,3061,2,1,1,3061,1,2,17,3063,2,1,15,3063,7,11,18,3063,1,8,5,3066,8,7,296,3061,3,12,297,2697,1,208,139,3069,10,9,4,
3069,1,10,16,3071,2,1,1,3071,1,2,17,3073,2,1,15,3073,7,11,18,3073,1,8,5,3076,8,7,298,3071,3,12,299,2697,1,209,164,3079,10,9,4,
3079,1,10,16,3081,2,1,1,3081,1,2,17,3083,2,1,15,3083,7,11,18,3083,1,8,5,3086,8,7,300,3081,3,12,301,2697,1,210,302,3089,10,9,4,
3089,1,10,16,3091,2,1,1,3091,1,2,17,3093,2,1,15,3093,7,11,18,3093,1,8,5,3096,8,7,116,3091,3,12,303,2680,1,4,11,2680,1,5,12,
2680,1,6,13,2612,1,439,86,3102,1,109,26,3103,2,1,1,3103,4,110,22,3103,1,111,7,3106,1,112,6,3106,3,113,667,3106,3,114,668,3103,1,7,23,
3110,2,115,1,3110,7,116,8,3110,1,8,24,3113,8,20,669,3110,6,117,49,3115,5,118,105,3110,9,119,137,3117,2,120,1,3117,11,121,25,3119,11,122,106,
3119,1,171,219,3121,10,9,4,3121,1,10,16,3123,2,1,1,3123,1,2,17,3125,2,1,15,3125,7,11,18,3125,1,8,5,3128,8,7,181,3123,3,12,220,
3119,1,172,221,3131,10,9,4,3131,1,10,16,3133,2,1,1,3133,1,2,17,3135,2,1,15,3135,7,11,18,3135,1,8,5,3138,8,7,157,3133,3,12,222,
3119,1,173,223,3141,10,9,4,3141,1,10,16,3143,2,1,1,3143,1,2,17,3145,2,1,15,3145,7,11,18,3145,1,8,5,3148,8,7,158,3143,3,12,224,
3119,1,174,225,3151,10,9,4,3151,1,10,16,3153,2,1,1,3153,1,2,17,3155,2,1,15,3155,7,11,18,3155,1,8,5,3158,8,7,138,3153,3,12,226,
3119,1,175,227,3161,10,9,4,3161,1,10,16,3163,2,1,1,3163,1,2,17,3165,2,1,15,3165,7,11,18,3165,1,8,5,3168,8,7,112,3163,3,12,228,
3119,1,176,229,3171,10,9,4,3171,1,10,16,3173,2,1,1,3173,1,2,17,3175,2,1,15,3175,7,11,18,3175,1,8,5,3178,8,7,100,3173,3,12,230,
3119,1,177,159,3181,10,9,4,3181,1,10,16,3183,2,1,1,3183,1,2,17,3185,2,1,15,3185,7,11,18,3185,1,8,5,3188,8,7,231,3183,3,12,232,
3119,1,178,115,3191,10,9,4,3191,1,10,16,3193,2,1,1,3193,1,2,17,3195,2,1,15,3195,7,11,18,3195,1,8,5,3198,8,7,233,3193,3,12,234,
3119,1,179,182,3201,10,9,4,3201,1,10,16,3203,2,1,1,3203,1,2,17,3205,2,1,15,3205,7,11,18,3205,1,8,5,3208,8,7,177,3203,3,12,235,
3119,1,180,160,3211,10,9,4,3211,1,10,16,3213,2,1,1,3213,1,2,17,3215,2,1,15,3215,7,11,18,3215,1,8,5,3218,8,7,236,3213,3,12,237,
3119,1,181,238,3221,10,9,4,3221,1,10,16,3223,2,1,1,3223,1,2,17,3225,2,1,15,3225,7,11,18,3225,1,8,5,3228,8,7,239,3223,3,12,240,
3119,1,182,241,3231,10,9,4,3231,1,10,16,3233,2,1,1,3233,1,2,17,3235,2,1,15,3235,7,11,18,3235,1,8,5,3238,8,7,94,3233,3,12,242,
3119,1,183,243,3241,10,9,4,3241,1,10,16,3243,2,1,1,3243,1,2,17,3245,2,1,15,3245,7,11,18,3245,1,8,5,3248,8,7,244,3243,3,12,245,
3119,1,184,109,3251,10,9,4,3251,1,10,16,3253,2,1,1,3253,1,2,17,3255,2,1,15,3255,7,11,18,3255,1,8,5,3258,8,7,246,3253,3,12,247,
3119,1,185,248,3261,10,9,4,3261,1,10,16,3263,2,1,1,3263,1,2,17,3265,2,1,15,3265,7,11,18,3265,1,8,5,3268,8,7,249,3263,3,12,250,
3119,1,186,114,3271,10,9,4,3271,1,10,16,3273,2,1,1,3273,1,2,17,3275,2,1,15,3275,7,11,18,3275,1,8,5,3278,8,7,251,3273,3,12,252,
3119,1,187,253,3281,10,9,4,3281,1,10,16,3283,2,1,1,3283,1,2,17,3285,2,1,15,3285,7,11,18,3285,1,8,5,3288,8,7,118,3283,3,12,254,
3119,1,188,255,3291,10,9,4,3291,1,10,16,3293,2,1,1,3293,1,2,17,3295,2,1,15,3295,7,11,18,3295,1,8,5,3298,8,7,136,3293,3,12,256,
3119,1,189,257,3301,10,9,4,3301,1,10,16,3303,2,1,1,3303,1,2,17,3305,2,1,15,3305,7,11,18,3305,1,8,5,3308,8,7,183,3303,3,12,258,
3119,1,190,117,3311,10,9,4,3311,1,10,16,3313,2,1,1,3313,1,2,17,3315,2,1,15,3315,7,11,18,3315,1,8,5,3318,8,7,259,3313,3,12,260,
3119,1,191,184,3321,10,9,4,3321,1,10,16,3323,2,1,1,3323,1,2,17,3325,2,1,15,3325,7,11,18,3325,1,8,5,3328,8,7,261,3323,3,12,262,
3119,1,192,263,3331,10,9,4,3331,1,10,16,3333,2,1,1,3333,1,2,17,3335,2,1,15,3335,7,11,18,3335,1,8,5,3338,8,7,101,3333,3,12,264,
3119,1,193,265,3341,10,9,4,3341,1,10,16,3343,2,1,1,3343,1,2,17,3345,2,1,15,3345,7,11,18,3345,1,8,5,3348,8,7,89,3343,3,12,266,
3119,1,194,107,3351,10,9,4,3351,1,10,16,3353,2,1,1,3353,1,2,17,3355,2,1,15,3355,7,11,18,3355,1,8,5,3358,8,7,267,3353,3,12,268,
3119,1,195,269,3361,10,9,4,3361,1,10,16,3363,2,1,1,3363,1,2,17,3365,2,1,15,3365,7,11,18,3365,1,8,5,3368,8,7,84,3363,3,12,270,
3119,1,196,113,3371,10,9,4,3371,1,10,16,3373,2,1,1,3373,1,2,17,3375,2,1,15,3375,7,11,18,3375,1,8,5,3378,8,7,271,3373,3,12,272,
3119,1,197,273,3381,10,9,4,3381,1,10,16,3383,2,1,1,3383,1,2,17,3385,2,1,15,3385,7,11,18,3385,1,8,5,3388,8,7,274,3383,3,12,275,
3119,1,198,276,3391,10,9,4,3391,1,10,16,3393,2,1,1,3393,1,2,17,3395,2,1,15,3395,7,11,18,3395,1,8,5,3398,8,7,96,3393,3,12,277,
3119,1,199,110,3401,10,9,4,3401,1,10,16,3403,2,1,1,3403,1,2,17,3405,2,1,15,3405,7,11,18,3405,1,8,5,3408,8,7,278,3403,3,12,279,
3119,1,200,280,3411,10,9,4,3411,1,10,16,3413,2,1,1,3413,1,2,17,3415,2,1,15,3415,7,11,18,3415,1,8,5,3418,8,7,95,3413,3,12,281,
3119,1,201,161,3421,10,9,4,3421,1,10,16,3423,2,1,1,3423,1,2,17,3425,2,1,15,3425,7,11,18,3425,1,8,5,3428,8,7,282,3423,3,12,283,
3119,1,202,284,3431,10,9,4,3431,1,10,16,3433,2,1,1,3433,1,2,17,3435,2,1,15,3435,7,11,18,3435,1,8,5,3438,8,7,162,3433,3,12,285,
3119,1,203,163,3441,10,9,4,3441,1,10,16,3443,2,1,1,3443,1,2,17,3445,2,1,15,3445,7,11,18,3445,1,8,5,3448,8,7,286,3443,3,12,287,
3119,1,204,288,3451,10,9,4,3451,1,10,16,3453,2,1,1,3453,1,2,17,3455,2,1,15,3455,7,11,18,3455,1,8,5,3458,8,7,289,3453,3,12,290,
3119,1,205,111,3461,10,9,4,3461,1,10,16,3463,2,1,1,3463,1,2,17,3465,2,1,15,3465,7,11,18,3465,1,8,5,3468,8,7,291,3463,3,12,292,
3119,1,206,108,3471,10,9,4,3471,1,10,16,3473,2,1,1,3473,1,2,17,3475,2,1,15,3475,7,11,18,3475,1,8,5,3478,8,7,293,3473,3,12,294,
3119,1,207,295,3481,10,9,4,3481,1,10,16,3483,2,1,1,3483,1,2,17,3485,2,1,15,3485,7,11,18,3485,1,8,5,3488,8,7,296,3483,3,12,297,
3119,1,208,139,3491,10,9,4,3491,1,10,16,3493,2,1,1,3493,1,2,17,3495,2,1,15,3495,7,11,18,3495,1,8,5,3498,8,7,298,3493,3,12,299,
3119,1,209,164,3501,10,9,4,3501,1,10,16,3503,2,1,1,3503,1,2,17,3505,2,1,15,3505,7,11,18,3505,1,8,5,3508,8,7,300,3503,3,12,301,
3119,1,210,302,3511,10,9,4,3511,1,10,16,3513,2,1,1,3513,1,2,17,3515,2,1,15,3515,7,11,18,3515,1,8,5,3518,8,7,116,3513,3,12,303,
3102,1,4,11,3102,1,5,12,3102,1,6,13,2612,1,440,86,3524,1,109,26,3525,2,1,1,3525,4,110,22,3525,1,111,7,3528,1,112,6,3528,3,113,670,
3528,3,114,671,3525,1,7,23,3532,2,115,1,3532,7,116,8,3532,1,8,24,3535,8,20,672,3532,6,117,49,3537,5,118,105,3532,9,119,137,3539,2,120,1,
3539,11,121,25,3541,11,122,106,3541,1,171,219,3543,10,9,4,3543,1,10,16,3545,2,1,1,3545,1,2,17,3547,2,1,15,3547,7,11,18,3547,1,8,5,
3550,8,7,181,3545,3,12,220,3541,1,172,221,3553,10,9,4,3553,1,10,16,3555,2,1,1,3555,1,2,17,3557,2,1,15,3557,7,11,18,3557,1,8,5,
3560,8,7,157,3555,3,12,222,3541,1,173,223,3563,10,9,4,3563,1,10,16,3565,2,1,1,3565,1,2,17,3567,2,1,15,3567,7,11,18,3567,1,8,5,
3570,8,7,158,3565,3,12,224,3541,1,174,225,3573,10,9,4,3573,1,10,16,3575,2,1,1,3575,1,2,17,3577,2,1,15,3577,7,11,18,3577,1,8,5,
3580,8,7,138,3575,3,12,226,3541,1,175,227,3583,10,9,4,3583,1,10,16,3585,2,1,1,3585,1,2,17,3587,2,1,15,3587,7,11,18,3587,1,8,5,
3590,8,7,112,3585,3,12,228,3541,1,176,229,3593,10,9,4,3593,1,10,16,3595,2,1,1,3595,1,2,17,3597,2,1,15,3597,7,11,18,3597,1,8,5,
3600,8,7,100,3595,3,12,230,3541,1,177,159,3603,10,9,4,3603,1,10,16,3605,2,1,1,3605,1,2,17,3607,2,1,15,3607,7,11,18,3607,1,8,5,
3610,8,7,231,3605,3,12,232,3541,1,178,115,3613,10,9,4,3613,1,10,16,3615,2,1,1,3615,1,2,17,3617,2,1,15,3617,7,11,18,3617,1,8,5,
3620,8,7,233,3615,3,12,234,3541,1,179,182,3623,10,9,4,3623,1,10,16,3625,2,1,1,3625,1,2,17,3627,2,1,15,3627,7,11,18,3627,1,8,5,
3630,8,7,177,3625,3,12,235,3541,1,180,160,3633,10,9,4,3633,1,10,16,3635,2,1,1,3635,1,2,17,3637,2,1,15,3637,7,11,18,3637,1,8,5,
3640,8,7,236,3635,3,12,237,3541,1,181,238,3643,10,9,4,3643,1,10,16,3645,2,1,1,3645,1,2,17,3647,2,1,15,3647,7,11,18,3647,1,8,5,
3650,8,7,239,3645,3,12,240,3541,1,182,241,3653,10,9,4,3653,1,10,16,3655,2,1,1,3655,1,2,17,3657,2,1,15,3657,7,11,18,3657,1,8,5,
3660,8,7,94,3655,3,12,242,3541,1,183,243,3663,10,9,4,3663,1,10,16,3665,2,1,1,3665,1,2,17,3667,2,1,15,3667,7,11,18,3667,1,8,5,
3670,8,7,244,3665,3,12,245,3541,1,184,109,3673,10,9,4,3673,1,10,16,3675,2,1,1,3675,1,2,17,3677,2,1,15,3677,7,11,18,3677,1,8,5,
3680,8,7,246,3675,3,12,247,3541,1,185,248,3683,10,9,4,3683,1,10,16,3685,2,1,1,3685,1,2,17,3687,2,1,15,3687,7,11,18,3687,1,8,5,
3690,8,7,249,3685,3,12,250,3541,1,186,114,3693,10,9,4,3693,1,10,16,3695,2,1,1,3695,1,2,17,3697,2,1,15,3697,7,11,18,3697,1,8,5,
3700,8,7,251,3695,3,12,252,3541,1,187,253,3703,10,9,4,3703,1,10,16,3705,2,1,1,3705,1,2,17,3707,2,1,15,3707,7,11,18,3707,1,8,5,
3710,8,7,118,3705,3,12,254,3541,1,188,255,3713,10,9,4,3713,1,10,16,3715,2,1,1,3715,1,2,17,3717,2,1,15,3717,7,11,18,3717,1,8,5,
3720,8,7,136,3715,3,12,256,3541,1,189,257,3723,10,9,4,3723,1,10,16,3725,2,1,1,3725,1,2,17,3727,2,1,15,3727,7,11,18,3727,1,8,5,
3730,8,7,183,3725,3,12,258,3541,1,190,117,3733,10,9,4,3733,1,10,16,3735,2,1,1,3735,1,2,17,3737,2,1,15,3737,7,11,18,3737,1,8,5,
3740,8,7,259,3735,3,12,260,3541,1,191,184,3743,10,9,4,3743,1,10,16,3745,2,1,1,3745,1,2,17,3747,2,1,15,3747,7,11,18,3747,1,8,5,
3750,8,7,261,3745,3,12,262,3541,1,192,263,3753,10,9,4,3753,1,10,16,3755,2,1,1,3755,1,2,17,3757,2,1,15,3757,7,11,18,3757,1,8,5,
3760,8,7,101,3755,3,12,264,3541,1,193,265,3763,10,9,4,3763,1,10,16,3765,2,1,1,3765,1,2,17,3767,2,1,15,3767,7,11,18,3767,1,8,5,
3770,8,7,89,3765,3,12,266,3541,1,194,107,3773,10,9,4,3773,1,10,16,3775,2,1,1,3775,1,2,17,3777,2,1,15,3777,7,11,18,3777,1,8,5,
3780,8,7,267,3775,3,12,268,3541,1,195,269,3783,10,9,4,3783,1,10,16,3785,2,1,1,3785,1,2,17,3787,2,1,15,3787,7,11,18,3787,1,8,5,
3790,8,7,84,3785,3,12,270,3541,1,196,113,3793,10,9,4,3793,1,10,16,3795,2,1,1,3795,1,2,17,3797,2,1,15,3797,7,11,18,3797,1,8,5,
3800,8,7,271,3795,3,12,272,3541,1,197,273,3803,10,9,4,3803,1,10,16,3805,2,1,1,3805,1,2,17,3807,2,1,15,3807,7,11,18,3807,1,8,5,
3810,8,7,274,3805,3,12,275,3541,1,198,276,3813,10,9,4,3813,1,10,16,3815,2,1,1,3815,1,2,17,3817,2,1,15,3817,7,11,18,3817,1,8,5,
3820,8,7,96,3815,3,12,277,3541,1,199,110,3823,10,9,4,3823,1,10,16,3825,2,1,1,3825,1,2,17,3827,2,1,15,3827,7,11,18,3827,1,8,5,
3830,8,7,278,3825,3,12,279,3541,1,200,280,3833,10,9,4,3833,1,10,16,3835,2,1,1,3835,1,2,17,3837,2,1,15,3837,7,11,18,3837,1,8,5,
3840,8,7,95,3835,3,12,281,3541,1,201,161,3843,10,9,4,3843,1,10,16,3845,2,1,1,3845,1,2,17,3847,2,1,15,3847,7,11,18,3847,1,8,5,
3850,8,7,282,3845,3,12,283,3541,1,202,284,3853,10,9,4,3853,1,10,16,3855,2,1,1,3855,1,2,17,3857,2,1,15,3857,7,11,18,3857,1,8,5,
3860,8,7,162,3855,3,12,285,3541,1,203,163,3863,10,9,4,3863,1,10,16,3865,2,1,1,3865,1,2,17,3867,2,1,15,3867,7,11,18,3867,1,8,5,
3870,8,7,286,3865,3,12,287,3541,1,204,288,3873,10,9,4,3873,1,10,16,3875,2,1,1,3875,1,2,17,3877,2,1,15,3877,7,11,18,3877,1,8,5,
3880,8,7,289,3875,3,12,290,3541,1,205,111,3883,10,9,4,3883,1,10,16,3885,2,1,1,3885,1,2,17,3887,2,1,15,3887,7,11,18,3887,1,8,5,
3890,8,7,291,3885,3,12,292,3541,1,206,108,3893,10,9,4,3893,1,10,16,3895,2,1,1,3895,1,2,17,3897,2,1,15,3897,7,11,18,3897,1,8,5,
3900,8,7,293,3895,3,12,294,3541,1,207,295,3903,10,9,4,3903,1,10,16,3905,2,1,1,3905,1,2,17,3907,2,1,15,3907,7,11,18,3907,1,8,5,
3910,8,7,296,3905,3,12,297,3541,1,208,139,3913,10,9,4,3913,1,10,16,3915,2,1,1,3915,1,2,17,3917,2,1,15,3917,7,11,18,3917,1,8,5,
3920,8,7,298,3915,3,12,299,3541,1,209,164,3923,10,9,4,3923,1,10,16,3925,2,1,1,3925,1,2,17,3927,2,1,15,3927,7,11,18,3927,1,8,5,
3930,8,7,300,3925,3,12,301,3541,1,210,302,3933,10,9,4,3933,1,10,16,3935,2,1,1,3935,1,2,17,3937,2,1,15,3937,7,11,18,3937,1,8,5,
3940,8,7,116,3935,3,12,303,3524,1,4,11,3524,1,5,12,3524,1,6,13,2612,1,441,32,3946,2,14,1,3946,4,15,2,3946,1,16,48,3949,4,3,20,
3949,1,17,58,3949,3,18,673,3949,1,19,674,3953,12,13,21,3949,1,37,30,3955,2,38,1,3955,13,39,31,3949,1,93,71,3958,2,74,1,3958,13,94,72,
3946,1,95,73,3961,1,96,74,3962,2,74,15,3962,7,97,75,3962,1,98,5,3965,1,99,6,3965,8,100,91,3965,5,101,76,3946,1,442,3,3969,1,40,29,
3970,2,41,1,3970,4,42,33,3970,1,43,7,3973,1,44,6,3973,3,45,675,3970,1,46,28,3976,1,47,34,3977,2,48,9,3977,6,49,19,3977,1,50,51,
3980,2,51,9,3976,1,52,35,3982,2,53,1,3982,7,54,8,3982,1,55,5,3985,8,56,50,3946,1,443,3,3987,1,40,29,3988,2,41,1,3988,4,42,33,
3988,1,43,7,3991,1,44,6,3991,3,45,676,3988,1,46,28,3994,1,47,34,3995,2,48,9,3995,6,49,19,3995,1,50,51,3998,2,51,9,3994,1,52,35,
4000,2,53,1,4000,7,54,8,4000,1,55,5,4003,8,56,50,3987,1,4,11,3987,1,5,12,3987,1,6,13,3946,1,444,3,4008,1,40,29,4009,2,41,1,
4009,4,42,33,4009,1,43,7,4012,1,44,6,4012,3,45,677,4009,1,46,28,4015,1,47,34,4016,2,48,9,4016,6,49,19,4016,1,50,51,4019,2,51,9,
4015,1,52,35,4021,2,53,1,4021,7,54,8,4021,1,55,5,4024,8,56,50,4008,1,4,11,4008,1,5,12,4008,1,6,13,3946,1,445,3,4029,1,40,29,
4030,2,41,1,4030,4,42,33,4030,1,43,7,4033,1,44,6,4033,3,45,678,4030,1,46,28,4036,1,47,34,4037,2,48,9,4037,6,49,19,4037,1,50,51,
4040,2,51,9,4036,1,52,35,4042,2,53,1,4042,7,54,8,4042,1,55,5,4045,8,56,50,4029,1,4,11,4029,1,5,12,4029,1,6,13,3946,1,446,3,
4050,1,40,29,4051,2,41,1,4051,4,42,33,4051,1,43,7,4054,1,44,6,4054,3,45,679,4051,1,46,28,4057,1,47,34,4058,2,48,9,4058,6,49,19,
4058,1,50,51,4061,2,51,9,4057,1,52,35,4063,2,53,1,4063,7,54,8,4063,1,55,5,4066,8,56,50,4050,1,4,11,4050,1,5,12,4050,1,6,13,
3946,1,447,3,4071,1,40,29,4072,2,41,1,4072,4,42,33,4072,1,43,7,4075,1,44,6,4075,3,45,680,4072,1,46,28,4078,1,47,34,4079,2,48,9,
4079,6,49,19,4079,1,50,51,4082,2,51,9,4078,1,52,35,4084,2,53,1,4084,7,54,8,4084,1,55,5,4087,8,56,50,4071,1,4,11,4071,1,5,12,
4071,1,6,13,3946,1,448,3,4092,1,40,29,4093,2,41,1,4093,4,42,33,4093,1,43,7,4096,1,44,6,4096,3,45,681,4093,1,46,28,4099,1,47,34,
4100,2,48,9,4100,6,49,19,4100,1,50,51,4103,2,51,9,4099,1,52,35,4105,2,53,1,4105,7,54,8,4105,1,55,5,4108,8,56,50,4092,1,4,11,
4092,1,5,12,4092,1,6,13,3946,1,449,3,4113,1,40,29,4114,2,41,1,4114,4,42,33,4114,1,43,7,4117,1,44,6,4117,3,45,682,4114,1,46,28,
4120,1,47,34,4121,2,48,9,4121,6,49,19,4121,1,50,51,4124,2,51,9,4120,1,52,35,4126,2,53,1,4126,7,54,8,4126,1,55,5,4129,8,56,50,
4113,1,4,11,4113,1,5,12,4113,1,6,13,3946,1,450,3,4134,1,40,29,4135,2,41,1,4135,4,42,33,4135,1,43,7,4138,1,44,6,4138,3,45,683,
4135,1,46,28,4141,1,47,34,4142,2,48,9,4142,6,49,19,4142,1,50,51,4145,2,51,9,4141,1,52,35,4147,2,53,1,4147,7,54,8,4147,1,55,5,
4150,8,56,50,4134,1,4,11,4134,1,5,12,4134,1,6,13,3946,1,451,3,4155,1,40,29,4156,2,41,1,4156,4,42,33,4156,1,43,7,4159,1,44,6,
4159,3,45,684,4156,1,46,28,4162,1,47,34,4163,2,48,9,4163,6,49,19,4163,1,50,51,4166,2,51,9,4162,1,52,35,4168,2,53,1,4168,7,54,8,
4168,1,55,5,4171,8,56,50,4155,1,4,11,4155,1,5,12,4155,1,6,13,3946,1,452,3,4176,1,40,29,4177,2,41,1,4177,4,42,33,4177,1,43,7,
4180,1,44,6,4180,3,45,685,4177,1,46,28,4183,1,47,34,4184,2,48,9,4184,6,49,19,4184,1,50,51,4187,2,51,9,4183,1,52,35,4189,2,53,1,
4189,7,54,8,4189,1,55,5,4192,8,56,50,4176,1,4,11,4176,1,5,12,4176,1,6,13,3946,1,453,3,4197,1,40,29,4198,2,41,1,4198,4,42,33,
4198,1,43,7,4201,1,44,6,4201,3,45,686,4198,1,46,28,4204,1,47,34,4205,2,48,9,4205,6,49,19,4205,1,50,51,4208,2,51,9,4204,1,52,35,
4210,2,53,1,4210,7,54,8,4210,1,55,5,4213,8,56,50,4197,1,4,11,4197,1,5,12,4197,1,6,13,3946,1,454,3,4218,1,40,29,4219,2,41,1,
4219,4,42,33,4219,1,43,7,4222,1,44,6,4222,3,45,687,4219,1,46,28,4225,1,47,34,4226,2,48,9,4226,6,49,19,4226,1,50,51,4229,2,51,9,
4225,1,52,35,4231,2,53,1,4231,7,54,8,4231,1,55,5,4234,8,56,50,4218,1,4,11,4218,1,5,12,4218,1,6,13,3946,1,455,3,4239,1,40,29,
4240,2,41,1,4240,4,42,33,4240,1,43,7,4243,1,44,6,4243,3,45,688,4240,1,46,28,4246,1,47,34,4247,2,48,9,4247,6,49,19,4247,1,50,51,
4250,2,51,9,4246,1,52,35,4252,2,53,1,4252,7,54,8,4252,1,55,5,4255,8,56,50,4239,1,4,11,4239,1,5,12,4239,1,6,13,3946,1,456,3,
4260,1,40,29,4261,2,41,1,4261,4,42,33,4261,1,43,7,4264,1,44,6,4264,3,45,689,4261,1,46,28,4267,1,47,34,4268,2,48,9,4268,6,49,19,
4268,1,50,51,4271,2,51,9,4267,1,52,35,4273,2,53,1,4273,7,54,8,4273,1,55,5,4276,8,56,50,4260,1,4,11,4260,1,5,12,4260,1,6,13,
3946,1,457,3,4281,1,40,29,4282,2,41,1,4282,4,42,33,4282,1,43,7,4285,1,44,6,4285,3,45,690,4282,1,46,28,4288,1,47,34,4289,2,48,9,
4289,6,49,19,4289,1,50,51,4292,2,51,9,4288,1,52,35,4294,2,53,1,4294,7,54,8,4294,1,55,5,4297,8,56,50,4281,1,4,11,4281,1,5,12,
4281,1,6,13,3946,1,458,3,4302,1,40,29,4303,2,41,1,4303,4,42,33,4303,1,43,7,4306,1,44,6,4306,3,45,691,4303,1,46,28,4309,1,47,34,
4310,2,48,9,4310,6,49,19,4310,1,50,51,4313,2,51,9,4309,1,52,35,4315,2,53,1,4315,7,54,8,4315,1,55,5,4318,8,56,50,4302,1,4,11,
4302,1,5,12,4302,1,6,13,3946,1,459,3,4323,1,40,29,4324,2,41,1,4324,4,42,33,4324,1,43,7,4327,1,44,6,4327,3,45,692,4324,1,46,28,
4330,1,47,34,4331,2,48,9,4331,6,49,19,4331,1,50,51,4334,2,51,9,4330,1,52,35,4336,2,53,1,4336,7,54,8,4336,1,55,5,4339,8,56,50,
4323,1,4,11,4323,1,5,12,4323,1,6,13,3946,1,460,3,4344,1,40,29,4345,2,41,1,4345,4,42,33,4345,1,43,7,4348,1,44,6,4348,3,45,693,
4345,1,46,28,4351,1,47,34,4352,2,48,9,4352,6,49,19,4352,1,50,51,4355,2,51,9,4351,1,52,35,4357,2,53,1,4357,7,54,8,4357,1,55,5,
4360,8,56,50,4344,1,4,11,4344,1,5,12,4344,1,6,13,3946,1,461,3,4365,1,40,29,4366,2,41,1,4366,4,42,33,4366,1,43,7,4369,1,44,6,
4369,3,45,694,4366,1,46,28,4372,1,47,34,4373,2,48,9,4373,6,49,19,4373,1,50,51,4376,2,51,9,4372,1,52,35,4378,2,53,1,4378,7,54,8,
4378,1,55,5,4381,8,56,50,4365,1,4,11,4365,1,5,12,4365,1,6,13,3946,1,462,3,4386,1,40,29,4387,2,41,1,4387,4,42,33,4387,1,43,7,
4390,1,44,6,4390,3,45,695,4387,1,46,28,4393,1,47,34,4394,2,48,9,4394,6,49,19,4394,1,50,51,4397,2,51,9,4393,1,52,35,4399,2,53,1,
4399,7,54,8,4399,1,55,5,4402,8,56,50,4386,1,4,11,4386,1,5,12,4386,1,6,13,3946,1,463,3,4407,1,40,29,4408,2,41,1,4408,4,42,33,
4408,1,43,7,4411,1,44,6,4411,3,45,696,4408,1,46,28,4414,1,47,34,4415,2,48,9,4415,6,49,19,4415,1,50,51,4418,2,51,9,4414,1,52,35,
4420,2,53,1,4420,7,54,8,4420,1,55,5,4423,8,56,50,4407,1,4,11,4407,1,5,12,4407,1,6,13,3946,1,464,3,4428,1,40,29,4429,2,41,1,
4429,4,42,33,4429,1,43,7,4432,1,44,6,4432,3,45,697,4429,1,46,28,4435,1,47,34,4436,2,48,9,4436,6,49,19,4436,1,50,51,4439,2,51,9,
4435,1,52,35,4441,2,53,1,4441,7,54,8,4441,1,55,5,4444,8,56,50,4428,1,4,11,4428,1,5,12,4428,1,6,13,3946,1,465,3,4449,1,40,29,
4450,2,41,1,4450,4,42,33,4450,1,43,7,4453,1,44,6,4453,3,45,698,4450,1,46,28,4456,1,47,34,4457,2,48,9,4457,6,49,19,4457,1,50,51,
4460,2,51,9,4456,1,52,35,4462,2,53,1,4462,7,54,8,4462,1,55,5,4465,8,56,50,4449,1,4,11,4449,1,5,12,4449,1,6,13,3946,1,466,3,
4470,1,40,29,4471,2,41,1,4471,4,42,33,4471,1,43,7,4474,1,44,6,4474,3,45,699,4471,1,46,28,4477,1,47,34,4478,2,48,9,4478,6,49,19,
4478,1,50,51,4481,2,51,9,4477,1,52,35,4483,2,53,1,4483,7,54,8,4483,1,55,5,4486,8,56,50,4470,1,4,11,4470,1,5,12,4470,1,6,13,
3946,1,467,3,4491,1,40,29,4492,2,41,1,4492,4,42,33,4492,1,43,7,4495,1,44,6,4495,3,45,700,4492,1,46,28,4498,1,47,34,4499,2,48,9,
4499,6,49,19,4499,1,50,51,4502,2,51,9,4498,1,52,35,4504,2,53,1,4504,7,54,8,4504,1,55,5,4507,8,56,50,4491,1,4,11,4491,1,5,12,
4491,1,6,13,3946,1,468,3,4512,1,40,29,4513,2,41,1,4513,4,42,33,4513,1,43,7,4516,1,44,6,4516,3,45,701,4513,1,46,28,4519,1,47,34,
4520,2,48,9,4520,6,49,19,4520,1,50,51,4523,2,51,9,4519,1,52,35,4525,2,53,1,4525,7,54,8,4525,1,55,5,4528,8,56,50,4512,1,4,11,
4512,1,5,12,4512,1,6,13,3946,1,469,3,4533,1,40,29,4534,2,41,1,4534,4,42,33,4534,1,43,7,4537,1,44,6,4537,3,45,702,4534,1,46,28,
4540,1,47,34,4541,2,48,9,4541,6,49,19,4541,1,50,51,4544,2,51,9,4540,1,52,35,4546,2,53,1,4546,7,54,8,4546,1,55,5,4549,8,56,50,
4533,1,4,11,4533,1,5,12,4533,1,6,13,3946,1,470,3,4554,1,40,29,4555,2,41,1,4555,4,42,33,4555,1,43,7,4558,1,44,6,4558,3,45,703,
4555,1,46,28,4561,1,47,34,4562,2,48,9,4562,6,49,19,4562,1,50,51,4565,2,51,9,4561,1,52,35,4567,2,53,1,4567,7,54,8,4567,1,55,5,
4570,8,56,50,4554,1,4,11,4554,1,5,12,4554,1,6,13,3946,1,471,3,4575,1,40,29,4576,2,41,1,4576,4,42,33,4576,1,43,7,4579,1,44,6,
4579,3,45,704,4576,1,46,28,4582,1,47,34,4583,2,48,9,4583,6,49,19,4583,1,50,51,4586,2,51,9,4582,1,52,35,4588,2,53,1,4588,7,54,8,
4588,1,55,5,4591,8,56,50,4575,1,4,11,4575,1,5,12,4575,1,6,13,3946,1,472,3,4596,1,40,29,4597,2,41,1,4597,4,42,33,4597,1,43,7,
4600,1,44,6,4600,3,45,705,4597,1,46,28,4603,1,47,34,4604,2,48,9,4604,6,49,19,4604,1,50,51,4607,2,51,9,4603,1,52,35,4609,2,53,1,
4609,7,54,8,4609,1,55,5,4612,8,56,50,4596,1,4,11,4596,1,5,12,4596,1,6,13,3946,1,473,3,4617,1,40,29,4618,2,41,1,4618,4,42,33,
4618,1,43,7,4621,1,44,6,4621,3,45,706,4618,1,46,28,4624,1,47,34,4625,2,48,9,4625,6,49,19,4625,1,50,51,4628,2,51,9,4624,1,52,35,
4630,2,53,1,4630,7,54,8,4630,1,55,5,4633,8,56,50,4617,1,4,11,4617,1,5,12,4617,1,6,13,3946,1,474,3,4638,1,40,29,4639,2,41,1,
4639,4,42,33,4639,1,43,7,4642,1,44,6,4642,3,45,707,4639,1,46,28,4645,1,47,34,4646,2,48,9,4646,6,49,19,4646,1,50,51,4649,2,51,9,
4645,1,52,35,4651,2,53,1,4651,7,54,8,4651,1,55,5,4654,8,56,50,4638,1,4,11,4638,1,5,12,4638,1,6,13,3946,1,475,3,4659,1,40,29,
4660,2,41,1,4660,4,42,33,4660,1,43,7,4663,1,44,6,4663,3,45,708,4660,1,46,28,4666,1,47,34,4667,2,48,9,4667,6,49,19,4667,1,50,51,
4670,2,51,9,4666,1,52,35,4672,2,53,1,4672,7,54,8,4672,1,55,5,4675,8,56,50,4659,1,4,11,4659,1,5,12,4659,1,6,13,3946,1,476,3,
4680,1,40,29,4681,2,41,1,4681,4,42,33,4681,1,43,7,4684,1,44,6,4684,3,45,709,4681,1,46,28,4687,1,47,34,4688,2,48,9,4688,6,49,19,
4688,1,50,51,4691,2,51,9,4687,1,52,35,4693,2,53,1,4693,7,54,8,4693,1,55,5,4696,8,56,50,4680,1,4,11,4680,1,5,12,4680,1,6,13,
3946,1,477,3,4701,1,40,29,4702,2,41,1,4702,4,42,33,4702,1,43,7,4705,1,44,6,4705,3,45,710,4702,1,46,28,4708,1,47,34,4709,2,48,9,
4709,6,49,19,4709,1,50,51,4712,2,51,9,4708,1,52,35,4714,2,53,1,4714,7,54,8,4714,1,55,5,4717,8,56,50,4701,1,4,11,4701,1,5,12,
4701,1,6,13,3946,1,478,3,4722,1,40,29,4723,2,41,1,4723,4,42,33,4723,1,43,7,4726,1,44,6,4726,3,45,711,4723,1,46,28,4729,1,47,34,
4730,2,48,9,4730,6,49,19,4730,1,50,51,4733,2,51,9,4729,1,52,35,4735,2,53,1,4735,7,54,8,4735,1,55,5,4738,8,56,50,4722,1,4,11,
4722,1,5,12,4722,1,6,13,3946,1,479,3,4743,1,40,29,4744,2,41,1,4744,4,42,33,4744,1,43,7,4747,1,44,6,4747,3,45,712,4744,1,46,28,
4750,1,47,34,4751,2,48,9,4751,6,49,19,4751,1,50,51,4754,2,51,9,4750,1,52,35,4756,2,53,1,4756,7,54,8,4756,1,55,5,4759,8,56,50,
4743,1,4,11,4743,1,5,12,4743,1,6,13,3946,1,480,3,4764,1,40,29,4765,2,41,1,4765,4,42,33,4765,1,43,7,4768,1,44,6,4768,3,45,713,
4765,1,46,28,4771,1,47,34,4772,2,48,9,4772,6,49,19,4772,1,50,51,4775,2,51,9,4771,1,52,35,4777,2,53,1,4777,7,54,8,4777,1,55,5,
4780,8,56,50,4764,1,4,11,4764,1,5,12,4764,1,6,13,3946,1,481,3,4785,1,40,29,4786,2,41,1,4786,4,42,33,4786,1,43,7,4789,1,44,6,
4789,3,45,714,4786,1,46,28,4792,1,47,34,4793,2,48,9,4793,6,49,19,4793,1,50,51,4796,2,51,9,4792,1,52,35,4798,2,53,1,4798,7,54,8,
4798,1,55,5,4801,8,56,50,4785,1,4,11,4785,1,5,12,4785,1,6,13,2327,1,482,32,4806,2,14,1,4806,4,15,2,4806,1,16,48,4809,4,3,20,
4809,1,17,41,4809,3,18,715,4809,1,19,716,4813,12,13,21,4809,1,37,30,4815,2,38,1,4815,13,39,31,4806,1,483,3,4818,4,57,2,4818,1,58,36,
4820,1,59,37,4821,2,60,1,4820,1,61,39,4823,2,1,1,4823,9,62,40,4825,2,1,1,4825,5,63,38,4823,6,64,10,4820,3,66,717,4820,3,65,718,
4806,1,484,3,4831,1,109,26,4832,2,1,1,4832,4,110,22,4832,1,111,7,4835,1,112,6,4835,3,113,719,4835,3,114,347,4832,1,7,23,4839,2,115,1,
4839,7,116,8,4839,1,8,24,4842,8,20,720,4839,6,117,49,4844,5,118,105,4839,9,119,137,4846,2,120,1,4846,11,121,25,4848,11,122,106,4848,1,485,108,
4850,10,9,4,4850,1,10,16,4852,2,1,1,4852,1,2,17,4854,2,1,15,4854,7,11,18,4854,1,8,5,4857,8,7,118,4852,3,12,721,4848,1,486,111,
4860,10,9,4,4860,1,10,16,4862,2,1,1,4862,1,2,17,4864,2,1,15,4864,7,11,18,4864,1,8,5,4867,8,7,162,4862,3,12,722,4848,1,487,164,
4870,10,9,4,4870,1,10,16,4872,2,1,1,4872,1,2,17,4874,2,1,15,4874,7,11,18,4874,1,8,5,4877,8,7,101,4872,3,12,723,4848,1,488,161,
4880,10,9,4,4880,1,10,16,4882,2,1,1,4882,1,2,17,4884,2,1,15,4884,7,11,18,4884,1,8,5,4887,8,7,96,4882,3,12,724,4848,1,489,114,
4890,10,9,4,4890,1,10,16,4892,2,1,1,4892,1,2,17,4894,2,1,15,4894,7,11,18,4894,1,8,5,4897,8,7,100,4892,3,12,725,4848,1,490,160,
4900,10,9,4,4900,1,10,16,4902,2,1,1,4902,1,2,17,4904,2,1,15,4904,7,11,18,4904,1,8,5,4907,8,7,89,4902,3,12,726,4848,1,491,115,
4910,10,9,4,4910,1,10,16,4912,2,1,1,4912,1,2,17,4914,2,1,15,4914,7,11,18,4914,1,8,5,4917,8,7,157,4912,3,12,727,4848,1,492,109,
4920,10,9,4,4920,1,10,16,4922,2,1,1,4922,1,2,17,4924,2,1,15,4924,7,11,18,4924,1,8,5,4927,8,7,112,4922,3,12,728,4848,1,493,117,
4930,10,9,4,4930,1,10,16,4932,2,1,1,4932,1,2,17,4934,2,1,15,4934,7,11,18,4934,1,8,5,4937,8,7,158,4932,3,12,729,4848,1,494,163,
4940,10,9,4,4940,1,10,16,4942,2,1,1,4942,1,2,17,4944,2,1,15,4944,7,11,18,4944,1,8,5,4947,8,7,84,4942,3,12,730,4848,1,495,159,
4950,10,9,4,4950,1,10,16,4952,2,1,1,4952,1,2,17,4954,2,1,15,4954,7,11,18,4954,1,8,5,4957,8,7,94,4952,3,12,731,4848,1,496,113,
4960,10,9,4,4960,1,10,16,4962,2,1,1,4962,1,2,17,4964,2,1,15,4964,7,11,18,4964,1,8,5,4967,8,7,138,4962,3,12,732,4848,1,497,139,
4970,10,9,4,4970,1,10,16,4972,2,1,1,4972,1,2,17,4974,2,1,15,4974,7,11,18,4974,1,8,5,4977,8,7,95,4972,3,12,733,4848,1,498,110,
4980,10,9,4,4980,1,10,16,4982,2,1,1,4982,1,2,17,4984,2,1,15,4984,7,11,18,4984,1,8,5,4987,8,7,116,4982,3,12,734,4848,1,499,107,
4990,10,9,4,4990,1,10,16,4992,2,1,1,4992,1,2,17,4994,2,1,15,4994,7,11,18,4994,1,8,5,4997,8,7,136,4992,3,12,735,4831,1,4,11,
4831,1,5,12,4831,1,6,13,4806,1,500,32,5003,2,14,1,5003,4,15,2,5003,1,16,48,5006,4,3,20,5006,1,17,58,5006,3,18,736,5006,1,19,737,
5010,12,13,21,5006,1,37,30,5012,2,38,1,5012,13,39,31,5006,1,93,71,5015,2,74,1,5015,13,94,72,5003,1,95,73,5018,1,96,74,5019,2,74,15,
5019,7,97,75,5019,1,98,5,5022,1,99,6,5022,8,100,91,5022,5,101,76,5003,1,501,3,5026,1,40,29,5027,2,41,1,5027,4,42,33,5027,1,43,7,
5030,1,44,6,5030,3,45,738,5027,1,46,28,5033,1,47,34,5034,2,48,9,5034,6,49,19,5034,1,50,51,5037,2,51,9,5033,1,52,35,5039,2,53,1,
5039,7,54,8,5039,1,55,5,5042,8,56,50,5003,1,502,3,5044,1,40,29,5045,2,41,1,5045,4,42,33,5045,1,43,7,5048,1,44,6,5048,3,45,739,
5045,1,46,28,5051,1,47,34,5052,2,48,9,5052,6,49,19,5052,1,50,51,5055,2,51,9,5051,1,52,35,5057,2,53,1,5057,7,54,8,5057,1,55,5,
5060,8,56,50,5044,1,4,11,5044,1,5,12,5044,1,6,13,5003,1,503,3,5065,1,40,29,5066,2,41,1,5066,4,42,33,5066,1,43,7,5069,1,44,6,
5069,3,45,740,5066,1,46,28,5072,1,47,34,5073,2,48,9,5073,6,49,19,5073,1,50,51,5076,2,51,9,5072,1,52,35,5078,2,53,1,5078,7,54,8,
5078,1,55,5,5081,8,56,50,5065,1,4,11,5065,1,5,12,5065,1,6,13,5003,1,504,3,5086,1,40,29,5087,2,41,1,5087,4,42,33,5087,1,43,7,
5090,1,44,6,5090,3,45,741,5087,1,46,28,5093,1,47,34,5094,2,48,9,5094,6,49,19,5094,1,50,51,5097,2,51,9,5093,1,52,35,5099,2,53,1,
5099,7,54,8,5099,1,55,5,5102,8,56,50,5086,1,4,11,5086,1,5,12,5086,1,6,13,5003,1,505,3,5107,1,40,29,5108,2,41,1,5108,4,42,33,
5108,1,43,7,5111,1,44,6,5111,3,45,742,5108,1,46,28,5114,1,47,34,5115,2,48,9,5115,6,49,19,5115,1,50,51,5118,2,51,9,5114,1,52,35,
5120,2,53,1,5120,7,54,8,5120,1,55,5,5123,8,56,50,5107,1,4,11,5107,1,5,12,5107,1,6,13,5003,1,506,3,5128,1,40,29,5129,2,41,1,
5129,4,42,33,5129,1,43,7,5132,1,44,6,5132,3,45,743,5129,1,46,28,5135,1,47,34,5136,2,48,9,5136,6,49,19,5136,1,50,51,5139,2,51,9,
5135,1,52,35,5141,2,53,1,5141,7,54,8,5141,1,55,5,5144,8,56,50,5128,1,4,11,5128,1,5,12,5128,1,6,13,5003,1,507,3,5149,1,40,29,
5150,2,41,1,5150,4,42,33,5150,1,43,7,5153,1,44,6,5153,3,45,744,5150,1,46,28,5156,1,47,34,5157,2,48,9,5157,6,49,19,5157,1,50,51,
5160,2,51,9,5156,1,52,35,5162,2,53,1,5162,7,54,8,5162,1,55,5,5165,8,56,50,5149,1,4,11,5149,1,5,12,5149,1,6,13,5003,1,508,3,
5170,1,40,29,5171,2,41,1,5171,4,42,33,5171,1,43,7,5174,1,44,6,5174,3,45,745,5171,1,46,28,5177,1,47,34,5178,2,48,9,5178,6,49,19,
5178,1,50,51,5181,2,51,9,5177,1,52,35,5183,2,53,1,5183,7,54,8,5183,1,55,5,5186,8,56,50,5170,1,4,11,5170,1,5,12,5170,1,6,13,
5003,1,509,3,5191,1,40,29,5192,2,41,1,5192,4,42,33,5192,1,43,7,5195,1,44,6,5195,3,45,746,5192,1,46,28,5198,1,47,34,5199,2,48,9,
5199,6,49,19,5199,1,50,51,5202,2,51,9,5198,1,52,35,5204,2,53,1,5204,7,54,8,5204,1,55,5,5207,8,56,50,5191,1,4,11,5191,1,5,12,
5191,1,6,13,5003,1,510,3,5212,1,40,29,5213,2,41,1,5213,4,42,33,5213,1,43,7,5216,1,44,6,5216,3,45,747,5213,1,46,28,5219,1,47,34,
5220,2,48,9,5220,6,49,19,5220,1,50,51,5223,2,51,9,5219,1,52,35,5225,2,53,1,5225,7,54,8,5225,1,55,5,5228,8,56,50,5212,1,4,11,
5212,1,5,12,5212,1,6,13,5003,1,511,3,5233,1,40,29,5234,2,41,1,5234,4,42,33,5234,1,43,7,5237,1,44,6,5237,3,45,748,5234,1,46,28,
5240,1,47,34,5241,2,48,9,5241,6,49,19,5241,1,50,51,5244,2,51,9,5240,1,52,35,5246,2,53,1,5246,7,54,8,5246,1,55,5,5249,8,56,50,
5233,1,4,11,5233,1,5,12,5233,1,6,13,5003,1,512,3,5254,1,40,29,5255,2,41,1,5255,4,42,33,5255,1,43,7,5258,1,44,6,5258,3,45,749,
5255,1,46,28,5261,1,47,34,5262,2,48,9,5262,6,49,19,5262,1,50,51,5265,2,51,9,5261,1,52,35,5267,2,53,1,5267,7,54,8,5267,1,55,5,
5270,8,56,50,5254,1,4,11,5254,1,5,12,5254,1,6,13,5003,1,513,3,5275,1,40,29,5276,2,41,1,5276,4,42,33,5276,1,43,7,5279,1,44,6,
5279,3,45,750,5276,1,46,28,5282,1,47,34,5283,2,48,9,5283,6,49,19,5283,1,50,51,5286,2,51,9,5282,1,52,35,5288,2,53,1,5288,7,54,8,
5288,1,55,5,5291,8,56,50,5275,1,4,11,5275,1,5,12,5275,1,6,13,5003,1,514,3,5296,1,40,29,5297,2,41,1,5297,4,42,33,5297,1,43,7,
5300,1,44,6,5300,3,45,751,5297,1,46,28,5303,1,47,34,5304,2,48,9,5304,6,49,19,5304,1,50,51,5307,2,51,9,5303,1,52,35,5309,2,53,1,
5309,7,54,8,5309,1,55,5,5312,8,56,50,5296,1,4,11,5296,1,5,12,5296,1,6,13,5003,1,515,3,5317,1,40,29,5318,2,41,1,5318,4,42,33,
5318,1,43,7,5321,1,44,6,5321,3,45,752,5318,1,46,28,5324,1,47,34,5325,2,48,9,5325,6,49,19,5325,1,50,51,5328,2,51,9,5324,1,52,35,
5330,2,53,1,5330,7,54,8,5330,1,55,5,5333,8,56,50,5317,1,4,11,5317,1,5,12,5317,1,6,13,2327,1,516,32,5338,2,14,1,5338,4,15,2,
5338,1,16,48,5341,4,3,20,5341,1,17,41,5341,3,18,753,5341,1,19,348,5345,12,13,21,5341,1,37,30,5347,2,38,1,5347,13,39,31,5338,1,517,3,
5350,4,57,2,5350,1,58,36,5352,1,59,37,5353,2,60,1,5352,1,61,39,5355,2,1,1,5355,9,62,40,5357,2,1,1,5357,5,63,38,5355,6,64,10,
5352,3,66,754,5352,3,65,755,5338,1,518,3,5363,1,109,26,5364,2,1,1,5364,4,110,22,5364,1,111,7,5367,1,112,6,5367,3,113,756,5367,3,114,757,
5364,1,7,23,5371,2,115,1,5371,7,116,8,5371,1,8,24,5374,8,20,758,5371,6,117,49,5376,5,118,105,5371,9,119,137,5378,2,120,1,5378,11,121,25,
5380,11,122,106,5380,1,519,114,5382,10,9,4,5382,1,10,16,5384,2,1,1,5384,1,2,17,5386,2,1,15,5386,7,11,18,5386,1,8,5,5389,8,7,89,
5384,3,12,759,5380,1,520,110,5392,10,9,4,5392,1,10,16,5394,2,1,1,5394,1,2,17,5396,2,1,15,5396,7,11,18,5396,1,8,5,5399,8,7,94,
5394,3,12,760,5380,1,521,107,5402,10,9,4,5402,1,10,16,5404,2,1,1,5404,1,2,17,5406,2,1,15,5406,7,11,18,5406,1,8,5,5409,8,7,95,
5404,3,12,761,5380,1,522,113,5412,10,9,4,5412,1,10,16,5414,2,1,1,5414,1,2,17,5416,2,1,15,5416,7,11,18,5416,1,8,5,5419,8,7,116,
5414,3,12,762,5380,1,523,111,5422,10,9,4,5422,1,10,16,5424,2,1,1,5424,1,2,17,5426,2,1,15,5426,7,11,18,5426,1,8,5,5429,8,7,118,
5424,3,12,763,5380,1,524,117,5432,10,9,4,5432,1,10,16,5434,2,1,1,5434,1,2,17,5436,2,1,15,5436,7,11,18,5436,1,8,5,5439,8,7,100,
5434,3,12,764,5380,1,525,109,5442,10,9,4,5442,1,10,16,5444,2,1,1,5444,1,2,17,5446,2,1,15,5446,7,11,18,5446,1,8,5,5449,8,7,96,
5444,3,12,765,5380,1,526,108,5452,10,9,4,5452,1,10,16,5454,2,1,1,5454,1,2,17,5456,2,1,15,5456,7,11,18,5456,1,8,5,5459,8,7,101,
5454,3,12,766,5380,1,527,139,5462,10,9,4,5462,1,10,16,5464,2,1,1,5464,1,2,17,5466,2,1,15,5466,7,11,18,5466,1,8,5,5469,8,7,84,
5464,3,12,767,5380,1,528,115,5472,10,9,4,5472,1,10,16,5474,2,1,1,5474,1,2,17,5476,2,1,15,5476,7,11,18,5476,1,8,5,5479,8,7,112,
5474,3,12,768,5363,1,4,11,5363,1,5,12,5363,1,6,13,2327,1,529,32,5485,2,14,1,5485,4,15,2,5485,1,16,48,5488,4,3,20,5488,1,17,41,
5488,3,18,769,5488,1,19,218,5492,12,13,21,5488,1,37,30,5494,2,38,1,5494,13,39,31,5485,1,530,3,5497,4,57,2,5497,1,58,36,5499,1,59,37,
5500,2,60,1,5499,1,61,39,5502,2,1,1,5502,9,62,40,5504,2,1,1,5504,5,63,38,5502,6,64,10,5499,3,66,770,5499,3,65,771,5485,1,265,3,
5510,1,21,26,5511,2,1,1,5511,4,22,22,5511,1,23,7,5514,1,24,6,5514,3,25,349,5514,3,69,772,5511,1,26,23,5518,2,27,1,5518,7,28,8,
5518,1,29,24,5521,8,20,773,5518,6,30,49,5523,5,31,27,5518,9,32,54,5525,2,33,1,5525,11,34,25,5527,4,35,2,5525,14,36,774,5485,1,531,3,
5530,1,40,29,5531,2,41,1,5531,4,42,33,5531,1,43,7,5534,1,44,6,5534,3,45,775,5534,3,77,776,5531,1,46,28,5538,1,47,34,5539,2,48,9,
5539,6,49,19,5539,1,50,51,5542,2,51,9,5538,1,52,35,5544,2,53,1,5544,7,54,8,5544,1,55,5,5547,8,56,84,2327,1,532,32,5549,2,14,1,
5549,4,15,2,5549,1,16,48,5552,4,3,20,5552,1,17,41,5552,3,18,777,5552,1,19,350,5556,12,13,21,5552,1,37,30,5558,2,38,1,5558,13,39,31,
5549,1,533,3,5561,4,57,2,5561,1,58,36,5563,1,59,37,5564,2,60,1,5563,1,61,39,5566,2,1,1,5566,9,62,40,5568,2,1,1,5568,5,63,38,
5566,6,64,10,5563,3,66,778,5563,3,65,779,5549,1,534,32,5574,2,14,1,5574,4,15,2,5574,1,16,48,5577,4,3,20,5577,1,17,41,5577,3,18,780,
5577,1,19,133,5581,12,13,21,5577,1,37,30,5583,2,38,1,5583,13,39,31,5574,1,535,3,5586,4,57,2,5586,1,58,36,5588,1,59,37,5589,2,60,1,
5588,1,61,39,5591,2,1,1,5591,9,62,40,5593,2,1,1,5593,5,63,38,5591,6,64,10,5588,3,66,781,5588,3,65,782,5574,1,536,3,5599,4,57,2,
5599,1,58,36,5601,1,59,37,5602,2,60,1,5602,1,4,77,5602,1,5,78,5602,1,6,79,5601,1,61,39,5607,2,1,1,5607,9,62,40,5609,2,1,1,
5609,5,63,38,5607,6,64,10,5601,3,66,783,5601,3,65,784,5574,1,537,32,5615,2,14,1,5615,4,15,2,5615,1,16,48,5618,4,3,20,5618,1,17,41,
5618,3,18,785,5618,1,19,786,5622,12,13,21,5618,1,37,30,5624,2,38,1,5624,13,39,31,5615,1,266,3,5627,1,21,26,5628,2,1,1,5628,4,22,22,
5628,1,23,7,5631,1,24,6,5631,3,25,351,5631,3,69,787,5628,1,26,23,5635,2,27,1,5635,7,28,8,5635,1,29,24,5638,3,20,788,5635,6,30,53,
5640,5,31,27,5635,9,32,165,5642,2,33,1,5642,11,34,25,5644,4,35,2,5642,14,36,789,5615,1,538,55,5647,1,70,52,5648,2,71,1,5647,3,72,790,
5615,1,539,3,5651,1,82,29,5652,2,1,1,5652,4,83,66,5652,1,84,7,5655,1,85,6,5655,3,86,791,5655,3,102,792,5652,1,87,67,5659,2,88,1,
5659,1,89,5,5661,6,90,121,5661,1,91,68,5663,5,78,69,5651,1,4,11,5651,1,5,12,5651,1,6,13,5615,1,540,3,5668,1,82,29,5669,2,1,1,
5669,4,83,66,5669,1,84,7,5672,1,85,6,5672,3,86,793,5672,3,102,794,5669,1,87,67,5676,2,88,1,5676,1,89,5,5678,6,90,121,5678,1,91,68,
5680,5,78,69,5668,1,4,11,5668,1,5,12,5668,1,6,13,5615,1,541,3,5685,1,82,29,5686,2,1,1,5686,4,83,66,5686,1,84,7,5689,1,85,6,
5689,3,86,795,5689,3,102,796,5686,1,87,67,5693,2,88,1,5693,1,89,5,5695,6,90,121,5695,1,91,68,5697,5,78,69,5685,1,4,11,5685,1,5,12,
5685,1,6,13,5615,1,542,3,5702,1,21,26,5703,2,1,1,5703,4,22,22,5703,1,23,7,5706,1,24,6,5706,3,25,797,5706,3,69,798,5703,1,26,23,
5710,2,27,1,5710,7,28,8,5710,1,29,24,5713,8,20,799,5710,6,30,49,5715,5,31,27,5710,9,32,54,5717,2,33,1,5717,11,34,25,5719,4,35,2,
5717,14,36,4,5702,1,4,11,5702,1,5,12,5702,1,6,13,5615,1,543,3,5725,1,21,26,5726,2,1,1,5726,4,22,22,5726,1,23,7,5729,1,24,6,
5729,3,25,800,5729,3,69,801,5726,1,26,23,5733,2,27,1,5733,7,28,8,5733,1,29,24,5736,8,20,802,5733,6,30,49,5738,5,31,27,5733,9,32,54,
5740,2,33,1,5740,11,34,25,5742,4,35,2,5740,14,36,4,5725,1,4,11,5725,1,5,12,5725,1,6,13,5615,1,544,3,5748,1,21,26,5749,2,1,1,
5749,4,22,22,5749,1,23,7,5752,1,24,6,5752,3,25,803,5752,3,69,804,5749,1,26,23,5756,2,27,1,5756,7,28,8,5756,1,29,24,5759,8,20,805,
5756,6,30,49,5761,5,31,27,5756,9,32,54,5763,2,33,1,5763,11,34,25,5765,4,35,2,5763,14,36,4,5748,1,4,11,5748,1,5,12,5748,1,6,13,
5574,1,545,32,5771,2,14,1,5771,4,15,2,5771,1,16,48,5774,4,3,20,5774,1,17,41,5774,3,18,806,5774,1,19,807,5778,12,13,21,5774,1,37,30,
5780,2,38,1,5780,13,39,31,5771,1,266,3,5783,1,21,26,5784,2,1,1,5784,4,22,22,5784,1,23,7,5787,1,24,6,5787,3,25,351,5787,3,69,808,
5784,1,26,23,5791,2,27,1,5791,7,28,8,5791,1,29,24,5794,3,20,809,5791,6,30,53,5796,5,31,27,5791,9,32,165,5798,2,33,1,5798,11,34,25,
5800,4,35,2,5798,14,36,810,5771,1,546,55,5803,1,70,52,5804,2,71,1,5803,3,72,811,5771,1,547,3,5807,1,82,29,5808,2,1,1,5808,4,83,66,
5808,1,84,7,5811,1,85,6,5811,3,86,812,5811,3,102,813,5808,1,87,67,5815,2,88,1,5815,1,89,5,5817,6,90,121,5817,1,91,68,5819,5,78,69,
5807,1,4,11,5807,1,5,12,5807,1,6,13,5771,1,548,3,5824,1,82,29,5825,2,1,1,5825,4,83,66,5825,1,84,7,5828,1,85,6,5828,3,86,814,
5828,3,102,815,5825,1,87,67,5832,2,88,1,5832,1,89,5,5834,6,90,121,5834,1,91,68,5836,5,78,69,5824,1,4,11,5824,1,5,12,5824,1,6,13,
5771,1,549,3,5841,1,82,29,5842,2,1,1,5842,4,83,66,5842,1,84,7,5845,1,85,6,5845,3,86,816,5845,3,102,817,5842,1,87,67,5849,2,88,1,
5849,1,89,5,5851,6,90,121,5851,1,91,68,5853,5,78,69,5841,1,4,11,5841,1,5,12,5841,1,6,13,5771,1,550,3,5858,1,21,26,5859,2,1,1,
5859,4,22,22,5859,1,23,7,5862,1,24,6,5862,3,25,818,5862,3,69,819,5859,1,26,23,5866,2,27,1,5866,7,28,8,5866,1,29,24,5869,8,20,820,
5866,6,30,49,5871,5,31,27,5866,9,32,54,5873,2,33,1,5873,11,34,25,5875,4,35,2,5873,14,36,4,5858,1,4,11,5858,1,5,12,5858,1,6,13,
5771,1,551,3,5881,1,21,26,5882,2,1,1,5882,4,22,22,5882,1,23,7,5885,1,24,6,5885,3,25,821,5885,3,69,822,5882,1,26,23,5889,2,27,1,
5889,7,28,8,5889,1,29,24,5892,8,20,823,5889,6,30,49,5894,5,31,27,5889,9,32,54,5896,2,33,1,5896,11,34,25,5898,4,35,2,5896,14,36,4,
5881,1,4,11,5881,1,5,12,5881,1,6,13,5771,1,552,3,5904,1,21,26,5905,2,1,1,5905,4,22,22,5905,1,23,7,5908,1,24,6,5908,3,25,824,
5908,3,69,825,5905,1,26,23,5912,2,27,1,5912,7,28,8,5912,1,29,24,5915,8,20,826,5912,6,30,49,5917,5,31,27,5912,9,32,54,5919,2,33,1,
5919,11,34,25,5921,4,35,2,5919,14,36,4,5904,1,4,11,5904,1,5,12,5904,1,6,13,5549,1,553,32,5927,2,14,1,5927,4,15,2,5927,1,16,48,
5930,4,3,20,5930,1,17,41,5930,3,18,827,5930,1,19,102,5934,12,13,21,5930,1,37,30,5936,2,38,1,5936,13,39,31,5927,1,554,3,5939,4,57,2,
5939,1,58,36,5941,1,59,37,5942,2,60,1,5941,1,61,39,5944,2,1,1,5944,9,62,40,5946,2,1,1,5946,5,63,38,5944,6,64,10,5941,3,66,828,
5941,3,65,829,5927,1,211,3,5952,1,21,26,5953,2,1,1,5953,4,22,22,5953,1,23,7,5956,1,24,6,5956,3,25,304,5956,3,69,830,5953,1,26,23,
5960,2,27,1,5960,7,28,8,5960,1,29,24,5963,8,20,831,5960,6,30,49,5965,5,31,27,5960,9,32,54,5967,2,33,1,5967,11,34,25,5969,4,35,2,
5967,14,36,4,5952,1,4,11,5952,1,5,12,5952,1,6,13,5549,1,555,32,5975,2,14,1,5975,4,15,2,5975,1,16,48,5978,4,3,20,5978,1,17,41,
5978,3,18,832,5978,1,19,833,5982,12,13,21,5978,1,37,30,5984,2,38,1,5984,13,39,31,5975,1,556,3,5987,4,57,2,5987,1,58,36,5989,1,59,37,
5990,2,60,1,5989,1,61,39,5992,2,1,1,5992,9,62,40,5994,2,1,1,5994,5,63,38,5992,6,64,10,5989,3,66,834,5989,3,65,835,5975,1,152,3,
6000,1,21,26,6001,2,1,1,6001,4,22,22,6001,1,23,7,6004,1,24,6,6004,3,25,131,6004,3,69,836,6001,1,26,23,6008,2,27,1,6008,7,28,8,
6008,1,29,24,6011,8,20,132,6008,6,30,49,6013,5,31,27,6008,9,32,54,6015,2,33,1,6015,11,34,25,6017,4,35,2,6015,14,36,4,6000,1,4,11,
6000,1,5,12,6000,1,6,13,5975,1,557,32,6023,2,14,1,6023,4,15,2,6023,1,16,48,6026,4,3,20,6026,1,17,41,6026,3,18,837,6026,1,19,211,
6030,12,13,21,6026,1,37,30,6032,2,38,1,6032,13,39,31,6023,1,558,3,6035,4,57,2,6035,1,58,36,6037,1,59,37,6038,2,60,1,6037,1,61,39,
6040,2,1,1,6040,9,62,40,6042,2,1,1,6042,5,63,38,6040,6,64,10,6037,3,66,838,6037,3,65,839,6023,1,559,3,6048,1,109,26,6049,2,1,1,
6049,4,110,22,6049,1,111,7,6052,1,112,6,6052,3,113,840,6052,3,114,841,6049,1,7,23,6056,2,115,1,6056,7,116,8,6056,1,8,24,6059,8,20,842,
6056,6,117,49,6061,5,118,105,6056,9,119,137,6063,2,120,1,6063,11,121,25,6065,11,122,106,6065,1,560,111,6067,10,9,4,6067,1,10,16,6069,2,1,1,
6069,1,2,17,6071,2,1,15,6071,7,11,18,6071,1,8,5,6074,8,7,181,6069,3,12,843,6065,1,561,161,6077,10,9,4,6077,1,10,16,6079,2,1,1,
6079,1,2,17,6081,2,1,15,6081,7,11,18,6081,1,8,5,6084,8,7,89,6079,3,12,844,6065,1,562,163,6087,10,9,4,6087,1,10,16,6089,2,1,1,
6089,1,2,17,6091,2,1,15,6091,7,11,18,6091,1,8,5,6094,8,7,96,6089,3,12,845,6065,1,563,115,6097,10,9,4,6097,1,10,16,6099,2,1,1,
6099,1,2,17,6101,2,1,15,6101,7,11,18,6101,1,8,5,6104,8,7,158,6099,3,12,846,6065,1,564,110,6107,10,9,4,6107,1,10,16,6109,2,1,1,
6109,1,2,17,6111,2,1,15,6111,7,11,18,6111,1,8,5,6114,8,7,118,6109,3,12,847,6065,1,565,160,6117,10,9,4,6117,1,10,16,6119,2,1,1,
6119,1,2,17,6121,2,1,15,6121,7,11,18,6121,1,8,5,6124,8,7,116,6119,3,12,848,6065,1,566,113,6127,10,9,4,6127,1,10,16,6129,2,1,1,
6129,1,2,17,6131,2,1,15,6131,7,11,18,6131,1,8,5,6134,8,7,162,6129,3,12,849,6065,1,567,108,6137,10,9,4,6137,1,10,16,6139,2,1,1,
6139,1,2,17,6141,2,1,15,6141,7,11,18,6141,1,8,5,6144,8,7,136,6139,3,12,850,6065,1,568,114,6147,10,9,4,6147,1,10,16,6149,2,1,1,
6149,1,2,17,6151,2,1,15,6151,7,11,18,6151,1,8,5,6154,8,7,138,6149,3,12,851,6065,1,569,109,6157,10,9,4,6157,1,10,16,6159,2,1,1,
6159,1,2,17,6161,2,1,15,6161,7,11,18,6161,1,8,5,6164,8,7,100,6159,3,12,852,6065,1,570,139,6167,10,9,4,6167,1,10,16,6169,2,1,1,
6169,1,2,17,6171,2,1,15,6171,7,11,18,6171,1,8,5,6174,8,7,112,6169,3,12,853,6065,1,571,159,6177,10,9,4,6177,1,10,16,6179,2,1,1,
6179,1,2,17,6181,2,1,15,6181,7,11,18,6181,1,8,5,6184,8,7,101,6179,3,12,854,6065,1,572,164,6187,10,9,4,6187,1,10,16,6189,2,1,1,
6189,1,2,17,6191,2,1,15,6191,7,11,18,6191,1,8,5,6194,8,7,95,6189,3,12,855,6065,1,573,107,6197,10,9,4,6197,1,10,16,6199,2,1,1,
6199,1,2,17,6201,2,1,15,6201,7,11,18,6201,1,8,5,6204,8,7,157,6199,3,12,856,6065,1,574,117,6207,10,9,4,6207,1,10,16,6209,2,1,1,
6209,1,2,17,6211,2,1,15,6211,7,11,18,6211,1,8,5,6214,8,7,183,6209,3,12,857,6065,1,575,184,6217,10,9,4,6217,1,10,16,6219,2,1,1,
6219,1,2,17,6221,2,1,15,6221,7,11,18,6221,1,8,5,6224,8,7,84,6219,3,12,858,6065,1,576,182,6227,10,9,4,6227,1,10,16,6229,2,1,1,
6229,1,2,17,6231,2,1,15,6231,7,11,18,6231,1,8,5,6234,8,7,94,6229,3,12,859,6048,1,4,11,6048,1,5,12,6048,1,6,13,5975,1,577,32,
6240,2,14,1,6240,4,15,2,6240,1,16,48,6243,4,3,20,6243,1,17,41,6243,3,18,860,6243,1,19,861,6247,12,13,21,6243,1,37,30,6249,2,38,1,
6249,13,39,31,6240,1,578,3,6252,4,57,2,6252,1,58,36,6254,1,59,37,6255,2,60,1,6254,1,61,39,6257,2,1,1,6257,9,62,40,6259,2,1,1,
6259,5,63,38,6257,6,64,10,6254,3,66,862,6254,3,65,863,6240,1,579,3,6265,1,40,29,6266,2,41,1,6266,4,42,33,6266,1,43,7,6269,1,44,6,
6269,3,45,864,6266,1,46,28,6272,1,47,34,6273,2,48,9,6273,6,49,19,6273,1,50,865,6276,2,51,9,6272,1,52,35,6278,2,53,1,6278,7,54,8,
6278,1,55,5,6281,8,56,104,6265,1,4,11,6265,1,5,12,6265,1,6,13,2327,1,580,32,6286,2,14,1,6286,4,15,2,6286,1,16,48,6289,4,3,20,
6289,1,17,41,6289,3,18,866,6289,1,19,867,6293,12,13,21,6289,1,37,30,6295,2,38,1,6295,13,39,31,6286,1,581,3,6298,4,57,2,6298,1,58,36,
6300,1,59,37,6301,2,60,1,6300,1,61,39,6303,2,1,1,6303,9,62,40,6305,2,1,1,6305,5,63,38,6303,6,64,10,6300,3,66,868,6300,3,65,869,
6286,1,582,3,6311,1,40,29,6312,2,41,1,6312,4,42,33,6312,1,43,7,6315,1,44,6,6315,3,45,870,6315,3,77,871,6312,1,46,28,6319,1,47,34,
6320,2,48,9,6320,6,49,19,6320,1,50,185,6323,2,51,9,6319,1,52,35,6325,2,53,1,6325,7,54,8,6325,1,55,5,6328,8,56,100,6311,1,4,11,
6311,1,5,12,6311,1,6,13,1592,1,583,32,6333,2,14,1,6333,4,15,2,6333,15,73,4,6333,1,16,56,6337,4,3,20,6337,1,17,58,6337,3,18,872,
6337,1,19,873,6341,12,13,21,6337,1,37,30,6343,2,38,1,6343,13,39,31,6333,1,584,3,6346,4,57,2,6346,1,58,36,6348,1,59,37,6349,2,60,1,
6348,1,61,39,6351,2,1,1,6351,9,62,40,6353,2,1,1,6353,5,63,38,6351,6,64,10,6348,3,66,874,6348,3,65,875,6333,1,123,3,6359,4,57,2,
6359,1,58,36,6361,1,59,37,6362,2,60,1,6362,1,4,77,6362,1,5,78,6362,1,6,79,6361,1,61,39,6367,2,1,1,6367,9,62,40,6369,2,1,1,
6369,5,63,38,6367,6,64,10,6361,3,66,119,6361,3,65,120,6333,1,212,3,6375,1,21,135,6376,2,1,1,6376,4,22,22,6376,1,23,7,6379,1,24,6,
6379,3,25,305,6379,3,69,306,6376,1,26,23,6383,2,27,1,6383,7,28,8,6383,1,29,24,6386,8,20,307,6383,6,30,49,6388,5,31,27,6383,9,32,165,
6390,2,33,1,6390,11,34,25,6392,4,35,2,6390,14,36,4,6375,1,92,70,6395,1,213,3,6396,1,21,26,6397,2,1,1,6397,4,22,22,6397,1,23,7,
6400,1,24,6,6400,3,25,308,6400,3,69,309,6397,1,26,23,6404,2,27,1,6404,7,28,8,6404,1,29,24,6407,8,20,310,6404,6,30,49,6409,5,31,27,
6404,9,32,134,6411,2,33,1,6411,11,34,25,6413,4,35,2,6411,14,36,4,6333,1,265,3,6416,1,21,26,6417,2,1,1,6417,4,22,22,6417,1,23,7,
6420,1,24,6,6420,3,25,349,6420,3,69,876,6417,1,26,23,6424,2,27,1,6424,7,28,8,6424,1,29,24,6427,8,20,877,6424,6,30,49,6429,5,31,27,
6424,9,32,59,6431,2,33,1,6431,11,34,25,6433,4,35,2,6431,14,36,4,6333,1,585,3,6436,4,57,2,6436,1,58,36,6438,1,59,37,6439,2,60,1,
6438,1,61,39,6441,2,1,1,6441,9,62,40,6443,2,1,1,6443,5,63,38,6441,6,64,10,6438,3,66,878,6438,3,65,879,1592,1,586,32,6449,2,14,1,
6449,4,15,2,6449,15,73,4,6449,1,16,56,6453,4,3,20,6453,1,17,58,6453,3,18,880,6453,1,19,343,6457,12,13,21,6453,1,37,30,6459,2,38,1,
6459,13,39,31,6449,1,587,3,6462,4,57,2,6462,1,58,36,6464,1,59,37,6465,2,60,1,6464,1,61,39,6467,2,1,1,6467,9,62,40,6469,2,1,1,
6469,5,63,38,6467,6,64,10,6464,3,66,352,6464,3,65,881,6449,1,123,3,6475,4,57,2,6475,1,58,36,6477,1,59,37,6478,2,60,1,6478,1,4,77,
6478,1,5,78,6478,1,6,79,6477,1,61,39,6483,2,1,1,6483,9,62,40,6485,2,1,1,6485,5,63,38,6483,6,64,10,6477,3,66,119,6477,3,65,120,
6449,1,212,3,6491,1,21,135,6492,2,1,1,6492,4,22,22,6492,1,23,7,6495,1,24,6,6495,3,25,305,6495,3,69,306,6492,1,26,23,6499,2,27,1,
6499,7,28,8,6499,1,29,24,6502,8,20,307,6499,6,30,49,6504,5,31,27,6499,9,32,165,6506,2,33,1,6506,11,34,25,6508,4,35,2,6506,14,36,4,
6491,1,92,70,6511,1,213,3,6512,1,21,26,6513,2,1,1,6513,4,22,22,6513,1,23,7,6516,1,24,6,6516,3,25,308,6516,3,69,309,6513,1,26,23,
6520,2,27,1,6520,7,28,8,6520,1,29,24,6523,8,20,310,6520,6,30,49,6525,5,31,27,6520,9,32,134,6527,2,33,1,6527,11,34,25,6529,4,35,2,
6527,14,36,4,1592,1,588,32,6532,2,14,1,6532,4,15,2,6532,15,73,4,6532,1,16,56,6536,4,3,20,6536,1,17,58,6536,3,18,882,6536,1,19,883,
6540,12,13,21,6536,1,37,30,6542,2,38,1,6542,13,39,31,6532,1,589,3,6545,4,57,2,6545,1,58,36,6547,1,59,37,6548,2,60,1,6547,1,61,39,
6550,2,1,1,6550,9,62,40,6552,2,1,1,6552,5,63,38,6550,6,64,10,6547,3,66,352,6547,3,65,884,6532,1,123,3,6558,4,57,2,6558,1,58,36,
6560,1,59,37,6561,2,60,1,6561,1,4,77,6561,1,5,78,6561,1,6,79,6560,1,61,39,6566,2,1,1,6566,9,62,40,6568,2,1,1,6568,5,63,38,
6566,6,64,10,6560,3,66,119,6560,3,65,120,6532,1,212,3,6574,1,21,135,6575,2,1,1,6575,4,22,22,6575,1,23,7,6578,1,24,6,6578,3,25,305,
6578,3,69,306,6575,1,26,23,6582,2,27,1,6582,7,28,8,6582,1,29,24,6585,8,20,307,6582,6,30,49,6587,5,31,27,6582,9,32,165,6589,2,33,1,
6589,11,34,25,6591,4,35,2,6589,14,36,4,6574,1,92,70,6594,1,213,3,6595,1,21,26,6596,2,1,1,6596,4,22,22,6596,1,23,7,6599,1,24,6,
6599,3,25,308,6599,3,69,309,6596,1,26,23,6603,2,27,1,6603,7,28,8,6603,1,29,24,6606,8,20,310,6603,6,30,49,6608,5,31,27,6603,9,32,134,
6610,2,33,1,6610,11,34,25,6612,4,35,2,6610,14,36,4,1592,1,590,32,6615,2,14,1,6615,4,15,2,6615,15,73,4,6615,1,16,56,6619,4,3,20,
6619,1,17,58,6619,3,18,885,6619,1,19,886,6623,12,13,21,6619,1,37,30,6625,2,38,1,6625,13,39,31,6615,1,591,3,6628,4,57,2,6628,1,58,36,
6630,1,59,37,6631,2,60,1,6630,1,61,39,6633,2,1,1,6633,9,62,40,6635,2,1,1,6635,5,63,38,6633,6,64,10,6630,3,66,887,6630,3,65,888,
6615,1,592,3,6641,4,57,2,6641,1,58,36,6643,1,59,37,6644,2,60,1,6644,1,4,77,6644,1,5,78,6644,1,6,79,6643,1,61,39,6649,2,1,1,
6649,9,62,40,6651,2,1,1,6651,5,63,38,6649,6,64,10,6643,3,66,889,6643,3,65,890,6615,1,593,3,6657,1,40,29,6658,2,41,1,6658,4,42,33,
6658,1,43,7,6661,1,44,6,6661,3,45,891,6661,3,77,892,6658,1,46,28,6665,1,47,34,6666,2,48,9,6666,6,49,19,6666,1,50,51,6669,2,51,9,
6665,1,52,35,6671,2,53,1,6671,7,54,8,6671,1,55,5,6674,8,56,84,6657,1,4,11,6657,1,5,12,6657,1,6,13,6615,1,594,3,6679,1,21,26,
6680,2,1,1,6680,4,22,22,6680,1,23,7,6683,1,24,6,6683,3,25,893,6683,3,69,894,6680,1,26,23,6687,2,27,1,6687,7,28,8,6687,1,29,24,
6690,8,20,895,6687,6,30,49,6692,5,31,27,6687,9,32,134,6694,2,33,1,6694,11,34,25,6696,4,35,2,6694,14,36,4,6679,1,4,11,6679,1,5,12,
6679,1,6,13,6615,1,595,3,6702,1,40,29,6703,2,41,1,6703,4,42,33,6703,1,43,7,6706,1,44,6,6706,3,45,896,6706,3,77,897,6703,1,46,28,
6710,1,47,34,6711,2,48,9,6711,6,49,19,6711,1,50,898,6714,2,51,9,6710,1,52,35,6716,2,53,1,6716,7,54,8,6716,1,55,5,6719,8,56,899,
6615,1,596,55,6721,1,70,52,6722,2,71,1,6721,3,72,900,26,9,597,901,6725,3,106,902,6725,11,107,903,6727,4,108,82,6727,1,598,353,6729,2,14,1,
6729,4,15,2,6729,15,73,4,6729,1,16,56,6733,4,3,20,6733,1,17,58,6733,3,18,904,6733,1,19,905,6737,12,13,21,6729,1,599,3,6739,4,57,2,
6739,1,58,36,6741,1,59,37,6742,2,60,1,6741,1,61,39,6744,2,1,1,6744,9,62,40,6746,2,1,1,6746,5,63,38,6744,6,64,10,6741,3,66,906,
6741,3,65,907,6727,1,600,32,6752,2,14,1,6752,4,15,2,6752,15,73,4,6752,1,16,56,6756,4,3,20,6756,1,17,58,6756,3,18,908,6756,1,19,334,
6760,12,13,21,6756,1,37,30,6762,2,38,1,6762,13,39,31,6752,1,601,3,6765,4,57,2,6765,1,58,36,6767,1,59,37,6768,2,60,1,6767,1,61,39,
6770,2,1,1,6770,9,62,40,6772,2,1,1,6772,5,63,38,6770,6,64,10,6767,3,66,909,6767,3,65,910,6752,1,602,3,6778,1,40,29,6779,2,41,1,
6779,4,42,33,6779,1,43,7,6782,1,44,6,6782,3,45,911,6782,3,77,912,6779,1,46,28,6786,1,47,34,6787,2,48,9,6787,6,49,19,6787,1,50,51,
6790,2,51,9,6786,1,52,35,6792,2,53,1,6792,7,54,8,6792,1,55,5,6795,8,56,50,6778,1,4,11,6778,1,5,12,6778,1,6,13,6752,1,160,3,
6800,1,21,26,6801,2,1,1,6801,4,22,22,6801,1,23,7,6804,1,24,6,6804,3,25,186,6804,3,69,913,6801,1,26,23,6808,2,27,1,6808,7,28,8,
6808,1,29,24,6811,3,20,187,6808,6,30,53,6813,5,31,27,6808,9,32,54,6815,2,33,1,6815,11,34,25,6817,4,35,2,6815,14,36,4,6800,1,4,11,
6800,1,5,12,6800,1,6,13,6727,1,263,32,6823,2,14,1,6823,4,15,2,6823,15,73,4,6823,1,16,56,6827,4,3,20,6827,1,17,58,6827,3,18,914,
6827,1,19,915,6831,12,13,21,6827,1,37,30,6833,2,38,1,6833,13,39,31,6823,1,264,3,6836,4,57,2,6836,1,58,36,6838,1,59,37,6839,2,60,1,
6838,1,61,39,6841,2,1,1,6841,9,62,40,6843,2,1,1,6843,5,63,38,6841,6,64,10,6838,3,66,916,6838,3,65,346,6823,1,603,3,6849,1,40,29,
6850,2,41,1,6850,4,42,33,6850,1,43,7,6853,1,44,6,6853,3,45,917,6853,3,77,918,6850,1,46,28,6857,1,47,34,6858,2,48,9,6858,6,49,19,
6858,1,50,51,6861,2,51,9,6857,1,52,35,6863,2,53,1,6863,7,54,8,6863,1,55,5,6866,8,56,84,6849,1,4,11,6849,1,5,12,6849,1,6,13,
6823,1,160,3,6871,1,21,26,6872,2,1,1,6872,4,22,22,6872,1,23,7,6875,1,24,6,6875,3,25,186,6875,3,69,311,6872,1,26,23,6879,2,27,1,
6879,7,28,8,6879,1,29,24,6882,3,20,187,6879,6,30,53,6884,5,31,27,6879,9,32,54,6886,2,33,1,6886,11,34,25,6888,4,35,2,6886,14,36,4,
6871,1,4,11,6871,1,5,12,6871,1,6,13,6727,1,604,32,6894,2,14,1,6894,4,15,2,6894,15,73,4,6894,1,16,56,6898,4,3,20,6898,1,17,58,
6898,3,18,919,6898,1,19,920,6902,12,13,21,6898,1,37,30,6904,2,38,1,6904,13,39,31,6894,1,605,32,6907,2,14,1,6907,4,15,2,6907,1,16,48,
6910,4,3,20,6910,1,17,58,6910,3,18,921,6910,1,19,922,6914,12,13,21,6910,1,37,30,6916,2,38,1,6916,13,39,31,6907,1,606,3,6919,4,57,2,
6919,1,58,36,6921,1,59,37,6922,2,60,1,6921,1,61,39,6924,2,1,1,6924,9,62,40,6926,2,1,1,6926,5,63,38,6924,6,64,10,6921,3,66,923,
6921,3,65,924,6907,1,267,3,6932,1,40,29,6933,2,41,1,6933,4,42,33,6933,1,43,7,6936,1,44,6,6936,3,45,354,6936,3,77,925,6933,1,46,28,
6940,1,47,34,6941,2,48,9,6941,6,49,19,6941,1,50,355,6944,2,51,9,6940,1,52,35,6946,2,53,1,6946,7,54,8,6946,1,55,5,6949,8,56,84,
6932,1,4,11,6932,1,5,12,6932,1,6,13,6907,1,160,3,6954,1,21,26,6955,2,1,1,6955,4,22,22,6955,1,23,7,6958,1,24,6,6958,3,25,186,
6958,3,69,311,6955,1,26,23,6962,2,27,1,6962,7,28,8,6962,1,29,24,6965,3,20,187,6962,6,30,53,6967,5,31,27,6962,9,32,54,6969,2,33,1,
6969,11,34,25,6971,4,35,2,6969,14,36,4,6954,1,4,11,6954,1,5,12,6954,1,6,13,6894,1,607,32,6977,2,14,1,6977,4,15,2,6977,1,16,48,
6980,4,3,20,6980,1,17,58,6980,3,18,926,6980,1,19,927,6984,12,13,21,6980,1,37,30,6986,2,38,1,6986,13,39,31,6977,1,608,3,6989,4,57,2,
6989,1,58,36,6991,1,59,37,6992,2,60,1,6991,1,61,39,6994,2,1,1,6994,9,62,40,6996,2,1,1,6996,5,63,38,6994,6,64,10,6991,3,66,928,
6991,3,65,929,6977,1,267,3,7002,1,40,29,7003,2,41,1,7003,4,42,33,7003,1,43,7,7006,1,44,6,7006,3,45,354,7006,3,77,930,7003,1,46,28,
7010,1,47,34,7011,2,48,9,7011,6,49,19,7011,1,50,355,7014,2,51,9,7010,1,52,35,7016,2,53,1,7016,7,54,8,7016,1,55,5,7019,8,56,84,
7002,1,4,11,7002,1,5,12,7002,1,6,13,6977,1,160,3,7024,1,21,26,7025,2,1,1,7025,4,22,22,7025,1,23,7,7028,1,24,6,7028,3,25,186,
7028,3,69,311,7025,1,26,23,7032,2,27,1,7032,7,28,8,7032,1,29,24,7035,3,20,187,7032,6,30,53,7037,5,31,27,7032,9,32,54,7039,2,33,1,
7039,11,34,25,7041,4,35,2,7039,14,36,4,7024,1,4,11,7024,1,5,12,7024,1,6,13,6727,1,103,88,6727,1,609,931,7048,2,14,1,7048,4,15,2,
7048,15,73,4,7048,1,16,56,7052,4,3,20,7052,1,17,58,7052,3,18,932,7052,1,19,933,7056,12,13,21,7048,1,610,3,7058,4,57,2,7058,1,58,36,
7060,1,59,37,7061,2,60,1,7060,1,61,39,7063,2,1,1,7063,9,62,40,7065,2,1,1,7065,5,63,38,7063,6,64,10,7060,3,66,934,7060,3,65,935,
7048,1,611,3,7071,4,57,2,7071,1,58,36,7073,1,59,37,7074,2,60,1,7073,1,61,39,7076,2,1,1,7076,9,62,40,7078,2,1,1,7078,5,63,38,
7076,6,64,10,7073,3,66,936,7073,3,65,937,7048,1,612,3,7084,4,57,2,7084,1,58,36,7086,1,59,37,7087,2,60,1,7086,1,61,39,7089,2,1,1,
7089,9,62,92,7091,2,1,1,7091,5,63,38,7089,6,64,10,7086,3,66,938,7086,3,65,939,7048,1,613,3,7097,4,57,2,7097,1,58,36,7099,1,59,37,
7100,2,60,1,7099,1,61,39,7102,2,1,1,7102,9,62,40,7104,2,1,1,7104,5,63,38,7102,6,64,10,7099,3,66,940,7099,3,65,941,7048,1,614,3,
7110,4,57,2,7110,1,58,36,7112,1,59,37,7113,2,60,1,7112,1,61,39,7115,2,1,1,7115,9,62,40,7117,2,1,1,7117,5,63,38,7115,6,64,10,
7112,3,66,942,7112,3,65,943,6727,1,615,32,7123,2,14,1,7123,4,15,2,7123,15,73,4,7123,1,16,56,7127,4,3,20,7127,1,17,58,7127,3,18,944,
7127,1,19,945,7131,12,13,21,7127,1,37,30,7133,2,38,1,7133,13,39,31,7123,1,616,3,7136,4,57,2,7136,1,58,36,7138,1,59,37,7139,2,60,1,
7138,1,61,39,7141,2,1,1,7141,9,62,40,7143,2,1,1,7143,5,63,38,7141,6,64,10,7138,3,66,946,7138,3,65,947,7123,1,617,3,7149,4,57,2,
7149,1,58,36,7151,1,59,37,7152,2,60,1,7151,1,61,39,7154,2,1,1,7154,9,62,40,7156,2,1,1,7156,5,63,38,7154,6,64,10,7151,3,66,948,
7151,3,65,949,7123,1,618,3,7162,1,40,29,7163,2,41,1,7163,4,42,33,7163,1,43,7,7166,1,44,6,7166,3,45,950,7166,3,77,951,7163,1,46,28,
7170,1,47,34,7171,2,48,9,7171,6,49,19,7171,1,50,51,7174,2,51,9,7170,1,52,35,7176,2,53,1,7176,7,54,8,7176,1,55,5,7179,8,56,84,
7162,1,4,11,7162,1,5,12,7162,1,6,13,6727,1,103,88,6727,1,619,952,7185,2,14,1,7185,4,15,2,7185,15,73,4,7185,1,16,56,7189,4,3,20,
7189,1,17,58,7189,3,18,953,7189,1,19,954,7193,12,13,21,7185,1,620,3,7195,4,57,2,7195,1,58,36,7197,1,59,37,7198,2,60,1,7197,1,61,39,
7200,2,1,1,7200,9,62,40,7202,2,1,1,7202,5,63,38,7200,6,64,10,7197,3,66,955,7197,3,65,956,7185,1,211,3,7208,1,21,26,7209,2,1,1,
7209,4,22,22,7209,1,23,7,7212,1,24,6,7212,3,25,304,7212,3,69,957,7209,1,26,23,7216,2,27,1,7216,7,28,8,7216,1,29,24,7219,8,20,958,
7216,6,30,49,7221,5,31,27,7216,9,32,54,7223,2,33,1,7223,11,34,25,7225,4,35,2,7225,1,621,28,7227,2,79,1,7227,3,80,959,7227,6,81,19,
7225,1,622,28,7231,2,79,1,7231,3,80,960,7231,6,81,19,7225,1,623,28,7235,2,79,1,7235,3,80,961,7235,6,81,19,7225,1,624,28,7239,2,79,1,
7239,3,80,962,7239,6,81,19,7225,1,625,28,7243,2,79,1,7243,3,80,963,7243,6,81,19,7225,1,626,28,7247,2,79,1,7247,3,80,964,7247,6,81,19,
7225,1,627,28,7251,2,79,1,7251,3,80,965,7251,6,81,19,7225,1,628,28,7255,2,79,1,7255,3,80,966,7255,6,81,19,7225,1,629,28,7259,2,79,1,
7259,3,80,967,7259,6,81,19,7225,1,630,28,7263,2,79,1,7263,3,80,968,7263,6,81,19,7225,1,631,28,7267,2,79,1,7267,3,80,969,7267,6,81,19,
7225,1,632,28,7271,2,79,1,7271,3,80,970,7271,6,81,19,7223,14,36,4,7208,1,4,11,7208,1,5,12,7208,1,6,13,7185,1,103,312,7185,1,633,86,
7280,1,21,26,7281,2,1,1,7281,4,22,22,7281,1,23,7,7284,1,24,6,7284,3,25,971,7284,3,69,972,7281,1,26,23,7288,2,27,1,7288,7,28,8,
7288,1,29,24,7291,3,20,973,7288,6,30,53,7293,5,31,27,7288,9,32,974,7295,2,33,1,7295,11,34,25,7297,4,35,2,7295,14,36,4,7185,1,103,312,
7185,1,634,55,7301,1,70,52,7302,2,71,1,7301,3,72,975,7185,1,635,86,7305,4,57,2,7305,1,58,36,7307,1,59,37,7308,2,60,1,7307,1,61,39,
7310,2,1,1,7310,9,62,40,7312,2,1,1,7312,5,63,38,7310,6,64,10,7307,3,66,976,7307,3,65,977,7185,1,636,86,7318,1,21,26,7319,2,1,1,
7319,4,22,22,7319,1,23,7,7322,1,24,6,7322,3,25,978,7322,3,69,979,7319,1,26,23,7326,2,27,1,7326,7,28,8,7326,1,29,24,7329,3,20,980,
7326,6,30,53,7331,5,31,27,7326,9,32,356,7333,2,33,1,7333,11,34,25,7335,4,35,2,7333,14,36,4,7318,1,4,11,7318,1,5,12,7318,1,6,13,
7185,1,103,312,7185,1,637,86,7342,1,40,29,7343,2,41,1,7343,4,42,33,7343,1,43,7,7346,1,44,6,7346,3,45,981,7346,3,77,982,7343,1,46,28,
7350,1,47,34,7351,2,48,9,7351,6,49,19,7351,1,50,357,7354,2,51,9,7350,1,52,35,7356,2,53,1,7356,7,54,8,7356,1,55,5,7359,8,56,89,
7185,1,638,86,7361,1,40,29,7362,2,41,1,7362,4,42,33,7362,1,43,7,7365,1,44,6,7365,3,45,983,7365,3,77,984,7362,1,46,28,7369,1,47,34,
7370,2,48,9,7370,6,49,19,7370,1,50,357,7373,2,51,9,7369,1,52,35,7375,2,53,1,7375,7,54,8,7375,1,55,5,7378,8,56,89,7361,1,4,11,
7361,1,5,12,7361,1,6,13,7185,1,639,86,7383,1,40,29,7384,2,41,1,7384,4,42,33,7384,1,43,7,7387,1,44,6,7387,3,45,985,7387,3,77,986,
7384,1,46,28,7391,1,47,34,7392,2,48,9,7392,6,49,19,7392,1,50,987,7395,2,51,9,7391,1,52,35,7397,2,53,1,7397,7,54,8,7397,1,55,5,
7400,8,56,89,7383,1,4,11,7383,1,5,12,7383,1,6,13,7185,1,640,86,7405,1,21,26,7406,2,1,1,7406,4,22,22,7406,1,23,7,7409,1,24,6,
7409,3,25,988,7409,3,69,989,7406,1,26,23,7413,2,27,1,7413,7,28,8,7413,1,29,24,7416,3,20,990,7413,6,30,53,7418,5,31,27,7413,9,32,154,
7420,2,33,1,7420,11,34,25,7422,4,35,2,7420,14,36,991,7405,1,4,11,7405,1,5,12,7405,1,6,13,7185,1,641,86,7428,1,40,29,7429,2,41,1,
7429,4,42,33,7429,1,43,7,7432,1,44,6,7432,3,45,992,7432,3,77,993,7429,1,46,28,7436,1,47,34,7437,2,48,9,7437,6,49,19,7437,1,50,51,
7440,2,51,9,7436,1,52,35,7442,2,53,1,7442,7,54,8,7442,1,55,5,7445,8,56,50,7428,1,4,11,7428,1,5,12,7428,1,6,13,7185,1,642,86,
7450,4,57,2,7450,1,58,36,7452,1,59,37,7453,2,60,1,7453,1,4,77,7453,1,5,78,7453,1,6,79,7452,1,61,39,7458,2,1,1,7458,9,62,40,
7460,2,1,1,7460,5,63,38,7458,6,64,10,7452,3,66,994,7452,3,65,995,7185,1,643,86,7466,1,40,29,7467,2,41,1,7467,4,42,33,7467,1,43,7,
7470,1,44,6,7470,3,45,996,7470,3,77,997,7467,1,46,28,7474,1,47,34,7475,2,48,9,7475,6,49,19,7475,1,50,358,7478,2,51,9,7474,1,52,35,
7480,2,53,1,7480,7,54,8,7480,1,55,5,7483,8,56,84,7466,1,4,11,7466,1,5,12,7466,1,6,13,7185,1,644,156,7488,1,70,52,7489,2,71,1,
7488,3,72,998,7185,1,645,156,7492,1,70,52,7493,2,71,1,7492,3,72,999,7185,1,646,156,7496,1,70,52,7497,2,71,1,7496,3,72,1000,7185,1,647,156,
7500,1,70,52,7501,2,71,1,7500,3,72,1001,6727,1,648,32,7504,2,14,1,7504,4,15,2,7504,15,73,4,7504,1,16,56,7508,4,3,20,7508,1,17,58,
7508,3,18,1002,7508,1,19,1003,7512,12,13,21,7508,1,37,30,7514,2,38,1,7514,13,39,31,7508,1,93,71,7517,2,74,1,7517,13,94,72,7504,1,95,73,
7520,1,96,74,7521,2,74,15,7521,7,97,75,7521,1,98,5,7524,1,99,6,7524,8,100,90,7524,5,101,76,7504,1,649,32,7528,2,14,1,7528,4,15,2,
7528,1,16,48,7531,4,3,20,7531,1,17,41,7531,3,18,1004,7531,1,19,1005,7535,12,13,21,7531,1,37,30,7537,2,38,1,7537,13,39,31,7528,1,650,3,
7540,4,57,2,7540,1,58,36,7542,1,59,37,7543,2,60,1,7542,1,61,39,7545,2,1,1,7545,9,62,40,7547,2,1,1,7547,5,63,38,7545,6,64,10,
7542,3,66,1006,7542,3,65,1007,7528,1,651,3,7553,4,57,2,7553,1,58,36,7555,1,59,37,7556,2,60,1,7556,1,4,77,7556,1,5,78,7556,1,6,79,
7555,1,61,39,7561,2,1,1,7561,9,62,40,7563,2,1,1,7563,5,63,38,7561,6,64,10,7555,3,66,1008,7555,3,65,1009,6727,1,652,329,7569,2,14,1,
7569,4,15,2,7569,15,73,4,7569,1,16,56,7573,4,3,20,7573,1,17,58,7573,3,18,1010,7573,1,19,1011,7577,12,13,21,7573,1,37,30,7579,2,38,1,
7579,13,39,359,7569,1,653,3,7582,1,82,29,7583,2,1,1,7583,4,83,66,7583,1,84,7,7586,1,85,6,7586,3,86,1012,7586,3,102,1013,7583,1,87,67,
7590,2,88,1,7590,1,89,5,7592,6,90,1014,7592,1,91,68,7594,5,78,69,7569,1,654,32,7596,2,14,1,7596,4,15,2,7596,1,16,48,7599,4,3,20,
7599,1,17,41,7599,3,18,1015,7599,1,19,1016,7603,12,13,21,7599,1,37,30,7605,2,38,1,7605,13,39,31,7596,1,655,3,7608,4,57,2,7608,1,58,36,
7610,1,59,37,7611,2,60,1,7610,1,61,39,7613,2,1,1,7613,9,62,92,7615,2,1,1,7615,5,63,38,7613,6,64,10,7610,3,66,1017,7610,3,65,1018,
7596,1,656,3,7621,1,21,26,7622,2,1,1,7622,4,22,22,7622,1,23,7,7625,1,24,6,7625,3,25,1019,7625,3,69,1020,7622,1,26,23,7629,2,27,1,
7629,7,28,8,7629,1,29,24,7632,3,20,1021,7629,6,30,53,7634,5,31,27,7629,9,32,154,7636,2,33,1,7636,11,34,25,7638,4,35,2,7636,14,36,1022,
7596,1,657,3,7641,1,21,26,7642,2,1,1,7642,4,22,22,7642,1,23,7,7645,1,24,6,7645,3,25,1023,7645,3,69,1024,7642,1,26,23,7649,2,27,1,
7649,7,28,8,7649,1,29,24,7652,3,20,1025,7649,6,30,53,7654,5,31,27,7649,9,32,154,7656,2,33,1,7656,11,34,25,7658,4,35,2,7656,14,36,1026,
7596,1,658,86,7661,1,40,29,7662,2,41,1,7662,4,42,33,7662,1,43,7,7665,1,44,6,7665,3,45,1027,7665,3,77,1028,7662,1,46,28,7669,1,47,34,
7670,2,48,9,7670,6,49,19,7670,1,50,358,7673,2,51,9,7669,1,52,35,7675,2,53,1,7675,7,54,8,7675,1,55,5,7678,8,56,84,7596,1,211,3,
7680,1,21,26,7681,2,1,1,7681,4,22,22,7681,1,23,7,7684,1,24,6,7684,3,25,304,7684,3,69,1029,7681,1,26,23,7688,2,27,1,7688,7,28,8,
7688,1,29,24,7691,8,20,1030,7688,6,30,49,7693,5,31,27,7688,9,32,54,7695,2,33,1,7695,11,34,25,7697,4,35,2,7695,14,36,1031,7596,1,659,3,
7700,1,40,29,7701,2,41,1,7701,4,42,33,7701,1,43,7,7704,1,44,6,7704,3,45,1032,7704,3,77,1033,7701,1,46,28,7708,1,47,34,7709,2,48,9,
7709,6,49,19,7709,1,50,1034,7712,2,51,9,7708,1,52,35,7714,2,53,1,7714,7,54,8,7714,1,55,5,7717,8,56,1035,7596,1,660,3,7719,1,82,29,
7720,2,1,1,7720,4,83,66,7720,1,84,7,7723,1,85,6,7723,3,86,1036,7723,3,102,1037,7720,1,87,67,7727,2,88,1,7727,1,89,5,7729,6,90,121,
7729,1,91,68,7731,5,78,69,7596,1,661,55,7733,1,70,52,7734,2,71,1,7733,3,72,1038,7569,1,662,32,7737,2,14,1,7737,4,15,2,7737,1,16,48,
7740,4,3,20,7740,1,17,41,7740,3,18,1039,7740,1,19,360,7744,12,13,21,7740,1,37,30,7746,2,38,1,7746,13,39,31,7737,1,663,3,7749,4,57,2,
7749,1,58,36,7751,1,59,37,7752,2,60,1,7751,1,61,39,7754,2,1,1,7754,9,62,40,7756,2,1,1,7756,5,63,38,7754,6,64,10,7751,3,66,1040,
7751,3,65,1041,7737,1,664,3,7762,1,40,29,7763,2,41,1,7763,4,42,33,7763,1,43,7,7766,1,44,6,7766,3,45,1042,7766,3,77,1043,7763,1,46,28,
7770,1,47,34,7771,2,48,9,7771,6,49,19,7771,1,50,185,7774,2,51,9,7770,1,52,35,7776,2,53,1,7776,7,54,8,7776,1,55,5,7779,8,56,138,
6727,1,103,88,6727,1,665,1044,7782,2,14,1,7782,4,15,2,7782,15,73,4,7782,1,16,56,7786,4,3,20,7786,1,17,58,7786,3,18,1045,7786,1,19,1046,
7790,12,13,21,7782,1,666,3,7792,4,57,2,7792,1,58,36,7794,1,59,37,7795,2,60,1,7794,1,61,39,7797,2,1,1,7797,9,62,92,7799,2,1,1,
7799,5,63,38,7797,6,64,10,7794,3,66,1047,7794,3,65,1048,7782,1,667,3,7805,4,57,2,7805,1,58,36,7807,1,59,37,7808,2,60,1,7807,1,61,39,
7810,2,1,1,7810,9,62,40,7812,2,1,1,7812,5,63,38,7810,6,64,10,7807,3,66,1049,7807,3,65,1050,7782,1,668,3,7818,4,57,2,7818,1,58,36,
7820,1,59,37,7821,2,60,1,7820,1,61,39,7823,2,1,1,7823,9,62,40,7825,2,1,1,7825,5,63,38,7823,6,64,10,7820,3,66,1051,7820,3,65,1052,
7782,1,669,3,7831,4,57,2,7831,1,58,36,7833,1,59,37,7834,2,60,1,7833,1,61,39,7836,2,1,1,7836,9,62,40,7838,2,1,1,7838,5,63,38,
7836,6,64,10,7833,3,66,1053,7833,3,65,1054,26,9,670,1055,7844,3,106,1056,7844,11,107,1057,7846,4,108,82,7846,1,671,353,7848,2,14,1,7848,4,15,2,
7848,15,73,4,7848,1,16,56,7852,4,3,20,7852,1,17,58,7852,3,18,1058,7852,1,19,1059,7856,12,13,21,7848,1,672,3,7858,4,57,2,7858,1,58,36,
7860,1,59,37,7861,2,60,1,7860,1,61,39,7863,2,1,1,7863,9,62,40,7865,2,1,1,7865,5,63,38,7863,6,64,10,7860,3,66,1060,7860,3,65,1061,
7846,1,673,32,7871,2,14,1,7871,4,15,2,7871,15,73,4,7871,1,16,56,7875,4,3,20,7875,1,17,58,7875,3,18,1062,7875,1,19,1063,7879,12,13,21,
7875,1,37,30,7881,2,38,1,7881,13,39,31,7871,1,674,32,7884,2,14,1,7884,4,15,2,7884,1,16,48,7887,4,3,20,7887,1,17,41,7887,3,18,1064,
7887,1,19,333,7891,12,13,21,7887,1,37,30,7893,2,38,1,7893,13,39,31,7884,1,675,55,7896,1,70,52,7897,2,71,1,7896,3,72,1065,7884,1,676,3,
7900,1,40,83,7901,2,41,1,7901,4,42,33,7901,1,43,7,7904,1,44,6,7904,3,45,1066,7901,1,46,28,7907,1,47,34,7908,2,48,9,7908,6,49,19,
7908,1,50,51,7911,2,51,9,7907,1,52,35,7913,2,53,1,7913,7,54,8,7913,1,55,5,7916,8,56,84,7900,1,92,70,7918,1,677,3,7919,1,40,29,
7920,2,41,1,7920,4,42,33,7920,1,43,7,7923,1,44,6,7923,3,45,1067,7920,1,46,28,7926,1,47,34,7927,2,48,9,7927,6,49,19,7927,1,50,185,
7930,2,51,9,7926,1,52,35,7932,2,53,1,7932,7,54,8,7932,1,55,5,7935,8,56,94,7884,1,678,3,7937,1,40,83,7938,2,41,1,7938,4,42,33,
7938,1,43,7,7941,1,44,6,7941,3,45,1068,7938,1,46,28,7944,1,47,34,7945,2,48,9,7945,6,49,19,7945,1,50,361,7948,2,51,9,7944,1,52,35,
7950,2,53,1,7950,7,54,8,7950,1,55,5,7953,8,56,96,7937,1,92,70,7955,1,679,3,7956,1,40,29,7957,2,41,1,7957,4,42,33,7957,1,43,7,
7960,1,44,6,7960,3,45,1069,7957,1,46,28,7963,1,47,34,7964,2,48,9,7964,6,49,19,7964,1,50,362,7967,2,51,9,7963,1,52,35,7969,2,53,1,
7969,7,54,8,7969,1,55,5,7972,8,56,101,7884,1,680,3,7974,1,40,83,7975,2,41,1,7975,4,42,33,7975,1,43,7,7978,1,44,6,7978,3,45,1070,
7975,1,46,28,7981,1,47,34,7982,2,48,9,7982,6,49,19,7982,1,50,363,7985,2,51,9,7981,1,52,35,7987,2,53,1,7987,7,54,8,7987,1,55,5,
7990,8,56,89,7974,1,92,70,7992,1,681,3,7993,1,40,29,7994,2,41,1,7994,4,42,33,7994,1,43,7,7997,1,44,6,7997,3,45,1071,7994,1,46,28,
8000,1,47,34,8001,2,48,9,8001,6,49,19,8001,1,50,93,8004,2,51,9,8000,1,52,35,8006,2,53,1,8006,7,54,8,8006,1,55,5,8009,8,56,95,
7871,1,682,32,8011,2,14,1,8011,4,15,2,8011,1,16,48,8014,4,3,20,8014,1,17,41,8014,3,18,1072,8014,1,19,180,8018,12,13,21,8014,1,37,30,
8020,2,38,1,8020,13,39,31,8011,1,683,55,8023,1,70,52,8024,2,71,1,8023,3,72,1073,8011,1,684,3,8027,1,40,83,8028,2,41,1,8028,4,42,33,
8028,1,43,7,8031,1,44,6,8031,3,45,1074,8028,1,46,28,8034,1,47,34,8035,2,48,9,8035,6,49,19,8035,1,50,51,8038,2,51,9,8034,1,52,35,
8040,2,53,1,8040,7,54,8,8040,1,55,5,8043,8,56,50,8027,1,92,70,8045,1,685,3,8046,1,40,29,8047,2,41,1,8047,4,42,33,8047,1,43,7,
8050,1,44,6,8050,3,45,1075,8047,1,46,28,8053,1,47,34,8054,2,48,9,8054,6,49,19,8054,1,50,51,8057,2,51,9,8053,1,52,35,8059,2,53,1,
8059,7,54,8,8059,1,55,5,8062,8,56,50,8011,1,686,3,8064,1,40,83,8065,2,41,1,8065,4,42,33,8065,1,43,7,8068,1,44,6,8068,3,45,1076,
8065,1,46,28,8071,1,47,34,8072,2,48,9,8072,6,49,19,8072,1,50,51,8075,2,51,9,8071,1,52,35,8077,2,53,1,8077,7,54,8,8077,1,55,5,
8080,8,56,50,8064,1,92,70,8082,1,687,3,8083,1,40,29,8084,2,41,1,8084,4,42,33,8084,1,43,7,8087,1,44,6,8087,3,45,1077,8084,1,46,28,
8090,1,47,34,8091,2,48,9,8091,6,49,19,8091,1,50,51,8094,2,51,9,8090,1,52,35,8096,2,53,1,8096,7,54,8,8096,1,55,5,8099,8,56,50,
8011,1,688,3,8101,1,40,83,8102,2,41,1,8102,4,42,33,8102,1,43,7,8105,1,44,6,8105,3,45,1078,8102,1,46,28,8108,1,47,34,8109,2,48,9,
8109,6,49,19,8109,1,50,51,8112,2,51,9,8108,1,52,35,8114,2,53,1,8114,7,54,8,8114,1,55,5,8117,8,56,50,8101,1,92,70,8119,1,689,3,
8120,1,40,29,8121,2,41,1,8121,4,42,33,8121,1,43,7,8124,1,44,6,8124,3,45,1079,8121,1,46,28,8127,1,47,34,8128,2,48,9,8128,6,49,19,
8128,1,50,51,8131,2,51,9,8127,1,52,35,8133,2,53,1,8133,7,54,8,8133,1,55,5,8136,8,56,50,7871,1,690,32,8138,2,14,1,8138,4,15,2,
8138,1,16,48,8141,4,3,20,8141,1,17,41,8141,3,18,1080,8141,1,19,180,8145,12,13,21,8141,1,37,30,8147,2,38,1,8147,13,39,31,8138,1,691,55,
8150,1,70,52,8151,2,71,1,8150,3,72,1081,8138,1,692,3,8154,1,40,83,8155,2,41,1,8155,4,42,33,8155,1,43,7,8158,1,44,6,8158,3,45,1082,
8155,1,46,28,8161,1,47,34,8162,2,48,9,8162,6,49,19,8162,1,50,140,8165,2,51,9,8161,1,52,35,8167,2,53,1,8167,7,54,8,8167,1,55,5,
8170,8,56,50,8154,1,92,70,8172,1,693,3,8173,1,40,29,8174,2,41,1,8174,4,42,33,8174,1,43,7,8177,1,44,6,8177,3,45,1083,8174,1,46,28,
8180,1,47,34,8181,2,48,9,8181,6,49,19,8181,1,50,140,8184,2,51,9,8180,1,52,35,8186,2,53,1,8186,7,54,8,8186,1,55,5,8189,8,56,50,
8138,1,694,3,8191,1,40,83,8192,2,41,1,8192,4,42,33,8192,1,43,7,8195,1,44,6,8195,3,45,1084,8192,1,46,28,8198,1,47,34,8199,2,48,9,
8199,6,49,19,8199,1,50,140,8202,2,51,9,8198,1,52,35,8204,2,53,1,8204,7,54,8,8204,1,55,5,8207,8,56,50,8191,1,92,70,8209,1,695,3,
8210,1,40,29,8211,2,41,1,8211,4,42,33,8211,1,43,7,8214,1,44,6,8214,3,45,1085,8211,1,46,28,8217,1,47,34,8218,2,48,9,8218,6,49,19,
8218,1,50,140,8221,2,51,9,8217,1,52,35,8223,2,53,1,8223,7,54,8,8223,1,55,5,8226,8,56,50,8138,1,696,3,8228,1,40,83,8229,2,41,1,
8229,4,42,33,8229,1,43,7,8232,1,44,6,8232,3,45,1086,8229,1,46,28,8235,1,47,34,8236,2,48,9,8236,6,49,19,8236,1,50,140,8239,2,51,9,
8235,1,52,35,8241,2,53,1,8241,7,54,8,8241,1,55,5,8244,8,56,50,8228,1,92,70,8246,1,697,3,8247,1,40,29,8248,2,41,1,8248,4,42,33,
8248,1,43,7,8251,1,44,6,8251,3,45,1087,8248,1,46,28,8254,1,47,34,8255,2,48,9,8255,6,49,19,8255,1,50,140,8258,2,51,9,8254,1,52,35,
8260,2,53,1,8260,7,54,8,8260,1,55,5,8263,8,56,50,8138,1,698,3,8265,1,21,26,8266,2,1,1,8266,4,22,22,8266,1,23,7,8269,1,24,6,
8269,3,25,1088,8269,3,69,1089,8266,1,26,23,8273,2,27,1,8273,7,28,8,8273,1,29,24,8276,8,20,1090,8273,6,30,49,8278,5,31,27,8273,9,32,54,
8280,2,33,1,8280,11,34,25,8282,4,35,2,8280,14,36,4,7846,1,699,32,8285,2,14,1,8285,4,15,2,8285,15,73,4,8285,1,16,56,8289,4,3,20,
8289,1,17,58,8289,3,18,1091,8289,1,19,1092,8293,12,13,21,8289,1,37,30,8295,2,38,1,8295,13,39,31,8285,1,700,55,8298,1,70,52,8299,2,71,1,
8298,3,72,1093,8285,1,701,55,8302,1,70,52,8303,2,71,1,8302,3,72,1094,8285,1,702,3,8306,1,82,83,8307,2,1,1,8307,4,83,66,8307,1,84,7,
8310,1,85,6,8310,3,86,1095,8310,3,102,1096,8307,1,87,67,8314,2,88,1,8314,1,89,5,8316,6,90,1097,8316,1,91,68,8318,5,78,69,8306,1,92,70,
8320,1,703,3,8321,1,82,29,8322,2,1,1,8322,4,83,66,8322,1,84,7,8325,1,85,6,8325,3,86,1098,8325,3,102,1099,8322,1,87,67,8329,2,88,1,
8329,1,89,5,8331,6,90,85,8331,1,91,68,8333,5,78,69,7846,1,704,32,8335,2,14,1,8335,4,15,2,8335,15,73,4,8335,1,16,56,8339,4,3,20,
8339,1,17,58,8339,3,18,1100,8339,1,19,1101,8343,12,13,21,8339,1,37,30,8345,2,38,1,8345,13,39,31,8339,1,93,71,8348,2,74,1,8348,13,94,72,
8335,1,95,73,8351,1,96,74,8352,2,74,15,8352,7,97,75,8352,1,98,5,8355,1,99,6,8355,8,100,90,8355,5,101,76,8335,1,705,32,8359,2,14,1,
8359,4,15,2,8359,1,16,48,8362,4,3,20,8362,1,17,41,8362,3,18,1102,8362,1,19,360,8366,12,13,21,8362,1,37,30,8368,2,38,1,8368,13,39,31,
8362,1,93,71,8371,2,74,1,8371,13,94,72,8359,1,95,73,8374,1,96,74,8375,2,74,15,8375,7,97,75,8375,1,98,5,8378,1,99,6,8378,8,100,91,
8378,5,101,76,8359,1,153,32,8382,2,14,1,8382,4,15,2,8382,1,16,48,8385,4,3,20,8385,1,17,41,8385,3,18,141,8385,1,19,142,8389,12,13,21,
8385,1,37,30,8391,2,38,1,8391,13,39,31,8382,1,75,55,8394,1,70,52,8395,2,71,1,8394,3,72,61,8382,1,76,3,8398,1,21,26,8399,2,1,1,
8399,4,22,22,8399,1,23,7,8402,1,24,6,8402,3,25,62,8402,3,69,63,8399,1,26,23,8406,2,27,1,8406,7,28,8,8406,1,29,24,8409,3,20,64,
8406,6,30,53,8411,5,31,27,8406,9,32,59,8413,2,33,1,8413,11,34,25,8415,4,35,2,8413,14,36,4,8398,1,4,11,8398,1,5,12,8398,1,6,13,
8359,1,156,32,8421,2,14,1,8421,4,15,2,8421,1,16,48,8424,4,3,20,8424,1,17,41,8424,3,18,166,8424,1,19,167,8428,12,13,21,8424,1,37,30,
8430,2,38,1,8430,13,39,31,8421,1,75,55,8433,1,70,52,8434,2,71,1,8433,3,72,61,8421,1,76,3,8437,1,21,26,8438,2,1,1,8438,4,22,22,
8438,1,23,7,8441,1,24,6,8441,3,25,62,8441,3,69,63,8438,1,26,23,8445,2,27,1,8445,7,28,8,8445,1,29,24,8448,3,20,64,8445,6,30,53,
8450,5,31,27,8445,9,32,59,8452,2,33,1,8452,11,34,25,8454,4,35,2,8452,14,36,4,8437,1,4,11,8437,1,5,12,8437,1,6,13,8359,1,157,32,
8460,2,14,1,8460,4,15,2,8460,1,16,48,8463,4,3,20,8463,1,17,41,8463,3,18,168,8463,1,19,102,8467,12,13,21,8463,1,37,30,8469,2,38,1,
8469,13,39,31,8460,1,75,55,8472,1,70,52,8473,2,71,1,8472,3,72,61,8460,1,76,3,8476,1,21,26,8477,2,1,1,8477,4,22,22,8477,1,23,7,
8480,1,24,6,8480,3,25,62,8480,3,69,63,8477,1,26,23,8484,2,27,1,8484,7,28,8,8484,1,29,24,8487,3,20,64,8484,6,30,53,8489,5,31,27,
8484,9,32,59,8491,2,33,1,8491,11,34,25,8493,4,35,2,8491,14,36,4,8476,1,4,11,8476,1,5,12,8476,1,6,13,8359,1,161,32,8499,2,14,1,
8499,4,15,2,8499,1,16,48,8502,4,3,20,8502,1,17,41,8502,3,18,188,8502,1,19,133,8506,12,13,21,8502,1,37,30,8508,2,38,1,8508,13,39,31,
8499,1,75,55,8511,1,70,52,8512,2,71,1,8511,3,72,61,8499,1,76,3,8515,1,21,26,8516,2,1,1,8516,4,22,22,8516,1,23,7,8519,1,24,6,
8519,3,25,62,8519,3,69,63,8516,1,26,23,8523,2,27,1,8523,7,28,8,8523,1,29,24,8526,3,20,64,8523,6,30,53,8528,5,31,27,8523,9,32,59,
8530,2,33,1,8530,11,34,25,8532,4,35,2,8530,14,36,4,8515,1,4,11,8515,1,5,12,8515,1,6,13,8359,1,162,32,8538,2,14,1,8538,4,15,2,
8538,1,16,48,8541,4,3,20,8541,1,17,41,8541,3,18,189,8541,1,19,155,8545,12,13,21,8541,1,37,30,8547,2,38,1,8547,13,39,31,8538,1,75,55,
8550,1,70,52,8551,2,71,1,8550,3,72,61,8538,1,76,3,8554,1,21,26,8555,2,1,1,8555,4,22,22,8555,1,23,7,8558,1,24,6,8558,3,25,62,
8558,3,69,63,8555,1,26,23,8562,2,27,1,8562,7,28,8,8562,1,29,24,8565,3,20,64,8562,6,30,53,8567,5,31,27,8562,9,32,59,8569,2,33,1,
8569,11,34,25,8571,4,35,2,8569,14,36,4,8554,1,4,11,8554,1,5,12,8554,1,6,13,8335,1,706,32,8577,2,14,1,8577,4,15,2,8577,1,16,48,
8580,4,3,20,8580,1,17,41,8580,3,18,1103,8580,1,19,1104,8584,12,13,21,8580,1,37,30,8586,2,38,1,8586,13,39,31,8580,1,93,71,8589,2,74,1,
8589,13,94,72,8577,1,95,73,8592,1,96,74,8593,2,74,15,8593,7,97,75,8593,1,98,5,8596,1,99,6,8596,8,100,91,8596,5,101,76,8577,1,153,32,
8600,2,14,1,8600,4,15,2,8600,1,16,48,8603,4,3,20,8603,1,17,41,8603,3,18,141,8603,1,19,142,8607,12,13,21,8603,1,37,30,8609,2,38,1,
8609,13,39,31,8600,1,75,55,8612,1,70,52,8613,2,71,1,8612,3,72,61,8600,1,76,3,8616,1,21,26,8617,2,1,1,8617,4,22,22,8617,1,23,7,
8620,1,24,6,8620,3,25,62,8620,3,69,63,8617,1,26,23,8624,2,27,1,8624,7,28,8,8624,1,29,24,8627,3,20,64,8624,6,30,53,8629,5,31,27,
8624,9,32,59,8631,2,33,1,8631,11,34,25,8633,4,35,2,8631,14,36,4,8616,1,4,11,8616,1,5,12,8616,1,6,13,8335,1,707,32,8639,2,14,1,
8639,4,15,2,8639,1,16,48,8642,4,3,20,8642,1,17,41,8642,3,18,1105,8642,1,19,102,8646,12,13,21,8642,1,37,30,8648,2,38,1,8648,13,39,31,
8642,1,93,71,8651,2,74,1,8651,13,94,72,8639,1,95,73,8654,1,96,74,8655,2,74,15,8655,7,97,75,8655,1,98,5,8658,1,99,6,8658,8,100,91,
8658,5,101,76,8639,1,153,32,8662,2,14,1,8662,4,15,2,8662,1,16,48,8665,4,3,20,8665,1,17,41,8665,3,18,141,8665,1,19,142,8669,12,13,21,
8665,1,37,30,8671,2,38,1,8671,13,39,31,8662,1,75,55,8674,1,70,52,8675,2,71,1,8674,3,72,61,8662,1,76,3,8678,1,21,26,8679,2,1,1,
8679,4,22,22,8679,1,23,7,8682,1,24,6,8682,3,25,62,8682,3,69,63,8679,1,26,23,8686,2,27,1,8686,7,28,8,8686,1,29,24,8689,3,20,64,
8686,6,30,53,8691,5,31,27,8686,9,32,59,8693,2,33,1,8693,11,34,25,8695,4,35,2,8693,14,36,4,8678,1,4,11,8678,1,5,12,8678,1,6,13,
8639,1,156,32,8701,2,14,1,8701,4,15,2,8701,1,16,48,8704,4,3,20,8704,1,17,41,8704,3,18,166,8704,1,19,167,8708,12,13,21,8704,1,37,30,
8710,2,38,1,8710,13,39,31,8701,1,75,55,8713,1,70,52,8714,2,71,1,8713,3,72,61,8701,1,76,3,8717,1,21,26,8718,2,1,1,8718,4,22,22,
8718,1,23,7,8721,1,24,6,8721,3,25,62,8721,3,69,63,8718,1,26,23,8725,2,27,1,8725,7,28,8,8725,1,29,24,8728,3,20,64,8725,6,30,53,
8730,5,31,27,8725,9,32,59,8732,2,33,1,8732,11,34,25,8734,4,35,2,8732,14,36,4,8717,1,4,11,8717,1,5,12,8717,1,6,13,8639,1,157,32,
8740,2,14,1,8740,4,15,2,8740,1,16,48,8743,4,3,20,8743,1,17,41,8743,3,18,168,8743,1,19,102,8747,12,13,21,8743,1,37,30,8749,2,38,1,
8749,13,39,31,8740,1,75,55,8752,1,70,52,8753,2,71,1,8752,3,72,61,8740,1,76,3,8756,1,21,26,8757,2,1,1,8757,4,22,22,8757,1,23,7,
8760,1,24,6,8760,3,25,62,8760,3,69,63,8757,1,26,23,8764,2,27,1,8764,7,28,8,8764,1,29,24,8767,3,20,64,8764,6,30,53,8769,5,31,27,
8764,9,32,59,8771,2,33,1,8771,11,34,25,8773,4,35,2,8771,14,36,4,8756,1,4,11,8756,1,5,12,8756,1,6,13,8335,1,708,32,8779,2,14,1,
8779,4,15,2,8779,1,16,48,8782,4,3,20,8782,1,17,41,8782,3,18,1106,8782,1,19,1107,8786,12,13,21,8782,1,37,30,8788,2,38,1,8788,13,39,31,
8782,1,93,71,8791,2,74,1,8791,13,94,72,8779,1,95,73,8794,1,96,74,8795,2,74,15,8795,7,97,75,8795,1,98,5,8798,1,99,6,8798,8,100,91,
8798,5,101,76,8779,1,153,32,8802,2,14,1,8802,4,15,2,8802,1,16,48,8805,4,3,20,8805,1,17,41,8805,3,18,141,8805,1,19,142,8809,12,13,21,
8805,1,37,30,8811,2,38,1,8811,13,39,31,8802,1,75,55,8814,1,70,52,8815,2,71,1,8814,3,72,61,8802,1,76,3,8818,1,21,26,8819,2,1,1,
8819,4,22,22,8819,1,23,7,8822,1,24,6,8822,3,25,62,8822,3,69,63,8819,1,26,23,8826,2,27,1,8826,7,28,8,8826,1,29,24,8829,3,20,64,
8826,6,30,53,8831,5,31,27,8826,9,32,59,8833,2,33,1,8833,11,34,25,8835,4,35,2,8833,14,36,4,8818,1,4,11,8818,1,5,12,8818,1,6,13,
8779,1,156,32,8841,2,14,1,8841,4,15,2,8841,1,16,48,8844,4,3,20,8844,1,17,41,8844,3,18,166,8844,1,19,167,8848,12,13,21,8844,1,37,30,
8850,2,38,1,8850,13,39,31,8841,1,75,55,8853,1,70,52,8854,2,71,1,8853,3,72,61,8841,1,76,3,8857,1,21,26,8858,2,1,1,8858,4,22,22,
8858,1,23,7,8861,1,24,6,8861,3,25,62,8861,3,69,63,8858,1,26,23,8865,2,27,1,8865,7,28,8,8865,1,29,24,8868,3,20,64,8865,6,30,53,
8870,5,31,27,8865,9,32,59,8872,2,33,1,8872,11,34,25,8874,4,35,2,8872,14,36,4,8857,1,4,11,8857,1,5,12,8857,1,6,13,8779,1,157,32,
8880,2,14,1,8880,4,15,2,8880,1,16,48,8883,4,3,20,8883,1,17,41,8883,3,18,168,8883,1,19,102,8887,12,13,21,8883,1,37,30,8889,2,38,1,
8889,13,39,31,8880,1,75,55,8892,1,70,52,8893,2,71,1,8892,3,72,61,8880,1,76,3,8896,1,21,26,8897,2,1,1,8897,4,22,22,8897,1,23,7,
8900,1,24,6,8900,3,25,62,8900,3,69,63,8897,1,26,23,8904,2,27,1,8904,7,28,8,8904,1,29,24,8907,3,20,64,8904,6,30,53,8909,5,31,27,
8904,9,32,59,8911,2,33,1,8911,11,34,25,8913,4,35,2,8911,14,36,4,8896,1,4,11,8896,1,5,12,8896,1,6,13,8779,1,161,32,8919,2,14,1,
8919,4,15,2,8919,1,16,48,8922,4,3,20,8922,1,17,41,8922,3,18,188,8922,1,19,133,8926,12,13,21,8922,1,37,30,8928,2,38,1,8928,13,39,31,
8919,1,75,55,8931,1,70,52,8932,2,71,1,8931,3,72,61,8919,1,76,3,8935,1,21,26,8936,2,1,1,8936,4,22,22,8936,1,23,7,8939,1,24,6,
8939,3,25,62,8939,3,69,63,8936,1,26,23,8943,2,27,1,8943,7,28,8,8943,1,29,24,8946,3,20,64,8943,6,30,53,8948,5,31,27,8943,9,32,59,
8950,2,33,1,8950,11,34,25,8952,4,35,2,8950,14,36,4,8935,1,4,11,8935,1,5,12,8935,1,6,13,8779,1,162,32,8958,2,14,1,8958,4,15,2,
8958,1,16,48,8961,4,3,20,8961,1,17,41,8961,3,18,189,8961,1,19,155,8965,12,13,21,8961,1,37,30,8967,2,38,1,8967,13,39,31,8958,1,75,55,
8970,1,70,52,8971,2,71,1,8970,3,72,61,8958,1,76,3,8974,1,21,26,8975,2,1,1,8975,4,22,22,8975,1,23,7,8978,1,24,6,8978,3,25,62,
8978,3,69,63,8975,1,26,23,8982,2,27,1,8982,7,28,8,8982,1,29,24,8985,3,20,64,8982,6,30,53,8987,5,31,27,8982,9,32,59,8989,2,33,1,
8989,11,34,25,8991,4,35,2,8989,14,36,4,8974,1,4,11,8974,1,5,12,8974,1,6,13,8335,1,709,32,8997,2,14,1,8997,4,15,2,8997,1,16,48,
9000,4,3,20,9000,1,17,41,9000,3,18,1108,9000,1,19,180,9004,12,13,21,9000,1,37,30,9006,2,38,1,9006,13,39,31,9000,1,93,71,9009,2,74,1,
9009,13,94,72,8997,1,95,73,9012,1,96,74,9013,2,74,15,9013,7,97,75,9013,1,98,5,9016,1,99,6,9016,8,100,91,9016,5,101,76,8997,1,153,32,
9020,2,14,1,9020,4,15,2,9020,1,16,48,9023,4,3,20,9023,1,17,41,9023,3,18,141,9023,1,19,142,9027,12,13,21,9023,1,37,30,9029,2,38,1,
9029,13,39,31,9020,1,75,55,9032,1,70,52,9033,2,71,1,9032,3,72,61,9020,1,76,3,9036,1,21,26,9037,2,1,1,9037,4,22,22,9037,1,23,7,
9040,1,24,6,9040,3,25,62,9040,3,69,63,9037,1,26,23,9044,2,27,1,9044,7,28,8,9044,1,29,24,9047,3,20,64,9044,6,30,53,9049,5,31,27,
9044,9,32,59,9051,2,33,1,9051,11,34,25,9053,4,35,2,9051,14,36,4,9036,1,4,11,9036,1,5,12,9036,1,6,13,8997,1,156,32,9059,2,14,1,
9059,4,15,2,9059,1,16,48,9062,4,3,20,9062,1,17,41,9062,3,18,166,9062,1,19,167,9066,12,13,21,9062,1,37,30,9068,2,38,1,9068,13,39,31,
9059,1,75,55,9071,1,70,52,9072,2,71,1,9071,3,72,61,9059,1,76,3,9075,1,21,26,9076,2,1,1,9076,4,22,22,9076,1,23,7,9079,1,24,6,
9079,3,25,62,9079,3,69,63,9076,1,26,23,9083,2,27,1,9083,7,28,8,9083,1,29,24,9086,3,20,64,9083,6,30,53,9088,5,31,27,9083,9,32,59,
9090,2,33,1,9090,11,34,25,9092,4,35,2,9090,14,36,4,9075,1,4,11,9075,1,5,12,9075,1,6,13,8997,1,157,32,9098,2,14,1,9098,4,15,2,
9098,1,16,48,9101,4,3,20,9101,1,17,41,9101,3,18,168,9101,1,19,102,9105,12,13,21,9101,1,37,30,9107,2,38,1,9107,13,39,31,9098,1,75,55,
9110,1,70,52,9111,2,71,1,9110,3,72,61,9098,1,76,3,9114,1,21,26,9115,2,1,1,9115,4,22,22,9115,1,23,7,9118,1,24,6,9118,3,25,62,
9118,3,69,63,9115,1,26,23,9122,2,27,1,9122,7,28,8,9122,1,29,24,9125,3,20,64,9122,6,30,53,9127,5,31,27,9122,9,32,59,9129,2,33,1,
9129,11,34,25,9131,4,35,2,9129,14,36,4,9114,1,4,11,9114,1,5,12,9114,1,6,13,8997,1,161,32,9137,2,14,1,9137,4,15,2,9137,1,16,48,
9140,4,3,20,9140,1,17,41,9140,3,18,188,9140,1,19,133,9144,12,13,21,9140,1,37,30,9146,2,38,1,9146,13,39,31,9137,1,75,55,9149,1,70,52,
9150,2,71,1,9149,3,72,61,9137,1,76,3,9153,1,21,26,9154,2,1,1,9154,4,22,22,9154,1,23,7,9157,1,24,6,9157,3,25,62,9157,3,69,63,
9154,1,26,23,9161,2,27,1,9161,7,28,8,9161,1,29,24,9164,3,20,64,9161,6,30,53,9166,5,31,27,9161,9,32,59,9168,2,33,1,9168,11,34,25,
9170,4,35,2,9168,14,36,4,9153,1,4,11,9153,1,5,12,9153,1,6,13,8997,1,162,32,9176,2,14,1,9176,4,15,2,9176,1,16,48,9179,4,3,20,
9179,1,17,41,9179,3,18,189,9179,1,19,155,9183,12,13,21,9179,1,37,30,9185,2,38,1,9185,13,39,31,9176,1,75,55,9188,1,70,52,9189,2,71,1,
9188,3,72,61,9176,1,76,3,9192,1,21,26,9193,2,1,1,9193,4,22,22,9193,1,23,7,9196,1,24,6,9196,3,25,62,9196,3,69,63,9193,1,26,23,
9200,2,27,1,9200,7,28,8,9200,1,29,24,9203,3,20,64,9200,6,30,53,9205,5,31,27,9200,9,32,59,9207,2,33,1,9207,11,34,25,9209,4,35,2,
9207,14,36,4,9192,1,4,11,9192,1,5,12,9192,1,6,13,8335,1,710,32,9215,2,14,1,9215,4,15,2,9215,1,16,48,9218,4,3,20,9218,1,17,41,
9218,3,18,1109,9218,1,19,1110,9222,12,13,21,9218,1,37,30,9224,2,38,1,9224,13,39,31,9218,1,93,71,9227,2,74,1,9227,13,94,72,9215,1,95,73,
9230,1,96,74,9231,2,74,15,9231,7,97,75,9231,1,98,5,9234,1,99,6,9234,8,100,91,9234,5,101,76,9215,1,711,32,9238,2,14,1,9238,4,15,2,
9238,1,16,48,9241,4,3,20,9241,1,17,41,9241,3,18,1111,9241,1,19,313,9245,12,13,21,9241,1,37,30,9247,2,38,1,9247,13,39,31,9238,1,75,55,
9250,1,70,52,9251,2,71,1,9250,3,72,61,9238,1,76,3,9254,1,21,26,9255,2,1,1,9255,4,22,22,9255,1,23,7,9258,1,24,6,9258,3,25,62,
9258,3,69,63,9255,1,26,23,9262,2,27,1,9262,7,28,8,9262,1,29,24,9265,3,20,64,9262,6,30,53,9267,5,31,27,9262,9,32,59,9269,2,33,1,
9269,11,34,25,9271,4,35,2,9269,14,36,4,9254,1,4,11,9254,1,5,12,9254,1,6,13,9215,1,712,32,9277,2,14,1,9277,4,15,2,9277,1,16,48,
9280,4,3,20,9280,1,17,41,9280,3,18,1112,9280,1,19,313,9284,12,13,21,9280,1,37,30,9286,2,38,1,9286,13,39,31,9277,1,75,55,9289,1,70,52,
9290,2,71,1,9289,3,72,61,9277,1,76,3,9293,1,21,26,9294,2,1,1,9294,4,22,22,9294,1,23,7,9297,1,24,6,9297,3,25,62,9297,3,69,63,
9294,1,26,23,9301,2,27,1,9301,7,28,8,9301,1,29,24,9304,3,20,64,9301,6,30,53,9306,5,31,27,9301,9,32,59,9308,2,33,1,9308,11,34,25,
9310,4,35,2,9308,14,36,4,9293,1,4,11,9293,1,5,12,9293,1,6,13,9215,1,713,32,9316,2,14,1,9316,4,15,2,9316,1,16,48,9319,4,3,20,
9319,1,17,41,9319,3,18,1113,9319,1,19,313,9323,12,13,21,9319,1,37,30,9325,2,38,1,9325,13,39,31,9316,1,75,55,9328,1,70,52,9329,2,71,1,
9328,3,72,61,9316,1,76,3,9332,1,21,26,9333,2,1,1,9333,4,22,22,9333,1,23,7,9336,1,24,6,9336,3,25,62,9336,3,69,63,9333,1,26,23,
9340,2,27,1,9340,7,28,8,9340,1,29,24,9343,3,20,64,9340,6,30,53,9345,5,31,27,9340,9,32,59,9347,2,33,1,9347,11,34,25,9349,4,35,2,
9347,14,36,4,9332,1,4,11,9332,1,5,12,9332,1,6,13,8335,1,714,32,9355,2,14,1,9355,4,15,2,9355,1,16,48,9358,4,3,20,9358,1,17,41,
9358,3,18,1114,9358,1,19,1115,9362,12,13,21,9358,1,37,30,9364,2,38,1,9364,13,39,31,9358,1,93,71,9367,2,74,1,9367,13,94,72,9355,1,95,73,
9370,1,96,74,9371,2,74,15,9371,7,97,75,9371,1,98,5,9374,1,99,6,9374,8,100,91,9374,5,101,76,9355,1,153,32,9378,2,14,1,9378,4,15,2,
9378,1,16,48,9381,4,3,20,9381,1,17,41,9381,3,18,141,9381,1,19,142,9385,12,13,21,9381,1,37,30,9387,2,38,1,9387,13,39,31,9378,1,75,55,
9390,1,70,52,9391,2,71,1,9390,3,72,61,9378,1,76,3,9394,1,21,26,9395,2,1,1,9395,4,22,22,9395,1,23,7,9398,1,24,6,9398,3,25,62,
9398,3,69,63,9395,1,26,23,9402,2,27,1,9402,7,28,8,9402,1,29,24,9405,3,20,64,9402,6,30,53,9407,5,31,27,9402,9,32,59,9409,2,33,1,
9409,11,34,25,9411,4,35,2,9409,14,36,4,9394,1,4,11,9394,1,5,12,9394,1,6,13,9355,1,156,32,9417,2,14,1,9417,4,15,2,9417,1,16,48,
9420,4,3,20,9420,1,17,41,9420,3,18,166,9420,1,19,167,9424,12,13,21,9420,1,37,30,9426,2,38,1,9426,13,39,31,9417,1,75,55,9429,1,70,52,
9430,2,71,1,9429,3,72,61,9417,1,76,3,9433,1,21,26,9434,2,1,1,9434,4,22,22,9434,1,23,7,9437,1,24,6,9437,3,25,62,9437,3,69,63,
9434,1,26,23,9441,2,27,1,9441,7,28,8,9441,1,29,24,9444,3,20,64,9441,6,30,53,9446,5,31,27,9441,9,32,59,9448,2,33,1,9448,11,34,25,
9450,4,35,2,9448,14,36,4,9433,1,4,11,9433,1,5,12,9433,1,6,13,9355,1,157,32,9456,2,14,1,9456,4,15,2,9456,1,16,48,9459,4,3,20,
9459,1,17,41,9459,3,18,168,9459,1,19,102,9463,12,13,21,9459,1,37,30,9465,2,38,1,9465,13,39,31,9456,1,75,55,9468,1,70,52,9469,2,71,1,
9468,3,72,61,9456,1,76,3,9472,1,21,26,9473,2,1,1,9473,4,22,22,9473,1,23,7,9476,1,24,6,9476,3,25,62,9476,3,69,63,9473,1,26,23,
9480,2,27,1,9480,7,28,8,9480,1,29,24,9483,3,20,64,9480,6,30,53,9485,5,31,27,9480,9,32,59,9487,2,33,1,9487,11,34,25,9489,4,35,2,
9487,14,36,4,9472,1,4,11,9472,1,5,12,9472,1,6,13,9355,1,161,32,9495,2,14,1,9495,4,15,2,9495,1,16,48,9498,4,3,20,9498,1,17,41,
9498,3,18,188,9498,1,19,133,9502,12,13,21,9498,1,37,30,9504,2,38,1,9504,13,39,31,9495,1,75,55,9507,1,70,52,9508,2,71,1,9507,3,72,61,
9495,1,76,3,9511,1,21,26,9512,2,1,1,9512,4,22,22,9512,1,23,7,9515,1,24,6,9515,3,25,62,9515,3,69,63,9512,1,26,23,9519,2,27,1,
9519,7,28,8,9519,1,29,24,9522,3,20,64,9519,6,30,53,9524,5,31,27,9519,9,32,59,9526,2,33,1,9526,11,34,25,9528,4,35,2,9526,14,36,4,
9511,1,4,11,9511,1,5,12,9511,1,6,13,9355,1,162,32,9534,2,14,1,9534,4,15,2,9534,1,16,48,9537,4,3,20,9537,1,17,41,9537,3,18,189,
9537,1,19,155,9541,12,13,21,9537,1,37,30,9543,2,38,1,9543,13,39,31,9534,1,75,55,9546,1,70,52,9547,2,71,1,9546,3,72,61,9534,1,76,3,
9550,1,21,26,9551,2,1,1,9551,4,22,22,9551,1,23,7,9554,1,24,6,9554,3,25,62,9554,3,69,63,9551,1,26,23,9558,2,27,1,9558,7,28,8,
9558,1,29,24,9561,3,20,64,9558,6,30,53,9563,5,31,27,9558,9,32,59,9565,2,33,1,9565,11,34,25,9567,4,35,2,9565,14,36,4,9550,1,4,11,
9550,1,5,12,9550,1,6,13,8335,1,715,32,9573,2,14,1,9573,4,15,2,9573,1,16,48,9576,4,3,20,9576,1,17,41,9576,3,18,1116,9576,1,19,1117,
9580,12,13,21,9576,1,37,30,9582,2,38,1,9582,13,39,31,9576,1,93,71,9585,2,74,1,9585,13,94,72,9573,1,95,73,9588,1,96,74,9589,2,74,15,
9589,7,97,75,9589,1,98,5,9592,1,99,6,9592,8,100,91,9592,5,101,76,9573,1,716,32,9596,2,14,1,9596,4,15,2,9596,1,16,48,9599,4,3,20,
9599,1,17,41,9599,3,18,1118,9599,1,19,199,9603,12,13,21,9599,1,37,30,9605,2,38,1,9605,13,39,31,9596,1,75,55,9608,1,70,52,9609,2,71,1,
9608,3,72,61,9596,1,76,3,9612,1,21,26,9613,2,1,1,9613,4,22,22,9613,1,23,7,9616,1,24,6,9616,3,25,62,9616,3,69,63,9613,1,26,23,
9620,2,27,1,9620,7,28,8,9620,1,29,24,9623,3,20,64,9620,6,30,53,9625,5,31,27,9620,9,32,59,9627,2,33,1,9627,11,34,25,9629,4,35,2,
9627,14,36,4,9612,1,4,11,9612,1,5,12,9612,1,6,13,9573,1,717,32,9635,2,14,1,9635,4,15,2,9635,1,16,48,9638,4,3,20,9638,1,17,41,
9638,3,18,1119,9638,1,19,340,9642,12,13,21,9638,1,37,30,9644,2,38,1,9644,13,39,31,9635,1,75,55,9647,1,70,52,9648,2,71,1,9647,3,72,61,
9635,1,76,3,9651,1,21,26,9652,2,1,1,9652,4,22,22,9652,1,23,7,9655,1,24,6,9655,3,25,62,9655,3,69,63,9652,1,26,23,9659,2,27,1,
9659,7,28,8,9659,1,29,24,9662,3,20,64,9659,6,30,53,9664,5,31,27,9659,9,32,59,9666,2,33,1,9666,11,34,25,9668,4,35,2,9666,14,36,4,
9651,1,4,11,9651,1,5,12,9651,1,6,13,9573,1,718,32,9674,2,14,1,9674,4,15,2,9674,1,16,48,9677,4,3,20,9677,1,17,41,9677,3,18,1120,
9677,1,19,218,9681,12,13,21,9677,1,37,30,9683,2,38,1,9683,13,39,31,9674,1,75,55,9686,1,70,52,9687,2,71,1,9686,3,72,61,9674,1,76,3,
9690,1,21,26,9691,2,1,1,9691,4,22,22,9691,1,23,7,9694,1,24,6,9694,3,25,62,9694,3,69,63,9691,1,26,23,9698,2,27,1,9698,7,28,8,
9698,1,29,24,9701,3,20,64,9698,6,30,53,9703,5,31,27,9698,9,32,59,9705,2,33,1,9705,11,34,25,9707,4,35,2,9705,14,36,4,9690,1,4,11,
9690,1,5,12,9690,1,6,13,9573,1,719,32,9713,2,14,1,9713,4,15,2,9713,1,16,48,9716,4,3,20,9716,1,17,41,9716,3,18,1121,9716,1,19,211,
9720,12,13,21,9716,1,37,30,9722,2,38,1,9722,13,39,31,9713,1,75,55,9725,1,70,52,9726,2,71,1,9725,3,72,61,9713,1,76,3,9729,1,21,26,
9730,2,1,1,9730,4,22,22,9730,1,23,7,9733,1,24,6,9733,3,25,62,9733,3,69,63,9730,1,26,23,9737,2,27,1,9737,7,28,8,9737,1,29,24,
9740,3,20,64,9737,6,30,53,9742,5,31,27,9737,9,32,59,9744,2,33,1,9744,11,34,25,9746,4,35,2,9744,14,36,4,9729,1,4,11,9729,1,5,12,
9729,1,6,13,9573,1,720,32,9752,2,14,1,9752,4,15,2,9752,1,16,48,9755,4,3,20,9755,1,17,41,9755,3,18,1122,9755,1,19,1123,9759,12,13,21,
9755,1,37,30,9761,2,38,1,9761,13,39,31,9752,1,75,55,9764,1,70,52,9765,2,71,1,9764,3,72,61,9752,1,76,3,9768,1,21,26,9769,2,1,1,
9769,4,22,22,9769,1,23,7,9772,1,24,6,9772,3,25,62,9772,3,69,63,9769,1,26,23,9776,2,27,1,9776,7,28,8,9776,1,29,24,9779,3,20,64,
9776,6,30,53,9781,5,31,27,9776,9,32,59,9783,2,33,1,9783,11,34,25,9785,4,35,2,9783,14,36,4,9768,1,4,11,9768,1,5,12,9768,1,6,13,
9573,1,721,32,9791,2,14,1,9791,4,15,2,9791,1,16,48,9794,4,3,20,9794,1,17,41,9794,3,18,1124,9794,1,19,200,9798,12,13,21,9794,1,37,30,
9800,2,38,1,9800,13,39,31,9791,1,75,55,9803,1,70,52,9804,2,71,1,9803,3,72,61,9791,1,76,3,9807,1,21,26,9808,2,1,1,9808,4,22,22,
9808,1,23,7,9811,1,24,6,9811,3,25,62,9811,3,69,63,9808,1,26,23,9815,2,27,1,9815,7,28,8,9815,1,29,24,9818,3,20,64,9815,6,30,53,
9820,5,31,27,9815,9,32,59,9822,2,33,1,9822,11,34,25,9824,4,35,2,9822,14,36,4,9807,1,4,11,9807,1,5,12,9807,1,6,13,9573,1,722,32,
9830,2,14,1,9830,4,15,2,9830,1,16,48,9833,4,3,20,9833,1,17,41,9833,3,18,1125,9833,1,19,364,9837,12,13,21,9833,1,37,30,9839,2,38,1,
9839,13,39,31,9830,1,75,55,9842,1,70,52,9843,2,71,1,9842,3,72,61,9830,1,76,3,9846,1,21,26,9847,2,1,1,9847,4,22,22,9847,1,23,7,
9850,1,24,6,9850,3,25,62,9850,3,69,63,9847,1,26,23,9854,2,27,1,9854,7,28,8,9854,1,29,24,9857,3,20,64,9854,6,30,53,9859,5,31,27,
9854,9,32,59,9861,2,33,1,9861,11,34,25,9863,4,35,2,9861,14,36,4,9846,1,4,11,9846,1,5,12,9846,1,6,13,9573,1,723,32,9869,2,14,1,
9869,4,15,2,9869,1,16,48,9872,4,3,20,9872,1,17,41,9872,3,18,1126,9872,1,19,1127,9876,12,13,21,9872,1,37,30,9878,2,38,1,9878,13,39,31,
9869,1,75,55,9881,1,70,52,9882,2,71,1,9881,3,72,61,9869,1,76,3,9885,1,21,26,9886,2,1,1,9886,4,22,22,9886,1,23,7,9889,1,24,6,
9889,3,25,62,9889,3,69,63,9886,1,26,23,9893,2,27,1,9893,7,28,8,9893,1,29,24,9896,3,20,64,9893,6,30,53,9898,5,31,27,9893,9,32,59,
9900,2,33,1,9900,11,34,25,9902,4,35,2,9900,14,36,4,9885,1,4,11,9885,1,5,12,9885,1,6,13,9573,1,724,32,9908,2,14,1,9908,4,15,2,
9908,1,16,48,9911,4,3,20,9911,1,17,41,9911,3,18,1128,9911,1,19,344,9915,12,13,21,9911,1,37,30,9917,2,38,1,9917,13,39,31,9908,1,75,55,
9920,1,70,52,9921,2,71,1,9920,3,72,61,9908,1,76,3,9924,1,21,26,9925,2,1,1,9925,4,22,22,9925,1,23,7,9928,1,24,6,9928,3,25,62,
9928,3,69,63,9925,1,26,23,9932,2,27,1,9932,7,28,8,9932,1,29,24,9935,3,20,64,9932,6,30,53,9937,5,31,27,9932,9,32,59,9939,2,33,1,
9939,11,34,25,9941,4,35,2,9939,14,36,4,9924,1,4,11,9924,1,5,12,9924,1,6,13,9573,1,725,32,9947,2,14,1,9947,4,15,2,9947,1,16,48,
9950,4,3,20,9950,1,17,41,9950,3,18,1129,9950,1,19,364,9954,12,13,21,9950,1,37,30,9956,2,38,1,9956,13,39,31,9947,1,75,55,9959,1,70,52,
9960,2,71,1,9959,3,72,61,9947,1,76,3,9963,1,21,26,9964,2,1,1,9964,4,22,22,9964,1,23,7,9967,1,24,6,9967,3,25,62,9967,3,69,63,
9964,1,26,23,9971,2,27,1,9971,7,28,8,9971,1,29,24,9974,3,20,64,9971,6,30,53,9976,5,31,27,9971,9,32,59,9978,2,33,1,9978,11,34,25,
9980,4,35,2,9978,14,36,4,9963,1,4,11,9963,1,5,12,9963,1,6,13,9573,1,726,32,9986,2,14,1,9986,4,15,2,9986,1,16,48,9989,4,3,20,
9989,1,17,41,9989,3,18,1130,9989,1,19,1131,9993,12,13,21,9989,1,37,30,9995,2,38,1,9995,13,39,31,9986,1,75,55,9998,1,70,52,9999,2,71,1,
9998,3,72,61,9986,1,76,3,10002,1,21,26,10003,2,1,1,10003,4,22,22,10003,1,23,7,10006,1,24,6,10006,3,25,62,10006,3,69,63,10003,1,26,23,
10010,2,27,1,10010,7,28,8,10010,1,29,24,10013,3,20,64,10010,6,30,53,10015,5,31,27,10010,9,32,59,10017,2,33,1,10017,11,34,25,10019,4,35,2,
10017,14,36,4,10002,1,4,11,10002,1,5,12,10002,1,6,13,9573,1,727,32,10025,2,14,1,10025,4,15,2,10025,1,16,48,10028,4,3,20,10028,1,17,41,
10028,3,18,1132,10028,1,19,365,10032,12,13,21,10028,1,37,30,10034,2,38,1,10034,13,39,31,10025,1,75,55,10037,1,70,52,10038,2,71,1,10037,3,72,61,
10025,1,76,3,10041,1,21,26,10042,2,1,1,10042,4,22,22,10042,1,23,7,10045,1,24,6,10045,3,25,62,10045,3,69,63,10042,1,26,23,10049,2,27,1,
10049,7,28,8,10049,1,29,24,10052,3,20,64,10049,6,30,53,10054,5,31,27,10049,9,32,59,10056,2,33,1,10056,11,34,25,10058,4,35,2,10056,14,36,4,
10041,1,4,11,10041,1,5,12,10041,1,6,13,8335,1,728,32,10064,2,14,1,10064,4,15,2,10064,1,16,48,10067,4,3,20,10067,1,17,41,10067,3,18,1133,
10067,1,19,1134,10071,12,13,21,10067,1,37,30,10073,2,38,1,10073,13,39,31,10067,1,93,71,10076,2,74,1,10076,13,94,72,10064,1,95,73,10079,1,96,74,
10080,2,74,15,10080,7,97,75,10080,1,98,5,10083,1,99,6,10083,8,100,91,10083,5,101,76,10064,1,729,32,10087,2,14,1,10087,4,15,2,10087,1,16,48,
10090,4,3,20,10090,1,17,41,10090,3,18,1135,10090,1,19,314,10094,12,13,21,10090,1,37,30,10096,2,38,1,10096,13,39,31,10087,1,75,55,10099,1,70,52,
10100,2,71,1,10099,3,72,61,10087,1,76,3,10103,1,21,26,10104,2,1,1,10104,4,22,22,10104,1,23,7,10107,1,24,6,10107,3,25,62,10107,3,69,63,
10104,1,26,23,10111,2,27,1,10111,7,28,8,10111,1,29,24,10114,3,20,64,10111,6,30,53,10116,5,31,27,10111,9,32,59,10118,2,33,1,10118,11,34,25,
10120,4,35,2,10118,14,36,4,10103,1,4,11,10103,1,5,12,10103,1,6,13,10064,1,730,32,10126,2,14,1,10126,4,15,2,10126,1,16,48,10129,4,3,20,
10129,1,17,41,10129,3,18,1136,10129,1,19,314,10133,12,13,21,10129,1,37,30,10135,2,38,1,10135,13,39,31,10126,1,75,55,10138,1,70,52,10139,2,71,1,
10138,3,72,61,10126,1,76,3,10142,1,21,26,10143,2,1,1,10143,4,22,22,10143,1,23,7,10146,1,24,6,10146,3,25,62,10146,3,69,63,10143,1,26,23,
10150,2,27,1,10150,7,28,8,10150,1,29,24,10153,3,20,64,10150,6,30,53,10155,5,31,27,10150,9,32,59,10157,2,33,1,10157,11,34,25,10159,4,35,2,
10157,14,36,4,10142,1,4,11,10142,1,5,12,10142,1,6,13,10064,1,731,32,10165,2,14,1,10165,4,15,2,10165,1,16,48,10168,4,3,20,10168,1,17,41,
10168,3,18,1137,10168,1,19,314,10172,12,13,21,10168,1,37,30,10174,2,38,1,10174,13,39,31,10165,1,75,55,10177,1,70,52,10178,2,71,1,10177,3,72,61,
10165,1,76,3,10181,1,21,26,10182,2,1,1,10182,4,22,22,10182,1,23,7,10185,1,24,6,10185,3,25,62,10185,3,69,63,10182,1,26,23,10189,2,27,1,
10189,7,28,8,10189,1,29,24,10192,3,20,64,10189,6,30,53,10194,5,31,27,10189,9,32,59,10196,2,33,1,10196,11,34,25,10198,4,35,2,10196,14,36,4,
10181,1,4,11,10181,1,5,12,10181,1,6,13,10064,1,732,32,10204,2,14,1,10204,4,15,2,10204,1,16,48,10207,4,3,20,10207,1,17,41,10207,3,18,1138,
10207,1,19,350,10211,12,13,21,10207,1,37,30,10213,2,38,1,10213,13,39,31,10204,1,75,55,10216,1,70,52,10217,2,71,1,10216,3,72,61,10204,1,76,3,
10220,1,21,26,10221,2,1,1,10221,4,22,22,10221,1,23,7,10224,1,24,6,10224,3,25,62,10224,3,69,63,10221,1,26,23,10228,2,27,1,10228,7,28,8,
10228,1,29,24,10231,3,20,64,10228,6,30,53,10233,5,31,27,10228,9,32,59,10235,2,33,1,10235,11,34,25,10237,4,35,2,10235,14,36,4,10220,1,4,11,
10220,1,5,12,10220,1,6,13,7846,1,103,88,7846,1,733,1139,10244,2,14,1,10244,4,15,2,10244,15,73,4,10244,1,16,56,10248,4,3,20,10248,1,17,58,
10248,3,18,1140,10248,1,19,1141,10252,12,13,21,10244,1,734,3,10254,4,57,2,10254,1,58,36,10256,1,59,37,10257,2,60,1,10256,1,61,39,10259,2,1,1,
10259,9,62,40,10261,2,1,1,10261,5,63,38,10259,6,64,10,10256,3,66,1142,10256,3,65,1143,7846,1,735,32,10267,2,14,1,10267,4,15,2,10267,15,73,4,
10267,1,16,56,10271,4,3,20,10271,1,17,58,10271,3,18,1144,10271,1,19,1145,10275,12,13,21,10271,1,37,30,10277,2,38,1,10277,13,39,31,10267,1,736,32,
10280,2,14,1,10280,4,15,2,10280,1,16,48,10283,4,3,20,10283,1,17,41,10283,3,18,1146,10283,1,19,102,10287,12,13,21,10283,1,37,30,10289,2,38,1,
10289,13,39,31,10280,1,737,55,10292,1,70,52,10293,2,71,1,10292,3,72,1147,10280,1,738,3,10296,1,40,83,10297,2,41,1,10297,4,42,33,10297,1,43,7,
10300,1,44,6,10300,3,45,1148,10297,1,46,28,10303,1,47,34,10304,2,48,9,10304,6,49,19,10304,1,50,143,10307,2,51,9,10303,1,52,35,10309,2,53,1,
10309,7,54,8,10309,1,55,5,10312,8,56,50,10296,1,92,70,10314,1,739,3,10315,1,40,29,10316,2,41,1,10316,4,42,33,10316,1,43,7,10319,1,44,6,
10319,3,45,1149,10316,1,46,28,10322,1,47,34,10323,2,48,9,10323,6,49,19,10323,1,50,143,10326,2,51,9,10322,1,52,35,10328,2,53,1,10328,7,54,8,
10328,1,55,5,10331,8,56,50,10280,1,740,3,10333,1,40,83,10334,2,41,1,10334,4,42,33,10334,1,43,7,10337,1,44,6,10337,3,45,1150,10334,1,46,28,
10340,1,47,34,10341,2,48,9,10341,6,49,19,10341,1,50,143,10344,2,51,9,10340,1,52,35,10346,2,53,1,10346,7,54,8,10346,1,55,5,10349,8,56,50,
10333,1,92,70,10351,1,741,3,10352,1,40,29,10353,2,41,1,10353,4,42,33,10353,1,43,7,10356,1,44,6,10356,3,45,1151,10353,1,46,28,10359,1,47,34,
10360,2,48,9,10360,6,49,19,10360,1,50,143,10363,2,51,9,10359,1,52,35,10365,2,53,1,10365,7,54,8,10365,1,55,5,10368,8,56,50,10280,1,742,3,
10370,1,40,83,10371,2,41,1,10371,4,42,33,10371,1,43,7,10374,1,44,6,10374,3,45,1152,10371,1,46,28,10377,1,47,34,10378,2,48,9,10378,6,49,19,
10378,1,50,143,10381,2,51,9,10377,1,52,35,10383,2,53,1,10383,7,54,8,10383,1,55,5,10386,8,56,50,10370,1,92,70,10388,1,743,3,10389,1,40,29,
10390,2,41,1,10390,4,42,33,10390,1,43,7,10393,1,44,6,10393,3,45,1153,10390,1,46,28,10396,1,47,34,10397,2,48,9,10397,6,49,19,10397,1,50,143,
10400,2,51,9,10396,1,52,35,10402,2,53,1,10402,7,54,8,10402,1,55,5,10405,8,56,50,10267,1,744,3,10407,4,57,2,10407,1,58,36,10409,1,59,37,
10410,2,60,1,10409,1,61,39,10412,2,1,1,10412,9,62,40,10414,2,1,1,10414,5,63,38,10412,6,64,10,10409,3,66,1154,10409,3,65,1155,10267,1,745,3,
10420,4,57,2,10420,1,58,36,10422,1,59,37,10423,2,60,1,10423,1,4,77,10423,1,5,78,10423,1,6,79,10422,1,61,39,10428,2,1,1,10428,9,62,40,
10430,2,1,1,10430,5,63,38,10428,6,64,10,10422,3,66,1156,10422,3,65,1157,10267,1,746,3,10436,1,21,26,10437,2,1,1,10437,4,22,22,10437,1,23,7,
10440,1,24,6,10440,3,25,1158,10440,3,69,1159,10437,1,26,23,10444,2,27,1,10444,7,28,8,10444,1,29,24,10447,3,20,1160,10444,6,30,53,10449,5,31,27,
10444,9,32,356,10451,2,33,1,10451,11,34,25,10453,4,35,2,10451,14,36,1161,10436,1,4,11,10436,1,5,12,10436,1,6,13,10267,1,747,1162,10459,2,14,1,
10459,4,15,2,10459,1,16,48,10462,4,3,20,10462,1,17,41,10462,3,18,1163,10462,1,19,1164,10466,12,13,21,10462,1,37,30,10468,2,38,1,10468,13,39,31,
10459,1,748,55,10471,1,70,52,10472,2,71,1,10471,3,72,1165,10459,1,749,3,10475,1,40,83,10476,2,41,1,10476,4,42,33,10476,1,43,7,10479,1,44,6,
10479,3,45,1166,10476,1,46,28,10482,1,47,34,10483,2,48,9,10483,6,49,19,10483,1,50,51,10486,2,51,9,10482,1,52,35,10488,2,53,1,10488,7,54,8,
10488,1,55,5,10491,8,56,84,10475,1,92,70,10493,1,750,3,10494,1,40,29,10495,2,41,1,10495,4,42,33,10495,1,43,7,10498,1,44,6,10498,3,45,1167,
10495,1,46,28,10501,1,47,34,10502,2,48,9,10502,6,49,19,10502,1,50,185,10505,2,51,9,10501,1,52,35,10507,2,53,1,10507,7,54,8,10507,1,55,5,
10510,8,56,94,10459,1,751,3,10512,1,40,83,10513,2,41,1,10513,4,42,33,10513,1,43,7,10516,1,44,6,10516,3,45,1168,10513,1,46,28,10519,1,47,34,
10520,2,48,9,10520,6,49,19,10520,1,50,361,10523,2,51,9,10519,1,52,35,10525,2,53,1,10525,7,54,8,10525,1,55,5,10528,8,56,96,10512,1,92,70,
10530,1,752,3,10531,1,40,29,10532,2,41,1,10532,4,42,33,10532,1,43,7,10535,1,44,6,10535,3,45,1169,10532,1,46,28,10538,1,47,34,10539,2,48,9,
10539,6,49,19,10539,1,50,362,10542,2,51,9,10538,1,52,35,10544,2,53,1,10544,7,54,8,10544,1,55,5,10547,8,56,101,10459,1,753,3,10549,1,40,83,
10550,2,41,1,10550,4,42,33,10550,1,43,7,10553,1,44,6,10553,3,45,1170,10550,1,46,28,10556,1,47,34,10557,2,48,9,10557,6,49,19,10557,1,50,363,
10560,2,51,9,10556,1,52,35,10562,2,53,1,10562,7,54,8,10562,1,55,5,10565,8,56,89,10549,1,92,70,10567,1,754,3,10568,1,40,29,10569,2,41,1,
10569,4,42,33,10569,1,43,7,10572,1,44,6,10572,3,45,1171,10569,1,46,28,10575,1,47,34,10576,2,48,9,10576,6,49,19,10576,1,50,93,10579,2,51,9,
10575,1,52,35,10581,2,53,1,10581,7,54,8,10581,1,55,5,10584,8,56,95,26,9,755,1172,10586,3,106,1173,10586,11,107,1174,10588,4,108,82,10588,1,756,1175,
10590,2,14,1,10590,4,15,2,10590,15,73,4,10590,1,16,56,10594,4,3,20,10594,1,17,58,10594,3,18,1176,10594,1,19,197,10598,12,13,21,10590,1,757,1177,
10600,1,21,26,10601,2,1,1,10601,4,22,22,10601,1,23,7,10604,1,24,6,10604,3,25,1178,10604,3,69,1179,10601,1,26,23,10608,2,27,1,10608,7,28,8,
10608,1,29,24,10611,8,20,1180,10608,6,30,49,10613,5,31,27,10608,9,32,1181,10615,2,33,1,10615,11,34,1182,10617,4,35,2,10617,1,758,28,10619,2,79,1,
10619,3,80,1183,10619,6,81,19,10617,1,759,87,10623,2,79,1,10623,3,80,1184,10623,6,81,19,10617,1,760,87,10627,2,79,1,10627,3,80,1185,10627,6,81,19,
10617,1,761,87,10631,2,79,1,10631,3,80,1186,10631,6,81,19,10617,1,762,1187,10635,2,79,1,10635,3,80,1188,10635,6,81,19,10617,1,763,87,10639,2,79,1,
10639,3,80,1189,10639,6,81,19,10617,1,764,87,10643,2,79,1,10643,3,80,1190,10643,6,81,19,10617,1,765,87,10647,2,79,1,10647,3,80,1191,10647,6,81,19,
10617,1,766,87,10651,2,79,1,10651,3,80,1192,10651,6,81,19,10617,1,767,87,10655,2,79,1,10655,3,80,1193,10655,6,81,19,10617,1,768,87,10659,2,79,1,
10659,3,80,1194,10659,6,81,19,10617,1,769,87,10663,2,79,1,10663,3,80,1195,10663,6,81,19,10617,1,770,87,10667,2,79,1,10667,3,80,1196,10667,6,81,19,
10617,1,771,28,10671,2,79,1,10671,3,80,1197,10671,6,81,19,10617,1,772,28,10675,2,79,1,10675,3,80,1198,10675,6,81,19,10617,1,773,87,10679,2,79,1,
10679,3,80,1199,10679,6,81,19,10617,1,774,87,10683,2,79,1,10683,3,80,1200,10683,6,81,19,10615,14,36,1201,10590,1,775,3,10688,1,142,29,10689,2,1,1,
10689,4,143,66,10689,1,144,7,10692,1,145,6,10692,3,146,1202,10692,3,147,1203,10689,1,104,128,10696,2,148,1,10696,7,149,8,10696,1,150,5,10699,1,151,6,
10699,8,104,1204,10699,5,78,129,10590,1,776,3,10703,1,82,29,10704,2,1,1,10704,4,83,66,10704,1,84,7,10707,1,85,6,10707,3,86,1205,10704,1,87,67,
10710,2,88,1,10710,1,89,5,10712,6,90,85,10712,1,91,68,10714,5,78,69,10588,1,777,1206,10716,2,14,1,10716,4,15,2,10716,15,73,4,10716,1,16,56,
10720,4,3,20,10720,1,17,58,10720,3,18,1207,10720,1,19,1208,10724,12,13,21,10716,1,778,3,10726,1,142,29,10727,2,1,1,10727,4,143,66,10727,1,144,7,
10730,1,145,6,10730,3,146,1209,10730,3,147,1210,10727,1,104,128,10734,2,148,1,10734,7,149,8,10734,1,150,5,10737,1,151,6,10737,8,104,1211,10737,5,78,129,
10716,1,779,3,10741,1,82,83,10742,2,1,1,10742,4,83,66,10742,1,84,7,10745,1,85,6,10745,3,86,1212,10742,1,87,67,10748,2,88,1,10748,1,89,5,
10750,6,90,85,10750,1,91,68,10752,5,78,69,10741,1,92,70,10754,1,780,3,10755,1,82,29,10756,2,1,1,10756,4,83,66,10756,1,84,7,10759,1,85,6,
10759,3,86,1213,10756,1,87,67,10762,2,88,1,10762,1,89,5,10764,6,90,85,10764,1,91,68,10766,5,78,69,10588,1,258,1214,10768,2,14,1,10768,4,15,2,
10768,15,73,4,10768,1,16,56,10772,4,3,20,10772,1,17,58,10772,3,18,330,10772,1,19,331,10776,12,13,21,10768,1,781,3,10778,1,82,83,10779,2,1,1,
10779,4,83,66,10779,1,84,7,10782,1,85,6,10782,3,86,1215,10779,1,87,67,10785,2,88,1,10785,1,89,5,10787,6,90,85,10787,1,91,68,10789,5,78,69,
10778,1,92,70,10791,1,782,3,10792,1,82,29,10793,2,1,1,10793,4,83,66,10793,1,84,7,10796,1,85,6,10796,3,86,1216,10793,1,87,67,10799,2,88,1,
10799,1,89,5,10801,6,90,85,10801,1,91,68,10803,5,78,69,10768,1,783,3,10805,4,57,2,10805,1,58,36,10807,1,59,37,10808,2,60,1,10807,1,61,39,
10810,2,1,1,10810,9,62,40,10812,2,1,1,10812,5,63,38,10810,6,64,10,10807,3,66,1217,10807,3,65,1218,10768,1,784,3,10818,1,82,29,10819,2,1,1,
10819,4,83,66,10819,1,84,7,10822,1,85,6,10822,3,86,1219,10822,3,102,1220,10819,1,87,67,10826,2,88,1,10826,1,89,5,10828,6,90,85,10828,1,91,68,
10830,5,78,69,10588,1,785,1221,10832,2,14,1,10832,4,15,2,10832,15,73,4,10832,1,16,56,10836,4,3,20,10836,1,17,58,10836,3,18,1222,10836,1,19,1223,
10840,12,13,21,10832,1,786,3,10842,4,57,2,10842,1,58,36,10844,1,59,37,10845,2,60,1,10844,1,61,178,10847,2,1,1,10847,9,62,92,10849,2,1,1,
10849,5,63,38,10847,6,64,10,10844,3,65,1224,10832,1,787,3,10854,4,57,2,10854,1,58,36,10856,1,59,37,10857,2,60,1,10856,1,61,39,10859,2,1,1,
10859,9,62,40,10861,2,1,1,10861,5,63,38,10859,6,64,10,10856,3,66,1225,10856,3,65,1226,10588,1,788,32,10867,2,14,1,10867,4,15,2,10867,15,73,4,
10867,1,16,56,10871,4,3,20,10871,1,17,41,10871,3,18,1227,10871,1,19,200,10875,12,13,21,10871,1,37,30,10877,2,38,1,10877,13,39,31,10867,1,789,3,
10880,1,82,29,10881,2,1,1,10881,4,83,66,10881,1,84,7,10884,1,85,6,10884,3,86,1228,10884,3,102,1229,10881,1,87,67,10888,2,88,1,10888,1,89,5,
10890,6,90,85,10890,1,91,68,10892,5,78,69,10867,1,790,3,10894,1,142,29,10895,2,1,1,10895,4,143,66,10895,1,144,7,10898,1,145,6,10898,3,146,1230,
10898,3,147,1231,10895,1,104,128,10902,2,148,1,10902,7,149,8,10902,1,150,5,10905,1,151,6,10905,8,104,1232,10905,5,78,129,10588,1,103,88,10588,1,791,1233,
10910,2,14,1,10910,4,15,2,10910,15,73,4,10910,1,16,56,10914,4,3,20,10914,1,17,41,10914,3,18,1234,10914,1,19,1235,10918,12,13,21,10914,1,37,30,
10920,2,38,1,10920,13,39,359,10910,1,792,3,10923,4,57,2,10923,1,58,36,10925,1,59,37,10926,2,60,1,10925,1,61,39,10928,2,1,1,10928,9,62,92,
10930,2,1,1,10930,5,63,38,10928,6,64,10,10925,3,66,1236,10925,3,65,1237,10910,1,793,3,10936,4,57,2,10936,1,58,36,10938,1,59,37,10939,2,60,1,
10939,1,4,77,10939,1,5,78,10939,1,6,79,10938,1,61,39,10944,2,1,1,10944,9,62,92,10946,2,1,1,10946,5,63,38,10944,6,64,10,10938,3,66,1238,
10938,3,65,1239,10910,1,794,3,10952,1,40,29,10953,2,41,1,10953,4,42,33,10953,1,43,7,10956,1,44,6,10956,3,45,1240,10956,3,77,1241,10953,1,46,28,
10960,1,47,34,10961,2,48,9,10961,6,49,19,10961,1,50,51,10964,2,51,9,10960,1,52,35,10966,2,53,1,10966,7,54,8,10966,1,55,5,10969,8,56,50,
10952,1,4,11,10952,1,5,12,10952,1,6,13,10588,1,103,88,10588,1,795,1242,10975,2,14,1,10975,4,15,2,10975,15,73,4,10975,1,16,56,10979,4,3,20,
10979,1,17,58,10979,3,18,1243,10979,1,19,1244,10983,12,13,21,10979,1,93,71,10985,2,74,1,10985,13,94,72,10975,1,95,73,10988,1,96,74,10989,2,74,15,
10989,7,97,75,10989,1,98,5,10992,1,99,6,10992,8,100,90,10992,5,101,76,10975,1,796,55,10996,1,70,52,10997,2,71,1,10996,3,72,1245,10588,1,797,32,
11000,2,14,1,11000,4,15,2,11000,15,73,4,11000,1,16,56,11004,4,3,20,11004,1,17,41,11004,3,18,1246,11004,1,19,1247,11008,12,13,21,11004,1,37,30,
11010,2,38,1,11010,13,39,31,11004,1,93,71,11013,2,74,1,11013,13,94,72,11000,1,95,73,11016,1,96,74,11017,2,74,15,11017,7,97,75,11017,1,98,5,
11020,1,99,6,11020,8,100,90,11020,5,101,76,11000,1,154,3,11024,1,21,26,11025,2,1,1,11025,4,22,22,11025,1,23,7,11028,1,24,6,11028,3,25,144,
11025,1,26,23,11031,2,27,1,11031,7,28,8,11031,1,29,24,11034,8,20,145,11031,6,30,49,11036,5,31,27,11031,9,32,54,11038,2,33,1,11038,11,34,25,
11040,4,35,2,11038,14,36,4,11000,1,158,3,11043,1,21,26,11044,2,1,1,11044,4,22,22,11044,1,23,7,11047,1,24,6,11047,3,25,169,11044,1,26,23,
11050,2,27,1,11050,7,28,8,11050,1,29,24,11053,8,20,170,11050,6,30,49,11055,5,31,27,11050,9,32,54,11057,2,33,1,11057,11,34,25,11059,4,35,2,
11057,14,36,4,11043,1,4,11,11043,1,5,12,11043,1,6,13,11000,1,159,3,11065,1,21,26,11066,2,1,1,11066,4,22,22,11066,1,23,7,11069,1,24,6,
11069,3,25,171,11066,1,26,23,11072,2,27,1,11072,7,28,8,11072,1,29,24,11075,8,20,172,11072,6,30,49,11077,5,31,27,11072,9,32,54,11079,2,33,1,
11079,11,34,25,11081,4,35,2,11079,14,36,4,11065,1,4,11,11065,1,5,12,11065,1,6,13,11000,1,163,3,11087,1,21,26,11088,2,1,1,11088,4,22,22,
11088,1,23,7,11091,1,24,6,11091,3,25,190,11088,1,26,23,11094,2,27,1,11094,7,28,8,11094,1,29,24,11097,8,20,191,11094,6,30,49,11099,5,31,27,
11094,9,32,54,11101,2,33,1,11101,11,34,25,11103,4,35,2,11101,14,36,4,11087,1,4,11,11087,1,5,12,11087,1,6,13,11000,1,164,3,11109,1,21,26,
11110,2,1,1,11110,4,22,22,11110,1,23,7,11113,1,24,6,11113,3,25,192,11110,1,26,23,11116,2,27,1,11116,7,28,8,11116,1,29,24,11119,8,20,193,
11116,6,30,49,11121,5,31,27,11116,9,32,54,11123,2,33,1,11123,11,34,25,11125,4,35,2,11123,14,36,4,11109,1,4,11,11109,1,5,12,11109,1,6,13,
10588,1,798,32,11131,2,14,1,11131,4,15,2,11131,15,73,4,11131,1,16,56,11135,4,3,20,11135,1,17,41,11135,3,18,1248,11135,1,19,365,11139,12,13,21,
11135,1,37,30,11141,2,38,1,11141,13,39,31,11135,1,93,71,11144,2,74,1,11144,13,94,72,11131,1,95,73,11147,1,96,74,11148,2,74,15,11148,7,97,75,
11148,1,98,5,11151,1,99,6,11151,8,100,90,11151,5,101,76,11131,1,154,3,11155,1,21,26,11156,2,1,1,11156,4,22,22,11156,1,23,7,11159,1,24,6,
11159,3,25,144,11156,1,26,23,11162,2,27,1,11162,7,28,8,11162,1,29,24,11165,8,20,145,11162,6,30,49,11167,5,31,27,11162,9,32,54,11169,2,33,1,
11169,11,34,25,11171,4,35,2,11169,14,36,4,10588,1,799,32,11174,2,14,1,11174,4,15,2,11174,15,73,4,11174,1,16,56,11178,4,3,20,11178,1,17,41,
11178,3,18,1249,11178,1,19,348,11182,12,13,21,11178,1,37,30,11184,2,38,1,11184,13,39,31,11178,1,93,71,11187,2,74,1,11187,13,94,72,11174,1,95,73,
11190,1,96,74,11191,2,74,15,11191,7,97,75,11191,1,98,5,11194,1,99,6,11194,8,100,90,11194,5,101,76,11174,1,154,3,11198,1,21,26,11199,2,1,1,
11199,4,22,22,11199,1,23,7,11202,1,24,6,11202,3,25,144,11199,1,26,23,11205,2,27,1,11205,7,28,8,11205,1,29,24,11208,8,20,145,11205,6,30,49,
11210,5,31,27,11205,9,32,54,11212,2,33,1,11212,11,34,25,11214,4,35,2,11212,14,36,4,11174,1,158,3,11217,1,21,26,11218,2,1,1,11218,4,22,22,
11218,1,23,7,11221,1,24,6,11221,3,25,169,11218,1,26,23,11224,2,27,1,11224,7,28,8,11224,1,29,24,11227,8,20,170,11224,6,30,49,11229,5,31,27,
11224,9,32,54,11231,2,33,1,11231,11,34,25,11233,4,35,2,11231,14,36,4,11217,1,4,11,11217,1,5,12,11217,1,6,13,11174,1,159,3,11239,1,21,26,
11240,2,1,1,11240,4,22,22,11240,1,23,7,11243,1,24,6,11243,3,25,171,11240,1,26,23,11246,2,27,1,11246,7,28,8,11246,1,29,24,11249,8,20,172,
11246,6,30,49,11251,5,31,27,11246,9,32,54,11253,2,33,1,11253,11,34,25,11255,4,35,2,11253,14,36,4,11239,1,4,11,11239,1,5,12,11239,1,6,13,
10588,1,800,32,11261,2,14,1,11261,4,15,2,11261,15,73,4,11261,1,16,56,11265,4,3,20,11265,1,17,41,11265,3,18,1250,11265,1,19,1251,11269,12,13,21,
11265,1,37,30,11271,2,38,1,11271,13,39,31,11265,1,93,71,11274,2,74,1,11274,13,94,72,11261,1,95,73,11277,1,96,74,11278,2,74,15,11278,7,97,75,
11278,1,98,5,11281,1,99,6,11281,8,100,90,11281,5,101,76,11261,1,154,3,11285,1,21,26,11286,2,1,1,11286,4,22,22,11286,1,23,7,11289,1,24,6,
11289,3,25,144,11286,1,26,23,11292,2,27,1,11292,7,28,8,11292,1,29,24,11295,8,20,145,11292,6,30,49,11297,5,31,27,11292,9,32,54,11299,2,33,1,
11299,11,34,25,11301,4,35,2,11299,14,36,4,11261,1,158,3,11304,1,21,26,11305,2,1,1,11305,4,22,22,11305,1,23,7,11308,1,24,6,11308,3,25,169,
11305,1,26,23,11311,2,27,1,11311,7,28,8,11311,1,29,24,11314,8,20,170,11311,6,30,49,11316,5,31,27,11311,9,32,54,11318,2,33,1,11318,11,34,25,
11320,4,35,2,11318,14,36,4,11304,1,4,11,11304,1,5,12,11304,1,6,13,11261,1,159,3,11326,1,21,26,11327,2,1,1,11327,4,22,22,11327,1,23,7,
11330,1,24,6,11330,3,25,171,11327,1,26,23,11333,2,27,1,11333,7,28,8,11333,1,29,24,11336,8,20,172,11333,6,30,49,11338,5,31,27,11333,9,32,54,
11340,2,33,1,11340,11,34,25,11342,4,35,2,11340,14,36,4,11326,1,4,11,11326,1,5,12,11326,1,6,13,11261,1,163,3,11348,1,21,26,11349,2,1,1,
11349,4,22,22,11349,1,23,7,11352,1,24,6,11352,3,25,190,11349,1,26,23,11355,2,27,1,11355,7,28,8,11355,1,29,24,11358,8,20,191,11355,6,30,49,
11360,5,31,27,11355,9,32,54,11362,2,33,1,11362,11,34,25,11364,4,35,2,11362,14,36,4,11348,1,4,11,11348,1,5,12,11348,1,6,13,11261,1,164,3,
11370,1,21,26,11371,2,1,1,11371,4,22,22,11371,1,23,7,11374,1,24,6,11374,3,25,192,11371,1,26,23,11377,2,27,1,11377,7,28,8,11377,1,29,24,
11380,8,20,193,11377,6,30,49,11382,5,31,27,11377,9,32,54,11384,2,33,1,11384,11,34,25,11386,4,35,2,11384,14,36,4,11370,1,4,11,11370,1,5,12,
11370,1,6,13,10588,1,801,32,11392,2,14,1,11392,4,15,2,11392,15,73,4,11392,1,16,56,11396,4,3,20,11396,1,17,41,11396,3,18,1252,11396,1,19,1253,
11400,12,13,21,11396,1,37,30,11402,2,38,1,11402,13,39,31,11396,1,93,71,11405,2,74,1,11405,13,94,72,11392,1,95,73,11408,1,96,74,11409,2,74,15,
11409,7,97,75,11409,1,98,5,11412,1,99,6,11412,8,100,90,11412,5,101,76,11392,1,154,3,11416,1,21,26,11417,2,1,1,11417,4,22,22,11417,1,23,7,
11420,1,24,6,11420,3,25,144,11417,1,26,23,11423,2,27,1,11423,7,28,8,11423,1,29,24,11426,8,20,145,11423,6,30,49,11428,5,31,27,11423,9,32,54,
11430,2,33,1,11430,11,34,25,11432,4,35,2,11430,14,36,4,11392,1,158,3,11435,1,21,26,11436,2,1,1,11436,4,22,22,11436,1,23,7,11439,1,24,6,
11439,3,25,169,11436,1,26,23,11442,2,27,1,11442,7,28,8,11442,1,29,24,11445,8,20,170,11442,6,30,49,11447,5,31,27,11442,9,32,54,11449,2,33,1,
11449,11,34,25,11451,4,35,2,11449,14,36,4,11435,1,4,11,11435,1,5,12,11435,1,6,13,11392,1,159,3,11457,1,21,26,11458,2,1,1,11458,4,22,22,
11458,1,23,7,11461,1,24,6,11461,3,25,171,11458,1,26,23,11464,2,27,1,11464,7,28,8,11464,1,29,24,11467,8,20,172,11464,6,30,49,11469,5,31,27,
11464,9,32,54,11471,2,33,1,11471,11,34,25,11473,4,35,2,11471,14,36,4,11457,1,4,11,11457,1,5,12,11457,1,6,13,11392,1,163,3,11479,1,21,26,
11480,2,1,1,11480,4,22,22,11480,1,23,7,11483,1,24,6,11483,3,25,190,11480,1,26,23,11486,2,27,1,11486,7,28,8,11486,1,29,24,11489,8,20,191,
11486,6,30,49,11491,5,31,27,11486,9,32,54,11493,2,33,1,11493,11,34,25,11495,4,35,2,11493,14,36,4,11479,1,4,11,11479,1,5,12,11479,1,6,13,
11392,1,164,3,11501,1,21,26,11502,2,1,1,11502,4,22,22,11502,1,23,7,11505,1,24,6,11505,3,25,192,11502,1,26,23,11508,2,27,1,11508,7,28,8,
11508,1,29,24,11511,8,20,193,11508,6,30,49,11513,5,31,27,11508,9,32,54,11515,2,33,1,11515,11,34,25,11517,4,35,2,11515,14,36,4,11501,1,4,11,
11501,1,5,12,11501,1,6,13,10588,1,802,32,11523,2,14,1,11523,4,15,2,11523,15,73,4,11523,1,16,56,11527,4,3,20,11527,1,17,41,11527,3,18,1254,
11527,1,19,1255,11531,12,13,21,11527,1,37,30,11533,2,38,1,11533,13,39,31,11527,1,93,71,11536,2,74,1,11536,13,94,72,11523,1,95,73,11539,1,96,74,
11540,2,74,15,11540,7,97,75,11540,1,98,5,11543,1,99,6,11543,8,100,90,11543,5,101,76,11523,1,803,3,11547,1,21,26,11548,2,1,1,11548,4,22,22,
11548,1,23,7,11551,1,24,6,11551,3,25,1256,11548,1,26,23,11554,2,27,1,11554,7,28,8,11554,1,29,24,11557,8,20,1257,11554,6,30,49,11559,5,31,27,
11554,9,32,54,11561,2,33,1,11561,11,34,25,11563,4,35,2,11561,14,36,4,11523,1,804,3,11566,1,21,26,11567,2,1,1,11567,4,22,22,11567,1,23,7,
11570,1,24,6,11570,3,25,1258,11567,1,26,23,11573,2,27,1,11573,7,28,8,11573,1,29,24,11576,8,20,1259,11573,6,30,49,11578,5,31,27,11573,9,32,54,
11580,2,33,1,11580,11,34,25,11582,4,35,2,11580,14,36,4,11566,1,4,11,11566,1,5,12,11566,1,6,13,11523,1,805,3,11588,1,21,26,11589,2,1,1,
11589,4,22,22,11589,1,23,7,11592,1,24,6,11592,3,25,1260,11589,1,26,23,11595,2,27,1,11595,7,28,8,11595,1,29,24,11598,8,20,1261,11595,6,30,49,
11600,5,31,27,11595,9,32,54,11602,2,33,1,11602,11,34,25,11604,4,35,2,11602,14,36,4,11588,1,4,11,11588,1,5,12,11588,1,6,13,10588,1,806,32,
11610,2,14,1,11610,4,15,2,11610,15,73,4,11610,1,16,56,11614,4,3,20,11614,1,17,41,11614,3,18,1262,11614,1,19,1263,11618,12,13,21,11614,1,37,30,
11620,2,38,1,11620,13,39,31,11614,1,93,71,11623,2,74,1,11623,13,94,72,11610,1,95,73,11626,1,96,74,11627,2,74,15,11627,7,97,75,11627,1,98,5,
11630,1,99,6,11630,8,100,90,11630,5,101,76,11610,1,154,3,11634,1,21,26,11635,2,1,1,11635,4,22,22,11635,1,23,7,11638,1,24,6,11638,3,25,144,
11635,1,26,23,11641,2,27,1,11641,7,28,8,11641,1,29,24,11644,8,20,145,11641,6,30,49,11646,5,31,27,11641,9,32,54,11648,2,33,1,11648,11,34,25,
11650,4,35,2,11648,14,36,4,11610,1,158,3,11653,1,21,26,11654,2,1,1,11654,4,22,22,11654,1,23,7,11657,1,24,6,11657,3,25,169,11654,1,26,23,
11660,2,27,1,11660,7,28,8,11660,1,29,24,11663,8,20,170,11660,6,30,49,11665,5,31,27,11660,9,32,54,11667,2,33,1,11667,11,34,25,11669,4,35,2,
11667,14,36,4,11653,1,4,11,11653,1,5,12,11653,1,6,13,11610,1,159,3,11675,1,21,26,11676,2,1,1,11676,4,22,22,11676,1,23,7,11679,1,24,6,
11679,3,25,171,11676,1,26,23,11682,2,27,1,11682,7,28,8,11682,1,29,24,11685,8,20,172,11682,6,30,49,11687,5,31,27,11682,9,32,54,11689,2,33,1,
11689,11,34,25,11691,4,35,2,11689,14,36,4,11675,1,4,11,11675,1,5,12,11675,1,6,13,11610,1,163,3,11697,1,21,26,11698,2,1,1,11698,4,22,22,
11698,1,23,7,11701,1,24,6,11701,3,25,190,11698,1,26,23,11704,2,27,1,11704,7,28,8,11704,1,29,24,11707,8,20,191,11704,6,30,49,11709,5,31,27,
11704,9,32,54,11711,2,33,1,11711,11,34,25,11713,4,35,2,11711,14,36,4,11697,1,4,11,11697,1,5,12,11697,1,6,13,11610,1,164,3,11719,1,21,26,
11720,2,1,1,11720,4,22,22,11720,1,23,7,11723,1,24,6,11723,3,25,192,11720,1,26,23,11726,2,27,1,11726,7,28,8,11726,1,29,24,11729,8,20,193,
11726,6,30,49,11731,5,31,27,11726,9,32,54,11733,2,33,1,11733,11,34,25,11735,4,35,2,11733,14,36,4,11719,1,4,11,11719,1,5,12,11719,1,6,13,
10588,1,807,32,11741,2,14,1,11741,4,15,2,11741,15,73,4,11741,1,16,56,11745,4,3,20,11745,1,17,41,11745,3,18,1264,11745,1,19,1265,11749,12,13,21,
11745,1,37,30,11751,2,38,1,11751,13,39,31,11745,1,93,71,11754,2,74,1,11754,13,94,72,11741,1,95,73,11757,1,96,74,11758,2,74,15,11758,7,97,75,
11758,1,98,5,11761,1,99,6,11761,8,100,90,11761,5,101,76,11741,1,808,3,11765,1,21,26,11766,2,1,1,11766,4,22,22,11766,1,23,7,11769,1,24,6,
11769,3,25,1266,11766,1,26,23,11772,2,27,1,11772,7,28,8,11772,1,29,24,11775,8,20,1267,11772,6,30,49,11777,5,31,27,11772,9,32,54,11779,2,33,1,
11779,11,34,25,11781,4,35,2,11779,14,36,4,11741,1,809,3,11784,1,21,26,11785,2,1,1,11785,4,22,22,11785,1,23,7,11788,1,24,6,11788,3,25,1268,
11785,1,26,23,11791,2,27,1,11791,7,28,8,11791,1,29,24,11794,8,20,1269,11791,6,30,49,11796,5,31,27,11791,9,32,54,11798,2,33,1,11798,11,34,25,
11800,4,35,2,11798,14,36,4,11784,1,4,11,11784,1,5,12,11784,1,6,13,11741,1,810,3,11806,1,21,26,11807,2,1,1,11807,4,22,22,11807,1,23,7,
11810,1,24,6,11810,3,25,1270,11807,1,26,23,11813,2,27,1,11813,7,28,8,11813,1,29,24,11816,8,20,1271,11813,6,30,49,11818,5,31,27,11813,9,32,54,
11820,2,33,1,11820,11,34,25,11822,4,35,2,11820,14,36,4,11806,1,4,11,11806,1,5,12,11806,1,6,13,11741,1,811,3,11828,1,21,26,11829,2,1,1,
11829,4,22,22,11829,1,23,7,11832,1,24,6,11832,3,25,1272,11829,1,26,23,11835,2,27,1,11835,7,28,8,11835,1,29,24,11838,8,20,1273,11835,6,30,49,
11840,5,31,27,11835,9,32,54,11842,2,33,1,11842,11,34,25,11844,4,35,2,11842,14,36,4,11828,1,4,11,11828,1,5,12,11828,1,6,13,11741,1,812,3,
11850,1,21,26,11851,2,1,1,11851,4,22,22,11851,1,23,7,11854,1,24,6,11854,3,25,1274,11851,1,26,23,11857,2,27,1,11857,7,28,8,11857,1,29,24,
11860,8,20,1275,11857,6,30,49,11862,5,31,27,11857,9,32,54,11864,2,33,1,11864,11,34,25,11866,4,35,2,11864,14,36,4,11850,1,4,11,11850,1,5,12,
11850,1,6,13,11741,1,813,3,11872,1,21,26,11873,2,1,1,11873,4,22,22,11873,1,23,7,11876,1,24,6,11876,3,25,1276,11873,1,26,23,11879,2,27,1,
11879,7,28,8,11879,1,29,24,11882,8,20,1277,11879,6,30,49,11884,5,31,27,11879,9,32,54,11886,2,33,1,11886,11,34,25,11888,4,35,2,11886,14,36,4,
11872,1,4,11,11872,1,5,12,11872,1,6,13,11741,1,814,3,11894,1,21,26,11895,2,1,1,11895,4,22,22,11895,1,23,7,11898,1,24,6,11898,3,25,1278,
11895,1,26,23,11901,2,27,1,11901,7,28,8,11901,1,29,24,11904,8,20,1279,11901,6,30,49,11906,5,31,27,11901,9,32,54,11908,2,33,1,11908,11,34,25,
11910,4,35,2,11908,14,36,4,11894,1,4,11,11894,1,5,12,11894,1,6,13,11741,1,815,3,11916,1,21,26,11917,2,1,1,11917,4,22,22,11917,1,23,7,
11920,1,24,6,11920,3,25,1280,11917,1,26,23,11923,2,27,1,11923,7,28,8,11923,1,29,24,11926,8,20,1281,11923,6,30,49,11928,5,31,27,11923,9,32,54,
11930,2,33,1,11930,11,34,25,11932,4,35,2,11930,14,36,4,11916,1,4,11,11916,1,5,12,11916,1,6,13,11741,1,816,3,11938,1,21,26,11939,2,1,1,
11939,4,22,22,11939,1,23,7,11942,1,24,6,11942,3,25,1282,11939,1,26,23,11945,2,27,1,11945,7,28,8,11945,1,29,24,11948,8,20,1283,11945,6,30,49,
11950,5,31,27,11945,9,32,54,11952,2,33,1,11952,11,34,25,11954,4,35,2,11952,14,36,4,11938,1,4,11,11938,1,5,12,11938,1,6,13,11741,1,817,3,
11960,1,21,26,11961,2,1,1,11961,4,22,22,11961,1,23,7,11964,1,24,6,11964,3,25,1284,11961,1,26,23,11967,2,27,1,11967,7,28,8,11967,1,29,24,
11970,8,20,1285,11967,6,30,49,11972,5,31,27,11967,9,32,54,11974,2,33,1,11974,11,34,25,11976,4,35,2,11974,14,36,4,11960,1,4,11,11960,1,5,12,
11960,1,6,13,11741,1,818,3,11982,1,21,26,11983,2,1,1,11983,4,22,22,11983,1,23,7,11986,1,24,6,11986,3,25,1286,11983,1,26,23,11989,2,27,1,
11989,7,28,8,11989,1,29,24,11992,8,20,1287,11989,6,30,49,11994,5,31,27,11989,9,32,54,11996,2,33,1,11996,11,34,25,11998,4,35,2,11996,14,36,4,
11982,1,4,11,11982,1,5,12,11982,1,6,13,11741,1,819,3,12004,1,21,26,12005,2,1,1,12005,4,22,22,12005,1,23,7,12008,1,24,6,12008,3,25,1288,
12005,1,26,23,12011,2,27,1,12011,7,28,8,12011,1,29,24,12014,8,20,1289,12011,6,30,49,12016,5,31,27,12011,9,32,54,12018,2,33,1,12018,11,34,25,
12020,4,35,2,12018,14,36,4,12004,1,4,11,12004,1,5,12,12004,1,6,13,10588,1,820,32,12026,2,14,1,12026,4,15,2,12026,15,73,4,12026,1,16,56,
12030,4,3,20,12030,1,17,41,12030,3,18,1290,12030,1,19,1291,12034,12,13,21,12030,1,37,30,12036,2,38,1,12036,13,39,31,12030,1,93,71,12039,2,74,1,
12039,13,94,72,12026,1,95,73,12042,1,96,74,12043,2,74,15,12043,7,97,75,12043,1,98,5,12046,1,99,6,12046,8,100,90,12046,5,101,76,12026,1,821,3,
12050,1,21,26,12051,2,1,1,12051,4,22,22,12051,1,23,7,12054,1,24,6,12054,3,25,1292,12051,1,26,23,12057,2,27,1,12057,7,28,8,12057,1,29,24,
12060,8,20,1293,12057,6,30,49,12062,5,31,27,12057,9,32,54,12064,2,33,1,12064,11,34,25,12066,4,35,2,12064,14,36,4,12026,1,822,3,12069,1,21,26,
12070,2,1,1,12070,4,22,22,12070,1,23,7,12073,1,24,6,12073,3,25,1294,12070,1,26,23,12076,2,27,1,12076,7,28,8,12076,1,29,24,12079,8,20,1295,
12076,6,30,49,12081,5,31,27,12076,9,32,54,12083,2,33,1,12083,11,34,25,12085,4,35,2,12083,14,36,4,12069,1,4,11,12069,1,5,12,12069,1,6,13,
12026,1,823,3,12091,1,21,26,12092,2,1,1,12092,4,22,22,12092,1,23,7,12095,1,24,6,12095,3,25,1296,12092,1,26,23,12098,2,27,1,12098,7,28,8,
12098,1,29,24,12101,8,20,1297,12098,6,30,49,12103,5,31,27,12098,9,32,54,12105,2,33,1,12105,11,34,25,12107,4,35,2,12105,14,36,4,12091,1,4,11,
12091,1,5,12,12091,1,6,13,12026,1,824,3,12113,1,21,26,12114,2,1,1,12114,4,22,22,12114,1,23,7,12117,1,24,6,12117,3,25,1298,12114,1,26,23,
12120,2,27,1,12120,7,28,8,12120,1,29,24,12123,8,20,1299,12120,6,30,49,12125,5,31,27,12120,9,32,54,12127,2,33,1,12127,11,34,25,12129,4,35,2,
12127,14,36,4,12113,1,4,11,12113,1,5,12,12113,1,6,13,26,9,825,1300,12135,3,106,1301,12135,11,107,1302,12137,4,108,82,12137,1,826,1303,12139,2,14,1,
12139,4,15,2,12139,15,73,4,12139,1,16,56,12143,4,3,20,12143,1,17,58,12143,3,18,1304,12143,1,19,1305,12147,12,13,21,12139,1,827,3,12149,1,142,29,
12150,2,1,1,12150,4,143,66,12150,1,144,7,12153,1,145,6,12153,3,146,1306,12153,3,147,1307,12150,1,104,128,12157,2,148,1,12157,7,149,8,12157,1,150,5,
12160,1,151,6,12160,8,104,1308,12160,5,78,129,12139,1,828,3,12164,1,142,29,12165,2,1,1,12165,4,143,66,12165,1,144,7,12168,1,145,6,12168,3,146,1309,
12168,3,147,1310,12165,1,104,128,12172,2,148,1,12172,7,149,8,12172,1,150,5,12175,1,151,6,12175,8,104,1311,12175,5,78,129,12139,1,829,3,12179,1,82,29,
12180,2,1,1,12180,4,83,66,12180,1,84,7,12183,1,85,6,12183,3,86,1312,12180,1,87,67,12186,2,88,1,12186,1,89,5,12188,6,90,85,12188,1,91,68,
12190,5,78,69,12137,1,830,1313,12192,2,14,1,12192,4,15,2,12192,15,73,4,12192,1,16,56,12196,4,3,20,12196,1,17,58,12196,3,18,1314,12196,1,19,1315,
12200,12,13,21,12192,1,831,3,12202,4,57,2,12202,1,58,36,12204,1,59,37,12205,2,60,1,12204,1,61,39,12207,2,1,1,12207,9,62,40,12209,2,1,1,
12209,5,63,38,12207,6,64,10,12204,3,66,1316,12204,3,65,1317,12192,1,832,3,12215,4,57,2,12215,1,58,36,12217,1,59,37,12218,2,60,1,12217,1,61,39,
12220,2,1,1,12220,9,62,40,12222,2,1,1,12222,5,63,38,12220,6,64,10,12217,3,66,1318,12217,3,65,1319,26,9,833,1320,12228,3,106,1321,12228,11,107,1322,
12230,4,108,82,12230,1,257,366,12232,2,14,1,12232,4,15,2,12232,15,73,4,12232,1,16,56,12236,4,3,20,12236,1,17,58,12236,3,18,327,12236,1,19,197,
12240,12,13,21,12232,1,834,3,12242,4,57,2,12242,1,58,36,12244,1,59,37,12245,2,60,1,12244,1,61,39,12247,2,1,1,12247,9,62,40,12249,2,1,1,
12249,5,63,38,12247,6,64,10,12244,3,66,1323,12244,3,65,1324,12232,1,835,3,12255,4,57,2,12255,1,58,36,12257,1,59,37,12258,2,60,1,12257,1,61,39,
12260,2,1,1,12260,9,62,92,12262,2,1,1,12262,5,63,38,12260,6,64,10,12257,3,66,1325,12257,3,65,1326,12230,1,836,366,12268,2,14,1,12268,4,15,2,
12268,15,73,4,12268,1,16,56,12272,4,3,20,12272,1,17,58,12272,3,18,1327,12272,1,19,1328,12276,12,13,21,12268,1,837,3,12278,4,57,2,12278,1,58,36,
12280,1,59,37,12281,2,60,1,12280,1,61,39,12283,2,1,1,12283,9,62,40,12285,2,1,1,12285,5,63,38,12283,6,64,10,12280,3,66,1329,12280,3,65,1330,
12268,1,838,3,12291,4,57,2,12291,1,58,36,12293,1,59,37,12294,2,60,1,12293,1,61,39,12296,2,1,1,12296,9,62,40,12298,2,1,1,12298,5,63,38,
12296,6,64,10,12293,3,66,1331,12293,3,65,1332,12230,1,103,88,12230,1,839,1333,12305,2,14,1,12305,4,15,2,12305,15,73,4,12305,1,16,56,12309,4,3,20,
12309,1,17,58,12309,3,18,1334,12309,1,19,328,12313,12,13,21,12305,1,840,55,12315,1,70,52,12316,2,71,1,12315,3,72,1335,3,9,841,1336,12319,1,842,1337,
12320,2,843,1,12320,11,844,1338,12322,4,845,82,12322,1,846,1339,12324,4,124,122,12324,1,125,123,12326,1,126,146,12327,2,127,1,12326,6,128,147,12326,3,129,1340,
12324,1,130,124,12331,4,3,82,12322,1,847,1341,12333,4,124,122,12333,1,125,123,12335,1,126,146,12336,2,127,1,12335,6,128,147,12335,3,129,1342,12333,1,130,124,
12340,4,3,82,12322,1,848,1343,12342,4,124,122,12342,1,125,123,12344,1,126,1344,12345,2,127,1,12344,6,128,19,12344,3,129,1345,12342,1,130,124,12349,4,3,82,
12322,1,849,1346,12351,4,124,122,12351,1,125,123,12353,1,126,146,12354,2,127,1,12353,6,128,147,12353,3,129,1347,12351,1,130,124,12358,4,3,82,12322,1,850,1348,
12360,4,124,122,12360,1,125,123,12362,1,126,146,12363,2,127,1,12362,6,128,147,12362,3,129,1349,12360,1,130,124,12367,4,3,82,12322,1,851,1350,12369,4,124,122,
12369,1,125,123,12371,1,126,146,12372,2,127,1,12371,6,128,147,12371,3,129,1351,12369,1,130,124,12376,4,3,82,12322,1,852,1352,12378,4,124,122,12378,1,125,123,
12380,1,126,146,12381,2,127,1,12380,6,128,147,12380,3,129,1353,12378,1,130,124,12385,4,3,82,12320,3,853,1354,12319,1,854,1355,12388,2,855,1,12388,6,856,19,
12388,5,857,1356,12388,3,858,1357,3,9,859,1358,12393,1,860,1359,12394,2,861,1,12394,13,862,1360,12394,11,863,1361,12397,4,864,82,12397,1,865,1362,12399,1,866,42,
12400,2,867,1,12400,1,67,43,12402,5,68,44,12399,1,868,60,12404,4,3,45,12404,3,869,1363,12404,1,2,46,12407,5,870,14,12404,3,871,1364,12404,1,2,47,
12410,5,872,14,12404,3,873,1365,12399,6,874,10,12397,1,875,1366,12414,1,876,42,12415,2,877,1,12415,1,67,43,12417,5,68,44,12414,3,878,1367,12414,1,879,57,
12420,4,3,45,12420,3,880,125,12420,1,2,46,12423,5,881,14,12420,3,882,367,12420,1,2,47,12426,5,883,14,12420,3,884,1368,12414,6,885,10,12397,1,886,1369,
12430,1,887,42,12431,2,888,1,12431,1,67,43,12433,5,68,44,12430,3,889,1370,12430,1,890,57,12436,4,3,45,12436,3,891,125,12436,1,2,46,12439,5,892,14,
12436,3,893,367,12436,1,2,47,12442,5,894,14,12436,3,895,1371,12430,6,896,10,12397,1,897,1372,12446,1,898,42,12447,2,899,1,12447,1,67,43,12449,5,68,44,
12446,3,900,1373,12446,1,901,57,12452,4,3,45,12452,3,902,125,12452,1,2,46,12455,5,903,14,12452,3,904,1374,12452,1,2,47,12458,5,905,14,12452,3,906,1375,
12446,6,907,10,12397,1,908,1376,12462,1,909,42,12463,2,910,1,12463,1,67,43,12465,5,68,44,12462,3,911,1377,12462,1,912,57,12468,4,3,45,12468,3,913,125,
12468,1,2,46,12471,5,914,14,12468,3,915,368,12468,1,2,47,12474,5,916,14,12468,3,917,1378,12462,6,918,10,12397,1,919,1379,12478,1,920,42,12479,2,921,1,
12479,1,67,43,12481,5,68,44,12478,3,922,1380,12478,1,923,57,12484,4,3,45,12484,3,924,125,12484,1,2,46,12487,5,925,14,12484,3,926,368,12484,1,2,47,
12490,5,927,14,12484,3,928,1381,12478,6,929,10,12397,1,930,1382,12494,1,931,42,12495,2,932,1,12495,1,67,43,12497,5,68,44,12494,1,933,60,12499,4,3,45,
12499,3,934,315,12499,1,2,46,12502,5,935,14,12499,3,936,369,12499,1,2,47,12505,5,937,14,12499,3,938,1383,12494,6,939,10,12397,1,940,1384,12509,1,941,42,
12510,2,942,1,12510,1,67,43,12512,5,68,44,12509,1,943,60,12514,4,3,45,12514,3,944,315,12514,1,2,46,12517,5,945,14,12514,3,946,369,12514,1,2,47,
12520,5,947,14,12514,3,948,1385,12509,6,949,10,12397,1,950,1386,12524,1,951,42,12525,2,952,1,12525,1,67,43,12527,5,68,44,12524,3,953,1387,12524,1,954,57,
12530,4,3,45,12530,3,955,125,12530,1,2,46,12533,5,956,14,12530,3,957,1388,12530,1,2,47,12536,5,958,14,12530,3,959,1389,12524,6,960,10,12397,1,961,1390,
12540,1,962,42,12541,2,963,1,12541,1,67,43,12543,5,68,44,12540,1,964,60,12545,4,3,45,12545,3,965,315,12545,1,2,46,12548,5,966,14,12545,3,967,1391,
12545,1,2,47,12551,5,968,14,12545,3,969,1392,12540,6,970,10,12397,1,971,1393,12555,1,972,42,12556,2,973,1,12556,1,67,43,12558,5,68,44,12555,3,974,1394,
12555,1,975,57,12561,4,3,45,12561,3,976,125,12561,1,2,46,12564,5,977,14,12561,3,978,1395,12561,1,2,47,12567,5,979,14,12561,3,980,1396,12555,6,981,10,
12397,1,982,1397,12571,1,983,42,12572,2,984,1,12572,1,67,43,12574,5,68,44,12571,3,985,1398,12571,1,986,57,12577,4,3,45,12577,3,987,103,12577,1,2,46,
12580,5,988,14,12577,3,989,1399,12577,1,2,47,12583,5,990,14,12577,3,991,1400,12571,6,992,10,12397,1,105,1401,12587,1,105,42,12588,2,105,1,12588,1,67,43,
12590,5,68,44,12587,1,105,60,12592,4,3,45,12592,3,105,81,12592,1,2,46,12595,5,105,14,12592,3,105,1402,12592,1,2,47,12598,5,105,14,12592,3,105,1403,
12587,6,105,10,12397,1,993,1404,12602,1,994,42,12603,2,995,1,12603,1,67,43,12605,5,68,44,12602,3,996,1405,12602,1,997,57,12608,4,3,45,12608,3,998,103,
12608,1,2,46,12611,5,999,14,12608,3,1000,370,12608,1,2,47,12614,5,1001,14,12608,3,1002,1406,12602,6,1003,10,12397,1,1004,1407,12618,1,1005,42,12619,2,1006,1,
12619,1,67,43,12621,5,68,44,12618,3,1007,1408,12618,1,1008,57,12624,4,3,45,12624,3,1009,103,12624,1,2,46,12627,5,1010,14,12624,3,1011,370,12624,1,2,47,
12630,5,1012,14,12624,3,1013,1409,12618,6,1014,10,12397,1,1015,1410,12634,1,1016,42,12635,2,1017,1,12635,1,67,43,12637,5,68,44,12634,1,1018,60,12639,4,3,45,
12639,3,1019,81,12639,1,2,46,12642,5,1020,14,12639,3,1021,1411,12639,1,2,47,12645,5,1022,14,12639,3,1023,1412,12634,6,1024,10,12397,1,1025,1413,12649,1,1026,42,
12650,2,1027,1,12650,1,67,43,12652,5,68,44,12649,3,1028,1414,12649,1,1029,57,12655,4,3,45,12655,3,1030,103,12655,1,2,46,12658,5,1031,14,12655,3,1032,173,
12655,1,2,47,12661,5,1033,14,12655,3,1034,1415,12649,6,1035,10,12397,1,1036,1416,12665,1,1037,42,12666,2,1038,1,12666,1,67,43,12668,5,68,44,12665,3,1039,1417,
12665,1,1040,57,12671,4,3,45,12671,3,1041,103,12671,1,2,46,12674,5,1042,14,12671,3,1043,173,12671,1,2,47,12677,5,1044,14,12671,3,1045,1418,12665,6,1046,10,
12397,1,1047,1419,12681,1,1048,42,12682,2,1049,1,12682,1,67,43,12684,5,68,44,12681,1,1050,60,12686,4,3,45,12686,3,1051,81,12686,1,2,46,12689,5,1052,14,
12686,3,1053,316,12686,1,2,47,12692,5,1054,14,12686,3,1055,1420,12681,6,1056,10,12397,1,1057,1421,12696,1,1058,42,12697,2,1059,1,12697,1,67,43,12699,5,68,44,
12696,1,1060,60,12701,4,3,45,12701,3,1061,81,12701,1,2,46,12704,5,1062,14,12701,3,1063,316,12701,1,2,47,12707,5,1064,14,12701,3,1065,1422,12696,6,1066,10,
12397,1,1067,1423,12711,1,1068,42,12712,2,1069,1,12712,1,67,43,12714,5,68,44,12711,1,1070,60,12716,4,3,45,12716,3,1071,81,12716,1,2,46,12719,5,1072,14,
12716,3,1073,316,12716,1,2,47,12722,5,1074,14,12716,3,1075,1424,12711,6,1076,10,12397,1,1077,1425,12726,1,1078,42,12727,2,1079,1,12727,1,67,43,12729,5,68,44,
12726,3,1080,1426,12726,1,1081,57,12732,4,3,45,12732,3,1082,103,12732,1,2,46,12735,5,1083,14,12732,3,1084,173,12732,1,2,47,12738,5,1085,14,12732,3,1086,1427,
12726,6,1087,10,12397,1,1088,1428,12742,1,1089,42,12743,2,1090,1,12743,1,67,43,12745,5,68,44,12742,3,1091,1429,12742,1,1092,57,12748,4,3,45,12748,3,1093,103,
12748,1,2,46,12751,5,1094,14,12748,3,1095,173,12748,1,2,47,12754,5,1096,14,12748,3,1097,1430,12742,6,1098,10,12397,1,1099,1431,12758,1,1100,42,12759,2,1101,1,
12759,1,67,43,12761,5,68,44,12758,3,1102,1432,12758,1,1103,57,12764,4,3,45,12764,3,1104,103,12764,1,2,46,12767,5,1105,14,12764,3,1106,173,12764,1,2,47,
12770,5,1107,14,12764,3,1108,1433,12758,6,1109,10,12397,1,1110,1434,12774,1,1111,42,12775,2,1112,1,12775,1,67,43,12777,5,68,44,12774,1,1113,60,12779,4,3,45,
12779,3,1114,81,12779,1,2,46,12782,5,1115,14,12779,3,1116,174,12779,1,2,47,12785,5,1117,14,12779,3,1118,1435,12774,6,1119,10,12397,1,1120,1436,12789,1,1121,42,
12790,2,1122,1,12790,1,67,43,12792,5,68,44,12789,1,1123,60,12794,4,3,45,12794,3,1124,81,12794,1,2,46,12797,5,1125,14,12794,3,1126,174,12794,1,2,47,
12800,5,1127,14,12794,3,1128,1437,12789,6,1129,10,12397,1,1130,1438,12804,1,1131,42,12805,2,1132,1,12805,1,67,43,12807,5,68,44,12804,1,1133,60,12809,4,3,45,
12809,3,1134,81,12809,1,2,46,12812,5,1135,14,12809,3,1136,174,12809,1,2,47,12815,5,1137,14,12809,3,1138,1439,12804,6,1139,10,12397,1,1140,1440,12819,1,1141,42,
12820,2,1142,1,12820,1,67,43,12822,5,68,44,12819,1,1143,60,12824,4,3,45,12824,3,1144,81,12824,1,2,46,12827,5,1145,14,12824,3,1146,174,12824,1,2,47,
12830,5,1147,14,12824,3,1148,1441,12819,6,1149,10,12397,1,1150,1442,12834,1,1151,42,12835,2,1152,1,12835,1,67,43,12837,5,68,44,12834,1,1153,60,12839,4,3,45,
12839,3,1154,81,12839,1,2,46,12842,5,1155,14,12839,3,1156,174,12839,1,2,47,12845,5,1157,14,12839,3,1158,1443,12834,6,1159,10,12397,1,1160,1444,12849,1,1161,42,
12850,2,1162,1,12850,1,67,43,12852,5,68,44,12849,1,1163,60,12854,4,3,45,12854,3,1164,81,12854,1,2,46,12857,5,1165,14,12854,3,1166,148,12854,1,2,47,
12860,5,1167,14,12854,3,1168,1445,12849,6,1169,10,12397,1,1170,1446,12864,1,1171,42,12865,2,1172,1,12865,1,67,43,12867,5,68,44,12864,1,1173,60,12869,4,3,45,
12869,3,1174,81,12869,1,2,46,12872,5,1175,14,12869,3,1176,148,12869,1,2,47,12875,5,1177,14,12869,3,1178,1447,12864,6,1179,10,12397,1,1180,1448,12879,1,1181,42,
12880,2,1182,1,12880,1,67,43,12882,5,68,44,12879,1,1183,60,12884,4,3,45,12884,3,1184,81,12884,1,2,46,12887,5,1185,14,12884,3,1186,148,12884,1,2,47,
12890,5,1187,14,12884,3,1188,1449,12879,6,1189,10,12397,1,1190,1450,12894,1,1191,42,12895,2,1192,1,12895,1,67,43,12897,5,68,44,12894,1,1193,60,12899,4,3,45,
12899,3,1194,81,12899,1,2,46,12902,5,1195,14,12899,3,1196,148,12899,1,2,47,12905,5,1197,14,12899,3,1198,1451,12894,6,1199,10,12397,1,1200,1452,12909,1,1201,42,
12910,2,1202,1,12910,1,67,43,12912,5,68,44,12909,1,1203,60,12914,4,3,45,12914,3,1204,81,12914,1,2,46,12917,5,1205,14,12914,3,1206,148,12914,1,2,47,
12920,5,1207,14,12914,3,1208,1453,12909,6,1209,10,12397,1,1210,1454,12924,1,1211,42,12925,2,1212,1,12925,1,67,43,12927,5,68,44,12924,1,1213,60,12929,4,3,45,
12929,3,1214,81,12929,1,2,46,12932,5,1215,14,12929,3,1216,148,12929,1,2,47,12935,5,1217,14,12929,3,1218,1455,12924,6,1219,10,12397,1,1220,1456,12939,1,1221,42,
12940,2,1222,1,12940,1,67,43,12942,5,68,44,12939,1,1223,60,12944,4,3,45,12944,3,1224,81,12944,1,2,46,12947,5,1225,14,12944,3,1226,1457,12944,1,2,47,
12950,5,1227,14,12944,3,1228,1458,12939,6,1229,10,12397,1,1230,1459,12954,1,1231,42,12955,2,1232,1,12955,1,67,43,12957,5,68,44,12954,1,1233,60,12959,4,3,45,
12959,3,1234,81,12959,1,2,46,12962,5,1235,14,12959,3,1236,317,12959,1,2,47,12965,5,1237,14,12959,3,1238,1460,12954,6,1239,10,12397,1,1240,1461,12969,1,1241,42,
12970,2,1242,1,12970,1,67,43,12972,5,68,44,12969,1,1243,60,12974,4,3,45,12974,3,1244,81,12974,1,2,46,12977,5,1245,14,12974,3,1246,317,12974,1,2,47,
12980,5,1247,14,12974,3,1248,1462,12969,6,1249,10,12397,1,1250,1463,12984,1,1251,42,12985,2,1252,1,12985,1,67,43,12987,5,68,44,12984,1,1253,60,12989,4,3,45,
12989,3,1254,81,12989,1,2,46,12992,5,1255,14,12989,3,1256,317,12989,1,2,47,12995,5,1257,14,12989,3,1258,1464,12984,6,1259,10,12397,1,1260,1465,12999,1,1261,42,
13000,2,1262,1,13000,1,67,43,13002,5,68,44,12999,3,1263,1466,12999,1,1264,57,13005,4,3,45,13005,3,1265,65,13005,1,2,46,13008,5,1266,14,13005,3,1267,318,
13005,1,2,47,13011,5,1268,14,13005,3,1269,1467,12999,6,1270,10,12397,1,1271,1468,13015,1,1272,42,13016,2,1273,1,13016,1,67,43,13018,5,68,44,13015,3,1274,1469,
13015,1,1275,57,13021,4,3,45,13021,3,1276,65,13021,1,2,46,13024,5,1277,14,13021,3,1278,318,13021,1,2,47,13027,5,1279,14,13021,3,1280,1470,13015,6,1281,10,
12397,1,1282,1471,13031,1,1283,42,13032,2,1284,1,13032,1,67,43,13034,5,68,44,13031,3,1285,1472,13031,1,1286,57,13037,4,3,45,13037,3,1287,65,13037,1,2,46,
13040,5,1288,14,13037,3,1289,318,13037,1,2,47,13043,5,1290,14,13037,3,1291,1473,13031,6,1292,10,12397,1,1293,1474,13047,1,1294,42,13048,2,1295,1,13048,1,67,43,
13050,5,68,44,13047,1,1296,60,13052,4,3,45,13052,3,1297,80,13052,1,2,46,13055,5,1298,14,13052,3,1299,1475,13052,1,2,47,13058,5,1300,14,13052,3,1301,1476,
13047,6,1302,10,12397,1,1303,1477,13062,1,1304,42,13063,2,1305,1,13063,1,67,43,13065,5,68,44,13062,3,1306,1478,13062,1,1307,57,13068,4,3,45,13068,3,1308,65,
13068,1,2,46,13071,5,1309,14,13068,3,1310,319,13068,1,2,47,13074,5,1311,14,13068,3,1312,1479,13062,6,1313,10,12397,1,131,1480,13078,1,132,42,13079,2,133,1,
13079,1,67,43,13081,5,68,44,13078,3,134,126,13078,1,135,57,13084,4,3,45,13084,3,136,65,13084,1,2,46,13087,5,137,14,13084,3,138,319,13084,1,2,47,
13090,5,139,14,13084,3,140,127,13078,6,141,10,12397,1,214,1481,13094,1,215,42,13095,2,216,1,13095,1,67,43,13097,5,68,44,13094,3,217,1482,13094,1,218,57,
13100,4,3,45,13100,3,219,65,13100,1,2,46,13103,5,220,14,13100,3,221,319,13100,1,2,47,13106,5,222,14,13100,3,223,320,13094,6,224,10,12397,1,225,1483,
13110,1,226,42,13111,2,227,1,13111,1,67,43,13113,5,68,44,13110,1,228,60,13115,4,3,45,13115,3,229,80,13115,1,2,46,13118,5,230,14,13115,3,231,371,
13115,1,2,47,13121,5,232,14,13115,3,233,372,13110,6,234,10,12397,1,1314,1484,13125,1,1315,42,13126,2,1316,1,13126,1,67,43,13128,5,68,44,13125,1,1317,60,
13130,4,3,45,13130,3,1318,80,13130,1,2,46,13133,5,1319,14,13130,3,1320,371,13130,1,2,47,13136,5,1321,14,13130,3,1322,1485,13125,6,1323,10,12397,1,1324,1486,
13140,1,1325,42,13141,2,1326,1,13141,1,67,43,13143,5,68,44,13140,3,1327,1487,13140,1,1328,57,13146,4,3,45,13146,3,1329,65,13146,1,2,46,13149,5,1330,14,
13146,3,1331,175,13146,1,2,47,13152,5,1332,14,13146,3,1333,1488,13140,6,1334,10,12397,1,131,1489,13156,1,132,42,13157,2,133,1,13157,1,67,43,13159,5,68,44,
13156,3,134,126,13156,1,135,57,13162,4,3,45,13162,3,136,65,13162,1,2,46,13165,5,137,14,13162,3,138,175,13162,1,2,47,13168,5,139,14,13162,3,140,127,
13156,6,141,10,12397,1,214,1490,13172,1,215,42,13173,2,216,1,13173,1,67,43,13175,5,68,44,13172,3,217,1491,13172,1,218,57,13178,4,3,45,13178,3,219,65,
13178,1,2,46,13181,5,220,14,13178,3,221,175,13178,1,2,47,13184,5,222,14,13178,3,223,320,13172,6,224,10,12397,1,225,1492,13188,1,226,42,13189,2,227,1,
13189,1,67,43,13191,5,68,44,13188,1,228,60,13193,4,3,45,13193,3,229,80,13193,1,2,46,13196,5,230,14,13193,3,231,1493,13193,1,2,47,13199,5,232,14,
13193,3,233,372,13188,6,234,10,12397,1,1335,1494,13203,1,1336,42,13204,2,1337,1,13204,1,67,43,13206,5,68,44,13203,3,1338,1495,13203,1,1339,57,13209,4,3,45,
13209,3,1340,65,13209,1,2,46,13212,5,1341,14,13209,3,1342,175,13209,1,2,47,13215,5,1343,14,13209,3,1344,1496,13203,6,1345,10,12397,1,1346,1497,13219,1,1347,42,
13220,2,1348,1,13220,1,67,43,13222,5,68,44,13219,3,1349,1498,13219,1,1350,57,13225,4,3,45,13225,3,1351,65,13225,1,2,46,13228,5,1352,14,13225,3,1353,175,
13225,1,2,47,13231,5,1354,14,13225,3,1355,1499,13219,6,1356,10,12397,1,1357,1500,13235,1,1358,42,13236,2,1359,1,13236,1,67,43,13238,5,68,44,13235,3,1360,1501,
13235,1,1361,57,13241,4,3,45,13241,3,1362,65,13241,1,2,46,13244,5,1363,14,13241,3,1364,176,13241,1,2,47,13247,5,1365,14,13241,3,1366,1502,13235,6,1367,10,
12397,1,131,1503,13251,1,132,42,13252,2,133,1,13252,1,67,43,13254,5,68,44,13251,3,134,126,13251,1,135,57,13257,4,3,45,13257,3,136,65,13257,1,2,46,
13260,5,137,14,13257,3,138,176,13257,1,2,47,13263,5,139,14,13257,3,140,127,13251,6,141,10,12397,1,225,1504,13267,1,226,42,13268,2,227,1,13268,1,67,43,
13270,5,68,44,13267,3,1368,1505,13267,1,228,57,13273,4,3,45,13273,3,229,65,13273,1,2,46,13276,5,230,14,13273,3,231,176,13273,1,2,47,13279,5,232,14,
13273,3,233,1506,13267,6,234,10,12397,1,1369,1507,13283,1,1370,42,13284,2,1371,1,13284,1,67,43,13286,5,68,44,13283,3,1372,1508,13283,1,1373,57,13289,4,3,45,
13289,3,1374,65,13289,1,2,46,13292,5,1375,14,13289,3,1376,176,13289,1,2,47,13295,5,1377,14,13289,3,1378,1509,13283,6,1379,10,12397,1,1380,1510,13299,1,1381,42,
13300,2,1382,1,13300,1,67,43,13302,5,68,44,13299,3,1383,1511,13299,1,1384,57,13305,4,3,45,13305,3,1385,65,13305,1,2,46,13308,5,1386,14,13305,3,1387,176,
13305,1,2,47,13311,5,1388,14,13305,3,1389,1512,13299,6,1390,10,12397,1,1391,1513,13315,1,1392,42,13316,2,1393,1,13316,1,67,43,13318,5,68,44,13315,3,1394,1514,
13315,1,1395,57,13321,4,3,45,13321,3,1396,65,13321,1,2,46,13324,5,1397,14,13321,3,1398,373,13321,1,2,47,13327,5,1399,14,13321,3,1400,1515,13315,6,1401,10,
12397,1,1402,1516,13331,1,1403,42,13332,2,1404,1,13332,1,67,43,13334,5,68,44,13331,3,1405,1517,13331,1,1406,57,13337,4,3,45,13337,3,1407,65,13337,1,2,46,
13340,5,1408,14,13337,3,1409,373,13337,1,2,47,13343,5,1410,14,13337,3,1411,1518,13331,6,1412,10,12397,1,1413,1519,13347,1,1414,42,13348,2,1415,1,13348,1,67,43,
13350,5,68,44,13347,3,1416,1520,13347,1,1417,57,13353,4,3,45,13353,3,1418,65,13353,1,2,46,13356,5,1419,14,13353,3,1420,149,13353,1,2,47,13359,5,1421,14,
13353,3,1422,1521,13347,6,1423,10,12397,1,131,1522,13363,1,132,42,13364,2,133,1,13364,1,67,43,13366,5,68,44,13363,3,134,126,13363,1,135,57,13369,4,3,45,
13369,3,136,65,13369,1,2,46,13372,5,137,14,13369,3,138,149,13369,1,2,47,13375,5,139,14,13369,3,140,127,13363,6,141,10,12397,1,214,1523,13379,1,215,42,
13380,2,216,1,13380,1,67,43,13382,5,68,44,13379,3,217,1524,13379,1,218,57,13385,4,3,45,13385,3,219,65,13385,1,2,46,13388,5,220,14,13385,3,221,149,
13385,1,2,47,13391,5,222,14,13385,3,223,320,13379,6,224,10,12397,1,1424,1525,13395,1,1425,42,13396,2,1426,1,13396,1,67,43,13398,5,68,44,13395,3,1427,1526,
13395,1,1428,57,13401,4,3,45,13401,3,1429,65,13401,1,2,46,13404,5,1430,14,13401,3,1431,149,13401,1,2,47,13407,5,1432,14,13401,3,1433,1527,13395,6,1434,10,
12397,1,1435,1528,13411,1,1436,42,13412,2,1437,1,13412,1,67,43,13414,5,68,44,13411,1,1438,60,13416,4,3,45,13416,3,1439,80,13416,1,2,46,13419,5,1440,14,
13416,3,1441,98,13416,1,2,47,13422,5,1442,14,13416,3,1443,1529,13411,6,1444,10,12397,1,1445,1530,13426,1,1446,42,13427,2,1447,1,13427,1,67,43,13429,5,68,44,
13426,3,1448,1531,13426,1,1449,57,13432,4,3,45,13432,3,1450,65,13432,1,2,46,13435,5,1451,14,13432,3,1452,149,13432,1,2,47,13438,5,1453,14,13432,3,1454,1532,
13426,6,1455,10,12397,1,1456,1533,13442,1,1457,42,13443,2,1458,1,13443,1,67,43,13445,5,68,44,13442,3,1459,1534,13442,1,1460,57,13448,4,3,45,13448,3,1461,65,
13448,1,2,46,13451,5,1462,14,13448,3,1463,149,13448,1,2,47,13454,5,1464,14,13448,3,1465,1535,13442,6,1466,10,12397,1,1467,1536,13458,1,1468,42,13459,2,1469,1,
13459,1,67,43,13461,5,68,44,13458,1,1470,60,13463,4,3,45,13463,3,1471,80,13463,1,2,46,13466,5,1472,14,13463,3,1473,98,13463,1,2,47,13469,5,1474,14,
13463,3,1475,1537,13458,6,1476,10,12397,1,1477,1538,13473,1,1478,42,13474,2,1479,1,13474,1,67,43,13476,5,68,44,13473,1,1480,60,13478,4,3,45,13478,3,1481,80,
13478,1,2,46,13481,5,1482,14,13478,3,1483,98,13478,1,2,47,13484,5,1484,14,13478,3,1485,1539,13473,6,1486,10,12397,1,1487,1540,13488,1,1488,42,13489,2,1489,1,
13489,1,67,43,13491,5,68,44,13488,1,1490,60,13493,4,3,45,13493,3,1491,80,13493,1,2,46,13496,5,1492,14,13493,3,1493,98,13493,1,2,47,13499,5,1494,14,
13493,3,1495,1541,13488,6,1496,10,12397,1,1497,1542,13503,1,1498,42,13504,2,1499,1,13504,1,67,43,13506,5,68,44,13503,1,1500,60,13508,4,3,45,13508,3,1501,80,
13508,1,2,46,13511,5,1502,14,13508,3,1503,1543,13508,1,2,47,13514,5,1504,14,13508,3,1505,1544,13503,6,1506,10,12397,1,1507,1545,13518,1,1508,42,13519,2,1509,1,
13519,1,67,43,13521,5,68,44,13518,1,1510,60,13523,4,3,45,13523,3,1511,80,13523,1,2,46,13526,5,1512,14,13523,3,1513,98,13523,1,2,47,13529,5,1514,14,
13523,3,1515,1546,13518,6,1516,10,12397,1,1517,1547,13533,1,1518,42,13534,2,1519,1,13534,1,67,43,13536,5,68,44,13533,1,1520,60,13538,4,3,45,13538,3,1521,80,
13538,1,2,46,13541,5,1522,14,13538,3,1523,1548,13538,1,2,47,13544,5,1524,14,13538,3,1525,1549,13533,6,1526,10,12397,1,1527,1550,13548,1,1528,42,13549,2,1529,1,
13549,1,67,43,13551,5,68,44,13548,1,1530,60,13553,4,3,45,13553,3,1531,80,13553,1,2,46,13556,5,1532,14,13553,3,1533,98,13553,1,2,47,13559,5,1534,14,
13553,3,1535,1551,13548,6,1536,10,12397,1,1537,1552,13563,1,1538,42,13564,2,1539,1,13564,1,67,43,13566,5,68,44,13563,1,1540,60,13568,4,3,45,13568,3,1541,80,
13568,1,2,46,13571,5,1542,14,13568,3,1543,98,13568,1,2,47,13574,5,1544,14,13568,3,1545,1553,13563,6,1546,10,12397,1,1547,1554,13578,1,1548,42,13579,2,1549,1,
13579,1,67,43,13581,5,68,44,13578,1,1550,60,13583,4,3,45,13583,3,1551,80,13583,1,2,46,13586,5,1552,14,13583,3,1553,98,13583,1,2,47,13589,5,1554,14,
13583,3,1555,1555,13578,6,1556,10,12397,1,1557,1556,13593,1,1558,42,13594,2,1559,1,13594,1,67,43,13596,5,68,44,13593,1,1560,60,13598,4,3,45,13598,3,1561,80,
13598,1,2,46,13601,5,1562,14,13598,3,1563,321,13598,1,2,47,13604,5,1564,14,13598,3,1565,1557,13593,6,1566,10,12397,1,1567,1558,13608,1,1568,42,13609,2,1569,1,
13609,1,67,43,13611,5,68,44,13608,1,1570,60,13613,4,3,45,13613,3,1571,80,13613,1,2,46,13616,5,1572,14,13613,3,1573,374,13613,1,2,47,13619,5,1574,14,
13613,3,1575,1559,13608,6,1576,10,12397,1,1577,1560,13623,1,1578,42,13624,2,1579,1,13624,1,67,43,13626,5,68,44,13623,1,1580,60,13628,4,3,45,13628,3,1581,80,
13628,1,2,46,13631,5,1582,14,13628,3,1583,374,13628,1,2,47,13634,5,1584,14,13628,3,1585,1561,13623,6,1586,10,12397,1,1587,1562,13638,1,1588,42,13639,2,1589,1,
13639,1,67,43,13641,5,68,44,13638,1,1590,60,13643,4,3,45,13643,3,1591,80,13643,1,2,46,13646,5,1592,14,13643,3,1593,321,13643,1,2,47,13649,5,1594,14,
13643,3,1595,1563,13638,6,1596,10,12397,1,1597,1564,13653,1,1598,42,13654,2,1599,1,13654,1,67,43,13656,5,68,44,13653,1,1600,60,13658,4,3,45,13658,3,1601,80,
13658,1,2,46,13661,5,1602,14,13658,3,1603,321,13658,1,2,47,13664,5,1604,14,13658,3,1605,1565,13653,6,1606,10,12397,1,1607,1566,13668,1,1608,42,13669,2,1609,1,
13669,1,67,43,13671,5,68,44,13668,1,1610,60,13673,4,3,45,13673,3,1611,80,13673,1,2,46,13676,5,1612,14,13673,3,1613,375,13673,1,2,47,13679,5,1614,14,
13673,3,1615,1567,13668,6,1616,10,12397,1,1617,1568,13683,1,1618,42,13684,2,1619,1,13684,1,67,43,13686,5,68,44,13683,1,1620,60,13688,4,3,45,13688,3,1621,80,
13688,1,2,46,13691,5,1622,14,13688,3,1623,375,13688,1,2,47,13694,5,1624,14,13688,3,1625,1569,13683,6,1626,10,12397,1,1627,1570,13698,1,1628,42,13699,2,1629,1,
13699,1,67,43,13701,5,68,44,13698,1,1630,60,13703,4,3,45,13703,3,1631,80,13703,1,2,46,13706,5,1632,14,13703,3,1633,98,13703,1,2,47,13709,5,1634,14,
13703,3,1635,1571,13698,6,1636,10,12397,1,1637,1572,13713,1,1638,42,13714,2,1639,1,13714,1,67,43,13716,5,68,44,13713,3,1640,1573,13713,1,1641,57,13719,4,3,45,
13719,3,1642,65,13719,1,2,46,13722,5,1643,14,13719,3,1644,150,13719,1,2,47,13725,5,1645,14,13719,3,1646,1574,13713,6,1647,10,12397,1,131,1575,13729,1,132,42,
13730,2,133,1,13730,1,67,43,13732,5,68,44,13729,3,134,126,13729,1,135,57,13735,4,3,45,13735,3,136,65,13735,1,2,46,13738,5,137,14,13735,3,138,150,
13735,1,2,47,13741,5,139,14,13735,3,140,127,13729,6,141,10,12397,1,235,1576,13745,1,236,42,13746,2,237,1,13746,1,67,43,13748,5,68,44,13745,3,238,322,
13745,1,239,57,13751,4,3,45,13751,3,240,65,13751,1,2,46,13754,5,241,14,13751,3,242,150,13751,1,2,47,13757,5,243,14,13751,3,244,323,13745,6,245,10,
12397,1,246,1577,13761,1,247,42,13762,2,248,1,13762,1,67,43,13764,5,68,44,13761,3,249,324,13761,1,250,57,13767,4,3,45,13767,3,251,65,13767,1,2,46,
13770,5,252,14,13767,3,253,150,13767,1,2,47,13773,5,254,14,13767,3,255,325,13761,6,256,10,12397,1,1648,1578,13777,1,1649,42,13778,2,1650,1,13778,1,67,43,
13780,5,68,44,13777,3,1651,376,13777,1,1652,57,13783,4,3,45,13783,3,1653,65,13783,1,2,46,13786,5,1654,14,13783,3,1655,194,13783,1,2,47,13789,5,1656,14,
13783,3,1657,1579,13777,6,1658,10,12397,1,131,1580,13793,1,132,42,13794,2,133,1,13794,1,67,43,13796,5,68,44,13793,3,134,126,13793,1,135,57,13799,4,3,45,
13799,3,136,65,13799,1,2,46,13802,5,137,14,13799,3,138,194,13799,1,2,47,13805,5,139,14,13799,3,140,127,13793,6,141,10,12397,1,235,1581,13809,1,236,42,
13810,2,237,1,13810,1,67,43,13812,5,68,44,13809,3,238,322,13809,1,239,57,13815,4,3,45,13815,3,240,65,13815,1,2,46,13818,5,241,14,13815,3,242,194,
13815,1,2,47,13821,5,243,14,13815,3,244,323,13809,6,245,10,12397,1,246,1582,13825,1,247,42,13826,2,248,1,13826,1,67,43,13828,5,68,44,13825,3,249,324,
13825,1,250,57,13831,4,3,45,13831,3,251,65,13831,1,2,46,13834,5,252,14,13831,3,253,194,13831,1,2,47,13837,5,254,14,13831,3,255,325,13825,6,256,10,
12397,1,1659,1583,13841,1,1660,42,13842,2,1661,1,13842,1,67,43,13844,5,68,44,13841,3,1662,376,13841,1,1663,57,13847,4,3,45,13847,3,1664,65,13847,1,2,46,
13850,5,1665,14,13847,3,1666,195,13847,1,2,47,13853,5,1667,14,13847,3,1668,1584,13841,6,1669,10,12397,1,131,1585,13857,1,132,42,13858,2,133,1,13858,1,67,43,
13860,5,68,44,13857,3,134,126,13857,1,135,57,13863,4,3,45,13863,3,136,65,13863,1,2,46,13866,5,137,14,13863,3,138,195,13863,1,2,47,13869,5,139,14,
13863,3,140,127,13857,6,141,10,12397,1,235,1586,13873,1,236,42,13874,2,237,1,13874,1,67,43,13876,5,68,44,13873,3,238,322,13873,1,239,57,13879,4,3,45,
13879,3,240,65,13879,1,2,46,13882,5,241,14,13879,3,242,195,13879,1,2,47,13885,5,243,14,13879,3,244,323,13873,6,245,10,12397,1,246,1587,13889,1,247,42,
13890,2,248,1,13890,1,67,43,13892,5,68,44,13889,3,249,324,13889,1,250,57,13895,4,3,45,13895,3,251,65,13895,1,2,46,13898,5,252,14,13895,3,253,195,
13895,1,2,47,13901,5,254,14,13895,3,255,325,13889,6,256,10,12397,1,1670,1588,13905,1,1671,42,13906,2,1672,1,13906,1,67,43,13908,5,68,44,13905,3,1673,1589,
13905,1,1674,57,13911,4,3,45,13911,3,1675,65,13911,1,2,46,13914,5,1676,14,13911,3,1677,150,13911,1,2,47,13917,5,1678,14,13911,3,1679,1590,13905,6,1680,10,
12397,1,1681,1591,13921,1,1682,42,13922,2,1683,1,13922,1,67,43,13924,5,68,44,13921,3,1684,1592,13921,1,1685,57,13927,4,3,45,13927,3,1686,65,13927,1,2,46,
13930,5,1687,14,13927,3,1688,150,13927,1,2,47,13933,5,1689,14,13927,3,1690,1593,13921,6,1691,10,12397,1,1692,1594,13937,1,1693,42,13938,2,1694,1,13938,1,67,43,
13940,5,68,44,13937,3,1695,1595,13937,1,1696,57,13943,4,3,45,13943,3,1697,65,13943,1,2,46,13946,5,1698,14,13943,3,1699,1596,13943,1,2,47,13949,5,1700,14,
13943,3,1701,1597,13937,6,1702,10,12394,5,1703,1598,3,13,1704,1599,13954,5,1705,1600,13955,18,1706,1601,0,16,1707,1602,13957,6,1708,1603,13958,1,1709,1604,13959,2,1710,9,
13959,5,1711,1605,13957,1,1712,196,13962,4,1713,1606,13957,1,1714,196,13964,4,268,1607,13957,1,1715,196,13966,4,268,1608,13957,1,1716,196,13968,1,1717,1609,0,16,1718,1610,
}
--==============================================================================
--  СБОРКА ДЕРЕВА
--==============================================================================

-- Снести предыдущий запуск
local function purge(root)
	if not root then return end
	for _, g in ipairs(root:GetChildren()) do
		if type(g.Name) == "string" and g.Name:match("^Nousigi Hub GUI") then
			pcall(function() g:Destroy() end)
		end
	end
end
purge(LocalPlayer:FindFirstChildOfClass("PlayerGui"))
if typeof(gethui) == "function" then
	local ok, h = pcall(gethui)
	if ok then purge(h) end
end

-- Куда вешать ScreenGui: gethui() под экзекьютором, PlayerGui в Studio
local function guiParent()
	if typeof(gethui) == "function" then
		local ok, h = pcall(gethui)
		if ok and h then return h end
	end
	return LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui")
end

local objects, roots = table.create(#T_ // 4), {}

for i = 1, #T_, 4 do
	local parentIdx = T_[i]
	local inst = Instance.new(C_[T_[i + 1]])
	inst.Name = N_[T_[i + 2]]

	local props = P_[T_[i + 3]]
	if props then
		-- сначала пробуем разом; если какое-то свойство недоступно в этой
		-- версии движка — падаем на поштучное присваивание, чтобы не потерять
		-- остальные
		local ok = pcall(function()
			for k, v in pairs(props) do inst[k] = v end
		end)
		if not ok then
			for k, v in pairs(props) do pcall(function() inst[k] = v end) end
		end
	end

	local n = (i + 3) // 4
	objects[n] = inst
	if parentIdx > 0 then
		inst.Parent = objects[parentIdx]
	else
		roots[#roots + 1] = inst
	end
end

local parent = guiParent()
for _, g in ipairs(roots) do
	pcall(function() g.Parent = parent end)
end

--==============================================================================
--  СЛОЙ ПОВЕДЕНИЯ
--  Дерево — статика, скриптов внутри нет. Всё интерактивное навешивается по
--  именам узлов, которые пришли из оригинала.
--==============================================================================

local MAIN = roots[1]
if not MAIN then return end

local root    = MAIN:FindFirstChild("main-root")
local holder  = root and root:FindFirstChild("main-holder")
if not (root and holder) then return end

local top     = holder:FindFirstChild("main-top")
local content = holder:FindFirstChild("content-root")
local sider   = holder:FindFirstChild("sider-layout")
local searchRoot = holder:FindFirstChild("search-root")
local pageLayout = content and content:FindFirstChildOfClass("UIPageLayout")

local FAST = TweenInfo.new(0.15, Enum.EasingStyle.Quad,  Enum.EasingDirection.Out)
local MED  = TweenInfo.new(0.20, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local ACCENT = Color3.fromRGB(131, 181, 255)

local conns = {}
local function track(c) conns[#conns + 1] = c; return c end
local function tw(inst, info, goal) local t = TweenService:Create(inst, info, goal); t:Play(); return t end

-- Контроллеры привязываются ПОСЛЕ создания статического дерева. Behavior-слой
-- обращается сюда во время клика/drag, поэтому Callback можно назначить уже из
-- внешнего скрипта после `loadstring(... )()`.
local bindings = setmetatable({}, { __mode = "k" })

local function widgetAncestor(inst, prefix)
	local cur = inst
	while cur and cur ~= content do
		if type(cur.Name) == "string" and cur.Name:sub(1, #prefix) == prefix then return cur end
		cur = cur.Parent
	end
	return nil
end

local function emitBound(widget, value)
	local control = widget and bindings[widget]
	if control and control._FromUI then
		control:_FromUI(value)
		return true
	end
	return false
end

--------------------------------------------------------------------- окно
do
	local dragging, startPos, startOffset
	track(top.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
			dragging, startPos, startOffset = true, input.Position, root.Position
			local c; c = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false; c:Disconnect() end
			end)
		end
	end))

	local resizeBtn = holder:FindFirstChild("resize-btn")
	local resizing, rStart, rSize
	if resizeBtn then
		track(resizeBtn.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
				resizing, rStart = true, input.Position
				rSize = Vector2.new(root.Size.X.Offset, root.Size.Y.Offset)
				local c; c = input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then resizing = false; c:Disconnect() end
				end)
			end
		end))
	end

	track(UserInputService.InputChanged:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseMovement
		and input.UserInputType ~= Enum.UserInputType.Touch then return end
		if dragging then
			local d = input.Position - startPos
			root.Position = UDim2.new(startOffset.X.Scale, startOffset.X.Offset + d.X,
			                          startOffset.Y.Scale, startOffset.Y.Offset + d.Y)
		elseif resizing then
			local d = input.Position - rStart
			root.Size = UDim2.fromOffset(math.clamp(rSize.X + d.X, 520, 1600),
			                             math.clamp(rSize.Y + d.Y, 300, 1000))
		end
	end))
end

------------------------------------------------------------------ сайдбар
do
	local btnRoot = top:FindFirstChild("top-sider")
	local btn = btnRoot and btnRoot:FindFirstChild("top-sider-btn")
	local ico = btnRoot and btnRoot:FindFirstChild("top-sider-ico")
	if btn and sider and content then
		local open = true
		local sizeOpen, posOpen = content.Size, content.Position
		local siderOpen = sider.Size
		track(btn.MouseButton1Click:Connect(function()
			open = not open
			if open then
				tw(sider, MED, { Size = siderOpen })
				tw(content, MED, { Size = sizeOpen, Position = posOpen })
				if ico then tw(ico, MED, { Rotation = 90 }) end
			else
				tw(sider, MED, { Size = UDim2.new(0, 0, siderOpen.Y.Scale, siderOpen.Y.Offset) })
				tw(content, MED, { Size = UDim2.new(1, -10, sizeOpen.Y.Scale, sizeOpen.Y.Offset),
				                   Position = UDim2.fromOffset(5, posOpen.Y.Offset) })
				if ico then tw(ico, MED, { Rotation = -90 }) end
			end
		end))
	end
end

------------------------------------------------------------------ вкладки
local pages, menuBgs = {}, {}
local selectPage
do
	for _, child in ipairs(content:GetChildren()) do
		local name = child.Name:match("^pageContainer%-(.+)$")
		if name then pages[name] = child end
	end

	local menu = sider and sider:FindFirstChild("menu-root")
	menu = menu and menu:FindFirstChild("menu-content")

	local function select(name)
		local page = pages[name]
		if not page then return end
		for n, bg in pairs(menuBgs) do
			-- оригинал меняет и цвет, и прозрачность: неактивная плашка белая
			-- и полностью прозрачная, активная — accent и непрозрачная.
			-- Красить надо обязательно, иначе белый текст ляжет на белый фон.
			bg.BackgroundColor3 = ACCENT
			tw(bg, FAST, { BackgroundTransparency = (n == name) and 0 or 1 })
		end
		if pageLayout then pcall(function() pageLayout:JumpTo(page) end) end
	end
	selectPage = select

	if menu then
		for _, item in ipairs(menu:GetChildren()) do
			local name = item.Name:match("^menu%-child%-(.+)$")
			local sel = name and item:FindFirstChild("page-selector")
			local bg  = sel and sel:FindFirstChild("menu-child-bg")
			local btn = sel and sel:FindFirstChild("menu-child-btn")
			if name and bg and btn then
				menuBgs[name] = bg
				track(btn.MouseButton1Click:Connect(function() select(name) end))
				track(btn.MouseEnter:Connect(function()
					if bg.BackgroundTransparency > 0.1 then tw(bg, FAST, { BackgroundTransparency = 0.85 }) end
				end))
				track(btn.MouseLeave:Connect(function()
					if bg.BackgroundTransparency > 0.1 then tw(bg, FAST, { BackgroundTransparency = 1 }) end
				end))
			end
		end
	end

	-- вкладка, снятая уже выбранной, должна быть того же цвета, что и после клика
	for _, bg in pairs(menuBgs) do
		if bg.BackgroundTransparency < 0.5 then bg.BackgroundColor3 = ACCENT end
	end

	local settingRoot = sider and sider:FindFirstChild("setting-root")
	local settingBtn = settingRoot and settingRoot:FindFirstChild("setting-btn")
	if settingBtn then
		track(settingBtn.MouseButton1Click:Connect(function() select("UI Setting") end))
	end
end

------------------------------------------------------------------ секции
-- section-container-* : шеврон сворачивает, лупа открывает строку поиска.
-- Свёрнутая высота в оригинале — 27; развёрнутая считается по UIListLayout.
do
	local function wire(section)
		local layout = section:FindFirstChildOfClass("UIListLayout")
		local topRow = section:FindFirstChild("section-top")
		if not (layout and topRow) then return end

		local function expanded()
			return math.max(27, layout.AbsoluteContentSize.Y + 2)
		end

		local chipRoot = topRow:FindFirstChild("section-collapse-root")
		local chevron  = chipRoot and chipRoot:FindFirstChild("section-collapse-btn")
		if chevron then
			track(chevron.MouseButton1Click:Connect(function()
				local collapsed = math.abs(chevron.Rotation) > 45
				if collapsed then
					tw(chevron, MED, { Rotation = 0 })
					tw(section, MED, { Size = UDim2.new(section.Size.X.Scale, section.Size.X.Offset, 0, expanded()) })
				else
					tw(chevron, MED, { Rotation = -90 })
					tw(section, MED, { Size = UDim2.new(section.Size.X.Scale, section.Size.X.Offset, 0, 27) })
				end
			end))
		end

		local searchChip = topRow:FindFirstChild("section-search-top")
		local searchBtn  = searchChip and searchChip:FindFirstChild("section-search-btn")
		local searchRow  = section:FindFirstChild("section-search-root")
		if searchBtn and searchRow then
			track(searchBtn.MouseButton1Click:Connect(function()
				local shown = searchRow.Size.Y.Offset > 1
				tw(searchRow, FAST, { Size = UDim2.new(1, 0, 0, shown and 0 or 29) })
				if not shown then
					local bar = searchRow:FindFirstChild("section-search")
					local hold = bar and bar:FindFirstChild("section-value-holder")
					local box = hold and hold:FindFirstChild("search-value")
					if box then task.defer(function() pcall(function() box:CaptureFocus() end) end) end
				end
				task.delay(0.18, function()
					if chevron and math.abs(chevron.Rotation) < 45 then
						section.Size = UDim2.new(section.Size.X.Scale, section.Size.X.Offset, 0, expanded())
					end
				end)
			end))
		end

		-- фильтр виджетов внутри секции
		local bar = searchRow and searchRow:FindFirstChild("section-search")
		local hold = bar and bar:FindFirstChild("section-value-holder")
		local box = hold and hold:FindFirstChild("search-value")
		if box then
			track(box:GetPropertyChangedSignal("Text"):Connect(function()
				local q = box.Text:lower()
				for _, w in ipairs(section:GetChildren()) do
					local label = w.Name:match("^[%a]+%-input%-(.+)$") or w.Name:match("^input%-checkbox%-(.+)$")
					if label then
						w.Visible = (q == "") or label:lower():find(q, 1, true) ~= nil
					end
				end
				task.defer(function()
					if not chevron or math.abs(chevron.Rotation) < 45 then
						section.Size = UDim2.new(section.Size.X.Scale, section.Size.X.Offset, 0, expanded())
					end
				end)
			end))
		end
	end

	for _, d in ipairs(content:GetDescendants()) do
		if d:IsA("Frame") and d.Name:match("^section%-container%-") then wire(d) end
	end
end

--------------------------------------------------------------- дропдауны
do
	for _, d in ipairs(content:GetDescendants()) do
		if d.Name == "select-value" and d:IsA("Frame") then
			local btn  = d:FindFirstChild("select-open-btn")
			local ico  = btn and btn:FindFirstChild("select-open-ico")
			local drop = d:FindFirstChild("selected-holder")
			local wrap = d.Parent and d.Parent.Parent          -- select-input-*
			if btn and drop and wrap then
				local openHeight = drop.Size.Y.Offset
				if openHeight <= 0 then openHeight = 160 end
				drop.Size = UDim2.new(1, 0, 0, 0)
				drop.Visible = false
				drop.GroupTransparency = 1

				track(btn.MouseButton1Click:Connect(function()
					local isOpen = drop.Visible and drop.Size.Y.Offset > 1
					if isOpen then
						wrap.ZIndex = 1
						if ico then tw(ico, MED, { Rotation = 0 }) end
						local t = tw(drop, MED, { Size = UDim2.new(1, 0, 0, 0), GroupTransparency = 1 })
						t.Completed:Once(function() drop.Visible = false end)
					else
						wrap.ZIndex = 20
						drop.Visible = true
						if ico then tw(ico, MED, { Rotation = 180 }) end
						tw(drop, MED, { Size = UDim2.new(1, 0, 0, openHeight), GroupTransparency = 0 })
					end
				end))

				-- подсветка и выбор опции
				local listFrame = drop:FindFirstChild("selected-container")
				if listFrame then
					for _, row in ipairs(listFrame:GetChildren()) do
						local ob = row:FindFirstChild("option-select-btn")
						if ob then
							track(ob.MouseButton1Click:Connect(function()
								local label = row:FindFirstChild("option-label")
								if label and emitBound(wrap, label.Text) then return end

								-- Если внешний скрипт этот dropdown ещё не bind-нул,
								-- оставляем автономное single-select поведение.
								for _, other in ipairs(listFrame:GetChildren()) do
									if other:FindFirstChild("option-select-btn") then
										other.BackgroundTransparency = (other == row) and 0 or 1
									end
								end
								local holder = d:FindFirstChild("select-value-holder")
								local value = holder and holder:FindFirstChild("selected-value")
								if value and label then value.Text = label.Text end
							end))
							track(ob.MouseEnter:Connect(function()
								if row.BackgroundTransparency > 0.1 then
									tw(row, FAST, { BackgroundTransparency = 0.85 })
								end
							end))
							track(ob.MouseLeave:Connect(function()
								if row.BackgroundTransparency > 0.1 then
									tw(row, FAST, { BackgroundTransparency = 1 })
								end
							end))
						end
					end
				end
			end
		end
	end
end

---------------------------------------------------------- priority / trello
-- Эти контролы визуально похожи на dropdown, но внутри уже лежат draggable
-- строки с UIDragDetector. Статический drag оставляем движку, здесь подключаем
-- раскрытие/закрытие списка.
do
	for _, d in ipairs(content:GetDescendants()) do
		if d.Name == "trello-value" and d:IsA("Frame") then
			local btn = d:FindFirstChild("trello-open-btn")
			local ico = btn and btn:FindFirstChild("trello-open-ico")
			local drop = d:FindFirstChild("trello-options-holder")
			if btn and drop then
				local openHeight = drop.Size.Y.Offset > 0 and drop.Size.Y.Offset or 190
				drop.Size = UDim2.new(1, 0, 0, 0)
				drop.Visible = false
				drop.GroupTransparency = 1
				track(btn.MouseButton1Click:Connect(function()
					local opening = not drop.Visible or drop.Size.Y.Offset <= 1
					if opening then
						drop.Visible = true
						if ico then tw(ico, MED, { Rotation = 180 }) end
						tw(drop, MED, { Size = UDim2.new(1, 0, 0, openHeight), GroupTransparency = 0 })
					else
						if ico then tw(ico, MED, { Rotation = 0 }) end
						local t = tw(drop, MED, { Size = UDim2.new(1, 0, 0, 0), GroupTransparency = 1 })
						t.Completed:Once(function() drop.Visible = false end)
					end
				end))
			end
		end
	end
end

---------------------------------------------------------------- чекбоксы
do
	for _, d in ipairs(content:GetDescendants()) do
		if d.Name == "checkbox-box" and d:IsA("Frame") then
			local btn = d:FindFirstChild("checkbox-btn")
			local mark = d:FindFirstChild("checkbox-box-checked")
			local wrap = widgetAncestor(d, "input-checkbox-")
			if btn and mark then
				track(btn.MouseButton1Click:Connect(function()
					local on = mark.GroupTransparency < 0.5
					local nextState = not on
					tw(mark, FAST, { GroupTransparency = nextState and 0 or 1 })
					emitBound(wrap, nextState)
				end))
			end
		end
	end
end

----------------------------------------------------------------- слайдеры
do
	for _, d in ipairs(content:GetDescendants()) do
		if d.Name == "bar-container" and d:IsA("Frame") then
			local btn = d:FindFirstChild("bar-btn")
			local bar = d:FindFirstChild("bar")
			local row = d.Parent
			local wrap = widgetAncestor(d, "slider-input-")
			local valueMain = row and row:FindFirstChild("slider-value-main")
			local vHold = valueMain and valueMain:FindFirstChild("slider-value-holder")
			local vBox  = vHold and vHold:FindFirstChild("slider-value")
			if btn and bar then
				local dragging = false
				local function apply(x)
					local a = math.clamp((x - d.AbsolutePosition.X) / math.max(1, d.AbsoluteSize.X), 0, 1)
					local control = wrap and bindings[wrap]
					if control and control._FromAlpha then
						control:_FromAlpha(a)
						return
					end
					bar.Size = UDim2.new(a, 0, 0, bar.Size.Y.Offset)
					if vBox then vBox.Text = tostring(math.floor(a * 100 + 0.5)) end
				end
				track(btn.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1
					or input.UserInputType == Enum.UserInputType.Touch then
						dragging = true; apply(input.Position.X)
					end
				end))
				track(UserInputService.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1
					or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
				end))
				track(UserInputService.InputChanged:Connect(function(input)
					if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
					              or input.UserInputType == Enum.UserInputType.Touch) then
						apply(input.Position.X)
					end
				end))
			end
		end
	end
end

------------------------------------------------------- глобальный поиск
do
	local searchBox
	local sr = top:FindFirstChild("top-search-root")
	if sr then searchBox = sr:FindFirstChild("top-search-box") end

	local function setOpen(state)
		if not searchRoot then return end
		if state then
			searchRoot.Visible = true
			tw(searchRoot, FAST, { GroupTransparency = 0 })
		else
			local t = tw(searchRoot, FAST, { GroupTransparency = 1 })
			t.Completed:Once(function()
				if searchRoot.GroupTransparency > 0.9 then searchRoot.Visible = false end
			end)
		end
	end

	if searchBox then
		track(searchBox.Focused:Connect(function() setOpen(true) end))
		track(searchBox:GetPropertyChangedSignal("Text"):Connect(function()
			local q = searchBox.Text:lower()
			local holder = searchRoot and searchRoot:FindFirstChild("search-holder")
			local list = holder and holder:FindFirstChild("search-container")
			if not list then return end
			for _, entry in ipairs(list:GetChildren()) do
				if entry:IsA("GuiObject") then
					entry.Visible = (q == "") or entry.Name:lower():find(q, 1, true) ~= nil
				end
			end
		end))
	end

	local holder2 = searchRoot and searchRoot:FindFirstChild("search-holder")
	local closeBtn = holder2 and holder2:FindFirstChild("search-close-btn")
	if closeBtn then
		track(closeBtn.MouseButton1Click:Connect(function()
			setOpen(false)
			if searchBox then searchBox:ReleaseFocus() end
		end))
	end

	-- Результаты поиска уже содержат страницу/секцию в своём статическом
	-- дереве. Подключаем их кнопки, не добавляя и не переставляя UI-узлы.
	local list = holder2 and holder2:FindFirstChild("search-container")
	if list then
		for _, entry in ipairs(list:GetChildren()) do
			if entry:IsA("GuiObject") then
				local btn = entry:FindFirstChild(entry.Name .. "-btn", true)
				local pageLabel = entry:FindFirstChild(entry.Name .. "-page", true)
				local sectionLabel = entry:FindFirstChild(entry.Name .. "-section", true)
				if btn and btn:IsA("GuiButton") and pageLabel and pageLabel:IsA("TextLabel") then
					track(btn.MouseButton1Click:Connect(function()
						local pageName = pageLabel.Text:gsub("<.->", "")
						local sectionName = sectionLabel and sectionLabel:IsA("TextLabel")
							and sectionLabel.Text:gsub("<.->", "") or nil

						if selectPage then selectPage(pageName) end
						setOpen(false)
						if searchBox then searchBox:ReleaseFocus() end

						task.defer(function()
							local page = pages[pageName]
							local scroll = page and page:FindFirstChild("content-page-holder")
							local section = page and sectionName
								and page:FindFirstChild("section-container-" .. sectionName, true)
							if scroll and scroll:IsA("ScrollingFrame") and section and section:IsA("GuiObject") then
								local y = section.AbsolutePosition.Y - scroll.AbsolutePosition.Y
									+ scroll.CanvasPosition.Y - 5
								scroll.CanvasPosition = Vector2.new(scroll.CanvasPosition.X, math.max(0, y))
							end
						end)
					end))
				end
			end
		end
	end

	track(UserInputService.InputBegan:Connect(function(input, gpe)
		if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
		local ctrl = UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
			or UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
		if input.KeyCode == Enum.KeyCode.K and ctrl then
			local opening = not (searchRoot and searchRoot.Visible and searchRoot.GroupTransparency < 0.5)
			setOpen(opening)
			if searchBox then
				if opening then
					task.defer(function() pcall(function() searchBox:CaptureFocus() end) end)
				else
					searchBox:ReleaseFocus()
				end
			end
		elseif input.KeyCode == Enum.KeyCode.Escape then
			setOpen(false)
			if searchBox then searchBox:ReleaseFocus() end
		elseif not gpe and input.KeyCode == Enum.KeyCode.LeftControl then
			-- Ctrl прячет/показывает окно, как в оригинале
		end
	end))
end

--------------------------------------------------------- кнопка скрытия
do
	local etc
	for _, g in ipairs(roots) do
		if g.Name:find("%[ETC%]") then etc = g end
	end
	local hide = etc and etc:FindFirstChild("btn-hide")
	if hide then
		track(hide.MouseButton1Click:Connect(function() root.Visible = not root.Visible end))
	end
end

--==============================================================================

--  PUBLIC API / BINDING LAYER
--
--  Пример использования из отдельного скрипта:
--    local UI = loadstring(game:HttpGet(URL))()
--    local sec = UI:Page("Lobby"):Section("Sprite Crafter")
--    sec:Toggle({ Name="Auto Craft Sprite", Default=false,
--                 Callback=function(v) print(v) end }, "AutoCraft")
--    local dd = sec:Dropdown({ Name="Select Sprite", Options={"Red","Blue"},
--                              Callback=function(v) print(v) end }, "Sprite")
--    dd:UpdateSelection("Red")
--
--  В отличие от обычной UI-library, Page/Section/Toggle/... здесь НЕ создают
--  второй дизайн: они bind-ят уже существующие узлы точного снимка v3.

local Options, ByName = {}, {}

local function findNamedClass(scope, name, className)
	if scope.Name == name and scope:IsA(className) then return scope end
	for _, d in ipairs(scope:GetDescendants()) do
		if d.Name == name and d:IsA(className) then return d end
	end
	return nil
end

local function findUnique(scope, name)
	local found
	if scope.Name == name then found = scope end
	for _, d in ipairs(scope:GetDescendants()) do
		if d.Name == name then
			if found and found ~= d then return nil, "ambiguous" end
			found = d
		end
	end
	return found, found and nil or "missing"
end

local function callbackAsync(fn, value)
	if type(fn) ~= "function" then return end
	task.spawn(function()
		local ok, err = pcall(fn, value)
		if not ok then warn("NousigiHubUI callback: " .. tostring(err)) end
	end)
end

local function fireControl(control, value)
	control.Value = value
	if control.Class == "Toggle" then control.State = value end
	callbackAsync(control.Settings and control.Settings.Callback, value)
	if control._Listeners then
		for _, fn in ipairs(control._Listeners) do callbackAsync(fn, value) end
	end
end

local CommonMethods = {}
function CommonMethods:SetCallback(fn)
	self.Settings.Callback = fn
	return self
end
function CommonMethods:OnChanged(fn)
	if type(fn) == "function" then
		self._Listeners = self._Listeners or {}
		self._Listeners[#self._Listeners + 1] = fn
	end
	return self
end
function CommonMethods:SetVisibility(state)
	self.Instance.Visible = not not state
	return self
end
function CommonMethods:GetInstance() return self.Instance end

local ToggleMethods = setmetatable({}, { __index = CommonMethods })
function ToggleMethods:_SetVisual(state, animate)
	self.State, self.Value = not not state, not not state
	if self._Mark then
		if animate then tw(self._Mark, FAST, { GroupTransparency = self.State and 0 or 1 })
		else self._Mark.GroupTransparency = self.State and 0 or 1 end
	end
end
function ToggleMethods:_FromUI(state)
	self.State, self.Value = not not state, not not state
	fireControl(self, self.State)
end
function ToggleMethods:UpdateState(state)
	self:_SetVisual(state, true)
	fireControl(self, self.State)
	return self
end
function ToggleMethods:SetState(state, silent)
	self:_SetVisual(state, false)
	if not silent then fireControl(self, self.State) end
	return self
end
function ToggleMethods:GetState() return self.State end
function ToggleMethods:Toggle() return self:UpdateState(not self.State) end
function ToggleMethods:UpdateName(name)
	local label = findNamedClass(self.Instance, "checkbox-title", "TextLabel")
	if label then label.Text = tostring(name) end
	return self
end

local SliderMethods = setmetatable({}, { __index = CommonMethods })
local function roundValue(value, precision)
	precision = math.max(0, math.floor(tonumber(precision) or 0))
	if precision == 0 then return math.round(value) end
	local p = 10 ^ precision
	return math.round(value * p) / p
end
function SliderMethods:_SetVisual(value)
	local min, max = self.Minimum, self.Maximum
	value = roundValue(math.clamp(tonumber(value) or min, min, max), self.Precision)
	self.Value = value
	local alpha = (max == min) and 0 or ((value - min) / (max - min))
	if self._Bar then
		self._Bar.Size = UDim2.new(alpha, 0, self._Bar.Size.Y.Scale, self._Bar.Size.Y.Offset)
	end
	if self._ValueBox then
		local text
		if self.Precision > 0 then text = string.format("%." .. self.Precision .. "f", value)
		else text = tostring(math.round(value)) end
		self._ValueBox.Text = text .. (self.Suffix or "")
	end
	return value
end
function SliderMethods:_FromAlpha(alpha)
	local value = self.Minimum + (self.Maximum - self.Minimum) * math.clamp(alpha, 0, 1)
	value = self:_SetVisual(value)
	fireControl(self, value)
end
function SliderMethods:UpdateValue(value)
	value = self:_SetVisual(value)
	fireControl(self, value)
	return self
end
function SliderMethods:SetValue(value, silent)
	value = self:_SetVisual(value)
	if not silent then fireControl(self, value) end
	return self
end
function SliderMethods:GetValue() return self.Value end
function SliderMethods:UpdateName(name)
	local label = findNamedClass(self.Instance, "slider-title", "TextLabel")
	if label then label.Text = tostring(name) end
	return self
end

local DropdownMethods = setmetatable({}, { __index = CommonMethods })
local function dropdownRows(control)
	local rows = {}
	if not control._List then return rows end
	for _, row in ipairs(control._List:GetChildren()) do
		local label = row:IsA("GuiObject") and findNamedClass(row, "option-label", "TextLabel")
		local btn = row:IsA("GuiObject") and findNamedClass(row, "option-select-btn", "TextButton")
		if label and btn then rows[#rows + 1] = { Row = row, Label = label, Button = btn } end
	end
	return rows
end
local function dropdownHas(control, name)
	for _, data in ipairs(dropdownRows(control)) do
		if data.Label.Text == name then return true end
	end
	return false
end
function DropdownMethods:_ValueFromSelection()
	if self.Multi then
		local out = {}
		for name, selected in pairs(self._Selected) do if selected then out[name] = true end end
		return out
	end
	for _, data in ipairs(dropdownRows(self)) do
		if self._Selected[data.Label.Text] then return data.Label.Text end
	end
	return nil
end
function DropdownMethods:_ApplyVisual()
	local shown = {}
	for _, data in ipairs(dropdownRows(self)) do
		local selected = self._Selected[data.Label.Text] == true
		data.Row.BackgroundTransparency = selected and 0 or 1
		if selected then shown[#shown + 1] = data.Label.Text end
	end
	if self._ValueBox then self._ValueBox.Text = table.concat(shown, ", ") end
	self.Value = self:_ValueFromSelection()
	return self.Value
end
function DropdownMethods:_FromUI(name)
	if not dropdownHas(self, name) then return end
	if self.Multi then
		local was = self._Selected[name] == true
		if was and self.Required then
			local n = 0
			for _, v in pairs(self._Selected) do if v then n = n + 1 end end
			if n <= 1 then return end
		end
		self._Selected[name] = not was
	else
		table.clear(self._Selected)
		self._Selected[name] = true
	end
	local value = self:_ApplyVisual()
	fireControl(self, value)
end
function DropdownMethods:_SetSelection(value, silent)
	local rows = dropdownRows(self)
	local wanted = {}
	if type(value) == "number" then
		local data = rows[math.floor(value)]
		if data then wanted[data.Label.Text] = true end
	elseif type(value) == "string" then
		wanted[value] = true
	elseif type(value) == "table" then
		for _, name in ipairs(value) do wanted[tostring(name)] = true end
		for name, selected in pairs(value) do
			if type(name) == "string" and selected then wanted[name] = true end
		end
	end

	local anyValid = false
	for name in pairs(wanted) do if dropdownHas(self, name) then anyValid = true break end end
	if next(wanted) and not anyValid then
		self._PendingValue = value
		return self
	end

	table.clear(self._Selected)
	for _, data in ipairs(rows) do
		if wanted[data.Label.Text] then
			self._Selected[data.Label.Text] = true
			if not self.Multi then break end
		end
	end
	self._PendingValue = nil
	local result = self:_ApplyVisual()
	if not silent then fireControl(self, result) end
	return self
end
function DropdownMethods:UpdateSelection(value) return self:_SetSelection(value, false) end
function DropdownMethods:SetSelection(value, silent) return self:_SetSelection(value, silent == true) end
function DropdownMethods:GetOptions()
	local out = {}
	for _, data in ipairs(dropdownRows(self)) do out[data.Label.Text] = self._Selected[data.Label.Text] == true end
	return out
end
function DropdownMethods:GetValue() return self.Value end
function DropdownMethods:IsOption(name) return dropdownHas(self, tostring(name)) end
function DropdownMethods:ClearOptions()
	for _, data in ipairs(dropdownRows(self)) do data.Row:Destroy() end
	table.clear(self._Selected)
	self.Value = self.Multi and {} or nil
	if self._ValueBox then self._ValueBox.Text = "" end
	return self
end
function DropdownMethods:_AddOption(name, index)
	name = tostring(name)
	if dropdownHas(self, name) or not self._List then return end
	local row = Instance.new("Frame")
	row.Name = name:lower()
	row.Size = UDim2.new(1, -10, 0, 25)
	row.BackgroundTransparency = 1
	row.LayoutOrder = index or 1

	local corner = Instance.new("UICorner")
	corner.Name = "option-corner"
	corner.CornerRadius = UDim.new(0, 4)
	corner.Parent = row

	local label = Instance.new("TextLabel")
	label.Name = "option-label"
	label.Size = UDim2.new(1, -10, 1, 0)
	label.Position = UDim2.fromOffset(5, 0)
	label.BackgroundTransparency = 1
	label.Text = name
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextSize = 16
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextTruncate = Enum.TextTruncate.SplitWord
	label.RichText = true
	label.FontFace = F("rbxasset://fonts/families/Code.json", "Medium", "Normal")
	label.Parent = row

	local btn = Instance.new("TextButton")
	btn.Name = "option-select-btn"
	btn.Size = UDim2.fromScale(1, 1)
	btn.BackgroundTransparency = 1
	btn.Text = ""
	btn.Parent = row
	row.Parent = self._List

	track(btn.MouseButton1Click:Connect(function() self:_FromUI(name) end))
	track(btn.MouseEnter:Connect(function()
		if not self._Selected[name] then tw(row, FAST, { BackgroundTransparency = 0.85 }) end
	end))
	track(btn.MouseLeave:Connect(function()
		if not self._Selected[name] then tw(row, FAST, { BackgroundTransparency = 1 }) end
	end))
end
function DropdownMethods:InsertOptions(options)
	if type(options) ~= "table" then return self end
	for i, name in ipairs(options) do self:_AddOption(name, i) end
	if self._PendingValue ~= nil then
		local pending = self._PendingValue
		self._PendingValue = nil
		self:_SetSelection(pending, false)
	end
	return self
end
function DropdownMethods:RemoveOptions(options)
	if type(options) ~= "table" then return self end
	local remove = {}
	for _, name in ipairs(options) do remove[tostring(name)] = true end
	for _, data in ipairs(dropdownRows(self)) do
		if remove[data.Label.Text] then
			self._Selected[data.Label.Text] = nil
			data.Row:Destroy()
		end
	end
	self:_ApplyVisual()
	return self
end
function DropdownMethods:UpdateName(name)
	local label = findNamedClass(self.Instance, "select-title", "TextLabel")
	if label then label.Text = tostring(name) end
	return self
end

local PriorityMethods = setmetatable({}, { __index = CommonMethods })
local function priorityRows(control)
	local rows = {}
	if not control._List then return rows end
	for _, row in ipairs(control._List:GetChildren()) do
		if row:IsA("Frame") then
			local box = findNamedClass(row, "trello-value", "TextBox")
			local label = findNamedClass(row, "trello-value-text", "TextLabel")
			if box then rows[#rows + 1] = { Row=row, Box=box, Label=label, Name=row.Name } end
		end
	end
	return rows
end
function PriorityMethods:GetValues()
	local values = {}
	for _, data in ipairs(priorityRows(self)) do values[data.Name] = tonumber(data.Box.Text) or 0 end
	return values
end
function PriorityMethods:GetOrder()
	local rows = priorityRows(self)
	table.sort(rows, function(a, b)
		local av, bv = tonumber(a.Box.Text) or 0, tonumber(b.Box.Text) or 0
		if av == bv then return a.Name < b.Name end
		return av > bv
	end)
	local order = {}
	for i, data in ipairs(rows) do order[i] = data.Name end
	return order
end
function PriorityMethods:_Refresh()
	for _, data in ipairs(priorityRows(self)) do
		local value = tonumber(data.Box.Text) or 0
		if data.Label then data.Label.Text = ("<b>%s</b>. %s"):format(tostring(value), data.Name) end
	end
	local order = self:GetOrder()
	if self._ValueBox then self._ValueBox.Text = table.concat(order, " > ") end
	self.Value = self:GetValues()
	return self.Value
end
function PriorityMethods:SetValues(values, silent)
	if type(values) ~= "table" then return self end
	for _, data in ipairs(priorityRows(self)) do
		if values[data.Name] ~= nil then data.Box.Text = tostring(values[data.Name]) end
	end
	local result = self:_Refresh()
	if not silent then fireControl(self, result) end
	return self
end
function PriorityMethods:UpdateValues(values) return self:SetValues(values, false) end
function PriorityMethods:SetOrder(order, silent)
	if type(order) ~= "table" then return self end
	local values, n = {}, #order
	for i, name in ipairs(order) do values[tostring(name)] = n - i + 1 end
	return self:SetValues(values, silent)
end
function PriorityMethods:UpdateOrder(order) return self:SetOrder(order, false) end
function PriorityMethods:UpdateName(name)
	local label = findNamedClass(self.Instance, "trello-title", "TextLabel")
	if label then label.Text = tostring(name) end
	return self
end

local ButtonMethods = setmetatable({}, { __index = CommonMethods })
function ButtonMethods:UpdateName(name)
	local label = findNamedClass(self.Instance, "button-title", "TextLabel")
	if label then label.Text = tostring(name) end
	return self
end

local InputMethods = setmetatable({}, { __index = CommonMethods })
function InputMethods:GetInput() return self._Box and self._Box.Text or "" end
function InputMethods:UpdateText(text)
	text = tostring(text or "")
	if self._Box then self._Box.Text = text end
	self.Value = text
	fireControl(self, text)
	return self
end
function InputMethods:SetText(text, silent)
	text = tostring(text or "")
	if self._Box then self._Box.Text = text end
	self.Value = text
	if not silent then fireControl(self, text) end
	return self
end
function InputMethods:UpdatePlaceholder(text)
	if self._Box then self._Box.PlaceholderText = tostring(text or "") end
	return self
end
function InputMethods:UpdateName(name)
	local label = findNamedClass(self.Instance, "box-title", "TextLabel")
	if label then label.Text = tostring(name) end
	return self
end

local KeybindMethods = setmetatable({}, { __index = CommonMethods })
local function keyDisplay(key)
	if key == Enum.KeyCode.LeftControl then return "L-Ctrl" end
	if key == Enum.KeyCode.RightControl then return "R-Ctrl" end
	if key == Enum.KeyCode.LeftShift then return "L-Shift" end
	if key == Enum.KeyCode.RightShift then return "R-Shift" end
	return key and key.Name or "None"
end
function KeybindMethods:Bind(key)
	if type(key) == "string" then
		local ok, resolved = pcall(function() return Enum.KeyCode[key] end)
		if ok then key = resolved end
	end
	if typeof(key) == "EnumItem" and key.EnumType == Enum.KeyCode then self.BindValue = key end
	if self._Label then self._Label.Text = keyDisplay(self.BindValue) end
	return self
end
function KeybindMethods:GetBind() return self.BindValue end
function KeybindMethods:Unbind()
	self.BindValue = nil
	if self._Label then self._Label.Text = "None" end
	return self
end
function KeybindMethods:UpdateName(name)
	local label = findNamedClass(self.Instance, "bind-title", "TextLabel")
	if label then label.Text = tostring(name) end
	return self
end

local LabelMethods = setmetatable({}, { __index = CommonMethods })
function LabelMethods:UpdateText(text)
	if self._Label then self._Label.Text = tostring(text or "") end
	self.Value = tostring(text or "")
	return self
end
LabelMethods.UpdateBody = LabelMethods.UpdateText

local function registerControl(control, flag)
	bindings[control.Instance] = control
	local name = control.Instance.Name
	ByName[name] = ByName[name] or {}
	if not table.find(ByName[name], control) then ByName[name][#ByName[name] + 1] = control end
	if flag then
		control.Flag = flag
		Options[flag] = control
	end
	return control
end

local function makeToggle(node, settings)
	local mark = findNamedClass(node, "checkbox-box-checked", "CanvasGroup")
	local c = setmetatable({ Class="Toggle", Instance=node, Settings=settings, _Mark=mark }, { __index=ToggleMethods })
	c.State = mark and mark.GroupTransparency < 0.5 or false
	c.Value = c.State
	if settings.Default ~= nil then c:_SetVisual(settings.Default, false) end
	return c
end

local function makeSlider(node, settings)
	local bar = findNamedClass(node, "bar", "Frame")
	local box = findNamedClass(node, "slider-value", "TextBox")
	local min = tonumber(settings.Minimum or settings.Min) or 0
	local max = tonumber(settings.Maximum or settings.Max) or 100
	if max < min then min, max = max, min end
	local c = setmetatable({ Class="Slider", Instance=node, Settings=settings, _Bar=bar, _ValueBox=box,
		Minimum=min, Maximum=max, Precision=math.max(0, math.floor(tonumber(settings.Precision) or 0)),
		Suffix=settings.Suffix or "" }, { __index=SliderMethods })
	local initial = tonumber(settings.Default)
	if initial ~= nil then c:_SetVisual(initial)
	else c.Value = tonumber(box and box.Text) or min end
	if box then
		track(box.FocusLost:Connect(function()
			local raw = box.Text:gsub("[^%d%.%-]", "")
			local value = tonumber(raw)
			if value then c:UpdateValue(value) else c:_SetVisual(c.Value) end
		end))
	end
	return c
end

local function makeDropdown(node, settings)
	local value = findNamedClass(node, "selected-value", "TextBox")
	local list = findNamedClass(node, "selected-container", "ScrollingFrame")
	local c = setmetatable({ Class="Dropdown", Instance=node, Settings=settings, _ValueBox=value, _List=list,
		_Selected={}, Multi=settings.Multi == true, Required=settings.Required == true }, { __index=DropdownMethods })
	for _, data in ipairs(dropdownRows(c)) do
		if data.Row.BackgroundTransparency < 0.5 then c._Selected[data.Label.Text] = true end
	end
	c:_ApplyVisual()
	if settings.Options ~= nil then c:ClearOptions():InsertOptions(settings.Options) end
	if settings.Default ~= nil then c:_SetSelection(settings.Default, true) end
	return c
end

local function makeButton(node, settings)
	local c = setmetatable({ Class="Button", Instance=node, Settings=settings }, { __index=ButtonMethods })
	local btn = findNamedClass(node, "button", "TextButton")
	if btn then track(btn.MouseButton1Click:Connect(function() fireControl(c, true) end)) end
	return c
end

local function makePriority(node, settings)
	local list = findNamedClass(node, "trello-options-container", "ScrollingFrame")
	local value = findNamedClass(node, "selected-value", "TextBox")
	local c = setmetatable({ Class="Priority", Instance=node, Settings=settings, _List=list, _ValueBox=value }, { __index=PriorityMethods })
	for _, data in ipairs(priorityRows(c)) do
		track(data.Box.FocusLost:Connect(function()
			local result = c:_Refresh()
			fireControl(c, result)
		end))
	end
	if settings.Default ~= nil then c:SetValues(settings.Default, true) else c.Value = c:GetValues() end
	return c
end

local function makeInput(node, settings)
	local box = findNamedClass(node, "box-value", "TextBox")
	local c = setmetatable({ Class="Input", Instance=node, Settings=settings, _Box=box }, { __index=InputMethods })
	if box then
		if settings.Default ~= nil then box.Text = tostring(settings.Default) end
		if settings.Placeholder ~= nil then box.PlaceholderText = tostring(settings.Placeholder) end
		c.Value = box.Text
		track(box.FocusLost:Connect(function() fireControl(c, box.Text) end))
		track(box:GetPropertyChangedSignal("Text"):Connect(function()
			c.Value = box.Text
			callbackAsync(c.Settings and (c.Settings.onChanged or c.Settings.OnChanged), box.Text)
		end))
	end
	return c
end

local function makeKeybind(node, settings)
	local label = findNamedClass(node, "bind-value", "TextLabel")
	local btn = findNamedClass(node, "bind-btn", "TextButton")
	local c = setmetatable({ Class="Keybind", Instance=node, Settings=settings, _Label=label,
		BindValue=settings.Default or Enum.KeyCode.LeftControl, _Capturing=false, _Pressed=false, _Chorded=false }, { __index=KeybindMethods })
	c:Bind(c.BindValue)
	if btn then
		track(btn.MouseButton1Click:Connect(function()
			c._Capturing = true
			if label then label.Text = "..." end
		end))
	end
	track(UserInputService.InputBegan:Connect(function(input, gpe)
		if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
		if c._Capturing then
			c._Capturing = false
			c:Bind(input.KeyCode)
			return
		end
		if input.KeyCode == c.BindValue and not gpe then
			c._Pressed, c._Chorded = true, false
		elseif c._Pressed then
			c._Chorded = true
		end
	end))
	track(UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == c.BindValue and c._Pressed then
			local fire = not c._Chorded
			c._Pressed, c._Chorded = false, false
			if fire then fireControl(c, c.BindValue) end
		end
	end))
	return c
end

local function makeLabel(node, settings)
	local label = findNamedClass(node, "label-title", "TextLabel")
	local c = setmetatable({ Class="Label", Instance=node, Settings=settings, _Label=label,
		Value=label and label.Text or "" }, { __index=LabelMethods })
	if settings.Name and settings.Text ~= nil then c:UpdateText(settings.Text) end
	return c
end

local PREFIX = {
	Toggle="input-checkbox-", Slider="slider-input-", Dropdown="select-input-",
	Button="button-input-", Input="box-input-", Keybind="bind-input-", Label="label-",
	Priority="trello-input-",
}
local MAKER = {
	Toggle=makeToggle, Slider=makeSlider, Dropdown=makeDropdown, Button=makeButton,
	Input=makeInput, Keybind=makeKeybind, Label=makeLabel, Priority=makePriority,
}

local function bindWidget(scope, kind, settings, flag)
	if type(settings) == "string" then settings = { Name = settings } end
	assert(type(settings) == "table", "NousigiHubUI: settings must be a table or name string")
	local name = settings.Name or (kind == "Label" and settings.Text)
	assert(type(name) == "string" and name ~= "", "NousigiHubUI: " .. kind .. " requires Name")
	local node, why = findUnique(scope, PREFIX[kind] .. name)
	if not node then
		if settings.Optional then return nil end
		error(("NousigiHubUI: %s '%s' is %s in this scope"):format(kind, name, why), 3)
	end

	local c = bindings[node]
	if c then
		c.Settings = settings
		if kind == "Toggle" and settings.Default ~= nil then c:SetState(settings.Default, true)
		elseif kind == "Slider" and settings.Default ~= nil then c:SetValue(settings.Default, true)
		elseif kind == "Dropdown" then
			c.Multi, c.Required = settings.Multi == true, settings.Required == true
			if settings.Options ~= nil then c:ClearOptions():InsertOptions(settings.Options) end
			if settings.Default ~= nil then c:SetSelection(settings.Default, true) end
		elseif kind == "Input" then
			if settings.Default ~= nil then c:SetText(settings.Default, true) end
			if settings.Placeholder ~= nil then c:UpdatePlaceholder(settings.Placeholder) end
		elseif kind == "Keybind" and settings.Default ~= nil then c:Bind(settings.Default) end
		if kind == "Priority" and settings.Default ~= nil then c:SetValues(settings.Default, true) end
		return registerControl(c, flag)
	end

	return registerControl(MAKER[kind](node, settings), flag)
end

local ScopeMethods = {}
function ScopeMethods:Section(settings)
	local name = type(settings) == "table" and settings.Name or settings
	assert(type(name) == "string", "NousigiHubUI: Section requires a name")
	local node, why = findUnique(self.Instance, "section-container-" .. name)
	if not node then error(("NousigiHubUI: Section '%s' is %s in this scope"):format(name, why), 2) end
	return setmetatable({ Instance=node, Name=name, PageName=self.PageName }, { __index=ScopeMethods })
end
function ScopeMethods:Toggle(settings, flag) return bindWidget(self.Instance, "Toggle", settings, flag) end
function ScopeMethods:Slider(settings, flag) return bindWidget(self.Instance, "Slider", settings, flag) end
function ScopeMethods:Dropdown(settings, flag) return bindWidget(self.Instance, "Dropdown", settings, flag) end
function ScopeMethods:Button(settings, flag) return bindWidget(self.Instance, "Button", settings, flag) end
function ScopeMethods:Input(settings, flag) return bindWidget(self.Instance, "Input", settings, flag) end
function ScopeMethods:Keybind(settings, flag) return bindWidget(self.Instance, "Keybind", settings, flag) end
function ScopeMethods:Label(settings, flag) return bindWidget(self.Instance, "Label", settings, flag) end
function ScopeMethods:Priority(settings, flag) return bindWidget(self.Instance, "Priority", settings, flag) end
ScopeMethods.Trello = ScopeMethods.Priority
function ScopeMethods:SetVisibility(state) self.Instance.Visible = not not state; return self end
function ScopeMethods:GetCollapsed()
	local topRow = self.Instance:FindFirstChild("section-top")
	local chip = topRow and topRow:FindFirstChild("section-collapse-root")
	local btn = chip and chip:FindFirstChild("section-collapse-btn")
	return btn and math.abs(btn.Rotation) > 45 or false
end
function ScopeMethods:SetCollapsed(state)
	local layout = self.Instance:FindFirstChildOfClass("UIListLayout")
	local topRow = self.Instance:FindFirstChild("section-top")
	local chip = topRow and topRow:FindFirstChild("section-collapse-root")
	local btn = chip and chip:FindFirstChild("section-collapse-btn")
	if not (layout and btn) then return self end
	btn.Rotation = state and -90 or 0
	local h = state and 27 or math.max(27, layout.AbsoluteContentSize.Y + 2)
	self.Instance.Size = UDim2.new(self.Instance.Size.X.Scale, self.Instance.Size.X.Offset, 0, h)
	return self
end
function ScopeMethods:Select()
	if self.PageName and selectPage then selectPage(self.PageName) end
	return self
end

local API = {
	Version = "3.0",
	StaticNodeCount = #T_ // 4,
	Guis = roots,
	Root = root,
	Pages = pages,
	Objects = objects,
	Options = Options,
	Controls = ByName,
}
function API:Select(name) if selectPage then selectPage(name) end; return self end
function API:Page(name)
	local page = pages[name]
	if not page then error("NousigiHubUI: Page '" .. tostring(name) .. "' not found", 2) end
	return setmetatable({ Instance=page, Name=name, PageName=name }, { __index=ScopeMethods })
end
API.Tab = API.Page
function API:Section(settings) return setmetatable({ Instance=content }, { __index=ScopeMethods }):Section(settings) end
function API:Toggle(settings, flag) return bindWidget(content, "Toggle", settings, flag) end
function API:Slider(settings, flag) return bindWidget(content, "Slider", settings, flag) end
function API:Dropdown(settings, flag) return bindWidget(content, "Dropdown", settings, flag) end
function API:Button(settings, flag) return bindWidget(content, "Button", settings, flag) end
function API:Input(settings, flag) return bindWidget(content, "Input", settings, flag) end
function API:Keybind(settings, flag) return bindWidget(content, "Keybind", settings, flag) end
function API:Label(settings, flag) return bindWidget(content, "Label", settings, flag) end
function API:Priority(settings, flag) return bindWidget(content, "Priority", settings, flag) end
API.Trello = API.Priority
function API:Get(flag)
	if Options[flag] then return Options[flag] end
	local list = ByName[flag]
	return list and #list == 1 and list[1] or nil
end
function API:Find(name)
	name = tostring(name)
	local found
	for _, node in ipairs(objects) do
		if node.Name == name then
			if found and found ~= node then return nil, "ambiguous" end
			found = node
		end
	end
	return found, found and nil or "missing"
end
function API:Destroy()
	for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
	table.clear(conns)
	table.clear(Options)
	table.clear(ByName)
	for _, g in ipairs(roots) do pcall(function() g:Destroy() end) end
	if _G.NousigiHubUI == self then _G.NousigiHubUI = nil end
end
API.Unload = API.Destroy

-- Единственный bind, который нужен самому UI: статический "Toggle UI" работает
-- сразу после загрузки. Повторный bind этого же контрола из внешнего скрипта
-- заменит Settings/Callback, не создавая второй InputBegan listener.
local builtinToggleKey = bindWidget(content, "Keybind", {
	Name = "Toggle UI",
	Default = Enum.KeyCode.LeftControl,
	Callback = function() root.Visible = not root.Visible end,
})

_G.NousigiHubUI = API
return API
