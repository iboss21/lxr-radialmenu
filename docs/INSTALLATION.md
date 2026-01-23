# 🐺 Installation & Usage Guide

```
████████╗██╗     ██╗    ██╗     █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
╚══██╔══╝██║     ██║    ██║    ██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
   ██║   ██║     ██║ █╗ ██║    ███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
   ██║   ██║     ██║███╗██║    ██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
   ██║   ███████╗╚███╔███╔╝    ██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
   ╚═╝   ╚══════╝ ╚══╝╚══╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
```

**The Land of Wolves - Advanced Radial Menu System**  
*Complete Installation & Usage Documentation*

---

## 📦 Installation

### Step 1: Download
1. Download the latest release from the repository
2. Extract the `lxr-radialmenu` folder

### Step 2: Installation
```bash
# Place in your server's resources folder
/resources/[custom]/lxr-radialmenu/

# Or in a standalone folder
/resources/lxr-radialmenu/
```

### Step 3: Server Configuration
Add to your `server.cfg`:
```cfg
# The Land of Wolves - Radial Menu
ensure lxr-radialmenu
```

### Step 4: Restart Server
```bash
restart lxr-radialmenu
# or
refresh
start lxr-radialmenu
```

---

## ⚙️ Configuration

### Everything is Centralized in config.lua

**No need to edit client.lua or server.lua!** All configuration is now in one place.

### Basic Configuration

Edit `config.lua` to customize your setup:

```lua
-- Choose your visual theme (15 premium themes)
Config.Theme.current = 'wolves'  -- wolves, saloon, frontier, midnight, blood_moon, etc.

-- Interaction behavior
Config.Menu.holdMode = false  -- true = hold to activate, false = click to activate
Config.Menu.holdTime = 500    -- Milliseconds to hold (if holdMode is true)

-- Visual settings
Config.Menu.backgroundBlur = true    -- Blur background when menu is open
Config.Menu.blurStrength = 5         -- Blur intensity
Config.Sounds.enabled = true         -- Enable sound effects
Config.Menu.radius = 150             -- Size of the radial menu
Config.Menu.iconSize = 50            -- Icon size
Config.Menu.animationSpeed = 0.3     -- Animation speed in seconds
Config.Menu.animationStyle = 'elastic'  -- elastic, smooth, instant, bounce

-- Performance optimization
Config.Performance.enableCache = true
Config.Performance.profile = 'ultra'  -- low, medium, high, ultra
```

### Comprehensive Configuration Sections

The config.lua now includes **everything**:

#### 🎨 Theme System (15 Premium Themes)
- Wolves, Saloon, Frontier, Midnight, Blood Moon
- Desert Dawn, Prairie, Parchment, Gunslinger
- Bounty Hunter, Sheriff Badge, Campfire, Ghost Town
- Native Spirit, Gold Rush
- Full customization of colors, backgrounds, effects

#### 🌍 Language & Localization
```lua
Config.Language.current = 'en'  -- en, es, fr, de, pt, it, ru, pl, tr, nl
Config.Locales.en = { ... }  -- All text strings
```

#### 🎭 Animations & Scenarios
```lua
Config.Animations.scenarios = {
    horse_brush = 'WORLD_HUMAN_HORSE_BRUSH',
    camp_cook = 'WORLD_HUMAN_COOK_MEAT',
    smoke = 'WORLD_HUMAN_SMOKE',
    -- All scenario hashes centralized
}
```

#### 🚶 Walking Styles (20+ Styles)
```lua
Config.WalkingStyles.enabled = true
Config.WalkingStyles.command = 'walkstyle'
Config.WalkingStyles.styles = {
    { id = 'confident', label = 'Confident Stride', clipset = 'clipset@move_m@core@1h' },
    { id = 'gunslinger', label = 'Gunslinger', clipset = 'move_m@gunslinger' },
    -- 20+ walking styles with clipsets
}
```

#### 👔 Clothing System (Murphy's Clothing)
```lua
Config.Clothing.enabled = true
Config.Clothing.resourceName = 'murphy_clothing'
Config.Clothing.command = 'ClothesManagement'
Config.Clothing.quickAccess.enabled = true
```

#### 📋 Menu Items (All Configurable)
```lua
Config.MenuItems = {
    {
        id = 'horse',
        label = 'Horse',
        icon = '🐴',
        enabled = true,
        items = { ... }
    },
    -- All menu items with enable/disable flags
}
```

#### 💼 Job-Specific Menus
```lua
Config.JobMenus = {
    sheriff = { ... },
    doctor = { ... },
    blacksmith = { ... },
    stagecoach = { ... },
    bountyhunter = { ... },
    saloon = { ... },
    gunsmith = { ... }
}
```

#### 🐴 Horse System
```lua
Config.Horse.callDistance = 50.0
Config.Horse.callCommand = 'horse'
Config.Horse.brushDuration = 5000
Config.Horse.feedDuration = 3000
Config.Horse.cargoEnabled = true
```

#### 🛒 Wagon System
```lua
Config.Wagon.doorSpeed = 1.0
Config.Wagon.cargoEnabled = true
Config.Wagon.flipEnabled = true
Config.Wagon.flipDistance = 5.0
```

#### 🏕️ Camp System
```lua
Config.Camp.pitchEnabled = true
Config.Camp.pitchDuration = 3000
Config.Camp.cookEnabled = true
Config.Camp.restHealing = 20  -- HP to restore
```

#### 🔫 Weapon System
```lua
Config.Weapons.autoHolster = false
Config.Weapons.holsterDelay = 500
Config.Weapons.cleaningDuration = 5000
Config.Weapons.cleaningAnimation = 'WORLD_HUMAN_CLEAN_WEAPON'
```

#### 🤝 Interactions
```lua
Config.Interactions.distance = 2.0
Config.Interactions.enableCarrySystem = true
Config.Interactions.enableLassoSystem = true
Config.Interactions.cooldowns = { ... }
```

#### 📦 Inventory Integration
```lua
Config.Inventory.system = 'auto'  -- auto-detects framework
Config.Inventory.commands = {
    vorp = 'satchel',
    rsg = 'inventory',
    lxr = 'inventory'
}
```

#### ⚙️ Commands (All in One Place)
```lua
Config.Commands = {
    openMenu = 'radialmenu',
    callHorse = 'horse',
    clothing = 'ClothesManagement',
    animations = 'anim',
    walkstyle = 'walkstyle',
    inventory = 'inventory',
    menuInfo = 'radialmenu:info'
}
```

#### 🔊 Sound Effects
```lua
Config.Sounds.enabled = true
Config.Sounds.volume = 0.5
Config.Sounds.sounds = {
    open = 'menu_open',
    select = 'menu_select',
    -- All sound definitions
}
```

#### 🐛 Debug Settings
```lua
Config.Debug.enabled = false
Config.Debug.printEvents = false
Config.Debug.printActions = false
Config.Debug.showPerformance = false
```

### Framework Detection

The system automatically detects your RedM framework:
- ✅ VORP Core
- ✅ RSG Core  
- ✅ RedEM:RP
- ✅ QBR (QBCore for RedM)

```lua
Config.Framework = 'standalone'
Config.AutoDetectFramework = true  -- Automatic detection
```

### Key Binding

Change the default open key:
```lua
Config.OpenKey = 'F1'           -- Any valid key
Config.UseKeyMapping = true     -- Use FiveM key mapping system
```

### Language Support

Set your preferred language:
```lua
Config.Language = 'en'  -- Options: 'en', 'es', 'fr', 'de', 'pt'
```

---

## 🎮 Usage

### Opening the Menu

**Method 1: Keybind (Default)**
```
Press F1
```

**Method 2: Command**
```
/radialmenu
```

**Method 3: Export (For developers)**
```lua
exports['lxr-radialmenu']:OpenRadialMenu()
```

### Navigating the Menu

1. **Mouse Movement**: Hover over menu items
2. **Click**: Select an item (or hold if configured)
3. **ESC**: Close the menu
4. **Submenu**: Click items with arrows to open submenus

### Using Menu Items

#### 🐴 Horse Management
- **Whistle for Horse**: Calls your horse to your location
- **Send Horse Away**: Dismisses your horse
- **Brush Horse**: Improves horse condition
- **Feed Horse**: Restores horse stamina
- **Calm Horse**: Soothes agitated horse
- **Horse Cargo**: Access saddlebags

#### 🛒 Wagon Controls
- **Driver Door**: Toggle driver side door
- **Passenger Door**: Toggle passenger door
- **Rear Door**: Toggle rear cargo door
- **Wagon Cargo**: Access wagon storage
- **Flip Wagon**: Right overturned wagon
- **Toggle Lantern**: Turn wagon lights on/off

#### 🏕️ Camp System
- **Pitch Camp**: Set up a camp
- **Cook**: Prepare food at campfire
- **Rest**: Recover health and stamina
- **Craft**: Open crafting menu
- **Pack Up Camp**: Remove camp

#### 🤠 Clothing Management
- **Hat**: Toggle hat visibility
- **Coat**: Toggle coat
- **Vest**: Toggle vest
- **Bandana**: Toggle bandana/mask
- **Gloves**: Toggle gloves
- **Boots**: Toggle boots

#### 👥 Player Interactions
- **Greet**: Friendly greeting
- **Antagonize**: Hostile interaction
- **Rob**: Attempt to rob player
- **Lasso**: Use lasso on player
- **Carry Person**: Carry/kidnap player
- **Search Person**: Search player's pockets

#### 🎭 Emotes & Gestures
- **Smoke Cigarette**: Light up a smoke
- **Drink Whiskey**: Take a drink
- **Sit Down**: Sit on ground
- **Lean**: Lean against wall
- **Dance**: Western dance
- **Pray**: Prayer gesture

---

## 💼 Job-Specific Features

### 👮 Sheriff/Marshal Menu

Access when playing as law enforcement:

```lua
-- Available Actions
- Handcuff suspects
- Search persons
- Escort arrested
- Send to jail
- Issue fines
- Check wanted status
```

### 🏥 Doctor Menu

Access when playing as doctor:

```lua
-- Available Actions
- Revive unconscious players
- Bandage wounds
- Use stretcher system
- Diagnose conditions
- Administer medicine
```

### 🔨 Blacksmith Menu

Access when playing as blacksmith:

```lua
-- Available Actions
- Repair wagons
- Repair weapons
- Forge items
- Horseshoe service
```

### 🚂 Stagecoach Driver Menu

Access when playing as stagecoach driver:

```lua
-- Available Actions
- Set fare prices
- Start passenger route
- Stop service
```

### 💀 Bounty Hunter Menu

Access when playing as bounty hunter:

```lua
-- Available Actions
- Lasso target
- Hogtie target
- Deliver bounty
- Check wanted poster
```

### ⚰️ Undertaker Menu

Access when playing as undertaker:

```lua
-- Available Actions
- Collect bodies
- Bury deceased
```

---

## 🎨 Customizing Menu Items

### Adding Custom Items

Edit `config.lua`:

```lua
Config.MenuItems = {
    {
        id = 'custom_action',
        label = 'My Custom Action',
        icon = '⚡',
        action = 'custom:action'
    }
}
```

### Adding Submenu Items

```lua
{
    id = 'parent_menu',
    label = 'Parent Menu',
    icon = '📋',
    items = {
        { id = 'sub1', label = 'Sub Action 1', action = 'action:sub1' },
        { id = 'sub2', label = 'Sub Action 2', action = 'action:sub2' }
    }
}
```

### Handling Custom Actions

**Client-side:**
```lua
RegisterNetEvent('lxr-radialmenu:client:custom:action', function()
    -- Your custom action code here
    print('Custom action triggered!')
end)
```

**Server-side:**
```lua
RegisterNetEvent('lxr-radialmenu:server:custom:action', function()
    local src = source
    -- Your server-side code here
    print('Player ' .. src .. ' used custom action')
end)
```

---

## 🔧 Developer API

### Exports

#### Open Menu
```lua
exports['lxr-radialmenu']:OpenRadialMenu()
```

#### Close Menu
```lua
exports['lxr-radialmenu']:CloseRadialMenu()
```

#### Toggle Menu
```lua
exports['lxr-radialmenu']:ToggleRadialMenu()
```

#### Check if Menu is Open
```lua
local isOpen = exports['lxr-radialmenu']:IsMenuOpen()
if isOpen then
    print('Menu is currently open')
end
```

#### Get Current Framework
```lua
local framework = exports['lxr-radialmenu']:GetFramework()
print('Detected framework: ' .. framework)
```

### Events

#### Client Events
```lua
-- Trigger any menu action
TriggerEvent('lxr-radialmenu:client:horse:call')
TriggerEvent('lxr-radialmenu:client:wagon:flip')
TriggerEvent('lxr-radialmenu:client:camp:pitch')
```

#### Server Events
```lua
-- Trigger server-side actions
TriggerServerEvent('lxr-radialmenu:server:job:sheriff:jail')
```

---

## 🎯 Advanced Configuration

### Custom Job Menus

Add your own job menus:

```lua
Config.JobMenus.myjob = {
    {
        id = 'myjob_menu',
        label = 'My Job Actions',
        icon = '🔧',
        items = {
            { id = 'action1', label = 'Action 1', action = 'job:myjob:action1' },
            { id = 'action2', label = 'Action 2', action = 'job:myjob:action2' }
        }
    }
}

-- Enable the job menu
Config.JobPermissions.myjob = true
```

### Custom Themes

Create a new theme:

```lua
Config.Themes.mytheme = {
    backgroundColor = 'rgba(40, 20, 10, 0.95)',
    primaryColor = '#A0522D',
    hoverColor = '#DAA520',
    textColor = '#FAEBD7',
    iconColor = '#D2691E'
}

-- Activate your theme
Config.CurrentTheme = 'mytheme'
```

### Blip System

Configure map blips:

```lua
Config.UseBlips = true
Config.BlipRefreshRate = 5000  -- Refresh every 5 seconds

Config.Blips = {
    mycustomblip = { sprite = 'blip_custom', color = 'blue' }
}
```

---

## 🐛 Troubleshooting

### Menu Not Opening

**Check 1: Resource Started**
```bash
# In server console
ensure lxr-radialmenu
```

**Check 2: Client Errors**
```bash
# Press F8 in-game to check console
```

**Check 3: Key Binding**
```lua
-- Try command instead
/radialmenu
```

### Framework Not Detected

**Solution:** Check your framework resource is started:
```bash
# Example for VORP
ensure vorp_core
```

### Actions Not Working

**Check event handlers are registered:**
```lua
-- Add to your client script
RegisterNetEvent('lxr-radialmenu:client:custom:action', function()
    print('Action triggered!')
end)
```

### UI Not Displaying

**Check NUI errors:**
1. Press F8 in-game
2. Look for HTML/CSS errors
3. Verify files exist in `html/` folder

---

## 📝 Best Practices

### Performance
- Don't open/close menu rapidly
- Use exports for programmatic access
- Limit custom menu items to 8-10 for best UX

### User Experience
- Use clear, descriptive labels
- Group related actions in submenus
- Test all actions before deployment

### Integration
- Follow existing event naming conventions
- Use server events for actions requiring validation
- Implement proper permission checks

---

## 🔐 Security

### Permission Checks
```lua
-- Always verify permissions server-side
RegisterNetEvent('lxr-radialmenu:server:job:action', function()
    local src = source
    local playerJob = GetPlayerJob(src)
    
    if playerJob ~= 'sheriff' then
        return -- Not authorized
    end
    
    -- Proceed with action
end)
```

### Input Validation
```lua
-- Validate all inputs
RegisterNetEvent('lxr-radialmenu:server:action', function(data)
    if type(data) ~= 'table' then return end
    if not data.action then return end
    
    -- Process valid data
end)
```

---

## 📚 Additional Resources

- **Website:** [www.wolves.land](https://www.wolves.land)
- **Author:** iBoss
- **Documentation:** See `UI_DESIGN.md` for UI details
- **Config:** See `config.lua` for all options

---

## 🐺 Support

For support, visit **The Land of Wolves** community:
- Website: www.wolves.land
- Creator: iBoss

---

© 2026 iBoss | The Land of Wolves | www.wolves.land
