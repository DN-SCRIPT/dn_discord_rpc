RegisterNetEvent('dn_discord_presence:get_data', function()
    local activePlayers = GetPlayers()
    local playerName = GetPlayerName(source)
    local maxServerCapacity = GetConvarInt("sv_maxClients", 48)
    local template = Config.Template

    local replacements = {
        ["{Citizens}"] = #activePlayers .. "/" .. maxServerCapacity,
        ["{ID}"] = source,
        ["{NAME}"] = playerName,
    }

    local pattern = "{(.-)}"
    local result = template:gsub(pattern, function(key)
        return replacements['{' .. key .. '}'] or key
    end)

    TriggerClientEvent('dn_discord_presence:receive_data', source, result)
end)