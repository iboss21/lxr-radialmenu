--[[
    🐺 LXR Radial Menu v2.0 - Client
    Modern, modular, and performant
    
    © 2026 iBoss | www.wolves.land
]]

-- Load shared modules
local Constants = require 'shared.constants'
local Utils = require 'shared.utils'

-- Load client modules
local FrameworkBridge = require 'client.modules.framework'

-- ═══════════════════════════════════════════════════════════════
-- STATE MANAGEMENT
-- ═══════════════════════════════════════════════════════════════

local MenuState = {
    isOpen = false,
    currentMenu = 'main',
    menuHistory = {},
    lastOpened = 0,
    cooldown = 500, -- ms
}

local PlayerCache = {
    job = nil,
    permissions = {},
    settings = {}
}

-- ═══════════════════════════════════════════════════════════════
-- INITIALIZATION
-- ═══════════════════════════════════════════════════════════════

CreateThread(function()
    Wait(1000)
    
    -- Initialize framework bridge
    FrameworkBridge:Initialize()
    
    -- Load player settings
    TriggerServerEvent(Constants.EVENTS.SERVER.SYNC_SETTINGS)
    
    -- Log startup
    Utils.Log('v' .. Constants.VERSION .. ' initialized successfully', 'success')
    Utils.Log('Framework: ' .. (FrameworkBridge.Name or 'Unknown'), 'info')
    
    if Config.Debug then
        Utils.Log('Debug mode enabled', 'warn')
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- MENU FUNCTIONS
-- ═══════════════════════════════════════════════════════════════

--- Open the radial menu
local function OpenMenu()
    -- Check cooldown
    local currentTime = GetGameTimer()
    if currentTime - MenuState.lastOpened < MenuState.cooldown then
        return
    end
    
    if MenuState.isOpen then
        return
    end
    
    MenuState.isOpen = true
    MenuState.lastOpened = currentTime
    
    -- Update player job
    PlayerCache.job = FrameworkBridge:GetPlayerJob()
    
    -- Build menu items
    local menuItems = BuildMenuItems()
    
    -- Get current theme
    local currentTheme = Config.Theme.themes[Config.Theme.current]
    
    -- Send to NUI
    SendNUIMessage({
        action = 'openMenu',
        items = menuItems,
        theme = currentTheme,
        config = {
            radius = Config.Menu.radius,
            iconSize = Config.Menu.iconSize,
            animationSpeed = Config.Menu.animationSpeed,
            backgroundBlur = Config.Menu.backgroundBlur,
            closeOnSelect = Config.Menu.closeOnSelect,
            framework = FrameworkBridge.Name
        }
    })
    
    -- Set NUI focus
    SetNuiFocus(true, true)
    
    -- Trigger event
    TriggerEvent(Constants.EVENTS.CLIENT.OPEN_MENU)
    
    -- Log action
    if Config.Debug then
        Utils.Log('Menu opened with ' .. #menuItems .. ' items', 'info')
    end
end

--- Close the radial menu
local function CloseMenu()
    if not MenuState.isOpen then
        return
    end
    
    MenuState.isOpen = false
    MenuState.currentMenu = 'main'
    MenuState.menuHistory = {}
    
    -- Send to NUI
    SendNUIMessage({
        action = 'closeMenu'
    })
    
    -- Remove NUI focus
    SetNuiFocus(false, false)
    
    -- Trigger event
    TriggerEvent(Constants.EVENTS.CLIENT.CLOSE_MENU)
end

--- Build menu items based on player context
---@return table Menu items
local function BuildMenuItems()
    local items = {}
    
    -- Add main menu items
    for _, item in ipairs(Config.MenuItems) do
        if item.enabled then
            -- Check permissions if specified
            if not item.permission or HasPermission(item.permission) then
                table.insert(items, item)
            end
        end
    end
    
    -- Add job-specific items
    if PlayerCache.job and Config.JobMenus[PlayerCache.job] then
        for _, jobItem in ipairs(Config.JobMenus[PlayerCache.job]) do
            table.insert(items, jobItem)
        end
    end
    
    return items
end

--- Check if player has permission
---@param permission string Permission name
---@return boolean Has permission
local function HasPermission(permission)
    return FrameworkBridge:HasPermission(permission)
end

-- ═══════════════════════════════════════════════════════════════
-- NUI CALLBACKS
-- ═══════════════════════════════════════════════════════════════

--- Handle menu closed from NUI
RegisterNUICallback('menuClosed', function(data, cb)
    CloseMenu()
    cb('ok')
end)

--- Handle menu action
RegisterNUICallback('menuAction', function(data, cb)
    local action = data.action
    local itemId = data.itemId
    
    if Config.Debug then
        Utils.Log('Action triggered: ' .. action, 'info')
    end
    
    -- Trigger local action handler
    TriggerEvent(Constants.EVENTS.CLIENT.TRIGGER_ACTION, action, itemId)
    
    -- Log to server
    TriggerServerEvent(Constants.EVENTS.SERVER.LOG_ACTION, action, itemId)
    
    -- Handle built-in actions
    HandleAction(action, itemId)
    
    cb('ok')
end)

--- Handle submenu request
RegisterNUICallback('requestSubmenu', function(data, cb)
    local submenuId = data.submenuId
    
    if Config.Submenus[submenuId] then
        SendNUIMessage({
            action = 'updateItems',
            items = Config.Submenus[submenuId]
        })
    end
    
    cb('ok')
end)

--- Handle sound play request
RegisterNUICallback('playSound', function(data, cb)
    if Config.Sounds.enabled then
        local sound = data.sound
        -- Trigger sound effect (implement based on your sound system)
        PlaySoundFrontend(-1, 'HIGHLIGHT_NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
    end
    cb('ok')
end)

--- Handle settings save
RegisterNUICallback('saveSettings', function(data, cb)
    PlayerCache.settings = data
    TriggerServerEvent(Constants.EVENTS.SERVER.SYNC_SETTINGS, data)
    cb('ok')
end)

--- Handle theme request
RegisterNUICallback('requestTheme', function(data, cb)
    local themeName = data.theme
    
    if Config.Theme.themes[themeName] then
        SendNUIMessage({
            action = 'applyTheme',
            theme = Config.Theme.themes[themeName]
        })
    end
    
    cb('ok')
end)

-- ═══════════════════════════════════════════════════════════════
-- ACTION HANDLERS
-- ═══════════════════════════════════════════════════════════════

--- Handle built-in actions
---@param action string Action name
---@param itemId string Item identifier
local function HandleAction(action, itemId)
    local playerPed = PlayerPedId()
    
    -- Inventory
    if action == 'openInventory' then
        TriggerEvent('inventory:client:open')
        
    -- Horse actions
    elseif action == 'whistleHorse' then
        ExecuteCommand('whistlehorse')
        FrameworkBridge:Notify('Horse whistled', 'success')
        
    elseif action == 'feedHorse' then
        local horse = GetMount(playerPed)
        if horse and horse ~= 0 then
            TaskAnimalFlee(horse, playerPed, -1)
            FrameworkBridge:Notify('Horse fed', 'success')
        else
            FrameworkBridge:Notify('No horse nearby', 'error')
        end
        
    elseif action == 'brushHorse' then
        local horse = GetMount(playerPed)
        if horse and horse ~= 0 then
            -- Brush animation
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_BRUSH_HORSE'), -1, true, false, false, false)
            Wait(5000)
            ClearPedTasks(playerPed)
            FrameworkBridge:Notify('Horse brushed', 'success')
        else
            FrameworkBridge:Notify('No horse nearby', 'error')
        end
        
    elseif action == 'openHorseCargo' then
        TriggerEvent('horse:cargo:open')
        
    -- Weapon actions
    elseif action == 'holsterWeapon' then
        SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
        FrameworkBridge:Notify('Weapon holstered', 'success')
        
    elseif action == 'cleanWeapon' then
        -- Clean weapon logic
        FrameworkBridge:Notify('Weapon cleaned', 'success')
        
    -- Clothing
    elseif action == 'openClothing' then
        if Config.Clothing and Config.Clothing.enabled then
            TriggerEvent('clothing:client:open')
        end
        
    -- Settings
    elseif action == 'openSettings' then
        SendNUIMessage({
            action = 'openSettings'
        })
        
    -- Emotes
    elseif action:find('emote_') then
        local emoteName = action:gsub('emote_', '')
        ExecuteCommand('e ' .. emoteName)
        
    -- Player interactions
    elseif action == 'robPlayer' then
        -- Rob player logic (requires target)
        TriggerEvent('police:client:RobPlayer')
        
    elseif action == 'carryPlayer' then
        TriggerEvent('carry:client:ToggleCarry')
        
    elseif action == 'searchPlayer' then
        TriggerEvent('police:client:SearchPlayer')
        
    -- Job actions
    elseif action == 'handcuffPlayer' then
        TriggerServerEvent('police:server:CuffPlayer')
        
    elseif action == 'escortPlayer' then
        TriggerEvent('police:client:EscortPlayer')
        
    elseif action == 'jailPlayer' then
        TriggerEvent('police:client:JailPlayer')
        
    elseif action == 'revivePlayer' then
        TriggerServerEvent('hospital:server:RevivePlayer')
        
    elseif action == 'bandagePlayer' then
        TriggerEvent('hospital:client:BandagePlayer')
        
    elseif action == 'diagnosePlayer' then
        TriggerEvent('hospital:client:DiagnosePlayer')
    end
end

-- ═══════════════════════════════════════════════════════════════
-- KEY BINDINGS
-- ═══════════════════════════════════════════════════════════════

-- Key mapping table
local KeyMap = {
    ['F1'] = 288,
    ['F2'] = 289,
    ['F3'] = 170,
    ['F4'] = 166,
    ['F5'] = 167,
    ['F6'] = 168,
    ['F7'] = 169,
    ['F8'] = 56,
    ['F9'] = 57,
    ['F10'] = 243,
}

--- Get key code from config
---@return number Key code
local function GetOpenKeyCode()
    local key = Config.Menu.openKey
    
    -- If it's already a number, return it
    if type(key) == 'number' then
        return key
    end
    
    -- Look up in key map
    return KeyMap[key] or 288  -- Default to F1
end

--- Key mapping handler
CreateThread(function()
    local openKeyCode = GetOpenKeyCode()
    
    while true do
        Wait(0)
        
        -- Check if menu key is pressed
        if IsControlJustPressed(0, openKeyCode) then
            if MenuState.isOpen then
                CloseMenu()
            else
                OpenMenu()
            end
        end
        
        -- ESC to close
        if MenuState.isOpen and IsControlJustPressed(0, 322) then -- ESC
            CloseMenu()
        end
        
        -- Disable controls when menu is open
        if MenuState.isOpen then
            DisableAllControlActions(0)
            EnableControlAction(0, 1, true) -- Look Left/Right
            EnableControlAction(0, 2, true) -- Look Up/Down
        else
            Wait(500) -- Sleep when menu is closed
        end
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- EVENTS
-- ═══════════════════════════════════════════════════════════════

--- Handle settings sync from server
RegisterNetEvent(Constants.EVENTS.SERVER.SYNC_SETTINGS)
AddEventHandler(Constants.EVENTS.SERVER.SYNC_SETTINGS, function(settings)
    if settings then
        PlayerCache.settings = settings
        
        if Config.Debug then
            Utils.Log('Settings synced from server', 'success')
        end
    end
end)

--- Manual open menu event
RegisterNetEvent(Constants.EVENTS.CLIENT.OPEN_MENU)
AddEventHandler(Constants.EVENTS.CLIENT.OPEN_MENU, function()
    OpenMenu()
end)

--- Manual close menu event
RegisterNetEvent(Constants.EVENTS.CLIENT.CLOSE_MENU)
AddEventHandler(Constants.EVENTS.CLIENT.CLOSE_MENU, function()
    CloseMenu()
end)

--- Refresh menu event
RegisterNetEvent(Constants.EVENTS.CLIENT.REFRESH_MENU)
AddEventHandler(Constants.EVENTS.CLIENT.REFRESH_MENU, function()
    if MenuState.isOpen then
        CloseMenu()
        Wait(100)
        OpenMenu()
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- EXPORTS
-- ═══════════════════════════════════════════════════════════════

--- Export: Open menu
---@return nil
exports('OpenMenu', function()
    OpenMenu()
end)

--- Export: Close menu
---@return nil
exports('CloseMenu', function()
    CloseMenu()
end)

--- Export: Check if menu is open
---@return boolean Is open
exports('IsMenuOpen', function()
    return MenuState.isOpen
end)

--- Export: Get current framework
---@return string Framework name
exports('GetFramework', function()
    return FrameworkBridge.Name
end)

--- Export: Add custom menu item (from other resources)
---@param item table Item configuration
---@return boolean Success
exports('AddMenuItem', function(item)
    if not item or not item.id then
        return false
    end
    
    table.insert(Config.MenuItems, item)
    
    if Config.Debug then
        Utils.Log('Custom menu item added: ' .. item.id, 'success')
    end
    
    return true
end)

-- ═══════════════════════════════════════════════════════════════
-- CLEANUP
-- ═══════════════════════════════════════════════════════════════

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end
    
    -- Close menu if open
    if MenuState.isOpen then
        CloseMenu()
    end
    
    Utils.Log('Resource stopped', 'warn')
end)
