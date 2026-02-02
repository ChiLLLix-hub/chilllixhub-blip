Config = {}

-- QBCore Framework Integration
Config.UseQBCore = true -- Set to false if not using QBCore

-- Blip Configuration
-- To use custom sprites:
-- 1. Create a .ytd texture dictionary file with your custom sprite image(s)
-- 2. Place it in the stream/ folder
-- 3. Use the customSprite parameter in your blip config (for documentation purposes)
-- 4. Set blipId to reference your custom sprite ID
-- See stream/README.md for detailed instructions

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
    -- Example Blip 6: Custom Sprite Example (commented out by default)
    -- Uncomment and configure once you have custom sprites in stream/ folder
    -- Note: customSprite parameter is for documentation only; blipId references your custom sprite
    -- {
    --     name = "Custom Location",
    --     blipId = 1,                    -- Set to your custom sprite ID
    --     customSprite = {               -- Documentation: describes your custom sprite
    --         dict = 'custom_blips',     -- Your .ytd file name (without .ytd extension)
    --         texture = 'my_custom_icon' -- Texture name within the .ytd file
    --     },
    --     coords = vector3(100.0, -100.0, 30.0),
    --     scale = 0.8,
    --     color = 0,                     -- Color may not apply to custom sprites
    --     opacity = 255,
    --     shortRange = false,
    --     flashTimer = 0,
    --     flashEnabled = false,
    --     tickOnBlip = false,
    --     outline = false,
    --     hideOnMinimap = false,
    --     hideBlip = false,
    -- },
}
