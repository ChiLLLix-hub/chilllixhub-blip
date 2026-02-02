local QBCore = nil

-- Initialize QBCore if enabled
if Config.UseQBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

-- Helper function to send chat message
local function SendChatMessage(source, message, color)
    color = color or {0, 255, 0}
    TriggerClientEvent('chat:addMessage', source, {
        color = color,
        multiline = true,
        args = {"[ChiLLLix-Blip]", message}
    })
end

-- Server-side command to refresh all blips for all players
RegisterCommand('refreshblips', function(source, args, rawCommand)
    if source == 0 then
        -- Console command
        TriggerClientEvent('chilllixhub-blip:client:refreshBlips', -1)
        print('^2[ChiLLLix-Blip]^7 All blips refreshed for all players')
    else
        -- Player command (requires admin permission)
        if Config.UseQBCore and QBCore then
            local Player = QBCore.Functions.GetPlayer(source)
            if Player and QBCore.Functions.HasPermission(source, 'admin') then
                TriggerClientEvent('chilllixhub-blip:client:refreshBlips', -1)
                TriggerClientEvent('QBCore:Notify', source, 'All blips refreshed', 'success')
            else
                TriggerClientEvent('QBCore:Notify', source, 'No permission', 'error')
            end
        else
            -- Without QBCore, allow any player (you can add your own permission check)
            if IsPlayerAceAllowed(source, 'command.refreshblips') then
                TriggerClientEvent('chilllixhub-blip:client:refreshBlips', -1)
                SendChatMessage(source, 'All blips refreshed')
            else
                SendChatMessage(source, 'No permission', {255, 0, 0})
            end
        end
    end
end, false)

-- Server-side command to toggle specific blip visibility
RegisterCommand('toggleblip', function(source, args, rawCommand)
    local blipIndex = tonumber(args[1])
    local hideBlip = args[2] == 'true' or args[2] == '1'
    
    if not blipIndex then
        if source == 0 then
            print('^1[ChiLLLix-Blip]^7 Usage: toggleblip <index> <true/false>')
        else
            SendChatMessage(source, 'Usage: /toggleblip <index> <true/false>', {255, 0, 0})
        end
        return
    end
    
    if source == 0 then
        -- Console command
        TriggerClientEvent('chilllixhub-blip:client:toggleBlip', -1, blipIndex, hideBlip)
        print(string.format('^2[ChiLLLix-Blip]^7 Blip %d toggled (hidden: %s)', blipIndex, tostring(hideBlip)))
    else
        -- Player command (requires admin permission)
        if Config.UseQBCore and QBCore then
            local Player = QBCore.Functions.GetPlayer(source)
            if Player and QBCore.Functions.HasPermission(source, 'admin') then
                TriggerClientEvent('chilllixhub-blip:client:toggleBlip', -1, blipIndex, hideBlip)
                TriggerClientEvent('QBCore:Notify', source, string.format('Blip %d toggled', blipIndex), 'success')
            else
                TriggerClientEvent('QBCore:Notify', source, 'No permission', 'error')
            end
        else
            if IsPlayerAceAllowed(source, 'command.toggleblip') then
                TriggerClientEvent('chilllixhub-blip:client:toggleBlip', -1, blipIndex, hideBlip)
                SendChatMessage(source, string.format('Blip %d toggled', blipIndex))
            else
                SendChatMessage(source, 'No permission', {255, 0, 0})
            end
        end
    end
end, false)

-- Event to get all blip configurations (for potential UI/admin panel)
RegisterNetEvent('chilllixhub-blip:server:getBlipConfigs', function()
    TriggerClientEvent('chilllixhub-blip:client:receiveBlipConfigs', source, Config.Blips)
end)

-- Print startup message
local blipCount = #Config.Blips
if Config.UseQBCore then
    print('^2[ChiLLLix-Blip]^7 Server-side loaded with QBCore integration')
else
    print('^2[ChiLLLix-Blip]^7 Server-side loaded')
end
print(string.format('^2[ChiLLLix-Blip]^7 Configured %d blips', blipCount))
