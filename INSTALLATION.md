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

### Basic Configuration

Edit `config.lua` to customize your setup:

```lua
-- Choose your visual theme
Config.CurrentTheme = 'wolves'  -- Options: 'wolves', 'saloon', 'frontier'

-- Interaction behavior
Config.HoldMode = false  -- true = hold to activate, false = click to activate
Config.HoldTime = 500    -- Milliseconds to hold (if HoldMode is true)

-- Visual settings
Config.BackgroundBlur = true    -- Blur background when menu is open
Config.SoundEffects = true      -- Enable sound effects
Config.MenuRadius = 150         -- Size of the radial menu
Config.AnimationSpeed = 0.3     -- Animation speed in seconds
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
