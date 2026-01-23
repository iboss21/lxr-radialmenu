--[[
    ████████╗██╗     ██╗    ██╗     █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
    ╚══██╔══╝██║     ██║    ██║    ██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
       ██║   ██║     ██║ █╗ ██║    ███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
       ██║   ██║     ██║███╗██║    ██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
       ██║   ███████╗╚███╔███╔╝    ██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
       ╚═╝   ╚══════╝ ╚══╝╚══╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
                                                                                                                     
    🐺 The Land of Wolves - Advanced Radial Menu System (Server)
    "1899 Western Era" - Premium Radial Menu Interface for RedM
    
    Version: 1.0.0
    Author: iBoss
    Website: www.wolves.land
    Server: The Land of Wolves
    
    © 2026 iBoss | The Land of Wolves | www.wolves.land
    License: All Rights Reserved
]]

local currentFramework = 'RedM'

-- Print server info on resource start
CreateThread(function()
    Wait(1000)
    print('^3════════════════════════════════════════════════════════════════════════════════════════════════════════^7')
    print('^2    ████████╗██╗     ██╗    ██╗     █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗^7')
    print('^2    ╚══██╔══╝██║     ██║    ██║    ██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝^7')
    print('^2       ██║   ██║     ██║ █╗ ██║    ███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗^7')
    print('^2       ██║   ██║     ██║███╗██║    ██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║^7')
    print('^2       ██║   ███████╗╚███╔███╔╝    ██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║^7')
    print('^2       ╚═╝   ╚══════╝ ╚══╝╚══╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝^7')
    print('^3════════════════════════════════════════════════════════════════════════════════════════════════════════^7')
    print('^6    🐺 ' .. Config.Product.name .. '^7')
    print('^6    Version: ^3' .. Config.Product.version .. '^6 | Author: ^3' .. Config.Product.author .. '^6 | Website: ^3' .. Config.Product.website .. '^7')
    print('^6    Framework: ^3' .. Config.Framework.type .. ' with Auto-Detection^7')
    print('^3════════════════════════════════════════════════════════════════════════════════════════════════════════^7')
end)

-- Server event handlers for menu actions
RegisterNetEvent('lxr-radialmenu:server:vehicle:toggleEngine', function()
    local src = source
    if Config.Debug.enabled and Config.Debug.printEvents then
        print('^2[' .. Config.Product.shortName .. ' Server]^7 Player ' .. src .. ' toggled engine')
    end
    -- Add server-side logic if needed
end)

RegisterNetEvent('lxr-radialmenu:server:vehicle:toggleDoors', function()
    local src = source
    if Config.Debug.enabled and Config.Debug.printEvents then
        print('^2[' .. Config.Product.shortName .. ' Server]^7 Player ' .. src .. ' toggled doors')
    end
    -- Add server-side logic if needed
end)

RegisterNetEvent('lxr-radialmenu:server:vehicle:toggleHood', function()
    local src = source
    if Config.Debug.enabled and Config.Debug.printEvents then
        print('^2[' .. Config.Product.shortName .. ' Server]^7 Player ' .. src .. ' toggled hood')
    end
    -- Add server-side logic if needed
end)

RegisterNetEvent('lxr-radialmenu:server:vehicle:toggleTrunk', function()
    local src = source
    if Config.Debug.enabled and Config.Debug.printEvents then
        print('^2[' .. Config.Product.shortName .. ' Server]^7 Player ' .. src .. ' toggled trunk')
    end
    -- Add server-side logic if needed
end)

RegisterNetEvent('lxr-radialmenu:server:inventory:open', function()
    local src = source
    if Config.Debug.enabled and Config.Debug.printEvents then
        print('^2[' .. Config.Product.shortName .. ' Server]^7 Player ' .. src .. ' opened inventory')
    end
    -- Add server-side logic if needed
end)

RegisterNetEvent('lxr-radialmenu:server:phone:open', function()
    local src = source
    if Config.Debug.enabled and Config.Debug.printEvents then
        print('^2[' .. Config.Product.shortName .. ' Server]^7 Player ' .. src .. ' opened phone')
    end
    -- Add server-side logic if needed
end)

-- RedM-specific server handlers
RegisterNetEvent('lxr-radialmenu:server:horse:call', function()
    local src = source
    if Config.Debug.enabled and Config.Debug.printEvents then
        print('^2[' .. Config.Product.shortName .. ' Server]^7 Player ' .. src .. ' called horse')
    end
    -- Add server-side logic for RedM horse
end)

RegisterNetEvent('lxr-radialmenu:server:horse:flee', function()
    local src = source
    if Config.Debug.enabled and Config.Debug.printEvents then
        print('^2[' .. Config.Product.shortName .. ' Server]^7 Player ' .. src .. ' made horse flee')
    end
    -- Add server-side logic for RedM horse
end)

RegisterNetEvent('lxr-radialmenu:server:horse:brush', function()
    local src = source
    if Config.Debug.enabled and Config.Debug.printEvents then
        print('^2[' .. Config.Product.shortName .. ' Server]^7 Player ' .. src .. ' brushed horse')
    end
    -- Add server-side logic for RedM horse
end)

RegisterNetEvent('lxr-radialmenu:server:camp:pitch', function()
    local src = source
    if Config.Debug.enabled and Config.Debug.printEvents then
        print('^2[' .. Config.Product.shortName .. ' Server]^7 Player ' .. src .. ' pitched camp')
    end
    -- Add server-side logic for RedM camp
end)

RegisterNetEvent('lxr-radialmenu:server:camp:cook', function()
    local src = source
    if Config.Debug.enabled and Config.Debug.printEvents then
        print('^2[' .. Config.Product.shortName .. ' Server]^7 Player ' .. src .. ' started cooking')
    end
    -- Add server-side logic for RedM camp cooking
end)

RegisterNetEvent('lxr-radialmenu:server:camp:rest', function()
    local src = source
    if Config.Debug.enabled and Config.Debug.printEvents then
        print('^2[' .. Config.Product.shortName .. ' Server]^7 Player ' .. src .. ' is resting at camp')
    end
    -- Add server-side logic for RedM camp rest
end)

-- Server command to check framework
RegisterCommand(Config.Commands.menuInfo, function(source, args, rawCommand)
    local src = source
    print('^2[' .. Config.Product.shortName .. ']^7 Framework: ^3' .. Config.Framework.type .. '^7')
    print('^2[' .. Config.Product.shortName .. ']^7 Version: ^3' .. Config.Product.version .. '^7')
    print('^2[' .. Config.Product.shortName .. ']^7 Auto-Detect: ^3' .. tostring(Config.Framework.autoDetect) .. '^7')
    
    if src > 0 then
        TriggerClientEvent('chat:addMessage', src, {
            color = {0, 255, 0},
            multiline = true,
            args = {Config.Product.shortName, 'Framework: ' .. Config.Framework.type .. ' | Version: ' .. Config.Product.version}
        })
    end
end, true)
