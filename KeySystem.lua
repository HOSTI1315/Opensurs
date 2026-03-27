--[[
      This File has been automatically renamed by @vyxonq for better readability.
      (Always verify before using)
]]

local rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local mainWindow =
    rayfield:CreateWindow(
    {
        Name = "TNB Key System",
        LoadingTitle = "TNB Key System",
        LoadingSubtitle = "by Vermin",
        ConfigurationSaving = {
            Enabled = false
        }
    }
):CreateTab("Key System", 4483362458)
local keyInputSection = mainWindow:CreateSection("Enter Key")
local enteredKey = nil
mainWindow:CreateInput(
    {
        Name = "Enter Key",
        PlaceholderText = "Enter your key here...",
        RemoveTextAfterFocusLost = false,
        Callback = function(key)
            enteredKey = key
        end
    }
)
mainWindow:CreateButton(
    {
        Name = "Get Key",
        Callback = function()
            setclipboard("https://work.ink/1Zdz/tnbbyvermin")
            rayfield:Notify(
                {
                    Title = "Success",
                    Content = "Key link copied to clipboard!",
                    Duration = 3,
                    Image = 4483362458
                }
            )
        end
    }
)
mainWindow:CreateButton(
    {
        Name = "Submit Key",
        Callback = function()
            if enteredKey then
                local success, response =
                    pcall(
                    function()
                        return game:HttpGet(
                            "https://raw.githubusercontent.com/vermingov/srpv3-script/refs/heads/main/unknown.dat"
                        )
                    end
                )
                if success and response == enteredKey then
                    rayfield:Destroy()
                    loadstring(
                        game:HttpGet(
                            "https://raw.githubusercontent.com/89hbuy2f3bh872d/34rt245yhwerthgertg/refs/heads/main/TN-BY"
                        )
                    )()
                    return
                end
                local successVerify, verifyResponse =
                    pcall(
                    function()
                        return game:HttpGet("https://work.ink/_api/v2/token/isValid/" .. enteredKey)
                    end
                )
                if successVerify then
                    local keyInfo = game:GetService("HttpService"):JSONDecode(verifyResponse)
                    if keyInfo and keyInfo.valid == true and keyInfo.deleted == false and keyInfo.info then
                        if
                            keyInfo.info.token and keyInfo.info.createdAt and keyInfo.info.byIp and keyInfo.info.linkId and
                                keyInfo.info.expiresAfter and
                                keyInfo.info.linkId == 805765
                         then
                            rayfield:Destroy()
                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/89hbuy2f3bh872d/34rt245yhwerthgertg/refs/heads/main/TN-BY"
                                )
                            )()
                            return
                        end
                        rayfield:Notify(
                            {
                                Title = "Invalid Key",
                                Content = "The key structure is invalid. Get your key at https://work.ink/1Zdz/tnbbyvermin",
                                Duration = 6.5,
                                Image = 4483362458
                            }
                        )
                    else
                        rayfield:Notify(
                            {
                                Title = "Invalid Key",
                                Content = "The key you entered is invalid. Get your key at https://work.ink/1Zdz/tnbbyvermin",
                                Duration = 6.5,
                                Image = 4483362458
                            }
                        )
                    end
                else
                    rayfield:Notify(
                        {
                            Title = "Error",
                            Content = "Failed to verify key. Please try again.",
                            Duration = 6.5,
                            Image = 4483362458
                        }
                    )
                end
            end
        end
    }
)
mainWindow:CreateLabel("Vermin Scripts's [Premium Scripts Always]")