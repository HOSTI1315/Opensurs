--────────────────────────────────────────────────────────────────────────────────────
--─██████████████─████████████████───██████████─██████──────────██████─██████████████─
--─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░██─██░░██████████████░░██─██░░░░░░░░░░██─
--─██░░██████░░██─██░░████████░░██───████░░████─██░░░░░░░░░░░░░░░░░░██─██░░██████████─
--─██░░██──██░░██─██░░██────██░░██─────██░░██───██░░██████░░██████░░██─██░░██─────────
--─██░░██████░░██─██░░████████░░██─────██░░██───██░░██──██░░██──██░░██─██░░██████████─
--─██░░░░░░░░░░██─██░░░░░░░░░░░░██─────██░░██───██░░██──██░░██──██░░██─██░░░░░░░░░░██─
--─██░░██████████─██░░██████░░████─────██░░██───██░░██──██████──██░░██─██░░██████████─
--─██░░██─────────██░░██──██░░██───────██░░██───██░░██──────────██░░██─██░░██─────────
--─██░░██─────────██░░██──██░░██████─████░░████─██░░██──────────██░░██─██░░██████████─
--──────────────────────────────────────────────────────────────────────
loadstring(game:HttpGet("https://raw.githubusercontent.com/strongprime/source/main/source", true))()

DaHoodSettings.Prediction = 0.148357

getgenv().Aiming.TargetPart = {"Head", "HumanoidRootPart", "LowerTorso"}

getgenv().Aiming.HitChance = 70

getgenv().Aiming.ShowFOV = false

getgenv().Aiming.FOV = 6.7
-- remove this if u dont wanna get flung
local RunService = game:GetService("RunService")

RunService.Heartbeat:Connect(function()
    pcall(function()
        for i,v in pairs(game.Players:GetChildren()) do
            if v.Name ~= game.Players.LocalPlayer.Name then
                local hrp = v.Character.HumanoidRootPart
                hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)    
                hrp.AssemblyLinearVelocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)   
            end
        end
    end)
end)