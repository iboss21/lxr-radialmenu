fx_version 'cerulean'
games { 'rdr3' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'iBoss'
description 'LXR Radial Menu v2.0 - Modern radial menu system for RedM'
version '2.0.0'
url 'https://wolves.land'

-- ═══════════════════════════════════════════════════════════════
-- SHARED SCRIPTS
-- ═══════════════════════════════════════════════════════════════

shared_scripts {
    'shared/constants.lua',
    'shared/utils.lua',
    'config-new.lua'
}

-- ═══════════════════════════════════════════════════════════════
-- CLIENT SCRIPTS
-- ═══════════════════════════════════════════════════════════════

client_scripts {
    'client/modules/framework.lua',
    'client/client-new.lua'
}

-- ═══════════════════════════════════════════════════════════════
-- SERVER SCRIPTS
-- ═══════════════════════════════════════════════════════════════

server_scripts {
    'server/server-new.lua'
}

-- ═══════════════════════════════════════════════════════════════
-- UI FILES
-- ═══════════════════════════════════════════════════════════════

ui_page 'html/index-new.html'

files {
    'html/index-new.html',
    'html/style-new.css',
    'html/script-new.js',
    
    -- Keep old files for reference (can be removed later)
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/settings.html',
    'html/settings-style.css',
    'html/settings-script.js',
    'html/demo.html'
}

-- ═══════════════════════════════════════════════════════════════
-- DEPENDENCIES (Optional)
-- ═══════════════════════════════════════════════════════════════

-- Framework dependencies (auto-detected, all optional)
-- dependencies {
--     'lxr-core',      -- LXRCore
--     'vorp_core',     -- VORP
--     'rsg-core',      -- RSG
--     'redem_roleplay' -- RedEM:RP
-- }

-- ═══════════════════════════════════════════════════════════════
-- METADATA
-- ═══════════════════════════════════════════════════════════════

lua54 'yes'

-- Resource Information
provide 'radialmenu'

-- This resource provides radial menu functionality
-- Other resources can detect and integrate with it
