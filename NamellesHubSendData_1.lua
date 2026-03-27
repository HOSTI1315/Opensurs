local function deepCopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepCopy(orig_key)] = deepCopy(orig_value)
        end
        setmetatable(copy, deepCopy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end


_G.embedTemplate = {    
    embeds = {{    
        title = "Nameless Pet Notifier",    
        description = "Pet notification details", -- ДОБАВЛЕНО: обязательное поле description    
        color = 6591981,    
        fields = {    
            {name = "👥 Players:", value = "", inline = true},    
            {name = "🔗 Server Link:", value = "", inline = false},    
            {name = "📱 Job-ID (Mobile):", value = "", inline = false},    
            {name = "💻 Job-ID (PC):", value = "", inline = false},    
            {name = "📲 Join:", value = "", inline = false}    
        },    
        footer = {text = "Premium"}    
    }}    
}    


_G.formatWebhookData = function(models, placeId, jobId, playerCount, maxPlayers)    
    local data = deepCopy(_G.embedTemplate) -- берём копию шаблона    

    local browserLink = "https://nameless-289z.onrender.com/join.html?placeId=" .. tostring(placeId) .. "&jobId=" .. tostring(jobId)    
    local joinScript = 'game:GetService("TeleportService"):TeleportToPlaceInstance(' .. tostring(placeId) .. ',"' .. tostring(jobId) .. '",game.Players.LocalPlayer)'    

    -- Обновляем поля    
    data.embeds[1].fields[1].value = tostring(playerCount) .. "/" .. tostring(maxPlayers)    
    data.embeds[1].fields[2].value = "[Join Server](" .. browserLink .. ")"    
    data.embeds[1].fields[3].value = tostring(jobId)    
    data.embeds[1].fields[4].value = "```" .. tostring(jobId) .. "```"   -- <<< добавил обрамление в ```
    data.embeds[1].fields[5].value = "`" .. joinScript .. "`"    

        
    local names = {}    
    local generations = {}    
    local mutationCounts = {}    
    local rarityCounts = {}    

    for entry in models:gmatch("[^,]+") do    
        local trimmed = entry:match("^%s*(.-)%s*$")    
        local displayName, generation, mutation, rarity = trimmed:match("(.+)%s*Generation:%s*([^%s]+)%s*Mutation:%s*([^%s]+)%s*Rarity:%s*(.+)")    
        if displayName then    
            table.insert(names, displayName)    
            table.insert(generations, generation or "Unknown")    
            mutationCounts[mutation] = (mutationCounts[mutation] or 0) + 1    
            rarityCounts[rarity] = (rarityCounts[rarity] or 0) + 1    
        end    
    end    

    
    local formattedMutations = {}    
    for mutation, count in pairs(mutationCounts) do    
        table.insert(formattedMutations, count > 1 and mutation .. " x" .. count or mutation)    
    end    
    local formattedRarities = {}    
    for rarity, count in pairs(rarityCounts) do    
        table.insert(formattedRarities, count > 1 and rarity .. " x" .. count or rarity)    
    end    

   
    if #names > 0 then    
        table.insert(data.embeds[1].fields, 1, {name = "🪙 Name:", value = table.concat(names, ", "), inline = true})    
    end    
    if #generations > 0 then    
        table.insert(data.embeds[1].fields, 2, {name = "📈 Generation:", value = table.concat(generations, ", "), inline = true})    
    end    
    return data    
end