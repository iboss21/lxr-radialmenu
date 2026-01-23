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

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- FRAMEWORK AUTO-DETECTION
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
local function DetectFramework()
    if Config.AutoDetectFramework then
        -- Try to detect VORP
        if GetResourceState('vorp_core') == 'started' then
            currentFramework = 'VORP'
            TriggerEvent('vorp:getCharacter', function(user)
                PlayerData = user
            end)
            return 'VORP'
        end
        
        -- Try to detect RSG
        if GetResourceState('rsg-core') == 'started' then
            currentFramework = 'RSG'
            return 'RSG'
        end
        
        -- Try to detect RedEM:RP
        if GetResourceState('redemrp') == 'started' or GetResourceState('redem_roleplay') == 'started' then
            currentFramework = 'RedEM'
            return 'RedEM'
        end
        
        -- Try to detect QBR (QBCore for RedM)
        if GetResourceState('qbr-core') == 'started' then
            currentFramework = 'QBR'
            return 'QBR'
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
    
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Started successfully')
        print('^2[' .. Config.Branding.name .. ']^7 Framework: ^3' .. detected .. '^7')
        print('^2[' .. Config.Branding.name .. ']^7 Version: ^3' .. Config.Branding.version .. '^7')
        print('^2[' .. Config.Branding.name .. ']^7 Author: ^3' .. Config.Branding.author .. '^7')
        print('^2[' .. Config.Branding.name .. ']^7 Website: ^3' .. Config.Branding.website .. '^7')
    end
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- MENU FUNCTIONS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
local function GetPlayerJob()
    -- Get player job based on framework
    if currentFramework == 'VORP' and PlayerData then
        return PlayerData.job or 'unemployed'
    elseif currentFramework == 'RSG' then
        -- RSG job detection
        return 'unemployed'  -- Implement RSG job detection
    elseif currentFramework == 'RedEM' then
        -- RedEM job detection
        return 'unemployed'  -- Implement RedEM job detection
    end
    
    return 'unemployed'
end

local function GetMenuItems()
    local menuItems = Config.MenuItems
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
            radius = Config.MenuRadius,
            iconSize = Config.IconSize,
            animationSpeed = Config.AnimationSpeed,
            theme = Config.Theme,
            framework = 'RedM',
            branding = Config.Branding.name,
            holdMode = Config.HoldMode,
            holdTime = Config.HoldTime,
            backgroundBlur = Config.BackgroundBlur,
            soundEffects = Config.SoundEffects
        }
    })
    
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Menu opened')
    end
end

local function CloseRadialMenu()
    if not isMenuOpen then return end
    
    isMenuOpen = false
    SetNuiFocus(false, false)
    
    SendNUIMessage({
        action = 'closeMenu'
    })
    
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Menu closed')
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
if Config.UseKeyMapping then
    RegisterKeyMapping('radialmenu', 'Open Radial Menu', 'keyboard', Config.OpenKey)
end

RegisterCommand('radialmenu', function()
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
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Item selected: ^3' .. data.action .. '^7')
    end
    
    CloseRadialMenu()
    
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
    ExecuteCommand('horse') -- Most frameworks have a horse command
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Whistling for horse')
    end
end)

RegisterNetEvent('lxr-radialmenu:client:horse:flee', function()
    local ped = PlayerPedId()
    local horse = GetMount(ped)
    
    if horse and horse ~= 0 then
        SetPedFleeAttributes(horse, 0, 0)
        TaskAnimalFlee(horse, ped, -1)
        
        if Config.Debug then
            print('^2[' .. Config.Branding.name .. ']^7 Horse sent away')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:horse:brush', function()
    local ped = PlayerPedId()
    local horse = GetMount(ped)
    
    if horse and horse ~= 0 then
        -- Play brushing animation
        TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_HORSE_BRUSH'), -1, true, false, false, false)
        
        Wait(5000)
        ClearPedTasks(ped)
        
        if Config.Debug then
            print('^2[' .. Config.Branding.name .. ']^7 Brushing horse')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:horse:feed', function()
    local ped = PlayerPedId()
    local horse = GetMount(ped)
    
    if horse and horse ~= 0 then
        -- Feed horse logic
        if Config.Debug then
            print('^2[' .. Config.Branding.name .. ']^7 Feeding horse')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:horse:calm', function()
    local ped = PlayerPedId()
    local horse = GetMount(ped)
    
    if horse and horse ~= 0 then
        -- Calm horse
        TaskAnimalCalm(horse, -1)
        
        if Config.Debug then
            print('^2[' .. Config.Branding.name .. ']^7 Calming horse')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:horse:cargo', function()
    -- Open horse cargo/saddlebags
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Opening horse cargo')
    end
    -- Trigger inventory system
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
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Opening wagon cargo')
    end
    -- Trigger inventory/trunk system
end)

RegisterNetEvent('lxr-radialmenu:client:wagon:flip', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle == 0 then
        vehicle = GetClosestVehicle(GetEntityCoords(ped), 5.0, 0, 70)
    end
    
    if vehicle ~= 0 then
        SetVehicleOnGroundProperly(vehicle)
        if Config.Debug then
            print('^2[' .. Config.Branding.name .. ']^7 Flipped wagon')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:wagon:lantern', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle ~= 0 then
        -- Toggle wagon lanterns/lights
        local lightsOn = GetVehicleLightsState(vehicle)
        SetVehicleLights(vehicle, lightsOn == 1 and 0 or 1)
        
        if Config.Debug then
            print('^2[' .. Config.Branding.name .. ']^7 Toggled wagon lantern')
        end
    end
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- CAMP ACTIONS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RegisterNetEvent('lxr-radialmenu:client:camp:pitch', function()
    local ped = PlayerPedId()
    -- Pitch camp animation and logic
    TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), -1, true, false, false, false)
    
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Pitching camp')
    end
    
    Wait(3000)
    ClearPedTasks(ped)
end)

RegisterNetEvent('lxr-radialmenu:client:camp:cook', function()
    local ped = PlayerPedId()
    -- Cooking at camp
    TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_COOK_MEAT'), -1, true, false, false, false)
    
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Cooking at camp')
    end
end)

RegisterNetEvent('lxr-radialmenu:client:camp:rest', function()
    local ped = PlayerPedId()
    -- Resting at camp
    TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_SIT_GROUND'), -1, true, false, false, false)
    
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Resting at camp')
    end
end)

RegisterNetEvent('lxr-radialmenu:client:camp:craft', function()
    -- Open crafting menu
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Opening crafting')
    end
end)

RegisterNetEvent('lxr-radialmenu:client:camp:pack', function()
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), -1, true, false, false, false)
    
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Packing up camp')
    end
    
    Wait(3000)
    ClearPedTasks(ped)
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- MURPHY'S CLOTHING INTEGRATION (1899 Wardrobe System)
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

-- Check if Murphy's Clothing is available
local function IsMurphyClothingAvailable()
    if not Config.Clothing or not Config.Clothing.Enabled then
        return false
    end
    
    local resourceState = GetResourceState(Config.Clothing.ResourceName)
    return resourceState == 'started' or resourceState == 'starting'
end

-- Open full Murphy's Clothing menu
RegisterNetEvent('lxr-radialmenu:client:clothing:open', function()
    if not IsMurphyClothingAvailable() then
        if Config.Debug then
            print('^3[' .. Config.Branding.name .. ']^7 Murphy\'s Clothing not available')
        end
        return
    end
    
    if Config.Clothing.UseCommand then
        -- Use command to open (default method)
        ExecuteCommand(Config.Clothing.Command)
    else
        -- Use event to open (alternative method)
        TriggerEvent(Config.Clothing.EventName)
    end
    
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Opening Murphy\'s Clothing wardrobe')
    end
end)

-- Quick access to specific clothing categories
RegisterNetEvent('lxr-radialmenu:client:clothing:hat', function()
    if IsMurphyClothingAvailable() then
        -- Open full wardrobe - Murphy's Clothing handles category selection
        ExecuteCommand(Config.Clothing.Command)
        if Config.Debug then
            print('^2[' .. Config.Branding.name .. ']^7 Opening hat category')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:clothing:coat', function()
    if IsMurphyClothingAvailable() then
        ExecuteCommand(Config.Clothing.Command)
        if Config.Debug then
            print('^2[' .. Config.Branding.name .. ']^7 Opening coat category')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:clothing:vest', function()
    if IsMurphyClothingAvailable() then
        ExecuteCommand(Config.Clothing.Command)
        if Config.Debug then
            print('^2[' .. Config.Branding.name .. ']^7 Opening vest category')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:clothing:bandana', function()
    if IsMurphyClothingAvailable() then
        ExecuteCommand(Config.Clothing.Command)
        if Config.Debug then
            print('^2[' .. Config.Branding.name .. ']^7 Opening bandana/mask category')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:clothing:gloves', function()
    if IsMurphyClothingAvailable() then
        ExecuteCommand(Config.Clothing.Command)
        if Config.Debug then
            print('^2[' .. Config.Branding.name .. ']^7 Opening gloves category')
        end
    end
end)

RegisterNetEvent('lxr-radialmenu:client:clothing:boots', function()
    if IsMurphyClothingAvailable() then
        ExecuteCommand(Config.Clothing.Command)
        if Config.Debug then
            print('^2[' .. Config.Branding.name .. ']^7 Opening boots category')
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
        ExecuteCommand(Config.Clothing.Command)
        return
    end
    
    -- Legacy fallback code for basic clothing toggle
    local ped = PlayerPedId()
    if Config.Debug then
        print('^3[' .. Config.Branding.name .. ']^7 Legacy clothing toggle: ' .. component)
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
    TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_GREET'), 3000, true, false, false, false)
    
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Greeting')
    end
end)

RegisterNetEvent('lxr-radialmenu:client:interaction:antagonize', function()
    local ped = PlayerPedId()
    -- Antagonize animation
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Antagonizing')
    end
end)

RegisterNetEvent('lxr-radialmenu:client:interaction:lasso', function()
    -- Lasso player logic
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Using lasso')
    end
end)

RegisterNetEvent('lxr-radialmenu:client:interaction:carry', function()
    -- Carry/kidnapping system
    if Config.EnableCarrySystem then
        if Config.Debug then
            print('^2[' .. Config.Branding.name .. ']^7 Carrying person')
        end
        -- Implement carry logic
    end
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- INVENTORY/SATCHEL
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RegisterNetEvent('lxr-radialmenu:client:inventory:open', function()
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Opening satchel')
    end
    -- Trigger inventory system based on framework
    if currentFramework == 'VORP' then
        ExecuteCommand('satchel')
    elseif currentFramework == 'RSG' then
        TriggerEvent('rsg-inventory:client:openinventory')
    else
        ExecuteCommand('inventory')
    end
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- EMOTES (Western Era)
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RegisterNetEvent('lxr-radialmenu:client:emote:smoke', function()
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_SMOKE'), -1, true, false, false, false)
end)

RegisterNetEvent('lxr-radialmenu:client:emote:drink', function()
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_DRINK'), -1, true, false, false, false)
end)

RegisterNetEvent('lxr-radialmenu:client:emote:sit', function()
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_SIT_GROUND'), -1, true, false, false, false)
end)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- WEAPON ACTIONS
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RegisterNetEvent('lxr-radialmenu:client:weapon:holster', function()
    local ped = PlayerPedId()
    SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
    
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Holstered weapon')
    end
end)

RegisterNetEvent('lxr-radialmenu:client:weapon:clean', function()
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_CLEAN_WEAPON'), -1, true, false, false, false)
    
    if Config.Debug then
        print('^2[' .. Config.Branding.name .. ']^7 Cleaning weapon')
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
