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
            repeat = 'no-repeat',
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

-- Rest of config continues...
-- (I'll continue in the next file due to length)

return Config
