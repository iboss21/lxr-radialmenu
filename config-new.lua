--[[
    🐺 LXR Radial Menu - Modern Configuration
    Version 2.0.0 - Simplified and Modular
    
    © 2026 iBoss | www.wolves.land
]]

Config = {}

-- ════════════════════════════════════════════════════════════════
-- GENERAL SETTINGS
-- ════════════════════════════════════════════════════════════════

Config.Version = '2.0.0'
Config.Debug = false

-- ════════════════════════════════════════════════════════════════
-- MENU BEHAVIOR
-- ════════════════════════════════════════════════════════════════

Config.Menu = {
    -- Key to open menu (https://docs.fivem.net/docs/game-references/controls/)
    openKey = 'F1',           -- Can be 'F1', 'F2', etc. or key code (288, 289, etc.)
    
    -- Hold mode (true = hold key, false = press key)
    holdMode = false,
    holdTime = 500,           -- Milliseconds to hold if holdMode enabled
    
    -- Menu position and size
    radius = 200,             -- Radius from center
    iconSize = 60,            -- Size of icons
    centerIconSize = 80,      -- Size of center icon
    
    -- Animation settings
    animationSpeed = 300,     -- Milliseconds
    animationStyle = 'smooth', -- 'instant', 'smooth', 'elastic', 'bounce'
    
    -- Visual effects
    backgroundBlur = true,
    blurStrength = 5,
    showTooltips = true,
    showLabels = true,
    
    -- Max items per menu level
    maxItemsPerLevel = 12,
    
    -- Close menu on action
    closeOnSelect = true,
}

-- ════════════════════════════════════════════════════════════════
-- THEMES
-- ════════════════════════════════════════════════════════════════

Config.Theme = {
    current = 'wolves',       -- Default theme
    
    themes = {
        wolves = {
            name = 'Wolves',
            description = 'Dark theme with wolf pack colors',
            primary = '#8B4513',
            secondary = '#DAA520',
            background = 'rgba(20, 20, 20, 0.95)',
            text = '#F5DEB3',
            hover = '#CD853F',
            accent = '#FFD700',
        },
        
        saloon = {
            name = 'Saloon',
            description = 'Warm saloon wood with whiskey gold',
            primary = '#8B4513',
            secondary = '#CD853F',
            background = 'rgba(40, 20, 10, 0.95)',
            text = '#FFE4B5',
            hover = '#DEB887',
            accent = '#FFD700',
        },
        
        frontier = {
            name = 'Frontier',
            description = 'Olive green frontier with khaki tones',
            primary = '#556B2F',
            secondary = '#8B7355',
            background = 'rgba(30, 40, 20, 0.95)',
            text = '#F0E68C',
            hover = '#9ACD32',
            accent = '#BDB76B',
        },
        
        midnight = {
            name = 'Midnight',
            description = 'Deep blue night theme',
            primary = '#191970',
            secondary = '#4169E1',
            background = 'rgba(10, 10, 30, 0.95)',
            text = '#E0E0FF',
            hover = '#6495ED',
            accent = '#87CEEB',
        },
        
        bloodmoon = {
            name = 'Blood Moon',
            description = 'Dark red with crimson accents',
            primary = '#8B0000',
            secondary = '#DC143C',
            background = 'rgba(40, 0, 0, 0.95)',
            text = '#FFB6C1',
            hover = '#CD5C5C',
            accent = '#FF6347',
        }
    }
}

-- ════════════════════════════════════════════════════════════════
-- FRAMEWORK SETTINGS
-- ════════════════════════════════════════════════════════════════

Config.Framework = {
    autoDetect = true,
    
    -- Priority order for detection
    detectionOrder = {
        'lxrcore',
        'vorp',
        'rsg',
        'redem',
        'qbr'
    }
}

-- ════════════════════════════════════════════════════════════════
-- SOUND EFFECTS
-- ════════════════════════════════════════════════════════════════

Config.Sounds = {
    enabled = true,
    volume = 0.5,           -- 0.0 to 1.0
    
    events = {
        open = 'menu_open',
        close = 'menu_close',
        hover = 'menu_hover',
        select = 'menu_select',
    }
}

-- ════════════════════════════════════════════════════════════════
-- MENU ITEMS CONFIGURATION
-- ════════════════════════════════════════════════════════════════

Config.MenuItems = {
    -- Main menu items
    {
        id = 'inventory',
        label = 'Saddlebags',
        icon = '🎒',
        description = 'Open your inventory',
        enabled = true,
        action = 'openInventory',
    },
    
    {
        id = 'horse',
        label = 'Horse',
        icon = '🐴',
        description = 'Horse management',
        enabled = true,
        submenu = 'horse_menu',
    },
    
    {
        id = 'weapons',
        label = 'Weapons',
        icon = '🔫',
        description = 'Weapon management',
        enabled = true,
        submenu = 'weapons_menu',
    },
    
    {
        id = 'clothing',
        label = 'Wardrobe',
        icon = '👔',
        description = 'Change clothing',
        enabled = true,
        action = 'openClothing',
    },
    
    {
        id = 'emotes',
        label = 'Gestures',
        icon = '👋',
        description = 'Perform gestures',
        enabled = true,
        submenu = 'emotes_menu',
    },
    
    {
        id = 'interactions',
        label = 'Interactions',
        icon = '🤝',
        description = 'Player interactions',
        enabled = true,
        submenu = 'interactions_menu',
    },
    
    {
        id = 'settings',
        label = 'Settings',
        icon = '⚙️',
        description = 'Menu preferences',
        enabled = true,
        action = 'openSettings',
    }
}

-- ════════════════════════════════════════════════════════════════
-- SUBMENUS
-- ════════════════════════════════════════════════════════════════

Config.Submenus = {
    horse_menu = {
        {
            id = 'horse_whistle',
            label = 'Whistle Horse',
            icon = '📣',
            action = 'whistleHorse',
        },
        {
            id = 'horse_feed',
            label = 'Feed Horse',
            icon = '🌾',
            action = 'feedHorse',
        },
        {
            id = 'horse_brush',
            label = 'Brush Horse',
            icon = '✨',
            action = 'brushHorse',
        },
        {
            id = 'horse_cargo',
            label = 'Horse Cargo',
            icon = '📦',
            action = 'openHorseCargo',
        }
    },
    
    weapons_menu = {
        {
            id = 'holster',
            label = 'Holster',
            icon = '🔒',
            action = 'holsterWeapon',
        },
        {
            id = 'clean',
            label = 'Clean Weapon',
            icon = '🧽',
            action = 'cleanWeapon',
        }
    },
    
    emotes_menu = {
        {
            id = 'greet',
            label = 'Greet',
            icon = '👋',
            action = 'emote_greet',
        },
        {
            id = 'sit',
            label = 'Sit',
            icon = '🪑',
            action = 'emote_sit',
        },
        {
            id = 'smoke',
            label = 'Smoke',
            icon = '🚬',
            action = 'emote_smoke',
        }
    },
    
    interactions_menu = {
        {
            id = 'rob',
            label = 'Rob',
            icon = '💰',
            action = 'robPlayer',
            requiresTarget = true,
        },
        {
            id = 'carry',
            label = 'Carry',
            icon = '🤲',
            action = 'carryPlayer',
            requiresTarget = true,
        },
        {
            id = 'search',
            label = 'Search',
            icon = '🔍',
            action = 'searchPlayer',
            requiresTarget = true,
        }
    }
}

-- ════════════════════════════════════════════════════════════════
-- JOB-SPECIFIC MENUS
-- ════════════════════════════════════════════════════════════════

Config.JobMenus = {
    -- Sheriff/Law Enforcement
    sheriff = {
        {
            id = 'handcuff',
            label = 'Handcuff',
            icon = '⛓️',
            action = 'handcuffPlayer',
            requiresTarget = true,
        },
        {
            id = 'escort',
            label = 'Escort',
            icon = '🚶',
            action = 'escortPlayer',
            requiresTarget = true,
        },
        {
            id = 'jail',
            label = 'Send to Jail',
            icon = '🔒',
            action = 'jailPlayer',
            requiresTarget = true,
        }
    },
    
    -- Doctor/Medic
    doctor = {
        {
            id = 'revive',
            label = 'Revive',
            icon = '💚',
            action = 'revivePlayer',
            requiresTarget = true,
        },
        {
            id = 'bandage',
            label = 'Bandage',
            icon = '🩹',
            action = 'bandagePlayer',
            requiresTarget = true,
        },
        {
            id = 'diagnose',
            label = 'Diagnose',
            icon = '🔬',
            action = 'diagnosePlayer',
            requiresTarget = true,
        }
    }
}

-- ════════════════════════════════════════════════════════════════
-- PERFORMANCE SETTINGS
-- ════════════════════════════════════════════════════════════════

Config.Performance = {
    profile = 'high',         -- 'low', 'medium', 'high', 'ultra'
    
    -- Cache settings
    enableCache = true,
    clearCacheOnClose = false,
    
    -- Thread optimization
    sleepDuration = 1000,     -- ms between checks when closed
    
    -- Rendering
    maxDrawDistance = 10.0,   -- meters
}

-- ════════════════════════════════════════════════════════════════
-- EXPORTS & API
-- ════════════════════════════════════════════════════════════════

Config.Exports = {
    -- Allow other resources to add menu items
    allowExternalItems = true,
    
    -- Allow external themes
    allowExternalThemes = true,
}

return Config
