Config = {}

-- QBCore Framework Integration
Config.UseQBCore = true -- Set to false if not using QBCore

-- Blip Configuration
Config.Blips = {
    -- Example Blip 1: Police Station
    {
        name = "Police Station",           -- Blip name to identify
        blipId = 60,                       -- Blip ID/Sprite (https://docs.fivem.net/docs/game-references/blips/)
        coords = vector3(425.1, -979.5, 30.7),
        scale = 0.8,                       -- Blip Scale (size)
        color = 29,                        -- Blip Color (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
        opacity = 255,                     -- Blip Opacity (0-255)
        shortRange = true,                 -- Short Range Blip (visible only when close)
        flashTimer = 0,                    -- Flash Timer in milliseconds (0 = disabled)
        flashEnabled = false,              -- Enable/Disable blip flash
        tickOnBlip = false,                -- Add tick on blip
        outline = false,                   -- Add outline on blip
        hideOnMinimap = false,             -- Hide on minimap
        hideBlip = false,                  -- Hide created blip from map
    },
    -- Example Blip 2: Hospital
    {
        name = "Hospital",
        blipId = 61,
        coords = vector3(307.7, -1433.4, 29.9),
        scale = 0.9,
        color = 2,
        opacity = 255,
        shortRange = false,
        flashTimer = 0,
        flashEnabled = false,
        tickOnBlip = false,
        outline = false,
        hideOnMinimap = false,
        hideBlip = false,
    },
    -- Example Blip 3: Garage
    {
        name = "Garage",
        blipId = 50,
        coords = vector3(215.9, -810.1, 30.7),
        scale = 0.7,
        color = 5,
        opacity = 200,
        shortRange = true,
        flashTimer = 0,
        flashEnabled = false,
        tickOnBlip = true,
        outline = false,
        hideOnMinimap = false,
        hideBlip = false,
    },
    -- Example Blip 4: ATM with Flash
    {
        name = "ATM",
        blipId = 108,
        coords = vector3(147.4, -1035.8, 29.3),
        scale = 0.6,
        color = 2,
        opacity = 255,
        shortRange = true,
        flashTimer = 5000,                 -- Flash every 5 seconds
        flashEnabled = true,
        tickOnBlip = false,
        outline = true,
        hideOnMinimap = false,
        hideBlip = false,
    },
    -- Example Blip 5: Shop
    {
        name = "24-7 Shop",
        blipId = 52,
        coords = vector3(25.7, -1347.3, 29.5),
        scale = 0.8,
        color = 2,
        opacity = 255,
        shortRange = false,
        flashTimer = 0,
        flashEnabled = false,
        tickOnBlip = false,
        outline = false,
        hideOnMinimap = false,
        hideBlip = false,
    },
}
