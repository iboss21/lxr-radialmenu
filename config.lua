--[[
    ████████╗██╗     ██╗    ██╗     █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
    ╚══██╔══╝██║     ██║    ██║    ██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
       ██║   ██║     ██║ █╗ ██║    ███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
       ██║   ██║     ██║███╗██║    ██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
       ██║   ███████╗╚███╔███╔╝    ██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
       ╚═╝   ╚══════╝ ╚══╝╚══╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
                                                                                                                     
    🐺 The Land of Wolves - Advanced Radial Menu System
    "1899 Western Era" - Premium Radial Menu Interface for RedM
    
    Version: 1.0.0
    Author: iBoss
    Website: www.wolves.land
    Server: The Land of Wolves
    
    © 2026 iBoss | The Land of Wolves | www.wolves.land
    License: All Rights Reserved
]]

Config = {}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- BRANDING
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Branding = {
    name = 'The Land of Wolves',
    website = 'www.wolves.land',
    author = 'iBoss',
    version = '1.0.0'
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- FRAMEWORK SETTINGS - Standalone with Auto-Detection
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Framework = 'standalone'  -- Standalone - auto-detects RedM frameworks
Config.AutoDetectFramework = true  -- Auto-detect LXRCore, QBCore, RSG, RedEM:RP, VORP, etc.

-- Supported Frameworks:
-- ✅ LXRCore (github.com/lxrcore) - Priority detection
-- ✅ VORP Core
-- ✅ RSG Core
-- ✅ RedEM:RP / REDEMRP2k23
-- ✅ QBR (QBCore for RedM)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- GENERAL SETTINGS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.OpenKey = 'F1'  -- Key to open the radial menu
Config.UseKeyMapping = true  -- Use RedM key mapping system
Config.HoldMode = false  -- true = hold to activate, false = click to activate
Config.HoldTime = 500  -- Time in ms to hold before activation (if HoldMode enabled)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- MENU CONFIGURATION
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.MenuRadius = 150  -- Radius of the radial menu in pixels
Config.IconSize = 50  -- Size of menu icons
Config.AnimationSpeed = 0.3  -- Animation speed in seconds
Config.BackgroundBlur = true  -- Enable background blur effect
Config.SoundEffects = true  -- Enable sound effects

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- THEME SETTINGS - 3 Western Themes (1899 Era)
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.CurrentTheme = 'wolves'  -- 'wolves', 'saloon', or 'frontier'

Config.Themes = {
    wolves = {
        backgroundColor = 'rgba(15, 15, 20, 0.95)',
        primaryColor = '#8B4513',  -- Saddle Brown (Wolf Pack)
        hoverColor = '#CD853F',  -- Peru (Golden Hour)
        textColor = '#F5DEB3',  -- Wheat
        iconColor = '#DEB887'   -- Burlywood
    },
    saloon = {
        backgroundColor = 'rgba(40, 20, 10, 0.95)',
        primaryColor = '#A0522D',  -- Sienna (Saloon Wood)
        hoverColor = '#DAA520',  -- Goldenrod (Whiskey)
        textColor = '#FAEBD7',  -- Antique White
        iconColor = '#D2691E'   -- Chocolate
    },
    frontier = {
        backgroundColor = 'rgba(25, 25, 30, 0.90)',
        primaryColor = '#556B2F',  -- Dark Olive Green (Frontier)
        hoverColor = '#6B8E23',  -- Olive Drab
        textColor = '#F0E68C',  -- Khaki
        iconColor = '#BDB76B'   -- Dark Khaki
    }
}

-- Get active theme
Config.Theme = Config.Themes[Config.CurrentTheme]

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- MURPHY'S CLOTHING INTEGRATION
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Clothing = {
    Enabled = true,                  -- Enable Murphy's Clothing integration
    ResourceName = 'murphy_clothing', -- Murphy's Clothing resource name
    UseCommand = true,               -- Use command to open clothing (if false, uses event)
    Command = 'ClothesManagement',   -- Command from Murphy's config (Config.ClothesManagement.Command)
    
    -- Alternative: Use native event trigger if command doesn't work
    -- Set UseCommand to false and configure the event below
    EventName = 'murphy_clothing:client:openMenu',  -- Custom event if needed
    
    -- Quick clothing categories accessible from radial submenu
    QuickAccess = {
        enabled = true,
        categories = {
            { id = 'hat', label = 'Hat', category = 'hats' },
            { id = 'coat', label = 'Coat', category = 'coats' },
            { id = 'vest', label = 'Vest', category = 'vests' },
            { id = 'bandana', label = 'Bandana', category = 'masks' },
            { id = 'gloves', label = 'Gloves', category = 'gloves' },
            { id = 'boots', label = 'Boots', category = 'boots' }
        }
    }
}
Config.Language = 'en'  -- 'en', 'es', 'fr', 'de', 'pt'

Config.Locales = {
    en = {
        menu_title = 'The Land of Wolves',
        horse = 'Horse',
        wagon = 'Wagon',
        camp = 'Camp',
        clothing = 'Wardrobe',
        interactions = 'Interactions',
        job = 'Job Actions',
        inventory = 'Satchel',
        weapons = 'Weapons'
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- RSG ANIMATIONS INTEGRATION
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Animations = {
    Enabled = true,                      -- Enable RSG Animations integration
    ResourceName = 'rsg-animations',     -- RSG Animations resource name
    UseCommand = true,                   -- Use command to open animations menu
    Command = 'anim',                    -- Command from RSG config
    
    -- Quick access categories in radial menu
    QuickCategories = {
        gestures = { label = 'Gestures', icon = '👋' },
        emotes = { label = 'Emotes', icon = '🎭' },
        dances = { label = 'Dances', icon = '💃' }
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- WALKING STYLES SYSTEM (The Land of Wolves)
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.WalkingStyles = {
    Enabled = true,
    Command = 'walkstyle',  -- Command to open walking styles menu
    ResetCommand = 'resetwalk',  -- Command to reset to normal walk
    
    -- Available walking styles for The Land of Wolves
    Styles = {
        -- Normal/Healthy Walks
        { id = 'normal', label = 'Normal Walk', clipset = 'NONE' },
        { id = 'confident', label = 'Confident Stride', clipset = 'clipset@move_m@core@1h' },
        { id = 'tough', label = 'Tough Guy', clipset = 'move_m@tough_guy' },
        { id = 'swagger', label = 'Swagger', clipset = 'move_m@swagger' },
        { id = 'feminine', label = 'Feminine', clipset = 'move_f@femme' },
        { id = 'elegant', label = 'Elegant Lady', clipset = 'move_f@elegant' },
        
        -- Injured/Drunk Walks
        { id = 'drunk', label = 'Drunk', clipset = 'move_m@drunk@moderatedrunk' },
        { id = 'verydrun', label = 'Very Drunk', clipset = 'move_m@drunk@verydrunk' },
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
Config.Clothing = {
    Enabled = true,                  -- Enable Murphy's Clothing integration
    ResourceName = 'murphy_clothing', -- Murphy's Clothing resource name
    UseCommand = true,               -- Use command to open clothing (if false, uses event)
    Command = 'ClothesManagement',   -- Command from Murphy's config (Config.ClothesManagement.Command)
    
    -- Alternative: Use native event trigger if command doesn't work
    -- Set UseCommand to false and configure the event below
    EventName = 'murphy_clothing:client:openMenu',  -- Custom event if needed
    
    -- Quick clothing categories accessible from radial submenu
    QuickAccess = {
        enabled = true,
        categories = {
            { id = 'hat', label = 'Hat', category = 'hats' },
            { id = 'coat', label = 'Coat', category = 'coats' },
            { id = 'vest', label = 'Vest', category = 'vests' },
            { id = 'bandana', label = 'Bandana', category = 'masks' },
            { id = 'gloves', label = 'Gloves', category = 'gloves' },
            { id = 'boots', label = 'Boots', category = 'boots' }
        }
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- WESTERN ERA MENU ITEMS (1899)
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.MenuItems = {
    {
        id = 'horse',
        label = 'Horse',
        icon = '🐴',
        items = {
            { id = 'call_horse', label = 'Whistle for Horse', action = 'horse:call' },
            { id = 'flee_horse', label = 'Send Horse Away', action = 'horse:flee' },
            { id = 'brush_horse', label = 'Brush Horse', action = 'horse:brush' },
            { id = 'feed_horse', label = 'Feed Horse', action = 'horse:feed' },
            { id = 'calm_horse', label = 'Calm Horse', action = 'horse:calm' },
            { id = 'horse_cargo', label = 'Horse Cargo', action = 'horse:cargo' }
        }
    },
    {
        id = 'wagon',
        label = 'Wagon',
        icon = '🛒',
        items = {
            { id = 'wagon_door_driver', label = 'Driver Door', action = 'wagon:door:driver' },
            { id = 'wagon_door_passenger', label = 'Passenger Door', action = 'wagon:door:passenger' },
            { id = 'wagon_door_rear', label = 'Rear Door', action = 'wagon:door:rear' },
            { id = 'wagon_cargo', label = 'Wagon Cargo', action = 'wagon:cargo' },
            { id = 'wagon_flip', label = 'Flip Wagon', action = 'wagon:flip' },
            { id = 'wagon_lantern', label = 'Toggle Lantern', action = 'wagon:lantern' }
        }
    },
    {
        id = 'camp',
        label = 'Camp',
        icon = '🏕️',
        items = {
            { id = 'pitch_camp', label = 'Pitch Camp', action = 'camp:pitch' },
            { id = 'cook', label = 'Cook', action = 'camp:cook' },
            { id = 'rest', label = 'Rest', action = 'camp:rest' },
            { id = 'craft', label = 'Craft', action = 'camp:craft' },
            { id = 'pack_camp', label = 'Pack Up Camp', action = 'camp:pack' }
        }
    },
    {
        id = 'clothing',
        label = 'Wardrobe',
        icon = '🤠',
        items = {
            { id = 'full_wardrobe', label = 'Open Wardrobe', action = 'clothing:open' },
            { id = 'hat', label = 'Hat', action = 'clothing:hat' },
            { id = 'coat', label = 'Coat', action = 'clothing:coat' },
            { id = 'vest', label = 'Vest', action = 'clothing:vest' },
            { id = 'bandana', label = 'Bandana', action = 'clothing:bandana' },
            { id = 'gloves', label = 'Gloves', action = 'clothing:gloves' },
            { id = 'boots', label = 'Boots', action = 'clothing:boots' }
        }
    },
    {
        id = 'satchel',
        label = 'Satchel',
        icon = '🎒',
        action = 'inventory:open'
    },
    {
        id = 'interactions',
        label = 'Interactions',
        icon = '👥',
        items = {
            { id = 'greet', label = 'Greet', action = 'interaction:greet' },
            { id = 'antagonize', label = 'Antagonize', action = 'interaction:antagonize' },
            { id = 'rob', label = 'Rob', action = 'interaction:rob' },
            { id = 'lasso', label = 'Lasso', action = 'interaction:lasso' },
            { id = 'carry', label = 'Carry Person', action = 'interaction:carry' },
            { id = 'search', label = 'Search Person', action = 'interaction:search' }
        }
    },
    {
        id = 'emotes',
        label = 'Gestures',
        icon = '🎭',
        items = {
            { id = 'anim_menu', label = 'Open Animations', action = 'emote:menu' },
            { id = 'walkstyle_menu', label = 'Walking Style', action = 'emote:walkstyle' },
            { id = 'smoke', label = 'Smoke Cigarette', action = 'emote:smoke' },
            { id = 'drink', label = 'Drink Whiskey', action = 'emote:drink' },
            { id = 'sit', label = 'Sit Down', action = 'emote:sit' },
            { id = 'lean', label = 'Lean', action = 'emote:lean' },
            { id = 'cancel', label = 'Cancel Animation', action = 'emote:cancel' }
        }
    },
    {
        id = 'weapons',
        label = 'Weapons',
        icon = '🔫',
        items = {
            { id = 'holster', label = 'Holster Weapon', action = 'weapon:holster' },
            { id = 'clean', label = 'Clean Weapon', action = 'weapon:clean' },
            { id = 'reload', label = 'Reload All', action = 'weapon:reload' }
        }
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- JOB-SPECIFIC MENUS (Western Era)
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
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
    
    -- Undertaker (Additional Western job)
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
    }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- BLIP SYSTEM
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.UseBlips = true  -- Enable smart blip system
Config.BlipRefreshRate = 5000  -- Refresh blips every 5 seconds

Config.Blips = {
    camp = { sprite = 'blip_camp', color = 'yellow' },
    horse = { sprite = 'blip_horse', color = 'white' },
    wagon = { sprite = 'blip_wagon', color = 'white' },
    saloon = { sprite = 'blip_saloon', color = 'red' },
    shop = { sprite = 'blip_shop', color = 'white' }
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- INTERACTION SETTINGS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.InteractionDistance = 2.0  -- Distance to interact with players/objects
Config.EnableTrunkSystem = true  -- Enable wagon trunk system
Config.EnableCarrySystem = true  -- Enable carry/kidnapping system
Config.EnableStretcherSystem = true  -- Enable stretcher system (for doctors)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- PERMISSION SETTINGS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.RequirePermission = false  -- Require permission to use menu
Config.AllowedJobs = {}  -- Empty = all jobs allowed

-- Job permissions for job-specific menus
Config.JobPermissions = {
    sheriff = true,
    doctor = true,
    blacksmith = true,
    stagecoach = true,
    undertaker = true,
    bountyhunter = true
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- DEBUG SETTINGS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Config.Debug = false

return Config
