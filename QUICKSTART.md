# 🚀 Quick Start Guide - LXR Radial Menu v2.0

Get up and running with LXR Radial Menu in **5 minutes**!

---

## ⚡ Installation

### Step 1: Download

Download the latest release from GitHub or your purchase source.

### Step 2: Extract

Extract the `lxr-radialmenu` folder to your server's `resources` directory:

```
server/
└── resources/
    └── lxr-radialmenu/
        ├── client/
        ├── server/
        ├── shared/
        ├── html/
        ├── config-new.lua
        └── fxmanifest-new.lua
```

### Step 3: Configure

Open `server.cfg` and add:

```cfg
ensure lxr-radialmenu
```

### Step 4: Start

Restart your server or run:

```
refresh
start lxr-radialmenu
```

---

## ⚙️ Basic Configuration

### Choose Your Theme

Open `config-new.lua` and find:

```lua
Config.Theme.current = 'wolves'  -- Default theme
```

Available themes:
- `wolves` - Dark with golden accents (default)
- `saloon` - Warm saloon wood
- `frontier` - Olive green frontier
- `midnight` - Deep blue night
- `bloodmoon` - Dark red crimson

### Change Keybind

```lua
Config.Menu.openKey = 'F1'  -- Change to F2, F3, etc.
```

### Adjust Performance

```lua
Config.Performance.profile = 'high'  -- 'low', 'medium', 'high', 'ultra'
```

---

## 🎮 Usage

### Opening the Menu

**In-Game:**
- Press **F1** (or your configured key)
- Or use command: `/radialmenu`

**From Code:**
```lua
exports['lxr-radialmenu']:OpenMenu()
```

### Navigating

- **Mouse**: Hover over items and click to select
- **ESC**: Close menu or go back
- **Center Icon**: Click to go back to previous menu

### Menu Structure

```
Main Menu
├── Saddlebags (Inventory)
├── Horse Management
│   ├── Whistle Horse
│   ├── Feed Horse
│   ├── Brush Horse
│   └── Horse Cargo
├── Weapons
│   ├── Holster
│   └── Clean Weapon
├── Wardrobe (Clothing)
├── Gestures (Emotes)
│   ├── Greet
│   ├── Sit
│   └── Smoke
├── Interactions
│   ├── Rob
│   ├── Carry
│   └── Search
└── Ledger (Settings)
```

---

## 🔧 Customization

### Add a Custom Menu Item

In `config-new.lua`, add to `Config.MenuItems`:

```lua
Config.MenuItems[#Config.MenuItems + 1] = {
    id = 'my_custom_item',
    label = 'My Action',
    icon = '⭐',
    description = 'Does something cool',
    enabled = true,
    action = 'myCustomAction',
}
```

### Handle the Action

In your client script:

```lua
RegisterNUICallback('myCustomAction', function(data, cb)
    -- Your code here
    print('Custom action executed!')
    
    cb('ok')
end)
```

---

## 🎨 Themes

### Switch Themes

1. Press **F1** to open menu
2. Click **Ledger** (settings icon)
3. Select your theme from dropdown
4. Click **Save Settings**

### Create Custom Theme

In `config-new.lua`:

```lua
Config.Theme.themes.mytheme = {
    name = 'My Theme',
    description = 'My custom colors',
    primary = '#8B4513',      -- Main color
    secondary = '#DAA520',    -- Secondary color
    background = 'rgba(20, 20, 20, 0.95)',  -- Background
    text = '#F5DEB3',         -- Text color
    hover = '#CD853F',        -- Hover color
    accent = '#FFD700',       -- Accent color
}
```

Then set it as default:

```lua
Config.Theme.current = 'mytheme'
```

---

## 🐴 Common Actions

### Horse Management

- **Whistle**: Calls your horse
- **Feed**: Restore horse stamina
- **Brush**: Clean and bond with horse
- **Cargo**: Access horse inventory

### Player Interactions

- **Rob**: Rob nearby player (requires targeting)
- **Carry**: Pick up/carry another player
- **Search**: Search a player's pockets

### Job Actions

Different jobs see different menu items:

**Sheriff/Law:**
- Handcuff
- Escort
- Send to Jail

**Doctor:**
- Revive
- Bandage
- Diagnose

---

## 🎯 Integration with Other Resources

### From Another Resource

```lua
-- Add menu item from your resource
exports['lxr-radialmenu']:AddMenuItem({
    id = 'my_plugin_action',
    label = 'My Plugin',
    icon = '🔌',
    action = 'myPluginAction',
})

-- Handle the action
RegisterNUICallback('myPluginAction', function(data, cb)
    -- Your plugin logic
    cb('ok')
end)
```

### Check if Menu is Open

```lua
if exports['lxr-radialmenu']:IsMenuOpen() then
    print('Menu is open')
end
```

### Detect Framework

```lua
local framework = exports['lxr-radialmenu']:GetFramework()
print('Using: ' .. framework)  -- lxrcore, vorp, rsg, etc.
```

---

## 🐛 Troubleshooting

### Menu Won't Open

**Check:**
1. Resource is started (`ensure lxr-radialmenu` in server.cfg)
2. No errors in F8 console
3. Keybind isn't conflicting with another resource

**Try:**
```
refresh
restart lxr-radialmenu
```

### Theme Not Applying

1. Press **Ctrl + F5** in-game (clear cache)
2. Check `Config.Theme.current` matches a theme name
3. Restart the resource

### Performance Issues

1. Lower settings:
   ```lua
   Config.Performance.profile = 'low'
   Config.Menu.backgroundBlur = false
   ```
2. Check other resources aren't causing conflicts
3. Run `resmon` to identify resource usage

### Items Not Showing

1. Check `enabled = true` on menu items
2. Verify job menus match your framework's job names
3. Check for typos in action names

---

## 📝 Commands

| Command | Description | Permission |
|---------|-------------|------------|
| `/radialmenu` | Open menu | All players |
| `/reloadmenu` | Reload menu | Admin only |

---

## 🎓 Next Steps

Now that you have the basics:

1. **Explore Menu** - Try all the menu items
2. **Customize Config** - Make it your own
3. **Read API.md** - Learn about advanced features
4. **Join Discord** - Get support and share ideas

---

## 📚 Documentation

- **README-v2.md** - Complete feature overview
- **API.md** - Developer API reference
- **MIGRATION.md** - Upgrade from v1.0
- **REWORK_SUMMARY.md** - All changes explained

---

## 💬 Support

**Need Help?**
- Discord: [discord.gg/wolves](https://discord.gg/wolves)
- GitHub: [Issues](https://github.com/iboss21/lxr-radialmenu/issues)
- Email: support@wolves.land

---

## ✅ Checklist

Before asking for help, make sure you've:

- [ ] Installed correctly (in resources folder)
- [ ] Added to server.cfg
- [ ] Restarted server/resource
- [ ] Checked F8 console for errors
- [ ] Tried default configuration
- [ ] Read the documentation
- [ ] Searched existing GitHub issues

---

## 🎉 You're Ready!

That's it! You now have a fully functional, modern radial menu system.

Enjoy using LXR Radial Menu v2.0! 🐺

---

**Questions?** Join our Discord: discord.gg/wolves  
**Updates?** Star us on GitHub: github.com/iboss21/lxr-radialmenu

© 2026 iBoss | www.wolves.land
