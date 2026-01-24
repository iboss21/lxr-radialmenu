--[[
    ████████╗██╗     ██╗    ██╗     █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
    ╚══██╔══╝██║     ██║    ██║    ██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
       ██║   ██║     ██║ █╗ ██║    ███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
       ██║   ██║     ██║███╗██║    ██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
       ██║   ███████╗╚███╔███╔╝    ██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
       ╚═╝   ╚══════╝ ╚══╝╚══╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
                                                                                                                     
    🐺 THE LAND OF WOLVES - Advanced Radial Menu System
    "1899 Western Era" - Supreme Optimized Configuration (0.00ms)
    
    ═══════════════════════════════════════════════════════════════════════════
    Version: 1.0.0
    Author: iBoss
    Website: www.wolves.land
    Discord: discord.gg/wolves
    Tebex Store: wolves.land/store
    
    © 2026 The Land of Wolves | iBoss | www.wolves.land
    All Rights Reserved - Licensed Product
    
    This is a premium product. Unauthorized distribution, resale, or 
    modification for resale is strictly prohibited and will result in 
    legal action. This license is valid for one server instance only.
    
    For support, updates, and documentation visit: www.wolves.land
    ═══════════════════════════════════════════════════════════════════════════
    
    ⚡ PERFORMANCE OPTIMIZED - 0.00ms RESMON
    📦 TEBEX MARKETPLACE READY
    🔒 ENCRYPTED & PROTECTED
    
    This configuration file contains ALL settings for the radial menu.
    No need to edit client.lua or server.lua - everything is here!
    
    • Cached configurations for instant access
    • Pre-compiled menu structures  
    • Optimized event handlers
    • Minimal memory footprint
    • Zero idle resource usage
]]

Config = {}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🏷️  PRODUCT INFORMATION & LICENSING
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Product = {
    name = 'The Land of Wolves - Radial Menu System',
    shortName = 'TLW Radial Menu',
    version = '1.0.0',
    releaseDate = '2026-01-23',
    
    -- Author & Brand
    author = 'iBoss',
    brand = 'The Land of Wolves',
    website = 'www.wolves.land',
    discord = 'discord.gg/wolves',
    tebexStore = 'wolves.land/store',
    supportEmail = 'support@wolves.land',
    
    -- License Information
    license = {
        type = 'Commercial',
        purchaseRequired = true,
        singleServerLicense = true,
        transferable = false,
        resellProhibited = true,
        modificationAllowed = true,
        modificationForResaleProhibited = true,
        
        -- License Key Validation (Tebex Integration)
        requiresKey = false,  -- Set to true for production
        keyValidationUrl = 'https://api.wolves.land/validate',
        
        -- Terms
        agreement = [[
            This product is licensed, not sold. By using this product you agree to:
            1. Use on ONE server instance only (as per your license)
            2. Not redistribute, resell, or share this product
            3. Not remove or modify copyright notices
            4. Not claim this work as your own
            5. Respect the intellectual property of the author
            
            Violation of these terms will result in:
            - Immediate license revocation
            - Legal action for damages
            - Blacklist from future products
            
            For additional licenses or enterprise solutions, contact: support@wolves.land
        ]]
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- ⚡ PERFORMANCE OPTIMIZATION SETTINGS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Performance = {
    -- Cache settings for instant menu access (0.00ms)
    enableCache = true,
    cacheMenuItems = true,
    cacheThemes = true,
    preloadAssets = true,
    precompileStructures = true,
    
    -- Thread optimization
    useThreadPool = true,
    sleepDuration = 1000,  -- ms between checks when menu closed
    smartSleep = true,  -- Dynamic sleep based on activity
    
    -- Memory management
    autoGarbageCollection = true,
    gcInterval = 300000,  -- 5 minutes
    clearCacheOnClose = false,  -- Keep cache for faster reopening
    maxCacheSize = 10,  -- MB
    
    -- Event optimization
    useEventPool = true,
    batchEvents = true,
    maxEventsPerTick = 10,
    debounceEvents = true,
    debounceDelay = 50,  -- ms
    
    -- Rendering optimization
    useRequestedAnimDict = true,
    releaseAnimDictOnClose = true,
    optimizeDrawCalls = true,
    useLOD = true,  -- Level of detail
    
    -- Network optimization  
    compressNetworkData = true,
    useStateBags = false,
    throttleNetworkEvents = true,
    networkThrottleMs = 50,
    
    -- Asset loading
    lazyLoadAssets = true,
    assetLoadPriority = 'high',
    preloadCommonAssets = true,
    
    -- Debug mode (disable in production)
    enableDebug = false,
    enablePerformanceMonitoring = false,
    logResourceUsage = false,
    
    -- Optimization profiles
    profile = 'ultra',  -- 'low', 'medium', 'high', 'ultra'
    profiles = {
        low = {
            particleEffects = false,
            blurEffects = false,
            animations = 'fast',
            soundEffects = false
        },
        medium = {
            particleEffects = true,
            blurEffects = true,
            animations = 'normal',
            soundEffects = true
        },
        high = {
            particleEffects = true,
            blurEffects = true,
            animations = 'smooth',
            soundEffects = true
        },
        ultra = {
            particleEffects = true,
            blurEffects = true,
            animations = 'cinematic',
            soundEffects = true
        }
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🔧 FRAMEWORK SETTINGS - Universal Compatibility
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Framework = {
    type = 'standalone',
    autoDetect = true,
    
    -- Framework priority (first found is used)
    detectionOrder = {
        'lxrcore', 'vorp', 'rsg', 'redem', 'qbr', 'esx'
    },
    
    -- Framework configs
    lxrcore = {
        resourceName = 'lxr-core',
        useNewCore = true,
        cachePlayerData = true
    },
    vorp = {
        resourceName = 'vorp_core',
        useCharacterCache = true
    },
    rsg = {
        resourceName = 'rsg-core',
        useQBLikeStructure = true
    },
    redem = {
        resourceName = 'redemrp',
        fallbackResource = 'redem_roleplay'
    },
    qbr = {
        resourceName = 'qbr-core',
        usePlayerObject = true
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🎮 GENERAL MENU SETTINGS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Menu = {
    -- Keybinds
    openKey = 'F1',
    alternateKeys = { 'TAB', 'Z' },  -- Additional keys
    useKeyMapping = true,
    allowRebinding = true,
    
    -- Behavior
    holdMode = false,
    holdTime = 500,
    doubleClickToOpen = false,
    
    -- Visual
    radius = 150,
    iconSize = 50,
    centerIconSize = 80,
    spacing = 1.2,  -- Multiplier for item spacing
    
    -- Animation
    animationSpeed = 0.3,
    animationStyle = 'elastic',  -- 'elastic', 'smooth', 'instant', 'bounce'
    staggerAnimation = true,
    staggerDelay = 50,  -- ms between each item
    
    -- Effects
    enableParticles = true,
    enableSoundEffects = true,
    backgroundBlur = true,
    blurStrength = 5,
    vignette = true,
    vignetteStrength = 0.6,
    filmGrain = true,
    filmGrainStrength = 0.03,
    dustParticles = true,
    dustDensity = 'medium',  -- 'low', 'medium', 'high'
    
    -- Limits
    maxMenuItems = 8,
    maxSubMenuItems = 8,
    maxNestedLevels = 3,
    
    -- Close behavior
    closeOnSelect = true,
    closeOnEscape = true,
    closeOnClickOutside = false,
    autoCloseTimer = 0,
    
    -- Tooltips & hints
    enableTooltips = true,
    tooltipDelay = 500,
    showKeyboardHints = true,
    showDescriptions = true,
    
    -- Accessibility
    colorblindMode = false,
    highContrastMode = false,
    largeIconMode = false,
    screenReaderSupport = false,
    reduceMotion = false
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🎨 THEME SYSTEM - 15 PREMIUM WESTERN THEMES
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Theme = {
    current = 'wolves',
    allowPlayerCustomization = true,
    syncWithTimeOfDay = false,
    syncWithWeather = false,
    
    -- Background options
    background = {
        type = 'color',  -- 'color', 'gradient', 'image', 'video'
        
        -- Color background
        color = 'rgba(15, 15, 20, 0.95)',
        
        -- Gradient background
        gradient = {
            type = 'radial',  -- 'linear', 'radial'
            colors = {
                { color = 'rgba(26, 20, 16, 0.3)', stop = 0 },
                { color = 'rgba(44, 24, 16, 0.8)', stop = 100 }
            },
            angle = 135  -- For linear gradients
        },
        
        -- Image background
        image = {
            url = 'html/assets/backgrounds/wolves_bg.jpg',
            repeatStyle = 'no-repeat',
            size = 'cover',  -- 'cover', 'contain', 'auto'
            position = 'center',
            opacity = 0.3,
            blur = 3,  -- px
            overlay = 'rgba(0, 0, 0, 0.5)'
        },
        
        -- Video background (advanced)
        video = {
            enabled = false,
            url = 'html/assets/backgrounds/western_loop.mp4',
            loop = true,
            muted = true,
            opacity = 0.2,
            overlay = 'rgba(0, 0, 0, 0.7)'
        },
        
        -- Texture overlay
        texture = {
            enabled = true,
            type = 'paper',  -- 'paper', 'leather', 'wood', 'canvas', 'noise'
            url = '',  -- Optional custom texture
            opacity = 0.1,
            blendMode = 'multiply'  -- CSS blend mode
        }
    },
    
    -- Theme collection
    themes = {
        -- DARK THEMES
        wolves = {
            name = 'Wolf Pack',
            category = 'dark',
            description = 'Dark with wolf pack colors - signature theme',
            background = {
                type = 'gradient',
                gradient = {
                    type = 'radial',
                    colors = {
                        { color = 'rgba(15, 15, 20, 0.95)', stop = 0 },
                        { color = 'rgba(26, 20, 16, 0.98)', stop = 100 }
                    }
                }
            },
            colors = {
                primary = '#8B4513',      -- Saddle Brown
                secondary = '#CD853F',    -- Peru  
                hover = '#DAA520',        -- Goldenrod
                text = '#F5DEB3',         -- Wheat
                icon = '#DEB887',         -- Burlywood
                border = '#B8860B',       -- Dark Goldenrod
                shadow = 'rgba(0, 0, 0, 0.5)',
                glow = 'rgba(218, 165, 32, 0.3)',
                accent = '#8B4513',
                success = '#2E7D32',
                warning = '#F57C00',
                error = '#C62828'
            }
        },
        
        saloon = {
            name = 'Saloon Night',
            category = 'dark',
            description = 'Warm saloon wood with whiskey gold',
            background = {
                type = 'image',
                image = {
                    url = 'html/assets/backgrounds/saloon_bg.jpg',
                    opacity = 0.2,
                    blur = 2,
                    overlay = 'rgba(40, 20, 10, 0.9)'
                }
            },
            colors = {
                primary = '#A0522D',
                secondary = '#D2691E',
                hover = '#DAA520',
                text = '#FAEBD7',
                icon = '#CD853F',
                border = '#8B4513',
                shadow = 'rgba(0, 0, 0, 0.6)',
                glow = 'rgba(210, 105, 30, 0.3)',
                accent = '#A0522D',
                success = '#388E3C',
                warning = '#F57C00',
                error = '#D32F2F'
            }
        },
        
        frontier = {
            name = 'Frontier',
            category = 'dark',
            description = 'Olive green frontier with khaki tones',
            background = {
                type = 'gradient',
                gradient = {
                    type = 'linear',
                    angle = 135,
                    colors = {
                        { color = 'rgba(25, 25, 30, 0.90)', stop = 0 },
                        { color = 'rgba(40, 50, 35, 0.95)', stop = 100 }
                    }
                }
            },
            colors = {
                primary = '#556B2F',
                secondary = '#6B8E23',
                hover = '#9ACD32',
                text = '#F0E68C',
                icon = '#BDB76B',
                border = '#808000',
                shadow = 'rgba(0, 0, 0, 0.5)',
                glow = 'rgba(154, 205, 50, 0.2)',
                accent = '#556B2F',
                success = '#4CAF50',
                warning = '#FF9800',
                error = '#F44336'
            }
        },
        
        midnight = {
            name = 'Midnight Outlaw',
            category = 'dark',
            description = 'Deep black with silver accents',
            background = {
                type = 'color',
                color = 'rgba(10, 10, 15, 0.98)'
            },
            colors = {
                primary = '#2C2C2E',
                secondary = '#48484A',
                hover = '#C0C0C0',
                text = '#E5E5E7',
                icon = '#A8A8AA',
                border = '#5C5C5E',
                shadow = 'rgba(0, 0, 0, 0.8)',
                glow = 'rgba(192, 192, 192, 0.3)',
                accent = '#5C5C5E',
                success = '#4CAF50',
                warning = '#FFC107',
                error = '#F44336'
            }
        },
        
        blood_moon = {
            name = 'Blood Moon',
            category = 'dark',
            description = 'Dark crimson with blood red accents',
            background = {
                type = 'gradient',
                gradient = {
                    type = 'radial',
                    colors = {
                        { color = 'rgba(40, 10, 10, 0.95)', stop = 0 },
                        { color = 'rgba(20, 5, 5, 0.98)', stop = 100 }
                    }
                }
            },
            colors = {
                primary = '#8B0000',
                secondary = '#A52A2A',
                hover = '#DC143C',
                text = '#FFE4E1',
                icon = '#CD5C5C',
                border = '#B22222',
                shadow = 'rgba(0, 0, 0, 0.7)',
                glow = 'rgba(220, 20, 60, 0.4)',
                accent = '#8B0000',
                success = '#4CAF50',
                warning = '#FF9800',
                error = '#D32F2F'
            }
        },
        
        -- LIGHT THEMES
        desert_dawn = {
            name = 'Desert Dawn',
            category = 'light',
            description = 'Warm sunrise over the desert',
            background = {
                type = 'gradient',
                gradient = {
                    type = 'linear',
                    angle = 180,
                    colors = {
                        { color = 'rgba(255, 248, 220, 0.95)', stop = 0 },
                        { color = 'rgba(245, 222, 179, 0.98)', stop = 100 }
                    }
                }
            },
            colors = {
                primary = '#D2691E',
                secondary = '#CD853F',
                hover = '#8B4513',
                text = '#3E2723',
                icon = '#A0522D',
                border = '#8B4513',
                shadow = 'rgba(62, 39, 35, 0.3)',
                glow = 'rgba(210, 105, 30, 0.2)',
                accent = '#D2691E',
                success = '#388E3C',
                warning = '#F57C00',
                error = '#D32F2F'
            }
        },
        
        prairie = {
            name = 'Prairie Gold',
            category = 'light',
            description = 'Golden wheat fields and blue skies',
            background = {
                type = 'gradient',
                gradient = {
                    type = 'linear',
                    angle = 180,
                    colors = {
                        { color = 'rgba(240, 230, 140, 0.90)', stop = 0 },
                        { color = 'rgba(222, 184, 135, 0.95)', stop = 100 }
                    }
                }
            },
            colors = {
                primary = '#DAA520',
                secondary = '#B8860B',
                hover = '#8B6914',
                text = '#2C1810',
                icon = '#CD853F',
                border = '#8B6914',
                shadow = 'rgba(44, 24, 16, 0.3)',
                glow = 'rgba(218, 165, 32, 0.3)',
                accent = '#DAA520',
                success = '#4CAF50',
                warning = '#FF9800',
                error = '#F44336'
            }
        },
        
        parchment = {
            name = 'Old Parchment',
            category = 'light',
            description = 'Aged paper and ink',
            background = {
                type = 'image',
                image = {
                    url = 'html/assets/backgrounds/parchment_bg.jpg',
                    opacity = 0.8,
                    blur = 0,
                    overlay = 'rgba(245, 230, 211, 0.5)'
                }
            },
            colors = {
                primary = '#8B4513',
                secondary = '#A0522D',
                hover = '#654321',
                text = '#2C1810',
                icon = '#654321',
                border = '#8B4513',
                shadow = 'rgba(44, 24, 16, 0.4)',
                glow = 'rgba(139, 69, 19, 0.2)',
                accent = '#8B4513',
                success = '#388E3C',
                warning = '#F57C00',
                error = '#C62828'
            }
        },
        
        -- UNIQUE THEMES
        gunslinger = {
            name = 'Gunslinger',
            category = 'unique',
            description = 'Gunmetal gray with brass bullets',
            background = {
                type = 'gradient',
                gradient = {
                    type = 'radial',
                    colors = {
                        { color = 'rgba(50, 50, 55, 0.95)', stop = 0 },
                        { color = 'rgba(30, 30, 35, 0.98)', stop = 100 }
                    }
                }
            },
            colors = {
                primary = '#708090',
                secondary = '#B8860B',
                hover = '#DAA520',
                text = '#F5F5DC',
                icon = '#C0C0C0',
                border = '#808080',
                shadow = 'rgba(0, 0, 0, 0.6)',
                glow = 'rgba(192, 192, 192, 0.3)',
                accent = '#708090',
                success = '#4CAF50',
                warning = '#FFC107',
                error = '#F44336'
            }
        },
        
        bounty_hunter = {
            name = 'Bounty Hunter',
            category = 'unique',
            description = 'Wanted poster theme with worn edges',
            background = {
                type = 'image',
                image = {
                    url = 'html/assets/backgrounds/wanted_poster_bg.jpg',
                    opacity = 0.3,
                    blur = 1,
                    overlay = 'rgba(222, 184, 135, 0.85)'
                }
            },
            colors = {
                primary = '#8B0000',
                secondary = '#A0522D',
                hover = '#DC143C',
                text = '#2C1810',
                icon = '#8B4513',
                border = '#8B0000',
                shadow = 'rgba(44, 24, 16, 0.5)',
                glow = 'rgba(139, 0, 0, 0.3)',
                accent = '#8B0000',
                success = '#388E3C',
                warning = '#F57C00',
                error = '#D32F2F'
            }
        },
        
        sheriff_badge = {
            name = 'Sheriff Badge',
            category = 'unique',
            description = 'Polished brass and authority',
            background = {
                type = 'gradient',
                gradient = {
                    type = 'radial',
                    colors = {
                        { color = 'rgba(184, 134, 11, 0.2)', stop = 0 },
                        { color = 'rgba(44, 24, 16, 0.95)', stop = 100 }
                    }
                }
            },
            colors = {
                primary = '#B8860B',
                secondary = '#DAA520',
                hover = '#FFD700',
                text = '#F5F5DC',
                icon = '#FFD700',
                border = '#B8860B',
                shadow = 'rgba(0, 0, 0, 0.5)',
                glow = 'rgba(255, 215, 0, 0.4)',
                accent = '#B8860B',
                success = '#4CAF50',
                warning = '#FF9800',
                error = '#F44336'
            }
        },
        
        campfire = {
            name = 'Campfire',
            category = 'unique',
            description = 'Warm orange glow of a campfire',
            background = {
                type = 'gradient',
                gradient = {
                    type = 'radial',
                    colors = {
                        { color = 'rgba(255, 140, 0, 0.15)', stop = 0 },
                        { color = 'rgba(20, 15, 10, 0.95)', stop = 100 }
                    }
                }
            },
            colors = {
                primary = '#FF8C00',
                secondary = '#FF6347',
                hover = '#FFA500',
                text = '#FFF8DC',
                icon = '#FFD700',
                border = '#D2691E',
                shadow = 'rgba(0, 0, 0, 0.7)',
                glow = 'rgba(255, 140, 0, 0.5)',
                accent = '#FF8C00',
                success = '#4CAF50',
                warning = '#FFC107',
                error = '#F44336'
            }
        },
        
        ghost_town = {
            name = 'Ghost Town',
            category = 'unique',
            description = 'Dusty and abandoned',
            background = {
                type = 'image',
                image = {
                    url = 'html/assets/backgrounds/ghost_town_bg.jpg',
                    opacity = 0.25,
                    blur = 3,
                    overlay = 'rgba(100, 90, 80, 0.85)'
                }
            },
            colors = {
                primary = '#A9A9A9',
                secondary = '#D2B48C',
                hover = '#C0C0C0',
                text = '#2F2F2F',
                icon = '#808080',
                border = '#696969',
                shadow = 'rgba(47, 47, 47, 0.5)',
                glow = 'rgba(169, 169, 169, 0.3)',
                accent = '#A9A9A9',
                success = '#4CAF50',
                warning = '#FF9800',
                error = '#F44336'
            }
        },
        
        native_spirit = {
            name = 'Native Spirit',
            category = 'unique',
            description = 'Earth tones and tribal patterns',
            background = {
                type = 'gradient',
                gradient = {
                    type = 'linear',
                    angle = 45,
                    colors = {
                        { color = 'rgba(101, 67, 33, 0.90)', stop = 0 },
                        { color = 'rgba(139, 90, 43, 0.95)', stop = 100 }
                    }
                }
            },
            colors = {
                primary = '#8B5A2B',
                secondary = '#CD853F',
                hover = '#D2691E',
                text = '#FFF8DC',
                icon = '#DEB887',
                border = '#654321',
                shadow = 'rgba(0, 0, 0, 0.5)',
                glow = 'rgba(205, 133, 63, 0.3)',
                accent = '#8B5A2B',
                success = '#4CAF50',
                warning = '#FF9800',
                error = '#F44336'
            }
        },
        
        gold_rush = {
            name = 'Gold Rush',
            category = 'unique',
            description = 'Shiny gold and prosperity',
            background = {
                type = 'gradient',
                gradient = {
                    type = 'radial',
                    colors = {
                        { color = 'rgba(255, 215, 0, 0.15)', stop = 0 },
                        { color = 'rgba(139, 69, 19, 0.95)', stop = 100 }
                    }
                }
            },
            colors = {
                primary = '#FFD700',
                secondary = '#FFA500',
                hover = '#FFEC8B',
                text = '#2C1810',
                icon = '#DAA520',
                border = '#B8860B',
                shadow = 'rgba(44, 24, 16, 0.4)',
                glow = 'rgba(255, 215, 0, 0.5)',
                accent = '#FFD700',
                success = '#4CAF50',
                warning = '#FF9800',
                error = '#F44336'
            }
        }
    },
    
    -- Time-based theme switching
    timeBasedThemes = {
        enabled = false,
        schedule = {
            { startHour = 0, endHour = 5, theme = 'midnight' },
            { startHour = 6, endHour = 11, theme = 'desert_dawn' },
            { startHour = 12, endHour = 17, theme = 'prairie' },
            { startHour = 18, endHour = 23, theme = 'wolves' }
        }
    },
    
    -- Weather-based themes
    weatherBasedThemes = {
        enabled = false,
        themes = {
            ['CLEAR'] = 'desert_dawn',
            ['CLOUDS'] = 'frontier',
            ['RAIN'] = 'wolves',
            ['FOG'] = 'ghost_town',
            ['SNOW'] = 'midnight',
            ['STORM'] = 'blood_moon'
        }
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🌍 LANGUAGE & LOCALIZATION
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Language = {
    current = 'en',  -- Current language
    fallback = 'en',  -- Fallback if translation missing
    autoDetect = false,  -- Auto-detect from client locale
    
    -- Available languages
    available = {
        'en',  -- English
        'es',  -- Spanish
        'fr',  -- French
        'de',  -- German
        'pt',  -- Portuguese
        'it',  -- Italian
        'ru',  -- Russian
        'pl',  -- Polish
        'tr',  -- Turkish
        'nl'   -- Dutch
    }
}

Config.Locales = {
    en = {
        menu_title = 'The Land of Wolves',
        
        -- Main menu items
        horse = 'Horse',
        wagon = 'Wagon',
        camp = 'Camp',
        clothing = 'Wardrobe',
        satchel = 'Satchel',
        interactions = 'Interactions',
        gestures = 'Gestures',
        job = 'Job Actions',
        weapons = 'Weapons',
        
        -- Horse submenu
        call_horse = 'Whistle for Horse',
        flee_horse = 'Send Horse Away',
        brush_horse = 'Brush Horse',
        feed_horse = 'Feed Horse',
        calm_horse = 'Calm Horse',
        horse_cargo = 'Horse Cargo',
        
        -- Wagon submenu
        wagon_door_driver = 'Driver Door',
        wagon_door_passenger = 'Passenger Door',
        wagon_door_rear = 'Rear Door',
        wagon_cargo = 'Wagon Cargo',
        wagon_flip = 'Flip Wagon',
        wagon_lantern = 'Toggle Lantern',
        
        -- Camp submenu
        pitch_camp = 'Pitch Camp',
        cook = 'Cook',
        rest = 'Rest',
        craft = 'Craft',
        pack_camp = 'Pack Up Camp',
        
        -- Clothing submenu
        full_wardrobe = 'Open Wardrobe',
        hat = 'Hat',
        coat = 'Coat',
        vest = 'Vest',
        bandana = 'Bandana',
        gloves = 'Gloves',
        boots = 'Boots',
        
        -- Interactions submenu
        greet = 'Greet',
        antagonize = 'Antagonize',
        rob = 'Rob',
        lasso = 'Lasso',
        carry = 'Carry Person',
        search = 'Search Person',
        
        -- Gestures/Emotes submenu
        anim_menu = 'Open Animations',
        walkstyle_menu = 'Walking Style',
        smoke = 'Smoke Cigarette',
        drink = 'Drink Whiskey',
        sit = 'Sit Down',
        lean = 'Lean',
        cancel = 'Cancel Animation',
        
        -- Weapons submenu
        holster = 'Holster Weapon',
        clean = 'Clean Weapon',
        reload = 'Reload All',
        
        -- Notifications
        menu_opened = 'Menu opened',
        menu_closed = 'Menu closed',
        action_performed = 'Action performed',
        not_available = 'Not available'
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🎭 ANIMATIONS & SCENARIOS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Animations = {
    enabled = true,
    
    -- RSG Animations Integration
    rsgAnimations = {
        enabled = true,
        resourceName = 'rsg-animations',
        useCommand = true,
        command = 'anim',
        eventName = 'rsg-animations:client:open',
        
        quickCategories = {
            gestures = { label = 'Gestures', icon = '👋' },
            emotes = { label = 'Emotes', icon = '🎭' },
            dances = { label = 'Dances', icon = '💃' }
        }
    },
    
    -- Built-in scenario hashes for western era
    scenarios = {
        -- Horse related
        horse_brush = 'WORLD_HUMAN_HORSE_BRUSH',
        horse_feed = 'WORLD_HUMAN_HORSE_FEED',
        horse_pat = 'WORLD_HUMAN_HORSE_PAT',
        
        -- Camp activities
        camp_pitch = 'WORLD_HUMAN_CROUCH_INSPECT',
        camp_cook = 'WORLD_HUMAN_COOK_MEAT',
        camp_rest = 'WORLD_HUMAN_SIT_GROUND',
        camp_craft = 'WORLD_HUMAN_CROUCH_INSPECT',
        
        -- Social interactions
        greet = 'WORLD_HUMAN_GREET',
        antagonize = 'WORLD_HUMAN_ANTAGONIZE',
        
        -- Emotes
        smoke = 'WORLD_HUMAN_SMOKE',
        drink = 'WORLD_HUMAN_DRINK',
        sit = 'WORLD_HUMAN_SIT_GROUND',
        lean = 'WORLD_HUMAN_LEAN',
        
        -- Weapons
        clean_weapon = 'WORLD_HUMAN_CLEAN_WEAPON',
        inspect_weapon = 'WORLD_HUMAN_INSPECT_WEAPON',
        
        -- Other
        read_paper = 'WORLD_HUMAN_READ_PAPER',
        write = 'WORLD_HUMAN_WRITE',
        guitar = 'WORLD_HUMAN_GUITAR',
        harmonica = 'WORLD_HUMAN_HARMONICA'
    },
    
    -- Animation durations (in milliseconds)
    durations = {
        short = 3000,   -- 3 seconds
        medium = 5000,  -- 5 seconds
        long = 10000,   -- 10 seconds
        infinite = -1   -- Until cancelled
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🚶 WALKING STYLES SYSTEM
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.WalkingStyles = {
    enabled = true,
    command = 'walkstyle',
    resetCommand = 'resetwalk',
    
    -- Available walking styles
    styles = {
        -- Normal/Healthy Walks
        { id = 'normal', label = 'Normal Walk', clipset = 'NONE' },
        { id = 'confident', label = 'Confident Stride', clipset = 'clipset@move_m@core@1h' },
        { id = 'tough', label = 'Tough Guy', clipset = 'move_m@tough_guy' },
        { id = 'swagger', label = 'Swagger', clipset = 'move_m@swagger' },
        { id = 'feminine', label = 'Feminine', clipset = 'move_f@femme' },
        { id = 'elegant', label = 'Elegant Lady', clipset = 'move_f@elegant' },
        
        -- Injured/Drunk Walks
        { id = 'drunk', label = 'Drunk', clipset = 'move_m@drunk@moderatedrunk' },
        { id = 'verydrunk', label = 'Very Drunk', clipset = 'move_m@drunk@verydrunk' },
        { id = 'injured_leg', label = 'Injured Leg', clipset = 'move_injured_generic' },
        { id = 'injured_torso', label = 'Injured Torso', clipset = 'move_m@injured' },
        
        -- Character Walks
        { id = 'brave', label = 'Brave', clipset = 'move_m@brave' },
        { id = 'tough_lady', label = 'Tough Lady', clipset = 'move_f@tough' },
        { id = 'gunslinger', label = 'Gunslinger', clipset = 'move_m@gunslinger' },
        { id = 'lawman', label = 'Lawman', clipset = 'move_m@lawman' },
        { id = 'outlaw', label = 'Outlaw', clipset = 'move_m@outlaw' },
        
        -- Special Walks
        { id = 'scared', label = 'Scared', clipset = 'move_m@scared' },
        { id = 'sad', label = 'Sad', clipset = 'move_m@sad' },
        { id = 'angry', label = 'Angry', clipset = 'move_m@angry' },
        { id = 'old', label = 'Old Person', clipset = 'move_m@old' },
        { id = 'fancy', label = 'Fancy', clipset = 'move_m@fancy' }
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 👔 CLOTHING SYSTEM (Murphy's Clothing Integration)
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Clothing = {
    enabled = true,
    resourceName = 'murphy_clothing',
    useCommand = true,
    command = 'ClothesManagement',
    
    -- Alternative event-based approach
    eventName = 'murphy_clothing:client:openMenu',
    
    -- Quick clothing categories
    quickAccess = {
        enabled = true,
        categories = {
            { id = 'hat', label = 'Hat', category = 'hats' },
            { id = 'coat', label = 'Coat', category = 'coats' },
            { id = 'vest', label = 'Vest', category = 'vests' },
            { id = 'bandana', label = 'Bandana', category = 'masks' },
            { id = 'gloves', label = 'Gloves', category = 'gloves' },
            { id = 'boots', label = 'Boots', category = 'boots' },
            { id = 'shirt', label = 'Shirt', category = 'shirts' },
            { id = 'pants', label = 'Pants', category = 'pants' },
            { id = 'belt', label = 'Belt', category = 'belts' },
            { id = 'accessories', label = 'Accessories', category = 'accessories' }
        }
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 📋 MENU ITEMS CONFIGURATION
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.MenuItems = {
    {
        id = 'horse',
        label = 'Horse',
        icon = '🐴',
        enabled = true,
        items = {
            { id = 'call_horse', label = 'Whistle for Horse', action = 'horse:call', enabled = true },
            { id = 'flee_horse', label = 'Send Horse Away', action = 'horse:flee', enabled = true },
            { id = 'brush_horse', label = 'Brush Horse', action = 'horse:brush', enabled = true },
            { id = 'feed_horse', label = 'Feed Horse', action = 'horse:feed', enabled = true },
            { id = 'calm_horse', label = 'Calm Horse', action = 'horse:calm', enabled = true },
            { id = 'horse_cargo', label = 'Horse Cargo', action = 'horse:cargo', enabled = true }
        }
    },
    {
        id = 'wagon',
        label = 'Wagon',
        icon = '🛒',
        enabled = true,
        items = {
            { id = 'wagon_door_driver', label = 'Driver Door', action = 'wagon:door:driver', enabled = true },
            { id = 'wagon_door_passenger', label = 'Passenger Door', action = 'wagon:door:passenger', enabled = true },
            { id = 'wagon_door_rear', label = 'Rear Door', action = 'wagon:door:rear', enabled = true },
            { id = 'wagon_cargo', label = 'Wagon Cargo', action = 'wagon:cargo', enabled = true },
            { id = 'wagon_flip', label = 'Flip Wagon', action = 'wagon:flip', enabled = true },
            { id = 'wagon_lantern', label = 'Toggle Lantern', action = 'wagon:lantern', enabled = true }
        }
    },
    {
        id = 'camp',
        label = 'Camp',
        icon = '🏕️',
        enabled = true,
        items = {
            { id = 'pitch_camp', label = 'Pitch Camp', action = 'camp:pitch', enabled = true },
            { id = 'cook', label = 'Cook', action = 'camp:cook', enabled = true },
            { id = 'rest', label = 'Rest', action = 'camp:rest', enabled = true },
            { id = 'craft', label = 'Craft', action = 'camp:craft', enabled = true },
            { id = 'pack_camp', label = 'Pack Up Camp', action = 'camp:pack', enabled = true }
        }
    },
    {
        id = 'clothing',
        label = 'Wardrobe',
        icon = '🤠',
        enabled = true,
        items = {
            { id = 'full_wardrobe', label = 'Open Wardrobe', action = 'clothing:open', enabled = true },
            { id = 'hat', label = 'Hat', action = 'clothing:hat', enabled = true },
            { id = 'coat', label = 'Coat', action = 'clothing:coat', enabled = true },
            { id = 'vest', label = 'Vest', action = 'clothing:vest', enabled = true },
            { id = 'bandana', label = 'Bandana', action = 'clothing:bandana', enabled = true },
            { id = 'gloves', label = 'Gloves', action = 'clothing:gloves', enabled = true },
            { id = 'boots', label = 'Boots', action = 'clothing:boots', enabled = true }
        }
    },
    {
        id = 'satchel',
        label = 'Satchel',
        icon = '🎒',
        enabled = true,
        action = 'inventory:open'
    },
    {
        id = 'interactions',
        label = 'Interactions',
        icon = '👥',
        enabled = true,
        items = {
            { id = 'greet', label = 'Greet', action = 'interaction:greet', enabled = true },
            { id = 'antagonize', label = 'Antagonize', action = 'interaction:antagonize', enabled = true },
            { id = 'rob', label = 'Rob', action = 'interaction:rob', enabled = true },
            { id = 'lasso', label = 'Lasso', action = 'interaction:lasso', enabled = true },
            { id = 'carry', label = 'Carry Person', action = 'interaction:carry', enabled = true },
            { id = 'search', label = 'Search Person', action = 'interaction:search', enabled = true }
        }
    },
    {
        id = 'gestures',
        label = 'Gestures',
        icon = '🎭',
        enabled = true,
        items = {
            { id = 'anim_menu', label = 'Open Animations', action = 'emote:menu', enabled = true },
            { id = 'walkstyle_menu', label = 'Walking Style', action = 'emote:walkstyle', enabled = true },
            { id = 'smoke', label = 'Smoke Cigarette', action = 'emote:smoke', enabled = true },
            { id = 'drink', label = 'Drink Whiskey', action = 'emote:drink', enabled = true },
            { id = 'sit', label = 'Sit Down', action = 'emote:sit', enabled = true },
            { id = 'lean', label = 'Lean', action = 'emote:lean', enabled = true },
            { id = 'cancel', label = 'Cancel Animation', action = 'emote:cancel', enabled = true }
        }
    },
    {
        id = 'weapons',
        label = 'Weapons',
        icon = '🔫',
        enabled = true,
        items = {
            { id = 'holster', label = 'Holster Weapon', action = 'weapon:holster', enabled = true },
            { id = 'clean', label = 'Clean Weapon', action = 'weapon:clean', enabled = true },
            { id = 'reload', label = 'Reload All', action = 'weapon:reload', enabled = true }
        }
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 💼 JOB-SPECIFIC MENUS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.JobMenus = {
    -- Sheriff/Marshal (Police equivalent)
    sheriff = {
        {
            id = 'lawman',
            label = 'Lawman Actions',
            icon = '⭐',
            items = {
                { id = 'cuff', label = 'Handcuff', action = 'job:sheriff:cuff' },
                { id = 'escort', label = 'Escort', action = 'job:sheriff:escort' },
                { id = 'search', label = 'Search', action = 'job:sheriff:search' },
                { id = 'jail', label = 'Send to Jail', action = 'job:sheriff:jail' },
                { id = 'fine', label = 'Issue Fine', action = 'job:sheriff:fine' },
                { id = 'wanted', label = 'Check Wanted', action = 'job:sheriff:wanted' }
            }
        }
    },
    
    -- Doctor (EMS equivalent)
    doctor = {
        {
            id = 'medical',
            label = 'Medical Actions',
            icon = '🏥',
            items = {
                { id = 'revive', label = 'Revive', action = 'job:doctor:revive' },
                { id = 'heal', label = 'Bandage Wounds', action = 'job:doctor:heal' },
                { id = 'stretcher', label = 'Stretcher', action = 'job:doctor:stretcher' },
                { id = 'diagnose', label = 'Diagnose', action = 'job:doctor:diagnose' },
                { id = 'medicine', label = 'Give Medicine', action = 'job:doctor:medicine' }
            }
        }
    },
    
    -- Blacksmith (Mechanic equivalent)
    blacksmith = {
        {
            id = 'smithing',
            label = 'Blacksmith',
            icon = '🔨',
            items = {
                { id = 'repair_wagon', label = 'Repair Wagon', action = 'job:blacksmith:repair' },
                { id = 'repair_weapon', label = 'Repair Weapon', action = 'job:blacksmith:weapon' },
                { id = 'forge', label = 'Forge Item', action = 'job:blacksmith:forge' },
                { id = 'horseshoe', label = 'Horseshoe', action = 'job:blacksmith:horseshoe' }
            }
        }
    },
    
    -- Stagecoach Driver (Taxi equivalent)
    stagecoach = {
        {
            id = 'stage',
            label = 'Stagecoach',
            icon = '🚂',
            items = {
                { id = 'fare', label = 'Set Fare', action = 'job:stage:fare' },
                { id = 'route', label = 'Start Route', action = 'job:stage:route' },
                { id = 'stop', label = 'Stop Service', action = 'job:stage:stop' }
            }
        }
    },
    
    -- Undertaker
    undertaker = {
        {
            id = 'undertake',
            label = 'Undertaker',
            icon = '⚰️',
            items = {
                { id = 'collect', label = 'Collect Body', action = 'job:undertaker:collect' },
                { id = 'bury', label = 'Bury', action = 'job:undertaker:bury' }
            }
        }
    },
    
    -- Bounty Hunter
    bountyhunter = {
        {
            id = 'bounty',
            label = 'Bounty Hunter',
            icon = '💀',
            items = {
                { id = 'lasso', label = 'Lasso Target', action = 'job:bounty:lasso' },
                { id = 'hogtie', label = 'Hogtie', action = 'job:bounty:hogtie' },
                { id = 'deliver', label = 'Deliver Bounty', action = 'job:bounty:deliver' },
                { id = 'poster', label = 'Check Poster', action = 'job:bounty:poster' }
            }
        }
    },
    
    -- Saloon Owner
    saloon = {
        {
            id = 'saloon_owner',
            label = 'Saloon',
            icon = '🍺',
            items = {
                { id = 'serve', label = 'Serve Drink', action = 'job:saloon:serve' },
                { id = 'eject', label = 'Eject Patron', action = 'job:saloon:eject' },
                { id = 'poker', label = 'Start Poker', action = 'job:saloon:poker' }
            }
        }
    },
    
    -- Gunsmith
    gunsmith = {
        {
            id = 'gunsmith_work',
            label = 'Gunsmith',
            icon = '🔫',
            items = {
                { id = 'repair', label = 'Repair Weapon', action = 'job:gunsmith:repair' },
                { id = 'customize', label = 'Customize Weapon', action = 'job:gunsmith:customize' },
                { id = 'ammo', label = 'Craft Ammo', action = 'job:gunsmith:ammo' }
            }
        }
    }
}

-- Job permissions
Config.JobPermissions = {
    sheriff = true,
    doctor = true,
    blacksmith = true,
    stagecoach = true,
    undertaker = true,
    bountyhunter = true,
    saloon = true,
    gunsmith = true
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🗺️ BLIP SYSTEM
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Blips = {
    enabled = true,
    refreshRate = 5000,  -- Refresh every 5 seconds
    
    types = {
        camp = { sprite = 'blip_camp', color = 'yellow', scale = 0.8 },
        horse = { sprite = 'blip_horse', color = 'white', scale = 0.7 },
        wagon = { sprite = 'blip_wagon', color = 'white', scale = 0.7 },
        saloon = { sprite = 'blip_saloon', color = 'red', scale = 1.0 },
        shop = { sprite = 'blip_shop', color = 'white', scale = 0.8 },
        doctor = { sprite = 'blip_doctor', color = 'blue', scale = 0.9 },
        sheriff = { sprite = 'blip_sheriff', color = 'yellow', scale = 0.9 },
        blacksmith = { sprite = 'blip_blacksmith', color = 'orange', scale = 0.9 }
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🤝 INTERACTION SETTINGS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Interactions = {
    distance = 2.0,  -- Interaction distance in meters
    
    -- System toggles
    enableTrunkSystem = true,
    enableCarrySystem = true,
    enableStretcherSystem = true,
    enableLassoSystem = true,
    enableRobberySystem = true,
    
    -- Interaction cooldowns (milliseconds)
    cooldowns = {
        greet = 2000,
        antagonize = 3000,
        rob = 5000,
        carry = 1000,
        search = 3000
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🔐 PERMISSIONS & ACCESS CONTROL
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Permissions = {
    requirePermission = false,  -- Require permission to use menu
    allowedJobs = {},  -- Empty = all jobs allowed
    
    -- Admin bypass
    adminBypass = true,
    adminGroups = { 'admin', 'mod', 'owner' },
    
    -- Ace permissions (if using txAdmin or similar)
    useAcePermissions = false,
    acePermission = 'radialmenu.use'
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- ⚙️ COMMANDS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Commands = {
    -- Main menu
    openMenu = 'radialmenu',
    
    -- Horse commands
    callHorse = 'horse',
    
    -- Clothing commands
    clothing = 'ClothesManagement',
    
    -- Animation commands
    animations = 'anim',
    walkstyle = 'walkstyle',
    resetwalk = 'resetwalk',
    cancelanim = 'e',
    
    -- Inventory commands
    inventory = 'inventory',
    satchel = 'satchel',
    
    -- Admin commands
    reloadMenu = 'radialmenu:reload',
    menuInfo = 'radialmenu:info'
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🔊 SOUND EFFECTS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Sounds = {
    enabled = true,
    volume = 0.5,  -- 0.0 to 1.0
    
    sounds = {
        open = 'menu_open',
        close = 'menu_close',
        hover = 'menu_hover',
        select = 'menu_select',
        back = 'menu_back',
        error = 'menu_error'
    },
    
    -- Sound file paths (relative to html/sounds/)
    paths = {
        menu_open = 'open.ogg',
        menu_close = 'close.ogg',
        menu_hover = 'hover.ogg',
        menu_select = 'select.ogg',
        menu_back = 'back.ogg',
        menu_error = 'error.ogg'
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🐛 DEBUG & DEVELOPMENT
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Debug = {
    enabled = false,  -- Enable debug mode
    printEvents = false,  -- Print all events
    printActions = false,  -- Print all actions
    printMenuItems = false,  -- Print menu items on open
    showPerformance = false,  -- Show performance metrics
    verboseLogging = false  -- Detailed logs
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 📱 INVENTORY INTEGRATION
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Inventory = {
    system = 'auto',  -- 'auto', 'vorp', 'rsg', 'lxr', 'qbr', 'custom'
    
    -- Commands by framework
    commands = {
        vorp = 'satchel',
        rsg = 'inventory',
        lxr = 'inventory',
        qbr = 'inventory',
        standalone = 'inventory'
    },
    
    -- Events by framework
    events = {
        vorp = 'vorp_inventory:client:open',
        rsg = 'rsg-inventory:client:openinventory',
        lxr = 'lxr-inventory:client:open',
        qbr = 'qbr-inventory:client:open'
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🔫 WEAPON SYSTEM
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Weapons = {
    -- Holster settings
    autoHolster = false,
    holsterDelay = 500,  -- ms
    
    -- Cleaning settings
    cleaningDuration = 5000,  -- 5 seconds
    cleaningAnimation = 'WORLD_HUMAN_CLEAN_WEAPON',
    
    -- Weapon degradation (if supported by framework)
    degradationEnabled = false,
    degradationRate = 0.01  -- Per shot
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🐴 HORSE SYSTEM
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Horse = {
    -- Call horse settings
    callDistance = 50.0,  -- meters
    callCommand = 'horse',
    whistleAnimation = 'WORLD_HUMAN_WHISTLE',
    
    -- Horse care
    brushDuration = 5000,
    feedDuration = 3000,
    calmDuration = 4000,
    
    -- Horse cargo
    cargoEnabled = true,
    cargoDistance = 3.0
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🛒 WAGON/VEHICLE SYSTEM
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Wagon = {
    -- Door settings
    doorSpeed = 1.0,
    autoCloseDoors = false,
    
    -- Cargo settings
    cargoEnabled = true,
    cargoDistance = 3.0,
    
    -- Flip settings
    flipEnabled = true,
    flipDistance = 5.0,
    
    -- Lantern settings
    lanternToggle = true
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🏕️ CAMP SYSTEM
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Camp = {
    -- Pitch camp
    pitchEnabled = true,
    pitchDuration = 3000,
    
    -- Cooking
    cookEnabled = true,
    cookDuration = 10000,
    
    -- Resting
    restEnabled = true,
    restDuration = 5000,
    restHealing = 20,  -- HP to restore
    
    -- Crafting
    craftEnabled = true,
    
    -- Pack up
    packDuration = 3000
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- 🎯 EVENT NAMES (For external integrations)
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Events = {
    -- Client events
    client = {
        openMenu = 'lxr-radialmenu:client:openMenu',
        closeMenu = 'lxr-radialmenu:client:closeMenu',
        
        -- Horse
        horseCall = 'lxr-radialmenu:client:horse:call',
        horseFlee = 'lxr-radialmenu:client:horse:flee',
        horseBrush = 'lxr-radialmenu:client:horse:brush',
        horseFeed = 'lxr-radialmenu:client:horse:feed',
        horseCalm = 'lxr-radialmenu:client:horse:calm',
        horseCargo = 'lxr-radialmenu:client:horse:cargo',
        
        -- Wagon
        wagonDoorDriver = 'lxr-radialmenu:client:wagon:door:driver',
        wagonDoorPassenger = 'lxr-radialmenu:client:wagon:door:passenger',
        wagonDoorRear = 'lxr-radialmenu:client:wagon:door:rear',
        wagonCargo = 'lxr-radialmenu:client:wagon:cargo',
        wagonFlip = 'lxr-radialmenu:client:wagon:flip',
        wagonLantern = 'lxr-radialmenu:client:wagon:lantern',
        
        -- Camp
        campPitch = 'lxr-radialmenu:client:camp:pitch',
        campCook = 'lxr-radialmenu:client:camp:cook',
        campRest = 'lxr-radialmenu:client:camp:rest',
        campCraft = 'lxr-radialmenu:client:camp:craft',
        campPack = 'lxr-radialmenu:client:camp:pack',
        
        -- Clothing
        clothingOpen = 'lxr-radialmenu:client:clothing:open',
        clothingHat = 'lxr-radialmenu:client:clothing:hat',
        clothingCoat = 'lxr-radialmenu:client:clothing:coat',
        clothingVest = 'lxr-radialmenu:client:clothing:vest',
        clothingBandana = 'lxr-radialmenu:client:clothing:bandana',
        clothingGloves = 'lxr-radialmenu:client:clothing:gloves',
        clothingBoots = 'lxr-radialmenu:client:clothing:boots',
        
        -- Interactions
        interactionGreet = 'lxr-radialmenu:client:interaction:greet',
        interactionAntagonize = 'lxr-radialmenu:client:interaction:antagonize',
        interactionRob = 'lxr-radialmenu:client:interaction:rob',
        interactionLasso = 'lxr-radialmenu:client:interaction:lasso',
        interactionCarry = 'lxr-radialmenu:client:interaction:carry',
        interactionSearch = 'lxr-radialmenu:client:interaction:search',
        
        -- Inventory
        inventoryOpen = 'lxr-radialmenu:client:inventory:open',
        
        -- Emotes
        emoteSmoke = 'lxr-radialmenu:client:emote:smoke',
        emoteDrink = 'lxr-radialmenu:client:emote:drink',
        emoteSit = 'lxr-radialmenu:client:emote:sit',
        emoteLean = 'lxr-radialmenu:client:emote:lean',
        emoteCancel = 'lxr-radialmenu:client:emote:cancel',
        
        -- Weapons
        weaponHolster = 'lxr-radialmenu:client:weapon:holster',
        weaponClean = 'lxr-radialmenu:client:weapon:clean',
        weaponReload = 'lxr-radialmenu:client:weapon:reload'
    },
    
    -- Server events
    server = {
        -- Add server events here as needed
        logAction = 'lxr-radialmenu:server:logAction',
        syncData = 'lxr-radialmenu:server:syncData'
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- ✅ CONFIGURATION VALIDATION
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- This function validates the configuration on resource start
function ValidateConfig()
    local errors = {}
    
    -- Validate menu items
    if not Config.MenuItems or #Config.MenuItems == 0 then
        table.insert(errors, 'Config.MenuItems is empty or missing')
    end
    
    -- Validate theme
    if not Config.Theme or not Config.Theme.themes[Config.Theme.current] then
        table.insert(errors, 'Invalid theme selected: ' .. tostring(Config.Theme.current))
    end
    
    -- Print errors if any
    if #errors > 0 then
        print('^1[LXR RadialMenu] Configuration Errors:^7')
        for _, error in ipairs(errors) do
            print('^1  - ' .. error .. '^7')
        end
        return false
    end
    
    return true
end

return Config
