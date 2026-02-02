# ChiLLLix-Blip

A comprehensive FiveM script for displaying customizable blips on the map with QBCore framework support.

## Features

- ✅ Full QBCore framework integration (optional)
- ✅ Multiple blip configuration options
- ✅ **Custom blip sprites support (add your own images!)**
- ✅ Client and Server-side architecture
- ✅ Dynamic blip management
- ✅ Blip flashing with customizable timers
- ✅ Short-range visibility control
- ✅ Minimap visibility control
- ✅ Blip opacity and scale customization
- ✅ Tick marks and outlines
- ✅ Admin commands for managing blips

## Configuration Parameters

Each blip in `config.lua` supports the following parameters:

| Parameter | Type | Description |
|-----------|------|-------------|
| `name` | string | Blip name for identification |
| `blipId` | number | Blip sprite ID ([Reference](https://docs.fivem.net/docs/game-references/blips/)) |
| `customSprite` | table | Optional: Custom sprite reference for documentation `{dict = 'texture_dict', texture = 'texture_name'}` (not processed by code, helps track custom textures) |
| `coords` | vector3 | Blip coordinates (x, y, z) |
| `scale` | float | Size of the blip (e.g., 0.8) |
| `color` | number | Blip color ID ([Reference](https://docs.fivem.net/docs/game-references/blips/#blip-colors)) |
| `opacity` | number | Blip opacity (0-255) |
| `shortRange` | boolean | Enable short-range visibility only |
| `flashTimer` | number | Flash interval in milliseconds (0 = disabled) |
| `flashEnabled` | boolean | Enable/disable blip flashing |
| `tickOnBlip` | boolean | Add tick mark on blip |
| `outline` | boolean | Add outline to blip |
| `hideOnMinimap` | boolean | Hide blip on minimap |
| `hideBlip` | boolean | Hide blip from map entirely |

## Installation

1. Download or clone this repository
2. Place the `chilllixhub-blip` folder in your FiveM server's `resources` folder
3. Add `ensure chilllixhub-blip` to your `server.cfg`
4. Configure your blips in `config.lua`
5. Restart your server or use `refresh` and `start chilllixhub-blip`

## Configuration

Edit `config.lua` to customize your blips:

```lua
Config = {}

Config.UseQBCore = true -- Set to false if not using QBCore

Config.Blips = {
    {
        name = "Police Station",
        blipId = 60,
        coords = vector3(425.1, -979.5, 30.7),
        scale = 0.8,
        color = 29,
        opacity = 255,
        shortRange = true,
        flashTimer = 0,
        flashEnabled = false,
        tickOnBlip = false,
        outline = false,
        hideOnMinimap = false,
        hideBlip = false,
    },
    -- Add more blips here...
}
```

## Commands

### Admin Commands

- `/refreshblips` - Refresh all blips for all players
- `/toggleblip <index> <true/false>` - Toggle visibility of a specific blip
  - The blip index corresponds to its position in the Config.Blips array (1-based)
  - Example: `/toggleblip 1 true` will hide the first blip in the config

**Note:** These commands require admin permissions when using QBCore, or ACE permissions without QBCore.

## Blip ID Reference

Common blip IDs:
- `1` - Default
- `50` - Garage
- `52` - Shop
- `60` - Police
- `61` - Hospital
- `108` - ATM
- `280` - Custom marker

For a complete list, visit the [FiveM Blips Documentation](https://docs.fivem.net/docs/game-references/blips/).

## Custom Blip Sprites

You can add your own custom blip images/sprites to the map! This allows you to use unique icons for your locations.

### How to Add Custom Sprites

1. **Prepare Your Image**
   - Create a square image (recommended: 64x64 pixels)
   - Save as PNG or JPG format

2. **Convert to YTD Format**
   - Use [OpenIV](http://openiv.com/) (Windows) or texture dictionary tools
   - Create a new .ytd file (e.g., `custom_blips.ytd`)
   - Import your image and name the texture (e.g., `my_icon`)
   - Save the .ytd file

3. **Add to Resource**
   - Place your .ytd file in the `stream/` folder
   - See `stream/README.md` for detailed instructions

4. **Configure in config.lua**
   ```lua
   {
       name = "Custom Location",
       blipId = 1,  -- Use a custom sprite ID (research available IDs or use modding tools)
       customSprite = {
           dict = 'custom_blips',    -- Your .ytd filename (without extension)
           texture = 'my_icon'       -- Texture name in the .ytd file
       },
       coords = vector3(100.0, -100.0, 30.0),
       scale = 0.8,
       color = 0,
       opacity = 255,
       shortRange = false,
       flashTimer = 0,
       flashEnabled = false,
       tickOnBlip = false,
       outline = false,
       hideOnMinimap = false,
       hideBlip = false,
   }
   ```

5. **Restart Server**
   - Use `refresh` and `ensure chilllixhub-blip` or restart your server

For detailed instructions, see the [stream/README.md](stream/README.md) file.

**Note**: Custom blip sprites in FiveM require texture dictionaries (.ytd files) and understanding of GTA V's sprite system. The `customSprite` parameter in the configuration is for documentation purposes to help you track which texture corresponds to which sprite ID. You'll need to use modding tools to properly map sprite IDs to your custom textures.

## Blip Color Reference

Common colors:
- `0` - White
- `1` - Red
- `2` - Green
- `3` - Blue
- `5` - Yellow
- `29` - Police Blue
- `47` - Pink

## Examples

### Example 1: Police Station with Short Range
```lua
{
    name = "Police Station",
    blipId = 60,
    coords = vector3(425.1, -979.5, 30.7),
    scale = 0.8,
    color = 29,
    opacity = 255,
    shortRange = true,
    flashTimer = 0,
    flashEnabled = false,
    tickOnBlip = false,
    outline = false,
    hideOnMinimap = false,
    hideBlip = false,
}
```

### Example 2: Flashing ATM with Outline
```lua
{
    name = "ATM",
    blipId = 108,
    coords = vector3(147.4, -1035.8, 29.3),
    scale = 0.6,
    color = 2,
    opacity = 255,
    shortRange = true,
    flashTimer = 5000,  -- Flash every 5 seconds
    flashEnabled = true,
    tickOnBlip = false,
    outline = true,
    hideOnMinimap = false,
    hideBlip = false,
}
```

### Example 3: Garage with Tick Mark
```lua
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
}
```

### Example 4: Custom Sprite Blip
```lua
{
    name = "Custom Location",
    blipId = 1,  -- Custom sprite ID (use appropriate ID for your custom sprite)
    customSprite = {
        dict = 'custom_blips',     -- Your .ytd filename (documentation only)
        texture = 'custom_icon_1'  -- Texture name (documentation only)
    },
    coords = vector3(100.0, -100.0, 30.0),
    scale = 0.8,
    color = 0,
    opacity = 255,
    shortRange = false,
    flashTimer = 0,
    flashEnabled = false,
    tickOnBlip = false,
    outline = false,
    hideOnMinimap = false,
    hideBlip = false,
}
```
**Note**: Custom sprites require a .ytd file in the `stream/` folder and proper sprite ID mapping. The `customSprite` parameter is for documentation to track your texture files. See the Custom Blip Sprites section above for detailed instructions.

## Support

For issues, suggestions, or contributions, please visit the [GitHub repository](https://github.com/ChiLLLix-hub/chilllixhub-blip).

## License

This project is licensed under the terms specified in the LICENSE file.

## Credits

Created by ChiLLLix-hub

---

**Note:** This script is compatible with both QBCore and standalone FiveM servers. Simply set `Config.UseQBCore` to `false` if not using QBCore framework.
