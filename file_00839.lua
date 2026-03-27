setfflag("WorldStepMax", "-99999999999999")
wait(1)

queue_on_teleport([[
    wait(3.5)
    setfflag("WorldStepMax", "-1")
]])

game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)