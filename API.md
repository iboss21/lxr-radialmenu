# 📚 LXR Radial Menu v2.0 - API Documentation

Complete developer reference for integrating and extending the radial menu.

## 📖 Table of Contents

- [Exports](#exports)
- [Events](#events)
- [Configuration](#configuration)
- [Custom Actions](#custom-actions)
- [Plugin Development](#plugin-development)
- [Framework Integration](#framework-integration)

---

## 🔌 Exports

### Client Exports

#### `OpenMenu()`

Opens the radial menu.

```lua
exports['lxr-radialmenu']:OpenMenu()
```

**Returns:** `nil`

**Example:**
```lua
RegisterCommand('openmenu', function()
    exports['lxr-radialmenu']:OpenMenu()
end)
```

---

#### `CloseMenu()`

Closes the radial menu.

```lua
exports['lxr-radialmenu']:CloseMenu()
```

**Returns:** `nil`

**Example:**
```lua
-- Close menu after custom action
RegisterNetEvent('myresource:closeMenu', function()
    exports['lxr-radialmenu']:CloseMenu()
end)
```

---

#### `IsMenuOpen()`

Checks if the menu is currently open.

```lua
local isOpen = exports['lxr-radialmenu']:IsMenuOpen()
```

**Returns:** `boolean` - `true` if menu is open, `false` otherwise

**Example:**
```lua
if exports['lxr-radialmenu']:IsMenuOpen() then
    print('Menu is open!')
else
    print('Menu is closed')
end
```

---

#### `GetFramework()`

Gets the currently detected framework name.

```lua
local framework = exports['lxr-radialmenu']:GetFramework()
```

**Returns:** `string` - Framework name (e.g., `'lxrcore'`, `'vorp'`, `'standalone'`)

**Example:**
```lua
local framework = exports['lxr-radialmenu']:GetFramework()
print('Using framework: ' .. framework)
```

---

#### `AddMenuItem(item)`

Adds a custom menu item from another resource.

```lua
exports['lxr-radialmenu']:AddMenuItem(item)
```

**Parameters:**
- `item` (table): Menu item configuration

**Item Structure:**
```lua
{
    id = 'unique_id',           -- Required: Unique identifier
    label = 'Display Text',     -- Required: Display label
    icon = '🎯',                -- Required: Icon (emoji or font-awesome)
    description = 'Tooltip',    -- Optional: Tooltip description
    enabled = true,             -- Optional: Enable/disable item
    action = 'actionName',      -- Optional: Action callback name
    submenu = 'submenu_id',     -- Optional: Submenu identifier
    permission = 'admin',       -- Optional: Permission required
    requiresTarget = false,     -- Optional: Requires nearby player
}
```

**Returns:** `boolean` - `true` if item was added, `false` otherwise

**Example:**
```lua
exports['lxr-radialmenu']:AddMenuItem({
    id = 'my_custom_action',
    label = 'Custom Action',
    icon = '⭐',
    description = 'Does something cool',
    enabled = true,
    action = 'myCustomAction',
})
```

---

### Server Exports

#### `GetPlayerSettings(source)`

Gets a player's menu settings.

```lua
local settings = exports['lxr-radialmenu']:GetPlayerSettings(source)
```

**Parameters:**
- `source` (number): Player server ID

**Returns:** `table` - Player settings

**Example:**
```lua
RegisterCommand('getsettings', function(source)
    local settings = exports['lxr-radialmenu']:GetPlayerSettings(source)
    print(json.encode(settings))
end)
```

---

#### `HasPermission(source, permission)`

Checks if a player has a specific permission.

```lua
local hasPerm = exports['lxr-radialmenu']:HasPermission(source, permission)
```

**Parameters:**
- `source` (number): Player server ID
- `permission` (string): Permission name

**Returns:** `boolean` - `true` if player has permission

**Example:**
```lua
if exports['lxr-radialmenu']:HasPermission(source, 'admin') then
    print('Player is admin')
end
```

---

## 📡 Events

### Client Events

#### `lxr-radialmenu:client:openMenu`

Triggered when menu is opened.

```lua
RegisterNetEvent('lxr-radialmenu:client:openMenu')
AddEventHandler('lxr-radialmenu:client:openMenu', function()
    print('Menu opened')
end)
```

---

#### `lxr-radialmenu:client:closeMenu`

Triggered when menu is closed.

```lua
RegisterNetEvent('lxr-radialmenu:client:closeMenu')
AddEventHandler('lxr-radialmenu:client:closeMenu', function()
    print('Menu closed')
end)
```

---

#### `lxr-radialmenu:client:refreshMenu`

Triggered to refresh the menu.

```lua
RegisterNetEvent('lxr-radialmenu:client:refreshMenu')
AddEventHandler('lxr-radialmenu:client:refreshMenu', function()
    print('Menu refreshed')
end)
```

---

#### `lxr-radialmenu:client:triggerAction`

Triggered when a menu action is executed.

```lua
RegisterNetEvent('lxr-radialmenu:client:triggerAction')
AddEventHandler('lxr-radialmenu:client:triggerAction', function(action, itemId)
    print('Action: ' .. action .. ', Item: ' .. itemId)
end)
```

**Parameters:**
- `action` (string): Action name
- `itemId` (string): Item identifier

---

### Server Events

#### `lxr-radialmenu:server:logAction`

Triggered when a player executes a menu action (server-side logging).

```lua
RegisterNetEvent('lxr-radialmenu:server:logAction')
AddEventHandler('lxr-radialmenu:server:logAction', function(action, itemId)
    local source = source
    print('Player ' .. source .. ' used action: ' .. action)
end)
```

**Parameters:**
- `action` (string): Action name
- `itemId` (string): Item identifier

---

#### `lxr-radialmenu:server:syncSettings`

Triggered to sync player settings.

```lua
RegisterNetEvent('lxr-radialmenu:server:syncSettings')
AddEventHandler('lxr-radialmenu:server:syncSettings', function(settings)
    local source = source
    -- Save settings to database
end)
```

**Parameters:**
- `settings` (table): Player settings

---

## ⚙️ Configuration

### Adding Custom Menu Items

In `config-new.lua`, add to `Config.MenuItems`:

```lua
Config.MenuItems[#Config.MenuItems + 1] = {
    id = 'my_item',
    label = 'My Action',
    icon = '🎯',
    description = 'Custom action description',
    enabled = true,
    action = 'myCustomAction',
}
```

### Adding Submenus

In `config-new.lua`, add to `Config.Submenus`:

```lua
Config.Submenus.my_submenu = {
    {
        id = 'sub_item_1',
        label = 'Submenu Item 1',
        icon = '1️⃣',
        action = 'subAction1',
    },
    {
        id = 'sub_item_2',
        label = 'Submenu Item 2',
        icon = '2️⃣',
        action = 'subAction2',
    }
}
```

Then reference it from a main menu item:

```lua
Config.MenuItems[#Config.MenuItems + 1] = {
    id = 'my_menu',
    label = 'My Menu',
    icon = '📋',
    submenu = 'my_submenu',
}
```

### Adding Job-Specific Menus

In `config-new.lua`, add to `Config.JobMenus`:

```lua
Config.JobMenus.myjob = {
    {
        id = 'job_action',
        label = 'Job Action',
        icon = '💼',
        action = 'myJobAction',
        requiresTarget = false,
    }
}
```

---

## 🎯 Custom Actions

### Registering Custom Actions

In your resource's client script:

```lua
RegisterNUICallback('myCustomAction', function(data, cb)
    local playerPed = PlayerPedId()
    
    -- Your custom logic here
    print('Custom action executed!')
    
    -- Optionally close menu
    exports['lxr-radialmenu']:CloseMenu()
    
    cb('ok')
end)
```

### Example: Teleport Action

```lua
-- In config-new.lua
Config.MenuItems[#Config.MenuItems + 1] = {
    id = 'teleport',
    label = 'Teleport',
    icon = '✨',
    description = 'Teleport to spawn',
    action = 'teleportAction',
}

-- In your client script
RegisterNUICallback('teleportAction', function(data, cb)
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, -1035.0, -2736.0, 19.0)
    
    TriggerEvent('chat:addMessage', {
        args = { 'Teleported to spawn!' }
    })
    
    exports['lxr-radialmenu']:CloseMenu()
    cb('ok')
end)
```

---

## 🔧 Plugin Development

### Creating a Plugin

Create a new resource that depends on `lxr-radialmenu`:

**fxmanifest.lua:**
```lua
fx_version 'cerulean'
game 'rdr3'

author 'Your Name'
description 'Plugin for LXR Radial Menu'
version '1.0.0'

dependencies {
    'lxr-radialmenu'
}

client_scripts {
    'client.lua'
}
```

**client.lua:**
```lua
CreateThread(function()
    -- Wait for radial menu to load
    while not exports['lxr-radialmenu']:IsMenuOpen do
        Wait(100)
    end
    
    -- Add custom menu items
    exports['lxr-radialmenu']:AddMenuItem({
        id = 'plugin_action',
        label = 'Plugin Action',
        icon = '🔌',
        description = 'Action from plugin',
        action = 'pluginAction',
    })
    
    print('Plugin loaded!')
end)

-- Handle custom action
RegisterNUICallback('pluginAction', function(data, cb)
    print('Plugin action executed!')
    cb('ok')
end)
```

### Plugin Best Practices

1. **Always check exports exist** before using them
2. **Namespace your IDs** to avoid conflicts (e.g., `myplugin_action`)
3. **Clean up on resource stop**
4. **Document your plugin's requirements**
5. **Test with multiple frameworks**

---

## 🌐 Framework Integration

### Detecting Framework

```lua
local framework = exports['lxr-radialmenu']:GetFramework()

if framework == 'lxrcore' then
    -- LXRCore specific code
elseif framework == 'vorp' then
    -- VORP specific code
elseif framework == 'standalone' then
    -- Standalone code
end
```

### Framework-Specific Actions

```lua
-- In config-new.lua, use the framework bridge
RegisterNUICallback('myAction', function(data, cb)
    local FrameworkBridge = require 'client.modules.framework'
    
    -- Universal notification
    FrameworkBridge:Notify('Action completed!', 'success')
    
    -- Get player job
    local job = FrameworkBridge:GetPlayerJob()
    print('Player job: ' .. job)
    
    -- Get player money
    local cash = FrameworkBridge:GetPlayerMoney('cash')
    print('Cash: $' .. cash)
    
    cb('ok')
end)
```

---

## 🎨 Custom Themes

### Creating a Custom Theme

In `config-new.lua`:

```lua
Config.Theme.themes.mytheme = {
    name = 'My Custom Theme',
    description = 'A beautiful custom theme',
    primary = '#FF6B6B',
    secondary = '#4ECDC4',
    background = 'rgba(30, 30, 30, 0.95)',
    text = '#F7FFF7',
    hover = '#FFE66D',
    accent = '#1A535C',
}
```

Then set as default:

```lua
Config.Theme.current = 'mytheme'
```

### Dynamic Theme Switching

From another resource:

```lua
-- Client-side
SendNUIMessage({
    action = 'applyTheme',
    theme = {
        primary = '#FF0000',
        secondary = '#00FF00',
        background = 'rgba(0, 0, 0, 0.9)',
        text = '#FFFFFF',
        hover = '#0000FF',
        accent = '#FFFF00',
    }
})
```

---

## 🔍 Debugging

### Enable Debug Mode

In `config-new.lua`:

```lua
Config.Debug = true
```

### Debug Output

The menu will log:
- Framework detection
- Menu open/close events
- Action triggers
- Settings sync
- Custom item additions

### Console Commands

```lua
-- Reload menu
reloadmenu

-- Open menu manually
radialmenu
```

---

## 📊 Performance Monitoring

### Check Resource Usage

```
resmon
```

Look for `lxr-radialmenu` in the list.

**Expected Performance:**
- Idle: 0.00ms
- Menu Open: 0.01-0.02ms
- Memory: 3-5 MB

### Optimization Tips

1. Reduce `Config.Menu.animationSpeed` for faster animations
2. Disable `Config.Menu.backgroundBlur` on lower-end systems
3. Use `Config.Performance.profile = 'low'` for best performance
4. Limit custom menu items to essential ones

---

## 🆘 Support

Need help with integration?

- **Discord**: [discord.gg/wolves](https://discord.gg/wolves)
- **GitHub**: [github.com/iboss21/lxr-radialmenu](https://github.com/iboss21/lxr-radialmenu)
- **Email**: support@wolves.land

---

## 📝 Example Implementations

### Example 1: Banking Menu

```lua
-- Add to config-new.lua
Config.MenuItems[#Config.MenuItems + 1] = {
    id = 'banking',
    label = 'Bank',
    icon = '🏦',
    submenu = 'banking_menu',
}

Config.Submenus.banking_menu = {
    {
        id = 'deposit',
        label = 'Deposit',
        icon = '💰',
        action = 'bankDeposit',
    },
    {
        id = 'withdraw',
        label = 'Withdraw',
        icon = '💵',
        action = 'bankWithdraw',
    },
    {
        id = 'balance',
        label = 'Check Balance',
        icon = '📊',
        action = 'bankBalance',
    }
}

-- In client script
RegisterNUICallback('bankDeposit', function(data, cb)
    -- Your banking logic here
    TriggerServerEvent('bank:deposit')
    cb('ok')
end)
```

### Example 2: Admin Menu

```lua
-- Add to config-new.lua
Config.JobMenus.admin = {
    {
        id = 'noclip',
        label = 'NoClip',
        icon = '👻',
        action = 'adminNoclip',
    },
    {
        id = 'teleport',
        label = 'Teleport',
        icon = '🌐',
        action = 'adminTeleport',
    },
    {
        id = 'heal',
        label = 'Heal',
        icon = '💚',
        action = 'adminHeal',
    }
}
```

---

© 2026 iBoss | www.wolves.land
