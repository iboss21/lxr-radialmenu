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
    print('^6    🐺 The Land of Wolves - Advanced Radial Menu System^7')
    print('^6    Version: ^31.0.0^6 | Author: ^3iBoss^6 | Website: ^3www.wolves.land^7')
    print('^6    Framework: ^3RedM Standalone with Auto-Detection^7')
    print('^3════════════════════════════════════════════════════════════════════════════════════════════════════════^7')
end)

-- Server event handlers for menu actions
RegisterNetEvent('lxr-radialmenu:server:vehicle:toggleEngine', function()
    local src = source
    if Config.Debug then
        print('^2[LXR RadialMenu Server]^7 Player ' .. src .. ' toggled engine')
    end
    -- Add server-side logic if needed
end)

RegisterNetEvent('lxr-radialmenu:server:vehicle:toggleDoors', function()
    local src = source
    if Config.Debug then
        print('^2[LXR RadialMenu Server]^7 Player ' .. src .. ' toggled doors')
    end
    -- Add server-side logic if needed
end)

RegisterNetEvent('lxr-radialmenu:server:vehicle:toggleHood', function()
    local src = source
    if Config.Debug then
        print('^2[LXR RadialMenu Server]^7 Player ' .. src .. ' toggled hood')
    end
    -- Add server-side logic if needed
end)

RegisterNetEvent('lxr-radialmenu:server:vehicle:toggleTrunk', function()
    local src = source
    if Config.Debug then
        print('^2[LXR RadialMenu Server]^7 Player ' .. src .. ' toggled trunk')
    end
    -- Add server-side logic if needed
end)

RegisterNetEvent('lxr-radialmenu:server:inventory:open', function()
    local src = source
    if Config.Debug then
        print('^2[LXR RadialMenu Server]^7 Player ' .. src .. ' opened inventory')
    end
    -- Add server-side logic if needed
end)

RegisterNetEvent('lxr-radialmenu:server:phone:open', function()
    local src = source
    if Config.Debug then
        print('^2[LXR RadialMenu Server]^7 Player ' .. src .. ' opened phone')
    end
    -- Add server-side logic if needed
end)

-- RedM-specific server handlers
if not Config.UseFiveM then
    RegisterNetEvent('lxr-radialmenu:server:horse:call', function()
        local src = source
        if Config.Debug then
            print('^2[LXR RadialMenu Server]^7 Player ' .. src .. ' called horse')
        end
        -- Add server-side logic for RedM horse
    end)
    
    RegisterNetEvent('lxr-radialmenu:server:horse:flee', function()
        local src = source
        if Config.Debug then
            print('^2[LXR RadialMenu Server]^7 Player ' .. src .. ' made horse flee')
        end
        -- Add server-side logic for RedM horse
    end)
    
    RegisterNetEvent('lxr-radialmenu:server:horse:brush', function()
        local src = source
        if Config.Debug then
            print('^2[LXR RadialMenu Server]^7 Player ' .. src .. ' brushed horse')
        end
        -- Add server-side logic for RedM horse
    end)
    
    RegisterNetEvent('lxr-radialmenu:server:camp:pitch', function()
        local src = source
        if Config.Debug then
            print('^2[LXR RadialMenu Server]^7 Player ' .. src .. ' pitched camp')
        end
        -- Add server-side logic for RedM camp
    end)
    
    RegisterNetEvent('lxr-radialmenu:server:camp:cook', function()
        local src = source
        if Config.Debug then
            print('^2[LXR RadialMenu Server]^7 Player ' .. src .. ' started cooking')
        end
        -- Add server-side logic for RedM camp cooking
    end)
    
    RegisterNetEvent('lxr-radialmenu:server:camp:rest', function()
        local src = source
        if Config.Debug then
            print('^2[LXR RadialMenu Server]^7 Player ' .. src .. ' is resting at camp')
        end
        -- Add server-side logic for RedM camp rest
    end)
end

-- Server command to check framework
RegisterCommand('radialmenu:info', function(source, args, rawCommand)
    local src = source
    print('^2[LXR RadialMenu]^7 Framework: ^3' .. currentFramework .. '^7')
    print('^2[LXR RadialMenu]^7 Game: ^3' .. Config.Game .. '^7')
    print('^2[LXR RadialMenu]^7 UseFiveM: ^3' .. tostring(Config.UseFiveM) .. '^7')
    
    if src > 0 then
        TriggerClientEvent('chat:addMessage', src, {
            color = {0, 255, 0},
            multiline = true,
            args = {'LXR RadialMenu', 'Framework: ' .. currentFramework .. ' | Game: ' .. Config.Game}
        })
    end
end, true)
