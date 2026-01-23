fx_version 'cerulean'
games { 'rdr3' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'iBoss'
description 'The Land of Wolves - Advanced Radial Menu System for RedM'
version '1.0.0'

-- Client Scripts
client_scripts {
    'config.lua',
    'client/client.lua'
}

-- Server Scripts
server_scripts {
    'config.lua',
    'server/server.lua'
}

-- UI Files
ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/settings.html',
    'html/settings-style.css',
    'html/settings-script.js'
}
