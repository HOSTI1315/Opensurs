local scripts = {
    "https://pastefy.app/Cwi266Rb/raw" -- Ini Sript Dig
}

for _, url in ipairs(scripts) do
    pcall(function()
        loadstring(game:HttpGet(url))()
    end)
end
