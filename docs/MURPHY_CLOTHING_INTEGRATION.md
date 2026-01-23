# 🤠 Murphy's Clothing Integration Guide

```
████████╗██╗     ██╗    ██╗     █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
╚══██╔══╝██║     ██║    ██║    ██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
   ██║   ██║     ██║ █╗ ██║    ███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
   ██║   ██║     ██║███╗██║    ██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
   ██║   ███████╗╚███╔███╔╝    ██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
   ╚═╝   ╚══════╝ ╚══╝╚══╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
```

**The Land of Wolves - Murphy's Clothing Integration**  
*Complete Guide for Integrating Murphy's Clothing with the Radial Menu*

---

## 📋 Overview

This radial menu system is fully integrated with **Murphy's Clothing** system, allowing players to access their wardrobe directly from the radial menu's "Wardrobe" option. This provides a seamless 1899 Western experience.

**Murphy's Clothing Documentation:** https://docs.murphy-workshop.com/murphy-s-clothing/

---

## ✅ Prerequisites

### Required Resources
1. **murphy_clothing** - Murphy's Clothing system
2. **lxr-radialmenu** - This radial menu system

### Supported Frameworks
- ✅ VORP Core
- ✅ RSG Core
- ✅ RedEM:RP / REDEMRP2k23

---

## 📦 Installation Steps

### Step 1: Install Murphy's Clothing

Follow the official installation guide:
https://docs.murphy-workshop.com/murphy-s-clothing/getting-started/installation

Ensure Murphy's Clothing is properly configured in your `server.cfg`:
```cfg
ensure murphy_clothing
```

### Step 2: Configure Murphy's Clothing

Edit Murphy's `config.lua`:

```lua
Config.framework = "rsg-core"  -- or "vorp" or "REDEMRP2k23"

Config.MenuCommand = "nil"  -- Disable default command if desired
Config.NativePrompt = true

Config.ClothesManagement = {
    Command = "ClothesManagement",  -- This command will be triggered by radial menu
    Keybind = 0x59                  -- Y key (optional, can keep or remove)
}
```

### Step 3: Install Radial Menu

1. Place `lxr-radialmenu` in your resources folder
2. Add to `server.cfg`:
```cfg
ensure lxr-radialmenu
```

### Step 4: Configure Radial Menu Integration

Edit `lxr-radialmenu/config.lua`:

```lua
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- MURPHY'S CLOTHING INTEGRATION
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Clothing = {
    Enabled = true,                  -- Enable Murphy's Clothing integration
    ResourceName = 'murphy_clothing', -- Murphy's Clothing resource name
    UseCommand = true,               -- Use command to open clothing
    Command = 'ClothesManagement',   -- Must match Murphy's config
    
    -- Alternative: Use event instead of command
    EventName = 'murphy_clothing:client:openMenu',
    
    -- Quick clothing categories
    QuickAccess = {
        enabled = true,
        categories = {
            { id = 'hat', label = 'Hat', category = 'hats' },
            { id = 'coat', label = 'Coat', category = 'coats' },
            { id = 'vest', label = 'Vest', category = 'vests' },
            { id = 'bandana', label = 'Bandana', category = 'masks' },
            { id = 'gloves', label = 'Gloves', category = 'gloves' },
            { id = 'boots', label = 'Boots', category = 'boots' }
        }
    }
}
```

### Step 5: Verify Installation

1. Start/restart your server
2. Join the server
3. Press **F1** to open the radial menu
4. Navigate to **Wardrobe** section
5. Click **Open Wardrobe** - Murphy's Clothing should open

---

## 🎮 Usage

### Accessing Wardrobe via Radial Menu

1. **Press F1** - Opens radial menu
2. **Click "Wardrobe"** - Shows clothing options
3. **Click "Open Wardrobe"** - Opens full Murphy's Clothing menu

### Quick Access Options

The Wardrobe submenu includes:
- **Open Wardrobe** - Full clothing menu
- **Hat** - Quick access to hats
- **Coat** - Quick access to coats
- **Vest** - Quick access to vests
- **Bandana** - Quick access to masks/bandanas
- **Gloves** - Quick access to gloves
- **Boots** - Quick access to boots

---

## ⚙️ Configuration Options

### Basic Configuration

```lua
Config.Clothing = {
    Enabled = true,                  -- Enable/disable integration
    ResourceName = 'murphy_clothing', -- Murphy's resource name
    UseCommand = true,               -- true = use command, false = use event
    Command = 'ClothesManagement',   -- Command from Murphy's config
    EventName = 'murphy_clothing:client:openMenu'  -- Alternative event
}
```

### Command vs Event

**Method 1: Command (Default)**
```lua
Config.Clothing.UseCommand = true
Config.Clothing.Command = 'ClothesManagement'
```
Uses `ExecuteCommand()` to trigger Murphy's command.

**Method 2: Event (Alternative)**
```lua
Config.Clothing.UseCommand = false
Config.Clothing.EventName = 'murphy_clothing:client:openMenu'
```
Uses `TriggerEvent()` to trigger Murphy's menu.

### Customizing Quick Access

Add or remove quick access categories:

```lua
Config.Clothing.QuickAccess = {
    enabled = true,
    categories = {
        { id = 'pants', label = 'Pants', category = 'pants' },
        { id = 'shirt', label = 'Shirt', category = 'shirts_full' },
        -- Add more categories as needed
    }
}
```

**Available Murphy's Categories:**
- `hats`, `masks`, `eyewear`, `headwear`
- `coats`, `shirts_full`, `vests`, `suspenders`
- `pants`, `skirts`, `dresses`
- `boots`, `boot_accessories`, `spats`
- `gloves`, `belts`, `accessories`, `badges`
- `jewelry_necklaces`, `jewelry_rings_left`, `jewelry_rings_right`
- `gunbelts`, `holsters_right`, `holsters_left`

---

## 🔧 Troubleshooting

### Murphy's Clothing Not Opening

**Problem:** Clicking "Open Wardrobe" does nothing

**Solutions:**

1. **Check Resource Status**
```lua
-- In F8 console
ensure murphy_clothing
```

2. **Verify Resource Name**
```lua
-- Check Config.Clothing.ResourceName matches actual folder name
Config.Clothing.ResourceName = 'murphy_clothing'
```

3. **Check Command Name**
```lua
-- Verify command matches Murphy's config
Config.Clothing.Command = 'ClothesManagement'
-- Must match Murphy's: Config.ClothesManagement.Command
```

4. **Try Event Method**
```lua
-- If command doesn't work, try event method
Config.Clothing.UseCommand = false
Config.Clothing.EventName = 'murphy_clothing:client:openMenu'
```

5. **Enable Debug Mode**
```lua
Config.Debug = true
-- Check F8 console for error messages
```

### Integration Not Working

**Check Load Order:**
```cfg
# In server.cfg, ensure proper order:
ensure murphy_clothing
ensure lxr-radialmenu
```

**Verify Integration Status:**
```lua
-- Check in-game F8 console after opening radial menu
-- Should see: "Opening Murphy's Clothing wardrobe"
```

### Quick Access Categories Not Working

Murphy's Clothing handles category selection internally. Quick access buttons currently open the full wardrobe menu. To implement category-specific opening, you would need to:

1. Check Murphy's Clothing exports/events
2. Add custom category opening logic
3. Or use Murphy's native category system

---

## 🎨 Customization

### Changing Wardrobe Icon

Edit `config.lua`:
```lua
Config.MenuItems = {
    {
        id = 'clothing',
        label = 'Wardrobe',
        icon = '👔',  -- Change to any emoji or icon
        items = { ... }
    }
}
```

### Adding More Clothing Options

```lua
{
    id = 'clothing',
    label = 'Wardrobe',
    icon = '🤠',
    items = {
        { id = 'full_wardrobe', label = 'Open Wardrobe', action = 'clothing:open' },
        { id = 'outfits', label = 'Saved Outfits', action = 'clothing:outfits' },
        { id = 'shop', label = 'Clothing Shop', action = 'clothing:shop' },
        -- Add custom options
    }
}
```

Then handle the custom actions:
```lua
RegisterNetEvent('lxr-radialmenu:client:clothing:outfits', function()
    -- Your custom code here
    ExecuteCommand('outfits')  -- Example
end)
```

---

## 🔗 Integration with Other Systems

### Framework-Specific Integration

**VORP Core:**
```lua
-- Murphy's Clothing auto-detects VORP
-- No additional configuration needed
```

**RSG Core:**
```lua
-- Murphy's config:
Config.framework = "rsg-core"
```

**RedEM:RP:**
```lua
-- Murphy's config:
Config.framework = "REDEMRP2k23"
```

### Inventory Integration

Murphy's Clothing supports outfit items:
```lua
-- In Murphy's config:
Config.OutfitItem = "clothes"
```

This allows outfits to be stored in inventory and used via items.

---

## 📝 Advanced Configuration

### Disable Radial Menu Clothing (Use Murphy's Only)

If you want to keep Murphy's original controls:

```lua
-- In lxr-radialmenu config.lua
Config.Clothing.Enabled = false
```

Or remove the clothing menu item entirely:
```lua
-- Comment out or remove the clothing section in Config.MenuItems
```

### Add Price Integration

If you want to show clothing prices in radial menu tooltips:

```lua
-- In your custom code
local function GetClothingPrice(category)
    -- Import Murphy's prices
    local murphyConfig = exports['murphy_clothing']:GetConfig()
    return murphyConfig.Price[category] or 0
end
```

---

## 🐺 Support

**The Land of Wolves:**
- Website: www.wolves.land
- Author: iBoss

**Murphy's Clothing:**
- Documentation: https://docs.murphy-workshop.com/
- Discord: Murphy's Workshop Discord

---

## 📚 Additional Resources

### Murphy's Clothing Features
- Full customization system
- Outfit saving/loading
- Shop integration
- Job-locked items
- Multi-framework support
- Database persistence

### Radial Menu Features
- 1899 Western theme
- Quick access to wardrobe
- Seamless integration
- Framework auto-detection
- Multi-language support

---

## ✅ Checklist

- [ ] Murphy's Clothing installed and working
- [ ] Radial menu installed
- [ ] Config.Clothing.ResourceName matches Murphy's folder
- [ ] Config.Clothing.Command matches Murphy's command
- [ ] Both resources in server.cfg
- [ ] Server restarted
- [ ] Tested in-game (F1 → Wardrobe → Open Wardrobe)

---

© 2026 iBoss | The Land of Wolves | www.wolves.land

*Integration guide for Murphy's Clothing system*
