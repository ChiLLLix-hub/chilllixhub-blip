local QBCore = nil
local createdBlips = {}

-- Initialize QBCore if enabled
if Config.UseQBCore then
    Citizen.CreateThread(function()
        local retries = 0
        local maxRetries = 20 -- Total wait time: 20 retries * 500ms = 10 seconds
        while QBCore == nil and retries < maxRetries do
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            retries = retries + 1
            Citizen.Wait(500)
        end
        if not QBCore then
            print('^1[ChiLLLix-Blip]^7 Warning: Failed to load QBCore after 10 seconds')
        end
    end)
end

-- Function to create a blip with all configuration options
local function CreateConfiguredBlip(blipConfig)
    if blipConfig.hideBlip then
        return nil
    end

    local blip = AddBlipForCoord(blipConfig.coords.x, blipConfig.coords.y, blipConfig.coords.z)
    
    -- Set blip sprite (supports both standard and custom sprites)
    -- For custom sprites: place .ytd texture files in stream/ folder
    -- The blipId will reference the sprite, whether standard or custom
    if blipConfig.blipId then
        SetBlipSprite(blip, blipConfig.blipId)
    end
    
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, blipConfig.scale)
    SetBlipColour(blip, blipConfig.color)
    SetBlipAlpha(blip, blipConfig.opacity)
    SetBlipAsShortRange(blip, blipConfig.shortRange)
    
    -- Add tick on blip if enabled
    if blipConfig.tickOnBlip then
        ShowTickOnBlip(blip, true)
    end
    
    -- Add outline if enabled
    if blipConfig.outline then
        SetBlipShowOutlineIndicator(blip, true)
    end
    
    -- Hide on minimap if enabled
    if blipConfig.hideOnMinimap then
        SetBlipHiddenOnLegend(blip, true)
    end
    
    -- Set blip name
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipConfig.name)
    EndTextCommandSetBlipName(blip)
    
    return blip
end

-- Function to handle blip flashing
local function HandleBlipFlashing(blip, index)
    if not createdBlips[index] or not createdBlips[index].config.flashEnabled or createdBlips[index].config.flashTimer <= 0 then
        return
    end
    
    -- Flash loop: flashEnabled is checked at start only
    -- Runtime config changes require calling refreshBlips to take effect
    -- The loop will stop when the blip is removed, destroyed, or hidden
    Citizen.CreateThread(function()
        while true do
            local blipData = createdBlips[index]
            if not blipData or not DoesBlipExist(blip) or blipData.config.hideBlip then
                break
            end
            
            SetBlipFlashes(blip, true)
            Citizen.Wait(blipData.config.flashTimer)
            
            blipData = createdBlips[index]
            if not blipData or not DoesBlipExist(blip) or blipData.config.hideBlip then
                break
            end
            
            SetBlipFlashes(blip, false)
            Citizen.Wait(blipData.config.flashTimer)
        end
    end)
end

-- Function to initialize all blips from config
local function InitializeBlips()
    for index, blipConfig in ipairs(Config.Blips) do
        local blip = CreateConfiguredBlip(blipConfig)
        if blip then
            createdBlips[index] = {
                blip = blip,
                config = blipConfig
            }
            HandleBlipFlashing(blip, index)
        end
    end
end

-- Function to remove a specific blip
local function RemoveBlipByIndex(index)
    if createdBlips[index] and DoesBlipExist(createdBlips[index].blip) then
        RemoveBlip(createdBlips[index].blip)
        createdBlips[index] = nil
    end
end

-- Function to remove all blips
local function RemoveAllBlips()
    for index, blipData in pairs(createdBlips) do
        if DoesBlipExist(blipData.blip) then
            RemoveBlip(blipData.blip)
        end
    end
    createdBlips = {}
end

-- Function to update blip visibility
local function UpdateBlipVisibility(index, hide)
    if createdBlips[index] then
        local blipData = createdBlips[index]
        if hide then
            if blipData.blip and DoesBlipExist(blipData.blip) then
                RemoveBlip(blipData.blip)
                blipData.blip = nil
            end
        else
            if not blipData.blip or not DoesBlipExist(blipData.blip) then
                blipData.config.hideBlip = false
                local newBlip = CreateConfiguredBlip(blipData.config)
                if newBlip then
                    blipData.blip = newBlip
                    HandleBlipFlashing(newBlip, index)
                end
            end
        end
        blipData.config.hideBlip = hide
    end
end

-- Event to refresh blips (useful for dynamic updates)
RegisterNetEvent('chilllixhub-blip:client:refreshBlips', function()
    RemoveAllBlips()
    InitializeBlips()
end)

-- Event to hide/show specific blip
RegisterNetEvent('chilllixhub-blip:client:toggleBlip', function(index, hide)
    UpdateBlipVisibility(index, hide)
end)

-- Event to remove specific blip
RegisterNetEvent('chilllixhub-blip:client:removeBlip', function(index)
    RemoveBlipByIndex(index)
end)

-- Initialize blips when resource starts
Citizen.CreateThread(function()
    -- Wait a bit for QBCore to load if enabled
    if Config.UseQBCore then
        Citizen.Wait(1000)
    end
    
    InitializeBlips()
    
    if Config.UseQBCore and QBCore then
        print('^2[ChiLLLix-Blip]^7 Successfully loaded with QBCore integration')
    else
        print('^2[ChiLLLix-Blip]^7 Successfully loaded')
    end
end)

-- Cleanup on resource stop
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end
    RemoveAllBlips()
end)
