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

Edit `config.lua` to customize:

```lua
-- Choose your theme
Config.CurrentTheme = 'wolves'  -- 'wolves', 'saloon', or 'frontier'

-- Interaction mode
Config.HoldMode = false  -- true = hold to activate, false = click

-- Visual settings
Config.BackgroundBlur = true
Config.SoundEffects = true

-- Menu behavior
Config.MenuRadius = 150
Config.AnimationSpeed = 0.3
```

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

---

## 🐺 Support

**Website:** [www.wolves.land](https://www.wolves.land)  
**Author:** iBoss

---

## 📚 Credits

Developed with ❤️ for the RedM community  
**The Land of Wolves** - *1899 Western Era Roleplay*

