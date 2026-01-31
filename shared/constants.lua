--[[
    🐺 LXR Radial Menu - Shared Constants
    Centralized constants used across client and server
]]

Constants = {}

-- Version Information
Constants.VERSION = '2.0.0'
Constants.BUILD_DATE = '2026-01-31'
Constants.AUTHOR = 'iBoss'

-- Framework Names
Constants.FRAMEWORKS = {
    LXRCORE = 'lxrcore',
    VORP = 'vorp',
    RSG = 'rsg',
    REDEM = 'redem',
    QBR = 'qbr',
    STANDALONE = 'standalone'
}

-- Event Names (Centralized)
Constants.EVENTS = {
    -- Client Events
    CLIENT = {
        OPEN_MENU = 'lxr-radialmenu:client:openMenu',
        CLOSE_MENU = 'lxr-radialmenu:client:closeMenu',
        REFRESH_MENU = 'lxr-radialmenu:client:refreshMenu',
        TRIGGER_ACTION = 'lxr-radialmenu:client:triggerAction',
    },
    -- Server Events
    SERVER = {
        REQUEST_MENU = 'lxr-radialmenu:server:requestMenu',
        LOG_ACTION = 'lxr-radialmenu:server:logAction',
        SYNC_SETTINGS = 'lxr-radialmenu:server:syncSettings',
    },
    -- NUI Events
    NUI = {
        OPEN = 'openMenu',
        CLOSE = 'closeMenu',
        SELECT = 'selectItem',
        HOVER = 'hoverItem',
    }
}

-- Key Mappings
Constants.KEYS = {
    ESC = 322,
    F1 = 288,
    F2 = 289,
    MOUSE_LEFT = 24,
    MOUSE_RIGHT = 25,
}

-- Animation Speeds
Constants.ANIMATION = {
    INSTANT = 0,
    FAST = 150,
    NORMAL = 300,
    SLOW = 500,
}

-- Menu States
Constants.MENU_STATE = {
    CLOSED = 0,
    OPENING = 1,
    OPEN = 2,
    CLOSING = 3,
}

-- Default Theme Colors
Constants.DEFAULT_THEME = {
    primary = '#8B4513',
    secondary = '#DAA520',
    background = 'rgba(0, 0, 0, 0.8)',
    text = '#F5DEB3',
    hover = '#CD853F',
    accent = '#FFD700',
}

-- Performance Profiles
Constants.PERFORMANCE_PROFILES = {
    LOW = {
        enableBlur = false,
        enableAnimations = false,
        enableParticles = false,
        maxItems = 8,
    },
    MEDIUM = {
        enableBlur = true,
        enableAnimations = true,
        enableParticles = false,
        maxItems = 12,
    },
    HIGH = {
        enableBlur = true,
        enableAnimations = true,
        enableParticles = true,
        maxItems = 16,
    },
    ULTRA = {
        enableBlur = true,
        enableAnimations = true,
        enableParticles = true,
        maxItems = 20,
    }
}

return Constants
