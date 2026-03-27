-- ts file was generated at discord.gg/25ms


repeat
    wait()
until game:IsLoaded()
local vu1 = getgenv()
local v2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/refs/heads/main/Library"))():start("Tower of Hell", "1.0", true)
local v3 = v2:addTab("Auto Farm")
local v4 = v2:addTab("Bypass")
local v5 = v2:addTab("Teleports")
local v6 = v2:addTab("Misc")
local v7 = cloneref(game:GetService("Players"))
local vu8 = cloneref(game:GetService("ReplicatedStorage"))
local vu9 = v7.LocalPlayer
local v10 = vu9.Character or vu9.CharacterAdded:Wait()
local _ = v10.Humanoid
local vu11 = v10.HumanoidRootPart
v3:addToggle("Auto Farm Coin", "By activating this option you will start farming coins in an AFK way, be careful as there is a chance of being banned!!", "big", false, function(p12)
    if p12 then
        spawn(function()
            while vu1.Settings["Auto Farm Coin"] do
                task.wait()
                vu11.CFrame = game.Workspace.tower.sections.finish.FinishGlow.CFrame
            end
        end)
    end
end)
v3:addToggle("Auto Farm (Sever Hopper)", "By activating this option, every time the script completes the obby, it will teleport to another server (use the save settings and also the auto execute function of its executor!)", "big", false, function(p13)
    if p13 then
        spawn(function()
            while vu1.Settings["Auto Farm (Sever Hopper)"] do
                vu11.CFrame = game.Workspace.tower.sections.finish.FinishGlow.CFrame
                wait(2)
                local v14 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/1962086868/servers/Public?sortOrder=Asc&limit=100"))
                local v15, v16, v17 = pairs(v14.data)
                while true do
                    local v18
                    v17, v18 = v15(v16, v17)
                    if v17 == nil then
                        break
                    end
                    if v18.playing ~= v18.maxPlayers then
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v18.id)
                    end
                end
            end
        end)
    end
end)
v4:addToggle("Bypass", "By activating this option, every time the anti cheat tries to remove you from the game, it will block it, making you immune! This doesn\'t mean there are zero chances of bans!", "big", false, function(p19)
    if p19 then
        local v20 = getreg()
        local v21 = next
        local v22 = nil
        while true do
            local v23
            v22, v23 = v21(v20, v22)
            if v22 == nil then
                break
            end
            if type(v23) == "function" then
                local v24 = getinfo(v23)
                if v24.name == "kick" then
                    if hookfunction(v24.func, function()
                    end) then
                        print("succesfully hooked kick")
                    else
                        print("failed to hook kick")
                    end
                end
            end
        end
        local v25 = vu9.PlayerScripts
        local v26 = v25.LocalScript
        local v27 = v25.LocalScript2
        local v28 = v26.Changed
        local v29 = v27.Changed
        local v30 = next
        local v31, v32 = getconnections(v28)
        while true do
            local v33
            v32, v33 = v30(v31, v32)
            if v32 == nil then
                break
            end
            v33:Disable()
        end
        local v34 = next
        local v35, v36 = getconnections(v29)
        while true do
            local v37
            v36, v37 = v34(v35, v36)
            if v36 == nil then
                break
            end
            v37:Disable()
        end
        v26:Destroy()
        v27:Destroy()
    end
end)
v5:addClick("Teleport End", "By activating this option you will be teleported to the end of the obby", "big", false, function(_)
    vu11.CFrame = game.Workspace.tower.sections.finish.FinishGlow.CFrame
end)
v5:addClick("Teleport Lobby", "By activating this option you will be teleported to the Lobby of the obby", "big", false, function(_)
    vu11.CFrame = game.Workspace.tower.sections.start.center.CFrame
end)
v5:addClick("Teleport Pro Mode", "By activating this option you will be teleported to the pro mode", "big", false, function(_)
    vu11.CFrame = game.Workspace.tower.sections.start.gate.gate.CFrame
end)
v6:addToggle("Give All Tools", "By activating this option you will receive all the Tools available in the game!", "big", false, function(p38)
    if p38 then
        local v39, v40, v41 = pairs(vu9.Backpack:GetDescendants())
        while true do
            local v42
            v41, v42 = v39(v40, v41)
            if v41 == nil then
                break
            end
            if v42:IsA("Tool") then
                v42:Destroy()
            end
        end
        wait()
        local v43, v44, v45 = pairs(vu8.Gear:GetDescendants())
        while true do
            local v46
            v45, v46 = v43(v44, v45)
            if v45 == nil then
                break
            end
            if v46:IsA("Tool") then
                local v47 = v46:Clone()
                wait()
                v47.Parent = vu9.Backpack
            end
        end
    end
end)
v6:addToggle("Remove Kill Parts", "By activating this option you will become immune/remove all the parts that kill, this is just for you!!", "big", false, function(p48)
    if p48 then
        while vu1.Settings["Remove Kill Parts"] do
            task.wait()
            local v49, v50, v51 = pairs(game:GetService("Workspace").tower:GetDescendants())
            while true do
                local v52
                v51, v52 = v49(v50, v51)
                if v51 == nil then
                    break
                end
                if v52:IsA("BoolValue") and v52.Name == "kills" then
                    v52.Parent:Destroy()
                end
            end
        end
    end
end)