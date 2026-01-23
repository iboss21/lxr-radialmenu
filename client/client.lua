--[[
    ████████╗██╗     ██╗    ██╗     █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
    ╚══██╔══╝██║     ██║    ██║    ██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
       ██║   ██║     ██║ █╗ ██║    ███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
       ██║   ██║     ██║███╗██║    ██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
       ██║   ███████╗╚███╔███╔╝    ██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
       ╚═╝   ╚══════╝ ╚══╝╚══╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
                                                                                                                     
    🐺 The Land of Wolves - Advanced Radial Menu System (Client)
    "1899 Western Era" - Premium Radial Menu Interface for RedM
    
    Version: 1.0.0
    Author: iBoss
    Website: www.wolves.land
    Server: The Land of Wolves
    
    © 2026 iBoss | The Land of Wolves | www.wolves.land
    License: All Rights Reserved
]]

local isMenuOpen = false
local currentFramework = nil
local PlayerData = {}
local LXRCore = nil  -- LXRCore framework object

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- FRAMEWORK AUTO-DETECTION
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
local function DetectFramework()
    if Config.Framework.autoDetect then
        -- Iterate through detection order from config
        for _, frameworkName in ipairs(Config.Framework.detectionOrder) do
            local framework = Config.Framework[frameworkName:lower()]
            if framework and framework.resourceName then
                local resourceState = GetResourceState(framework.resourceName)
                if resourceState == 'started' then
                    currentFramework = frameworkName
                    
                    -- Framework-specific initialization
                    if frameworkName == 'lxrcore' then
                        exports[framework.resourceName]:GetCoreObject(function(core)
                            LXRCore = core
                            if framework.cachePlayerData then
                                PlayerData = LXRCore.Functions.GetPlayerData()
                            end
                        end)
                    elseif frameworkName == 'vorp' then
                        TriggerEvent('vorp:getCharacter', function(user)
                            PlayerData = user
                        end)
                    end
                    
                    return frameworkName
                end
            end
        end
    end
    
    -- Default to standalone
    currentFramework = 'Standalone'
    return 'Standalone'
end

-- Initialize on resource start
CreateThread(function()
    Wait(1000)
    local detected = DetectFramework()
    
    if Config.Debug.enabled then
        print('^2[' .. Config.Product.shortName .. ']^7 Started successfully')
        print('^2[' .. Config.Product.shortName .. ']^7 Framework: ^3' .. detected .. '^7')
        print('^2[' .. Config.Product.shortName .. ']^7 Version: ^3' .. Config.Product.version .. '^7')
        print('^2[' .. Config.Product.shortName .. ']^7 Author: ^3' .. Config.Product.author .. '^7')
        print('^2[' .. Config.Product.shortName .. ']^7 Website: ^3' .. Config.Product.website .. '^7')
    end
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- MENU FUNCTIONS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
local function GetPlayerJob()
    -- Get player job based on framework
    if currentFramework == 'LXRCore' and LXRCore then
        local playerJob = LXRCore.Functions.GetPlayerData().job
        return playerJob and playerJob.name or 'unemployed'
    elseif currentFramework == 'VORP' and PlayerData then
        return PlayerData.job or 'unemployed'
    elseif currentFramework == 'RSG' then
        -- RSG job detection
        return 'unemployed'  -- Implement RSG job detection
    elseif currentFramework == 'RedEM' then
        -- RedEM job detection
        return 'unemployed'  -- Implement RedEM job detection
    elseif currentFramework == 'QBR' then
        -- QBR job detection
        return 'unemployed'  -- Implement QBR job detection
    end
    
    return 'unemployed'
end

local function GetMenuItems()
    local menuItems = {}
    
    -- Add only enabled menu items from config
    for _, item in ipairs(Config.MenuItems) do
        if item.enabled ~= false then
            table.insert(menuItems, item)
        end
    end
    
    local playerJob = GetPlayerJob()
    
    -- Add job-specific menu if player has a job
    if Config.JobMenus[playerJob] and Config.JobPermissions[playerJob] then
        for _, jobMenu in ipairs(Config.JobMenus[playerJob]) do
            table.insert(menuItems, jobMenu)
        end
    end
    
    return menuItems
end

local function OpenRadialMenu()
    if isMenuOpen then return end
    
    isMenuOpen = true
    SetNuiFocus(true, true)
    
    -- Send menu data to UI
    SendNUIMessage({
        action = 'openMenu',
        menuItems = GetMenuItems(),
        config = {
            radius = Config.Menu.radius,
            iconSize = Config.Menu.iconSize,
            centerIconSize = Config.Menu.centerIconSize,
            spacing = Config.Menu.spacing,
            animationSpeed = Config.Menu.animationSpeed,
            animationStyle = Config.Menu.animationStyle,
            staggerAnimation = Config.Menu.staggerAnimation,
            staggerDelay = Config.Menu.staggerDelay,
            theme = Config.Theme.themes[Config.Theme.current],
            background = Config.Theme.background,
            framework = 'RedM',
            branding = Config.Product.shortName,
            holdMode = Config.Menu.holdMode,
            holdTime = Config.Menu.holdTime,
            backgroundBlur = Config.Menu.backgroundBlur,
            blurStrength = Config.Menu.blurStrength,
            soundEffects = Config.Sounds.enabled,
            enableParticles = Config.Menu.enableParticles,
            enableTooltips = Config.Menu.enableTooltips,
            tooltipDelay = Config.Menu.tooltipDelay
        }
    })
    
    if Config.Debug.enabled then
        print('^2[' .. Config.Product.shortName .. ']^7 Menu opened')
    end
end

local function CloseRadialMenu()
    if not isMenuOpen then return end
    
    isMenuOpen = false
    SetNuiFocus(false, false)
    
    SendNUIMessage({
        action = 'closeMenu'
    })
    
    if Config.Debug.enabled then
        print('^2[' .. Config.Product.shortName .. ']^7 Menu closed')
    end
end

local function ToggleRadialMenu()
    if isMenuOpen then
        CloseRadialMenu()
    else
        OpenRadialMenu()
    end
end

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- KEY BINDINGS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
if Config.Menu.useKeyMapping then
    RegisterKeyMapping(Config.Commands.openMenu, 'Open Radial Menu', 'keyboard', Config.Menu.openKey)
end

RegisterCommand(Config.Commands.openMenu, function()
    ToggleRadialMenu()
end, false)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- NUI CALLBACKS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RegisterNUICallback('closeMenu', function(data, cb)
    CloseRadialMenu()
    cb('ok')
end)

RegisterNUICallback('selectItem', function(data, cb)
    if Config.Debug.enabled and Config.Debug.printActions then
        print('^2[' .. Config.Product.shortName .. ']^7 Item selected: ^3' .. data.action .. '^7')
    end
    
    if Config.Menu.closeOnSelect then
        CloseRadialMenu()
    end
    
    -- Trigger the action
    TriggerEvent('lxr-radialmenu:client:' .. data.action)
    TriggerServerEvent('lxr-radialmenu:server:' .. data.action)
    
    cb('ok')
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- HORSE ACTIONS (Western Era)
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RegisterNetEvent('lxr-radialmenu:client:horse:call', function()
    local ped = PlayerPedId()
    -- Call player's horse using whistle
    ExecuteCommand(Config.Horse.callCommand) -- Most frameworks have a horse command
    if Config.Debug.enabled then
        print('^2[' .. Config.Product.shortName .. ']^7 Whistling for horse')
    end
end)

RegisterNetEvent('lxr-radialmenu:client:horse:flee', function()
    local ped = PlayerPedId()
    local horse = GetMount(ped)
    
    if horse and horse ~= 0 then
        SetPedFleeAttributes(horse, 0, 0)
        TaskAnimalFlee(horse, ped, -1)
        
        if Config.Debug.enabled then
            print('^2[' .. Config.Product.shortName .. ']^7 Horse sent away')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:horse:brush', function()
    local ped = PlayerPedId()
    local horse = GetMount(ped)
    
    if horse and horse ~= 0 then
        -- Play brushing animation using config
        local scenario = GetHashKey(Config.Animations.scenarios.horse_brush)
        TaskStartScenarioInPlace(ped, scenario, Config.Horse.brushDuration, true, false, false, false)
        
        Wait(Config.Horse.brushDuration)
        ClearPedTasks(ped)
        
        if Config.Debug.enabled then
            print('^2[' .. Config.Product.shortName .. ']^7 Brushing horse')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:horse:feed', function()
    local ped = PlayerPedId()
    local horse = GetMount(ped)
    
    if horse and horse ~= 0 then
        -- Feed horse logic with config duration
        Wait(Config.Horse.feedDuration)
        
        if Config.Debug.enabled then
            print('^2[' .. Config.Product.shortName .. ']^7 Feeding horse')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:horse:calm', function()
    local ped = PlayerPedId()
    local horse = GetMount(ped)
    
    if horse and horse ~= 0 then
        -- Calm horse with config duration
        TaskAnimalCalm(horse, Config.Horse.calmDuration)
        
        if Config.Debug.enabled then
            print('^2[' .. Config.Product.shortName .. ']^7 Calming horse')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:horse:cargo', function()
    -- Open horse cargo/saddlebags
    if Config.Horse.cargoEnabled then
        if Config.Debug.enabled then
            print('^2[' .. Config.Product.shortName .. ']^7 Opening horse cargo')
        end
        -- Trigger inventory system
    end
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- WAGON ACTIONS (Western Era Vehicle)
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RegisterNetEvent('lxr-radialmenu:client:wagon:door:driver', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle ~= 0 then
        -- Toggle driver door
        if GetVehicleDoorAngleRatio(vehicle, 0) > 0.0 then
            SetVehicleDoorShut(vehicle, 0, false)
        else
            SetVehicleDoorOpen(vehicle, 0, false, false)
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:wagon:door:passenger', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle ~= 0 then
        -- Toggle passenger door
        if GetVehicleDoorAngleRatio(vehicle, 1) > 0.0 then
            SetVehicleDoorShut(vehicle, 1, false)
        else
            SetVehicleDoorOpen(vehicle, 1, false, false)
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:wagon:door:rear', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle ~= 0 then
        -- Toggle rear door/cargo
        if GetVehicleDoorAngleRatio(vehicle, 5) > 0.0 then
            SetVehicleDoorShut(vehicle, 5, false)
        else
            SetVehicleDoorOpen(vehicle, 5, false, false)
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:wagon:cargo', function()
    -- Open wagon cargo/trunk
    if Config.Wagon.cargoEnabled then
        if Config.Debug.enabled then
            print('^2[' .. Config.Product.shortName .. ']^7 Opening wagon cargo')
        end
        -- Trigger inventory/trunk system
    end
end)

RegisterNetEvent('lxr-radialmenu:client:wagon:flip', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle == 0 then
        vehicle = GetClosestVehicle(GetEntityCoords(ped), Config.Wagon.flipDistance, 0, 70)
    end
    
    if vehicle ~= 0 and Config.Wagon.flipEnabled then
        SetVehicleOnGroundProperly(vehicle)
        if Config.Debug.enabled then
            print('^2[' .. Config.Product.shortName .. ']^7 Flipped wagon')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:wagon:lantern', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle ~= 0 and Config.Wagon.lanternToggle then
        -- Toggle wagon lanterns/lights
        local lightsOn = GetVehicleLightsState(vehicle)
        SetVehicleLights(vehicle, lightsOn == 1 and 0 or 1)
        
        if Config.Debug.enabled then
            print('^2[' .. Config.Product.shortName .. ']^7 Toggled wagon lantern')
        end
    end
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- CAMP ACTIONS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RegisterNetEvent('lxr-radialmenu:client:camp:pitch', function()
    if not Config.Camp.pitchEnabled then return end
    
    local ped = PlayerPedId()
    local scenario = GetHashKey(Config.Animations.scenarios.camp_pitch)
    TaskStartScenarioInPlace(ped, scenario, Config.Camp.pitchDuration, true, false, false, false)
    
    if Config.Debug.enabled then
        print('^2[' .. Config.Product.shortName .. ']^7 Pitching camp')
    end
    
    Wait(Config.Camp.pitchDuration)
    ClearPedTasks(ped)
end)

RegisterNetEvent('lxr-radialmenu:client:camp:cook', function()
    if not Config.Camp.cookEnabled then return end
    
    local ped = PlayerPedId()
    local scenario = GetHashKey(Config.Animations.scenarios.camp_cook)
    TaskStartScenarioInPlace(ped, scenario, -1, true, false, false, false)
    
    if Config.Debug.enabled then
        print('^2[' .. Config.Product.shortName .. ']^7 Cooking at camp')
    end
end)

RegisterNetEvent('lxr-radialmenu:client:camp:rest', function()
    if not Config.Camp.restEnabled then return end
    
    local ped = PlayerPedId()
    local scenario = GetHashKey(Config.Animations.scenarios.camp_rest)
    TaskStartScenarioInPlace(ped, scenario, -1, true, false, false, false)
    
    if Config.Debug.enabled then
        print('^2[' .. Config.Product.shortName .. ']^7 Resting at camp')
    end
end)

RegisterNetEvent('lxr-radialmenu:client:camp:craft', function()
    if not Config.Camp.craftEnabled then return end
    
    -- Open crafting menu
    if Config.Debug.enabled then
        print('^2[' .. Config.Product.shortName .. ']^7 Opening crafting')
    end
end)

RegisterNetEvent('lxr-radialmenu:client:camp:pack', function()
    local ped = PlayerPedId()
    local scenario = GetHashKey(Config.Animations.scenarios.camp_craft)
    TaskStartScenarioInPlace(ped, scenario, Config.Camp.packDuration, true, false, false, false)
    
    if Config.Debug.enabled then
        print('^2[' .. Config.Product.shortName .. ']^7 Packing up camp')
    end
    
    Wait(Config.Camp.packDuration)
    ClearPedTasks(ped)
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- MURPHY'S CLOTHING INTEGRATION (1899 Wardrobe System)
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

-- Check if Murphy's Clothing is available
local function IsMurphyClothingAvailable()
    if not Config.Clothing or not Config.Clothing.enabled then
        return false
    end
    
    local resourceState = GetResourceState(Config.Clothing.resourceName)
    return resourceState == 'started' or resourceState == 'starting'
end

-- Open full Murphy's Clothing menu
RegisterNetEvent('lxr-radialmenu:client:clothing:open', function()
    if not IsMurphyClothingAvailable() then
        if Config.Debug.enabled then
            print('^3[' .. Config.Product.shortName .. ']^7 Murphy\'s Clothing not available')
        end
        return
    end
    
    if Config.Clothing.useCommand then
        -- Use command to open (default method)
        ExecuteCommand(Config.Clothing.command)
    else
        -- Use event to open (alternative method)
        TriggerEvent(Config.Clothing.eventName)
    end
    
    if Config.Debug.enabled then
        print('^2[' .. Config.Product.shortName .. ']^7 Opening Murphy\'s Clothing wardrobe')
    end
end)

-- Quick access to specific clothing categories
RegisterNetEvent('lxr-radialmenu:client:clothing:hat', function()
    if IsMurphyClothingAvailable() then
        ExecuteCommand(Config.Clothing.command)
        if Config.Debug.enabled then
            print('^2[' .. Config.Product.shortName .. ']^7 Opening hat category')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:clothing:coat', function()
    if IsMurphyClothingAvailable() then
        ExecuteCommand(Config.Clothing.command)
        if Config.Debug.enabled then
            print('^2[' .. Config.Product.shortName .. ']^7 Opening coat category')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:clothing:vest', function()
    if IsMurphyClothingAvailable() then
        ExecuteCommand(Config.Clothing.command)
        if Config.Debug.enabled then
            print('^2[' .. Config.Product.shortName .. ']^7 Opening vest category')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:clothing:bandana', function()
    if IsMurphyClothingAvailable() then
        ExecuteCommand(Config.Clothing.command)
        if Config.Debug.enabled then
            print('^2[' .. Config.Product.shortName .. ']^7 Opening bandana/mask category')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:clothing:gloves', function()
    if IsMurphyClothingAvailable() then
        ExecuteCommand(Config.Clothing.command)
        if Config.Debug.enabled then
            print('^2[' .. Config.Product.shortName .. ']^7 Opening gloves category')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:clothing:boots', function()
    if IsMurphyClothingAvailable() then
        ExecuteCommand(Config.Clothing.command)
        if Config.Debug.enabled then
            print('^2[' .. Config.Product.shortName .. ']^7 Opening boots category')
        end
    end
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- LEGACY CLOTHING MANAGEMENT (Fallback if Murphy's not available)
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

-- Legacy clothing toggle functions (if Murphy's Clothing is not available)
local function ToggleClothingComponent(component)
    if IsMurphyClothingAvailable() then
        -- If Murphy's is available, open the full wardrobe instead
        ExecuteCommand(Config.Clothing.command)
        return
    end
    
    -- Legacy fallback code for basic clothing toggle
    local ped = PlayerPedId()
    if Config.Debug.enabled then
        print('^3[' .. Config.Product.shortName .. ']^7 Legacy clothing toggle: ' .. component)
    end
    -- Add basic clothing toggle logic here if needed
end

RegisterNetEvent('lxr-radialmenu:client:clothing:hat', function()
    ToggleClothingComponent('hat')
end)

RegisterNetEvent('lxr-radialmenu:client:clothing:coat', function()
    ToggleClothingComponent('coat')
end)

RegisterNetEvent('lxr-radialmenu:client:clothing:bandana', function()
    ToggleClothingComponent('bandana')
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- PLAYER INTERACTIONS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RegisterNetEvent('lxr-radialmenu:client:interaction:greet', function()
    local ped = PlayerPedId()
    local scenario = GetHashKey(Config.Animations.scenarios.greet)
    TaskStartScenarioInPlace(ped, scenario, 3000, true, false, false, false)
    
    if Config.Debug.enabled then
        print('^2[' .. Config.Product.shortName .. ']^7 Greeting')
    end
end)

RegisterNetEvent('lxr-radialmenu:client:interaction:antagonize', function()
    local ped = PlayerPedId()
    local scenario = GetHashKey(Config.Animations.scenarios.antagonize)
    
    if Config.Debug.enabled then
        print('^2[' .. Config.Product.shortName .. ']^7 Antagonizing')
    end
end)

RegisterNetEvent('lxr-radialmenu:client:interaction:lasso', function()
    if Config.Interactions.enableLassoSystem then
        if Config.Debug.enabled then
            print('^2[' .. Config.Product.shortName .. ']^7 Using lasso')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:interaction:carry', function()
    if Config.Interactions.enableCarrySystem then
        if Config.Debug.enabled then
            print('^2[' .. Config.Product.shortName .. ']^7 Carrying person')
        end
        -- Implement carry logic
    end
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- INVENTORY/SATCHEL
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RegisterNetEvent('lxr-radialmenu:client:inventory:open', function()
    if Config.Debug.enabled then
        print('^2[' .. Config.Product.shortName .. ']^7 Opening satchel')
    end
    
    -- Trigger inventory system based on framework
    local inventoryCommand = Config.Inventory.commands[currentFramework:lower()] or Config.Inventory.commands.standalone
    
    if Config.Inventory.system == 'auto' then
        if currentFramework == 'vorp' then
            ExecuteCommand(Config.Inventory.commands.vorp)
        elseif currentFramework == 'rsg' then
            TriggerEvent(Config.Inventory.events.rsg)
        elseif currentFramework == 'lxrcore' then
            TriggerEvent(Config.Inventory.events.lxr)
        else
            ExecuteCommand(inventoryCommand)
        end
    else
        ExecuteCommand(inventoryCommand)
    end
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- EMOTES (Western Era)
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RegisterNetEvent('lxr-radialmenu:client:emote:smoke', function()
    local ped = PlayerPedId()
    local scenario = GetHashKey(Config.Animations.scenarios.smoke)
    TaskStartScenarioInPlace(ped, scenario, -1, true, false, false, false)
end)

RegisterNetEvent('lxr-radialmenu:client:emote:drink', function()
    local ped = PlayerPedId()
    local scenario = GetHashKey(Config.Animations.scenarios.drink)
    TaskStartScenarioInPlace(ped, scenario, -1, true, false, false, false)
end)

RegisterNetEvent('lxr-radialmenu:client:emote:sit', function()
    local ped = PlayerPedId()
    local scenario = GetHashKey(Config.Animations.scenarios.sit)
    TaskStartScenarioInPlace(ped, scenario, -1, true, false, false, false)
end)

RegisterNetEvent('lxr-radialmenu:client:emote:lean', function()
    local ped = PlayerPedId()
    local scenario = GetHashKey(Config.Animations.scenarios.lean)
    TaskStartScenarioInPlace(ped, scenario, -1, true, false, false, false)
end)

RegisterNetEvent('lxr-radialmenu:client:emote:cancel', function()
    local ped = PlayerPedId()
    ClearPedTasks(ped)
end)

-- Open animations menu (RSG Animations or similar)
RegisterNetEvent('lxr-radialmenu:client:emote:menu', function()
    if Config.Animations.enabled and Config.Animations.rsgAnimations.enabled then
        if Config.Animations.rsgAnimations.useCommand then
            ExecuteCommand(Config.Animations.rsgAnimations.command)
        else
            TriggerEvent(Config.Animations.rsgAnimations.eventName)
        end
    end
end)

-- Walking style menu
RegisterNetEvent('lxr-radialmenu:client:emote:walkstyle', function()
    if Config.WalkingStyles.enabled then
        ExecuteCommand(Config.WalkingStyles.command)
    end
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- WEAPON ACTIONS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RegisterNetEvent('lxr-radialmenu:client:weapon:holster', function()
    local ped = PlayerPedId()
    
    if Config.Weapons.autoHolster then
        Wait(Config.Weapons.holsterDelay)
    end
    
    SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
    
    if Config.Debug.enabled then
        print('^2[' .. Config.Product.shortName .. ']^7 Holstered weapon')
    end
end)

RegisterNetEvent('lxr-radialmenu:client:weapon:clean', function()
    local ped = PlayerPedId()
    local scenario = GetHashKey(Config.Weapons.cleaningAnimation)
    TaskStartScenarioInPlace(ped, scenario, Config.Weapons.cleaningDuration, true, false, false, false)
    
    Wait(Config.Weapons.cleaningDuration)
    ClearPedTasks(ped)
    
    if Config.Debug.enabled then
        print('^2[' .. Config.Product.shortName .. ']^7 Cleaning weapon')
    end
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- EXPORTS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
exports('OpenRadialMenu', OpenRadialMenu)
exports('CloseRadialMenu', CloseRadialMenu)
exports('ToggleRadialMenu', ToggleRadialMenu)
exports('IsMenuOpen', function() return isMenuOpen end)
exports('GetFramework', function() return currentFramework end)
