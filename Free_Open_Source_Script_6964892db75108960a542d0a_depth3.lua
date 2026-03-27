local RemoteListener = {}

function RemoteListener.CreateListenerTab(Window, Rayfield)
 local ReplicatedStorage = game:GetService("ReplicatedStorage")
 local Tab = Window:CreateTab("Remote Listener", 4483362458)

 local activeListeners = {}

 -- Fungsi untuk format argumen menjadi string rapi
 local function formatArgs(args)
  local parts = {}
  for i, v in ipairs(args) do
   local value
   if typeof(v) == "table" then
    local ok, str = pcall(function()
     return game:GetService("HttpService"):JSONEncode(v)
    end)
    value = ok and str or tostring(v)
   elseif typeof(v) == "Instance" then
    value = v:GetFullName()
   else
    value = tostring(v)
   end
   table.insert(parts, "[" .. i .. "] = " .. value)
  end
  return table.concat(parts, ", ")
 end

 -- Pretty print hasil listen
 local function prettyPrint(remote, args)
  print(string.rep("=", 50))
  print("[REMOTE EVENT FIRED]")
  print("Name:", remote.Name)
  print("Path:", remote:GetFullName())
  print("Arguments:")
  print(formatArgs(args))
  print(string.rep("=", 50))
 end

 Tab:CreateSection("Remote Listeners")

 -- Fungsi membuat toggle listener
 local function CreateListenerToggle(remote)
  Tab:CreateToggle({
   Name = remote:GetFullName(),
   CurrentValue = false,
   Flag = "Listener_" .. remote:GetFullName(),
   Callback = function(enabled)
    if enabled then
     local connection = remote.OnClientEvent:Connect(function(...)
      local args = {...}
      prettyPrint(remote, args)
     end)
     activeListeners[remote] = connection

     Rayfield:Notify({
      Title = "Listener Enabled",
      Content = "Now listening to: " .. remote:GetFullName(),
      Duration = 2
     })
    else
     if activeListeners[remote] then
      activeListeners[remote]:Disconnect()
      activeListeners[remote] = nil
      Rayfield:Notify({
       Title = "Listener Disabled",
       Content = "Stopped listening: " .. remote:GetFullName(),
       Duration = 2
      })
     end
    end
   end
  })
 end

 -- Buat toggle untuk semua RemoteEvent
 for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
  if obj:IsA("RemoteEvent") then
   CreateListenerToggle(obj)
  end
 end

 -- Jika ada RemoteEvent baru muncul
 ReplicatedStorage.DescendantAdded:Connect(function(obj)
  if obj:IsA("RemoteEvent") then
   CreateListenerToggle(obj)
  end
 end)

 return { Tab = Tab, ActiveListeners = activeListeners }
end

return RemoteListener