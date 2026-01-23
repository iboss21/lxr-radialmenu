# 🐺 The Land of Wolves - Advanced Radial Menu System

```
████████╗██╗     ██╗    ██╗     █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
╚══██╔══╝██║     ██║    ██║    ██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
   ██║   ██║     ██║ █╗ ██║    ███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
   ██║   ██║     ██║███╗██║    ██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
   ██║   ███████╗╚███╔███╔╝    ██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
   ╚═╝   ╚══════╝ ╚══╝╚══╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
```

**Version:** 1.0.0  
**Author:** iBoss  
**Website:** [www.wolves.land](https://www.wolves.land)  
**Server:** The Land of Wolves

---

## 📖 Description

Transform your RedM server's player experience with the most advanced radial menu system for the **1899 Western Era**. Modern UI with authentic Wild West aesthetics, fully customizable, and packed with features.

---

## ✨ Key Features

### 🎨 **3 Beautiful Western Themes**
- **Wolves** - Dark with wolf pack colors (saddle brown & golden hour)
- **Saloon** - Warm saloon wood with whiskey gold
- **Frontier** - Olive green frontier with khaki tones

### ⚙️ **Full Player Customization**
- Premium 1899-themed settings interface
- Aged parchment textures & leather panels
- Brass/gold trim with engraved borders
- Drag-and-drop menu organization
- Live preview of radial wheel

### 🐴 **Advanced Western Controls**
- **Horse Management** - Whistle, feed, brush, calm, cargo access
- **Wagon Controls** - All doors, cargo, flip, lantern
- **Camp System** - Pitch, cook, rest, craft, pack
- **Clothing Management** - Quick access to hat, coat, vest, bandana, gloves, boots

### 👥 **Player Interactions**
- Greet, antagonize, rob, lasso
- Carry/kidnapping system
- Search person functionality
- Western gestures & emotes

### 💼 **Job-Specific Menus**

#### 👮 **Sheriff/Marshal**
- Handcuff, search, escort
- Send to jail, issue fines
- Check wanted status

#### 🏥 **Doctor**
- Revive, bandage wounds
- Stretcher system
- Diagnose, give medicine

#### 🔨 **Blacksmith**
- Repair wagons & weapons
- Forge items
- Horseshoe service

#### 🚂 **Stagecoach Driver**
- Set fare, start routes
- Passenger management

#### 💀 **Bounty Hunter**
- Lasso & hogtie targets
- Deliver bounties
- Check wanted posters

#### ⚰️ **Undertaker**
- Collect bodies
- Burial services

### 🎯 **Additional Features**
- **Smart Blip System** - Dynamic map markers
- **Multi-Language Support** - English, Spanish, French, German, Portuguese
- **Sound Effects** - Authentic feedback
- **Background Blur** - Cinematic depth
- **Hold or Press Mode** - Choose your interaction style

---

## 🎮 1899 Period-Accurate Labels

| Modern Term | 1899 Western Term |
|-------------|-------------------|
| Phone | Telegraph / Letters |
| Inventory | Saddlebags |
| Clothes | Wardrobe |
| Emotes | Gestures |
| Wallet | Money Pouch |
| Job | Trade |
| Vehicle | Horse / Wagon |
| Settings | Ledger |

---

## 🔧 Framework Support

**Standalone with Auto-Detection**
- ✅ LXRCore (github.com/lxrcore) - **Priority Framework**
- ✅ VORP Core
- ✅ RSG Core
- ✅ RedEM:RP
- ✅ QBR (QBCore for RedM)
- ✅ Any RedM framework

*No manual configuration needed!*

---

## 📦 Installation

1. Download the resource
2. Extract to your resources folder
3. Add `ensure lxr-radialmenu` to your server.cfg
4. Configure `config.lua` to your preferences
5. Restart your server

📖 **For detailed installation instructions, see [docs/INSTALLATION.md](docs/INSTALLATION.md)**

---

## ⌨️ Default Controls

- **F1** - Open/Close Radial Menu
- **ESC** - Close Menu
- **Mouse Click** - Select item (or hold if configured)

---

## 🎨 UI Theme Preview

The settings interface features:
- **Aged parchment background**
- **Leather panels with brass rivets**
- **Engraved borders & ornamental details**
- **Character profile badge** (circular portrait frame like an old locket)
- **Live radial preview** (sheriff badge / compass wheel style)
- **Western serif typography**
- **Subtle film grain & dust particles**
- **Warm sepia lighting**

---

## 📝 Configuration

**Everything is now centralized in `config.lua`** - no need to edit `client.lua` or `server.lua`!

Edit `config.lua` to customize:

```lua
-- Choose your theme (15 premium themes available)
Config.Theme.current = 'wolves'  -- wolves, saloon, frontier, midnight, etc.

-- Interaction mode
Config.Menu.holdMode = false  -- true = hold to activate, false = click
Config.Menu.holdTime = 500  -- ms to hold if holdMode enabled

-- Visual settings
Config.Menu.backgroundBlur = true
Config.Menu.blurStrength = 5
Config.Sounds.enabled = true

-- Menu behavior
Config.Menu.radius = 150
Config.Menu.iconSize = 50
Config.Menu.animationSpeed = 0.3
Config.Menu.animationStyle = 'elastic'  -- 'elastic', 'smooth', 'instant', 'bounce'

-- Performance optimization
Config.Performance.enableCache = true
Config.Performance.profile = 'ultra'  -- 'low', 'medium', 'high', 'ultra'

-- Clothing integration (Murphy's Clothing)
Config.Clothing.enabled = true
Config.Clothing.resourceName = 'murphy_clothing'
Config.Clothing.command = 'ClothesManagement'

-- Animations integration (RSG Animations)
Config.Animations.enabled = true
Config.Animations.rsgAnimations.enabled = true
Config.Animations.rsgAnimations.command = 'anim'

-- Walking styles
Config.WalkingStyles.enabled = true
Config.WalkingStyles.command = 'walkstyle'

-- Horse system
Config.Horse.callDistance = 50.0
Config.Horse.brushDuration = 5000
Config.Horse.cargoEnabled = true

-- Camp system
Config.Camp.pitchEnabled = true
Config.Camp.cookEnabled = true
Config.Camp.restHealing = 20  -- HP to restore

-- Weapons
Config.Weapons.cleaningDuration = 5000
Config.Weapons.autoHolster = false

-- Debug mode (disable in production)
Config.Debug.enabled = false
Config.Debug.printEvents = false
Config.Debug.printActions = false
```

### Complete Configuration Sections

The config.lua now includes everything you need:
- **Product Information** - Branding, version, license
- **Performance Settings** - Cache, optimization profiles
- **Framework Detection** - Auto-detect LXRCore, VORP, RSG, etc.
- **Menu Settings** - Keybinds, behavior, visual options
- **15 Premium Themes** - Wolves, Saloon, Frontier, Midnight, Blood Moon, and more
- **Language/Localization** - Multi-language support
- **Animations & Scenarios** - All scenario hashes centralized
- **Walking Styles** - 20+ walking styles with clipsets
- **Clothing System** - Murphy's Clothing integration
- **Menu Items** - All menu items with enable/disable flags
- **Job Menus** - Sheriff, Doctor, Blacksmith, Stagecoach, etc.
- **Blip System** - Map markers configuration
- **Interactions** - Distance, cooldowns, system toggles
- **Permissions** - Access control settings
- **Commands** - All command names in one place
- **Sound Effects** - Volume, paths, enable/disable
- **Inventory Integration** - Framework-specific settings
- **Weapon System** - Holster, cleaning, degradation
- **Horse System** - Call distance, care durations, cargo
- **Wagon System** - Doors, cargo, flip, lantern
- **Camp System** - Pitch, cook, rest, craft, pack
- **Event Names** - All client and server events centralized

No more editing client.lua or server.lua!

---

## 🎯 Usage Examples

### Open Menu via Export
```lua
exports['lxr-radialmenu']:OpenRadialMenu()
```

### Close Menu via Export
```lua
exports['lxr-radialmenu']:CloseRadialMenu()
```

### Check if Menu is Open
```lua
local isOpen = exports['lxr-radialmenu']:IsMenuOpen()
```

### Get Current Framework
```lua
local framework = exports['lxr-radialmenu']:GetFramework()
```

---

## 🔐 License

**All Rights Reserved**  
© 2026 iBoss | The Land of Wolves | www.wolves.land

This resource is provided as-is for use on The Land of Wolves server.

📄 **Full license details: [docs/LICENSE](docs/LICENSE)**

---

## 📚 Additional Documentation

- 📖 **[Installation Guide](docs/INSTALLATION.md)** - Complete setup instructions
- 🎨 **[UI Design Documentation](docs/UI_DESIGN.md)** - Western theme details
- 👔 **[Murphy's Clothing Integration](docs/MURPHY_CLOTHING_INTEGRATION.md)** - Clothing system integration

---

## 🐺 Support

**Website:** [www.wolves.land](https://www.wolves.land)  
**Author:** iBoss

---

## 📚 Credits

Developed with ❤️ for the RedM community  
**The Land of Wolves** - *1899 Western Era Roleplay*

