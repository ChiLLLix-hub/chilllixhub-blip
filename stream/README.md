# Custom Blip Sprites

This folder is for custom blip sprite texture files (.ytd format).

## How to Add Custom Blip Sprites

### Step 1: Create Your Custom Sprite Image

1. Create your custom blip icon image (recommended size: 64x64 pixels or similar square dimensions)
2. Save it as a .png or .jpg file

### Step 2: Convert to YTD Format

To use custom sprites in FiveM, you need to convert your image to GTA V's texture dictionary format (.ytd):

**Option A: Using OpenIV (Windows)**
1. Download and install [OpenIV](http://openiv.com/)
2. Create a new .ytd file or edit an existing one
3. Import your custom icon image
4. Name the texture (e.g., "custom_icon_1")
5. Save the .ytd file (e.g., "custom_blips.ytd")
6. Place the .ytd file in this `stream/` folder

**Option B: Using GTA V Modding Tools**
1. Use tools like [TxdGen](https://www.gtaforums.com/topic/800033-txdgen/) or other texture dictionary generators
2. Create a new texture dictionary
3. Add your custom icon to the dictionary
4. Export as .ytd format
5. Place the .ytd file in this `stream/` folder

### Step 3: Configure Your Blip in config.lua

Once you have your .ytd file in the stream folder:

```lua
{
    name = "Custom Location",
    blipId = 1,  -- Use an appropriate sprite ID for your custom sprite
    customSprite = {
        dict = 'custom_blips',     -- Name of your .ytd file (for documentation)
        texture = 'custom_icon_1'  -- Texture name (for documentation)
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

### Important Notes

1. **File Naming**: The .ytd filename should match the `dict` value in your customSprite config (for your reference)

2. **Texture Names**: Keep track of texture names inside the .ytd file using the `texture` value in customSprite

3. **Sprite IDs**: Custom sprites in FiveM require proper sprite ID mapping. The relationship between `blipId` and custom textures depends on how the .ytd file is structured and your FiveM setup. You may need to:
   - Research available/unused sprite IDs in GTA V
   - Use modding tools to properly register custom sprite IDs
   - Test different sprite IDs to find which ones work with your custom textures
   - Note: Not all sprite IDs may display custom textures correctly

4. **customSprite Parameter**: The `customSprite` parameter in the config is for documentation purposes only - it helps you track which .ytd file and texture corresponds to which blip. The actual sprite is loaded through the `blipId` parameter.

5. **File Format**: Only .ytd files are supported for custom blip sprites in FiveM

6. **Server Restart**: After adding new .ytd files, restart your server or use `refresh` and `ensure chilllixhub-blip`

## Example Structure

```
stream/
├── README.md (this file)
├── custom_blips.ytd (your custom sprites)
└── more_custom_blips.ytd (additional sprite sets)
```

Each .ytd file can contain multiple textures/sprites.

## Troubleshooting

- **Blip not showing**: Make sure the .ytd file is named correctly and matches your config
- **Wrong icon**: Verify the texture name in the .ytd matches your config
- **Black/white blip**: Check that your texture is properly formatted and not corrupted
- **Resource not loading**: Ensure `fxmanifest.lua` includes the files directive: `files { 'stream/*.ytd' }`

## Resources

- [FiveM Blips Documentation](https://docs.fivem.net/docs/game-references/blips/)
- [OpenIV Official Website](http://openiv.com/)
- [GTA V Modding Forum](https://www.gtaforums.com/)
