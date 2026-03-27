-- ts file was generated at discord.gg/25ms


if game:GetService("CoreGui"):FindFirstChild("ToraScript") then
    game:GetService("CoreGui").ToraScript:Destroy()
end
local v1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/liebertsx/Tora-Library/main/src/librarynew", true))()
local v2 = v1:CreateWindow("Tank Game")
v2:AddFolder("Main"):AddToggle({
    text = "Max Speed",
    flag = "toggle",
    state = false,
    callback = function(p3)
        _G.Speed = p3
        print("Speed: ", p3)
        if p3 then
            Speed()
        end
    end
})
function Speed()
    spawn(function()
        _G.Speed = true
        while _G.Speed do
            wait()
            pcall(function()
                while true do
                    task.wait()
                    local v4 = game.Players.LocalPlayer.Character
                    local v5 = v4.TranslateBy
                    local v6 = game.Players.LocalPlayer.Character
                    if v6 then
                        v6 = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").MoveDirection * tonumber(5) * 0.2 * 0.8
                    end
                    v5(v4, v6)
                    if _G.Speed == false then
                        wait()
                        return
                    end
                end
            end)
        end
    end)
end
local v7 = v2:AddFolder("Upgrade")
local vu8 = game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Tank"):WaitForChild("Upgrade")
local v9, v10, v11 = ipairs({
    {
        flag = "Damage",
        name = "Damage",
        code = "\4"
    },
    {
        flag = "BulletSpeed",
        name = "Bullet Speed",
        code = "\6"
    },
    {
        flag = "MaxHealth",
        name = "Max Health",
        code = "\0"
    },
    {
        flag = "TankSpeed",
        name = "Tank Speed",
        code = "\2"
    },
    {
        flag = "BulletHealth",
        name = "Bullet Health",
        code = "\5"
    },
    {
        flag = "FireRate",
        name = "Fire Rate",
        code = "\7"
    },
    {
        flag = "HealthRegen",
        name = "Health Regen",
        code = "\1"
    },
    {
        flag = "BodyDamage",
        name = "Body Damage",
        code = "\3"
    }
})
while true do
    local vu12
    v11, vu12 = v9(v10, v11)
    if v11 == nil then
        break
    end
    v7:AddToggle({
        text = vu12.name,
        flag = vu12.flag,
        state = false,
        callback = function(p13)
            _G[vu12.flag] = p13
            print(vu12.name .. ": " .. tostring(p13))
            if p13 then
                task.spawn(function()
                    while _G[vu12.flag] do
                        local v14 = {
                            buffer.fromstring(vu12.code)
                        }
                        vu8:FireServer(unpack(v14))
                        task.wait(1)
                    end
                end)
            end
        end
    })
end
v7:AddLabel({
    text = "YouTube: Tora IsMe"
})
v1:Init()
game:GetService("Players").LocalPlayer.PlayerGui.Gui.Screen.Extra.Notifications:Destroy()